Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0005328F3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 09:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739007488; cv=fail; b=reAR8fXS5iASJ0vKLgqjzbOtPhJJqcgLmj/KfC8yOSb+6op7m8M4X6uE2AThqNkprmpRDAuElBN44yG5aiU4+CP4o052HHAc2I5drzuTlO+GtvUzU0xECaAShhq8HeXP2UTNKVxNYQeEIZ0jQQmQTPH1Utt5YKGhCAQ5YLxF95o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739007488; c=relaxed/simple;
	bh=YRPQS0jewTHuNk/eFzGDt6k9FNYMeslDMFuu3iPsuAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r8JCweORwPA8faiX5ef6sXBCuZ3By+Mfj05QdsdoVKcC8YhjbVtM9fyWp5vZ9hmKo45x7DiE8gs50M4N9fvYAQGgckzi/yMFgt78tUyV2Cn0YAu8StKtoDn2pnbVS4b0GTRW4jQnDWctgsgle95EikCPgPqE+78/LtmGZH//014=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=T4nGtOKM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CWJNhRSG; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="T4nGtOKM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CWJNhRSG"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5185qw0a031194;
	Sat, 8 Feb 2025 09:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=s++MNAL3il3zKXfFva
	syleS2cgkUz+5UyFNIn3027yg=; b=T4nGtOKMpZOR0tqOJmnpxC4qq0iQdqZ9f6
	pF1KHsgGDVdl1x11dUE4/1CJ//9SLDwUDjWYnz0Hmzg834tkFeFseguSNGXr9Kh3
	S/DDaWlUQla0Iu5WKkVUf3WMVtFI4ZP/MP/C3L4N0VOmd5ogVGzRW3DicTGrVxU0
	VY3B3i8Luqn9OC3PXPr0aZKtTwtP4vxSPxlBz4RvXpOGl6anUX5fDW3PsXFmzbki
	H9cxroLA7hq0hlu1jBm2aOJOUmWyOc8dNHNP3J030wYlg0JttS8gIkxtRnAs9XnQ
	YVvrLtoj8ks9Ms5JQ6H6enZ20HQUa6Fo8dzuYnKBPANkv7NHrXjg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0s3r5u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 08 Feb 2025 09:38:00 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 518611Bc040889;
	Sat, 8 Feb 2025 09:37:59 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2044.outbound.protection.outlook.com [104.47.55.44])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44nwqc814h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 08 Feb 2025 09:37:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zd9WhuHk3arP5gtsAAnSdAxvNEGVikiHYNQvR8tpDnWzC9POrmZE12WALg+3oSB/GtBA2AGgpP8tol4WpGlX9O5ZBS/63LBGoziyN7sM0ZxIYaibX7xZpY80VCT36EnoqRXyVSW3Tv0TP5iishJvNMxC0hk54cfYrJA9S9DtzT+fRHQDrZvU7jcPLJ6M9nC5uopf1MS1CwQEDNdXXCFIx1p5pT5V9PFzHTkSjijUdEJOyi7dWS7ZXqd3EUE7DmhgR2eR5xn+r7ABhjMJ5XDnXFSICNDVutfU1T9Tp6l0JnpVOTIOsKPhCGXjzH+EVa+d8JmGWqs8izNL1u7u2q9iLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s++MNAL3il3zKXfFvasyleS2cgkUz+5UyFNIn3027yg=;
 b=EvQ4pYIxMEnT3IUmwRzT8vyh+esK/u8MolTZnG7lfwny0vLbicDEDSAGfvNUrNPJlVIZ4o+pJUjvlzsjbQohJEdTos4GXhCp97kY3TOxOLKViR+uZCwcJ7Lkj7qV8tJB+69AsdExAE5YrfsqFoeQOEygZhlVXq7UaXn/hui2WjdD0kMOGov3wp6wvmmARoC4LHEKCf5CKoXGGSsD8Rig+TVgFTucKyvpysB8LxsuvfrDkbh7R5M7ZrdTdASw/Dg3vOGbBPLLuJvX3D/WJxpSmySqckDm/Zx7H/kxCWzdMIP6neLwII9WZjr1uyw+xgFL1j1BmdOVOKZDGFEavKxKCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s++MNAL3il3zKXfFvasyleS2cgkUz+5UyFNIn3027yg=;
 b=CWJNhRSGU4xNlMFh+b2ELF6kSuzTIug6fyZakWu8sTdQxSd+k2JNQhueqJWNKu3tgZs7owX9vfp2jf+lYtEFfwqJBOb1NnynSW5cTED7Dx6z+0dSlSriJvAMdUSQERF9+uO9vVHfCEbq9+/p0VJIfr0eCSKeolj7/+VYCg41Htc=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by IA0PR10MB7642.namprd10.prod.outlook.com (2603:10b6:208:481::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Sat, 8 Feb
 2025 09:37:56 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Sat, 8 Feb 2025
 09:37:56 +0000
Date: Sat, 8 Feb 2025 09:37:50 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 146/165]
 drivers/video/fbdev/core/fb_defio.c:272:17: error: implicit declaration of
 function 'mapping_wrprotect_range'
