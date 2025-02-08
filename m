Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9450842AA2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739030450; cv=fail; b=jcz/6L0BYLjYh/KSH0u53it9feG1FWfkDt930A89xCdiUYF6Mteq+84W3PT0Y4pPkv+1mFIf9ntf+EThR8aViQ0YovcuNlBpxUbwdsP28X81qdSLjaRyc51hNmQaP0P/ohVOfcW0HOdZW8REVOxzG/HoXP913U1ZR/LSqPHYDcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739030450; c=relaxed/simple;
	bh=xoz26esMqs66PiXEgyFA/edhGIgMuNu+ogq0ZBR0hlY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ged+j/vkexx752K4EwYDpmwfZ19LhQWkH82DPxUxcwqtAR1j4DhnQdJqc7YSwa/MLXL7tLSsW/p6ItyBwx1bIYV3QxalM0PzZkD2oOwd5nkhV7rm7DE+zwmDA2g7H3jfRXHqSCMxoBsLGGBjgTeHH/QQuIHF6gohUNtGyk4PNHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HopvgKAj; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HopvgKAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739030448; x=1770566448;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xoz26esMqs66PiXEgyFA/edhGIgMuNu+ogq0ZBR0hlY=;
  b=HopvgKAjKPCXQNAz0BgmDODLqJwzpzTRnJaN+qitdVF/E5KIUQLuB9M9
   0oHSGzexoaQ6FfJZKMiACM8cu/BESYjWkN6pj1MVjYfBpD9fsiqNcnON9
   1DmxwDjP0QFL+2/A8fVVetGmN7ZSiZk4jnlmTdPIKI9TNSN1mqL+vbNf2
   qMF99KxlCMCypXpC8XR/Q2e2gE62q+8JcWZSFBosRPiTjM9PnML7dXYTk
   yG9QhZuj2zZvlbuWmp0gzlx9qX46ht0r2bAxxS2VEPkMcTW1JxvLbX8Cr
   QFHwBpFs1inowLhzJnd+vnoSMQ3tkxcAkaowd9HbaULzpCeVvtk1CijJK
   A==;
