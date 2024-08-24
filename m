Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C05EB669
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Aug 2024 19:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724528754; cv=fail; b=WMtOIsioBs/666bb9MceqmUJSESU4j2mZrLhSusVM75GxRX9dURdPMJD/qUU4BXq2q99Or/fGSC2Z5VXEUE9+v/qRN80deDpx03cO9XkEH/wndcRNbxeY74O+kdNfcWv3PQm5yD1cYWeF6u0xhYnnD4hdsBSHZKLf4kqZs8RTQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724528754; c=relaxed/simple;
	bh=nrxp5iquB4sxFY5wEY5QVNfZ/L6HDgxvyNLTDCFF50I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Xjn38SeNCPTVxWkkP/4N16nX7P7Km2t3oCMzTC26o4pyiuS83z0P3hxKSfY99A0J332x9LiMeCWEK+6gBlONAav7SfF6PEJiLEmdimfy+5morNGMmsLV0CYgzM2SWmjssB/6PInBmkE8OTPnD/+N40CJUGey+G49XuoFfJSVzgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=J/m4wTYt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=EU+diqyN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="J/m4wTYt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="EU+diqyN"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47O3lXLN007864;
	Sat, 24 Aug 2024 19:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=gD9K50mFsWbPxRP
	0mzHQ8uRJdgHcbiZxhMx09RPFe00=; b=J/m4wTYtZkTgxYAaHp+5CIwgCdKBXzq
	2VhATl9D27j1UwWujjyNyHlaHoXN1JUmbjpOfEO/XMpCCYg/3K+/Q/B5wXObcnaC
	/otLz999/8UVYx7rUh6mAmVweAx4s/X3gt0mfkkFRRz6rtDmwqSViTz+8km8h2Vb
	pQlqL5AiTFv3ifj6dbjeiSeVyliYMRtP9q6nJsHMGv1wUZHiTUneeulbwn6lTJW5
	7UY6ApW8uBWGGqXpAKiC5jriKG5oSJdsFX7k2qzEcAIpo0kSrgEebbha+X/2Ywhh
	8DA1IRPUPOJdYHad+4S/FbXhqlulPqWJ2k/+tNsd/0MbstrPPJMHWyQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4177u6gm5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 19:45:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47OIYCRQ001416;
	Sat, 24 Aug 2024 19:45:44 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 417mwp8xyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 24 Aug 2024 19:45:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dsyFCuJpHT7ji4G1aPeAtnWqn7kX6bVzF6OgY3rpZchMdUQiEfFVpdM25nQOkX6s+nXFJufZIRlE67TZ8wfQgVsiKlxjwTcyzaf+5VgFUzrfGM4NWCHua9pEBUN08n0JXWz9lS9zs7bQ2Gz/i/2o/p27vqS9DZsQ9hrm+rOOjvftgumoKblYvnbxJoSviYBHdNtrznXdzq38Egydc0qRcLyOYtR33ORUb5ZX0nKq0mNzFoSIG4UAMAjpKwz0tUIUHCpJpF086x99FzvHhCfHtL5Iu1P6XWqQp55r/PKR75AGJ76+xsK1Jy15RTHekRchWUUwonltrHxThCrMHDgO5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gD9K50mFsWbPxRP0mzHQ8uRJdgHcbiZxhMx09RPFe00=;
 b=qZ4KG4vI5AISeAw/cLlSNzbGwwmDtXnCxM4c5+C7ty7JIV2uVKpTGFBAySGtP590bC5IP8xvr1yldYD+Tax6O4nVZVBrpJBkIZmFt5iDnAcdhcrQzWbpC5qJbrpnU/zfDiNOc3ADQ1vjmgiTp87wnzFUW6Q5osueQu+8XhJavA1jpIaANsllG6zhYyVtrGb5N3siEfYPpcKiZLDx4k6k1Uy1MV57TqxKgPwvq8JYY54O4DS5AndD4PTqFFDBRpYfhFrU4mJM3pFymfec8eweGranO38eX+dm+HaTtUf2qNoJA50Bu8F6QcC5ku4F4VRyxZShlZiy2JAnZ8bbNnQkVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gD9K50mFsWbPxRP0mzHQ8uRJdgHcbiZxhMx09RPFe00=;
 b=EU+diqyN7Ez/TZLf6UmYxVbic6Lthj6wfiaEWDEEB6aN9Bq6ugTvDxLlybF3DA7Or0Te4MHdKkXU/Zk0vghpr30eM8s3Ew/3HLxzIpLxWaBTwvtVXthPHet55rnjQg5MudZr2ugfSrljohQ6jFO9FweLRi7jJFTShPbV/hdQXAE=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by DS7PR10MB5038.namprd10.prod.outlook.com (2603:10b6:5:38c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.9; Sat, 24 Aug
 2024 19:45:40 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%6]) with mapi id 15.20.7897.014; Sat, 24 Aug 2024
 19:45:40 +0000
