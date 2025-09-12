Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547DB23C513
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Sep 2025 10:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671761; cv=fail; b=m12RFf2vvWhgL2EePUb4TOiuLBHxCtd20BGAcFj7R7ydkkHdRnoXx9FRdmoQUh/ANumrD3NleAyFTXLpZfFT80wxnowg02ujWJz0BGyhqIAK+BwMPE3Kkl0KDXzd4PktJ7yEm4s6WObb/vQnIzgVwP3rrMoUqQ22jZF51GTCSqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671761; c=relaxed/simple;
	bh=UNBxkCCQc5xXUQ+fdlH233AH1/tyOV6IRRalQ6ViyA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jipmtL6SHxnm1yv5/ybuCjE7wcrUPmg4eF1SutKx+IbZ4kHHKrKTqkUZq5jgGz8KDm79FsRwy7+DG5VivZf3CJMdTU0kMy80DCuPREOB7d9/9/tkYvc8CdKunzgICoB4/iGoWMbyjM/f7dN3840qhq8X4akkBTZvRm9IXdUhS9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ArMAoO+k; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NFhd6hlD; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ArMAoO+k";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NFhd6hlD"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C1twNJ022576;
	Fri, 12 Sep 2025 10:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=45uuJzs2+b13OLo6fK
	OU5ugkltElvRLQMJ5N2fCG2xY=; b=ArMAoO+kpnRRl40h95QNcRieGQ0uVArbSy
	z959nqZD4+zi06Lnbt5NN3n8FA5Y6XmDAzvXan9R/R73k6DKYXO5TYwTpThnPO/Z
	ye30C7BV7ifotBJeZoFkJ3V42D5UnfAQySNFGO9CTqCIEeRtf5UypwScYsuiUpXV
	RA/cRkWh/rdVLiL/vjZU6jHiWHfA+teuGoYd8AoRe8MttAMPheT39nFKTK8nNzl4
	0tjou+2O6Ub367iUEk+XqYOyFPxiL8ohaJOJ6wHwEgWGWg/X0ZOQ5GhTaIaGBEGf
	ZmIL1TvK8TaBhprBxBU7b0yQ+RYqUhMg9w+OP9AGy9zsaYwdmzeg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4921pefy8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 10:09:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58CA5Vjd038759;
	Fri, 12 Sep 2025 10:09:16 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012001.outbound.protection.outlook.com [40.93.195.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 490bddp9h1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 10:09:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hTIiF+UmqsPywBgtYBsz5JFLl4cPiUcQHer2kzV9P7AL8nza68YWfBjczYNKk4MnWmRXN9gP/OIOW/iMbaqqQCBqw2xctt3CMzMBql/bC9Mco6YPaPQJ5ZSwi8mmZ9Ne1bpJKrOBdKRsj1zi7GshQXxnJg9d3/w+/v0C0bRPy1vidoPHUNq8eDFOMhBHWIP/jZmNIu+4r3Vg7owvLcqGYelhAamLzqgMfV2wziPr19Hc+cic402bcPBO/caGe7kLOf1UQNvRfmlO+7nmNkJBRYiDmqVTHx33WQzvocsrWvelwkqh2FTYSLWkqvOks1rn7MXR/182lpNKIzdX5Lzosw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45uuJzs2+b13OLo6fKOU5ugkltElvRLQMJ5N2fCG2xY=;
 b=c0UBKzoRjvUKxYCOfd3kslx2+K+tXJz24YCqg3489flC7/MnWG17eeN5wK+HBER9HTLOTZqw7uuvl0JvPhLA+ec89CjZZlucNizqCrOD7nL6vtcDINVZsJIk8w/5zL2RXK4nVZwRJadDmLb2RLEjjd7L1cKZhXTlzMpKXswnPrvSj5ZnELHONpxURzwHs0LgCWYIfB6JRqeUJipfN/ZqR62GFtLv91PFBecwzDqkp6wwRK3svKFFeP8ZjV/gil6zqHTSops1xM161G7nmV32Iwx0CtmXT55y5qUSb2SYOdGQ3gVwnCymRMlY2OrvPAX0owBQJxFnZlrQq5wy100c8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45uuJzs2+b13OLo6fKOU5ugkltElvRLQMJ5N2fCG2xY=;
 b=NFhd6hlDjFtOCEiaH07LMYRJz1vn7aFNaZt+h/Ot6DvdHsVKCG0Wir39ui4WkK7zW6WQ6bpLw2uZve2rXJgVA9YR4dGlRCDx/eJynuhDaX7GPgPPQ4G2tCXi0ES+AiOnS+plkIX6zAkfS3QePSmWYdbBYlo+AEXLtw2wB4MiavA=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB4630.namprd10.prod.outlook.com (2603:10b6:510:33::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:09:13 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 10:09:13 +0000
Date: Fri, 12 Sep 2025 11:09:10 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 15/16] fs/proc: update vmcore to use .proc_mmap_prepare
Message-ID: <9b5607c0-a72d-4cd5-86ee-8544e20d00bf@lucifer.local>
References: <163fba3d7ec775ec3eb9a13bd641d3255e8ec96c.1757534913.git.lorenzo.stoakes@oracle.com>
 <202509120057.bt4ckSKn-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202509120057.bt4ckSKn-lkp@intel.com>
X-ClientProxiedBy: LO4P265CA0225.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB4630:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9346d3-607c-4dad-9894-08ddf1e46c6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?egjnv3JXrIQc8OsCoa9W+q2i970ywXNWNA1tCLXmrhmxWYtVUHqaPIpNg1SE?=
 =?us-ascii?Q?ccjVyGC+jdePk7NPzrDnBhQ21aW2VuegK5nnavR2eIqzfPmuZ+6v7eIPiOY+?=
 =?us-ascii?Q?0YbXsxsDPIhVunOux0M9HrQ3YFgeMMUtybE9wmWXsDKtfPXJ9IVHiqvJLYsq?=
 =?us-ascii?Q?l15XJ/s1ofodoABCwEWWDmXHK3O/wkGfuQFIq1eEa4IzMWJtHGtJfsu1xqcT?=
 =?us-ascii?Q?fCj0z1u98JpO9RmvPKGCVEq9aNYLoso4rY2HeyEFrikpXg+5ZQLOdSeJD2lb?=
 =?us-ascii?Q?JcytR2R42noN/g0GTMp8+0ms+W684/l6Uo5EJEA4V/3hUc0tOkwBqNV81bYT?=
 =?us-ascii?Q?gBtRArzCbrduoE0RK0yVGilXqD59iAIA0WLuLwcDFPaCgsogipbFJGuG3X2O?=
 =?us-ascii?Q?1POz6h/I9oS0NK5muYaRFeoHvOaNBAc39KM/9P43UUw+TSECcxSRadqA3hsq?=
 =?us-ascii?Q?5FD9bLyARqM7B+g9Qt9RoYfNgKWUn8IaDS2z6Jt7VXWajoCImOJFyxq0Mm1b?=
 =?us-ascii?Q?9VNKOmf/OQmuCaCTRdX9cpVcxt8qKo9RKGvI8QsTwN62e+gpMHFlL/Kmxt7Z?=
 =?us-ascii?Q?mtt+B2T2EX8+lc0TbCWhmZdQbIGmmPMHZmtVHLWDobaZ5Rl7NaAo5T+EL6d8?=
 =?us-ascii?Q?zyeKx38SDmwMJNNAg9PhFTdey72BJdr/FUrvA/d6lmvhfqakxCQcQyXoCtoG?=
 =?us-ascii?Q?8/RP0527RIiHdhfYAjpAXxAg+9QEPbkahwV8Ock0A6HhpejzHQC69tuFg+tG?=
 =?us-ascii?Q?A6K22ztVGhahC+k4jrxVkhS4Chf92yybq4Sg1d42xdX9hUgOV/mnrSRYM/lZ?=
 =?us-ascii?Q?3jSYqDGfGCI8WkLCZ0nWYc3Qgk70xQdmM8WODRmbG+iamSiub3YIB96BrUSm?=
 =?us-ascii?Q?gjE49qPdl7pimT+elvoMQjd7hA9FL/autMtczE6k8S1Ts7tqrLXCd6V3W0yb?=
 =?us-ascii?Q?q1zgQ9YxRvBks6xrDp447ZD1YAEbmqrDWBstSqGTzeo3R36gJrv3E60wMhye?=
 =?us-ascii?Q?Z0wDc0IwLyP/J7hM7mmZFYxlBZazFNsAXd5YwpR+uO103J5N5zpsw8TzHNwY?=
 =?us-ascii?Q?nUjHAYOm0zMPiQEodlQQycyoVyDVZR1jIr8NS5Hfi9GicKbtgM3hdXce+Wh9?=
 =?us-ascii?Q?Jv+UtBcPMLUztqbeJWk12/4xkgisEWx0wYYX3//Z72kA91t5uirtGjvptFg3?=
 =?us-ascii?Q?imawd3Ya470maVn2spFVsFG/g4a8bKzznhnb9trrmQkYF/X4O/NI3v6J8OeA?=
 =?us-ascii?Q?5aOeYzxUhRthg4yR9rnrh9L69jM6cghGqCfvbQ4IHz4M7AVBp84mNX3bpdHV?=
 =?us-ascii?Q?MtLBqdCytlAByQk7raKRBDTR9xw0+WIHTpqNFbbQtkFfFUVJJM07Xpu1iDEm?=
 =?us-ascii?Q?/RQb5+jHWlPV2PxyejA+LDPEWK5y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GxNErg1Nwwdgv3yxySkpIRismcCX6NpH5qRIERTWXdf9rZLaWNCRBi2erL3i?=
 =?us-ascii?Q?NOROIwssLhB5c76jm2FDDdbCD7Wb7AbbHC2tJL2d0kEnogzgVGxMbce8dpvA?=
 =?us-ascii?Q?e8dHapIwIULh8QDYl/f51+OjKGFRQ++/YFB8JfAIl2GknmvKRcuf8vB/gejg?=
 =?us-ascii?Q?drg0OTM3nhelh3PJlnrb0prdH4iVpwd/zCkGpMxJidJxl5WIQYXiTmFqjf78?=
 =?us-ascii?Q?EJeBz3X26HKsNVG0BiK2J80O8UTMRjn4odIN76zPoP3BVUrEPU6Caz5NXwXB?=
 =?us-ascii?Q?edCKgmG3tZb+ljrFyVCwhEkSvb4Eir+RWWvBBzFFCYRmuS1RvYG1eLsDFCIO?=
 =?us-ascii?Q?Ek0PhVYIT9WaijBjkTqnmNTEXGhWMu1HR79TcNmoC5wUhzR8fyjnPCSZmVu8?=
 =?us-ascii?Q?kZIlwWleDmbpqqOjE4BGd9u6fEtbRW6fhRcd1DRnwlM/fIVEg7z1OmanKeRr?=
 =?us-ascii?Q?DzuICmwEypQR6TKvFM1RJddYRLxNvFAScnwfdWJxz+7MWEy6chSQkC3NiRpu?=
 =?us-ascii?Q?yxANiVHHfKhAHFMrXgzPESEBPQrM/c4qZ0D0DDd6x/T/NMhUYwnYSckM+Ev0?=
 =?us-ascii?Q?zWKq02s4MN81MOFSyGsYB/D3UbtbjZN011gdvnkRux53QJafLcB8jMgE13dW?=
 =?us-ascii?Q?2bQvUw/Kc2oBtAvQn+ba7wR8pTNyShmClzIPm0FR2Bq5DsQsT0wlkmO0CWxa?=
 =?us-ascii?Q?hyOOf2u89ixvN0KSCeK5ANEN9ronjlkgsyAfjgtleCj0hp+KUngay54KZvK8?=
 =?us-ascii?Q?MKqMHeubKMy+GEfHJoGaKs76J2Cuwk2ywQAPglmYJlHBTcqmC5UAVVIIxvjl?=
 =?us-ascii?Q?Ra8iaHNoHhkI+i4IZxbVjFJC21QTngKWgLrPn618czdfPDw7auBjlsDX5ZLJ?=
 =?us-ascii?Q?Y8hyBA3pmKVSCap8koO9TjSDqRdLzZ/hyTjR1DiBYtwxRUk02lI3o0nWa/d5?=
 =?us-ascii?Q?X71ZKluST7mqEHkFEAtoc0OyxuyEc+y3/NuRBq4oGhldgIPYrH/UJEQc7G5k?=
 =?us-ascii?Q?k/hG1ZD1tiNteZEvapuKSvtyFUzZSipp981uSYoBflkauMl2vsxOMprukb8e?=
 =?us-ascii?Q?RKpFpIPX7azLllca01yNpHJluwozTDupD8tRzaf8HBLxDgrajKZg2W16k4dm?=
 =?us-ascii?Q?5109yOIx8jPpy2uxeA9LMRHgDLhVtNgj6qQQ7Wd58MlNcJlypoUzPC19qHnD?=
 =?us-ascii?Q?AJYdBtt5u3zeg5P3qHhfxuVZT3ApDGFDanIPTwbGsciLWBaILr05l/WoiZXD?=
 =?us-ascii?Q?RxDSiIyRoA28TE0s/0Aymr7k/pu/uyfJ4upyimh7ddczVHQXIVycpbPLyA4u?=
 =?us-ascii?Q?D+PfpTHYGChg9B/Kmimy03VoRyz6ro8I0YqT6SVtnS+wUC0QHJlxxFXQNpYr?=
 =?us-ascii?Q?9naRK36RN55otIR3Apx4NJt5//wrpmEx9CQk/whr9yJDjiRqqIhd9E0e3Qxm?=
 =?us-ascii?Q?H5itvJTIiUXVURqB+RbaV62JrxVLVOGpAOI79+97JDPwVciD4YU79oDaddZ6?=
 =?us-ascii?Q?9zfeb6AZ+IwyeZyqSR58jyqgpg7jPDbsZHSYNDhp1DJj0nEeVHWW+Jlnuy+0?=
 =?us-ascii?Q?b9GH1/uVPK5gASF5h8U+G9swC9hhPkhaku5kaIEqKU7VUn5Y28KrTA+hOvMk?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	g08GWz/71mVAsnCX/9g2rOQRnSMrn6Ce9u7WEotBfpXV3cIV5TNaTz9cQYfym5gcOy27uv/BIzLRxoo/y7+tyrvqsvesAULEU34Dv4XreQ/HanDmaaqqGsOHvoDP2QCD28MZhUulVs4oQeyH7wx/vqoXnSdzLJGig8MmTqz6jVCJvZ2jrrfK5TcoAPmsOSVsYdVKHxzeUVdsN99Di8y+UlQ2P2k7g8Kdraf2ItTQ/Lx7xFonMHP8XgYp9lZ5OM/Es5suZ563jmSjA3mPRt4s1tkpdv+1cz1H4b/5qU4251wiCl/sQl67MKopYkRkqJEc4HylJR6BZvdjEkaMMEDyaHGmqALnGKwWHDqbiecT+oFtULEX/G43Zk+ne+q5UQn/Whiqq28w886NyUl1hOg8K8TuyhF9qjCejNvxmYZb0nViOKkOBi49gcIUTtXjTtTg6CubyNggEiKmfTB8ScQn2HbSvFhLyxdNGX/MOlukkssIm1seUh4WLNtv6Wc4/T8HLWYil8kEv4JOqVkQBmCVzmJv08j3ChMtDPm8Nrhr8fJ0dULVCvkiUQr4R+tuOrxgTFloh7LI1068aDb8JQHZQdSOHPKaMNHMGSUznUOhn48=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9346d3-607c-4dad-9894-08ddf1e46c6a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:09:13.0850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huvY48rv1LXfba0TY6/uaYHijhLD7+QI7HiYzdf2rV6QF/GGrCKsmNqyYNTD8h5xbRbna+tL7UNZCZOVXyWXUo4mKhbf0fDqZVSBYW/qLdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4630
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509120096
X-Proofpoint-GUID: WjxUVxeWrkvYUGgGzzdtXiLkNwLdpyR_
X-Proofpoint-ORIG-GUID: WjxUVxeWrkvYUGgGzzdtXiLkNwLdpyR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE1MiBTYWx0ZWRfXzJziu1Ynb639
 XuAqidIgBKUIKIjNQ5d4fGlhWfHL4xtcP/yfKE4PLovDGMVDigMfj3MZIaTHIw6dQh3wk+Ukaf6
 ZALr9i8vei6zki6dI0TK7i4327bPyOqzpFF/7vnhhfsEC9vVmeTeL655tL8n+gM1y8+vRqz2MGe
 INX/QaZ+xiGaSqweMZb4sBk6hdrIatKseVU9iRBMobI34cschsB783btdYZ2KBhcuh5H3NG3p0R
 t4AbZl2U7l7/JCBRzWjUvbZFiRNH7aVkVqlA79AYyAAGMjDeddFvpL6suDw+GtsvFq5m1ZrAff+
 vetB0LBKzQZ646/9E0ld5aoAaYrWhWfquSJuk3wE/fIi5zMQS0Tk9Xd28TMhdfc0lVhCfUe3Zn1
 lTinWK+X9HcsEuwtnJ/p8k75qqqBRg==
X-Authority-Analysis: v=2.4 cv=b9Oy4sGx c=1 sm=1 tr=0 ts=68c3f14e b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=nDL3c5tFIhAwL6KbflkA:9 a=CjuIK1q_8ugA:10 a=mmqRlSCDY2ywfjPLJ4af:22 cc=ntf
 awl=host:12083

On Fri, Sep 12, 2025 at 12:42:15AM +0800, kernel test robot wrote:
> Hi Lorenzo,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on akpm-mm/mm-everything]
> [cannot apply to brauner-vfs/vfs.all char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus s390/features lwn/docs-next linus/master v6.17-rc5 next-20250911]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-shmem-update-shmem-to-use-mmap_prepare/20250911-042432
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/163fba3d7ec775ec3eb9a13bd641d3255e8ec96c.1757534913.git.lorenzo.stoakes%40oracle.com
> patch subject: [PATCH v2 15/16] fs/proc: update vmcore to use .proc_mmap_prepare
> config: x86_64-buildonly-randconfig-001-20250911 (https://download.01.org/0day-ci/archive/20250912/202509120057.bt4ckSKn-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250912/202509120057.bt4ckSKn-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509120057.bt4ckSKn-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    fs/proc/vmcore.c: In function 'mmap_prepare_action_vmcore':
> >> fs/proc/vmcore.c:595:20: warning: variable 'end' set but not used [-Wunused-but-set-variable]
>      595 |         u64 start, end, len, tsz;
>          |                    ^~~

Ack, will send fix patch.
