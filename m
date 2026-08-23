Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FEE23EA84
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487378; cv=fail; b=DP2jg4F/VEN29I1cIgnA4+qsgjCPAY/7YjdMfjv2rt9T0y4E40hYUSsbfcCEqTamupYo76znImMW0bL3L4EsZAeShjHKnw6Gk3TJ54E9rmlR4udnM6JI4OTUL0dRSHeXrm34CcwSBmLgQUKxsXifLTI659YEsQ1shnlSBDUzhaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487378; c=relaxed/simple;
	bh=ptDz7lK2Rz2XVbf2fh71LSV3YxzjHQQAGdoJUDiesLE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ZGtg2Q1Kkcc7Bcg1+4myMZSJViR0ul2o9s7HSnco9LlDn3OJbOHCXnof/M8BIWM8h7H1fBvKonq3F8sKXsx8j7GzIg61nQsD0ovdR/pl3jqyKJDpFRIyRep5J12J7X1npYgb1mhYfFpGQwYUJmKyxgqhK+0H4N8SOb5Lbe0Nx68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m/vKUsQS; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m/vKUsQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487376; x=1819023376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ptDz7lK2Rz2XVbf2fh71LSV3YxzjHQQAGdoJUDiesLE=;
  b=m/vKUsQSI4Us7B3B7onXFuQkWqhmZ30lZe89/08EXOQyF/nvcy9alSiZ
   a0D/YINmmOlzhFdRR8FgGm6dmT/19bqei+OOc3Km4G4Bvg0K8STR1WbCk
   apQtDFXbGJzgU1totGZGRW0Hp9lT2S9TIfzizQ3hn1sa7x+p9AJn4nhmS
   L1JR4aMiKKMHeM9SFKuTyc4G6eSO7ZAtor8ARhRMMWcdmMnwyyJRjwOX2
   1+IkCwBaYh/7AJWPlI7WJx0632T7JAkBIyYjaSJkf8qvmzF3kDlYpsnV7
   koej6pQwxSb5fpmZy8VuexGM0l9JOu2xvkTCSSwxXOdjHwGoYCstPEoNq
   g==;
X-CSE-ConnectionGUID: b8QJGtA8Rmi4UmipfaHNow==
X-CSE-MsgGUID: 9TjAfPztTieNzhnmtg6Mzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="98551830"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="98551830"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:16:16 -0700
X-CSE-ConnectionGUID: /x6mcJPOS/SCg7hp4VDPJA==
X-CSE-MsgGUID: 3drumWfUSlOJrkHUl+lFgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="263059060"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:16:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:16:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:16:15 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:16:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBxEbOJYvRPwXk3lyluV0U5nexrkNtziC9OqfP8AvujDlH3bWY2QYtNhutwe6Y/Bg2+qmTEWhfyftM1K1aXwJ2MFVR9FYyk2gtXkZu8J1aQUznFYKbQQ1FlxTHqLvkyQQwkQprQFQAYu+s6/5MP06Dlxz9iwuLwITyCw40DT3fI/rOEThAB6jahIUJEKpy2BEYY4c9TA6YZCGRBbgIpyvq0Z4gDqCHD4ErLyiEwWVUAXbrPvVmOmBwEYMOTYw0T05oy1189qDzrFXIw5qofBFKXIPns6kHmlBipa9r9aiX5N7tFl52LHB5aN302xySswGEx355Sa6lyJCy7qqyzlKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dU6NkBpWM4f8P1tNqICvq1wOE2ufdaCaScT9rTV85EY=;
 b=Rkg2lKbIEcDYWopnQFq6oYsIpBfIG1Y2EIgZY+Yj3LMjeGJWXGDZOsZYgkB3gDpaaZxEYM+JQjIPNtHDUMHK3q3+/xpktO7hN7cQxMVhPZn2wFb8/WpObp7pXYeoicAD+/2BUnJkZ9iTCbj8YvdgNgCL3GiXICuCv0yejE6NYmPVmr983FpBqt8sQhUQ57Xa6yxq9N/BbdvVhQh7uVZqY7ra3PEldv+OCb4sGAk71vL0X0AfsXur8RkZPyMiHjv8XnM5xmMo+z4iFsgWLr1zrsQdFj2i6MoPN8X+KPoD2yIAiZ/vVOLlVVmll8OodQYjPhH8LQWR1WIc99qIBzasng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:16:13 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:16:13 +0000
Date: Sun, 23 Aug 2026 20:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jimc:scratchpad-v10 13/24] kernel/locking/lockdep.c:71:71: error:
 macro "SCRATCHREC_INIT_STATIC" passed 7 arguments, but takes just 6
