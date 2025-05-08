Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AA61FE468
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 16:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746720562; cv=none; b=oj2NsdNSLhaRWQYS2/DI9X2fOJwc3uhuKkIdats2CLeVAKlshqU9aJ3fni1Ij58hHecXRwez2LmgtPZE7qYoXTZtROkQDBAS70ZvkZAQ26/4oSuJdE3TptPeK6poHI8ssjhFBCrgoeL28FPWnU6tXuiVetbo/O64wxdEbS2g2gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746720562; c=relaxed/simple;
	bh=qAYD3W3axVhkiVDqJ31ELM4e6zI8ZCKep81pzvvEK9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A0W3yNU4jYRMIVTjvBYsCkqfq5vPpZrGqFqfpIJn2CJX6pib1ujm0N3S3kBBsP38tIVqFkmoXvP/48txSUm26JATnaaO3QWlog7tDUliH70avGRmahiToVuI6ghFhvYh0+uljz6U0XSMiN7GkvTHKU8yaUuRrU2ww5ClLEcBH3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9qRGN8Z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9qRGN8Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746720560; x=1778256560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qAYD3W3axVhkiVDqJ31ELM4e6zI8ZCKep81pzvvEK9E=;
  b=i9qRGN8ZaBgYqdTEqTpSQk1X9fWvb0n3g73m0cYXA5XYUO3KYbyd07Wx
   x7VLUvv0a1QCdJvHbGcCi/++nEXcUHa6af+dX+OAFx1yRTouvaFLkovsv
   MokjpflmwiDitF/APbHxCc4hCME9uWY6Swi9MSv46Yit8q1wOE/yhKRnj
   J1/GxMXkPZBqU5vqYcjZlBNRmouidqIjfSW56kmOoLstapmaqASncgvw0
   Ltbaih5yQ8nSKwmkylqGLa9SUWJXPeoW9XoIVGyhh1G6gAeW1U0UEfZbI
   /LpyP64moFHe18u5sl1bIrcHOHnJC84Qshi5RbqODMoodlJDjVEaLmQIH
   g==;
X-CSE-ConnectionGUID: 3DcUrZYgSNOxt7alXtsh5w==
X-CSE-MsgGUID: FD9Hs+2LRYa1RI0jZ8HtUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="58727566"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="58727566"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 09:09:18 -0700
X-CSE-ConnectionGUID: 5CXyNkcBRreZPHIM40ymnA==
X-CSE-MsgGUID: UR1fYFv5Q02RtE9YUBY+KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="141551068"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 May 2025 09:09:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uD3oB-000B8j-0i;
	Thu, 08 May 2025 16:09:15 +0000
Date: Fri, 9 May 2025 00:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 3/9] fs/f2fs/f2fs.h:2100:57: warning: passing
 argument 1 of 'F2FS_F_SB' discards 'const' qualifier from pointer target
 type
Message-ID: <202505082325.cdp0LYj9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   2860d2a634860b83a27a71e5db3c2c416a59008a
commit: a14b19bd94199c525031bdc63821ab086f4c70bf [3/9] f2fs: introduce is_{meta,node}_folio
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250508/202505082325.cdp0LYj9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505082325.cdp0LYj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505082325.cdp0LYj9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:13:
   fs/f2fs/f2fs.h: In function 'is_meta_folio':
>> fs/f2fs/f2fs.h:2100:57: warning: passing argument 1 of 'F2FS_F_SB' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2100 |         return folio->mapping == META_MAPPING(F2FS_F_SB(folio));
         |                                                         ^~~~~
   fs/f2fs/f2fs.h:2023:60: note: expected 'struct folio *' but argument is of type 'const struct folio *'
    2023 | static inline struct f2fs_sb_info *F2FS_F_SB(struct folio *folio)
         |                                              ~~~~~~~~~~~~~~^~~~~
   fs/f2fs/f2fs.h: In function 'is_node_folio':
   fs/f2fs/f2fs.h:2105:57: warning: passing argument 1 of 'F2FS_F_SB' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    2105 |         return folio->mapping == NODE_MAPPING(F2FS_F_SB(folio));
         |                                                         ^~~~~
   fs/f2fs/f2fs.h:2023:60: note: expected 'struct folio *' but argument is of type 'const struct folio *'
    2023 | static inline struct f2fs_sb_info *F2FS_F_SB(struct folio *folio)
         |                                              ~~~~~~~~~~~~~~^~~~~


vim +2100 fs/f2fs/f2fs.h

  2097	
  2098	static inline bool is_meta_folio(const struct folio *folio)
  2099	{
> 2100		return folio->mapping == META_MAPPING(F2FS_F_SB(folio));
  2101	}
  2102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
