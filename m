Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECAF13C9CD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Apr 2024 09:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714122046; cv=none; b=CZCFfPKzN5CN7+D+qDY5FpjnQSV+h7q8Ktu/tm/2ABfZY1gXZpWkBkw99xJIJjhymKGcRwdqv+rZKLq5mWpQj/A99n9xGf0Dba648VHDtKECOaRgrHTaYEZgD4H0Fv93kamhVvlIgiq3wJRA09MymN8RCua7jf1VOJkav3zDMuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714122046; c=relaxed/simple;
	bh=WQN6BdPG7TCHDThlHbHb3aC2n1yiWB4XZ6ytC3SdN5I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X92HfllaIKcnVDtdORLSLdjpLwLmxa0DPpfgFFgRLGwBcb4/50lZNwu9BooU4lYsqtSQkYgMYKIxyIJBjfXZwZm//jeZ+l/GejXzUuEf+olYJkrLB8PJ2kfTDCmdYEkqwPq2Su8Bzoa/8lg6PqiCwpzvK/8sl7OcPy8RYCoARkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQ6KnG61; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQ6KnG61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714122044; x=1745658044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WQN6BdPG7TCHDThlHbHb3aC2n1yiWB4XZ6ytC3SdN5I=;
  b=iQ6KnG618RwhXCGjCFD23pxuPXF9m+pUpbX3a7EAVfHSJ/71WO6QO1hM
   R9AcSqwtqY4uRO+LkkIld5zGc0nIWso5OgLMwEswUr0x3rXeJZna8jNHT
   ygi5FLFTn9YPIpl1qRS/qWp71JMlySCNUgGMeoTuM5qDLh0QnKE8eL8Jx
   KOeZlF2D7jg0qofNsw0XCOsxwDvFOv8oRmiIIA7FkxiEr5SF83fuq4Qtz
   RVLyBmgV+IDyoqNb1SXeci04GCfQ4uzRiyLbSdqZHLUos/eebH30S3hZ8
   BjE7Hf5tipjzRsrYylJeWQJ/f6/HCmdrUZnQVKPN4yH7e+0DQCe8VKs/n
   g==;
X-CSE-ConnectionGUID: oUGfzRrnROWGW8pxD21yQw==
X-CSE-MsgGUID: ZEPu+HcDRPCwDVIWofjCrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9684642"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9684642"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:00:43 -0700
X-CSE-ConnectionGUID: ISW7ifDSQGq74NfStL8JtA==
X-CSE-MsgGUID: fr9VEvhbSx2CdfWFDHH3Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="48600005"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Apr 2024 02:00:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0HRf-0003Vg-2C;
	Fri, 26 Apr 2024 09:00:39 +0000
Date: Fri, 26 Apr 2024 16:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [wsa:i2c/time_left 87/94]
 drivers/media/common/saa7146/saa7146_i2c.c:223:8: warning: comparison of
 distinct pointer types ('unsigned long *' and 'typeof (time_left) *' (aka
 'long *'))
