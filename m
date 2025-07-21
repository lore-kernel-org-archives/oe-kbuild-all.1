Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F0D2D3EDA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 11:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753097951; cv=fail; b=qcah7Oua93PMeWuvB1FFi4DbOF29piIYtjkIAuLRYfc4Zvd1HDo84Ja/DfqaBob/mDNz2ay8lZAD9Y+RZLLPH+YwUzF56f7ZSfrgslX/eVs4oQlKH3z6aPfcMvg+3sLyEj0opuiSphKoQ6Z5O5sIADxrXk/2cyZsNiWsZGW+Qfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753097951; c=relaxed/simple;
	bh=W8uIwISIrXLV43lefBEpB+TwAjdqxHMFO0G2/ZMR7SU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cU5YlwjEQuu0l8GULzpHiXj4YPQBK5iVpxu5sgHjFGl0pXrPrvOIHJ8NVv64tnkj1sqRG4hOgdDAtu4Al7hNL2M9O/bdzIayrOu8HnZZXI0FbUzSLY81OpDmsD+cLOaUJ2fa+LWmiswnmeAlQduCjA79LfFfI8Mock0oSkYsQuc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KeV0lWhP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NB+BVr8/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KeV0lWhP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NB+BVr8/"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LBCqsa016338;
	Mon, 21 Jul 2025 11:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=f+zPc0OzM3BfB0HS2P
	2xTPKk3hyf0C/3KoqVkPRDwxk=; b=KeV0lWhPsu+6zuRmA30/2cqoZq+DzFSvMi
	hJyZMFsL4Fay8GSWdqk9l/CjbJvcHdVFkE9bQ+JFgWWZmlA3tFn3E4Dw2MQZaSMm
	liX6N9u2zUSNEbgMJhV11BJamiEurGspnIhg2UIO5wSNdH+6oqxTWn0axb9jG7L8
	Lq6LqxztIBPkfkKS9lAla3P7Cc7wjQXZ2zgxtUfx3/xZl7wFJTD8LUlZR2ZU7xQP
	VoWwL6et4o56hwF1uHZrJX8JUFxe6MESYKKBTGqB3FDpoNSHLo9MXYib3fZTNu9N
	pyB/Kleqftq7dJ2twCFMIs4b2gHXiwWAq9OdlbP6Qfw6mmizpJjQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805e9je0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Jul 2025 11:38:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56L9tx1d005916;
	Mon, 21 Jul 2025 11:38:34 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2046.outbound.protection.outlook.com [40.107.101.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801t7xeqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Jul 2025 11:38:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jItcxFSMJ9yVHrVhWPmtyG33OC98Ybax2Do2SmIWX26pEMZq9Nh7iZHNj/jjzjg96a0/BTh8/Ns/J7N0RiG3P3A1YA+OZqxq3jb9L0g3c6LSL/sCrhcxgtMP978EPbm70Y/5dXOyAgbwnTZ3+3sfTSebMT2RWMgZcbiTbxOY6v3f+VmmWhjrg95RSl9cXe0Vh5R3RKmndT7hKZvKe7G0WB6Yd1bsYbwHhqDktffGzjslfOOkXDrMZp2heWQgZOPkFR4N4tHqxCyL8Ti0B30TZHzWnK7zg53B0IhhEw3eLt6AE1x6sMDzzi+KqH0+5sM9tWPycFzU7g4j7sl3iVMZ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+zPc0OzM3BfB0HS2P2xTPKk3hyf0C/3KoqVkPRDwxk=;
 b=n1Xqs/QxipvYQgF0ufAfAdjCqpN3aTrH9D2Ne2dg9FPIgdqZG1IkOdkx7i0PH8N3X3dTLs/LfYR+FN9NHQQMyX/xYvLz6ZL7+DxcIfFIonCqbXON+TZCirNZgunKt5IC1B0bmF6m0g6YiqoAcDQZy/KM111qpWP8AkkueAwPaMljRUzq5U7EiQWncdaTGgGYUKuEwUWd1br58L3oYVMX6+Lsy4Jrk++PptqVG7CR/dCk3w00qHS5akDFCaDVBpzUg5SA0AMVsqGoVzbUeRW73lVyPaQ63zAKpsmZy//ESDKvFmhNcEwXuF5HyBB4VruNdYSS7B5RFerABgumYc9WrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+zPc0OzM3BfB0HS2P2xTPKk3hyf0C/3KoqVkPRDwxk=;
 b=NB+BVr8/6mhwfPtUnSvJZJRIA/icEnMQl91SxqNQ4e6PvmVkOPSQGbSdswJagaE/tYiKnPub7dlsRmy+sOuqVXHIr4ufmpEcVFT62wykMzDlaoBr8klCQRipqkd+yuCVvb/7HRhTp8UFz5vM/pVwacZHNYMcKUVec7pCl/nRJeQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by IA3PR10MB8300.namprd10.prod.outlook.com (2603:10b6:208:582::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Mon, 21 Jul
 2025 11:38:29 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:38:29 +0000
Date: Mon, 21 Jul 2025 12:38:27 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: Harry Yoo <harry.yoo@oracle.com>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux-foundation.org>,
        oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Juergen Gross <jgross@suse.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
        Muchun Song <muchun.song@linux.dev>,
        Oscar Salvador <osalvador@suse.de>,
        Joao Martins <joao.m.martins@oracle.com>,
        Jane Chu <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>,
        Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@redhat.com>,
        Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 mm-hotfixes 1/5] mm: move page table sync declarations
 to asm/pgalloc.h
Message-ID: <50acb1ec-7b36-4073-8604-3132ef1e0447@lucifer.local>
References: <20250720234203.9126-2-harry.yoo@oracle.com>
 <202507211129.Xbn2bAOg-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507211129.Xbn2bAOg-lkp@intel.com>
X-ClientProxiedBy: LO6P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::7) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|IA3PR10MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1bae60-d0d1-4fbc-33bd-08ddc84b1d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1Jn7Y5MvDfxttGXDbsa0BhbTxbUaxb7JXg5ks/LejirIdoWyzeaaDxUo9thC?=
 =?us-ascii?Q?kjFkskFhApW8so08bN1jvbVKYlsgleb49ZxKqb1WBp3MbeTEOiDuza8OJPSc?=
 =?us-ascii?Q?w8hp250534mwioemqxsqfeZ+KGJN/2fDuvklSQ0x8dIYC0QmSiw46Y4lIaaS?=
 =?us-ascii?Q?dQZC0QurJpLb8rQmQI+fX5Esst1YvweG9V4VMVDA2iXhhR+WJDrxDXDtrm9J?=
 =?us-ascii?Q?RC5UQzVpt3Yxnh/iXnyGyfogFxuMnwIh9lGRisSniGVxnBUNob40FMnd3Ejf?=
 =?us-ascii?Q?gIUuX5lC3QWqgW1+b/ZnGkrblzDnqsvcvOqgBW17g/2kyXmnhXdQBp+fwEMX?=
 =?us-ascii?Q?S/VTDhsZRdCT7p1HMUQa+lvRApv0pqHYFyjYjrDdtlabiHwPRPGCnmGStdQU?=
 =?us-ascii?Q?qgcBEvTpjxSDRfjVSk4ovrEsRVptkbD7Y1a3rRK15VMNTssJFwjZHMknHJSC?=
 =?us-ascii?Q?gEKUq74njJIzPzqNh2TYNRWdDZ3BxeWKOIM2d5YH6I4BMwpIw8cVL9juxcbh?=
 =?us-ascii?Q?MgrghqHxUH57qU5Zc9RGhyCwoaQUEQitvcChR2bZLRyoXD803laAt7u5z3kq?=
 =?us-ascii?Q?wMinY8FDrWCSEsptTmkgsEsaJi++KgyL0g95BHO9MmcKkM+D9TQO2YhssrC/?=
 =?us-ascii?Q?a7QcqkZwx2085ytshxXdHOEReMOyeOKXZPIJ+N4t5GNwRvoy1d7Y2NjxRZmd?=
 =?us-ascii?Q?wkZgQfTRhWDxfngNVOyWT6DdKcW+KqeuW2SrsXXb46Iwje79KEcHwXpJTBz/?=
 =?us-ascii?Q?B9Qt1bgxfw5w9RhkGUSUQ4PZL/qf5xgLq3DTvAsD0sWOqxwgLksZ1xxeH0X8?=
 =?us-ascii?Q?UdyVkdXa2BwoX3hf9h6V+Z6SZe/G4dzjb0AIIMzLZl97vIztxPuOYwAVB8P1?=
 =?us-ascii?Q?2xijo4JwmO2nvS4uNouM7RYGkQwQkLY7lDkbopUtSNwOLTvkwehLZspHNDQS?=
 =?us-ascii?Q?f4jmQFdnwDNdzgwe/ftPfN+J9o4xDRZToeXTzD5KjX44Pvjp360sDv19Zsbl?=
 =?us-ascii?Q?7DR1UsIpituwW/LBEOLXoiDo4UxIP2NdPnFcZ7uyYlw3Mx2Qr+tzIg1RiLQl?=
 =?us-ascii?Q?9SGft4/2WLu2ABvzVQp/qFktM8guCeevEvFMSuWbAvMYew3XjGnxeV81Ie6v?=
 =?us-ascii?Q?u4PiwocLVImDNGe1idMBjFXvw/R20F8kqttFwPMUknfXfaLJhL/WoO3WrEbU?=
 =?us-ascii?Q?4fO4hpqdj/zzz9HIgiCj4R4F2TUNfDnvDizFxmPtt/OvwNXqWtJKCRg49nyu?=
 =?us-ascii?Q?gIQ17sg88T3yrUW/EB89agXOeBtonYI0/Q5lOK3c7EdmwOSQ6/XEcey0P/if?=
 =?us-ascii?Q?+j5x/ZqiTogbLeOSd+NQPIinoe0BquEE1/g6qjH1uvIGbHJmX/GnkQ8Az43R?=
 =?us-ascii?Q?Qun7BUOBZK76xuidW5b+0QCGxGk0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oomyzL0D8+UTW5Uzc2IgWdT+WUtCLkwBlTpnXmV3JXP8jp1DUnKn2wF9SsBX?=
 =?us-ascii?Q?4L7t4J2FajiVwSimJpdZoSowuYE4TzgiFcnx0OiD1Npq3awtJTA1YVnnnaw1?=
 =?us-ascii?Q?vd9B8gw1IQZ+7dzVWoqLK8MemPguRqVTVMwNTXPt/t6wclUt3kG8S0rVHtnc?=
 =?us-ascii?Q?e7kjcdIkYGFuUbTmcM8GHUD1o+v3nQ0sdDV8MrEA1wBPPllzgk7nL+1HlRmE?=
 =?us-ascii?Q?JX78aoL+B+saZmc89WM4PXkEpUWJz6d5Ktmjl4PWasZsmi4Ff/syCN/rvST3?=
 =?us-ascii?Q?dwBmgLZBRiwCzPg9ipeKsLXaUsbrm93qc+QVQxZCdAALPRdcu1MpKjlShvnQ?=
 =?us-ascii?Q?THAJEW2hRW5wrZmjch7c5xgmgHoDpIPs1F7fIdZ2aLxVJ/lk7z7ozuT/kLo9?=
 =?us-ascii?Q?2tsBzZtNSXOhZ2ILFu2yxVWKQJWmikXCJNuFZO1t52GT1VPIvYripcAjPUt4?=
 =?us-ascii?Q?nkPYlw7wHxjwKWKW87xSE47MTYOGN1IEk287BqlU9QztArEK3Di/LpzYWVd0?=
 =?us-ascii?Q?H96a/y5lQUCL88o2HXp8Oish9qd19WpEbAze0wg+BGtQQcTOWGTADw20+YeE?=
 =?us-ascii?Q?/vPM/YZfFm6HfFkK6ijF8GJ9vBrZBgaavVr//oRSeNlvfbZovtS+bsm+u6Z+?=
 =?us-ascii?Q?gPNS8nlfrBF9RSS1wK2LJByH23LzVE0GIan4B3WtFCBzwC7rfqxNMyx9vnQd?=
 =?us-ascii?Q?jb9vHBpkf1vL44hAvkEOt14qGQP9OVnU1XUdvVJj9I8vUaY3KKw5Jpg5WDd1?=
 =?us-ascii?Q?rRbIbvmb2GQCoZHAaHdO66u91KL8DUiQaoHE0qJf7SmwTI/iJwuOdKqVIPH6?=
 =?us-ascii?Q?5IP01oZeElqAUrqy9BblcZoIJwy2XfCSb5piE2TcbFUZEFwAO76o7dZRNSdk?=
 =?us-ascii?Q?BnwjZ21o2Xoc9kbLASoMo+W9wnqVvk8cAyV95z2/NCFFer4JOyQahgYuutUo?=
 =?us-ascii?Q?HID+jTOsG4DC0+leT0zH2ujBcmhT2tGz1BapotOJ/MfiG43jjgnvb+K/2NpJ?=
 =?us-ascii?Q?gevUH2TgoBwB2vLJIi8pAYMA6QSUtqzagwilP2XKwR5idWXrG/3u6133o5gw?=
 =?us-ascii?Q?bcHHsmrX2O0iQpLMf+rbtDmvATxWFBNyDsfAwxYZguwY0JgshhoGqJU0wjBZ?=
 =?us-ascii?Q?gp1aSNWfMeDJPgDHlxsw9qtCH35sPUKXU7x1OogEO73by4YZbQ2xF3Nm52md?=
 =?us-ascii?Q?xi+hIIDR84U/9MGzuV431zwO4w5i8zlb+EK33MAWooG7MVqD5Bpf1m7/W2zR?=
 =?us-ascii?Q?yzY9mjOHfhsmiGCrToYbTslKoUqaJcjvd9Xwe9KRrkP6lLRZrOaAt76LTIFk?=
 =?us-ascii?Q?H9oOAx3mOr4YzL/78knFt2vNnwAXzkF6KSlWg0UeEi+0LhB1LNtJkbolQT4X?=
 =?us-ascii?Q?xIuIrZuwmUgBMgKWauMQhQM8tmCUdDrLsy1KR3xoRNIMefKUi1Wm7/lvkrVS?=
 =?us-ascii?Q?LhPFkGNqF/+be91JkmJmXWtApImXT7xtY7AtLaHtkUpYs/OgcMUiJquSxpQv?=
 =?us-ascii?Q?G4PfMD4sEpjpMu8Lq7DcN7R0ZOtD+uFIlOTlnEEFeGqlTdLvrsGrXz56JTRT?=
 =?us-ascii?Q?5CZoL4ju4ijT9BYAB5udWd5xQRVoxwUG+ybkRISAC4lEIsccbl2oec6RdcaT?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	psnoCNciWoV+xiJsRQ/8m3TfsZXKeYjDmO5OAQjdy8HwRmAcWsA2Bvf4c2Anc1krjAgq9Vu6u+LL9hwM/xeuRLu+0jbn6KhW0PktjmcmRkLqx1S6TRw5NPqlT68RwjXRnC5WqokmSvovAkoykdUK6W+Fy2LEBhzxvrtfyXXdmjSgcv1Nk8BJO1p5PM0HoVh+nvsRxDmV7bm6wsvC6dAdRy6K5eXEdEwTwZQFaTtPLcKX6aQkCv/zNGC/UMmhCQuyIIkg1d2waVacw58Qz/EwXScWuvRvb/tON9gp1az1hlsCF1Ns6wpEZa5gQI1p9mdx3GYOl6y0FI2JnwsX1Orywh/1yQXPmUmFROYwtVdhpi6j11n5kLCksbuhfQHV/n1a1YaZ5kTjpvdupudxjmrFM3LnEbkGUNBwT+ALdMtlBra0p5AiQ7HsVHwEjg1PHOZznF/ce2wo0LRIzDUsOrmDM+XEKWvoTSdNJ6gfxSVMijNRh/hQXmDak0jCvaP1jZGRvzV0IZUADgF1ZnUUG67XeltY9TWvDESKcCQJ9MC5XsMK40UsMele+f61yinOGY75dfoo1nlWbz4ICeLO0jdGmxZXlZwGiFWC6XbcivZvfqY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1bae60-d0d1-4fbc-33bd-08ddc84b1d5d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:38:29.7875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNnCQQy4s8d5lVGZ6pM7VxYzIUieNX5RR/7RTsWN+PUFFz0rGe/D4G64vpAzy+K+Snu8m/JxHymBtKJBHOLPd7eCtqXlTWZGJq/XgcMcnZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8300
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507210103
X-Authority-Analysis: v=2.4 cv=eqbfzppX c=1 sm=1 tr=0 ts=687e26bb cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=i3X5FwGiAAAA:8
 a=QyXUC8HyAAAA:8 a=SZ9xx8oJCnvgXjVdtFgA:9 a=CjuIK1q_8ugA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: JZ85JcXKkwlDSFOXLeOM2cpSzvyxGijD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEwMyBTYWx0ZWRfX76E9JDN7eZCi
 P8YH6ijhxJq5TP4aV++jFF/jWwRbfdlr3Obool+W/CqjvIJPofshYy+1E9rDZmUb9dEhHqYVKWf
 LOJ2UI6TJyE0iuFutBSqZqvBVaaXlQGoQto4Bnx70jKHP8zJFbM4FZt8QQiH1k7PG17XaQqTkF7
 XIyu2Gqeic21n9fqWffhbZ09vPDIiNZHpCHz5wQ1yq5ecbC9JUgCFP/8TXpQmZbFTEmboZEiMNR
 UbnqA5n8vht7zDNtwG9EH/Y+zAEV5Cm4MLBtsuU070LxxJIeNOoUTucetggzKS0eR01s/ExF9e2
 ij/P6XHjOYwnKw2i7L0MZYmQOoSJvtaxc/xXsVo3nLXYDxRCg6BQESirdV2XwWu55a+4Gj/Q1jM
 MAWQDegg/mrMotn1i1DczwJLyI/lH9NU1mBRVt4vSWPh450Ml7pAsDpbO6oDm20D19/vMXvF
