Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CBD26773C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 11:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764415205; cv=fail; b=ERxQgHdMmI/ox7P1d8OZtEB2AOEBEFuuEDTa0WKwmn5VcgIVP6SkGF+zsEJC4EbybllNzxzw8KoTFPJYqqnhUPiLooT30cVLmRVRURFpxOdreX2S+wmtyPb9aFDmWsUK3TPv1vmih8bPglVL51KtUXXpH7TgMdXU9ggBMs4PJbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764415205; c=relaxed/simple;
	bh=nJBpEXD2Dg/8FxHFIu1RlMtttHlAYQaUpnRIQU7SIAQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=oTrpiq7peqJRjvbmJzW/ZxN1IpSHMW8u7eUN0EpVSntQFxd4cj3AWH62gJJDgz6h0e58QGKdZvcX36BFmaOsJa8PFNNh+FuGy5B0oV5IqWc+81dhlbeh8MNDgN49o9RtDA5MXybCffeEfF68+YkH1luif2jM671QaslFSw0hTFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8+RuqWb; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8+RuqWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764415203; x=1795951203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nJBpEXD2Dg/8FxHFIu1RlMtttHlAYQaUpnRIQU7SIAQ=;
  b=P8+RuqWbchf1Od9EBgTLzeAVAXTxhadNv+zjUobWf1bDRFKy/rOIsQyp
   FqMx1kAbNim6bn5YvQQllnTiX5sIvfBzcq7iPfZIdT63HmyDOjw/BmIzX
   xoloBpRI5QrKUKVrZC0Qr49Hhqj3CTRf23XwryynPbEPskWgVr8zIUGhV
   O2neppBe9Vt4+5HEzGK75n+RR7cJQZiq/NPPqsWjv3z4zOkNX2qMA2i3E
   P/cts4acHfKXjqQ1infG+mdLy8sheCpLLrrMvdyDUvbO4bmCNRTZb6Stb
   TNQaE5qf1LHdgW73JfCF5kfezPuV/CWOOG5qRBlO2245HgTFnghkMDFNp
   Q==;
X-CSE-ConnectionGUID: 6eP9+ongT0+ZqOTELK5R1Q==
X-CSE-MsgGUID: yGDxUBwTRcaVuOOB2LBEvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77774066"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="77774066"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 03:20:03 -0800
X-CSE-ConnectionGUID: YY/5HQX8Tp28TWA3BiNuAQ==
X-CSE-MsgGUID: u+CPyeX6RTarr33coXQCJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="198577253"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 03:20:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 03:20:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 29 Nov 2025 03:20:02 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 03:20:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5Gm/Yw3j0K8xe2vDXtJXdU6Br7NOquG9nDQP44x45r3U/uEDUpF9qM4n+6/rXK+sMj3aIqlhnCNLcEeD/nfojPa36+Oe7KX4IT18xiUbsAMjwmd0dgsHpk/QMzVJty4wuJo0TALkAy+3Q9jOCdogewPIUJNLGNkkKPNogakQ2sDwtRkWviTj6Y1kBG/8jKEtG7ayJ3b/hKwK3ziLRntVeUeE9LTNptidkqYvrplVMQPX5WUTN5OqVXyaSISEDq4GrOrEcOWRl+rMhG2ovVgFkjX9b0jBBCSGFBIP8vPb2NpKaIyNaSj/ONs/A7PF5nGtgyyr3p4Irn6O3uzDp5AyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2l9NtOkMNq/B3PAz07hycoAKWpbFi7UReD+7ZGMvp4=;
 b=N5SYNHoNYgMtvHU4Z1T/EmMIegNh4kg8VGIEHbp76FgjiXX1Y1Qp4Y6BdH8Uc//i4q18LhzoppownJr3MYHzDsxPJrNFIM826/dfsbFnuoMzxN8SWf1kBmoIsWYecFtAEV1g+2bmjooJWUYtAyv14VYpKkwqRX70/nPQCDI+viuQClVkKlJ1nuckUp/1nm3Lnm2Iu7WFc86st32CSSrRgDjUyDwjhrQhAknR5NJZwy/ZYxB1kNT2WQXRUkTPuzrfHx4q2OCt+9hdkq4xNp5qmtScCi3HPf5WiJV6Fx6YXjjCfRe0ZHTTGom1XsdTU7ryhYMcKQ8B80LBVHrYCdgnLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 11:20:00 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 11:20:00 +0000
