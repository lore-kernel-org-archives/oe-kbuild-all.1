Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23875381
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705743219; cv=none; b=F28+W5Zr2IqZHp0xKTYRK/18PlNRZWs/CnDqtWSdGGGBZFCEEQs8S0N72d/BERP+9p7lwAlqd46+ccYu8uBBCA+hpkMtn4qr4FIXkpDIgOup9gCdwbMr4adrD8nu2uRbRMXq7vrNGyVdrc8y/wApX/XQowYuGamg66GSK7oh96U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705743219; c=relaxed/simple;
	bh=h1GZXQWOvtkmLxOIaLWQnfERLYvaCGZJ9gIlf8DnUcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gxHdYCE0iIioKjj5wLEkg3aejvkaXoYTcyPKpmu6f00xl9opWwwzwfEvbnFbV7vUHuRjs1TmjBiT7AvUoJ5s4lM1Vm5fszRRbW6rO9CDouv95xvbJBzB7Li/zoPFwdM61xh2TmcXqlmBWFIAR6Y5Px0KJYOSPrghO8gYYgMGKe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iz5JROUe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iz5JROUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705743217; x=1737279217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h1GZXQWOvtkmLxOIaLWQnfERLYvaCGZJ9gIlf8DnUcI=;
  b=iz5JROUegFzyILM29ef56kAVwoGdzrq2B5NsaUiGz/xzOGKz61t9VMdD
   CAMOj8TlShNBIR98QDrpRpqDZXDl1gS1l9MQH7Su1wLBZE8k1u6m9qiBb
   1oz4SyCjVCZEChTgBC1Yr+MSjM3L+IzCA6mSirGVZePsnmji4U8XBRUNr
   Y3d4ZXFsY+dRkqFENyhHoItq15tWrYctaj7O3eyniov1Qj5MavK3OjA9u
   oXllgMcKjjN/+tIwedWlhTQZjgHQawwutfPQ2nA0Rcvib0YcVieUMFyY5
   wyeHRZQ0c6MLJ3E3dQNF7p4N4FSZ/LDpIdsf1IAcSoZE4NtPFPaoCoJee
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="8325975"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="8325975"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 01:33:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="788554684"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="788554684"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 20 Jan 2024 01:33:34 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR7jI-0004xS-1S;
	Sat, 20 Jan 2024 09:33:32 +0000
Date: Sat, 20 Jan 2024 17:32:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15515/21561]
 arch/x86/events/zhaoxin/core.c:505:12: error: redefinition of
 'zhaoxin_pmu_init'
Message-ID: <202401201745.BrLe3Qs6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d29fbb6f9321a629cbf0ca30f15ce6f333ed7b9
commit: 0ce7c3b6e8a986ee9ef92a07ae18964835446c07 [15515/21561] x86/perf: Add hardware performance events support for Zhaoxin CPU.
config: x86_64-randconfig-002-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201745.BrLe3Qs6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201745.BrLe3Qs6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201745.BrLe3Qs6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/events/zhaoxin/core.c:505:12: error: redefinition of 'zhaoxin_pmu_init'
     505 | __init int zhaoxin_pmu_init(void)
         |            ^~~~~~~~~~~~~~~~
   In file included from arch/x86/events/zhaoxin/core.c:19:
   arch/x86/events/zhaoxin/../perf_event.h:1054:19: note: previous definition of 'zhaoxin_pmu_init' with type 'int(void)'
    1054 | static inline int zhaoxin_pmu_init(void)
         |                   ^~~~~~~~~~~~~~~~


vim +/zhaoxin_pmu_init +505 arch/x86/events/zhaoxin/core.c

   504	
 > 505	__init int zhaoxin_pmu_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
