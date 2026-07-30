Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271A03A0B24
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 04:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785387542; cv=fail; b=WlBqIOEDnLLlm4imPS0BYsxt87Nj8y6VDaN6hWMO73QrxCSuAY1K6V2ehIxbKo7tn478dRC5O/poghcsZ3KErKDhFu2OtEhn8eb8mbSapy4QE6PcfU31u4ZFCT5C794s7OIMYJIyUSImkm3jg0vvqsH6uCfeCUIMCVoHZR/Drgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785387542; c=relaxed/simple;
	bh=xsnBb9EgslGePMc7aP0+RJOPwOuyBawB8/V8Z3pYubo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=d9dyWL6kCjpKX/FqpIMOioEEiFCpDEz8+PI9IDWs2SQRpS+cK0BE7O/PlbO5QRh2N3yob7W6mP0Xw7+6r8raNcCnJK0vBpT0eRJ0G+CSXBLnEnx0cl2FsMpmALBhnIbEjYzDiIXuOZfeTaQtd4ZoKMu9WudWh5glROYvSgTCa04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MpV9ThaN; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MpV9ThaN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785387540; x=1816923540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xsnBb9EgslGePMc7aP0+RJOPwOuyBawB8/V8Z3pYubo=;
  b=MpV9ThaNrM+j4d9W4oQ1aS/MKKbhL0l30U7Kxp/YS7bFqXbFpUJOEBje
   7G/oQJli1CFZF2cZhoCncvVLG3ey0/+nwIV4KNdMgUbaggAN5dO7Ju91f
   bynnyzuAQnspPhlnUSCyeiMOo70mNqBxqdCS1h1t72oOISKxCY5holnU4
   iE3TxHPuW7/uKGnJqEkeDBNsWvEkM8Th+IRa1XL0shYjFcnFB5XZDfrum
   qSFh6LeiGz+ZAZWndal4uKQzGGmyjcv0/wz7TGOul5X+05V2gFZBrSP5T
   Vt4mv2HWD+cL1H8Y97TtFjJZLO2BUc2iihLFkeNPPeBxAkq0/aOAWqNQt
   w==;
X-CSE-ConnectionGUID: TwKX97t8T5ab9M0EeqN+pA==
X-CSE-MsgGUID: SBSZOWHFS9ivmEHy7CGMng==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86037133"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="86037133"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 21:59:00 -0700
X-CSE-ConnectionGUID: B2z9YzkaSguv7Zb/2vYtfA==
X-CSE-MsgGUID: c4xGkLAKTrK9vM6AZYU70w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="264013740"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 21:58:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 21:58:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 21:58:58 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 21:58:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgHxR/yaVt2p8jAc3eZHI2evSqs9J0Y3gf14E0F1cu2NAinZ82TnghAbP674thXPPLsfFYZgIzc04xUhUKwHHG5dwqa1ZBY48HybteipRjXntY8HammHa363Jnvpgz5ZaSAVpRRDv8wgSLk6aQ3/n/5CfqN1slEwHRRW70VzbJfnMPQB7u4auJvda+uhbJM0tb+99VGTpklLQw34rrYg2IIgZCCwZWnAeaPeXSKdRfrsV+Z0p9KBXEgzUENzBa0FMZ8EET0hROEZ7L9FugvAnGpgdJFVtnw39FkcCsU9JMFmzyqU1af19mMrHzvE4UrhrFXFt9WDRPQiEQXrBtGayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3qk3GU7kJW9UvGcWQmKfHW63Vpj1Chmh1wy392nwIo=;
 b=CSQoe4+mheEUKDyxXdyVuZxLMtVXw10IkfnPmp+y/1bZu0uT3lvdauyC5LMsWBNmZg2PvLdmuFy3gRbXVRWThFU1evr6KbWK2vZIHjylryMG5wwjUEd72Wg6iinGBZ73wX89CyqkaWOsT0j9wxPzX/OXyeHsgP3tDtC+uHo9ecAwoks3EVp3C3wm8XfaVywEZWBGJpy5NNoL2YWByl5oamA5F+FfBdCkgO/GCGaffg37VPGpyfDupq18Bx1uY+QkFkopcp2EhORPb2ibg3TpWKg3ldRcuOjbEjZvEcqo8AA4xJFCvnivADtPQnNN3N4INeGs2kIbIvO0xYzfYOYvUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MN2PR11MB4679.namprd11.prod.outlook.com (2603:10b6:208:26b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 04:58:56 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 04:58:56 +0000
Date: Thu, 30 Jul 2026 12:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android17-6.18 4/4] fuse_test.c:1400:9: warning:
 argument 1 null where non-null expected
