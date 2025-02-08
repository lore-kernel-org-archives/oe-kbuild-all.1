Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202973BBF2
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 16:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739030933; cv=fail; b=jQ+wPo3YWrOed4U1LuzcF5zpj2Plb93iTM2xJmmtthkYUSgjNmE4pBDju+UhqG9cWhx55l5a+FUQ0TDtndQ5mtVW/n26polUL61Tmx0MR5/cSjkmS++x7odnSd+anokx/7tjqJtgxlI57eQYLLImoJnSuf/NArUcEqcBUB6EoGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739030933; c=relaxed/simple;
	bh=K3G66wxveR+HayEMkJUNhWg4qe1HAUrSU4oNNZNzM90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WXJu8PyEHHuhgIBvt0Ps9Pocy+axNsOwdQaTXYm6oDL0+O2c3xWQ+AEEEmiGgU57CmMPQ0Px5sjslhvIqIolJa2ln8HMYxmlXtWxyRTCAo7JwE4ZFAUlyyeOnZDluXQ2wgRgXi+3qwadnJ5hTvp/EmAlHDSn/qaUqfPPEIzL7Y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=RyBm4Uh1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uahMrYFM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="RyBm4Uh1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uahMrYFM"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518Fo209012750;
	Sat, 8 Feb 2025 16:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=F3C9mPvvrNf5togEuC
	SbQbmqHA6GzuuBA6XZ+pB8RTg=; b=RyBm4Uh1h3l+OZXW0t24uVa/rZ6GsUl3cK
	ZxXdDnONWjRbakuFScXZ61yk9JLHGVz8jxyKe66L/CrYk7jowr8yjnx+rmtjVXG+
	mV5LX7J9x0tbBa+kIcfGB0shyw+/U9fFeE81/xwpe+VYtyX+W9+Y5CNCQIZ+nigd
	sUkh8cZ/qLP0/cp/vTq0lKXOqPbABc6Zi6LvAu965BeticzRoIK/Q8CezKua6OBX
	/m30dT5/XZuTp2px3vOelg1b6B+kCnHLJZOQj9Wy2fWl6wb00IycWqmuraJ2kJV+
	54vwvArEwtleGhCFzuIVvCZxklPOw46J6SInfFZXyJkpuUf62O7g==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0qa8bjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 08 Feb 2025 16:08:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 518Ewq1u002845;
	Sat, 8 Feb 2025 16:08:42 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44nwq5wgvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 08 Feb 2025 16:08:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCtn62TBqilmlizXVgmVIirgByhbK53qQuoaX9em3oUPObpnSQZoB6fP+6OauIwc13UvcbcSMoEiXscgx+SKNsFWFdSaSMWPpU4cCZDh1sPkw0R0GZWUZeaw0EAkYycxg/ckbQ9cH/DLiFibvEcgqkyQlqfyaNvcKjPfU4qdmYAxl30oClDK2fY3TcKjaW4IW7BjGuommIXHpm90bYt+94ZKXxYiz6uVccR4Vxh4etCuAy05Y4+oqYJ5iauOqIujRSY3RMCkr5zXLiZjm1Z/H4tcFLvokbt/hSBZiedD/5s3hqH6S5bWnP743ByEQsIdh3tNMQnKhcIk2+u90FiFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3C9mPvvrNf5togEuCSbQbmqHA6GzuuBA6XZ+pB8RTg=;
 b=VU3DcvV0efxKZ0bSPp0ensTFIg/AseGYav5a2daqbtI/UVI6AfQkwOm+14eKRStUMhr1e5fmyV3rvGbjhH5DznmsfRdUhMEe80UUs1ZGpb1v71cPxIRFKqmFNCAFcJjizkiWki3CQuT+3WzZYgPfJdD3RD/1xWxtSUIhu9iWVoXFaKRecRQBvxFYhi8GH0U2TBfd5TLN0MkoRLXnlTOKho0H3biPrt4YxORQkuHmabveZrvDmCosMDuzmW8C/7aUGMD1amwSCpYCCjvEr3ppqTV4od74wMzVEJI/CMlgGmnWtS8NFvPn2VPg3JmiVHSF1ZFQG75wMvYKPn1yzfZ9Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3C9mPvvrNf5togEuCSbQbmqHA6GzuuBA6XZ+pB8RTg=;
 b=uahMrYFM+c//2db/6mKeRzGAVBk64GA5vh8jdXuzN9jzL6wmFIx09RxCs2wPfegT/cL4FYvSRC5jVLDSsVQbc/+ArVL2RmtUM7quD1LlggnCuK7evArNwRzht+pectk6A9IClurcgEy92KO3eitVvkb8mFfJb+iIjqRr6GN9Th4=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by MW4PR10MB5881.namprd10.prod.outlook.com (2603:10b6:303:18e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Sat, 8 Feb
 2025 16:08:39 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Sat, 8 Feb 2025
 16:08:39 +0000
