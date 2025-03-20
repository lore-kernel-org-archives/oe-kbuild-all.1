Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDAF28EA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Mar 2025 02:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742438913; cv=none; b=KHtVgxpxs3wGSYKNo1/pYPy+hcWJHu+a9/CUPINQT0Uv0hESUYsNfUHmI4K9287XlcFFDAthBeQAux/sWi6yzawcWPlzeGgIS74EMfgs11fwuvlSqEmdARI0qbG3K/IX4ghSqTivcViKeiD3yRjeb7NwY7eQq89qSMS+Z0a/Vu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742438913; c=relaxed/simple;
	bh=vwIS90KTAYpOv4j0HefuuVcmkKpAKknjXKXSf6SidZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gO+gqpk1fGqGQarldITRlzBxq1bjPzMciU7EuzwGyAFXV0+04YdSgLOPTFQNt7yxzgvoqAygyDerLkBl8hh/3DAx3aFrNigGe3/6+OdCXEAhCvCMtNv/+XTusyODVfC2FIoHjOsS/dtsRZRMELQ+aD9ukWp8TCmTDnBl8qk5vfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bW5MbEO0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bW5MbEO0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742438912; x=1773974912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vwIS90KTAYpOv4j0HefuuVcmkKpAKknjXKXSf6SidZc=;
  b=bW5MbEO04+WRWUG7+0AtCwswUw6/aJTU3KYCFqgX9Hc/LSlHtv+eopbZ
   89FKIiZZSJYDw3Y5On74bgCr+0tBc+dEGUjzhZ8tGCmyQonSilufQ8DNN
   2gRlJXcBj66VgQyJHKldsJs4T6DSAlWegjP5wonAj6FCqX99uXYEkW6+H
   IijPZF6t0eNYjSIYQpXYxz7S4v/MkFnThBM5CHWIiIbOvphdw8+UYpBfb
   ylbPCdqvziYm5nbK+yMjCwg0pkB4GXGjt/On8+qIwgdutJh0zeJ1xwHuc
   6OzGePVN39UCWSBldfR43zQeAXIn/16gMELERl6QPE3thLDvDEwxJ/8ok
   w==;
X-CSE-ConnectionGUID: DiUjVxRGSOifga8dRqtgLg==
X-CSE-MsgGUID: fHcaOcsySriQkC8btK9klQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="46410634"
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="46410634"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 19:48:31 -0700
X-CSE-ConnectionGUID: zXq1QhBfRf6e7e1FGLR5bA==
X-CSE-MsgGUID: HXRbWvNLSgiJt7xnO11Cyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,260,1736841600"; 
   d="scan'208";a="123376605"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 Mar 2025 19:48:30 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv5xM-00008p-0y;
	Thu, 20 Mar 2025 02:48:28 +0000
Date: Thu, 20 Mar 2025 10:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2045/2045] arch/arm64/kvm/virtcca_cvm.c:810:5:
 warning: no previous prototype for function 'virtcca_get_tmi_version'
Message-ID: <202503201027.i8HE43EJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   961f596cd0017f5f254fb4b0ab9f5b9975177b84
commit: 86b9cab8c4752eb46e3ec038325aee5686805c69 [2045/2045] VirtCCA: an interface to retrieve the TMI version is added
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250320/202503201027.i8HE43EJ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503201027.i8HE43EJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503201027.i8HE43EJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/virtcca_cvm.c:5:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2253:
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
>> arch/arm64/kvm/virtcca_cvm.c:810:5: warning: no previous prototype for function 'virtcca_get_tmi_version' [-Wmissing-prototypes]
     810 | u64 virtcca_get_tmi_version(void)
         |     ^
   arch/arm64/kvm/virtcca_cvm.c:810:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     810 | u64 virtcca_get_tmi_version(void)
         | ^
         | static 
   arch/arm64/kvm/virtcca_cvm.c:1274:5: warning: no previous prototype for function 'cvm_arm_smmu_domain_set_kvm' [-Wmissing-prototypes]
    1274 | int cvm_arm_smmu_domain_set_kvm(struct device *dev, void *data)
         |     ^
   arch/arm64/kvm/virtcca_cvm.c:1274:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1274 | int cvm_arm_smmu_domain_set_kvm(struct device *dev, void *data)
         | ^
         | static 
   7 warnings generated.


vim +/virtcca_get_tmi_version +810 arch/arm64/kvm/virtcca_cvm.c

   809	
 > 810	u64 virtcca_get_tmi_version(void)
   811	{
   812		u64 res = tmi_version();
   813	
   814		if (res == SMCCC_RET_NOT_SUPPORTED)
   815			return 0;
   816		return res;
   817	}
   818	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
