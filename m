Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795222507;
	b=r2inXSTNk+DRyspZ1+upHyFnE91mH7gDQYVMldksRbFlnNWO8Q5hs4Lsqv76LOWFR4PG
	 Y++ipQ0+BtujR0OnRhvCtvYRhEda+l0EhzjUSf072df9XE0y486X/mE7aH+KCbAfDjbLA
	 5rENqi0dCpZv3L0wIqESYkBW60uZMEHRHQfjnP09qsYMCXKlOK+s6a16pUVL+qHG4QAJJ
	 oHKUwbesYehTSe+X9eLSqSTbtU1FUxRVc/yEwIEQuM1NnDMsJUq5dfelEKSQl6qNmZPdH
	 pRnbmf6SgUNgrggbxe9TcVg3ttHsa1+HmTmSuNwz8kH3ntqtub1dmI3acqSmRAiT9Pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:Content-Type:Content-Disposition:X-ClientProxiedBy:
	 MIME-Version:X-MS-Exchange-MessageSentRepresentingType:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=Zpbsfqwg2nB90LTYPVoCE+pZiuIgreUUipgDWVFiVIE=;
	b=oDe23CAifJIn+jWmumHtwoRKhRUUmFcr9MaPIsx4YOJUe2gOiwdgfTWorN/zskXrGiS9
	 vTaiuu+75kBMXYAd5GKFbTyVEovvnstA/i93kF2KLg5dTsygxRB6XGApGV2aHx4r3hvvE
	 AnURxtW18BEORt5L7tuHKcMgucg2kP9GwdrX4GRlLxGw4M0zSuVRG/BD0LaiC4rHjO1cG
	 2XHsnwML+BEgDKMNsIOpIy4T0hXgqVZr0xXadoCI1KhHyYGFxipC1+3d4E7OyosfxQKD3
	 gFOMJoNmkgooZMXZW5Ulla/E0ahDDDn1U72f0QshtuSPNpVqPuD3INOoYnQ5jQL05cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Aj/qWq+c";
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=GKrXdjiy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88699606A33B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Nov 2026 00:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88699606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Aj/qWq+c;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=GKrXdjiy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795222503; x=1826758503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BMCmAG21IeEkc+5IbZZk/gAGqtX3hGlpE5bnq6tK2bE=;
  b=Aj/qWq+co8y0J6++iWsfJ6TEr9qo5pj8Y276zBsvFj2bQRtuv7G6HRDq
   S/zy5jDQvicZLB68d6okq2ouboQhHGJbCepPJdkSZ1CojdpCAbyegnX54
   76tBL6HvX6OUoVveyDZFjmHDHzzpJeWhKc2KVeKWLesf3S4TSCz6qJyhG
   duVz/Q8243GAQps0z0eUhykJzNBRTQb8HNbioc771QrMrsVTs8fjizmz4
   jo84vybg7x74kN+bUxp5WhlAYqTUXeKu66wTDRaSRSqq9wIsv67+3lB/x
   sfuXHDUWI4w18qbTuK0jBJ7a2KCoDaChaar0bJC2z4VZu07hpTKJUtc9A
   w==;
