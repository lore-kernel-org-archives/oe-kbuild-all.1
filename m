Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F9214AD20
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 03:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747624318; cv=fail; b=PLZBgq0JVBt4GeTBeZ8WkHsW2tR3HU2+0zR4rU8vkPs5Hoc3hE9ZAlSK6IZyDl4c4D6hb8JvPWVpxg5akpDy4pJ3CTRfZi0oGTNUxtLlFfwT1i7HJBOGZeRiynr8rDmEISWPBbn8eVUlJdxaMxPkAo6wwTJjxkA/BlgZVAj64io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747624318; c=relaxed/simple;
	bh=4qqXymaojTFWTGX05k6/cCI4bKJTH71O7xITMa4OBGw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qDlHRvwUg/hqxw0LjhMk7nxmUkfasSgw1Q8r3Nry1BvC+VMjCRx/d18SJ/T2Lcmm/IrgeVULst8ZCKKOEVxyZui9KGDcPh56Q+tysd/sZ1YHI7S0uZXlcNrDeQYWgFrBzFSOvQGnLxzcPT2gsQVjOPeZ6pgGe58lESAA/YSl8LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqlOIQLX; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqlOIQLX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747624317; x=1779160317;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=4qqXymaojTFWTGX05k6/cCI4bKJTH71O7xITMa4OBGw=;
  b=YqlOIQLXtoP7/ZXr58sIZzSO2qxQ79wOR32Mzd1A00sa8bDJfZmXC+vC
   /t/avrWxTrskOHPUOjuER0Gwjl0URfDDYCz5L1DmZmFE6Kq6tr1RXDw0i
   XjFgMQzPnynVJC7somAxuNpJvl0rVEk6Yj+bqNySgK64+jzZIKt23xbax
   wUxNeOWJ8UEw1chvG2emI95g34fL9Nw9gDhH4qxbvFpPYdhJ6mnJ6Mt4a
   GOQILkusJ8aExomhBT6H5L8l9CXUoliIlH9bFkMN6yIhC6hDU39FKOZpp
   v75q+lQVgXNc5ylvivcb6BYI9keC6U2bAS2j63Ox0qjQ+jMyiFKLE1rMy
   Q==;
