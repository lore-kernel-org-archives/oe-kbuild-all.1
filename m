Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FEC37160
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 04:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713240271; cv=none; b=phwbfjw+peQAW5RQQq8949QITvEPcH7A4tHsyFBvp3DZzmhYdBxvJik68wgjXqrATe8vpYSGkyt2bF2jmbfdXoEtbiE4EzpR52Hn+1Zm2CvCj5UrJIRuiJtYPhb1q8aC1/ZZAzFrKTBzeqYpPYQgZ6cGfK2+JnrlAapAuYVZYQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713240271; c=relaxed/simple;
	bh=3Tom/UJMbufCe0Y5Eb5CHI6Fy/4w5ltu6bMrK0ZaL2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CZM3SjIRSZh3FV+WRPkwFsV+BHBcBEfoNQQ7vTe+FmB+BMhCxytFCnTpjgRtfHID+f8D3OeCgltHm2g37Lh6heffpsQK7912vEhkgsPZvd60pDGKQ2yolPqHSmgYXSonGQYyMII71FeGJhMHexq/Ecv0aqhCcGRDMmZeLaS4iDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUyepqfc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUyepqfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713240270; x=1744776270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Tom/UJMbufCe0Y5Eb5CHI6Fy/4w5ltu6bMrK0ZaL2w=;
  b=WUyepqfc35DgYypdCdxn0OJhN3F29i+Y13drJvX52+PAPAaXFk8AMu1M
   2szLfo5oapNZpdeP1IuhL9Oeu6K+r3QPJW5PVFOc2cpR1vbyaupX3fr3n
   1wR3fHga8SKop2wSylN6iQUa7wlvID3Qjs6a03mBR64asbXYC+YsWjHXo
   CrsG6nDYxGxAVD5vKKle8VBu6xSCrfjYhqXhjkaXeBZkPc8vVCKviXtiB
   QUq2malBEs8g7lFxi0CynXigK+A+0pLftwG4HZZzMtOJ3V7/q6sJF9Y15
   ZR8UvlD/NkvJ3j9TJtXcbBSjLPnd2oOqv9s4BncVQ8Ue8Td2MtY4JQF1H
   g==;
X-CSE-ConnectionGUID: sHYfmt2WTbOU2Mk7okUVzQ==
X-CSE-MsgGUID: /e55qWpYRfutMEEhd0IV2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8766468"
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="8766468"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 21:04:29 -0700
X-CSE-ConnectionGUID: avVsWOaKRqOS7nCuZXhS9g==
X-CSE-MsgGUID: OAOqru5oSSSmt0/+6xLNpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,204,1708416000"; 
   d="scan'208";a="59573931"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Apr 2024 21:04:28 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwa3U-0004we-2c;
	Tue, 16 Apr 2024 04:04:24 +0000
Date: Tue, 16 Apr 2024 12:03:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15455/22120]
 drivers/staging/gmjstcm/tcm_tis_spi.c:109:5: sparse: sparse: symbol
 'tcm_tis_spi_transfer' was not declared. Should it be static?
Message-ID: <202404161103.X6fwAkxa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ab90000f05ebb295378878af0ab18daacb6f3ccf
commit: 5ebbfc8c29eb5eb6dfdab853bdb2a622e0533d7e [15455/22120] staging: TCM: add GMJS(Nationz Tech) TCM driver.
config: arm64-randconfig-r111-20240331 (https://download.01.org/0day-ci/archive/20240416/202404161103.X6fwAkxa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240416/202404161103.X6fwAkxa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404161103.X6fwAkxa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/staging/gmjstcm/tcm_tis_spi.c:125:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void *static [noderef] [toplevel] <asn:2> gpio1_a5 @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:125:32: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:125:32: sparse:     got void *static [noderef] [toplevel] <asn:2> gpio1_a5
   drivers/staging/gmjstcm/tcm_tis_spi.c:178:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void *static [noderef] [toplevel] <asn:2> gpio1_a5 @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:178:33: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:178:33: sparse:     got void *static [noderef] [toplevel] <asn:2> gpio1_a5
>> drivers/staging/gmjstcm/tcm_tis_spi.c:109:5: sparse: sparse: symbol 'tcm_tis_spi_transfer' was not declared. Should it be static?
   drivers/staging/gmjstcm/tcm_tis_spi.c:710:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *static [noderef] [toplevel] <asn:2> reuse_conf_reg @@     got void [noderef] <asn:2> * @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:710:32: sparse:     expected void *static [noderef] [toplevel] <asn:2> reuse_conf_reg
   drivers/staging/gmjstcm/tcm_tis_spi.c:710:32: sparse:     got void [noderef] <asn:2> *
   drivers/staging/gmjstcm/tcm_tis_spi.c:718:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *static [noderef] [toplevel] <asn:2> gpio1_a5 @@     got void [noderef] <asn:2> * @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:718:26: sparse:     expected void *static [noderef] [toplevel] <asn:2> gpio1_a5
   drivers/staging/gmjstcm/tcm_tis_spi.c:718:26: sparse:     got void [noderef] <asn:2> *
   drivers/staging/gmjstcm/tcm_tis_spi.c:726:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] <asn:2> *addr @@     got void *static [noderef] [toplevel] <asn:2> reuse_conf_reg @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:726:37: sparse:     expected void const volatile [noderef] <asn:2> *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:726:37: sparse:     got void *static [noderef] [toplevel] <asn:2> reuse_conf_reg
   drivers/staging/gmjstcm/tcm_tis_spi.c:727:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void *static [noderef] [toplevel] <asn:2> reuse_conf_reg @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:727:33: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:727:33: sparse:     got void *static [noderef] [toplevel] <asn:2> reuse_conf_reg
   drivers/staging/gmjstcm/tcm_tis_spi.c:729:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void * @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:729:42: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:729:42: sparse:     got void *
   drivers/staging/gmjstcm/tcm_tis_spi.c:790:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void *static [noderef] [toplevel] <asn:2> reuse_conf_reg @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:790:33: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:790:33: sparse:     got void *static [noderef] [toplevel] <asn:2> reuse_conf_reg
   drivers/staging/gmjstcm/tcm_tis_spi.c:792:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void *static [noderef] [toplevel] <asn:2> gpio1_a5 @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:792:33: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:792:33: sparse:     got void *static [noderef] [toplevel] <asn:2> gpio1_a5
   drivers/staging/gmjstcm/tcm_tis_spi.c:805:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void *static [noderef] [toplevel] <asn:2> reuse_conf_reg @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:805:33: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:805:33: sparse:     got void *static [noderef] [toplevel] <asn:2> reuse_conf_reg
   drivers/staging/gmjstcm/tcm_tis_spi.c:807:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] <asn:2> *addr @@     got void *static [noderef] [toplevel] <asn:2> gpio1_a5 @@
   drivers/staging/gmjstcm/tcm_tis_spi.c:807:33: sparse:     expected void volatile [noderef] <asn:2> *addr
   drivers/staging/gmjstcm/tcm_tis_spi.c:807:33: sparse:     got void *static [noderef] [toplevel] <asn:2> gpio1_a5
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

vim +/tcm_tis_spi_transfer +109 drivers/staging/gmjstcm/tcm_tis_spi.c

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
