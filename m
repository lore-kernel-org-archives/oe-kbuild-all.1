Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2076.outbound.protection.outlook.com [40.107.21.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E162F34
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 16:30:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoJXdN51vGpycBHRYFfrTfenQrA+orCoaw6OuFc7/JrFxF2qNnhyerT/S7yCSSKP2QqfwtMxTacTL80GSvyuMqnhYOQzeXdJZifHHWzNjVA24j4HQy5UoJfoBI9HUM0AnABOlB3YLU7fIp7FoYM8K2gN2+G85rlZInUsPj6lk9SXy0fBuEBGC4CkqQgE1Z/ActJp6dtLoCSVrXnoN7cTyvrgqKDPz6S/xod5J0Nt7qVEqd6Wqo+juK+HaP2TE2slz9toDnZFbRBg0wYyOc4f9QMj2NnxNAzmFgoiVn6hoWqsbQzDvhAICyTV8CBVXGHHmx6ttmVB3kqQs5JPacMo8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGUDMnR4FQjDvNVrmBietknwHjgq6EF3wbXrYojBjQI=;
 b=JzhJay0eTLySO5K5zaiXrX50cTg5l4dnrb6i9OJQuX2RFPWvjRRQCS4ImbblPHoYozWMwbX5G6OUgabCg/crE2EtEzzlGbog9+eE0l0uo6jMdzXE2tYDY+/MhgIvcbh/PnafJJfVKWZ3ob3R0Lr22xCQd94UJleyHIOCHigZ0RHuZLiVOTJHMsp7V/SfLxZoBRdMqii1g3obh2C1gwVteFN34yj+lit2d21KvtJhZxYQ3Y3Ab4XmIvjPAKNjcPzpnm9B0RbH3btEWVKUJT0k3zajoSWckpFir9E1h669o8et5diezLNbiAQ1IwaKwAlN75WRwiO9F/4T7j3cse5PzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGUDMnR4FQjDvNVrmBietknwHjgq6EF3wbXrYojBjQI=;
 b=skxRpOlNSXT69ew580oI64UXmFp355bP94Sck986vQJifBshGh2L9GS+vYlqA8pYrGIZwRDPmQkhfeDriv47TzuznpZaDXhW04J2trvYOdvkFE6sPmrt61dvtzZzRPJ7A8FUkN3ikYcyDPARkRZlZMvYKg+SezWMETF+PTjzHiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by AS8PR04MB8151.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 16:30:22 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::3cfb:3ae7:1686:a68b]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::3cfb:3ae7:1686:a68b%4]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 16:30:22 +0000
Date: Thu, 19 Jan 2023 18:30:18 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: kernel test robot <lkp@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, Claudiu Manoil <claudiu.manoil@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: [linux-stable-rc:linux-5.10.y 8781/9999]
 drivers/net/ethernet/freescale/enetc/enetc_pf.c:993:33: warning: variable
 'priv' set but not used
