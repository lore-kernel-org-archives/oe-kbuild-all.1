Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D6022CBC0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 02:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764728477; cv=fail; b=M1AZEOUYDihSAMd1p/gy7WQ14SPaq6aBRZ1XFN41uqhZh2iW6D4TwXw+k3z+3Z5GLdVOWxCbQ1oTWTQdNhuyaHHvn242qPwqkRX2GbpZn3SkswMlMDL0fSGo5H/3TkT66bjVymKaKvnEyP6AJxPnkRfjCxeXfRywIl1L3RgCeDA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764728477; c=relaxed/simple;
	bh=2phN2J0tudSY0IUvATKz0FPr8QRu0oTO+3h1Rza7yiM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=nlXJZcaYlzKTUrBzgoACOmx9FMaUwRcsDNi4xtGuwiCsyvL3vXu24+2YrMFBRC6YQ2ugaveuqs4mGps4zarLJtnpVeW3X5nYcIpyTsAKjpTLYQKV1ER+M4vK7UhgR46fesDWRHE3i9AtqnI9d8q+qDYBlTlo7jXzQ0HMG88STnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YYjnayBX; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YYjnayBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764728476; x=1796264476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2phN2J0tudSY0IUvATKz0FPr8QRu0oTO+3h1Rza7yiM=;
  b=YYjnayBXVPA8q0ftUTwBZSsx7FboUfVlZxu+AKpSjGqjXHi9JUlx7OVv
   oosV06Eu2s8tJQMJ8xqXaokoM9nXBrDLz5Wr+WgA8D6lpZUlE1hEzPaJt
   kOTeYI4PnZwkQIWECvjnmltvW/+QBp3Uswy7aGe0DOU7S4brQwUkUx+tB
   wT0qYp8ZrCx9A3+KN0wrkP2ydgjiH+auXBVljSZMsCMwyYlxSdzoyrbpf
   Pw8CYSQSIO9cwaytjYq9/9VPSVsx6Tp+/tV1sBaTpOzQZV0gCDhYIQGNM
   1eow9sh2E4MGBJx03c1M6vKxyJa8v7LY1LweRsjXcQV1PaDUSOazScrHD
   g==;
X-CSE-ConnectionGUID: upeE67uSQDiE95CX4O2pEA==
X-CSE-MsgGUID: VUD0G935R2Kq13/AljHtvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77034644"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="77034644"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:21:15 -0800
X-CSE-ConnectionGUID: j+iZuBgZR0uB8S4gO+tIQw==
X-CSE-MsgGUID: VIU9jx8FSAW2hCOy+vLgXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="193631802"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:21:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:21:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 18:21:14 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.12)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:21:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2v6zbjGFbgi3CqGZVeEKuunnnaQlD53m9uaP9h0auwFhSXXv+uABHp60DMFE0gdsG8t0greSZxL5IzwZnPBGNnfTnwy19OLGHLDhZbwVZu6uNlMtbIV+c1FktlaHrWcqr4qyQ6hTdceiBPiTxy3mTGtgmi9KSJbHqIVwbYnhZ9XBjABpTjJ1KIJ9HZ5Oio04+xqUaM+V4aslzAtkGVfFQ59rLH1M6SnjF1eYah79qmTf85wUz8dAusDsL0A7U7cOgWThyu6QI3U3jlJ4VPgqQiOFI2Cdhbgkkigu1LYwfX2+c9PudmjTeW3F7EjKR0Gy3PEyb1JgZ+VZ5UvckWWxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCato5ylqAydPn3ecJWcT4FsG1gPrTWf8PrhJD9uKqo=;
 b=hS9iQvqH25mfPKnLeFlOKCXHzDacFogNpjVWvGDeOimIPwI9uTDcB4ucq3LwaMKJNi/s826r1bPRGC5x6cJvs6yKZuO+LGJzNHWEZ/ctgC66g3sfHGZD/RYK/Waovj4Jl2gjJXUod49+0r7RC8P+qBuD5qbQQ0JccCSg/8fUJ7bWJaf8I606eTSJRtzbCol81lCiUOXh3osTvuYtSXOVPvTlJHnR+E0/OUiUVz/vcsXNs56gGlRbS2OGuGNMhS7JnkXqkbgFPa/ahUqfGJEaH3ijwIX+jiyCkakSdQlHwEwAMVlqFNCScg7fWrP+Js7XPU18yY3dgr5HglaZN+wuRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 02:21:12 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 02:21:12 +0000
