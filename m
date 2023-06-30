Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9325610EA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 17:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688145579; x=1719681579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2XnpdNDYAlfWb93/ZH9LQN2suO7MK6f1+kIPkA+zt4U=;
  b=g2j9hx1p1/GLX4Jhex6VYft0GxGr4k2ewc08ntXWH/O3EANcEmLMXnYP
   IkVzL8lCe8chTmGOWKynnCs1pFNrEZnpU5RWtBIjmV+TedK6U3IxlTEoo
   gLtt5h1xbQW4PdKnXnSWHjlGt8ftcHEImYXR/8OA8Wrh2thmA1x+6eJ7s
   DVFhDAvgkv8XDlynVEoIqnYP4nj+aMWoL/1mxFJRoCZHniDtkb+gRHc5M
   trO2tsHviEa48HWWQp1qcuZgzWu+OnSLu+YfVBjidSB3UJNPvR6NuwZvR
   rQ+Pao68oTOQitVVDEMrjmy0PoMIjrwuQQ6k9lgYg18rfy1W5FOY6r5cd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="426132995"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="426132995"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 10:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="831019091"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="831019091"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jun 2023 10:19:37 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFHmS-000FCG-2r;
	Fri, 30 Jun 2023 17:19:36 +0000
Date: Sat, 1 Jul 2023 01:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 2/2] fs/verity/enable.c:26:9:
 error: implicit declaration of function 'find_get_page_flags'
Message-ID: <202307010156.FUvAeJBv-lkp@intel.com>
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
config: x86_64-randconfig-x003-20230629 (https://download.01.org/0day-ci/archive/20230701/202307010156.FUvAeJBv-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307010156.FUvAeJBv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307010156.FUvAeJBv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/verity/enable.c:26:9: error: implicit declaration of function 'find_get_page_flags' [-Werror,-Wimplicit-function-declaration]
           page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
                  ^
>> fs/verity/enable.c:26:53: error: use of undeclared identifier 'FGP_ACCESSED'
           page = find_get_page_flags(filp->f_mapping, index, FGP_ACCESSED);
                                                              ^
>> fs/verity/enable.c:33:10: error: implicit declaration of function 'read_mapping_page' [-Werror,-Wimplicit-function-declaration]
                   page = read_mapping_page(filp->f_mapping, index, NULL);
                          ^
>> fs/verity/enable.c:33:8: error: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
                   page = read_mapping_page(filp->f_mapping, index, NULL);
                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +/find_get_page_flags +26 fs/verity/enable.c

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
