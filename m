Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E6B22DF99
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 04:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765598942; cv=none; b=aX2q+Q23azLSsuSfcos/C5VjjhHSc8DCZmEZ1pggc3R4gKNaJP8l8OEWwiWnR5lf/pW7M3pkb6qdcdokfqL49Qjog90l3jgVRQfanLapOcjKSp+lPeng93SgGKU/mvhItYde0RoIO9KRHBDDvytgeEuPHssUtkqkfBVsNFhMIWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765598942; c=relaxed/simple;
	bh=V8rSlcABn1ws5N1ykIwF6vQfz0ZhMvm3CE5gRl3muUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rfifQQRfMkw6cmWLCpiIYuUgc1ru8kmbu+VbFwLUeFR6Nvz3POhy1jl0UUW86Y+AE2bP6GiZo9Ypob4C0iuQ6AA3p0Ty5xlF21cp8DhMPt4+gDoJmz8eVccH5RKMQmq8VkpC8MdvORJXIc7bh5upOrOzxvsAuPWQ6ZrRJtTVpX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NIlah5Mt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NIlah5Mt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765598940; x=1797134940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V8rSlcABn1ws5N1ykIwF6vQfz0ZhMvm3CE5gRl3muUA=;
  b=NIlah5MteEruqk7hGPldCCMjZCjMEdwvMz9AKSP1uQM4lL6Rr/Lyc2QL
   XDf8D4VDveUvOxEp/u2dwpbM0L32EGNMjSjxYDkgrj2bO1w/yaWv+GUKY
   KNp6lQLm1PJypbXwfES1YKdmIWOOXBL2j1MOivYVLOzh5Fmq3IPIIsyOK
   g/YiyMzHznGg7ptngTjejxIg0XZ+9ebk2VPlWXTVMueemo1dPgOSItuS/
   yIr2RmGLC2USGtsoiodllCnp9fhFPD7IjvTvUwd0T4iiphdH4UVh5tBPD
   yWODcpLgIEA8OMyVPL+dmNuKNUXY9FJmojHbK7nxYMtEjXS/mXmYJD40D
   g==;
X-CSE-ConnectionGUID: j/XCVetiRNK8qmsniDaCGw==
X-CSE-MsgGUID: s6MrlL+VQSy5i669VX5Rvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="66770922"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="66770922"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 20:08:58 -0800
X-CSE-ConnectionGUID: sCmdjdiLQz2oYRND+WqbHg==
X-CSE-MsgGUID: Hu5eiml2TDuWrYsS1JdcMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="196860871"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Dec 2025 20:08:57 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUGwB-0000000071t-2RLq;
	Sat, 13 Dec 2025 04:08:55 +0000
Date: Sat, 13 Dec 2025 12:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3541/3541]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:1214:5: warning: no
 previous prototype for 'hclge_tm_vf_tc_dwrr_cfg'
Message-ID: <202512131229.07COqzuf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd9eb9b4365b71652b2c2ac58293bea47c9f9302
commit: bc47b7dc2b0180a0d6e7ad218e6c8f5e4fca07a9 [3541/3541] net: hns3: add support for vf multiple tcs
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20251213/202512131229.07COqzuf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131229.07COqzuf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131229.07COqzuf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:1214:5: warning: no previous prototype for 'hclge_tm_vf_tc_dwrr_cfg' [-Wmissing-prototypes]
    1214 | int hclge_tm_vf_tc_dwrr_cfg(struct hclge_vport *vport)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:2357:5: warning: no previous prototype for 'hclge_mbx_set_vf_multi_tc' [-Wmissing-prototypes]
    2357 | int hclge_mbx_set_vf_multi_tc(struct hclge_vport *vport,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hclge_tm_vf_tc_dwrr_cfg +1214 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c

  1213	
> 1214	int hclge_tm_vf_tc_dwrr_cfg(struct hclge_vport *vport)
  1215	{
  1216		struct hnae3_knic_private_info *kinfo = &vport->nic.kinfo;
  1217		struct hclge_dev *hdev = vport->back;
  1218		struct hclge_pg_info *pg_info;
  1219		u8 dwrr;
  1220		int ret;
  1221		u32 i;
  1222	
  1223		for (i = 0; i < kinfo->tc_info.max_tc; i++) {
  1224			pg_info = &hdev->tm_info.pg_info[hdev->tm_info.tc_info[i].pgid];
  1225			dwrr = i < kinfo->tc_info.num_tc ? pg_info->tc_dwrr[i] : 0;
  1226			ret = hclge_tm_qs_weight_cfg(hdev, vport->qs_offset + i, dwrr);
  1227			if (ret)
  1228				return ret;
  1229		}
  1230	
  1231		return 0;
  1232	}
  1233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
