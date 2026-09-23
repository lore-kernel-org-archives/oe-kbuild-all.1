Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE0C54281E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177029; cv=none; b=TnJs1/xF8p/otcL9eRCabWV9zvSvOdwXH09eqzIbpHXjDvRAKbo5UhEBlun9wA71DxLJhRXDiOojCu0GioXe3QIx7eqPhgC/bbhB/ysJHwceQmJp+P99XJm+OfoT4iw7LZMNLmDxGiJeE5owEzQJAip/nlc2we3QJ2FgVatCIr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177029; c=relaxed/simple;
	bh=T57OyQWhHiXz0w/Fv/fPwSnG+4bnBA3Tlf+mXnks8bk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HJr5DP2zJKcjG4JpaXitmjFqwauzUypMaGH19QdVH4mS989klmSrvWfqydwXbNu3dH7bAg5twzElbLIftPylIY6uCConlViCRik7ROd9grhtQ7SgKWbCSZQbs3KL3/3ZOx2xUB1RwdG9Afjl+yZnFCmRcYkp9RvRcHvFXq6Ulyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jx9reRI4; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jx9reRI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790177026; x=1821713026;
  h=date:from:to:cc:subject:message-id;
  bh=T57OyQWhHiXz0w/Fv/fPwSnG+4bnBA3Tlf+mXnks8bk=;
  b=jx9reRI4dh/5RHrRAcudghy86TmjeyBbRF19I4r0fPBwD1MVjOkap75R
   W/ZziXR2agOwLCLHLi7LjMfYK/LfQ5U4/hFlo5zSsIIsSur1mZj27DAKk
   kx+EzHz24cv1eAjD0LXGfU/N6U4afTcLqDQu8rIqQEtxdA6ATBGYBMzvY
   D3gjnUPrHvbT6tT5wOdKjC39C4nZqJqDgk4q8NwgS58CIhDKG7AAovG9D
   4ia1NQuUtwZr0wWZ/pqHRPrzI4/+XfZP2zJH/EM67nM3La8mvB47MKlGi
   ApZ7+Zbg0pMbEPyrNSeObguudMK7HU4WMSclnpxvnZM5EJuPvMOr4FIKO
   w==;
X-CSE-ConnectionGUID: P9cxW3RsQDyYOFYKE5zWCw==
X-CSE-MsgGUID: Qc1lGNpoRyCREu+TNJ0uNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1378430"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1378430"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:23:46 -0700
X-CSE-ConnectionGUID: j+AekqumSv2suc3SAY8xEQ==
X-CSE-MsgGUID: xFhLoU4iQ7q7aTQHQjGYZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="270162607"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 08:23:44 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Oov-000000000il-2gEl;
	Wed, 23 Sep 2026 15:23:41 +0000
Date: Wed, 23 Sep 2026 17:22:35 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 include/linux/iommu.h:1567:1: warning: control reaches end of non-void
 function
