Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001922595
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Feb 2024 07:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708758798; cv=none; b=FxxW7hZ4/N4ogerFxsuFScCpl33Dks17HHqIH8FEO6WqFsenQ+ouKyJBNU9nZAsWRtG9Tg64ev17nbXvlxv2w+ggaUawSWwxq42SkX2OJELWaLb0cSWBe4DLOR8EQwx9hfyWYmPGGqPkuoCZb+xAbDza2+zuack1NoTfRikuWXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708758798; c=relaxed/simple;
	bh=MrIqehvEcvubV63NuzjYODZDb89QtrP3tTfqjqKZ1so=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmN/Lq0mhRzo+hbXEe8xSJYrCvP1UtjkxXStC0G+GA1c+QONPgIQ09ZdcjZUIyFhEbWOmzKMGW9tDOJjOpjsAes8LlnZHc8PQvl3j9vczm87P1k6rEfCGrdl1bgZeYGZVMGhkUlo2iXdoQ15KheyqaxEW6DJOdx849fWfcKx1u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBDceB4V; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBDceB4V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708758796; x=1740294796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MrIqehvEcvubV63NuzjYODZDb89QtrP3tTfqjqKZ1so=;
  b=RBDceB4VBgGrBbIWeX2zU/PHNsONjiVq2dZeA5skovGg5YFb3SeuAZwk
   tzlRNppb3dZeSO6EnkV6pJav3WBBBWTI9YXKDSrtF3srl9zMUM0+Avdxy
   FNaP7s8ycc3YokxMvSZ7XpOmHhQcWta20I+GO5Gdu8fgmEndevp5CJtoa
   ZuWXcdWN/6jD63GtO+x4nvXoRV8EwoInY4iR7w5FKNkw13vz8fViG4z7/
   EVaEEEnezzloHHhH9iSSnYKHTZ1ZXz0c78k/q14UJ1e1QUu7xBGKMOOgi
   zsqHaHcywZk9uPNBsdM+D7eI+1v/UrbNHpLtdNT6ZsWBDxiFHBeR//cQ7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6882385"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6882385"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 23:13:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6064473"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Feb 2024 23:13:14 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdmDg-0008K4-00;
	Sat, 24 Feb 2024 07:13:12 +0000
Date: Sat, 24 Feb 2024 15:12:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, lishusen <lishusen2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3159/3388]
 arch/arm64/include/asm/kvm_mmu.h:221:undefined reference to
 `__kvm_nvhe_kvm_ncsnp_support'
Message-ID: <202402241512.XOiHdLOg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   0e6ac87df9e5122747ac5d9e7da9a45555f16374
commit: 625086f87673687dc420e79c9fedff0c2d65cb49 [3159/3388] KVM: arm64: Add support for probing Hisi ncsnp capability
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240224/202402241512.XOiHdLOg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241512.XOiHdLOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241512.XOiHdLOg-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: in function `__clean_dcache_guest_page':
>> arch/arm64/include/asm/kvm_mmu.h:221:(.hyp.text+0x6898): undefined reference to `__kvm_nvhe_kvm_ncsnp_support'
   aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__kvm_nvhe_kvm_ncsnp_support' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> arch/arm64/include/asm/kvm_mmu.h:221:(.hyp.text+0x6898): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: arch/arm64/include/asm/kvm_mmu.h:221:(.hyp.text+0x689c): undefined reference to `__kvm_nvhe_kvm_ncsnp_support'
   aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: in function `kvm_pgtable_stage2_flush':
>> arch/arm64/kvm/hyp/nvhe/../pgtable.c:1345:(.hyp.text+0x10554): undefined reference to `__kvm_nvhe_kvm_ncsnp_support'
   aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `__kvm_nvhe_kvm_ncsnp_support' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> arch/arm64/kvm/hyp/nvhe/../pgtable.c:1345:(.hyp.text+0x10554): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: arch/arm64/kvm/hyp/nvhe/../pgtable.c:1345:(.hyp.text+0x1056c): undefined reference to `__kvm_nvhe_kvm_ncsnp_support'


vim +221 arch/arm64/include/asm/kvm_mmu.h

   212	
   213	static inline void __clean_dcache_guest_page(void *va, size_t size)
   214	{
   215		/*
   216		 * With FWB, we ensure that the guest always accesses memory using
   217		 * cacheable attributes, and we don't have to clean to PoC when
   218		 * faulting in pages. Furthermore, FWB implies IDC, so cleaning to
   219		 * PoU is not required either in this case.
   220		 */
 > 221		if (kvm_ncsnp_support || cpus_have_const_cap(ARM64_HAS_STAGE2_FWB))
   222			return;
   223	
   224		kvm_flush_dcache_to_poc(va, size);
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
