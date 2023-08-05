Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07F915A6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 01:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691199965; x=1722735965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u5CQkmJB1MXA2HGYfwtYKDNtRGe7BtBOv1jC93+UNP8=;
  b=nkpRS37qcmkKBnLBXDfCuk108+fLme7XSmH239mN8Jo25mgwyyvq3wAV
   FfQbFmtEoeD0zvpq2uHUe6LdEQwknML4CXvmF3A6Y1QqkN7qafX6b1ckE
   Nrp7QzuIqlB94U+YGXx/SSncOXVDQk7WGAx5G1BV8z9UTsQ+2SLjWXufn
   q6IO1ERd04qZLbtZ+vM2KQhRqOxbIob8vQCCSVGH5WzycHc3h8WdecwJq
   TPMO/UcxDiKBNTci1ObF/w5gYD0QOl005Lrqwqbj/Mdc5qGhZMSuVJLD7
   phNqhs+Nq2i2TvQ3a/WMrPHAjE6wcShrV9Rdj7/zQp2J1HKs0MTy9Vv2W
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="370269437"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="370269437"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 18:46:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="759818773"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="759818773"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Aug 2023 18:46:03 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS6Mk-0003F5-1e;
	Sat, 05 Aug 2023 01:46:02 +0000
Date: Sat, 5 Aug 2023 09:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 16/18] fs/ceph/addr.c:272:75: error: 'struct
 ceph_osd_data' has no member named 'pages'
Message-ID: <202308050914.QOaEcM8X-lkp@intel.com>
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
commit: 173db2e634dcd7df7e5d6cac4e83ff496f1845bd [16/18] ceph: Remove CEPH_OS_DATA_TYPE_PAGES and its attendant helpers
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230805/202308050914.QOaEcM8X-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050914.QOaEcM8X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050914.QOaEcM8X-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/addr.c: In function 'finish_netfs_read':
   fs/ceph/addr.c:255:62: error: 'struct ceph_osd_data' has no member named 'length'
     255 |                                  req->r_end_latency, osd_data->length, err);
         |                                                              ^~
