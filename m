Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6940F8479
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 11:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730373478; cv=fail; b=pkNbqGkHGjl6fnjdarvvPuUbKa7pIuXfOvQDSMwxs+rTATnTMhFgCXYidZHMcnGoq1o0GNz1JWk0AFsxX0C1YaARQAyHx79NogjqKnAVzvIttTskEsMXCaESAosgmxacY9uNPwgWVh2P25WGdXTv/jmed8ZGq1q87TTPa2sHn4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730373478; c=relaxed/simple;
	bh=t4PTi+w9LL3flkYQ62agaWb+Qxaiza5nHsZSjcFW5LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aSpBuQnSj4+T6gqSbzlPWkAi4URHTUT5YnGABDdstsaW+SzQHFykjwMsi2F1vu90Hc+AsU4IhRSydZ3EsFkqIY8cUGeVwmn+iRnphBN0X8uahZrGWzJ4T2hbzrdORv3cBXvWjRDrwoSmerEPKmf04NKnx6m1KRfmuivZPgdJUww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=clhhiHcx; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WsBGWegg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="clhhiHcx";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WsBGWegg"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49V8uFPO018283;
	Thu, 31 Oct 2024 11:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=eQpciRwJBNoBDeUSAy
	lJwPhjl9NcLN8SvxqaGEKsnOo=; b=clhhiHcx5iOUqYVn4KgSW6nXpqnULjIzwG
	sn46o/Wc83Kjy9kB/hqfvq3JbZbvkOInSNUP9OQumq3uS2NS7pRMEz186dzGihjM
	2pfCWXNSEzvm6EZySG4WlPEEcZg5kmr23dHKWutENfPssHh0+9IpBkp0Mjs2FUP1
	l1wjhs1O78RNrUcLJ5NJKBSWWCRFsuGsZH7Zc4wa55ojRNV4zEhpgBtDJ7DW61ZE
	FVKtmZAO/4jS5pbMwfJGrM1jWHyrzui/TjkaZSwisM+fuvXbu34eJ1jRQ1lsTPJa
	ItsBZWVFtfaILrA08+jtDC0KAI3+WfHY7beDBUmc7Vs2LkUofMxw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grdpa1an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Oct 2024 11:17:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49V8rY4U008465;
	Thu, 31 Oct 2024 11:17:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnec85uc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 31 Oct 2024 11:17:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qo9e3qbA1UKQv7a5QxT0xgmG5u3RKHTQjoxcdZRzf2lXdvNgO4Jy755kMf0xEp6T2PxdbcffbxAp/Uqh25895uOy5uzoR8YQ6qPeT5ne3VZD6U2fwpQ7gSWV7GIpv8CBP1eK96lAoTyuRK2njESDVzZw66WDQew5rF+NHncwEKq8J0SbIdR8F2c7OFcmpYhdUY5aF6F7MBnYZTeQLWcXxQ+tvoNY7yhyRB/gop/v85+g0Ys9kynIvw8M4kYO2fyOjKGCBT80NcDlJ+QoN9Zk2KkbKU8+1QlUN9ABu44j1orphsLKottx0WekAtfors3Ink72bfryaXW6MaBqQqsdAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQpciRwJBNoBDeUSAylJwPhjl9NcLN8SvxqaGEKsnOo=;
 b=zRkIFCaMsfi0Gm4nDmjVYCU1rA+QK13u76g4sRbODWCX1eTCnik0f83DsGbmAZl0VbSCMgI/qTcg2smVJImErMCCTBEy869h9FwBKcvFDGaLltESHezUaGX0vNMV59kJssm3rjDijE7PGtRohBtGyGwUlO0japzC98QpOF9ScldYn+rE+nsjTDeEqGsr8ede3+hTTRXb77t0j0TSvXXWgggYfaCZ54acLWFj0RXkqqPO1Y4G/NwPRDGrX0L/9m9PuTZ7p0NA9pHiYS1TrGA1FLw/sFTnghTpaLvIjymt4kQ7yubrpF0EEERlZp1rRhaWUXDLsy0Lg4faxJXw+ye8Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQpciRwJBNoBDeUSAylJwPhjl9NcLN8SvxqaGEKsnOo=;
 b=WsBGWegg7VY8uexUBOnD1pFLu/2CBa1ceeBgxkAacf4xON7PsJL8r7hrzqkIRdx1LOiEozn+gJy0e9wFphLxdc9WgZFmwv4wVIJ5nkHz7DcEwCs+qiBlFS1WQwZuzI1Lhnu2qZG3JPAOueZfrwRSm8JuKhB/E3xZyZr4u+CMpMQ=
