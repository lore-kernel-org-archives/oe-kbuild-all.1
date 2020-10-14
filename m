Content-Type: multipart/mixed; boundary="===============3136876097364107469=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] i2c: designware: fix slave omitted IC_INTR_STOP_DET
Date: Wed, 14 Oct 2020 15:39:51 +0800
Message-ID: <202010141551.Y4x2qiN1-lkp@intel.com>
In-Reply-To: <20201014052532.3298-1-michael.wu@vatics.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3136876097364107469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Michael,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on v5.9 next-20201013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Wu/i2c-designware-=
fix-slave-omitted-IC_INTR_STOP_DET/20201014-132759
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/f=
or-next
config: riscv-randconfig-r036-20201014 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project e7fe3c=
6dfede8d5781bd000741c3dea7088307a4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/6bb28b0fda0a3f133918077bb=
fb1c6fe4809bf30
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Wu/i2c-designware-fix-slav=
e-omitted-IC_INTR_STOP_DET/20201014-132759
        git checkout 6bb28b0fda0a3f133918077bbfb1c6fe4809bf30
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:564:9: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return inw(addr);
                  ^~~~~~~~~
   arch/riscv/include/asm/io.h:55:76: note: expanded from macro 'inw'
   #define inw(c)          ({ u16 __v; __io_pbr(); __v =3D readw_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:88:76: note: expanded from macro 'readw_cp=
u'
   #define readw_cpu(c)            ({ u16 __r =3D le16_to_cpu((__force __le=
16)__raw_readw(c)); __r; })
                                                                           =
             ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from =
macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/i2c/busses/i2c-designware-slave.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:572:9: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return inl(addr);
                  ^~~~~~~~~
   arch/riscv/include/asm/io.h:56:76: note: expanded from macro 'inl'
   #define inl(c)          ({ u32 __v; __io_pbr(); __v =3D readl_cpu((void*=
)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           =
~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:89:76: note: expanded from macro 'readl_cp=
u'
   #define readl_cpu(c)            ({ u32 __r =3D le32_to_cpu((__force __le=
32)__raw_readl(c)); __r; })
                                                                           =
             ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from =
macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/i2c/busses/i2c-designware-slave.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:580:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outb(value, addr);
           ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:58:68: note: expanded from macro 'outb'
   #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:91:52: note: expanded from macro 'writeb_c=
pu'
   #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
                                                             ^
   In file included from drivers/i2c/busses/i2c-designware-slave.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:588:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outw(value, addr);
           ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:59:68: note: expanded from macro 'outw'
   #define outw(v,c)       ({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:92:76: note: expanded from macro 'writew_c=
pu'
   #define writew_cpu(v, c)        ((void)__raw_writew((__force u16)cpu_to_=
le16(v), (c)))
                                                                           =
          ^
   In file included from drivers/i2c/busses/i2c-designware-slave.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:596:2: warning: performing pointer arithmetic o=
n a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outl(value, addr);
           ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:60:68: note: expanded from macro 'outl'
   #define outl(v,c)       ({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBASE=
 + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~=
 ^
   arch/riscv/include/asm/mmio.h:93:76: note: expanded from macro 'writel_c=
pu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_=
le32(v), (c)))
                                                                           =
          ^
   In file included from drivers/i2c/busses/i2c-designware-slave.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1017:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/i2c/busses/i2c-designware-slave.c:181:42: error: expected ';' af=
ter expression
                           dev->status =3D STATUS_WRITE_IN_PROGRESS
                                                                 ^
                                                                 ;
>> drivers/i2c/busses/i2c-designware-slave.c:195:22: error: use of undeclar=
ed identifier 'STATUS_IDEL'
                   if (dev->status !=3D STATUS_IDEL) {
                                      ^
   7 warnings and 2 errors generated.

vim +181 drivers/i2c/busses/i2c-designware-slave.c

   151	=

   152	/*
   153	 * Interrupt service routine. This gets called whenever an I2C slave=
 interrupt
   154	 * occurs.
   155	 */
   156	=

   157	static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
   158	{
   159		u32 raw_stat, stat, enabled, tmp;
   160		u8 val =3D 0, slave_activity;
   161	=

   162		regmap_read(dev->map, DW_IC_ENABLE, &enabled);
   163		regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &raw_stat);
   164		regmap_read(dev->map, DW_IC_STATUS, &tmp);
   165		slave_activity =3D ((tmp & DW_IC_STATUS_SLAVE_ACTIVITY) >> 6);
   166	=

   167		if (!enabled || !(raw_stat & ~DW_IC_INTR_ACTIVITY) || !dev->slave)
   168			return 0;
   169	=

   170		stat =3D i2c_dw_read_clear_intrbits_slave(dev);
   171		dev_dbg(dev->dev,
   172			"%#x STATUS SLAVE_ACTIVITY=3D%#x : RAW_INTR_STAT=3D%#x : INTR_STAT=
=3D%#x\n",
   173			enabled, slave_activity, raw_stat, stat);
   174	=

   175		if (stat & DW_IC_INTR_RX_FULL) {
   176			if (dev->status !=3D STATUS_WRITE_IN_PROGRESS) {
   177				if (dev->status !=3D STATUS_IDLE)
   178					i2c_slave_event(dev->slave, I2C_SLAVE_STOP,
   179							&val);
   180	=

 > 181				dev->status =3D STATUS_WRITE_IN_PROGRESS
   182				i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED,
   183						&val);
   184			}
   185	=

   186			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
   187			val =3D tmp;
   188	=

   189			if (!i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
   190					     &val))
   191				dev_vdbg(dev->dev, "Byte %X acked!", val);
   192		}
   193	=

   194		if (stat & DW_IC_INTR_RD_REQ) {
 > 195			if (dev->status !=3D STATUS_IDEL) {
   196				dev->status =3D STATUS_IDLE;
   197				i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
   198			}
   199	=

   200			if (slave_activity) {
   201				regmap_read(dev->map, DW_IC_CLR_RD_REQ, &tmp);
   202				regmap_read(dev->map, DW_IC_CLR_RX_UNDER, &tmp);
   203	=

   204				dev->status =3D STATUS_READ_IN_PROGRESS;
   205				i2c_slave_event(dev->slave, I2C_SLAVE_READ_REQUESTED,
   206						&val);
   207				regmap_write(dev->map, DW_IC_DATA_CMD, val);
   208			}
   209		}
   210	=

   211		if (stat & DW_IC_INTR_RX_DONE) {
   212			i2c_slave_event(dev->slave, I2C_SLAVE_READ_PROCESSED, &val);
   213			regmap_read(dev->map, DW_IC_CLR_RX_DONE, &tmp);
   214	=

   215			dev->status =3D STATUS_IDLE;
   216			i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
   217		}
   218	=

   219		if (stat & DW_IC_INTR_STOP_DET) {
   220			if (dev->status !=3D STATUS_IDLE) {
   221				dev->status =3D STATUS_IDLE;
   222	=

   223				i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
   224			}
   225		}
   226	=

   227		return 1;
   228	}
   229	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3136876097364107469==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
ZeJ/bGXKMmmYAQA=
--===============3136876097364107469==--