Message-ID: <202609231706.0KvOnTpL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   be012b3f0e2ba884d014d4736652511302214a95
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [1/1] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: x86_64-randconfig-2200-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231706.0KvOnTpL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231706.0KvOnTpL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231706.0KvOnTpL-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:503:27: error: expression in static assertion is not an integer
     503 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:114:9: note: in expansion of macro 'list_for_each_entry'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/random.h:8,
                    from include/linux/nodemask.h:94,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:17:
   drivers/iommu/iommu-sva.c:114:50: error: invalid use of undefined type 'struct iommu_mm_data'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |                                                  ^~
   include/linux/list.h:761:37: note: in definition of macro 'list_entry_is_head'
     761 |         list_is_head(&pos->member, (head))
         |                                     ^~~~
   drivers/iommu/iommu-sva.c:114:9: note: in expansion of macro 'list_for_each_entry'
     114 |         list_for_each_entry(domain, &mm->iommu_mm->sva_domains, next) {
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/iommu/iommu-sva.c:115:70: error: invalid use of undefined type 'struct iommu_mm_data'
     115 |                 ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
         |                                                                      ^~
   drivers/iommu/iommu-sva.c:116:56: error: invalid use of undefined type 'struct iommu_sva'
     116 |                                                 &handle->handle);
         |                                                        ^~
   drivers/iommu/iommu-sva.c:130:62: error: invalid use of undefined type 'struct iommu_mm_data'
     130 |         ret = iommu_attach_device_pasid(domain, dev, iommu_mm->pasid,
         |                                                              ^~
   drivers/iommu/iommu-sva.c:131:48: error: invalid use of undefined type 'struct iommu_sva'
     131 |                                         &handle->handle);
         |                                                ^~
   drivers/iommu/iommu-sva.c:135:46: error: invalid use of undefined type 'struct iommu_mm_data'
     135 |         list_add(&domain->next, &mm->iommu_mm->sva_domains);
         |                                              ^~
   drivers/iommu/iommu-sva.c:138:29: error: invalid use of undefined type 'struct iommu_sva'
     138 |         refcount_set(&handle->users, 1);
         |                             ^~
   drivers/iommu/iommu-sva.c:140:15: error: invalid use of undefined type 'struct iommu_sva'
     140 |         handle->dev = dev;
         |               ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_unbind_device':
   drivers/iommu/iommu-sva.c:163:45: error: invalid use of undefined type 'struct iommu_sva'
     163 |         struct iommu_domain *domain = handle->handle.domain;
         |                                             ^~
   drivers/iommu/iommu-sva.c:165:36: error: invalid use of undefined type 'struct iommu_sva'
     165 |         struct device *dev = handle->dev;
         |                                    ^~
   drivers/iommu/iommu-sva.c:168:43: error: invalid use of undefined type 'struct iommu_sva'
     168 |         if (!refcount_dec_and_test(&handle->users)) {
         |                                           ^~
   drivers/iommu/iommu-sva.c:173:56: error: invalid use of undefined type 'struct iommu_mm_data'
     173 |         iommu_detach_device_pasid(domain, dev, iommu_mm->pasid);
         |                                                        ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_get_pasid':
   drivers/iommu/iommu-sva.c:185:45: error: invalid use of undefined type 'struct iommu_sva'
     185 |         struct iommu_domain *domain = handle->handle.domain;
         |                                             ^~
   drivers/iommu/iommu-sva.c: In function 'mm_pasid_drop':
   drivers/iommu/iommu-sva.c:198:41: error: invalid use of undefined type 'struct iommu_mm_data'
     198 |         iommu_free_global_pasid(iommu_mm->pasid);
         |                                         ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_handle_iopf':
   drivers/iommu/iommu-sva.c:275:66: error: invalid use of undefined type 'struct iommu_attach_handle'
     275 |                                              group->attach_handle->domain->mm);
         |                                                                  ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_iopf_handler':
   drivers/iommu/iommu-sva.c:287:36: error: 'struct iommu_fault_param' has no member named 'queue'
     287 |         if (!queue_work(fault_param->queue->wq, &group->work))
         |                                    ^~
   drivers/iommu/iommu-sva.c: In function 'iommu_sva_domain_alloc':
   drivers/iommu/iommu-sva.c:299:17: error: 'const struct iommu_ops' has no member named 'domain_alloc_sva'
     299 |         if (!ops->domain_alloc_sva)
         |                 ^~
   drivers/iommu/iommu-sva.c:302:21: error: 'const struct iommu_ops' has no member named 'domain_alloc_sva'
     302 |         domain = ops->domain_alloc_sva(dev, mm);
         |                     ^~
   drivers/iommu/iommu-priv.h: In function 'dev_iommu_ops':
   drivers/iommu/iommu-priv.h:19:1: warning: control reaches end of non-void function [-Wreturn-type]
      19 | }
         | ^
   include/linux/iommu.h: In function 'mm_get_enqcmd_pasid':
>> include/linux/iommu.h:1567:1: warning: control reaches end of non-void function [-Wreturn-type]
    1567 | }
         | ^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]


vim +1567 include/linux/iommu.h

2396046d75d3c0 Tina Zhang 2023-10-27  1559  
2396046d75d3c0 Tina Zhang 2023-10-27  1560  static inline u32 mm_get_enqcmd_pasid(struct mm_struct *mm)
2396046d75d3c0 Tina Zhang 2023-10-27  1561  {
092edaddb66037 Tina Zhang 2023-10-27  1562  	struct iommu_mm_data *iommu_mm = READ_ONCE(mm->iommu_mm);
092edaddb66037 Tina Zhang 2023-10-27  1563  
092edaddb66037 Tina Zhang 2023-10-27  1564  	if (!iommu_mm)
092edaddb66037 Tina Zhang 2023-10-27  1565  		return IOMMU_PASID_INVALID;
092edaddb66037 Tina Zhang 2023-10-27  1566  	return iommu_mm->pasid;
2396046d75d3c0 Tina Zhang 2023-10-27 @1567  }
2396046d75d3c0 Tina Zhang 2023-10-27  1568  

:::::: The code at line 1567 was first introduced by commit
:::::: 2396046d75d3c0b2cfead852a77efd023f8539dc iommu: Add mm_get_enqcmd_pasid() helper function

:::::: TO: Tina Zhang <tina.zhang@intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
