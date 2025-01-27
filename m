Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E6718A6A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 18:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738004218; cv=fail; b=ntfe+tAaV6GEUce497/rQ16uar+TaqRyIhDY3Pe25rLuL0Pki/qPqHQEo1+Am53b3uuO4CiBhM6WbV7UTNOGsI4xX/2Yk+Qm5hHmTVzCzUdmIBKFhU9CNbdFEWY22uzLMQT4dsAf+5+fmF+S5CwCtNFGs+cS4DO1VPMhcPwUQjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738004218; c=relaxed/simple;
	bh=xlMhOGcOH3yhG2+1vw7jC7XejZXlcpeLlbULkBzRxec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JPmK6yJuSLQiR+yd3WF/xRhEOF1pUBGTBl/1rwQaE8lpXaALBtC1AVcOUQ9afy6C6Mo/iZcazhNF0BLTqCiCYqnLpuCTO/pZIL1jFpdRckPBvFk5RL090nniB14R6vG0PCVsRt+3T/RbrvM1Y1vvwrgKLtlvNJxqvJHiStNMFVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fL0sl1CZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xvpucpRj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fL0sl1CZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xvpucpRj"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RItoLD009025;
	Mon, 27 Jan 2025 18:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=V1JyW+KWt0R2fR7gVV
	Oi253a8xE8f3oLrQXGkT2HkxY=; b=fL0sl1CZOX3WrRN9DMb4S+b/5CUmFbq+RF
	nZyoKluuaAOAeYib8rPl4QZ4gYR9mY/AaL60Bp6ndEUjuDIh/ZbbwHCv7mKAFhaX
	zHtIvrAm4tYvCcF/jdSeG6R3IdSMbBAXjBHBaV1huT8RwAY+qpM7Aov+Ku+HHoZ/
	gWR3YZJ/7ApESQR10bkSi7fIngZMY9QTio1qsEMJMnz8mpKJblsBKESmAghlNZNQ
	fEkND7w48vI4eDTDB0hhTVgELAPBHAFDG3nbX+2ew62660//IrCukwJeUw3FPLKQ
	d5psLaiFG/UfTkr8Y7w3Rs2Ysi3+cjam2Q5Vn0x2l9nxghrpStqQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44efsw808x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 18:56:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50RI2X6G005539;
	Mon, 27 Jan 2025 18:56:46 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd7dh9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 18:56:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmFa7+g4NobUMW7j4yjQLPOUt9HeUgxpiqswttkipDCPsVl8ngGtYYZcIxxqt1ey0W5LpfKV3Hk5Mfp5BQ1srdPnmEqyaG05MMoeREfqlPaw+9jRrtrkHRmeLgjvS7s/u3wOmm0iwx+FKtwRRWBgr0lDepssXGr0akN9YZO5WrhKg6MrHwrYH9jXPwDq8ThuxRub6+ksPvYqeefge9+2bpT0grRS0zTs3x1Xzaz8g7YQWWJPgbsY7sR3qGD4KrolHVDdG5c36CwkbTOYiQ9zmp6uyFi7HaO9Ij6KwyYWu+ulKOC0ARf3KwilsF5DZOWGQd9GVLcudPVyQzR7Le/x5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1JyW+KWt0R2fR7gVVOi253a8xE8f3oLrQXGkT2HkxY=;
 b=CNMeIfMVoS8hTdlAx/aFPswGX86aDJ8GhiGVuwrN3MILCSRrNv8O8P68s94HgBe79iVzcUWJN5iDplYkKTTlCO/ljZ0cRClhRYrFvtqZ3j1hg/r4EV1P9/K26vTfOQeLnwBu7fA+HmsWLtO6y/5QhL4zMBB8K7PhXtJQL1aooKrgBsXrPJjCs7pko7o+W3ch98TOrOQ3Q7TVrWrPdaNFZGs66zZmimfoMHrwbbvKfMMt1lciRzHj15uAzbh8apn132m1DAt+zOaWhuD5E9zVsCjWL446/I0vBpA3Ditxx/MvP1cMWFwikzzNia5ErJqm1TkIMFVBi2ZsADj/OdhVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1JyW+KWt0R2fR7gVVOi253a8xE8f3oLrQXGkT2HkxY=;
 b=xvpucpRjJU2T1MQP12ovV1oK8V7gW+4HfOvdW4JgdBzz1+XIP+SUxYL0uIDVZz+3b1pHAAUhkb78f4z9tLpNrYrxYzLJw4sYc3T8/FRSHEhQ7luEmjA657gy+zv8oWcXAcWjhvI9bzy9cGR21Hyas9vRbNIPqG/0CyxPKEO04RM=