Message-ID: <20230119163018.vkpj2lex5rhnvhtk@skbuf>
References: <202301180614.Xs1bB4K3-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301180614.Xs1bB4K3-lkp@intel.com>
X-ClientProxiedBy: AM8P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::31) To VI1PR04MB5136.eurprd04.prod.outlook.com
 (2603:10a6:803:55::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5136:EE_|AS8PR04MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: a23ac891-a396-4780-29be-08dafa3a75f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2sDe7HrIW/EdBhZU4RfuPUWDxt8Kh4PPF34lehOtSvwO/BrMBi/3xi+WtKM+1oa8zHtQYMyovesLzYrGk6QYEOyru3+SckYoJ6W7Hf0m4LHzk9f7TWkq5fiJJSDrN5gIu9ku4uL/zIRe1z71E7ocSCOr8nHYumk1yEMeZ36DPKKhvGjfMZLPH5JtYsdjlvj7j2CLRcXXGxvnALGVsD+K738zi+t/BExtNVoEJiq7zG5E12hs66wWVVW14+ue6nabxeou15xwz1kPtlgAFNYTqk5gagv5wPYJ3VQImV0iPI/DV4TP3tDNGCrd/Kcl8WDw8VTPjZkYBqY9E8nYL0LsIzjvYFNx3ZJYeZAc8esLoBgeb3IRB8k75c94aNEdjtmO4ArSKIV8iau8AQcpOza9DzhNTV2qtYJjf/ZYxlbw3VV9AO3nIyxToaOFLSJfikpd1bhaEcA2H+Uxc/ub30hLzgvt6BjJUszUEzvDT4sDBucIhXcqBFY18FgEPP5uyjhJRC0uziQd0ZA1NJ+lx5CiqYldnbZI5I70hRmTvzyvz9JG0aYLBObQGKTzUC0AyBuzjY9O5bZZ3W3MKuLnUFFVpb8CLQCShcalCOr7N/DjxjhWNdFD1Ha/hVw1cxQzkh/O7UyPqIlWg9RjhDq+nGLewimeMhUwqQsKCl4nPCAWZ7s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5136.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199015)(1076003)(8936002)(33716001)(316002)(5660300002)(86362001)(966005)(6486002)(478600001)(6666004)(6506007)(2906002)(110136005)(54906003)(44832011)(83380400001)(66946007)(8676002)(4326008)(66556008)(66476007)(38100700002)(26005)(9686003)(6512007)(186003)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LaoPcvf453lBWx0I4xlXHM4CX5sVgt9ddKj1Syd+7MOOh8U6wqS1ifpaGzir?=
 =?us-ascii?Q?9f5S0KkUf8AT2QgGZdBKQnjoI7YwK+fhF/leDncMDLeClLh734R0mHnomVpu?=
 =?us-ascii?Q?PgJSyBgWrwpFhri9O8IkMGNG/VG/YeA5EEi6YkBNCtL5QgJYHD+3RMuSgi/4?=
 =?us-ascii?Q?4Wk5lWvF2Lo6guSp9cJMXwvhMwFymWoSBF0G6ZgXSPLIobKTWSrFu0/IOV+a?=
 =?us-ascii?Q?RZoYAjccOkTlJk7D1u00MXw7IJhMk1GGdCJwU5ZCeu4cl5Wkf574Fyw/kuIc?=
 =?us-ascii?Q?gfWej70ZgQQoXiGHghGTmw6Fr83SAvrPIv7Kf9dbN51QNN/rwHxCpTZC5AO1?=
 =?us-ascii?Q?y2LB3pG7BJLJyGfKmhtU+h3J6l3jW08kbKPcEQe8+mgewdHCqjewyD+wkXcF?=
 =?us-ascii?Q?Q3dww55oStQE5v1KWCdbkvqv8hH5YiiFX3abAK9Oy4PvvfYagVtLbMZvvZPO?=
 =?us-ascii?Q?zHDpNl/cNJhD3fg5RKC2wzwWiB8p6YVkB8kJI/Yp7ntiebLru6cX/l9+MLlH?=
 =?us-ascii?Q?K3bJ/FfUlCw70dQ0wGMbDan2b05Bg0OEMZARClCMXL2nAweGzuP47Vk6ZFyJ?=
 =?us-ascii?Q?ZSdbjh+w/pIB+QVmCdBzxnIfsmuUlnw7SDc0KpRz+z2fiptwq/FIUHdEF/3j?=
 =?us-ascii?Q?miHyy3SUXYLidogUyUWH9tUtsWxZeHzCA7diYH+8texblOnFLUJoEosu8fu5?=
 =?us-ascii?Q?GBj+SXwF8uRqwaDmrWABoe/mJ8PbfvtdEtBgQ2WKP8B/nGFKg1FHx1hpZHqA?=
 =?us-ascii?Q?YbW3fpWbb93dXXiiV3LdUxrvD7qxGeL8NxFcUu+SwwdsKcMg6jhDy0KE3S8M?=
 =?us-ascii?Q?t8nQv8p8YWGu9a/ZqZtKJAfGEM025ye59ZtyrEX78sICe5RhppCxcCb5IQr5?=
 =?us-ascii?Q?5hrpCz+Ri0d2wWoMb91tn8wViguWlR8asZBPhCP4GtQkUrsZNuPCmkUsl9IQ?=
 =?us-ascii?Q?OF9ksHY0uhCdfh7bxOmWyDSpWjq+9wDx7E2Er+qf3CSDWlRRdeCqGwY1QpOw?=
 =?us-ascii?Q?qkq6OlNm9+wu2qd4jxXtBHpbxRUmlaL3HU36fZV6tz1cXr1IvK2MerxWWL83?=
 =?us-ascii?Q?xavrWIWptWySHyHKVCKnq4eAw2Oq38KLmBL+WQ15TZjEV9V2dYJy2UV3cTrO?=
 =?us-ascii?Q?oydhZKp/unyjBv68jnTVxYoKeYVOHSbvnmgt21FBXXzPc/dJgLxzrVNubfGu?=
 =?us-ascii?Q?RE3RCv+pSe1efHEoJfR7BB0d1DDBhiZGSA6Om6uVapobTZoI8abJu3aiiq78?=
 =?us-ascii?Q?+byxk262sx6j1PuvnZV/dbFg+Qw7lPB2WkmrZSjkupKx/CLZyTmDwf9s+fo4?=
 =?us-ascii?Q?TM431/RPuq+7A3TZqvs7X8yC/PEz91jOU8PKwzlLcaADrv2i1vSGu1LUwMXF?=
 =?us-ascii?Q?+sxC+JyzPyH3PNkW7hIDCRPbv9heclZbjNqpKcaMUhCA5wOoAMh3Acr24B99?=
 =?us-ascii?Q?bW5C/tCpFzpwyhXM2aD7UyZb5e6nni+83Q6/4nqJ3g21BU10Rwvc9dSGjLfe?=
 =?us-ascii?Q?lnPIqmBTzivqrIWCM5rJIMXQBekTPw8dp/Nk8En0fnCF+pR9853YggSbj9Vw?=
 =?us-ascii?Q?dwprDrcd3ultb0biOosFtJnF7mNe9S91YV699MKmr+S4d47F9MgnIn4ZkAw6?=
 =?us-ascii?Q?BQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a23ac891-a396-4780-29be-08dafa3a75f1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 16:30:22.1851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNheDfQxhW3oIMzQYQXvJ82NNQ3+3MwUpOh79GP1qeitNDDxklkBQROS2CDae+syIoun6TvW9tMV3AF5KeUvNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8151

