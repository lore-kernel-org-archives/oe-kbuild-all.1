Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4079D1527B4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 13:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761486226; cv=fail; b=gsJiyeM1GVgladEECdl3QQ0yj+BN00Pe0nr+g5GTQiy0CDaINyGg7h4pQFj/5TDzLqBFSWRH/cCIJ11uktXvu+A8oCv6SHR/Co8DfKTtUg3iHk818jw6gKfrYGfZvhjDtbmPM4Z7bp1gsMd6L0p5vRr/0wPmAYLFVi/6l+l9lpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761486226; c=relaxed/simple;
	bh=/JIJCgWUCxKILqjWbAGJF/OD9llP+z5meXlVEBBj6/I=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CUaMKLU1Dssb+k4eVrIWAd6IzlAfUAIZqRXqQrQZ3+dEEeeXxJDYy4Dtn/cbtEVzR713Ys8SvzFVknfukpno/9DvHjDUwm28Cm3epTru3dNuA4YGfrVFuZykoWK3A/S3jIlwMWF1KlOwIHYtfjht9ka8N35fKKAPVjySZYzP0cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OMATWPht; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OMATWPht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761486224; x=1793022224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/JIJCgWUCxKILqjWbAGJF/OD9llP+z5meXlVEBBj6/I=;
  b=OMATWPht8bLBciByfx3/aKmFJWggMnTRfIIOrwZKivijC57xCu//6TV3
   ummMmbTXrXXjMeqRt9/1MV7M6bxckPcU2guYhXmLer2IAeo2W+oSXcj3q
   vxl1FIV/bR/JCdlA94zU81l/O+RU//kuYz74BQyU1uq38wz69PNsCZsgg
   kGBBBuruikdlAvAdgZOSGPhDzUGE2q3KZp+CcBAqEUq8eLgWNwtXQQfWx
   ucm8NYmO1VaM1kamOVVx8T9Tmy8HBrnEn/nx4z6z9C9HS7q3EwW01Cg6K
   Aukmg57keTLAEJCgwD8sx06iuvU/jrolcPoUilHzIEP0LrBNJJlbKNEp+
   Q==;
X-CSE-ConnectionGUID: lZqGDzJfTceiJofFKtsU9w==
X-CSE-MsgGUID: 9726GKfXTbGIRGiVQuPMPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67418790"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67418790"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 06:43:44 -0700
X-CSE-ConnectionGUID: R6zBaFDJQSKMs2bZFh8MoA==
X-CSE-MsgGUID: 2HfUA+o8S2mwZVxLAa0DzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="190049997"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 06:43:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 06:43:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 26 Oct 2025 06:43:42 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 06:43:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYdH27O4kVKN6K0i2aEANsYRmpjE9XYTSESmxIPzzLhU2+hekNA0/VrmhWUvf9dZKmZicJOGCJGexJDAk1v/ae02itCTE0ItsYwtdQ9aHpWLh2Nx2AgeRZ3S6vGwZA/fBTL3yneHHb5n4slNx5eyHUX1NOSqsNH7sWA0OoQ5jRUmQdbcs+n6sQVCb29yjqDxUpAjxsWQzEkPLNgLC7FdCQm9/S16ijBg95oQWpuB/g00fDVfYf+SO8pzOQ4U800zTaTboxwEv6shP/FcXWlL1w2oT4YbB1RzK+dRHVhOPMAzuEesAVC0JAUozJhwdZIZ/2I2/yjBIShTAK2gDRSfVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJVnYv5yYNHYakLy6zommuV9Fuv4vSINsLhXXyuvxEc=;
 b=tUR3CcpvATwpc3ewNkoE/iDqnoWOnXO4wJKlCOYz8CKLA4Unn81M3FSllm1mUgMEQG4TI+/l5mFCn0DGSt0zZPT8pT0sKkpVJM3veN1lDqd7qn0F7aITQXXi96Idsfwj3S9SIOEAiaxy066bGsMVSHSLYlW9EA0gwKse31Y2Rkm5SCMX47C21pNtVB9nj86hMAdjt96b5OBkTEpLyNXeK8gQWputPOLO3gEXm5lTAUdiayR2p4htsUit2foeHMlZZBQG06n31QYSXwYmTd8tc29AwruaxoAFg91Gk2aGV5Qn4/FaWuIsbDKBSNeHAR0dmFDCaDWvpnsdd49WPGYi2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by IA1PR11MB6145.namprd11.prod.outlook.com (2603:10b6:208:3ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.16; Sun, 26 Oct
 2025 13:43:39 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9253.011; Sun, 26 Oct 2025
 13:43:39 +0000
Date: Sun, 26 Oct 2025 21:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android16-6.12-kminext 1/1] mremap_test.c:387:45:
 warning: 'dest_preamble_addr' may be used uninitialized
