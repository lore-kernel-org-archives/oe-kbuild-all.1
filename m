Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC840158535
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 04:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734408004; cv=fail; b=euymDra/0ertBsdq6ZVzzCdGrpakCMR7xKsE38uHPndKuhEtcnSY48gTo9PgZw9+No9o0R31AAM2LAdXn6hbyaLoCqQFY5whz/WAUBYxpddzl+QWA0zJHPa8xBxWpZGGguYwmaNk+WvpxMNGb+9flW+FqK/aFn7iZVrnTbzRVnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734408004; c=relaxed/simple;
	bh=siim/w5eNjJis/T8lmGsP3LghgjYYBWBaKSjnZvCxSE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LSvqvH4ElVUyLTjBEbYusAdQV8FKx9X4jj+iJnzoyjancQKKRoWN6brutFM00Z7GKdJua02myagP900lwkZtIM8b9kGFDFXnpgOkIye7l4tJB9myDdM3UvPA3yFoZJGhKnKGCB9L0P7QJp9MNBOlEQNbhUdPIaLwHrF1HMRuiaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FrG3TXyk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=D61oMmHJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FrG3TXyk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="D61oMmHJ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH1ujnD015978;
	Tue, 17 Dec 2024 04:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=f9ygTrtJ91je1btJMUhFBbctrPclFAoVmKGDRW2FhOA=; b=
	FrG3TXykBH7QkXNmAzKYHyQv3riWD1JdnziTgmlnaUyLSwv4sjA3tLaqbpdydEYu
	zS/W8bFHPyILMw0SuxBx55aaaVO3x92/rpRO0FCjMJRhJAwfH9vmzGt+Ttj6xSjI
	qnw6ifjgQXN6iD0pQ3oin13XMeFgbOc6uoAVNp+K9r4KixuDzww5x9JcFL0s7iHa
	MK+6hA8z8js/piuddrog8bQYbeeieugj84DI31bECCiVlpQZha8eTIjsbXNemThl
	oZDbrvBdcqL+IYascXNj1jdJGtxoFcIo0NyYwRPR2a865JfMg0i+FOTkpV4cezWB
	A9WTTM5BwSXbuEC26Iz+hw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43h22cn1yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 04:00:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH3iCFY035387;
	Tue, 17 Dec 2024 03:59:59 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43h0f7wm0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 03:59:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVmfxsjpEM+cGCpo10JacW9kziExkVQF5Wea64WBfkfvNYtawwPEGk2F3yOHMJF4naVOuGD3OS8/OuRgialOK2b1+GZYqG+k0xqmi3/lS4519pccOg0ChZ52Divw/CjjsagZNVX4CUit5QeMc5b8zU7YzI7QsMhS2NGSoEpZFBbQ3Xelm55+qOhzVLGvi8PXmmFdYXk8CryX5FqdEnXAPQarCA2PKb3KOJIaGU1VU0oZPpwGr+ebmg2jFzDJp3Oa8vIjlFRMMuGuInUflQ4Wh8/3cU+WhExjTUaKsBcQ+uLZ36DxoL7/i1Jk2DNeXHf62jTVE5bqU2t+nPq+jsiuSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9ygTrtJ91je1btJMUhFBbctrPclFAoVmKGDRW2FhOA=;
 b=Pwdt3qm4Al4zMlKdY6kDSy7TNk5XSHiQ1EdDez6d1yqRYGuEICtvYJFZ2w1fPJIowEtczvQnsO15pR1GcXFpC0QCxi2ra7soxNV/KB27ikqnTWJZq2THu+P4NA3dXPBCK7p0Tc4AserrtJBohwDrJt3JTVvLmIu84XX/B0ccFz7mGrrB83Kh+0spTUm4MxcNeOAQFJVosHF8NCIBzyIb4vUnCH9v1bDQUscglF+kcXzWABSw6tNOho5loVb1Emn7IEVU4+ofqJFhsm5GsptbAS+plLZsF69zVRH5owNq/bQ6ZpLOklEBjbjJdccX4V2Nou+pdSbwbGY1TlKPYt19eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9ygTrtJ91je1btJMUhFBbctrPclFAoVmKGDRW2FhOA=;
 b=D61oMmHJ/79HKpb6SJsFqIgkyCVHfU21fH0W6pTvxJO7Ku7LBp0ro04mfC4UqfEjm0iMcu3V/dqSLMpXYjbokRHxU3y0P+g6BpdTpoMSen3WTv0DWjzLRyn5A+CbBonlztu8KtlByXNZ16cfJO7fluIQQNMkd4GMAl7XJLhESaI=
