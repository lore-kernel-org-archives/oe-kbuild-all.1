Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8651194A54
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 10:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731927143; cv=none; b=PTHSB5p4vXcvXqO10FL/gbBOUto845y1gupsCknNAoQY0TGgERZsTct9aDuML3InqnY08/tGJjXI3VRliPLYZ2bJXKyd83NAMjRjgcbjniiU4wkis6Zv3oLPXK2czWlSFhHJ6PCDwin+09C5hmo0lkWpGVF3fQ/qwfg2hL4xr6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731927143; c=relaxed/simple;
	bh=c7SFX0buaEbph/NaIGm14HoVVU2oZnGZoDLPVH3U15w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LiF7qUNepU6wbscA7Pe9JO+MzwQo4TbBOZjcu81FS8TvwovnDg9GjmoH7esZREl1YJ04pAkHjFbsjSH9o5+auuLlwKWGj0gWKwY85kimsjH+Me5+PNcvWaiETiSXScsqPZPI0vDDlFhJY1JdBqfI/ehEOVpk34YWsyOYO6F5+UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/irAjyv; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/irAjyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731927141; x=1763463141;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c7SFX0buaEbph/NaIGm14HoVVU2oZnGZoDLPVH3U15w=;
  b=M/irAjyvINGUARdISWSzi1tQxapobswz7AlKNLwL1IgZ7JaYNjGDJUeV
   KpkTz+2VzqaSa9sRXG0YSJo19stdGOTqdeSveP0FMX6FDNU2iUsnxE3QS
   3awioUkXezuFP2iw5fBrWFAH3m1fhrQhzVTdGTzPLp4rCIHPfmmeu72z2
   32vID9m2VSfakgqoKw/NTQiFaSPM73Xaq7uhsUOEr2vNP53oV3yiS195P
   2gU50qk5CRzOTzEFxTMMjpgQ1/bN1U3l6Gk9ULaZCne4wlvtmBlBv462Q
   P+fAv+VdXftTIyuosyI3bf/CnlL5DQmKX8WV1WzMDa5SJPtxyxyGzxWLH
   g==;
X-CSE-ConnectionGUID: 6/59l0KGTN2l0okPVlixGw==
X-CSE-MsgGUID: Nw7UBYvLTU2qfvijDmGSLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31282954"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31282954"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 02:52:21 -0800
X-CSE-ConnectionGUID: N4RXVIJBQVGf9yd0Jsrhdw==
X-CSE-MsgGUID: 2/zfTo2AQuGqCLKPQFzyvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="93647303"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Nov 2024 02:52:20 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCzMf-0002OR-1m;
	Mon, 18 Nov 2024 10:52:17 +0000
Date: Mon, 18 Nov 2024 18:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 85/119]
 sound/soc/apple/macaudio.c:1449:30: sparse: sparse: symbol
 'macaudio_j180_cfg' was not declared. Should it be static?
Message-ID: <202411181839.QIylkuBf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   a89c7c8788b938f7b52c6ca56449de45e92a056e
commit: 9301654cfa35cb50bd6ee1f23eab44b5958b1857 [85/119] macaudio: Rework platform config & add all remaining platforms
config: sparc64-randconfig-r122-20241118 (https://download.01.org/0day-ci/archive/20241118/202411181839.QIylkuBf-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241118/202411181839.QIylkuBf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181839.QIylkuBf-lkp@intel.com/

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
