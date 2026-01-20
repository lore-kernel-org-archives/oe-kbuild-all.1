Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4CC28B7DB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 10:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906578; cv=fail; b=ZVDFudGagucri3uqCrhsaoqn1tTZs2lD5wa0Iza5riVtyqwZy1BB2GQBUXfyGK9m8A8khjawXfb9fAkch73v3FOpm9yQRjs7+eJP3Z470MwCk4GEoxEiMmwPBaZIRUl6yHhmGZJAGBT8sFe4X+4X/2I2FkliiaH6ycaOuMv/Oco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906578; c=relaxed/simple;
	bh=0wdoBZKNND+uZUuLfZqs5DxLQ5LZXY0T7sdbHCSwIyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GBVUfXuZgcvDFtKJ7FeKfjpOwS6JJGmqPR8Iga/jRtSv4JmDfM6XlmcB383KDOE5tZHZ7TDzwolXfyU7k+Ydfmu3JGCVB/tgbSn2Bq1xd+CoeDU+WLTYml05fgV3uVc0MgUD6sQ9ME8GBimF6O4a+PRBqMN01s6WOIMYxceY2mU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bCzO20tC; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Tj08t8Kv; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bCzO20tC";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Tj08t8Kv"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K7vKY73339784;
	Tue, 20 Jan 2026 10:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Ni/dQdr9Q72LB/BPwz
	PWkhgD8foFh4OrG7VjKdMXL04=; b=bCzO20tCLfKL0fGpBMWGm2kP4kC9GktOeT
	ZhGdUp7AROdkKb0wokX77sTZCRaJ5fGLz/u2bwHegf4kdwoyaQ1P7rXinACqa3Rl
	9C9YslTn+hbnTbDeO/2qN4+mFThjIgRkhQBzU4UJ4HMRsjLYkmZfD6VZU4qzPQka
	FJVgI5miZt0qheaBIRV7Buou3AHUO+RaLz2n9BX93aI07/MGnwYWU+Dfhn2KlONV
	LwbCTK6E22w2sg8kzDvnZLN7zdRd3WPnaTpJnqj9qHo15Z39G9N9PPhvsjuf8ADM
	lLJdbzIijmI4KVBmSPAvnQd0PdPV5kSMAeNj/Y2A0dpQK2A7orTw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br170bgr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jan 2026 10:56:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60K9H9Wg018032;
	Tue, 20 Jan 2026 10:56:06 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012032.outbound.protection.outlook.com [52.101.53.32])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4br0v9ff8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 20 Jan 2026 10:56:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWps0mvXmb5SWAfz9+F7VWEwFvtUFxO5kXjSPqVRcO9uafgFKNDTTKHtY/P3RLs/G6sScLz6VNOaNstBZyg47nvPILcB05fx9t+i0bEiu/NMc2V+O31qBWWRMqQn70QgmdGXDeHyZZFzoV8qGUsfWJ67deIp4FvWfS6mjJzKgzQ4v3VNhFlhaK+S9TOAN3DiH6qzpAL8dgHHZTd1q3Q8tPf/K3Hpd0znqm9PvVN7nNrEVkR6ZH/yoC9ftgADS/bWdWDfb9bnVUwThafeh04hsMPRpesemKuZxps85nkNing/7kyoIMqlMzQYT0LWbgUIFjmJAG+/+UTK4WDLcS8Ndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ni/dQdr9Q72LB/BPwzPWkhgD8foFh4OrG7VjKdMXL04=;
 b=IndnG2X+ickrCsOHZJieHKKRNo3GK85/MwUO1ftP/hTmiOKgwf/iH6AoEb2S3v5g560WDZfpDmaNylYjmJGJ2Ea7khldFE8dDOIZx5/yMWJ1M13GgaMeJv9C5rnzTPxrmNcxtVZ49XRuOvscLUHuoGe7Kv/1qXjyCKhNeAwxJ2iuRsrgDvicIj+ns/sU03Bag/rxU9v/lvSDtb1xz34W+RE3x8rnbcxauHZCPBTIygbtSNZ08RKTpCc5p/VBZveTqVg+PvGtavLaT49D9Xn9nBc5p3UX+QDT2LkxlQZ+Sn7y7g3EIo4O0Xu4M1w/yIgjLTgmwAMCbkCij4nQi2Jb6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ni/dQdr9Q72LB/BPwzPWkhgD8foFh4OrG7VjKdMXL04=;
 b=Tj08t8Kvslb8R10e3FfK8DhyeVhPgJYDbNPff7n3CEuHCtsVE5afUEuJG6BttAS/siogCoTNwQBDKRIM8sCKN1bVRX6lp6991zL08wjGD6AHeYW4p+PZS1dpLvc7Q/jr6XuJqA8c4FKJkq/kb1B+0tDUOTtmqdY8UwdaXkzi2us=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by PH7PR10MB7730.namprd10.prod.outlook.com (2603:10b6:510:308::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 10:56:02 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%6]) with mapi id 15.20.9520.005; Tue, 20 Jan 2026
 10:56:01 +0000