Message-ID: <202608230503.SupGrB5G-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f69af36-7693-419e-0ffd-08df011052c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 16J4UsIicY9yLXXaC34XDIBd3jQdAJyRv9lOPhk20h4fdxXlF1SxEvo9SH2vNOeFT4At/+b/z5A9vtk4o352p+npcCef26HbJsFs3SZioADwop2i/iNVlwtRA04coy+a+1arC/v1LikheIeZmPeKB/3MO/EMUVwWelSTYqtRAD3kYIctQzW54evx36Ilks+FWfMRRrCmpEpBm7+UngsJPLNKOxn748KK09bSYX13e738yHN4s2uEARz8dVcpJUgOnGOso305IX6zJB7VgHbpysRpYNcqIPf/ANAqjvfepco+GDYsfU+ZekMe/H7OhpJ1Lo7AIRPEWnEJgEcdVZfKaSkcmwMWIBikynrGeqynGBS+NNffFa+28WKNksQc022BHjW+pgBvvlfCENal9N67k7UGfYQRxaftpQvQNcc0XX3Z0znZ+ahhPvhlyoOZfNve8MYBUeDI+P2WMbwh3O7Z8al8yGO33CrxiAj7scyQnejXVv9kUEibfwJ5oL3HLlaKRAKu3DX/tszlZxeopUjtjP2FpObw+moLnoZFU5bif6lro4dnFWrWZ1yMGqgc64MadqY+PoKsXYW3IOD6o5A0ZGVi80FKdt2YBcEWuib57Qp/laLCpEqjupe0i5m0JXwvm1sIeNjDZARwXvCTxhNliWFEl56JSvu/JSm4URaQq04=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sG7XM7AmSJFnEY4jWylcpc5ugDCdjIfbrt7q6O6sy0WzE6chr869xs5YruGa?=
 =?us-ascii?Q?36C1De4Mwvxj8lQXry1Z5SVOaZleSq64l7j02auiF6uGjIZkon2876f6mPyH?=
 =?us-ascii?Q?3IZwMMq5kR2HX4BqcdcekkQ2fQp/nLTo1fawLsZj3PPvV4gCNwGRbHAWCmAH?=
 =?us-ascii?Q?NFPB1x4Ugaj8vIIfbth1pOu5cd3s9ChjX/cfTG3ygqHHIPWPv+EqIlBiz5qR?=
 =?us-ascii?Q?8ldrM2iPnQtWSzEPK0oegFF4vZRt88azrTZplPIGcySO8PgiRNP4zTvFsp2w?=
 =?us-ascii?Q?fMYQBwiEajwEF35WJ0TmlmymSHEZ8QrttFknIKwaAV3EDKoK1ETSfjPvn6Bu?=
 =?us-ascii?Q?KLz0fG0k1O58V4//b6d5XRuVEU9y/sP2kNXnTS4V5qLZPAM54yeaRX8zht2N?=
 =?us-ascii?Q?0sHIwO9gpfsMU65YCBoEhQqhINA73kWomaMQedwjErTO1ZY1DJzokkaYOEpd?=
 =?us-ascii?Q?T1mu5EyZNbAve9CZZTs6heGje1gc/WtiK3Yt2+lx7QNbomc7IfUvdBlEk752?=
 =?us-ascii?Q?/UBRnB8ArIM26Kvs1YORYO1TXZaUZ9jQS8WKE1gcqfCRmBh9ClykY6ykAstp?=
 =?us-ascii?Q?RT6WPUjD7EvK2SLA7msVwDf99nzD9Q6WxkyGGsgUZYK8xIuAi50C535H22uk?=
 =?us-ascii?Q?fDMm7njLDUSxE9JF1zOBhXiK5BwHWVUcVjxnjJ2H5MKOdN70UpyS9EXCed0m?=
 =?us-ascii?Q?czsxdePjhdXa4uxEtR3YKB6uOppv+1DlR+N3673u9sHdXX+Ifsq8OlhAY7Ar?=
 =?us-ascii?Q?DPmM05kE1zpg3yOVs7Ja9GvC6UE1u5IrzdeFbX+TcPE8uARN3eipOS3lM4eW?=
 =?us-ascii?Q?trXYGllGCBcoooEbQmsADm2eiXGaEp4gbcbuHmPR8vgPjDepYpIK7tcMbp8i?=
 =?us-ascii?Q?smaapzs03DNtC0OgFrB+oE/Hn7pMmCPQdkHb3Jnrhm+niEbma/a2jS72cWIq?=
 =?us-ascii?Q?cITj/o8MqSJOgZB+E9/GZ7gcJY8vHcwt1qaOocBbLiORwp9GubCe0mLgGfKY?=
 =?us-ascii?Q?I4dOEe4OswTMZeWbIs7rC/6t++rLSTtrCf0DowHnPIJr8yKKIoE5o8KWNlg+?=
 =?us-ascii?Q?5d/ZmDnbJvKlD4/RldBiNttsx68RxkVgZV9NzV/A+X5y3v2GGa244duQUK56?=
 =?us-ascii?Q?AL71dxmxgSmeKLrGC2jqgiXpfROXuoGo5C9LIYknmumiS649Lgv/fiTHU2i0?=
 =?us-ascii?Q?tEUq3OnyoPlB0Kn2zu642PpjqGt+Zt4tn0B8XM+4i4sAAU0rmofJ4lAs0n4u?=
 =?us-ascii?Q?N56Gbz4GqIXoOSxIWfLc5wycxgsbUqAvNLLLKOERpEEyWEz/PWLapMi8cbtq?=
 =?us-ascii?Q?LFpQV93/vKvj3deq2grUr3LW01Ke9hDq9B+fhBcYnp1Ox4G8dywX6jVovBtz?=
 =?us-ascii?Q?zJrb2se2zz/walRYWrGRwaIVW+3KhCtWMZ0MdAeXBp4uqOxIpXyNZhB6g/Mr?=
 =?us-ascii?Q?CLSP4fD8UaXZKrdQ8Q6ff7JsF6gr5JuOmhU14aHzrTZvnSp8oHOVC2w7gRuC?=
 =?us-ascii?Q?8h2cUHnOIdZhgjk5SQRg3hy6HynnTEmHbgQXo0/jlHXUHm5MjT0sgfGrYhsC?=
 =?us-ascii?Q?kpTEvFHn8b+B1OCGWfESWp88+3iuTxuuHcmGi2SWyK/u+nw3k1jng4foGtA8?=
 =?us-ascii?Q?Z3NAgwy3ru3DhzR4ObEg4Pl3jlF8wTts6yf0qs1939JAQbC1tn4LlJSJCQcC?=
 =?us-ascii?Q?5BtG3kE2FqawEA/OctwgPm82PPPBTlhTy2pzXlhOySpbna0hgPHJaD6K/oro?=
 =?us-ascii?Q?AIoK2tsUkQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: j28BGBgjvevDUcuirBIxL+wQJ3ev/GZjzLeLAwa89sLeRE7M47DOd7nujQV71WjcoJIkEfNLkNLN5Qu9GYMgiYThvkDhPXdo9tWSUSj4YYuKAPgGXrpw9TpEGM109gYBYS/QkEG3JBU7QX1i8bq1FiLEdodZ6SiixT8X5NWtssrbkQVzm8Abk+rO6cN03l3pnJRlk3Sisqw/Wnj5Pm29V7GosM2Aowj0D2DSx/Ynr79AMv6I/sgKNrMIxF1r5vCQ2SRXUYCvReJX3yfdcxbRSaeMJAkijcawUNCHT9E7fN23aJPb8CGAIDYyCcY9T9PEiNSDnPaHTsoWlJqZC9b2Xg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f69af36-7693-419e-0ffd-08df011052c6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:16:13.0587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EK3LcvHKS4fTx630xmqsnBu1SoXJXKfXforpyxmqdnnypayLlsCpiJ3v/k0Rogd495l7I5n52CFyRS4fZHoxxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
