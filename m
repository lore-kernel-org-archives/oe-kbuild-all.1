Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F90139CFA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 20:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729887396; cv=none; b=p/h5B0kDafxde7cV+K3QM3ws1sykROlL/Bz+TDn5RXOiFrs2rvfOCL6JR7EYljmwg7RA4fUKuZ9FRAtoibgjCpdfatCshcCbu8+nnRwtnEFiNf6mT6SNqhQtzF6itmU09PuY3pdfukV75RK44VzX+DlzDJsRCCE2lLP7VA6NVUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729887396; c=relaxed/simple;
	bh=ijga3tOXuE1o6G4dsDrvfWcu9OZe28L8bGKxlqja0c0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ePDXJrVL06taaie9QJDPfvKqIgscbuu8WL06OsT0S8Aq6IAJlQXJELnZEQqrRLbBXjI+FO+wgigwphp/myL+IEvIixM7rKv1mKxYc1BirNpnMGRMDrIDkm/5nEPVC2jUkKhZcetTqWmvJIAMncRRwqWJAGTyLKME7qlN9KeFAtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4olgTA9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4olgTA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729887393; x=1761423393;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ijga3tOXuE1o6G4dsDrvfWcu9OZe28L8bGKxlqja0c0=;
  b=A4olgTA9k+G5DFiv6l2yJZ9QCo40dmwoRCKaI77xmLZK8vSEWSACPqJP
   4D5+tfT6J1Q4BuXaLD0JXF9tr6WaIUS8FkLre0yWDDLdIQNTGSE9WBPT+
   ZSTtbBSDq2u++3n2tgiAlNVozRBD3AuDV3z/M7X4cTNVPZ5lESU5m7SU1
   ykapVSdgVXvi8Qq3zFQ5o/YVih7NjHOPJcnmHhA+2WwqrDjw3et4V9CvI
   qlb4haSFJpZX4BXg1wrzky4/XgFdo7K2tuS36oWdms9R4XlBlQKqfnJIt
   5V0SYNgVdJjSRI/yhlj0eamrSu2uNroBn1JzcBsJLHure6KPBphgKbAo4
   g==;
X-CSE-ConnectionGUID: NlmtYXKyS8u67dOv1Y6wQQ==
X-CSE-MsgGUID: e0YtcaKsSC+G/vtcjLtedQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="33372086"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="33372086"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 13:16:30 -0700
X-CSE-ConnectionGUID: feYasl6ARNy1fkSkKLdJHQ==
X-CSE-MsgGUID: yrJ5C44LTuuwfhla+kpXqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="81167284"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Oct 2024 13:16:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4QjS-000Yqg-1C;
	Fri, 25 Oct 2024 20:16:26 +0000
