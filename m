Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F6E1448E0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 05:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786859474; cv=fail; b=IlWkaS6uJxqrya/vUUXazO5yJhvAV41dxEha44x0hKnjLsyzSSzq7VCkqx9jWzZySCpIXPvjiZTiPjTTVIzKA6+t/uTu0d6o8BFc8aVPVoTuKj3r9fqV+h9R3qLJbGQw7uPCZtDuOYNfuBfNULTS7J03TE5GIkLQuOVZF0UhdRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786859474; c=relaxed/simple;
	bh=INBToZNSIkXP6iDgCGb2WP6Yome4kI8tZQ0hpUs4KN8=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tYSceCFQyVRLnFQFIeSgC4/TQfXqIZQolr68E52MuMBK6D8YLUAFqJK+ItFZO5Rw9jBL0vaqRQwKcKqL7ETfNq26TCGEld3Trp4uc36UcIlik8RUdwHdl9ePr6gflD/J5h2CmyW/CPB8/g8XQ6CvL9iIrorjtVTbdioaBBI+NqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBzE3YZH; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBzE3YZH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786859472; x=1818395472;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=INBToZNSIkXP6iDgCGb2WP6Yome4kI8tZQ0hpUs4KN8=;
  b=JBzE3YZHV+tOgeBFnUgtXuEc0+32VIvzofhIYHAehYEj79tV8kv6AO+T
   anmSP6Y9sS5UAEQChOCUpWesou0CX4zUFfkmy1WNvgcAEKexM+E+Bu7w2
   1JWCyehozQUPzLI60dQ68gASthoRkron0EvpeGsA7cPhSlWu3MnflkNGN
   Wc7xD3Ki1wHpvvtgMJH+BzSVCl688XvCqmW1xTGfY/B1RslhoEtCLT8N2
   xWAaQ63wzZM1lcdW+orvwbeISi8a1OSbrireDS1BUkGxy8VdR+fMxzo4j
   pWw7lpIqUghoLReQu9CMwyFv9O/r05F/e9GvSNxmq+4TDrIi4pMG27JK8
   w==;
X-CSE-ConnectionGUID: cdGq8pwWTrKdIk0+n99Sgg==
X-CSE-MsgGUID: Pdf38Mu/ToO7BT743T0hhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="87392327"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="87392327"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 22:51:12 -0700
X-CSE-ConnectionGUID: /1UAEiVNSwSf8oqN/2KZ8g==
X-CSE-MsgGUID: eZviEAEmRnKgFWbWuIqc5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="260825470"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 22:51:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 15 Aug 2026 22:51:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sat, 15 Aug 2026 22:51:10 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 15 Aug 2026 22:51:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHoDrM0eceQ6RZn8NdBJTp6DBNiScM0pGwBOtqwB6PYzqq3NlVijARRbCmfObr0Lg0G00FVIzT2Y9GJIc1+HDCNqNryzH1uDS0MK+1ZpLHYQcjhdmGfbmPCDwWWycYCsbwUOFkaKqa4IbyXJ3V4TX3X4MnHFMvpNXxc1gX5D7T+HQ2fM/p/sQpnjSlpw8z/oJT/IyzD682f8KY9Gvne4SZ0pvmVtM2M1V9v7cfgHatQuUEmtOU/rZnJXyVAynlPd+dJF0m8bFGCtLP3b5LHoxalwuGaHa/JdFBD1L2Q81qToW64yi83qkYFBv/Ifnar0jewmR+fUTsO8kK/2myIktA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I30tEtckff2FuE6JwayL0CTeDOz/u9M/6Lwn+cJ9adg=;
 b=J4EIkenSvyueBa8TICNljXfU41kN8XtBv6WfqNxMhoIFmR+Vl9VMlFEBKNvrWkzNMW2VEt+9NRte05DG6ZSkx12UQYK8kkSzI3IROdWE1xiP/dVQ9+705G0a6uNpaZHnUXRfIHA3na30oVSLBHp7FilCMI+0JoHck9KRsYBvj7GPCmnHuJ/x7ZKLdzxd44pK0UXGuYnDHzRIgTetFUOlsnZ4X1YpkG+ZMVtrUied6O6bOtS6arP5UBktI+JQcxfBfuxXDHN8yUYjTewkVqNHIQJO00VpyOdtXbDN11RZhDgnuyohOoZj5yS9/6DGI2Y4KapApF+GWULNjxLPx3/QCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH7PR11MB7550.namprd11.prod.outlook.com (2603:10b6:510:27d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Sun, 16 Aug
 2026 05:51:07 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0315.016; Sun, 16 Aug 2026
 05:51:06 +0000
Date: Sun, 16 Aug 2026 13:50:56 +0800
From: Philip Li <philip.li@intel.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
CC: kernel test robot <lkp@intel.com>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, "(open list:LINUX FOR POWERPC
 \\(32-BIT AND 64-BIT\\))" <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	R.T.Dickinson <rtd2@xtra.co.nz>, Darren Stevens <darren@stevens-zone.net>,
	Damien Stewart <hypexed@yahoo.com.au>, Christian Zigotzky <info@xenosoft.de>
