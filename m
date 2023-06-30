Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AB516415
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 15:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688138617; x=1719674617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IdKV1+CzOwfWUaJPjmgzC2Z6cqU7rhvOiuFeVAWP83E=;
  b=feyEbTkyqB5h/rLofGKpnltq33HGVGW4me3egTKzShSjOuMO9+JXoB+i
   rqyLbHl+gAN51kzA5CS3CeNFx+tDWiGFxM83cdEqTaJiQo0GgN1T48Qi7
   6feP/GctIVxdThpWFUtwLw1CaB6OUF32XWsyiCOnwn+axWjFHWBTNAbYC
   2iUoAeZP4Lmitcj3F9f0/26/hlasYS8qMeUyicJxu4cc6cHMDXr0LAwne
   GiZhvvWdl56OT6Rgmg2TVAIf6F8DlyevBNB89+wGYhCmcXVK/vhUFerjG
   QvVXdwuQROz3QeS+Q5XgkaKL+Nx+9WKfjINhuzSnrVkTwuM8Mm9yvlLdm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="342002494"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="342002494"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 08:23:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="711849227"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="711849227"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Jun 2023 08:23:32 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFFy7-000F52-22;
	Fri, 30 Jun 2023 15:23:31 +0000
Date: Fri, 30 Jun 2023 23:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 2/2] fs/verity/enable.c:26:9:
 error: implicit declaration of function 'find_get_page_flags'; did you mean
 'find_dev_pagemap'?
Message-ID: <202306302314.c5628Bae-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   e8c1340cbb0f24693dd9056f8d5a7808e4597b80
commit: 285fc83a087180f0bc30b75285d4bc2cdcceae06 [2/2] BACKPORT: fsverity: don't drop pagecache at end of FS_IOC_ENABLE_VERITY
config: i386-randconfig-i015-20230629 (https://download.01.org/0day-ci/archive/20230630/202306302314.c5628Bae-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302314.c5628Bae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302314.c5628Bae-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/verity/enable.c: In function 'read_file_data_page':
>> fs/verity/enable.c:26:9: error: implicit declaration of function 'find_get_page_flags'; did you mean 'find_dev_pagemap'? [-Werror=implicit-function-declaration]
     page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
            ^~~~~~~~~~~~~~~~~~~
            find_dev_pagemap
>> fs/verity/enable.c:26:53: error: 'FGP_ACCESSED' undeclared (first use in this function); did you mean 'FL_ACCESS'?
     page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
                                                        ^~~~~~~~~~~~
                                                        FL_ACCESS
   fs/verity/enable.c:26:53: note: each undeclared identifier is reported only once for each function it appears in
>> fs/verity/enable.c:33:10: error: implicit declaration of function 'read_mapping_page'; did you mean 'unmap_mapping_range'? [-Werror=implicit-function-declaration]
      page = read_mapping_page(filp->f_mapping, index, NULL);
             ^~~~~~~~~~~~~~~~~
             unmap_mapping_range
>> fs/verity/enable.c:33:8: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
      page = read_mapping_page(filp->f_mapping, index, NULL);
           ^
   cc1: some warnings being treated as errors


vim +26 fs/verity/enable.c

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
693ad1e5b397bb Eric Biggers 2020-01-06 @26  	page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
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

:::::: The code at line 26 was first introduced by commit
:::::: 693ad1e5b397bbc6c7fb971c8406426a5f21c8c1 fs-verity: implement readahead for FS_IOC_ENABLE_VERITY

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Jaegeuk Kim <jaegeuk@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
