Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387A94B8139
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 10:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868291; cv=fail; b=qx6BE7qxzrJ5H9gFg5TrffWV4jEHTeOZ6zz/ZLwxfZEZ5W5KUktI89UlmDw0YAjNtZ2Yuvq54kxftfzxCkmZ5/zN+5xfxHNdHNMApmObyYU45OMF+WWFTtmK3H2rrLGPgYOZRjnGZc8ZiwJ1MQS71I+ye6rUyf3uq7BEexyGKxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868291; c=relaxed/simple;
	bh=2dwAlGpaMZ7x+I0AcatDD7D6I+qzCsL8IsF+yX0evi4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EHf/6CiRHwtAJtkZaovi6I99egkr9wGLAxMX5R/IHZmp/6JqV+B0P7UpJSkCEPD4n9z3a9qZurkwU1xX1cY+3DymmGU7MrkLcXtqf1jt8ozh66P6Ek0Y1/XNRsAcvLLQwd85VfUcVWG8qwLi4Rbaz7RrDtjT9aYVZ37kmZK+6ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gk8gMGq1; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gk8gMGq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767868288; x=1799404288;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2dwAlGpaMZ7x+I0AcatDD7D6I+qzCsL8IsF+yX0evi4=;
  b=Gk8gMGq1pqs+j3gMmV20PTKaAEgTzaVIrJLeJrGESOl+En0mAEZ7GxXu
   3jkp+50qWq13kGmCqcT6MMVKs1M29TRU3v9NbdvqZQHih3t2wjtsLY+8N
   tk6ShhS6vWoIDPqX1zjkGt55U8CD6QJ+0bUUqg7OAhrdlg/gZgc23ZacG
   UuWwiBy8DtqrV2f/JkVsD4gM/GusmOyzOQW39q3wy1aCRDwV5+6LOmKus
   MpMyj7C9CcXhgdmH3j8KKreCqXDnWivYyzAh3uQOuNFMM+D23Zz1tTNn+
   X9OsE92LVFEVKsfq/gVy/pQCvMw+PvTadWQB6czgXEbLaHk6e/iWU4xby
   g==;
