Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123D0372
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jan 2025 17:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738171951; cv=none; b=EhwA4n8rHUyh1sXYMDn/ViJBph/5Ijk1zAzRSF0KggAvR1GmC/ryIY9XG/yxIUoJtm/z6keRST5Md/O/GVIkNGY/pa+JGdOFU0VBCcjoaAN6sbKpOL74xJG5TTjCjmcjptXhzDRhCuYIaborK/AiFuAKwpk7mhvRde+QrTRSFJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738171951; c=relaxed/simple;
	bh=YZOz0uiEP8xv/cOIvRXaYEKTzg4M8P0BXmCK3OCIs34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I4p2AkskpiVBYshKQfzQeawfRJsMgeozmXtJIS8zc/k7YIc9Kx7ptO8ZM7aGms4vXG/wjta71u5gqTbIurzb8VKDxfzhkGzc2Sp+AWUYDHzmP9f0Q1ws5ZnLiFjWAJqjAgdB06UZPKvujiQ8fXqNdHmaQrMzVLP3/ox//oidBOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbEcUXv1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbEcUXv1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738171949; x=1769707949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YZOz0uiEP8xv/cOIvRXaYEKTzg4M8P0BXmCK3OCIs34=;
  b=nbEcUXv182Qjbz/dR6tjZN7+kQGnkWsbSBNVoiZzVIErnXffmplOAYuw
   esvYd9QimwsAKQxfdvLoCITzneq1fyQZL6FN3t9/CepL6Iz5/aRlGGpge
   Y8Hb8Hz43ridT7mypJTQvhUWa+Cap/pqMPDDxslXYG5GyWiN2d3YVjmmq
   v3CXJCgIgPCEImn4V6B4bfo+HESdTeLRLCQ5pHU3piip2KlDn3a5b/8QA
   YU/v7YbYhm8MQq2dSC7SUYugcrsTvEJhgLYfKMIMsHnmHJbGhSc/oiO7/
   nJs1UHVl518pgmmMRje01z9BaUWnM9yY4v/IyWqYRFLPvNdhmAEn5klYp
   A==;
X-CSE-ConnectionGUID: ODWRMYwNS0KGSyXU/0gDfg==
X-CSE-MsgGUID: hhMHEoK5T9edIVl0h6WjGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38863507"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="38863507"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 09:32:28 -0800
X-CSE-ConnectionGUID: LM4SfmfQQee6QQfg+A6UQg==
X-CSE-MsgGUID: T/gCSMW9QCCtovkczRHotQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="108911526"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jan 2025 09:32:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdBvN-000jBv-0k;
	Wed, 29 Jan 2025 17:32:25 +0000
Date: Thu, 30 Jan 2025 01:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 43/43] fs/ceph/rdwr.c:644:29: error:
 'ceph_invalidate_folio' undeclared here (not in a function); did you mean
 'netfs_invalidate_folio'?
