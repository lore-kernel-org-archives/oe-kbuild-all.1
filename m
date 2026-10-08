Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1970D3AE1A5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 18:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791485824; cv=none; b=EAT1me3FgKVE9U+DND5Os5f0VqL5qXexAUH/+wjA/lU0Ez4hmJpU5TdVmdfNbiUZQCHAGV9lc2XJ+c6Ciasi7q+4tlGvRPwSOESpq2uoCHLjdCIskET2JQMi7Xy1jntJT2E7tEGVwGoQybh3T5GexA8fm3viKtvsrq6QiAY3yWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791485824; c=relaxed/simple;
	bh=m78/2yw9ZtFUx7v2X5IVt0n2yAkXg1FCqMvkTC4/yy0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OwwUbRiYFFedmP5AAW1a/dfAEbc6nNCbfkTlzWowBzmQT942IXQNOr3iEyv6jR43q4OJgjldF+6yo7hbT4zHMGGX1ED+oFBZrHONulVgZ6tbdS9HgRQSJqvsPFlWpVFt47JvyBfJqEt36B48GVAxJEhVyVhZ11++T0KoKjCs4d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UCgIJFM2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UCgIJFM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791485822; x=1823021822;
  h=date:from:to:cc:subject:message-id;
  bh=m78/2yw9ZtFUx7v2X5IVt0n2yAkXg1FCqMvkTC4/yy0=;
  b=UCgIJFM2R3GqyoIHmIUtqOLx6BA9DpffxxKfn2q/7Sdqiks+tkAgazlp
   BdW8RJqfxElTygCTx2WcgW0ORc39vQ5S5Cq43mKzpNqpp2HssWV8ewBgg
   j/Z3yFk+ve505bWKDCNh+1GFmQQpV4QY8uaNEPwtujgfkxIOTV8JJTbOf
   33mA8cDrWq+hMGq0Fs+P2Cf/NAj7A0DaDdMuiSzKfHsXZ5ldri+J8Rx2S
   JOxRAJiM+tDUBoDJ7X+AUBgBaFRQoxppZ6hDAyotI7mVaWXmMqYNeMo7v
   X2M5BPyO4EgH/4UXzOa29wHHhVJ2CUPxGlfGDwXFITsU6oMTxusTMtcye
   Q==;
X-CSE-ConnectionGUID: wOk9zMMyTPecmCGHoEHrZg==
X-CSE-MsgGUID: TpbVWFnWT/WBdhr8tAxMqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="163898"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="163898"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 11:57:02 -0700
X-CSE-ConnectionGUID: hn7MUL9+QI6Slr1+SNP0sg==
X-CSE-MsgGUID: qHMiwXITQbeKhwB5Ne9+jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="566839"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 08 Oct 2026 11:57:01 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEtIY-000000005uN-0Xno;
	Thu, 08 Oct 2026 18:56:58 +0000
Date: Thu, 08 Oct 2026 20:56:09 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 62/68] fs/ceph/rdwr.c:215:36: error:
 'struct netfs_io_subrequest' has no member named 'content'
Message-ID: <202610082051.mHQ6NU5p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   c67464ec28da31de31fe4358eb13c2771a280cb7
commit: ed86caec995f4071e6a31678ec9a78ab0947c856 [62/68] ceph: Use netfslib [INCOMPLETE]
config: sh-randconfig-r2107-20261008 (https://download.01.org/0day-ci/archive/20261008/202610082051.mHQ6NU5p-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610082051.mHQ6NU5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610082051.mHQ6NU5p-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/rdwr.c: In function 'ceph_issue_write':
>> fs/ceph/rdwr.c:215:36: error: 'struct netfs_io_subrequest' has no member named 'content'
     215 |         ret = bvecq_extract(&subreq->content, subreq->len, INT_MAX, &buf_copy,
         |                                    ^~
   fs/ceph/rdwr.c:220:32: error: 'struct netfs_io_subrequest' has no member named 'content'
     220 |         bvecq_pos_unset(&subreq->content);
         |                                ^~
   fs/ceph/rdwr.c:221:15: error: 'struct netfs_io_subrequest' has no member named 'content'
     221 |         subreq->content.bvecq = buf_copy; /* Transfer extracted ref. */
         |               ^~
   fs/ceph/rdwr.c:224:51: error: 'struct netfs_io_subrequest' has no member named 'content'
     224 |         osd_req_op_extent_osd_bvecq(req, 0, subreq->content.bvecq, subreq->len);
         |                                                   ^~
   fs/ceph/rdwr.c: In function 'ceph_netfs_issue_read_inline':
   fs/ceph/rdwr.c:423:53: error: 'struct netfs_io_subrequest' has no member named 'content'
     423 |         iov_iter_bvec_queue(&iter, ITER_DEST, subreq->content.bvecq,
         |                                                     ^~
   fs/ceph/rdwr.c:424:35: error: 'struct netfs_io_subrequest' has no member named 'content'
     424 |                             subreq->content.slot, subreq->content.offset,
         |                                   ^~
   fs/ceph/rdwr.c:424:57: error: 'struct netfs_io_subrequest' has no member named 'content'
     424 |                             subreq->content.slot, subreq->content.offset,
         |                                                         ^~
   fs/ceph/rdwr.c: In function 'ceph_netfs_issue_read':
   fs/ceph/rdwr.c:500:51: error: 'struct netfs_io_subrequest' has no member named 'content'
     500 |         osd_req_op_extent_osd_bvecq(req, 0, subreq->content.bvecq, subreq->len);
         |                                                   ^~


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
