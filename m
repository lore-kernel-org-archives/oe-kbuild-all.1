Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FBB2563
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 06:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739081727; cv=fail; b=D7L5/QhVwK0gGEsfsUrSHwIff2Vw8iH+z1DK0WpB2jLA3IcbBnSXWbzwwqnx9ky1L/GqU7nKjhSUIhk28Hgx2ciojg+Us28SOWHDCEmqR3EfULitA7tDxLNbZnkTjRfAZI5GE/+ddNrFt7s6SBf7rAMRkXQx/ImDes4RG8YAW2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739081727; c=relaxed/simple;
	bh=ywqZDekHRf6Ncal+JXHI6I3J90i1ubZc8lDtfszfbzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uv+IWBk0xavyRJd1VB8b5mqG2U2zOlFkmzgk079Dpwr9o03Bl/959PD8EK9R2bLBvBzUhmO0ILKjT0dosolYOvCkKsSbG7ECxi5SXyB7S8fdwrVOduNeTRRczVmBwNcH0wQG6/Y+LUw7GWVw2D7WzId3m1EWyAuJUn1J3lzQAOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fgAQof7c; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=wTNZ25LO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fgAQof7c";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="wTNZ25LO"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5194vYK8027278;
	Sun, 9 Feb 2025 06:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ldKt0Y6Za/IJYV3WMT
	HDIaMgFq2JjPJbWmfzdeqJ1Xk=; b=fgAQof7cIoXpue6dkSJET8YNuGy+25kj3z
	fYES3np32/+fIWOwCGN+T/93w+VzjtCHjW5s5iPA3pbjrd2vDs11ru8elB3ar9zZ
	0q0i7VDW8HSEXExMEvxeJjxPTuj6dBn2vRhPVzuBUOP1WfeLu8xqzWequ+ZlDi5g
	hQXbT8uixE50bdr4UiBQxUB4nuF+809BSGrLPop5uzdUpJ6JkK+mr0enbfroSNCh
	qma4JdpS7dzB5yF6nkwavomoK6uikEYwYGYO7VJq+CQIzTrTSZpAFS43oOCmaAhz
	r8zXZDQeOq2j8c+rypqy13HJ8LnLx/sxMSXawQT0dBCgmBpEkiZg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0qa92fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 09 Feb 2025 06:15:21 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51936Q6h037940;
	Sun, 9 Feb 2025 06:15:20 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44p62vrdn3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 09 Feb 2025 06:15:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lW9UjUTK7sIVFaWYVI5kee94NJwXGekZk93wV8oR1TjU/U6rUEtIkEgABkuByeEllk825BUHbTjxvRCXr3oxtnZYE/CqtyuGKEpD1qLRCQmg4aiaC685mbribjz90EyrkkhAp+0umDJWpu3NKZjeaepFhok4ZzXpXzceUv/5wTSrJjEilq8Zd/2ucE4h47sLj8sGCo0Fube0o9J4QWIViNQ7tFl1VTOdOkF/cDbkqpFrFShea0pV1rtgOHtPkh2DXBM5ob7SpeSS8D0OTTQkyORA2ttM/Pl0BM8QisOLUzFIGyJLRUOXCA/Rn7oq+eeFF6TpdIJy7U6WWs0tX+qmTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldKt0Y6Za/IJYV3WMTHDIaMgFq2JjPJbWmfzdeqJ1Xk=;
 b=ezZwijMigIS+Pu3eFCsI5fE+F4YbHqAxTwiMB4V4MJq/wd0+bx4kKwimcBB3d1yDY6Les0qCSU42XL+T4g9vN2CO9V5Iqa+IhvM01ojcasqA14XGPRceS4rjNcwtNpEbOiaSKsorPjULr24TnVE/2Lmz8M9VcpMjNuJfkL1YOedpoEdXGmiF1gb3IR8WaTvye2VesTz+NjyRJGEfPKwXc14NkQCdY00ZdZGHPErLAoWTb62t7cHmB2bTSVDQraptMEzkIol5hfw0hq0Ef54UGFY5R5h/HTsxZsTjq+XGvX1UfPooIddB/4QG0rvRfwIHXLrmji6X02ZsiRY2kC78VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldKt0Y6Za/IJYV3WMTHDIaMgFq2JjPJbWmfzdeqJ1Xk=;
 b=wTNZ25LOUMCtJqEzV+mUedrda8M4rl2wTKcR3jwjozlo5IEzLNMI/OlgO5w+FozAr07AE66vvFLm3Ifim3MioPymo+jOUX5tCjz3XRpI25S5byRhFrB60VJ6ueRmzo0EFO+7ALdOXAK76nDQvlxBarB8sykHsDoOoroHfOrQpmc=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SA1PR10MB5759.namprd10.prod.outlook.com (2603:10b6:806:23d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Sun, 9 Feb
 2025 06:15:17 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Sun, 9 Feb 2025
 06:15:17 +0000
Date: Sun, 9 Feb 2025 06:15:14 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
Message-ID: <638fb19e-d8fc-441e-970f-e1f396d0eb65@lucifer.local>
References: <81171ab16c14e3df28f6de9d14982cee528d8519.1739029358.git.lorenzo.stoakes@oracle.com>
 <202502091146.oTATquOg-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502091146.oTATquOg-lkp@intel.com>
X-ClientProxiedBy: LO4P123CA0634.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::9) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SA1PR10MB5759:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f93f282-c871-4c7e-f273-08dd48d11fb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5ULVpWQGb6oO4gq+okfo0IvwG8gMfm53O248BiTcpmjsWggWlAKFbbfC53k6?=
 =?us-ascii?Q?RCJwRM80P8Z7pwbLsKt7mOfgVg+/1bOvBVWQuei/pa76fgxAbkARMoO/1xdI?=
 =?us-ascii?Q?HdedLtEjP71gi9JigqJP2nt03sc1hyJZ79Lv/plFsAaqhnnhngWS3SCqypMB?=
 =?us-ascii?Q?ug+Q4DKjHHqhLoyODtFOlduiOy+Asf70hH/kku2mXgRnTA345Lzz3mJlOqmq?=
 =?us-ascii?Q?jJgI5zar0/o1hmc0Eg2C66GcljyqjOsDDDapYh5Dssg+EjsS0JyCpupczOtS?=
 =?us-ascii?Q?djt2KF0moU1ppNKye8t3elrPq7lyG284FyuPx0e/71IWl4Og8bqin2Omwemm?=
 =?us-ascii?Q?t4Fsa8CHRgeC8Ff4qWddjU4bnn+ZfrGVJ92+0FYHYFmDyudim5ayu5cP/oOL?=
 =?us-ascii?Q?vEb15ctALu/g0FPW7oR4rfWA7bP5i8A6ZGgifWVyWuP44wlE/4ETJM6EPZMP?=
 =?us-ascii?Q?hFEX7NeJnJ3DHXXHnSR7lsx/W0yeVCuYoIkR+rkCA0IgjkTjvvVB+xlOqrWc?=
 =?us-ascii?Q?/qaDP9QyOwYJ66C3B3/KfanwhiQ0phNFmubGeO4wK1hWZrtbEb9EsJnLHW8F?=
 =?us-ascii?Q?S7sP1XfJ73nd34oog8zgkI+/9App86N8uZiVxODfeLmbPFF1f/3zXRzNxHyf?=
 =?us-ascii?Q?uY6GPN1cbQttDYJtEv85QZaIw7//syUh+DFjppPk61CqtdFEuFzFiek5c0x1?=
 =?us-ascii?Q?ntiv/YmSUI8Usa75e3HN0j07cxNalsXWfu9ZjpUM29OO47iLEO5THw7cYrxl?=
 =?us-ascii?Q?4bEhK3YjeiEIawkQMfQ57mAWnjrePUQWMtGVEeC7GbVuA4MGinKMcVi9MsX0?=
 =?us-ascii?Q?Hn/qIWB1EoMEudJHY8d0zgMVvhcuhXTFVNWoSPqElsBiDIzPeZYD0T/waV1S?=
 =?us-ascii?Q?qHQP8B07OtLRCHamnFQrMo1aIYjC4HbEbMY5CQ2xqMXAzpYAg9ogV0MDCVG5?=
 =?us-ascii?Q?NTfsaHoFlsyYwcC/7A6cjBvnNNaEc280n4VPyAgM4NszW02jL7hJ4KhR1SN4?=
 =?us-ascii?Q?7ZSOchFVA2qNZX2/FdLahOboWkFJFCEtaa6ioJrfZKWmLGgnoMYckOMejrei?=
 =?us-ascii?Q?vtnHK3gFU4Z3efDsawxrl7Q79X+3/LhbFrSBh9lPV9a4psqI0e1W1SCmPtCB?=
 =?us-ascii?Q?IiU8hZUwoIvT4cl+lyTpclyLyJSddyV6W53cgzZabypQKmY03nEejgu+5IJY?=
 =?us-ascii?Q?aWtUI77L+wc7IwJJpSqbiKEaV4nbXE+dAtOE5EezMy4H2QjYVKkJ/nwyk+Sr?=
 =?us-ascii?Q?6oPVtLSQO5a/ZmqkMif643TCQTiZqIphFOWxZLzbAIDp37l7ZEd3557YIANB?=
 =?us-ascii?Q?n6DZZZtQPFdVcLCa67RMnb3DjGWq/25dXZetNjtxmZrDEw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PL+fP1wwppBssLN0HJsUMinOhDh6M6/DzZzJeJst3XIn5CssgbBkhu0Izu8K?=
 =?us-ascii?Q?K3RXFcnIipUHgtvVbrurnq/ooM5IrwKs4N8NcatFxEhzkL1Sq5C4jOTUsv/g?=
 =?us-ascii?Q?1gRTp7MHo50Es49b9lE/w3e+rZCa4ksq0PVT6X9rX5s+EF2Ss3cT/uqWl1f2?=
 =?us-ascii?Q?UYkCKs1mGxTTqRB7YcKHKjS9Nn3scoe37jzlbZIn9yFlMSErIevYEBxOyHFF?=
 =?us-ascii?Q?MsLJFGaYn6Q9WtgVlgulJSNJgTvjcz6UE0Brt0Vxiq0c3ySTODdfQiJBCNgq?=
 =?us-ascii?Q?lT6XB8SWsrhTlH6MAdSaKGBrYNyXdqoxqsSswH5u7x/ipv9kzEyGPKbYP8J8?=
 =?us-ascii?Q?Jf3hiQdAZUz5I4F+8WvHFiyzX2glNPniJt9kC0vxPt/n+wbSclgt1AkpVFMU?=
 =?us-ascii?Q?9vGyRg8sjeOxA/JGWOkXAkBpDBIyOMWDgGOUW3xxoECAnTj6wrYaRgf9ruaY?=
 =?us-ascii?Q?Cocl9eLcsaU38qqczBLU+yAtGJ/EtfkKqkGniVWqrdrr4y+wm3KFx+myE4yZ?=
 =?us-ascii?Q?Cb/xLOlTXEwEcrA0WRbNFSA7S3L24OHzlqCKKNtnPG51OHBerQWV0qDQVUlP?=
 =?us-ascii?Q?X9/pcQ/y5Xf7AdlBRBuSanP7+8R2rNw39SZMW32iyGqOCWNylBymvp9pro8m?=
 =?us-ascii?Q?RuR2cuAkYdBdJGbJKGFCJ7ndoZh7B2DlC8bOjBvunvGHfaQzVGa0bVAKnngI?=
 =?us-ascii?Q?pqBHFruOze6/5ItdrtBa1S2suCEx+G1Lu89/j2cNUeiH9OaaOjnlrMOusv8E?=
 =?us-ascii?Q?esTgDCdqp/cJmUa42Qi4xZktvHRg1KujQePnMUygNc/WwMctRXUzCp+st/6Q?=
 =?us-ascii?Q?KS2netyRs10I1CDqEtsjBbkYLOtV4uQS5rQVgyn5JNP8nEx3ohPPajtDVPXe?=
 =?us-ascii?Q?Brg75UNuww8+bwje8r+oXodjLRSqVp4FDos2kUmvQrR9l5Tz3rQd9RiTqVut?=
 =?us-ascii?Q?IW+HKJepIWLwq2kigvEFgFNIvQChz7gXH+8yAUCFzCear4Ta4vZSth3o14mr?=
 =?us-ascii?Q?WTUuuTdKmw6oy5JSU19RoC0ijikkiTbVD8nVRuXSuxL0oGKH1MFHow0rQc/b?=
 =?us-ascii?Q?C9U2B3ae/crVbnHUa/iiLhaB7JB2mZMbnEs/VxCMIRpuvcl70CUMQ8g4YIRH?=
 =?us-ascii?Q?d50/rpHahlo93ooEviA8O86kxBAMAl/hWdNEy2iWoYkCwgw8b5EkCBLFKxWz?=
 =?us-ascii?Q?vwvX6LqdbPcmA9Wh02UBwymnAIBsp/lD9kmn1pU0ze6BiZ/PT5QXjGEinAQ5?=
 =?us-ascii?Q?ORZWMVNUwwzmBCfXCGRZvuwl0z5bVHnri98DLvdI6ZPvg2HlyEQ1AqDCbKrN?=
 =?us-ascii?Q?R9Efj9DUg1cS23W5Qx17umQcLymfscEiUHBCNpllhVr1dpzq9CfV+F5rOuDu?=
 =?us-ascii?Q?vVfSNws4uUzyP6FDis9SMMfCFa8YGSrDNjrdSwEHIt3Cq0l+PJBKfj8P7F1q?=
 =?us-ascii?Q?2GH5qHZYY7zf1k6pKqoY6QPbmuhrJW7O0KPnOkyoCHS9CSFGLBNrxvselcKb?=
 =?us-ascii?Q?NY7XJhclW2/m4J8yaLyvrq39QjS2eKSb7dPAAqRJ+AkiLLubmzkmMPhQmNnI?=
 =?us-ascii?Q?7IxciR58jcB56Hk+uY6bdBv9C394T7s5Fp3/c9ND4Jv+H7yIbTenxlXlLrk6?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	UpCa/bSTWkZ2FqRfsiBL/tA4UQnL52x3PfhiJKehZCfI0uzA6/eWWx3unghEw+lZsfyvIA02++z+iCdwEFiRf37oyzpASSYyKQFVLDK+5C0J309Sp0LqLa8DBmScwvZMV1by2EVuxlEyptfkrjL9nElrXaIs0EC8FXAC9W8NckSXibJcpFkTrmTHcKH1o8DBP8orhXwUUIBE7Ghogby1zhQEToSgKF2CLW8JTwZk960CiYWdswtWKTL9xWXx9GOi6QyOFLF4Mua3TbC+bsDvihnkiqWAmfctxQQ8aWlUUSHyqQTFpgOgK2XdZb1TUH7aFHjptySKlZdE2jPPkavyRXZzTyvnggJttSBwsTJMA+DGyNBATcVe61nxTTPGcGzsbytkPO9rTE5NhPiF7RiOQUjS9Kl6wDnL4DFwjzgRNeN27A1lXYzS6N1Rqz/7VLtU7RXwdnzH38G1TJtuwy5pNT7Ex1oxRNbmUpo2C1rvlZX6jh5shjYpjYc9X5Eg7DxCKXUGB4uq88BAxSo4Xphz6lV4iHO8X6BJIZ4xU0sVwFJwVCaFH/UX8+KMBBilZNvcdrKf847AxXyiWca2fM+/s8vdY0GvXAO8ACfbwWzhBPo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f93f282-c871-4c7e-f273-08dd48d11fb4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2025 06:15:17.5318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VdlL2XRIEyFdxYahO0aYYsHye6rH0Cve+sce0ouDCzFWJHywrqFJN3TYu+MV2Gl1rwpo9s84895cgGM8DMIGN1mGyleP44TLyC0MTuL4VS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5759
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-09_02,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502090052
X-Proofpoint-GUID: awSgGpxI47Z4QYfvzHd21qSibq4Df_IB
X-Proofpoint-ORIG-GUID: awSgGpxI47Z4QYfvzHd21qSibq4Df_IB

