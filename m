Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62017F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 11:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690113004; x=1721649004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=055Bc2zP5OrmlEQQWAhZB2avLOPuqRhcV5yMw3p8KnM=;
  b=MF4xo7M959+L3vPBjIN1poNaQ2bMqZKSjbGU/THCB+hY4m3GT12J2upM
   NpptgXzcFW71I3U163ZAdSsx826UHLkdDgiduNnfj3Q+E4Z8MEObVSetd
   7oAXaxLR7UdxgjUBmZEAfa0/8gLVG2nUOWp850erRbyBj0TIdmXHiYjY/
   6g1p+orPuM4NPTdrheTKo6j59W8Vj9iEJr1o8/E6xXg811nOlZ+tHKRRU
   dvJLyRQsqNV5CTPjnvqJnaUriR3RNlWNjAhFyvk7KzYMaMcNmL5bGF5t+
   SR7p35SnWMSnD7jo6T8p9smlEoANuKvVf0q1T4VXE0Z/HmtRE+Q6+Y2qd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="357267812"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="357267812"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 04:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="899208924"
X-IronPort-AV: E=Sophos;i="6.01,226,1684825200"; 
   d="scan'208";a="899208924"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 23 Jul 2023 04:50:02 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNXb7-0008z3-1c;
	Sun, 23 Jul 2023 11:50:01 +0000
Date: Sun, 23 Jul 2023 19:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-4.19.y 7387/9999] net/ipv4/udp.c:2463: Error:
 unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
