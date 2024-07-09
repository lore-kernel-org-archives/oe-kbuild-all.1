Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276CD12D1FC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720505333; cv=fail; b=lEApw6YX8f+9J2iNy2KtkcW8tyNjaUUE/yrxggqZkymZK3RBz4mjclg2HzDjcyPO5Dd/SfBeH1ewrhG/fdz+IwRY9x6aUy15tJZ4MhJ+QLji9JRoNlDbBuXB0BdCUhyyBdhGog95vrZ+HW1afp/s4cz9zWO4HRxC0xd2auxfYJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720505333; c=relaxed/simple;
	bh=ZkXQBYNWehe9DxdlA1SB64oediN8OnT14IvzLvho0H8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=A5+rilSv9JQqltKznE5dhVgTxgSfiX9DqiYkBf7ouHdzKTDeFnK8ahS5MQZUWuf47a61Dr2OHc5Eq5DvvNABghz3FfDcNQQ5DDf9+GXs9tyelKizQfBVHTJnl6n5LQXho1pifjAnXCMAMnchNyTngX/qn9X0GdPKywuRuFdeVkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFmbd2H4; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFmbd2H4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720505332; x=1752041332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZkXQBYNWehe9DxdlA1SB64oediN8OnT14IvzLvho0H8=;
  b=VFmbd2H4mzybqFqkfoYzcnoaJI0ynIGABKeq15rKFnak/AiuJvLjdpV7
   B+fVc7XVK5+fW7Vc3koCTtV0gj2L7S/JkGFJwafSz9bOSq5Q4XWJjMgYk
   1bRu0KWF1L8D1StByNsumV6vUSNNho9Qxu++n1fNrNpsf6t7yw4XGNO+4
   31hxccMQHN8aqwl6RWDGz/x5GCzLL1xeqHkIAOPY7RvXOtxpdQCXdo8dL
   d5dTRNqwz8gR1e/7xpcJty20CEldREFdc61y8FPK2FPmMWojb0XvARLBN
   wYBdH6BGAPteHdWFUpb77avSY/KQTYTbtvRelnA5mn16Ex6wZcWZhHf/Z
   Q==;
X-CSE-ConnectionGUID: dnFjvPAaSX+hU7pAS1bp2Q==
X-CSE-MsgGUID: 4fjOoRCOS1SXNFmM2qVaeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17689520"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="17689520"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 23:08:51 -0700
X-CSE-ConnectionGUID: Bg5zVvWmRUioIFAINsGhJQ==
X-CSE-MsgGUID: h4leMFENShqZo4+yKRC7fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="47517338"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Jul 2024 23:08:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 23:08:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 23:08:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 23:08:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 23:08:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZCy52Ia4Uz7I+gqayXLDhDw3mnOD6UXiqnldwinrazpQCmnMqBnEZqrEZK1/pWgAQUBoDx4yaNhAv5RNx87KDywD5uYEqzp6j9DBBRsfR3NrgtduzGL4pFuW/GAfroM8EsxRousqtrrZoehYyk+y32s7lhZQkVqBMLPJJD97l5u/SkYc0X1FcM19L0mpEMhwWD2YKvzrdAiE2QJUe0KVG2gcgX6ljoCg+tWRpOZd7xUaDEmeZ8InjYQJpQgdAQy4iUAhXjSAN/g+jBje0VwdysrcMasEDm5cLNQP5F4C76cX5NFjXMgzwT4t4foPAyHFyoT12Yrqe3XHBiW5la3Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dhf3nGtgCEet2+jsoWe7Fej/nCH25u0T/1zsLYK6cE=;
 b=b4uGtiH9we6iv+jbhp2rSmwFsDltrGBH/F1SOMSLK1As3AgNfzFW+IyZAENLXUNuRNMLKkvVNIxDl63ExGkAgcl/porcM/S6mrSaQpMZJPZNBS0hKD9OcP52hBu5oqZsenzGqU/JCaep0cOqiHTnEVlvb9x66BLkvKUlpz52WWsiAKAB9WHmsCpdT/2+0SBPf2BfEBhL9IIH5KO39DQCWp+KzPaFV5defCSPQ+H0dh9FfJkAgYjdRgVfpNabqtuKdFU2II9woUcW3r3bj95AJToIQLnxFCg7kXk1XroCy0/aD1uVaAa7uK+GtdQeDvc57OX7EGN0WetATEaFaa8jgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 PH7PR11MB6426.namprd11.prod.outlook.com (2603:10b6:510:1f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 9 Jul
 2024 06:08:14 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 06:08:13 +0000
Date: Tue, 9 Jul 2024 14:07:49 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Pavel Machek
	<pavel@denx.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-6.1.y-cip 38/44]
 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator0: Unevaluated
 properties are not allowed ('gpios' was unexpected)
