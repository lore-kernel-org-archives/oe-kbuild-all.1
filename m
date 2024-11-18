Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5D053A7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 13:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731938199; cv=none; b=RCcQe9ryEB7nQ67UQOP/bAazlFR26KqfGnA3UBBVo+rmgUAXPU0PBae6r7DNYQXzJdoYPKWdn0LNYhKozLAJ56665bdXEjW5f4lO1HKAi7kwFVlYApJphLiLoaqAzWfFD8kYqY7K28Gv6bKMS+HE6ZPviW0ZFxkr3w3Q9xQSc9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731938199; c=relaxed/simple;
	bh=lZKw7TIT0uW557igklQytZE8UAgb2GYcAxmVm0nlIMs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KvFaNgNdFhyd/kGgCS9nszQgPWNha7LALluZl/g8YynjTKtBgUQJ5mq/WKbWrmR0oXJzWISz9lE/+4CJmNm3b021tr8tM8FQ9obmD33ZhmdO2WAlT95UkOTtCkz7Ui1tCRprn0st0iqICfUOfiXKOvkp4G7azaJr5VT2L/OQw/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnqP+ITp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnqP+ITp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731938198; x=1763474198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lZKw7TIT0uW557igklQytZE8UAgb2GYcAxmVm0nlIMs=;
  b=SnqP+ITpOv6GDIQcD+ySt8kl6xAypfSl4sL+KoAAkWrTXSEh6s9E4VnD
   FCVZPswUYlsMEmLwJl77au9eHW4SA7C13iWgbezH8miNjEsCEHx7VYIdh
   IdI9BZssPneCS3sv1nz/kHkmSVMkYm2pV/uyEG6CDrNbRukUxgZV3mdW/
   +aZBqteI0V6US+6km7xk0H5HlNJONyxgWWG5LsMdTFfZuXGgW0hWbE1Ph
   mLo1uch8X5ID0Nz7Q3biyg/VKop+Odvk6ly0D4kuu1wA5g8By9vLZN1f+
   jRqc1vNROrmn90zm7Kc8ZNEmpRbC6oBrfW1093VQOWMK1OlQVmh+4rSMV
   A==;
X-CSE-ConnectionGUID: bjR5I/bxRWmPtBZwt94m6A==
X-CSE-MsgGUID: F0wEGxK3QfK8asYDplWv9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31948022"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="31948022"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 05:56:37 -0800
X-CSE-ConnectionGUID: LSXLnijuSTizGAmYn/YJPQ==
X-CSE-MsgGUID: O92nQMrUTCCmy1SNwliCzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="89014003"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Nov 2024 05:56:34 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD2Ey-0002Rx-20;
	Mon, 18 Nov 2024 13:56:32 +0000
Date: Mon, 18 Nov 2024 21:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:fwctl 19/23] drivers/cxl/pci.c:199: warning: Function
 parameter or struct member 'cxl_mbox' not described in
 '__cxl_pci_mbox_send_cmd'
Message-ID: <202411182116.TsU5maoS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux fwctl
head:   e4450fb1459bf712009c7cb1461643287e0f9e75
commit: cd685083320fbb36fbe7973406d5001962699335 [19/23] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands (RFC)
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241118/202411182116.TsU5maoS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411182116.TsU5maoS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411182116.TsU5maoS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/pci.c:199: warning: Function parameter or struct member 'cxl_mbox' not described in '__cxl_pci_mbox_send_cmd'
>> drivers/cxl/pci.c:199: warning: Excess function parameter 'mds' description in '__cxl_pci_mbox_send_cmd'
--
>> drivers/cxl/core/mbox.c:580: warning: Function parameter or struct member 'cxl_mbox' not described in 'cxl_validate_cmd_from_user'
>> drivers/cxl/core/mbox.c:580: warning: Excess function parameter 'mds' description in 'cxl_validate_cmd_from_user'
>> drivers/cxl/core/mbox.c:765: warning: Function parameter or struct member 'cxl_mbox' not described in 'handle_mailbox_cmd_from_user'
>> drivers/cxl/core/mbox.c:765: warning: Excess function parameter 'mailbox' description in 'handle_mailbox_cmd_from_user'
>> drivers/cxl/core/mbox.c:840: warning: Function parameter or struct member 'cxl_mbox' not described in 'handle_mailbox_cmd_from_fwctl'
>> drivers/cxl/core/mbox.c:840: warning: Excess function parameter 'mailbox' description in 'handle_mailbox_cmd_from_fwctl'


