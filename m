Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C971CA1C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 18:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691605786; x=1723141786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cVqkGQA98A4/QPXlniEUFu4wW8425AsVlV0n2UAGULk=;
  b=A35saAV9+K+OXBYNicrP3KMBW+diZBzLeoBJGh71w9Lee9G9h6tnaHzU
   K2lUCC82YcDoJcv6knBoslnJniuD761K6ZyrIQiXW4DzP1fDuexjEF6VG
   qoRv2tWaku7L2xJRi/PngpNucsF1UJvkuuGRA0j6j03IAjV4yXEnEUbr4
   I9kJIJquGYXgGmkWebWV+vlhKIkZ2V85osLj54wRU+BCT6jsh8rqjHrv1
   D8afo+ZcqTnMGJxV2tNX0eknZJykAaBpdN1LaEZhEL+9QKgkWOgob6YN3
   3HJ6xQ/GdQ+52kKexpvLB3Jk6Qz7clWi/MtLqwjZbNZbD+2sM3jhgLu9c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370099543"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="370099543"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 11:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="846078970"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="846078970"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2023 11:29:42 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTnwD-0006Jw-08;
	Wed, 09 Aug 2023 18:29:41 +0000
Date: Thu, 10 Aug 2023 02:28:59 +0800
From: kernel test robot <lkp@intel.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 1/5] riscv/cmpxchg: Deduplicate xchg() asm
 functions
Message-ID: <202308100236.JVxfLj5j-lkp@intel.com>
References: <20230809021311.1390578-3-leobras@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809021311.1390578-3-leobras@redhat.com>

Hi Leonardo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leonardo-Bras/riscv-cmpxchg-Deduplicate-xchg-asm-functions/20230809-101624
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230809021311.1390578-3-leobras%40redhat.com
patch subject: [RFC PATCH v4 1/5] riscv/cmpxchg: Deduplicate xchg() asm functions
config: riscv-randconfig-r072-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100236.JVxfLj5j-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100236.JVxfLj5j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100236.JVxfLj5j-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> net/ipv4/tcp_cong.c:300:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct tcp_congestion_ops const [noderef] __rcu *__new @@     got struct tcp_congestion_ops *[assigned] ca @@
   net/ipv4/tcp_cong.c:300:24: sparse:     expected struct tcp_congestion_ops const [noderef] __rcu *__new
   net/ipv4/tcp_cong.c:300:24: sparse:     got struct tcp_congestion_ops *[assigned] ca
   net/ipv4/tcp_cong.c:300:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tcp_congestion_ops const *prev @@     got struct tcp_congestion_ops const [noderef] __rcu *[assigned] __ret @@
   net/ipv4/tcp_cong.c:300:22: sparse:     expected struct tcp_congestion_ops const *prev
   net/ipv4/tcp_cong.c:300:22: sparse:     got struct tcp_congestion_ops const [noderef] __rcu *[assigned] __ret

vim +300 net/ipv4/tcp_cong.c

317a76f9a44b43 Stephen Hemminger 2005-06-23  281  
317a76f9a44b43 Stephen Hemminger 2005-06-23  282  /* Used by sysctl to change default congestion control */
6670e152447732 Stephen Hemminger 2017-11-14  283  int tcp_set_default_congestion_control(struct net *net, const char *name)
317a76f9a44b43 Stephen Hemminger 2005-06-23  284  {
317a76f9a44b43 Stephen Hemminger 2005-06-23  285  	struct tcp_congestion_ops *ca;
6670e152447732 Stephen Hemminger 2017-11-14  286  	const struct tcp_congestion_ops *prev;
6670e152447732 Stephen Hemminger 2017-11-14  287  	int ret;
317a76f9a44b43 Stephen Hemminger 2005-06-23  288  
6670e152447732 Stephen Hemminger 2017-11-14  289  	rcu_read_lock();
6670e152447732 Stephen Hemminger 2017-11-14  290  	ca = tcp_ca_find_autoload(net, name);
6670e152447732 Stephen Hemminger 2017-11-14  291  	if (!ca) {
6670e152447732 Stephen Hemminger 2017-11-14  292  		ret = -ENOENT;
0baf26b0fcd74b Martin KaFai Lau  2020-01-08  293  	} else if (!bpf_try_module_get(ca, ca->owner)) {
6670e152447732 Stephen Hemminger 2017-11-14  294  		ret = -EBUSY;
8d432592f30fcc Jonathon Reinhart 2021-05-01  295  	} else if (!net_eq(net, &init_net) &&
8d432592f30fcc Jonathon Reinhart 2021-05-01  296  			!(ca->flags & TCP_CONG_NON_RESTRICTED)) {
8d432592f30fcc Jonathon Reinhart 2021-05-01  297  		/* Only init netns can set default to a restricted algorithm */
8d432592f30fcc Jonathon Reinhart 2021-05-01  298  		ret = -EPERM;
6670e152447732 Stephen Hemminger 2017-11-14  299  	} else {
6670e152447732 Stephen Hemminger 2017-11-14 @300  		prev = xchg(&net->ipv4.tcp_congestion_control, ca);
6670e152447732 Stephen Hemminger 2017-11-14  301  		if (prev)
0baf26b0fcd74b Martin KaFai Lau  2020-01-08  302  			bpf_module_put(prev, prev->owner);
317a76f9a44b43 Stephen Hemminger 2005-06-23  303  
6670e152447732 Stephen Hemminger 2017-11-14  304  		ca->flags |= TCP_CONG_NON_RESTRICTED;
317a76f9a44b43 Stephen Hemminger 2005-06-23  305  		ret = 0;
317a76f9a44b43 Stephen Hemminger 2005-06-23  306  	}
6670e152447732 Stephen Hemminger 2017-11-14  307  	rcu_read_unlock();
317a76f9a44b43 Stephen Hemminger 2005-06-23  308  
317a76f9a44b43 Stephen Hemminger 2005-06-23  309  	return ret;
317a76f9a44b43 Stephen Hemminger 2005-06-23  310  }
317a76f9a44b43 Stephen Hemminger 2005-06-23  311  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
