Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F062D0623
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 11:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756119744; cv=fail; b=uw8HrtKN5IID8L6aUYFZn48mVmkxWpxYk1yIJaJArFxA4jL/uo+X6u5gky1qYbuslFQ+CGZC8iiGggmA93uPpN7w5isHz7TkevFq79+D7GQR9oE/MpUuX/jtYjEkmSH4PkMO1KZnOdx5dumEhcNCAPTE4rQ6C3YdSTiulrI1SIg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756119744; c=relaxed/simple;
	bh=wJVgVbP8KxoUDkggCmFSWPWpSmcyUEQS+3Vv7Pj46Dk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qfiFfqOT1eF5XbMlB0+fho6WSNJQhaczb/6F2jjl9YQxilque8ioAtifHhSpMeUETtQ6LdPagJvn5i9XN7w99t9oiYOtDngp9zRWwTR3SYuCq+Rmznq7gXoCvMB6NmHt77J2sPOOMEeGfgHXS4mtRoc7mzRRncLwcMkt/MT2+AU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QPaNUNrH; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPaNUNrH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756119743; x=1787655743;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wJVgVbP8KxoUDkggCmFSWPWpSmcyUEQS+3Vv7Pj46Dk=;
  b=QPaNUNrH2klcyL6o/0DED15+yOsPug4QNbpmA4Y5UHfUkkzVaU+5RBBU
   FiZOnh0hhFEQ1d+7mvCnbhz0ZZaiDBGVanI9D6Lr+cBMKQbloOgr5tQcV
   Im4eP6tpG2WVDDRuPCC+RV9zpK7T29DxR4817V1Je/JcRHkLHGmCz2S8o
   m0W7NckkKLn22gblDw7GgiFDrXl8s2V1D/aMsmZcvchEBRv+RQfXd9T17
   ShDHqvms7VRMDSZ3ifNkeYdXt3NGs8EMzyZ7dE/6ZbK251+L1r8TLvR0U
   JiODww3iBbVk0T2oYkeo8756dwJj16ZXdO+j+E4EYk+yVLlExF3kfbZQI
   g==;
