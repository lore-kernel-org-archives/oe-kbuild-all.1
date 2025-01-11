Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E138217A5BE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 11:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736593781; cv=none; b=Dd1GdexDMg4/VOn8hSWt4u9MMIVPlX0if/xQlOB9v7vRpcxDIIy8jNUvlx7GLnT/e9XUvq5wEE7YmmTixvjklCDMcNGYiqdeGbO89hExO28w0ZnpBrz4Hwnk6Y8MN5UYsZhW1rAefOWvusHRuIYawYsPaZWqj2DbEeQrgELYMsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736593781; c=relaxed/simple;
	bh=06vNYZnb74A8F8rziEwFUZ5Nvd6xHmyKmGOwoB/4S6c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aq+2ios7qv1rNIsIzg+zBfGZuT1uvGBvVsHHGs6mO3Z64AxMtsq68oVPSnYtGW+4/FOqAYz3/coY76nWLp1b/sObkyW4/WQg2OZ8On7Gcm0O84yfAx5jWjLemc5fvOWBrK24cuNInVoMwIcF2gOezTY6QphwH/uhzCM12acP4ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0+6nD78; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0+6nD78"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736593780; x=1768129780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=06vNYZnb74A8F8rziEwFUZ5Nvd6xHmyKmGOwoB/4S6c=;
  b=J0+6nD78E91HuG6M6+WkT/6eqllLoK+XAxQ+bapQlyGoB8GVzdwHcy/P
   ogIKMk6ownAl4TLn/DeuGgXHnvncNcp8QrlXXmBt2kXHOlZWQ3/6lQ0dE
   ECh3aIl5wECBbjywLDAuJvLyssMfShYfelVJASuGR1JqneB/g6e3oXjwo
   ajVQevIhcQ9TBJSQFY3WjfG06+OGeAkaZ6a7oHzcc6y/SEwZf/ZI3+QwO
   iENKaAqdM7WBb4laqfh8YxINdsOrU7Qfnb5nbdK5X4Pb+gf0knfESaBBp
   beagRT6DLMFbfNG5GnpBqNaS20WIU1IJVw56Mgk80AdW+r6qqq9438w5B
   g==;
X-CSE-ConnectionGUID: 6o4VXsyhRgWYdSTIPyj7Kg==
X-CSE-MsgGUID: e1XPfgqATf6hHtTRB7IFWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="62258071"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="62258071"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 03:09:39 -0800
X-CSE-ConnectionGUID: d9lD3xAxTcScIk3Dh2o6ng==
X-CSE-MsgGUID: sb5wustJSICyyBFNh4BREw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="103776811"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jan 2025 03:09:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWZN2-000KZF-0u;
	Sat, 11 Jan 2025 11:09:36 +0000
Date: Sat, 11 Jan 2025 19:08:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 22/26] net/core/sysctl_net_core.c:588:35: error:
 initializer element is not constant
Message-ID: <202501111805.O6eCntBj-lkp@intel.com>
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
config: i386-buildonly-randconfig-004-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111805.O6eCntBj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111805.O6eCntBj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111805.O6eCntBj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> net/core/sysctl_net_core.c:588:35: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     588 |                 .extra1         = netdev_budget_usecs_min,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   net/core/sysctl_net_core.c:588:35: note: (near initialization for 'net_core_table[19].extra1')
>> net/core/sysctl_net_core.c:588:35: error: initializer element is not constant
   net/core/sysctl_net_core.c:588:35: note: (near initialization for 'net_core_table[19].extra1')


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
