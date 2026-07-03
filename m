Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FDC220687
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 01:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783042629; cv=none; b=svtcah+OSfaWYVG3Qr1rF/5pwzXBtF6NC0D9lYeXQ8lODP2gxeUucVdNdKeB08eRyAZQ9TOypXAXN8oO5gOjILjU4fNjPvrjdPucXObgNl8n2ULJEa8hR8iFzK5D4sZ3+Gm0nDVJpn5VYgu1zm4ppnJuMYYpChMxoD2x98DEn74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783042629; c=relaxed/simple;
	bh=oED4z5Eq9XN3DaNP79DICzkP/KR8U1Oyta6b9IZYPm4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QCe7n8ROWaeIxqajz9j97zEl/jevBb2c+J7MaVHXW8OFndY5YOoNd1R4uXWp2eSOcHD9x9dRQP5bK59dfMZu6+FIoWCoNOPHc9/38bCWCQt4WOasN9TKtRje1Iwj7AR9iqW37OmZIaODyunx8ccAhCGt64k5fB+4N7K9U2Iji4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdqM0Yy4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdqM0Yy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783042627; x=1814578627;
  h=date:from:to:cc:subject:message-id;
  bh=oED4z5Eq9XN3DaNP79DICzkP/KR8U1Oyta6b9IZYPm4=;
  b=gdqM0Yy4Kc27LkXtCiagCd1rPq/AdRmWLIvnnfZTWgxrBjREvhk1fkeO
   IINwxON82IrdtK4wJFjJ5uMoGhXHoojIURC3CGjjX1Q6V0iGvbAb+MMjh
   FmmOiXKaDB88KJjy78jH1lZduxcAHR3SPmugncryBJN3KBol6WYIuLz00
   pVadrXKTMwo2LH1f3NddLZ6jn0R4jwYJbM+/nSeLpYFy94NfafHLpDrup
   kcfKxF1xo41JRJE8H2DR+Ib5/ogaspUFZci2B5nGU8nzzRCRoakz7ez4M
   g+M9rqUkH8/hLe9bDA/nzk1DW+ZV5CCZZlg/2aGzQyaDrx6QyyA43MLlf
   A==;
X-CSE-ConnectionGUID: cpBFJ509TeaYTYncbhJQsw==
X-CSE-MsgGUID: QOcFZGbdRsGfUmtOnsAYoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95300129"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="95300129"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 18:37:07 -0700
X-CSE-ConnectionGUID: lXNvGFu7TRaVg0gsCLKDSA==
X-CSE-MsgGUID: BUg4MbjrRM2J73dOeXgz2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; 
   d="scan'208";a="250336798"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2026 18:37:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfSpz-00000000BWZ-0bNb;
	Fri, 03 Jul 2026 01:37:03 +0000
Date: Fri, 03 Jul 2026 09:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 21/21] fs/9p/vfs_addr.c:106:29:
 warning: unused variable 'n'
Message-ID: <202607030907.wYZTJWGt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   e291bb0346f243b63b5fca4ef35e440585cda032
commit: e291bb0346f243b63b5fca4ef35e440585cda032 [21/21] netfs: Combine prepare and issue ops and grab the buffers on request
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260703/202607030907.wYZTJWGt-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607030907.wYZTJWGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607030907.wYZTJWGt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/9p/vfs_addr.c: In function 'v9fs_issue_read':
>> fs/9p/vfs_addr.c:106:29: warning: unused variable 'n' [-Wunused-variable]
     106 |         int total = 0, err, n;
         |                             ^


vim +/n +106 fs/9p/vfs_addr.c

    92	
    93	/**
    94	 * v9fs_issue_read - Issue a read from 9P
    95	 * @subreq: The read to make
    96	 * @rctx: Read generation context
    97	 */
    98	static void v9fs_issue_read(struct netfs_io_subrequest *subreq)
    99	{
   100		struct netfs_io_request *rreq = subreq->rreq;
   101		struct iov_iter iter;
   102		struct p9_fid *fid = rreq->netfs_priv;
   103		char *target;
   104		unsigned long long pos = subreq->start + subreq->transferred;
   105		size_t len;
 > 106		int total = 0, err, n;
   107	
   108		err = netfs_prepare_read_buffer(subreq, INT_MAX);
   109		if (err < 0)
   110			goto term;
   111	
   112		iov_iter_bvec_queue(&iter, ITER_DEST, subreq->content.bvecq,
   113				    subreq->content.slot, subreq->content.offset, subreq->len);
   114	
   115		if (S_ISLNK(rreq->inode->i_mode)) {
   116			/* p9_client_readlink() must not be called for legacy protocols
   117			 * 9p2000 or 9p2000.u.
   118			 */
   119			BUG_ON(!p9_is_proto_dotl(fid->clnt));
   120			if (WARN_ON_ONCE(pos)) {
   121				/* reading a link at a non null offset should
   122				 * not happen
   123				 */
   124				err = -EIO;
   125				goto fill_subreq;
   126			}
   127			err = p9_client_readlink(fid, &target);
   128			if (err != 0)
   129				goto fill_subreq;
   130			len = min(strlen(target), subreq->len);
   131			total = copy_to_iter(target, len, &iter);
   132			kfree(target);
   133		} else {
   134			trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
   135	
   136			total = p9_client_read(fid, pos, &iter, &err);
   137		}
   138	
   139	fill_subreq:
   140		/* if we just extended the file size, any portion not in
   141		 * cache won't be on server and is zeroes */
   142		if (subreq->rreq->origin != NETFS_UNBUFFERED_READ &&
   143		    subreq->rreq->origin != NETFS_DIO_READ)
   144			__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
   145		if (pos + total >= i_size_read(rreq->inode))
   146			__set_bit(NETFS_SREQ_HIT_EOF, &subreq->flags);
   147		if (!err && total) {
   148			subreq->transferred += total;
   149			__set_bit(NETFS_SREQ_MADE_PROGRESS, &subreq->flags);
   150		}
   151	
   152	term:
   153		subreq->error = err;
   154		return netfs_read_subreq_terminated(subreq);
   155	}
   156	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
