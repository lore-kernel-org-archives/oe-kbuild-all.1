Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184468;
	b=MZHDG/7gabAOPdWIhESjs/qJB0C1BNYUIO9P+IVUjKpFYiqveXI1SaPeWwUtKb07QD33
	 UVQQfQUycav8cE7dnsvERUVnso9GKx/9Ev6sS0XG8kl7gbmyokE+c0gtHyO9mVhBsHRoQ
	 hql8iSEdCnFdhUQ4qaN8PSk66UXpI6qHNNQ6eKwqwnOdww6cInuYIe9bBm5LAWXlPUZUm
	 jDmVN5sNVkentccBzh3zpkajILRjr8h5FJuZaBCojo+9ztRVHHTvSNHGfmzWjFdwNKE9s
	 4lgWsistV6NmKtTF8NPpuGsB7EaCWBTojswnVi6BLuvdA6JsOIaAMe/Gx52v2RlqTnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184468;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=1fOy90OHQPEb1/jnwGv/GzQOKu66Q8kh9k+Fu/KHPtU=;
	b=Hi++NKPOyx+5vt+aKelNYLrysQZ5Bu5TS73Fd2My1JgJ1oU/WE+CQNCG8YVuLy3cG26i
	 qOSVfdQ0J0ipv6cbkAyAC6A5GVK63Sd7iSuVq0FAgZsiFR6F6H6LAPkRV92pMm0JZjmgW
	 xdCVkUwcG6fuwFHr5C7+fqkBetTyEUtIhCs4JyuYBF/OHk5zm6JnYpFPrETP5Z/pygOn+
	 xs3jUo4WgtXOC3GBG90r8NEaKux9KNCYUBaq0/9aMdFiCPDI59j52+3U/1PUM1+/aOZ+k
	 hDGBktkOoZiQ3wkfo1OUGXf2UZW+HYruI4+IriivOzXLdH3fhgbKU6I2MDfdD1FkUlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EjxcS8qo;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6F1606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 10:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C6F1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EjxcS8qo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793184466; x=1824720466;
  h=date:from:to:cc:subject:message-id;
  bh=EUru4j42H96zxyqr9YyRamQMn8Wfi0sAf33w4rVUKTY=;
  b=EjxcS8qo0iibGaRPYLBl4Gajr5+fwX8TMqFaWkDHsQEtxrDlCSqvxkJQ
   5+efexXs47E98O85PbE0pU1j2rc11FeqVwJ7F+2rDZIO+cJgjCqnSAbiP
   JV2zgxS+8bVVs5AIgpHD5ke6fBeZL9FL+lBwLT8xh414oYy+7umqgm7Wo
   UUeuG9jswFrqnIsIszeTtl/L2U9thwuS0+Qkxqqmk1XcOpFNeobkH2WD3
   8ayCEvytyFdjzg3Zp3d4niXFOHWv0QpfDxaRl97iaYYFNjBrDoxS8cODZ
   XpC9FX8UH/txsXx0LTo60B5ZtPal1HOr5EbMe5wyh2U8iVHpaP5H69IlU
   Q==;
X-CSE-ConnectionGUID: w7LysMnMSAalI8xwSpwcBg==
X-CSE-MsgGUID: onHo2dtGT1iO+hrmTe6Lng==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="2005877"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="2005877"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 03:47:46 -0700
X-CSE-ConnectionGUID: U12NZK3LSKeNcC3tEtGt2g==
X-CSE-MsgGUID: teC11khXTiKLgL2r6kuX5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5204946"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 28 Oct 2026 03:47:45 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM1C2-000000004qD-3LXr;
	Wed, 28 Oct 2026 10:47:42 +0000
Date: Wed, 28 Oct 2026 11:47:35 +0100
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/large_folio 19/19] fs/f2fs/f2fs.h:38:25:
 error: implicit declaration of function 'set_sbi_flag'
Message-ID: <202610281158.BRcuPLy0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/large_folio
head:   5b72086892ee05798082621df69a27afeff2b233
commit: 6d9668b701d81625696253d7d736b79d7c704a13 [19/19] diff: fix patch 1
config: powerpc-randconfig-r2306-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281158.BRcuPLy0-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.3.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281158.BRcuPLy0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281158.BRcuPLy0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/inline.c:14:
   fs/f2fs/f2fs.h: In function 'f2fs_folio_has_ffs':
>> fs/f2fs/f2fs.h:38:25: error: implicit declaration of function 'set_sbi_flag' [-Wimplicit-function-declaration]
      38 |                         set_sbi_flag(sbi, SBI_NEED_FSCK);               \
         |                         ^~~~~~~~~~~~
   fs/f2fs/f2fs.h:2303:17: note: in expansion of macro 'f2fs_bug_on'
    2303 |                 f2fs_bug_on(F2FS_F_SB(folio), 1);
         |                 ^~~~~~~~~~~


vim +/set_sbi_flag +38 fs/f2fs/f2fs.h

734f0d241d2b4e Dave Chinner 2017-10-09  31  
5d56b6718a0f4e Jaegeuk Kim  2013-10-29  32  #ifdef CONFIG_F2FS_CHECK_FS
9850cf4a890888 Jaegeuk Kim  2014-09-02  33  #define f2fs_bug_on(sbi, condition)	BUG_ON(condition)
5d56b6718a0f4e Jaegeuk Kim  2013-10-29  34  #else
9850cf4a890888 Jaegeuk Kim  2014-09-02  35  #define f2fs_bug_on(sbi, condition)					\
9850cf4a890888 Jaegeuk Kim  2014-09-02  36  	do {								\
db48965264110d Yangtao Li   2020-12-01  37  		if (WARN_ON(condition))					\
caf0047e7e1e60 Chao Yu      2015-01-28 @38  			set_sbi_flag(sbi, SBI_NEED_FSCK);		\
9850cf4a890888 Jaegeuk Kim  2014-09-02  39  	} while (0)
5d56b6718a0f4e Jaegeuk Kim  2013-10-29  40  #endif
5d56b6718a0f4e Jaegeuk Kim  2013-10-29  41  

:::::: The code at line 38 was first introduced by commit
:::::: caf0047e7e1e60a7ad1d655d3b81b32e2dfb6095 f2fs: merge flags in struct f2fs_sb_info

:::::: TO: Chao Yu <chao2.yu@samsung.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
