Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F3A1C5D7E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Feb 2025 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738428871; cv=fail; b=DI9PZWV28swi0vIIdvKX+G9GbE4th/6cw50INW6wLbNpUim/uSKlcQ4xBvXl1lI/DJYZkPxWaxT2PRuZBKnjqmJbA0h/efroAdTDnk/FIEuWpSRabj3SfpsUs/KWzzK/lg9JenuiccCSGWRiXCeLzySBo0Q+GAoVVVv2KvSBY7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738428871; c=relaxed/simple;
	bh=RKOte7ecflHKNKyeMhHa4SEzJM0vYBEVDarorkqGRK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aCrsFaOIj4ftdbbFykp8dl2DF8DU0hApw5c1Cr0/DZmBmU4QbMosoEQkGQtFBQmLfI7GADuOQkSQdhSnNEKqWJNE5dMyYBxdkerZOJRuI9aZxo+uP2ASyfb9rip1n6DUHKI5tGItpYm0Hu83J40Xoq1gJr1l/4udBwuB3wxADNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X9i3Ii8l; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=V8c7qyx0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X9i3Ii8l";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="V8c7qyx0"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 511E0nTM013023;
	Sat, 1 Feb 2025 16:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=lenV5PB7o16ctFpLnu
	ssgLsLXltQsh2KNw4F18APcUw=; b=X9i3Ii8lirdaRQE0zc/loFOq/wu1/d+m13
	5+UMqzY9NYcZSJKfEzyQLL76THC1okLS4j1k+8c1RRHV70WWOJbRHuvTD/pye83g
	SacWMhVSjcd4dwt5N6l70ZifAEr4o0AaDaaCILbykq83uxhMdoVCg/ag+y8hXV61
	2oZUqnwa8dZZzBrW7seDaX+FomAXwNtqkFXcEYQMEyMPtxJKWxjIb2inAfMb5Y4S
	TZwRU9uWkhsJodLRa6oqTNW2ul/gT8Ycnf+XQbj7L4OgLVeZmAJfr3/KLU80Ripy
	FLxbb5ohz/kA3yoJs6FAQYTnXL6VHkYUctlZD01tnyXA0j7zdb3Q==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hfcgr9ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 01 Feb 2025 16:54:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 511DLUrf029875;
	Sat, 1 Feb 2025 16:54:22 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44ha25mxtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 01 Feb 2025 16:54:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O99q8AOIxHW5Xoo7/xG3Tia9RCg61y41Hw08ZBwXB7tPSm0WJeDDZdO/iByKMsOZZE0Vc3g7fO+Aq+7GeDaMtY1y/f5bL/cA5tOMFxMDGJxGkqUYl9uxAQDN9vffznj2bV9ha15yiCU2ZGGUKF23MRJSeTI9bKcQy7bvDN2Dh06Oye2ChEoprcpXe0NHQH0bBRik5N7VS/jE5Ca4fwLpPCFOIUHLrXLaqBO6oJRlw6PoXkK5aN77U0Rf3vMp22vCHPhwQ7IQZUIe4zItSxgZbbSZRzcDAixpWkojTavi5MKO0r0OUs1OlhxfaYMxNqvMQEgLMk5+Ny+X+eVWiTxJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lenV5PB7o16ctFpLnussgLsLXltQsh2KNw4F18APcUw=;
 b=F4dDOPaHpb3L3Lv1GWzj8a0zNcD/fWrX4D+Ojbddjw5+HXnqxGsFhGCE/w2fRbRfWZ0sCZndj4+HG07KNV9XiYC26P9BiRihmOs+FyA2lU4Z0yoXJOWcx4Yfj24XoakOXEWHgJOedEbZKbd2pNXgMMaObZBOkYcdfFXnDG7Ybz5p/bv+YFVuHvv3sIY9g8aMcuhyO90fMF96uKdJHIJ9oyaPFOGvFWNhyy+iO2m96lxJO39MvdJ+WH9XbG0JQ4oZ537aYWUyZE59xs6XYB8tWWy/GH3uOM1vDtKU/vHL9FKTPCPngk7rVxPvCRz4oG9CF5yEEDBmCeKZpSR3GEzlUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lenV5PB7o16ctFpLnussgLsLXltQsh2KNw4F18APcUw=;
 b=V8c7qyx0cpxNoKgeSEGMl6Q1fOn/vzL5ruoK4Wy1Azb0Sui2sD71+kDBm2zE1pc44H7fcKUNELL9oKaglATHXoTJasMnG2iS3oHRPNaMGUaNWo4Eo6DRXbec7on4vKLfJ7VR1FpSUaV3Rs8/Bpo0PT/gPoU8pycMuFzwo7ZHft0=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by MN2PR10MB4207.namprd10.prod.outlook.com (2603:10b6:208:198::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Sat, 1 Feb
 2025 16:54:18 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Sat, 1 Feb 2025
 16:54:18 +0000
Date: Sat, 1 Feb 2025 16:54:15 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 75/80]
 drivers/video/fbdev/core/fb_defio.c:272:17: error: implicit declaration of
 function 'mapping_wrprotect_page'
