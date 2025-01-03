Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324105914C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 00:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735864719; cv=fail; b=HQlbWE282UPzHwQO4sm9GS1mRQs92EyNTrjc6p55Re40ZAaNAsLt5ob1iw/JUjWtaQmZYzCp9ZVsLPGz4qyLgSTkC/TY4EPZQci06x/oppm4pQuvJhbBxvRnVvpZDsKbN9bA2QyEkgm8WJgmLiPTnDVyVSDN6lffED2VmZoxyeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735864719; c=relaxed/simple;
	bh=UZMEXaVf6NrkA1mW1FO5zCbvAleJZ/41QfGv7sDri8Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VPyF4SYdblbQtWuCZbcbygx2fsBogs9K5WBLrlcPaz1M5JtfcEJFX9zLehjaSyViXCGOGWnwJb5ijxmI69UXCTspyx2s6LabJwbJaRariFJizMA0/lno9tgaCS5H7tYJoqDrfx7+5hSOfKdt4duWB7gPMMPbr2BvwsROp5PF5jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfAAf6ai; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfAAf6ai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735864718; x=1767400718;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UZMEXaVf6NrkA1mW1FO5zCbvAleJZ/41QfGv7sDri8Y=;
  b=FfAAf6aidiKMC3IoeBM/8o5NTO7UTaG32C4pXwYB0pEU08W71ehA3EoX
   POghJj9FR/kqjo9Z2ucAwmsNjMbGmi+ma/OHvX1i9C8BqD9wjwDehn3zA
   v/pjgg3qrdzdya0+phtKL97M8wT7Exi1qScHX1DOgDEdM37lLC6jGKa89
   1cDiGyFeDo6sqtvb1ILIQNJMb9r508maR1gVdw7Obl9Ssnh6lEgeISCv/
   7lnTsf8VuKzgVTgKAiMY/VUEnybQ4WYOYllGPHT7MocyEOIs8niSlO39Y
   A7ddAA8JTgwGgntnh5O/1xMj+RBvreHmdcUOLxaSTokDRxKP/L/+xDDyh
   A==;
X-CSE-ConnectionGUID: D19GjPtqQZqq5gh10iNv0Q==
X-CSE-MsgGUID: CS3GyfYdTFuaEqxFjtnjTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="46694374"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="46694374"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 16:38:36 -0800
X-CSE-ConnectionGUID: ATxEBEISQ/mmtFHxDcXhRw==
X-CSE-MsgGUID: 3JkP53NeSpeiQmcj7VRcIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="132505429"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jan 2025 16:38:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 16:38:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 16:38:35 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 16:38:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1PnCXYMkROqbUv2I3nHYRF4fjfBosL1VIMqVNnhJvngEwUaT5tgotuHiCeqfaoL0jhX7NRd+XzO4SHe+8o7u9bhhA1C4+E9YD2gizl01o8JIg98H10NCbFHAC2QOyEzDa89ElU/oUNa5PGMDjB7zfg1P19uW2sH9D5zQCoY2RavO4/kyCz4Bx++0uOWGrnpSyaHtDsynoIVKXlcwuHWlOBgxgFOm4xto9hAGvPqXBWmrSSCzlIKZOmY9YbBa9h0JCGAmaSt9SkSPWYumFuO34JKFW5ucoDgVUwvioQfYnc9Smp8zFkCo/jA4bBO/DFri0TQ9QwR7dUs/Am/gTLcXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usuvvWNVlxFx2qq3JIwKtVCI1wiK9IDs51PyChXu9wQ=;
 b=QgQZIZ5nbMqdFkLwGc0oDNMhY4c0/6/l/2njq5524bfyCCqWM+JDgjtU4FCGy+pZHdrMzlK7e5oqSJIXsEff0c01arPGegzzy84t2ECdl3JXddlZS8yfe1D6X5sEaxBRZfoIhCb21tGkFVROZbgg53UsjEvC3JROe7k/kNzIMsAF6lvoRyLQfISVYywt38nJvfOzD//1m2MI8d21qcfGAGrXcjZ5TfHRrZ1pAAhY53x/c0Y6Rl/xdSTs1Q+AudLCaFsSKpSSV0ug92PHTt5jJwx/jaS5HC6jXmvZt9P68ixhFENcvocxdJOVOMNu7TQjCZY+XOU+Yxv9Rybj9yWcEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CH0PR11MB5316.namprd11.prod.outlook.com (2603:10b6:610:bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Fri, 3 Jan
 2025 00:38:27 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 00:38:27 +0000
