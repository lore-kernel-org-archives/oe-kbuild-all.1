Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82EA30E826
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 23:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750375800; cv=none; b=Wt0ZaneuTCS1luUyJwZy+Rk5n0a8cv41T0mhMhPfHLYXVEBziWKQba69m+3n4/GX3zz2ijX98O+8b/+cHD/V8PmIM9shSsw/DxE8tyolUjXZErGTiJSg4TdAThR97pMDbwD8uXXhg4DmVRLWdYAFdJ7h511MXcY2933OqbGBjw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750375800; c=relaxed/simple;
	bh=AeCkILDIs9cGjHmbhoTgrNZMC5jmviVmNCm12EoLBHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BqGuPPRdu714bKhR8yd4RiNQYk0IGwIgJJMJeded5diob17hd+ceEc5PynDC8yqA4VH0qqmLQrSbapDjDPyoKo/JYDd0/FhxNwhPPDFH6dgTHNqoz2OjgUfg6DUmRbZ4QMFUbTqdIJofQSoroRQpPATq5/T5W5vkfZ0ot/TlOpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dmnH9yfn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmnH9yfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750375799; x=1781911799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AeCkILDIs9cGjHmbhoTgrNZMC5jmviVmNCm12EoLBHY=;
  b=dmnH9yfn2Izi+GCaiCcoXJVQIVncvJXtSh8BmmKOPT7ecPKQ7r4FWMVj
   NYlxz8Pj465OryqWhpxfNJCbm2dOSKqRR/9foNUDT9ZvRtJANMYmFgRM0
   Cm3iI+flo6XghAB94Y/tgeUsStVk7r9/2RW3LqzDNF9clCpub5sUtbuFl
   xGzEA9823z9ZQCD9Lqj6/KcDbvFY2bZuy0RyzqIpEaC47Z5UMtTMgFWF2
   Fzks4C/Diirk0L2pE+dTD1UBPIIbwjE9+6qAhmdN353fpr4OBn7WAWK9E
   jLPSEOvF1XaIv9QSnbT8LjzrXlTbxysMxlXV1S3foBszwm08JHgVKVkGz
   Q==;
X-CSE-ConnectionGUID: VlZ+q10iQ/GBYmqgSgErIA==
X-CSE-MsgGUID: F92ickc2TsiyE93Gtr+AGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="51744058"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="51744058"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 16:29:58 -0700
X-CSE-ConnectionGUID: tnHR333TSbG3xy+bUioqcw==
X-CSE-MsgGUID: 03QoLT/+Rbq7eMiPxj+KMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="151446086"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jun 2025 16:29:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSOhe-000LAs-2Q;
	Thu, 19 Jun 2025 23:29:54 +0000
Date: Fri, 20 Jun 2025 07:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: James Houghton <jthoughton@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:rev/userfault 7/16] arch/arm64/kvm/mmu.c:1552:13: error:
 implicit declaration of function 'kvm_is_userfault_memslot'; did you mean
 'kvm_is_visible_memslot'?
Message-ID: <202506200757.fY58AHZY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux rev/userfault
head:   eeac6c6f0380f0667fa04086daffd96954028bed
commit: 13d55dfeb2036ae6cc08c9ddc0119273c9df007e [7/16] KVM: arm64: Add support for KVM userfault exits
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250620/202506200757.fY58AHZY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200757.fY58AHZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200757.fY58AHZY-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/mmu.c: In function 'user_mem_abort':
>> arch/arm64/kvm/mmu.c:1552:13: error: implicit declaration of function 'kvm_is_userfault_memslot'; did you mean 'kvm_is_visible_memslot'? [-Wimplicit-function-declaration]
    1552 |             kvm_is_userfault_memslot(memslot)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
         |             kvm_is_visible_memslot
>> arch/arm64/kvm/mmu.c:1641:13: error: implicit declaration of function 'kvm_do_userfault' [-Wimplicit-function-declaration]
    1641 |         if (kvm_do_userfault(vcpu, &fault))
         |             ^~~~~~~~~~~~~~~~


