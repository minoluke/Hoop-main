// WebContent/script.js


document.addEventListener('DOMContentLoaded', function() {
    // 画像が表示されたら音声を再生
    const gameAudio = document.getElementById('game-audio');
    gameAudio.play().catch(error => {
        console.error("自動再生に失敗しました:", error);
        // 必要に応じて、ユーザーがタップまたはクリックしたときに再生する処理を追加
    });
});

