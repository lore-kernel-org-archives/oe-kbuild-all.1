Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3513C13AC4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfbH/7Xp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697808376; x=1729344376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CopwIezKedZAg4i6jsMm5kOzbBDjj2LlXnX9RcYMtb0=;
  b=hfbH/7XpXPexyxJfnPHKMyqNCnpG8v68RR6uP74L67dUpLBEudjyerM/
   k5L6KyK6nEpYd66B56v+xnYUXSun1xA3WB//ilEypxVVFEniHD4mViQ8i
   9aq4d8DAkVnAd7qLBd18yEFwVwHBDO6lMVq4mbK3MN5CA72Zf3kXJRAxU
   JQ6Tqz2y9A1awFdtFpz1OAB4p1YUEJpa+ZKiEgD2So8S7DS/AgfqwGhoe
   4uBGjEw5DcF+cbRgJRQdjUMhfK9Wo1DA/gBFOZCjq0qbRuEH8ExiZ8cEA
   ACvaGGI00YlLBI/6hAEVtKkUKU1eKLltKaTRZr5MpSBR6mNQI5pSgBGTI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="417625960"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="417625960"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 06:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="5389328"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2023 06:26:12 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtpVw-0003Yu-2o;
	Fri, 20 Oct 2023 13:26:08 +0000
Date: Fri, 20 Oct 2023 21:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/veth2 12/16] zc_rx.c:undefined reference to
 `lock_sock_nested'
Message-ID: <202310202121.nnRn2TlX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth2
head:   731b7375c43d08e971bcafcd9e90c1c0c8250678
commit: 3370a0fe2135834d92ab82d8cb490cd6b5188f78 [12/16] io_uring: add io_recvzc request
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20231020/202310202121.nnRn2TlX-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310202121.nnRn2TlX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310202121.nnRn2TlX-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_tcp_recvmsg.isra.0':
>> zc_rx.c:(.text+0x824): undefined reference to `lock_sock_nested'
   sh4-linux-ld: zc_rx.c:(.text+0x828): undefined reference to `tcp_read_sock'
   sh4-linux-ld: zc_rx.c:(.text+0x830): undefined reference to `sk_wait_data'
   sh4-linux-ld: zc_rx.c:(.text+0x838): undefined reference to `release_sock'
   sh4-linux-ld: zc_rx.c:(.text+0x880): undefined reference to `release_sock'
   sh4-linux-ld: io_uring/zc_rx.o: in function `io_register_zc_rx_ifq':
   zc_rx.c:(.text+0xb78): undefined reference to `dev_get_by_index'
   sh4-linux-ld: zc_rx.c:(.text+0xb7c): undefined reference to `init_net'
   sh4-linux-ld: io_uring/zc_rx.o: in function `io_register_zc_rx_sock':
   zc_rx.c:(.text+0xcb8): undefined reference to `sock_from_file'
   sh4-linux-ld: zc_rx.c:(.text+0xcbc): undefined reference to `lock_sock_nested'
   sh4-linux-ld: zc_rx.c:(.text+0xcc0): undefined reference to `release_sock'
   sh4-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_recv':
   zc_rx.c:(.text+0xcf0): undefined reference to `tcp_recvmsg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