Date: Sat, 29 Nov 2025 19:19:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [akpm-mm:mm-hotfixes-unstable 47/47] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Koen Koning koen.koning@intel.com'
Message-ID: <aSrW178v0DlNmG9l@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SJ0PR11MB4894:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc15317-d8f1-441f-5962-08de2f393bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M3lbwm8BPBIE3QFuN82UV529ZJZQm7lj5RlgiA1VhoJLKJynbR2oTFDaQqxZ?=
 =?us-ascii?Q?P4i9IoybGs50UD4nm+JH4mb9eXQgI8L/nMhjZ5iQmT+CbGqAaXE3828CDnjf?=
 =?us-ascii?Q?hM0NVS4A9spph1zzGc4s8qT2w/XpaHyqZfzq2euFwdu9/FQG5C7glikxzGTL?=
 =?us-ascii?Q?4CIwXjT3hI81/7qCs//FFbB2eUFVhYAHasvE+G+EHinPEHNzn+YSpXBSSKUx?=
 =?us-ascii?Q?/6V567zd7wR8zarOj5AP9JnO4c3Bb9U3V9pA81y3AnscdoxcNFtpAM3RG6QZ?=
 =?us-ascii?Q?XMWoP07l/YGaWVC6MctWkjqaYrIe+ypeYR7sTNI44NF3nAF1RUdoXhic/fo0?=
 =?us-ascii?Q?/Kg7JvEgAxD1y0HeVOu1y95UgrtT/xDHVr9QuH1WQwfnqMyMPkI0fKja0GjE?=
 =?us-ascii?Q?Cyr+DgziODSZRpDDzcuJTkx62DeYo0qKVzMhliYWfdNfAMI5lH5bcsz5bL8G?=
 =?us-ascii?Q?ZpS/T1oVc2JJrSVKI/lQ6KNmb80AXnrzcDifPH+6W10kj18QecPpjEQpoZlS?=
 =?us-ascii?Q?9MuM/+TDfotleMB8xSxjlVw4unF9M4MOuTO/9nIZH7y5BT5kUeFTuvLSVxkE?=
 =?us-ascii?Q?3A6v3/9K4qRQxghASP1F+b+p+6H4Hd8a1fUDV0BLIEs5prD920aaiB8tbju9?=
 =?us-ascii?Q?QfEigcKaNfxdj4r/4ocHvRQk7dM4hsSd+Uze+IQNnerfFZXRTS0wkStMgkbi?=
 =?us-ascii?Q?vrGJ3M7wZuE0ls85iiX/rh0A0wsKl8jIU6Hbhdapz6/y6HnpwGdfFw4rqITa?=
 =?us-ascii?Q?7eZm14kOQUDzDgdYTfLJusPo2U183ueuIjXFpLF/GByWRs6FE6dq4ErNEZJa?=
 =?us-ascii?Q?PIP8sINf8QnC9t/aRzZasU87SOjZhYgW/anraR/xep+ljwbRNCUYbYOp+eBs?=
 =?us-ascii?Q?0PTL+DDZRC+j+VdBIXQpxoFxEm88v8ExtpER7N1ueNsiRQMpQQVwxQigdpWV?=
 =?us-ascii?Q?8q7yXbHKnFFf83cvGlcK467pPeTPSd9pVb0RuZbpSETdpurrrPJ5rYxeOatS?=
 =?us-ascii?Q?TXaScynZaZIMxbpYpLIJBBXVjpeyjtqvh4xscHzOsSLr9uVx6PaHeJh7MG7V?=
 =?us-ascii?Q?66hPJcqkqpbW/0CYkeoXsaB1n2YM5V6P1WBMF1+RpF9LRxiEjHuXQv2JOC9J?=
 =?us-ascii?Q?BXQL4OhjxLWI5ZhvOy7xKbF24ue3WwdFhrXN82A5cTeE8nydIe3FndLkivjc?=
 =?us-ascii?Q?TB9GHA3Bwrmz5MMZvxeLeUYVqJGIII0RtLCwMPLjGfVvbNJzqx79QSQPSUHz?=
 =?us-ascii?Q?ReAxKXWFCdk2jDZKwDs1fTZDgwQc/zkhc5O7aTRv2oZFtSAO0w1eYzZKNibG?=
 =?us-ascii?Q?8HC0SXJQe3EFKGEC+2NNHDXi20v4+qMHmK7Lssrl5O/MZKlAq51aYcVgawZ8?=
 =?us-ascii?Q?ANxpYjMX4ZqEu9C3CriaQG9/Q0qBrKOzyPl9Mr9CFw8TYcHG6IonC9UpJ/Li?=
 =?us-ascii?Q?98E9NKh/W65fUYPTXEqTUETW3Y1HCVwreeFKE2uWFqAVIKjioeNbHg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MZICLY7SHADY/EYoCh1fZhARgpdZj0jX8H8cJDJASVT97lf9mz/c7iDp+iCs?=
 =?us-ascii?Q?pADku9bV4UaiET6tg69Pn296verpLW98LMHjDdmVbPcJUUOPjR12KQTvhvqg?=
 =?us-ascii?Q?PrZ8vwE2cpTF57TSvPLUn1cvxlER2BGnkanm6RF+KsXDKNedCLd4ipMoNWUA?=
 =?us-ascii?Q?cG2SOz6S6E3Nl8DZz9kdryNy3Ld5XKdiK4wfy4nASlqDicODEww9FNprn6rO?=
 =?us-ascii?Q?e1QHrDK+7G47ctzfubVOiM+HCvhZY+gnmdXiW0vi+7IG4JWIu2LbYPaav2Rr?=
 =?us-ascii?Q?XwtiKMErik9iqwsGMTUxdzGITKSX08t0tDwH7K8mhHth3bQmlDGT3QRgGT/7?=
 =?us-ascii?Q?5/0y8SNbryfbKlYOPFStcOBcGapWTkmGmbxDyBExUqnJGbVrrHIDyzTmDfXB?=
 =?us-ascii?Q?axYqKypr94aqk73H46SAFbItBPqvXln0Vl/gFC8GmhoW3R4heMMJSbTY3iqn?=
 =?us-ascii?Q?fNfHBeG4hvn0aIKMAHj2ONM0K+8Lro+iKDLkneuvVWO6fyPI0rQW4QIJb2wp?=
 =?us-ascii?Q?c2WrMl5rg1n8ELFGmGm1vA2EYDkQyCsNzZhxl0OUgEScHdNtE+f/lraw/k/d?=
 =?us-ascii?Q?QSBaGVnI6e+R3jt/iv28giwx8gqbIMJn3xlnUtO4KMaIHMwRE+Rtw7CEbBFS?=
 =?us-ascii?Q?vAPaYe9r7oY37lS04hSU2ewScN6mP8y2AO8JH+acqyDZn+ijoJBwnpvpNAqO?=
 =?us-ascii?Q?57bp+gMW3O8Xxfj/URMKH0wP3CiD5bj5ul6UK0m/hgHYHz0nhw1VuEECQsPi?=
 =?us-ascii?Q?FM9oZQK+jMkTOxt+ZPd8K5MrnjtyA6nYvbZxFCIAGOEHSTuq7597yB8J4n7K?=
 =?us-ascii?Q?uT6hztQWhC1BmH38pHdK6S9pl+HhX0lSIjTjtuRBLkqV2jNuWbFolpCOXHRa?=
 =?us-ascii?Q?JW+IBhZmP19ZVAL+TyBRMPGtgE+JqW+ys8dAv6xHfnUfq0Ss3H6cbfSvG8gl?=
 =?us-ascii?Q?4oOkmwuYbDqiEBedEQM+Ape+a4w66PoDtf0kcumuMNPxEFMFHi+L7VzFoh2o?=
 =?us-ascii?Q?T+jLgF28gxrjLWCu55r2WDb/NEFOBAp1pVlu8/qYhmq+i17tksaF411OiLiy?=
 =?us-ascii?Q?iKnnp5f5lzPU6RLtP9s5LRd4fxjB3ZgE+1lP1H6+ka1ETo7fy9F7A28zRPDa?=
 =?us-ascii?Q?qdfMNAbhiXXrpBQKGMZfGPUidnFShHyNwqUHaIovClVipuIA4GLMxL+vCv+Q?=
 =?us-ascii?Q?T7Km7SJdfjUPT7MCLiAZCkcZP38lD161n8BBRnXioAcrDqVvl0/i5VgfMgQP?=
 =?us-ascii?Q?dvo0kZDlJYfMDwBWqkB35ak8ZUgnLp640pSLremSqQbvdQwccLtYB6PiUb4G?=
 =?us-ascii?Q?tZQ8sfXYHzFR/9fBiA+J5PLan1eddlnvFDDBeyIDFAWcR/+Ypmef+UM2fn4h?=
 =?us-ascii?Q?tniwYGLFSYeBbtev8JppKXT9ktGntw0+hvPETt8y5kXFV2sV6WEYutGloyFl?=
 =?us-ascii?Q?ywroAschXNJVeg6bj/vkWaraLh1bYBbygqbHzCaGJCrhQpfgxYQ9P8ZVfe2A?=
 =?us-ascii?Q?BXr/Omn7rjGnJmjVo0AMW0d8QVq3fbOh92fqBmsYcAiCx95iwCwbNIsHNXjH?=
 =?us-ascii?Q?nWGGv5dcIfJI2YtmmqeRXlRcnZ5Vg98oucAmOckZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc15317-d8f1-441f-5962-08de2f393bee
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2025 11:19:59.9652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +cRaU5UEN3H39x/IC8yKUe2lH1HWZhPA/D2kLQtsNVGJofbWBToMhRvszjGNMJEFnPye1svK9h3yhKQf9ecFZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4894
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-hotfixes-unstable
head:   74e4e99d88bfbd6b8d1dc8ba9da703bcefa9485a
commit: 74e4e99d88bfbd6b8d1dc8ba9da703bcefa9485a [47/47] idr: fix idr_alloc() returning an ID out of range
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511290532.H9DYSNnh-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Koen Koning koen.koning@intel.com'
#17: 
Reported-by: Koen Koning koen.koning@intel.com

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Peter Senna Tschudin peter.senna@linux.intel.com'
#18: 
Reported-by: Peter Senna Tschudin peter.senna@linux.intel.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

