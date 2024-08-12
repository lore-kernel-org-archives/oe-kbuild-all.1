Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2082.outbound.protection.outlook.com [40.107.101.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E8733C7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Aug 2024 04:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723436995; cv=fail; b=ucRmI/8hVQqHbkTMbTm3yqGV+//sPuO5P64hGpukotd2efcpRgawbCsM51LUgw1uDyqT2jCGsccXvm3zAlhZeTeMms7q2KtuoTMOLXZCpdUiH+OjeBbB2zf+UbsNJVzPSRG15OZTWoGpz5+0hdoiWkTDNQd7sovQd3QiCnvLmxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723436995; c=relaxed/simple;
	bh=cbIm2KMvKwDKlfN5vjDBQdOS3n6iAW8k6HKcR/NiNus=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mg6EiaBCr0JCtZV4zXDPpTwrOO4bFc9hcCfQhdyQHwy0aGhQv1Js3mF6BSzSduJ566fllMb066JWTngem08s25OVw8WONNhlauJ7ZL9fnZIyLW6NHgckHtRCSmeqnm9riDF84VsX5XQRWpZNQJuBTQEprH5xOjjLuCfLhsW6Zvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CbHGP33K; arc=fail smtp.client-ip=40.107.101.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CbHGP33K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpsYjV2w8g2cU/LvoBFvP4PnYg5+cQqaa8SmsdywqEALiIn3U9C8Nfuh2RHfqI1RY+aSQMmGd1EhmtwMWc2aCVDBV00XfBsB/m38obyjr58DCn1MkxLOUiCn6FeIeTUpo/ur9wJ4V9cac9jAXdDfm/WJw56dgkm4NQonBmtXp56BdaA2+9hbeDBcb+CA+JzkRkhgODhWzp7CUZat5hCGpYC+qv9Jp+JTiUvJI7KPLGL1cQdMb8ko0rFP7n5VMFmip3HNVYXsjYh4xOPHZ/F3nkN5RXT8dfNzu0es7seird2tgZ6gWGdtmtfY8TlUSN5d8LoZ7Jz/avtSWdBNrgYjrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSXenG8t+x1h4ggTwAUeXGXZHVLyVSqZ6iikoPoaN64=;
 b=UVBkwFeJ5fbkvli22xmcWzJdS/ohd+atoGT2iWsdYSRViFx8I8BCQcU3tG9BToyrvTZBFl3JL3VqY3kGOA71eqjyPlyxflF11OEiY9jIDa18acu/yiCQyZHRL9Mhipy787hiOp7iLmuGTgDgTcSbYG02w6d+VgvQclb2bAh0dMI1U2Jkioy2jrRVEA49F5dxzS7Yo/wiU2kmFt4OAqZIYKYDi3tkjTyCLog/ZPNLRFt8rI3jAURrOvc3+woJ33a2oxQ9Ud9TbznSftUGHl7BZjzJeVJ8n6BTpJsOy26qnIYZOsZ6t2dUXHI3FjsOpSR+axljjupJegPUOtJ4YHGmYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSXenG8t+x1h4ggTwAUeXGXZHVLyVSqZ6iikoPoaN64=;
 b=CbHGP33KLChNDcpoIzRw+mgEeoFk2EunPHuulfKsOgA6eZvr5FJ/JDAQuqdOfLVY9XZasZt8jEOR3vr5XIGc/lFrUJ03SAOQ6OTuwV5jIKVarxnMKyhQj1bYqD+0Cl2Ss7C4GheE0En4PFGsstOiqCtQUrPhNNmDP5I1Rup15Fo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by PH7PR12MB7329.namprd12.prod.outlook.com (2603:10b6:510:20c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 04:29:50 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%4]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 04:29:50 +0000
Message-ID: <71c62e28-77f2-4deb-aca6-109489294979@amd.com>
Date: Mon, 12 Aug 2024 09:59:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [broonie-ci:filehZ3h8g 26/28] sound/soc/sof/amd/acp.c:407:26:
 error: 'struct acp_dev_data' has no member named 'pci_rev'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <202408100602.KOK3d2GH-lkp@intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <202408100602.KOK3d2GH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PEPF00000188.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::53) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|PH7PR12MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d36e0e-05ab-4c53-23b6-08dcba876766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0wxWUtUbXFoSTA0UFRqMDhwRlM3OU5zbmVVcm9ocVU3QlNDRFpuV1FQc1Rt?=
 =?utf-8?B?ZGsrV3BNQWNYRDAxSUVSM3ZZT3RoblpkMXBkYnZtbENrU1ZMa3RqbnEyb1Fk?=
 =?utf-8?B?STRFVzZ4d2QyRFl4NHQrRkdQVUtPSXlwZm5PM2VWeGcrZ2tuUTBvRVpSKzJN?=
 =?utf-8?B?alM1aUF5cjlGMVVPWk9CTHVaWm9oRWoxZHJiNWoycVNOSm9tV0YrMWJjUHBh?=
 =?utf-8?B?UEY4Q01BK3YzRWxxY1V5NGlIK0FrZDkydzQ1cmFheWtwTTZXTVhOTnFjL2Z1?=
 =?utf-8?B?Tmp5YW9NZlZjLzVvY1JkK2J3c2xnMGNENmd6SzlKdUQ0Rk5HbkViRkttT0dR?=
 =?utf-8?B?azczWEF5YzFuRDVqWEZVQzh4WDhhOFBLejVhVzhsQ1ROSDZ4b241TTVJcjIz?=
 =?utf-8?B?VmxHdzBZbWhsK0NTanlWWkZ1OXg4cFBBTEFXcDFsQUtwVjhMYWFhMEdmZ3BC?=
 =?utf-8?B?cGU0VDVrZEQzdWNXdFBYU01LZERXdFVoR3F5dHZnNlJMRW8vR0VPL0pWcnpK?=
 =?utf-8?B?dlViY0t1Z1pnQUdxUnlKdUY4VXJYUzRLR1pxbzF4cTVjUVZpT09GU2xGQWph?=
 =?utf-8?B?RmpIYVg2MXhsdTl1NHU2NlNGRTdWaUIvVyszUmVZR0I1aXl4VTBHalpsdVQ4?=
 =?utf-8?B?U2MyejgvZkk5ZlpZMXIremx1ZWxNMzN1WndhTG1xWmVsbTdxemQzNGFvWEk5?=
 =?utf-8?B?cjZYbzBpTzhlTS9nODRaVWdSMnptb1Jub28zVWIwYXY5bzJBcmdLSlhxOWhL?=
 =?utf-8?B?T1dnL1B5TDBDeVQ5MURteTJOMmpCTk5sREQzOUNWa1MwQ2xtRnAxUzRJSXNR?=
 =?utf-8?B?d0lkdzUzVlgzenJJZ3o4ajV1bkdReFh2VW5hZTY3Rzk1ZytZQ1UrclVmQm56?=
 =?utf-8?B?cWZScGdpTW1rbkwrMGhzUWRobThjS0RuUGNwSzZCQmZSeEZOVmY1MFhiOHJy?=
 =?utf-8?B?NWJGek1LZE55elZEV3pac0FsYmhjd052dnlXL1VSMmpvOHZSL2RoUlFQeXRI?=
 =?utf-8?B?V3Zva08zbzJxN0FqTnBSOE84NFdkZStRTllvUVA0aGYxWmgzZ2hOV29XQjZw?=
 =?utf-8?B?WkpsTFlZZStoQ2dRZE54aHdQTGozMklwMk1ZdkVCYWxDcDc1UEt4RFRtK3pO?=
 =?utf-8?B?QzdKNC92TG5EL3JWUjZEc3l1RzZMN3pNaEg5UDcxZUV1bE5BKzk3OUtSbW1W?=
 =?utf-8?B?NXVFenhnbTdlM2Q5QkpBODRnRUlhWXhZRnBIUFBmQWlIbmdhRVJSR2RuWG00?=
 =?utf-8?B?TWZENEd1bHFMeVB4bnNCUklDTkw3Tk0rZkQ3WnEvcVFxVGMxUFQ4azliVk12?=
 =?utf-8?B?aVNSRDBhdnpEcDhUNVQvc05IUEJ3RFF5eE9lR1BWZVNtMXplSkpRbEh2T0d0?=
 =?utf-8?B?ZDdHZm1LZHRPdko1aXVKK21FOTl2amNBVVM5Y1FWY0JXajgrRDE2RXRpelZn?=
 =?utf-8?B?VDdxc2NSMnFzNDk0ZFZnUTErcldtblBNVFYzRGFNS25wekIyUXlhalQ2cU1w?=
 =?utf-8?B?cjNidFZkcTJUYTNIQlFyVHBEMHg4dEtFSklIUmV2K3V3MXk3dVpCbkdLVlZT?=
 =?utf-8?B?UVF1K1BLa2RKdjlNSzBUSFJJaGRUczE3U0JUMDR5T0gvVUx3VXJ5M0ptT0h1?=
 =?utf-8?B?ZXZSNDR1SDJydHc5cHY3UXhramYyTkFVaWYwbW1ZdG42cWhUdWE4cEljV2Fk?=
 =?utf-8?B?NTFrYmY2MW05WjdtbWxTYnRnS3lIWVFLa05sOUxlT0FsVUt3bjBwWHJOSFM2?=
 =?utf-8?Q?gjAgm1JVMVIn+TbPinqYFnhk9MvWwuyWvp/tU2P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czU5dVoxS05ONWxCOU1tdC9pb1dTZ3h0YVJqYUpYMTFidnpkbWRFTVhMN1RR?=
 =?utf-8?B?Zk1BdWduNzRZeHF5b2RLNnAvMnp3SjhpaDY5cnNyRzhZZmJ2UitXc2hpcFEv?=
 =?utf-8?B?UktBclNVRzJ6d0JBN21Sbm9lN0ZBVlNJc2M0WnpFM0dWVm1UbXN6b293Lzcr?=
 =?utf-8?B?OEJpdjJnVkdpTFRFVm5YNTFncXJ5V0FzOE4wNzI5YUVZVGlIRkg3L2IzWXBt?=
 =?utf-8?B?ZlZFYlhSa3krV0xHR2Q3bEFzN29DeTFiTkMza2I2THhyYkxyM1FCcm5NWGRG?=
 =?utf-8?B?RTdSMkwycjR3Q2NLaEJkQ2lwRlFIbmJjSE9GVWI5VG92MHZFMmcwZ1MxZ0tT?=
 =?utf-8?B?OE50ZGNJNjRsdEswRit1VnZCUEM1SUx3TnltbHFqdi82Z2RKN1VrTEN0Tkg5?=
 =?utf-8?B?MVUwMHpLMmhVMGhKRXZ2YXBHd1hERXlqblNWR25VTk1uYk1tSndJdnhCQmg3?=
 =?utf-8?B?ckVFdU1yc2dkVDVCU20vSDgxRmU0WmdWNUJEUkVTQWIzejBMbmRPQmFuWEhi?=
 =?utf-8?B?TVJ2MUJpUkNOd2hsSjBaRnpkTlZ2UFhIYzVSeGlCOEhHK3d2eDc1NVBaZWJH?=
 =?utf-8?B?bWdDZGt2N0VlWkdlL0krSFhDb2RQb1lxYk1ldDU0dlg0c1J6YWpyb2RJOWxC?=
 =?utf-8?B?QVNXVWNFWE9VVW1URzFwcmlwRlYxRmw0K0ZRMCtlOVBwYnpiU3RiUU9YVUJY?=
 =?utf-8?B?MEN1N0RXeFVZSVZDSXRWWkpxbVJvekQ3em5qQk5XQXFyUkxqaFJrYXF5NmFT?=
 =?utf-8?B?YVk1YmNvc3A5Z0wyZlJUd0VsN2VIc2pUdWRMTDRGOEdRcWh6SitDSUlTNkxw?=
 =?utf-8?B?MlczcTIxZjdCRmgrNDhSbjFEREVMVUg1ZlBFdGMrN3g4R3R0TXJPdFRydTkr?=
 =?utf-8?B?SDBBZmd1dUsreDBnZ004d3pZUHp1cmxFRVlOczA1Y2lpelNIek1SOURySEdO?=
 =?utf-8?B?RC9NVklXQzdkbVR1SDM3NmI0a3IwbGY3djZhNWdBdEVLRFFXSnFHRmRaTkhy?=
 =?utf-8?B?TG16UlBjNWl6L3loZXZMNWc1NXlRUTJpRjY5K1AyOVhJRE9kSHMzK3N6SkRv?=
 =?utf-8?B?eFhtdHEwSXpZUUdEN1BXVTEzS2J4emgxVXFaYlA3NkdpWEtpM0RKa0daUjlD?=
 =?utf-8?B?TG5HNzJYRVpsYmRwYTR1L1gvblJMMVNoNXY5Tml0TDg3enZ1NkU2MFZraDNa?=
 =?utf-8?B?ck5IdVpmMUpQUGNXdzlQeSttRE5GeFEvRHh2ZEhPci8rTTNvY21PaFZBeU5v?=
 =?utf-8?B?cHRLRkU4U01UTDd2S1hWQVFlK0t0LzZrVThTaGVkZFJvdkJFc2xEcVZkd3Rw?=
 =?utf-8?B?VnBzWmQ4YTJCU3NXQXcyZkVWa3VXVlZ5VmFYdTdGekg2UWhRdDlEZHRQanVN?=
 =?utf-8?B?OVNVYlhNU0NVQldIZVp4dmlGSXR1L3NBdXZ1YVZIcTMybnZkZm94cW9RaFlr?=
 =?utf-8?B?VFRIR1RCNkI2RlRjQTJkVDJTU2pBcC9MYlVyZlN1NGR5Kzk0OTRibUVva2xC?=
 =?utf-8?B?ZnRsUGpyNkNDRW5FMzZXS0pFMHovU3N6bVNuaWxQeStabWgveTZHZ2QwazJU?=
 =?utf-8?B?N3lmaVNscFZPNkpkQXYzbHlEOG12b2ZjVHp3bGJYcXVLbjB2blR6R2JRK1ds?=
 =?utf-8?B?WGFVbG50cmxPS1pxeUpOVzh3ZnUyd2lEd3VPdFJNb3EraUI4dUtJekJ3dVU1?=
 =?utf-8?B?WkZRbi9malpPMjd4U21ORTdTOEpESDB3TGxXaEtLaWxQSFlVaXZjRjd5WUU0?=
 =?utf-8?B?bThuNkNGVDZxUnZ2a3N5dTI1d3FWVkNFSk1HUFlxampIcFg3WENGL2toVmQv?=
 =?utf-8?B?ak1KZlg3ajNtQVU2TE1GTmxIYnFIS1FpdGlCc25aeHF4UXFNaUxjUW4wc3lm?=
 =?utf-8?B?alBJMFE1ajl1OWlkVUNvTndTc0dkRlRESG1TWG5YeExXZVFqcUp2Zk1JdStH?=
 =?utf-8?B?MkdvMk5uNHlPcjgzRHorbGdaOFZOY3dpSjAwMU1raEMxd1J2dXFHbVhUZ1Jp?=
 =?utf-8?B?c1pEcHlCNDdEZzloQ3lkQjh3WUdrbE9QSzBuK0J0UDNKQW9aemloYkV3UHp3?=
 =?utf-8?B?NEdweU5LTU83S1FSRnJkeXdkaU94bld5NkU0bG01UDlFOXlpR1E0bjBNeWcv?=
 =?utf-8?Q?c+emsyNFVn0TSqeBI+0HPz+Ic?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d36e0e-05ab-4c53-23b6-08dcba876766
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 04:29:50.2980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tf9FCi821Y9naVV2Azjg2j4NIKvNte5896D3jedWvG3MST/7Nq/HPkXuR9BWxiaT35gAf82z3O7rxC252+Cww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7329

