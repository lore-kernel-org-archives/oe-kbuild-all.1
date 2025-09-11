Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2071.outbound.protection.outlook.com [40.107.101.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C113E21C19D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 12:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757595382; cv=fail; b=KAIMFlUDJJ68x2rFj24N0Z6ZUR+CCjQhhEzOH0cdwZL5SAzGRTwXFoOLyst5yygyPqLpcpqgik7ePG6QQctBCc6d/2MBxWLScMfNWR3BZ3sksFd8iuQ90D5e9Ay2sNwGLxcQF7B0ix8XUiaTnwxM3+ZxjJEN3WrIQYclU5ER64c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757595382; c=relaxed/simple;
	bh=KwPWRWLfN7GO5OTOH6kmaY9h3seNCHbCMXBZSp7TIaI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Chv64IqHf3paEZZkQiHw49BETZjJo14IlFWqdewGhYgBoDB45HH0tOFNDttaD56wnAsSe/KoVzKRkNzsbrFn/xKVcml697lzfGnBAwE73ksQS5poM7sjThU3h41oEM3/pdZVGxRAsG54I1hVN8iujpOovu65lvzK8Wy6dvzW/20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HBOytwVp; arc=fail smtp.client-ip=40.107.101.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HBOytwVp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6J+CHXxcdjKu65V6xS1HGZV4gtR1soGqeoE5YIcYip+0chX2UTda7ryouco+hFLzN6EW0k8Z2cs2HM/xXVEJHEEDdfeXOrAm8hHcCsRuUFQ/vDuKeqsBJNx/XrRfX4W1tKoxmSBnYjcdEUTGI6buRzwdh7J3I/R3TuvjFHRq8/87MUlUgFAjzio8Z80KqzWP4JtcrAOhLBhh8KCrS0q8X7/WZt1G4WRFZ7cX652QH6KM2KY7+eDJLo8PttAcQwwmXlN2q545qXY29zvXtwB7iEAHllxz8AhNSQp7Xuym4+B2CJwnyTrnBlplItTOeWacfiYWvd53B7Km66HsuAuWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YKPMzXWzV3duJBeqbbDbiYjaY+HZDGG5ppeoNWbM8no=;
 b=AuW5zoHINxpl7vojXVC3lUk8pUrVqeXmKHnWXK/AgeEUw6JOYcYmU58rM4MvuMRiP2BGu6oy4q8KXIx4vOlTNdk3hnH8uqV8LNEpOYYPn/ojJB28QAzkXK2csgoVNaNnbkPyln3/EHNLO8VCl1JhyZfX4n2tV+BHnMC90C0RfN3XkauvKU8Sy7vIZ2d96QCYalCFt6Ev+683hpzobpQpkDelwNFrhHBurOBlZaOtennPzw/ycvktfXmFO6zmh7Gyu79XYjYXaTUF719ykPinV8oBiHh1op+ezTXOd5jHzYMs9zDC8DPp773jTzo3UtygpcmsARMtgkDIoGxCP486eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YKPMzXWzV3duJBeqbbDbiYjaY+HZDGG5ppeoNWbM8no=;
 b=HBOytwVpe1EEcCkAdoCQt0jOKsIGFIFA8v0zDGwzlfBtOj+wwXFJbYYff/omok8N0/vbsn7tLeaLKowmou5AVFT7RxPKFIjgYXRisYDT1OGRu/BT2pK8icRgvYKHduo5ge9Pa+84SU5wG5oqpZtgQwnO3xZF9wBDEJ8xcDFCunqk8MDuZDiLiZNP1jnXgKxmlp2UGx/BcB2PWyp7SOKupcCU9OXJSJe7Bo9C0D71ymd3HGrAaR6lmpwuklLbdkbgPyeHmS3QnWpr//8OrcFe2g2cmw2Z7VvMr3PAozrRIbiVc4S0FNfy5zq2ZwdDAbhz4NT8QMN4Ze+g7bRsItdeig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH7PR12MB9065.namprd12.prod.outlook.com (2603:10b6:510:1f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 12:56:17 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 12:56:17 +0000
Message-ID: <100b5103-2a86-487e-bf26-134360e80935@nvidia.com>
Date: Thu, 11 Sep 2025 22:56:14 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-new 400/411] include/linux/compiler_types.h:572:38:
 error: call to '__compiletime_assert_486' declared with attribute error:
 BUILD_BUG failed
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202509110742.wWjLDz1Q-lkp@intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <202509110742.wWjLDz1Q-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:332::26) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH7PR12MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: bf554f0f-b4a5-4318-07c6-08ddf13298ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGcybGxKczJRSXM0Sll2OHYyUGI4VlJTRk5QY29FV3dCWllKTzhOSGRrZktF?=
 =?utf-8?B?WXg2MTByemZ6ZGNDQXp5TkhvTk9zc0ovYWhaRHpaVy9VOG5nd29CWXJURDVT?=
 =?utf-8?B?emVSZHRxbHEyVVpaNU5OUVAzT3Boa1lxOEhkZ0ZrQWxVTkdpeUZUeGNFdFNk?=
 =?utf-8?B?Um5kSUNiY3NqQU4rN2ZzcHRWMFBONVluS3pTQmhGOXRCbVg5Q3FJSEFOZVdD?=
 =?utf-8?B?SVR1cGVZWTZrejZxVE5ZelJqQm53cExITEs0QVN6eklRbENJbHJrbys5ZGFy?=
 =?utf-8?B?VlUvSkx0NnNDemNPMSswbTFIb3dzVW5tVUVIL0lwZG1PeEl1WmFjZ1QyMWFO?=
 =?utf-8?B?UzAyd3pXK1BDODlTVFVFWHRYU0ZHTUxDNU14eG1Sa0tZYU1pVUxUeVBKMXd1?=
 =?utf-8?B?SkVpUmtIODBIQmFKWkx5MFFoRkVzaXRsRnNUNXdMeFdKYlRKRVdLRnNjekdm?=
 =?utf-8?B?TFVjVzVVYTBIa01ObVVsTHlhNGMzRHN2R0dhS3BDT2NOelFPRXYxNGNzQTV4?=
 =?utf-8?B?OXNLaWVSWktBNXFRSDh4MkN1MmJkVkFGQUtsWWZwVmVGOVpWOEt1VVMrWWdv?=
 =?utf-8?B?UVhRc3dLdGtpbDJyRFNzRjhDN1E5c0wrZDVTVXl0WmR6cm4yaTVuSTB3dDln?=
 =?utf-8?B?d2h4UWtYVDlNTVNiM1JpSnl5M0tMQm9LV0xKemhoZVNYbDhsL2J4ZzhPV2Ji?=
 =?utf-8?B?Vnp2K1YvSUdDYmhWS0pRMTVVaDVCQ1gzZmVDQjdURzcvZUt2WWVVRDVGVHJm?=
 =?utf-8?B?TENhZC96ODBJSjVyblVDQ0RoNjN4bEVydE95VCtxVnMyeFRIV3Q4S1JaRFBz?=
 =?utf-8?B?NDhGKzBpL0dsbFE3UlRHKzJQcGZkRzN3cXY0cFdPVjcyZGJXT00wb3g1YVR1?=
 =?utf-8?B?WUttZGtjZGorUUJzQmV4UHZFZFlJd0RoaGFuUm16L1JWWHN5R214UnptWDZG?=
 =?utf-8?B?STcwVEV5RFFpSzRpbko1RHA5eTNiQllCSWF5RllCcDR6UUVhVlVLY2lxTWg0?=
 =?utf-8?B?UmR3UzlodDkzcFFFcEY2RXZxeHpnLzNjZTNQa1ZnamhoT0NWQisrWHBwTDZJ?=
 =?utf-8?B?cHpac1YyQ0owVDVYZnIxN2hWWWZIcEhOd09IeUNOYzdqOUpTY1p1dnAzZ3Fp?=
 =?utf-8?B?Skx6bG9iR1BiaUIzdm5xYXBsMU45L2xudndKaXdQWnQrc3FTRERaRjM3czZ5?=
 =?utf-8?B?Y2ZlMDZCSkJjNE1lYVhkdHl2WEdNRXVIYzlweDY1cDAxMzRyWjZIUXJWMFRh?=
 =?utf-8?B?Y2RHZWFVa2cydkdsSzNOS3V5aHRIOTk0a2wwNlREbFArZVg3d1B2QW05OXJE?=
 =?utf-8?B?S21aUnhlTHhLdnlWY1dEeWhqdVQ3Z3IzQWJnakNxMEdCUUZKYko3bkxock9j?=
 =?utf-8?B?U0F3UndObU04R05zNmRsSld4SXlOeWdaalZ0eTJMaFdhbURsQ1FncVE2ZFUy?=
 =?utf-8?B?TFNtVDBSS3JnQ1l3SXJwTlhYcXNBUzhyWWUvMlRyUlJCWjEvRFdUazY4SEFS?=
 =?utf-8?B?RC9YUW1kYUU1OUZMYk5jVXFsZnZwcUQrNFBmOTNrNmFCQ3RwcHRFWWY1blhx?=
 =?utf-8?B?dk53MjJDVEJkR21xMkNWNkFveHNGa0VKckROakV4ODNIUjJLQ3VOSUQ3RmJm?=
 =?utf-8?B?clNhOUlSRDczQVh0eUkyd3Qrb21WWEYwYnlZdE9lYkFsQWl4cEpLRGRta2gr?=
 =?utf-8?B?ZTlSY052RWtTbGJnUGdISmt3U092TG5SdkJRTnhoTXI5QjRjUCtFak10YWdx?=
 =?utf-8?B?cElkZURmbDNCZEtXWnF4b0dwUEt0Y3UrS2hqOXcwSG9UQ2x2S1RBb1Y4VVpW?=
 =?utf-8?B?eVovTDNBOUw2Z0pQME1yYityaVdvVTdVTWh2TFl0MFcwZXc0SDJZczBEbE12?=
 =?utf-8?B?VEZGb0liRzJjQlhWL1JaZnNzU0NBcXVMZEt1alNCWmcrTXZUWURKRDlkeHlE?=
 =?utf-8?Q?6rvuXx2CQXg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEFzUkRlOC9Xc2FxUHlQNmFuWE4rQlk2eUhIelN1ZngzQWFiYlFyQ0lzaUIr?=
 =?utf-8?B?RS9ZZHN1Vyt5T2V6Nm9UN21oU0QvcmcxcGtmWllzSW5HWHg3bG9sU1FJOWJa?=
 =?utf-8?B?VmF4OUNpMjlSVFNMTjEyekE0b2FCUkE2UWlKTFZTME5iNnA4djlqUGl3Ym1y?=
 =?utf-8?B?RmtlWkMzdTNlb21mL0ErTXc2bWk4Uk05eXhqRUo4Tmd5Wi84VXFOTzRLTHRh?=
 =?utf-8?B?N01TL0JNdGYzeEl6aUdlNkZuTHZwOWNySUM5UkUvTkNQSC9pemxabm43cXU5?=
 =?utf-8?B?RFppR1ZPcTIyVGpvNWo2dmVtby9TTmdQb3pVQVE4d2E0ZkdDNE1tdGZpeTJX?=
 =?utf-8?B?cnROOEVMTmFUMzVqVEZ0TGRSS0l1TGtMbXI5K0ZOWHlwVjJvOXROV1h2aVd4?=
 =?utf-8?B?eTlNQkUwUVFZY0p1dWwrMFhxN2tJNmw1Wkp1MHVkTEFEanBQa1hXdi9uT1NH?=
 =?utf-8?B?QkpoVnpadDMxaGFBaDA0Rnlsakh3R3Z2QWNWU2plMXdNb1QvaVRlQWtMSVpw?=
 =?utf-8?B?MExSZm9tdWtLZEpWM1hpWUprcTFqcCt4RUtpam1GaU9VZEtLdkdYb0xuUUt0?=
 =?utf-8?B?Sy9idGxnMWNMUllKdDNEQ21DRFA4RHdsNk84Rm56NEo4bHcrU3U0WHExUzdj?=
 =?utf-8?B?anFxcGRtN3Vwand5dFVTZE1mUFd2OUI3N29Kc3R3RERDNEVqZVhDc0RjVk5V?=
 =?utf-8?B?RmF0RXRLd3N5Y1hXaVJyYzZZWTdsSzRncmxCMk1SVUtZNWVVaHZBdmZOWnh6?=
 =?utf-8?B?bzBWc0pPOXh1akNMUDRkY0U5MGNkbXNBdzFsMjdvSERhWFIxVWYraEw4UzI4?=
 =?utf-8?B?K3grUFZtNXZxdUhEdFNsaTMwR3R5Ym84SnJzY08yclBYSjdBbFFXZTFacVVn?=
 =?utf-8?B?NFl1VC9XemJDeHBCSlA1WXBjbnVYbndhL3pHK3o0TDJVeUd5VUszZytmNnIx?=
 =?utf-8?B?N1ErNU4wWDBFeE1udTFlR21xSjZJYTNlaTdVVWM3RERnKzhVS3lxTlRQbXhk?=
 =?utf-8?B?WGN0aFJnb1VoVWhFZy9EM2Z6Mk82aGVKQUtMYlBxYVFETlpUS1pQRUFBSkMw?=
 =?utf-8?B?bkxnbm5lR2VVakd6SlZWWGg4Q20vNGtna29MQ2pOckVzcklnVStSTHp6bDk5?=
 =?utf-8?B?YnNvU0piVVVLKzlSeTZoNlZMMjVnUks2cHFyOGZqQVdsTU1tYWNuM1FveitF?=
 =?utf-8?B?WUNBcjFBTWdTelpRUUF5OW42cnhTVGVqWldRbEFHTXFtaGZVdXBSVmtaQ2dU?=
 =?utf-8?B?UTU4bmI1ZjlvOWthTG9pd2Q3bVl2UzcwTDU0WXU1dlNxb2JNb0cvR3ZYZlVS?=
 =?utf-8?B?SDI5MU1qU2F0VnN0TzQxbkoycjVzS3M4OGF6ZlUyTXV6SFFBcnZPZVlnVTl4?=
 =?utf-8?B?MUhhc01scjJWbUVkbnVGNTBRdjZTTEhXdmx5TTNvTUlQTEVwdllka1hGTEEr?=
 =?utf-8?B?VkRXUUQzUnY2Y1d0djF6RHVHR2krMi9UcjhyRFNpSHJ5M05VcnppaU9PaitD?=
 =?utf-8?B?cUdEdUxzdG5sMUU5RU52SExHeGZ2V3ZXbk5FVWxvYnNENzE1TU42VnQ2V3hD?=
 =?utf-8?B?RTF6RTEyelFza1dvUmVsRmFLeTdtSklkV1Q0WmhjSG1ETlRKaUEwRzd6bnFt?=
 =?utf-8?B?U0ZiNXlDTVFIc0lVSnlQNG1qYWZ5aHozVmNsWUtUNzdJendaUjRNdUFWbWdH?=
 =?utf-8?B?aVVMQW1JekllWUM2clNONHcreDVJaVJvb0xmSmZUZUNDYlFZTXoxN1FCUGd5?=
 =?utf-8?B?T0JKV3JobWZGME02Q0ZlN2pWRDlzTzhNUnFEQ0Z4Wm5mWWJ0eGNra0VKQ1cz?=
 =?utf-8?B?MGNxZmloSlk5bTE0MWxWcUFMcENNUEh1c2NtditRUC9VUHVGQXMzalJ2Nzh2?=
 =?utf-8?B?NkNwZFkxaDY5T0ZjeHFobHVLai9IbUpnZjFzamVOLzc0bit1R0RsS0FpcE1F?=
 =?utf-8?B?TzZkeHVsNE54dE9rMEI5YzczcHFkL2xWY2RKTnlGSTZKMW1CL3gxb2NvcUM4?=
 =?utf-8?B?ZFVUZWIzMXlUQ0dnUTZCZEtNMzRRUmhWWFpzSmprNUxhUlB6U0toMTZGT3Bj?=
 =?utf-8?B?R2MxUm5xR2drUFlWSkFsWVI2T3BwR3ppNjVrdUtBRlk1YmNzd0JHKys4TmFF?=
 =?utf-8?B?YzBYZXYzeXplMUxSVTVVS00wWnZURktPUllqcnRFN0FvaG9xYUp6a0N5OU45?=
 =?utf-8?Q?bcCOo/pU5kIhlmB0whVrtDX9L8lhiGbbUJujBvW/Da2N?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf554f0f-b4a5-4318-07c6-08ddf13298ee
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 12:56:17.4741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AQ7qiiuPp7lPjW/P2XNXRfi+A7t5WnAqE4aXvyrz8EMlEcWYahK0pW+ysRnbodvBOmul85IMvg71XU7BxbrpPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9065

