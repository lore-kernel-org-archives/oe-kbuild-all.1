Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E711B393A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 10:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738146949; cv=none; b=SBCyPuMa8Ea3VFTsLbqxl35WHxSbF8CcWIhOijAeFGVBw7L+9YRvntAfCfgmh4reV55KUC6Nu+S4wYWGthANCtwYqGpDoF5UmGNWE0uX8AmBak4g54KWVFEDYPw6MBpppM3niyD4GPWL8EYW2c4pyM39tx17os1JG+keBCO6f+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738146949; c=relaxed/simple;
	bh=1cz9EBZKYWT4vlpDxxjJ/3Yqfu9ac4IeIXthFP+0900=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DLU+KYIoLGdx+3mtKPN19uVDKzntbruhHm5U/BQ+fxqTQktwzk20mktUe95nyQlSIfGP/LMu334syeb8iHVzYZ19RSqsy1oqWavoCQkcwPbSkA54qNj/IkIlkAnouh+paoPm/bY4jQwoLoSF9pxA/RVcWFQDJlHjZEz9dBveYR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/HcXdiW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/HcXdiW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738146947; x=1769682947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1cz9EBZKYWT4vlpDxxjJ/3Yqfu9ac4IeIXthFP+0900=;
  b=S/HcXdiWZ5Yun/ORwwfms+W5yRYeCAGM9/iVK4CJl4m9zo6NLTakIxSS
   x/B6CPftKUKH+cPRgocboGlEF29l5/Pb6mKuah2W8ibyDFOOLReUiB9Jr
   Ete4GBbq6jsxwPnQMAm/0EJhBUGnyeIDCSMAFxuS47H4uF/a+nhPIaPlV
   uwydhF3JhVw+m/B/fM/a/mLd439Z3BbuqpJXVcqEJe331LDt0DoGisdhY
   d7wAY3hjybppOJ3k07FKcQS8Tfbz37vx2QjM8huapzxHf3xXU3q/rhLh8
   ZDHpTIG6wQ3gLU58ZRYv3F2zCX6Zrkf6IBwsyHAWEpEtplUg0jnWTXGeL
   A==;
X-CSE-ConnectionGUID: Cd2dGlZjQGmYGUV42bb9Yw==
X-CSE-MsgGUID: 6XL0ZnAESC6ADYH92Zkf+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38540179"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="38540179"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 02:35:47 -0800
X-CSE-ConnectionGUID: dpotyem7SVi6IWrH3msXaw==
X-CSE-MsgGUID: 7A5DPqIxRCud6RI+0Uy3fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="108783091"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Jan 2025 02:35:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td5Q7-000irr-09;
	Wed, 29 Jan 2025 10:35:43 +0000
Date: Wed, 29 Jan 2025 18:35:08 +0800
From: kernel test robot <lkp@intel.com>
To: Saeed Mahameed <saeedm@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jgunthorpe:fwctl 7/12] drivers/fwctl/mlx5/main.c:172
 mlx5ctl_validate_rpc() warn: always true condition '(scope >= 0) =>
 (0-u32max >= 0)'
