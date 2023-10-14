Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7828C7E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 00:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQW1R+/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697243299; x=1728779299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oFIh9iaWb8WfnLyR8b0dceP03bj2guO9OUlhzrQSznc=;
  b=fQW1R+/WGDOARj+rXsTyKn46TiNIKYDe6PKb1kSqIiR605U8j3INhALv
   hqjgTFNCMAqEn7N8Q8Z929Ykrmg1O159Tt0/K1gdv/MmVj2/mdxE3QDUh
   AjtWlxZH+sErIeuVZrFnIE6lC8UpOM25bnFY0zhsUPgRImGO+EAHMJJHz
   BsSeVCc3Hlz1AOXkinJTvjrItH1T85ZBQN3mJVh932I0HyT9tyJO341Hq
   y5r1HwRBMKKIEDvzr49ZNxv3JYhav9hk/f5n7w1fxAiUuY+GzEcN6BD6H
   IggZ30D7UIyIxuuh5u7GiCUpqZqcytPP4Hxowehw4yg+lbgQ9BEHmEpfx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="382518540"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="382518540"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 17:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="845675753"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="845675753"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Oct 2023 17:28:18 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrSVr-0005YN-1c;
	Sat, 14 Oct 2023 00:28:15 +0000
Date: Sat, 14 Oct 2023 08:27:28 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 1010/1018] zc_rx.c:undefined reference to
 `tcp_read_sock'
Message-ID: <202310140832.qNnkTTTQ-lkp@intel.com>
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
config: csky-randconfig-002-20231014 (https://download.01.org/0day-ci/archive/20231014/202310140832.qNnkTTTQ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140832.qNnkTTTQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140832.qNnkTTTQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_tcp_recvmsg.isra.0':
>> zc_rx.c:(.text+0x598): undefined reference to `tcp_read_sock'
>> csky-linux-ld: zc_rx.c:(.text+0x648): undefined reference to `tcp_read_sock'
   csky-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_recv':
>> zc_rx.c:(.text+0xb40): undefined reference to `tcp_recvmsg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