Message-ID: <aP4lgzQ4K3uCUovW@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|IA1PR11MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: d814fbb8-2022-4a52-cb70-08de1495aaf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MEVqcd+X3hTG23IyONcA3TlgXQCkkyk8BeGXHHf7/1XtzcRTU25cx9TsSFHi?=
 =?us-ascii?Q?srdX4SWJ19TVbRMmcUM4JX4raWlu3N5aIsuxwoal6FERqVmlsMI2VyIkhRDs?=
 =?us-ascii?Q?r0Gxxd3ppynGCDCuSG6EyEnjiwaybdrlQNTdtvY3HlOwD3zWO/kJC1KlRa3U?=
 =?us-ascii?Q?WUlIOWBftor1wZeLjno91VNNDHY6c+d2fOVLshMKibT8FCucWcYwLBtfE3qO?=
 =?us-ascii?Q?FN0esnj1ueEAl+YGXwinkYRndi8fnMpzedkqMTfhSDH9EF6O8wSDJuQVeG65?=
 =?us-ascii?Q?PUB5n8XWISmEskK+PzTlm8CYua5HbnW4iEn15ysf23vz7+ZDv/8Z9yvksfn2?=
 =?us-ascii?Q?M/pHwmiwiaUbmpgR/DNGnPxZHAO2oRflU21IJSt0WOKMBag5KkG3wfxPjId/?=
 =?us-ascii?Q?eIIugx1koYjf6qYG5lGP7a/PUPBsqueQ6DzmGP+n2yD8nBVC0ZTtVaaxoAJ9?=
 =?us-ascii?Q?qvNkC7sB+/pWE2fceAu8AUqTgdI6434mRx8F/cLo8iG1RdVMTcFmf/RmZDjc?=
 =?us-ascii?Q?+9QlSBkScMCVJaMdR9ekUokFZkhmPKnDgcJ/Mu82oqhDhatzKqv0OJ67JduT?=
 =?us-ascii?Q?MQbB5qeeBArg8BoOxgZ1A0fXSr0X1rI2JrXqW2AE3SiwyIFcb1h4m0+lJWcY?=
 =?us-ascii?Q?lXymybyuLze0pSO7aUCDVnWTS1QpZoYdVWabsdTmkZzlbMEkYMd6oIL4DoYn?=
 =?us-ascii?Q?/GuuhQdw7O06e8Aywn3xp+lWSmcaIaznWjLcH2SEXa9E6arlLaIaIZptQDYp?=
 =?us-ascii?Q?A48XPLqtr/EnrvWfI8RGYPgDINtIScsaohm4FhY4WnrrZSrkhdzz7JwHPddv?=
 =?us-ascii?Q?As22NAr38ePkkv1Vp9U/bcoTXrNh4ErZi3LXTVp/sjV5alKBiK1dqSvHKITe?=
 =?us-ascii?Q?j844q+jxtUk0HcYEdgONA5dyP7yvg21xaqauzZuHleRqrCCVdVJ8GrN5hv+K?=
 =?us-ascii?Q?9c7JqsPltLKb745v0+oO/6HQnMnL0mh0TWQEEyTSfgnud+MmxEjY1QeSH0M6?=
 =?us-ascii?Q?ic5qsRIhN1jXePyTMmOPEO4Gma3ZwPNOcdHz/3zgLD4BD4f8Skt/+gwPioCa?=
 =?us-ascii?Q?yUEtUHivP3bQdppx13Fznx5apyj2HYbEntNnEOIglTjkIXPZhnIfWWyuMw4R?=
 =?us-ascii?Q?7WP4CaiOBTtuWRFjA5fTE+rwgulM/CLhWXeyy0YkamsfRGMzDFKjcyUKCUes?=
 =?us-ascii?Q?qGqY9Wkh4t0ctce+GFpgNtz+ruQ5A64uoXXaWf7ydzHXwp/ypCY/o/4dfANI?=
 =?us-ascii?Q?jGTV9rVipNZQfM0OM9rmjV71Ey0szfQFNComsjsJke7lx99fqhsRFrHGqnO1?=
 =?us-ascii?Q?diojJckbSYVjRREAxYmBTVs657IDQBcZCPKSKnBKDuDfWip7zTF0zDlijJhU?=
 =?us-ascii?Q?3woRYUmbgZAn5Q8HUXKi3vczDHJaN1FpLmQRE9zu0+4wD0P+tKnxbnhK635Y?=
 =?us-ascii?Q?Lhf1mV4QD3E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IOyDZ9hX1k72RJCU94kUX3RAQzpHy0JwVipV1ubw2qHFMK4awHH24LTMGNA+?=
 =?us-ascii?Q?LWV/nYkfJQW+V7Ydx0RkC8NJkPmFl0khpp8MbKdJ2T0jvuo5feeGc5T/HGR7?=
 =?us-ascii?Q?I1yzyluZK2w0jXMWZ0ievDximC+K3F728ppODT8Nt1d+drl0zytLWldYHjZt?=
 =?us-ascii?Q?F1oTJiSimKm0ch0rGTBzcFfR9lXVlaNsYe89tYjrZHY8El/j80MpbB3r60Fv?=
 =?us-ascii?Q?DqRuJT7kw0kEp+Qxaed5ZcsF7Gku0k2/uzkj4nFZs9MHzlCONmrvneDDEm31?=
 =?us-ascii?Q?WiBf+HnW4zudf0LNTPlHNyfHGeIitkhZnXO1dFQkrICHwG/sYVZCLEZXtJYJ?=
 =?us-ascii?Q?xYreGE1wJ9BHSJF+eOeEtpQkEXht0dJdlHeX92XBSiZ6aDE/9zhYg7bld3pg?=
 =?us-ascii?Q?eeQKMFjAbyGzw9XXcG9pfm5gB/KQrRZicJVBzLyZwPLgKTjU9qRy3PfraJPX?=
 =?us-ascii?Q?VQcB+umIut/UUEYyUZiiLC56Irh+FcKEYfsbD3lBCV2++SE5iDa90C/Ahh5C?=
 =?us-ascii?Q?I4FwYLs02VYJ94E9L4OfHyvzJ3DY6owKAllhYudCeIqovV1hzSWUSBM4OAxi?=
 =?us-ascii?Q?5DLFJmtmY3+umM9XR3OptxQSIXDVhUfddRkCOFBYs0ZCZNyh6YEmCDIfgn4y?=
 =?us-ascii?Q?lEv04bnsl+FG62Lf1VZwBkytNB9hYQFfxCC+b5f4Q1D2CE8cORS+kfVvCcx5?=
 =?us-ascii?Q?FH6KPkIcChN2Kmc7WPCyxrIMbijwSCSZ+CRGU7qSstjPS8SEyZUVcKOY/ydv?=
 =?us-ascii?Q?eiNJyFr7yxanw7iHjZjQFh5Jt6m3wDnVew3FFstJXT507/xgmrhBxCxBWx++?=
 =?us-ascii?Q?PeqGicUye3Wvno91HvpGTLf+DbuYMz1uSsygr8glEZgVMI6ln2okdB+nyBU7?=
 =?us-ascii?Q?l1qctXiLBWLx71CaqFWIDJv6ti0EUgSjVfN8+/N80LfUyW/VuPwdTr9l2sF/?=
 =?us-ascii?Q?pUwx/sJLFKuaXFkNwH2uLZtRxqfUvmAclmYMnHC78wT5Rxyroz2QzmqTotKQ?=
 =?us-ascii?Q?pr2zC1GHJDBOtcasFcgYSLcL8F11Dm+Ve16ZDcxvftdjvUo1jrvXP5yIdgK8?=
 =?us-ascii?Q?ypzWtbSR3P5wuKbbdA9BLHEwIpLfmSvfRxyZLbH1rbb7FmazDsWOrjIuX8y5?=
 =?us-ascii?Q?vfvN4omB3bq4/kM0+DizvDcVccLPsHtZvmhuaCWo6pqKpEj52iU65yv05NI4?=
 =?us-ascii?Q?Tb9zPSWCwODooVgG/GMoHRSKpvaolgJ0crFxfKN6SApCmREc5X74k7XI+CGi?=
 =?us-ascii?Q?TboUW4xm7KezYS4VYA5o97/Sis09UDd0zO5M8qJl9jAleDx7YOpchjdzmmzh?=
 =?us-ascii?Q?N1b9BPNlftgjScaDfln26mqgHce3LkO9RBLq3bIeOuEh+E5Kn08FOAfS29HJ?=
 =?us-ascii?Q?xzKSKUe2oOYoyO8+T680V97cvPr2XQd0Ete4FQ+h40J+5Eg1l4+SAI3Gt14g?=
 =?us-ascii?Q?AC+GLz6V11FcJsKooRmVVrbxtAZDsstgsrQt+Ke6eDGUCplY5fzgZiRHvJEM?=
 =?us-ascii?Q?JYn8yYvUsh/XMjIHlTiplp992XrWdnywjx3M+cYw67PWk8/J5FULWpA+OLUB?=
 =?us-ascii?Q?MbsFF3XjEf7xzeWSplr5prL86G9nwkEu5LPOMDhS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d814fbb8-2022-4a52-cb70-08de1495aaf4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2025 13:43:39.1607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w7FNUEHnEh6XZFJhi3Y3sJyWQtgwoKYiaIOcCidrmdUns+DXXW0P+nOoaxSV7SgggR9yRodS3OficXf/UTHMwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6145
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   8979fee435bfd762771c71f3cf99f6f279038337
commit: 54dba9d5ae94c7df8662b6b3a09471beb342aecc [1/1] selftests/mm: build with -O2
:::::: branch date: 3 days ago
:::::: commit date: 8 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251026/202510261419.U7q1YjTa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261419.U7q1YjTa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510261419.U7q1YjTa-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   mremap_test.c: In function 'run_mremap_test_case.isra':
>> mremap_test.c:387:45: warning: 'dest_preamble_addr' may be used uninitialized [-Wmaybe-uninitialized]
     387 |         void *addr, *src_addr, *dest_addr, *dest_preamble_addr;
         |                                             ^~~~~~~~~~~~~~~~~~
