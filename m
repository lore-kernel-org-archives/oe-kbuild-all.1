Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052F143712C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 13:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791553335; cv=fail; b=rQc7zlvO9SNzjuh8I9jwOwSYUemaYYaSh4ivwSi6PgwHUg3woIlFvqRpBXUthj6/hhLm9qjUivniFJa+dTUC5kYTJ5nbY0/MStwu0Zktlz32QacZZcalGrPF33Vwo+RHVB50ljTCoTcc9UKO0gDFwiTNBUieGhWlJDMbT90ilD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791553335; c=relaxed/simple;
	bh=daMNkiH/hpneYQIhPHSR2eJ+3/IcROYp2MZSvJuSoIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oUDyuw4Vf+BYo8NY58sgc7wHtNGX+j/qLbPAqvTLoVrA6zsNd/pywCoRuH5cm6kO1XOanx+4RbCXmJi/XB9XNwcJLKxIlmZEohYvu3muPUHKbf6sD5fsJLyvqemOpzkzj1UlH6oCu7reDXNKfl9zkxOeirVlFtpRFYGNZGO87gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GeMn9boP; arc=fail smtp.client-ip=40.107.208.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GeMn9boP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VdOqoQWcZBiHCMMNeJu9M2G8gHg1eYFfjxIMdpHV7QBtpzXmZi+q8fuyuyOq2HZ/LpxEC4Jt7ULCdTTReu7oTVe24QRjDEN0whIjg/TpPcMXhM/ODtUMNe6C/Vwg/tK6ovI3GSrmu949VPsHOsIKsTFkEiw0fchBW8FZ4MJ6ZZN/Y132hNLl7D4TIYT0GwEqxMnMbd8zPJ8PNhSW/T0uHwJSuemI7iNqqs0cvQYF/FHOXRiw9X7k9fOj3uRz4JVBPYCE1TkcBAJ3OD4q/jtBkyYs8WKM/MyxH9ybZgY4DntZFBt3KaLbpyhqgGkVhcqZh1RjVI7dotEFN+pzcSLTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26xwUyH5S7vRTv8iflVhd2UHg61RSxayUi2ainixJeA=;
 b=Kz7GltsOFwzDI+/kVSe3nm2AY1HhUf1N7xfNfkPQOdUN3i3MgL0vSmeNngwFTBbGcw3AXNcTVNEjMrBryBZGNDv5HTUerY2y/lPmYNGFZwD1UmfOqvWUs3Sk79SoId8DxSv4EcGi3Gmtvcfm6jKgNQXsnJBj16rBXdzLpvFJdihg0D906nhkRbzAYuYqE8t5bVnm2Bg4aFyXjjSQFw4No71lTbTY5qM4q/Cm4aixJ3HrTrsblUBOM7IHSapiiqAKxSYBqhfBlK1PS9RdDqkfNbzZX+RWwaxXdaeJz1qXMEM/kEImQyxtiutE61Ekbc2ZE5KFqj8i6h033kB2x1o7JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26xwUyH5S7vRTv8iflVhd2UHg61RSxayUi2ainixJeA=;
 b=GeMn9boP86KG9LZ9O3p9/tVZtjAM6YiVd6HWKY6iIPCKZRKZoscSh1N76V3dGCkfDICQApRJ8WtS2saOo8Gaa0RUCa4sQoHTHV1XP4LKNOKB6+03pRDtBpQ+dOYQJrfyQpgdoLySiHks43y4gDAeV6Z3LijyxhqyB9AL0EfFQSKI6kcoZjEjJcWCdlFS6+YkRTUFI/botFPb/YAtYOMD7Un3Pu+D5dErr3Sgx8VkrlzmVKezU1EZVXWttfdcWZM7nKMgAuTmH2hX9YcTzdiWmqZ4cE2leG65Puw0clw1KfEKEP8rP+jnn/AAg4p+g9iGyGr7m0oHPJlJ1W1J1ib5Cw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by CY3PR12MB9553.namprd12.prod.outlook.com
 (2603:10b6:930:109::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 13:42:08 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 13:42:08 +0000
Date: Fri, 9 Oct 2026 10:42:07 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [linux-next:master 8264/14724]
 drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
Message-ID: <20261009134207.GC13920@nvidia.com>
References: <202610070641.B8hxBJcf-lkp@intel.com>
 <yq5abj963sk1.fsf@kernel.org>
 <yq5a8q49522f.fsf@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a8q49522f.fsf@kernel.org>
X-ClientProxiedBy: BN1PR12CA0018.namprd12.prod.outlook.com
 (2603:10b6:408:e1::23) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|CY3PR12MB9553:EE_
X-MS-Office365-Filtering-Correlation-Id: 708ce30b-8125-4c41-860b-08df260b1ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	wlB5LO7WqsCzrJfMRHHtoQXJlexExnj6U/gg5t7iqbbb3Qurqkyym0ALPepPGYE6l+0Psl1z1SzGRJsy/nucdOvL+3zUq1NIXA8odtSa3MXyNXQcvQPrdwXNlbPuxjd/UMEhUvgSlEcv6tlungKqpVIHFOevZHOZMY1MP42Q09/j3aPut6PGuhueX21Upa5+M8lHJ8EKGhhMBS8Gq79epsTukLlM00wrq1Y/Vei5qiGy/37r7WmbFHs1VDTRcE0JEKVXum3HnsTC675Z1N1wj5xbXqN/GFf1Dv8zro7+VEEIGK3veIhYzZIqGsCaTx1p+JttXhnEoyiu+J2yQvLvDdFkzteOQfeZj6tZkRdyHRYtHqp4v6tnm7XoDkJmqZXXPHfxcX+pDYiizESc53xQHk7Ug2PNI+Nb0QVju6EMKbImKmDcprgkngSlXEgT5GHSdAZVqsYOrRxXzAvq7HmNZo4xfflk2ZrjGQN4miMROKiVjjv/HQCDOuqwvMHL5Pucc5jxsWV5K62VY7NY554Yz7LoVGupgTMr5E8XGuMdi6jllyxkFVrx38rauN9adoaS6BCLoLtiK12JY8bl2JStr2AVRHVFoPAZCB2cxWXHbTrLvzy/3VLkqDx8InXxdnVP2MLSXGzy3UwRGUBIbvNo5pn8hZ9jzgQWDBZTOxulCYc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jlcg91CEuMIf+ctvDFelgMKhIcDpi6vOKdKp3H6d2lCgqkUyjUmfUgJvQMBH?=
 =?us-ascii?Q?MdJU+fyI5VvnInsxfbkvWHgan70G84QvucKTiMhvYqngPuL40TfrkIw7Ogn2?=
 =?us-ascii?Q?Wl6yPtwLI5QYIs1qgmZ7hj+lP8enDvWeAIpuDyWlTnsZQe+pwRBJrjYmnaj/?=
 =?us-ascii?Q?KtcrEAUq2L1tgd/SsKTpDfP08NLclweXVV37bbt9VLSYrEcswuvwrG/8hfs3?=
 =?us-ascii?Q?f348hR4xAem9frQebeE8wmKgciJVw/6d54Mu6V7JWEGQqToojGkG9MHHwIaG?=
 =?us-ascii?Q?3FUvGZU9gY3TZes/VNNGbgnWTasEDoMwd2Kc9PIN/ryYn7KBDxqd49T66ntW?=
 =?us-ascii?Q?zS2AjtXY6fF+Jj4X3XLrpe+tIkwYCeAzuBffKKRJAo+vn40K3mVzCuuosJVW?=
 =?us-ascii?Q?z6Ys16x24/FdWciBvhOigg9+6J5o2p/axBgojhzsccRclAjk9HlX4jMF70EI?=
 =?us-ascii?Q?HNArGg8Yzk1PuYp99WVf3W/X4j4pIFgrCXk5rg0+agBbZw+JgKlfG4v91N8G?=
 =?us-ascii?Q?ehsn+clYifJ25puWAIiM6lwuR/SxEKSicl33tQUx10g1o59pCC/4PDh/asea?=
 =?us-ascii?Q?yg7+bdMOxjwxd4dmwu3+RyTZRD3wFJTjDY2f1Yv3J1NX94HOdJttCaEicrer?=
 =?us-ascii?Q?Pzwkh1Hm5ezG/D/F3UEVMc27ThN7Vyrt6IcvXlY95NYHPVxpTWg7ny34487B?=
 =?us-ascii?Q?gJTqq1DcNckxvmJDOG/wOuNqWB1W6tVMeTPvAEmvomHgv2NeM4CG1PAYC/9b?=
 =?us-ascii?Q?16GVqwsqR6uGEYRc8OXsshKEJXwzIEul2xN9ys37NjZlvVFwHuHhp3Y+ya80?=
 =?us-ascii?Q?SQG5VpCAb+y7/KfG0ZTuRiI7woRol8VgOFl5lyFE8XRObCgum8s7xcP2XPr0?=
 =?us-ascii?Q?4uUf+ymvWyiRCFM7NUr/pTp2MNR9ewBGFT5w/PswKPWa3atpZ68m6Vlt4q0i?=
 =?us-ascii?Q?hx7B0wZnzhQVygQDylOVOiEHXrv9UXNn0PqaWl7sGBei1wPSbS3h795FEocM?=
 =?us-ascii?Q?/6WxQw+9zyVfGZC0TdaOHKtmEW3PHOaoneCckNP0tAFjNQ7kdNZJMdEWCE3o?=
 =?us-ascii?Q?FnLc/rsuTcGkBCoExE0mfCN02ZTYIBQ/IeciZtgLtJxvvPAxOa08w23iwNcs?=
 =?us-ascii?Q?/OGQrPRvt3DVzzvE5YfJNzJ2707ilfDTfjsAQ/uY1HjLONA5URdOlPLdQ/+Q?=
 =?us-ascii?Q?/k6fqDRTEC5lzdECBlbC8y5AmzMhpLtYIwM3AMDo5Scjny7QaeXrWwnKoplC?=
 =?us-ascii?Q?Uox4maklAUE+ilQFJUnB+1Nkkm2Z26zknxF5FwO3NMI1lI0H/XVY7/Q50/jM?=
 =?us-ascii?Q?OB85ttmdhHZbtpE7HJ/9OV0kDAHdLe2dsHHGMiHwK3aAW/O3abU6GhtAS/iL?=
 =?us-ascii?Q?n/Ack+oKwGGyznSL5kc7owi5z1MKcfFLiVGynprIoRXIRKx+0zw3Ad06993f?=
 =?us-ascii?Q?hT5lD9DllWv9j19b/lK2Cr3WIpc8LorloJlDn37q1E5hoMFbhdYN3jnAojkl?=
 =?us-ascii?Q?ARM9HSMmjHw0kr9PibPzyqy0/3LpFyOZFwGmjOOeYH5qbXkg2/3Yj4j4q0DX?=
 =?us-ascii?Q?7j6KkTDRRluuil59C/EwzZUyiq/uM5oow63YLqt/aNCIvQqcT7QR4MBTKJoR?=
 =?us-ascii?Q?ADyxI9kzPkWXDq6tWnh9MlA2SH/QCj2gJp4sV0v+4/wK82cjFKgqHAwXch09?=
 =?us-ascii?Q?2w8+1cGD8YYEGBkMq7MTpBfH5Bhk7i3OKQBJDW2PP7LxwImJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 708ce30b-8125-4c41-860b-08df260b1ccf
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 13:42:08.0696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +f72AXIRRRE/y4KAX7hQa3kmsYKAA5+mnF2E36z/IxAJRmDEeyyqWcgfOPBW5YhO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9553

On Wed, Oct 07, 2026 at 02:18:08PM +0530, Aneesh Kumar K.V wrote:
> @@ -640,6 +640,39 @@ asmlinkage void __arm_smccc_hvc(unsigned long a0, unsigned long a1,
>  			*___res = (typeof(*___res)){r0, r1, r2, r3};	\
>  	} while (0)
>  
> +#if defined(CONFIG_ARM) && defined(CONFIG_THUMB2_KERNEL)
> +/*
> + * GCC may reserve r7 in Thumb-2 functions. Calls with eight inputs must
> + * therefore use the assembly helpers, which save and restore r7 themselves.
> + */
> +#define __arm_smccc_1_1_out_of_line(fn, inst, a0, a1, a2, a3, a4, a5, a6, a7, res) \
> +	do {\
> +		struct arm_smccc_res __res;\
> +		struct arm_smccc_res *__res_ptr = (res);\
> +\
> +		fn((u32)(a0), a1, a2, a3, a4, a5, a6, a7,\
> +		   __res_ptr ? __res_ptr : &__res);\
> +	} while (0)
> +
> +#define __arm_smccc_1_1_inline(fn, inst, ...) \
> +	__arm_smccc_1_1(inst, __VA_ARGS__)
> +
> +#define __arm_smccc_1_1_call_2 __arm_smccc_1_1_inline
> +#define __arm_smccc_1_1_call_3 __arm_smccc_1_1_inline
> +#define __arm_smccc_1_1_call_4 __arm_smccc_1_1_inline
> +#define __arm_smccc_1_1_call_5 __arm_smccc_1_1_inline
> +#define __arm_smccc_1_1_call_6 __arm_smccc_1_1_inline
> +#define __arm_smccc_1_1_call_7 __arm_smccc_1_1_inline
> +#define __arm_smccc_1_1_call_8 __arm_smccc_1_1_inline
> +#define __arm_smccc_1_1_call_9 __arm_smccc_1_1_out_of_line
> +
> +#define __arm_smccc_1_1_call(fn, inst, ...) \
> +	CONCATENATE(__arm_smccc_1_1_call_, COUNT_ARGS(__VA_ARGS__))(fn, inst, __VA_ARGS__)
> +#else
> +#define __arm_smccc_1_1_call(fn, inst, ...) \
> +	__arm_smccc_1_1(inst, __VA_ARGS__)
> +#endif

I wonder if this could just be something simpler like

#define __arm_smccc_1_1_call(fn, inst, ...)                       \
	({                                                        \
		if (COUNT_ARGS(__VA_ARGS__) >= 7 &&               \
		    IS_ENABLED(CONFIG_THUMB2_KERNEL))             \
			__arm_smccc_1_1_call_(inst, __VA_ARGS__); \
		else                                              \
			__arm_smccc_1_1(inst, __VA_ARGS__);       \
	})

? (still needs to take care of the NULL res)

Jason