X-Proofpoint-ORIG-GUID: JZ85JcXKkwlDSFOXLeOM2cpSzvyxGijD

On Mon, Jul 21, 2025 at 11:40:10AM +0800, kernel test robot wrote:
> Hi Harry,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on akpm-mm/mm-everything]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Yoo/mm-move-page-table-sync-declarations-to-asm-pgalloc-h/20250721-074448
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20250720234203.9126-2-harry.yoo%40oracle.com
> patch subject: [PATCH v2 mm-hotfixes 1/5] mm: move page table sync declarations to asm/pgalloc.h
> config: i386-buildonly-randconfig-003-20250721 (https://download.01.org/0day-ci/archive/20250721/202507211129.Xbn2bAOg-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507211129.Xbn2bAOg-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507211129.Xbn2bAOg-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> arch/x86/mm/fault.c:265:6: warning: no previous prototype for 'arch_sync_kernel_mappings' [-Wmissing-prototypes]
>      265 | void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>

Looks like arch/x86/mm/fault.c, which includes linux/vmalloc.h (such an odd
place for this decl!) needs to:

#include <asm/pgalloc.h>

This seems to be a 32-bit build thing, as your series builds locally on my
x86-64 machine.

>
> vim +/arch_sync_kernel_mappings +265 arch/x86/mm/fault.c
>
> 4819e15f740ec88 Joerg Roedel        2020-09-02  264
> 1e15d374bb1cb95 Alexander Potapenko 2023-01-11 @265  void arch_sync_kernel_mappings(unsigned long start, unsigned long end)
> f2f13a8535174db Ingo Molnar         2009-02-20  266  {
> 86cf69f1d893d48 Joerg Roedel        2020-06-01  267  	unsigned long addr;
> f2f13a8535174db Ingo Molnar         2009-02-20  268
> 86cf69f1d893d48 Joerg Roedel        2020-06-01  269  	for (addr = start & PMD_MASK;
> 86cf69f1d893d48 Joerg Roedel        2020-06-01  270  	     addr >= TASK_SIZE_MAX && addr < VMALLOC_END;
> 86cf69f1d893d48 Joerg Roedel        2020-06-01  271  	     addr += PMD_SIZE) {
> f2f13a8535174db Ingo Molnar         2009-02-20  272  		struct page *page;
> f2f13a8535174db Ingo Molnar         2009-02-20  273
> a79e53d85683c6d Andrea Arcangeli    2011-02-16  274  		spin_lock(&pgd_lock);
> f2f13a8535174db Ingo Molnar         2009-02-20  275  		list_for_each_entry(page, &pgd_list, lru) {
> 617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  276  			spinlock_t *pgt_lock;
> 617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  277
> a79e53d85683c6d Andrea Arcangeli    2011-02-16  278  			/* the pgt_lock only for Xen */
> 617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  279  			pgt_lock = &pgd_page_get_mm(page)->page_table_lock;
> 617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  280
> 617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  281  			spin_lock(pgt_lock);
> 86cf69f1d893d48 Joerg Roedel        2020-06-01  282  			vmalloc_sync_one(page_address(page), addr);
> 617d34d9e5d8326 Jeremy Fitzhardinge 2010-09-21  283  			spin_unlock(pgt_lock);
> f2f13a8535174db Ingo Molnar         2009-02-20  284  		}
> a79e53d85683c6d Andrea Arcangeli    2011-02-16  285  		spin_unlock(&pgd_lock);
> f2f13a8535174db Ingo Molnar         2009-02-20  286  	}
> f2f13a8535174db Ingo Molnar         2009-02-20  287  }
> f2f13a8535174db Ingo Molnar         2009-02-20  288
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
