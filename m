Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D10B2165E0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 09:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733737466; cv=none; b=YRDBYnAD24fuOpi/xVhkUoI/Rl66iAPLNP2OZwwrdk+6s8POB1GXVfQZvgpk6PI8+n30DmGoYZyjofbgYgxQbRgI/2Hzcr1XRlNU3WruYScqbheXpmsyRsJJRu+kkFYrcxPrtIBEzqhPMyAZv3SQmxxSSNYsIcy5DZdi9zUV8S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733737466; c=relaxed/simple;
	bh=50VnaV6esW/rGeeXcyaxCd6U51kEeyIJ9zejKMUHsyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZqlUuZHP9yVrEQ6sjoC4dHifgA+V+ZHkh8CTmJFDHL5ZfcjxCrItYr7vaGQH0iU4xFOX3rJ7wZ9cDzmALJNxEIpBTuIM+M/6/qU6ZyxH1LeZALet0lIgTB7i3u2my6ab0jbM9If9oVF3WDo4Mcxucg6Bb4UYPtLUywb5wrfs6ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WNVUEOo6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WNVUEOo6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733737464; x=1765273464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=50VnaV6esW/rGeeXcyaxCd6U51kEeyIJ9zejKMUHsyc=;
  b=WNVUEOo6CGbIvUl302lvVQ3x9I2t00Yn19+rSASeW7DwCNCxQDBx6o19
   yjzlPeYM371PNwvFX90joOcAaDU+J9vLTjlplNwYbwPbIsqaptC9dV1gF
   +2rYl1RfMjSUQxo8VHl+mKrEavFhrgs6UjhS/NIpBO5851WD8yPfM+ifo
   vq/MofCJGO1e6PHzT7rYXCp429VmMIXstDCTXOPE4sXGjdpmUe/xq+ZFB
   iUuog8mfXbaVaKbl311UFr0cp2ibMl4T6MkW4RWtqcqTQOzdEk2jZz1BP
   QN6P7Cy+qSqb6h27hX9ZdC0T4COc3xTsvdR8loSZBxdv+MQ+vydT1sOnS
   w==;
X-CSE-ConnectionGUID: C68wH8ScSbKsh1eyvpo3jg==
X-CSE-MsgGUID: 1T8+GqGETEifOIq4SxTcCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="21615229"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="21615229"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 01:44:23 -0800
X-CSE-ConnectionGUID: 4b0RnQrkRmSX2hhR6+Dx8w==
X-CSE-MsgGUID: k7E8L3KWQIKv+9ww2mmJ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="95359943"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Dec 2024 01:44:22 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKaJP-0004BZ-2A;
	Mon, 09 Dec 2024 09:44:19 +0000
Date: Mon, 9 Dec 2024 17:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, hanliyang <hanliyang@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1609/1609] arch/x86/kvm/svm/sev.c:2198:6:
 warning: no previous prototype for function 'sev_install_hooks'
Message-ID: <202412091737.uk2gKO2t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   31c4fffa86e17e8a946c944e91e7412db7f8427b
commit: 0f13b8634792cff1f2fb18bf35e5a24d7a8cbf8e [1609/1609] KVM: x86: Support VM_ATTESTATION hypercall
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241209/202412091737.uk2gKO2t-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091737.uk2gKO2t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091737.uk2gKO2t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/svm/sev.c:12:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2234:
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
>> arch/x86/kvm/svm/sev.c:2198:6: warning: no previous prototype for function 'sev_install_hooks' [-Wmissing-prototypes]
    2198 | void sev_install_hooks(void)
         |      ^
   arch/x86/kvm/svm/sev.c:2198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2198 | void sev_install_hooks(void)
         | ^
         | static 
   6 warnings generated.
--
   In file included from arch/x86/kvm/svm/csv.c:10:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2234:
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
>> arch/x86/kvm/svm/csv.c:30:5: warning: no previous prototype for function 'csv_vm_attestation' [-Wmissing-prototypes]
      30 | int csv_vm_attestation(struct kvm *kvm, unsigned long gpa, unsigned long len)
         |     ^
   arch/x86/kvm/svm/csv.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      30 | int csv_vm_attestation(struct kvm *kvm, unsigned long gpa, unsigned long len)
         | ^
         | static 
   6 warnings generated.


vim +/sev_install_hooks +2198 arch/x86/kvm/svm/sev.c

  2195	
  2196	#ifdef CONFIG_HYGON_CSV
  2197	/* Code to set all of the function and vaiable pointers */
> 2198	void sev_install_hooks(void)
  2199	{
  2200		hygon_kvm_hooks.sev_issue_cmd = sev_issue_cmd;
  2201		hygon_kvm_hooks.get_num_contig_pages = get_num_contig_pages;
  2202		hygon_kvm_hooks.sev_pin_memory = sev_pin_memory;
  2203		hygon_kvm_hooks.sev_unpin_memory = sev_unpin_memory;
  2204	
  2205		hygon_kvm_hooks.sev_hooks_installed = true;
  2206	}
  2207	#endif
  2208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
