Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B6F3B42FA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 06:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781679474; cv=none; b=jBy3Q9flqSP/Dfk1tiD4yF45YOhyO2Pta4jFsD1TQtSlkLX92m7Fqp2pw91ulsDTYc1mIqpKSsez/lukVIWx4SfbwSHUhpsOMhdAYLD7pkT/haDQZJiBhBJ4F6+PVFPbKRTaXQns5BpyI2Y2NoZTcT/nefoOtDsBycNTuViby1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781679474; c=relaxed/simple;
	bh=8r05HtVnmMqvIvQBC7hKU1D9QaAj72Zs8jSiFsnHsXU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=WkTjgeLzcohZb8jZMC3x2C0x1XkpQBdTkHDP9rbwZqL0+n1EQjDouD6wi0c+QRQ0HNE5xnV/4gvaQEM55QTUkZyvr7gEr3fmbC2AZKfBADvkwIhwd9aa2sv3I1v2egD9PbILvbnPOjHLTyiHlhaAGcv7dal+WSfJAgrDHE3IjhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mdR32X+9; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mdR32X+9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 56D50C2BB3E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jun 2026 06:57:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76BCE601AA;
	Wed, 17 Jun 2026 06:57:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05413106CA1F8;
	Wed, 17 Jun 2026 08:57:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781679469; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w4RK4D8JpXt7WXc/3A7LwcDPg1tU/mb/H1NqQ97DkCg=;
	b=mdR32X+9LvJEc5kohx2bmirYj+26+w38eU4a5Q9nQzNSslaUa54eWgr1t1MpGexc5QT/c/
	2g8DG+VOT4Wt7v48WPj4pQ+3wAGD1C/++FahtXmjaADGqd+1iElnZpCUMSPwRg1BC+ZnNr
	kfLBdv07qHDd7gnnL/attnmvKWhcwkgU03YOsI7xMedlvZ3RzpJSAZtChSgjF124CQwJmE
	GDEE8rRGQC2WpmGtNLxgpeDyJ17AW+k7dapH2aS180cONKctqeJEWC+4sLJooXsFuaW9dv
	YCiYivkCoTGf2x/7naZBYHPH2t2Ai2jJWM2aKuFS/V1RHSCL3iCgl3/uwrnNEg==
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 08:57:45 +0200
Message-Id: <DJB4NR341PMS.WYR444583WB8@bootlin.com>
Cc: <oe-kbuild-all@lists.linux.dev>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "kernel test robot" <lkp@intel.com>
To: "Damon Ding" <damon.ding@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [linux-next:master 226/14321]
 drivers/gpu/drm/bridge/of-display-mode-bridge.c:54:25: sparse: sparse:
 symbol 'of_display_mode_bridge_funcs' was not declared. Should it be
 static?
X-Mailer: aerc 0.21.0
References: <202606170744.FUStcWaB-lkp@intel.com>
In-Reply-To: <202606170744.FUStcWaB-lkp@intel.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Damon,

On Wed Jun 17, 2026 at 1:46 AM CEST, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   4fa3f5fabb30bf00d7475d5a33459ea83d639bf9
> commit: ba2db93cf3d569a4525a02cd0ed5ec5f979e3afd [226/14321] drm/bridge: =
Move legacy bridge driver out of imx directory for multi-platform use
> config: sparc64-randconfig-r133-20260617 (https://download.01.org/0day-ci=
/archive/20260617/202606170744.FUStcWaB-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e=
19d1f51a2c80b63cd8ca95bcc757b7077112808)
> sparse: v0.6.5-rc1
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260617/202606170744.FUStcWaB-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606170744.FUStcWaB-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>>> drivers/gpu/drm/bridge/of-display-mode-bridge.c:54:25: sparse: sparse: =
symbol 'of_display_mode_bridge_funcs' was not declared. Should it be static=
?
>
> vim +/of_display_mode_bridge_funcs +54 drivers/gpu/drm/bridge/of-display-=
mode-bridge.c
>
>     53
>   > 54	struct drm_bridge_funcs of_display_mode_bridge_funcs =3D {
>     55		.attach =3D of_display_mode_bridge_attach,
>     56		.get_modes =3D of_display_mode_bridge_get_modes,
>     57	};
>     58

This had been reported already (Message-ID:
<202605141933.yeT5SiTT-lkp@intel.com>). Indeed this should be static const.

Do you plan to send a patch fixing it? Otherwise let me know and I can do
it.

Thanks,
Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
