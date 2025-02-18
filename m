Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98473EAC6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 00:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739838853; cv=fail; b=FxfdB2qy1OjEgaJocLOCB48lO+S16FIdbBPXEXl6aTZ75JxZIIwMxdqDflvUXB2Cxut5QsnqYazMS9sKDBvOKOvRnGYypzU7Luniln+mdRcQlsYzBDr7cZVu0+uuN7KJitt9bXSRlWWTWc3dP7y3O1oy5v8UaVopXYin+TBPYVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739838853; c=relaxed/simple;
	bh=R7TnWjGc1EUSXumZToq6O3INrbHVYAy15NYmjbmwLwE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VzH+Pfx8KmTAC0Tj1lwDRNYHlu/ZAoKNv52OVsk25PhOFyVpUzPwD1+pkU+eE9A+sSPHMNcfOinh4pMTE9BadNWhY9LkeYuNnimOeVC4li6ydC6zHwG1YBLeXMTzULeGhIhMOE8sbEJhrsNywWnscOIbDeQh6/hcxNMW/X+hr64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoZknK9O; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoZknK9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739838851; x=1771374851;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=R7TnWjGc1EUSXumZToq6O3INrbHVYAy15NYmjbmwLwE=;
  b=hoZknK9OqKY4fHD6TaE0mKvVToeUHxccBWJADp2gT3GL3aDKMMPZnHjp
   4sPY+57pCMymmR/WHnFbLa4DU1Vumq35ilSNIloUpYkmYHQnEiRK0meAn
   8xTn8Wo9K0nzHMF8bZL8JCoYAtafsCdwSch5u1106B5oWq0eeRz/OgJ+g
   uro8JJSvcIF7HPPJoIHwyS6Gl2hHQr+pJgVg4vLZ+/8V7Z4NU/VO8cd0s
   ZzA1vaJjxL0iISMxNIXuOgjzNJYXrIGS1eToOn/jX498sIKxidZkc+D0b
   wo2t5U+jPfq54TppEIjKA5+B9zjWUZ7szyvwvyUhlJiT//ipayb+VMLW0
   A==;
