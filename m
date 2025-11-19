Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181D32DE711
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 10:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763549340; cv=fail; b=q140iGXjVVbrG2r/9HoMCGft7wz+TPX3pmHoZz9Q8UxdHasL86TcLlwWCKW3Ekbvg5Y66BTE7caYIiSgBZ+j/4quJaapCdnbiLB0DFUNXt/gkXOH69dEDvxYJjTROK5vrTjmwBghGinGSJvtVXxGASGaygllg2HQ61/Ka0pSrJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763549340; c=relaxed/simple;
	bh=o8SOSls26FBAAj7nt10tSTTrT39weaAArJMPNdB2RAw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=h3yTUlKOhyq9cRgCiVYihgkUAkZw6FFu1j2X9OAwk/woKx9YCZzwWIKwwyz+1OMs1/6NWX5BrgKyy74I8lmQIdMbaedyi2y84yU1GhMuJwwWvTijKi7A2ugXikpc/6bjGbfRjZfUTWhJDhofhA8x6Ti0mrAz5Wj78j4P4fBLRHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDmpsVwd; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDmpsVwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763549338; x=1795085338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o8SOSls26FBAAj7nt10tSTTrT39weaAArJMPNdB2RAw=;
  b=IDmpsVwdGTIpEEiy/kS1oTqWlB9800sj/NufAlEIxsnNpoBboz36QyWK
   bUIan+3Febqos7ByUmaUFnzgzM1gd2qoAC2I2jke1O7ptJkfUHwrU3OR4
   cmtFmOtj6bTylNZMJb5Y+HFZyh5CTyZboCyFyiS84NKUsGB+Ol7ohhTjc
   NfK8djJmexQCaYMKZ5nIYMB6Ae6ScZnoQ+kPdYswzbHLECF0AhNZyO3er
   YXpysbGXByutxZYHgyAayNwEB+N1Er2HjTAEhcOs2y5tC2UR2jyXZJt25
   YdCbZKD+wHAOQw9s4g6uj11EE9fCzRcUvJcPdfWE8lwd6ifWR+o20UKYo
   g==;
X-CSE-ConnectionGUID: dTaHPrDFQXec2x5q+7pUEA==
X-CSE-MsgGUID: QrvDXhyGQbC5uoxzM/wZfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76691416"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76691416"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 02:48:57 -0800
X-CSE-ConnectionGUID: 8Tss4agzSNiIhCLIukgh7A==
X-CSE-MsgGUID: /ZWuWfDHTfCAjrySx6qSow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190819701"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 02:48:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 02:48:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 02:48:56 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 02:48:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyZYMu12Boh7YTbLL/UnIC6mz+QRXTnXTcVy4E4HHz21kz63HYaUqtp+Uw6oEUP/D1mty09EbnchSTRxZ7I8phRYYQQsGTHRX3yIm2tVuPqcXFiUXC/cfxilSKE4tBMSg4aqlFpDY4AamlqG7G0UAArk5V6FxCLh9E79KULa+W20slbz6dlP/RC9CB9dwuQ4pPlbKQOeQ5+/oHbQ5curVFE+kTib3BVf0bCpoqDoqQVaZo/nfIjgo8cbvdBX7byPiAI8eNwlq3AJIqcQOfqhFphlKv8u96GhVGILwhTBVzb8V1yh9dcmJgsu+kFFJrRifl5f0Y60FUWW8KIv0PhfiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74wxVaiWNfYivPiAh+58YxhNC6ZfWo38BXKOTb+Bx+o=;
 b=pZfMARWJ0t7YGnlGyAAtDvoxb+YGMz7gwytmhbB3+yXcHRbqMcYPQfOgCM+Orvyf3KVr6ia55bZBxGowqU7b0NGoZeNFMs3dKGFrE1znFnYgKRBM93KpQe2r5rsWYWrbW1xfECHBDaq3zvXa+rpCdv1vGD0Yg8lMX3RdxdwTVs8U7MVdQQb0T7QWTwGsQsfmld0J8Mnh8A6cxbnxEs64Aj0YgBEz6S6uCPuffkas0iHRrmsUDBA+1kLvfneELLeerm5t0Fzl27yxNdvaKAld6TqQ/M5VS04heMTDQ8bQceGXHLeSOvGvZW6deB0lIqc2En+//EJWRLHFqVVtM9tZBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by DM4PR11MB7205.namprd11.prod.outlook.com (2603:10b6:8:113::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Wed, 19 Nov
 2025 10:48:53 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Wed, 19 Nov 2025
 10:48:53 +0000
Date: Wed, 19 Nov 2025 18:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jpoimboe:objtool-split-fix 3/3] kernel/rcu/rcutorture.o: error:
 objtool: rcu_torture_cleanup+0x5fd: sibling call from callable instruction
 with modified stack frame
