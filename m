Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C058C623
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 01:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711935303; cv=none; b=OOYawmxrn3aLqsA0EbIbqMQLy00SQhJY/Wt8ZUXrZaVdeO9c1NDiaJBAQk6N47VsYxkED8rOsJDbgdXHp7UvSsIPpD65x+UDqH46PrUqNKHpCWyNvnWLIGDo4HlFqL4Kk7WzevqHKfyk2WiX8zwJBcCJ8BZ150fD97wq3czCbiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711935303; c=relaxed/simple;
	bh=b5rFn8jXrKrVf331oWkOum9xpAnNIp7tOR4RqZuAJq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WpWtVlIgLXvOa4JeBXtOC1vLxFg9lwZFl5G2cgvxuinN2IMqxLkv4rriFWQPrl18F+FjZVYjfL+80ymiGxPgaFD0MP6HkwMdOkktepzwwrTH/WG+K+XB2EZLbttlRNVoO1RqE8rwO3KHU93VqdWYXeaVKBjmUpvuD77FqCZtJ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aj4+fuhF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aj4+fuhF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711935300; x=1743471300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b5rFn8jXrKrVf331oWkOum9xpAnNIp7tOR4RqZuAJq0=;
  b=Aj4+fuhF8kJi07hojwM2gCu2PPbYlsuuxaPO+ghVR4Npe+YmEqY+Fc6N
   AhilfRLZTS6M13YvFJw+aRuJiTk0gDB+0m0rlMz7ijs7+Xc5A5xwCnRPT
   wQqKTWKrNqqEZupV8dLLikDbDIEskJvqAvI0y9ZoFeZcz6bD/OoUEtE76
   5xxpEQKsbtSnDkSdOMVWFysAnxzppai+IfBLZFyYOZXQWHxk0MC3aB6+D
   4e6BH2rnPW44N9PQd8VeaPZFZ4TEGyIPKVJq2+pqaq2MsJqCnLQWm1YrQ
   FcEqQugXdAcvq+4eYarAjJs7+w7+ZwgtJuQra0x+fguCLL7XttPIQDQ2E
   g==;
X-CSE-ConnectionGUID: M1tGlk9BQkODr9Mqwobfzw==
X-CSE-MsgGUID: CpA7iQQ8RJ+FhyG9iNQVuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="24539948"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="24539948"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 18:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="17634683"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Mar 2024 18:34:58 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr6Zc-0001Yi-0v;
	Mon, 01 Apr 2024 01:34:56 +0000
Date: Mon, 1 Apr 2024 09:34:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15455/22010]
 drivers/staging/gmjstcm/tcm_tis_spi.c:125:32: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202404010900.lWqZRfpD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6726609c5990ede3a9fdb318d1dc759d03678a1a
