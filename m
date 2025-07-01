Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE363596B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751392606; cv=fail; b=s+i0GW8EKTZa10qD21Y7Id8cTHEqM2eMD4ln+MNpmjIz+mWtlcmX5dULX7LqZ/jBgaxnhGuNA77qNY2GGN6ptpiHMMzdpLU92ooMtyN+o8mjj1z3kj05UkSfGrIaLL/hzMNP2cjyqKy9QAb/Vfp2mX9B/9L0h9uhIFRuk1H/SJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751392606; c=relaxed/simple;
	bh=oPwwporD03znDuvPz3kohib8QI0+7SH6nOwwy+3ddsQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nQI8gTd4HcWjY+MgVTtRbcSzOSLHPr9LnRS+AUC/PX3axszObn6Kj4p0I9gu0DgMrl6YoUjiZFW+s9GNENQCCIpXSO1lc+1EXy45AddwV6Jp+MNqOF1GON4Z+Y6QjygXLwYchVwdM802qQjZlQBXQh8/7fWTbfANCaAfBBEoDxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Or0XO9JN; arc=fail smtp.client-ip=40.107.93.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Or0XO9JN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJudLIJ5eAmnngIouh30r8oqE+DYvcs70uarmCTqVLiWGGUgQEBiro5bt6TcML1b8KzhvZkhZboYAY6DZsjavtKmR0hRQ1GGBgBuIthKygtIlC+y74Jh1a4sGhk12kd0xFBZ+Hlx+eUC47h33KK23gxoxsgN/lXDRtsqNyy58i+4Z0uzM+Hd2Djt8P7xW1/6eY1rtXtD8NS8wh/7035lWEmC1K+Ydc8Pv9ynoLDtBgNbh2aTNexYTCLyngWEX49EAY+N08aDxJvXmdkv3t09C9fRaIbkOMKdczXiCF90wDFjb0f17qMCqW0ipTsmJxUHOJuROW/sn1Q8np7H4yAtrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UImhUBpy9YruoM2cdEKx/UMX+4GxT5edX5X9Jz8UzsY=;
 b=sv2/HkbokvUI+548eQgXqG4JCLTeP472crFMvubWcpDV+00TZgHaJviWNqaQMdFRhWiazAq0lqB7gHY23Le/R7oA2yldRnOnhUd0cpAGvkIOQXEo2AaHdx9CnRjP4fjayadtz3NAQ4jLkZulgIA7ZFSA0xHzADndU8cqxYZj605g+qTsF+UPKRNW0WrAwSBmt2HcRwjTdyaYNX5npSg2t3dQiWgwkLNd+aRGh5oU8mer9guA1HIix/nO1XRswX094nKTn01ACfTL5MTSz6I+U/U3U/158kgHmuBs48WLrSifnf+B8mhkrNd1rYwxJtGsdUpHypm++gZJwTVE3HhyGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UImhUBpy9YruoM2cdEKx/UMX+4GxT5edX5X9Jz8UzsY=;
 b=Or0XO9JNerqTKuMbxxWSRf4xLFfqvuRYEFV29LdAvgQ9jQ36QPrMckb6r6zZLjHittxh+SuaBlPwRq2FKQ/swNskC+v0nX9IMAue1s3MNecTwnUFFHMdkYWAVMp6dQ/cGUEMzHnfkzQmGXLy0mrpldEF/L0uM+K9NPOAz0onbk5B499SOiI5MTZIsEprX+qYSF8hfYMeSGwg3pvvlAnNy0WfsQetpaARtthZGkUqQZuad69R6v883tCPbUllY03fKwYThBFYs6Dg3LCBx6g8tyQdCWtnpWDMjgGJ1eYf0V9F+8NhCcwhP7X/bf2rgw8RUhktuQN4VXIRA6rBWJpoSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 17:56:34 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%4]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 17:56:34 +0000
Message-ID: <03c57ca0-200d-407a-a0da-43137c9eda3f@nvidia.com>
Date: Tue, 1 Jul 2025 10:56:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [jfern:nova/master 72/87] Diff in
 drivers/gpu/nova-core/debugfs.rs at line 1:
