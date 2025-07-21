Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B6A1A3150
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 12:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753100170; cv=fail; b=YmqHVBLPfvrF6q/CfPmDn+yV4GAvIN/pudB6BeyAHz8wacTaPYZDYHx/tkBkD45aZE2XFCkTu9A4WPUJYD7pZkxW/UH8AmUWUAskn/+lNq1dpxy98YVAcEbVtqG1t6cBTllRXXyMd9y3TBlwR54gmVYFC/3PhfHQN+j5/5oJPX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753100170; c=relaxed/simple;
	bh=ZJMEvn9xA3UgQyg4SrdW06AqfD3w+RfJnc/VMhDCXJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bDTKg5RFiPGG4HkQBn84i5cEaZS/xPkZeI3tHhrMnCaTTVZADZxQllKvjauxGMn2e4oseBN7LVP8GELtq8m9YRfM1n0Hj5G0LWptPhjV9zM1iBVdXUiQS/TA0WSBuQEXBVSWR8yhUYpd4MKPouPVRVkkNyfRcnhOMqYEKVkiyxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=pDK/mWCS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=uuIdPqxc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="pDK/mWCS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uuIdPqxc"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LBBvDs009925;
	Mon, 21 Jul 2025 12:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ZJMEvn9xA3UgQyg4Sr
	dW06AqfD3w+RfJnc/VMhDCXJI=; b=pDK/mWCSagiNiBhy/P7GCR7LtVsDNlk/xX
	u1irkI2nBfUj3UQKku2K8Sv1rhUYlHhVAcN2aAj+K9Yv6loMmZWnQpwPPmeD1+Lk
	HQSPT1Duv4eiuLwhfc1rggK3OEE/47T4GvamQsw9xkogcyZcbAUmxekirRlb08KE
	9H0VCT9WnP5LHdLmVP6ntMMQJdjTScsHQCwnElgIvLXCw9zgNVlGwDmU4l7mtKcU
	9PmPeUGH8nKI3j0VZxgj7UyiCb/0CIEx2S4BkTPMowFPjLQP6+a7LYaaWxKrTilz
	5fO1XXNwsbr2oXv73vsZru3oGj8ktnlGnyj8t5s/YvLR95ft6KAg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 480576jea5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Jul 2025 12:15:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56LALoCk014581;
	Mon, 21 Jul 2025 12:15:38 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2043.outbound.protection.outlook.com [40.107.102.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801te88qj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Jul 2025 12:15:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0cwRKEM1x1auLn28fLL7fCGZ2m85vFig7bSzWJFxBnRHPyEHY8hKqIOif2YpetVgvP+G+o6eM3d/vW1r0fhoSqo51HxWPX1vwBfGIqjy1EdtNOcl0XD0fxA++5gq4UoLjVP4s+HeP5f8okMOOVi2SHex5DueelyjjtoiI6TC0EnZD6up7xfotjPdHpVVA9eY4TVeIexiKOe2gEvk2brT9fq81HQ9LY3fEzbuWA3Do4fE3Z9Q3r/YbkxGKbcUPC8x2Iz+oRNAdTrg9OsMq6sbsneooUWKiJ2zt4WKRaVZYZq6tGg9pBG604HrnXRmpltwz3sjalvLxeW5mr3oCt0fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJMEvn9xA3UgQyg4SrdW06AqfD3w+RfJnc/VMhDCXJI=;
 b=WKSzSs//TqJUbN1Uw65gAthETxJPRfr7Mqa/x83McQdbIMIiX+Ye5NGuJ9fhgX86cZc3rV9GUfF25ioQBraXTRKxkqEy0gKwgxEbZ68InFwyQ4xg7E4q0ftN5Wjpr1ekZGmEjjSJyrTn1VUpRGkbzZqxnuKz0ZzGLqzB0+q5khIYQdv1f4V/Se1yq8OAFvU5SYTBFYO6v+3K1o7HlJMAy6+fUpnG8GHBDNzkrtrAt43SHoSQnd2JfYsP30XjM8FE5X3MJ7stukyvKZ/qGTuEic9d7OZQd2uAcgPilqxmOz9sq7IguH+M/eOTo750ysERjW9oRETC+FKeuzNzXyDx8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJMEvn9xA3UgQyg4SrdW06AqfD3w+RfJnc/VMhDCXJI=;
 b=uuIdPqxc0pQn+WhAKpIlOYY0Ioozp1e6xe3MHLyMEEb7yKmVmKQIYHUJcleUxRFY04H1coN396WflNUgWGY7YQjJJlgUrcrimm7gRvA9iwWoRtPYJJoa8kSTPDitCACVnKdkdg0570x+0JASoKbFqXVQUUzx1PxmJXE/yPqkCek=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7929.namprd10.prod.outlook.com (2603:10b6:610:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 12:15:35 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 12:15:35 +0000
Date: Mon, 21 Jul 2025 13:15:32 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: kernel test robot <lkp@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
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
Message-ID: <6d7571ca-9b10-404a-8624-0b0be3afaa73@lucifer.local>
References: <20250720234203.9126-2-harry.yoo@oracle.com>
 <202507211129.Xbn2bAOg-lkp@intel.com>
 <50acb1ec-7b36-4073-8604-3132ef1e0447@lucifer.local>
 <aH4uPI306ITiot7P@harry>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aH4uPI306ITiot7P@harry>
X-ClientProxiedBy: LO4P123CA0231.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::20) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: 53e05303-1216-45ee-b176-08ddc8504bff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k2zV99V37FB5U2T5sUPcigzMjixEKLEzSilsmMF2bqIm+sCtT0a8LzdCJLVl?=
 =?us-ascii?Q?su4wuXdRBX1KFLKscxvoUyAdlc7DaxW+KPLrbtYumgHVlj3B7WE300i7cT+P?=
 =?us-ascii?Q?4dwprQvMWDU7ILEiSHhOdyZnqrPQFPYGKr2lKSiAsxviSGSKAmKO75nHO6W5?=
 =?us-ascii?Q?agt+IaBRDWKNpoADE1jfTpMJYxXlBFN3CIpn1u/HEeXVViMq+Xbtz4kRsupM?=
 =?us-ascii?Q?6H3eghmRTFsXg+ZIx9IubNfLMFVhAYwVtBG9jDATNS67O1yKsXNcwsVWsOzL?=
 =?us-ascii?Q?EBDIwhJo0FacIYN97dLnYF2h7801OE3CZqUpVNRCMxZgH47253vExoh8ZUkp?=
 =?us-ascii?Q?YaLqn3VPHhHaaAMKc6pLLA8kChHDpTXox4hK277m9uOF2xTbOcfmcz+vo+VB?=
 =?us-ascii?Q?1dn9umHF7qvLfe77ZzsKgk2224CbGvuRl/HSZVbHa020otLqdGrnvlSSVI8K?=
 =?us-ascii?Q?hy5ztuxv/BJQuhgnB0EFOpkwgKSzkpXoQmSHHzRYkw8+Y36JaNR4tslzmshI?=
 =?us-ascii?Q?uqmk4pMlMXTwA/oGOFKkHujCpoPYVpn0rnaHrDNBYX8BpMw55Xo3OJXQ3Okv?=
 =?us-ascii?Q?olaSRpOtS2QvLpkkZi1YMwbqO8jsZT67clV2LPbPBM5zQW1iSdiFUPCf6SHJ?=
 =?us-ascii?Q?Jz1GnWAfXMfU8gvh+eeopA3cmhE9dBPOoOfY21Puv7fRom0KjBdkotdLTvYl?=
 =?us-ascii?Q?OA+04VwcEVXiAsCna2IgDusQ8vS9hOzn0mywUczXUgqAb8h8tPyQDlN/ewd2?=
 =?us-ascii?Q?AeZVjM38Z4fTLO8DGx1XAGfZgAY1Tj2eLilbZ8SfesxlaBAha9gc4GoUvch2?=
 =?us-ascii?Q?N2Qd7Fi1NeudbcRfwk1tMy67xhl0RQ3muCAuvpZKlxzjS/2thLxoZfXbCEH5?=
 =?us-ascii?Q?uf7w3yNaz1D/aQ7S+Og5edLJ6KwvFc+3EnP8ERN9fLeuMPRK7H3IdU/I8xDZ?=
 =?us-ascii?Q?2ehyIunSTI+Tcio7oqhp9jdg7FbKVEjw8XQrdbpPtO/URBSydNtp6g0kHFkM?=
 =?us-ascii?Q?/lEALLcnltQEGt0qXLKT2we0yJkY453PzgL71GDE58y6defuEjgpSX2r/+p4?=
 =?us-ascii?Q?iao6lGN514jmUIGJzzys3JMBGgsHpEX+tO76As8PoCaHtbVs5/8cN7GS0sj+?=
 =?us-ascii?Q?0tH6kxQu0yBjbbrXSr7aQ3TMaFoI3nySx+BKGob9ARnV7reeySUBWZvgQ72t?=
 =?us-ascii?Q?gvwt25BQvRwrBSsXUO7nrqn6t8fnVq1k1+V/yxw4rGSGE6r0siYZxXloz+eJ?=
 =?us-ascii?Q?VC4fIJpUwWqXo9VepJjSek7M8jVqzDt40jJgacC/KxngxsNy9nwveOAT+xsk?=
 =?us-ascii?Q?4KtgmzMdel5Eq49/JjlNqzZIB9bW6Nfetgxl36Z3K4iD4J0P7+T4SoX3XwHD?=
 =?us-ascii?Q?dMnYryMrnGjKOtem8Id4dbahPBdOLSsSjoHpGlZ8H8lGzUNwAwrTu1Q7XVyA?=
 =?us-ascii?Q?org6+s9smxo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZrhNG8mN9HVVx2RcvO1v0LtpxcF985rfgdGnSKsX2W/Bnpt7jWOzaG6sBTqV?=
 =?us-ascii?Q?YOMBtULM5WLTs3oNYZhUbkuYpwofReLuHGCFAIDCtbFlFr3smxQSimySBRuc?=
 =?us-ascii?Q?CRn0UgeygxNNZ3u47l+edIMluHNe6PNKoDveni+cwAC3r/9khuQ6nuqFV78K?=
 =?us-ascii?Q?PtW/E8tDg38M4lTPT8jUk/2zOPv0LZqswGI8LDbR+iuiucbtYl6p83ZLcqRA?=
 =?us-ascii?Q?iaUVBxc99dEzDx8nTAYYgi94f4PWQXjLlkQp7krZbHrWapa7xZtck3P9WsDi?=
 =?us-ascii?Q?vzVaVwQZMzEwQCHHDDSN/yymvstyb5oVf+8O2i832C6lrWWlQ+bpBVczo4Xc?=
 =?us-ascii?Q?wf3N/MC4ksaQmdvsAU2bYkRNeq/UlIlIiMXAwxcJ56AxXakUJFh2JK5I37Hf?=
 =?us-ascii?Q?xdW5yKtZEw9F1ZeXn24UkO37/vgNPNYgVQ+cjZ49MYhommUJcdy1nyweJ9hJ?=
 =?us-ascii?Q?q+wX5sEnBt1Pv3oUtvO/qXFscHsQm43RKDWEges1NkpBdRcz1J44sAyVinNB?=
 =?us-ascii?Q?tjl9jzoZ3pGJOtNDp9k0AteTtLatihx6w3DpzMvDU+wMXsNo0cCl49/ijVsY?=
 =?us-ascii?Q?rNq+AHJrNA9rL8EAMjSr95RwSXDNhUh8YbaAuDwPczjqnMh46D9FRcePZcJk?=
 =?us-ascii?Q?NMpOG158KEIdvRl6zLBS+2OmcpWObcHWxu0f75g0znveK3Q1h3Y9GpM+G8/Q?=
 =?us-ascii?Q?oCQ0AWtY5JjAK4WZ9GcdDovP0YWsfqtGC7NBcYgynE1FSyLZKaC7Wqa1tViD?=
 =?us-ascii?Q?5zctMJx1BGTimjw1yJiNHr2Ej4GoxoprEw1F9MxGJYoCc4UqJ7xl1NzfkHFP?=
 =?us-ascii?Q?mu8EJ7pbgLvfZKuTzmJQk+GPAohLsf8ZcGSnNdraPXGur4WboggE54nPHPZ9?=
 =?us-ascii?Q?5kL269lH36MN9EBtB9WBFht6xzYwOoqJSoI3a5SgGBFmzd/iPcWyDtLajgyi?=
 =?us-ascii?Q?3EHGRldBStAkJsRxnL5CR/FtLP6HZ8lSPBXr6cR5CbO+v4+84NwdH33ql30P?=
 =?us-ascii?Q?XZlmKWYzPFdgpb3WiWvj3IHZUXOgeEo97zFN/Na3Vzea4dMbXb1teGd+mBQA?=
 =?us-ascii?Q?VBj2xiYYe8rZFV8imcGWpKBYY0f8vGLt7Ihc8jiucbz/CVWSiRV4x7lylE8K?=
 =?us-ascii?Q?ppr6YU0dW/1jEY7+PNJDtAdj3QKqRUElRRhRwVQRyFfw971z1W5AyN8fukp+?=
 =?us-ascii?Q?b1ePtr8mE5h5/Kk5S94wHURVOEFsSkreh2oGGynpSjubaI0b5oPM5Sits73p?=
 =?us-ascii?Q?9E6iLOKmdcaBvPbipJWZaJlURrA8ig5WH/1dnGuhU5FqtAO3cIaM0mvu8Ot6?=
 =?us-ascii?Q?8RiVenR8hQYS2ClkET9BW6Z2Z2YD0Rtl9osRUQesyBvza3NKQu8HuqxBdPd/?=
 =?us-ascii?Q?WMNjef5hitM6UeXOpUkNCMzvGj+HkCep/C3p3PptOHW4RHnRIwxERg6VWoj2?=
 =?us-ascii?Q?rWyCSi0f2YCu7Jxja1FQhopxe3OYG07MwuISIrpUX7wdMzeJtIejKlNBgMiW?=
 =?us-ascii?Q?yL2bVla9FzYaR0x5gCaCgaUnNVg1jiCw0wjg92uCybNm7MYOkYza/vUROYde?=
 =?us-ascii?Q?ztPRsFaF6qu90crEqbqepiiXXcCBtmEEfJMcOn2mcPn4VUAmtQ+p52MJrH8r?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/SwK96PUuBi0SXcoXalY8MM3uJ8u47y+ct89Q6c17NURo5EWbVTyzSX27U0t9eqFxz69mDT7eJS1YcYylSPmFq1Wg8nyQW5Ha68fK+m5/RlYdlhNNAzgt3zUycaqiyvD+35vHK/qpemws7tqIjkLxbNZof5YpfNm0meEPwDmGXqcSHuAh2gZLzcB6qZrfJ4TNuglf5WAyVpvdfhkmv/aJh73Z9sZNrbGSMZyEG2vocrjSLDrpEoLC8hukf76IAn2HF1cW/RI9xB1Hdbv2bfyQpJJwcAwlEZN+T99rL8lrAAMQWvF+LXTnmu47tWLcIsYd+clET4L8ku/2BJ1IuNN2ivJ8+cbvwnKgMMiGpd/p8Gao4JGso++2zVOdBEZOaVOuu1rPk6N4fk6w/e56hPE795xTj74LVeP6JSjJFB9cWs8bR8LUhCLg+qXSpPinmOBZik050IF9m9gMzaPDbKHa341qugwXujWsed1e8h767nnmYws5W+2Yms0DEy6+RCnpydgzhm8ObjafBdG+ip94e3NmrFBCXtuB+g2HXdTDFk60mukIh9Wbme6ZxryNwqOfNPGpvswQfXzUURRF7u8J0cMJDKItOi/6/NONkWVIEc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53e05303-1216-45ee-b176-08ddc8504bff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 12:15:35.5242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGRRWhr3UIZSb0eNnxtI5hkmtWiXDiz1YXlowKy4QRhQjxUhnF40UdiT3rXJZC67NqeL3DSgLeyB4ipoTeNl+EG9NXf9nXMYbAfIKbQ7S3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7929
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_03,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507210108
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDEwOSBTYWx0ZWRfXyWvoT73+4uS6
 UIHUg+qoo8m1LE6REvDTA8cFZ1PjdyCpkTeQKQtv+v6SojQyDqIGHka6lusxGyD4O3cP64bGYRm
 RdeCrKblXnPbIV05AxbHYbCZ83J+PrpR6rjlTPutIk5j0QmKifyvOggIYoHb4vpkWE3QgU3GOBT
 C4iOwlT+Pdh6MNLaXPd4lLEnGs5hX3Xlkn0Mn7wEpXwHtw12TL5fou/uwcs/JrT7oF/MV0215jg
 QFOcHLF27t/k4cCRwqqEw/XEAJfMrKpYdwHWFpR3FwevWyt8C+bpMx+wPCB0kTKNzmDmMcNC5HI
 5W5hVK93FYu4HVCUdj3zZhuK14HYFdlg84B4uAnfjWDxKzw8Y/s9BQPwxiHrr3107j1WD0ORMoj
 EtSRyiCVeui1IR1fgL6lzy08gEkWjW/EikYT/qGzODrhIoWnE9YFdKFsUuoX4V6FnFbzrEXA
X-Authority-Analysis: v=2.4 cv=doDbC0g4 c=1 sm=1 tr=0 ts=687e2f6a b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=lEVoNo0Albt-7K44qIEA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:12061
X-Proofpoint-GUID: lNgYvocKS5hG26vk7_yJhp0ovW5SQmLn
X-Proofpoint-ORIG-GUID: lNgYvocKS5hG26vk7_yJhp0ovW5SQmLn

On Mon, Jul 21, 2025 at 09:10:36PM +0900, Harry Yoo wrote:
> Yeah, I only tested it on x86-64 (with 4 & 5 level paging)..
> I was unware that I was breaking x86-32.

32-bit kernels need to die...