Date: Sat, 8 Feb 2025 16:08:36 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        oe-kbuild-all@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 1418/1780] kismet: WARNING: unmet direct
 dependencies detected for FB_DEFERRED_IO when selected by
 FB_DMAMEM_HELPERS_DEFERRED
Message-ID: <cd6bed0a-3603-40ed-8716-2ced1eae7d3f@lucifer.local>
References: <202502070305.1rGTDnW0-lkp@intel.com>
 <6142d666-5245-4e00-8b1f-c43c6e98638f@lucifer.local>
 <Z6d/eVGOR3Y0L2Os@rli9-mobl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6d/eVGOR3Y0L2Os@rli9-mobl>
X-ClientProxiedBy: LO3P265CA0031.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::20) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|MW4PR10MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: d81363f6-2b83-4f98-ebee-08dd485ad9a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mHdfTjOa9Xbs0LQNXw7B93NndJMfG/Be9YVH9kQ+ZdUbo2aiWJszDqPuH5WD?=
 =?us-ascii?Q?/JDvHRTDThKjPCeuEWPqQvIez1OsTETw7jlOMbicO+dh3p9G78wYTaPeauuv?=
 =?us-ascii?Q?L5+F1A6OZdKzVOOCkQEZLiOJ7NJxZJT3t62l02uJhVgp3p03r0AcomHRbyr2?=
 =?us-ascii?Q?E0+T+jcH2uTc+TpTOgl0XU+Fh8o+jjhS56w3ONS+NNQQ5CDGggk4I+AXL9bZ?=
 =?us-ascii?Q?CCoGlqa+2iphPp5nhlpbmwiqswx40jGrwPGScJsUHoMUypEAXyv75q05IFt8?=
 =?us-ascii?Q?fqMWUhEq1AAt8cM80jezXy2z4qSHLY+1KgmQ+/Ov7gp287MsOMWhnZhSq2p1?=
 =?us-ascii?Q?XEurzJH20zd0tjCYbHXnCbb7++ZNALFNW7otcAqx6zMPrF4P7rXzehlIMzbH?=
 =?us-ascii?Q?nJB3peK9/nvp1chp8wpGrYjmXD+XEhRtRgQj8HZy4F3PZ73/WjWiDNoi9ylM?=
 =?us-ascii?Q?68SBKfu17lPCbZcZQYlzvyOavaFNdkhqWB6KjzLlPMOORkbBbZldTzyn+DhN?=
 =?us-ascii?Q?8BrrdcD7eblsmMM1MNY/Fk/9ZYe7WzJNkM+xam1hGWV0dzAOEM4EL4XOGozn?=
 =?us-ascii?Q?MJnhz/pIP3NKFyoQTDLd0nFyRycT8b+60V9/aMBkXrQ6s+ZqJ6d5JiTKva18?=
 =?us-ascii?Q?NZ1ObY7dBVjsLaa0CTLPo0CKiMCiMTRxYLeL04X83uRg0mjC/ah0jmm+eOLq?=
 =?us-ascii?Q?E4b6i/eNlR3/DJA32MuI2DTMAGGm+Mb7PLlG7fKYARpYG+LAI2qyAcJxOT+z?=
 =?us-ascii?Q?hpvF3aO3PS4xaPDLqJWD6wD653ggGDfj/xfaF1PEBlH/j6zZL0WCWBSD4tlK?=
 =?us-ascii?Q?1J1cQB5zagPavdsFhdTFKqiHXyF3B1M6rcSj39wHp/jZ2I0DOAdpj5QYHtiw?=
 =?us-ascii?Q?/r3IkLgEmbhtDfo8vAK6WVX0jsJEirig7zh/fO3/Iv7Qb+FQjpXSL8Mx8oqK?=
 =?us-ascii?Q?8IU8glGZD0zn72Fs+8wl2l+ozyiqg1jaMf7zS65NuzbGB08b2jYPORrjkRMP?=
 =?us-ascii?Q?8C7jg7UTPFx2QRhkzNKd8Bb44dBFr6O68roHMz/H7RxIb6Xtu15doopQDK8r?=
 =?us-ascii?Q?uOUyIJFwhGMUBQWb2LJkXZv/6T1gEB5FAxV56+YsESaJhi9TKbjGYMqKlEV7?=
 =?us-ascii?Q?c+KJWpPQq1ZYGSLoMlHTXLvoNBhtJpR93SORMMPOFm7pOWHPdeaTj6QwEWgw?=
 =?us-ascii?Q?IogP0/cTuOyAA7GBiCSSnWUKGxwEW0Km1ZkzUcNtOSI/BAZxdnowdjlwrDUy?=
 =?us-ascii?Q?y8uilGZpnFV0Xy08+nb2JnjhVRY8dsPpZkpY71wI5vbjx/f8OT2Qrq4Hd5iN?=
 =?us-ascii?Q?dyRdjlPXXhYv53Rcqq8YoP8L8khtZMXlHTT6gqEtEE2Qkg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nXMFe24uK+MxnQAQUh5G7d7uFmnWtbR2CD65VwlVgnaOJwQYOgm6LiqNfJTB?=
 =?us-ascii?Q?bSmmuj35SigOQ0WhT5kcYZz1FEootOY0c4mrz/PvVplBY7VbaCACJl1UO9yH?=
 =?us-ascii?Q?IIo/7QUle5mF8uW/ZkDQwjTFW4Ep9mxWvK/XkJYOIHZdM4Hb2DtRCLK8beKV?=
 =?us-ascii?Q?ichCLcDjpuWq4+hy8ro77rjPiR0ECEhVkr67yNWLpU2yjf4osPWwp8/n04tL?=
 =?us-ascii?Q?9AonGPCYwip2S+2rTS3vEPotnI6MK4EHHeUtbY8ZgLsIh7Zk2u7dDMYPbek4?=
 =?us-ascii?Q?JG4rPU6tG30Rbxi1K4S9ubJKNKbA+V8NKgZcyr0Ypo7jPZ4bKur2JrdE8JOQ?=
 =?us-ascii?Q?RxuIa5WOTsR1Mh/Js+lDjogzZyKSxCfVlycazujyykPKHFKWudvxOhYzMnoY?=
 =?us-ascii?Q?sbXzUq+WJZPN6ZOf6eyGm+eDVboAXhpROjsfTLtn0mTo5O+qARril4ip8XHM?=
 =?us-ascii?Q?1kyOzwj23TSnZk4S0zzrwR+Pc6AU5PNiBRwAivH1+U26V8RADigLqNlupaK0?=
 =?us-ascii?Q?4eFBythwqsxLg3SmwbpoC6mc/CW/aAdWL876ZOlX1DuaHXMt3bo8Sv/Vc8Pb?=
 =?us-ascii?Q?49ZdnZjRhwQt5WzRHK2b66eE3xPUzmOtM+8VVQNmA4uVdCwWqvnB6v7E5XSP?=
 =?us-ascii?Q?XrN4dLtZ0ASLOX0ghx87D+i9mO2vO6XuQgQTMGI8bvnSc2xbDV06lmggX9XT?=
 =?us-ascii?Q?TNc/Cn38e3/Qc0ljs9/tSI2jcoMtXnY6mUZt8QxReQkKXB+BR5zhS3ZK7AVz?=
 =?us-ascii?Q?DMV6Z2WYTB1RPq7rNkaQqWxHW0ogPMlB5VyDAcDcxAW6BUIb4IRyPHC1iGxy?=
 =?us-ascii?Q?EM2HL9TuGmI/f9vD7cZDUeL4JCH7yPBDzZxHwtMKv1fbL626D4ub1T2P3+lq?=
 =?us-ascii?Q?QtFOfo2yKIbL9Ah/DwM5SYZUtIzHrdciQJi9p3iJMbQiRvzV6idgnEkvA3tE?=
 =?us-ascii?Q?3xtkj6wpqy7a/AeCwD2ub1zR/w+BF6MQ3j3xGB2WUtkNm2M5y5Mta2PsfxPX?=
 =?us-ascii?Q?whcW3exyck0KL+KWCHmz9ougVIpFnGeLfl5Be98RG2JAd94xHc4o7FA69BF6?=
 =?us-ascii?Q?+SoNtYDzXbyASHuln30/AT10H1XfxlRUqtLI4UgIssDFAvrkwTmHNJyBU+Yp?=
 =?us-ascii?Q?bAh2UzmyrBRN5vxoRV8QPPcioUal01Z7xSLXFFU/mh9OGmE0TSU8fCEx8Nck?=
 =?us-ascii?Q?yXhPsH7XLMbUhHs3qSYsEayZCpNKV7+OhwCt1zXcXND6sA0ed+pdC+Do90/a?=
 =?us-ascii?Q?aAAz+zHhwdrYOR9zGuir3LWR8WXi3PqRDrosmAa2rJRQRCOTFGmP7f36FUcQ?=
 =?us-ascii?Q?Al13cNmFSfXyxN9pxkpBDBH60e8zBS7Hd1Z3cfSwif1XYOMFsFrqx718+UDU?=
 =?us-ascii?Q?qRAveUoOmDj/b5CN0gof/Bay/QUuzw7CivAhcX4nAcEBK52bEWiFSLwn6mEO?=
 =?us-ascii?Q?ETlnK5Qiw0QrNkHVKWo/qaiZ6TYGx78DQKNz83tmCfJmzE7mr9391uyllnNy?=
 =?us-ascii?Q?YRX2f/oOV+pFc0QEEFcJU6WJY2Nzx9IbVdImW9nHu9+ks7OgYJlMCrcj1s0O?=
 =?us-ascii?Q?xGnju07AWIkGi803575v5mk673UcFtz/Xyvk4OpMO5sKqUaMLl2aFUronqaH?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1fDELs7c86yAZX5w1NecaobPFctMa4mZivCnRCvBmBdTwao3ZySb0nZF5cX48boos2IJxzhzeBdqRknOetgNz06PK1mPkZZXxFzdTyVyMFlMznhILcgKjEAATONIW8U8DQO8oGP8Pa8V/xXun1+8PzeiNLYNEQmYY0AIK3MbSkBpUD1Vpj0u/XDnXQNZ3qsHA5CO83tYKmj6cf5ayYTMQ/LnZzb+YgeBEv1GKSprgjnOQvNXOFAAEdLPxpV9i8ARQ5Jepi8XoNQnHrbL/xKvSK2kGiemkRausoy4zRxK2n4AhDiSOBAzYNaaHsQ65QaXRV1mlpaaqSBFKs7sgWDBfPAEhRuhJ48p4gapgm7AQD4jQRgUnFNw8emxnHYgfayNVrL1env5J+JYVJuozleo0if/VNXrkZQPKv2yg+sLJ9OF/2jiMuS1DgHI4yOAljoykpDYUxSHzCWadH1DX2qtN9ppVOnEKaX1MZDAZyD2Q6/8ohavFJBzhalQnoIalblZCZJzW7Mk5NJumAIOcY6Cwnr/DxlCGDeICM7UYkex9DE5uFvMTEbvYd4yBIrJXnGIpMUYmJl3y7V8R75DgOuKZ9TwDZyb21hAzze/RYlYNEg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81363f6-2b83-4f98-ebee-08dd485ad9a6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 16:08:39.3403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYu9g/MS2gOtvOpFsE31Tq6kv847vlUMYkHJVNFf9n8Y1dLbxYaFWdxbVNfPRBNEXUuDMUo1jxHmEeIVTsEglrmcTvNLjywQN5K+27DLbDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_06,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502080136