X-OriginatorOrg: intel.com

tree:   https://github.com/jimc/linux.git scratchpad-v10
head:   a23fc077806416450fbeb0a5a534fd995e465430
commit: c64a3f08a0141ea44aaf52cb647a97400c5e1dd0 [13/24] locking/lockdep: Allocate list_entries from static bootstrap scratchrec pool
config: x86_64-randconfig-006-20260822 (https://download.01.org/0day-ci/archive/20260823/202608230503.SupGrB5G-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230503.SupGrB5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608230503.SupGrB5G-lkp@intel.com/

Note: the jimc/scratchpad-v10 HEAD a23fc077806416450fbeb0a5a534fd995e465430 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/locking/lockdep.c:71:71: error: macro "SCRATCHREC_INIT_STATIC" passed 7 arguments, but takes just 6
      71 |                                SCRATCH_64K_ORDER, 0, &lockdep_pool_key);
         |                                                                       ^
   In file included from kernel/locking/lockdep.c:61:
   include/linux/scratchpad.h:360: note: macro "SCRATCHREC_INIT_STATIC" defined here
     360 | #define SCRATCHREC_INIT_STATIC(name, _elem_size, _static_buf, _size_bytes, _min_order, _key) \
         | 
>> kernel/locking/lockdep.c:69:9: error: 'SCRATCHREC_INIT_STATIC' undeclared here (not in a function)
      69 |         SCRATCHREC_INIT_STATIC(lockdep_pool, sizeof(struct lock_list),
         |         ^~~~~~~~~~~~~~~~~~~~~~


vim +/SCRATCHREC_INIT_STATIC +71 kernel/locking/lockdep.c

    66	
    67	DEFINE_STATIC_KEY_TRUE(lockdep_pool_key);
    68	static struct scratchrec lockdep_pool =
  > 69		SCRATCHREC_INIT_STATIC(lockdep_pool, sizeof(struct lock_list),
    70				       list_entries, sizeof(list_entries),
  > 71				       SCRATCH_64K_ORDER, 0, &lockdep_pool_key);
    72	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
