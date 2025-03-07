Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394DADDBE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 04:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741321346; cv=none; b=kJ3ki8snFJnWf5iePAZxe+PjK/Ge0nGknn2glFxLbQcKFVKY2HGBVT9jKruvLYKZlCwkjpMb/64503TaPOP74gZMQBgQ72BgJP04izxxY+KtZ0zFxZgLLdkMsSNiWtId89wMMVfviP0ebPPLI/CHbBxMBQKKV0Xkh0O2Qd8EPqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741321346; c=relaxed/simple;
	bh=aRrZJKeBP7uFg9UBizCaZTFuKhP1od1Ze0f7qhbSiJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nVWOpTNRdyNg1H4eqoFMCoyURgbM7DxOb8rbgmnZwVKEE5300x75Hp1g55JpJGXDn604oh7SsnKF3IRCsMv1VtVt/Nu617HO9Vz114W/iEzIHJzoEpAFakjaiIZeMYiy7wyHtPxthMMoDzIg6NiTSsaQppBQimeqoIm1Jv0W/Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nOj40+/g; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nOj40+/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741321345; x=1772857345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aRrZJKeBP7uFg9UBizCaZTFuKhP1od1Ze0f7qhbSiJw=;
  b=nOj40+/gt33L25c0Mj8fwWYtTVzM/n/NaeHZPJ6G3BC+//jj7yqS5gyG
   ZaKFknpXW8NAqc3rU0jcAsr57X51ktvuYWr41MzGIpW994t60pBVDt6Bm
   drMk59fmC6Y2QD7FLSUVLtDZWPdLLYp76szWUyx/9+AsuWl9kDYP8xhgS
   B+3Ncj7mH3rlZ2oi7mQhAbaqH22rwIQdO8mRKElJXta2EHnuCTf6jQoCM
   avMr3IJKc9PviH3RlaYIb1i1aP58bzkISl/Wp+vWcwfrQX6BeLMHDae8x
   7tx+7vKxHCCuOxnTk4n+UYmIob2iUqXPcrNn0YODdkYHzbK0oXoniWknm
   A==;
X-CSE-ConnectionGUID: X2j3jRuhS1mYioWqCC7EhQ==
X-CSE-MsgGUID: N41yqR5qRpCmnSTDFiNiZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42070764"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="42070764"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 20:22:24 -0800
X-CSE-ConnectionGUID: NDf24co8ROKKFgVwuVUwdA==
X-CSE-MsgGUID: lHemp7C2SM2YtkjnErT8xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="119046895"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Mar 2025 20:22:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqPE4-000ONx-1W;
	Fri, 07 Mar 2025 04:22:20 +0000
Date: Fri, 7 Mar 2025 12:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 1/1] drivers/iommu/ioasid.c:719:
 warning: Function parameter or member 'set' not described in
 'ioasid_free_all_in_set'
Message-ID: <202503071259.ed43bkpG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   797aae63f086cf8250bfbb8395ab310c525ac4a6
commit: fd982c0f920fc525226a52b91d52d1f9a89c1db2 [1/1] iommu/ioasid: Add ioasid_set iterator helper functions
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250307/202503071259.ed43bkpG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071259.ed43bkpG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071259.ed43bkpG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/ioasid.c:298: warning: Cannot understand  * @brief Reserve capacity from the system pool
    on line 298 - I thought it was a doc line
   drivers/iommu/ioasid.c:325: warning: Cannot understand  * @brief Return capacity to the system pool
    on line 325 - I thought it was a doc line
   drivers/iommu/ioasid.c:545: warning: Cannot understand  * @brief Free an ioasid_set if empty. Restore pending notification list.
    on line 545 - I thought it was a doc line
>> drivers/iommu/ioasid.c:719: warning: Function parameter or member 'set' not described in 'ioasid_free_all_in_set'
>> drivers/iommu/ioasid.c:749: warning: Function parameter or member 'set' not described in 'ioasid_set_for_each_ioasid'
>> drivers/iommu/ioasid.c:749: warning: Function parameter or member 'fn' not described in 'ioasid_set_for_each_ioasid'
>> drivers/iommu/ioasid.c:749: warning: Function parameter or member 'data' not described in 'ioasid_set_for_each_ioasid'
>> drivers/iommu/ioasid.c:848: warning: Cannot understand  * @brief
    on line 848 - I thought it was a doc line