X-CSE-ConnectionGUID: c4asDtCBQAeLREulR8YH7Q==
X-CSE-MsgGUID: us3VpnjjTomECLCwZFVHoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69431532"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69431532"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 04:02:21 -0700
X-CSE-ConnectionGUID: iveY2m83SnSSg6ORMmzV5w==
X-CSE-MsgGUID: dAA6c/hgQZ6sYoigS/HZGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169658783"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 04:02:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 04:02:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 04:02:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.44)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 04:02:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXr4Afn1TvyCLWqIVmLWMF/k99Ptx3ETO4/qHesiRt+6CkUPa/3LPhIlLTcl0QEjJVIY0DprdgpwnrQPFuhocdP9KpIU1m2sMyL7VVo3c+yMgxP9YLBSoHm4Jk0sSiIKm6XO8BlpI4JWe4CyJoHlDFPsi15pNn6ZXTYSjuVDvi94EfN5DAruppsjKP8G/Q7vE7yRjQ/rJI8a0XRngiN54RwTYY6Atnrv0rpCPoQpYyDIBTlzeCNASJdC4jWYVUbivcXD/+t0JsijsEd49huTLVACy0jKEG6o9pBEPCgefJubI6NrhiAc8+RG7tO6qRVpHx58nYb98YO6ugQOpf/mhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BG3gwYjkgDQCCgsePZjexRVAonEQV2XqSrfCZjuWjs=;
 b=CyN85JV6N+uQ12IUstj6fkb061q+1MtqWKHfZCbTtv6vlWmrLeU+DWbEvO//VEB4pTs8egWuL5+My0YNvPs1BjHeGxHcOqsLm9hSBFl+XEg2tYKNXa1ME4ENiyZKb7fCc2J9OctiFfi9N3mW4V2G3SuMFzJTdvEUw8tpyjyZUwvL9zgip8qIe0J60kSCuNqEPG8dUrwFz2N0/1yZuum2Vr8h88MvU1DJlRK60A4t1Vqv7PJN0p+VAlQxMZRiTcb5t31Xi+L49grVZ/Z99LrUpS8U9atwnQaimhEy43pe52Dvqqs4aMO353lhDUT96QkBEzQ7p8dwluzbwgaMWm+VNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8102.namprd11.prod.outlook.com (2603:10b6:208:46d::9)
 by DM4PR11MB6095.namprd11.prod.outlook.com (2603:10b6:8:aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Mon, 25 Aug
 2025 11:02:18 +0000
Received: from MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6]) by MN6PR11MB8102.namprd11.prod.outlook.com
 ([fe80::15b2:ee05:2ae7:cfd6%6]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 11:02:18 +0000
Message-ID: <fcfba1d4-8d69-4d74-8597-4c8d52178eb9@intel.com>
Date: Mon, 25 Aug 2025 13:02:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [tnguy-next-queue:dev-queue 83/96]
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3360: undefined reference to
 `libie_get_fwlog_data'
To: <oe-kbuild-all@lists.linux.dev>
CC: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>, Tony Nguyen
	<anthony.l.nguyen@intel.com>
References: <202508251750.6y0aVhmt-lkp@intel.com>
From: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Content-Language: en-US
In-Reply-To: <202508251750.6y0aVhmt-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU6P191CA0032.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::19) To MN6PR11MB8102.namprd11.prod.outlook.com
 (2603:10b6:208:46d::9)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8102:EE_|DM4PR11MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: cc926617-dbfe-42b4-9513-08dde3c6db9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTFLRDBTVXo5Ullkc0xsSjlWdzc3TldzZkp0cUJFUEMwU0loY2ZJRW9IMGRG?=
 =?utf-8?B?aU4rTWJCVG1rNUUzODZsaG84Z2VHZVkwMXZoVkhxM3B6b0xQaUVSVW1rSFRu?=
 =?utf-8?B?WGVkTlRhYWxVS0VCVWVlb0ZVMEhnNjVWTFBVbkhNQWtwNm9QTC9YOUV4T0Q5?=
 =?utf-8?B?cG9hOFVMazhsUFIySjg5KytOZFJZdGNPT2pEbVNEbXloV1h3MkxEVDR2ZHRa?=
 =?utf-8?B?SUZTYVN1S2E5R3U0dERIcEpPK1VMb2c3T1lMWEFYMmZxbVQ1UnFqa0lKNUhp?=
 =?utf-8?B?RUM0VTJRZU1NcEpkVzJyd1l3bmxOTlg1d1NOeUlhb1hGV3F0eE4ydHpXNE8y?=
 =?utf-8?B?TTlLemp6emJBenUvdkEwdWZoTVlud21OV241SlgwaTEyTGRZa0YxcEYyT0Vr?=
 =?utf-8?B?MmlXOTdNTFEybmc5d0pvVmw4NG4yQnJuaWFZeXdUYUlpc2o5cGVLR0VHN281?=
 =?utf-8?B?aFN1UjRGajlvLzh1L0dTODJwOEVVWmZsZDdhRHd3VkNOUUw0ODMzYUtnUTJ0?=
 =?utf-8?B?V1MrQkZwMzFuR29jU0tINEF4TGRTVVNXbkMyRXl1bm9YN2VzMjJJRDBEN2pG?=
 =?utf-8?B?R1BDUklOdHdXdUFzSWtlN290SGRCU1lab3dHY3dXTFZxK0hPN3l5bHlJbEt0?=
 =?utf-8?B?cjRHV0Z0MG53SW5uOWkyT1FtZitHaTdPY21HUnFkcUtCMFdsMVU2eFBhREox?=
 =?utf-8?B?UWc5ZWw2SjByQ1VxMXc1VmtBdDNDYVh0SWMxd2U3WkxBbnNIdzZtbUordCtK?=
 =?utf-8?B?dnZEeWE1QnZzT05MeHAyUW83a1k5RWkrK0JxSkUwZUFaM3ZoOHhtN1B1KzJD?=
 =?utf-8?B?cE13V1lFSFlNaXQ0ZmRWOEF5R0hUUTA5UGU3UUtndTE4T2FGOFl2Yi9IUUFK?=
 =?utf-8?B?OC8yNnRHdExHY2IveVlVVGgxZ01pRGtleFZrbUxZd250SnNEd1dVTjJaaVhD?=
 =?utf-8?B?VlIrejZvb0RITjhzOUE0SVB2UDdRYWEvOWVJMVZUb1dpc2pHemJ1TGJmWkVv?=
 =?utf-8?B?RFR6UjR5MnR2SVJsV2JNTWlOamozejRoeG9lbE5VZGFkMXdmU1VDZmR1VWFs?=
 =?utf-8?B?a3NKQ3dNaUI0eFJ4dEFDa1ZqZ1QvNEJXNU0yekpBTHhWMEtKcmVUZDRjRGRS?=
 =?utf-8?B?bDdZSjY2dUVBMjNQL1hzSGpXMjVmOHFnWndsdllqc1pCL2hUTE4rT25tSGFT?=
 =?utf-8?B?TUx5Rmd5eTh0RjZBN1E1Mm1LSjdEenhlSllJSjNwckFXM2t0aDZzcDlwbGhE?=
 =?utf-8?B?QzBzN3VJSWpPK29FdjVqRFB2d080MlF0alhqNnV3Um16S3p2alZJQm53eHUr?=
 =?utf-8?B?V0NhNmtxMW8vaVczaWMycE1hUk52czhBSTBXOFNybTQxNTFoeUJiK3BFNmJ1?=
 =?utf-8?B?eUkvdDBlTlNLOHdLbVc4Y3dMNFJ2eFpxM1Y1eVZ4K0FQTmF5ZVBOQ2tydm4v?=
 =?utf-8?B?VjU4TURqSks0b1dzYTdGbXZ0N3NHV3RUcm40cGllQWJtNFEyd05RR2poUXVp?=
 =?utf-8?B?SjBVcGQvYWFsM1RzNG9hUXhBRmZteDVNbWg0ZlFla0pLZkRhaE1mb2lsa3du?=
 =?utf-8?B?ZVdpb2tVWllweFdaMnp4MTVJMlE4MmFiSy82a3Q3cE9nSThxY214NFM0TTgv?=
 =?utf-8?B?WGV1UHM4UXl4empIU0RuMkhKdWNIbGVhSDExWXBtVlpxM25ld0k3SE1XV3JG?=
 =?utf-8?B?anVHQytremF1U3ByRXZ4b25qbWNWVjhDSWxoYk5NZklRZE1IV3MrbjhYT090?=
 =?utf-8?B?QkFiRkVjekhlZFRmNUI4Wkl2ZGg2cktFSzBwNm1MTjJCdzA0bFZpdjRTSTdH?=
 =?utf-8?B?b05aNXF0RlF1TEtrdlhqVnhoaFVlQ2YzRHpNMVpZL05IOUZRRnZ4eWJpZUJp?=
 =?utf-8?Q?b10LcnIh1ldWW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR11MB8102.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHYvSWVRUUNxTlY1TVl1d3F6M3dDR2lOR01VeGJXQnpXdVB5c2hJOGVIOGNn?=
 =?utf-8?B?aW15M0Q5U1V4dGp2Mkh2VEtnV09OOHY2MExEdVBxT2hNamNjOGJYMkJSMm1T?=
 =?utf-8?B?eFozQmk5SzBGb2NkMkcvR1JWTkhIcnpiNTJXWXhGNmpKTjRXb28rK050N2Nt?=
 =?utf-8?B?SXcwOVcydTUwb09UTEJ3M28vQm9FUU9RZFZ0bWkzSGVoK1hpVGpQT2g2SFoy?=
 =?utf-8?B?OFNya1NBdm9FZkovZ1lwM2k0TjIzUVplUWlMcnIzZk1qZzRhWDNLU0kvSFRs?=
 =?utf-8?B?YjB4eVUvTXlMNmtVSStmdmtRbXExQmhZMUtRTkUxMzFTUThKTkhYMUpkMWUz?=
 =?utf-8?B?RlFRZmxvNWIwbzVWM2RIbkZ3YVhmTVVQUVpCM0lmTU5BQWVTQnAramhkeGpE?=
 =?utf-8?B?VW5VOE1mK0IveTRkNzJlRExKRkY2TlQ1VlpWKzB0QXZyTWFPRy9idFR5Y1VW?=
 =?utf-8?B?cG5yaXZCN1BlSVU1OTRDeVFYc2h4M1ZHODk3ZEF6Z3FFS1pXcmxpamZ0L3Jh?=
 =?utf-8?B?LzVUeUozeVg2YzUvdlYvRmZDTS9tME9MajVnbmw4cXlRRnhtUW40UFhOazlo?=
 =?utf-8?B?N3pyVHpPT0lHdmRlNkMzZ242UG51TytuNE1PcEtYUHRqVDhQQS9nVEROZzFa?=
 =?utf-8?B?b2JpQ05ieGpQNU43eXQxWnJuNlJMVUZWbjZJWVJaWlkvY1gxZ1pNbVd0enM2?=
 =?utf-8?B?eXl6dkp2N21lMCtOMUdnMmxsZXJzSE5hOEdaRy9WOGlhRFh2RnRZakNzTXh4?=
 =?utf-8?B?am5vbkFyYlJrTDB2NDJDMmpndzhSMWN6NnlDdWtxd2RsQW9jT0RiTjR1OExR?=
 =?utf-8?B?dmxidmlzV2xGa09ReXd3Q3pQUnNmR2VNcDZ3RjZINDBEWmF3ZS82OE9NcFcy?=
 =?utf-8?B?RFhkL0Q5eVFQV0YwdDhtNmVpVEthRlpQVDZwbXlmcG9nOVNvRWJMaVUvZ0xj?=
 =?utf-8?B?NzFFNGZtdXZqZGpMNDF1UlJtUkcvNFNXZGwvMkROVDBtbnJUbDAyS2lrWlh6?=
 =?utf-8?B?VW5HUmoreUhQd3A0S2dIZXlrNzRJU09nbjV4VGdRa2twYmdKK1ordDVoU1Bh?=
 =?utf-8?B?dlVFWVpyREEzSGdodnh2cFBUcEJoTkttTGhyVXdQSmp6Y1FnaWE0SkFkSkRv?=
 =?utf-8?B?b1doMmtEa0dTcFQ0cThVeis3ZWNIbllXMEpHUDR4Tk1yTTJFOVJCNFFHVnRv?=
 =?utf-8?B?OXBUdW5WQmt3MVg1bElEZGY2OU5VdEVlRUU5VXNFOE1HdDhnbHpPSlRxK3Zv?=
 =?utf-8?B?cW5DUHJCOG1ZK1hjdjg0dkhDYVJDelR1aXJ6Y0YyV2E2NVBGelZrNHdxWWkw?=
 =?utf-8?B?VnVDQm4vS1NjUHFCYUN1eUxnSDljcUY2ZjlLRVI5RXY0cmJPS3Y2VCswSTBD?=
 =?utf-8?B?SFRHZmhPOTRRRTNpZzlMY09WUVNhaGQ0eWtRTi94cHlUQ1l2alFBNG92OFA1?=
 =?utf-8?B?ZG5PR2VZNWZPU3daa1kwaU9MTTJmZFdXZi9NczB6Wjk0R1pTN293U0k2QnVD?=
 =?utf-8?B?clU2RkRNbnNpa2hEUzFBaG42OTlkc3Y4NlhkbStZRTV3NVZBa2VmQ0xBbFNQ?=
 =?utf-8?B?a0d2M0hNVG0wbjR0R0FDTll4emVKZzRXVHBnaDdXZXUxVFN1NkRhS3dDTFEr?=
 =?utf-8?B?U1VkbEE5NVNyS1FNV3VsVGdiR2Erd1JQaWlYQjVkNlJZZjdkWElyQ1U2Ym1v?=
 =?utf-8?B?WEhWYmdiNHRXenFRN01EYlpzVnd0bmErSVYzQm83RjBYbTRNZDlla2ZnZEs4?=
 =?utf-8?B?Y1RaYTY4dzZTZ1prWEJIMlkxZmJWQWRLVmpIQTk5cS9DMWswVjlIS3pWUWxp?=
 =?utf-8?B?TVVQU01kb1Z4cjZOTytUMkpBMjJEcU1vNHZWNDBMSmcxQ2YwWE1UWXd2UkJQ?=
 =?utf-8?B?V0xjTHVVVkY1VG9QeStYa2V0cjkxREJ4bng3cCtMUGR4RHJqWWRpZUU1ZDNQ?=
 =?utf-8?B?aXRVTW9ZbE41M3dYU0x2NGlLd2c5UFo0UkNjWjdwQjdJeE13dGhBQlg3QzBY?=
 =?utf-8?B?YUt6d0FoSzFYV3RTR3k1TnR6MUZrWU10SDVuR1F0WjFBK1lnK3p6SUczR0JV?=
 =?utf-8?B?RThRRGdyMWcrZ0ZSdmxNNmxMdUJPRHplbTdOcm1INWxaTXpPSW9ZZW1vZlFD?=
 =?utf-8?B?Nkpma1RHemhacGVZSHhZWkRYeHZxckpWQ1ZPRjhJK29GZUdVd1JnR0cvOWJD?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc926617-dbfe-42b4-9513-08dde3c6db9f
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8102.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 11:02:18.6909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xk3JUgNZRMXqs0u0salEARb6kPFvgEmm3Fc+quoM0WGyLsc7yUSgDYuKsCFHNvAhXttk26BzBbDtrTLl1N35JC94djBNwVDCAoUnKOzyINo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6095
X-OriginatorOrg: intel.com

On 8/25/25 12:13, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
> head:   477bd744709ed3884ba4544574e78706358b627a
> commit: 8a3ba7f03f335554bbde8ae17798a21e4a3b62ad [83/96] ixgbe: fwlog support for e610
> config: x86_64-randconfig-006-20250825 (https://download.01.org/0day-ci/archive/20250825/202508251750.6y0aVhmt-lkp@intel.com/config)

CONFIG_LIBIE_ADMINQ=y
CONFIG_LIBIE_FWLOG=y

so it is weird, as ixgbe commit has:
+       select LIBIE_FWLOG

so I see no bug on our side

> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508251750.6y0aVhmt-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508251750.6y0aVhmt-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     ld: vmlinux.o: in function `ixgbe_handle_fw_event':
>>> drivers/net/ethernet/intel/ixgbe/ixgbe_main.c:3360: undefined reference to `libie_get_fwlog_data'
>     ld: vmlinux.o: in function `ixgbe_fwlog_init':
>>> drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c:3945: undefined reference to `libie_fwlog_init'
>     ld: vmlinux.o: in function `ixgbe_fwlog_deinit':
>>> drivers/net/ethernet/intel/ixgbe/ixgbe_e610.c:3953: undefined reference to `libie_fwlog_deinit'
> 
> 
> vim +3360 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c
> 
>    3324	
>    3325	/**
>    3326	 * ixgbe_handle_fw_event - handle Firmware event
>    3327	 * @adapter: pointer to the adapter structure
>    3328	 *
>    3329	 * Obtain an event from the ACI and then and then process it according to the
>    3330	 * type of the event and the opcode.
>    3331	 */
>    3332	static void ixgbe_handle_fw_event(struct ixgbe_adapter *adapter)
>    3333	{
>    3334		struct ixgbe_aci_event event __cleanup(ixgbe_aci_event_cleanup);
>    3335		struct ixgbe_hw *hw = &adapter->hw;
>    3336		bool pending = false;
>    3337		int err;
>    3338	
>    3339		if (adapter->flags2 & IXGBE_FLAG2_FW_ASYNC_EVENT)
>    3340			adapter->flags2 &= ~IXGBE_FLAG2_FW_ASYNC_EVENT;
>    3341		event.buf_len = IXGBE_ACI_MAX_BUFFER_SIZE;
>    3342		event.msg_buf = kzalloc(event.buf_len, GFP_KERNEL);
>    3343		if (!event.msg_buf)
>    3344			return;
>    3345	
>    3346		do {
>    3347			err = ixgbe_aci_get_event(hw, &event, &pending);
>    3348			if (err)
>    3349				break;
>    3350	
>    3351			switch (le16_to_cpu(event.desc.opcode)) {
>    3352			case ixgbe_aci_opc_get_link_status:
>    3353				ixgbe_handle_link_status_event(adapter, &event);
>    3354				break;
>    3355			case ixgbe_aci_opc_temp_tca_event:
>    3356				e_crit(drv, "%s\n", ixgbe_overheat_msg);
>    3357				ixgbe_down(adapter);
>    3358				break;
>    3359			case libie_aqc_opc_fw_logs_event:
>> 3360				libie_get_fwlog_data(&hw->fwlog, event.msg_buf,
>    3361						     le16_to_cpu(event.desc.datalen));
>    3362				break;
>    3363			default:
>    3364				e_warn(hw, "unknown FW async event captured\n");
>    3365				break;
>    3366			}
>    3367		} while (pending);
>    3368	}
>    3369	
> 

