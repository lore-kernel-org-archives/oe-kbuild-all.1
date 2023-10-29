Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25861211C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 12:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ARPUMNbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698582185; x=1730118185;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zdm7dCxrA7fCvOprhPAgZoC3E8FdYRDd3H5IFlUm6Zw=;
  b=ARPUMNbOdR958d3qHRcL7lxwXwf5FZEXdKItjGLYRxYauZ6naGtcjRUW
   7DD3xXcb+TY5x2OMx9SvcOfOa/xHXts6BTc3CnsxX8yG6fBKZ0DhyBGK0
   Lnyfvecxi4KeJz2zQLAeFmCpbF/beSeZYf2j9u3gDZx7X0PtU7z5CBK4z
   GQiiZnuM/byXBmTe23NuyYYmrsgpSvH3fLdhm6bq6ixV6cbSrTECN62HH
   S7LXGKwt2aptvM6iFmURdPr9imFcjM6uk5boh2/UOef7zAANoWkbejtCU
   IS85H7SWyV35bhqJNt7RFx6A8tli1z3qzucHl7TZqqM4JXJtRrwEt1PlV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="390810447"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="390810447"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 05:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="753552601"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="753552601"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Oct 2023 05:23:00 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qx4oj-000CYV-0x;
	Sun, 29 Oct 2023 12:22:57 +0000
Date: Sun, 29 Oct 2023 20:21:57 +0800
From: kernel test robot <lkp@intel.com>
To: Coco Li <lixiaoyan@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Mubashir Adnan Qureshi <mubashirq@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	Chao Wu <wwchao@google.com>, Wei Wang <weiwan@google.com>,
	Pradeep Nemavat <pnemavat@google.com>,
	Coco Li <lixiaoyan@google.com>
Subject: Re: [PATCH v5 net-next 3/5] netns-ipv4: reorganize netns_ipv4 fast
 path variables
Message-ID: <202310292021.xxMbMUCY-lkp@intel.com>
References: <20231029075244.2612089-4-lixiaoyan@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231029075244.2612089-4-lixiaoyan@google.com>

Hi Coco,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Coco-Li/Documentations-Analyze-heavily-used-Networking-related-structs/20231029-172902
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231029075244.2612089-4-lixiaoyan%40google.com
patch subject: [PATCH v5 net-next 3/5] netns-ipv4: reorganize netns_ipv4 fast path variables
config: parisc-randconfig-001-20231029 (https://download.01.org/0day-ci/archive/20231029/202310292021.xxMbMUCY-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310292021.xxMbMUCY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310292021.xxMbMUCY-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/core/net_namespace.c: In function 'netns_ipv4_struct_check':
>> net/core/net_namespace.c:1127:9: error: expected expression before '/' token
    1127 |         / TXRX readonly hotpath cache lines */
         |         ^


vim +1127 net/core/net_namespace.c

  1101	
  1102	static void __init netns_ipv4_struct_check(void)
  1103	{
  1104		/* TX readonly hotpath cache lines */
  1105		CACHELINE_ASSERT_GROUP_MEMBER(struct netns_ipv4, netns_ipv4_read_tx,
  1106					      sysctl_tcp_early_retrans);
  1107		CACHELINE_ASSERT_GROUP_MEMBER(struct netns_ipv4, netns_ipv4_read_tx,
  1108					      sysctl_tcp_tso_win_divisor);
  1109		CACHELINE_ASSERT_GROUP_MEMBER(struct netns_ipv4, netns_ipv4_read_tx,
  1110					      sysctl_tcp_tso_rtt_log);
  1111		CACHELINE_ASSERT_GROUP_MEMBER(struct netns_ipv4, netns_ipv4_read_tx,
  1112					      sysctl_tcp_autocorking);
  1113		CACHELINE_ASSERT_GROUP_MEMBER(struct netns_ipv4, netns_ipv4_read_tx,
  1114					      sysctl_tcp_min_snd_mss);
  1115		CACHELINE_ASSERT_GROUP_MEMBER(struct netns_ipv4, netns_ipv4_read_tx,
  1116					      sysctl_tcp_notsent_lowat);
  1117		CACHELINE_ASSERT_GROUP_MEMBER(struct netns_ipv4, netns_ipv4_read_tx,
  1118					      sysctl_tcp_limit_output_bytes);
  1119		CACHELINE_ASSERT_GROUP_MEMBER(struct netns_ipv4, netns_ipv4_read_tx,
  1120					      sysctl_tcp_min_rtt_wlen);
  1121		CACHELINE_ASSERT_GROUP_MEMBER(struct netns_ipv4, netns_ipv4_read_tx,
  1122					      sysctl_tcp_wmem);
  1123		CACHELINE_ASSERT_GROUP_MEMBER(struct netns_ipv4, netns_ipv4_read_tx,
  1124					      sysctl_ip_fwd_use_pmtu);
  1125		CACHELINE_ASSERT_GROUP_SIZE(struct netns_ipv4, netns_ipv4_read_tx, 33);
  1126	
> 1127		/ TXRX readonly hotpath cache lines */
  1128		CACHELINE_ASSERT_GROUP_MEMBER(struct netns_ipv4, netns_ipv4_read_txrx,
  1129					      sysctl_tcp_moderate_rcvbuf);
  1130		CACHELINE_ASSERT_GROUP_SIZE(struct netns_ipv4, netns_ipv4_read_txrx, 1);
  1131	
  1132		/* RX readonly hotpath cache line */
  1133		CACHELINE_ASSERT_GROUP_MEMBER(struct netns_ipv4, netns_ipv4_read_rx,
  1134					      sysctl_ip_early_demux);
  1135		CACHELINE_ASSERT_GROUP_MEMBER(struct netns_ipv4, netns_ipv4_read_rx,
  1136					      sysctl_tcp_early_demux);
  1137		CACHELINE_ASSERT_GROUP_MEMBER(struct netns_ipv4, netns_ipv4_read_rx,
  1138					      sysctl_tcp_reordering);
  1139		CACHELINE_ASSERT_GROUP_MEMBER(struct netns_ipv4, netns_ipv4_read_rx,
  1140					      sysctl_tcp_rmem);
  1141		CACHELINE_ASSERT_GROUP_SIZE(struct netns_ipv4, netns_ipv4_read_rx, 18);
  1142	}
  1143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