X-CSE-ConnectionGUID: yTu6QJaZQAS1UP5CVvPZHA==
X-CSE-MsgGUID: 6zx+l5wzSNC8yA5L4Kl3/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40781784"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="40781784"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 16:34:10 -0800
X-CSE-ConnectionGUID: O8VcMAEpTXuuJTeIsnbYyg==
X-CSE-MsgGUID: XlPMf8HxTX+VWsuqixSk3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="113982244"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 16:34:11 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Feb 2025 16:34:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 16:34:10 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 16:34:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fEFi5usK5wVaYdw13BSOna/VTRgDkWvgJjiS0Hi2H7BuhKImcGgKih+tqw8zJah0fbXkhmfw+Sr8oVQjgq/gmP2nhSyreQg/a4gb6QS/3TZp7feWTPdB6112YfEvel03HEThE0IO+r+rq6SvJNrKSOMFCPXxL8EfESyYwzI9w/Li7VUzOXmCLUtn7JkivrsnWDCGKr7PwTDBNC3SjRK5wvGTJL8/6QPYokdh60wad0TOmMBVoHg53IPuWPv2yGlNHINQvZdb5wZWztiprlI52VkmphFFnqBPkFiig7RECLUO5cRXQODIZXdnid5NhkfHr8qc8ns4rUvJTl8F7k6ddA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izAnpyXVvpj5cz1BVY7jIrsozh1tJLvDRFLQDzrlkNk=;
 b=InmEGPBEVu04GNXMG/SjzddI5Gwt6+uPEQs+HbO2PIha3+kMwJ+TlGwNExcQQyOeASOh4zIsSHbu5DyGB1j2ZFUrYJY/dTT6O4caYsRolCT3NcnQaMZ6diyijQM1xPQhoyZjE6NZ1DNk7Q5mSRfjMtie2L4n3wxfokKP2mknZW79CWIghkfSoCBiP3RFDYFU2i0681zyOyIA4Nauer9n+3+rUP714/qHXdQBTtOZ2JcnJdBPWOY3rILsYIL/j62O2FywVRUHAyalPLSENG6aWGOZ07KGOfmbC1UZ0uc2rizv+1Zr3j1YpewsAyuuPu517e36eUF+Y1QpBdpmvIH9Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW3PR11MB4539.namprd11.prod.outlook.com (2603:10b6:303:2f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 00:34:07 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 00:34:06 +0000
Date: Tue, 18 Feb 2025 08:33:59 +0800
From: Philip Li <philip.li@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [rostedt-trace:pmem-on-reserve-mem-fail 2/10]
 kernel/trace/ring_buffer.c:1943:34: warning: variable 'bmeta' set but not
 used
Message-ID: <Z7PVd5941DTfszzr@rli9-mobl>
References: <202502120851.VulVvSyg-lkp@intel.com>
 <20250211195421.69854975@gandalf.local.home>
 <Z61hYOLmsekGHJfk@rli9-mobl>
 <20250213114231.256e9845@gandalf.local.home>
 <Z663WSipAftBvIAx@rli9-mobl>
 <20250217111430.243c3560@gandalf.local.home>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250217111430.243c3560@gandalf.local.home>
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW3PR11MB4539:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4c240b-44ec-4fdc-0d76-08dd4fb3f3dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M3Pm42m8yn0GSbAd+VuGUQ80qUhtb4sGOewZ4E4zGJsRDyre3vZzWhWu1MAB?=
 =?us-ascii?Q?D5+UWPf0iL5I7wKD3iisSBw6USZNVxUMkBUTo5vhYJIQyJoWOpGo2qI2pyPP?=
 =?us-ascii?Q?KkWG60A6lWjmP8fHv/eQ1us12NAZvlKKH6bQOhaoZv3parAclg6Ua/pG1YR7?=
 =?us-ascii?Q?9Y5mvKA2r3ICLPk2T3BaG3EIqRLzFVt3ekQTkqkZk5YPSyiopEvh7GivxbFe?=
 =?us-ascii?Q?sRbTQUELPNTNiGvQvki3MnXfWKoeWMnLmBEcvqTfricKUs61f5H7x0N2x+Eg?=
 =?us-ascii?Q?yO1+hi0sTDWfphzR2RiYBS/Q0IsOELekkuEJFK7qytt/eiAJb6iTJvJbeCjT?=
 =?us-ascii?Q?P4paZ3u7Hr0AK+7p5PGmz7VYyIPIpqj7yDjXgpY1ULCcRwszyY9YNPfwfLHC?=
 =?us-ascii?Q?wz8FQBb+ArNhekHC+RZjQq3Qn3xeEb+b5E8uHS4O4YXuxeXXMik+kXfe2G7F?=
 =?us-ascii?Q?tpxiyKzlWvcOl2bffUu/ybD1rJJsF7XZ0oP4eDtjbG2726FWj7ARW3QMCKod?=
 =?us-ascii?Q?9+xx+XGMdhKuUQjUa3AgKkB/d3fUjjEz9KFmUk52Si54BNd0xvsQ/7IKyPB7?=
 =?us-ascii?Q?PJNAEUMbnlKe7ww1iTgEsYxua8ejPO19chhL5AMa8D8jInMDNZv/G9Axd3ox?=
 =?us-ascii?Q?S6mq9c6/1ufhsc89su+PdNd2fEG8RhdVkUD54grzey30IWRJjnWrVXqx5Qo5?=
 =?us-ascii?Q?AQVeGJ0xHTWQYeft49YYU1KQIRYFmXZX1dRYo4yYIGMjN7UAlQ97ToRn88l4?=
 =?us-ascii?Q?zIv9Hns/AOtmJFOsiQKo612pb3ZPZ6/1TwlmB6TFPAf6Uql6b1Wo6YgH9zsN?=
 =?us-ascii?Q?PM6fcfkzhUbo9VFR4/aQv6AEqNLPKUO9HCXs6hGLn7Mf4HgdUd8/cVQ9KiQa?=
 =?us-ascii?Q?4Kv0zTiHelUNqFeiHdCv0m067J3Lgfjh+HKReNTgf7ocszdqAp8zaRkfNXjf?=
 =?us-ascii?Q?QbQJD14ZexHfS7+q+bfncoGPHalsFju+qB8+p4TDoViAm6a6smykzBCsaH73?=
 =?us-ascii?Q?CwLrScQjDY3J7JcsSgAzREVZ8sbN54TnLN0Mf+oshxJiyEL4VLQWRZxN4uiH?=
 =?us-ascii?Q?/wP0bdySy12COzuOhrIu1AEsFKbLTDBGND1sH3YvEYI3UxpPK/7z5z50srxG?=
 =?us-ascii?Q?DTPTT3g8szfYbVielCS27QSSx9dyBmmOsp4nyoWZdRBslZsNvrDSFgiISoj3?=
 =?us-ascii?Q?8+jllHbGzI7XBbpZtYTh7uU3ilpWXd4ik+ly2gfKvPYWLiIPGPQHY0VE5eOc?=
 =?us-ascii?Q?3zqj2aP4RSegxwCe7b+AQL2zY8tIaXhDtCQwAYSAwDCsEGGYdDTLaF2znatY?=
 =?us-ascii?Q?CfeAhYfcOT5ACY64KjGkKvP8wo5XkVsQGF5uqdnxFvZDRgzHEorztgKvX+ju?=
 =?us-ascii?Q?L2bVn8psM5Kpd72DHByCr+zCFgUJwFbEBrHYE0XGAwLRxsticg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?64e3EF1wqx8CoWDwgjBd6ZVq3cPYASDN5rLqCcRp3rtqLuntoSVnUIDCt2nJ?=
 =?us-ascii?Q?CsrN3awVoNxcesSo6rDEwepK6DRwh2HlcjbBToMog2rGevkpLABl35uwZScG?=
 =?us-ascii?Q?FixvDOpIfQ95RDJdnxkO0CbjKlToMYMFb1Znv6HjW7C8mJMrCA3fZO8EvmCv?=
 =?us-ascii?Q?3MqsVbx3bOYAnRhoZQAhsmlnAJrhvxWgPTby1G1D+Wx6NMKhzzo7AOVM/ITP?=
 =?us-ascii?Q?H54NUzmb3JhIAaR6ydljt9+fFVIbzpDmteVLoGjjcwIjmhiXVqSbPbqlh4tB?=
 =?us-ascii?Q?Tmz9/y6DveLuu05EtltC3pTRmjkvwfNKMAZTuWXcv/u7vGHZtVCfktlXXlBb?=
 =?us-ascii?Q?PAgNyzj8Ojm12BeaLKTDuJFCLk4a/r9bp9IVNxtHBURuX+LFDfh0dEnw9g60?=
 =?us-ascii?Q?8NQeMuYpNQM2vrP/euHRyz8lQr4DmNRoKhpn7evrme9P5Pi0LVAFrPYCxVHu?=
 =?us-ascii?Q?w6DP6IVNp0CfIXwXqtRY77WsHcaaWmlpLXeOr3PWmHQaZEy/NXanSP6zGVQ4?=
 =?us-ascii?Q?Pa6W5NklS93f/Rxn45XPlCAuPTgm816TmRYZxKcX5dn3jOY4YWt/72DZQhq3?=
 =?us-ascii?Q?FyMy5AGMFy+6BOS+LO2MZPPqhZXknFZabq60mq22SDTCx0Egtu0IBINSwHPb?=
 =?us-ascii?Q?wzrsH/Ts1Z2YP2P2MDwn0pYrNanzrtpfMu1X13HJyK0uiwm0i1mojCwlgpsT?=
 =?us-ascii?Q?yRb7qiIm3N4CZeMp4GEid2Zl595J5nS8o0kX7Zs78EioD9sYKw2nNaa32S3X?=
 =?us-ascii?Q?4lLz6r3jYFgdMmphAeVkJetkx+UmbXvDj2kd4WYidYU7SiN2sU4PKh7Rdc/P?=
 =?us-ascii?Q?KnrloikVbdLEWcJ9LBXSQadEPTp3Is1nf+dvI7gwCWFnH/bN3hFWpY6GQGmD?=
 =?us-ascii?Q?8fmy3j79s8apd4HdBEk1faiH6DmtaGf+PVRQSeWEPJLqW1OLrxkSt35JdGYY?=
 =?us-ascii?Q?oxsqjk8p5XsAMi8Je09D64URQiLBkoj+6jRp8mvMDFAll1Nm0OLpdQROEtPy?=
 =?us-ascii?Q?2x8Ia6YnXNxGSjIsf1cTaSnk5SkOpcXwob5yigrkdrTETd3Ycrj+awE52WEN?=
 =?us-ascii?Q?QuT+gaWaY2Q1W6DFnDeCzffEB4yOGJnuWCZEJvaHq7nIwC6S8ywVLmcke7Da?=
 =?us-ascii?Q?n5f0qLC3BUMnLN/MNAUqtLmoJg7nmp5E2m706aGa7Qh9+99exOzmem/+oQ7h?=
 =?us-ascii?Q?oQT6ocFG5jPt55cxBogV0+SwEAr8HPk4zoFj+fI/k5VTjgR9hmPr6IQFNcjN?=
 =?us-ascii?Q?nZMUQYLwshA5fz0Yw0mNjzDyKgWh5D7lpJbm8IRK8AmkG4jo/N2W0RLC9HiT?=
 =?us-ascii?Q?lPWAiujKCW3vH/zvxDNK3NBt7dhxc9v9Q7KWF78ks9C7QpC4m+/6DPG1ERz9?=
 =?us-ascii?Q?jy8A1RHwZwfjK3qqetJVZMEXPAi9GWlc+7nCM0reMYIsQcpO8i1oiRF0b0AB?=
 =?us-ascii?Q?Me+C89O8MW+IopXxbwqaWVTjx/bABpZMH4yhRVYVf2SChbwSe3zThOhiungs?=
 =?us-ascii?Q?i4SSC+yBFnF59isMMyWGPJzMvNIVRueg1O85COS3OJ4v54Oqln5v/V9M768P?=
 =?us-ascii?Q?5aacXbUlKuFonrnWZT4XjfGT4vDBwdQqZSrClbM0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4c240b-44ec-4fdc-0d76-08dd4fb3f3dd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 00:34:06.8934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mKXNrPZjFbl5NNxirTRSRULvjQpc1289c/16MNZJxGrFsOIPXXcHASn3+kiGf4V37RiFfnQ4wxcVKYsbirhEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4539
X-OriginatorOrg: intel.com

On Mon, Feb 17, 2025 at 11:14:30AM -0500, Steven Rostedt wrote:
> On Fri, 14 Feb 2025 11:24:09 +0800
> Philip Li <philip.li@intel.com> wrote:
> 
> 
> > Got it, thanks for the info, I will remove this repo.
> > 
> > BTW: the 0day bot records 2 other repos from your side, do we need keep
> > them or also remove?
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-ktest.git
> 
> Although I do use this to send code upstream, you don't need to test this
> repo, because ktest is a user space tool. Unless you are using the ktest
> code (tools/testing/ktest/ktest.pl), there's nothing changing there that
> would affect the kernel.

Thanks for info, currently we don't use this ktest.pl, and we will remove this repo.

> 
> > https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-kconfig.git
> 
> This one I would still keep. I use it to modify the build system some
> times, and this can cause regressions in the build of the Linux kernel.
> I seldom modify it though, as I don't touch the build system that often.

Got it, we will continue monitoring this one.

> 
> -- Steve
