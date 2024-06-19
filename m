Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852D926AC6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 02:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718763760; cv=none; b=ptgQih1gOLUQl7PQikOcI/+uv796MGiNgZZUQ5uSOaYPDar1r6t1LjufC4JwEE8dHYBPyhUMJJck14nl44BjPaq2JUNXsyODoPMZwYpt+bgoK7DjGp0gX6tEQqaV7hwqlFrWMkQvvDzqIrne3Z9TSqg6TI6E771q5uyLQtA9aF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718763760; c=relaxed/simple;
	bh=CU7uJ0gZc+b5ULBIews5u93ULLY/f68dr+OQtivL0Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m/8UnMdQchty0fX/2itMEBNEz8tUP+machw3LWWQPSxRdJ7PdHKQVDg2DFT9zM5Mk8zKMqwfDawM7fLNqcCBFECiaSvmSTLDRfiTI2vGI95NvYG6FDffGToWyg3ugIRR/rLmRTnbECzOS4I7CgmtuyEm58S/L9cR2CJ6quvWAKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXdWxBfe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXdWxBfe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718763759; x=1750299759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CU7uJ0gZc+b5ULBIews5u93ULLY/f68dr+OQtivL0Fg=;
  b=gXdWxBfep7YJbspA1CMPXKSk8cNVSUpsnc4DqB6QWM68MrDVqWbhje68
   bqn7KOfIhutXa/JS0TfybfhlnqhB0s5a30XPDWQkBPpG8T+dIF/M81+y3
   L9BhtZPPl0hlrZ2xtbsACB1vaTJ6VmsmJxTWLP4JV8XYuBk36yMdpJJJ9
   fZpRaaGncRs1sBTkHzS0In6QH/sg/1f7d/UXXV/6OW+BFBSggwYRajBH0
   +yxmaID38gwLtaB0inZ2XN3FX+Qh/qG6gAlClLZfyRMNW2yt0m3gtLDm7
   aUPN+YhNr0XZSOm+dnwHO/UPV7n86uJ1/gt8RYOCJjAucVsQDCfxr+ttD
   A==;
X-CSE-ConnectionGUID: 9cUtsanVRbKfIvLA5PHXMg==
X-CSE-MsgGUID: 2JJyvHBATRWnI455i8vVUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27081878"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="27081878"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 19:22:38 -0700
X-CSE-ConnectionGUID: G0L47fdPQtS7bljCGe7YFA==
X-CSE-MsgGUID: DH+ccEOBSbO9Fd1CnZYGPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="46186226"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Jun 2024 19:22:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJky2-0006Ak-1h;
	Wed, 19 Jun 2024 02:22:34 +0000
Date: Wed, 19 Jun 2024 10:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 14909/22966]
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9556:5: sparse:
 sparse: symbol 'hclge_reset_tqp_cmd' was not declared. Should it be static?
