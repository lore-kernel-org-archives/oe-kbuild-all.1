Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2CF139D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 13:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736600884; cv=none; b=iqOlIODKvwM0tbC3kB0EgetcE8YKQhh3qs7oSkrRDYERsuAgXGKPQgeLsJ3QQeLxclV8GazNc1g140s46+FTMeWpf7DJ1XVwIYCS0Eh8ig7xf4tY3QY9MNVGDL2n1vaIDh46PR5/RY4qT3qNTYJ0h0F932kBYmRFJAZC5pqf21w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736600884; c=relaxed/simple;
	bh=i8s92YLRz+sgorXruTf+jw/3PqdF7+JjId4hcSNv3JA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IsQE8zFLzSq5+cdipK45OhuxFTh3dvLj7QGD2aOePmOe6+q4IM8VEnYrztxexa9J4N30+TV/Vc6fk99sOk7+/1VlIW0p8IYqmUpHJ5nDceQOa3nHMUTeJofuNRi4q5bAWWzlDvSpYWLiMGo1iXIjUJke0mADttM3tAPOHigP3yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fc1vpDed; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fc1vpDed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736600883; x=1768136883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i8s92YLRz+sgorXruTf+jw/3PqdF7+JjId4hcSNv3JA=;
  b=Fc1vpDedUBsvCpALefc7XGJApmKywIvLiI10ORhQvaoQeSLje0LjSLjx
   yS5HUwoeUifsH04BosXTuySqGp1h5nfDtHsHpVwzYfNBxpWPIOgNGEQCD
   Scmcn6dp3CmQ8G3CUAGMmKtPIaU/sN2OFDz+YaXKb/aAy/rZNHBJpwe4F
   8ztDC7On20gr4yBhI3hItkSBk6SW37pftD9u0w5cKRzkFBQuMHXm7vhte
   CFhmJ8ygDvlXojpdD5HanCrxb1Jq9hgK94jUxZuUJwBYEG/ubQWkkMi28
   1UFnXuHMudCT44Lwlxe7q+P/70qhBUvr/b/le/iiqtc9SVa1N6teIrFg1
   Q==;
X-CSE-ConnectionGUID: LIASPQw0SVWBkkLBpzuYBw==
X-CSE-MsgGUID: 9Snk73nXRXOwcJu1u8FJ/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="59370297"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="59370297"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 05:08:02 -0800
X-CSE-ConnectionGUID: PSVsMl57RRKYfRN9orzlkA==
X-CSE-MsgGUID: zrzb1KILRkGNNOR+2KMhFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="104040537"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jan 2025 05:08:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWbDa-000KfR-2J;
	Sat, 11 Jan 2025 13:07:58 +0000
Date: Sat, 11 Jan 2025 21:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 22/26] net/core/sysctl_net_core.c:588:35: error:
 initialization of 'void *' from 'int' makes pointer from integer without a
 cast
