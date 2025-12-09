Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030193314C8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 13:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765285416; cv=fail; b=WRMh3/PFvzRyRXy+sUlYdRxwn19GXfPPkUJ90imX0N5j4c9ObvfwFHp7p/pIPZfrdGvxdWZcUGcFHBCzOiu/tJgTuSKm6ExVSohBiGxjtXYRECcgETe/l+SWLEt8gSNJMG3fyzKc34P5Hyejhhm5t7m7pFXYG7iC/WhWQ/RE/VA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765285416; c=relaxed/simple;
	bh=WMnpkJXX1HM5bnSLpumWf1y3ETAnKlxOEPC65fSovAM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IZnzaG1cMny0fab+qE972fAX0JOwOi2yzvshnFriVNzHCcEYmsXplC9c06Vx4UCsKOV5sHsl/nyLUYnVTV9Klp8W+w46zgNCyESW2t/2zcbGWk2u+ebFbpyBBmnWrcDGsE5fDZBxnQx8ReQu4VP0CPV3FJb8wVODyRNa108RS8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LwNMJLDR; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LwNMJLDR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765285415; x=1796821415;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=WMnpkJXX1HM5bnSLpumWf1y3ETAnKlxOEPC65fSovAM=;
  b=LwNMJLDRM+Hbogp6a00E2BOmagohIoIXw43HwsCNRHD1DjQ30/yZ9m3n
   iiPUyYybyi6Rj8uW5G8hAqoJveTDYnDY7fdohUXf148qCbT1So+HL3gYp
   89pKIAixRx3DA3QQxeYaH1k+bosatgnMuulZvWYKMPkDspGAzDB1br28d
   ltWvvDkVdUjoGW5KNQ9xKWtTXC7kCWtt2SvVCX31NSmVxbVMzVELekBjE
   BYkaFjjkzoyDssiSubp5ahViuEaR7nALLenX5PMeWbTqV8DyeyzsW4Svx
   n//Q/pPNYSlhW2p5cNUY3gS4DzDYAgjDBIRkerpCz/KYrmY4hTtHCl1cX
   g==;
X-CSE-ConnectionGUID: bfF8+iG/RoiiLK4QfVp6hQ==
X-CSE-MsgGUID: uYxAvpAMTRCGCfHWhFm77A==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="70860200"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="70860200"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 05:03:34 -0800
X-CSE-ConnectionGUID: jT/+BwVXT6SmlQlDOWBzyQ==
X-CSE-MsgGUID: aJeZTP84TKGRFTcL73Lrag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="226888305"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 05:03:34 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 05:03:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 05:03:34 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 05:03:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQMgz9oASp5yIEWZESn1vvEgoxaXpCDLWkdRVydKIKKFk8gBs40mqCcgW+KnZsf0e8dcDfJSaTTZbLxnAeFd/sbAIjDfSjyG3LDwRRL5KkkndoB3dkDH+fHGWvNTpKkDJq8bt4oxnIyfcZaT1B9x6O4poz6g1OG8Mo1BI7i+360jsrVviJUPPmiQMKCsJnToUG6sYhVfsRvzoL10cvUP8mfIsl+t2KpD7RKn8X0aQhdxXyYMQV2JSYUotcGtWK/wGklhn0vjYWDKm0eOGEOvdmuXhJbOOqcYXJZJm4l/z7PapvJv+pF3XyCQJmohw3Qoq/yEW8YY8eeH8pcwgtEkdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZIQh8u+2uDfwZJ9aHQvxEKZiPxN0BP6IYRC6KWIIdI=;
 b=jmnveJRONvJHxRvhs84VbrjQ5p02Fy3yfTDiL/2GQ/S0Alm41lS8L6b7e5MTMVg6odZgMcWQQQTmHubD7N/65MFUQvbXTLTuaqbHfKT59lLh4JuIQWzE3DecNG4tT6deW99Qw89iNuwd2d75HO9cXxn8OH//XEGmkJT8liy8+GXmEzfb2JXe2NqWXtf0D25yd1SZYP9yi7gxtRbUzgzwdAx99up5+vGOivQw9h+xNRgm2WIpGpulBE6RHUqd9Nx2+6A5RqPESa7i/s/U34rz7wOKUX1fjCzBTY1OMGhBnFvu8JqgESC/SqfscbjVAlGzk3ChJ7Qz42UbJzAKZ2eqKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 13:03:31 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%3]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 13:03:31 +0000
