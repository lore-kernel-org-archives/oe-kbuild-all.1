Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F5B3002D4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 12:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764936641; cv=fail; b=PyCy8aKmAmp/JalrlremjFi7FSZCvOCdv28cLpa8OozSshmBpf+/xKxwhGlc3Fuj3My/cEPN3//Hv1m+lzOVDBwD/HIAUNF5bjPPKDzJX0V65h3Pz8cUtjbka9AQWPSD+ymngPkeIANgUcrIp1oyP8Ws1Dj3EeSlc1Hf/83dYbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764936641; c=relaxed/simple;
	bh=HRrX6mcubgAF7uvZZcrS1C2bNZTyZ/OAeTi2yjjDj7Q=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Db0/Z/vl3T/yNBxpksZCky3pTe9+AlbR3U3UBazK5KNXvTsDMca2BSm2VoexHPl9juCIiMRsVMZfkX6FpRgZDkWjE8Fk8raymd1SZJaTu4pYJ9y+oVOMxf7J/i6TThqdTzdT/4owRx/tktvHfqXTXgYz+zhUKAaFesDwIkBX50Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lRDFaNtw; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lRDFaNtw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764936640; x=1796472640;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HRrX6mcubgAF7uvZZcrS1C2bNZTyZ/OAeTi2yjjDj7Q=;
  b=lRDFaNtwoqguB0iTQGoMEoEjz2eDPEBOvOZYDtga30GOaXq8XXO5tXmS
   WsFFVn2H3eyZZeKVkqtkmFJAIoAJIZDhtj++/W04MzdiiBN+h0Ua+Y1n4
   rBdDS1Jr92zn7CeEqrHjRDpL6ptG+ira6AsUWf04Phj81KN8p0rG1NRWs
   Nx2q/qlprZKw2H2G8iJ90bbQsnhlalSoT6AVzkH878lHM+UplR2uwP14q
   EJjqmEjm0Ekl0Fz+rbMTJzaQN7rfSNc0CwZDkHO7Yj+V+uxsrSvLTen9i
   PHU39koglzpt0fSqn17IeU7j2RB/DgbOgPQW0cYyBw6R0X/I7A0331i+Q
   Q==;
