Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793135151;
	b=huQ7akF3wFkOFU2IBVYggUHUKD+PDXQfncz5hcDBXTaZtupFK1JqLspmcUm0ZKiPHP1l
	 KJ1EGPxiUrTlufuhB/OyYdRI3ouPKCwTpw6JbHZ/vLh3GVYLdINOShy7Afxug8R1Z9LaS
	 NVUUq8IH9vU7ZcCFfubIczdPQIYf+A5ymCFdWx84uQChlseHQ0ruH7/GcMdzKl7zTKhwh
	 62IUrVYK3HfVEirtrDSLD32mQNmzm+EMtnOPM+J79Sqx6PSWmu4IFUgGTAgN96npLS+2x
	 l5bztMATJMBgt8BeqPTHBxGMLXsqhBeq7cP37mz/Ei7L6tkx+jgSV80zo2kMU3zp0bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135151;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7uVRYS2l9gdFsJeFUNA9WtesCEewREH7+zDWpBlT5Dg=;
	b=vwkpYTfXXPEiRIPjMpBsA6hGKrgRe0vfEo+k9X6V3bVBFZrBekMLbSRGDDT57wrLKLOL
	 e+rBzj94Kjve0KPJk/KVefJ1MKNF5VnP1Bqr6lujxRnt4lXuPNP4lEmkaCy1GrufHvKd1
	 Ex/UpBPbVFChJGD1mrSorabuBwZj6zxzPo6pGGZt4sAdvIPOkV6KgW+MJeCsMClkXtNuN
	 4IxqFEHwbWE6GsrkGeNDAvFGthvkvYHFFi5wa2MdK4TiKx4EifMcZkiygvssLtz3fNR1B
	 KE0UGPuw1XjKtR16eJqvyGrdbZJGyEF6dHCXdxAEHc1iJWOZh7BW91qHiqIu4w+09Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=drtYQUpL;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72078606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 21:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72078606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=drtYQUpL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793135150; x=1824671150;
  h=date:from:to:cc:subject:message-id;
  bh=omy/wx6cnlgXGk89OuiQx7/Wn/itM9BiJVM98w3awBs=;
  b=drtYQUpLVaxSBTtMk+hpYEAVF8LQKmkkq6Aj/XS1tMGZLPHkmbU+sFSf
   IGZxQqPogYOFcIWr6qIfJ8OhF3UZhif2dYCbq8gUlnxSFd+ok4Te7wViv
   bPhYgYxq/YRhofU1q72mwwzeeEvfLp2pfmSSNklZC1stXlNvCQLez0Zgy
   RqquGMsgiSHg+vSFqZQI143jVC89AQGERiW6+WOdXjLD2UNwaw0mE7Cc4
   +9JVByeQ30ot8ALE+ILRRivJl/P4GFE6L+6YrcUTCujvpcQ9/M0Tt+Tqa
   28UvREp3KfHOhL3j2Gv/Yt83ECNHgiY5yKStB6U7qgrsNcMDxzoOHSWC4
   A==;
X-CSE-ConnectionGUID: Bofp66wvSnC4C7+AYlK7Vw==
X-CSE-MsgGUID: HkojsCZRRFycSU/BFfmM4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1861590"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1861590"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 14:05:49 -0700
X-CSE-ConnectionGUID: uLycfJ6zR+CURwbMBJPHug==
X-CSE-MsgGUID: /7pc/u43SIGTrkCQmfbCnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5044868"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Oct 2026 14:05:48 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLoMb-000000004cx-1hQN;
	Tue, 27 Oct 2026 21:05:45 +0000
Date: Tue, 27 Oct 2026 22:05:42 +0100
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wens:random-stuff 6/10]
 drivers/media/test-drivers/visl/visl-core.c:54:6: sparse: sparse: symbol
 'visl_frame_based' was not declared. Should it be static?
Message-ID: <202610272240.W1acmro3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git random-stuff
head:   6c5d9e149cf308ead35a6bd9016a5f1c74a33cea
commit: 7348f56274cc958a79b76bbedf6deefa6cc0a153 [6/10] media: visl: add module parameter for switching H.26[45] decode mode
config: arm64-randconfig-r2309-20261027 (https://download.01.org/0day-ci/archive/20261027/202610272240.W1acmro3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610272240.W1acmro3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610272240.W1acmro3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/test-drivers/visl/visl-core.c:54:6: sparse: sparse: symbol 'visl_frame_based' was not declared. Should it be static?

vim +/visl_frame_based +54 drivers/media/test-drivers/visl/visl-core.c

    53	
  > 54	bool visl_frame_based;
    55	module_param_named(frame_based, visl_frame_based, bool, 0644);
    56	MODULE_PARM_DESC(frame_based, " forces H.26[45] frame-based decoding on newly opened instances.");
    57	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
