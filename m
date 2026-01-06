Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1FD22A1D5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 21:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767736362; cv=fail; b=Bs1YeB6X/QdHP9aySVMsGMsZBl33fbkueR7GpAictVE4PK2+DKlcER2HaeiaedJOYLZw6mvVhYTcp1eqdrFyIBCu0Ct8z9QJu6mj8CtwxPOx4n0xkQ8xT3X6dgHx1MKL2FfzB1DeaWi+o8bANy47d5Kj8XAMzjgBDgbzn5kT3qI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767736362; c=relaxed/simple;
	bh=l4NUMNOToWYpitJzBM0LvndDNvfWwfu+V8yPNcy/rRw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H6FRBiaiZmXVxefMIdcjYXrCX205c4J65BOZFEihBflD7Nbbj837ULkpd55vob06aMyglDfqT7J19yw011qOWNbRPimSleBTsZreuXJDcUtuTaIvN2s8/9A8in9inRjtPSXLw35JRDCxZxk06Ifl/ZMstjAamLnilth8DLIyZ0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Y8PUMq5R; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KNYE6xpC; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Y8PUMq5R";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KNYE6xpC"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606KhAvs387599;
	Tue, 6 Jan 2026 21:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=frpeSsIUOodPL62bW1A6jrcEsZn0GQydOZ3vD7lFPyE=; b=
	Y8PUMq5RmgNEjfxQIeesAimPF2zLBv/HLY93e4zehQr9skCNbY+0kNXExCEZivre
	3V3/tOLlTtl99j+vjXx85ELuy8dtmbhx+tU15mBajnVRWbt/GWgdfS2Thmh9kQFW
	Lpi8eg5NHrFhOa2JeMrCpm8+oAqws/cIoEerhWiraPCVo1pIjHdpUE5JujZQibCq
	DoN1HybpLz9q+3lt1idZRwKu/wdOEdUAx0bYLhy4VMZe856W7S8oFhecBzGxHKP+
	+JX9ozUEEGXpBaBVRm2gkvpfqLWCmNsxllg2eRBk7JWclx/YAqMfSaefQ5eo+u/4
	P0o7zhfn7V4bv/lOFbcB/g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bh9nsg35w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Jan 2026 21:52:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 606JX7id015601;
	Tue, 6 Jan 2026 21:52:17 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011071.outbound.protection.outlook.com [52.101.62.71])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4besj8vc2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Jan 2026 21:52:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fj9MhZ+0cPyQvKe3glITTPI0jeD3uF57fZ0PBPa/6rxhuiz9IYSZaJiKWyaCCL39jTp6xea8EWhG8roysPzxp98y04LDF/uOOdoLlxEbDM+czPOgwanylG4ESDJjwjio+PLaA+22iq2Kn4HxXatvLmO8tE9LB2XW59CXDmVO4p12Hx1jIQXIDQdYPxgn6rPaOCoM4b1/xTnUmFp0P894kWC4CIYEpuisTd0tpOH3FpDvLn1I4+GZsQ8Be9JA1XMbJLYkU3J0kJvruJUpRijOtHQjYsv+CWWEAPqjR9yWJUEEr5dWFoe7n6wq+5Fb2fTcZcbvxxfCBMZHOEqxnsDQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frpeSsIUOodPL62bW1A6jrcEsZn0GQydOZ3vD7lFPyE=;
 b=VuNfQI4t8/fJbwHkwXuZzks6brvK4U/Dpl307xWDLcIMIAz4sydY+ITexuKS5vK8vFb7tjL0Ki5oEQiKskWRrf4EkroPbQxVWI19t6/yz5VO3EVPPbk5k0zTlplt6CkQBpOAlKTEQUhVFCzFnMDk7A5gMLErgyqg2j1gDW1zfDVwii/w29U1CDu4k9WKxdHc6PbN5CmvyT5TSyhvpYOWPxC9//oaTPHvD6Y+UQgd2tjrxjypX7mTVD7QjiU9aFq22RnnbfVwpsbsxTUUTy0DiqEjlnNVqWzWsaF+4dOJHOGweUoAxEZB9HukC5WWoqjNXekg9z6lzrhE1z5nD74jFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frpeSsIUOodPL62bW1A6jrcEsZn0GQydOZ3vD7lFPyE=;
 b=KNYE6xpCl30xVj4dVXls15GEQthodHi3KyplFN/9pZM8OCgyOO9jTo4ewCXIgNtaRg6izw/mkLVBJEbMcuacIFaHSOrObZE21D/GSwVpnh5UE+F6Wj58RiGD0CsMITTdDCQ3LdWNNJb3FNwnc94+QncqsE9PUcLrgXtoyecN4xA=
