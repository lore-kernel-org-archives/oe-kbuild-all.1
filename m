Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438C97082F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Jan 2025 06:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737007906; cv=fail; b=FuByK1JJ59CAFr0P54GJdmoFMd84JP16tFqU85O0k2SlQH1AOAhZalaibpyej6VtNeYvrYJD3T8fSX7DwUzGe3PLcDjCTCxvN7AkXnObHNdxSwGT99VlVl1p12ytm1UVbdlPSBtq1cobs7NPWU32vi7EVM+QwVbJxcY9kEXiDks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737007906; c=relaxed/simple;
	bh=B6O6gN/ZYBHGIqlcSrTeK7LBi/mGqyk2fuDVQ6kWghc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PpEA/a0dOhlJUmgSp9JU1C/dY0i7aijiip6u9cSNrGNy4jnDGiaKFpbSvN7JbCD0WQ8lKta9rMZ3UFetl7N9K5r3754KwLJxMZxe3xBERGSOCfmSe4qfmuxhntTWyfnLHkgw2rpEY9MBzMCKRNtgz47Je2UVD/UzaJu3idLZYcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dt4cxKDI; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dt4cxKDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737007904; x=1768543904;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=B6O6gN/ZYBHGIqlcSrTeK7LBi/mGqyk2fuDVQ6kWghc=;
  b=dt4cxKDIwHJGh0vAIyjVPSppf3iPWGKnQVNSHTealXTXrlUD3weuisnZ
   mOro6V2wz+4pl+CGqZrAtvQE0GfinzLMdhY2QzWh5PcA1fDpd+Msds36r
   Vmh4Z0KQoktg++o/m32MI2augtzYpa/y3dcJhCF338dJG1BkczI92c0Ck
   y4acNGI26BH0vDzSd2CYhWKNfOS3LKSwN+8FQyi4plX0N9bOtbJRIk6Gj
   xX2GN+S7sWNbT4JrQQoSTEvns0Nu+5WNTIaUuRM/28Yg/nWvqFXUFt9kI
   EwGHov8QgvYTQiv20k4fMaL9tVpm3BpiV9PPIXp74AdrVBI3uWXfELl4Q
   Q==;
