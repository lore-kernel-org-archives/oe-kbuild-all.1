Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7231021773D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 12:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770466628; cv=fail; b=iYYoN8sbBqOGRrKU2oYFhBI/Cf7xAktmU7e2i/6y+x2pi3pInfTqXtUgkfFcYA/dvFvtmFsAXnNdY4Rm23AgW5ZnG6cvSlwq8M+24RlcRvQ8nY2fez3v/l0XIyzdoIG03r1FmwHblIWVZuVMsp5WOGIOIi8eS9kPZiijS3i3jWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770466628; c=relaxed/simple;
	bh=fo8jNpEdWWcRQa8qUP8P0E894vbzA+6TH8bhKvp6d/Y=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qLT+JQ3PpkPH3V48ked7Aj1fx1VY+/EVoJvqF95ROLPSntzYwx2jX3d7xEW2xBSHhXsIoGJ9rTGW+mSt/ZmOllTK9MTb1YPiOxe379wFAOoukxsfzO8/rmfxnGHyIBMj24USwZwxdzEcrm/YZlsrgRBVxF2++X2Zt7ssZQ8XvVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLgPgnVv; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLgPgnVv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770466627; x=1802002627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fo8jNpEdWWcRQa8qUP8P0E894vbzA+6TH8bhKvp6d/Y=;
  b=JLgPgnVvGJhDNJ5ELc8Pzy0e1P1ta3Lm7b1XQCCvB6wjRAZp1yu4bpEE
   ytD8PRZWFI8DbcWAqBVXiSA1P/ACcyBxqug3ivkmUb0J4GECyTUgqaoNG
   /atqWCdNSPQYqfjh5awBQ+qNOA6KI59uYxoiby4vbkU43m/6i+ajFYiaO
   JlIKOnZdpMN9LzPRZjrrrPXpivcyj4bMVbkBPo1otqef7bCewksf1qwbL
   1wqYt0yz0vtn59huIuIGygOetsFTkJDrfN4v89hrh+FW2iBRwVjKH7AWd
   ujffWVzHC6ZE0OowNcVigP3Cd5jEqrROOBrfmZg3t9HoDQWknV+CxEo0/
   g==;
X-CSE-ConnectionGUID: A8dsyoDZTE+Qrmgm+A+KLQ==
X-CSE-MsgGUID: oP3stNlwQsWzR94tppYPTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="74255583"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="74255583"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 04:17:07 -0800
X-CSE-ConnectionGUID: 1uaDtl+aRVKQE2+2hMXYLw==
X-CSE-MsgGUID: C/yP1au2RIWuaKNtk2yr1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210910699"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 04:17:07 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 7 Feb 2026 04:17:06 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sat, 7 Feb 2026 04:17:06 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 7 Feb 2026 04:17:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQ/bxaL7h+BF1v9MziEsNIOJGUM0T9jAtLwv8JuZC5wLlsDUpckosJv0SHK3j+elovu7Xe1LhqQ+9CrG5Nb3eulCgj4J6VvEYqMjPwUHFjz+Y1Ul+KCtW/Cil8+n8Rj6/AZI3ZSJDVGyWWerObdxjYapI9CJuDksEyCasFWhH/rNtMV7b/+Pl7BMfBD5NTSVxD1IKJKgAEuShhmgrdhr4dm4IHUQF02eD99QiLpu65y3wjisnN4sT8yGXQV3TEZpqaF2S+bvO8dZvlufbRC8Keqyx6WDUjtkyvOBb8OM71Z6LxR2+lUQrjbHjGxSP+Hu8JTF5wbsGumCZKg9VxX4lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9wHxkgy8x/ptoZtkAFMCmwZsfrq676CkOXWp4bTC+0=;
 b=feLP3owFGkuITQFkQuvooY0De4t/4sLV9Yh0cwoynuMEHdfULOp+NjEhMnHJ1cVxMWi1g1mW6f/wbRlVh5Ti6UB3eED6aX5RJ+CYx6BD8YQjTwELiTcGYZQ5L5EsEtkFD6Qj3LkRG2hNO9XzBBMnKfPxAFKQgsgPVXOie42wjuUBGF1R0PH2xXu2bgvXGV5PxvWd/aS+GRN8x4VlEQvTqNZYKmormhR6zE4+YIcP/o64XdK7PWsD+dB2hjSupAGY+CKHfsYLreonHVMi8mVPlEnphF5YkqE0pBmNdlWbtyEdGBLAEHAtjTahtaU+cDVvCqD8GaEEBdxqgh5b1kpzOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Sat, 7 Feb
 2026 12:17:04 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9587.010; Sat, 7 Feb 2026
 12:17:03 +0000
