Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A786C344024
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734729; cv=fail; b=CBfatphPOd2BXaMilVk7r3K+MFl0F20lrwzjPb2IlkWaW2Qm43YzYRU/oCfzLYCQIgEuYD8Qv+TqACU5qzNx4T5H5jqREexWHd6/g/BuJUXHP5TwC22NWkXRr205Pavdclu4VgPeIbfQfJH24qr2PRs88DXtsE0boiBYdIcRkVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734729; c=relaxed/simple;
	bh=NAnh8tGi7/LVAmkmiWuhtgLsji9JKLKs2pKqD11CnOA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=otmfhADw+Ud4frMjarf51ef596YEq314sNm6YTlbXj76lpqorKVe0ls7vHjbcDpeMYrTyMioPUv0eTtU83/hXnClKqxAQ/IVKE1rqhfj1bamZFIzWJKItw532hOSBLMea2ETR5QwhXkPyh4DGdw88thzBoGCCjQQbax8QL9dVBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yghcm2md; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yghcm2md"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763734728; x=1795270728;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=NAnh8tGi7/LVAmkmiWuhtgLsji9JKLKs2pKqD11CnOA=;
  b=Yghcm2mdax3jujOa+oi7iLAvfczP53Y4jzXv6ZUB9p5+Q5s5Y7Bur9p5
   rTJtkXz87WjOl65TcPDSUeHOXw9z5CKTwfDjEEVL0d2RbA9YeawBVA9eA
   Mq2EO2ks2AAZOySgXXZkci5Up3CWRQJKJHpuPcXliJNB8gJQf40ZOY5QM
   lwdxV5dcHIvzWCtokEi+GU3Yjevm364Y2EDV+0qlJ/lqSg+5g23cVKcM0
   X6wnXq+ND5j95qChn1LUQyHhyGUhslgxVeeS/M5Z3YnhbVRjEqTq/Lsis
   +VZTR3rKw0eME8XQOFs0jwB4ExEqeFsS1ju/WooLQtTvM/lS4J1yQO63H
   w==;