Message-ID: <amraCH9A5ow4UmnI@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MN2PR11MB4679:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb7415b-0a55-45d7-54e2-08deedf74252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 06n2Q1uRxeYyRkziq0PEZhJE7S7PYwsZZWGbnwyo8xXsk4VzprtQNpgHGf+C8LSiYQcboKXJL0/JCsOFFM1EmGJ/4gcFNQDp3XuZu/UrpJMkCGDVluh3Z9z+qD6e44gU+3Yixr8N/PumzCALvaNRdZHFrtSJh4Ca63dDmkYAo/ivmEpJD2XEcMJh5zkLDRUbk5buX6BXHlfWvAKNep10PKC4coohGupemp0tlmRdb+MGNJoNv3HxR+HwFHGYF1qONa58K7cFWkHOywHAYjNwY9aIYir3EcTjBOaUL+PIJv9UxXFtAWXZ0OovI1WRVZvnNQSPT1CBLwiyTXFzHBHrd3N/s4hYUneVoXayjQa7YvLTM7XEOc2H8v2rlmFCyxwdgI0EkRMsqTUrp3eJEx0xYLIheucUelIVGtTyAAB9Pd/gLzpdCazxn/gEIjK8is8wFPKjLCv0j34UTPNKrM8AHDuI/Rfvc5qzRi/fPOequIYNZ4HVw1ZHI51gmw2HPwWUp4KFBgq8PIcWsfbCdlt4HIcez4DSpAAhNc12alK3H+moDgmRJSYQFw3iCuWPWaH8Y8EhiJtomuRFbeHMVlb53rzz17LHyT2dBJ//8CIV1gMMmAD3OS/AeWO56exAcg4PN4jujQH8jwWOMSg4u9dIL+j9qQ1mjOvpgxUks3j2Lbc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d9sCW01Ij5d385fYJiP69FrR1F8u1ekJ8BZ7o7eozOgjhMR11CKEor5vQZBJ?=
 =?us-ascii?Q?1zUSJ058fX/qWm0dCbHSPtngLz9/DdcD4a1L/Y0Pc43D6fAEw+oxqEaibOmn?=
 =?us-ascii?Q?n2ra16hxyhaQ8qYWPv9ZrGOBztM5gG6erZL+E0vw+LLqc4MP3eeHCn9Fq/f0?=
 =?us-ascii?Q?s8XRUY1gSyzN3G2ZfBe+s74wL9qvM3tCJzY4cIKMQAY+fHlW+8FwuXETSNwA?=
 =?us-ascii?Q?v23Nnq2Ae134XBNm+QpoMOkAeOA3OQSzmMQjRp1dw52kbX6QQN6S+NnYzQey?=
 =?us-ascii?Q?S3KWvWz0QZp0H7q86RbXEYRWsrtDUhc2KP56DuB33r8dd2mT6UyiMMLC0o08?=
 =?us-ascii?Q?9rJB+xXh4fV1DygkwYBHC2x0Y7hq5CJWSGXxlLChNY8eY9a3cKu5ZLAENHuX?=
 =?us-ascii?Q?MYHQ9kZv1bdiAgan6mLZx/NVAxsHUvbkRwi0m5g4QFsZbOYhURbeSS4+FjWT?=
 =?us-ascii?Q?0Q340AD+YtEgl6mLcBUhNdqW7hdH9EngBhtvIZswP+fkAT4K5nM4DFB1Faqa?=
 =?us-ascii?Q?6qYZQzTM8CIKM1vD+frcAc6xioUmGkGiVC6IDLpHJE3KDk8aSPCqPRGl9DFq?=
 =?us-ascii?Q?Hi59rXmzM/3IDIMn47eYJ4LuEq6F4tUHhfCtT6Kku0EwcAogh4PbWQT1S0VJ?=
 =?us-ascii?Q?ta1zFX1GK3xuoajnAbY0nZouE9wkQYXRkIg7w6e/strwW1IGbQrYzJ00Y7wS?=
 =?us-ascii?Q?zvA5fy7a/R3ukNhGuVbrYqHErTkgiHs463+b5yqth7vIGtJdcyzi48dXOKYm?=
 =?us-ascii?Q?7zCIGGXFzecut2MF2AtAe1QJpAjMIQJy0ZTYSCp+NYvQXeT01qZIBhI9GP9m?=
 =?us-ascii?Q?5nrNihGckW1YUSjoY0udJpZWqr3lx3cG9pyqP8EwPBtChs3+H9eJq2UCiJfD?=
 =?us-ascii?Q?DP6IkhTEPqLgtXB7LEDH1pFcnjFmdLo2E34uXT6t6hyI8QeCdBeFVQE2PqM/?=
 =?us-ascii?Q?cWEbqh9BvuX94bY9iyL8Rov70NlJ0lcRnnxpc+VTAAldW+NFx0qD9mtymjAG?=
 =?us-ascii?Q?inrijY8IRrSedM53dlinI8vlhpPgilyJq78Cbba0QkYMIGwvhQunZVxtZoJN?=
 =?us-ascii?Q?VgfZsU+kgDUrRdt51cZkW8mp9/rJlU2w51xlZVpHtRNn8pbQKX/7ACWFP/qb?=
 =?us-ascii?Q?fB7D1veJBaCrj82GYg6V6gJtW4uRwD2NvTzHo/j3E9nq/mPv1F9YBCBLyqQ3?=
 =?us-ascii?Q?C5ubEpLdktHXKlsoUxtIfcGgBEIGIXoCERChIJ/t+b8WzMSLmJBZy6QzOBxZ?=
 =?us-ascii?Q?1SWeN9u1Xj4fzOs6zU4MTajRn6y5K5xrePEZ7MkII9pj60xS/wPoCRgXPDek?=
 =?us-ascii?Q?CPLR+6yGPe+kymXhllcOCPJc/BDF8zvMtnVY7jDnijXtsh7PnAPRVJ88dBJ1?=
 =?us-ascii?Q?po8sJAIO9kSVfGYbgrxOpyReRXRVqb9NP4qMsh81xsVWKaMK6WmLYAEr3vvg?=
 =?us-ascii?Q?jNFSnbmnjjGw6rJcWkPhJYutzTQ4RwUFpVbOPkRkuDTp6mBcbnnSWCk4jIlZ?=
 =?us-ascii?Q?NbB/ezwM2RNGg9yPYdL9jkdvNUJRH+VfcZA4aq6HCSwfiZ+3kCiKQUboJyrc?=
 =?us-ascii?Q?KJyroQcmlF9Wjmh+dfocYBbXEgxyLnpKxrnB2z1TqbOmKauZxlqaqMVmHcvp?=
 =?us-ascii?Q?jrG9de4FzjpnctYY4TBmuqyyUaBn3+0BHXe1KrbSNeSdrfEmRAipkf8V14KG?=
 =?us-ascii?Q?M6ZnywyE4ogyY6WnrwC5BpRDHTcBcO0y9AFe2g4WWiTRJAW28PvClI4aQ2/F?=
 =?us-ascii?Q?sFvCZCc8cQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: ixClAp5kiUSUBesiWNensO5rF23WhbaZLH3Q/hPBTpGA0iTxSvGF2F6ONcGBtaXwMJ0fQf2MHayWIFDVoQw6kygfn/ANeD/txI6IKXxGHSyl+R/eHduW6xgmjO9NTkG+1C2Ot9olgXtDQb2oC7g4AJY7xUngpdxRdiSWUxp2G1FhNLBDNH67bQRlM4De5/aR+v0BS+Qe8NvSxhbPzap185eSmkSVprO4T6Ceb1t63K8Q0wiEVnjt+8x8Tl4CmDMYULZDebNBSGhqfjgE2z2QU1dsX8TuXp+N0TuGBOc0eppkX3jN5NBCgC2t122HrzyKT1+0pVvezeKQ7oh2EYkGkg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb7415b-0a55-45d7-54e2-08deedf74252
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 04:58:56.1609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itUukgVWuN0RsfuDoYa9EGc+NxYpK7c3wFeh6He/jjKvsp+MqOYlPVGSf6aFPqWdFmeE1zfUFkCHIn349HJYIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4679
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   5e9654c516d84286a1589d22470d9c4c04ed8507
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [4/4] ANDROID: fuse-bpf: fuse-bpf v1.3
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260730/202607300651.2HBiyC2w-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300651.2HBiyC2w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607300651.2HBiyC2w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fuse_test.c: In function 'readdir_perms_test':
>> fuse_test.c:1400:9: warning: argument 1 null where non-null expected [-Wnonnull]
    1400 |         closedir(dir);
         |         ^~~~~~~~~~~~~
   In file included from test_fuse.h:13,
                    from fuse_test.c:7:
   /usr/aarch64-linux-gnu/include/dirent.h:134:12: note: in a call to function 'closedir' declared 'nonnull'
     134 | extern int closedir (DIR *__dirp) __nonnull ((1));
         |            ^~~~~~~~
   fuse_test.c: In function 'inotify_test':
