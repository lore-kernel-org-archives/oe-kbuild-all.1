Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBE14D8DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 14:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727445802; cv=fail; b=t6OwgFyeKEtdSOmawmXjfiEh5zK1xqAzvAgUEFGLwd1D64L0aSWREIpGScY9zoQwr52okiQhfWlkabm/YDisj69ddkaPZCdpdOY4JTXwkltZAaybITV16uZV+LJRFJdsQsov6D1uvC3WjmLrxp4Ko7DW64RYcjUXn0RkTT7xilA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727445802; c=relaxed/simple;
	bh=M4jrtyyY8MdFoAFgzL4WzXXcm+HabVbIiGB1F3XhISU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gKzPJpembSV297V3FdEIm6J8/Ecgm2F8cjVJKcxFvT52f96rrzxtHOiG4BhISve2aUOthDJcbL6/qlhpWma+NQUulIk3NBkiK1ThiBFiZuAkGsZGEn8s7Ptyn54r0roBNXWoRGryl0GEHOZcyIvZLvaANjx01gfiBfTlQEyWzCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OXkKVF5g; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OXkKVF5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727445801; x=1758981801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M4jrtyyY8MdFoAFgzL4WzXXcm+HabVbIiGB1F3XhISU=;
  b=OXkKVF5gnxicEvCo1HcxSp77wbnix6K8QYZ1JhzGwR3KR7HaU6Cegzvd
   930EGeHcfNhZa45Nw4cUe9KaNGL+hlx6ndzMpsS4E1q2FQxfCzawukmTo
   b0q/sHMZjejwKRXRMSJaVtN6JXtAhRJ26A7FUoULjgf6we6MxQerp9epe
   vJfERVk4yxLmwY2NsO6j0dIpFeMpazqLIG3RCWljER8g15phHbh6fLchq
   heb7lvu9uS6ex7GHnSLhfL77Iz9G0mhv9IYYCmWyFN7ucpXBggoPBmc7b
   NHHyFsRtWKqULeHWxQ7SFARIjbqpInxfRMxQH7ya9oWy9ZIt1ti6fXPMo
   g==;
X-CSE-ConnectionGUID: M2YSKAtfQKyTtOBihV6d+Q==
X-CSE-MsgGUID: vHX321G9T7SfqZ4ZpiSaFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37171554"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="37171554"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:03:20 -0700
X-CSE-ConnectionGUID: M2360GwOTBuJCsE2UORnhg==
X-CSE-MsgGUID: /iLADVS4RV61AakF7uJPuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="72848107"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2024 07:03:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 07:03:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 07:03:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 07:03:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 07:03:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIr8nkrMH4zIkZ0yoc4sIp7nz93Fl3UAIN6FIoj/Cfq5ziEG68OnIq/jOVScwKDYnx7FJGRvybQ9w6Nmzlo9cS0DAM5jAdP+1TdT/Z3Yz+tfxrgbcvhUVCPo+kFFNAblOf25wVow8RdIT1gcNEOHMMDmJarxVu5/mAzuvAWf/os1WddWhSzrTVI1QdxyW7b4WLjHI1pFcNEb9CRj/pOsNDA9+okZuBXoB+UZxBzyXLzG3n4x8mltzzw2+Dpu8DeVHlqDhzitLBhXc+qZYj9YDMxm7gbzY50XlMZCTR+fZHysqTJgbrn3KlLVwcrE4QC3alyA19y4/phY629NaIl1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKJEnuiIthupUdcKVImu/PPbdUmmXKkjjjMPKG+ZTTw=;
 b=yByWMf6ohKD/RIJabnFFzigwie+7hNpJ2h5BmKwd/cAixIvHuAWTYw8PBN/YjySyP+AGvBbbPX40K0z+F9p2MUM2sNXfXAxJkmhkzreCefyGQG5Gi33hTNr9CEn5a+v0/gXjv1Bco30rCKLMEkImQbiAXcySZyLzzoW+CeMa7Cnnurh1AXVxYwazvfvxJBSDJ6TICN2x9WPRgMQBdHOd0uh8iS7qokFBhrfdvzNsCSPi2egtOOG/2hdZMfnsJjxDDsJ9z+A0q00RA6ChLAwpyyDZO6VYDNps3P3mbc6a4yKxATMaNsepIDinxWil1OktK4yPiX1yxCXNuQom4fl5+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DM4PR11MB6333.namprd11.prod.outlook.com (2603:10b6:8:b4::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.27; Fri, 27 Sep 2024 14:03:09 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 14:03:09 +0000
Date: Fri, 27 Sep 2024 22:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-4.19.y-cip-rt-rebase 6382/30000]
 include/linux/blk-cgroup.h: linux/kthread.h is included more than once.
