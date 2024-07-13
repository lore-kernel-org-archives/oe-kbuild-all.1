Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD673AC36
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 08:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720858987; cv=fail; b=DD9tcau+FvYmhyTdcQO7UvbE9PnX0Yx3YH1Ha02B2dppnDCbhtw2boi8iIW5dDDzCLzSu4ihHuZlYaDmlF9RuZ2CvOloFhXoHrRFy6pICdcgPvMKsKRmq983eg8m4Jox1wkd9ndsHAc8TSmAqiOBc/cSGmnv9wEYbuezuRFkAWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720858987; c=relaxed/simple;
	bh=2tbqaI44UtrDeEqiMWdnNxwvz+NzVDf9lQLUZt5NAZ8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=RXuE56aLRSs2zCGKS5sMngpBVUB1o/WMa1+eKHmG1WyoSjC10HkcmzDkT4nd5DmKWGrQTxnau+FzowZZlLWGHNQXUiV217V8L/zlpzndJfyisY7/Gi0esGxSSX0XebNnTgxAKDm9srQUw+ttfP0ruKIB5tjvEGJxRJ2dHEyVG2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mb8DnoJX; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mb8DnoJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720858985; x=1752394985;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=2tbqaI44UtrDeEqiMWdnNxwvz+NzVDf9lQLUZt5NAZ8=;
  b=Mb8DnoJX+XRu0JeTnoC5JDjNt3yldNQ5Rt5Bc2GyJUqd6uVCD7Ue0YXX
   mL9O4M0Xruk41Hq7DBE12u5aIlnpzyj8S+eheuzb/f1tSOhQgOtEgtw5G
   BbPJFe7eeqRb7bze0JE7pQBxpIvMtKhnlHBt6E/GoOwRkKfA1usz92GZF
   l0BPgpgkxyoTALEVj4/YtiCvAItlGWsHHGgpBmj/Y+mWBjkpIGsEz7NLu
   ntp566k3GFM+FZhSO8rR9RNQ6IiCYXHP4AzwidZnB6089trFBOOhqpb9M
   6Nt+ut538ztSQzfsowHynNJa659eU7Jx0TRhdC0HNHVsMV/80n4MCnpP+
   g==;