To: kernel test robot <lkp@intel.com>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <202507020022.CTF71Rpm-lkp@intel.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <202507020022.CTF71Rpm-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|PH7PR12MB5685:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d5b801-91b6-42b5-5fba-08ddb8c89e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OG9qN3NaOGRTdGJ3Y2hGa3RoZjJNLzhxcUVseWFoUnFHZFBNdlk1bGpUYk9G?=
 =?utf-8?B?MDhuZVdJWDlrTkcxSzIwUkFxdHJOdzZzeHRZTmxFL1NjTFg3NUIvT09MWU5G?=
 =?utf-8?B?YjdURHVua1BocXNsQUR3aC9vUERlaEt5TnM3elB0TEZkZUgxU2daeUNwMHdD?=
 =?utf-8?B?RHA0eWcwY2xsVlFzQUpvSml0OUdqaDlQQXFHTUthRFZIc3Y2V3dMZXlrcURC?=
 =?utf-8?B?RW5VUCtWT2t1WXpFK1BRQmFBZ0VZampsaGlXS05vemo3VjF1TE5oRjJuTkVV?=
 =?utf-8?B?YTlpQ0llMlhyU1lhdXF2MzFGQ2hNamY1VFNiRkRXejZiQlRubVFMaGNPZlox?=
 =?utf-8?B?ZERmcHdXQ0l1OWpXR3FPQTM0VzJhbXkxc1hDcENRdEVnSmQvWXBtZFIvangz?=
 =?utf-8?B?SEpnOFovVitrNXhTbzl3VUdEZWtFMXFVdkJlUWhhUmRFc2thajNnRi9lVnNP?=
 =?utf-8?B?cW1Bcm4xUFhRdnlWUDIraVcybkVuL2N5KytseEFwdDRmUnpCMk9WQmRBODVC?=
 =?utf-8?B?amJ6bXhxY3ppSkpxY29CSDB4b3c1MGx0Z1UzU2d3UDMvV3ZPbndDdjNmaytS?=
 =?utf-8?B?c3EzZmZScElnelJMM3V4RnN1eEFwMUNnb2c5R2trdFp4ZHBYaWhqcFhUTysv?=
 =?utf-8?B?SVl0NE5BZlZPUkkyQ003VUFMaEdNUi9lQ3hmeWppYVl3QWdBT3RuL09Cd0xZ?=
 =?utf-8?B?OUpURHBFMUFNdDlFZFZwbXpYdGl3aHFqcld4VGlmUHFrbkZwQ3hEMGpCOXJN?=
 =?utf-8?B?YWpLbGFjbTlCa28vcHZFSXpMVjd2cGE3QmhINC9WZEpYekdqamlyUCtwa2Nq?=
 =?utf-8?B?S1VaZ3B5WDZ5a2NSMHgvNWRJVXQ1a0lxbm5kSFRyZTk5OW1saEhLdTl2cVZn?=
 =?utf-8?B?L0tmYVloYnJQdWp0aGhpQnEyQTJSZU5ud2l2b1hBL2dXSEgrN3hmVTBrNWZC?=
 =?utf-8?B?MTBaSUU5R2ppdlVOVTB6VG9NNUFQQ1R0Z2MxaW16RFJVQWE1QXYyNU41a1dh?=
 =?utf-8?B?Z1dDQkc0aFEwU3pYclRQdGlOdnlJWERLa1BsV1c3T2dWVWdDNEZ1dDJPTGl2?=
 =?utf-8?B?Qm5Oekc1OU1XMVRsWUFzR25FUnZ3RG0zbXUyRGY1dll2TnNqNUU3SXZ2bEtB?=
 =?utf-8?B?M29wWmdJWXdhSGd0N1c0UXRQc0IwcjBUc3EzMHMwSVc3Z3VrNUpIWkMrMll0?=
 =?utf-8?B?VmFsWkJhMHUzU3ZNNDNCMHlxSmdKRnM1Q2xsWVpYcno0L3hOUWRSWWdRaDFX?=
 =?utf-8?B?RFpKMVFpM3VGV2UrOFVsUzMwakNsejNSdTVZSHMzTmlreUxmMEphL0ZCWW9Y?=
 =?utf-8?B?N2tRMXhjTy8rODlkRFNZTTNITWFvd29iZk01NERhcXpNcDRKYVRFN2xobEVN?=
 =?utf-8?B?RmNpTkJta2MyT2hEbXZrQ2JTMlhCRExRbFlTQUpZTzRnREJNUm1RQ0V1L3Jw?=
 =?utf-8?B?aGhuZnlkbEl1eXJ1QjR1OFhHcFhOenF4UC9yRVhTQVpnTmNkRWxZVFJNVXNq?=
 =?utf-8?B?YXowTllKWHFpZUlhSERHMHVoOWVJWjVqMW5CREVrN2pkUTFLam9TL1cyT3h4?=
 =?utf-8?B?ZmlJOXVsM0p0M3kwWTBmOVJ1VjBNZmpmYUJTcnpDeVFKSGIwUWVKUGxDR05k?=
 =?utf-8?B?TjVKSEhLR08wSVJsNXFQSk5YRXoxWFdhOEh4Y0taZ2JrZTdtUW1GOEZ2VjY1?=
 =?utf-8?B?VytpMkY2aHArbTFEQVZpdURLd0JFTGQ5bnV3YW45R0swbUtWSDVXdmxQVjYw?=
 =?utf-8?B?VUJ0VnR5U2NUQVFFZUhOeWFHOGg5clkxZUFXbUxGb3VuNUp2YnBNeERUOTd6?=
 =?utf-8?B?WEhIbjBHWWx3TDlzWmFIZlRqdld5R2w5OFlCcG1rbGZQUFNSUEtVVEZ3VW1Y?=
 =?utf-8?Q?7Od7gQ6AnqB/M?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjBwdVorZm8xeitkaUdRZjJXYU1odktWNXk5STNVbEVacXJkMVlNei9UOTVS?=
 =?utf-8?B?SStIZ2lESisrcmF3MSttRzdIaXo2bFM0Y2xaUGd6cVl5V20rRlhQZTE3NlZR?=
 =?utf-8?B?enBrWk1tbEp1bVhtRjR5aDA2d0lIUXprQWpvY3ZwK1lVWG1VV1U2WHZjV2pT?=
 =?utf-8?B?dG03ZGtBRHV5VUFPZGZQUS9mMDVORitSbEdXNmhrNk9pRHZLdzFRTzFkU1la?=
 =?utf-8?B?dC9EWVdBWFNjTWM2K0VuL25XUk9WU1NQRVVvUVJBVmRETG81cGRvVTRCK2Zw?=
 =?utf-8?B?VkUxVXdRdXRicERFZGtBVm1lZ2xIdnJtZzBlVFd3TW9zaGczdVhhRXBPZk9U?=
 =?utf-8?B?RERwckpSZWcrN3RFNjh6SkhzZkxydzVFVytWZllGNFl6K05DVXZTYVFEcnEy?=
 =?utf-8?B?bG03L2E0MllNM2sxSWJQVkswV1pIYnlMWllFMmsrRjltNkVuUlI3UEZMTGtK?=
 =?utf-8?B?aGxReURGS1k1OEd6Slg0MkRCZjhlNzNUN1JxZmtHMU1lSFgrWVdqYTgwaXlM?=
 =?utf-8?B?RTRWV0hTNGlWUFZXRmhyTlFXdWFUdzQzaVNOcFdvVmJ4Rk1jRmJqaVY2UlJN?=
 =?utf-8?B?SlkvV2VRWER0YkRsU3A4bGFWQVdwWXFRd1ErYUFJVGhud0ExdkNRUCttR1VH?=
 =?utf-8?B?MlMzZHpFTURsTTVPSjJoVFhQL3hrUXU1ZjMwQURiTlZZMVpYaFpDN0ZmNlFq?=
 =?utf-8?B?VTByakRyQ05RNlhFTnVvQ3ZleEhXbWVCVzViSjh4SUZXTkVreWtjOWFnT2F6?=
 =?utf-8?B?UUtQUGZPYmNOTmd0NTh0dmdIL3BBbjhtQjZUQUJGV1RNYUFLTmxvczdvbTdD?=
 =?utf-8?B?akx2eDhmMjdxWE9hSzF4QVVoSk04WWRZREl1RWc4NUthRnppNHB0Ky9Hc1Yv?=
 =?utf-8?B?ZUtNUjhVVUM5TXp5VnBVYnJvd01SeERzbDltRk5US2J0WmlodW1SMTNnajBr?=
 =?utf-8?B?MTlLWDgxSjhsQlRYd3R4cFFJRmlYbzZ6SjI0aWE0ZUlKSHBva1pIUThNS1J0?=
 =?utf-8?B?ZHA0TVRJWXZBc3lCMHdrTTFzNWJvdlpSalJCOXdvMGk5VWdxMytkcVgyd1Ns?=
 =?utf-8?B?eVFqbmlXTmRQR1UxSkN0eVVsY1JYTUNCVThYOGV0UUtFUW1yVnovMXFLV0pm?=
 =?utf-8?B?MDhLYTZxa0V5ZFBsOVpBQ0JZVFg0b3ZtZy90aGVvcm1HRXZMTitzcWU4b1pU?=
 =?utf-8?B?S3dCQTVjQ29CWkRzOXZvdE9PV056bDdMMk5mVHVpa1lWdENITHB2U2swZnUr?=
 =?utf-8?B?RDdzQ3lFRkZIMFJHdENaS2ErV0JVK1ZNZ0dQWUVQeWhsUmlGMVBXbWFJTlQz?=
 =?utf-8?B?TnRnVEJMOHgyaU9WbkdSalFjbENWUWM4OG5qSGhPUEtYc0ZkcEgydWRjd0pz?=
 =?utf-8?B?akR5dWZPSnNleVVqOGZ3dnFReDdSYmloL3RndlNLU1J2bDRaSUdLU213c25z?=
 =?utf-8?B?SWprR01TU2dnTU9wcDFLMXVKSEVYdUJyaXFERnUxa3I5REJmR0NLSUx3QXlQ?=
 =?utf-8?B?NUtvblZ5d1UrcFBxMHhQSFdRb3VsWE9tbTY4QzJTQ3FKdlU3MkI3dkl1cjhD?=
 =?utf-8?B?MHNCY0tMNTRDdmtjNUEvd3hsQ2VoR0tKN2VlMnRLUitQRzlZUnJHaVF5QWsx?=
 =?utf-8?B?Z3hiT1hCRGl1Q0xyRGpFMFpadlpmeFIySzloMENmZW1FY1JERjBwQnZRUXF5?=
 =?utf-8?B?Wm1YL2RpN0tWUy9QTFRDT1d1VFNtVDl3SHV3Wjc3bjZDOGhQcXBpdkR4Sndr?=
 =?utf-8?B?RzZXTGZJSEZrbmZubFFMc1NtQm9GeStnNmxmQTZZMDBYbnRvYXNCYVZFSS9R?=
 =?utf-8?B?S28rTGFtK1JVT0pCemk2RnB4OVBBUldaOW4wK0k0V05FSXFZRE5wRG82bmI2?=
 =?utf-8?B?UHNiamlLcU5lYjN4Tm9WZVc1RlcwTjBXMVB1YUdYS3dHejVZQWRPeGNmOVps?=
 =?utf-8?B?SSt4WFAyZ0I5Z1lXSEI0ZnNnSlJPWG4zYnhhdHFVa0xibGwvOE9TOXY5REh2?=
 =?utf-8?B?ZExFK09jOW5qUmM2MitQbGttSC9VNGFCbG9wdjZURlR1N0dJVFBJSmJycmVr?=
 =?utf-8?B?MXk1SjZjSUZWR1VhSDBiTlRVWFVrMU9wSGMycWxzNnZXa3U1WnM4Zyt1Rld3?=
 =?utf-8?Q?7gQyCkctFHTnVrHcMeRtXIqUF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d5b801-91b6-42b5-5fba-08ddb8c89e1a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 17:56:34.3366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4KVX3njPSnMQREatwgvLRW7tl4s5x6yS1+iRPYI/puZaUhmyEOCM0dtse9DiMl+2Yys0VEKodRhgzDGMzIdIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5685

