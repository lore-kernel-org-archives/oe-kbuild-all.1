Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D94614AB6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 12:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688127690; x=1719663690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SKXMWQh49FWX/2VXSjAnskFpOISsvPP5UXzAfzUJc98=;
  b=W3Fq8NIeHVVqiNyQvrw22wYJMsnwwT/hygbhMxkKOHW8eudZ8X2oYlnV
   hfUVyQwfzO/UOXyg0GXrYSfgXyqPB/ZJ/j4S8dIh6uhdNtYYt3mPGGMAK
   87udWozzj0mwgM36Oz73quposi+Jmdb2ToQF1aSB0KdfqJR7KNu7n7YjW
   5KVfWWZlwiIvBCXr4IZH/m9/578pv9u9NcK5lpvVqDFJeJ10h9/S1hq0p
   KiI2APzVp1TTkfwMSBOYR+is1vNe5B+sKUtGpZeYj7YQl8O9NSzWG7xbZ
   0K2Ty/Qt1ex1NmPuLSUL7uXoLUcut/D9f+fqPVw+4oDQraFDELCLXt0Nv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="364958174"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="364958174"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 05:21:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1048213667"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="1048213667"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jun 2023 05:21:25 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFD7t-000Ex5-0W;
	Fri, 30 Jun 2023 12:21:25 +0000
Date: Fri, 30 Jun 2023 20:21:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-extract 18/20] net/ipv4/tcp_vegas.c:46:12: warning:
 'gamma' defined but not used
Message-ID: <202306302028.Lzz3O9w0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-extract
head:   19ee2529bb48ab3bba1d2cfc7a0811ae08a22505
commit: b466221531e2d73043d4b1abe1bbea1dfc38cde8 [18/20] net: [WIP] Mark each skb_frags as to how they should be cleaned up
config: x86_64-buildonly-randconfig-r003-20230630 (https://download.01.org/0day-ci/archive/20230630/202306302028.Lzz3O9w0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302028.Lzz3O9w0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302028.Lzz3O9w0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ipv4/tcp_vegas.c:37:
   include/linux/skbuff.h: In function '__skb_frag_set_page':
   include/linux/skbuff.h:405:36: error: 'FOLL_PIN' undeclared (first use in this function); did you mean 'POLL_IN'?
     405 |         cleanup_mode &= FOLL_GET | FOLL_PIN;
         |                                    ^~~~~~~~
         |                                    POLL_IN
   include/linux/skbuff.h:405:36: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/skbuff.h: In function 'skb_frag_fill_page_desc':
   include/linux/skbuff.h:2475:15: error: 'skb_frag_t' {aka 'struct skb_frag'} has no member named 'bv_offset'; did you mean 'offset'?
    2475 |         frag->bv_offset = off;
         |               ^~~~~~~~~
         |               offset
   include/linux/skbuff.h: In function '__skb_frag_ref':
   include/linux/skbuff.h:3454:9: error: implicit declaration of function 'try_grab_page'; did you mean 'try_get_page'? [-Werror=implicit-function-declaration]
    3454 |         try_grab_page(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~
         |         try_get_page
   include/linux/skbuff.h: In function 'napi_frag_unref':
   include/linux/skbuff.h:3478:9: error: implicit declaration of function 'page_put_unpin'; did you mean 'page_put_link'? [-Werror=implicit-function-declaration]
    3478 |         page_put_unpin(page, skb_frag_cleanup(frag));
         |         ^~~~~~~~~~~~~~
         |         page_put_link
   net/ipv4/tcp_vegas.c: At top level:
>> net/ipv4/tcp_vegas.c:46:12: warning: 'gamma' defined but not used [-Wunused-variable]
      46 | static int gamma = 1;
         |            ^~~~~
   cc1: some warnings being treated as errors


vim +/gamma +46 net/ipv4/tcp_vegas.c

7752237e9f07b3 Stephen Hemminger 2007-04-23  43  
8d3a564da34e58 Doug Leith        2008-12-09  44  static int alpha = 2;
8d3a564da34e58 Doug Leith        2008-12-09  45  static int beta  = 4;
8d3a564da34e58 Doug Leith        2008-12-09 @46  static int gamma = 1;
b87d8561d8667d Stephen Hemminger 2005-06-23  47  

:::::: The code at line 46 was first introduced by commit
:::::: 8d3a564da34e5844aca4f991b73f8ca512246b23 tcp: tcp_vegas cong avoid fix

:::::: TO: Doug Leith <doug.leith@nuim.ie>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
