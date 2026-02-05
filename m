Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAA186329
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Feb 2026 05:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770269422; cv=fail; b=kzc6QvTtVAtHMiSmcsjuDkxESHxoY0m2NDBlEP072fHZl7YfCSyiRVD5t8D5/42SKWIPYjwFUYaCAedpimGNQ8dyG7q6jvJvNVq24jl0Zbb3VZZ8Iz5YAnueNV0SsBJ3DGzo7CzRUlSkIUhrknCmHlKHOZeR9fGiMtFQgdu2dSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770269422; c=relaxed/simple;
	bh=yARubLjdLkIuZ0nyG4Ey6wtPxVwP0bOXgNziosxahf0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gAdi+pyk95YygWpCgAq1KRccAeISWRCwygZEGvZ/tLNAMWcFaIK+0+J8aF9onXDNTNAL1vNyD2uySKllKTBzsN5vTwNpBSqeE0HoybxZyCfG6XSe2cXIcaZSSeLTsdu9/8lDWKFN4uPIMP0Bz/M6E1IjUMbigVO+uy0JmODLa/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MfzhreOD; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MfzhreOD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770269421; x=1801805421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yARubLjdLkIuZ0nyG4Ey6wtPxVwP0bOXgNziosxahf0=;
  b=MfzhreODlIzGvZMaCs55CRsjFl69E7pZa/t0eDPn1PgwNRnRwd2M26m5
   gShdE1VqIFfZWKAy6C5cD0HH3iCOgPOmhyxTxckWT4EThKu1+62BqR9lj
   gwyePtBDI28Qfz9/dN7vUV7RuVEK3UJ8g1LMGD8mGpjcr6y/E0B0/GYYG
   3keh+YH3zAJPuVGAOKRB3KS872XyeihUd+oRLy9ZzUxX2Ry2eBj/swggc
   uhfgWDwYRJX27HGm3zsyQN8npOK2H6gov7lF9zl7Dgo8Henh9Bbo6aOHG
   KZdEgyfZSGW9mIKT5FGXUVi3yJ/x0mQ7TQWJ2A1sKFmYMJ9kMJCmJ68TQ
   w==;
