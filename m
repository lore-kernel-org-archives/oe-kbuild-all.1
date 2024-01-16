Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820E4D524
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 06:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyMn/QNQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705385563; x=1736921563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nJmcxHkrAIcu8YK04U+JkRLGETR7FdpPABZXolci8WU=;
  b=fyMn/QNQK2Nt1+AObMX0iYlXW8rvEt4PwTBchqpR2vLb9UGTMKi31M2A
   c/HMlSOYwbpOnZ++YtL2r/qGpMG6RCPX41YriyVDv5JCjSO2JHUJiMqRK
   qrP0cItD66/eeniRpAI1A2IooOjrKqEnLYlyx2ZXA06NPheJYGXSmIPu1
   ua35fDF4X1zzXN8zRaxjiY7XjBvi0/KyuHDEYHQ+tW6t1tE4bgnRwe0Ld
   G9eZYSaxdcFW9/UalNNsTc6rkWvUJSVc6D+eCu6xaieHWpOwHlAQuuZaX
   2+g0eN7YvCB/hvU1R/HwOp7h5AWZ/uLjWHdTADuD+ZhmZYgscfpFsSLg1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="18360832"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="18360832"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 22:12:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="25678759"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jan 2024 22:12:41 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPcgg-00006X-1q;
	Tue, 16 Jan 2024 06:12:38 +0000
Date: Tue, 16 Jan 2024 14:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Howells <dhowells@redhat.com>
Subject: [dhowells-fs:netfs-fixes 1/2] fs/netfs/buffered_write.c:585:17:
 error: implicit declaration of function 'generic_error_remove_page'; did you
 mean 'generic_error_remove_folio'?
Message-ID: <202401161310.L8tkpN4I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-fixes
head:   b6456634f2ba590b56e8ea3934c4747937199a14
commit: 344ccbed939f24f4cd6dbda45d6f340b7279bde4 [1/2] Merge remote-tracking branch 'vfs/vfs.netfs' into linus/master
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20240116/202401161310.L8tkpN4I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401161310.L8tkpN4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401161310.L8tkpN4I-lkp@intel.com/

Note: the dhowells-fs/netfs-fixes HEAD b6456634f2ba590b56e8ea3934c4747937199a14 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   fs/netfs/buffered_write.c: In function 'netfs_kill_pages':
>> fs/netfs/buffered_write.c:585:17: error: implicit declaration of function 'generic_error_remove_page'; did you mean 'generic_error_remove_folio'? [-Werror=implicit-function-declaration]
     585 |                 generic_error_remove_page(mapping, &folio->page);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                 generic_error_remove_folio
   cc1: some warnings being treated as errors


vim +585 fs/netfs/buffered_write.c

62c3b7481b9a10 David Howells 2023-09-28  555  
62c3b7481b9a10 David Howells 2023-09-28  556  /*
62c3b7481b9a10 David Howells 2023-09-28  557   * Kill all the pages in the given range
62c3b7481b9a10 David Howells 2023-09-28  558   */
62c3b7481b9a10 David Howells 2023-09-28  559  static void netfs_kill_pages(struct address_space *mapping,
62c3b7481b9a10 David Howells 2023-09-28  560  			     loff_t start, loff_t len)
62c3b7481b9a10 David Howells 2023-09-28  561  {
62c3b7481b9a10 David Howells 2023-09-28  562  	struct folio *folio;
62c3b7481b9a10 David Howells 2023-09-28  563  	pgoff_t index = start / PAGE_SIZE;
62c3b7481b9a10 David Howells 2023-09-28  564  	pgoff_t last = (start + len - 1) / PAGE_SIZE, next;
62c3b7481b9a10 David Howells 2023-09-28  565  
62c3b7481b9a10 David Howells 2023-09-28  566  	_enter("%llx-%llx", start, start + len - 1);
62c3b7481b9a10 David Howells 2023-09-28  567  
62c3b7481b9a10 David Howells 2023-09-28  568  	do {
62c3b7481b9a10 David Howells 2023-09-28  569  		_debug("kill %lx (to %lx)", index, last);
62c3b7481b9a10 David Howells 2023-09-28  570  
62c3b7481b9a10 David Howells 2023-09-28  571  		folio = filemap_get_folio(mapping, index);
62c3b7481b9a10 David Howells 2023-09-28  572  		if (IS_ERR(folio)) {
62c3b7481b9a10 David Howells 2023-09-28  573  			next = index + 1;
62c3b7481b9a10 David Howells 2023-09-28  574  			continue;
62c3b7481b9a10 David Howells 2023-09-28  575  		}
62c3b7481b9a10 David Howells 2023-09-28  576  
62c3b7481b9a10 David Howells 2023-09-28  577  		next = folio_next_index(folio);
62c3b7481b9a10 David Howells 2023-09-28  578  
62c3b7481b9a10 David Howells 2023-09-28  579  		trace_netfs_folio(folio, netfs_folio_trace_kill);
62c3b7481b9a10 David Howells 2023-09-28  580  		folio_clear_uptodate(folio);
62c3b7481b9a10 David Howells 2023-09-28  581  		if (folio_test_fscache(folio))
62c3b7481b9a10 David Howells 2023-09-28  582  			folio_end_fscache(folio);
62c3b7481b9a10 David Howells 2023-09-28  583  		folio_end_writeback(folio);
62c3b7481b9a10 David Howells 2023-09-28  584  		folio_lock(folio);
62c3b7481b9a10 David Howells 2023-09-28 @585  		generic_error_remove_page(mapping, &folio->page);
62c3b7481b9a10 David Howells 2023-09-28  586  		folio_unlock(folio);
62c3b7481b9a10 David Howells 2023-09-28  587  		folio_put(folio);
62c3b7481b9a10 David Howells 2023-09-28  588  
62c3b7481b9a10 David Howells 2023-09-28  589  	} while (index = next, index <= last);
62c3b7481b9a10 David Howells 2023-09-28  590  
62c3b7481b9a10 David Howells 2023-09-28  591  	_leave("");
62c3b7481b9a10 David Howells 2023-09-28  592  }
62c3b7481b9a10 David Howells 2023-09-28  593  

:::::: The code at line 585 was first introduced by commit
:::::: 62c3b7481b9a108cb99ef9438dba66bb4738768b netfs: Provide a writepages implementation

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
