Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AC72DC34E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772114352; cv=fail; b=HkIcrn1W3Im12KdAMqfReS7Cu+va/jxT2L/3shDq7FkkpSTRSapXxGPVo2Ex1HfeNk4Vx5hsXbttiDHmQJGeU4OX7SsYCi+0NNwJsDtuF2hEKt2790TsAWGEcFlfnAvTN/2mXcfBwShecFu3Vaw3uPRpZIaFTt3Ge9/ykZXM8NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772114352; c=relaxed/simple;
	bh=d6bRe976GnFMQG8tPqse/e9zxrO6AjGlwY3oBoxV98w=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ZRDNrFFvFJ7bxOhItxi5nqbU6mQl/Wsys9YixtJgOu0QvCujyUPtg1EqXYSoKxO1OF2AYvLY6lBzQLgp5vSaATDXEAT7nZP+wKLuqtP66zXg5edH5F0CWF4mrDRayWQnWwfjculdG3bhBX0E6yWyhhfMTA88JU7eBfJZfhwc+Pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBIsRRkb; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBIsRRkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772114346; x=1803650346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d6bRe976GnFMQG8tPqse/e9zxrO6AjGlwY3oBoxV98w=;
  b=fBIsRRkbEbukhPpNxg9tb66wd6KHs0pJcbblZGkkv7YunxUwwDkuxCsg
   QpWmxbcTtLV3KDNmZsYXiP3wbqeqL/lW9SxspVZLpGH9zdstH1UCQrMXq
   8opfdTJV/cilkeFH/ytDNhx6gHbVSXq4zZJiWfk1UDPaVu8KEvboiZBwR
   NtHuKOScuNuyvekTaYNdyfiCtunYro4XPaHa06DHMu9AZJ+nBHrIFkCcp
   Fm8GiKLinEwvB/ssY8Eabm3GIOL1VOs+/UXbyjybVZCKeNT7nlbbbWcu7
   TIx9JlGEjefeykIxkmd6wfqCRR7oIFOCuENnt6BjzVztU4sashguNi4zg
   w==;
