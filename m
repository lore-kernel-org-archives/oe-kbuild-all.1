Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792817758;
	b=ovYetH8esQCU/6+dr4ZpwDPyJXMoeFs9eU0qw5SqSl/r5VPMLVF41ZRtxUTv6WWdaiAO
	 NZXJ0yH6v2hKbS3mvjBoX52AhQGsgU/aJeMJJEA/PcwzegLb2xWdIjV2CvzTX1eriFXBP
	 OL8+aQTmzpAj/mZ97AfqOS/PT1pva8RSit7acdR4WOM97t+eRDFYCDF0rHwJoMkwnGcTP
	 ESyTpW0n4OqKzibkWFkwb+QAAHZreYEHNkcn3OHiyEPP+4F7wYkrxhS0Glaeiw1vJP8gV
	 0lgp1bTUzAAVVNRg+yMG+nFfbu5wii7LM25KHJCVO6AVcBKkUUxL8kUBOnlYy3OLdDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792817758;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dgkqM99xzX5yBCHpheTf1l6/qIP/QfYL6NrWiVXhFrY=;
	b=HZwbp5o12rGA0Oi9c8M6For4xdrRO7h+WPT58iZH0R57P1wLcERcJcNKiOVH9PlYEEdK
	 cJiiIqYP7WMuuyK0oqgsuPcGHWs24i4YLThJx3irPaSQ+m5GgsdY1fUbapZ8KjPKLbb9y
	 z6rapz7ZYFp1Xg+qExZHdc36TUd4y5jQTYQYJDrLQVTA5PPLJsZCxxXemsllKJjgSx/Dy
	 y2pI7+uFXGTub8ntkIBpnbEVDHlSftn3oBNjYmFIuNw7hxpYn/8taYmv+uirL7b0oNodK
	 HRilomci/xikNB2L/oFhwBLjiTRIdSQEmhqBp4uFNZsee0TJ+ix3wgj5K1yHhRZzVBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NEeaokqD;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF806606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 04:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF806606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NEeaokqD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792817755; x=1824353755;
  h=date:from:to:cc:subject:message-id;
  bh=TWuMmYkUc345EXZi4el7/qbKKeEQjJzVqDcWBXEGvps=;
  b=NEeaokqDO8/UmVAmxuaDowIxOydFDiFEUw/YJhLk2rbFp8KGNglgzvYU
   6ranMnIbNYsy5mapQgFa6UfiHtFyiqYgKWVPZ8SIGSqxBOluD1ZHeXV3v
   gzcdJASWkyMG/Z5kaNf+aq1oQeojWlUitgOJ/jxGFOL33t31ZuJ5aaLTN
   5P0Z0NhCsQdZyyegXH7q35qrAffi+k39IWrNb0Ko406U/g4AH7Z2brWWv
   8YWbTqQKrB+ioqMkCOirCARISC/NjBvrABxN9iXyJcCpEx/q+V78fN2GN
   HN0UnAJp+2nkgVAY1byX+p5AiM1pd1SEmEkRkF6wy+8L1+4CTVS8OAIAF
   g==;
X-CSE-ConnectionGUID: gcNQavCGQWGVa9MUZEqIDw==
X-CSE-MsgGUID: sRPw1+lzQyqL2Qk8H7HfAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1459485"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1459485"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 21:55:54 -0700
X-CSE-ConnectionGUID: 0TvEWNuDSeOXLXaBpjBA9w==
X-CSE-MsgGUID: P4qDdUv1RZuxTYxGh8gQ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5655535"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 23 Oct 2026 21:55:53 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKTnK-00000000Tb4-1iuJ;
	Sat, 24 Oct 2026 04:55:50 +0000
Date: Sat, 24 Oct 2026 12:55:18 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:iommu/tdxc/enablement-v3 11/11]
 drivers/virt/coco/tdx-host/main.c:72:7: error: call to undeclared function
 'pci_tsm_pf0_constructor'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202610241203.u3sekKTc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Lu,

First bad commit (maybe != root cause):

