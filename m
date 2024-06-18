Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D9B1553AE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 12:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718715478; cv=none; b=RkyhBuVPp1SRQB8/EeN/uGNCUGUaHyPc4sw1fFxuffMycVJtV/cS0QW4M0yA37/qKCmA2jA5MtPJ7YaGlRHSwQrtiDVUHlehdL3Pm92rgMCP3QsjkPOTKLYPGHlv6Eb3scw1+OB4FXNb1q7NZeYKGt/VU9GYLE5tEthqSzUlzq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718715478; c=relaxed/simple;
	bh=XYPRay19FaWWbwqwcj3oonjKwSIHXoVLaWzLzsm6qPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DKKbHzTVy6ozxRKmK52z8PyUcrU+8hsPSsIBDcyBDruPOkqfWYD260nnP4hO50QTk06OrLA0B5dsz5ERY8Ta4a+CdFiBpTmgpPw5v0BTKSEa2PSyX9KoJ1ImxNaxwE7oDxJk1KHIRM/XZJy6Sijn+mlSpFgU1CodxNu6cInFCE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVlJayBh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVlJayBh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718715476; x=1750251476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XYPRay19FaWWbwqwcj3oonjKwSIHXoVLaWzLzsm6qPY=;
  b=UVlJayBhDVYZkmvBe5gr22x/li0u6tfUaRkfYLzguSQXF6uhLUojAbWm
   IT8MxPPZ1i2c8lPEVYKUXyexrsrUnJZRmmSJ02h6Ux2FbdX8I/yQty5NV
   3ykuLrm63IeAIyp/XQY1+yQyUHTBNZ/RocRF3zvX66r4lbxzRXkkiwHzP
   5qomuCJlsQMv6aZvt+bZtmF2ZDIEQ7uzCN5NuYAoc6w2ZEMb+/9p7lfDK
   cgViRimC3C/qhNqG6J3nwnE3uV67gjRj6lM/vcIBlcT72SRuGdNT7ogN7
   BSPFlEJEDoltKMWsHn+xEffjC/bEKItX352gnyA6LambYCAYQrT2G0RZB
   g==;
X-CSE-ConnectionGUID: SsoZ72QIQbCXOkmVuFktqw==
X-CSE-MsgGUID: Di2Y4x8HRRWAcJgv904U5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26272167"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="26272167"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 05:57:54 -0700
X-CSE-ConnectionGUID: E3b+Z/LQSsmFlu7kpnwpew==
X-CSE-MsgGUID: pq64imTUS3GlHJiiGGYLOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; 
   d="scan'208";a="42019582"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jun 2024 05:57:52 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJYPF-0005Wb-2f;
	Tue, 18 Jun 2024 12:57:49 +0000
Date: Tue, 18 Jun 2024 20:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 11564/22966]
 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_init.c:53:14: sparse:
 sparse: symbol 'g_hns3_cae_class' was not declared. Should it be static?