Message-ID: <e4605df9-3b32-4d9b-af71-87698087b2af@lucifer.local>
References: <202502081235.v7ook2My-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502081235.v7ook2My-lkp@intel.com>
X-ClientProxiedBy: LO4P123CA0329.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::10) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|IA0PR10MB7642:EE_
X-MS-Office365-Filtering-Correlation-Id: 1828444c-6574-439b-17d4-08dd48244450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j33srVXE/tQPqUsR2/vPHpS1RPg2onKRSPEbNI01lZUSsG4GkP4a8hXEs7Ty?=
 =?us-ascii?Q?jLBA1o12huy1rv05DoiVkbHhVNaOPR4BMLG3tJShx5EkU3dZ+149VeMI2B0M?=
 =?us-ascii?Q?f75NwE0CSxgDIe4GGvnYcepD4fccfK81G22Jn9l5rKwWCJGxsmgnl2XNP4ID?=
 =?us-ascii?Q?S9Jf37aOUwB98LyMm0TJFj0e+PuwNX+ve3nMsp6iGpCMH4NWHyV6Zr0zelQt?=
 =?us-ascii?Q?xHapd8dNqpJ75qmf6aPlwCRFQBIRWE9XcJ41jjK8Sh8gMGMUh1FDTZfDqOUs?=
 =?us-ascii?Q?VQs2HRzo6t/qGwEqrzDq1E8bIw8j3msQG/NlrhrG9maN77hzbRkjk7R5EYb3?=
 =?us-ascii?Q?acAj+VDEWn4jnWI0x0q2jsNLLrsWdUcxv4eTvKtDThZJrMUoww2kEfWBoFTj?=
 =?us-ascii?Q?MAjfG8lAjDR6cqA3p5lP+W68ckA39yKMeO/rC1P02Ec6ybdUTGBEFMQfhFx+?=
 =?us-ascii?Q?saBniQEU1q25bpJZnW9kwXRlDHhTCksEj5iIiz/buclKH0BhwrKUKEeDfM4B?=
 =?us-ascii?Q?CYva42bCqW6Nkqzcn/06HIpXbiTVjnRv05BaipmRaLaZbDto/sJs88RxnxvT?=
 =?us-ascii?Q?+fKn/vxXKX8Fo8xORgHwqlApd5LgSeLEB1pql3jjPtTEYsbGSLZWaCAY2+jv?=
 =?us-ascii?Q?3/h7sJnDTCKU4WeSoD9JBypRcVhgleCbYXvSb8E+6X6GV4SjOkMwZp1oydIR?=
 =?us-ascii?Q?kmOJz1/Pjdhs6duBt6AEKnvgmLnZNfvyNt/1fYExl0XR7VpVqfV+L6aIiGBB?=
 =?us-ascii?Q?6WY4CPoYDmqPncgidfSS7r84WUh6ViAD6yvAfsjkh89DpwaeXrSd6UHEfL+M?=
 =?us-ascii?Q?rHhgB5zsh7LGmel6lKphJh3Qs7W0QQj8Z0EI7A3QhDwZ1PFGq6sSIMX73JKu?=
 =?us-ascii?Q?cskS32RRpo6yxxB2XbwsQHs+pBP+g6G6sTdyYKsIYwG2+lQ8jCk0T0dUpvlz?=
 =?us-ascii?Q?ZuY3K0S3ik58ph1Ddq0+OLwwoxcELb+AzQ7hXXgsly1gwNPPjFAqMbGmFdv5?=
 =?us-ascii?Q?L3e8DZdEt3cN5ZbwTmvDCbar+txi6GfpqDbNF780ntYS4Odv4DI9wbXuEVdt?=
 =?us-ascii?Q?aQLijihJ/PYYusXzU48mlr9zvfeZ/c6sTmiRKV0mlo2Bps+RKGSAyq+/vcGY?=
 =?us-ascii?Q?RFByBrx5fK+CkxGIEM5TJAA2ok3jhbGhTJ+dAIs7IY3FHSCbFV/OdgPqCzgz?=
 =?us-ascii?Q?63yT+g19D9iW0xeoJdfBYrDsfNnnHN8bqsL0Qw5llu5JDSnW/AQxeTBaaeYs?=
 =?us-ascii?Q?BUQhrKoUtHLhRpvYWKVrfo0NVOnKSSAU/BwYf0hI6LkU8GptvMFfJ5XjJnzW?=
 =?us-ascii?Q?sa2WrZu/K7xcAT3Fr6v5kwh6wbwCSywR0mjVt/x1j15bKA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tIvKp22wYqnZSh5AztbccUizNhcQi3SBZJQEfzdlLoukRe6cKQ/7JUaAa3bp?=
 =?us-ascii?Q?RLgtSqVW2UjRe18Rq6WaLV7xUW6dHenhzNecLvOTQ6uI90YPby3q0zNIARTT?=
 =?us-ascii?Q?+rpJ5Zq+5A4fQzEWLV+3MpHE6evFAAFKbD8pyv/Qe22u/a72q8ENSN2bAfq/?=
 =?us-ascii?Q?ywEX7g8FlCpZdoP7I5612Vmhd+XR0O12A/qQtOi1rZqBpc5eNR+vBqczQ9SD?=
 =?us-ascii?Q?8gTh2JYmpejo+yj4uJ48nu0+RgjxEagLxMHmu31uamhVkWdHzE4a+wFpzdEp?=
 =?us-ascii?Q?DsmoRYz0ysM4WsLyrzvVlYkJzvKJgHM1azCkCslBeWe0tJzfeNFgGsrn6M3T?=
 =?us-ascii?Q?xa73ckRL4emBIEHiDRofebhVd9V0lvQGcw2CNKw9+XciWzG1rixTGsHpsCPw?=
 =?us-ascii?Q?Z9EoprQVNHyMMuWW6M5/JF0saBQiQgr8t3rF8R3dfweMpny7pn5DNei3oWBa?=
 =?us-ascii?Q?DEqfy8sfJCW2YsxRFFuRpVOCnvNL1vWV6DNa6GOrAF1r83DpoZMrn2wvL0u3?=
 =?us-ascii?Q?JRMMV5CTlXjLrYIlpMIgIi9U1mGvZYK7TH4z1vnPq9mdbloC+dCSCB4b3eAL?=
 =?us-ascii?Q?w6Gl7cd+yJmxoq6ZQRAlIhr0LjM1DbocBocUxX36evYcIDARC8wqfqTQNd92?=
 =?us-ascii?Q?PQJ0CtIcigHC9UhaGiAHU+F7C/4LK2InBNAyDhJJoa/Jq9VeBZLI22k3I5u/?=
 =?us-ascii?Q?4qqRpEeSy/DSud8f0NdeIMF4mGp/TG8YQeCuRidzDHU6dv9pwYlLQw/unCgk?=
 =?us-ascii?Q?6hqSF/9/OOHlNqvQZIt1Lvf2qbJqrwdz3DBxeUBFgCK1qHToM+ogEt6yQcH4?=
 =?us-ascii?Q?8KApTbPwbL8uLFojee/pO4vg06j9OZ/znKhmJFdMijNc7iKewVRl9v55b6st?=
 =?us-ascii?Q?IcOqkN8GvBYvnezU02R4YNNn5k+jUpiXkXYKHlowgQgeeOhGLHn8JTJTffPo?=
 =?us-ascii?Q?kknt1LOUKeF8Fhe8VQsG+Efp6HecZZRJKwr4jgM1AZiny+SYnO9vdbzOGwz/?=
 =?us-ascii?Q?gIGiVDVFjnx/Vm93egR2PF7fYRMFnRVVoalZlHKgsEknoV10o4BGaKnv7BWw?=
 =?us-ascii?Q?TBTlFXpEKeQtltzJhzBsd/UBzE54FqILz0Ul9Pn5pg3ZPdv9ZehcjhYhp976?=
 =?us-ascii?Q?Vj9Q0XleKN0llfB/MqhjseBKirrFFKW0Q+B9Zly8gJB7vFP1g1CvqmSQJIUi?=
 =?us-ascii?Q?RsYYIz6kNaAPAgat6uTkVJ1i30qTLLbGV0xhiHTD6zVWePNZU++Knyx/WHzl?=
 =?us-ascii?Q?I3nj8zfsnfHMuoNuLqR4glp7Ka0nmIvyEcVDqXSGAhWullFhBIYAPZbGrRc4?=
 =?us-ascii?Q?GcVZhekefDCImiRLnp2/b9Ug/0QYbI9h6wuiOE8cfv32eMFq90rLzNLteBhN?=
 =?us-ascii?Q?Yqjdew0kXv2LTE4l6nm9sYj78ERA3MDDmmmuUzx14HUScl9I3FvJrF09AcQn?=
 =?us-ascii?Q?7rPqX+mdpm46qrxm6B4XV1Er6qa6puQ5+jUn1xKwaKBjP3FU3lKHzzaVLSBm?=
 =?us-ascii?Q?WkjqP3DmyyWA/QL4G9aar/Gw+yUnIr0pV0Mq3CfqXNPqsL/2PALkgiW8jCcT?=
 =?us-ascii?Q?RVyR3R2vYv0Gj8MoYjAamd/vjnW4eYcAKRroW9sVOvolMaUqKX86BioXVfE3?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J87UYOmCo6jXwQN4KmVFS1n8u07KuLF8aKnajUuXgFkPS9BlzX8tTucwiWnpYmw2ljTXpGhUdHacJbPUznq5LfsLkaFcWe13NVBB5TlRP+dVIPqjlPkw/lg4eWwqqQFt4ZJt9Ka1JuQsbypApZQLszEiYpQcAzK+fZkN4aJ6DSBXwZN7QT2SDB9I+Uh2dNOIX03tzSqqt9FzlZ5ULxDxRhtmEwB1pxPAfSpc4wTTl/qTUsBqd/GA0jeREM4TDpPbh+BIKzJ8N2EZafx/93hM2ZmIUE69bRZ4Wvdg8k8iGw0ycHf9TWTJOyuWWBtHVOluqWkUOWEbmUIFxh57TsYdloNAOwqlh7kDtB/jVKioue5DPC+EQXhOzhIzQf9c2KL8aPh6iOQl2FhMiwBhFbmKoYMAUuBCLUNHS1zLE0T0boMmFOe6AkOnr9bH3fqrxgK+vGQRjBuUEbdHv0Q+F+VTBfHpRxTj++Nz3M8ni6MNpag/XBHNtB1bJjGLiKwuRgXkoF1p7ljgiul27pi+jFwZT//KNjPNSUX2q0gka5n0ev2vKm3KPRJAA5EpgfuMsXRf3LviZ090p80Sn2/t2TJCfeUGxuu0EDmtfKLdGARRL2w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1828444c-6574-439b-17d4-08dd48244450
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 09:37:56.0099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9c11RB8v8+GSb2Yp/tRYNXKvcNr9SK+GTJt+lyDR4r8yuNHvbmMO6gdxrYtsIELmbUjkHNurfG0xH1bAQP47dBoh2fcF3Uo9RcPbke4GFSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7642
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_04,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502080077
X-Proofpoint-GUID: jVQpTLX2dXDZgTDVXfkQK899adDW3EJG
X-Proofpoint-ORIG-GUID: jVQpTLX2dXDZgTDVXfkQK899adDW3EJG

