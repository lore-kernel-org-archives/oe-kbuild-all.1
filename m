Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7C1190062
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 08:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718354116; cv=fail; b=nd73h7TiOni/y1QJzs17kkmirlvKq0TpuRStJ8j4678+qYH0ILBsnc5c/w+GjFTPnJtzoZbMUiRVciTg/kv9rNqujADOFZ5Nw/B8ygp+vmCMfbo/sUYBc9vQXN494EocHvuP6P/resQUoa4AzwjTBsc1QAYCQbyv1P77iF2n884=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718354116; c=relaxed/simple;
	bh=9KPnOIrZxawgGFE2RjkT2sTDRFYFH7k0TfRbFvSxXbY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nQe+hzVm6yISApySQ4KlK9MNoxlLrTzb3IMnwsUs8SuJk1GYQ/GKX/B6FMI+1xqR5tKZsQTy3l4oZvmOHWAFVaav5j/y6MPabiDX5xfndBMesMlgsIn1NJE6VbL/PBFp//7GyEM1LP/Lcv8/HeJlnwNYIxNQPxsxI3KL5B/af0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cD51Qx/c; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cD51Qx/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718354115; x=1749890115;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9KPnOIrZxawgGFE2RjkT2sTDRFYFH7k0TfRbFvSxXbY=;
  b=cD51Qx/c0v3dwshojNMPTI3pIVyc9Dx5Tu5lfLRvJsVrxIsixzFlwtv5
   4F/Frk/J8k8c21Q2E8y1B2XTRg249epLEwlZefUflIWwsxuLNHYzfUwOC
   vxpNW7q4B/z6r6HxmAFx4rmEJEQVkvYoPcwJp7DyCQy3UPnsfdAWGhPnN
   Kj8FPpkznEtfL4zzcnTTKTBHX+Ia7XcwPK/FzmSoPJDNcr63ypsUQe3qS
   iyglUFFSLxEPvhzjpL593J5aIJyPe2CJ0vlHLZNL9NOHFtiGu3uaOOUKA
   dA2iWye7lFoXgAWNkAGKZT3irLJwmz3ZPpG+DDcAugEdqMvWnvj7thIsE
   w==;
