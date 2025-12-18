Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2061F9F70
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 10:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766055599; cv=none; b=Jq21wJsSTWjWCGDnQ0+Oeu4bb+tecpN4RK3ZQ2uRPiUX66whO15tSte3mSmlNHq1Ir8MUp/VOx1yGo/mlvEx8pexrd5fSO01iY6Wm9LRHD5T8Y3b9nn0uDBpDxvPstBGSzpwYiNs6h0kXQX48QqUwQDEAN/G9Ju/ZTQWpyDBS4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766055599; c=relaxed/simple;
	bh=qkRcBfw519V7iwekj5hh4cxwxzdWhpAB/fF1Zi5I3qk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gwqVygq8vPd3n9zoYRsEzhtJYm/88pZbrdAR8xf+gk16tCwU9juUBE4AArKrQU7LXOi9N8Eo5us/GnjAotgIywlzdWzN6ZScKAvXj5fdW5s8deSi+8v2RJBm6gYeLlSJp/kCXvZkj86vuDLxH/VOsxYOpNH07ZjDlMc6C+dQKY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLFDiwgM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLFDiwgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766055598; x=1797591598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qkRcBfw519V7iwekj5hh4cxwxzdWhpAB/fF1Zi5I3qk=;
  b=jLFDiwgMFsnDPST3bLeawgG5arlX8Ld0oC0Zdy0kC+nZeYnn7gMP9cPr
   krbso6F4BqzdRlugLHrilCfKPFkN69UqjzelJzD/91SxkAmrLnVMecBa4
   SVJWNZNeLOGC6L28NQ00yWAQXosOGsZUG7uaE7TdNGq9NMRNnidjXixLJ
   xLjPVEoivBvO6gkK2Oc8dMUuyKDsVzHxTIXGry0ep+Kk5ujavfbHCbgFr
   5uyGXdQZnxtbcGQ51ekQnlXICXXb7CwK8xTRQKlQh3u9FE/fIPq4lhw0w
   0zSiekhfnwB+DZXToSaA3F365Yobpx6q+PQP+KKXhgY8q1ycHnLLGWbIy
   g==;
X-CSE-ConnectionGUID: aVKOPnaBSNSIjIoHMymbpw==
X-CSE-MsgGUID: gZYRs2U2QDaufAimkN9FCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78643883"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="78643883"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 02:59:58 -0800
X-CSE-ConnectionGUID: cZBPlSqxTviAGeDmsFg5Ow==
X-CSE-MsgGUID: 7v3g6d+HQZ+dPaA73njd8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="198322119"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Dec 2025 02:59:57 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWBje-000000001yv-1Aw7;
	Thu, 18 Dec 2025 10:59:54 +0000
Date: Thu, 18 Dec 2025 18:59:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2] arch/arm64/kvm/ptdump.c:263:9:
 warning: variable 'mc_pages' set but not used
Message-ID: <202512181835.kLACxIjf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e48fbb6a53e582d8881d31d6b3de0405f7543cfd
commit: d83ecb7039ab24325e4c10c8dd01556cd8e20f5f [2/2] ANDROID: KVM: arm64: Add ptdump support for host stage-2
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251218/202512181835.kLACxIjf-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181835.kLACxIjf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181835.kLACxIjf-lkp@intel.com/

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
