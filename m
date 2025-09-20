Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409A4158874
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Sep 2025 00:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758328349; cv=fail; b=MAEoizdiTBHH589WvslMp/YQllhSZ3fJHQsAPgGrJ7BPlc28ZPfShabdfJO/rcnOrpQmmhAswzP+eUqEra4PnjnihSmQIUV5msF9FFuU/g4W2bZKDbtOoGb2rclWCNaL7ffndhYRy4fhNIdQaBnGkBYKNVqbM9jB3Q6nEcsYybc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758328349; c=relaxed/simple;
	bh=3PdSprtxnCZ80Nlh63fGaUDXOnKQS/gRlpZjhB8XLHM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=esgCYIPMItM050JefUIjhfNLvd06fbKeAb2GRF4L44qgO0i8UbT5uAvpNyJxNUAYphBREGuxFTcx0f/s+07uH1XRl+xisFIXfRir2uzuZTXPJmXhOGURetjdnxeIyMUNb1PDP4X5Jx7DDGsjwp99toSdetFH91YFfSeNEAwz3ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cexc88mC; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cexc88mC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758328349; x=1789864349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3PdSprtxnCZ80Nlh63fGaUDXOnKQS/gRlpZjhB8XLHM=;
  b=cexc88mC+R09aEbkx20qg6nRUEkUXFCUJ34MBT3vdW3TUD1OF0LZRium
   E9PBNVZ1i+pclN/prJ7eBMu9tbXTjZv0aDdT48ff1CBR2ET45Dc6SvPT6
   qZiFwXXXYMcWuhoygm7LQEIVQ1MjxgGMTSLOLyA90pyT0ZTFjwuNjWokr
   59vBIiVGqSxLzWSj1C3eNhGjNKrfHL+CI7mBrqSPvidM+w/IsSavyJUAV
   IAkmHOyePFMX7BLdKCNxt9AVNkDPvyx8Ot40msJIfEmTNpZs9gGyNE5gs
   r/zZRxOkjyGyOjCKR9m8JhEBTS3mZqQ/zeBSHJEtv67OZm1O0rzpkNZ+M
   Q==;
