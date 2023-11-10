Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE1E219FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 17:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hcSTU1ly"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699637512; x=1731173512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i/L2ms5YrBXC1hZm7bHadQxyo6pkz27RkYKosyie5yo=;
  b=hcSTU1lyPZi2tqvDs3Onaey73jxd5sv4RM6Js4R4xqs5ws2EuJRdjVuj
   HZMcNMIIHs9Ckf17O+RZsyxZArrLwntQYnhwaoWv/6MMMgAsDv5dY9w+S
   xLkf+lbwz43e0Y6+v+1dkn6Dc+92Sp6KxgvZ582tr0X4fW9PrNaP7/eBJ
   tqX65nU9RNJg3f4rKMCd6AKZgfvIF7gRSlBEmjmbqu5K94xAdQ/0QQd/L
   0IbhFJ0k7nOvFhv9pc5tL5YvrIk4UAVQTZS7hJv4SO0HiFegpGdb5ZJaK
   ACGKo5tjFukXE0pchwRWhdQwHbEPsmk+NWE90L7KWeaiQHt0QOwNV1TFk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="369545052"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="369545052"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 09:31:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="854441955"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="854441955"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Nov 2023 09:31:50 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1VMC-0009mI-0x;
	Fri, 10 Nov 2023 17:31:48 +0000
Date: Sat, 11 Nov 2023 01:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Hopps <chopps@chopps.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC ipsec-next 8/8] iptfs: impl: add new iptfs xfrm mode impl
Message-ID: <202311110139.kmpx4546-lkp@intel.com>
References: <20231110113719.3055788-9-chopps@chopps.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110113719.3055788-9-chopps@chopps.org>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on klassert-ipsec-next/master]
[also build test WARNING on klassert-ipsec/master netfilter-nf/main linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Hopps/iptfs-uapi-ip-add-ip_tfs_-_hdr-packet-formats/20231110-203822
base:   https://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec-next.git master
patch link:    https://lore.kernel.org/r/20231110113719.3055788-9-chopps%40chopps.org
patch subject: [RFC ipsec-next 8/8] iptfs: impl: add new iptfs xfrm mode impl
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231111/202311110139.kmpx4546-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110139.kmpx4546-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110139.kmpx4546-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/xfrm/xfrm_iptfs.c:468:17: warning: no previous prototype for 'iptfs_pskb_add_frags' [-Wmissing-prototypes]
     468 | struct sk_buff *iptfs_pskb_add_frags(struct sk_buff *tpl,
         |                 ^~~~~~~~~~~~~~~~~~~~
   net/xfrm/xfrm_iptfs.c: In function '__iptfs_reassem_done':
   net/xfrm/xfrm_iptfs.c:629:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     629 |         int ret;
         |             ^~~
   net/xfrm/xfrm_iptfs.c: In function '__reorder_drop':
   net/xfrm/xfrm_iptfs.c:1262:13: warning: variable 'wantseq' set but not used [-Wunused-but-set-variable]
    1262 |         u64 wantseq = xtfs->w_wantseq;
         |             ^~~~~~~
   net/xfrm/xfrm_iptfs.c: In function '__reorder_this':
   net/xfrm/xfrm_iptfs.c:1311:13: warning: variable 'wantseq' set but not used [-Wunused-but-set-variable]
    1311 |         u64 wantseq = xtfs->w_wantseq;
         |             ^~~~~~~
   net/xfrm/xfrm_iptfs.c: In function '__reorder_future_shifts':
   net/xfrm/xfrm_iptfs.c:1433:13: warning: variable 'last_drop_seq' set but not used [-Wunused-but-set-variable]
    1433 |         u64 last_drop_seq = xtfs->w_wantseq;
         |             ^~~~~~~~~~~~~
   net/xfrm/xfrm_iptfs.c: In function 'iptfs_drop_timer':
   net/xfrm/xfrm_iptfs.c:1653:20: warning: variable 'fcount' set but not used [-Wunused-but-set-variable]
    1653 |         u32 count, fcount;
         |                    ^~~~~~
   net/xfrm/xfrm_iptfs.c: In function 'iptfs_delay_timer':
   net/xfrm/xfrm_iptfs.c:2396:16: warning: variable 'osize' set but not used [-Wunused-but-set-variable]
    2396 |         size_t osize;
         |                ^~~~~
   net/xfrm/xfrm_iptfs.c: In function 'iptfs_encap_add_ipv4':
   net/xfrm/xfrm_iptfs.c:2444:13: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
    2444 |         int flags;
         |             ^~~~~
   net/xfrm/xfrm_iptfs.c: At top level:
>> net/xfrm/xfrm_iptfs.c:100:12: warning: '__trace_ip_proto_seq' defined but not used [-Wunused-function]
     100 | static u32 __trace_ip_proto_seq(struct iphdr *iph)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/__trace_ip_proto_seq +100 net/xfrm/xfrm_iptfs.c

    99	
 > 100	static u32 __trace_ip_proto_seq(struct iphdr *iph)
   101	{
   102		void *nexthdr;
   103		u32 protocol = 0;
   104	
   105		if (iph->version == 4) {
   106			nexthdr = (void *)(iph + 1);
   107			protocol = iph->protocol;
   108		} else if (iph->version == 6) {
   109			nexthdr = (void *)(((struct ipv6hdr *)(iph)) + 1);
   110			protocol = ((struct ipv6hdr *)(iph))->nexthdr;
   111		}
   112		switch (protocol) {
   113		case IPPROTO_ICMP:
   114			return ntohs(((struct icmphdr *)nexthdr)->un.echo.sequence);
   115		case IPPROTO_ICMPV6:
   116			return ntohs(((struct icmp6hdr *)nexthdr)->icmp6_sequence);
   117		case IPPROTO_TCP:
   118			return ntohl(((struct tcphdr *)nexthdr)->seq);
   119		case IPPROTO_UDP:
   120			return ntohs(((struct udphdr *)nexthdr)->source);
   121		default:
   122			return 0;
   123		}
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