On Wed, Jan 18, 2023 at 06:06:51AM +0800, kernel test robot wrote:
> Hi Vladimir,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> All warnings (new ones prefixed by >>):
> 
>    drivers/net/ethernet/freescale/enetc/enetc_pf.c: In function 'enetc_pl_mac_link_up':
> >> drivers/net/ethernet/freescale/enetc/enetc_pf.c:993:33: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
>      993 |         struct enetc_ndev_priv *priv;
>          |                                 ^~~~
> 
> 
> vim +/priv +993 drivers/net/ethernet/freescale/enetc/enetc_pf.c
> 
> 63876df5615edf Vladimir Oltean 2021-03-01   986  
> 71b77a7a27a338 Claudiu Manoil  2020-10-07   987  static void enetc_pl_mac_link_up(struct phylink_config *config,
> 71b77a7a27a338 Claudiu Manoil  2020-10-07   988  				 struct phy_device *phy, unsigned int mode,
> 71b77a7a27a338 Claudiu Manoil  2020-10-07   989  				 phy_interface_t interface, int speed,
> 71b77a7a27a338 Claudiu Manoil  2020-10-07   990  				 int duplex, bool tx_pause, bool rx_pause)
> 975d183ef0ca07 Michael Walle   2020-07-20   991  {
> 71b77a7a27a338 Claudiu Manoil  2020-10-07   992  	struct enetc_pf *pf = phylink_to_enetc_pf(config);
> 71b77a7a27a338 Claudiu Manoil  2020-10-07  @993  	struct enetc_ndev_priv *priv;
> 71b77a7a27a338 Claudiu Manoil  2020-10-07   994  
> 71b77a7a27a338 Claudiu Manoil  2020-10-07   995  	priv = netdev_priv(pf->si->ndev);
> 1f080b8caae9bb Vladimir Oltean 2022-05-10   996  
> 1f080b8caae9bb Vladimir Oltean 2022-05-10   997  	if (pf->si->hw_features & ENETC_SI_F_QBV)
> 71b77a7a27a338 Claudiu Manoil  2020-10-07   998  		enetc_sched_speed_set(priv, speed);
> 975d183ef0ca07 Michael Walle   2020-07-20   999  
> 63876df5615edf Vladimir Oltean 2021-03-01  1000  	if (!phylink_autoneg_inband(mode) &&
> 63876df5615edf Vladimir Oltean 2021-03-01  1001  	    phy_interface_mode_is_rgmii(interface))
> 63876df5615edf Vladimir Oltean 2021-03-01  1002  		enetc_force_rgmii_mac(&pf->si->hw, speed, duplex);
> 63876df5615edf Vladimir Oltean 2021-03-01  1003  
> 71b77a7a27a338 Claudiu Manoil  2020-10-07  1004  	enetc_mac_enable(&pf->si->hw, true);
> 975d183ef0ca07 Michael Walle   2020-07-20  1005  }
> 975d183ef0ca07 Michael Walle   2020-07-20  1006  