Message-ID: <ZozTtSaLFfrOv5/T@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|PH7PR11MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e1c3587-e3d7-46d2-83d7-08dc9fdd8427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hRkGrRwjSw1i6BaX7sJkXigyAQkg+Hy5z9OcDb8bmeEh+9AeIw0y4vlCaijC?=
 =?us-ascii?Q?weGKblGPYqFoIdpIB6hKWRfbSnQDVx+ajE2dSh6RAEPJxvu8jixrjb6BILXe?=
 =?us-ascii?Q?aVP+c7REStgg51Psq/DJAKduJqdprbMQCFnMqXYDzMVsWtG8amPqs9Fz6KJ2?=
 =?us-ascii?Q?S86vbNyCZ5fb1vzAK7oPNTzScbo4RmJG6NY0Y9F8k5hjlTZ6K9KoeLS/sgpm?=
 =?us-ascii?Q?hYrmzh0vPWjkN8Y9F1XA9KZKy5e0/uaSHkU8/Oei6Du4ldV5b0jDUj8WJOg1?=
 =?us-ascii?Q?pItOSgJsEsne3m7WJBonddMSxhozRyWftC2IX1xCyDmNJ80hc7hUmP53sXBv?=
 =?us-ascii?Q?8V/LHbYAGm6WnlLxIL+bQtVQkrpnhBGwReEqB/Zk9cNCumlz1LufY472E0sS?=
 =?us-ascii?Q?7nKqrsZDBy937AaR4QkYJUHuWHOwf0sGrQVHzf/kAzBWA27z59+MgHhTtyu+?=
 =?us-ascii?Q?VhxlH2BxghTuNWs8dKaZDwFLOFQa8aii2lM6h6a+CYQjW9bFFRP9PjjoJH10?=
 =?us-ascii?Q?aNMZQidGYW3agMA6COkiJXhn6M8bVdczQWUs8p/9kNjMDMFjzsi/8wzIbZE/?=
 =?us-ascii?Q?jJmP+U1yinSWQfrAd8HDeMRIhEqEEnQ8kMIl4F/Hqkc1N/c1MJQv+FU6yaHh?=
 =?us-ascii?Q?ciQcYAjA8C7EMhR2BTGE5354A8aUh4JeWmQFZvpvz+Ac/EHy48u8LC+q0+1o?=
 =?us-ascii?Q?Q0txWWJ1BbfYDBCpps63BHcYuz2u/oemC0jhYLuypWbV5oUUVVYewVmLkXvv?=
 =?us-ascii?Q?N4FqH0iNuCaTmVIAILaMLsX+EaehFJoBLzYlAXPdGSrXLLP/lbuQhwa8T6EX?=
 =?us-ascii?Q?0bjzxeqNfnjScXDCtADjU6W5NnTa3ew2CxXYtQgjqw4HbKDXJblbEY9JgoT0?=
 =?us-ascii?Q?eJNWqx+Zwxg6DbdWx+jbuLlQ8n/7uqFETAR3Nvc1+1IyYtMFESbriHxMDb8M?=
 =?us-ascii?Q?5sWqjDgTkQTuXViDrgtqUL07+gZRSKWG3YXAOBnaR7a2AoPunoE4Xb1VJqAY?=
 =?us-ascii?Q?Jjreu/spsOGlUsTcHvRwvWDEo2OW7Q4nOFIE3v4Gx3kAx6paYF1XsYZMQnt3?=
 =?us-ascii?Q?b2jhjPkQDnAZrUUe4YUyS/CeX4ILiyAAR3W0A++SsajYzMWbH1vCX5nlU49q?=
 =?us-ascii?Q?BUdVoTV1QyqEQoal5sBRSnhdRbO27N6SfzR4ws1scrR412296aV9q6aGf5sl?=
 =?us-ascii?Q?bxoReQ0UeE9K6OsE7dchMMIPA53HTgWuxGG6u8POe8He8sLrHdCZuEBGZr/C?=
 =?us-ascii?Q?EnxO1yv1+nNFudXGdDoFLScLcA196QcP89jT6QPzfRKOvtHxjZhOK85oOuQI?=
 =?us-ascii?Q?GtI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LhwdXzM97RKdmc48iq3X6gwDLiBWyZvqK4H7IhVdhI9pvr9pao0/lh80p5Ng?=
 =?us-ascii?Q?liaGQDXREQwJif0LZaH98lgnxrf+lhuxbKorDeznmcY1vEbtIwM0Qwg5xApv?=
 =?us-ascii?Q?GLEBTqDf6iYao8xK7M9AnDYUInriLCe7maa9IygzM/vXHnk7xc3Su00Wt+ZM?=
 =?us-ascii?Q?ykZIQjRY6vdFp/ssjCvFnhhs3TilwEZ3/DuNgGMdD8JVMGHSi7OKks6UzWw2?=
 =?us-ascii?Q?56DijFCf+44QUJMgWfBQpLAohLzW6dSrJKlWxHcKme7l1xJa/IpbzoRKxkaO?=
 =?us-ascii?Q?WsNKef9gQY04JjbCdmgn2mecwR/f1VR4GfpkPmmsuVv7m7IX6aQY6EQlG5R/?=
 =?us-ascii?Q?FF1oG6UFvAGlMzDAUAhzksP513iOj/XWA05M6/EEN+lfmPlQTHLEV8cx+kNc?=
 =?us-ascii?Q?fA7mJILA/Q763xvdgAShsjRolGU4vUWUsdto8Af2NMMB4fjPEFqNsdKhYx2C?=
 =?us-ascii?Q?haP5e3E0TdE1325eahXNVothIeMlFA7rq8b2r3rFLydiHM6v5JSX9KVpl0Vo?=
 =?us-ascii?Q?niewxeon51C/6DyG5R0lOqy+lDqHja8ISn0pWepHp/lq2pWTFRUQt+3bn5LY?=
 =?us-ascii?Q?fCsclWw+BBHAolDiPBaEoa0/+FrFDyLb1BkLJ/lYtt0Q8wRmCS555ptLGTzi?=
 =?us-ascii?Q?SIvdGAHnOQHc6NZEEd3Goo5CQ63gWSbuvKjIjkHIjFqS6rf0aWy5C10KS+bB?=
 =?us-ascii?Q?G4FeutEdtGI452ZQy9ZCFLqwCE25lA6ITNXD//a9PwEaWmGaRyc/whjwVQ6D?=
 =?us-ascii?Q?+iHY3LjdzAw+n7KbNV9Gt2Y8WPNvSC9a7HKViKWKvCXt72i6nosEzb+irO+r?=
 =?us-ascii?Q?/sBQllJRRjdV9uf3qawvaIciGFP5yiS1jr951mFkVriJruwJQxyub/WTUoID?=
 =?us-ascii?Q?DXA3FQOrpLlewupsI9e3i7NHVIFbzHgLblRAWp9Hit66JmBJ5hf+6yyjAsrv?=
 =?us-ascii?Q?+LTMdZzH2ggrlN17uE0yPpGq+3R2FgbMYyy9qwWj43HAjsWpkXqv9Qicj+QH?=
 =?us-ascii?Q?VLRXjN3kvyo39xM5OHMfp0Sqh8nsYTrmuQmM53c6btX1YAhJVG0WXTZXTHM7?=
 =?us-ascii?Q?NPcgy0b4J8kxiyrCOkX++O8Vb3LkhBEu9/s49V6NaVybISJ+5nnhzbRin2+0?=
 =?us-ascii?Q?AZlee/EYkUrUYuQvCkvMaZ+AwhETnVa0H/Gs7x+cII/yhL5leT9lY1SMjAPm?=
 =?us-ascii?Q?wQfipT4hNPd1RGzn5wU3lojdAQNnft0yHSEBmiFBNJGn/QGr1Jy8Z+S3KnRT?=
 =?us-ascii?Q?Gr85/2N6NHa2RdRs4M+1uRF/mk1kH8ZwMpDiodD/q3179sqhdaYKKNUwMv1/?=
 =?us-ascii?Q?X55UlEFYKySCQpSnA/J271aHhRJeOP4MlVxZSpMt4lU2TrzrqGtC58Hp2Xv7?=
 =?us-ascii?Q?AxYASr9VIHdj/ggF3dpwGqZJeUvoRydylr3tXxLCLQ/LJ3m0zYtKn0XG5aFU?=
 =?us-ascii?Q?BFJfKeERYjeOFE8MdDMvyruT7Ikw3pm5DomeaN0ZpcdYM0Qe2UlG0BVSDWtu?=
 =?us-ascii?Q?89zIMa4wHlUB/3hurMsfhfhxeR69J1tN7tF01Nu9ENh8RGXEMNjZUlI+CEt6?=
 =?us-ascii?Q?wMVdLQ83Rv1IkLvgWC/tPSuV50sxutjSx1M5jqXkbXsxvUgCksNFycYzQwLX?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1c3587-e3d7-46d2-83d7-08dc9fdd8427
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 06:08:13.8969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgjZIH7iCH47tAMucM7qF/VMgIFJnX1kBCojzfIMedFIAG8m0cxS5ppH4zaZ4u+jFyUdYnZ8xo6HtKN+TajB5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6426
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   36ec072fc37c836df41fdb600a933321aa4804bd
commit: 9d64838c5957d823f961e9a4427b304559e862ad [38/44] arm64: dts: renesas: Add initial device tree for RZ/G3S SMARC EVK board
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-051-20240708 (https://download.01.org/0day-ci/archive/20240709/202407091011.Dw1ju2PB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091011.Dw1ju2PB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407091011.Dw1ju2PB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: /: memory@48000000: 'device-type' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: /: memory@48000000: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: cache-controller-0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: cache-controller-0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
   arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: cache-controller-0: Unevaluated properties are not allowed ('cache-size', 'cache-unified' were unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dtb: regulator0: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