X-Proofpoint-GUID: NApHjTEgDEz-2CB1TPNBp2kQyaGCW0xh
X-Proofpoint-ORIG-GUID: NApHjTEgDEz-2CB1TPNBp2kQyaGCW0xh

On Sat, Feb 08, 2025 at 11:59:53PM +0800, Philip Li wrote:
> On Fri, Feb 07, 2025 at 11:59:58AM +0000, Lorenzo Stoakes wrote:
> > On Fri, Feb 07, 2025 at 03:24:13AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   808eb958781e4ebb6e9c0962af2e856767e20f45
> > > commit: 236ee083f1b9128fd5bd266054c5b8868f803cee [1418/1780] fbdev: have CONFIG_FB_DEFERRED_IO depend on CONFIG_MMU
> > > config: arm-kismet-CONFIG_FB_DEFERRED_IO-CONFIG_FB_DMAMEM_HELPERS_DEFERRED-0-0 (https://download.01.org/0day-ci/archive/20250207/202502070305.1rGTDnW0-lkp@intel.com/config)
> >
> > I'm not really sure what a kismet device is or how it's configured or where
> > on earth this comes from?
> >
> > Could somebody on intel test side please clarify? Because you might just
> > have a broken config here?
>
> Hi Lorenzo, kismet is part of kmax [1] by Paul Gazzillo, which checks for unmet
> dependency bugs in Kconfig specifications due to reverse dependencies overriding
> direct dependencies.
>
> The 0day bot had used it to detect possible dependency issues [2]. And the issue
> can also be reproduced by running "make ARCH=arm olddefconfig" on the attached
> .config.

Thanks for the info.

>
> Would you mind check again whether the generated .config is a valid one that
> exposes potential issue?

I can tell you right now anything that relies on deferred I/O that doesn't have
an MMU is fundamentally broken by design. It just can't work.

Anyway, I've sort of thrown my arms in the air and given up on this, because
there are too many nommu things that seem to one way or another end up selecting
something that relies on an MMU.

If I try to propagate the dependency through I'm going to end up changing an
absolute ton of stuff, not all of which is necessarily tested against requiring
CONFIG_MMU (they may select the defio stuff but not use it for instance).

So I've dropped this dependency, which will eliminate these errors, and
reluctantly put an #ifdef CONFIG_MMU ... #endif block in the driver.

It'd be good if somebody could go through and ensure all the stuff that _needs_
deferred I/O that _relies_ on an MMU triggering write-protection faults to do so
actually explicitly depends on CONFIG_MMU, but that person will have to be a
drm/fbdev person who is sure that the propagation doesn't inavertently break
something.

These error reports correctly highlight that there's an issue however, so thank
you for reporting, but fundamentally underlying are some dusty cobwebs that need
attention _at some point_ :)

