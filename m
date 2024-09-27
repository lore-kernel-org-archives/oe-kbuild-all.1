Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A4CEC5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 14:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727445665; cv=fail; b=VRTc2xBornClkDEeZMZK0QiB9xYrBCP/E/OPd52DwV+hBGAJ5RUvdQ4wxhEXZFIHvLNpA2AqLsyrMykQIHOqMVoYory/vPFXSEYRdaPvvW+tgwxCFOKwbFEkrmlazwO33GJoJ/UJxTbWEghGl2eY2WVlJQYS4ASI6rpN6N9e6yU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727445665; c=relaxed/simple;
	bh=G+Qse2YU+CEjj7K6tbCUm3fu02VFgnGNICWuFWhIA3o=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=bNr61wgM9+L+R17sQTIBWTMFVKRWN0SkGQBGlkNGJcGuzKq34FlXcDEdbpO5wZmeq9ROhbEFFIQlFOXsURazlDP5f/DJ/qrxKPYKtPbub94Do3+Bvvo+beIKbVufdeOwU4KgG/jsY6gS5QjLWApmnpL7dkAnfzDvGiJmA49oGH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PRUvLpQH; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRUvLpQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727445663; x=1758981663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G+Qse2YU+CEjj7K6tbCUm3fu02VFgnGNICWuFWhIA3o=;
  b=PRUvLpQHyZwqBFl0EAlccvz8047ESyOGcCwCYyAo5Ke/47/hTs2dFC7F
   omS4K/qDsKRdC00oB+ea2CYwgZUjiK4w7FiNGnJ3uQsUyKPfehsZY03CN
   VGZhmNpVlciB3VrIMB27AjMPyVUyBcADflwQh8nhb35Rkdmwo7judJfCy
   qMfpwbZONX0jBV7wxoEAkx1Nw3+gJ/d7o54129f+c6YJMdY++p11BKuDq
   0dRazKFqUW2JauPEF30AdIQKcr3sIf/QhVZqiK0GDZy+O+n3wLKzbelPy
   vN3rMx0mX769wAVoR2q8wuZlnhWbZ5+KU2Z9NqFHOGe4cfzZAk7leHcjE
   A==;
X-CSE-ConnectionGUID: cfdSy4cUTAiYZTdJyYKZOA==
X-CSE-MsgGUID: biapg2FWRTueKxKwpf6WDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37154057"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="37154057"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:01:03 -0700
X-CSE-ConnectionGUID: 01TxBP2gTFe+8FmkEsnG7g==
X-CSE-MsgGUID: BDx1g96/SliWUKH5S/BY5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="95878489"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2024 07:01:03 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 07:01:02 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 07:01:02 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 07:01:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5CZvm95lsv9VvQyEW3MtYNNwc+Nk85XV73M0gpoUm5weBbubmG6Z2TDsek2IqVSIy3OxWZq6wVJfCV0SBKvviSImthc2g51drraOQ31ncnYnLlWsO8cMI2aR9pfScWv0+Gq54809eZf098TmpbvhPBFrLelROSxC5qCfcvDeCxUcIbYu+M1Bqi08BR6ejq8tIEw4GzMcdkttRltKwkPPwWxAudoNCxyMjG6Ni5rN21T5ANb7EfKxgm8xttkV2JJGO6rWCjyRfTF0iVAyD8qvYi61I6kRLgeZUhiYmjX+Krz6tF8l8av83gV1alVwVHRiHmEbwV8oykbIqL2wwPaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TFSXHlKGFpx0zy5A3yhZdhJnWqJkDb8Mlqu6/B4/ETQ=;
 b=xx32h8oSayG2Byu37zBNoBtK5uKnML8k+4zsp1geopk91XpI694NDBs7UoiG6VHX+QbadTUh38jr6pBTM1ZvRoJcyfD1Vk8N1HVCnb5zjY29w04cvDqgQrsD8oAwIOnIwMmQWJRuc8/vBhAwTyMhEtVwX1QKGHenbHJEm3z3x4XkYDp00Cm2NsFPrtWPJ/wY0I8a4XGBZ8NkWV232Iv8QBOfZhLxJbWXvOIVop736dEs5wgl56o3BRNtuk0zRTCiz3JIm4NlcpfR4Ey1wT/iCEO/E4GpXU+fZgAbZPyFQzePUuBE2W75S7X7sIUzsd6A9lrdnDidNAcJwrsvbNZ5MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB7075.namprd11.prod.outlook.com (2603:10b6:510:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.32; Fri, 27 Sep
 2024 14:00:57 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 14:00:56 +0000
Date: Fri, 27 Sep 2024 22:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-4.19.y-cip-rt 144/30000] mm/swap.c:55:30: warning:
 'rotate_lock' defined but not used
