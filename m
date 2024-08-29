Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D419148FF0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 05:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724911130; cv=none; b=eoJ+193hqdxpqlNdA3T1gGhD2LvhBT/2++IcFtCvG4mrMuofMImrwnE4tHuiuMClLHB5q+yhRFLsP6a//2EFZBAR8R/3f/BHnG0dx3noybigl6ITBmUcmoAwN25e0LjiAlVC4JD2M9D0ubBNLxbS8BODabQUCAMySbAYvKPXu9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724911130; c=relaxed/simple;
	bh=PbQWdZ7p13WHM8/IJF9V3SQQDDB1jcA7PpMhVuVCh4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qf8u9oT6UmMV0iwvGgAXih/EAhGtqd54KznR5AIiPSCA0ZWRNkQjrrvnQSCyw9YAFLt/4cJo8lfrZY1zPERbsfn7hUPgQjcJLS+ytKF1jc80m0AshjUEwrbh1Nt+/1wcc6UQuKvt7mpxGVuqqOKWtKgqm4fFH8hdD/YRVT59STg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bxavpgby; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bxavpgby"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724911128; x=1756447128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PbQWdZ7p13WHM8/IJF9V3SQQDDB1jcA7PpMhVuVCh4Q=;
  b=bxavpgby2M5QjBeTg7A+Sm6m2ogSeLw0srS8UWU9Lk7CmQwrZ95IcwBm
   jWHzF1yThbdYpJLFz10PFQoZ5+IKUqBdokVn3f6zhElpKe4AwnFJTzHDK
   XDItBBrzGZ6H09AyZYhR3D1aDvPUjMwlVlzh/yq9I6Gauc+f/xxMcnNTo
   itgc/k1copGchgBcYBDb7LofSvu+8rl+/UFIBjZPzIygyNPuZZpzVfkeS
   9h0XUIZOuUEpto7ehwqxxtiQw6VEs1QjVAiOTFnH0cFewNg4gLm3Xx1qT
   PM9AhlB9lW13WUkOcQptp1JUCpiqxciFwCFYwu+r+U1yikOMIGYcz2j5x
   g==;
X-CSE-ConnectionGUID: 4LUDh3hgQyS3QHff3O3TjQ==
X-CSE-MsgGUID: jwAm33xGQ6OpFFGK8rSvUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="34859560"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="34859560"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 22:58:48 -0700
X-CSE-ConnectionGUID: UhyJUF36StaL86vDE+AsYQ==
X-CSE-MsgGUID: Zi6dxSnPTNKtZdJ/COTWWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="94205934"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Aug 2024 22:58:48 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjYBA-000Lky-1f;
	Thu, 29 Aug 2024 05:58:44 +0000
Date: Thu, 29 Aug 2024 13:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hao Chen <970353908@qq.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 29759/30000]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c:1195:5: warning: no
 previous prototype for 'hclge_tm_vf_tc_dwrr_cfg'
Message-ID: <202408291331.7UNWcMmr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   e4b9c4f6ae938c4277cb28e2364b28a566e680cd
commit: 518ea89ec98b78c749c27d6ba7792e1bdb5779ed [29759/30000] net: hns3: add support for vf multiple tcs
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240829/202408291331.7UNWcMmr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408291331.7UNWcMmr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408291331.7UNWcMmr-lkp@intel.com/

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
