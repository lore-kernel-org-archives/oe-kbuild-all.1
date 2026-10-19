Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72389244694
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 03:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792381516; cv=none; b=rKX4Uqud/f0djWNLkeynPY5C5e3Sj9daVr9pDSeh7CWLCdmr5crE3W5NQldllchyk4ZE7/LMjhQIMKfxtF6VwLWiNN6PtEYAT1xQX3Kdd9yc5NJoYoapaccp28iSvqUd5uZ6/cY5AXU8xQoMyAGsCIIJdfe7UfJmBJ2XEEDrTWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792381516; c=relaxed/simple;
	bh=UQJ0NHF1DV/wz6c6qsINz7keNCl7QUDEFXmqBOMsemo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tObUH2tjGo1FdKv7AIe5SuLaslgXPFdQSbNSTn7kyl0m9ixoSdMkRuIA45wmwfj6d9cmv7R/clZwSBYMcMT94sscC1yHdWCEUan2GhNtoE1mbJSrtwmf7zgu1jQfOqOz1+cEih2ZYEUfdEtP67VUE6imfl3b6+J4irEtCTJiFqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=deUrbk5g; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="deUrbk5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792381514; x=1823917514;
  h=date:from:to:cc:subject:message-id;
  bh=UQJ0NHF1DV/wz6c6qsINz7keNCl7QUDEFXmqBOMsemo=;
  b=deUrbk5gDv0nfVgTADc7W75hNRkRi1+PL0D4UGI4uik/+QHsjYuVi51S
   oZU75bWJ0x3pyh+m/5RRXkPlGxXq0OGQ3hAYEoqjNyDLxn+Y7a4Xw9Bbl
   JTryZmcTETh/M6g1xl26nuXtDJqlLyf/qqZJl/JpV+miNdXlpHtb/3iFz
   T5hethcpPU6v+9mWEdqa++WSGSqwHANuF1SEis/9b+jKQUiWmBAp4Jvjg
   5HQOBni81JfswHIq3Od0xh7iP8vKOU+HBK/dPrLJr2vAV/sMgi9j8fflW
   ScR6NF1IdodI/aixI71G37J4ml3+isTWz1NfrCmmfe0/TcHpSKP1rVVjA
   w==;
X-CSE-ConnectionGUID: OFuJJyabRj6z5wOIYn9Wlw==
X-CSE-MsgGUID: QdCJFBMrQw69/Bh0U59a1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1044229"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1044229"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 20:45:13 -0700
X-CSE-ConnectionGUID: nZeWc/35QRWzORoOO/xheQ==
X-CSE-MsgGUID: U/pKyAUoRfSdRS0qMqyuMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2489150"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 20:45:10 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIeJA-00000000LEe-1pwv;
	Mon, 19 Oct 2026 03:45:08 +0000
Date: Mon, 19 Oct 2026 11:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:cca/topics/cca-da-gmem-backend 148/343]
 drivers/pci/tsm/core.c:188:23: error: 'struct pci_dev' has no member named
 'ide_cap'; did you mean 'devcap'?
Message-ID: <202610191154.3EZtO2sH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/LuBaolu/intel-iommu.git cca/topics/cca-da-gmem-backend
head:   6bdc5a1448b75f784490ac2061dc32ee4bd3b5a4
commit: 3ce3bac6a3b4fe37fd7c88a0b8227e6cc0e55f9a [148/343] samples/devsec: Introduce a PCI device-security bus + endpoint sample
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20261019/202610191154.3EZtO2sH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191154.3EZtO2sH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191154.3EZtO2sH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/tsm/core.c:15:
   include/linux/pci-tsm.h: In function 'is_pci_tsm_pf0':
   include/linux/pci-tsm.h:258:27: error: 'struct pci_dev' has no member named 'ide_cap'; did you mean 'devcap'?
     258 |                 if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
         |                           ^~~~~~~
         |                           devcap
   In file included from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/pci.h:36,
                    from drivers/pci/tsm/core.c:13:
   drivers/pci/tsm/core.c: In function 'link_sysfs_enable':
