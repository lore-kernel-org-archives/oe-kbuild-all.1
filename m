Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680372C3254
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 19:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770925544; cv=none; b=PFA5c9j8Db4KNf2v+vnyOFC3/JDav/OAuK1foz+xqgbc3dz6zz3qO63+vsmmMzH0vOVXh+8dDYTKs56//REhvwi+iWHfhcIQ1HXJUadLtx40wzMk61gZ6Ars/94hdWNgTuE1JNguzbbTuEcc1ucscVfcJ6jjkD09SAzjgdQ1PZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770925544; c=relaxed/simple;
	bh=gHB1bLNM8smKD93cGEcEhkajByV8gCB9jnOcfOqg4EE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PWrCPIYbSpYns8giQLvtSFxJBg5TFka9w/pTVgDpJA+pBQVWObxYvHETdyY6tdWv2VgYjkWfnps//S2fxa6Z/9WgQdHmwUXQlpMVYd8OCKw3LcU7SD1NXQEEgHHP0q74xsUD/+ENsZy5aCHz4DFVie9qXltEXAqNXLpqCxts110=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mx0e9UbC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mx0e9UbC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770925543; x=1802461543;
  h=date:from:to:cc:subject:message-id;
  bh=gHB1bLNM8smKD93cGEcEhkajByV8gCB9jnOcfOqg4EE=;
  b=mx0e9UbCKR3AYV8n6UgUx1UDw4yVw7j+g/7BnMb3pDj+LmUUuRpyFZRz
   QcpqAe/PJF6vSH8Xk1u/f82d3CDg/70gUzfwCwJb2ccSTJ2dXwWSuwaBY
   CzoM/pSVzi6FYQkvQ/AGkNOWmOfokdaaYHzRH2nh0Faxh/d+nWsed94AY
   BEi113XUisDbtc9eRYdRPV2FggDDB0bfvlxxKFUHrmH1KZXZwePHytQcB
   r3SArCaAChc2MtSzRHfPFqWVC+fYr9ODEJKPam/fMzwY/gazZ7ujljK2s
   KDFDjpXt2d8gDlioOBjVy9GRe5MFhzM9/P70UIzSCtkHSrl9byrMVwtYQ
   g==;
X-CSE-ConnectionGUID: OOqkkQsBSbGObnMWba0OOg==
X-CSE-MsgGUID: aR9UlZ0dQEGleFQxi5SG0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72292215"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="72292215"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 11:45:42 -0800
X-CSE-ConnectionGUID: xtQjEWhvRcOLCV77Tq3TIA==
X-CSE-MsgGUID: wC68cv8oTg+7wGcUiDgdaQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Feb 2026 11:45:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqcd8-00000000slo-2qHB;
	Thu, 12 Feb 2026 19:45:38 +0000
Date: Fri, 13 Feb 2026 03:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:new_memory_domain_logic 7661/8264] ERROR: modpost:
 "mtk_adsp_ipc_send" [sound/soc/sof/mediatek/mtk-adsp-common.ko] undefined!
Message-ID: <202602130317.j0ZiWS3P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bard,

First bad commit (maybe != root cause):

tree:   https://github.com/jsarha/linux new_memory_domain_logic
head:   9e793ed3dc49eb7c72bee1f530ced0edc4c71203
commit: 3e55a76d727eddf6b3bad82139a6788172168a01 [7661/8264] Merge branch 'sound/upstream-20250414' into merge/sound-upstream-20250414
config: parisc-randconfig-r064-20260212 (https://download.01.org/0day-ci/archive/20260213/202602130317.j0ZiWS3P-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130317.j0ZiWS3P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602130317.j0ZiWS3P-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.o
ERROR: modpost: "__divdi3" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "__udivdi3" [drivers/gpu/drm/xe/xe.ko] undefined!
>> ERROR: modpost: "mtk_adsp_ipc_send" [sound/soc/sof/mediatek/mtk-adsp-common.ko] undefined!
ERROR: modpost: "sof_of_pm" [sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
