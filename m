Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238EF1374
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 02:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hrr+xcnK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698027027; x=1729563027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fqol+6Y1W8sinkXsgY0Q/YKT69cqKJqW7EN2yClwTao=;
  b=hrr+xcnK1jZM0Kelay3GjhsvEXOoCWTLGf6lYdLo3BDIF2KP+h3+eV4d
   FdpTeA+j6ftjpAqGy2LnUNPUasR+9xpf5aQq/pZ5QjrgmCWY8yAYO+nwT
   kbRell6gRQIexrM/vIVGhP4D2N8q0TXiXVsI2AKDNmLcc4iJbcjYxxjdQ
   0jCedVY4iTrxmhg+EBzqYUyjQgVqrh7t3t/21JSfWEOzgvifsReygXVYZ
   RxdL7R2fAUU0UYM/leS1Gy6cnH8komyc/DQoxmGcBCrg9hdlx8V/OavYy
   br82lWivMhNFjNiwlk2H+144G+aktpVpTAoCFCvXX18hGT4GAYcmRp9qH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="371818280"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="371818280"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 19:10:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; 
   d="scan'208";a="5644323"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Oct 2023 19:09:10 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qukOc-0006T3-38;
	Mon, 23 Oct 2023 02:10:22 +0000
Date: Mon, 23 Oct 2023 10:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/rx_copy_fallback 7/19] exit.c:(.text+0x1074): multiple
 definition of `io_zc_rx_put_buf'; kernel/fork.o:fork.c:(.text+0x1778): first
 defined here
Message-ID: <202310230944.VZ6SpgET-lkp@intel.com>
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
commit: 726ad3b938e5604338bd151b77107b8972c02dec [7/19] io_uring: add ZC pool API
config: i386-buildonly-randconfig-001-20231023 (https://download.01.org/0day-ci/archive/20231023/202310230944.VZ6SpgET-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310230944.VZ6SpgET-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230944.VZ6SpgET-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/exit.o: in function `io_zc_rx_put_buf':
>> exit.c:(.text+0x1074): multiple definition of `io_zc_rx_put_buf'; kernel/fork.o:fork.c:(.text+0x1778): first defined here
   ld: fs/exec.o: in function `io_zc_rx_put_buf':
   exec.c:(.text+0x25a8): multiple definition of `io_zc_rx_put_buf'; kernel/fork.o:fork.c:(.text+0x1778): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