X-CSE-ConnectionGUID: lTpWyQDxSECVKx2DMu4CVA==
X-CSE-MsgGUID: w1uDM5/tTSuh81wRbzCQEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="50296353"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="50296353"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 08:00:47 -0800
X-CSE-ConnectionGUID: INdEXA2pSD6L8+H7vj6bxw==
X-CSE-MsgGUID: 2NkclkSyRVupUKboAyA+9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135029669"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Feb 2025 08:00:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 8 Feb 2025 08:00:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 8 Feb 2025 08:00:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 8 Feb 2025 08:00:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjNOaX+vsYZy1q1u30S1i1tfp/taLrleh7J+8qFsTLZAq9CxweV1hreESrXYWczQ4jWZSR4gYTJ2Au9BV2HylXy1bgFzTzG2Wjcp4mC+GcAOtsymRn1DUKjdXXcPCbUjkrYCg2W1w62DorLHXmAtyKxV0KgjNO+j5AlIw/pzetQKzvuFmuD5Fw6llob+A7T5sa4PhHrizKmvfjG3hzK/nll9FiMJP94ylxSxVYDHxBA92+Uo5uLCbQjIxAzwKjzqbIlDAh7n90CvcZp9FZCtcj9zAN4zr4OVzFMTO6isAXAjSWirVyBseDRsg8JnjHzEI241rY1kYqZFP5WjmRwaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmloDmLv3EUtkVyrZLMW6jav6oFJEUSNh3ygW/YPCoI=;
 b=S0pph05I/bcbHSMYo4/NEDVaGUchd1cm56Ei8Z2pd9aOadnsQBT0XIg8oYBqkgRTMK1XX07ArmevwxhZE7aE3vJ1fkS+ziOzJgunLrAOrOaOA9iVdgZyVsSHwtxmH8aSio1JsQqHFFz2Ui3yX0DCQlAtaQEuxgD1ykz7NBMAkJwLF49gh4J0BfsAuPiSUNVmfRQutR9EDBa5VtO9+z0uVSXZGXgyjFc58LVO2y8UXe1QnNaTH9ncds6+5LqbGK8r46e6nBDTNpIzFdGobrNPre2hoTkvqBKbTw0Ljy7zpr3v7FxBEOrZPNoNJCkx68hF+LpisuW/lOUIogvmkBTAWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by BL3PR11MB6364.namprd11.prod.outlook.com (2603:10b6:208:3b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Sat, 8 Feb
 2025 16:00:03 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8422.012; Sat, 8 Feb 2025
 16:00:03 +0000
Date: Sat, 8 Feb 2025 23:59:53 +0800
From: Philip Li <philip.li@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: kernel test robot <lkp@intel.com>, Paul Gazzillo <paul@pgazz.com>, "Necip
 Fazil Yildiran" <fazilyildiran@gmail.com>, <oe-kbuild-all@lists.linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: Re: [linux-next:master 1418/1780] kismet: WARNING: unmet direct
 dependencies detected for FB_DEFERRED_IO when selected by
 FB_DMAMEM_HELPERS_DEFERRED
Message-ID: <Z6d/eVGOR3Y0L2Os@rli9-mobl>
References: <202502070305.1rGTDnW0-lkp@intel.com>
 <6142d666-5245-4e00-8b1f-c43c6e98638f@lucifer.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6142d666-5245-4e00-8b1f-c43c6e98638f@lucifer.local>
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|BL3PR11MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a9f5240-2b17-450d-54d0-08dd4859a5fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wy849tcP6gNDRTfOluYxc4f4l7fPNVOWEbjm9CEIDO/ajjUDtK7KOjNqO7Qr?=
 =?us-ascii?Q?iU+MCECRXczsyR0/ojReuGXlskBgIE/k+ukOcMLn/5Ihh+0ygXVVwS4CURFY?=
 =?us-ascii?Q?wqf/y7XfF6c1c//fl486TSj0bN3OGNd38Srp0jGtkqmPeU8F+kBcXkNPFBmS?=
 =?us-ascii?Q?imX8Th/g2x4s7sKZMdVMRQNWv2lfgJuWwPDkkTlZDfYpeBXhku5mtUCrpNiC?=
 =?us-ascii?Q?sajXhGDsTjC2jhMQithRJb4juvK21yZSVC8Udzd1fgGHMDjHxa3wNQzK0Vzh?=
 =?us-ascii?Q?gM9OynRM+K6JE30iYTCYsfwT6zsML+GuZH517gtP1K5pbDvHfzlt7FVzCOyb?=
 =?us-ascii?Q?z2/pKLRoaQB24pbFeUR2Heml7F1Aj9E+P1hgVCqK8Gr1FDC4+zJU5jwDQ3Fl?=
 =?us-ascii?Q?ZHZ4Q9gxmZqgKFcTGEr3giLkYP/jbL9zpnA/H/hO/CnO4ylGhx1Gm9IoUiep?=
 =?us-ascii?Q?EuwRPaRT7ZKA66+FdINSThBsKu3SxO8F4MO6k0VPMesJX/wlKA6ix3lb6Qxm?=
 =?us-ascii?Q?+xRR9xW39Yv0oOqmv3UAN+roSQOqJdJ8Sy2IfPKvKLmGY9aXvZ2a+S7GvU8+?=
 =?us-ascii?Q?LK9jXAcYrfmYDsthz+pRoHVp6qrX/HGhmiucr5TGgw72k1fZ2pkf3Z3xqXdx?=
 =?us-ascii?Q?OtFbu/hArxkWTHNXmstNusUM/3IOx/Fvz0xiW5ysDADRfgrVzIl0bkuVDwNF?=
 =?us-ascii?Q?N4z929v7YmnGs07MTVOYHO2PdLFG8pj0ojd6zbVvKpixTcF1amv3B2WPgcXs?=
 =?us-ascii?Q?oXcK2SVq2KofzrYbjnA8AYfLWfk4s3W40na33jBMM0+7nwKnYMR3nbw725w+?=
 =?us-ascii?Q?z8p74LA8vfH+qNKK8d4EPZU/p6TU+arY/PglwE14byCmkts2jpOPgkjaWUyo?=
 =?us-ascii?Q?qRW5Aji4sa7ewyja2Cf8dNMH4/2iPMuK39a3tzK517zEUgfdo22zUAB75CHv?=
 =?us-ascii?Q?FdxHcT0RpGmupF3X0hSyNurZA3y5/hfUiomAxjejf3Hmg3gUzR6sl/G4jmSs?=
 =?us-ascii?Q?5LG+M+9IJknI9O8l9tlVKiVpP2Z5eAoH9QXEdzohq3NwjLBQqkmM1ZrPcIjH?=
 =?us-ascii?Q?HokaHjS1Zfa1PS9Ut3CXrCwUFA5wkEeKd4MYUOOVeJtzEHAH1pplGW+KlSC8?=
 =?us-ascii?Q?K4FvMp9GPllwxJWcS6sdzyIUJFJXG0Aw3wFaWRzVPMjbU+n7gy9Y8JUtQSlw?=
 =?us-ascii?Q?8pEQCqkr9PFTvylyqiBM2Zoo58ZadIhRe01w9JrhC38I3Jg+zbnWSBTfsnzS?=
 =?us-ascii?Q?52By+jNlcyaRzA7olJ236iziA6SoO1omYBmkdkiX/dpI5x26bhsTdbtQLreY?=
 =?us-ascii?Q?j8Uh7EayVnksapMF1iB2XpsQXQK5rBNBAoEW+Mb5nYrGLA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xVGfpz00TxCkODSPd6T9dob6+TdoGL+eGwu4enMZBdNapJAIVf04/xnf7Ve5?=
 =?us-ascii?Q?rCNv1CGGUsfnBYxb3b/HXRi7t5Wy0/NW3WpcVKPjZcxjviC9b/69N+YPGaI0?=
 =?us-ascii?Q?ykjTM5oTmHfuBEo07JnoCdRkCYZNMP8Z/2DtVaVsdtBXV9NHXAHbJnVmikK2?=
 =?us-ascii?Q?AOwfnOAHCNbKyjJlyaJCYxkF8sGQNiNOLuGyAM8Qy3FJlolWxB82RwHnOVbz?=
 =?us-ascii?Q?cRZK4I5ih5Ma+i2bIZLRsdLBgIypSq/sltUN/RDplXtedmTYNXx36ItiF9Dj?=
 =?us-ascii?Q?U0ZQDOa16OiwnjX/n2HHtTZZmMx6IbYOavx9nxx+verHwtybrBPDdAT/strz?=
 =?us-ascii?Q?V2xfNSj5vApS/6AXr8YlSJon1aHYLs11xtyhIwNOmSCy1r6rjoAZkUQUBlRg?=
 =?us-ascii?Q?qIBHvQ/iAjZSAgM5iqUYlBl7XjkfxS3cB+hFgDMZhWCqzMWcBijYCkrcqv+8?=
 =?us-ascii?Q?5AYbEXDqi/Owdex7cDj/fkeFdKn3ciafU6yD2EKvpjX7mkzZUNx0WtsQTaoW?=
 =?us-ascii?Q?4dL0+LRHtCq1iUUlnFkdhlzDJVYMtJj7SkY/FloiarcrMgLwFOUaDoReKvgh?=
 =?us-ascii?Q?EfjzFb6k7eJgSISwo8kzXm5/Td7s6AQr5bz+k9fiQ4/VHw77mDoFhNV5ckc0?=
 =?us-ascii?Q?1ogYIJ+CT9yqAgah9nGubcudNNc6o7+2kHUcKKezKDZ55v2gM2xIlsNmxYLe?=
 =?us-ascii?Q?MnY7Ryq8DHryiYQ3lkxpEAv6fDU9yUbzLWsM4CiO32CR8ekuFcxKXPUgknVo?=
 =?us-ascii?Q?qAiiNOeNyN6nWv1dg4zxBAovVCwSLWHkAYB4gPgPU6wuov10gOHp23z8h9BO?=
 =?us-ascii?Q?H1vtpQOhbw/NxS5WUvRHDUtx5D2PSqpVErCCjw2evlSJZPmCHEyvn8qs3USL?=
 =?us-ascii?Q?cBQvzp4SbBMs1D8RG5iamAGK0yL7ugAYO0eQLuyGoAtfRyBrxAuGSEuAXfcc?=
 =?us-ascii?Q?t3cIEQgn6mzlZnaIOB8I8VVZCQ+zDVHGYK2KA6yBi1kh/zzb8ymR0i2zDDD1?=
 =?us-ascii?Q?yS8UPGFr8OnYeWULkoOWRZZzlR/E6T/g0poJRNdrRXN4ZWvqzy3OhMtUshdp?=
 =?us-ascii?Q?migsAv5cnjGNJR6vKSVd5dba/U8e8BjXwlfwcfA1zlHVOjS7teMAOvnkPg6E?=
 =?us-ascii?Q?6/fF73UbUK+WIFbxMdhBAuda1Fz5PuyfPGcVsjZPufdTcRA8Wi+Pl1tGDTqL?=
 =?us-ascii?Q?JipJUsVKuVJNoa9BONnqvUhWRVOSRINNak7k/CLVTVBq1EIahOUMr7y1sy9e?=
 =?us-ascii?Q?oXtke8pZKOnJEtCgYigAC6t0pxOf19fHKrRWqJNugmr/UdSpbczKunS/OfwQ?=
 =?us-ascii?Q?2F6e/PzhFQva6lMr7jzX6wnw+sBVMKUWmp1r5yv20EdsbqQT+MFtFA8Bqhxb?=
 =?us-ascii?Q?QSJEX+F5csu8z9+xz29fL4XegUI9YNCX29TuLItcSluicddmE/Hkc4JMmVxd?=
 =?us-ascii?Q?fv/QIkZNiFAF3QEz0qqNF1MPdUuIkGuzXrnf/4bOeuTfgoGURV1TOr47Q2Ae?=
 =?us-ascii?Q?NHh/OaqPwDudtvxl5Ba/CenJfyQhZas1prWJOGVnYiwCpYXH3Wc0yP8RhXvU?=
 =?us-ascii?Q?Bg6ZLKGvXkGX0mW59HmDUpizI5WW/vtrFGYKj8rx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9f5240-2b17-450d-54d0-08dd4859a5fc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 16:00:03.3487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s30mZLj8bjiLw0Y9JLO+ves3mIOV/ic2T0qWqoDPNlulBG7tPoYaWnVQhUTQa44KGejSqvJUQn29bFD/w0TpjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6364
X-OriginatorOrg: intel.com

On Fri, Feb 07, 2025 at 11:59:58AM +0000, Lorenzo Stoakes wrote:
> On Fri, Feb 07, 2025 at 03:24:13AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   808eb958781e4ebb6e9c0962af2e856767e20f45
> > commit: 236ee083f1b9128fd5bd266054c5b8868f803cee [1418/1780] fbdev: have CONFIG_FB_DEFERRED_IO depend on CONFIG_MMU
> > config: arm-kismet-CONFIG_FB_DEFERRED_IO-CONFIG_FB_DMAMEM_HELPERS_DEFERRED-0-0 (https://download.01.org/0day-ci/archive/20250207/202502070305.1rGTDnW0-lkp@intel.com/config)
> 
> I'm not really sure what a kismet device is or how it's configured or where
> on earth this comes from?
> 
> Could somebody on intel test side please clarify? Because you might just
> have a broken config here?

Hi Lorenzo, kismet is part of kmax [1] by Paul Gazzillo, which checks for unmet
dependency bugs in Kconfig specifications due to reverse dependencies overriding
direct dependencies.

The 0day bot had used it to detect possible dependency issues [2]. And the issue
can also be reproduced by running "make ARCH=arm olddefconfig" on the attached
.config.

Would you mind check again whether the generated .config is a valid one that
exposes potential issue?

[1] https://github.com/paulgazz/kmax#using-kismet
[2] https://lore.kernel.org/oe-kbuild-all/?q=kismet
[3] https://download.01.org/0day-ci/archive/20250207/202502070305.1rGTDnW0-lkp@intel.com/reproduce

> 
> Thanks!
> 
> > reproduce: (https://download.01.org/0day-ci/archive/20250207/202502070305.1rGTDnW0-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202502070305.1rGTDnW0-lkp@intel.com/
> >
> > kismet warnings: (new ones prefixed by >>)
> > >> kismet: WARNING: unmet direct dependencies detected for FB_DEFERRED_IO when selected by FB_DMAMEM_HELPERS_DEFERRED
> >    WARNING: unmet direct dependencies detected for FB_DEFERRED_IO
> >      Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=y] && MMU [=n]
> >      Selected by [y]:
> >      - FB_DMAMEM_HELPERS_DEFERRED [=y] && HAS_IOMEM [=y] && FB_CORE [=y]
> 
> This is a nommu device selecting a feature that absolutely requires an
> mmu. Something's broken here.
> 
> I'm not sure pretending an mmu-dependent feature is does not rely on the
> mmu is the way to fix this.
> 
> I'm VERY reluctant to add a stub for the function that explicitly relies on
> CONFIG_MMU because it'd be very misleading.
> 
> 
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
