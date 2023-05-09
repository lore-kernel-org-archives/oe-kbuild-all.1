Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF4A3C3B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 07:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683617961; x=1715153961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CR90iAVZpC9oJSnSC3d1toZqzaTVghY1ahTtuoBk5f4=;
  b=lBusJFzPvvoj0Rf3FKGujjbTYNFqktnhxkJuSi74MyEo6Xh/tIVibYZg
   MVmcRFTWZTad/OOMlAWCka1xuA5W971OL6TQcWimC145fH19LdYTeqRfs
   w8c+5oK8lW/gBxgysJuGdbhFZz1eccljspH356sDOEBfNs/N1XQLZ8U/g
   atpvfuMEd01sRXLvEaDIQ26oO6EIxOiZVAzxcES8HI7q+MDdkiT55sNsK
   muWodSoEju5ZtKZdJLVwfGShEKprwi88plWqn9qzwazX09KZxbGy0PYzy
   p/uqewvsvHTEL0ME4TSiThN+S/dBUjMQjy/oGGgA3SzeRMgBT0aRSjtEB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="348659843"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="348659843"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 00:39:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="788408478"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="788408478"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 May 2023 00:39:17 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwHwK-0001vs-2M;
	Tue, 09 May 2023 07:39:16 +0000
Date: Tue, 9 May 2023 15:38:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kuniyuki Iwashima <kuniyu@amazon.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	syzbot <syzkaller@googlegroups.com>
Subject: Re: [PATCH v2 net] net: Fix sk->sk_stamp race in sock_recv_cmsgs().
Message-ID: <202305091558.VRASfSNN-lkp@intel.com>
References: <20230508165815.45602-1-kuniyu@amazon.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508165815.45602-1-kuniyu@amazon.com>

Hi Kuniyuki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/net-Fix-sk-sk_stamp-race-in-sock_recv_cmsgs/20230509-005901
base:   net/main
patch link:    https://lore.kernel.org/r/20230508165815.45602-1-kuniyu%40amazon.com
patch subject: [PATCH v2 net] net: Fix sk->sk_stamp race in sock_recv_cmsgs().
config: alpha-randconfig-s033-20230507 (https://download.01.org/0day-ci/archive/20230509/202305091558.VRASfSNN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/7755d082501de4c89033aed3be404114fcba1c44
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kuniyuki-Iwashima/net-Fix-sk-sk_stamp-race-in-sock_recv_cmsgs/20230509-005901
        git checkout 7755d082501de4c89033aed3be404114fcba1c44
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash net/key/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091558.VRASfSNN-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/key/af_key.c: note: in included file (through arch/alpha/include/asm/cmpxchg.h, arch/alpha/include/asm/atomic.h, include/linux/atomic.h, ...):
>> arch/alpha/include/asm/xchg.h:234:32: sparse: sparse: cast truncates bits from constant value (ffffffffc4653600 becomes 0)
   arch/alpha/include/asm/xchg.h:236:32: sparse: sparse: cast truncates bits from constant value (ffffffffc4653600 becomes 3600)

vim +234 arch/alpha/include/asm/xchg.h

a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  227  
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  228  static __always_inline unsigned long
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  229  ____cmpxchg(, volatile void *ptr, unsigned long old, unsigned long new,
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  230  	      int size)
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  231  {
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  232  	switch (size) {
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  233  		case 1:
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31 @234  			return ____cmpxchg(_u8, ptr, old, new);
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  235  		case 2:
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  236  			return ____cmpxchg(_u16, ptr, old, new);
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  237  		case 4:
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  238  			return ____cmpxchg(_u32, ptr, old, new);
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  239  		case 8:
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  240  			return ____cmpxchg(_u64, ptr, old, new);
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  241  	}
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  242  	__cmpxchg_called_with_bad_pointer();
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  243  	return old;
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  244  }
a6209d6d71f2ab Ivan Kokshaysky 2009-03-31  245  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