vim +1552 arch/arm64/kvm/mmu.c

  1472	
  1473	static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
  1474				  struct kvm_s2_trans *nested,
  1475				  struct kvm_memory_slot *memslot, unsigned long hva,
  1476				  bool fault_is_perm)
  1477	{
  1478		int ret = 0;
  1479		bool writable, force_pte = false;
  1480		bool mte_allowed;
  1481		bool device = false, vfio_allow_any_uc = false;
  1482		unsigned long mmu_seq;
  1483		phys_addr_t ipa = fault_ipa;
  1484		struct kvm *kvm = vcpu->kvm;
  1485		struct vm_area_struct *vma;
  1486		short vma_shift;
  1487		void *memcache;
  1488		kvm_pfn_t pfn;
  1489		bool logging_active = memslot_is_logging(memslot);
  1490		long vma_pagesize, fault_granule;
  1491		enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
  1492		struct kvm_pgtable *pgt;
  1493		struct page *page;
  1494		enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
  1495	
  1496		struct kvm_page_fault fault = {
  1497			.write = kvm_is_write_fault(vcpu),
  1498			.exec = kvm_vcpu_trap_is_exec_fault(vcpu),
  1499	
  1500			.slot = memslot,
  1501		};
  1502	
  1503		if (fault_is_perm)
  1504			fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
  1505		VM_BUG_ON(fault.write && fault.exec);
  1506	
  1507		if (fault_is_perm && !fault.write && !fault.exec) {
  1508			kvm_err("Unexpected L2 read permission error\n");
  1509			return -EFAULT;
  1510		}
  1511	
  1512		if (!is_protected_kvm_enabled())
  1513			memcache = &vcpu->arch.mmu_page_cache;
  1514		else
  1515			memcache = &vcpu->arch.pkvm_memcache;
  1516	
  1517		/*
  1518		 * Permission faults just need to update the existing leaf entry,
  1519		 * and so normally don't require allocations from the memcache. The
  1520		 * only exception to this is when dirty logging is enabled at runtime
  1521		 * and a write fault needs to collapse a block entry into a table.
  1522		 */
  1523		if (!fault_is_perm || (logging_active && fault.write)) {
  1524			int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
  1525	
  1526			if (!is_protected_kvm_enabled())
  1527				ret = kvm_mmu_topup_memory_cache(memcache, min_pages);
  1528			else
  1529				ret = topup_hyp_memcache(memcache, min_pages);
  1530	
  1531			if (ret)
  1532				return ret;
  1533		}
  1534	
  1535		/*
  1536		 * Let's check if we will get back a huge page backed by hugetlbfs, or
  1537		 * get block mapping for device MMIO region.
  1538		 */
  1539		mmap_read_lock(current->mm);
  1540		vma = vma_lookup(current->mm, hva);
  1541		if (unlikely(!vma)) {
  1542			kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
  1543			mmap_read_unlock(current->mm);
  1544			return -EFAULT;
  1545		}
  1546	
  1547		/*
  1548		 * logging_active is guaranteed to never be true for VM_PFNMAP
  1549		 * memslots.
  1550		 */
  1551		if (logging_active || is_protected_kvm_enabled() ||
> 1552		    kvm_is_userfault_memslot(memslot)) {
  1553			force_pte = true;
  1554			vma_shift = PAGE_SHIFT;
  1555		} else {
  1556			vma_shift = get_vma_page_shift(vma, hva);
  1557		}
  1558	
  1559		switch (vma_shift) {
  1560	#ifndef __PAGETABLE_PMD_FOLDED
  1561		case PUD_SHIFT:
  1562			if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
  1563				break;
  1564			fallthrough;
  1565	#endif
  1566		case CONT_PMD_SHIFT:
  1567			vma_shift = PMD_SHIFT;
  1568			fallthrough;
  1569		case PMD_SHIFT:
  1570			if (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE))
  1571				break;
  1572			fallthrough;
  1573		case CONT_PTE_SHIFT:
  1574			vma_shift = PAGE_SHIFT;
  1575			force_pte = true;
  1576			fallthrough;
  1577		case PAGE_SHIFT:
  1578			break;
  1579		default:
  1580			WARN_ONCE(1, "Unknown vma_shift %d", vma_shift);
  1581		}
  1582	
  1583		vma_pagesize = 1UL << vma_shift;
  1584	
  1585		if (nested) {
  1586			unsigned long max_map_size;
  1587	
  1588			max_map_size = force_pte ? PAGE_SIZE : PUD_SIZE;
  1589	
  1590			ipa = kvm_s2_trans_output(nested);
  1591	
  1592			/*
  1593			 * If we're about to create a shadow stage 2 entry, then we
  1594			 * can only create a block mapping if the guest stage 2 page
  1595			 * table uses at least as big a mapping.
  1596			 */
  1597			max_map_size = min(kvm_s2_trans_size(nested), max_map_size);
  1598	
  1599			/*
  1600			 * Be careful that if the mapping size falls between
  1601			 * two host sizes, take the smallest of the two.
  1602			 */
  1603			if (max_map_size >= PMD_SIZE && max_map_size < PUD_SIZE)
  1604				max_map_size = PMD_SIZE;
  1605			else if (max_map_size >= PAGE_SIZE && max_map_size < PMD_SIZE)
  1606				max_map_size = PAGE_SIZE;
  1607	
  1608			force_pte = (max_map_size == PAGE_SIZE);
  1609			vma_pagesize = min(vma_pagesize, (long)max_map_size);
  1610		}
  1611	
  1612		/*
  1613		 * Both the canonical IPA and fault IPA must be hugepage-aligned to
  1614		 * ensure we find the right PFN and lay down the mapping in the right
  1615		 * place.
  1616		 */
  1617		if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE) {
  1618			fault_ipa &= ~(vma_pagesize - 1);
  1619			ipa &= ~(vma_pagesize - 1);
  1620		}
  1621	
  1622		fault.gfn = ipa >> PAGE_SHIFT;
  1623		mte_allowed = kvm_vma_mte_allowed(vma);
  1624	
  1625		vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
  1626	
  1627		/* Don't use the VMA after the unlock -- it may have vanished */
  1628		vma = NULL;
  1629	
  1630		/*
  1631		 * Read mmu_invalidate_seq so that KVM can detect if the results of
  1632		 * vma_lookup() or __kvm_faultin_pfn() become stale prior to
  1633		 * acquiring kvm->mmu_lock.
  1634		 *
  1635		 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
  1636		 * with the smp_wmb() in kvm_mmu_invalidate_end().
  1637		 */
  1638		mmu_seq = vcpu->kvm->mmu_invalidate_seq;
  1639		mmap_read_unlock(current->mm);
  1640	
