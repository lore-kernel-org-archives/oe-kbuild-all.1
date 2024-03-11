Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC311C20
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 06:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710137516; cv=fail; b=nXKDryhN79y9x2rGpfaX2CalYnJBMdOPGVRbQWvfP+Z+12iDIC6uo/5UQmf1qjZp832cYK/7dQG6UCe5zjrboUhGUPHb/vSETEuVe6ZeUDUVfiTYaBwH/LBi2QNGmBPVAXvi9lCjuij6zLEgpD7PFSOSm8FyMM50CaCERE0Husk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710137516; c=relaxed/simple;
	bh=95kCCgKqzg202aU/InYzBPOx/7Rsf8WOzRPYb8EoO/k=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=MFBFcJTINDBUNAxISXplfFVOtYg9VtIHNQkL1w2+3BHLJBN4M+aKVyqnSlCnt8UevxHTRA/f41mawLKCY8fIoWZDHyMTl9llgZZ57D9eXAzbgJuzKPZKVwAfZ0rQmizryyflOh1DfECBVjWlvnuQOzaSvchoP+ogx7xQEV1uG6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSCZNfuB; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSCZNfuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710137515; x=1741673515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=95kCCgKqzg202aU/InYzBPOx/7Rsf8WOzRPYb8EoO/k=;
  b=nSCZNfuBB/WO+r53XcAQ8XZ+9MWV6DpB7O1f/0XV7IatZ5QZf7CCY3TZ
   c0yExpsOKX5yie8Pg4UYBB4TMofEweDV9oxUrMG7X/VUtz8tgD0Apg//s
   WUJI9/vkIOwHdIRPiv2ltAETK3ObSryuLjHlh5G50KnEXu89ElQhQ2br5
   3YRPS0+NLXx/02M4Fu1v7fqPMOCoud/S5xNT5EXvYFn6dIXjwWtHJZrtq
   pmYMfGNhQZPtDEHiUDC2cs0cfHlVlM2+gsVG6/IyUh8RCtm31pZDjssjL
   cCCg1c2N2GPD3WE3rDcc95Mn5EsMogwG7dtx7p2tdFEyZdBfxoZ6qQnCA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4963551"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="4963551"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 23:11:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="15621757"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Mar 2024 23:11:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Mar 2024 23:11:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Mar 2024 23:11:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Mar 2024 23:11:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Mar 2024 23:11:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JH4R7HQEHWolYD8k7fQIN2Z4jUn7sqmveTXJjIp5CSlIQuI5XZTMJE+42DMfsq2Te43SmhI8YCufkVocrVhOxMqUEyeiVMRDsCYnowN+YsraqheUnbLZcuRRYXjinovzj8XD52cCOa8Ds87ARdCNL6JdM00xcMqOgrojjM7IUoM6ezDgPEtRq9Eav8RD076+onFzGsnqYL8mphi1aRJ1yF489K7Ld5boLJovS9QFj1v5IoUnJYEIQAXQe7/1BFVIqKs4HDTSdirQIWlGv2+gRfG1bYLS+P8D+EFlymlIUu5PEEFGaF8aA3K9kRkRjDec3Vn7MrZIkFOg1miBhZn8pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpdvJjs3GYJjF2+wot8XQkNihD5HOiq6OtVSZya4rVc=;
 b=TtTUzXSLn07KItCAztQc58VB1lKvksAOazYTEhD/ZFg6a99dQbsmCXcBb6AZkRnSW0trzwNk3se5yiT+psRcz6XRlRgBZBV8y5aAIbEapq5Gy7BGxDInIru4jN+QAoYpl3TRG5+aseQhGkwyNH/IRLwp+U6qAaj8GSMPDWevoTX/bGPBz8fpimZsfLthauxCK+Q4Z6/oFrQEBIPFlIACao83ffQKQTBfdp/DbIFzymrNxyexVySIeFkpQXW2T3IK7oE78A0deeNhyFl1hktMPorIguy/TJJSAg7FJ/hdvzTSEx1JVLvTNytS9zIru4MgTCdyUdoKXwMQ6dp6FkESpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SN7PR11MB7592.namprd11.prod.outlook.com (2603:10b6:806:343::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.10; Mon, 11 Mar
 2024 06:11:50 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d%6]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 06:11:50 +0000
