Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1734224CF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 01:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730079487; cv=none; b=YuHakwckeDJCZEOqeOtvHKaokiCJeNyR+jsIxs7NTchnnBjqv928UcSV57iIb3m9t6IDUkZcchW9uALJy6YSYXeBLoraSc1UWjN8Dhfvf9mJXX7HJlPCEVuGq/vYGdrXVbqPXkyaHUxMmMnOun53stG5JKTAHwasZkpW+ehfZes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730079487; c=relaxed/simple;
	bh=/9fb8a9TWKoJcUhilsKI7gPPk1Y1z7AORQajxRgKpVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rXOWtznUQLI1IWBEODmVBZGWz+eRZLGXoONegXc4Wv5r7YINZvxRB79OVsfzhZAqfLox0/ieEMou6UQNsP5/1zoqpfZLkzq8/yIiObXSShpTZsTfZeqmBNhT0rZdw32GQJdCc/2yLH3aOSY+kbo5HDi/M9USKa69C0dZLkEt5zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfnDzPWO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfnDzPWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730079485; x=1761615485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/9fb8a9TWKoJcUhilsKI7gPPk1Y1z7AORQajxRgKpVg=;
  b=TfnDzPWOi4s8XFfpVOhvoM3+JHpECvPpNeRB4CBUIR994gCLh3hr4yiE
   EI/r3kuZd9GjPRjJiSsO3+Ax7VwITjHIH31gRsPyHtD5+xCtVUEYauLQe
   5Qi412TP1NZkmBNGBecOpoYMhoaNDa7H2DmOA+KS5CZQuxbPElkPwGomu
   GAOY0UvxLOoYbUHkX8P1hfvfqTt8jx3ZqwnYjY0oOZkvTWiycbTpQlamy
   ZlLNNJeHC8IpYcSTpxJW9G70SnA0w37Mh0SNfhSjxTN44W8XnBkbeteFt
   d5hTmYeWm/dDAxcdYoFciI25nF/OkwMnBbHzBdv6vq2ZYEl3JnFqo/gBV
   A==;
X-CSE-ConnectionGUID: TdIHDFBUTxWvIlznwX37Vg==
X-CSE-MsgGUID: 2xvqXAf5SB+oXEw+QkixAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40770031"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40770031"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 18:38:04 -0700
X-CSE-ConnectionGUID: Un9Bb96EQuqWOwVVT3zCKQ==
X-CSE-MsgGUID: j2OEa2y0RTSWkOq5NlguBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="86067575"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Oct 2024 18:38:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Ehk-000b9c-3A;
	Mon, 28 Oct 2024 01:38:00 +0000
Date: Mon, 28 Oct 2024 09:37:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hao Chen <970353908@qq.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 28837/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:1195:5: warning: no
 previous prototype for 'hclge_tm_vf_tc_dwrr_cfg'
Message-ID: <202410280946.pPdl5dH4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hao,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: 518ea89ec98b78c749c27d6ba7792e1bdb5779ed [28837/30000] net: hns3: add support for vf multiple tcs
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20241028/202410280946.pPdl5dH4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280946.pPdl5dH4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280946.pPdl5dH4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:1195:5: warning: no previous prototype for 'hclge_tm_vf_tc_dwrr_cfg' [-Wmissing-prototypes]
    1195 | int hclge_tm_vf_tc_dwrr_cfg(struct hclge_vport *vport)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:2323:5: warning: no previous prototype for 'hclge_mbx_set_vf_multi_tc' [-Wmissing-prototypes]
    2323 | int hclge_mbx_set_vf_multi_tc(struct hclge_vport *vport,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hclge_tm_vf_tc_dwrr_cfg +1195 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c

  1194	
> 1195	int hclge_tm_vf_tc_dwrr_cfg(struct hclge_vport *vport)
  1196	{
  1197		struct hnae3_knic_private_info *kinfo = &vport->nic.kinfo;
  1198		struct hclge_dev *hdev = vport->back;
  1199		struct hclge_pg_info *pg_info;
  1200		u8 dwrr;
  1201		int ret;
  1202		u32 i;
  1203	
  1204		for (i = 0; i < kinfo->tc_info.max_tc; i++) {
  1205			pg_info = &hdev->tm_info.pg_info[hdev->tm_info.tc_info[i].pgid];
  1206			dwrr = i < kinfo->tc_info.num_tc ? pg_info->tc_dwrr[i] : 0;
  1207			ret = hclge_tm_qs_weight_cfg(hdev, vport->qs_offset + i, dwrr);
  1208			if (ret)
  1209				return ret;
  1210		}
  1211	
  1212		return 0;
  1213	}
  1214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
