Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637938;
	b=GTRHq6sCzB6MzrmyXDcEGgNRYw+mrV8eZf3wLFD2KJGbPrOxxCXY8vIST55gfp0wHkuK
	 ItISbQoBNK66KtgFbnHX9495VyMII2E12TlwzvIPezVNIn8dGd+jeOEg76OYIrVzMLwZr
	 tvRmbetncwxPBiFZMEZRtlQ1tOFz238iGGoSDOj6hnvfvwPMIAf/wCiPA6b4TBGk9SPkh
	 kAh/WNCQrUQuTA/4iUoiY+n9XmboKzifjg+ZaoGCpYDiWrvOMr5QiUcpMe1FY48EbT52a
	 ddian8EBYdjs6STrg93vT+4xuX9iatA2V3KGXnrB5fngSb/m3oaG8dx41bRAvrgG/ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637938;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=PEpwT2QM5icp9uTZTtpjpAFOgvNE2SJNmr4ccohK1T0=;
	b=lIVkpIgVeAzh4cGGppwpMNytzmYoxBtLHPAq7mWn7mOmRtayKsW62SGCMnzZQoXNy+IH
	 iRvNIEAJqAuvYt/8WJAxQReeXG4bJUDDk2PKTD6OhfXXNOilyQViOGJOiKqAVl2v3+1Rj
	 pX65E4RKg/1Gca/DifbHpsEDZRYqIBumG8VcUhOyTXXh/2z6rDPhdqRmsPvGqNcRW99Ga
	 J4jYs6rOiIhO+zAIWlDE3kN5bbtgqCs1gtTaJQ+6L1NlKZp5ClwXYiwa51kGCjMEszTUO
	 D7rxLCI2sFxwR38j6Er0LJQiePO4xpFmVyR4pHIlOSS3l7css3H9E1SSFq9rxracTvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ALz3l4hp;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D4D606BA7A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 16:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53D4D606BA7A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ALz3l4hp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793637937; x=1825173937;
  h=date:from:to:cc:subject:message-id;
  bh=CBiN8pbljrIbZ+FMjLyjd3/pQE0AjpWhh74n8DBwc+U=;
  b=ALz3l4hpVjTg47HaYbek8DIVonz/vWe3JDl1vGgqzIhOxipc1sbQS6Vo
   uydgvB/Vb18ThZNjdNp1IJ4qJ8mbVOJM2jybD4CvujmbD7RojfAIXtKvi
   nJb7FMwjgdz4TwBAA/nJicYB6thRthXNoLGYOcy3LZ/kXhuPO0JCPdvci
   4vT1MnEKkCvKpeCEtN8WyW+MgZtaBpfNefiV4cDg9vS8jz2gX5842+EZX
   oC7Cv4WctVmc/RU9D7a7tB3QRrznh8BBer6Gs+ytEJy/u8iCwEa+Tq05K
   nvCbjbIjtTkU6rQVtVriPPTPnI9qmc/cY6rMKs3o5xI1lUWSDeZ6JD4QJ
   A==;
X-CSE-ConnectionGUID: 3JKcRihPT1CpNjP1uVMraQ==
X-CSE-MsgGUID: Fxj94+juQV62Z/3YGouaXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2343260"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2343260"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 08:45:36 -0800
X-CSE-ConnectionGUID: MFWwQvS1Rdm53SswvyKvDg==
X-CSE-MsgGUID: y4ozS+zvQ1SY/2vVHHilLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6084984"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Nov 2026 08:45:35 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNvA5-00000000hOG-1aCW;
	Mon, 02 Nov 2026 16:45:33 +0000
Date: Tue, 03 Nov 2026 00:44:46 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/large_folio_v7+ 16/22] fs/f2fs/f2fs.h:38:4:
 error: implicit declaration of function 'set_sbi_flag'
Message-ID: <202611030026.IrATzcvn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/large_folio_v7+
head:   5b72086892ee05798082621df69a27afeff2b233
commit: 70ebe88955b4db7e829c8a27938bcce16c5a2686 [16/22] diff: fix patch 1
config: nios2-randconfig-1001-20261102 (https://download.01.org/0day-ci/archive/20261103/202611030026.IrATzcvn-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611030026.IrATzcvn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611030026.IrATzcvn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/inode.c:17:
   fs/f2fs/f2fs.h: In function 'f2fs_folio_has_ffs':
>> fs/f2fs/f2fs.h:38:4: error: implicit declaration of function 'set_sbi_flag' [-Werror=implicit-function-declaration]
      38 |    set_sbi_flag(sbi, SBI_NEED_FSCK);  \
         |    ^~~~~~~~~~~~
   fs/f2fs/f2fs.h:2303:3: note: in expansion of macro 'f2fs_bug_on'
    2303 |   f2fs_bug_on(F2FS_F_SB(folio), 1);
         |   ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/set_sbi_flag +38 fs/f2fs/f2fs.h

734f0d241d2b4e4 Dave Chinner 2017-10-09  31  
5d56b6718a0f4e5 Jaegeuk Kim  2013-10-29  32  #ifdef CONFIG_F2FS_CHECK_FS
9850cf4a8908886 Jaegeuk Kim  2014-09-02  33  #define f2fs_bug_on(sbi, condition)	BUG_ON(condition)
5d56b6718a0f4e5 Jaegeuk Kim  2013-10-29  34  #else
9850cf4a8908886 Jaegeuk Kim  2014-09-02  35  #define f2fs_bug_on(sbi, condition)					\
9850cf4a8908886 Jaegeuk Kim  2014-09-02  36  	do {								\
db48965264110dd Yangtao Li   2020-12-01  37  		if (WARN_ON(condition))					\
caf0047e7e1e60a Chao Yu      2015-01-28 @38  			set_sbi_flag(sbi, SBI_NEED_FSCK);		\
9850cf4a8908886 Jaegeuk Kim  2014-09-02  39  	} while (0)
5d56b6718a0f4e5 Jaegeuk Kim  2013-10-29  40  #endif
5d56b6718a0f4e5 Jaegeuk Kim  2013-10-29  41  

:::::: The code at line 38 was first introduced by commit
:::::: caf0047e7e1e60a7ad1d655d3b81b32e2dfb6095 f2fs: merge flags in struct f2fs_sb_info

:::::: TO: Chao Yu <chao2.yu@samsung.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
