Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE6732C89
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 06:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711606735; cv=fail; b=WMAHs5KUW13JspNS8kpDc9Dg0qqfucllYY8bH3sLa6MvtE2McknjA1NjA0tznL3jxxAzZuK4e1ZfSHndTwzu9ibrl13FIjULkR9ElcEaOK7roHlR17zxocRyMFf7aeAuTWt44XTW64v0MBue9uy+A1aUyIhxPKAjlYL53U+dEpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711606735; c=relaxed/simple;
	bh=J02t8V2alJEg50jlBrWJVJsKfpEbs2Jt0TaPhQtpbzg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ss7vG7BJiqqfEDkPzmbcGwDiXd1aa5lTEcUZsKr6bw1XMEBjuJsFrAWbmZ1T/qsuia3fLhGkrjXy6HoxUw+BQ/xCAAeZeZdkCW2V2S086piF3A+HRLuYpoGDGWkqG0sEYTtJrv6VF2GZ2NP5+TDiKqo2fuXqg+E2BXfgsmiPvEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WeRGLLsd; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WeRGLLsd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711606734; x=1743142734;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=J02t8V2alJEg50jlBrWJVJsKfpEbs2Jt0TaPhQtpbzg=;
  b=WeRGLLsdHsPtXJhOKDvAeKYHjf1Mzx0HFPubMs1L7677AbKNoiIyXgNF
   zsLskHW8fuRh0pXseUZw7HevWc2URmM274ttzh09Vm+psfBWBAiukn2Uk
   Vh+KV1u9CAzpstT28WyY9WXN6Voqr/FSipQ9ITtzzFAr9hCI8KPHbq8ZA
   jvB6oUK1z/naPagEH1FLLRvh3uLFsqwn7hpPT9kqFzyoQ7HFalM8hBbfL
   umBf/CFARnOzN4lvk58kuw+MGzFIOqcQhvY0/fLuauUK9jGTGPY1gsBTx
   56tHS2SedBPhlTSZPd0YhAOlcNp1WJWJjuGc3M1adSn72qNqu/Q4OxDjG
   Q==;
X-CSE-ConnectionGUID: 5WLUjDf5SXiHpUmi0eLnVw==
X-CSE-MsgGUID: 3ctXXWMtR6Wal0weKRZehQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="10548909"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="10548909"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 23:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="21257317"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Mar 2024 23:18:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 23:18:52 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 23:18:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 23:18:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 23:18:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3C3RqijyRz1K4PSg1vrEbQtBh/cPx9dArxxSKiwfO54qwIPujGaeN19S4LFEhMgMtVe2TEso/bscq5CT99nK6L5TVwgr1RcUBpFwywLLYbAvo253H8CZ1oOcFZm54PQfzNhjAu/r9qZ5vfy8o2GuEpytOY83E1AZIFMArVJ+dLURuIydSy1ZmYHA8TRC64vKfSnGMZ0JSm/+NuALAOvpplL9xNlLOURdjTA0pZcpQIi2YFKI/2KJQivFYgOBEfGPYA3RCIl0vUqIbORLsnd46zN/lcJt6mULAFH3nj0KBSuL3sBgXwd20SOFMa7RMu9iuQB65s3i7HytMaQHLEgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mC6RJ/IJlGb/WB0jaNI5i34yg9eLH9eBIshCEl8bto=;
 b=BXZd/1Bxn0zQ17m8VDK8RSpmrArfA3BkM4Hsy4WrP9rP/6cBd1jDS0+WiPy92nDTMvp0BbRK6QrmuWUXxSow8jBYJbfAWMziKX90Rp9TXWc3F9EZCvuhwivQnQ8/je8V53ESRC3qQ4adV8vIbW6ib/IWhHlqpBuUbNrNzyz+5nRCTbaAfplin0KNxANPa0cjqk+tn2js/a54nVkBAEejLZ+Vkm+yqM2WJZ4CAgvQrUkGFsBzCxkDcOIyRllTns4Z9fk8peHic7Wpmxbb2VQS7GBeEwxLU7+sVB7aB47hOiupvKDpwRwMFyr31mYkp6T/iIwVc1H6/9dbn5ck5H5eOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MW5PR11MB5762.namprd11.prod.outlook.com (2603:10b6:303:196::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 06:18:49 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d%6]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 06:18:48 +0000
