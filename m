Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB6B146D6E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 20:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732826466; cv=fail; b=HT3/oq+tuSkSVxVoEPIQ0lK/p/ZT0ijw7AysgzPnM8pE3mMfkUopT1G1Si83vH7ygors+0Y4uIv3mTmHJsQxS2W1Rcq9gUNV0PE4npBBrPv2hZB9uiX3KMPyYLyf59ea0gIhIqBa/sKmgP1UpPhWPD0+OYfWpluH7sOp6syFl5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732826466; c=relaxed/simple;
	bh=56R7EO4tY08JX8ohNkA8ZYsGaRA25q+7nBQqOJFYJpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ncU4p/yNWkM8/KCusvX5xUgEznmCp8tXgaSpibr4LMhoF6MsaF7mWBKIYzgBrpTXQTIAlZzJmObsde8Asm/DpUbv4HZEAYO7qKB0GY3lc0tFqe7sbMsXK8pbhDXnG+qku+rae4+zB22vaUt+9xUiCW5T46/X48Oxh+yxWbcTMG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=c3QcNDKh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=A6NhHjHD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="c3QcNDKh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="A6NhHjHD"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASEOZAW025829;
	Thu, 28 Nov 2024 20:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=L97W8BWzWvLG7bZWzA
	QwNdVA/U5pQc3E9vDoL3rBC5I=; b=c3QcNDKhgTYrS+81i+M2X7aAhJ8f5C4MaU
	n1UcfqdAj1vwPs+ClSFg0DyyOmDT2IxFBHNTVAIHZUZlui02FwM53EeIy8+tb361
	J3693bQ4PhlmH5P73869vmt3Eu17Zl+J7DqeapncQ2LEWQyHZTTc7vZ70avzhj5V
	H6uS8MFLoC4CzlKBAu4PAm1CvbKYY8nw3lAD7ZXXQPdlATB0KZgsF1Pr2PoznQUu
	mBX9qJLd7JByKkZAdI/MFotFz7fHZy8jUxAaunsmRPOZaj7wzDcFpLrlSm4efH1d
	xIDfscEHMKu+qy31zyprGCeSLVEN7xK7ddgs7hdSY78fOPZ5xOXw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4366xy2b70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Nov 2024 20:40:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASHWWAR001709;
	Thu, 28 Nov 2024 20:40:55 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 436700pm7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Nov 2024 20:40:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMDuIWVgdAamVRc/zhgZu73w/6aJd6guxMEsnqx7xys9f+d2AoQOTNF0eLUNoB8/VzQqoEVOX6OAAgqdpIZ8DPIPgNsYMqTPPfq9x14/8Xf+flfD6uJirRON7PNF0uP7cBoGxloyBvOSFvnBjJNdt0YyarSqaVrHhvRrpoZ57bEOKt2m+gzlIqigvHqZGh8wgZMwYsry9O0N2zlBtIzCKcMR9jaocgMG66dXQ9J/kXuZWBLlsFOZjhzMKZdkTtr4TAr65K5XeBwfeSp60og6pKcXQoM9A3Nxhxh3u6ZeTMLxH+8gi4PJA+FEeVQbpDNOY4+HyRQr3/TmSSYXFY9Chg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L97W8BWzWvLG7bZWzAQwNdVA/U5pQc3E9vDoL3rBC5I=;
 b=KwvR605h46Gw698IpdyuZVZrSROZRpxAK2pVzvl1r1WMY0KQbjmbu6H+FOK24NWZXvwhdgSwVY95T54Czv/e+WLmDoRm9lm1B1T0U42BwdnrN1M8rmKOHGnMmvltayu9k8g+PQq6FIFaPNZht4coI9KcLrqOqmhenZc4rw88K83UsZjXv3dyi+jl1kyG+q11aeII3ueK9VqwZODctKm6yxbkKVYw6ELa4uzVNqx2pP/7ciuAH2eFiEaJtof8/z32bdaksdmX5LtFMRK7gGFJnoIaklkmrvhRjX2eYyFFbrfIiKmKt42ltWd8f9nen/Ao48FDmoziPgrrv4h5iboLWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L97W8BWzWvLG7bZWzAQwNdVA/U5pQc3E9vDoL3rBC5I=;
 b=A6NhHjHDMf/PHzjr8xpls0e8GNOHlC0EBhXNTA37gk2vE14vguMbFwy9SZHKaQGnupXpdMLdHOnNGvbE4SZhib2FVRBq0jUwMI399YkUt1xLW8SV9g/jsairTiwgP0EyghxD7rr+z3y8OF+Mkd5ftUZ9U79KWJp0UiSHUxC2qy8=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SJ0PR10MB4640.namprd10.prod.outlook.com (2603:10b6:a03:2af::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Thu, 28 Nov
 2024 20:40:52 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%7]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 20:40:52 +0000