Received: from PH0PR10MB5706.namprd10.prod.outlook.com (2603:10b6:510:148::10)
 by MN6PR10MB8045.namprd10.prod.outlook.com (2603:10b6:208:4fb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 03:59:51 +0000
Received: from PH0PR10MB5706.namprd10.prod.outlook.com
 ([fe80::fea:df00:2d94:cb65]) by PH0PR10MB5706.namprd10.prod.outlook.com
 ([fe80::fea:df00:2d94:cb65%2]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 03:59:51 +0000
Message-ID: <7f19ce16-f016-44fd-8f5b-d54b5740b318@oracle.com>
Date: Tue, 17 Dec 2024 09:29:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3606/4379] fs/btrfs/super.c:2482
 btrfs_print_mod_info() warn: inconsistent indenting
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
References: <202412170215.uLhijGQD-lkp@intel.com>
Content-Language: en-US
From: Anand Jain <anand.jain@oracle.com>
In-Reply-To: <202412170215.uLhijGQD-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::31) To PH0PR10MB5706.namprd10.prod.outlook.com
 (2603:10b6:510:148::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5706:EE_|MN6PR10MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff80851-dd95-416f-f18d-08dd1e4f41f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b3RLRXZTeFFPdXE5cnYvK0EwRFNxc21UWjhWWFRycVhuZyt0dFgxQmtYSHBh?=
 =?utf-8?B?UWtvQWtOREtQekFnNnRpdkExTFZMUFQxc1FaWEN5czU1MU5SOWNqUlp1Z0Jh?=
 =?utf-8?B?SFBHVjVmNDdkeWpuODNZQkZRcWNxY1hWKzlac0FMWklXTmFRZ005WWJMOUwv?=
 =?utf-8?B?NEs3bXBFanNId0F3MWFFK1J6d3RiZy9TbU1kVkZ4a1FhWlU3MmFpcWF5ejRi?=
 =?utf-8?B?NXA0RUJGTm5vR25hNnJNTGtKdHI5dFRPdEN5anBpUHozUm5IVXBpZm5CcEZP?=
 =?utf-8?B?eUt0MWxJNXh2VEFxOGh5UjFrVnBOZWxIR1N3MThzR0ZHd1QwR1phZFNNNlcv?=
 =?utf-8?B?TVBDaXlkdVBWUEloR0lzMWVsOUJJSk1TWkxJNTM3MmZjS0p0Ym5zcDFGUjVY?=
 =?utf-8?B?b05QNkVmZUpWaWJYc0VoR3JMZHY0TW1OdFRzUzlVTlBNeHNSL0dxUHNoeklR?=
 =?utf-8?B?UEZZa1loQjN3akM1dFpzSDgvd1cycmNRM0xkdDFzMHhIVk0xNUphbEgrTkRE?=
 =?utf-8?B?TkFNTG1IS205MGVqUVVSRjNQeVo0c3M2QVZ1UnN5MUhlbkpMeURJZnk1UC9z?=
 =?utf-8?B?MURudktaakVBd3RGaFRqYThQRjFIY0Y0ZkJWcXVvbDBPcDFuMDhPdjdMOTIy?=
 =?utf-8?B?MXowL2NHVTdSYkZ4bXF5NmhoZXlnVTRyS0hJVC9mSVkzRDJRWGdaZlpoR1lu?=
 =?utf-8?B?alEweXdaeU5VUE5YeWNQUG5BaU1jblBXT0l2WkxKRVdqemZLZldIUFFaOWRT?=
 =?utf-8?B?TVgrcU1obkt4R1VTTTNnaWw3ZU0zb1hCNmVWZXljOGd6MGdPdC92WVl5TXhw?=
 =?utf-8?B?a09kU3VBczU5MWxUOTdNU2hzNHpLT2xRMHNnYzEzWGRza3pDTkl4THBWdDBW?=
 =?utf-8?B?a1Y3OVZvcUhPd21BY0hIQ3FIbkdqdXJmb2ZpVk1NcWdoWDZMVWNSdnBTRS9h?=
 =?utf-8?B?MkMrLzVQNVhiTVBWNlFqOUl4cVFDVU5KY2w4QXZJdmFyYUczYzVKUWdCVWFO?=
 =?utf-8?B?c2NDL3d1YXlOS3FFT1g5VmU5aU95RjJ1MHprZmg1ZzdvcHpZdkpVd0Z2SGRz?=
 =?utf-8?B?T3JIN3c3SUxoV0prRmYxL251d3dTak45cXpFSitGOXhOOUdSU0FJVVpwRXJk?=
 =?utf-8?B?cFJ5ZEpyRUs0Nk4zU0hNL3NVVVhZbVRxSm1MNCtCNXZpa3VZK1dET1ZIeENq?=
 =?utf-8?B?angrd2ZrU0NkMHZjS2F0cUVjZHBQRzRJWEFpSkswZWdlU3Z4YUQzMkZLWmpC?=
 =?utf-8?B?bmphMFRuN1BXQlY0eCtXQVJ0TFQrYWg0WFRVNERsbk9nKzZuWmh5a3FGT0ZP?=
 =?utf-8?B?WnhwdDFWUDh2c2FsTnVIazZOZUpSSDdYOFVYRkZDZHJkek41VUhPMHVOUDI1?=
 =?utf-8?B?aEtSeGRyaTZzNjlLNkIxOTRWY1BaZmhDcDczMmhWMHc0Zlo2dXBTWDA5aWN0?=
 =?utf-8?B?eHBMNFZTckpZOThpS1dkQmJqNGQrU1JCcDZKME5nWDlEWnA3L2FTVHNVWDVF?=
 =?utf-8?B?VnNuZU4rd3Z6U1MzUjdaa1J0SVl3a2pjWjFEaVBDLzhYNTdLcUo5QUc1YVVL?=
 =?utf-8?B?QzlwN0E4MC9CRk9XOG9KSFIyQTRudm1heGZkRTNDeTdPaUQvektRL25Tb2M1?=
 =?utf-8?B?YUJIN0JEY3ZHWTZyME85a2kzaUoxRytoT2k4cDZZL0xVSjhlc0FZbEgwTWI2?=
 =?utf-8?B?RVBOR1VqQ2J4Wkx0Uk9XTU9JbUZLUW9INHdXTXRtblhvUkpNT3czVUc5TFd6?=
 =?utf-8?B?OEo3anNncW1jMktjVk1kYitaUkViaURoVWJOSU5nVXdvMWhLRXFLTXEyc2U0?=
 =?utf-8?B?TnlYYlBiTlUzYU03TGJ2Zz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5706.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmM2ZXhjS29hc0ZpRHFwTUpTL2ZUNU9WSmlPemVWQWFHMndJTU8xenl3akdu?=
 =?utf-8?B?U1llbVIzajMzZ0F2YmR1Nm1Dak1JK25Ydno3ajlFb0I2SjFCVlAyUHltWmg5?=
 =?utf-8?B?T3RsakZOWkU3ck52QVdBS2RRQTdOSVUyWXVBTk5BdlU4TXkzMG40UUJERDBG?=
 =?utf-8?B?Tjl2eENENFByM09waFVYNURrQUhNOThCNlJSQzZGazdGZFJQampKZDg4UkZo?=
 =?utf-8?B?clM3UHRoZXppZURTQXRYZzVCR25PeGRCUi9JK0IvTjExL2NPY2FGVTRVOVdI?=
 =?utf-8?B?ZVRMMkNGVnprUVFnYjFaMGMrWUM0SS9VdmFLaVRJeDRhMTZxOWFrU2hONFBj?=
 =?utf-8?B?QkhnWXNrQVBJVm5taEx1S1BSTXVKWHNkWGMrU3RKU0tOaWVpUEl5ZTFNZ0FG?=
 =?utf-8?B?d21BUGFpSVhQVnZKZUk5cWdtUE5uRjVVdU5RKytKVUltbHg2TDdOdm41SXN5?=
 =?utf-8?B?QThFRHlHb3RqbHlvOUhGbzJrMndSMkFCSUhVUDJ6NkF2NjJXcERlWkQ0OW1r?=
 =?utf-8?B?YnczcEtCdTA1aldqL1pLb0R2aERKRlNNSGlPcjROZTVIUURkUUw3Y05uWEUz?=
 =?utf-8?B?b2VYa1NYU2NYRE9wMnJobGIwQVVCaGduZ2FSSVlOdFRuWUgzakNhZGdnb3BB?=
 =?utf-8?B?SXR1VmNwSXR0eDFVdVNabHZmTFFBMlZLSm5BSlREWGJQMWdzQ2dKTWlUUU9I?=
 =?utf-8?B?YWE5T0lGS2JLajlmUHhITklFK1I5V0xWK0N5amdDQlRGTzQyTlRGT1lPMnUy?=
 =?utf-8?B?VDJrcnhCeG14OUtFU0x0cG4zQ3FacU92ZFQ4dU9BR3JpQjR3RDlVUXdHOU1u?=
 =?utf-8?B?OElsSlZmbzc3bjNiR2U2TW40U0M3WE9LeEo3WE0xUFBRbGxEcElxN01CT3k5?=
 =?utf-8?B?Y2dicEMvN1Zac0R5WmJQcTdPTVQ3dGpaeEZ4YWlLYjQyM01BZlpOQXlkSkhH?=
 =?utf-8?B?dmViekVEdmlQM1dhblpzWkZQUnVJck1PdE1sVFBRRFFFOEJ2MzVPc2Y3Q2dy?=
 =?utf-8?B?U2ZqWFhFY0JDMjh4bWFiaDlEVW0rc1NqdjBLYXFZWUJzbWdaSVk5SzI0UGFt?=
 =?utf-8?B?ZjJydktqK0wyZU9uV2xqanZUcm1pZFBSS050RGV4TE5NSHpxR1dIMFhWM09Y?=
 =?utf-8?B?bUx3SEpPUXY0czViQTlEcHpJWk5JSDd0WmdqNGhZREwrZnlYcGRNM0lobmZG?=
 =?utf-8?B?SjByUWVkZC8ybFhIZUI5SGZtWUpaRGhrOW9ENkx4ZHBaR2FESXo0OHRDa0Ni?=
 =?utf-8?B?czdZRXd4ODlQUVBpTjhkRFVFYkgvZHU2aGx0VXFlNUdMNEg5a1hORHhuRHNM?=
 =?utf-8?B?cjNhL3ZEVDVVV013M2REalhBcTVzTk9xUUNib0pPQjNFbFNkN2dGK2lCSHVL?=
 =?utf-8?B?TXg0ZCtJd3hONi9uQ2VlcXB4cWZ0QXZnZ2FxUlZBVjBHZTVxYWZrSi9lMitX?=
 =?utf-8?B?eEV4bUZGR0t6bGMzMTNHUEp5WHROdUpoVDRqZHhHczY2YkNFc1pTZnVpOUtL?=
 =?utf-8?B?Y3l1N0RwMzVUZ2pHSk1NUlRFVGsvTyt3Uk1MYnZpcWRSMHIwQVFDMzNLUHFL?=
 =?utf-8?B?Um1LcVFtRUZJcXNOdVNldzBEUDB3WUNMaXM0c1FZQzJCa3JGR1VCaWJRRUk0?=
 =?utf-8?B?WVlLOTBCdC9pbXRjWkhGWnptR3dCNmpWeFQ1REZLcTJ5dUFRNXF0aFZod1Rr?=
 =?utf-8?B?L0M0K2hMcTJDY0hKZExiRmQzVGlWdThIejdpQXUwMXhkZjhBSGV5WklXSk9E?=
 =?utf-8?B?NW5IYWd6REVKNDhVT3dvNityZ2RJSkM3R3pMa3lzTW9BdFI4QmtSZXBtS3Rx?=
 =?utf-8?B?dHFVVFFwQXY5VUlFdVVpeXBtbUN6Q2FER1JTUkdFNW5tVmNseTVuTkQ4Nk4r?=
 =?utf-8?B?Z21rSVN6QmU4cmoyQU4rekwwcEI5eHdoeDNib0Z5TmZYRlExbVB0U0RlWUkz?=
 =?utf-8?B?alZ1bXpPMnM2dTV3MWpYZXFKOG9sREZRY2pNSFliK3dsalJUcmFoQS9SNk9n?=
 =?utf-8?B?QWpkY1hEeW0vRHJUeWVLOEd3MHI4VjM0cEJKRGh2ei9MN0gwclRjeko4NDA5?=
 =?utf-8?B?OXQ0SEp2MVo4OXFMc1lBVW5iM0hGT2tkdGpkUmloSEYrV0IvR0dPVU5NQ0F6?=
 =?utf-8?B?SVBjR0JQL0hQUlZOYmJwUVJjdVpmS1V6VGZ0SUU1VVRIY1BhR202NFdVQVVy?=
 =?utf-8?B?b0lXRncxZXFwdytwaDVnVWkvbFQxUDlHTWRnRHA4aDZxL3dMTi9VVUFoWEVk?=
 =?utf-8?B?RUszTEpwZHRuWFpOMVpVY1pZd2lBPT0=?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hm+TllNFVOTWoME3s4mMkLoV8bhCo+tlDNgCOzzq8nNvQyn5v7yGJYDOqklOE6Z/3qe4mmMpdCzE/ElpgYjH6usIWkqZ0TtVw4oGnw632yPt3NlN+hgmZp0NEUkqtYkNS4D349AGhyEVzPVKjoPA6Miy2hN8NvxM4Of7F/WUtNhXcaLH9zAwHE45UeHTAsp31DDZvmD3A5dqE0LMPAnfSleQq3Ubxsvqqct2ujSqR0skTxL8KpR/KCnGH9hjksJQyL6eDWLMarRj7yJbNvug/NVo6bX8hIgaA4jpiJXL68QDaqnbx8k3iPqFeFZEpT9u/001q3KuExYwH7VuoTBzIek9OaIy955mUOR4sit8J8K9GORTWtkzDk6LukimBazFYpWYTSTpGy8Lel1731fznhqk0zE5RE5sr380kAqjQorIQoOYsMTJP+mVTVAbUYeG9hDzDL9r44iRo7vaDT/VEAvFWJxnoHQvIjtg+yz+aNdFf1azriTFdUucXWQ0g++C+DVi8rhprDunFqyRklPkfNjhLwHysdgK4l5KwDP3uTvyxXKSy13+EFUgKoeaOefVMErmpSDJn2LmZ44VO+PtgwnbVEnpmS0mt2mfIxNmFhE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff80851-dd95-416f-f18d-08dd1e4f41f3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5706.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 03:59:51.7711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSNpVer/z/yuXVS30iK2XsdUuo0uOERrCHkcv9qq49fkN0jwqzWwrM8lAAuEpzzBjtByYoUBn8G1sNcHf3FvPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8045
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-16_10,2024-12-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2412170030
X-Proofpoint-GUID: 6gBOovpXkz67R_PvdsMgekKhvzFmSJ1q
X-Proofpoint-ORIG-GUID: 6gBOovpXkz67R_PvdsMgekKhvzFmSJ1q


Thanks for the report.

Fixed in

https://lore.kernel.org/linux-btrfs/cover.1734370092.git.anand.jain@oracle.com/T/#mb80a020c62bdf298bae160937a1db9e84a416d5e

-Anand


On 17/12/24 00:36, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e25c8d66f6786300b680866c0e0139981273feba
> commit: 286dd5a60b7114fb8fdcabdccd01598161f67d83 [3606/4379] btrfs: modload to print RAID1 balancing status
> config: i386-randconfig-141-20241216 (https://download.01.org/0day-ci/archive/20241217/202412170215.uLhijGQD-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412170215.uLhijGQD-lkp@intel.com/
> 
> smatch warnings:
> fs/btrfs/super.c:2482 btrfs_print_mod_info() warn: inconsistent indenting
> 
> vim +2482 fs/btrfs/super.c
> 
>    2445	
>    2446	static int __init btrfs_print_mod_info(void)
>    2447	{
>    2448		static const char options[] = ""
>    2449	#ifdef CONFIG_BTRFS_DEBUG
>    2450				", debug=on"
>    2451	#endif
>    2452	#ifdef CONFIG_BTRFS_ASSERT
>    2453				", assert=on"
>    2454	#endif
>    2455	#ifdef CONFIG_BTRFS_FS_REF_VERIFY
>    2456				", ref-verify=on"
>    2457	#endif
>    2458	#ifdef CONFIG_BLK_DEV_ZONED
>    2459				", zoned=yes"
>    2460	#else
>    2461				", zoned=no"
>    2462	#endif
>    2463	#ifdef CONFIG_FS_VERITY
>    2464				", fsverity=yes"
>    2465	#else
>    2466				", fsverity=no"
>    2467	#endif
>    2468	#ifdef CONFIG_BTRFS_EXPERIMENTAL
>    2469				", experimental=yes"
>    2470	#else
>    2471				", experimental=no"
>    2472	#endif
>    2473				;
>    2474	
>    2475	#ifdef CONFIG_BTRFS_EXPERIMENTAL
>    2476		if (btrfs_get_raid1_balancing() == NULL)
>    2477			pr_info("Btrfs loaded%s\n", options);
>    2478		else
>    2479			pr_info("Btrfs loaded%s, raid1_balancing=%s\n",
>    2480				 options, btrfs_get_raid1_balancing());
>    2481	#else
>> 2482			pr_info("Btrfs loaded%s\n", options);
>    2483	#endif
>    2484	
>    2485		return 0;
>    2486	}
>    2487	
> 

