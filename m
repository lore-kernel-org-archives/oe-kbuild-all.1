Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010047.outbound.protection.outlook.com [52.101.85.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BAB3064AA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 08:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763627796; cv=fail; b=mEvvKRf1z644aZAY4q5m9/Hu6bI2GhWzEYpvvkCeDiyVrBRNvPJPy/BnUQJiF6a0zgT4rbva0j+gdNxEiOuQLjcVVE9ZaFIV1p9v2v4yTCdNUsLtqqID/WuP3HSlgf/LcSgXkYFq7tU9qyj1YlJMbBpRfyBqa+4wTDXOmDRfpUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763627796; c=relaxed/simple;
	bh=7egRkzFetdbAOZ4DboE3BrG8zSxSad+GX39hjFje/dI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FxOzCvYE74RTEmYqfCIzeeRvDUlNYodnZflJS2Cz9WBKQwk2AM+Gc8pfZHgGb6ctzGCQz5zC/c42xOhptXoK6jq1Rwb4fkBFxDeK2bspm49jp6OgOYaAobq1lTnhM8tF4WZIUhqZHknWui6XcwQfVi7pacq4zRzSKd0wa6GpyY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OdzXdFEk; arc=fail smtp.client-ip=52.101.85.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OdzXdFEk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aj7/uGcsw7DAjBjHlzm1PaQK4BKZ+B2Sn6nyXIfF4SWYY0gL9d/qC4EGiVgR69mfL9lT8vDqR9bmVaM0cSyWcEdzSJsxg5yrVvlUpMjpYYxo83U0qCvzzDmlt79y9TSkV+fxFejS3V41j5b/wBSojdNF4dM5w7giVPbTB1HO1RXVtmVbRTn3GMajHgkcyrVZZcvWAOxF47Sj18ESdLcoFP1LS73lF65oWCEutjRD2htYFuOV5Aw1+A5uRgU740koypdp1T7hu896/9X+7/bKlh3kAmSht0nVFr/6dN1vTssFeDlKbqoTBDRN3R9s/HZN3h3hOyvzzgwZxWKVvcVaQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIoBOsyeBAxly41mCieAop7gZokgj0wDdRMg8EfhNvM=;
 b=W1HvaPrMATCfq/N6o/fg8Yj9fdBagzG+ghK3NmCCuldOLcEY/+o1eZOj66SvlJp1FBONRiYzv8wjGF3Gzl8GjpawanwQQWn/C4wgrGgxvH04LO4Xdel1JtYNE3uqMAthbUQQCRC3x2B8bYzFlvvlHB5zwJSCWSI5K2RTqjnI8eWCOGx5QVXvLCFb6g9E0ZJnCCxwc8ssZWpMAHE4vcSFXPpBMLeC/BRwur64tUKaCpIJKLCSlVcLZw9LJgLLby5p7t0SmDzZDHArFW51a1TnuZJ2tlObNEhHwPq510yNGEfekNNVNIr6piImrWJXaoGYfXsf8eqjxEGQ1bvRSBzjyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIoBOsyeBAxly41mCieAop7gZokgj0wDdRMg8EfhNvM=;
 b=OdzXdFEkgvBNTYvhykJW1utzT0Z9w//QOIzZNbse7bwLw2gAWy5wOQkEe+wrJA96T57bm9BefhN3/T/cbUFcskZvaCSFxdO1FbNuLdEmBvAuLtf25hogd7XQTn/SqCdGqe9pKEnjDlxpt2Kbc16jIkz34LgZ4UCWlDlpA2gBHbfksjjyQYyV6eYCpcNjJebxmiJ94OWwtngnfxhj/gItubTMs2kGylfdo1/eeALITzAN/mBJND3acG1bSgOcPPpV6fIdf3eAYOWtBMrU3SvFB8yIuX4MFw/5WDJt51BnxWvnPJLkKfYV4slnbqV4UPd49R8JuqXGWSfLbjbdA0BiKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MW4PR12MB5603.namprd12.prod.outlook.com (2603:10b6:303:16a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 08:36:30 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:36:29 +0000
Message-ID: <9a13934e-1b80-40d4-9f74-2b0cb935cca7@nvidia.com>
Date: Thu, 20 Nov 2025 19:36:26 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-unstable 169/175] huge_memory.c:undefined reference
 to `shmem_uncharge'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202511201656.UKzZspkR-lkp@intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <202511201656.UKzZspkR-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::15) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MW4PR12MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: 62daea9c-aa14-4340-3cb2-08de280fe6c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2tIM0c5dXQxbEN2cm95NzZWaTdEZG4zNFhUQ3NoQzU4VEg1cmFBVjRiUjJO?=
 =?utf-8?B?dDFvSzNWOWlvMWROVDcxbnBvL1RUM01XMys1NCtVektFTXNoVXpJVkVnQ2gr?=
 =?utf-8?B?SWJQZGFoQ1E1a2szRDFiRjR0NHVBUXlrR3JvNXgvS0hLR040UW14WG9PRmpr?=
 =?utf-8?B?YUE5SUcwNDZvNXFGSHVTb2pPc3VreENHYjN6eGtMUXBLS21CR1B4NUtFeHU3?=
 =?utf-8?B?Yy9ta2hCaSs2VjFpS3E4anRlUVNTbHRuSVVkWXlFMHZ1b1VuTVNrdVRXdXZo?=
 =?utf-8?B?YVYrVDlzcy85RW1Gajgzc2lOZEVPcDUzM3o4TGpjMnZGM3dHRUxaY2d5dCti?=
 =?utf-8?B?bGdEYVh3clFFbjd4VTBTWE8wa0RSTG9ENWpXQ1lBanJXTHR2RkdSQnFSRllr?=
 =?utf-8?B?U1YwaEYwUXo1L1UxeHJEZS84UjBPY3FWeXlUSU5BS3J1U3d0YXptc1JwSzdw?=
 =?utf-8?B?bEllNGpveVVPOEdmdi9qN3lwSDVXZUhUblh1aHllMnphVG94VkxQdWpuTFE1?=
 =?utf-8?B?ZTEwbVJKczV0NTdVaXJTeHByZ1FFTE5UOXFLL0JFUmFVc0RxQ2t1U05QQ2RQ?=
 =?utf-8?B?Y2RFeG5hZ2ViV2RKeDJsa3Y4V2txWHBNRzZxV1U4cTUrZkhzTDAydWZRL3Av?=
 =?utf-8?B?ak9GS1IyM0NtSFVNcDZtcUwzZERFRXBUYStFS0NrL1A3Vkg2aksxbWU1d3Iv?=
 =?utf-8?B?VjE4YzhiMXA3dS9mbkErZUkxRjA1QmovUVpuMHlTTXBLNGd3TnBMQUh5SDVZ?=
 =?utf-8?B?SFcxNUhsTGZoQ3RGVkduSi9uTjJBcFpIdTdyN2RhRTVzbGpZUGd3R1RoWVJM?=
 =?utf-8?B?OFRYZUQvczJOcHBaYWxYaDd4ZEV5aTd0UlJOOWx6c3JaNUY4aXN6ZVpTNU02?=
 =?utf-8?B?cStKU0RiNU9lTmg5UXZkU1U2MXlaSllPc2hpcmJiaVAzVVlGV25GeldiQ3U2?=
 =?utf-8?B?Y0lwUWdkMGNRcjB5b0xMeVZITjRTeXByVlJVVit4S0MxaU1YZVA5VDJrYTVz?=
 =?utf-8?B?RVdXMW1SY3EvQWtGVkxST0p5VjkwOS9sa2tRR3NSMi9INlpEa0RLMG9kc0lH?=
 =?utf-8?B?VFBjbmhKemhWNUZ4RUVDdG1kb1JrTWVuTXRFODZtZ05yR3A3cjN4a1E0dE9n?=
 =?utf-8?B?YUJCNmc2amhqZDRFNkRjVjFRUDdRUG9ibW5DNFdpU3FQc0xLd2Z0SHdHbllS?=
 =?utf-8?B?RUM0QmlOWGg4U3hXSlY0UzZHK0ZJS1JVM0Fud3djMjBoeGtmdlBsdXdxc3RZ?=
 =?utf-8?B?OWwybkd0NHIxUDFHSDcyd2NMZW04MVBXNEVVWVVCekhzNzVxaDJ3d2sybi92?=
 =?utf-8?B?TEYwWlg3cUxVdXBwRFZib1FWbmZYOHFjTmRjd3lqdUV6VVdNSmhRelUwdzdi?=
 =?utf-8?B?TUFNV0IwRjh3K3JWVzhoci9oZHhYTXdoMjloUEc0R3UvNTdTUUYrNUJqcGFM?=
 =?utf-8?B?R2VIcTE4WG5rOWMrRkVYRzBrdDBsb2Jyc1NrSW01czd6MTNHLzNmdkhnbDFs?=
 =?utf-8?B?ZHdPVzNDSHpRd2lMUDhXM0xFQ1RaVjYwSUwxdnh6M3d1QWo0M3VBcjkwU1pw?=
 =?utf-8?B?UkcxaTQwRWxJcnJxSkRoZnhEZHZvbG1Ra3BxNlh4TkxYZzNKdWtlaEVJMk8y?=
 =?utf-8?B?RzFjYXlRbytVT0RIb3lsbk8rWi9BaW1oeU1sRmNTalUwQjVVdVZCQndpZGEv?=
 =?utf-8?B?bHM5dW9LbS9sYnhQTG0rWUtDZWFLMVJJY05WRFh4citaODU3TEFCc1Ftckd2?=
 =?utf-8?B?eXNRUmQ4ZEQxTitqT09kclEybkRqb0pTTDF5dThDM1VDSWpaeHNrUHZPOHJQ?=
 =?utf-8?B?blg1ZzZ3My9Nc1hSWDYwSmozVjR5NURHL0JkZUZsQ09ibkNSRFduV2NoeEhD?=
 =?utf-8?B?SUlxdmpMK1dTdEtyVVh0cWJTSitWNk5qK3JqNi9qMHhYVjREK2EwQ1V2b1NM?=
 =?utf-8?B?UW1PMHVEV1had3RPR0FZTUE2R2U3TzhvZFhIa3A3dTcrYmhVRGVHS3lhYWRh?=
 =?utf-8?B?T1Z2d2Vudit3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qmk0bE84WWZUakY4aEN2WEVEWmFSQ2VqVFo3VzkrQlNZako3YmFaV3ZFMlRm?=
 =?utf-8?B?MnVob0lnWnJid1R1aXBsVDg0Y0QvVnZqa3h3ODVDMzREVVB6ZmxVcFREK0JC?=
 =?utf-8?B?Sjh6dHFTamtYT0lGUUVaaDhLN1E3U1ZmKzdlRC9oTGFJRGJwdkwycDJvT24v?=
 =?utf-8?B?SUw0eDVJV0gvMUFlQjZkRnVoanRKSEsrV25JS29zR1RBcWxmdURkbUFDRjQ4?=
 =?utf-8?B?dUFZVjJJQkJvUmhTZ0RGNTd1VkVyNXgzOEw4dGRYMk90S0xGWEk5eXRsNjNZ?=
 =?utf-8?B?NWN5R2xQV1p0SXQ1eG94T3J6djRSSXBVeDNSRVNuWHY3UzVLVnp5ZUUyeWlS?=
 =?utf-8?B?ZUs3UWpBOU5OdkxCWjBIWUNubFppRFg3aWVpa0dKemFwdzBjTjRJQmluSXZw?=
 =?utf-8?B?SGloQkJXR3BWWkdYM3JzQ1VGbGNuWGNYQVVmLzRxdDNqMmwySjAvZzI4bU50?=
 =?utf-8?B?d3NNMHU2citCcUthZTcvSFdrR1Rya1F5SjlHN20yZHVwc3ZwSXhJWVUrQWZN?=
 =?utf-8?B?VEFrMlNWeXkyVzJkRWt1VjlFdlhlSmVlUFgxSks4SkZnbVhFNzgrTkZKL1hq?=
 =?utf-8?B?NlpSSFp2L3cxRWVDMDhsQUJTUnFLSm1SNG1PTTlIS0F3SUZzUGVyR3hqQjV4?=
 =?utf-8?B?SHNzWWkrSjEvQVdPdG1EaTZIMWRUVWhzbUZnT3U0eTUrME41T2dBZFJadE41?=
 =?utf-8?B?b2VDcnJaY1B3cis4NEt4Wk5mOTlFdVlSNWhncGdkNXJHczN2NnR1M0s2dGt4?=
 =?utf-8?B?bngxWHZPWEZuNVlPZDg3N1FXaUdwVXNsVU1yRjNMNCt4aExpMkh3eWJpYWJv?=
 =?utf-8?B?Vmc2SHR3NHY4OVpCeDdVNFFpSldTSzZuUkJ6cTZHcjk2cU5Hd3RnelRjUmtr?=
 =?utf-8?B?WVdJUTdLNTQ2RUptWFVkQ3NEVEdvZitoZE5NdFY4Ukdjc0did2tXRkJrS0Zo?=
 =?utf-8?B?VllqclZ2Nlh0UGczeFBWODgzVjV4QSs1bEhSQWtvR1Y3Z2t2cFllOTR2TWhr?=
 =?utf-8?B?NkdlYnNYWEJlUityU1lkK1hobG5Kb2JwSGRWUDR2enJqUXdUeGxEQmtPZitC?=
 =?utf-8?B?b3BKMmVybHRGRS9qZHVzUlVzR0IwZWpOdm9IYmVrcTdUVFhUbVpvRFoxbExP?=
 =?utf-8?B?N2VBRzZjK1dCVk9qS29NakkvQjRpeWpFaEFoT0J6WVlPa3BNSVhJWVZRdUcr?=
 =?utf-8?B?U1VOMDlBVWJMQnJibW5Cbjg3MXhOSERRd2w1OHN0bVdORzJ3d09CaldmMzVx?=
 =?utf-8?B?dER4VlNZRUtpcUZtUnY2eHdaN2pwMTZLKzJQb2ZscE5wKzFPcGN1bVZoVmRN?=
 =?utf-8?B?MUFYMmduRkN6KzQ4RjNDcWVhQ1cxMmkrMDFBY0lqa3F0K2NRTVFmZ2xJNUdu?=
 =?utf-8?B?OVpXRWRCa3h1V3Q0L1BJcTVLSTk2aTEvdjZLQW5xcVRsT1hzZkgzQjh1R0tB?=
 =?utf-8?B?Z09jUkIyeUxXQkJHWExFcThnVFd3SmZwU0lBUjA3Qjdtd2ppK2t3NjEyNUZL?=
 =?utf-8?B?alFnRXBUTjhOeWhweUttOXVXaUl1WGZWMkNsdjYxdEY4UTd5RWtYakJOdmhQ?=
 =?utf-8?B?T2VKNS8rWU5qeGV1WnY4Zmk3M3piRlg5cTVUNFpGZ2FBeERQWkhFbXMyNzla?=
 =?utf-8?B?VDFJMUpJQ09oek84L2tsN0dPc0Zud0MxcVl4SnNnNCtDaU8rMDlLWmlLT2xk?=
 =?utf-8?B?aFJGSU1XVDVTVVpQQWZVbVBiN3ZJTFFZdUFwSWNSekZ5SUw1OGNaUHhHWGJn?=
 =?utf-8?B?T0lnS3VnWk1hUGFtSExLT0FHYTJaYVoyUG5LRmgwbVkvYTRkWTVNYXBHdGlj?=
 =?utf-8?B?dlMxK0UrcCsyRmFGS1Y2Nmp1OEFyWm93SFBXeHBXU1gxV1FMYSttbGd2TTEy?=
 =?utf-8?B?clpxMEhxNnZSZ3RhY2hIb0owdlovRnM0SGlqVkRZVEFOY2twR3lXUWxwcUxR?=
 =?utf-8?B?b0E4aTVsM1F2Wkw1TUVhWmw4dHU5bGRkUWhxWnlYNXdyQk1mVTIvdkdjaGFo?=
 =?utf-8?B?Y1hObXZKTWpMcWdYaU4zdkxLMGN6emk2WHJuOEI4OXk5ekRSZHZ1UVRJZXpT?=
 =?utf-8?B?SHUxK2pJbXgxVnFVUmVBMlkwVld4SjMwVDcvdUdaVU8wZzNaZXg2Mk1TQS95?=
 =?utf-8?B?VTdINlpYcU14TlRKdUFJMCs2N0I0OW02QmYvbk9TaEdhNUhIOHAySnBJY2pj?=
 =?utf-8?Q?RCpnWe/fZoyaHSRlab1x64+HO1pIevsYlWGcKdeviKFb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62daea9c-aa14-4340-3cb2-08de280fe6c4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:36:29.6000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mts0ADC/eeMYHNttd5uPk7uq0yofeqFVmJpSPoA8fUtpjtsh2r0VevIlNr4kT8x3xDXzo8v7UTGhCFIhuFQ+Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5603

On 11/20/25 19:28, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   5a6a999252f63accde14d4851310f10ba962d3bd
> commit: 9a655bd0773b41af6d8515502de102544f3ec4c1 [169/175] mm-huge_memoryc-introduce-folio_split_unmapped-v2
> config: i386-buildonly-randconfig-005-20251119 (https://download.01.org/0day-ci/archive/20251120/202511201656.UKzZspkR-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201656.UKzZspkR-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511201656.UKzZspkR-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld: mm/huge_memory.o: in function `__folio_split':
>>> huge_memory.c:(.text+0x572e): undefined reference to `shmem_uncharge'
> 

A fix for this was sent out, it was combined with a Documentation and smatch fix

https://lore.kernel.org/lkml/20251120030709.2933665-1-balbirs@nvidia.com/

Thanks,
Balbir