X-CSE-ConnectionGUID: HQzbIXXmRS24ompwNqnRSQ==
X-CSE-MsgGUID: StWQjsThSB+mVEOp9HJ0MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73276996"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73276996"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:59:05 -0800
X-CSE-ConnectionGUID: a1/1H49uTI63Bmsa7+0erg==
X-CSE-MsgGUID: 02+HOFEDSbCeszG8GYKyeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="254343294"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:59:05 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 05:59:04 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 05:59:04 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 05:59:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5WE/f6DIjF3r8/qpYcYqA89RRtrODQhD3WYrh3/8lmwIGj2lZN2FIXYFWTcp5d6D7vJ1Ggj70uzRAT5YVnVsnwIioRw379B5sD1NfHJzIU7WfXfVO9ap5H3CWU51dSamx1sy6CDLy/BcjQLEi/nklT6OMwdSLSpqkprQrNHtG5Ev1D+d+/yRhDvrHciQfX+nh65AkZsHTNhnQstfg8RAB9ACzG2FzVpfMwESyg+mu2ebu1qy+h47MgRjVxe/sBbThiOobwf5eTYlRkdkPoXAzKQQLq476gLOwYLc1GQJBQZH1twLn7P3UcPwRP94bVw+78ii1XyBXlGhMdVu3CVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvKcF0j5hswmiK8neR0V5BK81tOizgEXbx2PkaJEYsM=;
 b=pn3yR+vwO+iUPkIRMGfOVA3L+dgKAid1KZy4GFMZmhQtrnjYdFMbyii+aUtcR02XKUkyUobvh1ADEjHrHzJ70trvY2UcfXkLcJUxyZr1cGyasTH6XFDFjJIecLVrmUsRCbfu4jlLLjT7SR2lnAAh/+wQ3nrCTMPrzlSUdVh4IHbj9n+MnY8CEuyvqLPR6lFFHVQ45wj3/MpBmpwUguT1Ukj59xJRmMaFDlQt1IfAc+ez28dom8jDUz8nycP0zkLhrHWwl4G7I1kDHEzrZbX+AOFtlLL/YH2Q21VvzthohZB2eBiJNxC1AL1doE/FHcYSxQUQV1oyehTFYsHqTZlrig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by SA1PR11MB8573.namprd11.prod.outlook.com (2603:10b6:806:3ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 26 Feb
 2026 13:59:01 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 13:59:01 +0000
Date: Thu, 26 Feb 2026 21:58:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [rw-misc:rw/drbd9 15/17] checkpatch: WARNING:BLOCK_COMMENT_STYLE:
 Block comments should align the * on each line
Message-ID: <aaBRnHRrDxwUKQ8H@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|SA1PR11MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a170fa-c47c-4b92-1626-08de753f31dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: +EAMDYKnaiVw5TdRTM570RB38CPKT2z2WShbKw+y2eGpK7NXiQrO7WKzBIyE4bv6MRsJnwzVgwt6iniIFP+8nIplA9U79QLFrvHjK0pqXntCESiwMrEIvRxNZUUg4zjS+GmNv+dsmz25XQ+nozxCAcqm5JZJ6HQziRNXEVkfc6M8+6ue9TxH5wkmjmI3iTUFad7CVf9HTfgdECUMzdTmuavsw7rRrBEBVCjCkNhbVlOZPGZr/TV5kdnV5L/C5sgqqxAevs7dXe0yespTbdQHpZZm94mCyKRV1yrW7uT5ZPZIZ7YHFRZ6h1FE7jmZ3LApftuwhxFiao9iW+44DDsd5Y9EM8q0a7RCAp6SsdtDQ7RX0Kh+JaubvNC9L8GAud91YOX2+DZCOag4LzDOA9ZzBZuV2STSJwyClhxMtVfJW+DjIkpcKfnxmMB6ayYfrULhoH41sgbIN/Z0XF7mIYYlbJk1sSlNI5Dg9pfA0a3Q8iCSu6IjsvHmLH5uq/QiydkofA8TSWczu2XtFZqIhvoTfRcWXQwRE3JgZrtabKezVnA/jwm8T9JdjIzjKpTyfZe8BJm7aDbWEC1zh0xKwaYPSihgO2mBRiIOXMsmulwgKUIcuYVY0wiPYfCalkzsRgmd+ZOPyCLNXHyhi81hlgp2oI8LScqb/qYVjjKdzMVCtzCOuWPQ+4XeBa85LYKvH1Rl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H7oIoSiCsd9k3hLVX9twiPipfDYUCqIoHnvBDz15YslgDXtQBpFAG1rEyRYS?=
 =?us-ascii?Q?30ytHy0slFckswA51idbdKf+kc+an6EdvbLHYhGgSp2gBKj1AlGQNZ4AylU6?=
 =?us-ascii?Q?6XjHTGd/UcHpFSunGHFzx1XbOadMsxouB9kn9DyVUjRNYWvNaxDUHQDEyyG+?=
 =?us-ascii?Q?cS3EtH1KQmPJIEalHLxEXnYfwqPS178xY6uuG7dYucvyiamSawgaEvh36AoZ?=
 =?us-ascii?Q?vWZHrXKiFuKeLMyWlzcMatGGjFLY0ScdFQXdlW6Ve/KZexSnrs61kLk0hXs8?=
 =?us-ascii?Q?czyktNHOu9MqUts3Fm9KIKDMGEleC0e8hcXWaYeMz0VBLwKgh3tjr+3MgPcH?=
 =?us-ascii?Q?upnYk1KN1GCb68giyQ6AqCDBSCzNUATNF9Ujn00tLNKe2dcyedTWCVauxlTM?=
 =?us-ascii?Q?to8P/PvI+HuTbKegQF293Hyfz6xNakWKaWVr3J0AF3V28lkDMWfEd9yF+BZU?=
 =?us-ascii?Q?XpvR6bXDKznVpUeEOFWUv9OQyfbeSJx9A4ggEIDz62/+/7kRhzoppoMb0PRN?=
 =?us-ascii?Q?DPunjPs8N8vfpkqFjfancD+1uYJJ32ogid27Duv+2CdqjjzZNWDVvITzpX32?=
 =?us-ascii?Q?77NIrX9322KFa65zOUaPs0Y3/jA95y3MYM0ySHRuv3/IONJsYXAlSmcnBhlH?=
 =?us-ascii?Q?EGVhej0ZOYdW0DnyrnJAdWMWDyBrVcUYCyG54KRYOCC6az2V6z0MirdWgjpO?=
 =?us-ascii?Q?JFKjqXMgR6e8gF1MN+vyYmg7B2HN0YRWxvBdyZugEOg6LXY2fvSxEB4wybgy?=
 =?us-ascii?Q?noaeh9x0K3/NnoIz+ah0M8QLHGuZDfGuaLl7iUa71f2cX+C8yJplBxpIOyDg?=
 =?us-ascii?Q?/3aZmIFPQdep/AhAZ4VDzOWFXW6QsweX8A/7Di9PszUtIoMivGzq6nZyHXaR?=
 =?us-ascii?Q?x4qPaeh44m+ttWY3Jd0Tx3IlU23GokhRB8vpM+lCwGSPtnOX/LRgmfx6uTob?=
 =?us-ascii?Q?U3dBr//i3Wa2a0KJ2PNMYoAc/5dsikh7q7S11lOFH+i03CqFkKGAXpsBkxEt?=
 =?us-ascii?Q?QfzyrD0oOSbC6QGU/n4Lt4mPOU/0hkAO8NnIJhcw5Qmju8FRjCqcQOomHunH?=
 =?us-ascii?Q?2tTOfAxRzQ8gnnSdXk1OUIg+dzMSbNXpTGffD3k8h65jSwEgrxiQ/G86L9FN?=
 =?us-ascii?Q?kRLzqHRupTxJIh57TFZiJi77lzSlzhhpya5rUJijAaLUkO23KFeLTodwCBv3?=
 =?us-ascii?Q?VRj002qTVnQ0gsom5WSIq7Qw28o2wAbutZqKiMfemxoBQNdPBfqA3L2Gd3/l?=
 =?us-ascii?Q?anCiblnkBPKNxWxIN0gm4+hU8xNjS6uZBwA0ZYP/MPQKMlcPyh8x45fbXP/q?=
 =?us-ascii?Q?DQycxyAGgynwZloRPYt4PYU2tsIVpWU6FA8XQLtYpCibuanq/MjSagnQYAge?=
 =?us-ascii?Q?2m1dPtCQPA4rpfqyOqCgmaMzkdDKstvkIGsVLZjdaPyJoJZNMaQ5B2T3jLTr?=
 =?us-ascii?Q?RTF39tCXDJRT/bcuhyUyICdrI7GCMY0gxXgX43KdKOHntSLVHWv8Bw4Pb2zc?=
 =?us-ascii?Q?IvpzvJNPF/r0zkggrAbpeQZAu3G7emALcP1j/eKeMYRLY1VKHQnODHOFMm5l?=
 =?us-ascii?Q?adkKi7E3PAbPubk1ChpRr68FvKcQ+cpvPn0rv8a6QZUfqDZQAgtLduBWX77j?=
 =?us-ascii?Q?RWUmVyOpX+WHtE3ZonhvqYY2NWo9eheWI0lTn954jXW/CXb2hcQkHRlXN44f?=
 =?us-ascii?Q?MJyUgDXg/4YNddrO8Z8hTfgrGY4uUPb0J0rMffa2cP5zi6gAj30EbwlhxuDe?=
 =?us-ascii?Q?83J7uBF7hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a170fa-c47c-4b92-1626-08de753f31dc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 13:59:01.4929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWUkI3cJjNe8w0P/rcDCgSdF3p40vL8o3l/mLeUCiK+cbRwMx63TM1kXc2x1Swll7rrZUd9cIIdrz9XB65jZSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8573
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git rw/drbd9
head:   bf25dcf596c5e954ec59b0521208f284c3e4ed47
commit: 55368ea3466d5360964ec447c01d7f665ae93c2c [15/17] drbd: rework receiver for DRBD 9 transport and protocol
reproduce: (https://download.01.org/0day-ci/archive/20260223/202602231532.1pLyVWZc-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#10450: FILE: drivers/block/drbd/drbd_receiver.c:8225:
+		/* Do not allow RESEND for a rebooted peer. We can only allow this
+	 * for temporary network outages! */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

