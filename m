Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827533EC6B2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 12:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791288184; cv=fail; b=P0PkTRfUjVauLCoJqwbsjxDMfGZXVBEvlEGqCHtRuq0a60v1TZj7vNSp0SYMMx2283+3YQ1dvc9dQ/hsYoB2BfgxJOUPvPLEu2rSM9xUw0djtLT8pHQuecccTAbMdZEL/D/d5ETqU7OKsSL0Ad4eDXJTG8IcdIAjnPeGrlszhjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791288184; c=relaxed/simple;
	bh=ZR682BTSAe/tte4derEpgDIRNCxpnrFKBB9cH6YjKt4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=WWvR9Q+fjU1ZuNNE6h7mSEvLQEWR8m3aaprpC9sJTXKvEenC17ssFzYSmdxhax2oEYUxvMhKXgwOKrLyLc2CWqIFNGLHsOu9BiDE44iCJIRgLMhbjA/TXjmC+A0GQZflLB0/xhMcOkiXb+JIMT/1cXD2VuuyjuUZMrHQnx7rl8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U44zslcK; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U44zslcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791288182; x=1822824182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZR682BTSAe/tte4derEpgDIRNCxpnrFKBB9cH6YjKt4=;
  b=U44zslcKqzJKQtoddzd7Q6GzozEBvhM77v/kNvy8Lcy0ivvgEGCNZNLG
   gxLRydgDTTwK9di+3AMTWvux16kxUysV0j70SAJNjiij+ED1ve7ywqrli
   9asNua7yqlwWn8L9ySkAg0sns7OzlEuclsDmy3S4AgMCZF+YmCEWA2k+q
   iI1udTALnk6px2f3m+tc01++d+XkUejxG2uoB8NTGmQUS4j+VC/pV9ALg
   BO0fa3XmjAJVA1sWjf7XL+PmojrsJOZwPHl68ZVo9wkI6gbMfIswusEbt
   j4cdYaYG0TYjUIX3PoSy9XFtO0xpNr4YL9cO/bzUEkWFmGovrtL+3Ul01
   A==;
