Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E2815624B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 23:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754002905; cv=none; b=fjjVNCsFTcSJLY2R8RSepRV6o+8lJpL09CT3dHikyg5VlacGcl9NkQ30SSMt5zVPs3yrmxz1tDRQh7gaTEAQPCL8zO2BwDVXHNw4VSk2GiicGNyHd4XroA7sHoToR+k8P4TVoM1V5leQ86f1ahbjOIB5dRq1qFA7nLWFNvudnos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754002905; c=relaxed/simple;
	bh=oO/DCk3nUPuSykYTITH1fbl7YrnRXJR3EazQJzQA+Es=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N2gW76OMIniTmrRef5XX8QZ33ik1WXJ3CcaP+OmAYBJriuPAMM0YI3ycFbGujgLmBD4nzJYU+SNXxu8uZwGkPN/iTphxQTfvYqetWoLXLMDQhUo2s11ljAVOIX5gg7A0nIGjrvhmSrldITJ4wTZbs7JEsSZ6/DBbUrKpuKcj0I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxYF+pwG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxYF+pwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754002904; x=1785538904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oO/DCk3nUPuSykYTITH1fbl7YrnRXJR3EazQJzQA+Es=;
  b=AxYF+pwGCwVXkBA0Wvqc9IdmydsUM4/jsv30iwDQwTZIEmyUVMIHsgAz
   HWP1BrV9Oox5SjQyuhl6s/a/AnPfRaxw2QrDJ3oHXuNDpTDilUt6yFdnP
   Lvn/R/uwkt0TwtmnXzaiRs/mi3TxG02f/6cDjSQWw2vg4nlLKEJ2p4ekJ
   Vw0RrqgnvjfX9Ibxf3Qky5L+YN9fYGmy6A4zFwvxgm+g4VSGWwxIg/NHs
   eOIEYc0MpnEGvTGoa4UHTpVf3zo7DjzBr1wbQWvytBbQDz45Rb3jXXM3M
   z8jNCY1UGkJ1StnWIcNnT/QO000SqaaEeUoR1Fb7Xhymun690laU55Rtm
   A==;
X-CSE-ConnectionGUID: tknm38XZTXisx1VJAIc+kg==
X-CSE-MsgGUID: glhO3Zz/T4+O9x85hNL5qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67037748"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="67037748"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 16:01:43 -0700
X-CSE-ConnectionGUID: XjoNRpVjTgS2j2oQx75aYA==
X-CSE-MsgGUID: IC3J+c7CTzyj7HjZv8WTGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163100601"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Jul 2025 16:01:42 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhcHL-0004B8-2k;
	Thu, 31 Jul 2025 23:01:39 +0000
Date: Fri, 1 Aug 2025 07:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mdraid:md-6.17 29/29] md-llbitmap.c:undefined reference to
 `__udivdi3'
Message-ID: <202508010638.hgnjDBfn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mdraid/linux md-6.17
head:   6ca91f77c23a4d309f3250ddaed8cccd51737f4b
commit: 503d06247170ce76056a403b809097203e615e44 [29/29] md/md-llbitmap: introduce new lockless bitmap
config: m68k-randconfig-r064-20250801 (https://download.01.org/0day-ci/archive/20250801/202508010638.hgnjDBfn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508010638.hgnjDBfn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010638.hgnjDBfn-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/md/md-llbitmap.o: in function `llbitmap_read_sb':
>> md-llbitmap.c:(.text+0x1894): undefined reference to `__udivdi3'
   m68k-linux-ld: drivers/md/md-llbitmap.o: in function `llbitmap_resize':
   md-llbitmap.c:(.text+0x100): undefined reference to `__udivdi3'
   m68k-linux-ld: drivers/md/md-llbitmap.o: in function `llbitmap_end_discard':
   md-llbitmap.c:(.text+0xe9c): undefined reference to `__udivdi3'
   m68k-linux-ld: drivers/md/md-llbitmap.o: in function `llbitmap_start_discard':
   md-llbitmap.c:(.text+0x140a): undefined reference to `__udivdi3'
   m68k-linux-ld: drivers/md/md-llbitmap.o: in function `llbitmap_read_sb':
   md-llbitmap.c:(.text+0x17b4): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
