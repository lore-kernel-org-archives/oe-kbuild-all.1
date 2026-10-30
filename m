Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793326278;
	b=OPCuYpHrR+E5Ot6zWlEQfLggjj5IsH+9eQ7LWYIzeHDCiqULwYJxo+9YnxGKG+eMjiAz
	 lx+aE5qgYpivB8Oh6fffBp4aA9EVhQI16SMKpNKS6F+C6jcOZT8oCBSB3k/CHhtdCpOZj
	 KabJQ4D70EE3kVP64I3jr7v9x7NuzCckdnM9dDLE+8CIYWWa1S9diIf2V9bF1cZRlpWNz
	 oYg+/+yCYitNjPs+qVhahbxa9Ej7D+c/aLbMuugccaTUE/OREGEBcQJvmIga0VCT2s3q2
	 Y8lsXU0GpC2SUyAHJE8ELQzKou7Ye8Q0VFs/P/eW0CFuBMYvj3LVlQxD8FbeuSnzqhA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793326278;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 Content-Type:Content-Disposition:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=C3mF9b/k6lttnS3XTD6N02IARn3F4bm6XXaxTuY+7ac=;
	b=xN0Ztzsp6n9VtzJME+f4V7Lte2eZjwIL5shC6xHrUGR/VDuYDuPxfWKZCO0hD2Uv+sSP
	 s/SjbCTKPJvtI57YeKig3hpliFWHsbiqIwW2TxPPbdnTiH2PzTWQU0D5OV3MaYnZloirK
	 qzGdcz4Vn69f6r/liXLS7EDrNOTEOhxirrGeq+yGD2AYRiK5jH76SVoUNevB5vniAHHKu
	 K+5Z9JGESRDsdLZThnUj+0O65lkJ0iAK1cRCZ4iAcymMEF5F8E2HVDFTv+PkvJp4hNYYt
	 +SmdjVXPu9DaHsFw2FQ+P4EuTQvUDgm5UNNt2qs/LTyoEzxtEHj3U+dwxA43zJRirdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fa2AnO5u;
	arc=fail smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA54D606A31D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 02:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA54D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fa2AnO5u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793326277; x=1824862277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M9w5Y+cQCXvhbqg/WG8nac0au8zHyHxuSEKjzJ8fGEM=;
  b=fa2AnO5u0yxYmTc1u1Cap/FF9DH3Z9up8x8EtAAbr/Pft6T/tfKFpzGf
   Si1Ag9KGTbComG/loXiuFai5vu4f5NTLA8sbB6m+hS2CwCs8YJNDHsEbF
   6WJCTBZU+xtePCWlGSf0hP7IkyMbLW6pKE0meRcdWJi01iXOYJgrjOSQk
   sR1o1m6vgrgRXg3pcJXudSlDXolODECjItQZZ3qew7N7cKwB7tvi9gLk7
   1B6cHISNWh46t0ocA+TuLlpYeuTBIKQ3a79s9vTQ9JHmcQ0Zp6/2GLNre
   vapzLp99eAbB5DDJX2eLxiAoO9iIThWQvaDlLedY/jywr8+bf/s/zEOa2
   Q==;
