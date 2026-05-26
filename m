Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845393C1F50
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 23:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779837882; cv=none; b=FrrNmm1m7Pt3sJmt2u5RYQaZXIvgzfQu82urvDv618sUFR42zjxLDyZ2NsqPkcq5sa1AGYXjFze3mFgjCB37+bnlDdm15Z0pS5Rosi3DISBuOYUjHOQs9f1harhnZILsZH2k1X416696L1YaXDuQyug08Z30Vlqou92VO7qqJ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779837882; c=relaxed/simple;
	bh=UXTsvUwJAnnbaW6Me2kwq7rr2IeY5Ya6eFkpcRf9hb0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LADEDqiwpf9ENDKC2egy6zk5LUK9y81xykx2ITLMQ/go1iuc16YKs4BTaPKgo4TQQx2aM1P4doaSzeKVCs/mGBZelK2r5Ji6P52dV1sdZZnyuoeVD6QL1S/dWH9DUFBKwJgM+mE/0n/xlIfQB22/GSiJpoej+sk3spGf2LW1iPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrQ4vRNY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrQ4vRNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779837880; x=1811373880;
  h=date:from:to:cc:subject:message-id;
  bh=UXTsvUwJAnnbaW6Me2kwq7rr2IeY5Ya6eFkpcRf9hb0=;
  b=LrQ4vRNYFy6fjxniLdXeJj3w2whItOOeEjJlvE3kfBIFQGIjjERJdoor
   3/tcgZM8OHjYk/FRm2lw56JEk32Dz6sgIW1lUsw7PLqFwAgDihoNcdwVP
   +eytTqMIA02oKmwdwmqQ0Qkvo52oyAejPnjGdfOvik8Mf4A1rNDRjU4NK
   Mdp+BShRrTltrIyR92VJ2Kqs7pAodZv5TMC/uZwh4arwO5ri34HboNrAU
   Qj6AI8QPPoh5ftb0tGJiOyYueBuWsrjzuQ30DYcfNPJxsRU3nl+e/mw/C
   Fdq1yBQQsmXAoZ9RfWmgwLgqWWNO1DycS78Vt7xsm2fyI5dY49mG4Lyn2
   A==;
X-CSE-ConnectionGUID: X+CHlPWiTDySwk8bwsi4uA==
X-CSE-MsgGUID: 4T9o0C59QTuLL7pN+AdzWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80572336"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="80572336"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 16:24:40 -0700
X-CSE-ConnectionGUID: Ipax1zeCTYeOtLGok01Mow==
X-CSE-MsgGUID: LHG4i2/DRdm86Ba2Y0PHsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="237893806"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 26 May 2026 16:24:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wS18W-00000000CWv-0yiB;
	Tue, 26 May 2026 23:24:36 +0000
Date: Wed, 27 May 2026 01:24:04 +0200
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, Pratyush Yadav <pratyush@kernel.org>,
 linux-doc@vger.kernel.org
Subject: [mtd:spi-nor/next 20/28] htmldocs:
 Documentation/driver-api/mtd/spi-nor.rst:216: WARNING: Block quote ends
 without a blank line; unexpected unindent. [docutils]
Message-ID: <202605270105.CZQo8wSO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
head:   113ff79be3bcf0262eb7860d3325dd951ff29499
commit: ecbba8d91f4bd0fccd722a7e5a57cec385c11ca8 [20/28] mtd: spi-nor: Add steps for testing locking support
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260527/202605270105.CZQo8wSO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605270105.CZQo8wSO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/driver-api/basics:42: ./kernel/time/time.c:370: WARNING: Duplicate C declaration, also defined at driver-api/basics:436.
   Declaration is '.. c:function:: unsigned int jiffies_to_msecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/basics:42: ./kernel/time/time.c:393: WARNING: Duplicate C declaration, also defined at driver-api/basics:453.
   Declaration is '.. c:function:: unsigned int jiffies_to_usecs (const unsigned long j)'. [duplicate_declaration.c]
   Documentation/driver-api/mtd/spi-nor.rst:215: ERROR: Unexpected indentation. [docutils]
>> Documentation/driver-api/mtd/spi-nor.rst:216: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: ERROR: Unexpected section title.


