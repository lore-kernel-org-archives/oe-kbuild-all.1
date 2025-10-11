Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8577A26A0C5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Oct 2025 11:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760183876; cv=none; b=LCPKRwBqo/SGwVQMv0T8ZUoQ0N705YpDMVYLMcirTStPykBUmY8YSv8iciyndNHX75dukXkpJgSXNcUHzZ+g0MGzg7P6Fr0wlT3ER0/G9sI9PoaoPfV8tn9D/3f8CN60aSZ+8lrNrI1numgkBUfSZYYMCc8LUgc7uqsAp8J/64w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760183876; c=relaxed/simple;
	bh=N4Kr+MZVc89G9icH63LRHU0AE7N/D9Pb+BbiFhVjpYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NqIKhEc8yYYDusjm+/MHpHEOrz+kEHYX8G+bERM+LewZUy+RxcjhoA95lrcZOrvjZFCbTijihKZ0p+HDoe4cfxCW8a/lqzvEywv4tIJQ+1xkgW0hJ5w32h5ZZ3ekPY+7fqiisk2gBuNrrcbZ3YsGBsg1g2+MRAEzlNV8e9DFqkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aht7tB5p; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aht7tB5p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760183871; x=1791719871;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N4Kr+MZVc89G9icH63LRHU0AE7N/D9Pb+BbiFhVjpYA=;
  b=Aht7tB5pPimZ6KtS1L9UN78Q8bJkRIDyr++kfKx+KmHSNt1ww/t6c/TI
   IVoP8Bcyby0EFAgEAcNkIgOVUhiNly9q1loS+TCGLxXJYl1NTcT8QAhjA
   ICR3v+4GRVFoSHOo62VwPogvm/OTRp00KhhUK9lSMtlDFHS+ky2CLZYHW
   aV0GuUwqsxBgdMSD23BaUsrEAK45FUZJqo//35eRh+Ob1SkSxbml0Q0qB
   cLqa/OKJ92WPxCenQJF69HQSc8COSKAPa8lCwMD0mTvlvZ8oEvjMT9A3C
   yc5nMxxcVevXtKd2QgRk3GEvyj8ltTX3qSSmmoJGKAJO0NPJLtD4qRk+E
   w==;
X-CSE-ConnectionGUID: 4wdJ6nRnSBmUzIfN+G7aHA==
X-CSE-MsgGUID: BX/GWE8fSH+08e92ysl7hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="72996480"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="72996480"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 04:57:50 -0700
X-CSE-ConnectionGUID: jL/MH/BpQOy29dsdau/lkA==
X-CSE-MsgGUID: ntgHCiZZR4Suvfoomdd0DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="204862787"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Oct 2025 04:57:48 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7YEM-0003k9-20;
	Sat, 11 Oct 2025 11:57:46 +0000
Date: Sat, 11 Oct 2025 19:57:06 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
Message-ID: <202510111943.j0LGa569-lkp@intel.com>
References: <aOa0ijW1h-1tynWD@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOa0ijW1h-1tynWD@kernel.org>