Date: Thu, 28 Nov 2024 20:40:48 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [peterz-queue:perf/core 23/23] core.c:undefined reference to
 `zap_page_range_single'
Message-ID: <19430bf6-a0ac-4141-a036-da6c28656200@lucifer.local>
References: <202411290418.A6ck1LCB-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202411290418.A6ck1LCB-lkp@intel.com>
X-ClientProxiedBy: LO2P265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::23) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SJ0PR10MB4640:EE_
X-MS-Office365-Filtering-Correlation-Id: da988242-9be9-48e4-4640-08dd0fecf353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7O2oEZYA4neWn/fw4nNN7IGspxBHGo+gJVKpXpbeuqYSzMkkMBdy2wx1DhRR?=
 =?us-ascii?Q?derCVW8aWyNn6JpaTqEWzXHzD7Ux4VoeFpcQfDVX1lm3nIWlt3k4Hk3bsfFe?=
 =?us-ascii?Q?Qm6EwtwCIZW/LDWFnK1caY94DcE0FDgCuvI7Tun1iJDRVDHBVQzo/+n4vur2?=
 =?us-ascii?Q?bkg0PHSyUCciG8KEn4FtQcgh8oJVypvHCk/4tZYMEe6Jj+7ATZyM3LSjH6HH?=
 =?us-ascii?Q?e6fgwo+zCSYmJ2plq9VGXIoS2HKvxYQkcyVI3rh6NvAPhNwdg8ySPwFoOY8F?=
 =?us-ascii?Q?yL98wRAlPRqE0yzdlGtds+2YFLp4IdOhjXCDiPNapRxwJ7fttIxM2DoRRUD4?=
 =?us-ascii?Q?2OSVoEpMtE20VRxYqJ3gxEzGoxP+HJvmM06/upOuvoz0ti698XwaKuGRTugJ?=
 =?us-ascii?Q?Dv0UNW4UKPzko1JUv3xJgYQfxjRgl9VTMNptDGWxCsSVjIbU0OZ4MLDmbQBj?=
 =?us-ascii?Q?nL3uJjnZEaGARezJfwIuZXGY5fHVshw0WMpDrS6STN5rW4y6a58/zRLl9lEV?=
 =?us-ascii?Q?B6wn9hqWSa/iW7ldbjVeNMJTUQ8zHDayUQPbvzr9OEbLNYQQ7zI2N2Y5pD46?=
 =?us-ascii?Q?FJu8pcoAhw9QPQCe2GV+3L8lzZFHJzu7pwrPs0MppQBETfqeit+uIq9NBLid?=
 =?us-ascii?Q?1GkGasOcwl2M0Lsv7VM7OrZCddfC/T8Joihrk0UDtfXwc9qRo1diyeZFi638?=
 =?us-ascii?Q?0C6C2eE6eHvAm/sLfLR8Bh3PZzAMXPfsq/mJcwK8t6yUErLns18YkVV0Vo0P?=
 =?us-ascii?Q?fBKaracH+yuaf+HXtcf5qwI5D7b3U4A5UFYEsevdAyJVhlr/5uIr3R++znKM?=
 =?us-ascii?Q?/eluffVPJjvo564X9bTY9ixDBRQh3e4XC1idxwMIVIPKr6ni750XSqIHifdG?=
 =?us-ascii?Q?vlnqiYK0o3B9y89I2Q0kEqBj8yPe6itjZ7vPzVdaXTmybepfrd8HWlPQHtcI?=
 =?us-ascii?Q?F0AnWTBjTEIP8zgxNkr9IsNU1m6Si6yk0oT766c82nTuodJD9CdJrGeIpt2w?=
 =?us-ascii?Q?Tv3lppiVMt+mOObzkkgfqr16V5jlStdXRPYiUL69HvVLYcsepBwiHARTSlHr?=
 =?us-ascii?Q?m/PD9+EUEv4F3jNkDb9Avqoyo4jX7AHzdtN1vh0Tx/GrwnqSLvcXEvHFSVRT?=
 =?us-ascii?Q?pGkGYd2wGyXyQ55tD2LCiZjrAKgtjHy4IW8NTLpjv7KwzDT9AmrHA1mPccOu?=
 =?us-ascii?Q?ua/fe1kq1SdVk5on1Fv/9zS4L0gmBozoAecuSselLXUZeGnXTqjE4pHCXgc0?=
 =?us-ascii?Q?mqcu0kDps2fNUIUIghwY2Gu1BuJb6kB4MVqN3avVq9AMpICPl75x0gsvMM+r?=
 =?us-ascii?Q?O0k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2qAWj/cTZpGipT+gnvgvQkWFG3vaHIRPXYAZl/RqDMjy7cETiBzq2pv2R7Ux?=
 =?us-ascii?Q?EtW9elIc6R2HhMB2UFtKEfRwmLENU+nl6zm6EJaoZuiWLs0ogHHnwQr67XtN?=
 =?us-ascii?Q?qzQBYSy0OFG9w6fR4uWYCUu0knwIKcgtyqoezrmj9tMQUNsPbENHpwxKt8BF?=
 =?us-ascii?Q?W8pO91S3mu3YMbemvOWSeneRcp2pnvZNwWPVnR1ui9cz6FZCRsKFcuV0tc9s?=
 =?us-ascii?Q?mF9dr4Zx/XAHLdwOQLxWRYAK5yNTeMfnR5LV7e2CltmK4zSvvXFIDEb7VJNO?=
 =?us-ascii?Q?w5rWjaEnna1vj+ZSsjPDy9Ed8XLGg0oU3tibDGoeJA6nqOI1iidB5kW4FrHI?=
 =?us-ascii?Q?A/ilQrjVzxw4TCLyAJZneWpm/GCHdb9O+KCpVh/qU+hlw+CgCSGMmGfVv66T?=
 =?us-ascii?Q?ff1m+7sQX2PmeatPYpBIYeIT1bQSDBOWTYXDnKG1ppN/W+3C9CE18QIUOyM8?=
 =?us-ascii?Q?o/QWY1ukI0RcQjs+JeJ75tzsQcFiMR80RhdPO35JBLTDKiwzzaGpgMZmeLjk?=
 =?us-ascii?Q?d7BKzJDQ2tCB75/ifToeQGDyk0Q0u5QI/v6lJGk3JnYFC2ueNaoM6wIKm3SD?=
 =?us-ascii?Q?AsEiLpDPVrLjT9klaGZijpW7e9qPADu0u6Up0sWbyaObNLK5Zxp2t5cDqH91?=
 =?us-ascii?Q?MJoZOT9V2fQ0LWbAkUjPTOQ9OYPcRcvx2p8lhlsxfQYfJEalpm4ZZkEkyTlO?=
 =?us-ascii?Q?reoZSiQcCqVPzS8XKrkO8/fwxy46tmLiKtgkSRhv+qa0fDlTICB4irpQAI99?=
 =?us-ascii?Q?i/zL9kgc7iUESSnblTeNK2C3IewFvb6Df/BmxZsdD43bJVUgFlQlGYAykssk?=
 =?us-ascii?Q?sF7EdRfugAt6p6a+8qJzh8b+IxJtmOz14bIulJFxipC77GYMX1eeRItriJg0?=
 =?us-ascii?Q?JNuGW2odjOKbGu83sISkmj2RmkHqwtgX5YSx0ftgdtCjSG0tXx1CwITHxg3r?=
 =?us-ascii?Q?tZ2sRv+7R+qrSgIZj2Fal6XNmNp2vAFWHsS2JVE6Fm9a7mtH5u/nUM+qxy/C?=
 =?us-ascii?Q?rQsD3wMTAqixW6rYIi71hgN22EN+AgXOsjMJDuZP8yEe6WJg27cuCU0aWVuS?=
 =?us-ascii?Q?Ti8iNrbmeW1VlUuEzmoRLg7OdFrb4GhJCDvKBx8Ptt5RB5hrAv6iWQmrQzy7?=
 =?us-ascii?Q?kK/uVvU73C+DWGcZYqXfsDeet9PuqQtQMaRcSd+6optd35Io4kIhcuBBlmJ3?=
 =?us-ascii?Q?MF/rjz+54tsXXkURb2YRH/nuy5T4/vUkoybn9VIR4gWV4TjhuNSl8cCDm3h9?=
 =?us-ascii?Q?YAbMtBkGOimRzgVBbGdxr5iuQ3Dw/HvdQE3Uc6HGHDhOs31b0n2DSeh7lZPC?=
 =?us-ascii?Q?WhT/QdnmZpNTVzBfsRMhYiBd1uUsPOgDCoi+bPvPkAsYjHaFeXwwVwLYsh16?=
 =?us-ascii?Q?UzXkJT6jgS2K3uPzlBYJovORD4f1WujiEYthz7HkSPY/4rGJEVdtkQIhh8FW?=
 =?us-ascii?Q?bR9c/5nLoanzQBfS8ugMUdAfgrdyI9k8wRxLHEQyvkc9Btrs6GbWNXhF0wQt?=
 =?us-ascii?Q?9QGzsBd9bYMvmg/Ci0vxO8YXbtqe/a638orvmG/4eimbFS6Gkg9DU0ElNfHx?=
 =?us-ascii?Q?t1zCnD+ZwG+cpbF4OM05CTFz7KQN6w5988qzwEdexXWN7OY996GqHk5szvE5?=
 =?us-ascii?Q?kg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kNo5Pm2WEhJZqBnB6yeul9jSY2+0xi5iYZ9FKhTt/D7/ZOton1Hx/3rpsJmNTjlZOOaUkRKj19HGpPR4mXRvyjUEBiXdSE1PCE4koOXQLA5KXc4XD96AxWgD6k/0M2s08xlyHEs3/VO4Dmrs1t8nZ7cHzkaZaZJWjMQpQ+mkkhIgVDg9Endv/bHKXpl+x7kCksr2PPq1JFFYpB/YiWRP7CxWf8+scl87QHLRB31bMfHXQ4QDe5ckt/G2yYWP2zpYPWRbW450d9fjf0J6tcys3r4bh+MUfGybj1j+4D+Y93R32WATPz7CuAGm5OLMv6K3cyHk1XIO3LsB0xyf5GbhGjkFIZt6osnwF9RIlmYMzS9MW+0dXQPq7W7SH31HTRJqV6syg+EnzcoGYsoIQffLEiCL4mjjeiNJygPjw9mtnd+bxGgcBy1BtX6LbFB6eCRRG6Y7H4eXrdi8GifhQxzFHxeb6HIdMHObh1fUx54cgGnK6dZn3oGYq2vVchTq7wV5V0quqz+UDQQwoZ7Xy0Spj9Mm30NjP1AxAivMo9f8QG7cuXcMzFd+IEGzPUAxPLSf9/5sElvKjg1lOOStYc6piXs+kcWEbp9oWZUx6mFz3xM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da988242-9be9-48e4-4640-08dd0fecf353
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 20:40:52.7026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77fxbh6msPPxtSaRmlHrBOUwiWN+2fonWfcWgxkaFenVO4m7cr67lQygDxk5CbG3hJubjDkN0/8S867qSiGbShxzKEx84W6Jq9jTOOWupfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4640
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-28_19,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2411280164
X-Proofpoint-GUID: qYDc5EzRj9AjX0BDJL5lHE2vcCytbD3n
X-Proofpoint-ORIG-GUID: qYDc5EzRj9AjX0BDJL5lHE2vcCytbD3n

On Fri, Nov 29, 2024 at 04:26:19AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
> head:   02fae3a65df8f78e7cbe879f5f089a4e46c95d6b
> commit: 02fae3a65df8f78e7cbe879f5f089a4e46c95d6b [23/23] perf: map pages in advance
> config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20241129/202411290418.A6ck1LCB-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290418.A6ck1LCB-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411290418.A6ck1LCB-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    sh4-linux-ld: kernel/events/core.o: in function `perf_mmap':
> >> core.c:(.text+0x11ba0): undefined reference to `zap_page_range_single'

Yeah, the wonders of nommu strike again. Need an #ifdef CONFIG_MMU ... #endif around this bit.

>    sh4-linux-ld: drivers/media/i2c/tc358746.o: in function `tc358746_probe':
>    tc358746.c:(.text+0x1b90): undefined reference to `devm_clk_hw_register'
>    sh4-linux-ld: tc358746.c:(.text+0x1b98): undefined reference to `devm_of_clk_add_hw_provider'
>    sh4-linux-ld: tc358746.c:(.text+0x1b9c): undefined reference to `of_clk_hw_simple_get'
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