Date: Sat, 7 Feb 2026 20:16:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [bcachefs:bcachefs-testing 356/357] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <aYctOI79/GzYEio8@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DM4PR11MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: b5718a63-7fed-4cfe-b8eb-08de6642cdb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g8M1B8gXWgcexsjO+9ljUM7s6dm7Yo7UWQKvY7IcIFJVMxjPsy4kg61cMf99?=
 =?us-ascii?Q?+WPUblOx0FK3TsN5dL8+Kj8rlD9+nOgc2e2rSeZQuEdQ45Lgh8gQ0a8EtunZ?=
 =?us-ascii?Q?sBWfZ9lXBbu3JeP/Y7nsyWvBgHX0hVu9KoXQK8Tuji3e4r0D//VLizDY/VGP?=
 =?us-ascii?Q?cQhF6Jd0RNVH/90C2dloadXqQGqelUb6OycOH0gw24bfS1E8O3b+2NPRKi6O?=
 =?us-ascii?Q?6eAtnTstDDeaR3xUy2yrxgCQUG6nLE2TDALRWGq6Dm/s3z9zJu9c0UFPJBdi?=
 =?us-ascii?Q?YT+Uac09xkwiJNGA9vlfs1YoSUrF2y7XrolBIv55Gligd8Bu+28nj9em5z3F?=
 =?us-ascii?Q?yXq13PjVC1FOTbq6TI4F9kuymyCKCFiIYmA8sySDIvTUmO1FyIrLxFkPTTEt?=
 =?us-ascii?Q?GXUgu/UqXOb5tl2cj9taWg1hbhrtNQooh2z8Sjhr00T4UAoiww03wOE/wE2a?=
 =?us-ascii?Q?GV+gF62tTVpIU3lQG4nkltBu/5lUv+p+pOEOwfkMQsR6TlYE3/nMyTHdwznK?=
 =?us-ascii?Q?0eU5d2674k2aaLU/tUz9kT0A/02IgNwvlEEEgVQWZpMHnezWnEvi1vVzLK+6?=
 =?us-ascii?Q?yzUkZMfDC0kezCrPhF64XuW669qZRLOusIpQgmJ2gDSNxUzX4Nq23BzUkeVn?=
 =?us-ascii?Q?7UdOApOT+mhbuwSGBtPhHzOi5sNahJ7Vt1VPxD7TnjusNWnoWv8sJzWBWHRY?=
 =?us-ascii?Q?8vQIRpeL5HV/SUKvjGzphTcHKKZgJ7tlDPw5ttxtwG5dshgjppbPaeWXqoON?=
 =?us-ascii?Q?l8gF7V5gnRk25xEf4fOSXmNNePusl2SloN+WG/8+HIU76KGoCAaZ6fVOlxGl?=
 =?us-ascii?Q?cEzVGxsOJhKzHeaHWOuwVSGYnRa17PlBxriCYvAqMFdjgt6cr0LcfEe4EpCV?=
 =?us-ascii?Q?nLIFpj2mf/yAXXE+oW3EabaR6UhCq9eU64+WYmF2iR4+p6CR1WHW9MTuANvQ?=
 =?us-ascii?Q?VqXttclLCI1Gh2wz9kToeB2W4/iKrB1iYqDEoiB8jRh7DXfH3FscEO8LgCcg?=
 =?us-ascii?Q?zS2DKfxBlcJOHC+T4NfuiFLpsFzSnQ7DgFXb0ee2uT9OVJfzdlD6jG24q3Df?=
 =?us-ascii?Q?vpDK9bBb7Be0zB+UJfSA6VwJn5lbFeHyA7LPt1LNEyr+UlC4izzHM4gn5Qb9?=
 =?us-ascii?Q?L+0IeMuho2ou+myH/D26S41Wp1yb/DHaAuPK/N/XRfGGJd1tN0ltJ/1sjTCE?=
 =?us-ascii?Q?4PgeDuWcdtJaofOBNwG6/+kObRV46oOwXabDJhhVfOgZaguIpyd7Ib/y7Kwl?=
 =?us-ascii?Q?URm8lBionGn2K4V8BD/MJvXu94Irf4DgtlEGJ394glY2pzLce/9hcnSoPaDv?=
 =?us-ascii?Q?mhpX7ZNenDsbnzn+55A2rdyGeAh+g2KiAKsH5sGLCcerL3VXiCkouZgi0vyv?=
 =?us-ascii?Q?+XoJNmqvlgq6nqJUJla0sYebUH3OKQ7ol/oHjelwuB7QI/Fy1bEtu8eCgyLG?=
 =?us-ascii?Q?k29z0x0VVmmgPFTueVnXODMVj4aMdN0Hgz2kd0FuxqBjZjosQRK/mX6FYuWj?=
 =?us-ascii?Q?mEwu3NfQt2XTHipUl8L/ynrt4w3/lmN7kwtm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vma5ELug6tizQbmebJ56fqR/ZY4SLP0iMiP4/xqavazdx+Xkah/pxz+1Y3EM?=
 =?us-ascii?Q?IzaJ/lcoGhgHY/wq0PJqgNbRH3o3cH4k6QX5ITuU0xHycg6bwCIFGBkURnky?=
 =?us-ascii?Q?OmcHCrOKfCkeWMFyTKMu1mOcrG97Cck0y9y5SErz7cYva+KCGygGYDCs9cDe?=
 =?us-ascii?Q?9cG4Loyq2+AO45lJGftZfiHysT0Of9aHTSvwkDV1406puioFlP/s2/YOOHFR?=
 =?us-ascii?Q?JmWl02Yi91DY9gb1lYDbehEExOJb+yWcZGzJaWCk6kSGbEGv3bjodrexjRTK?=
 =?us-ascii?Q?u2kcfhZtaBxMtSpzeq20f3kK02eNSdQSSjVnKvwpl6pVyx6ybVvM6BHuDcoq?=
 =?us-ascii?Q?Xr7Ja4zFOP/jKlYWMSalKcNJ2xwQdOJ1FlFQ5gJ8G8fwgD/HN5pFZpD+f6kI?=
 =?us-ascii?Q?UQ+BH9PLkAGmdjL3GIdIkdzHe4jnX/OCXJNuM6hLTBdIzq2E3AkSQYgz6e8M?=
 =?us-ascii?Q?LudcIm9Q+oK7rM65kIZCXn/5vQHO5xnSX9Kvx/0yDoP1BxDvDiXI/Y/mP7B7?=
 =?us-ascii?Q?5Uvochh3Z5GyzIR/HfiETSFneJDiu95GVnrtlel6aQ4M84Ax1XXCmXaqmwSr?=
 =?us-ascii?Q?XdeKVDm1QKlo7b59OMpdH/tYcHuaT95fhYDkfzjZAP4Rn/Z85PgboWCJA/CE?=
 =?us-ascii?Q?miXvVKrxjyaERdnN+KstadIJoDt/ivxhsiXtbNPxMVl8LSz6omwarVzJAHtA?=
 =?us-ascii?Q?0HOzt53qM+nY+F9tVQsT50aVDMGsV5TBQt6bwOcDAUo7JKMoZ/TmqTWXjuwv?=
 =?us-ascii?Q?bwZJ4iZu/U84ZXSGNDtVda4qtnPhnFgHGJwwQ5GW2h7xLYuBWvlqnLoqOSMt?=
 =?us-ascii?Q?H5DbuvoF7pnyPGL2qkQfc3IhrszJ1G8rlbNnTEV0K+kZzL46FjLUlImLgzia?=
 =?us-ascii?Q?Tl+ZWo8SSQw8t/1bfLHFbmwLRIwZ/61c2TXZOGbNSEBqZ0ex9z5bujGf/Q+i?=
 =?us-ascii?Q?YKrl1H3PITKlyqZxBar+YS74f2f8QQCNeBxmIaZLpBc6hB1TxJyJ429HMqke?=
 =?us-ascii?Q?2wl7bspXtMEIy3eWtW0yqZsIIeAcjjv/JO58sMowueJUWzbKq9oJH5ItZdo/?=
 =?us-ascii?Q?HBngOwBY0uww8VjjzdpDi5wT9qqVeUcNyhfpjl9LmdH0Gr97jhn9zpLh1atN?=
 =?us-ascii?Q?xx6mg6ytM35i5ij6zwlstVJK4HlfObKHoApD177SrstAlFhSGCox4rY5Exnb?=
 =?us-ascii?Q?AqOZCvPbE1ATj1KiGqJQkFuhkgwTzSyn3w4GNVpmVXsCzo0QM2xjR/cBtGWa?=
 =?us-ascii?Q?sPbls+KYs13JUpYqrZRHRpgH0rpPwNjt1A6cMSgsamgLDVfyd6CtNaatGDgo?=
 =?us-ascii?Q?KBV8S7POjm6rhl8JHSXW2EdMU1jf0LcYwaNlqzmjoEUVuFic3xBZoTA/kXN3?=
 =?us-ascii?Q?BBH9D3RA0gOUPC9x16YNOlJGZECoWRKYW9+Zi8j9ofHUaECsSLqnSla4lGJa?=
 =?us-ascii?Q?8rO4h5Ag52tsU6cStF0K7g2zXfjahjVE/iK2L60mhyrCAdFvgzBxR0PrLGDZ?=
 =?us-ascii?Q?6HJWOXVpjtIf7A5tln6XD/OO8Jh1WO1UV//gLP6mfJlpLtvWBPfKbSXe58ta?=
 =?us-ascii?Q?CRwnskU+vApsdZQAlo0VP/tmXzuZ60wKJIUfto8a6neVMpp9phwg/tF3Tpy5?=
 =?us-ascii?Q?YouxLZ/FTJfpcXos+BfWokVESxFy3CEHUQccbCEUPeRiRFWEcbq6cS6dHujJ?=
 =?us-ascii?Q?2FW9shSnQbvXreypzJ3jEoXS8fvlab1/eaaE4l3+bhh95XQKEfL/BuAE69Ic?=
 =?us-ascii?Q?jQ7gARPhLg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5718a63-7fed-4cfe-b8eb-08de6642cdb1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2026 12:17:03.9219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PBfHSwn8Xm8UHMouzzxhmwuFzvNlrc8pSwMhfsA2gt1dDFkDmfw575x14BGg7lHlVmBpYdgZ1k0XB/VHLu0Htg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8177
X-OriginatorOrg: intel.com

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   3b92f378d54e9afeb6a8b37d28ca8ce5f8af39eb
commit: eefb04ce35c38717ccc03874a1186606874b77e9 [356/357] bcachefs: do_reconcile_stripe()
reproduce: (https://download.01.org/0day-ci/archive/20260207/202602070412.E8lyXykg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#94: FILE: fs/bcachefs/data/reconcile/work.c:562:
+	s = bkey_i_to_s_c_stripe(stack_k.k);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

