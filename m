Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5C738E8C6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488443; cv=fail; b=t1GdUeyalYjgnNxUDBaaPjJ6WRC5hP9OhPMUxM4hdvmUS/2Cg2zFm4Cx9EakMq5eIlxXju9L9eUUPPNufaTTEpL4A/DZcqCFJQmkDPyPzm3O2s0bkl0P/2N0iGCw5R0BEwVdsDnxAzaqd+oKhBVXjsD+bcpMClxo2932MWlsBS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488443; c=relaxed/simple;
	bh=rLj0uuiZIN+oP4HUmlbgHZ8EuAHUjOwo7ZJ4u0AtY6g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ooqi3omZqxDCInL0ZGdePEvEr3qgcpNFKpnLJAa9uIEKDI1QYin9Pw5/N2GR1rWbqL/xSOwVKpJMYW21BU9kkL0qK08SngBUkxiYauD3HBaMmhF13WDY1JOvoiEBLmk0rDDGxvwHFWW0sczS2AP01VO3gUfg2CsN5SujHukUoGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9dcdoM8; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9dcdoM8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488443; x=1819024443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rLj0uuiZIN+oP4HUmlbgHZ8EuAHUjOwo7ZJ4u0AtY6g=;
  b=e9dcdoM8vG3EIrGrkqnygpIVNEyXPqUawjfQWwZh81lK1XEwxgw9QUWM
   Ha7812y1r/JCYHWUrXFHeAeZlSl4hZpNkg0+pGZ7VD/XXj58GU6cnkwGB
   gXaYeYL2MqrFn1SNxQ0C7GBPkPkV2NT7io8T+w+7P5QxNF9VU6hwHfqLC
   M8NLGOxp6iCdqcDX/ORM5MIBeG7N2PTC1pTs/jeRdyNXIH3euuq6EbVXR
   dmUrHPfLqPNE4l1lg8q2N5FXBCwYj4sMYpYfkB7ftcNp7qgRo9goQS4f1
   KZMkIc1YExPO4efxNPwTN8aJoWG3PSZiv/skJ8RyK1nrrg8HFFi+xJZ8A
   A==;
X-CSE-ConnectionGUID: xyQp95MKToWr8CWx+f7aEA==
X-CSE-MsgGUID: +ihXGwr7SA+TcwszNa7BmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87830954"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87830954"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:34:02 -0700
X-CSE-ConnectionGUID: cbZiC4qVSx2BGkXUiF9KUQ==
X-CSE-MsgGUID: BuOD9UsAS1CXRnGXjXVKXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="270574042"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:34:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:34:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:34:01 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:34:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ScLDpsYhAPSVIXhqt65xhD9dOpkM5F9citHwlb+HziR0c3rx/EAGGLe9vnQz7Q8ogsncaKYJJ9LHOgax4H2CvnPXY8gOoI+AGFg++60jP7PsWLCCNBwd5uVCZX7IA8d5nNWWe3M8Jv/P3zTzkqgS5IC6TFdxzTQ3QNYWxKkJqYtau81pcL57vzZzAVzbu6+J8akcwLR4/KrYBNzw/ph38wInwv2qcsuYn+X+PVb+DfwPsURfl0nt+fQzCuINPcK6L/oEwH7XiWcTgUiafO8YkiAjl81dN8MvKpwJzRyEg4kesrlos0RDpNHFOOC9uEJ+ORaDbAy6iaF5l2ABTGuwjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1hldVVt3xN+VMcCq+B4FDipE+1N/LWyAW51+b2FtQE=;
 b=XctrlTDtfPCQZ7J/1bU+V2PUpebGPKIRiEYGqmCpiXI7X2OTI+++DyNE8B/hg3gsQTvoMZLAMfvKEPCBYoTp1opgEqlCBXboGieyq6e1XGz8jFE+Vba/a34r23R6Ebtls2Co80klFFnP8GzeB3EqiAJiEbwAeAc4WHR3WTTvk4sr/ng5t8GIh7BpirWcFLMrZakUmpNRkVHu+RY/mWIMpBmOD8L+heDAEdFu4yyQeT1LmS3GNWl0wYy29/iRKdSD1rF78nZxQzSRdULolguADrIZJEQdeHYTwyKDYvItqPw6FKZLc+4Rb2Nh3wsD7+NFKLJ43dGKEJR71eIcaj2hjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:33:59 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:33:59 +0000
Date: Sun, 23 Aug 2026 20:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>
Subject: drivers/soc/qcom/smem_dramc.c:385 smem_dram_parse() warn: unsigned
 'ver' is never less than zero.