Date: Tue, 20 Jan 2026 10:56:04 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 418/422] fs/orangefs/file.c:414:9: sparse:
 sparse: dereference of noderef expression
Message-ID: <09bb7453-a2d7-45f4-a69a-ceddcf6fe809@lucifer.local>
References: <202601201701.IhxeGffs-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601201701.IhxeGffs-lkp@intel.com>
X-ClientProxiedBy: LO6P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::9) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|PH7PR10MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e14d52-056c-41ea-9f8e-08de58128048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Iaqgx+2J/UaP2iNN5zK6KO30ucwk1mlydeSz6JMSU0/ypuTSxZEXc9HoxEds?=
 =?us-ascii?Q?F49/e1sdibAzUpH2ZG+Zxub6OyKnI5GdhPGHGW4AT0VSHHvwpXIMsYoKni5M?=
 =?us-ascii?Q?Yps9sxX1ZDs08sI/AqH1KTODTzx5++cHKge/OhwbucJHz0WAWK44akuZZmWM?=
 =?us-ascii?Q?txV2TRnhlf55HOO6BzaiTg1rR9dnjr+vgcHpoCfnt+6hLJhnUO2EBqOTGC8z?=
 =?us-ascii?Q?7NIPcRk98oEKV5bkNpaJG2PbkzaBPZiNHwO7S2INQIJW6/aU8cIdZfybS5B4?=
 =?us-ascii?Q?14dKGlM07pFlKKnwdFZNwsgboxoAKJ2EY7/WvJVVFNov7cbZ8Cp1sWTvbV3e?=
 =?us-ascii?Q?ZmID1RrBlSAF0FvzpTb7MImLzVlvlkh9WSEquCs1ZFweS2iQF4MzcPBTpTyo?=
 =?us-ascii?Q?f8HW7UrR4M5xzFctMQbh10/kbmuXnt8IchAgqBeV+mcZrWAeJqhnnNsXvBf3?=
 =?us-ascii?Q?QlDbTp6cto8JQyKBu7lRQ1SdvEEHaWob8aIfmpyVF4Ld7vhZ4N69fGPuJuZ3?=
 =?us-ascii?Q?AuVNVh/2zWAol8nNbKtWVDes9RXslh2g4gjI2k0E7oujS/pFGYuJA489oMm0?=
 =?us-ascii?Q?KZ7bgYpJuCvQ2cTZyx+rE9UZyBA5nOsap8Qfbkng2kDNJaJk245LjfiRxDwV?=
 =?us-ascii?Q?gYhKvCkR3l9buyYIn7YnUMNLzibqSFJfqCWt2Egsds5Cd0yGRME022OOWymb?=
 =?us-ascii?Q?yl6r8BJp4TtSZS4tpwqYG9KSoBe0z7NxTWzUE14ppVevMvUV1wdYgcquhvHT?=
 =?us-ascii?Q?pJf6902Bg3ba6LThg0eJGc0O+VMzGe/Izqm37+p+PRzs5/ua5bDS1kG2W74j?=
 =?us-ascii?Q?8c7Sfjiy9gcx63SubkZ30yi07WbEspaN5s7/9+f5A2EkG4Jf80b2Ojp/IiRw?=
 =?us-ascii?Q?Uv7dqGpMl4b7dW3/FMMfdREFf/x7s4I99gktLmraR1wAN8gF0J7PbBkVyEf2?=
 =?us-ascii?Q?PdiucplixWukc8117QPDNL7+1YaeAe3KyHrLA7A0mBX2gEHU6TvQAM9UPX6Z?=
 =?us-ascii?Q?N4vN+5hGN6Kf9PFSJSWJTkjv6rzYkawK9QA7nqbKR3ZI9rv4MZEjfsAq1bBQ?=
 =?us-ascii?Q?ZufDFKTWLpaeQbQelzYIIJtMUbYuIP0QVidfjQwTAZMvwM31fh6avF+yeiaK?=
 =?us-ascii?Q?T8Z2mF4+225BoLLoCVfI/koQHBcipLHh2hv/yDvlaicNK8f10PLUQPphCxmJ?=
 =?us-ascii?Q?+A8ES2ePxldE4iFk6PEKsDF4cLyr0vG6i2uSAoNEjt+ad0NqYP3fnDNgT+9C?=
 =?us-ascii?Q?ySPYRRq+j1epWhL+dPAhUIzAe4XW3ZyyPpCjFN104a7A7c0iMCESPQVUmJd3?=
 =?us-ascii?Q?4KLfVQ7fAKxBfbOBDMZJhUemcz7oOfjlKn7qhDHBmPgWoA+y6nPMrHj9bhMM?=
 =?us-ascii?Q?jHgoiEjo5rEvuhMnG4FSQMoDeu4vnO84MtYrQHn2hIT5BkXKEfFsMj5zXKsr?=
 =?us-ascii?Q?bLYpIwVSP29010nPNwBR0CqoxYG29BmS33X4lNx5Jf0CWWbyyoTYD6uZyRfw?=
 =?us-ascii?Q?Yx/8qNwNcuhO2WSccA1zk68viNNGGprGcUOJSDDESxqbAnX+fYRMJUA9CjXt?=
 =?us-ascii?Q?/SmVDhrtM2UbUQHepeN92jP4fEKsRZ4dBQfzGtAz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NevbpWFg0oxIgd+3R/T73qGtVTwarO+6MYHZVmynym/DkmToHXm9bS+5T3GK?=
 =?us-ascii?Q?rcd8K+wCqBlxtlLXDPHA222pdHFbk1zzWOfFEd6HRoigPtnMFq5qSOo75SBg?=
 =?us-ascii?Q?zWtqfE+Z+YAkTz6gIA2h+HG/FZ2r4VmHXlExQfFOwX0/n0om5ahaZOl09LIi?=
 =?us-ascii?Q?hIYIJ+Z1ybmFIN4Be5SPlnqi8D8y7E3PWus6HV8o/WGGe7u3/IpA9HY7DBtj?=
 =?us-ascii?Q?gAai4dvQT3BHmmIj2Wy9Z0+49uYUOWEW7qxnpP3Fre64bYVAV32TyTg9oebO?=
 =?us-ascii?Q?S1toJBx6wsKo1TZpfOzHIjF+W9caD+v8JAc9n57F49UT2FBuYipCXRMgzc8l?=
 =?us-ascii?Q?q+CtPnJvQpBAZCrcrkXB68LZRevN2IOAlYlh76T+qKTUmBIVQ0fJP1fri2vs?=
 =?us-ascii?Q?YxPMDgvD9xJvLQ0h9AkfCQ72vhwaicuJbtU/u92eLjGRYWHsUse6MPkuFw4w?=
 =?us-ascii?Q?aNevFnjVknICdJ5MSeU4CVoj2BW31qD0RyvxWTQQ5Lt+cBKdMV+Yur/oobpT?=
 =?us-ascii?Q?30Nu9fkM66S4FGpar21SQpkaGOh/1MZhoz8HfGvAx2iOZLwO0hg7L7+VB1VK?=
 =?us-ascii?Q?Rjvo/t5ug4Iwknhnf8xZOR844Ggw0p66EQakt2LLpnd1vaogOPRdsWagxuxx?=
 =?us-ascii?Q?t0ngEuHkvo/11eLWc1t2Bl0nO9jcA6e5PrtR/ENTQuj2jZy363wKHs2Y2Tw+?=
 =?us-ascii?Q?IgUlY6c6jFE8fGpo1nsII7PNgJZMxnZvphkTJ4BUm8XcFwuhwKLn9n/1CPsP?=
 =?us-ascii?Q?fG6GuhZJZwaSYTLBiREcPmy+T9tyhp4JOZVI1/Tgb0AZCGZz275C3tZSOkNY?=
 =?us-ascii?Q?QydRfG7bs+UQcw1r9twEyvx9te5KgjMGgUDRlOtj7GPde6wuroi4wZiHJ8wM?=
 =?us-ascii?Q?7bcT0TX0g/ueA5b3rJRI4R27i6jLj33CwIn7PjIMQPAe0aOfCno4ANVms4eD?=
 =?us-ascii?Q?83hG+12cf7EujHIuNCaK7g6vjnoAbb2jBe3RT+IOxI7ZWELX9qr0wcWDNT9x?=
 =?us-ascii?Q?mrVMpREpBbhTBVIDVVwoAJke6+FodLIlAV57+vZiyPjoRS4zlXXcTCHF0t2t?=
 =?us-ascii?Q?CRoMjB5Q2HbqxLmP19B79wJaBCtTgQUZIcyEuFxJOyX79edc15rcx5alKI+K?=
 =?us-ascii?Q?g8F3p2C+0kAj0ZXZY6XaBJKOmOVWHNuSZXJ7Ail/DWof5FRd2ijIMWbaoJUd?=
 =?us-ascii?Q?w46Pho2zrq9g1EVtEhZoszICr3w6XQDuYLJ+SlOLpk/Efem52RjlHOo6SP/n?=
 =?us-ascii?Q?GCCYDU04sdqBYUjCA5fAquKaN7/b40TLslEUOxx/dfehOFNHQXQk1JFYri/p?=
 =?us-ascii?Q?1g+cwFGJJn2+r8P51xf0kAyGx7dVjEYXntEwNPbGzRZiLBtWsOdgWg/YzM2S?=
 =?us-ascii?Q?oM7ChF7n9akLG9vA3Aq1YCwwflyCVbbyKxcfE9DGeFcM4kVahsU2oieDQDt/?=
 =?us-ascii?Q?hGSHUcoqYCrY5Wu6Cli6VSfz8qChrRZtli/KzCqsB81IG305Jo30Ac7FTTqX?=
 =?us-ascii?Q?3sWPu1mabsMGLH23OgwwhifuAarjW1Gi/NrB7drTiRfj84oyJ8eAQqaVaciC?=
 =?us-ascii?Q?88T9EiAWKa51lrICVTgYg24wqUHVz6Z7XgmG4rk3kJ6eLLKUomXUwqiNGsVB?=
 =?us-ascii?Q?R9orw0VnPwykziTCXFqWnhP3TM8lnPIuXxZ+YtJ78vPvee+w7gUCkdzh/Y1Z?=
 =?us-ascii?Q?wdMJ6n/zHilyctITs4svFMjzR0nlizlr+teT1WrgQy/MGOjl53xmAn7DC08l?=
 =?us-ascii?Q?7ocjAvl2rdKTaKrLJyZ2fIeDF0Vhf0c=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vLTqtREpr5qW7GE9U3HnvbRURqbS4j/kNOoSKtSNoN2a+E1gl3tJ1haHV1m3NfIwNDXOlNNxuxzQp2QQH78uhJvTYhlTOa+nRhkDVJN8ViLOjq0UPB48zoUmcmmajZ/RXmY5/nvmbjp+UW8chMljWezyX9wDuryJ0s4J+/R0hGtX/mginll5fthdq8qkvbyrXVNuRzWG+OC2MgfCRmMwcsuOakZjGRRAd74HSAO5yHOkXbEKuFA5sToYxyV5JXSmpBoo0zXoaK+MJIzMEyYdOhlAVspvZSsOhlNsf3YOkICq+pXpMXtXbPMkTfTE7+lt3YsfCGZxa9uVLlpLyw0h2NDXk8UfMMfqsrAbOrsLzxX/RgI48fc/CxYAMWWJDzB2IbqNap/dDQhqU9F/D2dIb1WIQYrkMiyD9wPpH9O7s4OCkg+ucspSxR0MzPStBh2RKVfcDjW1kqXeCAY2sf/Xd1BiyWBwBAnhOfcF1cSK+4PJLO4AQXiLs6MPz2GKky9AFX/eVRodYKMApuUb37d6sG7oRMlP4+xCqJBoMmsQRJuv6FsfKtWpoHICG4rqoyhb2VRKKveoZH8EoYmskGNb/uWLUYIRHR6fcrNMj0LEjoY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e14d52-056c-41ea-9f8e-08de58128048
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 10:56:01.9505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Vn3Jh0M4ah0uiBM9HlrSxMfQRIfZl8Gty0Prt401k66a78g3jBYW4n8DlVLN30fPcxiGlif3WQHnNXtZiykYJYqAdEK1LBdBMdJ8idzUUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7730
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 adultscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601200090
X-Proofpoint-ORIG-GUID: D0AvMp1WTcPd-rwUMzRhElDuvU4QWNCz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA5MSBTYWx0ZWRfX+4iIuF4ZXnl0
 97XKLr89h7Ip24kpREKEBnddMgauIGMs6G7RanHa7nH4r1PvMFAHLtFYZ/4Nt5ccBRcSEtp6KoL
 CivW+/HxB6rOW+4SPcE0+KZqpfkwOI1dRfyDZeSMT30s+LXMAnimiZFgX3jL0sUiCqbsBjOEuYI
 M6cbc9WWHnrtm9COJICGoG+I+IdhDxaQgY111j1thKiwRfViFR7CD2vbmVVJGKvHJ66ZLW9dWel
 Bi8mymHhJi3B90h6GQ2d+aJ7s1Rmp2TmXeNNRa07CmFLoMgGIV4k+UzWsDZlK0YIixW+edmv85g
 7lBEc9mtkjWCJ0+7QJ6kklck9C+QeXg7V9rC4L+vK0B3Jx/SYeCH077RG1TzmUHNVTtI+p/f5BD
 ciD8NOgFCFbaDJtf6siqgIHAll9OkKjpEV5aBo47GHm1ACnb4ie8LdWkPLxR7FkCShWxPAmT21b
 tfUDkDRM7G+m77l86+A==
