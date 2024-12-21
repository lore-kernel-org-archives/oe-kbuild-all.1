Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB94310F2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 01:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734743878; cv=fail; b=E4eVQ+mZYtwUWPZD2geIRy1++3uYJ2bd38GLOp49c/oY/hpSeXopEXW3J8ez5E5oMzhZzjhj1bxbHQcEZ4J1inNso/ZrdLOSDIbZ6b/iK0Am3huQ0Qhrgi7qdvkGvr1kJ99a+q/DsGImxRKgkmW8K/Umdu/9p6ThiknMNI8I528=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734743878; c=relaxed/simple;
	bh=s9LrSH8HzMPSoRCrj21P2zroIBIzXnJ2cm5ToIw/1K0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RmsIf9fBp6NkORzfCbj3cU0XZSoo10MENR30rNsWkNfab7pWC9f0iNTXWE8HZEtnvWFOMxtlCLjYBc1/5nuXGXWufVINq0I44I+vF4Aw6RmRk/YIiquqiebL96rXbVTHAgfUw9SJiGMZm2xY2uZ3MMn61JIDJs1fur1jtSl0X/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PagxVUA8; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PagxVUA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734743877; x=1766279877;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=s9LrSH8HzMPSoRCrj21P2zroIBIzXnJ2cm5ToIw/1K0=;
  b=PagxVUA8gUyw56T4R8h+TWOMgcb4hrsNdDHXnL/qIweXPa0A4dYYPNF6
   8/CGexnbxJdF6e44WMGT68jO8axa86B+bnB4WAQE9/CiW5JqfINLGMa9O
   TgwZE+JoMwCiqBzLYBNZYDkw6OJqhra3ufMRIeAUglrO/DaqXQBwj7jMA
   jKeWBeds3HwbJfM943aBx7co0mpZxf2jNHYS3JAPhOcOEbw1YgqL8AuKf
   0rKVVaJHQ/i5g0oHmhM7ZlEa+OquEUVqHEfNJ5tx3Nxbpoj0RxI0iLXo+
   RQxmq6jAwnSpnj8PyreFJard+qIyr4oRokRneR6VEFID4NtsnPvsCLSw1
   A==;
