Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.82.118
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792593893;
	b=fNKRbJMAwAHfPOUWIfd9Nt3rKG9qhLRQCvFIZKe6aij3G+N782AhrxCijHTsaai4S6sk
	 uLGOCvySv7KNwW1i4vgNRX0wcqmT2bsLvibtJOrg+iU8AGESHRb6cUrNvkRQjcCCJwskT
	 5NwklBn67xcGtfMctFKPBjajfOyhbZScSHcwLJmp8uyXLN1Gjp+Y+sleTBspUsuIr8ZwB
	 +B2uY9fRWq7dYv7YTUDHboj5k7hNqanLquxPNZmz2GhZuffVrb3FRjGPPd3LBFa8MYKta
	 b4fxCriYOd3wlKqsxtQ6u+oHzw8tq8AYuL7Xx6kU0LsaJnK/mpaptc/cqrNeZZY3zwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593893;
	h=DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=LkbLVbw818dRuZ+JL/O87dZkGdxTUj6kaOecQ5hFePw=;
	b=dUibTo+f6tNjBSghGoQJRxFwCe4TI2urlH4T+1FDf85CdUOHHkqxG2wwZPPy2oNNaJB2
	 F0lsiutZvZTJmezGXSvFk9xQ9vqdrKDBJwdr1NWMw1klMDlCzcdQMhUKbEGHvs1OPKCDo
	 eEijIK/JWM/VK7ZCzLh/BTwEpdkfaO7zjytZs/AR3jyryh+GgHvfLLneK4/crAcJKzI6F
	 9zQiNNAIf7xHnZfy9u/qb5EbW3gnDklQEa1DM1wW23OVyUJxqS/u8hxqlpyeY/E4BR9Su
	 Z6cdKf9c0SaU9WvFTCwIloRQV5VjlB4lgC4qi9UB32O8w1nOQ60T38GF+FE31qPwVzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=gaisler.com;
	spf=pass smtp.mailfrom=gaisler.com;
	dkim=pass header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=selector1 header.b=KrurVqu3;
	arc=fail smtp.remote-ip=52.101.82.118