X-CSE-ConnectionGUID: iutNf5HiQR2of2oFiN8HoQ==
X-CSE-MsgGUID: Kc2yB79bQ36979Rv9g3CVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84574152"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="84574152"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 04:10:39 -0800
X-CSE-ConnectionGUID: F6rgpwPPQreaeNLdUacvkg==
X-CSE-MsgGUID: bILGUL9LTau4DkmDxhWeIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="194932695"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 04:10:38 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 04:10:38 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 04:10:38 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 04:10:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L28+C1alkc4xKJX09gYHtFrzkGKRDzQksg459CuvX++/0X2pYHmYzp7SggjUpsRx7R07rahxvRBfe+GRHW/cRKKhv4Yx0c8RSjkP3wVdr1G+u96kwK6FkVdr8M9pIYCmB7rybQGuxio6c+4EbFA8Vo23PcT/g8kjGOrvU/HWRNrVkd1RWkHo2nilZpx5jF3KsE4T4rt7WWXmXezX3GY983okJ9zz6XctECfyYFiKbu7ioD9Ktd86qSxd7RRM7wWY6qSlNFbqY2oe0E/A9EjKva4Wf1unB3DOsP14DCSBvRNJUl01fYnXc4/sp7X8g7xcseXaoLoSoP+1IG55TvD7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05XRaFzstMPqN4H9d1oCR3KLGBAJVjdHL79by1lH+cU=;
 b=oZu3BbrmCHZvBSwNtJj7+JGKIFCSD/S1Hq5pG5GBPmxNykhjhVrSCb1LsSPrhBPjJZz8omunc+SnKuuyixOcFFFfYZsP9ZLmy2MU0QXe02udgSM1jsNMeXbG8FF+gw+ENd1q4HDswTGqN3PW6v3NUiEDjatnb3dMrIQ+NSfnp5T3OJx140JNxlt8jMc3REz3wut6vSigmu25rZQSaxztvR5B5kzZWjvma7JmnrH5SdrEWdHfthe2QWonmfGWV4cpva97I+4asgaCvgYDzxYB6WmR9GViAnZ/qnAO/UzG8S8ZpBLEmVc8SDWLsjh0ms211HLPHofQp1X4+YtFainR/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA0PR11MB4559.namprd11.prod.outlook.com (2603:10b6:806:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 12:10:32 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 12:10:31 +0000
Date: Fri, 5 Dec 2025 20:10:23 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: vmlinux.o: warning: objtool:
 _RINvMs3_NvNtNtCshc5sK6KjdJJ_6kernel4sync4lock1__INtB6_12___ThePinDataINtNtNtBc_5alloc4kvec3VecINtNtCsbsbRiabPlh9_4core3pin3PinINtNtB1a_4kbox3BoxINtNtBc_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10DeviceDataENtNtB1a_9...
Message-ID: <aTLLr1GnQF62vTwP@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA0PR11MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b59345-0f03-4211-3613-08de33f74966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t7Dp8JRilarUiZUqveAtYbGdLByxGo/XKCamUXUqb25VlUiEI0XADJAMAzZt?=
 =?us-ascii?Q?/ONbcJKtcFXPWIQH6f3knOBgz2uVvjZwZAnXi7d8SfTAf2aoXC1HUg3Zdfm8?=
 =?us-ascii?Q?utL4ScEqbDB2ynNnVl5N6UGCeLPCkqjWV0DuIQKLyuRoxmeVk7ezErYRPA1s?=
 =?us-ascii?Q?yEyMvcN1VqQVNlTIu6sJUdvHbe8UpB+MgBP3XNlrLb2XuFCgKbVVvy9M0qJo?=
 =?us-ascii?Q?YL68PfNPimKjofgkypk0hDvcrpW6NYYRV1h53xEHIAzZ4XVUogxAJmJrRit1?=
 =?us-ascii?Q?Ax8nmROFCZ5cUAzcw0ZIIEHIs1vzx5CgfeI8VcRItoCuYkTdHxcfa0oFUYPk?=
 =?us-ascii?Q?V2PZN1IZOn1eXYY4x0q4sX3D9izUmQ3cXci9NV8DzPa1RBSyOtFz8IgAXSvf?=
 =?us-ascii?Q?IZzxHbEICEgvAga6Lr13t3a8jWewNVLltrpAJVOIDCBWeaY5yDxBGtfM3zaw?=
 =?us-ascii?Q?jNolJuXJyovP+fNbrdym0skbe+h4JiIDRet1TxDGf90kmGOe/ia8vnUlUjZf?=
 =?us-ascii?Q?pzQPcg7o7XGB4L8869fq9Qtk0Z5vIKdq9pzetKjsud3BbZSw8Vqqmj4EdEOb?=
 =?us-ascii?Q?HBtUFr7LfmRBlt65OhJlBcwX9gHDZWaDGe5yQZkcRraubZJjTLW0CVn1n+re?=
 =?us-ascii?Q?Z6avKi7ZyW4C/6UV+3NAuBqGRJzwKxVnz9S92/D3oX2DbgrboYFMVf9Amzgn?=
 =?us-ascii?Q?VtJbAmdUs4qyTHtpBnuDILyeDXE70d0TxOd0i1vClNut/tGnK66BS+E3vl/g?=
 =?us-ascii?Q?gI/RhoOSjWfcqi8Dtdsz2LUPja8FrK4xI7gN2Az30pp3wO8ZzwLXDvYsRZEO?=
 =?us-ascii?Q?NzLzYGnr0/TXnqqWaKgIHoFiViPMigC1MA1RlC3uvw71VhVL7rj+um+pWw/C?=
 =?us-ascii?Q?6RocYtJ95c8fFtVWMc2NJ0nSZb1EJLqoshmRLSRXmFVl9Blx+t9yg5H7uXEt?=
 =?us-ascii?Q?204IZQlH/ZCijepYFmPe85hTkxzfuTEbHdAO3lAbaj1fSKtrn0fF5TvsyHSW?=
 =?us-ascii?Q?2Ivnhs8T7ytQQorYJD/9lRG2kYbef9ijtmBRJWwQN/eMhRn2qWYE7igEXeSm?=
 =?us-ascii?Q?YTL1gB4FOEqmcib3qwLv9M/AOivd71csZR9le+XUMjSCIROqNx182t50rbnT?=
 =?us-ascii?Q?+DAwv9Wm7kW6cnKhGTslxlc+qAEqxi9aqS3tfiAOh0tgjCNYn29cPxW1vV7R?=
 =?us-ascii?Q?dEhOhMrHh067lj10Ck+a02UT6SBy9BrcY7PlLewoDe/ycL5VqT1/JT4zkp+S?=
 =?us-ascii?Q?RU/Vw3jB6BYeCs8FcJ9cB3zYJ4/BXQNsPxMM1Ucm4Zm62dRo8QiOYupd+dsS?=
 =?us-ascii?Q?ATZKMjqS6teIx8bt2+nS74wjbo82/SRc7IJAYw8BBkd5G4K1SkZJcwEX3St5?=
 =?us-ascii?Q?8wCLTEeBFA4WLcSNQypB4O97CxSQJ/0TGO+b3SjkcQjRS23SQQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ey/VJETpltYAdCQougS8DBelY8UYMbfPk6GJMW+vwVN1Cxm7K51Iyu/3xaF1?=
 =?us-ascii?Q?Gn9HX+9dXgRMup/3ra67zRhZMoulcl3+I1oPnXSGw4AHz5+J3l043Jfmy+av?=
 =?us-ascii?Q?cVC1+Q1z2WFqzNfdpL/ETuhTe9oJlz6Agpbkddc+H8QE2TPY6mtR2KEcvo5J?=
 =?us-ascii?Q?2tRdt5ZOPJAsj0J+n6ntTThViIXcrUr+6pf97FWIuC4jq++O8c/vbcIJQqxu?=
 =?us-ascii?Q?KO85KgwrnTG+DVoGiO6NIs8UqofzQ10ChXKHp2fnX5ULs3KK150I1hAeOPCc?=
 =?us-ascii?Q?JR315IAMJwjKRPXGe4OYwJ6exEZMWfr8l95CLs0lxceTUyWbpW8D/ziMb66B?=
 =?us-ascii?Q?a7Qt4wjZB4QnPX2lqJtoZFb2GyxXYz3s7j4jOgORqS83HBWaguxBdfpDWUOQ?=
 =?us-ascii?Q?u7rgwtW6CPSGzoSd2YH3fhPkrPPar2yHPfp4FlqvUglhZoCt/qms2aNx98pi?=
 =?us-ascii?Q?XQT43r5im5Ak9QmwnuH69B90aXh7pDFnFdnv4MMgz48OvbwoyIo3XUzoqKS3?=
 =?us-ascii?Q?+ZNj1DSzOw3UgZtCxeVs4aR0pRuJg0RAnlFWk1qWHUqsQjqEQ5fOOIEHa+nX?=
 =?us-ascii?Q?w6ak3zEJd6k4mvTuDpX/FeeAPD8FpgE9L4cON/o2LyGcsWQQrPyFfMDl8Gdm?=
 =?us-ascii?Q?kgmN5qbvPnwiy1uGZBqCujHtAIPtjSOzBcbsXifaoRPRtq9vyAFI4dWh0Snd?=
 =?us-ascii?Q?14SyVsIt2HIu+u3UC6kH4hwvV8E8AuDRyWDPQyRc+yo/zzB0lvFPySVCvTM+?=
 =?us-ascii?Q?21wBRvDE4ffA3CgCDIyStabSHDStWPKHlIux1msJWlCu2U8DgAChKFL834VO?=
 =?us-ascii?Q?puvWV1m/FXqnBi9d9zaz+jUiOecbbZarKzhiyvqAbqhFk+ZvN0ulLHICBvJ7?=
 =?us-ascii?Q?Cmqmr2BMCxG00RPt/btbZJNNzeZzMIO8hxeCkMhJpCG3/o3JYsFszzf13biY?=
 =?us-ascii?Q?7ExuTxhyW+8strgzvMyXLdSbAdweoZ35/JWwFTM5LwCGAP0pCjpVEhC7X4ML?=
 =?us-ascii?Q?72CRFqsv0dkWYfbzZhe2cOA0Ol8Sq3k+W2Yj6JUJE1opAn/Xcy0+4IuLJRYi?=
 =?us-ascii?Q?J9gwQP6cbA/cYp5i/tMnNpkmQ2GAmLZAQsLkV5h8gnXNau5xGhf+lGYXNrqO?=
 =?us-ascii?Q?LmPi9n/c1jfo3uBn/8AGS2g0co6sbARYIC3HhsapaV7yUMHJf+mYx/bZ2PKL?=
 =?us-ascii?Q?107CYybDMI6hq+dB3cEJCYK2xE7q0GotZrjl4nfd11SWdiii8di2f7uFUdU7?=
 =?us-ascii?Q?vSxV+jRZSx8mbERwcPvryeoVhUwvQE1r9vZcwGmLd0RCCLi8Zl0zvRrFEMqU?=
 =?us-ascii?Q?XBO1fWPKawh/L1E5z+vqfJsh1w+xFqI44uGbwWb08RDXtr6Px3J1U4y4WZwg?=
 =?us-ascii?Q?mhx/5c3k7JAdCHnNIyAWzzgMzAlNzf7wgIoOPugCZxvXG64MQdbxHhNCu+pd?=
 =?us-ascii?Q?XS7oYV076iU2s0Be8NZZgTHuZ+N5S7OgWatcvVYkeWrDY3gPTCGWXouOFmsa?=
 =?us-ascii?Q?vQ3mo49ExmU7aMxZz9/XToT2Y1VEQsmqXy5InIeqrx9PB8gDMooZiP8FMq80?=
 =?us-ascii?Q?9H8mQ5QVxx4rcssNFQuSpJj9Hr+QX2fdwlksTnHvuaEdUQs16Fw2THVcXgsL?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b59345-0f03-4211-3613-08de33f74966
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 12:10:31.8559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efZVyc8r7uah/VHdBqHHojPl0y5vUxVxaCHz+uTgFEQtQ8gPxN6vGFn7znUBQUvrlLbxcJN6PkVbR7rQ4bOeEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4559
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2061f18ad76ecaddf8ed17df81b8611ea88dbddd
commit: 2058f6d1660edc4a9bda9bee627792b352121b10 objtool: Refactor prefix symbol creation code
date:   7 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-102-20251204 (https://download.01.org/0day-ci/archive/20251205/202512051709.DbdqVrxG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051709.DbdqVrxG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512051709.DbdqVrxG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: _RINvMs3_NvNtNtCshc5sK6KjdJJ_6kernel4sync4lock1__INtB6_12___ThePinDataINtNtNtBc_5alloc4kvec3VecINtNtCsbsbRiabPlh9_4core3pin3PinINtNtB1a_4kbox3BoxINtNtBc_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10DeviceDataENtNtB1a_9allocator7KmallocEEB3s_ENtNtB8_5mutex12MutexBackendE5stateNtNtB1z_7convert10InfallibleINtNtCs57PXBekmiam_8pin_init10___internal11InitClosureNCINvMs5_NtBc_5typesINtB60_6OpaqueNtNtCsfd3uB5I4hpp_8bindings12bindings_raw5mutexE8ffi_initNCNCNvMs0_B8_INtB8_4LockB15_B3Z_E3new0s_0E0B6b_B4x_EEB2G_: symbol name too long, can't create __pfx_ symbol
>> vmlinux.o: warning: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10DeviceDataEENtNtB8_9allocator7KmallocEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3p_10___internal11InitClosureNCINvYIBH_B1L_B2W_EINtNtBa_4init11InPlaceInitB1L_E8pin_initNtNtBX_7convert10InfallibleINtB3p_12ChainPinInitIB4F_NCINvMs_B1O_B1L_3newB6a_NCINvMB1O_NtB1O_3Dir5scopeB27_B6a_NCNvB29_17create_file_writes0_0B27_E0B27_Es0_0B1L_B6a_ENCB73_0B1L_B6a_EE0B1L_B4l_EEB29_: symbol name too long, can't create __pfx_ symbol
>> vmlinux.o: warning: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10ModuleDataEENtNtB8_9allocator7KmallocEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3p_10___internal11InitClosureNCINvYIBH_B1L_B2W_EINtNtBa_4init11InPlaceInitB1L_E8pin_initNtNtBX_7convert10InfallibleINtB3p_12ChainPinInitIB4F_NCINvMs_B1O_B1L_3newB6a_NCINvMB1O_NtB1O_3Dir5scopeB27_B6a_NCNvB29_12init_control0IB4F_NCNvMB29_B27_4inits_0B27_B6a_EE0B8k_Es0_0B1L_B6a_ENCB73_0B1L_B6a_EE0B1L_B4l_EEB29_: symbol name too long, can't create __pfx_ symbol

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