Date: Sat, 26 Oct 2024 04:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: Victor Shih <victor.shih@genesyslogic.com.tw>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	Jason Lai <jason.lai@genesyslogic.com.tw>
Subject: [ulfh-mmc:next 37/61] drivers/mmc/core/sd_uhs2.c:183:37: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202410260423.15jvE6qc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   3c0946b6a378fb92658aabcda5c70ea3e83143bf
commit: 9a9f7e13952b2638bc57bc9b34e6bdd106509836 [37/61] mmc: core: Support UHS-II card control and access
config: x86_64-randconfig-r131-20241025 (https://download.01.org/0day-ci/archive/20241026/202410260423.15jvE6qc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260423.15jvE6qc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260423.15jvE6qc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mmc/core/sd_uhs2.c:183:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 @@     got unsigned long @@
   drivers/mmc/core/sd_uhs2.c:183:37: sparse:     expected restricted __be32
   drivers/mmc/core/sd_uhs2.c:183:37: sparse:     got unsigned long
>> drivers/mmc/core/sd_uhs2.c:250:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 @@     got int @@
   drivers/mmc/core/sd_uhs2.c:250:29: sparse:     expected restricted __be32
   drivers/mmc/core/sd_uhs2.c:250:29: sparse:     got int
>> drivers/mmc/core/sd_uhs2.c:251:31: sparse: sparse: cast from restricted __be32
   drivers/mmc/core/sd_uhs2.c:494:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 @@     got int @@
   drivers/mmc/core/sd_uhs2.c:494:29: sparse:     expected restricted __be32
   drivers/mmc/core/sd_uhs2.c:494:29: sparse:     got int
   drivers/mmc/core/sd_uhs2.c:496:31: sparse: sparse: cast from restricted __be32
   drivers/mmc/core/sd_uhs2.c:497:31: sparse: sparse: cast from restricted __be32
   drivers/mmc/core/sd_uhs2.c:552:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 @@     got int @@
   drivers/mmc/core/sd_uhs2.c:552:29: sparse:     expected restricted __be32
   drivers/mmc/core/sd_uhs2.c:552:29: sparse:     got int
   drivers/mmc/core/sd_uhs2.c:565:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 @@     got int @@
   drivers/mmc/core/sd_uhs2.c:565:29: sparse:     expected restricted __be32
   drivers/mmc/core/sd_uhs2.c:565:29: sparse:     got int
   drivers/mmc/core/sd_uhs2.c:567:31: sparse: sparse: cast from restricted __be32
   drivers/mmc/core/sd_uhs2.c:568:31: sparse: sparse: cast from restricted __be32
>> drivers/mmc/core/sd_uhs2.c:615:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 @@     got unsigned int @@
   drivers/mmc/core/sd_uhs2.c:615:29: sparse:     expected restricted __be32
   drivers/mmc/core/sd_uhs2.c:615:29: sparse:     got unsigned int
>> drivers/mmc/core/sd_uhs2.c:619:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 @@     got unsigned char [usertype] n_data_gap_set @@
   drivers/mmc/core/sd_uhs2.c:619:29: sparse:     expected restricted __be32
   drivers/mmc/core/sd_uhs2.c:619:29: sparse:     got unsigned char [usertype] n_data_gap_set
   drivers/mmc/core/sd_uhs2.c:620:31: sparse: sparse: cast from restricted __be32
   drivers/mmc/core/sd_uhs2.c:621:31: sparse: sparse: cast from restricted __be32
   drivers/mmc/core/sd_uhs2.c:649:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 @@     got unsigned long @@
   drivers/mmc/core/sd_uhs2.c:649:29: sparse:     expected restricted __be32
   drivers/mmc/core/sd_uhs2.c:649:29: sparse:     got unsigned long
   drivers/mmc/core/sd_uhs2.c:650:31: sparse: sparse: cast from restricted __be32
   drivers/mmc/core/sd_uhs2.c:651:31: sparse: sparse: cast from restricted __be32

vim +183 drivers/mmc/core/sd_uhs2.c

   136	
   137	/*
   138	 * Do the early initialization of the card, by sending the device init broadcast
   139	 * command and wait for the process to be completed.
   140	 */
   141	static int sd_uhs2_dev_init(struct mmc_host *host)
   142	{
   143		struct mmc_command cmd = {0};
   144		struct uhs2_command uhs2_cmd = {};
   145		u32 cnt;
   146		u32 dap, gap, resp_gap;
   147		u8 gd = 0;
   148		int err;
   149	
   150		dap = host->uhs2_caps.dap;
   151		gap = host->uhs2_caps.gap;
   152	
   153		/*
   154		 * Refer to UHS-II Addendum Version 1.02 Figure 6-21 to see DEVICE_INIT CCMD format.
   155		 * Head:
   156		 *      - Control Write(R/W=1) with 4-Byte payload(PLEN=01b).
   157		 *      - IOADR = CMD_BASE + 002h
   158		 * Payload:
   159		 *      - bit [3:0]  : GAP(Group Allocated Power)
   160		 *      - bit [7:4]  : GD(Group Descriptor)
   161		 *      - bit [11]   : Complete Flag
   162		 *      - bit [15:12]: DAP(Device Allocated Power)
   163		 */
   164		uhs2_cmd.header = UHS2_NATIVE_PACKET | UHS2_PACKET_TYPE_CCMD;
   165		uhs2_cmd.arg = ((UHS2_DEV_CMD_DEVICE_INIT & 0xFF) << 8) |
   166		       UHS2_NATIVE_CMD_WRITE |
   167		       UHS2_NATIVE_CMD_PLEN_4B |
   168		       (UHS2_DEV_CMD_DEVICE_INIT >> 8);
   169	
   170		/*
   171		 * Refer to UHS-II Addendum Version 1.02 section 6.3.1.
   172		 * Max. time from DEVICE_INIT CCMD EOP reception on Device
   173		 * Rx to its SOP transmission on Device Tx(Tfwd_init_cmd) is
   174		 * 1 second.
   175		 */
   176		cmd.busy_timeout = 1000;
   177	
   178		/*
   179		 * Refer to UHS-II Addendum Version 1.02 section 6.2.6.3.
   180		 * Let's retry the DEVICE_INIT command no more than 30 times.
   181		 */
   182		for (cnt = 0; cnt < 30; cnt++) {
 > 183			uhs2_cmd.payload[0] = ((dap & 0xF) << 12) |
   184					       UHS2_DEV_INIT_COMPLETE_FLAG |
   185					       ((gd & 0xF) << 4) |
   186					       (gap & 0xF);
   187	
   188			sd_uhs2_cmd_assemble(&cmd, &uhs2_cmd, UHS2_DEV_INIT_PAYLOAD_LEN,
   189					     UHS2_DEV_INIT_RESP_LEN);
   190	
   191			err = mmc_wait_for_cmd(host, &cmd, 0);
   192	
   193			if (err) {
   194				pr_err("%s: %s: UHS2 CMD send fail, err= 0x%x!\n",
   195				       mmc_hostname(host), __func__, err);
   196				continue;
   197			}
   198	
   199			if (uhs2_cmd.uhs2_resp[3] != (UHS2_DEV_CMD_DEVICE_INIT & 0xFF)) {
   200				pr_err("%s: DEVICE_INIT response is wrong!\n",
   201				       mmc_hostname(host));
   202				return -EIO;
   203			}
   204	
   205			if (uhs2_cmd.uhs2_resp[5] & 0x8) {
   206				host->uhs2_caps.group_desc = gd;
   207				return 0;
   208			}
   209			resp_gap = uhs2_cmd.uhs2_resp[4] & 0x0F;
   210			if (gap == resp_gap)
   211				gd++;
   212		}
   213	
   214		if (err) {
   215			pr_err("%s: %s: UHS2 CMD send fail, err= 0x%x!\n",
   216			       mmc_hostname(host), __func__, err);
   217			return err;
   218		}
   219	
   220		return 0;
   221	}
   222	
   223	/*
   224	 * Run the enumeration process by sending the enumerate command to the card.
   225	 * Note that, we currently support only the point to point connection, which
   226	 * means only one card can be attached per host/slot.
   227	 */
   228	static int sd_uhs2_enum(struct mmc_host *host, u32 *node_id)
   229	{
   230		struct mmc_command cmd = {0};
   231		struct uhs2_command uhs2_cmd = {};
   232		u8 id_f = 0xF, id_l = 0x0;
   233		int err;
   234	
   235		/*
   236		 * Refer to UHS-II Addendum Version 1.02 Figure 6-28 to see ENUMERATE CCMD format.
   237		 * Header:
   238		 *      - Control Write(R/W=1) with 4-Byte payload(PLEN=01b).
   239		 *      - IOADR = CMD_BASE + 003h
   240		 * Payload:
   241		 *      - bit [3:0]: ID_L(Last Node ID)
   242		 *      - bit [7:4]: ID_F(First Node ID)
   243		 */
   244		uhs2_cmd.header = UHS2_NATIVE_PACKET | UHS2_PACKET_TYPE_CCMD;
   245		uhs2_cmd.arg = ((UHS2_DEV_CMD_ENUMERATE & 0xFF) << 8) |
   246				UHS2_NATIVE_CMD_WRITE |
   247				UHS2_NATIVE_CMD_PLEN_4B |
   248				(UHS2_DEV_CMD_ENUMERATE >> 8);
   249	
 > 250		uhs2_cmd.payload[0] = (id_f << 4) | id_l;
 > 251		uhs2_cmd.payload[0] = cpu_to_be32(uhs2_cmd.payload[0]);
   252	
   253		sd_uhs2_cmd_assemble(&cmd, &uhs2_cmd, UHS2_DEV_ENUM_PAYLOAD_LEN, UHS2_DEV_ENUM_RESP_LEN);
   254	
   255		err = mmc_wait_for_cmd(host, &cmd, 0);
   256		if (err) {
   257			pr_err("%s: %s: UHS2 CMD send fail, err= 0x%x!\n",
   258			       mmc_hostname(host), __func__, err);
   259			return err;
   260		}
   261	
   262		if (uhs2_cmd.uhs2_resp[3] != (UHS2_DEV_CMD_ENUMERATE & 0xFF)) {
   263			pr_err("%s: ENUMERATE response is wrong!\n",
   264			       mmc_hostname(host));
   265			return -EIO;
   266		}
   267	
   268		id_f = (uhs2_cmd.uhs2_resp[4] >> 4) & 0xF;
   269		id_l = uhs2_cmd.uhs2_resp[4] & 0xF;
   270		*node_id = id_f;
   271	
   272		return 0;
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
