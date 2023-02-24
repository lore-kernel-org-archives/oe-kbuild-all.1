Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29642197
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 17:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677259081; x=1708795081;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tahS4nQwVYPVgyB3K9iczVL/xPPhLNLX4JZOms1V78k=;
  b=cfwl1UzJXthgD+5z8Bpls/iB6u5Fb8advkV9wVu+nPgdmOEBA1q5RYP5
   9MbL1tpb87Z7iojHSbUGmJ73Ccl+sW0N/cBkZX8Cx6zmLQibQuetO42T0
   TUgVPzbvUbinFpP47fBy0TTxgs1ws2JAoLYkJz34/YNcqP36tba2Kb3l+
   FxvbvUMZ4dfxU0AIxtUoIoRYGdcYyXoZuH5ULhdsel2k6pHM9XN7llDJd
   Rj805nHaoRZ8RTjfT6a9nPhMcRiZZSuuu5Np4E2RSHwJG2qVBZ122++2V
   GadTvnKWWwOY5MSP9A/47V2kNaTyOr+kMSxopuWC+9BLdNJ5hwDFPIV7+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="333537051"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="333537051"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 09:18:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="782434516"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="782434516"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2023 09:17:59 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVbhm-0002Z7-2t;
	Fri, 24 Feb 2023 17:17:58 +0000
Date: Sat, 25 Feb 2023 01:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH] cifs, afs: Revert changes to
 {cifs,afs}_writepages_region()
