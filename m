Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2DD450D9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 23:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cp0fWF2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697759077; x=1729295077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FI7/i+hUGA4wnGSKjXuSotmFKv24eoBkB67qIDv2jkM=;
  b=Cp0fWF2KURIBNcmkO7jKkIbZqLGK+oZwqtsE4t788LxHKU3ZMF3seMGl
   JdjXf4UqiMG+JRaI2630XftknXBr88AW+w7/OxH4cRIKZY+pN5rZs+UHT
   mDkPtRF2+FUNd37E/9SqYpnqngNEIweBbWmDxhHcnFv7YvixQTT5kAq0X
   t1Uqp1v6+kZIiD8+yKYax5i39eysGtI90AlskzvkMWqchgGsoucM3a94T
   xa2HXSFYcz3qzi8ilayymMEiGFvwA9qhlKCAZOr++QejdQqcXIQGoipzP
   foWd6adbYJWPTLMeOM3kXhGWO65hZLEBY069DjqY5ki8Bb8//HGndS+ve
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="390276313"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="390276313"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 16:44:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="757250416"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="757250416"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Oct 2023 16:44:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtcgq-0002ii-3A;
	Thu, 19 Oct 2023 23:44:32 +0000
Date: Fri, 20 Oct 2023 07:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/010-soc 5/14] drivers/soc/apple/mailbox.c:151:24:
 error: implicit declaration of function 'FIELD_PREP'
Message-ID: <202310200739.MecFsbcj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hector,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/010-soc
head:   abc064b291ae70bd89dd4b95a587bd87c8b86585
commit: b7bac953131b5769237f66dd4eec916a2b486c05 [5/14] soc: apple: mailbox: Add ASC/M3 mailbox driver
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20231020/202310200739.MecFsbcj-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200739.MecFsbcj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200739.MecFsbcj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/byteorder/little_endian.h:5,
                    from arch/riscv/include/uapi/asm/byteorder.h:10,
                    from include/asm-generic/qrwlock_types.h:6,
                    from ./arch/riscv/include/generated/asm/qrwlock_types.h:1,
                    from include/asm-generic/spinlock_types.h:13,
                    from ./arch/riscv/include/generated/asm/spinlock_types.h:1,
                    from include/linux/spinlock_types_raw.h:7,
                    from include/linux/ratelimit_types.h:7,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from include/linux/delay.h:23,
                    from drivers/soc/apple/mailbox.c:19:
   drivers/soc/apple/mailbox.c: In function 'apple_mbox_send':
>> drivers/soc/apple/mailbox.c:151:24: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     151 |         writeq_relaxed(FIELD_PREP(APPLE_MBOX_MSG1_MSG, msg.msg1),
         |                        ^~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:32:51: note: in definition of macro '__cpu_to_le64'
      32 | #define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
         |                                                   ^
   arch/riscv/include/asm/mmio.h:124:48: note: in expansion of macro 'writeq_cpu'
     124 | #define writeq_relaxed(v, c)    ({ __io_rbw(); writeq_cpu((v), (c)); __io_raw(); })
         |                                                ^~~~~~~~~~
   drivers/soc/apple/mailbox.c:151:9: note: in expansion of macro 'writeq_relaxed'
     151 |         writeq_relaxed(FIELD_PREP(APPLE_MBOX_MSG1_MSG, msg.msg1),
         |         ^~~~~~~~~~~~~~
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
https://github.com/intel/lkp-tests/wiki
