Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E364D2C683
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 11:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eu+kit0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702640721; x=1734176721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HItJyv8ASGaeAseKhywuzW1T66J2IdpLGC5mMnbwh8Y=;
  b=eu+kit0nJqwd6o+BQP12akwKPxXqpjhrXznZcnWPni8Z3igbY6BpwTZx
   GbAbTfiXzWjZYOYv0cO0nERTqdNxfR4lTzy0LASSCHkj6gIko10roofUr
   a4WSrZzsvbRgxQ2ow2f+EMqPn3QJkL9W3ZlGkgaxdel9mVlUmgXjYlMav
   HDpt1k6qdeHMKiJiC/aWiqN2GIw9Hh5lYAqJPah0v86DEteyARWpybLl/
   Coc6gnxvKp0fdqKpGp3+NKt66sdkCitFVgH5Qz6bhqSnCbdaFuzN5VoSp
   LU0AXWjJH8artu+m3yjBEwJ1hnBxJcTa2Pomq2jlJCNaTfWY+m8JcM5GJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="459585142"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="459585142"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 03:45:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="840638697"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="840638697"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 15 Dec 2023 03:45:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE6d3-00007e-2U;
	Fri, 15 Dec 2023 11:45:17 +0000
Date: Fri, 15 Dec 2023 19:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-latest 27/31] io_uring/net.c:1056: undefined
 reference to `io_zc_rx_recv'
Message-ID: <202312151939.oOEpnOej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-latest
head:   df0f15513d62887e03d5bdba7b09452d10827883
commit: 173caa7cd806333033c5df43b31fa74d73a552b2 [27/31] io_uring: add io_recvzc request
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20231215/202312151939.oOEpnOej-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312151939.oOEpnOej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312151939.oOEpnOej-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: init/main.o: warning: relocation in read-only section `.ref.text'
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: io_uring/net.o: in function `io_recvzc':
>> io_uring/net.c:1056: undefined reference to `io_zc_rx_recv'
   /usr/bin/ld: warning: creating DT_TEXTREL in a PIE
   clang: error: linker command failed with exit code 1 (use -v to see invocation)


vim +1056 io_uring/net.c

  1025	
  1026	int io_recvzc(struct io_kiocb *req, unsigned int issue_flags)
  1027	{
  1028		struct io_recvzc *zc = io_kiocb_to_cmd(req, struct io_recvzc);
  1029		struct socket *sock;
  1030		unsigned flags;
  1031		int ret, min_ret = 0;
  1032		bool force_nonblock = issue_flags & IO_URING_F_NONBLOCK;
  1033		struct io_zc_rx_ifq *ifq;
  1034	
  1035		if (issue_flags & IO_URING_F_UNLOCKED)
  1036			return -EAGAIN;
  1037	
  1038		if (!(req->flags & REQ_F_POLLED) &&
  1039		    (zc->flags & IORING_RECVSEND_POLL_FIRST))
  1040			return -EAGAIN;
  1041	
  1042		sock = sock_from_file(req->file);
  1043		if (unlikely(!sock))
  1044			return -ENOTSOCK;
  1045		ifq = io_zc_verify_sock(req, sock);
  1046		if (!ifq)
  1047			return -EINVAL;
  1048	
  1049	retry_multishot:
  1050		flags = zc->msg_flags;
  1051		if (force_nonblock)
  1052			flags |= MSG_DONTWAIT;
  1053		if (flags & MSG_WAITALL)
  1054			min_ret = zc->len;
  1055	
> 1056		ret = io_zc_rx_recv(ifq, sock, zc->datalen, flags);
  1057		if (ret < min_ret) {
  1058			if (ret == -EAGAIN && force_nonblock) {
  1059				if (issue_flags & IO_URING_F_MULTISHOT)
  1060					return IOU_ISSUE_SKIP_COMPLETE;
  1061				return -EAGAIN;
  1062			}
  1063			if (ret > 0 && io_net_retry(sock, flags)) {
  1064				zc->len -= ret;
  1065				zc->done_io += ret;
  1066				req->flags |= REQ_F_PARTIAL_IO;
  1067				return -EAGAIN;
  1068			}
  1069			if (ret == -ERESTARTSYS)
  1070				ret = -EINTR;
  1071			req_set_fail(req);
  1072		} else if ((flags & MSG_WAITALL) && (flags & (MSG_TRUNC | MSG_CTRUNC))) {
  1073			req_set_fail(req);
  1074		}
  1075	
  1076		if (ret > 0)
  1077			ret += zc->done_io;
  1078		else if (zc->done_io)
  1079			ret = zc->done_io;
  1080	
  1081		if (!io_recv_finish(req, &ret, 0, ret <= 0, issue_flags))
  1082			goto retry_multishot;
  1083	
  1084		return ret;
  1085	}
  1086	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