Date: Sat, 24 Aug 2024 20:45:37 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, oe-kbuild-all@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 357/379] mm/vma.h:113:28: error:
 'FIRST_USER_ADDRESS' undeclared
Message-ID: <a71515a5-a639-4850-a505-1af2a48896ca@lucifer.local>
References: <202408242304.1A1fXTgE-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202408242304.1A1fXTgE-lkp@intel.com>
X-ClientProxiedBy: LO4P123CA0369.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::14) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|DS7PR10MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: f713922b-1c1e-4f61-19af-08dcc475557f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gLVpl7fGjtqzYaRBx5UeKQ66MP/2coPDjjJjN452EFErZmv1OvDdBFXNXfsD?=
 =?us-ascii?Q?YERv7tu6P/TM4P08HUaacGt5WpuGDzWxipJYOa2X1K3viU2FhmXV8ijluKUs?=
 =?us-ascii?Q?XO+/5ZKqFJbD0T7snSacrwDNkoJbio2seF9Qlwo+TeOUlckqG6yxRs8/X2eW?=
 =?us-ascii?Q?s+nWF9d/BlJa+E9GtCu/rPhrYzu7CxfISp5nhopcA+ysoJvYUXV0E4wX8Wgz?=
 =?us-ascii?Q?GPVomswfIDTxpLl9yb9+B//9TpgwqbqAd9B7o/Bdyp+wPvN2lqbXYh3htKo6?=
 =?us-ascii?Q?384b34gn31zrRo+fxKtcNaoUfkbQ6I8DnpLzSgxpeL57jIblT8swPCBBLSpR?=
 =?us-ascii?Q?dzV1SoIYpnkr3yEBNaVyc9DfNkwqzud7Ip5JHtm4zLwMDoNtA15EjIOQRx3Q?=
 =?us-ascii?Q?LqwSAnAu07aP92/tKcDKTZRfpcMe2t9vsqRyI+At1WMvQ74/9cL9V4luTQnX?=
 =?us-ascii?Q?/xU18zspX5jgYDBce4BXoNwUd5F2xCPRlK7n70XQgboh0ho41wJd+MovoQWF?=
 =?us-ascii?Q?ZRZE+X+W93wJq3SWd1wAEhyzR+Rl5TMSyhlauJ7ceBjXnHN/YDykkejSJSt/?=
 =?us-ascii?Q?3lbLIjqkILx1LFQs4/Z1/J0S+it09SlnvOHbC46BUwet3gDnFIWzfRinNf7G?=
 =?us-ascii?Q?f6jHOC7N02q+fIsjEBHer36JhzKiMjeCdzbuqkClWxgavAgAjf5GMD6d6Ttm?=
 =?us-ascii?Q?1FMGMtJTjPEC7cIc49EYfJEh9R7RLh1QPKiRk5ymogojGeeLCf3nSZClCCKK?=
 =?us-ascii?Q?OeGZ14Ia6VNHcRZB7miOGTmJrrqv3qwBduAyptz05VxA/fdh0vNCQdw4oOwV?=
 =?us-ascii?Q?7j89GFHYTaKXQNk2abOnUXTEOy0SRdIg/FUi2ZmPwxbChv1rJS4O1DtHnJnN?=
 =?us-ascii?Q?L0T7eXcllroMpTr1MqH7JcaQ2GsJB40T9/H5MEPZzhTtwmRJ3HRVOa0mX2mZ?=
 =?us-ascii?Q?1VP8BANu5ghlaFnehNg/lctQByh94OlAq4lnyk5MV2vHScyZhjVPiRbqzX/3?=
 =?us-ascii?Q?dwgTED1uGKcKpL8KX+dEMKOjMswyFjkw2AagUWrqt0GFQRqDRt6JsZlgVMnK?=
 =?us-ascii?Q?8DKZJ2Z4ScN+ScsCfWvLtXi5jLwuZ3MyAKgHPokCEuKgvOTT+1yC5JPknvFI?=
 =?us-ascii?Q?/bUHUzsGz0dIvRhtkVuG4AO0vHQtk3/rKRVJe5CTnNp/1l+UU9sPC/Qe6iB5?=
 =?us-ascii?Q?9p56H44YkIkIhlnwr4zLkNzwtIIIFOl/AaAqI9df/TWYBiEM/tf52DyY8YvT?=
 =?us-ascii?Q?170wPNujKZA9fPAcrYuLwi1ij0YRi90hiPJiD9B+DnCtTeUVXoBh8VRFPpx/?=
 =?us-ascii?Q?JtooTQSTPZEAxuYks1w56V1d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jhgPjoOOTb/C3rYwKrIVls5ACJCjNYCvxhibM8SF2KsY7ftHFUfOCZiKQ4wn?=
 =?us-ascii?Q?p58WkrKpxPMAiGP9JcgNqxkUynD0FhlocdrUQbgWeOhb0Z8gGtuMAmaWkzhz?=
 =?us-ascii?Q?KtMk6xopKQVVfEwEzREQt6CvvAE2UBrPWAtk1gfoerc5GPe+AAEiw3IyFPIu?=
 =?us-ascii?Q?poIFch0OufCQlEpQq5txHXU3mXN/f2NORhRZTaeH46KNKBG88S3mmW8gdonV?=
 =?us-ascii?Q?DyiU40KM/Z/DXFsg3zZ4vAFqla5LkqU7KOnw8mxRS3rJHK2JzRwzbLQunl47?=
 =?us-ascii?Q?B6S6erHJ7iBGcqXe3G+ShxyHYyEVIu2v/E5VUbRdW3oWsOweygEqVT3YD0r/?=
 =?us-ascii?Q?0q07ndNDqsf8L56cYuAshXO4bs+dKzA2Pdcx84NQ4IUSB+E6fieWCYqn8hQH?=
 =?us-ascii?Q?sufD2aF5TQQkfK+TXJpDoAOmvws015AZ2Z7DRUxyah/F9MY+EHJHvWFB93Q3?=
 =?us-ascii?Q?zJKWrZzhVUHctpAcWaEVYZws+MUKpgQxXZ0skUuijd21K1vR1AA+FKivhRZf?=
 =?us-ascii?Q?4tklaDNxfrVC1ovDhSCoeRHujhHzHEDGNkCHjaEiL8oFRU/lBE0wbrTSn57+?=
 =?us-ascii?Q?IVMZb82gmcjnUE88KDYtBm3AzTEBgJSryZCYyE96b0S7OViyeTV6ItDdpxxG?=
 =?us-ascii?Q?EfrIEhnYZJ5F+jMDxxB+mVu3xFH6OUOD3RszFtFc66UvVRLQTFTTQjsdsQaE?=
 =?us-ascii?Q?jYjyHHeYpBhI7gDF4NlBAVheQrW60JumdwU6vzkZoinxC64rS5YRxy9oAtQQ?=
 =?us-ascii?Q?Fkc70t3jhgkapbeHdU4+l3AdpyU8e3Zt1RGIQRRNwR5URap37epi4j85sBtb?=
 =?us-ascii?Q?1UUiAvMwWUdOvGAUS9qp6LyBJLDMzY8eegWT7/q9RKVr2xjs9jTg4E6fPSII?=
 =?us-ascii?Q?vUHhPHzgPWEfPA26UdavL1j085abEtE6R5J2ysdFlCqrzmQQU7mszY2R2npo?=
 =?us-ascii?Q?or+jUPIZEnpr9ZGWoZHYgvllIsaiE3aZqVK9iFiTOy7ED5MTC3XG5RNDxpA0?=
 =?us-ascii?Q?lGkTR+nhX6hTbG/H3bFJ0FE2fDJxmvxkBC+1y/RR++AxfeAmgoRy9ClDugX6?=
 =?us-ascii?Q?RpKS6lUdlvGy+VDTYPv+gmhXPkoYcHc6w9ryV6JgSAC2X7w1/U57FHI4cNEu?=
 =?us-ascii?Q?jYCIod0m4Obu/rbRonZEbZ7r0C577tz2wJk5lQz5K3BoPn2z+/S1MiQJpjxy?=
 =?us-ascii?Q?txd38LpRXT9SqIRwg2StlYOQd40ACVscuW6fivEkQN+c00DpwMaGS2TRSBVy?=
 =?us-ascii?Q?6x9C6+e3fiUR2GdBMkteFvKewxkVuiDijF7sbJu0ADOWO8HegjCnWHoyuSWL?=
 =?us-ascii?Q?gasZKMywfzSQrzQBIUj+KOvv6IF40wVJUya+RqGmP9LuNTanGbPbSbkJiKhc?=
 =?us-ascii?Q?HnaA8p+HE+ekOBHagQqZ4QihB/qyTAxlFPUYtM62ne5igD4yUk38k5lUSiBw?=
 =?us-ascii?Q?fzI5dnVvJlWCoEgSWKnl+qRq8KVRXpqnRzREc1bvd5Z8WvCXpbo58ycgfJry?=
 =?us-ascii?Q?p4R8NfQmzfS4yRdO+7lUCVwD/JFyshEn9yOY65/Ll+ae/p2beOsGa3nEveuU?=
 =?us-ascii?Q?NjURwF80i/7z0eVAYJHFZcCjNpDSkU6r7fiHkusd9+dTrRP6JaBcfYUgmTxV?=
 =?us-ascii?Q?XA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j3B9N95VmLTUlWE3wblCvFLw0jGZ4Je9pKFmWqm+w2/Rw5X8dje2EsFLBVEAOen1JxE5PUrJsZ25sSKclmNABUq8O5S821uBXm7b5nFZ0+4V+E2D+rZVz/phFGuYeKbMY9EOehRr1gRNqjCaxWHIUpW6QTedI4QbEMYUbIQFMFi2Qier9mYBrMHePjpIs3NTR2bctHt7NRGt8CO0onymvenFbc1t2+srHfKmY7IvRkldh43QzlCrBdvp31sqF4KF5yuteKyppiPo5ZX4SQoVGwWHS2dcmPw/9Zfely7+8CuLhF3CZfxgcnJ2SYJRPr8TDFSG9qr6ffmljOGfeKMbzE6MRaIXGkxKpT3VakZS5CdbS8LzUAIQJolZ66qjqZQU2lf37nHnmjT0D0NJiHAP3IkFkK5YO/ftzg4ugZuXj+kSms1oJ+q2WpRQpc4yGh5o+BZpm4PsVKHqjQg/DRNVkD7+xGum9BNCfel6lWTeXUEBmDA7ogDhNCf5bc9Eys7g7MrwRZAItEU0L2I5vYBC/4go21SGzp0jvGvrSE8Lgy7mblUGR432+YamyTRVKcwWK1ZlTlJTY9YklY1A4K+syX57Vzcjx9OYEyPxF3HiM54=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f713922b-1c1e-4f61-19af-08dcc475557f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 19:45:40.5021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11kfX/KrkCSWoakFUKBDSQAHoLD+77S5MvtFhhxOsB9Tolf/gexbIC9QDfKDigldhJ2KKBxMn8QEfYRVUVT79han5OHDwq57obqjKTHG/sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5038
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-24_13,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408240131
X-Proofpoint-ORIG-GUID: dCzvN7Hx2C8akfscxb8jWciNmBey9NR8
X-Proofpoint-GUID: dCzvN7Hx2C8akfscxb8jWciNmBey9NR8

