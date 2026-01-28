Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27772BEFFF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Jan 2026 08:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769587408; cv=none; b=R/gpxa8vkkMI/6Uo91mfLnqZmp8NksvD4NffU7WpUlwtoaO5smQwJmmL5Jb3rrD9NQkMVcz4c2s+slxptt13pb/gv5tgJ4J6tgNjMuF+Q7FhIfnQEyNEgmaBMRlTaLGQnWrUx2tGEXqe/5qeQrCiRb02YviwZQ/Dj8Yqo5EVrZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769587408; c=relaxed/simple;
	bh=3d/tmZJTKzqHsR6kZCrVuR+letIs5BJIxN+4e7NRCr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dkytFxa/h1FVOF7fto6DKLAvb4bdHTDIi3GI9gryYbO9JJKBIlkAYfeB81TwF+DlGiAWMk5r7z4uCN3SN3nDNEVqhkt+jmzOCJzq5EeLcSmSvv/5lPgYJdqfDBQ2MG97SykfWI9U/IYZXhYQS4puch4hyfq8WQ3GwjR6ZOl9kcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAZxlZQb; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAZxlZQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769587406; x=1801123406;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3d/tmZJTKzqHsR6kZCrVuR+letIs5BJIxN+4e7NRCr4=;
  b=RAZxlZQb/86uuUD3dWAP0Q2oBImgD5gybCt/Vue1DvngcamcmOtLMhJQ
   N+p5b5cAQGzU7zOTx4nMOTMqWTz6EyCeaQhKMznQVbv9xVVED8HXzlFLn
   waRIwt4pjG9/BHrrQfKoD1IM7+r01SfpRlIrxKLA+FuirA0sP0wZ4wC1T
   NBUhYoIzt+JQjkaLvbN+EMR9w0laQ4RHTVMSUYkVgfWtVkhD+fnlOaeeR
   TLt5wRRu/V/FtfoUlLB4fid1wqgiCZsxeMUTKyywHezW30vcDBzALEtei
   ZBFkgzyeCAtE4gnnhD3qQ9KmRjdg18sZTVbvbJkXQtzio8m/WXNwd57Vx
   w==;
X-CSE-ConnectionGUID: mwFoIdBPRnSQbomFRDTVtw==
X-CSE-MsgGUID: 3yRaotWXT5+ck2OhHqyL+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81107398"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="81107398"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 00:03:25 -0800
X-CSE-ConnectionGUID: 7C8+aZzxTVG81Xyoz7ptbQ==
X-CSE-MsgGUID: 11z4ycgpRK2z2XtWMoCdaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="207988033"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Jan 2026 00:03:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl0WH-00000000ZRS-0w6L;
	Wed, 28 Jan 2026 08:03:21 +0000
Date: Wed, 28 Jan 2026 16:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 10/10]
 drivers/firewire/ohci.c:527:31: sparse: sparse: cast truncates bits from
 constant value (10000 becomes 0)
