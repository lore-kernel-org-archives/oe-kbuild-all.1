Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1DA59167
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 00:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725929766; cv=fail; b=sySttGgu3rbsVvxuA/U+/R6yMM7yP7/m/gWW3OhFQUtKD4V2gnJ9N/+Eq7li2KmMbGDQ/fwWFayDF7DtoG5ppFKr5YBwwTF1jF7o5CN0PTu/XtKcZJ/bvaiFIjR7WJaIkSh4tz8SyJVo/CMFiYIMV4hNYJgpyx26RdNzdZYK6EU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725929766; c=relaxed/simple;
	bh=tJBC+SUps8cYz4Z7PtWjhcQrnrIOZqZTwQFiFcvKIQQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=HO3zvf2xB05dfWCNlVg9Mberbz+gJBoWszK1kiYQjrSsafrqvTBGwPoHF3JXLJhv6hfHLK0ObsvozTJ3tfxq4fIkJYdIxyLYPzeaPfXZA2az6JsOCB7mcg89NYted+z06G5wStcFJIiN33jASOZBjwDKDdsv0o4LKtTrE5iQWAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfpZjdqD; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfpZjdqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725929765; x=1757465765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tJBC+SUps8cYz4Z7PtWjhcQrnrIOZqZTwQFiFcvKIQQ=;
  b=PfpZjdqDA2DzAv8YfE7knnlYETGzg3NOzVzNOX13B5LXe4snoLXZfSTD
   xUi0BIKD2qzJte/uiulDIo9nv3tNvYSm5BXmf1qNTT6mV4siyKECUR9Ne
   HvfeO0XzxO2t13bxv3kjH3sbPKW7JJ4BjyQwFOO9D8dw56N495+UskYbz
   HezFhWkihpc5NQWlOTLQr2NlFoPGNifsBLo/uJ0nQd2sy6cDVFYNUThxj
   Yv1B7u00z3B13qCrTppfM+PNjMlU3j+zabJ3sSKI79CQbkW71djxG2vGN
   pta/e6ltv3efM7M0V67BuZYqciBrarBMNS0knasJ5Sy8XTzfQ57OROpb+
   g==;
