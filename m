Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ACE1A270
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 11:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727176949; cv=none; b=PoE2mlFOPCoQQAHcS8hY4lr7fNQOnI37U6Vw8N9UoCwLmpw2CVOdeV7w/tD/WxebB1cE0fxEcH7uFdbM5YF22/O9cSHiNoGZcK3h7itP76tOgDnJSzpGDbuqMrYQpN3W7qSVKZywAUp+XBElPPuiVmKssyjataOcGQZygyAmfQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727176949; c=relaxed/simple;
	bh=JAPzjhMxF/AKV4XfmmiMXi92pISRnP/5B+0rJXAsXLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bqoAc1e2wpGmhBROBGNxzfnQFF34Z/eNb1V8cXriBwTVdg8aZQUYGL38egYFU7K1iHjt1NkZPca6X8AQeyGfFxSapuTzu8ee8vrFB+1943AWy7Pn7Jcn6E+Yi2wfU4h5vSRm1nm03/rBYhnaP+TdRG/AMuX94ubveZlLX4UsXec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=guzOrioB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="guzOrioB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727176947; x=1758712947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JAPzjhMxF/AKV4XfmmiMXi92pISRnP/5B+0rJXAsXLM=;
  b=guzOrioBkF33T+w4Ms5siDACPZP4PRp6m6V8Mfw7+/IDkapASOVfP/Dp
   uEsYGX+UgDaMj7TdIwAHRvaj08O4tuhDWZZh/MMQQUMCk0RObRzak3bSo
   8/yiSpgUw/BSQ0jwGRIhyahJ217SLAPiezpisnVq7CN2NH8Z7m4h64aXz
   fmsK+MrPPROBllZNVmvjqdilBa62DlyTfaNxRaUJ1dRaHvDEpmhh+pNn/
   YORYiIRxaLLRDlT0SWQjIbJDuD1gbSTdbw3o8LADR2W4Plp4159D/yFN/
   ovHa5YNvBI9PPxJQW+DVStDpRBJYQ9qdgI9yiNa6sSMPrkGtMHQWIjOaT
   Q==;
X-CSE-ConnectionGUID: iGI0pbjaTnaoxYYxtPD5pg==
X-CSE-MsgGUID: e32vO5rRSNuguhZABACQvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="30051394"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="30051394"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 04:22:19 -0700
X-CSE-ConnectionGUID: Y11kxrblTS+3xJrqPHK8+Q==
X-CSE-MsgGUID: Q5ooO6X7TP21V2vmlUlAnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="71722739"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Sep 2024 04:22:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st3cT-000IJB-0j;
	Tue, 24 Sep 2024 11:22:13 +0000
Date: Tue, 24 Sep 2024 19:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1438/2441]
 drivers/iommu/ioasid.c:718: warning: Function parameter or member 'set' not
 described in 'ioasid_free_all_in_set'
Message-ID: <202409241927.5Tb4ixE4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: 0923b8c205255ce52fcffc2dfa731979ec2e7ec0 [1438/2441] iommu/ioasid: Add ioasid_set iterator helper functions
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240924/202409241927.5Tb4ixE4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409241927.5Tb4ixE4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241927.5Tb4ixE4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/ioasid.c:298: warning: Cannot understand  * @brief Reserve capacity from the system pool
    on line 298 - I thought it was a doc line
   drivers/iommu/ioasid.c:325: warning: Cannot understand  * @brief Return capacity to the system pool
    on line 325 - I thought it was a doc line
   drivers/iommu/ioasid.c:545: warning: Cannot understand  * @brief Free an ioasid_set if empty. Restore pending notification list.
    on line 545 - I thought it was a doc line
>> drivers/iommu/ioasid.c:718: warning: Function parameter or member 'set' not described in 'ioasid_free_all_in_set'
>> drivers/iommu/ioasid.c:748: warning: Function parameter or member 'set' not described in 'ioasid_set_for_each_ioasid'
>> drivers/iommu/ioasid.c:748: warning: Function parameter or member 'fn' not described in 'ioasid_set_for_each_ioasid'
>> drivers/iommu/ioasid.c:748: warning: Function parameter or member 'data' not described in 'ioasid_set_for_each_ioasid'
>> drivers/iommu/ioasid.c:847: warning: Cannot understand  * @brief
    on line 847 - I thought it was a doc line


