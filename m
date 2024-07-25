Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2A6192B84
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 08:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721897218; cv=fail; b=Ris7BQU6tnHwQmxcH+JZA+UkdRqTJUyKC4g5P/FGMYKKhKd9YK8Bl9gkXmVRKwTAExz30FXfkvqaFWKLMOIMhKyqOjJtx9TG90a06rQLKBUYrUxwYJXz5QzjnBRDZX9Ibd8WDtO5SO8A7V7wBO3xtf0u7ex6X4xUJEdvXs0ulgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721897218; c=relaxed/simple;
	bh=a3LGpkDYrdnckWA+CtrJGg33ZMnzCvnOsnVNzk2oBr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q+l2R/ZiSr000eAI2hRZfi7rHVkEUSBnQN3uD0tUxp5HQx1EtVnVB5TkPlZeGOa7hs8MyqOGlo01rdyry1QwKT3DqdHp8zRhiS0S84lLGOuE0MOFlKpVB/LQlbmHfawYlJYUX0/k6+jzS0sLDhZqt2fK0yoGpy+xoMK1LWVYUQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=M0F2m4oB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rZA8u+9x; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="M0F2m4oB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rZA8u+9x"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46P8fUed009071;
	Thu, 25 Jul 2024 08:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=LFC3fdIvsc/nCM2
	61HJdZXC8MMM6t7dKQBGTCkoPfns=; b=M0F2m4oBCu9oW5dFgLE3bVgxix46SxJ
	cUY25Uq9hcNQnLecwa/1uw7fvFi1VQF3BFlJn+uwZpXdcwWBkLcPvqfvUHQgTzPT
	FccDuFKQavMibmGRYOc5CL7cHGKg5GqaJpMoHQ4i2Jit///Mgs1DLDQW8fkmFnak
	Ep1y5/Ni2qVBf64L7oCxme/IT/oc41eC3CxmHuGCZbsQostk/AZjSL6GoqDUd1KO
	iTuBjZpysFZCceKS4J63Yquil5yyN7PbCH5I0wu7Vcnu52VZJlHAaxwOvpRGQ5Sm
	dtuYIdv6KW2FyoR4jj9+wZSs+l+0E7p5jjUvgXmr8nHJimBUjqTb3/A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40hfxpk42a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jul 2024 08:46:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46P8hwi4040602;
	Thu, 25 Jul 2024 08:46:43 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40h26q13y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jul 2024 08:46:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xg1Z3ley1mh7sekAnHRTuhTrdwNpLNCV9nNvBAqjEm6kTL6XfVZwDo+tsWZgfyM0URIlSQyNZv/JsbVSRo7oBxkWcfaG4EKj7sbYDDQONYZt+rtfKeO9mMZei0J5M04sokxexKPPESqkwu2IyyPFFnM9vADUtcL2XVnXPnV4FSqe53Ew49U+x1xgmYNGc84XI3+MHAR8/l8S80m9kfcTbgsw6Ii7fBMHryoWXWv0Fk1vrXjtkIud0//2HwuijImEPF3Hmq8MpJHsFVl3P5S4VXzmi04b7Y9P2Nsb+pwFlz8c/A6vlBwEucWioSuPlkAXZsTqd1mDdMdLvv9n4s9xkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFC3fdIvsc/nCM261HJdZXC8MMM6t7dKQBGTCkoPfns=;
 b=QwZUJm5iiLfo1PKq64H+XFrvSD2iB4SMX/1uo/1yLBaBltDa4NuTluypz6V0mignE755z7JTAfIwlfTuh9eS8xTdCW8sWIMk0ecz91Ld1glxiKdUBWNCOfvmvr8KOaWAUBmolb9RISiDmEfOKsJzEq5Vp2KmPEeqTNXnqVd7bTuBF1SGiUjZoDn+XFoatGFqw77TlQNWB2A3w3ucHnQgU330ky+t193krPSQsvKhSlmJqBaWTkg/sKfZ37uoOEiNz0stv7usHbuacKBkn2jVCr4wNDEflG3U9QxZbs8hkKue0TA4VqASbrWVWDA/+5QSjo9KwU282IXr/F4sgOZW0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFC3fdIvsc/nCM261HJdZXC8MMM6t7dKQBGTCkoPfns=;
 b=rZA8u+9xLOVLHa8ntizAa3JO1K4BBZz3Mbll6wRWCKqbvEkiLvUJdSWpihI4fTHzKxu4+hsYpu3swhznsApDxhHu8kJNBMCmrYGWu++5IbNQNJy1B19JI6EGg74HPwyRj+YM+KeUUu1A/MReQVsYF8RMcHmfKPKOKqPjzplGfes=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by DS0PR10MB8150.namprd10.prod.outlook.com (2603:10b6:8:203::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 08:46:41 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%6]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 08:46:40 +0000
