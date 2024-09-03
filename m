Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6656126BE8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 22:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725404322; cv=none; b=nfBeflYpcAHFMeLQmcZLk8Ko22p0wirffgZqG+Na8uHs8VN0NLHZIpis4RNsqkTarfhIGiNlMoVmwOf56EwX90n6foUxNv/tTf4BgHzictMemUW74Y4uSWPKFDBoLIgRl3ORmmluJmZFO91vKPmwNsO7g5lYVV/vct/1i8RO82w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725404322; c=relaxed/simple;
	bh=8tGPpTsm8AtGkVQvPnWbCjJCpI8Gr4C8IotJmQm3KB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=atbkGCz0lFz1kmcqMZ3uyBAzmae1TaNuqhtVe9JYVUnC0OLPCr6Fl+xJkAWD7oWqVf3yWhga+pKk62SJVCD92wAyt8UbLltdjzC5AB858jWuGnyuTWgV6FpY8RC8ODoF3ZOsXATyoG4ZUW/VhVl7a95WoYlfEWh5NY2Qc9Owg3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKr+mjjW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKr+mjjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725404321; x=1756940321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8tGPpTsm8AtGkVQvPnWbCjJCpI8Gr4C8IotJmQm3KB0=;
  b=TKr+mjjWFWTXKnNdlco/PpF1MfbgAedGvlXwCUJlD0+sN3TZebLtGfet
   hE93tg3oi11K9NomHYeeS3v82lLxXDDWHck5Yiz09UJxUABgnvMmPwevb
   d58NOc1pSiYSeLqkwMvHIFOv5GVix9F/0dah74/Ee9LRb183AFHsCmx2K
   Tuvi66CWvvMVp6aafV2ooonY1PBsqAw+o67zKGpI6ijdkNXP9XY2PIjU5
   FlC08otiEKT5Zn0lhTqFSOmX0PFDiMmsjBcgz8DaBqGNeC43mpartv+sB
   VZb1g0mgDpTKJS0UHwJVLktLCwUsD08p6X2Xh2fXeIWLYmsZ//4qHT08v
   Q==;
X-CSE-ConnectionGUID: nZ/+la56R7yC8WblCvSbjw==
X-CSE-MsgGUID: qHBzA3zBSP+my5ytBtrsTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23549279"
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="23549279"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 15:58:40 -0700
X-CSE-ConnectionGUID: g8uQlaRLSI+I4xbeHNnaFg==
X-CSE-MsgGUID: 3ePe+lUdRiS8CJ17c/PK+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,200,1719903600"; 
   d="scan'208";a="65129621"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Sep 2024 15:58:38 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slcTs-0007Jc-1M;
	Tue, 03 Sep 2024 22:58:36 +0000
Date: Wed, 4 Sep 2024 06:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hao Chen <970353908@qq.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29716/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:1195:5: warning: no
 previous prototype for function 'hclge_tm_vf_tc_dwrr_cfg'
Message-ID: <202409040605.jzWfVsDp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b7bed6628b750ffd687d1da0a170dece4b0c08bd
commit: 518ea89ec98b78c749c27d6ba7792e1bdb5779ed [29716/30000] net: hns3: add support for vf multiple tcs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240904/202409040605.jzWfVsDp-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040605.jzWfVsDp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040605.jzWfVsDp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:1195:5: warning: no previous prototype for function 'hclge_tm_vf_tc_dwrr_cfg' [-Wmissing-prototypes]
    1195 | int hclge_tm_vf_tc_dwrr_cfg(struct hclge_vport *vport)
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:1195:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1195 | int hclge_tm_vf_tc_dwrr_cfg(struct hclge_vport *vport)
         | ^
         | static 
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:2323:5: warning: no previous prototype for function 'hclge_mbx_set_vf_multi_tc' [-Wmissing-prototypes]
    2323 | int hclge_mbx_set_vf_multi_tc(struct hclge_vport *vport,
         |     ^
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:2323:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2323 | int hclge_mbx_set_vf_multi_tc(struct hclge_vport *vport,
         | ^
         | static 
   2 warnings generated.


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