Date: Mon, 11 Mar 2024 14:05:04 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Daniel Bristot de Oliveira <bristot@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [bristot:tracing_makefiles 1/3] /usr/bin/ld: cannot find
 tools/tracing/latency/fixdep-in.o: No such file or directory
Message-ID: <202403101227.BcMWP1f9-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR06CA0007.apcprd06.prod.outlook.com
 (2603:1096:4:186::9) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SN7PR11MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: 57bb6a81-80c1-4f9a-193b-08dc419223f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BAAGbTNhbkvo45pcV4CFg8oFmE7uhVFosrWDI8NtGGobSPGZ4rPg7A2TonKzI7N397CjpKFjQC35c9L4MXrPNB9ty2XULojBmk+EuBOunD/e320faw5IopH5ZCUBstkkIE1POTYKAarZqpVkUqmzPnaFIaiY4/5/MnOC6gl14TGOXKlB7x6DxJbiZCSl5+drbvzkzrrpBKCynUscpuu/sDLdK/qFJgIYnc6Kbf7O1Dgr6IOof2n7qT+Mf0hZudywOIRhlSLMX20gk+3hDfU2YEWiBWnnlhVhLzsoLk5SlGdCxPwvfknnPhj7PkRkOSyRYP5/Y9PsHvUypA1/lpL0TgBF+1D/1KZHDPGgwFoEUsHpegDSjlRXP8Adl8QEkNOqQ3Bk9mGPo4N2j4NOkFVR2gbRhMChqQgwAh70fEQIs8NPZt55iBffrcTZJ5KTEMuLLnNiwXxR65U3S9glR4iV6/hYOCMEPRKiZFdos0NfZUjZRAq7RmTXPQmPzFLI7QEXFMMPCYz0MaYw9+ENmU5IfmQXy5tsZk6xprEHGBDJP9Mgskcr+SpHCxn5Stkyy+sbmO1S/ucf1h5dEDKsonAAOQZI0l85tEk5yxhLBDWP7SmJgfLvDKtNFbhbwIr7tChu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZKcDUnJM7b1pQnAGv68CtO43/5iv4mlS5cJGyyOINDxXr3EskbX0t91Gg7fB?=
 =?us-ascii?Q?FV8SQF2fKCucpFS26gDGjg7Ue8/Eu77PAAUzA39UkPOSNZXzHm6NyhqJeMLT?=
 =?us-ascii?Q?cl+R0/YINlufUDavZYoNl7nv6rCtiov7+b7Ya16c1AJZHWXeAKwatUTlSMmf?=
 =?us-ascii?Q?FLTTxSkofRD1+dXWYEsEbNtykGqwcZWL3SYRtvRY4vscSIQQUg1miqW/dfyn?=
 =?us-ascii?Q?/1ErxL5yULGfI4EZnmx+TFW+Z4kiiOccLDfY8sjdHqS5xeqyQANg3ANxiGQJ?=
 =?us-ascii?Q?LXsMqFp1VIqseHUxfD+o+Opa69u+rtwMqBjqk6C6Fk5tpYhtB8i2GN+D7p0M?=
 =?us-ascii?Q?J0OXjHw/cNCMETrXFjZ7qAT/10dQhs7cfaoIrX9HQ/MAqffKffFvWSCUmn7C?=
 =?us-ascii?Q?vN6i3T0K9BUC425+2Jw3q+9njb3ovkof2ZJKbVxQ0AtsJrRy6rOYJyJyYMER?=
 =?us-ascii?Q?CR8tLi8tOQfsr+QeoXDLJyQWTCKvQHbuioSpZaZukpotmAjI9memXnhZU4vb?=
 =?us-ascii?Q?my8OuP8sJEaQzmTmlridcJO7/nVRHJe25rdgBfQB87BZV8wR4MN+MGiJnmtj?=
 =?us-ascii?Q?BTS1W3WmNq8aSIRhkpYjZHcXOrb2DOnNS/nzb3VhyTfCcjFWza9tPhTVxVMO?=
 =?us-ascii?Q?AhPgWp8Jf380MD2qhXsHGBVY4aeOCfFBaS7kW07ulo5psLn/v1GA+COYv5/3?=
 =?us-ascii?Q?PoM8Dez5ge8fBOATe25lFEkyBHmbwCmN7sQOb4tmrlWciLw4WZGUinl/E/6R?=
 =?us-ascii?Q?AVBRh2VtucXa+adyw2VFA09Pzea6NeoTxpfnkkU7Q65cykgoO9hCpqKUxICs?=
 =?us-ascii?Q?d52+2qpM53xFrHdLm6cgLxX5QHv2YP5pTZQQrV28EH3p5mFn8gcn0Aq2D1AO?=
 =?us-ascii?Q?jAl587fu4GP/Nxt6nMlPzNjpPu8cGRVanFs5LH3vQgorFBvw+NXx7gMEX2SY?=
 =?us-ascii?Q?2mTbuSi5heaB/44zm4vPUql5s2Z2hB7ojXBiWe3D6QRus3S0we6p8/DcfVSQ?=
 =?us-ascii?Q?MCgOjfaLRDtxS0VVq/ddBSCmruIcBsIONbp/dmfaaYvU/8XgTYl6RsdKw2uP?=
 =?us-ascii?Q?X56G3GCGyJwM5Bvhgz9zwo5wWUXu5D+V5mA0akUzdJ8tJfQGudUuzENfPdXA?=
 =?us-ascii?Q?x2SvK2d4ae03jWT52wNJ2J/qR4vU/8n+iHzndKsgCprnxOieB+2ASDjBhaJx?=
 =?us-ascii?Q?pUySg6XDrpM6tro7Rr3GPmw8z58oNzfMTnZwMg7PrNkDANqLKR45EM9v36+x?=
 =?us-ascii?Q?GowlUkPSxOoszyVGIBQYm3cA1GVWzk/w5SLRX44Y4WUYebb7U0CNwUVniyiJ?=
 =?us-ascii?Q?sn2OkZedU2Huaq372afgInl+qHILN6rmBqXHPrABbLnCOx6CG0zQis0US0df?=
 =?us-ascii?Q?mfln79YVsXjaK4PQ4xK8w4QGZz5z9kqEvTNOhImCXxDVfqS6GZNYzUuMjRIT?=
 =?us-ascii?Q?/zoqf2NPTrWkJJd7dDPHPsaZBhiJhdjK2U44JDgd2NVNvNTV9yQbpWyCsJvZ?=
 =?us-ascii?Q?W7CPJndVCu04G3XU7oeZMS9m71FEPLrjFfJLOhhl9jqqcaO4rTZFAdV/IqpX?=
 =?us-ascii?Q?W1J3cNKu9FE58RKa0jP12K9ovdIftvD/y4JTYuaw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57bb6a81-80c1-4f9a-193b-08dc419223f7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 06:11:50.5079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NvZ/aAqpEwj1rbFrKTs+wSuiz/Iaag0VlBkvZbYKkM3KQ/YjFdHAi7WpekJ7STt3WzsY0uA0kquG1UvbTK8LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7592
