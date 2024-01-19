Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE9754668
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 17:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705684043; cv=none; b=u5O/R7/VwNGjcadYuuziDnzbAQNyBZFcpDoe859oTUsa1Cvfb8CiAtYAhpup6M86EdtgW9b6vy97J3plnz824XjAyI3jKEe3eWCTEHyRSoXG9iVvlyJyyGHkada5qSLCPhu4h8mm7Y45btv1W3K3MN38MBiCjlYWVRU3w8eUYGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705684043; c=relaxed/simple;
	bh=++jgzUmnScZzk6f7gNdXiTxzQxiMPAuwktiKCPk1u0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kw5fL9r4nOah1sxAgBAGPxSKoPCaBoGqOmFAYbhXY1xqptABBNP4Qvm2yq30VSTbTaQz7jI7wiXO87f2z+yFFcqx1UWZc+lJlRjYGOsscAjwbfrel/UC8jX2sW+cUQ0Aiu8pRtD3XAteEs+7ziLbMQkvrYE27WOC5YTboI+EwLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/aNd1/B; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/aNd1/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705684041; x=1737220041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=++jgzUmnScZzk6f7gNdXiTxzQxiMPAuwktiKCPk1u0c=;
  b=c/aNd1/BT1ID93A3elmUn9KxiqsbNeN3bjRPbXtDI9L0/Ub+jUdcaUv+
   Vk22fRgBxclcqhRhQjhmHaheAsprwTkL/nPahFA3uDhq7YbV12SZAXYPY
   sxjd07lg3ZeTksw8nUMeZgZgz3mO19chS0DliDaUB8lb/uiVRpb7JgUlw
   k/BDUdPBbUt9PvUCam6jJNk2nw8fu0TJZK7BooqCBgIL/FDiyB8G6z3rd
   y0IyNG34Icquh+8papJDlTtwiFopBxtZEgC75Npnr3TR6s7zOIoFPgNiY
   oqL5/FF+53yr0wCZ9YISczAjEVmqkzUsIx7DlBBLD/XUsZ70TaZuvjAfV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="14314001"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="14314001"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 09:05:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="19446834"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2024 09:05:10 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQsIm-0004Hp-0I;
	Fri, 19 Jan 2024 17:05:08 +0000
Date: Sat, 20 Jan 2024 01:04:44 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [linux-next:master 13664/13959] lib/checksum_kunit.c:616:17: sparse:
 sparse: incorrect type in argument 5 (different base types)
