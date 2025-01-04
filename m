Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ADA22EE4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jan 2025 08:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735980241; cv=fail; b=T1NXnladkQG+KCVoo2H6PYdRjpsQCaY4vRgx6SaCcDtMt0Oqkcdxz3/PxfCEZiiIZ7mK6OD7g72aDR90BccW8okaCMq940DksPm8t43BtmrcHbLbvGgEw++gpausxQHV9MBaos3H2RRsR9HuhJZKWsdJTZ+SYdnbVLkQa/fZPoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735980241; c=relaxed/simple;
	bh=Xvzf0PyxHRHamLGOne86lq0N6hssoQgLcEoIMDRPCT0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kcKOqlNSc1KdcfhpF8i91GDBGdEVXKczHNxKN7vTpllEOXTgbMBZ1aQ+F5LLZWsKTcAUgAw0FCJr8qkVaw5uAw4/e75uI6jZRwzJkCayacwHwrnfeyUGZ4tYZTJiw+6iF5UQ0vrFzpAhTifi6rUaZMJASFPZPijY+Wc3FYRQhqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qm63wDOx; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qm63wDOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735980240; x=1767516240;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Xvzf0PyxHRHamLGOne86lq0N6hssoQgLcEoIMDRPCT0=;
  b=Qm63wDOxvyj6+NGPZ+UsWg2Pej6G7aBUqxpd2P5CKlU9rzKYs3ch5j0r
   YzVikImqRUpl67GXs3x8lFTuOl62qyqs7J3on6R4/qqAppmnFdx9gfbG1
   ppzZisR8uVTLTTQXqO3hMs66TciB8mr8I5uk5S4VNVWaXPwDJS4wE5VGL
   bm8QvwxoM+jrUtjLEKRerxcvRpCZiftVcyzp3Buncbp3SLt3to+LurG5s
   /mQCWpVidY9arqiKTWzbri+FSDyy6XULuZ5gHjz+jW0pkAx68t7TgWt/c
   KUR2fn1RcMRMJ2e83RByu2u99duld+jejglrZKgr6qRZrRiyjls1u4Jx0
   A==;
