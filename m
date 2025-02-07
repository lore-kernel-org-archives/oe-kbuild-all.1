Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F0417C21E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Feb 2025 12:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738929621; cv=fail; b=g9chxkbfS63/qAVH54XZBeSGmBagbD32H+1XSSaorFC3IWsXUMKquv2ZN2d1IHB2Zt0K2gubuEx3v5BqGaAsp/9BlFUmVgvbh50ExccHFXDxsOCVM3hEXw/pD8zduvrIgfu5sQwtUtn+sblVQ2x6j6oUMwVcTTwB4Hp+jTqk85U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738929621; c=relaxed/simple;
	bh=8Gt/ZkIY2VuvrzeScorROBd+P+Ze8+KuTD4aVKbL9zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q0N5DXuSOkr47MGFTkeE4tSi2PhV2MuhIr99vqxH4A7dZ4ZvJAwSCQGLC1l/QbRToOXR8f7Ut9mJkpZ/89U/qQY3a4t3qztGbEZSjWfsts778QlMEZ+0jf1GXBEy9lBPNhfFVzgnRuJYGhfxQ6h6Ajrqu9q+bxQydC2d5J6j0c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IC4V23KS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wPGdOpl+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IC4V23KS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wPGdOpl+"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5171tuCl014668;
	Fri, 7 Feb 2025 12:00:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=aAB0TXxQ8e/e3PrvMz
	M78fHgoQf8PeUr2cSMQyLpMPU=; b=IC4V23KSbkk9dOPH7QWjuCgx9vMjNYJCR8
	zJBQ9MkovM6MeiRvvdXLuAxrg0HvNSfbZgPzapzhkZLGZQ8qQebMeqDwHtftDsoD
	g0l7x6TuFFC7lslkmnljUl1hnQA68ekfQ9OfWvAoRE7dMs995Rlavukt17XpRhPP
	MylVsVTwhdnTReFuufjwkPN2Od5vUexcI+Urc/llOSdOAcP/SHu0RaS7VP/ItE7F
	nkbvjZjt1C0nnzXmoG+nPDNQX8rM5ZuSVKiyVvG6yY4v3/5ZjLU6s883A3YORLkq
	hhVG31hzAAdq24DVgfCF0VRk+laQjJaL4C9SL0fEIKN+QsYl/jrQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44m58cmkqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Feb 2025 12:00:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 517Bbtql027833;
	Fri, 7 Feb 2025 12:00:05 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44j8drefkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 07 Feb 2025 12:00:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLCcmV3IkIfJ0mmmezV2PoTQVRi+G1VSS1ygtpYl2E5/p77ZYlq8N5vYYjw5x2bfPWgjx9RDTDGIab6mE/PsQ4Gw+xD6K7JJ1HnOkqsTC/NmHX60Jy+kvqWYoQYhXp2C/fS3KGD1Nmvn24j+X4l5LtRKaUjZTIdoRL/fnZV4ylthh1ICiioFRQiG1MisTw6uAESUvfpg36+px+q/e46jyinWqgi3tfgpRPAXHA9iEFEuJnk7OLS86pSg/N6iZceugMF9uu5X9BSu3IVc2NrmSo0NCWBYcpU8OlI6BR/ih3JTUZJaoo3HKvbJmmyPHpuhJt+BJ7G7Jb5tflqLqHrjbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAB0TXxQ8e/e3PrvMzM78fHgoQf8PeUr2cSMQyLpMPU=;
 b=KpxJ+ACVT2oiXw5ozZOnRuiSwLsf0Vt7BYamOk8avU98+WnCByVeREXrUVKhuOgwt+78AcoWHukkbp5XYseAKvPE6FVhrfQH1sXbWCD0x3r52Y9YUrirAgC36sbaX+T5tT4qWLA6gMsMh5JJ/PzJ4sUHRz7XBw8Oc8p8Qs//6hmIZsLAGfJ4/kMvYD2RffeiWac2Ol5LkmrAnX1afqmJ+tqqtEq6l5J+A63Jp7NOdaaN0qAppb0h4y5PF041aUgrBZDPKStDHeQ9073EZu49AM8yPsKEJIFelzkp6MBXb5t2/pKNC2WPR+tbnUaduH3IGAKU1dHzgn0DD8aJbcZofg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAB0TXxQ8e/e3PrvMzM78fHgoQf8PeUr2cSMQyLpMPU=;
 b=wPGdOpl+BFjxSw6oTGtkargW4GFYxgMSKvvpMDEMkAxfkAYzdTMkx8FbJU8btSliCAyu0DLG1VbGCsPEmIhGm2D1Bzws9lMDMJD0VIuj6bt8IK8lA9OOH9ONdt4Q2HS7WadeEMLaNXQTqdXqmmApUvgVe6NSuwfLnDsnXYgj16E=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB5683.namprd10.prod.outlook.com (2603:10b6:510:148::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 12:00:03 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Fri, 7 Feb 2025
 12:00:03 +0000
Date: Fri, 7 Feb 2025 11:59:58 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        oe-kbuild-all@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 1418/1780] kismet: WARNING: unmet direct
 dependencies detected for FB_DEFERRED_IO when selected by
 FB_DMAMEM_HELPERS_DEFERRED
