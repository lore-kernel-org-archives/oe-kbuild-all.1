Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5832F844
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 21:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709500206; cv=none; b=SnvcAh2K1VWfS8ILuGzhVPdfjART2ewsaodXj3iHfIAIXAJn0pJHLE35fdCQ1rxllJ7kFv1ggOXWWSzwG1VjFbqDw5AtZKnVFxQXjJvh5ibCFLALYwpdOfetKpjlY0+JYIWLE4yXf0yDHul83dzvbxM5eizaTTprM6jGxZS55As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709500206; c=relaxed/simple;
	bh=5mnLM/094kcYFc4TCO+XxHb+B9zkxrId6EN8X9K4HOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cpUBLV+O4j08QerWiFN7xPjfD/kTASLC/VYaDD0fZTDmLoCZsiooB6pGltoIo30NEucmm4XKkc1k/09qVmePys+s2t/1NP1wPP/BfZ4lNG9ey8vPhoPHoORjew+APMj3l9Sn0z9uYjjL8Lh1Np1AyKUNRNdGNwM1ApZpz0WMNn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EcpDOjlI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EcpDOjlI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709500203; x=1741036203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5mnLM/094kcYFc4TCO+XxHb+B9zkxrId6EN8X9K4HOk=;
  b=EcpDOjlIo7tjTWMaSFxOj0Vx40714wc/k2US9R49REHy97Wpvfdo4uZN
   78t81dGibI5a7PmSj2KvLUOQKT6QmXUXPVE/bqljUIcSvVr7dtoY9Ufll
   LEpUym7QDBEL7pZEdwWguTdZC4ScgwsQ6ltuKon+H97bWvQc88IHX5anq
   7VJSyNGSYSC39mNK4Y7YToFQYcTlOLE73+BeVD8k4MEoQQkmzsx6m8Skh
   t66Nwj/qkQTMbmF2jwHWFzMyZgqwd3wO2XrS5uGmaP+uuZu+Qp8C8jsuK
   nJDzYzu8GduF6BABtimZhI+vVYOBHADcHq0HqNAM4s6x5BBsfbjxZj5Uo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="15388783"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="15388783"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 13:10:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13345950"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Mar 2024 13:10:01 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgt5r-00026u-0m;
	Sun, 03 Mar 2024 21:09:59 +0000
Date: Mon, 4 Mar 2024 05:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/firmware/microchip/mpfs-auto-update.c:387:72-78: ERROR:
 application of sizeof to pointer
Message-ID: <202403040516.CYxoWTXw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   58c806d867bf265c6fd16fc3bc62e2d3c156b5c9
commit: ec5b0f1193ad461e53d083edad8fab0298fe68e3 firmware: microchip: add PolarFire SoC Auto Update support
date:   3 months ago
config: microblaze-randconfig-r061-20240303 (https://download.01.org/0day-ci/archive/20240304/202403040516.CYxoWTXw-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040516.CYxoWTXw-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/microchip/mpfs-auto-update.c:387:72-78: ERROR: application of sizeof to pointer
   drivers/firmware/microchip/mpfs-auto-update.c:170:72-78: ERROR: application of sizeof to pointer

vim +387 drivers/firmware/microchip/mpfs-auto-update.c

   379	
   380	static int mpfs_auto_update_available(struct mpfs_auto_update_priv *priv)
   381	{
   382		struct mpfs_mss_response *response;
   383		struct mpfs_mss_msg *message;
   384		u32 *response_msg;
   385		int ret;
   386	
 > 387		response_msg = devm_kzalloc(priv->dev, AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(response_msg),
   388					    GFP_KERNEL);
   389		if (!response_msg)
   390			return -ENOMEM;
   391	
   392		response = devm_kzalloc(priv->dev, sizeof(struct mpfs_mss_response), GFP_KERNEL);
   393		if (!response)
   394			return -ENOMEM;
   395	
   396		message = devm_kzalloc(priv->dev, sizeof(struct mpfs_mss_msg), GFP_KERNEL);
   397		if (!message)
   398			return -ENOMEM;
   399	
   400		/*
   401		 * To verify that Auto Update is possible, the "Query Security Service
   402		 * Request" is performed.
   403		 * This service has no command data & does not overload mbox_offset.
   404		 */
   405		response->resp_msg = response_msg;
   406		response->resp_size = AUTO_UPDATE_FEATURE_RESP_SIZE;
   407		message->cmd_opcode = AUTO_UPDATE_FEATURE_CMD_OPCODE;
   408		message->cmd_data_size = AUTO_UPDATE_FEATURE_CMD_DATA_SIZE;
   409		message->response = response;
   410		message->cmd_data = AUTO_UPDATE_FEATURE_CMD_DATA;
   411		message->mbox_offset = AUTO_UPDATE_DEFAULT_MBOX_OFFSET;
   412		message->resp_offset = AUTO_UPDATE_DEFAULT_RESP_OFFSET;
   413	
   414		ret = mpfs_blocking_transaction(priv->sys_controller, message);
   415		if (ret)
   416			return ret;
   417	
   418		/*
   419		 * Currently, the system controller's firmware does not generate any
   420		 * interrupts for failed services, so mpfs_blocking_transaction() should
   421		 * time out & therefore return an error.
   422		 * Hitting this check is highly unlikely at present, but if the system
   423		 * controller's behaviour changes so that it does generate interrupts
   424		 * for failed services, it will be required.
   425		 */
   426		if (response->resp_status)
   427			return -EIO;
   428	
   429		/*
   430		 * Bit 5 of byte 1 is "UL_Auto Update" & if it is set, Auto Update is
   431		 * not possible.
   432		 */
   433		if (response_msg[1] & AUTO_UPDATE_FEATURE_ENABLED)
   434			return -EPERM;
   435	
   436		return 0;
   437	}
   438	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
