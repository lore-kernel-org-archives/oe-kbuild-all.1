Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EE21A5B8A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 04:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786768471; cv=none; b=boj+2C/e53WyzaGmW5xk3oDN1X+VSekrcjdUDy1wcfS7e/Qt4x5JTSybogIwwUVJzkYI3VGwaVqGtOCuHxA5R307BOOKjMDXx8CunsSxscWSWnUf5lNUrWpyle7ZmXDkUXcd25gD1kgLuh/MDa/AwuqhRqcEm3fe9M4UJdU6ShA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786768471; c=relaxed/simple;
	bh=1wep+D2LMwSSAhrn1KFY1OHcVC0Hy1/zmvMZeUSAiDU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JFhAfIVNhMwVRcqx1zwFzkiCEBMyOWr0IODjGwElqDTVWIVdbm+nysweo3gM9RwQNnWjz4NBmmY5HchqDoxE9khb/jSbu03WwspsXyI2hjGdl4mz3mY5CrqWKtgCGjti3dghVZIWSsizvtBkINfFWk34rYvFR9KXwbEn7MYTUsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNVfcLbC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNVfcLbC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786768468; x=1818304468;
  h=date:from:to:cc:subject:message-id;
  bh=1wep+D2LMwSSAhrn1KFY1OHcVC0Hy1/zmvMZeUSAiDU=;
  b=lNVfcLbCKSil1q720DioN3veFWtTbRg1iesZOnqlmRFjLZdTBwbyxuJq
   Xp1AHSjS0N81WBduoNaKJ/Eg0mJNgda2tI1GG2gwMuHvfB61q/cONCagv
   B2ZcaKv6nB8KfAwU99KaNaoxAPGSrqoGyLMsaf8cdgtKnZ/iviqr6bcAm
   7ZAgM5umnLdzl2rYYMbZHjV7nKJFsw9vWIcvEsaczm45MmNt6tHkoYAhF
   u4LjE5Ic1VKUdu5+WhLUN5wKYptCqEUPxfaMdxJ+yKzhHrU6UK3Ysaqgl
   e0y7AuiV1Gmd6ukdmzH1dCWNsjCjBnnMZ8KwJBtSi1uQKMCm16aU0rPgt
   g==;
X-CSE-ConnectionGUID: wU5PEuciSQWRkp46v7VONw==
X-CSE-MsgGUID: Gl+8941BSZqg3dzaSkRjvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="104874164"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="104874164"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 21:34:27 -0700
X-CSE-ConnectionGUID: 3LM0zfbqRPyijKSo9h6bcA==
X-CSE-MsgGUID: /M72Hc4hQJe1kS0DlOJ0zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="261119276"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Aug 2026 21:34:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv66C-00000000b80-1WTU;
	Sat, 15 Aug 2026 04:34:24 +0000
Date: Sat, 15 Aug 2026 12:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/212]
 arch/x86/kvm/svm/sev.c:2256:3-19: opportunity for
 str_enabled_disabled(sev_es_supported)
