Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794084074;
	b=C7unmykhdO9BqIGYApG5YfPQBAV2i+wOexwOmBOD94uPw6apU4LE6G+jWT/JV2cjwU4r
	 MZ7dVFNffvkKz22xRU5bCRZAmZB7NTAih6zoBNcKqjV2TTu6POZNeuRPVgU302pjJXXBI
	 eovXIkc4h42AKA2sxrtiKKhwY/zoJku3ZPAQY+KaqnUH0pqD700R+USFimbFIHnrxFkXj
	 gfGVaB5tTJisvY7bkYMTR+jRQaApHd4/yvpMiKBUWHStbgrewQWTMAkdST2TjBL5xQW7x
	 8MydgKttJK4k/5QN8ZSqEAkcYcjpcYJuZy6ZvWKCP1et4mDpSnZJINpro0h9DNcik8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794084074;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=jO2ZsXnacgRi+v+aS0TvnHr7XhD6L4aQvrH46nA46xQ=;
	b=X/ikaBBuwF0d+CFoHm9XkMnAlMXBOEbbOE28lp3zyp+kSi7lUT71kZ9z4Oa0x+rlUtR8
	 FmJ+wmm/Yora7YWeYefv9vSgWkXaCKSNyruDHocwtBi3xyxaZ75bnSkfs9J0GQuZwD1rb
	 xlaD4JcHDh3jw/j2PmyetQxEMuDEVKv5buFfZ/LDeE25FqqIDUKG+1lcHqREcIXCWBJKa
	 z2q9o9c802q6o+kYxlkusE2H3QVUSaZJxyBUGk47LEulLyHSywlpFkSxYuFJgRzk1fxWP
	 sotQlgrqbIRuGxAbFAkXAmcJppKW0nu1FmjJJKZDkkF6cTYG3sZBjd8rmDqs5wfQheg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nRPSVTJS;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85119606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 20:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85119606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nRPSVTJS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794084073; x=1825620073;
  h=date:from:to:cc:subject:message-id;
  bh=FcqMAz6GUS1j2/mMaznQ19ayW2ww+EsCa1sOPKS+kRs=;
  b=nRPSVTJSlz5Idr66F58kJ5XnkdwmgZcZkXqy5XaYiXROizZBLkQ8c5A7
   EQJwQB52NhOv7+53RiSQIV6wTUbip/PIGo/NWmYXyu1QWKSuAzQgIRCzk
   S2nxrYBbyOnNbGumV27u1HmhENTY3pp3mRpgWEwYnfJki/imXEJP62tZJ
   pZPdPeiK+Kgkqzw3RP1+1K/8DlZju5UkFrzwgdN8SY68QK6xWnaEG3ggg
   Ga9opPgoq8DelFqrvxno8kqwi60OaTBRbFe63AkkALWdxxIzotBbpmUhU
   v6tHK+4eK2OOt1Fhgs4+jJMXMUzqLzkX1ch6gQF0dOg0J7SC/J+WuL7LA
   g==;
X-CSE-ConnectionGUID: BdbeUnPaQ/6JerOASLAADQ==
X-CSE-MsgGUID: BUgxmI9tSdCprd2WeoOi4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2767582"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2767582"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 12:41:12 -0800
X-CSE-ConnectionGUID: Nlv5zUirSGifXHP4pggHqg==
X-CSE-MsgGUID: tr9t+gCtRLG/avuPjbbEZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7439360"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Nov 2026 12:41:10 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPnDo-00000000rY7-2nXB;
	Sat, 07 Nov 2026 20:41:08 +0000
Date: Sun, 08 Nov 2026 04:40:41 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 82/154] Warning:
 drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a
 kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
Message-ID: <202611080447.svqovs3O-lkp@intel.com>
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
commit: fe682a7e38127b167e7b986947eea83f9cd52c5c [82/154] net: ethtool: report PHY firmware version in PHY_GET
config: powerpc-randconfig-1000-20261108 (https://download.01.org/0day-ci/archive/20261108/202611080447.svqovs3O-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080447.svqovs3O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080447.svqovs3O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/phy/mxl-gpy.c:588 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * in some cases the GPY211 will link up but not RX packets

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