>> drivers/pci/tsm/core.c:188:23: error: 'struct pci_dev' has no member named 'ide_cap'; did you mean 'devcap'?
     188 |                 pdev->ide_cap ? "IDE" : "", pdev->ide_cap && tee ? " " : "",
         |                       ^~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/pci.h:2934:41: note: in expansion of macro 'dev_dbg'
    2934 | #define pci_dbg(pdev, fmt, arg...)      dev_dbg(&(pdev)->dev, fmt, ##arg)
         |                                         ^~~~~~~
   drivers/pci/tsm/core.c:186:9: note: in expansion of macro 'pci_dbg'
     186 |         pci_dbg(pdev, "%s Security Manager detected (%s%s%s)\n",
         |         ^~~~~~~
   drivers/pci/tsm/core.c:188:51: error: 'struct pci_dev' has no member named 'ide_cap'; did you mean 'devcap'?
     188 |                 pdev->ide_cap ? "IDE" : "", pdev->ide_cap && tee ? " " : "",
         |                                                   ^~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/pci.h:2934:41: note: in expansion of macro 'dev_dbg'
    2934 | #define pci_dbg(pdev, fmt, arg...)      dev_dbg(&(pdev)->dev, fmt, ##arg)
         |                                         ^~~~~~~
   drivers/pci/tsm/core.c:186:9: note: in expansion of macro 'pci_dbg'
     186 |         pci_dbg(pdev, "%s Security Manager detected (%s%s%s)\n",
         |         ^~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_TSM
   Depends on [n]: PCI [=y] && ARCH_HAS_CC_PLATFORM [=n]
   Selected by [m]:
   - SAMPLE_DEVSEC [=m] && SAMPLES [=y] && m [=m] && MODULES [=y] && PCI [=y] && VIRT_DRIVERS [=y] && PCI_DOMAINS [=y]


vim +188 drivers/pci/tsm/core.c

3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   10  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   11  #include <linux/bitfield.h>
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   12  #include <linux/ioport.h>
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  @13  #include <linux/pci.h>
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   14  #include <linux/pci-doe.h>
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   15  #include <linux/pci-tsm.h>
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   16  #include <linux/sysfs.h>
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   17  #include <linux/tsm.h>
89c47b66e8684b drivers/pci/tsm/core.c Dan Williams 2026-03-02   18  #include <linux/unaligned.h>
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   19  #include <linux/xarray.h>
420b87dee22951 drivers/pci/tsm/core.c Dan Williams 2026-03-02   20  #include "../pci.h"
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   21  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   22  /*
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   23   * Provide a read/write lock against the init / exit of pdev tsm
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   24   * capabilities and arrival/departure of a TSM instance
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   25   */
420b87dee22951 drivers/pci/tsm/core.c Dan Williams 2026-03-02   26  DECLARE_RWSEM(pci_tsm_rwsem);
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   27  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   28  /*
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   29   * Count of TSMs registered that support physical link operations vs device
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   30   * security state management.
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   31   */
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   32  static int pci_tsm_link_count;
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   33  static int pci_tsm_devsec_count;
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   34  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   35  static const struct pci_tsm_ops *to_pci_tsm_ops(struct pci_tsm *tsm)
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   36  {
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   37  	return tsm->tsm_dev->pci_ops;
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   38  }
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   39  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   40  static inline bool is_dsm(struct pci_dev *pdev)
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   41  {
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   42  	return pdev->tsm && pdev->tsm->dsm_dev == pdev;
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   43  }
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   44  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   45  static inline bool has_tee(struct pci_dev *pdev)
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   46  {
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   47  	return pdev->devcap & PCI_EXP_DEVCAP_TEE;
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   48  }
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   49  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   50  /* 'struct pci_tsm_pf0' wraps 'struct pci_tsm' when ->dsm_dev == ->pdev (self) */
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   51  static struct pci_tsm_pf0 *to_pci_tsm_pf0(struct pci_tsm *tsm)
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   52  {
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   53  	/*
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   54  	 * All "link" TSM contexts reference the device that hosts the DSM
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   55  	 * interface for a set of devices. Walk to the DSM device and cast its
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   56  	 * ->tsm context to a 'struct pci_tsm_pf0 *'.
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   57  	 */
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   58  	struct pci_dev *pf0 = tsm->dsm_dev;
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   59  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   60  	if (!is_pci_tsm_pf0(pf0) || !is_dsm(pf0)) {
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   61  		pci_WARN_ONCE(tsm->pdev, 1, "invalid context object\n");
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   62  		return NULL;
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   63  	}
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   64  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   65  	return container_of(pf0->tsm, struct pci_tsm_pf0, base_tsm);
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   66  }
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   67  
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   68  static inline bool is_devsec(struct pci_dev *pdev)
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   69  {
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   70  	return pdev->tsm && pdev->tsm->dsm_dev == NULL &&
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   71  	       pdev->tsm->tdi == NULL;
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   72  }
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   73  
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   74  /* 'struct pci_tsm_devsec' wraps 'struct pci_tsm' when ->tdi == ->dsm == NULL */
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   75  struct pci_tsm_devsec *to_pci_tsm_devsec(struct pci_tsm *tsm)
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   76  {
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   77  	struct pci_dev *pdev = tsm->pdev;
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   78  
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   79  	if (!is_devsec(pdev) || !has_tee(pdev)) {
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   80  		pci_WARN_ONCE(pdev, 1, "invalid context object\n");
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   81  		return NULL;
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   82  	}
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   83  
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   84  	return container_of(tsm, struct pci_tsm_devsec, base_tsm);
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   85  }
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   86  EXPORT_SYMBOL_GPL(to_pci_tsm_devsec);
cdaa9d7c440614 drivers/pci/tsm.c      Dan Williams 2026-03-02   87  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   88  static void tsm_remove(struct pci_tsm *tsm)
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   89  {
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   90  	struct pci_dev *pdev;
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   91  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   92  	if (!tsm)
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   93  		return;
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   94  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   95  	pdev = tsm->pdev;
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   96  	to_pci_tsm_ops(tsm)->remove(tsm);
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   97  	pdev->tsm = NULL;
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   98  }
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31   99  DEFINE_FREE(tsm_remove, struct pci_tsm *, if (_T) tsm_remove(_T))
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  100  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  101  static void pci_tsm_walk_fns(struct pci_dev *pdev,
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  102  			     int (*cb)(struct pci_dev *pdev, void *data),
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  103  			     void *data)
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  104  {
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  105  	/* Walk subordinate physical functions */
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  106  	for (int i = 0; i < 8; i++) {
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  107  		struct pci_dev *pf __free(pci_dev_put) = pci_get_slot(
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  108  			pdev->bus, PCI_DEVFN(PCI_SLOT(pdev->devfn), i));
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  109  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  110  		if (!pf)
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  111  			continue;
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  112  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  113  		/* on entry function 0 has already run @cb */
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  114  		if (i > 0)
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  115  			cb(pf, data);
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  116  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  117  		/* walk virtual functions of each pf */
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  118  		for (int j = 0; j < pci_num_vf(pf); j++) {
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  119  			struct pci_dev *vf __free(pci_dev_put) =
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  120  				pci_get_domain_bus_and_slot(
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  121  					pci_domain_nr(pf->bus),
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  122  					pci_iov_virtfn_bus(pf, j),
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  123  					pci_iov_virtfn_devfn(pf, j));
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  124  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  125  			if (!vf)
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  126  				continue;
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  127  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  128  			cb(vf, data);
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  129  		}
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  130  	}
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  131  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  132  	/*
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  133  	 * Walk downstream devices, assumes that an upstream DSM is
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  134  	 * limited to downstream physical functions
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  135  	 */
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  136  	if (pci_pcie_type(pdev) == PCI_EXP_TYPE_UPSTREAM && is_dsm(pdev))
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  137  		pci_walk_bus(pdev->subordinate, cb, data);
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  138  }
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  139  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  140  static void pci_tsm_walk_fns_reverse(struct pci_dev *pdev,
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  141  				     int (*cb)(struct pci_dev *pdev,
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  142  					       void *data),
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  143  				     void *data)
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  144  {
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  145  	/* Reverse walk downstream devices */
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  146  	if (pci_pcie_type(pdev) == PCI_EXP_TYPE_UPSTREAM && is_dsm(pdev))
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  147  		pci_walk_bus_reverse(pdev->subordinate, cb, data);
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  148  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  149  	/* Reverse walk subordinate physical functions */
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  150  	for (int i = 7; i >= 0; i--) {
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  151  		struct pci_dev *pf __free(pci_dev_put) = pci_get_slot(
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  152  			pdev->bus, PCI_DEVFN(PCI_SLOT(pdev->devfn), i));
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  153  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  154  		if (!pf)
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  155  			continue;
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  156  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  157  		/* reverse walk virtual functions */
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  158  		for (int j = pci_num_vf(pf) - 1; j >= 0; j--) {
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  159  			struct pci_dev *vf __free(pci_dev_put) =
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  160  				pci_get_domain_bus_and_slot(
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  161  					pci_domain_nr(pf->bus),
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  162  					pci_iov_virtfn_bus(pf, j),
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  163  					pci_iov_virtfn_devfn(pf, j));
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  164  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  165  			if (!vf)
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  166  				continue;
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  167  			cb(vf, data);
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  168  		}
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  169  
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  170  		/* on exit, caller will run @cb on function 0 */
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  171  		if (i > 0)
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  172  			cb(pf, data);
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  173  	}
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  174  }
3225f52cde56f4 drivers/pci/tsm.c      Dan Williams 2025-10-31  175  
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  176  static void link_sysfs_disable(struct pci_dev *pdev)
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  177  {
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  178  	sysfs_update_group(&pdev->dev.kobj, &pci_tsm_auth_attr_group);
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  179  	sysfs_update_group(&pdev->dev.kobj, &pci_tsm_attr_group);
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  180  }
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  181  
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  182  static void link_sysfs_enable(struct pci_dev *pdev)
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  183  {
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  184  	bool tee = has_tee(pdev);
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  185  
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  186  	pci_dbg(pdev, "%s Security Manager detected (%s%s%s)\n",
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  187  		pdev->tsm ? "Device" : "Platform TEE",
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12 @188  		pdev->ide_cap ? "IDE" : "", pdev->ide_cap && tee ? " " : "",
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  189  		tee ? "TEE" : "");
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  190  
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  191  	sysfs_update_group(&pdev->dev.kobj, &pci_tsm_auth_attr_group);
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  192  	sysfs_update_group(&pdev->dev.kobj, &pci_tsm_attr_group);
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  193  }
f7ae6d4ec6520a drivers/pci/tsm.c      Dan Williams 2025-11-12  194  

:::::: The code at line 188 was first introduced by commit
:::::: f7ae6d4ec6520a901787cbab273983e96d8516da PCI/TSM: Add 'dsm' and 'bound' attributes for dependent functions

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