Thanks, Lorenzo

>
> [1] https://github.com/paulgazz/kmax#using-kismet
> [2] https://lore.kernel.org/oe-kbuild-all/?q=kismet
> [3] https://download.01.org/0day-ci/archive/20250207/202502070305.1rGTDnW0-lkp@intel.com/reproduce
>
> >
> > Thanks!
> >
> > > reproduce: (https://download.01.org/0day-ci/archive/20250207/202502070305.1rGTDnW0-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202502070305.1rGTDnW0-lkp@intel.com/
> > >
> > > kismet warnings: (new ones prefixed by >>)
> > > >> kismet: WARNING: unmet direct dependencies detected for FB_DEFERRED_IO when selected by FB_DMAMEM_HELPERS_DEFERRED
> > >    WARNING: unmet direct dependencies detected for FB_DEFERRED_IO
> > >      Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=y] && MMU [=n]
> > >      Selected by [y]:
> > >      - FB_DMAMEM_HELPERS_DEFERRED [=y] && HAS_IOMEM [=y] && FB_CORE [=y]
> >
> > This is a nommu device selecting a feature that absolutely requires an
> > mmu. Something's broken here.
> >
> > I'm not sure pretending an mmu-dependent feature is does not rely on the
> > mmu is the way to fix this.
> >
> > I'm VERY reluctant to add a stub for the function that explicitly relies on
> > CONFIG_MMU because it'd be very misleading.
> >
> >
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> >