Message-ID: <6142d666-5245-4e00-8b1f-c43c6e98638f@lucifer.local>
References: <202502070305.1rGTDnW0-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502070305.1rGTDnW0-lkp@intel.com>
X-ClientProxiedBy: LO4P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::10) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB5683:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d788ae-815e-4db3-d98e-08dd476ef457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ne3L6x320hZ9A/WIf2XvCSGim2DWnGAoKWnFALqmjOF0mf3OWipjNsLy2XXe?=
 =?us-ascii?Q?KVPgMBx2lFqwYJK90qLQHXusqJIBV9lnee1kSozZKLzSptc/IHk9bhPDd+Y6?=
 =?us-ascii?Q?aYEgGSbvsQCeWUAN0cKQ+VHhTPOWGoX4cwM+Xx/xdrbW4v0DzuLUYNroU319?=
 =?us-ascii?Q?GhgRrrhvYCBq3jb98NXodDtgDkM7h1tEeu917XSjYFqzwsZA2DE3mnp4f42t?=
 =?us-ascii?Q?u/VITfC4L295phsMvjyvVH+0NSc7x1xnqCmEC9x8ZwXyg6+ew8KUgfst5mnW?=
 =?us-ascii?Q?Q9oxHVunOdkqVeQ4iQuQWp5UrrYC/WDmwgMrekkNHa8zcnqypmiUPRJiZX+X?=
 =?us-ascii?Q?D2vNJ7Hq50NsVOBE026qjhKiIpy3IG7OTGHg9yF1ncxg3VfQz68IComusMNU?=
 =?us-ascii?Q?AsU/0sbr/ZWOT5R5PNexccVlKVFKnmxsHqN27/IaLk4zN09mK3qasVLGkOHO?=
 =?us-ascii?Q?GNRE02BgCdmiCDmPVXnT0ERCDXiYccIId2TC9X1JEFzwWIeOBtn4TlR4EGEb?=
 =?us-ascii?Q?Ffvv3byT7GMKNRgc/UWuNkwQwqEnBi9EHpgnLf6XU02Nx15Y4kjqUDvb0Y2g?=
 =?us-ascii?Q?iavrc5yWGHuwMx3n4Sfk/vZoFiYBoVRYvWS/aazpJDzwKsqNGNj5HmcBrmC4?=
 =?us-ascii?Q?5ntXDm8E784VyylfC57mNOSoFowyQ+cOw0PoKFhhJgk6Wu/P7vUtxNUip481?=
 =?us-ascii?Q?0D8etN+cY70gScXmhUlPaAyabcnHZdT4/xCR+ChGp6C1yp1Qi6vCh1KNEbzk?=
 =?us-ascii?Q?VXEAhwBAT9MDdYd3+4AHSRW6Vi1JdnIfZEqtooRSqAOpfOFNdEED75lm9vFp?=
 =?us-ascii?Q?3H2vM99s1vCyjcRpaKRdN2KoGmn7uFvNFaXdJY6YzVOEg6leXvU7+xuGmdQg?=
 =?us-ascii?Q?mEP0dcXpX7P+lk+wPtsklIPj6Nhdp23GZ17sqfzwNdgsuRq8BKvbsO2RNOtP?=
 =?us-ascii?Q?EuA9oLI/vfszLXlN7WqGS6MITU4Pkz13eaMAlvY9cJsei7Bu0OOpwwh3l+jC?=
 =?us-ascii?Q?BoubZh6/vUeBhsaJ8soBijsVjbYWEs/xTSbvr+cj6usXQPZ7fQmepRkxXFQt?=
 =?us-ascii?Q?NR1iZJRJoBkqScodJ1HTQuRgN9++L276XlLnwXao5RC9uFqACLJV4hpOIMEO?=
 =?us-ascii?Q?q5G9/e9pFkn4YZKAntPkHs+MC/XxvIIDDS/mZ6kcxzHSiCRg7BheSFIriBf6?=
 =?us-ascii?Q?o6cB6aRqHZO0OUMruZvHJklO/M1RGOvJVnc6ZjBnTmsm0E0UzUVGqNgZbLiW?=
 =?us-ascii?Q?AMPuO5QjdC3boc05b035fxnqWoDa2/V3wX/LQueUBgm+HEBjEnRpuqTQMJU+?=
 =?us-ascii?Q?wRHwVnz7JRUaluZOfVjGVZeEozrTaDDnHmslu1eDZsnkMw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1xzM+ofNdKUtuntqBDAyjNfxjmRhDeRC79yfgQ7Vi8byU/mgMUHrVNXmWmL6?=
 =?us-ascii?Q?8q1CVhZl2A85T790QhW7hoGG5Wjsx72Q/0Qy+1cgZiFCD4AT8VuZc0yu/KVf?=
 =?us-ascii?Q?prjvxFmi35H2SVMpUgn9b4LFf5jyE6RCQGHN63bKymQdg723299/pQ1HKLrX?=
 =?us-ascii?Q?twB7UQ/nu6eearCo2skJqS09BkWZpEvg3YqLau21/9N0xs/CSDH/vcB0PMnL?=
 =?us-ascii?Q?e5fPcZzw95L5OJZXgxzEVdo+mDA+G7eUQQnTNUcwqwLTPEyDGqRMOdYpIi4c?=
 =?us-ascii?Q?E8+W8KR2Zlf5Qrbex/IuiNig/uKHOk1bpk0fCbOSTGxlChMBUoJy7p4/Z8Tk?=
 =?us-ascii?Q?wnwfjDGeNKdZS1qqFDaSZMjqUTfLHdWVs6K//F/h0rPlkqXmYbIncpO+wn9d?=
 =?us-ascii?Q?hXLvc8xPwVian+2Cw1sfkNT9ekOM4Uv8l84QLmIseEJrjlZ0qrYFLdYw0nEy?=
 =?us-ascii?Q?dMg2VN2suFBstkSaBkj8IQOs06s8ZCCiRbmru/ROA3uZ7y1PIMU1utDalC1s?=
 =?us-ascii?Q?W/Z6Q9TUi1MheTjB3j3S2ROX+mfTfaMLqteLZtahYL+NUuoIv6DptmpvzouQ?=
 =?us-ascii?Q?GkqLeT5F1IzYJV8GN3b8cUQPhxt2umJHEn2W/9LdYNIC6xJEhkaQMWUcFJka?=
 =?us-ascii?Q?gPjrqsnWxctw1u4HRTF68LJUyiR8NL5Jjk1kob3h2MRdbgnrkrbjMTHDsxkS?=
 =?us-ascii?Q?MMuaZBG2Ee1Kxc9ALE36nhZjKjU5IXnJyUUt6U7vpstUil9YzZnE3dch+MkS?=
 =?us-ascii?Q?Xn0iGHpv+6K0t8X7I3WqZxVLFxGxMtdQFz6cUcKqn3zrbs94Q9vgVrbqQF/p?=
 =?us-ascii?Q?8YZqFjQyFR7X3tuYKZSSbPhcSQ9Ad8dQoYkP9VQVEnULuMyoDtkAbxYPxPl8?=
 =?us-ascii?Q?+X3VqTCPB8WEO/r6m0dlWMGL4dX+zPc6lRhbIRORfdyhGL66hE2wU/9SQDFP?=
 =?us-ascii?Q?cTdqpYucqSL1D7eX9Zf605QGlTZeL3w+JNUFmPHUQMEuZyOp82US4aKZDFzM?=
 =?us-ascii?Q?zXuSHd8zj3dNLx25VA4FnQlt201t7SsEKiBdsM5FLkt780zQTTS+VdC4jm3C?=
 =?us-ascii?Q?Gs0LUFfmN42psoo5JZiOdu17fCP1s/LcRlgACt/tmueaCx3RB16RfN1rKJ97?=
 =?us-ascii?Q?9TvHEAK3yf9auTTaJ2/eEnEBF9dPy1qdkrEPwnbICKlnbTUNV6yzddPs84rW?=
 =?us-ascii?Q?bswfOlZk2gnIGzgQH68x86snttw0rDk7mdN6kgZz4uy3X+fD2C+qvOwBi3gv?=
 =?us-ascii?Q?B6qh6Rol1ATZcffv3QTjQGuS0XW2ZBcwZ0NcOzl/JQwzzqcaO0VdoPAv2arW?=
 =?us-ascii?Q?56cebqZy9tqw75e0ybgc46+6Gqw9FN4wzp3cM7vnr/+dTNGr/4RPimrFvg7Q?=
 =?us-ascii?Q?XVp0Zd6E/Z19If2R8NAVmhfQOprWYYFpsemaA2h8IQpX/ioxxt5HhHpBmA0g?=
 =?us-ascii?Q?xsagHeMdt7sBR5HXWEZi1lseAdqxf8z97vinjVB/H7fHXjLV+aLXvxrdkTSD?=
 =?us-ascii?Q?zoH+crlx84qYpR967fY+aFmk02HSvS28TbsV9egYls+abgiITzaZGXe39HkX?=
 =?us-ascii?Q?wuC6QLVSe2im+l/rerHvthl/XCgW9U2bZwVC0+Q8FnrBaa8N/YbB0+Cnx8G5?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FgIUnxmKj7cJinoZpSMVieb9RUKD+3jwQOT3Nd/xOKo39wCOMIFP3Gd+K5JfTmNDyqewTCGrIskc8WO3ButB7NcRhWAK29NkrYNuFL+/Ecj9GfiRW6VnLlXhP+/CWn+QuRLWjU+Qmt2rFKYiqFxcnQALD7owYfX2PbPMm/5HKpsvFA466L5bWiqeDBDMSJsaGr1jjDCzCDbZEUlbudRJFS0qUjS8baohLBrukrqBqsqYE4pN8ilYPvUG+hkeQxN3K8rGmfcDjn7OC/PtOLWygge5MskMrGOMxTEqNZadpHJOcsEXIfKaiVMkBSPMa/dFVQjgXgGPUjkvwR3/ysUNw1+ALptiIgo3ns/40cLKsNTGknpGIvXwfK49vG8VLE66F3PBoyoHFpCct2ME0E575TiyAa+5BPkqXAL+e8alQqSbfi4bFNe4h5eZAJwqwPpOXJwkDMskaDivrXVtYc3dzjsIA941oM+QVwDYU/SVhjy3m41O9Fl/Zzma1rvA5CmdMBmkO+Ycu7bKrWdJ/2T2AC47Qs7nevVGOf+bpZcH3/GEj+15OtrIGDFGmEbY4sRyT1TlmfgW5vhabG6o6vpOlj3YI5KmIqa5UEgLB8G5nOY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d788ae-815e-4db3-d98e-08dd476ef457
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 12:00:03.0220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SB40UvViME6Md1XK96hhOv2H8KcaVb8i/SnIjDoxr5Fo7JIZHIiTgnr+yU9qkVof9TNY3cey6r6jfEcXvjadZ+y2O+Rzae9Pmfv6EIBRcKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5683
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_05,2025-02-07_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502070092
X-Proofpoint-ORIG-GUID: xd5h8ZxLOAJYyd0z1urk2o_52uXmJYg_
X-Proofpoint-GUID: xd5h8ZxLOAJYyd0z1urk2o_52uXmJYg_

