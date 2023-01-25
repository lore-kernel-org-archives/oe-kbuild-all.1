Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B2B1C29
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jan 2023 11:03:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNdiT1MKF1U8cNWmhG9Ucnt//9cZGvQ2t5rNSZfJMXnhkJwecICKN86Wispu9iiqKm/H6DM0VJF3bJ46Y2T3MRZvMbQPTXdYo77cgaoeH7N/cK3KaHZfepJbJDlkAYdXLXsb4IYoynXFsLQqr+Q0EY9B22pXgiwtpG0UQ9FFG2b9XlQCBttZr1/8ryRTqiEHR/ELgQHqhhFPY+8OrDY/BhSB9n8IFEOxDQSiSVjRaY5fXcjqc0rHNmGmf9DQWoyoC4MWx9JpDmNIw+/KGJzd0l8o8J+H5cX90cuMXhYn8zYPUs+be7q+tINVJRiLp9VzPhqL+TyrllgLBouxBZfgiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JYRHCm2rBxfy8B4wzU53a/cSH1dyn/1oYOnnOHLfx8=;
 b=VKFuRVZgmVi5GF9fSrC0KxDl0KwBBZlG4XrM6kNZeKgq8uzahjW45lHP3q2met+T/xwfFJBN/io7WTA+80VS0KQGPuYMheAT46usc3OhryFVCTVVjODYRnxMpdx4Hg9BEBhQcMnBu3FRistKiMl7nF3Ak31sCULQIqTlkhlvYiK+xgcN9wMZ75KpCq6E8TEqrzvO/C6Mzy0bvcnCSq9A7/Qk4UIYvQv850u4z5I+Xi5lp74A/vC5oCBjCUl3SyNuMivp6dplxuTuus2aVlj6G9gVN0qcyzrVzYqvWaETZS9NO3Nw2UBBVLSnibbg6kNzgO5Bk2TBEV/wqdfSOeQo0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JYRHCm2rBxfy8B4wzU53a/cSH1dyn/1oYOnnOHLfx8=;
 b=ce4ebS7qTCLK8qSpUsReeehIERdxsGLgqxVCFZne5nSphHC4oOiRBQ8EahS1gxCL9IqOEovWyPSLRL05HJqbSoKdzT04p2Em6AJm2ThzikSEbgIs+GiRtB+Obx61bAqb60sk3rWLHv0gKvYbxlqnUKgDDa9BulOwhUe6E9i552U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 11:03:50 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::3cfb:3ae7:1686:a68b]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::3cfb:3ae7:1686:a68b%7]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 11:03:50 +0000