Received: from DS0PR10MB7933.namprd10.prod.outlook.com (2603:10b6:8:1b8::15)
 by BLAPR10MB5105.namprd10.prod.outlook.com (2603:10b6:208:325::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.36; Thu, 31 Oct
 2024 11:17:30 +0000
Received: from DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490]) by DS0PR10MB7933.namprd10.prod.outlook.com
 ([fe80::2561:85b0:ae8f:9490%7]) with mapi id 15.20.8093.027; Thu, 31 Oct 2024
 11:17:30 +0000
Date: Thu, 31 Oct 2024 07:17:28 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: kernel test robot <lkp@intel.com>, akpm@linux-foundation.org,
        oe-kbuild-all@lists.linux.dev, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH v4 5/5] maple_tree: add a test checking storing null
Message-ID: <fs2mmau42zex4dey4cjzp7vyaxyjprsdtkb52rmuyszzigptqb@ikrbpshdg7gb>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Wei Yang <richard.weiyang@gmail.com>, kernel test robot <lkp@intel.com>, akpm@linux-foundation.org, 
	oe-kbuild-all@lists.linux.dev, maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
References: <20241019023716.4516-6-richard.weiyang@gmail.com>
 <202410230105.UApdwd9S-lkp@intel.com>
 <20241022233247.htf7diduw2ojce2p@master>
 <jzmsbn7iabvfmsjzjowmmccv2ou54uyyiuxmb3jxdgcc2zpd4m@7olpq7oacxkj>
 <20241031080248.7bd5iy52wenptsp4@master>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031080248.7bd5iy52wenptsp4@master>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT2PR01CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::30) To DS0PR10MB7933.namprd10.prod.outlook.com
 (2603:10b6:8:1b8::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7933:EE_|BLAPR10MB5105:EE_
X-MS-Office365-Filtering-Correlation-Id: ae930d62-1c03-4a8b-d31b-08dcf99d9bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QjkqhtxuFfUiXp7Op5NJ/mpf/9FGLVXsmMyUZYa3Q+/sWtVF4aTO64qMVJkQ?=
 =?us-ascii?Q?dd9si9HhghXNeDnii3DP/aD2fAsj6WIdDpHbln6ejaXSu77iSJHR9vOLT75G?=
 =?us-ascii?Q?iK4kjQ3Z/iKVieQnbY/gGl3ZL1Euv04ztq9eJFaFkKOsOHlvaOSjZBmipXUo?=
 =?us-ascii?Q?qOmXelXtGDLwSNBi1thCmJ6O+knc1Wf018jwAhBX4f5ZJvkL4uk4MpebLs9/?=
 =?us-ascii?Q?WSmURjXUUetU/xOdah16FQXchJYMSJ+9a+IxfrPzYl6gzwEJX2vrXgYF6bLb?=
 =?us-ascii?Q?JwE1C/NUwUQTkbSS/MY5QfQmJnP6PxCaBQ8KAzfOXlJdtf2xGdX6TKznBkNH?=
 =?us-ascii?Q?t0bI5yKWDEzlB/9V1cw/UUf9kpE5UiefAK6aCEX2QA0qOH+7nqyXW7e8IgDI?=
 =?us-ascii?Q?wTT7w1MZJCrX/6BVGN6O7OSG//I+PmQWV1QFSNmU34GZTZ9uUX7DkNTVQktY?=
 =?us-ascii?Q?lJPJQ6+5h8FBdtY+3R8dHtRsKyzj/t+YddZl487VzgZMPAQ+CO/Xx73b9N0y?=
 =?us-ascii?Q?qgsLZZmCBDER7iFkRdAFaVd+dneoOX18wOLWxikcHnHtN3WnK27YPiw3tVOp?=
 =?us-ascii?Q?hpMNCLcSZuNyGrzDzWVs3uGvwlcJrnxBFcV6GYlYDIahNt6c6s7zbeFu6NG9?=
 =?us-ascii?Q?gM+wprGCivVDz09TYagLlH8KGG2PodtmmgFhPoqlu20T3sWdKL3o4JJs+BW5?=
 =?us-ascii?Q?tLFZ+qlE3nlVQBEPv3oSVHpYpMMo+ud5/Inn5ab6DrQYotjLgkVAWtWMzygs?=
 =?us-ascii?Q?cyCyLmFKLHC0ZCM2AZIUVsRkn+8ja28Ig3uMTj7t2rxRBZHUMNPdbBKCTN4u?=
 =?us-ascii?Q?AAMkH6UKQO9lgTBT1b3YX1WEvwwVbhwARvn45Ke4egOMOobZ3jRf0IAleZUH?=
 =?us-ascii?Q?skDEdI0ZeqtXGP4ajWjmBFF0zi47KHhG/aK4sr0MPT9z+WoFKzq/w0ZhfmTT?=
 =?us-ascii?Q?FNW3+5dZ+nnfqroSTFfMtL01lfznnEJj7/0I4Qxu6Ba7ZBVCUwZnmzWcEGDO?=
 =?us-ascii?Q?yA8KASkKZ4hSyJnujmFRhWKJt9mxpEnUQm3UqbZkRnNwR9ne/lpKcHQYpt2N?=
 =?us-ascii?Q?3j5UoneBWZ8EKE2wUN26MI+GvMQBz+zOQu6omyPxjxQba7NEtfhrf6+CHD0u?=
 =?us-ascii?Q?NQivEU/1WG+VOVPChDPNM37cTutjfn20lV9t/ON8QcEbG6FfbiDAePciKN1I?=
 =?us-ascii?Q?KiJPWSc+4ZQO5k3Z6z3E6YUzNrIjwqZa2ccYVcS2cq5q4yFc2E09WlXvbzgj?=
 =?us-ascii?Q?FfKaVDozkr6BWgAY4vSNnUdTrzHLsm7zdhxmKx0PVg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7933.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8wMcUbkzAIB5azuM/AeebVu5yaIN4y9xv7TQhzBW5XwfuqIDWtrwJCoO/ZB/?=
 =?us-ascii?Q?svvW/yl3+ELQivCNryQk5oSivlF4wMVXNDCxhO1YC1psxH87mKnRl9ATdXkZ?=
 =?us-ascii?Q?RuTNBugqSr6b3jOls+6F//qerHardQiKKO8NzGrexSI2wcyGskka0rMBWnOV?=
 =?us-ascii?Q?F6yWcGf0L8o1G/7Kj+3gQs0bZ62CIC6rz6M04oeUUtJgTOk0/zo4+Zc4YQvC?=
 =?us-ascii?Q?iIA4NipZs5I48N+fSGXW3FPf3Y8W6pzJa4inbi/jYgqOi0NrMtybMqvJYmaW?=
 =?us-ascii?Q?lBuRFIJsXplx596lS8kCds3k1012M89iOeeX9dqNSkk1hqHi/tHFLehNR9or?=
 =?us-ascii?Q?/NEAqNZ8y0Z440UWGfQLC1GkkeobRxXCU0qMTHRW+H5kkNXdirF0QZysYnpk?=
 =?us-ascii?Q?ZY5TPZ/bLrqlDieJpbwJVqjSxUGcFONzWt7uksJlcf6ssteBxci49Ut7dWPS?=
 =?us-ascii?Q?gPPvIi6tavUjh4ZCvwkfcAfGil37ZYlk/DUzYuI7z1Xw/AbBcxKSI+kGZWMs?=
 =?us-ascii?Q?KBmna3kW3iBe5VOCWQhWbJhfDnaUbEUjJ4AhfXMRGrvlXPusQfRKzz0GZGs3?=
 =?us-ascii?Q?RdT2/ub60CQ8v5jCDEhGoi38GjraqRDsLcLm/koDWo54XXS8yD6s0gKlkBf2?=
 =?us-ascii?Q?MRbMiXadSGnK9PIUq5qhMYVrcjXUnMMdRLjK9jV5/2NOoZ9vQft1LVUpbFom?=
 =?us-ascii?Q?82ls5BFqdN9OZUJP+cXmQramr/SOK/GKAC9u7QFtB9+ZdwQ5SMNQ90f6m4IC?=
 =?us-ascii?Q?aZMrzx0vEwrUkagefw1s60/ieYKOoo05VoF9rPXC1b23dmAReRNnSeC40aKc?=
 =?us-ascii?Q?TKGvLTIOehBQW+wJfJTNoWUMDv7JjHZBNlC3loCAoECDh16gH2ofuYDjA3m1?=
 =?us-ascii?Q?hHBHQMXosqXcPUQElAc/a/xHO+dfdtGwN5JPRwt2LZoYnGKt/slW6fynksIs?=
 =?us-ascii?Q?TsMgMMh+ninaqd3dhWYHcOyPwoE65axaQZSNXdO0BC52Dnc9fa3bcYA1zze1?=
 =?us-ascii?Q?dRyyDYjeF3wi1CH1eFHjU2Dfd5oMClzhtNK2Om0osOOlWF8+DPDsScCIEGd0?=
 =?us-ascii?Q?r/C+FHsR5rogblfeafWIloRurePILdV7v9mNDouAqDxMqGFx00bjnpdc/Jtr?=
 =?us-ascii?Q?G5WPERaynZjXC/9pk0ZyEFXV0iK87KtqecxWicJ5S99NUleKN4VJhaRHrD5L?=
 =?us-ascii?Q?OQpQrtkiZohbNSx1QbHQRHv7JZvZj1z+5ZxhyyUi5nocpZi5NhxUqfkeqIrN?=
 =?us-ascii?Q?Z1sZrrvP98OWG0jXpbBzq2VGaVGV3DsLYf0JwynphJ2ZrdYSMspd6fLASJ+6?=
 =?us-ascii?Q?3r7LXPNjIV3rNdQaXeYYX06niUK33aUnrw+eMr5SPlrj91pmG5XHijC7Z4tY?=
 =?us-ascii?Q?0PQTZBEM5GaaRAFe00z41c/OYoucRu2iSVD7749Bnhd9JL2b9m0uXYvtLTp0?=
 =?us-ascii?Q?QW+LsbejlkhQQVsx0S3dqsigc4+v10bNSjn6tBUw1uBZ7+Wussg3hBLB3BaF?=
 =?us-ascii?Q?bQY1hbTrc21RKM+/3GXA5AVor5aH6ZT+AH5BOzZkYPUbYiSOVOn8Hizobxmt?=
 =?us-ascii?Q?mckQGwskFMb1ZbWB7K8G1Jt2VVK36/W51H+sK7N+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ipgvSwoqljUae45RpULQmuKIa7OeA4t5Eplr272Fae87Rk6P1vzfh+nBMQb5WZ5vSNRxyezK+Inp1IWOm9VQvkB5gjZvRW+fpDIaaEn//yKSu7ggDk+RmiF80v2AJ8BWgmO7BJqrkqYLe12Gwqi8QC/xCwHcwg4ehMwNYqxk2Xq37BVV2doGMGfqDek7QOBI82YJ82Q5eeKQb5AYSwLMcFaMSqAOCYVXcRjg70UERABilBH/UIUSxtF55/QOkw3UJ+ova/xNlnIQCJ6BTuV7z9IVOHs4DD7nKeiDYKpJDP7CqRBOjGjdUHuW4i++QmjWFIOl5Ri3fZGMMS8iPe7lODiH2ETGg4d39WNRhrlrx4BS6McBmMWxt6YVm2cz46mqRFNcAttBRL/mYVqBY+pnbtRX+NlYVeKqjSCPnma1/qEdfs2nQj6FEynbddhTMhDsY+Xp/zcVCORGyISz6gLpN/Zeba8dyteLJcnctY967UhA9pkBZWE4FrpZ1EoU4/Xe164qX5ZxELohONMHbnyWzxlqhTqdMdqUPqScGxij5jPNv7xyB+rEEqqWy5c0K+u35Y3gASSU/cY+GEC2hK0S+r+5A2pVgmvhSrqVp+FTDTs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae930d62-1c03-4a8b-d31b-08dcf99d9bcd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7933.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 11:17:30.1145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kGNj7soKhBML/yuzeXDxdgUuwGu3yOT8JNft1OSbxEEfmxjFLhyDJiEaMFXP8Tw1Ed4Cr4GvOM2ffTsyFzBorw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5105
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-31_02,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410310085
X-Proofpoint-ORIG-GUID: iTyI46j9TCrNkueG01v4vvkYihRDliWc
X-Proofpoint-GUID: iTyI46j9TCrNkueG01v4vvkYihRDliWc

* Wei Yang <richard.weiyang@gmail.com> [241031 04:02]:
> On Tue, Oct 29, 2024 at 11:29:39AM -0400, Liam R. Howlett wrote:
> >* Wei Yang <richard.weiyang@gmail.com> [241022 19:32]:
> >> On Wed, Oct 23, 2024 at 01:37:50AM +0800, kernel test robot wrote:
> >> >Hi Wei,
> >> >
> >> >kernel test robot noticed the following build warnings:
> >> >
> >> >[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
> >> >[also build test WARNING on akpm-mm/mm-everything linus/master v6.12-rc4 next-20241022]
> >> >[If your patch is applied to the wrong git tree, kindly drop us a note.
> >> >And when submitting patch, we suggest to use '--base' as documented in
> >> >https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >> >
> >> >url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/maple_tree-print-empty-for-an-empty-tree-on-mt_dump/20241019-103832
> >> >base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> >> >patch link:    https://lore.kernel.org/r/20241019023716.4516-6-richard.weiyang%40gmail.com
> >> >patch subject: [PATCH v4 5/5] maple_tree: add a test checking storing null
> >> >config: x86_64-randconfig-123-20241022 (https://download.01.org/0day-ci/archive/20241023/202410230105.UApdwd9S-lkp@intel.com/config)
> >> >compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> >> >reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230105.UApdwd9S-lkp@intel.com/reproduce)
> >> >
> >> >If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >> >the same patch/commit), kindly add following tags
> >> >| Reported-by: kernel test robot <lkp@intel.com>
> >> >| Closes: https://lore.kernel.org/oe-kbuild-all/202410230105.UApdwd9S-lkp@intel.com/
> >> >
> >> >sparse warnings: (new ones prefixed by >>)
> >> >>> lib/test_maple_tree.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
> >> >   lib/test_maple_tree.c:1456:9: sparse:     expected void const *entry
> >> >   lib/test_maple_tree.c:1456:9: sparse:     got void [noderef] __rcu *ma_root
> >> >>> lib/test_maple_tree.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
> >> >   lib/test_maple_tree.c:1456:9: sparse:     expected void const *entry
> >> >   lib/test_maple_tree.c:1456:9: sparse:     got void [noderef] __rcu *ma_root
> >> >   lib/test_maple_tree.c:1468:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
> >> >   lib/test_maple_tree.c:1468:9: sparse:     expected void const *entry
> >> >   lib/test_maple_tree.c:1468:9: sparse:     got void [noderef] __rcu *ma_root
> >> >   lib/test_maple_tree.c:1468:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
> >> >   lib/test_maple_tree.c:1468:9: sparse:     expected void const *entry
> >> >   lib/test_maple_tree.c:1468:9: sparse:     got void [noderef] __rcu *ma_root
> >> >
> >> >vim +1456 lib/test_maple_tree.c
> >> >
> >> >  1389	
> >> >  1390	static noinline void __init check_store_null(struct maple_tree *mt)
> >> >  1391	{
> >> >  1392		MA_STATE(mas, mt, 0, ULONG_MAX);
> >> >  1393	
> >> >  1394		/*
> >> >  1395		 * Store NULL at range [0, ULONG_MAX] to an empty tree should result
> >> >  1396		 * in an empty tree
> >> >  1397		 */
> >> >  1398		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
> >> >  1399		mas_lock(&mas);
> >> >  1400		mas_store_gfp(&mas, NULL, GFP_KERNEL);
> >> >  1401		MT_BUG_ON(mt, !mtree_empty(mt));
> >> >  1402		mas_unlock(&mas);
> >> >  1403		mtree_destroy(mt);
> >> >  1404	
> >> >  1405		/*
> >> >  1406		 * Store NULL at any range to an empty tree should result in an empty
> >> >  1407		 * tree
> >> >  1408		 */
> >> >  1409		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
> >> >  1410		mas_lock(&mas);
> >> >  1411		mas_set_range(&mas, 3, 10);
> >> >  1412		mas_store_gfp(&mas, NULL, GFP_KERNEL);
> >> >  1413		MT_BUG_ON(mt, !mtree_empty(mt));
> >> >  1414		mas_unlock(&mas);
> >> >  1415		mtree_destroy(mt);
> >> >  1416	
> >> >  1417		/*
> >> >  1418		 * Store NULL at range [0, ULONG_MAX] to a single entry tree should
> >> >  1419		 * result in an empty tree
> >> >  1420		 */
> >> >  1421		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
> >> >  1422		mas_lock(&mas);
> >> >  1423		mas_set(&mas, 0);
> >> >  1424		mas_store_gfp(&mas, &mas, GFP_KERNEL);
> >> >  1425		mas_set_range(&mas, 0, ULONG_MAX);
> >> >  1426		mas_store_gfp(&mas, NULL, GFP_KERNEL);
> >> >  1427		MT_BUG_ON(mt, !mtree_empty(mt));
> >> >  1428		mas_unlock(&mas);
> >> >  1429		mtree_destroy(mt);
> >> >  1430	
> >> >  1431		/*
> >> >  1432		 * Store NULL at range [0, n] to a single entry tree should
> >> >  1433		 * result in an empty tree
> >> >  1434		 */
> >> >  1435		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
> >> >  1436		mas_lock(&mas);
> >> >  1437		mas_set(&mas, 0);
> >> >  1438		mas_store_gfp(&mas, &mas, GFP_KERNEL);
> >> >  1439		mas_set_range(&mas, 0, 5);
> >> >  1440		mas_store_gfp(&mas, NULL, GFP_KERNEL);
> >> >  1441		MT_BUG_ON(mt, !mtree_empty(mt));
> >> >  1442		mas_unlock(&mas);
> >> >  1443		mtree_destroy(mt);
> >> >  1444	
> >> >  1445		/*
> >> >  1446		 * Store NULL at range [m, n] where m > 0 to a single entry tree
> >> >  1447		 * should still be a single entry tree
> >> >  1448		 */
> >> >  1449		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
> >> >  1450		mas_lock(&mas);
> >> >  1451		mas_set(&mas, 0);
> >> >  1452		mas_store_gfp(&mas, &mas, GFP_KERNEL);
> >> >  1453		mas_set_range(&mas, 2, 5);
> >> >  1454		mas_store_gfp(&mas, NULL, GFP_KERNEL);
> >> >  1455		MT_BUG_ON(mt, mtree_empty(mt));
> >> >> 1456		MT_BUG_ON(mt, xa_is_node(mt->ma_root));
> >> 
> >> Thanks.
> >> 
> >> Will fix it to xa_is_node(mas_root(&mas)) in next version.
> >
> >By the looks of the bot output, there are quite a lot of existing cases
> >of this in the test code.
> >
> 
> Hi, Liam
> 
> Thanks for your review. I may not follow you.
> 
> I saw you add you RB. Do you prefer me to spin a new round with this adjusted
> or the current version is fine?

Please fix what you added.  The rest will need to eventually be fixed,
but someone can do that later.

> 
> >> 
> >> 
> >> >  1457		mas_unlock(&mas);
> >> >  1458		mtree_destroy(mt);
> >> >  1459	
> >> >  1460		/*
> >> >  1461		 * Store NULL at range [0, ULONG_MAX] to a tree with node should
> >> >  1462		 * result in an empty tree
> >> >  1463		 */
> >> >  1464		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
> >> >  1465		mas_lock(&mas);
> >> >  1466		mas_set_range(&mas, 1, 3);
> >> >  1467		mas_store_gfp(&mas, &mas, GFP_KERNEL);
> >> >  1468		MT_BUG_ON(mt, !xa_is_node(mt->ma_root));
> >> >  1469		mas_set_range(&mas, 0, ULONG_MAX);
> >> >  1470		mas_store_gfp(&mas, NULL, GFP_KERNEL);
> >> >  1471		MT_BUG_ON(mt, !mtree_empty(mt));
> >> >  1472		mas_unlock(&mas);
> >> >  1473		mtree_destroy(mt);
> >> >  1474	}
> >> >  1475	
> >> >
> >> >-- 
> >> >0-DAY CI Kernel Test Service
> >> >https://github.com/intel/lkp-tests/wiki
> >> 
> >> -- 
> >> Wei Yang
> >> Help you, Help me
> 
> -- 
> Wei Yang
> Help you, Help me
