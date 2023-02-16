Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051EF18F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 00:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676507004; x=1708043004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8ub891B3fPpkj3mueotLCmXkHLe4y9GlGIlZf1yrC38=;
  b=TdUclZD4puYZfU9tNTQsmrYTMvklSpq0WBHumuzpuSh2CxPPGVm6N1yc
   XVQ35TSnxZmwT5WU5eRWQDGRPjGu68Cd4x9wYQTKy7ZR/HIREp9ogrYo8
   R6ceeF4/1T5IrdHbcsMu0fUKW4giAXU0FLfFO6TCQIvmRNiXPqpWVtajV
   wZqZ3fpA6/aeafrSfHLLUaZmsPEplmFACOkSO9q5l/z1ajkQwc2+cOqX5
   56WjvdGEBvTfv1d+jreRpwb4V9P+INzEJJ3zySxoNgg+Gr2E1KZU115Cs
   359onpSO7C05b6j7bWHU7uoxU+DRp3DHvXSQd4MjbgVD1FQYcdXEyKoBf
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="332899457"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="332899457"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 16:23:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="779141899"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="779141899"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Feb 2023 16:23:11 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSS3K-0009tb-1H;
	Thu, 16 Feb 2023 00:23:10 +0000
Date: Thu, 16 Feb 2023 08:22:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Safonov <dima@arista.com>, linux-kernel@vger.kernel.org,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Dmitry Safonov <dima@arista.com>,
	Andy Lutomirski <luto@amacapital.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Bob Gilligan <gilligan@arista.com>,
	Dan Carpenter <error27@gmail.com>,
	David Laight <David.Laight@aculab.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Francesco Ruggeri <fruggeri05@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	Ivan Delalande <colona@arista.com>,
	Leonard Crestez <cdleonard@gmail.com>,
	Salam Noureddine <noureddine@arista.com>
Subject: Re: [PATCH v4 12/21] net/tcp: Verify inbound TCP-AO signed segments
Message-ID: <202302160834.wX7iq8Lo-lkp@intel.com>
References: <20230215183335.800122-13-dima@arista.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215183335.800122-13-dima@arista.com>

Hi Dmitry,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on e1c04510f521e853019afeca2a5991a5ef8d6a5b]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Safonov/net-tcp-Prepare-tcp_md5sig_pool-for-TCP-AO/20230216-023836
base:   e1c04510f521e853019afeca2a5991a5ef8d6a5b
patch link:    https://lore.kernel.org/r/20230215183335.800122-13-dima%40arista.com
patch subject: [PATCH v4 12/21] net/tcp: Verify inbound TCP-AO signed segments
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230216/202302160834.wX7iq8Lo-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9f88af338e9c573f154bba8ba7692b1756b0e216
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Safonov/net-tcp-Prepare-tcp_md5sig_pool-for-TCP-AO/20230216-023836
        git checkout 9f88af338e9c573f154bba8ba7692b1756b0e216
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302160834.wX7iq8Lo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/ipv4/tcp_ao.c:290:5: warning: no previous prototype for 'tcp_ao_calc_key_sk' [-Wmissing-prototypes]
     290 | int tcp_ao_calc_key_sk(struct tcp_ao_key *mkt, u8 *key,
         |     ^~~~~~~~~~~~~~~~~~
>> net/ipv4/tcp_ao.c:324:5: warning: no previous prototype for 'tcp_ao_calc_key_skb' [-Wmissing-prototypes]
     324 | int tcp_ao_calc_key_skb(struct tcp_ao_key *mkt, u8 *key,
         |     ^~~~~~~~~~~~~~~~~~~


vim +/tcp_ao_calc_key_skb +324 net/ipv4/tcp_ao.c

   289	
 > 290	int tcp_ao_calc_key_sk(struct tcp_ao_key *mkt, u8 *key,
   291			       const struct sock *sk,
   292			       __be32 sisn, __be32 disn,
   293			       bool send)
   294	{
   295		if (mkt->family == AF_INET)
   296			return tcp_v4_ao_calc_key_sk(mkt, key, sk, sisn, disn, send);
   297		else
   298			return tcp_v6_ao_calc_key_sk(mkt, key, sk, sisn, disn, send);
   299	}
   300	
   301	int tcp_v4_ao_calc_key_rsk(struct tcp_ao_key *mkt, u8 *key,
   302				   struct request_sock *req)
   303	{
   304		struct inet_request_sock *ireq = inet_rsk(req);
   305	
   306		return tcp_v4_ao_calc_key(mkt, key,
   307					  ireq->ir_loc_addr, ireq->ir_rmt_addr,
   308					  htons(ireq->ir_num), ireq->ir_rmt_port,
   309					  htonl(tcp_rsk(req)->snt_isn),
   310					  htonl(tcp_rsk(req)->rcv_isn));
   311	}
   312	
   313	int tcp_v4_ao_calc_key_skb(struct tcp_ao_key *mkt, u8 *key,
   314				   const struct sk_buff *skb, __be32 sisn,
   315				   __be32 disn)
   316	{
   317		const struct iphdr *iph = ip_hdr(skb);
   318		const struct tcphdr *th = tcp_hdr(skb);
   319	
   320		return tcp_v4_ao_calc_key(mkt, key, iph->saddr, iph->daddr,
   321					     th->source, th->dest, sisn, disn);
   322	}
   323	
 > 324	int tcp_ao_calc_key_skb(struct tcp_ao_key *mkt, u8 *key,
   325				const struct sk_buff *skb, __be32 sisn,
   326				__be32 disn, int family)
   327	{
   328		if (family == AF_INET)
   329			return tcp_v4_ao_calc_key_skb(mkt, key, skb, sisn, disn);
   330		else
   331			return tcp_v6_ao_calc_key_skb(mkt, key, skb, sisn, disn);
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
