Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749918493
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726675477; cv=none; b=h0Ed5q6qpwfRqp6pn0Go3Oo5o+RzxX6E2bk/BXdPVSPULKfpHwTQXv8PmVDARo15TddeODR/f2teIQ/Dh92TxS1esJilGyt6JtktvUbbB/1e3ATu6muYnUIXvi9v5nON44QbcpzHK9fLS70Sd6sP/sk4fAf/+qtQBKYKV/GTKtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726675477; c=relaxed/simple;
	bh=/OWWFUhwmwzghlwteIIbOIVHKLEf2b4ZA00SwfW3Ock=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oyEd8jHGAbpFw5E1Mb+RUCoH5NFYbXHi/ckZhHsVYO2ZXC52x0rI53RaSwwULQBYVrf8dn1/yLsFPNtJSdmWPUcS7c1ox+aDTZQFWS5xO+LlBHUTyRQ21ZSzBB68rEa+vyL26vlTnRO1ghygGn8YowOpBEoDSAs/xuqu9prLmLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nWT65K5z; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nWT65K5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726675475; x=1758211475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/OWWFUhwmwzghlwteIIbOIVHKLEf2b4ZA00SwfW3Ock=;
  b=nWT65K5z7W2I4N+UnWnb0Q3V7LzkxCSj3geoxanvOevlqjHuJShxNk57
   NL/0rBDtz4M0k2DybcOI/vyd+oOqPsy9YiwslJlUsMongnda3HbmC/L0z
   W7+n2xcNf2ikWY9uNtVs2Y30AlJcJ4Dpo8mSdzqyM1Y4MrcK7KGFfQd+n
   d5VsYqEy/7JfQmZz+Le/PLeltko1A7J9Dzj0UEcBL17whiWHoHoQyNDit
   StkT6jYo3mrYZz0OC0fZKz0Hvkj0lxeCRtMkfWBjk/ruRcimPY50YDqFU
   hVZXcPsuHGgjzhF0UVeV/pphpimvBgqCEepHOtithKJijxm7JACevx6g1
   w==;
X-CSE-ConnectionGUID: quD8f5+ORjOEROFtO+WVEQ==
X-CSE-MsgGUID: 7bvZmJovQcuaDC4Iv5syEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="43115941"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="43115941"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 09:04:29 -0700
X-CSE-ConnectionGUID: NTmoFdmDS4KH2+236ZzR2A==
X-CSE-MsgGUID: ZvR1JFBrTjueasRybofxjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="69865250"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Sep 2024 09:04:27 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqxAH-000CNa-1y;
	Wed, 18 Sep 2024 16:04:25 +0000
Date: Thu, 19 Sep 2024 00:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:fwctl 3/19] drivers/cxl/core/mbox.c:497: warning:
 Function parameter or struct member 'cxl_mbox' not described in
 'cxl_validate_cmd_from_user'
