Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A581C6FE5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 04:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747628024; cv=fail; b=IfO25x0QN9YWRmmo2sYcoPjIavXRXgEotH1by9T7NU3o/gowOXs/gjm4I674CYj8yC8aYSyLtVo3Mfihpvocja+ilNOrVkl9iZXmy8NGAfvTMMtHDjNeZc+z8cCfzSeCFa8i8iDZum/eDWrYDPylygQsaNSkCKiOhOiPnpuvt9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747628024; c=relaxed/simple;
	bh=rtncwYz0VJ3KtI3stSpl+1zWhPCQD16O/vTmxnMS3to=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TEJcokwpsDf9yhUjyKm+67pFSL3xzT6y9ysOsHECGRfITXNiHgOc0EJCkWJBP6+I4Jsg8jFMaN+upN7UTHis9tkGCCDZCCnFmpGsQJZLWWbRGOOM0C/cg6jTnGyZ4nfgM6ZkYvwSMPVsnwGRqgL+7X6lHiQI/xtE6glnq6ZxDVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nL9cddDp; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nL9cddDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747628022; x=1779164022;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rtncwYz0VJ3KtI3stSpl+1zWhPCQD16O/vTmxnMS3to=;
  b=nL9cddDprVZVLoH+aT6y1fyFSgddGBNSAH51Qe77DD7frDh/3oqCW4qU
   Uk/wUBEfbK1pw0EF0Xg/QXnouIrh6zg1uXwqyWbk8cZAK2u+vh33XLj7M
   gHjJiW9/LqibEmr/Ieb1L2eFChl0SN0eR8T6RSGvZTyPwE6KVB+FuoH6Q
   vALAR3C8XhyucnyE9cuKX4OxG71Y+h7SYnLvtKvDTHzJN5K2wK1uqcILu
   BaR5CLKXXkfEZrMzHIyZtvLVDeaM4Hi4EICRF4+M6+SWwerhUaqWp83Cc
   ErHY/j3vWDT5QbbGEr92Bs128W7pIaUvzijyMOTQOdpQhICa+XVE9cjuV
   Q==;
X-CSE-ConnectionGUID: cB7/zC86Tz2DbyKeba6Jlg==
X-CSE-MsgGUID: 3xtZQH+CR1GRhSRjN84cPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="66927671"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="66927671"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 21:13:39 -0700
X-CSE-ConnectionGUID: FhfvMLGMRSCz0HrFGgUjIQ==
X-CSE-MsgGUID: B9IBGtoIRBS4Zqn6bDhnJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139155935"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 21:13:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 18 May 2025 21:13:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 18 May 2025 21:13:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 18 May 2025 21:13:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEdsOscZujgF/SJJtl5dCbEIBEYRVLl1SP2glYhILAECFq52NIondEEocFgwKXtQfroyfYZL7s271v4Nc4b3XciCPaQSpNlF/9UtCN/yaw8qYdbl1BDDCrdW5BgGotA8lyvbQYJljTmef4GYkd1q7Qs/l/yy8lQfIH4MmG2yHz3Oy+U4FhHIm3Wg4QIINOtSwSDBltrW4D8pnIGgT+f5wrCuda7I77XmY6Ib8o094mD0NZIKmj8RP8jEQTUmnhZ78JRN7KwidXLY1ZEYe1oOjmf409TF98DFCkSYYMZvmXyBmaKWSnL4DHj91vycSvJZgCCUDuDiLNSWj26axhtQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPO54s+B4oX1pIsvWdUfU+Y7d/vTf4e7KtymR1qYaOU=;
 b=hYE+SAg0cE71x1obZa6h8ONfmEZ+/CNy3GAKbOpJIZZf0fznYcYXzVsae/UOb2eOZEDPGzsVmNpaX6ld9vWgVUrN8v+jp97jiSFPhXAh/GT5uNBOi/tP9j1kOsgc0c4uPyHatGpmY9t0FOcNw+9mZbFnjV2Qt5aKUXAqgodrbcI8XDE4ieYm1zw9lPJAUA+jusjChaMgBEJ5iEUAF0J2ATp4QOCORtxaqAGTHmmSUQi9UCpSEHACBhMwrgWFuSpzptiPYJ5I4h0dVBzsIpIsvC7w4BWzAxfeaCp8++8qnb5l2AnknjzjiMpdZpNrsrrZP39ExfoyxrX3Oy+yD/PkYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 04:12:55 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 04:12:55 +0000
