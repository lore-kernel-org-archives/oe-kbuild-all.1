Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1AFEA4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jul 2024 00:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721262633; cv=fail; b=m+SZRgRyJw1JAMw9d/6YmOd2XGwRrYC8o4OelgpEBSc+fwnC8Gqp6NzF19Qe6omam5Cq0BxXMgN7dq2Tghl8nY1rrquHG1gmBQvgid08Q9KVdoot6ikH5VE7O0U2XWBVkpWWIUx0QsLH1HP1Fh3dILqG2YBuJW84waBWigmzhcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721262633; c=relaxed/simple;
	bh=p5ks8PasHGJZTsQw7eFSCwOUcK/i1PXIaBGMnmIKaPA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=VAkKVqZZGI7HYgCdZ8wToVeiEhMjIH2LP4keC0bxVilRREkYF9jJdi7XCaWZKO+K9QGpwkiziYee1pp90napNSQ8Y8mrUNF2ccvEpIGsMLWL6ITCMk71ZkiwhBApMbjvThRsKnEMCdtfVRX8D9zDXNRt4uFLuRTWotsgO/0q7Ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OmtFVfOD; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OmtFVfOD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721262628; x=1752798628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p5ks8PasHGJZTsQw7eFSCwOUcK/i1PXIaBGMnmIKaPA=;
  b=OmtFVfODxo6n+yrTU0cpgyZtOjZw8/AX0zUVFQZRIgSL1udNp/HIqS/J
   qBAtD7l5mvgMLD/yUBYCzBroODueYteRluBrLoVVwxNF3ib4f3rT9un9i
   M2CfcdFweRfUOJyxC2NUDCjoPkTIRC+EHAS7nt3fUbvDAb5tOZ9WWRK17
   og64KJJ7l9gWtCzy9YvkG0hWOczP5Acs2VIQemtGgUFQPqsnf/M+GWOBe
   nOhoHc6rQKA3FGxoLlAHWCCM+wvBzYIbN+2UnloXljGtX4mQGilnEt4wz
   9C9kb4rXGxkN1a78bwSkoCGDrPe73Y/zJdiWOPLkHdxYxDRtr1mcfii6E
   g==;
X-CSE-ConnectionGUID: loDLQBBkQDap1hMSv099OQ==
X-CSE-MsgGUID: 4cXBl4PLSgS2ALJc/vgJlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29415426"
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="29415426"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 17:30:27 -0700
X-CSE-ConnectionGUID: KtbupSlVSeWTFqFbRhn9ag==
X-CSE-MsgGUID: JwEUggd7QgS4SfCRUxhfaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,216,1716274800"; 
   d="scan'208";a="50295241"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Jul 2024 17:30:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 17:30:26 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 17:30:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 17:30:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJPOeqQ1RJFdW5iUakQJfw/+8v5T45ea9FBIoHqmty05EDKezzWxxZGSN8mOhGyjx6UfArY6ZUUdcfCCIcKDe8G3tzZrtBnMjEySPruFyI15qlpBavVsg8Wx78vOZyvFcgo4c9ae04rEifq5616m6DeubFr5P0mOw2n+8dsy44Oofr6DAVQ/VagxFxOhfJAn63beIlfg1NGl7ETSHmu0QdApdNWBbjvroxJJ7FExyFpM50wkGV3JhV+EI0DIypod7daMJbNMfjGODdG8XQau4OyJ+x2XCZ/4+G37ZqojHj8Oh7rnsiJPtBTcfAciMccKD2ksPDM2nKjMVJljwT+dbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph+B7Eo0dEb1t3VHA/qQ+lg+N/BapajJzQxGMh5mzPo=;
 b=mIhi3dW2+kg4PEMzYmwRNIB5wgQF+3q+qdYwcC/bqfhLM/SVHnesi865Qb+/xxjnd4LUDve0Roe1gF9X6+EMWDfd5rBvAfc8/zx2hWVc8i3LjS86nftRzxdm3L6ZDI1OZr/bspxfXYHan0CDioUFxMMyLjiwbJFBzha93JH/kaJUpc8DnBNs9BPPXCtUP1w8gGrX96yA6nhBpFNjTCo2uApYxHz9ztCyzUBY5r29Evt8tuoWv1xdqXyvs6lNi1s9iGNYA9l5cSEQKQGZ75FTiSBSntGrRQG7udvImke2kSj2WKIwX6MJSlIC+5mXkiys60gSp5QnrJzgsCjG81Jxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 SJ0PR11MB5117.namprd11.prod.outlook.com (2603:10b6:a03:2d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Thu, 18 Jul
 2024 00:30:23 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7784.013; Thu, 18 Jul 2024
 00:30:23 +0000
Date: Thu, 18 Jul 2024 08:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.1.y 14/91]
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fd000000: Unevaluated
 properties are not allowed ('power-domains' was unexpected)
