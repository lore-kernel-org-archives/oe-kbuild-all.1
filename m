Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC0F32F765
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 23:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766012972; cv=none; b=h9dTN1qOGG61D9r3swf4khXgdgBx3ha7/Ln4K070Riq/fvM3gTXV1BXArJMUQpG7L7FIrSC7oKFAJoe3jJD8jHyycS4on1ZQ0wpybxqXRbYsSCECN8NCZUzJQKO5aaVM8coPGM5Bonr5nDaw5l0q91MiUowIkNTMWqpIxIztOV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766012972; c=relaxed/simple;
	bh=VNAsbljvW2jhMNU7WXx72s65jLFIVatA2y00f8eU4Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p/FNc1h04dq34Hoxo1IUEeBHCH8zgNmilHbqqxnMlUoEueUo7GdB8Ey4lZAHR4/NMiz9kdMnySN5UANdV7FaPSbfTYoBqZ553OkkjnOQTwo6NAYOx74f829GLqUMRwNZiymN35eW8TBSoJBdHylCmJkTKyWPETWcVnYpHoNhSx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMqVx6Gz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMqVx6Gz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766012970; x=1797548970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VNAsbljvW2jhMNU7WXx72s65jLFIVatA2y00f8eU4Ko=;
  b=NMqVx6GzXwEa0nUnHWmMEwTRescr1wxDfeh9Es39C+MNV7zIevtKmhh6
   n6pym7WQoBv/jvAoUMJretGmwdmvv8XKorFG/I/i5P0rztzzAUmG9jiBW
   x66lj/CCJQvZSOynjegTA18hXps6wR9CdlQEvPS+m0bCCGmIz3MolrQGB
   1MX7rpe/7tKJQJ8nULaAfiV/2aNFgpifV5j/+/De0E7UuZ461J13s/TTh
   4ABvXQApOOn528wKEHUxeOpL9M0DAT06wCKmM3cGg5rkD1XhFrFjhZ0vx
   lmDar7CKr8EJX0mdNuHaCWD+SplfxOAY5tax3DBBBPKrTQO93VEkIFCPt
   A==;
X-CSE-ConnectionGUID: n3n4y738TKaDw0Jk7Gv3cw==
X-CSE-MsgGUID: hXhUdTcXQqqnePis3LXvfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67157129"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67157129"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 15:09:28 -0800
X-CSE-ConnectionGUID: z2zOB5YWQf6dcjls2+hWZA==
X-CSE-MsgGUID: U/eqSww+SRytjsFLXUoXjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198038208"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Dec 2025 15:09:19 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW0dw-000000001KZ-2IRV;
	Wed, 17 Dec 2025 23:09:16 +0000
Date: Thu, 18 Dec 2025 07:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/43]
 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1727:6: warning: no
 previous prototype for 'kfd_fill_cache_non_crat_info'
Message-ID: <202512180748.ft6yRguS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ma,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   12597ffc824d027b45aa3fda9606a4f0c3835d81
commit: 0ac954ec7f6c6dd6b7e94340599ba4b788d056d5 [0/43] drm/amdkfd: Fix the warning of array-index-out-of-bounds
config: x86_64-randconfig-073-20251217 (https://download.01.org/0day-ci/archive/20251218/202512180748.ft6yRguS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180748.ft6yRguS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180748.ft6yRguS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:1727:6: warning: no previous prototype for 'kfd_fill_cache_non_crat_info' [-Wmissing-prototypes]
    1727 | void kfd_fill_cache_non_crat_info(struct kfd_topology_device *dev, struct kfd_dev *kdev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kfd_fill_cache_non_crat_info +1727 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c

  1723	
  1724	/* kfd_fill_cache_non_crat_info - Fill GPU cache info using kfd_gpu_cache_info
  1725	 * tables
  1726	 */
> 1727	void kfd_fill_cache_non_crat_info(struct kfd_topology_device *dev, struct kfd_dev *kdev)
  1728	{
  1729		struct kfd_gpu_cache_info *pcache_info = NULL;
  1730		int i, j, k;
  1731		int ct = 0;
  1732		unsigned int cu_processor_id;
  1733		int ret;
  1734		unsigned int num_cu_shared;
  1735		struct kfd_cu_info cu_info;
  1736		struct kfd_cu_info *pcu_info;
  1737		int gpu_processor_id;
  1738		struct kfd_cache_properties *props_ext;
  1739		int num_of_entries = 0;
  1740		int num_of_cache_types = 0;
  1741		struct kfd_gpu_cache_info cache_info[KFD_MAX_CACHE_TYPES];
  1742	
  1743		amdgpu_amdkfd_get_cu_info(kdev->adev, &cu_info);
  1744		pcu_info = &cu_info;
  1745	
  1746		gpu_processor_id = dev->node_props.simd_id_base;
  1747	
  1748		pcache_info = cache_info;
  1749		num_of_cache_types = kfd_get_gpu_cache_info(kdev, &pcache_info);
  1750		if (!num_of_cache_types) {
  1751			pr_warn("no cache info found\n");
  1752			return;
  1753		}
  1754	
  1755		/* For each type of cache listed in the kfd_gpu_cache_info table,
  1756		 * go through all available Compute Units.
  1757		 * The [i,j,k] loop will
  1758		 *		if kfd_gpu_cache_info.num_cu_shared = 1
  1759		 *			will parse through all available CU
  1760		 *		If (kfd_gpu_cache_info.num_cu_shared != 1)
  1761		 *			then it will consider only one CU from
  1762		 *			the shared unit
  1763		 */
  1764		for (ct = 0; ct < num_of_cache_types; ct++) {
  1765			cu_processor_id = gpu_processor_id;
  1766			if (pcache_info[ct].cache_level == 1) {
  1767				for (i = 0; i < pcu_info->num_shader_engines; i++) {
  1768					for (j = 0; j < pcu_info->num_shader_arrays_per_engine; j++) {
  1769						for (k = 0; k < pcu_info->num_cu_per_sh; k += pcache_info[ct].num_cu_shared) {
  1770	
  1771							ret = fill_in_l1_pcache(&props_ext, pcache_info, pcu_info,
  1772											pcu_info->cu_bitmap[i % 4][j + i / 4], ct,
  1773											cu_processor_id, k);
  1774	
  1775							if (ret < 0)
  1776								break;
  1777	
  1778							if (!ret) {
  1779								num_of_entries++;
  1780								list_add_tail(&props_ext->list, &dev->cache_props);
  1781							}
  1782	
  1783							/* Move to next CU block */
  1784							num_cu_shared = ((k + pcache_info[ct].num_cu_shared) <=
  1785								pcu_info->num_cu_per_sh) ?
  1786								pcache_info[ct].num_cu_shared :
  1787								(pcu_info->num_cu_per_sh - k);
  1788							cu_processor_id += num_cu_shared;
  1789						}
  1790					}
  1791				}
  1792			} else {
  1793				ret = fill_in_l2_l3_pcache(&props_ext, pcache_info,
  1794									pcu_info, ct, cu_processor_id);
  1795	
  1796				if (ret < 0)
  1797					break;
  1798	
  1799				if (!ret) {
  1800					num_of_entries++;
  1801					list_add_tail(&props_ext->list, &dev->cache_props);
  1802				}
  1803			}
  1804		}
  1805		dev->node_props.caches_count += num_of_entries;
  1806		pr_debug("Added [%d] GPU cache entries\n", num_of_entries);
  1807	}
  1808	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
