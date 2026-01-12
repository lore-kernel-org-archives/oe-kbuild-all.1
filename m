Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013006.outbound.protection.outlook.com [40.93.196.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A637214A60F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235944; cv=fail; b=RCgru9Jnu0f/dbgX2+CScM3G+18IbFpmtbJJEMnUGWHvLyrd2wR+i0A3G3w1+7wUd9Yc+5evFicj85xmfgEfXGvjLDI5I7n8N3JLbXXfz++pMrcNFO4NYwh1nH5LrgCVfuA3Mo09hDzLcvWFMSr7/daOI0+pypezwOkN4U3v3tU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235944; c=relaxed/simple;
	bh=OEeCSIWd3JfWUeRCMU8lJUeryBliYoe6NLfjB4or0Us=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T2FEskemWaE7ZmsUHYt2hurs00Sgm6AvsTTHx8cBam/o6LH4jdRKRlMZgFTIhSqqhNyFY8IGyJC5JinsflvybpD0j/8ze6cm8F+C3VV+SZjISo1JJkQosoIRKU/qUd7QIjL3UhrMf+yIvTVoae9rBs3RhDSEawUWK3Ej4yl3+Ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Jl3C+U/L; arc=fail smtp.client-ip=40.93.196.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Jl3C+U/L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQMrIqIFhb4iGW/IpkiYpk0gzauima/8EOTTFI7vB4O8dqb6Cc+3Z+de8I0WKDEsp+SA0sfqhXIpNRbVVOYVl9DKJXhn3pIIEaNYDS7zTOjapipTDfrQ76+DholA6pV1hEU9vd3Uu5FA5QSyfKONDQTdN8ceP8TGcnmH0NzgTTynzqn8v5b0lc0pVIL6XR8oLb1dg7V4NBa9w71s0RPOWTH5+YAiRXiWynsOwtHpD1Sj1R7+o/fyH80b9Kkp/jkIqTfosr9cOjwi5bcDr6MBpXFighepuZFKCQT8l0HaFFr3aXAZQ/0uMkmuEm4nUjtQ1WxuXN+3rWIFe5iILqVXZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nh7UQ0tYOm3gvf+BpD7I2d6oFThhyweCuOdbBnMHfdI=;
 b=czkNmXxbKOR1PqgxbEJ76Jt7zHYL8rSohiWcSFzJeuUZ59UeWQxg2Xs0znB/yMZabNHJ7ZbkfDk4A1RDo9oMClw4gkoyNLz3MGnHD0yQZC8eNMjBMnCJOM/H9dZAtEzr8hpAxplcjNA+iUAHnjyY6IhlPBFdj/VuPeWtFWXxxi5HcVSZcGym6cHYFkC7oA7KbAl6fGrOUYCBE/2BWGZhYfu7JkhgVJDLg3CgC83kR/feildAfyrv0m5kALf8+Vx7muhvLckfELpqQDtaIq5ApZPB3bnAqYqFvnl5g/xfyBhP9yH7HZmS/gHoKRjKPLRj5zlaZ3R2TN22Zai0Vx8wWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nh7UQ0tYOm3gvf+BpD7I2d6oFThhyweCuOdbBnMHfdI=;
 b=Jl3C+U/LsVysTJ/jtOInge5tV8Hl1gUg4+CR+nma812Ucm8hBXF0rwyytufXrN/8UGEDOTcXHVvThcfDErzKAexQ7y+r/iuGhFl0YuiG719gsbAYifcWjiY4wWZdW8jrxj6nQkelHTpPtWljxS+ZqzmzZ81SIJTAAT+BBuvRFzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by SN7PR12MB7129.namprd12.prod.outlook.com (2603:10b6:806:2a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 16:38:59 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%3]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 16:38:59 +0000
Message-ID: <19d54b7b-df81-451d-b22e-a7fb2e90ba73@amd.com>
Date: Mon, 12 Jan 2026 10:38:51 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/sev: Use kfree_sensitive() when freeing a SNP message
 descriptor
To: Borislav Petkov <bp@alien8.de>, Julia Lawall <julia.lawall@inria.fr>
Cc: Nikunj A Dadhania <nikunj@amd.com>, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
References: <a9b57156-4b2-8e62-d083-c85ad9b085db@inria.fr>
 <20260112114147.GBaWTd-8HSy_Xp4S3X@fat_crate.local>
From: Tom Lendacky <thomas.lendacky@amd.com>
Content-Language: en-US
Autocrypt: addr=thomas.lendacky@amd.com; keydata=
 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
 WiyqywZI5g==
In-Reply-To: <20260112114147.GBaWTd-8HSy_Xp4S3X@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:5:335::24) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|SN7PR12MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: fa612b24-8940-4c4b-f959-08de51f9161e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QnBENERMMmVPMzJwMFZaMTJoN3hpWGZHcENSM0FxNnVpUU13UmlGRFgySmlt?=
 =?utf-8?B?QnRFVXRURkNNM1hwa3dWM0kxQkJWbjVKNWhuMTI2ejAzVzUvVkM0amNIQ2cz?=
 =?utf-8?B?b0Y1MEd5SFQ3R2k0NWdkUVZwU2VmU3pzV1ZUbWNqdWlMT1B2VmlObktqbkQv?=
 =?utf-8?B?c05QYkM0V3pNODVzUEFLc1lNcEtOUDJwODlGck5vYWlhSlIxeE1KazhLdEZ4?=
 =?utf-8?B?WU5SQ0NNZy9IYUs5ODhFVzM3ejhvejMzcVVWRlYyazJ0VDRSVm1aQXA4eTE5?=
 =?utf-8?B?QWhzcHd1NzJWMUVCUENmckVzcXRBYnF1dFZIRHN6bjdpV1ZLbDNSRHQ0L1Vh?=
 =?utf-8?B?aU9tU0kwK21jZ2RsSW53OFdsYVVxUzRjNGRWMjNxNXltSDk5b044Z1d5M2ph?=
 =?utf-8?B?Ri9meGhuSWM1WlRoWDQ4WUN1b1FmenNzL0tlNi9wTVBadzVnNDFoTjdBWHZW?=
 =?utf-8?B?dlV2aFV6RjlBbUsrVk9QYlBoUDNsVGcwSXFEU1BCT0RockJsWDg0dm1GNEFC?=
 =?utf-8?B?ODk5Y2VwcTV3aXZxUUZobGgwVHRzWmRybllneDhUZS9xQ1Q0VjRhVjg3UUc3?=
 =?utf-8?B?eTU0M2s5UlRSdExsWUNyRjlmb05hTXlOTmdkZzdGbFBLd25LZlNmNFVzS2JI?=
 =?utf-8?B?TzlCb3RjM3NrYlY0YUdKSERhMUtTaTJ2QU1SSy9iQnF5RUxIMmt4REpPTldj?=
 =?utf-8?B?MG5KSzhQNk1pQlZNaWhoQTJTUzFzdjJDVEZjeGtCdE53M0QvNG9nTzlWbktP?=
 =?utf-8?B?c1E1VU10Ykh2bmdsQUxCTE8ra3RjUWMyQk00UWdXK0U4YU5XQTFoSmFMWmJy?=
 =?utf-8?B?a0Z2SCswTCsvRG1iTjRQcUZCUmgxWWlsRmNoazZzWkVUTzl6T1RxcWlwc1lk?=
 =?utf-8?B?S3RBYlZLbXFSQ3l2Tko0Rmg1cFZzQzZ2WWJDUld3Y0RpUUdPMWZmM0pTWnhs?=
 =?utf-8?B?c1RHckFJcE1DZUVUYXhEU3ZoQ3l0Ty9tOHBLaWxJcjdsMkgvb2g3eG1od0Y4?=
 =?utf-8?B?YUViOEY0Z0t0ektmK2FBWm10b1c5aHBPWjVZaWxRQmZiZnEvLzc3aVdVOWF0?=
 =?utf-8?B?dGgvUEx0VmYySlptZkFBNHJMbnhOUGZIZzBFYWgvQmZXRFRpbHBybFJwZ1B0?=
 =?utf-8?B?RHRyYzR2dTB4eUNlY0tCbE5WOHVGVWxXcnphU0xqR2cwaGgwTkwxMFd6cFBT?=
 =?utf-8?B?LzRHWFhncjBka1dmemtSN05CZHdDZUQ0UHRxY3RQZ3ROVzZWTG1TeVFocExD?=
 =?utf-8?B?d3h1bDIxcUhtTkVFRWZCSGZmTkk4U2VzYm8yZHpTenNzbThTMDZBQWFlaVVl?=
 =?utf-8?B?eklnNTN5OGZQNHhGWjFjZ1lYVVMrREt0c01qczdHVUdtMHpBWWdESjBnVXhL?=
 =?utf-8?B?YTROcUN3Y0trcm5vZk9ScDVoeE9GWWxpRWJMYlhFZXdVNG9HRS9OY2lyV2Vl?=
 =?utf-8?B?MndUTUxjQlIrTnJBY29zQ28zT3JPakRpUnNWYzh3bGVkb2ltVE9PY1QxanFD?=
 =?utf-8?B?aUFMRXBzY1RYSC95aEIrb0dUYjJTNEVMTjJnMnFQdVdFMTlYS0tqa1Z1M0xk?=
 =?utf-8?B?eWNHTGM0TVF6UWh5S2Y2Ump2dHdmNElKeGlqcmR5Q0xVemZRY0FTc1JJYlRt?=
 =?utf-8?B?SWh4RW5MeFpjQndKV3ozR1pFOG5lVXhaUGc2anVNRXhOdzY4dzdMSFRNK2lh?=
 =?utf-8?B?MUlTUG9CQTZIYzFRcVZPT01GSG5MbngzeStJVm9NK2pMamJSZDNiVWdDaEVs?=
 =?utf-8?B?S1E1WUZqZHl1d1JKQUVZMDN5djNWbGJZTWJlY2tWd29NZUpHeTdvdXNYZUxi?=
 =?utf-8?B?cFltZHdvdDFwd1U5Mzk0bExEQkNQc3lqbjBQZi8wT1o5akZpNXJUaGczd3FW?=
 =?utf-8?B?Ukp1ckphbFFENXdkQ2Z4a1pIU25SMk5TQU9aMWRkSklUYUsxWjQxZGZRcXdK?=
 =?utf-8?B?RTE3L0lOend6WEFSSXErS1o2N2NqU1VLYlo0N3hxRXlPNlpnR0d0K3hia0JI?=
 =?utf-8?B?aDVYZ1FyTGZBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2NvQlp6VXdLa1puMml3a3FDTmNPakJuL2U2RnFoajBuSUtrOTJkd1prZ3BF?=
 =?utf-8?B?VFNKS3BWczRuWWJVNjd1N3AxNkx4WTdGRi8vTHZLSlp3VVh4RTdhcnNZeERY?=
 =?utf-8?B?S25XaGNkTTRLaFl0T1d6SkNTZlhnQzgxVDAzWDNjTHcvZE41K1hQeDlkUEdY?=
 =?utf-8?B?SHc4bGFRelRBWnV0d2ZIeGpNS2JjMTZNMVZxT3NSbGEweDZTUzBSZlV1T3lh?=
 =?utf-8?B?akhhazkxVWpxaVh2blQxRkxrUmFSSnExQ1VCRXY0a3BTRUpiRmIySjBod3BF?=
 =?utf-8?B?TFdOVmdoTHUxTXhuKzI2MVYxNlZWaTd4U1dhNnJtakpOamNaZXU2NldXTWZv?=
 =?utf-8?B?Q2hIL0dCOXNURk9VRVhsYmhWdUU0NGRDVGRURHZ2bHF5TmZRM1RjdHNKdWpT?=
 =?utf-8?B?UUhkTjFpcEpaNi82djZnaW55UmFxQisxRFNtdjZpYm1QaE00U05ENWlIb2pQ?=
 =?utf-8?B?b0U3VDViWXUxanAzYkhPNmFlbjdSRE5VZWorN1dIekg0cXBFa0hHbEpmZmFY?=
 =?utf-8?B?NlZPaml5bk1NT3J6OXc0eDJYMExuWXEwV2poaWlVM2V1WENVSDZIWmh6Rlhh?=
 =?utf-8?B?aWY2RGVHN2JMMzF6bldhU3ZTbFJPYTlNSmtXb3o5MkpLYTFDS1R1YTVvbVhK?=
 =?utf-8?B?Z1psS0ZRYVVFR3lQaXRTWWY0YWk3ZTcyUFhJcVN5cmhMQlg0d3ZISFNDSisr?=
 =?utf-8?B?T09kTXdmNHYzV1IwL1ErbzBpVUxkWlVwM2kzUzBBT0lQVW1ud09kTnJtZnN0?=
 =?utf-8?B?UGNXbzczdkxzdC83QzhPM3FqcVBENDVhL2kwSStTOTAraFhIZGpIWnVmV1Rl?=
 =?utf-8?B?clhQZXE2RnE0em9qU1ZZY3RGd0ZCREtrbEhZUEE0R1BEN1U5NzJKaWl4REha?=
 =?utf-8?B?Zk42TGZNb1BBZFpVcGNYWGVidDltbHBrdjFvcUUvTkI5ZDM4azI1TTFnVVVX?=
 =?utf-8?B?TnBkZTkzU25RRnBRSzJjUUYwR1pyUVRGclk3ZGwxKy9peDJjT1NaQ0RnY25F?=
 =?utf-8?B?bU85NnZoM1pZVGhBQUdMdmQ2NXZNTVN6alJua1NEYTBGUW9GRVhQUTFoSXcy?=
 =?utf-8?B?TENpdjFNMC9XOGdESmRCL2RtR29WK2RuVFg4N1Fzb3pSOTd3dFdvQXplaVNy?=
 =?utf-8?B?eDEyL3M0V0VPREZ2K095TGlQdlR3aGtTaHlHNEJGVThtMytPMExZejR4VHla?=
 =?utf-8?B?SlJqRUpKTkJxUXg4NnVzQUNJc083d0gzNDFIdUhNc3VTbHpjdE5DZHpBbHQ5?=
 =?utf-8?B?d3BETHBHNm40SksxbnNjanVaUSsydEJqZm44LzZxdkVpRVFZbnFWY1h1KzRy?=
 =?utf-8?B?TitNSzZYM3FQeURqU1BodXkyRjlHcjJuZldYcnMvNkJUQW90U3lNdVVaa2c1?=
 =?utf-8?B?YXlUS3IwRFh4UDFONWMyb1RncmNpeFpVNFJRbmV6bHA5dm1OZ1FTV3UvMmFC?=
 =?utf-8?B?SXpFNFFISnpQc3AwZ3ZyYUtudG5mK1UzbjYrTjNHQ2dsZk0yc1VZWnFNZnFs?=
 =?utf-8?B?Rngxc0RKNUg4WFB5dmV2YzdRSS9sODlUYlpPNFVONXJta05iVWRZNEhhUlRM?=
 =?utf-8?B?ekF4RTcyREFJVmlZT3BHUzVBQUpOeWRJaDh0YThFZmdYeTV6VkZhczU5SzVX?=
 =?utf-8?B?UWtOUXVIYWNaVzlMMVA1NmxNT002emhTd1MwODhTZkk5WW1MK2JvRm5ha29O?=
 =?utf-8?B?R3FDZkdOSmhKT29SYzE5b1JvNUNXYXdaejVBYWthRW1kSUR6bkEwdFBaK3RU?=
 =?utf-8?B?QlJYTDVXbzdpZlZKQjd4dGhSSlZFbDNVTjBlVGdsTmQxeUZoak5NU0Y1d0hT?=
 =?utf-8?B?R2hVMnRMcDltVklzdTZRamZYSUhqc1VGMERkalFkL1NrVm9RSXF6cytoSFpK?=
 =?utf-8?B?R0NNMEI3eHZ0NTBqVUF2SDdTSHBQekwrVm9aYkU0aFJBNzk2TkxpRXB0ZXla?=
 =?utf-8?B?Y3Bqbm9YWkY1UVQzallTcHlkbWVqeE5yR2FkRHlEcmgxL3Y0OXpNNUtNbjR6?=
 =?utf-8?B?NENDaUdKQmc3dFRxamZyZW00VG5wR0ZXWElSakV2MUhGOFRRbGY1WCtuSmcy?=
 =?utf-8?B?NUNZNmFQRWRKNEY0S0RxQysvK0RKb1c5bTU0dEJNMTVJd3FVYjY5Z2lPSHlB?=
 =?utf-8?B?UmxBYThrZW1WcmNDQWgxcFo1VDJlUlBXRkRaUU1BdVhoMmVuRzlhVnR2OU1t?=
 =?utf-8?B?cTBtaE1kQTkrZHRURThXMm5uU0pWaFJEalFNK05zcjFaUDNlZUl4ZSt1OS81?=
 =?utf-8?B?WUxXbjlOdjRjSC9nMlJ2VEh1NHpmMFZqVE1TMlhveklUeXVUSVpGTU1LaDlL?=
 =?utf-8?Q?Zzl88+hnTlv6IkoXZe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa612b24-8940-4c4b-f959-08de51f9161e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 16:38:59.4528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Op8rZ2It4KZnKp3O+PtML3GN0F1HUfkw1zol3BwQfoPTNH0Te5qPXplS/oxEr8+Q5FnUbYHYS9A+O7fFH7rCtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7129

On 1/12/26 05:41, Borislav Petkov wrote:
> On Sat, Dec 20, 2025 at 03:25:46PM +0100, Julia Lawall wrote:
>> cocci warnings: (new ones prefixed by >>)
>>>> arch/x86/coco/sev/core.c:2838:12-13: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 2837)
> 
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> Date: Mon, 12 Jan 2026 12:37:49 +0100
> 
> Use the proper helper instead of an open-coded variant.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202512202235.WHPQkLZu-lkp@intel.com
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>

Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> ---
>  arch/x86/coco/sev/core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> index 379e0c09c7f3..38dad3f5f491 100644
> --- a/arch/x86/coco/sev/core.c
> +++ b/arch/x86/coco/sev/core.c
> @@ -1632,8 +1632,7 @@ void snp_msg_free(struct snp_msg_desc *mdesc)
>  	free_shared_pages(mdesc->request, sizeof(struct snp_guest_msg));
>  	iounmap((__force void __iomem *)mdesc->secrets);
>  
> -	memset(mdesc, 0, sizeof(*mdesc));
> -	kfree(mdesc);
> +	kfree_sensitive(mdesc);
>  }
>  EXPORT_SYMBOL_GPL(snp_msg_free);
>  

