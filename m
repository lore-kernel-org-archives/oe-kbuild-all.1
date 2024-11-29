Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790563224
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 21:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732916281; cv=none; b=Zhme45CdkdaW5f3V+023biQWNFf63VWko2YZGlO65GrpmG4soWtUrTxTdscWXoHee17RF7zmDYPJNF6+GxoYOnyh/AnMDYrA0a1N4OFMKcfRDc6BBzrqslL9Wm7s0hR2jqKW9AtzVaXTlMipD0HVAkysjIpZINqPe2UMehhovIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732916281; c=relaxed/simple;
	bh=K2WVk9+rW9xCqvP/Hyn4qBX1QbmpQKG+a1+ANXkyMDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MoPG6O0BeYuOS4zAi5k7YC4HxsSUC/sXr85A8CBf1cmBMfp9LjvHtuY3HG2KEjFBrytCIh6+yoguQj/CZzPKgzabFUxmg4BbSeE6EgtLVkfJGu2FnvKDaxTC0I8wDfWMTlqMOhWdP0wPi3Y5eSqkpGcviN2SKNEVVk3IYDyn19Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQfXTHMR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQfXTHMR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732916279; x=1764452279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K2WVk9+rW9xCqvP/Hyn4qBX1QbmpQKG+a1+ANXkyMDY=;
  b=dQfXTHMRDxxS+TG+6z7GGY7aWUtduDMPwW3WGZIpYa3qncIN9RFxmy2r
   c0BGuYJWHWHdGJqAgX4ZUZx2UTwP9imknXYEFN2xuKS/1PqkE7ykbuj4D
   BrSZmTjNSb8NdzO2wwzN2H9Xa/OfmeTTavSZxw+mz7KNRBxCg0P0ciyw0
   l7JNfkLi4iA5EthQjxDVq6++oc9b2qkzgJRQvUAbDTBneU72TnASPslrU
   EAp8Ye0XwdwkfOE2rXpnpFSy70FdaumyFU3D7vYJPfBtUGgWZLq5w/72h
   WAEqYJV7FGfFBjM9Jo/iA8QcZ07U0ZHItuV8+Kx8A0iKqu/bGkUPSybU/
   w==;
X-CSE-ConnectionGUID: g6Ng4zROQFqijUdZj6Wxtg==
X-CSE-MsgGUID: 62lu53ODRZmF44oF6nNGkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="43820982"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="43820982"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 13:37:58 -0800
X-CSE-ConnectionGUID: cC0+hqn1TeSuT4Z2I/DWuQ==
X-CSE-MsgGUID: 1xejOSUCQma7tvDS5iGHrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="93404739"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Nov 2024 13:37:57 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH8gU-0000iT-0T;
	Fri, 29 Nov 2024 21:37:54 +0000
Date: Sat, 30 Nov 2024 05:37:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 92/92] fs/ceph/rdwr.c:591:15: error:
 assignment to 'struct ceph_snap_context *' from 'int' makes pointer from
 integer without a cast
