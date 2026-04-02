Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4634427C162
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Apr 2026 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775114718; cv=fail; b=hixRYI6mfF637GdpaqEtdp+DDauoTfb/g1XK1C+Et9q1B30AKQmuH+HrdFld+KkB9CwsCn+ct6Q2q4bcn55ItAr7MkanGpVFlK+DV6wLHxDZJcIpe7AUXsQw2HfPUXA5u4C8EuCRYtm5L6sbE5DeVLEsaCZmi1yLYd9hjh1ssOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775114718; c=relaxed/simple;
	bh=pP6cpdTG4ASUCkzfFl3tK5CWEL6P9DIbv0nw0vHdM+w=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=f4GKL7B9zK5nBg23dcUtZKdxOhxDF1hrTbCyHNsrcbyZuesvX+0u41XIzyUbA6zOPd5uS8Ou1a641TRV98S34WLpJ3jI3Ewosn2EnE3H6OzVJrvn/f/HDOIwQ39788HICF3VrCotAaG4oqumPexW4l6vEV3EFNc6q8I9QHKgDO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZ3vpSvn; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZ3vpSvn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775114717; x=1806650717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pP6cpdTG4ASUCkzfFl3tK5CWEL6P9DIbv0nw0vHdM+w=;
  b=NZ3vpSvnvnGV5hKNPDZ5lVgx/ZjwoNXFg6qpA+GTsp6A/EHanfESEVA/
   BiiQ2yVh4sMbtc/CC99kMPA60D51ukcgP5ICXvY6vmeisYqiEgxCLb803
   z3Uvi9H5kvosxju7V/AtpjgcvPPtjwEkFSVY9i3Trvi8X7AV5yYLEBD47
   uOmw06O/+mDYJA6CYraz60PYfTRKmGzpZy18vm++pqR794gZmP8/1SzWw
   uE0ZlyRrV12zgBSxx+lMb+qN8PuEsRO3uBBiFVFc3yNLR2tw80xcMpSsw
   JLr2jH4S/9tQLc9tsw7s1T1RzigUv5GSP4uLFZtezKElzlzyZs+NpRIxy
   g==;
