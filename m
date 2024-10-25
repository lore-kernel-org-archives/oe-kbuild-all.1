Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92D61B3920
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 06:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729838950; cv=fail; b=tFBpaUfCCy1QN23sZG63OYQGaN+oLtQIFPdUwI9F+kptPDz9RKcK3Kclfb11JerEOG7U0b0TqvhoSsWmHMCE9KfLngorqITUA/v/qjBcK13DTKM6Z//SOKISiUGFhkDc4wQIoSNbAFtoyZcsfJZ34yegmFQ1L3BCpRdyaf7q4pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729838950; c=relaxed/simple;
	bh=EDC4jSN0s0OKIMQmxt716qdhEyvrstKA4mH7EgPXoNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FnVoQ1vk1E+O/5l6zc+m0x0umzEH22bovzPJ0YYERBXosxJziGIcq80GnWHS8eplv1GIJOX2Act2bdQbKu22uVtIHSmaGrgFDZ+8ywfjOBSd1gQeJLmjpt72YOGfYhyYpxr//02k0gjUQPdpLN8dcsdOym5foa/0Q27MCuyjVzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=k1XoYNns; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Z1z1rWeJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="k1XoYNns";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Z1z1rWeJ"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49P2fvxO030204;
	Fri, 25 Oct 2024 06:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=qXCMnCtMNAn+KpX5Be
	sqVYxqoS0vgNTog2oUmVyG6tY=; b=k1XoYNns43wNVYwwr5f61kN7QB3zvaq0ck
	bRflpa0kQ5cERW9Az0KHBzkdGh1n2mnQhWH7WYoc3Q1ITgpI/k6/xx3vDQYL7eLf
	4Mna720gpzr4+M8+ECfunQZpH7EeO686qQozx0d2OZm1gsw8OjeCGhoCxr7VIF7y
	RG73DUKE7r/km6k/UjAYQb9OBapz/YaXiO1Sr7A3nTfPydSa6q6AqRNq30SNg/oB
	iisZFJH6eGIeeKrbUVQZ+qZqwVF11YuYpqTvGXjTo01ENE3AJ63FD+tpIT2+IvG/
	m093rAqDgd/6oP7SVXgBJUUJf+yOrWpkopQ1AiaaSknRghWjygQw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c53uv9fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 06:49:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49P6jEB4039390;
	Fri, 25 Oct 2024 06:49:03 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhdgg42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Oct 2024 06:49:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PII/UFCzf0JqUlViT7NcQQ98P1TeXK44+ZTFMjGZv5dEFDE1XwvCGKWl0t19AZiqXiK4h0OfLOBHkeHAV9cH6+z3N1lSb2rtt6FqxAwkwvPLJv3tjAZzUJfhDReSBORvBcDfBboYKO+mS2cPSN++WUACOckO/22e7hzqkvqARAvstj//OH4MIwePil+8t2pysekXQULQcht6w5Kq3h9K2gIoUZvqkSGpjSCqhi+zemRrkwyPoo33nFEbFz35N9IklkJTG3WkE0AuBT5QI/d9ncG0It+E1ui8XQxWdcF27990Pq8AnTieshWmVSbTUOgCd5BUECXtlIOtvdYxv9D+lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXCMnCtMNAn+KpX5BesqVYxqoS0vgNTog2oUmVyG6tY=;
 b=i5MgPNtzmEWgaktnDcww6BXDYH2DtFd/ED5vD9WPlspx56IMTSVSLKHCdqN2sMx800i2JsMgFA3NGR78do2NAGrsVfdn7pByvHCifkL6jrSiD0V9uXDUHWkVzJqjGaDOL6Haqa9y4r4jm1N7Hh5nkVQT4MTEMeD8LXuF8VowwT6nzzJm1qGkJx/cLNP/0gcK8zbXuzdTYNMU7Gaz+0Nx5+UweqscmlfqqC/FeFTIrBwNPAXC7RY9/qD0Z3DUgjOMg3rL+N6TP+KVpNRFvNPTTuYACjgWC1y5s6rwJSd5r+/S5uf5KtIW6RQBDYahO0bzGvLEiQstBlGog3wWtK3klw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXCMnCtMNAn+KpX5BesqVYxqoS0vgNTog2oUmVyG6tY=;
 b=Z1z1rWeJyubqZJ8x0mCURJiqxBbK4FjocNOkEjjIOY+K5Rj8N0kce3eaR9MFOBSHVmUjJ5H1JQUaN45Q2bv5UdUWj3m/S3A02Ii3pkVLWcO5KkHcOjJt2Gsk3rKZuYzYLTgbt4fa07BuIm64yu32hs8UN8E6QHJCDeoCP3mRUb0=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by MN6PR10MB8168.namprd10.prod.outlook.com (2603:10b6:208:500::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 06:48:36 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8093.014; Fri, 25 Oct 2024
 06:48:36 +0000
Date: Fri, 25 Oct 2024 07:48:31 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: [jarkko-tpmdd:lgp-v2 2/4] mm/madvise.c:1098:10: error: 'const
 struct mm_walk_ops' has no member named 'install_pte'
Message-ID: <daca8283-ad71-459c-bf16-a6f0660180bb@lucifer.local>
References: <202410251042.SfLMse1o-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410251042.SfLMse1o-lkp@intel.com>
X-ClientProxiedBy: LO2P265CA0191.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::35) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|MN6PR10MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: fe4474d6-1747-4a1e-5862-08dcf4c10d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B9pR0ekHro0RqZdr+wjMKCy4+mkLH03ZJtrFDRLEFodrcUX/bqNDu5YquQ8x?=
 =?us-ascii?Q?zhwBxwCjlNQa9ORnEzmplb03qlw24PlNxdkB79f60wlKcOS+inyOXAUa8ctb?=
 =?us-ascii?Q?+79nATSowo3nI2SLGyKGNY1TEaOsG2Ma8C4qojn3ydkz5NrCB5mcFKZBhzc3?=
 =?us-ascii?Q?7VCdyfgv7Rqc9uH4iczLYyuu0yMax4rcUnuBUfb7Fjd7vSqQSYDO2qifZ7uZ?=
 =?us-ascii?Q?YtYi4uMtC3mHJIus86jzmBwitok3Owp3wpWrDV8/3PHifgat6AmWhrZQRYS7?=
 =?us-ascii?Q?9nGGXc3C3uSUkM5XJzXakApSvNiaqMB/gs9bisx672E4WJPHKJ6E3zLAKC1T?=
 =?us-ascii?Q?2sjxhig7gyR0fTWGYE79FpzaLvDe3Q1YDxlpAsxZu3ssdWY/q9XIPG6nVwn1?=
 =?us-ascii?Q?yF/UJOtEEP8V8lUPkpGHqqqWyxjPVQcWVbIgglAIcB3M1+khEkO1X6mU9/+t?=
 =?us-ascii?Q?cA5RyoQcJu6cRJgZvoz5EUQl2KrbJvyHoKbRnPmCyRMQLjSRWe53g+A8dVig?=
 =?us-ascii?Q?VL4OMfrQwndN4o/bBmk5oCHMq27VGDvhoykKXGu6jnqZsmK2LQlkKx65nIVD?=
 =?us-ascii?Q?8e9dAjloqL6OANM/wnMKyPnlXZUDfRI64J1AVovXJ2LQbY5GFDbxkF34q2th?=
 =?us-ascii?Q?pmkrY/YIH6PsfCroDmgb9j3y1MXpZp2ogBUGkAe8f3zs7oCPsp+we2f3/DLc?=
 =?us-ascii?Q?v09OyK8mJRwYAAQVWpRSCxfQa7QslYJPqjPSutOiOfaFAsv4JbyVNjOONj11?=
 =?us-ascii?Q?Wc/Aa5BRDHyYzDz8SdUjdqTJ4xqJViXyBU+OU3/VezvPuQeg110Y6FUvGFDC?=
 =?us-ascii?Q?QcQixY/zSoEjA4iwd3fH2n024xEuhSoXTsznCxlk2ItwcMY3jPgYeuckVbXi?=
 =?us-ascii?Q?XsyCKuB/iCeHbLKdFC+/fkKYgL3CVr+tyOPsRe9MwvDdn0hlVxMKsTKacePI?=
 =?us-ascii?Q?62Yvo7jIsTbKM1tHi37Q2XzBWeCq0ChA5CONlWPzJkyEyBilOvaNf59NWNYF?=
 =?us-ascii?Q?0R/gZ70PUt2VXFVSkA9agvLCyM47Wg01C+Gk09ydgTxA2oTlQbasDNuflWJ1?=
 =?us-ascii?Q?chhAM+E9yf6McbIYJk4RBHG4+bKu1VgPEp6Kxo/k3F0EDKkmsM9CPfHi96G8?=
 =?us-ascii?Q?GcT05dz+c7eFrGW2R0qgRNVaqL9RIXCUBlPiB06yoMbz9AVBuLX5VBRzE6QD?=
 =?us-ascii?Q?u7pcXHCinYMfCuOltl8XlPBsqdPKKnV87/ttFbvdtbCL0wPvTz47KljZTgL0?=
 =?us-ascii?Q?pTfhRp5drKeiTbweA87sEX6/Xr5hpQ8M4ig+pfCYsw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u6wfP+pI2arRAjzXpww1jn9HJJDPCN268eTSrXS8JZcYKMwo9bshNjf7HY/6?=
 =?us-ascii?Q?hVMkMeTS4rvYR+K3XHDveIQilUU67haCrCWDhwezs4ZNfOywkTCSIN+Fbr4M?=
 =?us-ascii?Q?gwzYNJpVriffyeHdw7EN2k4zcAnmlbJn39L1QieC8OsreOUXLzGWrvAdYL9k?=
 =?us-ascii?Q?C75FipAtp/DvdrR9hj9OqM1MA4cln9sQnDvpgY6S54t7cZpGprO/PEMuyBP/?=
 =?us-ascii?Q?EjC419H9+az2ytyKIDTySj9zraBPkG0aKS1wRwQqDBCmqGJeNYlWblirUC4E?=
 =?us-ascii?Q?RqjFZDU2md0+NZ8uH0/QYFOoNvPpQyN2gyrfRPnD6ZDbs0FP8mLrLsfR0LGF?=
 =?us-ascii?Q?A34DEZOfNMlbqeJPw805Gq+/qxd07gGtXAP1yMPflWg3HgKuGjCzcjiKMhiW?=
 =?us-ascii?Q?TGz19dV0paf16AhAX4s2MDmqc+gXHsEieUXP9wBDzHwads5OLzCBG4xng1FY?=
 =?us-ascii?Q?nlL3qR8bA/5Iv1mASS9dPU8b7q2/P8N26kzXRhPIXCArNgWw7qNG3QwMVhwT?=
 =?us-ascii?Q?pTCiTW2qC4GOlIEctZsQALxBWqx4cjVN8nVP39gbUmWxN9NSOF8eUMz+xDcL?=
 =?us-ascii?Q?h7nGLR8kqjTisIxgIDs35dR1h4p88qkc5RACIO0xDz21RuhgM9tHIX6kctcj?=
 =?us-ascii?Q?uVJe/4U2RXIJ809sZHYh8hN3N1WoQ1/ZIZUCDo1xC+JsPpdOiDzCG1irPQMC?=
 =?us-ascii?Q?Xx29Cfqg1CNIQPNUPIirJj1a1LCi8yh2+zBtOaOGgzPAJKGfpZ/RanSY0Dvu?=
 =?us-ascii?Q?A6FLaXFDDmlqz/bc4TYSYt9LeJjWPjc8wibghNH7y/KUym6LDtjYtZnleNaf?=
 =?us-ascii?Q?C1TMhjhpsLu+lJU98F+hWdIKmP1iqn0oHQztknZFsFTCTEjEmjzdAxlIQ1vb?=
 =?us-ascii?Q?7AmQOopyEg6vXpfqMflxqkmBYbKe0e0HGI3exS2qq5C0LEbNzXXmlEyMKwdH?=
 =?us-ascii?Q?Nt+a13V8Sr7MHdGJkP/Mxc3Xtr33i6xEqYswOtPuO/p/RqHO3JnvHvZX0bsJ?=
 =?us-ascii?Q?IskNdbwQ+e6Mbpchu1Lzdkl5lZU5mat3mW+akJZaKn6fBLA2Uo3K6og7NDgB?=
 =?us-ascii?Q?iFCLTPIzi3JetLTd6bHJASnLrT9RgO8/pcOvjPrIwAFWj0LHJk/Et0BxHwcY?=
 =?us-ascii?Q?c7yAiJaGS//RCJzrcr32uK5+jkX4XHM/PA56OKh6NT1j6Ih5ulGWgMq5zdyB?=
 =?us-ascii?Q?hvKeJWrDSnNJPHQ5BlAlndRJP6Y2GfKO+0YzkJDK1nv+tFcOOGA/izs9A4X5?=
 =?us-ascii?Q?cnrvCv5uQUFUMiH8O7UprlEJtCSGIYas8+RGzWtmbHI3TWQ1wB/SL9uWyjyx?=
 =?us-ascii?Q?6uFZwYWTdOMWi9Pb6H3kqryo+g592LT+QkTzDY9QGPm3pnSLSXra7FhBKGZK?=
 =?us-ascii?Q?6VuHMN8FAuB5JXmeCDUgn+Owy9Ze+q281AZxB+WDOVCkHu0qKeH5Ctxq6MOd?=
 =?us-ascii?Q?UDO7JJV7Nk5/TN6PMtkUwZ9GCHvfivJ1i/Uo/oHpr1E4JseQ97be2hv6TW1S?=
 =?us-ascii?Q?PWhs/DSd6CArflCFl4DZf+GIK630pBp41wgJ/PGH8aF9RXy7Ek6F87JU88k9?=
 =?us-ascii?Q?JvdyOr7uNbZpqZ+LzO4jVKquGzSo0gbee6ANrn0TUtlwL7MkLB0xG5k4oqsQ?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	c7PCRecA1EGzTDxZnfz48aDW25XhKRGtyZoA+CuZrp7TZ8tYSYnzt+nmsWkBgUUQEiXS7myAZKeSEUVxpalovzE0al2Nw3vAUxyNphtrhqvsnql9CyiSmSF8sdqU1lKv20GqqMXF0+azwRjqPOX8Y9clvYFXmw+zjTCD0uScwnIH/Dvo578Ue1eOXF6eaZ6tyrP3mHNNZp7i1yxap9gfhJpnGUIXtv+o6C0yyYHB6o3+bk4zmWVEbHzHUFLWgU15hkkjq/VN0Ggvp91klcrhjOxnbrxYKmjl0TzwIfq3L/klIZUmhUUd3YlByOXdoomdASNyz7gHekJqjXjx20wjpj58OrbRKnZPO87IcZOsSEW8HzcIJitn0Eaax0YEynmvzzwZaYe02xwLs7Ys9ayWYv70YmbOptcdaspCCddah210QqHfh+DX3MGC30ZQUCiehXkIAeWx3n9Q70Bek99Sfye+HqNCz95+jITbhLzJ3rNrRW3bm2iUh8h/xpPv08SBVMukMf3rwuiI1Rsc5dgAuux9eRA/cWLUD6tmqi2Hm0vM21Wz6ZqXQIrHw0OkT2hAUjgmdxtlj/IFUYZdKa2Vqfmaqmm7GkQIGCoglOCr9pg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4474d6-1747-4a1e-5862-08dcf4c10d04
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 06:48:36.5176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtFUJFEOnN5PSRwIg1ylazx5q5BBvQiojV/Nu662STKWw0daHJ/i1m6Iw44oqgarKpLE3RDO49hnCPwtOzHZ/z+Hef+Wdz0uVYcqGqfTRMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8168
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_06,2024-10-25_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250051
X-Proofpoint-GUID: g0NNUBsGYQAbs6YwxxhoX5H10tPawLZH
X-Proofpoint-ORIG-GUID: g0NNUBsGYQAbs6YwxxhoX5H10tPawLZH

On Fri, Oct 25, 2024 at 10:17:54AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git lgp-v2
> head:   7ed651841db9f18744191e575637d69239102a73
> commit: 94de21c76e54641539032105ccd3f36801fa9d85 [2/4] mm: madvise: implement lightweight guard page mechanism
> config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241025/202410251042.SfLMse1o-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251042.SfLMse1o-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410251042.SfLMse1o-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> mm/madvise.c:1098:10: error: 'const struct mm_walk_ops' has no member named 'install_pte'
>     1098 |         .install_pte            = guard_poison_install_pte,
>          |          ^~~~~~~~~~~

I'm not sure why I'm getting emails about a random tree/branch which presumably
hasn't applied the patches correctly but could I not?

Thanks.
