Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9042DB6A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYE581XX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702645515; x=1734181515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rm8Kjognd/ZZdikPTD2iq2orYol+cEZYPa7c6lO8HuY=;
  b=NYE581XXY/FnOGQuLoL8G0hO34Urs4ZCmxf86NVbk2hea92pSBXFel2J
   jVOrC+y7NRfHq3GmOp+kA48j49yAh2XhE8F5GFKMTSJoiWfe++XqFklcI
   z7SldQDkb1quWTxJ/5mpYWNtEOjNLBUQpaL4q2/p4Gn7PbcR+w5HnYljh
   4vQKTVe/eDFR/Snm817BT5prIZFmFmEJQD7ZRXqygtrw/y4gJDoFMS95S
   F9JVAYDr8WxU6NnHHdQPfe99MP6A7cIsBz4BlJQWhkesQReuotTMY3EK8
   4zZ7qcjvaNvuCd3H6h6pM5kwySs8PIoCr8p8S7/kvOmuynxFm26d926M0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="375418317"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="375418317"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 05:05:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="767976378"
X-IronPort-AV: E=Sophos;i="6.04,278,1695711600"; 
   d="scan'208";a="767976378"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Dec 2023 05:05:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rE7sK-0000EH-30;
	Fri, 15 Dec 2023 13:05:08 +0000
Date: Fri, 15 Dec 2023 21:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-latest 27/31] ld.lld: error: undefined symbol:
 io_zc_rx_recv
Message-ID: <202312152045.GLEQ7wws-lkp@intel.com>
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
config: i386-buildonly-randconfig-001-20231215 (https://download.01.org/0day-ci/archive/20231215/202312152045.GLEQ7wws-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312152045.GLEQ7wws-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312152045.GLEQ7wws-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: io_zc_rx_recv
   >>> referenced by net.c
   >>>               io_uring/net.o:(io_recvzc) in archive vmlinux.a
   >>> referenced by net.c
   >>>               io_uring/net.o:(io_recvzc) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
