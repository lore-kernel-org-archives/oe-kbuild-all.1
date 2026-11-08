Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131738;
	b=Wtb2Z3Zs+l82GnjQaso2eclRsPVGpr6batspqRStzb2yyqT/+G/gGzC/7W89vizo7sdH
	 u1uXkEVrCn3ul+zPcPT3ZrPzpCLps8AwVqJZFzrtUi+AicUg6JsYnOCmhMDxyuhDDAu+8
	 b+9TwKounmBMriGyB+w8uLwblFP3XWE4GPs+5wA0xent1vzduhg+GkWJWa2lXCP8kY1Fh
	 vP8ibGoikweJVvM8lAbSE2u9EjHHXqqdB0bW5mT4fI0OnC3U6GjTY5iyUSl/GY8HD3I5y
	 hTJlj9i9iibOkne3Pte2bDbCRjVu2VbMd8I1ke5s6Y5hjSxn3wHDPGu6nzUguM89DCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131738;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SynxCGdT+Z2w3INHhTiFX4cziWFsO9obX81nOyn/pIE=;
	b=ldoc3nkuHsnVIleZ6g7PpLM2d8A818s2/55wbOP7H3ulnHoxU0GGngvwVm3Hkw/itW/y
	 TTowl1bYsz6eoe8LeH4MMjpYi4wSTxg+k8z71KHFvslGNf2nXScN2ggrZez8/McTl2Xgi
	 QUVKlydN4gZYZ+QFz33mIyZJtq/6E0ytOwEaU2/fq7n2J44bYeBUKa++5qvi8OeVM0Ltd
	 kfA+INL9U8DpNGI8RsGpW1IDvLMRA5AeHvRkSu+jaH86DzhQXSwFYgMje3ESrbXihGQZ1
	 f1gJUH3Ba2+OJ+3AGYjZnicfn7XwnP7P09jC8gUN0JLCbkb1KIOxgzLGq0RnY9wiH6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lfRUtCkl;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE00A606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 09:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE00A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lfRUtCkl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794131737; x=1825667737;
  h=date:from:to:cc:subject:message-id;
  bh=U03Rzv9qek7tdm8vtAEsCsomhWJ3bjnihE+e15X6Sqs=;
  b=lfRUtCklMXKFqrgoX50CB4bG35PI3uAwcle66YQthqapvpYuGVAtG+uq
   WhwQ+nHyVRj8fzhICKJPC1rfqZbMSgHDUACA60Z6F7DI1juVG1iimSZtD
   gHISneVOk9sGwP/Nzgz88PBeezwTztZQ7GeSWBkrM/41kE2hNnKJE1GDQ
   6wKAcjNxpvoeKsknDR86v71NoTLCQEQ4LX7tVM9xSgD5Fzh8wNMikdFBm
   ervsdT4X/M9H9dsj6QJzaPJNU9BTanU3t3Fb0bHJ2J4Iv6vYwLS56zwI3
   TS69OqNz7MLvmP7leYKgfnD1NUvFYMAQq2OpSvLBltNCoV5aiO01523qB
   A==;
X-CSE-ConnectionGUID: XDSROOnrQxGKQ5RxvcIiyg==
X-CSE-MsgGUID: TrBivN/XQzOnpJktcBDSFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2898854"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2898854"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 01:55:36 -0800
X-CSE-ConnectionGUID: xshGYXsyRTOtJO7Kb0mIvQ==
X-CSE-MsgGUID: /wB/AX2FRDWGA12ESsvABA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7513920"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2026 01:55:35 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPzca-00000000skb-3Lwn;
	Sun, 08 Nov 2026 09:55:32 +0000
Date: Sun, 08 Nov 2026 17:54:43 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 138/154]
 drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:25: warning: variable 'mac'
 set but not used
Message-ID: <202611081720.bFJBq2sh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.4-rc
head:   674a64f97be4d25967f31216ffe7eaefdabf827f
commit: aab5d4e842b1b95a85e08dc3da96675a803f676a [138/154] net: mediatek: add proprietary debugfs
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20261108/202611081720.bFJBq2sh-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081720.bFJBq2sh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081720.bFJBq2sh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'mtketh_debug_show':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:435:25: warning: variable 'mac' set but not used [-Wunused-but-set-variable=]
     435 |         struct mtk_mac *mac = 0;
         |                         ^~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_auto_tlb_write':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1810:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable=]
    1810 |         int ret;
         |             ^~~
   drivers/net/ethernet/mediatek/mtk_eth_dbg.c: In function 'hw_lro_auto_tlb_dump_v2':
>> drivers/net/ethernet/mediatek/mtk_eth_dbg.c:1903:13: warning: variable 'score' set but not used [-Wunused-but-set-variable=]
    1903 |         u32 score = 0, ipv4 = 0;
         |             ^~~~~


vim +/mac +435 drivers/net/ethernet/mediatek/mtk_eth_dbg.c

   431	
   432	static int mtketh_debug_show(struct seq_file *m, void *private)
   433	{
   434		struct mtk_eth *eth = m->private;
 > 435		struct mtk_mac *mac = 0;
   436		int  i = 0;
   437	
   438		for (i = 0 ; i < MTK_MAX_DEVS ; i++) {
   439			if (!eth->mac[i] ||
   440			    of_phy_is_fixed_link(eth->mac[i]->of_node))
   441				continue;
   442			mac = eth->mac[i];
   443	/* FIXME */
   444	/*
   445			while (j < 30) {
   446				d =  _mtk_mdio_read_c22(eth, mac->phy_dev->addr, j);
   447	
   448				seq_printf(m, "phy=%d, reg=0x%08x, data=0x%08x\n",
   449					   mac->phy_dev->addr, j, d);
   450				j++;
   451			}
   452	*/
   453		}
   454		return 0;
   455	}
   456	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
