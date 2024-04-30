Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8284112C462
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 13:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714482683; cv=fail; b=nZOsLNoTCZsuYXDGxOCSEYroJ3oCCSI2jHUNs/jXYfmcGpQ1DA6/cfEPRRFunfwKrxo3hY7arZZ0eKGKLeKNRCUUk132Avebz7HwpwHK5yVsw849OygZy2cSvSk4V8JokvtxRx0ZZf5GsFdJi4+wTmOmGXwBlzRe357Xd/3rsPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714482683; c=relaxed/simple;
	bh=pe5rTExmxA/BOCeBhmKHvb0n/5RakRi3zOG91++eSw4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=X5F7jD6ShgTL4KVG7qgRUE1b6JTclgQ7d11IY0jE7SwQDRUb0UgShHpEFdjkR50loGbBAB/Kb8kD+5has6yqpCgQ+gvR+SJxh6dhCy33jLm0jIvZpiW2ADVbqZ5ku/ibF2IblJCgAll7VdEXEYQDob0ZjRukm4cdt9TdAHhG8To=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifMIaPe4; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifMIaPe4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714482682; x=1746018682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pe5rTExmxA/BOCeBhmKHvb0n/5RakRi3zOG91++eSw4=;
  b=ifMIaPe4+7lv2GGRBe1ymSH1f/545PmXmjQdUY3ZqUBi9H9KSzjHrG4O
   NJrswV5haUcQShr7Y4BLZmpoE0XBVYuqfljW7QzDJX1JrUcWSKyDuV3S7
   e3WvyVYZwdQ7eXWL3QOwU1xpSdYVxiWdScuP3jeSMyj5SCug9guj7/AN8
   F2QpjMva1a/m1oOnE5o8JkVMXrx+wZMYMySC7sqfy6zct5WkINQWevJrv
   3iYwiZAyo5jpcKPwbKld6kvrlazIYMFnSgmjLs9U25PRvEvkJM+WSfK99
   u0kTn9Rhg9JcKrnrK92d5tLvo8t5XZr0u7+joyRdxbizniJ1Q164zGaVA
   Q==;
X-CSE-ConnectionGUID: cI/O3MNyQOiHxqJVtBN6fA==
X-CSE-MsgGUID: gCk+rw3yQ8uxYUOqpWcpow==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10409269"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="10409269"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 06:11:09 -0700
X-CSE-ConnectionGUID: HdWY+GcdTCCvOo3URcUyKQ==
X-CSE-MsgGUID: +2W2dfI0SMKUyQFNlpqZFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; 
   d="scan'208";a="31259722"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Apr 2024 06:11:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 06:11:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 06:11:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 06:11:08 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 06:11:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3uOLnXY8GNP5ApQkCpFuR7W0W3VSw1Sf1gWlOwJjQKcI9wjsTAdXRgXCbl2gPKZzM08FoUoigIolXZpc4wIyTprj/0doR2IEsfGpiVcA5c//zE89OrATZFpfG6UPx6FO4liH/HfgFu5iKVLibadQNVFT8dl9GvdNjV0qPooRPsa+RvjPAWsxZG5hHR7vlBMoBeYVhxT3nTScDzB64tHh2LaOh1518tRZIr8ESktXTAxXxWaRtuPKo8czTh0C+rTPirAl6pr9R0YBo9+KzcskvQ37hzcNuNbpjHLIr8AlhaEMUQbmRyo/CfRBJCxg5MnOlhVS5uevTl2qqT2ZLHOag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iVjSHmvGwUPt5iWrwEPV1hfQaTvyt6jcjGiTp+EQXU=;
 b=WsueGs5+6Dw47j3Uz4Li7+Mf8Hdzv8UNJDTjNyF11S3EcN8BvsSGrbYXptkkTAz6siuMGn8e6FUo0CWFcP86xeB31/Rb3qU24faXFaeAPpRhxN3bpZUp28pbfpKw91d9UrTM+f9xDyIxxyYhvujBY41vl41W/0PHaUz0SJx4eUuldDFOOygJIK9CgTdmlrfm+Fx0OpLejE+6mKAFbY1Hlqqd7tTEW1scK0fcox9lQ4Ev2ke7z/sBpbnRPF8P5wiVXSZ/WxlpxippBum356zy+xIfxKBsojSO13MrSLCzC78hYKXgEBm/LoQynyVoygUGVk3rnQ/KyfcwJ7g6C2vFMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by SA1PR11MB8351.namprd11.prod.outlook.com (2603:10b6:806:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 13:11:05 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::35d6:c016:dbf5:478e]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::35d6:c016:dbf5:478e%7]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 13:11:05 +0000
Date: Tue, 30 Apr 2024 21:10:58 +0800
From: lkp <lkp@intel.com>
To: <kernel@openeuler.org>, Shuai Wu <wushuai51@huawei.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [openeuler:OLK-6.6 7604/7622]
 drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c:
 hinic3_hwif.h is included more than once.