On 7/1/25 9:14 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/master
> head:   dfa2b234298399a62d48d2a78ce8f3f58d21cda1
> commit: 70794f2c1436933de0355b0bc0eb6faf16e968f8 [72/87] DEBUG: nova-core: debugfs support to dump logrm, logintr, loginit

Hi Joel,

I've forgotten, but did you submit this and its related patches,
directly to the kernel test robot? Otherwise I'm wondering how
this was launched. Just curious.

I also noticed that the patch title (subject line) should be
tweaked, in order to have the right hierarchy, to:

     nova-core: debugfs support to dump logrm, logintr, loginit

...and if this is not a keeper, then maybe put "DEBUG" in there,
somewhere well after the "nova-core: " prefix.

thanks,
John Hubbard

> config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250702/202507020022.CTF71Rpm-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020022.CTF71Rpm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507020022.CTF71Rpm-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     PATH=/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>     INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-18/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
>     /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j28 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck
>     make: Entering directory '/kbuild/src/consumer'
>     make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
>     Diff in drivers/gpu/nova-core/regs.rs at line 204:
>          31:0    value as u32;
>      });
>      
>     -
>      // Used to store version information about the firmware running
>      // on the Falcon processor.
>      register!(NV_PFALCON_FALCON_OS @ +0x00000080 {
>     Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 1:
>      // SPDX-License-Identifier: GPL-2.0
>      
>     -use kernel::time::Delta;
>      use kernel::prelude::*;
>     +use kernel::time::Delta;
>      
>      use crate::{
>          driver::Bar0,
>     Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 27:
>          }
>      
>          /// Function to check if GSP reload/resume has completed during the boot process.
>     -    pub(crate) fn check_reload_completed(
>     -        &self,
>     -        bar: &Bar0,
>     -        timeout: Delta,
>     -    ) -> Result<bool> {
>     +    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
>              wait_on(timeout, || {
>                  let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
>                  if val.boot_stage_3_handoff() {
>>> Diff in drivers/gpu/nova-core/debugfs.rs at line 1:
>     -use kernel::prelude::*;
>     -use kernel::{error::to_result, c_str};
>     +use crate::gsp::GspSharedMemObjects;
>      use core::ffi::c_void;
>      use core::ptr;
>     -use crate::gsp::GspSharedMemObjects;
>     +use kernel::prelude::*;
>     +use kernel::{c_str, error::to_result};
>      
>      extern "C" {
>          fn nova_debugfs_create(name: *const i8) -> *mut c_void;
>     Diff in drivers/gpu/nova-core/debugfs.rs at line 32:
>      impl NovaDebugfs {
>          pub(crate) fn new(name: &str) -> Result<Self> {
>              let name_cstr = kernel::str::CString::try_from_fmt(fmt!("{}", name))?;
>     -
>     +
>              let ptr = unsafe { nova_debugfs_create(name_cstr.as_char_ptr() as *const i8) };
>     -
>     +
>              if ptr.is_null() {
>                  return Err(ENOMEM);
>              }
>     Diff in drivers/gpu/nova-core/debugfs.rs at line 41:
>     -
>     -        let loginit_info = KBox::new(NovaLogBufferInfo {
>     -            name: c_str!("LOGINIT").as_char_ptr() as *const i8,
>     -            data: ptr::null_mut(),
>     -            size: 0,
>     -        }, GFP_KERNEL)?;
>     -
>     -        let logintr_info = KBox::new(NovaLogBufferInfo {
>     -            name: c_str!("LOGINTR").as_char_ptr() as *const i8,
>     -            data: ptr::null_mut(),
>     -            size: 0,
>     -        }, GFP_KERNEL)?;
>     -
>     -        let logrm_info = KBox::new(NovaLogBufferInfo {
>     -            name: c_str!("LOGRM").as_char_ptr() as *const i8,
>     -            data: ptr::null_mut(),
>     -            size: 0,
>     -        }, GFP_KERNEL)?;
>     -
>     +
>     +        let loginit_info = KBox::new(
>     +            NovaLogBufferInfo {
>     +                name: c_str!("LOGINIT").as_char_ptr() as *const i8,
>     +                data: ptr::null_mut(),
>     +                size: 0,
>     +            },
>     +            GFP_KERNEL,
>     +        )?;
>     +
>     +        let logintr_info = KBox::new(
>     +            NovaLogBufferInfo {
>     +                name: c_str!("LOGINTR").as_char_ptr() as *const i8,
>     +                data: ptr::null_mut(),
>     +                size: 0,
>     +            },
>     +            GFP_KERNEL,
>     +        )?;
>     +
>     +        let logrm_info = KBox::new(
>     +            NovaLogBufferInfo {
>     +                name: c_str!("LOGRM").as_char_ptr() as *const i8,
>     +                data: ptr::null_mut(),
>     +                size: 0,
>     +            },
>     +            GFP_KERNEL,
>     +        )?;
>     +
>              Ok(Self {
>                  ptr,
>                  loginit_info,
>     Diff in drivers/gpu/nova-core/debugfs.rs at line 64:
>                  logrm_info,
>              })
>          }
>     -
>     +
>          pub(crate) fn create_log_files(&mut self, gsp_mem: &GspSharedMemObjects) -> Result {
>              self.loginit_info.data = gsp_mem.loginit.start_ptr() as *mut c_void;
>              self.loginit_info.size = gsp_mem.loginit.size();
>     Diff in drivers/gpu/nova-core/debugfs.rs at line 71:
>     -
>     +
>              self.logintr_info.data = gsp_mem.logintr.start_ptr() as *mut c_void;
>              self.logintr_info.size = gsp_mem.logintr.size();
>     -
>     +
>              self.logrm_info.data = gsp_mem.logrm.start_ptr() as *mut c_void;
>              self.logrm_info.size = gsp_mem.logrm.size();
>     -
>     +
>              let ret = unsafe {
>                  nova_debugfs_create_log_files(
>                      self.ptr,
>     Diff in drivers/gpu/nova-core/debugfs.rs at line 83:
>                      &mut *self.logrm_info as *mut _,
>                  )
>              };
>     -
>     +
>              to_result(ret)?;
>     -
>     +
>              pr_info!("Nova debugfs: Created log files\n");
>              Ok(())
>          }
>     Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 1:
>      // SPDX-License-Identifier: GPL-2.0
>      
>     -use kernel::time::Delta;
>      use kernel::prelude::*;
>     +use kernel::time::Delta;
>      
>      use crate::{
>          driver::Bar0,
>     Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 27:
>          }
>      
>          /// Function to check if GSP reload/resume has completed during the boot process.
>     -    pub(crate) fn check_reload_completed(
>     -        &self,
>     -        bar: &Bar0,
>     -        timeout: Delta,
>     -    ) -> Result<bool> {
>     +    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
>              wait_on(timeout, || {
>                  let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
>                  if val.boot_stage_3_handoff() {
>>> Diff in drivers/gpu/nova-core/gpu.rs at line 16:
>      use crate::util;
>      use crate::vbios::Vbios;
>      
>     -use core::fmt;
>      use crate::debugfs::NovaDebugfs;
>     +use core::fmt;
>      use kernel::sync::{Arc, Mutex};
>      
>      static mut NOVA_DEBUGFS: Option<Arc<Mutex<NovaDebugfs>>> = None;
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 5:
>      use core::{mem::size_of, slice, time::Duration};
>      use kernel::delay::sleep;
>      use kernel::devres::Devres;
>     -use kernel::time::Delta;
>      use kernel::prelude::*;
>     +use kernel::time::Delta;
>      
>      use crate::driver::Bar0;
>      use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 15:
>      use crate::nvfw::r570_144 as fw;
>      use crate::util::wait_on;
>      
>     -use kernel::{pr_info, pr_cont};
>     +use kernel::{pr_cont, pr_info};
>      
>      /// Print a byte slice using pr_info, with bytes_per_line bytes on each line.
>      /// Each line is formatted as [0xAA, 0xBB, ...].
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 23:
>          for chunk in bytes.chunks(bytes_per_line) {
>              // Print opening bracket
>              pr_info!("[");
>     -
>     +
>              // Print each byte with comma separators
>              for (i, byte) in chunk.iter().enumerate() {
>                  if i > 0 {
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 31:
>                  }
>                  pr_cont!("0x{:02X}", byte);
>              }
>     -
>     +
>              // Print closing bracket and newline
>              pr_cont!("]\n");
>          }
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 136:
>      }
>      
>      pub(crate) trait GspSeqCmdRunner {
>     -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result;
>     +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
>      }
>      
>      impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 143:
>          // TODO: Can we return Result instead of  Result?
>     -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
>     +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
>              pr_debug!("RegWrite: addr=0x{:x}, val=0x{:x}\n", self.addr, self.val);
>              let addr = self.addr as usize;
>              let val = self.val;
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 151:
>      }
>      
>      impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
>     -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
>     +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
>              pr_info!(
>                  "RegModify: addr=0x{:x}, mask=0x{:x}, val=0x{:x}\n",
>                  self.addr,
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 161:
>      
>              let addr = self.addr as usize;
>              if let Ok(temp) = sequencer.bar.try_read32(addr) {
>     -            sequencer.bar.try_write32((temp & !self.mask) | self.val, addr);
>     +            sequencer
>     +                .bar
>     +                .try_write32((temp & !self.mask) | self.val, addr);
>              }
>              Ok(())
>          }
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 168:
>      }
>      
>      impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL {
>     -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
>     +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
>              pr_debug!(
>                  "RegPoll: addr=0x{:x}, mask=0x{:x}, val=0x{:x}, timeout=0x{:x}, error=0x{:x}\n",
>                  self.addr,
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 204:
>      }
>      
>      impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US {
>     -    fn run(&self, _sequencer: &GspSequencer<'_>) ->  Result {
>     +    fn run(&self, _sequencer: &GspSequencer<'_>) -> Result {
>              pr_info!("DelayUs: val=0x{:x}\n", self.val);
>              sleep(Duration::from_micros(self.val as u64));
>              Ok(())
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 212:
>      }
>      
>      impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE {
>     -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
>     +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
>              let addr = self.addr as usize;
>              let index = self.index;
>      
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 233:
>      }
>      
>      impl GspSeqCmdRunner for GspSeqCmd {
>     -    fn run(&self, seq: &GspSequencer<'_>) ->  Result {
>     +    fn run(&self, seq: &GspSequencer<'_>) -> Result {
>              match self {
>                  // TODO: Can reduce the number of "impl GspSeqCmdRunner" above, if
>                  // moving logic into this block itself. But may not be worth it if
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 281:
>                      seq.sec2_falcon.start(seq.bar)?;
>      
>                      // Check if GSP-RM resumed.
>     -                seq.gsp_falcon.check_reload_completed(seq.bar, Delta::from_secs(2))?;
>     +                seq.gsp_falcon
>     +                    .check_reload_completed(seq.bar, Delta::from_secs(2))?;
>      
>                      // Check for any errors in the SEC2 mailbox registers.
>                      let mbox0 = seq.sec2_falcon.read_mailbox0(seq.bar)?;
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 291:
>                      }
>      
>                      // Write the OS version to the GSP falcon.
>     -                seq.gsp_falcon.write_os_version(seq.bar, seq.fw.gsp_desc.app_version())?;
>     +                seq.gsp_falcon
>     +                    .write_os_version(seq.bar, seq.fw.gsp_desc.app_version())?;
>      
>                      // Check if the RISC-V core is active, return error if not
>                      if !seq.gsp_falcon.is_riscv_active(seq.bar)? {
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 400:
>              // TODO: Replace with actual RPC header size calculation from your codebase
>              // For example: let rpc_header_size = RpcMsg::ver::get_gsp_rpc_hdr_size() as usize;
>              let rpc_header_size = 0; // Replace with actual size when available
>     -
>     +
>              // Dump RPC header
>              pr_info!("RPC header ({} bytes):", rpc_header_size);
>              if rpc_header_size > 0 && self.data.len() >= rpc_header_size {
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 409:
>              } else {
>                  pr_info!("(RPC header not available or size unknown)\n");
>              }
>     -
>     +
>              // Dump run structure (seq_info)
>              let run_struct_size = size_of::<fw::rpc_run_cpu_sequencer_v17_00>();
>              let run_struct_start = rpc_header_size;
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 416:
>     -
>     +
>              pr_info!("Run structure ({} bytes):", run_struct_size);
>              if self.data.len() >= run_struct_start + run_struct_size {
>                  let run_struct_slice = &self.data[run_struct_start..run_struct_start + run_struct_size];
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 421:
>              } else {
>                  pr_info!("(Run structure not available or not enough data)\n");
>              }
>     -
>     +
>              // Dump opcode data (first 200 bytes)
>              let opcode_data_start = run_struct_start + run_struct_size;
>     -
>     +
>              pr_info!("First 200 bytes of opcode data:");
>              if self.data.len() > opcode_data_start {
>                  let opcode_data_len = core::cmp::min(200, self.data.len() - opcode_data_start);
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 435:
>              }
>          }
>      
>     -    pub(crate) fn run(&self) ->  Result {
>     +    pub(crate) fn run(&self) -> Result {
>              pr_info!("Running CPU Sequencer commands\n");
>              self.dump_bytes();
>      
>>> Diff in drivers/gpu/nova-core/nova_core.rs at line 25:
>          }
>      }
>      
>     +mod debugfs;
>      mod dma;
>      mod driver;
>      mod falcon;
>     Diff in drivers/gpu/nova-core/nova_core.rs at line 37:
>      mod regs;
>      mod util;
>      mod vbios;
>     -mod debugfs;
>      
>      pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
>      
>     Diff in drivers/gpu/nova-core/regs.rs at line 204:
>          31:0    value as u32;
>      });
>      
>     -
>      // Used to store version information about the firmware running
>      // on the Falcon processor.
>      register!(NV_PFALCON_FALCON_OS @ +0x00000080 {
>     Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 1:
>      // SPDX-License-Identifier: GPL-2.0
>      
>     -use kernel::time::Delta;
>      use kernel::prelude::*;
>     +use kernel::time::Delta;
>      
>      use crate::{
>          driver::Bar0,
>     Diff in drivers/gpu/nova-core/falcon/gsp.rs at line 27:
>          }
>      
>          /// Function to check if GSP reload/resume has completed during the boot process.
>     -    pub(crate) fn check_reload_completed(
>     -        &self,
>     -        bar: &Bar0,
>     -        timeout: Delta,
>     -    ) -> Result<bool> {
>     +    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
>              wait_on(timeout, || {
>                  let val = regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar);
>                  if val.boot_stage_3_handoff() {
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 5:
>      use core::{mem::size_of, slice, time::Duration};
>      use kernel::delay::sleep;
>      use kernel::devres::Devres;
>     -use kernel::time::Delta;
>      use kernel::prelude::*;
>     +use kernel::time::Delta;
>      
>      use crate::driver::Bar0;
>      use crate::falcon::{gsp::Gsp, sec2::Sec2, Falcon};
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 15:
>      use crate::nvfw::r570_144 as fw;
>      use crate::util::wait_on;
>      
>     -use kernel::{pr_info, pr_cont};
>     +use kernel::{pr_cont, pr_info};
>      
>      /// Print a byte slice using pr_info, with bytes_per_line bytes on each line.
>      /// Each line is formatted as [0xAA, 0xBB, ...].
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 23:
>          for chunk in bytes.chunks(bytes_per_line) {
>              // Print opening bracket
>              pr_info!("[");
>     -
>     +
>              // Print each byte with comma separators
>              for (i, byte) in chunk.iter().enumerate() {
>                  if i > 0 {
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 31:
>                  }
>                  pr_cont!("0x{:02X}", byte);
>              }
>     -
>     +
>              // Print closing bracket and newline
>              pr_cont!("]\n");
>          }
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 136:
>      }
>      
>      pub(crate) trait GspSeqCmdRunner {
>     -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result;
>     +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
>      }
>      
>      impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 143:
>          // TODO: Can we return Result instead of  Result?
>     -    fn run(&self, sequencer: &GspSequencer<'_>) ->  Result {
>     +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
>              pr_debug!("RegWrite: addr=0x{:x}, val=0x{:x}\n", self.addr, self.val);
>              let addr = self.addr as usize;
>              let val = self.val;
>     Diff in drivers/gpu/nova-core/gsp/sequencer.rs at line 151:
>      }
> ..
> 