Message-ID: <202307231921.heZdfPiI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   94bffc1044d871e2ec89b2621e9a384355832988
commit: dd1f607cad1f3be1880193521bee2bbd48354a23 [7387/9999] udp: annotate data races around unix_sk(sk)->gso_size
config: riscv-randconfig-r042-20230720 (https://download.01.org/0day-ci/archive/20230723/202307231921.heZdfPiI-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230723/202307231921.heZdfPiI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307231921.heZdfPiI-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/udp.c: Assembler messages:
   net/ipv4/udp.c:1581: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   net/ipv4/udp.c:1581: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2', extension `zicsr' required
>> net/ipv4/udp.c:2463: Error: unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
>> net/ipv4/udp.c:2463: Error: unrecognized opcode `csrc sstatus,a1', extension `zicsr' required
   net/ipv4/udp.c:2576: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/ipv4/udp.c:2576: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   net/ipv4/udp.c:2619: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/ipv4/udp.c:2619: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required


vim +2463 net/ipv4/udp.c

db8dac20d519930 David S. Miller   2008-03-06  2447  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2448  /*
^1da177e4c3f415 Linus Torvalds    2005-04-16  2449   *	Socket option code for UDP
^1da177e4c3f415 Linus Torvalds    2005-04-16  2450   */
4c0a6cb0db19de4 Gerrit Renker     2006-11-27  2451  int udp_lib_setsockopt(struct sock *sk, int level, int optname,
b7058842c940ad2 David S. Miller   2009-09-30  2452  		       char __user *optval, unsigned int optlen,
4c0a6cb0db19de4 Gerrit Renker     2006-11-27  2453  		       int (*push_pending_frames)(struct sock *))
^1da177e4c3f415 Linus Torvalds    2005-04-16  2454  {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2455  	struct udp_sock *up = udp_sk(sk);
1c19448c9ba6545 Tom Herbert       2014-05-23  2456  	int val, valbool;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2457  	int err = 0;
b2bf1e2659b1cba Wang Chen         2007-12-03  2458  	int is_udplite = IS_UDPLITE(sk);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2459  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2460  	if (optlen < sizeof(int))
^1da177e4c3f415 Linus Torvalds    2005-04-16  2461  		return -EINVAL;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2462  
^1da177e4c3f415 Linus Torvalds    2005-04-16 @2463  	if (get_user(val, (int __user *)optval))
^1da177e4c3f415 Linus Torvalds    2005-04-16  2464  		return -EFAULT;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2465  
1c19448c9ba6545 Tom Herbert       2014-05-23  2466  	valbool = val ? 1 : 0;
1c19448c9ba6545 Tom Herbert       2014-05-23  2467  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2468  	switch (optname) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2469  	case UDP_CORK:
^1da177e4c3f415 Linus Torvalds    2005-04-16  2470  		if (val != 0) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2471  			up->corkflag = 1;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2472  		} else {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2473  			up->corkflag = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2474  			lock_sock(sk);
4243cdc2c1e5a13 Joe Perches       2014-11-11  2475  			push_pending_frames(sk);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2476  			release_sock(sk);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2477  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2478  		break;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2479  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2480  	case UDP_ENCAP:
^1da177e4c3f415 Linus Torvalds    2005-04-16  2481  		switch (val) {
^1da177e4c3f415 Linus Torvalds    2005-04-16  2482  		case 0:
^1da177e4c3f415 Linus Torvalds    2005-04-16  2483  		case UDP_ENCAP_ESPINUDP:
^1da177e4c3f415 Linus Torvalds    2005-04-16  2484  		case UDP_ENCAP_ESPINUDP_NON_IKE:
067b207b281db5e James Chapman     2007-07-05  2485  			up->encap_rcv = xfrm4_udp_encap_rcv;
067b207b281db5e James Chapman     2007-07-05  2486  			/* FALLTHROUGH */
342f0234c71b40d James Chapman     2007-06-27  2487  		case UDP_ENCAP_L2TPINUDP:
^1da177e4c3f415 Linus Torvalds    2005-04-16  2488  			up->encap_type = val;
447167bf565a474 Eric Dumazet      2012-04-11  2489  			udp_encap_enable();
^1da177e4c3f415 Linus Torvalds    2005-04-16  2490  			break;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2491  		default:
^1da177e4c3f415 Linus Torvalds    2005-04-16  2492  			err = -ENOPROTOOPT;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2493  			break;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2494  		}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2495  		break;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2496  
1c19448c9ba6545 Tom Herbert       2014-05-23  2497  	case UDP_NO_CHECK6_TX:
1c19448c9ba6545 Tom Herbert       2014-05-23  2498  		up->no_check6_tx = valbool;
1c19448c9ba6545 Tom Herbert       2014-05-23  2499  		break;
1c19448c9ba6545 Tom Herbert       2014-05-23  2500  
1c19448c9ba6545 Tom Herbert       2014-05-23  2501  	case UDP_NO_CHECK6_RX:
1c19448c9ba6545 Tom Herbert       2014-05-23  2502  		up->no_check6_rx = valbool;
1c19448c9ba6545 Tom Herbert       2014-05-23  2503  		break;
1c19448c9ba6545 Tom Herbert       2014-05-23  2504  
bec1f6f697362c5 Willem de Bruijn  2018-04-26  2505  	case UDP_SEGMENT:
bec1f6f697362c5 Willem de Bruijn  2018-04-26  2506  		if (val < 0 || val > USHRT_MAX)
bec1f6f697362c5 Willem de Bruijn  2018-04-26  2507  			return -EINVAL;
dd1f607cad1f3be Eric Dumazet      2021-06-30  2508  		WRITE_ONCE(up->gso_size, val);
bec1f6f697362c5 Willem de Bruijn  2018-04-26  2509  		break;
bec1f6f697362c5 Willem de Bruijn  2018-04-26  2510  
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2511  	/*
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2512  	 * 	UDP-Lite's partial checksum coverage (RFC 3828).
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2513  	 */
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2514  	/* The sender sets actual checksum coverage length via this option.
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2515  	 * The case coverage > packet length is handled by send module. */
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2516  	case UDPLITE_SEND_CSCOV:
b2bf1e2659b1cba Wang Chen         2007-12-03  2517  		if (!is_udplite)         /* Disable the option on UDP sockets */
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2518  			return -ENOPROTOOPT;
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2519  		if (val != 0 && val < 8) /* Illegal coverage: use default (8) */
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2520  			val = 8;
4be929be34f9bde Alexey Dobriyan   2010-05-24  2521  		else if (val > USHRT_MAX)
4be929be34f9bde Alexey Dobriyan   2010-05-24  2522  			val = USHRT_MAX;
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2523  		up->pcslen = val;
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2524  		up->pcflag |= UDPLITE_SEND_CC;
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2525  		break;
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2526  
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2527  	/* The receiver specifies a minimum checksum coverage value. To make
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2528  	 * sense, this should be set to at least 8 (as done below). If zero is
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2529  	 * used, this again means full checksum coverage.                     */
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2530  	case UDPLITE_RECV_CSCOV:
b2bf1e2659b1cba Wang Chen         2007-12-03  2531  		if (!is_udplite)         /* Disable the option on UDP sockets */
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2532  			return -ENOPROTOOPT;
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2533  		if (val != 0 && val < 8) /* Avoid silly minimal values.       */
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2534  			val = 8;
4be929be34f9bde Alexey Dobriyan   2010-05-24  2535  		else if (val > USHRT_MAX)
4be929be34f9bde Alexey Dobriyan   2010-05-24  2536  			val = USHRT_MAX;
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2537  		up->pcrlen = val;
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2538  		up->pcflag |= UDPLITE_RECV_CC;
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2539  		break;
ba4e58eca8aa947 Gerrit Renker     2006-11-27  2540  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2541  	default:
^1da177e4c3f415 Linus Torvalds    2005-04-16  2542  		err = -ENOPROTOOPT;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2543  		break;
6516c65573fde5e Stephen Hemminger 2007-03-08  2544  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  2545  
^1da177e4c3f415 Linus Torvalds    2005-04-16  2546  	return err;
^1da177e4c3f415 Linus Torvalds    2005-04-16  2547  }
c482c568577a2b3 Eric Dumazet      2009-07-17  2548  EXPORT_SYMBOL(udp_lib_setsockopt);
^1da177e4c3f415 Linus Torvalds    2005-04-16  2549  

:::::: The code at line 2463 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
