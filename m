Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D6A2EB02
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Oct 2023 17:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKX1Kxtz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698339753; x=1729875753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xFl+TtyRnsDEZT4oB9UDTBC3vU3a6AFrPZEt6mBHrJM=;
  b=FKX1KxtzU+rdwhV75oLrlEVuKOvIWVDhrZawsa8qzViMYSHK6OGVXJjg
   OOW1HOchOkq2XoaAJ3sbpHRPA71sm/nqkDaxoUK37tozrCSBeFwFz0nn+
   8ZAukk8H5eP+ztclETN7jWT9X6EnrE08ag54z1CIDTxtJL9+ypBvf5qXG
   K5L6v5dyvirF7f4Xfo1RrWNlcV77nvKqrGDlnkZxB5tq1dcoqtj4OkYXR
   O76hKlktbAo+4UAaav1MDNbL+z45Cf/Wwr1iSXktOEzIgp9quFb7LKHq5
   P/Rot/V8v2tJuGwnDzFpjP3fenxZ2v+fbfcGLEkwLwiNtlJ/DNPsbpmlb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="377962299"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="377962299"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 10:02:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="759286079"
X-IronPort-AV: E=Sophos;i="6.03,254,1694761200"; 
   d="scan'208";a="759286079"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 Oct 2023 10:02:31 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw3ka-0009y7-37;
	Thu, 26 Oct 2023 17:02:28 +0000
Date: Fri, 27 Oct 2023 01:02:19 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/rx-latest 12/21] aarch64-linux-ld: zc_rx.c:undefined
 reference to `tcp_recvmsg'
Message-ID: <202310270049.pdK51Awt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-latest
head:   c56f6485dd778cce084741e5ac38ab9352287773
commit: fe93615f71187bb84cca3d790d992cfc5e6062fb [12/21] io_uring: add io_recvzc request
config: arm64-randconfig-002-20231026 (https://download.01.org/0day-ci/archive/20231027/202310270049.pdK51Awt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310270049.pdK51Awt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310270049.pdK51Awt-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_tcp_recvmsg.isra.0':
   zc_rx.c:(.text+0x13f8): undefined reference to `tcp_read_sock'
   aarch64-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_recv':
   zc_rx.c:(.text+0x24f4): undefined reference to `tcp_recvmsg'
   aarch64-linux-ld: io_uring/zc_rx.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `tcp_recvmsg' which may bind externally can not be used when making a shared object; recompile with -fPIC
   zc_rx.c:(.text+0x24f4): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: zc_rx.c:(.text+0x24f8): undefined reference to `tcp_recvmsg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
