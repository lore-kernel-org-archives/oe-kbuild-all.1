Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584311773A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 20:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718483983; cv=none; b=lnLn/1arIPbdX0i8BjNvq0akVU0khpDJqJfnKULbV9skn5wdg1Kvt9TLABx/R61MJltBrSdn/7JcR1P9VAW2va6EOHASA92qYHelgp7RmfzTVAReS3DD8DLp+yWem2X4mBgUnSll0Im7lvzhFQ4wi7PQ8yanttolvQ3X2aw7Bqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718483983; c=relaxed/simple;
	bh=qd4NEeb+U65z39T5/339lgNXtSh+YefaQ6v6SAKts80=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W1wTPcZlmtUxlw5XH29uo3zZyTGG55IVcWYYm+vzoczudSDnxo9WHpKgyMFbWS3yPiPgk6HudJ4qBG+6XeXb85EsuID0Oynh0J0FyQ174SHsIV688C3jA31qba38LPWbhyvfLwdmkT8VdKyrF9TcyZisecEO0lGgUsiSHqgccoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jEhmk56v; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jEhmk56v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718483980; x=1750019980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qd4NEeb+U65z39T5/339lgNXtSh+YefaQ6v6SAKts80=;
  b=jEhmk56vb2tI88utMEhO2x5KB8xOaCGgS2FrR21vWnb5mRGuF+YfdYE3
   pX7ZMIGg5mPpTtjTmoj0/Dwfh/t3vj8Sq5jnuW2r+hKgFhQh832GgnfZV
   e0Ly1EqE2VW6mQsG8IFWC8IlQZUxWAkwmxdBjMxvQmRVvhfNl9iWCohZU
   96V2HGtCvc4vjbv/xiivIuOoHAPRWUtJbPD7BbUNLim0HsMtJkxQu1IzR
   06+akO7qr8Ee0ZlMRoYmi3Cun/oh3ybBdA7GNp7jxKLrG0N/g3GoZj11n
   hJcuKljKxXovI/LPS8BtjN9oRf+QS18+fNwKEZkz9qKXsZ1KcEu8E4Rn3
   w==;
X-CSE-ConnectionGUID: wukcNi/wT1OnGSV981KJ5Q==
X-CSE-MsgGUID: xlqvhUawQIm9DBlxWVIgIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="40772038"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="40772038"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 13:39:40 -0700
X-CSE-ConnectionGUID: c3zCVU2lTD6XpyVXvL1Gfg==
X-CSE-MsgGUID: 4PytUqB8R56oq7G5t0GCWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="45253857"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jun 2024 13:39:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIaBU-0000U5-16;
	Sat, 15 Jun 2024 20:39:36 +0000
Date: Sun, 16 Jun 2024 04:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1606/22937]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:2626:5: sparse:
 sparse: symbol 'hclge_set_all_vf_rst' was not declared. Should it be static?
Message-ID: <202406160405.uc8O581O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   745a3c567e1c329d131a8896642475f3916d020a
commit: 09262653590358d6bd64c121600490fcfa3312b3 [1606/22937] driver: hns3: update hns3 driver from drivers
config: arm64-randconfig-r111-20240615 (https://download.01.org/0day-ci/archive/20240616/202406160405.uc8O581O-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240616/202406160405.uc8O581O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160405.uc8O581O-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:39:22: sparse: sparse: symbol 'ae_algo' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:238:34: sparse: sparse: cast from restricted __be32
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:239:34: sparse: sparse: cast from restricted __be16
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:2220:16: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] sfp_speed @@
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:2220:16: sparse:     expected unsigned int [usertype]
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:2220:16: sparse:     got restricted __le32 [usertype] sfp_speed
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:2626:5: sparse: sparse: symbol 'hclge_set_all_vf_rst' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3098:6: sparse: sparse: symbol 'hclge_reset_fail' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:8088:21: sparse: sparse: symbol 'hclge_ops' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:2626:5: warning: no previous prototype for 'hclge_set_all_vf_rst' [-Wmissing-prototypes]
    2626 | int hclge_set_all_vf_rst(struct hclge_dev *hdev, bool reset)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3098:6: warning: no previous prototype for 'hclge_reset_fail' [-Wmissing-prototypes]
    3098 | bool hclge_reset_fail(struct hnae3_handle *handle)
         |      ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:8176:5: warning: no previous prototype for 'hclge_init' [-Wmissing-prototypes]
    8176 | int hclge_init(void)
         |     ^~~~~~~~~~

vim +/hclge_set_all_vf_rst +2626 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c

  2625	
> 2626	int hclge_set_all_vf_rst(struct hclge_dev *hdev, bool reset)
  2627	{
  2628		int i;
  2629	
  2630		for (i = hdev->num_vmdq_vport + 1; i < hdev->num_alloc_vport; i++) {
  2631			struct hclge_vport *vport = &hdev->vport[i];
  2632			int ret;
  2633	
  2634			/* Send cmd to set/clear VF's FUNC_RST_ING */
  2635			ret = hclge_set_vf_rst(hdev, vport->vport_id, reset);
  2636			if (ret) {
  2637				dev_err(&hdev->pdev->dev,
  2638					"set vf(%d) rst failded %d!\n",
  2639					vport->vport_id, ret);
  2640				return ret;
  2641			}
  2642	
  2643			if (!reset)
  2644				continue;
  2645	
  2646			/* Inform VF to process the reset.
  2647			 * hclge_inform_reset_assert_to_vf may fail if VF
  2648			 * driver is not loaded.
  2649			 */
  2650			ret = hclge_inform_reset_assert_to_vf(vport);
  2651			if (ret)
  2652				dev_warn(&hdev->pdev->dev,
  2653					 "inform reset to vf(%d) failded %d!\n",
  2654					 vport->vport_id, ret);
  2655		}
  2656	
  2657		return 0;
  2658	}
  2659	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
