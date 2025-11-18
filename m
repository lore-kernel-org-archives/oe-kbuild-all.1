Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBA5329C60
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 03:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763436060; cv=fail; b=ixaizx2DYUgvt713LX10K/QY9/WgfvgRkJzrMebq69DnQeCUPicm3kQfIcEhaM/vv/EzPZaFstftjqq93c2cYR7bPBXippmfVoe/tJS+4O8SoQew5+lZqrinieA0Zs5BUnSY7MsVi9whvMSHtVF460Mu1XTAOpHymagf7MRMrmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763436060; c=relaxed/simple;
	bh=Hgh2e6rFQrVLeP8rpTH0uZ+JdOtlR0mroNEPkC9FKVY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=WvCFQjTxq332w6ANtd5RM7u4AnlsWduyZZQJgfsFhchNnhMlVqqfiwEBbw47GGbkj1ukGVN+4xs80bqGismBlQnx79xUUilnra7nCXmKSBuEskmoJt77zaPcTZXk/dZ+HkXqMASM55xX99SYqcTURDRDx1JFHaRR9TQrx+rlpLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akzyDyzd; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akzyDyzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763436058; x=1794972058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hgh2e6rFQrVLeP8rpTH0uZ+JdOtlR0mroNEPkC9FKVY=;
  b=akzyDyzdnDz0ZFbsTGa/Gku+yQ7im64qsN9kZMhQgS+yMSyTjGcYsAjB
   6bXodAHyBRbIX3z9TN78hz8Y/onCsiy05A8/rB4lBisDSXL5xZ51Sr//1
   OjsVKOJRbVxeRQEtUzMnFB/Hw6exhEOxn5By2LtMEXnZLry939XxWNVNP
   zjcy/LQUIZNg10MCd7IE0XmwtyWqb4le354C9VPNIX2JgQt7lLNRY/4+E
   1wvgf0w4hicdOo2EGxEozQdoNfE1iqrUhjyo2Ari7gHdkDR6q3jIqM70g
   FPY9nvN4DMxMDGKTrb9ktxTHKMZSWMgy+q4/HLkQtj2wl25jVgAUEtV5q
   w==;
