Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7C2195F0D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 23:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737415880; cv=none; b=QAJR3xPbxBbbW3lbnrcRRqLuGwXivZFd/aV2UdsOby4wd/WMDOTYDGC00dGY0VjtZUabOyXPkeXPvwqFAaXlca1xMbWJ8cvmrhIrnuk/ytZxp++GToOgbSGOukmRD63BhhMqzvm1JsqnRhoRTCHcsR2MUyRzwcLx2DI55ZHGTHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737415880; c=relaxed/simple;
	bh=7b/OCMsK+uN3WypvqHlkhaxGFE05DtW6dgZOsSSvZrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PZORXoueEaQuILbxWKDeUc3sS2Ii8SDovB8V6jri09Kw4U/Zf+436jzA3Oupc4u76w5R6ttF8gADjOaBKeD3IjpDFtj9+DNQp7bfaVV8Pt2afJSB4H73GNqKctGk6ZHRp2qwgNR8lltSSVnXlY8j0MYNOrxJq/y931Rfm5/7yaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mh1yORPl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mh1yORPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737415879; x=1768951879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7b/OCMsK+uN3WypvqHlkhaxGFE05DtW6dgZOsSSvZrc=;
  b=mh1yORPlVbvGo1TkFVSzFSdtEdy0Qq1BqcWu5L4GDTcBWwcmPaYQ6fvW
   eiDXsZ5JACURaRgM4yMI03qCyOkFgu2NHug6qZMKR9HMAepqFTQEhu0Y1
   lHPLPPpWLV5YkyB2QSJ24f1KwS+uiYn7gZ2hkzolqZooVyPyWoKsqbR/O
   WihWqFs+c8VufFkOMrnBFniVcAb0VvsEeBRMdT23eZW9t8Pb90idkp2qX
   qTqk1jHOm2kTKCirRf9oDxFAL+5fT9GJkeAHom3V89zlsFtS0NMdz3Twl
   xJyQLtpgwSlCT9EL79HIpJXPloISDMuUkeXIYmyQTrRu4e8q3n1D8H1iq
   w==;
X-CSE-ConnectionGUID: 2h1nxK8DRDmcpyt/KR1TmQ==
X-CSE-MsgGUID: g9GTNOvxQmWnugtgI1vYpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="63184901"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="63184901"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 15:31:18 -0800
X-CSE-ConnectionGUID: KgoQ2Q8EQhu+CH/pdgUqPw==
X-CSE-MsgGUID: CzdLW8rNR56FdwV78D4IxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111731306"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jan 2025 15:31:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta1Eg-000XM3-0b;
	Mon, 20 Jan 2025 23:31:14 +0000
Date: Tue, 21 Jan 2025 07:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 336/336]
 drivers/soc/mediatek/mtk-mbox.c:23:6: sparse: sparse: symbol
 'mtk_memcpy_to_tinysys' was not declared. Should it be static?