Received: from MN2PR10MB3374.namprd10.prod.outlook.com (2603:10b6:208:12b::29)
 by SN7PR10MB6668.namprd10.prod.outlook.com (2603:10b6:806:29a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 18:56:44 +0000
Received: from MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348]) by MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348%3]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 18:56:43 +0000
Date: Mon, 27 Jan 2025 18:56:41 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] mm: completely abstract unnecessary adj_start
 calculation
Message-ID: <5a56ed7a-6c63-4072-ac15-d724c99d6715@lucifer.local>
References: <ef00aec42a892fe6ac9557b3a11f18f30a2e51b3.1737929364.git.lorenzo.stoakes@oracle.com>
 <202501280232.qYHi6Rkt-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501280232.qYHi6Rkt-lkp@intel.com>
X-ClientProxiedBy: LO4P123CA0206.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::13) To MN2PR10MB3374.namprd10.prod.outlook.com
 (2603:10b6:208:12b::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB3374:EE_|SN7PR10MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ef3cb0-aec4-4c41-392c-08dd3f045783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z1ionkIorFkCKopMatqxCjSYKBT9KxaIfzfrv2Jz+a6iKUvA8nRnoGTP1O/N?=
 =?us-ascii?Q?pxEvgJ8FaR+FN6na/Eo4XaTpEqDDnc1ajukWkgQ7U6+BFUD5iC2rJ5ZaSQVI?=
 =?us-ascii?Q?ffVONR/f7RXIkrFLP+x7yvc2AXXm4CeziT2NY/bPiGfYmrbXUzQ5ibbszTMY?=
 =?us-ascii?Q?K+eN1ISC13ietA5B6R28wybueG/Tb0mA9LjcR7k6StX5PBfwLOB8SnzxhUs7?=
 =?us-ascii?Q?Kr6DzMEalUx1wKUhAHmoAmed1HgZwuXg4jep2GI7AxT8LjecOYSV6A4bYOjL?=
 =?us-ascii?Q?m/0YsATDsARA2jKXjAzNzDT/I8+QZ/hJiBiZrN6+vOpfajB7PXeiNw6uguI4?=
 =?us-ascii?Q?ruJe0xkxt6fWHfsyoqtQy4heIlYAkNPD+iEM+LeWyvAqvUP6LRU5ZEKC7plM?=
 =?us-ascii?Q?dia0ZHHrjstRusY5LtZyk5rhuCzj+BRUQFn1B03lS3K9QZExv+64gUVJ0iES?=
 =?us-ascii?Q?q8dK2511w9vbRoOVt1PguL8uxpwm492ddv1rtv7Z9AHKNmqLX8xTsLkI+XNc?=
 =?us-ascii?Q?MLQ2cUNnypLbTCeuJhokeMJQIi96Z5HhJ/xVbFGaJuYt64pRyNSweCv+KfTi?=
 =?us-ascii?Q?4EFp+nhFYot/dymnIIIqxNr5VyxWFkMTyYUYlDhMFS6aueGZfu5sJfc32kTL?=
 =?us-ascii?Q?LjFZ6DWF9jGiO3wVprP83Yhk8TPIlu4+p5U7moadTsBmWQVKi6448ngi06cL?=
 =?us-ascii?Q?XO2CUzHxA18BZfpbp2NXDyO+X4TvnHCKDWP9CMXPRHQtHOhH4A62EWLJwxme?=
 =?us-ascii?Q?bHhGWk/LaGs/sMk/6ohewinFZiGfzVj7qic/zaBd962h0Plcu+OLbo4Rg79u?=
 =?us-ascii?Q?IWf8m/NdTQMlmKatywHHLBDTgDMWNgABqeqtiuHQoZ1GkY0JC/BEf60tcRiq?=
 =?us-ascii?Q?KijNqpZ0ki0k+vCWUKGb0iTSUVyAiJKXcKrHH3lAvPBTBf9ySNnHEEmOk3g4?=
 =?us-ascii?Q?5DTGJmWGI2zDcfzENGzx1ACM9gx0Bnb9UjLakd+/DRym7YOgd0xWVmuI/P4w?=
 =?us-ascii?Q?q2NjpmlZrSByFWk8hz/00+V2KeVInuePXKHs5shuc2V5NaNlKVTb/eRNy1UR?=
 =?us-ascii?Q?4zJMs7mCkotiSQvniSktPbFAipiwiA4AdF7NUAeVQ5rYnjJnUygNypkeZcBk?=
 =?us-ascii?Q?6fHwSU56ygntjBoasJjZ89e5ZowWlV1FrXJHykNbXRVrDpjW/Kr4g3mfkddr?=
 =?us-ascii?Q?GuY7rufTtuHKKdXpWRNRJHa4hjvlJZ/N8PD+x6+zL8Qv/wlgSIdkotbb1u77?=
 =?us-ascii?Q?/Nkde7S4pR/HD0+Yjt4IW4JXb1FCses0zXD0ofji/zwWA+z9zFTCXh/xrIT6?=
 =?us-ascii?Q?SDc5NT+bRhyjD0RyY5B1d6hfSUdB2XfMUVJmdL5RPR2yTg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB3374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z9KHJI1xN126v40NRMJmPzBcqUhS+Qf8OFEqVPKzWviX+0c1jzpy7uymKt6B?=
 =?us-ascii?Q?swXqsLiS0U7q4HyyetoRsWszUAhAcDTO2VBbDpH7hBW0FnSS6wGaryy7ZuM+?=
 =?us-ascii?Q?yyAeQ3r4bfJtKX0X4pZ8hvtG8AGbuHpDBNJC97rGk55NeooUfyT2CD58zfln?=
 =?us-ascii?Q?tecFiaVRm9UliWIOWeC9AmSY2j3SYmW/yb3gKaYn7h0d6hkk57THrSiVS/TS?=
 =?us-ascii?Q?4trK5+3l6sPkX6m9r+++WwI/hXbmDRticeZ9PRIXdzigOBJN37BTY5Ak6Tg9?=
 =?us-ascii?Q?HQW2zhXNcW3cOMzrUT7ew2Bkxzin1UMFCW3Js4KTAnvjXMsyoNUJu2BkQDCM?=
 =?us-ascii?Q?939m48YzptnIXi53/IRvDYb0WEUNCJ1rpZww+OOz0TZFQaQjnd6NzIvkfqbi?=
 =?us-ascii?Q?3w163Qe2asgnKikpxBQ5xwavsof4zlqxFzTWZq8MqrugPFRCNlWltEee3dP+?=
 =?us-ascii?Q?nAD4XTE+vsLYMia/nymdaerPPIRCCxixhfvkZNoQMaurlse4acpn85T6llug?=
 =?us-ascii?Q?3MvtjBGMTtSrYJbAhg5elE8VtQn7Cvama/LXDcPVGZfur0Hqz9VHxUbPmXYq?=
 =?us-ascii?Q?EOx/LtDFYjv06PQeAzgxFAkvd6LE3MR/je3kmzpOdEemrAiXcSdgsxns4Fra?=
 =?us-ascii?Q?le3lOn9+kyjTk1VKwzneawfel5BeBp8ufbCnKYx7X/Inb2abRtYIY0FxS/GZ?=
 =?us-ascii?Q?+9u0sepAb6FgEzD5kygWsPoRX3tHdHp6IrAYcsEcTykMVu5fMya7D6CqORdJ?=
 =?us-ascii?Q?F41GJIJUVPv4oB7l7FJ1KJNM0wNSTM1+dCJIZ5UbT7NPmy9tBox5f6A8gUcP?=
 =?us-ascii?Q?VtwENdhsXs66Wc/+7/FR9vbaL3nSRetkxgxw1QjfDho5t0rUAyNBcLd5wM3V?=
 =?us-ascii?Q?MvikfoDx3wsSqwQs6v+vZwEXW2bUOH+WHZ6sCdGtjf4QbXBvAqBIo0DU+Nb5?=
 =?us-ascii?Q?t2X+hOzbq6GDL8uQqKKtX/2qoKKObDOQg3daIVxfLNy2AXOBf1XCjszjh8mX?=
 =?us-ascii?Q?I6RbkSnsfo8ShN2Im71+p57QBT+W9YUVFpCilQRGfpfRPjJUuUr4lf0yhR2g?=
 =?us-ascii?Q?mfHVG5jImsA+Lk4ktcDxj7y7l6g+ZWiOcGzjjXXLxwtupEcVzqbgO8YYb3cv?=
 =?us-ascii?Q?zrHFOYUieDsdEOff7/nzW0wmUQGQd3BmC+GZPFPO6hXtwg4kCHiB4sgKBZNj?=
 =?us-ascii?Q?BToVuVONPJVMM+HBFmmn+7wyOi+bboJdlbAMWEkpdtfL53Id5oAdV8NuL2WZ?=
 =?us-ascii?Q?10JzHLfnKbqxDtDq72ZJg/Ijw/Mah9n83CKpdIPBefjqAyUYl2w7D/QtOFj1?=
 =?us-ascii?Q?V9lBEZ51t26HmxQplk9QNCBKoJ2wTQiI75UqjZ9icP/7kxaKUZoDmA9K2voM?=
 =?us-ascii?Q?bQ+hMtmb0RRxs5oNqlwpe3mbQkMASNNJK+IIUkIsi63SOixlfNFqd1tdy3Ov?=
 =?us-ascii?Q?h0mHe7IcMFpxNyzcnjVmtp0CjGLi1QznpdUAjIlAetU9Ot9mr3ZZ2kIPNAK6?=
 =?us-ascii?Q?aAGEWttpRKaWK2rkg6f87hGuSXoFC1DBnMya5mC1aNZTl9kNTY75XRO3ns5R?=
 =?us-ascii?Q?TkUzZoYUD3TcSEj7w7YY8ijMh9GNTnO2bLU2GDy34s0O/WdT3VzmjWonh6aF?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xDm5qhScbL3JP1mSv0EfUVYWiBLa6Qnef9isxzb+lJFWX3Rgf9UJk+K+rwhiNYEepBm8bne+99DCoaC3+nZR6jeqeA4T04EwjTJ1LM+mv4JH9w4aj2+fzjnU8AiBanar07OX0kHC9kSImbO17lPFqa2Y4tnET8MU34WtK5ozG/mD/av5pVGIdoYZLXCSc4BETHiVIWfeiYN8dw+5RmufjfipMjjDafcc+wHO29oYfG/7f4u8zGjM1pSEXayGuqE8AdFKDieU8o+Zc2WxWqodBWWfsurQ/WjI3xjsHQpq9VsEbrl7LZ1HoqPnydsu9lkJwnBSGNhzJE6lTAsNKVLgW1nwAwcsKfeYvmDKwVs/k2Pzq/Qf89kWjr3YBzIKtHQ2eZBxarVrNoiDlGge6+nnDkLujfv+fpp+J9U4qp6cusMH4fUU3TF4RKcsuNDIFS8iYPcpMA0OYK1iv3wbqR0YDMdvxoZ7qXrDWk7MmHM9a+A4dh8oQ8BIlNQy+/3Ph6epyxobGQw7Z8XwGFfKM44hnquIHi7/OtRSeEnoid6qo+hxeETvYHHpFiUAqMQovdWZyb+CLDhk65ZI3LBNLOabZBn0paWxvyw4gZZ3qxmJZ0E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ef3cb0-aec4-4c41-392c-08dd3f045783
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 18:56:43.8511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mCqehU/nB9f+BZRybLwtjIjq/iUuzkdDKCKOC8VH4d38OOlM/Q0M1StKiXU+7WJqzF061X+lTzQmULjwkyCpwEwBQSnnaVLH1FVusVpQjZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6668
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_09,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501270149
X-Proofpoint-ORIG-GUID: crNXWTWzYrnz3iSKcOAJ2pVEo7wERw8S
X-Proofpoint-GUID: crNXWTWzYrnz3iSKcOAJ2pVEo7wERw8S

On Tue, Jan 28, 2025 at 02:50:55AM +0800, kernel test robot wrote:
> Hi Lorenzo,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on akpm-mm/mm-everything]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-simplify-vma-merge-structure-and-expand-comments/20250127-235322
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/ef00aec42a892fe6ac9557b3a11f18f30a2e51b3.1737929364.git.lorenzo.stoakes%40oracle.com
> patch subject: [PATCH 5/5] mm: completely abstract unnecessary adj_start calculation
> config: um-randconfig-001-20250128 (https://download.01.org/0day-ci/archive/20250128/202501280232.qYHi6Rkt-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501280232.qYHi6Rkt-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501280232.qYHi6Rkt-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/uapi/linux/posix_types.h:5,
>                     from include/uapi/linux/types.h:14,
>                     from include/linux/types.h:6,
>                     from include/linux/kasan-checks.h:5,
>                     from include/asm-generic/rwonce.h:26,
>                     from ./arch/x86/include/generated/asm/rwonce.h:1,
>                     from include/linux/compiler.h:339,
>                     from include/linux/array_size.h:5,
>                     from include/linux/kernel.h:16,
>                     from include/linux/backing-dev.h:12,
>                     from mm/vma_internal.h:12,
>                     from mm/vma.c:7:
>    mm/vma.c: In function '__split_vma':
> >> include/linux/stddef.h:8:14: warning: passing argument 4 of 'vma_adjust_trans_huge' makes integer from pointer without a cast [-Wint-conversion]
>        8 | #define NULL ((void *)0)
>          |              ^~~~~~~~~~~
>          |              |
>          |              void *
>    mm/vma.c:518:57: note: in expansion of macro 'NULL'
>      518 |         vma_adjust_trans_huge(vma, vma->vm_start, addr, NULL);
>          |                                                         ^~~~
>    In file included from include/linux/mm.h:1133,
>                     from arch/um/include/asm/tlbflush.h:9,
>                     from arch/um/include/asm/cacheflush.h:4,
>                     from include/linux/cacheflush.h:5,
>                     from include/linux/highmem.h:8,
>                     from include/linux/bvec.h:10,
>                     from include/linux/blk_types.h:10,
>                     from include/linux/writeback.h:13,
>                     from include/linux/backing-dev.h:16:
>    include/linux/huge_mm.h:574:47: note: expected 'long int' but argument is of type 'void *'
>      574 |                                          long adjust_next)
>          |                                          ~~~~~^~~~~~~~~~~

