Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF911C7B63
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 15:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730388447; cv=fail; b=c+mb8cIxNwWxAzLIlkL3i80wQncDAcvdK2DIvkSy3Jd06n4jNforP4X/dkVPxHlqioeGR0vOIiQfBq/PkbO/4Ca/ILG6v/kkuQS9xwxn/kVEvgNkaIo4/E20Tg1eyB9m7vOQGKJM+nECbniCX6yhwWfLcbfeirIodGjZotVDTZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730388447; c=relaxed/simple;
	bh=+uGbgZriJL3ZlHxiitHg8ApfF4abaHmtb08ZUdHImlg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XdA1S5KpwpVA/cbfXppARtvV2dy59UbnqH6VPrnyX2QE0luFfN5YnC0EX21COEv3bYHUbw2U3YqwrW6g1T4Za/XDOlF6qYNIERcciKNnW55RrCEKsUP3fV57PR/PxWt293JamqjU1ivgXJwo2q5W+uMTzeqv6xcdJtflrqppvYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Y+KeuwUw; arc=fail smtp.client-ip=40.107.212.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Y+KeuwUw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksRbCL/efYPfT0QTfURJtNIyNtgPCYf1uuUNc1NhHfpGttvySv57YL90qvUjpwRt/2zNLSwvcgzT/27CDR+BxnC0R1iPulIONJwJjGMmXXvydzVhzU7sdTg7utdqmanvA0tk/WqgdFrp7OFUE+wccNvWlwTMVxgqQmlIFlEHhGuY/E8iJWHlONbPy0Tc3jAyrBNoPZ9vJ08+oHVoyysJyi9pxsZzQE1tNXJ4zmtcyXIAOdZPpMJ3Onn94QPyDjeHiOucqVCKy9a8SriHoLo5SpJRxpFum0qZoGW0nurTakaSqcgdNeimqaNm66ZE2y/Xv8H7FIDLF7Gabggdu4y54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ay7Z+WksIzB5wiJK2vylSjwZBt0dCLJZTv2n1WELUyA=;
 b=fd+DXFpCxeLm+djL6qUqBQ3s07lYJNMBCa7ZdYjHMgCtFE6mGMuts6LqZE7ya6KrWBYypsdOooViGhibCBjCZB1Sxql49P4l4zLXTQTSLhQv0C6pcx4XWojG0Eh0KXUlG7Cbg/MjN+bABslAMT0A8sgU7h9LjdYbOvo7JagOqsn2KEy/DFxRl2BMpWw+XQGeLl2iaDJg/lSELE3TVXdDBi5wkhdGjXsKExh7PF2zP09C87B7qSQVwc9J79yGatD/b7biimt/t0gdaMXK5tJFF9jgkbu3P8aSTxFNkWF5LnF/OCmpVO+Du4H5iMvJyMJzy0KhDcd/uHAsKAHhkgU90Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ay7Z+WksIzB5wiJK2vylSjwZBt0dCLJZTv2n1WELUyA=;
 b=Y+KeuwUw51eD0E0I4ldAR83OAISmhZGoY0Eyor8ornPLWgqmYaSeqomCqqsDzaoNGQxCm1N/b06KhGrU1K2O+7HYRZ9doZRqgydSXXKKRwXQo14vsXUSA3uJEjByBZL88jsF0lqUyxFFcrhvmGGtY8gT7pLDUJWaMq35UpE5RM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 15:27:10 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 15:27:10 +0000
