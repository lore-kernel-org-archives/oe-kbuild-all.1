Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06058146A87
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 06:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731912861; cv=none; b=aXEXU+zwD+x3qOeKW8x6Fw/w9iTkn53qefSq/Rn432C5WqDE0BzujFSUkS7P4RLXN06sNX2+y6eI6BD2KFk9Kt6GKO1LtxKUnBH7UIltgptDHCpxXhFHEOm25Rqvb5YJXNIfdLIu0nfV2lyoM4KYvEMIjLnCK2m0wyavLsFB2Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731912861; c=relaxed/simple;
	bh=zRQlhWNPRbEIMv4T6XJv5oE0vxydnRPDtfQ4XjnIpUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CdfIa5rN1zbSyD4i3XXr4hd5JW5hiuvO9a0I0/oIyr6d+T9+Tb24f1c3G2Yp39s5cvlBW8Fqtr8BPhqpGUVUEE7qHqK1fpUJ9O8g+H7hCs7bB+OphfYA2ePt9xbyVVtbH+7L6w8QuNgiBmvgputP83uAJ/tQ1K+j4rWXcYEJ38E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WtErY/hX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WtErY/hX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731912860; x=1763448860;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zRQlhWNPRbEIMv4T6XJv5oE0vxydnRPDtfQ4XjnIpUk=;
  b=WtErY/hXFb1QNosPmCL6r3ZopITz/DoeP7ZvGWkeDueSQn/XdH7wgRGs
   5fQZp+KVJiCoscGn4ndCFCh2X1PaURp0k+IVuTRNteeu4lIXewvXhrNYA
   3Zrv22R9jIxYfKQuZFpphMnmfjP9asy3xO2lEGLpIVkYSSc0PzXhpLPO7
   Et53SKccoQ8U4MGpM6oOInUDhwzFs5667/Vfqg+fUlUmz03exnTVK68AK
   CEoLC51e5K/U8KzSr/Cjf3SV32xdcBSdJIiimQLbfSsZ1QWxoxIcLMQyD
   505t7urEe87yHsnQNWpfD4K2WNJ+8G45lzDqrHVN6H2nkvfog48hvKB5J
   Q==;
X-CSE-ConnectionGUID: Xl7YN1k7Q4msSWaJv5rqnQ==
X-CSE-MsgGUID: LCup9WO0SE2J7yLHlEvhlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="32091500"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="32091500"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 22:54:19 -0800
X-CSE-ConnectionGUID: V5VH6jGMRdWJnBDh3peFvw==
X-CSE-MsgGUID: i2IZIz+nS6G+H83YjaAFEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89264871"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Nov 2024 22:54:18 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCveJ-0002JJ-1w;
	Mon, 18 Nov 2024 06:54:15 +0000
Date: Mon, 18 Nov 2024 14:54:07 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Rahul Pathak <rpathak@ventanamicro.com>
Subject: [avpatel:riscv_sbi_mpxy_mailbox_v1 4/4]
 drivers/mailbox/riscv-sbi-mpxy-mbox.c:266:12: warning:
 'mpxy_get_notifications' defined but not used