tree:   https://github.com/LuBaolu/intel-iommu.git iommu/tdxc/enablement-v3
head:   2283e2eb2048bd3540f1788572d670ad3d71dd94
commit: 2283e2eb2048bd3540f1788572d670ad3d71dd94 [11/11] coco/tdx-host: Enable trusted DMA on IOMMUs on device connect
config: x86_64-buildonly-randconfig-1005-20261024 (https://download.01.org/0day-ci/archive/20261024/202610241203.u3sekKTc-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241203.u3sekKTc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241203.u3sekKTc-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/virt/coco/tdx-host/main.c:13:
   include/linux/pci-tsm.h:152:13: error: no member named 'ide_cap' in 'struct pci_dev'
     152 |                 if (pdev->ide_cap || (pdev->devcap & PCI_EXP_DEVCAP_TEE))
         |                     ~~~~  ^
>> drivers/virt/coco/tdx-host/main.c:72:7: error: call to undeclared function 'pci_tsm_pf0_constructor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      72 |         rc = pci_tsm_pf0_constructor(pdev, &tlink->pci, tsm_dev);
         |              ^
>> drivers/virt/coco/tdx-host/main.c:83:2: error: call to undeclared function 'pci_tsm_pf0_destructor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      83 |         pci_tsm_pf0_destructor(&tlink->pci);
         |         ^
>> drivers/virt/coco/tdx-host/main.c:96:7: error: call to undeclared function 'pci_tsm_link_constructor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      96 |         rc = pci_tsm_link_constructor(pdev, pci_tsm, tsm_dev);
         |              ^
   drivers/virt/coco/tdx-host/main.c:96:7: note: did you mean 'class_irq_constructor'?
   include/linux/irqflags.h:265:1: note: 'class_irq_constructor' declared here
     265 | DEFINE_LOCK_GUARD_0(irq, local_irq_disable(), local_irq_enable())
         | ^
   include/linux/cleanup.h:568:59: note: expanded from macro 'DEFINE_LOCK_GUARD_0'
     568 | __DEFINE_UNLOCK_GUARD(_name, void, _unlock, __VA_ARGS__)                \
         |                                                                         ^
   include/linux/cleanup.h:511:42: note: expanded from macro '\
   __DEFINE_LOCK_GUARD_0'
     511 | static __always_inline class_##_name##_t class_##_name##_constructor(void) \
         |                                          ^
   <scratch space>:152:1: note: expanded from here
     152 | class_irq_constructor
         | ^
>> drivers/virt/coco/tdx-host/main.c:138:6: warning: unused variable 'ret' [-Wunused-variable]
     138 |         int ret;
         |             ^~~
   1 warning and 4 errors generated.


vim +/pci_tsm_pf0_constructor +72 drivers/virt/coco/tdx-host/main.c

1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   62  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   63  static struct pci_tsm *tdx_tsm_link_pf0_probe(struct tsm_dev *tsm_dev,
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   64  					      struct pci_dev *pdev)
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   65  {
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   66  	int rc;
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   67  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   68  	struct tdx_tsm_link *tlink __free(kfree) = kzalloc_obj(*tlink);
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   69  	if (!tlink)
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   70  		return NULL;
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   71  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  @72  	rc = pci_tsm_pf0_constructor(pdev, &tlink->pci, tsm_dev);
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   73  	if (rc)
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   74  		return NULL;
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   75  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   76  	return &no_free_ptr(tlink)->pci.base_tsm;
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   77  }
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   78  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   79  static void tdx_tsm_link_pf0_remove(struct pci_tsm *tsm)
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   80  {
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   81  	struct tdx_tsm_link *tlink = to_tdx_tsm_link(tsm);
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   82  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  @83  	pci_tsm_pf0_destructor(&tlink->pci);
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   84  	kfree(tlink);
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   85  }
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   86  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   87  static struct pci_tsm *tdx_tsm_link_fn_probe(struct tsm_dev *tsm_dev,
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   88  					     struct pci_dev *pdev)
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   89  {
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   90  	int rc;
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   91  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   92  	struct pci_tsm *pci_tsm __free(kfree) = kzalloc_obj(*pci_tsm);
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   93  	if (!pci_tsm)
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   94  		return NULL;
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   95  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  @96  	rc = pci_tsm_link_constructor(pdev, pci_tsm, tsm_dev);
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   97  	if (rc)
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   98  		return NULL;
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21   99  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  100  	return no_free_ptr(pci_tsm);
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  101  }
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  102  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  103  static struct pci_tsm *tdx_tsm_link_probe(struct tsm_dev *tsm_dev,
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  104  					  struct pci_dev *pdev)
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  105  {
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  106  	if (is_pci_tsm_pf0(pdev))
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  107  		return tdx_tsm_link_pf0_probe(tsm_dev, pdev);
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  108  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  109  	return tdx_tsm_link_fn_probe(tsm_dev, pdev);
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  110  }
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  111  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  112  static void tdx_tsm_link_remove(struct pci_tsm *tsm)
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  113  {
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  114  	if (is_pci_tsm_pf0(tsm->pdev)) {
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  115  		tdx_tsm_link_pf0_remove(tsm);
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  116  		return;
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  117  	}
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  118  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  119  	/* for sub-functions */
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  120  	kfree(tsm);
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  121  }
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  122  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  123  static struct pci_tsm_ops tdx_tsm_link_ops = {
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  124  	.probe = tdx_tsm_link_probe,
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  125  	.remove = tdx_tsm_link_remove,
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  126  	.connect = tdx_tsm_link_connect,
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  127  	.disconnect = tdx_tsm_link_disconnect,
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  128  };
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  129  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  130  static void unregister_link_tsm(void *link)
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  131  {
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  132  	tsm_unregister(link);
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  133  }
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  134  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  135  static int tdx_tdisp_init(struct device *dev)
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  136  {
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  137  	struct tsm_dev *link;
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21 @138  	int ret;
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  139  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  140  	if (!tdx_supports_tdisp(tdx_sysinfo))
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  141  		return 0;
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  142  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  143  	link = tsm_register(dev, &tdx_tsm_link_ops);
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  144  	if (IS_ERR(link))
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  145  		return dev_err_probe(dev, PTR_ERR(link),
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  146  				     "failed to register TSM\n");
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  147  
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  148  	return devm_add_action_or_reset(dev, unregister_link_tsm, link);
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  149  }
1b112a535f8957c drivers/virt/coco/tdx-host/tdx-host.c Lu Baolu 2026-10-21  150  

:::::: The code at line 72 was first introduced by commit
:::::: 1b112a535f8957cf7d7fb213e19fb6e2626368f9 coco/tdx-host: Add skeleton to support PCI link encryption

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Lu Baolu <baolu.lu@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