X-CSE-ConnectionGUID: 3L/+7hEqQA6UtpqcNyFNbg==
X-CSE-MsgGUID: doPbAzIDSbaF0qGDn5GcpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1969176"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1969176"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 19:11:16 -0700
X-CSE-ConnectionGUID: uoSMwVtwR1uAvWf/TlkYBw==
X-CSE-MsgGUID: 8d15H2cuS0+sYMrCyqFy1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="7129991"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 19:11:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 19:11:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 19:11:15 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 19:11:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qy/uiCGqAz/JxV9/tp6xuQzm3OANW8kPJJcrdoAKAebzgJNZ24JiD+nqH5iXxlk5t3n5k2m1BcqFRQazFOUwgCLWbqfQXLMwfH+w1drH8ao5RUAI18bAB0BYJKvZMDREgC01xcCeDVQ+nERTJlCIYIE096jG7RL8Sr/ylTVU9AjUB5nmKdPbYLQJpJm+m0VbMqEf2fNetsQM7rBdiLia14tpoioOiVxBfaHhRLf2w7HJo8BGns+eB1g1+oAPsFDNin0C6Ii///gDeDsZddjWbm0EAiKVDdj3OTaPC5kPhX9svIHz273HU0Jk/sD2ZG5tBLZzwkE6VtqfV68AcfH7mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3mF9b/k6lttnS3XTD6N02IARn3F4bm6XXaxTuY+7ac=;
 b=LkBSs7oeWhb/ILTzeaBT5b49hpR26HUXivhgsrF9QVpsaAvaHDtneRD7spR/FDqvnLpVVTTC34Qy4iFOqAWbYUQnujPKzh5Z28tklBsCCFUvhjFTUA8Gw9Y16dLsTIf28CAZd5pQxMLPId8AxD57zBxp42VZFtdZwbIiRuIxvJbFh9TN91UczIiGjLcTF2zkPEoagTpXF1pQdJQ+gLilZU8LXbt8KpRycRDvqwHCLQuFOh3COfyWjnb6l67QV0Soefz8I6YOxtpolQOFDYgu5jU5iC0gUmd9/92xgPZ8hnzW3d6LjELmfJMD7Kl5Pk9znfZrsdxSCqHSwEJ0yBLD2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SN7PR11MB7489.namprd11.prod.outlook.com (2603:10b6:806:342::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 02:11:12 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0569.007; Fri, 30 Oct 2026
 02:11:12 +0000
Date: Fri, 30 Oct 2026 10:11:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett (Google)" <liam@infradead.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [liam:dense_ulong 2/80]
 ../shared/linux/../../../../include/linux/maple_tree.h:346:1: error: static
 assertion failed
Message-ID: <auP8t+yu4Q5bPk9b@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To DS6PR11MB362586.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SN7PR11MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ebc341-19a1-4229-dc07-08df362b11db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|56012099006|11063799006|261022075727099003|10067099003|261028144727099003|261022105027099003|261009223027099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: TC1m5pV8E0dWld3ozPWEQWskFBWIXz6CGXSO5bmUp2/GzFMnAzumx+xGlBzHmmFCQ2Mw7qxAGtMIMYLh4ZlOp6retDUge13x1TSwyk4VXi1/Wr3VxaO9Td0m6b/e5q2hZ+fqy51mb6M2E1QhEAimv4EfFKpJMB+N4I21bq7MmXF5ptP0sl6/geqR3dTUXM+YamXuUZPtOucz5EaIhLIFtU8ZzZZlE8halfIZ+erY+uEXDLUSxJbKrmwS4NrBUK4VvEg5F15L1GNnjq0IxvCdmgD2df6RdufTr6CVp95KxwyAyJRcK86Nkp/mRQ1b1rZePTNmfrFQu9FAxKx9rhkxDXOqTQP6UIa2ibIyKbCV6URsgWXRkyZp4j60POMqys0qfDy3+yzLOVUPCILii/DlSiq5l7vdl2SQeXwHOtST1Sd7Qr5fpRqy9lY39e7JRDBIIUb+pKqrzXg6ZCjw6uNVy7iDSQMUcP35MNkYhqx55a2pqZsH1MMICqtBAT+xnxGeMvsAExY5haEM2DW4gAuS71FWygIkG3at3oDZiXM2oEPKh0sTDMO4TFwKuPs5uXFvkj6ps/UFS+ryGufLyUhz9aNsHm6Ri1AJgcirWH+LXR2G0p+dEjA7h9qaItjU5cD8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(56012099006)(11063799006)(261022075727099003)(10067099003)(261028144727099003)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c58eIVBpwNrSlW5kBOzWuKhaywc2+Ed7mXe+2xJsVwtgRj3xs73MJ0c8A/u6?=
 =?us-ascii?Q?X7MXHFHdr8x0oCWki2y+WdH7W4rPQSJYkT5xeYgk+Z0EnYPVDmjwYT5UKSZ8?=
 =?us-ascii?Q?qKLdBCQYz1QiI+mEpPbcv73jUIeYnHOWo8gMD4Zm877Dg+hPBKYZNGap081e?=
 =?us-ascii?Q?Lj9mg8bcVAsZEK7++Cj0FXVOR5jBJyojUmVU1G7Xtp0Lv+a71kjM9LZohbCJ?=
 =?us-ascii?Q?argNMjyxNIgnI6YAut2B+lYWyU0Sl27amNRLL31xct06G8PT344Pl5P9u5Rc?=
 =?us-ascii?Q?MYPRcP1q0U2W2EzuuTmowNFMFfFoylpG7xvPzcgCfE1bgZppgg01EY40nMPV?=
 =?us-ascii?Q?fRr5xbP7S6sXohGWWcviNqpq4py6R1nEg/et9n1Y/AlhYdIScCKv16RryBSa?=
 =?us-ascii?Q?QCEeDrCcL4y8CHVYM8AxoJq84o1+lSOCiyl/n2qfvUb7jqSZ8pKEaleGMaAW?=
 =?us-ascii?Q?b9R82/jGaEnWKO869dVo2oX9ogaz61p0F+Js2IV0kuGtuIGgwl93Npk2XDJr?=
 =?us-ascii?Q?QqK++MW2lvKhm16clTSlyeYsaV6PRNHtVPq/U8Jyh0fRXCK7DGyi5VidjfRp?=
 =?us-ascii?Q?CN2K2aH8RfXx3u/iUWw5izaidX/pq5yq4knz5Dn01qTviC0jMU6tdbUy6NgK?=
 =?us-ascii?Q?v3Oc+uKp7wEx2KfWpUWZ5Mr2SwnZlB+NzgV0I8Qg8Ez2QHQmiFIoSVszzbxR?=
 =?us-ascii?Q?X6Ir9ZbxR/GM8GUZM5Q9Aw49V+tjcPZOzd8/vfYdYXwwlgb29MI80bGtfHbs?=
 =?us-ascii?Q?KfIffRCivH3FJowbVVhR8F2SXIGVnNMCcQsqrz/KnjYzz8GKuo/X54vxBDZX?=
 =?us-ascii?Q?L/LAIw1eReAlqImRopXCRUwzt3k9M0WFLL6xApDAo169bYTt1JUu+a+ROHxM?=
 =?us-ascii?Q?UGRX8JNLiTIIn1mud1NpTvXPfwUaoNdOVQGGVjqWwsuhCAmFdu/xfTuddz85?=
 =?us-ascii?Q?DgdoEAk5Gb+zTzzV2mh21ZdbJYP8X6wx9Km9F5CSbAb46VGzwCfiDN6qSYFa?=
 =?us-ascii?Q?87CxZTAWmfRhwLQMS2SCHdMC/6VuwBQN5skkX4N928h1qH0HbDzpduGolQoQ?=
 =?us-ascii?Q?H6TMvyaO2R5SDWNZChKVVJx8rTVpKW7lXn00BY6wrzECEoIEvJqFwDr+Kt/h?=
 =?us-ascii?Q?Ilkijofue6ZYTkGSGtrP6DPxTkqRdjo17v/JhFuPJYj2CU0HzljQFiCyJD1e?=
 =?us-ascii?Q?qXnzr/zQyLQ7R8z3eti/EakyxCRQB/G68uvHL0Yoa1A67PDPYi3E0ZoKHJWf?=
 =?us-ascii?Q?qwJwTPKvne7ZbhPeVigblC5LmvkS+eqhdH4dKU2v8+KQi1KWIm1rlfNlUX97?=
 =?us-ascii?Q?N2B8oAglIjNGDY0ZtS51mdOuAvj3sknYSpD5bB9MZlU7YFMAw5riqFDLQt3D?=
 =?us-ascii?Q?CKmOaamVUj7bmG1sGKqz5/ak1rpTiRfvw129JWUwxQkmlW8fFRDe92NFbMD2?=
 =?us-ascii?Q?8+qBhJYe7EzCy3cg5Gnir5JQKuOhiDimMWtR+E0hNOODABTd3KfPUvEFUR6/?=
 =?us-ascii?Q?ABhnMtVUczt/AS6x3THXJ0YWtxYWzizdBJBnzgSmlEadZaiJH6AUci5u2+Tb?=
 =?us-ascii?Q?ltz16ujY5pzZk+HVQJGvRMwaqctC8kS2Ug1HhpfAgTtqlaqJh+8uhLP/8c95?=
 =?us-ascii?Q?t5M4XWIwVnGkQyNOIHhX943xiW+fKx3XQHpWGvZOG7wyL9m39zRESFkotr55?=
 =?us-ascii?Q?zI3uNgC6oCq5kxF6FR0rYr9cUIqADrOidOR+5/keYceRPo8Uq/5hr57xKaUr?=
 =?us-ascii?Q?sgdkO985EA=3D=3D?=
X-Exchange-RoutingPolicyChecked: KeY0XG4SniUq9SD3NglAUoBETJxqZhY5gaQWzPjEb8XkTep+VU0zh02BJjriSyi5un9/7Pu60wexfMoFL0Z+N/HURqV/FCDYOdJwxJEBdinmNEaNcx+vtOgCvmsIa52nKb8DIOJRDRIYTh38QKPEEtMxbysQNtiW2EgGVRcnxMV9Z9OqBUVQEQkauq/FW9tmVIvuqwoklA4UlCnTftELOXNVuLANc0uWfdGnipidNuog/95L0+3RIcED789rZSeQWz979TAaU8oI6LRRzb/pXOusgnGmQSzRiEhP0Ksv3jauXq2Qqh4FuRAtmmESI6hfuX7eD0ZY16QWezJ4KOh1OA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ebc341-19a1-4229-dc07-08df362b11db
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 02:11:12.4947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSaSz4xGSpVDJLA4bTiQAapTtQwEcx7qYdaGVPU4FICFX4Os61nuUQNDeFl1I3RWEDvQFU8XYscY/6FHlwshuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7489
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git dense_ulong
head:   05d6e5c4cab7c4912959bf9ea5f797e6bc55eca5
commit: 02b16ccaeab9ace765973a2fb9f473e84982b58b [2/80] maple_tree: assert the node size
:::::: branch date: 9 hours ago
:::::: commit date: 10 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261029/202610291258.hR9ndwFc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291258.hR9ndwFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610291258.hR9ndwFc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from /usr/include/x86_64-linux-gnu/urcu/assert.h:26,
                    from /usr/include/x86_64-linux-gnu/urcu/debug.h:12,
                    from /usr/include/x86_64-linux-gnu/urcu/static/urcu-memb.h:24,
                    from /usr/include/x86_64-linux-gnu/urcu/urcu-memb.h:47,
                    from /usr/include/x86_64-linux-gnu/urcu/urcu.h:25,
                    from /usr/include/x86_64-linux-gnu/urcu.h:6,
                    from ../shared/linux/rcupdate.h:5,
                    from ../shared/shared.h:11,
                    from ../shared/maple-shared.h:8,
                    from ../shared/maple-shim.c:5:
>> ../shared/linux/../../../../include/linux/maple_tree.h:346:1: error: static assertion failed
     346 | static_assert(sizeof(struct maple_node) == 256);
         | ^~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

