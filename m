Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D115D1113
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 13:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686922651; x=1718458651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yuhXpSyTzM430duTnabBKhcEFi9uQQpcdx7Eam1WTN0=;
  b=SATEqJzwSG/23fLIvRKr/tMTvRQTOfZuUS+IwwhXH91KHKU1CZ2w75n/
   wZ+ND0pUeQJDh+zDOESEODIQm73JrjmJ6tAJIgr0Bw4purGAizch26FFw
   r6r4N8k7Gg0uBv4Pa0luXUO29h4PuzVo1fZDfJ/Xwn87BVNM79N3hzp8G
   L0aCFylCbhnQQz/TimiR/JlmmidXml4eaEqazBBbxKz4GNmDGrI2EaXJ5
   CixcwE5tvE0w85NclEbdr99ivEXyjGDxO1I/YIqQuUOZkJEGgL0vQYsDu
   RIdy0+jRIzm/DdaDlrnJB13+umz5H5brx3cZ2bB21I1TAdic6gInPn+DZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="359223852"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="359223852"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 06:37:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="887115200"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="887115200"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 16 Jun 2023 06:37:29 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA9do-0001HA-2i;
	Fri, 16 Jun 2023 13:37:28 +0000
Date: Fri, 16 Jun 2023 21:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 15/20]
 net/rds/tcp.c:568:31: error: too many arguments to function
 'register_net_sysctl'
Message-ID: <202306162100.KjfWve4u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   669cf696035fa888754f34d948b9488c2206dd7d
commit: 77f7bf98367fb39b66b751e8979580f8bf7e8c57 [15/20] sysctl: Add an ARRAY_SIZE to register_net_sysctl call
config: nios2-randconfig-r013-20230616 (https://download.01.org/0day-ci/archive/20230616/202306162100.KjfWve4u-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306162100.KjfWve4u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306162100.KjfWve4u-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/rds/tcp.c: In function 'rds_tcp_init_net':
>> net/rds/tcp.c:568:31: error: too many arguments to function 'register_net_sysctl'
     568 |         rtn->rds_tcp_sysctl = register_net_sysctl(net, "net/rds/tcp", tbl,
         |                               ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/netdevice.h:38,
                    from include/net/sock.h:46,
                    from include/linux/tcp.h:19,
                    from include/net/tcp.h:20,
                    from net/rds/tcp.c:37:
   include/net/net_namespace.h:479:40: note: declared here
     479 | static inline struct ctl_table_header *register_net_sysctl(struct net *net,
         |                                        ^~~~~~~~~~~~~~~~~~~
--
   net/rds/sysctl.c: In function 'rds_sysctl_init':
>> net/rds/sysctl.c:105:32: error: too many arguments to function 'register_net_sysctl'
     105 |         rds_sysctl_reg_table = register_net_sysctl(&init_net, "net/rds",
         |                                ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/netdevice.h:38,
                    from include/net/sock.h:46,
                    from net/rds/rds.h:5,
                    from net/rds/sysctl.c:37:
   include/net/net_namespace.h:479:40: note: declared here
     479 | static inline struct ctl_table_header *register_net_sysctl(struct net *net,
         |                                        ^~~~~~~~~~~~~~~~~~~
--
   net/phonet/sysctl.c: In function 'phonet_sysctl_init':
>> net/phonet/sysctl.c:89:28: error: too many arguments to function 'register_net_sysctl'
      89 |         phonet_table_hrd = register_net_sysctl(&init_net, "net/phonet",
         |                            ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/netdevice.h:38,
                    from include/net/sock.h:46,
                    from net/phonet/sysctl.c:17:
   include/net/net_namespace.h:479:40: note: declared here
     479 | static inline struct ctl_table_header *register_net_sysctl(struct net *net,
         |                                        ^~~~~~~~~~~~~~~~~~~
--
   drivers/infiniband/core/iwcm.c: In function 'iw_cm_init':
>> drivers/infiniband/core/iwcm.c:1195:30: error: too many arguments to function 'register_net_sysctl'
    1195 |         iwcm_ctl_table_hdr = register_net_sysctl(&init_net, "net/iw_cm",
         |                              ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/netdevice.h:38,
                    from include/net/sock.h:46,
                    from include/linux/tcp.h:19,
                    from include/linux/ipv6.h:93,
                    from include/net/ipv6.h:12,
                    from include/rdma/ib_verbs.h:25,
                    from include/rdma/ib_mad.h:15,
                    from include/rdma/ib_cm.h:13,
                    from include/rdma/iw_cm.h:11,
                    from drivers/infiniband/core/iwcm.c:51:
   include/net/net_namespace.h:479:40: note: declared here
     479 | static inline struct ctl_table_header *register_net_sysctl(struct net *net,
         |                                        ^~~~~~~~~~~~~~~~~~~


vim +/register_net_sysctl +568 net/rds/tcp.c

   543	
   544	static __net_init int rds_tcp_init_net(struct net *net)
   545	{
   546		struct rds_tcp_net *rtn = net_generic(net, rds_tcp_netid);
   547		struct ctl_table *tbl;
   548		int err = 0;
   549	
   550		memset(rtn, 0, sizeof(*rtn));
   551	
   552		/* {snd, rcv}buf_size default to 0, which implies we let the
   553		 * stack pick the value, and permit auto-tuning of buffer size.
   554		 */
   555		if (net == &init_net) {
   556			tbl = rds_tcp_sysctl_table;
   557		} else {
   558			tbl = kmemdup(rds_tcp_sysctl_table,
   559				      sizeof(rds_tcp_sysctl_table), GFP_KERNEL);
   560			if (!tbl) {
   561				pr_warn("could not set allocate sysctl table\n");
   562				return -ENOMEM;
   563			}
   564			rtn->ctl_table = tbl;
   565		}
   566		tbl[RDS_TCP_SNDBUF].data = &rtn->sndbuf_size;
   567		tbl[RDS_TCP_RCVBUF].data = &rtn->rcvbuf_size;
 > 568		rtn->rds_tcp_sysctl = register_net_sysctl(net, "net/rds/tcp", tbl,
   569							  ARRAY_SIZE(rds_tcp_sysctl_table));
   570		if (!rtn->rds_tcp_sysctl) {
   571			pr_warn("could not register sysctl\n");
   572			err = -ENOMEM;
   573			goto fail;
   574		}
   575	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