On Sat, Feb 08, 2025 at 01:05:41PM +0800, kernel test robot wrote:
> Hi Lorenzo,

Thanks for the report!

>
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   8bf30f9d23eb5040d37e6e712789cee8e71e1577
> commit: 85d65aec481df149bc5280cf1ad5f9b76f59f153 [146/165] fb_defio: do not use deprecated page->mapping, index fields
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250208/202502081235.v7ook2My-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081235.v7ook2My-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502081235.v7ook2My-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/video/fbdev/core/fb_defio.c: In function 'fb_deferred_io_fault':
>    drivers/video/fbdev/core/fb_defio.c:136:48: error: macro "fb_err" requires 3 arguments, but only 1 given
>      136 |                 fb_err("no mapping available\n");
>          |                                                ^
>    In file included from drivers/video/fbdev/core/fb_defio.c:19:
>    include/linux/fb.h:887:9: note: macro "fb_err" defined here
>      887 | #define fb_err(fb_info, fmt, ...)                                       \
>          |         ^~~~~~
>    drivers/video/fbdev/core/fb_defio.c:136:17: error: 'fb_err' undeclared (first use in this function); did you mean 'xa_err'?
>      136 |                 fb_err("no mapping available\n");

My bad, I will fix this up.

>          |                 ^~~~~~
>          |                 xa_err
>    drivers/video/fbdev/core/fb_defio.c:136:17: note: each undeclared identifier is reported only once for each function it appears in
>    drivers/video/fbdev/core/fb_defio.c: In function 'fb_deferred_io_work':
> >> drivers/video/fbdev/core/fb_defio.c:272:17: error: implicit declaration of function 'mapping_wrprotect_range' [-Wimplicit-function-declaration]
>      272 |                 mapping_wrprotect_range(fbdefio->mapping, pgoff,
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for FB_DEFERRED_IO
>    Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=m] && MMU [=n]
>    Selected by [m]:
>    - FB_SH_MOBILE_LCDC [=m] && FB [=m] && HAVE_CLK [=y] && HAS_IOMEM [=y] && (SUPERH [=y] || COMPILE_TEST [=y]) && FB_DEVICE [=y] && BACKLIGHT_CLASS_DEVICE [=m]
>    - FB_SYSMEM_HELPERS_DEFERRED [=y] && HAS_IOMEM [=y] && FB_CORE [=m]

