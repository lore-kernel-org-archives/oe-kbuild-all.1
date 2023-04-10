Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2520923D0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 23:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681167885; x=1712703885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CJ4/BURU1eP5T7HtcjAAiw6MaAfsVE2NlM6rY+8J4W4=;
  b=Kqmc0nYmdeHIob1aGd/MRLeoVZ63fDrYex4ycs9YSaujOwUJ7MZC70PK
   h+CIXXwWOJZ51fmEDG5Dy2135Sw/feCI6a6p0NyX7G3jde8gOaVdi1dbc
   dlQkYqikVG2xvwYxnjkm2mYLtyo6v6bAfQgsd/xJxN+zY9CQsXqV5D42o
   4+VphHvXtNdAOm3ib397t5wAthrFd8XcuJx6enV3Sw2pROPnYvEd0bwMa
   mhl+4rZ4yAsUjsypClt+sYhaPq7sU92pd3VsvD+c085etiR1EIBxD1IlB
   L3SmOiB20FNZaVg5P/KwUVGVS7NThCBuC++pgoRQ/OjKACZoTcd7R+B8O
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="323834497"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="323834497"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 16:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="934501592"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="934501592"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Apr 2023 16:04:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm0Z0-000Vif-27;
	Mon, 10 Apr 2023 23:04:42 +0000
Date: Tue, 11 Apr 2023 07:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 2/2] fs/verity/enable.c:33:8:
 warning: assignment makes pointer from integer without a cast
Message-ID: <202304110649.juNq5n1s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   285fc83a087180f0bc30b75285d4bc2cdcceae06
commit: 285fc83a087180f0bc30b75285d4bc2cdcceae06 [2/2] BACKPORT: fsverity: don't drop pagecache at end of FS_IOC_ENABLE_VERITY
config: arm64-randconfig-r036-20230410 (https://download.01.org/0day-ci/archive/20230411/202304110649.juNq5n1s-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.14-stable
        git checkout 285fc83a087180f0bc30b75285d4bc2cdcceae06
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash fs/verity/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304110649.juNq5n1s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/verity/enable.c: In function 'read_file_data_page':
   fs/verity/enable.c:26:9: error: implicit declaration of function 'find_get_page_flags'; did you mean 'find_dev_pagemap'? [-Werror=implicit-function-declaration]
     page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
            ^~~~~~~~~~~~~~~~~~~
            find_dev_pagemap
   fs/verity/enable.c:26:53: error: 'FGP_ACCESSED' undeclared (first use in this function); did you mean 'FL_ACCESS'?
     page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
                                                        ^~~~~~~~~~~~
                                                        FL_ACCESS
   fs/verity/enable.c:26:53: note: each undeclared identifier is reported only once for each function it appears in
   fs/verity/enable.c:33:10: error: implicit declaration of function 'read_mapping_page'; did you mean 'unmap_mapping_range'? [-Werror=implicit-function-declaration]
      page = read_mapping_page(filp->f_mapping, index, NULL);
             ^~~~~~~~~~~~~~~~~
             unmap_mapping_range
>> fs/verity/enable.c:33:8: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      page = read_mapping_page(filp->f_mapping, index, NULL);
           ^
   cc1: some warnings being treated as errors


vim +33 fs/verity/enable.c

46af35239934d8 Eric Biggers 2019-07-22  15  
693ad1e5b397bb Eric Biggers 2020-01-06  16  /*
693ad1e5b397bb Eric Biggers 2020-01-06  17   * Read a file data page for Merkle tree construction.  Do aggressive readahead,
693ad1e5b397bb Eric Biggers 2020-01-06  18   * since we're sequentially reading the entire file.
693ad1e5b397bb Eric Biggers 2020-01-06  19   */
693ad1e5b397bb Eric Biggers 2020-01-06  20  static struct page *read_file_data_page(struct file *filp, pgoff_t index,
693ad1e5b397bb Eric Biggers 2020-01-06  21  					struct file_ra_state *ra,
693ad1e5b397bb Eric Biggers 2020-01-06  22  					unsigned long remaining_pages)
693ad1e5b397bb Eric Biggers 2020-01-06  23  {
693ad1e5b397bb Eric Biggers 2020-01-06  24  	struct page *page;
693ad1e5b397bb Eric Biggers 2020-01-06  25  
693ad1e5b397bb Eric Biggers 2020-01-06  26  	page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
693ad1e5b397bb Eric Biggers 2020-01-06  27  	if (!page || !PageUptodate(page)) {
693ad1e5b397bb Eric Biggers 2020-01-06  28  		if (page)
693ad1e5b397bb Eric Biggers 2020-01-06  29  			put_page(page);
693ad1e5b397bb Eric Biggers 2020-01-06  30  		else
693ad1e5b397bb Eric Biggers 2020-01-06  31  			page_cache_sync_readahead(filp->f_mapping, ra, filp,
693ad1e5b397bb Eric Biggers 2020-01-06  32  						  index, remaining_pages);
693ad1e5b397bb Eric Biggers 2020-01-06 @33  		page = read_mapping_page(filp->f_mapping, index, NULL);
693ad1e5b397bb Eric Biggers 2020-01-06  34  		if (IS_ERR(page))
693ad1e5b397bb Eric Biggers 2020-01-06  35  			return page;
693ad1e5b397bb Eric Biggers 2020-01-06  36  	}
693ad1e5b397bb Eric Biggers 2020-01-06  37  	if (PageReadahead(page))
693ad1e5b397bb Eric Biggers 2020-01-06  38  		page_cache_async_readahead(filp->f_mapping, ra, filp, page,
693ad1e5b397bb Eric Biggers 2020-01-06  39  					   index, remaining_pages);
693ad1e5b397bb Eric Biggers 2020-01-06  40  	return page;
693ad1e5b397bb Eric Biggers 2020-01-06  41  }
693ad1e5b397bb Eric Biggers 2020-01-06  42  

:::::: The code at line 33 was first introduced by commit
:::::: 693ad1e5b397bbc6c7fb971c8406426a5f21c8c1 fs-verity: implement readahead for FS_IOC_ENABLE_VERITY

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Jaegeuk Kim <jaegeuk@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
