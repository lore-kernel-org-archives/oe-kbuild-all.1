Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B560E1940B0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 00:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779928133; cv=fail; b=UuAGI3y5FA8tEdo0muT+BTHBaKgrF6t9oqTNTtqBJ3Gt96tRFASUL/kh81t7ifA/7V4EjEU6j7+06CLceVlt661QyL/nyDTc+bNbZZ2dta55RudTPDW+VnuW9y3f0n5enoTaBdONhpZD17520I8fBpM3BKH3vBs7IFiehTwiKXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779928133; c=relaxed/simple;
	bh=XcRZCdSiLBi2mbyGulpWSrCuaJ2agxkr+8hDGSlEidk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hkT7y50bJc0Jy2LcY/30NN6MUffZX4hUiARHgh00J2CMCvaOrYE1cANrYZcJPEC1nz/2FVa0G6scfLeCmc4lV9Q4MoTK2hH39bv1YCPSOqd+SvhF3rvs+wNxP+ls0xUqfYi6Yxzy/74v/Zmu2zEW5cWNkerYA1P1RS3xCwe640U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TI2sN+jI; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TI2sN+jI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779928131; x=1811464131;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=XcRZCdSiLBi2mbyGulpWSrCuaJ2agxkr+8hDGSlEidk=;
  b=TI2sN+jIqYZkkF51fnEHrlAkHFAgOuZ5iEVssWjvzm5vAQsQg6u3kto8
   BbqPVaUDmd2Entyd0ICogOhsCiBrr0JTLPZXgeMg5QaKrlSSwAPqcgBSX
   UZ0AAOgGcv6asP4QHvPGs6pEtAH3AquHqdt31hLwpJitHP3d5e27T85Kq
   U2eJzCnyTxlITXXxoslM5TyISuQNiXWnwpiysreGatezJVOGiJRjLNqO6
   rKuYvHqQvpsyNqWkep2Yn1pl/q4irwFxgYvMSfySiNLd8upawwMN0N0eT
   0ffUbgVPEe7m58INLJRspM4yhWB73xSLKUlkohINJE3apUZxxaYMit5X6
   Q==;