On 9/11/25 09:47, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   3a0afa6640282ff559b6f4ff432cffc3ecc2bc77
> commit: 5e59d4de7ff923ce84158f3357c4e964d2ec46af [400/411] mm/migrate_device: implement THP migration of zone device pages
> config: powerpc64-randconfig-003-20250911 (https://download.01.org/0day-ci/archive/20250911/202509110742.wWjLDz1Q-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110742.wWjLDz1Q-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509110742.wWjLDz1Q-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from <command-line>:
>    mm/migrate_device.c: In function '__migrate_device_pages':
>>> include/linux/compiler_types.h:572:38: error: call to '__compiletime_assert_486' declared with attribute error: BUILD_BUG failed
>      _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                          ^
>    include/linux/compiler_types.h:553:4: note: in definition of macro '__compiletime_assert'
>        prefix ## suffix();    \
>        ^~~~~~
>    include/linux/compiler_types.h:572:2: note: in expansion of macro '_compiletime_assert'
>      _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>      ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>     #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                         ^~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>     #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
>                         ^~~~~~~~~~~~~~~~
>    include/linux/huge_mm.h:113:28: note: in expansion of macro 'BUILD_BUG'
>     #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
>                                ^~~~~~~~~
>    include/linux/huge_mm.h:117:26: note: in expansion of macro 'HPAGE_PMD_SHIFT'
>     #define HPAGE_PMD_ORDER (HPAGE_PMD_SHIFT-PAGE_SHIFT)
>                              ^~~~~~~~~~~~~~~
>    include/linux/huge_mm.h:118:26: note: in expansion of macro 'HPAGE_PMD_ORDER'
>     #define HPAGE_PMD_NR (1<<HPAGE_PMD_ORDER)
>                              ^~~~~~~~~~~~~~~
>    mm/migrate_device.c:1101:10: note: in expansion of macro 'HPAGE_PMD_NR'
>         nr = HPAGE_PMD_NR;
>              ^~~~~~~~~~~~

Thanks for the report, I'll fix the use of HPAGE_PMD_NR by protecting it with the right
conditional or using folio_nr_pages()

Balbir