Date: Mon, 19 May 2025 12:12:45 +0800
From: Philip Li <philip.li@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: Alex Shi <seakeel@gmail.com>, Yanteng Si <si.yanteng@linux.dev>, "kernel
 test robot" <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, Alex Shi <alexs@kernel.org>, Dongliang Mu
	<dzm91@hust.edu.cn>
Subject: Re: [lwn:docs-next 37/72] htmldocs: Warning:
 Documentation/translations/zh_CN/how-to.rst references a file that doesn't
 exist: Documentation/xxx/xxx.rst
Message-ID: <aCqvvYSmq+Q594MY@rli9-mobl>
References: <202505160627.WtzIIpL6-lkp@intel.com>
 <dcb8c986-b6ec-4803-aa88-2ef2670a6b10@linux.dev>
 <CAJy-AmmsqK3x97yncNrnugCNrf5qNOTUwixFNiBifqigLrp2zQ@mail.gmail.com>
 <aCqhRwOxvUiCFtpN@rli9-mobl>
 <83ed3edd-97fe-4106-93d5-4058a61bc4a3@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83ed3edd-97fe-4106-93d5-4058a61bc4a3@infradead.org>
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 45187efe-3c77-46c2-8746-08dd968b6de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUFrdkFsV3pwUWdDSnE1amVuQVIzODNDUUIzeXQ2N3p1TGFMWnRLSXBjcDBy?=
 =?utf-8?B?Z1JyWDQzaVBVcnBJcWRaZktjWkt3VjdQd0hYU0FmQjMrcHZKWjFUSExiWGpV?=
 =?utf-8?B?cmlVN1VZb3dUL3gwK2JUUXNOczd6dENtWTVpTGFqcGFpMlZPVjVFNjcxYzEr?=
 =?utf-8?B?VWFvZ3Z5ZzRPNjRZNERueTZXd1dYNDM1T1U5SzV2K2ZON2RlQ21yb0tIRURk?=
 =?utf-8?B?U2lmeEs3dWp0VlB3SzhDcW1Td0ZoR2VBRFd4OW9qUWYxbGV3YnVDdGl4MGor?=
 =?utf-8?B?bWc0UVowa1BORUw0Rm1KREdrZzVuSmtnaTN0d3VrNHVRb1N0NEhXLzRwOEsv?=
 =?utf-8?B?bEZGM0x4OHJNV1hwMDl4V29LVTRIcVJsNUpkamR1LzlqbmlYamF3N2FXU0tF?=
 =?utf-8?B?SmFwWUYxQ2ZsM0xLYXhNMU16QW5yZTlsdnlVWDIrM0x0amdYY3o3YUwwbjBO?=
 =?utf-8?B?d3BSZ1p0dklLeG52bWdPTnJ6VWcxVHVwdW1odXhTUHdweFc1Y3RWdkM2NGUv?=
 =?utf-8?B?VUsrWlI3eGF2c25Wd1RJQjdyZFc0Vkc4Nk1QYm9kNEI1QXlyYTFTSW9OQkRK?=
 =?utf-8?B?Q3VMdlJLNGtRWkRockhtenRnckVFTkpyQlBHUDNodUEvYXh1U2I5d0hRa2JG?=
 =?utf-8?B?OFJhUXdHWVArOE5yZVd4aVM2MUtRbTVBYVdnbGc2R1V6ZjVBS0hNZFhhZ0Y1?=
 =?utf-8?B?OUh4NWpBaUFJcEk5T1JDeU1TODFLTCtBZEtkTWwwQ01sTVlNZmFpU0lvR3dr?=
 =?utf-8?B?UnFmTnNHbElpZ0d5aEk4cFRDdDRNQWhzdXl5WmVUR1A4MVJTUU9YQnRmclJy?=
 =?utf-8?B?bitQcTNXeU5CRGhMNGxzdUFtVFoxc0xtOTdQZGdWeUc3dU9IRjltZDRua3FI?=
 =?utf-8?B?L0hJOVhSN2JIRjlGYmNyL1MwQlo5YkR6VTlZaHJnN3BMc04vMFZXbEFsT1k0?=
 =?utf-8?B?R044b0diWmRsODl3R0ljWkhMT2J3TU1GS1ZCSXdIZXZFK1NFWkZUMzZtZysz?=
 =?utf-8?B?MkhtZWczM05CTE1tL0VkNFp0SDJrV3UxUHlLM3VIL2Q1THV6aUs1alNRNkhn?=
 =?utf-8?B?VkhLdHNMMjJmNjBodkREWGo5WFlwYXFFK3l6L1E4QlZNZUVoL2JiNXNvcTlR?=
 =?utf-8?B?Ujl5TGkrWHJXQ2hCa1Y3THdWdEFnZk5nNVJwZytpVkM0R3h1U080MXhCeUVw?=
 =?utf-8?B?UnF5ZEJkdnJvdk5HcE5qd3ZzS3RWUkZUTnNwRzFRakVMU1V3MjdZLzN5QzB1?=
 =?utf-8?B?ZXYwR05IRmZic2VYOHYzZm54NlVRNi9sNkV1NmlzUzgvM3lPSGVsdzFVOU5h?=
 =?utf-8?B?Y0xqNkphZVpXMUJlekJGT0ozYWRtT01qTVBhSUV4QTFCbUc3bWN2WVlOMzFD?=
 =?utf-8?B?UGFWT1J6NG43dUFFaUhKNGVvbTdPSTNhL3lTU29BVUhNYWFobXd4Z0tnUkY0?=
 =?utf-8?B?bWhXeFJvYnQ4VkIwczFzWlVmR2dzbGgzRms1ZWhsWWJXR2VzYkxmdTh0WG5j?=
 =?utf-8?B?bE45Uk93bW0vaDJRVFlxM1ZyeGYyN0FpYzdHaUVzRHdNR1RGbkhMOGVtZ1hB?=
 =?utf-8?B?cXhJQUhBQ2xNWGZHTUN0SmtVanNRTzZDSTBsVjlUdXJGM3hEMWx0SDczWTFy?=
 =?utf-8?B?WHREdXkreWNJWVdhbXlVV1lNZ203SFUxazMxdkxRRlpBS0xPMG1BQnhVcEU3?=
 =?utf-8?B?ZHB5ZCtzU3VXMTQxMk5zR3Y2ZVk4UEpKbDNFRmRXQ2p3ZTcwUjlhTXJ4UXNE?=
 =?utf-8?B?bG9Wa210MjBVbFg1bWtiWUZOTmxNczBXa1NLZGJDckN5Tkc3elF6ZVBzdGM3?=
 =?utf-8?B?bTRWTTN0OHZTLzNoSWkrb3ZjMUdUTkx6NWRzTWMweHF4STFweWRFU0VOeGo0?=
 =?utf-8?Q?E2O9/IjL4QGHH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1VrUkZ5ZGFlaWRVQkpwbUtTbi9GVUVVQjEwUnhISStWWmE5bitON0UwaW9l?=
 =?utf-8?B?bGQwV01wSFNzV1ZNTUhad1RVOGhMQ21XZGpqNWNhY1ZqR2pFWWJQRXRxWDBQ?=
 =?utf-8?B?aEN5VDRXT3ZmV2x5L0FuYTFUOUlKUnVoRlcwN3hOYUxkejVPZ2w2b3YvUTFz?=
 =?utf-8?B?bTdQTk1ZNnU4cmI3bDI2V0NNYUhPeWNyVDhZcndiS01hQlRuZEdmakRtei81?=
 =?utf-8?B?bXdQYk5LSXZPQWEyZFVrOERraFpCR3JVODZzZ2xwMTVFMFJWQ3JCbVdaZFQx?=
 =?utf-8?B?cGIvSGNNZFNIT2Uzbm96UHlPQk9UU2IzaXhaY0cvNnZrNnlDdW9SSTJiQjE4?=
 =?utf-8?B?dmF1aXJMNjBvTlJpSi91RTRSRmRNd0F5MEdQNy9rTnR1ejBPZEhTaWlhZmtx?=
 =?utf-8?B?QlBzSzVneDh6V2xucXNGS2J6dW51U0lETVA5TmlvcmtqeTVXZkkzcDNtSm1y?=
 =?utf-8?B?WGM2THVaK1AvWE1keTRNa3N2SFBwOXIvbUE1djdUOVRPSFdQRkwzZ0RhWFpk?=
 =?utf-8?B?cFp0RDhocVJEQitkZUhmN3FoalZVUldBVHZ2dlBCVjFVM3U1ZTBLakdzZ2lZ?=
 =?utf-8?B?bkd0emxhUUJJaFEydExNUU11dmp4N0FWVUtlK2orbzJCTmdNWXpMVi83SU9V?=
 =?utf-8?B?V2NjZHVsbEVkd20wWi8zU1VlUC9ObTM0ZGwyU0RmSHB4SG1VdGVUQ0daQkVP?=
 =?utf-8?B?MVl2SllNTUNSNDlkUFhVVDRnM1N4MVozYkZxL0grT2JkVUY4b0E0OW5zbDQw?=
 =?utf-8?B?OVUxTnNISUJhVGZXTXI2eUlqNEFRUGMzV0NRR2JBTlNzcDE3MDRyVGo0MFJI?=
 =?utf-8?B?ZHp4cy85Z1h0MlBHQXhoZ1luYTYrL0hvQ3lCL21QQXZCc21sWFU0akRaOVpW?=
 =?utf-8?B?d3FmZk5Pa3lqWHN0RTl5OHBDNjFPTXBYOEdFTG9XOFdvclVOLzVjZjhhYjdH?=
 =?utf-8?B?bWcwZm1iYk9MME5TS3J2QnpvNW14WHliSVBqWHBjeldBQ0tXWnlPVzR6aENW?=
 =?utf-8?B?MnZSMkdsOWs3MjZjY0k3WTYvZmlqZWpsV1NnU2xhV0d6cmhHR1JhZlU2cDF2?=
 =?utf-8?B?cU9oODBjNklwWkdlR1BHQVZUd1R5S2Y1RU9zYkVMSmgwVXB2OTZpTlpJZzZv?=
 =?utf-8?B?NGdiRHpoRlpXL0NJblNIc3BzcWNTQTdVd3J5OTdiKzNaNGZHZW40aENXL1Zt?=
 =?utf-8?B?TlpzL0ppL2NGczFsYWRnVGFBNFVFTnFaWjVrYy9saC9PSmV2Q3MrcnZIcXZt?=
 =?utf-8?B?ZGx2bWxKL1kyUXJ6MDRkSXYxSXlKamRQQ1VjWG9DMXlGV3JNN0xKcmhqOTY5?=
 =?utf-8?B?UzVpc3JXS2txMU9YNnpMOEVnNy80OHltL1U0VVI1dVEyUEtWT1ljV0Jab3hO?=
 =?utf-8?B?U2NsNWhoVE0xREV3RXlTTHJZUDc2UEJiNHdIMndsa0RmR1VvTEg4eEJaZTR3?=
 =?utf-8?B?cG9ycm5DaVFBbDB5Ykh1OWJHRmVweEpKZDU1czQ0bjJNTkhXSnptcytEckNp?=
 =?utf-8?B?c1BtV0VZQXBTUmIvR29wSDF3MVR1SXdNYTlRVGxqNXQ0YjZHbFMrM0ZVd01F?=
 =?utf-8?B?bGsxbGtrTjZ6WnU4b2NwOVRwR0I0WUpRUnc4QlA3TUtCT3lqZU1aQU14TkJh?=
 =?utf-8?B?L1ZvcUpJTXRHWldJWVJuOTRGa056U0dkNUw0aUlMcFNJbncvVzFCWEs2cVMy?=
 =?utf-8?B?d3kxdzhIOFJiUUIxejRwNGhab1N4ZGtyb3RUbVN2OXFVMmJ4TzBWQlZpdHYz?=
 =?utf-8?B?Ym1QUmVveGdiT3BXSUVtanJYTXRwMElYczNySTBBM3QrZXlXWHA1c3NHRFdE?=
 =?utf-8?B?Y3BIUDM5b2tCdHVjYVFmQXZGbWF0MURjTmZNeGY0akpVY3hVdW1wTjk5SDc0?=
 =?utf-8?B?RjZBejVSTnZ0bGhrQU5qeGhFcUMzZWFmK3JLVkxMbFFZbzk4cWxBZXB3TkVM?=
 =?utf-8?B?bkNBOXdDL2VoNmVWbDdjOXJONW4zNUdRVEFWK3NTYTZHRmRnM1kxbHh3K1lx?=
 =?utf-8?B?WEtJdzQvQ3U1eVBnUkcxM05oUEUyN1VkcUY5bFpEZXE0dTF4UURKZ0M3NG1S?=
 =?utf-8?B?OGV4ZTNxS2NWNnhBTUNnQUxXVWNJb01vU2xsUnZuMHd5VUo2aGNvN3hoWHJz?=
 =?utf-8?Q?lboNl7USHoWnMSBmdz7s64Wkh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45187efe-3c77-46c2-8746-08dd968b6de2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 04:12:55.0201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLmhHMxml9fa+Guv1LiheI4O1qtTzbBbQD0O1UWULMIi8NmMgX5vUfE2Gxeay52zVKCdhR1zQCid+gQP/pfw4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
