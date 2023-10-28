Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496A9FBED
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Oct 2023 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3PzpwED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698489802; x=1730025802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tTe+B6zgcdX1zNXQxyOVjQafN8EdwCbVwD9ZwnyNQ54=;
  b=R3PzpwEDXCTm/g3ai8sj3ci/l3V14NgqIW/D5Zj2VeKeqlDheqrg1HId
   3/0nfA15Mn7pc4+J6DSvTt3G4bX25AtrQMzwpjTpzofcfCEzUZgLa0Rdq
   Po/KQlc4pKctJCvIMZBK+CGoy+puLI1kd8qcZunnmdmg1riWkUT1Mmpsl
   2uUyxLjoV8KcArejFUsnzkfKg1fOktyKu0s9FdrZLTtoXTrJ3vfeERGH8
   j3Ay25ErUhgNrQ91mcCqXEW/JqKcpp8OMHbxz2CCd58+GdxD3OXt271se
   L2LztrQZXQCdXIj87SpaYhXVC7DT4O9H07bbX/U6En4/MXaGilsE0+gjY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="9429100"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="9429100"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 03:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="736331732"
X-IronPort-AV: E=Sophos;i="6.03,259,1694761200"; 
   d="scan'208";a="736331732"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Oct 2023 03:43:19 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwgmj-000Bfm-14;
	Sat, 28 Oct 2023 10:43:17 +0000
Date: Sat, 28 Oct 2023 18:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/veth2 14/16] xtensa-linux-ld: zc_rx.c:undefined
 reference to `tcp_recvmsg'
Message-ID: <202310281816.73C6A6UH-lkp@intel.com>
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
commit: 1e65d03befc872b1f243c468fd33761c1a5d253f [14/16] make it work
config: xtensa-allnoconfig (https://download.01.org/0day-ci/archive/20231028/202310281816.73C6A6UH-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231028/202310281816.73C6A6UH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310281816.73C6A6UH-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_skb_free':
   zc_rx.c:(.text+0x52c): undefined reference to `lock_sock_nested'
   xtensa-linux-ld: zc_rx.c:(.text+0x530): undefined reference to `tcp_read_sock'
   xtensa-linux-ld: zc_rx.c:(.text+0x534): undefined reference to `release_sock'
   xtensa-linux-ld: zc_rx.c:(.text+0x538): undefined reference to `sk_wait_data'
   xtensa-linux-ld: zc_rx.c:(.text+0x54a): undefined reference to `lock_sock_nested'
   xtensa-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_ifq_free':
   zc_rx.c:(.text+0x57f): undefined reference to `tcp_read_sock'
   xtensa-linux-ld: zc_rx.c:(.text+0x5b6): undefined reference to `release_sock'
   xtensa-linux-ld: zc_rx.c:(.text+0x5f2): undefined reference to `sk_wait_data'
   xtensa-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_tcp_recvmsg.isra.0':
   zc_rx.c:(.text+0x61e): undefined reference to `release_sock'
   xtensa-linux-ld: zc_rx.c:(.text+0x62c): undefined reference to `release_sock'
   xtensa-linux-ld: zc_rx.c:(.text+0x646): undefined reference to `release_sock'
   xtensa-linux-ld: zc_rx.c:(.text+0x652): undefined reference to `lock_sock_nested'
   xtensa-linux-ld: zc_rx.c:(.text+0x686): undefined reference to `release_sock'
   xtensa-linux-ld: zc_rx.c:(.text+0x693): undefined reference to `release_sock'
   xtensa-linux-ld: zc_rx.c:(.text+0x6a2): undefined reference to `release_sock'
   xtensa-linux-ld: zc_rx.c:(.text+0x6b6): undefined reference to `release_sock'
   xtensa-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_create_pool':
   zc_rx.c:(.text+0x88c): undefined reference to `init_net'
   xtensa-linux-ld: zc_rx.c:(.text+0x890): undefined reference to `dev_get_by_index'
   xtensa-linux-ld: zc_rx.c:(.text+0x917): undefined reference to `dev_get_by_index'
   xtensa-linux-ld: io_uring/zc_rx.o: in function `io_register_zc_rx_ifq':
   zc_rx.c:(.text+0x9f8): undefined reference to `sock_from_file'
   xtensa-linux-ld: zc_rx.c:(.text+0xa63): undefined reference to `sock_from_file'
   xtensa-linux-ld: zc_rx.c:(.text+0xa7e): undefined reference to `lock_sock_nested'
   xtensa-linux-ld: zc_rx.c:(.text+0xa90): undefined reference to `release_sock'
   xtensa-linux-ld: zc_rx.c:(.text+0xaa1): undefined reference to `release_sock'
>> xtensa-linux-ld: zc_rx.c:(.text+0xab4): undefined reference to `tcp_recvmsg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
