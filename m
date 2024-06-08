Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716E08BEF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 02:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717813386; cv=none; b=iQPgeCOxlF03SyVQ4NKFGJ29x/JkZenvF9PjeWLnbNU7gnKhcWO7QUFtsxGmq5asPYpmt+mLQXl2qEgIQV0fm/nxdr0FA0rqi8hdCS2Ya2inu3hS1phs58NwNFs54uf+mkBbSSpXk3bOs+QqslcZQ0O3HlkNKdw5jRpQycuLQRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717813386; c=relaxed/simple;
	bh=nfbcPfiSVDUMFbCRkNUPcf0RG26AOrp7im4NF6b2/6I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bk/s2njYOQTQRr/RK51fW0RjXec1Gf4Jyfp0vrU8svvwCQGRmaSYwzBPdynyWSqVV4R+aYZaqnxji5hh8j+WEPpj3sPLseVzbNSpdumG/ZIBfjhR8r5+9oq6vzjwiTNrxOBhJiSjI/+V8c0RAYZOBKmFhaNIG4rcHsNKY1yyiAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Se5/os28; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Se5/os28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717813382; x=1749349382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nfbcPfiSVDUMFbCRkNUPcf0RG26AOrp7im4NF6b2/6I=;
  b=Se5/os28keYKcw7zaqRxW8E54yBA4abtufg+0CscoY+blTT+vPIJR/0d
   OXhdH2ksr1181Zt/wBaMOOMhHzvfvyVoC3pO8tIlnfY/wN/dKKtewFFmu
   Yyh+63Tf33+qcJ5E8Ws7MpsHUdxkIayIkgIFza9jA0z8MYfERnnL/tQc5
   IvuvoShuEUD35+K6ec6tc/lNXgvI4m5bM3tw1a3tptBiolUQWrrU6jT4a
   tsHVHvMdLY/IN+lNwkHoi/X3Ryps9taMCrt4GhPqTjxfTZ2nPp7K0414S
   gKhMJJg4KA/svu8lrevEGPCHwV8PLOYjD40bIkorlIIkixA+yp0j4T767
   A==;
X-CSE-ConnectionGUID: XyYbueHQRcqABwmQyuz5yw==
X-CSE-MsgGUID: qpeP6I6+QqmUpnfxnBIv7w==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25967618"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="25967618"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 19:23:01 -0700
X-CSE-ConnectionGUID: PuTuR57OT3uF9kiIQgwd9g==
X-CSE-MsgGUID: pF0JR77ZQbSeRdp3dKn00A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="43064613"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Jun 2024 19:23:00 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFljN-0000r0-1y;
	Sat, 08 Jun 2024 02:22:57 +0000
Date: Sat, 8 Jun 2024 10:22:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240607 2/27]
 drivers/iommu/amd/pasid.c:174:26: error: initialization of 'int (*)(struct
 iommu_domain *, struct device *, ioasid_t,  struct iommu_domain *)' {aka
 'int (*)(struct iommu_domain *, struct device *, unsigned int,  struct
 iommu_domain *)'} from incompatible ...
Message-ID: <202406081049.lAaiOc6h-lkp@intel.com>
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
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240608/202406081049.lAaiOc6h-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081049.lAaiOc6h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081049.lAaiOc6h-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/amd/pasid.c:174:26: error: initialization of 'int (*)(struct iommu_domain *, struct device *, ioasid_t,  struct iommu_domain *)' {aka 'int (*)(struct iommu_domain *, struct device *, unsigned int,  struct iommu_domain *)'} from incompatible pointer type 'int (*)(struct iommu_domain *, struct device *, ioasid_t)' {aka 'int (*)(struct iommu_domain *, struct device *, unsigned int)'} [-Werror=incompatible-pointer-types]
     174 |         .set_dev_pasid = iommu_sva_set_dev_pasid,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/amd/pasid.c:174:26: note: (near initialization for 'amd_sva_domain_ops.set_dev_pasid')
   cc1: some warnings being treated as errors


vim +174 drivers/iommu/amd/pasid.c

a5a91e54846d35c Vasant Hegde 2024-04-18  172  
a5a91e54846d35c Vasant Hegde 2024-04-18  173  static const struct iommu_domain_ops amd_sva_domain_ops = {
a5a91e54846d35c Vasant Hegde 2024-04-18 @174  	.set_dev_pasid = iommu_sva_set_dev_pasid,
a5a91e54846d35c Vasant Hegde 2024-04-18  175  	.free	       = iommu_sva_domain_free
a5a91e54846d35c Vasant Hegde 2024-04-18  176  };
a5a91e54846d35c Vasant Hegde 2024-04-18  177  

:::::: The code at line 174 was first introduced by commit
:::::: a5a91e54846d35c234939fb9170e035805353049 iommu/amd: Add SVA domain support

:::::: TO: Vasant Hegde <vasant.hegde@amd.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
