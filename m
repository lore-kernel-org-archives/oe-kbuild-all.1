Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9235B36E48D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 18:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774548417; cv=none; b=ChEmrk14vWiw2+QLeHCEEpKaNda3pq2+ZrTbFKwYu/qtgAm4HM6GJOPwDGN5Ofs4Ln4uhuRD4v4E76dMusU7PTUNb8ojEPfx4nRubP4bPJmZk1kVTjnl7unC0yv1KAdLwSykK/rHXTPMhYTJp34l0+r9A0SyDJUxahZtwwMCl5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774548417; c=relaxed/simple;
	bh=VkRfA8GO4JFo1xwklM/CeyJ8nFTbWJwzNL2tY+OVgb4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BiG8I4mwYVB9hkzcGamoGvTTQi5ebCGRnS2My7MzlkzRTYZ/igdAA6u+fY4mO/om7vpmeMrMWms9cfHrYCtdmFwNO7Rm/kCj4bq5lR+xrAzbJs8HCWxarwnoWR0bpvAxWSCblhwZDJosnzaxyjiV/RCHBqPZawSV9d9XO80j7Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=la/zzH3g; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="la/zzH3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774548412; x=1806084412;
  h=date:from:to:cc:subject:message-id;
  bh=VkRfA8GO4JFo1xwklM/CeyJ8nFTbWJwzNL2tY+OVgb4=;
  b=la/zzH3gVT2N4czfH886ueS3X0REDA9n76Eh/YLRFM8pFtJ3VmSWCJVf
   hRvGPyhkxb7bbCw1U4hWZMwoA//ECpcbSXLAyGywzfvhs31HPyT56xroT
   BtEslR2R9PmMRb19kSfuEOgwOSXcvle7NIU93ZhRmglPdhI6ht8YPKOVx
   KuczTSEDLyh3gaCcN6/CqZ8HZIOqjrA3uFnS28mIQiOGXidaYYoPuiYpM
   LOP7aXNYvMQ5W6+4Uq0ManoJoh7wv+3NPxCmyebGvZzR/JzJpKw8O9PLV
   3MM0p5r2hurEDivDjwiPGov5XGpyqc1NalK/VdoFnXAMS32WkWxiAi/f6
   w==;
X-CSE-ConnectionGUID: VieVqTFmT92W6ryZIBWRWg==
X-CSE-MsgGUID: R1H34AjCRP29TcfQYjZSIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="79474147"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="79474147"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 11:06:52 -0700
X-CSE-ConnectionGUID: 6i08y8fmRxaTIEy5ScwNkA==
X-CSE-MsgGUID: BfBD/zBzT7y/aAXu+eqggA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="224261941"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Mar 2026 11:06:50 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5p6V-000000009Az-2Brh;
	Thu, 26 Mar 2026 18:06:47 +0000
Date: Fri, 27 Mar 2026 02:06:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:new_tests 18/25]
 drivers/net/ethernet/mellanox/mlx5/core/cmd.c:1228:16: warning: expression
 result unused
Message-ID: <202603270257.eiqFVAWP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/norov/linux new_tests
head:   7402f5cc9265ac58854a5e28fa0305bda6f459ab
commit: 9c19f38601eb29dfc08c3db08940f467f48b1d79 [18/25] mellanox: cleanup mlx5_cmd_all_stalled()
config: x86_64-buildonly-randconfig-003-20260326 (https://download.01.org/0day-ci/archive/20260327/202603270257.eiqFVAWP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603270257.eiqFVAWP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603270257.eiqFVAWP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlx5/core/cmd.c:1228:45: error: expected ';' in 'for' statement specifier
    1228 |         for (i = 0, i < cmd->vars.max_reg_cmds; i++) {
         |                                                    ^
>> drivers/net/ethernet/mellanox/mlx5/core/cmd.c:1228:16: warning: expression result unused [-Wunused-value]
    1228 |         for (i = 0, i < cmd->vars.max_reg_cmds; i++) {
         |                     ~ ^ ~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +1228 drivers/net/ethernet/mellanox/mlx5/core/cmd.c

  1203	
  1204	/* Check if all command slots are stalled (timed out and not recovered).
  1205	 * returns true if all slots timed out on a recent command and have not been
  1206	 * completed by FW yet. (stalled state)
  1207	 * false otherwise (at least one slot is not stalled).
  1208	 *
  1209	 * In such odd situation "all_stalled", this serves as a protection mechanism
  1210	 * to avoid blocking the kernel for long periods of time in case FW is not
  1211	 * responding to commands.
  1212	 */
  1213	static bool mlx5_cmd_all_stalled(struct mlx5_core_dev *dev)
  1214	{
  1215		struct mlx5_cmd *cmd = &dev->cmd;
  1216		bool all_stalled = true;
  1217		unsigned long flags;
  1218		int i;
  1219	
  1220		spin_lock_irqsave(&cmd->alloc_lock, flags);
  1221	
  1222		/* at least one command slot is free */
  1223		if (!bitmap_empty(&cmd->vars.bitmask, cmd->vars.max_reg_cmds)) {
  1224			all_stalled = false;
  1225			goto out;
  1226		}
  1227	
> 1228		for (i = 0, i < cmd->vars.max_reg_cmds; i++) {
  1229			struct mlx5_cmd_work_ent *ent = dev->cmd.ent_arr[i];
  1230	
  1231			if (!test_bit(MLX5_CMD_ENT_STATE_TIMEDOUT, &ent->state)) {
  1232				all_stalled = false;
  1233				break;
  1234			}
  1235		}
  1236	out:
  1237		spin_unlock_irqrestore(&cmd->alloc_lock, flags);
  1238	
  1239		return all_stalled;
  1240	}
  1241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
