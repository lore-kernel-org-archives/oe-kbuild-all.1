Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0657827A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Feb 2024 18:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709230503; cv=none; b=h1CWGjyqOEXWaDMkH2MvXjMGfb2N1nJJrunnnqYM2R6ThlDoRDSryzSx1iIRaukvllr3WANaf6Yelq7gXf0Sgg6ul12mZqxOD4luBRQKtjzIJr1voIsqE0jQQy8gAkL7TeJoUNNRD9vXlhm26aodLOYWcjNFNIEGFXSSY1WBQ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709230503; c=relaxed/simple;
	bh=Dx+VSuCS5teLDaCB87rR/M6ihsT1uX74yK803+iHzgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FroVwFKNy5PRnPEyrQsLHi3N2j6RrKtArMT+lagDdG7y/TQzCKNIYwb13Kfzfx51vnaeNq447eBL6POW5X4DnnjjbyWUj4Vx/KXPOIiAT9Nmm5lgWLrz/0n+fs9gXuo+7POJ5poz3j7NxhOd9cWkrcuxqnUpjvASfodZ0Vi7NVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfMAk22Q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfMAk22Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709230500; x=1740766500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dx+VSuCS5teLDaCB87rR/M6ihsT1uX74yK803+iHzgg=;
  b=QfMAk22QVpRHyTYBxjnz5vJpJqPdKAmSwoavITRGj0pHnyyQcnOdk+iW
   dYK/Q3UhKsI5enevxtAME0yxluta9cjg2uo9nM8mdrR682cTHB+kQ2z5J
   Tw1rnWUcyBu3aBq63gplS5AF5b/i638dcJrOTa3GXVEmsq+xPKQiUlBwA
   le6eylECPCe1nmggZ/hCMjaZHK0GVQxzcFl/EOeKPXarssjC0TOmOA1aW
   KkbGK7oLavlRlp/DF6EeC2r5vXRyX9iFnv7UT157lSPzP0A7mdSqYC5uz
   qdv458/oox93L6DNWxJjKu4MdLPOUp/GkSTuhH0vjjAROoI0BzJ/1QayT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14359369"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14359369"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 10:14:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="12465781"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Feb 2024 10:14:58 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfkvd-000DBD-2t;
	Thu, 29 Feb 2024 18:14:50 +0000
Date: Fri, 1 Mar 2024 02:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [linux-next:master 10211/11156] file.o:undefined reference to
 `__moddi3'
Message-ID: <202403010220.WelHZqIi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chao,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f303a3e2bcfba900efb5aee55236d17030e9f882
commit: 5fa6a97d27842dab159344dcba824dcb8afbdde0 [10211/11156] f2fs: introduce SEGS_TO_BLKS/BLKS_TO_SEGS for cleanup
config: microblaze-randconfig-r022-20220915 (https://download.01.org/0day-ci/archive/20240301/202403010220.WelHZqIi-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010220.WelHZqIi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010220.WelHZqIi-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: fs/f2fs/file.o: in function `has_not_enough_free_secs.constprop.0':
>> file.o:(.text+0x820c): undefined reference to `__moddi3'
>> microblaze-linux-ld: file.o:(.text+0x8228): undefined reference to `__moddi3'
>> microblaze-linux-ld: file.o:(.text+0x8244): undefined reference to `__divdi3'
   microblaze-linux-ld: file.o:(.text+0x8264): undefined reference to `__divdi3'
   microblaze-linux-ld: fs/f2fs/file.o: in function `f2fs_defragment_range':
>> file.o:(.text+0x97d0): undefined reference to `__divdi3'
   microblaze-linux-ld: fs/f2fs/inode.o: in function `has_not_enough_free_secs.constprop.0':
>> inode.o:(.text+0x1328): undefined reference to `__moddi3'
>> microblaze-linux-ld: inode.o:(.text+0x1344): undefined reference to `__moddi3'
>> microblaze-linux-ld: inode.o:(.text+0x1360): undefined reference to `__divdi3'
   microblaze-linux-ld: inode.o:(.text+0x1380): undefined reference to `__divdi3'
   microblaze-linux-ld: fs/f2fs/namei.o: in function `has_not_enough_free_secs.constprop.0':
>> namei.o:(.text+0x1924): undefined reference to `__moddi3'
>> microblaze-linux-ld: namei.o:(.text+0x1940): undefined reference to `__moddi3'
>> microblaze-linux-ld: namei.o:(.text+0x195c): undefined reference to `__divdi3'
   microblaze-linux-ld: namei.o:(.text+0x197c): undefined reference to `__divdi3'
   microblaze-linux-ld: fs/f2fs/gc.o: in function `has_not_enough_free_secs.constprop.0':
>> gc.o:(.text+0x4874): undefined reference to `__moddi3'
>> microblaze-linux-ld: gc.o:(.text+0x4890): undefined reference to `__moddi3'
>> microblaze-linux-ld: gc.o:(.text+0x48ac): undefined reference to `__divdi3'
   microblaze-linux-ld: gc.o:(.text+0x48c8): undefined reference to `__divdi3'
   microblaze-linux-ld: fs/f2fs/gc.o: in function `f2fs_gc':
>> (.text+0x721c): undefined reference to `__divdi3'
   microblaze-linux-ld: (.text+0x723c): undefined reference to `__divdi3'
   microblaze-linux-ld: (.text+0x7260): undefined reference to `__moddi3'
   microblaze-linux-ld: (.text+0x7308): undefined reference to `__moddi3'
   microblaze-linux-ld: fs/f2fs/data.o: in function `has_not_enough_free_secs.constprop.0':
>> data.o:(.text+0x33e0): undefined reference to `__moddi3'
>> microblaze-linux-ld: data.o:(.text+0x33fc): undefined reference to `__moddi3'
>> microblaze-linux-ld: data.o:(.text+0x3418): undefined reference to `__divdi3'
   microblaze-linux-ld: data.o:(.text+0x3438): undefined reference to `__divdi3'
   microblaze-linux-ld: fs/f2fs/segment.o: in function `has_not_enough_free_secs.constprop.0':
>> segment.o:(.text+0xda14): undefined reference to `__moddi3'
>> microblaze-linux-ld: segment.o:(.text+0xda30): undefined reference to `__moddi3'
>> microblaze-linux-ld: segment.o:(.text+0xda4c): undefined reference to `__divdi3'
   microblaze-linux-ld: segment.o:(.text+0xda68): undefined reference to `__divdi3'
   microblaze-linux-ld: fs/f2fs/xattr.o: in function `has_not_enough_free_secs.constprop.0':
   xattr.o:(.text+0x1914): undefined reference to `__moddi3'
   microblaze-linux-ld: xattr.o:(.text+0x1930): undefined reference to `__moddi3'
   microblaze-linux-ld: xattr.o:(.text+0x194c): undefined reference to `__divdi3'
   microblaze-linux-ld: xattr.o:(.text+0x196c): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
