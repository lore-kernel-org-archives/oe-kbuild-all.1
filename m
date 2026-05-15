Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C94047799D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 11:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843314; cv=fail; b=ZGGk/zoN6zhXyDEucania3w0BSDrjNWWFjvNwKM3jKhnD4WpxIxpj087Xi20ufGjM2y3nLQp3ou+QmqMv/5zQlkB8ymhryOY23wcFX2P1KayRoQ3kmgmZjF5BMkIXCzD9XVCMx6xHB7fPftZqwb8LiWHOAWXIZeLKYdx0R1pNIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843314; c=relaxed/simple;
	bh=CK0pvNDBaJts5C+9oAPRqe/I9g7y62BFl9wE4hiQDdk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=mz0TJVAM+QfAY1gqOpNn1JzL1bKC+N/6jDi3beW7n994atW/t2QQ43Ot9bfqgixyCBi1KVteKkqWaaiob6BMsI3KpjlMNWZIN0Px+x4HoERrtB5F8iiykByva5qkNDJvSpGJZk04th8VX1THqG6lhTi/g6pmUh6cuYnK72OhvPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0xRImTf; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0xRImTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778843313; x=1810379313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CK0pvNDBaJts5C+9oAPRqe/I9g7y62BFl9wE4hiQDdk=;
  b=E0xRImTf4wPiSsjAdiwtOu+u9sjwmSqnIbO/YWSDtCwTL4ikTWZd2zZt
   KiJLpTXGPY9WifmH+KSv/6EM0YXgERQTXGFIe3Ucd42bsgQp5VEfdz4Xp
   QDG6NpoGuvNQ3QxeLd8kmISnOKiVXfjjJGh5t+blH/sjGqufeqUdmSdv9
   6P5bF1A6mSp6x/eWuSwbm12ZneKIDLkWqtZm/ynA5jfPmeIGl5z805wiu
   WvYqy26rZVw1phJbhRspT3gMvOUKzPGhf+llmA6bdJw8ZHdRtdW1wxVPS
   Osn8wnpjNDhQfy9/diMxVd0pNWPZT04/7oIH0Wwoe5znt9ViZwb61bpEw
   Q==;
X-CSE-ConnectionGUID: 8ZwmqZaoSWK39c8zDDzLvQ==
X-CSE-MsgGUID: f7QMG2ONR8ms88wcitEKvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79839001"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79839001"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 04:08:33 -0700
X-CSE-ConnectionGUID: jDdhAE1WRfmAwoXNVaW63Q==
X-CSE-MsgGUID: wDHwuTrtTe6XjwXv7qMwTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="238928807"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 04:08:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 04:08:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 04:08:31 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 04:08:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KM1kidzrn8fss8Xoutf7HsGgaVhf31vQfXvPI1ZW90rufvcSc6j8K1lNhz/XZj9Xz3D28vk0AL/HqSSlqcHRHzFIGhovmkcw4KBXkJ8c0+1WTlubcyWjMS2Hxg43BmyJ4eRuSPduBf55vH3UjPO6FCdFuPub5yTndJ9xUS3TNoCyQurKwDrgwIJSdhwm/l8B/bXGR/VZ647w7H+bTPHUCR8MCXEheO9v4WR/R57jEVnM6lhElPvWhyyx/fgHYZQMQfCo0LVtu7MrC/S1bYqmSEF+uFx+ECgD6SOEZl9fI4E+UL1zEG1mKyfMSof3eWXz72C1+9j6qKpurrGPL1a/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZuFftg7s2J2Wcqoe/4Ft25+te/fZ9fuPracl7qkGpM=;
 b=dz4uJNREidpNGhcn+hYWI0EtyEEM6WMdqg85NSStvSauwMkhznmUh2welBQlmWTHMSaIG+1pIbjZ6+SfEl+1vEliUAYkF8n+bDQyN4oVnnB3hk333bTuyWEt4We7+4xmKcINNApuQT2BlUZq9zIFYVophOVnVJoMzseMheZNIjUmMtMbENGDeo1ocAwRoC4DbI+9WwGc1uJuq547rXD8CG8z6MM7RYQtQ2ydUVxlvRgHUMohnbVyOgbOdPuivII0Ht+Mo7ESwMipnnWHHiCr+EKxBPJcecnVV9thsOcH/2V+fXJ1ZTbjaFy3pIIPY2Nir6xb7Pf+ILgDKIHn0FVrJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19)
 by SN7PR11MB7466.namprd11.prod.outlook.com (2603:10b6:806:34c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 11:08:26 +0000
Received: from CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da]) by CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da%4]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 11:08:26 +0000
Date: Fri, 15 May 2026 19:08:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: tests/builtin-test.c:988:13: error: invalid storage class for
 function 'print_tests_summary'