On Sun, Feb 09, 2025 at 11:41:34AM +0800, kernel test robot wrote:
> Hi Lorenzo,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.14-rc1]
> [cannot apply to akpm-mm/mm-everything next-20250207]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-refactor-rmap_walk_file-to-separate-out-traversal-logic/20250208-235627
> base:   linus/master
> patch link:    https://lore.kernel.org/r/81171ab16c14e3df28f6de9d14982cee528d8519.1739029358.git.lorenzo.stoakes%40oracle.com
> patch subject: [PATCH v3 3/3] fb_defio: do not use deprecated page->mapping, index fields
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250209/202502091146.oTATquOg-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091146.oTATquOg-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502091146.oTATquOg-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/video/fbdev/core/fb_defio.c: In function 'fb_deferred_io_work':
> >> drivers/video/fbdev/core/fb_defio.c:270:25: warning: unused variable 'pgoff' [-Wunused-variable]
>      270 |                 pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;
>          |                         ^~~~~
> >> drivers/video/fbdev/core/fb_defio.c:269:30: warning: unused variable 'page' [-Wunused-variable]
>      269 |                 struct page *page = pageref->page;
>          |                              ^~~~

Thanks, sorry, this was an oversight. I mean nommu should _not_ be using defio
and it's a mess that anything does, but it's a mess that's far beyond the scope
of this series :(

>
>
> vim +/pgoff +270 drivers/video/fbdev/core/fb_defio.c
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
>  > 269			struct page *page = pageref->page;
>  > 270			pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;
>    271
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
