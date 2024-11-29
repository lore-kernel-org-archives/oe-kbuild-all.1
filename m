Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B286148FF5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732904382; cv=none; b=Xv31fpFpEUXTaONcDIKa9o+CSm5S63F3o58+c1QxyysydVMU4Rb2NX2ODSo49s4t4Z6ER7suIveb4O64JEFbyndFv4lX3l4o4OCygSATcSr5rm71ZhV5wNx5BWuLbSOZ4CZQb7novD1tcjQ1/7GUC70piKwS8NeFS8SDkH4L7xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732904382; c=relaxed/simple;
	bh=SgMqqM3NwKiNLdOjUH6e271nzbY8N5i3ugLl67Y+naM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kvdzmc1Y2h02VztQQP/YcuRmUMshCeZj/GXJsdNf3E6R/2f1wT2zv3wKzluzw0+7SFD5SoZ8a9WyiQZHHhyHAt0E6H1tiCh+LxRWLvHyitt2NGwn1Lj6ZOpU7FHJo0lWbNG+xuCJFPag2vzuWgNwCYlLeGqv+E4R9ktHNjcx7jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j05GBaBS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j05GBaBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732904380; x=1764440380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SgMqqM3NwKiNLdOjUH6e271nzbY8N5i3ugLl67Y+naM=;
  b=j05GBaBSaBS5fX/7rjfYXzM9WdNcDMs2ZjGOoEJBB5dmv8190ZbwI2oQ
   rFXIcOclaoMwMuHGmHyA0z4JbghjOj0HTuG1N0rCXyFP+9ifHyC5fuxg1
   p9NmMEQdiKQXQn7+Il/BqAmnvbdGuM8UpA9ajC5A1uoXIHCgF5Sm0BDpm
   lCCB8DUNth6Dnq1xlxs6PyvhWrmZU5F3a317gBeaTqsuoml2qyS1L+zpd
   cmBFw7KDwU4K9BJhK7ndMmUajnB12NI5Wz7nZtnRSeyEImqupVBPxIctc
   LCtkmabppFCZFacPxdfwaLs6dCMf3utg5l0SjwUKF+42dDBAnSMkr7ULc
   w==;
X-CSE-ConnectionGUID: oR1mCBESQ5mGz40uTXe1OA==
X-CSE-MsgGUID: FavvEc3aScWhuKbUWFbJqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36927586"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="36927586"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 10:19:40 -0800
X-CSE-ConnectionGUID: 7IleeOqZQsCtwOZ8sUMoZg==
X-CSE-MsgGUID: LqSLphaZRxWY6gVdzkfFJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="92861063"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Nov 2024 10:19:38 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH5aa-0000bl-18;
	Fri, 29 Nov 2024 18:19:36 +0000
Date: Sat, 30 Nov 2024 02:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 92/92] fs/ceph/file.c:1746:22: error:
 'ceph_read_iter' undeclared here (not in a function); did you mean
 'seq_read_iter'?
