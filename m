Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1171F948
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 01:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752024204; cv=fail; b=EZiTODvkQGB8iBQ2XsI777iDsbPSut2ltQiJ3TEFLuM3C7ImpVOKD9ceMTVF4H/IaoPDGYQzsrBACjLdtHYFEjSDIY7gnpqyj0CDBoeSDXY/HF13HdtWfKbrF3UZDqvv3GLXNzDP4NFX/Z29ZhxoFqkEnEYMObNIKsMud5ga37A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752024204; c=relaxed/simple;
	bh=WkfGyUMb7RIroMjdm24GwYB29w5jLDg3V43YTGitOfU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=X1NRbnfjsBeF1vGvISTq+q2toXVqCf1xM0vry/jmlF0oTsAupb5Nh2Vgr2dBSVKC1AvNEAigm6NDpUu4eLpQ5KGUKU3UKEQ7vpOKYwOln4DFHJRcD1AZZEfnI2kfuHEm7JUcwFU6zVMFthJDaw594WX3OHLPD7RgLPuxyMV4+Kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jGGfDmna; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jGGfDmna"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752024202; x=1783560202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WkfGyUMb7RIroMjdm24GwYB29w5jLDg3V43YTGitOfU=;
  b=jGGfDmnat2sTqrfq/qba2QpLenLG6CmJrW9ldOw3saoK4131G/3f90wN
   qhG80x59wlu2MVGWE5PPOgjbYf72OjEG5DO57ahtLCeaHxAak/0EAAJ+M
   cLoElhgjIHymRjEovdDQy95i95xtoBZuyrj/xwzON9lweC3WAQq99MgZN
   GG3aL9f5koLN0/qGdNr/b34GJM/XBMWuMH3oQOv2QMzVAbKC7qUHG6wyO
   vXV3io5H338MCIiPpJ3/Ky+ebRMkK8p/GxC1iB/N0/dtCoP7V9IGvxFlp
   wWXsO8VhfMV4j/UK1G252dpuIpKOgoQ+9RFRkcXx1mb8H1/exWLyF1m3j
   A==;
