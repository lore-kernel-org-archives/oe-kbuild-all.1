Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724024F5E0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 01:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751245825; cv=fail; b=MnO2Pa7B2B9c8deLk44bTO1KvA36iF8dfOsr07TQgWEQosOUoyxKcmJqM5p2RcduTBDkkio9S5vQI6R0x/t4Ugz5b4QnUgzlM2wcMBXcfH6hzSCWJ60qcjwjMqi+NqxqgS/TjmNt9xTqZsyJR0NLvlv2uzkAaO8TSHEkzDsbAZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751245825; c=relaxed/simple;
	bh=Yrr3DJcPPAncLItqH1BWxf9ZJID3oMFnCNtkKKYnIzI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=oiX98AjXYTzvxT4fXLQb6qZZbR46659lWJfIldiKSvWDq+xu8921NZYB9E7BZh62jU/RDtWBLYdvey/PmwBh26Cjz3Lw6eBLE4ouNGfWjjO0eNBHJVwUm6zf+iYbOG4BTimyCniqVrmfoMLjTNoBqN7RDvUEt7Fgqfsuhtml1I8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nIep23xN; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nIep23xN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751245824; x=1782781824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yrr3DJcPPAncLItqH1BWxf9ZJID3oMFnCNtkKKYnIzI=;
  b=nIep23xNAMP71OLb2AhmeIhRThSZD6cnWSpKE7bmlFKDoh2fYAp6MwO+
   eQ6Wt9Kzf3MoNLQLqEN0V39H5QlD1Ia1xc/GibxZTODQkUE5kMXN9BojO
   j5wP7kDv9U9bV9srGDKvkYMdv9V+AWTVTJNUvzC0EpGIZkO99XPM7/z6+
   4Mo6D9DUMDsCClGvB426/4wusIqZl2r97IDC7CnDDWCjorGCO4EwYZDAP
   b4/pSXcAlh2zL/nFQQq70BWbNiJ8HOPWE9EPiHaMKay2GShf9hspjxqZn
   98kMnPKaTnWPr17nCSXALQhTiCThA3EvWoSaS965xNbftn9oVo0L3l5hL
   Q==;
X-CSE-ConnectionGUID: 0d4yblssQrK7Attcy13Y9A==
X-CSE-MsgGUID: Gsd3VxXjRXG84hsguSBwYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="57241981"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="57241981"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 18:10:23 -0700
X-CSE-ConnectionGUID: xjsK6oybQJ+fAPuHcFAeAA==
X-CSE-MsgGUID: fOkGGXo3TN2/SPIV/QDBww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="153790973"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 18:10:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 29 Jun 2025 18:10:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 29 Jun 2025 18:10:22 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 29 Jun 2025 18:10:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r71+XoLduPrhfyyRofL9WZq6XBKwSnWwcv9bBPunYGp9Yk4mjkDk7HWRwy3pq9yIbP12lsumZiCOdM/YnWgrCOBpSdYLN1V8FdYkjEr3D5pGeuxFwJSkY+wQ7q1tkMfb69OtwBjA+JTLpTnZcT0nh82Ei2sGbzokFLuh3tB+I/4bLd7oiqkiXfU9S6K0nzLObal2bcEJSHBN7I+P2vbj2WXYrQ628xkN04fHfEKvD0KfCr9WPFEcKsbgaQYhB+jWho/bX2qCoakX36yImoBGi/uSt7GhuIRAmlyDQCMI8E5bEE+xAjrqZLxfG9fp7b3qeB1Fr/uG6dltt2oReikYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3cdZII0NiDKu0Y50TcAvEo3wJIOQcOiKrXPRxpZ2R0=;
 b=T/3+068vUUh96Q6beoDyKrGhMlA5MteoAikidDDB2z3c5QeMdVYQ7mQUTvrvCcF0rJ/ovcNL/X9Xv8fnKg6IQEZ+Nix2F1Ayh+wjHKgw7BE9UM5HHVVXqKWegZIjBCO7Mv8D47ZdCrD35Oij99yKB3hjmEdj7x4ZElQlsGYjROKi5kvTctSSw1DLg83WtdtTU+XTkvVP3xyY23qJ2KoimR1hkbEtA/HXqxd9lrZGulWvcyUlzvdKa5yoIaJj/wTWMXIi/tSyY3qpDb6IpMHoBGUaBRNRTwwmQ4eoc2pJH23BvBPvRCfyG4XalnMjoAHf6Yth2Fe6V/5g6TnrgL4T6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by SN7PR11MB7137.namprd11.prod.outlook.com (2603:10b6:806:2a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.28; Mon, 30 Jun
 2025 01:10:19 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 01:10:19 +0000
Date: Mon, 30 Jun 2025 09:10:12 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jpoimboe:patchpal-issue 36/46] /bin/bash: line 1: 3659322
 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label
 --hacks=noinstr --hacks=skylake --ibt --retpoline --rethunk --sls
 --static-call --uaccess --no-unreachable --prefix=16 --link --module
 lib/tests/longest_symbol_k...