I'm not sure when this build warning was first reported, but fixing it
in linux-5.10.y may be more trouble than it's worth.

See, "priv" _is_ used in enetc_pl_mac_link_up() to call enetc_sched_speed_set().
The problem is that enetc_sched_speed_set() is defined like this when
CONFIG_FSL_ENETC_QOS is not defined:

#define enetc_sched_speed_set(priv, speed) (void)0

To fix it, one would do something like this:

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.h b/drivers/net/ethernet/freescale/enetc/enetc.h
index 1fe8dfd6b6d4..ea255fb1a77a 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.h
+++ b/drivers/net/ethernet/freescale/enetc/enetc.h
@@ -549,7 +549,12 @@ static inline int enetc_psfp_disable(struct enetc_ndev_priv *priv)
 #else
 #define enetc_qos_query_caps(ndev, type_data) -EOPNOTSUPP
 #define enetc_setup_tc_taprio(ndev, type_data) -EOPNOTSUPP
-#define enetc_sched_speed_set(priv, speed) (void)0
+
+static inline void enetc_sched_speed_set(struct enetc_ndev_priv *priv,
+					 int speed)
+{
+}
+
 #define enetc_setup_tc_cbs(ndev, type_data) -EOPNOTSUPP
 #define enetc_setup_tc_txtime(ndev, type_data) -EOPNOTSUPP
 #define enetc_setup_tc_psfp(ndev, type_data) -EOPNOTSUPP

But this patch is written against the current "net" tree (master branch).
In linux-5.10.y, the patch context is different (enetc_qos_query_caps()
does not exist). So it would conflict / wouldn't backport to linux-5.10.y.

On the other hand, in the master branch, this build warning does not
exist, because more code that makes use of "priv" has been added to the
enetc_pl_mac_link_up() function.

My options are:
(a) send a patch just to linux-5.10.y, makes stable go out of sync with master
(b) send a patch to the "net" tree (against master), that's backported
    as far as it goes, then I send manual backports all the way down to
    linux-5.10.y, to eventually quiesce the build warning
(c) do nothing

Greg, what do you prefer?
