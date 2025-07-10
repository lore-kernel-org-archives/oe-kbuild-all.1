Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54FF2882AB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Jul 2025 07:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752131912; cv=none; b=J9r7NBpMdtxsE1PzBb4xRpUBsWur+LCEU9/iAq8JgRJ4kqpo6ox/eunaln+WfeEmpo98eDA7qGWWjRpH9hVO83W/VjytgpzZAJ8SlGsBpYpCdPiGpXCZ11ZbC1h3Pi8pyd0cX2lJW7KvPiG/nUCX4QSLfNh9W6zDCyDBklACoMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752131912; c=relaxed/simple;
	bh=3DN4pKgaetx6w60UiqUaI5FlT4cSG/d2uDOewryM/k8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GxYGobxiUSKEe/8I8EkeosINlKaQr/+sTuXfDmZhAmAvHWgF2SJYNYtkfzhOUJyByrJvkGg6V6fV0BL17wXJ/HkLCVl4nqODQqgqkCx5NqMwni8JM9o/5CNf7rQqjvUju1tuCHEi44n6dFLys3okhdFocS7eO5Euliu3NM2evKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebibqrvz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebibqrvz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752131910; x=1783667910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3DN4pKgaetx6w60UiqUaI5FlT4cSG/d2uDOewryM/k8=;
  b=ebibqrvz0Ffh9V22vxwd4mF9LZfQnnGhWIMNeNlK1MF7WRdsm+TcOFOH
   7uqLtofEpTReub6mmog0uObpv+X0wBI/Ke9vBEh95cF6b+M7fzlr4+WwK
   7J4h+kJsjER/sZJfqAEbxOVk7rYJWRw43XQO9Rqt7F/aL6M6Oy/eyE04z
   azdN8iBTpXwhaYKwSOl3ucegwQlTX/caEx1jYOEsTqGw0A/BM6TiFtA8G
   PnIrLuZFfpoTzb5OZLr0vMCuBKv2+vGqcLpVYZPlPKbEW8av6t5j26FTy
   gzxWoBK34gSfHEp9f+izUthQBZuFACVEqm/FRiZOXkHOpy2JFgCmUwtbG
   A==;
X-CSE-ConnectionGUID: EYxwGOx5TreE7axR2loiBQ==
X-CSE-MsgGUID: 6A6dCpUeRg6kveZC9jkEvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65854741"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="65854741"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 00:18:30 -0700
X-CSE-ConnectionGUID: wjygWLF1RoqA/piQU+fS7Q==
X-CSE-MsgGUID: HU1/jqVATlGFg9vfrvM+Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; 
   d="scan'208";a="156727716"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jul 2025 00:18:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZlY1-0004f3-1u;
	Thu, 10 Jul 2025 07:18:25 +0000
Date: Thu, 10 Jul 2025 15:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 65/93] fs/f2fs/data.c:58:70: warning: passing
 argument 1 of 'fscrypt_pagecache_folio' discards 'const' qualifier from
 pointer target type
Message-ID: <202507101514.gTDqNbBm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   bc8610a18daa4a611d189374031fe1fa3c603423
commit: 9f506c758707749076b4ec2402007670c6f35558 [65/93] f2fs: Use a folio in f2fs_is_cp_guaranteed()
config: i386-buildonly-randconfig-001-20250710 (https://download.01.org/0day-ci/archive/20250710/202507101514.gTDqNbBm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250710/202507101514.gTDqNbBm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507101514.gTDqNbBm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/data.c: In function 'f2fs_is_cp_guaranteed':
>> fs/f2fs/data.c:58:70: warning: passing argument 1 of 'fscrypt_pagecache_folio' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      58 |                 return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
         |                                                                      ^~~~~
   In file included from fs/f2fs/f2fs.h:28,
                    from fs/f2fs/data.c:24:
   include/linux/fscrypt.h:527:67: note: expected 'struct folio *' but argument is of type 'const struct folio *'
     527 | static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)
         |                                                     ~~~~~~~~~~~~~~^~~~~~~~~~~~


vim +58 fs/f2fs/data.c

    49	
    50	bool f2fs_is_cp_guaranteed(const struct page *page)
    51	{
    52		const struct folio *folio = page_folio(page);
    53		struct address_space *mapping = folio->mapping;
    54		struct inode *inode;
    55		struct f2fs_sb_info *sbi;
    56	
    57		if (fscrypt_is_bounce_folio(folio))
  > 58			return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
    59	
    60		inode = mapping->host;
    61		sbi = F2FS_I_SB(inode);
    62	
    63		if (inode->i_ino == F2FS_META_INO(sbi) ||
    64				inode->i_ino == F2FS_NODE_INO(sbi) ||
    65				S_ISDIR(inode->i_mode))
    66			return true;
    67	
    68		if ((S_ISREG(inode->i_mode) && IS_NOQUOTA(inode)) ||
    69				folio_test_f2fs_gcing(folio))
    70			return true;
    71		return false;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