Message-ID: <aGHj9JKTyXgIxCgQ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|SN7PR11MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e13382d-bd77-4804-1dee-08ddb772e190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X6000w/v2Jf4unWzB7J9i6tC3hmz+Vp8Fi6gCd5bXOB95YbNzQbr8EYvVYJW?=
 =?us-ascii?Q?PzmuJFCIstvIdxAujQz2tg5fzIuLfFZ5xzYPtVqVIZcmwbmmHN8oSrwSdvBk?=
 =?us-ascii?Q?t4fStXh46Xxl6nvHt1/pN1YADRQSGs/UEzGXKPu3ehSIZIih4hjBDF1aMWIk?=
 =?us-ascii?Q?rsAHaUQrn4UaHwXKfEBNzdIMgH7Kb+NMtnoiOfcMTvvwTaLqzWzCO0/++4Wf?=
 =?us-ascii?Q?idzXn3qRKIXUYrWlx3nXmb4l4zlhACRgu5XBrGwtzjCJ9SuAvSHujWvwDjuw?=
 =?us-ascii?Q?aKeYnp375DeuWb/uB+NnnpbQ1tUd9hcIZejFg/xkkXcRtYGP07TKBlm7+5if?=
 =?us-ascii?Q?JzJ/B26xV/5WJ0OEk10Ro2EkyfNzpDskY8Kykp53Y6JWIE4GHlAn4pSEoY/r?=
 =?us-ascii?Q?Z6/DRaFs8KERwN+NopkptGUQHe9ar+FxsnPxcrziInRtYeGBt+aK0/cA5Nhe?=
 =?us-ascii?Q?Q9MSwmK2vbvOuYyjut5tOMbUpMZXlVGtso7YZrYqfo/ysWL+n/LGBoGLiY6G?=
 =?us-ascii?Q?AaeegvfSa9wIu8ZuFGASGd3mXJSMKbFscqMG9m+o9WAn1WylQnWVcqf9f5OZ?=
 =?us-ascii?Q?ikXZqqjM1jTdOC4lO8+6ar73nnrOJ5ByqUPt2/zG0bNT/AxKlnJPVq/Vv2Cx?=
 =?us-ascii?Q?ss0fuvIFdsgolst9TeBh3gUBIeKxBHBnLmemaFrrS9EC9mPf38hya5w1lYcg?=
 =?us-ascii?Q?/hD6cQ7aBz3UNfSyTdxWpgGNpTlnd23BKMvMhyTPOu5gDgGa8e3+bMbLthKU?=
 =?us-ascii?Q?086bbTHBElDcRCUx/+umGPB3/+OsOM8lZr440Eo2OGzVlxl55lbZ2j29NVVJ?=
 =?us-ascii?Q?12IEqM4qwYGUnz20VNf+SKdJMplBXn0ct6JMKxtxjbJRW9S2Ng6DZSpGzv2q?=
 =?us-ascii?Q?zJNbj6hnaVZt5puActl2K+mTJ074OLmNJVz8vqB115jBQoPf75TSlZxLWbR5?=
 =?us-ascii?Q?sTu4/9Ji/R1HdnCtLnBgP6TU4oh0aNmE4kNL9WDlbWD1+3qV+vrmTsEb20Ey?=
 =?us-ascii?Q?594ZFt1KymwbHxJBLMl6iLA5nRkC/hnmiDQTiHkFHJkrtNnPk/q/4TM/LZA/?=
 =?us-ascii?Q?8I/om8cdsbV3+CT4UfxMlUWm1IbOJQJUYD4RywQxXhHyFagSiFP5Qk01S0+7?=
 =?us-ascii?Q?HqKjwgVVFCaAgdztPMXXNiNiLMOX1+4Lxblj1IO9UTwx1xUx1ifK7yCryanr?=
 =?us-ascii?Q?tiXqSg18EYoKz6yIQ+Ij93N0zaWJeSdOVwd0vk+XiqMA3gzI3CUU1boHwv3B?=
 =?us-ascii?Q?qmx6isTGd49sMzueBtjM3QYqnTqw17ya11s7mMyMUrEvuwd2BTRhBg3FaPlP?=
 =?us-ascii?Q?BYz8cqHUB2pd/3S3xCWpiiK/WK9syy/nNxWf9/r+VDzKNGYtia2IEWC3PbGM?=
 =?us-ascii?Q?syiAixadg5hT1Z5m2kWF24Cerafq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kjHnib/26C+vgo6VQcevv3LsZwM2xGik6RIi68dMdipLnsBmz4JO5r2AeyxM?=
 =?us-ascii?Q?oLvY/RF6poFPWP8d7AipRGh8DUWpjSBpLqztE0tD+kPY3/CcJqEyWtz8aOCo?=
 =?us-ascii?Q?kqzS5fx0hKEX3Lx3iyNywn09YLBsF95NTEE18mulV6KA6NPULpq5XHVWQoUZ?=
 =?us-ascii?Q?BGoTSqVIkPSZaoyFkK9QRUVVNi5a4UqjwwYSG30hPQ8qLbZ+/4/dJ8p0QNKu?=
 =?us-ascii?Q?z8zmSIsFuhnVKQWNtPBhx8fcq+oPIBHbY9VDw5fsSSna/vayLsiF8b11OFhD?=
 =?us-ascii?Q?3lS8ceqnnarFbtKrGVh6U48IwRh3LnOX420hAGzWcAhd2zVqBjV2HwwOsEMB?=
 =?us-ascii?Q?kuK7j8xyMH9WRAjpLK68PWT3MUyzcZ928nHhZMss4zVS8sAeJwakIkXw2h26?=
 =?us-ascii?Q?L6RQ+sdaq9chB1dRG+J75F7nadanJYV48zqu9dJyi5lW919Qvc5m4V9WpOLZ?=
 =?us-ascii?Q?pQf0IcddezYVNJT9sBfa1lMI1I9xrqyo17zwfGH2kOOTT4Mg8sq1oxTHtaGT?=
 =?us-ascii?Q?E16/zOhbqqtamGxsvf+OVQtAOyB6DUmeNqo4Oat0l0tzcZrEEmIcaADlvmHt?=
 =?us-ascii?Q?UtBBt6T8MBzqvB51LoM4iha4n3dCWGRTnSSTqRbxR7hCOkBDe2+qmq7+Zojl?=
 =?us-ascii?Q?lVl4WUsw4PGBjmRhmqYVRygyuiDBm6mNh8c2y/ZtQ6MQ/mVWsickMKuKMPMk?=
 =?us-ascii?Q?0xViGzGTIpGwuzhHAM45Fhg/ee8NOSHvC6LoSnN/b7NGiI4HcYQnU4xiV5No?=
 =?us-ascii?Q?Ox6ZYcdcU0cwx7sk55cocoma4JrZSFCh4NlRhT1uQi7hAq6yEuETxTieHFev?=
 =?us-ascii?Q?c3q9seMDs82hDh4xyDDnMYFJh2jmCOy89ZzYpp48OXK1IeoX8liwKeXcb3pP?=
 =?us-ascii?Q?7hoWSY4NQH5YWNyq0Qa5NRFsxnS6jn4Vw3rlz+0gYUVPA7zixfCdXZRiIkNx?=
 =?us-ascii?Q?lRGowghksPE2EOKyI8fXkE9hz3mbayIckL3DnckXYBAx+7kZEsEsAnhAti86?=
 =?us-ascii?Q?TGCcije3sYdwcUyNqtnox7VYbDgHUAcPGtal2+oFqz93Q/TTOBi61Ppkyoxq?=
 =?us-ascii?Q?HI8W7NNa9pQX4xscKcaU3rmG2p4FwpnZ/QOiyL8cCb7URrYwzKaTgRY/BWRK?=
 =?us-ascii?Q?G8BW4zKbLdgnD9prJEfxFyXQB94xUGwqXEdhZE3Bp20LMrApRAzlykZdzCEV?=
 =?us-ascii?Q?fNXWtjtycOoGT4Enc+tXfcDE0PXoOkLjimNFWjGfeH98w+OP/dSLWtdv8QXi?=
 =?us-ascii?Q?AUQZVyvNTlLIzPQy9GD90Q00ZfIO1qvhbV+4EkqEvF24LtRj1CYq6xZm5VnA?=
 =?us-ascii?Q?bbV+iZMWa0x0x+UZ24Usp65NhadfdRFLT5isy3BiIuZDhlzdWLW9QRaKwgUU?=
 =?us-ascii?Q?fUJ9YmHrMrqX3MuRaCyvmBEHJ4I3mDWWqcNcfzR3SePQEYU7Bgp1KdZXc3TC?=
 =?us-ascii?Q?AsnlvFkey+oW3lD56moXhoDOHfvaSEk/uG6wfbqaop6JHH6BBme8M0ncfX7D?=
 =?us-ascii?Q?tkGsE183DTB5QqIMEA3193mY8D52A54gXylkRNwwo8MAw3VBJ5dpT28eNijh?=
 =?us-ascii?Q?Z4qw05IVJ59LFbu4uXY/xTne0UIo/edgSG9gP93X?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e13382d-bd77-4804-1dee-08ddb772e190
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 01:10:19.7283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6TZEyFFO3fs3tBRU0BZIwDfoD+v98JpmXCTCJeS7our8o3zdZZE4Wi4/Nm+u7dkyEJKA7/MeyEeOV1IPGv/bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7137
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git patchpal-issue
head:   89257ae2414384a196cd3546a47a37885c9a205b
commit: f1cb9a46697e8e0963460972e66003ee1b837587 [36/46] objtool: Generalize elf_create_symbol()
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-123-20250629 (https://download.01.org/0day-ci/archive/20250630/202506300459.NKNfuo55-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506300459.NKNfuo55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506300459.NKNfuo55-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: 3659322 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --hacks=skylake --ibt --retpoline --rethunk --sls --static-call --uaccess --no-unreachable --prefix=16 --link --module lib/tests/longest_symbol_kunit.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

