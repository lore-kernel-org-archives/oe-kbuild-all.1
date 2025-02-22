Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DE32066F7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 17:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740243649; cv=none; b=MCaHABkaueoskV+dw42IX3y46UFChYG/F7Uv6Zr98/6gH06VBfg0dgrzhJuFo5RZCjfWh2cnnzVA8dSf4XuwgUodJ3gW6onfp2IhXdpV78ubVTnCm3mGOl8PeDBhBWFHxba4BP7b2b5GnMGfrbE7ia5NS+BJp4+5/re8f9jyWZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740243649; c=relaxed/simple;
	bh=MUP6pBS7oV1Wlxv51g7wrqD57Er2Qdc2YOmCeVP8yTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YvEWyY7B4i4fxEHxWj9+YqMC/VIgwi35ZR2vbkhzjzyQ60xysNqi2xHTTqKdvCRowz8I0fqj2IZh24Z7x9hgfMxEsJInOk0LgTuKTN7ESpk0hFeTKMNhMiFq7jXe8uYjWnS3nfwWuIATzFjKWateJDs6e6PM+mhJ5gBT+1lg8ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgdBQNMT; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgdBQNMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740243648; x=1771779648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MUP6pBS7oV1Wlxv51g7wrqD57Er2Qdc2YOmCeVP8yTI=;
  b=DgdBQNMTPF2fMV36v5eg2YahNPQzuDKIHdJtimqJC6OfSal2NwA7o9zh
   YwGWjcxcLzPZg9vA2hq5GQrFkCKlLPi+wgFbvqrZL205n8l8OvXjSVmS5
   OpOgNVyzUeKJghFx1AIxxzwCK3GlEuzBdxkxHynnfS4gm8IhRh/JFhQQO
   xa6nDfwoDrqv8VX3KwvIk8IWLnUvtVCcSysc1dz/T8GQkfDkPWcGsIykb
   2BJvYZqeuE9MGK6diDtiaeEsMMWTusEIc+Gi+/Bri0EM/tzE+MZbXADQO
   w/UKYa+Tp/G6Z87+HIPKz0kcWeV2A5eNaRdl1oCiQR7WIVRIW9jgq/dFt
   w==;
X-CSE-ConnectionGUID: 5kpmVWbvR+GdOvm54Wx9wA==
X-CSE-MsgGUID: LhzhOmLWS/y1W+h5C1oM6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="51673598"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="51673598"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 09:00:44 -0800
X-CSE-ConnectionGUID: J5iNRkxOQPKyQMjW5UeLWQ==
X-CSE-MsgGUID: +j+YnrR+QMKttqXHyUHagg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="115608456"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Feb 2025 09:00:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlsro-0006jP-2T;
	Sat, 22 Feb 2025 17:00:40 +0000
Date: Sun, 23 Feb 2025 00:59:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 422/422] mm/memory.c:1807:22:
 warning: variable 'mapped_pte' set but not used
Message-ID: <202502230055.D0N3PwvL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Miaohe,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   e7df0e6776f0469d11ef3e42afbf2f5c16ea5530
commit: 67a982ee20d20e112f15eff98592a718de7c652e [422/422] mm/memory.c: fix potential pte_unmap_unlock pte error
config: arm-randconfig-001-20250222 (https://download.01.org/0day-ci/archive/20250223/202502230055.D0N3PwvL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502230055.D0N3PwvL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502230055.D0N3PwvL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c: In function 'copy_pte_range':
   mm/memory.c:800:31: warning: variable 'orig_dst_pte' set but not used [-Wunused-but-set-variable]
     800 |         pte_t *orig_src_pte, *orig_dst_pte;
         |                               ^~~~~~~~~~~~
   mm/memory.c:800:16: warning: variable 'orig_src_pte' set but not used [-Wunused-but-set-variable]
     800 |         pte_t *orig_src_pte, *orig_dst_pte;
         |                ^~~~~~~~~~~~
   mm/memory.c: In function 'remap_pte_range':
>> mm/memory.c:1807:22: warning: variable 'mapped_pte' set but not used [-Wunused-but-set-variable]
    1807 |         pte_t *pte, *mapped_pte;
         |                      ^~~~~~~~~~


vim +/mapped_pte +1807 mm/memory.c

  1797	
  1798	/*
  1799	 * maps a range of physical memory into the requested pages. the old
  1800	 * mappings are removed. any references to nonexistent pages results
  1801	 * in null mappings (currently treated as "copy-on-access")
  1802	 */
  1803	static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
  1804				unsigned long addr, unsigned long end,
  1805				unsigned long pfn, pgprot_t prot)
  1806	{
> 1807		pte_t *pte, *mapped_pte;
  1808		spinlock_t *ptl;
  1809		int err = 0;
  1810	
  1811		mapped_pte = pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
  1812		if (!pte)
  1813			return -ENOMEM;
  1814		arch_enter_lazy_mmu_mode();
  1815		do {
  1816			BUG_ON(!pte_none(*pte));
  1817			if (!pfn_modify_allowed(pfn, prot)) {
  1818				err = -EACCES;
  1819				break;
  1820			}
  1821			set_pte_at(mm, addr, pte, pte_mkspecial(pfn_pte(pfn, prot)));
  1822			pfn++;
  1823		} while (pte++, addr += PAGE_SIZE, addr != end);
  1824		arch_leave_lazy_mmu_mode();
  1825		pte_unmap_unlock(mapped_pte, ptl);
  1826		return err;
  1827	}
  1828	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
