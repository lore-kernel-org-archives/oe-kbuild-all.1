Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8319156778
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 08:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707381157; cv=none; b=P/Kle4jP4sxHEJ/Ix5BjC9tSCotaW+sgV4/OhXpZ0IdvELLoBvhgTZ7H9fkSgzzWo5oShA4HwcgrjoyMajXd12R+2C38hhV1SHTdiqQ7QVUtNza0DZbqx1R4D1DEE5yNC+qSn0EmEGP/1XWlvu1N9hYI8OX2rwNQm3lOPA5NOek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707381157; c=relaxed/simple;
	bh=OuOe4eN7gldCMvCQA+1jVBYnW6EcqCFM2EBJDdznjHc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e21gvV5GC6zdbQ79LKArzQgpUvKiEr0gdvSEuG9sed8XkKw5CR//grKzFzbLj6pkQQbam8igsxjTaKCyIDId/LgIqW52Uy22u4SGIsiWgrJ3tWxZieSE1mtAvczlUTHd0DPSChmteJrL38lnzKgeIfHg2tuAEFp6XrS2OHgmJvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yj/W7Duu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yj/W7Duu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707381156; x=1738917156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OuOe4eN7gldCMvCQA+1jVBYnW6EcqCFM2EBJDdznjHc=;
  b=Yj/W7DuumZFevn18WPupBozejaXXQGYTxIFf6Vv2S/ZtOP/QseNLm56t
   Jy+iSBwV/cuBfx/aCyv/6Jxn5IIPeLZeszYfv4hvBlAghNJL+OI8CC/2h
   yk0DEuiNMSJopla5DZ+pijZQzzgVhRk4F8/w5MjiSfXIApfVigBS6ZFPT
   zlTCwdabbb6PKe4gUmMVNP/PSCUXWyZyi40L1x3pxyMtXtvgSO5PhJnnN
   48qaZpYl+prL+VLF0zWZT69ytY0KQ/JchUAE7JHQGa0s+kQVy7Zyfzq8t
   aMustm3LFVIjIdLTMmTuamQgZPSZTQp5ZhCUeyqJiadKp6cKNMRfhMAmH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="11907697"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="11907697"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 00:32:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1912801"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Feb 2024 00:32:33 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXzpe-0003XI-1V;
	Thu, 08 Feb 2024 08:32:30 +0000
Date: Thu, 8 Feb 2024 16:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: Gaurav Batra <gbatra@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [linux-next:pending-fixes 171/335]
 arch/powerpc/platforms/pseries/pci_dlpar.c:38:undefined reference to
 `ppc_iommu_register_device'
Message-ID: <202402081627.nFKfKh2A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   cdf641895851e4edf648a3d063e90f8f5a07e77f
commit: ed8b94f6e0acd652ce69bd69d678a0c769172df8 [171/335] powerpc/pseries/iommu: Fix iommu initialisation during DLPAR add
config: powerpc64-randconfig-c004-20211019 (https://download.01.org/0day-ci/archive/20240208/202402081627.nFKfKh2A-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081627.nFKfKh2A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081627.nFKfKh2A-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `ppc_iommu_register_device'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: arch/powerpc/platforms/pseries/pci_dlpar.o: in function `init_phb_dynamic':
>> arch/powerpc/platforms/pseries/pci_dlpar.c:38:(.text+0x98): undefined reference to `ppc_iommu_register_device'
   powerpc64-linux-ld: arch/powerpc/platforms/pseries/pci_dlpar.o: in function `remove_phb_dynamic':
>> arch/powerpc/platforms/pseries/pci_dlpar.c:81:(.text+0x1fc): undefined reference to `ppc_iommu_unregister_device'


vim +38 arch/powerpc/platforms/pseries/pci_dlpar.c

    20	
    21	struct pci_controller *init_phb_dynamic(struct device_node *dn)
    22	{
    23		struct pci_controller *phb;
    24	
    25		pr_debug("PCI: Initializing new hotplug PHB %pOF\n", dn);
    26	
    27		phb = pcibios_alloc_controller(dn);
    28		if (!phb)
    29			return NULL;
    30		rtas_setup_phb(phb);
    31		pci_process_bridge_OF_ranges(phb, dn, 0);
    32		phb->controller_ops = pseries_pci_controller_ops;
    33	
    34		pci_devs_phb_init_dynamic(phb);
    35	
    36		pseries_msi_allocate_domains(phb);
    37	
  > 38		ppc_iommu_register_device(phb);
    39	
    40		/* Create EEH devices for the PHB */
    41		eeh_phb_pe_create(phb);
    42	
    43		if (dn->child)
    44			pseries_eeh_init_edev_recursive(PCI_DN(dn));
    45	
    46		pcibios_scan_phb(phb);
    47		pcibios_finish_adding_to_bus(phb->bus);
    48	
    49		return phb;
    50	}
    51	EXPORT_SYMBOL_GPL(init_phb_dynamic);
    52	
    53	/* RPA-specific bits for removing PHBs */
    54	int remove_phb_dynamic(struct pci_controller *phb)
    55	{
    56		struct pci_bus *b = phb->bus;
    57		struct pci_host_bridge *host_bridge = to_pci_host_bridge(b->bridge);
    58		struct resource *res;
    59		int rc, i;
    60	
    61		pr_debug("PCI: Removing PHB %04x:%02x...\n",
    62			 pci_domain_nr(b), b->number);
    63	
    64		/* We cannot to remove a root bus that has children */
    65		if (!(list_empty(&b->children) && list_empty(&b->devices)))
    66			return -EBUSY;
    67	
    68		/* We -know- there aren't any child devices anymore at this stage
    69		 * and thus, we can safely unmap the IO space as it's not in use
    70		 */
    71		res = &phb->io_resource;
    72		if (res->flags & IORESOURCE_IO) {
    73			rc = pcibios_unmap_io_space(b);
    74			if (rc) {
    75				printk(KERN_ERR "%s: failed to unmap IO on bus %s\n",
    76				       __func__, b->name);
    77				return 1;
    78			}
    79		}
    80	
  > 81		ppc_iommu_unregister_device(phb);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
