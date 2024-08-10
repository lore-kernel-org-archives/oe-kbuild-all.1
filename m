Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2253C142624
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Aug 2024 06:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723270027; cv=fail; b=jN1QhFudSex7vKNrUqq8PaAJjz0oR20QpCDn8vNho93rHtJuRaBNxAqZIuWmSTJTT+U1vmFpWrDg7dqG/tMqbe2PGZwRQxJz2+8m7xT9+OjTmh8CDR95yR+Xq01khri4Xd8Ifn8u8cUaMtsE4EZYUxoLg4iuXRXWTYtTYYa6giQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723270027; c=relaxed/simple;
	bh=gbFQQc089ISqzdQw0xN07FLBSxnxT/JhRRxWY009BfM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=a6KsU5Wtgpj8vmibYhwGrLfhuQZm2XxwHXb9J3jSJwfxsG8vVaScFOXuJNV0PKtBmX/22No7BuHhyc2n5RCxyKMF1cNCCSmZwh2S0fVR+ucGo0rfN/+ljcHh8KstyJHnfRpLoQLNmGn974ocQKiYwKkTwri2WCIKuNg7xiA5tjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iePtuu2p; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iePtuu2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723270024; x=1754806024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gbFQQc089ISqzdQw0xN07FLBSxnxT/JhRRxWY009BfM=;
  b=iePtuu2pCLMZIxmNT7E6B2nEHsPXmlLfHOzjxMdXohPdaM6QI+VanBYs
   09BdITGLhcApMk2B3hSGW3O6R0kar+xszfHj8c2ipxfFcLXvOiKatdXfd
   J26SpE0hqUnfZ24wAkEzphQS0rB3YFvcF/FUEOQ+I+AzH0IaunPsA7ZdF
   ILyS9ybnvZ25+gRMYD5dTsZ4D67u/VDM8ZVvJwfooEq9qugJTeNMnnOmd
   zMmjR6svTmd9VnwNmSQP6f1eT3QmYMB47mGBcv/O/umZQ2orKKLamM4eN
   T/K3HfDFoKMEBrQKZebj4bT4LbS3/OIvXAO+MsPAASOsS26Y9w8mw8ubu
   A==;
