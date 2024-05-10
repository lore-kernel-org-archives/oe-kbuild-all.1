Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0388417108A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 14:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715352981; cv=none; b=OTxaEV4a+u3G/iKWU3UK+b7y0piTZPEI1RGMMPxpmC3nlsD12RiNH0tcLiBWG+JEzl4MzMlStXzB9ZdDjTZ9NWDXHJAdeFtASWgKpg8AqrJMdilsby3k04NH09EWyr/D0/NaY4k9mPNPCebB80bOn0qUvr8N5A63YQ4VzfLrRAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715352981; c=relaxed/simple;
	bh=I/Bnjb8OWi7foHN0j3Tiq9iaaXLD7midyb+I/vPw+24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eXtNqtBICb9biu/5zfhX7ycW6y277G5iep1fG9y/pxCO27ab1rMFJd9412heWKxxpHF4h+mqGBpoGu2hfqtwWkNwIsOxLqEgJLzG208mB9O8H5k7eV98uXTxXX8q9dVHmhTOjFr/Er+R1f2Gfk59+u4n4PEII4WYb7SV3p7uCzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ee/O2Hhc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ee/O2Hhc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715352979; x=1746888979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I/Bnjb8OWi7foHN0j3Tiq9iaaXLD7midyb+I/vPw+24=;
  b=ee/O2HhcxlqlYuheU8B7EzOzitd4Q0BiZn+dibmuUYzF/tpHganBgIzw
   Zdaf1txR9hSUnBi1rsXEAgLhEj2EJ+5lQ4BF7y17Y3EZHbOIl1ycOplwm
   I/iVWsiyVRki8ApNr5hWbzjqCM6mrJbAphkys2Xqlzwz9WPkSq4Why273
   EQ+huKeQGObQYCJ9eGEQCmBrIo65unn3adou5Q5RQHYHlBkqhmS3h80hd
   ryKQAkT0ScfFN3BYaEpJzcs4JFqKaORzlhl3t0NJeFYuH0Is4mkai9c2Q
   6lvYMd52IOh9E3b30p3AAL2dRu9Of49/VYxh/gdYbVXjQ+pF3JgL60z0W
   w==;
X-CSE-ConnectionGUID: uV9nxz0ZQ3WZNW7IhSWGWw==
X-CSE-MsgGUID: YOSMStkZTwCOA0amp5l8UQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11270006"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11270006"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 07:56:19 -0700
X-CSE-ConnectionGUID: OsNXa+N6RQazSbgQ95fBdQ==
X-CSE-MsgGUID: hrz2tXxaQBKl1a9aLdQK2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29747365"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 10 May 2024 07:56:17 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5RfS-0006Gp-35;
	Fri, 10 May 2024 14:56:14 +0000
Date: Fri, 10 May 2024 22:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:pci-mbox 7/9] drivers/pci/mmb.c:248:35: warning:
 'pci_mbox_ops' defined but not used