Message-ID: <202411181442.236XDOoJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_mpxy_mailbox_v1
head:   d8b4a1af21c5a9c42611552bfeeb749c74b771ee
commit: c96d962acec27d7665febff14d585278d7b79085 [4/4] mailbox: Add RISC-V SBI message proxy (MPXY) based mailbox driver
config: riscv-randconfig-r113-20241118 (https://download.01.org/0day-ci/archive/20241118/202411181442.236XDOoJ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241118/202411181442.236XDOoJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181442.236XDOoJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/riscv-sbi-mpxy-mbox.c:266:12: warning: 'mpxy_get_notifications' defined but not used [-Wunused-function]
     266 | static int mpxy_get_notifications(u32 channel_id, void *rx, unsigned long *rx_len)
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mailbox/riscv-sbi-mpxy-mbox.c:189:12: warning: 'mpxy_write_attrs' defined but not used [-Wunused-function]
     189 | static int mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
         |            ^~~~~~~~~~~~~~~~

sparse warnings: (new ones prefixed by >>)
>> drivers/mailbox/riscv-sbi-mpxy-mbox.c:118:29: sparse: sparse: cast to restricted __le32
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:119:29: sparse: sparse: cast to restricted __le32
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:147:29: sparse: sparse: cast to restricted __le32
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:148:29: sparse: sparse: cast to restricted __le32
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:151:45: sparse: sparse: cast to restricted __le32
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:182:40: sparse: sparse: cast to restricted __le32
>> drivers/mailbox/riscv-sbi-mpxy-mbox.c:204:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:204:41: sparse:     expected unsigned int [usertype]
   drivers/mailbox/riscv-sbi-mpxy-mbox.c:204:41: sparse:     got restricted __le32 [usertype]

vim +/mpxy_get_notifications +266 drivers/mailbox/riscv-sbi-mpxy-mbox.c

    99	
   100	static int mpxy_get_channel_count(u32 *channel_count)
   101	{
   102		struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
   103		struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
   104		u32 remaining, returned, start_index = 0;
   105		struct sbiret sret;
   106	
   107		if (!mpxy->shmem_active)
   108			return -ENODEV;
   109		if (!channel_count)
   110			return -EINVAL;
   111	
   112		get_cpu();
   113	
   114		/* Get the remaining and returned fields to calculate total */
   115		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
   116				 start_index, 0, 0, 0, 0, 0);
   117		if (!sret.error) {
 > 118			remaining = le32_to_cpu(sdata->remaining);
   119			returned =  le32_to_cpu(sdata->returned);
   120			*channel_count = remaining + returned;
   121		}
   122	
   123		put_cpu();
   124		return sbi_err_map_linux_errno(sret.error);
   125	}
   126	
   127	static int mpxy_get_channel_ids(u32 channel_count, u32 *channel_ids)
   128	{
   129		u32 remaining, returned, sidx, start_index = 0, cidx = 0;
   130		struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
   131		struct sbi_mpxy_channel_ids_data *sdata = mpxy->shmem;
   132		struct sbiret sret;
   133	
   134		if (!mpxy->shmem_active)
   135			return -ENODEV;
   136		if (!channel_count || !channel_ids)
   137			return -EINVAL;
   138	
   139		get_cpu();
   140	
   141		do {
   142			sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_CHANNEL_IDS,
   143				start_index, 0, 0, 0, 0, 0);
   144			if (sret.error)
   145				goto done;
   146	
   147			remaining = le32_to_cpu(sdata->remaining);
   148			returned =  le32_to_cpu(sdata->returned);
   149	
   150			for (sidx = 0; sidx < returned && cidx < channel_count; sidx++) {
   151				channel_ids[cidx] = le32_to_cpu(sdata->channel_array[sidx]);
   152				cidx += 1;
   153			}
   154	
   155			start_index = cidx;
   156	
   157		} while(remaining);
   158	
   159	done:
   160		put_cpu();
   161		return sbi_err_map_linux_errno(sret.error);
   162	}
   163	
   164	static int mpxy_read_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
   165				   u32 *attrs_buf)
   166	{
   167		struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
   168		struct sbiret sret;
   169		u32 i;
   170	
   171		if (!mpxy->shmem_active)
   172			return -ENODEV;
   173		if (!attr_count || !attrs_buf)
   174			return -EINVAL;
   175	
   176		get_cpu();
   177	
   178		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_READ_ATTRS,
   179				 channel_id, base_attrid, attr_count, 0, 0, 0);
   180		if (!sret.error) {
   181			for (i = 0; i < attr_count; i++)
   182				attrs_buf[i] = le32_to_cpu(((u32 *)mpxy->shmem)[i]);
   183		}
   184	
   185		put_cpu();
   186		return sbi_err_map_linux_errno(sret.error);
   187	}
   188	
 > 189	static int mpxy_write_attrs(u32 channel_id, u32 base_attrid, u32 attr_count,
   190				    u32 *attrs_buf)
   191	{
   192		struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
   193		struct sbiret sret;
   194		u32 i;
   195	
   196		if (!mpxy->shmem_active)
   197			return -ENODEV;
   198		if (!attr_count || !attrs_buf)
   199			return -EINVAL;
   200	
   201		get_cpu();
   202	
   203		for (i = 0; i < attr_count; i++)
 > 204			((u32 *)mpxy->shmem)[i] = cpu_to_le32(attrs_buf[i]);
   205		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_WRITE_ATTRS,
   206				 channel_id, base_attrid, attr_count, 0, 0, 0);
   207	
   208		put_cpu();
   209		return sbi_err_map_linux_errno(sret.error);
   210	}
   211	
   212	static int mpxy_send_message_with_resp(u32 channel_id, u32 msg_id,
   213					       void *tx, unsigned long tx_len,
   214					       void *rx, unsigned long *rx_len)
   215	{
   216		struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
   217		struct sbiret sret;
   218	
   219		if (!mpxy->shmem_active)
   220			return -ENODEV;
   221		if (!tx && tx_len)
   222			return -EINVAL;
   223	
   224		get_cpu();
   225	
   226		/* Message protocols allowed to have no data in messages */
   227		if (tx_len)
   228			memcpy(mpxy->shmem, tx, tx_len);
   229	
   230		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SEND_MSG_WITH_RESP,
   231				 channel_id, msg_id, tx_len, 0, 0, 0);
   232		if (rx && !sret.error) {
   233			memcpy(rx, mpxy->shmem, sret.value);
   234			if (rx_len)
   235				*rx_len = sret.value;
   236		}
   237	
   238		put_cpu();
   239		return sbi_err_map_linux_errno(sret.error);
   240	}
   241	
   242	static int mpxy_send_message_without_resp(u32 channel_id, u32 msg_id,
   243						  void *tx, unsigned long tx_len)
   244	{
   245		struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
   246		struct sbiret sret;
   247	
   248		if (!mpxy->shmem_active)
   249			return -ENODEV;
   250		if (!tx && tx_len)
   251			return -EINVAL;
   252	
   253		get_cpu();
   254	
   255		/* Message protocols allowed to have no data in messages */
   256		if (tx_len)
   257			memcpy(mpxy->shmem, tx, tx_len);
   258	
   259		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_SEND_MSG_NO_RESP,
   260				 channel_id, msg_id, tx_len, 0, 0, 0);
   261	
   262		put_cpu();
   263		return sbi_err_map_linux_errno(sret.error);
   264	}
   265	
 > 266	static int mpxy_get_notifications(u32 channel_id, void *rx, unsigned long *rx_len)
   267	{
   268		struct mpxy_local *mpxy = this_cpu_ptr(&mpxy_local);
   269		struct sbiret sret;
   270	
   271		if (!mpxy->shmem_active)
   272			return -ENODEV;
   273		if (!rx)
   274			return -EINVAL;
   275	
   276		get_cpu();
   277	
   278		sret = sbi_ecall(SBI_EXT_MPXY, SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS,
   279				 channel_id, 0, 0, 0, 0, 0);
   280		if (!sret.error) {
   281			memcpy(rx, mpxy->shmem, sret.value);
   282			if (rx_len)
   283				*rx_len = sret.value;
   284		}
   285	
   286		put_cpu();
   287		return sbi_err_map_linux_errno(sret.error);
   288	}
   289	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