Message-ID: <202608221845.sqdVtIAW-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0043.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::11) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: de8d939c-41fc-41d6-8806-08df0112ce28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|6133799003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 5vH6X7opg8g9OnDbPxzlEB7/Xp9WH6Dv6Eq/0NtEhUn6/MhDKbDFwPCMedjBl9Mxli5NcxYzOjgYyjmCO3hVqjdX7rV/0iXVIlreFW6wIcFXLpl6bABNssoSBw0Sl5BeLq2Otl4pmGqMq2Bj9kQCcFJe16NZtGwiK4PvbjkEK4yvX/xpCRdeqHQKAvQe9ydyrPUafedHIJ7hEwfe07Xe9dMxH31v+Bjvhjf0vPiB3Vs/YdGazMRVOx+xvSRKyi+LV5UUTrgQ91gSCjIJmi118Jnc5n9zk2f6/XE84VhNQi1S4bPs7m3/6mf7dHC5xrSZlDuuqMZMLhsu5CPR9+lq+sBRNDpH6rPKqyYRNoqxQ7Vk23xqszKVCaxejHvbIWiKEfiJEvkK90zdaFrU5xYzVHqGg0NKKbacfNCBrduGsb5M4QSrI2gz45LZ62ggVkoM2R7QbNM1+k/FzecJN7nxIEHvW4LA2OHHuA95Hc+HHgJ9+aZSao/4ZJJkNEGzoyr2TZR6UmbzT1kD6HqGN1oZpwnftp0LejMPu4x4JOWF9e/Gn5DC8p79OvsN0JlflkhgKgF4MKUApBfinMDTnN8zotU+JTfcpEQnuCbD5IaBrWu2as2knXUk8zsWFbYCjjUUj1ArkYaF9PrfwShlMGBC7kzFtUYsHpUo4/KwEZFTdJs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(6133799003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fPmhUjReruLFjl4XQBi0k0SNzoEozlNeIvynfvnDt+4uoHpkT5Q8EXfzzWzE?=
 =?us-ascii?Q?4pTbJhbEas6uB66xQVAg8RmEz7HSMdD8TteF5YayupM+e/9hSQli+tSLIKLi?=
 =?us-ascii?Q?nBNSKFWvqDkt1STudaLpkA2MNYsI6GIITylvNAscGfH8TWGtZVG6tVPDLqqy?=
 =?us-ascii?Q?VE55ZTwTfhyK8eQ4sddXI1iidt2feRX8qDp8hK6Ve6XRJKmCA36U6y8+k0Ib?=
 =?us-ascii?Q?zfm3/ohz3WdEgesI/6Culx2WL9kpHRtELmnTl9CKvnzYK8UWUBKPutbVsUzg?=
 =?us-ascii?Q?fFEENIecoTkCqEcxray+G6QBur4eMDRYckdagIC4lnPbUrnaBtZNBmXDuhGv?=
 =?us-ascii?Q?rjqRZg0PuQdWwOl6nOvViVvTafRbjYHBA5wInr+5Nk1RshftIHVbvonFx5wT?=
 =?us-ascii?Q?1oy6ytZeaY9/S2zsiTsXU98HkBdm1R/0E1pE1ZTQCkaEYkvYCBEPEW7Ic0zW?=
 =?us-ascii?Q?NVbPdjaBstMg9AQuQ4Z6WaMFWEfh2WLkDE1RiBw0WUxlSZ2xzZFZlz1LJdmA?=
 =?us-ascii?Q?j30JlMRksBTlez+8rV7kXk3fAO4CI/EzmxdW8qiGTVQQGjw+MnTkmb46UN6x?=
 =?us-ascii?Q?yTCnkBHLIVtKw9p/+Q2Ozv3oqdFlDXYnMqma2V+2F5T7te2o7oTDBIUG8XXz?=
 =?us-ascii?Q?TG6ediQKq8tUWSUX13MCjiwv3I7/wW4rG8VsDKCk0MQJA0rRvmRFiDUE9iv3?=
 =?us-ascii?Q?B+O91MFPfoyflnpBS/sH8R7jbuDL7gkye+JCPURD871HJQwvUF5C1p7Xvvdb?=
 =?us-ascii?Q?SZ4jS7Z+SdYSxCKB36pPOwQS7em1cnVKwFEqBOjd26jKnmNqKBAGY2cSztX5?=
 =?us-ascii?Q?ipI+HXvOlaPLD5qTN+xBupN0EPFB5Nq2D9S63G5Bw/af0Hy32Ip3VKlrGnlJ?=
 =?us-ascii?Q?UW5Xnq0mbSu8cC7O1RDhPt7IcIQcUydZKzKvoqXANlNtTrQv8NGZmr300jKh?=
 =?us-ascii?Q?uiXFwEn/N/TJoihknlixxsrGeZ9crgrtTPkLe028gmCJwzT462Bbi4+DUmHv?=
 =?us-ascii?Q?rNuYun+UNs4JDq+1Tclu7BOxhPzmnIh8LcREcD6HMxA/4qymYTOO4sZIl8bX?=
 =?us-ascii?Q?Ty7UKHL8kyCeeFHxXKbOCtjvxPoveDM297s6wBkjJEW+SVoNNuGr0nH6021P?=
 =?us-ascii?Q?GqPRnIBQyVjc/a9cPgumL/TrYuBKHFvFzhOkmAWGNr5njUO7Ff/BmKes6e8M?=
 =?us-ascii?Q?mCpdq9HoyoofvUuyEMHpeRIoyIFOs7EgfBMjf4tB2AlKRH++FYBBbl5yx3m+?=
 =?us-ascii?Q?LOTAjHuH7p1WSKxm/oX7xiaIsrh/rXUzgLm0imA+xBLBN+pg2JrR6pPj+iGG?=
 =?us-ascii?Q?lmCeP/oty34smRvoxNK109nAcBiLg8tZbILQFwXAtD8TEZ2wAtay4iZ7hLxv?=
 =?us-ascii?Q?0h/ra7XxSqRTUdyxD+qYwZj3S0qvSdL2nC3eRazxNckjeT72/wLLxg6rcJpE?=
 =?us-ascii?Q?RlREM6GGvKvFR7rhq0L9e3gUW0PgKB9CRt/O9a2Kv+xwtceJg+/IJIv+O+Kr?=
 =?us-ascii?Q?WUA7v8codMX4vlp6R0zHQjvWt14HAy4OmHA24Tar/f7dhFoJapb9J3b8FvQo?=
 =?us-ascii?Q?AeROqZ8v9GohY3FSCLq9D1rQzw4wyX4BeY/QwKh0QXCzoRcaaaEHPHpKnQ5Y?=
 =?us-ascii?Q?H8UPUTRMr6TlH+JqNrQIHDZC3iJjTly9Jv/a99tJOlvMAtNBlR1l2212AAfZ?=
 =?us-ascii?Q?y1veEeaHvCtNUdwoaYpInQAIRTiBsCYl3bCbbDovLzDWV21UGxSs5pt2vBks?=
 =?us-ascii?Q?7gjK08JxKQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: M9E6Kyz3eD0kPZzGX+DOcFLiQNN5/7TLY+dA61sKB0Ya1Y4j7qgZ/bZ4I6yu6fn+I3BcQ6Hg+Nz8BqIMYv5guq8V8NnUKuDpaBaROeLhUFV9vz2jIExD9fd+NBlaAEWx9gQ8U6I7nYqlzL2MHeKxL46JixL56Cj3EEsTjF2V6b9NL0IykEc0karbf2BxLWcEzV6tGh4jl6DvSZEFq3fvoAYs8FgYRvSxhevC0clt13Re2EHQBVChIgCpREkHV3zcJb+ysBQ4dtQdxRyOiQ/mJ00zrOwUZvwnZm1nfIr27EfV6eNyCX4X+CN0+eIqgXFgmMj39EncG+FkOVUtO3gXyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: de8d939c-41fc-41d6-8806-08df0112ce28
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:33:59.2248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEiZChHLviiiCRDlH3MuS1cKHO0GlODrwaGXqqjcn3AAQv37GfvywYHwvEQdbjfAc7Wo+hYo7CAy48NVvp89yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26260251022fbc2f248a3d747a9b2b961b18d2d8
commit: 1d234eeafc56af8c9af6eee857f41a4310615e78 soc: qcom: smem: Expose DDR data from SMEM
date:   3 weeks ago
config: powerpc64-randconfig-r073-20260822 (https://download.01.org/0day-ci/archive/20260822/202608221845.sqdVtIAW-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1d234eeafc56 ("soc: qcom: smem: Expose DDR data from SMEM")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221845.sqdVtIAW-lkp@intel.com/

smatch warnings:
drivers/soc/qcom/smem_dramc.c:385 smem_dram_parse() warn: unsigned 'ver' is never less than zero.

vim +/ver +385 drivers/soc/qcom/smem_dramc.c

   370	
   371	struct dentry *smem_dram_parse(struct qcom_smem *smem, struct device *dev)
   372	{
   373		struct dentry *debugfs_dir;
   374		enum ddr_info_version ver;
   375		struct smem_dram *dram;
   376		size_t actual_size;
   377		void *data;
   378	
   379		/* No need to check qcom_smem_is_available(), this func is called by the SMEM driver */
   380		data = __qcom_smem_get(smem, QCOM_SMEM_HOST_ANY, SMEM_DDR_INFO_ID, &actual_size);
   381		if (IS_ERR_OR_NULL(data))
   382			return ERR_PTR(-ENODATA);
   383	
   384		ver = smem_dram_infer_struct_version(actual_size);
 > 385		if (ver < 0) {

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