Message-ID: <202411300256.TeLOuFC1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   ae69436bf8db8f3a53edd0dfa379e753700240c0
commit: ae69436bf8db8f3a53edd0dfa379e753700240c0 [92/92] ceph: Use netfslib
config: arc-randconfig-001-20241129 (https://download.01.org/0day-ci/archive/20241130/202411300256.TeLOuFC1-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300256.TeLOuFC1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300256.TeLOuFC1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/ceph/file.c:1746:22: error: 'ceph_read_iter' undeclared here (not in a function); did you mean 'seq_read_iter'?
    1746 |         .read_iter = ceph_read_iter,
         |                      ^~~~~~~~~~~~~~
         |                      seq_read_iter
>> fs/ceph/file.c:1747:23: error: 'ceph_write_iter' undeclared here (not in a function); did you mean 'ceph_write_inode'?
    1747 |         .write_iter = ceph_write_iter,
         |                       ^~~~~~~~~~~~~~~
         |                       ceph_write_inode
>> fs/ceph/file.c:159:13: warning: 'ceph_dirty_pages' defined but not used [-Wunused-function]
     159 | static void ceph_dirty_pages(struct ceph_databuf *dbuf)
         |             ^~~~~~~~~~~~~~~~
>> fs/ceph/file.c:129:29: warning: 'iter_get_bvecs_alloc' defined but not used [-Wunused-function]
     129 | static struct ceph_databuf *iter_get_bvecs_alloc(struct iov_iter *iter,
         |                             ^~~~~~~~~~~~~~~~~~~~
--
   fs/ceph/rdwr.c: In function 'ceph_netfs_write_callback':
>> fs/ceph/rdwr.c:116:33: error: 'NETFS_RREQ_REPEAT_RMW' undeclared (first use in this function); did you mean 'NETFS_RREQ_RMW'?
     116 |                         set_bit(NETFS_RREQ_REPEAT_RMW, &ci->netfs.flags);
         |                                 ^~~~~~~~~~~~~~~~~~~~~
         |                                 NETFS_RREQ_RMW
   fs/ceph/rdwr.c:116:33: note: each undeclared identifier is reported only once for each function it appears in
>> fs/ceph/rdwr.c:125:9: error: implicit declaration of function 'netfs_subreq_terminated'; did you mean 'netfs_read_subreq_terminated'? [-Werror=implicit-function-declaration]
     125 |         netfs_subreq_terminated(subreq, wrote, err);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         netfs_read_subreq_terminated
   fs/ceph/rdwr.c: In function 'ceph_issue_write':
>> fs/ceph/rdwr.c:139:49: error: 'inode' undeclared (first use in this function)
     139 |         struct ceph_inode_info *ci = ceph_inode(inode);
         |                                                 ^~~~~
   In file included from include/linux/kernel.h:31,
                    from include/linux/backing-dev.h:12,
                    from fs/ceph/rdwr.c:39:
>> fs/ceph/rdwr.c:146:64: error: 'struct netfs_io_subrequest' has no member named 'max_len'
     146 |               subreq->start, subreq->len, subreq->start, subreq->max_len,
         |                                                                ^~
   include/linux/printk.h:135:32: note: in definition of macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                                ^~~~~~~~~~~
   include/linux/ceph/ceph_debug.h:46:9: note: in expansion of macro 'pr_debug'
      46 |         pr_debug(" [%pU %llu] %s: " fmt, &client->fsid,                 \
         |         ^~~~~~~~
   fs/ceph/rdwr.c:144:9: note: in expansion of macro 'doutc'
     144 |         doutc(cl, "issue_write R=%08x[%x] ino %llx %lld~%zu part %lld~%llu -- %srmw\n",
         |         ^~~~~
>> fs/ceph/rdwr.c:180:21: error: 'assert_ver' undeclared (first use in this function)
     180 |                 if (assert_ver) {
         |                     ^~~~~~~~~~
   fs/ceph/rdwr.c: In function 'ceph_prepare_write':
   fs/ceph/rdwr.c:209:64: error: 'struct netfs_io_subrequest' has no member named 'max_len'
     209 |                                       &objnum, &objoff, &subreq->max_len);
         |                                                                ^~
>> fs/ceph/rdwr.c:203:29: warning: unused variable 'cl' [-Wunused-variable]
     203 |         struct ceph_client *cl = ceph_inode_to_client(subreq->rreq->inode);
         |                             ^~
>> fs/ceph/rdwr.c:200:33: warning: unused variable 'creq' [-Wunused-variable]
     200 |         struct ceph_io_request *creq = csub->creq;
         |                                 ^~~~
   fs/ceph/rdwr.c: In function 'ceph_netfs_clamp_length':
>> fs/ceph/rdwr.c:266:9: error: 'rreq' undeclared (first use in this function); did you mean 'rseq'?
     266 |         rreq->io_streams[0].sreq_max_len = umin(xlen, fsc->mount_options->rsize);
         |         ^~~~
         |         rseq
   fs/ceph/rdwr.c: In function 'ceph_netfs_read_callback':
>> fs/ceph/rdwr.c:313:9: error: too many arguments to function 'netfs_read_subreq_terminated'
     313 |         netfs_read_subreq_terminated(subreq, err, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/ceph/rdwr.c:50:
   include/linux/netfs.h:477:6: note: declared here
     477 | void netfs_read_subreq_terminated(struct netfs_io_subrequest *subreq);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/rdwr.c: In function 'ceph_netfs_issue_read_inline':
   fs/ceph/rdwr.c:382:9: error: too many arguments to function 'netfs_read_subreq_terminated'
     382 |         netfs_read_subreq_terminated(subreq, err, false);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netfs.h:477:6: note: declared here
     477 | void netfs_read_subreq_terminated(struct netfs_io_subrequest *subreq);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/ceph/rdwr.c:335:25: warning: unused variable 'iter' [-Wunused-variable]
     335 |         struct iov_iter iter;
         |                         ^~~~
   fs/ceph/rdwr.c: In function 'ceph_netfs_issue_read':
   fs/ceph/rdwr.c:443:17: error: too many arguments to function 'netfs_read_subreq_terminated'
     443 |                 netfs_read_subreq_terminated(subreq, err, false);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/netfs.h:477:6: note: declared here
     477 | void netfs_read_subreq_terminated(struct netfs_io_subrequest *subreq);
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/rdwr.c: At top level:
>> fs/ceph/rdwr.c:514:10: error: 'const struct netfs_request_ops' has no member named 'clamp_length'
     514 |         .clamp_length           = ceph_netfs_clamp_length,
         |          ^~~~~~~~~~~~
>> fs/ceph/rdwr.c:514:35: error: initialization of 'int (*)(struct netfs_io_subrequest *)' from incompatible pointer type 'bool (*)(struct netfs_io_subrequest *)' {aka '_Bool (*)(struct netfs_io_subrequest *)'} [-Werror=incompatible-pointer-types]
     514 |         .clamp_length           = ceph_netfs_clamp_length,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/rdwr.c:514:35: note: (near initialization for 'ceph_netfs_ops.prepare_read')
   fs/ceph/rdwr.c: In function 'get_oldest_context':
>> fs/ceph/rdwr.c:541:50: error: 'page_snapc' undeclared (first use in this function)
     541 |                 if (snapc && capsnap->context != page_snapc)
         |                                                  ^~~~~~~~~~
   fs/ceph/rdwr.c: In function 'get_writepages_data_length':
>> fs/ceph/rdwr.c:591:17: error: implicit declaration of function 'folio_snap_context' [-Werror=implicit-function-declaration]
     591 |         snapc = folio_snap_context(ceph_fscrypt_pagecache_folio(folio));
         |                 ^~~~~~~~~~~~~~~~~~
>> fs/ceph/rdwr.c:591:15: warning: assignment to 'struct ceph_snap_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     591 |         snapc = folio_snap_context(ceph_fscrypt_pagecache_folio(folio));
         |               ^
   fs/ceph/rdwr.c: In function 'ceph_writepages':
>> fs/ceph/rdwr.c:629:25: error: too few arguments to function 'get_oldest_context'
     629 |                 snapc = get_oldest_context(mapping->host, &ceph_wbc);
         |                         ^~~~~~~~~~~~~~~~~~
   fs/ceph/rdwr.c:525:1: note: declared here
     525 | get_oldest_context(struct inode *inode, struct ceph_writeback_ctl *ctl,
         | ^~~~~~~~~~~~~~~~~~
   fs/ceph/rdwr.c: At top level:
>> fs/ceph/rdwr.c:656:27: error: 'ceph_dirty_folio' undeclared here (not in a function); did you mean 'netfs_dirty_folio'?
     656 |         .dirty_folio    = ceph_dirty_folio,
         |                           ^~~~~~~~~~~~~~~~
         |                           netfs_dirty_folio
>> fs/ceph/rdwr.c:657:29: error: 'ceph_invalidate_folio' undeclared here (not in a function); did you mean 'netfs_invalidate_folio'?
     657 |         .invalidate_folio = ceph_invalidate_folio,
         |                             ^~~~~~~~~~~~~~~~~~~~~
         |                             netfs_invalidate_folio
   fs/ceph/rdwr.c: In function 'ceph_read_iter':
>> fs/ceph/rdwr.c:721:39: error: implicit declaration of function 'ceph_direct_read_write'; did you mean 'ceph_prepare_write'? [-Werror=implicit-function-declaration]
     721 |                                 ret = ceph_direct_read_write(iocb, to,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
         |                                       ceph_prepare_write
>> fs/ceph/rdwr.c:724:52: error: 'CHECK_EOF' undeclared (first use in this function)
     724 |                                         retry_op = CHECK_EOF;
         |                                                    ^~~~~~~~~
   fs/ceph/rdwr.c:726:39: error: implicit declaration of function 'ceph_sync_read' [-Werror=implicit-function-declaration]
     726 |                                 ret = ceph_sync_read(iocb, to, &retry_op);
         |                                       ^~~~~~~~~~~~~~
   fs/ceph/rdwr.c:729:36: error: 'READ_INLINE' undeclared (first use in this function); did you mean 'READ_ONCE'?
     729 |                         retry_op = READ_INLINE;
         |                                    ^~~~~~~~~~~
         |                                    READ_ONCE
   fs/ceph/rdwr.c:750:24: error: 'HAVE_RETRIED' undeclared (first use in this function)
     750 |         if (retry_op > HAVE_RETRIED && ret >= 0) {
         |                        ^~~~~~~~~~~~
   fs/ceph/rdwr.c: In function 'ceph_write_iter':
   fs/ceph/rdwr.c:861:17: error: implicit declaration of function 'ceph_start_io_direct'; did you mean 'netfs_start_io_direct'? [-Werror=implicit-function-declaration]
     861 |                 ceph_start_io_direct(inode);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 netfs_start_io_direct
   fs/ceph/rdwr.c:863:17: error: implicit declaration of function 'ceph_start_io_write'; did you mean 'netfs_start_io_write'? [-Werror=implicit-function-declaration]
     863 |                 ceph_start_io_write(inode);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 netfs_start_io_write
   fs/ceph/rdwr.c:949:35: error: implicit declaration of function 'ceph_sync_write'; did you mean 'ceph_issue_write'? [-Werror=implicit-function-declaration]
     949 |                         written = ceph_sync_write(iocb, &data, pos, snapc);
         |                                   ^~~~~~~~~~~~~~~
         |                                   ceph_issue_write
   fs/ceph/rdwr.c:951:25: error: implicit declaration of function 'ceph_end_io_direct'; did you mean 'netfs_end_io_direct'? [-Werror=implicit-function-declaration]
     951 |                         ceph_end_io_direct(inode);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         netfs_end_io_direct
   fs/ceph/rdwr.c:953:25: error: implicit declaration of function 'ceph_end_io_write'; did you mean 'netfs_end_io_write'? [-Werror=implicit-function-declaration]
     953 |                         ceph_end_io_write(inode);
         |                         ^~~~~~~~~~~~~~~~~
         |                         netfs_end_io_write
   fs/ceph/rdwr.c: At top level:
   fs/ceph/rdwr.c:828:16: warning: 'ceph_write_iter' defined but not used [-Wunused-function]
     828 | static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
         |                ^~~~~~~~~~~~~~~
   fs/ceph/rdwr.c:670:16: warning: 'ceph_read_iter' defined but not used [-Wunused-function]
     670 | static ssize_t ceph_read_iter(struct kiocb *iocb, struct iov_iter *to)
         |                ^~~~~~~~~~~~~~
   fs/ceph/rdwr.c:582:12: warning: 'get_writepages_data_length' defined but not used [-Wunused-function]
     582 | static u64 get_writepages_data_length(struct inode *inode,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> fs/ceph/addr.c:128:13: warning: 'ceph_invalidate_folio' defined but not used [-Wunused-function]
     128 | static void ceph_invalidate_folio(struct folio *folio, size_t offset,
         |             ^~~~~~~~~~~~~~~~~~~~~
>> fs/ceph/addr.c:71:13: warning: 'ceph_dirty_folio' defined but not used [-Wunused-function]
      71 | static bool ceph_dirty_folio(struct address_space *mapping, struct folio *folio)
         |             ^~~~~~~~~~~~~~~~
--
   fs/ceph/crypto.c:545:5: warning: no previous prototype for 'ceph_fscrypt_decrypt_pages' [-Wmissing-prototypes]
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.c:591:5: error: conflicting types for 'ceph_fscrypt_decrypt_extents'; have 'int(struct inode *, struct page **, u64,  struct ceph_sparse_extent *, u32)' {aka 'int(struct inode *, struct page **, long long unsigned int,  struct ceph_sparse_extent *, unsigned int)'}
     591 | int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/ceph/super.h:26,
                    from fs/ceph/crypto.c:14:
   fs/ceph/crypto.h:160:5: note: previous declaration of 'ceph_fscrypt_decrypt_extents' with type 'int(struct inode *, struct ceph_databuf *, u64,  struct ceph_sparse_extent *, u32)' {aka 'int(struct inode *, struct ceph_databuf *, long long unsigned int,  struct ceph_sparse_extent *, unsigned int)'}
     160 | int ceph_fscrypt_decrypt_extents(struct inode *inode, struct ceph_databuf *dbuf, u64 off,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.c: In function 'ceph_fscrypt_decrypt_extents':
   fs/ceph/crypto.c:625:58: error: passing argument 2 of 'ceph_fscrypt_decrypt_pages' from incompatible pointer type [-Werror=incompatible-pointer-types]
     625 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                          ^~~~~~~~~~~~
         |                                                          |
         |                                                          struct page **
   fs/ceph/crypto.c:545:74: note: expected 'struct ceph_databuf *' but argument is of type 'struct page **'
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |                                                     ~~~~~~~~~~~~~~~~~~~~~^~~~
   fs/ceph/crypto.c: At top level:
>> fs/ceph/crypto.c:640:5: warning: no previous prototype for 'ceph_decrypt_block' [-Wmissing-prototypes]
     640 | int ceph_decrypt_block(struct netfs_io_request *rreq, loff_t pos, size_t len,
         |     ^~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.c: In function 'ceph_decrypt_block':
>> fs/ceph/crypto.c:644:42: error: 'op' undeclared (first use in this function); did you mean 'up'?
     644 |         struct ceph_sparse_extent *map = op->extent.sparse_ext;
         |                                          ^~
         |                                          up
   fs/ceph/crypto.c:644:42: note: each undeclared identifier is reported only once for each function it appears in
>> fs/ceph/crypto.c:645:49: error: 'inode' undeclared (first use in this function)
     645 |         struct ceph_inode_info *ci = ceph_inode(inode);
         |                                                 ^~~~~
>> fs/ceph/crypto.c:671:59: error: 'page' undeclared (first use in this function)
     671 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                           ^~~~
>> fs/ceph/crypto.c:672:50: error: 'off' undeclared (first use in this function)
     672 |                                                  off + pgsoff, ext->len);
         |                                                  ^~~
>> fs/ceph/crypto.c:663:21: warning: variable 'pgidx' set but not used [-Wunused-but-set-variable]
     663 |                 int pgidx = pgsoff >> PAGE_SHIFT;
         |                     ^~~~~
   fs/ceph/crypto.c: At top level:
>> fs/ceph/crypto.c:686:5: warning: no previous prototype for 'ceph_encrypt_block' [-Wmissing-prototypes]
     686 | int ceph_encrypt_block(struct netfs_io_request *wreq, loff_t pos, size_t len,
         |     ^~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.c: In function 'ceph_encrypt_block':
>> fs/ceph/crypto.c:690:1: warning: control reaches end of non-void function [-Wreturn-type]
     690 | }
         | ^
   cc1: some warnings being treated as errors
--
   fs/ceph/inode.c: In function 'ceph_fill_inode':
>> fs/ceph/inode.c:1057:21: error: 'struct netfs_inode' has no member named 'min_bshift'
    1057 |                 ictx->min_bshift = ictx->crypto_bshift;
         |                     ^~


vim +1746 fs/ceph/file.c

64bf5ff58dff75 Dave Chinner 2019-06-05  1741  
124e68e7409909 Sage Weil    2009-10-06  1742  const struct file_operations ceph_file_fops = {
124e68e7409909 Sage Weil    2009-10-06  1743  	.open = ceph_open,
124e68e7409909 Sage Weil    2009-10-06  1744  	.release = ceph_release,
124e68e7409909 Sage Weil    2009-10-06  1745  	.llseek = ceph_llseek,
3644424dc63094 Al Viro      2014-04-02 @1746  	.read_iter = ceph_read_iter,
4908b822b300d2 Al Viro      2014-04-03 @1747  	.write_iter = ceph_write_iter,

:::::: The code at line 1746 was first introduced by commit
:::::: 3644424dc6309439c4c8d97590cdac4100376255 ceph: switch to ->read_iter()

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
