Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B70035F60B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 06:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774421826; cv=none; b=QbtnDtxJv+vGYL68XV+TB/G/Gm4NOnOX8L9fa7oRglgmwea3Po1tiVgUAusR0O5SXSo4z3AKafpe+POknEwOpKet7D6w5ZuJPuqpdb+HECO1pFyNLG5eUp+d4lZBBVRQLIFeTUoWCi+zjMm3YjdXbLAVQcEGdliEg16E3PoO03I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774421826; c=relaxed/simple;
	bh=1UOeLdBhGxJiWaXK9I+r1sYRQxjIZc9fxU/IR54YhiA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cYqqOvPhGcrHrzMEgIZpejzGecOie8IlQPP0C+Y6x1a7pjuhzUlVvoV/tVkHJahpejyNqkGfvtuhI7VyxE/kZMHrTxoROe8aQtthPERe+6ZoUByV0rDYt80GTkHkmghR4GdD9DjJEPRu0imcuRvEAwHesy4o7CHgvnIv16Dz+XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DEHs8AT0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DEHs8AT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774421824; x=1805957824;
  h=date:from:to:cc:subject:message-id;
  bh=1UOeLdBhGxJiWaXK9I+r1sYRQxjIZc9fxU/IR54YhiA=;
  b=DEHs8AT0hpmp/eTI9XvxtFoW3tBiBUjzWfpmGp15ztCiEqgU/gHOzJp/
   m5WHHyk1V1of6IxcbtpoDQ5xA72PU5WCzqQ0FejrSw3XjRFMCBPPHVVRM
   e0zxr67BuNZaILab1Aw7v/eRzVTmgSTEbdAJX2+l2lejr/L9w6QQX+nZo
   9tzk+SVnQIFNAKkNCqpj7s4CRgZPKN9qdVqKPm4utCoExWWotBDTSG+eE
   l5KJDJiHAQydSbmHvyg+yKHQ2tjPuOi94sLJDoUd2D2bKXBc2HnYlOf/T
   wp30ymUdP3nurWgOARXbnKJ2JajIlqds3xDHotd9IQfi0Kxs+89KBaE/1
   A==;
X-CSE-ConnectionGUID: 5q8alAvRSGipuZTeKSq5XA==
X-CSE-MsgGUID: bUCYniIHTPS5rYcPZV0WrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75169934"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75169934"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 23:57:02 -0700
X-CSE-ConnectionGUID: hdd0iIz1Ta2flNMqDpgTpQ==
X-CSE-MsgGUID: xQI1IcOTTP25G2DHLvj+Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="226227730"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Mar 2026 23:57:00 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5IAk-000000006NL-0ajm;
	Wed, 25 Mar 2026 06:56:58 +0000
Date: Wed, 25 Mar 2026 14:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 44/44]
 drivers/iommu/intel/pasid.c:762:18: error: 'struct pkvm_sm_context_param' has
 no member named 'pasid_dir_gpa'
