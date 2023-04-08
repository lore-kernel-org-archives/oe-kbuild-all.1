Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A5FC2ED
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Apr 2023 09:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680945464; x=1712481464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WnoPyAsNrwxIm2c5LPePy+LwhcAQ4DSb1TUhlMpZDOw=;
  b=V5Eeg1DSqTX1GMw3k5D83JXTWwkP+iTe3TNoi5GhUl9DiUofz42vHcA6
   HvXNNTGfpbCT32r/vdaXvjn+Ec/E+OBCw/OXCZjLqPVek0gxOXfBsTdW0
   QqP3jylXwlY8ui46/tVIC60KFikszGofoQiewDWvP6v6z7TporbOlOKBT
   JeZFIH4378o6EWQlpT7bk1zmsuYXLv1BgRKqR5V//K4Fzoy55CP7zb3/A
   yzhbw2I4FIVN9CarguU2+/yMRFAYAAVk3csh0Ayfd8EiQNOAx4lSc0hGA
   gKMBsJN85c77Gx8XiaFCmMfsXC8lW4pUE5sM3DCD699gs1tPtPdCDm1Z2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="405951342"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="405951342"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 02:17:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="690272176"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="690272176"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 08 Apr 2023 02:17:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl4hZ-000TaL-2w;
	Sat, 08 Apr 2023 09:17:41 +0000
Date: Sat, 8 Apr 2023 17:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/010-mailbox 6/10]
 drivers/soc/apple/mailbox.c:151:24: error: implicit declaration of function
 'FIELD_PREP'