Date: Tue, 9 Dec 2025 21:03:22 +0800
From: Philip Li <philip.li@intel.com>
To: Daniel Gomez <da.gomez@kernel.org>
CC: kernel test robot <lkp@intel.com>, Oliver Sang <oliver.sang@intel.com>,
	Eric Biggers <ebiggers@kernel.org>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [ebiggers:wip-nh-lib 14/20] lib/crypto/nh.c:82:1: sparse:
 sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded
 NUL byte"
Message-ID: <aTgeGoq1JjCfuYXc@rli9-mobl>
References: <202512090359.7BkUaiC9-lkp@intel.com>
 <gszvkjbpxa5ny7c4vtpmklgibxxrqkf2xkfwum5vrg4ooipxl5@uqvhrmvtzfsw>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <gszvkjbpxa5ny7c4vtpmklgibxxrqkf2xkfwum5vrg4ooipxl5@uqvhrmvtzfsw>
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|CY8PR11MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c9c24b-610f-45f5-4976-08de37235a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wv7PdjBruCCi/pU87fxhmoaz0w364oIAFD79sUn53GVZOJ+wR4njZShlwEzF?=
 =?us-ascii?Q?fp/mmQJydZLgDX3kYy8ch3wtJuyVbSL8ZHoeI6kxkc9Xo7+ZCrs+PTteIr41?=
 =?us-ascii?Q?o/L2Vl4tcCM/2E0G4eds8PcN11+pj1JHe97Yl6yKGIkzSdfo0ErKMVfxVAdm?=
 =?us-ascii?Q?GlmCBNUoQTS7zZR8GdN+8nJR7M4Rr6S0ClrKuO0ZAv3auksgINKXh0GzMkPf?=
 =?us-ascii?Q?eYEAvja5sfy/c7Al2iHRLaa15bdyY7Twx7VMoNrwjdye9cgBa2fCIC7rxXGD?=
 =?us-ascii?Q?SJJaTiq1noYUkLpOotJiWEasCKrVKua+FHSzcoAiva4EW5FNAdhyC/U1GDbl?=
 =?us-ascii?Q?i4k5bgTHoX97FHqTOxyx+ilyZj8DPupcxMrSU+/qmXMipg6aQT1vP0MVygp0?=
 =?us-ascii?Q?BeRLfeMMz58WxlRA64zkxOzW69a3hNftT+awpnPx3v/Q+kBS0LbXTRDyALl1?=
 =?us-ascii?Q?PNLVKC2FdKA7JNI0kMfn3Pk2lpV054xj5PDcABGrKqXMaa0FGxXp4KO5iDnN?=
 =?us-ascii?Q?KwKJk3VFiewMCBRzjV/doSqPSSVrLjQwoFvpTnRcBg2t4VPefqTT5qvzMrCH?=
 =?us-ascii?Q?dz+XuvFS996XHOq0WDwOU3um6a1f8AylzUAww5r3/939OYzEH/wZc9s5DKUj?=
 =?us-ascii?Q?g1AwQeOMk6MGDoz/KnYYe0iabppMeHNCV3W+E66/0y26jamvLzy6mCsmIR0W?=
 =?us-ascii?Q?67xYoZPqhta5kQEj97VjIflX790cw6anrsjuYHCFje/yxJ1ApzhTvBOgETtv?=
 =?us-ascii?Q?H5PcqvHv/CHHvh8bkr0r/Cgz8hS5rdEHkiozMNHGKvdC+24MvdHATzgb6qnC?=
 =?us-ascii?Q?3NaUP7mZ5FRZbJRLj9D7ePNO/UFk3sd2NJ+95czLPUvt/JiWhEqbKeSUau4l?=
 =?us-ascii?Q?YMpT9UEHVxze9IpE390jfMMY6cKmB0sYp9XJVDT9oP5o39nGi9QFoNBi0XqT?=
 =?us-ascii?Q?VcsEbW/sCl3WwCYoJQPgLtatpdCwiO7RBWS+zsDxi8X7ZwnSIE2YICtQ/4F/?=
 =?us-ascii?Q?ZWSz/Rfban00MQ2QMofpSj4kCEQ4iapmBxeIZD0szRSyplOyf4KSUEuxHSDn?=
 =?us-ascii?Q?sNSUsSroon/LmYACEsm2spKdHR/XA+lpFyFwAti9tnLkPWzr7ih7Kpx6qUGf?=
 =?us-ascii?Q?eWX2V9bJ9HqnJrFyvZ/bRnhDaUcj6XRgCt1Qshb/nvlQGoCKtS0eTLvCzvex?=
 =?us-ascii?Q?G9vb5jrxV3UewDyoHnDYorldf1IDjELq7q/Az8bdEaJnXc6JlVjI22vY/1Fs?=
 =?us-ascii?Q?Q2WRaZrUNyn8ZZtVJroYsMulS767nfkx4wzAuc0RHn+HT2Z16SbYaEcc3mqr?=
 =?us-ascii?Q?9vYtTrkNfYDAeqyzkiX5/KgTzR8YOyORdN4KQl0s8RJ1AYMR9ZdRqbbOiaHF?=
 =?us-ascii?Q?/bdgWruubJ5HM8ox612bsaTOM55lm/YMx1DmHuEO6Avdxn3JaDX+rzWOt9kT?=
 =?us-ascii?Q?IeLGlua9giU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LSSwIunHtM2HnwojhLI4+XA/v6WD2Htq6h96eLZnEms9pJu5P4NP4az6ACdz?=
 =?us-ascii?Q?/I2GeNWhSAimoDlG4GNsC7zw79eQhdTumz71XuleIb67DJ/uJDPnBvDX81BP?=
 =?us-ascii?Q?489Zw0iIQnJ000tfWrA9WcTVaEPBRNgmwgM6gU70b3nuGkyMnjRaV6tGbU2a?=
 =?us-ascii?Q?RHxWC5ykJVp2jzb1sRBAKNOF+A2ARYJApjEfoEmIE4OHVY5gFWrmWjJ3RUA8?=
 =?us-ascii?Q?rnMrjCgnte/4atbHqOA0xX83GakhDYnv/kWjqZfEtjtWv7fnozUknjwauBxL?=
 =?us-ascii?Q?tnmLvNB+2ELXwgQlxKFmg81wkOAk8EatGYT3Hxx48bQv+5PP8zavfUgm7vPn?=
 =?us-ascii?Q?Bfvyw+Gj/+M/KzBcMbKktxek4mxhbrGT28RicMRg4tHiDmVGRkD+TDBON+WQ?=
 =?us-ascii?Q?ig4XZr6sZtpjtf4YaGi3Yhloq2m4s+VBNdIy1zRrK4tYgIzeeUAaKfuswTMz?=
 =?us-ascii?Q?dtcF+gyY5Lth1VC+I2lCno4Z5eltMaNP/DI7g09mJv4TA/T2E4WK+62Uwdk+?=
 =?us-ascii?Q?0TJ/Ah6wwPuCwtx1lesPnO91S86sIvotuQA1zMjnii1oFN3BRX3V2HJ7zFtQ?=
 =?us-ascii?Q?d/bE8exHHenSSb+IxznwGreiWs3hZhyOoxyZlc1z6w64cXYGEPokEbQMZ4jb?=
 =?us-ascii?Q?uSdZI5NLfdaWi7XXJgVZqEGj+FlqqLKyb9M+8AUi4jHvllcAQ+eu2yxLx+Nm?=
 =?us-ascii?Q?eyrQdcrKjiQWKs0HoMIaxIjEWzbyvSjSKyOpslhrta65FrhZvGwdq0K3l56I?=
 =?us-ascii?Q?LQp+Ok84ar3UT/cCndGbaYCbgT7F26CJOEVIkrUMpEh5Hi/+qYwloK6qYMOk?=
 =?us-ascii?Q?Y+1oR8gl1irgpeto6n5uF1AmiE48WO6KVzy/v+2JGJYCH+yiIB1A2giMbe77?=
 =?us-ascii?Q?PoSTimtaITIJmtZy3NIz2oZSEYvXowerpf9oxLhpDyGhBsx4hiBqXE1Y/YG6?=
 =?us-ascii?Q?FyleB5KjYiIycC46pK9PYXR+QtHO3UsROqMoP3o9NOU/ylWQMhUi2jlGJGWM?=
 =?us-ascii?Q?VoEL6Q+JS0ZQ7+T/8eSekD8o2djOfrIbqnW6lUFs/meVWoSHT9S4WZPAbsoD?=
 =?us-ascii?Q?/tOnJpCUvINLVetWMC7KgHTHJE3SqLo2g/rdUmoZq1Eo3m1yh5Hcj6MSQs8y?=
 =?us-ascii?Q?KBh2Lp/ZFBvNTtaO/6uDJPR+8DIKLP7H9bRDrk7+lovA4EurDGm499PeNoEW?=
 =?us-ascii?Q?fUWhTMHvWJPqFYI6zllslTK3V6m5FbhazZuiL49TL4Nc8B1D5zIAQglSC0hp?=
 =?us-ascii?Q?CK0t5Z1KWLeoeS4aDgPOByG26AFd50hJWNdKOd5Ie5pWf5CnZGnpEWPbmMrK?=
 =?us-ascii?Q?a2MLchy+ZzbM6l947Jd/NB7x0W8eWwZR+aoTDpUGSHhsDcCrJdxsR43qwi8G?=
 =?us-ascii?Q?bQYi/BDuYfM6pBB2bRjgj1o+rX7+zYHqDm1M0voNpUQAb6OJ0AyXvm/yuAaZ?=
 =?us-ascii?Q?cR8XADcO2rOYCvUgZz2S9azdVR24V5LWAGwDo75u0I5KHpiZvRkof5qD//Y1?=
 =?us-ascii?Q?1bqyYY2ASfKpsSVxPpURIFPJ64J/pWQwWWrIJ1aXmd89btp8vv/rdVjBhbR3?=
 =?us-ascii?Q?LF8jt3XuEj+mMuRpZRdG3iBjfVPR2vBeov8cTf0b?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c9c24b-610f-45f5-4976-08de37235a2a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 13:03:31.2348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kxJ9iZklgyD61MGWcfI+zlGDmy1pCyrcBX66KLE/Oauv0NBtogn3W3fTkIp0GQTjOGWq+IeT6IeP73ArVlw4LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289