--
   uffd-unit-tests.c: In function 'uffd_move_test_common.isra':
>> uffd-unit-tests.c:1194:26: warning: 'orig_area_src' may be used uninitialized [-Wmaybe-uninitialized]
    1194 |                 area_src = orig_area_src;
         |                 ~~~~~~~~~^~~~~~~~~~~~~~~
   uffd-unit-tests.c:1125:15: note: 'orig_area_src' was declared here
    1125 |         char *orig_area_src, *orig_area_dst;
         |               ^~~~~~~~~~~~~
>> uffd-unit-tests.c:1195:26: warning: 'orig_area_dst' may be used uninitialized [-Wmaybe-uninitialized]
    1195 |                 area_dst = orig_area_dst;
         |                 ~~~~~~~~~^~~~~~~~~~~~~~~
   uffd-unit-tests.c:1125:31: note: 'orig_area_dst' was declared here
    1125 |         char *orig_area_src, *orig_area_dst;
         |                               ^~~~~~~~~~~~~
--
   ksm_tests.c: In function 'main':
>> ksm_tests.c:947:16: warning: 'ret' may be used uninitialized [-Wmaybe-uninitialized]
     947 |         return ret;
         |                ^~~
   ksm_tests.c:779:13: note: 'ret' was declared here
     779 |         int ret, opt;
         |             ^~~
