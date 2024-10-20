Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF4546BA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Oct 2024 08:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729412910; cv=none; b=cSJr0faidpndfB6VwrQYxSZSbgVyuNKMaUkB40s6dxR9RekA9VgbCtKcrAb4FVd63QedBt5FKPob0LoLhBsNmqBmuJ+TDXR3ymyT1631tpTe3bbLJ8URgMlM4TBm1f+s12afoiLnyKzywbroNo78rxsY2FbihIZOS+8+0Bq68P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729412910; c=relaxed/simple;
	bh=/cT6BI1iZScd2m17ZduRMWM9SIm99M1uuzul/DbWnjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PpFrHtlXNEwVZa9vinSYGW+BPrVHIKgS+edVN/OHEcR5FVFXhPEM9Qbv+A0E30bzzsg5dtcORPk92lk3bD30cWj8xSylPENMIKfGTTvb1lmacoPGnl/lqFEL/+PLu3zvdrs4Nu9Z74Epy99HqrgE3466n7yuRSeTk+TeGJmZbGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IzU7la/g; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IzU7la/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729412908; x=1760948908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/cT6BI1iZScd2m17ZduRMWM9SIm99M1uuzul/DbWnjc=;
  b=IzU7la/g9yVScr174q7mLlt7Q7uAgBjWG+wa8qRaSk/TjzpjefaoVKnP
   lPRdNz7NQu0d/b+lB5bqtfGc9NQpJGcbxpWRdTp/XgFyaYCEWwFWR2Q0m
   zje58MolLRhG7stbndTfcnd3X8rUxq90JwVzR285yf1YEa+hLDmBa7gV1
   q+APaLfJzZd0LQvH/k73toSD0l6+rMR1Bf8vHzgRGkCBAJD+bVoloynr5
   8H13I3Cyf6a5/jBjqFZWjWfEwzx7mrWKcw0+HmGqkq3pLU9FsI/lMcScs
   4hgf7uKM52yzt38Q68MC8GvupfhcWy79JFidoSIPIfFaPPNyyesGe4uzP
   g==;
X-CSE-ConnectionGUID: AQ/YdJ1iSzuCspr5jaL+mw==
X-CSE-MsgGUID: LHrP1LvURcWaMUpy/bKaSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40032383"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40032383"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 01:28:28 -0700
X-CSE-ConnectionGUID: BomxacGiSdmFleWLmVEp0Q==
X-CSE-MsgGUID: 0p80smYORpiTrT6F81uP3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,218,1725346800"; 
   d="scan'208";a="83871985"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Oct 2024 01:28:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2RIW-000Q6n-12;
	Sun, 20 Oct 2024 08:28:24 +0000