Message-ID: <c62c477c-91fb-4200-96fa-542b656936fa@amd.com>
Date: Thu, 31 Oct 2024 10:27:07 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v9 17/26] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <a3c2bdf2153882cc955b80b7d0fcdf7af3d09eb3.1730244116.git.babu.moger@amd.com>
 <202410311452.VieQO7W8-lkp@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <202410311452.VieQO7W8-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::30) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 5608636a-68f7-4f38-6d86-08dcf9c07bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHdHdHlWc0hpUTgvYk9KcWwvRDZYYlBsa0gwTlRySVBzeVlNUXlyR3JRZlB4?=
 =?utf-8?B?YUY0NmU2MEpGenRGZWN5RGdQaVpUVXRNenlsSUYyVDVmbnZEeUZ2OS9GNk12?=
 =?utf-8?B?azlSbDFiSENBNHBXNElBNXN2THdqamtOVGl1T3dPT2ltRlBwc3B3akcyOHpT?=
 =?utf-8?B?SURDTENUYWZIVzBxTGo2M3g3WU5MZkFlOW4zZ1VDeUZUVStqOXlhVE93c1hY?=
 =?utf-8?B?YWNrNEJKZEg0RUY1cG54SFZRdHNxVWpkR0tYQk4yK2FYelRIRGhpeHZuc0hj?=
 =?utf-8?B?ZjVzWk5NK0pmb09ZYmU2UkZSL21uaXh3aXZlVTFSRG9sdElCVVRuQVhRODAy?=
 =?utf-8?B?cU9ScXJiS2wwZGppQlVwT0lDVDBvMnJtTkVsZE9KdTFXMlgvQi9XamN0OFN2?=
 =?utf-8?B?bzEvUFpuV2paRnFuREI5Nm85UGRTZXJwb2VDU28zcVZkM2greWp6aWE4cjNh?=
 =?utf-8?B?RDI0M0EwZGlTd09XYlVCY3A1STAwRUwvY3Rad0Y4S1huUFRqR3JWbTJlMGho?=
 =?utf-8?B?NVVFQWpsa0NwSWxVTGtZZ1lnT0EweWdrL0RRNGYyOEJEcWl1RjdJRW1RYzBx?=
 =?utf-8?B?K3NSOFI2dkNJWjhERGh1Skk3WkZ4SDRDczZybDJMLzZyOXRlQi9heEdIRnVM?=
 =?utf-8?B?WkRvL1kzUU1vWHJmbFdHU21tQjM5N09hT0VFNXdXS3dKSUlTSUw4K01lN2Fm?=
 =?utf-8?B?dGxGWEFXU2FWbks3b2xjcW5ncDR6dE1qaTE5OE9ZODd1VGJXeXhTVGdwWTRp?=
 =?utf-8?B?MHhkZ25ORzJzOG9naHJrMXkyeWwxTFJvK2cvVUJUeWlzYVhNd2FTMlJtQWtI?=
 =?utf-8?B?N01tUjFpbndCaDNWenk0dWkzbnBFQ0FZWUI0U0xQbmhObkw5TDB1S3oxR1Vy?=
 =?utf-8?B?a0FDWU5CUTNydGxJeGlVamJDSCtiZW1WNkdBWmF4K01sWUhhQWtEbXo2L1pk?=
 =?utf-8?B?UnNad1AzSnZIZU9PYi9nVGlYcWlrVU91V0pEMG1vbERBRDh1bkwrL0lhK0Jz?=
 =?utf-8?B?dWQwcGJtZHJNNzFtUzNSME1VVGN6bjcyaVBqTGF6SEloemJLVEpxdEFMNUZs?=
 =?utf-8?B?SmtHSnkzTUF6aituK2NDdXBIOEFsYWJlZVlLZUFZMUYxT2gxNkttbEVYKy82?=
 =?utf-8?B?UklsTDRsZFRmQTRuN1RXOTdBUTJ5bW1qbTl4bXpTU0YxVGhVVGF5YWg0RXE1?=
 =?utf-8?B?ZU9KUUNPdnh1c2ZncW9WdmxaRG5uMm9sUmZlZkNrVW9PWTJYV3Y3N1dWeElU?=
 =?utf-8?B?Q0M3TTRuZnN3Snl5eTdIVWttZnFCLzgrYlhJRGVSUXoxcUs1aU1JM1pabkpF?=
 =?utf-8?B?V1lMSHNHcjBmMWorM2VlR25Ed09UM2lnU0gwcDNIbmxtUGFHQTl5U2crUDBD?=
 =?utf-8?B?dTR2TjRmUjYyTHFweTlGY29yV1VGUmM3SEZydW9zbEJJemY5cGQxMVhNV3cy?=
 =?utf-8?B?Z2E3cTZaMjRndmdqaHpJN1NTSUxyTDRvNDhEc3NOVkdRU3hqOXdRZ2NZM2Rr?=
 =?utf-8?B?a0wweG50UWV5ZWtKTXJhUld0aHJ6cjF0cU5WSjY4ZjNoSkVCZnE1WGorMEt0?=
 =?utf-8?B?R0k3MllMbXNRclBkNjNzT2thMzFyZHFYSmcvaCtIVHpjY056UEdjcEZRWmtU?=
 =?utf-8?B?a05USm0yK3ZhQTc5Mm5iK3BRNE90VXhTT0RzTjJadlVaVWlCdStEVkM4Mzlj?=
 =?utf-8?B?d0ExOU5halBlaVhwU0RtTU1NQnVIMWhtUkpZSURrWEVEa2VmQzVwQ2RBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2srYWlOWW56RkYwRHNHdUVTMnh5c0hQU1ZDRGVzTEd2TUloZVNsNGd5ZUNq?=
 =?utf-8?B?TFlGTmxxTjhPUElIT0xEVURIS0IrdjQxRHljNkE3bVEyNHJ6YTU0NlpocG9J?=
 =?utf-8?B?OFdWeXNUSW5Xa1NaUFA5cEZRMEw2dFJkSjZVOWFaVVNyVmtTQ3ZEVmlBZXVE?=
 =?utf-8?B?aWhQTE8wcnRCa1dTQ3lycjdqVGY4Q1p5dDJlZmlRYWN6ZXlFK3ZadzQ5dEFp?=
 =?utf-8?B?aE81dVRFTDJhWFhhOXUxN2lhUldLK21FZEdlZERwSGFLTTdVclFEUEJUT1N2?=
 =?utf-8?B?Z2F3TmVFOWJzcFg1OVFERHg4b1JyUmJ3S29mVnN5Ny9NODdDc1dWUUcxOTRj?=
 =?utf-8?B?VS9lZFRLb0VlcHRNTnVIYnYybnl6a3F6UVlMRnJtTjNwcTJhWFEwWmtudkdS?=
 =?utf-8?B?bUpUMDI3OUpqTk5nNHJ0QWhkVXRNdWVtOC9ybjE4N1BzL2xpSVJHcjNGbGpJ?=
 =?utf-8?B?cUpUOE54bDV5ckgrWEFVRTlMWkZOR3FIU1RKaWpZVGFLS3RCUnBKSm5XNDdS?=
 =?utf-8?B?UVcrQVZMamdmb0VyUmxUZE9zTjVHN09XL1Z6elN1blg0d2RoWGxDenBiM3FX?=
 =?utf-8?B?UDJ3MWNKemJGQ0ZGUjVBWjRiRWdmbHkveWlQeS9PT3Q4eVpxcWNLR3lvVTMw?=
 =?utf-8?B?eHYxNmdVdUp4c1FoVGFTUlJkRHl5K3dKMytJK3VKVlNINlVQcXIzVFlVSGVC?=
 =?utf-8?B?bml1akxRWHF5cXEvYmVjaENmVlpVQ3dJa1JKUzl6dWlvTGVyaGR5VFlSakk5?=
 =?utf-8?B?VWZPRlpDMktTVUQyR1RlVzlmU2Jrc2Qzd3JjWFNLb0M5dlZaRkRTTDZvWktm?=
 =?utf-8?B?WFVpNy9WaWlOQ09BTTRiVjQ4d1k4M1BnY1cvc3lZRisvQWZTTytBczk1VGxV?=
 =?utf-8?B?YU9EYjhZSFh2QUZJVGVkVlBTUXh2TFBXb09xL1FMRjltNW82NVZjbHNVZUZx?=
 =?utf-8?B?MHliOVZhUmxoQzFCZDVuVjJDNy9ZUHJMNGl4VGg0cWRpU25Yc2gwYzRzdUxp?=
 =?utf-8?B?L0lqazJvWGFoZTRZRXBEbVlhTVdweGhkTFJUR0Zvci9lVFU5Tzdzd0VYNGU3?=
 =?utf-8?B?anlBejFONWVXeTFPNXV5UFduNnB0WUh1bVRETDNQdm1XRjlncWR4NUpRVmpF?=
 =?utf-8?B?UXdXV2w2RExwS0dFc1pib1pIV1pXeEMxU2tLeFY5KzY5UUxweEVFajVXRDg3?=
 =?utf-8?B?R0dldklzcG4xalNZMU9adm1OM0hkWmptRXo2MVFNZHc4bE90MVBabTFBMVZw?=
 =?utf-8?B?SlRCYmhCTzAzeW1keU1nWS9qR0NhK3lJdnhrV0QwcGlkK25YTW9qaFNWR3NC?=
 =?utf-8?B?RHRLamt2TjFQRzFEaWpyYUo1V0ZxNnFqdlZSU3VObGJMUHBJd0lXYmRvVXdK?=
 =?utf-8?B?OFcyTmVtYVhqQmZWeDJRcTJHNi9BUXczeWNiSE5FSDROOGhnQ0x0NEVXblJX?=
 =?utf-8?B?MnUrMjRJdFltNVRZd2JTeFJaZ1FaY1dmajV2a2d2aXdzWW1xYjVFT3QzWnhV?=
 =?utf-8?B?RnJTdnFQbEs3VHBLNVpMR05rc2w2ZGMrazM2dnZMRnJVZlVXSmVTcDlXSy9N?=
 =?utf-8?B?SG4zZXd0cFNlcnpIcmVOVEF5YVZOWk9FbmpZd0tXeFlsMlFFSFNKY0lVQ3RV?=
 =?utf-8?B?NWd4NUNJYU9RMDVmZ0FVa1pURjBMV2tYRUtmKzc1a2tPN0F5WkJKdjh3N0Jh?=
 =?utf-8?B?Zmk3WTZzQ0NLTGZWZFkwNHFmdkVTNEtTNlNQb0VjdGF5NSt0amZMVVQwVURO?=
 =?utf-8?B?UDhHblZBNFJxVC93RGUrSEdEVzM2SGVldWY0TkdieU1iZ2MrR2p1K3ppR1Vs?=
 =?utf-8?B?WEFCZExsc3NvSGRoS1JKUE9WREpYS2N0OVFBcFpIVGJXQ2FQRzFVYnVFYnlF?=
 =?utf-8?B?czIwK1Jrcmo1YVg4QTNHZWh5YnhJM0hodlZVZjJRTU1TQXVTZkdSWVFIeEZS?=
 =?utf-8?B?aVgzcU4yd1MzTUJBZGhaWDdtaDRwVHdGWjRqTzUxa3AvSFY0UUkvcHYxcjB2?=
 =?utf-8?B?N3ErcWxoZXErcUExUzl1TmtvMHhDb2dJV1dCcXFaajFjbE9sajVhbkhIUzB3?=
 =?utf-8?B?ckhYamwwVVBtWjZLYml2ZFhXZjdrWUJ0TFovQ2FnbjY2SUlSalpxb1dGRVhI?=
 =?utf-8?Q?FLW4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5608636a-68f7-4f38-6d86-08dcf9c07bfd
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 15:27:10.1332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwlG8od14mOy6jhPjkVRgAx3DZr0cEpxxFNdrZi2Q4THqkn7cJBcRPFxj7K9BJeV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949

