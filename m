Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F9F374E7F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jul 2026 05:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008476; cv=fail; b=NFRvNor76u19sE0x8L82VeTO+FU+KNoXbeO+Dm4Atcxe2PYtIDuSFWNA6wrLo9GiuGx/cWOpwys1KF0ucMqmUeFGNVGcgAPJoiO/zllusl9xGe5tC6U3CX/bdzEVI95srBB4Z2zLzJKiOEDRXMhjruGMsWHrT5uz6K7AUwIzSsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008476; c=relaxed/simple;
	bh=QM9EcgALSUlqEalZ62sT5jmp5hRCLhhPaIdKzKg2zPk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=s/UL+t7/SJDiMxNJnYj2tLRuem7H5mihSsiu0uM167nzyYpzXuwxeXE/8M44MZd5DCNapKYqfq5G516oEcRM20cbY8w0HTW0EQHbd2jBsVIHfAlRDCSvZx88pvZeBstyhcvwixSkd02NIvgguDgf+2EyZliPJa373fzxQr0vymw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aG+2N/1Z; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aG+2N/1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784008474; x=1815544474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QM9EcgALSUlqEalZ62sT5jmp5hRCLhhPaIdKzKg2zPk=;
  b=aG+2N/1ZeYcTUqRzTA3629KmGvpyteFye6XT6/iWsO0pH/nXM16bI+sz
   vhfnvOnzdoULo1QA5O4dPFkwMzsk1HyWYpiK3DybX3k4wiq6UwrWhlKga
   gRyj8rzinKr/NhPhzCv1U2hCREShMRSDhH9Oi3TtbVl6oOCEnimzkhDv8
   BHSQlI6/L34bVNAuZPdJiyHDuzn+bh3TQQDFGWVxXRD52HAbAnerrDsuo
   HMO3F/Za15si41ZThi1XETVsWLHOBt57nN+dsnb/7VNi8+wHYgeESqO7L
   DR6uXSSWawLFso8kq05HgXZgIF/fj4mZSmaxi0Veum5tgH4rP+jJISVsd
   Q==;
