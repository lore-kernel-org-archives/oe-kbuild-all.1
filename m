Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B78376BEF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 18:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982981; cv=none; b=TBCY+tC1iozeuS0d/xkRB7NcnHtaHg6ixZGXD/PAeWn6gYCNPO+33B4LNKpDy4r1ThtvKvuuJojqj8ScnEDyLlMuHwMCCcNP8IHGK8Bkt6FWQICeC+ogK7erjdj9WX8R8KqoI2Ev7IyNoL0tIPr9s1t/XKAcD80nn/7ilVpHsqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982981; c=relaxed/simple;
	bh=eIZKtxYF76W65kSx3i5vL8BLY01sfzNH2Pt9bbyg5JQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iFdVfaxnN+q0iEo3umacqOw++c2RIYt4ANvOJk9cadCBFd58uyu4HhXyWLcCtOxO96dqtTe8s5Y36DhZy2J35pSywv2oW/ZsXhC5Hfitt93wAeN/XbLzqbK/EGvSY1Aq0QuDyZ9U8pltoIf/6jH8rn0Dx84jlf3VeWjYZvHnLLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M/JCyK9X; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M/JCyK9X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774982980; x=1806518980;
  h=date:from:to:cc:subject:message-id;
  bh=eIZKtxYF76W65kSx3i5vL8BLY01sfzNH2Pt9bbyg5JQ=;
  b=M/JCyK9XHimGJBkJjGbxd1MO1HAdyjXk91qAwte2cXQXr8WTYx9WFc31
   uCZL7bg5b7+TSUGhXxoOLMA1jnnjYKlWa/e6kPh6LOl3nex/IyWX5FTvC
   9zw2qXHH+na99NVbvQDIDz2oOUcGwnNVmcdDjg50EAZjh3fYBd0sAm9uW
   O+x+Tn4xRXrNNWsgx74yC9WyUH48bfiojcwSmEJz8NZ8YgTHXoQYVW5E8
   uA4eeVHLmodEClafmj0btot7x8OJ21BMM5l5M7uCeNAY3bi2Fj+Qw3Z3n
   Q2ie6SmWBCe3YKwRm5+P7NH8ql/6JYv3ji0J2TGritwtQDBu6DzdJscOB
   g==;
X-CSE-ConnectionGUID: rRQlkGDDT9OILu5824U7XQ==
X-CSE-MsgGUID: KMpq+/A6QAKf1Z0QffBddg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76122459"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="76122459"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 11:49:39 -0700
X-CSE-ConnectionGUID: Ym+/b9g0TzuoI2JKCYiCPA==
X-CSE-MsgGUID: Qu74roe6RCaSoFZTDTNqxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="230882178"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Mar 2026 11:49:37 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7e9e-0000000049T-3lWq;
	Tue, 31 Mar 2026 18:49:34 +0000
Date: Wed, 01 Apr 2026 02:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Anoop Vijay <anoop.c.vijay@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [drm-xe:drm-xe-next 1071/1074]
 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:347:20: sparse: sparse: cast to
 restricted __le32
Message-ID: <202604010228.Z20DhK4g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   72d918472886b6e1b998b756303816737929ef0a
commit: 1f95f618182b5c99d46378141e0fb84f09bf914b [1071/1074] drm/xe/xe_sysctrl: Add System Controller mailbox communication support
config: sparc64-randconfig-r134-20260331 (https://download.01.org/0day-ci/archive/20260401/202604010228.Z20DhK4g-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010228.Z20DhK4g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010228.Z20DhK4g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:347:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:347:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:347:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:347:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:347:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:347:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:347:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:347:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:347:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:347:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:347:20: sparse: sparse: cast to restricted __le32
>> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:347:20: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:348:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:348:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:348:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:348:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:348:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:348:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:348:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:348:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:348:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:348:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:348:24: sparse: sparse: cast to restricted __le32
   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:348:24: sparse: sparse: cast to restricted __le32

vim +347 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c

   309	
   310	/**
   311	 * xe_sysctrl_send_command() - Send mailbox command to System Controller
   312	 * @sc: System Controller instance
   313	 * @cmd: Command descriptor containing request header and payload buffers
   314	 * @rdata_len: Pointer to store actual response data length
   315	 *
   316	 * Sends a mailbox command to System Controller firmware using
   317	 * System Controller mailbox and waits for a response.
   318	 *
   319	 * Request payload is provided via @cmd->data_in and @cmd->data_in_len.
   320	 * If a response is expected, @cmd->data_out must point to a buffer of
   321	 * size @cmd->data_out_len supplied by caller.
   322	 *
   323	 * On success, @rdata_len is updated with number of valid response bytes
   324	 * returned by firmware, bounded by @cmd->data_out_len.
   325	 *
   326	 * Return: 0 on success, or negative errno on failure.
   327	 */
   328	int xe_sysctrl_send_command(struct xe_sysctrl *sc,
   329				    struct xe_sysctrl_mailbox_command *cmd,
   330				    size_t *rdata_len)
   331	{
   332		struct xe_device *xe = sc_to_xe(sc);
   333		u8 group_id, command_code;
   334		u8 *mbox_cmd = NULL;
   335		size_t cmd_size = 0;
   336		int ret;
   337	
   338		guard(xe_pm_runtime_noresume)(xe);
   339	
   340		if (!xe->info.has_sysctrl)
   341			return -ENODEV;
   342	
   343		xe_assert(xe, cmd->data_in || cmd->data_out);
   344		xe_assert(xe, !cmd->data_in || cmd->data_in_len);
   345		xe_assert(xe, !cmd->data_out || cmd->data_out_len);
   346	
 > 347		group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