X-CSE-ConnectionGUID: myas4Wl9SOKnY79cQtBIjQ==
X-CSE-MsgGUID: sB1LH7G9SfOhp3sGZbgOcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102496001"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102496001"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:03:00 -0700
X-CSE-ConnectionGUID: McXY63ZFRFOCA7NMXIt6ZQ==
X-CSE-MsgGUID: Y3Irj8Q2RcOR0veEXQsCRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="285037594"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:03:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:02:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 05:02:59 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:02:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUKCjPTs1hZ55jLk+gywK3mKFd8KjXAsT2JACFKnlIamAdCfxrwV65zoMP4X5BsMTrf00bLY6vdTteO29e4kyeIfXPEbf5/s/V1rtC68/8tcyooqAKnU9blgBMyu31g3U+1p/NOuB4yVgOoc18O5/wJ7qpZgjfl0/AH0B7nQR0tSj+kep1W5gpZa8CY7mxrgKIi5nff2V+JxeraVw4RWLd3Lv14Cbf/P51dE2nQNKB4T5CN2NGr2Tngj77vacob9zC8WNBsItDPvY/LOoi9uhcpvH1+15qhiToQeKUgkGFOQgEDQ29XsW7Z0bWXAuIHC5EeDdcwt/RqoLQWrC/fxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7awQMfPUhsiBs0+nBkP6iAhNjhCK1BaP4rdeoBrmpbA=;
 b=Y+swIBKxAIX6KDRkmbV8H22O9JO7xuUh/P7fQTUQH4hzyCN/VBrvBIqmy9x8BOruBg5BlGWxpZlwTokBkRG0RESGNyb/zjko9PNrELyCsRO1rPqCXtsPMmqZjoL/ct6ftjOPgPCLDxQYcsSp0ZsxjIobmSw5vaIxlWcIUTGvOtLXlUovTa3xOpBIcyt6MLaWfJX5bPzk6LQR7cOny80RI2tfSwY/tGfIorTDCuaWUW3MmIBo7gJu7VNwfg7DYta9e/dS15oRxGa4D4PiLys7+DutcD52TAJ4ZPpnFeGx0NbWvZy3i0LRwYdQMPFHyXqCXlkWTRigaOuUEBRqgqF/Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ2PR11MB8404.namprd11.prod.outlook.com (2603:10b6:a03:53f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 6 Oct
 2026 12:02:56 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 12:02:56 +0000
Date: Tue, 6 Oct 2026 20:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Switch <kyle.switch@motor-comm.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: drivers/net/dsa/motorcomm/chip.c:3928:36: error: 'priv' undeclared
Message-ID: <asTjaGgdmTwnve+N@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR0401CA0036.apcprd04.prod.outlook.com
 (2603:1096:820:e::23) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ2PR11MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ed06eb0-4752-4616-757a-08df23a1c245
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: b3qid7fTYBHMaP8Vt8tXe1eRiEmXo13YbwH6og/xwNqV6/O5INJ8wrPIhmUaBGKJGlxZvP3rGhr534Yab46ztbmJC9/Vg8B2Hh7x1U0jbOzazgipwaygMrxwK5lFm9BnwI+JbpkpnlN7pqeCA0PNyaH/20aVUtuThyz6e5eCVPbImY6tINr0c7YmkaR5B4uO1zM56Qv11vC1V9OoTPKVJ/6a3wGx4j4j81LEbk2RscWRgzf+O8RJkme1TKMsiL4hAOu3OnjDNbpWentRvBHcdbyvA7uh962VGNZZIf2et1NUchmghlEw5R+FMEFBWosvcFBRXcrIjl4xAHrdquBkuWgSo/2ZfgNuRAYsCfBcWng24WVFg0t5BeHwdeRSmdeWUBoW0IWffhYYoKl8MMEFV0jYH0oMdDSI+e2OfA8WTXUNYWiq83cM6BGeECaeBMWwz1FZYxsAZVGgduTWr5LvkSIO6ZYqzT/lv9yYqyTrdcvQnXpMPeUqWxcIrNEjFWygpkUJ1hXHr8VPy5parUylDlZQjxzOwOh8+B9jttEPH2o6xFXDcmYPjYIj8LxX8ai8Uik1GCvITh/yonIEEedls8I/3SMSZ/6cjvEaED93vCIX7VgAJRWLl9bdeOfMrFqR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oGRdfxqTOB6aRSz6Bbnh7MjZRfWgWFJSjEmrrgAF+nPmsj78c83KzX09lmVL?=
 =?us-ascii?Q?sPuXzX9gJejwyWxevqeM+Xhpgp8bqktEmBC/y/sCi+jteGWReLrrmobqHWAq?=
 =?us-ascii?Q?NsJ9Gjw2MgpcKp7rZiO1bnx7YIL14WtfeRPqpvSVtyxNrNKiEVTMUw2dwGze?=
 =?us-ascii?Q?qcm/o/JYHTtjyQ+DocJiAQeabOA6MmYqg1hzM5x8U546s8oANlvKQqw1xCNk?=
 =?us-ascii?Q?4sykrTAujXMBSwaG0G2PfI+rirZnjmUu7rlZHTO+Ye4DQHUp2nrhylzTYrVX?=
 =?us-ascii?Q?ak3rhRIv9JhmzupM9g7kFPeeacFQPICZ4raoPrJf6AdVcEmw/bQE4eIuASQg?=
 =?us-ascii?Q?csmaBZ9z7r/DYr29rEvgXZj9OcTgFP5qayDV9BlucyX0kvIwCb+hz13PEpnv?=
 =?us-ascii?Q?Sb+ye9jurp+Q6IyQCSo6YJ+pAw1bNfX7b0vRzdQmBX0GorY4DcdYv56T4xIy?=
 =?us-ascii?Q?FQAF+N9sUWiQvagE6xP+xnDpSddbciKCemuN50wwh8m90kFe49RThvtvQyS+?=
 =?us-ascii?Q?OjAzaFiwmMg+mwQmRU/HNKE8+dSJ/Zh0IwZXhGHZMRW+nN1vnPLc7lImNRPC?=
 =?us-ascii?Q?G/KaijWjVYFuupVd+JBp3P7UfZ8HoNiHBpoTlp7S4Vouh30otaLuA7QfJo8q?=
 =?us-ascii?Q?1JWGPbV1vEXDlEA1oTARW5l3w/nEkjwZNN7fTr6nBi5h7XF7Cfw0XoJzerRX?=
 =?us-ascii?Q?jDwZUl+EYjtoJnjHTBA/Dp7DG0eb81ihxxd0qxLbG0y8/hf95GiGsGhFc/fd?=
 =?us-ascii?Q?HLBDldv02KfR3pNQVPs8tGd06GKfMz/25O1QfvquKMpDbs+rU5yxco4mb+w6?=
 =?us-ascii?Q?zQ6qMhBYhCDqulW95hn2UlDKXdVkxEpGJn0Gbtw26/IzMizkYT/AV7WglIK6?=
 =?us-ascii?Q?doK08xlXOxTlzdrQVaOODMpRvf8Tx7tACcP2+dgPlDoyT5WsrYkm5ZOT2Ax3?=
 =?us-ascii?Q?dkPEQrxjbEkyHtOwbPEFxwirOua8wfLTiOKZrT7eKCRz4/AxUipJw6ABw0UU?=
 =?us-ascii?Q?VdzIm6k5vBZbh4TnF6ZUDLmwa1NKF2YjU5OKvIpqyMsSLdD8WBnU8CoR0lCY?=
 =?us-ascii?Q?rHiYyu1JWTUOJ4yAPlUipwyDwaEbUczGLBHUHpvfdncqsf05KriwAr9bqZUy?=
 =?us-ascii?Q?AJQhmB97sXgerbloVRIgc3W/SnRx9/TeD1xMGnVuNxeq6q6Q1ehCN8Xm9z/n?=
 =?us-ascii?Q?gO6Vqhc4VCZtE0B2RFNt9nz108SrYt97vV/mjdpOMdex5U2DfMdFyUexKUQv?=
 =?us-ascii?Q?dtDM/Q20zFdQE1IOtbIjlr9wAZFOKZcqJDUtZmw6vTrE+spBdUijqK2qcIFB?=
 =?us-ascii?Q?lFjJNCySfSTCjZgM6ojLFzPdBfGNC1sQ2OSrptJ6GqB/dbSuLxbG3a0UCMMB?=
 =?us-ascii?Q?j8NWGGim0yn2++dB6hm+Ztv3NcbQtwqusl3TMDUQFm1NUCYV4zcMHiGP49yu?=
 =?us-ascii?Q?RLt6r0DRf3WhD6dqCrwwP8brEgk6NaIhdLNWqxdPCx94o247hIvOQ+WvveaH?=
 =?us-ascii?Q?hfxUV21/jsDnOFfTiuV1XFZguS0kRZhWC2vqi5E9PElveV5EvsT07es/+yyf?=
 =?us-ascii?Q?kQMqDY2UPQgdZc1cNhLNJGxTJh7u4gSAkPuzUE4Bl62+OkqSdpunkZy9P2a7?=
 =?us-ascii?Q?pliVbS3ScvO14OiAVMRJCXLXCSkZEfNrb6EICNBh7pqLkk4H/XzWiz7krDN9?=
 =?us-ascii?Q?Ilpj6uurU9fkNpBNKT3aRKDW4ymblVpC+/QS4kUdF7bv9AB8p85mCqu31kBi?=
 =?us-ascii?Q?Oj5O7MPp5A=3D=3D?=
X-Exchange-RoutingPolicyChecked: iUeK0t80X32gl0qWlS/4trYfKTE33q/sG2Wz5pErHv+wJTKduKaZqq0m/4h5oN5nZm2xoi1SkrFJgGOgJnmTMmDklaPAWNAFcf6uPDY1qt5l9vrL1ES+ZgCizAhZ+VmKKAMFbmuViEpm4telk3GJQKXnr1Dao8P6kThTgxsbF9jkw882qyRzYMWJIbgy2bu/hNLsyKEWaHGFd5ILijAUNX1j1MsvtwOdpuM4jn//UqNmCEcaBIoTT/DZ4ouQFpkYBxv3nynGqWAfFwS9aVkiJ5qbJIuVLyEuU/ATBBNfmmczLMFH8+KH4RoF2VmogiivPt7EU5JKlz0ezl8BrCojyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ed06eb0-4752-4616-757a-08df23a1c245
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:02:56.7606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6yDKK5xKc9uTNPb2TyqKVj4sojodMbu3Mskt4XJUU8KPM3VFrXW0ybRdQdlWA04WYD52nAqPo5M7BKVxohaxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8404
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Kyle-Switch/net-dsa-motorcomm-initialize-dsa_switch-based-on-chipid/20260929-105407
head:   17230188d88553553a3648a5296554ff1e98926a
commit: 6487dda010cebf1838d44e9ef59cdf8dbcf6a47d net: dsa: motorcomm: move mib stop from remove() to teardown()
config: s390-randconfig-1001-20261006 (https://download.01.org/0day-ci/archive/20261006/202610061956.2FNvr49S-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061956.2FNvr49S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610061956.2FNvr49S-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:16,
                    from include/linux/skbuff.h:13,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/net/dsa/motorcomm/chip.c:12:
   drivers/net/dsa/motorcomm/chip.c: In function 'yt921x_dsa_teardown':
>> drivers/net/dsa/motorcomm/chip.c:3928:36: error: 'priv' undeclared (first use in this function)
    3928 |         for (size_t i = ARRAY_SIZE(priv->ports); i-- > 0; ) {
         |                                    ^~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   drivers/net/dsa/motorcomm/chip.c:3928:36: note: each undeclared identifier is reported only once for each function it appears in
    3928 |         for (size_t i = ARRAY_SIZE(priv->ports); i-- > 0; ) {
         |                                    ^~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   In file included from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from include/linux/skbuff.h:13,
                    from include/linux/if_ether.h:19,
                    from include/linux/etherdevice.h:20,
                    from drivers/net/dsa/motorcomm/chip.c:12:
   include/linux/compiler.h:200:82: error: expression in static assertion is not an integer
     200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                                  ^
   include/linux/compiler.h:205:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     205 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/net/dsa/motorcomm/chip.c:3928:25: note: in expansion of macro 'ARRAY_SIZE'
    3928 |         for (size_t i = ARRAY_SIZE(priv->ports); i-- > 0; ) {
         |                         ^~~~~~~~~~


vim +/priv +3928 drivers/net/dsa/motorcomm/chip.c

6487dda010cebf1 Kyle Switch 2026-09-29  3927  
6487dda010cebf1 Kyle Switch 2026-09-29 @3928  	for (size_t i = ARRAY_SIZE(priv->ports); i-- > 0; ) {
6487dda010cebf1 Kyle Switch 2026-09-29  3929  		struct yt921x_port *pp = &priv->ports[i];
6487dda010cebf1 Kyle Switch 2026-09-29  3930  
6487dda010cebf1 Kyle Switch 2026-09-29  3931  		disable_delayed_work_sync(&pp->mib_read);
6487dda010cebf1 Kyle Switch 2026-09-29  3932  	}
9af9a816821365e David Yang  2026-08-31  3933  }
9af9a816821365e David Yang  2026-08-31  3934  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