X-CSE-ConnectionGUID: rYJ04AYtSL6rBW9iMowjbg==
X-CSE-MsgGUID: QGoMY0Y7Tz6u8tAB88sCtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="57773518"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="57773518"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 17:17:57 -0800
X-CSE-ConnectionGUID: WdDif7UVSWucMdPw4CiyVQ==
X-CSE-MsgGUID: oPSV8YRDRLiUjGBOlYwc0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135998491"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Dec 2024 17:17:56 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 17:17:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 17:17:56 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 17:17:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqKdLAMjlHqCw/iBwSOyaeXuIjl1TyJHrFFo4ijbeWhWG48c9bAw1yMkBIq3ijEnOg2Dwzxj3wh7/pM+afP4DvN81Xft+3wcMf1zgHlpBiqnTJWQdq+6ksjpBkhrNQ035VvtaYqqeGh2Liva8hKQY/624BLMzB5KKUvgN3ESUWw05sk/kutRS6hDrKemFnrWZSUaWEZ0aXfI63ew2UU4xYilvWW9BEMDSGeNbqtYCk3W4WPLufdv3rTE/vf0fTv+OB2pVDcNoJ/Rq5F4mUVJWq0HYovsiVW3/ew3C3SAscro+Aeq8chPA6O1jgfrt6nTSb9Ma7Rx9WNspFDHQcdYiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OeOGfN3+tp9jhuW2gLoiL0DXUqhnS/uSfUokdxsq/7U=;
 b=MzGOg2TEjis3eLGgUM6Wp3/7c4J8BEGCS4ZVOFCbkCGBwVzdDAOjlGFxqOY9u7enL3+Bak6ENSBu5zu4xOhXgj07/N7vu5s/MZK2W6UbHs0FoIuEbgOKm9QMyocN9koYdKqV2khQNFTbu5FH1uM8dj79QuXKCQDGJSOtNvniovoFkchTzc6rGRIgmz6PYrJbWRgKj3UZwOaYfQd4vdPaxYkERdgzO4/TYSKF2OxLcCeaMbzfGpcnvEuhuwpYxA91VGuVnPZId2in6enM1AU3CE6pVCTutnCuJUyZHS+WjwQKPOJ7Md744OEifP4SDVut4jnOo1bw1CAflXTklMlXOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6)
 by SA1PR11MB5777.namprd11.prod.outlook.com (2603:10b6:806:23d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Sat, 21 Dec
 2024 01:17:26 +0000
Received: from BN9PR11MB5420.namprd11.prod.outlook.com
 ([fe80::7a2d:5b5d:f9ce:594f]) by BN9PR11MB5420.namprd11.prod.outlook.com
 ([fe80::7a2d:5b5d:f9ce:594f%2]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 01:17:26 +0000
Date: Sat, 21 Dec 2024 09:17:16 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: <kernel@openeuler.org>, Linus Torvalds <torvalds@linux-foundation.org>,
	<oe-kbuild-all@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [openeuler:openEuler-1.0-LTS 1341/1341] mm/sparse.o: warning:
 objtool: missing symbol for section .init.text
Message-ID: <Z2YXHJDxxteAKgFJ@rli9-mobl>
References: <202412210532.I31r9MaS-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202412210532.I31r9MaS-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To BN9PR11MB5420.namprd11.prod.outlook.com (2603:10b6:408:101::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5420:EE_|SA1PR11MB5777:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d3e5a54-f492-48aa-9da9-08dd215d3a8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9QuzVBjLD4BACCt1nv9rSqsCc2CI8LXtUMXOt9cv9CdHe3qbLmbZjUGtZEBF?=
 =?us-ascii?Q?SYIZfrTsZsNoO4va9pnl+Tbh9tV7UbD1AhkiioZznBKHBAfEYB8cCBeKfkwe?=
 =?us-ascii?Q?jpzV/pJBgqf/sjmEOToIbdFYnSvbb+pt0hon4dvOA1xCuXy9dEHkJ7kqQCKy?=
 =?us-ascii?Q?Oj4G/ZldVZUz6opC2U9AYWArBWCt0ORDGIlzjuakyYfVxWn+jYvMkjzp2/qj?=
 =?us-ascii?Q?/XeWcE9rb4SY5hAIZl6XplhpYvDxsKJ5AS76JXZkVqPfFdadaz69Fx4jUCE5?=
 =?us-ascii?Q?DjRLEtSNN/JoW/hu/FqdfRdywti/WTJCdZQlxLV3cjvxNICkWHiAZhXi9oSw?=
 =?us-ascii?Q?umuwWgcyvealf4YkZkxQCQiOT3d0i87qcmkQedvAQ02Jq9XodKbg0qxZuV00?=
 =?us-ascii?Q?2PJWx3dbfLlLL5Tos7WvO14XBp1xWgrFSfIklz3PvA6M8p53rPy0Owi1YWSQ?=
 =?us-ascii?Q?RVnUC5/exB5pVhGTWxEElXfHbd5aVXBJWsC5OVH7oDv2FWiLhtS0tOxZwFVh?=
 =?us-ascii?Q?N0C6cLPp716pN+xSNcO3oGSJkIhArCMdhvUrsnfbC9JENSlZp+UGMxa/z4Px?=
 =?us-ascii?Q?7dxE4NhG9NTSEpNYDgFgtz56M0tqNNaYteRI015U3M2ejsgp6/4N78lTUPTE?=
 =?us-ascii?Q?mcjBoHxkYQ/MQVgBwn8/bBlZjVQkewT4ml0LemIs2GuLBfL1ZLhbAYxYVeDX?=
 =?us-ascii?Q?zZKl2ILx+gTjz8fgQynuMxlus3wvtR5+G8bZt6DXPAisXtMq0YIpVVAEZXXV?=
 =?us-ascii?Q?XdbPDP8vw0ND62wMn15yh5dJ0WQTOUV1wYrUE0fNXFw3bQF0yQF3GiuIAndj?=
 =?us-ascii?Q?JNRUFanhS8h29FYlZjAVUfOxsmEXZMGYmBpph5r7TGYklfojkhjKNM/ff0VT?=
 =?us-ascii?Q?esmu9kwoVpMD9LV5b51ooeAo5sJGL9Hze+xVrepvvNiNS8jzu2EFgHtnDHbR?=
 =?us-ascii?Q?o9jkmemD47CrR2bAONsMVY1zVeoTX+gpgMcCOvIVH82YIbww6kBi3TAhaDpn?=
 =?us-ascii?Q?nnrfbZFmxFx8xedw9b6EPjgeqw6AFnYVZWw0V7Tm4TbM6fPenxVyxb3skXjr?=
 =?us-ascii?Q?e+WpLVEBWm6NFrFyipuRpaO1iBR0mTBohExrL1hxBNehIexd/58R0urwADsp?=
 =?us-ascii?Q?ZGY7rXqc5xSjx5+lMF+p/mJD60cVpwfAd7sM2Wz4+HwGhsWeKy/6IQdX2TdL?=
 =?us-ascii?Q?OcQkvbwFmnz+eb5mHWK6HLBBecwJ3TyxbrYQrMP6hZVWjWY0L3h75Ntec/Bq?=
 =?us-ascii?Q?+fHWLhIFIkSLFiQp72mlx/FfiqgPwg+oRKSoRNQmMD3w850ZHCIVWSf6t/Ya?=
 =?us-ascii?Q?ivSfo9JCh0BOgDTqPSnTxAabZjAAq2TuvKBjUJgcNboeeQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R7xIQSWQOnXhG9rPw7Tqf8dDjZhH8LiZfkA6aXq4NSc5MQetC5z1ROvAbKCn?=
 =?us-ascii?Q?aO//o+Y3eYgKh/WlTcVfIdM2b4VasZtoZX9C4GvQBC2FkLCsbI75wrlwzeRW?=
 =?us-ascii?Q?YPDjRacZlmQhLuiWQi17ptQgIOSykD7BWSjhr5jPW2TfvCYjWIupbrikBY3T?=
 =?us-ascii?Q?/UJM7n1GeKmdrdWd7EoSDifDakLxSrEEvv17vAYBm271gBTzUdZOPhSnsFhl?=
 =?us-ascii?Q?Z/JKVWHisbJdqAcWFsAmW9keBPXwKj/IigXaei4DpWdwx5x5oeu/zauT6nm3?=
 =?us-ascii?Q?byBfOo9wHUZ3XHg4nefF+CZaJ2vGBJxkHx5y9wXehel7Ywicg0/3/8GRr4Ar?=
 =?us-ascii?Q?w6k7y6OWawXp4zYJLrqArM7NbCbVw5dT0MaOqQ3hHFixWpGqV5ZLpiOaPCHD?=
 =?us-ascii?Q?uLyh/nUxQhQX8GD6zFM0krnssw0g7uYkWsaHxD0/K+uRHrYJ8IscH2rK2UcQ?=
 =?us-ascii?Q?nwWQ0OZFDAA3VcnKTBZlxQDmNjfyXpssJhLK1Ij3XYTYH4m4pCfevaoLNw9j?=
 =?us-ascii?Q?dED5b99h64epR1czMXYAtmovx/UYVyCaBNMuARhuVJmBrvaz4s8cy94c1Kqp?=
 =?us-ascii?Q?tN3eOLgoytLJc0+igBPY/F4nZXjDjk3JpVg9b4iUylL+GM48iy9nNKGoejoM?=
 =?us-ascii?Q?KZWAF65IzESh5drQLZwa+j1aGYvLGFlFEQdRDFY0B6CXLl+pYwI9OKMft2b3?=
 =?us-ascii?Q?kWLEnCvUaKOG7F1is3mGJ3XnNgjpYnUyPAT370707QMU5RJ1fxnvJntX8of3?=
 =?us-ascii?Q?WB6S81BTA6iGcy92zXdZT8UUlDL27J5Y2WaRW3r9KdhnDoxXrnz9lEpvTqyY?=
 =?us-ascii?Q?ur8QV09tBnVp/U2Mop62t719cAymy+IT3+f5mTs2fZkJV3DIlntz/UK2qN2q?=
 =?us-ascii?Q?l+vV6SZPfuYhpp+eiOsyBKGUDInrdysUYo3YAIsh0+3jKm3PnqjTTP1xrqtI?=
 =?us-ascii?Q?Ebs7rRvMDvxrgvqW7JCsifpHchYTSnjIMzme1mgxYTHMvuegWYygcEitEisO?=
 =?us-ascii?Q?1NwFe3mUEoAUxA/Yexdb8TCW/XqliV2YupEOQo1fxsAHPYumlsWkFkwNQejI?=
 =?us-ascii?Q?/39V9+ks0ZPwpALpR434VcfsFc+miIZKSQC2g4kg+HrNii/txjAieLDF4HlC?=
 =?us-ascii?Q?1hcPSi/uSZIJcjS1XmJkuquUTiHWQAPWm2UAIVWdCodoIApvoXfzAUG4nlCl?=
 =?us-ascii?Q?ZpHFqEVdE2u5H7cLjAkHRD316LSnyizkZoSt9v+aG5ronveEG9S6vVjyjDAK?=
 =?us-ascii?Q?aJl2fIJ4357vofRwSGmFKBw4xjZ81UFB7py+NHsOlG4YR6CKGdELAuEwqTON?=
 =?us-ascii?Q?tSEiO8pEe9AUAvsjvLjT5owPLOaIhDZ4D5ymq2QFexky2Xc79fhBfBonm5pe?=
 =?us-ascii?Q?SuFfktl9pFi9g7lGFDKTNUZEmoExlCyfRfXbWkrbh9M3NMT29QhgQTKpxB5W?=
 =?us-ascii?Q?LSSaWwAQG86f1S3XwlclLe70NIMAL+1fAM4HZZLsid+GF5GjmORhSX7mU5M1?=
 =?us-ascii?Q?0utC4k9koxcp95e4VM+DfaQRRA3oGpU+ohc7aebZlSK7c1Pp+14j+PXAsHLP?=
 =?us-ascii?Q?X6T4V1KyOqVbNJwNL5z2+C4OtdQDNAnLjTZDRV16?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3e5a54-f492-48aa-9da9-08dd215d3a8f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 01:17:26.5966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phzhNCekF5GDeW735eMnjnzyc7t4+z67wJ6RcIN9PE3K5XcVxVlNGfE+WY1jeuTcy4XW7nZGv9WG9MrGNWlcHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5777
X-OriginatorOrg: intel.com

On Sat, Dec 21, 2024 at 05:38:14AM +0800, kernel test robot wrote:
> tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
> head:   02951ceaa6d546dfa0f741f52f6d47e0fb0ac7b4
> commit: 2a3cb8baef71e4dad4a6ec17f5f0db9e05f46a01 [1341/1341] mm/sparse: delete old sparse_init and enable new one
> config: x86_64-buildonly-randconfig-006-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210532.I31r9MaS-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210532.I31r9MaS-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412210532.I31r9MaS-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):

Sorry about this report, it should only be sent to openeuler mailing list, I wil
fix the bot to resolve this asap.

Thanks

> 
>    mm/sparse.c: In function 'sparse_init_nid':
>    mm/sparse.c:199:27: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
>      199 |              ((section_nr >= 0) &&                              \
>          |                           ^~
>    mm/sparse.c:461:9: note: in expansion of macro 'for_each_present_section_nr'
>      461 |         for_each_present_section_nr(pnum_begin, pnum) {
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/sparse.c:199:27: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
>      199 |              ((section_nr >= 0) &&                              \
>          |                           ^~
>    mm/sparse.c:480:9: note: in expansion of macro 'for_each_present_section_nr'
>      480 |         for_each_present_section_nr(pnum_begin, pnum) {
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/sparse.c: In function 'sparse_init':
>    mm/sparse.c:199:27: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
>      199 |              ((section_nr >= 0) &&                              \
>          |                           ^~
>    mm/sparse.c:503:9: note: in expansion of macro 'for_each_present_section_nr'
>      503 |         for_each_present_section_nr(pnum_begin + 1, pnum_end) {
>          |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> mm/sparse.o: warning: objtool: missing symbol for section .init.text
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