Received: from GVZP280CU018.outbound.protection.outlook.com (mail-swedencentralazon11022118.outbound.protection.outlook.com [52.101.82.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E7A606A31B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 14:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=gaisler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gaisler.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=selector1 header.b=KrurVqu3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amqkFcHERCo83eUH8gowW3i1Bm+YAIsQhCaJwHZT2WFBJCK6vJYgy+NbQw5Ap0bf63RCN5/pw2Ptfb9yOeiuIb6V7bavs0JwK3aLi7HMUs3pSSH6Z9XKqau8/B15aCtDJpN6zjj4hBoCeN5pzf68Z/+RdF5nIQHzLnBW3fit2eAmuWMhIZTYBoZ4hAt3IlGd5/lU/nqNynTzMHFgE0G88dUScxlTiyZ7UzMDgrOb49rQRvjTgrhphmwPKfLhPLSSuGZvQohKMVn7/e11Qgqipa+RtBSwnh6lvW2p1Dvu4hfxIWSu8s1f07gu35RQfU2ebV6GkTn4ymT0TZZpLVJoVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkbLVbw818dRuZ+JL/O87dZkGdxTUj6kaOecQ5hFePw=;
 b=Lnp+Eab0B+oqCZ9paK5o4UArFjET1ybjf7E4hmkRJ1UvmpwfVUSSNVUxd7Bioktop8r/1W7IMUJ7J18dgT1neLD4B6YLXiOILrCZf7E7PelPUb4EwFN5NMljwa6IxzrOElMYPxx7P54GPU3e3NllgL49oReZENEBCUsyem+C28sxSkN297ub9IDRjfkrbw2egJjkzLScW2Va3ZnmOa01iHwOprx59mrzcUrCbdIWiGCyNvWHO17SE/RLTODwoAy92kDLy2ru4VQUW9NpqNaB95QYkYOBNOcBcEtCoZsd1fn0JySI0u5qAdc8y/BQaZlS3VxxlZ/m3Ml7d5/FOLOfaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gaisler.com; dmarc=pass action=none header.from=gaisler.com;
 dkim=pass header.d=gaisler.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkbLVbw818dRuZ+JL/O87dZkGdxTUj6kaOecQ5hFePw=;
 b=KrurVqu3Kq0UeJjvgByae60OUHnxJxttnk/eF4tjy8ynar7cOj4f5dwhjIgbQVq4zYs6xDoEz5BDDQqzraSvsw4fjyZEOq5OWZWij54dTjZm9v37FJMLXN1UUguy0bSHkGMNUMUHgugoWQd0Ee85hSJiglBWAKJGlVzOvHTulJpBZ2l45VkLdP3e4xAvTiJiCja3XEsvJjhHIut4N7OaymzPG6HOpDmc3vHemPrkGl9rDRlBLm5zxIAKmX7I8bTfGvnwBpvrqeaqpl3yu0U4tcH8ooUW0jTX7GYjiZ8HAUsCQAkYNMsIFDddvFsX5qrBeepTWKN0MKwPd2p5zXi7iQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gaisler.com;
Received: from MM0P280MB1058.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:2::17) by
 GV3P280MB1679.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:244::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15; Wed, 21 Oct 2026 14:44:46 +0000
Received: from MM0P280MB1058.SWEP280.PROD.OUTLOOK.COM
 ([fe80::8e01:811a:7101:e192]) by MM0P280MB1058.SWEP280.PROD.OUTLOOK.COM
 ([fe80::8e01:811a:7101:e192%5]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 14:44:46 +0000
Message-ID: <b6855223-b91e-41d7-902c-1f19e352bb69@gaisler.com>
Date: Wed, 21 Oct 2026 16:44:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 16823/17742] kernel/seccomp.c:437:9: sparse:
 sparse: cast removes address space '__rcu' of expression
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>
References: <202610201358.qXIH5yFX-lkp@intel.com>
Content-Language: en-US
From: Ludwig Rydberg <ludwig.rydberg@gaisler.com>
In-Reply-To: <202610201358.qXIH5yFX-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVZP280CA0052.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:271::14) To MM0P280MB1058.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:2::17)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MM0P280MB1058:EE_|GV3P280MB1679:EE_
X-MS-Office365-Filtering-Correlation-Id: 46621c69-9095-437c-51a0-08df2f81d9c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	80TqaSOSYrvjD9XzocW7oMALu7BOGU1ahDPizt0BMqnETG/NkBwouhMNDaiS+nFolvJBmWAy1tU42gXA2b4gmJcbQkEu1Dh9kcAHYXSnHllbacYSYMezcC2cfcA3mf5nH+h6DqDfERU6PMqNcS5mXZ5Jtxla6Y3arYlei7+XgY/hRFttPore5wz0glltIuXL33kaGVd2pS1vsGQx0do5vNX6/oW5AlOjapMsxhzg9NGc1t0YScujJJSfIg120wd5mMbcJLTd4JB8D7PCCjs9wCENTIrEKKOhUvpD8TG6dJe0RToXEvX0y7F+apLHAQ2RrBO/7UvhClI3VzLhbd1JaVavIU3Ic+Bgza1Heenq1anNyi2YnkdzPEiJRnEsge7bxuLoW+u23nM7yUFMLMA/GvY87QtRH8UlwCwCoEpnmyXfFsf8Pi/mkGCOrPpSU9kXSoJZXwmhSrn8AII5ldnJQagiIyku/ow2vnsVHSVqqfyqsgoBZymsKONa3O7/TOLZirpS6qaH4zSxbUCcAQF/IgoHqIY4MZDa04wNm/hs0pY00qgvogD7zbUkDyfcGZeEH86n1G4S0LWp3Qzw7qHOovhJ4XIFm9Xg8o/ksO3Ht1xdBGQn5z6DPPM6OMzXgGgjdnGdamajJk+de0l2IAYgi5An3O3hnSD0l4cPgokB9eo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MM0P280MB1058.SWEP280.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NC8yNUlKd1BLRkZ1Nkdzb3E4NjRnL1RSMFhHeEo3TE9RWEhDMDNTMkgyNDM0?=
 =?utf-8?B?L0Z0dTRuUHJlcTJZL3BhbktvR1BoMGtDR2FDNHdtSk5xSE1ZbXJYMitPYWVP?=
 =?utf-8?B?eldVSXQraHRlVmtSQ2xGL3pyRU1COVVKRUNsQjh5blRyZ1UzK0F3bG1KRkJs?=
 =?utf-8?B?YTVINWxUN0lhR3V4VkVUR2RTTVQ3Nzk3YXNUN05KMFlBTHlyaUxrMFV6c2No?=
 =?utf-8?B?NDlrYi9tS29YaVl5MThsVEJ5a1NLOFM3bktOdXM5UU03TmxzbG9mOTBjVDIz?=
 =?utf-8?B?Z3N1MHRlSW8xYzVSSEFGMm4zZWttV1NJMUxrMlhGRnlYaVd6R0JST0hFWkZL?=
 =?utf-8?B?aHh1YnFIQVcxcFZlMXZxMVRSNk85bGJYUXFjd2JRNUpxUjBQSFpMY3MzREgz?=
 =?utf-8?B?V2RQalBsbXJlazFHbUVsUnVZZG5DdVliNnBKWUhyM21aZ0FlNWlxajg1dEZH?=
 =?utf-8?B?QmVndzk1dzBNaHB2cDBmdHBZM2lGbVlWVW1QcmxhWTdBSGJYcm1yckZ2Mk8y?=
 =?utf-8?B?NElyYnhwbXZxZHNqN0p3UWNuOU5CTC9uUC9zVnhIbjRpb09iQVZtWEoyZGM5?=
 =?utf-8?B?bmFXYkViNEl6UnNpZnQ1cEp5RVdLWFpzMm9ibDhqZjZJR2V5Z2lPNzc4UHNT?=
 =?utf-8?B?bTJVTUYyTFZsRzh4NkZjbzdEbVpEeFZNNGcrU3pIZENIZzFTN01YM2N5SFRw?=
 =?utf-8?B?Q1J5MnQxU3pqU2RSZUllN0J6SlBMNDZPdFFQYmRSY09WY2d6ZFpMRU9oT3VL?=
 =?utf-8?B?MTd5MWk4a2JBQk1hVGFyWGNmRTlDZlFlOHNPeUYzNFlsRE9CUU5yS1VxTUR2?=
 =?utf-8?B?d0FnbDd4aFQ3QTVnNnZFUUxYbmZnNy9tbzBUVkI3dGtKcnRyYWNCWTNXSkJ2?=
 =?utf-8?B?Mys3aElrQ2FzRVNxd2hjb1VrTzlBaEl2TUVkQjBSMzFHdGhXaUtEQXZiaTA1?=
 =?utf-8?B?UURzcGZDTFY2aUdlQnhTUkNHSUl6TExxRkp2eDM1S21mdmM5Mitma25qbmd4?=
 =?utf-8?B?eVMvTlViMnYzcFlKMjVabXJpcElWLzBmK3NSaU45K21rSUcvdnZwajY3R2U2?=
 =?utf-8?B?Y1BDYnNjaDc1Z1JNQm9pSzZwT1p5SEQraXM4UWZIbVNOTmZ0OVNCS0srRVY1?=
 =?utf-8?B?ajlSVWdWS2tKdGRZVmxNazFySDBVVG9hUEdCRHJJeVpwMlFIOXNLNEdxMDl0?=
 =?utf-8?B?b1hVQlFCU2xSUEdLeWJDUm5ldU41WmpMdHd4dGJxT295MXlOS3BLSkJJNEQy?=
 =?utf-8?B?WU1XV3lyekorUU9uY0tlb3FaU0wzTmhMQVJEUXA0c0hURWdmTnFWeWFRcitS?=
 =?utf-8?B?cGpCRWRUWlNGUi94VkE0TTVBMjlXZXhadG42Vm1hdEY3Z3dVZXRpS3BCYXBi?=
 =?utf-8?B?NmFyc0NHTUR6M3I3SEJtNnZIVGN4MTUzYWMyc29VMVh3Wk5semRhK1BTK0FZ?=
 =?utf-8?B?WEZDbTBIRTFCUmdZNUtVZ0FlanM0MDc1RGpGK0pJL0N4RXRadEl3eFZrS0xm?=
 =?utf-8?B?WUVzMkg4RTRaWTZOWnR0NDZZaUszMEZweVVGaGZyU0Y3N25HTmFjV0E3aTFo?=
 =?utf-8?B?cjRDS3c3Sko0R3dFZlM3N09YazFPZ2tnY2tKNjVuK3RPTG9ZRTB6Ulc0Q2tt?=
 =?utf-8?B?cTgra0g5TjNtTUpnemtZckpmOVlSNnZ5N1NIZW9OYWJ5clRnWlBoQ2dwVTRr?=
 =?utf-8?B?SU5ad0ZRdmo0VGFrV3grL0N3UFJtU3lwZ1BtazdYSGgyY01vb3JMbWMxWEk3?=
 =?utf-8?B?RUh4QlVWcmdVZWNZa3NUdkZTOGFXUGZhL0RLb2JEU2dhYURacUVrRjhKdHF6?=
 =?utf-8?B?VDM0a2RmeFQvTDF2dFlOMHlqMkRFWm9SKyt1alRYMnBWT0IrSGtJL1d4RFVp?=
 =?utf-8?B?c3gwTDFvY3hWQ2ErS294WDdVQ1pXTmJvcGM0YkpHT0xEYUEzeEJCejI4SDZR?=
 =?utf-8?B?NjhHY3ZIWis2UFAwQmI5eDhlK2FoUGpzeVExNkxvcTNvRzVsVmlEdGZJc292?=
 =?utf-8?B?N2lOUkwwZEVzcFpmRFdhd3YwWjlEUmY4QUhnK1BmOXNqeHFoWVA4YURGNUlD?=
 =?utf-8?B?ZnN6bWN0ZlFLL2htVmpGREJwYmp0cXdpUVhZZGlzSDJsV2NOM0xOYmliZ2R5?=
 =?utf-8?B?TjlRY2QrOURQNUYwb1M3L0hsVEZ2N0FJci9UMzVZZG05Lzh2Z25kYkJ1SVRz?=
 =?utf-8?B?T0V0SFA2c1lCZ01kTEtOck1RWHlJQkJIRmlqQ1Jpci9WMkF4Z3NPbkZCMjVH?=
 =?utf-8?B?SHllRWlHNTN2QnJ1VlQ1dkFKekJjd28xV0FLNm5ja2l4ZlRSQ21CZ2EvZ1JI?=
 =?utf-8?B?OVVWS2crYkZZNlhkZ1FVK3orUDBZVlM0WDQyS0xLSlV1U0JjY3lPT0hvNzhF?=
 =?utf-8?Q?upR0X7RrX3Lapml8=3D?=