On Fri, Feb 07, 2025 at 03:24:13AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   808eb958781e4ebb6e9c0962af2e856767e20f45
> commit: 236ee083f1b9128fd5bd266054c5b8868f803cee [1418/1780] fbdev: have CONFIG_FB_DEFERRED_IO depend on CONFIG_MMU
> config: arm-kismet-CONFIG_FB_DEFERRED_IO-CONFIG_FB_DMAMEM_HELPERS_DEFERRED-0-0 (https://download.01.org/0day-ci/archive/20250207/202502070305.1rGTDnW0-lkp@intel.com/config)

I'm not really sure what a kismet device is or how it's configured or where
on earth this comes from?

Could somebody on intel test side please clarify? Because you might just
have a broken config here?

Thanks!

> reproduce: (https://download.01.org/0day-ci/archive/20250207/202502070305.1rGTDnW0-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502070305.1rGTDnW0-lkp@intel.com/
>
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for FB_DEFERRED_IO when selected by FB_DMAMEM_HELPERS_DEFERRED
>    WARNING: unmet direct dependencies detected for FB_DEFERRED_IO
>      Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=y] && MMU [=n]
>      Selected by [y]:
>      - FB_DMAMEM_HELPERS_DEFERRED [=y] && HAS_IOMEM [=y] && FB_CORE [=y]

This is a nommu device selecting a feature that absolutely requires an
mmu. Something's broken here.

I'm not sure pretending an mmu-dependent feature is does not rely on the
mmu is the way to fix this.

I'm VERY reluctant to add a stub for the function that explicitly relies on
CONFIG_MMU because it'd be very misleading.


>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
