Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2699719309C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 15:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730215799; cv=fail; b=gOpANcDwANkALOhxmsbq2pzEKVhT1HMMtTxiYvYikgfbA1REEwycoiLTg7n/r5YzZPi9Y8DVfnBTJH46fvomAei9GD7tIV4F7Ua9kvIL8IevAUia+I6CvzTVeYKcm5EB4ZwJihsbgQ5TTXhsrCUkqO0YEVHes9x5aO/ENVXRUyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730215799; c=relaxed/simple;
	bh=ebsVAOtfF+zknVyLbxHdRTGMDUv40Jw3anZUeOESJ4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CX5TRgbKxTHbpd70b1OoIj5GShVImlYfMrt7r9Y87cSOzjldR9lXpPKQaswLhWd0ter4WReqK5rxNsvzxKK8170xKemu7v1vze7CVniMBEVo78RH6ayvJ/8s3jvSV5dMQ9OIgzZrLTktzrYVC+tUJyFXgLDmKZXsQ0vohwC+TMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Bfm4NOJ8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ODUFAYOj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Bfm4NOJ8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ODUFAYOj"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49TEtalS013733;
	Tue, 29 Oct 2024 15:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=/AlegiLRRifyms9ZK5
	PQJE2z91ux/Bys2B6ZvAgj8zo=; b=Bfm4NOJ8xdufLcpXunPdbjoS7v8g495h3f
	lNkan2JtNKicweTSmx2Evhru6DVufxsWrXlzjjvmcOkpklUfejpL57hp6e7zMc3w
	e5WzdkKwI8q+1Zyb3GHEeHtvsuUKUAdi1XLj7bql28bzByygPE84LqDtFrkrnNij
	N6OuxrPxexjhxq55fyJOI9ALUKbxonAx9FSbMDwPvyTHCh18atVuEqBSKzoK5qG/
	5w6S4E8qtBNGBt7EvTaugbJn5wNh3GvCHw4/z6l1xc57vmskYDQFqaUazLML4EyR
	S/FYACimDK6iHxc8i2Wcht65vbN6wzg88+17XnIeZjHA1E8yc1Kg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgmdvda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Oct 2024 15:29:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49TEQQt9008740;
	Tue, 29 Oct 2024 15:29:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hne9t9aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Oct 2024 15:29:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKO3PSQDrXsoiGdOTcLmnBZu4p5gadRrcl3QK9CYVuoXIoQl7x7h4RFGXgdmk4V07p6IKyFw2liyQJfGtWW71sNc9h/8A14JwNZbRuvnGqXFViCAKuCmxjuVEsOnOmFX+L3qb8Mmfzn2gvTgG57ykfBMJYutElQdNA6TYcHZJrXtH2s7tpHsxjzpEQECqX6NM8zevrNQFPMFJkNmL/4xh23AQUvBPrQORp9ia1ZiYjge7ZaQw6X4h5jAYVERXSNraN6e1rWjY0+7QCGp+fC3EkONYKLanMJQhyI/A9hnhTaA647cRpkuVkImP97yyBrgEvlecDV+AzRX+QPFFZb6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AlegiLRRifyms9ZK5PQJE2z91ux/Bys2B6ZvAgj8zo=;
 b=Syv+sSNTirlOEMDM6jQA2fx7d8JL4P/V/5t7GVYBTX1M12N1Ac8emmg77+eQIXCRlb45eIFHWw7B2I2qP1uMzLsH2LJAAolOR3S81NuT0EolvQ7P8PYwUALp3Nc1DDALUo0+Yg8ap6oqU7XpoC6HK4VhLtrHkwXw2oJHW+XoW31p8kMHdID+NNQv3jAXVP57lI+Cp4DVlf8B7IRMjbKgXL34VFKWXLheEE3LT6bTQw397FrI7BckilSwPwvJEIMEyH3cmwc9y4NTul0p3Ha4LpxE84AfFr84NWMk8iFopaVj13Tit6+CoTE7UjfS37PVu/yvZdP+V+nFzs6YxB0agA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AlegiLRRifyms9ZK5PQJE2z91ux/Bys2B6ZvAgj8zo=;
 b=ODUFAYOjIeQacTr6QA478UrNC7lC48OE2BRHFEsdBJXRzfjFAxfEV1TLfsPjP8GUGBqvZkgs4Qxq2rfZ8401uRam0l8SZd7cQvKOpYQqzN6HuyvSgCmhl/PjOXqyrT9abdhNL1WbDqaJxcFaVr2rDd/OZVTM1Bw09zx1KcTuJCc=
