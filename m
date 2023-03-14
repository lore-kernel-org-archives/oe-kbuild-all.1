Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED6A3C34
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Mar 2023 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678800098; x=1710336098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gmUhkUEuh94b0I7rWj2cvhvzNWDyOVOtMwT9PG0NwTw=;
  b=AYKMPDseYWirgfGQi80LB9hHgqNtBeV4DIeMu+8H4lWwlY4L3jdV9I9P
   00rkydX1Hy35b0Qc6ciBVB2o+IIV5pF0RHrUL2iMO7ym1MZPuLOiU6y9T
   QwBTbHqJSGbBEVNj6JZ6ROcRsC2ZZOUQFpNome68M5VFeFRQcw+o1dy9d
   wQo8evtsQ5dEIEhonq5Raxy3+cbgfURwzIPLAmtiR713Q20wC2/MU9zSU
   f0LUErp8h/aUN6Oab/IO/BqMzeiyX7noyruP8eekd3rX7/kkqarMIKoIy
   HcEYc774IE1EGgSlh6+XyURUqTuMco/ZkvROGPx8TX/YlvFYcD+RCVKwT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317809869"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="317809869"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 06:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="743311553"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="743311553"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Mar 2023 06:21:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc4au-0006vo-0M;
	Tue, 14 Mar 2023 13:21:36 +0000
Date: Tue, 14 Mar 2023 21:20:43 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/010-mailbox 6/10]
 drivers/soc/apple/mailbox.c:153:24: error: implicit declaration of function
 'FIELD_PREP'
