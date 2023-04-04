Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA5E638
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 04:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680581161; x=1712117161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HrQV0m7aEFGl65/5WNUGfsnlitj1Omkha8MzHGau8sg=;
  b=VmDkPjHKt8ogLPqbHv8r5GHuA6RENGQNQLuHXC7hoDdCV6c6McRBCfCb
   21marIrTWQEwjikGz8kDN1nDjpdzlO9EIyFtbBgr8KZOrAzAO6f9bScpb
   +uo+QQxwXWLQPwihHvs9JkrpRDMJk53SF8heoJh12lYNlpUx8aC+naJhK
   fIfigJxHuVSR223FIc+IHgX+lZmKce9DyUUxU3m/9xA7gKhgiWr8fTh9i
   LaO/71DCBBDwxY8Gcl8BrRDEFenNc6xEbWiU3zyJGwOq+zeJnZ2G1+r0g
   6RHL/2PH5JFpEzCWvczEDJfkO0JVjBrD60FhRRkKocceczG1bjKQ2aY52
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="343783356"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="343783356"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 21:06:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="797363479"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="797363479"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2023 21:06:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjXvj-000P9U-1x;
	Tue, 04 Apr 2023 04:05:59 +0000
Date: Tue, 4 Apr 2023 12:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 2/2] fs/verity/enable.c:26:16:
 error: implicit declaration of function 'find_get_page_flags'
Message-ID: <202304041149.OVu2XwxA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   e8676808abe2a4dd79bd76700719c360d84b343d
commit: e8676808abe2a4dd79bd76700719c360d84b343d [2/2] UPSTREAM: fsverity: don't drop pagecache at end of FS_IOC_ENABLE_VERITY
config: x86_64-randconfig-a016-20230403 (https://download.01.org/0day-ci/archive/20230404/202304041149.OVu2XwxA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout e8676808abe2a4dd79bd76700719c360d84b343d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/verity/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041149.OVu2XwxA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/verity/enable.c: In function 'read_file_data_page':
>> fs/verity/enable.c:26:16: error: implicit declaration of function 'find_get_page_flags' [-Werror=implicit-function-declaration]
      26 |         page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
         |                ^~~~~~~~~~~~~~~~~~~
>> fs/verity/enable.c:26:60: error: 'FGP_ACCESSED' undeclared (first use in this function); did you mean 'FL_ACCESS'?
      26 |         page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
         |                                                            ^~~~~~~~~~~~
         |                                                            FL_ACCESS
   fs/verity/enable.c:26:60: note: each undeclared identifier is reported only once for each function it appears in
>> fs/verity/enable.c:27:23: error: implicit declaration of function 'PageUptodate' [-Werror=implicit-function-declaration]
      27 |         if (!page || !PageUptodate(page)) {
         |                       ^~~~~~~~~~~~
>> fs/verity/enable.c:29:25: error: implicit declaration of function 'put_page'; did you mean 'pgd_page'? [-Werror=implicit-function-declaration]
      29 |                         put_page(page);
         |                         ^~~~~~~~
         |                         pgd_page
>> fs/verity/enable.c:31:25: error: implicit declaration of function 'page_cache_sync_readahead' [-Werror=implicit-function-declaration]
      31 |                         page_cache_sync_readahead(filp->f_mapping, ra, filp,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/verity/enable.c:33:24: error: implicit declaration of function 'read_mapping_page' [-Werror=implicit-function-declaration]
      33 |                 page = read_mapping_page(filp->f_mapping, index, NULL);
         |                        ^~~~~~~~~~~~~~~~~
>> fs/verity/enable.c:33:22: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      33 |                 page = read_mapping_page(filp->f_mapping, index, NULL);
         |                      ^
>> fs/verity/enable.c:37:13: error: implicit declaration of function 'PageReadahead' [-Werror=implicit-function-declaration]
      37 |         if (PageReadahead(page))
         |             ^~~~~~~~~~~~~
>> fs/verity/enable.c:38:17: error: implicit declaration of function 'page_cache_async_readahead' [-Werror=implicit-function-declaration]
      38 |                 page_cache_async_readahead(filp->f_mapping, ra, filp, page,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/find_get_page_flags +26 fs/verity/enable.c

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
9630eacb1ee572 Eric Biggers 2020-01-06 @26  	page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
9630eacb1ee572 Eric Biggers 2020-01-06 @27  	if (!page || !PageUptodate(page)) {
9630eacb1ee572 Eric Biggers 2020-01-06  28  		if (page)
9630eacb1ee572 Eric Biggers 2020-01-06 @29  			put_page(page);
9630eacb1ee572 Eric Biggers 2020-01-06  30  		else
9630eacb1ee572 Eric Biggers 2020-01-06 @31  			page_cache_sync_readahead(filp->f_mapping, ra, filp,
9630eacb1ee572 Eric Biggers 2020-01-06  32  						  index, remaining_pages);
9630eacb1ee572 Eric Biggers 2020-01-06 @33  		page = read_mapping_page(filp->f_mapping, index, NULL);
9630eacb1ee572 Eric Biggers 2020-01-06  34  		if (IS_ERR(page))
9630eacb1ee572 Eric Biggers 2020-01-06  35  			return page;
9630eacb1ee572 Eric Biggers 2020-01-06  36  	}
9630eacb1ee572 Eric Biggers 2020-01-06 @37  	if (PageReadahead(page))
9630eacb1ee572 Eric Biggers 2020-01-06 @38  		page_cache_async_readahead(filp->f_mapping, ra, filp, page,
9630eacb1ee572 Eric Biggers 2020-01-06  39  					   index, remaining_pages);
9630eacb1ee572 Eric Biggers 2020-01-06  40  	return page;
9630eacb1ee572 Eric Biggers 2020-01-06  41  }
9630eacb1ee572 Eric Biggers 2020-01-06  42  

:::::: The code at line 26 was first introduced by commit
:::::: 9630eacb1ee572392628c4b96daa8031e84af56e fs-verity: implement readahead for FS_IOC_ENABLE_VERITY

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Jaegeuk Kim <jaegeuk@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