Date: Fri, 3 Jan 2025 08:38:19 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Jani Nikula <jani.nikula@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
	"Javier Martinez Canillas" <javierm@redhat.com>
Subject: Re: drivers/gpu/drm/nouveau/nouveau_backlight.c:56:69: error: '%d'
 directive output may be truncated writing between 1 and 10 bytes into a
 region of size 3
Message-ID: <Z3cxeyXFC1PHFCw3@rli9-mobl>
References: <202501022122.Pct9ERae-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202501022122.Pct9ERae-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CH0PR11MB5316:EE_
X-MS-Office365-Filtering-Correlation-Id: 77be8340-3c3b-4f48-e9e9-08dd2b8ef063
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|15866825006;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?US9Bbhs6xDcn10rg8z3d3FP5oMkFNrSzI7O2ijq8gG54TUu2UpCHZDbUthG0?=
 =?us-ascii?Q?Lc7lH9HNt9x2ouPND+7/j9NZBIZK0ALqJhBXA6kv65YwKxNsyben2E/1nve8?=
 =?us-ascii?Q?AroFGjRRTHWCEcOqej/5G2USIKaT7lxQdLEQyQOuX4b+c6hmcBMcj/bJDHfr?=
 =?us-ascii?Q?J8AFps6q8KO1QnkJPsDt36wBPpF8M6Oi3xICEv9FWWwGWitMjqQqCjWd7qrU?=
 =?us-ascii?Q?AgJWTN1zkpjK9UWFJgAis2Yk+L3q41ORGvbwJurE9m2ZLG0NR8MK46Y1oY5S?=
 =?us-ascii?Q?0vpDpeRnLuf1E6TCIDcOOhCuN3A/O6mNi3QFFuaBTyhrZ1sDi7Oz4QwdfRL/?=
 =?us-ascii?Q?lIKql65KtbPRhjpre8KwFKCaX7CIkNYLQP70SFOXo/MoYtqGeQxCZJD5cXU8?=
 =?us-ascii?Q?zuWGyINrEOA5DjZOvCqfGF+KwGHNiRETZYHye+541Vid4DjRrGvl+DaYiptM?=
 =?us-ascii?Q?GdUvPBL9AiVwmK0INL6scdrfgSvRkO/Aojm7drgCwX5Te+rLtTjWxUFI9FC9?=
 =?us-ascii?Q?FWlDA4knVBeY4shWanB+dMEueYq07VZDM+ZmWQihRRGJIy2XqEaylltDSWhh?=
 =?us-ascii?Q?P02F6fpm0m0qqfZWxb90FbTXopn1mQk8Ns7qW/neEBzdz6C7XTqYdsGl8Gci?=
 =?us-ascii?Q?1o9s++QrT6CsJ1VwkugRnuxcQiNZccVmY9hhjsNvpgREm3mS1uOaVOYzwN2c?=
 =?us-ascii?Q?4Bxe2L7+6nqZWJ8+TqS/3iQa1xLs4CoVSq88jf1/BEhf4VsHJBbARgpIFuVa?=
 =?us-ascii?Q?ZKG/s54G8/HV9oS9/3PXgBkQXT6vkU5IR/rEjhuTkdy1T1KHTcLIsjSFRCNr?=
 =?us-ascii?Q?6gJJ9JyeuFZDXVINVJ3P8QMpqTneNogCeIPDWosJ66+sgFelzFxNtg3DfaLU?=
 =?us-ascii?Q?o4VTpeiEH5jRW8pBhFh8oAwAnhQ+avHdRULMKGlCAst0xtetef9IthegM/yt?=
 =?us-ascii?Q?8qc16uWv4g74PXdWG5NqAPMrtLLQZcJB7hr1o7IpJ2HR/CJepW6M+Ov4hATw?=
 =?us-ascii?Q?grH0fupqrfJfpduf3iZszK/BdFBXlDlW/SCuOQGaOOoRNcqZ2TBxrZFDIkGX?=
 =?us-ascii?Q?zQ/h4NQgJlgB2DZZc09ico/1oCiVjudUlPIpsnXzppHB6+Zvtd5znsfhTQqR?=
 =?us-ascii?Q?B0VZzEFcFRBiC3sNhZp6rhkAmlFiWPScrtMyVMbEzMv6TT8SuNVvzVWzIZBq?=
 =?us-ascii?Q?OqH7rUJDtx8Jnu6pLhHWKDju81Epq6okcMnZFv/LQATbMyj8pjbSHAZ2D7gc?=
 =?us-ascii?Q?PcqKfut8XK009aLYDhcxrHaFlb/6HG0kUp9ww02eWmyHGa2Blzx41HqjN57q?=
 =?us-ascii?Q?3dmI2Z3SPa370wc6U6UpfXhUly338Im3yarOAxjhprkI0aoDve/GbxplrruJ?=
 =?us-ascii?Q?lHek1iQQsVofZ4jlyef8rUS2gd3BAHUr+j8NHy3/MHk35mjmwA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(15866825006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gDyeHqZXhzSIbRKWqeOzembuDo3p6Pzm0EO4jNvRbtwEtz+pu67UIHoZ4fLZ?=
 =?us-ascii?Q?W9CYBFA5qlo84QpTxi1ZAdL/xlfPrXyvRSgNxEI3g/GmzOyilHsziue4pn/R?=
 =?us-ascii?Q?rAI2EbejG24EE7KEYp3IH95kZaotZXl3y53vDIrXBJ3/K4DcaXeA3dVkuXND?=
 =?us-ascii?Q?vIvwLcQtDbX2AkCwU5IoZ7rAnN8Ct717NFGV9BNyj46LjPYjMZM+dNlQWAKW?=
 =?us-ascii?Q?m+mr278RArX2OeF9Ylug/YewkBtRZPDAKx2mFhBro5Bo7zR3u/DjMJEK2hI0?=
 =?us-ascii?Q?HwZFz0xNLKtJ+hzaUQQAAvgtWgHI47/HqdV6toj6VBixyEPS/oiCqWrZgVAZ?=
 =?us-ascii?Q?PnhPxzoWEeFOU+fMiWQQXvwp4V2c1C7L0nVNosLvLUdfNAsQ+cGCUqfrqhRY?=
 =?us-ascii?Q?o4bIpl/T4vWx//6z2Zi+g+KqdMxprEmomswEFT0isguA9bRRdqU9rq3ocGew?=
 =?us-ascii?Q?QHoK+3vJ/3VZtVFxjdtAvcROptg1GmaPbuLcNMQZNLcQKqXA5EO2M6FMKqoX?=
 =?us-ascii?Q?A4mCJyDXsYnBnGaGk7eqvvCY1G6eyasGEiMeaHJ1LUFv4G0hKwgLeNnI2GfV?=
 =?us-ascii?Q?ebB0nScb6K1B8c/XuBQYbMPCUfbSwWM6NAUp/S/rpr2MPqaupWEHdVN9pCvZ?=
 =?us-ascii?Q?nT/60Smd88ls65QRE15M8uRUHx5f3FFyTt26xpXDF8Cb3YY0z4xBJvoZEGKJ?=
 =?us-ascii?Q?Q6NExrHVn3IMAARVJg3xLWB3QKWdNy3T1riAlJlP7FggjH2o0W7y/vXU3V73?=
 =?us-ascii?Q?FswhEZHO2cBnV/2o2CVFPAiO4h/SBW7C0gK2QJ1PYMRToevV/JGR4n6KShIr?=
 =?us-ascii?Q?/2Ig8MwAJapQgVzgG1vqvgM20OWf2yd9Cvb401VwgIMTlcMET003yE1juXrR?=
 =?us-ascii?Q?aZR/d7dzmRD889fl4qOqn/zMYfGAFgtbwgc/ZUPFeUb/cTaM841w+w/+EEdc?=
 =?us-ascii?Q?7BrnDMAvtYjsbgLrojPV867nJvTdIoFC0UOh0Yu/LykrWuahPI4+2ltQewam?=
 =?us-ascii?Q?UTmC8JwSWl1aVTXQn4av6Vt4eucrDsLBGgQ/dn8g2TIy6IsEDUO3RPUm2K5W?=
 =?us-ascii?Q?sG6jsC58fSMhWbspJhjlNApXv/NHPBsIdkQybI6yKrNJmRoxYvTEbpVO2mZT?=
 =?us-ascii?Q?u6MQUSZ9ngsp4G/AuaNFeTGlWAsOyXYFvCokBS2VxsR4bVMLMbfpt7D3U25O?=
 =?us-ascii?Q?NGeBlPn4cyzykcxW/1HTt5Xc/0hD/oz31efHeyugtonw8FrwlBhS553YInTR?=
 =?us-ascii?Q?YNd7RwmehRIaJeOhDYWqffT8E+dG4btnYAj/NVy3PvYYkMmYTh06U7Xvp8qt?=
 =?us-ascii?Q?h9ysjLN9c7pa0wR/U1D4gWhBMZ1rY3OCNKLJm4dhPgPzk/95NqFBR3/NJyBF?=
 =?us-ascii?Q?WQajqzTU7gI2PQcT5vkV7yYb/xIvW7FOjHKhQ578DL1OZIBfiIFc3aK37srn?=
 =?us-ascii?Q?TN3GOfma/7rcpJ39SYquCABZI24MCSXlvirAvO2HAjckmMt2QVm5tm1YIE/p?=
 =?us-ascii?Q?0sinz44kYzRQvJQdSVjnmqAQEho7Ii+3Hfq1C1d6fNfM9bvZxrUQ73G3tvto?=
 =?us-ascii?Q?v7lLpUvQwhnnK9mzAdEHHeIVfS0tUBOmVXcoR61e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77be8340-3c3b-4f48-e9e9-08dd2b8ef063
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 00:38:27.7902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPx/uP1WtW5Cl8LSIb0ulzt/1WbgCDpE6+6kA6/XtgoThm5SqGMd+wEaPSO+PNMGTy1bgPl/Xt/T9RfllGX69A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5316
X-OriginatorOrg: intel.com

On Thu, Jan 02, 2025 at 09:14:13PM +0800, kernel test robot wrote:
> Hi Jani,
> 
> FYI, the error/warning still remains.

Sorry, kindly ignore this report that the commit is not the initial cause of the issue.

> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   56e6a3499e14716b9a28a307bb6d18c10e95301e
> commit: f89632a9e5fa6c4787c14458cd42a9ef42025434 drm: Add CONFIG_DRM_WERROR
> date:   10 months ago
> config: loongarch-randconfig-002-20250102 (https://download.01.org/0day-ci/archive/20250102/202501022122.Pct9ERae-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501022122.Pct9ERae-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501022122.Pct9ERae-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/gpu/drm/nouveau/nouveau_backlight.c: In function 'nouveau_backlight_init':
> >> drivers/gpu/drm/nouveau/nouveau_backlight.c:56:69: error: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 3 [-Werror=format-truncation=]
>       56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
>          |                                                                     ^~
>    In function 'nouveau_get_backlight_name',
>        inlined from 'nouveau_backlight_init' at drivers/gpu/drm/nouveau/nouveau_backlight.c:351:7:
>    drivers/gpu/drm/nouveau/nouveau_backlight.c:56:56: note: directive argument in the range [1, 2147483647]
>       56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
>          |                                                        ^~~~~~~~~~~~~~~~
>    drivers/gpu/drm/nouveau/nouveau_backlight.c:56:17: note: 'snprintf' output between 14 and 23 bytes into a destination of size 15
>       56 |                 snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
> 
> 
> vim +56 drivers/gpu/drm/nouveau/nouveau_backlight.c
> 
> db1a0ae21461af Pierre Moreau      2016-12-08  46  
> db1a0ae21461af Pierre Moreau      2016-12-08  47  static bool
> 6d757753cef8d5 Lyude Paul         2018-09-06  48  nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
> 6d757753cef8d5 Lyude Paul         2018-09-06  49  			   struct nouveau_backlight *bl)
> db1a0ae21461af Pierre Moreau      2016-12-08  50  {
> ab244be47a8f11 Christophe JAILLET 2022-02-09  51  	const int nb = ida_alloc_max(&bl_ida, 99, GFP_KERNEL);
> ab244be47a8f11 Christophe JAILLET 2022-02-09  52  
> ab244be47a8f11 Christophe JAILLET 2022-02-09  53  	if (nb < 0)
> db1a0ae21461af Pierre Moreau      2016-12-08  54  		return false;
> db1a0ae21461af Pierre Moreau      2016-12-08  55  	if (nb > 0)
> db1a0ae21461af Pierre Moreau      2016-12-08 @56  		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
> db1a0ae21461af Pierre Moreau      2016-12-08  57  	else
> db1a0ae21461af Pierre Moreau      2016-12-08  58  		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight");
> 6d757753cef8d5 Lyude Paul         2018-09-06  59  	bl->id = nb;
> db1a0ae21461af Pierre Moreau      2016-12-08  60  	return true;
> db1a0ae21461af Pierre Moreau      2016-12-08  61  }
> db1a0ae21461af Pierre Moreau      2016-12-08  62  
> 
> :::::: The code at line 56 was first introduced by commit
> :::::: db1a0ae21461afa4bc435651a6dd55e0e6ef4a8b drm/nouveau/bl: Assign different names to interfaces
> 
> :::::: TO: Pierre Moreau <pierre.morrow@free.fr>
> :::::: CC: Ben Skeggs <bskeggs@redhat.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
