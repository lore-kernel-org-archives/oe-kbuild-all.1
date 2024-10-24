Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7AF1F893B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 16:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729788369; cv=none; b=QdQ3hepycZpeDbuDz5jMNrJSP+QY1IiXGPP2HrQAkZV67bmtisqi1uEfkC/CG3c061wshuO0h9WIu+7Ao/PIwuzIpihXQATM/JB4jp0y/dJBS0BpPT//jbktOs0HdwQ2r0zwOGw2Y34h5QNJuqyNe8VACxbdWfspMx/vToeVl8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729788369; c=relaxed/simple;
	bh=W7ohSpGngSgJ1Z9aZ8urkWbmURxBhUYqwR6tbln9/Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tbhOqYoLevfibWBatj6BiF1XaasgtNR36LItOTq/oP9JWhUyMbwpeUyBVCO3aW2RDAoeXvKnvcoEz0idE0jh9rIModA/6XUUpy9oL+MNG8f1m2pTeVq2XW3fyJhUDVHDVU9Q/f91JohPd9bL0KNR1eVroa98f7E9kmfkuQU7BbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USNf4Nxo; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USNf4Nxo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729788368; x=1761324368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W7ohSpGngSgJ1Z9aZ8urkWbmURxBhUYqwR6tbln9/Fw=;
  b=USNf4NxoTJR2KdyLMusMZLw1PCUSmj4yK4KiADVashninFJ6UD+WcJMQ
   /5C2EHiluEOz22jbOGRwkAy9/j7v5Roghwk2nkD7Q9iLanvHGiKDnbyQ+
   bRtbbJEh5Ng2RzWL7+Hsec3+q9iXRYLGyU+xAITmrRBsmwls60lIcEWLE
   mpkHNN9KfygMBWOKNtORithFPuLmcs+3YGkuhrqrpjX18am+kfVVDf5+h
   KM9z7dN1EIqsyxyXNYTPRw6w9yEea3Px6zQoRYZimfT6q1o1orSa51uHy
   t2vQXjBsatmAjlJrhqyIBkBP3sMU7p1MFSWXtIoZ72+L3lw+qc0FMXBY4
   A==;
X-CSE-ConnectionGUID: Q8FUpUfZTqiEeUe9QtVYMA==
X-CSE-MsgGUID: 37qgUOcBRPGf1U5IAwfG6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29296252"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29296252"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 09:46:07 -0700
X-CSE-ConnectionGUID: tg3GZvSbQ7i0f+8uKoDGXw==
X-CSE-MsgGUID: ds4iZLGNQUec1OjWu03XJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80950648"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Oct 2024 09:46:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t40yJ-000WjC-31;
	Thu, 24 Oct 2024 16:46:03 +0000
Date: Fri, 25 Oct 2024 00:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20241024 5/13]
 drivers/iommu/intel/pasid.c:399:22: warning: variable 'pgtt' set but not
 used
Message-ID: <202410250058.ZMXN1QoL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20241024
head:   8e6e633711e7cef3857acd0e5d86d1ffdd8242c0
commit: e4fd875f13325aba0909778a0a7b6f16e5b3c7e5 [5/13] iommu/vt-d: Add pasid replace helpers
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241025/202410250058.ZMXN1QoL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250058.ZMXN1QoL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250058.ZMXN1QoL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/intel/pasid.c: In function 'intel_pasid_replace_first_level':
>> drivers/iommu/intel/pasid.c:399:22: warning: variable 'pgtt' set but not used [-Wunused-but-set-variable]
     399 |         u16 old_did, pgtt;
         |                      ^~~~
   drivers/iommu/intel/pasid.c: In function 'intel_pasid_replace_second_level':
   drivers/iommu/intel/pasid.c:535:27: warning: variable 'pgtt' set but not used [-Wunused-but-set-variable]
     535 |         u16 did, old_did, pgtt;
         |                           ^~~~
   drivers/iommu/intel/pasid.c: In function 'intel_pasid_replace_pass_through':
   drivers/iommu/intel/pasid.c:700:46: warning: variable 'pgtt' set but not used [-Wunused-but-set-variable]
     700 |         u16 did = FLPT_DEFAULT_DID, old_did, pgtt;
         |                                              ^~~~
   drivers/iommu/intel/pasid.c: In function 'intel_pasid_replace_nested':
   drivers/iommu/intel/pasid.c:861:60: warning: variable 'pgtt' set but not used [-Wunused-but-set-variable]
     861 |         u16 did = domain_id_iommu(domain, iommu), old_did, pgtt;
         |                                                            ^~~~


vim +/pgtt +399 drivers/iommu/intel/pasid.c

   393	
   394	int intel_pasid_replace_first_level(struct intel_iommu *iommu,
   395					    struct device *dev, pgd_t *pgd,
   396					    u32 pasid, u16 did, int flags)
   397	{
   398		struct pasid_entry *pte;
 > 399		u16 old_did, pgtt;
   400	
   401		if (!ecap_flts(iommu->ecap)) {
   402			pr_err("No first level translation support on %s\n",
   403			       iommu->name);
   404			return -EINVAL;
   405		}
   406	
   407		if ((flags & PASID_FLAG_FL5LP) && !cap_fl5lp_support(iommu->cap)) {
   408			pr_err("No 5-level paging support for first-level on %s\n",
   409			       iommu->name);
   410			return -EINVAL;
   411		}
   412	
   413		spin_lock(&iommu->lock);
   414		pte = intel_pasid_get_entry(dev, pasid);
   415		if (!pte) {
   416			spin_unlock(&iommu->lock);
   417			return -ENODEV;
   418		}
   419	
   420		if (!pasid_pte_is_present(pte)) {
   421			spin_unlock(&iommu->lock);
   422			return -EINVAL;
   423		}
   424	
   425		old_did = pasid_get_domain_id(pte);
   426		pgtt = pasid_pte_get_pgtt(pte);
   427	
   428		pasid_pte_config_first_level(iommu, pte, pgd, did, flags);
   429		spin_unlock(&iommu->lock);
   430	
   431		intel_pasid_flush_present(iommu, dev, pasid, old_did, pte,
   432					  INTEL_PASID_FLUSH_PRESENT_DRAIN_PRQ);
   433	
   434		return 0;
   435	}
   436	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