Message-ID: <202304081747.gOkMzhWB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/010-mailbox
head:   4cadfe6eccffb8a2972ee06381d3eb82702daec6
commit: fd4e8ef7e986e392f40dbdc08837a8e7b0379e84 [6/10] soc: apple: mailbox: Add ASC/M3 mailbox driver
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20230408/202304081747.gOkMzhWB-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/fd4e8ef7e986e392f40dbdc08837a8e7b0379e84
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/010-mailbox
        git checkout fd4e8ef7e986e392f40dbdc08837a8e7b0379e84
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/soc/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081747.gOkMzhWB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/soc/apple/mailbox.c: In function 'apple_mbox_send':
>> drivers/soc/apple/mailbox.c:151:24: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     151 |         writeq_relaxed(FIELD_PREP(APPLE_MBOX_MSG1_MSG, msg.msg1),
         |                        ^~~~~~~~~~
   drivers/soc/apple/mailbox.c: In function 'apple_mbox_poll_locked':
>> drivers/soc/apple/mailbox.c:188:28: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     188 |                 msg.msg1 = FIELD_GET(
         |                            ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +151 drivers/soc/apple/mailbox.c

    95	
    96	int apple_mbox_send(struct apple_mbox *mbox, const struct apple_mbox_msg msg,
    97			    bool atomic)
    98	{
    99		unsigned long flags;
   100		int ret;
   101		u32 mbox_ctrl;
   102		long t;
   103	
   104		spin_lock_irqsave(&mbox->tx_lock, flags);
   105		mbox_ctrl = readl_relaxed(mbox->regs + mbox->hw->a2i_control);
   106	
   107		while (mbox_ctrl & mbox->hw->control_full) {
   108			if (atomic) {
   109				ret = readl_poll_timeout_atomic(
   110					mbox->regs + mbox->hw->a2i_control, mbox_ctrl,
   111					!(mbox_ctrl & mbox->hw->control_full), 100,
   112					APPLE_MBOX_TX_TIMEOUT * 1000);
   113	
   114				if (ret) {
   115					spin_unlock_irqrestore(&mbox->tx_lock, flags);
   116					return ret;
   117				}
   118	
   119				break;
   120			}
   121			/*
   122			 * The interrupt is level triggered and will keep firing as long as the
   123			 * FIFO is empty. It will also keep firing if the FIFO was empty
   124			 * at any point in the past until it has been acknowledged at the
   125			 * mailbox level. By acknowledging it here we can ensure that we will
   126			 * only get the interrupt once the FIFO has been cleared again.
   127			 * If the FIFO is already empty before the ack it will fire again
   128			 * immediately after the ack.
   129			 */
   130			if (mbox->hw->has_irq_controls) {
   131				writel_relaxed(mbox->hw->irq_bit_send_empty,
   132					       mbox->regs + mbox->hw->irq_ack);
   133			}
   134			enable_irq(mbox->irq_send_empty);
   135			reinit_completion(&mbox->tx_empty);
   136			spin_unlock_irqrestore(&mbox->tx_lock, flags);
   137	
   138			t = wait_for_completion_interruptible_timeout(
   139				&mbox->tx_empty,
   140				msecs_to_jiffies(APPLE_MBOX_TX_TIMEOUT));
   141			if (t < 0)
   142				return t;
   143			else if (t == 0)
   144				return -ETIMEDOUT;
   145	
   146			spin_lock_irqsave(&mbox->tx_lock, flags);
   147			mbox_ctrl = readl_relaxed(mbox->regs + mbox->hw->a2i_control);
   148		}
   149	
   150		writeq_relaxed(msg.msg0, mbox->regs + mbox->hw->a2i_send0);
 > 151		writeq_relaxed(FIELD_PREP(APPLE_MBOX_MSG1_MSG, msg.msg1),
   152			       mbox->regs + mbox->hw->a2i_send1);
   153	
   154		spin_unlock_irqrestore(&mbox->tx_lock, flags);
   155	
   156		return 0;
   157	}
   158	EXPORT_SYMBOL(apple_mbox_send);
   159	
   160	static irqreturn_t apple_mbox_send_empty_irq(int irq, void *data)
   161	{
   162		struct apple_mbox *mbox = data;
   163	
   164		/*
   165		 * We don't need to acknowledge the interrupt at the mailbox level
   166		 * here even if supported by the hardware. It will keep firing but that
   167		 * doesn't matter since it's disabled at the main interrupt controller.
   168		 * apple_mbox_send will acknowledge it before enabling
   169		 * it at the main controller again.
   170		 */
   171		spin_lock(&mbox->tx_lock);
   172		disable_irq_nosync(mbox->irq_send_empty);
   173		complete(&mbox->tx_empty);
   174		spin_unlock(&mbox->tx_lock);
   175	
   176		return IRQ_HANDLED;
   177	}
   178	
   179	static int apple_mbox_poll_locked(struct apple_mbox *mbox)
   180	{
   181		struct apple_mbox_msg msg;
   182		int ret = 0;
   183	
   184		u32 mbox_ctrl = readl_relaxed(mbox->regs + mbox->hw->i2a_control);
   185	
   186		while (!(mbox_ctrl & mbox->hw->control_empty)) {
   187			msg.msg0 = readq_relaxed(mbox->regs + mbox->hw->i2a_recv0);
 > 188			msg.msg1 = FIELD_GET(
   189				APPLE_MBOX_MSG1_MSG,
   190				readq_relaxed(mbox->regs + mbox->hw->i2a_recv1));
   191	
   192			mbox->rx(mbox, msg, mbox->cookie);
   193			ret++;
   194			mbox_ctrl = readl_relaxed(mbox->regs + mbox->hw->i2a_control);
   195		}
   196	
   197		/*
   198		 * The interrupt will keep firing even if there are no more messages
   199		 * unless we also acknowledge it at the mailbox level here.
   200		 * There's no race if a message comes in between the check in the while
   201		 * loop above and the ack below: If a new messages arrives inbetween
   202		 * those two the interrupt will just fire again immediately after the
   203		 * ack since it's level triggered.
   204		 */
   205		if (mbox->hw->has_irq_controls) {
   206			writel_relaxed(mbox->hw->irq_bit_recv_not_empty,
   207				       mbox->regs + mbox->hw->irq_ack);
   208		}
   209	
   210		return ret;
   211	}
   212	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
