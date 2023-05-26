Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00FE539E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 May 2023 06:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685084304; x=1716620304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TCf9vjz7vV7bjlgpFW7q3w02As/OkY37gs1HvnADJbw=;
  b=fLNgRshAn2TRuzu88CJqPobzpc9HH0cFbdi5NvbqVkjrUS8L44Ts7PBt
   BGSJBeHoAYeV5xuLcX51iW6hK59seEhQndjJ0CSHmkxnWy+UwzSeeyIm+
   b4SEiBg/3dx/MUi93tyAC3QYM90OYEoC4qPVZ+WjH0wdgrdZcNIsNzEyh
   2JMgt6JIGXvpwbaLmGIQuG+GgMioa0LYjKLZaUX7HVChJle9cD6fa3O5B
   qhGJ9hjDBr8YeIt6N+JrDexKp12deKxLsXgIwnHb+b3K63HKPZ/+l3TY0
   RMsLLGQakUu0E4sTdHKJ3n1ji23wXood8nwsNXlxD/wtF2WslNLOdatDt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="356517651"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="356517651"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 23:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="699331580"
X-IronPort-AV: E=Sophos;i="6.00,193,1681196400"; 
   d="scan'208";a="699331580"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 25 May 2023 23:58:22 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2RP3-000J7v-1E;
	Fri, 26 May 2023 06:58:21 +0000
Date: Fri, 26 May 2023 14:58:19 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-1.0.x-imx 2913/9879]
 drivers/i2c/busses/i2c-flexio.c:411:3: warning: unannotated fall-through
 between switch labels