On 10/08/24 04:00, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filehZ3h8g
> head:   45576eb691a6ad128c577d4b904380458359e3e5
> commit: a8d93b9b3a43cbb342fb6d37c0f0ad5a1a0e503f [26/28] ASoC: SOF: amd: fix for acp error reason registers wrong offset
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240810/202408100602.KOK3d2GH-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408100602.KOK3d2GH-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408100602.KOK3d2GH-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    sound/soc/sof/amd/acp.c: In function 'acp_irq_handler':
>>> sound/soc/sof/amd/acp.c:407:26: error: 'struct acp_dev_data' has no member named 'pci_rev'
>      407 |                 if (adata->pci_rev >= ACP_RMB_PCI_ID)
>          |                          ^~
>
Dependency patch is missing resulted in build errors.
Will mention the patch dependency and respin the patch .
> vim +407 sound/soc/sof/amd/acp.c
>
>    377	
>    378	static irqreturn_t acp_irq_handler(int irq, void *dev_id)
>    379	{
>    380		struct amd_sdw_manager *amd_manager;
>    381		struct snd_sof_dev *sdev = dev_id;
>    382		const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
>    383		struct acp_dev_data *adata = sdev->pdata->hw_pdata;
>    384		unsigned int base = desc->dsp_intr_base;
>    385		unsigned int val;
>    386		int irq_flag = 0;
>    387	
>    388		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET);
>    389		if (val & ACP_DSP_TO_HOST_IRQ) {
>    390			snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET,
>    391					  ACP_DSP_TO_HOST_IRQ);
>    392			return IRQ_WAKE_THREAD;
>    393		}
>    394	
>    395		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat);
>    396		if (val & ACP_SDW0_IRQ_MASK) {
>    397			amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
>    398			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_SDW0_IRQ_MASK);
>    399			if (amd_manager)
>    400				schedule_work(&amd_manager->amd_sdw_irq_thread);
>    401			irq_flag = 1;
>    402		}
>    403	
>    404		if (val & ACP_ERROR_IRQ_MASK) {
>    405			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_ERROR_IRQ_MASK);
>    406			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_sw0_i2s_err_reason, 0);
>  > 407			if (adata->pci_rev >= ACP_RMB_PCI_ID)
>    408				snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SW1_I2S_ERROR_REASON, 0);
>    409			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_error_stat, 0);
>    410			irq_flag = 1;
>    411		}
>    412	
>    413		if (desc->ext_intr_stat1) {
>    414			val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat1);
>    415			if (val & ACP_SDW1_IRQ_MASK) {
>    416				amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
>    417				snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat1,
>    418						  ACP_SDW1_IRQ_MASK);
>    419				if (amd_manager)
>    420					schedule_work(&amd_manager->amd_sdw_irq_thread);
>    421				irq_flag = 1;
>    422			}
>    423		}
>    424		if (irq_flag)
>    425			return IRQ_HANDLED;
>    426		else
>    427			return IRQ_NONE;
>    428	}
>    429	
>

