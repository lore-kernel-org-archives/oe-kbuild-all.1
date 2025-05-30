Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B42F13AC1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 10:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748602250; cv=none; b=tVsGVNMmBqHcDLxhX/uzu5SKoqEUBHs+jwd2IL+YngUAeD+T6O4lETxgKwBmjRQQke1zcNgWa+OVZFH+IEwoJHGzrBGDIUrAf9TC5u1L2938SbkCSMEyQZznl3xfgieNkrbnp84DPdc107yhcJ5NPvN2tgds0Rk6a5F9ZO2nHiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748602250; c=relaxed/simple;
	bh=ZGfvLhfxVEvJfloGVafNy2gOIMltSuDpK1fbQE271k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHq2Op6rXs35rfxWPT3QMVq+m/Vi/VUPYd4Ep63qLazgHUGnNkf86zECMWTMjDzs6jNh0BXK90/hCVgNCe3VPsGD9HesrFcjUcnMlP9ITB2PeeV8YNACanG3xoOh1EoXvlCNvpIMrs66sAcAljz53QLSXPO83Y6DMRwJL1OTrFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKxJu-0004RJ-Uv; Fri, 30 May 2025 12:50:38 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKxJu-000xgf-1D;
	Fri, 30 May 2025 12:50:38 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKxJu-000q1U-0s;
	Fri, 30 May 2025 12:50:38 +0200
Date: Fri, 30 May 2025 12:50:38 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 4/4] Input: Add TouchNetix aXiom I2C Touchscreen
 support
Message-ID: <20250530105038.mhrdbij7azpsh2cl@pengutronix.de>
References: <20250529-v6-10-topic-touchscreen-axiom-v2-4-a5edb105a600@pengutronix.de>
 <202505301320.Bx7BEpW2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202505301320.Bx7BEpW2-lkp@intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: oe-kbuild-all@lists.linux.dev

On 25-05-30, kernel test robot wrote:
> Hi Marco,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 38fec10eb60d687e30c8c6b5420d86e8149f7557]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Felsch/firmware_loader-expand-firmware-error-codes-with-skip-error/20250529-061458
> base:   38fec10eb60d687e30c8c6b5420d86e8149f7557
> patch link:    https://lore.kernel.org/r/20250529-v6-10-topic-touchscreen-axiom-v2-4-a5edb105a600%40pengutronix.de
> patch subject: [PATCH v2 4/4] Input: Add TouchNetix aXiom I2C Touchscreen support
> config: x86_64-randconfig-072-20250530 (https://download.01.org/0day-ci/archive/20250530/202505301320.Bx7BEpW2-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505301320.Bx7BEpW2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505301320.Bx7BEpW2-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: devm_drm_panel_add_follower
>    >>> referenced by touchnetix_axiom.c:2834 (drivers/input/touchscreen/touchnetix_axiom.c:2834)
>    >>>               drivers/input/touchscreen/touchnetix_axiom.o:(axiom_register_panel_follower) in archive vmlinux.a

Argh.. fixed in v3.

Regards,
  Marco