Subject: Re: [PATCH] Connecting the SB600's i8259 controller rather in
 pasemi's pci.c than in pasemi's setup.c.
Message-ID: <aoFPwEi0iQRSmmSu@rli9-mobl>
References: <20260701125941.906-2-chzigotzky@xenosoft.de>
 <202608142355.4AeDorvg-lkp@intel.com>
 <5ad17e60-7c02-2cd9-7cad-0c14896b8f3d@xenosoft.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5ad17e60-7c02-2cd9-7cad-0c14896b8f3d@xenosoft.de>
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|PH7PR11MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b53bcbf-7083-4b6b-b928-08defb5a5d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dXITnYDPnOtPSUCZyIwhRj1LOVsy++2pPawTzYeJtlyf5gZiWHEwJW0hVZi/GRwLh+TcRy9Rzh0PIHD6+uwii2VA5xUeqD2I+J+Qo4j2lTjCUlm/Od6LxYf2FufxhaTTsZk8QwhHkeb+mw6/k/TTZkINYOm0L+XNYq2U00ffIlzhMT5UUPWz0bnHU+jFKu+ovmldCdfYk2Ekem313sdbHaySTX/NGw9/+ij2y+R3hW9O2xwWTZOKkDfzvK21UdsN+NZdI5GxnnWSJTCKOVr57nUf3dijTKnrIw5eZVQW0fENFpQvdo0n19Ray2lpx3AU9FMwJM5qllNQGqs8SWzMaakjkxpqvv5vj09sNQs94jNqMHDfYh/N6Sb/fYGiWBt1ibqn4d6k6NKKG1xeFn0UEKsCPehXvJIiKhmIbiytUoNLdEpa4KJcsu45Bi9hnBrodrw13l4Q3YPByFb0qdWtYMApkqAkliNAlzz/YJPdfnoCmOiDCVPDRs+eSpLerWh8ruhBzYrBTGvcuxPHpH8yLaYqDSbiABu+zi6YwyTMe0/F0h42thzgZjSnrz/HxYys2sl0BPL07VRMqNEtSZ+SNZmHgexgHXA7zYZdvAEWcFq/7pAbTG7ucwNf6EX4+Mcw
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wnYWviv1k2jMM1eiUM+JQZfhj4aTXsbxijKl2UFIlKzezQw78+IaDACN2Yr0?=
 =?us-ascii?Q?eo/W154aKOO6A0coYJUwLlK048fPrNBa/C8vv2yMZ0oJVXnTTYGRACT062QV?=
 =?us-ascii?Q?vFh3JLifN33PScBCDpGZ4RK6HSlOtNoiU5R7vAfzcH3pAHhVNmjQozByi2bX?=
 =?us-ascii?Q?cRFtD+DwRBqqveQMYfKE+sfCOze9zCbzYyptWHpUjnYDAXmhvNoK4YNZHofw?=
 =?us-ascii?Q?w3MlQGIhMmS2fp1Li1g2TQAAIQG4K1kGjC7ir6yX/gQwnzfrbFEcC2ceew6x?=
 =?us-ascii?Q?H/4rco5TJG5xjdvyxFF6CGrwLDWK8tc+K3Y0eLhAEfK+j9aqZOHg4+NfMCy/?=
 =?us-ascii?Q?vrBzP1PcMYFS3/VNQnfzE8LZ3ZFtxI3m38Z5ppRriBUsBwzytzmSmmxWur7z?=
 =?us-ascii?Q?yl/YFXPk1SWXL8vrhXB7xu+1ad/wDKqVF0sNdNZ7Vq7GloZbLf8fnAUnV8pk?=
 =?us-ascii?Q?Bj94dN4lGNbF3xJ5h9if5JKGn/kZObcFpplc9GkV25Cr87uEcBlyNl4SnYvF?=
 =?us-ascii?Q?C7nMXh4ZSGSqannVc8IsPgSXL9jnU/S+PsMkDEeiUZFlKEAisSfXf8HxyDj1?=
 =?us-ascii?Q?B4d+Onl09nnxEhaTeDAT2jSgJ+NWGX1suZ9coIRvin+2rs4U/b8MYmnAQUvx?=
 =?us-ascii?Q?ja04uqWbevd7Gq+68/PV1m5HePxw9NPx5WsfNTTIasAzsG742QdkcF0K1qc7?=
 =?us-ascii?Q?vpPu64CYlTSMquyM60ngTrUwrKA04q9FOOZ+452pDGZ2RV1CaC8MN/xRUVG+?=
 =?us-ascii?Q?acLBKV0xaQGXEKq/QwqXMCHpLQ0SJFyeR0F+VLl6dksGcBa5+sWc6YAcE0Cf?=
 =?us-ascii?Q?XJi1TPbf1sjsBwY7Nw7GT50IcftVcuzy3KOf4pPJ7P0grmY9hZLXDqKdo21z?=
 =?us-ascii?Q?v+6Frw9JUsDNmxYDa7qixjjXxXYpCRVWNjGRTPg72hkYSVpfzXp2b/NCdBbz?=
 =?us-ascii?Q?XMgcrojCekzP/ZbMncjK3A/ZWV8rAeW2eJyoT92ug0vE4Y0dcGyxsjy3+hy0?=
 =?us-ascii?Q?M8pW+/HNZxbcT13R2i/CoqdftHo35a4BMAVNum5QAXLUIqxgOdhYcghM7lqv?=
 =?us-ascii?Q?d2+a10loFeKg9ftmqW+QS+Be5EPKRx9hNz2YrildfGtrhWKi9NRhFZA+GjiS?=
 =?us-ascii?Q?jDgr2G8KPzEVSDyb1W5OeVuH82Mk96W/UmgTdOHe2ci+BZWchylp07P1E2GW?=
 =?us-ascii?Q?715mwpQ5f8X88hFuxhBchtWCQ68BD20FWwA1K3yJEXQGdxC3JxxKD7QLCHXf?=
 =?us-ascii?Q?ChwiYgRQDoXxUrWbdhdgBWMbkPsrP5yE1XUQKPmq7pAAXc8EfkF9H2Gbs4Nt?=
 =?us-ascii?Q?LKDi/GpyGQrJxcnWm1kDfdoexW36jcRDtCtItCjbpVbmGtzwBbzUJxqGa0JQ?=
 =?us-ascii?Q?TqCF3hh6Zv4jdPwE48JeQk4nEO2TwlZRJVatG2DiGEjOFrnm/DXN+uvKpaG6?=
 =?us-ascii?Q?UFpQ1ikEgTBYMfYyDQgIVPza7eBKEfKvqKf8IfV3FLHnbbwV+USBdhitNTvS?=
 =?us-ascii?Q?JMoE7F34P+FZXVFNo/FPvjxxa3xBa8YazWYAQCWQNFIawQ8gqmtKUAucYUvT?=
 =?us-ascii?Q?7hRoZj8LjAKUMBUgZwBpHeSouCFuGhX2zTx1rNY/mLCJ1QXdYQcBJZLWmwjV?=
 =?us-ascii?Q?flp5qqDr1N4xJ/3MmFX72dav3PUVR5Sdae15D5Zncx5okxFcuJEWooLaBzyJ?=
 =?us-ascii?Q?uFuMwiq/C6Ew2A08yhnZM/AL9CY48r1nnkt2cL8SJeXs6Vl8b6JM1Lun3Hdd?=
 =?us-ascii?Q?7n2/0sJqbQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: ZMXh5+nJS2ykuty7m2NQ9EM6dy4CY5Itho9/K/I9dt+R1EufSm+q0hVLdcW3VP+2XVLwRPFhdg8ZHcJkr+Q48nI+SxHDpdV52vBybGFZC2paBIlc9AIFgIEqyfzbuObJL1INcCf0fVQkWF+YUW81dSh1wvmfNMXZRMYFS9vR20IflvfrHJCcttbgFGh5Gz2M+ftDlkA/k2Mb7e1FPigrdZZxvJhvKmIHkwhuaKRX1R3G2wB/Nc76Gnao+rl5iSy1rtHRy10yN2r8jVxXS5odSHW5otgxdEBqlzPzqj6CSQc7u4zC1sE59UcRQq9UEn5fob3YAyJRxgT7GOUcQpIcGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b53bcbf-7083-4b6b-b928-08defb5a5d7f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 05:51:06.8643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16ln+z7ZI9SUdj2rgrkaOKKKXmHEMYhGv1S/ZT5Gfw63pWFR7NPItmIB7sqj3DByF9qxAIyBP8yq/tqWLvOnMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7550
X-OriginatorOrg: intel.com

On Sat, Aug 15, 2026 at 11:56:56AM +0200, Christian Zigotzky wrote:
> On 14/08/26 17:42, kernel test robot wrote:
> > Hi Christian,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on powerpc/next]
> > [also build test WARNING on powerpc/fixes linus/master v7.2-rc7
> next-20260813]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url: https://github.com/intel-lab-lkp/linux/commits/Christian-Zigotzky/Connecting-the-SB600-s-i8259-controller-rather-in-pasemi-s-pci-c-than-in-pasemi-s-setup-c/20260813-054214
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> arch/powerpc/platforms/pasemi/setup.c:217:6: warning: no previous
> prototype for function 'nemo_init_IRQ' [-Wmissing-prototypes]
> 
> This is the old patch.

Sorry about this meaningless report, we will improve the bot to check
new patches to avoid such report.

> 
> Here is the new patch with pasemi.h: https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20260801043458.12500-1-chzigotzky@xenosoft.de/
> 
> Thanks
> 
> -- 
> Sent with BrassMonkey 34.3.1 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_34.3.1)
> 
> 
