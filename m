Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063A017BA4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 00:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711586209; cv=none; b=PlmwKO8TJqZdohoBdl28prgchrJKgUGLV/nnzyhrJ/S/Fn/CAts4JOgaAEDHfLkozMBXSnMjzD9uREorFrPTj8lBmD/9chI+phKiyv3yxEz531J93sdjaGYNCv5SCeumQsihITr3ulbi5nuUSw7iaIV2gIvZGVhJHBjUmp7Dpio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711586209; c=relaxed/simple;
	bh=I5gsSizcHQXRot/gd6GS4qUrZT/G9Rp+1OlToBz+tA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LpBHCRtm0i2h+hjn7WA++vtMnE1S1Tew2YZOlilYoqTMa4hTZTP6/KCj4H4678MxqKVll8KWWHSwlDcIR6ZdZujzVYtLavOdcRcGAnfvMFYpR6l4m8hdn59cdrHv8df4isdT+/JIN6mb208rqyO3Y1tBH8f0DvF/tE5POQk0MfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgAv8Gab; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgAv8Gab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711586208; x=1743122208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I5gsSizcHQXRot/gd6GS4qUrZT/G9Rp+1OlToBz+tA8=;
  b=fgAv8GabDDO+a+iBQwm/H/Mq2CHXFbJEsUflT5h0w4zhtSzhFdPt5sfl
   koWjD1paX4aseezn3heWIXdjO9XgGgNOkvSw5r4KPuCQYimUXIgfxcv5F
   IPbPDT5Fs4lR/1lFneYAvN5F8D+xEuHQkaqbuXIRSJr7AjHy+86Y3y235
   I5vMyj5kZIO4M5boLW/5DK+bIkjikWCszGM87oT2otvKIDBihqKMxRNs2
   7I84WwZ4orsgBCUASKKglU1xGf/6R2eKTF2tqmTfgbIW3gVbLZyMLTMkn
   Ne5GSRhnfBb3BnvVcjJqkz9S8UBvaW2zmC4ZOqkC/N93G5fH/H08Xv34U
   Q==;
X-CSE-ConnectionGUID: d6bgT5RyQbedIs7ORI+TTA==
X-CSE-MsgGUID: UKpPUhNzQu2CJvoNgUpoow==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6582405"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6582405"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 17:36:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="16376577"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Mar 2024 17:36:46 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpdl5-0001dq-2r;
	Thu, 28 Mar 2024 00:36:43 +0000
Date: Thu, 28 Mar 2024 08:36:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 264/377]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:971:5: warning: no previous
 prototype for function 'pci_read'
Message-ID: <202403280836.J2aJotbF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   9465fef4ae351749f7068da8c78af4ca27e61928
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [264/377] PCI: endpoint: Support NTB transfer between RC and EP
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240328/202403280836.J2aJotbF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403280836.J2aJotbF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403280836.J2aJotbF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/endpoint/functions/pci-epf-vntb.c:44:
   In file included from include/linux/pci-epc.h:12:
   In file included from include/linux/pci-epf.h:15:
   In file included from include/linux/pci.h:1508:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1608:
   include/linux/vmstat.h:436:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     436 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     437 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:443:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     443 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     444 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:455:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     455 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     456 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:464:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     464 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     465 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:971:5: warning: no previous prototype for function 'pci_read' [-Wmissing-prototypes]
     971 | int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
         |     ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:971:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     971 | int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
         | ^
         | static 
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:980:5: warning: no previous prototype for function 'pci_write' [-Wmissing-prototypes]
     980 | int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
         |     ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:980:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     980 | int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
         | ^
         | static 
   7 warnings generated.


vim +/pci_read +971 drivers/pci/endpoint/functions/pci-epf-vntb.c

   970	
 > 971	int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
   972	{
   973		if (devfn == 0) {
   974			memcpy(val, ((u8 *)pci_space) + where, size);
   975			return PCIBIOS_SUCCESSFUL;
   976		}
   977		return PCIBIOS_DEVICE_NOT_FOUND;
   978	}
   979	
 > 980	int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
   981	{
   982		return 0;
   983	}
   984	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
