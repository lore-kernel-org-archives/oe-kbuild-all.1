Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CEC7D412
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jul 2024 11:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720611370; cv=fail; b=J0KkHftxkuwL0RNDPuMkM7fjmqKn41uaTSzD9eONwTT4XOjZmD6pXHTDaZ/mPJDCjnFW9/1IvSoVmp1/ikd1WOw532BYJpbsjj184or0wHdnB2ZTvgd9iqu0uiKYicoJ0siZmB9g1HKBDJz6V7G0/5blJzD7oW5NBPdn8j96yYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720611370; c=relaxed/simple;
	bh=6q050zSG9GZ50Nebj7lGwt3G1AiyeyOuTXVLInVwk/s=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ATzj3h2L3y9lQ25iO+U8aLkdAyEkmBidh0i3uBljtgSAWVed5SgnwqIDefr2eGkXMe3zLuxsf1aL1d0aFr6ZgluAJjdid098gF7J8TXSV5VzTyA3E0Tk7VlZvkt1ZBZX9NZisr/wUJa+ej1cBWSbZM1jgsSR268qjXn4A/q/Ayg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mkrEzGVc; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mkrEzGVc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720611366; x=1752147366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6q050zSG9GZ50Nebj7lGwt3G1AiyeyOuTXVLInVwk/s=;
  b=mkrEzGVc+X/esoQSvLPMMFOTI84yGRL8Vit25y1tV3UvaCPi1bIgqfm0
   t4j2AMzBGya/f6cZkpjtlxeWcUR/vNx6W7BJFASny4TpnMq+sEi+135f4
   movUbo4trvyWFMiSlxsQ1SKMhS7oerUzAO0Cwjsz60kXJasOAzHWaWoXd
   u+e/lq49iX2oF4ezMceCLV+mo0Kz15KcDui0EyII299Nm0mpC+EGRcGvn
   BundxqBAzYWzrbQYzPZFLE/Ycb0HyEJfEJlxDext/e9WMli9g2AJ+S/nw
   kjgasYcXIjx5Yky3Lnj1b+2smhxP1GH04bNN49u9q7wvzNo0BdqamEXIi
   w==;
X-CSE-ConnectionGUID: JRVeqaWzRNGpT0kz/Ob93A==
X-CSE-MsgGUID: zwz8oqq+TWKRLyOFPhGmjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="18066288"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="18066288"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 04:36:05 -0700
X-CSE-ConnectionGUID: sR2N67zoSBuVoXiFYGTlnQ==
X-CSE-MsgGUID: HNHlnqg+SleutPWp/c/AHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="48095033"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 04:33:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 04:33:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 04:33:55 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 04:33:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngmKbgkR5Dh1izvK1CqEiM2Tx0Ij6US5Mp3QDnGoqkLjaaO08l+OI6hk8CstktGP0H025iWPKKR1Xl8tpRPwlneOXv5Wrj6/T9MPLRlYYZTA4nlBiKeap6RnsaEuqcYZSCi/h1hPOm8RFMgMWlqA4WXy2tW6WSb+EIuhGRVUnwVqBttfU5QBXeaRtmfcrCAW9Yq6bZpHUmaeh1cOdAV1ZkTgMtsFGChYOAMC3r2ynnqbAtEiC0KIz1RxeSMeeepvSUPfvOiLN6vldbX/81Y1aTJxrzSc46i+A/H6ZcC8sjX/Gbh/uiuM/XNemjqE4l3NDn4fBiM/5RVhecyB/WfVvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSNxMWBf1PoXcd5qXAR1mgeWP6xaDxYgA2hKjM/13UA=;
 b=ZCkzanGHb0FGZLvjWkFEDKBNbfIh0eshQFlKTmhyv500f78Q/JYu8HBQbrOefbOhsUAbNg37fnbTddtSW9B/M/uLcDN48HGNjgThCuv4JxtnvJrHwriHBUDlcFsoZKQW0BRx/5LLlZvQtjDhb1zaUncSqsyRUqd44t3vap1kbJb76GoIwVm8W6mziFjQeEzwqI+s7jczRQWS++WwxOuhH9d8ezSrH7QTGQZiWv1bzBz4FhGok4nwOVtD5tiz315vb3vPMNwRQS53aE88DH97LbBGk3wd+j5M4s5gG+uC+GSA4y51qVWIfKQsg5dE4jKStVihNYUcFlyfDqUwpFv4ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 DM4PR11MB6408.namprd11.prod.outlook.com (2603:10b6:8:b7::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.20; Wed, 10 Jul 2024 11:33:53 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 11:33:53 +0000
Date: Wed, 10 Jul 2024 19:33:44 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Pavel Machek
	<pavel@denx.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-6.1.y-cip 42/44]
 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator2: Unevaluated
 properties are not allowed ('gpios' was unexpected)
