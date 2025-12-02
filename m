Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC4C12F5A5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 02:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764640949; cv=fail; b=dmCVgeRh9/eOCu27kOh+1ZBKQrRCPpjN32E2tHq3gO5DwsJry12SOfWFj6v2OibBQX/geHyGE/FEIGEIaBsmm7vf6MffBB4Bfe3na+6DEm2OjhOXDcCCWBsZX9rs5XMY9MZkZETm4+RlSMCZKu7vPN7mduW448Way1ocOjBaQlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764640949; c=relaxed/simple;
	bh=nVKdx03jdt8O1byTYNHfvdjW1Gpn1GkjEPhd+4Ppm0g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=B/H1BCQ4gbVCFWA0FEV0xwhr7IhCCE1TC1VpPfl/MTXGZ9hu3MIQHiq8knaapFIBPJFAdBQgUBoTIrBLgMjV/uVzVq/5oHUzqZm/+ucWXzalA5QW8K4dgapmpljiAG5Sm2RXwan7uKLx5i5zmbU7ElyUjvrBnxDTWpOLUVoObTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jm7pS9Nz; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jm7pS9Nz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764640948; x=1796176948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nVKdx03jdt8O1byTYNHfvdjW1Gpn1GkjEPhd+4Ppm0g=;
  b=jm7pS9NzhupNKkgUcBKhBX0fN1PVjD0Jt5saMSwS0xQUuO+lyviR/Gu5
   H1JizMrFkLw1vkF7DCWBOGDccMSigGGbMa8i1sVPobKJW3ErmttpyYFdm
   t8WqjSD1xZLTYX1mKy6WM0Hah9ZRbk2dRofxC6SKXSic3zwntOlfqIq1U
   fte5FYzSqmaaD1uGeBhmczNNIozX/dXC2/Li+iQDZ4N95btjgTcOJ7fjM
   chJgSwg96xhMgmKusIXhBaCwcm+sgEyCkzce4iQnYuLXcNY/V8DMnmaGo
   /WH4ntsVughuJwmsOH1oJ+LPiduyV/ptFE0IKv/WlHDQxKvpN+uidyqqi
   A==;
X-CSE-ConnectionGUID: ZEUM8nbiQEaqMaOBFmSQkg==
X-CSE-MsgGUID: NkP/q1mKRMS/G5L/Lu/Xdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66633591"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66633591"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:02:27 -0800
X-CSE-ConnectionGUID: tl5wne+NTWGk6FEw2jarWw==
X-CSE-MsgGUID: irWsJL9TQriXdoSUh9U/Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194071359"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:02:27 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:02:25 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 18:02:25 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 18:02:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPCGX2wrIBoL0wX2J872pEpYpcJu83nIm3Db9jrQ8CH6OwQ3E+KH4WbEV+R5RhUfXzdWdhaAJ8+JWoHV2UVNzlJuSFkOqFoI24VtWEzFn3Ea9AHWOR9QROY2iXo6MTfTRjoWtSq1++sLNqy5gM3cwucA5KUeYr/aI/FaBhxjx787ll3Ed2334GhML/CWbUW2sU66RND34jcaKNafFwzDoLpALdQTsz04zmBMWv/h13Bi4eo8IpstRzJCr3F5X/hSmzYWUXIj+qIekeg60IN35qfTY8QDKtJzT/ucu+4ShktduXGOYtciyAyHwuCs+QpJnGZwcpb0LoQfdoPcD6EhmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcCoDtv7rOAQy1wH+skYsCDzAcVRP0319A3FvlM8KH0=;
 b=KIrMQG4iW9za4eIk/9WOd1wu3oB0uJXDkKyNHHrcFCE8pW1jOX4/CN5Vw5/Ehx+lttHwBugLgaCxoRU8Ts8Pfv5KI8CWkNju97gsr2M4ZsUlNnkdGz/i6MhZgnPAIZP5RgORdzxTrg1ul3RzwVmqcQSON7GGmpc0QPUOlPmkwvaDKT0Yo/bxNfAl5eHEHNWhJy56VV0vKCVO0akJ8CLD3CjHpdiOHknOkeIeEuxuq7l35ceDzI05KjuV6nS/o7Y/9vHEv79GHn773G977MBJV077wKrD2dfEqeOdmjCQdzoIfBUgDt6mTkbqCpWrV6/TDTFw4H6QNeDk7AjBtMSG5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 02:02:23 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 02:02:23 +0000
