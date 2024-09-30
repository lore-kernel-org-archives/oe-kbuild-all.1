Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766DD1CFA9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 16:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727712205; cv=fail; b=JBDqOj+9Jr4KnTpVA/pYt3nRl0/xVNP7DezEUAynlGUEH3LirsNJ/fydEbLNXGC+yb5+Or7R2t1r5gQ1g9NEPpEnqkxrdyypGOS0ru4Ah9nTPTaJcIV25Bg1wuy5rj/Nq0wVLuPBrY44MnscggWsnLrw0mImQEnwNwNqCoPhbK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727712205; c=relaxed/simple;
	bh=mT3SfGhXSozf+KKco+zp8+KZ9qpwkcswI7tw2psSLkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ORnwq7l07oxsNgizQ94S60yIKHRZqJlE3RIbiN6iX984aV+Ct0L5wQlAlYbzoFO9j77rAa/FuwCfroETQ9wCjJqBzl9va7b6K1FoH69AgHuj76N2evD7zPqzH3agcOZqLe9ylPmiBD4Uo3nI4dKqKVN/8UhF5YDZ9Y9dmo5XgNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T2TW2x5p; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LfIwHEVs; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T2TW2x5p";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LfIwHEVs"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UCT3YL026395;
	Mon, 30 Sep 2024 16:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=voJRAJe7uca1Irc
	cwFWkdY3DV9WfjwbN0EXI73/ljXk=; b=T2TW2x5pfOBI+73E6suwABffbV4sF16
	Kze8XKHDT/rjRmS5+b6mdxttWoGpJIs/NDSFychUPbmMrlVG7RXFL/ZSNYUMJkP7
	0Xiw35uQbz7PS2bpImEI6qYu6o1Hk3reoQQm9gepi4/l/FEcchihwMKpzIkLixO9
	xGeuqJvY7vRfEJOwNH4vMTdMGYzTQaG9/30bKybdpnP8YAYy+7ocsw61PAwMXUKs
	a3kB2jpzRBP2Z73ZF7ykpmmEl8IoW4k48mDNo+okDvfUUBYpnMTiuCkFvH88Glkc
	KeD4obxfvCgCOyDeKWgmodwZakmTaIIIZ/VgQ9ZFPneShreUYTvnD4w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41x87d3q7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Sep 2024 16:03:18 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48UFl1SU000798;
	Mon, 30 Sep 2024 16:03:17 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41x8867ytu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Sep 2024 16:03:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCtjTEPXi7quM5URTnjP7/vt5v1mu3oLIB8FUPcMO4sxldPsPPKahe1izbsAQPq+/EbcITYTPzq6rKGg9+RPMfKncxVXzXYJcRMTwlfpfxSNKSlI9t5WOJ+H9yHuIyKVqOrKdXAp2GkdYS9z6Sj9OzTapFbAf5MlCzx6xCfKUYrIWbWRnVvlv/fifgnvhg1xw1NCVes6KIIH7jQm6ZWEkWI9KjkxR4kJuSyLYe+EG66+V383sAutCKaTW6Bq2hU4shKFkUl6S6smhEY+FksedDBNVYlULQvr/UoKbpVkePJA9zMyJ3V81Qdk6DfdA/ToI/PUWnCCmEqkaIbPqAGupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voJRAJe7uca1IrccwFWkdY3DV9WfjwbN0EXI73/ljXk=;
 b=NWVKc8EDYnPu/T290EJduLh5ShcZm5ooSZdJ/jDp71EFmAkCnNY3o4LwPoUfQwK4/4RhRClDIVKhw5jhB4Rwd9bOEQ2Rk1Q2X8cTib+UHqp8xEz/1P4GfQckXspODO1kclLIShjRqBsmM6hiQvbB5EXYKJl33gUakmRLQ2ZHvRjzxWhUeqUZ3xlsxuAPRiC2wJCEpx6zFaav6HHL3UCrHq1wVR6AfkxTi+qWh6WH9mP+9B+xuhV/ZMBFFpWaQvTjjXb8q4IgYGdqAiY0BwiTAXJbVQ8z34kotBvuczzqNsnIlkBy/c0Nl1N6Rm+VitRg3hY4HUKbSb7be7jbOUnIww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voJRAJe7uca1IrccwFWkdY3DV9WfjwbN0EXI73/ljXk=;
 b=LfIwHEVs7YUjP5Sugfcx2xEBvtPX4pNosrSRcsqlAG0p02RfGaHIdstDBN9LmxdhcE7OlFhCu03B2mTjOKn6z66NrrCH94N9m6kjOoEnQcu2V2FMjd9wCeMMC/dJe184ouH/z5332gIm1rBAwvJhq1W7pCF3aR4CV1JT4G+CpCI=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by SJ2PR10MB7059.namprd10.prod.outlook.com (2603:10b6:a03:4d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.13; Mon, 30 Sep
 2024 16:02:45 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.8026.014; Mon, 30 Sep 2024
 16:02:45 +0000
Date: Mon, 30 Sep 2024 17:02:41 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/4] mm: pagewalk: add the ability to install PTEs
Message-ID: <ef10f8fb-25f0-4d77-b874-bc7245b068e4@lucifer.local>
References: <59e218670565accf978aeb8cf4745de4c0738773.1727440966.git.lorenzo.stoakes@oracle.com>
 <202409300134.I0lpBxcz-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202409300134.I0lpBxcz-lkp@intel.com>