X-OriginatorOrg: intel.com

On Sun, May 18, 2025 at 08:34:54PM -0700, Randy Dunlap wrote:
> 
> 
> On 5/18/25 8:11 PM, Philip Li wrote:
> > On Mon, May 19, 2025 at 10:24:20AM +0800, Alex Shi wrote:
> >> Yanteng Si <si.yanteng@linux.dev> 于2025年5月16日周五 18:02写道：
> >>>
> >>> Hi robot,
> >>>
> >>> 在 5/16/25 7:04 AM, kernel test robot 写道:
> >>>> Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
> >>>
> >>> I didn't reproduce this warning locally. It seems to be a difference
> >>>
> >>> between different versions of Sphinx.
> >>>
> >>> Could you please provide your Sphinx version?
> >>
> >>
> >> I can't reproduce it too. My sphinx tools version is 7.2.6.
> >> And it looks like a incorrect warnning.
> > 
> > Sorry for late response, the Sphinx version the bot use is 2.4.4, and it also enables
> 
> JFYI, Documentation/Changes says that the minimal Sphinx version is 3.4.3.

Got it, thanks for the info, i will fix the bot to avoid the false report.

> 
> 
> > kconfigs like CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS,
> > refer to [1] for detail. Hope this is useful.
> > 
> > [1] https://download.01.org/0day-ci/archive/20250516/202505160627.WtzIIpL6-lkp@intel.com/reproduce
> > 
> >>
> >> Alex
> >>
> > 
> 
> -- 
> ~Randy
> 
