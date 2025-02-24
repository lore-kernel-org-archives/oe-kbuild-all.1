Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4012571B6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 19:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740426806; cv=none; b=cZjUiU/nm/Ey6XKLU4yRKxOGQ/UkeIcLxDV+uKmTAimzkmX1n4ayX/3IA3s4LPYqhCOse+x0xlbDl9KzLkoEf0QGTc6b0mVLqQD8aJyJjBYPMMMoNgayWqkgmwge+lmrKjVsuLcHEWqZJW5BkH9BmD+79zOLXNclsfI4TjO8xJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740426806; c=relaxed/simple;
	bh=VMLWKeakFvuQJ366PRho9lkByan6jjbdhKg14lonm5A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QPVmFyhoOtDS7UZpxAuzZNWaiTviL2wY4XIkTtQxiP1EQKXjf3w5CnNnTqRfOf3aJdCfV3FThdiqneyRa3RwSaZemZ8yYwu2/VxKtK+S3rZV2Rr9Y9/TDYtdktC5uz4VJJArF1iUzTYLnrjfLJPIYamCoez3fKzG/Y3mWsX2MRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wb6URTI+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wb6URTI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740426804; x=1771962804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VMLWKeakFvuQJ366PRho9lkByan6jjbdhKg14lonm5A=;
  b=Wb6URTI+ZzVxL4dmbczK0gWTOdfRHMuJpsSCFj84IyAIn6po21kuCT29
   8dMOY64y8z/SGTiIqHdEPaWEqK5gGJFIL2ZUI1wgaSq4doZtoF7jPMDl8
   di+MCB6vI2n57mGHy69hfQuInss6K7ZVTKgJYRDM4NPe/e8o9x8r2ZMnR
   2dlG8RJoDIq0IREc/OYoqWTrIcj5d+v5FvGvjmwbGF1nskaHWbeNrVBKG
   asjM0jw3BgJ3PsPhjjUXtMBATZZKBWDjNYvqIKEdcFfoKpPBuPRPE9i4n
   dBSzGC5ftPOdHoANF4gRnk77H/c+Ck4W8To+SnIvW4jsPdr0oTeQnr0Sj
   w==;
X-CSE-ConnectionGUID: qYZ4UTrgQqmGyt9kKYNjKQ==
X-CSE-MsgGUID: M0iWCpFKReqZLABUtdAcgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="52197097"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="52197097"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 11:53:23 -0800
X-CSE-ConnectionGUID: Lowc2/+BSIept/OidoIQVA==
X-CSE-MsgGUID: Uaze3xKOSvy43kltvHYQ+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="116656031"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 Feb 2025 11:53:22 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmeVs-0009Hj-2a;
	Mon, 24 Feb 2025 19:53:16 +0000
Date: Tue, 25 Feb 2025 03:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <dw@davidwei.uk>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: [axboe-block:for-6.15/io_uring-rx-zc 46/47] io_uring/net.c:1286:15:
 error: too many arguments to function 'io_zcrx_recv'
