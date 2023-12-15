Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5AF1078A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 23:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NACmrbzp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702682310; x=1734218310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XE9YthxrEbRO3EX25/DgcWSglp9/UYMrjqvoSr1XFm4=;
  b=NACmrbzpHIXlzAg38LSTgMCGfwwu4VZokMt6DEQ56EaywUmTw2ijUGK2
   /5wDDQgQa8JUYEPtX8vWnbBILYZBzz8SD1RN/Q2f4MbzumntXegqIbAO0
   +fY8kuZiqdqKNONE2JzgGnpF0hC0R5qXN5We8zF151Wa8dCQ02jDcD8di
   oqTxEV7wseJAJdtYzJzJHdkusNh2deBev3ohPzk/SezoXtu9CXFL9KLZn
   U1hOpT0Stjcn2sVyKqjlX8CaETTtWfYKlRbQHls2Jt2xDCgmejfRWl//e
   05MP116VgsdUBY+EBbHPlzHqnSAvbcbdO0rByuN7NzamFS7fP85r0buA9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="14025503"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="14025503"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 15:18:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="948119723"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="948119723"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Dec 2023 15:18:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEHRp-0000t4-1K;
	Fri, 15 Dec 2023 23:18:25 +0000
Date: Sat, 16 Dec 2023 07:17:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>
Subject: [brauner-vfs:vfs.netfs 59/64] fs/netfs/buffered_write.c:520:17:
 error: implicit declaration of function 'generic_error_remove_folio'; did
 you mean 'generic_error_remove_page'?
Message-ID: <202312160746.MkBo6D2w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.netfs
head:   361e796134214b255d35dd801451b40a68c34e11
commit: 02bf7b4afdba5ec3abddb70d5184666b97506e56 [59/64] netfs: Provide a writepages implementation
config: i386-buildonly-randconfig-006-20231216 (https://download.01.org/0day-ci/archive/20231216/202312160746.MkBo6D2w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312160746.MkBo6D2w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312160746.MkBo6D2w-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/netfs/buffered_write.c: In function 'netfs_kill_pages':
>> fs/netfs/buffered_write.c:520:17: error: implicit declaration of function 'generic_error_remove_folio'; did you mean 'generic_error_remove_page'? [-Werror=implicit-function-declaration]
     520 |                 generic_error_remove_folio(mapping, folio);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 generic_error_remove_page
   cc1: some warnings being treated as errors


vim +520 fs/netfs/buffered_write.c

   490	
   491	/*
   492	 * Kill all the pages in the given range
   493	 */
   494	static void netfs_kill_pages(struct address_space *mapping,
   495				     loff_t start, loff_t len)
   496	{
   497		struct folio *folio;
   498		pgoff_t index = start / PAGE_SIZE;
   499		pgoff_t last = (start + len - 1) / PAGE_SIZE, next;
   500	
   501		_enter("%llx-%llx", start, start + len - 1);
   502	
   503		do {
   504			_debug("kill %lx (to %lx)", index, last);
   505	
   506			folio = filemap_get_folio(mapping, index);
   507			if (IS_ERR(folio)) {
   508				next = index + 1;
   509				continue;
   510			}
   511	
   512			next = folio_next_index(folio);
   513	
   514			trace_netfs_folio(folio, netfs_folio_trace_kill);
   515			folio_clear_uptodate(folio);
   516			if (folio_test_fscache(folio))
   517				folio_end_fscache(folio);
   518			folio_end_writeback(folio);
   519			folio_lock(folio);
 > 520			generic_error_remove_folio(mapping, folio);
   521			folio_unlock(folio);
   522			folio_put(folio);
   523	
   524		} while (index = next, index <= last);
   525	
   526		_leave("");
   527	}
   528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
