Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0883C17
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 00:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768177490; cv=fail; b=tFeKPa96arbaRpGiB9CVNOtKFvjnBF70WG2CIG9BShoi3tW3Y1WSbSrTzneQ8OiN8nRoWkk9iFcgEuykyHqBYFq7QywvLAIQDrZR35cYCAYfborWCkmtyofSgsyttc1UAOnCFPq/snGwWJZeFaRqrPKgPcZz63wrhQUrJwmDMyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768177490; c=relaxed/simple;
	bh=bsaH+dCbuFMvfgP8s/XUFW17+h1NHMbb6YWMn1WLTj0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=X2DsN7VKiMGBf3Bz+v113DjNTbvUT+oP5IMZuUyoqtE46rrFxCZS9mw/duxfqMdLmxVtuD0ANME0s+jsIT0I8VDtCmfhdmAMZw1BnIpTh43kyPGbFfHMO2N8nfbxdePnoaCDm0wY0q/BM5nvJbVKoQ/YhiDN1+qaH5qM6CgwirU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SuZDaMHC; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SuZDaMHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768177485; x=1799713485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bsaH+dCbuFMvfgP8s/XUFW17+h1NHMbb6YWMn1WLTj0=;
  b=SuZDaMHCButN/WAg+QOHwjC0jk8ejBIsyPBMHc0OzifQft3TVoiMwLf6
   r3gdZpvP1qbqYDCuyeumm1fc2gBv/jMWrua3GT0f6K5eC5rQqnEadmIYg
   l7+8jbepgkhiD/raLnfJkgbjzxCp4iPceBnhFYDAZQBi6NyqF34mB28zM
   Gw0yC/Fi78Hpru3h4f25Ks8bW6/YNRzL4RDTM9ZIDYe8sddIrW3bpSrBB
   a5nYLdO5UfWQ07rKqkS3jVtvOhvmqbOEy3HSFQNL+lMdrPNOKknRinyep
   h8yF9+6FD4phbpPufaHVjRb+cbWhf/rjJ8di57uV9YsNagCzsKxwbBj1j
   g==;
X-CSE-ConnectionGUID: 30J9qBk1QLaFKPh3ZwFvQw==
X-CSE-MsgGUID: ZB9aCvqmSX6gVHHuC0AMsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69354037"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69354037"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 16:24:45 -0800
X-CSE-ConnectionGUID: pa5ToARdS7uSA602TSlYMw==
X-CSE-MsgGUID: 3hlMddYUQ2WjaLnm9Uxilg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="235180708"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 16:24:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 16:24:45 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 11 Jan 2026 16:24:45 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 11 Jan 2026 16:24:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDxT7abU3OfBwORsmgktDNWwYCeXXtksiv0xoLUvsLwcl7XSZYjFoCsxIU1YKsd8JAJi4nkQ7ATTiu8rom6u6fnUmBPFuTKbTS3SBWmGd48XKSMcfH0gruKOXMDHWqLdnPZUIVxwn8/xvc5OkFyOid3w7Wnkr4K5c4hbqJ5W4/i7SkKWwj3YM617ZIbJfUNejCq0INpxKYoOeCgwmS8Yk4AADPGirOxIspgxkvq7vi8e5EjqEZ7vM9WTk+wmLZ8eq42Lv/DRChGk54lf+reeHy0ZqeJ/h/QD7YN0wljqUNLoRgJTNHRP42muxOywvZr5Vu7qZWK2WtsS9YiLa17CUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vz+UFLYPFW5cA/95cizRdX4P5fhK3bhT9/Y2WVDGJ+w=;
 b=NyUzf+S5S12hjvqAvxYdWMQGRbaPG9IrFwGWRi3vqes6Cnwd9+Wxfafbk4f1glrtB9PDFiuRlcY15sRGbxwMxtndWwcn59RKkp9/RHdI1ui7dt791C2iB0ERC8Smxapx2lQcWom97IYbcHjWTU1cs7IFEgzG4mxQMeeGTYuCKFroQH2gJUMKK3CGj3YuTfqnAgrWvKfhM+XGJboQvxuDAuf4X0M+lAE2v6BdSZdweOxhtzHdmIYh08gchbfVZMhfoSY5D3VmyoksJ+JH8raDFlpWv+A/9joMSzWn8alm1GPhG3Jv0CXEho9XpKd4iSclLUY+ExoKq7miA2YQ447tnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 00:24:37 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 00:24:37 +0000
