Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232E61B6D1A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 06:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775023260; cv=fail; b=VN8Xb7Xibu7szAaVvSiDHnzJDAMKe4cFeZ54JrBlegn/YoCBvNAzkk33lcGuwCuFhqFdfF+bLBMsh+BQjrrV4SLA/Rp2EnWjCYe//IzsGWPbS89p/wNVWxZncU0qlStN/n9xo6XZ2NCt6UF4qz+VICxS83uUkPalmLN1l75lhOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775023260; c=relaxed/simple;
	bh=Dmdcz9au4Nd7MABYbuD6bTx99jaibl8vJC0J6FnkV3k=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=P3stL6HEmcT5P3iRRKvHl25cvz+0+7C46fZTBylGtsrHORLls0b6DCTbpr1VIugvuDTSfAtGVlyur1wYI5D7PH8oamcvTDNzzoFiHCh26Uv9523BHQDCtI+4CZnMzdnOoQyu0wxKyomNf1ikos8ZHirhlAB0O+b7FsjUBDhBcGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXlHKd2x; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXlHKd2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775023259; x=1806559259;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Dmdcz9au4Nd7MABYbuD6bTx99jaibl8vJC0J6FnkV3k=;
  b=PXlHKd2xyBjwSogQYuq+Jwl5d8LFYeGP2TUH63bUmdrffoAXpxtbq272
   0FHZYBEIWPm6Rx6At3Ewfysi+2K/pZSTZsVzpqrRwZtGmtgi6z84iYgy+
   v6+vAir9iERcorBCMLaUJutSxb3Rknerg+lcOaWpIocr++Vk5W65lqW/M
   svttI5bS4QHCCRjqz8RXJ6ARMGv3vtpfDAzs7udJYSEbG/7v9iV+8BqEm
   jOTedP4dRmMf8VymPS+HnXum0TXVux+okenTFj7wD6IPcf89NLzsc80pX
   mnQDMhObEvpg1Kh/vxcIEYB8WlXQUv+OfC9/jZUIwI6dBpaQfTZRhSsFl
   Q==;
