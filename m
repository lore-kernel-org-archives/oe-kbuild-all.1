Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BCA10FF
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 06:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677825413; x=1709361413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZniQ3MesnDry2HIkqtSsgFRBJ3MEsk14LF98czumCj4=;
  b=TnXBqaXmXJmHTieNibmqyts+pq0ZdZb3rL3QL0cRbo3H2Kaz2W1bpweu
   aQJcgj1tey4qZjf0uVy16mzUHHVGnE5hVq18NxydVyIwqNu2ah72nfXko
   Dy4N55tpxYFCK76lPBC0xxT6lXabT47OaxXf4/b0ytTuvMOx+s2RlTJkz
   KkAseMTqyWi0qtNkvvYpNmhBt3UId1rfuVrH9fAekvJQvNCaJWCl9Kj5X
   cV9asYW4gnSnzmg0H46XH4/tUKy8oVG7w3dcUaJvBwSsKbdG+99o0PwzY
   xAFIHxEoaSBR9zuw0zp8BgEr7AbHA0kidYsdk0jnKjsNs+rvD4e63KbGa
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="399778625"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="399778625"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 22:36:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="707723104"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="707723104"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Mar 2023 22:36:52 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXz2B-0001GE-1e;
	Fri, 03 Mar 2023 06:36:51 +0000
Date: Fri, 3 Mar 2023 14:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 437/5323] net/core/sock.c:1090: Error:
 unrecognized opcode `csrs sstatus,s8'
Message-ID: <202303031433.Q4SwKAFJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   2e3d9118e4e62b90603d61abd45d8bb29ebe7920
commit: 0512a9aede6e4417c4fa6e0042a7ca8bc7e06b86 [437/5323] af_unix: fix races in sk_peer_pid and sk_peer_cred accesses
config: riscv-randconfig-c033-20230302 (https://download.01.org/0day-ci/archive/20230303/202303031433.Q4SwKAFJ-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=0512a9aede6e4417c4fa6e0042a7ca8bc7e06b86
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 0512a9aede6e4417c4fa6e0042a7ca8bc7e06b86
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031433.Q4SwKAFJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/include/asm/irqflags.h: Assembler messages:
   arch/riscv/include/asm/irqflags.h:42: Error: unrecognized opcode `csrrc a5,sstatus,2'
   arch/riscv/include/asm/irqflags.h:60: Error: unrecognized opcode `csrs sstatus,a5'
   net/core/sock.c:673: Error: unrecognized opcode `csrs sstatus,a5'
   net/core/sock.c:673: Error: unrecognized opcode `csrc sstatus,a5'
   net/core/sock.c:1112: Error: unrecognized opcode `csrs sstatus,a5'
   net/core/sock.c:1112: Error: unrecognized opcode `csrc sstatus,a5'
   net/core/sock.c:1267: Error: unrecognized opcode `csrs sstatus,a4'
   net/core/sock.c:1267: Error: unrecognized opcode `csrc sstatus,a4'
   net/core/sock.c:1420: Error: unrecognized opcode `csrs sstatus,a4'
   net/core/sock.c:1420: Error: unrecognized opcode `csrc sstatus,a4'
>> net/core/sock.c:1090: Error: unrecognized opcode `csrs sstatus,s8'
>> net/core/sock.c:1090: Error: unrecognized opcode `csrc sstatus,s8'


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
https://github.com/intel/lkp-tests
