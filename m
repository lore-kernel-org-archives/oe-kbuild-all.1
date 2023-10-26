Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4EFC8E8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 20:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcOOEyLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698353758; x=1729889758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NqpSmc7bXovhhI5YLXl9rQHxQs+D1sbI+195cLCNojw=;
  b=UcOOEyLFRe6nHS77+JWx67VXdnm7/kH5sbRirm/Kn8EAKIiFts8XJFgk
   yC+RiE/wQw+Bn72nZ21U4JvdGsm9KWPbKCCRqvv6fibIqdvc/6T4f9jd6
   meCZayO6WSN5W2C1XLqR0qaLb3hU3ibb0gk75LWwAJbxsdliU2zqk8tu1
   pvftQFMftRZQoK5+7cKh2vHrAWUZmSK+eHjDxx3s/WbEc3AAsZx4V03/s
   qPjVREgQjuD0grUeIQ/wma6gOpwL/sG4+FuOiNCmQJxgsZ/7dcXimH/Hz
   l6HBrvgof4A8gWsJ5O+zf+C+iUrSlyv9bAfJfx/gQftwkAxEN8z1D8QYp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="454109350"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="454109350"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 13:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="932854259"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="932854259"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Oct 2023 13:55:40 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw7OE-000A7T-1r;
	Thu, 26 Oct 2023 20:55:38 +0000
Date: Fri, 27 Oct 2023 04:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 1010/1018] io_uring/net.c:1071:40: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202310270410.i2YHUIFm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: 8206eff884a896c949649e8a9160b085a6f8cc82 [1010/1018] io_uring: add io_recvzc request
config: i386-randconfig-061-20231026 (https://download.01.org/0day-ci/archive/20231027/202310270410.i2YHUIFm-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310270410.i2YHUIFm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310270410.i2YHUIFm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/net.c: note: in included file (through io_uring/io_uring.h):
   include/linux/io_uring_types.h:308:48: sparse: sparse: array of flexible structures
>> io_uring/net.c:1071:40: sparse: sparse: Using plain integer as NULL pointer

vim +1071 io_uring/net.c

  1016	
  1017	int io_recvzc(struct io_kiocb *req, unsigned int issue_flags)
  1018	{
  1019		struct io_recvzc *zc = io_kiocb_to_cmd(req, struct io_recvzc);
  1020		struct socket *sock;
  1021		unsigned flags;
  1022		int ret, min_ret = 0;
  1023		bool force_nonblock = issue_flags & IO_URING_F_NONBLOCK;
  1024	
  1025		if (!(req->flags & REQ_F_POLLED) &&
  1026		    (zc->flags & IORING_RECVSEND_POLL_FIRST))
  1027			return -EAGAIN;
  1028	
  1029		sock = sock_from_file(req->file);
  1030		if (unlikely(!sock))
  1031			return -ENOTSOCK;
  1032	
  1033	retry_multishot:
  1034		flags = zc->msg_flags;
  1035		if (force_nonblock)
  1036			flags |= MSG_DONTWAIT;
  1037		if (flags & MSG_WAITALL)
  1038			min_ret = zc->len;
  1039	
  1040		ret = io_zc_rx_recv(sock, zc->datalen, flags);
  1041		if (ret < min_ret) {
  1042			if (ret == -EAGAIN && force_nonblock) {
  1043				if (issue_flags & IO_URING_F_MULTISHOT) {
  1044					io_kbuf_recycle(req, issue_flags);
  1045					return IOU_ISSUE_SKIP_COMPLETE;
  1046				}
  1047	
  1048				return -EAGAIN;
  1049			}
  1050			if (ret > 0 && io_net_retry(sock, flags)) {
  1051				zc->len -= ret;
  1052				zc->buf += ret;
  1053				zc->done_io += ret;
  1054				req->flags |= REQ_F_PARTIAL_IO;
  1055				return -EAGAIN;
  1056			}
  1057			if (ret == -ERESTARTSYS)
  1058				ret = -EINTR;
  1059			req_set_fail(req);
  1060		} else if ((flags & MSG_WAITALL) && (flags & (MSG_TRUNC | MSG_CTRUNC))) {
  1061			req_set_fail(req);
  1062		}
  1063	
  1064		if (ret > 0)
  1065			ret += zc->done_io;
  1066		else if (zc->done_io)
  1067			ret = zc->done_io;
  1068		else
  1069			io_kbuf_recycle(req, issue_flags);
  1070	
> 1071		if (!io_recv_finish(req, &ret, 0, ret <= 0, issue_flags))
  1072			goto retry_multishot;
  1073	
  1074		return ret;
  1075	}
  1076	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