X-CSE-ConnectionGUID: 1LsNrQuEQ92Tk3AQxPcFRg==
X-CSE-MsgGUID: eEADwfGWTK6ajLeUQG23dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="64450786"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="64450786"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 19:20:55 -0800
X-CSE-ConnectionGUID: mynZJzfNTcmoBLI8U1/Wkw==
X-CSE-MsgGUID: 8kBh49p3SrKvveKiQ+37gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="190432411"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 19:20:53 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 19:20:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 19:20:52 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 19:20:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mp5UhSMUlHCYAAhsrNKTRYhRtnvI0b1Y/pJvavGL3th7NZYkkaS7bSuq62Mba25ewok4VU36pmS+eRfrT+R79wRAusBLQmBoEPt9+StpNcIwZ6nFXLAnf8gu9m+oNC1bWCcuY2B72ZDbYFqyF1ExxM6HoeqIYJA577UgesL9WHWWHDYxtK8v9apoQHIPo+7zd+EgR0YyJtgInCL8M5Yb6lUkRLxjPU5pQbCWJGGxLJEa095Pa/9FbN7/2kuQLkszLVaIdWU/OqQzyFdsbkI+AHAjVOFXRkYgfppvxbhwXRzNGxbm16qNuECmxZcj14EJEcVjNpMGckQuO6LHAn3pQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsQ4ABZwu7Q68lZDeTS1JfPk7xILBxH/fGlNEAGASq0=;
 b=kd4daBmUGL5GA2tP47I+E/jYo/jkIf6cnOheAej3SGQm9a3s+FXSrVug9p4VWjMM/uyNOLw5e9BsQ5RGWc5T4IhO9ZuOZJCXs9cmMnv0IoeZWbDOn039NsXDD5+skmsebnpNEpycCvisNx4GIhLRHMaOvVspXOY+KsXSlMPG+NYfuHNvZ2giqImAPsBdKQ78DyWgY0HhdykO4kabtDIY5YvmytVrF0XNhlTLeRN3lFwFj/spy+SDvUBUpGHS4+cZmXySm/i8fUhwlVyy1jJkHwcCDHQ/v8ohDQGwYuvq+K+Ud+5hsdCCCAKpVHSDqvqgtmTH6ea59oNd7jlWxQ0b7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by CH0PR11MB5250.namprd11.prod.outlook.com (2603:10b6:610:e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Tue, 18 Nov
 2025 03:20:45 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Tue, 18 Nov 2025
 03:20:45 +0000
Date: Tue, 18 Nov 2025 11:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: Chang Junzheng <guagua210311@outlook.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [linux-review:Chang-Junzheng/staging-greybus-audio_manager_module-make-envp-array-static-const/20251114-094319
 1/1] checkpatch: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email
 address mismatch: 'From: Chang Junzheng <guagua210311@outlook.com>' !=
 'Signed-off-by: Chang Junzheng <guagua210311@qq.com>'
Message-ID: <aRvmA7qSpJE6kQ+Q@rli9-mobl>
Content-Type: multipart/mixed; boundary="9D5fa1OhdFG+VnWC"
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
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|CH0PR11MB5250:EE_
X-MS-Office365-Filtering-Correlation-Id: f4ec7255-2314-4dab-14fe-08de2651766c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|4013099003|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8SavkqT+o1gca/kbrnt6Sa5KtWtJLqHMDAhojPtcbcQWVfBVPMHuBdCfVD+s?=
 =?us-ascii?Q?2C5tiyDBO0EgllojWeS+aBIRsmybtKIZHOUlmmuul+Hdiu4YHei/7grqUwH9?=
 =?us-ascii?Q?JOHEn0Wb0z2dNg3bFaSJYGiGKh9WwNQ2s3MK3l7OoZ2/jOzd8ehzhvF2VuMX?=
 =?us-ascii?Q?OBOMldSoFyAx9RtGBzJv6/VEP2is/dbFqbxSk43Qn6iCiD69WH/sOh2GifJV?=
 =?us-ascii?Q?BoRRztT6AIR/BcDNMMqAK6LRZEUrvNPlMzlFnJ9NftZlKNTozgJSQHJtpKtS?=
 =?us-ascii?Q?c+MZw0sbYg6pg66rrcH1aACi8e8aAUygeqQGCeF5M3lEJ2k5VLxQXuB0vYhQ?=
 =?us-ascii?Q?QFIC19UMGjIdxp2CuDrh2YpUpLyniw/Ur1G/e802sWbNN1EKvED2lprlNVc4?=
 =?us-ascii?Q?B+aU46Qid7ErZcN3Wt0KDYrmpmD6mctuflTV7k2pan/E1KBlRH0yi/mHzfSy?=
 =?us-ascii?Q?OhcA6xaP6PfI6UdPKIGOLiZ3jCyrShcLHZV2CJmbSBwKXoFrEtsUH9ts12ob?=
 =?us-ascii?Q?b+YaU2VAlkAmq5Zjd8BaZXUJ3PkjRMTrD/OLYYhEmwdlWQ+nFAW8ycX2j8At?=
 =?us-ascii?Q?r0+rKF7pxm6aZEb/3wp9mDaT23lwDu8X1+Ydd6gvMc0GjJk3idF+S5cStR4B?=
 =?us-ascii?Q?sWszWU7M5ZhhEVCXFKtjEbGe786QGWXGHIYLVXq/C+ZqD0kuiXcnYYnfjtIM?=
 =?us-ascii?Q?gJv0jwBiIvS5AaEz4lrqapjsXpgMXsP6HJLcBo0OPoLfCFHDQsqFIFq9FdbQ?=
 =?us-ascii?Q?i9emdaPlS9p9tQL6ce/oS3YYmtGHfqCQgmb3cYAf/F+NxT9xg8CIm0+QHk6q?=
 =?us-ascii?Q?nhZaniS2nKJQPx/XVlBfm43qIImnAlVmG6a2Jcv9DZB5b5iHGfZgD7SdMIjK?=
 =?us-ascii?Q?ClByjOfQL8md82avouVy28mdA+2me+dHKd8UuVfvmcVfNGqGqOou5f/n/v/K?=
 =?us-ascii?Q?ODAwZCQYhswwtUUsvvMhm30dZrQxVsL/pztPDKPaeOmZvEWPCK5yJqk+kp0B?=
 =?us-ascii?Q?zW0BEdxozpLsc3k9gjTDK4kZ+QaXjxUVvjEBAPDilkpdjCI/awHDK2ecAhzI?=
 =?us-ascii?Q?Lr3UpFmvEXZBJR1hGLCMkSaZaJRdY9AAFO0OTEi7zb9jfafnv9DLpZUg+ZoR?=
 =?us-ascii?Q?2nbrPmSfwdjLcrN3fEVZgfsjcPbGe0XQ1uvr/Jrg2FLVr3WCXurgEKK6JD0u?=
 =?us-ascii?Q?u2SRNSyuwqCMgMrXz4XCHH6/r+kx4IwcYe3Rqp/g9X7DZYwHF5OwkYS9nUgE?=
 =?us-ascii?Q?h0rfO99GQMqv+Boj/rLsTVuAmd+Y90hdAGyNFm6vGMkucANzK1Si9UHkPvxe?=
 =?us-ascii?Q?jIRvG14SE1AfwgyYorSIGTY4SXSACR92amTYa8nQsPT2R5KRpJlfAckzQFri?=
 =?us-ascii?Q?DT43u866TMShATTh/y+I3yoeRjfHYx9bsJ7XZvw3PJYHMceTsoTUjiuU4vbP?=
 =?us-ascii?Q?uUl2Tg87Fdq7wAj77lcDFFwRTtK71XB5vuKBnbIj01F+i8erpf0P9A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(4013099003)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0kWlbAcveIyitJRBGCeVYmKydbE+7SSgSdR8KG782Ftx7WMktJ2Bvgtb3j+N?=
 =?us-ascii?Q?MVjLwI9LQ0vlnWBEqpma6VGOT5zOyX19m0/ub0+PcBeuiH0SYUJvlQu6okEC?=
 =?us-ascii?Q?bsVJjIDduaALhW409zljIAWE/hVb792BlUXmmjRHe9W8sVr5y/eJ34tZ9FTZ?=
 =?us-ascii?Q?2sna5rVG5YrLl73oEd2BXLrj+naBWCbchX74yyZvz77ZDuYYBbl1KoGrjXYC?=
 =?us-ascii?Q?AWn+7CtohIun/pJ/aAzrEO7Sq+sUEWk8F5nCGElL/B/Q8iNLv9rnB/nOjtGv?=
 =?us-ascii?Q?AT9CTXnUZIHtUyIwV2MdWh3YDHfz0emvlrs0kfXXpdsOq6/f7U91Sd5lgS55?=
 =?us-ascii?Q?LBkhR7rJJhyW4eqGGjfKDfRu2bE73V0WkfGFIllG+ui2wvQYEoFCmIeEYWLD?=
 =?us-ascii?Q?0TwoluB2Cf+rjpJiNYYsAobCKPFWpsYaoo/odpEMHfR6BbBhaeyrJQIjWQKb?=
 =?us-ascii?Q?jyeGb/IfHOH2FfHuFEmCGbc5ejO1+epUJfzsNYNzAOG65EiYaHDJaw/n6jCQ?=
 =?us-ascii?Q?5hE/wx8lo8UzIntqvFc069qSqPEYZhFBSwiDqzXEpgI9OvMLeKRkmGd0oD5c?=
 =?us-ascii?Q?sDcjmm+8ZgjeErH0u5aJocsm3Jj7JhUgFRKPEZsJNaHQbysDbrf93OOTFaCF?=
 =?us-ascii?Q?WXoIe8Z0uOc0aWBuKCHMnAcskMH0q/BPHHcpp35ivfuVvgDBFsGMqd5xg4ZK?=
 =?us-ascii?Q?As9VT09WSyZNSPqjZ7skR+zBAKkbIbLI58oynNprfNY2knHK3Mi2D5LibmHB?=
 =?us-ascii?Q?YoWsMKhINj/QPxpRaZtH7hIvZlWKwhq4rHRVKlbO/gY10Gm33aEkBtlfz1rp?=
 =?us-ascii?Q?v0AUhqWrMy7TdWn0zbuXXnjz6lX8dHPDPYDeptq+Gg/BD7bc5nvtAflD9Kz5?=
 =?us-ascii?Q?pku0eCVB6hHZE+WLZZmrmCLCyBfXQ+kwxEccmFu4RIAjxSVgGcFzmuT7/np2?=
 =?us-ascii?Q?lMpYzCJwBNWMpJ0Gdrv9g7/zoc20I6Jt/MI2sTTXIvamyWWPUFW5HIdP7Dv+?=
 =?us-ascii?Q?2vM6Z7BmSXsQp/7pz9C3BZJ02Pvdml0e7XgkIRzvx6lauBLXrQ3BKM5aonMK?=
 =?us-ascii?Q?+jK5ztJZz4IXSfIk84hUpBoiVsMvZGnzILjdRAN6LJPlvV31Nz1xoeGLargX?=
 =?us-ascii?Q?0tjyuRbwHqI+RCZpmRvz1TYg+ITvwjl+liu9Gnsb2F9a+OQpSKsT3K7q+sJG?=
 =?us-ascii?Q?NWKLbGhUfk7PkH8v433Udcm1FEJZK28yqVE/nMgEZuTwuq8LbWY0LBwAn9ud?=
 =?us-ascii?Q?WNYfw9ytZO12OgctYrIy4ahVsobSP7MezdQ2DjXmPMaX2g75gwQpfHxsYDM8?=
 =?us-ascii?Q?qpRQOj2c+wen1oPZObZdg1BR3wuyuwpIw04enRLQvCKCEpQLDaDCt1GR+Paa?=
 =?us-ascii?Q?78L0jOFzdk0Fo3hB2PkY91bLECSc5A8Gv12DulkAUIsLd+rzdHd7y5udKtGc?=
 =?us-ascii?Q?jomlfnO0bCHcrGm7kgH10Cjxzj5WIT3J5KD2eV6bnYfLK1kEvI5u7oH2oRDX?=
 =?us-ascii?Q?MFAcgHgjLQldW+C5npmsNHtUAev6l/GVhjKA6unyXSuOyUN25uKZgj27c3qb?=
 =?us-ascii?Q?JYACV7XmaRQ6mAE2hRHzR1wKmaQhSy+JbhoFBLwoNbyB+jzmMvyzLkicia5x?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4ec7255-2314-4dab-14fe-08de2651766c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 03:20:45.5127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xm0hagR1czXMBxLYtCq91Vu0HT50TjHREceL08ePlSuFhZXaxox9KwcTLK0OrV3wC0QlVV2fKAJRSvak9UqcLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5250
X-OriginatorOrg: intel.com

--9D5fa1OhdFG+VnWC
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Chang-Junzheng/staging-greybus-audio_manager_module-make-envp-array-static-const/20251114-094319
head:   0e0a4291b18003fc019223cf42d638ed4257460f
commit: 0e0a4291b18003fc019223cf42d638ed4257460f [1/1] staging: greybus: audio_manager_module: make envp array static const
reproduce: (attached as reproduce)

# many are suggestions rather than must-fix

WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Chang Junzheng <guagua210311@outlook.com>' != 'Signed-off-by: Chang Junzheng <guagua210311@qq.com>'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--9D5fa1OhdFG+VnWC
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce:
        scripts/checkpatch.pl -q --strict --no-summary --show-types -g 0e0a4291b18003fc019223cf42d638ed4257460f

--9D5fa1OhdFG+VnWC--