X-CSE-ConnectionGUID: YTQNW9TcQQqflJ60bQ/U6Q==
X-CSE-MsgGUID: UWJ+B42NQDers9oEpBhnZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="35847369"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="35847369"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 01:23:04 -0700
X-CSE-ConnectionGUID: CK7VXlrGTaqwlrTeOllo1w==
X-CSE-MsgGUID: 83VlwLXHSVuMV/xpF+JA1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="53510715"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jul 2024 01:23:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 13 Jul 2024 01:23:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 13 Jul 2024 01:23:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 13 Jul 2024 01:23:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZynEeSVBy6vfVSI8ci5pMwy9k1Nan9CDrGumnPuLO76d3/5hhm7GeqJjbqPGhxbPdJQzGc/ajO6wMjz5dsYDcicHFURO+6/8InCXDheBVoY7lEA0iBUWD3wNRp9OUBw21idF2GdM9S5J1JdvHhXBBWRi6BoaT6nzX8Z5O+xJm952fSVcajypDcLG3GLqec+7koAI1/FaBOJMQaxubdJuQXec/QObIVCdq0e42o2ait2MYRX8yPyEVBlcaXDWa4ZiAtjYSNDkPC2FoAk/JkNG82ot/p5aIeGsDcd7trK9pGeTJmfn7vPmw/1VH7HaL+AqOqzeWKOwAAEvQi2vsoK9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lPH9+I1ZVl9a2WgDOQAXF04Oq9i9Mt7juvWFiy2xmA=;
 b=sqZdFlLtrKUmDbvY/3oyHvNHgrEz0w5einV/w3EYoMfyL3UlOGsCtORpFEbxgdInfWbAWUJdKzFi/INrLAsjGh328qUrqx6w6QBpUfmU7hAu291rDecLtm3TJ40AJ52EYMMDKCfIvNpcgS9yadfw2c2SkkG2F89HiiDGXJ/9bsFN8NiSa/vsAnmj8L8dn8OfjRtsHiAPFUkE4cOtJV4sVdxnPM96umh7fEGkrYNwcrVIF4p4LVNbqyERnDPq489dmHhtWnNggCZhRmEwLrYlY6wWS5Y4n0IdPU0E1rkT6FokL7dI5uEkD1n1lxv9SfUOrHsT/ZTF3UuwEOLM/45FQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 DS0PR11MB8018.namprd11.prod.outlook.com (2603:10b6:8:116::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.32; Sat, 13 Jul 2024 08:22:55 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7762.020; Sat, 13 Jul 2024
 08:22:54 +0000
Date: Sat, 13 Jul 2024 16:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [freescale-fslc:6.6-2.0.x-imx 2607/11383]
 arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/i2c@11009000/gpio@20:
 failed to match any schema with compatible: ['ti,tca6416']
Message-ID: <ZpI5VuA2M3qfZcUU@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|DS0PR11MB8018:EE_
X-MS-Office365-Filtering-Correlation-Id: abfe41fb-5ea4-455b-6bf2-08dca314fe9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bel/EGgSmBXuNyMpV7Ygb1c6JRqzMwa+NchJr7b/4B34+B9UTZ+6JMwQ0Eat?=
 =?us-ascii?Q?kXW0AazcDRZ69ohHcOnlKj5Ny9Mej08rFU0M7N4HSMP+pJhs2dSQ0PLPrDcW?=
 =?us-ascii?Q?u1wA8hi84z+2oBpSIOpYg+qwDQb/1IR+2uPUcbEqQSbUEO4OyeayYq4X2gOf?=
 =?us-ascii?Q?4HAFEH6bueFA4R6h0e+flCV2qUwy1NNEP8WKEZL7ElrckuqyGyZZzELjN4d4?=
 =?us-ascii?Q?8L0KlrUXzjyxXz9UeOsEporEiG5/ez8tKQvBRdv6e3X9dX6YxM6/IE/QSCT3?=
 =?us-ascii?Q?WWpuQxz3RIrcMogqoeGUE2MXR3q/V5bcqo6sTM82zuyBO7FH5czoghREFQcF?=
 =?us-ascii?Q?mn/qfHNOrM6lV5Jgkd5/onnrQfTD08F+eCcSMW7XiTucnnWdORJ1Kn8B3wA4?=
 =?us-ascii?Q?wGt5PqvurhyRBBWXO1F3uDJfP+LRHnyt5sKtvIAhhaYOd6aLh3N4mC69H1s7?=
 =?us-ascii?Q?gC00JinAomqPokpKWjbjWCsxHziVvbdgdB0Karzype7UN4NduSJYRhXv9/sa?=
 =?us-ascii?Q?pQtvzO9NV9c9qK2ImWXMmbsM6TcLM8JctrUUqXsprYypYhvkEV3bFulSr1WK?=
 =?us-ascii?Q?TXlN/xUTDv77sTDPBEyYDvzl54tgAtXCfV1D5Tmns1sZG3OXbGSirwqiKrf3?=
 =?us-ascii?Q?iMFNn4wApGnVhYvphiZAMQ1KvWXmIicoRraFSMEZatK8bCoGE0SL0b6dK11D?=
 =?us-ascii?Q?f7HkI8HMyXzCPA1t3jcy1+U8Bfjd57VHTb1h2MHNHakvw1P2m2e/u16nx0pU?=
 =?us-ascii?Q?pFoC8KgbBfoT1qmdOlW4L5nhCBWnU6ys7pKk5vGnPuoBiwBSiATa9K4SS/fP?=
 =?us-ascii?Q?dpK6PoznR8NIvxReSbCso86DMyTpztvuohywhP1wUbKwDJDJrfHJTmmps0sx?=
 =?us-ascii?Q?koG3pKLBnUF2s1JMjDs/dkRe+oiZoCLPsekcMXEGkuKos3DYWXV8aODDqBh1?=
 =?us-ascii?Q?97D8Wd5OL9St+tzV6m81QIwWGtHZNMPvg7scr4nOA3mT+IhkJrmWQAuoRk5v?=
 =?us-ascii?Q?c6vZ7FiPIrhXtq1J2MdA9THF7ISrCA6BDM7+5Jt4sdue1UtjTMuKqet5JBz0?=
 =?us-ascii?Q?Q/IKZYtYp43SV9GV5Cg742U33SV7ziNhFskfIA31mxMt6vhT8Ir05X70kHLz?=
 =?us-ascii?Q?iXJa+FIbrH4HlJaxg09wzZXEymNnv4aIRAD42ethb0XbP1RS3iGsjBEuqxm8?=
 =?us-ascii?Q?6Y/1f3dR7xEHyr1f/eFHOIamsxmjUOiHUu3vwdOmrtpHHUuDGAaGA4xo19U3?=
 =?us-ascii?Q?aLex8dOvXpDhcktQ09I+7HIO5bP93+nsIbdO5sIWJF3UOi5EtPAaZm1GKekW?=
 =?us-ascii?Q?llFIAy6gIMNXR5z/y7OJCDS5y/AFU6NPkwrShpPzT/NHigdqRNWNnzBGj4GR?=
 =?us-ascii?Q?+MTb+ng=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sGmuiId2bqScKa4Nvi6JjYEd0z1LxtOCnmBczGq1W17LJf+1gcjIRrxi7w3M?=
 =?us-ascii?Q?VHxL/2gQb822SoNhIOy/EnHXY3cf5oOAWpm65KT05J5m/v9emzGBFw0/bBQx?=
 =?us-ascii?Q?ukVI7OiyLBQHUOhajbj4/QarTZtUz2YJsgskyzMD2gS48oJ9NMbRRhnZc+N8?=
 =?us-ascii?Q?oaE1J624v1+oNwffjqOwJ29M7kr1SOXvNXuXaCLSrMfJB1Jv8oOwNlp7zDqq?=
 =?us-ascii?Q?/4YVTOaa0TkpXaQvGZE55+G1MJcsCgvPmEJWHkZ5BxHAQQt/9DyYlMPg8o64?=
 =?us-ascii?Q?9+94gaEqJOfqFEjCTwqmeiC5WcGfwfpt+1kZR/evTYe3SqOIt/ODyJ2ZrHSY?=
 =?us-ascii?Q?RsHDdgGGMGclqxW9fkQOoeY5vPI9ZwgI0At8jMub2oFzWdhhFLPjR9ptyENZ?=
 =?us-ascii?Q?/C2nACGB5HwQN/0zgaquzIzBF0KJhwX+pQQVVnuStj2xeLiWB0MmyGKjLMMU?=
 =?us-ascii?Q?EIpNe4dJkVIcHhEe+SYJamgSVowLi6FM6lmGiXR2niNroUcKE4h0oACb49Nt?=
 =?us-ascii?Q?PCsybbPEV6X4zykcChtRy6xMM5JT3hyhYdLxzB05aYolFc40j1i97cFsYVWC?=
 =?us-ascii?Q?eIEWp+mgE25RUCNKHVtp3BN60mZfpG+cP9hcUR914RlcgPY3xFeek53g9KnL?=
 =?us-ascii?Q?lNADevQ5I/jkYFyb50AXSDCcejHC58HtMFn3I5iQ3bue2HJFnd2e9ceuMxSE?=
 =?us-ascii?Q?/KXF21MlRYuLavMzX6GrNj+CKTs9nPBdPZjTGVL9ZassyECqKkaPCsXCAghF?=
 =?us-ascii?Q?LQ38BuodJvUAC61KUYUeZB8sOXGrO1Gqbm4OfIitUEZ60zshjVezLXsO4dSU?=
 =?us-ascii?Q?Q1dmvyN1NymG9CgSlEA8C6BJmW0qYndNG5ce5/7+JgpE2UeJCjyjTUyDc06p?=
 =?us-ascii?Q?sNaql4laWcWXd/bGrJFKrbTZbqn610rXer+RtArFFhUi2ZhoQPoEQOKDY3Hf?=
 =?us-ascii?Q?ma2YjhtSRiiTe9v30B6+EY4m76Yzb4lQxqH3/n1ucUS2e1aqLPon+PACp8QT?=
 =?us-ascii?Q?VlfVOkgP+8mSC2r/PkaTOnOcwHQKuvkWNY8CcBg0CeOuhL9KC+twcg7P06Yr?=
 =?us-ascii?Q?hKMhxX6wAuzXe6xw/9i1nxYGYamWalSIwm+CEdHfVfMV4//0jrFfkVeEzyXE?=
 =?us-ascii?Q?rSyCzZz4cv2S6cjlumpxs0HLzZT08dd90DQw41AiGAmRjR1+xtKmbA0hSKHX?=
 =?us-ascii?Q?Vg1YyR6c4o1JaWkkmEnIrErDpnlkhVAvxn7ce2nWyFjpursUbL8MRgHiQNkg?=
 =?us-ascii?Q?v0WGm/okuLXYekbV3Ka7Y9XCNxl6yoWwMjxLRjvjFXLSE6jju8JlJ5cRder9?=
 =?us-ascii?Q?XRo0nIu3yb4vDuFcCAZBzlsTUOG2achMtVXstHBrNcMLuHd7kHx+U7EOhXvR?=
 =?us-ascii?Q?rvU4bT6bsj2yP4H1eIHHJ7ftWJ8972SoE2tJ6Rffy5VaS1ARlI1bFvwY4SUZ?=
 =?us-ascii?Q?nLz7BDDg2WoQAPuqHiQeAahPGtFjsj+GIJFBXGwL7Iw0W8weztXZR5T9jP/k?=
 =?us-ascii?Q?KbkraI/dPxVIWPdZmFULJotw7j7XCtJQCWIOVJKc0Y9qL5hx+lbJ3cM1nwcO?=
 =?us-ascii?Q?tt6AbVe2Gm6dEfmAKqrrr2cyEcichTXi0gNHqIPOLRVJqRGJ2lfaf/rJ7Yzg?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abfe41fb-5ea4-455b-6bf2-08dca314fe9e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2024 08:22:54.9001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HkzGw7pIm2vyABD1G7ylsn97MObLVYry5SzXMyF11gihywsb8uzUBTTO5PJSdakUkpKFNDwTGwU7/ynRABcVXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8018
X-OriginatorOrg: intel.com

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   a9adc0280d6e8fde5718caf259e89692ba67a9ea
commit: 5c8cf515d45b79e8a788443c1446204e742a1549 [2607/11383] MLK-19251-01 =
gpio: max732x: add output IO default voltage set
:::::: branch date: 31 hours ago
:::::: commit date: 9 months ago
config: arm64-randconfig-051-20240712 (https://download.01.org/0day-ci/arch=
ive/20240713/202407130715.dx1a7Wyo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240713/202407130715.dx1a7Wyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407130715.dx1a7Wyo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/timer@10008000: fa=
iled to match any schema with compatible: ['mediatek,mt8516-timer', 'mediat=
ek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/timer@10008000: fa=
iled to match any schema with compatible: ['mediatek,mt8516-timer', 'mediat=
ek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: syscfg-pctl@10005000: c=
ompatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: pinctrl@1000b000: 'ethe=
rnet', 'gpiodefault', 'i2c0', 'i2c2' do not match any of the regexes: 'pinc=
trl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/interrupt-controll=
er@10200620: failed to match any schema with compatible: ['mediatek,mt8516-=
sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/interrupt-controll=
er@10200620: failed to match any schema with compatible: ['mediatek,mt8516-=
sysirq', 'mediatek,mt6577-sysirq']
>> arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/i2c@11009000/gpio@=
20: failed to match any schema with compatible: ['ti,tca6416']
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/syscon@15000000: f=
ailed to match any schema with compatible: ['mediatek,mt8167-imgsys', 'sysc=
on']
   arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dtb: /soc/syscon@16000000: f=
ailed to match any schema with compatible: ['mediatek,mt8167-vdecsys', 'sys=
con']
--
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: /soc/timer@10008000: fa=
iled to match any schema with compatible: ['mediatek,mt8516-timer', 'mediat=
ek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: /soc/timer@10008000: fa=
iled to match any schema with compatible: ['mediatek,mt8516-timer', 'mediat=
ek,mt6577-timer']
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: syscfg-pctl@10005000: c=
ompatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: pinctrl@1000b000: 'ethe=
rnet', 'gpiodefault', 'i2c0', 'i2c2' do not match any of the regexes: 'pinc=
trl-[0-9]+', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-=
pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: /soc/interrupt-controll=
er@10200620: failed to match any schema with compatible: ['mediatek,mt8516-=
sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: /soc/interrupt-controll=
er@10200620: failed to match any schema with compatible: ['mediatek,mt8516-=
sysirq', 'mediatek,mt6577-sysirq']
>> arch/arm64/boot/dts/mediatek/mt8516-pumpkin.dtb: /soc/i2c@11009000/gpio@=
20: failed to match any schema with compatible: ['ti,tca6416']
--
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /pcie@1003000: faile=
d to match any schema with compatible: ['nvidia,tegra210-pcie']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tse=
c@54100000: failed to match any schema with compatible: ['nvidia,tegra210-t=
sec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /host1x@50000000/tse=
c@54500000: failed to match any schema with compatible: ['nvidia,tegra210-t=
sec']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /gpu@57000000: faile=
d to match any schema with compatible: ['nvidia,gm20b']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /interrupt-controlle=
r@60004000: failed to match any schema with compatible: ['nvidia,tegra210-i=
ctlr']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: faile=
d to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,t=
egra148-apbdma']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /dma@60020000: faile=
d to match any schema with compatible: ['nvidia,tegra210-apbdma', 'nvidia,t=
egra148-apbdma']
>> arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /i2c@7000c400/gpio@7=
4: failed to match any schema with compatible: ['ti,tca9539']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /i2c@7000c400/gpio@7=
7: failed to match any schema with compatible: ['ti,tca9539']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /i2c@7000d000/pmic@3=
c: failed to match any schema with compatible: ['maxim,max77620']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmc@7000e400: powerg=
ates:sor:clocks: [[3, 182], [3, 183], [3, 144], [3, 145], [3, 146], [3, 48]=
, [3, 82], [3, 181], [3, 207], [3, 56]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20=
-pmc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: pmc@7000e400: 'pinmu=
x' does not match any of the regexes: '^[a-f0-9]+-[a-f0-9]+$', 'pinctrl-[0-=
9]+'
   	from schema $id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20=
-pmc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /memory-controller@7=
0019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: external-memory-cont=
roller@7001b000: '#cooling-cells' does not match any of the regexes: 'pinct=
rl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidi=
a,tegra210-emc.yaml#
   arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dtb: /clock@70110000: fai=
led to match any schema with compatible: ['nvidia,tegra210-dfll']
--
>> arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb: /soc/i2c@e6500000/gpio@2=
0: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb: hdmi@39: 'avdd-supply' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb: hdmi@39: 'dvdd-supply' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb: hdmi@39: 'pvdd-supply' i=
s a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb: hdmi@39: 'dvdd-3v-supply=
' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77970-eagle.dtb: hdmi@39: 'bgvdd-supply' =
is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
--
>> arch/arm64/boot/dts/renesas/r8a77980-condor.dtb: /soc/i2c@e6500000/gpio@=
20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a77980-condor.dtb: /soc/i2c@e6500000/gpio@=
21: failed to match any schema with compatible: ['onnn,pca9654']
--
>> arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dtb: /soc/i2c@e6500000/gp=
io@20: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dtb: /soc/i2c@e6500000/gp=
io@21: failed to match any schema with compatible: ['onnn,pca9654']
--
>> arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: /soc/i2c@e6500000/gpio@2=
0: failed to match any schema with compatible: ['onnn,pca9654']
   arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: hdmi-encoder@39: 'avdd-s=
upply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: hdmi-encoder@39: 'dvdd-s=
upply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: hdmi-encoder@39: 'pvdd-s=
upply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: hdmi-encoder@39: 'dvdd-3=
v-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
   arch/arm64/boot/dts/renesas/r8a77990-ebisu.dtb: hdmi-encoder@39: 'bgvdd-=
supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv75=
11.yaml#
--
   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi:328.10-338.6: Warning (gr=
aph_child_address): /bus@f0000/i2c@20000000/tps6598x@3f/connector/ports: gr=
aph node has single child node 'port@0', #address-cells/#size-cells are not=
 necessary
   arch/arm64/boot/dts/ti/k3-am62-main.dtsi:608.22-616.5: Warning (graph_ch=
ild_address): /bus@f0000/dwc3-usb@f900000/usb@31000000: graph node has sing=
le child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: syscon@43000000: compatible: ['s=
yscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-sk.dtb: syscon@100000: compatible: ['sys=
con', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-sk.dtb: /bus@f0000/i2c@20010000/gpio@22:=
 failed to match any schema with compatible: ['ti,tca6424']
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: syscon@43000000:=
 compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: syscon@100000: c=
ompatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-dev.dtb: /bus@f0000/i2c@2=
0010000/gpio@21: failed to match any schema with compatible: ['nxp,pcal6416=
']
--
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: syscon@43000000: co=
mpatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: syscon@100000: comp=
atible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-dev.dtb: /bus@f0000/i2c@2001=
0000/gpio@21: failed to match any schema with compatible: ['nxp,pcal6416']
--
   arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi:328.10-338.6: Warning (gr=
aph_child_address): /bus@f0000/i2c@20000000/tps6598x@3f/connector/ports: gr=
aph node has single child node 'port@0', #address-cells/#size-cells are not=
 necessary
   arch/arm64/boot/dts/ti/k3-am62-main.dtsi:608.22-616.5: Warning (graph_ch=
ild_address): /bus@f0000/dwc3-usb@f900000/usb@31000000: graph node has sing=
le child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: syscon@43000000: compatible: [=
'syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: syscon@100000: compatible: ['s=
yscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /bus@f0000/i2c@20010000/gpio@2=
2: failed to match any schema with compatible: ['ti,tca6424']
   arch/arm64/boot/dts/ti/k3-am62-lp-sk.dtb: /bus@f0000/i2c@20010000/gpio@2=
3: failed to match any schema with compatible: ['ti,tca6424']
--
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dtb: /bus@f0000/i2c@20010000/gpio@22=
: failed to match any schema with compatible: ['ti,tca6424']
--
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: syscon@43000000: 'mux-controlle=
r' does not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-control=
ler@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[=
0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-cont=
roller.yaml#
>> arch/arm64/boot/dts/ti/k3-am642-evm.dtb: /bus@f4000/i2c@20010000/gpio@22=
: failed to match any schema with compatible: ['ti,tca6424']
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: tscadc@28001000: 'dmas' is a re=
quired property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,am3359-tscadc.yam=
l#
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: tscadc@28001000: 'dma-names' is=
 a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,am3359-tscadc.yam=
l#
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: adc: 'ti,adc-channels' is a req=
uired property
   	from schema $id: http://devicetree.org/schemas/iio/adc/ti,am3359-adc.ya=
ml#
--
   arch/arm64/boot/dts/ti/k3-am642-sk.dtb: syscon@43000000: 'mux-controller=
' does not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controll=
er@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0=
-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-cont=
roller.yaml#
>> arch/arm64/boot/dts/ti/k3-am642-sk.dtb: /bus@f4000/i2c@20010000/gpio@70:=
 failed to match any schema with compatible: ['nxp,pca9538']
--
   arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi:281.20-319.4: Warning (unit_addr=
ess_vs_reg): /bus@100000/bus@28380000/bus@47000000: node has a unit name, b=
ut no reg or ranges property
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: scm-conf@40f00000: c=
ompatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: /bus@100000/bus@2838=
0000/i2c@40b00000/gpio@20: failed to match any schema with compatible: ['nx=
p,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: /bus@100000/bus@2838=
0000/i2c@40b00000/gpio@21: failed to match any schema with compatible: ['nx=
p,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: /bus@100000/bus@2838=
0000/i2c@40b00000/gpio@25: failed to match any schema with compatible: ['nx=
p,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: scm-conf@100000: com=
patible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: clock@4080: compatib=
le: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dtb: clock@4090: compatib=
le: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
--
   arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi:281.20-319.4: Warning (unit_addr=
ess_vs_reg): /bus@100000/bus@28380000/bus@47000000: node has a unit name, b=
ut no reg or ranges property
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: scm-conf@40f0000=
0: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: /bus@100000/bus@=
28380000/i2c@40b00000/gpio@20: failed to match any schema with compatible: =
['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: /bus@100000/bus@=
28380000/i2c@40b00000/gpio@21: failed to match any schema with compatible: =
['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: /bus@100000/bus@=
28380000/i2c@40b00000/gpio@25: failed to match any schema with compatible: =
['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: scm-conf@100000:=
 compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: clock@4080: comp=
atible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dtb: clock@4090: comp=
atible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
--
   arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi:281.20-319.4: Warning (unit_addr=
ess_vs_reg): /bus@100000/bus@28380000/bus@47000000: node has a unit name, b=
ut no reg or ranges property
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: scm-conf@40f00000=
: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: /bus@100000/bus@2=
8380000/i2c@40b00000/gpio@20: failed to match any schema with compatible: [=
'nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: /bus@100000/bus@2=
8380000/i2c@40b00000/gpio@21: failed to match any schema with compatible: [=
'nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: /bus@100000/bus@2=
8380000/i2c@40b00000/gpio@25: failed to match any schema with compatible: [=
'nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: scm-conf@100000: =
compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: clock@4080: compa=
tible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dtb: clock@4090: compa=
tible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
--
   arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi:281.20-319.4: Warning (unit_addr=
ess_vs_reg): /bus@100000/bus@28380000/bus@47000000: node has a unit name, b=
ut no reg or ranges property
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: scm-conf@40f00=
000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: /bus@100000/bu=
s@28380000/i2c@40b00000/gpio@20: failed to match any schema with compatible=
: ['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: /bus@100000/bu=
s@28380000/i2c@40b00000/gpio@21: failed to match any schema with compatible=
: ['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: /bus@100000/bu=
s@28380000/i2c@40b00000/gpio@25: failed to match any schema with compatible=
: ['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: scm-conf@10000=
0: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: clock@4080: co=
mpatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-m2.dtb: clock@4090: co=
mpatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
--
   arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi:281.20-319.4: Warning (unit_addr=
ess_vs_reg): /bus@100000/bus@28380000/bus@47000000: node has a unit name, b=
ut no reg or ranges property
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: scm-conf@40f0=
0000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: /bus@100000/b=
us@28380000/i2c@40b00000/gpio@20: failed to match any schema with compatibl=
e: ['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: /bus@100000/b=
us@28380000/i2c@40b00000/gpio@21: failed to match any schema with compatibl=
e: ['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: /bus@100000/b=
us@28380000/i2c@40b00000/gpio@25: failed to match any schema with compatibl=
e: ['nxp,pcal9535']
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: scm-conf@1000=
00: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: clock@4080: c=
ompatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dtb: clock@4090: c=
ompatible: 'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
--
   arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi:281.20-319.4: Warning (unit_addr=
ess_vs_reg): /bus@100000/bus@28380000/bus@47000000: node has a unit name, b=
ut no reg or ranges property
>> arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: /bus@100000/bus@28380000=
/bus@42040000/i2c@42120000/gpio@39: failed to match any schema with compati=
ble: ['nxp,pca9554']
   arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: scm-conf@40f00000: compa=
tible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: /bus@100000/i2c@2000000/=
gpio@21: failed to match any schema with compatible: ['nxp,pca9555']
   arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: scm-conf@100000: compati=
ble: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: clock@4080: compatible: =
'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-am654-base-board.dtb: clock@4090: compatible: =
'anyOf' conditional failed, one must be fixed:
   	['syscon'] is too short
   	'syscon' is not one of ['allwinner,sun8i-a83t-system-controller', 'allw=
inner,sun8i-h3-system-controller', 'allwinner,sun8i-v3s-system-controller',=
 'allwinner,sun50i-a64-system-controller', 'amd,pensando-elba-syscon', 'brc=
m,cru-clkset', 'freecom,fsg-cs2-system-controller', 'fsl,imx93-aonmix-ns-sy=
scfg', 'fsl,imx93-wakeupmix-syscfg', 'hisilicon,dsa-subctrl', 'hisilicon,hi=
6220-sramctrl', 'hisilicon,pcie-sas-subctrl', 'hisilicon,peri-subctrl', 'hp=
e,gxp-sysreg', 'intel,lgm-syscon', 'marvell,armada-3700-usb2-host-misc', 'm=
ediatek,mt8135-pctl-a-syscfg', 'mediatek,mt8135-pctl-b-syscfg', 'mediatek,m=
t8365-syscfg', 'microchip,lan966x-cpu-syscon', 'microchip,sparx5-cpu-syscon=
', 'mstar,msc313-pmsleep', 'nuvoton,ma35d1-sys', 'nuvoton,wpcm450-shm', 'ro=
ckchip,px30-qos', 'rockchip,rk3036-qos', 'rockchip,rk3066-qos', 'rockchip,r=
k3228-qos', 'rockchip,rk3288-qos', 'rockchip,rk3368-qos', 'rockchip,rk3399-=
qos', 'rockchip,rk3568-qos', 'rockchip,rk3588-qos', 'rockchip,rv1126-qos', =
'starfive,jh7100-sysmain']
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
--
   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi:35.39-40.5: Warning (unit_addr=
ess_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4080: node has a un=
it name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi:49.39-53.5: Warning (unit_addr=
ess_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4000: node has a un=
it name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: syscon@40f00000: =
compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: syscon@47000000: =
compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: hbmc-mux: $nodena=
me:0: 'hbmc-mux' does not match '^mux-controller(@.*|-[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml#
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/i2c@2=
000000/gpio@21: failed to match any schema with compatible: ['ti,tca6408']
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/i2c@2=
000000/gpio@20: failed to match any schema with compatible: ['ti,tca6416']
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/i2c@2=
000000/gpio@22: failed to match any schema with compatible: ['ti,tca6424']
   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/i2c@2=
010000/gpio@20: failed to match any schema with compatible: ['ti,tca6408']
--
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:72.39-77.5: Warning (unit_addr=
ess_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4000: node has a un=
it name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: syscon@40f00000: =
compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: /bus@100000/i2c@2=
000000/gpio@20: failed to match any schema with compatible: ['ti,tca6416']
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: /bus@100000/i2c@2=
000000/gpio@22: failed to match any schema with compatible: ['ti,tca6424']
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: /bus@100000/i2c@2=
010000/gpio@20: failed to match any schema with compatible: ['ti,tca6408']
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: /bus@100000/i2c@2=
030000/gpio@20: failed to match any schema with compatible: ['ti,tca6408']
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: /bus@100000/i2c@2=
060000/gpio@20: failed to match any schema with compatible: ['ti,tca6408']
--
   arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: syscon@40f00000: compa=
tible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: /bus@100000/bus@283800=
00/i2c@40b10000/gpio@20: failed to match any schema with compatible: ['ti,t=
ca6408']
>> arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dtb: /bus@100000/i2c@200000=
0/gpio@21: failed to match any schema with compatible: ['ti,tca6416']
--
   arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: syscon@40f00000:=
 compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: /bus@100000/i2c@=
2000000/gpio@21: failed to match any schema with compatible: ['ti,tca6408']
>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: /bus@100000/i2c@=
2000000/gpio@20: failed to match any schema with compatible: ['ti,tca6416']
>> arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dtb: /bus@100000/i2c@=
2000000/gpio@22: failed to match any schema with compatible: ['ti,tca6424']
--
>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: /bus@100000/i2c@2000000/gpio@21: =
failed to match any schema with compatible: ['ti,tca6416']
--
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: /bus@100000/i2c@2000000/gpio@2=
0: failed to match any schema with compatible: ['ti,tca6416']
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: /bus@100000/i2c@2000000/gpio@2=
2: failed to match any schema with compatible: ['ti,tca6424']

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

