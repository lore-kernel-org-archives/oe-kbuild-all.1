Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630541870
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 20:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680813377; x=1712349377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1fhUFRusvE2JOBN+IggeP5NajK4UryW6Af4xk5kTSKI=;
  b=j/YhiC5+nFoS4W0gRfPJghjw0+1gGQVgyhLfR8PG7/KvbYKCWjL5tRud
   8fpHAkipUsulG6xAwQOeY3jLEcYjB45a5DwirfEJMzzLpk1Pj3B571oV2
   mOHl5MR69X8CYefl/qHLUXX0yRaYGFuHX9voXzM7U4Cas7Oofmj7rjD8w
   VoHOYcqEG9s9i8OGj2I/FfpqjVErDCK6s/QSpIWZ7sYBcavf2lt84oa9j
   OsKbA5IqNPPWgumKf2OF90S6z8bfx6tMQaMup8+ZLQ3QGpM+EHCj7n87P
   Xo+P/4GpppoY+PEG2QkQ3Ll68vCDqX222y9GVYi/w0CaMG+8qZiRWlu/i
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="326907144"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="326907144"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 13:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="664630703"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="664630703"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Apr 2023 13:36:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkWL4-000RkO-1D;
	Thu, 06 Apr 2023 20:36:10 +0000
Date: Fri, 7 Apr 2023 04:35:39 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/4] net: add uring_cmd callback to TCP
Message-ID: <202304070428.kAgcjF1Z-lkp@intel.com>
References: <20230406144330.1932798-4-leitao@debian.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406144330.1932798-4-leitao@debian.org>

Hi Breno,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on net-next/main horms-ipvs/master linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/net-add-uring_cmd-callback-to-UDP/20230406-234400
patch link:    https://lore.kernel.org/r/20230406144330.1932798-4-leitao%40debian.org
patch subject: [RFC PATCH 3/4] net: add uring_cmd callback to TCP
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230407/202304070428.kAgcjF1Z-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/01b93921bef2f71c4dd39e76f68f6227279c6c81
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Breno-Leitao/net-add-uring_cmd-callback-to-UDP/20230406-234400
        git checkout 01b93921bef2f71c4dd39e76f68f6227279c6c81
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070428.kAgcjF1Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/tcp.c: In function 'tcp_uring_cmd':
>> net/ipv4/tcp.c:607:20: error: 'struct io_uring_cmd' has no member named 'sqe'
     607 |         switch (cmd->sqe->cmd_op) {
         |                    ^~
   net/ipv4/tcp.c:628:1: error: control reaches end of non-void function [-Werror=return-type]
     628 | }
         | ^
   cc1: some warnings being treated as errors


vim +607 net/ipv4/tcp.c

   599	
   600	int tcp_uring_cmd(struct sock *sk, struct io_uring_cmd *cmd,
   601			  unsigned int issue_flags)
   602	{
   603		struct tcp_sock *tp = tcp_sk(sk);
   604		bool slow;
   605		int ret;
   606	
 > 607		switch (cmd->sqe->cmd_op) {
   608		case SOCKET_URING_OP_SIOCINQ:
   609			if (sk->sk_state == TCP_LISTEN)
   610				return -EINVAL;
   611	
   612			slow = lock_sock_fast(sk);
   613			ret = tcp_inq(sk);
   614			unlock_sock_fast(sk, slow);
   615			return ret;
   616		case SOCKET_URING_OP_SIOCOUTQ:
   617			if (sk->sk_state == TCP_LISTEN)
   618				return -EINVAL;
   619	
   620			if ((1 << sk->sk_state) & (TCPF_SYN_SENT | TCPF_SYN_RECV))
   621				ret = 0;
   622			else
   623				ret = READ_ONCE(tp->write_seq) - tp->snd_una;
   624			return ret;
   625		default:
   626			return -ENOIOCTLCMD;
   627		}
   628	}
   629	EXPORT_SYMBOL_GPL(tcp_uring_cmd);
   630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