On Sat, Aug 24, 2024 at 11:14:18PM GMT, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   b659edec079c90012cf8d05624e312d1062b8b87
> commit: ca39aca8db2d78ff82356defba75d14ce78a67b9 [357/379] mm/vma: track start and end for munmap in vma_munmap_struct
> config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20240824/202408242304.1A1fXTgE-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408242304.1A1fXTgE-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408242304.1A1fXTgE-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from mm/internal.h:22,
>                     from mm/filemap.c:52:
>    mm/vma.h: In function 'init_vma_munmap':
> >> mm/vma.h:113:28: error: 'FIRST_USER_ADDRESS' undeclared (first use in this function)
>      113 |         vms->unmap_start = FIRST_USER_ADDRESS;
>          |                            ^~~~~~~~~~~~~~~~~~
>    mm/vma.h:113:28: note: each undeclared identifier is reported only once for each function it appears in
> >> mm/vma.h:114:26: error: 'USER_PGTABLES_CEILING' undeclared (first use in this function)
>      114 |         vms->unmap_end = USER_PGTABLES_CEILING;
>          |                          ^~~~~~~~~~~~~~~~~~~~~
>

[snip]

Thanks for the report, see [0] for a fix.

[0]:https://lore.kernel.org/linux-mm/da1a6b2c-f792-432f-b99f-51717dcc8d83@lucifer.local/