X-CSE-ConnectionGUID: IeWkx4bASDG7xXkzR5BsCA==
X-CSE-MsgGUID: fg1KLRWrTv6NEw7NySo3Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37406539"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208";a="37406539"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 22:11:43 -0800
X-CSE-ConnectionGUID: XkIPbOwPT8GvQVW9rHrfmg==
X-CSE-MsgGUID: jvR4ZuVkTYuH6doLS0B4cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; 
   d="scan'208";a="105539121"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Jan 2025 22:11:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 22:11:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 22:11:42 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 22:11:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8Wk94jWD1dhk5c+UgHObp8+PUrSJBXLNmtBMhLFe3HP+RDvi9WW+aMyCrNJ8zunVJ8X3wwQoxe5s2Eo9lTKGiQ9EyoUH25i9qI7A+yHLkA+1mvAelheGKP286fbNuxParfs50oASOKtT4t9ffEPgvZzfi86Y5LyEqB2rnxFIT0ajOKFu/pV8BgReG82afc9y9MgzhgNrmCkG6P/iRTZgTYvGPIlWB1AVsX1ScRG28y/Rc6hl7gvLzBnn/JmAy9shoh0qEmjTgcnQ4e/weV2UXyqcu/1P9fqg7dCh69cbyc2UpES19AiBNYCy7LNamh5MWGfyDxlNXpgtkyIUvOodA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oWfH2YxVedbmceaVUyRezBqao19xoxgGxi5KeOWr9xg=;
 b=cQ0LvlKoV9fhJSLJ8Ez6CFhV+4FYy7itO2ckEEBspmSQ6tgj0x/XWb/cCCJTjL59xTMzzzcb0SQIwDwBKlo9qKej9F5H/hSoRNjSZ4MejHCLiZiEzBjceKrRzEKfd9exvPwefHM7yzv9OEJFCbUIPkMGoZyEPBc2sh/SPqQ6lqRN1Sb5RGsnC5Rm/elhBjxL72A6EVmMveQ2OP0klTMgHmE+6Y2suX3m2cdwPrhhZzRUBQWPfDieolsJ9Hp7A2huhQD3U3PeDYTE7jXF1Cz675OwSoyHJjpetT5NzKcpT8D1Of3JlqGNQDntYM+mHK7EUog2OB5WbDrZpjR5CcbIoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DS7PR11MB8825.namprd11.prod.outlook.com (2603:10b6:8:255::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 06:11:40 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 06:11:40 +0000
Date: Thu, 16 Jan 2025 14:11:31 +0800
From: Philip Li <philip.li@intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: drivers/net/can/usb/etas_es58x/es58x_devlink.c:201:55: warning:
 '%02u' directive output may be truncated writing between 2 and 3 bytes into
 a region of size between 1 and 3
Message-ID: <Z4ijE/T0cTfyBhM9@rli9-mobl>
References: <202501160236.YSb9NcEp-lkp@intel.com>
 <b4df75c5-505a-4d3a-b809-ef17608405ef@wanadoo.fr>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4df75c5-505a-4d3a-b809-ef17608405ef@wanadoo.fr>
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DS7PR11MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 65efbb3d-af93-4958-64e6-08dd35f4a41d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9peqs1vJx+obDpMEvml+G+rBfLI3SynVgfc3odpaMzIDxKixX6ctBgZfRP?=
 =?iso-8859-1?Q?Pp71al4Uq2bfWedkIj9CU3xMVkNHoPquvmv0bNQGAAp0UwXoDbNsWE/ug5?=
 =?iso-8859-1?Q?lTQ0NiYSEg3FzqTk2QUU9tgLHL4bPWUYWdXXmj89iijXAVux3NBpGKB7zU?=
 =?iso-8859-1?Q?SJe+9KvBBVE/lgLtb/2pbdbiT9JpSub6JAJYjY0px6ly/0+BjIMq1BfTda?=
 =?iso-8859-1?Q?vyW1i7Dn7NzHxAjHsotLD35v3c+KIISSL8qVCCzYVeUtF+r5ESqi4id872?=
 =?iso-8859-1?Q?5vvP9CUdJNmAVaZ0ulcRxre1bIYZT0lrIiWmPU8JS+Gzh6glB0daFX2n4w?=
 =?iso-8859-1?Q?EVUjFrA8ooxM4klp0NPem3WveL2Px3CZ37Qmksvwtl3FLCM8NseKYFOZfw?=
 =?iso-8859-1?Q?l2OZ9TBBxv8uZWyNlEKaPkwNU6w74ST5ob5Dw+/UHpcNSMfQRaMnMQHQ91?=
 =?iso-8859-1?Q?UyDprBwk/nJ9yCNmUs9FERJySQ7tGG05ZWjcdQKuyBXwpcvhP2lMcRMjBh?=
 =?iso-8859-1?Q?XxsxLz7yPu1yNj96IVaUI2UymiNVV2FXgY96Rh/ZOMY3Am0HF2sVlgcxfE?=
 =?iso-8859-1?Q?UvHUS3Sfiwk5OPCCg10BIy+I8w9yW49CkLEu/o8B48WMecJfTtwoZNDKnz?=
 =?iso-8859-1?Q?LIWvvvGik8uqToa3zVa4QF4oFCvzqMO/uGoaiuMHoUTwM7z90+5eTE7+g3?=
 =?iso-8859-1?Q?OMauUXVJQ37arPtDRUmtLtXkYDU1JSlOUP/QcljdqkkOXHVoffZCdIvmSw?=
 =?iso-8859-1?Q?AySEwWbgd3oz34SyFJMGh/CXmKvNq2iI4mZxZYN5iF2nIYpKB1wzPALhhr?=
 =?iso-8859-1?Q?6hvQRY/I0af9IoI5wRkuO2brGiIAAkSsnU4/1hw5hLgCcqNq9xZ9/uSdZQ?=
 =?iso-8859-1?Q?CTS8g7ee/QEfpYdcD8aV8HDDW4tD5Ejgi+UiVMxK/7m6QefJRAblxhpWAl?=
 =?iso-8859-1?Q?PllOeMxUGdMwCc2nuEGVPmDgmy0png3jEDFDlDxEPY244TnLLE4WOpM/js?=
 =?iso-8859-1?Q?+276vrQrmjR5Sjw2LvSUCcjh15n+JEGDKDJtvT1aVg63yOJf6yZjKEtsmL?=
 =?iso-8859-1?Q?S6wHA3zwZMwwHVsq0ZU/a3giE5jztnp4ntvCtt8zjkP3q9BTwMtrN21v1c?=
 =?iso-8859-1?Q?9PnwnQEx3migc/vJuBTpKu5MQ1E4Vu5Y+d9uphAdyAn17aiUuFmNnvPs1k?=
 =?iso-8859-1?Q?k18Z+/DeJYX4lJZqIWT/tJc7vxwX4eTAYZpL9W8z/xTkGqjj242KRIVqlL?=
 =?iso-8859-1?Q?74drLi3n58b8Xb96o2ljCAcay30tTkmZFq8q/VecAc3ZHa7nM1xks0Xsqk?=
 =?iso-8859-1?Q?hR1t1/k/3Vzz7zZUI/T+T8UzY6lvWAptU9OG4IrADhXe3d0D/qF29EwaLY?=
 =?iso-8859-1?Q?okdfvVooy8XJ33YI6wtae6gQOAC7C6xQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XUr8T/sNVI5c4cTifHd/Q3KKefuv1sZCbdfMSMQg6sVBEe/qe8fBx2Hg4+?=
 =?iso-8859-1?Q?/FqJrwGObzD6X/bwZcXBfIQLVYHe5pIBhZWfPfI1iqya12ClwgI5K/XNak?=
 =?iso-8859-1?Q?HvtIGLLXM7Mo52AIvLV48B8f/YkxBlO3PhUFLTEN/JjnP+NvMiIZsKukjd?=
 =?iso-8859-1?Q?Nl49CmBibsGw5FWg+lBcSX4Hlk/FtyNsSUV+zbTIUMWL7alNLh4YB2kUzC?=
 =?iso-8859-1?Q?6n4mK36WwhqxX+j+7i+Df9QRHEeGB6lTWIshHYT+tCWB3slpgLwHGdwSf4?=
 =?iso-8859-1?Q?9l2IQfGXg6S2AS3QYIEyL9WcS9Qfv5F406gSFRGR5BICBtxd2ZkghMrtuE?=
 =?iso-8859-1?Q?XOq6OC4IiZVhNE50eb1S4Mjnt/t4gi1pXs0WQPcrwgOU+ZnZLHr0f0z92b?=
 =?iso-8859-1?Q?fZyAnwsc8vUDcwWa+P1j4LDcZjEuNV4/VStrXdzQBxQr0RsOgVKKCfGx8m?=
 =?iso-8859-1?Q?9kx1ieHpGMiGwSGdPri93AV2zNYYwUoWJ4jhD9yFPi8Mg9C6b4TBRuFt0n?=
 =?iso-8859-1?Q?qkI8Cp2xsxMzNSAQBGvu6E83+949VFffGooDpkCGouLtJUdQNd0exuet/I?=
 =?iso-8859-1?Q?YPsS4MKctdafxEOruhiE5d6/aiaF5wvaSoU0d3kp6o6GHkhdYzFwb/Jent?=
 =?iso-8859-1?Q?fmjvXSTG81oU16ztZ0C6U2G3jrPYJM9FNN5LBQHNo5bLvQ9DaVKcktnHIp?=
 =?iso-8859-1?Q?cbvHEjhdKkEELr0vhpNnpFeYDP5yaJykI1HNyTf5GJQzhdJvKX80NNSef9?=
 =?iso-8859-1?Q?t0DaWDY2MnyhTJLF917v7dhF7d7/Eea7KiwzV8N9XD+29HKdlRQhol5Qyi?=
 =?iso-8859-1?Q?2DKlRNN+uhpokY8VU2bI8xEXVvYQ7hb8XYBBKcjfKsp2Tk2OLFSPtN1wf2?=
 =?iso-8859-1?Q?Az4joeC8E2JxoQQsUWIUwN3a/aEZypGwjWh1UWBiycnNNfsXgDHdAoOE84?=
 =?iso-8859-1?Q?oYkYCIAdkKNJD6JI6UN2pAtMDSayyZ+ouUbW2vCdDPRIrQgbPF3GH0hnR/?=
 =?iso-8859-1?Q?vMojMHCRZedzN0afOGlIxSLgwyoCYptK6h4EbazhNbiLI5px0EObXte8TY?=
 =?iso-8859-1?Q?d31QVdeBVNGrhTsOF80lXv2oBDRvP/wYCGS3pZCivQU9H53hIWkGojKjol?=
 =?iso-8859-1?Q?CBCHOKKHyg6tQU11Jf/mD3Giftsffjo3Y1n4goYixG4efZWOQl16vaR2fH?=
 =?iso-8859-1?Q?WAaiobDFpne0SOyG0HMhDzQxYdOglX3RA7F41dnWXyplJ/44u1iOmnqzGl?=
 =?iso-8859-1?Q?o2c1LoBprQP0VPudYH4gvfdTiXXcHhlGnv/veSxKjUXHnSuwP76F6MQOjz?=
 =?iso-8859-1?Q?g+7neygpZrysa5GHXMUCKgJeNbB0Heb81VMv2/oJhGfl7Y5h0Nf7T61l60?=
 =?iso-8859-1?Q?gyh7dwSaG+KKDiqK0aor6rRn76YTTJwLsrvNXZMretZZN0ClJRWZgDJfwp?=
 =?iso-8859-1?Q?Wh/5U+eYhQFOqOdghS4NXA96FCdtdxsSIbZ1L2AiDtLOY4LVgQkL84AvWw?=
 =?iso-8859-1?Q?aUx+dB+K3hWA5Kr9/EMcVuL1RnXWwR9w4zqCtK9SW6UpN66CzY89KkMmEz?=
 =?iso-8859-1?Q?6p51kuIrYpndAGCTUeoiY1JRTjRRLIKAmpctQRJ/I7xQ64N31fJARjGlJQ?=
 =?iso-8859-1?Q?E/u5+xVdZtkRKIK7TtIbqn0uNDh/KgGaWP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65efbb3d-af93-4958-64e6-08dd35f4a41d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 06:11:39.9303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRfG2NcJLPZmuXpMn/d1xbLlOjYkA3ePrPiQgDNnqUCQKH0XD8L3pkn7pp4eyBnLvl+KJtIn+WDExE96kEfzHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8825
X-OriginatorOrg: intel.com

On Thu, Jan 16, 2025 at 11:40:06AM +0900, Vincent Mailhol wrote:
> On 16/01/2025 at 03:49, kernel test robot wrote:
> > Hi Vincent,
> > 
> > FYI, the error/warning still remains.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   619f0b6fad524f08d493a98d55bac9ab8895e3a6
> > commit: 9f06631c3f1f0f298536443df85a6837ba4c5f5c can: etas_es58x: export product information through devlink_ops::info_get()
> > date:   2 years, 1 month ago
> > config: powerpc-buildonly-randconfig-r001-20230115 (https://download.01.org/0day-ci/archive/20250116/202501160236.YSb9NcEp-lkp@intel.com/config)
> > compiler: powerpc-linux-gcc (GCC) 12.4.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160236.YSb9NcEp-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501160236.YSb9NcEp-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    drivers/net/can/usb/etas_es58x/es58x_devlink.c: In function 'es58x_devlink_info_get':
> >>> drivers/net/can/usb/etas_es58x/es58x_devlink.c:201:55: warning: '%02u' directive output may be truncated writing between 2 and 3 bytes into a region of size between 1 and 3 [-Wformat-truncation=]
> >      201 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
> >          |                                                       ^~~~
> >    drivers/net/can/usb/etas_es58x/es58x_devlink.c:201:44: note: directive argument in the range [0, 255]
> >      201 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
> >          |                                            ^~~~~~~~~~~~~~~~
> >    drivers/net/can/usb/etas_es58x/es58x_devlink.c:201:17: note: 'snprintf' output between 9 and 12 bytes into a destination of size 9
> >      201 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
> >          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >      202 |                          fw_ver->major, fw_ver->minor, fw_ver->revision);
> >          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/net/can/usb/etas_es58x/es58x_devlink.c:211:55: warning: '%02u' directive output may be truncated writing between 2 and 3 bytes into a region of size between 1 and 3 [-Wformat-truncation=]
> >      211 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
> >          |                                                       ^~~~
> >    drivers/net/can/usb/etas_es58x/es58x_devlink.c:211:44: note: directive argument in the range [0, 255]
> >      211 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
> >          |                                            ^~~~~~~~~~~~~~~~
> >    drivers/net/can/usb/etas_es58x/es58x_devlink.c:211:17: note: 'snprintf' output between 9 and 12 bytes into a destination of size 9
> >      211 |                 snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
> >          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >      212 |                          bl_ver->major, bl_ver->minor, bl_ver->revision);
> >          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/net/can/usb/etas_es58x/es58x_devlink.c:221:52: warning: '%03u' directive output may be truncated writing between 3 and 5 bytes into a region of size between 2 and 4 [-Wformat-truncation=]
> >      221 |                 snprintf(buf, sizeof(buf), "%c%03u/%03u",
> >          |                                                    ^~~~
> >    drivers/net/can/usb/etas_es58x/es58x_devlink.c:221:44: note: directive argument in the range [0, 65535]
> >      221 |                 snprintf(buf, sizeof(buf), "%c%03u/%03u",
> >          |                                            ^~~~~~~~~~~~~
> >    drivers/net/can/usb/etas_es58x/es58x_devlink.c:221:17: note: 'snprintf' output between 9 and 13 bytes into a destination of size 9
> >      221 |                 snprintf(buf, sizeof(buf), "%c%03u/%03u",
> >          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >      222 |                          hw_rev->letter, hw_rev->major, hw_rev->minor);
> >          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> I do not have plan to fix this warning.

Thanks a lot for the detail info, we will avoid reporting again such issue. Sorry
for the false report.

> 
> The range is already checked in es58x_sw_version_is_valid() and in
> es58x_hw_revision_is_valid() and recent versions of GCC are able to see
> that no actual truncation can occur.
> 
> I just tested with powerpc-unknown-linux-gnu-gcc version 14.2.1 and the
> warning indeed does not show up:
> 
>   $ powerpc-unknown-linux-gnu-gcc --version
>   powerpc-unknown-linux-gnu-gcc (Gentoo 14.2.1_p20241221 p7) 14.2.1 20241221
>   (...)
> 
>   $ make -j8 W=1 ARCH=powerpc CROSS_COMPILE=powerpc-unknown-linux-gnu-
> drivers/net/can/usb/etas_es58x/es58x_devlink.o
>     CALL    scripts/checksyscalls.sh
>     CC      drivers/net/can/usb/etas_es58x/es58x_devlink.o
> 
> The warning is specific to some old GCC versions (v12.4.0 in this
> report) on which the static analyzer is not able to take into account
> that the sanitization done in the es58x_sw_version_is_valid() and
> es58x_hw_revision_is_valid() inlined functions.
> 
> > vim +201 drivers/net/can/usb/etas_es58x/es58x_devlink.c
> > 
> >    177	
> >    178	/**
> >    179	 * es58x_devlink_info_get() - Report the product information.
> >    180	 * @devlink: Devlink.
> >    181	 * @req: skb wrapper where to put requested information.
> >    182	 * @extack: Unused.
> >    183	 *
> >    184	 * Report the firmware version, the bootloader version, the hardware
> >    185	 * revision and the serial number through netlink.
> >    186	 *
> >    187	 * Return: zero on success, errno when any error occurs.
> >    188	 */
> >    189	static int es58x_devlink_info_get(struct devlink *devlink,
> >    190					  struct devlink_info_req *req,
> >    191					  struct netlink_ext_ack *extack)
> >    192	{
> >    193		struct es58x_device *es58x_dev = devlink_priv(devlink);
> >    194		struct es58x_sw_version *fw_ver = &es58x_dev->firmware_version;
> >    195		struct es58x_sw_version *bl_ver = &es58x_dev->bootloader_version;
> >    196		struct es58x_hw_revision *hw_rev = &es58x_dev->hardware_revision;
> >    197		char buf[max(sizeof("xx.xx.xx"), sizeof("axxx/xxx"))];
> >    198		int ret = 0;
> >    199	
> >    200		if (es58x_sw_version_is_set(fw_ver)) {
> >  > 201			snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
> >    202				 fw_ver->major, fw_ver->minor, fw_ver->revision);
> >    203			ret = devlink_info_version_running_put(req,
> >    204							       DEVLINK_INFO_VERSION_GENERIC_FW,
> >    205							       buf);
> >    206			if (ret)
> >    207				return ret;
> >    208		}
> >    209	
> >    210		if (es58x_sw_version_is_set(bl_ver)) {
> >    211			snprintf(buf, sizeof(buf), "%02u.%02u.%02u",
> >    212				 bl_ver->major, bl_ver->minor, bl_ver->revision);
> >    213			ret = devlink_info_version_running_put(req,
> >    214							       DEVLINK_INFO_VERSION_GENERIC_FW_BOOTLOADER,
> >    215							       buf);
> >    216			if (ret)
> >    217				return ret;
> >    218		}
> >    219	
> >    220		if (es58x_hw_revision_is_set(hw_rev)) {
> >    221			snprintf(buf, sizeof(buf), "%c%03u/%03u",
> >    222				 hw_rev->letter, hw_rev->major, hw_rev->minor);
> >    223			ret = devlink_info_version_fixed_put(req,
> >    224							     DEVLINK_INFO_VERSION_GENERIC_BOARD_REV,
> >    225							     buf);
> >    226			if (ret)
> >    227				return ret;
> >    228		}
> >    229	
> >    230		return devlink_info_serial_number_put(req, es58x_dev->udev->serial);
> >    231	}
> >    232	
> > 
> 
> Yours sincerely,
> Vincent Mailhol
> 
> 
