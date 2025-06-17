Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177B91C7017
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151685; cv=fail; b=lP8Tg/C42HLlrTrF1fYo3th8w8CUHoC06IWF5Ho3itT3FPpR6D0wlLjw0c9+e/ugesNSmVTa5Y5wxzB7VuhhuGXt7adfn0iE80eg/cRdLKXf73zC2ooGxvTjm/DnjiLX6zGexP8mrMcG8dQqkJxsnhRqp/pn6JEdlYjhRFOMns4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151685; c=relaxed/simple;
	bh=Ou+hzuY/3npUseyirVIpEaBeK2Uge5M6K8NmaVFEuu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tPHfSDaDLDuqZNK6VUMniER0T2NP5ae/z83/bMDos+Z6CtqfTpwUJvV93NaIEvVawLWgFnmg7SI4E+AQVb2Juf02mZIa30GygzShjdIBQxbhl+FheJEg/h5UtvtgD020oPn7wcXK1DP8xGg4hTBdDDumYp2nYkW/NUByyrzPHSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PgFvsqmY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MHynDCaq; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PgFvsqmY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MHynDCaq"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8tcpm000555;
	Tue, 17 Jun 2025 09:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=68qS8mc/fpQAsKsStc
	T1opyYQRq+GKivnUOLoL8guyI=; b=PgFvsqmY0cuq23CTF4vYdwwp7yloumtm5g
	WUp8aCtsjrrjw3LGceoedMd4LfclC/1Q7QZf7NEF0k6RkS9A4/Mqj4tnJYVUhue0
	CTkvf8wHYIVOOuvDe/5mdF3TcwKYpqB9UeO7SbpOE3sRjpFhfRRz1NKKo6rOWat0
	di7wEWc+InmV2zMHHJhAgtE8hWBhjvzU1rGaGeACKW5xqJsiEjZL5+cRl+mO+ofM
	EQ7dUu1AxVm4eYZalamhzN1NhwDgv3Xx2RCK1OzQ73yKOKZJGJc+CPbMyXd7/lK3
	lanquxf9EqX86m+i53dbv/AYaQzECL2OSuPh3ybv0NODIbtqzh4A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd4vvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 09:14:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8dBbO036434;
	Tue, 17 Jun 2025 09:14:40 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhffw13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 09:14:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBOB8ETB5Huf52J1TtM2oU4LA2zRYVcZjpIDw2loCft1byFHtaqc1ffIT/W5PQ6tF8eNQT9xvweA20avQjFtNrLiTiGLN6M3OAZtPiWUqzRuXQ/6ocF/M29/rHvZCtgbeVEm5v0lLBsAFhD4vBT+mwVfH1arlLwQr2/RyQ/X+YyzbNQ7cVMh0ExjzVjDY7SN3xb0/Y1pfbapJI1vBxJH2orsPWMpkrHIGwRFug3zbDTBpFgjKc/nH30m/qJ6+dAebRL3dH5BF/+apRzBSAYif70szZznK+IK4v6YF6HZTiXuuVAGz0G7IFspRGv66uAKOmMKGu4+yN0MPnSton01wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=68qS8mc/fpQAsKsStcT1opyYQRq+GKivnUOLoL8guyI=;
 b=gJ5eWJP/ehWzRAdeBpgaKzH/MMH8l81QdHgoVzp19gG0rDZThgJ8fbhdGZavu8rNZniV6tvYJKfJi1EsgnxwsV9jZEqxtEI6IQRlM45Nz09wpZ/7SGSg3cLP2iJMCTn3tTrG4a/U9a3n4IHySctL7l+Mf3y1YBbaHhSG1VJtlwqd48/zK0jpv43obcpBB2vVrQJvOEcPSBt1qnGgkgbV5FnSS+vidzdMFdLGttBh3LE3xzkSknhfy8m7X0JfEqigQ7npUgWkvUXp2+W6XutaWlSKcGfdgHt3kDs8zGdaTeN7EfAsttm1TMpO2Zl1hfzMUduNWyiR7QAg1BgSgVvP+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68qS8mc/fpQAsKsStcT1opyYQRq+GKivnUOLoL8guyI=;
 b=MHynDCaq0I20LRxBeoR0bRc4j2QM88br8rydV+XY01KdYGd9ylDp8FRlbyTUl/nhbz6e3zuc34OrcNHw3rtkVlTkq0Zi6U6MKPuud0tcaideqbw/9hOZ0o9CqRTp1doH1w/kRvDEL0PUYHD5wzKBPWrDWHi6r7O3upzpwBk8krA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7355.namprd10.prod.outlook.com (2603:10b6:610:131::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 09:14:38 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 09:14:38 +0000
Date: Tue, 17 Jun 2025 10:14:35 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 09/10] fs: convert most other generic_file_*mmap() users
 to .mmap_prepare()
