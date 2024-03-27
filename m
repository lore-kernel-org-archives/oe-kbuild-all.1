Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CFC4CB38
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Mar 2024 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711576367; cv=none; b=QUm6KwnN2LoF9GkX1vuQJetwPaA1iWkPwrEDK1IroO2lfMhif4GM4rLv7qtllSI/Ieza/lIok/uub0CFMVPuSskBSmbA0o7t5+nr1TX0aWoXSNHPAuia2/QWs8HfIfxX0Pg2RyJvQ+j7osk35idXusKFoEUMv7sADNBol4CNVCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711576367; c=relaxed/simple;
	bh=jMczQ43Pud8+Pmq5hzIksXx+lzgP2c/a+lKnc/1lOB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kC1CSUH7Yduf5LlsmhS9SYQL7sIr17tNvYsBR6cdxU5UsRNNjjVgMELORUP7SUbT7JvbBx+w0Q/xspG8ZKatP9eivCtl87XexjZRmZ9N30C3FbUWSbuzwcTmVdEHlg0jX7El3prz93Z7cp9orHve7r4HSP2d/sPD1H7TPJooQ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWnymrc5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWnymrc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711576365; x=1743112365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jMczQ43Pud8+Pmq5hzIksXx+lzgP2c/a+lKnc/1lOB0=;
  b=JWnymrc55tioKuG8K5HcMrF+NaP09zsGOkzyWQ3WdFsR58rP5HaK3lY0
   jBAtjJ1Rix3239PwCYb439YhJyPNhtm9j+fAq1l6Ro0EN3CWdxOxvbC8v
   fC/7GGuCfjMCFLLEEhNPA8E0AGX95VKpvSp8t6X5HPFdRW2RgJCWvDNwz
   tf7htIW07JD/VyBZyodpN6kRZ2UTBJzK4urrYawc6MOkdialQh4q7PEcw
   vVYCFHbX+r5EmJMfdeTplRlWHkfhKd0FKF3pKFS2b3gG7yVnmMzZkyjnS
   aV12KorVyk5Eo1nKs86dK8Rzeg60pVHzh4/6km0hMFlshGs8zkbr4i/4k
   A==;
X-CSE-ConnectionGUID: yBbcdlZHRkOw23Qs1a4UNw==
X-CSE-MsgGUID: EqLOU3bpTgmY2YX4n96d9A==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10513032"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="10513032"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 14:52:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="47641445"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Mar 2024 14:52:43 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpbCK-0001X8-1o;
	Wed, 27 Mar 2024 21:52:40 +0000
Date: Thu, 28 Mar 2024 05:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 9/10] arch/arm64/kvm/ptdump.c:263:9:
 warning: variable 'mc_pages' set but not used
Message-ID: <202403280507.6LkHiQRN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   fd56b2aa92fcbe06183a073463747799129267e9
commit: d83ecb7039ab24325e4c10c8dd01556cd8e20f5f [9/10] ANDROID: KVM: arm64: Add ptdump support for host stage-2
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240328/202403280507.6LkHiQRN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403280507.6LkHiQRN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403280507.6LkHiQRN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/ptdump.c:10:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2180:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/ptdump.c:263:9: warning: variable 'mc_pages' set but not used [-Wunused-but-set-variable]
     263 |         size_t mc_pages, pgd_pages;
         |                ^
   6 warnings generated.


vim +/mc_pages +263 arch/arm64/kvm/ptdump.c

   260	
   261	static struct kvm_pgtable_snapshot *kvm_ptdump_get_host_snapshot(void *data)
   262	{
 > 263		size_t mc_pages, pgd_pages;
   264		mc_pages = (size_t)data;
   265		pgd_pages = host_stage2_get_pgd_size() >> PAGE_SHIFT;
   266		return kvm_ptdump_get_snapshot(0, (size_t)data, pgd_pages);
   267	}
   268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
