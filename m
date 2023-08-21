Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655C4525E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 12:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692619212; x=1724155212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=czr6z3MEsfQDe11VHtkN32GmRzNKtOQODnuthkkAZ/s=;
  b=VxuG49f/Kmk+ktiY7BqzMj2j8je3P9gwQEoNOfUHcbKtPyMmeT9NWGea
   +RLUo4ZiIRijy3e7jNE5b/IvswCUTq/vSnjWVnKBJudM1jIXuUx1/NKW9
   v8jy8SsUnllGK5zawxtfkZ3jj+e9QFEffBSZkrJt4HK9AgTMbz+20pOqc
   5cUphJi0l9KlwfmEfgGyWhS58mmrVW0bgZEWw/GXOeFno7LhlCxgnvtEo
   G1aL/hewX5uIkC4jrSVb19R6AjzIveph7cEIVUKj8HvBzBIEPHYUdpDpf
   he91sK1bVUqQp81HoEEgBKhHpc+oIrt9Lrira9wa2MqRo+wcRgRTlD2di
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="363731176"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="363731176"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 05:00:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="825906039"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="825906039"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2023 05:00:10 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY3Zp-0000SK-0v;
	Mon, 21 Aug 2023 12:00:09 +0000
Date: Mon, 21 Aug 2023 19:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 29/30] <command-line>: warning: format '%llu'
 expects argument of type 'long long unsigned int', but argument 11 has type
 'size_t' {aka 'unsigned int'}
Message-ID: <202308211955.eOd6TCh2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   d98064c4bf02eba42e22917aecccfb339c094d26
commit: 83fb8ca5f08ed8b16e688b124a3f37de3fc01423 [29/30] ceph: Don't use data_pages
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230821/202308211955.eOd6TCh2-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308211955.eOd6TCh2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308211955.eOd6TCh2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ceph/addr.c: In function 'finish_netfs_read':
   fs/ceph/addr.c:272:75: error: 'struct ceph_osd_data' has no member named 'pages'
     272 |                         err = ceph_fscrypt_decrypt_extents(inode, osd_data->pages,
         |                                                                           ^~
   In file included from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:254,
                    from include/linux/ceph/ceph_debug.h:7,
                    from fs/ceph/addr.c:2:
   fs/ceph/addr.c: In function 'writepages_finish':
   fs/ceph/addr.c:877:42: error: 'CEPH_OSD_DATA_TYPE_PAGES' undeclared (first use in this function); did you mean 'CEPH_OSD_DATA_TYPE_ITER'?
     877 |                 BUG_ON(osd_data->type != CEPH_OSD_DATA_TYPE_PAGES);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bug.h:34:44: note: in definition of macro 'BUG_ON'
      34 | #define BUG_ON(C) __BUG_ON((unsigned long)(C))
         |                                            ^
   fs/ceph/addr.c:877:42: note: each undeclared identifier is reported only once for each function it appears in
     877 |                 BUG_ON(osd_data->type != CEPH_OSD_DATA_TYPE_PAGES);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/bug.h:34:44: note: in definition of macro 'BUG_ON'
      34 | #define BUG_ON(C) __BUG_ON((unsigned long)(C))
         |                                            ^
   fs/ceph/addr.c:879:57: error: 'struct ceph_osd_data' has no member named 'offset'
     879 |                 num_pages = calc_pages_for((u64)osd_data->offset,
         |                                                         ^~
   fs/ceph/addr.c:883:40: error: 'struct ceph_osd_data' has no member named 'pages'
     883 |                         page = osd_data->pages[j];
         |                                        ^~
   fs/ceph/addr.c:886:66: error: 'struct ceph_osd_data' has no member named 'pages'
     886 |                                 fscrypt_free_bounce_page(osd_data->pages[j]);
         |                                                                  ^~
   fs/ceph/addr.c:887:41: error: 'struct ceph_osd_data' has no member named 'pages'
     887 |                                 osd_data->pages[j] = page;
         |                                         ^~
>> <command-line>: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 11 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
   include/linux/ceph/ceph_debug.h:5:21: note: in expansion of macro 'KBUILD_MODNAME'
       5 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                     ^~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:222:29: note: in expansion of macro 'pr_fmt'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:246:9: note: in expansion of macro '__dynamic_func_call_cls'
     246 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:248:9: note: in expansion of macro '_dynamic_func_call_cls'
     248 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:267:9: note: in expansion of macro '_dynamic_func_call'
     267 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_debug.h:23:9: note: in expansion of macro 'pr_debug'
      23 |         pr_debug("%.*s %12.12s:%-4d : [%pU %lld] " fmt,                 \
         |         ^~~~~~~~
   fs/ceph/addr.c:907:17: note: in expansion of macro 'doutc'
     907 |                 doutc(cl, "%llx.%llx wrote %llu bytes cleaned %d pages\n",
         |                 ^~~~~
   fs/ceph/addr.c:911:39: error: 'struct ceph_osd_data' has no member named 'pages'
     911 |                 release_pages(osd_data->pages, num_pages);
         |                                       ^~
   fs/ceph/addr.c:920:21: error: 'struct ceph_osd_data' has no member named 'pages_from_pool'
     920 |         if (osd_data->pages_from_pool)
         |                     ^~
   fs/ceph/addr.c:921:38: error: 'struct ceph_osd_data' has no member named 'pages'
     921 |                 mempool_free(osd_data->pages, ceph_wb_pagevec_pool);
         |                                      ^~
   fs/ceph/addr.c:923:31: error: 'struct ceph_osd_data' has no member named 'pages'
     923 |                 kfree(osd_data->pages);
         |                               ^~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