Message-ID: <3664c00a-0f41-4eff-85f1-a4d8d5a6cac2@lucifer.local>
References: <08db85970d89b17a995d2cffae96fb4cc462377f.1750099179.git.lorenzo.stoakes@oracle.com>
 <202506171549.9dcTuFoR-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506171549.9dcTuFoR-lkp@intel.com>
X-ClientProxiedBy: LNXP265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::32) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: fc3ce4a3-03fb-4b62-0154-08ddad7f625c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+Qz3nSrwCNgRsdh36cu7CfTHA/t45CdKlrtHSX2NzRv2YtOBONv07gATivyS?=
 =?us-ascii?Q?mYKt1g3jjqjSrM3jrxhfO+WVRSsj08NzyRROQ2qPPUmTixGKEfNAWoELlLHF?=
 =?us-ascii?Q?Y9kOwvMm9lQtmalJSbV4z4j3MJlmj9Q/Vt8r/Qt6mu9fdMJy67erGYG2GAsZ?=
 =?us-ascii?Q?mcNoTr6SQCEMZjXxmklZLAZttekkW6XBJuNEsn9u3f4qnKxsN9NYDbLRWtPc?=
 =?us-ascii?Q?JUgtP7f9q8REiNukQ6/CNKmSLXH1OeGp3WDwJpd0NKdebcJkp7LzAyz2oGuz?=
 =?us-ascii?Q?Zyx0SkRUIGkOdeOxxtgfTz0zXXBg/e4JfCyFznZVcNd5MkBLI39A72YvTv9r?=
 =?us-ascii?Q?rkP5aOQHmZPowAskspktpxtNfcF3qLXEfQQoSOtfBYTBkynkjgRlkuMonmYC?=
 =?us-ascii?Q?T7MhKw2tmtXPmVkoICmZFduZuepPKDm/f3GyYzBIA1ai028nlcnucBF6ZH5p?=
 =?us-ascii?Q?/J8zb9vWSMZvxjM6774OLqS6we3TXItg1qLryV6y24YCflggusgR7wepzoXC?=
 =?us-ascii?Q?cMPis83b3DsMclsMNq17T07SSplLje7CX8bzRgFbZBl6qPoClTv8ARWAwchr?=
 =?us-ascii?Q?ZQ9qNom/GViWuVEiY71GEaFAkqq4JLMhxT3GSQnFJnUCa8XoMDDjOjih1InL?=
 =?us-ascii?Q?QG1spQfH5orPVahIurNEEb/3CTwAFoRRdXGX/itELGIjC9aW2E+4MRy2L7dS?=
 =?us-ascii?Q?JNlhL4PWKP8eCksAvQu/2lg1G6lHtdQpFe7DXKutiy84fK2pFcYaqT5n5MdU?=
 =?us-ascii?Q?dFVg+dRhafC4VX5QybXPd2j5b4TzRJ7voS3527GFE6P6EMA8wAYaYVy+FLnC?=
 =?us-ascii?Q?i3IfcYW8WLZsU0mx3T/oWXvZvsojJSpuzcEELoRvEXYGoTavjvqXDgq6IKSr?=
 =?us-ascii?Q?yTM1cF4xxBrX0U7JVvGjGQHjJqZtBxF13/0un8T2iZh5ZrpGh+X8HFrVhtQo?=
 =?us-ascii?Q?XU8UOC+9CHa22+y7M8iKTBMvvaswlwp8cpWZS8tYWhFTlluCY8LTHfdBe5i2?=
 =?us-ascii?Q?hx8NN6hkaffF95FgYpWQb24bQb176o++X+i9uia6fcTKhhfH28/+Q/EH4Ugn?=
 =?us-ascii?Q?UhIOcUNtY1i11Jh1kHONs3FZQgQGW1OtKs5dy5fR/3w8vCqmjvKEnIT3Jxsr?=
 =?us-ascii?Q?c4xg0aQF2aR4eSm1iw9YCl31YawTCtXQbjnFJKqdrCOwmBHaEEO5p6jocYcE?=
 =?us-ascii?Q?m6nKA6Rb6qyUhR78otz2/5IccM3sLzsWfU1epXFB6LLNmehVjr+bUg6A0ep9?=
 =?us-ascii?Q?cmns4NCaWXIBiHmd45X7wIxJobE3GIVAsqv0FQU6I8yJ8Rer+0yw16xTL1hq?=
 =?us-ascii?Q?K7+UtElshxYgkvqK2tEK+KfyhhiygItPNnd675OE9CqyKEbR4ZnD391C4Tyx?=
 =?us-ascii?Q?1qEZbFnSkNyTEyaNrRfEO4kW8qES?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZH5Jo55qIWg/9OQ3nuEf0Is7McMHBNwKCGisFEM7XC4+3RzrPRDrZVF+FTkl?=
 =?us-ascii?Q?HSqZWaVJpyOSY3pdCE/aRkGQn6qL+U/kB2V0ptCmlZ1+ovotjIHYLZ+2h4KW?=
 =?us-ascii?Q?5jT1c8tUoUY3SYeuFSdlSCg15HWBXvRGFcxHNoxSBGmHnqfNIaDQIHlt9s8H?=
 =?us-ascii?Q?HWEYPpt1e42hFTUJ7tTlHwPwFM49n3GXo503AZMhoSBONjPuhQsS02s0AOx0?=
 =?us-ascii?Q?hSg3kcdkSkQcRi7OMw3RD32d5nrrfJO5S+A+muNiLVPep8iameY2fi37Kn6A?=
 =?us-ascii?Q?I3nZN8iw/e8o40jfdgX6+iBg9zuqoRMSllCyv3DAtwPRKoJfCGyLBEI2IaqC?=
 =?us-ascii?Q?MHx5EzqO7bb0FbJSLgTm4MnoWz9vMLNWPWZE0r4FK3oG6szBI5XMI1+HAX4x?=
 =?us-ascii?Q?o28dp8Fi6PrIIQ2N/ncZTd5m8VFct3+WYZrwQvf7DLBPELvLwguFW3TEEaby?=
 =?us-ascii?Q?MkTf00T8uxCZ6cEXH+yv9uY1DddG3wZ3ArFEa/LmyRWD70YvzffbENmDwQV7?=
 =?us-ascii?Q?bWcG4R5gDc9FVDRZamfWpCcivayMDYm+/EdWd9oLx3Ol5QojPUdXZ0rjeYnM?=
 =?us-ascii?Q?uX8ctBMQ/A2kAYZLy49J1axR54K/dBKPIuIGkyKo4BYbR73gWOfrCJ1JIlPJ?=
 =?us-ascii?Q?Zv6FiItiVsaCYLN2pyH2/T4V6zWSyrbSnlnMGkwdfEebCpKA3IhjMrCKQM5k?=
 =?us-ascii?Q?BlQnFV8ycg3QnhnyWSkGLnoc8vN1BB48LiWgy0o5hF6jRfciKkO1ELbk6MHo?=
 =?us-ascii?Q?ZdQYVmQhUW5YnrqXssV+d7Gu9+SaFfU8kb8BdigOjNyYBzP/qfoghLnneHaY?=
 =?us-ascii?Q?HoOoYT8pvPwLVLfjQ2oAqOiJ1Eo22dwzDKdsl8tonjj9kN8Irn6W39D3JzgL?=
 =?us-ascii?Q?DiZTsJ+rOI3CVUXrUxJMvLimZIyzkWEy4aW3Gd9nUiE7pUdZ+IRSESr++9qN?=
 =?us-ascii?Q?rsmTQTMBpEvTTIQP/hcSKDK2zCk5E00ZIrxxKHnE5UQOOk6OwmincclMs3KC?=
 =?us-ascii?Q?0WPqvrzHC/Y7McBeQqEKu3Qzjy6+m0OYAvbvvDKpi2FfRbo6cu6/YLCK+NbR?=
 =?us-ascii?Q?WuSbpK2iHRZdk2RO6UcEOcBxVaFrp1Zt48A0/AR0irM4PkzYAUAKBISvN5B9?=
 =?us-ascii?Q?Wjj8ZAzRxuOse4BDhSC9t5PjIdNgbxLkozdC3+Z90iut1vXk/7I8OjKovEQZ?=
 =?us-ascii?Q?fDMfbg3dL3HACU5XHJRLD6KXp5ubNsx9G4Iy4W325AjQEFtB8oFRuwRcP/LS?=
 =?us-ascii?Q?J20CH4wk5WSMCWpZXKHvxUzSxH86zd3U+FDl4piETX0lk4C9jKc+ggap/OGp?=
 =?us-ascii?Q?9ERzyRfzeum6jHMm5D7znkIXUffhjvLVioD24HN/Azp2Cgj7nemtXkh+BYw0?=
 =?us-ascii?Q?gm673vifeuLNryeq3a2bY8tdUwTm6N4ySFru/UTxZJvYODWMpxj29pG1ckzs?=
 =?us-ascii?Q?kKqYkff8VU4Atq+HLVMCU6/ludCMf0R5zLCvjhvOuWCrOcv8QC8rfIsmhuL0?=
 =?us-ascii?Q?XCKDkqhcRul/wGDg0YnSi2gHszDXOyvBaZqdP5Y2fBsfQvHKqu4XX2WWe+jy?=
 =?us-ascii?Q?W+/hsiqZ4xz0mKc4TiFen9h65hz8rwC0ML6AVG/1NNYYu2NEo6Jd+mNPRMkL?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	y+QcoNbOGVSFCRkfUmLYBB2QWD3Nkf8Uz2lyIxLDR9lm4aSzHNfsf/hHDoC8oBKoFONMH/5/nOGOKifTPaHZ2qKi6pmsT0nBC0w0Qw/woz3mrPwF0kb7OTCpZEw8buH2Xjch6uKJXyJI6ctSJqU5RlAM9IP5BidTyfAe4jyJcyBwX4t8muafXF5NN2SzvrX8Ukms3LmYRLerP382gsHnUeRzeVJdyKVDvHnp/smhdi2v9dCD982S7Mmkf/meuPeDfT5DmCbFosxACZY2CRnsPox6EollmCOVhqVyNlsjxiDFAC1O2eeDtG6yWASu50xeicHzP+bw6b6OlhoyOTmamqFqPKyww7RBPvJzn9DhptyNVVoebydTke6OLkdK6qq9szY/nU8dKT6oTt4E3yb0ZZMC74bTJ+7YhD1P6SmrAc1PamaSGGyHU1caRQl4Z2RosWjVW38qJcTZJ1mVtFPxCzNGA969IfNC+iPfWQhwGIrSri3MiId+mbtgy3p0XeZmE/2Mqii+SL13/OzpS/5ChZrt32D1uFiA1Pb5oPA2jQMXVpPKtvy36UEay+5+lFR225+36WQCFmGlI5dvvuvD0SEsuKWogbOrBLwZpzttLDE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3ce4a3-03fb-4b62-0154-08ddad7f625c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 09:14:37.9753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQ74g99ZPsxWfxHzEF0uhoTCC4Fgj3F6s2TbQYn9c2/AMh6WILL9rPKk9aDta28pm7MBG+heSr+zckdj8lFIbScUxFuvKdVRn+lzdYh/zKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7355
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_03,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170074
X-Proofpoint-GUID: 34bA0u4f1NE4C20RuHklbBxPsyPQtN-c
X-Proofpoint-ORIG-GUID: 34bA0u4f1NE4C20RuHklbBxPsyPQtN-c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA3NCBTYWx0ZWRfXy8MrXYuHYO6V 83VF2QGv49oNcz92o0Qsy3bFM8ZYoTaHRNGK4biUAYsWw9YsU2oQ6s2M7xjeRPJIA/VON+1YA4J TlK3dScxafRyEZAlnRM47Rh2a0kf0rRCEF2e+sXf36IKby+Ubz7Z91iZheXeFvGXhkE6BKyWZ9W
 /q1AU90F7oU0ifhfQbTV+0Nmvk0v2fIZkchPxMxD0ESTm75s8wLmOusxEzv6jFy/rV8YF9nnG7M Yl4zX4avuMB4/THt3gkv179Y0d79rzFFLTNu3WXopM3NFO+iIsgHveLZoItjBLjFfjQQ/gfhb3k MGuLYTt7ySa1711/dZZqgDZf64cePAJyrbSRJvH/OTZ9EQoWG2BwDF0VjdxHGNgCMEErMdsoo1S
 EXtR7crqKG9BrWGlVv0n+HCX0yb2MTGQdKK7q+hGTEi4jp7OkSTtezPGCr/TpnJTTqpVaQy3
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=68513202 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=qcz5-bUjCg9YUB2w0GoA:9 a=CjuIK1q_8ugA:10
 a=mmqRlSCDY2ywfjPLJ4af:22 cc=ntf awl=host:14714