X-Proofpoint-GUID: D0AvMp1WTcPd-rwUMzRhElDuvU4QWNCz
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=696f5f47 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=NEAV23lmAAAA:8
 a=-zG7TFIknHz9pT6no6cA:9 a=CjuIK1q_8ugA:10 a=mmqRlSCDY2ywfjPLJ4af:22

On Tue, Jan 20, 2026 at 05:10:47PM +0800, kernel test robot wrote:
> Hi Lorenzo,
>
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   e4348a62bb1acacafcdeb149c9363291fae08c0c
> commit: ccbdd8044f13617fe9f2bce61aed556314544664 [418/422] mm: update all remaining mmap_prepare users to use vma_flags_t
> config: arm-randconfig-r131-20260120 (https://download.01.org/0day-ci/archive/20260120/202601201701.IhxeGffs-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201701.IhxeGffs-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601201701.IhxeGffs-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> fs/orangefs/file.c:414:9: sparse: sparse: dereference of noderef expression
>    fs/orangefs/file.c: note: in included file (through arch/arm/include/asm/cacheflush.h, include/linux/cacheflush.h, include/linux/highmem.h, ...):
>    include/linux/mm.h:1048:16: sparse: sparse: dereference of noderef expression
>    include/linux/mm.h:1048:16: sparse: sparse: dereference of noderef expression
>    include/linux/mm.h:1199:46: sparse: sparse: dereference of noderef expression
>    include/linux/mm.h:1199:46: sparse: sparse: dereference of noderef expression
>    fs/orangefs/file.c:415:9: sparse: sparse: dereference of noderef expression
>    include/linux/mm.h:1048:16: sparse: sparse: dereference of noderef expression
>    include/linux/mm.h:1048:16: sparse: sparse: dereference of noderef expression
>    include/linux/mm.h:1216:48: sparse: sparse: dereference of noderef expression
>    include/linux/mm.h:1216:48: sparse: sparse: dereference of noderef expression
> --
> >> fs/ramfs/file-nommu.c:267:40: sparse: sparse: dereference of noderef expression
> >> fs/ramfs/file-nommu.c:267:40: sparse: sparse: dereference of noderef expression
>    fs/ramfs/file-nommu.c: note: in included file:
>    include/linux/mm.h:1954:16: sparse: sparse: dereference of noderef expression
>    include/linux/mm.h:1954:16: sparse: sparse: dereference of noderef expression
>    include/linux/mm.h:1048:16: sparse: sparse: dereference of noderef expression
>    include/linux/mm.h:1954:16: sparse: sparse: dereference of noderef expression
>    include/linux/mm.h:1048:16: sparse: sparse: dereference of noderef expression
>
> vim +414 fs/orangefs/file.c
>
>    397
>    398	/*
>    399	 * Memory map a region of a file.
>    400	 */
>    401	static int orangefs_file_mmap_prepare(struct vm_area_desc *desc)
>    402	{
>    403		struct file *file = desc->file;
>    404		int ret;
>    405
>    406		ret = orangefs_revalidate_mapping(file_inode(file));
>    407		if (ret)
>    408			return ret;
>    409
>    410		gossip_debug(GOSSIP_FILE_DEBUG,
>    411			     "orangefs_file_mmap: called on %pD\n", file);
>    412
>    413		/* set the sequential readahead hint */
>  > 414		vma_desc_set_flags(desc, VMA_SEQ_READ_BIT);

This is totally valid? vma_flags_set_mask() (which is ultimately invoked) uses
ACCESS_PRIVATE() consistently.

I wonder if mk_vma_flags() is an issue as it ultimately does (const vma_flag_t
[]){ VMA_SEQ_READ_BIT } here that then gets 'dereferenced' by array access in
__mk_vma_flags().

Nothing is accessing __vma_flags in vma_flags_t directly however, it's all via
ACCESS_PRIVATE() as far as I can tell?

>    415		vma_desc_clear_flags(desc, VMA_RAND_READ_BIT);
>    416
>    417		file_accessed(file);
>    418		desc->vm_ops = &orangefs_file_vm_ops;
>    419		return 0;
>    420	}
>    421
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Thanks, Lorenzo
