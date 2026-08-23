Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D134D3D5663
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488283; cv=fail; b=uygOl8NN0mJsvS5q4clT/rLAeGsK/T/C897On7N7WWzQuzu2oCXlnXah2Tq9khhRKpVkTeusQ7A9+57feqIMxXs8zgaDWmkz9wpDdz8njDTfz1WAK8t44LDuuG8uWWTEjFiSpXfURlKVyZqMfYWB8AfEC327hJ+nIMVamPABB8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488283; c=relaxed/simple;
	bh=TQSGr0tkrLk6fVPuLcIOOv05D/Do2VYrAGZsnCJ7IdE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FemhpK3bOXupJ1br2lus6Z7GOwy0aqM8lhzm22jF0r4tnmFLckQXQwW+Sgdd2AnL+MOHsvdIt0tJs/xfRtOvqi1PKia2PKjdbNv2osMu9NktZpjTNt4Nhbd93rRG5I8xYAVsuHLTCY8QIyQ8gTd9f/W3BWNDdZ1Zv+dfu76OAV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fg8YaGHk; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fg8YaGHk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488280; x=1819024280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TQSGr0tkrLk6fVPuLcIOOv05D/Do2VYrAGZsnCJ7IdE=;
  b=fg8YaGHkg6Bcn26swSB4Xl37+HgV/d8qoBf9XjyIzeUHP9RSbDL9U4SZ
   klCqa2DtPqSbPZ2b5XG8LsZtya69qvqksbUc6reDfNpy4cNFgBsXBo3yK
   wcQ986QKstqyRjJvaO0UE5azDQ5ZW1cLY+cfSxSw9e5mpzn/IzllOhM5i
   qhD7VxMbQjPXFMXhZpu7z2e6LMQP04cLOHZYCPx5I+0fIO7ZIHyDfBjJE
   51ymLbVR8TtlwEyTgxx1k8DSNluThaDARAD7YDG/0a4U0cBmmWIH2fAbe
   v26yyRNpvhkz9WUUUCoSLjpcZvom9XXekivHB8XTqyESvDHBX1MPqjzSn
   Q==;
X-CSE-ConnectionGUID: PJHuIdOxSa2o+Zu4ZlnMEg==
X-CSE-MsgGUID: joKo5zVqRsO7xswZWuqgCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87974996"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87974996"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:31:19 -0700
X-CSE-ConnectionGUID: km7A+F2tT9CoZZP0jknv2Q==
X-CSE-MsgGUID: 6ALHbUZkRVOC6Nk0PHwsDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="264993710"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:31:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:31:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:31:19 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.47) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:31:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWFMt+ZDK4r0brwXfQjy6srhOrN6lg+efdSrik4WavI77AuQA6lc6XrT1BhehzhyVzAymCnXd3gSlk4SmO7wDfiAvIbI7SKUrJy0d3uoutZ2FnrJGHvSEUS3YqzMSMiA6+Gmc6hvaqy+hKGJIzKPARr1c/+lpy+Q24njKca8j48k5GM44UAyLLD8fc24tgj0fxzNzu3Sb+jfTnVKbDAV3K9jAyLNbUehhp2n2nnRTpYJmEK9WEDvEeffHHv5EehVbX6nzVbGN/uZGLRR2wjBXBrLfDnKlVNUhHZBcCocWpK1poDQyoMzvT64umSJ6YZEqTXUmo/0cwjmKCsPd4YUkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlIA6ajY2dxVlfc2eKScE2gpmRxjWBeq82GJXGdh3jQ=;
 b=sxLC3Alk4rMcieng+LDKENZ77mZjerQlnmYBxUGvXocOGVcDTvfjlxlE5UW63NU3XVp1IGTMnKJXohZ8u4GXh+3CdYKm+qOGmethYRD7zRi1aRfOwfnyYixzT9omGh84xu/FHXQkObQooyRu0jJ+3F2S+vaSbMEo49cK4/4WkrphTvNcSnMIrZFTF9thoi2FAcmmtH8BP6ta1hoNtU2gktgbfKehq/C2GTOee1q3zH2x8ieLrEfFSVWoSWerdISdCCmukLSiM/yGfOhSX0Pz26xkzwYjnIKfRa7ZXPmiv8nAZ9KIRl9mczKArXv7/iqx7o1kBZZMVjvvR2LtiDcbWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:31:11 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:31:11 +0000
Date: Sun, 23 Aug 2026 20:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet-phy@0
 (ethernet-phy-ieee802.3-c22): marvell,reg-init:
 b'\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00D\x15\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00w'
 is not of type...
