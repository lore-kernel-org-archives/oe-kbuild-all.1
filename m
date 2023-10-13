Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6692D134DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFbJFfwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697208591; x=1728744591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=raOskur7NOxaNIRtWwdZ83eY1nFQRUbcOCqG9wgg+Mo=;
  b=BFbJFfwi/zIkS6a9ZZkq8tTjVEx0O79RQwLiuC1mlTlHsM3lVxDGjavB
   5ZSd/pEY0O0KjWV8L/5H4zIUosIRsETqUVx746N8O+5ypYUrn8X62PAEd
   art87dpJnE5lxZIg5ASubvYi8w9o7HqbTSEyiD+m/tqIe65ghHN+FZ6o5
   chg4O7s7rTEG17N60RQZFE9Bzv0MHEErbD6FFdsxb8LP9R2GBdYS08j5D
   pbn3/wcY9C0338MlrGzkYA4fRx88zsu3bYi4m3QBoGek2lVLjXYzG/rMw
   C2qRk2xx79X2pFx/qEGb5XDVjZNUqjl7JLdZ6HPpCkeRn5Dpm2uBrrFOY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="375549419"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="375549419"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 07:49:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="820661069"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="820661069"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 13 Oct 2023 07:49:32 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrJTl-0004st-33;
	Fri, 13 Oct 2023 14:49:29 +0000
Date: Fri, 13 Oct 2023 22:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 1005/1018] exit.c:(.text+0x4d7): multiple
 definition of `io_zc_rx_put_buf'; kernel/fork.o:fork.c:(.text+0x65a): first
 defined here
Message-ID: <202310132215.rrB31lu0-lkp@intel.com>
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
commit: af0d7997ce7db79cf67af9211e630ac1b95a3924 [1005/1018] io_uring: add ZC pool API
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20231013/202310132215.rrB31lu0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310132215.rrB31lu0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310132215.rrB31lu0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:97:
>> include/linux/io_uring.h:120:60: warning: 'struct io_zc_rx_ifq' declared inside parameter list will not be visible outside of this definition or declaration
     120 | static inline struct io_zc_rx_buf *io_zc_rx_get_buf(struct io_zc_rx_ifq *ifq)
         |                                                            ^~~~~~~~~~~~
   include/linux/io_uring.h:124:30: warning: 'struct io_zc_rx_ifq' declared inside parameter list will not be visible outside of this definition or declaration
     124 | void io_zc_rx_put_buf(struct io_zc_rx_ifq *ifq, struct io_zc_rx_buf *buf)
         |                              ^~~~~~~~~~~~
>> include/linux/io_uring.h:124:6: warning: no previous prototype for 'io_zc_rx_put_buf' [-Wmissing-prototypes]
     124 | void io_zc_rx_put_buf(struct io_zc_rx_ifq *ifq, struct io_zc_rx_buf *buf)
         |      ^~~~~~~~~~~~~~~~
--
   ld: kernel/exit.o: in function `io_zc_rx_put_buf':
>> exit.c:(.text+0x4d7): multiple definition of `io_zc_rx_put_buf'; kernel/fork.o:fork.c:(.text+0x65a): first defined here
   ld: fs/exec.o: in function `io_zc_rx_put_buf':
   exec.c:(.text+0xed0): multiple definition of `io_zc_rx_put_buf'; kernel/fork.o:fork.c:(.text+0x65a): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