X-CSE-ConnectionGUID: PBVzqElgREmOoSf+Z5/HmA==
X-CSE-MsgGUID: xP5qIKe5SHOTTTI4UWpaOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88884988"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="88884988"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 21:30:19 -0800
X-CSE-ConnectionGUID: c+z9Ec2CT9a5Uh5CAudWtw==
X-CSE-MsgGUID: Oop4RV5RSf+A5FCHJfEGoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="214914040"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 21:30:16 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 21:30:15 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 21:30:15 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 21:30:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMzMZbHGBXHq3+Q42O9kyAOl6pJrrq5qVM5+kVHcucHMvxe0IOxnXediFoP6+zT69bVqQ+W1k0oprsIKkNIth8QHCZ5zaMc6SRQbjmwr6zAj/GQ/IMEI0GW5EDoTQ9QKk+TNbOsOSASKeuzYZeL2ZA67i2akov8RMbuRV+UeOQfvFHQjGSNdI9CyShjmsPynMH9DV8LydkQ6hZ+7FU66ZKdpKfmieNW5lT5fFDF4l3q2vlQVBoY0lQJ45078CgBVzlyxOgvzMSXF33atZ6ZKTmt8hxQlZYHT/Rk4EGYDlCnx8+4i8SuVJihMwI4PUsihh8KPe1n5ifgbVgkLPdEWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15t6B80PzCQSePuQSOuaZQmsilX59EQ7bGimh7fnf7I=;
 b=OL1ZVY9YqnhUv2nXkjx/Lo3ELsSiFsCXkEOeRr5zgcteymuDUv60G3YFDY9lU4p5mzSt3lxnJo3y4T/bMH3B/nzYI8YGN2nhhKlqIzTYFArvqRMwc4SY1j2APO/Pd7FhBvHoBo+ONQ2sR+W/nvQybjzW8BOzj9P1oUUpWfi762tmzFwWKfPiRiL50nWXdvgmmn2ugwYt5/0PDWEP+3rzuTqIN6qoM3W77OKdZKjJnXeUEzpPk0CtlZAjMkLljuEQ3hixodfRY9N9SSpgLL/pmCJ65yqlnQXfQUS8dFP6xRi6lto7AkPC2QY9spiZuUKLwhafrc0o9/D0pVcucs6AoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DS0PR11MB8164.namprd11.prod.outlook.com (2603:10b6:8:167::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 05:30:13 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9564.016; Thu, 5 Feb 2026
 05:30:13 +0000
Date: Thu, 5 Feb 2026 13:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [xilinx-xlnx:master 203/590] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <aYQq3TS30dTYSuG9@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DS0PR11MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 989218a9-0f4c-44ea-1a9f-08de6477a2ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n+5BFZPs2oza6H9PBRVPMSGuhFT3t9JEZKA+B/oZvlAs5dGaTqvXsJmHa9Io?=
 =?us-ascii?Q?5wt4LmpzPC/6yr7PIlM2Yfie2+G9xpv8UoHJaBG7pXyRO3Hc9Mj2X2UrQD90?=
 =?us-ascii?Q?tx/4G4RMG13PhMkFn+aA+di6ro6Uz4ibMYcTTeZhI/lumsRaDhEErnM18Phh?=
 =?us-ascii?Q?KVTnnVW5CKva4mNktC3IzPFgg0gGF2R4ALk8Nwx8Wuo6baBCl5T0ixfQvHoF?=
 =?us-ascii?Q?avgMS22jCc/aC3L2Bry3JMFNppganodWC18Ro5tYeNciD+Ks3LRINXa5DNWW?=
 =?us-ascii?Q?WSdXQYGgrDyoxlEgbXRVRZ0gW8beFblvdbvNEB6567vU/vePuz79/vlDbyyv?=
 =?us-ascii?Q?djBlg/woYKPBDrX9uEqYc6NksR5r2cgYwyTU/f01ZcZ/YT2e7U4v6gmqDuWO?=
 =?us-ascii?Q?fgmuK6tbbq4oXraSYkiOOnSZAVq3WBSlWSWoLIscVOKXAsUwSVyM10mFWEJq?=
 =?us-ascii?Q?w5swHQFjZTAFGTwXAt3F+CKV4s5REyvIsBTQb5OvCk5BpHBOIlkLpwjv/QUg?=
 =?us-ascii?Q?4ZYlyerCfXwQYiI2HV9ni/uAwlFIV3BDvI4nIPB6p8OiSZMt9Sj3IyJOc/rq?=
 =?us-ascii?Q?E3yOEJFkz8vm/kNf5F9dLGPoO4wSMxdfII+f9H0dk5L5LDP8BV+d1q0y09dl?=
 =?us-ascii?Q?EluGT4ZTDmZo4mICNF59ekEjIdW/ZiIDb8S1x9q766XUcmA82CI5DQ4s/5C3?=
 =?us-ascii?Q?RB4QsHbvwsGzyR4nGxj8GOqWz3Dok8CdV/E4TAioSvTQH5S7xKxaLhJJodPh?=
 =?us-ascii?Q?bgEAgbTnRc4Elcu0V3JCR8w/TydmGr75WbXLAtdgv+gmu7lOOLhhkpgtAA8P?=
 =?us-ascii?Q?POridzPwmFv1ZVKcbOoImEdDzypmKZs4F3WrX4Q1FkVZWNV7oAFi3uuVNM4Y?=
 =?us-ascii?Q?o8vRYd1EKRYPuWuXmEMq/xNMVh/WvPI34tcJEuO5aMg/PCQmuS7UbVPavBzU?=
 =?us-ascii?Q?oARoM3Uj9CpP0vjcvYAnq8pxeK07One5Ci2nkl/jCR81RG4Tqu5Cb8TZTplB?=
 =?us-ascii?Q?iFPlF5fxQj1u05gUAJJzASjKugnB/dqDauC2jyJrX3zC4XOMu4Bm5LHPnM4z?=
 =?us-ascii?Q?lsmdC/M8V/KkkTPxmDsqCK9qRAugb45qFyqB9vi45jcA3pucSfbFcc5Jezzy?=
 =?us-ascii?Q?OGD0+cWSlyGNne90TDHsOInnPGKwpsAmXJJyJ5diDqlts5aNdm/U9chgQp10?=
 =?us-ascii?Q?DBy3ltF968PYDMeHX9/CNnkxK3kTlxBzRZNMKjGhFARnqWgfokSwlHbnmPVa?=
 =?us-ascii?Q?sXQxsDSpLQTvoh5fef28LeH9Zqbl6lgOSarlYufYRm/Mq518Byc+QRrAhnfu?=
 =?us-ascii?Q?0VHNX/rwgfPuXXGLLz9D6u31EiQ2QabgftPdnYX4QSsnr01wQkLIu5bY3VTu?=
 =?us-ascii?Q?nnzMKHPE6hFE2JFUWK0mC8vVOSD7x3h/oDOlB+CsJ3lengK7QM8ums7AGiGQ?=
 =?us-ascii?Q?45Je2fgrYt+62XeORcggwh2Fvxv/rgCOHJTmF/Rd8FyaXhYrFESOxA2oiSQn?=
 =?us-ascii?Q?pVuKP/q4hMIjIWUsi5E28DUBUx6QGykd79QK5BF9/cWTmcIxQfuh3WcIZmWV?=
 =?us-ascii?Q?G5Hl7+DQGRogHKkD09MFrLDYo37YJ64IdHgWnwX3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vxaVEV2dngjumwYtELMXBeZ2uIZxQxIoQLODvdiNjFt2HlgrOGiyKQf3oSb4?=
 =?us-ascii?Q?FYdBWTkI5/zJ6BN9Fm/sABkb4OZugpnfGPyU6H/UFtVLMnMBdoL20Y6C5PRV?=
 =?us-ascii?Q?fjUNth0Tvh4G+YblKgPM7iB8+3hEWtOoZx3LGmI3iFV7m5fqahvjDV5CoYDT?=
 =?us-ascii?Q?P/bUuIJE+4fXJggNQ16PDvR88YpAiiXYd7s8S1+4DWoAAqpCqu6yCs+cdVbb?=
 =?us-ascii?Q?Ty6ZpAJeQPYKinTRaxC31/i0+gXEo4UojBC6bTHe4WIM5UBVJPwOt3veCBVS?=
 =?us-ascii?Q?Kl8m5g2fBvNJ/tb2GhkxahJPb76AtVyOCI5FafDNJVnhuKjytiNqbIs3IVs5?=
 =?us-ascii?Q?5qos07msm2VNSAOo+dhfH1WZqM5L1b0aNXrwCGwJ5cap1ibwGDeEzSn/sPzl?=
 =?us-ascii?Q?vsG4UfXSFRedesa5wFhm2HSiovo68ftu7RHX2Cfz0m49IoLbDAzPA/1hQ/f3?=
 =?us-ascii?Q?UGfGn/gfGuoMwv/TWDs8olizqQklWunw+hxT5SWQ6nZ9rr/DZHYJqZ3O5bNA?=
 =?us-ascii?Q?UtohLZr1YqoW5n6WxgGSEJypOTh9FssaahLbCffNtMY1eJvvtXqqP1ZrUC3H?=
 =?us-ascii?Q?AdgzmDjiICO2xMqRqivDVz7eMYIn6haS0yAW5GP1h7rdZGNHs59F2VPN4jgk?=
 =?us-ascii?Q?gKJ1VQRWr4ziUYA7uPtMCARycdfWwQ9LehfGAAdvK/UVnWDkdiWe1Noj+b8J?=
 =?us-ascii?Q?vsuXg33+rGBEyfsdVEjxocYt6TksvtJtQc/y7OEAXXJY7IDyf9dzvLMMSf7T?=
 =?us-ascii?Q?lHEgsEfFma0HOLnZA3ylRn3zEwteMevjMhdNek2w+EWEMhwnR9L1fZsjLEnL?=
 =?us-ascii?Q?Iorfgp2LrCARxVeuoTdDUjq4keILbeEuN6xra7oS6Fp49259YKyOVQ5AhR/t?=
 =?us-ascii?Q?Dq5WtUKUOPx4pNYJsAl6Ow2hnTrU10M5EqR66heu2SpmNkKGsfuJsnw5FUz/?=
 =?us-ascii?Q?jp0AvnTNO2iLhh9C4pxjdM2YPo6C+7RWO5teWu1pnkph56ULe4P2HixpbSkF?=
 =?us-ascii?Q?dYg+ppkVT7CQsZgazVwiWHOkE1juOnUuvgju46knzi6Hbj5jFybg8JZ5ViZF?=
 =?us-ascii?Q?WnVUiE01obMhoSXHaFaUggn6QAGzF73aGsnpRKK2kydn8JWitSTTpGISypZl?=
 =?us-ascii?Q?0LsgGsCEzNkaH44nwPGPbuzPZU5NVmgKL0CA5WytS8KMnSB17yye+hA2Maoq?=
 =?us-ascii?Q?xn98ONMQzYCoo3lYwLpEvkGN7MfwY+i0qKZClgoZrpUKz+lm6rYS1hQ/iQQi?=
 =?us-ascii?Q?R/BGd/csQmR1MAOKrvmb9wyh2smK38cbyLDxB5slxG+L9IOGANz0VPq/e3Es?=
 =?us-ascii?Q?NTX4sVujlq3YPBQFLvPAjAcxqVMN6A3eNB5txjNbD860Muek0ndb4nA4S70h?=
 =?us-ascii?Q?TMUHIqqjzV3GlRta2p1PCjoipQXdzUONoeRxjm0Asyh9KuBH9/EJm5wy8LL+?=
 =?us-ascii?Q?rjlCfdwReT3q2RfEExaAnlIRqSRvwIL30fcoWSoKVcB2g7FtRRTL05mas9qK?=
 =?us-ascii?Q?49hSNlUZfSkggLhNBgiLk2BdotVGH4f64kuqZ8KnyQO9v+lb16MiFdfMSpi7?=
 =?us-ascii?Q?bodl6iHo/ID/x+DQtQzX8jYlqrLj6ZAj4d2ys0wY2Ic48s4Bw6G8nYZp6uLh?=
 =?us-ascii?Q?Oaf8tZQaL2Ic7s8bL5qb4VPckfVs8Ps3ErDjhOIr2mJ0d0eKN96W4TJSz8Yw?=
 =?us-ascii?Q?Ur3fRB9eFZNI2bxZbpeeuD7iDkp3NIllXl2RN3qeCYti3/9rzvLjlo/aAZzA?=
 =?us-ascii?Q?ElzHetyhIg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 989218a9-0f4c-44ea-1a9f-08de6477a2ed
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 05:30:13.1971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/KV9c2qtF9rrNmpXscFCed9lGaM1n9DuCNkqjMiVMD9Z6btNdlsL2SlGjFIvfb/AdT3fISuk39ZDipBrYw6rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8164
X-OriginatorOrg: intel.com

tree:   https://github.com/Xilinx/linux-xlnx master
head:   865e73109750d465f06dee019396406a354eb9d2
commit: c402c95c756304484d2f153b5960079e50791f2e [203/590] ASoC: xlnx: add PL sound card support
reproduce: (https://download.01.org/0day-ci/archive/20260205/202602050604.79phHe4O-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#98: FILE: sound/soc/xilinx/Kconfig:36:
+	tristate "Audio support for the the Xilinx PL sound card"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

