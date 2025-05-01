Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D785922541F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 May 2025 21:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746133370; cv=none; b=Da+DLC+a/yihP8ImepLF0LLgoclJQb9+KGMomG3eUnEv5Se1R9mcHobAgRzL0F+Cwbl140+5QuJWXa5m4GdJCP9cH+HIXdF/ZacQME7i2e7xASd1KfbbARirsS1UkhD+BrQG533gUgJmHY/uXhZP3JqZPmjU4nW1BJYRrTgOkuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746133370; c=relaxed/simple;
	bh=tRJ/hZ0d657PRZp/vSYcoWfc6LlWFh8qxyPETwNxzic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uG9iMfeFj+lDzLMNgVCmVW8SzOM9v3iWllcLiSljTf5CeB8ELcrR/nHQSUFo/R2nvt+yxvbzeFYLPg2usbT+n1xefo9qxMfFz/vxyDGRXAaIFZkMt2B15K8OHWlhvz+PH31R6/mkbnMQVUcXxcEjXOb82+SLKk4U9D1RxQHGAIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNGF16Zs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNGF16Zs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746133367; x=1777669367;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tRJ/hZ0d657PRZp/vSYcoWfc6LlWFh8qxyPETwNxzic=;
  b=jNGF16ZsshgelamC5BCXr3mLZ0NloyGyW31XWOCGyeaWbY0ajR6OHvOo
   bnPeO+1EzR5AxtqVNGkJFjf00t6eIjnzoQpV/OCerK1d9973hV+MYwn7y
   b1XhV/PC6FrV+t0nogp7TFLQzv4jlPwbk3QoWpF9bwSMBFqjpZa1gPHW2
   U+8w6trcLz+gFkEnG00KUVIr64t0SmnmmbMWK9TOMxFsi3XyPLcMKVxQA
   Na41uxyCXAo4bJ07w+LeXrXqGHRoY5hmMKrKfqQKXwEksp+DAkXGlsYJ2
   B6xtQQsDe8jKxchpy67v9CF8vCzm7WbiT+bjFtyxhmkZOY5h50G8Bvv1m
   w==;
X-CSE-ConnectionGUID: zf2hWQ4ySKa5HC/mssxeKQ==
X-CSE-MsgGUID: a107mLptS+GddvWK0k9PXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="50474261"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="50474261"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 14:02:47 -0700
X-CSE-ConnectionGUID: rzGAdIDXQiGCx7DdOs13rA==
X-CSE-MsgGUID: eKdCYQWjR2qbubT8M5MEBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="157706922"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 May 2025 14:02:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAb3L-0004OT-2c;
	Thu, 01 May 2025 21:02:43 +0000
Date: Fri, 2 May 2025 05:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Shivank Garg <shivankg@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 272/272] include/linux/stddef.h:8:14: error:
 called object is not a function or function pointer
Message-ID: <202505020405.YzD9aNCo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   ea17e4fdc13cae144d90ce8561c2f50a49492037
commit: ea17e4fdc13cae144d90ce8561c2f50a49492037 [272/272] jfs: implement migrate_folio for jfs_metapage_aops
config: arm-randconfig-002-20250502 (https://download.01.org/0day-ci/archive/20250502/202505020405.YzD9aNCo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020405.YzD9aNCo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020405.YzD9aNCo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5:0,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/blkdev.h:8,
                    from fs/jfs/jfs_metapage.c:7:
   fs/jfs/jfs_metapage.c: In function '__metapage_migrate_folio':
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
    #define NULL ((void *)0)
                 ^
   include/linux/pagemap.h:1234:31: note: in expansion of macro 'NULL'
    #define filemap_migrate_folio NULL
                                  ^~~~
   fs/jfs/jfs_metapage.c:238:7: note: in expansion of macro 'filemap_migrate_folio'
     rc = filemap_migrate_folio(mapping, dst, src, mode);
          ^~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_metapage.c: In function 'metapage_migrate_folio':
>> include/linux/stddef.h:8:14: error: called object is not a function or function pointer
    #define NULL ((void *)0)
                 ^
   include/linux/pagemap.h:1234:31: note: in expansion of macro 'NULL'
    #define filemap_migrate_folio NULL
                                  ^~~~
   fs/jfs/jfs_metapage.c:641:10: note: in expansion of macro 'filemap_migrate_folio'
      return filemap_migrate_folio(mapping, dst, src, mode);
             ^~~~~~~~~~~~~~~~~~~~~


vim +8 include/linux/stddef.h

^1da177e4c3f415 Linus Torvalds   2005-04-16  6  
^1da177e4c3f415 Linus Torvalds   2005-04-16  7  #undef NULL
^1da177e4c3f415 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
6e2182874324727 Richard Knutsson 2006-09-30  9  

:::::: The code at line 8 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