Doh! My bad.

For some reason I didn't change the header, and my local compiles must have
made this a warning only and had no problem with it... That'll teach me for
disabling CONFIG_WERROR :)

I'll fix that.

Thanks!

>    mm/vma.c: In function 'commit_merge':
> >> mm/vma.c:704:56: warning: passing argument 4 of 'vma_adjust_trans_huge' makes integer from pointer without a cast [-Wint-conversion]
>      704 |                               adj_middle ? vmg->middle : NULL);
>    include/linux/huge_mm.h:574:47: note: expected 'long int' but argument is of type 'struct vm_area_struct *'
>      574 |                                          long adjust_next)
>          |                                          ~~~~~^~~~~~~~~~~
>    mm/vma.c: In function 'vma_shrink':
> >> include/linux/stddef.h:8:14: warning: passing argument 4 of 'vma_adjust_trans_huge' makes integer from pointer without a cast [-Wint-conversion]
>        8 | #define NULL ((void *)0)
>          |              ^~~~~~~~~~~
>          |              |
>          |              void *
>    mm/vma.c:1141:48: note: in expansion of macro 'NULL'
>     1141 |         vma_adjust_trans_huge(vma, start, end, NULL);
>          |                                                ^~~~
>    include/linux/huge_mm.h:574:47: note: expected 'long int' but argument is of type 'void *'
>      574 |                                          long adjust_next)
>          |                                          ~~~~~^~~~~~~~~~~
>
>
> vim +/vma_adjust_trans_huge +8 include/linux/stddef.h
>
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  6
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  7  #undef NULL
> ^1da177e4c3f41 Linus Torvalds   2005-04-16 @8  #define NULL ((void *)0)
> 6e218287432472 Richard Knutsson 2006-09-30  9
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