Message-ID: <202501300130.yYJqg1DM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   99bca1b95b54b7a3e7260c2431b587639482a71d
commit: 99bca1b95b54b7a3e7260c2431b587639482a71d [43/43] ceph: Use netfslib
config: arm-randconfig-001-20250129 (https://download.01.org/0day-ci/archive/20250130/202501300130.yYJqg1DM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300130.yYJqg1DM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501300130.yYJqg1DM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/ceph/rdwr.c:51:
   include/trace/events/netfs.h:110:12: error: redeclaration of enumerator 'netfs_sreq_trace_need_retry'
     110 |         EM(netfs_sreq_trace_need_retry,         "ND-RT")        \
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/netfs.h:243:18: note: in definition of macro 'EM'
     243 | #define EM(a, b) a,
         |                  ^
   include/trace/events/netfs.h:249:25: note: in expansion of macro 'netfs_sreq_traces'
     249 | enum netfs_sreq_trace { netfs_sreq_traces } __mode(byte);
         |                         ^~~~~~~~~~~~~~~~~
   include/trace/events/netfs.h:107:12: note: previous definition of 'netfs_sreq_trace_need_retry' with type 'int'
     107 |         EM(netfs_sreq_trace_need_retry,         "NRTRY")        \
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/events/netfs.h:243:18: note: in definition of macro 'EM'
     243 | #define EM(a, b) a,
         |                  ^
   include/trace/events/netfs.h:249:25: note: in expansion of macro 'netfs_sreq_traces'
     249 | enum netfs_sreq_trace { netfs_sreq_traces } __mode(byte);
         |                         ^~~~~~~~~~~~~~~~~
>> fs/ceph/rdwr.c:644:29: error: 'ceph_invalidate_folio' undeclared here (not in a function); did you mean 'netfs_invalidate_folio'?
     644 |         .invalidate_folio = ceph_invalidate_folio,
         |                             ^~~~~~~~~~~~~~~~~~~~~
         |                             netfs_invalidate_folio
   fs/ceph/rdwr.c: In function 'ceph_write_iter':
>> fs/ceph/rdwr.c:847:35: error: implicit declaration of function 'ceph_direct_read_write'; did you mean 'ceph_prepare_write'? [-Wimplicit-function-declaration]
     847 |                         written = ceph_direct_read_write(iocb, &data, snapc,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
         |                                   ceph_prepare_write
>> fs/ceph/rdwr.c:850:35: error: implicit declaration of function 'ceph_sync_write'; did you mean 'ceph_issue_write'? [-Wimplicit-function-declaration]
     850 |                         written = ceph_sync_write(iocb, &data, pos, snapc);
         |                                   ^~~~~~~~~~~~~~~
         |                                   ceph_issue_write
   fs/ceph/rdwr.c: At top level:
   fs/ceph/rdwr.c:728:16: warning: 'ceph_write_iter' defined but not used [-Wunused-function]
     728 | static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
         |                ^~~~~~~~~~~~~~~
   fs/ceph/rdwr.c:657:16: warning: 'ceph_read_iter' defined but not used [-Wunused-function]
     657 | static ssize_t ceph_read_iter(struct kiocb *iocb, struct iov_iter *to)
         |                ^~~~~~~~~~~~~~
>> fs/ceph/rdwr.c:90:13: warning: 'ceph_put_many_snap_context' defined but not used [-Wunused-function]
      90 | static void ceph_put_many_snap_context(struct ceph_snap_context *sc, unsigned int nr)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +644 fs/ceph/rdwr.c

   638	
   639	const struct address_space_operations ceph_aops = {
   640		.read_folio	= netfs_read_folio,
   641		.readahead	= netfs_readahead,
   642		.writepages	= ceph_writepages,
   643		.dirty_folio	= netfs_dirty_folio,
 > 644		.invalidate_folio = ceph_invalidate_folio,
   645		.release_folio	= netfs_release_folio,
   646		.direct_IO	= noop_direct_IO,
   647		.migrate_folio	= filemap_migrate_folio,
   648	};
   649	
   650	/*
   651	 * Wrap generic_file_aio_read with checks for cap bits on the inode.
   652	 * Atomically grab references, so that those bits are not released
   653	 * back to the MDS mid-read.
   654	 *
   655	 * Hmm, the sync read case isn't actually async... should it be?
   656	 */
   657	static ssize_t ceph_read_iter(struct kiocb *iocb, struct iov_iter *to)
   658	{
   659		struct file *filp = iocb->ki_filp;
   660		struct inode *inode = file_inode(filp);
   661		struct ceph_inode_info *ci = ceph_inode(inode);
   662		struct ceph_file_info *fi = filp->private_data;
   663		struct ceph_client *cl = ceph_inode_to_client(inode);
   664		ssize_t ret;
   665		size_t len = iov_iter_count(to);
   666		bool dio = iocb->ki_flags & IOCB_DIRECT;
   667		int want = 0, got = 0;
   668	
   669		doutc(cl, "%llu~%zu trying to get caps on %p %llx.%llx\n",
   670		      iocb->ki_pos, len, inode, ceph_vinop(inode));
   671	
   672		if (ceph_inode_is_shutdown(inode))
   673			return -ESTALE;
   674	
   675		if (dio)
   676			ret = netfs_start_io_direct(inode);
   677		else
   678			ret = netfs_start_io_read(inode);
   679		if (ret < 0)
   680			return ret;
   681	
   682		if (!(fi->flags & CEPH_F_SYNC) && !dio)
   683			want |= CEPH_CAP_FILE_CACHE;
   684		if (fi->fmode & CEPH_FILE_MODE_LAZY)
   685			want |= CEPH_CAP_FILE_LAZYIO;
   686	
   687		ret = ceph_get_caps(filp, CEPH_CAP_FILE_RD, want, -1, &got);
   688		if (ret < 0)
   689			goto out;
   690	
   691		if ((got & (CEPH_CAP_FILE_CACHE|CEPH_CAP_FILE_LAZYIO)) == 0 ||
   692		    dio ||
   693		    (fi->flags & CEPH_F_SYNC)) {
   694			doutc(cl, "sync %p %llx.%llx %llu~%zu got cap refs on %s\n",
   695			      inode, ceph_vinop(inode), iocb->ki_pos, len,
   696			      ceph_cap_string(got));
   697	
   698			ret = netfs_unbuffered_read_iter(iocb, to);
   699		} else {
   700			doutc(cl, "async %p %llx.%llx %llu~%zu got cap refs on %s\n",
   701			      inode, ceph_vinop(inode), iocb->ki_pos, len,
   702			      ceph_cap_string(got));
   703			ret = filemap_read(iocb, to, 0);
   704		}
   705	
   706		doutc(cl, "%p %llx.%llx dropping cap refs on %s = %zd\n",
   707		      inode, ceph_vinop(inode), ceph_cap_string(got), ret);
   708		ceph_put_cap_refs(ci, got);
   709	
   710	out:
   711		if (dio)
   712			netfs_end_io_direct(inode);
   713		else
   714			netfs_end_io_read(inode);
   715		return ret;
   716	}
   717	
   718	/*
   719	 * Take cap references to avoid releasing caps to MDS mid-write.
   720	 *
   721	 * If we are synchronous, and write with an old snap context, the OSD
   722	 * may return EOLDSNAPC.  In that case, retry the write.. _after_
   723	 * dropping our cap refs and allowing the pending snap to logically
   724	 * complete _before_ this write occurs.
   725	 *
   726	 * If we are near ENOSPC, write synchronously.
   727	 */
 > 728	static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