Message-ID: <aR2gjonNqSIPTKS8@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|DM4PR11MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f3382f-f55d-4ba9-0c80-08de27593b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GRDRcXy7Sg1BqfMQXByL+9TosFPIhNuSBb0saPkMe8G1K6gkkChGyDqyUTp2?=
 =?us-ascii?Q?i+gLMfQC49lDlgZDOZq8rjZwcn2wS/UW96RqjQcvFfMK82tHEDWALG6Qyt08?=
 =?us-ascii?Q?dGF/MFCaHiT+b/TDg19a6QSMry2646CCweV6EZBQfPrx4LUdUND4IMU/sDWW?=
 =?us-ascii?Q?2sUuGtaSCDH+hj8qm5NS7lQ7a8vdEg+tAGLktDj9elDHbtQy3JpuyBqhs5PW?=
 =?us-ascii?Q?jsJmSorwjPQkYRArIHpw59s4erXfofEU1ZWbbbOz85oes/MRgCbVbMLPrcDU?=
 =?us-ascii?Q?WoxbqPt5R8iAWlLte33BiEAg3zYWLZoTRhho8foHHiKhO8yT3ZHh7UeY82hA?=
 =?us-ascii?Q?PPTjSDDJQPJTRb4mgYUFZ0phlEFQcgi9qP4oIYDW0XiH3Lfjh8PFk5XHz/sb?=
 =?us-ascii?Q?J6ky3DqL795Ez+RihzwoA1LRzP9nNHBkdUxPorF/sNQAiHYiP/I+8qi+avA2?=
 =?us-ascii?Q?wWEHthLBjFeOr3ud742pYRZ0Cat541HeGZYVCgEudbkbGBgdrGaaC7lJA5A3?=
 =?us-ascii?Q?6YqQ8REMtNhUxFgsjs0NSbR+o8X1Ejhz/gJt0RQ5VVYz1fQSlljutbcohtXI?=
 =?us-ascii?Q?RMFz5ugU61htKrr3TSDsqqgJ3zGC5DXDwS1Hx1+tGcX280A+RzhT7utR78gj?=
 =?us-ascii?Q?Oxhra/jmHZtaPCikg5oCNL7nH3SHZgH5tbiTa3qhD9YCPePw3d+dH40oCJun?=
 =?us-ascii?Q?Yik0FqidE8REi5DtoOC2YPeD7vC7P9FQtdmRMGXeubSSV0uul5+IU4I4BV70?=
 =?us-ascii?Q?VGjs995QeTd9ESVZaeJOfh8pNN6TaAy9kay82KKciAX2KWx9MWB1dO83d7cr?=
 =?us-ascii?Q?cfZH8bhJC0Gc07MLFVA2qHe9pcplsxk2nk+2FztOSZ2kg59CrKRiuh6dO3rs?=
 =?us-ascii?Q?oAhq/wnWbyqrjfuCSe8qnsxjG9TqTB/N0vwKmshwZ3jAbWaio0A2LwhXXgQY?=
 =?us-ascii?Q?VRD0cRC71evDS1/R0LsNngBU0RNcfjWYIRtaZ2JbBGNeY4CQhn96XKVMEiNG?=
 =?us-ascii?Q?xU8mQez+DG/YjvfDG2PN/Q8SQ8i6/sR0GRf8+n24iFj9Gygf5IfgXfBNaJO/?=
 =?us-ascii?Q?mRYidB63jmDXyN31tTbBhvu78/7wzcvri5dRWpMdFdDUHirAaGjXRfCqnnIS?=
 =?us-ascii?Q?DCLSITASjbjK0gdo4OiW8lO0jhx0YO6bQI0Z9qm4tMo4HVL9Mw2piF2isGYE?=
 =?us-ascii?Q?bnvl3xpw03m/4LlXsTprNx209jUFTWGdd/5C4LSsx3GokSmLFJ7zd2kQyaDc?=
 =?us-ascii?Q?j6WPjk7wgC20SMCXhcCR2cvKsAfnKDEJ+aooU7iGb1zZjgl8s+yXRPtwgGGn?=
 =?us-ascii?Q?cJkUP1aRXHsyzZPpAG1P+ZKzS+928dCiQpMozpLng/qnKLIESlpFglMNkdw0?=
 =?us-ascii?Q?trN+Pq5dGXThrkErTEtzCYgfirGJl31q30OLCMtis685l1roT3OYhBNudZsO?=
 =?us-ascii?Q?aiMlviLE62FKJKAnzlYTXLDJO+9nF4EpOlUPoruAfqqB9Ohq6wLuFA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HbnJR+vio960DSj4TbvQhFqy6QZ1n2UvKS0XSqdLTKLxv66ymmMOOzMguulk?=
 =?us-ascii?Q?SBwY46LPn8XzWh6riPjhlMpiMtI8ugWX7fvRqBlAW6Ewkrt6mLPX9k80nAHU?=
 =?us-ascii?Q?bdXrY3gcOSh03OWCij0db1Fh/SlmshQM1KNog7GZCB8aE3O8l+teOcJC+R1M?=
 =?us-ascii?Q?TuRQ8lcS4naKBruM17oVoBZlljpVWPnVFFTHYLAQF0Pn7P1DLGq+YwQjAKRr?=
 =?us-ascii?Q?AroiFmoBmQTyFJ1v4nKj3OMz99a2HcHHDsdqJc+7KaM2SFlblmpksLCWTRCy?=
 =?us-ascii?Q?cU+ikdmXFhZJhL7Wgk5f/+iLUexr0JlP3QLnp4t0icji3lOBvFbX1sBi82Jd?=
 =?us-ascii?Q?BjiTApleJjPy13q154hqBmzgJZrBNmQtzuc/fW9LyrSekrpvTQA1iFIE5kQ/?=
 =?us-ascii?Q?Wib6HF7FBzL11c4TWOwEiwssNhlk37nfWb/2+9Tzr+Shl9wzq75epSIYnYxL?=
 =?us-ascii?Q?ensZRdHSXOrD9pHPnKudy4DqMeVg1CHbH3d34lo3cbPvymGm+f8mJtIrX2tj?=
 =?us-ascii?Q?SZRaWaiNJIwBFdWohvXYVSG7u/IvNduUOHWzokUc636ExVW9cTGU7EhyYad8?=
 =?us-ascii?Q?L5IknbBpLgyBi4tVh+QIG28ejhIPUcWKiyQ30VbmsEojmLk0OyKG+3MhiSk4?=
 =?us-ascii?Q?XHsf8wiTuK3f9Z2jWud5VEFzk8uUlyeQQ5tuY/vyOU5nJ0QDR0LMZFR/fWFR?=
 =?us-ascii?Q?7OSpLPVB6Bc9wsfWyDZy548ckEn3NITxVdJgLrE1FqbjyQBvsmimTGRs9JaS?=
 =?us-ascii?Q?EsN4Wjmm043VcU7iD1QJI1w50U8XWVRjHo7HcnT4maIDMR7nf0hHBUH7Ty8V?=
 =?us-ascii?Q?smZEL1Is3JTWOZA9TPFqzHaP/mHba3qCPsjSoMviGIUXo6sSIPDkfYA1hEqM?=
 =?us-ascii?Q?kar4Qy1ERD3epHUCsU/mDrLVzYuQoJGJFDT/pO5Biq1jSIxknrelIkCXpuea?=
 =?us-ascii?Q?GH27znf6clOZvW/oUXBCod9B+U+qNbe9HBNU2EwJNNyp7grzf/bajK53sQxz?=
 =?us-ascii?Q?ZzjYuy+OeZaaFwa58L+WVLzREa8XPj9PTF8V+YY7Aby2PG1oRr+qaikW1ZA9?=
 =?us-ascii?Q?IRUy4MMAxXXDw8oVVl3XbUDrGRYfwzRibmMa0MBhR0haMUo5K5xyjqXZFIr2?=
 =?us-ascii?Q?gmlDN3AF6Ok7YL0p8WnZV61CaUwOVqZ7mZ+7WCxfhdOT1PQebUM6ZneKiBVk?=
 =?us-ascii?Q?o+tmo3+oXsDVYjk+2dIS29pnu+s6WmsQ7pp3BzjWRIsgLRREt1D1EjdxV0Bg?=
 =?us-ascii?Q?yvXrhj1M+T59qlub9OiP89t8z6RS7JlHAVA65CrMcbJdfd5eRKb3t6nuvyPR?=
 =?us-ascii?Q?HtMT/HIVL4Mo4+FlhozNM1oZ4wdCKxOZAKG6+cb/kBLNjJlKQveZG9WBbE5I?=
 =?us-ascii?Q?QvHyHnxGG4CeDJfaS+uiwfh9A2MXQb/brFja0oVZguwxZ3T0amsIiXmDn/P2?=
 =?us-ascii?Q?BOtzLDw+fPi5W0Z5yWGLkm+IhyBeQW5iMCzp2tIzG2k0LpvRcPH/KkQl3NY3?=
 =?us-ascii?Q?TClvfqi0hc/Bqc6aC4cPTCSnGJbx737tmu1hZZLyNtjto9TsaZ0KdPzFGSy1?=
 =?us-ascii?Q?e9JMP+qKiAnoBjQ3Ahxm8WjJZ+mWApdst4MeCTO6atyD322H7i5Mschfnu6P?=
 =?us-ascii?Q?4w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f3382f-f55d-4ba9-0c80-08de27593b45
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 10:48:53.4102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJpgITXpo6GdXU5kkYwyt1Cn3zbwwlA/RrPbJ8w/xH9ZRs9/10Xf2flbJVX3ngE1qnLPt4YXYBxBnGWmq9Oybw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7205
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-split-fix
head:   c1d09d3861a169dca34ea869269fd4957a8224aa
commit: c1d09d3861a169dca34ea869269fd4957a8224aa [3/3] Revert "objtool: Fix GCC 8 cold subfunction detection for aliased functions"
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-075-20251114 (https://download.01.org/0day-ci/archive/20251119/202511191353.2CpYl75R-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191353.2CpYl75R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511191353.2CpYl75R-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/rcutorture.o: error: objtool: rcu_torture_cleanup+0x5fd: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