Date: Thu, 25 Jul 2024 09:46:37 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: Re: [akpm-mm:mm-unstable 19/30] tools/testing/shared/shared.h:
 linux/types.h is included more than once.
Message-ID: <6ec9d4e2-5233-45bb-869e-e9e316eba7f7@lucifer.local>
References: <ZqHutLSnvXwksCPO@rli9-mobl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZqHutLSnvXwksCPO@rli9-mobl>
X-ClientProxiedBy: LO2P265CA0480.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::36) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|DS0PR10MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: e8fefaf4-2fee-4603-750d-08dcac864d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fZHHWKpqPTs1fzJrP+5lTGP5spuhjDK8Nwit9tlMabr4pTTH0LGV8hy/+dDI?=
 =?us-ascii?Q?+pcjxJm1OCadEw1GaMyKqMTjwxsp27RQIp0GXYlQCK2m6rbjGVsipwqAdj9A?=
 =?us-ascii?Q?9ncYI90+d+q+glmAxA4U6O7xts1xNQYg1mRqfjGl/BPdNytCS9jDbulECmHE?=
 =?us-ascii?Q?xUQ7IY7EkV7uOHYNXhUVHW+HB5MosxHW1xTqdl2zPtlNSoPiV65KiwCBE+0v?=
 =?us-ascii?Q?6xg823KfHYy7iSJcEWLNOawSQy+nneFYlTsNU0kbUKzc7+HDf9hZceV+tAea?=
 =?us-ascii?Q?XnREbi92frUtF8gV47o9Tas17nRJ83vM5WgCXpxDVBKTSW0BwTcXCDyAMMK3?=
 =?us-ascii?Q?/kS0jRoagQiSoeABXrQYe3QB4fn0f/XAH8Moy2gC9xhk8adcWuZBLgMzsoR/?=
 =?us-ascii?Q?sf3ekEvhxkns0eDiCRXFhAbBMCeeNgkWds2dk68eIdrF3Lcx/X336LBHMK+8?=
 =?us-ascii?Q?hN7w2kb++KAbqNytgX5sNxVxWUd/p0abNgyediiR4O92Cl8CaHh7fta92FwP?=
 =?us-ascii?Q?iu56p1A9pAQ3n676Gmn9yzPlaF7PWDkiv2WUkdbb/WzCXeU+8/9BJrIcX/as?=
 =?us-ascii?Q?0zp23e7rijnZc+2qeqmegsI6NE7bb247ysgRykeyhEG8Bk2ADx2JZ56J7i+e?=
 =?us-ascii?Q?IT46oaUnrmgGGa0mzZ3whHrcuYKI0ZpaaF3mIeDNPoIcqlPSDa+ttJVaV0Vj?=
 =?us-ascii?Q?O7M6U38Ijd0GJ27tjWA9i2Hg1lg1kDcdaNyD1TEUem5lEMPoFwY5o7eIKxey?=
 =?us-ascii?Q?FnBM4N04QpDo9RBg8jM508f60l88UHE2785Le2SKOrEOUZ5qcC0y2upOzSZW?=
 =?us-ascii?Q?vaGDbFfW5bKo+koGqjkcT2qx1bbu+7GoSkroCcfuWfEGGGza4uSdY0YE+Meh?=
 =?us-ascii?Q?xxlm3PCEwrQvQk4eyrewLUZA49OMAF9C8Uqr3Tl7gfx4ffsRCXxYGie07RSG?=
 =?us-ascii?Q?rmHe3o7FK+Baxhdv8T6OtaMnHvrfJ01sJ+IInKVPCy+BojvGf1M8zCdGoEZW?=
 =?us-ascii?Q?2aerYAiwt+3SFKjbVFWIT56n5+w+5P7bTPUAzalVzAQofogK1hwnvOFzqay3?=
 =?us-ascii?Q?QHyHxUfXlCERAhAEOgj4uOP8soExxa8N4p677lfm+WaSo0zVGPx/pHvycjc7?=
 =?us-ascii?Q?VgYuMA+TlXBbzfea4JTe6TeEkYcKUTQ5HSs3MJC4uYa3++/Ey5Nn+Re1nOsm?=
 =?us-ascii?Q?2s5VKtMzRwMbOtzchyd5jtficIcoNxYFiTvNFte34W3mQM9K//0ThrpuRovu?=
 =?us-ascii?Q?a4+iJ5L4L9F+7CB68eiuKsRacySeJ+YheHFFBTWORV0wyOHCpaaaI8qGI7pa?=
 =?us-ascii?Q?YJs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A9/DBffkdu5xXYaC7I4+adZ8CBTeU2mBpQnIyvwcZJ7Gj9yeiqiqA7RWzeN6?=
 =?us-ascii?Q?2pycM25nhXYrRinKf/aoMhDH3cQLywSeImdtRHgbuL2kXHZ0MzKNgCtVT9rT?=
 =?us-ascii?Q?NZ5A0BjFnRg49ddUgIs6+MVJJTW0ubTDdOqj8pHzyvy4kf+UbIQSy6alawjl?=
 =?us-ascii?Q?gN4ckdYrzJUUiKpVDXl1QVBW4h84iei2VF9lm+US5d6HUmIXrvMkgZkh73SV?=
 =?us-ascii?Q?dE6K1ykvHgVMi4zOD2519a4+1FU1qds+YMmaruGzdpGuWUkQre8efzvGqZh/?=
 =?us-ascii?Q?EqEYQMowix9DmaLPnVGRfPxjn6DwSQZWpjld6mZW1nwyjcqZz/AHRmAVAzX5?=
 =?us-ascii?Q?G0GzbkRDT9/ycWACNkScJhHEqi31Oaqp54fpx3P56+5QDiXQI6VEGIceerca?=
 =?us-ascii?Q?G2+ZDgDvnSzdSGnTgJ736ANXW7RpRTeeP4uulGFdcpG7+6GjnZeiGkFxwu+Y?=
 =?us-ascii?Q?XL+rWAolG0ljNUjfJRjpf7dDbP9jzUjnwZX2SB7doWpGj+CBvcjmuX5uhRoM?=
 =?us-ascii?Q?SGXnvCm1wPWTQSy0E2MLVwVRIfnMM0Wuet3KSE9bZtU4I0GqBPIXU8BgqRRo?=
 =?us-ascii?Q?8gsEVvVkEyNLPSCFOqQFD7kiffvuCUi045S2Qn0xRxcsQI09kjudV9/LGVSa?=
 =?us-ascii?Q?VVJbFip3v/NDeF6h17O1VDnY9qUZvTJwCYtX0tchauBzDlzjmdkS3OrZGgHc?=
 =?us-ascii?Q?hTWuSQs00BQJfDQk9CjdsENV+y9M68imgBUtI5CkdgxFp7ru11SLQvIQ4gwb?=
 =?us-ascii?Q?ZAGZa7z8jZ6AtRlzhkdvwBFAZbq6ZF6F4KOyIlk7NG2dcRdsIqemv89+GC9l?=
 =?us-ascii?Q?ESN2TGV0sf2WMMkFV4Vg4y5sG8jI4O6OC8qMg9JmJtzpFDViWTlKqaBVVosO?=
 =?us-ascii?Q?UTxQH1CzxdvppVci6ei1bw+rJ3CrGWDBjbNmYwGhxHDghW0uZKFhkhOu5WAI?=
 =?us-ascii?Q?XcglZjlwo/7c23qqn/AhXw7VrMK6WIMdNu1Xx7RkhdgbdMlZghtikqH6VzDt?=
 =?us-ascii?Q?9WDpL2fLlG2enVJoeIgJHHPfYJB+pO8xbifirHfXg+LF9q6tQYtpIZQuVtb1?=
 =?us-ascii?Q?gq+25/Eyj0CwVgmnVS8+tATLfqUIFsWWKFRXcnN3tN+jjB6bzp43H907AE3x?=
 =?us-ascii?Q?SMD4k0PTpJe5QtatQ55l2k3XtuGZiwlHqAGCySGeu+qEZqXstRXZqYaeg30R?=
 =?us-ascii?Q?UNa9GYERMs/vIfedtdP5mVqawIVfaWtC+UT2ATYkbusMS4SPTyKFc9RxkWwY?=
 =?us-ascii?Q?fN481NFKfShsLsSNr8sn3or5XOG63lsTRoAjpm0ajO6YNvYoh63ZTf3HE8a1?=
 =?us-ascii?Q?rC6c6/e9R00G75zf92oegKuROqgYrDffEd9eQKgpCwWAStzpUVxy0t/KZdwY?=
 =?us-ascii?Q?bGXnLaCam1IksfxIw4CBnJ2CAneg1mzzCCPbZp+d+LrgiD6AiRostD25K9bz?=
 =?us-ascii?Q?5TviskyAyOOj9OLC+S64RFjtry2RdKCVnwehmsgxUNF6wcfun3WhGXO2bgXV?=
 =?us-ascii?Q?nXfjZ7aaIIRuerMCQGkMc8Yb/U6rcwJ5oGWAAw9Py/Z4HOB4ADCxKszJIBY3?=
 =?us-ascii?Q?+IX0mwjTVuh2gduvR+xC8cTcfuxXLf48cLYhNhpCvTjig6HMDiUomeaxfYdm?=
 =?us-ascii?Q?EB5CXw/G55UAuba+2wVjk0mlFz+N84ommZtT/BVQMzz7VzD19ggp4cEB0nmV?=
 =?us-ascii?Q?S4q/iA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RI+DS/AYlj60LN2jey2wrZkxSJK7JJjTscSjpXmV5cUasQsmiCZwWYsxC36tzFyd+AEk3gkVgBOSdeNcpSu3B1zAyCmawbNukahYBw0R94/zLbqscxjT3jBUk1/aI6cXEdTkLYI3mOuVcikroITqV80HygmQNzhpSo1QnjGW3qf/4+JL2Y8KMSSQ8QjkqvR7Qb3TP5wNzeFAOpzCiYLpPT8Z3rtJ5/eGfh//mc71hw+5dhi7sQZijrF/azKoP5v2O6DvouIJBYgDQxYY3M+3SyJir60oAEIcqV6XnAxDw/eRMkst2igW8chT6bdZgLXtE0rNR/Ikh9oWm2xSjEpyaU2qNlcbzNXITN20pnMLGT0+gQySyEGgILAvqsySq6Mb/p3Xg/jELhUo5PjF3MYZqu72AbxC5soalPbimgJZNPLQO+D97ku7j+sacY8il+tgwU1Xa4+1LuK/VzSR7CwW7bkKsbFjVzx6M7E0OrLGkxtTMSC4l1nbRKmo71d2mDA/sjXGZ7y5HltGToWbfoKLa3q6eOOBf4hZONHm/oG7kQmSGNDRskeN9LLNkl+7D1nmOSCZS0noVJ82KrJ4qvAjpbukQA4vxca075urZFjHTkY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8fefaf4-2fee-4603-750d-08dcac864d91
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 08:46:40.7862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5VEtAe+1JjgtUNXw6rfPg1h04BmCCwoU4K7eVj/fi7EYy4k0ylaC45Nb/tuO6jyYLzzMuRzA5vC6wN6hyzoaFPogNAFIc1LMIcZGb/yHCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8150
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_08,2024-07-25_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407250057
X-Proofpoint-GUID: CHpFlfOl1trTPL9cuqpjpJMD3jsJOVpG
X-Proofpoint-ORIG-GUID: CHpFlfOl1trTPL9cuqpjpJMD3jsJOVpG

On Thu, Jul 25, 2024 at 02:20:36PM GMT, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   d8492982371a2b1c9354de924b82c7b4f24210d6
> commit: 04645ade70e31fd918bfe616e391ee74c325cbf9 [19/30] tools: separate out shared radix-tree components
> :::::: branch date: 6 hours ago
> :::::: commit date: 2 days ago
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202407250430.jTMy1BCJ-lkp@intel.com/
>
> includecheck warnings: (new ones prefixed by >>)
> >> tools/testing/shared/shared.h: linux/types.h is included more than once.
>
> vim +3 tools/testing/shared/shared.h
>
>      2
>    > 3	#include <linux/types.h>
>      4	#include <linux/bug.h>
>      5	#include <linux/kernel.h>
>      6	#include <linux/bitops.h>
>      7
>      8	#include <linux/gfp.h>
>    > 9	#include <linux/types.h>
>     10	#include <linux/rcupdate.h>
>     11
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

Minor issue with zero impact - the stubbed linux/types.h header has header
guards.

Will send a quick fix-patch over on the patch set thread.
