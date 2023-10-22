Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7AA29AF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 13:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5b+we9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697980628; x=1729516628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GO/8PyPuGBJbb+zQ2B0qt/juQHVVVu0l5m8Dicm1kcc=;
  b=n5b+we9teXJl8c+k0Jai/OudXuRFUs+XkWNpd76JTK3Ts2DGqjkv33Ot
   M9DgsZqy4fZVxwt3njD4mT5BNYFV60WyHvNdqRcA+QCp2mXR5Rc8oJiBI
   9QAhY/TX/McnlJj56z2JSPz+w0/SYUVPnlX+Co47e3BQFz1AyUd5wXDfd
   EuQq6ddTEo6EC2f4XeoRR8jeMyR/z64d2c7s8Y/ISaAOG+tP/GfpaZ/XL
   F/2HmRjJzZEPpI40Vs9nHMsJYWDKtibMVF7Z1HUUpNgWzN6545bLHgIpR
   /z1AOp8opudg3u6KH/oX5DN0om5KNMgnaoDDx2cO56IK7rQjU1H+yLjjn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="450928317"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="450928317"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 06:16:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="787228474"
X-IronPort-AV: E=Sophos;i="6.03,242,1694761200"; 
   d="scan'208";a="787228474"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Oct 2023 06:16:56 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quYK5-0005z8-3D;
	Sun, 22 Oct 2023 13:16:54 +0000
Date: Sun, 22 Oct 2023 21:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/rx_copy_fallback 7/19] (.text+0x1154): multiple
 definition of `io_zc_rx_put_buf'; kernel/fork.o:(.text+0x2038): first
 defined here
Message-ID: <202310222107.S8EqA39V-lkp@intel.com>
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
config: parisc-randconfig-001-20231022 (https://download.01.org/0day-ci/archive/20231022/202310222107.S8EqA39V-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310222107.S8EqA39V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310222107.S8EqA39V-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: kernel/exit.o: in function `io_zc_rx_put_buf':
>> (.text+0x1154): multiple definition of `io_zc_rx_put_buf'; kernel/fork.o:(.text+0x2038): first defined here
   hppa-linux-ld: fs/exec.o: in function `io_zc_rx_put_buf':
   (.text+0x30f0): multiple definition of `io_zc_rx_put_buf'; kernel/fork.o:(.text+0x2038): first defined here
   hppa-linux-ld: net/socket.o: in function `io_zc_rx_put_buf':
   (.text+0x34d4): multiple definition of `io_zc_rx_put_buf'; kernel/fork.o:(.text+0x2038): first defined here
   hppa-linux-ld: net/unix/scm.o: in function `io_zc_rx_put_buf':
   (.text+0xa0): multiple definition of `io_zc_rx_put_buf'; kernel/fork.o:(.text+0x2038): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
