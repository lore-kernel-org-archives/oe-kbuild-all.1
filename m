Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7720DA31
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 02:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717815309; cv=none; b=SYoX7RvuCWs9eF1JGMCOYVTMNArWgI8ZMiQ3wF8nE8xDoZodwiZ+KRdNUtlOAr8c+169ejHyt3qEDXBxPpQI4b0mvj+lDtUbzTH/7G3/9pTPklpJqHt2gYCEBCcRW8Zq5Xmp18nzNRapcunMkJLZ0dH2e3hADs/MYZyjO0rp330=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717815309; c=relaxed/simple;
	bh=dvKpldseIqdmsyTeSl2y65JcWk6yhTaI/AWxKphnPPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H9py8QwGRLT7dF6WhSWrgmUMIYYhyM5ZTbG3n9erGUf7eaJ2Q9pfwVasegn8HljfYzvHbmeZtEW9bxOM174ZFX6QHWp987DsCXoo1SUYi9H2k+2JehABTjXQJ42B4Zu4Y4BGSi8uYtYYWbVNBGuFnPkgaSZDHptkKMnfKV5xq2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XpJVvAcY; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpJVvAcY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717815302; x=1749351302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dvKpldseIqdmsyTeSl2y65JcWk6yhTaI/AWxKphnPPQ=;
  b=XpJVvAcYE17kiXyFiXQjQh4IK2eCtMtgqxX/98XqFkkj4mnYpSazeHHW
   xNKAozDgz/76g91SnOeMgSIUP/LYrimi8UTODxGZD0/If7V0YoWe2vz2R
   AntlH5p+xki8bpE6pnIgB9UXbDky0o6yW40nsXvM8oMRHT2iqy6j8+fBE
   Fq6dka1a9upt0VSnutePiiV3qyn2L05f852ILIwr0KbFkN18ApvWxpgOj
   +/Vj1CgHAJGfiqfVGIx80DmyOmP2xEkKsWmD0mNmH20whlcvwIAQ5CjbH
   hHJd6YUhoys5biM5mwyBfGWOSFRj9UdJshQsvzkIHyZcwBeqPm7WTlecq
   w==;
X-CSE-ConnectionGUID: 5IQHRLhuQIy+rBAeZyzAjw==
X-CSE-MsgGUID: eiLO3/j/TV2NcQaj7k0jNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="39954886"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="39954886"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 19:55:01 -0700
X-CSE-ConnectionGUID: 886uAuSRRn61+qPp/qRxvQ==
X-CSE-MsgGUID: S2KGs4GwTxuDozNTBINLeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="69687341"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jun 2024 19:55:00 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFmEM-0000sg-2D;
	Sat, 08 Jun 2024 02:54:58 +0000
Date: Sat, 8 Jun 2024 10:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240607 2/27]
 drivers/iommu/amd/pasid.c:174:19: error: incompatible function pointer types
 initializing 'int (*)(struct iommu_domain *, struct device *, ioasid_t,
 struct iommu_domain *)' (aka 'int (*)(struct iommu_domain *, struct device
 *, unsigned int, struct iommu_d...
Message-ID: <202406081039.PbIH5rnI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240607
head:   59b5678b4e2fd4bba9d971906b9779e419f93a92
commit: 3a910cf9c0388e169e604223b64ec728f157a50f [2/27] iommu: Pass old domain to set_dev_pasid op
config: x86_64-randconfig-122-20240608 (https://download.01.org/0day-ci/archive/20240608/202406081039.PbIH5rnI-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081039.PbIH5rnI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081039.PbIH5rnI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/amd/pasid.c:174:19: error: incompatible function pointer types initializing 'int (*)(struct iommu_domain *, struct device *, ioasid_t, struct iommu_domain *)' (aka 'int (*)(struct iommu_domain *, struct device *, unsigned int, struct iommu_domain *)') with an expression of type 'int (struct iommu_domain *, struct device *, ioasid_t)' (aka 'int (struct iommu_domain *, struct device *, unsigned int)') [-Wincompatible-function-pointer-types]
     174 |         .set_dev_pasid = iommu_sva_set_dev_pasid,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +174 drivers/iommu/amd/pasid.c

a5a91e54846d35 Vasant Hegde 2024-04-18  172  
a5a91e54846d35 Vasant Hegde 2024-04-18  173  static const struct iommu_domain_ops amd_sva_domain_ops = {
a5a91e54846d35 Vasant Hegde 2024-04-18 @174  	.set_dev_pasid = iommu_sva_set_dev_pasid,
a5a91e54846d35 Vasant Hegde 2024-04-18  175  	.free	       = iommu_sva_domain_free
a5a91e54846d35 Vasant Hegde 2024-04-18  176  };
a5a91e54846d35 Vasant Hegde 2024-04-18  177  

:::::: The code at line 174 was first introduced by commit
:::::: a5a91e54846d35c234939fb9170e035805353049 iommu/amd: Add SVA domain support

:::::: TO: Vasant Hegde <vasant.hegde@amd.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
