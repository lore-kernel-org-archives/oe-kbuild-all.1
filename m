Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FA4179AA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 10:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720779503; cv=none; b=frjqBbs3jZV4OOwss23BfbKPyK2PP0VGwBkmG+e965G0+TltlHE1iOuJGzwOqXM0bOAMIFoc2Mkq9WmUzF1m5GgpGC2BlQ2AHSjR8h1TQSEtUXDPfsxEtJAxzG3+waDqy1GL1pIAyqQEHTNMpyFmk1T31r3iTvwY8fqv3ydXa28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720779503; c=relaxed/simple;
	bh=IMYiGUQS+XcZ3ByQEpe3QCPc/Fks44PMlB0Gl31MxRk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gPAqSGvsoqCmt455Dadegr27yjnPQQJD1BY4fB0kjqz4LHSr7WtAub3eg9b6UnXlCUwTQ2Lk2kQtT2Z+SjJh1rltTaBt16FwRsw1FrP9MF85cZ/tL5Ht5/areiSffcute3a32QBFTkKFWuEFuSKChcinDSWrs8syD9qS2p5pmtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4cFuvvY; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4cFuvvY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720779501; x=1752315501;
  h=date:from:cc:subject:message-id:mime-version;
  bh=IMYiGUQS+XcZ3ByQEpe3QCPc/Fks44PMlB0Gl31MxRk=;
  b=W4cFuvvYKhH7ZhSkE7O1BNeI4AXY/kSpeSM+v//9eLtwAoESVWFaoF1s
   LaBYOB037gQfGR0/dEKcYNA78av/sfFxk3JkVsTQJK6YqUAZ1jWt2TUmG
   fG/eeJhLcILAfE/33HyBQSdcqfjpl1BfWHmNB4vgdxBLySAqlVbB5kfvg
   N0xMtd6v4ZYXz0VJ2MwzflIR/DFR0j1xV8m1kDh/LmWwJSxfkmSeV7QIT
   2Po6ahZxWfJbwA63c9avgLfjTFFFkeNl3FBd2jRltzuwY3YaeaGHRTdSV
   t8ASVH43T2zcIJtzPCLk6w0AFy3iBpgfI9OWUyLVa0GqLqc88lCUsCknT
   w==;
X-CSE-ConnectionGUID: 8CyL34V8T8amsUSUwCbL9A==
X-CSE-MsgGUID: tkvRljOOQz6vjaR39JQQtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="35756358"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="35756358"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 03:18:20 -0700
X-CSE-ConnectionGUID: mlMWB/oeTFypmqLI9oYsNg==
X-CSE-MsgGUID: UK3dbaUES6mif1CTDfEIlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="54053351"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jul 2024 03:18:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSDM0-000adm-17;
	Fri, 12 Jul 2024 10:18:16 +0000
Date: Fri, 12 Jul 2024 18:17:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:linux-4.19.y 97/184] net/ipv4/udp.c:2622: Error: unrecognized
 opcode `csrs sstatus,a2', extension `zicsr' required
Message-ID: <202407121819.8jlaF37P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git linux-4.19.y
head:   05a68fe2c1f4661c5641ad0d9fb0241503f126d7
commit: f21612ee652c08b4a5a0bb11528035f57935fae1 [97/184] udp: fix incorrect parameter validation in the udp_lib_getsockopt() function
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240712/202407121819.8jlaF37P-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121819.8jlaF37P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407121819.8jlaF37P-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   net/ipv4/udp.c:1584: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/ipv4/udp.c:1584: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   net/ipv4/udp.c:1577: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/ipv4/udp.c:1577: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a2,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a3', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,sstatus,2', extension `zicsr' required
   net/ipv4/udp.c:2579: Error: unrecognized opcode `csrs sstatus,a6', extension `zicsr' required
   net/ipv4/udp.c:2579: Error: unrecognized opcode `csrc sstatus,a6', extension `zicsr' required
