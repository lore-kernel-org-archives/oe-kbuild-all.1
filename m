Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4067F43179
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 07:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732950894; cv=none; b=KBl09FKhrCR1PE6brWKqHm6V1HDFfXC1LA3uk9tR3GG+/F+e5bQq8vmX8z4Lj46S1h5aTRZqOujR5NDXCHUhD/MW7T/mjhPXJX1rB+MSwvtprvsRE9BCxweDY9BQ7S7nOZskxY5S949AM5ItqCSwrZljqXgfzdVqFFbecmz9FLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732950894; c=relaxed/simple;
	bh=Ey/R4SCZ5HUX6y7e6r+DxID2PNkF0MAPABJ3Kn/bInE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fjuRmi+AbLvgr7tvahydB1e2rfh8OFYsAePPN0KtedwElu/t9kiiIiEpDpa4LmWSGjFWo32VnWLJcY7mxkn+88F6LH48ZGGFOZ1d2dNht34f6o/bVJWCJEIMa/1PkW5S+AuU3YoFa/LR/aETfdX55/APIYePCO+PTxLp6/9bJAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwboU1eE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwboU1eE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732950892; x=1764486892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ey/R4SCZ5HUX6y7e6r+DxID2PNkF0MAPABJ3Kn/bInE=;
  b=jwboU1eE4tx6WEBj5ukkhM+hj+hmogNooIzj+49EXtjZSetDHiI+QjD+
   oaycCZv75HwXOIFrDV/GKV/6BwVI4ZNxE4GxYKDkW9lO7Ubzt89FY9NvF
   1K7kpELBYUkGLUmsDKH02Ry7z/sQJotr35gbKedCk+yHIZtA2AUgPksAg
   GFfV0UYuIxKjCh2kZkg/kIftATZ7j13viCNeXtGLlBQdj+LBCBQ++ODqW
   PgR8MTRbEMP5o0gtGcchUDvm31RzUxQ9Qc2KZ3qEueQ86/nhIgl3t4z40
   2VDHo4AIEkXKdrEKgQyrHXMnzqkdjm6kwr21U+hlb/KDKqpau+fu0eWe/
   g==;
X-CSE-ConnectionGUID: 2pCZOHgKRQS+D7OPAnHw1A==
X-CSE-MsgGUID: 6U6zF5GJRsWFx1WAzTojHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="32530376"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="32530376"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 23:14:44 -0800
X-CSE-ConnectionGUID: oX3rFlQPQGaey15wlR1Vhg==
X-CSE-MsgGUID: 1mRvpafZTnOQ68ZWdyEaBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="92515079"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Nov 2024 23:14:43 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHHge-0000AR-2t;
	Sat, 30 Nov 2024 07:14:40 +0000
Date: Sat, 30 Nov 2024 15:14:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 85/119]
 sound/soc/apple/macaudio.c:1449:30: sparse: sparse: symbol
 'macaudio_j180_cfg' was not declared. Should it be static?
Message-ID: <202411301545.yc4QeWNK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   070347d4a0876921be5b0bbc11fff848c2ed3e59
commit: 9301654cfa35cb50bd6ee1f23eab44b5958b1857 [85/119] macaudio: Rework platform config & add all remaining platforms
config: sparc64-randconfig-r122-20241118 (https://download.01.org/0day-ci/archive/20241130/202411301545.yc4QeWNK-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241130/202411301545.yc4QeWNK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301545.yc4QeWNK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/apple/macaudio.c:1249:1: sparse: sparse: symbol 'macaudio_spk_mux_enum' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1259:1: sparse: sparse: symbol 'macaudio_hp_mux_enum' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1449:30: sparse: sparse: symbol 'macaudio_j180_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1452:30: sparse: sparse: symbol 'macaudio_j274_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1456:30: sparse: sparse: symbol 'macaudio_j293_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1460:30: sparse: sparse: symbol 'macaudio_j313_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1464:30: sparse: sparse: symbol 'macaudio_j314_j316_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1468:30: sparse: sparse: symbol 'macaudio_j37x_j47x_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1472:30: sparse: sparse: symbol 'macaudio_j413_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1476:30: sparse: sparse: symbol 'macaudio_j415_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1480:30: sparse: sparse: symbol 'macaudio_j45x_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1484:30: sparse: sparse: symbol 'macaudio_j493_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1488:30: sparse: sparse: symbol 'macaudio_fallback_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:235:46: sparse: sparse: self-comparison always evaluates to false

vim +/macaudio_j180_cfg +1449 sound/soc/apple/macaudio.c

  1447	
  1448	/*	enable	amp		speakers	stereo	gain	safe_vol */
> 1449	struct macaudio_platform_cfg macaudio_j180_cfg = {
  1450		false,	AMP_SN012776,	SPKR_1W1T,	false,	4,	-20,
  1451	};
  1452	struct macaudio_platform_cfg macaudio_j274_cfg = {
  1453		true,	AMP_TAS5770,	SPKR_1W,	false,	14,	0, /* TODO: safety */
  1454	};
  1455	
> 1456	struct macaudio_platform_cfg macaudio_j293_cfg = {
  1457		false,	AMP_TAS5770,	SPKR_2W,	true,	9,	-20, /* TODO: check */
  1458	};
  1459	
  1460	struct macaudio_platform_cfg macaudio_j313_cfg = {
  1461		false,	AMP_TAS5770,	SPKR_1W,	true,	4,	-20, /* TODO: check */
  1462	};
  1463	
  1464	struct macaudio_platform_cfg macaudio_j314_j316_cfg = {
  1465		false,	AMP_SN012776,	SPKR_2W1T,	true,	9,	-20,
  1466	};
  1467	
> 1468	struct macaudio_platform_cfg macaudio_j37x_j47x_cfg = {
  1469		false,	AMP_SN012776,	SPKR_1W,	false,	14,	-20,
  1470	};
  1471	
  1472	struct macaudio_platform_cfg macaudio_j413_cfg = {
  1473		false,	AMP_SN012776,	SPKR_1W1T,	true,	9,	-20,
  1474	};
  1475	
  1476	struct macaudio_platform_cfg macaudio_j415_cfg = {
  1477		false,	AMP_SN012776,	SPKR_2W1T,	true,	9,	-20,
  1478	};
  1479	
> 1480	struct macaudio_platform_cfg macaudio_j45x_cfg = {
  1481		false,	AMP_SSM3515,	SPKR_1W1T,	true,	9,	-20, /* TODO: gain?? */
  1482	};
  1483	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
