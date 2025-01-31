Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110481BE238
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jan 2025 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738326511; cv=fail; b=s/1mfi7d6f8q1v+MVF7Q7Qzp+ZiUOSsKOKJ8IYDrFgeTEiYELAUarKgJLy/yI5UvNJHulg1ty5EH6vaR0muUjWcnm14naTukgIRI1/mUY7C9PtyhoPmA5qYv/tXTTpO6Zj6F5KKTDULWdSaUMw4FL928qWRV1Mv4i87fJPLC5YU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738326511; c=relaxed/simple;
	bh=zEgSuM2JDWxksk8EpvSV6PIkR6DC36TsBppuRJU/63Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lISMbSMP0eJl/iIQdUQrFMADm2K18yVwTa5/WeRsPkMf3DzZ998oW5RbyeP0q7h5g7HnMsHjr7LSFiMowZXY/3NN/WfFNDV9shYz6AIU1Bh0Lr99NwEu/35PWB1319yJ3zTg6sEgsf5Nsi8jSt4j2GDgFgLu5+7l989qyTjbjTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dhI0/P1X; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IpDTi8b8; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dhI0/P1X";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IpDTi8b8"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VCMEBl018333;
	Fri, 31 Jan 2025 12:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=wSoGAw2/1dNsg82h7x
	T4zpy6SQju4CBVeBSDZoZHGDE=; b=dhI0/P1XuC0PI5G3XJ1gc5Z+MBkF7yVEB5
	ojcpT6y0VoADzAfPadarz8ytpItgfC5D/H1Px0w8k59436D6ksF85qaSuXWA98wO
	e46rUk+JUhgR68J68uYKrMgSA/gKuVtW84mI1GbsbkdZs0nDb9K6xg7OZFcsubSk
	tMl7e6RtV8I2bc60FMp0S3BueTXhxHq7wf7nfIXxdMx08Fk1p+Z0ma23pu72MYQt
	+8MIfBR6r8IbnFbkeW6KwM/abN50F8kS5GxDQRg9e/ZWSbvjRJfGtTXGHfUKjqE3
	JJ3cMhDsKQBaJ+3y1v6B/AYhcw5DWNtI9Zlv4nNzoeDxfsYfRGwQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gxf2r09n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:28:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VAcJKA016754;
	Fri, 31 Jan 2025 12:28:22 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44ggvk8bgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:28:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDNmS+EMJ3kj5Ga70uJKZ90544xuQQslxF4pyg3PryGrRswVdpswKcwviQdPbkfDcvEG+uANENF9Qvku/VL7iT8ojPOzd36iPAicCosVGEYkuMMrV8QpG3iBVs1JhxBVxBxIlSXyFfem92IiPxtSa2jefBWRyIqxem42VtZvTvNWJBpPAUXtg+jDB795azcjQJl9mUlDQjS4ce/6UeUxDo4B/C8LgrxCRFwQXcOxcb5A5oRKCMXTP5NfK8ymz5NisB4WGOZuAuG3T3S7cxFP2urNDlQgerTZjQuEoDD257p1cM5i+Fqi84tRQbDUzzJ3zSbGEFKBuH2RQ4yFwNXJuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSoGAw2/1dNsg82h7xT4zpy6SQju4CBVeBSDZoZHGDE=;
 b=WOxA5KHQvOhNjBgslwYSXNOS71UyA1SLpaHXyL1JnOymYroJbEcrfBfuqwwFtu5CtHvczOZ7xI9PRpHUqYKu5XbPulajt9idguKdPYoa2YjifYIdyoFJ9qKW87MB79BQtfa1/qsFIEXVqaPUwo4ypnWFi8VLyHhmcEElHNdw+vRLOu8Z9gAQN0T9NIsUOOzmKRPI5UYYNBubwsJJf3Kl513dj6dT8c7/ekFSEXIqq8pytt9nju5xA4HQbfQJIJ11wqZy2KkxJb3BnynS09LWAIFPiiocuYrt1c+2BHbHFB7WZ/541wMurV/i2WwbO8MqdHRt+T7Rjb98JrPuy0YKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSoGAw2/1dNsg82h7xT4zpy6SQju4CBVeBSDZoZHGDE=;
 b=IpDTi8b8RJdvrhtFBiXylCwQ8PdLU59vT7dSVtipIA9nGOgKRB3mwIyhk80cooQx3J2hUArckEsrCwbCn2dvvVvjUY0+3Or4Vqr2I30d4r9/Rk9jujtdXyMhrE1qxT1hs6VR7PIHZW73OROwmAZxCT+lrpJfCZMr6QL1LTcHtgc=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CH3PR10MB7741.namprd10.prod.outlook.com (2603:10b6:610:1bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 12:27:48 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 12:27:48 +0000
Date: Fri, 31 Jan 2025 12:27:45 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [akpm-mm:mm-unstable 106/111] include/linux/kern_levels.h:5:25:
 warning: unknown conversion type character 'b' in format
Message-ID: <eac8bc02-685e-4a9f-bee5-9d245b3f29b0@lucifer.local>
References: <202501311708.dRI35epU-lkp@intel.com>
 <4b879d9a-2d38-4788-9475-b81ae34eb886@lucifer.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b879d9a-2d38-4788-9475-b81ae34eb886@lucifer.local>
X-ClientProxiedBy: LO0P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::20) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CH3PR10MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: 12848bc5-93ac-4c33-12c9-08dd41f2ac50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BrJ+QdzUp361R4DftucqMvXAussP6mJ6+9W1LWXD4cN2iWHWFLOhrdS/gTuS?=
 =?us-ascii?Q?ggLn3Gv6Ie+dhtxwLsUelkXBOEI1Zm1u11MuVGIy+DH8sS/zrZ5H6at2/ZXj?=
 =?us-ascii?Q?wfQ7VjxPCC9LXn2UtCkxckWu09Uj/xgFIIDJ/BumWU4T/iBcBYku5PTt1/NF?=
 =?us-ascii?Q?AN56Ni6o8bBBNTJXze60emzN9iiC9xNhxBwAyTQn94GYzWLI2nR83ACeDHJl?=
 =?us-ascii?Q?gFaEqXZQqAh1HEWnCe8JOtLvKdbAkswP5FjSOo5rmgukMt5a9Mq9Q2qvHIah?=
 =?us-ascii?Q?HbH9tQ3Ht+LFTMkQWG3HJtUQ2bBUktpOIdF1VBryNhcpqsPY5v+IhKKodSZ0?=
 =?us-ascii?Q?gzt+Iz/Duy2MM5U2mPBCTVU9jtkieUaPocyDaphddv8wvPgZJhKnOcD8B+te?=
 =?us-ascii?Q?h2a/OKMiMFbfq6AJuuoO6+Xpmd6S2UrEX6xIxYRJ7r3mDDRQ5V+QCCATo++k?=
 =?us-ascii?Q?y4srkGQjQxY02pzazQ1o5nmn82P9j1ts2PNA8UFe98L4O0Oc3y+SA+2RqsAA?=
 =?us-ascii?Q?f4h5Z70fyK4ZPhFMKAGY1x3H/socZRXn7kSttSR02gaDlnTz2FAPVi9SBUnP?=
 =?us-ascii?Q?2CAcg/DVOjgdaYkMUT1fICoYZ7QUQE8Wfbmi45tX4MPEPzgkmNg3naTcdnqu?=
 =?us-ascii?Q?zesFB7+bNYliFZzkZ2h0WzCPGlw2Yz0YJrBQE/Nqf+jUff0iNGqv0FG9gsts?=
 =?us-ascii?Q?KqWBauQ+ONGBRvVB+EPW9SgRidVcNa8TzHsGMxmvcv+gYV7tnUuyn7H6yrIh?=
 =?us-ascii?Q?FSjuG250T36a3I/1L7/TfuKaCd1gYlInySWNGFesXe45bNXSK8lnesmWQQ3b?=
 =?us-ascii?Q?1BgfSnwA0mdMdRL9N6EARwNqMw6GSwJtvDrG1LTOXUVhnz0K+G/kvQKRD6nK?=
 =?us-ascii?Q?fLnWRhKuQ6a4BnFg6T/FwwMwMsecv9sFxGI/GO4sEPHeXe9eD7o3sdS2ZU1V?=
 =?us-ascii?Q?4UOP/So68zLjH3yoMpoc1OOCmoRnUBTx872SkGgnnMb1tC0vW9n8Zj7i2ymm?=
 =?us-ascii?Q?X0UrQNlLf+VhWntULdzgrKAX6yRddR3m8aV1nBujPjw3RavwHq0PjUCg2dRM?=
 =?us-ascii?Q?Lzd5t7Q74Lxq78NBQ1lrW/O4ARMGioq3FdxR4cxu7ryQf9E5nCglbrlHP6Q1?=
 =?us-ascii?Q?3hGjcJhirEGSw8GRmK3dReGtkHvtO2mz607g26C08cBlwyyU9nZ/DdGgdrfz?=
 =?us-ascii?Q?vuwwtCIjKhX+6xT1GSJLi5LwNHfMr1CYwqsY/7FgdtJSbdSdvQon2XoC5L9g?=
 =?us-ascii?Q?i9bmEyB1PQTDtm1TO3M9bLWnEbye/oPjj314lSt+WQjeEtv2XDxQFLpgyxN+?=
 =?us-ascii?Q?n6OdPigZx9KE6TtkHgC9B8HX+swywInB0v8h6+3vKy4dRg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jKmFJ645agYCSD2TG4DUOD6WAjUEzYq2+l2tytdB2C/jhgK3juct01sWuKfa?=
 =?us-ascii?Q?SrojKsLVmL5dS6mTZr4QODKrBTppwb+AvwNklPAgr+fAS+DYyiESptYQPNm2?=
 =?us-ascii?Q?s/lqAG+pWirppoAM8yxlaEVj/iZ/Hla4XfC0A7ajVGtn8+3j7f1cEe68dPoz?=
 =?us-ascii?Q?opLhUC4HZJ5/JEnDanh6ecXvg4oGCetgXr30VTmJ5fMIzdHu14LtRxYZRbXj?=
 =?us-ascii?Q?mSikTVMvDHh86OA2EeH6ErzDH+ooe24B+33CIo9tEd1HKCxXCCe/S1F7QgjY?=
 =?us-ascii?Q?8mE/C9BLojpq/tSuRCAvrNLIGBU1o2GyQ3sIRgayr2KXjteY5hIGJEr80dpa?=
 =?us-ascii?Q?BYr1FHXt8SRdVRRilA5Ixrv6dbMpy63y6mHX5KbOdGhUYJsHvqRbqIBjP/Cx?=
 =?us-ascii?Q?MlifG/pp6U4BhIyGEK18AtsmsWOnXN83oK358Mkpnrwq1vxTNOLxZmV8XvS6?=
 =?us-ascii?Q?peybthNaiFZTXyEg/0Zy1dNH6DlzXXyJgSqgfeN0hKkJcPQoufpn2gQy9Uyw?=
 =?us-ascii?Q?m3UPv5Zn9RpMvdzw7IdenvqmKVjkG6yJp8r9AQi+2ACVQ3SC0mLE3Wis5M/q?=
 =?us-ascii?Q?dAUrXLhkByo0wYqpmF5h56G44C9Dq0c0xmgnLNbV5z7XCvcDOkDf5JZq73GR?=
 =?us-ascii?Q?QLwMjCOMqHe0IsgxB7vR1uZ6VQTJqfduhXq6hJMjkG8t4ZIFwEYtULyVlLUW?=
 =?us-ascii?Q?iEronP2HrR7+TetKG+t9SwLVcpFoxO7iXDQNN1LCFphW+O/LPfi4lbzoRXrO?=
 =?us-ascii?Q?iUZPk2J+X0MroBMTmZc7XWKy2GKKyt+GXtyCM/HtZnJl3pntPUzfwyPFEN0O?=
 =?us-ascii?Q?cqO4x8ZrcT40GcjYYyzUKaBjYOcCThxmsv8u25ZnWLkzgYzCom89q4WUrCl3?=
 =?us-ascii?Q?3JROkf5dgID4uZYCr27fd4RlVUzO1kP1wWGGAbQw/410kEDkbM88wDxFf/t2?=
 =?us-ascii?Q?ma+5vTkDxaG5gXH5jbnBA1R64U2Qac++pDs4evq2pCDgXnfuJWW8rEL6sF/+?=
 =?us-ascii?Q?SxgDboFmk8Bxuv+U1r4IHJQr+wEK6HpyQFuNDFDuFKMkK71yJpEXeXdTD9Tj?=
 =?us-ascii?Q?4Mp7QxfFq+feNdVwU5Ixc6Ra5fydQwV4LZbI5iRNRTWeUZ1P1FlK+pR7sLJQ?=
 =?us-ascii?Q?dhWfN3Mw7fTQkvJLdOEPkvVxF7QZvV2ZoiEqMzbCZ1bWFVI7Q51GA7w9EBXW?=
 =?us-ascii?Q?pc/2LrByixEd++fHhn0pgggAqagB5cQxpzE+XBxFNws2a1RiSUeqmIROnfru?=
 =?us-ascii?Q?8PwpXX6NJ2I4E7Zi72Dxhn9BVO9AeLDYGkN2hVoRjdO4o/A5tS3PWRIMouvx?=
 =?us-ascii?Q?YWk9vPbxw4FGGLwO+7y6nLCHmIrWvWc2lnuBT/nNHl3w2YAYjPU9dEsf8k20?=
 =?us-ascii?Q?RHtWBfIThZFAPjT4nuekh/lXcFDAFbh/JEgWom4fylOoxoFWp2jbvi9yckHW?=
 =?us-ascii?Q?0+zdcOOmMP3UlxyAZv7Mo2mF84oVSh416TVsxMeh12HvcQRBiK6fizbyyGQW?=
 =?us-ascii?Q?MS+TO59WWGXesStkNIHdTajBj1eWN3Oc/SE/odkI576j22Jb2ySn8apPJt7f?=
 =?us-ascii?Q?pX3kmAV2fdKezyAW8eSw+dSvhGb5a0KzE2LCCFlOOFq/yvfYGRAbQWjIQ5Em?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zei40+a/CQPw4jWAkiumtsxgzoc+y2pYu7kGU2XUrgXin97sqLoxot7lTurCBINUT4mNQB2FGgq3VkGVDYzN/awu+Hug1wCJzjlfqEsRTl3hTDOIcQ125kQ3gwcSu/JLFqpi/NYJJTUtt/XPpZwc3imrhyRrAC9BEWvZf03+B7R6odyRbnKB2HghDSwO2smmLIC9s91BUfPdO7pTvRvBcrvjlIDRYT7wnXtjaMd9rCXo1S5Tw8s6B5GNqMaeRubG31Bebc6N5uWL0tHW8nbGZBFYLMa//a1cP4eWgqwxjCk4lvNRn16fsOZzLEsc/a/t7W5jGgAKfbkpzvwJ+Pw6Xk1MRpyisA0s74B1ZxuLUoVH/0HUYJ1j+WMstRQhf6Kay8RbF+hIOu50JVWcADtKN4vlrM2SEHT3kohHIMD27v87Eh5XP5AJtvkhmpeU2jtFaYrT5ayXlN0fYSvrk0d/NEO3nPazJU3uM45NGXOKKWPXoH7nCmtUU5Qmw3AmmMf76IwkHs9f4JLDerptKsdDvt37mscG9By0YQ3q1OQQkSBZ3gxZHPtI2rHNbOlcg78G0ZR/ahGAbSTVCy/u7wFIisRai+Mo5r+6V85XSQcfvHc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12848bc5-93ac-4c33-12c9-08dd41f2ac50
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 12:27:48.6784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1LWgKA7Bk77oRejfN5HiJaSirkGP/f4SoWswZwzaXnqyMW5pfBdBfUhOb+HqkoJv7kC85P1qpZWkmzCB7h4BszWj+1lkwg7Nl0Qf60+6Es=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7741
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310095
X-Proofpoint-GUID: uUGCwD0OqCyp_0T4MPv2g2PtVsuyoiFA
X-Proofpoint-ORIG-GUID: uUGCwD0OqCyp_0T4MPv2g2PtVsuyoiFA

On Fri, Jan 31, 2025 at 10:07:59AM +0000, Lorenzo Stoakes wrote:
> On Fri, Jan 31, 2025 at 05:43:28PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> > head:   f5604ad70091eabe663ea7106ced99449d653320
> > commit: 951452b2ec82d352a69f14cfffdeb7c08461eefb [106/111] mm: further refactor commit_merge()
> > config: x86_64-buildonly-randconfig-001-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311708.dRI35epU-lkp@intel.com/config)
> > compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311708.dRI35epU-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202501311708.dRI35epU-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    In file included from include/linux/kernel.h:31,
> >                     from mm/debug.c:9:
> >    mm/debug.c: In function 'dump_vmg':
> > >> include/linux/kern_levels.h:5:25: warning: unknown conversion type character 'b' in format [-Wformat=]
> >        5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
>
> Well that'll teach me for assuming a compiler with CONFIG_WERROR on will
> actually... report warnings as errors. Apparently not.
>
> Will send a follow up fix-patch...
>

Even a W=1 build doesn't pick this up, so I'm thinking this might be a
compiler version thing.

Am doing a respin as that'll be easier.
