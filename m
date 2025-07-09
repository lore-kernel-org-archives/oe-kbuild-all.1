Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FD92F4A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 01:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752023369; cv=fail; b=oIqnb/TSQoh4NbpBnBMFsCOPxM7+023MboaXShaS/Ynzc5mU51aCs1iKTZQQTVT3pPZMk9V3jzC5wJlZ7FWVdubXsnaVHlgC3V60/76UBV36/NA9HY7OCF8lNTagyFqD7La1YMBx5Jn9mooM1Vq0oA3Xu8sEWACpv0bBWlqctiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752023369; c=relaxed/simple;
	bh=0EaIJZtq3wsMMQJCHRpiphCeCxN9XyToFc0IKomxTsE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=O94VslSa15uGtoP3LzMYDzoxmPnQQmZYYPJqp/RTktyLmhXrAMQ+y2lw3ui7PRIx6vMUto+91wwo+imQ+2iSnKVNNSU3Ydi3L1VH1qTiYjQJNqwMLqMw3nRNA1mdxfYa3tkDM1LUKKoPGy4ISMAQwiMKcD4CD05HPaSIfNvVJa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZI6j2Zh; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZI6j2Zh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752023368; x=1783559368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0EaIJZtq3wsMMQJCHRpiphCeCxN9XyToFc0IKomxTsE=;
  b=jZI6j2ZhDiWcpBTcISjxfjOmROCx9Grks0LyyCISqw4ak1vk9KQbDevL
   xza9aN3CgGGNzEBFhHTx6+fIll4i90COdIXs15IRfzT7eVi6D/QPreicj
   mgoTVC7/QV0fH5mW4YA6YaBbjDCExBK+ioK7rskfYmIhKpwx0HguLUAlK
   MRkn+rUO5U63d5k5cU3zV6LzukwGWLihJwhPJk3s9bTB6FZHfrg8GBpfM
   QmVWfRpBsCxz4tIqR1nUgQbTU8TQqQoUJQpw3OkIAHlA3cClrDIPNaUXz
   O7LkmABrUAffjTZRYF2+6k0WeNJtK56BaFUi1oEW1u2H1OjvUZ5llvXrg
   A==;
X-CSE-ConnectionGUID: cHqg1D0WTgWB8+z/RbEg7A==
X-CSE-MsgGUID: WEKBzlCBTlSAeBgvIi3zRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54404507"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="gz'50?scan'50,208,50";a="54404507"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 18:09:27 -0700
X-CSE-ConnectionGUID: 1LrlEPyuTgOK69eQ7lFx+w==
X-CSE-MsgGUID: uJK7ORHiQEacU7hJfioQzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="gz'50?scan'50,208,50";a="186603553"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 18:09:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 18:09:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 18:09:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.72) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 18:09:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lfE2RY49CEslQsiy54Q0+5UNY78aiNgdHu9XM/18RHS/cJqW36Fr/lnt8snc/ca7MIhZ7s4qfFmXu+a8Wqqs7U7WEqAYbD4R5LOoIVOy6VXrkeFeD8fhCH95MIhlLLW3wtPdXbNFU5ASyM3j/5+4Khw6w+Ab8aI4fhzGs9ZmNVRElVLqw/FrcmytB52PKfgePY6HgxtfLdQhAcuT28IdrFTXNhIiX8zTlQhWdAEVwnXxnLtpTsHrgfwbV+Ikpgov1T+hpVR2l+DXVvJcWFH6S1WiP0UrVbSGkRfrePcEpiB5kQETZvDcDThdHS7nmI+Qb6yyUbHCWFr4LQMKMmfGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwZMFkDAYNMekAljWqfpOzk/V2tpbmPcZw/yc7bXPek=;
 b=keSLq01n3gD37QwNcncSIMXLWvZ3INdwzyqGhX91EkOrXOqJyXxnzjNbTYOPJI0cISgiWMa638Q8dUmFev6Jlf0BCg6tcf7Aholh30njNhF25zPjehaLev/tRNd8i6xlUcwPS/xQt9wffWjhgoQX1ai/BsnEuhksEqvf6diIXPdV2Xcoxy1VEzwc1VA9XYVwI8UDDXljmhgsZtFeJdFn1YwCgMfk6ifIWTH8wyeAAl5FrznDXqBDFyhW7n9pLNVgjOpKKWYNlSG8koM1nl5gx73UweCRQcRGjaQgRFQEduYvtU3TfgpVKCasd77dEanJyWg4iqOQCn2DbVEoBoJEfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Wed, 9 Jul
 2025 01:09:15 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 01:09:15 +0000
