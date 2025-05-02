Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5851E25F2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 06:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746166304; cv=fail; b=SXDKT/mMcatNVd8/i7TzqusBKcZTw5ejs0+6QWYlAw3fBSrmG0fMlMlTkiSfHxWyBFkUp7eQjGsKa8gTuq3ie/4cUht4CPW5vFwS40FOwI1LLe2gc3UoksXOVC7FEy7fhFC0xzYMYH9Pfdc1IzIex6CoYR9Q1NtgkjV81ubIynY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746166304; c=relaxed/simple;
	bh=J3OzYDXsnchiIBGuQdQnCoxD3yM7aC6OwC2O2c3H7wc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=m+hxKntYfA0GUkgw32NKE23FHmsfrq+zbG+F/sEqwwchn02iWGmp/LuEvuOYwDKvRWlgKYs+u5hAHWaID0yVmqcwc69xotbwlz30GabAmf45RA4oNmBxmJy8iihZMIiQijuDe7PumrLuXz8KeHllLZrVF/NGwVaTOq/K0d8MrYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oU4b1DXo; arc=fail smtp.client-ip=40.107.236.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oU4b1DXo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEtItTkk8CxSrp1eQkKhvJnY2LnFlAQmddSryDLHGZp545TEa+h+qzRb4PAmfr4wPJgop2jfJpwGlA6d1CHLo/vmbVy9jCym1JB/VsqqIeUImYBBs5fqpLTm7uQ4982XAJbxPAf+m3eO1gVP9Nu1UgD9pbWSWdMlUyreGhwHcdhKAMOcRRe0g0bep9v/LFdZQKj0GfBW3MKjkUrNyFgXKAKVWzWIMWK3N41ALw3ho0YZa4NcKxZQTaR9psxohJhB+mvhYOlUrkODN9KawUDxsa+9YvdBtNxUhdUN6YLGDD7d+84TlFueRkcwZqZ6XKJ4KxXSAA46WuQ2lOyRgTWzdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQm8ASRU0TF3qgAeVsONqGY7AHJmFrscB8jxBE6+Auc=;
 b=kFQhfhy6yVfXd/saanluop7KglechcJQaZ105rseCtHhl5k+0QW+/sp6FpJNErM5/jsmOhdLkgG2EzHvwszJ1IXFvo3VV2FiPxGf0hiUYGp5DfuDRttJynCANxNRgY3b4OZVAi1x+1HPMO4c3KaxCehJRB6pemsTgDFvjeXYxfoxShu01+aPqSClkuEt8wugkfyrCJJdU84sa5xuXdaZXchxEO4vGhdYsm1rXFD0Nd778juCJ+3VeeSmia3ekHLpSBEBdBC4pBfO3gYy0I1k7Z6tfHR4rCLtA2dZkyoUDx/tB0TRJ6nhW5PceN6YaWpiRkVrLaG4/LgLuq/DXPO0Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQm8ASRU0TF3qgAeVsONqGY7AHJmFrscB8jxBE6+Auc=;
 b=oU4b1DXoCPUZTEV+9t44dblemCfe7TaZyNURNWjD2rFDRCqBEW8tD8hNR2oLsmub98Rg+cFQTPWUDZWFfBk7ceF+da0ATDhAvSKRoMBkO+AWp8MaBmK/3hcFsM7OqBLFbCnhoMzHBf1zPLNd5or3EJUcMTr6koqGo0/3dCWISYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by SA3PR12MB8048.namprd12.prod.outlook.com (2603:10b6:806:31e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 2 May
 2025 06:11:40 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%7]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 06:11:39 +0000