X-CSE-ConnectionGUID: tc8VwymFR8Sq1L5+gZlesA==
X-CSE-MsgGUID: UI6YstkwTu+lrWu4B5VPvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="13449606"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="13449606"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 17:56:05 -0700
X-CSE-ConnectionGUID: Rw+ULQQfQ0GJLPePzPaZ9g==
X-CSE-MsgGUID: K+d/4AjCTPSCqIC4IXbBsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="90134899"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Sep 2024 17:56:05 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 17:56:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 17:56:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 17:56:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3TwNXFZiLYMAKOekM1J9LRBYU2BB08ZAtVoaKc7X22AbdAabd43B6LylFQSN6VF8Vv7/7nZgT97gKFf7YK3NJu+MC3MMy+9R1gVYTR6AwBo2sZbCYRRY5WMynZH9yOORnhOTDloCkOmWLX86VMm+eLxRn3IED6w2syuYf3QeWWy4Q0QMxI//yNYnObBLr1MZwim6rNXSb7djkJMbP+XY3a+jMzULX4tX7Pb7zpg8ItXcR5KkARYTvFXQW3K9WZopEbHmlNa9h9NmK0sL9DaWd4p/kyPT4VBc207I9PKMnEuaEyF1HDX4qEWaHnirzbUAkI9KHrmRSG1dBG0bw1egA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mqa5qsmwsy9HiryxsRMk8fVMZ8h0eOzdLzwrCUSDDRY=;
 b=Mo7pGALb6NJ+MiUoHyJ/oTPuJkOZlE2SwiLRo/jZ6tm6+IsozfVhfHtKZyIGR/DsUowaO39UV/9TIbVwXaCrM8c/otIayH2PJUY6l8rigB1QM9ztnbDBTmB8tX3wQmpjm5lSX4VhIXCTk+9yBbWs5qOF1dydv5Hqqsv7d+0zPuo1p+3bJa12qvG+a1HFzB9wMegg5tdpOQyzjEv4UN/9rCEFwqKhoTrjNEqjHI2s0taGGQfpiwsrcIkjqOvsSRwrDXPKXG9y1VpE1yYbpKSyitCTFHVpm9nv6WDdMgth+TX1rO0knO8QsJoB9lIITTdissInexlkLAfbVtsg2DjTYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DM6PR11MB4628.namprd11.prod.outlook.com (2603:10b6:5:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Tue, 10 Sep
 2024 00:55:59 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 00:55:59 +0000
Date: Tue, 10 Sep 2024 08:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: [linux-next:master 10082/10516] make[1]: *** No rule to make target
 'tools/testing/selftests/../../../tools/arch/x86_64/vdso/vgetrandom-chacha.S',
 needed by 'kselftest/vDSO/vdso_test_chacha'.
Message-ID: <Zt+ZFz2uhvg8pFJ7@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DM6PR11MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: aafd875b-5579-4148-ae23-08dcd13355bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/HDU5MZr71kS/57JhURKMgn4cUJesGXBw/6gym/NKdhODHDGQdLr0KRM/mk+?=
 =?us-ascii?Q?1hozFk0Zinne6YtVP+ocoj6I8feATXjzLW4eGJn6n7Q5HDTYqbzhbL9MDPuU?=
 =?us-ascii?Q?eP36vgC9Bd6rv1MZP7RAHKCY49pQpWYCb/1w7Eg7mtH1iDAA4ZqAwb/utXjq?=
 =?us-ascii?Q?L9r/evcD++W4Q50N28y91bn1uyK1gJU0gmN1cqxvu19geccHzXMAc1g5HmFK?=
 =?us-ascii?Q?S1BCErf6YdPowWKAFx0SsZL1lGPEyyP76xGZYFr1GpwM44TzMcuX+hhoWS8G?=
 =?us-ascii?Q?RwCCIfBerL93xYVKvM5+HQRtEULn0toUQbcjzpv9JqlTxet2tdf3dbKBkSfG?=
 =?us-ascii?Q?u0aDrMrnveiNYFvvsn/D1U8KijALiFFr6z82das2nUR+2T6MGyqVi0E9lHoQ?=
 =?us-ascii?Q?/5LKFsJHAL02w484JEZs5dbMN/T50cZDT2nXxruL81DlK+hOgGKgSW6JE55f?=
 =?us-ascii?Q?sa6sk3A4NlATyInkfUM90bhMGuAULKa2I3qXs+gBgeYDnXBtxf0ZdYPAbIla?=
 =?us-ascii?Q?3QIpD7LDU8Mz2pgFs45rtUGiCUOYJ9zote8LNLj5x6Y6qyKGzztNm0wOr54t?=
 =?us-ascii?Q?K6c4WxRE4apuRiLfbUfj9nNyH9l2aK4yiadbUFnDkkPzzZZajIK4e2Q9/pO8?=
 =?us-ascii?Q?cuTNQmwrHM0O0ad6DDus8KWmlndiOWDY+Rg4+uhLjujW7NPGm1da6vqLKPsv?=
 =?us-ascii?Q?0vQu7qvSt574uTwMXQ2QrA93o2pTZzNfmtqAlg5de7/olWFuPrlROfA2BJW2?=
 =?us-ascii?Q?OBmFF2V596feB9g+mqZw9RpaA/Ozm59qWnoYQOKbgXBjIKwAzFx4+CMMXbYK?=
 =?us-ascii?Q?Qcrbhq6tIWGNPOrBOd714yqzHwNC1ULYSD07ekplpF0r7YaZd94D3N1ZankU?=
 =?us-ascii?Q?tEkCJdsL3IejnuG+CGpw1PvykVtGpZfzGnmTDBUlVAvIgpXQcNDLwQtTVj8s?=
 =?us-ascii?Q?CGeiMKD0P2JT+S3mbJzhlcz/jHORVCNczhs20xCk6lY7UfuRNeEc6KLARdxb?=
 =?us-ascii?Q?duasDTYMdRzkLNNGfTAlv7Y4+8VHD9pipbZGKd5VX0tAut9frlGS2wBXNPWK?=
 =?us-ascii?Q?d2mvf1C1dTWFC2CkI39Ajnp16qnJP0qgN/tE8W8aQTBNVscP31UyCd0myBa7?=
 =?us-ascii?Q?CUwa1ezA4CfdHW7ZbTqW8v1c8796msUS2qSM60TESLXWCRjRPc3LykBKF6Xs?=
 =?us-ascii?Q?4E1Tok7l2y6O8xfbXKZzEvPw/WWeafCIzTLNKRhOnUK9hsuGri6s5njKbGgM?=
 =?us-ascii?Q?775X/wf4E+G31WwIJh5SXGOReCLy/qbYih+4+sYpFjIS+72HSEgayDG2R4Vi?=
 =?us-ascii?Q?oqGMyeNALAWvqPKwCeu1BA3cAK1uR92rFO4LyfBAl882aCeK1UgCrId2HPM0?=
 =?us-ascii?Q?0n7VnLM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ke90knZQt6NWNsrziFJAzpHzNE5+iS0igO5ptACOH8hT9kWa9VT0/pY16itP?=
 =?us-ascii?Q?TnO7MX610TV2WXmQ7TODB2RecZHLOMZzhvpS2p565dRHdIP+hVA1dUhUE7en?=
 =?us-ascii?Q?oJxkJCXav0VPWhnADt/+9SsgopJgU6UmcTaPJzJ1WPPGr75VMlw4dTjgElIX?=
 =?us-ascii?Q?d0KHc/0sJQX4IIuSlmCLlXF9jhDvnn5Joj9xC7rCE/Y2nIG3msUYJyawRGeQ?=
 =?us-ascii?Q?RGMw/cThIqP/sq3pmDy7mmwoNJzWsChwI5Ihg+RTJf8nsSYAPOUPVAKXKANM?=
 =?us-ascii?Q?3aKi/Oihrabp2f9zcZcDWDaArRAkstNLE2UMjQPsgLpBodDAJsBVOIEFRuyN?=
 =?us-ascii?Q?8qV8b2sf2DGRaCW6jfobnmrXnvcRtDCh1LiyVXmLd3GPOG2O4oCqMIcS7wF+?=
 =?us-ascii?Q?nU+zp7S8f4A7ayG3HHB/S9zSe+/ckvmcDqH7wrdxpu5uwqipW+NhF7mEwGhL?=
 =?us-ascii?Q?ivy4LqZBiLzNWq6XqetiI3765eyY9PGzOorDJBrVfBeLefeH0WWvXO23oT7B?=
 =?us-ascii?Q?A2GRtZ27daP+FRXVNV0EjxNx0jO/WIq3io4yYQuNLniJaiq7WF+NGpBqGeju?=
 =?us-ascii?Q?WpYp7zAG21PzmZRwJaozigYzGi6zLa7xoq9KVCTDsczcpaFTk8AVdKXc71fK?=
 =?us-ascii?Q?MksHw3Z52GS5ob4tLd4/3N5b1o/2VBL3ldJ4bFKAXZ8lbvskWQ6VLbD74bN2?=
 =?us-ascii?Q?AU7XcgC27+FQIQeRcHCckWbQCaBtI7dobGT0O8+9lw91WNYSuUaQC7tiS77h?=
 =?us-ascii?Q?Jxj0OWksw/WbacNGuzDQVjM+qb0QxdLVVEsNMVJe35aeyBDz8RjlqFgNdtlS?=
 =?us-ascii?Q?3+qQ7/3q3p12HcyuUmNpB5ncx4buoq+ha98Zf7jVHKATK5/bhLdmnlGelgHY?=
 =?us-ascii?Q?LcFSqgGQ//KwYU1nGtYaSqWL7UKQicYaw7yRgNzzvZAcY60h7ux1mZWhu3Lj?=
 =?us-ascii?Q?Svjl9J06dG8ZcznJTWpV6t7PnFGb845CKiWZVX5R3/bgN2PymNRw3ER3mket?=
 =?us-ascii?Q?XXSkgxqdewGk9xv7u+r1jRdOYC+H1eK04bTUVZU/I1eku8uo8sx92XGHikfx?=
 =?us-ascii?Q?XPyF8dvOPoCu29KEEk3ncqNIPEKnyDAzEeT5pTE3H9TPeVhVkDh1E7pulAO5?=
 =?us-ascii?Q?TZOAkSINcQFN6BjK7IS50OTKBdBQ5kOWDyfyWKVxIcxxBY+MYDIdABEnhLwD?=
 =?us-ascii?Q?tUwv4Xi34/C6T1vNlx5TXwi30fXGMsXSUOwLxQUDkLdYKSd1gPKL+gFEs+AQ?=
 =?us-ascii?Q?1jYHRCtvPHnGvB8LL7el0fD+8fgxQ+aNDJv974Dpa2CJPR+lVoCx8w6YcsYE?=
 =?us-ascii?Q?T78SLfp6OzZ+qc99/K205Xo6tU5UVoMlIUTsw+4r82uxUuoHJY9yqs7/mL0d?=
 =?us-ascii?Q?moDTxue0xbraD/W8aRLd+/hJAgRxIAu9ZGlPYRe1mf0ozldxwF0D1O4cGBo5?=
 =?us-ascii?Q?fFfOe6h+FnwPs2e+TVR9qjdKy/am+VS7mRf9WqPlULI9yTWAkfCgulVN4prm?=
 =?us-ascii?Q?TNT/WNT4iB9Z6MwZHvloSzwlW02oVZnPzu+h8QivgdqwH7N+cmEB2MwiGk8U?=
 =?us-ascii?Q?f0bfHmfBxEL1Rmk/KVGW6atXtTsUY4Yem36xybtj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aafd875b-5579-4148-ae23-08dcd13355bf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 00:55:59.5471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ynq3XWmWZ3Adpn0RiTzTq6eYaaJ9H41haQuyt/hHeq9BLqK+zCutfbytGKM/da3ZlT3y7axjmdQXo+hQVxr1Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4628
X-OriginatorOrg: intel.com

Hi Jason,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   100cc857359b5d731407d1038f7e76cd0e871d94
commit: b5a41108f625371b79cd92976a1a528274d3a0b5 [10082/10516] selftests: vDSO: open code basic chacha instead of linking to libsodium
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409100141.Rlp428HN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409100141.Rlp428HN-lkp@intel.com/

Note: the linux-next/master HEAD 100cc857359b5d731407d1038f7e76cd0e871d94 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
>> make[1]: *** No rule to make target 'tools/testing/selftests/../../../tools/arch/x86_64/vdso/vgetrandom-chacha.S', needed by 'kselftest/vDSO/vdso_test_chacha'.
   make[1]: Target 'all' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