Message-ID: <202608151255.MHUMFkbd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   88ff6fc3ff2d7717a7cff52af211ca62e0985ac2
commit: 2f7efda53a0a8b462fdd217e732147d7611befe2 [0/212] KVM: SVM: enhance info printk's in SEV init
config: i386-randconfig-051-20260815 (https://download.01.org/0day-ci/archive/20260815/202608151255.MHUMFkbd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608151255.MHUMFkbd-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kvm/svm/sev.c:2256:3-19: opportunity for str_enabled_disabled(sev_es_supported)
   arch/x86/kvm/svm/sev.c:2252:3-16: opportunity for str_enabled_disabled(sev_supported)

vim +2256 arch/x86/kvm/svm/sev.c

  2164	
  2165	void __init sev_hardware_setup(void)
  2166	{
  2167	#ifdef CONFIG_KVM_AMD_SEV
  2168		unsigned int eax, ebx, ecx, edx, sev_asid_count, sev_es_asid_count;
  2169		bool sev_es_supported = false;
  2170		bool sev_supported = false;
  2171	
  2172		if (!sev_enabled || !npt_enabled)
  2173			goto out;
  2174	
  2175		/*
  2176		 * SEV must obviously be supported in hardware.  Sanity check that the
  2177		 * CPU supports decode assists, which is mandatory for SEV guests to
  2178		 * support instruction emulation.
  2179		 */
  2180		if (!boot_cpu_has(X86_FEATURE_SEV) ||
  2181		    WARN_ON_ONCE(!boot_cpu_has(X86_FEATURE_DECODEASSISTS)))
  2182			goto out;
  2183	
  2184		/* Retrieve SEV CPUID information */
  2185		cpuid(0x8000001f, &eax, &ebx, &ecx, &edx);
  2186	
  2187		/* Set encryption bit location for SEV-ES guests */
  2188		sev_enc_bit = ebx & 0x3f;
  2189	
  2190		/* Maximum number of encrypted guests supported simultaneously */
  2191		max_sev_asid = ecx;
  2192		if (!max_sev_asid)
  2193			goto out;
  2194	
  2195		/* Minimum ASID value that should be used for SEV guest */
  2196		min_sev_asid = edx;
  2197		sev_me_mask = 1UL << (ebx & 0x3f);
  2198	
  2199		/*
  2200		 * Initialize SEV ASID bitmaps. Allocate space for ASID 0 in the bitmap,
  2201		 * even though it's never used, so that the bitmap is indexed by the
  2202		 * actual ASID.
  2203		 */
  2204		nr_asids = max_sev_asid + 1;
  2205		sev_asid_bitmap = bitmap_zalloc(nr_asids, GFP_KERNEL);
  2206		if (!sev_asid_bitmap)
  2207			goto out;
  2208	
  2209		sev_reclaim_asid_bitmap = bitmap_zalloc(nr_asids, GFP_KERNEL);
  2210		if (!sev_reclaim_asid_bitmap) {
  2211			bitmap_free(sev_asid_bitmap);
  2212			sev_asid_bitmap = NULL;
  2213			goto out;
  2214		}
  2215	
  2216		sev_asid_count = max_sev_asid - min_sev_asid + 1;
  2217		if (misc_cg_set_capacity(MISC_CG_RES_SEV, sev_asid_count))
  2218			goto out;
  2219	
  2220		sev_supported = true;
  2221	
  2222		/* SEV-ES support requested? */
  2223		if (!sev_es_enabled)
  2224			goto out;
  2225	
  2226		/*
  2227		 * SEV-ES requires MMIO caching as KVM doesn't have access to the guest
  2228		 * instruction stream, i.e. can't emulate in response to a #NPF and
  2229		 * instead relies on #NPF(RSVD) being reflected into the guest as #VC
  2230		 * (the guest can then do a #VMGEXIT to request MMIO emulation).
  2231		 */
  2232		if (!enable_mmio_caching)
  2233			goto out;
  2234	
  2235		/* Does the CPU support SEV-ES? */
  2236		if (!boot_cpu_has(X86_FEATURE_SEV_ES))
  2237			goto out;
  2238	
  2239		/* Has the system been allocated ASIDs for SEV-ES? */
  2240		if (min_sev_asid == 1)
  2241			goto out;
  2242	
  2243		sev_es_asid_count = min_sev_asid - 1;
  2244		if (misc_cg_set_capacity(MISC_CG_RES_SEV_ES, sev_es_asid_count))
  2245			goto out;
  2246	
  2247		sev_es_supported = true;
  2248	
  2249	out:
  2250		if (boot_cpu_has(X86_FEATURE_SEV))
  2251			pr_info("SEV %s (ASIDs %u - %u)\n",
  2252				sev_supported ? "enabled" : "disabled",
  2253				min_sev_asid, max_sev_asid);
  2254		if (boot_cpu_has(X86_FEATURE_SEV_ES))
  2255			pr_info("SEV-ES %s (ASIDs %u - %u)\n",
> 2256				sev_es_supported ? "enabled" : "disabled",
  2257				min_sev_asid > 1 ? 1 : 0, min_sev_asid - 1);
  2258	
  2259		sev_enabled = sev_supported;
  2260		sev_es_enabled = sev_es_supported;
  2261	#endif
  2262	}
  2263	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
