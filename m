Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3141E1AC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 14:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691676150; x=1723212150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uG40sUKIZnt2R0Ju/ht3SWKA7islUW0SNsV68XD4/zU=;
  b=LtudCVMBiLQui4jIBztjHTjh8buD55uiTPbxxONdDS8YNbyWzeCEGmme
   zRTgqdAwzqe8wk1qUZjbk4dDDdT42n2FaW3SE7Cxedk0jKzxg46ZMmyRE
   DQnLv1UhSXxMIbIbvTV6201OjzNKc6Mp87ZIxn/XgHsCXJNTy005Xr25v
   K7OTU3mIj4otietlTArACdCFiWJPxUtA1nJC2CgW948/O4BQAAy7REUWV
   nnJq/NgnCwOfo7wRRfEy2E+I5nEZN/gurT9wgMyjznXepAPVXOMhNS3ds
   SyJU4Au2lx8QSEOidywAqKbJANpOvW9jM3EpMCoO3xSeHypcLra0tY+iz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="402382181"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="402382181"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 06:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="725818265"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
   d="scan'208";a="725818265"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Aug 2023 06:46:11 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qU5zO-00072P-2P;
	Thu, 10 Aug 2023 13:46:10 +0000
Date: Thu, 10 Aug 2023 21:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Simon Horman <simon.horman@corigine.com>,
	Soheil Hassas Yeganeh <soheil@google.com>, netdev@vger.kernel.org,
	eric.dumazet@gmail.com, Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH net-next 09/15] inet: move inet->transparent to
 inet->inet_flags
Message-ID: <202308102127.hRNurJL6-lkp@intel.com>
References: <20230810103927.1705940-10-edumazet@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810103927.1705940-10-edumazet@google.com>

Hi Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/inet-introduce-inet-inet_flags/20230810-184815
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230810103927.1705940-10-edumazet%40google.com
patch subject: [PATCH net-next 09/15] inet: move inet->transparent to inet->inet_flags
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230810/202308102127.hRNurJL6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308102127.hRNurJL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308102127.hRNurJL6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/mptcp/sockopt.c: In function 'mptcp_setsockopt_sol_ip_set_transparent':
>> net/mptcp/sockopt.c:689:27: warning: variable 'issk' set but not used [-Wunused-but-set-variable]
     689 |         struct inet_sock *issk;
         |                           ^~~~


vim +/issk +689 net/mptcp/sockopt.c

4f6e14bd19d6de Maxim Galaganov  2021-12-03  684  
c9406a23c1161c Florian Westphal 2021-11-19  685  static int mptcp_setsockopt_sol_ip_set_transparent(struct mptcp_sock *msk, int optname,
c9406a23c1161c Florian Westphal 2021-11-19  686  						   sockptr_t optval, unsigned int optlen)
c9406a23c1161c Florian Westphal 2021-11-19  687  {
c9406a23c1161c Florian Westphal 2021-11-19  688  	struct sock *sk = (struct sock *)msk;
c9406a23c1161c Florian Westphal 2021-11-19 @689  	struct inet_sock *issk;
c9406a23c1161c Florian Westphal 2021-11-19  690  	struct socket *ssock;
c9406a23c1161c Florian Westphal 2021-11-19  691  	int err;
c9406a23c1161c Florian Westphal 2021-11-19  692  
c9406a23c1161c Florian Westphal 2021-11-19  693  	err = ip_setsockopt(sk, SOL_IP, optname, optval, optlen);
c9406a23c1161c Florian Westphal 2021-11-19  694  	if (err != 0)
c9406a23c1161c Florian Westphal 2021-11-19  695  		return err;
c9406a23c1161c Florian Westphal 2021-11-19  696  
c9406a23c1161c Florian Westphal 2021-11-19  697  	lock_sock(sk);
c9406a23c1161c Florian Westphal 2021-11-19  698  
c9406a23c1161c Florian Westphal 2021-11-19  699  	ssock = __mptcp_nmpc_socket(msk);
ddb1a072f85870 Paolo Abeni      2023-04-14  700  	if (IS_ERR(ssock)) {
c9406a23c1161c Florian Westphal 2021-11-19  701  		release_sock(sk);
ddb1a072f85870 Paolo Abeni      2023-04-14  702  		return PTR_ERR(ssock);
c9406a23c1161c Florian Westphal 2021-11-19  703  	}
c9406a23c1161c Florian Westphal 2021-11-19  704  
c9406a23c1161c Florian Westphal 2021-11-19  705  	issk = inet_sk(ssock->sk);
c9406a23c1161c Florian Westphal 2021-11-19  706  
c9406a23c1161c Florian Westphal 2021-11-19  707  	switch (optname) {
c9406a23c1161c Florian Westphal 2021-11-19  708  	case IP_FREEBIND:
53912fdfbaf575 Eric Dumazet     2023-08-10  709  		inet_assign_bit(FREEBIND, ssock->sk,
53912fdfbaf575 Eric Dumazet     2023-08-10  710  				inet_test_bit(FREEBIND, sk));
c9406a23c1161c Florian Westphal 2021-11-19  711  		break;
c9406a23c1161c Florian Westphal 2021-11-19  712  	case IP_TRANSPARENT:
ec4704602ed1ff Eric Dumazet     2023-08-10  713  		inet_assign_bit(TRANSPARENT, ssock->sk,
ec4704602ed1ff Eric Dumazet     2023-08-10  714  				inet_test_bit(TRANSPARENT, sk));
c9406a23c1161c Florian Westphal 2021-11-19  715  		break;
c9406a23c1161c Florian Westphal 2021-11-19  716  	default:
c9406a23c1161c Florian Westphal 2021-11-19  717  		release_sock(sk);
c9406a23c1161c Florian Westphal 2021-11-19  718  		WARN_ON_ONCE(1);
c9406a23c1161c Florian Westphal 2021-11-19  719  		return -EOPNOTSUPP;
c9406a23c1161c Florian Westphal 2021-11-19  720  	}
c9406a23c1161c Florian Westphal 2021-11-19  721  
c9406a23c1161c Florian Westphal 2021-11-19  722  	sockopt_seq_inc(msk);
c9406a23c1161c Florian Westphal 2021-11-19  723  	release_sock(sk);
c9406a23c1161c Florian Westphal 2021-11-19  724  	return 0;
c9406a23c1161c Florian Westphal 2021-11-19  725  }
c9406a23c1161c Florian Westphal 2021-11-19  726  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
