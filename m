Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12257C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Apr 2023 04:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680582423; x=1712118423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pSsqGBhc7A0Vz1s9ydbJ+eUnJOoMx1+immUxmLgKUJE=;
  b=bAyEHpYI6qbspLb0FBPkMZxtO80WG3l0rRBUb0noVCtToTXdadq8VaUU
   9UcvoD0tlZ5EjC7OjX3mURLkJ6Y1fZppzPriRp3GP8kjeqsEJOwXg/yE+
   CNXn66vpmPJneHso3ObpM6yw+6eoEY2AU9KjI1hu4Q/g/C9YtUrxXa9lm
   bC+KK7KJ5+KDg36EgRMGMHJ2JAvwVcpHKOA63I36GpK0zExqUSDgbPRdn
   zj+qbQ5U2MqSYQXOeZTYSbDvIlsmWbCgQK5MGC7TnJRH1mCcpSMsqjixX
   gmP6GueL7y0G/e4ypf47SYhIzhep7L2JsRZbwOmeYI7c0OwGHUXOTPNq/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="369897088"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="369897088"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 21:27:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="688744527"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; 
   d="scan'208";a="688744527"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 03 Apr 2023 21:27:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjYG5-000PBL-21;
	Tue, 04 Apr 2023 04:27:01 +0000
Date: Tue, 4 Apr 2023 12:26:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 2/2] fs/verity/enable.c:26:9:
 error: implicit declaration of function 'find_get_page_flags'
Message-ID: <202304041242.uxe5ITCa-lkp@intel.com>
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
config: x86_64-randconfig-a003-20230403 (https://download.01.org/0day-ci/archive/20230404/202304041242.uxe5ITCa-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout e8676808abe2a4dd79bd76700719c360d84b343d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/verity/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304041242.uxe5ITCa-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/verity/enable.c:26:9: error: implicit declaration of function 'find_get_page_flags' [-Werror,-Wimplicit-function-declaration]
           page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
                  ^
>> fs/verity/enable.c:26:53: error: use of undeclared identifier 'FGP_ACCESSED'
           page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
                                                              ^
>> fs/verity/enable.c:27:16: error: implicit declaration of function 'PageUptodate' [-Werror,-Wimplicit-function-declaration]
           if (!page || !PageUptodate(page)) {
                         ^
>> fs/verity/enable.c:29:4: error: implicit declaration of function 'put_page' [-Werror,-Wimplicit-function-declaration]
                           put_page(page);
                           ^
>> fs/verity/enable.c:31:4: error: implicit declaration of function 'page_cache_sync_readahead' [-Werror,-Wimplicit-function-declaration]
                           page_cache_sync_readahead(filp->f_mapping, ra, filp,
                           ^
>> fs/verity/enable.c:33:10: error: implicit declaration of function 'read_mapping_page' [-Werror,-Wimplicit-function-declaration]
                   page = read_mapping_page(filp->f_mapping, index, NULL);
                          ^
>> fs/verity/enable.c:33:8: warning: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
                   page = read_mapping_page(filp->f_mapping, index, NULL);
                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/verity/enable.c:37:6: error: implicit declaration of function 'PageReadahead' [-Werror,-Wimplicit-function-declaration]
           if (PageReadahead(page))
               ^
>> fs/verity/enable.c:38:3: error: implicit declaration of function 'page_cache_async_readahead' [-Werror,-Wimplicit-function-declaration]
                   page_cache_async_readahead(filp->f_mapping, ra, filp, page,
                   ^
   fs/verity/enable.c:108:3: error: implicit declaration of function 'put_page' [-Werror,-Wimplicit-function-declaration]
                   put_page(src_page);
                   ^
   1 warning and 9 errors generated.


vim +/find_get_page_flags +26 fs/verity/enable.c

43005f9bdbe63b4 Eric Biggers 2019-07-22  15  
9630eacb1ee5723 Eric Biggers 2020-01-06  16  /*
9630eacb1ee5723 Eric Biggers 2020-01-06  17   * Read a file data page for Merkle tree construction.  Do aggressive readahead,
9630eacb1ee5723 Eric Biggers 2020-01-06  18   * since we're sequentially reading the entire file.
9630eacb1ee5723 Eric Biggers 2020-01-06  19   */
9630eacb1ee5723 Eric Biggers 2020-01-06  20  static struct page *read_file_data_page(struct file *filp, pgoff_t index,
9630eacb1ee5723 Eric Biggers 2020-01-06  21  					struct file_ra_state *ra,
9630eacb1ee5723 Eric Biggers 2020-01-06  22  					unsigned long remaining_pages)
9630eacb1ee5723 Eric Biggers 2020-01-06  23  {
9630eacb1ee5723 Eric Biggers 2020-01-06  24  	struct page *page;
9630eacb1ee5723 Eric Biggers 2020-01-06  25  
9630eacb1ee5723 Eric Biggers 2020-01-06 @26  	page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
9630eacb1ee5723 Eric Biggers 2020-01-06 @27  	if (!page || !PageUptodate(page)) {
9630eacb1ee5723 Eric Biggers 2020-01-06  28  		if (page)
9630eacb1ee5723 Eric Biggers 2020-01-06 @29  			put_page(page);
9630eacb1ee5723 Eric Biggers 2020-01-06  30  		else
9630eacb1ee5723 Eric Biggers 2020-01-06 @31  			page_cache_sync_readahead(filp->f_mapping, ra, filp,
9630eacb1ee5723 Eric Biggers 2020-01-06  32  						  index, remaining_pages);
9630eacb1ee5723 Eric Biggers 2020-01-06 @33  		page = read_mapping_page(filp->f_mapping, index, NULL);
9630eacb1ee5723 Eric Biggers 2020-01-06  34  		if (IS_ERR(page))
9630eacb1ee5723 Eric Biggers 2020-01-06  35  			return page;
9630eacb1ee5723 Eric Biggers 2020-01-06  36  	}
9630eacb1ee5723 Eric Biggers 2020-01-06 @37  	if (PageReadahead(page))
9630eacb1ee5723 Eric Biggers 2020-01-06 @38  		page_cache_async_readahead(filp->f_mapping, ra, filp, page,
9630eacb1ee5723 Eric Biggers 2020-01-06  39  					   index, remaining_pages);
9630eacb1ee5723 Eric Biggers 2020-01-06  40  	return page;
9630eacb1ee5723 Eric Biggers 2020-01-06  41  }
9630eacb1ee5723 Eric Biggers 2020-01-06  42  

:::::: The code at line 26 was first introduced by commit
:::::: 9630eacb1ee572392628c4b96daa8031e84af56e fs-verity: implement readahead for FS_IOC_ENABLE_VERITY

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Jaegeuk Kim <jaegeuk@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
