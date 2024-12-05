Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E4A1A28D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 14:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733407648; cv=fail; b=uAg6Qom5X9TPLh51coA1IHj/1Sj4mnd/XHxztnI5xDJLBpJv4KADENWZ7xw24HU/iMNDLdmwV9zHKlbgjGQ8LHE7d70GQ+ajHefyJzhpNPL5jZP1IROYGJp2xJ02F8jmm84WzZMZP6oqf0VnkhT8RvFxk2a62puScubF3iVRQAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733407648; c=relaxed/simple;
	bh=7lFUjj2Iim4qRl/rMuXyoiR/t+gvqh0QX94ZTCH3Xz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bXMolonoE/2DuR4/SQ3jfMl/fyWc8u1xEwZli9kGUPLw6A5S1MVxKVnVsberXtNU6IvnWCdjNKCtdMiEx+BcPsKwPXov5TaPHoLXTr4EdnEJ9LQJaryWwn22z+LIcsaV/4+dQT7q2nbncW/ZwCtlCtbYLDZC7wo/bkEXk8NGyhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D+bDC1Da; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kDC8fUDg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D+bDC1Da";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kDC8fUDg"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5DfeB4011208;
	Thu, 5 Dec 2024 14:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=pzt8mAY9Kk0xvv3DMv
	XTgmak0ys4M/L8refmzU+A37E=; b=D+bDC1Daf3kTnZ1WR8tgqTzfOO0602QEYC
	gEJRsjkSj8gX1ifcLigGhAoJS6GxRB4CqQDYpPSmV/7zixSzXQeJEN2DkWRDDmhf
	h8kW2FNbZS4hQcFvMp7nwIq+qj00gM/qrhVt6xAVD301ynrkf7SaowmQ/PO8BG6E
	5xKyy58fxdVy8tEnHeaG0HPP8PIC63qAePasHfqUzLxcek49E1hAIbIS2ItTKzgi
	+MCIKE2LY3DLc5+YH6o0Rwi1bopz213/ihoyIBX9zSmScAOIDgHU0KhqY42YRUJy
	MBZ8e03cOI8953BncDf43ik1VVXzcR+BBpPs+lc/edFwUC347aOw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 437trbu5t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Dec 2024 14:07:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5E35UO001747;
	Thu, 5 Dec 2024 14:07:21 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 437s5ax7y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 05 Dec 2024 14:07:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bncJIetdkoUVHKf43HeiQzncKqgfTrRZqPu93GSG/gh8+sXvAVgV3I1b17C67RF4G5mwYgo/6qB238JJijSAM09LfcXwxlvZEVtmw9EvhMvoTEsjiVkjRGJ5ZUR+2aLmsA8kzB/xuHLPxw8sbAEK6Lh5YnqD/I2vvoc6/zmi7N8jgfDQx7cbgK+5ERxX8Kd2eT2YJNkdrlligPizbHlpHkq/KgM1T+mzTaGKbNRPX5w2M78CGGCklWdpAuBCIf8qx853dCIOmPCzgaiaX+EXhL86XZUaj1NX/OcN/vB4UdSJ73SiQ4oho6fNjuVYQBbA9GqLKmydPWaIiuIi/fUgkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzt8mAY9Kk0xvv3DMvXTgmak0ys4M/L8refmzU+A37E=;
 b=A5vpyD/CfivKduvbjPEZRuzJkdDuM4xrAcS9oUcbaYyNu9HNtaAesNG/68dl7+RB0HG0b81EN96gnJtXr7dHcPC5Ti/zo5M8KNDJnLW0GLtsGQ0KWo3pvqhyQQ26Yn7wOoigjDqZeYImy3NhKejK0OangHVu3NbdcVcLYqBpHyt4v0a9lN6Lf0P+GQO/l4HwbHiazw6YfPoyiwzmMt2o5dA/AIm7MfuHYw8tspXa6JymCpe8ARsyLBA2HdvaIfRH/md3DrfLEmE+vxzV7aC4+mMeLFYi1JNTU+mFQLII9ZOCWSIkxPlKquaB+cJgdxxX4ynX8zdEwJhiVgEof6X2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzt8mAY9Kk0xvv3DMvXTgmak0ys4M/L8refmzU+A37E=;
 b=kDC8fUDg9kHl1c3IXvYuLcisty1p6DCC/8kC+SNSlmGE4FSji7de5CgU93F6Z3R8P2yM+NhWXZgZKTOoXXilovU2OjMHdb7wbrWEXNwhNhxTvKv8Wq1k+mYGTPBJe5WJJcVRT5kUOIgsbRoXOjak3mAJXpNKTXO4cgkeJp85fWk=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH7PR10MB7852.namprd10.prod.outlook.com (2603:10b6:510:2fe::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 14:07:19 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%7]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 14:07:19 +0000