X-CSE-ConnectionGUID: spQhnFa1RtyG70SXVTm9Sw==
X-CSE-MsgGUID: IvV0bB4ZQ9GUbWIxeic1yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4189275"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4189275"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 16:55:00 -0800
X-CSE-ConnectionGUID: cFrUIxiTRyiZnIE9pUweXQ==
X-CSE-MsgGUID: bpZBJgYsSAaaB/K+UyyqFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10768767"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 16:55:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 16:54:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 16:54:59 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.23)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 16:54:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBe0Fh1E2ujBsJNB/m6GX3vAy/bVY8jbB/pCVqpAlQTFLQtyU5aWoQfxJcNB0H3RfjYmx1MH7DZGNQnhLYDrn2e8c/Qhk1SHpNVlMBZRTseK0fQZS+JqBuLTAozToSNlNQhiJBOcVPdqzg2A9PisxMWjaa7IuJE4scVnXj7o6d58J7fGYibCfjoF13fx5cFBtWknY+MvtQ7oaC2cmqBWWrlmefDf4OFt/JXIDnt5DVUO5lGpbEiTLV9XU0MnSE8aMmKty0GTLhszRR4CbMHXMOtf479NNYcXDgS3l+YQB/yrfFasXDwAIXwGtEcxJyekdMeV5CE3AJpIiypRqbn8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zpbsfqwg2nB90LTYPVoCE+pZiuIgreUUipgDWVFiVIE=;
 b=fAdM21Rw+EVozoMjb4qx/YOUo4V5Eqr4p7ihwc/3Iyw74nWdAlmuoe6ABJJ90B6k9kLT8fxN5Xfffb3FPgdm9qysA0jgjxFOjKIRdKaAhT+lnFLsDOHuujMD/LxSsuJ5PR069RPDy89iJnDAib6igIGT4MaYxBa4WVgkyVTNhH2B1mjLiQTgoGh6NykdYUcqwkTbbQPXu/FL55WqbZJr8MPAmNSxzILpti28C9ApoiUmT+5IWigib1ro5cEmQL9t7e36uEZLxw8+sehEf0y5fMnLy2fOqGI8PHprLM2C21B2kRhgAo+tR4xxp3A01nKcbFQQbfufyT0EIzeVMoh4iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zpbsfqwg2nB90LTYPVoCE+pZiuIgreUUipgDWVFiVIE=;
 b=GKrXdjiyED9k7bF9VVKi9Y4VT+LWe6GsmXicgltKVHbWK12cmNqpW1fwqNsFQt/qu+FAvOvbICtW+x7d4GScY0Bj7RngVqogBmA9x7tw+O1yU7exobGrH4O+Ei6EffIiYCGHSJZVVoP3IZEWg7+Zjf9aGFSA7jTC4JExDRdb1aE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by PH0PR11MB7544.namprd11.prod.outlook.com (2603:10b6:510:28d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Sat, 21 Nov
 2026 00:53:37 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0639.011; Sat, 21 Nov 2026
 00:53:37 +0000
Date: Sat, 21 Nov 2026 08:53:28 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-snps-arc@lists.infradead.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [linux-next:master 8956/10560] main.c:undefined reference to
 `__st_r13_to_r15'
Message-ID: <awDriH64LFbN0dkI@rli9-mobl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::20) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|PH0PR11MB7544:EE_
X-MS-Office365-Filtering-Correlation-Id: fbac0663-2cea-472f-9e66-08df4769e043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|261022075727099003|261026140227099003|261026121527099003|56012099006|11063799006|261022105027099003|261009223027099003|261028144727099003|18002099003;
X-Microsoft-Antispam-Message-Info: MxmlOLmN/ZTu29d3Wlj/mwWK+3IiKGedwYGdH+KT49B3sLI9sV6krbNH4MB49kbRJTHPsxABWXae6FrDMVD5+LeMuBkgUiC7qI5/Y2bik6xUmOPOvGIxFJ/3EWJWubsAc2OoAwKdK2sp49KwrgBE+C4yumy/0QW/yn5oCFGOAyka0/fUtCA5Cnslm4TRUrYt+EHadl7wVCKi9Krpja4k78BDgwhucFpaxli07K3H//sdT0d6bG19lVyLZt3kB8P+ZM8Fxwr4yH/sa4Y1Grn1grC0YiIvW9Sa/wWbVEFOLEGe1nxGwaWhta6KJ1xoBjvSqq1Gy8ChIG5HCvXb5u0qGKVxQDdWMlXe/HhiO45QJVVNZhpxGW3993cUft5mqDvzsUHiKMtaBc7FS0ni1tXMXvk4hjaG13iEdyGTvkNJLhZF5HeXWjpahIzWAcbF29yYonrRMCbHKJMqN3OM+ync3Ab1Gsh+11HJfzWKt6tsV1nVm/n+AKJ1XH6jD2mL1TB/yLQnXjvjl5Y+M/X0g+qq7X6+I5FVtP8LSZeUITptxUxdNzSmZVeUWqDc+RC/yfn65VerdtZsBitho5OXYXP843GfAlDDT+sn4EoujVw/lv0YZkwNjatxfOpf6nijmZi6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(261022075727099003)(261026140227099003)(261026121527099003)(56012099006)(11063799006)(261022105027099003)(261009223027099003)(261028144727099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kPYrc8934s3MLSEqRPE5RYQTQd2A/Xz02MRIOPUVBMi3GQCh6/YSnEicFmV7?=
 =?us-ascii?Q?b3ez3nkS2wS8K06yY5Y94kjyXC2Gb6WP0eJJi8zqCrmH+MZaIFtRMLz2TlFl?=
 =?us-ascii?Q?XuiIY7LD9clWgYqH9x147e2WcdY5b0asHuAynrM2POPMmGp73OO9jZ3LTTmH?=
 =?us-ascii?Q?SOyb1PjC5z3CoZ9D6xt6gNwVpuDvCBgpXBB/OvWpuSYuc8w3uCF47vtifBsm?=
 =?us-ascii?Q?FHyYKfg9ruczOzfmeKb2gr7Vf/3hkAwB+NGhQ+MG7+BfE9MsvfWfKIw548fj?=
 =?us-ascii?Q?4uCHRoDfRYdfyegj8BRrAG0BF5Cxp9nMTfG+OTO0OtnTR2iiC1MdBxdrpY+5?=
 =?us-ascii?Q?OT+Mi5nenAo5ww0BseqPYlcbNvK7kSYcdwXAPCvx6AHJgp9skxoiTUn02i5j?=
 =?us-ascii?Q?yyLpTlNr8mxsQHvU7NKZNCJjEUYJd4CP20VjmwK+X33p3KWXrXWIOll7nFvq?=
 =?us-ascii?Q?3+1o8QPre5OEn9dimj9al5tIhh7RMynCzKX/4SHvSBLUZUNufq4kpDZP8ukh?=
 =?us-ascii?Q?vsNpQyJ3mKptn1Ig60LvBWBUXYOMY4WZf2ZJj0VjDDd7OC/3miV8mFHXI7IB?=
 =?us-ascii?Q?3ePB59cY6+JPzfl4xupjSwcYj4L5OmuFDOrfrSDF/5oAvj+Ngx4GJIRiTD2J?=
 =?us-ascii?Q?QkYg7mos7gdZszdjmXWhg6eyGrm1tX4f/fHPwIW+2uS3DvjbtFSnhzbSkZiG?=
 =?us-ascii?Q?02aR+ov1I/m43Is8UhPXQNoIUdA2YlWuN66ghko8/f7z6ItTrkwIrQIMD8xl?=
 =?us-ascii?Q?v3Zm90BUKR6X4whPPpdaE7LFgDJkg/8JUUM3LQAc2mwsuZ7JqoNu9JaABahd?=
 =?us-ascii?Q?tmmGGAUtZv92gfwXlEgs4jlHxcbEU5PIijXckWYGf3nOfE2SxNh/iYIRDP5y?=
 =?us-ascii?Q?1a4Eu8FcKbxmnmtTjmFQSrkuV5sqPteQqBcBIkMLb3fgDAkSxemKm/slLfXI?=
 =?us-ascii?Q?gpH3CjhHDsObSGMWd/uW9G+AF3sF8HztPYZ1f3rTpgyhZSwjOelGZ/Q0jhMi?=
 =?us-ascii?Q?VlDC/iyyEdjeUQxML/hJKfoGOR5ivCApR8PVdl8VaPZ72G2VKEAV+LQvzGz/?=
 =?us-ascii?Q?gCwWNlp+FPQV6GiW+plFFsARMi47hbittvNZUo6oLO/22Fp7DrLXeSKlzR3c?=
 =?us-ascii?Q?r7nXtQkkBkeuwTaQE2G0dPtCN/CwilNQQC+MSaJlM6loAlDC6PdFXVlHuSG5?=
 =?us-ascii?Q?9Lt0/PoXzGYBzAj2umNC5v8A4+F+r/+9p8LevIz89SK5r9NADyDkM5eCjsR5?=
 =?us-ascii?Q?hRKFgZ2IGvTQ/28FG4BUYUiWI+8yEYXZgjc0mNY+Ak6V41hSbxgCEQvHrAWQ?=
 =?us-ascii?Q?MGymycGNZa80vVcb8n8sdLMwFPTyEvpdVvbzuj6BW6hiYsQHOjdkzuUKmuXP?=
 =?us-ascii?Q?0HEn/gMfK6pfK2sZJOMncIaCBM74/BIE8dKf6KINt7YxjpqgK+Of9Tgu1M37?=
 =?us-ascii?Q?az1/ti9top4ReSr3T9eQQpKJnmO3BnRR7PgxMj1L7tYRwdlh89dO2XwHKrbz?=
 =?us-ascii?Q?LkM9cCAKi3K+jEcirKNjtZcBQ87gAwjsCQJKcUcpFxl+wJKqTMgMbC3U+h6H?=
 =?us-ascii?Q?MbpxCaBs6K3KPPkccCz4jMd8mfrbGrSUGPjIqCJPXEda6h+DsvvSX0/9yXUw?=
 =?us-ascii?Q?131+Wm2ZI6tvb0gyiTsMk9WW3CAJ/JUqoZMxXOUc1hse1v07g1T7yPTtiSg+?=
 =?us-ascii?Q?806Ex6RNs6GdTsPYMhziUFy3m6RTOca9IrPFQhcZ/8CDUsAlACySpzZA/+n1?=
 =?us-ascii?Q?WxpjdQ7RUA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 4nZ3wTKJ0y5Nbh5Egk7TabRfMm30KNOW0qZrF93mdK8wly+Ws7sOBY562Qh/7Kj/EK3EKuhHgLw0I61cyO+u1PvLdJdKYH4xh5SPe6v6UqTekvbVmRmya3hZFT/nWczp0/vZwLkfh1EWWm6ovXybxdi4H8ew6Yj4eg5GRiWvE2ttWaKY5epi71q4kRYsGHgezBAHhfMRSeo+8LyjSU5VUMuNCqy6uv7ShiCCkzYu4Llr9VI7wdM8dXSNJXTyjNaNzS+Y1IiUjhSEqmsG+aXjzWm8AKdv0zbz5ClKJX+sTST2Rr95nuSuwjoxpYCaeCQGrDkWQEt7iON3ACydIVkNmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fbac0663-2cea-472f-9e66-08df4769e043
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 00:53:37.2618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/ZAMTsh5hGzN7GEPY2h29eUgWHCXF5Kh7m+bI3Xa75ZBXMmk4QoQyvJtuyzuj2iA8FpLzooQmULpeh/RPi/mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7544
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   909ef7a9a30fa139e69e555e3606680f5cca7726
commit: 86a4eab2bd8313fec6e54742e3ea187b65b86b07 [8956/10560] ARC: stop linking libgcc
config: arc-randconfig-2000-20261120 (https://download.01.org/0day-ci/archive/20261121/20261121004452.TskH9STt-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121004452.TskH9STt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121004452.TskH9STt-lkp@intel.com/

All errors (new ones prefixed by >>):

   arc-linux-ld: init/main.o: in function `__traceiter_initcall_finish':
>> main.c:(.text+0x90): undefined reference to `__st_r13_to_r15'
>> arc-linux-ld: main.c:(.text+0x90): undefined reference to `__st_r13_to_r15'
>> arc-linux-ld: main.c:(.text+0xba): undefined reference to `__ld_r13_to_r15_ret'
>> arc-linux-ld: main.c:(.text+0xba): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: init/main.o: in function `perf_trace_initcall_start':
>> main.c:(.text+0xe0): undefined reference to `__st_r13_to_r16'
>> arc-linux-ld: main.c:(.text+0xe0): undefined reference to `__st_r13_to_r16'
>> arc-linux-ld: main.c:(.text+0x16e): undefined reference to `__ld_r13_to_r16_ret'
>> arc-linux-ld: main.c:(.text+0x16e): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: init/main.o: in function `perf_trace_initcall_finish':
>> main.c:(.text+0x178): undefined reference to `__st_r13_to_r17'
>> arc-linux-ld: main.c:(.text+0x178): undefined reference to `__st_r13_to_r17'
>> arc-linux-ld: main.c:(.text+0x20c): undefined reference to `__ld_r13_to_r17_ret'
>> arc-linux-ld: main.c:(.text+0x20c): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: init/main.o: in function `trace_event_raw_event_initcall_level':
   main.c:(.text+0x214): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text+0x214): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text+0x2f2): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: main.c:(.text+0x2f2): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: init/main.o: in function `trace_event_raw_event_initcall_start':
   main.c:(.text+0x2fc): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text+0x2fc): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text+0x36e): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: main.c:(.text+0x36e): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: init/main.o: in function `trace_event_raw_event_initcall_finish':