X-OriginatorOrg: intel.com

On Tue, Dec 09, 2025 at 05:28:07PM +0900, Daniel Gomez wrote:
> On Tue, Dec 09, 2025 at 03:33:11AM +0900, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-nh-lib
> > head:   d471b579f29c765ebaeba7a3b653052f029dc550
> > commit: 7f1c9dc7e0f3540a978f65f4d2d48ea1cd475a3e [14/20] crypto: adiantum - Convert to use NH library
> > config: i386-randconfig-r134-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090359.7BkUaiC9-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090359.7BkUaiC9-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202512090359.7BkUaiC9-lkp@intel.com/
> > 
> > sparse warnings: (new ones prefixed by >>)
> >    lib/crypto/nh.c:81:1: sparse: sparse: bad integer constant expression
> >    lib/crypto/nh.c:81:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
> >    lib/crypto/nh.c:82:1: sparse: sparse: bad integer constant expression
> > >> lib/crypto/nh.c:82:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
> >    lib/crypto/nh.c:82:1: sparse: sparse: bad integer constant expression
> >    lib/crypto/nh.c:82:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
> 
> Can you check which version of sparse this test was run against? The patch below

The version used in this report is

	sparse version: v0.6.4-73-gfbdde312

> is required to avoid the issues described above:
> 
>   fbdde312 (HEAD -> master, origin/master) builtin: implement __builtin_strlen() for constants
> 
> https://lore.kernel.org/linux-sparse/CACePvbVG2KrGQq4cNKV=wbO5h=jp3M0RO1SdfX8kV4OukjPG8A@mail.gmail.com/T/#mf838b3e2e3245d88c30a801ea7473d5a5c0eb121
> 
> Note: this is required after the following patch series was merged into Linus'

Thanks for the information, i will configure the bot to avoid sending this kind
of issues anymore.


> tree:
> https://lore.kernel.org/linux-modules/20251008033844.work.801-kees@kernel.org/T/#m320036927843f7b372765ddf2b7b47b32c9a81e8
