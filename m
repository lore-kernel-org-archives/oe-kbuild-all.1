Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758CA14A86
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 15:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53140C433C7;
	Wed, 19 Jul 2023 15:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689781135;
	bh=cXcZ2cLfO/Lz/PU+gfJf6DVK1ZYQFYdTI3P8jG/AgEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z1ptxYDuvrpZrVAQLisByrwuh4WFNt2OQyAUkw7+6LKm0qfaOo+I3RsrhzQ9V9dCD
	 rpbqzXki6NQZ8/YrZYPpR/dBHykVmA6MDt7FsEyJ8TouQSV4gDzzd7yGHbx2AVBiIC
	 HrZWwX3+SMjMkVc2mp3NzintGGzlI8egOwGMSkc8=
Date: Wed, 19 Jul 2023 17:38:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [linux-stable-rc:linux-5.4.y 9090/9095]
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c:1159:17: error: label
 'err_cleanup_components' used but not defined
Message-ID: <2023071912-gloomy-riddance-3c47@gregkh>
References: <202307170454.7nYQFRx1-lkp@intel.com>
 <CANiDSCv4qLmnLbE2qmx_XcHBzDmGrzD_r6uiJo9AihPnLpoz-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCv4qLmnLbE2qmx_XcHBzDmGrzD_r6uiJo9AihPnLpoz-g@mail.gmail.com>

On Wed, Jul 19, 2023 at 05:00:13PM +0200, Ricardo Ribalda wrote:
> Hi Greg
> 
> What is preferred in this case? A follow-up patch? or a new patch?

Is there an upstream fix for this that should be applied instead?  Or is
this patch incorrect?

And please, properly quote things.

greg k-h
