Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C381B4F3F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 05:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730782873; cv=none; b=UZQxN4jwsnhSDtZf9lwcPZG31qILcwHqU6fQ/Ql9LgnIKdYMtFjMipKQ3vTsZ/BzKVZXhQ7Ti1k3AO6J20G6rErfYkOOREH8jjKGUnV6HTO89NRCN52NCOwhxpIFKFrKeoY1yxwWGmnwvjYgp5JZSlmF0NlusMbZXmU52iNSA7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730782873; c=relaxed/simple;
	bh=u99oBsnv8rHP4vhkDgmuW8kfzhU+Z2cEdqoIas+cZxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cQifcwOIkUcE7L9R5BLqiKADxH/8xa+4BT0Jqug6TmuhPUpgHC4/zJFAJJBDneb4a7k46w4vNurZWfTORvdc43xQDpYMHknsuj6uXcfY7DBz/nqtRmDyH9IVBwghw2q69x+KNtEqpQkXq2O33Dp7VSlDGn1eMy5s4pQzwbUxm+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2g4XbtV; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2g4XbtV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730782872; x=1762318872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u99oBsnv8rHP4vhkDgmuW8kfzhU+Z2cEdqoIas+cZxw=;
  b=e2g4XbtV4UQMMwyM9tE64L9HczdhQe67IlMqQDsQhNG6ATxTfsnkCnTB
   d/KI3fQoXZXbOpqplMcJkfBoz1YgB0uSoCOXcdnq4und0d9d5lhiXJK+6
   XnoArarwJQ7RPaGH1Jo82nwcvcHHqonz6hf54wesHmyTzXUsm/RjGLZXc
   ll0NSiQI4iLvO2NoZXlyPRVU6opHWye/l9GSQuhMujYyJTKiZcJ6kxOfx
   oZAagStPEHPZA3TOE3sTo0drFbjxi/FsOvFddRxhX4FmZR2TYwjhydsiW
   gH6NbSWy8E1phl3EB1q8w0iGc/nC0JX6hOHEjtTDKeCTEy7sRECA08oNz
   A==;
X-CSE-ConnectionGUID: HPa0xVzbSkO+kRFSNZ1r4Q==
X-CSE-MsgGUID: cfwyoXU1T1eKvUqmbZPrdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33347569"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="33347569"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 21:01:10 -0800
X-CSE-ConnectionGUID: tuSKdgI7Ria+iQ7L+vEJSQ==
X-CSE-MsgGUID: OuBim8pUSCKi2fDG793wrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="84688057"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Nov 2024 21:01:08 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Bge-000le8-2H;
	Tue, 05 Nov 2024 05:01:04 +0000
Date: Tue, 5 Nov 2024 13:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: Victor Shih <victor.shih@genesyslogic.com.tw>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	Ben Chuang <ben.chuang@genesyslogic.com.tw>
Subject: [ulfh-mmc:next 73/75] drivers/mmc/core/sd_uhs2.c:184:37: sparse:
 sparse: incorrect type in assignment (different base types)