Message-ID: <b4d3649f-d6fc-4908-95b0-f55329262a80@lucifer.local>
References: <202502020030.MnEJ847Z-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502020030.MnEJ847Z-lkp@intel.com>
X-ClientProxiedBy: LO4P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::10) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|MN2PR10MB4207:EE_
X-MS-Office365-Filtering-Correlation-Id: ad51df5f-e757-47f1-2a9a-08dd42e11153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hOmPztL19khg8id1YIcRT9nXh/Aami9NEcYsryk+Y2W//ZDt24lhzPbwpX6p?=
 =?us-ascii?Q?HCQ49/Nfjl89+SKOD/IUtwjM/rXOvVT3D008omfehgGoC4bkjWqoyyZPAaX9?=
 =?us-ascii?Q?Nqagtiyw8AbW0a5ahbcnj/FWAgMsiDASmbCxDsIbPt0ixDp/N073nf3sC85i?=
 =?us-ascii?Q?fYCsCxw6RktXy9DsxA86IFICxgKDWJu64E0rk5b2OgiYYhSU3ISsVf27u931?=
 =?us-ascii?Q?L99ohrNXlX19EX2T/ZI2y4XE5tGVjWfcjh20azoXxpETqpSK/j32+SDiAt1i?=
 =?us-ascii?Q?0w2HBwT7NBz4886UUwuv+kaWnJ57MwcJggDjmo56XRvbV4wFZYlhPbzWaxra?=
 =?us-ascii?Q?X5GO4wxTBhM+O3am97WCuRYmWph4fzv780RbTTZhqQPl1+uyUWn0Z4NPlpa+?=
 =?us-ascii?Q?de2VreAVk6Ifig5dyTYsb56xAjnbyucB8hFMaoy4mR9DxQvqrVAahL2UDTCK?=
 =?us-ascii?Q?jZvgmfmTiwvIpC9up0SnieMkHaaVcxhRifHjtSXMeK+oCpkJ9XeIeoDr5j44?=
 =?us-ascii?Q?NsM4qhM5uSf7lSbz6lc3tAGFE0a8KKnPfiBVcste+EQoKO4harJz519LFPj+?=
 =?us-ascii?Q?mtGRzWqKvxMh/IN3xQMXo0JeRJaXWVKQYR5OQF1S5iEzEMuQO3lIf+BZo3nI?=
 =?us-ascii?Q?7AHT1ZETO/LSbjnA+YkDpusYe7Iz+m0CMu3MeozNK2wH/i6KxohN1FHzo2wV?=
 =?us-ascii?Q?1XnTd0wqM+bEYxQmsCZ1Rr8RYTQGgQYw8jOdvW6oWNLxCUMvZb87f4c7boLk?=
 =?us-ascii?Q?2xlRKSoylvv6g+n7cf6Tsu9O4vlbUOdP2c7MPVx7fcRUVfewIoybMe5gZfV2?=
 =?us-ascii?Q?68rwGY7hXVafZ+n9Dz3B2wXTaTKQUP8jCg0SYmsMYSrMR7t3r3maV8/LsxBw?=
 =?us-ascii?Q?O1fPcpW6DycA1c2nMRbOJ6GkSjcJ8FETs7wEEvKpfsluDTQ9ciVn08P3pWCm?=
 =?us-ascii?Q?4YZORBsi5XjXCr2AWRog/+knSW7yCxGRv6c6RwQYKvoZjkoHjAE1Cq28n+Ht?=
 =?us-ascii?Q?5UjKF9nqSmRkRj97R0t0DKU+RWRgT4FPy5KIMDBmo5ZyT4ae/OqIIH1ZJGqQ?=
 =?us-ascii?Q?30+C/p50lB6mfPs1tNjl6B/K8Obh4bLCmc5jvgMZBI2XkNeZTd82BWP6WRKe?=
 =?us-ascii?Q?6/Bv1klrP8QR1G7Ny5cXLu/x9jxPck+odjUCHrgoxEsrzn5zGjkrauZd4Feg?=
 =?us-ascii?Q?CYdmvwv3ujqvrBfeXl+BURWLC6qW73fAxAuteu49q15VQl2eFN5sTk/m04T+?=
 =?us-ascii?Q?5/R7tvocBu02M3weVHjB0QDZLXsMXscEr8wdiDx2FBKTTLULJVy5EGOTNtNX?=
 =?us-ascii?Q?Kn6emQYvsmwJxf8U3HrasSSjCpvykaNpR/4MzaHd61fY7A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vc0XZ+3XN6u5kGg/hDysnTBxUXTxsAZHXOOMrYeeoUK97HJFCHRMjNEzPFeF?=
 =?us-ascii?Q?fu46FdelouAeTyxo1NfaHI20qBmDwexa2re5QwiyPn2Ol9BY9VWOdC6favx9?=
 =?us-ascii?Q?YIoIWA7w04/HQ/dtqLgP1+0yunbOphwmTc1zWvu37Eus7GVyIx5kvgpfI5l8?=
 =?us-ascii?Q?LI+xKToLF6zrTkwWqHDRQ2wqnAfi72UxXafb9ZKuZJATos2nYJsEVR9Xg33P?=
 =?us-ascii?Q?MbP8EM++Nok8yQHTVuM/vtZ40iOXaRIKd/o2AiVl2+AiKL44to5Kc3Xpo6TX?=
 =?us-ascii?Q?8yknh3gKc1WGXRjUJ5f4lYEJVpMUp43vkORJRPy19GjzlWFBwPARE6MkhuWh?=
 =?us-ascii?Q?NGysgFXkjetEpBvsTXp4xGUUgcuMEmzLK+0uaxymOYgFWZo2Y0bwMkemi1Fm?=
 =?us-ascii?Q?bSMl8w4J6Qtb8D0Xmjr8eYqWexNrsBdFQ7DgJZ5K3Mbx6C5xwFE1H00Dhxl+?=
 =?us-ascii?Q?9ACl3xy9/ki9WeVYDBhqRwY+nsltaF3YedD8K9d9feN0rKX5Ic6aITDC8DYL?=
 =?us-ascii?Q?3HoC8xo6pZgXbt+bXFahfH6AZbIdYH3RsUiciL0AqOPNeMjsNKvdjO0k0hBN?=
 =?us-ascii?Q?IGIIlg4rTmzxFGgZ4p0aMFKL5+sq9nYihsBWquBDV35dCJ/V9iNp2VxCPpPD?=
 =?us-ascii?Q?I1DATg7UylFWo0F72Mp+/K8yeE4xAhdZSXSsNSiDSJIPJHhKcyl9e3xD8SrR?=
 =?us-ascii?Q?tFoPvaTDDCDDzG0WT7EIjICngfCgFhBsge85bUpoX2lwYmqxUwAmQFqjUiEc?=
 =?us-ascii?Q?DHL3JGOMIgIBk9Cxh22QTYa4YokFOL3uo6dZHGs1lvokK8xa6TE1uEWtW/HY?=
 =?us-ascii?Q?JlGKlpBFZX8Di2tR+itq1jFWVysw0jK4jbdcoCcnkXvGN8bTmOokbb4//XG3?=
 =?us-ascii?Q?B2nftnu7r81NsAmkn8NzH+vJxQ9JQPGdERl5UlPO5p/GynXNJI0MuA484RIF?=
 =?us-ascii?Q?NGikAjebP382JWmj3SoijLEWaBb1tdQHvF07aORqkT0mTuWRRXmspYg64xIB?=
 =?us-ascii?Q?ahwKldOXBiumQ0wsXpUaUY/SFn6n+MB/kAbMOvvkQJFTLbaP5PLeZUbjRtzi?=
 =?us-ascii?Q?meSIU3LoI3dG/LGhWZoanAyFuRjv7wnlEsOALNwJhK32DekrC4Ms4j1Yb2LY?=
 =?us-ascii?Q?ft83xsUH0GrLoKyhBy6Mh6/DSc8/1C9qPTR0sgY4RxEnl2INxbjhO+1tLvqs?=
 =?us-ascii?Q?fc6aaPiPagCR/eqCX3o95wJeHGLZRmkTKCnQ30UWEQiXXUogP29cjT8mz7Hu?=
 =?us-ascii?Q?1d5CeryBspx1bcdveZBBvGC1OLjdNVANVqJWSb9SY+6v7urlj3DUSt7s7cKA?=
 =?us-ascii?Q?lQf+aocqS/gDwGogJueLQzwmR62p+KPZyKwll/ixg41Z0w2SPsrz6hCWvyoa?=
 =?us-ascii?Q?erSzKzpkqmMvUJCKdPWYXWiV9y/PAnK8qPKElyOQbJwFI+uTPn53C8q5hDy2?=
 =?us-ascii?Q?TPCoWtPh2LnlYOQ6pEc23ox3V8OOCBc/7FXS3Y3oCJmYXSSpr4H81892DMph?=
 =?us-ascii?Q?J8AJamJDjYEBVMLjtGUdYPiooY+gGMBPAy91ihZ75+qcrWYz8M9Jv9kjDP4v?=
 =?us-ascii?Q?8U2L1iYu4VjCqwF446vz8bDiu6a/HvmJkDOXplnSm7ALugaZgDL45mlfyXhB?=
 =?us-ascii?Q?Wg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	REyBHyGbxRaFynXjP6GfRuUSUGK14EeRBS4ytwziolL1HMEZxcc3TEh4Rg/EkOV3FTr6jxaB9uOELn7pYCNB7cb6jYMGC/z/DndmTngKubPaLcx1Ksttlu73tLEmDkJhP0OPlDoP2rG1iRflDB4joCtcDYpXMM9nCmzCjc9TIb1U/vQ2BZl/CalLTrGiEOoKW9hkWZVuKu2lZg8YzXnZYsm5taLy8l8k/SygwZCNhatqZWot5UUwQDCkvGM/CDNTfrWVrMBbsbYl0N505FTXDtI0M3ByVZ9Xb+adkl1cuJ0p+AaDcu+QgRn5nvR0mqp3iU6saoBb/B8vTpfESfuG/rmQiUYKLzsJIdBmOD+v+3eYPpdM7O2KwEGQnnUX2xSqKECeSNGIibId89faH+7HxmaR1yj5fSUtbDIqZQ2+6IdBvHSSa5wR8XzhzbMvFzcATBIUf8BcxRv2JFheNiB/536bStBtrHD34fN1HNHv0Oq8J9YBAD78Tl8KgiL30pZPlbmthDXM6NBDlLdeVXBXZzPTRSfSbrVk3uU6Knhz2w5GhxnuMi8DlwJ9proZfVIi+JhGjIZnaJpD9N4vCA+k+Pz88MICtPNw+OczPJWGIVQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad51df5f-e757-47f1-2a9a-08dd42e11153
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 16:54:18.3129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KslcvuleXc+bIXG1hV0qRUnT//9Ru3FqJdKyvSby2NUyIfdu6q9Wm1aRKc/txuQw1ffSpBdJ001+C8H+Gyg2GRFNQlsOuOkQHW/qz4+8cKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4207
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502010146
X-Proofpoint-GUID: SiMmnAQhnJI64Fg03JYv0rZbtLyEokpI
X-Proofpoint-ORIG-GUID: SiMmnAQhnJI64Fg03JYv0rZbtLyEokpI

