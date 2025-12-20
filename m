Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FFB2F0C63
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 16:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766249551; cv=none; b=CsWM1/au99I39PPS8x/qL0GyAZD5cauIELqnu/uok8FQmo3zGZoRhRhy3RpNOSxOtDdrjbZZ4sgi7m/NDeXDxdfvjY0TCEIwejjctOM66MGudR7VXRYGSEJ0OA/C76CaXT/jYvWf5gM+1BwS0nyVjgFzmqmyyyxIjZF4+tUcqcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766249551; c=relaxed/simple;
	bh=AkLjSGhCLQODXaAeWpVrO6KQwRQvRsKxJqcE8OJDPGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SK+thoYlLvIpLdpdkQ7QP/IU7Kca/XzuG0l1APSShaBVfaw6nkoj9FijYVpj15ZgXsEq5oxLACbA0sr4G8gJ7X1X62/mFizOM9a/N+H/c6PI/5nNcDRbmoZMBnJ3y255hPqSyxi7iAPGCWHiHmBhHet8Ceij58ryfJGu3PGipIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UVjZk7ac; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UVjZk7ac"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766249549; x=1797785549;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AkLjSGhCLQODXaAeWpVrO6KQwRQvRsKxJqcE8OJDPGo=;
  b=UVjZk7acJrTo/ZG0YLsKaM4qmhCctEJhT7NtmJlJvkInKpex+qrPYamT
   jJ4zT7T/qF63tmro5yOO+CwJFMBx0cUBzlGOxtqUTQnYSGN9ore6PdpUh
   UlZWTNXPG15UzrQlcM7jRyZf02Q0GYOPnymdN+sF5wHDT+AqMQzVAmdPf
   yRCReKocbcJZOBnluwShAJIspeEDObnCp+FZ2WzdBhMQEIXYdYa0r5VRY
   DEi8zC0tNI9jHuZkLM87MyHu2AE8xLFMgPejX2DXy/ZdjLqAswqVHJ1iC
   A21OFdAp8QhiBC3Etuuu5Gq6VaF5G2MLuoD8R2q6ahkOofRPQHi1J/6Em
   Q==;
X-CSE-ConnectionGUID: WVmfmzKBRLOVsPSYytNp9A==
X-CSE-MsgGUID: qOqAnOR2RViLviSCwodZ/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="85594911"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="85594911"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:52:28 -0800
X-CSE-ConnectionGUID: qxTRQUd2Q62TOX5aFXP0dQ==
X-CSE-MsgGUID: bQxGav1tT7qcpIrC4fJW+w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 20 Dec 2025 08:52:27 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX0Bt-000000004uD-0han;
	Sat, 20 Dec 2025 16:52:25 +0000
Date: Sun, 21 Dec 2025 00:52:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3542/3542]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c:550:55: warning:
 '%08x' directive output may be truncated writing 8 bytes into a region of
 size between 2 and 11