Date: Tue, 2 Dec 2025 10:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: David Matlack <dmatlack@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, Alex Williamson <alex@shazbot.org>, "Alex
 Mastro" <amastro@fb.com>, Raghavendra Rao Ananta <rananta@google.com>
Subject: [linux-next:master 12706/13171]
 tools/testing/selftests/vfio/lib/iova_allocator.c:31:2: warning: format
 specifies type 'unsigned long' but the argument has type 'u64' (aka
 'unsigned long long')
Message-ID: <aS5IpMbH2vWQk7Ua@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: 93097193-afd6-4e1c-fa92-08de3146d54b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HnSvByYLiHPZzh67NgU64thOAUeLmbCiNZkI/9h51GPEYGilTEWjZdfw6zy4?=
 =?us-ascii?Q?DL8J1TIEY518ZTNkQLWdtoyhe8IjFOmQZHXjC4ASxNhSqxtwPKIk3OsxATX8?=
 =?us-ascii?Q?ZuBs1/4sjCIuguvFJG08Ltq+YnrUnb4GoLXNZZB2eL6TUXRW8kZqKEdrbm8v?=
 =?us-ascii?Q?YwVFhdhdLl2i/tMRIY3qaAceOVt+/aETsBUXQsgi859Xenp8fPxkHPKvHYFK?=
 =?us-ascii?Q?MKboELT6nVNQLrpGgCXdtat0OzsDu/zxXzLBC8Rr8lcGwtGNwDDSjems9bZM?=
 =?us-ascii?Q?QGX8E+ZC6eG/K1n3U6E/JYmnrZik6l3v1fLrwT/03aN03PJNR4ERPxZyrdwH?=
 =?us-ascii?Q?ep3vhamgUK9Et0WVJruTnrQmPhIN1/EkKawiDLkO+E0TzkmRVVEoHTlhhwmW?=
 =?us-ascii?Q?tvz1n4R8U/hhnH9+mYFjeHQxtMJNaRQrEMcsYXhG8ZBP3uRXgSMDhwHZPzHK?=
 =?us-ascii?Q?Mv3BvwGjBp/I8uSf1dTLnz7yWb5KCNVUdVtB4IwJ1gptFZKvpL+yoxYboEB3?=
 =?us-ascii?Q?mkt8dvDSYbTjJ67tp5tGgxzsqNp4k7itcA287n6LZXzzj182URL1oMT6vw/I?=
 =?us-ascii?Q?+u8mj00GNWsjD5KfyJCYTQik3yGVo79tA2pER1edvtoQ4vFy4QUXLBmSO5Od?=
 =?us-ascii?Q?au5rC44cyajEIvPmTF2pIvu71omqsazM2V2Nv0g11zI/opWjiAXK58EovrgC?=
 =?us-ascii?Q?MmZU0bLURE4SUQ/3aorK5k0P7bKhqcQAYfR8rEjNRXRP1XqTQI3WhS1OnBde?=
 =?us-ascii?Q?AuM4DFaRPGZFaiaJitlpTBRyF0syMKamK+2grk05FwelXve5SvXmqBktuGtU?=
 =?us-ascii?Q?NQYl6IYST8XeXnHGDcL2oTGTI9F6BYz+VKczJ7UhzX0QQf6JRVLlxKIL+rvh?=
 =?us-ascii?Q?HGYtHQhIeeIlt0ysu6wQOlIavk0mQNaMRngowCYDcJ8QEpGROeduE/gg6TAQ?=
 =?us-ascii?Q?EiplWsfMoJsJvUnXaqQCx+7Qu4KCzG6/q4VX2rbXaclXOvZjmQvbELjha8dh?=
 =?us-ascii?Q?zusgrDBW3JTW64u6k98kHinvDAwGyooi8iWj/C6fEPrJdGS32DZfa2u/bLm0?=
 =?us-ascii?Q?rGmlCvx/pz4EjRjuo15UZBsahXd6YKFSaBLZ3Y5ncxCzbzGPeaYA+d+maCgx?=
 =?us-ascii?Q?zaxXJZFkbeVFP0VFmV6EMD0/ABMDOqzRZxhDB48x/WwwZ9nYQKVzqRj/z2x7?=
 =?us-ascii?Q?GLXhDvN8SXR4UXM+bMyeP74lnBD6z6zD9cji8WiPmzY9GRxcqw13iDrF3LSI?=
 =?us-ascii?Q?Qnk0LyF26nWR/ppgLuru6hBmIeRnCIfgv71fosEq2m5ld/PFzaNmlLMkVXrF?=
 =?us-ascii?Q?XzhVTJf7z3tcXeSuN6AmdvU05fe8V86u/+2rU2XBrkk6R3EgPn+KNzzrc6Hx?=
 =?us-ascii?Q?1wCNXIl/3y8EgsdT/h7v47lpkkPv+XU8CS2h692s8yGI8jXh8Lct5nTzosRq?=
 =?us-ascii?Q?SEZ/GlGkjoSO+r8T0h5YkOtlPT+gRbtoFMw3DlCmcFwLlM0IwZdbmQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9cSmZ02Ide7U+fBve18inV6n8QYkBPgLhdHF2XOAuuW2rRvmG2VLn/ZSFDY5?=
 =?us-ascii?Q?nDcgD+b8kI3b9iYAl4eTEnO7JZx/OIUA97Y0ahZU7qz7JrtZu9JUiLhOJhRj?=
 =?us-ascii?Q?++194TcymYmd8oKm4+p8X1D6bRuHp9dWRWuCUrWZVbKeP2S8xwBW8wCzhGvw?=
 =?us-ascii?Q?+ARMfgd0MyHOnQrzMua1r3frF9iwxZDzKUgyRWWrrmMCMvN8msm+ZuwZsx7g?=
 =?us-ascii?Q?G1Q96k1Dm9onY4QPF3rqw+r32TYfz9OGYJOyN5LzOYoiCsKeEyfpec+8pqge?=
 =?us-ascii?Q?EQnJa4+UHuPgrA8mBysu5yopik/ngFjANTtN+PieLVMkeS6Yy/p/osQK2gK6?=
 =?us-ascii?Q?JPtJNfW8j/FQ0d6qUysQWhBBp1SiHYDRgPytzfFdHOeW+QKhWOBRDPUQFFaG?=
 =?us-ascii?Q?C2lHNla6pG3Bldf7BCWtfm90LZANi8MT+xuOa3vKrrBfrYyrv1D9MPFWQf8Z?=
 =?us-ascii?Q?viAb59RmUvFqwAKMhr1FVIJra/M8/KoDVI+cI1DSUbx3xr1uI2dcj8tZNDwY?=
 =?us-ascii?Q?nHNe8boGs9Bje7ycxu+ehOrydiv3bFHQ6MJTkKkw5RReUZYki4tUoR+Msi/s?=
 =?us-ascii?Q?l87RxBeYnxiqFDgpOcPSCbGWUCp2IHvhpGoL6wy8CssRGLRwNRC2AICLxURZ?=
 =?us-ascii?Q?ls5+aIc3kHxO219IXjtRAlj2wHGZc8K/qE4NCGUjvg7aM6HAtw1aZWKkBf35?=
 =?us-ascii?Q?prMwg/zj+FocmbFxU5fHb9ryaBmFIhRRkjO4ErxwunoqgdNzYu3rojw8IgvO?=
 =?us-ascii?Q?5IvqH1zHxntwr924W3D/76Nm3mb/Qh7ITmccQGQZ0Aam9QJSiijBtBiwIwv4?=
 =?us-ascii?Q?dK6Ir4uUpT1wiZ1wmW03Ej4CjFLltYf/0wtAxY+THhXo82JcnV7MKhJraQSk?=
 =?us-ascii?Q?qoFbKfcTLA2Qpgx4eHgjAXkAkORpBToYlkjAQ4SYAEhZkjE6PQAxvWA3EnmE?=
 =?us-ascii?Q?P4fbykZOyvQ3DdirOjc/RgluHp6KigifEHVsSX/jSsW6iZgNf4TMuJC5lEoK?=
 =?us-ascii?Q?W9W1H5Yw/iAew1LBHD/pfvCGpRZUBOSawHqjRzYF1ijGzrvQdP1DX63Jejt/?=
 =?us-ascii?Q?6fUeSLHG502bACbVupqYymUH+wMJz566/QzUwjD/erpaZ/LmKmNFwW5MH7RI?=
 =?us-ascii?Q?BP8evGZJEW/KukblFchNbKr98ewP/B85FceQqHGYTylm9VX+T90o13HqSiRY?=
 =?us-ascii?Q?HfHaaX70K1mUwV6o4r1SNLC23IGB4QlyKnO0D3AOMHyz1SV/i1RM34wk/IjT?=
 =?us-ascii?Q?F9PPcuUhC4A4Nq55UwWLPwEptaQSvT23MZXhNiTdWllGTeXvt66c9s4MRnYi?=
 =?us-ascii?Q?OFEbqC9mXedTZ90wTjM/BuN68q+83rM5j88Uo+19wnBghffmM3JbzbBBVNFs?=
 =?us-ascii?Q?kufDzDLmFwkdLl3kcvIdorTjAkCpMgv87OahDQ9EjDTRuosH851k97ouW9TK?=
 =?us-ascii?Q?W2OHinEfdySPHdCgVHMce1CkDIBtR9wUt/Z8ukNRigiXPXcEBTsTEFWtI3mk?=
 =?us-ascii?Q?rOQmt8a0O7KoV+m8fK7mhpvCwDD+DWC6/VPqILByXBncipJ/hRqmSJQUjP+K?=
 =?us-ascii?Q?V2beYn4eUpIa0+kc9QJRy4mL/12nUA+Rxh/IdIsHJaM8wUaS6m9cAw1ZG0kh?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93097193-afd6-4e1c-fa92-08de3146d54b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 02:02:23.2343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLimYRYsbXVJhSuF4q1LE2QXzrIKX91X5cpekQCCnMp20c4GVBgpVCbFrzv3DCUNZtsigkcScoBfwGNW4Q1cqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