Message-ID: <202406182019.kf6McR7e-lkp@intel.com>
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
commit: 9e1cec03a3abb934592272fc19603d00bb62f7cb [11564/22966] net: hns3: place cae entrance procedure implementations in a separate file
config: arm64-randconfig-r111-20240615 (https://download.01.org/0day-ci/archive/20240618/202406182019.kf6McR7e-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240618/202406182019.kf6McR7e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406182019.kf6McR7e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_init.c:53:14: sparse: sparse: symbol 'g_hns3_cae_class' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_init.c:54:13: sparse: sparse: symbol 'g_hns3_cae_cdev' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_init.c:57:5: sparse: sparse: symbol 'g_hns3_cae_init_flag' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_init.c:58:5: sparse: sparse: symbol 'g_hns3_cae_ref_cnt' was not declared. Should it be static?
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_init.c:96:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void *in_buff @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_init.c:96:43: sparse:     expected void const [noderef] <asn:1> *from
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_init.c:96:43: sparse:     got void *in_buff
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_init.c:139:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got void *out_buf @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_init.c:139:32: sparse:     expected void [noderef] <asn:1> *to
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_init.c:139:32: sparse:     got void *out_buf
>> drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_init.c:318:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got void * @@
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_init.c:318:38: sparse:     expected void const [noderef] <asn:1> *from
   drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_init.c:318:38: sparse:     got void *

vim +/g_hns3_cae_class +53 drivers/net/ethernet/hisilicon/hns3/hns3_cae/hns3_cae_init.c

    52	
  > 53	struct class *g_hns3_cae_class;
  > 54	struct cdev g_hns3_cae_cdev;
    55	static const char hns3_driver_name[] = "hns3";
    56	
  > 57	int g_hns3_cae_init_flag;
  > 58	int g_hns3_cae_ref_cnt;
    59	
    60	typedef int (*driv_module) (struct hns3_nic_priv *nic_dev, void *buf_in,
    61				    u32 in_size, void *buf_out, u32 out_size);
    62	
    63	struct drv_module_handle {
    64		enum driver_cmd_type driv_cmd_name;
    65		driv_module driv_func;
    66	};
    67	
    68	static void free_buff_in(void *buf_in)
    69	{
    70		if (!buf_in)
    71			return;
    72	
    73		kfree(buf_in);
    74	}
    75	
    76	static int alloc_buff_in(struct msg_module *nt_msg, u32 in_size, void **buf_in)
    77	{
    78		void *msg_buf;
    79	
    80		if (!in_size)
    81			return 0;
    82	
    83		if (in_size > MAX_MSG_IN_SIZE) {
    84			pr_err("msg in size(%u) more than %u\n",
    85			       in_size, MAX_MSG_IN_SIZE);
    86			return -ENOMEM;
    87		}
    88	
    89		msg_buf = kzalloc((unsigned long)in_size, GFP_KERNEL);
    90		*buf_in = msg_buf;
    91		if (ZERO_OR_NULL_PTR(*buf_in)) {
    92			pr_err("alloc buf_in failed\n");
    93			return -ENOMEM;
    94		}
    95	
  > 96		if (copy_from_user(msg_buf, nt_msg->in_buff, (unsigned long)in_size)) {
    97			pr_err("Copy from user failed in %s function\n", __func__);
    98			kfree(msg_buf);
    99			return -EFAULT;
   100		}
   101	
   102		return 0;
   103	}
   104	
   105	static void free_buff_out(void *buf_out)
   106	{
   107		if (!buf_out)
   108			return;
   109	
   110		kfree(buf_out);
   111	}
   112	
   113	static int alloc_buff_out(u32 out_size, void **buf_out)
   114	{
   115		if (!out_size)
   116			return 0;
   117	
   118		if (out_size > MAX_MSG_OUT_SIZE) {
   119			pr_err("msg out size(%u) more than %u\n",
   120			       out_size, MAX_MSG_OUT_SIZE);
   121			return -ENOMEM;
   122		}
   123	
   124		*buf_out = kzalloc((unsigned long)out_size, GFP_KERNEL);
   125		if (ZERO_OR_NULL_PTR(*buf_out)) {
   126			pr_err("alloc buf_out failed\n");
   127			return -ENOMEM;
   128		}
   129	
   130		return 0;
   131	}
   132	
   133	static int copy_buf_out_to_user(struct msg_module *nt_msg, u32 out_size,
   134					void **buf_out)
   135	{
   136		int ret = 0;
   137		void *msg_out = buf_out;
   138	
 > 139		if (copy_to_user(nt_msg->out_buf, msg_out, out_size))
   140			ret = -EFAULT;
   141	
   142		return ret;
   143	}
   144	
   145	static int hns3_cae_netdev_match_check(struct net_device *netdev)
   146	{
   147		struct ethtool_drvinfo drv_info;
   148	
   149		if (netdev->ethtool_ops->get_drvinfo)
   150			netdev->ethtool_ops->get_drvinfo(netdev, &drv_info);
   151	
   152		if (!strncmp(drv_info.driver, hns3_driver_name,
   153			     strlen(hns3_driver_name)))
   154			return 0;
   155	
   156		netdev_err(netdev, "match hns3 driver name(%s) failed\n",
   157			   drv_info.driver);
   158		return -1;
   159	}
   160	
   161	#if (KERNEL_VERSION(4, 16, 0) < LINUX_VERSION_CODE)
   162	static int kernel_sock_ioctl(struct socket *sock, int cmd, unsigned long arg)
   163	{
   164		mm_segment_t oldfs = get_fs();
   165		int err;
   166	
   167		set_fs(KERNEL_DS);
   168		err = sock->ops->ioctl(sock, cmd, arg);
   169		set_fs(oldfs);
   170	
   171		return err;
   172	}
   173	#endif
   174	
   175	static struct net_device *get_netdev_by_ifname(char *ifname)
   176	{
   177		struct socket *temp_sock = NULL;
   178		struct net_device *netdev = NULL;
   179		struct ifreq ifr;
   180		int err;
   181	
   182		err = sock_create(PF_INET, SOCK_DGRAM, 0, &temp_sock);
   183		if (err < 0) {
   184			pr_err("fail to enter sock_create, err = %d\n", err);
   185			return NULL;
   186		}
   187	
   188		strncpy(ifr.ifr_ifrn.ifrn_name, ifname, (unsigned long)IFNAMSIZ);
   189		kernel_sock_ioctl(temp_sock, SIOCSIFNAME, (unsigned long)&ifr);
   190		netdev = dev_get_by_name(sock_net(temp_sock->sk), ifname);
   191		if (!netdev)
   192			goto out;
   193	
   194		dev_put(netdev);
   195	
   196	out:
   197		sock_release(temp_sock);
   198		return netdev;
   199	}
   200	
   201	static int hns3_cae_k_get_netdev_by_ifname(char *ifname,
   202						   struct hns3_nic_priv **nic_dev)
   203	{
   204		struct net_device *netdev = NULL;
   205	
   206		netdev = get_netdev_by_ifname(ifname);
   207		if (!netdev) {
   208			pr_err("not find the netdevice(%s)!\n", ifname);
   209			return -EFAULT;
   210		}
   211	
   212		if (hns3_cae_netdev_match_check(netdev)) {
   213			netdev_err(netdev, "netdevice is not hns device.\n");
   214			return -EFAULT;
   215		}
   216	
   217		*nic_dev = (struct hns3_nic_priv *)netdev_priv(netdev);
   218		if (!(*nic_dev)) {
   219			netdev_err(netdev, "no private data\n");
   220			return -EFAULT;
   221		}
   222	
   223		return 0;
   224	}
   225	
 > 226	struct drv_module_handle driv_module_cmd_handle[] = {
   227		{FW_VER, hns3_cae_get_fw_ver},
   228		{DRIVER_VER, hns3_cae_get_driver_ver},
   229		{CHECKSUM_CFG, hns3_cae_chs_cfg},
   230		{TM_QUEUE_CFG, hns3_cae_queue_cfg},
   231		{TM_QSET_CFG, hns3_cae_qs_cfg},
   232		{TM_PRI_CFG, hns3_cae_pri_cfg},
   233		{TM_PG_CFG, hns3_cae_pg_cfg},
   234		{TM_PORT_CFG, hns3_cae_port_cfg},
   235		{TM_ETS_CFG, hns3_cae_ets_cfg},
   236		{DCB_MODE_CFG, hns3_cae_dcb_cfg},
   237		{ETS_MODE_CFG, hns3_cae_dcb_ets_cfg},
   238		{PFC_MODE_CFG, hns3_cae_dcb_pfc_cfg},
   239		{MAC_LOOP_CFG, hns3_cae_mac_loop_cfg},
   240		{DFX_INFO_CMD, hns3_cae_get_dfx_info},
   241		{DFX_READ_CMD, hns3_cae_read_dfx_info},
   242		{EVENT_INJECTION_CMD, hns3_cae_event_injection},
   243		{SEND_PKT, hns3_cae_send_pkt},
   244		{RX_PRIV_BUFF_WL_CFG, hns3_cae_rx_priv_buff_wl_cfg},
   245		{RX_COMMON_THRD_CFG, hns3_cae_common_thrd_cfg},
   246		{RX_COMMON_WL_CFG, hns3_cae_common_wl_cfg},
   247		{SHOW_RX_PRIV_WL, hns3_cae_show_rx_priv_wl},
   248		{SHOW_RX_COMM_THRES, hns3_cae_show_comm_thres},
   249		{QCN_EN_CFG, hns3_cae_qcn_cfg},
   250		{RX_BUFF_CFG, hns3_cae_rx_buff_cfg},
   251		{TX_BUFF_CFG, hns3_cae_tx_buff_cfg},
   252		{RESET_CFG, hns3_cae_nic_reset},
   253		{TIMEOUT_CFG, hns3_cae_nic_timeout_cfg},
   254		{PROMISC_MODE_CFG, hns3_promisc_mode_cfg},
   255		{QINFO_CFG, hns3_cae_qinfo_cfg},
   256	#ifdef CONFIG_IT_VALIDATION
   257		{MACTABLE_CFG, hns3_cae_opt_mactbl},
   258	#endif
   259		{CLEAN_STATS, hns3_cae_clean_stats},
   260		{FD_CFG, hns3_cae_fd_cfg},
   261		{RSS_GENERIC_CFG, hns3_cae_rss_cfg},
   262		{REG_CFG, hns3_cae_reg_cfg},
   263		{COM_REG_CFG, hns3_cae_common_cmd_send},
   264		{GRO_CFG, hns3_gro_age_handle},
   265		{M7_CMD_MODE_CFG, hns3_m7_cmd_handle},
   266		{QRES_CFG, hns3_cae_qres_cfg},
   267		{STAT_CFG, hns3_stat_mode_cfg},
   268		{IRQ_CFG, hns3_irq_lli_cfg},
   269		{VLAN_UPMAPPING, hns3_cae_upmapping_cfg},
   270	#ifdef CONFIG_EXT_TEST
   271		{LAMP_CFG, hns3_lamp_cfg},
   272		{EXTERN_INTERFACE_CFG, hns3_ext_interface_test},
   273	#endif
   274		{XSFP_CFG, hns3_xsfp_cfg},
   275		{SHOW_PORT_INFO, hns3_get_port_info},
   276		{SHOW_HILINK_PARAM, hns3_get_hilink_param},
   277		{DCQCN_PARM_CFG, hns3_nic_dcqcn},
   278		{DCQCN_GET_MSG_CNT_CMD, hns3_dcqcn_get_msg_cnt}
   279	};
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