>> main.c:(.text+0x3a8): undefined reference to `__st_r13_to_r18'
>> arc-linux-ld: main.c:(.text+0x3a8): undefined reference to `__st_r13_to_r18'
>> arc-linux-ld: main.c:(.text+0x41c): undefined reference to `__ld_r13_to_r18_ret'
>> arc-linux-ld: main.c:(.text+0x41c): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: init/main.o: in function `__srcu_read_lock_fast.constprop.0':
   main.c:(.text+0x624): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: main.c:(.text+0x624): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: main.c:(.text+0x678): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: main.c:(.text+0x678): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: init/main.o: in function `trace_initcall_finish_cb':
>> main.c:(.text+0x680): undefined reference to `__st_r13_to_r19'
>> arc-linux-ld: main.c:(.text+0x680): undefined reference to `__st_r13_to_r19'
>> arc-linux-ld: main.c:(.text+0x764): undefined reference to `__ld_r13_to_r19'
>> arc-linux-ld: main.c:(.text+0x764): undefined reference to `__ld_r13_to_r19'
   arc-linux-ld: init/main.o: in function `perf_trace_initcall_level':
   main.c:(.text+0x778): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: main.c:(.text+0x778): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: main.c:(.text+0x856): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: main.c:(.text+0x856): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: init/main.o: in function `do_one_initcall':
   main.c:(.text+0x860): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: main.c:(.text+0x860): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: main.c:(.text+0xd4a): undefined reference to `__ld_r13_to_r19_ret'
   arc-linux-ld: main.c:(.text+0xd4a): undefined reference to `__ld_r13_to_r19_ret'
   arc-linux-ld: init/main.o: in function `do_early_param':
   main.c:(.init.text+0x78): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: main.c:(.init.text+0x78): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: main.c:(.init.text+0x96): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: main.c:(.init.text+0x96): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: init/main.o: in function `unknown_bootoption':
   main.c:(.init.text+0x17c): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: main.c:(.init.text+0x17c): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: main.c:(.init.text+0x264): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: main.c:(.init.text+0x264): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: init/main.o: in function `xbc_kernel_param_filter':
   main.c:(.init.text+0x2cc): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: main.c:(.init.text+0x2cc): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: main.c:(.init.text+0x322): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: main.c:(.init.text+0x322): undefined reference to `__ld_r13_to_r18_ret'
   arc-linux-ld: init/main.o: in function `xbc_make_cmdline':
   main.c:(.init.text+0x37c): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.init.text+0x37c): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.init.text+0x3e2): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: main.c:(.init.text+0x3e2): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: init/main.o: in function `initcall_blacklist':
   main.c:(.init.text+0x444): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: main.c:(.init.text+0x444): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: main.c:(.init.text+0x4f8): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: main.c:(.init.text+0x4f8): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: init/main.o: in function `start_kernel':
   main.c:(.init.text+0x588): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: main.c:(.init.text+0x588): undefined reference to `__st_r13_to_r18'
   arc-linux-ld: init/main.o: in function `kernel_init_freeable':
   main.c:(.init.text+0xcb8): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: main.c:(.init.text+0xcb8): undefined reference to `__st_r13_to_r19'
   arc-linux-ld: main.c:(.init.text+0xff8): undefined reference to `__ld_r13_to_r19'
   arc-linux-ld: main.c:(.init.text+0xff8): undefined reference to `__ld_r13_to_r19'
   arc-linux-ld: main.c:(.init.text+0x1016): undefined reference to `__ld_r13_to_r19_ret'
   arc-linux-ld: main.c:(.init.text+0x1016): undefined reference to `__ld_r13_to_r19_ret'
   arc-linux-ld: init/main.o: in function `run_init_process':
   main.c:(.text.unlikely+0x3c): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: main.c:(.text.unlikely+0x3c): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: main.c:(.text.unlikely+0xde): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: main.c:(.text.unlikely+0xde): undefined reference to `__ld_r13_to_r16'
   arc-linux-ld: init/main.o: in function `trace_initcall_level':
   main.c:(.text.unlikely+0x210): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text.unlikely+0x210): undefined reference to `__st_r13_to_r17'
   arc-linux-ld: main.c:(.text.unlikely+0x42e): undefined reference to `__ld_r13_to_r17'
   arc-linux-ld: main.c:(.text.unlikely+0x42e): undefined reference to `__ld_r13_to_r17'
   arc-linux-ld: main.c:(.text.unlikely+0x43e): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: main.c:(.text.unlikely+0x43e): undefined reference to `__ld_r13_to_r17_ret'
   arc-linux-ld: init/do_mounts.o: in function `do_mount_root':
   do_mounts.c:(.init.text+0x130): undefined reference to `__st_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x130): undefined reference to `__st_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x28c): undefined reference to `__ld_r13_to_r21_ret'
   arc-linux-ld: do_mounts.c:(.init.text+0x28c): undefined reference to `__ld_r13_to_r21_ret'
   arc-linux-ld: init/do_mounts.o: in function `mount_root_generic':
   do_mounts.c:(.init.text+0x318): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: do_mounts.c:(.init.text+0x318): undefined reference to `__st_r13_to_r20'
   arc-linux-ld: do_mounts.c:(.init.text+0x4c4): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: do_mounts.c:(.init.text+0x4c4): undefined reference to `__ld_r13_to_r20_ret'
   arc-linux-ld: init/do_mounts.o: in function `mount_root':
   do_mounts.c:(.init.text+0x598): undefined reference to `__st_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x598): undefined reference to `__st_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x5ce): undefined reference to `__ld_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x5ce): undefined reference to `__ld_r13_to_r21'
   arc-linux-ld: do_mounts.c:(.init.text+0x7a6): undefined reference to `__ld_r13_to_r21_ret'
   arc-linux-ld: do_mounts.c:(.init.text+0x7a6): undefined reference to `__ld_r13_to_r21_ret'
   arc-linux-ld: init/do_mounts.o: in function `prepare_namespace':
   do_mounts.c:(.init.text+0x7b0): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: do_mounts.c:(.init.text+0x7b0): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: do_mounts.c:(.init.text+0x8b2): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: do_mounts.c:(.init.text+0x8b2): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: init/initramfs.o: in function `do_utime':
   initramfs.c:(.init.text+0x14): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: initramfs.c:(.init.text+0x14): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: initramfs.c:(.init.text+0x3e): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: initramfs.c:(.init.text+0x3e): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: init/initramfs.o: in function `do_skip':
   initramfs.c:(.init.text+0xc4): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: initramfs.c:(.init.text+0xc4): undefined reference to `__st_r13_to_r15'
   arc-linux-ld: initramfs.c:(.init.text+0xf8): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: initramfs.c:(.init.text+0xf8): undefined reference to `__ld_r13_to_r15_ret'
   arc-linux-ld: init/initramfs.o: in function `flush_buffer':
   initramfs.c:(.init.text+0x1cc): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: initramfs.c:(.init.text+0x1cc): undefined reference to `__st_r13_to_r16'
   arc-linux-ld: initramfs.c:(.init.text+0x22e): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: initramfs.c:(.init.text+0x22e): undefined reference to `__ld_r13_to_r16_ret'
   arc-linux-ld: init/initramfs.o: in function `maybe_link':
   initramfs.c:(.init.text+0x310): undefined reference to `__st_r13_to_r24'
   arc-linux-ld: initramfs.c:(.init.text+0x310): undefined reference to `__st_r13_to_r24'
   arc-linux-ld: initramfs.c:(.init.text+0x4a6): undefined reference to `__ld_r13_to_r24_ret'
   arc-linux-ld: initramfs.c:(.init.text+0x4a6): undefined reference to `__ld_r13_to_r24_ret'
   arc-linux-ld: init/initramfs.o: in function `do_header':

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