X-CSE-ConnectionGUID: Debncx2jR1a7JCv2mT0hEw==
X-CSE-MsgGUID: onNsgESDQAGgQBxjls3Fhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="79711869"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="gz'50?scan'50,208,50";a="79711869"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 18:23:21 -0700
X-CSE-ConnectionGUID: VK81pJ7eQCmqbfPJk2wsdg==
X-CSE-MsgGUID: 1HSOMTZCQtKPi99kwQ6BiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="gz'50?scan'50,208,50";a="159903121"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 18:23:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 18:23:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 18:23:20 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 18:23:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mP4wLyWoY/HsGQRIRB57l9sQ1hiYNpF0MtMiugAd2M1nw1nViLItvXA+b18bGJiKKDsoNsIdl8EmvblWXEMfiij4aJD0y6IS/3H/ABiDQdjXJlhAI3JHTFE15aiBxE486B0X3V2yhJQQm9AmCRYYrMSuZE7Cu2BsiShkvpfz/mBhFUy963yXzS6ZJTRKySw4LyhfiHKauMkYD1xmsJoBnG941ULGW/mi+1/QEuoVFXmV5n6AXiVIXz9xWZLXjjpIL1s8k3bi8U7fT4s4CJeaIngNixetllGzVtN3KJX9sBpCCPFxHvUIaiNBk2bNJczwxR/RkFPTYqyWcx7T+23NTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0D6Bk5i1UVBwKTQfYsJtFFOqHk5mSWqKgIM/BaSR4I=;
 b=ayT3L2jhVXzopOicGm3+CpV24I8Ni3+WVe/BBn0mF6g80qbCIz8ytpIu0Jw4n82CySE0wa8+FmHN4uWywOVjTCI6QUZ7OfCTljPVJp6TE2+SZrdm1nOIDIDcrTpeOPM5nxkd9edLh5n1z1l8Nk66UO3dAO/TJNsFuJYks+uPKmrzQ99c3OdqVfkOl2yRZQSc7yWooa5xTL6WHmaUXvnsxtiCW6T5F6qeJU/V7nraiZOhJPuupd8JUiQVHYqdPOaO39xUdUe4wlYvrENzgyLRsgqV8Dc/wlPPJEWCxZE0xvS3cS9AmIsXigfj80WjGgO745Cr4pnyCCzM5KHEZokB4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by CH0PR11MB5313.namprd11.prod.outlook.com (2603:10b6:610:bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Wed, 9 Jul
 2025 01:23:16 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 01:23:16 +0000
Date: Wed, 9 Jul 2025 09:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: <kernel@openeuler.org>, Wupeng Ma <mawupeng1@huawei.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [openeuler:OLK-6.6 2464/2464] mm/mem_reliable.c:131:52: sparse:
 sparse: incorrect type in argument 3 (different address spaces)
Message-ID: <aG3Efa5a45Ze0kxl@rli9-mobl>
Content-Type: multipart/mixed; boundary="BuQUw0T8RwnmlCiz"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|CH0PR11MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c789ff-3c18-4e5e-4ddd-08ddbe872e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Aw4yS9seyKxhT71A5brMfEYvVb9RDgMgd7SowZ3D4kMQAihCXpxmt2pKsURn?=
 =?us-ascii?Q?CEsaJUXEMh/d3xqOus8WXl+menCXj4BdKubkJZ7a6IMn6qpeVJQRaXTVeQyQ?=
 =?us-ascii?Q?lXXTtEOyu5aCuS60+GVFrprwPEqFVPrK1Fg1ttohLL45xCgC/191AamPnuqS?=
 =?us-ascii?Q?Sg/zUuyYOhubao/rcX/ilVZ2o4ClhZjFVJAOhiVroMDcMSoXfTDstmmjbE33?=
 =?us-ascii?Q?XQnySauk1rbyJnMHMQRIP8yGeKPCN2YM30d+gKVAWIuvpi4rYH+d0IxJav4J?=
 =?us-ascii?Q?1n2Pz4Ct89o5Ktn8Uxwwype4+NN7HV8ERcUWVX6qsDIrg/L7uzTz9h9LwsWH?=
 =?us-ascii?Q?WtGMdTrhhoMWwn3Tct/+6uIpDZBFGBbM7oA2/h81ICa6uu/cfffimOeeLGWy?=
 =?us-ascii?Q?x0yj5008RvYEa0TiD5U7P4uDfYw5daYjjYEyei0vibpdRl5Q2PTw67Yd6BrG?=
 =?us-ascii?Q?uRVaowlk60mIRoIYwoWbxc7PaGnwXs03KJs3oExmVpTfc9ZjqTrtTSs2UAB3?=
 =?us-ascii?Q?k70m3PkXH9lCdfCikYD56AflGn6M8kkXAgVa6Lr11kF7vTJ24YDBHLLFg6Ga?=
 =?us-ascii?Q?HVQwIibuzr3P29IslwCAqmN6gaU7DkbcoTqbX7JD8KX0kSYuzyE/L5OKYvOl?=
 =?us-ascii?Q?XljVB3j8pB8chsxhJfk/QDkt0yVVsJ271DVXxg7ZtLni3CQkD34a/NIE86Re?=
 =?us-ascii?Q?PahOY0/FIxqKWOvJ5+4BaLnDiNSeawIEbSCaXFO4AMdbbI7zDUxsPVLtgnpm?=
 =?us-ascii?Q?bCpP3NWkdlgqrpCs9npR5u4IdUmMDWNTEhFePxeyfLoCOvN2IrljFvoykmAx?=
 =?us-ascii?Q?I50v3qPdzvk1pxnIznTKUsoJG0qCsAy/EHfGqw92azc0GJ81C7xnunsvUEnA?=
 =?us-ascii?Q?avI7qlbde2oNOL6eQtKx/Sp3SsG9TbegzZnbOooRnFl8xlIN/XRAjDsguNgi?=
 =?us-ascii?Q?KwBhjJ0GAU0eOcXwAuObULRuSUEFdr+1RBvBda+RwrIeJgOeo7A5eu/BQFAo?=
 =?us-ascii?Q?KOu4EhmE+D3H/LK+W9qw4Q8tBPmj59U+LLYFun75ye7FX7yFDzyrU4hb2z4m?=
 =?us-ascii?Q?RyIqzYExVHD/R8B50r2GUKPV5h4qIoKwtL2E0WhYOng+nVBDLfEtW5nWLjzr?=
 =?us-ascii?Q?UpDu4tNLwNxWsKpQzA8p3jI1C8lf9M2V8Fcdlq16Z7rJXa6P8yv99t6RB36s?=
 =?us-ascii?Q?SimnKQhsKpO/fMMq6fJhF+5G0LmTzP6DCK75ddAiM6uqlM1IG/V+EAb/wAzA?=
 =?us-ascii?Q?0S0KNFqu+9ERInZ+FONVAMdNdyWqmW+chyduCcNmHGtJYS9klagXRTdlHTlk?=
 =?us-ascii?Q?gk1omf8000R/FyeWShWMsCHv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gDJYZLwTNg1EMRYMKkaGRw0290tB7eWWQBgK78mN/BYAffzMp5KCHSDR8wfk?=
 =?us-ascii?Q?bSDqhTy+d3nG0BlAfDryZz0+mhZad+/NUOGJCejdatQ+m2QoviW4YYDhhEl4?=
 =?us-ascii?Q?SsbXlf/q4hoNtxJy1aHHN4qHwB+ifyi0E7J8MTrqt16IGWCTGrtUA0BzKqWE?=
 =?us-ascii?Q?v+mMLNe3ta0fBDnAt1KQkPIRY9+hvIl0AluzGdxpAnec931ee7NLyJ5OsUlb?=
 =?us-ascii?Q?Lv4IXSqyE7YRmB9f3bYwbcrYMYoHA3VScAoxs6V96dPXFhrjNHgFA6U/i7Fg?=
 =?us-ascii?Q?gLfryOoFurr6jKIRQYf/EqQykPYIQ/K4QEB0kyTT8/ERyfZpwKoSHJDsmZA/?=
 =?us-ascii?Q?mayds/hfLmkNJDQlarJysNRh/YXHSlc5ziBPRqyJUjmm46n5d9pIj+2NpvMF?=
 =?us-ascii?Q?oz0T4COmMz4vs9ziDSwOoKm/rljWgXrNjYXcoM/YEbG9JIYoBU/exzu31cEy?=
 =?us-ascii?Q?QQr0XrdILwpFKXU7DRI4LAcB5I62PIGVwtMGPqeOjlHMItKlmvNr7ONOE5G4?=
 =?us-ascii?Q?6qzFg0QfXgn4OhzCrdxGcJmBFzNBequF/NUF2bXXKLELqnyrtTDbWUQvdVqE?=
 =?us-ascii?Q?N5l1i5P+dLEJKicYtfpU1TLeDNtiLVIJMq80ESOCDRF1qOrffM7Sy6rmdQp6?=
 =?us-ascii?Q?0yW93ftEJtaREd2vZWyQz0JyH1rKAFEj8o+8AI8x7uvfODIEgJZxCzRei/fN?=
 =?us-ascii?Q?IS7BPxnGtut1zmHNgfOUvJO6sAxCnHKEFLGdVBBVpahhgIC2gYGjxmv0JZbk?=
 =?us-ascii?Q?+rGVf8ErwQup0ogLwHyO/8FTOh+/2ft9aRqZLPkk0IZV2Nhtt3CbrFqT/8Ut?=
 =?us-ascii?Q?JMWY3BncfrImSYL3z/eUKmfaetGfjBaoSl01/X409vIsuaWpHHW4607SK4l0?=
 =?us-ascii?Q?6PvwgJbBHODVHLfj9ymO++G3KXHkgowHMLCiofSAZ0fEzPPpYRyjLI1O7M2V?=
 =?us-ascii?Q?iwe5hCUped+NRFKXsPFXKyqSpELBBbEkbrMzV64xeEvSYny81yBgN3LHFT2f?=
 =?us-ascii?Q?wT3CmfByT1Py8TeaQnlWmb0arzah/fsEe8j20dwmLO1ulMqtDyaMDMmLJRzZ?=
 =?us-ascii?Q?yJjO/SajLnjCLWXfKgJhSeQESxEa3nJQ2dRQVsHuKPWayiwf09KgZxUJ26uP?=
 =?us-ascii?Q?/ESG/S6gNl7r4F7l7CH6c8gNIi+idQxdavWfrhycGxP4BKKLzPPIai2gaC9j?=
 =?us-ascii?Q?r0OuiMXdTxAhRBoWrfKSy1nxihzVH5VKh3oie3fAzqY74t8WUD7szZXoc2nm?=
 =?us-ascii?Q?7Lkyb9K2DpAyTfveghRw9LbbJOcYJXSYKhxeKrUUsXLEHUNf1b5Zpt/NwfGy?=
 =?us-ascii?Q?dfeGmNJqep0xKfKYNbOFXbTK4FD/KfUIk0lfXwLXNASekKfGWVwHOgekxOA9?=
 =?us-ascii?Q?169+G1fv8+ZDdepYB9f/yqhFzw361htwAmNA/TjFxQAWNhEU5NmunZ2knSe8?=
 =?us-ascii?Q?JEwHQ9zwbhWdySi1CbTpPehraAR302zbIK5t2iuB4Il8jKFAMvRj7k2JXNid?=
 =?us-ascii?Q?9LMaXAYtdzb/PHdsCZIDgwBYrfsL50RayarqKH61zhPM0+rnEELus4QACwGM?=
 =?us-ascii?Q?XNS8yoXmuoFJg31T317isgBIKuHy4/bTLONUp/KK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c789ff-3c18-4e5e-4ddd-08ddbe872e02
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 01:23:16.1948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDKv38gK0KuW88UFINDT/T9K7/xjEfy8OJptPyDfidJTR30vlNTLeZLv7ZrgSs+JJyESM3I9RNDmlDHiShXhqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5313
X-OriginatorOrg: intel.com

--BuQUw0T8RwnmlCiz
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   677789bc02303c550a9640f276fa3bf20ac18ddf
commit: 200321e8a69ef82350d070de35ac4a666ab79ba6 [2464/2464] mm: mem_reliable: Add limiting the usage of reliable memory
:::::: branch date: 3 hours ago
:::::: commit date: 1 year, 6 months ago
config: arm64-randconfig-r111-20250705 (attached as .config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce: (attached as reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507082307.SjmkbpsI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mem_reliable.c:131:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/mem_reliable.c:131:52: sparse:     expected void *
   mm/mem_reliable.c:131:52: sparse:     got void [noderef] __user *buffer
   mm/mem_reliable.c:150:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/mem_reliable.c:150:52: sparse:     expected void *
   mm/mem_reliable.c:150:52: sparse:     got void [noderef] __user *buffer
   mm/mem_reliable.c:172:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/mem_reliable.c:172:52: sparse:     expected void *
   mm/mem_reliable.c:172:52: sparse:     got void [noderef] __user *buffer
>> mm/mem_reliable.c:190:33: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/mem_reliable.c:190:33: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/mem_reliable.c:190:33: sparse:     got int ( * )( ... )
   mm/mem_reliable.c:197:33: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/mem_reliable.c:197:33: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/mem_reliable.c:197:33: sparse:     got int ( * )( ... )
   mm/mem_reliable.c:205:33: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/mem_reliable.c:205:33: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/mem_reliable.c:205:33: sparse:     got int ( * )( ... )

vim +131 mm/mem_reliable.c

e57990640118e5 Ma Wupeng 2024-01-10  123  
200321e8a69ef8 Ma Wupeng 2024-01-10  124  static int reliable_pagecache_max_bytes_write(struct ctl_table *table,
200321e8a69ef8 Ma Wupeng 2024-01-10  125  					      int write, void __user *buffer,
200321e8a69ef8 Ma Wupeng 2024-01-10  126  					      size_t *length, loff_t *ppos)
200321e8a69ef8 Ma Wupeng 2024-01-10  127  {
200321e8a69ef8 Ma Wupeng 2024-01-10  128  	unsigned long old_value = pagecache_reliable_limit;
200321e8a69ef8 Ma Wupeng 2024-01-10  129  	int ret;
200321e8a69ef8 Ma Wupeng 2024-01-10  130  
200321e8a69ef8 Ma Wupeng 2024-01-10 @131  	ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
200321e8a69ef8 Ma Wupeng 2024-01-10  132  	if (!ret && write) {
200321e8a69ef8 Ma Wupeng 2024-01-10  133  		if (pagecache_reliable_limit >
200321e8a69ef8 Ma Wupeng 2024-01-10  134  		    PAGES_TO_B(total_reliable_pages())) {
200321e8a69ef8 Ma Wupeng 2024-01-10  135  			pagecache_reliable_limit = old_value;
200321e8a69ef8 Ma Wupeng 2024-01-10  136  			return -EINVAL;
200321e8a69ef8 Ma Wupeng 2024-01-10  137  		}
200321e8a69ef8 Ma Wupeng 2024-01-10  138  	}
200321e8a69ef8 Ma Wupeng 2024-01-10  139  
200321e8a69ef8 Ma Wupeng 2024-01-10  140  	return ret;
200321e8a69ef8 Ma Wupeng 2024-01-10  141  }
200321e8a69ef8 Ma Wupeng 2024-01-10  142  
200321e8a69ef8 Ma Wupeng 2024-01-10  143  static int reliable_limit_handler(struct ctl_table *table, int write,
200321e8a69ef8 Ma Wupeng 2024-01-10  144  				  void __user *buffer, size_t *length,
200321e8a69ef8 Ma Wupeng 2024-01-10  145  				  loff_t *ppos)
200321e8a69ef8 Ma Wupeng 2024-01-10  146  {
200321e8a69ef8 Ma Wupeng 2024-01-10  147  	unsigned long old = task_reliable_limit;
200321e8a69ef8 Ma Wupeng 2024-01-10  148  	int ret;
200321e8a69ef8 Ma Wupeng 2024-01-10  149  
200321e8a69ef8 Ma Wupeng 2024-01-10  150  	ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
200321e8a69ef8 Ma Wupeng 2024-01-10  151  	if (!ret && write) {
200321e8a69ef8 Ma Wupeng 2024-01-10  152  		if (task_reliable_limit > PAGES_TO_B(total_reliable_pages()) ||
200321e8a69ef8 Ma Wupeng 2024-01-10  153  		    task_reliable_limit <
200321e8a69ef8 Ma Wupeng 2024-01-10  154  			    (task_reliable_used_pages() << PAGE_SHIFT)) {
200321e8a69ef8 Ma Wupeng 2024-01-10  155  			task_reliable_limit = old;
200321e8a69ef8 Ma Wupeng 2024-01-10  156  			return -EINVAL;
200321e8a69ef8 Ma Wupeng 2024-01-10  157  		}
200321e8a69ef8 Ma Wupeng 2024-01-10  158  	}
200321e8a69ef8 Ma Wupeng 2024-01-10  159  
200321e8a69ef8 Ma Wupeng 2024-01-10  160  	return ret;
200321e8a69ef8 Ma Wupeng 2024-01-10  161  }
200321e8a69ef8 Ma Wupeng 2024-01-10  162  
200321e8a69ef8 Ma Wupeng 2024-01-10  163  #ifdef CONFIG_SHMEM
200321e8a69ef8 Ma Wupeng 2024-01-10  164  static int reliable_shmem_bytes_limit_handler(struct ctl_table *table,
200321e8a69ef8 Ma Wupeng 2024-01-10  165  					      int write, void __user *buffer,
200321e8a69ef8 Ma Wupeng 2024-01-10  166  					      size_t *length, loff_t *ppos)
200321e8a69ef8 Ma Wupeng 2024-01-10  167  {
200321e8a69ef8 Ma Wupeng 2024-01-10  168  	unsigned long *data_ptr = (unsigned long *)(table->data);
200321e8a69ef8 Ma Wupeng 2024-01-10  169  	unsigned long old = *data_ptr;
200321e8a69ef8 Ma Wupeng 2024-01-10  170  	int ret;
200321e8a69ef8 Ma Wupeng 2024-01-10  171  
200321e8a69ef8 Ma Wupeng 2024-01-10  172  	ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
200321e8a69ef8 Ma Wupeng 2024-01-10  173  	if (!ret && write) {
200321e8a69ef8 Ma Wupeng 2024-01-10  174  		if (*data_ptr > PAGES_TO_B(total_reliable_pages())) {
200321e8a69ef8 Ma Wupeng 2024-01-10  175  			*data_ptr = old;
200321e8a69ef8 Ma Wupeng 2024-01-10  176  			return -EINVAL;
200321e8a69ef8 Ma Wupeng 2024-01-10  177  		}
200321e8a69ef8 Ma Wupeng 2024-01-10  178  	}
200321e8a69ef8 Ma Wupeng 2024-01-10  179  
200321e8a69ef8 Ma Wupeng 2024-01-10  180  	return ret;
200321e8a69ef8 Ma Wupeng 2024-01-10  181  }
200321e8a69ef8 Ma Wupeng 2024-01-10  182  #endif
200321e8a69ef8 Ma Wupeng 2024-01-10  183  
200321e8a69ef8 Ma Wupeng 2024-01-10  184  static struct ctl_table reliable_ctl_table[] = {
200321e8a69ef8 Ma Wupeng 2024-01-10  185  	{
200321e8a69ef8 Ma Wupeng 2024-01-10  186  		.procname = "reliable_pagecache_max_bytes",
200321e8a69ef8 Ma Wupeng 2024-01-10  187  		.data = &pagecache_reliable_limit,
200321e8a69ef8 Ma Wupeng 2024-01-10  188  		.maxlen = sizeof(pagecache_reliable_limit),
200321e8a69ef8 Ma Wupeng 2024-01-10  189  		.mode = 0644,
200321e8a69ef8 Ma Wupeng 2024-01-10 @190  		.proc_handler = reliable_pagecache_max_bytes_write,
200321e8a69ef8 Ma Wupeng 2024-01-10  191  	},
200321e8a69ef8 Ma Wupeng 2024-01-10  192  	{
200321e8a69ef8 Ma Wupeng 2024-01-10  193  		.procname = "task_reliable_limit",
200321e8a69ef8 Ma Wupeng 2024-01-10  194  		.data = &task_reliable_limit,
200321e8a69ef8 Ma Wupeng 2024-01-10  195  		.maxlen = sizeof(task_reliable_limit),
200321e8a69ef8 Ma Wupeng 2024-01-10  196  		.mode = 0644,
200321e8a69ef8 Ma Wupeng 2024-01-10  197  		.proc_handler = reliable_limit_handler,
200321e8a69ef8 Ma Wupeng 2024-01-10  198  	},
200321e8a69ef8 Ma Wupeng 2024-01-10  199  #ifdef CONFIG_SHMEM
200321e8a69ef8 Ma Wupeng 2024-01-10  200  	{
200321e8a69ef8 Ma Wupeng 2024-01-10  201  		.procname = "shmem_reliable_bytes_limit",
200321e8a69ef8 Ma Wupeng 2024-01-10  202  		.data = &shmem_reliable_limit,
200321e8a69ef8 Ma Wupeng 2024-01-10  203  		.maxlen = sizeof(shmem_reliable_limit),
200321e8a69ef8 Ma Wupeng 2024-01-10  204  		.mode = 0644,
200321e8a69ef8 Ma Wupeng 2024-01-10  205  		.proc_handler = reliable_shmem_bytes_limit_handler,
200321e8a69ef8 Ma Wupeng 2024-01-10  206  	},
200321e8a69ef8 Ma Wupeng 2024-01-10  207  #endif
200321e8a69ef8 Ma Wupeng 2024-01-10  208  	{}
200321e8a69ef8 Ma Wupeng 2024-01-10  209  };
200321e8a69ef8 Ma Wupeng 2024-01-10  210  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--BuQUw0T8RwnmlCiz
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--BuQUw0T8RwnmlCiz
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce:
        git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
        # apt-get install sparse
        # sparse version: v0.6.4-66-g0196afe1
        git remote add openeuler https://gitee.com/openeuler/kernel.git
        git fetch --no-tags openeuler OLK-6.6
        git checkout 200321e8a69ef82350d070de35ac4a666ab79ba6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        ~/lkp-tests/kbuild/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=unlimited -fmax-warnings=unlimited' O=build_dir ARCH=arm64 olddefconfig
        ~/lkp-tests/kbuild/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=unlimited -fmax-warnings=unlimited' O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/ arch/arm64/kvm/ drivers/ mm/

--BuQUw0T8RwnmlCiz--
