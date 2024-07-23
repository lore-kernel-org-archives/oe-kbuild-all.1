Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBCB1586CB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 18:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721759118; cv=fail; b=Rq9o7Bu3snledYgWeNJpS4PcrhdPv/ejQg6KMWdqRXIhiNaWr1GaNxk4T+WPjiP6Di3/qINlR89Zrmn/HV+N7NpiA3PUIm66dTkc5sFMx8dAmY2emtv3m0lbkqnTBuH6qZzQN76L+vW6C6wFIIo0e7RUFLvf3Nw/9An4WDz973g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721759118; c=relaxed/simple;
	bh=UYp4b6o5JnD5tZfJg8lAOvqA8YKiedXFmL2ozFwoKTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QKJWqb11WqejW4RKuw5goo8kND+Q+vC/eTgOC13jII9JuliLpmSPTaAK9949zhQ/pRAQdL9j5hBfIpCAW8+Jsgw+92fK7EXlBermzDOTdyD9P5ul1f0BClpI1tD2ZmIBn28BL7TgAACFmFutcadmKXfKg2bDPE7rhj1Ix3qn1tI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g/vvrfcE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cONjYaaK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g/vvrfcE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cONjYaaK"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46NGQVT1023104;
	Tue, 23 Jul 2024 18:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=eN+peO5nEs6ZF8u
	+LR9ohRFkgpzszR3Q64tih58DYaw=; b=g/vvrfcEXN+w9U+RGlZMQrrNUWZF6C9
	n0kUhrn1HoIUfCNhVpACX+JE0qHI8BI5sRnqo/Jkc/EDHK/gtT1ABHMq6sC2JJzQ
	wxZhWujTuHuy5axEgg/GCARzG7mfedKJ9JrAXV6HRrzYeS6iR0VewAAVkR5RI+3l
	PprFFYrrP4aJnBelYEbv4sYDJxU6kh1WcEIV36IaXbRQn366qbPrc968VQwO69Lt
	YMgmDI3rlGB0VAH9jS+rCbEoghdQFrYahYqML0WEsjswPxDmZIouyh1xOoNVByo5
	yYnANom5eTu1GYL5+didrvQy7hLce/EJzdfXafa+RjihXIOyNc49q9w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hft0farx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jul 2024 18:25:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46NINghC011016;
	Tue, 23 Jul 2024 18:24:49 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h29rju0n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 Jul 2024 18:24:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vm0fIRKYAvS6O6p0BB1/LLRR/QIKipJsq/KIweYhvkzd7+MUS8qcWsWeOgtwtu9uGHn85dCRAcq6Y2CvtNi+t9T/6aQYmDZCUJJmsj/T6KaH2XwQ/U8HLbVfRjJJTXjT73CDEAMcTl3b6iNaBtJskVJIB0UxfU+5D44qZ27Ng7WvYRq+bh0HPE2+DftPO3BbbAoa9xgu7EOrbwCvbwEDs0Zji/ZLpLrm0ZI0Ltfaj/QpPUB1VHj+CTgRh2oJriijNJTerAdashM4khl5y76yFRPno3g1EATQ4dniGct0fZc/ibgj/jI4NyV9rR5hnX99UGA/FIe580awgzEXIRnnzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eN+peO5nEs6ZF8u+LR9ohRFkgpzszR3Q64tih58DYaw=;
 b=KRsQrhZ2ebPIFeIafY0sjMkAPjDIMIoDOWca2MIvAywLMqZmsZuZ2bNLY14Htr8IJKvyc32SWfL+UK3ms/PjZvhlCxtrqhp5kuWfm73dJvduOKwfOPn+XfIsulf4wO4nu0vHzh+cs9X4hK6fletNrQ9jou6Hy0/sYlfmt8W/STtFzGRZVSKhdkVKuTQ+m08leurKJ1GHU6X2sPIjWjLiA7DQ7IqK1nqXrPZR+k7dJcCL6SyDwe2TO6gxZtcy1QqzR0Xh/kaSR/To1NJ23ob3DivVFcKIaUJ2g3V5tUeuDhQHyJrlm4cQiOYPxfoPkotc+iq5awH1WaAIE46CK87xxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eN+peO5nEs6ZF8u+LR9ohRFkgpzszR3Q64tih58DYaw=;
 b=cONjYaaKndeTAhRIe66Mbvd9XyZSXQZxZjcpeYwb9VzFfC1pUHqIvR0k3gKo+XZ5JXt2h87jtr0qy5hKZXKj3bBn0udwRDR5b3+5jwa7nk2yMEowNM1lNauhxK+FHSWC1JEhNx9d1oHyd9/pOMPrGJG43Sr4AqfsFF3HBLRYZuU=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by DS7PR10MB7252.namprd10.prod.outlook.com (2603:10b6:8:ee::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.15; Tue, 23 Jul
 2024 18:24:26 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%6]) with mapi id 15.20.7784.016; Tue, 23 Jul 2024
 18:24:26 +0000
