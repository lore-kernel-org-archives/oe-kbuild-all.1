Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17CA46447
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 03:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731123157; cv=none; b=DfCaS8U85wcnJb35Xh/ga3IidoWwBktPIlRc3pO7eLGWon6lzwH0HOJ5Ou43+uEoD0FGv+X82SwFuAhfj6qW/NEWHqcHYDklAr9KZsBPKAm4cSyAgStgV+q0yCrr/Ujxc0cHVKcJG+Qtz2RKbP1r7ZAkqn+tidhh84KyyYEqyRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731123157; c=relaxed/simple;
	bh=PNQ0uUhXdn1DCC7+rwIjK+x/ocFhQfFmaQJgZ0ewT3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SDPw9LfT2RtSGSw/wDYHCKwiM40ij0GzMRteisJxQwWSjnGB1s55HhPl9F3lRrHJZdwP9CJHg6MC0k13Hln2606/nUXN5UPnMUk1aKNYN+3jlPMlVOr1a1lIIRpLOkEdcEpRBlOAEym02JoMgNiaWbh1qNaeYGuBsYPHviYNmLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yk9R4kdu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yk9R4kdu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731123155; x=1762659155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PNQ0uUhXdn1DCC7+rwIjK+x/ocFhQfFmaQJgZ0ewT3k=;
  b=Yk9R4kdudDZ+0srwCH6qgXybW7owAvi69lazs/eEOZe+AcFuh8A+mYRV
   Cl7C2EwHWBCCeFcSA/NPL6N07QLGgRDG2dW2QS5gySAbGD/iRduYcpHTN
   Sk1AI0E2Euoq29V5swruEkMYiOfT6Bax4LC3GzHLmv16ATCkmsiZjA/jS
   spiP66Qf9FIe6F/t8gBA365ZdeFtaDtGjU1HY+xPAJyISEkof/D4IsYUJ
   rjGwrviiwAkrH+sxLCToGc22FQ++dl0b2VKWuCFfaLPfeYb7q56BDEpoU
   b8X3f1didhptyHVy+0KMxpmlqsmdWAgINN9qItKVFdMKBNAsIFs1yXiAW
   A==;
X-CSE-ConnectionGUID: dI6RWHgQTQav1nF4bF87OA==
X-CSE-MsgGUID: kVCQu1gcSVuAknv1M53YAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30430013"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="30430013"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 19:32:33 -0800
X-CSE-ConnectionGUID: yVlehzROTMugVTM2vz/thg==
X-CSE-MsgGUID: fXL2cgR1TfqXutsq+ZGkow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="123364183"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Nov 2024 19:32:30 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9cD6-000s2M-0A;
	Sat, 09 Nov 2024 03:32:28 +0000
Date: Sat, 9 Nov 2024 11:31:54 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 drivers/pci/controller/pci-hyperv.c:933:5: sparse: sparse: symbol
 'hv_read_config_block' was not declared. Should it be static?