Message-ID: <202404261604.mkBpncRH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left
head:   f40d9c303c85f20a79881e3dc955ec601bef36fb
commit: d47ee85aaf42ffd72a8961d7593ecf69c1b2f2f2 [87/94] media: common: saa7146: saa7146_i2c: use 'time_left' variable with wait_event_interruptible_timeout()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240426/202404261604.mkBpncRH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404261604.mkBpncRH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404261604.mkBpncRH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/media/drv-intf/saa7146_vv.h:5:
   In file included from include/media/v4l2-common.h:18:
   In file included from include/media/v4l2-dev.h:15:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/media/common/saa7146/saa7146_i2c.c:4:
   In file included from include/media/drv-intf/saa7146_vv.h:5:
   In file included from include/media/v4l2-common.h:271:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/media/common/saa7146/saa7146_i2c.c:4:
   In file included from include/media/drv-intf/saa7146_vv.h:5:
   In file included from include/media/v4l2-common.h:271:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/media/common/saa7146/saa7146_i2c.c:4:
   In file included from include/media/drv-intf/saa7146_vv.h:5:
   In file included from include/media/v4l2-common.h:271:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/media/common/saa7146/saa7146_i2c.c:223:8: warning: comparison of distinct pointer types ('unsigned long *' and 'typeof (time_left) *' (aka 'long *')) [-Wcompare-distinct-pointer-types]
     223 |                         if (time_after(jiffies,time_left)) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jiffies.h:129:3: note: expanded from macro 'time_after'
     129 |          typecheck(unsigned long, b) && \
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:18: note: expanded from macro 'typecheck'
      12 |         (void)(&__dummy == &__dummy2); \
         |                ~~~~~~~~ ^  ~~~~~~~~~
   drivers/media/common/saa7146/saa7146_i2c.c:237:8: warning: comparison of distinct pointer types ('unsigned long *' and 'typeof (time_left) *' (aka 'long *')) [-Wcompare-distinct-pointer-types]
     237 |                         if (time_after(jiffies,time_left)) {
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/jiffies.h:129:3: note: expanded from macro 'time_after'
     129 |          typecheck(unsigned long, b) && \
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/typecheck.h:12:18: note: expanded from macro 'typecheck'
      12 |         (void)(&__dummy == &__dummy2); \
         |                ~~~~~~~~ ^  ~~~~~~~~~
   19 warnings generated.


vim +223 drivers/media/common/saa7146/saa7146_i2c.c

   172	
   173	/* this functions writes out the data-byte 'dword' to the i2c-device.
   174	   it returns 0 if ok, -1 if the transfer failed, -2 if the transfer
   175	   failed badly (e.g. address error) */
   176	static int saa7146_i2c_writeout(struct saa7146_dev *dev, __le32 *dword, int short_delay)
   177	{
   178		u32 status = 0, mc2 = 0;
   179		int trial = 0;
   180		long time_left;
   181	
   182		/* write out i2c-command */
   183		DEB_I2C("before: 0x%08x (status: 0x%08x), %d\n",
   184			*dword, saa7146_read(dev, I2C_STATUS), dev->i2c_op);
   185	
   186		if( 0 != (SAA7146_USE_I2C_IRQ & dev->ext->flags)) {
   187	
   188			saa7146_write(dev, I2C_STATUS,	 dev->i2c_bitrate);
   189			saa7146_write(dev, I2C_TRANSFER, le32_to_cpu(*dword));
   190	
   191			dev->i2c_op = 1;
   192			SAA7146_ISR_CLEAR(dev, MASK_16|MASK_17);
   193			SAA7146_IER_ENABLE(dev, MASK_16|MASK_17);
   194			saa7146_write(dev, MC2, (MASK_00 | MASK_16));
   195	
   196			time_left = HZ/100 + 1; /* 10ms */
   197			time_left = wait_event_interruptible_timeout(dev->i2c_wq, dev->i2c_op == 0,
   198								     time_left);
   199			if (time_left == -ERESTARTSYS || dev->i2c_op) {
   200				SAA7146_IER_DISABLE(dev, MASK_16|MASK_17);
   201				SAA7146_ISR_CLEAR(dev, MASK_16|MASK_17);
   202				if (time_left == -ERESTARTSYS)
   203					/* a signal arrived */
   204					return -ERESTARTSYS;
   205	
   206				pr_warn("%s %s [irq]: timed out waiting for end of xfer\n",
   207					dev->name, __func__);
   208				return -EIO;
   209			}
   210			status = saa7146_read(dev, I2C_STATUS);
   211		} else {
   212			saa7146_write(dev, I2C_STATUS,	 dev->i2c_bitrate);
   213			saa7146_write(dev, I2C_TRANSFER, le32_to_cpu(*dword));
   214			saa7146_write(dev, MC2, (MASK_00 | MASK_16));
   215	
   216			/* do not poll for i2c-status before upload is complete */
   217			time_left = jiffies + HZ/100 + 1; /* 10ms */
   218			while(1) {
   219				mc2 = (saa7146_read(dev, MC2) & 0x1);
   220				if( 0 != mc2 ) {
   221					break;
   222				}
 > 223				if (time_after(jiffies,time_left)) {
   224					pr_warn("%s %s: timed out waiting for MC2\n",
   225						dev->name, __func__);
   226					return -EIO;
   227				}
   228			}
   229			/* wait until we get a transfer done or error */
   230			time_left = jiffies + HZ/100 + 1; /* 10ms */
   231			/* first read usually delivers bogus results... */
   232			saa7146_i2c_status(dev);
   233			while(1) {
   234				status = saa7146_i2c_status(dev);
   235				if ((status & 0x3) != 1)
   236					break;
   237				if (time_after(jiffies,time_left)) {
   238					/* this is normal when probing the bus
   239					 * (no answer from nonexisistant device...)
   240					 */
   241					pr_warn("%s %s [poll]: timed out waiting for end of xfer\n",
   242						dev->name, __func__);
   243					return -EIO;
   244				}
   245				if (++trial < 50 && short_delay)
   246					udelay(10);
   247				else
   248					msleep(1);
   249			}
   250		}
   251	
   252		/* give a detailed status report */
   253		if ( 0 != (status & (SAA7146_I2C_SPERR | SAA7146_I2C_APERR |
   254				     SAA7146_I2C_DTERR | SAA7146_I2C_DRERR |
   255				     SAA7146_I2C_AL    | SAA7146_I2C_ERR   |
   256				     SAA7146_I2C_BUSY)) ) {
   257	
   258			if ( 0 == (status & SAA7146_I2C_ERR) ||
   259			     0 == (status & SAA7146_I2C_BUSY) ) {
   260				/* it may take some time until ERR goes high - ignore */
   261				DEB_I2C("unexpected i2c status %04x\n", status);
   262			}
   263			if( 0 != (status & SAA7146_I2C_SPERR) ) {
   264				DEB_I2C("error due to invalid start/stop condition\n");
   265			}
   266			if( 0 != (status & SAA7146_I2C_DTERR) ) {
   267				DEB_I2C("error in data transmission\n");
   268			}
   269			if( 0 != (status & SAA7146_I2C_DRERR) ) {
   270				DEB_I2C("error when receiving data\n");
   271			}
   272			if( 0 != (status & SAA7146_I2C_AL) ) {
   273				DEB_I2C("error because arbitration lost\n");
   274			}
   275	
   276			/* we handle address-errors here */
   277			if( 0 != (status & SAA7146_I2C_APERR) ) {
   278				DEB_I2C("error in address phase\n");
   279				return -EREMOTEIO;
   280			}
   281	
   282			return -EIO;
   283		}
   284	
   285		/* read back data, just in case we were reading ... */
   286		*dword = cpu_to_le32(saa7146_read(dev, I2C_TRANSFER));
   287	
   288		DEB_I2C("after: 0x%08x\n", *dword);
   289		return 0;
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
