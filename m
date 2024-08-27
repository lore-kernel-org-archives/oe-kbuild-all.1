Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7757C133
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 21:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724792480; cv=none; b=AE1to1JGtgUuP1HgFgCqXLxJwAZbvV9ta9D7qOlp8baj3S5PR25rIJRYWWqHQPdpAj/qA+nEZ9P2TC0fyAlnZqWIxVoCef5yGbHyMVFNXWqV5LakruX+4BGytezK1rsEXj9quGBPa1gfmJT/5CHaPckEKb1QJpN0nakNMyiFvQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724792480; c=relaxed/simple;
	bh=G6S9ZXF540KJ0ogMM2vMWXKqNUNMdb0caATckOJ5YK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=imjGWTQojplUdxsHUtBI0r2iQz95Gi6AmOfKEVh3WOQBIY/1z7ENoVwZ9QIX0t3fQNjPULDWVsFkTK/PNUk9ggMOywrdxu4FHO6xsDZiaDhl7ShD1XI0DGruUDqEF/RP4Sl3TUF2n7kifmqDb8AsAJuDrLomD2R/S8Vd+clk33s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKEvZSnd; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKEvZSnd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724792477; x=1756328477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G6S9ZXF540KJ0ogMM2vMWXKqNUNMdb0caATckOJ5YK0=;
  b=kKEvZSnd3PQreIKTUOybD7O4d7HurDd+kW9y2Pg1UtMY8IYeFvbLCXvx
   p19RIJe76mwCu8dxdr1n74/FQdzcLoWm4eyUpnMLcIyJgrKgmPevTkjPx
   rly156JkDXT4zQHeCdRILvuAGtJ+tbTkN59XNvqWoeap9TJvRoKPPv1xC
   sF+rGlWrxeWfwGQOaRzVIomWbo1wKAIC9GsvhpzwuAEmc460ZrNPN7nmQ
   ihE6oeoCpj0LLFdHXlrdkd0jQ/T1mF0kgDQAyZ+q4qE2mWwmh0WzVZcGN
   0kvToqYQGKnXdE7FfieewO4TghsphTm1SCBBcYenmyBM8NT6kbqWW+ExG
   Q==;
X-CSE-ConnectionGUID: 4jny5MmcQP2jUaqZeRfHnA==
X-CSE-MsgGUID: DjHMB0nJR/uRZ0nUeyKATw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23457136"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="23457136"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 14:01:17 -0700
X-CSE-ConnectionGUID: lpCGtIyTSNqpjRBJqiVicQ==
X-CSE-MsgGUID: KJN8VBQoR+izz1K1dhp20g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="93787724"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Aug 2024 14:01:16 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj3JS-000K4y-0j;
	Tue, 27 Aug 2024 21:01:14 +0000
Date: Wed, 28 Aug 2024 05:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 19/19] vfio/pci: Implement huge_fault support
Message-ID: <202408280405.b1X5dVHo-lkp@intel.com>
References: <20240826204353.2228736-20-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826204353.2228736-20-peterx@redhat.com>

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-Introduce-ARCH_SUPPORTS_HUGE_PFNMAP-and-special-bits-to-pmd-pud/20240827-044708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240826204353.2228736-20-peterx%40redhat.com
patch subject: [PATCH v2 19/19] vfio/pci: Implement huge_fault support
config: i386-randconfig-063-20240827 (https://download.01.org/0day-ci/archive/20240828/202408280405.b1X5dVHo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280405.b1X5dVHo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280405.b1X5dVHo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/vfio/pci/vfio_pci_core.c:246:33: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:246:41: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:250:25: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:250:43: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:250:56: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:250:65: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:255:25: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:255:44: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:255:57: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:255:66: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:263:39: sparse: sparse: restricted pci_power_t degrades to integer
   drivers/vfio/pci/vfio_pci_core.c:263:58: sparse: sparse: restricted pci_power_t degrades to integer
>> drivers/vfio/pci/vfio_pci_core.c:1705:9: sparse: sparse: cast from restricted vm_fault_t

vim +1705 drivers/vfio/pci/vfio_pci_core.c

  1660	
  1661	static vm_fault_t vfio_pci_mmap_huge_fault(struct vm_fault *vmf,
  1662						   unsigned int order)
  1663	{
  1664		struct vm_area_struct *vma = vmf->vma;
  1665		struct vfio_pci_core_device *vdev = vma->vm_private_data;
  1666		unsigned long pfn, pgoff = vmf->pgoff - vma->vm_pgoff;
  1667		vm_fault_t ret = VM_FAULT_SIGBUS;
  1668	
  1669		if (order && (vmf->address & ((PAGE_SIZE << order) - 1) ||
  1670			      vmf->address + (PAGE_SIZE << order) > vma->vm_end)) {
  1671			ret = VM_FAULT_FALLBACK;
  1672			goto out;
  1673		}
  1674	
  1675		pfn = vma_to_pfn(vma);
  1676	
  1677		down_read(&vdev->memory_lock);
  1678	
  1679		if (vdev->pm_runtime_engaged || !__vfio_pci_memory_enabled(vdev))
  1680			goto out_unlock;
  1681	
  1682		switch (order) {
  1683		case 0:
  1684			ret = vmf_insert_pfn(vma, vmf->address, pfn + pgoff);
  1685			break;
  1686	#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
  1687		case PMD_ORDER:
  1688			ret = vmf_insert_pfn_pmd(vmf, __pfn_to_pfn_t(pfn + pgoff,
  1689								     PFN_DEV), false);
  1690			break;
  1691	#endif
  1692	#ifdef CONFIG_ARCH_SUPPORTS_PUD_PFNMAP
  1693		case PUD_ORDER:
  1694			ret = vmf_insert_pfn_pud(vmf, __pfn_to_pfn_t(pfn + pgoff,
  1695								     PFN_DEV), false);
  1696			break;
  1697	#endif
  1698		default:
  1699			ret = VM_FAULT_FALLBACK;
  1700		}
  1701	
  1702	out_unlock:
  1703		up_read(&vdev->memory_lock);
  1704	out:
> 1705		dev_dbg_ratelimited(&vdev->pdev->dev,
  1706				   "%s(,order = %d) BAR %ld page offset 0x%lx: 0x%x\n",
  1707				    __func__, order,
  1708				    vma->vm_pgoff >>
  1709					(VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT),
  1710				    pgoff, (unsigned int)ret);
  1711	
  1712		return ret;
  1713	}
  1714	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
