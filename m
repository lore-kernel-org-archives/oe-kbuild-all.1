Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F2A2D7B9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 20:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZTzESnB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697576142; x=1729112142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ziignW8NEam21h2wNZ2DWwbWqMFPw5L+Gz3L65fZv0=;
  b=UZTzESnBNKlX3M40WXrzdNx3te2vmGxKPCPJ+u7hH1J1O2Kei1/+wPG6
   z1zlB2/oTyNGwI2l+IwhpG3QH+pNLF49730+ceVXB1tVK8uF8hGRmzocJ
   kknjlk39avMHrPb3dkoU2HLjIO2lOWsGifChzQXz8M644HmqromP6xEWx
   LSiaaWtQ2gTqXpqIXBrjAhgvWsYmKNyK59sYE76ET3n9ermPCmyU59GXh
   6JzbQDCd5dvbBRHmYmFvVD8ZYbCAp3aR9risf4oS7UCj3ctgsD7hQBJRA
   5LYWAI030ldQqG8nd831gokhqZdDtSfQI1iPZd0GZbd0rau12wN1IXjcy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="383101614"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="383101614"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 13:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="1003487276"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="1003487276"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Oct 2023 13:55:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsr6G-000A4Z-1i;
	Tue, 17 Oct 2023 20:55:36 +0000
Date: Wed, 18 Oct 2023 04:55:23 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, David Wei <davidhwei@meta.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Vasundhara Volam <vasundhara-v.volam@broadcom.com>
Subject: [isilence:zc/veth 981/1018]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:5090:42: error: invalid use of
 undefined type 'struct bnxt_vf_info'
Message-ID: <202310180404.aJjM9EZu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: f0e90b8007759fb67368a36df5c34d428acbc040 [981/1018] bnxt: Refactor L2 filter alloc/free firmware commands.
config: x86_64-randconfig-013-20231018 (https://download.01.org/0day-ci/archive/20231018/202310180404.aJjM9EZu-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180404.aJjM9EZu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180404.aJjM9EZu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_vf_target_id':
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:5090:42: error: invalid use of undefined type 'struct bnxt_vf_info'
    5090 |         struct bnxt_vf_info *vf = &pf->vf[vf_idx];
         |                                          ^
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:5092:18: error: invalid use of undefined type 'struct bnxt_vf_info'
    5092 |         return vf->fw_fid;
         |                  ^~
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:5093:1: error: control reaches end of non-void function [-Werror=return-type]
    5093 | }
         | ^
   cc1: some warnings being treated as errors


vim +5090 drivers/net/ethernet/broadcom/bnxt/bnxt.c

  5087	
  5088	static u16 bnxt_vf_target_id(struct bnxt_pf_info *pf, u16 vf_idx)
  5089	{
> 5090		struct bnxt_vf_info *vf = &pf->vf[vf_idx];
  5091	
  5092		return vf->fw_fid;
> 5093	}
  5094	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
