Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C073318BA8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775565130; cv=fail; b=MzWmqx/AGsHYnsKSEiGBGwhVZ2zvYGo5mQEkCOTODEWINA576YzvbdbMVmz4PnlchlbgYQ5lTKb8b7WUmEAexU7lbmJjDS8WEfCbsD7pN+KxUnXy+44sn0GNzTh1G9iDLZeWk25f4Q+4HZ9ZPSGWsfwTTJdVkptWC2L3LiFLvZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775565130; c=relaxed/simple;
	bh=+ZlhYiP2MEuIjBpps9BN7PjhCFeN0hYSX5VHgU98LUA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VY3CoqGPZMNeNIkQxnVi3R5nPdLT7b2RTrgC8mr0/l6g1qa04Xt8g302M8wa4gPGcptvOua+qgtKK2ZP5xZ5/ngM1/LG4ZWGfmM7aSSdDWzHcRrFloF1gw1S2Vd/InZRK4AVHf2f8WV6pCf7ABtvefOmvo6MZRFa9RjVDsh0ikI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+sb6jM3; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+sb6jM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775565127; x=1807101127;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+ZlhYiP2MEuIjBpps9BN7PjhCFeN0hYSX5VHgU98LUA=;
  b=D+sb6jM33xxfcvl/7csz6qHxokEBnNgIoSRGwxqCSm0J9f0s95AUW2uV
   XsinGA12EkNAZ9AUBpnUizqUy5BaPhtNI2vunyI2cdVzgn7wC42Cs/pVa
   0ZKThw5151nwO3uqtVUGfaETMnj0Di5GD9N7sgunf+53aleqtEQXGFDLw
   q/X/uYZIxf4EQpRMLqepxuNqXwdfpUsFmr5ABOu9QjyPwvcdzBNwqIDGP
   hziBDsm2oAfbYPtvbVnzUDI6dXQrcniIwQFj52rUe/3ERuTOGBC5O4/wO
   Zrnmtk3GnNUSdESWBmPlpNRX4g/ngN3skG1fX0UJ10fYh5gbI/pm2fzKJ
   g==;