X-CSE-ConnectionGUID: 2TtOgl6qRveuiAna3wso7Q==
X-CSE-MsgGUID: SxR3jdmzSceQfebLFyIBfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76111611"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76111611"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 23:00:59 -0700
X-CSE-ConnectionGUID: TpcbKja6Qd6G/nSnoI/VaA==
X-CSE-MsgGUID: 3jCLOuN1QF+sGVxzhrvcjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="225749018"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 23:00:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 23:00:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 23:00:57 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 23:00:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoPlA3BviPyOA6YOmVKw4t9Asa9+TNZZPjh8ESOvJaDcLb7HU1b/1AVa9HsGkbs+jogy6ctwNir7cgZ4/pjeCqZrBPMcLuq0HlepGKiy93j4JmVPhn8EZQ12isXFMfAZRKGHi1HngYedqqU6Nt1ZQSVCbjVfYsLScwYhogUl2OEuOb8W0SI0EJZxkiqJ7POoIMAhja/r+e+L+sFMHcg0AW9HrW74xrycHLbK+3Pdlc22R7qF/8ADbR6ohFjDoR1v27br/OFB7AuiyNvVKlFL3Tprjc4lzeH3XfQOQhoppZlm7QOpe24jXR0eXZIcYNtH4wTnO2O5sVbxs+XETnCPcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VImgOXYKG8cQO/c5JioW2lFE7ST8FTV7JmslOIF65LU=;
 b=ZVMqLxkvaqW+81LP5UmsBs6pcGyCL/ASvjQe3vRvou5H3sSlpfrZG9/PqUPatM4l0aGo7QSJGz2F++pH1wpzPqD7Z8eC9oXSzG7heJDmtCEf3QkIoO2EolUKQ70PCZd8tSflIyF+o3yKF8X60CcUr2R3hOu6Mj6/fZuSHl8m/zp46zvGVxOs4z2KyFBAd5aOannD55EaRGtvHTsAHGE0+HBnPuit5iG0iAQyqRFUM9D93VarqA4ByNvyKiw4TOpOQezEDwT2hv4+uouRFNu5USUtZqhzAs2Z4mHJzVj022k1/Fe6LCHPKBRfFwFmHdqTF/zNa+F1u3CvLsfAzzz0aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by DM6PR11MB4705.namprd11.prod.outlook.com (2603:10b6:5:2a9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 06:00:52 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 06:00:52 +0000
Date: Wed, 1 Apr 2026 14:00:42 +0800
From: Philip Li <philip.li@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: kernel test robot <lkp@intel.com>, Chunyu Hu <chuhu@redhat.com>,
	<oe-kbuild-all@lists.linux.dev>, David Hildenbrand <david@kernel.org>, "Linux
 Memory Management List" <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 121/130]
 tools/testing/selftests/kselftest.h:427:13: error: implicit declaration of
 function 'vasprintf'; did you mean 'vsprintf'?
Message-ID: <acy0ikxURKLJfTCf@rli9-mobl>
References: <202603311105.ysUeYPSZ-lkp@intel.com>
 <20260331112341.83f62d4d4de710457ecb59c1@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260331112341.83f62d4d4de710457ecb59c1@linux-foundation.org>
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|DM6PR11MB4705:EE_
X-MS-Office365-Filtering-Correlation-Id: c71e5713-a982-4530-2847-08de8fb4079a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: lcbW1uE+26yEOoqporJ8hYyi6ArVJKTMIsk/cR01Iei7TtEk3kpWKVcX1jP2hIVJhoC7coNkycwAU3qOvaK6MB5dU3wCJ0AxM9/Z9VzSvguDbuBwbAG8O6lk8NDeEleb+naMLY6knlsmXlkHF81dG7wSwWXaaVFKnYlCg1J2+wNiXEBCR7Y/PQXBaqzqdyKvrbswZsHrW6pSGVQ8Shbl6LXHwg7eodh/5O/dIeWIhBGw2XOWlOM1r+CO2bxTqFPDbnrvO35WFJLkFiQw58VXoXs5pBHpUF1VcWXKLdJTPMtJIrOGqopz0MKaitDclqL43NDASNH24g9lUgggwBU2VJMEapuhfCF5ZWN/KRAnXVSuSupY65EJfW3iQXbGKomIFcDWrCppuAR87uhX87wtTDkSZ+7AMhKZBwOv4LQGD43XpNWvlXy+ujh8l6AEODM+FjsruvwVgkGKKLTkrj8seCJYViW2SwEHgX14t7IsC9cwRrczdsfeQn44hwNccN2Fr//C9IdNJmdlsiV8o+RQ9kHbqa5ymiL3yNUaboAbDsqUfvG3CuGcCJ4WW1LsB6wPuqSLi0B4AO1Zcf92dRzYEUJoGS+mF9U+bkoAPdPNW9EVOR+38miq52GY+pseVausswqx1CMOP2s2kz4XICH53HlEUNThu7IA3X6JN4oLDjN0A8PuTJkmSKl5Z9re1LPb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XymhsOeS9a3lQoT3C6VMqyg4GhFZfI00LIHiIDv/9ItQdDqZWi1R1TjgAkLc?=
 =?us-ascii?Q?a9Vt0RisGc2WzAaa4yci0U/54xoH6Ijqo64yUVHrqxidLZ3ZXyfwuVO+hQHI?=
 =?us-ascii?Q?Bfr2NRmtvjyGVQHonVtJx+pSYUQBGMyXtgBs+2zMRHtUUgYVMEpHfglEKRa1?=
 =?us-ascii?Q?MpBsS6v0ydkKJkDjP7sYMxiK5fp2SxejYBN2n/ow3aob2bU6zPRsJkf/cY0Z?=
 =?us-ascii?Q?meLOxGE+DzPiJPPJ2q3eliyY216tLfPHARESybLGxnvfGSjAqs9xPGXtq+39?=
 =?us-ascii?Q?3ReEwwBLAF8QDks0UbKDum9nSOQ5EkNhKpf+q6kbeu88ZhnESYnvx/lJxvPm?=
 =?us-ascii?Q?HK8ZlYMlqOrjUyqqnA8Wo5PGb+pq4J7tdu8ZGaEEOj5k2vrBvhgfQspNHr/F?=
 =?us-ascii?Q?JO4u7PX4t5hUQcKDHH66ZnCdDIr+sHMZu6YFFkL6SOFPIKYd8kx6iVlWD/5U?=
 =?us-ascii?Q?07wrvaCbjx36t07ZO/PU/ePqn+lkJhqYeAvj7A7XO+CeRMXKLY8KH+TeMMCj?=
 =?us-ascii?Q?mOonYSZKlX3DkJROS878jofD8BDV9hGzgfAqKVtvsMYHWq4FQwXvHt6FwdRb?=
 =?us-ascii?Q?YBIsjG3UJRK4siEfn7IgYHwqNLQnRD4htnpsZyXj/TWQJIiCyWz2dq02SyhJ?=
 =?us-ascii?Q?8AQmwlUhfRee4zUbg1jqaBEl5So3SD/xQj25j/72T7vqXTFrUNFbTh9EIMps?=
 =?us-ascii?Q?fxEOCtVqGjLAQqS4ih/iHddEkkZF9hMH9qNVYXazi4EgbslSaII0mIDxWdIc?=
 =?us-ascii?Q?o9ubxc2JEYt6uJfpOdUhXs7Oz2EbVXRratjYvsn4PdAd7i3zdjBSAn9rJ52c?=
 =?us-ascii?Q?Nt5Kp3GVYaHxpYNk0WCHWKLaXfSLgnOVVxgmyiJDLm4cgEfrrp2bnvsQXho7?=
 =?us-ascii?Q?UTvixEcuiIWBuIOEnPn1yK9Jo6Nsv0Hg9svIkRhYUGEm7d3WJ4H2FSIGX2/W?=
 =?us-ascii?Q?RqjK1mJIGor+jRRMLS43rtJRtUr60bpUQLR3yW920hw/RmFNUf6o4GNGZ/x2?=
 =?us-ascii?Q?HQ+cwmMymw2HK0x40V35jPxYXWTlf/fZ+2LASSrH3bVsAQ3JvenGa3103xaF?=
 =?us-ascii?Q?7tn+QT7DAVKlfhPh4X/ApjFlQB/CnqwSlXvde9yfyrv7eUYo8JEHx5/chP3H?=
 =?us-ascii?Q?ZD0pFbdXMtmzM0qGSzpgrwlyuNlHIHoNIJmsZgO1qOeDWgv7iFoTcwUBI8Ve?=
 =?us-ascii?Q?dXtMtUp9V2RhA6CB6HQ7jxPppTpBNMijo9kUu68YG0rKt0jioFl65aZ69yQq?=
 =?us-ascii?Q?htnh0OzXvQZmZzX3BLWw5JnSoFSXg7aSLDtMlgSvTbURn+NN9ifoRcjsMzw0?=
 =?us-ascii?Q?3FWq4sWkEBlOE9btawBSh7nifIbwa+Jki/SBCNmCDUEts8TdWwiqE/ktV+0b?=
 =?us-ascii?Q?ofzQRdB+BUUxrhc1h6CjB+VKx4A8uZVTH7yP6G210qGgsuyfNORzwkSlY/Fn?=
 =?us-ascii?Q?9WgaaKMsceEx5hMNcs6OmlGJ1qLcj1ZuB7prg/4N6j8RshzWYA8gGF0A3yuc?=
 =?us-ascii?Q?vdJIrne36XFolBAcdvzoQ9q0e4X6TpNQsenowFnkJE7/U1qbgkFwA7vTjyTT?=
 =?us-ascii?Q?rIiIsufhVtxGGOMaqSNp63gQmbbaEBy61Eysz9LtGOTCPDZLIfz6COAKiZoj?=
 =?us-ascii?Q?6vYiSkSIrPPV5SGLXK3R9b002jgswCjO5t9UPCYro/JWkSy5XknBeR0uSLhY?=
 =?us-ascii?Q?sTXeMgVKPv1/awZ15BvA4oj3sTkfyG1XQGECL/KhZmZbIRv9HqvSmqLMiofh?=
 =?us-ascii?Q?FgQU0c3Jug=3D=3D?=
X-Exchange-RoutingPolicyChecked: kjyKk3qwbhXgB2H/lovT1tEV2ixs0qK1PzALhaZbtg13bdlPnNJnE9ozhctUAtNHJGC5yQNM+7Ui5DSjjGbk+VV7EcgSLiIH6lxMQLFOyUpyTvyDdaFjkpjdaeGctSpVpvz4TcYcOp9nH8Maec3QVUP44+EJ1INSrH2yyX+lIk9C59zc2BVjlGPV6GlbnbII3+VPpsiUJUlyaQpGonIWo+TyzyIODNgMpnniVdscIDHeDFuI66mJiWOF0KdmZFDI1+0QMzGfVV+OninlxLlAPq/HjyX6fzy9T+7lTKp9C+/b4xiHGvTEziQB9nk5Wnt1hcoV7kXRndtpM0+aZy8RHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c71e5713-a982-4530-2847-08de8fb4079a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 06:00:52.0850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xi5RaG1Ohh0KUzrtUY73MTyupZcFl8fepozphg4L0jvveEWtRs+OIrctB4TIi5tvPkoC/Xuk65QmDuiuVTRY1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
X-OriginatorOrg: intel.com

On Tue, Mar 31, 2026 at 11:23:41AM -0700, Andrew Morton wrote:
> On Tue, 31 Mar 2026 11:27:20 +0200 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > head:   24e341657c283c965e3bfee0baa9ed0376127973
> > commit: cc0b04b10a7b98fd8df2fd539177e94e0f83a5c3 [121/130] selftests: ksft_exit_fail_perror: support printf style arguments
> > config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260331/202603311105.ysUeYPSZ-lkp@intel.com/config)
> > compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311105.ysUeYPSZ-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603311105.ysUeYPSZ-lkp@intel.com/
> > 
> > Note: the akpm-mm/mm-unstable HEAD 24e341657c283c965e3bfee0baa9ed0376127973 builds fine.
> >       It only hurts bisectability.
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from za-fork.c:12:
> >    ../../kselftest.h: In function 'ksft_exit_fail_perror':
> > >> ../../kselftest.h:427:13: error: implicit declaration of function 'vasprintf'; did you mean 'vsprintf'? [-Wimplicit-function-declaration]
> >      427 |         if (vasprintf(&buf, msg, args) == -1) {
> >          |             ^~~~~~~~~
> >          |             vsprintf
> 
> What's going on here.  vasprintf is a GNU thing, but that isn't it. 
> kselftest.h includes stdio.h directly so fine.  I don't see anything in

Sorry for the confusion, the build logic uses nolibc, which causes the wrong report.
I will do some learning to correct my knowledge for how to build the kselftests side
and update the bot.

FYI: below is the detail make command used

	aarch64-linux-gnu-gcc -fno-asynchronous-unwind-tables -fno-ident -s -Os -nostdlib \
	        -static -include ../../../../include/nolibc/nolibc.h \
	        -I../.. -ffreestanding -Wall tpidr2.c -o tools/testing/selftests/arm64/abi/tpidr2 -lgcc
	In file included from tpidr2.c:6:
	../../kselftest.h: In function 'ksft_exit_fail_perror':
	../../kselftest.h:427:13: error: implicit declaration of function 'vasprintf'; did you mean 'vsprintf'? [-Wimplicit-function-declaration]
	  427 |         if (vasprintf(&buf, msg, args) == -1) {
	      |             ^~~~~~~~~
	      |             vsprintf

> the later patches which could alter this, so the "only hurts
> bisectability" is inexplicable.

Sorry, you are right, this is a bug as well that the bisection does the wrong judgement,
and the same issue also in HEAD 24e341657c28 after manual check with this nolibc build.

I will look into the bug to fix it.

Thanks

> 
> I was able to reproduce this, once.  Now it's gone away.
> 
> 
> And arm64 allnoconfig is a nuisance.  Now my vmlinux build immediately
> faceplants with
> 
> ./arch/arm64/include/asm/atomic_ll_sc.h:298:9: error: unknown type name 'u128'
>   298 |         u128 full;
> 
> With the latest 15.2.0 kit from https://www.kernel.org/pub/tools/crosstool/.
> 
> 