Date: Wed, 3 Dec 2025 10:21:03 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Kao <powenkao@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: drivers/scsi/scsi_error.c:1122:35: error: 'struct request' has no
 member named 'crypt_keyslot'
Message-ID: <aS+ejxssuguXpIbD@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|PH8PR11MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: f048d4e6-4990-4159-a85f-08de3212a05f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6ZBYxPfODZTMdpn6opcX2VRgKdlagnszkxNgFD4u1Q1KgVxrh9OytMhIfsBj?=
 =?us-ascii?Q?9CsN0MDwGR7HtWKzf6i70FSQlF8T9joDlfwqU7d1W41MWDpMyBEjN2VBKLrz?=
 =?us-ascii?Q?B6VcgTnaR4W5+/Ol3HL68/Lj6+cKIZxlLM44ttLUDH9vYN0vdyyFD9zTY/k5?=
 =?us-ascii?Q?3KsWqNB4vDgrcnWWzC3ZwqO4CXy0TwR6zWDAmkxR6ZNGQ2B2aDie2LP294yl?=
 =?us-ascii?Q?wXI13IuLXI1a+xXRjLNcxHBnOTkR8eDeEZXCkA0qN7ZegrhbroGcq88GxX+z?=
 =?us-ascii?Q?mEYUPg1x6apwjS1/j44jrSyKxw+FDDBZGR+u/Jhxu0PwZUM3noeeCFuSlqGz?=
 =?us-ascii?Q?qE2QFT4FSJLbpxzI2f12/rMKrArNK5uqEYDHxwuuY4+2IR7Kd7UgWVUlkHmn?=
 =?us-ascii?Q?wKjVVthzLgXAgGbnyBZ9K051Tyn1HbJGjCN1bdz3J8z6igVDip6IfjOsuObH?=
 =?us-ascii?Q?LJt2ZiGNRoCgbXCsUwvAq+nUkVHa6A/Gl6jFnFZWt8+1H4sJkeyukCiJ6gKv?=
 =?us-ascii?Q?64G2dc1CkEy7vyQzXV00s3JhweulVGbCeokA2OyMJmNevqVA0EtkKQAAFULz?=
 =?us-ascii?Q?9EJzk68syPx4fKaVpKZQBCN9KWyvnmkKYEs8bsvHa9BPfio+h39UhZL9tTMf?=
 =?us-ascii?Q?n53V5Ps4iVjZW+JhsGmR3KeiqiPLyp/+ETzn/Vqm/Yqd02Tyj98hPW5GGeDm?=
 =?us-ascii?Q?Sgo5Dj+D9kZqJu3kQE9DhExuv6ytaXP05+Pj4unmHY3BPSKWGj1P2zgZhVjH?=
 =?us-ascii?Q?1SazEQ803altUOUobqmAEqmVspp4orSed1q4vSxTyn/EvBdzkwNom6KYjgkX?=
 =?us-ascii?Q?MyECqOkdjGIex6li6zVkdPRAK8+3ZH25D9ir5nt6+zzKY7frKQHJaTbqBBnr?=
 =?us-ascii?Q?YYz5MwQaBcnEZ1Yzq2kXZpe/Ztsl9dKzCQgRAdhiI09Lnryc0PnPCnrupDsP?=
 =?us-ascii?Q?3lkVLaJ4uDyCIiVslm3qHzGxzLciBaiY9+EAlvO6YcwPU27vGSlUJmRl2kkj?=
 =?us-ascii?Q?fgCnGUHbo1SV3VYOwiYjBt478EUJHmdA5VrBvcNuZgKyOTEPkeLlRQU/w++K?=
 =?us-ascii?Q?KZDzPFQBcY1aGNsuICTzBRWHEJo3VV5C2YHkLY5p5OA909cIeoDA7GAqAz76?=
 =?us-ascii?Q?2NJMy77nOiNB5UfedsPyda1sgXkSW45QiQSUuptwZRl5n9fA1HP4fb4o3bDZ?=
 =?us-ascii?Q?gXivCB8XB82SCjM6Vne3Tutdmc1e0c/MD8mgjFydo7Udp6EFn+Ry+na26ILR?=
 =?us-ascii?Q?CUJM8kca/g+UNd/ah1s19lFQ0/lsyEylUpH1eyQHM9JtMD1ySey5dvaAK8IY?=
 =?us-ascii?Q?/rOYogncHUP6Rb/HTv452r7GczmoOMW1sU9KvjKuqrSfFIR6PodLupgjTJAp?=
 =?us-ascii?Q?+xaAW5VLNdemrp37KX7eJxaNlSBpK2hpvypNqOSS1/sVZLw813jPtr6Vd7uI?=
 =?us-ascii?Q?CnuWG/bcNN0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wPZ5t3D/wpuf1FaST4joXgq545JjClIL5hi95qFNgwsLUbR2bLcHJYTCAE0o?=
 =?us-ascii?Q?9bg3Vruc5uXINT0w/4bItDFDUSlpr9dFVKu3Ji9Ru/O3eM18EvRIEeh8VR9r?=
 =?us-ascii?Q?Wp3908JLIBIMldxlKIvPJ6XMjyTg4B4UIU4N6vqdHfBeq222TKiPB3XZhc4l?=
 =?us-ascii?Q?Ds0X403Y+WIj2pphPoqZ7OLHjPpS4r+8GqBBNF1L6umMPAE/t840Qhr6RLPX?=
 =?us-ascii?Q?G8QbW57tLEwi9Uo2sWzDsd9pGoUQzt+kVspGwrJbxiI/C1TpsEWvvTV4xhoa?=
 =?us-ascii?Q?BA9XMTEr7GwdfTpWOu1sCVmyTv6D9KG76DP3sdbQF9EX93kLT/+O9xcdAX/i?=
 =?us-ascii?Q?6y2LhRfTUwe9Nipym3TQ1TligDoQQ9IyzncPBOqAAPTqILB8vU8CF5ldK4ku?=
 =?us-ascii?Q?f83Qc2ZoBcGIMKsPWfxoS/j+lrNvSAh8neh9dD9mHUF2DOnUyyt6zHdMV5K1?=
 =?us-ascii?Q?rPTeWq3f5+UXFHCHlVBYHgnnoDEFVWbpj3Mw3Oq8zshGvjf2d4UHePHXqp1S?=
 =?us-ascii?Q?b7xK1f7YVRrqz7cWn13jc8rM/vOO/t3MYstPYJwY27Gp3Nh3OHKzw2VILLAZ?=
 =?us-ascii?Q?wdV7SSV1LluGlZ8PtKZDgC6sTSdpfROE9X6tXCgjSn6gWnUxsRBhssdLbO57?=
 =?us-ascii?Q?1rbAWg7Q8HpRnfm4YLOW+AtKh9vVTMa0N4n1kPoWngApGF3T8Ed96xO6tZjA?=
 =?us-ascii?Q?cLpwW23QFPEnx2VYJcmQRcPuI+BUfNKiR8DSsMf+Krbr/aYWVts9L6UYwNSs?=
 =?us-ascii?Q?YZVgQHGgeBb+DGELR3TjKGEc/ZyLwLEiUDwJXBHeOT409atgso86ym0+Yis8?=
 =?us-ascii?Q?P1egiq+1/b4yMyrkRUkFg4C1vRt42dA4HOfpsmzn1HJm4OuRwf5V0eXpXE1H?=
 =?us-ascii?Q?M6Q8n8rJx20bsNAqZ/I4Up7z0Mj4o4RsNrtL+hZ2Dk1JBxuuEOABhCcVl92e?=
 =?us-ascii?Q?zKeJV0fZBdVog7dUFh7qTbNQZkfdU8tIYFOPKZniuu/Ps1qrBTiElthwYFHH?=
 =?us-ascii?Q?XQ4xjAChl6T0/5w2/arHp8m7ouCHmIJTBV9roGGa3nu6tm6txi8lS5Z097qS?=
 =?us-ascii?Q?MUeoVD/fyq3yi6SM55wY9g9+Z4k5ObGOm7G59BQ4aM5zOCjyxKiUrtaotEiE?=
 =?us-ascii?Q?cKcbQmBm+SjNcR1NPKyFVANrGy0NFa+EXHfNDBHUegP/S7gdPFUMs+654/1g?=
 =?us-ascii?Q?FbI3W5uqHFXa6YVyPbeuebvVDsLXaY2WAcgRhgteYvhmcqiJzgD9kQMiCuCo?=
 =?us-ascii?Q?nXZW2y23L0kf/7KLgEgoF2E2InhIZpTWNkPPQbYY6Rfn5t8rcnehGrpP35eo?=
 =?us-ascii?Q?cvoSidk9KpAtJ6Kt0EpoVMidq4Ad12EY1bIbOyBHR2MLDlWZN+QXVkdTdN0f?=
 =?us-ascii?Q?L1fwHDNpI8qUZh9FVgYykASRRR7C7J1yAPhvV+6+UjY3Zx2w54Ic7NoifhrQ?=
 =?us-ascii?Q?vGn811fB/kDpEgEDd8rlnaRJbyhHVtC1G53/AZLo0jC+kv/nXROnroMJzFY7?=
 =?us-ascii?Q?pKlJE/pbAdrmOFzVNbWy/dw4jv9wFFeWRHtBr+g7Og4Fo2JHAoBBQlKgUqcW?=
 =?us-ascii?Q?JYBjHqXTQqkDrxGq/2cQDxrhptEMsYRH1BKdSw5oJUDrqwsI6RW/rcqeHQbg?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f048d4e6-4990-4159-a85f-08de3212a05f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 02:21:11.8897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yK32wOmTxcAAzhdvctqyHVIeAAJy1Pl359FNt3Ff/1/Rrl4dc1eN5RxktLVQfb9pMQD4sqYVFSZFPNeSh7zFKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Po-Wen-Kao/scsi-core-Fix-error-handler-encryption-support/20251202-091809