X-OriginatorOrg: intel.com

Hi David,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 2607a4361312bf407931597423fe23db406ca8d3 [12706/13171] vfio: selftests: Move IOVA allocator into iova_allocator.c
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512020059.wo9Sr70i-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020059.wo9Sr70i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020059.wo9Sr70i-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:282:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     282 |         VFIO_ASSERT_EQ(__vfio_pci_dma_map(device, region), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:295:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     295 |         VFIO_ASSERT_EQ(__vfio_pci_dma_unmap(device, region, NULL), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:295:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     295 |         VFIO_ASSERT_EQ(__vfio_pci_dma_unmap(device, region, NULL), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:306:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     306 |         VFIO_ASSERT_EQ(__vfio_pci_dma_unmap_all(device, NULL), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:306:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     306 |         VFIO_ASSERT_EQ(__vfio_pci_dma_unmap_all(device, NULL), 0);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:341:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     341 |         VFIO_ASSERT_NE(r, -1, "F_GETFL failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:341:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     341 |         VFIO_ASSERT_NE(r, -1, "F_GETFL failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:344:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     344 |         VFIO_ASSERT_NE(r, -1, "F_SETFL O_NONBLOCK failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:344:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     344 |         VFIO_ASSERT_NE(r, -1, "F_SETFL O_NONBLOCK failed for fd %d\n", fd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
>> tools/testing/selftests/vfio/lib/iova_allocator.c:31:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      31 |         VFIO_ASSERT_NOT_NULL(ranges);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:46:39: note: expanded from macro 'VFIO_ASSERT_NOT_NULL'
      46 | #define VFIO_ASSERT_NOT_NULL(_a, ...) VFIO_ASSERT_NE(NULL, _a, ##__VA_ARGS__)
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
>> tools/testing/selftests/vfio/lib/iova_allocator.c:31:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      31 |         VFIO_ASSERT_NOT_NULL(ranges);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:46:39: note: expanded from macro 'VFIO_ASSERT_NOT_NULL'
      46 | #define VFIO_ASSERT_NOT_NULL(_a, ...) VFIO_ASSERT_NE(NULL, _a, ##__VA_ARGS__)
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:34:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      34 |         VFIO_ASSERT_NOT_NULL(allocator);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:46:39: note: expanded from macro 'VFIO_ASSERT_NOT_NULL'
      46 | #define VFIO_ASSERT_NOT_NULL(_a, ...) VFIO_ASSERT_NE(NULL, _a, ##__VA_ARGS__)
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:34:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      34 |         VFIO_ASSERT_NOT_NULL(allocator);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:46:39: note: expanded from macro 'VFIO_ASSERT_NOT_NULL'
      46 | #define VFIO_ASSERT_NOT_NULL(_a, ...) VFIO_ASSERT_NE(NULL, _a, ##__VA_ARGS__)
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:38:37: note: expanded from macro 'VFIO_ASSERT_NE'
      38 | #define VFIO_ASSERT_NE(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, !=, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:54:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      54 |         VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:41:37: note: expanded from macro 'VFIO_ASSERT_GT'
      41 | #define VFIO_ASSERT_GT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:54:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      54 |         VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:41:37: note: expanded from macro 'VFIO_ASSERT_GT'
      41 | #define VFIO_ASSERT_GT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, >, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:55:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      55 |         VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:55:2: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      55 |         VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:37:37: note: expanded from macro 'VFIO_ASSERT_EQ'
      37 | #define VFIO_ASSERT_EQ(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, ==, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:61:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      61 |                 VFIO_ASSERT_LT(allocator->range_idx, allocator->nranges,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      62 |                                "IOVA allocator out of space\n");
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:39:37: note: expanded from macro 'VFIO_ASSERT_LT'
      39 | #define VFIO_ASSERT_LT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:4: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                      ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                         ^~~~~~~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:61:3: warning: format specifies type 'unsigned long' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
      61 |                 VFIO_ASSERT_LT(allocator->range_idx, allocator->nranges,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      62 |                                "IOVA allocator out of space\n");
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:39:37: note: expanded from macro 'VFIO_ASSERT_LT'
      39 | #define VFIO_ASSERT_LT(_a, _b, ...) VFIO_ASSERT_OP(_a, _b, <, ##__VA_ARGS__)
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/vfio/lib/include/vfio_util.h:32:22: note: expanded from macro 'VFIO_ASSERT_OP'
      31 |         fprintf(stderr, "  Observed: %#lx %s %#lx\n",                           \
         |                                              ~~~~
      32 |                         (u64)__lhs, #_op, (u64)__rhs);                          \
         |                                           ^~~~~~~~~~
>> tools/testing/selftests/vfio/lib/iova_allocator.c:68:7: warning: comparison of distinct pointer types ('typeof (iova) *' (aka 'unsigned long long *') and 'typeof (size - 1) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
      68 |                 if (check_add_overflow(iova, size - 1, &last) ||
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/overflow.h:48:15: note: expanded from macro 'check_add_overflow'
      48 |         (void) (&__a == &__b);                  \
         |                 ~~~~ ^  ~~~~
   tools/testing/selftests/vfio/lib/iova_allocator.c:76:7: warning: comparison of distinct pointer types ('typeof (iova) *' (aka 'unsigned long long *') and 'typeof (size - 1) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
      76 |                 if (check_add_overflow(iova, size - 1, &last) ||
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   tools/testing/selftests/../../../tools/include/linux/overflow.h:48:15: note: expanded from macro 'check_add_overflow'
      48 |         (void) (&__a == &__b);                  \
         |                 ~~~~ ^  ~~~~
   28 warnings generated.


vim +31 tools/testing/selftests/vfio/lib/iova_allocator.c

2607a4361312bf David Matlack 2025-11-26  23  
2607a4361312bf David Matlack 2025-11-26  24  struct iova_allocator *iova_allocator_init(struct vfio_pci_device *device)
2607a4361312bf David Matlack 2025-11-26  25  {
2607a4361312bf David Matlack 2025-11-26  26  	struct iova_allocator *allocator;
2607a4361312bf David Matlack 2025-11-26  27  	struct iommu_iova_range *ranges;
2607a4361312bf David Matlack 2025-11-26  28  	u32 nranges;
2607a4361312bf David Matlack 2025-11-26  29  
2607a4361312bf David Matlack 2025-11-26  30  	ranges = vfio_pci_iova_ranges(device, &nranges);
2607a4361312bf David Matlack 2025-11-26 @31  	VFIO_ASSERT_NOT_NULL(ranges);
2607a4361312bf David Matlack 2025-11-26  32  
2607a4361312bf David Matlack 2025-11-26  33  	allocator = malloc(sizeof(*allocator));
2607a4361312bf David Matlack 2025-11-26  34  	VFIO_ASSERT_NOT_NULL(allocator);
2607a4361312bf David Matlack 2025-11-26  35  
2607a4361312bf David Matlack 2025-11-26  36  	*allocator = (struct iova_allocator){
2607a4361312bf David Matlack 2025-11-26  37  		.ranges = ranges,
2607a4361312bf David Matlack 2025-11-26  38  		.nranges = nranges,
2607a4361312bf David Matlack 2025-11-26  39  		.range_idx = 0,
2607a4361312bf David Matlack 2025-11-26  40  		.range_offset = 0,
2607a4361312bf David Matlack 2025-11-26  41  	};
2607a4361312bf David Matlack 2025-11-26  42  
2607a4361312bf David Matlack 2025-11-26  43  	return allocator;
2607a4361312bf David Matlack 2025-11-26  44  }
2607a4361312bf David Matlack 2025-11-26  45  
2607a4361312bf David Matlack 2025-11-26  46  void iova_allocator_cleanup(struct iova_allocator *allocator)
2607a4361312bf David Matlack 2025-11-26  47  {
2607a4361312bf David Matlack 2025-11-26  48  	free(allocator->ranges);
2607a4361312bf David Matlack 2025-11-26  49  	free(allocator);
2607a4361312bf David Matlack 2025-11-26  50  }
2607a4361312bf David Matlack 2025-11-26  51  
2607a4361312bf David Matlack 2025-11-26  52  iova_t iova_allocator_alloc(struct iova_allocator *allocator, size_t size)
2607a4361312bf David Matlack 2025-11-26  53  {
2607a4361312bf David Matlack 2025-11-26  54  	VFIO_ASSERT_GT(size, 0, "Invalid size arg, zero\n");
2607a4361312bf David Matlack 2025-11-26  55  	VFIO_ASSERT_EQ(size & (size - 1), 0, "Invalid size arg, non-power-of-2\n");
2607a4361312bf David Matlack 2025-11-26  56  
2607a4361312bf David Matlack 2025-11-26  57  	for (;;) {
2607a4361312bf David Matlack 2025-11-26  58  		struct iommu_iova_range *range;
2607a4361312bf David Matlack 2025-11-26  59  		iova_t iova, last;
2607a4361312bf David Matlack 2025-11-26  60  
2607a4361312bf David Matlack 2025-11-26  61  		VFIO_ASSERT_LT(allocator->range_idx, allocator->nranges,
2607a4361312bf David Matlack 2025-11-26  62  			       "IOVA allocator out of space\n");
2607a4361312bf David Matlack 2025-11-26  63  
2607a4361312bf David Matlack 2025-11-26  64  		range = &allocator->ranges[allocator->range_idx];
2607a4361312bf David Matlack 2025-11-26  65  		iova = range->start + allocator->range_offset;
2607a4361312bf David Matlack 2025-11-26  66  
2607a4361312bf David Matlack 2025-11-26  67  		/* Check for sufficient space at the current offset */
2607a4361312bf David Matlack 2025-11-26 @68  		if (check_add_overflow(iova, size - 1, &last) ||
2607a4361312bf David Matlack 2025-11-26  69  		    last > range->last)
2607a4361312bf David Matlack 2025-11-26  70  			goto next_range;
2607a4361312bf David Matlack 2025-11-26  71  
2607a4361312bf David Matlack 2025-11-26  72  		/* Align iova to size */
2607a4361312bf David Matlack 2025-11-26  73  		iova = last & ~(size - 1);
2607a4361312bf David Matlack 2025-11-26  74  
2607a4361312bf David Matlack 2025-11-26  75  		/* Check for sufficient space at the aligned iova */
2607a4361312bf David Matlack 2025-11-26  76  		if (check_add_overflow(iova, size - 1, &last) ||
2607a4361312bf David Matlack 2025-11-26  77  		    last > range->last)
2607a4361312bf David Matlack 2025-11-26  78  			goto next_range;
2607a4361312bf David Matlack 2025-11-26  79  
2607a4361312bf David Matlack 2025-11-26  80  		if (last == range->last) {
2607a4361312bf David Matlack 2025-11-26  81  			allocator->range_idx++;
2607a4361312bf David Matlack 2025-11-26  82  			allocator->range_offset = 0;
2607a4361312bf David Matlack 2025-11-26  83  		} else {
2607a4361312bf David Matlack 2025-11-26  84  			allocator->range_offset = last - range->start + 1;
2607a4361312bf David Matlack 2025-11-26  85  		}
2607a4361312bf David Matlack 2025-11-26  86  
2607a4361312bf David Matlack 2025-11-26  87  		return iova;
2607a4361312bf David Matlack 2025-11-26  88  
2607a4361312bf David Matlack 2025-11-26  89  next_range:
2607a4361312bf David Matlack 2025-11-26  90  		allocator->range_idx++;
2607a4361312bf David Matlack 2025-11-26  91  		allocator->range_offset = 0;
2607a4361312bf David Matlack 2025-11-26  92  	}
2607a4361312bf David Matlack 2025-11-26  93  }
2607a4361312bf David Matlack 2025-11-26  94  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