Date: Thu, 5 Dec 2024 14:07:15 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/5] mm/vma: move stack expansion logic to mm/vma.c
Message-ID: <cd673e48-6583-44d5-9aa5-e402c616c1f2@lucifer.local>
References: <0feb104eff85922019d4fb29280f3afb130c5204.1733248985.git.lorenzo.stoakes@oracle.com>
 <202412052111.B5Jmi2yT-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412052111.B5Jmi2yT-lkp@intel.com>
X-ClientProxiedBy: LO2P265CA0421.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::25) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH7PR10MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: 1330f2a8-0ba1-4e4e-4852-08dd15362164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KADppWcEOSMSS4Ki4EbqLSnebLhb9afwLdyLsCH6x96baey8gbGTP1Y8eAMG?=
 =?us-ascii?Q?Gd0j7OQ+9mI/HaMjHQN6CfoNNplm5qGsLlEGRRjmGPOuiQOX5Hw0WGf3wSae?=
 =?us-ascii?Q?WvtzpoF0t499HKiB9FdNmBJg+1KSjJLeYAC4eVI/jxmkt+4FA4gcuU6OscZB?=
 =?us-ascii?Q?shztsyF7p5TrMiuk6bz8IXHjr6Coav/WHqTEut0aXb+uizBCLOdVyXsD02dd?=
 =?us-ascii?Q?pPTrjiKojfulUF0L7bz3BbDqJv0L57ML/YyCdREWuRnNxptH0cPulz5uUUAr?=
 =?us-ascii?Q?0Jcou2xABSBxijft/4JLk/r4EPw8q0izr7JstrNPPr+vJuCbOD8unue+cqM9?=
 =?us-ascii?Q?lutCYrUudurj9jI3tSSMtyMY9bwnZH7TAaEXrl5KEZJnYQRNBhgkTOGIPald?=
 =?us-ascii?Q?/up2APV/OOYlUAVnOrbuG5HRuXfC/uGBDE3MFuCsrddxbx96uVa/RbGdYVsO?=
 =?us-ascii?Q?cE0guPJ+nTMcWhkxlDejdyYxWbr1HVX0Iqm8RfAttrbW1zagQ0eC/LN8dZXE?=
 =?us-ascii?Q?I/a9VeffceNTSBi1h9K+MsW++WIYcRM4WCte0D03q/nstuuMVK19rG14rat+?=
 =?us-ascii?Q?zO7i3QPmwWbZwZc7R6PCjAVNSIRUbSaFarTgOHmfKUiQSmg5SQK94hugZlGA?=
 =?us-ascii?Q?PSohSWbqdPfNiy5YU+tNQ1Gb+GA19NBsVUonu95hMj2uE+kopvpMzE0F6pMf?=
 =?us-ascii?Q?Vf95tSgoIO9uZW1YMnVXm53Ogn1ArhkEOtFsdy9a8MI1ndgZn+5PpuEnjOqi?=
 =?us-ascii?Q?JnyO/++W4uCVzAl4T9xa1Icjac6vNM0dJZLX9BHGDm7c9cXU3sXdvCtblcYc?=
 =?us-ascii?Q?pkKT8X4ERMulX+Jymqr0kPy0xn7b4L72TQGT+5IGLfOHh7FBnD01THdBD2UF?=
 =?us-ascii?Q?2QRIkQrti/FY+ISq5yU6sCKIvEdp//eqHfNvZrgscuoUmlkjKB9Jg4ck4pON?=
 =?us-ascii?Q?mMk1GmqSEMqlX20ERuC9BIsv9yz2TEVu8FAGiP6zLrFrlcBYaeXZd5wE/X9B?=
 =?us-ascii?Q?Mu12eoA97pcSRih5azNstmR8hq//WHdLJBti8bO5G0jSy0L4s1C4C2UzY1cc?=
 =?us-ascii?Q?1akcEC/Y574wGIRN+xgJB333+b1YiDCunKO++zMh0lxp0hgs2XRVS4PFfhhg?=
 =?us-ascii?Q?AvzW67zanna52+AuhsPJctJ2wkzTRQkQypN9PlPPDA7G4aAZPOflfr6Zt8Ym?=
 =?us-ascii?Q?b9ESOg5adZ3FFbtMvZo6Sisrs5kOhKP8ZQVs9+FqxndVz1S8lgprMG80cA1E?=
 =?us-ascii?Q?/Mznoxu85KqJbdphM1ez4FenkS+9kqLC5RsEUxJQN7tbDJ+SEcObmzHCi4N7?=
 =?us-ascii?Q?BWM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7fjIhW35TR74BkA/0hBLwJ7Nyy416YjsG7bjLNq7M22j0Nr5saiDUBCztzBb?=
 =?us-ascii?Q?8/oZ62ZTWerDavAhu+2llurfGRgvE4EExt6jXOV15kInKYWrVQ9/aLLBGVJG?=
 =?us-ascii?Q?hzEUOG7bLTYihpneDrsxqVWj7jb+cgV+DAXUzXTCSE9+OZ3pb3vonJ8g8rgz?=
 =?us-ascii?Q?LFnsQuyhkGMc4A2mhZqC1QpJarh+qDnaz7EnrnWm6xzvJlIN+K04Uw6tKncm?=
 =?us-ascii?Q?TQWSAxamBuQkL7ABC6f5C6OZ1wlvFTblrGXC/2ErQl9/lVL9rfDmZQxNx5th?=
 =?us-ascii?Q?CL8fRQrJNGMG3h0XQK2Oz9qniTZzhcnZ+67QpV/3orV/dbyrNtNx+1nmEQic?=
 =?us-ascii?Q?pX73oPzyIKziot73L65QEtQoNUo8j00i/xMo2KNd2ol5Ukb07CK3ghTJGw4o?=
 =?us-ascii?Q?t6edDRHtn93XCL0s680g5qiN0qeuRItrrn7nnY+CDGeMKgIImrB7f6ZmKY95?=
 =?us-ascii?Q?GebVr6p76OSSocF2OV4J//gkOjcWfPCjFfdxGw4hVQDdu7gH7EFeGkVUEUGH?=
 =?us-ascii?Q?/m9dulir6x8SC1sW+SLc+k4wdjKSrTYgLE6wBP+uxnvthdfqNRhVtPI8PbdI?=
 =?us-ascii?Q?L/LO2Am1XNyUQwQp95AwIvOLcpzcF7zf1uZ/drCFS341O2Z8+SgOK9Wjqpyo?=
 =?us-ascii?Q?y1DFt1MyEHiQ9yMNlzAulf0AmZIWH4WtbDG4lszBOmYBIqyHym0/YIYDJUSs?=
 =?us-ascii?Q?mOl7seg7sFr2fBL2b43vfWrF4RbZvhBIKc9knveuVSCR5uIt2vFMb4VBlm67?=
 =?us-ascii?Q?lyrVV46sBhwolRzyIy/0NnPxmFU8NFh44+/MDceZ8phWvyo+nAsG65F4CPd7?=
 =?us-ascii?Q?vWfK9jjERIwlRybBtfq//CUWs2pztWCyCEoYzZatL90o44lFEcuHDDT1mkSK?=
 =?us-ascii?Q?P8PgkYz3GthMvb382+ESh7X6cg4FYuPK6DUa0VYiHzsa/UTLXWOUTkBV+BG3?=
 =?us-ascii?Q?U4JUwr0IgVPRjjdOLEe95/YPjE2mhkbrxfsRC2rcOZvNEY9IqAWMkuj4kHzQ?=
 =?us-ascii?Q?PLAup31W8Kg/buIv2pOH2g8XEd7InnKX2kPInPmyX9YpUXESYdc8hnATsYKQ?=
 =?us-ascii?Q?zqhZuoYb7zXkXcBzYILLyK6p0XbU/71EuECSOTWCCmsu3J0ROMzfr8n8A1nr?=
 =?us-ascii?Q?90GbwPEHKgHXYQsLYTnCnbcVK59XkHa6YxaIMNcmMAzTDUkq3jWDD4WlSLWw?=
 =?us-ascii?Q?ToKq+xNBbYh5ZKAaW8OMW3MzrMAKW4E07I+f1eEAirAZCPpLCj19B9fB+/dl?=
 =?us-ascii?Q?8x9Jr2G5aog1sji2p/0G1GsEzB4j+X30EpkwceMRjGJaSgdp9wUSjGKDDzbc?=
 =?us-ascii?Q?kcHmY2yASSTxi3Z+YVpZxPi+iY97Je8HFTKwR7mFWb6CDj76ZMYPKH4lqqKu?=
 =?us-ascii?Q?E8R9JvV1wiZ/r7vx1LuZcSzJxCPnhHqf+DUVgv3fJrai+GWMkpofAlEVsfee?=
 =?us-ascii?Q?HRyZS5hNNzPcA54ueB7SPrJ9XRyDLVdlTJpVBPap+HH/qjGbgDucnLnYbV79?=
 =?us-ascii?Q?IdUbc8N3KlxD1BGGvs8y7NbyKEqt8rxZ7tvAjKsK6WfAnwbjwCcUPkHdqN8s?=
 =?us-ascii?Q?qvTilU8hpRs/IbSADOyGhdXvGIqS3PBTJmssENXVFDhtXBuepp1327rScplK?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	QvQgfT4UqdXEBh0p0W8OxTbW+/cVrTknT5ocLI67mEilBhQPjDyxmw1wpmAI9ThpwHWs2iWCWL2VnFeAwRDQcZ1Eo3UK0HZRjiIjUhNaiFh8DR/1E9RH8l1pL8iKsFDpWHP/Wfp5djHvDwmrCrRkHSfnBYn+56ypztKc4emRoO6LuaOzSkgUwzTEr3TwkzBm1GMZoVz3L9Jru3AOxLpqAXM4yiD0F6FqeGUxsHiRVT/g6zTszwYvbJEakRy26HbQBvQkcIut/UPAJKdlgB6vL1ys4ejyor4lMqWJi32ft/DfZhxf2/H7XMPJeZfFMJTFOO3/TytBn5b9Jp00cDxUWBNKF5CIRCry264Mk0o2O/NcwkdcUAJ8TZJeHR1N3co8IC2lMn9mCY8HgphOZ8xTHl+DUt2L7On7U1oTo8dVHBOVo2l2bsmoM8k+vhjpAgifeIZtjblBmX5HF+UvfJdaj6TFuJuIHc34jBFNWqge0zozEsN8UouiMbvYN3xqJVj6KrC86DNYQjKw3UXcPy22hFqkAnoXBs4P43N05r7fCzTxTHmtjRTEectleA4tNQ5JLqzCYbElL2PCbh3VFF66t05AsvJKbkKc2UDlK/CfO18=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1330f2a8-0ba1-4e4e-4852-08dd15362164
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 14:07:19.0235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPEn5q36Dpa2myuX6Pf29SXMn8kzbd0QEpihu1/p2KxFlE43ilO85nGT2BDZTzTADDxazeWgqsG019RbyF2MIgA1pigRLXfPjKL3rx1EKJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7852
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_12,2024-12-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2412050101
X-Proofpoint-GUID: OXnORszC0Lsc4so_cbVN1dnyLqR2TCRH
X-Proofpoint-ORIG-GUID: OXnORszC0Lsc4so_cbVN1dnyLqR2TCRH