Message-ID: <202406191011.L7AJtzLw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   26bfb7d9b0ef31487312e8e9e6eb097acaf5d739
commit: 729f96a4e0c32f1c1bfa60e4ff485aa91890963d [14909/22966] net: hns3: optimize the process of queue reset
config: arm64-randconfig-r111-20240615 (https://download.01.org/0day-ci/archive/20240619/202406191011.L7AJtzLw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240619/202406191011.L7AJtzLw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406191011.L7AJtzLw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3345:5: sparse: sparse: symbol 'hclge_set_all_vf_rst' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9556:5: sparse: sparse: symbol 'hclge_reset_tqp_cmd' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9603:5: sparse: sparse: symbol 'hclge_reset_rcb' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:11592:21: sparse: sparse: symbol 'hclge_ops' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3345:5: warning: no previous prototype for 'hclge_set_all_vf_rst' [-Wmissing-prototypes]
    3345 | int hclge_set_all_vf_rst(struct hclge_dev *hdev, bool reset)
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9556:5: warning: no previous prototype for 'hclge_reset_tqp_cmd' [-Wmissing-prototypes]
    9556 | int hclge_reset_tqp_cmd(struct hnae3_handle *handle)
         |     ^~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9603:5: warning: no previous prototype for 'hclge_reset_rcb' [-Wmissing-prototypes]
    9603 | int hclge_reset_rcb(struct hnae3_handle *handle)
         |     ^~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:11699:5: warning: no previous prototype for 'hclge_init' [-Wmissing-prototypes]
   11699 | int hclge_init(void)
         |     ^~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_get_strings':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:668:50: warning: '%s' directive output may be truncated writing up to 3359 bytes into a region of size 32 [-Wformat-truncation=]
     668 |                 snprintf(buff, ETH_GSTRING_LEN, "%s", strs[i].desc);
         |                                                  ^~
   In function 'hclge_comm_get_strings',
       inlined from 'hclge_get_strings' at drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:774:7:
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:668:17: note: 'snprintf' output between 1 and 3360 bytes into a destination of size 32
     668 |                 snprintf(buff, ETH_GSTRING_LEN, "%s", strs[i].desc);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_cmd.h:9,
                    from drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:18:
   In function 'hclge_func_reset_cmd',
       inlined from 'hclge_reset_prepare_wait' at drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3608:9:
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3467:26: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    3467 |         hnae3_set_bit(req->mac_func_reset, HCLGE_CFG_RESET_FUNC_B, 1);
   drivers/net/ethernet/hisilicon/hns3/hnae3.h:720:18: note: in definition of macro 'hnae3_set_field'
     720 |                 (origin) &= (~(mask)); 35-      |                  ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3467:9: note: in expansion of macro 'hnae3_set_bit'
    3467 |         hnae3_set_bit(req->mac_func_reset, HCLGE_CFG_RESET_FUNC_B, 1);
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_reset_prepare_wait':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3462:27: note: at offset 8 into object 'desc' of size 32
    3462 |         struct hclge_desc desc;
         |                           ^~~~
   In function 'hclge_func_reset_cmd',
       inlined from 'hclge_reset_prepare_wait' at drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3608:9:
   drivers/net/ethernet/hisilicon/hns3/hnae3.h:721:26: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
     721 |                 (origin) |= ((val) << (shift)) & (mask); 47-      |                 ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hnae3.h:726:9: note: in expansion of macro 'hnae3_set_field'
     726 |         hnae3_set_field((origin), (0x1 << (shift)), (shift), (val))
         |         ^~~~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3467:9: note: in expansion of macro 'hnae3_set_bit'
    3467 |         hnae3_set_bit(req->mac_func_reset, HCLGE_CFG_RESET_FUNC_B, 1);
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_reset_prepare_wait':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3462:27: note: at offset 8 into object 'desc' of size 32
    3462 |         struct hclge_desc desc;
         |                           ^~~~
   In function 'hclge_func_reset_cmd',
       inlined from 'hclge_reset_prepare_wait' at drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3608:9:
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3468:29: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    3468 |         req->fun_reset_vfid = func_id;
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_reset_prepare_wait':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3462:27: note: at offset 8 into object 'desc' of size 32
    3462 |         struct hclge_desc desc;
         |                           ^~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_func_reset_cmd':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3467:26: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    3467 |         hnae3_set_bit(req->mac_func_reset, HCLGE_CFG_RESET_FUNC_B, 1);
         |                          ^~
   drivers/net/ethernet/hisilicon/hns3/hnae3.h:720:18: note: in definition of macro 'hnae3_set_field'
     720 |                 (origin) &= (~(mask)); 73-      |                  ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3467:9: note: in expansion of macro 'hnae3_set_bit'
    3467 |         hnae3_set_bit(req->mac_func_reset, HCLGE_CFG_RESET_FUNC_B, 1);
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3462:27: note: at offset 8 into object 'desc' of size 32
    3462 |         struct hclge_desc desc;
         |                           ^~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3467:26: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    3467 |         hnae3_set_bit(req->mac_func_reset, HCLGE_CFG_RESET_FUNC_B, 1);
         |                          ^~
   drivers/net/ethernet/hisilicon/hns3/hnae3.h:721:18: note: in definition of macro 'hnae3_set_field'
     721 |                 (origin) |= ((val) << (shift)) & (mask); 85-      |                  ^~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3467:9: note: in expansion of macro 'hnae3_set_bit'
    3467 |         hnae3_set_bit(req->mac_func_reset, HCLGE_CFG_RESET_FUNC_B, 1);
         |         ^~~~~~~~~~~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3462:27: note: at offset 8 into object 'desc' of size 32
    3462 |         struct hclge_desc desc;
         |                           ^~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3468:12: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    3468 |         req->fun_reset_vfid = func_id;
         |            ^~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:3462:27: note: at offset 8 into object 'desc' of size 32
    3462 |         struct hclge_desc desc;
         |                           ^~~~
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_reset_rcb':
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:9619:26: warning: array subscript 'struct hclge_reset_cmd[0]' is partly outside array bounds of 'struct hclge_desc[1]' [-Warray-bounds=]
    9619 |         hnae3_set_bit(req->fun_reset_rcb, HCLGE_CFG_RESET_RCB_B, 1);
         |                          ^~
   drivers/net/ethernet/hisilicon/hns3/hnae3.h:720:18: note: in definition of macro 'hnae3_set_field'

vim +/hclge_reset_tqp_cmd +9556 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c

  9555	
> 9556	int hclge_reset_tqp_cmd(struct hnae3_handle *handle)
  9557	{
  9558		struct hclge_vport *vport = hclge_get_vport(handle);
  9559		struct hclge_dev *hdev = vport->back;
  9560		u16 reset_try_times = 0;
  9561		int reset_status;
  9562		u16 queue_gid;
  9563		int ret;
  9564		u16 i;
  9565	
  9566		for (i = 0; i < handle->kinfo.num_tqps; i++) {
  9567			queue_gid = hclge_covert_handle_qid_global(handle, i);
  9568			ret = hclge_reset_tqp_cmd_send(hdev, queue_gid, true);
  9569			if (ret) {
  9570				dev_err(&hdev->pdev->dev,
  9571					"failed to send reset tqp cmd, ret = %d\n",
  9572					ret);
  9573				return ret;
  9574			}
  9575	
  9576			while (reset_try_times++ < HCLGE_TQP_RESET_TRY_TIMES) {
  9577				reset_status = hclge_get_reset_status(hdev, queue_gid);
  9578				if (reset_status)
  9579					break;
  9580	
  9581				/* Wait for tqp hw reset */
  9582				usleep_range(1000, 1200);
  9583			}
  9584	
  9585			if (reset_try_times >= HCLGE_TQP_RESET_TRY_TIMES) {
  9586				dev_err(&hdev->pdev->dev,
  9587					"wait for tqp hw reset timeout\n");
  9588				return -ETIME;
  9589			}
  9590	
  9591			ret = hclge_reset_tqp_cmd_send(hdev, queue_gid, false);
  9592			if (ret) {
  9593				dev_err(&hdev->pdev->dev,
  9594					"failed to deassert soft reset, ret = %d\n",
  9595					ret);
  9596				return ret;
  9597			}
  9598			reset_try_times = 0;
  9599		}
  9600		return 0;
  9601	}
  9602	
> 9603	int hclge_reset_rcb(struct hnae3_handle *handle)
  9604	{
  9605	#define HCLGE_RESET_RCB_NOT_SUPPORT	0U
  9606	#define HCLGE_RESET_RCB_SUCCESS		1U
  9607		struct hclge_vport *vport = hclge_get_vport(handle);
  9608		struct hclge_dev *hdev = vport->back;
  9609		struct hclge_reset_cmd *req;
  9610		struct hclge_desc desc;
  9611		u8 return_status;
  9612		u16 queue_gid;
  9613		int ret;
  9614	
  9615		queue_gid = hclge_covert_handle_qid_global(handle, 0);
  9616	
  9617		req = (struct hclge_reset_cmd *)desc.data;
  9618		hclge_cmd_setup_basic_desc(&desc, HCLGE_OPC_CFG_RST_TRIGGER, false);
  9619		hnae3_set_bit(req->fun_reset_rcb, HCLGE_CFG_RESET_RCB_B, 1);
  9620		req->fun_reset_rcb_vqid_start = cpu_to_le16(queue_gid);
  9621		req->fun_reset_rcb_vqid_num = cpu_to_le16(handle->kinfo.num_tqps);
  9622	
  9623		ret = hclge_cmd_send(&hdev->hw, &desc, 1);
  9624		if (ret) {
  9625			dev_err(&hdev->pdev->dev,
  9626				"failed to send rcb reset cmd, ret = %d\n", ret);
  9627			return ret;
  9628		}
  9629	
  9630		return_status = req->fun_reset_rcb_return_status;
  9631		if (return_status == HCLGE_RESET_RCB_SUCCESS)
  9632			return 0;
  9633	
  9634		if (return_status != HCLGE_RESET_RCB_NOT_SUPPORT) {
  9635			dev_err(&hdev->pdev->dev, "failed to reset rcb, ret = %u\n",
  9636				return_status);
  9637			return -EIO;
  9638		}
  9639	
  9640		/* if reset rcb cmd is unsupported, we need to send reset tqp cmd
  9641		 * again to reset all tqps
  9642		 */
  9643		return hclge_reset_tqp_cmd(handle);
  9644	}
  9645	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