vim +719 drivers/iommu/ioasid.c

   703	
   704	/**
   705	 * ioasid_free_all_in_set
   706	 *
   707	 * @brief
   708	 * Free all PASIDs from system-wide IOASID pool, all subscribers gets
   709	 * notified and do cleanup of their own.
   710	 * Note that some references of the IOASIDs within the set can still
   711	 * be held after the free call. This is OK in that the IOASIDs will be
   712	 * marked inactive, the only operations can be done is ioasid_put.
   713	 * No need to track IOASID set states since there is no reclaim phase.
   714	 *
   715	 * @param
   716	 * struct ioasid_set where all IOASIDs within the set will be freed.
   717	 */
   718	void ioasid_free_all_in_set(struct ioasid_set *set)
 > 719	{
   720		struct ioasid_data *entry;
   721		unsigned long index;
   722	
   723		if (!ioasid_set_is_valid(set))
   724			return;
   725	
   726		if (xa_empty(&set->xa))
   727			return;
   728	
   729		if (!atomic_read(&set->nr_ioasids))
   730			return;
   731		spin_lock(&ioasid_allocator_lock);
   732		xa_for_each(&set->xa, index, entry) {
   733			ioasid_free_locked(set, index);
   734			/* Free from per set private pool */
   735			xa_erase(&set->xa, index);
   736		}
   737		spin_unlock(&ioasid_allocator_lock);
   738	}
   739	EXPORT_SYMBOL_GPL(ioasid_free_all_in_set);
   740	
   741	/**
   742	 * ioasid_set_for_each_ioasid
   743	 * @brief
   744	 * Iterate over all the IOASIDs within the set
   745	 */
   746	void ioasid_set_for_each_ioasid(struct ioasid_set *set,
   747					void (*fn)(ioasid_t id, void *data),
   748					void *data)
 > 749	{
   750		struct ioasid_data *entry;
   751		unsigned long index;
   752	
   753		xa_for_each(&set->xa, index, entry)
   754			fn(index, data);
   755	}
   756	EXPORT_SYMBOL_GPL(ioasid_set_for_each_ioasid);
   757	
   758	int ioasid_get_locked(struct ioasid_set *set, ioasid_t ioasid)
   759	{
   760		struct ioasid_data *data;
   761	
   762		data = xa_load(&active_allocator->xa, ioasid);
   763		if (!data) {
   764			pr_err("Trying to get unknown IOASID %u\n", ioasid);
   765			return -EINVAL;
   766		}
   767		if (data->state == IOASID_STATE_FREE_PENDING) {
   768			pr_err("Trying to get IOASID being freed%u\n", ioasid);
   769			return -EBUSY;
   770		}
   771	
   772		/* Check set ownership if the set is non-null */
   773		if (set && data->set != set) {
   774			pr_err("Trying to get IOASID %u outside the set\n", ioasid);
   775			/* data found but does not belong to the set */
   776			return -EACCES;
   777		}
   778		refcount_inc(&data->refs);
   779	
   780		return 0;
   781	}
   782	EXPORT_SYMBOL_GPL(ioasid_get_locked);
   783	
   784	/**
   785	 * ioasid_get - obtain a reference to the IOASID
   786	 * @set:	the ioasid_set to check permission against if not NULL
   787	 * @ioasid:	the IOASID to get reference
   788	 *
   789	 *
   790	 * Return: 0 on success, error if failed.
   791	 */
   792	int ioasid_get(struct ioasid_set *set, ioasid_t ioasid)
   793	{
   794		int ret;
   795	
   796		spin_lock(&ioasid_allocator_lock);
   797		ret = ioasid_get_locked(set, ioasid);
   798		spin_unlock(&ioasid_allocator_lock);
   799	
   800		return ret;
   801	}
   802	EXPORT_SYMBOL_GPL(ioasid_get);
   803	
   804	bool ioasid_put_locked(struct ioasid_set *set, ioasid_t ioasid)
   805	{
   806		struct ioasid_data *data;
   807	
   808		data = xa_load(&active_allocator->xa, ioasid);
   809		if (!data) {
   810			pr_err("Trying to put unknown IOASID %u\n", ioasid);
   811			return false;
   812		}
   813		if (set && data->set != set) {
   814			pr_err("Trying to drop IOASID %u outside the set\n", ioasid);
   815			return false;
   816		}
   817		if (!refcount_dec_and_test(&data->refs))
   818			return false;
   819	
   820		ioasid_do_free_locked(data);
   821	
   822		return true;
   823	}
   824	EXPORT_SYMBOL_GPL(ioasid_put_locked);
   825	
   826	/**
   827	 * ioasid_put - Release a reference to an ioasid
   828	 * @set:	the ioasid_set to check permission against if not NULL
   829	 * @ioasid:	the IOASID to drop reference
   830	 *
   831	 * Put a reference to the IOASID, free it when the number of references drops to
   832	 * zero.
   833	 *
   834	 * Return: %true if the IOASID was freed, %false otherwise.
   835	 */
   836	bool ioasid_put(struct ioasid_set *set, ioasid_t ioasid)
   837	{
   838		bool ret;
   839	
   840		spin_lock(&ioasid_allocator_lock);
   841		ret = ioasid_put_locked(set, ioasid);
   842		spin_unlock(&ioasid_allocator_lock);
   843		return ret;
   844	}
   845	EXPORT_SYMBOL_GPL(ioasid_put);
   846	
   847	/**
 > 848	 * @brief
   849	 * Find the ioasid_set of an IOASID. As long as the IOASID is valid,
   850	 * the set must be valid since the refcounting is based on the number of IOASID
   851	 * in the set.
   852	 *
   853	 * @param ioasid
   854	 * @return struct ioasid_set*
   855	 */
   856	struct ioasid_set *ioasid_find_set(ioasid_t ioasid)
   857	{
   858		struct ioasid_allocator_data *idata;
   859		struct ioasid_data *ioasid_data;
   860		struct ioasid_set *set = NULL;
   861	
   862		rcu_read_lock();
   863		idata = rcu_dereference(active_allocator);
   864		ioasid_data = xa_load(&idata->xa, ioasid);
   865		if (!ioasid_data) {
   866			set = ERR_PTR(-ENOENT);
   867			goto unlock;
   868		}
   869		set = ioasid_data->set;
   870	unlock:
   871		rcu_read_unlock();
   872		return set;
   873	}
   874	EXPORT_SYMBOL_GPL(ioasid_find_set);
   875	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