Date: Thu, 28 Mar 2024 14:12:07 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH 3/3] tools/rtla: Use tools/build makefiles to build rtla
Message-ID: <202403211207.MQN0DSRb-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <facb7d2e23dbf5e8a411a9e9d02b7c8baab99b88.1709914259.git.bristot@kernel.org>
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MW5PR11MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d2d1c0-8e7f-4099-1a06-08dc4eeeee05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6lWdkt2MgubqlgEi8qIY+yhnmtIZBmVqsvTdQ8gF7bPCiOhnJCwa/JehuXPcXDIOK1DnUs09F3Lm+3dHmH84XxennbbhkvV1L48jz1CQsSRG+9lAH40016q0sesg4vmEvBXEJoFRKEIYNcq7KME0wwB8Q47MJuuvrIfmD+EpabbdxeSK+3Zxz4iL6cknA3XVGRatpADDcJ5P6/YwNfQ9wS1GXskEhR2YpIgv0nL9Q3d9+1EGs4ViCCdF2WTmGZp5smBnwj/XBFs0KKIrmdZwxTK+TeuX9vt2bmk+RNAOOTP6Cp6hUjsgrH0POaGh3oWWsIQgNuiYJ01jOikD88Thgoh5QJ/CwZd/659pZ+pTc7teIAd2w5ISWufgvbykp9s97UQGXe+xTLyu9sw7cHLR7I5k0IvUj2ycS05/oMtdeKK4oOZ3MYp5eVAmgdiyvMMPtawRX7M/CLTpvtq3EjNKvV+lzZSbQw2YJ1lJdrQTqp7vLBG1Yi5UOGU4BSb/xRhjgHzlgZs/Eimwmod5zUGtrJ0gFxc2MwmNFx6csu6xjm3DVyEwbTSiOe85lJN8jRVstdDQyE6WcvMCAv7arnFeyFbKIq0isSuMm20Ya3kH7Mr2X1wDveZCAlFcYXUrieHQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EeZ0sKYnDm0sY+ZkCuoPICcrq3eAIF1Lmf2zwh01puluDPpyUXOsua62b5QV?=
 =?us-ascii?Q?gncj3Vc3uMjxNy9smlmj8JSbX3zxYsWXJUQzL3AcmFD5mrObvgc9CIEcUchT?=
 =?us-ascii?Q?YVO5qZfqG5Y8NQM8f1BBHkwHGLv7UwNvJwKVUxHsvwa+90SB5HxT4e7Ynyoz?=
 =?us-ascii?Q?QOvWjo2vT/7CMu9ap2kONPiivhf0xiy8cRPIm7i21EvCaQpxTJY6Qb6lJqZz?=
 =?us-ascii?Q?GuLVw9bdkSg0uBVFVJXyiiiPwd181R/UpJjqMaP3u3H7SK49VMoKLKCYV7zu?=
 =?us-ascii?Q?AAdrRWagCr0bwnEUZp07usN6dNniHvdi1g4fX4lHBDVm+v8DU2HMhu0IrW/P?=
 =?us-ascii?Q?U1+/16UW5TZ6k1hA/sZwiMKv+7B1InJyKGgtT5Mw+maxJR8lY0QLEwAXOUhz?=
 =?us-ascii?Q?Zl6M5f1GHV2Nc7EXrx+Ehtyr1N+h5c3sm3wtl79i2qhVThveU35B8HzD9ypE?=
 =?us-ascii?Q?PVe3yj/0zQbVPgB/sh24CGSU6Ws4axWM1QDTTw7tyEvEYSGbTLecEOUHZrSK?=
 =?us-ascii?Q?2JpofcBh4J5dcWppGa9NN1+EVghMQ+AheBtXgiLgpXSJ3vVxTGFj3SPqEE6f?=
 =?us-ascii?Q?NmpmKSYs6zPqDV2HE3UPszGR3e3cdxC8E+MYy+iynG55AzpeOsQXdO1qUsgG?=
 =?us-ascii?Q?UlzcIuna1g/zrBwiu/9cBScoWgNmssA0blKl9AtduWuu+n9kuYW0KlX+T/Va?=
 =?us-ascii?Q?0PUw6UldPf9gEZPd/Ojvj8oXW2lQrh99Z5DNkZDx+ivnw71AL9N20HJHLFQJ?=
 =?us-ascii?Q?1Szv2Nghvo1GQ9FKL8MawWAcXHmM+QyAMv2+gCLjQLqqEtq8GSck/MqtpF3W?=
 =?us-ascii?Q?NMT6rjtAa63TLTqDg55ZOepLfsqrTjBZtwZ/grM/RPtJ7u8D0TZC/63xTYM9?=
 =?us-ascii?Q?7GN6eds7BesgFuMV7afGFBIDHAP+airw0ICeucH32QfsOfMubkyMobWyQ1WL?=
 =?us-ascii?Q?mG1iqFEON6+TCyx0Z8YFPLp6KIrAFlZlIfpNTNafZCAbR8aad9eYu5Tr/jST?=
 =?us-ascii?Q?hXqj7zLR5EBY9Cs65WTh2cEQmE4eaYLQ3qiu2SXIWYieo6MMlazOXOlTVh0m?=
 =?us-ascii?Q?B7wHncEKmatSpge6lATRe4CavqFFowePGt/yy0Osy5kauZXzxlFhSiycgXxR?=
 =?us-ascii?Q?TeBmHhxilVCX6aopw9rxhkbKXypFq/hFOSd2bQeIAerGz7m+XKKaRFXWznfh?=
 =?us-ascii?Q?eoeVUAyGpq4m871Jy52tLRIoGpXQQt6j8q9sIf7kMSK8hDbHr4d50XcjLEGG?=
 =?us-ascii?Q?6U5FECSX8WRQ7znqCsm9+5t1SHGl/yC5cgrJR+Mfa5WLZouyupQYdwrlAtqi?=
 =?us-ascii?Q?Nn4BsR1LN/rbUTjKXDUhJNAUdPyMJxwEww4Wt7qQSXynM63MVM2D775l9cZF?=
 =?us-ascii?Q?LYsDymxTVC9rPyIunpBigBJrBFMBJi6AQ6D43DZajWEuTB0g4LfTpVavFucs?=
 =?us-ascii?Q?tpmPxQTrz6oHEb7Df0GgNJXHQDzzwgEwL79sa9viwKkMoptI8NKLBZKuyqiJ?=
 =?us-ascii?Q?XKMgW2dmpurzrut8i4lwsvhVdrc/mmScEw02a/HRKbegegu+edo4NtKhxHYm?=
 =?us-ascii?Q?HjljnzHnAOLSnSm0U5pgRNCD+qn/BQm3vzszpMYE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d2d1c0-8e7f-4099-1a06-08dc4eeeee05
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 06:18:48.5645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhPxFifNTcLItxmA8HD+nYSbCt655qvJ8oZ4hL8QCH0d1o+wHSQSdsdyCUMy3A1Vl6sUJp5BU5ceU3ez2rFGFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5762
X-OriginatorOrg: intel.com

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on linux/master]
[also build test ERROR on v6.8 next-20240320]
[cannot apply to linus/master rostedt-trace/for-next rostedt-trace/for-next-urgent acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Bristot-de-Oliveira/tools-tracing-Use-tools-build-makefiles-on-latency-collector/20240309-015731
base:   linux/master
patch link:    https://lore.kernel.org/r/facb7d2e23dbf5e8a411a9e9d02b7c8baab99b88.1709914259.git.bristot%40kernel.org
patch subject: [PATCH 3/3] tools/rtla: Use tools/build makefiles to build rtla
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce:
    $ cd linux
    $ make defconfig
    $ make -j$(nproc) tools/tracing

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202403211207.MQN0DSRb-lkp@intel.com/

New errors:

$ make -j$(nproc) tools/tracing
mkdir -p tools/tracing && make O=linux subdir=tools/tracing --no-print-directory -C tracing 
  DESCEND latency
  DESCEND rtla

  LINK    tools/tracing/latency/fixdep
/usr/bin/ld: cannot find tools/tracing/latency/fixdep-in.o: No such file or directory
collect2: error: ld returned 1 exit status
make[5]: *** [Makefile:50: tools/tracing/latency/fixdep] Error 1
make[4]: *** [tools/build/Makefile.include:5: fixdep] Error 2
make[3]: *** [Makefile:11: latency] Error 2
make[3]: *** Waiting for unfinished jobs....
  LINK    tools/tracing/rtla/fixdep
/usr/bin/ld: cannot find tools/tracing/rtla/fixdep-in.o: No such file or directory
collect2: error: ld returned 1 exit status
make[5]: *** [Makefile:50: tools/tracing/rtla/fixdep] Error 1
make[4]: *** [tools/build/Makefile.include:5: fixdep] Error 2
make[3]: *** [Makefile:20: rtla] Error 2
make[2]: *** [Makefile:73: tracing] Error 2
make[1]: *** [Makefile:1360: tools/tracing] Error 2
make: *** [Makefile:240: __sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