commit: 5ebbfc8c29eb5eb6dfdab853bdb2a622e0533d7e [15455/22010] staging: TCM: add GMJS(Nationz Tech) TCM driver.
config: arm64-randconfig-r111-20240331 (https://download.01.org/0day-ci/archive/20240401/202404010900.lWqZRfpD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240401/202404010900.lWqZRfpD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404010900.lWqZRfpD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/gmjstcm/tcm_tis_spi.c:125:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *static [noderef] [toplevel] __iomem gpio1_a5 @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:125:32: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:125:32: sparse:     got void *static [noderef] [toplevel] __iomem gpio1_a5
   drivers/staging/gmjstcm/tcm_tis_spi.c:178:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *static [noderef] [toplevel] __iomem gpio1_a5 @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:178:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:178:33: sparse:     got void *static [noderef] [toplevel] __iomem gpio1_a5
>> drivers/staging/gmjstcm/tcm_tis_spi.c:109:5: sparse: sparse: symbol 'tcm_tis_spi_transfer' was not declared. Should it be static?
>> drivers/staging/gmjstcm/tcm_tis_spi.c:710:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *static [noderef] [toplevel] __iomem reuse_conf_reg @@     got void [noderef] __iomem * @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:710:32: sparse:     expected void *static [noderef] [toplevel] __iomem reuse_conf_reg
   drivers/staging/gmjstcm/tcm_tis_spi.c:710:32: sparse:     got void [noderef] __iomem *
>> drivers/staging/gmjstcm/tcm_tis_spi.c:718:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *static [noderef] [toplevel] __iomem gpio1_a5 @@     got void [noderef] __iomem * @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:718:26: sparse:     expected void *static [noderef] [toplevel] __iomem gpio1_a5
   drivers/staging/gmjstcm/tcm_tis_spi.c:718:26: sparse:     got void [noderef] __iomem *
>> drivers/staging/gmjstcm/tcm_tis_spi.c:726:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *static [noderef] [toplevel] __iomem reuse_conf_reg @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:726:37: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:726:37: sparse:     got void *static [noderef] [toplevel] __iomem reuse_conf_reg
>> drivers/staging/gmjstcm/tcm_tis_spi.c:727:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *static [noderef] [toplevel] __iomem reuse_conf_reg @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:727:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:727:33: sparse:     got void *static [noderef] [toplevel] __iomem reuse_conf_reg
>> drivers/staging/gmjstcm/tcm_tis_spi.c:729:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:729:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:729:42: sparse:     got void *
   drivers/staging/gmjstcm/tcm_tis_spi.c:790:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *static [noderef] [toplevel] __iomem reuse_conf_reg @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:790:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:790:33: sparse:     got void *static [noderef] [toplevel] __iomem reuse_conf_reg
   drivers/staging/gmjstcm/tcm_tis_spi.c:792:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *static [noderef] [toplevel] __iomem gpio1_a5 @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:792:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:792:33: sparse:     got void *static [noderef] [toplevel] __iomem gpio1_a5
   drivers/staging/gmjstcm/tcm_tis_spi.c:805:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *static [noderef] [toplevel] __iomem reuse_conf_reg @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:805:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:805:33: sparse:     got void *static [noderef] [toplevel] __iomem reuse_conf_reg
   drivers/staging/gmjstcm/tcm_tis_spi.c:807:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *static [noderef] [toplevel] __iomem gpio1_a5 @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:807:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:807:33: sparse:     got void *static [noderef] [toplevel] __iomem gpio1_a5
>> drivers/staging/gmjstcm/tcm_tis_spi.c:125:32: sparse: sparse: dereference of noderef expression
>> drivers/staging/gmjstcm/tcm_tis_spi.c:125:32: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:178:33: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:178:33: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:234:13: sparse: sparse: context imbalance in 'cleanup_tis' - wrong count at exit
   drivers/staging/gmjstcm/tcm_tis_spi.c:711:22: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:719:22: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:726:37: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:726:37: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:727:33: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:726:37: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:727:33: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:729:33: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:729:33: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:789:21: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:790:33: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:791:21: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:792:33: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:804:21: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:805:33: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:806:21: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:807:33: sparse: sparse: dereference of noderef expression
   drivers/staging/gmjstcm/tcm_tis_spi.c:109:5: warning: no previous prototype for 'tcm_tis_spi_transfer' [-Wmissing-prototypes]
     109 | int tcm_tis_spi_transfer(struct device *dev, u32 addr, u16 len,
         |     ^~~~~~~~~~~~~~~~~~~~
   drivers/staging/gmjstcm/tcm_tis_spi.c: In function 'recv_data':
   drivers/staging/gmjstcm/tcm_tis_spi.c:423:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     423 |         int ret;
         |             ^~~
   drivers/staging/gmjstcm/tcm_tis_spi.c: At top level:
   drivers/staging/gmjstcm/tcm_tis_spi.c:817:36: warning: 'tcm_tis_spi_acpi_match' defined but not used [-Wunused-const-variable=]
     817 | static const struct acpi_device_id tcm_tis_spi_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gmjstcm/tcm_tis_spi.c: In function 'cleanup_tis':
   drivers/staging/gmjstcm/tcm_tis_spi.c:249:17: warning: 'inten' may be used uninitialized [-Wmaybe-uninitialized]
     249 |                 tcm_tis_writel(chip->dev, TCM_INT_ENABLE(chip->vendor.locality),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     250 |                                 ~TCM_GLOBAL_INT_ENABLE & inten);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gmjstcm/tcm_tis_spi.c:237:13: note: 'inten' was declared here
     237 |         u32 inten;
         |             ^~~~~
   drivers/staging/gmjstcm/tcm_tis_spi.c: In function 'tcm_tis_init':
   drivers/staging/gmjstcm/tcm_tis_spi.c:264:21: warning: 'vendor' may be used uninitialized [-Wmaybe-uninitialized]
     264 |         if ((vendor & 0xffff) != 0x19f5 && (vendor & 0xffff) != 0x1B4E)
         |             ~~~~~~~~^~~~~~~~~
   drivers/staging/gmjstcm/tcm_tis_spi.c:260:13: note: 'vendor' was declared here
     260 |         u32 vendor, intfcaps;
         |             ^~~~~~

vim +125 drivers/staging/gmjstcm/tcm_tis_spi.c

   108	
 > 109	int tcm_tis_spi_transfer(struct device *dev, u32 addr, u16 len,
   110			u8 *in, const u8 *out)
   111	{
   112		struct tcm_tis_spi_phy *phy = dev_get_drvdata(dev);
   113		int ret = 0;
   114		struct spi_message m;
   115		struct spi_transfer spi_xfer;
   116		u8 transfer_len;
   117	
   118		tcm_dbg("TCM-dbg: %s, addr: 0x%x, len: %x, %s\n",
   119				__func__, addr, len, (in) ? "in" : "out");
   120	
   121		spi_bus_lock(phy->spi_device->master);
   122	
   123		/* set gpio1_a5 to LOW */
   124		if (is_ft_all() && (phy->spi_device->chip_select == 0)) {
 > 125			iowrite32(0x0, gpio1_a5);
   126		}
   127	
   128		while (len) {
   129			transfer_len = min_t(u16, len, MAX_SPI_FRAMESIZE);
   130	
   131			phy->iobuf[0] = (in ? 0x80 : 0) | (transfer_len - 1);
   132			phy->iobuf[1] = 0xd4;
   133			phy->iobuf[2] = addr >> 8;
   134			phy->iobuf[3] = addr;
   135	
   136			memset(&spi_xfer, 0, sizeof(spi_xfer));
   137			spi_xfer.tx_buf = phy->iobuf;
   138			spi_xfer.rx_buf = phy->iobuf;
   139			spi_xfer.len = 4;
   140			spi_xfer.cs_change = 1;
   141	
   142			spi_message_init(&m);
   143			spi_message_add_tail(&spi_xfer, &m);
   144			ret = spi_sync_locked(phy->spi_device, &m);
   145			if (ret < 0)
   146				goto exit;
   147	
   148			spi_xfer.cs_change = 0;
   149			spi_xfer.len = transfer_len;
   150			spi_xfer.delay_usecs = 5;
   151	
   152			if (in) {
   153				spi_xfer.tx_buf = NULL;
   154			} else if (out) {
   155				spi_xfer.rx_buf = NULL;
   156				memcpy(phy->iobuf, out, transfer_len);
   157				out += transfer_len;
   158			}
   159	
   160			spi_message_init(&m);
   161			spi_message_add_tail(&spi_xfer, &m);
   162			reinit_completion(&phy->ready);
   163			ret = spi_sync_locked(phy->spi_device, &m);
   164			if (ret < 0)
   165				goto exit;
   166	
   167			if (in) {
   168				memcpy(in, phy->iobuf, transfer_len);
   169				in += transfer_len;
   170			}
   171	
   172			len -= transfer_len;
   173		}
   174	
   175	exit:
   176		/* set gpio1_a5 to HIGH */
   177		if (is_ft_all() && (phy->spi_device->chip_select == 0)) {
   178			iowrite32(0x20, gpio1_a5);
   179		}
   180	
   181		spi_bus_unlock(phy->spi_device->master);
   182		tcm_dbg("TCM-dbg: ret: %d\n", ret);
   183		return ret;
   184	}
   185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