head:   a701e84256b6bd4d9c648e331df0d6f711925c57
commit: a701e84256b6bd4d9c648e331df0d6f711925c57 scsi: core: Fix error handler encryption support
date:   21 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251202/202512022312.Y1SnqNeQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512022312.Y1SnqNeQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512022312.Y1SnqNeQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/scsi_error.c: In function 'scsi_eh_prep_cmnd':
>> drivers/scsi/scsi_error.c:1122:35: error: 'struct request' has no member named 'crypt_keyslot'
    1122 |         ses->rq_crypt_keyslot = rq->crypt_keyslot;
         |                                   ^~
>> drivers/scsi/scsi_error.c:1123:31: error: 'struct request' has no member named 'crypt_ctx'
    1123 |         ses->rq_crypt_ctx = rq->crypt_ctx;
         |                               ^~
   drivers/scsi/scsi_error.c:1125:11: error: 'struct request' has no member named 'crypt_keyslot'
    1125 |         rq->crypt_keyslot = NULL;
         |           ^~
   drivers/scsi/scsi_error.c:1126:11: error: 'struct request' has no member named 'crypt_ctx'
    1126 |         rq->crypt_ctx = NULL;
         |           ^~
   drivers/scsi/scsi_error.c: In function 'scsi_eh_restore_cmnd':
   drivers/scsi/scsi_error.c:1160:11: error: 'struct request' has no member named 'crypt_keyslot'
    1160 |         rq->crypt_keyslot = ses->rq_crypt_keyslot;
         |           ^~
   drivers/scsi/scsi_error.c:1161:11: error: 'struct request' has no member named 'crypt_ctx'
    1161 |         rq->crypt_ctx = ses->rq_crypt_ctx;
         |           ^~