X-ClientProxiedBy: LO4P123CA0181.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::6) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|SJ2PR10MB7059:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1e225f-257c-4946-515c-08dce1695270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3w5crdQzNMgHuSrFQMJUA2UIjk2Xgys8HUGohtvS8pkw6Yf8yNASTuyqw4rH?=
 =?us-ascii?Q?loUG7FwqLMFXFM97GImez0Go2QIpejR/2OND2ESwP3KSKA8S+K7tiyYns7LV?=
 =?us-ascii?Q?OKMG0hEun18CFQ3GQQa/R9seFy5HM3XvA9wxOHPHVv2a/yl+ukIv3B1/c/g9?=
 =?us-ascii?Q?8yvqOHf9QCJd98q3nyNolb04qCoiJjx9fPfEEGAo639F0DJihGmgsqAb8i/e?=
 =?us-ascii?Q?DxqJHdv/x9QQXaN/nSV7bRlasNCo6QeK2XTUQMX0obGwJ0wcclpCqPRPlH7/?=
 =?us-ascii?Q?+fIde2F4KAa7a9Iq630qjUtk2rTPO05NAZroMTns2UUEpfa0dylwURd67j5P?=
 =?us-ascii?Q?Ve5JQtoBX0aIxmrhbK//HB3T37z4Yg8nhr+CxIkfISR8nCqIJYGdDoHJbYoV?=
 =?us-ascii?Q?Ui7BTdA2S5gM5lZCrcv+NpqBA2l/foEEmb2vwWq4d1L/61HEFUcBia4sQm9h?=
 =?us-ascii?Q?u20sTH6B4bUSJHGYQV3MU/uiBTsNV777gQq/BefuuD9PoO44dLgl0kW5DB5v?=
 =?us-ascii?Q?W+ReZTq2zZPJ17OhX+UYDTQzFKIOKtLsFiOc/oN8iOwIJ1CHxZmcXjJNd254?=
 =?us-ascii?Q?Cw/N9E7vBFdsMLnRCdSiGeVgvcN0rnRnj10sRnq5DzpK3wBq3zGu+tY7fpmi?=
 =?us-ascii?Q?Sm5k0negzDI9/qpGNokBuXw6GxA/CrpOuBrecp/11GW5RDhzza1S2dTWVUYB?=
 =?us-ascii?Q?60dMFvNWKJfo+Y4GaYRPFIp6G50OWGCqX/ztO0isZNt4n1SDWALUHVRB1k3M?=
 =?us-ascii?Q?qj5MNKLhctFCzyTtohhAy1pWedzYz46HewoxvmCV83/2emFLdSLCWDSC7YXO?=
 =?us-ascii?Q?IUb0iBPTucoI1aTDVxEIMjvTfjdLSLqkCym8lF+o/V3X3domP4ZhfpeNbAcI?=
 =?us-ascii?Q?0zEaNYzFsAtvxZGAvn2gP24cdvoorzw73j8L/Fh93bvRw7v8MSVid4S7Nt4e?=
 =?us-ascii?Q?0ixiKpwaKXsf4B7Tn8ABFcS9TAmrKXTbWaowLeRhdcr/d5prhaioDuRPdPoB?=
 =?us-ascii?Q?fAnxK39bNq+ftmSkcdgi0vPBqWyELFwEtfT9Zxpmbbt94k6ehkKNMeSUTGCs?=
 =?us-ascii?Q?vWkO4FEyagvzTDthpi4TaINoYNyqu5l/ElU9/4+LAlFyJIrWMyYE15Jm0nyn?=
 =?us-ascii?Q?jI9KgkMAHlqRmSjtIYmFI20RpNXsu0wqTj5faDR7cIU12YLY0pZ/JI2Rs1vh?=
 =?us-ascii?Q?KJRo5q2OinNPt9R9U03TP1Rcu/RRZzasJgBMYJr6HtRJy15wtRzn+raEjyc?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AvfTgzYB48Ocf9YMeZOTfm2LQnhtdHS/ZMPpb/20TQRjyksZLfLUpwJ9RCMo?=
 =?us-ascii?Q?Pfm1azoA7pTZOZ077Ow9ieug5KHLWaZ/yLMyjgXnds0NKGK6UmReEnkSGCdf?=
 =?us-ascii?Q?ShUrVqcbavUimY2y54MQfiL4D08+kyKMiHtx6ZPw2hiY8Fo9kXFGXg2yhJ2E?=
 =?us-ascii?Q?LLLad/ZNvrNI1dYU1tDVpAv1tpdf9LIOggKfTFQp4Px90Mi3+4SiVaHytNnh?=
 =?us-ascii?Q?eJeZPaCvl98h+U4LJuIERwtUK00YvQR5Wwn1nQFAxXji5uDt3zQM8FN4h8YP?=
 =?us-ascii?Q?xphY8231yPkn44vQRylmO5uHor5mLil3Ipb99is8qlAUIE+n975yHzvIaugW?=
 =?us-ascii?Q?M7SsE63MHlyYHGgBkHQAtgFAbBBxhzezFjzbofN6k3Q6JHVppQRwoBJr8+z+?=
 =?us-ascii?Q?groegWPtFRZr3vTZyS9c5/VUfcQ2AUU41lnz8a3rfES+9p40sDIoLCx0wReM?=
 =?us-ascii?Q?G5ABC6bnYocaHZrtIRhNX46BIXKjzNtbZn/a+AgRN7r69vmPdCdrW7UykNco?=
 =?us-ascii?Q?9wtsJblQ5qQm/qweKCfLJsYsyYWr1K75xPkWDsHMFyERrhyKWDyfdOlQ4Tfb?=
 =?us-ascii?Q?ER2OKy2kICvW19rUWJ7si5VwTkmcvFkaAcS+gP2+sMOGXvuz/ebfhNVPPQxC?=
 =?us-ascii?Q?g6QIW98WXdkBdVm5bDfCqBWrPz9b7Xsi0h/FQPanNEFRwOZtBM3nRuo3xkjI?=
 =?us-ascii?Q?e2o9B5QMYm+eMlkA5V/9dgUEk2Ovb1kXVCOuo0MJb7vuYna7Sf3cI0JPFCvx?=
 =?us-ascii?Q?O1vhifxKK7qJziLDpOCPYPeMhOOc4xtDsqaXAPlvFm+mm0NhE3zHieOQVdlb?=
 =?us-ascii?Q?NhwTgW1ws/a/zZr2bB0cggKkT5zFs0ytnPLQu/aUy+IgznO5OffSV4qH6fTd?=
 =?us-ascii?Q?+QQD41Jh1loq7l0cyDpY/7Lofg+LaCFRWW3ENvaO+5iYccXgpTYqnkSd5cp5?=
 =?us-ascii?Q?twZn6wwkkk5jfIdskAx8/YZmTk0a+dkU3ijPzk7OPQuKwolXXV9BQNXcwhV9?=
 =?us-ascii?Q?Y7S7AAeeTKW97RT5NSiZDSM35/gB+0FMX6u4j4QqEwOYrTDlmiu5gsVlCzeD?=
 =?us-ascii?Q?FogOULKwZtDAzqG6Qe3BBzdi/fb8rRxLlF/UXBd3c6yfYtE4NOA4oJAJUVOM?=
 =?us-ascii?Q?f7biLA0GsFJaxIz56mO6Opp2IzYGvunK8lDe1CoqumItcuFmkh/TZLhZiKOM?=
 =?us-ascii?Q?L1FnALiz6VhUDmEsec4cqs1HgdhbOTWtYRwPa4SR18lEWz8B62tSEFttkY8P?=
 =?us-ascii?Q?6xvSP3kvn8lg43zprj2jhUHV/5d+mhEcabwI/BCDbW7O8o5O/J1JUqfeq6Pn?=
 =?us-ascii?Q?MDMaTEonei9Dq//ZgSLfg0kEEEiS0yAZ7/xKmsf8i5VAokg7AZmA1I2qqkyh?=
 =?us-ascii?Q?OIkiYi8M+9NYWn8gZ7aZFQnDxiBQYBN83s9eA/16iQ8iBSoY6iLwayNMJTy4?=
 =?us-ascii?Q?cUNpAd8YZjzKc2VU9Y6nEUsL661GtjD35qmBU5R61LTjdAt1YwFlNrNa6sYB?=
 =?us-ascii?Q?oDovikN/+bIPnQ6ruQTtgQrxTTB4WzP7E48B4kSNLYfww4XjqHcHvG9O4cUY?=
 =?us-ascii?Q?d+zOHrBawtxSyLc5wPYPuQpqsYzFGNusdIY/MOdXFT1NBlTt7IYVCZHlBsqa?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+TN0NiGB+oBvBqvXzFGr4o35+5PtldpeAO6xqlyYoLOCsDuvjIqoETNHP7NLdErpeVxB9w/PuhxHi3VTsQzMK1jcEc297Tez9TdN9ReUOMGdBW8IMxIyIcDnRYsp9dcTRDpJ+kH/wyVkklCNwOk8Oio3pZ72V21bAXsZr56vV4OS1FFogVWkoOVrpmec8B0PDjje0ERLH3QkVoai9mbTy029d8BmRjfrxwwfrRT7hxQQt4Qnn+XsfO1gAclwojwzXmxNqpnd8hXLvB/uRSttrH1qDLP04qcktUvR351cK4wMwhMbWY/51blBlFpMCzUnpoyB1QeyaXHX4XaYsnQ5kkTPeyzS8bavrC+06ECRbwTgXMmbZFN42//q3gW64q12lT6huMdVSkbRwf/bG85/nAUdN9VV5gd7VrIOunRLJkHGZuBmQfrdBnQMn/8cRzChb3I38RJHZ4f1e1hg5tiig/0nyuS/cAqT4OoENBrbJlOzhhkyEU5epmmlrSWQPHoZkG1VJSbMWfXbdCH0NIGjUwvgXBYZK+0rXBogfoAjqt5jFcbz9pgBJgMRLuymMonngHEyI+Hu5mbWdTDipLEkM9p8Us/U1aaeSZ+yG/6KTEA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1e225f-257c-4946-515c-08dce1695270
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 16:02:45.1663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pC1i0g6M5oxVfLIbTpe/rzytoOCPEiTv94HNcTUtZtS3JTXHysyZ0zFrPIbrHauJQ+B1ObEsgy+zHU87PsLck3Lz8UzxFzcVt8PQwG56LHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7059
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-09-30_15,2024-09-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409300115
X-Proofpoint-GUID: O3x6-OoyqvGxL6roNX5HTHc31_GFAlZR
X-Proofpoint-ORIG-GUID: O3x6-OoyqvGxL6roNX5HTHc31_GFAlZR