>> fs/ceph/addr.c:272:75: error: 'struct ceph_osd_data' has no member named 'pages'
     272 |                         err = ceph_fscrypt_decrypt_extents(inode, osd_data->pages,
         |                                                                           ^~
>> fs/ceph/addr.c:280:31: error: 'CEPH_OSD_DATA_TYPE_PAGES' undeclared (first use in this function); did you mean 'CEPH_OSD_DATA_TYPE_ITER'?
     280 |         if (osd_data->type == CEPH_OSD_DATA_TYPE_PAGES) {
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
         |                               CEPH_OSD_DATA_TYPE_ITER
   fs/ceph/addr.c:280:31: note: each undeclared identifier is reported only once for each function it appears in
   fs/ceph/addr.c:281:46: error: 'struct ceph_osd_data' has no member named 'pages'
     281 |                 ceph_put_page_vector(osd_data->pages,
         |                                              ^~
>> fs/ceph/addr.c:282:61: error: 'struct ceph_osd_data' has no member named 'offset'
     282 |                                      calc_pages_for(osd_data->offset,
         |                                                             ^~
   fs/ceph/addr.c:283:49: error: 'struct ceph_osd_data' has no member named 'length'
     283 |                                         osd_data->length), false);
         |                                                 ^~
   In file included from include/linux/string.h:5,
                    from include/linux/ceph/ceph_debug.h:7,
                    from fs/ceph/addr.c:2:
   fs/ceph/addr.c: In function 'writepages_finish':
   fs/ceph/addr.c:882:42: error: 'CEPH_OSD_DATA_TYPE_PAGES' undeclared (first use in this function); did you mean 'CEPH_OSD_DATA_TYPE_ITER'?
     882 |                 BUG_ON(osd_data->type != CEPH_OSD_DATA_TYPE_PAGES);
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   fs/ceph/addr.c:882:17: note: in expansion of macro 'BUG_ON'
     882 |                 BUG_ON(osd_data->type != CEPH_OSD_DATA_TYPE_PAGES);
         |                 ^~~~~~
   fs/ceph/addr.c:883:32: error: 'struct ceph_osd_data' has no member named 'length'
     883 |                 len += osd_data->length;
         |                                ^~
   fs/ceph/addr.c:884:57: error: 'struct ceph_osd_data' has no member named 'offset'
     884 |                 num_pages = calc_pages_for((u64)osd_data->offset,
         |                                                         ^~
   fs/ceph/addr.c:885:57: error: 'struct ceph_osd_data' has no member named 'length'
     885 |                                            (u64)osd_data->length);
         |                                                         ^~
   fs/ceph/addr.c:888:40: error: 'struct ceph_osd_data' has no member named 'pages'
     888 |                         page = osd_data->pages[j];
         |                                        ^~
   fs/ceph/addr.c:891:66: error: 'struct ceph_osd_data' has no member named 'pages'
     891 |                                 fscrypt_free_bounce_page(osd_data->pages[j]);
         |                                                                  ^~
   fs/ceph/addr.c:892:41: error: 'struct ceph_osd_data' has no member named 'pages'
     892 |                                 osd_data->pages[j] = page;
         |                                         ^~
   In file included from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:254:
   fs/ceph/addr.c:913:50: error: 'struct ceph_osd_data' has no member named 'length'
     913 |                       ceph_vinop(inode), osd_data->length,
         |                                                  ^~
   include/linux/dynamic_debug.h:222:29: note: in definition of macro '__dynamic_func_call_cls'
     222 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
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
   fs/ceph/addr.c:912:17: note: in expansion of macro 'doutc'
     912 |                 doutc(cl, "%llx.%llx wrote %llu bytes cleaned %d pages\n",
         |                 ^~~~~
   fs/ceph/addr.c:916:39: error: 'struct ceph_osd_data' has no member named 'pages'
     916 |                 release_pages(osd_data->pages, num_pages);
         |                                       ^~
>> fs/ceph/addr.c:925:21: error: 'struct ceph_osd_data' has no member named 'pages_from_pool'
     925 |         if (osd_data->pages_from_pool)
         |                     ^~
   fs/ceph/addr.c:926:38: error: 'struct ceph_osd_data' has no member named 'pages'
     926 |                 mempool_free(osd_data->pages, ceph_wb_pagevec_pool);
         |                                      ^~
   fs/ceph/addr.c:928:31: error: 'struct ceph_osd_data' has no member named 'pages'
     928 |                 kfree(osd_data->pages);
         |                               ^~
   fs/ceph/addr.c: In function '__ceph_pool_perm_get':
   fs/ceph/addr.c:2116:9: error: implicit declaration of function 'osd_req_op_raw_data_in_pages'; did you mean 'osd_req_op_raw_data_in_databuf'? [-Werror=implicit-function-declaration]
    2116 |         osd_req_op_raw_data_in_pages(rd_req, 0, pages, PAGE_SIZE,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         osd_req_op_raw_data_in_databuf
   cc1: some warnings being treated as errors


vim +272 fs/ceph/addr.c

f0702876e152f04 Jeff Layton   2020-06-01  242  
f0702876e152f04 Jeff Layton   2020-06-01  243  static void finish_netfs_read(struct ceph_osd_request *req)
f0702876e152f04 Jeff Layton   2020-06-01  244  {
48d1edf47c2a8d9 Jeff Layton   2023-01-02  245  	struct inode *inode = req->r_inode;
6e6d7e6a04e7749 Xiubo Li      2023-06-12  246  	struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
eba6420eb72b5f6 Xiubo Li      2023-06-12  247  	struct ceph_client *cl = fsc->client;
f0702876e152f04 Jeff Layton   2020-06-01  248  	struct ceph_osd_data *osd_data = osd_req_op_extent_osd_data(req, 0);
6a19114b8e7f1e2 David Howells 2022-02-17  249  	struct netfs_io_subrequest *subreq = req->r_priv;
5bc241e020562da Jeff Layton   2022-02-26  250  	struct ceph_osd_req_op *op = &req->r_ops[0];
f0702876e152f04 Jeff Layton   2020-06-01  251  	int err = req->r_result;
5bc241e020562da Jeff Layton   2022-02-26  252  	bool sparse = (op->op == CEPH_OSD_OP_SPARSE_READ);
f0702876e152f04 Jeff Layton   2020-06-01  253  
8ae99ae2b40766a Xiubo Li      2021-03-22  254  	ceph_update_read_metrics(&fsc->mdsc->metric, req->r_start_latency,
903f4fec78dd05a Xiubo Li      2021-05-13 @255  				 req->r_end_latency, osd_data->length, err);
f0702876e152f04 Jeff Layton   2020-06-01  256  
eba6420eb72b5f6 Xiubo Li      2023-06-12  257  	doutc(cl, "result %d subreq->len=%zu i_size=%lld\n", req->r_result,
f0702876e152f04 Jeff Layton   2020-06-01  258  	      subreq->len, i_size_read(req->r_inode));
f0702876e152f04 Jeff Layton   2020-06-01  259  
f0702876e152f04 Jeff Layton   2020-06-01  260  	/* no object means success but no data */
48d1edf47c2a8d9 Jeff Layton   2023-01-02  261  	if (err == -ENOENT)
f0702876e152f04 Jeff Layton   2020-06-01  262  		err = 0;
f0702876e152f04 Jeff Layton   2020-06-01  263  	else if (err == -EBLOCKLISTED)
f0702876e152f04 Jeff Layton   2020-06-01  264  		fsc->blocklisted = true;
f0702876e152f04 Jeff Layton   2020-06-01  265  
48d1edf47c2a8d9 Jeff Layton   2023-01-02  266  	if (err >= 0) {
48d1edf47c2a8d9 Jeff Layton   2023-01-02  267  		if (sparse && err > 0)
48d1edf47c2a8d9 Jeff Layton   2023-01-02  268  			err = ceph_sparse_ext_map_end(op);
48d1edf47c2a8d9 Jeff Layton   2023-01-02  269  		if (err < subreq->len)
f0702876e152f04 Jeff Layton   2020-06-01  270  			__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
48d1edf47c2a8d9 Jeff Layton   2023-01-02  271  		if (IS_ENCRYPTED(inode) && err > 0) {
48d1edf47c2a8d9 Jeff Layton   2023-01-02 @272  			err = ceph_fscrypt_decrypt_extents(inode, osd_data->pages,
48d1edf47c2a8d9 Jeff Layton   2023-01-02  273  					subreq->start, op->extent.sparse_ext,
48d1edf47c2a8d9 Jeff Layton   2023-01-02  274  					op->extent.sparse_ext_cnt);
48d1edf47c2a8d9 Jeff Layton   2023-01-02  275  			if (err > subreq->len)
48d1edf47c2a8d9 Jeff Layton   2023-01-02  276  				err = subreq->len;
48d1edf47c2a8d9 Jeff Layton   2023-01-02  277  		}
48d1edf47c2a8d9 Jeff Layton   2023-01-02  278  	}
f0702876e152f04 Jeff Layton   2020-06-01  279  
48d1edf47c2a8d9 Jeff Layton   2023-01-02 @280  	if (osd_data->type == CEPH_OSD_DATA_TYPE_PAGES) {
48d1edf47c2a8d9 Jeff Layton   2023-01-02  281  		ceph_put_page_vector(osd_data->pages,
73acbd205528e5a David Howells 2023-04-20 @282  				     calc_pages_for(osd_data->offset,
48d1edf47c2a8d9 Jeff Layton   2023-01-02  283  					osd_data->length), false);
48d1edf47c2a8d9 Jeff Layton   2023-01-02  284  	}
7467b04418d929c Jeff Layton   2022-06-07  285  	netfs_subreq_terminated(subreq, err, false);
f0702876e152f04 Jeff Layton   2020-06-01  286  	iput(req->r_inode);
ca50971bd0093c4 Xiubo Li      2023-05-09  287  	ceph_dec_osd_stopping_blocker(fsc->mdsc);
f0702876e152f04 Jeff Layton   2020-06-01  288  }
f0702876e152f04 Jeff Layton   2020-06-01  289  

:::::: The code at line 272 was first introduced by commit
:::::: 48d1edf47c2a8d9117eab1e1476741f56979510a ceph: add fscrypt decryption support to ceph_netfs_issue_op

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