Message-ID: <202608221427.nV5OBFNu-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: f147fb9b-f9dd-43bc-d242-08df01126a44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|3023799007|18002099003|11063799006|13003099007|220923002;
X-Microsoft-Antispam-Message-Info: r53hJgngNNpTW8hz1FHmF7uqFOipeG4luMqbmU7WyCHypB7Mu9g5FbB52zqYxxGYNudp57UMd9PGytBJUInGOdA+M/+EKMb89Dq3CQx7j/JPWYkSd6wUHZi8hs5V2wxz3tAK2v7LRZ6XOuZDZrqTlTv0wK5t3T7TprngtRPUAf4E2MiiNwAheub2bmrgRIiNtdZ8WodDvT1JvkOFznQhX21y0ZnH0TCqJwpHAtqX26psIXZVO80vpVW8irOx5+b26FN/Tvm4FeS1tR01v8kI7ldXJtDdthw33K+tSa5vsYu0YTyLqSx+hLcr+fsfK23RhhHQENz8zRwcn66pNTtLi0/JO0z+w5GPDVRrNDRznJYQ9hZbtW/jnpJIQQVaBk7qv8d8vI0Ox3RaLenx+ZuDmOn+gSzhGLtSqPzRoF4BSPIyuq48nxy0zqDBN75N9BPsnatJvBZxnIy65z1ZNavBSVZCuzaBS8Ojdmy+3bdnoJ6Fly/H+JrS4Hxbzb/VqvY8arXyyum/+0GFJPP9zm1ZsQDjATvHgPP1VJWXYZqteA60QkPdwp8DzwKMYZufDqpaHuKnNM1hBV2LN0fIm/9ZIK/MKI9efdQr5g5kAKWzdtUx6kkWblzP65SsbSjUxgGMnIBY2F1Iv/tVsQKrzfEV6sbNGMDpvDqKGJkg5Q16sIo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(3023799007)(18002099003)(11063799006)(13003099007)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v0NJrAfqM/imZbpW5QX4HpaUH1ICFcpuf/QNkGAfN/QndsSWwPq6z2aIQHxB?=
 =?us-ascii?Q?pta8LAf9rRMpCVbRwiUqUVZ5gkOH9J6KyuBVcfPIGpl4KB1kSHldBAb/eHV3?=
 =?us-ascii?Q?hkip7c7nt7zF1V5NWVfdWfpiHVYRuRfBmKgX/jbR4k7RTNo3/oJ9I/6z7jvP?=
 =?us-ascii?Q?Kol/e+6iqgOkEArJZrcgezMGZzVRnPGDOsaTYZlUyNSxQsarrxFSEeuZ0E4j?=
 =?us-ascii?Q?Rl8o7fiDquzGJBo4FG4GDGHmV9is6KxH1hmRANiau78l/3UO8JQj9UxVog3d?=
 =?us-ascii?Q?TxsMI9eAXGrwcXIWi93JaR/pHIoDAw+Orbfrl5w2QJ6RaMXZxzoupIAzRp1t?=
 =?us-ascii?Q?03f7DwcdQposrLx7dpl7UaPJROSpnT5OP4eFXCL6qMkVQZNbtOQmt4nKa23h?=
 =?us-ascii?Q?klqDirNOC61wS2IXk8LMWJaihI14POZltssXlRJbEzcz3ANj0MGe9yCRC38d?=
 =?us-ascii?Q?HXxJsD9VSwmCBIO/JxtUOr8bZfLVjW8GCwC4dD7d1WHPgp2sVAqRz11F+3Ct?=
 =?us-ascii?Q?LGRXaCs02wMDudJz60pGcqwkxnUTIeMkWKtlsJGxdhWA2SYb4aAYU/tNQKf7?=
 =?us-ascii?Q?OnFeRRKW0OpeZ7S1aW1C6MwuLqD1n5uzEdMAR6z0JomBJEBsobvA+e+3pH6w?=
 =?us-ascii?Q?f+ouL+MmGgkzUM39FnRsVbZMHXZ7nHMRB8RIp+ThuVp/Fof/ZTGnkJ4Q17ya?=
 =?us-ascii?Q?NNZXJ1k40Ke9eUsSfpGq6rNsEmbjhjT8v3vV8J8VIv7I4HYBAg35hhhZFKlb?=
 =?us-ascii?Q?bfe/O1wcKsbCAVIJ2XyFgC5b8xrDllzog2J0e3Y+P7kjd4Z0DGmlIyPOPdmm?=
 =?us-ascii?Q?b+6b9IzRqFBuQxtHgTshzlufIXhT+Ey0Nhnm+G8pp602Bg6qNjMdvyiSQUWv?=
 =?us-ascii?Q?qKMVGyfQ8vuGDzjTFiO+b6zG/XtqoIqJbsz6lPIeXNAS3iWk/xQ+RGI0iobu?=
 =?us-ascii?Q?pSzy/kPtAGSKR+9TU5UTw1JH5hvUVR//EKyoNVD568U2D4C6Ou3tJkCxOums?=
 =?us-ascii?Q?usZK1Hm6WWALGVe4C1m0/ylvaw9FC/LNGKayZe9hePeOi2r75HhJJj52dSuF?=
 =?us-ascii?Q?q9ImD/FHLz03eX5Ht+ditjxWyjJtzqX2fZyIqNprZeYLEZpY34PdRCiYUKES?=
 =?us-ascii?Q?sxf/XMIcIIXqffyfscpBVLO6yrKNgpFhyui2kftR9AS7UxF2aAmX0ZOb0hA6?=
 =?us-ascii?Q?KnAnf2zbedfiDTDuDWPpAMZWqK2nI5sL22tm/3UPVA9p86PuJZdWoGHafNWd?=
 =?us-ascii?Q?Fp7XG3wHWPB0KvuK1aOu4KisMYfPokMFd/ZDbpIet9Dm+9j1sMyq4QsXHCHp?=
 =?us-ascii?Q?3Pya+NWsVLSsaQKmO9M8UUJ2pyTftThygVJx+OzcDWuum0mYiTnNCvM3Qpk1?=
 =?us-ascii?Q?fWrHObBBrfWVV5MD/w87IT+3Z7GE5Q8poh9PqqhxbiR+QJc+tebs4tHEkirX?=
 =?us-ascii?Q?SyPnslnpBOQ1pPxHu9EnbKX4kkcbeMXdNh5TSRdpjahhl2mGK7bl3T226xW1?=
 =?us-ascii?Q?vTRhLV5N7m2H3r7gBQBqbjioTu//wmd5RKPF+5Q+B+DXt3BXEplaLLE+UHbE?=
 =?us-ascii?Q?Q96G7Uq8XJTE71A2KUyVGufxNQKH9Ufkq06gV1QCNkbdK7DMCXszaTldv+7X?=
 =?us-ascii?Q?KT1IshKzNQh4jRZdkRryuaOEEgEXCOhTiI+gF0U+Y+O6Ap/tvpCRql/qZGCm?=
 =?us-ascii?Q?CbpdgJRydrizJ6C+5HAlZY7tbWSkcI1A1D3UXQIUss7RNnQpAyqulKAhktZo?=
 =?us-ascii?Q?Sa1t7LHPhw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 27Q6Lk/+JUXYxfDQBzQOs2DR+nqNQwpToXcAhEfp2PulnhzQTRoC0l+DlARGFoSjlu03IffleLzXyZuJ6ZaZFDIw7RmzL4v52kfsbt6wHIjRq6i1iRSG+VNTeVfE47fdQNjE/j2vltObmg0HgvbmVQGPW0ZsTYMvej/Yz69Yx9uMVWAvetuKk0nnmNM/WWFvmnwakbtgJOaRcEyaK43tw1Ld1ZYCzJUB/Do+J/BLFWwbccxdGcfIc5DNSooPITXZj4vTrw1eqNG1UsD4SA6SoLQdLUvte0ssB84Zb56EXiUyTnfPBtllOiEOb0H5uSM/p/YFpFn6FTsCqhQpV/5aEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f147fb9b-f9dd-43bc-d242-08df01126a44
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:31:11.6206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lu3Rj+OZgXMopESmW9PsD7ikCTOJ1KCA/trhxwEF7Tq32fWfw4a2QQU04aO02oolqscRtba9xuUCz32/x++JSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26260251022fbc2f248a3d747a9b2b961b18d2d8
commit: 09ea402c1c2c5f6bf6ef7b0f00045f91b5e8e926 ARM: dts: ls1021a-moxa-uc-8410a: use compatible string ethernet-phy-ieee802.3-c22
date:   5 weeks ago
config: arm-randconfig-2051-20260814 (https://download.01.org/0day-ci/archive/20260822/202608221427.nV5OBFNu-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221427.nV5OBFNu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 09ea402c1c2c ("ARM: dts: ls1021a-moxa-uc-8410a: use compatible string ethernet-phy-ieee802.3-c22")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221427.nV5OBFNu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:844.4-847.32: Warning (interrupt_map): /soc/pcie@3500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@1401000, using 0 as fallback
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:14.10-27.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:14.10-27.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:14.10-27.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: aliases: 'enet0_rgmii_phy', 'enet1_rgmii_phy', 'enet2_rgmii_phy' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/spi@1550000/flash@0: failed to match any schema with compatible: ['spansion,s25fl064l', 'spansion,s25fl164k']
>> arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c22): marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00D\x15\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00w' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00D\x15\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00w' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet-phy@2 (ethernet-phy-ieee802.3-c22): marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00D\x15\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00w' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: gpio-keys (gpio-keys): pushbtn-key: Unevaluated properties are not allowed ('default-state' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