vim +216 Documentation/driver-api/mtd/spi-nor.rst

    78	
    79	    root@1:~# cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
    80	    Supported read modes by the flash
    81	     1S-1S-1S
    82	      opcode		0x03
    83	      mode cycles	0
    84	      dummy cycles	0
    85	     1S-1S-1S (fast read)
    86	      opcode		0x0b
    87	      mode cycles	0
    88	      dummy cycles	8
    89	     1S-1S-2S
    90	      opcode		0x3b
    91	      mode cycles	0
    92	      dummy cycles	8
    93	     1S-2S-2S
    94	      opcode		0xbb
    95	      mode cycles	4
    96	      dummy cycles	0
    97	     1S-1S-4S
    98	      opcode		0x6b
    99	      mode cycles	0
   100	      dummy cycles	8
   101	     1S-4S-4S
   102	      opcode		0xeb
   103	      mode cycles	2
   104	      dummy cycles	4
   105	     4S-4S-4S
   106	      opcode		0x0b
   107	      mode cycles	2
   108	      dummy cycles	4
   109	
   110	    Supported page program modes by the flash
   111	     1S-1S-1S
   112	      opcode	0x02
   113	
   114	    root@1:~# cat /sys/kernel/debug/spi-nor/spi0.0/params
   115	    name		sst26vf064b
   116	    id			bf 26 43 bf 26 43
   117	    size		8.00 MiB
   118	    write size		1
   119	    page size		256
   120	    address nbytes	3
   121	    flags		HAS_LOCK | HAS_16BIT_SR | SOFT_RESET | SWP_IS_VOLATILE
   122	
   123	    opcodes
   124	     read		0xeb
   125	      dummy cycles	6
   126	     erase		0x20
   127	     program		0x02
   128	     8D extension	none
   129	
   130	    protocols
   131	     read		1S-4S-4S
   132	     write		1S-1S-1S
   133	     register		1S-1S-1S
   134	
   135	    erase commands
   136	     20 (4.00 KiB) [0]
   137	     d8 (8.00 KiB) [1]
   138	     d8 (32.0 KiB) [2]
   139	     d8 (64.0 KiB) [3]
   140	     c7 (8.00 MiB)
   141	
   142	    sector map
   143	     region (in hex)   | erase mask | flags
   144	     ------------------+------------+----------
   145	     00000000-00007fff |     [01  ] |
   146	     00008000-0000ffff |     [0 2 ] |
   147	     00010000-007effff |     [0  3] |
   148	     007f0000-007f7fff |     [0 2 ] |
   149	     007f8000-007fffff |     [01  ] |
   150	
   151	4) Use `mtd-utils <https://git.infradead.org/mtd-utils.git>`__
   152	   and verify that erase, read and page program operations work fine::
   153	
   154	    root@1:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
   155	    2+0 records in
   156	    2+0 records out
   157	    2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.848566 s, 2.5 MB/s
   158	
   159	    root@1:~# mtd_debug erase /dev/mtd0 0 2097152
   160	    Erased 2097152 bytes from address 0x00000000 in flash
   161	
   162	    root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
   163	    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
   164	
   165	    root@1:~# hexdump spi_read
   166	    0000000 ffff ffff ffff ffff ffff ffff ffff ffff
   167	    *
   168	    0200000
   169	
   170	    root@1:~# sha256sum spi_read
   171	    4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
   172	
   173	    root@1:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
   174	    Copied 2097152 bytes from spi_test to address 0x00000000 in flash
   175	
   176	    root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
   177	    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
   178	
   179	    root@1:~# sha256sum spi*
   180	    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_read
   181	    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_test
   182	
   183	   If the flash comes erased by default and the previous erase was ignored,
   184	   we won't catch it, thus test the erase again::
   185	
   186	    root@1:~# mtd_debug erase /dev/mtd0 0 2097152
   187	    Erased 2097152 bytes from address 0x00000000 in flash
   188	
   189	    root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
   190	    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
   191	
   192	    root@1:~# sha256sum spi*
   193	    4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
   194	    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_test
   195	
   196	   Dump some other relevant data::
   197	
   198	    root@1:~# mtd_debug info /dev/mtd0
   199	    mtd.type = MTD_NORFLASH
   200	    mtd.flags = MTD_CAP_NORFLASH
   201	    mtd.size = 8388608 (8M)
   202	    mtd.erasesize = 4096 (4K)
   203	    mtd.writesize = 1
   204	    mtd.oobsize = 0
   205	    regions = 0
   206	
   207	5) If your flash supports locking, please go through the following test
   208	   procedure to make sure it correctly behaves. The below example
   209	   expects the typical situation where eraseblocks and lock sectors have
   210	   the same size. In case you enabled MTD_SPI_NOR_USE_4K_SECTORS, you
   211	   must adapt `bs` accordingly.
   212	
   213	   Warning: These tests may hard lock your device! Make sure:
   214	   - The device is not hard locked already (#WP strapped to low and
   215	     SR_SRWD bit set)
 > 216	   - If you have a WPn pin, you may want to set `no-wp` in your DT for

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