Message-ID: <202502250320.43Q9ONuQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.15/io_uring-rx-zc
head:   f4b4948fb824a9fbaff906d96f6d575305842efc
commit: 9a53ea6aa5c87fe4c49297158e7982dbe4f96227 [46/47] io_uring/zcrx: add a read limit to recvzc requests
config: arc-randconfig-002-20250225 (https://download.01.org/0day-ci/archive/20250225/202502250320.43Q9ONuQ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250320.43Q9ONuQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502250320.43Q9ONuQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   io_uring/net.c: In function 'io_recvzc':
>> io_uring/net.c:1286:15: error: too many arguments to function 'io_zcrx_recv'
    1286 |         ret = io_zcrx_recv(req, zc->ifq, sock, zc->msg_flags | MSG_DONTWAIT,
         |               ^~~~~~~~~~~~
   In file included from io_uring/net.c:19:
   io_uring/zcrx.h:62:19: note: declared here
      62 | static inline int io_zcrx_recv(struct io_kiocb *req, struct io_zcrx_ifq *ifq,
         |                   ^~~~~~~~~~~~


vim +/io_zcrx_recv +1286 io_uring/net.c

11ed914bbf948c David Wei      2025-02-14  1269  
11ed914bbf948c David Wei      2025-02-14  1270  int io_recvzc(struct io_kiocb *req, unsigned int issue_flags)
11ed914bbf948c David Wei      2025-02-14  1271  {
11ed914bbf948c David Wei      2025-02-14  1272  	struct io_recvzc *zc = io_kiocb_to_cmd(req, struct io_recvzc);
11ed914bbf948c David Wei      2025-02-14  1273  	struct socket *sock;
9a53ea6aa5c87f David Wei      2025-02-23  1274  	unsigned int len;
11ed914bbf948c David Wei      2025-02-14  1275  	int ret;
11ed914bbf948c David Wei      2025-02-14  1276  
11ed914bbf948c David Wei      2025-02-14  1277  	if (!(req->flags & REQ_F_POLLED) &&
11ed914bbf948c David Wei      2025-02-14  1278  	    (zc->flags & IORING_RECVSEND_POLL_FIRST))
11ed914bbf948c David Wei      2025-02-14  1279  		return -EAGAIN;
11ed914bbf948c David Wei      2025-02-14  1280  
11ed914bbf948c David Wei      2025-02-14  1281  	sock = sock_from_file(req->file);
11ed914bbf948c David Wei      2025-02-14  1282  	if (unlikely(!sock))
11ed914bbf948c David Wei      2025-02-14  1283  		return -ENOTSOCK;
11ed914bbf948c David Wei      2025-02-14  1284  
9a53ea6aa5c87f David Wei      2025-02-23  1285  	len = zc->len;
11ed914bbf948c David Wei      2025-02-14 @1286  	ret = io_zcrx_recv(req, zc->ifq, sock, zc->msg_flags | MSG_DONTWAIT,
9a53ea6aa5c87f David Wei      2025-02-23  1287  			   issue_flags, &zc->len);
9a53ea6aa5c87f David Wei      2025-02-23  1288  	if (len && zc->len == 0) {
9a53ea6aa5c87f David Wei      2025-02-23  1289  		io_req_set_res(req, 0, 0);
9a53ea6aa5c87f David Wei      2025-02-23  1290  
9a53ea6aa5c87f David Wei      2025-02-23  1291  		if (issue_flags & IO_URING_F_MULTISHOT)
9a53ea6aa5c87f David Wei      2025-02-23  1292  			return IOU_STOP_MULTISHOT;
9a53ea6aa5c87f David Wei      2025-02-23  1293  		return IOU_OK;
9a53ea6aa5c87f David Wei      2025-02-23  1294  	}
11ed914bbf948c David Wei      2025-02-14  1295  	if (unlikely(ret <= 0) && ret != -EAGAIN) {
11ed914bbf948c David Wei      2025-02-14  1296  		if (ret == -ERESTARTSYS)
11ed914bbf948c David Wei      2025-02-14  1297  			ret = -EINTR;
931dfae19032d1 Pavel Begunkov 2025-02-14  1298  		if (ret == IOU_REQUEUE)
931dfae19032d1 Pavel Begunkov 2025-02-14  1299  			return IOU_REQUEUE;
11ed914bbf948c David Wei      2025-02-14  1300  
11ed914bbf948c David Wei      2025-02-14  1301  		req_set_fail(req);
11ed914bbf948c David Wei      2025-02-14  1302  		io_req_set_res(req, ret, 0);
11ed914bbf948c David Wei      2025-02-14  1303  
11ed914bbf948c David Wei      2025-02-14  1304  		if (issue_flags & IO_URING_F_MULTISHOT)
11ed914bbf948c David Wei      2025-02-14  1305  			return IOU_STOP_MULTISHOT;
11ed914bbf948c David Wei      2025-02-14  1306  		return IOU_OK;
11ed914bbf948c David Wei      2025-02-14  1307  	}
11ed914bbf948c David Wei      2025-02-14  1308  
11ed914bbf948c David Wei      2025-02-14  1309  	if (issue_flags & IO_URING_F_MULTISHOT)
11ed914bbf948c David Wei      2025-02-14  1310  		return IOU_ISSUE_SKIP_COMPLETE;
11ed914bbf948c David Wei      2025-02-14  1311  	return -EAGAIN;
11ed914bbf948c David Wei      2025-02-14  1312  }
11ed914bbf948c David Wei      2025-02-14  1313  

:::::: The code at line 1286 was first introduced by commit
:::::: 11ed914bbf948c4a37248f2876973ac18014056d io_uring/zcrx: add io_recvzc request

:::::: TO: David Wei <dw@davidwei.uk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
