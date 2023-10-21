Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62920E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 23:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6AxNpCK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697931271; x=1729467271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ogyzLvgQmNxh+T2pNOGmA6LZ33JSeVDh74Vw+XQNpzM=;
  b=K6AxNpCKR/psumCQF7oGEzNRwoHETIY7c9vssyBHFGTFxwUz0CPRb43W
   nb3DXry5muCz4lYYuEZyvEfHUTqkaP9/2/+3uhGwRF7GeCreqcXKUgavs
   FmDc2gA6ZnJNeM8kCUZCeu0q1CUJWqYseOoPQEy4H1WrGIYgLKTsTAvoC
   w0yQ36+ovO6AhPDeVN9o5HESYqJ8GjQT4pcI1hmVjdKPu68MVPXsU6kR3
   vBtK+MzgxgxAD+GcYkw59eajPPD4sH0sexmsL6fQqUeTaogrhhnd59q0n
   ybN+oVlBU4gNJboFuvwYFk2Jo3WTHCOVp8NAi1jCVjH+7qskfj6iEJkwH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="371736967"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="371736967"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 16:34:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="734301342"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="734301342"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 21 Oct 2023 16:34:29 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quLUA-0005Lj-1P;
	Sat, 21 Oct 2023 23:34:26 +0000
Date: Sun, 22 Oct 2023 07:33:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/rx_copy_fallback 4/19] undefined reference to
 `dev_get_by_index'
Message-ID: <202310220739.A9yk2arb-lkp@intel.com>
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
commit: 313630ba4b08b92ab6f4d01ca11e9b31be426453 [4/19] io_uring: setup ZC for an RX queue when registering an ifq
config: csky-randconfig-001-20231022 (https://download.01.org/0day-ci/archive/20231022/202310220739.A9yk2arb-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220739.A9yk2arb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220739.A9yk2arb-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: io_uring/zc_rx.o: in function `io_register_zc_rx_ifq':
>> (.text+0x154): undefined reference to `dev_get_by_index'
   csky-linux-ld: io_uring/zc_rx.o: in function `io_unregister_zc_rx_ifq':
>> (.text+0x218): undefined reference to `init_net'
>> csky-linux-ld: (.text+0x21c): undefined reference to `dev_get_by_index'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
