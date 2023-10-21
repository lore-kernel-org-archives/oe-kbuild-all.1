Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD80320B1F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 23:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/phdI6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697930010; x=1729466010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=39jT1S/9rOqKUjEKWfLcyM5I076wje88CzQ6qZa7Q8k=;
  b=F/phdI6lKLkCi1Uo21c7j4xiQjKtyf661mes8oVSxr75dT2NSqmyTP7W
   0lWLE+f38qJuFFqGsSHtC/c1TipSG9/jLy+g5kwx9Es8pxdgiBRuRKPit
   2LX19SenKxg0kjFs5Ml/vE8SjPrAdABZc31XfWW8cWzJieeesD3R6lFqu
   630FDPgeBU6aHy8uAsBfopuCGXgWohQHztl27I4w3iWRjw2424uPccI1q
   Kl0JHm/0ONpPZfXqbtAkLQvwipHjO2lv48f1yOOag1SOS2jcK0d5uk5CH
   OeF+cz9zAYtTVGtHy1DuDc5jH+1ZnaOEHesbPqlitfZkgtssf0NuXfZ1x
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="383868446"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="383868446"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 16:13:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="757792974"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="757792974"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Oct 2023 16:13:27 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quL9p-0005KP-2F;
	Sat, 21 Oct 2023 23:13:25 +0000
Date: Sun, 22 Oct 2023 07:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/rx_copy_fallback 12/19] csky-linux-ld:
 zc_rx.c:undefined reference to `tcp_recvmsg'
Message-ID: <202310220726.foNiSBHA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx_copy_fallback
head:   0a9519b651f43b22e1f6eef1e800cdb204290e4e
commit: d96618739218f5740b2f76b62526ec26cc438253 [12/19] io_uring: add io_recvzc request
config: csky-randconfig-002-20231022 (https://download.01.org/0day-ci/archive/20231022/202310220726.foNiSBHA-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220726.foNiSBHA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220726.foNiSBHA-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_tcp_recvmsg.isra.0':
   zc_rx.c:(.text+0x56c): undefined reference to `lock_sock_nested'
   csky-linux-ld: zc_rx.c:(.text+0x5aa): undefined reference to `tcp_read_sock'
   csky-linux-ld: zc_rx.c:(.text+0x5f8): undefined reference to `sk_wait_data'
   csky-linux-ld: zc_rx.c:(.text+0x628): undefined reference to `release_sock'
   csky-linux-ld: zc_rx.c:(.text+0x67c): undefined reference to `lock_sock_nested'
   csky-linux-ld: zc_rx.c:(.text+0x684): undefined reference to `tcp_read_sock'
   csky-linux-ld: zc_rx.c:(.text+0x688): undefined reference to `sk_wait_data'
   csky-linux-ld: zc_rx.c:(.text+0x68c): undefined reference to `release_sock'
   csky-linux-ld: zc_rx.c:(.text+0x69e): undefined reference to `release_sock'
   csky-linux-ld: zc_rx.c:(.text+0x6a6): undefined reference to `lock_sock_nested'
   csky-linux-ld: zc_rx.c:(.text+0x6ea): undefined reference to `release_sock'
   csky-linux-ld: zc_rx.c:(.text+0x704): undefined reference to `release_sock'
   csky-linux-ld: zc_rx.c:(.text+0x712): undefined reference to `release_sock'
   csky-linux-ld: zc_rx.c:(.text+0x71c): undefined reference to `release_sock'
   csky-linux-ld: zc_rx.c:(.text+0x72c): undefined reference to `release_sock'
   csky-linux-ld: io_uring/zc_rx.o:zc_rx.c:(.text+0x766): more undefined references to `release_sock' follow
   csky-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_unmap_buf':
   zc_rx.c:(.text+0x7f8): undefined reference to `lock_sock_nested'
   csky-linux-ld: io_uring/zc_rx.o: in function `io_register_zc_rx_ifq':
   zc_rx.c:(.text+0xc6c): undefined reference to `dev_get_by_index'
   csky-linux-ld: io_uring/zc_rx.o: in function `io_register_zc_rx_sock':
   zc_rx.c:(.text+0xdaa): undefined reference to `sock_from_file'
   csky-linux-ld: zc_rx.c:(.text+0xdbc): undefined reference to `lock_sock_nested'
   csky-linux-ld: zc_rx.c:(.text+0xdce): undefined reference to `release_sock'
   csky-linux-ld: zc_rx.c:(.text+0xde0): undefined reference to `init_net'
   csky-linux-ld: zc_rx.c:(.text+0xde4): undefined reference to `dev_get_by_index'
   csky-linux-ld: zc_rx.c:(.text+0xe08): undefined reference to `sock_from_file'
   csky-linux-ld: zc_rx.c:(.text+0xe0c): undefined reference to `lock_sock_nested'
   csky-linux-ld: zc_rx.c:(.text+0xe10): undefined reference to `release_sock'
   csky-linux-ld: zc_rx.c:(.text+0xe16): undefined reference to `release_sock'
   csky-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_recv':
   zc_rx.c:(.text+0xe74): undefined reference to `release_sock'
>> csky-linux-ld: zc_rx.c:(.text+0xe80): undefined reference to `tcp_recvmsg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
