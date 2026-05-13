Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9863E5A15
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 May 2026 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663952; cv=none; b=uS+vuI6nFjHzGmINtywqUuaTKM/dfEAqbJPpoKoTjlsLuntj72lsJ9lMRnwEBmWug4mM5XO+LMetEjV62rq/YMyRCAkg/M9jHoAr/+z2U5y2UO9QJHDrJX2t8RT9yHVcQ+UjV5qFnLL5Nb3bQTG1WxHRQ0htnNEzP5+oobUOffc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663952; c=relaxed/simple;
	bh=PM8GKtSgTrpCQIVhexgHFvvi/AClOvRjAUf72f8kt14=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uytI2YIzrIuoj9HXNkl8xlwKidtseDtbEvjbQkNrj0069V0NSt6v7CRX1C/6wyo4pZ3xtqRkT5+Kin7ym94dfd02m56AdVKNLyMIEdTC4Pt/3Y8bGH0nFrqmcCwVR29Cd42/7xvZAHTm+Q7kds3kjGBHU+JZ3tBDD6vB0hepWNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7GxbKpf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7GxbKpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778663950; x=1810199950;
  h=date:from:to:cc:subject:message-id;
  bh=PM8GKtSgTrpCQIVhexgHFvvi/AClOvRjAUf72f8kt14=;
  b=h7GxbKpfflIuLeF7iQmhug5jpx7zQb/CEFWt9+z5VLaWH7sQBu3lF/A8
   5J5YLs7wyEbjMM2mA8IRwH62Ascwinxe+Oi1FDShpfuTEYFld5UOQ6Tpz
   wUnTkxDv2nY5koe79aoUMqOxeD81cvJDQYExZnM1PZrErSkGPiRc2RzGm
   XjaBvnS3KYY3QO4D8sH/KV56cv3Rw28e7h+28U2Rva0charg7/vGjrsXv
   MY8qmrfCgrYusLBFFAxfvMjf0gl2s0+/wbs4KheiA+NEjYfGLA6hp6iJC
   moAKPIZ5sajQ67oZwNkXX5IjEmIvWKteitmcfwX+w89I+ZRcfguFJiiYZ
   A==;
X-CSE-ConnectionGUID: 9sUzLQAkT/OX+5TJMgz36w==
X-CSE-MsgGUID: tO5EUT5tSgaukRE47l6FSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79481179"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79481179"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 02:19:10 -0700
X-CSE-ConnectionGUID: D/xfMw0hQ0+/r1j9FvZiuA==
X-CSE-MsgGUID: hc/xlfG/T8Gogh+dxvsjwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="238128391"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 May 2026 02:19:09 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN5kA-000000003p5-0OZk;
	Wed, 13 May 2026 09:19:06 +0000
Date: Wed, 13 May 2026 17:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/gpc_fixes_and_guards 12/20]
 arch/x86/kvm/xen.c:49:5-11: inconsistent IS_ERR and PTR_ERR on line 50.
Message-ID: <202605131720.TBrR9ZMY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/gpc_fixes_and_guards
head:   ef1614436582b3a9e759efbd958380d753e9b96c
commit: 33299209b059fef3295249530e86e460fb1fab4d [12/20] KVM: x86/xen: Convert kvm_xen_shared_info_init() to gpc's CLASS() APIs
config: i386-randconfig-052-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131720.TBrR9ZMY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605131720.TBrR9ZMY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kvm/xen.c:49:5-11: inconsistent IS_ERR and PTR_ERR on line 50.

vim +49 arch/x86/kvm/xen.c

    37	
    38	static int __kvm_xen_shared_info_init(struct kvm *kvm)
    39	{
    40		struct gfn_to_pfn_cache *gpc = &kvm->arch.xen.shinfo_cache;
    41		struct pvclock_wall_clock *wc;
    42		u32 *wc_sec_hi;
    43		u32 wc_version;
    44		u64 wall_nsec;
    45	
    46		guard(srcu)(&kvm->srcu);
    47	
    48		CLASS(gpc_map_local, shinfo_map)(gpc, PAGE_SIZE);
  > 49		if (IS_ERR(shinfo_map))
  > 50			return PTR_ERR(*shinfo_map);
    51	
    52		/*
    53		 * This code mirrors kvm_write_wall_clock() except that it writes
    54		 * directly through the pfn cache and doesn't mark the page dirty.
    55		 */
    56		wall_nsec = kvm_get_wall_clock_epoch(kvm);
    57	
    58		/* Paranoia checks on the 32-bit struct layout */
    59		BUILD_BUG_ON(offsetof(struct compat_shared_info, wc) != 0x900);
    60		BUILD_BUG_ON(offsetof(struct compat_shared_info, arch.wc_sec_hi) != 0x924);
    61		BUILD_BUG_ON(offsetof(struct pvclock_vcpu_time_info, version) != 0);
    62	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