X-OriginatorOrg: intel.com

Hi Daniel,

First bad commit (maybe != root cause):

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/bristot/linux tracing_makefiles
head:   4ab413bca202fe480bb9fb8e6e1e6a556d50b0c5
commit: 6f2b86be6286d91ed5fd8e36ec54e07a908cc468 [1/3] tools/tracing: Use tools/build makefiles on latency-collector
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202403101227.BcMWP1f9-lkp@intel.com/

New errors:

$ cd linux
$ make --keep-going tools/all
...

  DESCEND tracing
  DESCEND latency

  HOSTCC  fixdep.o
  HOSTLD  fixdep-in.o
  LINK    tools/tracing/latency/fixdep
/usr/bin/ld: cannot find tools/tracing/latency/fixdep-in.o: No such file or directory
collect2: error: ld returned 1 exit status
make[5]: *** [Makefile:50: tools/tracing/latency/fixdep] Error 1
make[4]: *** [tools/build/Makefile.include:5: fixdep] Error 2
make[3]: *** [Makefile:11: latency] Error 2
make[2]: *** [Makefile:73: tracing] Error 2
make[2]: Target 'all' not remade because of errors.
make[1]: *** [Makefile:1360: tools/all] Error 2
make: *** [Makefile:240: __sub-make] Error 2
make: Target 'tools/all' not remade because of errors.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