Message-ID: <202302250129.O78kKe0A-lkp@intel.com>
References: <2214157.1677250083@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2214157.1677250083@warthog.procyon.org.uk>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linux/master]
[also build test WARNING on linus/master]
[cannot apply to akpm-mm/mm-everything cifs/for-next v6.2 next-20230224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/cifs-afs-Revert-changes-to-cifs-afs-_writepages_region/20230224-224911
patch link:    https://lore.kernel.org/r/2214157.1677250083%40warthog.procyon.org.uk
patch subject: [RFC][PATCH] cifs, afs: Revert changes to {cifs,afs}_writepages_region()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230225/202302250129.O78kKe0A-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/f7da1f96a42064e48fc0d17c2a5e626924eac7b1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Howells/cifs-afs-Revert-changes-to-cifs-afs-_writepages_region/20230224-224911
        git checkout f7da1f96a42064e48fc0d17c2a5e626924eac7b1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250129.O78kKe0A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/afs/write.c: In function 'afs_writepages_region':
>> fs/afs/write.c:708:13: warning: unused variable 'n' [-Wunused-variable]
     708 |         int n, skips = 0;
         |             ^


vim +/n +708 fs/afs/write.c

31143d5d515ece David Howells  2007-05-09  697  
31143d5d515ece David Howells  2007-05-09  698  /*
31143d5d515ece David Howells  2007-05-09  699   * write a region of pages back to the server
31143d5d515ece David Howells  2007-05-09  700   */
c1206a2c6d87de Adrian Bunk    2007-10-16  701  static int afs_writepages_region(struct address_space *mapping,
31143d5d515ece David Howells  2007-05-09  702  				 struct writeback_control *wbc,
a9eb558a5bea66 David Howells  2022-11-18  703  				 loff_t start, loff_t end, loff_t *_next,
a9eb558a5bea66 David Howells  2022-11-18  704  				 bool max_one_loop)
31143d5d515ece David Howells  2007-05-09  705  {
78525c74d9e7d1 David Howells  2021-08-11  706  	struct folio *folio;
e87b03f5830ecd David Howells  2020-10-20  707  	ssize_t ret;
173ce1ca47c489 David Howells  2022-03-11 @708  	int n, skips = 0;
31143d5d515ece David Howells  2007-05-09  709  
e87b03f5830ecd David Howells  2020-10-20  710  	_enter("%llx,%llx,", start, end);
31143d5d515ece David Howells  2007-05-09  711  
31143d5d515ece David Howells  2007-05-09  712  	do {
e87b03f5830ecd David Howells  2020-10-20  713  		pgoff_t index = start / PAGE_SIZE;
e87b03f5830ecd David Howells  2020-10-20  714  
f7da1f96a42064 David Howells  2023-02-24  715  		folio = filemap_get_folio_tag(mapping, &index, end / PAGE_SIZE,
f7da1f96a42064 David Howells  2023-02-24  716  					      PAGECACHE_TAG_DIRTY);
f7da1f96a42064 David Howells  2023-02-24  717  		if (!folio)
31143d5d515ece David Howells  2007-05-09  718  			break;
f7da1f96a42064 David Howells  2023-02-24  719  
78525c74d9e7d1 David Howells  2021-08-11  720  		start = folio_pos(folio); /* May regress with THPs */
e87b03f5830ecd David Howells  2020-10-20  721  
78525c74d9e7d1 David Howells  2021-08-11  722  		_debug("wback %lx", folio_index(folio));
31143d5d515ece David Howells  2007-05-09  723  
e87b03f5830ecd David Howells  2020-10-20  724  		/* At this point we hold neither the i_pages lock nor the
b93b016313b3ba Matthew Wilcox 2018-04-10  725  		 * page lock: the page may be truncated or invalidated
b93b016313b3ba Matthew Wilcox 2018-04-10  726  		 * (changing page->mapping to NULL), or even swizzled
b93b016313b3ba Matthew Wilcox 2018-04-10  727  		 * back from swapper_space to tmpfs file mapping
31143d5d515ece David Howells  2007-05-09  728  		 */
e87b03f5830ecd David Howells  2020-10-20  729  		if (wbc->sync_mode != WB_SYNC_NONE) {
78525c74d9e7d1 David Howells  2021-08-11  730  			ret = folio_lock_killable(folio);
4343d00872e1de David Howells  2017-11-02  731  			if (ret < 0) {
f7da1f96a42064 David Howells  2023-02-24  732  				folio_put(folio);
4343d00872e1de David Howells  2017-11-02  733  				return ret;
4343d00872e1de David Howells  2017-11-02  734  			}
e87b03f5830ecd David Howells  2020-10-20  735  		} else {
f7da1f96a42064 David Howells  2023-02-24  736  			if (!folio_trylock(folio)) {
f7da1f96a42064 David Howells  2023-02-24  737  				folio_put(folio);
f7da1f96a42064 David Howells  2023-02-24  738  				return 0;
f7da1f96a42064 David Howells  2023-02-24  739  			}
e87b03f5830ecd David Howells  2020-10-20  740  		}
31143d5d515ece David Howells  2007-05-09  741  
f7da1f96a42064 David Howells  2023-02-24  742  		if (folio_mapping(folio) != mapping ||
78525c74d9e7d1 David Howells  2021-08-11  743  		    !folio_test_dirty(folio)) {
78525c74d9e7d1 David Howells  2021-08-11  744  			start += folio_size(folio);
78525c74d9e7d1 David Howells  2021-08-11  745  			folio_unlock(folio);
f7da1f96a42064 David Howells  2023-02-24  746  			folio_put(folio);
31143d5d515ece David Howells  2007-05-09  747  			continue;
31143d5d515ece David Howells  2007-05-09  748  		}
31143d5d515ece David Howells  2007-05-09  749  
c7f75ef33b6dcd David Howells  2020-02-06  750  		if (folio_test_writeback(folio) ||
c7f75ef33b6dcd David Howells  2020-02-06  751  		    folio_test_fscache(folio)) {
78525c74d9e7d1 David Howells  2021-08-11  752  			folio_unlock(folio);
c7f75ef33b6dcd David Howells  2020-02-06  753  			if (wbc->sync_mode != WB_SYNC_NONE) {
78525c74d9e7d1 David Howells  2021-08-11  754  				folio_wait_writeback(folio);
c7f75ef33b6dcd David Howells  2020-02-06  755  #ifdef CONFIG_AFS_FSCACHE
c7f75ef33b6dcd David Howells  2020-02-06  756  				folio_wait_fscache(folio);
c7f75ef33b6dcd David Howells  2020-02-06  757  #endif
173ce1ca47c489 David Howells  2022-03-11  758  			} else {
173ce1ca47c489 David Howells  2022-03-11  759  				start += folio_size(folio);
c7f75ef33b6dcd David Howells  2020-02-06  760  			}
f7da1f96a42064 David Howells  2023-02-24  761  			folio_put(folio);
173ce1ca47c489 David Howells  2022-03-11  762  			if (wbc->sync_mode == WB_SYNC_NONE) {
f7da1f96a42064 David Howells  2023-02-24  763  				if (skips >= 5 || need_resched())
f7da1f96a42064 David Howells  2023-02-24  764  					break;
173ce1ca47c489 David Howells  2022-03-11  765  				skips++;
173ce1ca47c489 David Howells  2022-03-11  766  			}
31143d5d515ece David Howells  2007-05-09  767  			continue;
31143d5d515ece David Howells  2007-05-09  768  		}
31143d5d515ece David Howells  2007-05-09  769  
78525c74d9e7d1 David Howells  2021-08-11  770  		if (!folio_clear_dirty_for_io(folio))
65a151094edeb0 David Howells  2017-03-16  771  			BUG();
f7da1f96a42064 David Howells  2023-02-24  772  		ret = afs_write_back_from_locked_folio(mapping, wbc, folio, start, end);
f7da1f96a42064 David Howells  2023-02-24  773  		folio_put(folio);
31143d5d515ece David Howells  2007-05-09  774  		if (ret < 0) {
e87b03f5830ecd David Howells  2020-10-20  775  			_leave(" = %zd", ret);
31143d5d515ece David Howells  2007-05-09  776  			return ret;
31143d5d515ece David Howells  2007-05-09  777  		}
31143d5d515ece David Howells  2007-05-09  778  
dc2557308ede6b Marc Dionne    2021-06-06  779  		start += ret;
31143d5d515ece David Howells  2007-05-09  780  
f7da1f96a42064 David Howells  2023-02-24  781  		if (max_one_loop)
f7da1f96a42064 David Howells  2023-02-24  782  			break;
f7da1f96a42064 David Howells  2023-02-24  783  
31143d5d515ece David Howells  2007-05-09  784  		cond_resched();
e87b03f5830ecd David Howells  2020-10-20  785  	} while (wbc->nr_to_write > 0);
31143d5d515ece David Howells  2007-05-09  786  
e87b03f5830ecd David Howells  2020-10-20  787  	*_next = start;
e87b03f5830ecd David Howells  2020-10-20  788  	_leave(" = 0 [%llx]", *_next);
31143d5d515ece David Howells  2007-05-09  789  	return 0;
31143d5d515ece David Howells  2007-05-09  790  }
31143d5d515ece David Howells  2007-05-09  791  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
