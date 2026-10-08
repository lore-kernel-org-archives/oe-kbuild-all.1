Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18713E173B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 20:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791490704; cv=none; b=I8gO+kvQt9eUY+TqF+6oPwxe4niAzq2Z40PHMN67IS6QxQluD6kSLncpHu5yCBrDZEcM8O5uvjPyzxG4Jkhp5sX3IYiqXp9nX/ffPnBsLOY3OBpBRttodG6cTZq0bd7Juye8lt0KGRRHfZFH5X2ffcb/i1AyvJ4+guuhYRm8Nt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791490704; c=relaxed/simple;
	bh=01ZH0S/YW+wiS22P2tK2MTw1r94K55DPWUOaX3U+NFM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SSN/Q0X9pbUliAUOD7HfisvcGsY+QyXGghsDxtCuLZzbelJXP/MrJlKqsh+kaCIZm2f/GhklSg3VJDBtN5FpD0+/0Fhslh1VRA/NVWHT/Q5JEkgijcp6EwyWqnFGAqLsBjohBeTd0kCefbidK+4YdeOes2/sAxcVqYTvpmQgQbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0nSOk22; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0nSOk22"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791490700; x=1823026700;
  h=date:from:to:cc:subject:message-id;
  bh=01ZH0S/YW+wiS22P2tK2MTw1r94K55DPWUOaX3U+NFM=;
  b=D0nSOk22yN6G1/agJmvhbwMpSCE6D0EL10hJgtAWlrAnTC7yNUf/ohNV
   p/JDxKei7Shvsl8OVTmC/lR0dt/wCh1Iqj6l6GZxQct3oe+ISM4sIz3v+
   hdfRsFuOvt9oWOBSRfTzbXxiBO8GiKU2/H9NPrVAzGEXSC4io6wPS324N
   cQMTd9L+pCb5g9yNe0Uu74xtREw4dwRmmYS9toYtEcsT3jrIvuYaS7Bfh
   Q7PWAx8DpWw4h87GCro0Jj1AxMRj8KyXQNTYn5LCDe9CdBQaMB5fb6ynK
   nturA9HfOFg88rs2+re3dWdoST+TeLMgkC0Su1vi5YoOdS/qfCr2kknQD
   Q==;
X-CSE-ConnectionGUID: K1LwQpCjTwKCPPUfAw4y5w==
X-CSE-MsgGUID: tCtJl/WKQDq7bNDWviWZvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="312020"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="312020"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 13:18:20 -0700
X-CSE-ConnectionGUID: hZlXyaM4RpSUZ8ab2NgW/A==
X-CSE-MsgGUID: rrHr+e0gRmCe1NgujUSqHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="131590"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 08 Oct 2026 13:18:18 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEuZD-00000000615-2h64;
	Thu, 08 Oct 2026 20:18:15 +0000
Date: Thu, 08 Oct 2026 22:18:05 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 62/68] fs/ceph/rdwr.c:215:31: error:
 no member named 'content' in 'struct netfs_io_subrequest'