OK I think on reflection I probably have to propagate this requirement to
all instances of "select FB_DEFERRED_IO" configs, I had assumed that
Kconfig would figure this out but I guess not :)

>
>
> vim +/mapping_wrprotect_range +272 drivers/video/fbdev/core/fb_defio.c
>
>    258
>    259	/* workqueue callback */
>    260	static void fb_deferred_io_work(struct work_struct *work)
>    261	{
>    262		struct fb_info *info = container_of(work, struct fb_info, deferred_work.work);
>    263		struct fb_deferred_io_pageref *pageref, *next;
>    264		struct fb_deferred_io *fbdefio = info->fbdefio;
>    265
>    266		/* here we wrprotect the page's mappings, then do all deferred IO. */
>    267		mutex_lock(&fbdefio->lock);
>    268		list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
>    269			struct page *page = pageref->page;
>    270			pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;
>    271
>  > 272			mapping_wrprotect_range(fbdefio->mapping, pgoff,
>    273						page_to_pfn(page), 1);
>    274		}
>    275
>    276		/* driver's callback with pagereflist */
>    277		fbdefio->deferred_io(info, &fbdefio->pagereflist);
>    278
>    279		/* clear the list */
>    280		list_for_each_entry_safe(pageref, next, &fbdefio->pagereflist, list)
>    281			fb_deferred_io_pageref_put(pageref, info);
>    282
>    283		mutex_unlock(&fbdefio->lock);
>    284	}
>    285
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

I will probably do a respin of the series to make all this easier.