Message-ID: <202501210757.QDicC5Ft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1f4dbd9903f644aa6c511f8a1e145ec3f4915d3a
commit: 0b263763b3a9ab1dd29c899035ef2660eea35d14 [336/336] CHROMIUM: mailbox: add tinysys mailbox
config: arm64-randconfig-r131-20250121 (https://download.01.org/0day-ci/archive/20250121/202501210757.QDicC5Ft-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce: (https://download.01.org/0day-ci/archive/20250121/202501210757.QDicC5Ft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501210757.QDicC5Ft-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/mediatek/mtk-mbox.c:23:6: sparse: sparse: symbol 'mtk_memcpy_to_tinysys' was not declared. Should it be static?
>> drivers/soc/mediatek/mtk-mbox.c:46:36: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned int [usertype] * @@
   drivers/soc/mediatek/mtk-mbox.c:46:36: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/soc/mediatek/mtk-mbox.c:46:36: sparse:     got unsigned int [usertype] *
>> drivers/soc/mediatek/mtk-mbox.c:39:6: sparse: sparse: symbol 'mtk_memcpy_from_tinysys' was not declared. Should it be static?
>> drivers/soc/mediatek/mtk-mbox.c:137:18: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/soc/mediatek/mtk-mbox.c:563:44: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/soc/mediatek/mtk-mbox.c:747:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/soc/mediatek/mtk-mbox.c:756:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/soc/mediatek/mtk-mbox.c:762:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/soc/mediatek/mtk-mbox.c:770:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/soc/mediatek/mtk-mbox.c:778:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/soc/mediatek/mtk-mbox.c:786:29: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/soc/mediatek/mtk-mbox.c:46:28: sparse: sparse: dereference of noderef expression
>> drivers/soc/mediatek/mtk-mbox.c:46:28: sparse: sparse: dereference of noderef expression

vim +/mtk_memcpy_to_tinysys +23 drivers/soc/mediatek/mtk-mbox.c

    16	
    17	/*
    18	 * memory copy to tiny
    19	 * @param dest: dest address
    20	 * @param src: src address
    21	 * @param size: memory size
    22	 */
  > 23	void mtk_memcpy_to_tinysys(void __iomem *dest, const void *src, uint32_t size)
    24	{
    25		int i;
    26		u32 __iomem *t = dest;
    27		const u32 *s = src;
    28	
    29		for (i = 0; i < ((size + 3) >> 2); i++)
    30			writel(*(s + i), t + i);
    31	}
    32	
    33	/*
    34	 * memory copy from tiny
    35	 * @param dest: dest address
    36	 * @param src: src address
    37	 * @param size: memory size
    38	 */
  > 39	void mtk_memcpy_from_tinysys(void *dest, const void __iomem *src, uint32_t size)
    40	{
    41		int i;
    42		u32 *t = dest;
    43		const u32 __iomem *s = src;
    44	
    45		for (i = 0; i < ((size + 3) >> 2); i++)
  > 46			writel(*(s + i), t + i);
    47	}
    48	
    49	
    50	/*
    51	 * write data to mbox with ipi msg header
    52	 * function must in critical context
    53	 */
    54	int mtk_mbox_write_hd(struct mtk_mbox_device *mbdev, unsigned int mbox,
    55			unsigned int slot, void *msg)
    56	{
    57		unsigned int slot_ofs, size;
    58		struct mtk_mbox_info *minfo;
    59		struct mtk_ipi_msg *ipimsg;
    60		struct device *dev = mbdev->dev;
    61		void __iomem *base;
    62		uint32_t len;
    63		unsigned long flags;
    64	
    65		if (!mbdev) {
    66			dev_err(dev, "[MBOX]write header fail, dev null");
    67			return MBOX_PLT_ERR;
    68		}
    69	
    70		if (mbox >= mbdev->count || !msg) {
    71			dev_err(dev, "[MBOX]write header config err");
    72			return MBOX_PARA_ERR;
    73		}
    74	
    75		minfo = &(mbdev->info_table[mbox]);
    76		base = minfo->base;
    77		slot_ofs = slot * MBOX_SLOT_SIZE;
    78		size = minfo->slot;
    79		ipimsg = (struct mtk_ipi_msg *)msg;
    80		len = ipimsg->ipihd.len;
    81	
    82		if ((slot_ofs + sizeof(struct mtk_ipi_msg_hd) + len)
    83			> size * MBOX_SLOT_SIZE)
    84			return MBOX_WRITE_SZ_ERR;
    85	
    86		spin_lock_irqsave(&mbdev->info_table[mbox].mbox_lock, flags);
    87		/*ipi header and payload*/
    88		if (mbdev->memcpy_to_tiny) {
    89			mbdev->memcpy_to_tiny((void __iomem *)(base + slot_ofs),
    90				ipimsg, sizeof(struct mtk_ipi_msg_hd));
    91			mbdev->memcpy_to_tiny((void __iomem *)
    92				(base + slot_ofs + sizeof(struct mtk_ipi_msg_hd)),
    93				ipimsg->data, len);
    94		} else {
    95			mtk_memcpy_to_tinysys((void __iomem *)(base + slot_ofs),
    96				ipimsg, sizeof(struct mtk_ipi_msg_hd));
    97			mtk_memcpy_to_tinysys((void __iomem *)
    98			(base + slot_ofs + sizeof(struct mtk_ipi_msg_hd)),
    99				ipimsg->data, len);
   100		}
   101	
   102		minfo->record.write_count++;
   103		spin_unlock_irqrestore(&mbdev->info_table[mbox].mbox_lock, flags);
   104	
   105		return MBOX_DONE;
   106	}
   107	EXPORT_SYMBOL_GPL(mtk_mbox_write_hd);
   108	
   109	/*
   110	 * read data from mbox with ipi msg header
   111	 * function must in critical context
   112	 */
   113	int mtk_mbox_read_hd(struct mtk_mbox_device *mbdev, unsigned int mbox,
   114			unsigned int slot, void *dest)
   115	{
   116		unsigned int slot_ofs, size;
   117		struct mtk_mbox_info *minfo;
   118		struct mtk_ipi_msg_hd *ipihd;
   119		struct device *dev = mbdev->dev;
   120		void __iomem *base;
   121		unsigned long flags;
   122	
   123		if (!mbdev) {
   124			dev_err(dev, "[MBOX]read header fail, dev null");
   125			return MBOX_PLT_ERR;
   126		}
   127	
   128		if (mbox >= mbdev->count || !dest) {
   129			dev_err(dev, "[MBOX]read header config err");
   130			return MBOX_PARA_ERR;
   131		}
   132	
   133		minfo = &(mbdev->info_table[mbox]);
   134		base = minfo->base;
   135		slot_ofs = slot * MBOX_SLOT_SIZE;
   136		size = minfo->slot;
 > 137		ipihd = (struct mtk_ipi_msg_hd *)(base + slot_ofs);
   138	
   139		if ((slot_ofs + sizeof(struct mtk_ipi_msg_hd) + ipihd->len)
   140			> size * MBOX_SLOT_SIZE)
   141			return MBOX_READ_SZ_ERR;
   142	
   143		spin_lock_irqsave(&mbdev->info_table[mbox].mbox_lock, flags);
   144		/*ipi header and payload*/
   145		if (mbdev->memcpy_from_tiny)
   146			mbdev->memcpy_from_tiny(dest, (void __iomem *)
   147				(base + slot_ofs + sizeof(struct mtk_ipi_msg_hd)),
   148				ipihd->len);
   149		else
   150			mtk_memcpy_from_tinysys(dest, (void __iomem *)
   151				(base + slot_ofs + sizeof(struct mtk_ipi_msg_hd)),
   152				ipihd->len);
   153		spin_unlock_irqrestore(&mbdev->info_table[mbox].mbox_lock, flags);
   154	
   155		return MBOX_DONE;
   156	}
   157	EXPORT_SYMBOL_GPL(mtk_mbox_read_hd);
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
