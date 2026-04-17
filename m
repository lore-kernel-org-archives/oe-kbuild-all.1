Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C61713DBA0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 00:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776385969; cv=fail; b=Aes3chY5skhr7HyG/3XmfYj2NI5ohV7Md1bpHX0VmlsWhmas+VvTMZkwL1lXQaNz7LgwX8hTIymklV6RdABaf3rGwlTP+bcbOsbbGITfetN7LMmADhMQ/jh54AA3FoGgAAFqbnbcH5MbPF4gLwc4an+f30PtWQaMfuy2Bnc7AWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776385969; c=relaxed/simple;
	bh=8CDhGp9ij5485HYwn8u8KgZbDzsdpHBpuO+3AWnczF8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=iFpZAAvh4UVR98QZsMAyG2GapEl02YMdFCuCC0itDbrHG5Mcj87CStMe7TEuaE0azhc8W8496163ZaTgBMXthusbp51RUxKTWxsc8XyIJFPiAVUfZIEs9eypbbShBGNsIIb9vkYQCkIq+kxuwAKbDVpySCJVPs5AAUidc1hgbEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQUWuriD; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQUWuriD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776385968; x=1807921968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8CDhGp9ij5485HYwn8u8KgZbDzsdpHBpuO+3AWnczF8=;
  b=WQUWuriDcVSf9Vx9H9GgK8oG9OHXebJIZ5cwKKI5Kd1J9qbyUXqMw8CE
   Rt2mmO9wQkIhSU+KXjAscJen3mfSDl2d1qwqyxeteHreVEGqTdMPYIU1M
   BVhWPWU+kk+z9fIEP7IYeEhvmA7Qv0Sp9P52I5P5pSV9lQg6E2Y5uecnz
   eoGz/TiGwW32Q4XEqU8r+BxvuALJ3ibmfm4kO+I1X+t8DNdIqlnwhESuo
   tAbiyR12mAjhktZwvzo2F0b7zBqfnQZKl6gU6J+aXdFl5KnKtSKTPs0jq
   KS0sjsu6rdZlrM7nXBGARCIj9O0gNLryaLW655xStnB3pd0l3JiPmXnHs
   Q==;
X-CSE-ConnectionGUID: hNGBDh+/TUGmOV3gGwB2ow==
X-CSE-MsgGUID: 9KfL/IX6T5qhv1lFQ14ebQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="88474567"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="88474567"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 17:32:48 -0700
X-CSE-ConnectionGUID: 4QHvZXITQLu7eUSNVSyG0Q==
X-CSE-MsgGUID: Th2C3W5eTIysfyCNhmKiDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="235848126"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 17:32:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 17:32:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 17:32:47 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 17:32:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpGka1KatipdeoeWWsSMNdLPJOjlGGUZNqStKafJZryh/7DkUs6ZgxrJFTRaDxVKmXGD88KGC1tswL/tzA21+VhIkxQcOJm+ac9xriyb40cfRSnSWjmUcl5Gq5Rqo92rqfbxpT99HSwsO99VD9hUIGunsFCCPsBVRKC2yo/pC5RH+CQJipfseZOqaWth02NqcujTAjElQYSTNNL2P7GuLn60vmxJ/vLtXo3JX9DRpOCdMI3qyPGr1wCGP79NfN+Jf5JOUbbNmb4zkKsdWokuukYaM/FKp/tKMnre2gbcAThzCBwQvPBmUF4XCaVPh+dDnFIQuf+3+WvYk+GwUipsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KFTrASNTd1wj6ZDkMVlRdFskaXtk9qiZzpKb+kIAbU=;
 b=GkRszLpr6FXTMTrB3QJIu8ETdRWGqqy9G2DjOuU8qHWkEQEeDqPpK/xifwcsC2aOrxttMzzStPx2isdqLkvJb1ogli2QIv+Sp1JQbq4c4Oq1SUFtZmI1vVKHK9e42WYrbbihNCJCTsilCDjI4TY8hlTkUMRGMbbSMVOjXFPnlXsn4ebqyysuhLfXFNXe1ACIMnfJc1umJ1+v4weo7TbU8BSHpCDDEKV9c3zO1xPSamJYaEEQObruwkULLej/YMBoJVDbWlxFcbchXniFdHo1cPuNyF3zw7GQtZeHZTekv3BLndbpGSkK32bdCABF060f0IxE6onJqMMa9EJcx4EAEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 00:32:36 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 00:32:36 +0000