vim +199 drivers/cxl/pci.c

0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  174  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  175  /**
ed97afb53365cd drivers/cxl/pci.c Ben Widawsky    2021-09-13  176   * __cxl_pci_mbox_send_cmd() - Execute a mailbox command
59f8d1510739e9 drivers/cxl/pci.c Dan Williams    2023-06-14  177   * @mds: The memory device driver data
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  178   * @mbox_cmd: Command to send to the memory device.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  179   *
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  180   * Context: Any context. Expects mbox_mutex to be held.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  181   * Return: -ETIMEDOUT if timeout occurred waiting for completion. 0 on success.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  182   *         Caller should check the return code in @mbox_cmd to make sure it
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  183   *         succeeded.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  184   *
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  185   * This is a generic form of the CXL mailbox send command thus only using the
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  186   * registers defined by the mailbox capability ID - CXL 2.0 8.2.8.4. Memory
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  187   * devices, and perhaps other types of CXL devices may have further information
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  188   * available upon error conditions. Driver facilities wishing to send mailbox
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  189   * commands should use the wrapper command.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  190   *
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  191   * The CXL spec allows for up to two mailboxes. The intention is for the primary
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  192   * mailbox to be OS controlled and the secondary mailbox to be used by system
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  193   * firmware. This allows the OS and firmware to communicate with the device and
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  194   * not need to coordinate with each other. The driver only uses the primary
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  195   * mailbox.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  196   */
b92a097067314d drivers/cxl/pci.c Dave Jiang      2024-07-18  197  static int __cxl_pci_mbox_send_cmd(struct cxl_mailbox *cxl_mbox,
b64955a9292934 drivers/cxl/pci.c Dan Williams    2021-09-08  198  				   struct cxl_mbox_cmd *mbox_cmd)
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16 @199  {
b92a097067314d drivers/cxl/pci.c Dave Jiang      2024-07-18  200  	struct cxl_dev_state *cxlds = container_of(cxl_mbox,
b92a097067314d drivers/cxl/pci.c Dave Jiang      2024-07-18  201  						   struct cxl_dev_state,
b92a097067314d drivers/cxl/pci.c Dave Jiang      2024-07-18  202  						   cxl_mbox);
b92a097067314d drivers/cxl/pci.c Dave Jiang      2024-07-18  203  	struct cxl_memdev_state *mds = to_cxl_memdev_state(cxlds);
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  204  	void __iomem *payload = cxlds->regs.mbox + CXLDEV_MBOX_PAYLOAD_OFFSET;
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  205  	struct device *dev = cxlds->dev;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  206  	u64 cmd_reg, status_reg;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  207  	size_t out_len;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  208  	int rc;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  209  
b92a097067314d drivers/cxl/pci.c Dave Jiang      2024-07-18  210  	lockdep_assert_held(&cxl_mbox->mbox_mutex);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  211  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  212  	/*
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  213  	 * Here are the steps from 8.2.8.4 of the CXL 2.0 spec.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  214  	 *   1. Caller reads MB Control Register to verify doorbell is clear
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  215  	 *   2. Caller writes Command Register
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  216  	 *   3. Caller writes Command Payload Registers if input payload is non-empty
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  217  	 *   4. Caller writes MB Control Register to set doorbell
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  218  	 *   5. Caller either polls for doorbell to be clear or waits for interrupt if configured
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  219  	 *   6. Caller reads MB Status Register to fetch Return code
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  220  	 *   7. If command successful, Caller reads Command Register to get Payload Length
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  221  	 *   8. If output payload is non-empty, host reads Command Payload Registers
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  222  	 *
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  223  	 * Hardware is free to do whatever it wants before the doorbell is rung,
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  224  	 * and isn't allowed to change anything after it clears the doorbell. As
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  225  	 * such, steps 2 and 3 can happen in any order, and steps 6, 7, 8 can
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  226  	 * also happen in any order (though some orders might not make sense).
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  227  	 */
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  228  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  229  	/* #1 */
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  230  	if (cxl_doorbell_busy(cxlds)) {
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  231  		u64 md_status =
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  232  			readq(cxlds->regs.memdev + CXLMDEV_STATUS_OFFSET);
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  233  
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  234  		cxl_cmd_err(cxlds->dev, mbox_cmd, md_status,
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  235  			    "mailbox queue busy");
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  236  		return -EBUSY;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  237  	}
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  238  
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  239  	/*
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  240  	 * With sanitize polling, hardware might be done and the poller still
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  241  	 * not be in sync. Ensure no new command comes in until so. Keep the
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  242  	 * hardware semantics and only allow device health status.
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  243  	 */
aeaefabc59ec3c drivers/cxl/pci.c Dan Williams    2023-06-25  244  	if (mds->security.poll_tmo_secs > 0) {
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  245  		if (mbox_cmd->opcode != CXL_MBOX_OP_GET_HEALTH_INFO)
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  246  			return -EBUSY;
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  247  	}
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  248  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  249  	cmd_reg = FIELD_PREP(CXLDEV_MBOX_CMD_COMMAND_OPCODE_MASK,
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  250  			     mbox_cmd->opcode);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  251  	if (mbox_cmd->size_in) {
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  252  		if (WARN_ON(!mbox_cmd->payload_in))
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  253  			return -EINVAL;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  254  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  255  		cmd_reg |= FIELD_PREP(CXLDEV_MBOX_CMD_PAYLOAD_LENGTH_MASK,
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  256  				      mbox_cmd->size_in);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  257  		memcpy_toio(payload, mbox_cmd->payload_in, mbox_cmd->size_in);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  258  	}
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  259  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  260  	/* #2, #3 */
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  261  	writeq(cmd_reg, cxlds->regs.mbox + CXLDEV_MBOX_CMD_OFFSET);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  262  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  263  	/* #4 */
852db33c6c180a drivers/cxl/pci.c Robert Richter  2023-01-03  264  	dev_dbg(dev, "Sending command: 0x%04x\n", mbox_cmd->opcode);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  265  	writel(CXLDEV_MBOX_CTRL_DOORBELL,
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  266  	       cxlds->regs.mbox + CXLDEV_MBOX_CTRL_OFFSET);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  267  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  268  	/* #5 */
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  269  	rc = cxl_pci_mbox_wait_for_doorbell(cxlds);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  270  	if (rc == -ETIMEDOUT) {
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  271  		u64 md_status = readq(cxlds->regs.memdev + CXLMDEV_STATUS_OFFSET);
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  272  
4f195ee73ade1a drivers/cxl/pci.c Dan Williams    2022-01-23  273  		cxl_cmd_err(cxlds->dev, mbox_cmd, md_status, "mailbox timeout");
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  274  		return rc;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  275  	}
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  276  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  277  	/* #6 */
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  278  	status_reg = readq(cxlds->regs.mbox + CXLDEV_MBOX_STATUS_OFFSET);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  279  	mbox_cmd->return_code =
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  280  		FIELD_GET(CXLDEV_MBOX_STATUS_RET_CODE_MASK, status_reg);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  281  
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  282  	/*
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  283  	 * Handle the background command in a synchronous manner.
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  284  	 *
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  285  	 * All other mailbox commands will serialize/queue on the mbox_mutex,
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  286  	 * which we currently hold. Furthermore this also guarantees that
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  287  	 * cxl_mbox_background_complete() checks are safe amongst each other,
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  288  	 * in that no new bg operation can occur in between.
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  289  	 *
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  290  	 * Background operations are timesliced in accordance with the nature
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  291  	 * of the command. In the event of timeout, the mailbox state is
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  292  	 * indeterminate until the next successful command submission and the
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  293  	 * driver can get back in sync with the hardware state.
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  294  	 */
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  295  	if (mbox_cmd->return_code == CXL_MBOX_CMD_RC_BACKGROUND) {
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  296  		u64 bg_status_reg;
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  297  		int i, timeout;
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  298  
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  299  		/*
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  300  		 * Sanitization is a special case which monopolizes the device
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  301  		 * and cannot be timesliced. Handle asynchronously instead,
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  302  		 * and allow userspace to poll(2) for completion.
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  303  		 */
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  304  		if (mbox_cmd->opcode == CXL_MBOX_OP_SANITIZE) {
339818380868e3 drivers/cxl/pci.c Dan Williams    2023-10-04  305  			if (mds->security.sanitize_active)
339818380868e3 drivers/cxl/pci.c Dan Williams    2023-10-04  306  				return -EBUSY;
339818380868e3 drivers/cxl/pci.c Dan Williams    2023-10-04  307  
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  308  			/* give first timeout a second */
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  309  			timeout = 1;
aeaefabc59ec3c drivers/cxl/pci.c Dan Williams    2023-06-25  310  			mds->security.poll_tmo_secs = timeout;
339818380868e3 drivers/cxl/pci.c Dan Williams    2023-10-04  311  			mds->security.sanitize_active = true;
e30a106558e7d1 drivers/cxl/pci.c Dan Williams    2023-09-29  312  			schedule_delayed_work(&mds->security.poll_dwork,
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  313  					      timeout * HZ);
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  314  			dev_dbg(dev, "Sanitization operation started\n");
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  315  			goto success;
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  316  		}
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  317  
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  318  		dev_dbg(dev, "Mailbox background operation (0x%04x) started\n",
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  319  			mbox_cmd->opcode);
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  320  
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  321  		timeout = mbox_cmd->poll_interval_ms;
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  322  		for (i = 0; i < mbox_cmd->poll_count; i++) {
b92a097067314d drivers/cxl/pci.c Dave Jiang      2024-07-18  323  			if (rcuwait_wait_event_timeout(&cxl_mbox->mbox_wait,
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  324  						       cxl_mbox_background_complete(cxlds),
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  325  						       TASK_UNINTERRUPTIBLE,
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  326  						       msecs_to_jiffies(timeout)) > 0)
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  327  				break;
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  328  		}
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  329  
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  330  		if (!cxl_mbox_background_complete(cxlds)) {
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  331  			dev_err(dev, "timeout waiting for background (%d ms)\n",
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  332  				timeout * mbox_cmd->poll_count);
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  333  			return -ETIMEDOUT;
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  334  		}
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  335  
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  336  		bg_status_reg = readq(cxlds->regs.mbox +
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  337  				      CXLDEV_MBOX_BG_CMD_STATUS_OFFSET);
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  338  		mbox_cmd->return_code =
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  339  			FIELD_GET(CXLDEV_MBOX_BG_CMD_COMMAND_RC_MASK,
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  340  				  bg_status_reg);
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  341  		dev_dbg(dev,
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  342  			"Mailbox background operation (0x%04x) completed\n",
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  343  			mbox_cmd->opcode);
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  344  	}
ccadf1310fb0bc drivers/cxl/pci.c Davidlohr Bueso 2023-05-23  345  
92fcc1abab095d drivers/cxl/pci.c Davidlohr Bueso 2022-04-03  346  	if (mbox_cmd->return_code != CXL_MBOX_CMD_RC_SUCCESS) {
c43e036d6f861f drivers/cxl/pci.c Davidlohr Bueso 2022-04-03  347  		dev_dbg(dev, "Mailbox operation had an error: %s\n",
c43e036d6f861f drivers/cxl/pci.c Davidlohr Bueso 2022-04-03  348  			cxl_mbox_cmd_rc2str(mbox_cmd));
cbe83a2052682c drivers/cxl/pci.c Davidlohr Bueso 2022-04-03  349  		return 0; /* completed but caller must check return_code */
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  350  	}
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  351  
0c36b6ad436a38 drivers/cxl/pci.c Davidlohr Bueso 2023-06-12  352  success:
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  353  	/* #7 */
5e2411ae807161 drivers/cxl/pci.c Ira Weiny       2021-11-02  354  	cmd_reg = readq(cxlds->regs.mbox + CXLDEV_MBOX_CMD_OFFSET);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  355  	out_len = FIELD_GET(CXLDEV_MBOX_CMD_PAYLOAD_LENGTH_MASK, cmd_reg);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  356  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  357  	/* #8 */
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  358  	if (out_len && mbox_cmd->payload_out) {
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  359  		/*
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  360  		 * Sanitize the copy. If hardware misbehaves, out_len per the
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  361  		 * spec can actually be greater than the max allowed size (21
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  362  		 * bits available but spec defined 1M max). The caller also may
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  363  		 * have requested less data than the hardware supplied even
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  364  		 * within spec.
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  365  		 */
59f8d1510739e9 drivers/cxl/pci.c Dan Williams    2023-06-14  366  		size_t n;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  367  
b92a097067314d drivers/cxl/pci.c Dave Jiang      2024-07-18  368  		n = min3(mbox_cmd->size_out, cxl_mbox->payload_size, out_len);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  369  		memcpy_fromio(mbox_cmd->payload_out, payload, n);
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  370  		mbox_cmd->size_out = n;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  371  	} else {
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  372  		mbox_cmd->size_out = 0;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  373  	}
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  374  
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  375  	return 0;
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  376  }
8adaf747c9f0b4 drivers/cxl/mem.c Ben Widawsky    2021-02-16  377  

:::::: The code at line 199 was first introduced by commit
:::::: 8adaf747c9f0b470aea1b0c88583aa0a344e1540 cxl/mem: Find device capabilities

:::::: TO: Ben Widawsky <ben.widawsky@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