Received: from CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8)
 by BN0PR10MB4823.namprd10.prod.outlook.com (2603:10b6:408:12d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 21:52:13 +0000
Received: from CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::7c0f:d44a:f68f:2a2a]) by CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::7c0f:d44a:f68f:2a2a%4]) with mapi id 15.20.9499.001; Tue, 6 Jan 2026
 21:52:13 +0000
Message-ID: <5e7c57c3-f08a-4411-bd5f-588a4c548cdc@oracle.com>
Date: Tue, 6 Jan 2026 15:52:09 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-new 224/226] include/trace/events/vmscan.h:238:68:
 error: invalid use of undefined type 'struct mem_cgroup'
To: kernel test robot <lkp@intel.com>,
        Thomas Ballasi <tballasi@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>
References: <202601070540.h0lMglk1-lkp@intel.com>
Content-Language: en-US
From: Sid Kumar <sidhartha.kumar@oracle.com>
In-Reply-To: <202601070540.h0lMglk1-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::21) To CH0PR10MB5113.namprd10.prod.outlook.com
 (2603:10b6:610:c9::8)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5113:EE_|BN0PR10MB4823:EE_
X-MS-Office365-Filtering-Correlation-Id: 77148f56-3796-4c02-e3aa-08de4d6dd970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmRNTTRHMEhOUnZFTExxT0RJZ044TVdLTFBmaEJ6VFdRaDhDNXFDRk5lNlIr?=
 =?utf-8?B?ME5ieTJWeGNhVllXdUxhbVpwQjJmalR5QjlMUXVmNDU4TVovZjY4YTFERUlt?=
 =?utf-8?B?QXF1YmhZSEE2UWtuUmJ4VGtSNkYwYmVEdTdyYWJDUE1vNEE4Q3VRaVFWb0dZ?=
 =?utf-8?B?eFdRdUwzdnJXbmpNVm52YWNrSlVnbmVaVTU2VWMyMFBFVm9UMDlNb0lwY056?=
 =?utf-8?B?K3BtUzhzbXNyZ0d4bmFaTUYxVHRDanBHaGtCZDBqRWw1UHN4TWlPRkJLMldG?=
 =?utf-8?B?b2l4SHNjdlIyTkxTNXRleFFGQTZFVDZuR1VCK0NoWldpMDlBQzJsdlhnR1B0?=
 =?utf-8?B?T0wzM2ZJbzEzNG5pZWFPMGZxb21COS9qTXQ2V3RRdWpCRlEyUTFiSnhwOFd2?=
 =?utf-8?B?Zzc1aXFWTnFXaGlrNEtUVHJrdzEwVkRmTW5WMjFpWUhQdzBYbktWbGlQaFp5?=
 =?utf-8?B?V1RZTDhTNjFaUWVqT3dzUGsrc2NwQ2pIWCtQMVRjeDF0WEoxL1NlZ0FWWFo3?=
 =?utf-8?B?bkdkOVRJMjVuLy9PaG1Cais3c25HQXhUTHIxWjhRMDZMNENjUFMyZ1pDRE1S?=
 =?utf-8?B?cERPT1RKb0x3T2U0bDgwek5BZ2JIVnVFT1BLTExVNzRQK3h0MzJFcVJiRGtj?=
 =?utf-8?B?N2taYXlNVWVJd2Zzak9SSFdzVlNpYW43WW5ic1ZOa3BWeFhCNDF2RFRNMngz?=
 =?utf-8?B?UEpwMXhXUElDc3F0cVhmamtRbk5WWS9ocG5vaUNKcDkxSVJqOUxpNVZDNndC?=
 =?utf-8?B?aHJsWUdBZkd1NWpjNEFUTlFyaWZZUENBdHg5TEV1WGhONjAvSUlkVDFEbnlH?=
 =?utf-8?B?OWV2R25vRTNmK1ZkV2ZoR000alZXOWhOUUVqc3d2WGZTSjZ2eHJNM0FlVzU3?=
 =?utf-8?B?NmdEOFNwREw2OHYrOFMraG1mK0l4cnVkSDRxdzNBa3VGVFg1K0dXdTBjblNX?=
 =?utf-8?B?RlNPWXJwRnBmNE9CVVdMUzdRRlh0OWNJMHJ3M1J2WjdrVlNZOTV6citJekZw?=
 =?utf-8?B?a0tYbmE1VmlwTk5mMnpnYkhSVm5MbXJCOXFKRE05RFQ2cUZHcXpHcXdxeitR?=
 =?utf-8?B?SGQxM2E2eXNPZHVtNXdpUHlXUjB5dlZ5VS91REZIM2gwRVZZeC9wSzBPNE1T?=
 =?utf-8?B?Z3ovak5MN2MzTUcrTElUWTRVd1VDOStTVnJrWDJEcng3UmNzbmZVOGR3bElM?=
 =?utf-8?B?SkJKVklRVTdSRzRmNHlVdE9MZWlzbGJ0UndLZ3drNExKVTV6RUpmK0l6S0Rr?=
 =?utf-8?B?VTcxUUx3MUFvMHdrTHM0Yk5hR0E4d3VSY2NFOFN2VkhObzBrZk9DZ01XdlZR?=
 =?utf-8?B?NnZydWxWUHFoZ283M2lORlhleVpDVXhxUFNwV1BNOWYwTmdUQml5TFZLYTVr?=
 =?utf-8?B?SEd0YVNXRVlWYXVkZ1o2bG5MNm53TlJKWFVNWndXck42bnNxSnZxSU40eWxE?=
 =?utf-8?B?aG0yUTNmelpydkN2V1ZGR1I3VHQ3eW5BaEFRL1Y3cFRjNHdxUHBHSjIwMllj?=
 =?utf-8?B?dk9Tak0xSW1GRDhQNEJtZGJUK1lrZE1jMk12cWVKQk1sZ2xGTnFGNkd5eVZq?=
 =?utf-8?B?Y0lpNk1nOFhqZnlSdjUzRFJjc2wrZWJMbCtiY2duOHpZQ3paYWJubkRzVG9F?=
 =?utf-8?B?UDF3NEs5OWwzWTArYUgyVUFBcHg1SlJnL2x4Y0lVa053UkR0VVk2d0NLTm1p?=
 =?utf-8?B?ZUswbTBEQ0U5QTVDTW5VdzlEZVZmZlZGNy9Gd1hOUVMydklGTWozVzRhYTJM?=
 =?utf-8?B?R1NaMm5ndUREWWVnTlA4a1pNMXFwRnBCcTJuQVVROTY1RW56UUgwZ21Pa2tL?=
 =?utf-8?B?dVVidFlOR3ZQaDV3eUk5K2w3OTNmNHhDY2tPY3VaZHNFUEVzVXFTc1VUWm9Q?=
 =?utf-8?B?bTBHRHA5WXdzakZZREppeVE1NFl6cW1aa29NTDhoQk9pVkVGTlBpd3NnblpU?=
 =?utf-8?B?eDFGblo5NTNQUWVuL3lhTEt3ZHoya3Vya096NENYajlyTDFQc3plZWE3V0M1?=
 =?utf-8?B?SU5zU3VNdjVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5113.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjdVSW5hSWpRRVhLbHYyRUlKUjJkdDA1UnB2QWZzNTc3OEhaaTJOb0FYcDNV?=
 =?utf-8?B?YjV6akRISjlpL3FkY21IY2JUMmlFbld3UkRwczFTbjEvNXBuUDd5cmpIeXpI?=
 =?utf-8?B?SXIyRkt3K1o2dWJPV0UyNG91OGY4U3ZVM01vSnJBdXhUcDJWemRIQU1rbTkr?=
 =?utf-8?B?NjByeWptNitYQXRLRHhwUzRxanh2ckY2RUtqK3IxbDhuTzkyZnZDdGpsOUlZ?=
 =?utf-8?B?MngxWWNOWUIrZXpHbEt5VWN6dmd6dmkzNnZ6eFcxR1Nvc2ROdS94VFdxUTFY?=
 =?utf-8?B?S0VyQ1RKKzJCOS9JTnk1a1JkN2IzUmhuOFB6OGtabUhSUDV4aU1CdEpORVl0?=
 =?utf-8?B?TExzSlhrZml3SFRTTXVreXRCMWxpUTJDc1VqTHdmdXMwTmtSWHdQQzVweFR1?=
 =?utf-8?B?OTZETFp4YWN5a09ucVR6dFE2RkVPUHlRMTBSdXQ3MWRXNGthQjg3UlFXQmRP?=
 =?utf-8?B?b2lMUXN2QjFSRUI0cTFmLys3NmNxeW5WYnNtOXJuSm9MeUJ0NXBDS1g3Zysz?=
 =?utf-8?B?cVBjWE5zZUFMWGh3ajl3NWg2TzZCMkNkbUZIV1U4YkRVcGhyemowbTBxQ3c3?=
 =?utf-8?B?YjlMQmNoNFl2V2FlRDlUdzd5YUNEV0psWGFMeWRCN2t2MjZmNXRqbXVCQ0dO?=
 =?utf-8?B?eHVDZzcrMTAwUkQxcmJTakozbWI1bnZhZHdiUmwwblNtSTMvc1BXMENMa1lB?=
 =?utf-8?B?U2JXTmZZMU80cXJmcHZ6NzdlblhaMDBIS2dEbWFiYm12MHNSMEdZN1A3N0Vr?=
 =?utf-8?B?dWpXWHFEbEZrQWpFT3d2TDFzVEpxb25ob01GOVBWYzJCOE1QQ21BQk5Gck5t?=
 =?utf-8?B?TzBQWXZIVEt2NDUxcnp6ZWl1S0NZNDk1a2s3RVhRbDh1S29nN2ExQTVnOElz?=
 =?utf-8?B?UERaL2swMVJYeDVWSEtYUWxJY2FOYTE2M3ZPNGJnbzVYczg2bG1UM1NIbG9a?=
 =?utf-8?B?a2JMQlZNRVhGdlJyalZBM0xFZjMwVXplNVJMN1hUdG1VeURXRitFZzQ1VXEv?=
 =?utf-8?B?RjBzcTI5d1BYT01qY3dDangwN3Y2NHUzZkFsU0d1a2xZd0kxQnFCOGN2MjUy?=
 =?utf-8?B?U2xwby8waTF5aHMxN1ZJV1I5Y0xiMEU1K21xclkvekc1Rll4V2FMNlVuU1JS?=
 =?utf-8?B?RDBFZVV2QXdZR08yWW9HREVKcUl6MTBpY2NXZmlzaUhrVzNmVkNtYmZIalNw?=
 =?utf-8?B?eXdwbE5lanJ2ZjAwNWxRRWp0a1lURzVjakphYk9EVHd5dmxCVWpKYm9rOHpY?=
 =?utf-8?B?VXFodHUzckVaN2k5Wnl0WldnODdSdWJYM0NHNEJSeWVxaDlMQjBvMzFJVjFl?=
 =?utf-8?B?dnVFVXFLWmorTFhkRDdoS2pJMWtsQ1hVM2pnemJRRXA5enlpemttaXdHLzVa?=
 =?utf-8?B?SGY1SDBXYTNXQkNCMUpVVnZ1ck5LYlg5SWd3VzB0OEdNN2UzTXlzeHdxT1dm?=
 =?utf-8?B?ZitZK0NvWVl1cjNxSHlGTmJoVFNoc25YK2xKUlV4Tmg0YnA3d3Y5YVRRMVJD?=
 =?utf-8?B?UjI5ajVsb2prMGxOcnJyZDhhQ2M4R0ZNSklkQ3JTK2F4TWhmMmJFZjUvYnRh?=
 =?utf-8?B?aU5xbFE0VlgwNkl3aFBJWThCSFRhTGpKNkNobm96TGtMd0cwKzI5dk13b084?=
 =?utf-8?B?cjlBU1YyOENDMGEwWC8wei9mTHExc0JqM3Mzc3l2eGNsTXFmeUJLTkdyMVBn?=
 =?utf-8?B?emtIQzkxa2M5UjZYWFdDWVF3a2s1MGJpYTcxYktCMllUamtwdlFBbDE5V202?=
 =?utf-8?B?dGVQYlRtdld1M0JqZUUvMFU3TGxXUCticE1IKzR3eW13Y1A4ak1MWmVuL0Vz?=
 =?utf-8?B?NE9SUnMwOGljNURRcG1INE16TFVBOThnbW0yaDF1cVFVd2JlSUZMVWRmQTMw?=
 =?utf-8?B?WkNBQ1NVZXhrdVlVeGJ0a0pwQW5mMEFiQlJtUHNseUwzNVQ4UGxJMkx4YUNH?=
 =?utf-8?B?MjVHQW5EMVg3Sk5aQXlxbVp2OWdqNVJISjdBZFZsUFpTVGdYM2VhVkE0TXlp?=
 =?utf-8?B?cEcxWUVIdno0WC9GMWdkUFRLb0hPS1hucTBldXBGODhEemM3R2QyeVJocUFy?=
 =?utf-8?B?QXR6K0tKaEc5SXU0SzJIMXpyNUxmaVltYmN6MnBUYTNLY0RZcmRqZ1JOM1BZ?=
 =?utf-8?B?dnBPc0NWTzFIbjdTWW5RT2lBZUV4U3BnU1dYcmd5c2JOS1Jnb0dLV29sSUZJ?=
 =?utf-8?B?a0NuVS8ycmJyemRlcUF4VXV0citpVExqK0JXQmJZeDFRYXJ0L3RHZGlJRFhY?=
 =?utf-8?B?bW5Jb20xMnNoNEJ4VlYybjMwWHJBZlhGZ2VnZWZmaEg5TEF4eng3Lzd3UnA1?=
 =?utf-8?B?d05raFlqcTFMMmNkRHV0SXBNRGp2UVZjNWtyMmFocnUzL2pSSEwwU1JMYloy?=
 =?utf-8?Q?Ps6es7lgjvagAIOg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NxU8ZHjyR93MVR/egr3kT/+HcrLwA7pL7Geo2xYayrI8Jejz3toLPaPqlroHTaTFUMLgw8hDDSN3TQv4gjK5jOuG2j1IkZlqufOivfDCkky7oKuyjPMvnc9ePlk2i459qsIc6khl9/SfRh83xopqh0/Nwe13VWQVr/S7HD1ZmgoTfKkdKHGf7phBqMTIyCZIotDBsH5UR8ikw7k7/BomyRggINSHqzthwkHFUWw9MdFGpoVtXlkem1SsKRVmHdQY9o2Ae2xR9a0n4IesTCsYH2y+CO7t+RskvPFqubaVhXf1Qebw7VbLzNhhX3Xlgvs4JZ/4ExP8aPsz9/6jHajoCQnX5Cq155cZpFZSPxRk3cboiqZS7gUPyZqOHl/V5GtP/l0VbiGeHKPUrZUohU3fM93xfqoNUeRvJdZELjzMIAU7N0UR4L69UhXWzpD1qaKDLIm7XAtTSeqLKj+450DR43z4SP8jijR9DZLWgjbD2XrRTmYqWIqlBep8yfsb7av+N2t6+q/8m61ftSZUiSS8/j8BI5+g5l4XUWiRmj9ETzVZRVyrF+aSOW18HfhwcfgTab8Zfjmnyxqz+gOGqYsGz0UvhU9nMZimwGhqzhmiECU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77148f56-3796-4c02-e3aa-08de4d6dd970
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5113.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 21:52:12.9901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaJdxywNW+RqNNxtt+ColyiE1FN8/TVXlYqnwQ3FPex/fYiT9PTCt8fsLQI00lt0dMvUoCC4YmBJARxzTjO8SmvUsBHTb2lb3Y2BiKv3kGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4823
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601060189
X-Authority-Analysis: v=2.4 cv=JIE2csKb c=1 sm=1 tr=0 ts=695d8412 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=e71-66qCMWAs1GUZQ4IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: zCesJPSyctiTgVc2hPT2CmqsODfoBXuk
X-Proofpoint-ORIG-GUID: zCesJPSyctiTgVc2hPT2CmqsODfoBXuk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE4OSBTYWx0ZWRfX3vgGbLFe5UvH
 Yogk0mHzxb9l2+gZulXW1jvFXuhlHDkO6TI1dWleSO7gRzl936H5BCGYS8iATeUYAqXLJA+1jLY
 aDxmHzgMXH74zo8kO7cM/us0b2W4l3esfSYGTk6bf9PNd6knnlgOpudkaH/uXdjVIozItFUttfi
 C4ejfp//3ed5MdydWDB0tmJ8Hm97SkSfrSfTYM165exog/SN7w621F0wnHniwojNALKUkAbDaLu
 ImtcwybTcyNalrgT0+Pg7Si7dcvMuPcV5Vib5x4rv1qgB3h5xZdKUxTbLvX4vsjTUtU6EGZDH0C
 QfoxICQHgPyeLIkKJ/9JNluGRTx4+sOEpJU+syat6l/iBkGVIU7Ts/01sRmywDXx9kzTofZI89T
 fDqG8NcNgCDwJ/Hacw3+iGfFuhY9np4FGxkQmAEvMVBwo+ELOmhrYSxQds1O802G042FqnDekmN
 nk7wuX81ptWB7g0413w==