Message-ID: <202603251408.0tpAwQTu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Aashish,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   bb47b925bb600e95cd776d4ab19d2b6c2ae342c7
commit: 4c2bcf42320837fc0b98fbce77c764de4d905644 [44/44] ANDROID: iommu/vt-d: Paravirtualize scalable mode context updates
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260325/202603251408.0tpAwQTu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251408.0tpAwQTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251408.0tpAwQTu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_clear_translation_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:314:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_clear_translation_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:31:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      31 |         return pkvm_iommu_hypercall(iommu_clear_ce, clear_translation_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_lm_ce':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_lm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:314:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_lm_context_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:36:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      36 |         return pkvm_iommu_hypercall(iommu_set_lm_ce, lm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h: In function 'pkvm_hc_iommu_set_sm_ce':
   drivers/iommu/intel/iommu_pkvm.h:16:22: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      16 |                 *p = *(param);                                                  \
         |                      ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:16:20: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      16 |                 *p = *(param);                                                  \
         |                    ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:28: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                            ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:18:26: error: invalid use of undefined type 'struct pkvm_sm_context_param'
      18 |                 *(param) = *p;                                                  \
         |                          ^
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:314:38: error: invalid application of 'sizeof' to incomplete type 'struct pkvm_sm_context_param'
     314 |                 memset(ptr, 0, sizeof(*ptr));   \
         |                                      ^
   drivers/iommu/intel/iommu_pkvm.h:19:17: note: in expansion of macro 'put_this_pv_param'
      19 |                 put_this_pv_param(p, f);                                        \
         |                 ^~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu_pkvm.h:41:16: note: in expansion of macro 'pkvm_iommu_hypercall'
      41 |         return pkvm_iommu_hypercall(iommu_set_sm_ce, sm_context_param, param);
         |                ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.c: In function 'pv_pasid_table_teardown':
   drivers/iommu/intel/pasid.c:647:16: error: variable 'param' has initializer but incomplete type
     647 |         struct pkvm_clear_translation_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:648:18: error: 'struct pkvm_clear_translation_param' has no member named 'phys'
     648 |                 .phys = info->iommu->reg_phys,
         |                  ^~~~
>> drivers/iommu/intel/pasid.c:648:25: warning: excess elements in struct initializer
     648 |                 .phys = info->iommu->reg_phys,
         |                         ^~~~
   drivers/iommu/intel/pasid.c:648:25: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:649:18: error: 'struct pkvm_clear_translation_param' has no member named 'bdf'
     649 |                 .bdf = PCI_DEVID(bus, devfn),
         |                  ^~~
   In file included from drivers/iommu/intel/pasid.c:17:
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/pasid.c:649:24: note: in expansion of macro 'PCI_DEVID'
     649 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/pasid.c:649:24: note: in expansion of macro 'PCI_DEVID'
     649 |                 .bdf = PCI_DEVID(bus, devfn),
         |                        ^~~~~~~~~
   drivers/iommu/intel/pasid.c:650:18: error: 'struct pkvm_clear_translation_param' has no member named 'ats_qdep'
     650 |                 .ats_qdep = info->ats_qdep,
         |                  ^~~~~~~~
   drivers/iommu/intel/pasid.c:650:29: warning: excess elements in struct initializer
     650 |                 .ats_qdep = info->ats_qdep,
         |                             ^~~~
   drivers/iommu/intel/pasid.c:650:29: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:647:45: error: storage size of 'param' isn't known
     647 |         struct pkvm_clear_translation_param param = {
         |                                             ^~~~~
>> drivers/iommu/intel/pasid.c:647:45: warning: unused variable 'param' [-Wunused-variable]
   drivers/iommu/intel/pasid.c: In function 'pv_device_pasid_table_setup':
   drivers/iommu/intel/pasid.c:759:16: error: variable 'param' has initializer but incomplete type
     759 |         struct pkvm_sm_context_param param = {
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:760:18: error: 'struct pkvm_sm_context_param' has no member named 'phys'
     760 |                 .phys = iommu->reg_phys,
         |                  ^~~~
   drivers/iommu/intel/pasid.c:760:25: warning: excess elements in struct initializer
     760 |                 .phys = iommu->reg_phys,
         |                         ^~~~~
   drivers/iommu/intel/pasid.c:760:25: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:761:18: error: 'struct pkvm_sm_context_param' has no member named 'bdf'
     761 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                  ^~~
   include/linux/pci.h:72:33: warning: excess elements in struct initializer
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/pasid.c:761:24: note: in expansion of macro 'PCI_DEVID'
     761 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                        ^~~~~~~~~
   include/linux/pci.h:72:33: note: (near initialization for 'param')
      72 | #define PCI_DEVID(bus, devfn)   ((((u16)(bus)) << 8) | (devfn))
         |                                 ^
   drivers/iommu/intel/pasid.c:761:24: note: in expansion of macro 'PCI_DEVID'
     761 |                 .bdf = PCI_DEVID(info->bus, info->devfn),
         |                        ^~~~~~~~~
>> drivers/iommu/intel/pasid.c:762:18: error: 'struct pkvm_sm_context_param' has no member named 'pasid_dir_gpa'
     762 |                 .pasid_dir_gpa = virt_to_phys(info->pasid_table->table),
         |                  ^~~~~~~~~~~~~
   In file included from include/linux/io.h:14,
                    from include/acpi/acpi_io.h:5,
                    from include/linux/acpi.h:39,
                    from include/linux/dmar.h:12,
                    from drivers/iommu/intel/pasid.c:14:
   arch/x86/include/asm/io.h:155:22: warning: excess elements in struct initializer
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:762:34: note: in expansion of macro 'virt_to_phys'
     762 |                 .pasid_dir_gpa = virt_to_phys(info->pasid_table->table),
         |                                  ^~~~~~~~~~~~
   arch/x86/include/asm/io.h:155:22: note: (near initialization for 'param')
     155 | #define virt_to_phys virt_to_phys
         |                      ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:762:34: note: in expansion of macro 'virt_to_phys'
     762 |                 .pasid_dir_gpa = virt_to_phys(info->pasid_table->table),
         |                                  ^~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:763:18: error: 'struct pkvm_sm_context_param' has no member named 'ats_supported'
     763 |                 .ats_supported = info->ats_supported,
         |                  ^~~~~~~~~~~~~
   drivers/iommu/intel/pasid.c:763:34: warning: excess elements in struct initializer
     763 |                 .ats_supported = info->ats_supported,
         |                                  ^~~~
   drivers/iommu/intel/pasid.c:763:34: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:764:18: error: 'struct pkvm_sm_context_param' has no member named 'max_pasid'
     764 |                 .max_pasid = info->pasid_table->max_pasid,
         |                  ^~~~~~~~~
   drivers/iommu/intel/pasid.c:764:30: warning: excess elements in struct initializer
     764 |                 .max_pasid = info->pasid_table->max_pasid,
         |                              ^~~~
   drivers/iommu/intel/pasid.c:764:30: note: (near initialization for 'param')
   drivers/iommu/intel/pasid.c:759:38: error: storage size of 'param' isn't known
     759 |         struct pkvm_sm_context_param param = {
         |                                      ^~~~~
   drivers/iommu/intel/pasid.c:759:38: warning: unused variable 'param' [-Wunused-variable]


vim +762 drivers/iommu/intel/pasid.c

   644	
   645	static void pv_pasid_table_teardown(struct device_domain_info *info, u8 bus, u8 devfn)
   646	{
 > 647		struct pkvm_clear_translation_param param = {
 > 648			.phys = info->iommu->reg_phys,
   649			.bdf = PCI_DEVID(bus, devfn),
 > 650			.ats_qdep = info->ats_qdep,
   651		};
   652		int ret = pkvm_hc_iommu_clear_ce(&param);
   653	
   654		if (ret)
   655			pr_warn("%s: pkvm failed to clear sm context entry for device[%x] (err=%d)\n",
   656				__func__, param.bdf, ret);
   657	}
   658	
   659	/*
   660	 * Interfaces to setup or teardown a pasid table to the scalable-mode
   661	 * context table entry:
   662	 */
   663	
   664	static void device_pasid_table_teardown(struct device *dev, u8 bus, u8 devfn)
   665	{
   666		struct device_domain_info *info = dev_iommu_priv_get(dev);
   667		struct intel_iommu *iommu = info->iommu;
   668		struct context_entry *context;
   669		u16 did;
   670	
   671		if (pkvm_pviommu_enabled()) {
   672			pv_pasid_table_teardown(info, bus, devfn);
   673			return;
   674		}
   675	
   676		spin_lock(&iommu->lock);
   677		context = iommu_context_addr(iommu, bus, devfn, false);
   678		if (!context) {
   679			spin_unlock(&iommu->lock);
   680			return;
   681		}
   682	
   683		did = context_domain_id(context);
   684		context_clear_entry(context);
   685		__iommu_flush_cache(iommu, context, sizeof(*context));
   686		spin_unlock(&iommu->lock);
   687		intel_context_flush_present(info, context, did, false);
   688	}
   689	
   690	static int pci_pasid_table_teardown(struct pci_dev *pdev, u16 alias, void *data)
   691	{
   692		struct device *dev = data;
   693	
   694		if (dev == &pdev->dev)
   695			device_pasid_table_teardown(dev, PCI_BUS_NUM(alias), alias & 0xff);
   696	
   697		return 0;
   698	}
   699	
   700	void intel_pasid_teardown_sm_context(struct device *dev)
   701	{
   702		struct device_domain_info *info = dev_iommu_priv_get(dev);
   703	
   704		if (!dev_is_pci(dev)) {
   705			device_pasid_table_teardown(dev, info->bus, info->devfn);
   706			return;
   707		}
   708	
   709		pci_for_each_dma_alias(to_pci_dev(dev), pci_pasid_table_teardown, dev);
   710	}
   711	
   712	/*
   713	 * Get the PASID directory size for scalable mode context entry.
   714	 * Value of X in the PDTS field of a scalable mode context entry
   715	 * indicates PASID directory with 2^(X + 7) entries.
   716	 */
   717	static unsigned long context_get_sm_pds(struct pasid_table *table)
   718	{
   719		unsigned long pds, max_pde;
   720	
   721		max_pde = table->max_pasid >> PASID_PDE_SHIFT;
   722		pds = find_first_bit(&max_pde, MAX_NR_PASID_BITS);
   723		if (pds < 7)
   724			return 0;
   725	
   726		return pds - 7;
   727	}
   728	
   729	static int context_entry_set_pasid_table(struct context_entry *context,
   730						 struct device *dev)
   731	{
   732		struct device_domain_info *info = dev_iommu_priv_get(dev);
   733		struct pasid_table *table = info->pasid_table;
   734		struct intel_iommu *iommu = info->iommu;
   735		unsigned long pds;
   736	
   737		context_clear_entry(context);
   738	
   739		pds = context_get_sm_pds(table);
   740		context->lo = (u64)virt_to_phys(table->table) | context_pdts(pds);
   741		context_set_sm_rid2pasid(context, IOMMU_NO_PASID);
   742	
   743		if (info->ats_supported)
   744			context_set_sm_dte(context);
   745		if (info->pasid_supported)
   746			context_set_pasid(context);
   747	
   748		context_set_fault_enable(context);
   749		context_set_present(context);
   750		__iommu_flush_cache(iommu, context, sizeof(*context));
   751	
   752		return 0;
   753	}
   754	
   755	static int pv_device_pasid_table_setup(struct device_domain_info *info)
   756	{
   757		struct intel_iommu *iommu = info->iommu;
   758		struct context_entry *context;
   759		struct pkvm_sm_context_param param = {
   760			.phys = iommu->reg_phys,
   761			.bdf = PCI_DEVID(info->bus, info->devfn),
 > 762			.pasid_dir_gpa = virt_to_phys(info->pasid_table->table),
   763			.ats_supported = info->ats_supported,
   764			.max_pasid = info->pasid_table->max_pasid,
   765		};
   766		int ret;
   767	
   768		spin_lock(&iommu->lock);
   769		ret = pkvm_hc_iommu_set_sm_ce(&param);
   770		if (ret == -ENOMEM) {
   771			context = iommu_alloc_page_node(iommu->node, GFP_ATOMIC);
   772			if (!context) {
   773				spin_unlock(&iommu->lock);
   774				pr_err("%s: failed to allocate context page for iommu: %d\n",
   775				       __func__, iommu->seq_id);
   776				return -ENOMEM;
   777			}
   778	
   779			param.context_gpa = virt_to_phys(context);
   780			ret = pkvm_hc_iommu_set_sm_ce(&param);
   781	
   782			/* Free the page if pkvm did not use it. */
   783			if (param.context_gpa)
   784				iommu_free_page(context);
   785		}
   786		spin_unlock(&iommu->lock);
   787	
   788		return ret;
   789	}
   790	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