Message-ID: <Zo5xmE7IssWupcQG@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|DM4PR11MB6408:EE_
X-MS-Office365-Filtering-Correlation-Id: 77d2adc4-15b6-4f17-c005-08dca0d42d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hxl6ezNjPw9AUCW1g0MB7+N6JjCETjxMxP8krCW9LPYNYuBUuYz3Co177WEx?=
 =?us-ascii?Q?Vn5tdj+XWC4cFjh1F/12/WPxfkEh7odiDvqlCb0k5CxtpfCkRa7kdgeFGZ1r?=
 =?us-ascii?Q?bQJK8OAf6AyGIqoOhhX8+mYS4r8TjDT9rfpB5jvFX+QieXieW4I9EDcinEzN?=
 =?us-ascii?Q?5I7HOp52836r1ZP4XeAoZc0drctL28H55jp+0b7RG/IqTfsMBmQUBMARSCvq?=
 =?us-ascii?Q?6i0lbvOLMziLVOKNjNHzIIy9/C+gdJ0sJNJcTFLPAi88kaTu2uWaRzNzbJgv?=
 =?us-ascii?Q?KYqzGsSSxLZVxdm9KdRwAysaFiJXseTraju/2OxwdHCfFHjymkER3QUqd63b?=
 =?us-ascii?Q?TZV0eRR5JlWKv1ETtn/yuDoefY9u/pUm+uftZkkIQCra3FdPJq/00aNU7/Bi?=
 =?us-ascii?Q?SROJdvUvkc43mPU6kn7DgC7D75znlhHjscW1Vms0lGrO7dVojB3X8GDR2J1/?=
 =?us-ascii?Q?mhNHGV2DXnDozJxt0hdqxGZ3BwMlc9hdyoIZKF3QonL7wMB/QYEsXPi1H8uc?=
 =?us-ascii?Q?dwVC9FZMDxXL3/X9YpZ/ogEI07jep3ZQChq9gOEokCF8TvDk7qNrSk/kh3Dz?=
 =?us-ascii?Q?4O2O+L6Qtb5jDTQYytpKYCdu3Qz6XDerT4CpyslB52YPbPiWD0tmALKQGJc6?=
 =?us-ascii?Q?em4X+LdPGuFchpNTW5KTsb3teXAjKjeFUwh0+dCDP0IyRKHXwf+tFaEV1Eqn?=
 =?us-ascii?Q?MS0b5LO8TR2FgXVnKwLUddMIKr+kINRwhm9gfX01VqzGhJQeiojUArFfvilc?=
 =?us-ascii?Q?2+j/mt0AFdoKo3cb90SGdbwSU49VGdWEdp8Pnl58GVhJfQrkFnNnKeaU3UYg?=
 =?us-ascii?Q?kudVOgBJy+hK8rH+/Td0L9KShDsJLBLTBXgmJeXm1ADcCChyDzogCWROyEAU?=
 =?us-ascii?Q?aSf4clI4PJgNIAsJ4FLkLXjkk3b6rEqhcAIuw50KVdRACGJSozhbtQbsPP2z?=
 =?us-ascii?Q?W/q1PKvFgnqZc8hwraEWvI5FXsLTyQoEQhAmpuOLphKyxyavi6y+2DnEDBwy?=
 =?us-ascii?Q?gOmVdULCl+tu7SaamYCvWit6WBv/8HafSlkOSO/Y8rZNgVeukFBUfeVcVAa+?=
 =?us-ascii?Q?iWv1imszd04HBehJZj6iCWW/TpeNL/qP9i3lJyjC+vPL1p5B0rpYzfnxIW2S?=
 =?us-ascii?Q?OtOqts10UOUe4wVPngFHmDUD+Eh8tGHg64X9Yc+oirczzvFsO2VOOvCjW3VZ?=
 =?us-ascii?Q?PdrYdxbV0lAI25tKGyZBsUV8Y/BP1oxiDEmfj1VRtUxRO9ozeoCFeQLmH4fs?=
 =?us-ascii?Q?a7k5YIa5CmZPb18HVbvoSJQRq/H1sa4ixb93rhCw1dxX+J1Wab68uPlzIMeq?=
 =?us-ascii?Q?/88=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MLNvtkpeVmBai/zY0iyU+vabkWHPes/p2IG0Swr1eaEp1dy0RFweP8btqaqT?=
 =?us-ascii?Q?7Sir0RpcwImEZjaDoOPAkzfSP2+yowbZbbgoO8xd5MAELH0Q1WK1Mw7T7FBT?=
 =?us-ascii?Q?HvQa2md2Jk86mYNJm04lv0KLAs4eN6sg9ru+osD7BHl8PgBk1iEWBMDG3ENn?=
 =?us-ascii?Q?YHjUhJKlHSbviLjfDOcfL3zH5kpcrm5lypb8SOsiPEHa8DVPsNt2xd0pz61b?=
 =?us-ascii?Q?jKR6QSqMGlwen9HTvQnnUfM4HtmHttj3HidwZx1Y2kgwHUkTCULcA9y5h9MK?=
 =?us-ascii?Q?J+q4WysxgYttBDk27K+GQ6R5flhGWgcO2yYtORHgLtHLqz0zbxS18Nb7kKZ/?=
 =?us-ascii?Q?JrC4PB5rVcBiz0++2FigR55NSaBeEgkrabMhh6ya/btfkyc+AiiShwl+vw4Y?=
 =?us-ascii?Q?m4T6TjCupa/mW8yqt2KB9CxFM62xkydcB8AJvEVd9Pf9PL3zeGh3HpR98yyr?=
 =?us-ascii?Q?drmIMKV8kqocVbPnXUVWkrOwPJbdCjaF5ZNWkDj3cnJ5zAetTz+mmnFYWvtu?=
 =?us-ascii?Q?RqRoNbOvD2hpN22rQHeqI1jZuTKZRXqA4v3EOg8WZoBr2obw1Rolvwt3SxSw?=
 =?us-ascii?Q?EtsHNCBCbJw4m2NQglCebj+Zu2Ey6jrw/JPUnL2diGg4edvElSuqBexOkNs+?=
 =?us-ascii?Q?nmjOVC6zkIiBlpFq7UY8Ir/EZ/0l4GuoAzXPwj7Q9Yaa+fJHvUvNv7M/26Vr?=
 =?us-ascii?Q?GJGagYI/uPQbYVUDHSYJ2Q6OVi50M90E0DDBn8XdkKmVJ/weXxtUDDK2v4Yg?=
 =?us-ascii?Q?wxVKWsqwQT8dO7qn0ugE4crT64vyWD99theAJPEixmgesuRyp6+IkcOCx9oJ?=
 =?us-ascii?Q?cEv11jHoKfqy62tnh3DFde5EjqF67T83GEJnpC20XuvUaa74iSra6eejVcvS?=
 =?us-ascii?Q?dnkyt4v/2ZS1Akc4C4AM0c945ubUttPODVnyH0g3QkOpctkyFV36aM5ZN334?=
 =?us-ascii?Q?WGAt4PiWi5rr8ZrYK+Ai0p6kTy85vnu0uyUa8gYakKSd/WR9IfMxt1ZS33Sc?=
 =?us-ascii?Q?YwbtF4Vpn7yPzi2sfU9Tie4v+7MAHDeXVY/vvYl62Rd+Zcy4CD6cUYMoDcl2?=
 =?us-ascii?Q?4dPpFzIl8p6+uCeBHO/bppHD8cK0RV5KyIIaNDHW6XAOZ5zjxjk5BFsuidOD?=
 =?us-ascii?Q?JaznJSZg4jptlckW4JNqHB50iBB6vhF0nasEIjbxrPhDwG2Ws99mA+3+GuUW?=
 =?us-ascii?Q?1dYscVWASJSnfnXkiV6YPBqDAzca/a0knikN3E6KU151ulgrKPocuW81CIXL?=
 =?us-ascii?Q?m+WmRVmyZOI0K2K7tDXi7svPbMpF78Kf0Svz5jQVjEYhyFay3qYc8Vfl/Ude?=
 =?us-ascii?Q?3Pk/i8KXrawZ5IiRbN8EY5FEMWxPExUApa/A8ILmHYUQqjbMFq2mGYV1NgSN?=
 =?us-ascii?Q?MnJKsYrgiFCagJZiWItatzwK8xutGb8TCx/DRaOMCe9iDSz6vA+v+464jwB6?=
 =?us-ascii?Q?UEc0XI0uMUkIRQ+UsYMb7GYJBT8YXVXqw+mTeKVxGMcaKPxBjXfKanqEZbBx?=
 =?us-ascii?Q?WB+c9VESuq3ak0xdxBoQkn+eqruHnj2id1k5WoY70L7Vq7xCAXgWZl5gEbJH?=
 =?us-ascii?Q?wyhQxIU+2BLWFAIv86T95Iw31B5DlVyfIsJy7Dr2b5vWemn1SE99nJBr4Bi8?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d2adc4-15b6-4f17-c005-08dca0d42d29
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 11:33:53.2542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5oZHUiCjLLcxihRr7aSXIsy+JEWkDUHIvUnlkRtfnW5sJjuwDW3yDTE9iYa/Y9Ak3QqLuwSGKCugcqclCn4HBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6408
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   36ec072fc37c836df41fdb600a933321aa4804bd
commit: efeb25827b057a3fe1c229136954f249e443f5fd [42/44] arm64: dts: renesas: rzg3s-smarc-som: Enable SDHI2
:::::: branch date: 24 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-051-20240708 (https://download.01.org/0day-ci/archive/20240709/202407091604.rtMOdBI4-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091604.rtMOdBI4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407091604.rtMOdBI4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator0: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator2: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

