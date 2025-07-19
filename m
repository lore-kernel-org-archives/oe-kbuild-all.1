Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67F42264A1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 06:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752908248; cv=fail; b=Kvg4hzcEOa36gQPYydvYK0G+BsVtE6qwnhgbNIOSe/H/+24Al6D2iLGItEEkqX5TSMvMUwET7aRYQT4UM0XBmG65ndll+AyBKGMRfxgT8/S3HSeDI2zuKE80VyuccuhuR7b8Yyr3jZlSmKJOl7Fgd90+rXCtiQrqN1sIVjpI2io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752908248; c=relaxed/simple;
	bh=WzMs1C4bunSHKKqm457Gu9xSG+/50pjYeUwfpSVd40E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZjcM3hBxtV5FfHkSVwo20EpnMu9xd/zJIgo4eEO60Hs/+uhFciVOjOlYzmQUloYuu+WLYatPluXco006o0SzeuADOiBchRs0M4/tru/cvePS9sI+TztShnN1Nb3P5QpZkmZoiGQXhQg6DAuCHDwwZm5Cu2V8ez+7rDywICOzsAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hGFQF6zB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pRk0KiV1; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hGFQF6zB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pRk0KiV1"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J5lGKc028302;
	Sat, 19 Jul 2025 06:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ZPAwmxGftXpgIpQriD
	sYYWStl1P91wNF9GltdyNwGQM=; b=hGFQF6zBtuKvGXMTKqeedHURubXU1VzilD
	CCspWywtOU4JYTx7YckHMGPil+BABuOyfkBBKHRvB7xNiHd9gyoDqhlbBcFQYJtH
	VSfyjhs7HKW12bxBoMCiFWQt0hVzyOatM+7Fng8/4TKbh83PmLVTRwgvsK0Jg3I0
	WkRnLljT7YF+LuD1ltxNeKXxCaXtvNaAlAJMPQK0XM17cFzk1QhaV625U1VcLPsI
	r2NSs1s9+BsPpWBnz8XURzIpnFxcGXu9fIJBLeI58SBmX5x7rd4Rtra0JN+yDwMT
	C1zhNCEYdnL2VcjzaLk046Ul2YRGKNXki9RdMXRTf8WyoYv1BS8g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805gpg13w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Jul 2025 06:56:27 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56J68XJL038327;
	Sat, 19 Jul 2025 06:56:26 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801t6cxu6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Jul 2025 06:56:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bX/739ic/KM6zrgbJJoQTV1XCcMyZkIUeqItfbh5N28+JGMl2v2LdkkcLro4U+j5i8xo17UijJBhIEYUoNqRZR4WFoROZ0g0ojQ9iSByQeM7Eg4Ai/lR3Kblje+Me49yu/C4NWbkuv6FnwiScCMwwVXHhy6+L5ccRtkwaaElHJYF43JCWHeHuM5sZYGOx/FmTzQTg8eql4adPdRmTEibvXkdGA0lyr2bIe2xty4uBhSpZodl/tPhAH16eYwOApisGshb2VXWecGnW29IUYeyFezLqBRLeNHmjEvLn4NWcOn2jNhcysbz8pVyPg+BeR5NE0IYsPRQr8bxFfQS6Rw9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPAwmxGftXpgIpQriDsYYWStl1P91wNF9GltdyNwGQM=;
 b=wCrnRTjpJSFzjqeFMvY9VjpTnXq08ZOz2oqzBUXrSwxZYcMv3lV7/nYOgJ8I2OBpT76wAUhRvAb+ctXJk18meCxgcrnP7i1EHNEg0tDGr88B39ydtFc2aXtCHxuUfw8QSjDltqJFHu+3TPaxTAwTKHpSo3wGpPCYha3q0aXai+chpKjxlDJQNb8zxsm3rZR5CSiB4d1O5AErZR5a0CKNWrSCWJMvw+JxpI/tcCp2Q/gUsa/im5azZnfZecpRxZVS+IGMsBMVTgjEbhcTP08MKZnh7ygDKl5xs7QhZqTpeG6bqR8PMwUtnIUY59rubOyC0uF06uXynvQsmRLetxS6Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPAwmxGftXpgIpQriDsYYWStl1P91wNF9GltdyNwGQM=;
 b=pRk0KiV1NfiAeci7vQJVg51Cv1sfrp7mvKGM9G+2WH/WWqwbdjxz6hWWEwvJDphx8MZNu9QA9sD5/s+H/mNMbVYGJ30gZdUooYyzYhiU9CIEk5y1q/aVb91qwgKtgEFgu/k6xT6AXUYYl7xIenjyAL8phNkgEd40CPf3zOwJhLQ=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA6PR10MB8158.namprd10.prod.outlook.com (2603:10b6:806:442::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Sat, 19 Jul
 2025 06:56:23 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8922.037; Sat, 19 Jul 2025
 06:56:23 +0000
Date: Sat, 19 Jul 2025 07:56:16 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: Ye Liu <ye.liu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
        Joel Fernandes <joelagnelf@nvidia.com>,
        Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Ye Liu <liuye@kylinos.cn>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>
Subject: Re: [PATCH] mm: Replace (20 - PAGE_SHIFT) with common macros for
 pages<->MB conversion
Message-ID: <87dff86f-94b8-47aa-b2e1-7560a9f60818@lucifer.local>
References: <20250718024134.1304745-1-ye.liu@linux.dev>
 <202507190319.0rqhQw5l-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507190319.0rqhQw5l-lkp@intel.com>
X-ClientProxiedBy: LO4P265CA0295.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::8) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA6PR10MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc9a831-818b-483b-76c2-08ddc6915f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZkpEh6Fv+dva+Qkd4djVUl1PuLk+/CaMJbv/CP5T1Z+PCV4LY5+g4Uije29U?=
 =?us-ascii?Q?UuuB2g2tmtfAIrUShU21xAN8Wrhw8OBv9f99/EIdDwHe0t8ci+Z8D987ooc1?=
 =?us-ascii?Q?b0pEc1HU/5+V2VT57s0hYD0g0SWS30XCgteVAwJyhScZXnMPSoZQ+RihZb3j?=
 =?us-ascii?Q?Zdh6+5NMO3mFWlzuozDzAiH7FKgtk7JXxDOXqulh0Nw6uhI/9FuOCksJwm9Q?=
 =?us-ascii?Q?dnbela+PK+GTHxKozXeMT6yHuhR2iwY7oCo2unZZEumJv1QKvcUWfKnyOgxy?=
 =?us-ascii?Q?xO3cpLsmC7GXwQIIhGr4CVIBcTQBecSidTaNBKpzzoPG4PPCIooTfKyMg9CK?=
 =?us-ascii?Q?LH/hnDNXquAn5iYos/0Wl+sCu7qE6JgRpN8HN4PHoInWewXUSoZSdjPesE98?=
 =?us-ascii?Q?A+SP8hrlgLbWdHx1UPioAkOUEvS4Dmk06hONfH9LfBsNZ93befKqlVEEo2CB?=
 =?us-ascii?Q?SeFiVqrfJa83CahgLnFgi6UFva6/n3t+8T83ImJl2094dNFBaYVsGX6l3JjK?=
 =?us-ascii?Q?Dj7MHVJOW3tlwivyOsj9ejZOHCqz03t2++S663qz+HGrzy4lXTXN/8Qtrkq+?=
 =?us-ascii?Q?pYUeZQYKOWgc7NWxYSxO5kJdYUBYX6yek6/2Uep6dkfsaYDHveFvQG+/yQ4h?=
 =?us-ascii?Q?JzMoqBOtozOOBM21wvwxsHQqfBrPv+qfAWo3qoPZLtEmuZ2xmy+CnCLgUS15?=
 =?us-ascii?Q?tIVA1LUxhCl3c8lfkCXsBgdyAZuj8Tjv495KJTSjix7Odq32ZznHjILiv794?=
 =?us-ascii?Q?JhH3NV06SQgTfYLMbtDtt9YCVTRv7ynm5s3I5Hzti0Sfbz8mFnpLcCfej+uP?=
 =?us-ascii?Q?oGJ2EB30lMzG/D8ShrHSxTj85zohUGxxs68KRA0/HeW7EVmtOVfJBKdzDKkI?=
 =?us-ascii?Q?sjW+9ng+ypGBKZ5hfUuMTMKVmxPxsvKEwbAe1kH+qmW2mQ11CV65CXjDr9vl?=
 =?us-ascii?Q?Uen9vU2DHx4CfSDnrqfLDiVbF3OvIYlEQUhNYdH96afQ52Sl/CqZcuxWDa5h?=
 =?us-ascii?Q?uCblWKga9wN+JPBWUQyNvopmshB7DiuuK/FZ1Dk8ZXCX1Tauu+u+BoLYlD1L?=
 =?us-ascii?Q?NboYLcNJyW6mENrmXU33dTuafRFJqOMy9ehkl7TEjY3iPN761F0ioCmRNd8f?=
 =?us-ascii?Q?x84E15zkS9rG9VV4rpBXBrvGKoHqBtWk71wCMu4wSYKN107OZHvpTmTP5SWb?=
 =?us-ascii?Q?NPR9WdZp/tNVZVkNgeDA0uC9ZhzPcRbr8ybBynuc7b9Ki+VjndFPi/s97p3G?=
 =?us-ascii?Q?8Qc9xF6cUYvs19x7gWaLKkejgXg0R+jJodDKP5+2WqHGamLjvb8LtryG5Ijj?=
 =?us-ascii?Q?ridUGnMP5zDKqWtOT2+4sjVYZB1PNDTq4u96Jj4iFwRfIPmL0+svVIWwFOz/?=
 =?us-ascii?Q?7c13QkYq5QZZecGK3XxbW7tEb1J3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mhIUR3Kt7EQU4U8DYWXuvIEUYFirE9qnlgr54/EIJo4UmlJJLJosmFykUu2X?=
 =?us-ascii?Q?ThCA1dnFhdTlcDAlUMRJA5aSTn4dxJvia7vkRYZlX2Nc/OBJbRk2YFcahTsS?=
 =?us-ascii?Q?yFdkSmVO3n4zI+10OueszKDChg9RpvjLv0ozEOhvazcCPST43qhqhgIl7uCs?=
 =?us-ascii?Q?gc7MKDPJCC5VeW4xpudjgFTme5f3xj5ksUzsm+a94sR5N4U0FB1swP7n5Vby?=
 =?us-ascii?Q?TYriYmzDauElJFOUjEHShKjUyhOAuppsWfHyzevVTfGk5VUd7tAxUihwCZob?=
 =?us-ascii?Q?fFl0qsLtDohdQWD9F2hRwbGZu2JcKRlC3W+q+xddvo2VPlCQMzDa/eD6xcqE?=
 =?us-ascii?Q?ygEBiDM4+1UZOCWbinA3Z/nHnN86luGRxZp8EZuzPfOL/hKSxbNBTtPr0ENT?=
 =?us-ascii?Q?XgSQG5W1SlnMX2nqkchAaewQ+Zo3s6FGq6KPW6++a1GC0RgeimM1lwnEieH5?=
 =?us-ascii?Q?m1JM/436k6GB4spKz68fN1ciXGEESyxrsJpk3kY2lFdb/evirwYjb8wex72N?=
 =?us-ascii?Q?R6bjKK6yyM9846L04SbaLCWHHsUlNSTTOJiFvanKxzWKzSQ95PBEJYifZV/j?=
 =?us-ascii?Q?sgucF/a474PVhuUyOy8B3XduuHOg8t0K4ycNrglxqds/JTQneJs7kcI7b/x/?=
 =?us-ascii?Q?fEyCeXv8Pzrm3aTf5baPk1D/2wWk6RlOQkk772kNY10jmkIlDGrU7RjqSA4Z?=
 =?us-ascii?Q?26b6NLMij0ZuPx3qEy+/B3TALU7Vjel5XBLuoTU6UioYgTyihgIZlmX9dsn1?=
 =?us-ascii?Q?AENW5wzG0yWV3SyhgF0+5B3OKNRyJ4j7TmpocdfrQJ7K9j16vcC2gwc8FpmJ?=
 =?us-ascii?Q?Z+2DfIh6m6zD7ffaNlEQrQiC/CUK0ZBcdk045XurGbkHr+1DbBmcnxHqBIfL?=
 =?us-ascii?Q?YcnLHnhVdKxsrtyhHkRBTPI+QWHCyND1kqkT6cXK3wLKpuw0ORrb68hFL/Vy?=
 =?us-ascii?Q?d6WHdguS9dsWZtErsofQfBEix0cj6JiM7ka5RNNi9Dqc4cuU2Yj6QR2rUG3j?=
 =?us-ascii?Q?kJpPs/59YXKmAi9OMZFr9brHEbOwcTzN4FeVivsFKJ0XznFKbizdz/FY/L8S?=
 =?us-ascii?Q?wz8L3pp4IIXqi/2ziUGuuLH3FPtYQ7zOJTJvMj690wOHjvG9RWqggpWgiqqM?=
 =?us-ascii?Q?V+09AwnSJQ39o/GxU8Euqy5mm2LgCxa9WcqUWD1epjnEZ+6cbwdZXJ8obiIB?=
 =?us-ascii?Q?gkMwmzoxMq/WH7RR/Di+IpxMlXebHH/q0aMpaVH6WAn+W31fSc+woYkVg9Tc?=
 =?us-ascii?Q?4FDAMG/nkj9qb52kwu6E+74E8bWsq4BaLev5XYfCCj1LgwxsCGQmUWfcUKLt?=
 =?us-ascii?Q?hVVNcbM1PiE4gavIWVvBnKzGn7U9ive0hc97L2ST7+9wtcCueY1jpBKttm8A?=
 =?us-ascii?Q?pw4oYw5b9EzbohsgOEIa4ivVpMJFkmK6ymqvzJXgc2Z0gF6LKfT7t5MpcA0F?=
 =?us-ascii?Q?xQ9JuVS/h1hji9z02zhl1WeC45xZn7tmsS3q9GnQbny1nabeA//rUsTXeoQn?=
 =?us-ascii?Q?AyoEwr/VN8cAWqihckjI7aMnwpadCxkgcpuRbBOK9ZeEQ8JzBLKprnceX9yb?=
 =?us-ascii?Q?xBm1GHkEBqXf6pIEKlPFsB1Mgys+QTrwSz6rxMUS4rKAfOeQtL1U+xpXn6dX?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ph0jHFMF07EjCL6gbQJZYaPJ6tKPhXI9oT3VYCmm4C4W7rNYHILG/VEDmJyOLdEBUzKemPvXiW1xgAbaCIZEH8Gx60myZVH4zyYeO/ICcbpLeBdUjMwTvqhmoFSIxdvEM+2INM7ftsrksaHexV6pKtf9y+v86fkPjnQldDhnJcLXVFNq3irN9CIVxigq5AL92J3mSkx/Ow55C43hjYHd2GD+i5UjexyGHemrJNjZ0FYG01Z0TuyclLVkAvlTfqoqgEo7Yf6KsZRuQRyclefHdBKJA04n42XH2FK9nWfN6pjVcvuPAufe/BpFpVcU3mVRItqskcmvFHjVHNrCJ/pT7MQI7oESYvuNPf69YeZJU9LNaNy3O/+9waSwbL9eN/0mZR0DSdBHVg90mKsWhwkP+6bIPiawbEiws5p6iZJFVEjYlb6NA3dqEz2rXkGLwXw4rE01o4xJ9LECdmjZKC6Moj3k8VlSLyY+8Qjnq3krqe0vVWZzo06yReN5jcU1DX+mORQpM/6gybmT1KwyN6jw9lLrykhuk6vC2rYYwIywaTNvdr0ecxJ/u3CZo3cOSFc7GmawV4a9hF0iVROgndbKDDrpz87V2idm4D1ALd3ySWM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc9a831-818b-483b-76c2-08ddc6915f74
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2025 06:56:23.1594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOaRff5fG4B6y1wXeZm16gBNMtChGpU2ndlGmsatXrG6n/dBDMpioK1V6UWN+ONPJuJ4ctvQq0tQQk7W6HFNSwg6e7gGBjeI/QJpOgt2uYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8158
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507190066
X-Authority-Analysis: v=2.4 cv=TfGWtQQh c=1 sm=1 tr=0 ts=687b419c b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=qImMG7AflJIlHlhJ3sEA:9 a=CjuIK1q_8ugA:10 a=mmqRlSCDY2ywfjPLJ4af:22 cc=ntf
 awl=host:12062