Received: from LV8PR10MB7943.namprd10.prod.outlook.com (2603:10b6:408:1f9::22)
 by DM4PR10MB6016.namprd10.prod.outlook.com (2603:10b6:8:ab::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.27; Tue, 29 Oct 2024 15:29:43 +0000
Received: from LV8PR10MB7943.namprd10.prod.outlook.com
 ([fe80::a8ec:6b6b:e1a:782d]) by LV8PR10MB7943.namprd10.prod.outlook.com
 ([fe80::a8ec:6b6b:e1a:782d%4]) with mapi id 15.20.8114.015; Tue, 29 Oct 2024
 15:29:43 +0000
Date: Tue, 29 Oct 2024 11:29:39 -0400
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: kernel test robot <lkp@intel.com>, akpm@linux-foundation.org,
        oe-kbuild-all@lists.linux.dev, maple-tree@lists.infradead.org,
        linux-mm@kvack.org, Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH v4 5/5] maple_tree: add a test checking storing null
Message-ID: <jzmsbn7iabvfmsjzjowmmccv2ou54uyyiuxmb3jxdgcc2zpd4m@7olpq7oacxkj>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Wei Yang <richard.weiyang@gmail.com>, kernel test robot <lkp@intel.com>, akpm@linux-foundation.org, 
	oe-kbuild-all@lists.linux.dev, maple-tree@lists.infradead.org, linux-mm@kvack.org, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
References: <20241019023716.4516-6-richard.weiyang@gmail.com>
 <202410230105.UApdwd9S-lkp@intel.com>
 <20241022233247.htf7diduw2ojce2p@master>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022233247.htf7diduw2ojce2p@master>