--
   soft-dirty.c: In function 'test_mprotect':
>> soft-dirty.c:177:17: warning: 'test_fd' may be used uninitialized [-Wmaybe-uninitialized]
     177 |                 close(test_fd);
         |                 ^~~~~~~~~~~~~~
   soft-dirty.c:131:13: note: 'test_fd' was declared here
     131 |         int test_fd;
         |             ^~~~~~~
--
   pkey_sighandler_tests.c: In function 'thread_segv_with_pkey0_disabled':
>> pkey_sighandler_tests.c:119:9: warning: array subscript 0 is outside array bounds of 'int[0]' [-Warray-bounds=]
     119 |         *(int *) (0x1) = 1;
         |         ^~~~~~~~~~~~~~
   cc1: note: source object is likely at address zero
   In function 'thread_segv_maperr_ptr',
       inlined from 'test_sigsegv_handler_with_different_pkey_for_stack' at pkey_sighandler_tests.c:288:3:
   pkey_sighandler_tests.c:148:14: warning: array subscript 0 is outside array bounds of 'int[0]' [-Warray-bounds=]
     148 |         *bad = 1;
         |         ~~~~~^~~
   In function 'test_sigsegv_handler_with_different_pkey_for_stack':
   cc1: note: source object is likely at address zero
--
   write_to_hugetlbfs.c: In function 'main':
>> write_to_hugetlbfs.c:92:25: warning: 'strncpy' specified bound 256 equals destination size [-Wstringop-truncation]
      92 |                         strncpy(path, optarg, sizeof(path));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

