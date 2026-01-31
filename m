Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19B97261A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 00:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769820461; cv=none; b=tPShwkPrGAujx5yQI+gXyAoTQEfitLC6r1EIhIno6G4jyAevVu4MqAO6OK7VUDACwTByUOswJWkJqsnvfJZVT4F2ixs5l0eh7hJS2lywdf8+Xn65nOGcr2kUqC5gUtdXlQCWHDH7cE9DK6LnomciNk6Wx1Ae5pSicScxL8IsjSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769820461; c=relaxed/simple;
	bh=HWxFICd3njjzxpWgXMKpSxBwr5wbDxCohKp5BaSriQE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Khlet6FQBKAL4RA4yZ2L3sgH8Faiv1cD1ozFOfjNE2GAmc2xoOMxcApyI3MkXG/eFgwPD401O45ErLcdArcmWp5GF9GPQGlf5/dZq7+gqIhG6SWcIaB1itTMpTXygmPCcxUDkRAtScFSb20QUOmiAaUQe3BMd5Et8Gw2SZjjhjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtdFoBU/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtdFoBU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769820460; x=1801356460;
  h=date:from:to:cc:subject:message-id;
  bh=HWxFICd3njjzxpWgXMKpSxBwr5wbDxCohKp5BaSriQE=;
  b=PtdFoBU/CNxFGE2oP6jthbsdybJwpFkAxbxaxd966JNdpRraE9KWhP9m
   PTOMDw12eV2SmJ7rhEuiE/MfL1X3reFyVbvf4RjgYkGgA910SwSZi6+dO
   EJxyk8pV2E6Ga9oiUH9TAC2QSyfWOCBzgbYOejMaUGCOJ+6/mHBBB7YmB
   RRCF9OmqdR+qWfLiT0iezYqPNQfK5HNIkGCyEIg2uG5Q5BLyje2v+Ezdx
   gG4n0eknXV9JDTNmYLX5UsjmWqNNtx2CQ6Qcpi4rvy98J+aOnIZQBkWx6
   3sfoAG4yl+T+FVfpIG1I0VlMpAMThawqpKFtqI5mBf5viM5yl5OFrMai4
   Q==;
X-CSE-ConnectionGUID: CGBlhKc6QGmkGPaA8vNB9Q==
X-CSE-MsgGUID: FqER/JRYT/CckmDxhblPEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="82443707"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="82443707"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 16:47:39 -0800
X-CSE-ConnectionGUID: C/rQ1pgVRHWCyDgHOcebcw==
X-CSE-MsgGUID: nEI+NZwHTOuwf++diDaqjQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2026 16:47:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlz9E-00000000dWG-0LUx;
	Sat, 31 Jan 2026 00:47:36 +0000
Date: Sat, 31 Jan 2026 08:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommufd_noiommu 5/6]
 drivers/iommu/iommufd/ioas.c:388:52: error: passing argument 3 of
 'iopt_get_phys' from incompatible pointer type
Message-ID: <202601310821.PqlENgay-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommufd_noiommu
head:   7786a2757eb91ada48627ce3c749705507a3cdd3
commit: 302d355a6e327aa415cb85ed0e5bf021cbb1f5b3 [5/6] iommufd: Add an ioctl IOMMU_IOAS_GET_PA to query PA from IOVA
config: openrisc-randconfig-r071-20260131 (https://download.01.org/0day-ci/archive/20260131/202601310821.PqlENgay-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310821.PqlENgay-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310821.PqlENgay-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/iommufd/ioas.c: In function 'iommufd_ioas_get_pa':
>> drivers/iommu/iommufd/ioas.c:388:52: error: passing argument 3 of 'iopt_get_phys' from incompatible pointer type [-Wincompatible-pointer-types]
     388 |         rc = iopt_get_phys(&ioas->iopt, cmd->iova, &cmd->out_phys,
         |                                                    ^~~~~~~~~~~~~~
         |                                                    |
         |                                                    __u64 * {aka long long unsigned int *}
   In file included from drivers/iommu/iommufd/io_pagetable.h:14,
                    from drivers/iommu/iommufd/ioas.c:11:
   drivers/iommu/iommufd/iommufd_private.h:123:38: note: expected 'phys_addr_t *' {aka 'unsigned int *'} but argument is of type '__u64 *' {aka 'long long unsigned int *'}
     123 |                         phys_addr_t *paddr, u64 *length);
         |                         ~~~~~~~~~~~~~^~~~~


vim +/iopt_get_phys +388 drivers/iommu/iommufd/ioas.c

   377	
   378	int iommufd_ioas_get_pa(struct iommufd_ucmd *ucmd)
   379	{
   380		struct iommu_ioas_get_pa *cmd = ucmd->cmd;
   381		struct iommufd_ioas *ioas;
   382		int rc;
   383	
   384		ioas = iommufd_get_ioas(ucmd->ictx, cmd->ioas_id);
   385		if (IS_ERR(ioas))
   386			return PTR_ERR(ioas);
   387	
 > 388		rc = iopt_get_phys(&ioas->iopt, cmd->iova, &cmd->out_phys,
   389				   &cmd->out_length);
   390		if (rc)
   391			goto out_put;
   392	
   393		rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
   394	out_put:
   395		iommufd_put_object(ucmd->ictx, &ioas->obj);
   396	
   397		return rc;
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
