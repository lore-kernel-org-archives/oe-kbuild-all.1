Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2367185A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 03:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+yo5265"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701918293; x=1733454293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=btGx1mN4mRDBfHKR7M7XlvEv3Lr1yjgljTWsUjnvY/4=;
  b=D+yo5265n07fotxSieJLClAliOKfKvmdVOeohzPO7++ViaFSck1BuG1l
   y6+3GLj5+LLGo0dSAsm2cG3cTpgwJuoJGwj4+2sm2riELkjJ/oJHO6l/7
   QfC/RnNuycb6r47uLRytMN0Yj7tol6B2kdXg9mvDcVmPI3uYJOOyrRvhb
   vCluxLHohKvK/LEfwbsj4ZQpgBOdMtfMt0aArnYXneMPlhPzqt32Wnjm2
   GjIiX33pj+9OKAUTRqHQZhqrPHVllZV3SdrJTb6CG2xWy9HOz3oeQDVww
   TZ0uToAhySX8Br4c+t27DxVxGQYFAFTcgNf1pBoOPqQAHprVxpSzp+f11
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="393897293"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="393897293"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 19:04:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="12949534"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 06 Dec 2023 19:04:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB4gz-000Bmw-0h;
	Thu, 07 Dec 2023 03:04:49 +0000
Date: Thu, 7 Dec 2023 11:04:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/070-audio 90/104]
 sound/soc/apple/macaudio.c:1449:30: sparse: sparse: symbol
 'macaudio_j180_cfg' was not declared. Should it be static?
Message-ID: <202312071104.D8Md9COf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   88e53b5c13659b0092bc49020fbc8ebbfc1abfa6
commit: 86d3141f31805679637bd118a2665d9ef79a40fd [90/104] macaudio: Rework platform config & add all remaining platforms
config: openrisc-randconfig-r132-20231207 (https://download.01.org/0day-ci/archive/20231207/202312071104.D8Md9COf-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312071104.D8Md9COf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312071104.D8Md9COf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/apple/macaudio.c:226:6: sparse: sparse: symbol 'macaudio_vlimit_unlock' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:266:6: sparse: sparse: symbol 'macaudio_vlimit_update' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1249:1: sparse: sparse: symbol 'macaudio_spk_mux_enum' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1259:1: sparse: sparse: symbol 'macaudio_hp_mux_enum' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1280:5: sparse: sparse: symbol 'macaudio_sss_info' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1290:5: sparse: sparse: symbol 'macaudio_sss_get' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1305:5: sparse: sparse: symbol 'macaudio_slk_info' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1315:5: sparse: sparse: symbol 'macaudio_slk_put' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1351:5: sparse: sparse: symbol 'macaudio_slk_get' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1361:5: sparse: sparse: symbol 'macaudio_slk_lock' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1383:6: sparse: sparse: symbol 'macaudio_slk_unlock' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1449:30: sparse: sparse: symbol 'macaudio_j180_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1452:30: sparse: sparse: symbol 'macaudio_j274_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1456:30: sparse: sparse: symbol 'macaudio_j293_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1460:30: sparse: sparse: symbol 'macaudio_j313_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1464:30: sparse: sparse: symbol 'macaudio_j314_j316_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1468:30: sparse: sparse: symbol 'macaudio_j37x_j47x_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1472:30: sparse: sparse: symbol 'macaudio_j413_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1476:30: sparse: sparse: symbol 'macaudio_j415_cfg' was not declared. Should it be static?
>> sound/soc/apple/macaudio.c:1480:30: sparse: sparse: symbol 'macaudio_j45x_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1484:30: sparse: sparse: symbol 'macaudio_j493_cfg' was not declared. Should it be static?
   sound/soc/apple/macaudio.c:1488:30: sparse: sparse: symbol 'macaudio_fallback_cfg' was not declared. Should it be static?

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
> 1464	struct macaudio_platform_cfg macaudio_j314_j316_cfg = {
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
