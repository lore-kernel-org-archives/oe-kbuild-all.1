Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696FA40D56A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 00:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781223247; cv=none; b=ZbjxOT6TVGFzcxiKhCzqSVE3sPfOvBS10xZVwNFl3JeKwX7hKiEOKDGQRxbGKr1CB3dyu8OFMzfJTD8Qoq8QLPuirhWEf/cKzfbnAJWIZ26TCnPrUDv9e5OCvYfsUAoqQuWUO33o+W5oNC8VwbAejoiYCqa0wlk3tbyjWzzkBW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781223247; c=relaxed/simple;
	bh=6/4XHdTMSwBwGxeDPkbQnDICeLpYZS+HGe0ob6zGT8c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b2ayuMmbfwX+Zn2Afp0Y3Lwl7Wxr8Xm2B0ppLm7MPmDos5n1+7FS8QAGa4iWEZuumWM0kCeSYIRZH9r6h0n8RBJw0YZV2lqDyIHkshnfSe7v+/5Lh44P1M2y3g/clG73siOClulfu/1CQiLotP6lo3XYh536/xAbeGd+blNWtxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cu+pcVC1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cu+pcVC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781223246; x=1812759246;
  h=date:from:to:cc:subject:message-id;
  bh=6/4XHdTMSwBwGxeDPkbQnDICeLpYZS+HGe0ob6zGT8c=;
  b=Cu+pcVC1Gw24Q+FGQx2lwtGeaMtMuNRZ8Jymyok4+to2N3Y9gRJ+g1TX
   lMqJGTJ6QKwpJxt7+BnCGqtjtvHQxDFOokqnAKZXwfv+CRv7uCY6tvyph
   g7KI+SqET6xdAlifFIPJfh9JXTnkFSOIQuJ1htkIMSRKJLeksCSnBTR9U
   hagTplebLntyXtG6lEamE/D4jKxfCRQiDpEvSIOAIjuesHEPRki8h0Piz
   qRGBTb7xNR/VOejfW4RL7X/kONpnEO8wnnWy8L7SwAvLXR3Xffzg1icP1
   6wzAX4f3q4QBJT6AsuX9HYGT/rS0E1ehZive+OngreaZ+uVcVwSXeQq0C
   A==;
X-CSE-ConnectionGUID: Z8Og1235Qcyl+4vWfSU56A==
X-CSE-MsgGUID: qVEKo14UQTmAQQjRJsS+ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82243641"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82243641"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 17:14:05 -0700
X-CSE-ConnectionGUID: BmW588sHSVmUxLqj5YKFfQ==
X-CSE-MsgGUID: kJj/3rykRpOYYsLZ+G7emw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="251603872"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Jun 2026 17:14:03 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXpX6-00000000O3s-2yOJ;
	Fri, 12 Jun 2026 00:14:00 +0000
Date: Fri, 12 Jun 2026 08:13:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 1/1]
 include/linux/iommu.h:1567:1: warning: control reaches end of non-void
 function
Message-ID: <202606120843.owzEDctq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Isaac,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   35c31415e6893d66536f52b0beef1c05fdd85a8c
commit: 06f8e52b34f38555bb820ac1cb1d9547a3c9c50a [1/1] ANDROID: GKI: Introduce GKI_HIDDEN_IOMMU_CONFIGS
config: i386-randconfig-003-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120843.owzEDctq-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120843.owzEDctq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120843.owzEDctq-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for INTEL_SCU
   Depends on [n]: X86_PLATFORM_DEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for IOMMU_SVA
   Depends on [n]: IOMMU_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_IOMMU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +1567 include/linux/iommu.h

2396046d75d3c0b Tina Zhang 2023-10-27  1559  
2396046d75d3c0b Tina Zhang 2023-10-27  1560  static inline u32 mm_get_enqcmd_pasid(struct mm_struct *mm)
2396046d75d3c0b Tina Zhang 2023-10-27  1561  {
092edaddb660376 Tina Zhang 2023-10-27  1562  	struct iommu_mm_data *iommu_mm = READ_ONCE(mm->iommu_mm);
092edaddb660376 Tina Zhang 2023-10-27  1563  
092edaddb660376 Tina Zhang 2023-10-27  1564  	if (!iommu_mm)
092edaddb660376 Tina Zhang 2023-10-27  1565  		return IOMMU_PASID_INVALID;
092edaddb660376 Tina Zhang 2023-10-27  1566  	return iommu_mm->pasid;
2396046d75d3c0b Tina Zhang 2023-10-27 @1567  }
2396046d75d3c0b Tina Zhang 2023-10-27  1568  

:::::: The code at line 1567 was first introduced by commit
:::::: 2396046d75d3c0b2cfead852a77efd023f8539dc iommu: Add mm_get_enqcmd_pasid() helper function

:::::: TO: Tina Zhang <tina.zhang@intel.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