X-Proofpoint-GUID: H6tzuad38CR_kPv002YyeMlnCcCbZBLi
X-Proofpoint-ORIG-GUID: H6tzuad38CR_kPv002YyeMlnCcCbZBLi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA2NyBTYWx0ZWRfX4AVwnJF4XUDV
 yF60finYfqtpUPvQ70THun1JJzfGPMDRQVgIMI7c6zFwtS0oQ7rF8U+gVEt2vFPePwnBAIppw+r
 nBdF2Gi8jaURHlk+x/dBZ4hreqwwPJtakwMuvi0eqouw22Ne+DDCxBLCxkjY+3XOEqTIf9SpINA
 kNM0d+zB0w0x/ZMPx2Fz33L/n/+o79PhZFob4/VCKrLC9RjSk2sQ2Hjj5Rlryx2IR4Pm1GgaZ7q
 S81usnkxTOQ99zXeccdUcyT6VJmbZT01+Lxz7bql8iWZF9tn/DGiuNPMHmmcLuGd+x0v4mX3OdW
 QqTaaYHmF42e2zlFSVWhS4wPFVac2yWUC0/mCZfXp/5jwGqmddku5KV1kuJKH4E1U3jD4hteEcA
 0lg43M9C78cePzplc6b93eMCZrg8k5WtN4AEHDINMDbNteunI639uka9vE6ytplL0eAnuTiH