Message-ID: <202610082202.89TK4psR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   c67464ec28da31de31fe4358eb13c2771a280cb7
commit: ed86caec995f4071e6a31678ec9a78ab0947c856 [62/68] ceph: Use netfslib [INCOMPLETE]
config: i386-randconfig-r2104-20261008 (https://download.01.org/0day-ci/archive/20261008/202610082202.89TK4psR-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610082202.89TK4psR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610082202.89TK4psR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ceph/rdwr.c:215:31: error: no member named 'content' in 'struct netfs_io_subrequest'
     215 |         ret = bvecq_extract(&subreq->content, subreq->len, INT_MAX, &buf_copy,
         |                              ~~~~~~  ^
   fs/ceph/rdwr.c:220:27: error: no member named 'content' in 'struct netfs_io_subrequest'
     220 |         bvecq_pos_unset(&subreq->content);
         |                          ~~~~~~  ^
   fs/ceph/rdwr.c:221:10: error: no member named 'content' in 'struct netfs_io_subrequest'
     221 |         subreq->content.bvecq = buf_copy; /* Transfer extracted ref. */
         |         ~~~~~~  ^
   fs/ceph/rdwr.c:224:46: error: no member named 'content' in 'struct netfs_io_subrequest'
     224 |         osd_req_op_extent_osd_bvecq(req, 0, subreq->content.bvecq, subreq->len);
         |                                             ~~~~~~  ^
   fs/ceph/rdwr.c:423:48: error: no member named 'content' in 'struct netfs_io_subrequest'
     423 |         iov_iter_bvec_queue(&iter, ITER_DEST, subreq->content.bvecq,
         |                                               ~~~~~~  ^
   fs/ceph/rdwr.c:424:16: error: no member named 'content' in 'struct netfs_io_subrequest'
     424 |                             subreq->content.slot, subreq->content.offset,
         |                             ~~~~~~  ^
   fs/ceph/rdwr.c:424:38: error: no member named 'content' in 'struct netfs_io_subrequest'
     424 |                             subreq->content.slot, subreq->content.offset,
         |                                                   ~~~~~~  ^
   fs/ceph/rdwr.c:500:46: error: no member named 'content' in 'struct netfs_io_subrequest'
     500 |         osd_req_op_extent_osd_bvecq(req, 0, subreq->content.bvecq, subreq->len);
         |                                             ~~~~~~  ^
   8 errors generated.


vim +215 fs/ceph/rdwr.c

   164	
   165	/*
   166	 * Issue a subrequest to upload to the server.
   167	 */
   168	static int ceph_issue_write(struct netfs_io_subrequest *subreq)
   169	{
   170		struct ceph_io_subrequest *csub = ceph_sreq2io(subreq);
   171		struct ceph_snap_context *snapc = ceph_wreq_snapc(subreq->rreq);
   172		struct ceph_osd_request *req;
   173		struct ceph_io_request *creq = csub->creq;
   174		struct ceph_fs_client *fsc = ceph_inode_to_fs_client(subreq->rreq->inode);
   175		struct ceph_osd_client *osdc = &fsc->client->osdc;
   176		struct inode *inode = subreq->rreq->inode;
   177		struct ceph_inode_info *ci = ceph_inode(inode);
   178		struct ceph_client *cl = ceph_inode_to_client(inode);
   179		struct bvecq *buf_copy;
   180		unsigned long long len;
   181		unsigned int rmw = test_bit(NETFS_RREQ_RMW, &ci->netfs.flags) ? 1 : 0;
   182		u64 objnum, objoff;
   183		int ret;
   184	
   185		doutc(cl, "issue_write R=%08x[%x] ino %llx %lld~%zu -- %srmw\n",
   186		      subreq->rreq->debug_id, subreq->debug_index, ci->i_vino.ino,
   187		      subreq->start, subreq->len,
   188		      rmw ? "" : "no ");
   189	
   190		/* Clamp the length to the next object boundary. */
   191		ceph_calc_file_object_mapping(&ci->i_layout, subreq->start, subreq->len,
   192					      &objnum, &objoff, &subreq->len);
   193	
   194		len = umin(subreq->len, fsc->mount_options->wsize);
   195	
   196		req = ceph_osdc_new_request(osdc, &ci->i_layout, ci->i_vino,
   197					    subreq->start, &len,
   198					    rmw,	/* which: 0 or 1 */
   199					    rmw + 1,	/* num_ops: 1 or 2 */
   200					    CEPH_OSD_OP_WRITE,
   201					    CEPH_OSD_FLAG_WRITE,
   202					    snapc,
   203					    ci->i_truncate_seq,
   204					    ci->i_truncate_size, false);
   205		if (IS_ERR(req)) {
   206			netfs_write_subrequest_terminated(subreq, PTR_ERR(req));
   207			return 0;
   208		}
   209	
   210		/* Get the write buffer and copy the bvecq. */
   211		subreq->len = len;
   212		ret = netfs_prepare_write_buffer(subreq, INT_MAX);
   213		if (ret < 0)
   214			return ret;
 > 215		ret = bvecq_extract(&subreq->content, subreq->len, INT_MAX, &buf_copy,
   216				    creq->rreq.origin == NETFS_WRITEBACK);
   217		if (ret < 0)
   218			return ret;
   219	
   220		bvecq_pos_unset(&subreq->content);
   221		subreq->content.bvecq = buf_copy; /* Transfer extracted ref. */
   222	
   223		doutc(cl, "write op %lld~%zu\n", subreq->start, subreq->len);
   224		osd_req_op_extent_osd_bvecq(req, 0, subreq->content.bvecq, subreq->len);
   225		req->r_inode	= inode;
   226		req->r_mtime	= current_time(inode);
   227		req->r_callback	= ceph_netfs_write_callback;
   228		req->r_subreq	= subreq;
   229		csub->req	= req;
   230	
   231		/*
   232		 * If we're doing an RMW cycle, set up an assertion that the remote
   233		 * data hasn't changed.  If we don't have a version number, then the
   234		 * object doesn't exist yet.  Use an exclusive create instead of a
   235		 * version assertion in that case.
   236		 */
   237		if (rmw) {
   238			if (creq->rmw_assert_version) {
   239				osd_req_op_init(req, 0, CEPH_OSD_OP_ASSERT_VER, 0);
   240				req->r_ops[0].assert_ver.ver = creq->rmw_assert_version;
   241			} else {
   242				osd_req_op_init(req, 0, CEPH_OSD_OP_CREATE,
   243						CEPH_OSD_OP_FLAG_EXCL);
   244			}
   245		}
   246	
   247		trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
   248		ceph_osdc_start_request(osdc, req);
   249		return 0;
   250	}
   251	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