X-CSE-ConnectionGUID: 9WBnOSB4Rxmdp83p4Tdbwg==
X-CSE-MsgGUID: iZemS5wzRJK1kGcyUD1DoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65867486"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65867486"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 06:18:42 -0800
X-CSE-ConnectionGUID: GtJrUmNZSGiVbRX9Iql2WA==
X-CSE-MsgGUID: BGLPqU70QtaPObRTXNwkUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="191951386"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 06:18:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 06:18:41 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 06:18:41 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 06:18:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXgTW8OK4/hoIPtooHE5uP5H8hq+exDY2FwxqJI1qqk2Hq8hRTX2sJ9FEex5KLISJ/9cNWp0qQ5jtOGrl92HhJVFbSCQbMoPZFSlJOu98Qfxd6uFB0UIdJKWTfGJdFprAsg+xHMtbC+SSpv0On8dOZgFuyF6KoLQxhJm00ed+s9X2TNNDAWmlCiN3w+MahdrdyYqVcM/ZeddpTylNE293bwuPpmq39ayDJ6yMFlB96KuyQAZgjoV8SFe2D6hC67U5a4sePlXe/e9rIPjQ1xnCWtUelt5G697ZiRD7E9iRA3aZzSRpnJ6KqBE1BjIYgIiYHmxz6o1sBmQ0PIRQxFOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkbDA9nNhqwCAbssCvcSn9sjri4CVgeLBcj+bRyYAlk=;
 b=dlms7YR+yscNqdeV2sUJAV7xmWC70NNJUN1xHLyImZjpkLHtgxruF2vXrvMDsZkjz5pR2OfihFfon8XQHSSQKtwT2XsQF96saPumDmM3oyKge72VXW3zxaIbifXnfH0ETVt6lp3IR4JCXEBxPbBm0iJy/KgSei6TiL58VcXPLBp79Jvc4cBkLO5oezAU1+fFEKimLZZiGJIQG5NWZW5ofpkBMC60k9T08s0hO3tutvDYMo/GaNmQqxsSuioHj+m/qHIbru2mWCQOkvaKbq5Nb9fIUX70WDK2AQS6bkDjwzr9dcZOzCT6JQo/1+wXhy6VlZRTLNUN25cnRlGrAzvUvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by SJ2PR11MB7646.namprd11.prod.outlook.com (2603:10b6:a03:4c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 14:18:38 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Fri, 21 Nov 2025
 14:18:38 +0000
Date: Fri, 21 Nov 2025 22:18:30 +0800
From: Philip Li <philip.li@intel.com>
To: Eric Dumazet <edumazet@google.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>, Maciej
 =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Subject: Re: include/net/sock.h:2098:16: sparse: sparse: cast from non-scalar
Message-ID: <aSB0th/PTJN6qaFW@rli9-mobl>
References: <202511140407.VnaDOCI3-lkp@intel.com>
 <CANn89i+2Jv71p-fVgdKHUYyTSr7d567njPM1inxs=YR1ZgBj7Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89i+2Jv71p-fVgdKHUYyTSr7d567njPM1inxs=YR1ZgBj7Q@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|SJ2PR11MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b721b30-24f8-4176-3f37-08de2908dd26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHd6dDViM2QyaHpuTFZYNitZV0tNLzRYOUZQejE0Zk1WNjQ2SlJHY0k0bU5o?=
 =?utf-8?B?dDlVd3RVRlpYVlZMUTNrM1FadTlUd1E4YVdZdDV6RFVQeGFXaXh6SWE4RUM5?=
 =?utf-8?B?UXlwdFpCZTBYcDJYbnlWVU5QOTc3ZDBJK2V6OUxmR1QwWWVNclEzNklZWnZI?=
 =?utf-8?B?bnlhcUU2MlEyUW9reFdFNFZneFlWTitud0VIUFJHQU5PTUMvdnByVzVaa1JL?=
 =?utf-8?B?Sk9reW9YMzN2NDh5TTZOM2RRL1I2Z3lQamhERSs2U1J3UGRRbFdOY0ZjTi9J?=
 =?utf-8?B?NGRlWFhFdmRwUmFzY3RIOE9Ed05yTXF6aHZLbTJ5a2VPSFNuNXNGL3grV2dw?=
 =?utf-8?B?Z2lPSm0rOEJPcEdJam5CQnFLNE8yTSt4aktOL2xFTmEzZDRNSFhFVTF0ajVy?=
 =?utf-8?B?ekMveXZ4dXRqamZZMzgzV0ZUajA0NUxGbEwyZmdPekFEOEFhM3B3Q0xQWk41?=
 =?utf-8?B?cjBNbWRoSVpzUG9POXVlVVZYNS9ReHROUUY5UW1HOVJGVnhGb2dqcS9VMjVy?=
 =?utf-8?B?TU1hbVNYNktwcWxqcmhyTEdLb2tmNFAyK2s0Wml2TWVVRDVOOVRtUkMyTWVJ?=
 =?utf-8?B?WGRrd3FPQVJXenVMSDFGanJORXg5am1nTWk1cm5TeU9qblJ1bDV2QS9ZaVVk?=
 =?utf-8?B?OFU0Y0ljZ280a0h2ODJqZ1dhdnRHeGMrWVREVVQ4OVBOb3A5eHczTVFNWHNC?=
 =?utf-8?B?VDlRRFJLK2NBWGo4R2M1OVZSY3I4YnFjMGd5Y0hYUUNacE9wMU5UNnRPWUhP?=
 =?utf-8?B?dUt3Vk9nOTBhNUVJVjlXb1BpcXNxbzJ3THA4NUpidnRVcFpoM0JNOElzNlFF?=
 =?utf-8?B?NHVEa29nRU9NMHNkU080OGlFWFpwc0c0SVBCdWNlOVUrblBrYzA2SlE5a3JF?=
 =?utf-8?B?U2N2L05KTHFtMnZzcXZDS1plRnJaTHl4NjZkMVhKb3MwZko2OUhXeGNnUTBF?=
 =?utf-8?B?QllrZzduSmRQcmJKRkJlVENPRFRQYjRIN0E4dGNyZEs0TnFSTkIvRTAycHJp?=
 =?utf-8?B?K1hQMG4wWnRLbXk1RC9ZTVlwbEwxYWNiVUlUOWNQNkJ3VzhpZndCUFROemhP?=
 =?utf-8?B?SUZuMGk0M0NTVmpJdzhhODRrV0VQL01vcjdzclhaNjdzK2N4YXdZeUQyZ3Ba?=
 =?utf-8?B?RFNoQ05MaHNobE5FRzhsM3VhVmM0eVdHbVpiTjl2Rk4zQjFtZ3VQdW50cUN4?=
 =?utf-8?B?dW9qaDBVZHBURUI4d3g4dFFHbGJYa0tuRE5acEhxWkFBaWs1QTltYzduc1R0?=
 =?utf-8?B?cFBGMXo4MjJmRDZCMm5oR1NVVENZcEhVOGptWkhMb2dxWkFVOWtIUVhhKzBS?=
 =?utf-8?B?WTBueGxoMDhEMnFGZm9wVytIb1VRYVU5WElpamR4YVgvWFZZWGlnUUVZOHMw?=
 =?utf-8?B?dHhqWUFubng5QnpraUdZa2RJSkpTYUNiVzdkeHB4cWhjcHhXcUNZRXlXQ3Er?=
 =?utf-8?B?QkgxYW9BT3hXQ01DQkJMV3VNQ3JUbktpNnFZYVVPeTBzV1cxRTg0aG5zMlFr?=
 =?utf-8?B?ZnNlTHBtRkhtUVNDL2lEeXZHQ2FvdUE1bDZWNUpnQVU5OTFBT0RwcnRqcSt5?=
 =?utf-8?B?aUpkWlNIWWVWWjQ0RlJiS2VVTnJuSkUrZncydjBBdnZUZnpzZjAyYzl6ZFhI?=
 =?utf-8?B?cEdtY3BxeUNqK3ZHdUxieG9Cb1JYYlZtM2hMV0Z6WU12UERpbzZ6SjAwenRx?=
 =?utf-8?B?OEdDdTgyZllZN2hyeU1tZUFGK1dmM09hbXdOS01tNlI4LzljdXA1d2c4Q0lK?=
 =?utf-8?B?M1BhaVpicXBEcG9hL254eXN6VncvT0pJR2t4eFFBZjR3d2cyQmFTdktYWitq?=
 =?utf-8?B?WFB6UTR2eWRsVkdPVENZb1FyRjFVRFpiODhueXZJRmhpZWhJZ083NTlQWmNV?=
 =?utf-8?B?RUhhWmhKVjVYV0FSQzZ4cDgyWDByb3lsQStwUGtMOEF4aVA1bDdTaU5LSEx1?=
 =?utf-8?B?Y0xBS1hyRHYrZzNHdmxGZkd1SFpINzYwMFRoR2owVkJWek4xVTBrVUZXQm53?=
 =?utf-8?B?VWpqZkxKaExBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWtzSUZ3QVRueE5jUXVkOWVic2d4RSswcTAvTWhYL0FteWt1dEUxT2dHN05Q?=
 =?utf-8?B?Y3JpL1BjMEJyMk9mWCtmR0dyZXRGdENUVys3aTJ5TDN2OG1QSGo0RHllZXIy?=
 =?utf-8?B?UHNuNWtHaHR5aEp4QmJubWxabG5MQStycXZuU1hkMTN3V2hISE56dlBieW40?=
 =?utf-8?B?dXB5NmtzY3luMDRmUy9DaUdmVUc3S080RFMweVAraE44TjBzb0JGRHI3Lytm?=
 =?utf-8?B?Q2h0c3YvZGhXSXVONlQvM1lqK1lXeXBBSjhhQ2MwMU1zaWhOTEZYbXE1WDlx?=
 =?utf-8?B?bDBiQmFxVkUxRHRxWHo1VUtuNnlybHlKRGswVDBGQytRMiswSXVOOHR2V2ww?=
 =?utf-8?B?Visydm0yaGRBb0ZWYXBQVWVZanBSZzFlSkcyVGZMWDJZMnBkUDhXWUoxMjNE?=
 =?utf-8?B?YUltNHJhMjA4SXo0UHNNT012dDJqV3NGWHl6VE1wbXdmQTlQY1hQdXhLMEFC?=
 =?utf-8?B?S2l5MVo5eEZSY1owbm1mUEUzT3hsRWp0cDVjNXZLdjNPUnA4ek9zeVpxbHhh?=
 =?utf-8?B?SW5MWnNwVldhWkx2Nm03eStrdGpiTlYyS0Foa2JXSkdkeTJoVWVCQzNrSFkz?=
 =?utf-8?B?dEFhK3ltdlBIQmx6MEdxc3l2VnBEdGt6dVRxSkVmOVFaUUVUVGlFZi9KRXRC?=
 =?utf-8?B?ZWZ3RmJOcjk2ZldKV3k1aTl4REpINTFjd21DNDFQWHRtWEdZQ0lBTzduN1hr?=
 =?utf-8?B?VmRIeEZhdEJ4bmhaTTQzYkgzZGRSTnJzUGg5Q256YlkreVhNNjJtSXpPc05w?=
 =?utf-8?B?dmg1S3pkTWlSczEwWlFxNlorWEd5RkxUZmMvWjFBVzgxRk10UU9FSXVuVngv?=
 =?utf-8?B?bUV5QlFxeFNCWDNvSXdocXFuaXV6QzFVTHFvbjJRbG15TDdlM1RjUkpTSU9U?=
 =?utf-8?B?QWl0VERKUUJiTE1uYWlEUU9JREFPcHp2c09aRkRyQ29mL1FzYjFQUC9WQzJR?=
 =?utf-8?B?ekdzdlllYjVEellFeG9FYi9wOHlWK0ZQQm43RDlGVWc3NUdDYUhnVkFZQm0z?=
 =?utf-8?B?dm1NOWxhbEg4VVhHME84dktCSzY3aW1oNEhHQStzTm50SmxsbHFzUU9SU2Yz?=
 =?utf-8?B?aGxMVUhuTGY1cXh2aW9wck9kUjdzaFB2SExFbmIrY3RzK2Fwdzdlc1FJVlFw?=
 =?utf-8?B?TmtwcDJLYlZobWkzVEdqSVF2ZWhuTEdudmRkKzZzMS9tSWE0NmxxZzREcWNO?=
 =?utf-8?B?aWFpaG10dzE4cnRMdXozdUZ3bFhZUlRvMEQ4UVJjcVBqMDNTeXZzWUF3NTU1?=
 =?utf-8?B?bXJxcE9RaGlyMjU4T3ViZG5jMXNJVjYzdUlsMDFQazduNGp4RFppV2wxWXNU?=
 =?utf-8?B?OUc3RGhCci82dWluNDd5UUlTdkNuS2lUSmlyR1M3dFRLUCtPM2xjMFNVYkRP?=
 =?utf-8?B?VXF3YWtHV0VHSFhWbS9teTJab2x1ZVNMSmFrY0FuT1dwMWZqbFhzL1NLdnoz?=
 =?utf-8?B?Y3JBNklhcU0xankxeVo3VnZPOENKTWRybm1xbjE1WlY3Tm5Ra1p3aVViMHhy?=
 =?utf-8?B?YStIOTFHZjdUaTl5SHE1Q0l5Vzh2S01qQ3N6ZFcvQnorKzN5bUxLQnlkZ0Rm?=
 =?utf-8?B?QStQNjRGelN2VVVzUzk3UkV3YW1DVGkyQ2pHTkFETktHTHpnbTlZUi9BaEVJ?=
 =?utf-8?B?WUZlbktweGVpeXJrUmpjaE1wbmNhTUo2MHAyb0grYmFNY3NId1RqemVtYURm?=
 =?utf-8?B?bDN5SHBoQ011djVWRDlLWWtIUGN6RmI4bzVHcFpBcXBwNXYwQTJCcnpYNWNs?=
 =?utf-8?B?bmFKS05ZNS9PQWloTENqcnhYU05Za0FsUjk2ZXUwVGd3RG5VK0k0VkhsQXNp?=
 =?utf-8?B?YUlRZ09wNXFORnhEcjBLOUw2NWlxRFR6WWUyM2MwN0RRRGcrazNFei9BbGZy?=
 =?utf-8?B?bTlOQjRNRWRJUDRiVjVXR2JKdnhNRHE5K2djQmJvWU5hdUxFMkEzNnpaZks2?=
 =?utf-8?B?S0lna3BsWTdwRlp1SnRsTEFkNDhpRENWQjhKZ0ZvYWFNQVZmeWdia2F6ODh5?=
 =?utf-8?B?MHN2RGxQM0ZLUlJ6UnNBVDMvOFlLbnlHVDF5RXNVVytkYVhKQXl5RzBiRkU4?=
 =?utf-8?B?dnpoNTd6UHU5RlVIYlVYMGYzTkZLNDFDcm9vWlZNL2VSblF2TTcrSkJXWWtY?=
 =?utf-8?Q?9MaWpX7C8XKrfN2mV/eaGVM5n?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b721b30-24f8-4176-3f37-08de2908dd26
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 14:18:38.4171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHt8DvZ41hRCrsD/Fv7c4A2wpI8hrAtUQ80EHLQzoH7RFJpS2ZCJCOdtjZXf1qWKHwamkj59Qvm3TFJvtDXpaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7646
X-OriginatorOrg: intel.com

On Thu, Nov 13, 2025 at 12:22:01PM -0800, Eric Dumazet wrote:
> On Thu, Nov 13, 2025 at 12:19 PM kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   2ccec5944606ee1389abc7ee41986825c6ceb574
> > commit: c51da3f7a161c6822232be832abdffe47eb55b4c net: remove sock_i_uid()
> > date:   5 months ago
> > config: alpha-randconfig-r123-20251113 (https://download.01.org/0day-ci/archive/20251114/202511140407.VnaDOCI3-lkp@intel.com/config)
> > compiler: alpha-linux-gcc (GCC) 11.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511140407.VnaDOCI3-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202511140407.VnaDOCI3-lkp@intel.com/
> >
> > sparse warnings: (new ones prefixed by >>)
> >    net/llc/llc_proc.c:56:9: sparse: sparse: context imbalance in 'llc_get_sk_idx' - wrong count at exit
> >    net/llc/llc_proc.c:102:23: sparse: sparse: context imbalance in 'llc_seq_next' - unexpected unlock
> >    net/llc/llc_proc.c:117:17: sparse: sparse: context imbalance in 'llc_seq_stop' - unexpected unlock
> >    net/llc/llc_proc.c: note: in included file:
> >    include/net/sock.h:2098:16: sparse: sparse: cast to non-scalar
> > >> include/net/sock.h:2098:16: sparse: sparse: cast from non-scalar
> >
> > vim +2098 include/net/sock.h
> >
> > ^1da177e4c3f41 Linus Torvalds 2005-04-16  2094
> > e84a4927a404f3 Eric Dumazet   2025-06-20  2095  static inline kuid_t sk_uid(const struct sock *sk)
> > e84a4927a404f3 Eric Dumazet   2025-06-20  2096  {
> > e84a4927a404f3 Eric Dumazet   2025-06-20  2097          /* Paired with WRITE_ONCE() in sockfs_setattr() */
> > e84a4927a404f3 Eric Dumazet   2025-06-20 @2098          return READ_ONCE(sk->sk_uid);
> > e84a4927a404f3 Eric Dumazet   2025-06-20  2099  }
> > e84a4927a404f3 Eric Dumazet   2025-06-20  2100
> >
> > :::::: The code at line 2098 was first introduced by commit
> > :::::: e84a4927a404f369c842c19de93b216627fcc690 net: annotate races around sk->sk_uid
> >
> > :::::: TO: Eric Dumazet <edumazet@google.com>
> > :::::: CC: Jakub Kicinski <kuba@kernel.org>
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
> I gave a solution a while back, no answer, meaning that alpha is dead.
> 
> I would suggest kernel test robot stop bothering.

Got it, i will update the bot to avoid sending extra report for this.

> 
> diff --git a/arch/alpha/include/asm/rwonce.h b/arch/alpha/include/asm/rwonce.h
> index 35542bcf92b3a883df353784bcb2d243475ccd91..b6801cd2ace962e11624737ed334a5aeb30478b7
> 100644
> --- a/arch/alpha/include/asm/rwonce.h
> +++ b/arch/alpha/include/asm/rwonce.h
> @@ -22,10 +22,10 @@
>   */
>  #define __READ_ONCE(x)                                                 \
>  ({                                                                     \
> -       __unqual_scalar_typeof(x) __x =                                 \
> -               (*(volatile typeof(__x) *)(&(x)));                      \
> +       __auto_type __x =                                               \
> +               (*(const volatile __unqual_scalar_typeof(x) *)&(x));    \
>         mb();                                                           \
> -       (typeof(x))__x;                                                 \
> +       __x;                                                            \
>  })
> 
>  #endif /* CONFIG_SMP */
> 