Date: Wed, 9 Jul 2025 09:09:08 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android14-6.1-2025-02 0/27]
 sound/soc/amd/yc/acp6x-mach.c:461:8: error: call to undeclared function
 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <aG3BNMid6iecBDog@rli9-mobl>
Content-Type: multipart/mixed; boundary="6M9dpdtouqGjluGg"
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 168f7d6e-aa29-41b3-ced2-08ddbe8538e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1NA+a0QtDzhy+9Z8Nvql4NiY3g7bX5Ux5f1JCqI/vKldfv3kf9+u4xT5EDmP?=
 =?us-ascii?Q?VJ59ZdX+L4/sQOLjcxBZd/yIZhaVGleOIBPPw+IPoMfemhNF95HmkBMigYBO?=
 =?us-ascii?Q?LP8ao0wAIfiEanUeCmGOmIwP0aQ4knKW//2EgxvVhWOuAIeunwwWBQUmHvxr?=
 =?us-ascii?Q?HuqbzApftYAdgxgnZZdXJNDEQtxcStPb37IHCF69pA7dgSOpwmQ3mhV44t38?=
 =?us-ascii?Q?sUy/dIjtefOafFtJucoL7yj5bOI/woMe7uzFj4JPjCn3c8dhtBvJhI/uOM2O?=
 =?us-ascii?Q?Edaxa2JLXfG5SAmcc6UPMjYRF7nb1Ubhe+zS4MmgkYWYyZwuH1uaLdJZSmzd?=
 =?us-ascii?Q?rvxjJZrJgrq/IQBTo5Iq3geKvm+xjaAHzFQMfNoTaXApxQNgJcKyEhPJw2Zi?=
 =?us-ascii?Q?hfKLLyJjsIxyMfHTeNPoHoy6/KfEUTpq5BTR12DKX8+j3PiEmFUuYXlQ+L0O?=
 =?us-ascii?Q?SJQuJNLbyFzJmky/PA6+ySHC8O4wYhhhnfkxM9npIDzKT+y0lTyawmojlcVJ?=
 =?us-ascii?Q?sr8flj0i8CYp/cOZ4gC3XlQogIHhZJVXUhJvm6ngIVd/HgiQONGkxu0ItWXj?=
 =?us-ascii?Q?DySMc6zyfXJ7yXE41dI7ALoHxNuTptVicolTMT5mNfRDtFlNF3C3WsAQVAcM?=
 =?us-ascii?Q?YEbiIm3rHPYtAOaTKYoctp+jK78yxeThqWE8vqFKJ0G6H5ZXiqAYnT/6Keyb?=
 =?us-ascii?Q?K9JZpKlBtpSGCbJhJTd+wFC7qmM8pzyfZvih11QQqpyp+Fmy6saR0xRtG5Zf?=
 =?us-ascii?Q?nNmWO7ynKfdyziECbXdyQ90gSNfbaUuL2zkjFqDLXpTe6ueitJ1Bl/fBzW3c?=
 =?us-ascii?Q?CPnDc8J9Bvl7XExeLCeLPUlcEYiYj1TtH51F6gPduWXStUgoajIb/WpJ/CCq?=
 =?us-ascii?Q?sfFqzNSSwFSn6jybjpk3olqXP4Tv8LWKifJkXU9blkWa5xkr7TstmOJOyNjZ?=
 =?us-ascii?Q?abvdTIeyh/HZf7p2+8RWTVi8TxorKi427kT8vp3W7vU+lxtEorNR/B8/PJ1V?=
 =?us-ascii?Q?D5Tqo6WDEmlE3H8UgN7bSHZp64wjhiLPurRzKFX82hOLBkkkQsQLDR2mt3/T?=
 =?us-ascii?Q?kRpyBx1/IMgRiwxpHX8JVwLL/xKh8TzB/3FzF05Io5MuTT76dGavdvd7GOZZ?=
 =?us-ascii?Q?LgdcPXCKY33Np6vKWmu5y7ONlQw/KtaFDbuD2J7YLqPgvF5Nfy5lxje5T4Rm?=
 =?us-ascii?Q?2GelJl0McMHi+v5q52TJITYqiqDOS66/HgTwOPMXkZahhpa3GwqWfjjMafJd?=
 =?us-ascii?Q?HBxbzKCiRnmlAOhE31yOp1nAB6dU3xS8uZichLKTR9YzSFxyyhYTiypEgpON?=
 =?us-ascii?Q?KvFOdsIxu/HAkZj9ZGjXhooS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NHXj6bDJlW+/+tW3Ma1egtR5f1TruCtyziRw30BwvOCNSv1jP+lpN/oQGKRH?=
 =?us-ascii?Q?WojQIHX9x5pfdH8sy1zKvmluCd/j/IJHVAF8XaRksyJkDQ9W4DsUY/5MVlew?=
 =?us-ascii?Q?KZB9wTzNAqofXv0G+TqH9HNmbBiGR+VKB5tYUuCjki9M+NBcG0/PG/e1am2v?=
 =?us-ascii?Q?t0YqWMbleaxDi3HSO0T8vhr6OFXGhxomAUBGIu9+PIb+ufHB+VESEBoOzXoC?=
 =?us-ascii?Q?cfKqRHtE4GiOMgfQGTsCiyKZ/gTujQhU1jEsQvywe+PtCn3ewoKNdh+bSwMK?=
 =?us-ascii?Q?ov33KdfzA8Vs7OhJzEhsz4+xm/Koh9N7cJs9DLvJ917DqP5z9AFRY7xXPopF?=
 =?us-ascii?Q?RMu4NwnE81oZiJ2E4PdJYmuhe+KTdsdNATgClOpxWlmzPcKZzbtlM1N79bJi?=
 =?us-ascii?Q?XamGrKkMLwsvVfD5YZ/kvUfXa7l7ybKcU1rjaDKrPv2nm3EeI0KaQX2+HAWX?=
 =?us-ascii?Q?xeMnwcrlxI4BM3i+4VySHS+fraTMC38zUGE8E0GoOJiwwSKWhWM04ktplR2J?=
 =?us-ascii?Q?RPbDsA+hKiuqhpiyVvT7UKCMZHdWFAHMnoDSl1nvp74WRE2QDLf5DJVJ+J9S?=
 =?us-ascii?Q?I2WIyI8SXYfjo1Av824/iR0F7McQgzpT8BGU+Pc/MOjIob0lzrUlMiaEqh/4?=
 =?us-ascii?Q?aiqfJSqlbw1AHVDIemjb+sMHplqXonUtAmDhwTC8jT9nlzWTfgTMnRWPYz+E?=
 =?us-ascii?Q?Pk02q+wFI0z+L32flMwejKUaYbftuav8XRf+I2A9MDudAHOxn+7HDGZR5YMg?=
 =?us-ascii?Q?j2Rx8voUgEfx29sjiNNfhtu16vNP59TaZ6oJdtH8JTtqtJGV3DeqLR0Jn2cX?=
 =?us-ascii?Q?YSyvLEd0z7+onuwUOCeAxTDycAsVO+Jo5oMsxRMPWPwHeOPThlI2+G/1Cl9Z?=
 =?us-ascii?Q?rdKErPLC/nU9PEC6d9AXHcTeUHEVWeyXmxEpfIJDBcccsOD1s2MSLnLtfiKE?=
 =?us-ascii?Q?GP9r+A/pEm7d43LkeduaNOak9sYLP7/yzkYmATIBoy+ZLMfKBFhsGBy9pIiq?=
 =?us-ascii?Q?3wgTnPPTV4Cj/5yFpLawT8Uq0QzzrHWbREmRR0v+6OsmVwJvFQYiT3YXTr4u?=
 =?us-ascii?Q?xcJkGFJP+ipISL/GTXZypyLVMp8jTX2ssHsFGjONhY33ocBDo3flRL+vyes0?=
 =?us-ascii?Q?0GqNEarIKSobTQuw1iXNnpYVeHsdZAgQ1UaouOoSC4vZen1OSOJ1hpcdQZUr?=
 =?us-ascii?Q?BTurJhtVbU/wpS9ItLjfzzUEgGZRXghfeaaJNKGtaDRM3jpj9/SXcoujIZQ3?=
 =?us-ascii?Q?MBe0dNFja6ld9y8sfyP07PbaAj2K9DEO8IQo6QLegCvr0GmqOXMq71mVsnv1?=
 =?us-ascii?Q?K3oDaLXhcjFCAyrybzxEdYc8BYplUrfUJMjMb3wG/i15bSQecmqnrAtHVm/t?=
 =?us-ascii?Q?vp53HUyCi3BuAKepJvcNc9vgG+yKWv/BR7Vt7B+y/R2bLsiH5vWrKdMgQ7Ih?=
 =?us-ascii?Q?zGutL81ZdYRSXdqzSsFpGWeTTRf+4mvhMqwcIeSjV0L0Ryb2Y8hvsclosJIS?=
 =?us-ascii?Q?mDKa2ZVUkIBhUCYW3KfdoucnYXtkSi4hopqn0LIDnmQ2qHxn/lCqhvrx3N0F?=
 =?us-ascii?Q?9e6gysPyBCvt5X30e1Ygja2LafG2TQJSAlWEwJf9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 168f7d6e-aa29-41b3-ced2-08ddbe8538e5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 01:09:15.4784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTGx+lv+Gz8c56KJreQw6pDA4vcSuDEXweDw9L2wEYgKRwFcDTPKylFw/fGBZHFpqbUkkDOZOvcN7mUCCwaVJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-OriginatorOrg: intel.com

