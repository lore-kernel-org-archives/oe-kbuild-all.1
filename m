Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF03E283FEA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Nov 2025 11:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763291026; cv=none; b=QLCTLFRmOY2U7f9rmF2XidanKOqy+3zM1z+3klrN1hbljMCBGNwH5IKx/H0RoIGeDdE+f2r7lwaHPtylnm1skmt8tfEC9aYbTOmcfXNPv+hQgqevlptYL+4btUYTvlm1E1UAEgzeqCvOdsthCPNn0NLDSzE+j1/XIzcLmwhvWnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763291026; c=relaxed/simple;
	bh=L0isgXn++9ii1kJkHJ+nNHaGvQrDoqf1RgeSp1xrX+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKtc+u40iRizNqeljaNTsweG+j22DdsHVZTFLHfMaCJ5O2s0FMiLf4NgN7JHEp5eHWBGtNE+7E/rrLQXvOPtqLKBUIbyhx9H9L1BqTo/aR34iwOZSRPaG63XPXZrd1wBXHU/clrCk+VwZdlKiEWQtMjhj4GakfQI6KFuqeP4LXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWg5YSGQ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWg5YSGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763291025; x=1794827025;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L0isgXn++9ii1kJkHJ+nNHaGvQrDoqf1RgeSp1xrX+M=;
  b=aWg5YSGQHb+NaRriHL8NNQCzq9kcPcWRk4ZzBJMh58VK3+BcDxWsm9ZH
   dJvpLHx4cRcXdd/vd7zd91ECl1m7d6ZXUxl8jJv9uK7DFs6sGnCFG7iGl
   +X4dHSI5tA8Sb/5aB4ZXtKZAptzqrLTT2HkLWJlKDcWJ9sREigQQyPUdD
   HzJD9W/L/WzbBi6zUby4koHPugF79i6zQrVu91BATFhb0DSNfu9jMMbB/
   wbAW/JkeD+DEfpBq+rjhoByA3Q7uQpqvq9eP+jIJFYwlXxWJRbPV62PG+
   NWbNQTT+pLLTTCKfztW2xA1wAbaqRPptYjtAnAz2Zg56Y/d/vbDXwiZc1
   A==;
X-CSE-ConnectionGUID: KAee5dZhRpahOIRzGglR0w==
X-CSE-MsgGUID: 56J0Xf1DRDm4iPipn249wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="65197538"
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="65197538"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 03:03:42 -0800
X-CSE-ConnectionGUID: N1hnmSv4REy1TzW9ApJdyA==
X-CSE-MsgGUID: rTylDGpGR2udDs0WzmD8ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="213611251"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2025 03:03:41 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKaXi-0008iF-2S;
	Sun, 16 Nov 2025 11:03:38 +0000
Date: Sun, 16 Nov 2025 19:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 04/11] memory-tiers: Introduce SysRAM and Specific
 Purpose Memory Nodes
Message-ID: <202511161811.TYB1dy9s-lkp@intel.com>
References: <20251112192936.2574429-5-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112192936.2574429-5-gourry@gourry.net>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 24172e0d79900908cf5ebf366600616d29c9b417]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-constify-oom_control-scan_control-and-alloc_context-nodemask/20251113-033247
base:   24172e0d79900908cf5ebf366600616d29c9b417
patch link:    https://lore.kernel.org/r/20251112192936.2574429-5-gourry%40gourry.net
patch subject: [RFC PATCH v2 04/11] memory-tiers: Introduce SysRAM and Specific Purpose Memory Nodes
config: powerpc-randconfig-r062-20251116 (https://download.01.org/0day-ci/archive/20251116/202511161811.TYB1dy9s-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511161811.TYB1dy9s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511161811.TYB1dy9s-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: mm/vmscan.o: in function `mt_set_node_type':
>> vmscan.c:(.text.mt_set_node_type+0x0): multiple definition of `mt_set_node_type'; kernel/sched/fair.o:fair.c:(.text.mt_set_node_type+0x0): first defined here
   powerpc-linux-ld: mm/memory.o: in function `mt_set_node_type':
   memory.c:(.text.mt_set_node_type+0x0): multiple definition of `mt_set_node_type'; kernel/sched/fair.o:fair.c:(.text.mt_set_node_type+0x0): first defined here
   powerpc-linux-ld: mm/mprotect.o: in function `mt_set_node_type':
   mprotect.c:(.text.mt_set_node_type+0x0): multiple definition of `mt_set_node_type'; kernel/sched/fair.o:fair.c:(.text.mt_set_node_type+0x0): first defined here
   powerpc-linux-ld: mm/migrate.o: in function `mt_set_node_type':
   migrate.c:(.text.mt_set_node_type+0x0): multiple definition of `mt_set_node_type'; kernel/sched/fair.o:fair.c:(.text.mt_set_node_type+0x0): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