>> net/ipv4/udp.c:2622: Error: unrecognized opcode `csrs sstatus,a2', extension `zicsr' required
>> net/ipv4/udp.c:2622: Error: unrecognized opcode `csrc sstatus,a2', extension `zicsr' required
   net/ipv4/udp.c:2466: Error: unrecognized opcode `csrs sstatus,a0', extension `zicsr' required
   net/ipv4/udp.c:2466: Error: unrecognized opcode `csrc sstatus,a0', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a4,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required


vim +2622 net/ipv4/udp.c

db8dac20d51993 David S. Miller   2008-03-06  2572  
4c0a6cb0db19de Gerrit Renker     2006-11-27  2573  int udp_lib_getsockopt(struct sock *sk, int level, int optname,
^1da177e4c3f41 Linus Torvalds    2005-04-16  2574  		       char __user *optval, int __user *optlen)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2575  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2576  	struct udp_sock *up = udp_sk(sk);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2577  	int val, len;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2578  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2579  	if (get_user(len, optlen))
^1da177e4c3f41 Linus Torvalds    2005-04-16  2580  		return -EFAULT;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2581  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2582  	if (len < 0)
^1da177e4c3f41 Linus Torvalds    2005-04-16  2583  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2584  
f21612ee652c08 Gavrilov Ilia     2024-03-07  2585  	len = min_t(unsigned int, len, sizeof(int));
f21612ee652c08 Gavrilov Ilia     2024-03-07  2586  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2587  	switch (optname) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  2588  	case UDP_CORK:
f6a6cced386920 Eric Dumazet      2021-09-27  2589  		val = READ_ONCE(up->corkflag);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2590  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2591  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2592  	case UDP_ENCAP:
^1da177e4c3f41 Linus Torvalds    2005-04-16  2593  		val = up->encap_type;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2594  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2595  
1c19448c9ba654 Tom Herbert       2014-05-23  2596  	case UDP_NO_CHECK6_TX:
1c19448c9ba654 Tom Herbert       2014-05-23  2597  		val = up->no_check6_tx;
1c19448c9ba654 Tom Herbert       2014-05-23  2598  		break;
1c19448c9ba654 Tom Herbert       2014-05-23  2599  
1c19448c9ba654 Tom Herbert       2014-05-23  2600  	case UDP_NO_CHECK6_RX:
1c19448c9ba654 Tom Herbert       2014-05-23  2601  		val = up->no_check6_rx;
1c19448c9ba654 Tom Herbert       2014-05-23  2602  		break;
1c19448c9ba654 Tom Herbert       2014-05-23  2603  
bec1f6f697362c Willem de Bruijn  2018-04-26  2604  	case UDP_SEGMENT:
dd1f607cad1f3b Eric Dumazet      2021-06-30  2605  		val = READ_ONCE(up->gso_size);
bec1f6f697362c Willem de Bruijn  2018-04-26  2606  		break;
bec1f6f697362c Willem de Bruijn  2018-04-26  2607  
ba4e58eca8aa94 Gerrit Renker     2006-11-27  2608  	/* The following two cannot be changed on UDP sockets, the return is
ba4e58eca8aa94 Gerrit Renker     2006-11-27  2609  	 * always 0 (which corresponds to the full checksum coverage of UDP). */
ba4e58eca8aa94 Gerrit Renker     2006-11-27  2610  	case UDPLITE_SEND_CSCOV:
ba4e58eca8aa94 Gerrit Renker     2006-11-27  2611  		val = up->pcslen;
ba4e58eca8aa94 Gerrit Renker     2006-11-27  2612  		break;
ba4e58eca8aa94 Gerrit Renker     2006-11-27  2613  
ba4e58eca8aa94 Gerrit Renker     2006-11-27  2614  	case UDPLITE_RECV_CSCOV:
ba4e58eca8aa94 Gerrit Renker     2006-11-27  2615  		val = up->pcrlen;
ba4e58eca8aa94 Gerrit Renker     2006-11-27  2616  		break;
ba4e58eca8aa94 Gerrit Renker     2006-11-27  2617  
^1da177e4c3f41 Linus Torvalds    2005-04-16  2618  	default:
^1da177e4c3f41 Linus Torvalds    2005-04-16  2619  		return -ENOPROTOOPT;
6516c65573fde5 Stephen Hemminger 2007-03-08  2620  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  2621  
^1da177e4c3f41 Linus Torvalds    2005-04-16 @2622  	if (put_user(len, optlen))
^1da177e4c3f41 Linus Torvalds    2005-04-16  2623  		return -EFAULT;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2624  	if (copy_to_user(optval, &val, len))
^1da177e4c3f41 Linus Torvalds    2005-04-16  2625  		return -EFAULT;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2626  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  2627  }
c482c568577a2b Eric Dumazet      2009-07-17  2628  EXPORT_SYMBOL(udp_lib_getsockopt);
^1da177e4c3f41 Linus Torvalds    2005-04-16  2629  

:::::: The code at line 2622 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
