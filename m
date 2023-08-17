Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6C42907
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 12:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692276380; x=1723812380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rF/aZh8Zi4ykXK/yTgNwLTPNe0I1ys2B55L4lYDkncw=;
  b=iiz7F9Vtgd8jZUD8a9l9GBg4cC+qeh0y+ynIe8HvdZLNSObzB8++Mf5v
   70O9MEJ34WNf3aukP3cMV5Z5anw0nwdBi6ggBP1oHzURw4DI5PRQE8Yty
   0UiV0B+yMjAqM59GKlo50N7rX9o/O0flZ6fmHBwWgiolQ9g7MV+zrRCyZ
   JKhN/S9Ps5y12Y4h1lsJYqRCP9IS/2bd8G9TbGfXHOsKEry2Tqc/lkHWy
   PhJ3/rPL/GGt93iE/h2Ltz8HJ/gyDKGalRjM7ensFAjP11IIn2f2eQIGa
   dmSvD3uXcEAUq9HRFofkBa72IPhjAQBptYcw1QpCPA106JjujJjZ/dM3m
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371704422"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="371704422"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 05:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="908394702"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="908394702"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Aug 2023 05:46:12 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWcOC-00018p-0Y;
	Thu, 17 Aug 2023 12:46:12 +0000
Date: Thu, 17 Aug 2023 20:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 2/2] fs/verity/enable.c:33:8:
 warning: assignment makes pointer from integer without a cast
Message-ID: <202308172024.ReHgzjow-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a89c7b9715e2d482a08b58b698f0cf37da373070
commit: e8676808abe2a4dd79bd76700719c360d84b343d [2/2] UPSTREAM: fsverity: don't drop pagecache at end of FS_IOC_ENABLE_VERITY
config: x86_64-buildonly-randconfig-r001-20230816 (https://download.01.org/0day-ci/archive/20230817/202308172024.ReHgzjow-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308172024.ReHgzjow-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308172024.ReHgzjow-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/verity/enable.c: In function 'read_file_data_page':
   fs/verity/enable.c:26:9: error: implicit declaration of function 'find_get_page_flags'; did you mean 'getname_flags'? [-Werror=implicit-function-declaration]
     page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
            ^~~~~~~~~~~~~~~~~~~
            getname_flags
   fs/verity/enable.c:26:53: error: 'FGP_ACCESSED' undeclared (first use in this function); did you mean 'FL_ACCESS'?
     page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
                                                        ^~~~~~~~~~~~
                                                        FL_ACCESS
   fs/verity/enable.c:26:53: note: each undeclared identifier is reported only once for each function it appears in
   fs/verity/enable.c:27:16: error: implicit declaration of function 'PageUptodate' [-Werror=implicit-function-declaration]
     if (!page || !PageUptodate(page)) {
                   ^~~~~~~~~~~~
   fs/verity/enable.c:29:4: error: implicit declaration of function 'put_page'; did you mean 'pgd_page'? [-Werror=implicit-function-declaration]
       put_page(page);
       ^~~~~~~~
       pgd_page
   fs/verity/enable.c:31:4: error: implicit declaration of function 'page_cache_sync_readahead'; did you mean 'pagecache_write_end'? [-Werror=implicit-function-declaration]
       page_cache_sync_readahead(filp->f_mapping, ra, filp,
       ^~~~~~~~~~~~~~~~~~~~~~~~~
       pagecache_write_end
   fs/verity/enable.c:33:10: error: implicit declaration of function 'read_mapping_page'; did you mean 'mapping_tagged'? [-Werror=implicit-function-declaration]
      page = read_mapping_page(filp->f_mapping, index, NULL);
             ^~~~~~~~~~~~~~~~~
             mapping_tagged
>> fs/verity/enable.c:33:8: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      page = read_mapping_page(filp->f_mapping, index, NULL);
           ^
   fs/verity/enable.c:37:6: error: implicit declaration of function 'PageReadahead'; did you mean '__NR_readahead'? [-Werror=implicit-function-declaration]
     if (PageReadahead(page))
         ^~~~~~~~~~~~~
         __NR_readahead
   fs/verity/enable.c:38:3: error: implicit declaration of function 'page_cache_async_readahead'; did you mean 'pagecache_write_end'? [-Werror=implicit-function-declaration]
      page_cache_async_readahead(filp->f_mapping, ra, filp, page,
      ^~~~~~~~~~~~~~~~~~~~~~~~~~
      pagecache_write_end
   cc1: some warnings being treated as errors


vim +33 fs/verity/enable.c

43005f9bdbe63b Eric Biggers 2019-07-22  15  
9630eacb1ee572 Eric Biggers 2020-01-06  16  /*
9630eacb1ee572 Eric Biggers 2020-01-06  17   * Read a file data page for Merkle tree construction.  Do aggressive readahead,
9630eacb1ee572 Eric Biggers 2020-01-06  18   * since we're sequentially reading the entire file.
9630eacb1ee572 Eric Biggers 2020-01-06  19   */
9630eacb1ee572 Eric Biggers 2020-01-06  20  static struct page *read_file_data_page(struct file *filp, pgoff_t index,
9630eacb1ee572 Eric Biggers 2020-01-06  21  					struct file_ra_state *ra,
9630eacb1ee572 Eric Biggers 2020-01-06  22  					unsigned long remaining_pages)
9630eacb1ee572 Eric Biggers 2020-01-06  23  {
9630eacb1ee572 Eric Biggers 2020-01-06  24  	struct page *page;
9630eacb1ee572 Eric Biggers 2020-01-06  25  
9630eacb1ee572 Eric Biggers 2020-01-06  26  	page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
9630eacb1ee572 Eric Biggers 2020-01-06  27  	if (!page || !PageUptodate(page)) {
9630eacb1ee572 Eric Biggers 2020-01-06  28  		if (page)
9630eacb1ee572 Eric Biggers 2020-01-06  29  			put_page(page);
9630eacb1ee572 Eric Biggers 2020-01-06  30  		else
9630eacb1ee572 Eric Biggers 2020-01-06  31  			page_cache_sync_readahead(filp->f_mapping, ra, filp,
9630eacb1ee572 Eric Biggers 2020-01-06  32  						  index, remaining_pages);
9630eacb1ee572 Eric Biggers 2020-01-06 @33  		page = read_mapping_page(filp->f_mapping, index, NULL);
9630eacb1ee572 Eric Biggers 2020-01-06  34  		if (IS_ERR(page))
9630eacb1ee572 Eric Biggers 2020-01-06  35  			return page;
9630eacb1ee572 Eric Biggers 2020-01-06  36  	}
9630eacb1ee572 Eric Biggers 2020-01-06  37  	if (PageReadahead(page))
9630eacb1ee572 Eric Biggers 2020-01-06  38  		page_cache_async_readahead(filp->f_mapping, ra, filp, page,
9630eacb1ee572 Eric Biggers 2020-01-06  39  					   index, remaining_pages);
9630eacb1ee572 Eric Biggers 2020-01-06  40  	return page;
9630eacb1ee572 Eric Biggers 2020-01-06  41  }
9630eacb1ee572 Eric Biggers 2020-01-06  42  

:::::: The code at line 33 was first introduced by commit
:::::: 9630eacb1ee572392628c4b96daa8031e84af56e fs-verity: implement readahead for FS_IOC_ENABLE_VERITY

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Jaegeuk Kim <jaegeuk@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
