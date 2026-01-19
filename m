Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0E91A285
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 03:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768792087; cv=fail; b=chhIdCV6G6kBMXTUNihhtjhDlCvWaTS4gcBgs2n/Kxsv60tTMeznCshi6OwOMwjcljitQF3BhWdghofMvCqAoSFcdWLitxpODlA/I9HrDNeuR6miHjVeMAWI44xdzz8lWZuugWh3GYdxPPr/ee/qzlxFo6M2nBUW+PrWDwxCRAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768792087; c=relaxed/simple;
	bh=UDzXQuHXSDAlfZ49NzDtSg9ehmk3f8j5YKMfvbRXkAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mMVPQBPkjUEGxZPLAU/IFjhiZ0F7bwPgr6ieVxLdmL2sXchThlKTTPdUMwKbElRZvv63eFGfKk75+8O3qbb6FCRHm2gobgi3c/wAWtMvGOPdMnYaTezsrPkMvWhcN+FQuvoRetfZ4bfwyaKgFQqink9uqmoWRnGSuEqfJOXd4Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fg6GT9sQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MDpb8mvB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fg6GT9sQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MDpb8mvB"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J1u4No144443;
	Mon, 19 Jan 2026 03:08:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=rqrMLmWTHf/I6rIxUH
	WRyqw/WyDT36J8BssTWUyxnBQ=; b=Fg6GT9sQDqpBqM8MD24iUn0dWvEpk07Y8A
	zJGaKf2EQ7eNTqwTtDA+faQHsOreg0VXI/dbOAILi5VZRETKlOuyq/7TaSFa8DgI
	FP18DjePyMWy2zWKoJRc+m6MgS4edhiZqpYZGtx48kdeWbGbmWAxw1CG53jfp+d8
	Qg9yxSdhjqQZDa79YC6zdgrIkqHxwnfLjtAuDa+hq4vX6gLPdqotose9g2oG/zqf
	ixdEUo8/jHoDPdGKWlugcZbk7/c+zsTe1t7vN9RNYuZOWYLX5CN4vTMNNWfW7rG0
	Jjec99P8XN/gavwQOz98INRJjMPwBhNKu/CPsH8mNWx74VbYFunA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br2ypsja8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jan 2026 03:08:03 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60J1U27D000635;
	Mon, 19 Jan 2026 03:08:02 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010047.outbound.protection.outlook.com [52.101.61.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4br0vbkrde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jan 2026 03:08:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvVHa7QX44AEv8WwPWl1JcFOVe9vatqbONVi8DsRE3UIby/AymBgaetuarnbf8YplmQE610LXLB1TDI8TgQLGOV5T/xIBV5IxE+oqwYaZX/b3+7/katWLzBtQaq7qT7k5K/ZSFYSfmdRpRVcPwBirZ9oWF+JHoj5/7KJI8cf2ZooG1JzxVotAi0UipaMiFglPJnd4kvExSilXd6R/Li0+ylEuvbdsEa/kn29Z9lx/64kfxNY44Y6pkCucSe0Ffsbq6VBDvNa23CVCMhuw0KcpT/ri01M3hkChz8yxmbn0hMQT/zqCLOrFPLWG7r8Fdj3M4uH33SMhv8ibKhBMFYqsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqrMLmWTHf/I6rIxUHWRyqw/WyDT36J8BssTWUyxnBQ=;
 b=g//S80dW98H51zo1NaMYSuQ08a6dpMtzoL5GyTfklWJtcFkJ9yXMPMCBQOGCfRpnwlUnuvJl0BU5lfWy1s4Ba7OrOJ1TQPQHXfMsKKxRSqClemnZ5mABOn7cYMCCaML5VmpJlHYiDp++g6Ez4wnI+SuJK7oJQFWjRaQemKL5+R1vON5vCYW0TOOo0toTtXoAhvBygZnFqoWZgt3eexcprIIyetBrG59SJ/hvfPrrrtIsAUaQker+SQwV9W2NA+IKPVledPSVZ5lBWn2tfvsRGNdiXC9PLzNGdhzEXFwpztrmqTawIFYKoFyifZcKUXNOPqHcumyNEFVpIPko0mv+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqrMLmWTHf/I6rIxUHWRyqw/WyDT36J8BssTWUyxnBQ=;
 b=MDpb8mvBisLdg8BYx6Zpo3CDQdgwHLEk/Z4TF+1P3tHOP9bMMharP9dK10SuTuNNrO5Ki509vJnHxNET3kR7UHifN07ppdwWJ6nA90Rf4Q2rM2ATJhnvBqCrLjisSoaxfrexhpiaOoGBcLRRfH0P39wYk3doSXuL9OoybvtXE9M=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by IA3PR10MB8347.namprd10.prod.outlook.com (2603:10b6:208:57d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 03:07:59 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 03:07:59 +0000
Date: Mon, 19 Jan 2026 12:07:54 +0900
From: Harry Yoo <harry.yoo@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [linux-next:master 5478/6849] mm/slub.c:2340:16: error: use of
 undeclared identifier 'MEMCG_DATA_OBJEXTS'
Message-ID: <aW2gCj7pDfRKvmZI@hyeyoo>
References: <202601172108.4M7RmCaj-lkp@intel.com>
 <aW2KpbqlxEbWhCey@hyeyoo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW2KpbqlxEbWhCey@hyeyoo>
X-ClientProxiedBy: SE2P216CA0072.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:118::20) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|IA3PR10MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: bee64354-700c-4549-863f-08de5707f34d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uoHVzL76JTkE9eiooTIsRUMEbr7Dda/KNK1Etv8JiOs1A6MNHLJMtFd6OW+R?=
 =?us-ascii?Q?gRxzVW7LKKjERP5sdSp4VN/Jy1T1avSI+ZsEVvLAtfFOn7XfgXRzVWNikLg5?=
 =?us-ascii?Q?JEvdoz1KGeK7TYzhJ6drNe9zyBfNaC0/BC6qmuX2MEzsJsCYyO1kxorXhgK6?=
 =?us-ascii?Q?FZyL7qog9kXJRqsGz7MHCQp5htJ3d8tQxC23UK2BfOfczqF55xyhSsbbjcx+?=
 =?us-ascii?Q?OO0cCmqP4E44E2YrIqVfQUp6FODMpr9wE08GiVQSxVInUXzxeJ4R3rLhtwhN?=
 =?us-ascii?Q?pmBXvb+ml0sOjQ5JVeh/D9D3wJjvC/f3Ipg+yRMIbtm10SPFOHVDJunCooCq?=
 =?us-ascii?Q?UZRLxdZJysS1iMKi2CWuc53B4nKhix/XLx+K6ujhM2zWbVGtTiA/zlfswbHd?=
 =?us-ascii?Q?sLSei2wtbzKpzw1YGFqMgWF2LB57b1NaY+pbHu44LyR3y6XNYxkaMbiDnm3i?=
 =?us-ascii?Q?AgKo828aFbJD5EQHNbcHBePbbeQowN4MiDn/6vXnr6jeJV9eUT2OC4B/5+Q/?=
 =?us-ascii?Q?l3K15I3FRYr/ZeQ2dtZ26N3a9Bu9TR3/LaFgzo38N0r6Q2T3soet0ywG1ywT?=
 =?us-ascii?Q?lTiYKWXn6DZPaWjUah1elQfbJsPm2qn4SBRkZdleHdEc4Hoyp4L387iwQCEa?=
 =?us-ascii?Q?0/HmQV9n2KaZ5+pxk2ZajrK9Dvo492HlqhtoUEzUpw0h3ceq5zRokUOYb9MM?=
 =?us-ascii?Q?Vt1Qbll+J5tAtWKd2WOpccwLWzqJd21ZrHcEsFqciMkxMLDheiMyGRxXKjdj?=
 =?us-ascii?Q?V2s+vle9mgWiPPYr//k7EznwB71WkHbHVHeow4wY5By5rMXFR/vexyuv3Bno?=
 =?us-ascii?Q?3ibRUy81g1EuoKUqF8cKwunP3B4IC410zLcRFE66ZybRIlsyA/alaq5/90t7?=
 =?us-ascii?Q?bduFxBlI5YXD4OlFb7HGoXobnf2aRD0TWWN/REXYVX2JdG5Mvpk9tH3nN1Q8?=
 =?us-ascii?Q?C3WlohRK7Vtd4GFEl0ZJoGq7GHFdGoSVg5qFQ5Yxvsmj8OlU30Q+Nlry7++T?=
 =?us-ascii?Q?+6OZCFMOkDMDZfiabmrnf+zVh7RZcb/8f5WQNaMJFG0rMxsmIWhi5O2yiK7Q?=
 =?us-ascii?Q?/c5KQc0SM/oR9TdirGc8PTOTYEdZa//KcfQIK1lce576auxxHuYpu0gbEYgk?=
 =?us-ascii?Q?OPq7AXeIO4ZUEpKOaTOnw4DxYePznPlozU/YKTOnKXF76BAivh63j9t4CkjB?=
 =?us-ascii?Q?l4t4Cpa1wxuy1v1ubee3UoJEW8wiA/PHIpilrDGjefmZ2+0qR6S5W71fvdcf?=
 =?us-ascii?Q?3ilrrLCsg7qjCVJJ8aHMb+yi9U8zQKyHJ4Y5ZNUZpTUQsIqJej6UGSlSicsN?=
 =?us-ascii?Q?e8pJI8bfMHvnG1mW5c1bHiCoKFYXM4sy4Aw9f8QTnMaIEgy3Byp0UFC0uwE3?=
 =?us-ascii?Q?Nhq0MSmiqm+pkfloirmZwcEt+oU2UNdx82x63fD+2ZU+SzP3dV2Cjqa6asQ0?=
 =?us-ascii?Q?GudNeYlyrY3HSIN5PC/A7lqhmyjW3Pxxd7DllSiGuYk9s5NNAtsWaogGi3oR?=
 =?us-ascii?Q?Ga1Gp5qMzn4DLVqA+3QQoSODpFuEywfm2CAeuzNNWs4Q1lXcAoqCCS0EeQhu?=
 =?us-ascii?Q?N7TT0VeMfyjqaAuF6iE6y91JdEdqWXp+Hu0XQEr/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7329.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OOY/9hK4dc/nZZZiqwVzTC2TujMmtjQgY0XQ9g4xDe3HuzR7aoKeMTJPpU6Y?=
 =?us-ascii?Q?eMS3j3AzsU5tSxJ14keDR3YMyMfV4C4n/p6UajnGAVFm+wk4fcPvhojvry0W?=
 =?us-ascii?Q?pN+9OyFBIHU1TFh97MJ1lp9mpac9Pp3KvBlcU6sgCDzGqHoywd7cdVvQNjpc?=
 =?us-ascii?Q?HJ/HWl/dntgkSDjERqx2HnhqSXLnoPmjCWNcQviZrKMeb5/nhPhQXgZkTZPh?=
 =?us-ascii?Q?rDIqGlDDq104KVDagt6MJt0rS2vqbgcoyes2qINkWp63nJOAUbISxSR5A8lU?=
 =?us-ascii?Q?beCNvqwZf2QdXsjLhbEhf3cv8ukB/VkbC4pYi/i61fBxCLPsLKlJRunJ2xxd?=
 =?us-ascii?Q?4eyC98GYHiQrDnoQN31Sk/rHsQpvtwUYHRUfKQoCuc0b0A53zxKkjObEIcC4?=
 =?us-ascii?Q?ANB4eD8ME3zB0bRcI55I8V9oY86Ng+iJMTCR9tU75Qcfg1z13fLl/q2rQPvr?=
 =?us-ascii?Q?hsnsU4D8USzkpyNitmU486r1jhFHWlmiUeEbbaWbAlQz1fchMyzVBc26bS8b?=
 =?us-ascii?Q?3gsJBhSKpc8IdFzmnmw6ZYp4xvkVToOShilGBq3YTkJE/sv1ZmKXov5hHu7h?=
 =?us-ascii?Q?tymj+e9dmLyyWas3lJGtRtBTaPzO+afw2D5oZpe9AbVnOGU/K1a6M9Elyr7z?=
 =?us-ascii?Q?h9XJ9EE34hrv6+BEOoxCj1UHLxqE3V+ywMK7mxKx2pwrlBuAzUfT/MTVUn3m?=
 =?us-ascii?Q?z3f7cv7GF0KzOYuRCwWq2+QQwa0YBgxf2A0cK7TXMVj1nyUTaFX7UMhCdpyc?=
 =?us-ascii?Q?+vKezOIq4OEd7p6H0gBSAdzJg5x4BY07vacnLO5CgESswo8vuzx+JHrPOjVo?=
 =?us-ascii?Q?8pN5OFFaWMwreY0rHpIhWn/dCNgTfFT01hJsvfL8RQcUH3lM7E/5VW7gOyYT?=
 =?us-ascii?Q?JbivYpqOtr8OY714zlY2Hy6hJk9TwDua3ceMOl6UyVwnlhGYvZGMlrul5Gvr?=
 =?us-ascii?Q?Ji8HPPcy8TXQzZgjlw4UmTLkDsLoldCBek1Ac/mrYCeoiNKCS5xEMhrVHZss?=
 =?us-ascii?Q?InaL/I7BlrrfqzFdbN478zcic0Io2fxTdcJCFpNq7KYL3ayYJOH6jvffAQ+6?=
 =?us-ascii?Q?tMULlsqgGdRTUTcZj6p/E47s7E9Yuv5aLSOKqWkrvhMWPqOh8dCgRocYxBUv?=
 =?us-ascii?Q?L4W8kHL7vEabC34PAeRhwsSjqVM3CG/rBcqhvyNE7tXmvb7ikY5O6wpBJEKX?=
 =?us-ascii?Q?U9FA8Rwes4+bYm1ODx/5cWYiN9MFI9RU2BDhf6mH1/vgfvEHlCM5s1Qbszgh?=
 =?us-ascii?Q?UQsJ61sJ0xXF0pMz8VLD1JPPGenbnANwHNw87oqZzKy9yqV8d+O6Ka6cyLdF?=
 =?us-ascii?Q?8jtOR+wyS9h93+1HeQscD/YsHehxCUCWqepTzD1lSQIjQZUrK4slhwJuQS5I?=
 =?us-ascii?Q?CU/eZfBuHVMHrRF45yExT8KEjMfPFZmvPq/IWiqeZaAmw+7mNvWzc6TVkt3i?=
 =?us-ascii?Q?0DwaDn4kWP9Q8x5zug2xrTJULg/qigodxwxXN9eMD+W3NSxkFYrHb+0auGhA?=
 =?us-ascii?Q?kFeR6JWYXyCRLRPJlSQ7Xr9FCc7GbS1Bls3lT3zCa/zkN0lBaKFMTWnNRV5X?=
 =?us-ascii?Q?JJiyTE7trKtuZmYop1fRX2e45EcJxEaZ+cZmMJXAO3fbIyslnhAvkSgNX6Xk?=
 =?us-ascii?Q?kQWIfIHM51Cclz8ntRSxjz2SCgOSRSBMxbwrQc0n6xHj8DxRBFeJjmH1Ylss?=
 =?us-ascii?Q?4iO7zTl0xT6bPh+Pd37xK571BYqNrLpUYQndy+LMyMyfRBN6jPEz4KjSg1hz?=
 =?us-ascii?Q?IKfkm3cjIQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1fwBvD+c8TxS8v9yo/z1wjLcp8+SthmrvLTZOUdoygu5/l0aQFIZlOuOuF3ZqNXSGh/UeUINiTKHomfuyX//xlRKPMgPlJ7EsMekAnbDsAzVyPQPVxr2gJZljnKHz2GYJt7D7NSpTwPlH+MD7Skcwwkmiv4sr+d7utAaSpjng4q+JW51oKgMMMspl9h+vQqkx9XjuoMIAiVjVgjHcPaIn4nVjdLIwaznV6kRwE0JOubJ70hfrPybxiZor2uKO9Vb95FCNWlWPUl8xmqh0eP/hCkIKLj4FJbt2U7fQ018yfRQ0Pf2pJFuIPyec/FPsW2qsX9p3y3qX4zd9jILeWAGqX2jTgsYk4CLsj0yk9wfBHTYmu9f/BgDWMH9MHjz+Bc89K9R6bVELq86opsbpRIr4eQ2m/D9gswDz9DjsH7Mi5EeGVgSN8xMOF3JsrnaCEgjrcNkuHao+AlhvCdiDal1BF6yEQ4CWCd1ZMOmf/plLnv4CPOQtC3gk24cUVanWNk+A6KzKZBe6g9VOx0vMucDIuERtgYU/yh2jnY73/8MEZjVXTIY8TA/Lpe9K8gIawnTJ7uVGVwGSB4LzNpDOXwKy96YW3RWqcnXOwMPUSPcfNs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee64354-700c-4549-863f-08de5707f34d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 03:07:59.5650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i3jTgaDMDEroG82NZwCNcRMDFa+wLoA6a30uNQIN3opgtiDJgJ4YbW7zCCS01Fr6B0nrmy9Z0ukRngfbzSroKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8347
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-17_03,2026-01-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601190024
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDAyNCBTYWx0ZWRfX7Q7+TuD2exF0
 T7Ht1h/O0xb2m+hmn/oTlZoZ3zxhTEKp/ugBlWi2ASCv99LJ8yD61O7ECCEV7ceB61B1/YMuky1
 bttAXn+Rjxpl05EXLodZRrY0gwaS00xxmVyBaHQPhMsasvCAL5EjVxz29SPrr7ZTtGPoQwYKyXp
 OBf5TqSYsJHYKg7DCCkUP6UOJzE7POPD2ghi65EuWx16/l58M39Gqdms0dW16DklZId6LOQTEkH
 ZNkn5gClB0NxHaV3ibQ8Tj/vLX7BEntWLm1BE/8QHYpu4y+DqJH4NElTzfD91UpR2qj50K9F+zW
 nRnnXsRJyq1QhQcxlAesjfxHbk+V1PgQjYx3fJ4XN9PLPxWpQ/CWCQ3fEMSRYD5IXJSRQcy77Hz
 uDRT9+z75DqYYZw0kYP+r4ZHkjoxU2V+YXJJY8+QiJFaE7ULsJr550NHPPm8eEPsvlKLUEv82M9
 B8r3QEvKnYPUWBhIzZh6ZL4wYDStEL5TNhv0IuP8=
X-Authority-Analysis: v=2.4 cv=de6NHHXe c=1 sm=1 tr=0 ts=696da013 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8
 a=CnSaLJJgddmZlWR3fdMA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10
 a=mmqRlSCDY2ywfjPLJ4af:22 cc=ntf awl=host:12110
X-Proofpoint-ORIG-GUID: UJIC1LsYo_AmHFEdX1gZJasFVOCbQPNV
X-Proofpoint-GUID: UJIC1LsYo_AmHFEdX1gZJasFVOCbQPNV

On Mon, Jan 19, 2026 at 10:36:37AM +0900, Harry Yoo wrote:
> On Sat, Jan 17, 2026 at 09:23:02PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
> > commit: aeb88c8de3688638632d5867c352676d334e6531 [5478/6849] mm/slab: save memory by allocating slabobj_ext array from leftover
> > config: mips-randconfig-r062-20260117 (https://download.01.org/0day-ci/archive/20260117/202601172108.4M7RmCaj-lkp@intel.com/config
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601172108.4M7RmCaj-lkp@intel.com/reproduce
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601172108.4M7RmCaj-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    mm/slub.c:2154:33: error: passing 'union codetag_ref' to parameter of incompatible type 'union codetag_ref *'; take the address with &
> >     2154 |                 if (unlikely(is_codetag_empty(ext->ref))) {
> >          |                                               ^~~~~~~~
> >          |                                               &
> 
> Oh, what a silly mistake. This should definitely be &ext->ref.
> How it didn't break my build with CONFIG_MEM_ALLOC_PROFILING=y?
> 
> >    include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
> >       77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
> >          |                                             ^
> >    include/linux/alloc_tag.h:52:56: note: passing argument to parameter 'ref' here
> >       52 | static inline bool is_codetag_empty(union codetag_ref *ref)
> >          |                                                        ^
> > >> mm/slub.c:2340:16: error: use of undeclared identifier 'MEMCG_DATA_OBJEXTS'
> >     2340 |                         obj_exts |= MEMCG_DATA_OBJEXTS;
> >          |                                     ^
> >    2 errors generated.
> > 
> > 
> > vim +/MEMCG_DATA_OBJEXTS +2340 mm/slub.c
> > 
> >   2316	
> >   2317	/*
> >   2318	 * Try to allocate slabobj_ext array from unused space.
> >   2319	 * This function must be called on a freshly allocated slab to prevent
> >   2320	 * concurrency problems.
> >   2321	 */
> >   2322	static void alloc_slab_obj_exts_early(struct kmem_cache *s, struct slab *slab)
> >   2323	{
> >   2324		void *addr;
> >   2325		unsigned long obj_exts;
> >   2326	
> >   2327		if (!need_slab_obj_exts(s))
> >   2328			return;
> >   2329	
> >   2330		if (obj_exts_fit_within_slab_leftover(s, slab)) {
> >   2331			addr = slab_address(slab) + obj_exts_offset_in_slab(s, slab);
> >   2332			addr = kasan_reset_tag(addr);
> >   2333			obj_exts = (unsigned long)addr;
> >   2334	
> >   2335			get_slab_obj_exts(obj_exts);
> >   2336			memset(addr, 0, obj_exts_size_in_slab(slab));
> >   2337			put_slab_obj_exts(obj_exts);
> >   2338	
> >   2339			if (IS_ENABLED(CONFIG_MEMCG))
> > > 2340				obj_exts |= MEMCG_DATA_OBJEXTS;
> 
> The config does not enable CONFIG_MEMCG.
> 
> Hmm, this is strange. It works when I change it to #ifdef CONFIG_MEMCG,
> but doesn't work with IS_ENABLED().

It appears to generate code that uses MEMCG_DATA_OBJEXTS and throws a
compile error before dead code elimination removes it. (Interestingly my
compiler didn't produce error, but MIPS Clang does...)

Anyway, this should fix the issue (confirmed that the compilation errors
are resolved with MIPS Clang, and locallty tested on my machine):

diff --git a/mm/slub.c b/mm/slub.c
index 373ee58b8b9e..1d87134cef90 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2200,7 +2200,7 @@ static inline void mark_objexts_empty(struct slabobj_ext *obj_exts)
 		struct slabobj_ext *ext = slab_obj_ext(obj_exts_slab,
 						       slab_exts, offs);

-		if (unlikely(is_codetag_empty(ext->ref))) {
+		if (unlikely(is_codetag_empty(&ext->ref))) {
 			put_slab_obj_exts(slab_exts);
 			return;
 		}
@@ -2385,8 +2385,9 @@ static void alloc_slab_obj_exts_early(struct kmem_cache *s, struct slab *slab)
 		memset(addr, 0, obj_exts_size_in_slab(slab));
 		put_slab_obj_exts(obj_exts);

-		if (IS_ENABLED(CONFIG_MEMCG))
-			obj_exts |= MEMCG_DATA_OBJEXTS;
+#ifdef CONFIG_MEMCG
+		obj_exts |= MEMCG_DATA_OBJEXTS;
+#endif
 		slab->obj_exts = obj_exts;
 		slab_set_stride(slab, sizeof(struct slabobj_ext));
 	} else if (s->flags & SLAB_OBJ_EXT_IN_OBJ) {
@@ -2402,8 +2403,9 @@ static void alloc_slab_obj_exts_early(struct kmem_cache *s, struct slab *slab)
 			       sizeof(struct slabobj_ext));
 		put_slab_obj_exts(obj_exts);

-		if (IS_ENABLED(CONFIG_MEMCG))
-			obj_exts |= MEMCG_DATA_OBJEXTS;
+#ifdef CONFIG_MEMCG
+		obj_exts |= MEMCG_DATA_OBJEXTS;
+#endif
 		slab->obj_exts = obj_exts;
 		slab_set_stride(slab, s->size);
 	}