X-CSE-ConnectionGUID: 1t9JQtpRQW+wBBvbl64Qvw==
X-CSE-MsgGUID: SaF1FL31SRiU0UB8xY6bEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="79775072"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="79775072"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 00:25:17 -0700
X-CSE-ConnectionGUID: 1z8mmevdQNa5sTEqxq6Jjw==
X-CSE-MsgGUID: nV+FZb55QBq4iz8Xyjv+qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="231307198"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 00:25:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 00:25:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 00:25:16 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 00:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqgYM+ItUh0Jd2NjJPzWZc1cmRTAQuY9BTJU6RWAYoWNN2hg8h5W/6h6kVv+KiK5TC4OGQpuZtEoK0fR7bOSv6olgbgnidqbEFixWU6ebZxQB9plRbHP11Ka4iF/PzNhryBPUa4Edw+ty1zvF6RM5Ln4/ULKxYz9tz7Qhw2Mn4hTdQHFGLViJb8JNJ/BvBkk5LhoDg1YbFA7XxaY4wPCvhvRmhmhDuHLP7h+IErARJ5WAEKIcbKnH02bSLTR+bPz8cl3dGWDMpHfLQ95PcHeJPowDFerfN+FqN3KaYMqH8NzfO0kENSoCxBYvYx41Tjm/ScbGMUAdE0KJ5922BJpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MTgqbClwAGHrnp5RE/5vLqqdHsH8srN00a/xJwxaU9k=;
 b=hBEU0SCr7Tk/d67KllPt5p34osr2wKO3NfyzM/F+L1o1f126Oa/OBm0DIq/vR3zBdDK+ri6MCC2FumEsZ/jyfM/7WTCKpQMKrf/3YGgLjtOp9cfF9XPnM+58YoDqgVgv0mg7UkwtWMUSNgJj6aMpDJgbFE7CBMV868jID0mOMHD1KxBkacMROhI+7bh+5AAdcb/TNj/2N2Gz2h1wY+fKyPJyorlCMQog4lGvFTukfcpM0PhZgnyjGaLBWBharWYDV3knGcB0MpNko2Vr2KythVPv+DIcti3AOzPk35llIvIYtrayD1mo7fhvwKsRZajOeiFqRQi9FcGsZeLEl0ns8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by MN2PR11MB4632.namprd11.prod.outlook.com (2603:10b6:208:24f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 2 Apr
 2026 07:25:13 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 07:25:13 +0000
Date: Thu, 2 Apr 2026 15:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [mic:next 4/19] audit.h:354:42: warning: format '%llx' expects
 argument of type 'long long unsigned int', but argument 4 has type '__u64'
 {aka 'long unsigned int'}
Message-ID: <ac4Z0Qlw43ZGGJCt@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To DM6PR11MB2810.namprd11.prod.outlook.com (2603:10b6:5:ce::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|MN2PR11MB4632:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b01f535-ca9b-4b2f-b3b6-08de9088fae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: T0peRP5QOMcRzc0d7zVaoc/9Dk+XJtpScf1zRso6KpOuiBB4TgjtUH4ni4emMQdSp7igIzoiO7BtfpErC8Qfy2l5D6phMxgO9oSboCvOu3drWQXDvOP2HaBuFbTbtO5neXPguHSoeA/sQQIYY8DzvDRlW0uu5ETvejXLiyldY8ICqTLAjOS4wXYfwtg/Zdwl4VzQL2FTf577CxhI9/hW+0SthI7AGsM4PyETFtuiwW5zLHAPGNuAI6ZliGTeS6t8YyPYAmV2Tb040hWqU1AIdVEUabFemZi6ipAQCT/JMqRcUPXjqEz2cnTjcIgeo6n5q5eCjxL7QNj7MwmLyz1uapLUzlBirXlbbpDkLiOSr8h26RyInnPYYJOe6PXH1iFiE6XD4OPCAnbsQ1I4/cQGIs6NCsh9qyz3H/MDDW9ORI3E1wbyKygaCB179DH2gnW3dKNaltNjStT3BdwN4x0AX7pJtDgiwOxCBmWzZL0eMk8msCLQbqx8jMq8EXxwg/IiyDTr1ENLuIsWd9Z9Hxwu+ZYYtQrHd9evCQTAmE+ML3IpMTPtcss09cnsoFvwt0H9UqFI6bkNUdog+34Hi24jgaGOt0MFCGmMUFay2VVX3ZyO87NMUgZWlQGEnZVx+4iCp5G8qbBFvBo8C8Z0bp1ZG4Ox9dtpGoCKAoWqhobnmNql0khdoSE2uKuTn4uOT2fT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BtT5U9V4qb+2ljeSF/PB3tvfI0oD7BxkR6jouEsBIPi4Ln12ntzzZ/HC8ieK?=
 =?us-ascii?Q?T1HRJg0fOzgbHbzqJc5uPnMiv9MSuJojbMS1Y04gvT51EBZVhmD4fXeIrAuF?=
 =?us-ascii?Q?aCdXIscVVUbp4UjbJMCa0QurZ2Kqmrp6cQT/Z8940DftpkgUenC0siH8+VKH?=
 =?us-ascii?Q?iJoInaE/FIANv0QWFiv36jnO8C391xVvzhnINjY2kT7xW+7PDKMTI2QqQR/r?=
 =?us-ascii?Q?p7jxcaGoIfKkhtNtxjnxEkUmT/em/3eiw98hsiWkUAmjFg44qxTdgDpBEfI0?=
 =?us-ascii?Q?SR+rBmv5jxzJGUWKnGzuprV6sMhKsG8ZQCGTbreShKq4ivFCSrPfqwe+QbeF?=
 =?us-ascii?Q?KLFYNmy2ZRTRvVM3ye6XvAqGuKvsVlMYdLX4E/Ch//xANkpbbNyRrwyyFvUU?=
 =?us-ascii?Q?R1AHWeyVqVrQ0n6C9Qgoj9+PCKGh8tHnnBH2qRQ2zKkgF9WOA5N8fZrkGfMS?=
 =?us-ascii?Q?n90KUIOWtTetL8q9FeiMCO3KWS0ANZVeXLZO+mSRY0GzaX/jozyk0FLFYN49?=
 =?us-ascii?Q?38LNeWAZRFkxyKC9vka11D4HJ1SZ1fpmo+a8e+Gdt9IM8zdpcCdbAZQOq4Y4?=
 =?us-ascii?Q?oV3DmuqjpuJJlej1Goay5j6R59bHdDTlPckrAxrdb2pgG8SikhTVx3RKT8O7?=
 =?us-ascii?Q?rEH31MG7yP/awhEpX2o+jJmbQy3pMF8JQH3ka0Z6hMMJq/4OfGMz8gH98xj3?=
 =?us-ascii?Q?1hoj6jj1MhwGBFto3VlAD7AGGT3vknYUKyCtYC0WYLPlCKCzjE5dQYky5vAo?=
 =?us-ascii?Q?iD6TblIjb/sZPxoMvt5bNNOao2ULe7wJe0hnvNJ8irLE/UlnXv5/GLUMpwWM?=
 =?us-ascii?Q?Eerwflr1urrbUtpxn5DSH4elwrqyUVNdDYbn6jGRiVR6jBTRyDepoJ2sH/Fs?=
 =?us-ascii?Q?MqolyADgTE4TuoU9jUDE2B0pm8LhmcijptmCkTiXTIo6DtkgCZdy5SGr7DDt?=
 =?us-ascii?Q?yUOTXNQ6F7B+QqbNd1Yt/zW1M8YI9v1Iy6bmWMIo8RTGHNDtGpItxWHzd8bm?=
 =?us-ascii?Q?x+YaIuxpGjUVp4TjIs9s0PYXlH5cTJ77nZGNL+1+F7rTo4bBKG6OF4JY297/?=
 =?us-ascii?Q?H63yJCoVzBUTqOdghTt3kroOo7yvEd2sbmsTYY9SP0NVrTTxLDxPerCY3Kgf?=
 =?us-ascii?Q?Rh+kdEBM9AKnyM8MpmUnOJlqpw0fGTkyVNzAjY636JdRiow2ln/zuWEOvrr0?=
 =?us-ascii?Q?vdqCvz/irIlgCd0DsOi5rIxd95797NVnioxSt62X7h71i1wxVl5K9VwdAahD?=
 =?us-ascii?Q?NqPW6R59NQiK74b2DG+h9aESw5MNrkGAGFAx3FPN3oSAdB843JdLzNRRdLUJ?=
 =?us-ascii?Q?htLlY3CpqOz4KC5GtpenAZkm8VpR9u6n1nSuk4Pk6r2CbtMaieK3vvUTnY9q?=
 =?us-ascii?Q?qM4/e5s+rtzKp96rBSkJKLymQC0zBqBxp8XjRp0RBIiWh6ntqclXxRVOMs6f?=
 =?us-ascii?Q?R18o+8KHVOCXPgVrAaK06APf2K5byiNZ7SVCCyaCrx+U/hSCWCZW8NRk1fw8?=
 =?us-ascii?Q?Qhk0OwCXAtJ0DAMUSfNrMe4ebq/SqH1LB0KBr8sNg9vOtyI1IRRARGjDi2f9?=
 =?us-ascii?Q?SikAejHPIyMlELCVL4xlrG0EM1yeBO13A/lxYpFjebJIiXrh2nHJLfQjVfev?=
 =?us-ascii?Q?JDCUYcO/DEMRN/lWhd/v68JdEuGZcPge6AF/pFPGyEXBnxqKyzyO2JgTqBdt?=
 =?us-ascii?Q?kKisM9KHv35N3CKdfi5yXacvN28W1WFasWR1Ta1HVMMFwIF39HMQIRx0qW2p?=
 =?us-ascii?Q?rQ2aYiDurg=3D=3D?=
X-Exchange-RoutingPolicyChecked: T3xLxBITLz67DjRKdUVYSTpYOyRS0+v0V9pDC3LBPiEbQKNFbfoGX4DcrBm7Evg4wUrXzQfcFZz5NnmR8FWM9a/fgJlASgWecF4+psnW3RZdkVnHDmWDcWjYKgf0Umz3eloVrO+RmLfFCFxCa8uEymSHEAclegJ4/ZZ6cWFRvMFH2lPQ38mrBNEIRNn379mzK0d7vLHnn1sn2ESZ6Tas7Y5uPggxsSWdXM4i7cJITxgoGeguGKjx/2FJRpSW3/MKxFK/ztmEhghvGKH3rUiVWCsc9uxgXcvCSZQlcRV+/e+AjwmFc8MzGA8RVxN/vtSN6fzbacnqwUqQZ6bzcPv9HA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b01f535-ca9b-4b2f-b3b6-08de9088fae9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2810.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 07:25:13.7727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Ag6irmFg274z2qSE61LgIUTVC8KCVDn910xMbx7EJDWkjT4QAYaw7+tBxATiUza3TZWp2JqBn/iYHdzVROGTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4632
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mic/linux.git next
head:   e64b5bb393de35f8a63351bf96f8e4bb1975f5cc
commit: 608d0288d7b32882578cf4d686ab64873c9a1a52 [4/19] selftests/landlock: Skip stale records in audit_match_record()
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260402/202604020206.62zgOTeP-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604020206.62zgOTeP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604020206.62zgOTeP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs_test.c:44:
   audit.h: In function 'matches_log_domain_deallocated':
>> audit.h:354:42: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     354 |                                          log_template_with_id,
         |                                          ^~~~~~~~~~~~~~~~~~~~
     355 |                                          expected_domain_id, num_denials);
         |                                          ~~~~~~~~~~~~~~~~~~
         |                                          |
         |                                          __u64 {aka long unsigned int}
   /usr/lib/gcc-cross/powerpc64-linux-gnu/14/../../../../powerpc64-linux-gnu/bin/ld: cannot find -lcap: No such file or directory
   collect2: error: ld returned 1 exit status
--
   In file included from audit_test.c:21:
   audit.h: In function 'matches_log_domain_deallocated':
>> audit.h:354:42: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     354 |                                          log_template_with_id,
         |                                          ^~~~~~~~~~~~~~~~~~~~
     355 |                                          expected_domain_id, num_denials);
         |                                          ~~~~~~~~~~~~~~~~~~
         |                                          |
         |                                          __u64 {aka long unsigned int}
   In file included from common.h:20,
                    from audit_test.c:22:
   audit_test.c: In function 'audit_layers':
   tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h:116:40: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   audit_test.c:155:25: note: in expansion of macro 'TH_LOG'
     155 |                         TH_LOG("Failed to match domain %llx (#%d)",
         |                         ^~~~~~
   /usr/lib/gcc-cross/powerpc64-linux-gnu/14/../../../../powerpc64-linux-gnu/bin/ld: cannot find -lcap: No such file or directory
   collect2: error: ld returned 1 exit status
--
   In file included from net_test.c:23:
   audit.h: In function 'matches_log_domain_deallocated':
>> audit.h:354:42: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 4 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     354 |                                          log_template_with_id,
         |                                          ^~~~~~~~~~~~~~~~~~~~
     355 |                                          expected_domain_id, num_denials);
         |                                          ~~~~~~~~~~~~~~~~~~
         |                                          |
         |                                          __u64 {aka long unsigned int}
   In file included from common.h:20,
                    from net_test.c:24:
   net_test.c: In function 'mini_network_access_rights':
   tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h:116:40: warning: format '%llx' expects argument of type 'long long unsigned int', but argument 6 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     116 |                 fprintf(TH_LOG_STREAM, "# %s:%d:%s:" fmt "\n", \
         |                                        ^~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/testing/selftests/kselftest_harness.h:111:17: note: in expansion of macro '__TH_LOG'
     111 |                 __TH_LOG(fmt, ##__VA_ARGS__); \
         |                 ^~~~~~~~
   net_test.c:1358:25: note: in expansion of macro 'TH_LOG'
    1358 |                         TH_LOG("Failed to add rule with access 0x%llx: %s",
         |                         ^~~~~~
   /usr/lib/gcc-cross/powerpc64-linux-gnu/14/../../../../powerpc64-linux-gnu/bin/ld: cannot find -lcap: No such file or directory
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