X-OriginatorOrg: gaisler.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46621c69-9095-437c-51a0-08df2f81d9c8
X-MS-Exchange-CrossTenant-AuthSource: MM0P280MB1058.SWEP280.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 14:44:46.2299
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 91fa4a59-2167-458a-8318-e45d80469d7e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pjBg2QmSkyUrgW8hYiGI5tWTs6s4Nvw0ek7f7nQjdAFAVsCj6R8GSXxtRAm6MwpBz5j5Pyeqdv7qdrslgOpfRn/Qf8Gjadf9fFjhUSeEXro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV3P280MB1679

Hi,

On 10/20/26 13:45, kernel test robot wrote:

> sparse warnings: (new ones prefixed by >>)

>>> kernel/seccomp.c:437:9: sparse: sparse: cast removes address space '__rcu' of expression
>>> kernel/fork.c:1804:9: sparse: sparse: cast removes address space '__rcu' of expression

These are not new in the code as the patch enables CONFIG_SECCOMP on
sparc32 so sparse sees the CONFIG_SECCOMP code there for the first time.
Both lines are assert_spin_locked(&current->sighand->siglock) on the
__rcu sighand and sparc32 SMP's arch_spin_is_locked() casts the lock
pointer. Other architectures that I have checked (sparc64, arm32, i386
and x86_64) SMP with SECCOMP warn on the same lines.

Thanks,
Ludwig