Date: Tue, 23 Jul 2024 19:24:21 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        SeongJae Park <sj@kernel.org>
Subject: Re: [akpm-mm:mm-unstable 17/30] mm/vma_internal.h:46:10: fatal
 error: asm/page_types.h: No such file or directory
Message-ID: <bc84db11-1ebe-4d5c-aa15-bec5174d3f95@lucifer.local>
References: <202407240258.i8Noapxf-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202407240258.i8Noapxf-lkp@intel.com>
X-ClientProxiedBy: LO2P265CA0473.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::29) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|DS7PR10MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ae5216-667a-4e45-3da6-08dcab44af05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nrdybUjLNdnXQ2GOpVhgnTSbM01PDLbw9n3EIoENP9lOBtODU1ZzEzYHI3SB?=
 =?us-ascii?Q?Q1ZCrxh/c1D5kExpzXi1B+YLX7tf0p14f3CLXalBshl6P+4F1sPXYh2ev9bp?=
 =?us-ascii?Q?eG1SisLIQ9r84cBB90uMnVs2Kcp+BHtZyYoNRfRMkOLfZ4UbJGUkoZaYTFWS?=
 =?us-ascii?Q?bkEQXPkGvKfBntc63E1sJSVtoYElgRJ0Jo/doNyZouSpF8FWovWkd1uRUz4t?=
 =?us-ascii?Q?2feFF9/9FXjyeSHsHYHpIWGEZzxxlnkRdF1VkH7QjIkyX/9u7wFTSBLB6+CX?=
 =?us-ascii?Q?dsFXApQueiVcdNWngBLIl/48lQ0t3PDnRIVqCtUyeOKSYOsxXMmyZN7eK8FW?=
 =?us-ascii?Q?2h+in5QQ0CIx3jPA2gAY3epHobSch74yVA6Ov7JqZpMlc3N/hOXDNtugSiJv?=
 =?us-ascii?Q?rgOHsjm1DedjVEhpC9Rl8SJanKhsFY/3Se1EEhsvrY1zvfpeJ5xR+acrIl8k?=
 =?us-ascii?Q?PfyGMb8WQYdmsDdh51eC5EG9mLdkSQrUBueiyBNLLqTniM60tjkHQ2Zv2SFL?=
 =?us-ascii?Q?zkA3ib1AQTun7cc9pclBiHfernp36Bn2uz1kmrUzZa3g1TF6CVqcI2zl68gg?=
 =?us-ascii?Q?SCKbX/yVTayd9s1m45PGv7h2j1grKkfV9ay1ITAjslfIVj+38DoOSC8G9Fm1?=
 =?us-ascii?Q?OS+ImKI2Talc4AtlYULpMm6pr/jYJjiuwP+xHH8/oHQNa9U0lVYXC8ESiyXd?=
 =?us-ascii?Q?6th052g7NPqA6DjHl//21tVudWYK6dXoQAirBn4q5FCik7fNZYykl1nn1VyK?=
 =?us-ascii?Q?UCVj9V1lZrw330v5nJuDkV6iu8TCgR8xB/ft5MzhNlIlh2XQrXcJQ+dECzZD?=
 =?us-ascii?Q?ymWdZXf6pj1+tZ8rG2uSBO2IfEZfjkp1LXhPrbk7ryI7pYTC86aWbOHo9iFT?=
 =?us-ascii?Q?0jdHuoBADmQit7zHUICFOWug74GGOngOaGl/ClooNqFZ710+/1refKBqE40a?=
 =?us-ascii?Q?edra9AS5h7F1SHI/3nfH+7CNRYMkR1waatU+z9mT01xAz05uRpWl5haevA8f?=
 =?us-ascii?Q?fytR+WU2eGnUUn7Tuwkug2diXuSvdcDsI0Z5eMDvvAb3ZVEjlGhjrbrJyYKv?=
 =?us-ascii?Q?WATg6Hen6Diq9xzzNs4WnHSVSc+NGHCLw11e3XAe4Sel/gz84urChSnSoqAA?=
 =?us-ascii?Q?g2vgPzk4rBMgXgRqOT/jVboNL3fk+uyjXGp/yKC0tXODUax8hpnPE5UHo5rQ?=
 =?us-ascii?Q?sWERyfP+4O15BgCqGvcsEkY1xOSCLMBwE52WxC9ghSCbsQ1V/4PFQZBDYO4y?=
 =?us-ascii?Q?3ZUtNffjb84G/qrH8ksSE8Rz2lAScWS7Ozizsc4C+V8KCi2DJT+gKsnjMbKY?=
 =?us-ascii?Q?Z6M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ZXTpP9qyUD8zbD4skNa22DF0gxVS4+U43OYgthY5ej36TyRAqVy4t9OC0hE?=
 =?us-ascii?Q?T7Cfdzpp5sGGX+nNp9OqVbr1b6mRtcD4I2KlRmJUE1Kqpbo8YyMw7AW3R34l?=
 =?us-ascii?Q?PhZTeaOsj4pwtxz/QOZyQXHWl4sfLskkB3AARQy/QxvfvODddS5UvOGn5G6T?=
 =?us-ascii?Q?AfUOCHedi6Em69sR8ybPYEWAQy/Lr4peMjBQtZsiihE+wTSkcRVBjskOcHGJ?=
 =?us-ascii?Q?P5fTjSYqK2zdYIwtNkzGOlo43VXp2SzLBzfmKDGaJA78K7z9M01SEgNbgbdY?=
 =?us-ascii?Q?9ymRXflLEgQ9QbF5LJrVfnheYIg98L1Dpk8nmWwNSKecvgQHLuaIfZ6S4QeM?=
 =?us-ascii?Q?vyEbdbTQ/vO0BKR5D++YJqrXFtIz3QF2yxCM/9FxTGKWKE9YIPiNcl+RxW8f?=
 =?us-ascii?Q?sLkGitFDUShU8/ziOV904G665NJkeEU85I4hOdg03sZ++LsqmtR5Y4FxL4uS?=
 =?us-ascii?Q?FEA/dR8ZcQRRaxe8QkiBRcbGhx3GVdczMlLFL0G4537Qz95r8bnbGqPAqIYg?=
 =?us-ascii?Q?si6JE16XBeInjp1rVWBDtucTaj6tr2gKjqyf17nunuOcFlcmVNc2+5lWXtYg?=
 =?us-ascii?Q?0ZfMd1jo3H8WrY2m/jzNMnY06PD/27LHrlcsPPKiabZvNLPly+UKaKzCHw3D?=
 =?us-ascii?Q?Txz4h2+mXT+xLQC4IAufQP0fdcJllZbrwx+pQ4g8f9mA9hGmnT0EJza5bSWd?=
 =?us-ascii?Q?rnGZbgGK6tvnIJYgf9DjQz8awsF/66faTU4fUiNm12TWAccg8yt/3QbOHYE6?=
 =?us-ascii?Q?s/Q3hLXGHXnuj3/TNN2yrJB7ILhVuG+g8n/XxKtjab/N7GM3yeGh8So0YifW?=
 =?us-ascii?Q?/TZ11LEfoUf7fo8qPrvWmW0r0pja8TtqrAqrn9u6dM2o4UmsMhAN++RZnZm8?=
 =?us-ascii?Q?ekxSWj1K6q6uITlPVT+gS1CUyLnLIhhFH+IbaH9rwDvTvnMuUc5PSEPpPw1s?=
 =?us-ascii?Q?7tkJT8X127HknbilfyphyflJTcCeuJA1Ecx2Mr2wItDCueXGqGcInuyWgbrS?=
 =?us-ascii?Q?ArT4NEjzoRWT8sbCrnO520uEpzoUtQdc4QkP+NwuBgrLH/fHnhHsbpNq6xdL?=
 =?us-ascii?Q?3LYM8aThtTnTpdvR1pF8GUt2E4ixySHPcuXV/X5ivYugo6Q8u2SRnEMRUvBS?=
 =?us-ascii?Q?KCWl9wS3IAMPjmUZo3Ri3XMCqqR80IcfXjXf2cmQpdJ0qJduzTzWbbk5UDAB?=
 =?us-ascii?Q?5QHBwMTJguKa4RADq11tybRIEKmL1iAol90dCjVwIVzG+r5Cy8QkWFrU8qiH?=
 =?us-ascii?Q?gmuguJlTYeDem6e6ozM8u+Ga1ijtKUEjCt0HHccqZLpMqexYGeqT/Nlv2Aze?=
 =?us-ascii?Q?srpxJgqpjgb0oSiVhK2CYgT4i7+O1EfCq7jjUPQVNGj7+CKyooRxNuMJ6i8h?=
 =?us-ascii?Q?ZIxi6vT4XtKGMR3/qLGWLUUqKzkJ8JgdyG/6D4ClshDg/kQMBwANIfFrSTQE?=
 =?us-ascii?Q?7fPsygqEETeFSU+kty/t/6+Ioi4/ArIuawkj5JopHhwX1IOGpwpHDwwEj0OG?=
 =?us-ascii?Q?J0oACQhHlpZUGaK12jVy6UoQ1RKmwo96YkWEOz+zPk0r70/4uxXxS9vg+MKj?=
 =?us-ascii?Q?e0pPfKcMPvWjYNgDDUT9iErhglajUk4LEXkxUc2TWxHBzIDz3eAE93C7LIdt?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NPhgMjDBvnrnGRW9pe3Sn+xzLGhTSN6ldM3E1YkfnCxa6rWwQJV78fDTqgA3fUF8KH1Y0kwakO+WRPEue1WOueIQyk2vvLKmBKFBIjoeeArxYjK+PXDTEBSTgOjcTvzxqllTXSgk3XwYHTLMVOyE4xAqPugRC/ZjsQTnUXgwgYtNbsSo6xyZ81l0QaQ4jjlTJ9sGdKyRDhQp85I6TgA5LrFRBHZz+dV5LsD3mxIg5i85srXkX0V7OtKnQ2gwoxgK37+TAjOmaIoaKOWjTne5am2a+NWTJFW4FC7HfSzqHY3t8P5XvRFSDb40G4ARkP9Lwa25auokBMankbAYX07c0iTn6+vO79yYsJBuHHWinN7woprwS9V1ZNsAk1wti7Yft1WViyVACmmnaVvcSv3NaaMZuRrTBl52QrzhuFb1GVtQiEGFr/+V7jfxOz+7kqvYjCdw1FRgACI9SPmM8FKNIINlrxNL7clGjAUwZg3/UcTZnr+z3XSClkinYhFzUuRCmhjx+TExAE0KB0O95lfvKs2PPWFnKqVZS3DXEQXdbrhxP3nWhkmZvedHpIby1xQTey9NJNqIry4x49ECT7HWswlTTqFxWLFYR7NDzFnFf5k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ae5216-667a-4e45-3da6-08dcab44af05
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 18:24:26.3201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9e7LtAfORK+tiMrolGiG+vKLmWS6KgempTRIFf2Rb+QTVKfFTDlP9zd1jXLHuJo2tylHgOdDl3ICbsLzh1mcYSgGAlUe4yFyWOUUulhxcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7252
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-23_09,2024-07-23_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407230127
X-Proofpoint-GUID: OswWgnCy3-GKKXDE54er4ADQMAxxyOkq
X-Proofpoint-ORIG-GUID: OswWgnCy3-GKKXDE54er4ADQMAxxyOkq

On Wed, Jul 24, 2024 at 02:08:12AM GMT, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   cecb3db438d76f7c1005fd52689809696a330474
> commit: b102945dd5b200efff9e8458946006770a513710 [17/30] mm: move internal core VMA manipulation functions to own file
> config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240724/202407240258.i8Noapxf-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240258.i8Noapxf-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407240258.i8Noapxf-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from mm/vma.c:7:
> >> mm/vma_internal.h:46:10: fatal error: asm/page_types.h: No such file or directory
>       46 | #include <asm/page_types.h>
>          |          ^~~~~~~~~~~~~~~~~~
>    compilation terminated.

Hi, thanks.

This should be fixed by the fix-patch I sent earlier today as reported by
SeongJae. Basically we can just drop this and the following include as they
are unnecessary.

>
>
> vim +46 mm/vma_internal.h
>
>     44
>     45	#include <asm/current.h>
>   > 46	#include <asm/page_types.h>
>     47	#include <asm/pgtable_types.h>
>     48	#include <asm/tlb.h>
>     49
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