Date: Sun, 20 Oct 2024 16:28:23 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:virtio-mem-s390x 14/14]
 arch/s390/kernel/crash_dump.c:642:undefined reference to
 `vmcore_get_device_ram_ranges'
Message-ID: <202410201603.upXbGchA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux virtio-mem-s390x
head:   9f9732a9a04b8623dfd458cc40f05a50538add7e
commit: 9f9732a9a04b8623dfd458cc40f05a50538add7e [14/14] s390/crash_dump: consider device RAM ranges when building elfcore hdr
config: s390-randconfig-r113-20241019 (https://download.01.org/0day-ci/archive/20241020/202410201603.upXbGchA-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241020/202410201603.upXbGchA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410201603.upXbGchA-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: arch/s390/kernel/crash_dump.o: in function `elfcorehdr_alloc':
>> arch/s390/kernel/crash_dump.c:642:(.text+0xe6e): undefined reference to `vmcore_get_device_ram_ranges'
>> s390-linux-ld: arch/s390/kernel/crash_dump.c:655:(.text+0xf90): undefined reference to `vmcore_free_device_ram_ranges'
   s390-linux-ld: arch/s390/kernel/crash_dump.c:696:(.text+0x14a8): undefined reference to `vmcore_free_device_ram_ranges'


vim +642 arch/s390/kernel/crash_dump.c

   614	
   615	/*
   616	 * Create ELF core header (new kernel)
   617	 */
   618	int elfcorehdr_alloc(unsigned long long *addr, unsigned long long *size)
   619	{
   620		Elf64_Phdr *phdr_notes, *phdr_loads, *phdr_text;
   621		int mem_chunk_cnt, phdr_text_cnt, phdr_cnt;
   622		LIST_HEAD(device_ram_ranges);
   623		size_t alloc_size;
   624		void *ptr, *hdr;
   625		u64 hdr_off;
   626		int rc;
   627	
   628		/* If we are not in kdump or zfcp/nvme dump mode return */
   629		if (!s390_dump_available())
   630			return 0;
   631		/* If we cannot get HSA size for zfcp/nvme dump return error */
   632		if (is_ipl_type_dump() && !sclp.hsa_size)
   633			return -ENODEV;
   634	
   635		/* For kdump, exclude previous crashkernel memory */
   636		if (oldmem_data.start) {
   637			oldmem_region.base = oldmem_data.start;
   638			oldmem_region.size = oldmem_data.size;
   639			oldmem_type.total_size = oldmem_data.size;
   640		}
   641	
 > 642		rc = vmcore_get_device_ram_ranges(&device_ram_ranges);
   643		if (rc)
   644			return rc;
   645	
   646		mem_chunk_cnt = get_mem_chunk_cnt(&device_ram_ranges);
   647		phdr_text_cnt = os_info_has_vm() ? 1 : 0;
   648	
   649		/*
   650		 * See ehdr_init(), we have to fit all PT_LOAD + one PT_NONE into
   651		 * into Elf32_Half.
   652		 */
   653		phdr_cnt = mem_chunk_cnt + phdr_text_cnt;
   654		if ((Elf32_Half)(phdr_cnt + 1) != (phdr_cnt + 1)) {
 > 655			vmcore_free_device_ram_ranges(&device_ram_ranges);
   656			pr_err("s390 kdump: too many memory chunks");
   657			return -ENOSPC;
   658		}
   659	
   660		alloc_size = get_elfcorehdr_size(phdr_cnt);
   661	
   662		hdr = kzalloc(alloc_size, GFP_KERNEL);
   663	
   664		/*
   665		 * Without elfcorehdr /proc/vmcore cannot be created. Thus creating
   666		 * a dump with this crash kernel will fail. Panic now to allow other
   667		 * dump mechanisms to take over.
   668		 */
   669		if (!hdr)
   670			panic("s390 kdump allocating elfcorehdr failed");
   671	
   672		/* Init elf header */
   673		phdr_notes = ehdr_init(hdr, phdr_cnt);
   674		/* Init program headers */
   675		if (phdr_text_cnt) {
   676			phdr_text = phdr_notes + 1;
   677			phdr_loads = phdr_text + 1;
   678		} else {
   679			phdr_loads = phdr_notes + 1;
   680		}
   681		ptr = PTR_ADD(phdr_loads, sizeof(Elf64_Phdr) * mem_chunk_cnt);
   682		/* Init notes */
   683		hdr_off = PTR_DIFF(ptr, hdr);
   684		ptr = notes_init(phdr_notes, ptr, ((unsigned long) hdr) + hdr_off);
   685		/* Init kernel text program header */
   686		if (phdr_text_cnt)
   687			text_init(phdr_text);
   688		/* Init loads */
   689		loads_init(phdr_loads, phdr_text_cnt, &device_ram_ranges);
   690		/* Finalize program headers */
   691		hdr_off = PTR_DIFF(ptr, hdr);
   692		*addr = (unsigned long long) hdr;
   693		*size = (unsigned long long) hdr_off;
   694		BUG_ON(elfcorehdr_size > alloc_size);
   695	
   696		vmcore_free_device_ram_ranges(&device_ram_ranges);
   697		return 0;
   698	}
   699	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