On Mon, Sep 30, 2024 at 02:07:08AM GMT, kernel test robot wrote:
> Hi Lorenzo,
>
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on deller-parisc/for-next arnd-asm-generic/master linus/master v6.11 next-20240927]

Thanks for the report!

> [cannot apply to jcmvbkbc-xtensa/xtensa-for-next]

Hm strange that it doesn't apply there.

> [If your patch is applied to the wrong git tree, kindly drop us a note.

This is aplied vs. Andrew's mm-unstable tree.

> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-pagewalk-add-the-ability-to-install-PTEs/20240927-205253
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/59e218670565accf978aeb8cf4745de4c0738773.1727440966.git.lorenzo.stoakes%40oracle.com
> patch subject: [RFC PATCH 1/4] mm: pagewalk: add the ability to install PTEs
> config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20240930/202409300134.I0lpBxcz-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300134.I0lpBxcz-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409300134.I0lpBxcz-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    mm/pagewalk.c: In function 'walk_pte_range_inner':
> >> mm/pagewalk.c:45:33: error: implicit declaration of function 'update_mmu_cache'; did you mean 'update_mmu_tlb'? [-Wimplicit-function-declaration]
>       45 |                                 update_mmu_cache(walk->vma, addr, pte);
>          |                                 ^~~~~~~~~~~~~~~~
>          |                                 update_mmu_tlb

This is a header thing, we need to import <asm/tlbflush.h> here
afaict. Another one of these functions that is, by chance, imported on
x86-64 (my local arch), but not on other arches.

I will update this on respin, and reply to the thread on-list to publicly
note this.

>
>
> vim +45 mm/pagewalk.c
>
>     26
>     27	static int walk_pte_range_inner(pte_t *pte, unsigned long addr,
>     28					unsigned long end, struct mm_walk *walk)
>     29	{
>     30		const struct mm_walk_ops *ops = walk->ops;
>     31		int err = 0;
>     32
>     33		for (;;) {
>     34			if (ops->install_pte && pte_none(ptep_get(pte))) {
>     35				pte_t new_pte;
>     36
>     37				err = ops->install_pte(addr, addr + PAGE_SIZE, &new_pte,
>     38						       walk);
>     39				if (err)
>     40					break;
>     41
>     42				set_pte_at(walk->mm, addr, pte, new_pte);
>     43				/* Non-present before, so for arches that need it. */
>     44				if (!WARN_ON_ONCE(walk->no_vma))
>   > 45					update_mmu_cache(walk->vma, addr, pte);
>     46			} else {
>     47				err = ops->pte_entry(pte, addr, addr + PAGE_SIZE, walk);
>     48				if (err)
>     49					break;
>     50			}
>     51			if (addr >= end - PAGE_SIZE)
>     52				break;
>     53			addr += PAGE_SIZE;
>     54			pte++;
>     55		}
>     56		return err;
>     57	}
>     58
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