Message-ID: <b7caee56-80b4-49e2-a140-16a0adaee209@amd.com>
Date: Fri, 2 May 2025 11:41:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-unstable 272/272] include/linux/stddef.h:8:14: error:
 called object is not a function or function pointer
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Matthew Wilcox <willy@infradead.org>
References: <202505020405.YzD9aNCo-lkp@intel.com>
 <20250501141304.beac3e9d892495eea7a4e9cb@linux-foundation.org>
 <aBPtHlqpEsNxAiOV@casper.infradead.org>
 <20250501155912.fc59c6e36c87c623501fe988@linux-foundation.org>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <20250501155912.fc59c6e36c87c623501fe988@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXP287CA0020.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::28) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|SA3PR12MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: 60fb98d8-b23a-42f7-89d5-08dd89403379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFJnbUFjekx3K3Z0SHBSL3FNNmloWXBLWHQrYWR6c25uZE1JUldpOTkrcDRE?=
 =?utf-8?B?c3VORHFEalJtOEw1dUI2YXlTSEM2UlY2WWRRRlRMcjlVc0tGRFRXbVFCa1N2?=
 =?utf-8?B?QWpUbDZVWnRvYzB0K1FYRTBPYldCakgzbUJKbzdndDBxQ3NtejVmUEJsQTJV?=
 =?utf-8?B?WG5MQjFMZ1lhZWMwWlQyYm1TS2x3N1Q3WmZ4U3NjOEQzUWwyR0Q2bXBNMkVW?=
 =?utf-8?B?UURoQnJidTlmVzUzV1BWQWFEYTRpeE9RUFZYWlJMczI2N2E1Y0RZdXRER1VX?=
 =?utf-8?B?OFdJYm5qcEUyOEt3VldBQUJYVUQ4dk9oMVZweGJqZzlNbCtyWUUzWHpxRE9m?=
 =?utf-8?B?T1V0c05RKzlNMHNCYURMZlZzeWNyZWNIQTkyU3RXTnhKc3pmVjlrdDlnT2RF?=
 =?utf-8?B?NFd3ZHVITG1ZMUlNODBDQWRWN1FVbE01TXNqYnNJRXN5QUdUai9oMzB2SXFK?=
 =?utf-8?B?YmFFTkRGeFJpR3BMaTBZV0haT0Jodmp1L2d5Kys2RHZ1WU5WS2xXM3VSL2J0?=
 =?utf-8?B?czBoaGx4VWZTMVBaNEo3dkw0Ujd5UWVJTldMSFlCZXhtejRIbGNVUVNDQ2p3?=
 =?utf-8?B?ckFmekhIZ3ZnZmI4am0raXlPMGlqemFOc2NRVGtuUGtZTW9FZVRMM25HRGJh?=
 =?utf-8?B?NHc5NE5UWUpudExmalQ5elhGZExZWVZFTXFydXcxNEhVenUxYVkzTHpFcXVx?=
 =?utf-8?B?eE9rQVRmZTNlMjFxeUg3anFHU1ZGaHJwN3d5emE4amFObDV1RlRQdUNrTGNo?=
 =?utf-8?B?RGk3dDR4TkNuU2FVSUcxZ0cwTmQ1VWx3dTNmMnhlRDBiQTN5YzNsdS9jbFBx?=
 =?utf-8?B?czZDQWt3NzcrczlEZnNWbHBnN2ZDUWxnMHVseVlWT1paakdzUVNGaFZ0ZEFV?=
 =?utf-8?B?T3h4Y2hZMnc1Z1RydlhxMmNFK2ZRdCt5bkNyOE96S1NyaVJZL0haNHNrSS80?=
 =?utf-8?B?WEdIRXZ0VUNtRW1OeWNJMVdxUGZWaXh4UVRPS0oxL0g2VUdUWFJFZ2JtS3dC?=
 =?utf-8?B?L3V3WVBDd1RYN01sdnlMSU5RcWZaNW5uMjJpak1OamxXdUdxaG1rZ3BxVUZn?=
 =?utf-8?B?WTA1ZGtFZ3AwTWx1YklQa2Z2QzN2MjQzS1gyK1RmZ05icG5CdlZqb0RtZmx1?=
 =?utf-8?B?RXhMS1NpN3F4YXhkWWpQUUpWVy9ZOTFFU2t1enlUSFBScng2bmgyWCs0UGpp?=
 =?utf-8?B?NHVqSWJKd0hxbnJiMkZzbVVVL0pka21MbFVjYWpjdmw0VUttT1k4cGhKcVhP?=
 =?utf-8?B?MW9HTUdXM0tsd2oya25QdnJ1TUJhdVprWmVodUxsb3RqZC90djd1YUpjYWNW?=
 =?utf-8?B?dklWc1Izb2VFcHI2a0U1OFIvc3VJNTdwMkdPbzNxa3hubDhUNmE2VlBPRmdo?=
 =?utf-8?B?cTk3TS8zUEJCWENmalAvUVBJZXc4MlhDR3AweWpGSHEyZUl4ZkJBeTlSYzk1?=
 =?utf-8?B?TVdxL1hwNElUZVRYUU13bjZYdkpxUk8rTW5FSGFNUlpsOWw5Z0Y1bzVXbEd0?=
 =?utf-8?B?cy9HNlNyZGpYMFpkc0FpV2ZhRjhzcWpjVE9jM0oxUVA0Z3gyeVMrSlJPL0JL?=
 =?utf-8?B?bFBEQjN6Mnl4c0w5S2Q0anIrVmRsaEhNVExBN0lkYmUwaGIxTmJ3b2ExQkhx?=
 =?utf-8?B?SlRVSlJ1eW41ZjVxSVVLR3p2Y010eG1XcEp3OVE3QjA3Qk5uN0JMTFdQVHQz?=
 =?utf-8?B?ZEhnT3BUd3FPTkIrRllIaEtiNFJQQ2pIc2pOdU9IU0Y2Z0FrdG5aT3BkcDZK?=
 =?utf-8?B?VWJYa0VscHF6aktPUHc4c0ZSNFl1K0pTOTRxeG10NDhYZjFxLzVKN0dWeFR0?=
 =?utf-8?B?Tm4rbHhuS1VmVVJDR0VoU2dsM1U3aGp1dTF2VDJQVkNSZU51QWIvR2UyUFNa?=
 =?utf-8?B?SDhzRXFQQ1VTZkh5VzRPL3lLSGtOeG5uSWk2QmZ6K1pkVGZNQ0FhVks5Q2tq?=
 =?utf-8?Q?es4dRQcrVrI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZE9DUy9rc0dsRWo5REVHVHd2aEcrZTFkemRMc0RHdTN1L1lHTGczbVZrOTEr?=
 =?utf-8?B?dzZMUTlJLzlFTFdyVEMySjdkSTFsZlhxeWVSZHNZSnRybGxNSFozaTJTeUdj?=
 =?utf-8?B?NXlHYXN5aFdrRkg0bVR6YXJiR0tJQTVOU3RiYlc5T1llM2N2ZjdlTkp4UXpi?=
 =?utf-8?B?NG81cmZUa2NIWFRRRko4cmx6RWNNbUJvT0tWMUZSWXNQeG11STRaM2hnVThn?=
 =?utf-8?B?d0VCNVhLRkhHcE5yWlN3dUhxVW8zQUtncVZ1QzhnT0JhZlZ3WklHVEZRTmw5?=
 =?utf-8?B?VnUvUWt0dUgySzU4Qk1yWWh3QmZ3STVoK3F4YmpiNjFWWWcwem1EQlZGZVlh?=
 =?utf-8?B?N0V5d3JyU1cyTTNXcWsvek1tU0lXNEs4U1duOUZuZFNpeDNjOFNWdXlTY1BF?=
 =?utf-8?B?UEJTc1EwT0hlUmxvZlliS0J2QWF4a1U4MjNtcFVYTHcwRTVBY1ZmdGU2REZM?=
 =?utf-8?B?bzJ2TjBPLzlDb1dGalcrcDRtRUdiR2xDYllDVjdYTWhma2NDVThmTFNrcDZa?=
 =?utf-8?B?NGFhdnIxMHIweGQxc2tGVnNueXNaOFBlREF1OTRwRHhPQkJvR0poRVI4RlRZ?=
 =?utf-8?B?dGZxQlVqYjZhKzdEODZZY1dlZWpXR0ZYbDM5c0dHMHFQRTFCa2VlVmsvZDln?=
 =?utf-8?B?bGZST0dMZitscnU2U3c0SjBLZHlVUUZHZElKV20vUWtPY09IK2hrVXNab0Fr?=
 =?utf-8?B?LytlTHMydjl5b2JzclJmcGM5ZjI3NU9hVlpZSWc4bnRvOWdmOGVVUmNZbTFP?=
 =?utf-8?B?cVZvNkFLejJFZ1RzdHg5Y2F0Ryt6ZHluZ2trUUpPL01tUGtmNmUvZCtKZ3F4?=
 =?utf-8?B?c2JBSVp5TGV4dDV5SDdZdGtTYU9JNmhzWmV4Mk95dDlsMmVGN0RadFZsdUMw?=
 =?utf-8?B?TjYvQXFab0ZObW1MMmM5cThsUktWKzlNc1JvOXhCUC9UMTVsRElCaDJ4aGha?=
 =?utf-8?B?Kzh3UjJub2tVb0ljOFE1d0Nid3ZsNlBGcHRlS09nWWQxNU9CcWs0cTlBRmRI?=
 =?utf-8?B?RjI2Z2QwNVArelVZbE1jVWhVbTkwZ295MklRT05Od0tNZU40UHM1MElYc3Ju?=
 =?utf-8?B?ZmxYc2ZOcGE2SXlSeUJTYUJTUllvT0VpNktIZVhEaDg4NXk5YTFOOVQ0b0ZG?=
 =?utf-8?B?bm1WeGpSL25RZzNDYitDNWsrTzdZME5sVlV0ZWNZK3ZNUHY5RGNFNW9naVVM?=
 =?utf-8?B?d3ZLSDErVWY2NG0zVm1wNHdpSmh0bU9vY0MybnNGTWk0NVZNM1VEaGNRVndZ?=
 =?utf-8?B?OFVOZUUrUzNrcGkzSExIRzBuS0w4Q2JPZ3FuMUtaMUVLQU9IRGRJeS9vb1hC?=
 =?utf-8?B?eGd5WHROcUlpWDltb1FXUThNWm5IMStBQmZKRHJzV0JNRGw2dUNVWDF3dlhF?=
 =?utf-8?B?aXdQcG53L3hLYVdFMHExb2lOMVlkejlpTVBKMEMvck8ybEJRelc2b3N5T3I3?=
 =?utf-8?B?dUsyTm9ZaGRjdXY5dmJlWGNmdHh1azZxL1dLejNXZTl0aUN2VkRrRnZsNWFC?=
 =?utf-8?B?V1R0RzErTy9CNUN5VkV5WUNsU0lFaXlEUnJIbitjUVJIR1lrOU9Jai9sc3lk?=
 =?utf-8?B?OUYrRnlnUm1VNVFodFVkSWpvbjkvWHZrM0tsYU9McjRyZGhJVEo1Y0RWa09t?=
 =?utf-8?B?NnVOZ2tZbmZ0b0d4ZzMxTGdTRmQ0NHYzTDgxeHFPZ01CWnVZajh0TlZhWVdY?=
 =?utf-8?B?SUc3dXluVG9VUjMxakVhZnN1WWI4blhRQWpFMkh4UEtaWkFTT3dGZXUxWnZE?=
 =?utf-8?B?ZXg4Rm54dnRpOEFRdTdxTUJZVmxYTkRsMDhhYnROUG5nbGRQREVxSTdNRjgy?=
 =?utf-8?B?MFQwVWZjOUNqTWhiZnNxVzNLbjRyS1h0Y2FYU05xbW5OcFpOR3VrRlp6d2p5?=
 =?utf-8?B?ZTZxdXVtcXpyN0xkNjdwdWdMTWx0Y1RIM0R5ejdzQ2ZLd3lCdkltT2VuWUZv?=
 =?utf-8?B?eFMyaFhzZksrakFZaS9iVHlxdVBwVlZUdmgzZUZFTk1sekJPSHZLMnBDSmZh?=
 =?utf-8?B?OXJWNFhDL3VsTXdPNnFmRUZvN1U1by9Fc3pTZS9OQ0dIdFlNOVZ6bUtQSThO?=
 =?utf-8?B?T3poZTBUamt0MENUQ1FiOEZVaXh5SDkwSmZjNFZjdE0xS0UyMkdIYldoZXpL?=
 =?utf-8?Q?Ld7baDgSORP3lXHUQ8t1cjSbj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60fb98d8-b23a-42f7-89d5-08dd89403379
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 06:11:39.4600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NAdA2TYSGu3/ZcpZ4e38TaMusK/l5t0XdwQ9J5A9w1k4KYurme8hfDXZryPsENX2n63btJSYI5PGs4TN3o1KgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8048



