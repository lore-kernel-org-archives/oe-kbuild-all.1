Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832AC7E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 01:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1sSJ6cs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697245894; x=1728781894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G9APqhi1KXcGgiLdxAVAN1JIrJ9qlnv3ql45CV0krk8=;
  b=S1sSJ6cssbeRf0fAYbOA7g3jnAjEjaZEz+/7vFTUCcK+LLDrUM8dkSFl
   ngR8XrLkPMjYJE8DzoHKfj6+pyE7d4W0HTQcC5bGGA5/IbuVA4UTzW5y0
   wy9M0G6ghwtGmIIw2g0Lpj7olxY3bzg75DUagJAKLynRRAa+bzR0N6kip
   IRZmdCBfhFfiNOkLmRRH9O+OCdYJXn2b41ww7qg3tGx0SxruomA95L1KV
   di8XiVsFY7O6N9yAREYwHOXHJLl0wRTn+FLrV+GNasK5WGTuJZCGPoPXP
   GQewl34jxYyinxcRIQ6c05XjMYRqORnr5eA26ki45iuRAioak3OFBHdMZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="385132905"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="385132905"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="731558205"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="731558205"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Oct 2023 18:11:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrTBd-0005Zn-1v;
	Sat, 14 Oct 2023 01:11:29 +0000
Date: Sat, 14 Oct 2023 09:11:13 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 1010/1018] loongarch64-linux-ld: zc_rx.c:undefined
 reference to `tcp_recvmsg'
Message-ID: <202310140920.bu4c35kl-lkp@intel.com>
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
config: loongarch-randconfig-002-20231014 (https://download.01.org/0day-ci/archive/20231014/202310140920.bu4c35kl-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140920.bu4c35kl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140920.bu4c35kl-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: io_uring/zc_rx.o: in function `.L145':
   zc_rx.c:(.text+0xbb0): undefined reference to `tcp_read_sock'
   loongarch64-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_recv':
   zc_rx.c:(.text+0x1788): undefined reference to `tcp_recvmsg'
>> loongarch64-linux-ld: zc_rx.c:(.text+0x178c): undefined reference to `tcp_recvmsg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
