Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C69286D70
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 01:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776129973; cv=fail; b=nEVeOwOQAJqB2e1rj9bHyqQiLcqf23NGVYrsxxHcf2tG2bBULOPDkrwCHOMuHQ/vwbCQPK7Qup0fAHoFn19pdtwA4zEP6LXyqsE8/QSkhv8Lvsu6aFj+vWaW6uiPMsea9mG12iDbqr2e1G0TbAQkg5kBBBbdOOdtSk+XWxLoLj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776129973; c=relaxed/simple;
	bh=m3f3bzd9MxlE0dZUQNdspXJ8e7VaUDaPNMSKll/QHXs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=f37Zf1RO8fWHw0n6hkdaxgk/1cQNF2DKPnrWtE43CpL4PlCdEZl7lt0kstUdonpOmfIc2hVp2X6A+TOBvpsh3Lyr7qZwl+mfzOvrG8D8H0FOlHhcO4GACVToXelqNhet/ILE6GC7whFReIRZgti9wU2lSSnEHUSgfxXFwwVg9ik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WE2NmYb6; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WE2NmYb6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776129972; x=1807665972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m3f3bzd9MxlE0dZUQNdspXJ8e7VaUDaPNMSKll/QHXs=;
  b=WE2NmYb6hpQcGLiTbZjmAA4R6F21gxO/C6ClEFQZ3M7awg0Kd7xSTXPy
   z0esCquhq+kPnhRwhWVmV9Kxka6NXDauC/Tdv/TdB/oKjCXlPkJacMdH0
   /XsNvlGjIYf1o7Dac+tXlXtL+cxmeprbP6XDeS3TbIlSjTu0Ayk5IZQ3X
   tqSigSsSKsmPxR510fVsHXtqzhFESVTC8v2lpv1K64ODcgSVQo4iSqSXz
   Y8bmLDrA5Dq2fWak6DbITFJthXZtc1T31+4ntZKECtOLsR8bJKqVIHDRV
   9qqTCnadPiiZPMOp9PkySIEGAID7g9RsPCx1RRespCCgAzmiW2xu2Xy2E
   w==;
