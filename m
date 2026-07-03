Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACFA433E7D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783063082; cv=none; b=oxaG9dzwQmp6Dopl0p7ty+rc7uXzrrLCKDRS1RpGvDyb13i45i9DOK2TIVWfxYYl3/R7U5lWYyJ5kW/cuDVl5y7YOhBcx/ymzOvrs9DeANXXTSlr1o+wiDd+e1ZS+6TgsBMw4/xG43cdzM/wSqTnRDx0rn/o//5qTxeTX6h3PO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783063082; c=relaxed/simple;
	bh=jTl8alpOzGIkOV4mke9w5kGq/OUWezWPh2y3UI9krcc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iJr+w458nluigGjL69CP0EWDL95h7AtskfC+RQGgJej8mFSHdhrXoOJCNwlUj33C3XUhvQWoz1SHNcFAkYtNFDQCGvgnX4izA2IGog/ieYzzyxNYcMmh4LTA/09JZYxsWIm2UAWEIX+tfojgNPt9FiCmAg79QDHwcWZxWIrRibg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJBr+FFD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJBr+FFD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783063079; x=1814599079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jTl8alpOzGIkOV4mke9w5kGq/OUWezWPh2y3UI9krcc=;
  b=fJBr+FFDMUd4h9jefccPYzivRj/AWdeCgnRwC8zFiHkiyfDf+gKZjqaK
   StdWEwAIqLP3QKwt1tXSx02jAWSXa9KxFm2wya+sz9lyo164g2e67x5KR
   Z2NCx4WwwqbHb7NL1qr7M7SimdDns70wjt6n41Xe7MagujGc68m0cRM4x
   4cn9ktX6jSClQ3o7UxrDmaEQfzGxG4Zsi75AMEnGxhLSM8V1hGLUanLax
   z9+8NjMyaokXfb0sy1M+j8h0CrQE+lrQrkkpnNTZs3J6vFRHV0/y7hhvy
   X0QJsZh3f0y1zz39M1GEWTPLmzcd2NFTubh1V13RUFB6HPfjiKWIChngg
   g==;
X-CSE-ConnectionGUID: 50TecVzTQj27RLaO75/W6Q==
X-CSE-MsgGUID: 98zPfVU3SkuNzCB/ii5UBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="87638628"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="87638628"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 00:17:58 -0700
X-CSE-ConnectionGUID: AIKVBPekQy+Ar0B4leDYiw==
X-CSE-MsgGUID: hPUfEAPsTCCTTlPcvOKn3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="257379476"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Jul 2026 00:17:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfY9k-00000000Bo1-3AI6;
	Fri, 03 Jul 2026 07:17:50 +0000
Date: Fri, 03 Jul 2026 15:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 36/125]
 drivers/net/wireless/realtek/rtl8xxxu/core.c:1031:undefined reference to
 `sdio_claim_host'
Message-ID: <202607031553.LoTXFNta-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   dd5ae791340d9c645202fab0d77afedf9339ebd0
commit: 3e30f2f898bfcc0770c4232bc72aa9019dc99480 [36/125] rtl81xxx: Hack in SDIO.
config: x86_64-randconfig-074-20260702 (https://download.01.org/0day-ci/archive/20260703/202607031553.LoTXFNta-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031553.LoTXFNta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031553.LoTXFNta-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `rtl8xxxu_writeN':
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:1031:(.text+0x3314f22): undefined reference to `sdio_claim_host'
>> ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:1035:(.text+0x3314f7e): undefined reference to `sdio_writeb'
>> ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:1045:(.text+0x3314fa8): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_read8':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:753:(.text+0x3315cd5): undefined reference to `sdio_claim_host'
>> ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:754:(.text+0x3315ce5): undefined reference to `sdio_readb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:756:(.text+0x3315cf0): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_read16':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:779:(.text+0x3315e49): undefined reference to `sdio_claim_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:783:(.text+0x3315e5c): undefined reference to `sdio_readb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:783:(.text+0x3315e7c): undefined reference to `sdio_readb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:795:(.text+0x3315eeb): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxu_sdio_rxfifo_recv':
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:7589:(.text+0x33160a2): undefined reference to `sdio_align_size'
   ld: vmlinux.o: in function `rtl81xxxu_sdio_read_port':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:7545:(.text+0x331619b): undefined reference to `sdio_claim_host'
>> ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7550:(.text+0x3316248): undefined reference to `sdio_memcpy_fromio'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7574:(.text+0x33162af): undefined reference to `sdio_release_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7574:(.text+0x3316409): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_read32':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:820:(.text+0x3316661): undefined reference to `sdio_claim_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:824:(.text+0x3316689): undefined reference to `sdio_readb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:836:(.text+0x33166d5): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_sdio_write_port':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:7653:(.text+0x33168cf): undefined reference to `sdio_align_size'
>> ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7668:(.text+0x331693f): undefined reference to `sdio_claim_host'
>> ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7670:(.text+0x3316976): undefined reference to `sdio_memcpy_toio'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7673:(.text+0x3316990): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_write8':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:856:(.text+0x33170d7): undefined reference to `sdio_claim_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:857:(.text+0x33170ea): undefined reference to `sdio_writeb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:859:(.text+0x33170f2): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_write16':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:879:(.text+0x331897e): undefined reference to `sdio_claim_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:884:(.text+0x3318995): undefined reference to `sdio_writeb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:884:(.text+0x33189b6): undefined reference to `sdio_writeb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:895:(.text+0x33189c6): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_write32':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:915:(.text+0x3319610): undefined reference to `sdio_claim_host'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:920:(.text+0x331966b): undefined reference to `sdio_writeb'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:931:(.text+0x3319689): undefined reference to `sdio_release_host'
   ld: vmlinux.o: in function `rtl8xxxu_sdio_claim':
   drivers/net/wireless/realtek/rtl8xxxu/core.c:7970:(.text+0x3321241): undefined reference to `sdio_claim_host'
>> ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7972:(.text+0x3321249): undefined reference to `sdio_enable_func'
>> ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7979:(.text+0x3321279): undefined reference to `sdio_set_block_size'
>> ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:7988:(.text+0x33212c3): undefined reference to `sdio_claim_irq'
   ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:8003:(.text+0x33212d3): undefined reference to `sdio_release_host'
>> ld: drivers/net/wireless/realtek/rtl8xxxu/core.c:8001:(.text+0x3322663): undefined reference to `sdio_disable_func'
   ld: vmlinux.o: in function `rtl8xxxu_driver_init':
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:8204:(.init.text+0x10c5ce): undefined reference to `__sdio_register_driver'
   ld: vmlinux.o: in function `rtl8xxxu_driver_exit':
>> drivers/net/wireless/realtek/rtl8xxxu/core.c:8204:(.exit.text+0xbfcc): undefined reference to `sdio_unregister_driver'


vim +1031 drivers/net/wireless/realtek/rtl8xxxu/core.c

  1015	
  1016	static int
  1017	rtl8xxxu_writeN(struct rtl8xxxu_priv *priv, u32 addr2, u8 *buf, u16 len)
  1018	{
  1019		struct sdio_func *func = priv->func;
  1020		int err;
  1021		bool claim_needed;
  1022		u32 addr;
  1023		u8 device_id;
  1024		u16 offset;
  1025		unsigned int i;
  1026	
  1027		addr = _cvrt2ftaddr(addr2, &device_id, &offset);
  1028		claim_needed = rtl8xxxu_sdio_claim_host_needed(func);
  1029	
  1030		if (claim_needed)
> 1031			sdio_claim_host(func);
  1032	
  1033		if (rtl8xxxu_need_cmd52(priv, device_id, offset)) {
  1034			for (i = 0; i < len; i++) {
> 1035				sdio_writeb(func, buf[i], addr + i, &err);
  1036				if (err) {
  1037					dev_err(&func->dev, "%s: FAIL!(%d) addr = 0x%05x\n", __func__, err, addr);
  1038					break;
  1039				}
  1040			}
  1041		} else {
  1042			err = sdio_writesb(func, addr, buf, len);
  1043		}
  1044		if (claim_needed)
> 1045			sdio_release_host(func);
  1046		if (err)
  1047			dev_err(&func->dev, "%s: FAIL!(%d) addr = 0x%05x\n", __func__, err, addr);
  1048		return err ? 0 : len;
  1049	}
  1050	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
