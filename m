Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA64327C12
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 11:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766059025; cv=none; b=rnOtuxkA0oeJAVYbi+/iEK+UzX+M3MAZXq7IYpI8ayTGwvdjtyo4JDPWG+SSJGX6uwXHyLecGxRmrk0REtLFtdnlsHobDm9eILMUy1tcoMIAKewGn75x8Rh6F1h31E/roDVUwmbsTZTIIjB2vulFn3y/4w9nv2xur5UNAxLUoHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766059025; c=relaxed/simple;
	bh=UItE0ELcC3JJ+0WwyTV+V7qb4GNDcvkosEmvSbiwSeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZtEFhr5F5JfXhFFsN8fHneuKajzhAEzO7SpUp5JtPFg2CYrkGRgW9KnSFk3z94Sh81pm2JAS0bU/Yor2rbcyPK96qvsxQ19EP7dfmRIWSuoCgWLa4aWnPPap0ywioYE3/P8TowPLSSzKoEQxDx91IqShc2Djb8i7EHvpAq8Cj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Knuv1V5b; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Knuv1V5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766059022; x=1797595022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UItE0ELcC3JJ+0WwyTV+V7qb4GNDcvkosEmvSbiwSeI=;
  b=Knuv1V5bYTbEgZ8RIyuzJKQlhJLPlJ1uKWXYX86uwy5Qbcxf1kmJKfck
   kZzOX3TUOe3TuIgLhptOVHPXPjwI7HAklWcnL8s8byf2igQa3wVFV1UHm
   VWH+uXDLY5D+8HGPVAmSMOvABAtefsGSYAzSimpYFf84UlAhFHWZQ0oeX
   7n2gpLYpvID3C2s2r0Ks/KHF9rwUtkkqjvrdNsNkfyTEbCMTBPlfq5H27
   yHe+zqxGW5RkmTyNHo10Vai8xUuUb9uSfi/BtN6mq5xQOjAi0P7BPdMYF
   WpsCVeop1Coy5l5D9uYa459U53OlEur6Rh4MQ+ea/7f3PlrSOUJc/lAj8
   g==;
X-CSE-ConnectionGUID: GQA+TzwXQke1upTo3yhmYw==
X-CSE-MsgGUID: jlzT2GX+TWuc7G20La3ORw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="68049381"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="68049381"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 03:57:02 -0800
X-CSE-ConnectionGUID: Nxnj+X1/SSS8BIYVq1BxHg==
X-CSE-MsgGUID: fS+COqYNQ/6BSnISe47ggQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="198465637"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Dec 2025 03:56:59 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWCcr-00000000229-2mUG;
	Thu, 18 Dec 2025 11:56:57 +0000
Date: Thu, 18 Dec 2025 19:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-PLR-ANBZ26486 11/11]
 arch/x86/kernel/cpu/resctrl/rdtgroup.c:48:6: warning: no previous prototype
 for 'resctrl_arch_mon_event_config_read'
Message-ID: <202512181918.0WZ0ICtQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-PLR-ANBZ26486
head:   0bcb74c919819123b737554f5d35edefa0555d65
commit: e481c8b2b5c7c5ef95ef3521111c2235a87bd5d0 [11/11] x86/resctrl: Remove MSR reading of event configuration value
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20251218/202512181918.0WZ0ICtQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181918.0WZ0ICtQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181918.0WZ0ICtQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:48:6: warning: no previous prototype for 'resctrl_arch_mon_event_config_read' [-Wmissing-prototypes]
      48 | void resctrl_arch_mon_event_config_read(void *info)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:65:6: warning: no previous prototype for 'resctrl_arch_mon_event_config_write' [-Wmissing-prototypes]
      65 | void resctrl_arch_mon_event_config_write(void *info)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/resctrl_arch_mon_event_config_read +48 arch/x86/kernel/cpu/resctrl/rdtgroup.c

cfefad27a56d45 arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2019-03-20  47  
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22 @48  void resctrl_arch_mon_event_config_read(void *info)
60cf5e101fd444 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Fenghua Yu      2016-10-28  49  {
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  50  	struct resctrl_mon_config_info *mon_info = info;
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  51  	unsigned int index;
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  52  	u64 msrval;
82ee7c9f7c456d arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-02-13  53  
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  54  	index = mon_event_config_index_get(mon_info->evtid);
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  55  	if (index == INVALID_CONFIG_INDEX) {
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  56  		pr_warn_once("Invalid event id %d\n", mon_info->evtid);
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  57  		return;
4821fe9c07e15e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-02-13  58  	}
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  59  	rdmsrl(MSR_IA32_EVT_CFG_BASE + index, msrval);
60cf5e101fd444 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Fenghua Yu      2016-10-28  60  
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  61  	/* Report only the valid event configuration bits */
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  62  	mon_info->mon_config = msrval & MAX_EVT_CONFIG_BITS;
60cf5e101fd444 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Fenghua Yu      2016-10-28  63  }
60cf5e101fd444 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Fenghua Yu      2016-10-28  64  
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22 @65  void resctrl_arch_mon_event_config_write(void *info)
60cf5e101fd444 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Fenghua Yu      2016-10-28  66  {
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  67  	struct resctrl_mon_config_info *mon_info = info;
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  68  	unsigned int index;
82ee7c9f7c456d arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-02-13  69  
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  70  	index = mon_event_config_index_get(mon_info->evtid);
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  71  	if (index == INVALID_CONFIG_INDEX) {
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  72  		pr_warn_once("Invalid event id %d\n", mon_info->evtid);
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  73  		mon_info->err = -EINVAL;
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  74  		return;
60cf5e101fd444 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Fenghua Yu      2016-10-28  75  	}
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  76  	wrmsr(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config, 0);
60cf5e101fd444 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Fenghua Yu      2016-10-28  77  
c7d51b50e13f5e arch/x86/kernel/cpu/resctrl/rdtgroup.c   James Morse     2024-01-22  78  	mon_info->err = 0;
0b9aa6562650f4 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Reinette Chatre 2018-06-22  79  }
0b9aa6562650f4 arch/x86/kernel/cpu/intel_rdt_rdtgroup.c Reinette Chatre 2018-06-22  80  

:::::: The code at line 48 was first introduced by commit
:::::: c7d51b50e13f5e409032cc3d60d038286802e6c1 x86/resctrl: Move the resctrl filesystem code to /fs/resctrl

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: winterddd <tianruidong@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