Message-ID: <202303142108.NTHN5CyI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/010-mailbox
head:   6c4ce154f77d8de759ffc90c817b68191a010c18
commit: 5e830b6644fd5f5b8cef306b8754842af5b5c316 [6/10] soc: apple: mailbox: Add ASC/M3 mailbox driver
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230314/202303142108.NTHN5CyI-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/5e830b6644fd5f5b8cef306b8754842af5b5c316
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/010-mailbox
        git checkout 5e830b6644fd5f5b8cef306b8754842af5b5c316
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/soc/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303142108.NTHN5CyI-lkp@intel.com/

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
>> drivers/soc/apple/mailbox.c:153:24: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     153 |         writeq_relaxed(FIELD_PREP(APPLE_MBOX_MSG1_MSG, msg.msg1),
         |                        ^~~~~~~~~~
   include/uapi/linux/byteorder/little_endian.h:32:51: note: in definition of macro '__cpu_to_le64'
      32 | #define __cpu_to_le64(x) ((__force __le64)(__u64)(x))
         |                                                   ^
   arch/riscv/include/asm/mmio.h:124:48: note: in expansion of macro 'writeq_cpu'
     124 | #define writeq_relaxed(v, c)    ({ __io_rbw(); writeq_cpu((v), (c)); __io_raw(); })
         |                                                ^~~~~~~~~~
   drivers/soc/apple/mailbox.c:153:9: note: in expansion of macro 'writeq_relaxed'
     153 |         writeq_relaxed(FIELD_PREP(APPLE_MBOX_MSG1_MSG, msg.msg1),
         |         ^~~~~~~~~~~~~~
   drivers/soc/apple/mailbox.c: In function 'apple_mbox_poll_locked':
>> drivers/soc/apple/mailbox.c:190:28: error: implicit declaration of function 'FIELD_GET'; did you mean 'FOLL_GET'? [-Werror=implicit-function-declaration]
     190 |                 msg.msg1 = FIELD_GET(
         |                            ^~~~~~~~~
         |                            FOLL_GET
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +153 drivers/soc/apple/mailbox.c

    97	
    98	int apple_mbox_send(struct apple_mbox *mbox, const struct apple_mbox_msg msg,
    99			    bool atomic)
   100	{
   101		unsigned long flags;
   102		int ret;
   103		u32 mbox_ctrl;
   104		long t;
   105	
   106		spin_lock_irqsave(&mbox->tx_lock, flags);
   107		mbox_ctrl = readl_relaxed(mbox->regs + mbox->hw->a2i_control);
   108	
   109		while (mbox_ctrl & mbox->hw->control_full) {
   110			if (atomic) {
   111				ret = readl_poll_timeout_atomic(
   112					mbox->regs + mbox->hw->a2i_control, mbox_ctrl,
   113					!(mbox_ctrl & mbox->hw->control_full), 100,
   114					APPLE_MBOX_TX_TIMEOUT * 1000);
   115	
   116				if (ret) {
   117					spin_unlock_irqrestore(&mbox->tx_lock, flags);
   118					return ret;
   119				}
   120	
   121				break;
   122			}
   123			/*
   124			 * The interrupt is level triggered and will keep firing as long as the
   125			 * FIFO is empty. It will also keep firing if the FIFO was empty
   126			 * at any point in the past until it has been acknowledged at the
   127			 * mailbox level. By acknowledging it here we can ensure that we will
   128			 * only get the interrupt once the FIFO has been cleared again.
   129			 * If the FIFO is already empty before the ack it will fire again
   130			 * immediately after the ack.
   131			 */
   132			if (mbox->hw->has_irq_controls) {
   133				writel_relaxed(mbox->hw->irq_bit_send_empty,
   134					       mbox->regs + mbox->hw->irq_ack);
   135			}
   136			enable_irq(mbox->irq_send_empty);
   137			reinit_completion(&mbox->tx_empty);
   138			spin_unlock_irqrestore(&mbox->tx_lock, flags);
   139	
   140			t = wait_for_completion_interruptible_timeout(
   141				&mbox->tx_empty,
   142				msecs_to_jiffies(APPLE_MBOX_TX_TIMEOUT));
   143			if (t < 0)
   144				return t;
   145			else if (t == 0)
   146				return -ETIMEDOUT;
   147	
   148			spin_lock_irqsave(&mbox->tx_lock, flags);
   149			mbox_ctrl = readl_relaxed(mbox->regs + mbox->hw->a2i_control);
   150		}
   151	
   152		writeq_relaxed(msg.msg0, mbox->regs + mbox->hw->a2i_send0);
 > 153		writeq_relaxed(FIELD_PREP(APPLE_MBOX_MSG1_MSG, msg.msg1),
   154			       mbox->regs + mbox->hw->a2i_send1);
   155	
   156		spin_unlock_irqrestore(&mbox->tx_lock, flags);
   157	
   158		return 0;
   159	}
   160	EXPORT_SYMBOL(apple_mbox_send);
   161	
   162	static irqreturn_t apple_mbox_send_empty_irq(int irq, void *data)
   163	{
   164		struct apple_mbox *mbox = data;
   165	
   166		/*
   167		 * We don't need to acknowledge the interrupt at the mailbox level
   168		 * here even if supported by the hardware. It will keep firing but that
   169		 * doesn't matter since it's disabled at the main interrupt controller.
   170		 * apple_mbox_send will acknowledge it before enabling
   171		 * it at the main controller again.
   172		 */
   173		spin_lock(&mbox->tx_lock);
   174		disable_irq_nosync(mbox->irq_send_empty);
   175		complete(&mbox->tx_empty);
   176		spin_unlock(&mbox->tx_lock);
   177	
   178		return IRQ_HANDLED;
   179	}
   180	
   181	static int apple_mbox_poll_locked(struct apple_mbox *mbox)
   182	{
   183		struct apple_mbox_msg msg;
   184		int ret = 0;
   185	
   186		u32 mbox_ctrl = readl_relaxed(mbox->regs + mbox->hw->i2a_control);
   187	
   188		while (!(mbox_ctrl & mbox->hw->control_empty)) {
   189			msg.msg0 = readq_relaxed(mbox->regs + mbox->hw->i2a_recv0);
 > 190			msg.msg1 = FIELD_GET(
   191				APPLE_MBOX_MSG1_MSG,
   192				readq_relaxed(mbox->regs + mbox->hw->i2a_recv1));
   193	
   194			mbox->rx(mbox, msg);
   195			ret++;
   196			mbox_ctrl = readl_relaxed(mbox->regs + mbox->hw->i2a_control);
   197		}
   198	
   199		/*
   200		 * The interrupt will keep firing even if there are no more messages
   201		 * unless we also acknowledge it at the mailbox level here.
   202		 * There's no race if a message comes in between the check in the while
   203		 * loop above and the ack below: If a new messages arrives inbetween
   204		 * those two the interrupt will just fire again immediately after the
   205		 * ack since it's level triggered.
   206		 */
   207		if (mbox->hw->has_irq_controls) {
   208			writel_relaxed(mbox->hw->irq_bit_recv_not_empty,
   209				       mbox->regs + mbox->hw->irq_ack);
   210		}
   211	
   212		return ret;
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