Date: Mon, 12 Jan 2026 08:24:28 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [thomas-weissschuh:b4/kbuild-cc-option 2/2] cc1: warning:
 unrecognized command line option '-Wno-address-of-packed-member'
Message-ID: <aWQ/PNCzNd8AjKkb@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|IA0PR11MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d0f25b8-acdb-4487-d020-08de5170f7be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/tSCIWZJPJvEgbSwE3RsDFnzjYrwidATHTcXDo/6dwSrUGMozGMKdbIn5/DT?=
 =?us-ascii?Q?Agg7cLkxkO92/c/+ddhjCGlN79gAuKJdHAOTZtE5nrjCes579rSw0RV7TbTG?=
 =?us-ascii?Q?arynzrFAHJJV710voPXQaU2xrCf2ooMOO5fFYWM7dBsluxjqPaLe5H1KyaBc?=
 =?us-ascii?Q?r/VIb/hcHKLLVubmOGV6BmsG1Ymm84RkBWJYYE7f58lRbkfLlP/nUF2Fnhvj?=
 =?us-ascii?Q?IblOBtyOrv7DtR8u02W+4mHQ2IifzRmE/5C8fjlDak71SZrYI4eKWbY4joIc?=
 =?us-ascii?Q?3i56XwS9CAQEncfsyBaKz7+TJ5NZNd4u+ohwfqoxE9vyxaZZt7wi/cKo/Rcj?=
 =?us-ascii?Q?BoR1fnQHxLuSiKotm1WytDsshR/6gWM7MO4z37JIYUf3FCe4NxLi/PTaqJ+s?=
 =?us-ascii?Q?btV2309yDdfTniUaDwX34Vmxa14PqA3XatAPJ1MCqVj9YTuyoxU0l6gAm8Mr?=
 =?us-ascii?Q?mOThonjXKUXHVybWqmCOjcO5BE5E54/CNSVJp79b1eoPP6a/jXElnYNb2bX+?=
 =?us-ascii?Q?VsnRX28OW64vHS3hfy/NtItfjl1MktN2/WhnoMzp6X3N/RVYNapgfkbwZXdt?=
 =?us-ascii?Q?TGKNTzZ9pZn+O+gGqrvEoPDRykTx3Odeqyuz4e34xrpCMvjlP+gljBdZMZS+?=
 =?us-ascii?Q?3fKQm+m2p5Yh2mAGgSVYWHocqSNsoQjeBHK6uB9vzoHfnmUn8u13z8M8CdfM?=
 =?us-ascii?Q?kgBkj7KT0HJfW0J3LZCUyvty0OUhL3fpZyC/orCdI3mkTeyL/Pk6xEEZTmqh?=
 =?us-ascii?Q?WaQjCvlO06zTD3BKx4GjLg2E1d0fsGZxVamCdU4mre3Ol2f13ezBviApT7L1?=
 =?us-ascii?Q?MsqNkgDoTQVUF/QxgcCFW5+8Yaeup+0Ffxcxnf4INngnP75x8QgX6zyp4dOu?=
 =?us-ascii?Q?ap7rQbn5vr6utD0HH5xOfHLFdYOCA+TBMxdW/uKA99uljOeAWCzOrLjYFKQm?=
 =?us-ascii?Q?G7EQ+VK3NwqXP+sPr9hUFW0slLg8JhGT714EFvZxNJFAyGquAPGU6wFXGq5y?=
 =?us-ascii?Q?4MTAtK6QjePgB0hjGL2tVGS77IPzYUHYgMCUXb9vNq4nmvzsGth1EOwOMhVc?=
 =?us-ascii?Q?WRrm/2dwrn9b30tY9qCRbrFbJx3vEKN7vdx8U2zJLM0rM7A6rA4WYSIhPCcU?=
 =?us-ascii?Q?ibTjRL9j/K0kD/wei5SnSyO71/YKI2QBKtN957+iyso8pB+SUtIvhXT14Sa0?=
 =?us-ascii?Q?//bfPDtURvChfRHFWQbcBdbFexONPkOqLhwDsIe0Y4PxJHZ5/IIQG/spQE+E?=
 =?us-ascii?Q?3aVnG+4Ran+RjpdDa+XJEHSJMoBiTkAbuO1aeV+XZNP29arvIltFMhAd91ty?=
 =?us-ascii?Q?GGeQqQOSFtY+wbqJxQRnVsu0JTSu5arTB94UK0sw3rXdOTuw9dSj6tSiGo2w?=
 =?us-ascii?Q?DjhIEvfgUuZlxHhOi7ZewtKdGoytXypknrRI/tNjoYgviifxX+TE6hB1YuGj?=
 =?us-ascii?Q?UZRnbgrDW0hOR9+Tu/qf5rfFLPIdqf42nIdvxZb3coA7FQy02e/eKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7FGRWWWNw/JP60gSG0i2XYWhdAkU4dd9FnjQ1r0nnWQrDd93q8Qeqg8tLYkh?=
 =?us-ascii?Q?mvt+ZkevBW2+J9J2kdk3+CMTcnOQq0f3rbYN0dRmB64BtVFohj/xL3PwF/G+?=
 =?us-ascii?Q?RplpaN/lamHoGPL0Ga7+sFoSwSklIgNqaWH4DGSDJrj9ennI7Xf4n7gaKzJI?=
 =?us-ascii?Q?EnxBRa6020mChLRpyaAVY2WHuEVEuhIQYDfIhZT2YgK8eOeMYA9x/Ix8u6Zb?=
 =?us-ascii?Q?spCWMUZnhyQclrmazrufAmaSIlZCcdGLbqNHnqWDwDYRi69XTIDjibm3/Yxy?=
 =?us-ascii?Q?QlJAxD4VHbg88686Xy1L4VQqI8k7thLaLVuVwiRybtJ5irGXWqxGMHlwfq0D?=
 =?us-ascii?Q?0kKjujAZODPjVsk8JbE4LweC3w4l9yfJapfA3z/LxQp9iaYsgrNp81HmjcWM?=
 =?us-ascii?Q?8KSbs+y0rItvVUgnCEfU9pa+KnFa/qda3xgb+hsfygjp68YBaF+Q0D/0EB6s?=
 =?us-ascii?Q?rFV22/ivZ+8dsHJU8MfhGUUSKp8x5qyqxuPMA/wjFfTL6BUb4r+KjLUaQET1?=
 =?us-ascii?Q?i//dYd3JcRjkbYeflpCYTUvdEhhlzi1Fta9fahsx5CWg+rLdi2Tdg7dcALD7?=
 =?us-ascii?Q?2CMPTWiXkX9JHf6VetDrHrqkGKYV/S4fU361XEaRwpY6M3RpE7aKK9pkA3Co?=
 =?us-ascii?Q?jWXNS/HD4p//88efDLRwwmDEoTOsjHRgs/xIcUqHOD8zf7DCUYhqRp1w8IZy?=
 =?us-ascii?Q?dmhpUTpVQBNsD77iosn084ZMOBUfxX28sWnNcLyoG1vEDW9BnsEXTD9vUSx4?=
 =?us-ascii?Q?s4UexBXKnyI3VWRV/+3wIwSqULK3Ri9WLi7jQFx06gAE/d1d4Xs+uUrCLItx?=
 =?us-ascii?Q?/JrDGlxNfbSwDS6sFVAdldpr4/MnA0nx95pmqdNI6kh/v570wYhmWjc55FDb?=
 =?us-ascii?Q?9LI8UZdbT/ZzR7LOYfVPgjWj0+5baNeF21K1Pc2jxrmf5WuouZ1Zp52IJhNC?=
 =?us-ascii?Q?GndjnkzZA2ItOmaOZ0rkiBnqfDgSiuC/6ChJlSqxsQPBN9jCtXnSlyAEF+nc?=
 =?us-ascii?Q?4xXOaMhqQ3m0tzgqHKbBzUkGYFJaoezfVyWEzyXphePU3Uk12GambUrIM3ur?=
 =?us-ascii?Q?u5jPrlXGMGr9s/RV6NDifu8ZbxOqOgZ6gyz1MwUPVlYdvcnlwhe765ChXHmX?=
 =?us-ascii?Q?Oebh0ZYM0zxzcsi2u4VtMp3q/nT2kl8H5/RRoS0CI5/eEqUMveNRi6iOlf2R?=
 =?us-ascii?Q?jPvMcwnHgar73iOlbW6hyq3+1aBpN1ZBZMhozVykELuhjvlGZSlscR5zHuky?=
 =?us-ascii?Q?KS50rBzlAbtCrY6PzUVmCjsmK46EunWSHXWKRFDSlJP68k0DYSCa+Gawbj4G?=
 =?us-ascii?Q?ryUm1YBhhBcfCVIUDNWQdvOT7UQiWVNlTxKM+EsEPczA+hhI0hHQzXH1JvVb?=
 =?us-ascii?Q?siOFE9K/xXV+5SXxBM5Z2GKzMSMJfEFjX4KnfG0du7OjRfYnKBgPJWxldy4B?=
 =?us-ascii?Q?h3xNbBQsnhiWNVc0BlUhEz82+zGZe81C3m4HUmivkYOAbioUS7exvz9A08/S?=
 =?us-ascii?Q?UnGWjTtz15FNx14CZe1Cp8oJ5DXg+1GasfUR0hpyQYYUJ/r2CBOflz9K/zoV?=
 =?us-ascii?Q?StR893GBq0awcRtHh2TVUi+VrOXp7/Vw03FtxIjBpbfhG09ViFy/PVTTdff1?=
 =?us-ascii?Q?xVbhw2tuYfnGQ4szCWs+jMc1meDWpLTgJfyV/dajaWUkApVXYScJUWUCu3SS?=
 =?us-ascii?Q?mj9xwEerDCxH+CrxuqGcQ+anGWDUgg92ZQ8gX1KX3lBoT5/VAMoeeQi5n7V7?=
 =?us-ascii?Q?O5YVRlo92A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0f25b8-acdb-4487-d020-08de5170f7be
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 00:24:37.2614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccd8JlVH37Af/o6L0/IBEO0T5zR8CS/8GS6RLRgPYmEAOB48ILCFDvVkRNA1mceYn80HbDU+QheWiTXBoHCGvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7378
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-cc-option
head:   062fdec41bacd52271d07cba6296b439340ac22a
commit: 062fdec41bacd52271d07cba6296b439340ac22a [2/2] kbuild: Drop superfluous compiler option checks
config: arc-randconfig-001-20260111 (https://download.01.org/0day-ci/archive/20260112/202601120059.HG0D4Bqh-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120059.HG0D4Bqh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601120059.HG0D4Bqh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/stream.c: In function 'bpf_stream_vprintk_impl':
   kernel/bpf/stream.c:241:2: warning: function 'bpf_stream_vprintk_impl' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     ret = bstr_printf(data.buf, MAX_BPRINTF_BUF, fmt__str, data.bin_args);
     ^~~
   kernel/bpf/stream.c: At top level:
>> cc1: warning: unrecognized command line option '-Wno-address-of-packed-member'
--
   kernel/bpf/helpers.c: In function '____bpf_snprintf':
   kernel/bpf/helpers.c:1069:2: warning: function '____bpf_snprintf' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     err = bstr_printf(str, str_size, fmt, data.bin_args);
     ^~~
   kernel/bpf/helpers.c: At top level:
>> cc1: warning: unrecognized command line option '-Wno-address-of-packed-member'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