--6M9dpdtouqGjluGg
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-02
head:   b6c2e7030908dffcf252b8cc5e8132576208a7e9
commit: 2f3cee7f3e2ecf3ef825c0be11ae04fbf9011b49 [0/27] ASoC: amd: yc: Fix for enabling DMIC on acp6x via _DSD entry
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: x86_64-buildonly-randconfig-002-20250709 (attached as .config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (attached as reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507090641.iU6S0j63-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/amd/yc/acp6x-mach.c:461:8: error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     461 |         ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
         |               ^
   sound/soc/amd/yc/acp6x-mach.c:461:8: note: did you mean 'acpi_evaluate_object'?
   include/acpi/acpixf.h:550:8: note: 'acpi_evaluate_object' declared here
     550 |                             acpi_evaluate_object(acpi_handle object,
         |                             ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
   1 error generated.


vim +/acpi_evaluate_integer +461 sound/soc/amd/yc/acp6x-mach.c

fa991481b8b22a Vijendar Mukunda       2021-10-18  435  
fa991481b8b22a Vijendar Mukunda       2021-10-18  436  static int acp6x_probe(struct platform_device *pdev)
fa991481b8b22a Vijendar Mukunda       2021-10-18  437  {
e521f087780d07 Mario Limonciello      2022-04-11  438  	const struct dmi_system_id *dmi_id;
fa991481b8b22a Vijendar Mukunda       2021-10-18  439  	struct acp6x_pdm *machine = NULL;
fa991481b8b22a Vijendar Mukunda       2021-10-18  440  	struct snd_soc_card *card;
5426f506b58424 Mario Limonciello      2022-04-11  441  	struct acpi_device *adev;
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  442  	acpi_handle handle;
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  443  	acpi_integer dmic_status;
fa991481b8b22a Vijendar Mukunda       2021-10-18  444  	int ret;
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  445  	bool is_dmic_enable, wov_en;
fa991481b8b22a Vijendar Mukunda       2021-10-18  446  
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  447  	/* IF WOV entry not found, enable dmic based on AcpDmicConnected entry*/
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  448  	is_dmic_enable = false;
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  449  	wov_en = true;
5426f506b58424 Mario Limonciello      2022-04-11  450  	/* check the parent device's firmware node has _DSD or not */
5426f506b58424 Mario Limonciello      2022-04-11  451  	adev = ACPI_COMPANION(pdev->dev.parent);
5426f506b58424 Mario Limonciello      2022-04-11  452  	if (adev) {
5426f506b58424 Mario Limonciello      2022-04-11  453  		const union acpi_object *obj;
5426f506b58424 Mario Limonciello      2022-04-11  454  
5426f506b58424 Mario Limonciello      2022-04-11  455  		if (!acpi_dev_get_property(adev, "AcpDmicConnected", ACPI_TYPE_INTEGER, &obj) &&
5426f506b58424 Mario Limonciello      2022-04-11  456  		    obj->integer.value == 1)
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  457  			is_dmic_enable = true;
5426f506b58424 Mario Limonciello      2022-04-11  458  	}
5426f506b58424 Mario Limonciello      2022-04-11  459  
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  460  	handle = ACPI_HANDLE(pdev->dev.parent);
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27 @461  	ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  462  	if (!ACPI_FAILURE(ret))
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  463  		wov_en = dmic_status;
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  464  
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  465  	if (is_dmic_enable && wov_en)
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  466  		platform_set_drvdata(pdev, &acp6x_card);
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  467  	else
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  468  		return 0;
2f3cee7f3e2ecf Venkata Prasad Potturu 2024-11-27  469  
e521f087780d07 Mario Limonciello      2022-04-11  470  	/* check for any DMI overrides */
fa991481b8b22a Vijendar Mukunda       2021-10-18  471  	dmi_id = dmi_first_match(yc_acp_quirk_table);
e521f087780d07 Mario Limonciello      2022-04-11  472  	if (dmi_id)
e521f087780d07 Mario Limonciello      2022-04-11  473  		platform_set_drvdata(pdev, dmi_id->driver_data);
e521f087780d07 Mario Limonciello      2022-04-11  474  
e521f087780d07 Mario Limonciello      2022-04-11  475  	card = platform_get_drvdata(pdev);
e521f087780d07 Mario Limonciello      2022-04-11  476  	if (!card)
fa991481b8b22a Vijendar Mukunda       2021-10-18  477  		return -ENODEV;
5426f506b58424 Mario Limonciello      2022-04-11  478  	dev_info(&pdev->dev, "Enabling ACP DMIC support via %s", dmi_id ? "DMI" : "ACPI");
fa991481b8b22a Vijendar Mukunda       2021-10-18  479  	acp6x_card.dev = &pdev->dev;
fa991481b8b22a Vijendar Mukunda       2021-10-18  480  
fa991481b8b22a Vijendar Mukunda       2021-10-18  481  	snd_soc_card_set_drvdata(card, machine);
fa991481b8b22a Vijendar Mukunda       2021-10-18  482  	ret = devm_snd_soc_register_card(&pdev->dev, card);
fa991481b8b22a Vijendar Mukunda       2021-10-18  483  	if (ret) {
fa991481b8b22a Vijendar Mukunda       2021-10-18  484  		return dev_err_probe(&pdev->dev, ret,
fa991481b8b22a Vijendar Mukunda       2021-10-18  485  				"snd_soc_register_card(%s) failed\n",
fa991481b8b22a Vijendar Mukunda       2021-10-18  486  				card->name);
fa991481b8b22a Vijendar Mukunda       2021-10-18  487  	}
fa991481b8b22a Vijendar Mukunda       2021-10-18  488  	return 0;
fa991481b8b22a Vijendar Mukunda       2021-10-18  489  }
fa991481b8b22a Vijendar Mukunda       2021-10-18  490  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--6M9dpdtouqGjluGg
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--6M9dpdtouqGjluGg
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce (this is a W=1 build):
        git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1-2025-02
        git checkout 2f3cee7f3e2ecf3ef825c0be11ae04fbf9011b49
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-20 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-20 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/soc/amd/yc/

--6M9dpdtouqGjluGg--
