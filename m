Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D1A2B9B9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 19:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738007935; cv=fail; b=ORywomVY74c4hobjrFBHKrNNfieziHFiM5Wua7XxgF3T1R5e53Mqq5rVdHNzUM2GDWREtG6mhsQi0nJe0LDrc+hlc4MoZv+yAc6qV5rQNSFLBUMw5+9NmSIJ5IirNQkU89/chtn/NsdOJgiz0YEWnh+j8IcHuVLKxG17KONMprA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738007935; c=relaxed/simple;
	bh=OkfKYCoBbXwUlKZH2dkNzeQaU52I55wNgn/Mze0pG1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uREFkoK21kKpDnyiNaeyYZqgQs0eflIzMyucE/N7dAs6CTKwXoWFVJ6RmlcaBc04Uj+fEMdgPa0bNUYun4KBypy4A98x0V09Mq2aAnjaEoqK3Mt2+v74NJb4H32JhP0UEY+tgvTz44mX/mxCaNtcfatrnjNTQrBXOvj4z1ms+BA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dl+IOlrr; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HLC1apPi; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dl+IOlrr";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HLC1apPi"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RJQkKG023383;
	Mon, 27 Jan 2025 19:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=HM/stGoFzCkX+trqUt
	uXjYy1n4peZZ7Kq9oIR8iAETU=; b=dl+IOlrrOJaSr+vB9OQiDIyUTV/uajjxsL
	mx+wZInHROcTK5JZzaTMr+YeyA8/cQpvdSIHxE3x4FSzF49/tBs0SDndAzI4jmA5
	2EyxjdYBghkItstIbmS/Lg7H6+98mj8dd/vsmpbB/PgWGeOT/TEhM6jzNBdWx/0R
	R7ZJ6zH9ksalkeldTek69/8jcSdjFzKvui7IRWwZOHPNfdqfG/jOomQNSPv44ZKN
	GnfiWZlZwCo+/cADwbFn6eNAEyZTrl98cRL9qMet9iHQ1H8o3j9hjubWDM4s5DTU
	aUNoMcJXvyBZ+YR9pYqDHKJVOPFAvyHKmyoe5Xl3iGB1Zj92BDoA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44egaa02fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 19:58:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50RIP7Ev024087;
	Mon, 27 Jan 2025 19:58:44 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd7eh5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 19:58:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEdfzEVE7K/FWblfBSPQhbvsRDeTOEhlxBLjTe5ET5g2BsTyNkPvDsS9QNlpNaJVLgvFj7q1ppCGfnHj7lfbvq/BGiqmJfk2Fg09X5QdNiKLBgI2GKclwedn+L0/0dikEzSWr2UUoWV5ncIoQGMdUjQZmnY6vGYUForEJwfTn6qehZ3QAlDfTlHC83668QFXvnMNl4Gkvcb0M1a+HWYnqyfAO3rqYL6PF0m5qUjHCphN3cRRGcsYCdVkXuZTK8Q2lzqNZeY5iEcfWgAPSHpW9HKdOSaPx8vczw3wq+n+GZX3Qvuu8rNR/du8MVm5ZTohkaespm1sSKdN1MB3zJnXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HM/stGoFzCkX+trqUtuXjYy1n4peZZ7Kq9oIR8iAETU=;
 b=PvLCFGQRDmV2N9FsoqgYOf0E+rx1wF1hwpAjlBEFebhNZLSL6ld/xzaJw9shY4IxqoAmBMWSWE8nS+i5GuR5CicGzUBFlfP3DOhIdBBNDHbBZi8e8LrytwMSyXhnfhO+daMtV7pQZNxc/P6POe+t2Shrh7+S3kUKK7QMzIYp6U+4gP7qK+Brv10IR4BZvTctG6ptcyMh373LKCFY1oiq20CZBS+Y9xwJfBeqeiCY7dOKABomKrj3wtGWd3u9CkHJURaekNqWAGHdfhTuwswQHoRyC5NYRvuyKhl1krsIUITk+9hEJXXRWqQB7QnBs8chQN5arnrVAfEBIXcFCKZUJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HM/stGoFzCkX+trqUtuXjYy1n4peZZ7Kq9oIR8iAETU=;
 b=HLC1apPi5fQsG3wtp+gP6E2dgoMYhX98aUAi1YmR2RJSFCij+zvo8yOUMNy02TYZAbthzSeUy/D7+D50mXNGqAkNJ5sDZd8ak22zUoOCBK323hqBg9FaAD556tfC0h4x+BgAf1VWGik7PKgbADWScw24/BOMSui25BcR5k9rS0U=
