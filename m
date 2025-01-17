Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005811F7916
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 12:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737116259; cv=none; b=C+VzSnH4aPGF5OVPFQvRwDrZp+Gb2wjThqqIkq4wnE6RHB9FrXYf7cUAQrCavqOaG64DBUqe3W+HHD1khuU5DvquQMZ4aN8ZscQFVLLVYWAaxFASdyosKzphzO0YGFgcwPn/jMbKoelKSCxnmXY5mElOvG+pqBjCsxMZaUiPEWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737116259; c=relaxed/simple;
	bh=L9HLTe29JoK3jJBc2Xnwfy0H5rnNmgg9WNTJtmw7pV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E12mSaFLhVz8lGorXLMxrMRUca9eXVsEg7ZDCuGv0Ud/9hOUmQvga85cnhE0Fms7wUZYF6Vu3Hi2Y6mgJiBKTumEzPx1Ty/dAhz6awhgozOIydjxcBjBgRf+Jvd4FqqhZyfBtjhkF3dW/kl/48/kG2n40X7rLt5kqO3dOHu3R/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOFCc0+l; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOFCc0+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737116257; x=1768652257;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L9HLTe29JoK3jJBc2Xnwfy0H5rnNmgg9WNTJtmw7pV4=;
  b=XOFCc0+lH7iA11RoEQH11fKx49EqBgP8QERGk6M20HDX1z1KU1RdGm2G
   4M3OCNyPLKLjEPyD0CMnAekKT4e/NXq+jBIFB2/7C6kSzClw5ijO7CrWJ
   kaBRbTG5EE59kawxgfOKZILuVo6c1Qf+wjc/Lc3cpvArtoozecCXR4sKp
   1C4rPNNy5z6ijn575U+uulP2lDdcDpVHetx0YzDC0lZQ0JNDZlkmnz8tF
   6ryJp5sKvbbxYkcBZJj5H/95X1W6NNPuw53ayztzp/twF6Iwxjv3MWrRx
   FnsjrjjRCln+XUTkuvP5EX4Z9/Wq+j7dz+bvsJJ7oPSzZbYxXPvCSkNmk
   Q==;
X-CSE-ConnectionGUID: VHtgipegTe6fv75jThBreA==
X-CSE-MsgGUID: zmakGG37TwGKDHad9sjzIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37568591"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="37568591"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 04:17:36 -0800
X-CSE-ConnectionGUID: X7K1h74BR2uS7ObQSoFFIQ==
X-CSE-MsgGUID: yQektZLjQkGFzzS3zfSxzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106265656"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2025 04:17:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYlI4-000TB1-1v;
	Fri, 17 Jan 2025 12:17:32 +0000
Date: Fri, 17 Jan 2025 20:16:49 +0800
From: kernel test robot <lkp@intel.com>
To: Liang Jie <buaajxlj@163.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ceph: streamline request head structures in MDS client
Message-ID: <202501172005.IoKVy2Op-lkp@intel.com>
References: <20250110100524.1891669-1-buaajxlj@163.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110100524.1891669-1-buaajxlj@163.com>