X-CSE-ConnectionGUID: LBwL6fH4Ry+hz2O5WSTWow==
X-CSE-MsgGUID: G9JKoyFeSyWqMkbwnzRYkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="95770875"
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="95770875"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 22:54:33 -0700
X-CSE-ConnectionGUID: K7TmpOERT1CEEKTZDL9M1A==
X-CSE-MsgGUID: 0FWclWS0TtCD9JuqKBRe8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,163,1779174000"; 
   d="scan'208";a="259333291"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 22:54:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 22:54:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 13 Jul 2026 22:54:32 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 13 Jul 2026 22:54:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzDFjy+Z5h6gcmDXTLbGkjg6jxF8ESI4xam1gPbr800IgYzA5ns9K+6iqD6Bvc9pGAfOAIvjk+T+zdq9ZOvnRJz8vRYXscpt2kgJh7GHDXULML2I3Mf8n3/UlxO36oxqIBBill0ym+Ins95Htkwvh5GdUqXFb7hWZJgVc8rWWeTeRudJ6By6QqJ3vX0F1g2zp5sVwegweS4H6BpySAGTP7J0lVb6R1pM6WxAxMu/XwXxMS+EDYeQbT/bPoK35zo+m2WbH1dj57nMHBEDw936Cwe2WFilhXOFQRmi1vV4XSIvOODMPF0Owt1HQp0WogUXKISgn5WiySaKcR5bx9eQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwbfIpmLHqtmGlk2BY+xLtTwVmkowCAs+qB1KPTGHow=;
 b=FgnyxEx7E1eq1eJOf2LUrQ5JQwPwL6j/FgmOUtobIBUkJLxsg8N+9vto9JoL6tCrjfFaHxxBBoGP7Gm94qB/mG8BI3/4a5TSXiSTkHK+aPEyaCGa5UkBByWFOLpIPwLyq2DLQh0+HerMyru3h1NC6SyQqORutCEDAte6Z1J+kPnb5ukxJyNcd3mphxpDRV7Nub3EiP2CQ9cIXhFVG4D0yE5sEB9dHT8fr56qEYmzxKMJyNWdHWwHx0y55sTUOwiiXIfAcmgz49SW9OssAYzVyLyVBXbrl/Huua7elk4zH41XO9Z0vsqj7ZqCwmK1/yFfbF33bhQk84f7ryXjdjfngw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by SN4PR11MB9941.namprd11.prod.outlook.com (2603:10b6:806:4ff::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 05:54:26 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 05:54:26 +0000
Date: Tue, 14 Jul 2026 13:54:18 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [thomas-weissschuh:b4/mips-vdso-install 3/3] make[3]: *** No rule to
 make target 'arch/mips/vdso/vdso.so.dbg'.
Message-ID: <alXPCqIuhE2JPq15@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0034.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::19) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|SN4PR11MB9941:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ecc766-c934-4c1a-7bf3-08dee16c5cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: jfE3CGstsUQk9oi2j49d88JQKn0BR6SeWRjnj0Csv3VhXIc0vBTkUcHM2Go7OvkpUPF7TvY6W0BjMJN5qgN+/qCo+jaZsIGBpP4psO3mm5AUDsWqdDqtUXPv/20wmiIbghUoDocDvAFIFlNquF3jpjMRUej3wshFBhePNOT9Wh1hZ+m1rwHqyNXJqwAN6CU6mDP3tKG5adYM927xcY3kIre7mQoGJc74vveJtYq/XcIySwOp54P0/QrbL+0hYGRbVdwHwxmMQdXzqSLbwuKucWNaOwspFq4YIrE4mQphKx0mSfaE6F64hpOj30J9KIPKoPtfe2RmmjLIbiY2ooggUpEhkgGhpRW07twW2ICBpsB9haM22g8DVV1bWtWWAIMdLHAsXjiMb7pNthWPGGW/zSgYencmY4KHmeRlkXGJGKh7+uc1LzDXyqTA1btkuREvfdCwUheOXl4Y2XHArjhF31Mhe3Lv2V2el/Xq7fwySgunrbYEeJ+z6q/aNO+Se9lhChPNOJPWv8vEXrWXrbCNgE/G89+vaZxNOY2M48xMoTDuYwHJUX0S8Mf48HJI5NFK1bgbzjs0pLdFco2E8nF5pFAhWNjcqjOynWRfmllInwtMZnEq9tXst6LFywWo2oEt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?40Yv3wt8jrtq8LcuCtKpYwPbFEvx/dMt/fAWCB4bHnIRuMc8CQpic4kqAi7Q?=
 =?us-ascii?Q?WoCYBZOG6tpzEhRNL2n/OSqoHu+kHuwhpnQgyAOil65GGFHfcxB/IAckEIhN?=
 =?us-ascii?Q?RStI4UtWauiZyR5ZJGU7EuuwCSXOuFaC+L+EEPuwGDZo3lye8Fw9QissAf9f?=
 =?us-ascii?Q?UIqs9iVZcnB3L7HSqRDZXAS3Wfux+RqY5euFqh8MPiCBXbwZFHHV+sXc6RGc?=
 =?us-ascii?Q?/2oLH19wniSKYq8LM+kIMr4/TY8maSnOoLPGcxnjGo96Aucsp0xvULlGsrnv?=
 =?us-ascii?Q?A/cmgWeGJ9TEn77ejWmO7+I0HLekA95lwThwL/CtRJRUv0hzb0V6vM8pqRod?=
 =?us-ascii?Q?xDqKf2CPqSUgLtpLzvYM9NpET9xxTR0GP6xFU7sBNt57qji+nfBP023R7UlY?=
 =?us-ascii?Q?tavYXs9Ymeee4V8sAb8+VG3BXfs/A5hN6P5uet8EZWNekgBhBfOwqRIkNzJ+?=
 =?us-ascii?Q?8G9BluoPQBH/Ul8UvFmvz9tBM425q/StwGpc1OoXLZvxTWywqjpbcV4W3KFA?=
 =?us-ascii?Q?lhHe0EclPIbfE0a5eZEhJ+W/RbL6AjDmx9p2+29RJ2SgpZFEgH3J2O7sat8z?=
 =?us-ascii?Q?gKcE5Ec7kB9ksaoj2jpMsV6Lb0O6ZaEF0d9AvcdTucLdNusIkK0opPY7UZfd?=
 =?us-ascii?Q?KBIc5sAAvN+EWXeMJ5iBl78GwCvRv7zcp1aKQkRiEmH8Wr4nwcBw+a6Gm7Ml?=
 =?us-ascii?Q?iiYRxVuQVNqcY1eG0v8Rf2/ItZIg6Nld+XyY1OLavhpGphYtoy5PXIlHgyHp?=
 =?us-ascii?Q?wZvUAKiJ8c69zUomD3BGIlR+mvwFjO+Dt8T95XPwUa/J3htLJh2evS35NEdR?=
 =?us-ascii?Q?sxtf2hNCqvzw1TE16Cr+uibtPQpS/bsVAiR1Yin/vX496vmrXnRdNhqfsu2k?=
 =?us-ascii?Q?9i1jWy7HlHuKxgx6RJxqqH9BG0eWLUU2mgZo7KXUKAc+qD7005l4D7+crSty?=
 =?us-ascii?Q?oN5NwHXDIc17R+x4rdRHnp/EPT98JOsHKInI+d+LJXQYl8dP4F9RiHSD/GRA?=
 =?us-ascii?Q?je07K+C9qDjgRKl6g8rsD2p8GgbkXFpRvWYSMs5iKLtxFZ/oLNf6DuQLuO8v?=
 =?us-ascii?Q?CiSiDnFQ1E6LycR2/wPKte7oAiMNM3HiGDycEHMHQfQSVAi08yvP64XK5FIv?=
 =?us-ascii?Q?chK4fn8SslMKJ3Rcu/O/LAW+RE8q0MsoIm0ZivooKHrfnYo00x61KU3VB1IC?=
 =?us-ascii?Q?JCcE7CCami26okd0h42bBNctrh+mJS4o8z44ihW6rWhEwOcouHfH96Vpb80J?=
 =?us-ascii?Q?Ukcvfw1SZsND6sbHdEM9wwTKLCfcl2Nx7G1qc1h3VNH/FQLfkt/Rwt9T1Rv5?=
 =?us-ascii?Q?/HVscjCmZ0tnnXHv/bF3//fKKvAl0sYHBT9zbkFHLsKD4ueyDJBjXEbfeMCO?=
 =?us-ascii?Q?qbU+6zb3PKxHU49e0cPeasd5yKCpJeGM930x8FSsTppIJ7PwduffMuFv8MUA?=
 =?us-ascii?Q?aBJRmv2YprAY/uIT5r5jcrtNwIe9VAXQDy7n9NGOndFPiDi+hfoPNLBkhtD3?=
 =?us-ascii?Q?epyHjhZ9IEomGxtNf8Xd06nz+xNZgfg3xSMqy+kYbtB96JqFUteCUm0HYXZ6?=
 =?us-ascii?Q?vSd2y16HRpKjr6PnyVJqIPFKpRat2hrIn9/0yNfBR+J8daYbM90q5HBq8ric?=
 =?us-ascii?Q?p/OhETKxbqErwRhhmFvJrupJtahWk1KBSDxt41U1X6de9ifVA0uTOZpUDSqz?=
 =?us-ascii?Q?45alHqfso0v8p7u4oCda21w4qWI7yqePtLxwlZuXSG4iAY29w/aFNpbXLaap?=
 =?us-ascii?Q?0wBc/4eM/w=3D=3D?=