Date: Wed, 25 Jan 2023 13:03:46 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 6983/7678] ocelot_stats.c:undefined reference
 to `ethtool_aggregate_pause_stats'
Message-ID: <20230125110346.xltago5o2gxxg5vo@skbuf>
References: <202301251054.zZwhG2Yz-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301251054.zZwhG2Yz-lkp@intel.com>
X-ClientProxiedBy: AS9PR06CA0032.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::8) To VI1PR04MB5136.eurprd04.prod.outlook.com
 (2603:10a6:803:55::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5136:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b68273c-7697-445e-ac7d-08dafec3d6fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RAzviTs4Cw0LvupXbsEC3HiNGfluOZhLEgQXQojllmmCZDV9OAY7YxoVK+USb7gSd/1cGDnX0NnJN6+y2r0ywCkJAFMj9yv+P0BKpxwVRA+BDgNWtX/jUCwFeCETfz5QVljT8ITQBzw/Fa6MXF0Rn3F/Zt5IDX3APEmja4GWpxO0pG4aN7X7X2oIoRyIxiWjaFt+DSnjrkSVfk2slBBdchKTZXqGMWpSssPmr+E0Z05/vfKz+gxLq9aoKjVLYJ1Vtps5mo9IYAhk2i3VO87soAN0pg0TNnHBf+UHP9JTFuycDse0t1BUsQdH+d/uVZsKF0zzVM+P6NKTNiXaXmj5E8k7/QXbWjeLV2mGEYxH+JujyYAOUCJyg4RO/BjTt6rrMhbY3DDHvVyMcnBZ/dR27M7T5ezniPzh41GKKqFGpAkEUfB/s2wf/kouUgtqJB0+YvSH/KyMHvusiEofFi2KfWNkJTCD78QDazWbtt/yqC09HGhrws+t4yaVfxV5W8B3VjV54wqCxZGjtIm1dOddooUQJ50yaunC6/W4twU60SjiyBKI/8lYnqu87bs54Zo+bNzyP3WNVBwXSvdF3oN9ippDQ3N3OtjWYo0F7BcEl90JecJpEOmURR3J4sFkBWg5Hx/GTySXWEprBB+5SEmLYPcjY9mKD6+oJNQkc6e4ss1aMfgku/XW6Qhmzk0oICJpc2HD5mNjk6yd/utZ8EjrctqocVO60ybXc/xfWSUctLQU+bQrgwglhf0fTZGgh1Qh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5136.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199018)(83380400001)(38100700002)(6916009)(66556008)(478600001)(8676002)(186003)(66476007)(9686003)(6486002)(1076003)(66946007)(966005)(2906002)(86362001)(41300700001)(26005)(5660300002)(33716001)(316002)(6506007)(6666004)(6512007)(44832011)(4326008)(8936002)(81973001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ofziLTehUn2+IDBda/uprmhU00AdRXcHl4T8UkGD0P5PQAthJ4EOry+CMKs9?=
 =?us-ascii?Q?u6hLACSTSqrE7wY9DH0oGtUdtC2x8A0+XJR4aVvQepqBjQFtGTGIeRu51K+g?=
 =?us-ascii?Q?EBuWQv7kZdwe5HCmcLtr693UwpOeD0/S/hI5oD/JKAhIYDV+9UQb6/th69mq?=
 =?us-ascii?Q?WDfdSz2Nr6adrmO7Dx2sYDsTUO/aXErmLemrr4HhKG8N4x/GKD3b5fbb4nZl?=
 =?us-ascii?Q?6ZjWd0dChRPwL0ilAmvTLW5ZMHMPZOHixGYwWzVIWL9FrOmgyWATaDAyZZUD?=
 =?us-ascii?Q?6HNYVhEE+WGTtlKM3Ipy2TGVnJoZgYcijEkowZ6CqMuOwC/rZm0Bvn3k6ams?=
 =?us-ascii?Q?KmB2xjejL017hj+//sEW2/fQjLjJUpMBWRF1i8R0uNHPM+TCKnsZW04ZvmGn?=
 =?us-ascii?Q?69BZEkmDBVcibIB8DjC8H4EUigICs7kPnG4631enhH+B7mdtshehbOabIFGo?=
 =?us-ascii?Q?KJY657w7TTV8XEk9va7bxk0FalT3cavTbbJjCnIo0gvDwO4Sd7snVQKns/Uy?=
 =?us-ascii?Q?Vzd8w4HL78ZldjEIl+jIKZ4N5X1mVG7ogZUYYly3bA8FI+cGAFPY9Cf1C2hj?=
 =?us-ascii?Q?8h+nZAQydmewjqVkry5BG0hVvDyQbtL/XEDlfpPOcHyzH0NteUYUotjbYgee?=
 =?us-ascii?Q?4n1qwaZpWwNvR5l2LY/08v99T4vzHrLtgNPwlixmIGgxx40wTs71RGB027gz?=
 =?us-ascii?Q?U3O0e+gXyRxaXchEIkOf2tYQ2Viu3e3QRxhvE5Wf+DYnLHRyMUBFKKynSXqT?=
 =?us-ascii?Q?J53a+RiiPD7oB5y8PGc1rUPd+RbqGUNnzg7j9yejmDX5IUQqnfu2BP5xI2zK?=
 =?us-ascii?Q?/AMFXlOfNFl67sSxqK5OvLjEro4vI05jABz2hdEB59U4eDycNnUTfLaDMU5K?=
 =?us-ascii?Q?RM70fT2axCPnHeH24QGI6PK9VeTovBIrzM6MyQYv9YrbJesyf3Al9xsriglA?=
 =?us-ascii?Q?gkQVpBbBUT4c6Q2qDYzbV1CZQLqbi+OjylqFOc4i+i0UnDctXf12FgNBNCED?=
 =?us-ascii?Q?gbx0APv5pbHDVO4kLvyNouB2furttc4nv+EG1e+2QnTOTVMvMK64gOYU5Yxy?=
 =?us-ascii?Q?ZzL7RKEpteKUrp60QrW/2qxk5jNY+04W59SIu9KgYpw7jSEOkYIUtJZAxWBU?=
 =?us-ascii?Q?opwYBZzoVciXsCSvnwh4k4Xnxu5wbYlW1DB0klJ3tXQWmPICzLxOvtVKO0MA?=
 =?us-ascii?Q?5QdzXBjXG7DP/ENIo27z/s5nXgytadAcfxnrzAkrJ3CEK8Pb5eqNQSAHwQCT?=
 =?us-ascii?Q?ZNUL2kM7uXOPXfVU/OAMQLB4PfMCcoDHoEvQNcqGpcFUHumhdDyK3eclWr3t?=
 =?us-ascii?Q?oKbY9cl3iAKL3+709Spb82e/Xir82Z3vO9xdpf+4JSH79IIyl5saIsgLsiuv?=
 =?us-ascii?Q?YXjyiqtVts2FI7wm/cs43kDnzovgq0gBTY/QWrQXcltziH/S4LRbTk1U8sN7?=
 =?us-ascii?Q?d/qPSbtnxJhFqYqz8V7nsR8Ya82cuziG6eDppnmjzBc7/b6h5MkKfYaQbByo?=
 =?us-ascii?Q?fjDJtoICT4ALlbCsG1JcE2S6TwL3W/dfjPufxKMjroz7uu7MpywFEnK7xWOx?=
 =?us-ascii?Q?As5YQEUyswhOgeJ49yFamsET3a+oWPo7e28uDCb8DB0gxDtkpOVUzfAmy+hk?=
 =?us-ascii?Q?cw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b68273c-7697-445e-ac7d-08dafec3d6fa
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 11:03:50.8145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ToCzC0RxJXF7GIDksmfpKCkmnYpQJmoPsKOSZPAnws0n/FJHYshBoT8PwVpmiLvzrBhTc6jYU4AQKrTEZnTWig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

On Wed, Jan 25, 2023 at 10:06:59AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   a54df7622717a40ddec95fd98086aff8ba7839a6
> commit: ab3f97a9610a8d90dc9934517e82c3272d4e98a0 [6983/7678] net: mscc: ocelot: export ethtool MAC Merge stats for Felix VSC9959
> config: nios2-randconfig-r016-20230123 (https://download.01.org/0day-ci/archive/20230125/202301251054.zZwhG2Yz-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=ab3f97a9610a8d90dc9934517e82c3272d4e98a0
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout ab3f97a9610a8d90dc9934517e82c3272d4e98a0
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    nios2-linux-ld: drivers/net/ethernet/mscc/ocelot_stats.o: in function `ocelot_port_get_pause_stats':
> >> ocelot_stats.c:(.text+0xc5c): undefined reference to `ethtool_aggregate_pause_stats'
>    ocelot_stats.c:(.text+0xc5c): relocation truncated to fit: R_NIOS2_CALL26 against `ethtool_aggregate_pause_stats'
>    nios2-linux-ld: drivers/net/ethernet/mscc/ocelot_stats.o: in function `ocelot_port_get_rmon_stats':
> >> ocelot_stats.c:(.text+0xd10): undefined reference to `ethtool_aggregate_rmon_stats'
>    ocelot_stats.c:(.text+0xd10): relocation truncated to fit: R_NIOS2_CALL26 against `ethtool_aggregate_rmon_stats'
>    nios2-linux-ld: drivers/net/ethernet/mscc/ocelot_stats.o: in function `ocelot_port_get_eth_ctrl_stats':
> >> ocelot_stats.c:(.text+0xd88): undefined reference to `ethtool_aggregate_ctrl_stats'
>    ocelot_stats.c:(.text+0xd88): relocation truncated to fit: R_NIOS2_CALL26 against `ethtool_aggregate_ctrl_stats'
>    nios2-linux-ld: drivers/net/ethernet/mscc/ocelot_stats.o: in function `ocelot_port_get_eth_mac_stats':
> >> ocelot_stats.c:(.text+0xe00): undefined reference to `ethtool_aggregate_mac_stats'
>    ocelot_stats.c:(.text+0xe00): relocation truncated to fit: R_NIOS2_CALL26 against `ethtool_aggregate_mac_stats'
>    nios2-linux-ld: drivers/net/ethernet/mscc/ocelot_stats.o: in function `ocelot_port_get_eth_phy_stats':
> >> ocelot_stats.c:(.text+0xe78): undefined reference to `ethtool_aggregate_phy_stats'
>    ocelot_stats.c:(.text+0xe78): relocation truncated to fit: R_NIOS2_CALL26 against `ethtool_aggregate_phy_stats'
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

Sent this patch to address the issue:
https://patchwork.kernel.org/project/netdevbpf/patch/20230125110214.4127759-1-vladimir.oltean@nxp.com/