X-CSE-ConnectionGUID: sBZ8oQ0nSdqUx9k097I3XQ==
X-CSE-MsgGUID: 0BBV8zxRQQy++juUpIyOWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="68302555"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="68302555"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 17:28:51 -0700
X-CSE-ConnectionGUID: HuuFZX25S0eaM64Ae8QLdw==
X-CSE-MsgGUID: QPslID9cSyydS9WHatnwMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="272731055"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 17:28:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 17:28:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 17:28:50 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 17:28:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnzO6ALPm2a1Z5n3CoKxobyhj08jdQzUMq4ciqSQZ6lAasDmXfg5KNW4rPeIvmWYWUZVxSJdA98G+L/BwAjC7edloHrqt4NcrErgKOnjZ/4vBNYZq61aWBCkWdc4Uj6DO9rKNbj6tECwMuumnySTBc6D9/IPAuSfljPjpUVSx91wscsMB5H0YZhyDtvQlOcZjvoPIVk0kL8ulfoMuzZr7k8R8EecXQYSvbu6OPJn1LbzBsMPSHpiVZugSB4A4Cx0aG/x0UYrIQD6o2J4F4OYija+NF1b81HFMn/osXr6xMZCbamOpgV+o9+kTVjMV9vMzpmAcldfvSmh9y4cF57KHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fjhGgTJRHMh3cgKL9RbQbafE0MgaO7iaT67eAOwUDo=;
 b=nfYEWqk4eotOmTiNX8UsOire6Yfgyy+QfMrcuPNjgytTp4XI8rwvtHhYgquQnW1gUWsA8cD27RQf1kyceWrfpQ8cHhPnj9dM93mM/SsZY0DjFnapt1EHTGe3Hxv0D3bq/soko/qaJJwJdxT699kf5lMJKF6+XCsJrttR6lPFM2AWwK4b6O9KB2wLUWt1mS9t3FGqfxOm96BjUrNe+uzte4meGKxdYNdxzo5vLVXxxnS799Tnj56b2Zooz65yiul523k+JQ+5ztk4WQ0ENfo3IMMVD+SAPht3nFfG++kFtLruhjiCD/1F7z6on6KBJpYA7KLb01zMkh1hoYoXoq6+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3493.namprd11.prod.outlook.com (2603:10b6:a03:81::16)
 by DS0PR11MB7336.namprd11.prod.outlook.com (2603:10b6:8:11f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 00:28:47 +0000
Received: from BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259]) by BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 00:28:47 +0000
Date: Thu, 28 May 2026 08:28:38 +0800
From: Philip Li <philip.li@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: tc358746.c:(.text.tc358746_probe+0x4aa): undefined reference to
 `devm_clk_hw_register'
Message-ID: <aheMNgW1WSnDEtCI@rli9-mobl>
References: <202605280422.S2WDpmPf-lkp@intel.com>
 <CAFr9PXm=-3knCUg+x0j97SKbtdqtCScZki7TcuSg2nJx5vY5AA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFr9PXm=-3knCUg+x0j97SKbtdqtCScZki7TcuSg2nJx5vY5AA@mail.gmail.com>
X-ClientProxiedBy: KU2P306CA0001.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:14::14) To BYAPR11MB3493.namprd11.prod.outlook.com
 (2603:10b6:a03:81::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3493:EE_|DS0PR11MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d91198-9c0a-4341-d0ff-08debc5014f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: X+l7bFqRGj9lRpWcHS8//ia804tX8AeIhy0AvzmKsgMEfLjYzRzRoq7Z4Pbtu/n3++5UdUN2VdqGvCsXmfAV2HewYbaFU9wxw3heEqI9ubGMjt26XnKhZyfldCpTlr1q3zIQNgqHzfga0br3mh+X0WJUyGW3LTEOxTO7URz3QzI2mQHNVWwVfYgs3t6+T+Utj9f6eZzsbcWE37QAzjFH3Cg2yHgTOmOmbHrley3C3hnIxvS2/La8+tm7rlYs0AfxNHVesm8X9T99kLlUdB7Qhgok33XMrxvhD0j56NkqJ4SgJSeE0n9vFDteF4PW7t0gBo7Z24ooVtszH0hIvht0WJfB+DdJ7utlzVMcQ2OLHqQBDgFzcWdTXh4nc0bmESLUsdvP+nJNRgAaMA+eWoLZIYkKnsIVKvZfoi1NvmqGlG3uC+qY/mTiKKUerR6Ge6WSPlJNbGBleAzGjie69NEh30B1PULujQglosCPO5oDqKhDgfxDh5fLo7iJBRYHwPw6TJoy8bMlbbt44oq35gooGHMW8MtBpljY+YdI6FBQxnLlGZsgC1tVryx/ohxGL6bCEwL3PLBFcqVz1xHmZ2k4+b8fZZdljHYszpHAuE6Swbx7+Aq7IBMlv7IZyPaM7fSJCBjjMzrSkXzL/GNXPA/LzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3493.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hUP5XKmTsTMxr10X+2aC/TlnVQhE7mA91G8M4zXdOg17gmDjLzOz21h5B45S?=
 =?us-ascii?Q?0P4VfMeEAEqUUlJ4ILauDpvZyorJgK6TmhwiaDsmEraaxtPk+L/Y0vlsRPq0?=
 =?us-ascii?Q?1GmYYC258DqkXuTfmM247kigJOPNbSyyCXhaUHFqcFmIY2t+hlXEe3egei+I?=
 =?us-ascii?Q?W4adsQqkDh0yWctVBKMQTqIvVY8ad20jMagDPJhc3DVtHD0UwEWe7FPJVHBV?=
 =?us-ascii?Q?niiNhEKz3TMF9wg7Hzg5se5HouN1EVI/l07s0ienENtG0dlmab17+cdSXO6L?=
 =?us-ascii?Q?+aYb1UAtsKUVyQhyKCm5OFY+qR1wFSpDjsxUd8llqolkRAOO+cSyv/qkvdHq?=
 =?us-ascii?Q?FUs8EbuVuD2iLiG8lw/PyamQzl6VF5UtkVcflWmTu2WlsrnclRslyEH4WNjd?=
 =?us-ascii?Q?mGLj2Us8k2kDBru7er1FAOSS1A+9FSL2AzNGrZJldQgLDQYBQm4u49doIdPJ?=
 =?us-ascii?Q?y9iSKOSlwqIdeOyI/TGjZlVWCoFaiAEc+QXEZ5ztNLqYs478L92/OZ1aui3H?=
 =?us-ascii?Q?KdvQkUkuVIhPjEjRO8UXmJJg2L7xjHwPKCPiTCPJBHKmcIxIc064DrByiUKH?=
 =?us-ascii?Q?PMsVqkL8x3z0c0IIVoj/lyXXuiFmNQQBXrAh/QWCCDTHvSgcGWXmWchpzZ1X?=
 =?us-ascii?Q?XbNcBg0P9ZGXss4D/ZfCsCJwgQDltigQPiWmXFlsYxlFrM21BThaeO0vPMtQ?=
 =?us-ascii?Q?UxYp9kt6X9PP89KW0y2fgI3XyDtYWWs9mjp61SYyx7aoKifQ6adayqMttLCY?=
 =?us-ascii?Q?9Hcog61WMI/7Xtl9vdcBHgnKOcxxu+BFIw2mCpIGCMzyRNlqtZIUck0+Ycbq?=
 =?us-ascii?Q?eyozy+KW5fWUJ5gMYXlsDmvPQJ7FRE58tDrNW0s53UJjAo+P8hr4XgcuQ3Yd?=
 =?us-ascii?Q?VU0jjAslqwQvnORh7G/ckH7caRjtvJBeN0P3jngeV1rJ6+qrZqFrwlqa8Wb/?=
 =?us-ascii?Q?UoJ5fRN8F+vT6JZdbFgFq5uWkCb9p7bQG2xm4pZNXg+5EyQUB3vIOF228aX+?=
 =?us-ascii?Q?cwed3ioGEKcG4Jf4XqElnOrtdJ0+jzT/0ZNOF1NQRP3cDP17F6wx1/9+XLra?=
 =?us-ascii?Q?OF0JzWIgnOyM/nForn6/W1cmNRJVjnd2Kqm2yH35pWXRxUPQQxdoQV8DVIb3?=
 =?us-ascii?Q?2hVm9ktwbQMK52xoxU7s7AUzbTZXSUvsQjt3D+cdSGAdwLpT6/ZtflmjXuND?=
 =?us-ascii?Q?2iv+7NK11A4L3qsXJBTgB+ju+lROPODRAhA0bq5vYRLI5Ws31Kr1FuHl5WcU?=
 =?us-ascii?Q?4YELNHwsvkPB9lAaLkj8sF7C3MfFJokhx6iL4PnA2g7rJHWorRHsdXj102PR?=
 =?us-ascii?Q?6qPQqR9FQyuNpFMT6tnCsmc2kwW5IFgIYyPG6LQ6AQc7J4v4bnrjErerJG1s?=
 =?us-ascii?Q?Vb0G04gJ1+U6Z9MbHMbrkWz30cLPflMeqF3FbjyTeXc2NVXdm9yu2qd1ZYAp?=
 =?us-ascii?Q?ZWBFODNMts76gKUjxsQimYFOYgSBUahawkJ2MUS0TUt/ermLDvguEidx+12g?=
 =?us-ascii?Q?WWIlJhSaSUFWUUsh/HczHYnVPS3m8D5DGleY7Az9K3Ey0+E4GOnlt5G0sU57?=
 =?us-ascii?Q?lu7sqyyXDNzqxeA/Ma/0lPl2cujtLOd5UBdbp6H+72vm2DcurUg5bUYb2FO4?=
 =?us-ascii?Q?qPOKrPNVb30ZqqX1ykhPTI219tF5d8fz8RZ+cl8o/yS5Rz6uey/Sbh1YIP87?=
 =?us-ascii?Q?zR1Ynhq5yAYFpDgLfkr9lXnPr4rjv3PlW6yzt223syWUAELJ1A+Nt1XRRWP8?=
 =?us-ascii?Q?rLptPxpCiw=3D=3D?=
X-Exchange-RoutingPolicyChecked: rdwd0kNYQZq1XTrb3Bt9lFmdNMFIUJYhdRtThEh7dVITbm3ht3FVLljjO0j4pYKV+4T6e0qvgwDEtTEw0Rp1gfV5//qfh6qH9Pff2OZexXvwuPrZVslXDZuF94cNn58x3QTju4JbGkLhRLT9zUUMaYUyPsSjqsQsDV0VytW66ZKyF3VJoQedbYsQCMcxOIIACMqurzmAqiUO58R+QsYf76EZMbp5JO+tkEZd/MNBXtz46FLfpa5VHUg0c/hKfUFUDYvK2FiIHj8FK5y/ndH58oOjpZktMPobCcgH9WDAwBHAiCptgulObt2eMsHi8ZWW6Pw9l2Ne8RpHptPGE/LLPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d91198-9c0a-4341-d0ff-08debc5014f7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3493.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 00:28:47.3960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3XMiNT+wLM93bGjq1OH8MO6PHATftSeOXQPr6pH6j92th8z2yCiJoh4RrtuiTSIrD1e8S8+17N4cNmbC9ynR1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7336
X-OriginatorOrg: intel.com

On Thu, May 28, 2026 at 08:30:27AM +0900, Daniel Palmer wrote:
> I think I've seen this 3 times now. It wasn't me and I sent a patch to
> fix it but no one replied. I've done all I can do :)

Hi Daniel, sorry about this, I will update the bot to avoid sending this
report again.

> 
> On Thu, 28 May 2026 at 05:16, kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Daniel,
> >
> > FYI, the error/warning still remains.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   eb3f4b7426cfd2b79d65b7d37155480b32259a11
> > commit: 4fbdd56edf1f0b3e338c90a011bbae1a677ac884 m68k: Enable dead code elimination
> > date:   11 months ago
> > config: m68k-randconfig-r061-20260527 (https://download.01.org/0day-ci/archive/20260528/202605280422.S2WDpmPf-lkp@intel.com/config)
> > compiler: m68k-linux-gcc (GCC) 11.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605280422.S2WDpmPf-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: 4fbdd56edf1f ("m68k: Enable dead code elimination")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605280422.S2WDpmPf-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    m68k-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
> > >> tc358746.c:(.text.tc358746_probe+0x4aa): undefined reference to `devm_clk_hw_register'
> > >> m68k-linux-ld: tc358746.c:(.text.tc358746_probe+0x4fe): undefined reference to `of_clk_hw_simple_get'
> > >> m68k-linux-ld: tc358746.c:(.text.tc358746_probe+0x506): undefined reference to `devm_of_clk_add_hw_provider'
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
