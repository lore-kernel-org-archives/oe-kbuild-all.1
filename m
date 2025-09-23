Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF4E2036ED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 14:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758636887; cv=none; b=Tp5/P/GEby8GaUciG9hPa7VMpHMN6biWsvHx3RA75uAZ1jOWMU34DjE7+RYZOtOpRRaNpJra8u4Ai2YieQmEkwMmpYzKO6xpbvoqJ7+Tng4UaolcPAHjYMjqIVb3o/aTk72DiVz3vIadQfcdgsZN3k3iFtikFbfan66klq4C6hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758636887; c=relaxed/simple;
	bh=ylxWs0BqrqJwUhxRZyTeA9U+Ert5AKkOcfMpoZMcu2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WzIeyVwXdE3B5IVBBOMdQJnAol+CtTgwGR+dH1GUIwJ9w+UKBmzMIuYw2ygNNi4JiLmcRl86LVEo30mYZpSeVBOVZu2ttPPQ2jjeH0e32vUPhQchaeoD3YD+PtS9exk6a0fcttDSf3gw4koYG8ubeQG+oy9kattn6fQcbkNWLJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIvpEcg1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIvpEcg1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758636885; x=1790172885;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ylxWs0BqrqJwUhxRZyTeA9U+Ert5AKkOcfMpoZMcu2Q=;
  b=IIvpEcg1BkmlPCAGdTgL2Z0wswueeAnVu7C2GIx1/uwnaL3IyP5aIQrK
   Q2HhUPj/gCtfqOB7WrslF2MoUC9utW0efRVuz8UVnSlht//UrQYbaJlS0
   v7fpxO61+jEFuUHmgtxf9F6bAaXYyalFup6TBh5KfdTmcCtFXf9qNAc4Q
   84FdCiXx7JhOR47Wja+cJ3F5UIrqqFcuUJmuQs3vPY4MwKGbf4JpnrPYZ
   Z8YCmgCXJthZLPT5vuCWILJ3HzrT9gG1clDiTF+vVW7nBX9JKgzydssUj
   knxosgl6uJzEBJNOR26v8hqHPYeR0hmBIWWjZywj/rmsSJbffQN7Vux3k
   w==;
X-CSE-ConnectionGUID: dBFxNHriQn6iey9VfLuGvw==
X-CSE-MsgGUID: 5FCyOLukT0y2IHYLVPcNyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86353219"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="86353219"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 07:14:19 -0700
X-CSE-ConnectionGUID: Xw0J1PiFQHyHO/7JNrc6Ew==
X-CSE-MsgGUID: 1NmCJuuYSE+ZYvrc+XolHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="176369710"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 23 Sep 2025 07:14:18 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v13ma-0003Ax-0r;
	Tue, 23 Sep 2025 14:14:16 +0000
Date: Tue, 23 Sep 2025 22:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1] fs/io_uring.c:1137:41: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202509232244.8BC457JF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   c92395c2d69365e987de03603133963279b28a32
commit: 6d96e0c7cf283af8811283ee4aca82f7bafbff7c [1/1] io_uring: don't use int for ABI
config: i386-randconfig-r113-20250923 (https://download.01.org/0day-ci/archive/20250923/202509232244.8BC457JF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509232244.8BC457JF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509232244.8BC457JF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/io_uring.c:1137:41: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __kernel_rwf_t [usertype] flags @@     got unsigned int [addressable] __val @@
   fs/io_uring.c:1137:41: sparse:     expected restricted __kernel_rwf_t [usertype] flags
   fs/io_uring.c:1137:41: sparse:     got unsigned int [addressable] __val
   fs/io_uring.c:1375:40: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] <asn:1> *[assigned] iov_base @@     got void * @@
   fs/io_uring.c:1375:40: sparse:     expected void [noderef] <asn:1> *[assigned] iov_base
   fs/io_uring.c:1375:40: sparse:     got void *

vim +1137 fs/io_uring.c