X-CSE-ConnectionGUID: /zT6y9/0QlWJzMwBJeVWPA==
X-CSE-MsgGUID: gfx4ltu7SM2mdMvQH0l/WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76715825"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76715825"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:32:07 -0700
X-CSE-ConnectionGUID: 70fPSkYORA+/gQ0eeekLjg==
X-CSE-MsgGUID: qiCtvG8LSvyNRkWVv+6fVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="223857866"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:32:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 05:32:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 05:32:06 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.14) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 05:32:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2abUQuAxvLLmpXZmIEwhbdT5uH52k1T5ZlcufU7evMtHtoKlMxn0sjgXRNZpET+CUCRKZrtj9C/O0IuR9kyEq6AsuUue/6Sugg5t42ldbcj1SbpSoHsYj5x/lGPT7KGne9KrbAYeaWGD35PCB8YI74fLqFPo2eSQyQq+eAbXJF6rWyvR+mn52/Vyta3ydl4Ag3ERIAJbgslF9CYjqSAt3u7bkFJ92XwsoN6QHK5S9VXF8+atghyO6N2CTWpefqSDZdDfbLob0HOeyHzTBw8pRg/LsTFuikWW1kdESa0zfGd3e3WCUqWIIZk7o7HzW6pdqvloUv1BW5VHei+HC2iyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTLNQoZ6J9ybj+n0EVeNXHvKocFv4+Vjgn2A6eL/a4o=;
 b=YA1ErZuAS8I8pkiRGlEx+Eo5s5ow/ZtKle12B9Gt4V7s1ppsB5N49ojNkywhILogJQ2PhCnKC/QWoU4XTHbLNL4W9XFI/mgEIDnhgk+0E3dxkv9QM4/CFqXFqeOAJ++iC5/MwKbFfrr2rKyiWW7wAjx+XLRGSPjjMZm9v9ssRMYU/hpgL/25ePN3EWBVR5B4CZwlnpHjKZL/h+6FwU41f29mA8wENszntzp2pkugNWVyXRpAhYT921BvxKgl/R6fPXbRnFh2pnFA8zqZaFgZY7BQYdlNkjIMCVgjeCEdcKIVtNkjGOPUQc3JmTckVgW3Gwz/DTJhdA1B5+t9YglXgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by SJ0PR11MB5813.namprd11.prod.outlook.com (2603:10b6:a03:422::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Tue, 7 Apr
 2026 12:31:50 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 12:31:50 +0000
Date: Tue, 7 Apr 2026 20:31:41 +0800
From: Philip Li <philip.li@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
CC: kernel test robot <lkp@intel.com>, Christian Schrrefl
	<chrisi.schrefl@gmail.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>
Subject: Re: error: kernel-address sanitizer is not supported for this target
Message-ID: <adT5La8XYtP6zTH0@rli9-mobl>
References: <202604051027.NPt0H2Dy-lkp@intel.com>
 <adTAvyb_tRD6jDzX@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <adTAvyb_tRD6jDzX@google.com>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|SJ0PR11MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: 822ffa22-1820-4ef5-9d27-08de94a1a469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PjlcY/FxQbpu3D0TX9AAtv/FR0vPYjh/fw4YKYgBEBY+RI4ummtTjJPgP0z3Bk1iNYuCs3kLYvZKvKwaqttUcUAz1JAO5xBsdPrRzum11xFF6ClN740BR4zWemRteZfMAsvWXxF14O4TdGVt2gwRQKmqc2NKQcoegVgfiqXyj8Vn820KQPU0LB/pjystd8ILGQstpD/9lPSaT04U+ozmzh9Rfi3+1G9Jbz+c5IPAibWrKqcdtJABTLUFKfg7m0SJcibu4S9+7ZZlGbqZ5ExVCTV8U2mNmZ4Vbd5TJuG/d1Ju5DJVMri+ssH0/9tee47Ase8NgMuKgbOPT/v6L1Egtq7t7Ee7Okx4Q1ox/jF4y06wStHnrNBLKBQetwlgurqsw8zsaD6SYOlavHl1G+0oEIBNSanwvIFcOrpj+AunXBr8WC5yvtGHjG9Z47W934G19EGDNEGTiyUZkSajofYs3NsEU5R/ZmMN6mnrOa1GlOAkLQltDgZruQ2POGPa/gInnsz2faM08HFIhqaE4zEn3nktJ+YLMz1Gupk3IwoQfY9v9nQfzoDXglPsB95bBHCkXZLkVxJSM0KoKLg68kIzhriShZmyz38JIGeiNsdgMGGmpQPqW1RzZ29Mujp1t0B113baRZjKZpbqAX+3is+L77XyjtCru+LlV3v+eUZeneFid/gjgpXqJa/H+izMqqnf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X7MFOJird7NSN31ZhwP2N9sFZTmwujnDlIXnRnBjR75hMX1pTSCWve1SkhnV?=
 =?us-ascii?Q?Eexc1LbmBe53bLa6/H1DETacuBSTbX7floRVikZ8FvXDODBy2O2zP0JLZvEm?=
 =?us-ascii?Q?qP6vzVKHRois5CjIO3tAMDuGgZ6dqGiVSoWvbioFXp2R9+2XqTsxTKEuDiwP?=
 =?us-ascii?Q?omBxUVptFIeE2a12CFC94yomKBEmNfIUa6hrceB+VzhjtbXrwI6RBoWyTofF?=
 =?us-ascii?Q?XM7n5ub/3h0x/M/4echz6J1f4MEUZg/YJLJEsIVbSaqgn9lM2bphn9v7nlTI?=
 =?us-ascii?Q?GyakSkQQdMVVjsk6cmIEprL03lEM+tbcSp3Mn/kyGln3RkOCvMOlNnM9h3z6?=
 =?us-ascii?Q?+6bU5uuGRNdiVZmph9QSyopRBWS7A1lde1dV6JQJbDpa7AJx2XCcTV1FWwPz?=
 =?us-ascii?Q?AGUAUhp1j1ERf6uS/Kv4Ht4YLD/TMGy58j0OFaAl19DJxim/CcdID9Ma6o4J?=
 =?us-ascii?Q?j/3d33rrhm3YncnP+AQQXkNshlLG10woZIOypQmdzDupUI5KkQzat8IgytZQ?=
 =?us-ascii?Q?sqvjBkJQDm2Z4geJ7c+YdS7aDzLNxJIZRkECVQhGZG8u2OWRheg9TRq+UA7B?=
 =?us-ascii?Q?kpc5gvVcDM75twvnxVeNFtjPro3f/bSum+PnIMGcWmiSJtJcHnxYPX9dEGLM?=
 =?us-ascii?Q?KD/oYeAq1KNK0max2l1KCFEOwyl5FQ4AsY/cJs9KWVd8M0h/0zVmbwQVEDnL?=
 =?us-ascii?Q?7Ut0Wue6cILe1YXQiHRq6yP2rKViF6Ob9tgNXHotG/HeWOCeyIgnalvWWa0o?=
 =?us-ascii?Q?MhiH4N9mLw1epPoayy/jAV6+bIudQVVldN1r8keiT03L1PGSjPU+yi4TJ+yO?=
 =?us-ascii?Q?9PbTMENAiASOKyCy1AOOykSqWd3+2m3pseGt/jS51pZIWNIFfyCgRcuh3VY0?=
 =?us-ascii?Q?BVq3IsD2aiJkzZgMNmeg8e/z9zQ2uAGoZmdJu3mQZ81aNaf3HeKQ/2uRVhyD?=
 =?us-ascii?Q?UWPKgdaXj2gUGK/hpv0qrMqoD4heesa+OGfCuZCgNS6dSckYNVlCarnHidwn?=
 =?us-ascii?Q?YzGYL6tjLq15PStu8q5TJkSCc/qNeD7eYcSHANI54ZS/tq7COi+oPaF/xZ9W?=
 =?us-ascii?Q?/SWalT81kPLP5cYVM0esDdkUGKGO0eI0HbXaE0eV4qVUr21MzgGcaHYdhPkU?=
 =?us-ascii?Q?+4RONEUVlYGRxFhF8lvvrmnNItqMVXYxtANlywMf9gKLqon/iib8qknVZsMY?=
 =?us-ascii?Q?5dcT6Yd5Y+wo1uJhEJARJqTFOKNvitQglPmTt8DEsfs9mhtjM3qLeT/1vLSv?=
 =?us-ascii?Q?JzEVn0db/RC27VTLr4A4kozfoVUrcPEMOsDcV+W+xEzggkg8nW9kfRLOpNY/?=
 =?us-ascii?Q?tAq4ne/QP8TKy8GSMaawxXYmCVCGISu5t4uexhQkfFBpiSXw7uqOVpj5rqcM?=
 =?us-ascii?Q?e+Vd8ePFNjz6xIQvJTGL6i3wDJ03Ia1gHlrbMRsMBb9qfrHkrrsKbGuG4cSR?=
 =?us-ascii?Q?smwUFXy1PF8oP/qoAdgu0lB783RknE3XOJ/M4vGIz2wPhJv3zc4Xjhvvnfgm?=
 =?us-ascii?Q?+woXWz4UjiqON7TrkiSvQkZ/Tytw3zDReM2Jjcfqf+VwVA7oC5HOYpOdxL5b?=
 =?us-ascii?Q?9psg9v9GeI75I3SPxJn+VmYfnzsy2eaNFduVsmlFGNq8/CH3Ou4rqSh5VLAk?=
 =?us-ascii?Q?8JXNGhC5ZkcbKtqD/ZYEhkcBy9JC5txREXhq6BDhe8jmw5xKpBPJWc9/1PKL?=
 =?us-ascii?Q?kybaUVjlDw5/L1GFwBClauFHaJxsOuD8uiKJtUMO8VrTgDso+meIgd9iB4hk?=
 =?us-ascii?Q?h70s0apkMQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: QdVNXZGLnbN1iTNpg0OguZssbhXdoXuudoHYQaPE3bOW67Wa5Y4M+f0PH1PuCu2r6DIorf+qmVRdFYO1WZYDBGqdjGgpEQ1yEtMdxRtM8WXLFGzBj5lfvwJjSGvzNLvUCQ1jitMCLl8hRC/WA8iYUlAOFG7p2+9SGCF2E1UKb4l4rUCYD22W+weBj5FjWtcQ14O+6J5WlIQRsd7DZJjA8/Gh3mln2KF810wB+CTplI0aXNXI3RlxvLMUc/C44IHdCz+lrwyOUqnpSNQ0+bzqYE7CiZXzbraFGdCnBxtbiCm4js01VAbrUtAy9YRA77S4E8On/kdCsgyl0EoOAY7tnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 822ffa22-1820-4ef5-9d27-08de94a1a469
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 12:31:50.5315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gu1sZLKKjknlYOs9T+L/23qZf1ghbYNBsVcrwl7pLM51rMhr1GrNiBTHE0dokyR04XgE9ub0cnU0ROSPYeh9fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5813
X-OriginatorOrg: intel.com

On Tue, Apr 07, 2026 at 08:30:55AM +0000, Alice Ryhl wrote:
> On Tue, Apr 07, 2026 at 11:58:00AM +0800, kernel test robot wrote:
> > Hi Christian,
> > 
> > FYI, the error/warning still remains.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   3aae9383f42f687221c011d7ee87529398e826b3
> > commit: ccb8ce526807fcbd4578d6619100d8ec48769ea8 ARM: 9441/1: rust: Enable Rust support for ARMv7
> > date:   1 year ago
> > config: arm-randconfig-r061-20260405 (https://download.01.org/0day-ci/archive/20260405/202604051027.NPt0H2Dy-lkp@intel.com/config)
> > compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604051027.NPt0H2Dy-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202604051027.NPt0H2Dy-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    scripts/dtc/dtc-lexer.lex.c:630:12: warning: variable 'dts_version' set but not used [-Wunused-but-set-global]
> >    630 | static int dts_version = 1;
> >    |            ^
> >    1 warning generated.
> >    scripts/sorttable.c:399:12: warning: variable 'long_size' set but not used [-Wunused-but-set-global]
> >    399 | static int long_size;
> >    |            ^
> >    1 warning generated.
> >    In file included from <built-in>:3:
> >    In file included from include/linux/compiler_types.h:171:
> >    include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
> >    28 | #define __SANITIZE_ADDRESS__
> >    |         ^
> >    <built-in>:367:9: note: previous definition is here
> >    367 | #define __SANITIZE_ADDRESS__ 1
> >    |         ^
> > >> error: kernel-address sanitizer is not supported for this target
> 
> Like [1], this would probably be fixed by moving away from the linux
> target, as kernel-address is a bare-metal only sanitizer.

Thanks for the info, I will configure the bot to avoid reporting this commit again.

> 
> [1]: https://lore.kernel.org/all/acUGAsjYvNvTEO92@google.com/
> 