Message-ID: <ZjDt4gMqSiXH83Bg@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|SA1PR11MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: b299960c-8457-434d-e93e-08dc6916fdf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rpdrJTWcgUbKBlEfbC7zcC1h6KtvwXNJJCwXykTTwNu9YRyKRVBsdhqKLmFQ?=
 =?us-ascii?Q?TXvzchi7nzl738B0edp4OZkCGAgMr3ewRCPbJDELLcX4LvYeGMEMuq6HxajA?=
 =?us-ascii?Q?3GDo4ML00rnO5RTrDfySQSHd9H5cSW0YR4Pq4fItM2QWn/dGnX1Cb1khR3p0?=
 =?us-ascii?Q?j7dVNaYVDewOQ2Sze7uUylwkClayNxxh7irdsb1JqtaemFjhW4tl4l5O34LA?=
 =?us-ascii?Q?QeHE5jk8JFkDCs7fc04A9cVTotC9rHPdL8bS+kx2jOOSfZG7AWqxPPRYwVpE?=
 =?us-ascii?Q?DR2ELj52DdGAqn5lm10y88KYD/SvmNLOvyb4VtYtEF2SH/rk5MhRyk9kDda1?=
 =?us-ascii?Q?6vGQtPeB3IRuXYFPKmX8vM0ck7ZcSHB9In6CBK8nah3tPN95JjQpQlwdoLdS?=
 =?us-ascii?Q?926JOjti0NPAePiZjv554Mwr9tdhN1vMhEOCgyyNU87/emR/umFdhms7lws4?=
 =?us-ascii?Q?M67DlndiEWt/lAJHZkbWf92D9w+yGAXewJt2AhUXKXpXd4mTOMXuo7o8sT2P?=
 =?us-ascii?Q?4Ceqy41KtBijVPGqH+mq8bvH2VbF9BMvdKMs9TDG8JIzfvYeKVEE9ZiHiKlc?=
 =?us-ascii?Q?Iybkc5Z6NrBpugF/lNjwhM1DfavmMmbF6xCUfV5UnhfJ5PolaeYcNv1836NG?=
 =?us-ascii?Q?RrJJmcTfSV5xHspSkH/y/seqSEvJHMGi4St4WCZ65SrQUzzMD9+Wi1got0Uu?=
 =?us-ascii?Q?WYZcfhC0KQoRjnhHg3JHzj3cCXmM9i/mQIiin8CduCFF0ifq5K5DFc70VVlx?=
 =?us-ascii?Q?VYV0ZrzeIXaFyvTJUMe2x3yF1WRh9TEgpomq8wDxdFdLA0MSq28dNfrRsELJ?=
 =?us-ascii?Q?omQ0dn124r8uOdPjE4BKyq0DyWPnanWz1YApqtivIVdeMjNphy8Mbf9JkNSY?=
 =?us-ascii?Q?dOj2ZsCJs8mlxjP2z//4Ys3igE0gf3s4ksBT3y6pGoB3oeuLSIuDVgxVPuEz?=
 =?us-ascii?Q?HMBZqNuIPkiWPl51/9RVYPuYdmX2tuJLcSxLp6Vjcohl1WUuN2s732DtKSPj?=
 =?us-ascii?Q?mYJMFn2bLEtDfNV1OTaHtEB4NF4mIqFc5Iw7ivE4H6Tmar5HcUE2qbVyT7ZU?=
 =?us-ascii?Q?/PlswrT6M/eLHk6ENjIExJUcG86TFVUkeFMw72BVCHxO/EJFQXGS4d/so8dq?=
 =?us-ascii?Q?2TaYRo5Tw7uz0riUT8h/3aSlDd2N2S9xzFYdFuzgsmq7O9dpibEStlcb1kJ8?=
 =?us-ascii?Q?9UBGGqEHc18hkI8RiGlsoDw7jLEikv6Nkg6ZWrlOGpv1Zwluk7uLLEdlM3Q?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ArLsXvMhI7SXKgOuf8EqH4r0N1vXgDC6s6Joaw8TYzmumxhO0LJNKaFHhMLB?=
 =?us-ascii?Q?mBiCVv0Xj6J4vvq6jiunZvwha021eT+kgQdQ9Jn3kafOZ4MZxc3DC1iN5eyn?=
 =?us-ascii?Q?DySr4Nmr4xxYPMezO9u+XdKE6Lfdnql4FEL/YYgoCoaw1Wyw1EUSBantVX96?=
 =?us-ascii?Q?T+yULA79cwtreWZk9esraiEKYm+nHSzYkmse3LT5bfAoQOk3KYRfeo+pVWWo?=
 =?us-ascii?Q?gNDKIqaiE8jAGcdKi03PiNJcV4rVtKHDR6YrcdZePZY+DAln6DZIUkmTCOrE?=
 =?us-ascii?Q?ZIXxGVkWzCuUfN1KknHjaF+57bekmgpQHCoOONUsqhMRJKb7YW6HSmvHqYmI?=
 =?us-ascii?Q?YTvyRcd14cGzzGZasYFIDOjcIf3cbgyzNGe472tV/f+7owxpKau6hiSh+Y5r?=
 =?us-ascii?Q?xaaqiSQHU8v+YnJrXZV4JeBS2QMfRLkpXM2ENLy3DA0gNs3YDbyfjx4VBhvm?=
 =?us-ascii?Q?7uNBHHwzD4MD4lwtxwSqR4us5f7znrcWLh9Kj/bPIySCAxPKpLvo1NrB2inG?=
 =?us-ascii?Q?n7q+bZreJ91FDeKEfW8quXuOK/POvsaOZIDdHnPkmnMdwqeDM0Wy4VELg2UI?=
 =?us-ascii?Q?fQP5o9FyQeGSOpGhh0GhTpnyCp27LHnjQKhXe/as6vIImPXh9MsgBLfk/00w?=
 =?us-ascii?Q?9+zrLHGAl92wLyvv4vbH0do7oppOfl6NSl/JkJ/SYVLdnF/ERUvsNBPnsW4c?=
 =?us-ascii?Q?x3gL3gdZCZ1bszowZKjlCaBOhHYNMjaT5BAUsm0gSid2se106sF45WMMsIW8?=
 =?us-ascii?Q?Rcpk+ANUW3uSvJwGJun1e4bNakSMhiTovfvMC1FQCGt113Bv0/O7GJygYWbn?=
 =?us-ascii?Q?9AcONQq3Cenjr9gYE2cetonysP2YsptFHAnwvZ3p1SndKnjfc7QMJS1QwCNE?=
 =?us-ascii?Q?S/Uo2S83VMp3UsJxCG5A7eexJMzxgX2qYPM/Q2uot9OhSJR+nJsaNZHYTXGh?=
 =?us-ascii?Q?4otdgpROJcDWJkkl3KjhpmkHtXc9eR4z8tdzMRrcie4rFEOhu8jV2fiAG6aI?=
 =?us-ascii?Q?GZpQQK+Km92Xj/KRudDot3+YQ/5C+zqwYNzVmYwaoIW7QEf5lobhN7n/hVbg?=
 =?us-ascii?Q?qKHXnUEbl7gjcMzR5Yj0R7tCePl6cj2mx5EErw1AJLgjN+FY0mME7ewMiBSm?=
 =?us-ascii?Q?uABH+WybZXKIardm3i5CKYhFAXn3VL1HS/equXZDvBd03jWIe0Nu4DAuxrfr?=
 =?us-ascii?Q?+seAward715RjFb8e0JmN8BpMdz6XFNuYbG0ySNXZGjrs8OSQUXOiQlwtOKg?=
 =?us-ascii?Q?Y0IHaM1SAJcKai9ZfpocVP1UCflfY2FIMoTPtztDxo4hok4+LaxHLQTcHDz5?=
 =?us-ascii?Q?iEz1O6Jm0Kl7REWBF9SJgBaEuEAArx6I06WInVjRz3AD70pdasRixvWijPS5?=
 =?us-ascii?Q?iRW5iLfljcQM+AMNI0npHBUq5KJGeW3jS/ItBilBC2PSAFK1I08d357kgAma?=
 =?us-ascii?Q?ZXh9kD5mIsujT0UXVfCoEdcTVc5FS6vkPZ2xaMIw7djGHO3AnsTet0gLo1Sl?=
 =?us-ascii?Q?mdjUEWJT/ea9mfWOSIYwVNm5vNB4PipkjjZerSxhwtYSx+enZtc8eksb3DMN?=
 =?us-ascii?Q?UYVd3lxN/w79lWu8miXNCfCnqaKVUKFcjiynHjePgatjZh6PWpNlDc3irLht?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b299960c-8457-434d-e93e-08dc6916fdf3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 13:11:05.5794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JWxrA8cf2TX1QDMcG9E9w5AkdTvqhbyA6HnE2DT/oxFNSOsxfEd3KkuSjw1KTKwR7Ky5LQgnIqvpHmqZmRuTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8351
X-OriginatorOrg: intel.com

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f120c2ab14341c60bcc055c700c0a29dce5837ac
commit: 4213ff7957de370c1cfe528c2bad1eb2e499038a [7604/7622] net/ethernet/huawei/hinic3: Add the CQM on which the RDMA depends
:::::: branch date: 16 hours ago
:::::: commit date: 3 days ago
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404291225.3zIqKn4U-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c: hinic3_hwif.h is included more than once.

vim +19 drivers/net/ethernet/huawei/hinic3/hw/hinic3_multi_host_mgmt.c

    13	
    14	#include "ossl_knl.h"
    15	#include "hinic3_common.h"
    16	#include "hinic3_hw.h"
    17	#include "hinic3_hwdev.h"
    18	#include "hinic3_csr.h"
  > 19	#include "hinic3_hwif.h"
    20	#include "hinic3_api_cmd.h"
    21	#include "hinic3_mgmt.h"
    22	#include "hinic3_mbox.h"
  > 23	#include "hinic3_hwif.h"
    24	#include "hinic3_multi_host_mgmt.h"
    25	#include "hinic3_hw_cfg.h"
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

