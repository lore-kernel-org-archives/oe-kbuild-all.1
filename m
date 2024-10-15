Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF9015B96E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 02:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728958165; cv=none; b=EVojJqSAb6xSpIOaxjAnjwYcBkYJTIbbBj/ukiW0tTRKB3pBCunzxcRrLH3y8mAUIpXPk7p8FHEGbvM45NERuwzGEGzbdhL1GfH8eRAy5hAv4G9YgUfNa4abo6synydn+HdMt0rXG22JpUjUMNIWR18B2dVoPwPqLr7iDAJuBNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728958165; c=relaxed/simple;
	bh=6/biJVrO0Kq4jJkQlKahZHNeM0RWfPMfVjtLaNJ6iCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m3blqZvxlBhpVibckJY5ctOpRISvE9sMERwvSPz4Az9tMAm7tBasSsb0BsJSeGML7v1SL/p6GDGgU43TMXHrGJnRwopeMDT10ARMmp5ORjVWnO2SYCket4zi238+2707nUNn9SOCm6xUHCKMn1qkcKyM9nRyXL4H8z6xeWZtHXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWmnEPzD; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWmnEPzD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728958164; x=1760494164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6/biJVrO0Kq4jJkQlKahZHNeM0RWfPMfVjtLaNJ6iCs=;
  b=QWmnEPzDNDHxMVRJonja1qrO9x8GKWukO/5C3nCcUB8QK3oeyETfgXZ0
   Z48HIpk5CZ1WCBzEfjVQvjyw3r6/7z/2YYDUcPj5/HycsEAxKBR1jBwg7
   ocNBwcinLlcvr3XD8KUHJClj2MYlMvD16T+YV2C9F+vGKo9H0Zp74AtzI
   jtJkfvmbuGx6j7oiUIgmvTAkzw0lIXUcmS3z3IAaM1z6JNai5+CNIesWQ
   Nmt1+LrJhZyUAIzJthnZqa2NlPmyQhzCqZwrKs/DbBTdhwkGsZ5GieNp4
   juiXV+t0F9bqaGJRssB0S9ogbtu/LIC7eXPUg7fBOFo1Wk/xQ4mB/UQ3q
   w==;
X-CSE-ConnectionGUID: E3isSsDATpKEiQ347jckww==
X-CSE-MsgGUID: LD4+hM7ZQ6SKBxC5rnP1rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="32129043"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="32129043"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 19:09:21 -0700
X-CSE-ConnectionGUID: NmvSOUHKTV+JvIlJ8gzTBA==
X-CSE-MsgGUID: TlyWFnHgTwqLRDGTv2suEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="108517072"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Oct 2024 19:09:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Wzt-000HTR-36;
	Tue, 15 Oct 2024 02:09:17 +0000
Date: Tue, 15 Oct 2024 10:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:dma-mapping-includes 1/1]
 arch/powerpc/platforms/pseries/svm.c:40:5: warning: no previous prototype
 for function 'set_memory_encrypted'
Message-ID: <202410151038.nnrI5kEb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git dma-mapping-includes
head:   25ad82fc5f00839074ac2f433dd151b6d80f75bd
commit: 25ad82fc5f00839074ac2f433dd151b6d80f75bd [1/1] dma-mapping.h: drop unneeded includes
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241015/202410151038.nnrI5kEb-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151038.nnrI5kEb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151038.nnrI5kEb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/platforms/pseries/svm.c:9:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/platforms/pseries/svm.c:40:5: warning: no previous prototype for function 'set_memory_encrypted' [-Wmissing-prototypes]
      40 | int set_memory_encrypted(unsigned long addr, int numpages)
         |     ^
   arch/powerpc/platforms/pseries/svm.c:40:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      40 | int set_memory_encrypted(unsigned long addr, int numpages)
         | ^
         | static 
>> arch/powerpc/platforms/pseries/svm.c:53:5: warning: no previous prototype for function 'set_memory_decrypted' [-Wmissing-prototypes]
      53 | int set_memory_decrypted(unsigned long addr, int numpages)
         |     ^
   arch/powerpc/platforms/pseries/svm.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      53 | int set_memory_decrypted(unsigned long addr, int numpages)
         | ^
         | static 
   6 warnings generated.


vim +/set_memory_encrypted +40 arch/powerpc/platforms/pseries/svm.c

2efbc58f157a39 Anshuman Khandual 2019-08-19  39  
2efbc58f157a39 Anshuman Khandual 2019-08-19 @40  int set_memory_encrypted(unsigned long addr, int numpages)
2efbc58f157a39 Anshuman Khandual 2019-08-19  41  {
e9d1d2bb75b2d5 Tom Lendacky      2021-09-08  42  	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
a449ffaf9181b5 Will Deacon       2021-07-30  43  		return 0;
a449ffaf9181b5 Will Deacon       2021-07-30  44  
2efbc58f157a39 Anshuman Khandual 2019-08-19  45  	if (!PAGE_ALIGNED(addr))
2efbc58f157a39 Anshuman Khandual 2019-08-19  46  		return -EINVAL;
2efbc58f157a39 Anshuman Khandual 2019-08-19  47  
2efbc58f157a39 Anshuman Khandual 2019-08-19  48  	uv_unshare_page(PHYS_PFN(__pa(addr)), numpages);
2efbc58f157a39 Anshuman Khandual 2019-08-19  49  
2efbc58f157a39 Anshuman Khandual 2019-08-19  50  	return 0;
2efbc58f157a39 Anshuman Khandual 2019-08-19  51  }
2efbc58f157a39 Anshuman Khandual 2019-08-19  52  
2efbc58f157a39 Anshuman Khandual 2019-08-19 @53  int set_memory_decrypted(unsigned long addr, int numpages)
2efbc58f157a39 Anshuman Khandual 2019-08-19  54  {
e9d1d2bb75b2d5 Tom Lendacky      2021-09-08  55  	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
a449ffaf9181b5 Will Deacon       2021-07-30  56  		return 0;
a449ffaf9181b5 Will Deacon       2021-07-30  57  
2efbc58f157a39 Anshuman Khandual 2019-08-19  58  	if (!PAGE_ALIGNED(addr))
2efbc58f157a39 Anshuman Khandual 2019-08-19  59  		return -EINVAL;
2efbc58f157a39 Anshuman Khandual 2019-08-19  60  
2efbc58f157a39 Anshuman Khandual 2019-08-19  61  	uv_share_page(PHYS_PFN(__pa(addr)), numpages);
2efbc58f157a39 Anshuman Khandual 2019-08-19  62  
2efbc58f157a39 Anshuman Khandual 2019-08-19  63  	return 0;
2efbc58f157a39 Anshuman Khandual 2019-08-19  64  }
2efbc58f157a39 Anshuman Khandual 2019-08-19  65  

:::::: The code at line 40 was first introduced by commit
:::::: 2efbc58f157a39ad9e9199b92d9c47736023a2fe powerpc/pseries/svm: Force SWIOTLB for secure guests

:::::: TO: Anshuman Khandual <khandual@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