Message-ID: <202411091123.62V6xmm6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   56b96e2ee1334c923cb707ff5b18d7cf858a2c46
commit: 348dd93e40c112afda3cd07daa6f470e474d29dc [1/1] PCI: hv: Add a Hyper-V PCI interface driver for software backchannel interface
config: x86_64-randconfig-123-20241028 (https://download.01.org/0day-ci/archive/20241109/202411091123.62V6xmm6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091123.62V6xmm6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091123.62V6xmm6-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pci-hyperv.c:933:5: sparse: sparse: symbol 'hv_read_config_block' was not declared. Should it be static?
>> drivers/pci/controller/pci-hyperv.c:1013:5: sparse: sparse: symbol 'hv_write_config_block' was not declared. Should it be static?
>> drivers/pci/controller/pci-hyperv.c:1082:5: sparse: sparse: symbol 'hv_register_block_invalidate' was not declared. Should it be static?

vim +/hv_read_config_block +933 drivers/pci/controller/pci-hyperv.c

e5d2f910cfeca8 Dexuan Cui 2019-08-22   921  
e5d2f910cfeca8 Dexuan Cui 2019-08-22   922  /**
e5d2f910cfeca8 Dexuan Cui 2019-08-22   923   * hv_read_config_block() - Sends a read config block request to
e5d2f910cfeca8 Dexuan Cui 2019-08-22   924   * the back-end driver running in the Hyper-V parent partition.
e5d2f910cfeca8 Dexuan Cui 2019-08-22   925   * @pdev:		The PCI driver's representation for this device.
e5d2f910cfeca8 Dexuan Cui 2019-08-22   926   * @buf:		Buffer into which the config block will be copied.
e5d2f910cfeca8 Dexuan Cui 2019-08-22   927   * @len:		Size in bytes of buf.
e5d2f910cfeca8 Dexuan Cui 2019-08-22   928   * @block_id:		Identifies the config block which has been requested.
e5d2f910cfeca8 Dexuan Cui 2019-08-22   929   * @bytes_returned:	Size which came back from the back-end driver.
e5d2f910cfeca8 Dexuan Cui 2019-08-22   930   *
e5d2f910cfeca8 Dexuan Cui 2019-08-22   931   * Return: 0 on success, -errno on failure
e5d2f910cfeca8 Dexuan Cui 2019-08-22   932   */
e5d2f910cfeca8 Dexuan Cui 2019-08-22  @933  int hv_read_config_block(struct pci_dev *pdev, void *buf, unsigned int len,
e5d2f910cfeca8 Dexuan Cui 2019-08-22   934  			 unsigned int block_id, unsigned int *bytes_returned)
e5d2f910cfeca8 Dexuan Cui 2019-08-22   935  {
e5d2f910cfeca8 Dexuan Cui 2019-08-22   936  	struct hv_pcibus_device *hbus =
e5d2f910cfeca8 Dexuan Cui 2019-08-22   937  		container_of(pdev->bus->sysdata, struct hv_pcibus_device,
e5d2f910cfeca8 Dexuan Cui 2019-08-22   938  			     sysdata);
e5d2f910cfeca8 Dexuan Cui 2019-08-22   939  	struct {
e5d2f910cfeca8 Dexuan Cui 2019-08-22   940  		struct pci_packet pkt;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   941  		char buf[sizeof(struct pci_read_block)];
e5d2f910cfeca8 Dexuan Cui 2019-08-22   942  	} pkt;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   943  	struct hv_read_config_compl comp_pkt;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   944  	struct pci_read_block *read_blk;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   945  	int ret;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   946  
e5d2f910cfeca8 Dexuan Cui 2019-08-22   947  	if (len == 0 || len > HV_CONFIG_BLOCK_SIZE_MAX)
e5d2f910cfeca8 Dexuan Cui 2019-08-22   948  		return -EINVAL;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   949  
e5d2f910cfeca8 Dexuan Cui 2019-08-22   950  	init_completion(&comp_pkt.comp_pkt.host_event);
e5d2f910cfeca8 Dexuan Cui 2019-08-22   951  	comp_pkt.buf = buf;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   952  	comp_pkt.len = len;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   953  
e5d2f910cfeca8 Dexuan Cui 2019-08-22   954  	memset(&pkt, 0, sizeof(pkt));
e5d2f910cfeca8 Dexuan Cui 2019-08-22   955  	pkt.pkt.completion_func = hv_pci_read_config_compl;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   956  	pkt.pkt.compl_ctxt = &comp_pkt;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   957  	read_blk = (struct pci_read_block *)&pkt.pkt.message;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   958  	read_blk->message_type.type = PCI_READ_BLOCK;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   959  	read_blk->wslot.slot = devfn_to_wslot(pdev->devfn);
e5d2f910cfeca8 Dexuan Cui 2019-08-22   960  	read_blk->block_id = block_id;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   961  	read_blk->bytes_requested = len;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   962  
e5d2f910cfeca8 Dexuan Cui 2019-08-22   963  	ret = vmbus_sendpacket(hbus->hdev->channel, read_blk,
e5d2f910cfeca8 Dexuan Cui 2019-08-22   964  			       sizeof(*read_blk), (unsigned long)&pkt.pkt,
e5d2f910cfeca8 Dexuan Cui 2019-08-22   965  			       VM_PKT_DATA_INBAND,
e5d2f910cfeca8 Dexuan Cui 2019-08-22   966  			       VMBUS_DATA_PACKET_FLAG_COMPLETION_REQUESTED);
e5d2f910cfeca8 Dexuan Cui 2019-08-22   967  	if (ret)
e5d2f910cfeca8 Dexuan Cui 2019-08-22   968  		return ret;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   969  
e5d2f910cfeca8 Dexuan Cui 2019-08-22   970  	ret = wait_for_response(hbus->hdev, &comp_pkt.comp_pkt.host_event);
e5d2f910cfeca8 Dexuan Cui 2019-08-22   971  	if (ret)
e5d2f910cfeca8 Dexuan Cui 2019-08-22   972  		return ret;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   973  
e5d2f910cfeca8 Dexuan Cui 2019-08-22   974  	if (comp_pkt.comp_pkt.completion_status != 0 ||
e5d2f910cfeca8 Dexuan Cui 2019-08-22   975  	    comp_pkt.bytes_returned == 0) {
e5d2f910cfeca8 Dexuan Cui 2019-08-22   976  		dev_err(&hbus->hdev->device,
e5d2f910cfeca8 Dexuan Cui 2019-08-22   977  			"Read Config Block failed: 0x%x, bytes_returned=%d\n",
e5d2f910cfeca8 Dexuan Cui 2019-08-22   978  			comp_pkt.comp_pkt.completion_status,
e5d2f910cfeca8 Dexuan Cui 2019-08-22   979  			comp_pkt.bytes_returned);
e5d2f910cfeca8 Dexuan Cui 2019-08-22   980  		return -EIO;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   981  	}
e5d2f910cfeca8 Dexuan Cui 2019-08-22   982  
e5d2f910cfeca8 Dexuan Cui 2019-08-22   983  	*bytes_returned = comp_pkt.bytes_returned;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   984  	return 0;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   985  }
e5d2f910cfeca8 Dexuan Cui 2019-08-22   986  
e5d2f910cfeca8 Dexuan Cui 2019-08-22   987  /**
e5d2f910cfeca8 Dexuan Cui 2019-08-22   988   * hv_pci_write_config_compl() - Invoked when a response packet for a write
e5d2f910cfeca8 Dexuan Cui 2019-08-22   989   * config block operation arrives.
e5d2f910cfeca8 Dexuan Cui 2019-08-22   990   * @context:		Identifies the write config operation
e5d2f910cfeca8 Dexuan Cui 2019-08-22   991   * @resp:		The response packet itself
e5d2f910cfeca8 Dexuan Cui 2019-08-22   992   * @resp_packet_size:	Size in bytes of the response packet
e5d2f910cfeca8 Dexuan Cui 2019-08-22   993   */
e5d2f910cfeca8 Dexuan Cui 2019-08-22   994  static void hv_pci_write_config_compl(void *context, struct pci_response *resp,
e5d2f910cfeca8 Dexuan Cui 2019-08-22   995  				      int resp_packet_size)
e5d2f910cfeca8 Dexuan Cui 2019-08-22   996  {
e5d2f910cfeca8 Dexuan Cui 2019-08-22   997  	struct hv_pci_compl *comp_pkt = context;
e5d2f910cfeca8 Dexuan Cui 2019-08-22   998  
e5d2f910cfeca8 Dexuan Cui 2019-08-22   999  	comp_pkt->completion_status = resp->status;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1000  	complete(&comp_pkt->host_event);
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1001  }
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1002  
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1003  /**
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1004   * hv_write_config_block() - Sends a write config block request to the
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1005   * back-end driver running in the Hyper-V parent partition.
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1006   * @pdev:		The PCI driver's representation for this device.
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1007   * @buf:		Buffer from which the config block will	be copied.
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1008   * @len:		Size in bytes of buf.
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1009   * @block_id:		Identifies the config block which is being written.
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1010   *
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1011   * Return: 0 on success, -errno on failure
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1012   */
e5d2f910cfeca8 Dexuan Cui 2019-08-22 @1013  int hv_write_config_block(struct pci_dev *pdev, void *buf, unsigned int len,
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1014  			  unsigned int block_id)
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1015  {
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1016  	struct hv_pcibus_device *hbus =
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1017  		container_of(pdev->bus->sysdata, struct hv_pcibus_device,
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1018  			     sysdata);
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1019  	struct {
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1020  		struct pci_packet pkt;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1021  		char buf[sizeof(struct pci_write_block)];
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1022  		u32 reserved;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1023  	} pkt;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1024  	struct hv_pci_compl comp_pkt;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1025  	struct pci_write_block *write_blk;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1026  	u32 pkt_size;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1027  	int ret;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1028  
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1029  	if (len == 0 || len > HV_CONFIG_BLOCK_SIZE_MAX)
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1030  		return -EINVAL;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1031  
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1032  	init_completion(&comp_pkt.host_event);
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1033  
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1034  	memset(&pkt, 0, sizeof(pkt));
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1035  	pkt.pkt.completion_func = hv_pci_write_config_compl;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1036  	pkt.pkt.compl_ctxt = &comp_pkt;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1037  	write_blk = (struct pci_write_block *)&pkt.pkt.message;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1038  	write_blk->message_type.type = PCI_WRITE_BLOCK;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1039  	write_blk->wslot.slot = devfn_to_wslot(pdev->devfn);
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1040  	write_blk->block_id = block_id;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1041  	write_blk->byte_count = len;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1042  	memcpy(write_blk->bytes, buf, len);
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1043  	pkt_size = offsetof(struct pci_write_block, bytes) + len;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1044  	/*
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1045  	 * This quirk is required on some hosts shipped around 2018, because
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1046  	 * these hosts don't check the pkt_size correctly (new hosts have been
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1047  	 * fixed since early 2019). The quirk is also safe on very old hosts
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1048  	 * and new hosts, because, on them, what really matters is the length
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1049  	 * specified in write_blk->byte_count.
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1050  	 */
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1051  	pkt_size += sizeof(pkt.reserved);
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1052  
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1053  	ret = vmbus_sendpacket(hbus->hdev->channel, write_blk, pkt_size,
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1054  			       (unsigned long)&pkt.pkt, VM_PKT_DATA_INBAND,
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1055  			       VMBUS_DATA_PACKET_FLAG_COMPLETION_REQUESTED);
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1056  	if (ret)
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1057  		return ret;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1058  
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1059  	ret = wait_for_response(hbus->hdev, &comp_pkt.host_event);
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1060  	if (ret)
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1061  		return ret;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1062  
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1063  	if (comp_pkt.completion_status != 0) {
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1064  		dev_err(&hbus->hdev->device,
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1065  			"Write Config Block failed: 0x%x\n",
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1066  			comp_pkt.completion_status);
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1067  		return -EIO;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1068  	}
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1069  
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1070  	return 0;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1071  }
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1072  
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1073  /**
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1074   * hv_register_block_invalidate() - Invoked when a config block invalidation
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1075   * arrives from the back-end driver.
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1076   * @pdev:		The PCI driver's representation for this device.
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1077   * @context:		Identifies the device.
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1078   * @block_invalidate:	Identifies all of the blocks being invalidated.
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1079   *
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1080   * Return: 0 on success, -errno on failure
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1081   */
e5d2f910cfeca8 Dexuan Cui 2019-08-22 @1082  int hv_register_block_invalidate(struct pci_dev *pdev, void *context,
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1083  				 void (*block_invalidate)(void *context,
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1084  							  u64 block_mask))
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1085  {
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1086  	struct hv_pcibus_device *hbus =
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1087  		container_of(pdev->bus->sysdata, struct hv_pcibus_device,
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1088  			     sysdata);
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1089  	struct hv_pci_dev *hpdev;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1090  
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1091  	hpdev = get_pcichild_wslot(hbus, devfn_to_wslot(pdev->devfn));
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1092  	if (!hpdev)
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1093  		return -ENODEV;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1094  
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1095  	hpdev->block_invalidate = block_invalidate;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1096  	hpdev->invalidate_context = context;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1097  
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1098  	put_pcichild(hpdev);
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1099  	return 0;
e5d2f910cfeca8 Dexuan Cui 2019-08-22  1100  

:::::: The code at line 933 was first introduced by commit
:::::: e5d2f910cfeca852f6e2dc19dfa8dab264ce0cde PCI: hv: Add a paravirtual backchannel in software

:::::: TO: Dexuan Cui <decui@microsoft.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
