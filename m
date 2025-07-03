Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6103B199938
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 07:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529415; cv=none; b=eWGpSGZtMCk5oKSZsCI1ayeeN9qo/O0lr7LPph5HtryNHcB/dvHLHJsqKCeYS029wuR8u3oXAzhbozcuAGfAKmGJx9ImyUfSM/C0KtQlNMhcNTwRCYF5ZpPOmij/fQvUhUCMZv3B3pDyj2fVr1wjMKDkJ+qpoe/9MauMTFnBoyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529415; c=relaxed/simple;
	bh=gUr1Us1wp/fzDT3a4qtTUVsr1t+pZAmq5vn5nhFWBV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G8SlZ3/XVU/QQP40PmSBcOlJf9uWsnYtr+PW0dZJVCuQA0lqqNEpCrOsiBMScfn7to3DEeTg5iTpM0M9ZlOOzL8G0UeCZliZ6/KlqQcRGfXPKJN8yfdfN9eWgpNRtbKOMqkac3Dlj8EsprrSYCCpdRavdLNxehHxHIC+FOlOu2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=joWJVr21; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="joWJVr21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751529411; x=1783065411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gUr1Us1wp/fzDT3a4qtTUVsr1t+pZAmq5vn5nhFWBV0=;
  b=joWJVr21ECVGyIzxwz+TY+GH7GdLgKOXRXV1BpZocY7HHK1GRYW3YApt
   EaHNrOcqP+7uM0m6ePDLe4iVqyay6krkCb2VeTWPtIDVTe6MdPKT+zaLp
   ptqSVPpEDLzxZP0427gR50fvWO2fyeF3stzusETRx9mU80L1uYGLF9z+e
   uWWHMX73w8GO6qcVZVPEgrzlj3VdHM/zhk+e21xjay5agwS2bIl4Onc9F
   dYeLvMZxm0N78CutagpgSGJQLlFY81Iohsbh2pJk2Xx8WlnasrJlbOvN5
   z8xSRbKy1jc4uxyx4s0d7AWwYEia2RsW3e0jMzmHgirUt4MfMrP64L1XG
   g==;
X-CSE-ConnectionGUID: uQaek8FGR2WyXQP0ukcXlA==
X-CSE-MsgGUID: JWnjzpqSTqekI3ag7ZF5Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="57619229"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="57619229"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 00:56:51 -0700
X-CSE-ConnectionGUID: xOrvsAmYTBmQuQCmj3JTOg==
X-CSE-MsgGUID: MfSzXC0cStSY18EgomerIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="191468645"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 03 Jul 2025 00:56:50 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXEoJ-0000R3-0w;
	Thu, 03 Jul 2025 07:56:47 +0000
Date: Thu, 3 Jul 2025 09:55:58 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2999/2999]
 arch/x86/kernel/cpu/resctrl/rdtgroup.c:1504:13: warning: variable 'h' set
 but not used
Message-ID: <202507030942.l6gjiDwl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   63325b01e46c2933270cf6bdc0c0e859b664d6fe
commit: 540e1ae2f7aca5a427a52f12bef657b1e3e81fc1 [2999/2999] x86/resctrl: Add interface to read mbm_total_bytes_config
config: x86_64-buildonly-randconfig-2003-20250702 (https://download.01.org/0day-ci/archive/20250703/202507030942.l6gjiDwl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030942.l6gjiDwl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030942.l6gjiDwl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/resctrl/rdtgroup.c: In function 'rdt_last_cmd_printf':
   arch/x86/kernel/cpu/resctrl/rdtgroup.c:74:9: warning: function 'rdt_last_cmd_printf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      74 |         seq_buf_vprintf(&last_cmd_status, fmt, ap);
         |         ^~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/resctrl/rdtgroup.c: In function 'mon_event_config_read':
>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:1504:13: warning: variable 'h' set but not used [-Wunused-but-set-variable]
    1504 |         u32 h;
         |             ^


vim +/h +1504 arch/x86/kernel/cpu/resctrl/rdtgroup.c

  1499	
  1500	static void mon_event_config_read(void *info)
  1501	{
  1502		struct mon_config_info *mon_info = info;
  1503		unsigned int index;
> 1504		u32 h;
  1505	
  1506		index = mon_event_config_index_get(mon_info->evtid);
  1507		if (index == INVALID_CONFIG_INDEX) {
  1508			pr_warn_once("Invalid event id %d\n", mon_info->evtid);
  1509			return;
  1510		}
  1511		rdmsr(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config, h);
  1512	
  1513		/* Report only the valid event configuration bits */
  1514		mon_info->mon_config &= MAX_EVT_CONFIG_BITS;
  1515	}
  1516	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