Message-ID: <agb+oE0XkQGfrQWj@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To CH0PR11MB5428.namprd11.prod.outlook.com
 (2603:10b6:610:d3::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5428:EE_|SN7PR11MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b7b6c55-a786-4ea2-b72d-08deb272490f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|11063799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: vXKjt1HVrikZ2w8P6KHRISlMf0YBZQAHPdLcRQelC0fMaWq3jMaV1pfAYMdJjsPIPMq71/uEHf8/sMKfE66hFr8Zpxa5PwSe9+QdA6BlPbpr0PNY5HTFfdy++9SaFUOzoTFp7iC5SsimZwax5IBDxBhid7gFO+Q0qfTMTZbqcVUIsliJ7fgA9+gV3k9bxtFdkweQc6DR8jLm5a+wCqax6ECtusKUs4hxUBY8xyETcI8hP95lfs+gEX9G57R8Sh7TsFMDwc9fgv2e6OTGwJgZ6zGv9Ss2g9w7HaqnBI+bWPe6Hs4Afw1aP3m46BkUnQF7lQT2YXLxolK/4vc4Vuzq5sUNE3ISGo0T70n4MoPMGU0X20hEoy1YRx2M3E3Yi/BX3V/G6w0m7P2eRiaraXxQAyo7pFKadKEkoaTKJ6iHsNR5IW136Jc3XojwDVJzNr9SFb5BFrnGakt6Ir5yM+Ux7SJt3o6mSmm0RoyJZ9aUgL7eElytzy/v5K6uFFddNIPqV3xiPYUyMS3bYUQrUxmsKFRjYsaHQlG//YkduPKeCaxwA/Eo/HKOuxU/7GGdkVdgucPrcrUYaHyF2mZZuUbVnesL+icHtemNftgmP/PBm21iJUYPA4IVZwAZuKOEuIeLfPc9Oh+lzaW+aEyrizVgYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5428.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nYdRp99KJXPCBQYGYXJZZCItTmRA7TaJd6QxeqpHT0kdARyE6mfUa7BLKGUy?=
 =?us-ascii?Q?MznVpLgZ/LiiywrfXyNY7hDEmMHu0Fwl/ShoAB6imDoVGYEua7aak1EkA6tu?=
 =?us-ascii?Q?ibuHBSj48unXeJgsoM1BzSKrJDXq4SFUa42GZylTsP2AbJ1gcHj1hYNzp4w5?=
 =?us-ascii?Q?qhRhdRbAVzHbYa1SKGljWjxPO8y0hjFczWueiW/45+TgmvdDqxcgN6CVdf0a?=
 =?us-ascii?Q?HhUoY2f9sdODj7eADcD9/mbu8uRMJmK7dUXE4+3/ywPngezYRKXD20rlz+0e?=
 =?us-ascii?Q?iU98aJsgYXSSjFfzsnUYd4G8kjeD/emKgODY1C1EjJlDWVXWf+WK1RzGSdI4?=
 =?us-ascii?Q?2lUj6fn96MKz6CLV+1ubivpUXqdWKeBW8mR2tCf2TMSKtNF2LET+eNdBQyq2?=
 =?us-ascii?Q?7Q6+UC1tDeFUgX0aP+2xZYwRZ4GRGCMFgdd2xFYRZWctwg7Nge2fbssOhGmr?=
 =?us-ascii?Q?aqNzaRBmSCEXdJwO2Uh98RgfMN3GG09pfQvgAsT8JaJ7H3/6PwSaWD1Y6bdj?=
 =?us-ascii?Q?VzNbr60HZwAQyKChE1zTGroz7XU675P+ae6IfGFgLCaPs9ebgNDMiAdRlvng?=
 =?us-ascii?Q?cTyqqXo1VbaOoEw45GYMgZoXsktgxLhb/+Pk+bz7VfHTV8npoBv/wfEp8ZY0?=
 =?us-ascii?Q?YqBVtwyN8ZjbGNKpA2MgeRvwrc32UJrf5y+7PZTxG+WL3iEd5Bf6ReGYdfyx?=
 =?us-ascii?Q?SuNhke/D6Zue2v431Xk6SkG4uqANhbct+OvEpixI9Edv4NUUQ1ESMbzT0/Fj?=
 =?us-ascii?Q?D+VAHlSzjwqDWwmlra+30Z40f/lg9Pq1Rv5lEBI+Gbw/1NRT0z8HVt43guRU?=
 =?us-ascii?Q?hptCTue9hBmwsxaVPi8q3VMOFStvCRRbjKVwf9Y87r762CppnaiM3vSgcZzS?=
 =?us-ascii?Q?g7CtPPEQ1Y8xjEZKkZJoHyAFVShK5xAWQjGQSRQb2MiXc3SpF3l5FWpx4gm+?=
 =?us-ascii?Q?Nfz2aSH/uFAS4mUsuoxcRTtcgAFol2LU+qLOgfcz7zBkDxxXCnrapAwwsY5m?=
 =?us-ascii?Q?PksXudeDbLG2NbjIOjZQA5kSAMc01Xx7XmOOK/usBXlUrQOZOl7FkuLm4gfC?=
 =?us-ascii?Q?rAp0jmctTyvrLXK5oMkomKWlmzHWjBzKYrppP6TXsfGFUO8BLnfIHrl3Tvkm?=
 =?us-ascii?Q?Eyod8f6ka9zc7XathkNMGhm+yp5krUOAanBiiSEE4hzn7jWmXUuJHbKPEpyO?=
 =?us-ascii?Q?vggiv06zdStczcFeW+RA7sNMOp/b/ZWY+Ls5Rh2k3s/x8LMdwcTyObshYtrG?=
 =?us-ascii?Q?XJGY8e9YFAZVHd5BIhGZGl5N174vF4FCja+2n6m6sGbaMM3TFhKWeShxNHk9?=
 =?us-ascii?Q?GCKsOUo/rSt5o7Zc7fuc8fXZkWeA+jW7bfqw4+JcLyH9RktnJ6/UHcAdL9N0?=
 =?us-ascii?Q?0mTedmN2DYxWDiywMrYldRIJwr1RDB5LwE31ZVTeSuR1UPLF4pd9Yalj9s4r?=
 =?us-ascii?Q?lESQj6rOCbAJUEbRwe8HVmaUnQTSaCU25Z+yDV1ug7Sbgz+HlTYyYUFxzV/9?=
 =?us-ascii?Q?GWchya73kiSWIMZBgE37klikEV+pDad0fsfQTXhd0LCJWXnAQmSjs6CSx86a?=
 =?us-ascii?Q?NCZC169PIcLFP23pLbA3B6pGTsuCKC7FWozST/pDbg7u4kVN0mEk+/tXl4iU?=
 =?us-ascii?Q?nmDEFavN1feJOGT4u6DSxET9/xhsP8pCpUm+243uH7Zaf0VoF0vONxB7pX/1?=
 =?us-ascii?Q?0oymH6rMTYzzTsXuZScXyjmfkpfmX/5JmrTqZ/YelUUmx7/dulJ/fbrDDL3S?=
 =?us-ascii?Q?MzVMs+nTgQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: wb6YGGjSayidRGKSgWgUr5zunHVpwpiQuQRwD5VymZnmgCVc6YPO7QDBwQBfD5cSptOdG2DmtK596BfsCUCLqMr8sO7lU19FtsERgNyo5DBp7kszwll9PQx/TfDleWs7RN8JxW4jX8N6ya4hQAt7vq8ivvuF0P8GfkJaYtuIQn2ZWBAiPJCIy0hnG57G3OlJbmkIgg6v4IRLQTzEjDucjk7qzJv3h4aFx54kFO5NvsfWTwMiWCZe4jHdi/pKl0sshGQUylwRlRmbc+ib0RdZ7dFRmI5d7Egad5v2pCR1rJX75XngYvYXm9IHu/7/yAwG2WQRrFcLEs0K0kvi5X9IJw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b7b6c55-a786-4ea2-b72d-08deb272490f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 11:08:26.1881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCSgCHRzHxFVqjG6CipYWfHDx9dopA7s8FlBfpEUanuVhbDzM7VCJ1nSGM7oBe2HpQaZiEqoJg9V8ToJaIZHng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7466
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/perf-jevents-py-Make-generated-C-code-more-kernel-style/20260515-050303
head:   1486b474d48345ed0cca3daad8c9966bc7c84764
commit: a393f28de6e4d0abf028c1dbe06c72292c4c9156 perf test: Add summary reporting
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260515/202605150331.LJ7JoCiL-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150331.LJ7JoCiL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605150331.LJ7JoCiL-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:577: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:964: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1160: Rust is not found. Test workloads with rust are disabled.
     PERF_VERSION = 7.1.rc2.ga393f28de6e4
   tests/builtin-test.c: In function 'finish_tests_parallel':
   tests/builtin-test.c:748:13: error: invalid storage class for function 'drain_child_process_err'
     748 | static void drain_child_process_err(struct child_test *child)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   tests/builtin-test.c:759:12: error: invalid storage class for function 'finish_tests_parallel'
     759 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |            ^~~~~~~~~~~~~~~~~~~~~
   tests/builtin-test.c:759:12: error: declaration of 'finish_tests_parallel' shadows a global declaration [-Werror=shadow]
   tests/builtin-test.c:742:12: note: shadowed declaration is here
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |            ^~~~~~~~~~~~~~~~~~~~~
   tests/builtin-test.c: In function 'finish_tests_parallel':
   tests/builtin-test.c:759:54: error: declaration of 'child_tests' shadows a parameter [-Werror=shadow]
     759 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   tests/builtin-test.c:742:54: note: shadowed declaration is here
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   tests/builtin-test.c:759:74: error: declaration of 'num_tests' shadows a parameter [-Werror=shadow]
     759 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                   ~~~~~~~^~~~~~~~~
   tests/builtin-test.c:742:74: note: shadowed declaration is here
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                   ~~~~~~~^~~~~~~~~
   tests/builtin-test.c:759:89: error: declaration of 'width' shadows a parameter [-Werror=shadow]
     759 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                                     ~~~~^~~~~
   tests/builtin-test.c:742:89: note: shadowed declaration is here
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                                     ~~~~^~~~~
   tests/builtin-test.c:761:16: error: declaration of 'next_to_print' shadows a previous local [-Werror=shadow]
     761 |         size_t next_to_print = 0;
         |                ^~~~~~~~~~~~~
   tests/builtin-test.c:744:16: note: shadowed declaration is here
     744 |         size_t next_to_print = 0;
         |                ^~~~~~~~~~~~~
   tests/builtin-test.c:762:24: error: declaration of 'pfds' shadows a previous local [-Werror=shadow]
     762 |         struct pollfd *pfds;
         |                        ^~~~
   tests/builtin-test.c:745:24: note: shadowed declaration is here
     745 |         struct pollfd *pfds;
         |                        ^~~~
   tests/builtin-test.c:763:17: error: declaration of 'pfd_indices' shadows a previous local [-Werror=shadow]
     763 |         size_t *pfd_indices;
         |                 ^~~~~~~~~~~
   tests/builtin-test.c:746:17: note: shadowed declaration is here
     746 |         size_t *pfd_indices;
         |                 ^~~~~~~~~~~
   tests/builtin-test.c:764:16: error: declaration of 'num_pfds' shadows a previous local [-Werror=shadow]
     764 |         size_t num_pfds = 0;
         |                ^~~~~~~~
   tests/builtin-test.c:747:16: note: shadowed declaration is here
     747 |         size_t num_pfds = 0;
         |                ^~~~~~~~
   tests/builtin-test.c: In function 'finish_tests_parallel':
   tests/builtin-test.c:925:12: error: invalid storage class for function 'start_test'
     925 | static int start_test(struct test_suite *test, int curr_suite, int curr_test_case,
         |            ^~~~~~~~~~
   tests/builtin-test.c: In function 'start_test':
   tests/builtin-test.c:926:48: error: declaration of 'width' shadows a parameter [-Werror=shadow]
     926 |                 struct child_test **child, int width, int pass)
         |                                            ~~~~^~~~~
   tests/builtin-test.c:742:89: note: shadowed declaration is here
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                                     ~~~~^~~~~
   tests/builtin-test.c: In function 'finish_tests_parallel':
   tests/builtin-test.c:979:15: error: 'num_tests' redeclared as different kind of symbol
     979 | static size_t num_tests;
         |               ^~~~~~~~~
   tests/builtin-test.c:742:74: note: previous definition of 'num_tests' with type 'size_t' {aka 'long unsigned int'}
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                   ~~~~~~~^~~~~~~~~
   tests/builtin-test.c:980:28: error: 'child_tests' redeclared as different kind of symbol
     980 | static struct child_test **child_tests;
         |                            ^~~~~~~~~~~
   tests/builtin-test.c:742:54: note: previous definition of 'child_tests' with type 'struct child_test **'
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   tests/builtin-test.c:983:13: error: invalid storage class for function 'cmd_test_sig_handler'
     983 | static void cmd_test_sig_handler(int sig)
         |             ^~~~~~~~~~~~~~~~~~~~
>> tests/builtin-test.c:988:13: error: invalid storage class for function 'print_tests_summary'
     988 | static void print_tests_summary(void)
         |             ^~~~~~~~~~~~~~~~~~~
   tests/builtin-test.c:1004:12: error: invalid storage class for function '__cmd_test'
    1004 | static int __cmd_test(struct test_suite **suites, int argc, const char *argv[],
         |            ^~~~~~~~~~
   tests/builtin-test.c: In function '__cmd_test':
   tests/builtin-test.c:1007:20: error: declaration of 'width' shadows a parameter [-Werror=shadow]
    1007 |         static int width = 0;
         |                    ^~~~~
   tests/builtin-test.c:742:89: note: shadowed declaration is here
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                                     ~~~~^~~~~
   tests/builtin-test.c: In function 'finish_tests_parallel':
   tests/builtin-test.c:1123:12: error: invalid storage class for function 'perf_test__list'
    1123 | static int perf_test__list(FILE *fp, struct test_suite **suites, int argc, const char **argv)
         |            ^~~~~~~~~~~~~~~
   tests/builtin-test.c:1146:12: error: invalid storage class for function 'workloads__fprintf_list'
    1146 | static int workloads__fprintf_list(FILE *fp)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   tests/builtin-test.c:1157:12: error: invalid storage class for function 'run_workload'
    1157 | static int run_workload(const char *work, int argc, const char **argv)
         |            ^~~~~~~~~~~~
   tests/builtin-test.c:1170:12: error: invalid storage class for function 'perf_test__config'
    1170 | static int perf_test__config(const char *var, const char *value,
         |            ^~~~~~~~~~~~~~~~~
   tests/builtin-test.c:1179:28: error: invalid storage class for function 'build_suites'
    1179 | static struct test_suite **build_suites(void)
         |                            ^~~~~~~~~~~~
   tests/builtin-test.c:1232:5: error: declaration of 'cmd_test' shadows a global declaration [-Werror=shadow]
    1232 | int cmd_test(int argc, const char **argv)
         |     ^~~~~~~~
   In file included from tests/builtin-test.c:22:
   tools/perf/builtin.h:45:5: note: shadowed declaration is here
      45 | int cmd_test(int argc, const char **argv);
         |     ^~~~~~~~
   tests/builtin-test.c:1315:1: error: expected declaration or statement at end of input
    1315 | }
         | ^
   tests/builtin-test.c:747:16: error: unused variable 'num_pfds' [-Werror=unused-variable]
     747 |         size_t num_pfds = 0;
         |                ^~~~~~~~
   tests/builtin-test.c:746:17: error: unused variable 'pfd_indices' [-Werror=unused-variable]
     746 |         size_t *pfd_indices;
         |                 ^~~~~~~~~~~
   tests/builtin-test.c:745:24: error: unused variable 'pfds' [-Werror=unused-variable]
     745 |         struct pollfd *pfds;
         |                        ^~~~
   tests/builtin-test.c:744:16: error: unused variable 'next_to_print' [-Werror=unused-variable]
     744 |         size_t next_to_print = 0;
         |                ^~~~~~~~~~~~~
   tests/builtin-test.c:1315:1: error: no return statement in function returning non-void [-Werror=return-type]
    1315 | }
         | ^
   tests/builtin-test.c:742:54: error: unused parameter 'child_tests' [-Werror=unused-parameter]
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   tests/builtin-test.c:742:74: error: unused parameter 'num_tests' [-Werror=unused-parameter]
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                   ~~~~~~~^~~~~~~~~
   tests/builtin-test.c:742:89: error: unused parameter 'width' [-Werror=unused-parameter]
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |                                                                                     ~~~~^~~~~
   tests/builtin-test.c: At top level:
   tests/builtin-test.c:1232:5: error: 'cmd_test' defined but not used [-Werror=unused-function]
    1232 | int cmd_test(int argc, const char **argv)
         |     ^~~~~~~~
   tests/builtin-test.c:742:12: error: 'finish_tests_parallel' defined but not used [-Werror=unused-function]
     742 | static int finish_tests_parallel(struct child_test **child_tests, size_t num_tests, int width)
         |            ^~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: tests/builtin-test.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   make[3]: *** [tools/build/Makefile.build:158: tests] Error 2
   make[2]: *** [Makefile.perf:785: perf-test-in.o] Error 2
   make[2]: *** Waiting for unfinished jobs....
   make[1]: *** [Makefile.perf:289: sub-make] Error 2

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

