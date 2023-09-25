Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B5C1C283
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 15:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695656309; x=1727192309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P5WYgYVhZBqoOQfHjqXKRq0VM8wbJjpj9VUxPGNRh/0=;
  b=Jb17TuGOk0nQjBeyXIAO1A4sg8ytmX3h5JLm/TMQbSgXXOafojInnEPz
   UG1B2q+Z2Atbp12TXzaG6irPoqHuk/i0bM+k66Qm3r1u24sMbRPj7srTY
   +6QdWCltv3LWckUzfKqSRgHhRg8EZcd+LfzqoJUibICdL/G3oyr433L8J
   +nlukNo76y7OcoPyFDdlA1KIk2P+CD9zkaJGDzVLoXY+KjA65n/9XYyzH
   M6bdqzH04shwLmiTNVNkJcTFvHfe0tACe200kpF2mzlUppjoUJENv5/7A
   4m9rjfvWsGvRYKmRaxDv62sLZ3I+B40zXikwqHfC6gyRiheN0MQMeGDvu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="378566503"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="378566503"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 08:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838596888"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="838596888"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Sep 2023 08:38:27 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qknfF-0001hN-2s;
	Mon, 25 Sep 2023 15:38:25 +0000
Date: Mon, 25 Sep 2023 23:38:18 +0800
From: kernel test robot <lkp@intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tinazhangzw:per-iommu_IOTLB_invalidation 14/14]
 drivers/iommu/intel/svm.c:159:40: error: 'struct iommu_domain' has no member
 named 'domain'
Message-ID: <202309252332.vUY8IrkF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/TinaZhangZW/linux.git per-iommu_IOTLB_invalidation
head:   c5144840fce67da51a43d9b6ef05b4b344f5786f
commit: c5144840fce67da51a43d9b6ef05b4b344f5786f [14/14] iommu/vt-d: Remove superfluous IOMMU IOTLB invalidations
config: x86_64-randconfig-006-20230925 (https://download.01.org/0day-ci/archive/20230925/202309252332.vUY8IrkF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309252332.vUY8IrkF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309252332.vUY8IrkF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/intel/svm.c: In function '__flush_svm_range_dev':
>> drivers/iommu/intel/svm.c:159:40: error: 'struct iommu_domain' has no member named 'domain'
     159 |         u32 pasid = mm_get_pasid(domain->domain.mm);
         |                                        ^~


vim +159 drivers/iommu/intel/svm.c

ff3dc6521f7813 drivers/iommu/intel-svm.c Jacob Pan       2020-01-02  154  
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  155  static void __flush_svm_range_dev(struct iommu_domain *domain,
2d6ffc63f12417 drivers/iommu/intel/svm.c Lu Baolu        2020-12-31  156  				  unsigned long address,
2d6ffc63f12417 drivers/iommu/intel/svm.c Lu Baolu        2020-12-31  157  				  unsigned long pages, int ih)
2f26e0a9c9860d drivers/iommu/intel-svm.c David Woodhouse 2015-09-09  158  {
6b707182dc1388 drivers/iommu/intel/svm.c Tina Zhang      2023-09-25 @159  	u32 pasid = mm_get_pasid(domain->domain.mm);
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  160  	struct device_domain_info *info;
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  161  	struct intel_iommu *iommu;
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  162  	struct dev_pasid_info *dev_pasid;
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  163  	unsigned long idx;
9872f9bd9dbd68 drivers/iommu/intel/svm.c Lu Baolu        2021-01-14  164  
9872f9bd9dbd68 drivers/iommu/intel/svm.c Lu Baolu        2021-01-14  165  	if (WARN_ON(!pages))
9872f9bd9dbd68 drivers/iommu/intel/svm.c Lu Baolu        2021-01-14  166  		return;
9872f9bd9dbd68 drivers/iommu/intel/svm.c Lu Baolu        2021-01-14  167  
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  168  	rcu_read_lock();
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  169  	list_for_each_entry_rcu(domain, &domain->mm->iommu_mm->sva_domains, next) {
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  170  		xa_for_each(&to_dmar_domain(domain)->iommu_array, idx, iommu)
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  171  			qi_flush_piotlb(iommu, FLPT_DEFAULT_DID,
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  172  					pasid, address, pages, ih);
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  173  	}
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  174  
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  175  	list_for_each_entry_rcu(dev_pasid, &to_dmar_domain(domain)->dev_pasids, link_domain) {
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  176  		info = dev_iommu_priv_get(dev_pasid->dev);
e65a6897be5e49 drivers/iommu/intel/svm.c Jacob Pan       2022-12-01  177  		if (info->ats_enabled) {
555ad86bf0259a drivers/iommu/intel/svm.c Tina Zhang      2023-09-25  178  			qi_flush_dev_iotlb_pasid(dev_pasid->iommu, dev_pasid->sid, info->pfsid,
555ad86bf0259a drivers/iommu/intel/svm.c Tina Zhang      2023-09-25  179  						 pasid, dev_pasid->qdep, address,
9872f9bd9dbd68 drivers/iommu/intel/svm.c Lu Baolu        2021-01-14  180  						 order_base_2(pages));
e65a6897be5e49 drivers/iommu/intel/svm.c Jacob Pan       2022-12-01  181  			quirk_extra_dev_tlb_flush(info, address, order_base_2(pages),
555ad86bf0259a drivers/iommu/intel/svm.c Tina Zhang      2023-09-25  182  						  pasid, dev_pasid->qdep);
e65a6897be5e49 drivers/iommu/intel/svm.c Jacob Pan       2022-12-01  183  		}
2f26e0a9c9860d drivers/iommu/intel-svm.c David Woodhouse 2015-09-09  184  	}
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  185  	rcu_read_unlock();
c5144840fce67d drivers/iommu/intel/svm.c Tina Zhang      2023-09-08  186  }
2f26e0a9c9860d drivers/iommu/intel-svm.c David Woodhouse 2015-09-09  187  

:::::: The code at line 159 was first introduced by commit
:::::: 6b707182dc13881992faac36f4cd1566bb5f0380 iommu/vt-d: Remove struct intel_svm

:::::: TO: Tina Zhang <tina.zhang@intel.com>
:::::: CC: Tina Zhang <tina.zhang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