X-CSE-ConnectionGUID: mzdUaf79TZ2OwkxCZA+ZZA==
X-CSE-MsgGUID: bzK7y/PQROCiFgqIwGfO8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49615082"
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="49615082"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 20:11:56 -0700
X-CSE-ConnectionGUID: xoRQEvdLTFaDSFc6ToouDg==
X-CSE-MsgGUID: Qe2DfQQoRkeFOkz2BqVQbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,299,1739865600"; 
   d="scan'208";a="140139614"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 20:11:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 18 May 2025 20:11:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 18 May 2025 20:11:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 18 May 2025 20:11:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPvEfNWA1sSfgbxRn0asXF+74TsjTM9f6XtXwXp/Pt+JqrfCQshrW0eLdNJ/KmSeWOKABYxWxIExNmCHNgbb8ZxsPsKlJK52lCaZMdqRkNL7/RipO6kl8LEl4ql264g2a5sggVH0Zg8RLlum1yMBQmwJuCDnMdHbGNEgWIISlIVaYWsOTY+22AdFZLTklSZpjFpyN9yhk0F6byO3a9PVILTHXSQuHDmE1stByCrqTUVBDs/DAJSBTWoJ7WJDsnB7eLFnoPBk/mGpwHF92kCjDlot37hvtN7TSyUUUgrCblpjqH6JOdj2Nd3u/zNz6F9AgX2j1U5wU5FYddSkvNdD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syllUF58reKxyRQISQtNcoBSAfLp8etOz3s6xPPzrB0=;
 b=rOUqgCzNO4AClSQvrieqjkEos274tb7jvTpIBqXZwcn4uG0AcztoPBfV9WFLtzQPTLO4VN2SOmHOfB/NA7yoXt5ejOhnYlMQVP0acHAF0/7sZi9WPyYBz/+xLK09f9NM8o/HhaNVV8+ivF5nRSgVbywqmZuajLRHJtGrwUGKubqG30Cm/8FmkKzyeqkA8HG14Yzve++Po8iB59L8nrJPq6E6rdhdTzlwbM8BK/7gQwiWr5v++3jtqQO8O3NsFDogJk9c67/VffySdT66rpyAGxx5Ji54R0NNjp3iAgA/EKDupp3o5+GpGcrXJ/xyuK2AeoPFYk17nHWwJpukuFN5Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by DM4PR11MB8092.namprd11.prod.outlook.com (2603:10b6:8:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 03:11:13 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 03:11:12 +0000
Date: Mon, 19 May 2025 11:11:03 +0800
From: Philip Li <philip.li@intel.com>
To: Alex Shi <seakeel@gmail.com>
CC: Yanteng Si <si.yanteng@linux.dev>, kernel test robot <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-doc@vger.kernel.org>, Alex Shi
	<alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>
Subject: Re: [lwn:docs-next 37/72] htmldocs: Warning:
 Documentation/translations/zh_CN/how-to.rst references a file that doesn't
 exist: Documentation/xxx/xxx.rst
Message-ID: <aCqhRwOxvUiCFtpN@rli9-mobl>
References: <202505160627.WtzIIpL6-lkp@intel.com>
 <dcb8c986-b6ec-4803-aa88-2ef2670a6b10@linux.dev>
 <CAJy-AmmsqK3x97yncNrnugCNrf5qNOTUwixFNiBifqigLrp2zQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJy-AmmsqK3x97yncNrnugCNrf5qNOTUwixFNiBifqigLrp2zQ@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|DM4PR11MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: 822f7962-2f3c-415d-bda1-08dd9682cee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RE95cGFvZkE1MEgrQWFoR09scmZ0d1dCc0ZubE9UM2Q4bVJERjlwYlpTUE1n?=
 =?utf-8?B?c3diZFBxLzJ5OUkvYUc5MVBwbi9KWlhPUk0yaDhOU0VYRXNNV09XaCtZbXp0?=
 =?utf-8?B?djdtZ2R6NE5ocWg1ZWVCZWkwMWM0bnpBcFpoTzdnR3B4aGFFTm5HV1RTZGU3?=
 =?utf-8?B?MUlLRnpYQmNtRHNjYzlQZGlMNHJqUU5wOWtNcHllR1JKZGJ2TVlMaU4rbStr?=
 =?utf-8?B?cnowbEdBNnRHWVBzWWxQd253eklwZzJ5UytiYTJOanpkaE4xZm9ZLytVbDVi?=
 =?utf-8?B?U3l4aGRjKzZyQWwwQ3hOWUNFQmJwbUwvTkwzaG54WWxhRFFYdVFLa1MzWkcr?=
 =?utf-8?B?WlZiRlFsM0JLWFg4Slhad0hkUG9qeW1SMTdZdHVrM1Y2eS84bkdBQThhdVZn?=
 =?utf-8?B?OE9rZWcxOTBzNjhtV3dpdDdpWVdhdzFRaHFZOHpIRHEwbHNscXZLS3VKYnRO?=
 =?utf-8?B?cnpnZkwrS3RpK3JRT21QMWc0ZXhOcmxxUDFMcDNXa0I4eGNERnJRcHlSWjMv?=
 =?utf-8?B?ejZtZ08zMm95NVlrN2t2VU5UeldmRDJ1YWhrdSswaXFaWkdoSHVmL2V3RW1a?=
 =?utf-8?B?S2lRVk5wUUxLY2tuMzFQS3cwSC9vQmlIU1EvYmxQOXo0cTkrcnZMT20zWFRF?=
 =?utf-8?B?a3NyMzR5T1dHOEo5L3duejdNUFUzdktLZEFjckl0WUppczgrSS9laU9xa1Qz?=
 =?utf-8?B?R2Z4Ky9lcGZBNWR3clVqRnBoRkFsblE5MUxJM216TEt3UStER204S1NuaVlT?=
 =?utf-8?B?emYwTFowVHhzU0hsWGFZdnNsdzNtbHEzblVrbFkxY0JHNmlhdDM3ZDBJMHVS?=
 =?utf-8?B?czJIQXZHRFU4bU9LbWZsaFFob29IS010c01sTHo1MWxVSmZIVSsraUxmR1Zy?=
 =?utf-8?B?SzVtcVcxNERxOGRDT3kxVzc1Wi92MFRGeXU2Z0ZRTVRwRXJhbm1sN2Z6S1ZV?=
 =?utf-8?B?TWRJbUkzMHQ2bFNJalJlemZSdkp2WHlwd3VKb0plbi9WcmJJVS9iSmtmeVgz?=
 =?utf-8?B?NnE2dVYwZGtLL21CZVBmemR2ak5BdzhBNUFmc3lSaVY5ZThJM2djYmZ5U08z?=
 =?utf-8?B?MExIM200d3N4MktrSlkxTFBFTitxd2Zld0hQWTNsQ25HYXN3V1VLeEVwNXNI?=
 =?utf-8?B?cGFDNk0ycERNaVdPdm1FcXllRk9yS1pPNHlUK0tFYVdBMUJ3R0pPYlpwZk5T?=
 =?utf-8?B?TVVJTjg3Zmg5V2U3MmJ5dlZ0U3RnMlFPRnU0WGFSWWVzaHpLaFRZdHRrQjk1?=
 =?utf-8?B?cTltOXF1dEpDNGc3aEN0NmNRRnhJTndONS9jb1JXUXd4UXFKTDVSYTl3QTla?=
 =?utf-8?B?Q3J2M0pOR2U1VzVtbjc1TTJKWXBwc2xLTjNGRVI1eWFsN0ZTNXEwTU5uMVBq?=
 =?utf-8?B?NmFNZmZoQ2RuUlNkOEQ0cE1VZjhoQUdkZGNuV0M0MDRDby8zQnBMSzNTc2lL?=
 =?utf-8?B?cS90K2dSL0NXVzJJckJyVlVVQ09ibmRwVU9JcHN0SEx6aE55MlF6TXRqRytI?=
 =?utf-8?B?L0s2THlTcjR6QjZzYXN1aUpjZUtlRjlUemtrM2ZZTGJlTTRBc2lGYVZkNitB?=
 =?utf-8?B?NlRXYUZrWG01Mk5NU295eW1NSDZReE5iY2s3QkJMTE9PWUFxTHdkRUd5Q25u?=
 =?utf-8?B?YWxaa0RudjJHOEFHcVFFS0syeGpWTFFYOUFtbGkxQnYxU0dTK1l5RlFhdTlX?=
 =?utf-8?B?cjlhaUxrVVVpWllpaE05bDlIZS9RVVhLVXBsck5XOHpHU0s3ZmVWU2lGS2p3?=
 =?utf-8?B?TE1ZWXFhQVhMV2F1Zm1CWlluYyt6Zmg4L044eFdBS2pDaXF3NkVrd204Ym1V?=
 =?utf-8?B?UlBzemw2ckE3dUllWGZsUjk4MkZuOUxMbG4rMlBPaGFYYUE5NzU4bHdMYytq?=
 =?utf-8?Q?zXXwMhRMm6F/d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmdtMjZLS1JHbW1lR0RGREVFRkVIQWNZZWlmMHpGQ1plYUplZ0NmRndtRHhs?=
 =?utf-8?B?UnRLRU5kV2xpMFM2czd2dlRoTUUvUnYzU3o5RzV6TGM0ZTlIZkxMVnVMNGZu?=
 =?utf-8?B?alRLc2VPZW9wQXczakhiQkVuNkdNWTFTL3I4aWpOT20zUG9keTBHMDIrSGxH?=
 =?utf-8?B?U1BnVGFKYmx3VlJGQUVTZ0tabUZ6QUhkbFhPVXBidHl1QlZlblFaeENXM0sr?=
 =?utf-8?B?MlgzTnJPdVNTbVI3OE1VcEpPcHhhbVB3eWxyUURuSnlhSDRVS3doNHFRb3dV?=
 =?utf-8?B?NHg5UUtiWFFiM2FZVlFvdG9uUEZNaUdWT0FUWFdSOHAxeXBLVnRjNDVqZkxk?=
 =?utf-8?B?cXpLZnJzTWFjUDFIMFpXVlFrUFFNVmFnUjVIaTlyVmpMQnJPMHl0NFc3V2FE?=
 =?utf-8?B?cTFQdlBha0p2WWdkNTN3d01SbHVnQ3Q1Q0ZnTmpHTnVGNEtHcjh3YU50WnZt?=
 =?utf-8?B?R1NLcncycmZKbDdNbHQ5Q2dOMHJaTkNscVplZnNTcmlpdHUwaEpCUDdJS1Fx?=
 =?utf-8?B?VFJsblU1NDlteHJtWW1sVHQ4aWdyVjBiZ0JMQURDYlZNYVhiYTN5WHExZkhn?=
 =?utf-8?B?Z0VFWWNNM0xxTUVJbW80RjFiOEVseEVXUFZKdzlOemxZQTRxS2crNy9ZMHVh?=
 =?utf-8?B?ZzJaaDNYSTZzdkVPRnEyUHlmRXlrT01BdVVMZEZVd3U2MWEzek0zOUVSRkZp?=
 =?utf-8?B?OWNyZnJxQmlhTnh2TjJKQWM2TkppR0FEZTY3anRpVnVFZ3lOM0ViYjJiVTQ2?=
 =?utf-8?B?U1pRb3FkM2VhVFpEeHJtaTJPM3dmZ0ozZUY5Mkx1V0pXS1FPTWJYdWdvNHdu?=
 =?utf-8?B?cmYvTjNFR3U2VUxUb0UzNHpsWWZ0bG9FVFJkbzZ2QU9Qc0VBVWdaaE4rQ21U?=
 =?utf-8?B?TDZia2RMaVhvUUlpRmxmS1Y0YmdsL0txd3E3U3ZUa2ptRlNhS0g3Q0d3bDln?=
 =?utf-8?B?YkwvNXRKdGNuclJPYTB2ZzFSU3JrZjZUUk1vRWpsWGtyK25QUHZKNnlaTldQ?=
 =?utf-8?B?cC9MOFdkTU5GaFp4V2lxNVVoeS93b3laWDJSL3NlcnpPaUxjTEg2akJwZTRG?=
 =?utf-8?B?STA0ZWJmYTFwaWtLb1FuVGR0QXlMcFBYNTNkSVRPbys2QnJYWXBMUFRxQ0Rj?=
 =?utf-8?B?MCtOR25MaHgyd0k1dVlFVkt2ZVlQazZxUm5sVG5RVHc4dHNTeUVMRU9obXNL?=
 =?utf-8?B?ZkV2b2tlWGVWcjNNclV0czN0T1ZQVWZ5aUV1UXU2aEFhT3dZWXN6VjdQUVcy?=
 =?utf-8?B?YTlXbDFwNFNmRUJVb2NadTRmbW5Hb2Mxa20zMVRlUGxJWkpaSHlCMXBCTWxR?=
 =?utf-8?B?S1RMSFR6dll4QnRWa2N0YVF5NGVJNHVpMkpSV0tCRHhybmlqZmwzZ003bUlh?=
 =?utf-8?B?Y3RIU0xNSUlwd0VkeXl5Sm9QTEtKRWx2bmFzMTVXdTNzWWNXVVR0blRZTkc5?=
 =?utf-8?B?amZLLzFxSnUvam1wdTJ2MjFWK2lzQytMRnl0YWhFVHZmRG5ZWXRvSzUrbzhC?=
 =?utf-8?B?MnVIYTc3UUNwdGdCZFpKT1NtaWFRYVp0bGxHSlZ1WHZyYnlyRGJnVVR4bExz?=
 =?utf-8?B?ZzFPWGswVm1xR0dRTzdKUTliUU5zc3BlMzBoVUpldVdybmR1R1FzdzJ3dSt5?=
 =?utf-8?B?Qm9kUGpJNEdDL052aWQ3R2JqdnFJUFltL1dUb1RKS0F0ZzV2bzJ5UU1pcWNU?=
 =?utf-8?B?ZGtkdGQxUjF3dmNtTGw1eThuaityL081S0svZzRCWEJQT1ZBYkJTTzU3KzBM?=
 =?utf-8?B?NnlaMFpzUzVaRnd4WlU5alFpWlB4cG80U243YXgraGhCelNmWnNLd3lUeEQr?=
 =?utf-8?B?bmR3UkZDZ1ZMTFZyVFJxZTRsdVYrYm92cUIybzExUVNZL1VGMEQ5NnFFeUdZ?=
 =?utf-8?B?T1Z6OElFb1NQZXNQd3RESWdZUkU4MFlqWkxJdlRDM0RCZzJzME4yemlBY1BV?=
 =?utf-8?B?TkErRWxtTlcySjNxVFczOVZQaStzMWdHaVRZYW9yMDVwbVFBajVqb0dRM0hZ?=
 =?utf-8?B?Ni9wMVFPZzRXRC9FK25mS2FXZXlucDQ3eVY5ZzNUYUJXS1dLZGNZVjFhcWRS?=
 =?utf-8?B?dGFOYnZuQnZVc3p0MWRxVXN3Q3pLQVBVclozNGt1SlFPZmdTUmJJcFVrdmsy?=
 =?utf-8?Q?2XkfmeAs4Lpw7CPoaPAn9W9gE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 822f7962-2f3c-415d-bda1-08dd9682cee8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 03:11:12.0628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJj7ZnuepV+3dpB/i7J980mTIVaIUJ/jmhc77LCj8RHrrmi/V1poi6pBbthoRgHVK/kz/1QHT5qlAtKWyb7wOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8092
X-OriginatorOrg: intel.com

On Mon, May 19, 2025 at 10:24:20AM +0800, Alex Shi wrote:
> Yanteng Si <si.yanteng@linux.dev> 于2025年5月16日周五 18:02写道：
> >
> > Hi robot,
> >
> > 在 5/16/25 7:04 AM, kernel test robot 写道:
> > > Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
> >
> > I didn't reproduce this warning locally. It seems to be a difference
> >
> > between different versions of Sphinx.
> >
> > Could you please provide your Sphinx version?
> 
> 
> I can't reproduce it too. My sphinx tools version is 7.2.6.
> And it looks like a incorrect warnning.

Sorry for late response, the Sphinx version the bot use is 2.4.4, and it also enables
kconfigs like CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS,
refer to [1] for detail. Hope this is useful.

[1] https://download.01.org/0day-ci/archive/20250516/202505160627.WtzIIpL6-lkp@intel.com/reproduce

> 
> Alex
> 
