Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD6820F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 05:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689312689; x=1720848689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lbfrn9kWMTNFv9ErOKm8qj5g7IjBdhdsdEOG2tH0j3Q=;
  b=jZVNcaqrud15JATSIEqMYrQCjNhavqrJr1sIRKJPDUOlpTtd/Ygh/nqy
   VUQhkRNZVqlenEsuKROm491AxwBRr06JMYzNdUnNFW+V6jwuD+uZbPipR
   xScXOe90qPZg9bGFJhe/8MMR+4zOruaWARdhcxRHFaCGYpivXe+a5JANg
   3NT7Vb1qh/lH76ywUfaWWst8YFipsVbntMv7PASsqlWF8KiFyKecu770k
   2n10dnek4BiJHk+EJT92h4Azqdbel7ubThJ+8t3D4G4c/Bmeq6zn7YihY
   oz2+lZZx9FgiH335VscJl1TR4aXCuRitfZrAHVUo2Xc6h1z9YFwol/yZM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="396205643"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="396205643"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 22:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="968883738"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="968883738"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Jul 2023 22:31:23 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKBOk-0007D3-1n;
	Fri, 14 Jul 2023 05:31:22 +0000
Date: Fri, 14 Jul 2023 13:30:35 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Anna Schumaker <Anna.Schumaker@netapp.com>
Subject: [stable:linux-4.19.y 458/6356] net/core/sock.c:1090: Error:
 unrecognized opcode `csrs sstatus,s9', extension `zicsr' required
Message-ID: <202307141326.TaHBNeBG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi NeilBrown,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   94bffc1044d871e2ec89b2621e9a384355832988
commit: 7581fdf6c01991f03b1b51d524f1b7b64c920ce3 [458/6356] cred: allow get_cred() and put_cred() to be given NULL.
config: riscv-randconfig-r024-20230712 (https://download.01.org/0day-ci/archive/20230714/202307141326.TaHBNeBG-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307141326.TaHBNeBG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307141326.TaHBNeBG-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a3,sstatus,2', extension `zicsr' required
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   net/core/sock.c:673: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   net/core/sock.c:673: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   net/core/sock.c:1112: Error: unrecognized opcode `csrs sstatus,a5', extension `zicsr' required
   net/core/sock.c:1112: Error: unrecognized opcode `csrc sstatus,a5', extension `zicsr' required
   net/core/sock.c:1267: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/core/sock.c:1267: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   net/core/sock.c:1420: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/core/sock.c:1420: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
>> net/core/sock.c:1090: Error: unrecognized opcode `csrs sstatus,s9', extension `zicsr' required
>> net/core/sock.c:1090: Error: unrecognized opcode `csrc sstatus,s9', extension `zicsr' required


vim +1090 net/core/sock.c

3f551f9436c05a Eric W. Biederman 2010-06-13  1083  
28b5ba2aa0f55d David Herrmann    2017-06-21  1084  static int groups_to_user(gid_t __user *dst, const struct group_info *src)
28b5ba2aa0f55d David Herrmann    2017-06-21  1085  {
28b5ba2aa0f55d David Herrmann    2017-06-21  1086  	struct user_namespace *user_ns = current_user_ns();
28b5ba2aa0f55d David Herrmann    2017-06-21  1087  	int i;
28b5ba2aa0f55d David Herrmann    2017-06-21  1088  
28b5ba2aa0f55d David Herrmann    2017-06-21  1089  	for (i = 0; i < src->ngroups; i++)
28b5ba2aa0f55d David Herrmann    2017-06-21 @1090  		if (put_user(from_kgid_munged(user_ns, src->gid[i]), dst + i))
28b5ba2aa0f55d David Herrmann    2017-06-21  1091  			return -EFAULT;
28b5ba2aa0f55d David Herrmann    2017-06-21  1092  
28b5ba2aa0f55d David Herrmann    2017-06-21  1093  	return 0;
28b5ba2aa0f55d David Herrmann    2017-06-21  1094  }
28b5ba2aa0f55d David Herrmann    2017-06-21  1095  

:::::: The code at line 1090 was first introduced by commit
:::::: 28b5ba2aa0f55d80adb2624564ed2b170c19519e net: introduce SO_PEERGROUPS getsockopt

:::::: TO: David Herrmann <dh.herrmann@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