User-Agent: NeoMutt/20240425
X-ClientProxiedBy: YT3PR01CA0138.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::25) To LV8PR10MB7943.namprd10.prod.outlook.com
 (2603:10b6:408:1f9::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR10MB7943:EE_|DM4PR10MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: a9caf7d7-234d-40ec-9c8c-08dcf82e820d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nEojvG/MFJlu5WPSXkZbTGRPZafgtPWIVLMGxHXaQWIbb3blzrYdobxqgtMn?=
 =?us-ascii?Q?h4JsgVZkXjnSKLV8itso8HaGT/x7OA5p0Izm7UVD1OQBbg0pCM5C4svwVNNg?=
 =?us-ascii?Q?sZN506/b4ALUBifocGcTpUrLpemGa9L/fuWjId2gJYd2jG1APQiA7oPqfMSX?=
 =?us-ascii?Q?CZQUZE+Gzw0jmbNg5wQkWsxGNpU8EVqsFLHonkFb7RrvWn1v83LdwzuBcLjv?=
 =?us-ascii?Q?dxBgO4uemG5WMb9+agE/3Hzr4PLC4d+LNIsrtP4tCN3hkjpS8vyB7mmPDUM6?=
 =?us-ascii?Q?LP82+365WNZp8QPhypf8WiUipc3mAVV4ncE1k9jfxXht/5uvJZmlZyxdlXks?=
 =?us-ascii?Q?VtC7i5cXoACDpkOAOwKBRDlx7vsnZ+uIl1RBvZAtWTOsB9JbhnIzHlwB53rb?=
 =?us-ascii?Q?ItJWvNl9JEcB8sB5eYmFys45D0soj0ClMGr5On3U6WLssQMObzCIP8boojGH?=
 =?us-ascii?Q?r69SsLxPbgiSFYIWQUrDUfDKIM2oAaeutorrtc3MkhfMG+ASw48+Mh6wpIrN?=
 =?us-ascii?Q?SvF8UYQNorgokM2N0h7AqVagZfzqcLoI0B6/b0e2S1kmsKI+L5piuB7lWAUm?=
 =?us-ascii?Q?pRJw+IV3Xuh3rykJDlFEDljC5EoOVN/7YVBMH7k3xyG8p8WxPY5Iulv3lZDp?=
 =?us-ascii?Q?+XxDgNbJ5owMiqJKGWDyg/gVnWh9+MufsDjUEs9ptsvz8dsma4X5TlKdPlef?=
 =?us-ascii?Q?85qiLYq6jcBnH9tIkhbt37zP/iTFvdgTeoQ+wCkLDaZgyicum4NltNZv8V1K?=
 =?us-ascii?Q?RP74wAX6gT1bGDEBF2WtN+9kN8AQNdjL7d07AUK44vgonty+qD8aXP+bWLxy?=
 =?us-ascii?Q?UsFUWXeKid6vUikQwKExrNflgZZsUfYFseVQvZ7GgOLf22Iiy3gcFOpN6RME?=
 =?us-ascii?Q?MBSEM+il6ixJxSCYdCBBwzbz/W8XYbqhG5w0wYtl/3eoQqnr3L7izW0CF3q3?=
 =?us-ascii?Q?+V6AEA6MHDwOeaFx0nFFFFgA4Ti7YN4Cd+LIq41cvU0XvEdkqt7O+NkxH3si?=
 =?us-ascii?Q?ryZVYl+n/wfC2Lthsfya5sNxPiYFNBQ5zCtMFzgQ7B+v9PfaW9Iok5BL2Q8k?=
 =?us-ascii?Q?z2AuJrhNa57gEZ1OZst577YsTSZqMPiudSUA3Son9U3+bjwomZEHKq1YJKlW?=
 =?us-ascii?Q?6M76kEF4PirnuAIblRnYQeK1qaylRFxCxyNDhHs80oO7lKj215EOBY1KZ/UB?=
 =?us-ascii?Q?EE6bevi9zLEHhJdA1hIpYKr9dcy4kCr+cYCvXm2UbkKPouKehh5bKS6lnzRe?=
 =?us-ascii?Q?U99eCgwsNw6Jx5Y7AXOG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR10MB7943.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9s5WP/ez9wfc1/I3OFzLHsnHoRoA8mSZZOynOHtJxMnGqm98IIsFuEz4A4Qh?=
 =?us-ascii?Q?ltZe/gxZmqkr8N8tpnqY+uRw+zgUN6FwF1W8WHVZ6UsRqo11Yn2ZAB/fMvm7?=
 =?us-ascii?Q?JQ+QkjboOiA3k8X6jhTaCVXV+37mlxWnNicXwn3+zdt4dmSBqpRwVHNTwycd?=
 =?us-ascii?Q?telnW5tsIKXajnuB0Q/CeoNYgJLYae7r9Oc5T77tlEd/Qjlm8oSwNDU7k5M7?=
 =?us-ascii?Q?VA/xKygERVxkVnMsVHJpnEMAXp86ge+qQ0tQn5eQ14tKDOgMXnZns+WB+Scu?=
 =?us-ascii?Q?dFiXFdyl262A2tCdZKNjjr2PpLpuPfuO5b79Vf1IdH4XRSayC5UsGwL5Kr+P?=
 =?us-ascii?Q?QJ8tNUXPMvkBJJP6XOihIb3AEX9X4LpDc53RWcFiXRRkPsQW0HHCKxfAzKts?=
 =?us-ascii?Q?mEGvahkTOI1o0SJtRX0H7HLlWbZzajau8siH309OZMsUWnpHBlPQ79tK10Zn?=
 =?us-ascii?Q?g6u1xvpNl/cLdBfOP66uSoJ5mb7y1RL+uHh5UCWMWSlTgJQmbOCmjOBhPBdE?=
 =?us-ascii?Q?M5qBMaHC3cviHdmRfPPjnjBtlR7tAl/ut06DNbfUxpfBIM4wze+Nf60cSKBm?=
 =?us-ascii?Q?QK4G3mP57Wg0OEHXTgYLdQtjipmgtj6UI6BXkZJy55GxVH0MUj6CspBgAm0C?=
 =?us-ascii?Q?HW8FScgWYZgl4TfLew6OqQKI3UiwD0Zm0xoNxnBSplf7rolQ6TeL+Qi1ylXg?=
 =?us-ascii?Q?LH+hdxf6tYbdqHurq5igt2D/8mbLj9CQdSc7j8WO8yEZjXhKIDwEY6a/e6Lz?=
 =?us-ascii?Q?48tWkiBl1H/4LGE41mEt/BBUlTdFIwrCbwrmwzukpKvUbpu3tL7uO4mfxkKb?=
 =?us-ascii?Q?H2GwMMRp4Jgc20sdVdIokBW0BT9M6eM9vJNEB2lZjcZmHC09ey74PClfMvs8?=
 =?us-ascii?Q?nWzkWYBO9+IPLhfFGbor8xg2EpwBiKE2i0Z/wYfnrivU7KSVABsXc2YA4qyF?=
 =?us-ascii?Q?gEQcqenWU0IRiqNcpDoHE9qhE3YERSusIxHa+V0ilYQUV5YuIEv8hhUHwkWj?=
 =?us-ascii?Q?hj3MY3pAef8EcmlHEJBgAfk9NdXqREgZ+jMyAZ935Ussh0H4pYse+iHfJGwb?=
 =?us-ascii?Q?XYU28gt6Pp6bOaTiWBBCsvQH4++fWvLm/XO+Zt7z/xQ7PryDFwtxvRyxTdt4?=
 =?us-ascii?Q?duc+bZT1ceado2leAAzom5Mebl2sHS4VXONT/sxzAikznko0mOHJe/p/tsSF?=
 =?us-ascii?Q?Hs/vZeVcoTUxkwxnsAGJ4TEbPkxnrt/gsdmTtWUce5noh+Gx1f60VNAfpx5r?=
 =?us-ascii?Q?fKJPTkxKi0DVzMOHHqZwwuIFHN4kxOS0GFSWFQC62DBmjmmvUp6d7aaek3hy?=
 =?us-ascii?Q?4zfVT0crJqHg0HW8TtR3XooVDfKBwVsMjqTIdD+ghuRTHwpIKIluCgA1+QFe?=
 =?us-ascii?Q?Ett4GeJ5KyH+xbkesoYTpm+UOUMKQl1ttHRpWeqZQbCpc2auB9+hrF9zmw6P?=
 =?us-ascii?Q?R2csS97L2db5yoXMBpMCVv8cXUdtBAe5m276HkqAzKHZxHMViahhqi05SvAR?=
 =?us-ascii?Q?EDyUCKqIDTKnlEDrdR76cpyuJMywvbp6OxLhfhWmVLXv5G6YIqkTkWnD+2jg?=
 =?us-ascii?Q?CxHCT+Dkfnq5AftwLzL817IaPlJ6Du3K3Pz73pDuE563wkOn6dRp/D+Kz1y5?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6KcEyBfvm9Wk7x89ugyEbSyAZ7r0+E3UMZhgv9dKZfjpR6PeoqoRfGHxSMIoiDBgfp0FzDKoZd4YM8WcMRlSdL8mVpExccF8t4PVIZlRl8LaMT1PQaALLw8VWgNpGhulJDJrDPHpbCJzBR3u1ciL1OEocYtb6jYtZkgYvpf1N17N/e8lhVS0QaW/gRadhbvPauFZZFQar1kwLj2M6bxad2tYmRt+BbFGPrryG1hST2qltZYr9S4D7X9ZdO9uFg0QvLXMxwdKFeoj+5lSKK8WlG8LSQWUOpFj4SZPOa462y2TvcsxV48nguyPQqRfGn6D2C/iDQFtr0K9lYsic3aerPmDaRhb9foyyGY1oEy8G2IV1aLD16dEI4GRDkLZC84Xw00WFr1LcFHVQ67ZynlKL74In3tF6bYAoezLi+U3gv9/LIqSdbzKP4KZo0y/Z1mr4mrBvIAiwes66L8oiKdT9VW8I+qAC5CnozPHAov4BBCLESyEq59JJOmKnvr97B78OF8kIkIIoPaZq++K7nkwilkvu6c1D8N2HbWKLx/Vz5pkz9oinLqol2Jl6/1+suTfPsayUFMN9kL61K1G6Bw7HrdHSmHv+HnRype0oostGzQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9caf7d7-234d-40ec-9c8c-08dcf82e820d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR10MB7943.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:29:43.0688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYClWN+7L6KbRgRiwVIq9iWk/bcjDpGoF795xKgdRQFJpEt6ZUrD2JDdtyzNODK7T/U37YC5JYzt+Y2qKTAuVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6016
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_10,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410290118
X-Proofpoint-GUID: bg9WPxEEE84fAAKv4r0A__NbRprfC5j6
X-Proofpoint-ORIG-GUID: bg9WPxEEE84fAAKv4r0A__NbRprfC5j6

* Wei Yang <richard.weiyang@gmail.com> [241022 19:32]:
> On Wed, Oct 23, 2024 at 01:37:50AM +0800, kernel test robot wrote:
> >Hi Wei,
> >
> >kernel test robot noticed the following build warnings:
> >
> >[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
> >[also build test WARNING on akpm-mm/mm-everything linus/master v6.12-rc4 next-20241022]
> >[If your patch is applied to the wrong git tree, kindly drop us a note.
> >And when submitting patch, we suggest to use '--base' as documented in
> >https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> >url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/maple_tree-print-empty-for-an-empty-tree-on-mt_dump/20241019-103832
> >base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> >patch link:    https://lore.kernel.org/r/20241019023716.4516-6-richard.weiyang%40gmail.com
> >patch subject: [PATCH v4 5/5] maple_tree: add a test checking storing null
> >config: x86_64-randconfig-123-20241022 (https://download.01.org/0day-ci/archive/20241023/202410230105.UApdwd9S-lkp@intel.com/config)
> >compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> >reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410230105.UApdwd9S-lkp@intel.com/reproduce)
> >
> >If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >the same patch/commit), kindly add following tags
> >| Reported-by: kernel test robot <lkp@intel.com>
> >| Closes: https://lore.kernel.org/oe-kbuild-all/202410230105.UApdwd9S-lkp@intel.com/
> >
> >sparse warnings: (new ones prefixed by >>)
> >>> lib/test_maple_tree.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
> >   lib/test_maple_tree.c:1456:9: sparse:     expected void const *entry
> >   lib/test_maple_tree.c:1456:9: sparse:     got void [noderef] __rcu *ma_root
> >>> lib/test_maple_tree.c:1456:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
> >   lib/test_maple_tree.c:1456:9: sparse:     expected void const *entry
> >   lib/test_maple_tree.c:1456:9: sparse:     got void [noderef] __rcu *ma_root
> >   lib/test_maple_tree.c:1468:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
> >   lib/test_maple_tree.c:1468:9: sparse:     expected void const *entry
> >   lib/test_maple_tree.c:1468:9: sparse:     got void [noderef] __rcu *ma_root
> >   lib/test_maple_tree.c:1468:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *entry @@     got void [noderef] __rcu *ma_root @@
> >   lib/test_maple_tree.c:1468:9: sparse:     expected void const *entry
> >   lib/test_maple_tree.c:1468:9: sparse:     got void [noderef] __rcu *ma_root
> >
> >vim +1456 lib/test_maple_tree.c
> >
> >  1389	
> >  1390	static noinline void __init check_store_null(struct maple_tree *mt)
> >  1391	{
> >  1392		MA_STATE(mas, mt, 0, ULONG_MAX);
> >  1393	
> >  1394		/*
> >  1395		 * Store NULL at range [0, ULONG_MAX] to an empty tree should result
> >  1396		 * in an empty tree
> >  1397		 */
> >  1398		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
> >  1399		mas_lock(&mas);
> >  1400		mas_store_gfp(&mas, NULL, GFP_KERNEL);
> >  1401		MT_BUG_ON(mt, !mtree_empty(mt));
> >  1402		mas_unlock(&mas);
> >  1403		mtree_destroy(mt);
> >  1404	
> >  1405		/*
> >  1406		 * Store NULL at any range to an empty tree should result in an empty
> >  1407		 * tree
> >  1408		 */
> >  1409		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
> >  1410		mas_lock(&mas);
> >  1411		mas_set_range(&mas, 3, 10);
> >  1412		mas_store_gfp(&mas, NULL, GFP_KERNEL);
> >  1413		MT_BUG_ON(mt, !mtree_empty(mt));
> >  1414		mas_unlock(&mas);
> >  1415		mtree_destroy(mt);
> >  1416	
> >  1417		/*
> >  1418		 * Store NULL at range [0, ULONG_MAX] to a single entry tree should
> >  1419		 * result in an empty tree
> >  1420		 */
> >  1421		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
> >  1422		mas_lock(&mas);
> >  1423		mas_set(&mas, 0);
> >  1424		mas_store_gfp(&mas, &mas, GFP_KERNEL);
> >  1425		mas_set_range(&mas, 0, ULONG_MAX);
> >  1426		mas_store_gfp(&mas, NULL, GFP_KERNEL);
> >  1427		MT_BUG_ON(mt, !mtree_empty(mt));
> >  1428		mas_unlock(&mas);
> >  1429		mtree_destroy(mt);
> >  1430	
> >  1431		/*
> >  1432		 * Store NULL at range [0, n] to a single entry tree should
> >  1433		 * result in an empty tree
> >  1434		 */
> >  1435		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
> >  1436		mas_lock(&mas);
> >  1437		mas_set(&mas, 0);
> >  1438		mas_store_gfp(&mas, &mas, GFP_KERNEL);
> >  1439		mas_set_range(&mas, 0, 5);
> >  1440		mas_store_gfp(&mas, NULL, GFP_KERNEL);
> >  1441		MT_BUG_ON(mt, !mtree_empty(mt));
> >  1442		mas_unlock(&mas);
> >  1443		mtree_destroy(mt);
> >  1444	
> >  1445		/*
> >  1446		 * Store NULL at range [m, n] where m > 0 to a single entry tree
> >  1447		 * should still be a single entry tree
> >  1448		 */
> >  1449		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
> >  1450		mas_lock(&mas);
> >  1451		mas_set(&mas, 0);
> >  1452		mas_store_gfp(&mas, &mas, GFP_KERNEL);
> >  1453		mas_set_range(&mas, 2, 5);
> >  1454		mas_store_gfp(&mas, NULL, GFP_KERNEL);
> >  1455		MT_BUG_ON(mt, mtree_empty(mt));
> >> 1456		MT_BUG_ON(mt, xa_is_node(mt->ma_root));
> 
> Thanks.
> 
> Will fix it to xa_is_node(mas_root(&mas)) in next version.

By the looks of the bot output, there are quite a lot of existing cases
of this in the test code.

> 
> 
> >  1457		mas_unlock(&mas);
> >  1458		mtree_destroy(mt);
> >  1459	
> >  1460		/*
> >  1461		 * Store NULL at range [0, ULONG_MAX] to a tree with node should
> >  1462		 * result in an empty tree
> >  1463		 */
> >  1464		mt_init_flags(mt, MT_FLAGS_ALLOC_RANGE);
> >  1465		mas_lock(&mas);
> >  1466		mas_set_range(&mas, 1, 3);
> >  1467		mas_store_gfp(&mas, &mas, GFP_KERNEL);
> >  1468		MT_BUG_ON(mt, !xa_is_node(mt->ma_root));
> >  1469		mas_set_range(&mas, 0, ULONG_MAX);
> >  1470		mas_store_gfp(&mas, NULL, GFP_KERNEL);
> >  1471		MT_BUG_ON(mt, !mtree_empty(mt));
> >  1472		mas_unlock(&mas);
> >  1473		mtree_destroy(mt);
> >  1474	}
> >  1475	
> >
> >-- 
> >0-DAY CI Kernel Test Service
> >https://github.com/intel/lkp-tests/wiki
> 
> -- 
> Wei Yang
> Help you, Help me