Message-ID: <ZphiF+GSFxHYuOSj@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|SJ0PR11MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f01849c-1d5b-468d-e8b0-08dca6c0cfcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EN/e9yZi1Yu3vG8uWcxR32O7aKLDD2a1+0A4cXE4GrdEH7nfCDlI/yZyQlK6?=
 =?us-ascii?Q?/BwoJxXjBGGFQAL/fB6mf/FVqEM9gFUO2SxOOnE41QQGiSR9iAqIXJhBv1lR?=
 =?us-ascii?Q?bNZnh/peU3wEyM4ELMVaoebhK3NbhRE0nFH7UbwNgDQHjOeMdQP+p2VB1mL4?=
 =?us-ascii?Q?5sTU8OItnmC9CoLLUYcwJywIOYxuitP06P1JnCV2jaOEMCvjC02f+fUkvqiD?=
 =?us-ascii?Q?khzBPFlIvLz8+yeuCYf/PSWrOYvR80GZ8CtMIVjk/Un4ArkKyJnQoEezCZ+T?=
 =?us-ascii?Q?N+FEPhW5qgYkQcSLwDRQBwYxK/HatHjboPnORkjT3ecc1vnCxDEO5svNZZeL?=
 =?us-ascii?Q?Z7cuy+u88QYq9pgGH+WtE9KgfGckzrg+ROpDzRXzquAjY7Rx64TeaxWKzw3h?=
 =?us-ascii?Q?UPwrm5DPR4xZkvefzSw7v59S6XQZf0saM1JmZaATfMp7vYjtfI6iVIE9Ms4T?=
 =?us-ascii?Q?n2fgs/R36ChorKKsAPn9oaj5dRjYlaDLPJvtfvKXb1Sh9ZB98N+WorUBPVzi?=
 =?us-ascii?Q?vyx7qQx8iQTVBbkqCofKxEkp99OnIg3yqyXBI31xlZQ9yAktk09pTLoDJMav?=
 =?us-ascii?Q?yL+4dFC4kmEI8o3w9RJ3UEYxO4RcAm3A5Q13kjlKqGhiwDLJ0Yj6TKHoAxS0?=
 =?us-ascii?Q?sMA92DHN7I9TPjz8fJuxuk5EczIG04FFhJ+6KDHFKkVM6KGgfzZ+B/RqpfgL?=
 =?us-ascii?Q?+ZiI2Yz876feJXdOhKDRv1rWJ63RR6282P9hEWbQQLLdrbL3ENab8u/E47lo?=
 =?us-ascii?Q?rIQ+mUw1x6kSe+bGk2Pt1BTQw+usx2YJsjdzjBNMLmre4GddM+vDQHbQtn+y?=
 =?us-ascii?Q?uM81TzRefV1p5fcAHVHwZHTDB1A+F3eHoopaUzAHlPgQ5d2xjWuTfashcrr0?=
 =?us-ascii?Q?rb0DkxLvPakKHoy4BFIaSUyFl8ve1GZJ4f6n7OcjDMvX0W5V60o/1WVkQTj1?=
 =?us-ascii?Q?191/D6QCHugAMofCfT+hxrWXqlPL4z+c8ivxqh+EDfaEGqG5cvb5z/XFfWUp?=
 =?us-ascii?Q?OTr+MR2U8bucDIYWbSxkOKJE+jlQZ/YKN2w86iMHf18DGNY3U0XmgaNCnGbs?=
 =?us-ascii?Q?CUui2hD/erTSLr9k6jv5j+6XemRe4z8qQIC0Hghn0CFJA0Rc5MB5LtevMvn/?=
 =?us-ascii?Q?VAUr4WknH7JbK/eIYGvFnvjxkT7S2reWblLfo3+2j98CIMVA9lPtcQXoq7Gw?=
 =?us-ascii?Q?uOaEBDV5aBDC+GC6nik/TAToOWhUFPHqf6ekQNZh9BQTsFNblfFEtrJSnDFf?=
 =?us-ascii?Q?J6NBz1iZnPKKxXE52Nas2BiTYNN5KqW9ne+agcn63bv4rUy8K129iu+8Vtmf?=
 =?us-ascii?Q?p9tpphGHdE6VSNPPmX4rNGaREsa0m56FeOSVyOni17uY9Q0r2HjcfSiT1Alm?=
 =?us-ascii?Q?Hb82SpA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f6WHu7UMiyRMfEt4lThUkicC8JMgUvVmW5fygU65g3st7vUSG++IdXKsWkUc?=
 =?us-ascii?Q?FLFKgPkALBHeC3XkVBQA3HkcXSnq9BUX+883UV1Ebw1JSEMpHAvzZHsOUEsY?=
 =?us-ascii?Q?NVojH8tJOATAKnj2cQPYC7Olq/fQnEtKhpPvvI96c/tR+KuuMrfbyAfbbOsa?=
 =?us-ascii?Q?Q9s5U2nremskH2MPDeUhiohSt90F9UKtVZIpW6MQkjDtyga1bGWcufp1a9AC?=
 =?us-ascii?Q?ZUvGtMISCCF2264+SDlyIwWqsUsZTVoEOdrFfdILXljSBX+C0rUnztdSS3uZ?=
 =?us-ascii?Q?pqtQdeFbK8CTPcBKi3WTcPej85YTudAsLgvdRZUFqBO+4GThtWVA34gZ8l7+?=
 =?us-ascii?Q?UI4TcQJgd0kleiMYFseRTE0MvtEcuf0AwJqSPa4pf7we2ycZLm4Fkke0KLri?=
 =?us-ascii?Q?m29kvM36jtLX1cNRU6P3YAsd3dULT+8bu+cmakXiG6VnViDgGtm+zO0nwQ5z?=
 =?us-ascii?Q?ZKXJZkOMkqNkYOrzrb/h6TxSdHAffc75LbM2higg6jAwL2Bf0RPs7Mdv3omb?=
 =?us-ascii?Q?nHZ1WaZpgwfHEpvkD2a+saMMl20Uk4PKooYWRYoj4gj4fVq3QWbn61OwQxd6?=
 =?us-ascii?Q?QIYPiKi2TwYVLhHiSMNkPDrXdwudIZlJhWxW0xEtkVZYtVfqjiiUaUNwLCFl?=
 =?us-ascii?Q?SydhDzHVZSOQYocpKLOkvMhW5Yv6gwQ9RyLZzEvJL2pq8ghdC+WozZFpESao?=
 =?us-ascii?Q?Ur6QcxFCwIiw79UZ8RDf03w3XEqQbWD8rh75I0Gg4hbNst9kaVqxg5hGFUF0?=
 =?us-ascii?Q?pS0rGHl/nDqxEo85Cpwjw2XKSXVMAPbotwz+N0LFqApJjdt/KQv9WHX7sQSt?=
 =?us-ascii?Q?EZ3Rs0zj7Voe6zuBUWUJHr8sz5gwhNFIeX7U9okwkmUuPrShAtvyaSYj8JF2?=
 =?us-ascii?Q?JVLa1kaW8yCQjVjIO8S4jlCLesrRAUbjdweQ6SogrI/4srTVMo5NtxxXtYc+?=
 =?us-ascii?Q?o49BbReJ9ZRDLUeXk8czRw37faaushLApjPOB+bqNVZQ6Q+jPCzmfglCRc/G?=
 =?us-ascii?Q?1zb6EEcjk/+KqbHAFgKRHW5Vey2NPRT2kGtjCVsjzJsKs+J62EsW8fX+ovy0?=
 =?us-ascii?Q?SsYDCxB0vHOkpZhAese2uqfegiypdQ5nYLY6zQR4UNNtFP49RYUdUc0c4xRz?=
 =?us-ascii?Q?u7BFFK3FYTks25bUX1ftlKoyugDlEBS6YGNPLWABvx5q7MdPY0uDjRhOk+V9?=
 =?us-ascii?Q?teJLN2MqaxfuaKn61whoKPkO7VVXNrVtA4+skL2SORVVv7aiIA/JmVpA3/Kw?=
 =?us-ascii?Q?CEpOs/EkslDqhmnKLcp/ZzADO9sfG6NEiB/Sjj7ykr8jGxwqHkTvz8nN1qgx?=
 =?us-ascii?Q?HWTMWZQsdT6W+S4Io+V7/+ti3bIUmZNLUht5gXsSD8eZ65GDO1Iy8ZBGyVkU?=
 =?us-ascii?Q?0fa2AXGw86+rgc+4khjKp5YorwB7x6eFugJ4LJx9esn5JeYqr9d8i/EpUZl2?=
 =?us-ascii?Q?ppKmw3WC6AWeXq2kdHBIOG8Szg1iA+IlcGtysiYhFC40aXWFcybPTXsoMEgM?=
 =?us-ascii?Q?0/XpvDSnOM5tUHLsGN8WqF8+HaQ/sNQVhJq896JZ/mli8bIRZgdembl2oxKg?=
 =?us-ascii?Q?H+EHMvjneOoJt3qHET3GvbfeG39drgWuj5bxkxVLog7uxDjrJiGpUE7fKcjx?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f01849c-1d5b-468d-e8b0-08dca6c0cfcb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 00:30:23.2787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h23k338Y6Q0PAyDpuP3Cyk+f3JBDGxzmtR0aNOlH7x4EjqBZEUY7phZiEX6rB6wpAEmtEs/uQHSCimQ9+mBdZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5117
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   33e59e3417fd2b46d422206b92040e1fe5b6c38d
commit: af52052e79e286b72d81618e6bc9ea37cb2ec2fb [14/91] arm64: dts: rockchip: Add Hardkernel ODROID-M1 board
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 6 months ago
config: arm64-randconfig-051-20240717 (https://download.01.org/0day-ci/archive/20240717/202407172352.WLHY80vy-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407172352.WLHY80vy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407172352.WLHY80vy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: sata@fc800000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fcc00000: Unevaluated properties are not allowed ('extcon', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fcc00000: Unevaluated properties are not allowed ('extcon', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fcc00000: Unevaluated properties are not allowed ('dr_mode', 'extcon', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fd000000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fd000000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fd000000: Unevaluated properties are not allowed ('dr_mode', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /i2c@fdd40000/regulator@1c: failed to match any schema with compatible: ['tcs,tcs4525']
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: pmic@20: '#sound-dai-cells', 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks', 'codec' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk809.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: video-codec@fdea0400: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb2phy@fe8a0000: otg-port: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-inno-usb2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe2a0000: Unevaluated properties are not allowed ('rx-queues-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

