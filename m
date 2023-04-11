Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA15B2F29
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 11:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681213390; x=1712749390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JGwICpiwsZxY0u7hYLmkCFiOK42Rmya145yeoz6z0jY=;
  b=B91j9SaKzaZkwQFjJEx2zYuC2sE05qndEgAZndcRYCEV5nOw1CM03/AD
   6m8eUEk9S9keiJGE8i8f3hKTaGJBNfv0BM/16fowo9DM9bdGzc0ojQg0R
   KVcXpSnPsCKSxqdCoNOFh5M6FvnoBfBfLTWOo/6U2fi+1qPGfEksjWJ9X
   RUwPiJD1vSt2U7YC9FjULQ9V22IDcX8aM39L4EvNcLp7QWp3EJ3w1uGpa
   LNGTN6plvf0OeIVHEBFSwXEFHRIaHs2n230FgmpDHgeKcBRKHEFSt52Xh
   vEz/+ceZCG7m/ka2eHOhOx4iU8dAqfoEGme5XffyTov2WCAOhezL9LIVL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="371444155"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="371444155"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 04:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="1018343316"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="1018343316"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2023 04:43:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmCOy-000WGL-0z;
	Tue, 11 Apr 2023 11:43:08 +0000
Date: Tue, 11 Apr 2023 19:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/010-mailbox 6/9]
 drivers/soc/apple/mailbox.c:151:24: error: implicit declaration of function
 'FIELD_PREP'
Message-ID: <202304111943.BsrtqiYd-lkp@intel.com>
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
commit: f12ad5bcc39cdba3b1bf9f0e395226ef3226d4a0 [6/9] soc: apple: mailbox: Add ASC/M3 mailbox driver
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230411/202304111943.BsrtqiYd-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/f12ad5bcc39cdba3b1bf9f0e395226ef3226d4a0
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/010-mailbox
        git checkout f12ad5bcc39cdba3b1bf9f0e395226ef3226d4a0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/soc/apple/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304111943.BsrtqiYd-lkp@intel.com/

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

  > 19	#include <linux/delay.h>
    20	#include <linux/device.h>
    21	#include <linux/interrupt.h>
    22	#include <linux/io.h>
    23	#include <linux/iopoll.h>
    24	#include <linux/module.h>
    25	#include <linux/of.h>
    26	#include <linux/of_platform.h>
    27	#include <linux/pm_runtime.h>
    28	#include <linux/spinlock.h>
    29	#include <linux/types.h>
    30	#include "mailbox.h"
    31	
    32	#define APPLE_ASC_MBOX_CONTROL_FULL BIT(16)
    33	#define APPLE_ASC_MBOX_CONTROL_EMPTY BIT(17)
    34	
    35	#define APPLE_ASC_MBOX_A2I_CONTROL 0x110
    36	#define APPLE_ASC_MBOX_A2I_SEND0 0x800
    37	#define APPLE_ASC_MBOX_A2I_SEND1 0x808
    38	#define APPLE_ASC_MBOX_A2I_RECV0 0x810
    39	#define APPLE_ASC_MBOX_A2I_RECV1 0x818
    40	
    41	#define APPLE_ASC_MBOX_I2A_CONTROL 0x114
    42	#define APPLE_ASC_MBOX_I2A_SEND0 0x820
    43	#define APPLE_ASC_MBOX_I2A_SEND1 0x828
    44	#define APPLE_ASC_MBOX_I2A_RECV0 0x830
    45	#define APPLE_ASC_MBOX_I2A_RECV1 0x838
    46	
    47	#define APPLE_M3_MBOX_CONTROL_FULL BIT(16)
    48	#define APPLE_M3_MBOX_CONTROL_EMPTY BIT(17)
    49	
    50	#define APPLE_M3_MBOX_A2I_CONTROL 0x50
    51	#define APPLE_M3_MBOX_A2I_SEND0 0x60
    52	#define APPLE_M3_MBOX_A2I_SEND1 0x68
    53	#define APPLE_M3_MBOX_A2I_RECV0 0x70
    54	#define APPLE_M3_MBOX_A2I_RECV1 0x78
    55	
    56	#define APPLE_M3_MBOX_I2A_CONTROL 0x80
    57	#define APPLE_M3_MBOX_I2A_SEND0 0x90
    58	#define APPLE_M3_MBOX_I2A_SEND1 0x98
    59	#define APPLE_M3_MBOX_I2A_RECV0 0xa0
    60	#define APPLE_M3_MBOX_I2A_RECV1 0xa8
    61	
    62	#define APPLE_M3_MBOX_IRQ_ENABLE 0x48
    63	#define APPLE_M3_MBOX_IRQ_ACK 0x4c
    64	#define APPLE_M3_MBOX_IRQ_A2I_EMPTY BIT(0)
    65	#define APPLE_M3_MBOX_IRQ_A2I_NOT_EMPTY BIT(1)
    66	#define APPLE_M3_MBOX_IRQ_I2A_EMPTY BIT(2)
    67	#define APPLE_M3_MBOX_IRQ_I2A_NOT_EMPTY BIT(3)
    68	
    69	#define APPLE_MBOX_MSG1_OUTCNT GENMASK(56, 52)
    70	#define APPLE_MBOX_MSG1_INCNT GENMASK(51, 48)
    71	#define APPLE_MBOX_MSG1_OUTPTR GENMASK(47, 44)
    72	#define APPLE_MBOX_MSG1_INPTR GENMASK(43, 40)
    73	#define APPLE_MBOX_MSG1_MSG GENMASK(31, 0)
    74	
    75	#define APPLE_MBOX_TX_TIMEOUT 500
    76	
    77	struct apple_mbox_hw {
    78		unsigned int control_full;
    79		unsigned int control_empty;
    80	
    81		unsigned int a2i_control;
    82		unsigned int a2i_send0;
    83		unsigned int a2i_send1;
    84	
    85		unsigned int i2a_control;
    86		unsigned int i2a_recv0;
    87		unsigned int i2a_recv1;
    88	
    89		bool has_irq_controls;
    90		unsigned int irq_enable;
    91		unsigned int irq_ack;
    92		unsigned int irq_bit_recv_not_empty;
    93		unsigned int irq_bit_send_empty;
    94	};
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
