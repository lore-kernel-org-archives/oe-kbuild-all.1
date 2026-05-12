Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E4B3C98AE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 16:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778602188; cv=none; b=Ooxpqa1r2GVD5Q3ssZIZxm0M092EupM8ZwQeitdsu1Ttuyg09uy/EJF5+3rlO4JbxftPjpVUdJxH4f/MGRlRh9NXQTnh7NScwTdHtXXpO1fVNYZFrsBIuLk0m/AeBykd0870+dwg44gJ+jPlBf/9vH2LBZXTxgZUual55ak/EMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778602188; c=relaxed/simple;
	bh=ZRipGXld3hQFLeMBnlEf6AAW/0FmNFpiPr0bAV1mg/g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OVR1zaDXCC1ZPw6VnRpRUiXcU9Js29iFSYSBlN9znoVJAwo5GpvaR3GDfJMwBlariIQW+1gNrQhGynbXbGKQNWVNIM5QLGQYlXYjF5jGr3rCHBriPO+fIHYit4uol9PrXV3iPvOvDuJbnIJqAc765Ao9LeUE9UHi8PeHN4RjE6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/9fM+8N; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/9fM+8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778602186; x=1810138186;
  h=date:from:to:cc:subject:message-id;
  bh=ZRipGXld3hQFLeMBnlEf6AAW/0FmNFpiPr0bAV1mg/g=;
  b=c/9fM+8NVJtptaJMG18i4auRzboWmKMb0g6wOUDV+YL0KSx+bBmU3FFR
   a01iBlSbS/WpNVYMruxRUtLNHRKbpMv8ZJBbPOnteIv6gcoxJnk7EMcOC
   wg884QAWQ67Ei2vwPvsfv3LM7RNw7LUXTVz2Yuq3AifVa86dAsSTZ1ipJ
   SfPj3smhItI9MFI6cdW/KigI7wzn6hDB7HmrKAybVpZd3PZ4cxJgUowEM
   J/Wtk4n7Yoh9M35eeLpknTlSmSMCl9OV0gsDjlC6YyKCv8KCdxh2RNveS
   i8txbioQuHCtUhp0VbdRXT1Uj3hRFSaR51fL12yQ0IqEzuoIe9pOe3OSz
   w==;
X-CSE-ConnectionGUID: fHy2ZCN+S/S5MG/WDXJAqQ==
X-CSE-MsgGUID: HA6vutPyQAWXcNYhKPWH7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90095980"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="90095980"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 09:09:37 -0700
X-CSE-ConnectionGUID: p/O0AjOCQwGY8YkLwVb/MA==
X-CSE-MsgGUID: wYbLyzKjQuKPNqMMk+TE1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="275928290"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 May 2026 09:09:35 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMpfo-000000002NZ-3oo5;
	Tue, 12 May 2026 16:09:32 +0000
Date: Wed, 13 May 2026 00:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: Aary Patil <aary.patil@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [thesofproject:topic/sof-dev-rebase 15/72] ERROR: modpost:
 "sof_of_pm" [sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.ko] undefined!
Message-ID: <202605130012.N2t7A2oY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   f0f2834ec142e66f2cd1e3aad558d7cb5adaf80d
commit: 15c6ca6066957e936d2afd6a996dc40e0c0a825a [15/72] ASoC: SOF: mediatek: Add mt8365 support
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260513/202605130012.N2t7A2oY-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130012.N2t7A2oY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130012.N2t7A2oY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.o
>> ERROR: modpost: "sof_of_pm" [sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.ko] undefined!
ERROR: modpost: "__udivdi3" [sound/soc/tegra/snd-soc-tegra210-mixer.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