X-CSE-ConnectionGUID: HK8lsRc6R0S89S/tukrwkw==
X-CSE-MsgGUID: rRMM3F97QBukVOlBnn3kzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="79660981"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="79660981"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 18:26:11 -0700
X-CSE-ConnectionGUID: Wpukfg4URJORt/7uSrBiqA==
X-CSE-MsgGUID: du7c3f+GRvmmpUj9YblIxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="234336252"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 18:26:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 18:26:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 18:26:10 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 18:26:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFNOnpBOkLnj5jSTA8s+G30kE/5N4ntS9ilWD094Cm3dcI+H+k2nsC7ZDHtxa3zP36RPOsE2QClfuSsYotmhXMa++O4LnsOTX18axzIZ7OR1OuSmVcQnjagsIQ77mR7iDalTt0znuLZBybfCoRlRwTCmFekhT5OTSJpcN9hNNeavlIFfjbzC/cPQyZFJg8iZyL3pgrLPwDz6oqGW06lCQXIKpt8HLT5otABsQhnyhTQ6AQn3lcHzGScNaV2UpbYxjuQYlLT2jHln9ku7exUFa0rQca0UfiP/Tm4RwpjSTJHj2vj0Akg2OQ2/1eIQw8QNp4JNoOfHa1YLQdGkkuIS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vZJhbHi4aQwhJwKkyTk+1p0W+RK8nsD37sjw2bgFuw=;
 b=itmiDBrICWvTpo/kM23HnvSG0zVV5O3+onvKyUfx+APrpjR+m9ku1A1UpAXZpekX67Rlgr1KQ2qfPDKW4LJA/EA9MTrhO6/Vf+O47fYsnSmvvhgL0xDIl/Y2C/dEkKLqTrUjVwOv3ShToV7RoCgjEnWZVvLhzjKVW+h0ul2Auz5vjD6JoJH5MqJCBozVA6cpASG8GfEW1S6NwNJbteitZ8l3U8R8Z9gwGX6u5U7751TeyA2tS+AebvPCasGcMLIkOayNAni150Icm6eEGWx2kuIMS0JAZMHaeFT+uhIQEr5Yf9ea6QpSzMxLhaeVI7tJclnBuBsMJn5y+JAwQoPKlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by SJ2PR11MB7503.namprd11.prod.outlook.com (2603:10b6:a03:4cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 01:26:00 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.044; Tue, 14 Apr 2026
 01:26:00 +0000
Date: Tue, 14 Apr 2026 09:25:52 +0800
From: kernel test robot <lkp@intel.com>
To: Prakash Sangappa <prakash.sangappa@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: kernel/cgroup/cgroup.c:2985:17: error: implicit declaration of
 function 'proc_cgroup_migrate_connector'; did you mean
 'proc_cgrp_migrate_connector'?
Message-ID: <ad2XoFGXlVVSaQaF@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|SJ2PR11MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b9d58d-eb70-4903-29d5-08de99c4c91e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: Xi+FqeRthtnYz8oVjxgJOTQoKNGnHmVpQxUsfaBQdeNcbKXAOKVx/Kx0jfcuLM76Z/RQ4K1RR9OlQq4zF9SQkvkTGK/aBfajUBxfnh189puQBT+NrAe0Nd8OHeGePW9VHdPhRUMBT9QXLCKyixqK/ym6UEge65Xhib4PPs/5Bd15ShfIVnvuAa2NaY3Rczr3lwHMeelsNrKneLDWRehhOZ9vrEB+Zn+KqfxNrYA/r6ySg/m8lZQWdf50Ew+jSf5JAQ379E6AYob2kctPGbrObixWnFPq647DdHRdC8yKea6AXmW6Oi7mimQIHmhko6U5YBOqEno0iapV1/qn4C0lotDMGmu4GzxGPUyDxYAtBDEo4WFC+hbDc82BBuL6L/+gBL48tjYoUmUc1fMAMYE860TnT3EAShWXddIKpS0MNSpXWpl+s4kNCbi96kbTeGxnXUrF+e8eO4rexrv3EWztJQ2HNm//4gHvSv8imvDdgIFfQj1A8V30oQxuLL/au0tpZ8mVkxLscADo+h15NFt2Js8SzwYDF9xl7WowKRolRKr6O+MBrB3V++wKdFRfKxdnb9E9xTOFVaeSIKlwojac1EWpLExMMGCMCqXB9Pd/wRKVaVBQQtwo04SKmQk7A8YC1QbTetArbUOTJ59G7Bj31u6bB8ORjrtl3z7v/ScvIF2GJ0/XNpxuCveNZJLcuHUsy4i+YR9kswMTdClOTe4pCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6F2kx/F9qUjUYIbSJUUkbvruyWNvfZ8fCaqT/3zZs5TRWc1bDGD5ZXSsYe33?=
 =?us-ascii?Q?zswyI6TSW6oE3y1t86ui+vKLYg2Z7Eud2NO+AvfHij6Nc/2Zj//vgK6ObTb1?=
 =?us-ascii?Q?Sp2ZfiOz+whTK2wPOAgRBZHJwt3G/gwHRRAtCFKQLCF+4yfcK3W0huRzj2H7?=
 =?us-ascii?Q?K7+JtLFKPQFrCRVwcMcd2z+Xmq0xSKtg1olhalZqrzkMFdoik6fdcSeqnMmN?=
 =?us-ascii?Q?BGKse/0h/IFNaTQVDHjhoRwSwyCHjcyg3yVRuYZok7Bx3o7VDKXcXK+xN1aU?=
 =?us-ascii?Q?k+KdcsJBFKgpMR/Tqvp5Ye0Y+r5VJrZFLrdG5GDsk6Xpz6MbSOuv582AsUvR?=
 =?us-ascii?Q?+GJGkI13r9/xBDTxukSilsFJApyVd9QHDu8AdYFqMnL67+SRx+EZFf/2ykLS?=
 =?us-ascii?Q?l8vmfIk2rmgfRUt9YP6GPcuohA3MHTnW/ndCtIfb5dJzIx4wlhtE04sKacTu?=
 =?us-ascii?Q?FYEGYfUuPalBveqLz3WTbecjdHh0a7fF5+XQ+AGd0uvw3sflJCS3ycUDzAUV?=
 =?us-ascii?Q?gARXCRX8wYzx1Cs6JoTP0a/IupMCC7kXIMfTdC72H9uuU8leIMBQX2dbOWqS?=
 =?us-ascii?Q?bjVDQf3G8FkFFC3t2vLntXkha8hgTbNkTDMXIGhZ4I56OVjk4hVTOPGGPdqh?=
 =?us-ascii?Q?Vw4OrIgl5rwKt8hQ/uv0TLFbO3nOVs234lerqizVv8o/2tD28zX7sVFel6/s?=
 =?us-ascii?Q?BH9i/rfLth9jHcMrOVgYAMdUNGYluncGcDCtaWcB/CBYJ1Hi91KozOu5YrLk?=
 =?us-ascii?Q?5P6NuUnhO6kw6qHLLhe9/IpUXjKdDscXHgeVjXmoHh9GQkkFmv8MmPEXSYhn?=
 =?us-ascii?Q?m6k519h2ifLWf5seospHXAHtyr/lXdKmDgSdbLWfBI3Xlsk2sMX19+PAWJqD?=
 =?us-ascii?Q?acIXpdZ0VJxgBY5NMY5YiNHop0uDCqzV26oRG1n57Xr1/YfGTEj5NNpCCAnu?=
 =?us-ascii?Q?Vf/HdXj0oslDnD90rsgzfIQOEbEYUCGEmvLczxFqGh54SiojZq58vqHF4wW7?=
 =?us-ascii?Q?swJOYQ6N2/lTDWM2FaTnh7V2ypEFgO4N4goAyT4DQrV0sF7z4sVbvAa2OZ9G?=
 =?us-ascii?Q?SPfGPwLGtZ8DtJg4VZuj5ME2vMkTIyyQvf416X2s9nTwslGOT8ph7Lyy30gx?=
 =?us-ascii?Q?XRFUWq/ql1gVgGQLOEo7eGBHDJW+MySk4wRoZyZr2yjikRct2qonghQG0o/q?=
 =?us-ascii?Q?YLo+z58ukgFv0TUcF+QmszSxJaEhjG8tZcyOMq5CxUeL395PrF+5vDWQQ/5S?=
 =?us-ascii?Q?u4wLmw/vRQgPksTikd1DZj6tKambCDw2kNfxJwtgqPi3oaj7LEj6ZJPiqihr?=
 =?us-ascii?Q?GRoX4QiuJF4pRmpr31y+xqIPSem9CEHJiGwrPKz8lzsMkuidCK+nxr7BfBth?=
 =?us-ascii?Q?H7rCdR+XShn9GQskXMezKG4h2CXzbFSOkdBndmlw69KO4gFoj/pAXwIIzhav?=
 =?us-ascii?Q?SAhbAf+99UhuCJDK2uLTPlin1Q+Gy1REStQhcNk1ZL3bJBLNspVfp/oQ38t+?=
 =?us-ascii?Q?FhHq8uYzFkmg2woWlF/M/aSBamZRX+0Y/bQZrloFn187W7UOyX/tVSg5V60+?=
 =?us-ascii?Q?ZR1R5+vs+XCnqJljY90v/tgUDT8ZXaKKI6yHabkAXgXwGq3Xhj7IMhyiyXEl?=
 =?us-ascii?Q?M4ZuI0S0bFe1CygDrWD1EHyqRLxX8ZoBrCnNC3VdnnQwfEPLXbf0MW6o5obP?=
 =?us-ascii?Q?sSf8DPOpYSp/7SC1da4wY+oQ5ezJqQuv3aOKWTMPdX2dqoC8M0hcnfU7DxI5?=
 =?us-ascii?Q?FMtgEKpuoQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: dsMlfHzAy7eiHdn1yXArCi/ulkXeulTukU3QGP5BRuLXxFoUIHkUQD/McXpawMfVRFUY724dW5RfI4mV4PXNF6A52PfQRmAEiNNsfhpfNNyRMWogCj98balY/AqhMVEvIMVQTKdTH8H4O9A2y/aG6vpF129gC6wf6mr8QZHzEIQEu1JU+dLrWMmnQvTxGFmwhaCdJNXYwbkyA/JCN9hT+FO24wX3eKoxx/jn+3bO6jFZd6nYTchumhAiZ/ndowGBYuKiovCoo1A9RuimobuFxfQk28AjljiFyNKogGY1mL3AJkiDqaSBXDwXiH5frIq5VeCLycDZgB9VR+ZaiWCL2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b9d58d-eb70-4903-29d5-08de99c4c91e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 01:26:00.1442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFJJfPHd5zFfMSYUu32Zz+NFUDDwoUr87dFC5hUwmAekXYP2nFYqv0eP3jpdHkJZnVQ+KFYmmZiwb81hdoo5Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7503
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Prakash-Sangappa/netlink-Add-Netlink-process-event-for-cgroup-migration/20260413-212045
head:   819518d4c1d85b9d68bd1935a28a3a3ee9c46f8d
commit: 819518d4c1d85b9d68bd1935a28a3a3ee9c46f8d netlink: Add Netlink process event for cgroup migration
date:   7 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260413/202604132216.KgzTydzn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604132216.KgzTydzn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604132216.KgzTydzn-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cgroup/cgroup.c: In function 'cgroup_attach_task':
>> kernel/cgroup/cgroup.c:2985:17: error: implicit declaration of function 'proc_cgroup_migrate_connector'; did you mean 'proc_cgrp_migrate_connector'? [-Wimplicit-function-declaration]
    2985 |                 proc_cgroup_migrate_connector(leader, dst_cgrp);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 proc_cgrp_migrate_connector
--
   kernel/cgroup/cgroup-v1.c: In function 'cgroup_transfer_tasks':
>> kernel/cgroup/cgroup-v1.c:153:33: error: implicit declaration of function 'proc_cgroup_migrate_connector'; did you mean 'proc_cgrp_migrate_connector'? [-Wimplicit-function-declaration]
     153 |                                 proc_cgroup_migrate_connector(task, to);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 proc_cgrp_migrate_connector


vim +2985 kernel/cgroup/cgroup.c

74a1166dfe1135 kernel/cgroup.c        Ben Blum                   2011-05-26  2951  
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2952  /**
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2953   * cgroup_attach_task - attach a task or a whole threadgroup to a cgroup
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2954   * @dst_cgrp: the cgroup to attach to
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2955   * @leader: the task or the leader of the threadgroup to be attached
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2956   * @threadgroup: attach the whole threadgroup?
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2957   *
1ed1328792ff46 kernel/cgroup.c        Tejun Heo                  2015-09-16  2958   * Call holding cgroup_mutex and cgroup_threadgroup_rwsem.
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2959   */
0a268dbd7932c7 kernel/cgroup/cgroup.c Tejun Heo                  2016-12-27  2960  int cgroup_attach_task(struct cgroup *dst_cgrp, struct task_struct *leader,
0a268dbd7932c7 kernel/cgroup/cgroup.c Tejun Heo                  2016-12-27  2961  		       bool threadgroup)
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2962  {
e595cd706982bf kernel/cgroup/cgroup.c Tejun Heo                  2017-01-15  2963  	DEFINE_CGROUP_MGCTX(mgctx);
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2964  	struct task_struct *task;
6df970e4f5d2c2 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05  2965  	int ret = 0;
6c694c88255b20 kernel/cgroup.c        Tejun Heo                  2016-03-08  2966  
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2967  	/* look up all src csets */
82d6489d0fed2e kernel/cgroup.c        Daniel Bristot de Oliveira 2016-06-22  2968  	spin_lock_irq(&css_set_lock);
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2969  	task = leader;
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2970  	do {
e595cd706982bf kernel/cgroup/cgroup.c Tejun Heo                  2017-01-15  2971  		cgroup_migrate_add_src(task_css_set(task), dst_cgrp, &mgctx);
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2972  		if (!threadgroup)
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2973  			break;
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2974  	} while_each_thread(leader, task);
82d6489d0fed2e kernel/cgroup.c        Daniel Bristot de Oliveira 2016-06-22  2975  	spin_unlock_irq(&css_set_lock);
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2976  
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2977  	/* prepare dst csets and commit */
e595cd706982bf kernel/cgroup/cgroup.c Tejun Heo                  2017-01-15  2978  	ret = cgroup_migrate_prepare_dst(&mgctx);
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2979  	if (!ret)
bfc2cf6f61fcea kernel/cgroup/cgroup.c Tejun Heo                  2017-01-15  2980  		ret = cgroup_migrate(leader, threadgroup, &mgctx);
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2981  
e595cd706982bf kernel/cgroup/cgroup.c Tejun Heo                  2017-01-15  2982  	cgroup_migrate_finish(&mgctx);
ed1777de25e45b kernel/cgroup.c        Tejun Heo                  2016-08-10  2983  
819518d4c1d85b kernel/cgroup/cgroup.c Prakash Sangappa           2026-04-07  2984  	if (!ret) {
819518d4c1d85b kernel/cgroup/cgroup.c Prakash Sangappa           2026-04-07 @2985  		proc_cgroup_migrate_connector(leader, dst_cgrp);
e4f8d81c738db6 kernel/cgroup/cgroup.c Steven Rostedt (VMware     2018-07-09  2986) 		TRACE_CGROUP_PATH(attach_task, dst_cgrp, leader, threadgroup);
819518d4c1d85b kernel/cgroup/cgroup.c Prakash Sangappa           2026-04-07  2987  	}
ed1777de25e45b kernel/cgroup.c        Tejun Heo                  2016-08-10  2988  
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2989  	return ret;
74a1166dfe1135 kernel/cgroup.c        Ben Blum                   2011-05-26  2990  }
74a1166dfe1135 kernel/cgroup.c        Ben Blum                   2011-05-26  2991  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

