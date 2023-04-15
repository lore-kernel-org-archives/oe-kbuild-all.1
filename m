Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308237EA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 01:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681520707; x=1713056707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YadCIFp7qXS3fGf+iESblqvLzbqgHuBEFkoxK4yjqMQ=;
  b=jRGFNqlC+Vzjq2CQ83uStk0t9LZKNciHgakUmlD7S/ukUN06j1ueeTdp
   Bxt7m82bKbN5zSIdJpfIjgMC8dTSeO8zXdK9W9+mH1nqzWTqCjzfD0kHX
   7/kEtLq8QZTV1TsZK62LTQfJZY+s0ss4QlzsJDXCXeiE8378Uiwyf0y0M
   1ExvxJ6bViCC8tJx3igxV9Ah8q4krB7g+zfrUD+dTZGJ0QY9b2khZDvxL
   jw0B4XmTLmMig+8R2ZB1wVDbLQS54z/eWGMrz4kYg+0/7D7CPUDcnzzn7
   snAqk3ryLzq0X4XYy5q75wWB3hKkM9aC6zPPd7F+UBaqSSbyS+g2+oz30
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324225305"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="324225305"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 18:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="640287600"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="640287600"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Apr 2023 18:05:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnULd-000aD9-0c;
	Sat, 15 Apr 2023 01:05:01 +0000
Date: Sat, 15 Apr 2023 09:04:04 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
	Yafang Shao <laoar.shao@gmail.com>, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	ast@kernel.org, hawk@kernel.org, john.fastabend@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	bpf@vger.kernel.org, Jesper Dangaard Brouer <brouer@redhat.com>,
	Tonghao Zhang <xiangxia.m.yue@gmail.com>, martin.lau@linux.dev
Subject: Re: [PATCH bpf-next] bpf: Set skb redirect and from_ingress info in
 __bpf_tx_skb
Message-ID: <202304150811.bzx9niRq-lkp@intel.com>
References: <c68bf723-3406-d177-49b4-6d5b485048de@iogearbox.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c68bf723-3406-d177-49b4-6d5b485048de@iogearbox.net>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Borkmann/bpf-Set-skb-redirect-and-from_ingress-info-in-__bpf_tx_skb/20230415-065912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/c68bf723-3406-d177-49b4-6d5b485048de%40iogearbox.net
patch subject: [PATCH bpf-next] bpf: Set skb redirect and from_ingress info in __bpf_tx_skb
config: x86_64-randconfig-a014-20230410 (https://download.01.org/0day-ci/archive/20230415/202304150811.bzx9niRq-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/91c0d1d0b071c23d95bf9747b89daf5ae378ad1a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Borkmann/bpf-Set-skb-redirect-and-from_ingress-info-in-__bpf_tx_skb/20230415-065912
        git checkout 91c0d1d0b071c23d95bf9747b89daf5ae378ad1a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150811.bzx9niRq-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/filter.c: In function '__bpf_tx_skb':
>> net/core/filter.c:2125:44: error: 'struct sk_buff' has no member named 'tc_at_ingress'
    2125 |         skb_set_redirected_noclear(skb, skb->tc_at_ingress);
         |                                            ^~


vim +2125 net/core/filter.c

  2113	
  2114	static inline int __bpf_tx_skb(struct net_device *dev, struct sk_buff *skb)
  2115	{
  2116		int ret;
  2117	
  2118		if (dev_xmit_recursion()) {
  2119			net_crit_ratelimited("bpf: recursion limit reached on datapath, buggy bpf program?\n");
  2120			kfree_skb(skb);
  2121			return -ENETDOWN;
  2122		}
  2123	
  2124		skb->dev = dev;
> 2125		skb_set_redirected_noclear(skb, skb->tc_at_ingress);
  2126		skb_clear_tstamp(skb);
  2127	
  2128		dev_xmit_recursion_inc();
  2129		ret = dev_queue_xmit(skb);
  2130		dev_xmit_recursion_dec();
  2131	
  2132		return ret;
  2133	}
  2134	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
