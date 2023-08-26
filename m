Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4D47E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 11:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693050146; x=1724586146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XUAeqax/qGn7TpKyLsWvuVD1WwBHo+srR/FW1OYujdk=;
  b=ck1pQw6MUwgFppZrdSfOhlL8HIFAPxHTeFLkxvDWTEKdvEDfjadFReCj
   5FNBm94PB3J3l67gaKtPGiTsOta5AZra6s9iWAJ36h4sKzFJfQr5ex1+p
   //RXUCs4pnLTHhRsG/wd4j55ekZd1+XmasykxCHXfzWODBQuz7JS0Sf7E
   dzy+CInWhs9xPs5WvOtfOW4D+ZRJ3ZF2hmQZkbZOaFGGKUiy+oA8kC4vr
   qYqiImuBeMLmf10P13NKPX3OAnr8FjxDuTmeg9Q100nbAhHu+RkO1PTbo
   eOscn0tqjnCNqzjiuTlr/Gd+JDkpXkQumvGVm/OT3vrNXDqQxeonel1y5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="438811500"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="438811500"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 04:42:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="1068522938"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="1068522938"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2023 04:42:23 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZrgN-0004eV-0J;
	Sat, 26 Aug 2023 11:42:23 +0000
Date: Sat, 26 Aug 2023 19:41:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/missed_stats_3 1/7] include/linux/bpf.h:2650:13:
 warning: 'bpf_prog_update_prog_stats' defined but not used
Message-ID: <202308261911.5aPLQXKe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/missed_stats_3
head:   903afc5b7a9fa7c9bff7f7dc86d955b637fb1fd9
commit: 04fef13e9772949ac2d598ed21fd26c6e43746ac [1/7] bpf: Move update_prog_stats to syscall object
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230826/202308261911.5aPLQXKe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261911.5aPLQXKe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261911.5aPLQXKe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/filter.h:9,
                    from include/net/sock_reuseport.h:5,
                    from include/net/tcp.h:35,
                    from include/linux/netfilter_ipv6.h:11,
                    from include/uapi/linux/netfilter_ipv6/ip6_tables.h:22,
                    from include/linux/netfilter_ipv6/ip6_tables.h:23,
                    from net/ipv6/netfilter/ip6_tables.c:29:
>> include/linux/bpf.h:2650:13: warning: 'bpf_prog_update_prog_stats' defined but not used [-Wunused-function]
    2650 | static void bpf_prog_update_prog_stats(struct bpf_prog *prog,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   net/ipv6/netfilter/nf_reject_ipv6.c: In function 'nf_send_reset6':
   net/ipv6/netfilter/nf_reject_ipv6.c:287:25: warning: variable 'ip6h' set but not used [-Wunused-but-set-variable]
     287 |         struct ipv6hdr *ip6h;
         |                         ^~~~
   In file included from include/linux/filter.h:9,
                    from include/net/sock_reuseport.h:5,
                    from include/net/tcp.h:35,
                    from include/linux/netfilter_ipv6.h:11,
                    from net/ipv6/netfilter/nf_reject_ipv6.c:12:
   include/linux/bpf.h: At top level:
>> include/linux/bpf.h:2650:13: warning: 'bpf_prog_update_prog_stats' defined but not used [-Wunused-function]
    2650 | static void bpf_prog_update_prog_stats(struct bpf_prog *prog,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_prog_update_prog_stats +2650 include/linux/bpf.h

  2649	
> 2650	static void bpf_prog_update_prog_stats(struct bpf_prog *prog,
  2651					       u64 start)
  2652	{
  2653	}
  2654	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
