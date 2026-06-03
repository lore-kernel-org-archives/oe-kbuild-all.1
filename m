Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013027.outbound.protection.outlook.com [40.107.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721F53E171F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jun 2026 17:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780506694; cv=fail; b=tp2iw1dICBXd6w7OJY1XZwbfS+tg6YFeE7l8O/+dR9BUPKeDFDa2TIKvA6UYLjvI9QgPhZw4uePOCpKi8LwX7fYFGBPa0+GGb5JPaRrPb+3Oowy/RUCVoe4QjJMHi6BtTDgN8GSn9GcHdrJfS58IYhVi/PKFkXaq1MMK4poe8Pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780506694; c=relaxed/simple;
	bh=3eYk+4lk38RFdruKeHt7mjAnhtUaixE2RWsUM72Jvvc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mISTENTpZQ7y8tHGPJC5EdcdFcFTW6OJvUBP5s6XHu/Eah2qiYmB10y5tb40ffnDBF2mzt29zoUfPwKRr6OhaVYtfmb78aVlvlvwpZQh4CRJx646DKXdEPSzhHItpUt+yEKFNCQkaZ7wcML946azfeMtSVlWPMnensXviaVy3vE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S8ro5tdB; arc=fail smtp.client-ip=40.107.201.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S8ro5tdB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asA4FtSenOO+2oB6SxhpfwrH49FKmBNXd+pPa/Vrk3r6uCqXYpLRPdzM2NhcSASK6xHrtlFkEpWtPzbDq9GVd8qd1fYmTZXuY3foyGU6x5khPo1ykZrBTqYazRQ3+4um07O29SVrQoUNj0qlWuEepumRGF/GfCOnJDOIOACN1p7EaSVu0jOX+a2CQhMfyU7uMRsMG85AKQ5Xe9yK2tkcKGpi5MKw+J2nMk3I+JcLt5LUGuu+zvcARfOBBLDVO8bH6Er/G+VXbdnhuJ9nz6CRoOt5j2GrCJwfE3Aq0/WaXr8do1WmiF9OOVgFzdNW6+Znfb+VhtGCSkW5+eCx/JtFHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJnI1JsJLwpsj8zeA6iAVUH/wDNYBuHSYYA7DL3CfgA=;
 b=pAClASrM3XSseulSgvqX+WgZumk4At0dKZZQ6mQl0wZGPGEDIUbKF7xVipIOSUSzwjnxs4O6DQYGgPmnjzneBPHomz+rYPfjY1x+WhgvpJVf11U3hR2q+7uy4eecY/yxWparzJ5QKjgRz2V/sBvfsmkboDwNNqURQoyRlfbi5bkvYNCDz7U1t6azVbQvHAYz25n+ymdgpQHvPAAOgAJJVuXS7+Sc/MWdoB3iXi6tZRbdwfuh3ZfMt+7Dlf+dzpMj3oH75gmKArzIrOeHWssEk+iXH/hklp7OJZcyPalW54AEqCFJ1Ulo88/Dkz1JvfxgmL3IJZzjG5I5B6SGZuxuaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJnI1JsJLwpsj8zeA6iAVUH/wDNYBuHSYYA7DL3CfgA=;
 b=S8ro5tdBUekxMFdfyPnao3RGUbUN74TYGNERxVizXVV80vMmwSTy/6njYu1zd/y4bBzceuiL9y3AsgRUGXPPpAhOO2Y1nmid5PEFF7Y+47KeOPhizmzkRcqhQBNyqPyV1BjDHUG/Hp3iojiQr18U4utZ9tTlO5QiHoI/Y61+4J4lNCgwkkRsWzZnp2EzpqbQxvrlVsMTcoBTs9XT3AQt7/75BDgBQdZrx8b+YsELBUL0EumvFAJx2poH9rK2re1dkNKUg5wk5H+iYU30GWNN+6Vk0xQKMa7s9buEuVfxtjAuVdq6d4ZTSioI7qq2nUx+kuXDGfbRyEEsx+7JZ8b7ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7928.namprd12.prod.outlook.com (2603:10b6:8:14c::13)
 by DS4PR12MB9563.namprd12.prod.outlook.com (2603:10b6:8:282::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 17:11:28 +0000
Received: from DS0PR12MB7928.namprd12.prod.outlook.com
 ([fe80::5420:4724:4733:9abd]) by DS0PR12MB7928.namprd12.prod.outlook.com
 ([fe80::5420:4724:4733:9abd%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 17:11:28 +0000
Message-ID: <8fb81835-7f26-4dae-9783-ec0b99f2c797@nvidia.com>
Date: Wed, 3 Jun 2026 20:11:22 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/net/ethernet/mellanox/mlx5/core/lib/nv_param.c:877:31:
 error: initialization of 'int (*)(struct devlink *, u32, union
 devlink_param_value *, struct netlink_ext_ack *)' {aka 'int (*)(struct
 devlink *, unsigned int, union devlink_param_value *, st...
Content-Language: en-US, bg
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, David Ahern <dsahern@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>
References: <202606031801.2KXNQX9V-lkp@intel.com>
From: Nikolay Aleksandrov <nikolay@nvidia.com>
In-Reply-To: <202606031801.2KXNQX9V-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0374.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::6) To DS0PR12MB7928.namprd12.prod.outlook.com
 (2603:10b6:8:14c::13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7928:EE_|DS4PR12MB9563:EE_
X-MS-Office365-Filtering-Correlation-Id: f64aa2ed-f4fb-4ba1-874b-08dec1932632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	DD+noo8RmuheGrzx9tLwLCJbiP3H8sfPQa59cvh+la7DLBnGWz7z2C/aSIg4NssOVc9Y7cTCF3RSO/Th6JQCV7zXdkymggM9O+k0s+p3yOSMQqwzrMJanYK/gWXDCBUW1CgWqMmKr8QGPswj+Rz6fzRjqkRCXz57uZTvllvbNQvNJwvO3zXzhNQT341EMEqf6PwvORqRGsf5rM0QR+uy+hcLw/kGSQhohow1EnkiAh5QieGaEnYjTGN6neYn76vp0lbaACmU1QDDH7jJPV/5ccQckefJquwxUyXa0iotF3w8k+lVSYUKhZar0hPZay02lYmRdBmvS6aUjoDuJLkZACzbCiJxiQP7LQfZtbUDe81Nh9cT707ehs7WyPekxSadl5zXw0qcK+5g2ItRv3h9Pl7E/fGzJfsx3G+AMh7bh3ctMDd/MFAIQ8DyuJAYxYURd9ejvFxWM9Mdw1EoNYQxOzEYs1okxoY4iFhLJTQNvr+6eWJLCjEvx8/0Clt60XfxXZ2S6L56JM3L3U/6mYj/+EHPSCuSoQsWPpIKkPD1pktsC9AmRx2BULk5U4hL9aElfUjlEIwskDR000Yv23yb8jXFmQmcL14iZE+o6ZtbN+AFV+6c8OWzKWZ10M2B+l2Vt5n0A8IRSUfh8WkmtJaq7dS2uc9vU7fVJWkAHUiSCuDPlmX04cgvXROZjG6zDz3Hi7xfRM48eeTVN7w769QuEw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7928.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVd6bHZYZW1mMEtZUTZJdytyZk15Vkt0Y0tKaFh2OUxEWUpvbU1zeGVMeWdZ?=
 =?utf-8?B?UW8wTDNTZWkwK0xobk82Ty92QndQU2dUbXdFTE5HVlFmQXk3ak1HYk0yYTBi?=
 =?utf-8?B?bmJ3OHpLUnR6M0NYRVdEQmVCdUZnNVRZam1mSmNhL0U3b1ExY05KMDdvYUI2?=
 =?utf-8?B?RlZnTHNMTHltbkVvNWs4QWNra25OUkNkWFBQRUR3WHFIS3FTamhzZHRXMk53?=
 =?utf-8?B?dTVRZCtEV3RENmhYaGJEY0taNVdXeDBPekF3R2RZTE9Ta3EzNFBBRDNOVkwr?=
 =?utf-8?B?bzJMaW10a1N2T3hTbkE5TERTeUZjc1J3c1JFZ1hxUmlBVGZxWXhnNXZ0VnFU?=
 =?utf-8?B?YzFGeS95cHVQQTJKWXIxK2VWQzNvNkVxMTBjL002bHZxS2UyVTZxRCtsTXlS?=
 =?utf-8?B?clBKOEZERlhYRjQ3c2orZlBPWU51L0NCZEZrdGIyenBsTFhpdElTY1k1TWNW?=
 =?utf-8?B?TWhvQ0VYZkxSSzFhSFhPZDN1ektyVURPQTJKVDVQbE9xSWFDZWJGRXJ3enNM?=
 =?utf-8?B?Y2JWV2xuT3ZMVWFTUHZEOTVwTkNUbCtyTXBsbm4yWnZqN21zUDN5UG5BOW94?=
 =?utf-8?B?Z3IwRHlwQStQOFpCY0dBbVp1c3NmNHhlVWdMWkZCbit3MVpUUDJqOXlqcjZZ?=
 =?utf-8?B?N1B0NlpzUTJtdXlWR0pEOHd6Z29uVkFkdUI1VjV6blBSZ0pOOTBrZCtLSDFI?=
 =?utf-8?B?eGZiTnJiQXA2YXRsZzhBWTdObGN3S2V1N0VWa0cyZ1BWUzkrZm5IT3VFbFUw?=
 =?utf-8?B?MlFTMEFjYXY2RngvdC9yeklWZHRTU1BvUWhLZUFMKzlyRG9BMGM3Z21hLzI2?=
 =?utf-8?B?RGVQNjkyN2NLVVdBRkl5WSthUmVWYTUyclNObTVwemRVOFdFUlFEZU0zRTVa?=
 =?utf-8?B?bUN5cUVKT2xIT293U2V5UXJwc1ptZ2hDaEhzUERIekliaGRmR2NvZDhGaDNw?=
 =?utf-8?B?ajhSQXNiVnQ3YnV3a0E1ZDNnU3NCMFZWUzNCcGFPZGdjZ1lUU2ViaktXK0Nv?=
 =?utf-8?B?bEFFRWU0NS9jZTc3TjVNQkV6dVV6UFRRSW1GWGZuMW84S0t3VHRuY0xaQmxK?=
 =?utf-8?B?alpJRlVVNCsxODUvWkdNcW82d3oyNUJjQ3RBNlIybjNSY0dUZzd4U2xRbDZM?=
 =?utf-8?B?WDNXVXdWOGFuYW1NVklZQUY0UG51R09EY09rT3JpRm40L2EveGo2b3l3aC9n?=
 =?utf-8?B?R0Ivelc4R3lHT2tDSFNUZlgzaXRydnhsVlgyMEc4ZUJCK24zV0hJNDhCdEJH?=
 =?utf-8?B?eVBHeUJ2K2xHWFUzbUVZVHhmc2hkVGNYK2h0QjJ5cExXSHdBd0ZTbFJENTVC?=
 =?utf-8?B?WThmY2k2QnZkSWdtQkczMG8yYnYvTjBSZGxqK2dGQTRSM2haUW5XbFJ4VmJo?=
 =?utf-8?B?aHZwNFUwME1MbWMzVFljSnozdE04dnVTQmxFc0xnY3lSRk83L01DMXNqQ012?=
 =?utf-8?B?Yi9pMEx2dTdaTmRsUC9oMGVmT01wQm5FWlFCMjFQTHpoMy9JWFlsczFoVldr?=
 =?utf-8?B?MVVOTXBaeFJRb2VTTFlnRFUxenpiSGpKQTIzZ3gra0lLMzZEaVRZVUNzSWJq?=
 =?utf-8?B?MSthYXZyeVpnbXplZ3BFdHJ2c3dUWjlPakY3TUwyK0lUTTdRazZMU3BNcVFu?=
 =?utf-8?B?UWlWRXJZMEJCN2FFZWg1MFlhbnc5R0twL0lKaHFjSVNML0V5T3h0bzlWZys3?=
 =?utf-8?B?aFNrZUtuOUNXc1lOR1Q1VUJ3Z280OEIvNEo1S1haOHZxRnY1WTlUWXRxVkZ2?=
 =?utf-8?B?cEIwOWhmTGF0RFpoeFdZL0Vxd3BiS2RYT1Q2Smhuc0s2MnBUZzdWazZBMDFh?=
 =?utf-8?B?azBRTmg4RzhwbWpDMnJMR1FBdjZhQlBqUC9KVHlpakVUd0ZpVlhCUkhMUTNk?=
 =?utf-8?B?S1JyUjMydVBIb2V0ODg5Y0xtTzQ1RHBLMk1Wb3VJb2t3Q0M4V2FBQWJmWlYz?=
 =?utf-8?B?cVJ1QUMzZEc0SUFEdFV4MjhwTW5EZHVYMnQwUytrMFE3dWhwcG5NdUhwTVBB?=
 =?utf-8?B?UVE4NTNGMkUzcjFEM25XTFoyZTV5eHlvclVGbFI2b0UxcHhrOVFja3VjS1VR?=
 =?utf-8?B?Vjc1b3BxUXg1cXNFWmlhaUlqYVkyYWg5SE5tZElYaElHRE9acjFLOExsMzBZ?=
 =?utf-8?B?TC9TRm5OQ1RCYzI5amVXZjM3dlpQdkZkdzdtNi81UHl4ci8wNnA1RXozb0Iw?=
 =?utf-8?B?ZzNMUTBabUVJNTgrZ3UzeXRMN3FKck9zY2t4L2s2YXRDMXI4RDg1cVVkY1hU?=
 =?utf-8?B?RVBlWHBhaWZoMENYNWU2T3pQOFVYVWYrTFlEcmxNdkZzSEtFYXRlVWRWdTlC?=
 =?utf-8?B?SjlzMWhjMGcvbE4wVE5EVFZxWnJRenpZVHRibzJYMmdhZTROV1hrUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f64aa2ed-f4fb-4ba1-874b-08dec1932632
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7928.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 17:11:28.0257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NE3kj1zeghsT16oWxrliq+CBncDaDNyTF3/ddslW/cZJRpuOlh3Sn863cQtM2rMtKRRXMg4ySQYCB/CfNql18g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9563

On 03/06/2026 19:53, kernel test robot wrote:
> tree:   https://github.com/intel-lab-lkp/linux/commits/Tariq-Toukan/devlink-add-generic-device-max_sfs-parameter/20260603-183351
> head:   3f9c478ff2a7ceca60d14dab453bbd80ba5347fd
> commit: 3f9c478ff2a7ceca60d14dab453bbd80ba5347fd net/mlx5: implement max_sfs parameter
> date:   6 hours ago
> config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260603/202606031801.2KXNQX9V-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031801.2KXNQX9V-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606031801.2KXNQX9V-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from include/linux/mlx5/driver.h:58,
>                      from drivers/net/ethernet/mellanox/mlx5/core/lib/nv_param.h:7,
>                      from drivers/net/ethernet/mellanox/mlx5/core/lib/nv_param.c:4:
>>> drivers/net/ethernet/mellanox/mlx5/core/lib/nv_param.c:877:31: error: initialization of 'int (*)(struct devlink *, u32,  union devlink_param_value *, struct netlink_ext_ack *)' {aka 'int (*)(struct devlink *, unsigned int,  union devlink_param_value *, struct netlink_ext_ack *)'} from incompatible pointer type 'int (*)(struct devlink *, u32,  union devlink_param_value,  struct netlink_ext_ack *)' {aka 'int (*)(struct devlink *, unsigned int,  union devlink_param_value,  struct netlink_ext_ack *)'} [-Wincompatible-pointer-types]
>       877 |                               mlx5_devlink_max_sfs_validate),
>           |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     include/net/devlink.h:635:21: note: in definition of macro 'DEVLINK_PARAM_GENERIC'
>       635 |         .validate = _validate,                                          \
>           |                     ^~~~~~~~~
>     drivers/net/ethernet/mellanox/mlx5/core/lib/nv_param.c:877:31: note: (near initialization for 'mlx5_nv_param_devlink_params[2].validate')
>       877 |                               mlx5_devlink_max_sfs_validate),
>           |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     include/net/devlink.h:635:21: note: in definition of macro 'DEVLINK_PARAM_GENERIC'
>       635 |         .validate = _validate,                                          \
>           |                     ^~~~~~~~~
> 
> 
> vim +877 drivers/net/ethernet/mellanox/mlx5/core/lib/nv_param.c
> 
>     865	
>     866	static const struct devlink_param mlx5_nv_param_devlink_params[] = {
>     867		DEVLINK_PARAM_GENERIC(ENABLE_SRIOV, BIT(DEVLINK_PARAM_CMODE_PERMANENT),
>     868				      mlx5_devlink_enable_sriov_get,
>     869				      mlx5_devlink_enable_sriov_set, NULL),
>     870		DEVLINK_PARAM_GENERIC(TOTAL_VFS, BIT(DEVLINK_PARAM_CMODE_PERMANENT),
>     871				      mlx5_devlink_total_vfs_get,
>     872				      mlx5_devlink_total_vfs_set,
>     873				      mlx5_devlink_total_vfs_validate),
>     874		DEVLINK_PARAM_GENERIC(MAX_SFS, BIT(DEVLINK_PARAM_CMODE_PERMANENT),
>     875				      mlx5_devlink_max_sfs_get,
>     876				      mlx5_devlink_max_sfs_set,
>   > 877				      mlx5_devlink_max_sfs_validate),
>     878		DEVLINK_PARAM_DRIVER(MLX5_DEVLINK_PARAM_ID_CQE_COMPRESSION_TYPE,
>     879				     "cqe_compress_type", DEVLINK_PARAM_TYPE_STRING,
>     880				     BIT(DEVLINK_PARAM_CMODE_PERMANENT),
>     881				     mlx5_nv_param_devlink_cqe_compress_get,
>     882				     mlx5_nv_param_devlink_cqe_compress_set,
>     883				     mlx5_nv_param_devlink_cqe_compress_validate),
>     884		DEVLINK_PARAM_DRIVER_WITH_DEFAULTS(MLX5_DEVLINK_PARAM_ID_SWP_L4_CSUM_MODE,
>     885						   "swp_l4_csum_mode", DEVLINK_PARAM_TYPE_STRING,
>     886						   BIT(DEVLINK_PARAM_CMODE_PERMANENT),
>     887						   mlx5_devlink_swp_l4_csum_mode_get,
>     888						   mlx5_devlink_swp_l4_csum_mode_set,
>     889						   mlx5_devlink_swp_l4_csum_mode_validate,
>     890						   mlx5_devlink_swp_l4_csum_mode_get_default,
>     891						   mlx5_devlink_swp_l4_csum_mode_set_default),
>     892	};
>     893	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Oh, need to rebase, this is because of:
  commit d603517771d8
  Author: Ratheesh Kannoth <rkannoth@marvell.com>
  Date:   Thu May 21 15:22:57 2026 +0530

     devlink: pass param values by pointer