Message-ID: <202411300526.UyCHgjtQ-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241130/202411300526.UyCHgjtQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300526.UyCHgjtQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300526.UyCHgjtQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/rdwr.c: In function 'ceph_netfs_write_callback':
   fs/ceph/rdwr.c:116:33: error: 'NETFS_RREQ_REPEAT_RMW' undeclared (first use in this function); did you mean 'NETFS_RREQ_RMW'?
     116 |                         set_bit(NETFS_RREQ_REPEAT_RMW, &ci->netfs.flags);
         |                                 ^~~~~~~~~~~~~~~~~~~~~
         |                                 NETFS_RREQ_RMW
   fs/ceph/rdwr.c:116:33: note: each undeclared identifier is reported only once for each function it appears in
   fs/ceph/rdwr.c:125:9: error: implicit declaration of function 'netfs_subreq_terminated'; did you mean 'netfs_read_subreq_terminated'? [-Wimplicit-function-declaration]
     125 |         netfs_subreq_terminated(subreq, wrote, err);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         netfs_read_subreq_terminated
   fs/ceph/rdwr.c: In function 'ceph_issue_write':
   fs/ceph/rdwr.c:139:49: error: 'inode' undeclared (first use in this function)
     139 |         struct ceph_inode_info *ci = ceph_inode(inode);
         |                                                 ^~~~~
   In file included from include/linux/printk.h:599,
                    from include/linux/kernel.h:31,
                    from include/linux/backing-dev.h:12,
                    from fs/ceph/rdwr.c:39:
   fs/ceph/rdwr.c:146:64: error: 'struct netfs_io_subrequest' has no member named 'max_len'
     146 |               subreq->start, subreq->len, subreq->start, subreq->max_len,
         |                                                                ^~
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:614:9: note: in expansion of macro 'dynamic_pr_debug'
     614 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   include/linux/ceph/ceph_debug.h:23:9: note: in expansion of macro 'pr_debug'
      23 |         pr_debug("%.*s %12.12s:%-4d : [%pU %llu] " fmt,                 \
         |         ^~~~~~~~
   fs/ceph/rdwr.c:144:9: note: in expansion of macro 'doutc'
     144 |         doutc(cl, "issue_write R=%08x[%x] ino %llx %lld~%zu part %lld~%llu -- %srmw\n",
         |         ^~~~~
   fs/ceph/rdwr.c:180:21: error: 'assert_ver' undeclared (first use in this function)
     180 |                 if (assert_ver) {
         |                     ^~~~~~~~~~
   fs/ceph/rdwr.c: In function 'ceph_prepare_write':
   fs/ceph/rdwr.c:209:64: error: 'struct netfs_io_subrequest' has no member named 'max_len'
     209 |                                       &objnum, &objoff, &subreq->max_len);
         |                                                                ^~
   fs/ceph/rdwr.c:203:29: warning: unused variable 'cl' [-Wunused-variable]
     203 |         struct ceph_client *cl = ceph_inode_to_client(subreq->rreq->inode);
         |                             ^~
   fs/ceph/rdwr.c:200:33: warning: unused variable 'creq' [-Wunused-variable]
     200 |         struct ceph_io_request *creq = csub->creq;
         |                                 ^~~~
   fs/ceph/rdwr.c: In function 'ceph_netfs_clamp_length':
   fs/ceph/rdwr.c:266:9: error: 'rreq' undeclared (first use in this function); did you mean 'rseq'?
     266 |         rreq->io_streams[0].sreq_max_len = umin(xlen, fsc->mount_options->rsize);
         |         ^~~~
         |         rseq
   fs/ceph/rdwr.c: In function 'ceph_netfs_read_callback':
   fs/ceph/rdwr.c:313:9: error: too many arguments to function 'netfs_read_subreq_terminated'
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
   fs/ceph/rdwr.c:335:25: warning: unused variable 'iter' [-Wunused-variable]
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
   fs/ceph/rdwr.c:514:10: error: 'const struct netfs_request_ops' has no member named 'clamp_length'
     514 |         .clamp_length           = ceph_netfs_clamp_length,
         |          ^~~~~~~~~~~~
   fs/ceph/rdwr.c:514:35: error: initialization of 'int (*)(struct netfs_io_subrequest *)' from incompatible pointer type 'bool (*)(struct netfs_io_subrequest *)' {aka '_Bool (*)(struct netfs_io_subrequest *)'} [-Wincompatible-pointer-types]
     514 |         .clamp_length           = ceph_netfs_clamp_length,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/rdwr.c:514:35: note: (near initialization for 'ceph_netfs_ops.prepare_read')
   fs/ceph/rdwr.c: In function 'get_oldest_context':
   fs/ceph/rdwr.c:541:50: error: 'page_snapc' undeclared (first use in this function)
     541 |                 if (snapc && capsnap->context != page_snapc)
         |                                                  ^~~~~~~~~~
   fs/ceph/rdwr.c: In function 'get_writepages_data_length':
   fs/ceph/rdwr.c:591:17: error: implicit declaration of function 'folio_snap_context' [-Wimplicit-function-declaration]
     591 |         snapc = folio_snap_context(ceph_fscrypt_pagecache_folio(folio));
         |                 ^~~~~~~~~~~~~~~~~~
>> fs/ceph/rdwr.c:591:15: error: assignment to 'struct ceph_snap_context *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     591 |         snapc = folio_snap_context(ceph_fscrypt_pagecache_folio(folio));
         |               ^
   fs/ceph/rdwr.c: In function 'ceph_writepages':
   fs/ceph/rdwr.c:629:25: error: too few arguments to function 'get_oldest_context'
     629 |                 snapc = get_oldest_context(mapping->host, &ceph_wbc);
         |                         ^~~~~~~~~~~~~~~~~~
   fs/ceph/rdwr.c:525:1: note: declared here
     525 | get_oldest_context(struct inode *inode, struct ceph_writeback_ctl *ctl,
         | ^~~~~~~~~~~~~~~~~~
   fs/ceph/rdwr.c: At top level:
   fs/ceph/rdwr.c:656:27: error: 'ceph_dirty_folio' undeclared here (not in a function); did you mean 'netfs_dirty_folio'?
     656 |         .dirty_folio    = ceph_dirty_folio,
         |                           ^~~~~~~~~~~~~~~~
         |                           netfs_dirty_folio
   fs/ceph/rdwr.c:657:29: error: 'ceph_invalidate_folio' undeclared here (not in a function); did you mean 'netfs_invalidate_folio'?
     657 |         .invalidate_folio = ceph_invalidate_folio,
         |                             ^~~~~~~~~~~~~~~~~~~~~
         |                             netfs_invalidate_folio
   fs/ceph/rdwr.c: In function 'ceph_read_iter':
   fs/ceph/rdwr.c:721:39: error: implicit declaration of function 'ceph_direct_read_write'; did you mean 'ceph_prepare_write'? [-Wimplicit-function-declaration]
     721 |                                 ret = ceph_direct_read_write(iocb, to,
         |                                       ^~~~~~~~~~~~~~~~~~~~~~
         |                                       ceph_prepare_write
   fs/ceph/rdwr.c:724:52: error: 'CHECK_EOF' undeclared (first use in this function)
     724 |                                         retry_op = CHECK_EOF;
         |                                                    ^~~~~~~~~
   fs/ceph/rdwr.c:726:39: error: implicit declaration of function 'ceph_sync_read' [-Wimplicit-function-declaration]
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
   fs/ceph/rdwr.c:861:17: error: implicit declaration of function 'ceph_start_io_direct'; did you mean 'netfs_start_io_direct'? [-Wimplicit-function-declaration]
     861 |                 ceph_start_io_direct(inode);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 netfs_start_io_direct
   fs/ceph/rdwr.c:863:17: error: implicit declaration of function 'ceph_start_io_write'; did you mean 'netfs_start_io_write'? [-Wimplicit-function-declaration]
     863 |                 ceph_start_io_write(inode);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 netfs_start_io_write
   fs/ceph/rdwr.c:949:35: error: implicit declaration of function 'ceph_sync_write'; did you mean 'ceph_issue_write'? [-Wimplicit-function-declaration]
     949 |                         written = ceph_sync_write(iocb, &data, pos, snapc);
         |                                   ^~~~~~~~~~~~~~~
         |                                   ceph_issue_write
   fs/ceph/rdwr.c:951:25: error: implicit declaration of function 'ceph_end_io_direct'; did you mean 'netfs_end_io_direct'? [-Wimplicit-function-declaration]
     951 |                         ceph_end_io_direct(inode);
         |                         ^~~~~~~~~~~~~~~~~~
         |                         netfs_end_io_direct
   fs/ceph/rdwr.c:953:25: error: implicit declaration of function 'ceph_end_io_write'; did you mean 'netfs_end_io_write'? [-Wimplicit-function-declaration]
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


vim +591 fs/ceph/rdwr.c

   581	
   582	static u64 get_writepages_data_length(struct inode *inode,
   583					      struct folio *folio, u64 start)
   584	{
   585		struct ceph_inode_info *ci = ceph_inode(inode);
   586		struct ceph_snap_context *snapc;
   587		struct ceph_cap_snap *capsnap = NULL;
   588		u64 end = i_size_read(inode), fend;
   589		u64 ret;
   590	
 > 591		snapc = folio_snap_context(ceph_fscrypt_pagecache_folio(folio));
   592		if (snapc != ci->i_head_snapc) {
   593			bool found = false;
   594			spin_lock(&ci->i_ceph_lock);
   595			list_for_each_entry(capsnap, &ci->i_cap_snaps, ci_item) {
   596				if (capsnap->context == snapc) {
   597					if (!capsnap->writing)
   598						end = capsnap->size;
   599					found = true;
   600					break;
   601				}
   602			}
   603			spin_unlock(&ci->i_ceph_lock);
   604			WARN_ON(!found);
   605		}
   606	
   607		fend = ceph_fscrypt_folio_pos(folio) + folio_size(folio);
   608		end = min(end, fend);
   609		ret = end > start ? end - start : 0;
   610		if (ret && fscrypt_is_bounce_folio(folio))
   611			ret = round_up(ret, CEPH_FSCRYPT_BLOCK_SIZE);
   612		return ret;
   613	}
   614	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