X-Exchange-RoutingPolicyChecked: UD9G6fRavzygRIFx+5zsCvXn9AxY9AraQ+uviVNyPT5G5c4KzGwKG4h0Eh3vomHZ/Ny2rEnGmhrk+zqcg2zsJWkFYtwnOVQ0atYkDfJtseBovTTwCWQP3NrM9Hi77intbodLrO6PGJGk44V06r0/Txt1POruklGX+LzDHr+OWgJJLkv0dGd4wKFt91CpZGsMnbOQXKLpQg2nhWFJ7TMcA+NAT4YYlHy7p69x1m4J4NfL6zE0Eh+WZbVsPWmRYr+JdFZNemGNeJCeUR3HPI72aKjJWY3lt74l1eFF5m6eJjHErrxwXt/7KlJ5/6Fsemua0PFdFZEknzJh7zDUjtzwMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ecc766-c934-4c1a-7bf3-08dee16c5cac
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 05:54:26.3136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8K1xUI3ePmxmzU9XnDi6leRstK5KWLZstVLZnIlLfWSFahnSmk76b8PNlHDg9H+OuySrzdgX3AQCQ8CLSTa4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR11MB9941
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/mips-vdso-install
head:   f4c09015498520c390ab0c7ff644b545c2f7da59
commit: f4c09015498520c390ab0c7ff644b545c2f7da59 [3/3] MIPS: VDSO: Add support for vDSO installation
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260714/202607140112.gjGMUNR8-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607140112.gjGMUNR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607140112.gjGMUNR8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'arch/mips/vdso/vdso.so.dbg'.
   make[2]: *** [Makefile:1551: arch/mips/vdso/vdso.so.dbg] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