>> fuse_test.c:1455:9: warning: 'dir.s' may be used uninitialized [-Wmaybe-uninitialized]
    1455 |         free(dir.s);
         |         ^~~~~~~~~~~
   fuse_test.c:1429:18: note: 'dir.s' was declared here
    1429 |         struct s dir;
         |                  ^~~
   In file included from test_fuse.h:11:
   fuse_test.c: In function 'bpf_test_revalidate_handle_backing_fd':
>> fuse_test.c:1889:27: warning: 'read' writing 11 bytes into a region of size 9 overflows the destination [-Wstringop-overflow=]
    1889 |                 TESTEQUAL(read(dst_content_fd, content_buffer, strlen(content)),
   test_framework.h:137:56: note: in definition of macro '_CALL_TO'
     137 |                                   (_type) (long long) (a),              \
         |                                                        ^
   test_framework.h:153:25: note: in expansion of macro 'TESTOPERATOR'
     153 | #define TESTEQUAL(a, b) TESTOPERATOR(a, b, _eq)
         |                         ^~~~~~~~~~~~
   fuse_test.c:1889:17: note: in expansion of macro 'TESTEQUAL'
    1889 |                 TESTEQUAL(read(dst_content_fd, content_buffer, strlen(content)),
         |                 ^~~~~~~~~
   fuse_test.c:1874:22: note: destination object 'content_buffer' of size 9
    1874 |                 char content_buffer[9] = {0};
         |                      ^~~~~~~~~~~~~~
   In file included from ../../kselftest.h:55,
                    from test_framework.h:26:
   /usr/aarch64-linux-gnu/include/unistd.h:371:16: note: in a call to function 'read' declared with attribute 'access (write_only, 2, 3)'
     371 | extern ssize_t read (int __fd, void *__buf, size_t __nbytes) __wur
         |                ^~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