X-CSE-ConnectionGUID: UQhP9f9jScq3fPa076whMA==
X-CSE-MsgGUID: l7pqv5LJS6SfIMXLHQWfWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="61582450"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="61582450"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 00:43:59 -0800
X-CSE-ConnectionGUID: 2rep5mJFRjK0eoFCuY3wHA==
X-CSE-MsgGUID: ne7PYUdqT6iOzMtf+NcvVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132898477"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Jan 2025 00:43:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 4 Jan 2025 00:43:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 4 Jan 2025 00:43:58 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 4 Jan 2025 00:43:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2N1XKGZUIUFwiBKSeD12MFK8bJQlHetFf1b3QuOV180kxMTOiYfEK+3XiWzCpDgx/mZ0aWz4eKE/UqdkQ8n/4CCuMCEK2EF2tYwT6bSbaKRSAwEdh1vJy+VhR3cFc/FBVD0VTczhmK5a/i3vzlDNvrJiZ4aa9Nu3poHYONtZ3rqdwAgMpNqzlHJqjmQzJqL5qDdrfmv5WEI8eREndmar1/O30iyNTCviHtK382ZAeTDfo8fS4QaI/pf6vX/3lvNjxw66cLCH42Myk5scVFXJeP5dLI7115/1tIApngK1zHeREgAAF/WPpOGqPxXuextCu5Lty9N52IeUfqlizxyfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dnrJTcJhHRx/ywW8IeyiWdfhrMUweprzWUT18Cpe3Q=;
 b=RWlPtbVN8fQD8AjETbPAn2ffScUFfnReb0v4V4NeFkUvNLmFuH8FT0DmTQ8Z9mz03Q/feGyZbkOElRQedUaTwNTo4Ra099gObUAKcXKE8zo18hG0de+zYcIzuqfqeK2tqybOA2z9cQJinn1baN0YeJOlkN1pc7QrqTZoYBOeiBs5PRuDdoDB7K2KoblPGDn6f1TPr9AIoYDJbsTZTb3lL8U4rCEFHorS0eP3ELkG6+sCpUFrMiA0GgiehsTmziC+AhDhnCETTssMxs2lRXP8OZgmM0E/PFh9m5Vg6n+tyZuCFNUXSYGcXqUr/K8y7Ny1nqQhGDcxCXUO9MkRa9VJbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DM3PR11MB8684.namprd11.prod.outlook.com (2603:10b6:0:4a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Sat, 4 Jan
 2025 08:43:47 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8314.013; Sat, 4 Jan 2025
 08:43:46 +0000
Date: Sat, 4 Jan 2025 16:43:36 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Uladzislau Rezki <uladzislau.rezki@sony.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Paul E.
 McKenney" <paulmck@kernel.org>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>
Subject: Re: drivers/android/binderfs.c:235: warning: Function parameter or
 struct member 'file' not described in 'binder_ctl_ioctl'
Message-ID: <Z3j0uC5d/bSHof3s@rli9-mobl>
References: <202501041430.6u1qEegs-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202501041430.6u1qEegs-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DM3PR11MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b858745-ca1b-4ef0-c2d5-08dd2c9be721
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n/hP5aRrSGKru7VlHeztXGsZzSJLG4wWVWq4y/nmOFDMjg22edSSdZZjpwG6?=
 =?us-ascii?Q?QannAGwueays5H8nYGcZpdUzwgIi13CRfKNGoqz002fS90gW5kwImDj2QQ+B?=
 =?us-ascii?Q?RHyA9hnO6NUJ6Pr+nzVOfJkTKNz8PpBeMEjaDu012ER2TNDrfo2UNOBCpKae?=
 =?us-ascii?Q?H5eVVI9s0A3WkBp5YnnJuVB/qPQ7t1EmJLby6qrvSQmWUbXFVPAl8CWwQOQx?=
 =?us-ascii?Q?HQxP9uqsVYy0X8aIp/ztns1Dud9XZCpSTKUyD/GID6Iyte4ATqA1xDOSykMd?=
 =?us-ascii?Q?lKHVeC55QIzPEUyvj+eE/KJ+EhPAMMa4YTFPQFrdONSc44a2MhSrXKsfqwHD?=
 =?us-ascii?Q?DutNO7vEqLLkXF4b4ymfk9bB/3egJbx6AzS6vxsctqq4hbnaLctBqrcTsaEu?=
 =?us-ascii?Q?tKdy0gn22d03KI5tf10Ad+CnACNiX5UIcSsQtna1Uahcx/KxVt/G7dV1WyX7?=
 =?us-ascii?Q?LMnKgyL4vcOUYSpz1SVmuy4taz0dovez2r5PZvpejCwJppMn+m1M+45kxSXS?=
 =?us-ascii?Q?crJ7p0mfv6nXcT+eZcfg/EQ152+PQUiA3mhqZ4LskM/aDbuoXk1L1jrT8mDt?=
 =?us-ascii?Q?hBAmT4MNoGEHx5SNdIP3VpkAwd6XT6QRZIBtIKy5dLiuEoUf8o7Q82uNS7DT?=
 =?us-ascii?Q?V1868gMh32t1qzXHjRomXZsy4/hv+tshwwiILZYI4c+HfI2Fvj0w15HGyMYq?=
 =?us-ascii?Q?r7ldO2rDjIe9ircASwiwAfTMmPnnHA/5Ypi/lRCSGQaaO/xdNaLwD4mNTTjy?=
 =?us-ascii?Q?9Rm9nXK+9j9NP0q/gwHk90TKwo0ZV0iOjvPu2nejfsOL3XWx7LLbMxdWQ1G4?=
 =?us-ascii?Q?7GBydrXFruc8zbKORirPBLWyKcGJ3uWa2ciDJRVC4+qgBgB+9aE3LrSH89YT?=
 =?us-ascii?Q?vakWoONeYRIQ39/OU/lYiSux0Fphm3BxARD9QW3oyo/ljooqt2Rm0ng6uxic?=
 =?us-ascii?Q?MfYliG98O6XTwm3D1lSFSOYFo0UAQgnPywWcWqv4fCdtVDp1ksG02X9fBlGd?=
 =?us-ascii?Q?Tr67rTlPhMkv2NFzhEh4pWmG9tEi04/pazMOFIdUosmJ97XG/L+y63/w6rak?=
 =?us-ascii?Q?2jEr43Ae0ZSLpsKNXgR/zbJ7zBHaAL8ni1mHG9AfSqUpovkDkD2rZX3qV8CV?=
 =?us-ascii?Q?7ekkgH09LtUtzBxEAypGxsdlxr5KZW6PQRV7hxopf/jocveNMU8ZWJOR0jzm?=
 =?us-ascii?Q?kTTcuSVrlNewqP7wgJGuWqscLMIr99Loi+rXKyR8GWo0rAAMzvbhhhBWck+o?=
 =?us-ascii?Q?jbqVirn8U1rYnTeoggKkNR5z9CzeE9//nDRtO19ixwUnrvDIVOpIs0lFMbcF?=
 =?us-ascii?Q?eJHmLn7nsUdINhyhNujOtExdsGBvfyNeLRBvN6cX+2FQNA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tGllAO0wJFgswGFc+p6W0hjoX6cWYTsy0j1gCRZWNHN7gdCVV7zGeBVNW1vg?=
 =?us-ascii?Q?7frSlbdFI2DV77JtZGEo94FbT7MDt3FtaMsaga+eyXSOpcG8G2dykpiG4NSv?=
 =?us-ascii?Q?jHjW9gnBdzz6QjMxX9ZiLiysryGTzd230NBJ56kziiLMKv0mWnN5LVSY6XIh?=
 =?us-ascii?Q?HmChKfOqCPbwmIod76Hl4MxLrYRYzy1G8FVZOrIwHqGWFpSx50zumGKlOdyB?=
 =?us-ascii?Q?4lC1x+/QUNZtnIcEdJMqXu3Mp5x+lxeje53C3nHpBdN6DVwMJbWWxDKnsGpM?=
 =?us-ascii?Q?stm1UBep2R95g55A0+Ru1+t1Gsnxt0CWeq2geBmupv4QuwHtGjytB+szdqfw?=
 =?us-ascii?Q?kuPL2suAWp57bfT4htLuN/ofGWM0QozrJRUX7HML6O1/Ze6fapmUryNG4/ct?=
 =?us-ascii?Q?nfGTGsyYE+GwL+Ofrcuz1l113+iZPl7hEkfYbmsu7lsqGkbfuOFygTKer/Ds?=
 =?us-ascii?Q?5vlTYN9Y1ll5w1g830inGSqizDVhO55jW/KZbqSZNTy8aD1RYFaVB1o9BdxP?=
 =?us-ascii?Q?dVdWPSMPAB/6d7b3viAdn6AbRePA+ShrbQLjXZg4HSrah7UnoY6/CysWkj6p?=
 =?us-ascii?Q?sJ7wyhQDtgfD+nOHvp6AU+Ha40R1+AYhqZA119B0ODCchiVlA/RVdHuf+L8t?=
 =?us-ascii?Q?90eMVVw+WWEQ4Bbr4idCDg9jLUdasmKs7sm8UP4QkBPu2HyHDvE8Zx8lfvG8?=
 =?us-ascii?Q?gZexOo2Z+phtpk3YDZObutHj4cRx3SmKKlX9a6wN3KeXmY9t99S7U/o3Vy8w?=
 =?us-ascii?Q?ehlAbs2Pbq/7PEZlmO11bGKUy8KQqAdrT78voqzCPo84HyyDZKzCXyCuI6iQ?=
 =?us-ascii?Q?0WPAyHZIc6WcZmFOLn6ee+VvC2pl7r6BAqGorachWxyTBg00m+Vhv5v6YNM2?=
 =?us-ascii?Q?IDc+lJ5jhZ7ydKdlVdT7p3jYOL783mSpYbaYMovtNY8rJZW+Zziy8ht/6CBn?=
 =?us-ascii?Q?qa40Ijrd3dSztps6sZVNaGJ0bQM3OtcjsXsNevBYOHVrHqNkDkCNRKbltRYy?=
 =?us-ascii?Q?fGNgUlR8k3rfVR9F1GFuFw9dtfm94HB6KPiQs0FbTW4XUGoWDmziMdGLz8mz?=
 =?us-ascii?Q?66ybqFCSfE123sz60E/cyTyXp4NSWb3hYzUqCup1ghvMwbIj/Zjzsw/vECv3?=
 =?us-ascii?Q?Nwqgdf4V3ATTJ5FKp/XZSR2sBLanQIt1oCs4PpZh8LtkpiR9tEUY/Xp0PNm8?=
 =?us-ascii?Q?JBJfcNP00Li1mS/w/3FpqhClj9WsBzhHtsKFE6+3NFMCYzi60zBWYuOs2HsE?=
 =?us-ascii?Q?tmZHXh2EaXFJZG3lwDpZJwIvvQ/X/YnToqpV/qAkvFBpBzmpmHbYiM+tbotJ?=
 =?us-ascii?Q?azKgeOFEByEMjBfxE7U97AI3c5TcBUDmlJb8jhTEm2ZO9D1Y9Wst3lYmedUb?=
 =?us-ascii?Q?yJnYTMpcwyaeaK7xjpf3wWuFcsm2y8jjb5y5xWDTgJgCa6ImH4Fmxpj61zOP?=
 =?us-ascii?Q?oeDc9aS7dYMztiGEal7F3Wzw5gUGHZGSolq7rZwXgeWigPA+T7uGzQqJXWTu?=
 =?us-ascii?Q?vP85XR/1A8RU2UUZ4A3gFAIcH/j0wKV4tjECh+MTCVz4+jEgyY/anFSYrKqC?=
 =?us-ascii?Q?RrO5lF/ZEbtsBmR9P9ZJTY6ldRei2DIsfwAi5jtR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b858745-ca1b-4ef0-c2d5-08dd2c9be721
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2025 08:43:46.8010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wDMeRPSgX3iBLvGvY8T0OBdbr+bv/rFIIBu12uptyJmBqZG1DAB4xmM0hbPSh33QuuKoSm/TYZHqbUBiaVWQ6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8684
X-OriginatorOrg: intel.com

On Sat, Jan 04, 2025 at 02:17:23PM +0800, kernel test robot wrote:
> Hi Uladzislau,
> 
> First bad commit (maybe != root cause):

Hi Uladzislau, sorry, kindly ignore this false report. This has been discussed in [1]
already that the commit is not the actual cause.

[1] https://lore.kernel.org/oe-kbuild-all/202501031535.erbln3A2-lkp@intel.com/

> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
> commit: 28b3ae426598e722cf5d5ab9cc7038791b955a56 rcu: Introduce CONFIG_RCU_EXP_CPU_STALL_TIMEOUT
> date:   2 years, 8 months ago
> config: csky-randconfig-r036-20230303 (https://download.01.org/0day-ci/archive/20250104/202501041430.6u1qEegs-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041430.6u1qEegs-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501041430.6u1qEegs-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/android/binderfs.c:235: warning: Function parameter or struct member 'file' not described in 'binder_ctl_ioctl'
> >> drivers/android/binderfs.c:235: warning: Function parameter or struct member 'cmd' not described in 'binder_ctl_ioctl'
> >> drivers/android/binderfs.c:235: warning: Function parameter or struct member 'arg' not described in 'binder_ctl_ioctl'
>    drivers/android/binderfs.c:235: warning: expecting prototype for binderfs_ctl_ioctl(). Prototype was for binder_ctl_ioctl() instead
> --
>    drivers/android/binder.c:233: warning: Function parameter or struct member '_proc' not described in 'binder_proc_unlock'
>    drivers/android/binder.c:233: warning: Excess function parameter 'proc' description in 'binder_proc_unlock'
>    drivers/android/binder.c:335: warning: expecting prototype for binder_node_unlock(). Prototype was for binder_node_inner_unlock() instead
>    drivers/android/binder.c:1155: warning: expecting prototype for binder_dec_ref(). Prototype was for binder_dec_ref_olocked() instead
> >> drivers/android/binder.c:1819: warning: Function parameter or struct member 'file' not described in 'binder_task_work_cb'
> >> drivers/android/binder.c:1819: warning: Excess struct member 'fd' description in 'binder_task_work_cb'
> >> drivers/android/binder.c:2254: warning: Function parameter or struct member 'offset' not described in 'binder_ptr_fixup'
> >> drivers/android/binder.c:2254: warning: Function parameter or struct member 'skip_size' not described in 'binder_ptr_fixup'
> >> drivers/android/binder.c:2254: warning: Function parameter or struct member 'fixup_data' not described in 'binder_ptr_fixup'
> >> drivers/android/binder.c:2254: warning: Function parameter or struct member 'node' not described in 'binder_ptr_fixup'
> >> drivers/android/binder.c:2274: warning: Function parameter or struct member 'offset' not described in 'binder_sg_copy'
> >> drivers/android/binder.c:2274: warning: Function parameter or struct member 'sender_uaddr' not described in 'binder_sg_copy'
> >> drivers/android/binder.c:2274: warning: Function parameter or struct member 'length' not described in 'binder_sg_copy'
> >> drivers/android/binder.c:2274: warning: Function parameter or struct member 'node' not described in 'binder_sg_copy'
>    drivers/android/binder.c:2683: warning: Function parameter or struct member 'procp' not described in 'binder_get_node_refs_for_txn'
>    drivers/android/binder.c:2683: warning: Excess function parameter 'proc' description in 'binder_get_node_refs_for_txn'
> >> drivers/android/binder.c:3510: warning: Function parameter or struct member 'thread' not described in 'binder_free_buf'
> 
> 
> vim +235 drivers/android/binderfs.c
> 
> 3ad20fe393b310 Christian Brauner 2018-12-14  222  
> 3ad20fe393b310 Christian Brauner 2018-12-14  223  /**
> 3ad20fe393b310 Christian Brauner 2018-12-14  224   * binderfs_ctl_ioctl - handle binder device node allocation requests
> 3ad20fe393b310 Christian Brauner 2018-12-14  225   *
> 3ad20fe393b310 Christian Brauner 2018-12-14  226   * The request handler for the binder-control device. All requests operate on
> 3ad20fe393b310 Christian Brauner 2018-12-14  227   * the binderfs mount the binder-control device resides in:
> 3ad20fe393b310 Christian Brauner 2018-12-14  228   * - BINDER_CTL_ADD
> 3ad20fe393b310 Christian Brauner 2018-12-14  229   *   Allocate a new binder device.
> 3ad20fe393b310 Christian Brauner 2018-12-14  230   *
> 3ad20fe393b310 Christian Brauner 2018-12-14  231   * Return: 0 on success, negative errno on failure
> 3ad20fe393b310 Christian Brauner 2018-12-14  232   */
> 3ad20fe393b310 Christian Brauner 2018-12-14  233  static long binder_ctl_ioctl(struct file *file, unsigned int cmd,
> 3ad20fe393b310 Christian Brauner 2018-12-14  234  			     unsigned long arg)
> 3ad20fe393b310 Christian Brauner 2018-12-14 @235  {
> 3ad20fe393b310 Christian Brauner 2018-12-14  236  	int ret = -EINVAL;
> 3ad20fe393b310 Christian Brauner 2018-12-14  237  	struct inode *inode = file_inode(file);
> 3ad20fe393b310 Christian Brauner 2018-12-14  238  	struct binderfs_device __user *device = (struct binderfs_device __user *)arg;
> 3ad20fe393b310 Christian Brauner 2018-12-14  239  	struct binderfs_device device_req;
> 3ad20fe393b310 Christian Brauner 2018-12-14  240  
> 3ad20fe393b310 Christian Brauner 2018-12-14  241  	switch (cmd) {
> 3ad20fe393b310 Christian Brauner 2018-12-14  242  	case BINDER_CTL_ADD:
> 3ad20fe393b310 Christian Brauner 2018-12-14  243  		ret = copy_from_user(&device_req, device, sizeof(device_req));
> 3ad20fe393b310 Christian Brauner 2018-12-14  244  		if (ret) {
> 3ad20fe393b310 Christian Brauner 2018-12-14  245  			ret = -EFAULT;
> 3ad20fe393b310 Christian Brauner 2018-12-14  246  			break;
> 3ad20fe393b310 Christian Brauner 2018-12-14  247  		}
> 3ad20fe393b310 Christian Brauner 2018-12-14  248  
> 3ad20fe393b310 Christian Brauner 2018-12-14  249  		ret = binderfs_binder_device_create(inode, device, &device_req);
> 3ad20fe393b310 Christian Brauner 2018-12-14  250  		break;
> 3ad20fe393b310 Christian Brauner 2018-12-14  251  	default:
> 3ad20fe393b310 Christian Brauner 2018-12-14  252  		break;
> 3ad20fe393b310 Christian Brauner 2018-12-14  253  	}
> 3ad20fe393b310 Christian Brauner 2018-12-14  254  
> 3ad20fe393b310 Christian Brauner 2018-12-14  255  	return ret;
> 3ad20fe393b310 Christian Brauner 2018-12-14  256  }
> 3ad20fe393b310 Christian Brauner 2018-12-14  257  
> 
> :::::: The code at line 235 was first introduced by commit
> :::::: 3ad20fe393b31025bebfc2d76964561f65df48aa binder: implement binderfs
> 
> :::::: TO: Christian Brauner <christian@brauner.io>
> :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
