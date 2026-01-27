Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA8A345751
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 10:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769511204; cv=none; b=ADU2wfvXxSmPpsDccCNcTBR0o5tWk7SagYTzIQG+qb6SS7L141PvK/hNArWA6Wz70MEZTP1dNmT8wUXISnnwfuM9nfk+vinkLBVghFHrNaZlV9LxaA6bCEwHrQ8JR65Okc7XBmaWltt7CYgthdP+SOIh/2SzaQRd+Am0yBpnurU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769511204; c=relaxed/simple;
	bh=5JVIknwk5gyxKcnzOslVb7nY28N3YTAZLF4V1LuATPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4DSEKGr14GMBVkb1qywjSN3mEa0l+8QJlMlNhkQS8ojg6WpbsD1Sa7fiJ9XGsZMesLDTlRSC/5g1ypW0cckD02ehXa1PTtZ36WC/o/cyUUKwoyq+GlthZY5piNm1uk3vogdtOOIXD8t685l8b81g3gNuR7zt9rfVIWmeYDhn5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dyyn6KEu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dyyn6KEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769511202; x=1801047202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5JVIknwk5gyxKcnzOslVb7nY28N3YTAZLF4V1LuATPs=;
  b=Dyyn6KEuwVkLGLo0UzyLATb/Ama7ll5y9oMDgV6fJ44bIt9wQvXizOV0
   mH5DKBS3UUszSZqTUzeiyc6Gf+G2WugH1xUBQOm3xEPa571s7KCBMo0oQ
   jPvNQqvoFT3KdXNhBf/Yky4A9pvx/u3eXWk3i8U2RgHAeySDuyXgwroL9
   ZnKU4H7d234JJDb4X+kJH1KfD88ktYAz0lNiB8tuBn8ltUOYF4U9JNOC6
   RWiR/N6F59kRIc5hU9RM6gKvy9YJKHBS0+2VrItmUgLernq17R5KLu4OO
   ybQUdWfDHFjnobT8/pSETDqdWPWtTShXbUN+h+nmoBQDnd7vnTcZ8psnb
   Q==;
X-CSE-ConnectionGUID: grCbLy78TBe6v8xL0Wxt7g==
X-CSE-MsgGUID: ADQRuQOsQ0ekcjOPg8y8XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="96167229"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="96167229"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:53:21 -0800
X-CSE-ConnectionGUID: Wq+eU3UVTW+G0hcvS3CrrA==
X-CSE-MsgGUID: uJpKnxgYQ4e4CIXFaVV5NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208376105"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jan 2026 02:53:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkghB-00000000YNk-2m22;
	Tue, 27 Jan 2026 10:53:17 +0000
Date: Tue, 27 Jan 2026 18:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: wenxiong@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: oe-kbuild-all@lists.linux.dev, maddy@linux.ibm.com, haren@linux.ibm.com,
	tyreld@linux.ibm.com, Wen Xiong <wenxiong@linux.ibm.com>
Subject: Re: [PATCH] error path improvement in dlpar add
Message-ID: <202601271817.2ldcFxjL-lkp@intel.com>
References: <20260127021845.2326-1-wenxiong@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127021845.2326-1-wenxiong@linux.ibm.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.19-rc7 next-20260126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wenxiong-linux-ibm-com/error-path-improvement-in-dlpar-add/20260127-121714
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260127021845.2326-1-wenxiong%40linux.ibm.com
patch subject: [PATCH] error path improvement in dlpar add
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20260127/202601271817.2ldcFxjL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271817.2ldcFxjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271817.2ldcFxjL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/pci-hotplug.c:182:12: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     182 |                 pr_err("%s: unable to add hotplug pci device!\n");
         |                         ~^
   include/linux/printk.h:555:25: note: expanded from macro 'pr_err'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ^~~
   include/linux/printk.h:402:21: note: expanded from macro 'pr_fmt'
     402 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/printk.h:512:53: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ^~~
   include/linux/printk.h:484:11: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   1 warning generated.


vim +182 arch/powerpc/kernel/pci-hotplug.c

   125	
   126	/**
   127	 * pci_hp_add_devices - adds new pci devices to bus
   128	 * @bus: the indicated PCI bus
   129	 *
   130	 * This routine will find and fixup new pci devices under
   131	 * the indicated bus. This routine presumes that there
   132	 * might already be some devices under this bridge, so
   133	 * it carefully tries to add only new devices.  (And that
   134	 * is how this routine differs from other, similar pcibios
   135	 * routines.)
   136	 */
   137	void pci_hp_add_devices(struct pci_bus *bus)
   138	{
   139		int mode, max;
   140		struct pci_dev *dev;
   141		struct pci_controller *phb;
   142		struct device_node *dn = pci_bus_to_OF_node(bus);
   143		int ret = 0;
   144	
   145		if (!dn)
   146			return;
   147	
   148		phb = pci_bus_to_host(bus);
   149	
   150		mode = PCI_PROBE_NORMAL;
   151		if (phb->controller_ops.probe_mode)
   152			mode = phb->controller_ops.probe_mode(bus);
   153	
   154		if (mode == PCI_PROBE_DEVTREE) {
   155			/* use ofdt-based probe */
   156			of_rescan_bus(dn, bus);
   157		} else if (mode == PCI_PROBE_NORMAL &&
   158			   dn->child && PCI_DN(dn->child)) {
   159			/*
   160			 * Use legacy probe. In the partial hotplug case, we
   161			 * probably have grandchildren devices unplugged. So
   162			 * we don't check the return value from pci_scan_slot() in
   163			 * order for fully rescan all the way down to pick them up.
   164			 * They can have been removed during partial hotplug.
   165			 */
   166			traverse_siblings_and_scan_slot(dn, bus);
   167			max = bus->busn_res.start;
   168			/*
   169			 * Scan bridges that are already configured. We don't touch
   170			 * them unless they are misconfigured (which will be done in
   171			 * the second scan below).
   172			 */
   173			for_each_pci_bridge(dev, bus)
   174				max = pci_scan_bridge(bus, dev, max, 0);
   175	
   176			/* Scan bridges that need to be reconfigured */
   177			for_each_pci_bridge(dev, bus)
   178				max = pci_scan_bridge(bus, dev, max, 1);
   179		}
   180		ret = pcibios_finish_adding_to_bus(bus);
   181		if (ret)
 > 182			pr_err("%s: unable to add hotplug pci device!\n");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
