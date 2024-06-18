Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770EA13A41D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 10:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706710; cv=none; b=j62D5QgrxYMXPFcxjIajWT0Nc/U6creh3bViSYMdDQko/0ahxNSEaxc4+H716vDGY9pyozBx+pYaX40RhK+CqMcoUvqIrSAbL3ySFguVnjAzd3pVCZ/yxmFdbssQChdCouGrjs3S8MyARDVSzH04UgXhAAvmsSJf21Y2uG3TQp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706710; c=relaxed/simple;
	bh=CDRd64mkAR0V3D3zhbKCrhc2LnHxos36+27Vn3qxXlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qhOKrUcOu04sj49Wdb1i7rH2Gv0XRfuwQPxXLh36v3VmSaLQwDNg6STqGqUs3+PJsn1+g92Cpw0E7H/6+A0eAcJBKLFtDHc4QIuJWB3DLJjyjpIHHfnaKDBWM7cf/5PtGLvTMWZts3DGgo5vpnr7Nv2C4MByzrju6VErk9FRT9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iaNPfgPJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iaNPfgPJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718706708; x=1750242708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CDRd64mkAR0V3D3zhbKCrhc2LnHxos36+27Vn3qxXlo=;
  b=iaNPfgPJpVGbdk+6a7GKX2lr1ZCIYWh/1lR59H58ULfJIi7qYqm5/JM5
   rdqBxIIfY/wzIYl6crLmM1ktkMGsQMRDa1e3UvMr7kwq9VlS2Jluhyxw7
   CQUZrFRDT5LJCftUpGAy/HyfHEVD3esOHBWtcEd5BdihdTYcHMonOnNoq
   wy4euFn0F2afY+EFIG6dJP98oXO2yaaUwUYA+WnlCwxtvbmRfaw723fRy
   Uw2RQ/YglApOburthkaIv4v6DqOmCM9dJnuiIpnp91bW9hy059t5xaZn9
   IzfUz+LFd7iyFxNRClwT1d8GXFOwXeojMjAXSe0LJzbEXobI16oHGnrn6
   w==;
X-CSE-ConnectionGUID: bBI+HKRDS6iUDV0Rkm17PQ==
X-CSE-MsgGUID: +4kYsl0qRuuixZ0fYkVL6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15288056"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="15288056"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 03:31:47 -0700
X-CSE-ConnectionGUID: b/uZ1sKIRQiqpxufwUwq9A==
X-CSE-MsgGUID: Tj2sJADqSLuZ9Cl0OWUxVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="42187917"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 18 Jun 2024 03:31:46 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJW7s-0005Pt-0E;
	Tue, 18 Jun 2024 10:31:44 +0000
Date: Tue, 18 Jun 2024 18:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11561/22966]
 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:597:53: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202406181827.cAEjNIex-lkp@intel.com>
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
commit: fb55aa477dfa7f488f112a8b87116962d623ff63 [11561/22966] net: hns3: place cae regconfig-related implementations in an independent file
config: arm64-randconfig-r111-20240615 (https://download.01.org/0day-ci/archive/20240618/202406181827.cAEjNIex-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240618/202406181827.cAEjNIex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406181827.cAEjNIex-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:51:14: sparse: sparse: symbol 'g_hns3_cae_class' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:52:13: sparse: sparse: symbol 'g_hns3_cae_cdev' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:55:5: sparse: sparse: symbol 'g_hns3_cae_init_flag' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:56:5: sparse: sparse: symbol 'g_hns3_cae_ref_cnt' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:94:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void *in_buff @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:94:43: sparse:     expected void const [noderef] <asn:1> *from
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:94:43: sparse:     got void *in_buff
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:137:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got void *out_buf @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:137:32: sparse:     expected void [noderef] <asn:1> *to
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:137:32: sparse:     got void *out_buf
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:224:5: sparse: sparse: symbol 'hns3_cae_get_commit_id' was not declared. Should it be static?
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:343:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void * @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:343:38: sparse:     expected void const [noderef] <asn:1> *from
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:343:38: sparse:     got void *
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:579:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 @@     got unsigned int @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:579:30: sparse:     expected restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:579:30: sparse:     got unsigned int
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:597:53: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:597:53: sparse:     expected unsigned int
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:597:53: sparse:     got restricted __le32
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c:224:5: warning: no previous prototype for 'hns3_cae_get_commit_id' [-Wmissing-prototypes]
     224 | int hns3_cae_get_commit_id(struct hnae3_handle *handle, u8 *commit_id,
         |     ^~~~~~~~~~~~~~~~~~~~~~

vim +597 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_lib.c

   558	
   559	int hns3_cae_common_cmd_send(struct hns3_nic_priv *net_priv, void *buf_in,
   560				     u32 in_size, void *buf_out, u32 out_size)
   561	{
   562	#define MAX_DESC_DATA_LEN       6
   563		struct cmd_desc_param *param_in;
   564		struct hclge_vport *vport;
   565		struct hclge_dev *hdev;
   566		struct hclge_desc desc;
   567		bool check;
   568		int ret;
   569		int i;
   570	
   571		check = !buf_in || in_size < sizeof(struct cmd_desc_param);
   572		vport = hns3_cae_get_vport(net_priv->ae_handle);
   573		hdev = vport->back;
   574	
   575		param_in = (struct cmd_desc_param *)buf_in;
   576		hns3_cae_cmd_setup_basic_desc(&desc, param_in->fw_dw_opcode,
   577					      param_in->is_read);
   578		for (i = 0; i < MAX_DESC_DATA_LEN; i++)
   579			desc.data[i] = param_in->reg_desc.data[i];
   580		ret = hns3_cae_cmd_send(hdev, &desc, 1);
   581		if (ret) {
   582			dev_err(&hdev->pdev->dev, "%s, ret is %d.\n", __func__,
   583				ret);
   584			return ret;
   585		}
   586		if (param_in->is_read) {
   587			struct cmd_desc_param *param_out =
   588						(struct cmd_desc_param *)buf_out;
   589	
   590			check = !buf_out || out_size < sizeof(struct cmd_desc_param);
   591			if (check) {
   592				pr_err("input param buf_out error in %s function\n",
   593				       __func__);
   594				return -EFAULT;
   595			}
   596			for (i = 0; i < MAX_DESC_DATA_LEN; i++)
 > 597				param_out->reg_desc.data[i] = desc.data[i];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