Message-ID: <Zva6kPhaLHDR7HkV@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff81c35-0ce1-46a8-7756-08dcdefcce45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E0i+QUJLWg5HmxvrGXJYTR5rr3QeXo0u3HNzWWq1vZ3WwCA9c7L4I6/Vr6dt?=
 =?us-ascii?Q?NRDDip5iqcrANVKxgoJCQBDuGKn7Ke/Xc68Q60xrpwvDKKlazux80PKr4HWx?=
 =?us-ascii?Q?+SQYZ1wmzjpFNJ61sJxfQ4VhD+65V6yef75BlAnIv2rnwnmQBWjviYWMXvBt?=
 =?us-ascii?Q?ItGbq9qwcTreDTPNuv5mIZHYtwncOEbrA6fMc3wfLyRr4+A4jlh8RL16M7Sz?=
 =?us-ascii?Q?KsJox1jKxOSHRHPUMHtX6pB8nhXnGLM4kpYvS6eesKQgOf2AfDzt2xIqQU1c?=
 =?us-ascii?Q?1CfUW355Pti5yuGSglfa+WY2bBALryMya2xpUcomcZY9V/8m4wrz5t1F6Zc+?=
 =?us-ascii?Q?p1zv4Rpbg88UrdaI1Ycp1ALWz4JC1z4b87asQVFITd0d1RvGo8AW4gk9z1yO?=
 =?us-ascii?Q?8k9b9pF81svWtcWXYaQ5B7EokLk6q0VkdBFtzNHOKa0jZkOTHdpfteVR8woI?=
 =?us-ascii?Q?loZ8eDn+GmnYhGYDviX5GzCyi/Kfs8ZXgubPHLFYccjErVeW0IQgwNtYVtsQ?=
 =?us-ascii?Q?VuwEZYZkYE5OrxIOxmD0C9mfJBVpUjGZFRwuqYrawRvKN770b5YIBBL3Zznx?=
 =?us-ascii?Q?yW3SELwjgWSG8J+lhvokpzsfaha3WaJEAK3QNCu81CoOjXI8QMzk3fu105zY?=
 =?us-ascii?Q?v7GocmDWrBbbys7VE0OJVgfoj0MX6ZXs9exKuSRyEXoIHAj/Uqb0tVtYXIMu?=
 =?us-ascii?Q?WrEiJXieEpE8XuymbtxAnnWAXUMNbn1476/0M7F6aRrYHw0Z/RmGJE0hbFDt?=
 =?us-ascii?Q?nN7Rmrd1AR6sGcF1O192MDxu7kcf2l2hHBE7/9E7ybfzrXxaqoNXedxxDEzu?=
 =?us-ascii?Q?2jqjalpgejzrPdRQ67Ku3NFqxizmv/t8T37SYL1pteG+SL+fyk61PrF1CeP0?=
 =?us-ascii?Q?X8t8PUiJ63wuIa5Fj3DMS8C2l937Cim5aPW1GcI1mVTgjUXRQUd2rqQYin9m?=
 =?us-ascii?Q?A2lx83VJF/MDsVNsXaOxUvv1arLUMELtpzwg2Fbm50dxcwtY0FzfJIMarbye?=
 =?us-ascii?Q?0ZXOjCDZwiyKgFxCyR0FdHzcDU8bMusOma38/oegYxAxcATaYAyjcd+xq1Ts?=
 =?us-ascii?Q?QsKoNrYVzTM9nf+IZ/kUxx4jRZO7F2tuPIc2/6794pIkfzDdCPU2Rk7o6P0m?=
 =?us-ascii?Q?TGB2IeTSeYA5EKfmfh2/9V1hyf5A0q8uk73CtkOf3rZ459ntO48X7ndUDsY2?=
 =?us-ascii?Q?LZJ3SB8O6kbAkirGEdtoywWJNSFkZIpIHMz9Rqe9rTPV6ldtga4XgJJSGRd2?=
 =?us-ascii?Q?TmL/5rCTcMIC5O312+mvNrwL4Pg87ogxLh8fbNxwFmkQtwHFRoWx04jRFr93?=
 =?us-ascii?Q?pw8GGKFBxVFKnGGwNDn058Aw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oCSnRh2dkKw3zMmn30WuAfPrB79VXbla2TDhxEbXGV7bZqOQj59XImnWx+7h?=
 =?us-ascii?Q?8u2zibe78DHRrk92GPFv0na5w6NP2V7R21ap1VFwAFr8hqj9B5HZ4tMSz2J5?=
 =?us-ascii?Q?RyV/PeS4TdrA3axloF8ckx/hkjfd/Yp3ZZ4wL+pvS5MINeFZ7a+29YfCh6VQ?=
 =?us-ascii?Q?znGuSn6RwUcmwMeQPFLygaWXOBf0M69cRMEGEoI3riL8CbpxwoUBykQpRtr1?=
 =?us-ascii?Q?/KqJArnkTDkIMTNDQu0adHSOltaS2wlZuNYtIMX1+yq6HpyuXIwUv1Fr7S4U?=
 =?us-ascii?Q?koR/D0FQdMoffQ+FDpVmzS9BVhXFNBYEuyxsajvViUXm/opQOSCxorv6VYfL?=
 =?us-ascii?Q?5YCQqDljTruz7XSHzOCjVeA51FaIcRvNmql0VLQUO75bCPdoT62R30tehR4+?=
 =?us-ascii?Q?/WGKALlHy5nY8Fdvmby9PpS57EVI8QumlPwQ42Wz6VXdW4C6IOvoQz9qTBBz?=
 =?us-ascii?Q?0oksdT0XcVpHF5H5RDTcy/49drH0t3agcfhAfTPiBi1YOCErjX6jog4LP1u5?=
 =?us-ascii?Q?dckb0+q9/SXFxszdp76oLRIh4Ot7dZi3jToZzgeeyOAuLdgFQp8B4kI5tTdC?=
 =?us-ascii?Q?MPeaLPnnonGCA1xeR+7ys7UWHCvpNsB84kUX1LqSvDo697RirrHdMlHZ7xVE?=
 =?us-ascii?Q?wILR6q6N0UVfRebz5Jq6piwFylxoQYcVthbyEMyVNJRzSGW495XOMCMbqMrz?=
 =?us-ascii?Q?ZSGOpJlOvE3tiHsmJqTkgzb0fY8ctmJWBK+5enXW1Y8PqAOAaNcnAoUgMCiL?=
 =?us-ascii?Q?nbzdCRkcjLFoXi1F5tmUFiWo19tDEqH8uHNNPS/HkOTGamueqH1T9FBv+97X?=
 =?us-ascii?Q?3TJ1rZaEpM8qNSX2HC6k3lZ1z8UlmAa8qoES4YBVVKSWZGTpKsYAJdAwr4j/?=
 =?us-ascii?Q?rULtDegg2d0DGBFeEzErrS8qa1ktWr4z4EQP5NUJiT3+l49IsIqDSGKNSWvk?=
 =?us-ascii?Q?3ueyxAoE0rR+WnFhBODgGSy512he+46AHLQ4+6aM8pW/63J5TQEMZBg5e8IB?=
 =?us-ascii?Q?jLSB4oKECPg2R6KAnv7pzzM8fFjrnMVSmXYc85I75dCvi/jX9Sote2vUsRqR?=
 =?us-ascii?Q?NPbD08alb5CeEVKqdXMcCZZ2QbsPO58YQhAViHaivwyhOMc5xoFLYpa3vHCx?=
 =?us-ascii?Q?17R3vHJVSWOtEOcv2b9KrqOd7xsVSKX3TZCn2tk2lvOlIW5dFtgV1iaW3eMV?=
 =?us-ascii?Q?4ddO75cfeyNqVnOm2Ht0/nsHgvPbGnusNaSgqfIYBQ0eSkpXxvdKxhXcCW7F?=
 =?us-ascii?Q?qiH/memD+eYl2dQ7VbPnbB1jKR4agn6W4n7VzppgCkJ10gLv+q7SHTG7futV?=
 =?us-ascii?Q?wrLFz3CMARITLphtaY34Cc10Tu+FDXo5Gj1WcurbVpgFFV9sS5PV5S9TVevx?=
 =?us-ascii?Q?hyVXn8qT2YfdHDZzHT05fsultDI3ves7cyBcCpDCaq+AVgr6+5dTU806rsxa?=
 =?us-ascii?Q?/qCin4Qz8ipE1V/10IYYIqq01/23ly+/qaF8Q9hGMJ/URDVFy7EKjJrhW+GZ?=
 =?us-ascii?Q?QVdG3vnyQCDhZVqHvaG4NMhI37VIuLkC0Unc4cMW7P/VfpavCHf3Sq0xBJCS?=
 =?us-ascii?Q?1H69ivXZijoEj7KIohAOg9tuTwABtBYF4hwnXzHK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff81c35-0ce1-46a8-7756-08dcdefcce45
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 14:00:56.0866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vumf9IFSOSv4nRa8VxmN6eWbZmann2ju2i0ptjgYbXQn07sAADXrZUPx7qBo+GMIjYhUVLvBv3z+ZDGrHP6Maw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7075
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt
head:   f0b0dc3daffc9639872f52dc74ce62bd887d3088
commit: 7fc2755b27b504eec4c86d9dec7285466cdbe214 [144/30000] mm/swap: Convert to percpu locked
:::::: branch date: 2 days ago
:::::: commit date: 6 years ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240926/202409261717.deAk8RzY-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261717.deAk8RzY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409261717.deAk8RzY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/swap.h:15,
                    from mm/swap.c:19:
>> mm/swap.c:55:30: warning: 'rotate_lock' defined but not used [-Wunused-const-variable=]
      55 | static DEFINE_LOCAL_IRQ_LOCK(rotate_lock);
         |                              ^~~~~~~~~~~
   include/linux/locallock.h:243:71: note: in definition of macro 'DEFINE_LOCAL_IRQ_LOCK'
     243 | #define DEFINE_LOCAL_IRQ_LOCK(lvar)             __typeof__(const int) lvar
         |                                                                       ^~~~


vim +/rotate_lock +55 mm/swap.c

^1da177e4c3f41 Linus Torvalds   2005-04-16 @19  #include <linux/swap.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  20  #include <linux/mman.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  21  #include <linux/pagemap.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  22  #include <linux/pagevec.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  23  #include <linux/init.h>
b95f1b31b75588 Paul Gortmaker   2011-10-16  24  #include <linux/export.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  25  #include <linux/mm_inline.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  26  #include <linux/percpu_counter.h>
3565fce3a6597e Dan Williams     2016-01-15  27  #include <linux/memremap.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  28  #include <linux/percpu.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  29  #include <linux/cpu.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  30  #include <linux/notifier.h>
e0bf68ddec4f4f Peter Zijlstra   2007-10-16  31  #include <linux/backing-dev.h>
e7638488434415 Dan Williams     2018-05-16  32  #include <linux/memremap.h>
66e1707bc34609 Balbir Singh     2008-02-07  33  #include <linux/memcontrol.h>
5a0e3ad6af8660 Tejun Heo        2010-03-24  34  #include <linux/gfp.h>
a27bb332c04cec Kent Overstreet  2013-05-07  35  #include <linux/uio.h>
7fc2755b27b504 Ingo Molnar      2009-07-03  36  #include <linux/locallock.h>
822fc61367f062 Naoya Horiguchi  2015-04-15  37  #include <linux/hugetlb.h>
33c3fc71c8cfa3 Vladimir Davydov 2015-09-09  38  #include <linux/page_idle.h>
^1da177e4c3f41 Linus Torvalds   2005-04-16  39  
64d6519dda3905 Lee Schermerhorn 2008-10-18  40  #include "internal.h"
64d6519dda3905 Lee Schermerhorn 2008-10-18  41  
c6286c983900c7 Mel Gorman       2013-07-03  42  #define CREATE_TRACE_POINTS
c6286c983900c7 Mel Gorman       2013-07-03  43  #include <trace/events/pagemap.h>
c6286c983900c7 Mel Gorman       2013-07-03  44  
^1da177e4c3f41 Linus Torvalds   2005-04-16  45  /* How many pages do we try to swap or page in/out together? */
^1da177e4c3f41 Linus Torvalds   2005-04-16  46  int page_cluster;
^1da177e4c3f41 Linus Torvalds   2005-04-16  47  
13f7f78981e49f Mel Gorman       2013-07-03  48  static DEFINE_PER_CPU(struct pagevec, lru_add_pvec);
f84f9504bddeec Vegard Nossum    2008-07-23  49  static DEFINE_PER_CPU(struct pagevec, lru_rotate_pvecs);
cc5993bd7b8cff Minchan Kim      2015-04-15  50  static DEFINE_PER_CPU(struct pagevec, lru_deactivate_file_pvecs);
f7ad2a6cb9f7c4 Shaohua Li       2017-05-03  51  static DEFINE_PER_CPU(struct pagevec, lru_lazyfree_pvecs);
a4a921aa5c7a1a Ming Li          2016-05-20  52  #ifdef CONFIG_SMP
a4a921aa5c7a1a Ming Li          2016-05-20  53  static DEFINE_PER_CPU(struct pagevec, activate_page_pvecs);
a4a921aa5c7a1a Ming Li          2016-05-20  54  #endif
7fc2755b27b504 Ingo Molnar      2009-07-03 @55  static DEFINE_LOCAL_IRQ_LOCK(rotate_lock);
7fc2755b27b504 Ingo Molnar      2009-07-03  56  DEFINE_LOCAL_IRQ_LOCK(swapvec_lock);
902aaed0d983df Hisashi Hifumi   2007-10-16  57  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