On 1/6/26 3:41 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   d51d3f6765d29ab5cdc6a59ad832017e660d5add
> commit: b84bca52c8e661aa7da507a03cc3f6831fef2edf [224/226] mm: vmscan: add cgroup IDs to vmscan tracepoints
> config: i386-randconfig-011-20260107 (https://download.01.org/0day-ci/archive/20260107/202601070540.h0lMglk1-lkp@intel.com/config)
> compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601070540.h0lMglk1-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601070540.h0lMglk1-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     In file included from include/trace/define_trace.h:132,
>                      from include/trace/events/vmscan.h:554,
>                      from mm/vmscan.c:73:
>     include/trace/events/vmscan.h: In function 'do_trace_event_raw_event_mm_shrink_slab_start':
>>> include/trace/events/vmscan.h:238:68: error: invalid use of undefined type 'struct mem_cgroup'
>       238 |                 __entry->memcg_id = sc->memcg ? cgroup_id(sc->memcg->css.cgroup) : 0;


I ran into the same issue when trying to build mm-new with # 
CONFIG_MEMCG is not set

The below diff allowed me to build, but not sure if the correct fix:

diff --git a/include/trace/events/vmscan.h b/include/trace/events/vmscan.h
index d438abfa03eb..7b8af2a9688a 100644
--- a/include/trace/events/vmscan.h
+++ b/include/trace/events/vmscan.h
@@ -245,7 +245,9 @@ TRACE_EVENT(mm_shrink_slab_start,
                 __entry->priority = priority;
                 __entry->nid = sc->nid;
                 __entry->pid = current->pid;
+#ifdef CONFIG_MEMCG
                 __entry->memcg_id = sc->memcg ? 
cgroup_id(sc->memcg->css.cgroup) : 0;
+#endif /* CONFIG_MEMCG */
         ),

         TP_printk("%pS %p: nid: %d pid: %d memcg_id: %u objects to 
shrink %ld gfp_flags %s cache items %ld delta %lld total_scan %ld 
priority %d %s",
@@ -290,7 +292,10 @@ TRACE_EVENT(mm_shrink_slab_end,
                 __entry->nid = sc->nid;
                 __entry->retval = shrinker_retval;
                 __entry->pid = current->pid;
+#ifdef CONFIG_MEMCG
                 __entry->memcg_id = cgroup_id(sc->memcg->css.cgroup);
+#endif /* CONFIG_MEMCG */
         ),

         TP_printk("%pS %p: nid: %d pid: %d memcg_id: %u unused scan 
count %ld new scan count %ld total_scan %ld last shrinker return val %d %s",


>           |                                                                    ^~
>     include/trace/trace_events.h:427:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
>       427 |         { assign; }                                                     \
>           |           ^~~~~~
>     include/trace/trace_events.h:435:23: note: in expansion of macro 'PARAMS'
>       435 |                       PARAMS(assign), PARAMS(print))                    \
>           |                       ^~~~~~
>     include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
>        40 |         DECLARE_EVENT_CLASS(name,                              \
>           |         ^~~~~~~~~~~~~~~~~~~
>     include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
>        44 |                              PARAMS(assign),                   \
>           |                              ^~~~~~
>     include/trace/events/vmscan.h:206:1: note: in expansion of macro 'TRACE_EVENT'
>       206 | TRACE_EVENT(mm_shrink_slab_start,
>           | ^~~~~~~~~~~
>     include/trace/events/vmscan.h:228:9: note: in expansion of macro 'TP_fast_assign'
>       228 |         TP_fast_assign(
>           |         ^~~~~~~~~~~~~~
>     include/trace/events/vmscan.h: In function 'do_trace_event_raw_event_mm_shrink_slab_end':
>     include/trace/events/vmscan.h:280:56: error: invalid use of undefined type 'struct mem_cgroup'
>       280 |                 __entry->memcg_id = cgroup_id(sc->memcg->css.cgroup);
>           |                                                        ^~
>     include/trace/trace_events.h:427:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
>       427 |         { assign; }                                                     \
>           |           ^~~~~~
>     include/trace/trace_events.h:435:23: note: in expansion of macro 'PARAMS'
>       435 |                       PARAMS(assign), PARAMS(print))                    \
>           |                       ^~~~~~
>     include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
>        40 |         DECLARE_EVENT_CLASS(name,                              \
>           |         ^~~~~~~~~~~~~~~~~~~
>     include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
>        44 |                              PARAMS(assign),                   \
>           |                              ^~~~~~
>     include/trace/events/vmscan.h:254:1: note: in expansion of macro 'TRACE_EVENT'
>       254 | TRACE_EVENT(mm_shrink_slab_end,
>           | ^~~~~~~~~~~
>     include/trace/events/vmscan.h:272:9: note: in expansion of macro 'TP_fast_assign'
>       272 |         TP_fast_assign(
>           |         ^~~~~~~~~~~~~~
>     In file included from include/trace/define_trace.h:133:
>     include/trace/events/vmscan.h: In function 'do_perf_trace_mm_shrink_slab_start':
>>> include/trace/events/vmscan.h:238:68: error: invalid use of undefined type 'struct mem_cgroup'
>       238 |                 __entry->memcg_id = sc->memcg ? cgroup_id(sc->memcg->css.cgroup) : 0;
>           |                                                                    ^~
>     include/trace/perf.h:51:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
>        51 |         { assign; }                                                     \
>           |           ^~~~~~
>     include/trace/perf.h:67:23: note: in expansion of macro 'PARAMS'
>        67 |                       PARAMS(assign), PARAMS(print))                    \
>           |                       ^~~~~~
>     include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
>        40 |         DECLARE_EVENT_CLASS(name,                              \
>           |         ^~~~~~~~~~~~~~~~~~~
>     include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
>        44 |                              PARAMS(assign),                   \
>           |                              ^~~~~~
>     include/trace/events/vmscan.h:206:1: note: in expansion of macro 'TRACE_EVENT'
>       206 | TRACE_EVENT(mm_shrink_slab_start,
>           | ^~~~~~~~~~~
>     include/trace/events/vmscan.h:228:9: note: in expansion of macro 'TP_fast_assign'
>       228 |         TP_fast_assign(
>           |         ^~~~~~~~~~~~~~
>     include/trace/events/vmscan.h: In function 'do_perf_trace_mm_shrink_slab_end':
>     include/trace/events/vmscan.h:280:56: error: invalid use of undefined type 'struct mem_cgroup'
>       280 |                 __entry->memcg_id = cgroup_id(sc->memcg->css.cgroup);
>           |                                                        ^~
>     include/trace/perf.h:51:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
>        51 |         { assign; }                                                     \
>           |           ^~~~~~
>     include/trace/perf.h:67:23: note: in expansion of macro 'PARAMS'
>        67 |                       PARAMS(assign), PARAMS(print))                    \
>           |                       ^~~~~~
>     include/trace/trace_events.h:40:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
>        40 |         DECLARE_EVENT_CLASS(name,                              \
>           |         ^~~~~~~~~~~~~~~~~~~
>     include/trace/trace_events.h:44:30: note: in expansion of macro 'PARAMS'
>        44 |                              PARAMS(assign),                   \
>           |                              ^~~~~~
>     include/trace/events/vmscan.h:254:1: note: in expansion of macro 'TRACE_EVENT'
>       254 | TRACE_EVENT(mm_shrink_slab_end,
>           | ^~~~~~~~~~~
>     include/trace/events/vmscan.h:272:9: note: in expansion of macro 'TP_fast_assign'
>       272 |         TP_fast_assign(
>           |         ^~~~~~~~~~~~~~
>
>
> vim +238 include/trace/events/vmscan.h
>
>     205	
>     206	TRACE_EVENT(mm_shrink_slab_start,
>     207		TP_PROTO(struct shrinker *shr, struct shrink_control *sc,
>     208			long nr_objects_to_shrink, unsigned long cache_items,
>     209			unsigned long long delta, unsigned long total_scan,
>     210			int priority),
>     211	
>     212		TP_ARGS(shr, sc, nr_objects_to_shrink, cache_items, delta, total_scan,
>     213			priority),
>     214	
>     215		TP_STRUCT__entry(
>     216			__field(struct shrinker *, shr)
>     217			__field(void *, shrink)
>     218			__field(long, nr_objects_to_shrink)
>     219			__field(unsigned long, gfp_flags)
>     220			__field(unsigned long, cache_items)
>     221			__field(unsigned long long, delta)
>     222			__field(unsigned long, total_scan)
>     223			__field(int, priority)
>     224			__field(int, nid)
>     225			__field(unsigned short, memcg_id)
>     226		),
>     227	
>     228		TP_fast_assign(
>     229			__entry->shr = shr;
>     230			__entry->shrink = shr->scan_objects;
>     231			__entry->nr_objects_to_shrink = nr_objects_to_shrink;
>     232			__entry->gfp_flags = (__force unsigned long)sc->gfp_mask;
>     233			__entry->cache_items = cache_items;
>     234			__entry->delta = delta;
>     235			__entry->total_scan = total_scan;
>     236			__entry->priority = priority;
>     237			__entry->nid = sc->nid;
>   > 238			__entry->memcg_id = sc->memcg ? cgroup_id(sc->memcg->css.cgroup) : 0;
>     239		),
>     240	
>     241		TP_printk("%pS %p: nid: %d memcg_id: %u objects to shrink %ld gfp_flags %s cache items %ld delta %lld total_scan %ld priority %d",
>     242			__entry->shrink,
>     243			__entry->shr,
>     244			__entry->nid,
>     245			__entry->memcg_id,
>     246			__entry->nr_objects_to_shrink,
>     247			show_gfp_flags(__entry->gfp_flags),
>     248			__entry->cache_items,
>     249			__entry->delta,
>     250			__entry->total_scan,
>     251			__entry->priority)
>     252	);
>     253	
>