On 5/2/2025 4:29 AM, Andrew Morton wrote:
> On Thu, 1 May 2025 22:52:30 +0100 Matthew Wilcox <willy@infradead.org> wrote:
> 
>> On Thu, May 01, 2025 at 02:13:04PM -0700, Andrew Morton wrote:
>>> Should this new JFS migration code be wrapped in #ifdef CONFIG_MIGRATION?
>>
>> Yes
> 
> OK, thanks, I'll try this.  Maybe there's a way to reduce the amount of
> ifdeffing.  Warning, contains bonus whitespace tuneups!
> 
> --- a/fs/jfs/jfs_metapage.c~jfs-implement-migrate_folio-for-jfs_metapage_aops-fix-2
> +++ a/fs/jfs/jfs_metapage.c
> @@ -152,8 +152,10 @@ static inline void dec_io(struct folio *
>  		handler(folio, anchor->status);
>  }
>  
> -static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
> -				    struct folio *src, enum migrate_mode mode)
> +#ifdef CONFIG_MIGRATION
> +static int __metapage_migrate_folio(struct address_space *mapping,
> +				    struct folio *dst, struct folio *src,
> +				    enum migrate_mode mode)
>  {
>  	struct meta_anchor *src_anchor = src->private;
>  	struct metapage *mps[MPS_PER_PAGE] = {0};
> @@ -199,8 +201,10 @@ static int __metapage_migrate_folio(stru
>  
>  	return MIGRATEPAGE_SUCCESS;
>  }
> +#endif	/* CONFIG_MIGRATION */
>  
>  #else
> +
>  static inline struct metapage *folio_to_mp(struct folio *folio, int offset)
>  {
>  	return folio->private;
> @@ -224,8 +228,10 @@ static inline void remove_metapage(struc
>  #define inc_io(folio) do {} while(0)
>  #define dec_io(folio, status, handler) handler(folio, status)
>  
> -static int __metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
> -				    struct folio *src, enum migrate_mode mode)
> +#ifdef CONFIG_MIGRATION
> +static int __metapage_migrate_folio(struct address_space *mapping,
> +				    struct folio *dst, struct folio *src,
> +				    enum migrate_mode mode)
>  {
>  	struct metapage *mp;
>  	int page_offset;
> @@ -249,6 +255,7 @@ static int __metapage_migrate_folio(stru
>  
>  	return MIGRATEPAGE_SUCCESS;
>  }
> +#endif	/* CONFIG_MIGRATION */
>  
>  #endif
>  
> @@ -629,11 +636,13 @@ static bool metapage_release_folio(struc
>  	return ret;
>  }
>  
> +#ifdef CONFIG_MIGRATION
>  /*
>   * metapage_migrate_folio - Migration function for JFS metapages
>   */
> -static int metapage_migrate_folio(struct address_space *mapping, struct folio *dst,
> -				  struct folio *src, enum migrate_mode mode)
> +static int metapage_migrate_folio(struct address_space *mapping,
> +				  struct folio *dst, struct folio *src,
> +				  enum migrate_mode mode)
>  {
>  	int expected_count;
>  
> @@ -646,6 +655,9 @@ static int metapage_migrate_folio(struct
>  		return -EAGAIN;
>  	return __metapage_migrate_folio(mapping, dst, src, mode);
>  }
> +#else
> +#define metapage_migrate_folio NULL
> +#endif	/* CONFIG_MIGRATION */
>  
>  static void metapage_invalidate_folio(struct folio *folio, size_t offset,
>  				    size_t length)
> _
> 

Hi Andrew,

Thank you for addressing the issues with my patch and fixing the errors.
I appreciate the cleanup and the CONFIG_MIGRATION wrapping.

Best regards,
Shivank

