Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23302361DB5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Feb 2026 04:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772167729; cv=fail; b=DgXp47vHQZkoPVBJ+ZzrzvhUlNS0yxDefvl8HBL/MOKFn5u3Vx90DI0/zuEZM/awAlEYjz+u3gchI+s24QAEv4/3mR4AR/l4KRB7ctIMimoxIqLS6vZfdVQi1z1Vfeg+X34y4/pehr/gRYV49zduIasry1RKFSYbJ1yrRS9/LVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772167729; c=relaxed/simple;
	bh=ozi8yrrEwSbTtI5Yu0Vk+Idw+Bdgfuhc9PGoKfaY0dQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=M7+VBtrPDNvNJWWsMAesNUHYXF1Z60AELbU4L9y3ONefCco5x01B2cspJjTHwc+R1qcQB5xXDkHVcDhbie53fvYhxhxmu2t/+2/nko3+o/pRDJ6ZbLgiU/Irl16pk37NYWh0VwqqvUG7Q5pdp7fl2N9eAfaOrLfZzw4yEB85TNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dVbV3Ybr; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dVbV3Ybr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772167728; x=1803703728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ozi8yrrEwSbTtI5Yu0Vk+Idw+Bdgfuhc9PGoKfaY0dQ=;
  b=dVbV3YbrFZvxMZqswcSvkdvoapYQSv//Bx4yUox8LfvnnIpCp7JYwhH5
   qjMVyo81hcyvNTZcJogBwYuprZVIch9VxXnlyY+HuOOaa/I3fHh24FkqL
   hhWrU5E8gNEzIlE7giJYfRm9oDuuTRCAo9WGWqzlOMp53JHVDuaUb3ENk
   zZXRqrJ45/t60rL1NbAtgMYWlf+cZNzqEmgfMIC+JoIgr/x6fsveBY0u3
   ECKosILeULGbgwvoYp4ARFtYMguPIFaYKPXjP97zTC7OZE0c/ySQwqEny
   qA72nPOESxjHSoQ619gUqKBtRgM5QxiWIYvAmYfuwnLktpJzY/+hEmlWM
   w==;