Thanks. Will fix it next revision.

On 10/31/24 02:16, kernel test robot wrote:
> Hi Babu,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on next-20241029]
> [cannot apply to linus/master tip/x86/core v6.12-rc5 v6.12-rc4 v6.12-rc3 v6.12-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-resctrl-Add-__init-attribute-for-the-functions-called-in-resctrl_late_init/20241030-073059
> base:   next-20241029
> patch link:    https://lore.kernel.org/r/a3c2bdf2153882cc955b80b7d0fcdf7af3d09eb3.1730244116.git.babu.moger%40amd.com
> patch subject: [PATCH v9 17/26] x86/resctrl: Implement resctrl_arch_config_cntr() to assign a counter with ABMC
> config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive/20241031/202410311452.VieQO7W8-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410311452.VieQO7W8-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410311452.VieQO7W8-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    arch/x86/kernel/cpu/resctrl/rdtgroup.c: In function 'resctrl_arch_config_cntr':
>>> arch/x86/kernel/cpu/resctrl/rdtgroup.c:1905:32: warning: variable 'arch_mbm' set but not used [-Wunused-but-set-variable]
>     1905 |         struct arch_mbm_state *arch_mbm;
>          |                                ^~~~~~~~
> 
> 
> vim +/arch_mbm +1905 arch/x86/kernel/cpu/resctrl/rdtgroup.c
> 
>   1895	
>   1896	/*
>   1897	 * Send an IPI to the domain to assign the counter to RMID, event pair.
>   1898	 */
>   1899	int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>   1900				     enum resctrl_event_id evtid, u32 rmid, u32 closid,
>   1901				     u32 cntr_id, bool assign)
>   1902	{
>   1903		struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>   1904		union l3_qos_abmc_cfg abmc_cfg = { 0 };
>> 1905		struct arch_mbm_state *arch_mbm;
>   1906	
>   1907		abmc_cfg.split.cfg_en = 1;
>   1908		abmc_cfg.split.cntr_en = assign ? 1 : 0;
>   1909		abmc_cfg.split.cntr_id = cntr_id;
>   1910		abmc_cfg.split.bw_src = rmid;
>   1911	
>   1912		/* Update the event configuration from the domain */
>   1913		if (evtid == QOS_L3_MBM_TOTAL_EVENT_ID) {
>   1914			abmc_cfg.split.bw_type = hw_dom->mbm_total_cfg;
>   1915			arch_mbm = &hw_dom->arch_mbm_total[rmid];
>   1916		} else {
>   1917			abmc_cfg.split.bw_type = hw_dom->mbm_local_cfg;
>   1918			arch_mbm = &hw_dom->arch_mbm_local[rmid];
>   1919		}
>   1920	
>   1921		smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd,
>   1922				      &abmc_cfg, 1);
>   1923	
>   1924		return 0;
>   1925	}
>   1926	
> 

-- 
Thanks
Babu Moger