Message-ID: <202305261422.JI3uPKC0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-1.0.x-imx
head:   ad9ab3b3c553cbc3c61f233b6e2cd5abdd2a624b
commit: d4d36c666967d7e4e67cc18b770f2ffac6a00782 [2913/9879] LF-4133-1 i2c: imx: flexio: Add FlexIO i2c master support
config: hexagon-randconfig-r041-20230524 (https://download.01.org/0day-ci/archive/20230526/202305261422.JI3uPKC0-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/d4d36c666967d7e4e67cc18b770f2ffac6a00782
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc 6.1-1.0.x-imx
        git checkout d4d36c666967d7e4e67cc18b770f2ffac6a00782
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/i2c/busses/ drivers/mailbox/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305261422.JI3uPKC0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-flexio.c:12:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/i2c/busses/i2c-flexio.c:12:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/i2c/busses/i2c-flexio.c:12:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/i2c/busses/i2c-flexio.c:411:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
                   default:
                   ^
   drivers/i2c/busses/i2c-flexio.c:411:3: note: insert 'break;' to avoid fall-through
                   default:
                   ^
                   break; 
   7 warnings generated.


vim +411 drivers/i2c/busses/i2c-flexio.c

   358	
   359	static irqreturn_t imx_flexio_i2c_isr(int irq, void *dev_id)
   360	{
   361		struct imx_flexio_i2c_master_dev *i2c_dev = dev_id;
   362		void __iomem *base = i2c_dev->base;
   363		void __iomem *pinstat = i2c_dev->base + PINSTAT;
   364		u32 shiftstat, ack, val, ctl;
   365	
   366		shiftstat = flexio_readl(base, SHIFTSTAT);
   367	
   368		if (shiftstat & TRANSMIT_STAT) {
   369			switch (i2c_dev->state) {
   370			case START_ADDRESS_WRITE:
   371				flexio_writel(base, i2c_dev->slave_addr, SHIFTBUFBBS_0);
   372	
   373				if (i2c_dev->len > 0)
   374					i2c_dev->state = WRITE_DATA;
   375				else
   376					i2c_dev->state = WRITE_END;
   377				break;
   378			case WRITE_DATA:
   379				flexio_writel(base, *i2c_dev->data, SHIFTBUFBBS_0);
   380				i2c_dev->data++;
   381				i2c_dev->len--;
   382	
   383				if (!i2c_dev->len)
   384					i2c_dev->state = WRITE_END;
   385				break;
   386			case WRITE_END:
   387				if (i2c_dev->repeated_start)
   388					flexio_writel(base, 0xff, SHIFTBUFBBS_0);
   389	
   390				i2c_dev->stop = LAST_8_BIT;
   391				break;
   392			case START_ADDRESS_READ:
   393				flexio_writel(base, i2c_dev->slave_addr, SHIFTBUFBBS_0);
   394	
   395				if (i2c_dev->len > 1)
   396					i2c_dev->state = READ_NOT_LAST_DATA;
   397				else if (i2c_dev->len == 1)
   398					i2c_dev->state = READ_LAST_DATA;
   399				else if (i2c_dev->len == 0)
   400					i2c_dev->state = READ_END;
   401				break;
   402			case READ_NOT_LAST_DATA:
   403				flexio_writel(base, 0xff, SHIFTBUFBBS_0);
   404				break;
   405			case READ_LAST_DATA:
   406				i2c_master_enable_ack(i2c_dev, false);
   407				flexio_writel(base, 0xff, SHIFTBUFBBS_0);
   408				break;
   409			case READ_END:
   410				i2c_dev->stop = LAST_8_BIT;
 > 411			default:
   412				break;
   413			}
   414		}
   415	
   416		if (shiftstat & RECEIVE_STAT) {
   417			if (i2c_dev->need_check_ack) {
   418				ack = flexio_readl(base, SHIFTERR) & 2;
   419				if (!ack) {
   420					if (i2c_dev->stop == LAST_8_BIT) {
   421						flexio_writel(base, 0, SHIFTSIEN);
   422						complete(&i2c_dev->complete);
   423					}
   424	
   425					if (i2c_dev->read) {
   426						i2c_dev->need_check_ack = false;
   427						i2c_dev->read = false;
   428						flexio_readl(base, SHIFTBUFBIS_1);
   429	
   430						switch (i2c_dev->state) {
   431						case READ_NOT_LAST_DATA:
   432							i2c_master_enable_ack(i2c_dev, true);
   433							break;
   434						case READ_LAST_DATA:
   435							i2c_master_enable_ack(i2c_dev, false);
   436							i2c_dev->state = READ_END;
   437							break;
   438						case READ_END:
   439						default:
   440							flexio_writel(base, 0, SHIFTSIEN);
   441							complete(&i2c_dev->complete);
   442							break;
   443						}
   444					}
   445				} else {
   446					flexio_writel(base, 0, SHIFTSIEN);
   447					i2c_dev->nack = true;
   448	
   449					switch (i2c_dev->stop) {
   450					case NOT_LAST_8_BIT:
   451						goto stop;
   452					case LAST_8_BIT:
   453						flexio_writel(base, 0, SHIFTBUFBBS_0);
   454						complete(&i2c_dev->complete);
   455						break;
   456					default:
   457						complete(&i2c_dev->complete);
   458						break;
   459					}
   460				}
   461	
   462				flexio_readl(base, SHIFTBUFBIS_1);
   463			} else {
   464				*i2c_dev->data = flexio_readl(base, SHIFTBUFBIS_1);
   465				i2c_dev->data++;
   466				i2c_dev->len--;
   467	
   468				if (i2c_dev->len == 1)
   469					i2c_dev->state = READ_LAST_DATA;
   470				else if (i2c_dev->len == 0) {
   471					flexio_writel(base, 0, SHIFTBUFBBS_0);
   472	
   473					flexio_writel(base, 0, SHIFTSIEN);
   474					complete(&i2c_dev->complete);
   475				}
   476			}
   477		}
   478	
   479		return IRQ_HANDLED;
   480	
   481	stop:
   482		/* generate STOP */
   483		flexio_writel(base, 0, SHIFTBUFBBS_0);
   484	
   485		/*
   486		 * Software should then wait for the next rising edge on SCL and then
   487		 * disable both timers.
   488		 */
   489		flexio_writel(base, 1 << i2c_dev->scl_pin, PINREN);
   490		readl_relaxed_poll_timeout(pinstat, val, val & (1 << i2c_dev->scl_pin), 0, 1000);
   491	
   492		ctl = flexio_readl(base, TIMCTL_0);
   493		ctl &= ~TIMCTL_TIMOD_MASK;
   494		ctl |= TIMCTL_TIMOD(TIMER_DISABLE);
   495		flexio_writel(base, ctl, TIMCTL_0);
   496	
   497		ctl = flexio_readl(base, TIMCTL_1);
   498		ctl &= ~TIMCTL_TIMOD_MASK;
   499		ctl |= TIMCTL_TIMOD(TIMER_DISABLE);
   500		flexio_writel(base, ctl, TIMCTL_1);
   501	
   502		/*
   503		 * The transmit shifter should then be disabled after waiting the setup
   504		 * delay for a repeated START or STOP condition.
   505		 */
   506		udelay(10);
   507		ctl = flexio_readl(base, SHIFTCTL_0);
   508		ctl &= ~SHIFTCTL_PINCFG_MASK;
   509		ctl |= SHIFTCTL_PINCFG(SHIFTER_PIN_OUTPUT_DISABLE);
   510		ctl &= ~SHIFTCTL_SMOD_MASK;
   511		ctl |= SHIFTCTL_SMOD(SHIFTER_DISABLE);
   512		flexio_writel(base, ctl, SHIFTCTL_0);
   513	
   514		flexio_writel(base, 0, PINREN);
   515		flexio_writel(base, 1 << i2c_dev->scl_pin, PINSTAT);
   516	
   517		complete(&i2c_dev->complete);
   518	
   519		return IRQ_HANDLED;
   520	}
   521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
