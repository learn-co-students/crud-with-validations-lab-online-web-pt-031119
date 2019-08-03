class SongsController < ApplicationController
    def index
        @songs = Song.all
        song_attributes
    end

    def new
        @song = Song.new
        song_attributes
    end

    def create
        @song = Song.new(song_params)
        if @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def show
        set_song
        song_attributes
    end

    def edit
        set_song
        song_attributes
    end

    def update
        set_song
        @song.update(song_params)
        if @song.valid?
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        set_song.destroy
        redirect_to songs_path
    end

    private
        def set_song
            @song = Song.find(params[:id])
        end

        def song_params
            params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
        end

        def song_attributes
            @attributes = %w(artist_name release_year genre)
        end
end