Message-ID: <202501291812.IIxWgUNA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux fwctl
head:   1d728735e6a70ad8c7c6fc2d27b6ac35dfa5945b
commit: 598c1ad93fe1c73044e31ec68d2be561436f0cd9 [7/12] fwctl/mlx5: Support for communicating with mlx5 fw
config: powerpc-randconfig-r072-20250129 (https://download.01.org/0day-ci/archive/20250129/202501291812.IIxWgUNA-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501291812.IIxWgUNA-lkp@intel.com/

smatch warnings:
drivers/fwctl/mlx5/main.c:172 mlx5ctl_validate_rpc() warn: always true condition '(scope >= 0) => (0-u32max >= 0)'

vim +172 drivers/fwctl/mlx5/main.c

   146	
   147	static bool mlx5ctl_validate_rpc(const void *in, enum fwctl_rpc_scope scope)
   148	{
   149		u16 opcode = MLX5_GET(mbox_in_hdr, in, opcode);
   150	
   151		/*
   152		 * Currently the driver can't keep track of commands that allocate
   153		 * objects in the FW, these commands are safe from a security
   154		 * perspective but nothing will free the memory when the FD is closed.
   155		 * For now permit only query commands and set commands that don't alter
   156		 * objects. Also the caps for the scope have not been defined yet,
   157		 * filter commands manually for now.
   158		 */
   159		switch (opcode) {
   160		case MLX5_CMD_OP_POSTPONE_CONNECTED_QP_TIMEOUT:
   161		case MLX5_CMD_OP_QUERY_ADAPTER:
   162		case MLX5_CMD_OP_QUERY_ESW_FUNCTIONS:
   163		case MLX5_CMD_OP_QUERY_HCA_CAP:
   164		case MLX5_CMD_OP_QUERY_HCA_VPORT_CONTEXT:
   165		case MLX5_CMD_OP_QUERY_ROCE_ADDRESS:
   166		case MLX5_CMD_OPCODE_QUERY_VUID:
   167		/*
   168		 * FW limits SET_HCA_CAP on the tools UID to only the other function
   169		 * mode which is used for function pre-configuration
   170		 */
   171		case MLX5_CMD_OP_SET_HCA_CAP:
 > 172			return scope >= FWCTL_RPC_CONFIGURATION;
   173	
   174		case MLX5_CMD_OP_QUERY_CONG_PARAMS:
   175		case MLX5_CMD_OP_QUERY_CONG_STATISTICS:
   176		case MLX5_CMD_OP_QUERY_CONG_STATUS:
   177		case MLX5_CMD_OP_QUERY_CQ:
   178		case MLX5_CMD_OP_QUERY_DCT:
   179		case MLX5_CMD_OP_QUERY_DIAGNOSTIC_COUNTERS:
   180		case MLX5_CMD_OP_QUERY_DIAGNOSTIC_PARAMS:
   181		case MLX5_CMD_OP_QUERY_EQ:
   182		case MLX5_CMD_OP_QUERY_ESW_VPORT_CONTEXT:
   183		case MLX5_CMD_OP_QUERY_FLOW_COUNTER:
   184		case MLX5_CMD_OP_QUERY_FLOW_GROUP:
   185		case MLX5_CMD_OP_QUERY_FLOW_TABLE_ENTRY:
   186		case MLX5_CMD_OP_QUERY_FLOW_TABLE:
   187		case MLX5_CMD_OP_QUERY_GENERAL_OBJECT:
   188		case MLX5_CMD_OP_QUERY_ISSI:
   189		case MLX5_CMD_OP_QUERY_L2_TABLE_ENTRY:
   190		case MLX5_CMD_OP_QUERY_LAG:
   191		case MLX5_CMD_OP_QUERY_MAD_DEMUX:
   192		case MLX5_CMD_OP_QUERY_MKEY:
   193		case MLX5_CMD_OP_QUERY_MODIFY_HEADER_CONTEXT:
   194		case MLX5_CMD_OP_QUERY_PACKET_REFORMAT_CONTEXT:
   195		case MLX5_CMD_OP_QUERY_PAGES:
   196		case MLX5_CMD_OP_QUERY_Q_COUNTER:
   197		case MLX5_CMD_OP_QUERY_QP:
   198		case MLX5_CMD_OP_QUERY_RMP:
   199		case MLX5_CMD_OP_QUERY_RQ:
   200		case MLX5_CMD_OP_QUERY_RQT:
   201		case MLX5_CMD_OP_QUERY_SCHEDULING_ELEMENT:
   202		case MLX5_CMD_OP_QUERY_SPECIAL_CONTEXTS:
   203		case MLX5_CMD_OP_QUERY_SQ:
   204		case MLX5_CMD_OP_QUERY_SRQ:
   205		case MLX5_CMD_OP_QUERY_TIR:
   206		case MLX5_CMD_OP_QUERY_TIS:
   207		case MLX5_CMD_OP_QUERY_VHCA_MIGRATION_STATE:
   208		case MLX5_CMD_OP_QUERY_VNIC_ENV:
   209		case MLX5_CMD_OP_QUERY_VPORT_COUNTER:
   210		case MLX5_CMD_OP_QUERY_VPORT_STATE:
   211		case MLX5_CMD_OP_QUERY_WOL_ROL:
   212		case MLX5_CMD_OP_QUERY_XRC_SRQ:
   213		case MLX5_CMD_OP_QUERY_XRQ_DC_PARAMS_ENTRY:
   214		case MLX5_CMD_OP_QUERY_XRQ_ERROR_PARAMS:
   215		case MLX5_CMD_OP_QUERY_XRQ:
   216			return scope >= FWCTL_RPC_DEBUG_READ_ONLY;
   217	
   218		case MLX5_CMD_OP_SET_DIAGNOSTIC_PARAMS:
   219			return scope >= FWCTL_RPC_DEBUG_WRITE;
   220	
   221		case MLX5_CMD_OP_ACCESS_REG:
   222			return scope >= FWCTL_RPC_DEBUG_WRITE_FULL;
   223		default:
   224			return false;
   225		}
   226	}
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