Message-ID: <Zva7Ffol1HRGjqm3@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DM4PR11MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: 86296131-be00-40c0-9075-08dcdefd1e06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4znfeHooNGT4mfRoYvqKmgqSiZUrEreR1Fmr2vqOKivVJZdWibncEtWviMqq?=
 =?us-ascii?Q?kwWPlxu04KFTtJ3UhFrtaZrfmLR/7ZBaytnwnkXvzXfuj3chHM7KvYqMZosN?=
 =?us-ascii?Q?iMk124dIDg6VEsnyUvNgXNAbO1u/fYL+mc9TZMBdB6EztO8Qr8KLIeutSI2p?=
 =?us-ascii?Q?814kFTNvht7Eg+8aPMNTG6gVxzxVMjxAIKm4GW2zu7rz233NGCc1URnYnYwU?=
 =?us-ascii?Q?dV3VLGzgGnkOztlYraZmYxEjtrRLx9rb/8EQLmLUXm5e4Dwnz+wUpkasMp4F?=
 =?us-ascii?Q?OnZ/tLmCjcyaKAW2SdKfLqe4GBEoOQ7LYgxuUkG7K3eaPLpiuoVea28AQS/4?=
 =?us-ascii?Q?+BEMe6JtlBCp+m/IcNce3OzV3Ef7jwmBqAvzn2A4MIVQr4/huW7yVvW7UnKf?=
 =?us-ascii?Q?oIkO29EqjuG3TWMQjV7w0MiZWs1iyBj1IWMQ4T96U343HePg6pAajJyGKvJ5?=
 =?us-ascii?Q?lnyQ3rMDcfZinvP0cmYAuNJVGEtzm603+xwWuEDSh42XmiJoSJjppNzdMwvc?=
 =?us-ascii?Q?wX+Ug9998zY+/QcOYW3KyB2jymFnTARTDR68pEE0Qr/4AcNMssUL/KZyL2pK?=
 =?us-ascii?Q?hnCqj1549pZaLr3yXTbqr7QZmCz/X+ru62PRRvCvBGGIHUkMXOb+icCfyzd6?=
 =?us-ascii?Q?6ZjGUJG669aThyMpq4iPMJUdX4aKVh2PtCBzQv0qASFLS6Mvh7GdtsZQZl6x?=
 =?us-ascii?Q?wdDSQsURFVV+kW8ulwaE28fD29HtbFNwkzHVoTGfOyUMuXs5b8ZkkbMvY+J8?=
 =?us-ascii?Q?Q1IfDz2T5gJ26Auc1ehiPxsJPsHXe5Eb2oopJI1zw+LHg5+I5kqpWu5B2kUg?=
 =?us-ascii?Q?h8X0oSsbnYEoyswvr5TmnjzL53Ec8lFDZBdB6tFEmlnhcRLPsaIbQ6XI9Ub3?=
 =?us-ascii?Q?N4wZxLz2Wd+qfr4mMZukVaLUt1hgnbmTd/xvTzNrUIn7Js8HulQ1dKF1mweG?=
 =?us-ascii?Q?KdzG/PmRsFLPG1n1dqXvqSIM9gJG59VPzxuG+OxONvvb/DNP2qYgtSBaQOhD?=
 =?us-ascii?Q?s8H2ppwKqzQCQW5/xWHWiIwk2pYxZVJn83CqUi2XsLXCx1Tmz6bvb8sig2t+?=
 =?us-ascii?Q?VnnRTftRY/d85t6aTfvT0MU06Yqc+iR4ko+AAHeakHmkL72XQUj7qji69Pd3?=
 =?us-ascii?Q?UrZBPN0pMRFPzhVnVqrrkihrwikewfyrcqhEDIFuDOE7Gixz0n5sAnxMMlQL?=
 =?us-ascii?Q?IJlpbTTVHeMu7g7uZMy1M/8XoXEtXh1wko5zi5MHYp6gPt/qIfJD4x8erAa5?=
 =?us-ascii?Q?8x+4/JoxqurRE5ujbEyL/nv76B7fLTWyzdXmiyuSyJuDGnzrNFKC9KnO1HqR?=
 =?us-ascii?Q?9mM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D3Sz6k+viBi8DYae+kRXJsfhBbUrOQ3VRUKqGIeI0yM28pv7mfzsVm+B2dVg?=
 =?us-ascii?Q?D4xKnU6a/4QRyjHJrfCEcDSPbWN7Sk5/rez7cVNmoxwny2r2al6InuOpAg3d?=
 =?us-ascii?Q?5ObccDhOEe8m7NkTkK/F2ArE4u98RVFM86jfpsiPnSJ8PTU6gtxB9QvKQ7Gz?=
 =?us-ascii?Q?/r2NmM1clVArA3wFkwlzueD7dHFk1i+xmoxObRmHyW3HEFzTRiLU8dm+GZPy?=
 =?us-ascii?Q?a7/Wodrqp1QFeUKHoTSUAh2QeAscKZ0+meS3eyRwCi+WKBsdw5AjZ39O/Fkn?=
 =?us-ascii?Q?HwMw1bJHN5tdqrJ7HlgADYqBh86vQkPnHn2I4rDoOo5vjzL+HbSVJi6V7g0g?=
 =?us-ascii?Q?Bg2XcRSG7srUvV9P2PWTszqA8NwF0y3ynNbhG/QoyWz7DEdj2ednyDQS76HY?=
 =?us-ascii?Q?azOmJXNpbdpBe4GbymHlf7Gbx/2RjJyYJa3FYL5UfXuYTxzN8V0v6fxqS+gk?=
 =?us-ascii?Q?y1aW1GpAsc21Yyu1Kmu1wplKM52Nrle3SddcKacvSxXC2p9CzvreAG9ZJxtl?=
 =?us-ascii?Q?GV471MuKQzPHsAzHGhHiM0snuIv2YEQyMiYWGSht6fehL/8VTYOdqi6SlbYk?=
 =?us-ascii?Q?9tPrbyYViLTJtlbnLy737f+BCFWRx9oLP3g0uQBqDvMH4WDQ6SddCmUroym+?=
 =?us-ascii?Q?hY6TFTo3vn9XsIQ1YGfLtHcehBPE9NOwPUvVS/FD+0BVZVsObsnA2uBq9Qoc?=
 =?us-ascii?Q?2gu9K+bRwiBq12mWkYwvbZtcKIJIHGb/yh36UC2ox16S4X0nLk3LwyhjXk/k?=
 =?us-ascii?Q?UujbLpu8MGeP96GndbMmCiGHK7PYb2qq7VsYz1qQXLz2R/++vxPUx6Adx3xY?=
 =?us-ascii?Q?DzqUpz0itu2Izeqp3PPzcNmomg27/RvH+kigIJkP2CA6E0vWZJ5SezKhPySA?=
 =?us-ascii?Q?eyy+AyrlktXEqwyflghSm4LdzNspk5yjUZo56iaAbH7dmsfi8aBaIR50oHje?=
 =?us-ascii?Q?IKXkYjzQ6w4hKJLXUBBu6LIgIG7qDwi2w0j0aYJ/xWSOBfco23FwLjQcssX7?=
 =?us-ascii?Q?wa0VYh3vLkIFxIe/Ufx8IxB+W2Cy/c9gLeKW4SxBcmYj8+bCBFcSONxk8FNN?=
 =?us-ascii?Q?fkzjDBHy5nifh40GPeDrJzvl11K7TpgzYlvCp8AVvJQduh1KdNjg1kP6lCu7?=
 =?us-ascii?Q?V/dAVlI5s8mtGCfZWp/FA9RLFLoLSTF0qTTcYskbeDg6TFYCs34tx8S/YRln?=
 =?us-ascii?Q?xVAdVbqvp9mWkN4IGKGhrYspkHy54RDThCzqNUE5lJ9zoF2o4rGS8Kp9tyXF?=
 =?us-ascii?Q?CKkpqzA24emyo/qpFWNLUCaEr6avu7gEzjb8kqDqqpvMaPygWA73EXxnvyM2?=
 =?us-ascii?Q?BIpEXRSeTg2qwSlg113CCXIrGhz/fmYqgivC6kHMVj5WMHg8ObXsh5GjVgBA?=
 =?us-ascii?Q?XlCzaDi0YBUYDG8ne6AWZEulb5ltYzEo1DPkP4jnrmp1OLq5eVmVVskDF2A1?=
 =?us-ascii?Q?15JhEGzk33ePeqm4VqSSzfQ3Iot2wyju9cEyAjNthRvvIRcayPNpLCK1l3XS?=
 =?us-ascii?Q?xZ8lULK+TZU2N77+z4br+Tq44qw8dX8e8L3DkPe9KXeZEUSCzcVTRttrebjk?=
 =?us-ascii?Q?MzpYrGnjhy/sM793fAvGZJJwxiPBaQWaeGLPtKl6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86296131-be00-40c0-9075-08dcdefd1e06
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 14:03:09.2590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOkUkxhGMB7zeJuTrfYn9AbNTXvXWYWNNeHqW57/9iukrhPEhBwXeZtrgOQF3q/UalF8Dp7Gp7oF+7SQBszFpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6333
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   67ac3270c7aaf93810ea5b43e2bf8361b683718e
commit: 827b6f6962daf2e13170c0185c0f7b51cf74a0ed [6382/30000] workqueue: rework
:::::: branch date: 3 days ago
:::::: commit date: 5 years ago
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409271803.PQA3eNK2-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/blk-cgroup.h: linux/kthread.h is included more than once.

vim +17 include/linux/blk-cgroup.h

  > 17	#include <linux/kthread.h>
    18	#include <linux/percpu_counter.h>
    19	#include <linux/seq_file.h>
    20	#include <linux/radix-tree.h>
    21	#include <linux/blkdev.h>
    22	#include <linux/atomic.h>
  > 23	#include <linux/kthread.h>
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