X-CSE-ConnectionGUID: O7YO4WbxS9uJ/zelHijFuw==
X-CSE-MsgGUID: 1TLCDLJ0Ta6mpN5NS0oOoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="71784450"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="71784450"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 17:32:28 -0700
X-CSE-ConnectionGUID: meUH+OT0QbKYiSeSBcHtEA==
X-CSE-MsgGUID: TX4jLEpBTyWrN6SdVFQJQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; 
   d="scan'208";a="181221388"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 17:32:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 17:32:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 19 Sep 2025 17:32:26 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 17:32:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOjHnBo7GunvwdFrPX4JPhN5H8McepZ7MMyvEk+1hxiG/fAxr61OpPGLBAE321n5ED93ZlEigR4SWwNuvYIIqbJSPSUdDg3QMLAs8nGjXHyderKDNjmvtNqUiXo3ETtcVprZbi0CkaLnbm3ofAm+9wpldpwl9KbvZO8+3/0QzgLbwq3OILm4m2gaiodHMfAWNn3sIewnhYadNQS4ycRm1PZTjJG/OWIE0THN/4FaGdLue136nSZTPcuHv7KLbDOY1sd/tKivw3/nRpvWN4qj82MZ0DAH/AAZfARRf71PtgxE6mXOgLgHpkYn8KxaFHd+nn2CwJYkDd3KgNbqAiQ9VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBAKm8QnjnZdqLQKJp6Vg4lokplfCp8eSjkosKAwjNI=;
 b=Ep+iYTBHh9J+VORAU6zrlAYYcQUu8IXiofO5/JJT35EjmCIFe5+YBb9M2TYFXtsdQ+ALDtcgLrEoNMKkq+AGW7FJmTbeSogWoawZy7dGnui8i0wBRqONJhAi/Nsb+YqASm+YHNWLiFUvEV9aUwC2iCGStjitFkcwr4QIrEmS7BFiqRLizCzBdDN9yMf9g4ROvDpgtG7RHc1VnzFY0nRXJkj/p5oxbPTNETQVQDFmziYVHU3qWrNCqc0HNYfhA3mBmhsSBPy0YVyS2c9m8C/sXL1k5oHSZAGhOmsrTU7diXUQvQNfPErjOUjmO16+PJOJRbmzxipaLRa8/NfIUJBUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by MN2PR11MB4759.namprd11.prod.outlook.com (2603:10b6:208:26a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Sat, 20 Sep
 2025 00:32:24 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.9137.015; Sat, 20 Sep 2025
 00:32:24 +0000
Date: Sat, 20 Sep 2025 08:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
CC: <oe-kbuild-all@lists.linux.dev>, Huacai Chen <chenhuacai@kernel.org>
Subject: [linux-next:master 10249/11136] fs/dcache.o: warning: objtool:
 vfs_pressure_ratio+0x44: stack state mismatch: cfa1=3+0 cfa2=3+16
Message-ID: <aM32EC2Ifz0IsBCL@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|MN2PR11MB4759:EE_
X-MS-Office365-Filtering-Correlation-Id: da58c2f6-3b3d-4243-6395-08ddf7dd2b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GILVevrz8/fThQHMpvT7lUjYpmZuZLj/FACBsV6uim1/IaN/0GfP1LxcsncY?=
 =?us-ascii?Q?mHKlXaokMjhhWGISrzMrzS6MLb62TTJTQ1YUGdn1/3PnOIjrfkXTD/jJ7lTz?=
 =?us-ascii?Q?BCuP/sUtCstTF6nnHc2JkTSxozqaoU1J7qRd2gvcq7OpjSjH55ZIPygnDVtt?=
 =?us-ascii?Q?ZAMbpkJNFl5cEZvPFH6xTg//LcLU7ntiq3IzsBS3y1pKO4pbfntCpqaeAssW?=
 =?us-ascii?Q?ICggd9CgUWZWJO1NeKA/ROKcPWd3Sy6e2XYEwvr6S9BNfrwudavOc2rZHBwJ?=
 =?us-ascii?Q?raarmjzcfNxaQJdUcnVlCxhhzqqt/juE0Vhqw59C7CqRG0zM3iD+VZC99juS?=
 =?us-ascii?Q?L+kQDn/ZH2RqGLA41Fg6vZEyTWgrYksgGbzlc+GfgM/n7js1jUehYNAuRwEN?=
 =?us-ascii?Q?dOQH3uFYabQR2X+zd7HLjTyT+LGjQK3tjpwHA5kAUySzt5Wfue26YyXrBUbO?=
 =?us-ascii?Q?BNHsRDLfXiWt1WeMpX2J0bZ1ixpy3gE+v1DcSF7v3AK36dkWuhS20i4hggk+?=
 =?us-ascii?Q?Ji1Nr30wgPsn1SDLmx6X31OE7EjrgZ/jt10bu/NDxa75yO4v0qyc2MD+V0O/?=
 =?us-ascii?Q?TPo/6TeD9n5ocGQ3xwmQzvOCPaBiszw3GifseZQ7QEiUI0NET/tCcsPaQgj9?=
 =?us-ascii?Q?kpMjJDQSnPl5mr44fc7eT+tlvVKLjy2Z9BB10xafzdQsx5/axpoc2tkynWX7?=
 =?us-ascii?Q?CjsQA/BxemA/UUQv0QdAIRpXaRNne2RF3mKuX9AtlvY1YoF1msR2CF8pOHHT?=
 =?us-ascii?Q?gcb8uaN76SOJHUlX9pALjAP3/fv1V8OdDpJ7NrA8VWDs0vpespfOSu4VOJam?=
 =?us-ascii?Q?ow/7dgHF9d53njGEVdKzm/gUlROO3foRla3a4aKWpgZ3caT2afFFAx9SGw09?=
 =?us-ascii?Q?yTgXSrxqSo9WsngufNC4A3pGYOdjuQLH99yjWbJmtKHfzpYgZz0R5vRs6TF+?=
 =?us-ascii?Q?A/NEgAzsvV5H3edEtGhdhvAKMciV8qznYpFH8WhAj/Y2S59/ugDP4jv3E38S?=
 =?us-ascii?Q?v28Rf0wqXWWqoeiHLzi8/D/3hjY+18R5v0Cb2uq8MUvWeWXcVPWyiVzhorre?=
 =?us-ascii?Q?vTaOXi52FaNM8mfzX1YBUkk2WgzH3vy7bQ61p7bdcRO330PNh7fNkeyvmpg1?=
 =?us-ascii?Q?MKulFk3rQYlFGK/Ct0q1LcLAnh7sJD44K+SQbZi7pzd23Z4rzUTdbcCBIPvk?=
 =?us-ascii?Q?hQb4NDm2f5bmT9WAKt6g/89vmVcfqWPmY7b5ZfIZ8Tzk78VstgIOsA9Ts8z5?=
 =?us-ascii?Q?W4SLxyEwP/S6F1zT2PS48POvyyNEchgpQ6DmIKls30lPKOGQBZsxVlfvFIRh?=
 =?us-ascii?Q?UYo/4zFAZUprWL47uohjcfdDVYym1GUvLAPZEYsS87GT344uN6K4swwLqkgF?=
 =?us-ascii?Q?cQHdloNlGTFPqfqxWN/2rCHy36H6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mvNRtBkrtTBGCeaZNGEOFee/Ix2k+pX964o8AA6t+aARjH0Fx4r8XlfUpWRO?=
 =?us-ascii?Q?vGEkfXTnT7xqo+kVmrEnUCnQtGZFHH4FaDaaitu8adJfV97bhIvX9GypT2Zx?=
 =?us-ascii?Q?P//PcwvUfTpy1UabELMoT48NTYkLkUiG75R/R69oPQ0XWnBOFt4nih6anOtE?=
 =?us-ascii?Q?aEnj2pjHUmqgdCRzIT7M8u9Vboc0rD3COhzB9PGHUowa3oXuK0xtTTWjLvz2?=
 =?us-ascii?Q?7f9LsC+jGefJ/bY18H2piV4hJn0WXTxPw/lvfsQY4VffUht6GI+bdqHqQ0F7?=
 =?us-ascii?Q?XlNTWTQVwaIdG5NDiwI9YW3D3DqLNvFRLqoEgxbSGXY3TQW9+Cv8v4uUn5oj?=
 =?us-ascii?Q?uN/+oK0wcYGTi7DNttYKFSMegfOTUeOjnZ63GaohXzUJju0GaQlQY1FXp3Z4?=
 =?us-ascii?Q?M/Xgzro8auUXVvsHV3mB+9xRR2766+59pT/yhUIVtFYb05Quwhz3CvhEpvps?=
 =?us-ascii?Q?tjd5LLfIQNxlWGvM/IFh3qsdON2dAKR1MDdoq4bZFJ8Amq45AjpL3RtfmaWl?=
 =?us-ascii?Q?oCMbMlF527yvCreQdK/1vzxi9RSGw7kqh77v/LrFUbg9gmOn3RjnLX7aUTrZ?=
 =?us-ascii?Q?oHjPQJKrZpg/8WZCk8WqI9u5Sf4CpDScuh25I9qxheKSIswWwcesqrANmS+u?=
 =?us-ascii?Q?utfKNWO8msc53OrjV9S2DTYo4U7fSBs5hpDXiM9iNgfAPvIznNZDQtM4thpm?=
 =?us-ascii?Q?d2RQXognrK3ZfPU2cjTSPF9HYFO53xE913UXgbYtH+4fJLxYb/2+zcBsPyDV?=
 =?us-ascii?Q?eU2sgGi50mh2lGpt3adivA0TIXfV0vneRaKIQr6kkQ/LHDlXMhPxXQXleHus?=
 =?us-ascii?Q?KP2IZ8JN/ZyXUCeiN98N9aWTDes1w1Uj2wYYQqo/zmg7i8BgMy3Q/5L8nALA?=
 =?us-ascii?Q?RHM4k+DfE7MtY53Tgi1HzyH+Q5u5FPIVvWss1USc3AThvUnCSW3xj0CTKjQR?=
 =?us-ascii?Q?bthGRxE3CEHwwSaZydQWZI1zKGL0LW+JQwkVpHBL2BL+8sibHrF4vGaD9CyQ?=
 =?us-ascii?Q?uTrCup6Limd5b8v4DfhYwA3kfr3DVzzfR/kb2U7fqKkutkgoHW33HDEuJ2Nt?=
 =?us-ascii?Q?aCTOVgXjALGzM/Bley7vyYnqVMw0/GpeT0EokZ/s0tYO9B/x05rh+CmRMPp9?=
 =?us-ascii?Q?cOnFYdc5fb+vW+rumI3WZWGtKTp+38qY8EYWTWw/Da7jdefvmkL7n1ok9Lgq?=
 =?us-ascii?Q?bdJYzl23PD0ofSffUpW0DjgJj+aSAiEogIJZ/ulgKVl4WEPsFobrkrs9FtgP?=
 =?us-ascii?Q?1K/NX1+cSdJCjCL15c6argJmofzRWq67U//WaPJNbCMYsWAnI9dY28nc5WnN?=
 =?us-ascii?Q?ToeAcX3Nlytph1/e3v6v1Xwhnd/ZDjEM87o+7uZu9wf0E6TZp7a3g6uGAARa?=
 =?us-ascii?Q?q60CYSw5vN4GBAaFOvs9VfmlzUtAiNbYnfaP2rWcWHk25l3KHRukLizz3ZWE?=
 =?us-ascii?Q?3Dp6drIqE3roKOJo/nS/HeAo0GsEPW+xTB0ZcORNz0IHsy9vmWKFo/1OJMO3?=
 =?us-ascii?Q?ONImpzpJDfNH0gCi+pjSqzwrT7CK2UkrCxXQN+1hGpOUHJfR62gHH9kv6Y6A?=
 =?us-ascii?Q?nIOEbQw/Cly4tu1k+AnsxgyzqiUzWuEcYo9oLrNi/uw7sOOJntsBc+iFaMQC?=
 =?us-ascii?Q?fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da58c2f6-3b3d-4243-6395-08ddf7dd2b4f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 00:32:24.6479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PINW8b36z9DGpTUhBjKgpOsXKS2/K1MbZPC17/JOFuXWUoJGxBQxPE0dKanOESyIEglPp0C+qMDmnJ/gCDMQDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4759
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   846bd2225ec3cfa8be046655e02b9457ed41973e
commit: baad7830ee9a56756b3857348452fe756cb0a702 [10249/11136] objtool/LoongArch: Mark types based on break immediate code
:::::: branch date: 5 hours ago
:::::: commit date: 32 hours ago
config: loongarch-randconfig-002-20250920 (https://download.01.org/0day-ci/archive/20250920/202509200413.7uihAxJ5-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200413.7uihAxJ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509200413.7uihAxJ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/dcache.o: warning: objtool: vfs_pressure_ratio+0x44: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> block/blk-settings.o: warning: objtool: queue_limit_alignment_offset+0x4c: stack state mismatch: cfa1=3+0 cfa2=3+16
>> block/blk-settings.o: warning: objtool: queue_limit_discard_alignment+0x7c: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> block/blk-merge.o: warning: objtool: blk_boundary_sectors_left+0x6c: return with modified stack frame
--
>> drivers/nvdimm/namespace_devs.o: warning: objtool: div_u64_rem+0x2c: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> fs/btrfs/zoned.o: warning: objtool: div_u64_rem+0x2c: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> fs/f2fs/gc.o: warning: objtool: div_u64_rem+0x2c: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> drivers/md/dm-era-target.o: warning: objtool: era_io_hints+0x74: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> drivers/md/dm-stats.o: warning: objtool: div64_u64_rem+0x28: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> drivers/md/dm-thin.o: warning: objtool: is_factor+0x30: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> drivers/md/dm-cache-target.o: warning: objtool: cache_io_hints+0x4c: stack state mismatch: cfa1=3+0 cfa2=3+16
--
>> drivers/md/dm-clone-target.o: warning: objtool: clone_io_hints+0x4c: stack state mismatch: cfa1=3+0 cfa2=3+16
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