Message-ID: <202501112114.roey900M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   82f04d87b1ca44e0c249865cc1c6b767fc01b7b4
commit: d5bb142234aa37f13a8fe73297c34b5b0ae2729d [22/26] net: set the minimum for net_hotdata.netdev_budget_usecs
config: arm-randconfig-002-20250111 (https://download.01.org/0day-ci/archive/20250111/202501112114.roey900M-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501112114.roey900M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501112114.roey900M-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/sysctl_net_core.c:588:35: error: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     588 |                 .extra1         = netdev_budget_usecs_min,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   net/core/sysctl_net_core.c:588:35: note: (near initialization for 'net_core_table[14].extra1')
   net/core/sysctl_net_core.c:588:35: error: initializer element is not constant
   net/core/sysctl_net_core.c:588:35: note: (near initialization for 'net_core_table[14].extra1')


vim +588 net/core/sysctl_net_core.c

   400	
   401	static struct ctl_table net_core_table[] = {
   402		{
   403			.procname	= "mem_pcpu_rsv",
   404			.data		= &net_hotdata.sysctl_mem_pcpu_rsv,
   405			.maxlen		= sizeof(int),
   406			.mode		= 0644,
   407			.proc_handler	= proc_dointvec_minmax,
   408			.extra1		= &min_mem_pcpu_rsv,
   409		},
   410		{
   411			.procname	= "dev_weight",
   412			.data		= &weight_p,
   413			.maxlen		= sizeof(int),
   414			.mode		= 0644,
   415			.proc_handler	= proc_do_dev_weight,
   416		},
   417		{
   418			.procname	= "dev_weight_rx_bias",
   419			.data		= &dev_weight_rx_bias,
   420			.maxlen		= sizeof(int),
   421			.mode		= 0644,
   422			.proc_handler	= proc_do_dev_weight,
   423		},
   424		{
   425			.procname	= "dev_weight_tx_bias",
   426			.data		= &dev_weight_tx_bias,
   427			.maxlen		= sizeof(int),
   428			.mode		= 0644,
   429			.proc_handler	= proc_do_dev_weight,
   430		},
   431		{
   432			.procname	= "netdev_max_backlog",
   433			.data		= &net_hotdata.max_backlog,
   434			.maxlen		= sizeof(int),
   435			.mode		= 0644,
   436			.proc_handler	= proc_dointvec
   437		},
   438		{
   439			.procname	= "netdev_rss_key",
   440			.data		= &netdev_rss_key,
   441			.maxlen		= sizeof(int),
   442			.mode		= 0444,
   443			.proc_handler	= proc_do_rss_key,
   444		},
   445	#ifdef CONFIG_BPF_JIT
   446		{
   447			.procname	= "bpf_jit_enable",
   448			.data		= &bpf_jit_enable,
   449			.maxlen		= sizeof(int),
   450			.mode		= 0644,
   451			.proc_handler	= proc_dointvec_minmax_bpf_enable,
   452	# ifdef CONFIG_BPF_JIT_ALWAYS_ON
   453			.extra1		= SYSCTL_ONE,
   454			.extra2		= SYSCTL_ONE,
   455	# else
   456			.extra1		= SYSCTL_ZERO,
   457			.extra2		= SYSCTL_TWO,
   458	# endif
   459		},
   460	# ifdef CONFIG_HAVE_EBPF_JIT
   461		{
   462			.procname	= "bpf_jit_harden",
   463			.data		= &bpf_jit_harden,
   464			.maxlen		= sizeof(int),
   465			.mode		= 0600,
   466			.proc_handler	= proc_dointvec_minmax_bpf_restricted,
   467			.extra1		= SYSCTL_ZERO,
   468			.extra2		= SYSCTL_TWO,
   469		},
   470		{
   471			.procname	= "bpf_jit_kallsyms",
   472			.data		= &bpf_jit_kallsyms,
   473			.maxlen		= sizeof(int),
   474			.mode		= 0600,
   475			.proc_handler	= proc_dointvec_minmax_bpf_restricted,
   476			.extra1		= SYSCTL_ZERO,
   477			.extra2		= SYSCTL_ONE,
   478		},
   479	# endif
   480		{
   481			.procname	= "bpf_jit_limit",
   482			.data		= &bpf_jit_limit,
   483			.maxlen		= sizeof(long),
   484			.mode		= 0600,
   485			.proc_handler	= proc_dolongvec_minmax_bpf_restricted,
   486			.extra1		= SYSCTL_LONG_ONE,
   487			.extra2		= &bpf_jit_limit_max,
   488		},
   489	#endif
   490		{
   491			.procname	= "netdev_tstamp_prequeue",
   492			.data		= &net_hotdata.tstamp_prequeue,
   493			.maxlen		= sizeof(int),
   494			.mode		= 0644,
   495			.proc_handler	= proc_dointvec
   496		},
   497		{
   498			.procname	= "message_cost",
   499			.data		= &net_ratelimit_state.interval,
   500			.maxlen		= sizeof(int),
   501			.mode		= 0644,
   502			.proc_handler	= proc_dointvec_jiffies,
   503		},
   504		{
   505			.procname	= "message_burst",
   506			.data		= &net_ratelimit_state.burst,
   507			.maxlen		= sizeof(int),
   508			.mode		= 0644,
   509			.proc_handler	= proc_dointvec,
   510		},
   511	#ifdef CONFIG_RPS
   512		{
   513			.procname	= "rps_sock_flow_entries",
   514			.maxlen		= sizeof(int),
   515			.mode		= 0644,
   516			.proc_handler	= rps_sock_flow_sysctl
   517		},
   518	#endif
   519	#ifdef CONFIG_NET_FLOW_LIMIT
   520		{
   521			.procname	= "flow_limit_cpu_bitmap",
   522			.mode		= 0644,
   523			.proc_handler	= flow_limit_cpu_sysctl
   524		},
   525		{
   526			.procname	= "flow_limit_table_len",
   527			.data		= &netdev_flow_limit_table_len,
   528			.maxlen		= sizeof(int),
   529			.mode		= 0644,
   530			.proc_handler	= flow_limit_table_len_sysctl
   531		},
   532	#endif /* CONFIG_NET_FLOW_LIMIT */
   533	#ifdef CONFIG_NET_RX_BUSY_POLL
   534		{
   535			.procname	= "busy_poll",
   536			.data		= &sysctl_net_busy_poll,
   537			.maxlen		= sizeof(unsigned int),
   538			.mode		= 0644,
   539			.proc_handler	= proc_dointvec_minmax,
   540			.extra1		= SYSCTL_ZERO,
   541		},
   542		{
   543			.procname	= "busy_read",
   544			.data		= &sysctl_net_busy_read,
   545			.maxlen		= sizeof(unsigned int),
   546			.mode		= 0644,
   547			.proc_handler	= proc_dointvec_minmax,
   548			.extra1		= SYSCTL_ZERO,
   549		},
   550	#endif
   551	#ifdef CONFIG_NET_SCHED
   552		{
   553			.procname	= "default_qdisc",
   554			.mode		= 0644,
   555			.maxlen		= IFNAMSIZ,
   556			.proc_handler	= set_default_qdisc
   557		},
   558	#endif
   559		{
   560			.procname	= "netdev_budget",
   561			.data		= &net_hotdata.netdev_budget,
   562			.maxlen		= sizeof(int),
   563			.mode		= 0644,
   564			.proc_handler	= proc_dointvec
   565		},
   566		{
   567			.procname	= "warnings",
   568			.data		= &net_msg_warn,
   569			.maxlen		= sizeof(int),
   570			.mode		= 0644,
   571			.proc_handler	= proc_dointvec
   572		},
   573		{
   574			.procname	= "max_skb_frags",
   575			.data		= &net_hotdata.sysctl_max_skb_frags,
   576			.maxlen		= sizeof(int),
   577			.mode		= 0644,
   578			.proc_handler	= proc_dointvec_minmax,
   579			.extra1		= SYSCTL_ONE,
   580			.extra2		= &max_skb_frags,
   581		},
   582		{
   583			.procname	= "netdev_budget_usecs",
   584			.data		= &net_hotdata.netdev_budget_usecs,
   585			.maxlen		= sizeof(unsigned int),
   586			.mode		= 0644,
   587			.proc_handler	= proc_dointvec_minmax,
 > 588			.extra1		= netdev_budget_usecs_min,
   589		},
   590		{
   591			.procname	= "fb_tunnels_only_for_init_net",
   592			.data		= &sysctl_fb_tunnels_only_for_init_net,
   593			.maxlen		= sizeof(int),
   594			.mode		= 0644,
   595			.proc_handler	= proc_dointvec_minmax,
   596			.extra1		= SYSCTL_ZERO,
   597			.extra2		= SYSCTL_TWO,
   598		},
   599		{
   600			.procname	= "devconf_inherit_init_net",
   601			.data		= &sysctl_devconf_inherit_init_net,
   602			.maxlen		= sizeof(int),
   603			.mode		= 0644,
   604			.proc_handler	= proc_dointvec_minmax,
   605			.extra1		= SYSCTL_ZERO,
   606			.extra2		= SYSCTL_THREE,
   607		},
   608		{
   609			.procname	= "high_order_alloc_disable",
   610			.data		= &net_high_order_alloc_disable_key.key,
   611			.maxlen         = sizeof(net_high_order_alloc_disable_key),
   612			.mode		= 0644,
   613			.proc_handler	= proc_do_static_key,
   614		},
   615		{
   616			.procname	= "gro_normal_batch",
   617			.data		= &net_hotdata.gro_normal_batch,
   618			.maxlen		= sizeof(unsigned int),
   619			.mode		= 0644,
   620			.proc_handler	= proc_dointvec_minmax,
   621			.extra1		= SYSCTL_ONE,
   622		},
   623		{
   624			.procname	= "netdev_unregister_timeout_secs",
   625			.data		= &netdev_unregister_timeout_secs,
   626			.maxlen		= sizeof(unsigned int),
   627			.mode		= 0644,
   628			.proc_handler	= proc_dointvec_minmax,
   629			.extra1		= SYSCTL_ONE,
   630			.extra2		= &int_3600,
   631		},
   632		{
   633			.procname	= "skb_defer_max",
   634			.data		= &net_hotdata.sysctl_skb_defer_max,
   635			.maxlen		= sizeof(unsigned int),
   636			.mode		= 0644,
   637			.proc_handler	= proc_dointvec_minmax,
   638			.extra1		= SYSCTL_ZERO,
   639		},
   640	};
   641	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
