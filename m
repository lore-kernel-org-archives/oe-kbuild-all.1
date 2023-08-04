Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FB0CA6E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 15:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691163580; x=1722699580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1E6eBVBk3/ME/98VQQ4HvkFcCz8GV8Eq0u+ZOXYzs/Y=;
  b=ZD17kSoAf/Pwhlnv1Cb6U0dQVCYm+AJoWt2ThqNf+ihq7uDtVXl7bMKu
   ekC+ybYnEcVUfWodAeZEoYlW9p2G1Y4kXC25N+XbwbmNUiPqqgfJ/wgCO
   zOCmzhpbRQpGGNs6jfyoysl4f6k/nc+VTKrRFAvxQAttDtzAtXLouXiwo
   FQM/bTFtmLHZPyLduEpYVqD9oQhcA7wF3vaU18ERFB3hqhlhj7YGBv8F0
   Ebfs/4jxuSjVPWgfXrinAv/O4CSGRdg48a+aXUrR48e36mik3liPdmDPr
   855ETjycHsqp4saInVe12sY/imZ0qCK15QucL9K+Y5kPNcpT9AKiBhqpZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="373828391"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="373828391"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 08:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="873439389"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Aug 2023 08:39:40 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRwtt-0002vn-1J;
	Fri, 04 Aug 2023 15:39:37 +0000
Date: Fri, 4 Aug 2023 23:39:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 18/18] <command-line>: warning: format '%llu'
 expects argument of type 'long long unsigned int', but argument 11 has type
 'size_t' {aka 'long unsigned int'}
Message-ID: <202308042358.KhVfYgG8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   672499b5bfaeda1769d9eab9c9a08f4c2b2e4bf5
commit: 672499b5bfaeda1769d9eab9c9a08f4c2b2e4bf5 [18/18] ceph: Don't use data_pages
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230804/202308042358.KhVfYgG8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308042358.KhVfYgG8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308042358.KhVfYgG8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ceph/addr.c: In function 'finish_netfs_read':
   fs/ceph/addr.c:272:75: error: 'struct ceph_osd_data' has no member named 'pages'
     272 |                         err = ceph_fscrypt_decrypt_extents(inode, osd_data->pages,
         |                                                                           ^~
   In file included from include/linux/string.h:5,
                    from include/linux/ceph/ceph_debug.h:7,
                    from fs/ceph/addr.c:2:
   fs/ceph/addr.c: In function 'writepages_finish':
   fs/ceph/addr.c:877:42: error: 'CEPH_OSD_DATA_TYPE_PAGES' undeclared (first use in this function); did you mean 'CEPH_OSD_DATA_TYPE_ITER'?
     877 |                 BUG_ON(osd_data->type != CEPH_OSD_DATA_TYPE_PAGES);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/ceph/addr.c:877:17: note: in expansion of macro 'BUG_ON'
     877 |                 BUG_ON(osd_data->type != CEPH_OSD_DATA_TYPE_PAGES);
         |                 ^~~~~~
   fs/ceph/addr.c:877:42: note: each undeclared identifier is reported only once for each function it appears in
     877 |                 BUG_ON(osd_data->type != CEPH_OSD_DATA_TYPE_PAGES);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/ceph/addr.c:877:17: note: in expansion of macro 'BUG_ON'
     877 |                 BUG_ON(osd_data->type != CEPH_OSD_DATA_TYPE_PAGES);
         |                 ^~~~~~
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
>> <command-line>: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 11 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
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