Message-ID: <202401200106.PMTn6g56-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ad5c60d66016e544c51ed98635a74073f761f45d
commit: 6f4c45cbcb00d649475a3099235e5b4fce569b4b [13664/13959] kunit: Add tests for csum_ipv6_magic and ip_fast_csum
config: x86_64-randconfig-r111-20240119 (https://download.01.org/0day-ci/archive/20240120/202401200106.PMTn6g56-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200106.PMTn6g56-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401200106.PMTn6g56-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/checksum_kunit.c:442:33: sparse:     got int
   lib/checksum_kunit.c:442:41: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:442:41: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:442:41: sparse:     got int
   lib/checksum_kunit.c:442:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:442:49: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:442:49: sparse:     got int
   lib/checksum_kunit.c:442:57: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:442:57: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:442:57: sparse:     got int
   lib/checksum_kunit.c:442:65: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:442:65: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:442:65: sparse:     got int
   lib/checksum_kunit.c:442:73: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:442:73: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:442:73: sparse:     got int
   lib/checksum_kunit.c:443:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:9: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:9: sparse:     got int
   lib/checksum_kunit.c:443:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:17: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:17: sparse:     got int
   lib/checksum_kunit.c:443:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:25: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:25: sparse:     got int
   lib/checksum_kunit.c:443:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:33: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:33: sparse:     got int
   lib/checksum_kunit.c:443:41: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:41: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:41: sparse:     got int
   lib/checksum_kunit.c:443:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:49: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:49: sparse:     got int
   lib/checksum_kunit.c:443:57: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:57: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:57: sparse:     got int
   lib/checksum_kunit.c:443:65: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:65: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:65: sparse:     got int
   lib/checksum_kunit.c:443:73: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:443:73: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:443:73: sparse:     got int
   lib/checksum_kunit.c:444:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:9: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:9: sparse:     got int
   lib/checksum_kunit.c:444:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:17: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:17: sparse:     got int
   lib/checksum_kunit.c:444:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:25: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:25: sparse:     got int
   lib/checksum_kunit.c:444:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:33: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:33: sparse:     got int
   lib/checksum_kunit.c:444:41: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:41: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:41: sparse:     got int
   lib/checksum_kunit.c:444:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:49: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:49: sparse:     got int
   lib/checksum_kunit.c:444:57: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:57: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:57: sparse:     got int
   lib/checksum_kunit.c:444:65: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:65: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:65: sparse:     got int
   lib/checksum_kunit.c:444:73: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:444:73: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:444:73: sparse:     got int
   lib/checksum_kunit.c:445:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:9: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:9: sparse:     got int
   lib/checksum_kunit.c:445:17: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:17: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:17: sparse:     got int
   lib/checksum_kunit.c:445:25: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:25: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:25: sparse:     got int
   lib/checksum_kunit.c:445:33: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:33: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:33: sparse:     got int
   lib/checksum_kunit.c:445:41: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:41: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:41: sparse:     got int
   lib/checksum_kunit.c:445:49: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:49: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:49: sparse:     got int
   lib/checksum_kunit.c:445:57: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:57: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:57: sparse:     got int
   lib/checksum_kunit.c:445:65: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:65: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:65: sparse:     got int
   lib/checksum_kunit.c:445:73: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:445:73: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:445:73: sparse:     got int
   lib/checksum_kunit.c:446:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __sum16 @@     got int @@
   lib/checksum_kunit.c:446:9: sparse:     expected restricted __sum16
   lib/checksum_kunit.c:446:9: sparse:     got int
>> lib/checksum_kunit.c:616:17: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int [assigned] csum @@
   lib/checksum_kunit.c:616:17: sparse:     expected restricted __wsum [usertype] sum
   lib/checksum_kunit.c:616:17: sparse:     got unsigned int [assigned] csum
>> lib/checksum_kunit.c:616:17: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected restricted __wsum [usertype] sum @@     got unsigned int [assigned] csum @@
   lib/checksum_kunit.c:616:17: sparse:     expected restricted __wsum [usertype] sum
   lib/checksum_kunit.c:616:17: sparse:     got unsigned int [assigned] csum

vim +616 lib/checksum_kunit.c

   243	
   244	static const __sum16 expected_fast_csum[] = {
   245		0xda83, 0x45da, 0x4f46, 0x4e4f, 0x34e,	0xe902, 0xa5e9, 0x87a5, 0x7187,
   246		0x5671, 0xf556, 0x6df5, 0x816d, 0x8f81, 0xbb8f, 0xfbba, 0x5afb, 0xbe5a,
   247		0xedbe, 0xabee, 0x6aac, 0xe6b,	0xea0d, 0x67ea, 0x7e68, 0x8a7e, 0x6f8a,
   248		0x3a70, 0x9f3a, 0xe89e, 0x75e8, 0x7976, 0xfa79, 0x2cfa, 0x3c2c, 0x463c,
   249		0x7146, 0x7a71, 0x547a, 0xfd53, 0x99fc, 0xb699, 0x92b6, 0xdb91, 0xe8da,
   250		0x5fe9, 0x1e60, 0xae1d, 0x39ae, 0xf439, 0xa1f4, 0xdda1, 0xede,	0x790f,
   251		0x579,	0x1206, 0x9012, 0x2490, 0xd224, 0x5cd2, 0xa65d, 0xca7,	0x220d,
   252		0xf922, 0xbf9,	0x920b, 0x1b92, 0x361c, 0x2e36, 0x4d2e, 0x24d,	0x2,
   253		0xcfff, 0x90cf, 0xa591, 0x93a5, 0x7993, 0x9579, 0xc894, 0x50c8, 0x5f50,
   254		0xd55e, 0xcad5, 0xf3c9, 0x8f4,	0x4409, 0x5043, 0x5b50, 0x55b,	0x2205,
   255		0x1e22, 0x801e, 0x3780, 0xe137, 0x7ee0, 0xf67d, 0x3cf6, 0xa53c, 0x2ea5,
   256		0x472e, 0x5147, 0xcf51, 0x1bcf, 0x951c, 0x1e95, 0xc71e, 0xe4c7, 0xc3e4,
   257		0x3dc3, 0xee3d, 0xa4ed, 0xf9a4, 0xcbf8, 0x75cb, 0xb375, 0x50b4, 0x3551,
   258		0xf835, 0x19f8, 0x8c1a, 0x538c, 0xad52, 0xa3ac, 0xb0a3, 0x5cb0, 0x6c5c,
   259		0x5b6c, 0xc05a, 0x92c0, 0x4792, 0xbe47, 0x53be, 0x1554, 0x5715, 0x4b57,
   260		0xe54a, 0x20e5, 0x21,	0xd500, 0xa1d4, 0xa8a1, 0x57a9, 0xca57, 0x5ca,
   261		0x1c06, 0x4f1c, 0xe24e, 0xd9e2, 0xf0d9, 0x4af1, 0x474b, 0x8146, 0xe81,
   262		0xfd0e, 0x84fd, 0x7c85, 0xba7c, 0x17ba, 0x4a17, 0x964a, 0xf595, 0xff5,
   263		0x5310, 0x3253, 0x6432, 0x4263, 0x2242, 0xe121, 0x32e1, 0xf632, 0xc5f5,
   264		0x21c6, 0x7d22, 0x8e7c, 0x418e, 0x5641, 0x3156, 0x7c31, 0x737c, 0x373,
   265		0x2503, 0xc22a, 0x3c2,	0x4a04, 0x8549, 0x5285, 0xa352, 0xe8a3, 0x6fe8,
   266		0x1a6f, 0x211a, 0xe021, 0x38e0, 0x7638, 0xf575, 0x9df5, 0x169e, 0xf116,
   267		0x23f1, 0xcd23, 0xece,	0x660f, 0x4866, 0x6a48, 0x716a, 0xee71, 0xa2ee,
   268		0xb8a2, 0x61b9, 0xa361, 0xf7a2, 0x26f7, 0x1127, 0x6611, 0xe065, 0x36e0,
   269		0x1837, 0x3018, 0x1c30, 0x721b, 0x3e71, 0xe43d, 0x99e4, 0x9e9a, 0xb79d,
   270		0xa9b7, 0xcaa,	0xeb0c, 0x4eb,	0x1305, 0x8813, 0xb687, 0xa9b6, 0xfba9,
   271		0xd7fb, 0xccd8, 0x2ecd, 0x652f, 0xae65, 0x3fae, 0x3a40, 0x563a, 0x7556,
   272		0x2776, 0x1228, 0xef12, 0xf9ee, 0xcef9, 0x56cf, 0xa956, 0x24a9, 0xba24,
   273		0x5fba, 0x665f, 0xf465, 0x8ff4, 0x6d8f, 0x346d, 0x5f34, 0x385f, 0xd137,
   274		0xb8d0, 0xacb8, 0x55ac, 0x7455, 0xe874, 0x89e8, 0xd189, 0xa0d1, 0xb2a0,
   275		0xb8b2, 0x36b8, 0x5636, 0xd355, 0x8d3,	0x1908, 0x2118, 0xc21,	0x990c,
   276		0x8b99, 0x158c, 0x7815, 0x9e78, 0x6f9e, 0x4470, 0x1d44, 0x341d, 0x2634,
   277		0x3f26, 0x793e, 0xc79,	0xcc0b, 0x26cc, 0xd126, 0x1fd1, 0xb41f, 0xb6b4,
   278		0x22b7, 0xa122, 0xa1,	0x7f01, 0x837e, 0x3b83, 0xaf3b, 0x6fae, 0x916f,
   279		0xb490, 0xffb3, 0xceff, 0x50cf, 0x7550, 0x7275, 0x1272, 0x2613, 0xaa26,
   280		0xd5aa, 0x7d5,	0x9607, 0x96,	0xb100, 0xf8b0, 0x4bf8, 0xdd4c, 0xeddd,
   281		0x98ed, 0x2599, 0x9325, 0xeb92, 0x8feb, 0xcc8f, 0x2acd, 0x392b, 0x3b39,
   282		0xcb3b, 0x6acb, 0xd46a, 0xb8d4, 0x6ab8, 0x106a, 0x2f10, 0x892f, 0x789,
   283		0xc806, 0x45c8, 0x7445, 0x3c74, 0x3a3c, 0xcf39, 0xd7ce, 0x58d8, 0x6e58,
   284		0x336e, 0x1034, 0xee10, 0xe9ed, 0xc2e9, 0x3fc2, 0xd53e, 0xd2d4, 0xead2,
   285		0x8fea, 0x2190, 0x1162, 0xbe11, 0x8cbe, 0x6d8c, 0xfb6c, 0x6dfb, 0xd36e,
   286		0x3ad3, 0xf3a,	0x870e, 0xc287, 0x53c3, 0xc54,	0x5b0c, 0x7d5a, 0x797d,
   287		0xec79, 0x5dec, 0x4d5e, 0x184e, 0xd618, 0x60d6, 0xb360, 0x98b3, 0xf298,
   288		0xb1f2, 0x69b1, 0xf969, 0xef9,	0xab0e, 0x21ab, 0xe321, 0x24e3, 0x8224,
   289		0x5481, 0x5954, 0x7a59, 0xff7a, 0x7dff, 0x1a7d, 0xa51a, 0x46a5, 0x6b47,
   290		0xe6b,	0x830e, 0xa083, 0xff9f, 0xd0ff, 0xffd0, 0xe6ff, 0x7de7, 0xc67d,
   291		0xd0c6, 0x61d1, 0x3a62, 0xc3b,	0x150c, 0x1715, 0x4517, 0x5345, 0x3954,
   292		0xdd39, 0xdadd, 0x32db, 0x6a33, 0xd169, 0x86d1, 0xb687, 0x3fb6, 0x883f,
   293		0xa487, 0x39a4, 0x2139, 0xbe20, 0xffbe, 0xedfe, 0x8ded, 0x368e, 0xc335,
   294		0x51c3, 0x9851, 0xf297, 0xd6f2, 0xb9d6, 0x95ba, 0x2096, 0xea1f, 0x76e9,
   295		0x4e76, 0xe04d, 0xd0df, 0x80d0, 0xa280, 0xfca2, 0x75fc, 0xef75, 0x32ef,
   296		0x6833, 0xdf68, 0xc4df, 0x76c4, 0xb77,	0xb10a, 0xbfb1, 0x58bf, 0x5258,
   297		0x4d52, 0x6c4d, 0x7e6c, 0xb67e, 0xccb5, 0x8ccc, 0xbe8c, 0xc8bd, 0x9ac8,
   298		0xa99b, 0x52a9, 0x2f53, 0xc30,	0x3e0c, 0xb83d, 0x83b7, 0x5383, 0x7e53,
   299		0x4f7e, 0xe24e, 0xb3e1, 0x8db3, 0x618e, 0xc861, 0xfcc8, 0x34fc, 0x9b35,
   300		0xaa9b, 0xb1aa, 0x5eb1, 0x395e, 0x8639, 0xd486, 0x8bd4, 0x558b, 0x2156,
   301		0xf721, 0x4ef6, 0x14f,	0x7301, 0xdd72, 0x49de, 0x894a, 0x9889, 0x8898,
   302		0x7788, 0x7b77, 0x637b, 0xb963, 0xabb9, 0x7cab, 0xc87b, 0x21c8, 0xcb21,
   303		0xdfca, 0xbfdf, 0xf2bf, 0x6af2, 0x626b, 0xb261, 0x3cb2, 0xc63c, 0xc9c6,
   304		0xc9c9, 0xb4c9, 0xf9b4, 0x91f9, 0x4091, 0x3a40, 0xcc39, 0xd1cb, 0x7ed1,
   305		0x537f, 0x6753, 0xa167, 0xba49, 0x88ba, 0x7789, 0x3877, 0xf037, 0xd3ef,
   306		0xb5d4, 0x55b6, 0xa555, 0xeca4, 0xa1ec, 0xb6a2, 0x7b7,	0x9507, 0xfd94,
   307		0x82fd, 0x5c83, 0x765c, 0x9676, 0x3f97, 0xda3f, 0x6fda, 0x646f, 0x3064,
   308		0x5e30, 0x655e, 0x6465, 0xcb64, 0xcdca, 0x4ccd, 0x3f4c, 0x243f, 0x6f24,
   309		0x656f, 0x6065, 0x3560, 0x3b36, 0xac3b, 0x4aac, 0x714a, 0x7e71, 0xda7e,
   310		0x7fda, 0xda7f, 0x6fda, 0xff6f, 0xc6ff, 0xedc6, 0xd4ed, 0x70d5, 0xeb70,
   311		0xa3eb, 0x80a3, 0xca80, 0x3fcb, 0x2540, 0xf825, 0x7ef8, 0xf87e, 0x73f8,
   312		0xb474, 0xb4b4, 0x92b5, 0x9293, 0x93,	0x3500, 0x7134, 0x9071, 0xfa8f,
   313		0x51fa, 0x1452, 0xba13, 0x7ab9, 0x957a, 0x8a95, 0x6e8a, 0x6d6e, 0x7c6d,
   314		0x447c, 0x9744, 0x4597, 0x8945, 0xef88, 0x8fee, 0x3190, 0x4831, 0x8447,
   315		0xa183, 0x1da1, 0xd41d, 0x2dd4, 0x4f2e, 0xc94e, 0xcbc9, 0xc9cb, 0x9ec9,
   316		0x319e, 0xd531, 0x20d5, 0x4021, 0xb23f, 0x29b2, 0xd828, 0xecd8, 0x5ded,
   317		0xfc5d, 0x4dfc, 0xd24d, 0x6bd2, 0x5f6b, 0xb35e, 0x7fb3, 0xee7e, 0x56ee,
   318		0xa657, 0x68a6, 0x8768, 0x7787, 0xb077, 0x4cb1, 0x764c, 0xb175, 0x7b1,
   319		0x3d07, 0x603d, 0x3560, 0x3e35, 0xb03d, 0xd6b0, 0xc8d6, 0xd8c8, 0x8bd8,
   320		0x3e8c, 0x303f, 0xd530, 0xf1d4, 0x42f1, 0xca42, 0xddca, 0x41dd, 0x3141,
   321		0x132,	0xe901, 0x8e9,	0xbe09, 0xe0bd, 0x2ce0, 0x862d, 0x3986, 0x9139,
   322		0x6d91, 0x6a6d, 0x8d6a, 0x1b8d, 0xac1b, 0xedab, 0x54ed, 0xc054, 0xcebf,
   323		0xc1ce, 0x5c2,	0x3805, 0x6038, 0x5960, 0xd359, 0xdd3,	0xbe0d, 0xafbd,
   324		0x6daf, 0x206d, 0x2c20, 0x862c, 0x8e86, 0xec8d, 0xa2ec, 0xa3a2, 0x51a3,
   325		0x8051, 0xfd7f, 0x91fd, 0xa292, 0xaf14, 0xeeae, 0x59ef, 0x535a, 0x8653,
   326		0x3986, 0x9539, 0xb895, 0xa0b8, 0x26a0, 0x2227, 0xc022, 0x77c0, 0xad77,
   327		0x46ad, 0xaa46, 0x60aa, 0x8560, 0x4785, 0xd747, 0x45d7, 0x2346, 0x5f23,
   328		0x25f,	0x1d02, 0x71d,	0x8206, 0xc82,	0x180c, 0x3018, 0x4b30, 0x4b,
   329		0x3001, 0x1230, 0x2d12, 0x8c2d, 0x148d, 0x4015, 0x5f3f, 0x3d5f, 0x6b3d,
   330		0x396b, 0x473a, 0xf746, 0x44f7, 0x8945, 0x3489, 0xcb34, 0x84ca, 0xd984,
   331		0xf0d9, 0xbcf0, 0x63bd, 0x3264, 0xf332, 0x45f3, 0x7346, 0x5673, 0xb056,
   332		0xd3b0, 0x4ad4, 0x184b, 0x7d18, 0x6c7d, 0xbb6c, 0xfeba, 0xe0fe, 0x10e1,
   333		0x5410, 0x2954, 0x9f28, 0x3a9f, 0x5a3a, 0xdb59, 0xbdc,	0xb40b, 0x1ab4,
   334		0x131b, 0x5d12, 0x6d5c, 0xe16c, 0xb0e0, 0x89b0, 0xba88, 0xbb,	0x3c01,
   335		0xe13b, 0x6fe1, 0x446f, 0xa344, 0x81a3, 0xfe81, 0xc7fd, 0x38c8, 0xb38,
   336		0x1a0b, 0x6d19, 0xf36c, 0x47f3, 0x6d48, 0xb76d, 0xd3b7, 0xd8d2, 0x52d9,
   337		0x4b53, 0xa54a, 0x34a5, 0xc534, 0x9bc4, 0xed9b, 0xbeed, 0x3ebe, 0x233e,
   338		0x9f22, 0x4a9f, 0x774b, 0x4577, 0xa545, 0x64a5, 0xb65,	0x870b, 0x487,
   339		0x9204, 0x5f91, 0xd55f, 0x35d5, 0x1a35, 0x71a,	0x7a07, 0x4e7a, 0xfc4e,
   340		0x1efc, 0x481f, 0x7448, 0xde74, 0xa7dd, 0x1ea7, 0xaa1e, 0xcfaa, 0xfbcf,
   341		0xedfb, 0x6eee, 0x386f, 0x4538, 0x6e45, 0xd96d, 0x11d9, 0x7912, 0x4b79,
   342		0x494b, 0x6049, 0xac5f, 0x65ac, 0x1366, 0x5913, 0xe458, 0x7ae4, 0x387a,
   343		0x3c38, 0xb03c, 0x76b0, 0x9376, 0xe193, 0x42e1, 0x7742, 0x6476, 0x3564,
   344		0x3c35, 0x6a3c, 0xcc69, 0x94cc, 0x5d95, 0xe5e,	0xee0d, 0x4ced, 0xce4c,
   345		0x52ce, 0xaa52, 0xdaaa, 0xe4da, 0x1de5, 0x4530, 0x5445, 0x3954, 0xb639,
   346		0x81b6, 0x7381, 0x1574, 0xc215, 0x10c2, 0x3f10, 0x6b3f, 0xe76b, 0x7be7,
   347		0xbc7b, 0xf7bb, 0x41f7, 0xcc41, 0x38cc, 0x4239, 0xa942, 0x4a9,	0xc504,
   348		0x7cc4, 0x437c, 0x6743, 0xea67, 0x8dea, 0xe88d, 0xd8e8, 0xdcd8, 0x17dd,
   349		0x5718, 0x958,	0xa609, 0x41a5, 0x5842, 0x159,	0x9f01, 0x269f, 0x5a26,
   350		0x405a, 0xc340, 0xb4c3, 0xd4b4, 0xf4d3, 0xf1f4, 0x39f2, 0xe439, 0x67e4,
   351		0x4168, 0xa441, 0xdda3, 0xdedd, 0x9df,	0xab0a, 0xa5ab, 0x9a6,	0xba09,
   352		0x9ab9, 0xad9a, 0x5ae,	0xe205, 0xece2, 0xecec, 0x14ed, 0xd614, 0x6bd5,
   353		0x916c, 0x3391, 0x6f33, 0x206f, 0x8020, 0x780,	0x7207, 0x2472, 0x8a23,
   354		0xb689, 0x3ab6, 0xf739, 0x97f6, 0xb097, 0xa4b0, 0xe6a4, 0x88e6, 0x2789,
   355		0xb28,	0x350b, 0x1f35, 0x431e, 0x1043, 0xc30f, 0x79c3, 0x379,	0x5703,
   356		0x3256, 0x4732, 0x7247, 0x9d72, 0x489d, 0xd348, 0xa4d3, 0x7ca4, 0xbf7b,
   357		0x45c0, 0x7b45, 0x337b, 0x4034, 0x843f, 0xd083, 0x35d0, 0x6335, 0x4d63,
   358		0xe14c, 0xcce0, 0xfecc, 0x35ff, 0x5636, 0xf856, 0xeef8, 0x2def, 0xfc2d,
   359		0x4fc,	0x6e04, 0xb66d, 0x78b6, 0xbb78, 0x3dbb, 0x9a3d, 0x839a, 0x9283,
   360		0x593,	0xd504, 0x23d5, 0x5424, 0xd054, 0x61d0, 0xdb61, 0x17db, 0x1f18,
   361		0x381f, 0x9e37, 0x679e, 0x1d68, 0x381d, 0x8038, 0x917f, 0x491,	0xbb04,
   362		0x23bb, 0x4124, 0xd41,	0xa30c, 0x8ba3, 0x8b8b, 0xc68b, 0xd2c6, 0xebd2,
   363		0x93eb, 0xbd93, 0x99bd, 0x1a99, 0xea19, 0x58ea, 0xcf58, 0x73cf, 0x1073,
   364		0x9e10, 0x139e, 0xea13, 0xcde9, 0x3ecd, 0x883f, 0xf89,	0x180f, 0x2a18,
   365		0x212a, 0xce20, 0x73ce, 0xf373, 0x60f3, 0xad60, 0x4093, 0x8e40, 0xb98e,
   366		0xbfb9, 0xf1bf, 0x8bf1, 0x5e8c, 0xe95e, 0x14e9, 0x4e14, 0x1c4e, 0x7f1c,
   367		0xe77e, 0x6fe7, 0xf26f, 0x13f2, 0x8b13, 0xda8a, 0x5fda, 0xea5f, 0x4eea,
   368		0xa84f, 0x88a8, 0x1f88, 0x2820, 0x9728, 0x5a97, 0x3f5b, 0xb23f, 0x70b2,
   369		0x2c70, 0x232d, 0xf623, 0x4f6,	0x905,	0x7509, 0xd675, 0x28d7, 0x9428,
   370		0x3794, 0xf036, 0x2bf0, 0xba2c, 0xedb9, 0xd7ed, 0x59d8, 0xed59, 0x4ed,
   371		0xe304, 0x18e3, 0x5c19, 0x3d5c, 0x753d, 0x6d75, 0x956d, 0x7f95, 0xc47f,
   372		0x83c4, 0xa84,	0x2e0a, 0x5f2e, 0xb95f, 0x77b9, 0x6d78, 0xf46d, 0x1bf4,
   373		0xed1b, 0xd6ed, 0xe0d6, 0x5e1,	0x3905, 0x5638, 0xa355, 0x99a2, 0xbe99,
   374		0xb4bd, 0x85b4, 0x2e86, 0x542e, 0x6654, 0xd765, 0x73d7, 0x3a74, 0x383a,
   375		0x2638, 0x7826, 0x7677, 0x9a76, 0x7e99, 0x2e7e, 0xea2d, 0xa6ea, 0x8a7,
   376		0x109,	0x3300, 0xad32, 0x5fad, 0x465f, 0x2f46, 0xc62f, 0xd4c5, 0xad5,
   377		0xcb0a, 0x4cb,	0xb004, 0x7baf, 0xe47b, 0x92e4, 0x8e92, 0x638e, 0x1763,
   378		0xc17,	0xf20b, 0x1ff2, 0x8920, 0x5889, 0xcb58, 0xf8cb, 0xcaf8, 0x84cb,
   379		0x9f84, 0x8a9f, 0x918a, 0x4991, 0x8249, 0xff81, 0x46ff, 0x5046, 0x5f50,
   380		0x725f, 0xf772, 0x8ef7, 0xe08f, 0xc1e0, 0x1fc2, 0x9e1f, 0x8b9d, 0x108b,
   381		0x411,	0x2b04, 0xb02a, 0x1fb0, 0x1020, 0x7a0f, 0x587a, 0x8958, 0xb188,
   382		0xb1b1, 0x49b2, 0xb949, 0x7ab9, 0x917a, 0xfc91, 0xe6fc, 0x47e7, 0xbc47,
   383		0x8fbb, 0xea8e, 0x34ea, 0x2635, 0x1726, 0x9616, 0xc196, 0xa6c1, 0xf3a6,
   384		0x11f3, 0x4811, 0x3e48, 0xeb3e, 0xf7ea, 0x1bf8, 0xdb1c, 0x8adb, 0xe18a,
   385		0x42e1, 0x9d42, 0x5d9c, 0x6e5d, 0x286e, 0x4928, 0x9a49, 0xb09c, 0xa6b0,
   386		0x2a7,	0xe702, 0xf5e6, 0x9af5, 0xf9b,	0x810f, 0x8080, 0x180,	0x1702,
   387		0x5117, 0xa650, 0x11a6, 0x1011, 0x550f, 0xd554, 0xbdd5, 0x6bbe, 0xc66b,
   388		0xfc7,	0x5510, 0x5555, 0x7655, 0x177,	0x2b02, 0x6f2a, 0xb70,	0x9f0b,
   389		0xcf9e, 0xf3cf, 0x3ff4, 0xcb40, 0x8ecb, 0x768e, 0x5277, 0x8652, 0x9186,
   390		0x9991, 0x5099, 0xd350, 0x93d3, 0x6d94, 0xe6d,	0x530e, 0x3153, 0xa531,
   391		0x64a5, 0x7964, 0x7c79, 0x467c, 0x1746, 0x3017, 0x3730, 0x538,	0x5,
   392		0x1e00, 0x5b1e, 0x955a, 0xae95, 0x3eaf, 0xff3e, 0xf8ff, 0xb2f9, 0xa1b3,
   393		0xb2a1, 0x5b2,	0xad05, 0x7cac, 0x2d7c, 0xd32c, 0x80d2, 0x7280, 0x8d72,
   394		0x1b8e, 0x831b, 0xac82, 0xfdac, 0xa7fd, 0x15a8, 0xd614, 0xe0d5, 0x7be0,
   395		0xb37b, 0x61b3, 0x9661, 0x9d95, 0xc79d, 0x83c7, 0xd883, 0xead7, 0xceb,
   396		0xf60c, 0xa9f5, 0x19a9, 0xa019, 0x8f9f, 0xd48f, 0x3ad5, 0x853a, 0x985,
   397		0x5309, 0x6f52, 0x1370, 0x6e13, 0xa96d, 0x98a9, 0x5198, 0x9f51, 0xb69f,
   398		0xa1b6, 0x2ea1, 0x672e, 0x2067, 0x6520, 0xaf65, 0x6eaf, 0x7e6f, 0xee7e,
   399		0x17ef, 0xa917, 0xcea8, 0x9ace, 0xff99, 0x5dff, 0xdf5d, 0x38df, 0xa39,
   400		0x1c0b, 0xe01b, 0x46e0, 0xcb46, 0x90cb, 0xba90, 0x4bb,	0x9104, 0x9d90,
   401		0xc89c, 0xf6c8, 0x6cf6, 0x886c, 0x1789, 0xbd17, 0x70bc, 0x7e71, 0x17e,
   402		0x1f01, 0xa01f, 0xbaa0, 0x14bb, 0xfc14, 0x7afb, 0xa07a, 0x3da0, 0xbf3d,
   403		0x48bf, 0x8c48, 0x968b, 0x9d96, 0xfd9d, 0x96fd, 0x9796, 0x6b97, 0xd16b,
   404		0xf4d1, 0x3bf4, 0x253c, 0x9125, 0x6691, 0xc166, 0x34c1, 0x5735, 0x1a57,
   405		0xdc19, 0x77db, 0x8577, 0x4a85, 0x824a, 0x9182, 0x7f91, 0xfd7f, 0xb4c3,
   406		0xb5b4, 0xb3b5, 0x7eb3, 0x617e, 0x4e61, 0xa4f,	0x530a, 0x3f52, 0xa33e,
   407		0x34a3, 0x9234, 0xf091, 0xf4f0, 0x1bf5, 0x311b, 0x9631, 0x6a96, 0x386b,
   408		0x1d39, 0xe91d, 0xe8e9, 0x69e8, 0x426a, 0xee42, 0x89ee, 0x368a, 0x2837,
   409		0x7428, 0x5974, 0x6159, 0x1d62, 0x7b1d, 0xf77a, 0x7bf7, 0x6b7c, 0x696c,
   410		0xf969, 0x4cf9, 0x714c, 0x4e71, 0x6b4e, 0x256c, 0x6e25, 0xe96d, 0x94e9,
   411		0x8f94, 0x3e8f, 0x343e, 0x4634, 0xb646, 0x97b5, 0x8997, 0xe8a,	0x900e,
   412		0x8090, 0xfd80, 0xa0fd, 0x16a1, 0xf416, 0xebf4, 0x95ec, 0x1196, 0x8911,
   413		0x3d89, 0xda3c, 0x9fd9, 0xd79f, 0x4bd7, 0x214c, 0x3021, 0x4f30, 0x994e,
   414		0x5c99, 0x6f5d, 0x326f, 0xab31, 0x6aab, 0xe969, 0x90e9, 0x1190, 0xff10,
   415		0xa2fe, 0xe0a2, 0x66e1, 0x4067, 0x9e3f, 0x2d9e, 0x712d, 0x8170, 0xd180,
   416		0xffd1, 0x25ff, 0x3826, 0x2538, 0x5f24, 0xc45e, 0x1cc4, 0xdf1c, 0x93df,
   417		0xc793, 0x80c7, 0x2380, 0xd223, 0x7ed2, 0xfc7e, 0x22fd, 0x7422, 0x1474,
   418		0xb714, 0x7db6, 0x857d, 0xa85,	0xa60a, 0x88a6, 0x4289, 0x7842, 0xc278,
   419		0xf7c2, 0xcdf7, 0x84cd, 0xae84, 0x8cae, 0xb98c, 0x1aba, 0x4d1a, 0x884c,
   420		0x4688, 0xcc46, 0xd8cb, 0x2bd9, 0xbe2b, 0xa2be, 0x72a2, 0xf772, 0xd2f6,
   421		0x75d2, 0xc075, 0xa3c0, 0x63a3, 0xae63, 0x8fae, 0x2a90, 0x5f2a, 0xef5f,
   422		0x5cef, 0xa05c, 0x89a0, 0x5e89, 0x6b5e, 0x736b, 0x773,	0x9d07, 0xe99c,
   423		0x27ea, 0x2028, 0xc20,	0x980b, 0x4797, 0x2848, 0x9828, 0xc197, 0x48c2,
   424		0x2449, 0x7024, 0x570,	0x3e05, 0xd3e,	0xf60c, 0xbbf5, 0x69bb, 0x3f6a,
   425		0x740,	0xf006, 0xe0ef, 0xbbe0, 0xadbb, 0x56ad, 0xcf56, 0xbfce, 0xa9bf,
   426		0x205b, 0x6920, 0xae69, 0x50ae, 0x2050, 0xf01f, 0x27f0, 0x9427, 0x8993,
   427		0x8689, 0x4087, 0x6e40, 0xb16e, 0xa1b1, 0xe8a1, 0x87e8, 0x6f88, 0xfe6f,
   428		0x4cfe, 0xe94d, 0xd5e9, 0x47d6, 0x3148, 0x5f31, 0xc35f, 0x13c4, 0xa413,
   429		0x5a5,	0x2405, 0xc223, 0x66c2, 0x3667, 0x5e37, 0x5f5e, 0x2f5f, 0x8c2f,
   430		0xe48c, 0xd0e4, 0x4d1,	0xd104, 0xe4d0, 0xcee4, 0xfcf,	0x480f, 0xa447,
   431		0x5ea4, 0xff5e, 0xbefe, 0x8dbe, 0x1d8e, 0x411d, 0x1841, 0x6918, 0x5469,
   432		0x1155, 0xc611, 0xaac6, 0x37ab, 0x2f37, 0xca2e, 0x87ca, 0xbd87, 0xabbd,
   433		0xb3ab, 0xcb4,	0xce0c, 0xfccd, 0xa5fd, 0x72a5, 0xf072, 0x83f0, 0xfe83,
   434		0x97fd, 0xc997, 0xb0c9, 0xadb0, 0xe6ac, 0x88e6, 0x1088, 0xbe10, 0x16be,
   435		0xa916, 0xa3a8, 0x46a3, 0x5447, 0xe953, 0x84e8, 0x2085, 0xa11f, 0xfa1,
   436		0xdd0f, 0xbedc, 0x5abe, 0x805a, 0xc97f, 0x6dc9, 0x826d, 0x4a82, 0x934a,
   437		0x5293, 0xd852, 0xd3d8, 0xadd3, 0xf4ad, 0xf3f4, 0xfcf3, 0xfefc, 0xcafe,
   438		0xb7ca, 0x3cb8, 0xa13c, 0x18a1, 0x1418, 0xea13, 0x91ea, 0xf891, 0x53f8,
   439		0xa254, 0xe9a2, 0x87ea, 0x4188, 0x1c41, 0xdc1b, 0xf5db, 0xcaf5, 0x45ca,
   440		0x6d45, 0x396d, 0xde39, 0x90dd, 0x1e91, 0x1e,	0x7b00, 0x6a7b, 0xa46a,
   441		0xc9a3, 0x9bc9, 0x389b, 0x1139, 0x5211, 0x1f52, 0xeb1f, 0xabeb, 0x48ab,
   442		0x9348, 0xb392, 0x17b3, 0x1618, 0x5b16, 0x175b, 0xdc17, 0xdedb, 0x1cdf,
   443		0xeb1c, 0xd1ea, 0x4ad2, 0xd4b,	0xc20c, 0x24c2, 0x7b25, 0x137b, 0x8b13,
   444		0x618b, 0xa061, 0xff9f, 0xfffe, 0x72ff, 0xf572, 0xe2f5, 0xcfe2, 0xd2cf,
 > 445		0x75d3, 0x6a76, 0xc469, 0x1ec4, 0xfc1d, 0x59fb, 0x455a, 0x7a45, 0xa479,
   446		0xb7a4
   447	};
   448	
   449	static u8 tmp_buf[TEST_BUFLEN];
   450	
   451	#define full_csum(buff, len, sum) csum_fold(csum_partial(buff, len, sum))
   452	
   453	#define CHECK_EQ(lhs, rhs) KUNIT_ASSERT_EQ(test, (__force u64)lhs, (__force u64)rhs)
   454	
   455	static __sum16 to_sum16(u16 x)
   456	{
   457		return (__force __sum16)le16_to_cpu((__force __le16)x);
   458	}
   459	
   460	/* This function swaps the bytes inside each half of a __wsum */
   461	static __wsum to_wsum(u32 x)
   462	{
   463		u16 hi = le16_to_cpu((__force __le16)(x >> 16));
   464		u16 lo = le16_to_cpu((__force __le16)x);
   465	
   466		return (__force __wsum)((hi << 16) | lo);
   467	}
   468	
   469	static void assert_setup_correct(struct kunit *test)
   470	{
   471		CHECK_EQ(sizeof(random_buf) / sizeof(random_buf[0]), MAX_LEN);
   472		CHECK_EQ(sizeof(expected_results) / sizeof(expected_results[0]),
   473			 MAX_LEN);
   474		CHECK_EQ(sizeof(init_sums_no_overflow) /
   475				 sizeof(init_sums_no_overflow[0]),
   476			 MAX_LEN);
   477	}
   478	
   479	/*
   480	 * Test with randomized input (pre determined random with known results).
   481	 */
   482	static void test_csum_fixed_random_inputs(struct kunit *test)
   483	{
   484		int len, align;
   485		__wsum sum;
   486		__sum16 result, expec;
   487	
   488		assert_setup_correct(test);
   489		for (align = 0; align < TEST_BUFLEN; ++align) {
   490			memcpy(&tmp_buf[align], random_buf,
   491			       min(MAX_LEN, TEST_BUFLEN - align));
   492			for (len = 0; len < MAX_LEN && (align + len) < TEST_BUFLEN;
   493			     ++len) {
   494				/*
   495				 * Test the precomputed random input.
   496				 */
   497				sum = to_wsum(random_init_sum);
   498				result = full_csum(&tmp_buf[align], len, sum);
   499				expec = to_sum16(expected_results[len]);
   500				CHECK_EQ(result, expec);
   501			}
   502		}
   503	}
   504	
   505	/*
   506	 * All ones input test. If there are any missing carry operations, it fails.
   507	 */
   508	static void test_csum_all_carry_inputs(struct kunit *test)
   509	{
   510		int len, align;
   511		__wsum sum;
   512		__sum16 result, expec;
   513	
   514		assert_setup_correct(test);
   515		memset(tmp_buf, 0xff, TEST_BUFLEN);
   516		for (align = 0; align < TEST_BUFLEN; ++align) {
   517			for (len = 0; len < MAX_LEN && (align + len) < TEST_BUFLEN;
   518			     ++len) {
   519				/*
   520				 * All carries from input and initial sum.
   521				 */
   522				sum = to_wsum(0xffffffff);
   523				result = full_csum(&tmp_buf[align], len, sum);
   524				expec = to_sum16((len & 1) ? 0xff00 : 0);
   525				CHECK_EQ(result, expec);
   526	
   527				/*
   528				 * All carries from input.
   529				 */
   530				sum = 0;
   531				result = full_csum(&tmp_buf[align], len, sum);
   532				if (len & 1)
   533					expec = to_sum16(0xff00);
   534				else if (len)
   535					expec = 0;
   536				else
   537					expec = to_sum16(0xffff);
   538				CHECK_EQ(result, expec);
   539			}
   540		}
   541	}
   542	
   543	/*
   544	 * Test with input that alone doesn't cause any carries. By selecting the
   545	 * maximum initial sum, this allows us to test that there are no carries
   546	 * where there shouldn't be.
   547	 */
   548	static void test_csum_no_carry_inputs(struct kunit *test)
   549	{
   550		int len, align;
   551		__wsum sum;
   552		__sum16 result, expec;
   553	
   554		assert_setup_correct(test);
   555		memset(tmp_buf, 0x4, TEST_BUFLEN);
   556		for (align = 0; align < TEST_BUFLEN; ++align) {
   557			for (len = 0; len < MAX_LEN && (align + len) < TEST_BUFLEN;
   558			     ++len) {
   559				/*
   560				 * Expect no carries.
   561				 */
   562				sum = to_wsum(init_sums_no_overflow[len]);
   563				result = full_csum(&tmp_buf[align], len, sum);
   564				expec = 0;
   565				CHECK_EQ(result, expec);
   566	
   567				/*
   568				 * Expect one carry.
   569				 */
   570				sum = to_wsum(init_sums_no_overflow[len] + 1);
   571				result = full_csum(&tmp_buf[align], len, sum);
   572				expec = to_sum16(len ? 0xfffe : 0xffff);
   573				CHECK_EQ(result, expec);
   574			}
   575		}
   576	}
   577	
   578	static void test_ip_fast_csum(struct kunit *test)
   579	{
   580		__sum16 csum_result, expected;
   581	
   582		for (int len = IPv4_MIN_WORDS; len < IPv4_MAX_WORDS; len++) {
   583			for (int index = 0; index < NUM_IP_FAST_CSUM_TESTS; index++) {
   584				csum_result = ip_fast_csum(random_buf + index, len);
   585				expected =
   586					expected_fast_csum[(len - IPv4_MIN_WORDS) *
   587							   NUM_IP_FAST_CSUM_TESTS +
   588							   index];
   589				CHECK_EQ(expected, csum_result);
   590			}
   591		}
   592	}
   593	
   594	static void test_csum_ipv6_magic(struct kunit *test)
   595	{
   596		const struct in6_addr *saddr;
   597		const struct in6_addr *daddr;
   598		unsigned int len;
   599		unsigned char proto;
   600		unsigned int csum;
   601	
   602		const int daddr_offset = sizeof(struct in6_addr);
   603		const int len_offset = sizeof(struct in6_addr) + sizeof(struct in6_addr);
   604		const int proto_offset = sizeof(struct in6_addr) + sizeof(struct in6_addr) +
   605				     sizeof(int);
   606		const int csum_offset = sizeof(struct in6_addr) + sizeof(struct in6_addr) +
   607				    sizeof(int) + sizeof(char);
   608	
   609		for (int i = 0; i < NUM_IPv6_TESTS; i++) {
   610			saddr = (const struct in6_addr *)(random_buf + i);
   611			daddr = (const struct in6_addr *)(random_buf + i +
   612							  daddr_offset);
   613			len = *(unsigned int *)(random_buf + i + len_offset);
   614			proto = *(random_buf + i + proto_offset);
   615			csum = *(unsigned int *)(random_buf + i + csum_offset);
 > 616			CHECK_EQ(expected_csum_ipv6_magic[i],
   617				 csum_ipv6_magic(saddr, daddr, len, proto, csum));
   618		}
   619	}
   620	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
