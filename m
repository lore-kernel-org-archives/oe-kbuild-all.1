Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18EE1F4176
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 00:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771461980; cv=none; b=i5HLtEpYNAHkXGEIKLd0UvFqQJNYNZujx63lCw0kR6T7enLAnKlPokqBpsFCXF3oHvw/rt41vZcgbX7vtwgZKAIouhThwVzlxF95+KO8o6tm/8fDhI7TUVHksjoBSdDCeKafu3OnvH9IsuYHo7d30GGEJcV9fHnVEV8lZU6nN40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771461980; c=relaxed/simple;
	bh=dNMxUOIXA7R2XsiurMlPAyLIVsjE0GtP97Cz06LxbOA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cS3bBDhvVrYdFiyk4K5LASTCsJMY5zeRnFZK0K3/tEy/6+porJFwo3LYVcYNuTYMykmq5Jnk3RbS8ZKI3wC+SSxD8y13Rwz4g4vfeMdiu5WMS2ozFh9mGAI2PTCgZbK/bDMGAH/VkoJvOOGiWD2a7ir1dxgRGb3LEf08G7vYByk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTLkU60A; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTLkU60A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771461977; x=1802997977;
  h=date:from:to:cc:subject:message-id;
  bh=dNMxUOIXA7R2XsiurMlPAyLIVsjE0GtP97Cz06LxbOA=;
  b=GTLkU60AvvIdl1xDfTPjdtzncq8Rw+qjVs+V1WEqANq/ZE8aWhlaMhK+
   ZLn9tJrBoZ598WHOL/iFqqlCBlQm6Mg2Dlm8oSm3pB8BO9bv+VIgwY4Ce
   hK2hMwP13ninWenzJNYzzuMQGi2Tu24TAjfthaaiO39UhVJPeQnUIXkfJ
   Mklt8oyTEteYwUFOmeBnS1xpDMTnWBpzjfaaC4rcs9RPqHBkZEV3Y77iJ
   xxWTccj5splVPTh/0jLV6pnuvGAheHK8pjATUlboSaK5iPoZ9MrNLwoTM
   JOju71S98mLvePkZTrNqAflUJPcqEvRlCLeRhTCZ0JFnyCLAQIL306UdB
   w==;
X-CSE-ConnectionGUID: klQRH2R9RJ+vH8UE1aTGbw==
X-CSE-MsgGUID: SAIyJR7VTJ+9DXIR3OCQ8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="98009243"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="98009243"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 16:46:17 -0800
X-CSE-ConnectionGUID: GwBoEej9SBGkQONlQneAmA==
X-CSE-MsgGUID: e9NigTZlTHCqyM/GcxOc4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="218890037"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Feb 2026 16:46:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vssBI-000000012qK-3Bx5;
	Thu, 19 Feb 2026 00:46:12 +0000
Date: Thu, 19 Feb 2026 08:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Yishai Hadas <yishaih@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>, Edward Srouji <edwards@nvidia.com>
Subject: drivers/infiniband/core/ib_core_uverbs.c:249:undefined
 reference to `dma_buf_move_notify'
Message-ID: <202602190832.RTYwo5mP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23b0f90ba871f096474e1c27c3d14f455189d2d9
commit: 0ac6f4056c4a257f4b230b910e3e6fee6c6fc9b9 RDMA/uverbs: Add DMABUF object type and operations
date:   10 days ago
config: x86_64-randconfig-005-20250616 (https://download.01.org/0day-ci/archive/20260219/202602190832.RTYwo5mP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190832.RTYwo5mP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190832.RTYwo5mP-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/infiniband/core/ib_core_uverbs.o: in function `rdma_user_mmap_entry_remove':
>> drivers/infiniband/core/ib_core_uverbs.c:249:(.text+0x8bd): undefined reference to `dma_buf_move_notify'
>> ld: drivers/infiniband/core/ib_core_uverbs.c:250:(.text+0x8de): undefined reference to `dma_resv_wait_timeout'
   ld: drivers/infiniband/core/ib_core_uverbs.o: in function `dma_resv_unlock':
>> include/linux/dma-resv.h:463:(.text+0x8f1): undefined reference to `dma_resv_reset_max_fences'


vim +249 drivers/infiniband/core/ib_core_uverbs.c

   223	
   224	/**
   225	 * rdma_user_mmap_entry_remove() - Drop reference to entry and
   226	 *				   mark it as unmmapable
   227	 *
   228	 * @entry: the entry to insert into the mmap_xa
   229	 *
   230	 * Drivers can call this to prevent userspace from creating more mappings for
   231	 * entry, however existing mmaps continue to exist and ops->mmap_free() will
   232	 * not be called until all user mmaps are destroyed.
   233	 */
   234	void rdma_user_mmap_entry_remove(struct rdma_user_mmap_entry *entry)
   235	{
   236		struct ib_uverbs_dmabuf_file *uverbs_dmabuf, *tmp;
   237	
   238		if (!entry)
   239			return;
   240	
   241		mutex_lock(&entry->dmabufs_lock);
   242		xa_lock(&entry->ucontext->mmap_xa);
   243		entry->driver_removed = true;
   244		xa_unlock(&entry->ucontext->mmap_xa);
   245		list_for_each_entry_safe(uverbs_dmabuf, tmp, &entry->dmabufs, dmabufs_elm) {
   246			dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
   247			list_del(&uverbs_dmabuf->dmabufs_elm);
   248			uverbs_dmabuf->revoked = true;
 > 249			dma_buf_move_notify(uverbs_dmabuf->dmabuf);
 > 250			dma_resv_wait_timeout(uverbs_dmabuf->dmabuf->resv,
   251					      DMA_RESV_USAGE_BOOKKEEP, false,
   252					      MAX_SCHEDULE_TIMEOUT);
   253			dma_resv_unlock(uverbs_dmabuf->dmabuf->resv);
   254			kref_put(&uverbs_dmabuf->kref, ib_uverbs_dmabuf_done);
   255			wait_for_completion(&uverbs_dmabuf->comp);
   256		}
   257		mutex_unlock(&entry->dmabufs_lock);
   258	
   259		kref_put(&entry->ref, rdma_user_mmap_entry_free);
   260	}
   261	EXPORT_SYMBOL(rdma_user_mmap_entry_remove);
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