Hi Liang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ceph-client/testing]
[also build test WARNING on ceph-client/for-linus linus/master v6.13-rc7 next-20250117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Liang-Jie/ceph-streamline-request-head-structures-in-MDS-client/20250110-180625
base:   https://github.com/ceph/ceph-client.git testing
patch link:    https://lore.kernel.org/r/20250110100524.1891669-1-buaajxlj%40163.com
patch subject: [PATCH] ceph: streamline request head structures in MDS client
config: arm-randconfig-r071-20250117 (https://download.01.org/0day-ci/archive/20250117/202501172005.IoKVy2Op-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172005.IoKVy2Op-lkp@intel.com/

New smatch warnings:
fs/ceph/mds_client.c:3298 __prepare_send_request() warn: inconsistent indenting

Old smatch warnings:
fs/ceph/mds_client.c:220 parse_reply_info_in() warn: missing unwind goto?
fs/ceph/mds_client.c:644 ceph_parse_deleg_inos() warn: potential user controlled sizeof overflow 'sets * 2 * 8' '0-u32max * 8'
fs/ceph/mds_client.c:644 ceph_parse_deleg_inos() warn: potential user controlled sizeof overflow 'sets * 2 * 8' '0-u32max * 8'
fs/ceph/mds_client.c:3214 create_request_message() error: we previously assumed 'req->r_old_dentry' could be null (see line 3022)

vim +3298 fs/ceph/mds_client.c

2f2dc053404feb Sage Weil      2009-10-06  3272  
2f2dc053404feb Sage Weil      2009-10-06  3273  /*
2f2dc053404feb Sage Weil      2009-10-06  3274   * called under mdsc->mutex
2f2dc053404feb Sage Weil      2009-10-06  3275   */
396bd62c6912d0 Jeff Layton    2020-12-09  3276  static int __prepare_send_request(struct ceph_mds_session *session,
2f2dc053404feb Sage Weil      2009-10-06  3277  				  struct ceph_mds_request *req,
396bd62c6912d0 Jeff Layton    2020-12-09  3278  				  bool drop_cap_releases)
2f2dc053404feb Sage Weil      2009-10-06  3279  {
396bd62c6912d0 Jeff Layton    2020-12-09  3280  	int mds = session->s_mds;
396bd62c6912d0 Jeff Layton    2020-12-09  3281  	struct ceph_mds_client *mdsc = session->s_mdsc;
38d46409c4639a Xiubo Li       2023-06-12  3282  	struct ceph_client *cl = mdsc->fsc->client;
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3283  	struct ceph_mds_request_head_legacy *lhead;
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3284  	struct ceph_mds_request_head *nhead;
2f2dc053404feb Sage Weil      2009-10-06  3285  	struct ceph_msg *msg;
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3286  	int flags = 0, old_max_retry;
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3287  	bool old_version = !test_bit(CEPHFS_FEATURE_32BITS_RETRY_FWD,
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3288  				     &session->s_features);
546a5d6122faae Xiubo Li       2022-03-30  3289  
546a5d6122faae Xiubo Li       2022-03-30  3290  	/*
3500000bb13d30 Dmitry Antipov 2024-11-15  3291  	 * Avoid infinite retrying after overflow. The client will
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3292  	 * increase the retry count and if the MDS is old version,
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3293  	 * so we limit to retry at most 256 times.
546a5d6122faae Xiubo Li       2022-03-30  3294  	 */
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3295  	if (req->r_attempts) {
164b631927701b Liang Jie      2025-01-10  3296  		old_max_retry = sizeof_field(struct ceph_mds_request_head,
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3297  					    num_retry);
ce0d5bd3a6c176 Xiubo Li       2023-07-25 @3298  	       old_max_retry = 1 << (old_max_retry * BITS_PER_BYTE);
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3299  	       if ((old_version && req->r_attempts >= old_max_retry) ||
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3300  		   ((uint32_t)req->r_attempts >= U32_MAX)) {
38d46409c4639a Xiubo Li       2023-06-12  3301  			pr_warn_ratelimited_client(cl, "request tid %llu seq overflow\n",
38d46409c4639a Xiubo Li       2023-06-12  3302  						   req->r_tid);
546a5d6122faae Xiubo Li       2022-03-30  3303  			return -EMULTIHOP;
546a5d6122faae Xiubo Li       2022-03-30  3304  	       }
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3305  	}
2f2dc053404feb Sage Weil      2009-10-06  3306  
2f2dc053404feb Sage Weil      2009-10-06  3307  	req->r_attempts++;
e55b71f802fd44 Greg Farnum    2010-06-22  3308  	if (req->r_inode) {
e55b71f802fd44 Greg Farnum    2010-06-22  3309  		struct ceph_cap *cap =
e55b71f802fd44 Greg Farnum    2010-06-22  3310  			ceph_get_cap_for_mds(ceph_inode(req->r_inode), mds);
e55b71f802fd44 Greg Farnum    2010-06-22  3311  
e55b71f802fd44 Greg Farnum    2010-06-22  3312  		if (cap)
e55b71f802fd44 Greg Farnum    2010-06-22  3313  			req->r_sent_on_mseq = cap->mseq;
e55b71f802fd44 Greg Farnum    2010-06-22  3314  		else
e55b71f802fd44 Greg Farnum    2010-06-22  3315  			req->r_sent_on_mseq = -1;
e55b71f802fd44 Greg Farnum    2010-06-22  3316  	}
38d46409c4639a Xiubo Li       2023-06-12  3317  	doutc(cl, "%p tid %lld %s (attempt %d)\n", req, req->r_tid,
38d46409c4639a Xiubo Li       2023-06-12  3318  	      ceph_mds_op_name(req->r_op), req->r_attempts);
2f2dc053404feb Sage Weil      2009-10-06  3319  
bc2de10dc4da50 Jeff Layton    2017-02-01  3320  	if (test_bit(CEPH_MDS_R_GOT_UNSAFE, &req->r_req_flags)) {
c5c9a0bf1b0311 Yan, Zheng     2014-07-01  3321  		void *p;
4f1ddb1ea874c7 Jeff Layton    2020-12-09  3322  
01a92f174f8a3b Sage Weil      2010-07-15  3323  		/*
01a92f174f8a3b Sage Weil      2010-07-15  3324  		 * Replay.  Do not regenerate message (and rebuild
01a92f174f8a3b Sage Weil      2010-07-15  3325  		 * paths, etc.); just use the original message.
01a92f174f8a3b Sage Weil      2010-07-15  3326  		 * Rebuilding paths will break for renames because
01a92f174f8a3b Sage Weil      2010-07-15  3327  		 * d_move mangles the src name.
01a92f174f8a3b Sage Weil      2010-07-15  3328  		 */
01a92f174f8a3b Sage Weil      2010-07-15  3329  		msg = req->r_request;
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3330  		lhead = find_legacy_request_head(msg->front.iov_base,
4f1ddb1ea874c7 Jeff Layton    2020-12-09  3331  						 session->s_con.peer_features);
01a92f174f8a3b Sage Weil      2010-07-15  3332  
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3333  		flags = le32_to_cpu(lhead->flags);
01a92f174f8a3b Sage Weil      2010-07-15  3334  		flags |= CEPH_MDS_FLAG_REPLAY;
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3335  		lhead->flags = cpu_to_le32(flags);
01a92f174f8a3b Sage Weil      2010-07-15  3336  
01a92f174f8a3b Sage Weil      2010-07-15  3337  		if (req->r_target_inode)
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3338  			lhead->ino = cpu_to_le64(ceph_ino(req->r_target_inode));
01a92f174f8a3b Sage Weil      2010-07-15  3339  
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3340  		lhead->num_retry = req->r_attempts - 1;
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3341  		if (!old_version) {
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3342  			nhead = (struct ceph_mds_request_head*)msg->front.iov_base;
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3343  			nhead->ext_num_retry = cpu_to_le32(req->r_attempts - 1);
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3344  		}
e979cf50395e24 Sage Weil      2010-07-15  3345  
e979cf50395e24 Sage Weil      2010-07-15  3346  		/* remove cap/dentry releases from message */
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3347  		lhead->num_releases = 0;
c5c9a0bf1b0311 Yan, Zheng     2014-07-01  3348  
c5c9a0bf1b0311 Yan, Zheng     2014-07-01  3349  		p = msg->front.iov_base + req->r_request_release_offset;
2d332d5bc42440 Jeff Layton    2020-07-27  3350  		encode_mclientrequest_tail(&p, req);
c5c9a0bf1b0311 Yan, Zheng     2014-07-01  3351  
c5c9a0bf1b0311 Yan, Zheng     2014-07-01  3352  		msg->front.iov_len = p - msg->front.iov_base;
c5c9a0bf1b0311 Yan, Zheng     2014-07-01  3353  		msg->hdr.front_len = cpu_to_le32(msg->front.iov_len);
01a92f174f8a3b Sage Weil      2010-07-15  3354  		return 0;
01a92f174f8a3b Sage Weil      2010-07-15  3355  	}
01a92f174f8a3b Sage Weil      2010-07-15  3356  
2f2dc053404feb Sage Weil      2009-10-06  3357  	if (req->r_request) {
2f2dc053404feb Sage Weil      2009-10-06  3358  		ceph_msg_put(req->r_request);
2f2dc053404feb Sage Weil      2009-10-06  3359  		req->r_request = NULL;
2f2dc053404feb Sage Weil      2009-10-06  3360  	}
4f1ddb1ea874c7 Jeff Layton    2020-12-09  3361  	msg = create_request_message(session, req, drop_cap_releases);
2f2dc053404feb Sage Weil      2009-10-06  3362  	if (IS_ERR(msg)) {
e1518c7c0a67a7 Sage Weil      2010-05-13  3363  		req->r_err = PTR_ERR(msg);
a79832f26be370 Sage Weil      2010-04-01  3364  		return PTR_ERR(msg);
2f2dc053404feb Sage Weil      2009-10-06  3365  	}
2f2dc053404feb Sage Weil      2009-10-06  3366  	req->r_request = msg;
2f2dc053404feb Sage Weil      2009-10-06  3367  
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3368  	lhead = find_legacy_request_head(msg->front.iov_base,
4f1ddb1ea874c7 Jeff Layton    2020-12-09  3369  					 session->s_con.peer_features);
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3370  	lhead->oldest_client_tid = cpu_to_le64(__get_oldest_tid(mdsc));
bc2de10dc4da50 Jeff Layton    2017-02-01  3371  	if (test_bit(CEPH_MDS_R_GOT_UNSAFE, &req->r_req_flags))
2f2dc053404feb Sage Weil      2009-10-06  3372  		flags |= CEPH_MDS_FLAG_REPLAY;
3bb48b4142bbf7 Jeff Layton    2019-12-02  3373  	if (test_bit(CEPH_MDS_R_ASYNC, &req->r_req_flags))
3bb48b4142bbf7 Jeff Layton    2019-12-02  3374  		flags |= CEPH_MDS_FLAG_ASYNC;
3dd69aabcef3d8 Jeff Layton    2017-01-31  3375  	if (req->r_parent)
2f2dc053404feb Sage Weil      2009-10-06  3376  		flags |= CEPH_MDS_FLAG_WANT_DENTRY;
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3377  	lhead->flags = cpu_to_le32(flags);
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3378  	lhead->num_fwd = req->r_num_fwd;
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3379  	lhead->num_retry = req->r_attempts - 1;
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3380  	if (!old_version) {
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3381  		nhead = (struct ceph_mds_request_head*)msg->front.iov_base;
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3382  		nhead->ext_num_fwd = cpu_to_le32(req->r_num_fwd);
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3383  		nhead->ext_num_retry = cpu_to_le32(req->r_attempts - 1);
ce0d5bd3a6c176 Xiubo Li       2023-07-25  3384  	}
2f2dc053404feb Sage Weil      2009-10-06  3385  
38d46409c4639a Xiubo Li       2023-06-12  3386  	doutc(cl, " r_parent = %p\n", req->r_parent);
2f2dc053404feb Sage Weil      2009-10-06  3387  	return 0;
2f2dc053404feb Sage Weil      2009-10-06  3388  }
2f2dc053404feb Sage Weil      2009-10-06  3389  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