Hi Mike,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251009]
[also build test ERROR on linus/master]
[cannot apply to brauner-vfs/vfs.all v6.17 v6.17-rc7 v6.17-rc6 v6.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Snitzer/NFSD-Implement-NFSD_IO_DIRECT-for-NFS-WRITE/20251010-133404
base:   next-20251009
patch link:    https://lore.kernel.org/r/aOa0ijW1h-1tynWD%40kernel.org
patch subject: [PATCH v2] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
config: sparc-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510111943.j0LGa569-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111943.j0LGa569-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111943.j0LGa569-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfsd/vfs.c: In function 'nfsd_vfs_write':
>> fs/nfsd/vfs.c:1437:14: error: 'NFSD_IO_DIRECT' undeclared (first use in this function)
    1437 |         case NFSD_IO_DIRECT:
         |              ^~~~~~~~~~~~~~
   fs/nfsd/vfs.c:1437:14: note: each undeclared identifier is reported only once for each function it appears in
--
   fs/nfsd/debugfs.c: In function 'nfsd_io_cache_write_set':
>> fs/nfsd/debugfs.c:109:14: error: 'NFSD_IO_DIRECT' undeclared (first use in this function)
     109 |         case NFSD_IO_DIRECT:
         |              ^~~~~~~~~~~~~~
   fs/nfsd/debugfs.c:109:14: note: each undeclared identifier is reported only once for each function it appears in


vim +/NFSD_IO_DIRECT +1437 fs/nfsd/vfs.c

  1367	
  1368	/**
  1369	 * nfsd_vfs_write - write data to an already-open file
  1370	 * @rqstp: RPC execution context
  1371	 * @fhp: File handle of file to write into
  1372	 * @nf: An open file matching @fhp
  1373	 * @offset: Byte offset of start
  1374	 * @payload: xdr_buf containing the write payload
  1375	 * @cnt: IN: number of bytes to write, OUT: number of bytes actually written
  1376	 * @stable: An NFS stable_how value
  1377	 * @verf: NFS WRITE verifier
  1378	 *
  1379	 * Upon return, caller must invoke fh_put on @fhp.
  1380	 *
  1381	 * Return values:
  1382	 *   An nfsstat value in network byte order.
  1383	 */
  1384	__be32
  1385	nfsd_vfs_write(struct svc_rqst *rqstp, struct svc_fh *fhp,
  1386		       struct nfsd_file *nf, loff_t offset,
  1387		       const struct xdr_buf *payload, unsigned long *cnt,
  1388		       int stable, __be32 *verf)
  1389	{
  1390		struct nfsd_net		*nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
  1391		struct file		*file = nf->nf_file;
  1392		struct super_block	*sb = file_inode(file)->i_sb;
  1393		struct kiocb		kiocb;
  1394		struct svc_export	*exp;
  1395		errseq_t		since;
  1396		__be32			nfserr;
  1397		int			host_err;
  1398		unsigned long		exp_op_flags = 0;
  1399		unsigned int		pflags = current->flags;
  1400		bool			restore_flags = false;
  1401		unsigned int		nvecs;
  1402	
  1403		trace_nfsd_write_opened(rqstp, fhp, offset, *cnt);
  1404	
  1405		if (sb->s_export_op)
  1406			exp_op_flags = sb->s_export_op->flags;
  1407	
  1408		if (test_bit(RQ_LOCAL, &rqstp->rq_flags) &&
  1409		    !(exp_op_flags & EXPORT_OP_REMOTE_FS)) {
  1410			/*
  1411			 * We want throttling in balance_dirty_pages()
  1412			 * and shrink_inactive_list() to only consider
  1413			 * the backingdev we are writing to, so that nfs to
  1414			 * localhost doesn't cause nfsd to lock up due to all
  1415			 * the client's dirty pages or its congested queue.
  1416			 */
  1417			current->flags |= PF_LOCAL_THROTTLE;
  1418			restore_flags = true;
  1419		}
  1420	
  1421		exp = fhp->fh_export;
  1422	
  1423		if (!EX_ISSYNC(exp))
  1424			stable = NFS_UNSTABLE;
  1425		init_sync_kiocb(&kiocb, file);
  1426		kiocb.ki_pos = offset;
  1427		if (stable && !fhp->fh_use_wgather)
  1428			kiocb.ki_flags |= IOCB_DSYNC;
  1429	
  1430		nvecs = xdr_buf_to_bvec(rqstp->rq_bvec, rqstp->rq_maxpages, payload);
  1431	
  1432		since = READ_ONCE(file->f_wb_err);
  1433		if (verf)
  1434			nfsd_copy_write_verifier(verf, nn);
  1435	
  1436		switch (nfsd_io_cache_write) {
> 1437		case NFSD_IO_DIRECT:
  1438			host_err = nfsd_direct_write(rqstp, fhp, nf, offset,
  1439						     nvecs, cnt, &kiocb);
  1440			break;
  1441		case NFSD_IO_DONTCACHE:
  1442			if (file->f_op->fop_flags & FOP_DONTCACHE)
  1443				kiocb.ki_flags |= IOCB_DONTCACHE;
  1444			fallthrough; /* must call nfsd_buffered_write */
  1445		case NFSD_IO_BUFFERED:
  1446			host_err = nfsd_buffered_write(rqstp, file,
  1447						       nvecs, cnt, &kiocb);
  1448			break;
  1449		}
  1450		if (host_err < 0) {
  1451			commit_reset_write_verifier(nn, rqstp, host_err);
  1452			goto out_nfserr;
  1453		}
  1454		nfsd_stats_io_write_add(nn, exp, *cnt);
  1455		fsnotify_modify(file);
  1456		host_err = filemap_check_wb_err(file->f_mapping, since);
  1457		if (host_err < 0)
  1458			goto out_nfserr;
  1459	
  1460		if (stable && fhp->fh_use_wgather) {
  1461			host_err = wait_for_concurrent_writes(file);
  1462			if (host_err < 0)
  1463				commit_reset_write_verifier(nn, rqstp, host_err);
  1464		}
  1465	
  1466	out_nfserr:
  1467		if (host_err >= 0) {
  1468			trace_nfsd_write_io_done(rqstp, fhp, offset, *cnt);
  1469			nfserr = nfs_ok;
  1470		} else {
  1471			trace_nfsd_write_err(rqstp, fhp, offset, host_err);
  1472			nfserr = nfserrno(host_err);
  1473		}
  1474		if (restore_flags)
  1475			current_restore_flags(pflags, PF_LOCAL_THROTTLE);
  1476		return nfserr;
  1477	}
  1478	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