> 1641		if (kvm_do_userfault(vcpu, &fault))
  1642			return -EFAULT;
  1643	
  1644		pfn = __kvm_faultin_pfn(memslot, fault.gfn, fault.write ? FOLL_WRITE : 0,
  1645					&writable, &page);
  1646		if (pfn == KVM_PFN_ERR_HWPOISON) {
  1647			kvm_send_hwpoison_signal(hva, vma_shift);
  1648			return 0;
  1649		}
  1650		if (is_error_noslot_pfn(pfn))
  1651			return -EFAULT;
  1652	
  1653		if (kvm_is_device_pfn(pfn)) {
  1654			/*
  1655			 * If the page was identified as device early by looking at
  1656			 * the VMA flags, vma_pagesize is already representing the
  1657			 * largest quantity we can map.  If instead it was mapped
  1658			 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
  1659			 * and must not be upgraded.
  1660			 *
  1661			 * In both cases, we don't let transparent_hugepage_adjust()
  1662			 * change things at the last minute.
  1663			 */
  1664			device = true;
  1665		} else if (logging_active && !fault.write) {
  1666			/*
  1667			 * Only actually map the page as writable if this was a write
  1668			 * fault.
  1669			 */
  1670			writable = false;
  1671		}
  1672	
  1673		if (fault.exec && device)
  1674			return -ENOEXEC;
  1675	
  1676		/*
  1677		 * Potentially reduce shadow S2 permissions to match the guest's own
  1678		 * S2. For exec faults, we'd only reach this point if the guest
  1679		 * actually allowed it (see kvm_s2_handle_perm_fault).
  1680		 *
  1681		 * Also encode the level of the original translation in the SW bits
  1682		 * of the leaf entry as a proxy for the span of that translation.
  1683		 * This will be retrieved on TLB invalidation from the guest and
  1684		 * used to limit the invalidation scope if a TTL hint or a range
  1685		 * isn't provided.
  1686		 */
  1687		if (nested) {
  1688			writable &= kvm_s2_trans_writable(nested);
  1689			if (!kvm_s2_trans_readable(nested))
  1690				prot &= ~KVM_PGTABLE_PROT_R;
  1691	
  1692			prot |= kvm_encode_nested_level(nested);
  1693		}
  1694	
  1695		kvm_fault_lock(kvm);
  1696		pgt = vcpu->arch.hw_mmu->pgt;
  1697		if (mmu_invalidate_retry(kvm, mmu_seq)) {
  1698			ret = -EAGAIN;
  1699			goto out_unlock;
  1700		}
  1701	
  1702		/*
  1703		 * If we are not forced to use page mapping, check if we are
  1704		 * backed by a THP and thus use block mapping if possible.
  1705		 */
  1706		if (vma_pagesize == PAGE_SIZE && !(force_pte || device)) {
  1707			if (fault_is_perm && fault_granule > PAGE_SIZE)
  1708				vma_pagesize = fault_granule;
  1709			else
  1710				vma_pagesize = transparent_hugepage_adjust(kvm, memslot,
  1711									   hva, &pfn,
  1712									   &fault_ipa);
  1713	
  1714			if (vma_pagesize < 0) {
  1715				ret = vma_pagesize;
  1716				goto out_unlock;
  1717			}
  1718		}
  1719	
  1720		if (!fault_is_perm && !device && kvm_has_mte(kvm)) {
  1721			/* Check the VMM hasn't introduced a new disallowed VMA */
  1722			if (mte_allowed) {
  1723				sanitise_mte_tags(kvm, pfn, vma_pagesize);
  1724			} else {
  1725				ret = -EFAULT;
  1726				goto out_unlock;
  1727			}
  1728		}
  1729	
  1730		if (writable)
  1731			prot |= KVM_PGTABLE_PROT_W;
  1732	
  1733		if (fault.exec)
  1734			prot |= KVM_PGTABLE_PROT_X;
  1735	
  1736		if (device) {
  1737			if (vfio_allow_any_uc)
  1738				prot |= KVM_PGTABLE_PROT_NORMAL_NC;
  1739			else
  1740				prot |= KVM_PGTABLE_PROT_DEVICE;
  1741		} else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC) &&
  1742			   (!nested || kvm_s2_trans_executable(nested))) {
  1743			prot |= KVM_PGTABLE_PROT_X;
  1744		}
  1745	
  1746		/*
  1747		 * Under the premise of getting a FSC_PERM fault, we just need to relax
  1748		 * permissions only if vma_pagesize equals fault_granule. Otherwise,
  1749		 * kvm_pgtable_stage2_map() should be called to change block size.
  1750		 */
  1751		if (fault_is_perm && vma_pagesize == fault_granule) {
  1752			/*
  1753			 * Drop the SW bits in favour of those stored in the
  1754			 * PTE, which will be preserved.
  1755			 */
  1756			prot &= ~KVM_NV_GUEST_MAP_SZ;
  1757			ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, fault_ipa, prot, flags);
  1758		} else {
  1759			ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault_ipa, vma_pagesize,
  1760						     __pfn_to_phys(pfn), prot,
  1761						     memcache, flags);
  1762		}
  1763	
  1764	out_unlock:
  1765		kvm_release_faultin_page(kvm, page, !!ret, writable);
  1766		kvm_fault_unlock(kvm);
  1767	
  1768		/* Mark the page dirty only if the fault is handled successfully */
  1769		if (writable && !ret)
  1770			mark_page_dirty_in_slot(kvm, memslot, fault.gfn);
  1771	
  1772		return ret != -EAGAIN ? ret : 0;
  1773	}
  1774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