vim +718 drivers/iommu/ioasid.c

   702	
   703	/**
   704	 * ioasid_free_all_in_set
   705	 *
   706	 * @brief
   707	 * Free all PASIDs from system-wide IOASID pool, all subscribers gets
   708	 * notified and do cleanup of their own.
   709	 * Note that some references of the IOASIDs within the set can still
   710	 * be held after the free call. This is OK in that the IOASIDs will be
   711	 * marked inactive, the only operations can be done is ioasid_put.
   712	 * No need to track IOASID set states since there is no reclaim phase.
   713	 *
   714	 * @param
   715	 * struct ioasid_set where all IOASIDs within the set will be freed.
   716	 */
   717	void ioasid_free_all_in_set(struct ioasid_set *set)
 > 718	{
   719		struct ioasid_data *entry;
   720		unsigned long index;
   721	
   722		if (!ioasid_set_is_valid(set))
   723			return;
   724	
   725		if (xa_empty(&set->xa))
   726			return;
   727	
   728		if (!atomic_read(&set->nr_ioasids))
   729			return;
   730		spin_lock(&ioasid_allocator_lock);
   731		xa_for_each(&set->xa, index, entry) {
   732			ioasid_free_locked(set, index);
   733			/* Free from per set private pool */
   734			xa_erase(&set->xa, index);
   735		}
   736		spin_unlock(&ioasid_allocator_lock);
   737	}
   738	EXPORT_SYMBOL_GPL(ioasid_free_all_in_set);
   739	
   740	/**
   741	 * ioasid_set_for_each_ioasid
   742	 * @brief
   743	 * Iterate over all the IOASIDs within the set
   744	 */
   745	void ioasid_set_for_each_ioasid(struct ioasid_set *set,
   746					void (*fn)(ioasid_t id, void *data),
   747					void *data)
 > 748	{
   749		struct ioasid_data *entry;
   750		unsigned long index;
   751	
   752		xa_for_each(&set->xa, index, entry)
   753			fn(index, data);
   754	}
   755	EXPORT_SYMBOL_GPL(ioasid_set_for_each_ioasid);
   756	
   757	int ioasid_get_locked(struct ioasid_set *set, ioasid_t ioasid)
   758	{
   759		struct ioasid_data *data;
   760	
   761		data = xa_load(&active_allocator->xa, ioasid);
   762		if (!data) {
   763			pr_err("Trying to get unknown IOASID %u\n", ioasid);
   764			return -EINVAL;
   765		}
   766		if (data->state == IOASID_STATE_FREE_PENDING) {
   767			pr_err("Trying to get IOASID being freed%u\n", ioasid);
   768			return -EBUSY;
   769		}
   770	
   771		/* Check set ownership if the set is non-null */
   772		if (set && data->set != set) {
   773			pr_err("Trying to get IOASID %u outside the set\n", ioasid);
   774			/* data found but does not belong to the set */
   775			return -EACCES;
   776		}
   777		refcount_inc(&data->refs);
   778	
   779		return 0;
   780	}
   781	EXPORT_SYMBOL_GPL(ioasid_get_locked);
   782	
   783	/**
   784	 * ioasid_get - obtain a reference to the IOASID
   785	 * @set:	the ioasid_set to check permission against if not NULL
   786	 * @ioasid:	the IOASID to get reference
   787	 *
   788	 *
   789	 * Return: 0 on success, error if failed.
   790	 */
   791	int ioasid_get(struct ioasid_set *set, ioasid_t ioasid)
   792	{
   793		int ret;
   794	
   795		spin_lock(&ioasid_allocator_lock);
   796		ret = ioasid_get_locked(set, ioasid);
   797		spin_unlock(&ioasid_allocator_lock);
   798	
   799		return ret;
   800	}
   801	EXPORT_SYMBOL_GPL(ioasid_get);
   802	
   803	bool ioasid_put_locked(struct ioasid_set *set, ioasid_t ioasid)
   804	{
   805		struct ioasid_data *data;
   806	
   807		data = xa_load(&active_allocator->xa, ioasid);
   808		if (!data) {
   809			pr_err("Trying to put unknown IOASID %u\n", ioasid);
   810			return false;
   811		}
   812		if (set && data->set != set) {
   813			pr_err("Trying to drop IOASID %u outside the set\n", ioasid);
   814			return false;
   815		}
   816		if (!refcount_dec_and_test(&data->refs))
   817			return false;
   818	
   819		ioasid_do_free_locked(data);
   820	
   821		return true;
   822	}
   823	EXPORT_SYMBOL_GPL(ioasid_put_locked);
   824	
   825	/**
   826	 * ioasid_put - Release a reference to an ioasid
   827	 * @set:	the ioasid_set to check permission against if not NULL
   828	 * @ioasid:	the IOASID to drop reference
   829	 *
   830	 * Put a reference to the IOASID, free it when the number of references drops to
   831	 * zero.
   832	 *
   833	 * Return: %true if the IOASID was freed, %false otherwise.
   834	 */
   835	bool ioasid_put(struct ioasid_set *set, ioasid_t ioasid)
   836	{
   837		bool ret;
   838	
   839		spin_lock(&ioasid_allocator_lock);
   840		ret = ioasid_put_locked(set, ioasid);
   841		spin_unlock(&ioasid_allocator_lock);
   842		return ret;
   843	}
   844	EXPORT_SYMBOL_GPL(ioasid_put);
   845	
   846	/**
 > 847	 * @brief
   848	 * Find the ioasid_set of an IOASID. As long as the IOASID is valid,
   849	 * the set must be valid since the refcounting is based on the number of IOASID
   850	 * in the set.
   851	 *
   852	 * @param ioasid
   853	 * @return struct ioasid_set*
   854	 */
   855	struct ioasid_set *ioasid_find_set(ioasid_t ioasid)
   856	{
   857		struct ioasid_allocator_data *idata;
   858		struct ioasid_data *ioasid_data;
   859		struct ioasid_set *set = NULL;
   860	
   861		rcu_read_lock();
   862		idata = rcu_dereference(active_allocator);
   863		ioasid_data = xa_load(&idata->xa, ioasid);
   864		if (!ioasid_data) {
   865			set = ERR_PTR(-ENOENT);
   866			goto unlock;
   867		}
   868		set = ioasid_data->set;
   869	unlock:
   870		rcu_read_unlock();
   871		return set;
   872	}
   873	EXPORT_SYMBOL_GPL(ioasid_find_set);
   874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