vim +1122 drivers/scsi/scsi_error.c

292148f8bb2b5d Brian King         2007-01-30  1047  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1048  /**
3b729f76478756 Santosh Y          2012-04-08  1049   * scsi_eh_prep_cmnd  - Save a scsi command info as part of error recovery
2dc611de5a3fd9 Christoph Hellwig  2006-11-04  1050   * @scmd:       SCSI command structure to hijack
e1c234685c5080 Boaz Harrosh       2007-10-08  1051   * @ses:        structure to save restore information
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1052   * @cmnd:       CDB to send. Can be NULL if no new cmnd is needed
ce70fd9a551af7 Christoph Hellwig  2022-02-24  1053   * @cmnd_size:  size in bytes of @cmnd (must be <= MAX_COMMAND_SIZE)
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1054   * @sense_bytes: size of sense data to copy. or 0 (if != 0 @cmnd is ignored)
2dc611de5a3fd9 Christoph Hellwig  2006-11-04  1055   *
e1c234685c5080 Boaz Harrosh       2007-10-08  1056   * This function is used to save a scsi command information before re-execution
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1057   * as part of the error recovery process.  If @sense_bytes is 0 the command
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1058   * sent must be one that does not transfer any data.  If @sense_bytes != 0
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1059   * @cmnd is ignored and this functions sets up a REQUEST_SENSE command
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1060   * and cmnd buffers to read @sense_bytes into @scmd->sense_buffer.
dc8875e1078961 Randy Dunlap       2007-11-15  1061   */
e1c234685c5080 Boaz Harrosh       2007-10-08  1062  void scsi_eh_prep_cmnd(struct scsi_cmnd *scmd, struct scsi_eh_save *ses,
e1c234685c5080 Boaz Harrosh       2007-10-08  1063  			unsigned char *cmnd, int cmnd_size, unsigned sense_bytes)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1064  {
f59114b7b5dc67 Tejun Heo          2005-04-17  1065  	struct scsi_device *sdev = scmd->device;
a701e84256b6bd Brian Kao          2025-12-02  1066  	struct request *rq = scsi_cmd_to_rq(scmd);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1067  
631c228cd09bd5 Christoph Hellwig  2006-07-08  1068  	/*
631c228cd09bd5 Christoph Hellwig  2006-07-08  1069  	 * We need saved copies of a number of fields - this is because
631c228cd09bd5 Christoph Hellwig  2006-07-08  1070  	 * error handling may need to overwrite these with different values
631c228cd09bd5 Christoph Hellwig  2006-07-08  1071  	 * to run different commands, and once error handling is complete,
631c228cd09bd5 Christoph Hellwig  2006-07-08  1072  	 * we will need to restore these values prior to running the actual
631c228cd09bd5 Christoph Hellwig  2006-07-08  1073  	 * command.
631c228cd09bd5 Christoph Hellwig  2006-07-08  1074  	 */
e1c234685c5080 Boaz Harrosh       2007-10-08  1075  	ses->cmd_len = scmd->cmd_len;
e1c234685c5080 Boaz Harrosh       2007-10-08  1076  	ses->data_direction = scmd->sc_data_direction;
30b0c37b27485a Boaz Harrosh       2007-12-13  1077  	ses->sdb = scmd->sdb;
e1c234685c5080 Boaz Harrosh       2007-10-08  1078  	ses->result = scmd->result;
a9a4ea1166d640 Christoph Hellwig  2022-02-24  1079  	ses->resid_len = scmd->resid_len;
12265709ac6e19 Alan Stern         2008-07-21  1080  	ses->underflow = scmd->underflow;
db007fc5e20c00 Martin K. Petersen 2008-07-17  1081  	ses->prot_op = scmd->prot_op;
8e8c9d01c5ea33 Hannes Reinecke    2017-04-06  1082  	ses->eh_eflags = scmd->eh_eflags;
631c228cd09bd5 Christoph Hellwig  2006-07-08  1083  
db007fc5e20c00 Martin K. Petersen 2008-07-17  1084  	scmd->prot_op = SCSI_PROT_NORMAL;
c69e6f812bab0d James Bottomley    2014-04-10  1085  	scmd->eh_eflags = 0;
ce70fd9a551af7 Christoph Hellwig  2022-02-24  1086  	memcpy(ses->cmnd, scmd->cmnd, sizeof(ses->cmnd));
ce70fd9a551af7 Christoph Hellwig  2022-02-24  1087  	memset(scmd->cmnd, 0, sizeof(scmd->cmnd));
30b0c37b27485a Boaz Harrosh       2007-12-13  1088  	memset(&scmd->sdb, 0, sizeof(scmd->sdb));
644373a4219add Alan Stern         2014-03-28  1089  	scmd->result = 0;
a9a4ea1166d640 Christoph Hellwig  2022-02-24  1090  	scmd->resid_len = 0;
30b0c37b27485a Boaz Harrosh       2007-12-13  1091  
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1092  	if (sense_bytes) {
30b0c37b27485a Boaz Harrosh       2007-12-13  1093  		scmd->sdb.length = min_t(unsigned, SCSI_SENSE_BUFFERSIZE,
30b0c37b27485a Boaz Harrosh       2007-12-13  1094  					 sense_bytes);
e1c234685c5080 Boaz Harrosh       2007-10-08  1095  		sg_init_one(&ses->sense_sgl, scmd->sense_buffer,
30b0c37b27485a Boaz Harrosh       2007-12-13  1096  			    scmd->sdb.length);
30b0c37b27485a Boaz Harrosh       2007-12-13  1097  		scmd->sdb.table.sgl = &ses->sense_sgl;
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1098  		scmd->sc_data_direction = DMA_FROM_DEVICE;
0c958ecc69c277 Tony Battersby     2015-07-16  1099  		scmd->sdb.table.nents = scmd->sdb.table.orig_nents = 1;
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1100  		scmd->cmnd[0] = REQUEST_SENSE;
30b0c37b27485a Boaz Harrosh       2007-12-13  1101  		scmd->cmnd[4] = scmd->sdb.length;
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1102  		scmd->cmd_len = COMMAND_SIZE(scmd->cmnd[0]);
631c228cd09bd5 Christoph Hellwig  2006-07-08  1103  	} else {
631c228cd09bd5 Christoph Hellwig  2006-07-08  1104  		scmd->sc_data_direction = DMA_NONE;
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1105  		if (cmnd) {
ce70fd9a551af7 Christoph Hellwig  2022-02-24  1106  			BUG_ON(cmnd_size > sizeof(scmd->cmnd));
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1107  			memcpy(scmd->cmnd, cmnd, cmnd_size);
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1108  			scmd->cmd_len = COMMAND_SIZE(scmd->cmnd[0]);
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1109  		}
631c228cd09bd5 Christoph Hellwig  2006-07-08  1110  	}
631c228cd09bd5 Christoph Hellwig  2006-07-08  1111  
631c228cd09bd5 Christoph Hellwig  2006-07-08  1112  	scmd->underflow = 0;
631c228cd09bd5 Christoph Hellwig  2006-07-08  1113  
55db6c1b8ed52b Boaz Harrosh       2007-10-08  1114  	if (sdev->scsi_level <= SCSI_2 && sdev->scsi_level != SCSI_UNKNOWN)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1115  		scmd->cmnd[1] = (scmd->cmnd[1] & 0x1f) |
f59114b7b5dc67 Tejun Heo          2005-04-17  1116  			(sdev->lun << 5 & 0xe0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1117  
a701e84256b6bd Brian Kao          2025-12-02  1118  	/*
a701e84256b6bd Brian Kao          2025-12-02  1119  	 * Encryption must be disabled for the commands submitted by the error handler.
a701e84256b6bd Brian Kao          2025-12-02  1120  	 * Hence, clear the encryption context information.
a701e84256b6bd Brian Kao          2025-12-02  1121  	 */
a701e84256b6bd Brian Kao          2025-12-02 @1122  	ses->rq_crypt_keyslot = rq->crypt_keyslot;
a701e84256b6bd Brian Kao          2025-12-02 @1123  	ses->rq_crypt_ctx = rq->crypt_ctx;
a701e84256b6bd Brian Kao          2025-12-02  1124  
a701e84256b6bd Brian Kao          2025-12-02  1125  	rq->crypt_keyslot = NULL;
a701e84256b6bd Brian Kao          2025-12-02  1126  	rq->crypt_ctx = NULL;
a701e84256b6bd Brian Kao          2025-12-02  1127  
631c228cd09bd5 Christoph Hellwig  2006-07-08  1128  	/*
631c228cd09bd5 Christoph Hellwig  2006-07-08  1129  	 * Zero the sense buffer.  The scsi spec mandates that any
631c228cd09bd5 Christoph Hellwig  2006-07-08  1130  	 * untransferred sense data should be interpreted as being zero.
631c228cd09bd5 Christoph Hellwig  2006-07-08  1131  	 */
b80ca4f7ee36c2 FUJITA Tomonori    2008-01-13  1132  	memset(scmd->sense_buffer, 0, SCSI_SENSE_BUFFERSIZE);
e1c234685c5080 Boaz Harrosh       2007-10-08  1133  }
e1c234685c5080 Boaz Harrosh       2007-10-08  1134  EXPORT_SYMBOL(scsi_eh_prep_cmnd);
e1c234685c5080 Boaz Harrosh       2007-10-08  1135  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