X-CSE-ConnectionGUID: E+zipKJVTKKmnBmiyuUn9g==
X-CSE-MsgGUID: U0sE6Vp+S8mjmjbIRjjtHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="83881116"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="83881116"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 20:48:47 -0800
X-CSE-ConnectionGUID: UKAaMp+QTRKsLZKSwPzKwg==
X-CSE-MsgGUID: t+1AFPxQSmmMaB+KAUIxqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="220929386"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 20:48:47 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 20:48:46 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 20:48:46 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 20:48:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSC6Mewp0KGxOqyKyvk1q1/bY4MMydpuY7qYj9nP2akO9Sh/E6qIaYriJVQBuouj369oyaLo5Z4tElGzIVQHQqSojc3sHBdEaCvBe09WXuLEhpGkZPMz8BgXt2XMWALL3YWybQqccHcB/H6T2Uvwv+I83ftmdVWY1HEbbT5zOTralWdUifY9tGeVMWgl5w9TjGCbrMx6wj/3J1xBJZkCBXyQQ4AYbB1JwbbhzAxuKQcOUhDHPrJUBI+x+hi1R0prP8zy7kvbyGPvv+FQXcLN/J31mxaYnajUNRrrskZOce4a6h+5rud21CiD6br5FEINsB5bIokuDVccZNxRSeS5Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kjes1N/uYd/sSDbExZ9u7ixomCP5RhOmPQlHt/HSrqs=;
 b=miJiwwDepvttw5M3pj2BuqG4uXRf+9NetsqbyPOJqQ74ULHrNsyTvUnpLtLZq4r9Q4BdlcpGDBaJRrT9n2QNiaxxgbPeUfVu6RsUwosYQoPJtAsbw56n4DN+RNRJepL4zWMQ9wkOquLhDQeozirtu4FToxN1bEOlr4ceqiOdaH0rBTLA/pPZ7IuSKg1o4LaNbLTFLRnHefzY6Y+jca6BN597O7CsZ6uQ2/lbDCQBi01tk388zfPKExzMW5yGl/vm/FGhJnR18pJ7Tl02NxysapinWZ5D7K8Ty+p6ZcViT+wH0Ajr4KW3VqE8ZvrWqvxNjGOt8DCqhOLD4ujHIvpeug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by SA1PR11MB8376.namprd11.prod.outlook.com (2603:10b6:806:389::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 04:48:44 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 04:48:44 +0000
Date: Fri, 27 Feb 2026 12:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: Fei Li <fei1.li@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [acrn:6.17/linux 5/8] checkpatch: ERROR:SPACING: space required
 before the open parenthesis '('
Message-ID: <aaEiI0ujU/bDzqqj@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|SA1PR11MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: e6016789-3969-44a3-27ad-08de75bb7c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: gZUnmcOSyNBawsM+fqqh1OF990NeaM0d3uFWf6kwAI/ed9s4VLngrB1ELJrKKs9Dyl5Ie+OudZh3bI18cJ0WIHHxEmdREEhfIHGxn3C+a2pAGw2r67HYkm1QapLf6G6lv4gZqnuThx+wedAEg44O6BSVcYp584zf+RH9MV3Y5xt4EmmIPZm3N85gqnx0l7Je/O3/QZfKyuCo8BgiVwWIoHWrWpSkCG1c3lednEUMQeb9CVVBZgG1RLATZ9O62BDt7Paiiox4TCLcSzj0ELI1MYZp/aNL+C8vN1614L6luEk8gaPh46E0yeB4s0MsRWKHAne4motb3aoXCS1xtUmHVhwkN7FxpDq3u1akB9x/iW0qIv9HWgTheMltC43nsqtoaj12HTT565jeFuErBWwSVQjKsiNao6X/plqC4Vfu2UGibijBX8/lsqfRYifn4xF7nq4e6FbI36c3Z8ybjYIZlFFQcqr77TTJpHTrjRffLSgArxi0g7XX1d9gHcU0rEGbD4cRximJCOPwyVO9/h5wysF7Kqs+R7sEBzwimgjMA7h8fCOXpSmOR9U/QrUwE7Mzvt/LScJYeASiR9V6JYkxO0BqYJKJPqsoGZRN8N0rsrDgrhvVDDOP2G0xANNmv4MOO1Bsb6mgP2zrfU5a0DGzQXavm/+TWhgJNS3P1a0ORYhmPWIaDRiXhRW+WqG0knjY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GRlYMXPCiGkR7x+h36BhhAsMq8pb2lPmoXr6K2hlY4YBaMWdKJr9b0GPEcKp?=
 =?us-ascii?Q?c/EWUUiTFG/oV7XEqz0qDMiSicYxshsCC/Sfps4QYQQBglOf4pwXE+Y5kjTL?=
 =?us-ascii?Q?KWFIURXcg2bd0tzeGzMuobTo2bHMEtDJvMhwq1P7onInIGV/JuKzVjDPeiq3?=
 =?us-ascii?Q?giYy06nZ9B94tdT8VxsqxYFVRg3yK81axd6cxC5y3hgdStMrvXR2ZGJM5sNU?=
 =?us-ascii?Q?7czliUVaUS00chQImeHDC/+xcTmH648zwkv6vlQOVMjSxE0TKyy6kIOjBalQ?=
 =?us-ascii?Q?qFqYGH3x5F3N3+hPhxxJHfUKG6WtYmcZbYMDRv1ql+7ODOZfE+odEhzrkNJE?=
 =?us-ascii?Q?aAyCbt4j9/+xvnqKdXDg+deN8eDVx4AjJ/zuYYNRA+HMP+52OHSTr121O2Vp?=
 =?us-ascii?Q?CMn7kqXDjbFGQ4+gdyPj9MWAJaUWehWmZu/UYAMA41snQh3+KWeKgSvwu8OG?=
 =?us-ascii?Q?UrZRg3J7T2K0wt7HMSEQjKn/gvNst8rvSd1EzUZR6WO7uS5BN/XIJtF0vduS?=
 =?us-ascii?Q?tjY9vt9R0U2/sr3W8Hjwl6cWb/clS9sNk0FK7Nju4mwLDcgZ6Vx4YO9AivfS?=
 =?us-ascii?Q?xzAZSU6P7Tbd7a1wJ+gm08fdDrP/DVkV4VLpUFWxOlB0FFbtiydQqUhyM6RW?=
 =?us-ascii?Q?lell/wqYIGt0QB+ZutoY+r5i6LLkzetQQOoDqQM85kVyY7pepSTQDrq6kR2X?=
 =?us-ascii?Q?g9S3JJK22fm/hx9sm9TMNFrKRpFxxUBI1nv0XZ/1dbMvqWs8QESKuWKG5frL?=
 =?us-ascii?Q?x2AN2U+c0RkHHEDHwO7zX/2wXBuy636pKDIvI8J9JF+LXIN8j4dWSh3FVTpV?=
 =?us-ascii?Q?gqTRSRRYd5W/zsimUb38o6qjPrg45vZfQj47dS5eVjwBwCv314/94iyggxtI?=
 =?us-ascii?Q?bbJEuWI5uqvfjJxb2eLWPOCiMue2loYB0nk7KUX3kFu4EW9bBzzIrsT5AAiG?=
 =?us-ascii?Q?oaDbMnONiBMcxbQ3TOSD5wQLQQayLKQlKUa1RHlRTzmOpEkB5KZUCn+k+kr1?=
 =?us-ascii?Q?PbFatMWzPjYFdRVRfLyOmS2exMNIt2BXShVRWTxMf3Mjy1cfrpjziwL8tzqS?=
 =?us-ascii?Q?zi/csBhW5RGl4qscXRm6jXFHZTvBSMYrfzBZEgtNPYfOcNO/Z8OzWTKD7BeF?=
 =?us-ascii?Q?vGWli26pbM1d73A1uTTGuvflKl/EDafLwpp4BxuaOW+Ec1fL3jmvNJTF8A+3?=
 =?us-ascii?Q?u6BMO1g3e9v+PQH06INaxImIv6Re7zc8f5CKVC/u3wX23UwgLOCb8aaKzics?=
 =?us-ascii?Q?6K/7zzVMXddQORorizboalqpAAP9VumSpv6iJaDE0OXGz5yij5h2Yc+4zWjL?=
 =?us-ascii?Q?eKphfQgJgOSiJd+8Tmsl8llD5PzOgSfnKjZPo4YIdr93l8dbdmP9tPi6DkLT?=
 =?us-ascii?Q?XkyVax+zKd+kImumV6JGTLTlThd2+BtuNjU83ByYoHrMHevMEriRpanZPXu2?=
 =?us-ascii?Q?CRme630BA6cWM3fKF7uoPYdyXNoOQ5JYbDGB3PRB3Zg040sjvJFJuft222bl?=
 =?us-ascii?Q?mSwp1v3AAnfrTfY87BPvuJnyQWwLDHokXgZfvQa/iI9hjxLiZx+QTJj8EwIW?=
 =?us-ascii?Q?rFxghOP0R1pInQL0V9kKSywuz2myu8/TSCWEmTWCGwKp6ZZYiD56Cp5G75dB?=
 =?us-ascii?Q?MlshU2Ogzv0MsQBqWU+FNuwvsQ87Zm4Iuq+H4iJFYDYbt1/EUSXZd7ZrqMYB?=
 =?us-ascii?Q?MNvtvi5NwZfU17t6nqNkoJZanPYITdqqAScHotXpwrjVEi1YDjfnsPW7apVZ?=
 =?us-ascii?Q?g+ELJRz+GQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6016789-3969-44a3-27ad-08de75bb7c74
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 04:48:44.1350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0oX07wP6pwKxJko3KFAww5Q62xKYy4auTdY8CF2QuyNjR1Wu0AnkgAb6tx7jOSOIFyWNrlgyj8Ir9Qe1jim8mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8376
X-OriginatorOrg: intel.com

tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
head:   eac6d3b7a20ffb9d3102dbdc152241a7184a63cd
commit: a0a08e545dd9dc1bc3bdbd625684163595678fa6 [5/8] virt: acrn: add acrn hypervisor log back
reproduce: (https://download.01.org/0day-ci/archive/20260227/202602270557.vOarA1h6-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#460: FILE: drivers/virt/acrn/hvlog.c:394:
+	if(!hvlog_buf_virtaddr_base) {

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#465: FILE: drivers/virt/acrn/hvlog.c:399:
+	pcpu_nr = total_cpus;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

