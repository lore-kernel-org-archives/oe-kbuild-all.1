Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5206199DB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hbQ2z2Ms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697803992; x=1729339992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWC9rM/d7DgKr4Vpb0qsu6d1/CVWNKN9sg7SrFwBic4=;
  b=hbQ2z2Msl533W1p18PxoG/yAoixndYziaEGwMlx9sLJlq0eBWctSW0yv
   yvgzVCosAOWTQC4OxxMp2bO4Lw2Pz27NHkiSM8XoTc2gVyMwLFD7zzPbd
   Q8svmcIRpLE2G9VrdFLNU+FE0paGLOx6ja4R8E47cPsZaeWDXtCxBXsDo
   OInf8e5v5cZoj5Qp1XAqXe1JIRBPZSSV7brcoQ4StMpHJ13DCY0gSC90P
   z2TJWj8w4tmKIQtKAsCfmOF2FQi/x3P312FyxnRMTOEBZWAtgUzSmFSY0
   cz7gYQYDDfFtdE0RLtfv1fieQb/+8pxRPp3mRCgF0QwSky07dVrlu5BLI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="472706904"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="472706904"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 05:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5368152"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2023 05:13:10 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtoNF-0003VJ-2s;
	Fri, 20 Oct 2023 12:13:05 +0000
Date: Fri, 20 Oct 2023 20:12:49 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth2 5/16] zc_rx.c:undefined reference to
 `sock_from_file'
Message-ID: <202310202007.amd4KiqY-lkp@intel.com>
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
commit: b06b27da70e0a9337f9c071c621ff091ad565cd5 [5/16] io_uring: implement zc rx socket registration
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20231020/202310202007.amd4KiqY-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310202007.amd4KiqY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310202007.amd4KiqY-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: io_uring/zc_rx.o: in function `io_register_zc_rx_ifq':
   zc_rx.c:(.text+0x210): undefined reference to `dev_get_by_index'
   sh4-linux-ld: zc_rx.c:(.text+0x214): undefined reference to `init_net'
   sh4-linux-ld: io_uring/zc_rx.o: in function `io_register_zc_rx_sock':
>> zc_rx.c:(.text+0x348): undefined reference to `sock_from_file'
>> sh4-linux-ld: zc_rx.c:(.text+0x34c): undefined reference to `lock_sock_nested'
   sh4-linux-ld: zc_rx.c:(.text+0x350): undefined reference to `release_sock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