Date: Fri, 17 Apr 2026 08:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: Steffen Eiden <seiden@linux.ibm.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [kvms390:sae-part1 4/27] checkpatch: WARNING:BLOCK_COMMENT_STYLE:
 Block comments should align the * on each line
Message-ID: <aeF/nGbAYuJL6jbz@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|SA1PR11MB8427:EE_
X-MS-Office365-Filtering-Correlation-Id: f132c168-d4d9-49b5-c485-08de9c18d2ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: x+pwFEZHlD41g2cRi4I9GxIVS2Mg/KZ79jJpbN4ai4ILG8Jx/nTVQ42f0LwX9da67+VZSj5sfFwkYqOjKvH+1Er8TWUljWNVZ/BYQFlTEUigxCsacaPC7G7dvtRxLCGzBzlI2vXQ623HQ5sJVKxPcGQd0XwJM/cdNSWbTTQqLdAU6O9PGGJ2jb1Bge02VWSl4sXsj/7zHAXGNaue/zxtd0i2wRYmQpNYjPr7E7I4MbFPM+eWWgRNNrgT3fHvmoROZCmYXDErZ8TkuNhxNM7459odjqHLmsEj2koIBgvm4pEB/TVT8nLfE+CsRYinRwZtwuXKqOTrVOKYIvOuKufPmVBw0QHo0v4BZyMNKAbHcrRyoasaq/R5AgsSXoE5tyZpqLSYVVZOvp2PqB8Ye0srL6DL9i3JeV+LH7HE1j1/rK/EW3yoMSVufRcogVtarcHwMl7FFXKFi3s1Q6NINN1bgJFMnApZnlT6665VM2au47/ChCVrfHxEWBxGwJ0y5fSWM8NLuriPG6nbgagRHyDh1tenC0JpYpitBtM+dN6f+65s1VRL5QgKQU85b1irnXI+CDKzAsaWlEMx+y+PvjvoH0SqBsis8MdV6dttTs2zoNlY1LI6Z7rYwIncS2Itz+tRVps4iRfUkznYDGE7ZNOGRpzeFMFRE1trfcHJFS2CZKZYftwfG/dU1vdNxYKqjkFi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mqp5I6J5VMre2mpYZX0wXNd5iAR3kUlkjU6nWpyRNvZdKMrvxkCKPAYS5Lja?=
 =?us-ascii?Q?6Ie5kHcbfZtrix+gFjhNf9x08ZpykWGsQ5zd1KbKtGj1ksEICkK6jxRLIInN?=
 =?us-ascii?Q?qSTzShs5xFaLgrzeogt2g8Y2KImCHdUeAUAzRaWkCk0z2qf5yHCjqLoFVahS?=
 =?us-ascii?Q?cM7iTAbWw5zFclnLPNuazz/QqD9HD32rpt7+49NJekWKzpLwTK6fMMFNz+Ci?=
 =?us-ascii?Q?yXpumEVh/LrzcEYGYQIG3ENTt++Vhn+VUYyMHsdKNPJ67THjhB4TxHsrndfQ?=
 =?us-ascii?Q?/uBqV4Mz7p+O0nli1tJ4WqV/ZYdV42mAozK5aEQooHIAaPy5ffD41/HZ7yY9?=
 =?us-ascii?Q?keTmDe3mnHcsZC8njhfXKvwEWw3NecfbdynP8XgqRal/geU7zy9TTzTpULzF?=
 =?us-ascii?Q?uNPggs5Y5vO96XsscJimixSr5fJ1dywaorn3PxucMCtGbEdX7YxN80wZo7tG?=
 =?us-ascii?Q?PFkbr3hz6q+fKGZYSB1/JCFYLQFtCn2Hg0pGn7UIqfp5YIygfvDSIoXbSKyn?=
 =?us-ascii?Q?pR2YGb2NW8edk6aBA6hWfsh3bNuNVDna9100bUA1+/j6SqUrXVJeSs+Q9rLg?=
 =?us-ascii?Q?sLg9YDM3BDhn6wcsAlzcilI4/NHF2lVM8qDoAWitZqXoe94oWJ0gn8XNoc4J?=
 =?us-ascii?Q?QFGIoMgxGBmvt1zvkwKrkZ1ZoiY/+0qcc/aGFpvYvx/6BBzLXXeKIHA0s1Lt?=
 =?us-ascii?Q?UHK2Z6mKs6iSHHa2pQQOI7ftILQcvhHl5+PkgqwOCvDbPFtrAG5k+ec3L5sF?=
 =?us-ascii?Q?LRQ67eUU+o5twBLQ0j75XZWo/PNnga1HG2W6yvFgc0QnMwdG0HAlKU4qKv83?=
 =?us-ascii?Q?CNrZ4dLKePoSPQUpZqqruEBrkUmzxtjJKhDscP3MPrA3dunaiLyOjFns+eiT?=
 =?us-ascii?Q?A39JXRxU0EKCPZZL1DuRFNAFPNzg1cZcxzW2jk5qJUXFKc9TYi1VtvWTsJ5X?=
 =?us-ascii?Q?/YHnFmczndEQATYitlpP745ekl/gr//R/E4203HtVBjJQVorXtsPTrVnhyez?=
 =?us-ascii?Q?I/EEsQVP3ygQf2T8NHlx0rTDkI3M7XvExfABvn9Cfk5XpLhhHwy35BCmjuy6?=
 =?us-ascii?Q?wTdaCcdZ7ywTJLMxxj64YR6ALkr9PT8DNxu30Krehwdt+crfzNWTSqUnYzHi?=
 =?us-ascii?Q?kLUTOpwteF17mOHfm7fzUXrnov5RHLyIUpQChQwNzwwAv6ijYboQFR3BsYEa?=
 =?us-ascii?Q?U1A+xdMWa3uRLt0N2+47cdc8O59vZqqbwyBFv1x2Nr06t57LfJrqbp50EYoB?=
 =?us-ascii?Q?MSNwjJ5DqZw3HbnmJfdW6srO8JhrcZ5gEHt8Q7b1d82V75B7tzRO22TDGgro?=
 =?us-ascii?Q?aXydVzQltCrvf2xHp04ZuDmC0Rm8a0jhOV2U6NmkE1TLzU8b/Nu+WST8+Q12?=
 =?us-ascii?Q?eYsbNch8Lyj6MX+UUGMRidvgIDhJz76cYMgMduEPJzSyBT8hTlqgi2zSb7EO?=
 =?us-ascii?Q?5xbnvi8FHkd91qvP7oVcEZf/qVw0ZuTkdaU6XT9J5s57O1oUthK4OP1QqJ9Z?=
 =?us-ascii?Q?aFXEz5Q1sYsVELh1L8A51WKM0TjjRDFvFwJjhPC/KB3hkpqp1SYPRx6RRzBi?=
 =?us-ascii?Q?MvLeRuroyhA1tUVmjJqt6AmS6YpbljqQM1+7PIWvCc93CYjiJBILAKptjRxH?=
 =?us-ascii?Q?cnFPcC0TZG4UNh6Gqq4KF6olHA3T9nXkP3zARgMVv+Qppey+mkhJzmjcEm6s?=
 =?us-ascii?Q?LBKR1TAFq6VG2olK/fLOVDNGEfwQSZ3BUUU5V6stEgSPAMqxDSEfXvaZDA/a?=
 =?us-ascii?Q?NtYSE9PAOQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: A8lFxl/DqJ285fu8IAABYooQCYl4OTQY3OE8fgSqcmoSs1tvp4UPpefEhqVpz0IOfaj9EZQXW1ajqxTnHAmMHZdohsZFuY17JxeOHJQnmOrDlZQwPhKnFO9Sy8hUMhO4+AHFZrs66bg376/EI1cXduURI3QDsyCfkUPRCTTLz6l0NVM7V9FVFsmXk7jo/dJUQTNZ0LWKBMtdw61kzQmtWQWsliHBN3pGzlVP9fhf/2XA3H9xZxKZSujphtXcsnel2NAd0wrCYlfKE9hIjoSDI8twcG/3aEhf7V9U2EGKfmfd5ZAz3yndFJjOu2i6//sB1sRygIsYfyxdM8Hp5l8MhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f132c168-d4d9-49b5-c485-08de9c18d2ec
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 00:32:36.6013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evvND9SFOd9GL29ugx/FZBAqHsF/VZy388r6AOZIHvOgbJmqK+AKnAczDDIer9zQ1KJVFGvdLTsZSUEj0sEeaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8427
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git sae-part1
head:   c8ef958593be02ec09131a1f5e2744a98b6c01a1
commit: 20bb0172aa62c38d868d0e61f3bb57d225697efa [4/27] arm64: Provide arm64 UAPI for other host architectures
reproduce: (https://download.01.org/0day-ci/archive/20260417/202604170128.01CfV10E-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1476: FILE: include/uapi/linux/kvm-generic.h:1299:
+/* Available with KVM_CAP_TSC_CONTROL for a vCPU, or with
+*  KVM_CAP_VM_TSC_CONTROL to set defaults for a VM */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

