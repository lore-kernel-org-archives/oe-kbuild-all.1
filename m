Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DFE3358AA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 17:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764609019; cv=none; b=NZhUqvqzzNh+4PW5OSlrDBezvFmjjCABHJDCfx07juVTxOOTYbYw3GNNYcBLKkWPFX8Qam8akd8WsySDEHniHlb59WVLbqFOV//+vgjY64XO0qtaDlSUx7VYHbZfeUE+44EWTsEaPvrLHgl53Bv+POSR97b1ZGNNmQ0eyfxgsPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764609019; c=relaxed/simple;
	bh=MWGV8v8vzRuAr0C6totM++NmTJhH/xEvN5PirMjMrIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kcnCdoM0ZVv7YUWu4vRTE23JgCYxrFXPWvouJ/r8Rhg/bGE0h5nElk2SKlogFn1b+T5Q2xobVXoHxu9p3elQ3RBY4fkiQ+KRcDnpdi+yeqqgTap0Xc0/cVe3f71bWM/8Yy7dcwStebgIQ0I5uTgbui5bXdb7K/zq3Bs9NGPy+OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXVCdK9s; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXVCdK9s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764609016; x=1796145016;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MWGV8v8vzRuAr0C6totM++NmTJhH/xEvN5PirMjMrIY=;
  b=JXVCdK9s1xj9nhvcEdEp+sqih334KWmiXadd4rtMTZTqxTKbALR2mnlo
   rH4RPwrE0X5c1O2aV5s/+LZAgAe72VuLwrjAg+EqDIcCh8R/LHIhsPGlK
   4nLmuxZPZRv2BI/tcPYa9sogf2zNX0KtYVLFHvkRqH9lmLPwlahZAkZU7
   2/wNVAvS5SxaQSdGxsQ9AA3J9xhSwPkuXNw7tkhRV2hKs8OjDGMbD7Wsn
   XQCx6vcSrgQWm6sKPsUHxfIpwTCzJ0Fvqg2HLoiKnUKnjTwU0TawtIVxa
   Jxbv0zJiNAtwWQETgYpAJ6lKxK0iKALAYuudnqxyZriugxT1G5zgzLg6r
   g==;
X-CSE-ConnectionGUID: CjtXLAMWS/2xaOqShu1wfw==
X-CSE-MsgGUID: DZO2v1fNTGiEBRBpx/bIGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="70169275"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="70169275"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 09:10:16 -0800
X-CSE-ConnectionGUID: lIDu7KDnQUmdGf1bYEBbAg==
X-CSE-MsgGUID: r+jeyoD+S0qQiMsEYD9ivw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="199255159"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Dec 2025 09:10:16 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQ7Ph-000000008xf-3HN5;
	Mon, 01 Dec 2025 17:10:13 +0000
Date: Tue, 2 Dec 2025 01:09:19 +0800
From: kernel test robot <lkp@intel.com>
To: Aary Patil <aary.patil@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [thesofproject:topic/sof-dev-rebase 24/94] ERROR: modpost:
 "sof_of_pm" [sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.ko] undefined!
Message-ID: <202512020032.CbMO6XcP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev-rebase
head:   4ca6276b4ddb27ef143f7e84817b6e8a2fdb8372
commit: 622c43e416a1c8b7ce2e145f2f1d22db3d4cdc50 [24/94] ASoC: SOF: mediatek: Add mt8365 support
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20251202/202512020032.CbMO6XcP-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020032.CbMO6XcP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020032.CbMO6XcP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.o
>> ERROR: modpost: "sof_of_pm" [sound/soc/sof/mediatek/mt8365/snd-sof-mt8365.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