Message-ID: <202405102259.ixnhTGBu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git pci-mbox
head:   9c38a15525283584d0d49404c11c397fe71ba1e8
commit: d7ef18124cb4ba45e597c4b1fdd44ab208ce797e [7/9] PCI/cxl: Migrate the common mailbox operation code from CXL to PCI
config: x86_64-buildonly-randconfig-001-20240510 (https://download.01.org/0day-ci/archive/20240510/202405102259.ixnhTGBu-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405102259.ixnhTGBu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405102259.ixnhTGBu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/mmb.c:248:35: warning: 'pci_mbox_ops' defined but not used [-Wunused-const-variable=]
     248 | static const struct mmio_mbox_ops pci_mbox_ops = {
         |                                   ^~~~~~~~~~~~
--
>> drivers/pci/mmb.c:132: warning: Function parameter or struct member 'mbox' not described in '__mmio_mailbox_send_cmd'
>> drivers/pci/mmb.c:132: warning: expecting prototype for __cxl_pci_mbox_send_cmd(). Prototype was for __mmio_mailbox_send_cmd() instead


vim +/pci_mbox_ops +248 drivers/pci/mmb.c

   107	
   108	/**
   109	 * __cxl_pci_mbox_send_cmd() - Execute a mailbox command
   110	 * @mds: The memory device driver data
   111	 * @mbox_cmd: Command to send to the memory device.
   112	 *
   113	 * Context: Any context. Expects mbox_mutex to be held.
   114	 * Return: -ETIMEDOUT if timeout occurred waiting for completion. 0 on success.
   115	 *         Caller should check the return code in @mbox_cmd to make sure it
   116	 *         succeeded.
   117	 *
   118	 * This is a generic form of the CXL mailbox send command thus only using the
   119	 * registers defined by the mailbox capability ID - CXL 2.0 8.2.8.4. Memory
   120	 * devices, and perhaps other types of CXL devices may have further information
   121	 * available upon error conditions. Driver facilities wishing to send mailbox
   122	 * commands should use the wrapper command.
   123	 *
   124	 * The CXL spec allows for up to two mailboxes. The intention is for the primary
   125	 * mailbox to be OS controlled and the secondary mailbox to be used by system
   126	 * firmware. This allows the OS and firmware to communicate with the device and
   127	 * not need to coordinate with each other. The driver only uses the primary
   128	 * mailbox.
   129	 */
   130	static int __mmio_mailbox_send_cmd(struct mmio_mailbox *mbox,
   131					   struct mmio_mbox_cmd *mbox_cmd)
 > 132	{
   133		void __iomem *payload = mbox->mbox_ctrl_addr + PCI_MMB_PAYLOAD_OFFSET;
   134		struct device *dev = mbox->dev;
   135		u64 cmd_reg, status_reg;
   136		size_t out_len;
   137		int rc;
   138	
   139		lockdep_assert_held(&mbox->mbox_mutex);
   140	
   141		/*
   142		 * Here are the steps from '6.35.1.3.1 MMB Operation' of PCIe Base Spec r6.2
   143		 *   1. Caller reads MB Control Register to verify doorbell is clear
   144		 *   2. Caller writes Command Register
   145		 *   3. Caller writes Command Payload Registers if input payload is non-empty
   146		 *   4. Caller writes MB Control Register to set doorbell
   147		 *   5. Caller either polls for doorbell to be clear or waits for interrupt if configured
   148		 *   6. Caller reads MB Status Register to fetch Return code
   149		 *   7. If command successful, Caller reads Command Register to get Payload Length
   150		 *   8. If output payload is non-empty, host reads Command Payload Registers
   151		 *
   152		 * Hardware is free to do whatever it wants before the doorbell is rung,
   153		 * and isn't allowed to change anything after it clears the doorbell. As
   154		 * such, steps 2 and 3 can happen in any order, and steps 6, 7, 8 can
   155		 * also happen in any order (though some orders might not make sense).
   156		 */
   157	
   158		/* #1 */
   159		if (mmb_doorbell_busy(mbox)) {
   160			dev_warn(dev, "mailbox queue busy");
   161			return -EBUSY;
   162		}
   163	
   164		rc = mmb_send_prep(mbox, mbox_cmd);
   165		if (rc < 0)
   166			return rc;
   167	
   168		cmd_reg = FIELD_PREP(PCI_MMB_CMD_COMMAND_OPCODE_MASK,
   169				     mbox_cmd->opcode);
   170		if (mbox_cmd->size_in) {
   171			if (WARN_ON(!mbox_cmd->payload_in))
   172				return -EINVAL;
   173	
   174			cmd_reg |= FIELD_PREP(PCI_MMB_CMD_PAYLOAD_LENGTH_MASK,
   175					      mbox_cmd->size_in);
   176			memcpy_toio(payload, mbox_cmd->payload_in, mbox_cmd->size_in);
   177		}
   178	
   179		/* #2, #3 */
   180		writeq(cmd_reg, mbox->mbox_ctrl_addr + PCI_MMB_CMD_OFFSET);
   181	
   182		/* #4 */
   183		dev_dbg(dev, "Sending command: 0x%04x\n", mbox_cmd->opcode);
   184		writel(PCI_MMB_CTRL_DOORBELL, mbox->mbox_ctrl_addr + PCI_MMB_CTRL_OFFSET);
   185	
   186		/* #5 */
   187		rc = pci_mmb_wait_for_doorbell(mbox);
   188		if (rc == -ETIMEDOUT) {
   189			dev_warn(dev, "mailbox timeout");
   190			return rc;
   191		}
   192	
   193		/* #6 */
   194		status_reg = readq(mbox->mbox_ctrl_addr + PCI_MMB_STATUS_OFFSET);
   195		mbox_cmd->return_code = FIELD_GET(PCI_MMB_STATUS_RET_CODE_MASK,
   196						  status_reg);
   197	
   198		rc = mmb_send_done(mbox, mbox_cmd);
   199		if (rc < 0)
   200			return rc;
   201		if (rc == 1)
   202			goto success;
   203	
   204		if (mbox_cmd->return_code != 0)
   205			return 0; /* completed but caller must check return_code */
   206	
   207	success:
   208		/* #7 */
   209		cmd_reg = readq(mbox->mbox_ctrl_addr + PCI_MMB_CMD_OFFSET);
   210		out_len = FIELD_GET(PCI_MMB_CMD_PAYLOAD_LENGTH_MASK, cmd_reg);
   211	
   212		/* #8 */
   213		if (out_len && mbox_cmd->payload_out) {
   214			/*
   215			 * Sanitize the copy. If hardware misbehaves, out_len per the
   216			 * spec can actually be greater than the max allowed size (21
   217			 * bits available but spec defined 1M max). The caller also may
   218			 * have requested less data than the hardware supplied even
   219			 * within spec.
   220			 */
   221			size_t n;
   222	
   223			n = min3(mbox_cmd->size_out, mbox->payload_size, out_len);
   224			memcpy_fromio(mbox_cmd->payload_out, payload, n);
   225			mbox_cmd->size_out = n;
   226		} else {
   227			mbox_cmd->size_out = 0;
   228		}
   229	
   230		return 0;
   231	}
   232	
   233	int mmio_mailbox_send(struct mmio_mailbox *mbox, struct mmio_mbox_cmd *cmd)
   234	{
   235		int rc;
   236	
   237		if (!mbox->ops || !mbox->ops->mbox_send)
   238			return -EOPNOTSUPP;
   239	
   240		mutex_lock_io(&mbox->mbox_mutex);
   241		rc = __mmio_mailbox_send_cmd(mbox, cmd);
   242		mutex_unlock(&mbox->mbox_mutex);
   243	
   244		return rc;
   245	}
   246	EXPORT_SYMBOL_GPL(mmio_mailbox_send);
   247	
 > 248	static const struct mmio_mbox_ops pci_mbox_ops = {
   249		.mbox_ready = pci_mmb_ready,
   250		.mbox_send = mmio_mailbox_send,
   251	};
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
