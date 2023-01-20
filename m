Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFE429A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 15:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FE5C433D2;
	Fri, 20 Jan 2023 15:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674229421;
	bh=3s+a21jOuSUozVrGaavCBkqBzcDsMozFYa/XE/2Un+w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A+K4w7WaLrqkE8kedQFXC+9ojkJFgIrKoGED1GRXp7oI7fD74L0+Gmo6ZbpEPrEqs
	 Pzckdy11E6CO6NvmVUi1Ixjk5MfHhcvPJnrb+N+yTG1niQDbmPNQuGM/KqaPkXFOOJ
	 6t01oFLhNMQaLWGtvNCoQ6coeMn9pfxxPB2fq159E2A2K7T/qWY8GH3J4a8mPwi9wX
	 fOiddFO7PFsQAU02Rcu6ea0b+5VkUcyr6hDJQyef7g4qOZ0175hTH0Ie4g9jDK+w+Y
	 fl5SUE6EOA8qFgfgnNX+m6/1bbUYB9953uyC/rFQR4/OVZlICx7PHOMSUEh6Z/3CRT
	 INn/dMnHdO4Ww==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com, 
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com, 
 error27@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-mm@kvack.org, oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230120102125.30653-1-peter.ujfalusi@linux.intel.com>
References: <20230120102125.30653-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: sof-audio: prepare_widgets: Check swidget
 for NULL on sink failure
Message-Id: <167422941865.1350653.16158325897991167721.b4-ty@kernel.org>
Date: Fri, 20 Jan 2023 15:43:38 +0000
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-77e06

On Fri, 20 Jan 2023 12:21:25 +0200, Peter Ujfalusi wrote:
> If the swidget is NULL we skip the preparing of the widget and jump to
> handle the sink path of the widget.
> If the prepare fails in this case we would undo the prepare but the swidget
> is NULL (we skipped the prepare for the widget).
> 
> To avoid NULL pointer dereference in this case we must check swidget
> against NULL pointer once again.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-audio: prepare_widgets: Check swidget for NULL on sink failure
      commit: fb4293600cc651cfe4d48ec489f1d175adf6e2f8

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