Message-ID: <202411051248.wvjHSFNj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   84185573da385cc0469f5fe2b8c47147c8e24dbf
commit: 53857ced9f23c8720d148748fff434386780afab [73/75] mmc: core: Correct type in variable assignment for UHS-II
config: x86_64-randconfig-121-20241105 (https://download.01.org/0day-ci/archive/20241105/202411051248.wvjHSFNj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051248.wvjHSFNj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051248.wvjHSFNj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mmc/core/sd_uhs2.c:184:37: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be32 @@     got unsigned int [assigned] [usertype] payload0 @@
   drivers/mmc/core/sd_uhs2.c:184:37: sparse:     expected restricted __be32
   drivers/mmc/core/sd_uhs2.c:184:37: sparse:     got unsigned int [assigned] [usertype] payload0

vim +184 drivers/mmc/core/sd_uhs2.c

   132	
   133	/*
   134	 * Do the early initialization of the card, by sending the device init broadcast
   135	 * command and wait for the process to be completed.
   136	 */
   137	static int sd_uhs2_dev_init(struct mmc_host *host)
   138	{
   139		struct mmc_command cmd = {0};
   140		struct uhs2_command uhs2_cmd = {};
   141		u32 cnt;
   142		u32 dap, gap, resp_gap;
   143		u32 payload0;
   144		u8 gd = 0;
   145		int err;
   146	
   147		dap = host->uhs2_caps.dap;
   148		gap = host->uhs2_caps.gap;
   149	
   150		/*
   151		 * Refer to UHS-II Addendum Version 1.02 Figure 6-21 to see DEVICE_INIT CCMD format.
   152		 * Head:
   153		 *      - Control Write(R/W=1) with 4-Byte payload(PLEN=01b).
   154		 *      - IOADR = CMD_BASE + 002h
   155		 * Payload:
   156		 *      - bit [3:0]  : GAP(Group Allocated Power)
   157		 *      - bit [7:4]  : GD(Group Descriptor)
   158		 *      - bit [11]   : Complete Flag
   159		 *      - bit [15:12]: DAP(Device Allocated Power)
   160		 */
   161		uhs2_cmd.header = UHS2_NATIVE_PACKET | UHS2_PACKET_TYPE_CCMD;
   162		uhs2_cmd.arg = ((UHS2_DEV_CMD_DEVICE_INIT & 0xFF) << 8) |
   163		       UHS2_NATIVE_CMD_WRITE |
   164		       UHS2_NATIVE_CMD_PLEN_4B |
   165		       (UHS2_DEV_CMD_DEVICE_INIT >> 8);
   166	
   167		/*
   168		 * Refer to UHS-II Addendum Version 1.02 section 6.3.1.
   169		 * Max. time from DEVICE_INIT CCMD EOP reception on Device
   170		 * Rx to its SOP transmission on Device Tx(Tfwd_init_cmd) is
   171		 * 1 second.
   172		 */
   173		cmd.busy_timeout = 1000;
   174	
   175		/*
   176		 * Refer to UHS-II Addendum Version 1.02 section 6.2.6.3.
   177		 * Let's retry the DEVICE_INIT command no more than 30 times.
   178		 */
   179		for (cnt = 0; cnt < 30; cnt++) {
   180			payload0 = ((dap & 0xF) << 12) |
   181				    UHS2_DEV_INIT_COMPLETE_FLAG |
   182				    ((gd & 0xF) << 4) |
   183				    (gap & 0xF);
 > 184			uhs2_cmd.payload[0] = payload0;
   185	
   186			sd_uhs2_cmd_assemble(&cmd, &uhs2_cmd, UHS2_DEV_INIT_PAYLOAD_LEN,
   187					     UHS2_DEV_INIT_RESP_LEN);
   188	
   189			err = mmc_wait_for_cmd(host, &cmd, 0);
   190	
   191			if (err) {
   192				pr_err("%s: %s: UHS2 CMD send fail, err= 0x%x!\n",
   193				       mmc_hostname(host), __func__, err);
   194				continue;
   195			}
   196	
   197			if (uhs2_cmd.uhs2_resp[3] != (UHS2_DEV_CMD_DEVICE_INIT & 0xFF)) {
   198				pr_err("%s: DEVICE_INIT response is wrong!\n",
   199				       mmc_hostname(host));
   200				return -EIO;
   201			}
   202	
   203			if (uhs2_cmd.uhs2_resp[5] & 0x8) {
   204				host->uhs2_caps.group_desc = gd;
   205				return 0;
   206			}
   207			resp_gap = uhs2_cmd.uhs2_resp[4] & 0x0F;
   208			if (gap == resp_gap)
   209				gd++;
   210		}
   211	
   212		if (err) {
   213			pr_err("%s: %s: UHS2 CMD send fail, err= 0x%x!\n",
   214			       mmc_hostname(host), __func__, err);
   215			return err;
   216		}
   217	
   218		return 0;
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
