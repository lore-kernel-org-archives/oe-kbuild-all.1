Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2017376
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 May 2024 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715346132; cv=none; b=hC5gkJQ7aAcMgik9JPytUsYPwwaFEohH5XG3JXuYe5FXRfee9iTZvqEo3pALg5YvzlgCj1xlSd7WFMAdrnhJes75ONP4M3812+USUBuqAPzWjdb2rp4NyCP7ebsOEiV6gJeNrgcxKn6vyu1oVQT6wi7f7XuzwjonH4pBBzfL/DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715346132; c=relaxed/simple;
	bh=Cswde4cXe4jMlyoAzkDxGdkYfftMNDf1RY3SkSqJs6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mPYq3sEU6TAY6omwsr3ogYYyrtJPv5wnfPaOjzx3jsOM4MJ9C92yaDue/T6TuU+juJrrr8IGbYIJJV45jdbyIgKcoQ6DV+HOb8KFIHy9mX0n9ytoN2s4aDukfxEwTVey4LLzPnFyeF0NKKc+/PHmwQ5ukL38tL2g3TxRpdfB4og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vp6AudxY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vp6AudxY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715346130; x=1746882130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Cswde4cXe4jMlyoAzkDxGdkYfftMNDf1RY3SkSqJs6E=;
  b=Vp6AudxY9nOo9stCTDhVrzrd48ujlX4y/YNL0hzJkfJZQzoRdd2Si48x
   cietvvzpgF9OCY3PkDeF0vw3+dHtKMN88Dd0zmwbuWliWBpDy5lZ0dQjk
   QaaPWEBp/eFqFFHb+806H90rBPlC8sZ5RN8yiQW+71nrEo7h8dU/I2kN3
   2QfGa6EUHOggTiXo1x/vT7pA6sBsczVt1aOkQlWmQ7FIxrmOBQ62WNAro
   +HVRCMSiYvzxifhpMMZfUBIiIItlzzANh8PiHrcmAP0v8d6b+akqXBGWO
   ApGFj5GSNHNt5vhS+MwemwKcYoh0KVrVc025cNxnZuYr4auFWLUzlWL4n
   w==;
X-CSE-ConnectionGUID: a0hwGC4mSyKWWsw3NZFmBQ==
X-CSE-MsgGUID: kvnp4ZLkSMKEg4ooFeXlrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11536671"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11536671"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 06:02:09 -0700
X-CSE-ConnectionGUID: MQEQRzMYSN6rIdtubotZSQ==
X-CSE-MsgGUID: kglWJyMKRiCT+fvpYMDaIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="30163109"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 May 2024 06:02:09 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5Psz-0006A9-2V;
	Fri, 10 May 2024 13:02:05 +0000
Date: Fri, 10 May 2024 21:01:45 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djiang:pci-mbox 7/9] drivers/pci/mmb.c:56:18: error: implicit
 declaration of function 'readq'; did you mean 'readb'?
Message-ID: <202405102011.eWUhLd0G-lkp@intel.com>
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
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20240510/202405102011.eWUhLd0G-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240510/202405102011.eWUhLd0G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405102011.eWUhLd0G-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/mmb.c: In function 'pci_mmb_ready':
>> drivers/pci/mmb.c:56:18: error: implicit declaration of function 'readq'; did you mean 'readb'? [-Werror=implicit-function-declaration]
      56 |         status = readq(mbox->mbox_ready_addr + PCI_MMB_STATUS_OFFSET);
         |                  ^~~~~
         |                  readb
   drivers/pci/mmb.c: In function '__mmio_mailbox_send_cmd':
>> drivers/pci/mmb.c:180:9: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
     180 |         writeq(cmd_reg, mbox->mbox_ctrl_addr + PCI_MMB_CMD_OFFSET);
         |         ^~~~~~
         |         writeb
   drivers/pci/mmb.c: At top level:
   drivers/pci/mmb.c:248:35: warning: 'pci_mbox_ops' defined but not used [-Wunused-const-variable=]
     248 | static const struct mmio_mbox_ops pci_mbox_ops = {
         |                                   ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/cxl/core/mbox.c: In function 'cxl_mbox_ready':
>> drivers/cxl/core/mbox.c:1463:21: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
    1463 |         md_status = readq(mbox->mbox_ready_addr + CXLMDEV_STATUS_OFFSET);
         |                     ^~~~~
         |                     readl
   during RTL pass: mach
   drivers/cxl/core/mbox.c: In function 'cxl_internal_mailbox_send':
   drivers/cxl/core/mbox.c:140:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9703
     140 | }
         | ^
   0x5b78c1 arc_ifcvt
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:9703
   0xe431b4 arc_reorg
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/config/arc/arc.cc:8552
   0xaed299 execute
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.


vim +56 drivers/pci/mmb.c

    51	
    52	static bool pci_mmb_ready(struct mmio_mailbox *mbox)
    53	{
    54		u64 status;
    55	
  > 56		status = readq(mbox->mbox_ready_addr + PCI_MMB_STATUS_OFFSET);
    57	
    58		return !!(status & PCI_MMB_STATUS_READY);
    59	}
    60	
    61	static int pci_mmb_wait_for_doorbell(struct mmio_mailbox *mbox)
    62	{
    63		const unsigned long start = jiffies;
    64		struct device *dev = mbox->dev;
    65		unsigned long end = start;
    66	
    67		while (mmb_doorbell_busy(mbox)) {
    68			end = jiffies;
    69	
    70			if (time_after(end, start + PCI_MMB_TIMEOUT_MS)) {
    71				/* Check again in case preempted before timeout test */
    72				if (!mmb_doorbell_busy(mbox))
    73					break;
    74				return -ETIMEDOUT;
    75			}
    76			cpu_relax();
    77		}
    78	
    79		dev_dbg(dev, "Doorbell wait took %dms",
    80			jiffies_to_msecs(end) - jiffies_to_msecs(start));
    81		return 0;
    82	}
    83	
    84	static int mmb_send_prep(struct mmio_mailbox *mbox, struct mmio_mbox_cmd *cmd)
    85	{
    86		if (!mbox->ops || !mbox->ops->cmd_prep)
    87			return -EOPNOTSUPP;
    88	
    89		return mbox->ops->cmd_prep(mbox, cmd);
    90	}
    91	
    92	static int mmb_send_done(struct mmio_mailbox *mbox, struct mmio_mbox_cmd *cmd)
    93	{
    94		if (!mbox->ops || !mbox->ops->cmd_done)
    95			return -EOPNOTSUPP;
    96	
    97		return mbox->ops->cmd_done(mbox, cmd);
    98	}
    99	
   100	static int mmb_ready(struct mmio_mailbox *mbox)
   101	{
   102		if (!mbox->ops || !mbox->ops->mbox_ready)
   103			return -EOPNOTSUPP;
   104	
   105		return mbox->ops->mbox_ready(mbox);
   106	}
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
   132	{
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
 > 180		writeq(cmd_reg, mbox->mbox_ctrl_addr + PCI_MMB_CMD_OFFSET);
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
