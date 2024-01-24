Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FC9168A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jan 2024 06:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=134.134.136.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706079021; cv=fail; b=oljJq083/f8qsiRnPGnFP6BbHjrUx9KLB+CFHfhEHTwr6JXvpLiz2aVX8+kd02PNXHcOuITmVR7tVZ6httu7Nn8awBENXSstoVbi65Fze8eGPXYj/arPhELs9/yfu6D6mg+ljiyvFDqIQVPwgV7d+vU4AyURaaeSQa3I4eTf0bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706079021; c=relaxed/simple;
	bh=FrKCOXe1v7A4n6QBKCkcmbNI9mC7OZDuJgN9g3GPJWM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tb9YcV7RzyTfvmJuzBPWXwsv6WsHPqzBtuLElOt8wE80FYwRIXo+kbWfDcsLYP3MvFiKch3sWlAO/iQcPJTxwNG30gY3ftrJO6ZYOFkFHAmCpdVH1ivzwA+bGhhaOFwKarCKGfmGPL0PFvUnkcyktJjukc3ufZhO9Vkke2YmnPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jzlcSFBz; arc=fail smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jzlcSFBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706079018; x=1737615018;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FrKCOXe1v7A4n6QBKCkcmbNI9mC7OZDuJgN9g3GPJWM=;
  b=jzlcSFBzN1uQfigIbpLcbPnUpvNOjQorRtovOdNbWGpV4OUt9jg7aipc
   4iOsZwAvgVOKE8JpkNoCOHXzXKUw3KjKlNCs/EaEagXW1R0ySUq53Adfa
   hRHS53SKgHiN4nGK1qZiNmDKd2jhBM/nhhxDlq9TLeDqOOBbYjqsJHqyS
   YUnbTPG25c8VG8k6R7M48IPpULW0ObQXErmUd0+UEhzcpvY6JLcV5AKAQ
   17ueCEfT2VjOSWfKByxi/anUygPkgNlRJFKeEGt53n0BrSMHOHBGAz9Zm
   JcNF0FhwAt8ADHKE0eqKY678o9o2x450Ju+i1RRMFKsbXJi1uYPR0hBnf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405509832"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="405509832"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 22:50:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="34672444"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Jan 2024 22:50:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 22:50:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 22:50:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 22:50:16 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Jan 2024 22:50:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mU96EzP6d3H/MSOVqAbiGX+IrqtE/MgefuqLojK4KRvjCbYs+oDasfynrHeA9L2FIsIYgPvnhHhF7savOWq+hftuUrFj2NIqQXH86aFtkTrjIiZEoc+YqE5ELEg31tOUya1Caue8x/ZrWz8MViKqgdrtDSlvB5Ma7wA6Th6LBeJ1C0LIBoIG/rGHQcS0tzv28SPzjk/UYhN66JADrV+ldIDhSdRyGtCWLVz+DOaNWxRNfz2BFwLXgyBQd10Yplb1w0G1ezarmxQcSgt5F0hSQ3mFNqwS180DIPTmAyj3hHUZzTk+BXcqgH1SuyF/Qer+UUDtu3VCD3fp58LKK9bMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrVS+LhVNcy+We7Kbw4nB6VxdN073BWZqiThzWKkAPU=;
 b=LqVUPqVacaJAymxbvbli/6SwnW8/XxzzzkB8C3VvR0LGQ1N4lCOWO2EpoN1Kg1uP0X8M/SDE8B3V6RpfX4OGoI8oK8O8uzuIZrJw6YM+y/Z7T4/KVo6icixTxfHuHgLkhZtmYTh6Q215N8+cDN78+nJWXMjS3Znk7CwyMhn6PmI6Vxv+ZAczS+nmvqyba33IkV253V6Lm9uzrI+Rgo5VdneytU11iyAubOs+J96fExKUMkmG8G0omthoNs8m3HMJHK7Se0ihr6IdnmVEO/nmlQG01N1tlQoLwkMDIpzMFZ7krCtfNopDXyD2ih9ABjB69WJRYS8dTGTeRxuFA1MuIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CO1PR11MB4963.namprd11.prod.outlook.com (2603:10b6:303:91::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 06:50:14 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 06:50:14 +0000
Date: Wed, 24 Jan 2024 14:43:27 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Zhu Yanjun <yanjun.zhu@linux.dev>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Jakub Kicinski
	<kuba@kernel.org>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [linux-next:master 13015/13783]
 drivers/net/virtio_net.c:4340:35: error: '%u' directive writing between 1
 and 10 bytes into a region of size 9
Message-ID: <ZbCxj+dMJJ4ik6d6@yujie-X299>
References: <202401190425.IGYMqCJW-lkp@intel.com>
 <7f334083-afab-4393-97d5-7d5fdfab2991@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f334083-afab-4393-97d5-7d5fdfab2991@linux.dev>
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|CO1PR11MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 97ea8181-8a19-4a68-fdfe-08dc1ca8b75e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7UEokOV+pWASzPGG2q5i2fgFkonldhV+TnLraLwTmtjyX11TXebRVjs2UCfktvwSr/uOxoMN1FL6Qycvh3/rTqrtKYpRg65mfIMb7fAZHsuj3bD/hNnDcZ3UbcJsFliiZqIU496EEPvUbtsOJ4zDhEoXl/ifYE5C0c5GJx4pc9cgBAUBl1hYcxpVnJrggxVdmqWVS16I9FCvLN0IfY9y5wuk6DCjxODrunvnJ/Gn9MUe/6+DgAPeUq2jvO4EUja8n/ro9V8rX9hQVqv8queA3KKS2MuvYbvdy2jLQA5tHA6prqsRah8u0Fb6+4Qa69iJg72dgG/T7IK1wQSU5LTYhv1i9vxYA4wm5trMpnrbudEHyx8HC0rJgfksqHm8KdeA5Cw9lyp8g9FPjIEUgUY7Adi3kbpWjULE/SUM+UF5bKjfp/tbNRwXOs3gewVvuqTc7nK3nV1SHLRcxjnuYaR2GQrZMWv/U8OFchtIbocIhXubqHMA92J6cyQAt19titUayi8+2aYhb4joyb8pC1woR0mnDDVJCIlAj3Vd73S1ClaYq1MI15RrCFnSykbw5g6HlPZ7jcZn8iGHA6/TLMqHtdE2Sv6pC+3R266+BLiUA76O/LvEXqg/uqZV46myzPTr2SHKIl2Y4AjOQCpGO1FTafKLjnTvlCdVrIEdR8Mw4Z/W+6EV8ijpDUTbAuGvUAvC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(39860400002)(346002)(136003)(396003)(230173577357003)(230273577357003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(8936002)(4326008)(8676002)(2906002)(44832011)(5660300002)(6486002)(966005)(316002)(86362001)(66556008)(66476007)(54906003)(66946007)(6916009)(38100700002)(9686003)(82960400001)(478600001)(6506007)(6666004)(83380400001)(6512007)(41300700001)(33716001)(26005)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDhldHNPZVpTNE0xWFpTdUhBMXY4OWhhcGd5QXd4Q2dCYVZvbjltWkt3cXhx?=
 =?utf-8?B?ZmZtU0VDaGt6aFZ1alE0Y0poS1oxaDU4TTk4WThnQnlyVDB6YUF1RFkwZWxy?=
 =?utf-8?B?K0pLYkg4b1Z5eUI5bStrNVR3alphbERMdW04UkMxZHZHSzVGbGd5dSt1cFVt?=
 =?utf-8?B?LzYrMkdoOG9uSlp5SDhQUWxHaCt4V2s4YmwrQ05MWVNFUG9HNTZFVUxObDB4?=
 =?utf-8?B?bURxSFdRVjBmZ3ExamJ0QjdMVDBUN00xRlVmRXhCUkd3V29yZVB3TDhkUW12?=
 =?utf-8?B?YUZmNGJ6Ty8xRXljUkovcGkySnZPSVJvTVZocHZlclpFMGVKUnZ5YzVIZkNl?=
 =?utf-8?B?ZmwwYlhIMm9sakFMb2krUnd3R1dUR3RLWUNPMUNwOFIzemVpVktpbitxbVJT?=
 =?utf-8?B?ZmdvRjhTSW85Q3lvQW1tY1ladlZ3WFdnazZZZ1kxbzRnckVXZDdHbkkrdkdR?=
 =?utf-8?B?Z3pJa0ZxR3VyWXJkTHpiU05PSWNDT3JyTUpQcnU4Wm5kdTkxMlMrQUF6dDdC?=
 =?utf-8?B?dXBWdW1BRXJpK0lTZ0lzbFp2WnIyb28vVDBNbC9zYVFFeTRmbFRxa2xIc05S?=
 =?utf-8?B?aXp5bUl4cFpYWlhqcm1PU1djVENFMWRFaFhoWDYxVCtZcUo0azZQZGpORzQw?=
 =?utf-8?B?R2txamZXT210OCtlSTlhb2w3clEyYytqRGhxSFoyNHFyOUxLamRRNDZjRDJ2?=
 =?utf-8?B?c0IzWmFGQnZNa09mY0oyK3lLdzVEM2p5c1MyTGZsSG81N3VubmRNTTFRZmE0?=
 =?utf-8?B?cHp1d21rUU4yYWtJazA0VGhzWm1MeksrMUw0M0xlUk9YQWx6ZEN4bmlZVmox?=
 =?utf-8?B?WHo1SW5KdnMvaWUzMUVLRU0wNFNmNEhhY0EyZnVCS0dhSEd0eVBVSEd2ZWJW?=
 =?utf-8?B?Z1ZRWnpkSWpIMW0yeldISGZUY1JNNExHdjFuVkppUHhONDN5elBFTGlGT2dN?=
 =?utf-8?B?azdXNjBOb3lmV3lWSlU5UmNTVE1McTF5aHFhT1V3cEE5NVdPUkhxQ1BDWlpO?=
 =?utf-8?B?bit2aW1zc1d4Z3JlR2x4Q1hOVmQ4Zi82Ujg3azNDZ0NUWk1YNnJSSVRBeXRx?=
 =?utf-8?B?eDlTT0svRnRlejRBRUlueVAvd1RhUnQ0NExMcVpEbVIzaEdKZHpUZ1RoZDRQ?=
 =?utf-8?B?REp2WDdvY3RURmc2dmZ0SFRtZGJ0dFJjNU1qLys0SmRPWGJCcWxhREMyVmoz?=
 =?utf-8?B?eWJzd3RrRUZOQk1ncCsxV2x4QlpBQ29raXN2YzNrbmhudktlbHJTMWNjWTFm?=
 =?utf-8?B?QUYzOHZMN1Z4dXBjQVFmTE9vVk15T05xNkV6bWZnbnBmWVFNampzOE52ZWNx?=
 =?utf-8?B?ZU54OHRlWm5KbzdUN0x2YkV1ODFKeEVkOTJPQzVuRkVPTkZHZm04ODhpNW0w?=
 =?utf-8?B?OFhINmlIamthcUt6SW9lZDVjTHpBNDRQd3dFdmp0RVdTOGcrdmhjRFpQSVpt?=
 =?utf-8?B?UzJtaUcxYjZwS1VJNW01bmhzdUFHc3lURURza3VrcVllaXZNMVhIZElwazlF?=
 =?utf-8?B?RkpYTk84SmxrdnRmdXArWXJveDNmTU9CUTgzeHBlQjd4MkpwUUVVQlEyOGNW?=
 =?utf-8?B?UGxyUDV0aUw0Y1FtR0dWUlNWTU9jTnlWWE1QVXBmNkRoQ3JXWWVVWjNPcStH?=
 =?utf-8?B?dTR0dWtnWXNOY3FKSHZzRVdHQ0t2STZ0aGtwL3VucTRXTlZYRENpL1VUNmxL?=
 =?utf-8?B?bkxWblVGaU1wVlpQTFQrTEJGTEVjbnIzUXhuK2JOcC9Rd1NuUkxOUkVvbTk5?=
 =?utf-8?B?dGYva1BkZnVreFdkQWVGY2ZjOHNmVkZHNERHSFZxTFBGbW9hTTNVN2I0UElK?=
 =?utf-8?B?cXFxYnFXRVA3aEZyc0FLYUg0QW5DdVJhNGRweEs2OStYUzFSME4rZGZnb0gw?=
 =?utf-8?B?K0xLbjEyTFFUR0xOMlllKzBtNTFWL01DK25NRUgxT0FXZVJYSmtQbElkTXR4?=
 =?utf-8?B?aVl2UUkxNVVNMnJ1dE5ZdUJyS0FsRzVPVW1obXdjdk4rTk40WFQ5R1ppKzM5?=
 =?utf-8?B?L0FHS1doUjZYRWdFcEhmNDUzZFVUdURPSHRzRG93eEJwRDQwaGVaaHl5anpZ?=
 =?utf-8?B?Yjc0cDJJend1VDV5VUdXa1NnVDVqUE51emlLMld5Q2QrQUROeXNkOGM2aTRT?=
 =?utf-8?Q?uyMDt7Ych1yRDDCu7JUA2hXnI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ea8181-8a19-4a68-fdfe-08dc1ca8b75e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 06:50:14.0121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qKf4FGoEfRZdfIE4VXcvMq4iooe2qjwWSo2lje6x1s/iqFV/HVEQz0h20OjGkEcD8alqnSRdPQeGB13NgKtbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4963
X-OriginatorOrg: intel.com

Hi Yanjun,

On Fri, Jan 19, 2024 at 03:44:35PM +0800, Zhu Yanjun wrote:
> 
> 在 2024/1/19 4:36, kernel test robot 写道:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   2863b714f3ad0a9686f2de1b779228ad8c7a8052
> > commit: e3fe8d28c67bf6c291e920c6d04fa22afa14e6e4 [13015/13783] virtio_net: Fix "‘%d’ directive writing between 1 and 11 bytes into a region of size 10" warnings
> > config: x86_64-sof-customedconfig-avs-defconfig (https://download.01.org/0day-ci/archive/20240119/202401190425.IGYMqCJW-lkp@intel.com/config)
> > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> 
> I can reproduce this problem in my local host.
> 
> It seems that this problem is related with gcc-7. In the same test
> environment, with gcc-7, this problem will occur. With gcc later than
> version 9, this problem will not occur.
> 
> And with u16, the range of %u should be [0, 65535]. Not the following:
> "
>    drivers/net/virtio_net.c:4141:27: note: directive argument in the range
> [0, 2147483647]
>       sprintf(vi->sq[i].name, "output.%u", i); "
> 
> And the size of name is 16. That is, the name string can contain 15 bytes
> characters.
> When the variable i is set to the maximum 65535, the string should be
> "output.65535". The size of the string is 12 + 1 = 13 bytes.
> The size of the name is greater than the maximum string "output.65535".
> 
> In short, from the above, this problem results from gcc-7. It is a problem
> with gcc-7. Based on my tests with gcc-9, gcc-13, this problem is fixed in
> later gcc versions.
> And the warning is a false warning to this commit.

Thanks for the detailed analysis. We will configure the bot to ignore
this specific "format-overflow" error under gcc-7 to avoid more false
reports.

Best Regards,
Yujie

> 
> Best Regards
> Zhu Yanjun
> 
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190425.IGYMqCJW-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202401190425.IGYMqCJW-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >     drivers/net/virtio_net.c: In function 'init_vqs':
> >     drivers/net/virtio_net.c:4339:36: error: 'sprintf' may write a terminating nul past the end of the destination [-Werror=format-overflow=]
> >        sprintf(vi->rq[i].name, "input.%u", i);
> >                                         ^
> >     drivers/net/virtio_net.c:4339:3: note: 'sprintf' output between 8 and 17 bytes into a destination of size 16
> >        sprintf(vi->rq[i].name, "input.%u", i);
> >        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > drivers/net/virtio_net.c:4340:35: error: '%u' directive writing between 1 and 10 bytes into a region of size 9 [-Werror=format-overflow=]
> >        sprintf(vi->sq[i].name, "output.%u", i);
> >                                        ^~
> >     drivers/net/virtio_net.c:4340:27: note: directive argument in the range [0, 2147483647]
> >        sprintf(vi->sq[i].name, "output.%u", i);
> >                                ^~~~~~~~~~~
> >     drivers/net/virtio_net.c:4340:3: note: 'sprintf' output between 9 and 18 bytes into a destination of size 16
> >        sprintf(vi->sq[i].name, "output.%u", i);
> >        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >     cc1: all warnings being treated as errors
> 
