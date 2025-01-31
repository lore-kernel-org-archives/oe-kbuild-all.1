Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71ABD199223
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 23:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738367863; cv=none; b=Ja+yTCw1pqSvOg8i5AgYpaC6+qFVOPET8BCSMvcidmSZiiWr1xWlTNcI1Gja5BQnDgSCvZiiSl0lLlMRMU4X5YJIcob3+snuTYuViBBF9m4W3RMDLXtr2CNzubBjJKFogXC8/oz0sYkn6V5iBwSALnF5mc2PSl4n+EuajwWlNiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738367863; c=relaxed/simple;
	bh=ZUVR4QPX+OhbzKJBm9jSMUq+qukolW/bk/NXfcv3XO8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fHKYzyBInU6oQoXfEOpFA+HhJ3OtgXJoOrCn1C+0x2pK0HxNL7eIFXOag1cSWHDxLcHEE8g3katg7BCnzrNxwOb0K7ZM61lnfHE/y8hdbIs6aNoJjAtmAA8jo0n5SLoE1n2SLyZDEbv8H64bM0XTkQnd9/Z2L/DYacSfnSUXFvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bpp2+OEp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bpp2+OEp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738367861; x=1769903861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZUVR4QPX+OhbzKJBm9jSMUq+qukolW/bk/NXfcv3XO8=;
  b=Bpp2+OEpAcX3ub7zdcx2ArO3IKU6rKW3bfUoeo5N00Hwls1JIbikSK1s
   7rlAsFIf98u22mvUJdc1RZ6VQJsjk+c2n+KuahBq4KTd4PaJxBBYRR8iE
   StyK5uEOd0WkBhh56pyj+m8FcpYbasPriPU6iM2loKfPaKSCTyN7nHdHO
   +8eOWtqNucSTcwyjVSPnI/PYBN8hWLF5S9Lmjfslj0CxvGVNev2GelvC9
   4MDkT3MGPjxcTHUxtsUOoXlEyZXS/sjYJb76fjQQ0bnrkiCUZV0DIDOBz
   KNlFMeVTnKbHWohh3fPm2a1IgwaKpD74RAvLqjDG+ZxZtye04beeQeNgy
   w==;
X-CSE-ConnectionGUID: 7bLkrjnURRSZBIxUitEv1g==
X-CSE-MsgGUID: 4QHC7KbzQO2rza5hkmjWsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="26550634"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="26550634"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 15:57:40 -0800
X-CSE-ConnectionGUID: iunb5vPrRoKqfXyw5OiX3A==
X-CSE-MsgGUID: 4/W60vvPQdmRYgloZXu0nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140647304"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jan 2025 15:57:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te0tE-000nRX-2T;
	Fri, 31 Jan 2025 23:57:36 +0000
Date: Sat, 1 Feb 2025 07:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/3] fs/proc/task_mmu.c:1858:8:
 warning: no previous prototype for function '__pagemap_lseek'
Message-ID: <202502010756.izdzfmf6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   807ce3b4f02f37ed863053f05604ba866e8847a9
commit: 0715c0e2078d5e9bf1b2da50fae4a738cd346016 [3/3] ANDROID: 16K: Emulate /proc/pid/pagemap
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250201/202502010756.izdzfmf6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010756.izdzfmf6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010756.izdzfmf6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/proc/task_mmu.c:2:
   In file included from include/linux/pagewalk.h:5:
   In file included from include/linux/mm.h:2238:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/proc/task_mmu.c:3:
   include/linux/mm_inline.h:49:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:51:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      51 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> fs/proc/task_mmu.c:1858:8: warning: no previous prototype for function '__pagemap_lseek' [-Wmissing-prototypes]
    1858 | loff_t __pagemap_lseek(struct file *file, loff_t offset, int orig)
         |        ^
   fs/proc/task_mmu.c:1858:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1858 | loff_t __pagemap_lseek(struct file *file, loff_t offset, int orig)
         | ^
         | static 
   4 warnings generated.


vim +/__pagemap_lseek +1858 fs/proc/task_mmu.c

  1857	
> 1858	loff_t __pagemap_lseek(struct file *file, loff_t offset, int orig)
  1859	{
  1860		unsigned long nr_subpages = __PAGE_SIZE / PAGE_SIZE;
  1861		loff_t ret;
  1862	
  1863		/*
  1864		 * Userspace thinks the pages are larger than they actually are, so adjust the
  1865		 * offset to compensate.
  1866		 */
  1867		offset *= nr_subpages;
  1868	
  1869		ret = mem_lseek(file, offset, orig);  /* borrow this */
  1870		if (ret < 0)
  1871			return offset;
  1872	
  1873		/* Re-adjust the offset to reflect the larger userspace page size. */
  1874		return ret / nr_subpages;
  1875	}
  1876	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