On Sun, Feb 02, 2025 at 12:16:55AM +0800, kernel test robot wrote:
> Hi Lorenzo,
>
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   7de6fd8ab65003f050aa58e705592745717ed318
> commit: 6a9318f28d7e371692838677c364145fe04b1093 [75/80] fb_defio: do not use deprecated page->mapping, index fields
> config: sh-randconfig-002-20250201 (https://download.01.org/0day-ci/archive/20250202/202502020030.MnEJ847Z-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502020030.MnEJ847Z-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502020030.MnEJ847Z-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/video/fbdev/core/fb_defio.c: In function 'fb_deferred_io_work':
> >> drivers/video/fbdev/core/fb_defio.c:272:17: error: implicit declaration of function 'mapping_wrprotect_page' [-Wimplicit-function-declaration]
>      272 |                 mapping_wrprotect_page(fbdefio->mapping, pgoff, 1, page);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~

This seems entirely bogus to me, you're building defio on a non-MMU arch,
whereas defio literally relies on an MMU to function at all.

I mean what does it actually mean to wrprotect otherwise? :)

I think this is because CONFIG_FB_DEFERRED_IO should be made to depend on
CONFIG_MMU but isn't.

>
>
> vim +/mapping_wrprotect_page +272 drivers/video/fbdev/core/fb_defio.c
>
>    258
>    259	/* workqueue callback */
>    260	static void fb_deferred_io_work(struct work_struct *work)
>    261	{
>    262		struct fb_info *info = container_of(work, struct fb_info, deferred_work.work);
>    263		struct fb_deferred_io_pageref *pageref, *next;
>    264		struct fb_deferred_io *fbdefio = info->fbdefio;
>    265
>    266		/* here we wrprotect the page's mappings, then do all deferred IO. */
>    267		mutex_lock(&fbdefio->lock);
>    268		list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
>    269			struct page *page = pageref->page;
>    270			pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;
>    271
>  > 272			mapping_wrprotect_page(fbdefio->mapping, pgoff, 1, page);
>    273		}
>    274
>    275		/* driver's callback with pagereflist */
>    276		fbdefio->deferred_io(info, &fbdefio->pagereflist);
>    277
>    278		/* clear the list */
>    279		list_for_each_entry_safe(pageref, next, &fbdefio->pagereflist, list)
>    280			fb_deferred_io_pageref_put(pageref, info);
>    281
>    282		mutex_unlock(&fbdefio->lock);
>    283	}
>    284
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I mean I'm not sure it's worth doing anything about this since this is just
an invalid config combo, which was masked before because for instance
folio_mkclean() has a !CONFIG_MMU stub, however it really does not make
sense for there to be such a stub for a function which explicitly refers to
wrprotect afaic.

But if we want to stop randconfig build bots tripping this, probably best
to solve by making CONFIG_FB_DEFERRED_IO depend on CONFIG_MMU, so I will
send a fix-patch to that effect I guess.

I mean quite literally deferred I/O _relies_ on an MMU doing page faulting
to function at all. So this dependency was always an oversight (I guess
they assumed nobody would be crazy enough to figure out a config that
allows the combination of the two things as clearly no real hardware would
:)