On Tue, Jun 17, 2025 at 03:14:43PM +0800, kernel test robot wrote:
> Hi Lorenzo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on cifs/for-next linus/master v6.16-rc2 next-20250616]
> [cannot apply to brauner-vfs/vfs.all trondmy-nfs/linux-next ceph-client/testing ceph-client/for-linus]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-rename-call_mmap-mmap_prepare-to-vfs_mmap-mmap_prepare/20250617-033629
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/08db85970d89b17a995d2cffae96fb4cc462377f.1750099179.git.lorenzo.stoakes%40oracle.com
> patch subject: [PATCH 09/10] fs: convert most other generic_file_*mmap() users to .mmap_prepare()
> config: i386-buildonly-randconfig-004-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171549.9dcTuFoR-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171549.9dcTuFoR-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506171549.9dcTuFoR-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    fs/ubifs/file.c: In function 'ubifs_file_mmap_prepare':
> >> fs/ubifs/file.c:1589:9: error: 'vma' undeclared (first use in this function); did you mean 'vmap'?
>     1589 |         vma->vm_ops = &ubifs_file_vm_ops;
>          |         ^~~
>          |         vmap
>    fs/ubifs/file.c:1589:9: note: each undeclared identifier is reported only once for each function it appears in

Thanks Andrew I see you fixed this up! A silly typo on my part...

>
>
> vim +1589 fs/ubifs/file.c
>
> 1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1581
> de03a8cfdadf57d Lorenzo Stoakes  2025-06-16  1582  static int ubifs_file_mmap_prepare(struct vm_area_desc *desc)
> 1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1583  {
> 1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1584  	int err;
> 1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1585
> de03a8cfdadf57d Lorenzo Stoakes  2025-06-16  1586  	err = generic_file_mmap_prepare(desc);
> 1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1587  	if (err)
> 1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1588  		return err;
> 1e51764a3c2ac05 Artem Bityutskiy 2008-07-14 @1589  	vma->vm_ops = &ubifs_file_vm_ops;
> e3d73dead4988f3 Sascha Hauer     2019-03-26  1590
> e3d73dead4988f3 Sascha Hauer     2019-03-26  1591  	if (IS_ENABLED(CONFIG_UBIFS_ATIME_SUPPORT))
> de03a8cfdadf57d Lorenzo Stoakes  2025-06-16  1592  		file_accessed(desc->file);
> e3d73dead4988f3 Sascha Hauer     2019-03-26  1593
> 1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1594  	return 0;
> 1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1595  }
> 1e51764a3c2ac05 Artem Bityutskiy 2008-07-14  1596
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