2b188cc1bb857a Jens Axboe    2019-01-07  1095  
6c271ce2f1d572 Jens Axboe    2019-01-10  1096  static int io_prep_rw(struct io_kiocb *req, const struct sqe_submit *s,
8358e3a8264a22 Jens Axboe    2019-04-23  1097  		      bool force_nonblock)
2b188cc1bb857a Jens Axboe    2019-01-07  1098  {
6c271ce2f1d572 Jens Axboe    2019-01-10  1099  	const struct io_uring_sqe *sqe = s->sqe;
def596e9557c91 Jens Axboe    2019-01-09  1100  	struct io_ring_ctx *ctx = req->ctx;
2b188cc1bb857a Jens Axboe    2019-01-07  1101  	struct kiocb *kiocb = &req->rw;
09bb839434bd84 Jens Axboe    2019-03-13  1102  	unsigned ioprio;
09bb839434bd84 Jens Axboe    2019-03-13  1103  	int ret;
2b188cc1bb857a Jens Axboe    2019-01-07  1104  
09bb839434bd84 Jens Axboe    2019-03-13  1105  	if (!req->file)
09bb839434bd84 Jens Axboe    2019-03-13  1106  		return -EBADF;
2b188cc1bb857a Jens Axboe    2019-01-07  1107  
491381ce07ca57 Jens Axboe    2019-10-17  1108  	if (S_ISREG(file_inode(req->file)->i_mode))
491381ce07ca57 Jens Axboe    2019-10-17  1109  		req->flags |= REQ_F_ISREG;
491381ce07ca57 Jens Axboe    2019-10-17  1110  
7661469ef56e15 Jens Axboe    2020-03-20  1111  	if (force_nonblock)
7661469ef56e15 Jens Axboe    2020-03-20  1112  		req->fsize = rlimit(RLIMIT_FSIZE);
7661469ef56e15 Jens Axboe    2020-03-20  1113  
491381ce07ca57 Jens Axboe    2019-10-17  1114  	/*
491381ce07ca57 Jens Axboe    2019-10-17  1115  	 * If the file doesn't support async, mark it as REQ_F_MUST_PUNT so
491381ce07ca57 Jens Axboe    2019-10-17  1116  	 * we know to async punt it even if it was opened O_NONBLOCK
491381ce07ca57 Jens Axboe    2019-10-17  1117  	 */
491381ce07ca57 Jens Axboe    2019-10-17  1118  	if (force_nonblock && !io_file_supports_async(req->file)) {
491381ce07ca57 Jens Axboe    2019-10-17  1119  		req->flags |= REQ_F_MUST_PUNT;
491381ce07ca57 Jens Axboe    2019-10-17  1120  		return -EAGAIN;
491381ce07ca57 Jens Axboe    2019-10-17  1121  	}
09bb839434bd84 Jens Axboe    2019-03-13  1122  
2b188cc1bb857a Jens Axboe    2019-01-07  1123  	kiocb->ki_pos = READ_ONCE(sqe->off);
2b188cc1bb857a Jens Axboe    2019-01-07  1124  	kiocb->ki_flags = iocb_flags(kiocb->ki_filp);
2b188cc1bb857a Jens Axboe    2019-01-07  1125  	kiocb->ki_hint = ki_hint_validate(file_write_hint(kiocb->ki_filp));
2b188cc1bb857a Jens Axboe    2019-01-07  1126  
2b188cc1bb857a Jens Axboe    2019-01-07  1127  	ioprio = READ_ONCE(sqe->ioprio);
2b188cc1bb857a Jens Axboe    2019-01-07  1128  	if (ioprio) {
2b188cc1bb857a Jens Axboe    2019-01-07  1129  		ret = ioprio_check_cap(ioprio);
2b188cc1bb857a Jens Axboe    2019-01-07  1130  		if (ret)
09bb839434bd84 Jens Axboe    2019-03-13  1131  			return ret;
2b188cc1bb857a Jens Axboe    2019-01-07  1132  
2b188cc1bb857a Jens Axboe    2019-01-07  1133  		kiocb->ki_ioprio = ioprio;
2b188cc1bb857a Jens Axboe    2019-01-07  1134  	} else
2b188cc1bb857a Jens Axboe    2019-01-07  1135  		kiocb->ki_ioprio = get_current_ioprio();
2b188cc1bb857a Jens Axboe    2019-01-07  1136  
2b188cc1bb857a Jens Axboe    2019-01-07 @1137  	ret = kiocb_set_rw_flags(kiocb, READ_ONCE(sqe->rw_flags));
2b188cc1bb857a Jens Axboe    2019-01-07  1138  	if (unlikely(ret))
09bb839434bd84 Jens Axboe    2019-03-13  1139  		return ret;
8449eedaa1da6a Stefan Bühler 2019-04-27  1140  
8449eedaa1da6a Stefan Bühler 2019-04-27  1141  	/* don't allow async punt if RWF_NOWAIT was requested */
491381ce07ca57 Jens Axboe    2019-10-17  1142  	if ((kiocb->ki_flags & IOCB_NOWAIT) ||
491381ce07ca57 Jens Axboe    2019-10-17  1143  	    (req->file->f_flags & O_NONBLOCK))
8449eedaa1da6a Stefan Bühler 2019-04-27  1144  		req->flags |= REQ_F_NOWAIT;
8449eedaa1da6a Stefan Bühler 2019-04-27  1145  
8449eedaa1da6a Stefan Bühler 2019-04-27  1146  	if (force_nonblock)
2b188cc1bb857a Jens Axboe    2019-01-07  1147  		kiocb->ki_flags |= IOCB_NOWAIT;
8449eedaa1da6a Stefan Bühler 2019-04-27  1148  
def596e9557c91 Jens Axboe    2019-01-09  1149  	if (ctx->flags & IORING_SETUP_IOPOLL) {
def596e9557c91 Jens Axboe    2019-01-09  1150  		if (!(kiocb->ki_flags & IOCB_DIRECT) ||
def596e9557c91 Jens Axboe    2019-01-09  1151  		    !kiocb->ki_filp->f_op->iopoll)
09bb839434bd84 Jens Axboe    2019-03-13  1152  			return -EOPNOTSUPP;
def596e9557c91 Jens Axboe    2019-01-09  1153  
def596e9557c91 Jens Axboe    2019-01-09  1154  		kiocb->ki_flags |= IOCB_HIPRI;
def596e9557c91 Jens Axboe    2019-01-09  1155  		kiocb->ki_complete = io_complete_rw_iopoll;
6873e0bd6a9cb1 Jens Axboe    2019-10-30  1156  		req->result = 0;
def596e9557c91 Jens Axboe    2019-01-09  1157  	} else {
09bb839434bd84 Jens Axboe    2019-03-13  1158  		if (kiocb->ki_flags & IOCB_HIPRI)
09bb839434bd84 Jens Axboe    2019-03-13  1159  			return -EINVAL;
2b188cc1bb857a Jens Axboe    2019-01-07  1160  		kiocb->ki_complete = io_complete_rw;
def596e9557c91 Jens Axboe    2019-01-09  1161  	}
2b188cc1bb857a Jens Axboe    2019-01-07  1162  	return 0;
2b188cc1bb857a Jens Axboe    2019-01-07  1163  }
2b188cc1bb857a Jens Axboe    2019-01-07  1164  

:::::: The code at line 1137 was first introduced by commit
:::::: 2b188cc1bb857a9d4701ae59aa7768b5124e262e Add io_uring IO interface

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