X-CSE-ConnectionGUID: UkfoHM5mT7iOMYdPi2vn/g==
X-CSE-MsgGUID: Q4vTFCJqRCOxDU3N68awAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25805845"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="25805845"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 01:35:15 -0700
X-CSE-ConnectionGUID: 3NuIstR5QMaP1kLigkySbQ==
X-CSE-MsgGUID: 9BXkwvGmTOKd52yRqvgBzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="40568554"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Jun 2024 01:35:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 01:35:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 01:35:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 01:35:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 01:35:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACju00SEEN3QN/u4cXnCm17j1N6ED2VYs0hT0ZXgGSoX3Q3E/hOx9qUvlQL4x8Aved8RJjN5MS0w2ezJxqiQEVW1pIhZDy9w/ov32v3OJdOMO0zMASlVisZtnvtRJGLShV2ATqZM7Udj6l6LY8fcqrPaRVArMuF/BUac6sUttUQj83wI6QNfa7sSLfhvv2e++7im5zLGYoub1WUMfu63Ax/WOMGIUaDwkjyNUYXM+7S5NS59EvZ/B+K4iRdFjRuoFDOeP4DxcHmFl/7SB8OQtXsrU1CkBkr7bYtOcKS8t4VhZUpBtdOqonpyv6TgpbbcpcrtjFsVTDj8C180kLjTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KPnOIrZxawgGFE2RjkT2sTDRFYFH7k0TfRbFvSxXbY=;
 b=Mni0Z4/d56qL2+IuL3L2bnxgN1c5vRWUUUGPUPaJWd8obf4t6vxK7Ahsa6QZP/jrbdrFGEUF7KPsA8gfZ5V/soZClz9vF5HoNeeKOznh0yJs0ZsRMAK9JRgLRVp5m42n15xLVfmuB86Oyb8WiYTDslu0GTmaJ7AnY/XoWQH/AFIlUcA8EAPgHXYcHAqxdvzcXtw8ddeWVjSddrIOjelVkUSoO/LJg6nF+stnvwyu0V+7hE5CeWvPY/5gUbCc3Xt+6q9afqEwaiuYu/xN96blgAiwE9putDiw8HvWyUiFINC6s9p1HYI07nUuvMukK2iGiig0/w8tSyuqRvErNvsR+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by PH7PR11MB6008.namprd11.prod.outlook.com (2603:10b6:510:1d0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Fri, 14 Jun
 2024 08:35:04 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 08:35:04 +0000
From: "Liu, Yujie" <yujie.liu@intel.com>
To: "rostedt@goodmis.org" <rostedt@goodmis.org>, lkp <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [trace:ring-buffer/core 6/13] kernel/trace/ring_buffer.c:1704
 rb_range_meta_init() warn: unsigned 'cpu' is never less than zero.
Thread-Topic: [trace:ring-buffer/core 6/13] kernel/trace/ring_buffer.c:1704
 rb_range_meta_init() warn: unsigned 'cpu' is never less than zero.
Thread-Index: AQHavOE9/cyg+Mb3eE6rxtjmiYNEg7HETx6AgAKgXIA=
Date: Fri, 14 Jun 2024 08:35:04 +0000
Message-ID: <a540176f581324f4bc0e1dd466bb736684c4fb6f.camel@intel.com>
References: <202406122331.NhG72Fh4-lkp@intel.com>
	 <20240612122029.5de68891@rorschach.local.home>
In-Reply-To: <20240612122029.5de68891@rorschach.local.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8393:EE_|PH7PR11MB6008:EE_
x-ms-office365-filtering-correlation-id: 98bbcf19-2889-410a-0788-08dc8c4ce394
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230035|376009|1800799019|366011|38070700013;
x-microsoft-antispam-message-info: =?utf-8?B?Q005b3FISTFEUzhOeFhkR1NQNmg3dnBiQmExVm9Yd3daN25ZcEw4cmtXTzBX?=
 =?utf-8?B?b05Zc3VHckVOTUR1MHBwZUlQRWR1cXRkaElYU2ZUZUFENTNXZWFLSXFXOURm?=
 =?utf-8?B?UFJuZWFJN0FOQnlMcWxnNmViOE85bTd2YVVjY213Yk5wenFxWjlCaklsWXd0?=
 =?utf-8?B?cTFnUXRwSkpZSkhLQUQ3ejJkV01BS0kwVGhvaUhCZjk5Q2dKOG56ejZVeWlu?=
 =?utf-8?B?d3hYV2FSOU9QRTBiUmRkWmplcURXek5HOUF5a2NzRlRlQ3Z4cXBuc1B1VnJR?=
 =?utf-8?B?cWs5UllGdC9wcUR3OE40MGQ1ejV0MUU0RCtveEROTHI2Y1dyaWs4WEtLeHdI?=
 =?utf-8?B?ZXliWXVoN0YvNVd1Y2tuYU92eEVlT1MxeWsyVWkyZjM1QU5la2xPK0JUR253?=
 =?utf-8?B?QXEzZ0JuUDE1TkJ3UVRMWUxoVU96WjJCSFloT2dLV3BPbDcwQkJBbVNHeEFy?=
 =?utf-8?B?MnRDVnNGdy9nejVCdkJQTS9YdThtSUs1bVdlZ2ZqaW5aOTZ5ZmZhaGVDTGNv?=
 =?utf-8?B?OHRNL24rVVJxT0oyT09zeG43MXkvR3VhYU8rTVNYZVYxcjgwUjZITjZKcVcw?=
 =?utf-8?B?Z3EvS2lCK2RsWC82TUlaaXNYb0J5NUpWQ1ZaNzYrSUxtWkhNdnBBdFFqc3Rv?=
 =?utf-8?B?Mzh2ZjdBNmJWZE5BL2tLeXZvUWxVZWFIenNXZFpHbmxJUUcrNGtQbTIxWDlz?=
 =?utf-8?B?bXMrL083c0hpTnFnVDVCeDFKL0o3WXJRWnd2NEJxZ1Fqb1pLdjkvcGk0TGpa?=
 =?utf-8?B?Nk9keTVOQmJYeWFub0R6clo3RzUrNUNiWHVHT202SWFVcVVrQ0VTS1EyVkhQ?=
 =?utf-8?B?U0JVMlpMVkZNc2dvQW5OdGY3M1pRYVJSYUpCWlJrckZBUmdLMEpreGd1Y1JR?=
 =?utf-8?B?WmZIa3B6c2RZRk1yOG93eXJPSXdLa2hoTjVYRk5Lalk1aTJhdG9FTTVMaHFS?=
 =?utf-8?B?WXJKNWFMUHpXOUhVUHBlRXl1dmhEYkV0bE10ak9BOGthQk5LRE5oWnRhQ1ly?=
 =?utf-8?B?ZFVPclU4NWpCeUxDa2FaQkdaWTlTS3hXYnV4QTR5ellnQmswcHdGRTVtQmFk?=
 =?utf-8?B?c3hKQ1BXa3JtT295YklYZUNRallrL2laSWtLN1JJTjZBMFArckFUYTNPdzh4?=
 =?utf-8?B?VGx5M2hCb2tTNWZMWGNVYksxbWdVQ2hsUVpVejc3VndCdHBzek1oT1JWL0p1?=
 =?utf-8?B?aTFsMjhjUFBoaE9abTBMeXpwR3djWHR5V0Ryc09adFVoWVQ1NDI0eURZNHdB?=
 =?utf-8?B?bk5oenJRWmdXTE5BenROZ2tNMDdwU3dCR1hyd3dsNGtMZHd0anJvUDZSOXZt?=
 =?utf-8?B?SWNPbXVVcDc2UWYyNGZ4M0dJU25maUpZRkRpSklDdGIwM3ZSakYraWVQQ3U5?=
 =?utf-8?B?TzR2NUNJdlF5MmVlckJIN1hoMHQwL2lTOUxUd3dMcXZWV2tyNUZ4WWhDYW01?=
 =?utf-8?B?YTZpOVVpajg2M09vWk4vQkJlOGJHK3NvczR1Mkl6MkdmaDAwR3hoWjBtcytV?=
 =?utf-8?B?cHJ6VkxzTzJBdUwwNmIxQ3JKUUUrVlphR015QU5SREZsak1TZ2FvNjJlYStZ?=
 =?utf-8?B?YkdodlhZa2dhUHkrWVZhL1o2cFIreVg2ODd0Z1NaQWRlaDRpREltZDYxc0lH?=
 =?utf-8?B?bEZPd2V6UVQ0WEJ5aGFaOCswZUlKczJqNWlnS1FiQ2JzZjAyWWlEMFVKUmNt?=
 =?utf-8?B?SlhybEo3RW1jOHlxZFIzdVhtbnpyZGFVdXhDdTF3bHNTS0svUFFMRlA4bmk1?=
 =?utf-8?Q?J2t7hO2ogPa0AUi1erOOBxzQdirRMDrP53l4YFj?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(376009)(1800799019)(366011)(38070700013);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWRUM1hJS0xOUzJNNTFlT0pMZlVoV3hMb0hoR2tsc1Yvb3hpQUp1YkU2VzdV?=
 =?utf-8?B?Y083eEdtc2d4VDRObFBDODhqZ2ZzNGxETktmdkpDbjJ4QVpvWWZtakpScGRo?=
 =?utf-8?B?U0hCeHZ5VWVVMG5oUjBqd3RGTXhtOEx4WlpuNUd6Q0c3MmJ5M0s2eWFpWTZU?=
 =?utf-8?B?WnJxazFDSmtWQjI3ZXpxNENkYnk4WXVJaTBvcHAzc3p0dWR0cnR3eW9pQ2lN?=
 =?utf-8?B?YzhSbWZpTGppQ05OZ0o0Nm5qM1pSREJSdU1XOGlkSDZWYUJPSlNERlVibEcv?=
 =?utf-8?B?Y0owWFVoUVJoSDlOOGQrWkxueTNFTGVyTFRaUlpoU0pyMWVTaTYydm1xVG9j?=
 =?utf-8?B?Qm1EVUNZN1N6bkk0ajUzTmdsWmVIaEljZGN6MitaRzlBWWJFd09DcnRCUGZv?=
 =?utf-8?B?QTNpUTVWVytOZnNPcGwwelhqZkFXUUNUdzYwK1hSMEp4Mmw1TlRxNmJmeGU0?=
 =?utf-8?B?ck5IR1VNRzZHSkx0R2tXZzRldm5oa3Q4bHhZUk1SYnhVQ0xZUThobDYwdkZL?=
 =?utf-8?B?Qm1GNmFjeU5KYmp4by9jVllURDFIdjBZM3lla2tKTlB1eGRPYWJ1Sm5GWmZY?=
 =?utf-8?B?MFBEREVIVmN0OTJna3NoZTI2b1p6a0xZMDI3SFBsejdPUWxlZnB0L2dJRTBD?=
 =?utf-8?B?MkpMN05mOFQ5MFIyRmJlQ0NqNERFbkJKM3BnNlRiNHZ5OWhramlaU3QrY21S?=
 =?utf-8?B?MGxiMUhDU0FpRnBhUXJiMThkS1c2ZmtpMkJTbHprb0JJWFc0OXRsSlZtNVV0?=
 =?utf-8?B?ZnBjS2p1ZlVoQURuRjJqNFo2UkRkd2JlR0tWR0J2MG1CbEc1THRwbU8vYy9U?=
 =?utf-8?B?N0FxOVFhN2M2SVUvL21Sbk5KSnFJdVZGcVdLZnRBdlZ3Q0pXU3JXeUlKa1RW?=
 =?utf-8?B?R3BXaW1naTFTY2JSNWxRWHV4a0hoQTZ1c0duN2RVdGlvYWZlS2NHZVpUSHk2?=
 =?utf-8?B?Q2hMdFREVE9idlNMRDlNMmZId0IxQWVoN2JHczBETitqbWVsWUZ6RGRHRXpy?=
 =?utf-8?B?ckt2ODVFNGRxYk9DUTJyWE1aWlFQZU5ITWJwSERtaHh6bkFudzVycDBEQ3Fr?=
 =?utf-8?B?M2tIaHM1SUNFVkoyMnJ3NXlDdktENWEwY3VYNHRCcnVWa29RdXR1MFJEcVJ2?=
 =?utf-8?B?cHVVL2lHZFA5TEQ0bmUvYUs0d0lZMjRxK3RCTWFUaHNWK1J2R256RTBWRjIv?=
 =?utf-8?B?QlkzWFNtcW8zaE1XVFpRa2wrMGJFMDZUWGo3Q3ZubzJvUFdkd0g1d2I2RXJH?=
 =?utf-8?B?TFZXckxGa2RGYVlNNjNPbUhCL05Uek9MU3F3b2VqdDRqc2dYOHZQdENzQ3or?=
 =?utf-8?B?MDhMd0ZNZ2FPWEhoWStOSUpObC9QcnF2WTM2bVRySzVtRFJuN2tvZ1lnTGlG?=
 =?utf-8?B?S3NmTk9JMUNJalhPemZsWTRSY2J6MEt4TVI4TDhFTFBwVHJUbVhpUmx4bXAr?=
 =?utf-8?B?dzJrZDFjbkVNQWV0ck5OTWc5S0I2bURMSzRCd0ZVUjlReUsxOUZ3OTEwaktC?=
 =?utf-8?B?eUlXUlFVZis5c1diMEIyTjdySGlkZG8zZGZ1cVBTak5kUllKM3Q3ZUx2SGhF?=
 =?utf-8?B?NFhZTkw3WWlPNDJoZnB0VmxXa2lmU2hQbUYrb1RVSHAraVVLVVRvazhmOTgr?=
 =?utf-8?B?VSt3TGlMWUZjckdGN0ExR0lZcnVzeXV1VFhPY1F2Y24yVFFBb1Ixam1kdEoz?=
 =?utf-8?B?dnlHZHFqVWZsaGEwdU5Qb2dHTVZPV25CUFhDMlRldC96Tk9oSE1BcldwaG5Q?=
 =?utf-8?B?cmRsVGI4a0pPZVlSc1N4UlluZUV5VEFVR01RbmFNbjBySk8zNHFNTUVwWTd1?=
 =?utf-8?B?U08rV2hQUlZ4MHhwRm9UR0wxR09ZNURWb29xeS9SR1o1RmkwNkVlYVRRcVdV?=
 =?utf-8?B?T1V1WC9nOFRXNVByN3Y5UmdUcHAyYlZVTmNobGhVM2hxZG5yd3M0bjBCd0R4?=
 =?utf-8?B?cGlzSU1KNGhDc2RYQWVLL1hVYlkyeTd6UHU0MnI0ejArbG5zS1F0R3YxNVpu?=
 =?utf-8?B?RnNnNEhyVVhCQ0FzZmF3eFR0Z1NmZVBEbnpjR0NyUmNIQkRLajhwSjBjdG9x?=
 =?utf-8?B?Nmp5Z3BuQ3REdVdVbDNNL1RjODJVTWU2Zk1USHhhUlpCaWl0NXlPSmx3RElT?=
 =?utf-8?Q?/KLnpJ0F0ZYrC5RGGkiqdpRI+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2621B1925DB73E449DCEB4BD89F34BD5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98bbcf19-2889-410a-0788-08dc8c4ce394
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2024 08:35:04.3274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DBHWzCUoxLLMxwKEo9G6FPj4osSCKaAc4pb9Q0a0kwVh/U+3fpdnViIvIz2mruLaLvmVVS97RYNL6T5DKvYN7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6008
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI0LTA2LTEyIGF0IDEyOjIwIC0wNDAwLCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToN
Cj4gT24gV2VkLCAxMiBKdW4gMjAyNCAyMzo1NjozMiArMDgwMA0KPiBrZXJuZWwgdGVzdCByb2Jv
dCA8bGtwQGludGVsLmNvbT4gd3JvdGU6DQo+IA0KPiA+IHRyZWU6ICAgZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RyYWNlL2xpbnV4LXRyYWNlIHJpbmctYnVm
ZmVyL2NvcmUNCj4gPiBoZWFkOiAgIDY0MGUwNTJiYTQyZDU3N2E3ZjU3MDUyZGJlZTcxNGNmNDcw
ZGQxNDUNCj4gPiBjb21taXQ6IDkwMTgzMDRiNzA1ZjMyZDI0ZmRhMWE4ODcwMmVmMjJjOWE0MzZl
ZjQgWzYvMTNdIHJpbmctYnVmZmVyOiBBZGQgdGVzdCBpZiByYW5nZSBvZiBib290IGJ1ZmZlciBp
cyB2YWxpZA0KPiA+IGNvbmZpZzogaTM4Ni1yYW5kY29uZmlnLTE0MS0yMDI0MDYxMiAoaHR0cHM6
Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjQwNjEyLzIwMjQwNjEyMjMzMS5O
aEc3MkZoNC1sa3BAaW50ZWwuY29tL2NvbmZpZykNCj4gPiBjb21waWxlcjogZ2NjLTEyIChVYnVu
dHUgMTIuMy4wLTl1YnVudHUyKSAxMi4zLjANCj4gPiANCj4gPiBJZiB5b3UgZml4IHRoZSBpc3N1
ZSBpbiBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBhIG5ldyB2ZXJzaW9u
IG9mDQo+ID4gdGhlIHNhbWUgcGF0Y2gvY29tbWl0KSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFn
cw0KPiA+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0K
PiA+ID4gQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjQw
NjEyMjMzMS5OaEc3MkZoNC1sa3BAaW50ZWwuY29tLw0KPiA+IA0KPiA+IHNtYXRjaCB3YXJuaW5n
czoNCj4gPiBrZXJuZWwvdHJhY2UvcmluZ19idWZmZXIuYzoxNzA0IHJiX3JhbmdlX21ldGFfaW5p
dCgpIHdhcm46IHVuc2lnbmVkICdjcHUnIGlzIG5ldmVyIGxlc3MgdGhhbiB6ZXJvLg0KPiA+IA0K
PiA+IHZpbSArL2NwdSArMTcwNCBrZXJuZWwvdHJhY2UvcmluZ19idWZmZXIuYw0KPiA+IA0KPiA+
ICAgMTY4MAkNCj4gPiAgIDE2ODEJc3RhdGljIHZvaWQgcmJfcmFuZ2VfbWV0YV9pbml0KHN0cnVj
dCB0cmFjZV9idWZmZXIgKmJ1ZmZlciwgaW50IG5yX3BhZ2VzKQ0KPiA+ICAgMTY4Mgl7DQo+ID4g
ICAxNjgzCQlzdHJ1Y3QgcmluZ19idWZmZXJfbWV0YSAqbWV0YTsNCj4gPiAgIDE2ODQJCXVuc2ln
bmVkIGxvbmcgZGVsdGE7DQo+ID4gICAxNjg1CQl2b2lkICpzdWJidWY7DQo+ID4gICAxNjg2CQlp
bnQgY3B1Ow0KPiA+ICAgMTY4NwkJaW50IGk7DQo+ID4gICAxNjg4CQ0KPiA+ICAgMTY4OQkJZm9y
IChjcHUgPSAwOyBjcHUgPCBucl9jcHVfaWRzOyBjcHUrKykgew0KPiA+ICAgMTY5MAkJCXZvaWQg
Km5leHRfbWV0YTsNCj4gPiAgIDE2OTEJDQo+ID4gICAxNjkyCQkJbWV0YSA9IHJiX3JhbmdlX21l
dGEoYnVmZmVyLCBucl9wYWdlcywgY3B1KTsNCj4gPiAgIDE2OTMJDQo+ID4gICAxNjk0CQkJaWYg
KHJiX21ldGFfdmFsaWQobWV0YSwgY3B1LCBidWZmZXIsIG5yX3BhZ2VzKSkgew0KPiA+ICAgMTY5
NQkJCQkvKiBNYWtlIHRoZSBtYXBwaW5ncyBtYXRjaCB0aGUgY3VycmVudCBhZGRyZXNzICovDQo+
ID4gICAxNjk2CQkJCXN1YmJ1ZiA9IHJiX3N1YmJ1ZnNfZnJvbV9tZXRhKG1ldGEpOw0KPiA+ICAg
MTY5NwkJCQlkZWx0YSA9ICh1bnNpZ25lZCBsb25nKXN1YmJ1ZiAtIG1ldGEtPmZpcnN0X2J1ZmZl
cjsNCj4gPiAgIDE2OTgJCQkJbWV0YS0+Zmlyc3RfYnVmZmVyICs9IGRlbHRhOw0KPiA+ICAgMTY5
OQkJCQltZXRhLT5oZWFkX2J1ZmZlciArPSBkZWx0YTsNCj4gPiAgIDE3MDAJCQkJbWV0YS0+Y29t
bWl0X2J1ZmZlciArPSBkZWx0YTsNCj4gPiAgIDE3MDEJCQkJY29udGludWU7DQo+ID4gICAxNzAy
CQkJfQ0KPiA+ICAgMTcwMwkNCj4gPiA+IDE3MDQJCQlpZiAoY3B1IDwgbnJfY3B1X2lkcyAtIDEp
ICANCj4gDQo+IFNvIHRoaXMgd2FybmluZyBvbmx5IGhhcHBlbnMgaW4gdGhlIHVuaXF1ZSBjYXNl
IHdlIGJ1aWxkIGZvciBhIFVQIG1hY2hpbmU/DQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoaXMgaXMg
d29ydGggaXQsIGFzIGluIG1vc3QgY2FzZXMgbnJfY3B1X2lkcyBpcyBncmVhdGVyDQo+IHRoYW4g
MSwgYW5kIEknbSBub3QgZ29pbmcgdG8gbW9ua2V5IHVwIHRoaXMgY29kZSBqdXN0IGJlY2F1c2Ug
aXQgZ2l2ZXMNCj4gYSB3YXJuaW5nIHdoZW4geW91IGJ1aWxkIHdpdGggbnJfY3B1X2lkcyA9PSAx
LiBCZWNhdXNlLCB5ZXMgaW4gc3VjaA0KPiBjYXNlcywgdGhpcyBzaG91bGQgdHVybiBpbnRvICJp
ZiAoMCkiLg0KPiANCj4gQ2FuIHlvdSBwbGVhc2UgcmVtb3ZlIHRoaXMgZnJvbSByZXBvcnRpbmcg
YW4gZXJyb3IuIFRoYW5rcywNCg0KU29ycnkgZm9yIGJvdGhlcmluZyB5b3Ugd2l0aCB0aGlzIGxl
c3MgaGVscGZ1bCByZXBvcnQuIFdlJ3ZlIGNvbmZpZ3VyZWQNCnRoZSBib3QgdG8gc3RvcCByZXBv
cnRpbmcgdGhpcyBlcnJvciBvbiB0aGlzIGNvbW1pdC4NCg0KRllJLCB3ZSBzdGlsbCBrZWVwIGl0
IG9wZW4gZm9yIG90aGVyIGNvZGUgc2luY2UgaXQgbWF5IGhlbHAgdG8gZGV0ZWN0DQpvdGhlciAi
bmV2ZXIgbGVzcyB0aGFuIHplcm8iIGlzc3VlcyB0aGF0IGNvdWxkIGJlIHZhbGlkLg0KDQpUaGFu
a3MsDQpZdWppZQ0K