Message-ID: <202409190019.FJpSnKHi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux fwctl
head:   3175f4c0e49e730b73cd11048737516e461acf09
commit: e5c38a2af470e8de2c651087d50b5b86bb40df35 [3/19] cxl: Refactor user ioctl command path from mds to mailbox
config: x86_64-rhel-8.3-kunit (https://download.01.org/0day-ci/archive/20240919/202409190019.FJpSnKHi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409190019.FJpSnKHi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409190019.FJpSnKHi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/mbox.c:497: warning: Function parameter or struct member 'cxl_mbox' not described in 'cxl_validate_cmd_from_user'
>> drivers/cxl/core/mbox.c:497: warning: Excess function parameter 'mds' description in 'cxl_validate_cmd_from_user'
>> drivers/cxl/core/mbox.c:593: warning: Function parameter or struct member 'cxl_mbox' not described in 'handle_mailbox_cmd_from_user'
>> drivers/cxl/core/mbox.c:593: warning: Excess function parameter 'mailbox' description in 'handle_mailbox_cmd_from_user'


vim +497 drivers/cxl/core/mbox.c

6dd0e5cc87b33a Alison Schofield 2022-03-30  476  
6dd0e5cc87b33a Alison Schofield 2022-03-30  477  /**
6dd0e5cc87b33a Alison Schofield 2022-03-30  478   * cxl_validate_cmd_from_user() - Check fields for CXL_MEM_SEND_COMMAND.
9ae016aeb72250 Alison Schofield 2022-03-30  479   * @mbox_cmd: Sanitized and populated &struct cxl_mbox_cmd.
59f8d1510739e9 Dan Williams     2023-06-14  480   * @mds: The driver data for the operation
6dd0e5cc87b33a Alison Schofield 2022-03-30  481   * @send_cmd: &struct cxl_send_command copied in from userspace.
6dd0e5cc87b33a Alison Schofield 2022-03-30  482   *
6dd0e5cc87b33a Alison Schofield 2022-03-30  483   * Return:
6dd0e5cc87b33a Alison Schofield 2022-03-30  484   *  * %0	- @out_cmd is ready to send.
6dd0e5cc87b33a Alison Schofield 2022-03-30  485   *  * %-ENOTTY	- Invalid command specified.
6dd0e5cc87b33a Alison Schofield 2022-03-30  486   *  * %-EINVAL	- Reserved fields or invalid values were used.
6dd0e5cc87b33a Alison Schofield 2022-03-30  487   *  * %-ENOMEM	- Input or output buffer wasn't sized properly.
6dd0e5cc87b33a Alison Schofield 2022-03-30  488   *  * %-EPERM	- Attempted to use a protected command.
6dd0e5cc87b33a Alison Schofield 2022-03-30  489   *  * %-EBUSY	- Kernel has claimed exclusive access to this opcode
6dd0e5cc87b33a Alison Schofield 2022-03-30  490   *
2dd5600a0e4e1a Alison Schofield 2022-03-30  491   * The result of this command is a fully validated command in @mbox_cmd that is
6dd0e5cc87b33a Alison Schofield 2022-03-30  492   * safe to send to the hardware.
6dd0e5cc87b33a Alison Schofield 2022-03-30  493   */
9ae016aeb72250 Alison Schofield 2022-03-30  494  static int cxl_validate_cmd_from_user(struct cxl_mbox_cmd *mbox_cmd,
e5c38a2af470e8 Dave Jiang       2024-07-18  495  				      struct cxl_mailbox *cxl_mbox,
2dd5600a0e4e1a Alison Schofield 2022-03-30  496  				      const struct cxl_send_command *send_cmd)
6dd0e5cc87b33a Alison Schofield 2022-03-30 @497  {
2dd5600a0e4e1a Alison Schofield 2022-03-30  498  	struct cxl_mem_command mem_cmd;
9ae016aeb72250 Alison Schofield 2022-03-30  499  	int rc;
9ae016aeb72250 Alison Schofield 2022-03-30  500  
6dd0e5cc87b33a Alison Schofield 2022-03-30  501  	if (send_cmd->id == 0 || send_cmd->id >= CXL_MEM_COMMAND_ID_MAX)
6dd0e5cc87b33a Alison Schofield 2022-03-30  502  		return -ENOTTY;
6dd0e5cc87b33a Alison Schofield 2022-03-30  503  
4faf31b43468c5 Dan Williams     2021-09-08  504  	/*
6dd0e5cc87b33a Alison Schofield 2022-03-30  505  	 * The user can never specify an input payload larger than what hardware
6dd0e5cc87b33a Alison Schofield 2022-03-30  506  	 * supports, but output can be arbitrarily large (simply write out as
6dd0e5cc87b33a Alison Schofield 2022-03-30  507  	 * much data as the hardware provides).
4faf31b43468c5 Dan Williams     2021-09-08  508  	 */
b92a097067314d Dave Jiang       2024-07-18  509  	if (send_cmd->in.size > cxl_mbox->payload_size)
6dd0e5cc87b33a Alison Schofield 2022-03-30  510  		return -EINVAL;
4faf31b43468c5 Dan Williams     2021-09-08  511  
6dd0e5cc87b33a Alison Schofield 2022-03-30  512  	/* Sanitize and construct a cxl_mem_command */
6dd0e5cc87b33a Alison Schofield 2022-03-30  513  	if (send_cmd->id == CXL_MEM_COMMAND_ID_RAW)
e5c38a2af470e8 Dave Jiang       2024-07-18  514  		rc = cxl_to_mem_cmd_raw(&mem_cmd, send_cmd, cxl_mbox);
6dd0e5cc87b33a Alison Schofield 2022-03-30  515  	else
e5c38a2af470e8 Dave Jiang       2024-07-18  516  		rc = cxl_to_mem_cmd(&mem_cmd, send_cmd, cxl_mbox);
9ae016aeb72250 Alison Schofield 2022-03-30  517  
9ae016aeb72250 Alison Schofield 2022-03-30  518  	if (rc)
9ae016aeb72250 Alison Schofield 2022-03-30  519  		return rc;
9ae016aeb72250 Alison Schofield 2022-03-30  520  
9ae016aeb72250 Alison Schofield 2022-03-30  521  	/* Sanitize and construct a cxl_mbox_cmd */
e5c38a2af470e8 Dave Jiang       2024-07-18  522  	return cxl_mbox_cmd_ctor(mbox_cmd, cxl_mbox, mem_cmd.opcode,
2dd5600a0e4e1a Alison Schofield 2022-03-30  523  				 mem_cmd.info.size_in, mem_cmd.info.size_out,
9ae016aeb72250 Alison Schofield 2022-03-30  524  				 send_cmd->in.payload);
4faf31b43468c5 Dan Williams     2021-09-08  525  }
4faf31b43468c5 Dan Williams     2021-09-08  526  
e5c38a2af470e8 Dave Jiang       2024-07-18  527  int cxl_query_cmd(struct cxl_mailbox *cxl_mbox,
4faf31b43468c5 Dan Williams     2021-09-08  528  		  struct cxl_mem_query_commands __user *q)
4faf31b43468c5 Dan Williams     2021-09-08  529  {
e5c38a2af470e8 Dave Jiang       2024-07-18  530  	struct device *dev = cxl_mbox->host;
4faf31b43468c5 Dan Williams     2021-09-08  531  	struct cxl_mem_command *cmd;
4faf31b43468c5 Dan Williams     2021-09-08  532  	u32 n_commands;
4faf31b43468c5 Dan Williams     2021-09-08  533  	int j = 0;
4faf31b43468c5 Dan Williams     2021-09-08  534  
4faf31b43468c5 Dan Williams     2021-09-08  535  	dev_dbg(dev, "Query IOCTL\n");
4faf31b43468c5 Dan Williams     2021-09-08  536  
4faf31b43468c5 Dan Williams     2021-09-08  537  	if (get_user(n_commands, &q->n_commands))
4faf31b43468c5 Dan Williams     2021-09-08  538  		return -EFAULT;
4faf31b43468c5 Dan Williams     2021-09-08  539  
4faf31b43468c5 Dan Williams     2021-09-08  540  	/* returns the total number if 0 elements are requested. */
4faf31b43468c5 Dan Williams     2021-09-08  541  	if (n_commands == 0)
ff56ab9e164d71 Dan Williams     2021-09-08  542  		return put_user(ARRAY_SIZE(cxl_mem_commands), &q->n_commands);
4faf31b43468c5 Dan Williams     2021-09-08  543  
4faf31b43468c5 Dan Williams     2021-09-08  544  	/*
4451118a465524 Dave Jiang       2024-07-18  545  	 * otherwise, return min(n_commands, total commands) cxl_command_info
4faf31b43468c5 Dan Williams     2021-09-08  546  	 * structures.
4faf31b43468c5 Dan Williams     2021-09-08  547  	 */
4faf31b43468c5 Dan Williams     2021-09-08  548  	cxl_for_each_cmd(cmd) {
814a15f3b4131d Ira Weiny        2023-02-02  549  		struct cxl_command_info info = cmd->info;
4faf31b43468c5 Dan Williams     2021-09-08  550  
e5c38a2af470e8 Dave Jiang       2024-07-18  551  		if (test_bit(info.id, cxl_mbox->enabled_cmds))
814a15f3b4131d Ira Weiny        2023-02-02  552  			info.flags |= CXL_MEM_COMMAND_FLAG_ENABLED;
e5c38a2af470e8 Dave Jiang       2024-07-18  553  		if (test_bit(info.id, cxl_mbox->exclusive_cmds))
814a15f3b4131d Ira Weiny        2023-02-02  554  			info.flags |= CXL_MEM_COMMAND_FLAG_EXCLUSIVE;
814a15f3b4131d Ira Weiny        2023-02-02  555  
814a15f3b4131d Ira Weiny        2023-02-02  556  		if (copy_to_user(&q->commands[j++], &info, sizeof(info)))
4faf31b43468c5 Dan Williams     2021-09-08  557  			return -EFAULT;
4faf31b43468c5 Dan Williams     2021-09-08  558  
4faf31b43468c5 Dan Williams     2021-09-08  559  		if (j == n_commands)
4faf31b43468c5 Dan Williams     2021-09-08  560  			break;
4faf31b43468c5 Dan Williams     2021-09-08  561  	}
4faf31b43468c5 Dan Williams     2021-09-08  562  
4faf31b43468c5 Dan Williams     2021-09-08  563  	return 0;
4faf31b43468c5 Dan Williams     2021-09-08  564  }
4faf31b43468c5 Dan Williams     2021-09-08  565  
4faf31b43468c5 Dan Williams     2021-09-08  566  /**
4faf31b43468c5 Dan Williams     2021-09-08  567   * handle_mailbox_cmd_from_user() - Dispatch a mailbox command for userspace.
e5c38a2af470e8 Dave Jiang       2024-07-18  568   * @mailbox: The mailbox context for the operation.
d97fe8eec2b895 Alison Schofield 2022-03-30  569   * @mbox_cmd: The validated mailbox command.
4faf31b43468c5 Dan Williams     2021-09-08  570   * @out_payload: Pointer to userspace's output payload.
4faf31b43468c5 Dan Williams     2021-09-08  571   * @size_out: (Input) Max payload size to copy out.
4faf31b43468c5 Dan Williams     2021-09-08  572   *            (Output) Payload size hardware generated.
4faf31b43468c5 Dan Williams     2021-09-08  573   * @retval: Hardware generated return code from the operation.
4faf31b43468c5 Dan Williams     2021-09-08  574   *
4faf31b43468c5 Dan Williams     2021-09-08  575   * Return:
4faf31b43468c5 Dan Williams     2021-09-08  576   *  * %0	- Mailbox transaction succeeded. This implies the mailbox
4faf31b43468c5 Dan Williams     2021-09-08  577   *		  protocol completed successfully not that the operation itself
4faf31b43468c5 Dan Williams     2021-09-08  578   *		  was successful.
4faf31b43468c5 Dan Williams     2021-09-08  579   *  * %-ENOMEM  - Couldn't allocate a bounce buffer.
4faf31b43468c5 Dan Williams     2021-09-08  580   *  * %-EFAULT	- Something happened with copy_to/from_user.
4faf31b43468c5 Dan Williams     2021-09-08  581   *  * %-EINTR	- Mailbox acquisition interrupted.
4faf31b43468c5 Dan Williams     2021-09-08  582   *  * %-EXXX	- Transaction level failures.
4faf31b43468c5 Dan Williams     2021-09-08  583   *
d97fe8eec2b895 Alison Schofield 2022-03-30  584   * Dispatches a mailbox command on behalf of a userspace request.
d97fe8eec2b895 Alison Schofield 2022-03-30  585   * The output payload is copied to userspace.
4faf31b43468c5 Dan Williams     2021-09-08  586   *
4faf31b43468c5 Dan Williams     2021-09-08  587   * See cxl_send_cmd().
4faf31b43468c5 Dan Williams     2021-09-08  588   */
e5c38a2af470e8 Dave Jiang       2024-07-18  589  static int handle_mailbox_cmd_from_user(struct cxl_mailbox *cxl_mbox,
d97fe8eec2b895 Alison Schofield 2022-03-30  590  					struct cxl_mbox_cmd *mbox_cmd,
d97fe8eec2b895 Alison Schofield 2022-03-30  591  					u64 out_payload, s32 *size_out,
d97fe8eec2b895 Alison Schofield 2022-03-30  592  					u32 *retval)
4faf31b43468c5 Dan Williams     2021-09-08 @593  {
e5c38a2af470e8 Dave Jiang       2024-07-18  594  	struct device *dev = cxl_mbox->host;
4faf31b43468c5 Dan Williams     2021-09-08  595  	int rc;
4faf31b43468c5 Dan Williams     2021-09-08  596  
4faf31b43468c5 Dan Williams     2021-09-08  597  	dev_dbg(dev,
4faf31b43468c5 Dan Williams     2021-09-08  598  		"Submitting %s command for user\n"
4faf31b43468c5 Dan Williams     2021-09-08  599  		"\topcode: %x\n"
82b8ba29538e5d Alison Schofield 2022-03-30  600  		"\tsize: %zx\n",
d97fe8eec2b895 Alison Schofield 2022-03-30  601  		cxl_mem_opcode_to_name(mbox_cmd->opcode),
d97fe8eec2b895 Alison Schofield 2022-03-30  602  		mbox_cmd->opcode, mbox_cmd->size_in);
4faf31b43468c5 Dan Williams     2021-09-08  603  
b92a097067314d Dave Jiang       2024-07-18  604  	rc = cxl_mbox->mbox_send(cxl_mbox, mbox_cmd);
4faf31b43468c5 Dan Williams     2021-09-08  605  	if (rc)
4faf31b43468c5 Dan Williams     2021-09-08  606  		goto out;
4faf31b43468c5 Dan Williams     2021-09-08  607  
4faf31b43468c5 Dan Williams     2021-09-08  608  	/*
4faf31b43468c5 Dan Williams     2021-09-08  609  	 * @size_out contains the max size that's allowed to be written back out
4faf31b43468c5 Dan Williams     2021-09-08  610  	 * to userspace. While the payload may have written more output than
4faf31b43468c5 Dan Williams     2021-09-08  611  	 * this it will have to be ignored.
4faf31b43468c5 Dan Williams     2021-09-08  612  	 */
d97fe8eec2b895 Alison Schofield 2022-03-30  613  	if (mbox_cmd->size_out) {
d97fe8eec2b895 Alison Schofield 2022-03-30  614  		dev_WARN_ONCE(dev, mbox_cmd->size_out > *size_out,
4faf31b43468c5 Dan Williams     2021-09-08  615  			      "Invalid return size\n");
4faf31b43468c5 Dan Williams     2021-09-08  616  		if (copy_to_user(u64_to_user_ptr(out_payload),
d97fe8eec2b895 Alison Schofield 2022-03-30  617  				 mbox_cmd->payload_out, mbox_cmd->size_out)) {
4faf31b43468c5 Dan Williams     2021-09-08  618  			rc = -EFAULT;
4faf31b43468c5 Dan Williams     2021-09-08  619  			goto out;
4faf31b43468c5 Dan Williams     2021-09-08  620  		}
4faf31b43468c5 Dan Williams     2021-09-08  621  	}
4faf31b43468c5 Dan Williams     2021-09-08  622  
d97fe8eec2b895 Alison Schofield 2022-03-30  623  	*size_out = mbox_cmd->size_out;
d97fe8eec2b895 Alison Schofield 2022-03-30  624  	*retval = mbox_cmd->return_code;
4faf31b43468c5 Dan Williams     2021-09-08  625  
4faf31b43468c5 Dan Williams     2021-09-08  626  out:
d97fe8eec2b895 Alison Schofield 2022-03-30  627  	cxl_mbox_cmd_dtor(mbox_cmd);
4faf31b43468c5 Dan Williams     2021-09-08  628  	return rc;
4faf31b43468c5 Dan Williams     2021-09-08  629  }
4faf31b43468c5 Dan Williams     2021-09-08  630  

:::::: The code at line 497 was first introduced by commit
:::::: 6dd0e5cc87b33aee9cfe4d485c4d8b8382701558 cxl/mbox: Move cxl_mem_command construction to helper funcs

:::::: TO: Alison Schofield <alison.schofield@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