Ah yeah looks like this is already defined for arc only (!) in
arch/arc/include/asm/arcregs.h.

Maybe pop in a #ifndef PAGES_TO_MB ? It seems to be equivalent.

On Sat, Jul 19, 2025 at 04:06:04AM +0800, kernel test robot wrote:
> Hi Ye,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on akpm-mm/mm-everything]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Ye-Liu/mm-Replace-20-PAGE_SHIFT-with-common-macros-for-pages-MB-conversion/20250718-104347
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20250718024134.1304745-1-ye.liu%40linux.dev
> patch subject: [PATCH] mm: Replace (20 - PAGE_SHIFT) with common macros for pages<->MB conversion
> config: arc-randconfig-001-20250719 (https://download.01.org/0day-ci/archive/20250719/202507190319.0rqhQw5l-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 14.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190319.0rqhQw5l-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507190319.0rqhQw5l-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from arch/arc/kernel/asm-offsets.c:7:
> >> include/linux/mm.h:78:9: warning: "PAGES_TO_MB" redefined
>       78 | #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
>          |         ^~~~~~~~~~~
>    In file included from arch/arc/include/asm/irqflags-arcv2.h:9,
>                     from arch/arc/include/asm/irqflags.h:13,
>                     from include/linux/irqflags.h:18,
>                     from include/linux/spinlock.h:59,
>                     from include/linux/sched.h:2205,
>                     from arch/arc/kernel/asm-offsets.c:6:
>    arch/arc/include/asm/arcregs.h:155:9: note: this is the location of the previous definition
>      155 | #define PAGES_TO_MB(n_pages)    (PAGES_TO_KB(n_pages) >> 10)
>          |         ^~~~~~~~~~~
> --
>    In file included from arch/arc/include/asm/cacheflush.h:18,
>                     from include/linux/cacheflush.h:5,
>                     from include/linux/highmem.h:8,
>                     from include/linux/bvec.h:10,
>                     from include/linux/blk_types.h:10,
>                     from include/linux/blkdev.h:9,
>                     from fs/ufs/super.c:83:
> >> include/linux/mm.h:78:9: warning: "PAGES_TO_MB" redefined
>       78 | #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
>          |         ^~~~~~~~~~~
>    In file included from arch/arc/include/asm/irqflags-arcv2.h:9,
>                     from arch/arc/include/asm/irqflags.h:13,
>                     from include/linux/irqflags.h:18,
>                     from include/linux/spinlock.h:59,
>                     from include/linux/mmzone.h:8,
>                     from include/linux/gfp.h:7,
>                     from include/linux/umh.h:4,
>                     from include/linux/kmod.h:9,
>                     from include/linux/module.h:17,
>                     from fs/ufs/super.c:70:
>    arch/arc/include/asm/arcregs.h:155:9: note: this is the location of the previous definition
>      155 | #define PAGES_TO_MB(n_pages)    (PAGES_TO_KB(n_pages) >> 10)
>          |         ^~~~~~~~~~~
>    fs/ufs/super.c: In function 'ufs_reconfigure':
>    fs/ufs/super.c:1246:22: warning: variable 'ufstype' set but not used [-Wunused-but-set-variable]
>     1246 |         unsigned int ufstype;
>          |                      ^~~~~~~
> --
>    In file included from arch/arc/kernel/asm-offsets.c:7:
> >> include/linux/mm.h:78:9: warning: "PAGES_TO_MB" redefined
>       78 | #define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
>          |         ^~~~~~~~~~~
>    In file included from arch/arc/include/asm/irqflags-arcv2.h:9,
>                     from arch/arc/include/asm/irqflags.h:13,
>                     from include/linux/irqflags.h:18,
>                     from include/linux/spinlock.h:59,
>                     from include/linux/sched.h:2205,
>                     from arch/arc/kernel/asm-offsets.c:6:
>    arch/arc/include/asm/arcregs.h:155:9: note: this is the location of the previous definition
>      155 | #define PAGES_TO_MB(n_pages)    (PAGES_TO_KB(n_pages) >> 10)
>          |         ^~~~~~~~~~~
>
>
> vim +/PAGES_TO_MB +78 include/linux/mm.h
>
>     71
>     72	/*
>     73	 * Convert between pages and MB
>     74	 * 20 is the shift for 1MB (2^20 = 1MB)
>     75	 * PAGE_SHIFT is the shift for page size (e.g., 12 for 4KB pages)
>     76	 * So (20 - PAGE_SHIFT) converts between pages and MB
>     77	 */
>   > 78	#define PAGES_TO_MB(pages) ((pages) >> (20 - PAGE_SHIFT))
>     79	#define MB_TO_PAGES(mb)    ((mb) << (20 - PAGE_SHIFT))
>     80
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