Message-ID: <202512210031.v4yKIJFE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 8d65cdad5ea8e309af47a9a70c538bbbc1223e9a [3542/3542] Net: nebula_matrix: fix ci build warning
config: x86_64-randconfig-161-20251215 (https://download.01.org/0day-ci/archive/20251221/202512210031.v4yKIJFE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210031.v4yKIJFE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210031.v4yKIJFE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c: In function 'nbl_res_adminq_get_firmware_version':
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c:550:55: warning: '%08x' directive output may be truncated writing 8 bytes into a region of size between 2 and 11 [-Wformat-truncation=]
     550 |                          "%d.%d.%d build %04d%02d%02d %08x",
         |                                                       ^~~~
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c:549:17: note: 'snprintf' output between 30 and 39 bytes into a destination of size 32
     549 |                 snprintf(firmware_verion, ETHTOOL_FWVERS_LEN,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     550 |                          "%d.%d.%d build %04d%02d%02d %08x",
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     551 |                          BCD2BYTE((resp_param.version >> 16) & 0xFF),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     552 |                          BCD2BYTE((resp_param.version >> 8) & 0xFF),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     553 |                          BCD2BYTE(resp_param.version & 0xFF),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     554 |                          BCD2SHORT((resp_param.build_date >> 16) & 0xFFFF),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     555 |                          BCD2BYTE((resp_param.build_date >> 8) & 0xFF),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     556 |                          BCD2BYTE(resp_param.build_date & 0xFF),
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     557 |                          resp_param.build_hash);
         |                          ~~~~~~~~~~~~~~~~~~~~~~


vim +550 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_adminq.c

bad535d287c9c1 Bennie Yan 2024-09-24  527  
bad535d287c9c1 Bennie Yan 2024-09-24  528  /* get_emp_version is deprecated, repalced by get_firmware_version, 0x8102 */
bad535d287c9c1 Bennie Yan 2024-09-24  529  static int nbl_res_adminq_get_firmware_version(void *priv, char *firmware_verion)
bad535d287c9c1 Bennie Yan 2024-09-24  530  {
bad535d287c9c1 Bennie Yan 2024-09-24  531  	struct nbl_resource_mgt *res_mgt = (struct nbl_resource_mgt *)priv;
bad535d287c9c1 Bennie Yan 2024-09-24  532  	struct nbl_channel_ops *chan_ops = NBL_RES_MGT_TO_CHAN_OPS(res_mgt);
bad535d287c9c1 Bennie Yan 2024-09-24  533  	struct device *dev = NBL_COMMON_TO_DEV(res_mgt->common);
bad535d287c9c1 Bennie Yan 2024-09-24  534  	struct nbl_chan_send_info chan_send;
bad535d287c9c1 Bennie Yan 2024-09-24  535  	struct nbl_chan_param_nvm_version_resp resp_param;
bad535d287c9c1 Bennie Yan 2024-09-24  536  	int ret = 0;
bad535d287c9c1 Bennie Yan 2024-09-24  537  	u32 version_type = NBL_FW_VERSION_RUNNING_BANK;
bad535d287c9c1 Bennie Yan 2024-09-24  538  
bad535d287c9c1 Bennie Yan 2024-09-24  539  	NBL_CHAN_SEND(chan_send, NBL_CHAN_ADMINQ_FUNCTION_ID, NBL_CHAN_MSG_ADMINQ_GET_NVM_VERSION,
bad535d287c9c1 Bennie Yan 2024-09-24  540  		      &version_type, sizeof(version_type), &resp_param, sizeof(resp_param), 1);
bad535d287c9c1 Bennie Yan 2024-09-24  541  	ret = chan_ops->send_msg(NBL_RES_MGT_TO_CHAN_PRIV(res_mgt), &chan_send);
bad535d287c9c1 Bennie Yan 2024-09-24  542  	if (ret) {
bad535d287c9c1 Bennie Yan 2024-09-24  543  		dev_err(dev, "adminq send msg failed with ret: %d, msg_type: 0x%x\n",
bad535d287c9c1 Bennie Yan 2024-09-24  544  			ret, NBL_CHAN_MSG_ADMINQ_GET_NVM_VERSION);
bad535d287c9c1 Bennie Yan 2024-09-24  545  		return ret;
bad535d287c9c1 Bennie Yan 2024-09-24  546  	}
bad535d287c9c1 Bennie Yan 2024-09-24  547  
bad535d287c9c1 Bennie Yan 2024-09-24  548  	if (!memcmp(resp_param.magic, FIRMWARE_MAGIC, sizeof(resp_param.magic))) {
bad535d287c9c1 Bennie Yan 2024-09-24  549  		snprintf(firmware_verion, ETHTOOL_FWVERS_LEN,
bad535d287c9c1 Bennie Yan 2024-09-24 @550  			 "%d.%d.%d build %04d%02d%02d %08x",
bad535d287c9c1 Bennie Yan 2024-09-24  551  			 BCD2BYTE((resp_param.version >> 16) & 0xFF),
bad535d287c9c1 Bennie Yan 2024-09-24  552  			 BCD2BYTE((resp_param.version >> 8) & 0xFF),
bad535d287c9c1 Bennie Yan 2024-09-24  553  			 BCD2BYTE(resp_param.version & 0xFF),
bad535d287c9c1 Bennie Yan 2024-09-24  554  			 BCD2SHORT((resp_param.build_date >> 16) & 0xFFFF),
bad535d287c9c1 Bennie Yan 2024-09-24  555  			 BCD2BYTE((resp_param.build_date >> 8) & 0xFF),
bad535d287c9c1 Bennie Yan 2024-09-24  556  			 BCD2BYTE(resp_param.build_date & 0xFF),
bad535d287c9c1 Bennie Yan 2024-09-24  557  			 resp_param.build_hash);
bad535d287c9c1 Bennie Yan 2024-09-24  558  	} else {
bad535d287c9c1 Bennie Yan 2024-09-24  559  		dev_err(dev, "adminq msg firmware verion magic check failed\n");
bad535d287c9c1 Bennie Yan 2024-09-24  560  		return -EINVAL;
bad535d287c9c1 Bennie Yan 2024-09-24  561  	}
bad535d287c9c1 Bennie Yan 2024-09-24  562  
bad535d287c9c1 Bennie Yan 2024-09-24  563  	return 0;
bad535d287c9c1 Bennie Yan 2024-09-24  564  }
bad535d287c9c1 Bennie Yan 2024-09-24  565  

:::::: The code at line 550 was first introduced by commit
:::::: bad535d287c9c1056d99de3666be7da84de4a8fc Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.

:::::: TO: Bennie Yan <bennie.yan@nebula-matrix.com>
:::::: CC: Bennie Yan <bennie.yan@nebula-matrix.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