X-CSE-ConnectionGUID: 5pic6p4xQUih/YYyOkHXlA==
X-CSE-MsgGUID: px+I6GsFSDyf0IjPJOrHRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="94711892"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="94711892"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 02:31:26 -0800
X-CSE-ConnectionGUID: 0KHWxcxiS1mmy0CVzLR7Qw==
X-CSE-MsgGUID: ovzR1BS8TmSjSKWzWRb5YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="202377912"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 02:31:26 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 02:31:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 02:31:25 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 02:31:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTKwKvVakhd9BbKTFPPxylLz6HKtfIPzOKIOIr/XxZuPEzoaMaAZRkKQc1ETrRbrSFLUolNSa6itwBKFOYnafm3koAeIm8fObE4LxQpzk88AMbUETlcVgkIWrhDIDB9vu8N0foa9VrtrZgPQijoMFMjrmaSjj00x9tZC8/wdw+G7hcI6xasys8Si58haTB2U7hqI6Am2hgbXt5ynTPeM/OlvJ673FfGZVpPI15ePAliJ2FbTtNg++ACAEZZ4Z1LaVVr7N0xF5tLTG0INZlu1HC0OQh8HaNnaluQY6OHX7n3TkPFX/EjK9SzDMQAY2QWJH+HJxm3+sCGWR4j3VDE6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NdnnXnGdkmYkTzoxhNlstb+Y2PgKonoVkikHLXjO8J8=;
 b=kNYi86Gr/dIXl5qH8B9C99OLlKoRuvef3QepoQD38c9gWeJplPrykKJ1Q+sPcg62YVtV8xkg9EBszQkIvllhdvFKTxX8/WeiQvFqdVFctrHcvrRmXnvls9d73M/cFSdY6IAuF9ubsgJTTNwB3a8iUZ7xA4y3jrQIr1z8kLXYaU9UY85ASwRP8u+zsF+I3mjENYMBQlLt6d1ftDH7uSdQtqeoLItSY5CQuFvpfTC1/t5Z0e9PnHmgMkGN8DS23Db/btt2SdWSnlmqIahs8Iz+KJsEOH4orY3YviqjaS9VeuQsWyM4FA+zGnkaqWupvGBS5ib/5AvCsTcyMHHpdvF2MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by SA2PR11MB4858.namprd11.prod.outlook.com (2603:10b6:806:f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 10:31:18 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 10:31:18 +0000
Date: Thu, 8 Jan 2026 18:31:10 +0800
From: Philip Li <philip.li@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [ardb:x86-pie-v3 18/19] ld: vmlinux.o: relocation R_X86_64_32S
 against `.rodata.str1.8' can not be used when making a PIE object; recompile
 with -fPIE
Message-ID: <aV+HboykUV1ac4Oo@rli9-mobl>
References: <202601011320.wfOmjyKl-lkp@intel.com>
 <CAMj1kXH8L19zFLnM26JnBKJ5pbqp0-igOn095NTtW8ji0UAbbQ@mail.gmail.com>
 <CAMj1kXF4kfpvzT+-GzLFBNBb=aTN8Km0tumTm2Kw9zbu4iRuVg@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMj1kXF4kfpvzT+-GzLFBNBb=aTN8Km0tumTm2Kw9zbu4iRuVg@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|SA2PR11MB4858:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d3eaf5-b2bb-47ed-ed50-08de4ea10ed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ga0M5CZbRsEcKVJ0MyBd3TZIgSX0g96szHQ8Z1YvX12JOne+/oOzKlDCGjEi?=
 =?us-ascii?Q?c15nyuKkXd5i3aZwccPbiZcNHJT7/96Y5zbAQY+kNL4P73CH/FUbzCej87LI?=
 =?us-ascii?Q?41N8EgTKXo9mS614uLyC4ZZ1iCZEZKubBRJ9dxCCnrlYobdYC/jjUA543cFK?=
 =?us-ascii?Q?D0qyHtScAoeu6ueJizT4WBj4s5cye+F4qQbdPXfByAtTnYsIaB9x5UDDnJwJ?=
 =?us-ascii?Q?trhX530rPvb6nGr77vNJJ+Ck5l8x/oIUddvlYDz3njydLAvb5Z6lx40u8A2a?=
 =?us-ascii?Q?yl4ERw7miLE4EOH4ttf8YzehdxM2sPcfpLhSRwV40ChfjLRS2BIw44j40Vwo?=
 =?us-ascii?Q?vUoYpiUgj6riy5whb1OoQCLOSfEeH7TwaK0RhYQ/5g9kqM7pJR6qrDybiW0B?=
 =?us-ascii?Q?240ryCOyghLPCdI8L5koX/KzAJZRoKK4cgLeYivarvx2/UVlsTsYALKODEbQ?=
 =?us-ascii?Q?ntxWkxqNgF/djWfIR0lO1eaoCkN8tZNXWwfDId2HswRx292QysjkPAuYKWfA?=
 =?us-ascii?Q?jPXonQQfdLc8O455qZvO5Qd0Cpg1yNrAR5s1cPr+St+wvdzDKzmhsHEOIfkR?=
 =?us-ascii?Q?ztsf9W25ulrIW3UWaO71tfFHbGHtSqJu5T1clk7G2yr8dIZwvctI0+yv/PMg?=
 =?us-ascii?Q?JNfimyuFHLdFP2y9xM472RTEAF+WBmffcu/BMMqXyom6BbtTU2abS1L8AAUi?=
 =?us-ascii?Q?2VZBNanks8DQkdQDgfFHBYB91N4hwsAb0WCpY1lrimw72EN9YXM7pssLGzXD?=
 =?us-ascii?Q?KR25yX179BVzuUkK3y7BfS/6dFbKoqCcVYsybyF9JB4eW1QUEjEMxZ3skYpi?=
 =?us-ascii?Q?swAZsQixhWllcmw2wAz2slmyNCGOdBtdJ/xW948ae8d9yZ0DTrmTVy1dtYNJ?=
 =?us-ascii?Q?uWl8VTLGxevEALFVZ9vihNce82umDD7XXrFvh8tkc5YlJ1RPES0t5ete0O1C?=
 =?us-ascii?Q?e4pHsaaB7hR0OY4TLrbc7EX8f4cg5pXwtcEpjJQBpwCC2ItAq+Nl3uecIsIy?=
 =?us-ascii?Q?gp0w3PVXRdz6+Sq3gS+jJDgNJq55Z0Ej/Q4jjJYzihD5HGVT43IKWujF6J0W?=
 =?us-ascii?Q?FcF+hPsDimKV4VEYI1yIwVoLJ9OzTN7gg584rmKf1ibVISZ88eETKra82o3e?=
 =?us-ascii?Q?3Hw5uoa+LcsIvAVm+KU3fdUvfxxM+gj7qyGP9+m3KIYG1fhgEqg6GcOu1J7f?=
 =?us-ascii?Q?NosSIF/8Il77ureMH/sKrfmAhtqiH2ahpqmN3pMSBfP0IRjrS8a0IgvcZgjs?=
 =?us-ascii?Q?0fW2eTfK5ENay7pub4fGYCQBUFkS0dYm0pbIOQjMzCdsHB6oz9oBIKf0qNcN?=
 =?us-ascii?Q?/vR5tsmmr8uVzoAEepPxDvDhil8GYU94OFecpMICqgviuUdmJu+6bBT1oSfO?=
 =?us-ascii?Q?bOCsOODa9GJcersICF5ALA14/ss+pxMgvVMkslOK4fxF88iVfa63Tsgq4QZi?=
 =?us-ascii?Q?hTdkbUMqsdq/zc4gkJsKdh1ZoGNTH8Og6oUvwwakZI3eb6/9UmUkqg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5+I4JMUh/KUaanFlYRAAfdKWg+bkgTNaeF3I8+4jp/CIcRnHbfbNlSix5WYG?=
 =?us-ascii?Q?l0ZQ37iivIuZPiTztSMM98qANEAMuHQfOUqcG3scvqTE2rywJchuRGFKGHnC?=
 =?us-ascii?Q?HJI6/1gM7iAKNZtSZ38ZqSB60PNFx3WPAUvp8kMmgepjGKkst3au4h+L6Zg9?=
 =?us-ascii?Q?QeH/4oyicAh0PU2mbd2u/NaLTfMGO7hw5F6B1lv6nVQEjFgTfP4cVhVS5/va?=
 =?us-ascii?Q?9VMzl/1atBoWmw1t3UAJWNe+zrauJaV+2hMItXunEKBo2Xkm6uqZjy0B7347?=
 =?us-ascii?Q?oBETyq4z2VQ3FE4/V30FPOSdhfN/MfnOqbgCNxwzYRdRZmjiaSP9D2J2zrfj?=
 =?us-ascii?Q?p6SigGxr+aVSDDjQteoBgU7C9yMnD9Bq/jqWjiM5ddlr53Ky+1l1iesshdsY?=
 =?us-ascii?Q?3b28IBbmJ/2zuSNha06VbJLoHJJEWPdfbdCEhErzIz0O9lTGvrxan82y3q5w?=
 =?us-ascii?Q?Y4BBRYthAAVtrZdJQVNd0XmsR4OQZ2jyvEa8VnhQxvIIciOEDzqWbTkcTJ8q?=
 =?us-ascii?Q?9BFxiL6SdD4qAq/aJWaz9BnemgkUP8VO46gGwvrlwintgggyYAX8mp5gUtxd?=
 =?us-ascii?Q?09sRzQ7kGXDn+Oc+s6MSW0KR/x1ag8md1bQaXpV/YFKqbNcWyBxJ+RZI1tjh?=
 =?us-ascii?Q?SVGp3mx7sDTWzxtT3TA7BfU0c/KmoX2Yr9qmO77rgU9VkxRZB3MjQZYpcxkH?=
 =?us-ascii?Q?mIThW8MlVIwaKlTNJKjxex35pQfku/A92TL5++q/NIzxzwAf4myB8f/Jfrev?=
 =?us-ascii?Q?+LSiErLSM30qWo78mloMfQdVf94wkdodY1PRKm7ZJq2QYV18D5qxJWAo+FVh?=
 =?us-ascii?Q?HLiUe+PaGLpwDd2lWPZhDf0RiKXrfb5zYLXl+ahO+jibdehXplcRuuOebiZl?=
 =?us-ascii?Q?3a9kx6FM+kvx31Z+rgGHzdc7kfyoV3caK/uI2zUkn8l9JDljhPN5OOzpdrnN?=
 =?us-ascii?Q?Dmwk3BePfp2mvv3jIQJzx3HrPIhoXrztoG1ZLvDJshTVsrkRtaeU8uXDz1E2?=
 =?us-ascii?Q?NaOIu4pVxxAOb0ZEaxKVgYRS0qra7jQ0CJWSngRZNA/c7IbBj9T/j7XxIWBX?=
 =?us-ascii?Q?yDE54/om/Tph8iG+okL8Tm7nYFQFifap/V+T98Gpsv9KqIGELZ9jWqSbMlFH?=
 =?us-ascii?Q?0U63imqNMI9tX8mIzibM8uN8ZJDr1YC4fFOEON7buf0o3AbLiNXMGGSHzOIs?=
 =?us-ascii?Q?e9Aj5aju4IllJdCJagLjVNRBUSS/QSS+iV2oAdPMBnYKpJk9+gHrJgCZIJdQ?=
 =?us-ascii?Q?rotJ+bxUUqqKnKuAxZ4JzNZLIfTro4+yx7Brxo2fdmvSh+IgbTRqWl3ACe/4?=
 =?us-ascii?Q?6K7tWogA+bLy+q1FxlRVftZXJuZ6PIVvkWbu2SSTno2STvsSBPtVU26x/2iV?=
 =?us-ascii?Q?PQXJ8xT+KrfLo6ggoadixEcQ9Uv3aNwiIgAFQveDakdFNLOMeokMd8IEMBvm?=
 =?us-ascii?Q?AGVSwh84VF0C4GyBoyYF+vfqJXUtqD+oHI2RvWnTwwd0k31ya/MAyLyFzHcb?=
 =?us-ascii?Q?FTH5Gqrhm4U5Hyxb/Mxk7lstJl4BpPWd/n17IT8/9uL6rIAUqp38KMELisYO?=
 =?us-ascii?Q?2Q/2pwBBMZUXevSTBXGtq6IAoCbYHIvrHzfdKKW2CBdE6sJdlMDDDSbrJP/O?=
 =?us-ascii?Q?WYMKceuA1RWNKzeJpJ2zet6s5BeC8BgegPm6E3T2/ydI+AqM7XNT9I42HKmd?=
 =?us-ascii?Q?iD0ieuUVNuOiX2G6JiRO/XL+roO71uJ4uGKHNE2ZA6fNj7pPgI22xVqiPUVE?=
 =?us-ascii?Q?jooUMybohg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d3eaf5-b2bb-47ed-ed50-08de4ea10ed8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 10:31:18.2159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NgoA+h2wjUZhrep/qPi3O2zWoD3hhgi1iECxT23GZwD+/6yLvUKJL936iigUAc7G/qj47Nz0bx6TobNVv4a27w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4858
X-OriginatorOrg: intel.com

On Thu, Jan 08, 2026 at 11:25:42AM +0100, Ard Biesheuvel wrote:
> On Thu, 1 Jan 2026 at 17:03, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > This does not reproduce. Where are the build artifacts?
> >
> 
> I kindly ask again: where can I see the build artifacts that produced
> this error?

Sorry for not responding in time, we just start the investigation. So far,
it found the internal build has set below extra flags for x86_64, which probably
leads to this issue.

	KBUILD_CFLAGS_KERNEL=" -falign-functions=64"  KBUILD_CFLAGS_MODULE=" -DMODULE -falign-functions=64"

But we haven't got further root cause.

> 
> Thanks,
> Ard.
> 
> 
> > On Thu, 1 Jan 2026 at 13:52, kernel test robot <lkp@intel.com> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
> > > head:   f348d9af26d490c6f504ccaa7b342803ca1eaa0d
> > > commit: a121b4a72e405d1096049f81933531c59256cbe6 [18/19] x86/kernel: Switch to PIE linking for the x86_64 KASLR kernel
> > > config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260101/202601011320.wfOmjyKl-lkp@intel.com/config)
> > > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601011320.wfOmjyKl-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202601011320.wfOmjyKl-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> ld: vmlinux.o: relocation R_X86_64_32S against `.rodata.str1.8' can not be used when making a PIE object; recompile with -fPIE
> > >    ld: failed to set dynamic section sizes: bad value
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> 