X-CSE-ConnectionGUID: nFtMZUknQoeztdHW0IaNRw==
X-CSE-MsgGUID: EO0I6zLfR5mDlmYEzvGTxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25314198"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="25314198"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 23:07:03 -0700
X-CSE-ConnectionGUID: s/hHdWhJSV+adQJ70FjwoA==
X-CSE-MsgGUID: soBHY/INSu6P+15UF1adpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; 
   d="scan'208";a="58474865"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Aug 2024 23:07:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 23:07:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 23:07:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 23:07:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 23:07:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cvz9cyUIR7V9xr6Bq5L9pSevbnQ6Opz41f8oK/uAjhuTk9CxGDq/eBEayFn4fTsm8I/zkck1MMdubUJ7GTfSJO6/cgO5mvIFsdnyJT14niJ9lJ+mnu+tiEqLvs4yBI4tUF5VGBE2xKH0IfoLYC3FNI3QG19v0ub7E79xY+VjvDQLEGnO7E1RMmkS+KGzUdgdXE5tpLG4rUwNwpvUxuleHuEMR4OpKx2ygowtsk3XKqqufFD7jV+q0a+5XRzNl93JGFsHdlP9WuyEVb/EiISENjF5wgHt5n9C7KvwlYFbQDui0y98ivtJtDLYOLN+/be2DEkY0q8OwF3MTF0S+xTh8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iH8hErXH78zJ836P6j43MjdTeXhhT0mrPUz2oNW0lxc=;
 b=SmfINyz+vczrNdbQEnRENaEaYstn+PoRX38cO4o54DsxVaV6KujruHdLtLJftXaWrf+DGq0S/Chzw7/LerFaHDiJitnUsvykq7hWHrVTUdREzYIg8mEdY0s5KiKZrgTw+UUB/1oeV5Xa3ocLQbmEyG6tuMX3NumTJevRrYYvNAPmjgesw8k2bcm5g4XW9aaaOB/0SaDLsF7wh4psUQGfKMrb2JQF1DgY+/mCQ90SdEpxb5hzXi2w5H/q5dlIIAaJ6Co5/obw80X+CRIf2hJW8S4vaxa3uBQcOirkkSSbYXUUOtYg0g77LsrLX/JFpQi8U6SxLI7qO93g2DINoQkIug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW5PR11MB5932.namprd11.prod.outlook.com (2603:10b6:303:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Sat, 10 Aug
 2024 06:06:59 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.029; Sat, 10 Aug 2024
 06:06:58 +0000
Date: Sat, 10 Aug 2024 14:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.6.y 31/78]
 arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: ethernet@ff3f0000:
 amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <ZrcDelIIgcGzl92z@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW5PR11MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: fb7da205-11ff-45b8-1db1-08dcb902a48b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yxai9ueE3wyP+hoWlRnwEUmTA3ejEQigPf/qDwMcCGp1cneLfqRNU0nDsBfa?=
 =?us-ascii?Q?FYqxDE2t6LNRiH/rl7yc9BGtaM/IfwXL7ZyFr5fSXQ8zpDqAjbaTsst2UiqE?=
 =?us-ascii?Q?BTAKPlY1rmU9+mbPQ8qgf5nfOi358+AorCWbsyYeNgVWdiEk1RRd29Ur/Xqj?=
 =?us-ascii?Q?0DdW8Nm8Glw5HvZK1IFlR91Q5cVDXfV5VTr1rFtstfypRgz1JMeYOwOXXqzH?=
 =?us-ascii?Q?9LHAYbZYTAWD/f35x2qH+QwPL+933d3AORNDm+3vu3ZrCAndHUcBJNbRQ1MZ?=
 =?us-ascii?Q?Uc7h3mpWwNuqG3YP35r4g13wAEL2lpfDhm/SUamRwBhNjri0mcgrwouTGbuQ?=
 =?us-ascii?Q?LppnoBhx9mqHBXM+iuQAmoXIydaMg5MWuBV3O/pq8FEt4TPkAxDxZsq102SO?=
 =?us-ascii?Q?Vy2dw8usjDZ6SswREzTjOb7TMOKIuST4O1e//zC5U5LVWKCGOCXGi2sX5JcC?=
 =?us-ascii?Q?WXTU7K2shBd78WTw45OdF2hhlOtKgXuENnypTvjDL0nLGTTmYxPaBwGfoPmU?=
 =?us-ascii?Q?52FF0aGD9w+ASxyN1CCyigrTWPgO/0ubXZYa1aooPjL2GIERa96bpZhHrV30?=
 =?us-ascii?Q?kn0L/1RMS0lVFxjlIgCZ5haMo9qw34zoqAvyBssFx/JLYN6PZ3psj8Et/0fE?=
 =?us-ascii?Q?G/ZQj9UdAZjOMthSNVQRNdLngvGT1E6Q+UVYd5IUwC1798b+ZTbGlWRR31NJ?=
 =?us-ascii?Q?c+ZqBdhMwd4IzFsH/2ruWsb9XNpgvKRS/eCoMx3ycX112OUExK9sZNG7qkNM?=
 =?us-ascii?Q?0b3W8+7VnpfLBls1y5UWsDeVfN6/+RqgVKgSSNJJ2xh4xHtDQFQMlDI1KeYg?=
 =?us-ascii?Q?Cu6M9MoMzE/+70TuUIAZdDhngGOUHrb2gJ3OVm01iXhfhNE9TRE7qemcGjpz?=
 =?us-ascii?Q?VqOzLpcrvm/mVO/mVr+vjxydV8I6X1htQSCLpaCbiCdlhvDWLn1j8NpTfsRF?=
 =?us-ascii?Q?eKVUxh58qfdxxiZQ0sxRz56uYtSaMrPsa+uim1T17+FTC2PovE0sMXCFu68z?=
 =?us-ascii?Q?LVQ2L7+zj9Y98LLH8rGWcCksR+XngXuzmslR0e0z9t6jVS1Y9pJS6ZbQP52u?=
 =?us-ascii?Q?s+2gN1tnoLwRsx88SyZXujTxYK3d9uXv9XpAn1XAXbqcElowtVuvmh7JciNn?=
 =?us-ascii?Q?eKpZ1Sk9iwsZlqeO1pe5GrGURJDZ2xksZYo9UaEd9nyUNLIT2t/DXdSzpYOB?=
 =?us-ascii?Q?p6F9R1/svhUv0LoZ7MW0EEC22kSg4mcoYzDqtc6RgutBJCPWxwBcl8xEgVUR?=
 =?us-ascii?Q?nPV2s2IUMnBLWs+p/ASPcw+cL34pLzsA6N7lICTGDpmnQqa75QyEasZUaUDb?=
 =?us-ascii?Q?fkHgBq4Huk30n1I/LdPDoH9jYhTdzD/SQcCwb+Hlhu5jJLmZsyXA18+OZQiw?=
 =?us-ascii?Q?Dejhh8o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2jXH/xOa9OWbrmIzphJcEY/6GExzTuGSnOlgN/2b5UuYd/6A/vt/EueEbNHa?=
 =?us-ascii?Q?MmuF2Nkd2L/8OT/pZYpfSgRq3X8/ixZEk4FFmjBMESVopSgCBefNKYFJV8gC?=
 =?us-ascii?Q?yDVDfkWsWAoEmGVuKLqwzhtjPjVk55k5bhoM07VVnuNLqfBNtsQ9wqhzlQs/?=
 =?us-ascii?Q?XR5Xcz/JspzamcPMGcDvmVzeCbvY98MdrL8DOcvs0XgKFW/GiPnFoWzti0Gx?=
 =?us-ascii?Q?KccX5kKazjupZLxcG1Vu/bkFeSWP2FSGDEpqyTY94LZZ2SIZSvUv03DoVR1A?=
 =?us-ascii?Q?AMl3UsV62Obw57nxdxKJQdUr7wadFFbHXq2Z72vdlR/5O47F9IiwDp6sXn70?=
 =?us-ascii?Q?qxo1RFTrsWjlgwAopK5GUwY6cQJHUvwQnT25Pu8CsIH/D2KGQADGYxhlRbeZ?=
 =?us-ascii?Q?3ACMojR6pMgZnAPMB4HGI8CafePbfKwirBtsVEVe+r6xLryEroUBes2B3a3o?=
 =?us-ascii?Q?igWG34ml+LrXMgkJkleulTvIdORS978DkPv9yH4yKEKe5Da3wlQA2ieW9XTq?=
 =?us-ascii?Q?XAHqAYz0DqIvEikwGEd0idIb7gpXNw9kgBjCQWOA/M2eY2eTBTqm8eHZKzfi?=
 =?us-ascii?Q?Ly7V4tIgu5Rrz+HQ6GzbFZdIvgp7PZHgNdI5WJLiOFjtI4CRSclfNS2OdL3s?=
 =?us-ascii?Q?0gw94I1pabsrd2dEqYWywjxVLrIes+REfxjDnRUTaVnxXagTxSN2xhddlIVG?=
 =?us-ascii?Q?wdYcIzqcUkpAq/WcwXLEsZW7LYRnOUbMY1Z8fPAXH4CWJrjsPq1o7irNkfGB?=
 =?us-ascii?Q?uCOa7UxA6wtA0CjPnabFrzesIB5b/Xr05QAVb3/EOuC74BW9Vq6h7qZm8wxJ?=
 =?us-ascii?Q?Bcb1uW9WktVgWOv1tzGos1CM21IId1uHWsVsdOfWxBJsdGtgCbPtiQ6c+nVc?=
 =?us-ascii?Q?ItdRHvk4TLNcAFCq+FRBh6jJ/nh/fhS3gpdktnHS7HEUVvANSlvNHGRFDjAp?=
 =?us-ascii?Q?HNk83Hj+Z657/5aLgS1tcY2j6kLjWarbubRAwLo1S/oHm0k27+B432JXIUvE?=
 =?us-ascii?Q?PmySrhZTzn7ZGMtZL8GuG2G54GZ27xTzLOGiikgCT3VAp1yymIm388VeEkyd?=
 =?us-ascii?Q?KyVkJxnsYAyHQZ3SctPReyHuyk6Nje54jqU5ti43hoo810UKUvwwG9wTQyuE?=
 =?us-ascii?Q?SakFVog2IHh57s4g6z8O1pTHY97vcwENmlm9YgxZihHQDjB3UwwCCPDyzafp?=
 =?us-ascii?Q?YZ4/LN32IC+u+Pj2RGFetpEUzqllT6fPW0fXRcLP+xMpofrDmafG0QQOxru6?=
 =?us-ascii?Q?YspSd1WdKdCaI4fCFrVF5nJVN9DbVIk4nXJANJRmiD/1ntxkkdFG9uWYRfAH?=
 =?us-ascii?Q?nFTbYFUab7dYuI4xT0ISNmLAKVHAcR3Pd344wUllSx71iB/1IIA3UVFQoAHn?=
 =?us-ascii?Q?TUYpSBb/GTHV+9MjwVmR+0YvLSJY1uTWauu9lJFXX7pg0mYRVGqMaXiyLMOr?=
 =?us-ascii?Q?ybpbAcFTIbnujS2jOtgiWl6a8X18lkfsJMVXLo1RHvR/DaXTRKPGfKcq1jAG?=
 =?us-ascii?Q?2NAngq+V+aiqW0FbPeUHypvOmPiho0Qc/DoXfS7nC8KEXBL27OkPyfigzgPh?=
 =?us-ascii?Q?Hy1aCX0MrmuyOvBQFMwC2PvAM2Y+6lp7SGxpxT+G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7da205-11ff-45b8-1db1-08dcb902a48b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 06:06:58.7021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5AEKlB2eMuNoRbdW3oMEKBljNAluzhwp9KPpTppTEFpSzXa4RwooKZs1HVKPX+SK4d7MpQ7kh1mpzQB9j5O0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5932
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   db2e15a776d1205387db09cc4cd4b3d97c5de1d3
commit: 81becb0ae3e52ea78f9fe3aba30ccef729a4c343 [31/78] ODROID-C4: arm64/dts: add 'meson64_odroidc4.dts' for compability
:::::: branch date: 3 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240810/202408100614.zUdW002D-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408100614.zUdW002D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408100614.zUdW002D-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc4.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

