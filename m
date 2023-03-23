Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B90C959
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 19:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679600744; x=1711136744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yhrVm6GoiyPpS/QaneOwuepkFIvwN6Q5XczmF5i/P+U=;
  b=GlGFkNHh3ad5TQelQEWEFelKpeEOs+/Ar/WFUejll1NC0p5lV7Q6zVps
   VMocrJosIROdd+iZ9X9YIBF/1lHjPJjnJqteYvHWbCHVZhqyiLCraiHKP
   Dn8IuecguHIk58Mq60gF6/NIvPSIK1bAuzom6w/x5IQiKX1fLzFSfZTUC
   0KN8sw0nJZN7AilL/YZ2hu4tKZbq/Ot1u+MONwSKCRByCGoLKjnD31OwX
   vbS3tl4G2BhmJ/TkSxup/V8ie8psBEP55Fv4v/1Pmew9Ad+cRWBDVKLuT
   5VawHVaw57ULIzWTzZBKKMJadUC5+iG3iPatcEQdvJVWFoQ+TQ8NOXiJz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="319993186"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="319993186"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 12:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="675843676"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="675843676"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 23 Mar 2023 12:45:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfQsW-000EfA-26;
	Thu, 23 Mar 2023 19:45:40 +0000
Date: Fri, 24 Mar 2023 03:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: alikernel-developer@linux.alibaba.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alibaba-cloud:linux-next 9819/9999] net/core/filter.c:4800:14:
 warning: no previous prototype for 'sk_lookup'
Message-ID: <202303240347.yGFXFDqC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alibaba/cloud-kernel.git linux-next
head:   d121e0c25d1a19485d7f293b67901462bb1a6552
commit: 8cc7799d3bd7cda0be67acf35acbfbebf7b48f20 [9819/9999] bpf: Add helper to retrieve socket in BPF
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230324/202303240347.yGFXFDqC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/alibaba/cloud-kernel/commit/8cc7799d3bd7cda0be67acf35acbfbebf7b48f20
        git remote add alibaba-cloud https://github.com/alibaba/cloud-kernel.git
        git fetch --no-tags alibaba-cloud linux-next
        git checkout 8cc7799d3bd7cda0be67acf35acbfbebf7b48f20
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/virtio_net.ko drivers/target/ net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240347.yGFXFDqC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/filter.c:4800:14: warning: no previous prototype for 'sk_lookup' [-Wmissing-prototypes]
    4800 | struct sock *sk_lookup(struct net *net, struct bpf_sock_tuple *tuple,
         |              ^~~~~~~~~
   net/core/filter.c: In function 'bpf_base_func_proto':
   net/core/filter.c:4987:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    4987 |                 if (capable(CAP_SYS_ADMIN))
         |                    ^
   net/core/filter.c:4990:9: note: here
    4990 |         default:
         |         ^~~~~~~


vim +/sk_lookup +4800 net/core/filter.c

  4799	
> 4800	struct sock *sk_lookup(struct net *net, struct bpf_sock_tuple *tuple,
  4801			       struct sk_buff *skb, u8 family, u8 proto)
  4802	{
  4803		int dif = skb->dev->ifindex;
  4804		bool refcounted = false;
  4805		struct sock *sk = NULL;
  4806	
  4807		if (family == AF_INET) {
  4808			__be32 src4 = tuple->ipv4.saddr;
  4809			__be32 dst4 = tuple->ipv4.daddr;
  4810			int sdif = inet_sdif(skb);
  4811	
  4812			if (proto == IPPROTO_TCP)
  4813				sk = __inet_lookup(net, &tcp_hashinfo, skb, 0,
  4814						   src4, tuple->ipv4.sport,
  4815						   dst4, tuple->ipv4.dport,
  4816						   dif, sdif, &refcounted);
  4817			else
  4818				sk = __udp4_lib_lookup(net, src4, tuple->ipv4.sport,
  4819						       dst4, tuple->ipv4.dport,
  4820						       dif, sdif, &udp_table, skb);
  4821	#if IS_ENABLED(CONFIG_IPV6)
  4822		} else {
  4823			struct in6_addr *src6 = (struct in6_addr *)&tuple->ipv6.saddr;
  4824			struct in6_addr *dst6 = (struct in6_addr *)&tuple->ipv6.daddr;
  4825			int sdif = inet6_sdif(skb);
  4826	
  4827			if (proto == IPPROTO_TCP)
  4828				sk = __inet6_lookup(net, &tcp_hashinfo, skb, 0,
  4829						    src6, tuple->ipv6.sport,
  4830						    dst6, tuple->ipv6.dport,
  4831						    dif, sdif, &refcounted);
  4832			else
  4833				sk = __udp6_lib_lookup(net, src6, tuple->ipv6.sport,
  4834						       dst6, tuple->ipv6.dport,
  4835						       dif, sdif, &udp_table, skb);
  4836	#endif
  4837		}
  4838	
  4839		if (unlikely(sk && !refcounted && !sock_flag(sk, SOCK_RCU_FREE))) {
  4840			WARN_ONCE(1, "Found non-RCU, unreferenced socket!");
  4841			sk = NULL;
  4842		}
  4843		return sk;
  4844	}
  4845	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