Message-ID: <202601281535.4qlSbZNI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   836937f105dd64e600acaa0286482270c382e394
commit: 836937f105dd64e600acaa0286482270c382e394 [10/10] TMP: Revert "modul=
e: Add compile-time check for embedded NUL characters"
config: arm64-randconfig-r121-20260128 (https://download.01.org/0day-ci/arc=
hive/20260128/202601281535.4qlSbZNI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8=
addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260128/202601281535.4qlSbZNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601281535.4qlSbZNI-lkp@i=
ntel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firewire/ohci.c:527:31: sparse: sparse: cast truncates bits from=
 constant value (10000 becomes 0)
   drivers/firewire/ohci.c:603:39: sparse: sparse: cast truncates bits from=
 constant value (10000 becomes 0)
   drivers/firewire/ohci.c:615:55: sparse: sparse: cast truncates bits from=
 constant value (10000 becomes 0)
   drivers/firewire/ohci.c:879:37: sparse: sparse: cast truncates bits from=
 constant value (10000 becomes 0)
   drivers/firewire/ohci.c:932:9: sparse: sparse: context imbalance in 'con=
text_retire_descriptors' - different lock contexts for basic block
   drivers/firewire/ohci.c:2035:20: sparse: sparse: context imbalance in 'i=
rq_handler' - different lock contexts for basic block
   drivers/firewire/ohci.c:2574:12: sparse: sparse: context imbalance in 'o=
hci_enable_phys_dma' - different lock contexts for basic block
   drivers/firewire/ohci.c:2609:12: sparse: sparse: context imbalance in 'o=
hci_read_csr' - different lock contexts for basic block
   drivers/firewire/ohci.c:2661:9: sparse: sparse: context imbalance in 'oh=
ci_write_csr' - different lock contexts for basic block
   drivers/firewire/ohci.c:3116:9: sparse: sparse: context imbalance in 'oh=
ci_free_iso_context' - wrong count at exit
   drivers/firewire/ohci.c:3138:12: sparse: sparse: context imbalance in 'o=
hci_set_iso_channels' - wrong count at exit
   drivers/firewire/ohci.c:3420:12: sparse: sparse: context imbalance in 'o=
hci_queue_iso' - wrong count at exit
--
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1800:45: sparse: sparse: inc=
orrect type in assignment (different base types) @@     expected restricted=
 __sum16 [usertype] check @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1800:45: sparse:     expecte=
d restricted __sum16 [usertype] check
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:1800:45: sparse:     got res=
tricted __be16 [usertype]
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3038:22: sparse: sparse: inc=
orrect type in argument 2 (different base types) @@     expected unsigned i=
nt [usertype] val @@     got restricted __be32 [usertype] ip @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3038:22: sparse:     expecte=
d unsigned int [usertype] val
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3038:22: sparse:     got res=
tricted __be32 [usertype] ip
>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:3083:40: sparse: sparse: inc=
orrect type in argument 1 (different base types) @@     expected unsigned i=
nt [usertype] val @@     got restricted __be32 [usertype] ip4dst @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3083:40: sparse:     expecte=
d unsigned int [usertype] val
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3083:40: sparse:     got res=
tricted __be32 [usertype] ip4dst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3083:40: sparse: sparse: cas=
t from restricted __be32
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3083:40: sparse: sparse: cas=
t from restricted __be32
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3083:40: sparse: sparse: cas=
t from restricted __be32
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3083:40: sparse: sparse: cas=
t from restricted __be32
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3143:38: sparse: sparse: inc=
orrect type in assignment (different base types) @@     expected restricted=
 __be32 [usertype] ip4dst @@     got unsigned int [usertype] @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3143:38: sparse:     expecte=
d restricted __be32 [usertype] ip4dst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3143:38: sparse:     got uns=
igned int [usertype]
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3147:38: sparse: sparse: inc=
orrect type in assignment (different base types) @@     expected restricted=
 __be32 [usertype] ip4src @@     got unsigned int @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3147:38: sparse:     expecte=
d restricted __be32 [usertype] ip4src
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3147:38: sparse:     got uns=
igned int
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3149:36: sparse: sparse: inc=
orrect type in assignment (different base types) @@     expected restricted=
 __be16 [usertype] psrc @@     got int @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3149:36: sparse:     expecte=
d restricted __be16 [usertype] psrc
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3149:36: sparse:     got int
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3151:36: sparse: sparse: inc=
orrect type in assignment (different base types) @@     expected restricted=
 __be16 [usertype] pdst @@     got int @@
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3151:36: sparse:     expecte=
d restricted __be16 [usertype] pdst
   drivers/net/ethernet/mediatek/mtk_eth_soc.c:3151:36: sparse:     got int

vim +527 drivers/firewire/ohci.c

32b46093a07698 drivers/firewire/fw-ohci.c Kristian H=C3=B8gsberg 2007-02-06=
  520 =20
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  521=
  static void ar_context_link_page(struct ar_context *ctx, unsigned int ind=
ex)
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  522=
  {
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  523=
  	struct descriptor *d;
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  524=
 =20
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  525=
  	d =3D &ctx->descriptors[index];
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  526=
  	d->branch_address  &=3D cpu_to_le32(~0xf);
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26 @527=
  	d->res_count       =3D  cpu_to_le16(PAGE_SIZE);
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  528=
  	d->transfer_status =3D  0;
32b46093a07698 drivers/firewire/fw-ohci.c Kristian H=C3=B8gsberg 2007-02-06=
  529 =20
071595ebdc66d7 drivers/firewire/ohci.c    Stefan Richter    2010-07-27  530=
  	wmb(); /* finish init of new descriptors before branch_address update */
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  531=
  	d =3D &ctx->descriptors[ctx->last_buffer_index];
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  532=
  	d->branch_address  |=3D cpu_to_le32(1);
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  533=
 =20
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  534=
  	ctx->last_buffer_index =3D index;
32b46093a07698 drivers/firewire/fw-ohci.c Kristian H=C3=B8gsberg 2007-02-06=
  535 =20
a77754a75d58d5 drivers/firewire/fw-ohci.c Kristian H=C3=B8gsberg 2007-05-07=
  536  	reg_write(ctx->ohci, CONTROL_SET(ctx->regs), CONTEXT_WAKE);
837596a61ba8f9 drivers/firewire/ohci.c    Clemens Ladisch   2010-10-25  537=
  }
837596a61ba8f9 drivers/firewire/ohci.c    Clemens Ladisch   2010-10-25  538=
 =20

:::::: The code at line 527 was first introduced by commit
:::::: 7a39d8b82165462729d09066bddb395a19025acd firewire: ohci: Asynchronou=
s Reception rewrite

:::::: TO: Clemens Ladisch <clemens@ladisch.de>
:::::: CC: Stefan Richter <stefanr@s5r6.in-berlin.de>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
