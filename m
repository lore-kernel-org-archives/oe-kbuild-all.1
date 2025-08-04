Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DD823ABBD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Aug 2025 09:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754300581; cv=none; b=bUQhGD7ze2M0Pp7dN9+GleL2AbmnrSwV22pa01FK61EeEmF5i/xPMQXFBRge8gdToe5joRP2hhHSBPr/oeEbKDYg9ASBiDJITXCURl/BPxUSg/vVteO1unvg+IRXaoh3nMUQ/a6boiN+5vgARaTXEySbEWvNzJejPN92ZFI+JG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754300581; c=relaxed/simple;
	bh=8dRHPOGQufLVOpTct/Ggyf337TSAszAX+P/aabd4j34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aeoJbb/7p2b9ycBmv6QBNrmFwxkr6O/EBu+sAUT8rDLNKSPQcrX7FUz/ol9nin6BbeSSaclbjZVWoKjI4JvnYd89beV8hfMA/ULuO44bwA5OU5IaItz4Iv4WTlMMIb/qnGyK6VI6kM++wGliF/xOl7RlLRKG1DBN3jwVsuxRsO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AyXCbXMt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AyXCbXMt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754300579; x=1785836579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8dRHPOGQufLVOpTct/Ggyf337TSAszAX+P/aabd4j34=;
  b=AyXCbXMtYs5wF5OpY28COQZlXqTJK61yvbOPI+A5T762iiJc0katUgK8
   EDV2s92ygJ4sHqkGutb99zGoBzrjA/J//8IvvMQ8mKnmc1EXjJtRpjh2y
   iO/d9ienxIObP1lnDIp+DTvvauOKEPQ8/4/pZQs4btUEUHi50+uE7NFCk
   oT11+VKBO0790A4JUSvAmwek5u330L5YSVfE259qtpefi+/jywNisVfXx
   tZQmTqu0Ze+AWQdOI0tMXfkC7918jIayqmwZyiFR48UKXALZ5LkYxQeP1
   lnIRb71LqB8l5wiFaCZDhQ0XBLA7BzyjUaVK5hvZpqs0K0o2FhkS2WvXk
   g==;
X-CSE-ConnectionGUID: IU4c9UKHR02TmyAS05QiOw==
X-CSE-MsgGUID: 6cvv5nWtTd6x+JfEcH65EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="56523547"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56523547"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 02:42:59 -0700
X-CSE-ConnectionGUID: yqMuF2/JQ/Ct/+NN/94yHg==
X-CSE-MsgGUID: UFjNdsXVRde9Mkdssuefvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163380367"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 04 Aug 2025 02:42:58 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiriZ-0001lf-0v;
	Mon, 04 Aug 2025 09:42:55 +0000
Date: Mon, 4 Aug 2025 11:42:31 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2634/2634] kernel/sched/psi.c:894:13: warning:
 'task_is_in_psi_v1' defined but not used
Message-ID: <202508041114.JMCuqZko-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2c3b9ec99c8859c2992ed4684c28a503913d5251
commit: 2dfc29e742a07863c2426aea03d5c2c97b558b9d [2634/2634] sched/psi: Export cgroup psi from cgroupv2 to cgroupv1
config: x86_64-buildonly-randconfig-2003-20250804 (https://download.01.org/0day-ci/archive/20250804/202508041114.JMCuqZko-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041114.JMCuqZko-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041114.JMCuqZko-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:97:
>> kernel/sched/psi.c:894:13: warning: 'task_is_in_psi_v1' defined but not used [-Wunused-function]
     894 | static bool task_is_in_psi_v1(void)
         |             ^~~~~~~~~~~~~~~~~


vim +/task_is_in_psi_v1 +894 kernel/sched/psi.c

   884	
   885	#if defined(CONFIG_CGROUP_CPUACCT) && defined(CONFIG_PSI_CGROUP_V1)
   886	static bool task_is_in_psi_v1(void)
   887	{
   888		if (static_branch_likely(&psi_v1_disabled))
   889			return false;
   890	
   891		return !cgroup_subsys_on_dfl(cpuacct_cgrp_subsys);
   892	}
   893	#else
 > 894	static bool task_is_in_psi_v1(void)
   895	{
   896		return false;
   897	}
   898	#endif
   899	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
