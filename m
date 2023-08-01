Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DC91E503
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 14:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690900083; x=1722436083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Zk7yaqDkbCYbH2qUXxx+3672mFEjWUxbYAYAkl6m5g=;
  b=i7xx0eQwRL5xFCGQ2E09A/XD5ELuMXKDZNS4LJVgJPOTi4iWw1/Sjycl
   T7JC0zw7U9EL0BJEnzEnWWzerJbINRxPXwHVxjq1+wQa4Zny9Ehspsd/E
   N7XGQXHqeRZZLmdPtFfwLZ/a48IlLmQaA8ofMbQkwWAPNJ+P7ZUE0FcG9
   0hkPwer7er0L1gk+LS4wjFBaEHifOLHLBd9oMq98zKEQwPUSKdwM7msHu
   UIP1aRom8dh00Xz/3B8HkX5Ns5zT/vxpf413hqWGWENk8C229SuA2o9pm
   Os5Y5pwNYb4yP7oN0dtDOyBFNCs41i+psXmMsL+QhNA2tp5S7gZ6/2QWc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="368206608"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="368206608"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 07:28:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="732007337"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="732007337"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Aug 2023 07:28:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQqLv-0000M7-1J;
	Tue, 01 Aug 2023 14:27:59 +0000
Date: Tue, 1 Aug 2023 22:27:27 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 437/6360] net/core/sock.c:1090: Error:
 unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
Message-ID: <202308012242.812YWFDD-lkp@intel.com>
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
head:   767049cead76cf699707290d5aeefb3e4d0d5b43
commit: 0512a9aede6e4417c4fa6e0042a7ca8bc7e06b86 [437/6360] af_unix: fix races in sk_peer_pid and sk_peer_cred accesses
config: riscv-randconfig-r036-20230801 (https://download.01.org/0day-ci/archive/20230801/202308012242.812YWFDD-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308012242.812YWFDD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308012242.812YWFDD-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/sock.c: Assembler messages:
   net/core/sock.c:1112: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/core/sock.c:1112: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   net/core/sock.c:1420: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/core/sock.c:1420: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
   net/core/sock.c:1267: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/core/sock.c:1267: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required
>> net/core/sock.c:1090: Error: unrecognized opcode `csrs sstatus,s3', extension `zicsr' required
>> net/core/sock.c:1090: Error: unrecognized opcode `csrc sstatus,s3', extension `zicsr' required
   net/core/sock.c:673: Error: unrecognized opcode `csrs sstatus,a4', extension `zicsr' required
   net/core/sock.c:673: Error: unrecognized opcode `csrc sstatus,a4', extension `zicsr' required


vim +1090 net/core/sock.c

3f551f9436c05a3 Eric W. Biederman 2010-06-13  1083  
28b5ba2aa0f55d8 David Herrmann    2017-06-21  1084  static int groups_to_user(gid_t __user *dst, const struct group_info *src)
28b5ba2aa0f55d8 David Herrmann    2017-06-21  1085  {
28b5ba2aa0f55d8 David Herrmann    2017-06-21  1086  	struct user_namespace *user_ns = current_user_ns();
28b5ba2aa0f55d8 David Herrmann    2017-06-21  1087  	int i;
28b5ba2aa0f55d8 David Herrmann    2017-06-21  1088  
28b5ba2aa0f55d8 David Herrmann    2017-06-21  1089  	for (i = 0; i < src->ngroups; i++)
28b5ba2aa0f55d8 David Herrmann    2017-06-21 @1090  		if (put_user(from_kgid_munged(user_ns, src->gid[i]), dst + i))
28b5ba2aa0f55d8 David Herrmann    2017-06-21  1091  			return -EFAULT;
28b5ba2aa0f55d8 David Herrmann    2017-06-21  1092  
28b5ba2aa0f55d8 David Herrmann    2017-06-21  1093  	return 0;
28b5ba2aa0f55d8 David Herrmann    2017-06-21  1094  }
28b5ba2aa0f55d8 David Herrmann    2017-06-21  1095  

:::::: The code at line 1090 was first introduced by commit
:::::: 28b5ba2aa0f55d80adb2624564ed2b170c19519e net: introduce SO_PEERGROUPS getsockopt

:::::: TO: David Herrmann <dh.herrmann@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