On Thu, Dec 05, 2024 at 10:02:07PM +0800, kernel test robot wrote:
> Hi Lorenzo,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on akpm-mm/mm-everything]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-vma-move-brk-internals-to-mm-vma-c/20241204-115150
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/0feb104eff85922019d4fb29280f3afb130c5204.1733248985.git.lorenzo.stoakes%40oracle.com
> patch subject: [PATCH 4/5] mm/vma: move stack expansion logic to mm/vma.c
> config: x86_64-randconfig-161-20241205 (https://download.01.org/0day-ci/archive/20241205/202412052111.B5Jmi2yT-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412052111.B5Jmi2yT-lkp@intel.com/
>
> smatch warnings:
> mm/vma.c:2816 expand_downwards() warn: unsigned 'address' is never less than zero.

Smatch is confused, FIRST_USER_ADDRESS can be > 0 on different architectures.

However in any case this is code that was moved, not introduced so this was a
prexisting 'problem' (not actually a problem afaict!)

>
> vim +/address +2816 mm/vma.c
>
>   2798
>   2799	/*
>   2800	 * vma is the first one with address < vma->vm_start.  Have to extend vma.
>   2801	 * mmap_lock held for writing.
>   2802	 */
>   2803	int expand_downwards(struct vm_area_struct *vma, unsigned long address)
>   2804	{
>   2805		struct mm_struct *mm = vma->vm_mm;
>   2806		struct vm_area_struct *prev;
>   2807		int error = 0;
>   2808		VMA_ITERATOR(vmi, mm, vma->vm_start);
>   2809
>   2810		if (!(vma->vm_flags & VM_GROWSDOWN))
>   2811			return -EFAULT;
>   2812
>   2813		mmap_assert_write_locked(mm);
>   2814
>   2815		address &= PAGE_MASK;
> > 2816		if (address < mmap_min_addr || address < FIRST_USER_ADDRESS)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
