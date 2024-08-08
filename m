Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229C518C925
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 12:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723119114; cv=fail; b=X0l+7e3VyaFuTV3WAnk9Ysp1RUn/pXRPgd1Iew6tT0CbdLM12rO14ZD0u5a9teQhL/CDgtTRoXh/x+eiLu6oxtAGsc/fvfZOBa2ro8oLas8JYRUjur1Fu71yKaePqiSyycJOOwuua7p+cjULq5Kx0LxbzV9feAxzv+oXDnb6TnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723119114; c=relaxed/simple;
	bh=+WCcT9lEx4GFoAPSAdCWu2Ndn21T908VepCZA5UK5OQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hAfxeQeeVD4qHlcdXFIWL32grCrqZKSwy4Ij10m6AA4A+SDL8S31SiPyVPG0RnHQjPqpnpyEAKrN0lb/zGA/3Y86Tsire6utCp2ZiVUnaFi3rAd47MMcCY4ocUeTH1S4Mav81wkNcKvzA5gax+n8VFY+PqhCAzEti9Cpwttizps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cteCdrvF; arc=fail smtp.client-ip=40.107.236.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cteCdrvF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8QBeHMZhr/pKxyLShL4znUppSAT6p/Fj5FxLmQSdbm6AJIjkWBmC/2AuYH7yNPu89XvaoAb48a1lfGV6rB36zwsW7kF/UNhOZcZ/Y+BoaROm12mg5KpwL1j2dnftdv/sZIxssuBX/WCMv4ly10hA4lYQ0ifCJ4uiM74i7jUX5kmFXcblemKMAg+sM6duBGnhv8++c8q6g0+a+ysDGew1mmLIQdH9xZrChM51BqiMkpzco+zrqH8+Nu1r3at+wS7kW0AGMo+Dox20CUjDI+Y67HA6Wh79bcCOUG8W8mINt6t9pa59jo7QAkBxlQSYYbaEt2P48YZmeddSavVgVBd+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lh+8ctnF0qzUJn4LYhmt6xbnnPEuJPXCn8Sf7tnVnAc=;
 b=cA0PaJUYe2bPqM06PusNaM0dRYlweCup5Nlzlpgzo4sUJFJBDwDnqQjLu94XC958AQ+TdFPy777xT1qVpl5t+sFKdqno3F5rwRratzx8ayg6vjiQ+x/XUm1iQxN5sIp65yvWzkY2Tw6fhGnUzcpKNhyy2qcIlfeOD1aZifDS0oLc/VUz1TvZbFcvqxBg3OLSmIzDJVpjw425aRIsZVWZ32cuG06UIxKRqxM5snFxtGXk06aFOGvfCeNXtZb6GitpejzfsJUlmrRvWefM44ElIpiZHK98zdzpPJZNtOzRfWbDYnAjiaFeX8EQj4oQpC8OCykU4/fc/bbUugc6166zsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lh+8ctnF0qzUJn4LYhmt6xbnnPEuJPXCn8Sf7tnVnAc=;
 b=cteCdrvFFTFi9xqqji8t28Y69p2eN/ZZV0FWeXjXZHOSJU6u9CYY7D3uWabhDAB0JgqWl5S40JXNfaMGep0Ipb76sCmEoeY1vgbSkf/2IdT5RRxKVKAvXsD5psJPVFfdjgsdrUo5Mq8Cmv9ux40KUmyLj2SCEeAcz5CXHOiJsV4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13)
 by IA0PR12MB7721.namprd12.prod.outlook.com (2603:10b6:208:433::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 12:11:48 +0000
Received: from CH2PR12MB4120.namprd12.prod.outlook.com
 ([fe80::6922:38fe:2b1c:7055]) by CH2PR12MB4120.namprd12.prod.outlook.com
 ([fe80::6922:38fe:2b1c:7055%4]) with mapi id 15.20.7849.014; Thu, 8 Aug 2024
 12:11:47 +0000
Message-ID: <f6dcf762-d8f0-4469-b03d-1b1c41693d38@amd.com>
Date: Thu, 8 Aug 2024 17:41:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [broonie-ci:fileZMvsMi 36/37] sound/soc/sof/amd/acp.c:277:17:
 error: 'const struct sof_amd_acp_desc' has no member named 'rev'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <202408081943.I6HGz9Sp-lkp@intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <202408081943.I6HGz9Sp-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0212.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::11) To CH2PR12MB4120.namprd12.prod.outlook.com
 (2603:10b6:610:7b::13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4120:EE_|IA0PR12MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: c4e4e270-6a90-4620-4e7d-08dcb7a34637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZW4wUmpkSlRmT3pqV3FGczg5ZjVRTjRXS0xqWnlsYWZidUdhK0EwcEtYemZo?=
 =?utf-8?B?YTA5QXFabmJSOW5CTGhzMWRmTGNqYUFPeHJlS0xiRnQ3QWhjMUdyTi9hR3Ex?=
 =?utf-8?B?UkQ3SG0wUU44T0tCdmdvT1E5MzRuQmxicXNONmhjaFpyM05IczBIdFQ1dkF6?=
 =?utf-8?B?NXJzb2NIY3lIeXI1NzFvWitLR0tKcGFsRmJzdk16cTFaZzRWZEE3RU1Editx?=
 =?utf-8?B?eER1VmJRbGVORG9VTFBYNFh5WGQrYm5rU2h2RTZuUC8zRldEazRqM0pmck1s?=
 =?utf-8?B?eHRGWVhDQklOc09KQ2tTbjAvUXNFc21LNHhqRU56Qnd4bXNMd0k2OFQ4T0V4?=
 =?utf-8?B?dWxOOHlhcEZVeG1DLzZuUWtyR2pHb2dGSmpmUHJEOWw5T3o1dUZyQk5kYmdF?=
 =?utf-8?B?QkdwRmprOWV2ckkxRzRGMGh1T0VUWTJqdXliYWszV21MSFZFM2VYd09EYXk3?=
 =?utf-8?B?ZzJVckk4Y0JvSDI4WDQxbXJ0NmplMktDTnFHOU9ZbktGdVZnbEFzVjhzc3hI?=
 =?utf-8?B?ZC95R25RZk1PcDBzZUlrTlVWT2g3cGk2R0d0ZnpOd0xoVHJiRExOcEZVN3Ax?=
 =?utf-8?B?WEp3OVExMFVRTlI5Vm53Z1FSTEtnZE9tZnAycXUwS2Q3aDZGUXdNMVBoMDhr?=
 =?utf-8?B?RGF5M2EwbkpSVE9ROXlUUHNyenQ5RTl3aUlMNVJYdWI4QmYxY2NWQ0h5Rm5F?=
 =?utf-8?B?Uk13VUU1UzhLMEV1SFhzNURPNlJaQjBEazduNS9sbmFmS04zTDF5TGwzNE94?=
 =?utf-8?B?N1N0dEFmSmQ3ZEdWcWhxQXVzV0RDVGJhRU5PelV1YW9TZXI5OUtDS0VrdTky?=
 =?utf-8?B?aGVkTllxaFdBc1Q5L25UVUZuSlVqSUdSdWcvODdVdGhnemUyVld5QlhTOWRu?=
 =?utf-8?B?YUNmLzYwa3VzZGRNa3YyM0x5dmlGUS9XdElCWW1PdS9XVWpzajhpUzkrU0Vk?=
 =?utf-8?B?YVhEZkYwMlZ3WDZ5U2oxNE9HK0FNRVR2dndvVlpjaFVBcCtocGdjR0lGdUFq?=
 =?utf-8?B?d2o1bWI4Mnk4VENJQlBOVnFkWUNLalJuVU45WFRXVktZYUJnMjhGblFDSEJC?=
 =?utf-8?B?Ry9vaVRJSW53Umk3UkhQbEtlRzh3cW83bEJrcDFsSWJReHAwWisyWlkxSktR?=
 =?utf-8?B?c1NZeGFpWFFUNlA0Wko0TmQ5OWRuSlBmSkQ4azVvT1RqQm90T0N3WG1FSWk0?=
 =?utf-8?B?VkRLRmpMQ2FMNy95NzVxR2dPTE80YnlKL0QrS1RBbS95ZWNNVWh4OFMzRjRK?=
 =?utf-8?B?bklmSHloRExZbWcrTjVhejVhaDR3dFpUY1pCR2ZGUzdMRUgxNE5RWmkxNEoz?=
 =?utf-8?B?LzhGNjJiU25BeU5RN3RjU1lmWW1hUGF3bStXK0FGRWhWN3JoNWRGdE5nQUVE?=
 =?utf-8?B?c1ZyYWJUVmJrZGJ4bjdiQTdHcE0rYW04WnJDS1dtVHZFSTZSR0JGWkVMKy9U?=
 =?utf-8?B?eHlJYVVNL1d3NzE0N3JGTVVZbkExbXBqb2dWSFg2bHUyajBnZ2RXdnhjbGVZ?=
 =?utf-8?B?RkU1SlQ3UE1NUU1qZ25WTzEwYkhYcytPaDBScFRXVXRJUjkwTUM5amVkVjdF?=
 =?utf-8?B?Y1QzWEo5S0ZudDlVWW5zeEJmLzM4YlduRDJsZFo4VjF5VE4vQThLSEpLTEk5?=
 =?utf-8?B?eEJFcnhaaUV6cTQrK0QzcUw2ZHRmWFZpWnBxdjVMa1Q5RUM1SEdmS0kyOUpB?=
 =?utf-8?B?RnhDUCsrOS90eG9CTFl4d3VIbXNVbmlaOWJ3aXRFVW1hOGZxNzVaT0VIRWFF?=
 =?utf-8?Q?CUs1vPH1NzIYvr2d9zP2xbwXCLwe3zDrhHLyTpo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4120.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Snpmcnk0R0h1MHlKdGpVMUx0QnJoRWd2Y0daNHV2ZkJzYmt3RTJpRjJPSUh6?=
 =?utf-8?B?RDlCNktFcWJuSGh0T1V2b1RGck1YSjBXWm9vd2JITDlqWXB4RGdFSExHZGxK?=
 =?utf-8?B?VXkwM0E5NXpBZkhXV0ZoK1BEdyswTTVZRUsyZXpCNjFoS2RMNWFvd1dhTUpE?=
 =?utf-8?B?aXBFanY2ekFGUW9NTnRiSzdtRHFiTDExbHgwSlB6R2VpeTRKcmI2YUxCYXQ4?=
 =?utf-8?B?QlBOTmg5R1N5TU9CT0JFN1ZDU3hZOGFXZkJHczR4KytzWTdOOWtpOUhQaXJ4?=
 =?utf-8?B?VDgrN2NJQXR2bEI1Uml4dnpZYm5zdk1zamc3WVJ0dnNOcnM3UUNSNmV6QmtD?=
 =?utf-8?B?ZjVDWVdPRU42V3UzTU5ENHpGZEpSbFdtdXJ5dXl0REladnRmQzUwNm1aMmZC?=
 =?utf-8?B?eTFlTmF6NEVBQjVjMk1mb1JtNGdreU9SQ3c1cCt5M1B0QnQzQ0FUQ0s4UkdW?=
 =?utf-8?B?QTVDcHZWd3M0RGM0MFFnRDJ0VDNWcHNFQW9FODBNZXdYVks2cFhUVDNpKys1?=
 =?utf-8?B?TXA0SEYrUlIwWjdkUkZyRmRWcXhUdEd5YlovUGl6T1pBejErSkNuSFhxTlRM?=
 =?utf-8?B?UHZKQjNHeXkrbjkra2NUTmt0YmxLVlZKMDF2ekZqTEpkZUUwNkxkcUt1czR4?=
 =?utf-8?B?WTFGeU9UR3I3TkkrWjd3ZlNJMjg3SEx2SnQvOFgrMVFJVi9hQnZpNCtId1JH?=
 =?utf-8?B?U1hvNEtuK3UrSnJjZENxMU14Q1pYS3JHY2ZhZlE5U28wYXhtUHVmZ0todWdM?=
 =?utf-8?B?aWUzRkRiV3U0RkU1RUV0cW0zaUxLQkxrUlhVbWZ6dmdieGdXY3dTT3FYMnI1?=
 =?utf-8?B?YjlsOFNYM2VUOC9sbFQvWVBvSUJiR3BwbXBveFQ2NllURWRTWXUvOXB6cll1?=
 =?utf-8?B?Y1RWWGFrZUNLTFQzWm9OU1JZYUVCRURwd1RRNGRNU0N1V1UxRlFxQnBLbHZD?=
 =?utf-8?B?ajZ2bFVEY3ZlZnhEWTV1a3NvWTEzR2Fadms0aGpwSHFldnY2ZGFDQ1ZCQUk4?=
 =?utf-8?B?dkxJUitEVHRWS3B5V1BLc2VTNW1HcWdMaEhVNWxLbkhLbGdqbFV4S2hHZkNv?=
 =?utf-8?B?VnRFVGF5K1JEU0VDY3I5U3plamhkQTBIYzIxT056akh3clQ5czQwdmoxUEsz?=
 =?utf-8?B?MURuL2NNUW12eGxkeXZyL0U2dm9HazlWMEsrNCs5dFFkRG9HWWdYOEVETVR1?=
 =?utf-8?B?b3l2Z1loQmljdmR1a1hPdGY1N0dTUjgyU2RselFSNm0wUzBaWUJqTmNhR1Rq?=
 =?utf-8?B?ZjJJSWxqV2NMejNWMXNHUGhJWXV2d0N2YmZERmk5VDNwbG9FNWtYeHFHZm5B?=
 =?utf-8?B?V3RZczZYTGxtKzVKYTB1VXZzOHVlQmk2SFBHSnYvZGJWdmNnNU5EYnpSTU52?=
 =?utf-8?B?VC91T1N6TkxyOUE2NTUrc2YybStFYmVkdXZyeEcyMm5JZjEwaE1GT212d0NB?=
 =?utf-8?B?Ukg5c1lpaC90SEZxeWJtaEQxT1RwdnBwb1NPcEx4cWdJZkhWaUZZWVY5WHhX?=
 =?utf-8?B?SEV2NVd3SjBsck5OejNNckZiTmhnN3FjdXFzUTlqb3ZUN0RMVEdySk1rWlM1?=
 =?utf-8?B?bnhFQzlJU2ZvajN6WDgyOXpyL0F0VVhGQlphWmtobDNJZmNlUCthZVIzUWNh?=
 =?utf-8?B?NGgxTXcvM0pKMkJ4dUlaeGJLM3hITkpTZmFuN2lTdDlibGsrS3hlRjA3WGFN?=
 =?utf-8?B?OVRhV3JoVklVcnh4WlN6eGQ3SW93aHR0K2dMNW9CeUNIN0NLQ01OQlAzby84?=
 =?utf-8?B?c2Rpa29ITU5GUWFvRXBZNVpCd2JJbUJzYVBXZmFRVW1CSXJBOC9ldjNFSVVL?=
 =?utf-8?B?dVEyeWJ5bURuQlhrSm02TG5VNitoS3pZRVoxODNTcWtsUldESWpQeERKU0dS?=
 =?utf-8?B?SnhYaEtPRHpYdzdWZkpXcnZOWXB2Vk56RERUTHJRbHN0MHIxTkVtaHUwdEhl?=
 =?utf-8?B?bjZoZ3djeHg5aWxHU2RMeHVZajdiUTRYNTlHVkFCdmNQNHNyMjQxY3BHZ2dp?=
 =?utf-8?B?eGdWRTdWdlpqQ0lLd0syVlRITU0za1JoUzV6OEZSQjlXV3NMZUFhVkhIUzBZ?=
 =?utf-8?B?WGZRMDAwRzg5UW9Nb3ROcG5TQ1FXeWpQRHVxMDhnR0F2K01JMlZGT1BmbU5J?=
 =?utf-8?Q?DA+v/Lrkg5u6Zy1D1vn6uLUHB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e4e270-6a90-4620-4e7d-08dcb7a34637
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4120.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 12:11:47.6649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whCzdZ3A7Hsehvwrf32tZrE8sCGIdm4u4kvZdCd4LEkIUfDeQMMubfKnrX3g/qt3v7WqpaQB6Tq27Z4a5AiYnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7721

On 08/08/24 16:44, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git fileZMvsMi
> head:   43e41a7c8601d155489d208c40809f96727ea7fe
> commit: 1b18e9f7176f8bec6673befed88068f03fa6d254 [36/37] ASoC: SOF: amd: remove unused variable from sof_amd_acp_desc structure
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240808/202408081943.I6HGz9Sp-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408081943.I6HGz9Sp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408081943.I6HGz9Sp-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    sound/soc/sof/amd/acp.c: In function 'configure_and_run_sha_dma':
>>> sound/soc/sof/amd/acp.c:277:17: error: 'const struct sof_amd_acp_desc' has no member named 'rev'

20240807051341.1616925-1-Vijendar.Mukunda@amd.com patch series not picked correctly.
Will resend the complete patch series.

>      277 |         if (desc->rev == 3) {
>          |                 ^~
>    sound/soc/sof/amd/acp.c:284:17: error: 'const struct sof_amd_acp_desc' has no member named 'rev'
>      284 |         if (desc->rev == 5 && !(adata->quirks && adata->quirks->skip_iram_dram_size_mod)) {
>          |                 ^~
>
>
> vim +277 sound/soc/sof/amd/acp.c
>
> f063eba3e7a6ae Ajit Kumar Pandey      2021-11-17  232  
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  233  int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  234  			      unsigned int start_addr, unsigned int dest_addr,
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  235  			      unsigned int image_length)
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  236  {
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  237  	struct snd_sof_dev *sdev = adata->dev;
> b1db244c716fe3 Mastan Katragadda      2023-06-30  238  	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  239  	unsigned int tx_count, fw_qualifier, val;
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  240  	int ret;
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  241  
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  242  	if (!image_addr) {
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  243  		dev_err(sdev->dev, "SHA DMA image address is NULL\n");
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  244  		return -EINVAL;
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  245  	}
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  246  
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  247  	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  248  	if (val & ACP_SHA_RUN) {
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  249  		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD, ACP_SHA_RESET);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  250  		ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD_STS,
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  251  						    val, val & ACP_SHA_RESET,
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  252  						    ACP_REG_POLL_INTERVAL,
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  253  						    ACP_REG_POLL_TIMEOUT_US);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  254  		if (ret < 0) {
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  255  			dev_err(sdev->dev, "SHA DMA Failed to Reset\n");
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  256  			return ret;
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  257  		}
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  258  	}
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  259  
> 33c3d813330718 Cristian Ciocaltea     2024-02-20  260  	if (adata->quirks && adata->quirks->signed_fw_image)
> 6a69b724b2f82b Venkata Prasad Potturu 2023-08-09  261  		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_INCLUDE_HDR, ACP_SHA_HEADER);
> 6a69b724b2f82b Venkata Prasad Potturu 2023-08-09  262  
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  263  	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_STRT_ADDR, start_addr);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  264  	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_DESTINATION_ADDR, dest_addr);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  265  	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_MSG_LENGTH, image_length);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  266  	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD, ACP_SHA_RUN);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  267  
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  268  	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SHA_TRANSFER_BYTE_CNT,
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  269  					    tx_count, tx_count == image_length,
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  270  					    ACP_REG_POLL_INTERVAL, ACP_DMA_COMPLETE_TIMEOUT_US);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  271  	if (ret < 0) {
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  272  		dev_err(sdev->dev, "SHA DMA Failed to Transfer Length %x\n", tx_count);
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  273  		return ret;
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  274  	}
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  275  
> b1db244c716fe3 Mastan Katragadda      2023-06-30  276  	/* psp_send_cmd only required for renoir platform (rev - 3) */
> b1db244c716fe3 Mastan Katragadda      2023-06-30 @277  	if (desc->rev == 3) {
> bbdcd3d590cad7 Ajit Kumar Pandey      2022-04-21  278  		ret = psp_send_cmd(adata, MBOX_ACP_SHA_DMA_COMMAND);
> f063eba3e7a6ae Ajit Kumar Pandey      2021-11-17  279  		if (ret)
> f063eba3e7a6ae Ajit Kumar Pandey      2021-11-17  280  			return ret;
> b1db244c716fe3 Mastan Katragadda      2023-06-30  281  	}
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  282  
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  283  	/* psp_send_cmd only required for vangogh platform (rev - 5) */
> 094d11768f740f Cristian Ciocaltea     2024-02-20  284  	if (desc->rev == 5 && !(adata->quirks && adata->quirks->skip_iram_dram_size_mod)) {
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  285  		/* Modify IRAM and DRAM size */
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  286  		ret = psp_send_cmd(adata, MBOX_ACP_IRAM_DRAM_FENCE_COMMAND | IRAM_DRAM_FENCE_2);
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  287  		if (ret)
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  288  			return ret;
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  289  		ret = psp_send_cmd(adata, MBOX_ACP_IRAM_DRAM_FENCE_COMMAND | MBOX_ISREADY_FLAG);
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  290  		if (ret)
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  291  			return ret;
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  292  	}
> 55d7bbe433467a Venkata Prasad Potturu 2023-12-19  293  
> 2a2f5f2384b979 Ajye Huang             2022-12-05  294  	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SHA_DSP_FW_QUALIFIER,
> 2a2f5f2384b979 Ajye Huang             2022-12-05  295  					    fw_qualifier, fw_qualifier & DSP_FW_RUN_ENABLE,
> 2a2f5f2384b979 Ajye Huang             2022-12-05  296  					    ACP_REG_POLL_INTERVAL, ACP_DMA_COMPLETE_TIMEOUT_US);
> 2a2f5f2384b979 Ajye Huang             2022-12-05  297  	if (ret < 0) {
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  298  		dev_err(sdev->dev, "PSP validation failed\n");
> 2a2f5f2384b979 Ajye Huang             2022-12-05  299  		return ret;
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  300  	}
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  301  
> 2dc643cd756398 Pierre-Louis Bossart   2021-12-21  302  	return 0;
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  303  }
> 0e44572a28a491 Ajit Kumar Pandey      2021-11-17  304  
>
> :::::: The code at line 277 was first introduced by commit
> :::::: b1db244c716fe300e36428aeb0874913d2e0a91d ASoC: SOF: amd: add revision check for sending sha dma completion command
>
> :::::: TO: Mastan Katragadda <Mastan.Katragadda@amd.com>
> :::::: CC: Mark Brown <broonie@kernel.org>
>