Received: from MN2PR10MB3374.namprd10.prod.outlook.com (2603:10b6:208:12b::29)
 by DS0PR10MB7511.namprd10.prod.outlook.com (2603:10b6:8:164::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 19:58:40 +0000
Received: from MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348]) by MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348%3]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 19:58:40 +0000
Date: Mon, 27 Jan 2025 19:58:38 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm: completely abstract unnecessary adj_start
 calculation
Message-ID: <55e537ca-515e-4068-9b18-611eb62c1676@lucifer.local>
References: <ef00aec42a892fe6ac9557b3a11f18f30a2e51b3.1737929364.git.lorenzo.stoakes@oracle.com>
 <202501280232.qYHi6Rkt-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501280232.qYHi6Rkt-lkp@intel.com>
X-ClientProxiedBy: LO2P265CA0406.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::34) To MN2PR10MB3374.namprd10.prod.outlook.com
 (2603:10b6:208:12b::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB3374:EE_|DS0PR10MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3ae590-c84f-438b-b811-08dd3f0cfecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+z8yo6YbJg/1+toSjWyH0nCw8ha5fAxC47payiZYh4N1xv9qWEp3iLUpMGS/?=
 =?us-ascii?Q?jlgZEZiFSjkyQ/gxPnfKgyp/K9R6YgvF+QoI/mEvZ+21tzKNtQaBS/jsKD6S?=
 =?us-ascii?Q?Ryq4eJhFdT7tkhHGnP9X7vK2CZ9zFA8WXY+ffXC/JcWf1Av38+gzn4X6ljIN?=
 =?us-ascii?Q?qzBhGMgSQzb2kOtvrckC1mLwao9qtkaY/tgbBDpByNyiJI8ehTj3mx7IPLen?=
 =?us-ascii?Q?XkXjBEQYNNhgbwslDsdQiiq8EGx33NTEHkJ/bvgtqAhRLnf6XFsIrh7PmrwN?=
 =?us-ascii?Q?IfrG/yX9DKEepshFybQ1u9rSnDD2qF7S9PAXpmipY5b5bmJfgxI+QM/69tYf?=
 =?us-ascii?Q?ULDnWC0BTfr96ktBgZw8pBaAuBl+5kkQkGKj8LTYLzeSCGdEd2j4jS2BEbcO?=
 =?us-ascii?Q?LRjGYjd8mRuccvSUXU+10fftN8zia0k1XK7dA6AOX1lPi2zkMCiP3pdDT/M2?=
 =?us-ascii?Q?cgoXiwS5K2DypTeM4genHkH1bBFwMVfw4IBNt/xw5Xc0+qTCkjyO4V2YK1u+?=
 =?us-ascii?Q?LmkLIpgcPwq67F6qprB1Ed80/ny80mZn0UWXpgdXaBE0JHuPcDstAp41muDl?=
 =?us-ascii?Q?c6ogiE/qwVG/DHO7FtycwzrRDM6h6nvrZCH1LyeIV1JcBNdFWfVL7M++ehHp?=
 =?us-ascii?Q?cbSJxZQz7Z+iJp07RI+4YaPtthhcTqmBGfaSdX338pLG4b7jXn48uVEENi05?=
 =?us-ascii?Q?d5DaN+7cdlPEBjZXFXFOoN+OAbCA8Jr2W1xv6N0e/kEm3chlSQ1j+c+1/H3T?=
 =?us-ascii?Q?GCZEbMoQcNZA9VrSaYoZcLAoNHpZ0MO7tE3z3QhEzSYrz7mD1uKneJA7KKhW?=
 =?us-ascii?Q?9fsGNgaAuUlOx9aQ1UVobVf+CLO6TgfXZIzX4Vf70Tad5qzWd7bdIO5Jy+6y?=
 =?us-ascii?Q?4rQgVxLKJbSk5xuA3iH1T4IO5lUrZ6QCWF9jaeebVad8NcIsF5k7uTpDoHhh?=
 =?us-ascii?Q?jkS8+1pzxvqfWGfkchJ6XDNYR22vdkHQqydnnSGfYCgqmMe1iDzmBFPNP5mp?=
 =?us-ascii?Q?IePCkFeMEaVEM2JIlNnV4zsD5zbk53oclCiOYwPouiutbxKLiSBitdbYXtxv?=
 =?us-ascii?Q?dqRaw7pksBMOYLiFDowL6CbZ+F9SMTyYTDk4utdCb0JJbWyiMGom+kb3rHZY?=
 =?us-ascii?Q?GuewCtAUB2ctobX3VxB/XQtRZbbN1PmubuJvY/m26bUX3ae5psTyO0EgtVVY?=
 =?us-ascii?Q?A3iI3U1iusKqq7ry4LdlijWvWtWy0kdsEl1HTCOWHZ1MNvz1G/5V6fzIJOxw?=
 =?us-ascii?Q?j6s44Kkm1q3bYrmJAraU2B6u8WBX/BfGscnu2JXuLyglycYwv59i7U7eYthV?=
 =?us-ascii?Q?vKCW1TrroxFQWkrj2hUvymEBzhROgWau/D0+FaO887bqXA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB3374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PKn2MHbkBs/f3L/fpSBUolp1LH8FNJuxERm4ytE+9VgM4C9nBeBDKMzPVaeQ?=
 =?us-ascii?Q?BRGBsMig+kTHLQCzaZew0mvTeDkDbN2Dxx5R7Igq50+Yx3MfMTbQwT/Enkur?=
 =?us-ascii?Q?zsHH/hH4VN1u53ahnhZ+a/hUq9lOF8pPJdCAP+6g1wBdfDUlXVkhRz+etfyG?=
 =?us-ascii?Q?qtSago6FQ/GWWSPIRPUq4hQp7BO1syWcI2+7DkD1ES6u3Vxz48Yb0sZPEGwE?=
 =?us-ascii?Q?hn2xPnMmwhAmj7IwWQQWv3lWWBQZbRH3KVXaWJH9bTJkmvtl8LV3aDSg9hvo?=
 =?us-ascii?Q?cdrbXnJO0L/eAKxLos7Pbut1nnxfWXz2S04fa/lkDjGIQ8TAQi+E9cH2O+zb?=
 =?us-ascii?Q?CL8v7ue9kLFRyQCG1qxw2PR72cu/aMzXjEnk7DP239XquuEM9JqrcTqpjTTB?=
 =?us-ascii?Q?Wu62Rod3EPev9iA2mogffWU8NBRmZautnJnPwAQwBWDWUkeixCcP/TTF9avX?=
 =?us-ascii?Q?BmnbnRmEu+B//4uYXQFVoX3hrUYooU5GyczUIqGfHOT7qpCLgoi93FimOno0?=
 =?us-ascii?Q?WRfgEMXXyl38ShTrj5oroD+wV7b8gJsjA/Yg63tQ7Pc4lLtdkQKGSxU9DClW?=
 =?us-ascii?Q?FtHQSLU+EuyebxKwkAC9BYmXSGU/hzx120TrC6TWPXZx0ZSePL7uq5xQYmoS?=
 =?us-ascii?Q?RMq7c75L9VR8VQoOlbSktrLopXr4KR1LHkdjJEeBOmLbdlCjcj2OLU0/Yh3q?=
 =?us-ascii?Q?ZP9CT+duh3KJN99y/jSXmIGqt83i44/FXliiMZj7rCzL7XVjE2xQn6zhJAo3?=
 =?us-ascii?Q?vQ/wSYLvs4l8V8LmWwHXIhHOWS4RJl+2GMo/c34X2Vm0D9aYZqkQ1E0ZHYU4?=
 =?us-ascii?Q?q8Q8nicsAGiXul9l3y04frtD9TkbLl+ybJ+Jws1biwSDcz5IxlWtjU4YZ+Lo?=
 =?us-ascii?Q?WgSZaUzKy5bgKzgsWsrvyQHjmHtZ3GZoxgpKINy/5W527OZdLZIRjzEulaDU?=
 =?us-ascii?Q?K+0rWUn6+V4HgSOcUI9w9P+U+/lYrmouZLVPXYpOg0O1LbCIrtizWdl4BqB+?=
 =?us-ascii?Q?JE9gMLryZLsu5FB0P+om0lgmk/QcGGO3yXjELYMdKWUEgct5ZAmRDKEaF2L9?=
 =?us-ascii?Q?6LvpmTJg37mLsBiTfrUHE++uQLI4JOC3SZTgBeIA1WCBydfRTHNaH2WJblaP?=
 =?us-ascii?Q?lq+v866VQpHmCQ/pqmVJX2x/W7x6vV8vLso2Y4XGho4StNPAn9p9a2SWmtqO?=
 =?us-ascii?Q?YAgfZtpUtPbSaOFutRzu3WBKwy348q9/fCLajve6WlA7jGvQtursLJvE63si?=
 =?us-ascii?Q?SRvHj35SvzxU6/ceqJ06pT2bjAH6uOTfqquuBJvMGJViZ3YSB+ErRfGTDeaM?=
 =?us-ascii?Q?Srk05eWj/T+8KMluZ3kH+TX8E3b/Q5hQsrzJmNEkbwvMO9ZTlCHOJ+NR6lZc?=
 =?us-ascii?Q?VQ8T9nccOibtWLL+xyvGgZsjv5x5O4OIqsAd6gBfeOUDI9T/CeXfFBXyfdTa?=
 =?us-ascii?Q?GJNDmXN2H6W4NtBKeUalX91XB3f1fHx8JkbCkBB5hC+sFRNenBPaToi6vBEK?=
 =?us-ascii?Q?alv0+ILObKNF5/m+CAlC5Xf1q+tqczSjE62YHV6FcP7Fe1d0i5HDO4Gjuvaw?=
 =?us-ascii?Q?A2J/cbuqxZ4Zf0ClhFjY79BTZSTW9ognJQvjLmX3d6iF/MeOc+9nfr8KuYz8?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0yESsVWZq3Mg1qJXE+9UjzdUpW8mCIkbRKnWH8XtlzpVJcLCTvs/pOfp+WLmrbhDnO8JfB0hkJtVKyPhcAn67qI6S3tWNmxIcPHhZFQq4ozdvXeI1Occj7CEpx8aDzM+pKopnWPYrjakaJe9r9TtJvH6lyolZOHXr83B0abIF8wDcGBKGs+wTi/Oinn9ooAbBpNvWwuMlTkG3RWzaDFKm3VYQdBvhUfLGE1iPFXtKaO/eIO1hYZTZ1Yg3tSbvK/Vidb44DE4/olgWV1NbN3prOofcE7Xn19jfbLef0xFj7IyU8t0a07UA1LOvjKq3d+R1/oJZfgLefOSdimu+NM/vZR9ifW7f+LS+v8yJjUN5RZA8x9eXow8v1im3JtBpcdOH3z1S2d8LILBb5npSObcFdElFqM40nXmly09Gt19SJgJePF13LK+UQRM6t2wC6aiBp1sx9E1JKMix2hsDlFgwQ5N6lfDPFf6+IofP8KBDJiMEZbaL1iPe1ynr5M3D6koBpzQaRVoLH0mm+oznSOrPk1w3EqUePK0sQCFQ4+XXDKdjQpL/BN40y777slevjOefMsGFfr9fIh5TUcCwU9gkgNmALljN71uIDE3Nqla4tI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3ae590-c84f-438b-b811-08dd3f0cfecd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 19:58:40.5601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9d/QpzwqwaGisS8g5EI7KTxnKYlwTjvALqXvD1R/BkH/lHnk8YjjnOeakmnHgh66mbE5FzMgWmZuMAo9XnsSX+u/y/cGrH8JupR3fjJgneA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7511
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_09,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501270157
X-Proofpoint-ORIG-GUID: 9Y9aXhNmTL4HWq_0pBFQi6hxrtTOkcoS
X-Proofpoint-GUID: 9Y9aXhNmTL4HWq_0pBFQi6hxrtTOkcoS

On Tue, Jan 28, 2025 at 02:50:55AM +0800, kernel test robot wrote:
> Hi Lorenzo,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on akpm-mm/mm-everything]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-simplify-vma-merge-structure-and-expand-comments/20250127-235322
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/ef00aec42a892fe6ac9557b3a11f18f30a2e51b3.1737929364.git.lorenzo.stoakes%40oracle.com
> patch subject: [PATCH 5/5] mm: completely abstract unnecessary adj_start calculation
> config: um-randconfig-001-20250128 (https://download.01.org/0day-ci/archive/20250128/202501280232.qYHi6Rkt-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501280232.qYHi6Rkt-lkp@intel.com/reproduce)
>
[snap]

Hm, this is actually only applicable in the case that
CONFIG_TRANSPARENT_HUGEPAGE is specified, I missed the stub.

Andrew - if this doesn't go for a respin before the merge window ends, I attach
a fix-patch which should resolve this.

Thanks!

----8<----
From 47cf78f1975133fea2862830b43ab9a6937fef78 Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Mon, 27 Jan 2025 19:56:13 +0000
Subject: [PATCH] fixup

---
 include/linux/huge_mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 43f76b54b522..e1bea54820ff 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -571,7 +571,7 @@ static inline int madvise_collapse(struct vm_area_struct *vma,
 static inline void vma_adjust_trans_huge(struct vm_area_struct *vma,
 					 unsigned long start,
 					 unsigned long end,
-					 long adjust_next)
+					 struct vm_area_struct *next)
 {
 }
 static inline int is_swap_pmd(pmd_t pmd)
--
2.48.0
