Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED74D1DB52E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 14:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726236614; cv=fail; b=mwRtNyTW+xWHQ7XsxpXPY6bjRyoEMA9ARJMkNBMjqVuoK6LqPHh8kNSIhRt2gweVipPXq2hUrgADF08MfJFhJgdbLnRCAb+knMHdc9Dzz5v9ln3OGn+y6kHa+5F85ADHAk79pEg+aT8xUAzo57KJ1p33jYjutxYHMAxso2DO5pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726236614; c=relaxed/simple;
	bh=InOKErdTj/YWmaDPWJsvP0nAPb/rJvW+V0y+rwu8PGY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Tj0FC539nxbdmoSiEkWLXhgsOtX6EiQD44URFGIQZTJv4mGsC3O6nwiY99d3E51lO0/7xmbFCqWy0CkmdQM223sFxf1zrhUnu3M4IjBSJ+SSrhPc95v7Xu61K0AYDXG346nXzf3/Mv7Ga8NIpbTvyocA3yzl7RQG+XiJZlWiW/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N1CTQmrs; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N1CTQmrs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726236612; x=1757772612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=InOKErdTj/YWmaDPWJsvP0nAPb/rJvW+V0y+rwu8PGY=;
  b=N1CTQmrsAXLl0cFgl7Xp9urFVFSTdeIvq6iEJHs/8lwuFv0nhVISWf7X
   1+28OsU4X8WiY07E/FBHkAEbIAsXLfiAQ+vKyyFfQibTtdOX8AW39Q6gg
   KPAxgite1sPccjWCKaxcAapHbMrlm+HdkayAHSs+oTwKjsPiJPrgmAkWh
   sPCYoZYSevETL8apbqeOS79EpfmcHOOkczhyZd2U9mfSeKnVgeJRDh6sX
   gIFegGv84zjAJzL7La3Dk4YxDxG/k0ksjfk5SYxIaJPPisgbRXYY6ZSbu
   7CXx/t+GXaBRan1KDBdHprDKrYVdjPmHTL6nNAD9vLPpmmBzbALLAlYSw
   A==;
X-CSE-ConnectionGUID: dB7EtyHIQJ6DO5dZWHfnrw==
X-CSE-MsgGUID: sASTx+u6QhW47gvGEgOjQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="50551214"
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="50551214"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 07:10:11 -0700
X-CSE-ConnectionGUID: ntrBcTT2QLyAWD5XzglMoQ==
X-CSE-MsgGUID: yhpQkZa4QueWCuMNOlJQGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,226,1719903600"; 
   d="scan'208";a="67927764"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Sep 2024 07:10:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 07:10:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 07:10:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 07:10:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 07:09:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9Mr6qi9L0X5Og6zA7IFdgJ+9Se15CpgFfySXkovdDMpf4vAvrIeW45BlXH7GX/mpqo9q/m5t+Z7UwMUIPckHCIbe+zgbZg5JJFnxEEXNSCUFw2Z1wXyx+lrhxlvF6zGJU1PGQxfzqu8WxG17oE2xqALzUwI9+8CCNH0UwEkPaDpP7BOP5K17z5vE2K4GqrFwtixH+YPPfAtCTyWQH6pF/9kEMF21QYNYefvvJ1+6y9K7Qx2xH2xID6hUWRW/zQAIzCS7+bBklAh8nOLNAW2VC0nsvvtsIuVba5lJgJIPqKF3NT4e7WucGeQsgR9njKbk8/dP5Q5a50U2RXbl8K6pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1p29R3pcZEtyxN6JIEoKdrzk77nsKAzoJx/LcpoCIcc=;
 b=PkKdc+2EMdmUaxDto7Dj3HHddwtxVRF8lr7FcxN4DI/W0nFKuPTO9y98hEcLmLJ4v/9abhYStvvXNx0L38sVEYud9fQNA3ie+N3v6Nci5jWvpzAyRtKOj73VMWP4vwcAM+v8vgVffUfuNdvcXDt9Io/BOa8o/tciS9RGuXmNXDZS3CQVvq+AQa46Z8aELseKoJwj0Oti8mdgmFIBbJgIAzooUCWje+FxCAClQTwv1/1xnt1m7DvCcBrTwdFC/sHv/r8bXZq6uZhfXIKfq4Iu3Gw1Yt3MpjTuxIdm/GrcDgT9wMs+albrgjR4g0abhL7QB3cpwlUaUS6SedTT6pNptQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.20; Fri, 13 Sep
 2024 14:09:56 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 14:09:56 +0000
Date: Fri, 13 Sep 2024 22:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-4.4.y-st 1480/2602] net/netfilter/xt_sctp.c:152:23:
 warning: comparison between signed and unsigned integer expressions
Message-ID: <ZuRHqzSkW+wok3XP@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SJ0PR11MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a330a35-0a0e-42ff-7608-08dcd3fdbe83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L9tAKbn3MX66DWcUwHTTjZHFrGJSKsXKNTqZzYmcHnQoSJzkzxbuo7FGgA1x?=
 =?us-ascii?Q?ol3z4eBdLSxWkN1CTWMVdBgNuMZ9ANKnm7ErmO/JX9l5APAlL9++9knb4Cfy?=
 =?us-ascii?Q?zNDrrHTgcC9zuiNImfFqXvn1qxHKRCqqzH7f0LdJC+v2r5mSZncRumoeTan5?=
 =?us-ascii?Q?zRDIgHviyfyLPt2t4Vdp21BohNgcEQ0ReHQ+XYp5fBVXS7jY+qJp7DXpNMaK?=
 =?us-ascii?Q?w/PQpM8RlHZ50K39J9ir3ToCBDcv5daoa1E8k8RGUyEUaqVCk8gV/1PUKjxB?=
 =?us-ascii?Q?0T8+TxB0C/9iPMgKenPq+Tm9HiUP/ZXc8stUkb0s0F2M/O22PgvR3HA+ZrLX?=
 =?us-ascii?Q?vuwg8EKCYh3dS3gqIEOTkPsm5fpk9a37796715UL/g3v4nBmXrplX/UlFHcJ?=
 =?us-ascii?Q?CxB/gqtkYa2pPYs3qXUGmmFLvT88gfejj29KymPUWGXNGsxlUaD85JXVHk1L?=
 =?us-ascii?Q?ebVG44cnxkPtsKSzZDJxr4ldUW+jkhj9PC15GxtcWFV5wh/xdsX11y5ywjzt?=
 =?us-ascii?Q?MRIUFXaKl3cir6tvpCLHwYa123WGvxGgybnmrAlcwVXuyw/hXJ5FA5fAPfMi?=
 =?us-ascii?Q?FmDAzjVC9Gaj7FeIWe3WYv9xLl4RC/vRvllGryAvOeQrIP63SpesZ3fJdGUc?=
 =?us-ascii?Q?FyMMV/BEwKVe7OiKo1FJlQumassmVwS103MFGvaNE0zQhYGmHjcpVMPSk3hU?=
 =?us-ascii?Q?UWGgJQkG8B/xGNVZAkV2pXvjc/KpxiyJz0EvcoaXjqFAsdvu9HxoHhbCwqq5?=
 =?us-ascii?Q?OkYY4CGRLyKIkU6l+ZMs/74HHN1A4Ksa+gytHj5k36a9jEIEwYECiFOujVCG?=
 =?us-ascii?Q?G+j1vO4EKns+KAq34A0N4GlNlwGBRCKtWWg6kyiTuf/q8ZWS1EMo/0uuY/t8?=
 =?us-ascii?Q?zu6Ghkci/UMIGkOzeLb/NDLqd1weXk96C/We7TauLf+8VerT/lQaBXSo3nxI?=
 =?us-ascii?Q?jTRps/3AAHzr7jPUM8NRXyoXvaZr9DSJjnhXTqS7ppy/BTN8fAHAO9tOLMnd?=
 =?us-ascii?Q?MrVpuddGbUbwhrI2Adqex1saSlI3BhhxmeEnoyQgDr2nK9D3XcobBnHkZfDJ?=
 =?us-ascii?Q?9VdGNNFM1HjBulBSxTHfvxuUnmwdOyCOFKiC6N3i/u7DDtWnbCt2/0JC9EeB?=
 =?us-ascii?Q?1caVXInOt9SqWN96WGg24s70rnsAE0uxDf90KipE+HibZ+m8yLfeHsmTTeDw?=
 =?us-ascii?Q?Q76Oej0wsA9pIxaYTUjTsoC0pmIuWg7rStu3+KJ6yIalPrZlj9TaFMIKZ/Oc?=
 =?us-ascii?Q?jiGTok1mBjdfQCqle99kn5yoAaAcKonVI7az2TTUagwIL5w/Pyu5N+z8Ojps?=
 =?us-ascii?Q?Q1BT3Dq59rA0MPJ5IymeCyrHbDsDM8/7QWfdGckVJBIOwGqOaKFMt/ra1WmZ?=
 =?us-ascii?Q?Ed9rsqg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n5ycDBkGA0cXuztcA5+vI4Hrnie/7NykSTGkgD2Q3mZb3uu0c7LIBK38zEkZ?=
 =?us-ascii?Q?Bqi8cVYNto//KTG/AAJqalPCOqXRn2l90nAY2xiHG08I6G+AIlB3Vl90mwad?=
 =?us-ascii?Q?3045KSJRu07+N68Y9utUjd4YqVaM8MbWeZWSvUJhnjhly+lR7XtKcb1+kf4Q?=
 =?us-ascii?Q?2gXATbp/zZ4PoHE3dvyXWdu2yiqvFZMHiIliRM0t9jVyWX1xn2NiMA/UDWz3?=
 =?us-ascii?Q?1tzEsGfqG+cRZIB5TB+Y8pimewpX3+oQRQ0Erg1R9iaXTIsQSkKP6bitgrmb?=
 =?us-ascii?Q?O7c3okvsFPN9/f6YdlQePuWoQTEz9kKoDLJ4giecpK9pZ16ULhZvkrOxh1CC?=
 =?us-ascii?Q?j72NHkSA+5H1UcpmiS7h2Scud/5CLgcAhDJ1mvXmAn7zMzbHUwnj0dsyLZaJ?=
 =?us-ascii?Q?YeoDQ55ZKDnsNVGxGVaRw4MnWKPfL7rC5Fs7GX3UZu7iOEHGzipKVLXAO2yw?=
 =?us-ascii?Q?PSHrsYfKmW6QRaqmDA8yx1HjiBBZ5MCgsYtzquFDYUuPj1M+eEFJi3oRBCzA?=
 =?us-ascii?Q?LArjldE2K7C5d2pRRIFtFPV15AlAccNDg5tHyBrhD/HkLcbPr4ZRpf29Hhi4?=
 =?us-ascii?Q?9zYAjXppXfGnB65wcCi+gR6VHUm7TjJzuGo7G7j7J0XAwArkOLWUSDyJ4bEt?=
 =?us-ascii?Q?fDsqs1ypJvgzVtXxh5tP//eThmuaPUerNJCEb2X91wF4HkLeM+56oi78KdCH?=
 =?us-ascii?Q?hvXf4xKNMrCN66USQDOvqlxVGhF7xB/LVkIw4pxNqYEJbWEvSfodr4ThONvT?=
 =?us-ascii?Q?eJtWFaCcmR5pmzJ89qkcY068tASrJ+kmG2+BhcJzjUaiUaVpL3QOlQS5U4Kk?=
 =?us-ascii?Q?A6dcSTwx1zA7WsbW4kSVncLyXSjwDCshbduTnuqLRa+OVPtDMaEWv5eWIYmg?=
 =?us-ascii?Q?EarGd/7+a6F4xmTHgr16IJDom6iGSSotAzDk46B5gIuBK0yGmnqcMppnkJNk?=
 =?us-ascii?Q?1Rg9n4a4RvotWFEiO97VM70inDE2byQPzcmF7guhtPF9F/F18gXWtilNgPmt?=
 =?us-ascii?Q?U2yN8Np4QHswvF580A84sLxOZQdpqeClUHSD29ClJdtXUFCKgfbtUUfnylxj?=
 =?us-ascii?Q?o2XQgyjrOwbw2f4thqEX5ml/HFYBwTNM6kmSuwykxlcAF+dK4Ut5Y4K9Z3nn?=
 =?us-ascii?Q?mjGa513puRkVg+Rja4a1F4/HVnCWjX+Z79JNqhW7FNxLG8r3cl7TfVFpF/Uo?=
 =?us-ascii?Q?CrZWxEDyod71wQTC55atiNPRgiYXnNL1aiLghNOnCD6GgDvTO8tZPpTeE1U2?=
 =?us-ascii?Q?i2vOuhCD5GVxx0wWmOwg4lhkxGjeoFlJQ+P1fy0apg3Kf3MtfkJBhTvLG0qr?=
 =?us-ascii?Q?YOLG/7WmxQeKFSpwhYD1sSBF8GgEWQliYW/Bmj1dELhUXiShTIT7MOB3j8tL?=
 =?us-ascii?Q?2LmvkpuExAYWXbX4h7xAs/NwvU0ec1DTl4omlGp6cA+rzudfDgQSQbikhP2Z?=
 =?us-ascii?Q?yJta9b6esjnOMscqD6V8o4Sekc5xk6nNsoeams77SR6rynqhOicOpwl1l9bh?=
 =?us-ascii?Q?2MkmTrxCiWTTP4xqBV6sje1UMad6ywYi5bnV+Pk8aHmD5pH5VhQ3rIlJ66rm?=
 =?us-ascii?Q?Th8XDvZfoY3XqD3SBPzaEo2Yu++7GMFMi8ap9w7F?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a330a35-0a0e-42ff-7608-08dcd3fdbe83
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 14:09:55.9635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DOaCXFcu1CofOhH3X5hPuc4iTotQgL4+pQFowiYM8MkU0YNJZ2pTIgSKeguJ0BNJ4JmbT3qK1MmQwmbw6NpsoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6789
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st
head:   c18783f114b390babddc2dde4162ae03709497b2
commit: ad14bd8357a265ce12ebe9698db3c66ab8110bc5 [1480/2602] netfilter: xt_sctp: validate the flag_info count
:::::: branch date: 5 days ago
:::::: commit date: 11 months ago
config: arm-randconfig-002-20240907 (https://download.01.org/0day-ci/archive/20240911/202409111129.y8YCkOji-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111129.y8YCkOji-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409111129.y8YCkOji-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/netdevice.h: In function 'netif_msg_init':
   include/linux/netdevice.h:3310:37: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (debug_value < 0 || debug_value >= (sizeof(u32) * 8))
                                        ^~
   In file included from include/net/rtnetlink.h:5:0,
                    from include/net/sch_generic.h:12,
                    from include/linux/filter.h:16,
                    from include/net/sock.h:62,
                    from include/net/inet_sock.h:27,
                    from include/net/ip.h:30,
                    from net/netfilter/xt_sctp.c:4:
   include/net/netlink.h: In function 'nlmsg_ok':
   include/net/netlink.h:337:18: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      nlh->nlmsg_len <= remaining);
                     ^~
   include/net/netlink.h: In function 'nlmsg_parse':
   include/net/netlink.h:372:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen))
                        ^
   include/net/netlink.h: In function 'nlmsg_validate':
   include/net/netlink.h:405:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlh->nlmsg_len < nlmsg_msg_size(hdrlen))
                        ^
   In file included from include/net/sch_generic.h:12:0,
                    from include/linux/filter.h:16,
                    from include/net/sock.h:62,
                    from include/net/inet_sock.h:27,
                    from include/net/ip.h:30,
                    from net/netfilter/xt_sctp.c:4:
   include/net/rtnetlink.h: In function 'rtnl_msg_family':
   include/net/rtnetlink.h:20:21: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (nlmsg_len(nlh) >= sizeof(struct rtgenmsg))
                        ^~
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/linux/list.h:4,
                    from include/linux/module.h:9,
                    from net/netfilter/xt_sctp.c:2:
   include/net/sch_generic.h: In function 'qdisc_cb_private_validate':
   include/net/sch_generic.h:267:33: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     BUILD_BUG_ON(sizeof(qcb->data) < sz);
                                    ^
   include/linux/compiler.h:493:19: note: in definition of macro '__compiletime_assert'
      bool __cond = !(condition);    \
                      ^~~~~~~~~
   include/linux/compiler.h:513:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/bug.h:50:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bug.h:74:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   include/net/sch_generic.h:267:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(sizeof(qcb->data) < sz);
     ^~~~~~~~~~~~
   In file included from include/net/sock.h:62:0,
                    from include/net/inet_sock.h:27,
                    from include/net/ip.h:30,
                    from net/netfilter/xt_sctp.c:4:
   include/linux/filter.h: In function 'bpf_needs_clear_a':
   include/linux/filter.h:517:16: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (first->k == SKF_AD_OFF + SKF_AD_ALU_XOR_X)
                   ^~
   In file included from include/net/inet_sock.h:27:0,
                    from include/net/ip.h:30,
                    from net/netfilter/xt_sctp.c:4:
   include/net/sock.h: In function 'skb_do_copy_data_nocache':
   include/net/sock.h:1859:54: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (csum_and_copy_from_iter(to, copy, &csum, from) != copy)
                                                         ^~
   include/net/sock.h:1863:46: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
      if (copy_from_iter_nocache(to, copy, from) != copy)
                                                 ^~
   include/net/sock.h:1865:44: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     } else if (copy_from_iter(to, copy, from) != copy)
                                               ^~
   In file included from include/linux/tcp.h:23:0,
                    from include/linux/ipv6.h:72,
                    from include/net/ipv6.h:16,
                    from include/net/inetpeer.h:15,
                    from include/net/route.h:28,
                    from include/net/ip.h:31,
                    from net/netfilter/xt_sctp.c:4:
   include/net/inet_connection_sock.h: In function 'inet_csk_reqsk_queue_is_full':
   include/net/inet_connection_sock.h:294:38: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     return inet_csk_reqsk_queue_len(sk) >= sk->sk_max_ack_backlog;
                                         ^~
   In file included from include/net/sctp/structs.h:88:0,
                    from include/net/sctp/sctp.h:76,
                    from net/netfilter/xt_sctp.c:6:
   include/net/sctp/ulpevent.h: In function 'sctp_ulpevent_type_enabled':
   include/net/sctp/ulpevent.h:147:13: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (offset >= sizeof(struct sctp_event_subscribe))
                ^~
   net/netfilter/xt_sctp.c: In function 'sctp_mt_check':
>> net/netfilter/xt_sctp.c:152:23: warning: comparison between signed and unsigned integer expressions [-Wsign-compare]
     if (info->flag_count > ARRAY_SIZE(info->flag_info))
                          ^


vim +152 net/netfilter/xt_sctp.c

2bf074825403e0 net/netfilter/xt_sctp.c       Shan Wei             2010-06-09   @6  #include <net/sctp/sctp.h>
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16    7  #include <linux/sctp.h>
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16    8  
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12    9  #include <linux/netfilter/x_tables.h>
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   10  #include <linux/netfilter/xt_sctp.h>
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   11  #include <linux/netfilter_ipv4/ip_tables.h>
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   12  #include <linux/netfilter_ipv6/ip6_tables.h>
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   13  
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   14  MODULE_LICENSE("GPL");
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   15  MODULE_AUTHOR("Kiran Kumar Immidi");
2ae15b64e6a160 net/netfilter/xt_sctp.c       Jan Engelhardt       2008-01-14   16  MODULE_DESCRIPTION("Xtables: SCTP protocol packet match");
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   17  MODULE_ALIAS("ipt_sctp");
73aaf9355b71d2 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-10-11   18  MODULE_ALIAS("ip6t_sctp");
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   19  
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   20  #define SCCHECK(cond, option, flag, invflag) (!((flag) & (option)) \
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   21  					      || (!!((invflag) & (option)) ^ (cond)))
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   22  
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   23  static bool
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   24  match_flags(const struct xt_sctp_flag_info *flag_info,
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   25  	    const int flag_count,
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   26  	    u_int8_t chunktype,
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   27  	    u_int8_t chunkflags)
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   28  {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   29  	int i;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   30  
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   31  	for (i = 0; i < flag_count; i++)
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   32  		if (flag_info[i].chunktype == chunktype)
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   33  			return (chunkflags & flag_info[i].flag_mask) == flag_info[i].flag;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   34  
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   35  	return true;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   36  }
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   37  
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   38  static inline bool
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   39  match_packet(const struct sk_buff *skb,
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12   40  	     unsigned int offset,
009e8c965fd72a net/netfilter/xt_sctp.c       Li Zefan             2007-10-18   41  	     const struct xt_sctp_info *info,
cff533ac12494f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   42  	     bool *hotdrop)
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   43  {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   44  	u_int32_t chunkmapcopy[256 / sizeof (u_int32_t)];
3cf93c96af7adf net/netfilter/xt_sctp.c       Jan Engelhardt       2008-04-14   45  	const sctp_chunkhdr_t *sch;
3cf93c96af7adf net/netfilter/xt_sctp.c       Jan Engelhardt       2008-04-14   46  	sctp_chunkhdr_t _sch;
009e8c965fd72a net/netfilter/xt_sctp.c       Li Zefan             2007-10-18   47  	int chunk_match_type = info->chunk_match_type;
009e8c965fd72a net/netfilter/xt_sctp.c       Li Zefan             2007-10-18   48  	const struct xt_sctp_flag_info *flag_info = info->flag_info;
009e8c965fd72a net/netfilter/xt_sctp.c       Li Zefan             2007-10-18   49  	int flag_count = info->flag_count;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   50  
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   51  #ifdef DEBUG
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   52  	int i = 0;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   53  #endif
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   54  
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   55  	if (chunk_match_type == SCTP_CHUNK_MATCH_ALL)
009e8c965fd72a net/netfilter/xt_sctp.c       Li Zefan             2007-10-18   56  		SCTP_CHUNKMAP_COPY(chunkmapcopy, info->chunkmap);
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   57  
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   58  	do {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   59  		sch = skb_header_pointer(skb, offset, sizeof(_sch), &_sch);
d3dcd4efe2ad1a net/netfilter/xt_sctp.c       Patrick McHardy      2006-06-19   60  		if (sch == NULL || sch->length == 0) {
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   61  			pr_debug("Dropping invalid SCTP packet.\n");
cff533ac12494f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   62  			*hotdrop = true;
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   63  			return false;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   64  		}
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   65  #ifdef DEBUG
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   66  		pr_debug("Chunk num: %d\toffset: %d\ttype: %d\tlength: %d"
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   67  			 "\tflags: %x\n",
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   68  			 ++i, offset, sch->type, htons(sch->length),
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   69  			 sch->flags);
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   70  #endif
2bf074825403e0 net/netfilter/xt_sctp.c       Shan Wei             2010-06-09   71  		offset += WORD_ROUND(ntohs(sch->length));
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   72  
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18   73  		pr_debug("skb->len: %d\toffset: %d\n", skb->len, offset);
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   74  
009e8c965fd72a net/netfilter/xt_sctp.c       Li Zefan             2007-10-18   75  		if (SCTP_CHUNKMAP_IS_SET(info->chunkmap, sch->type)) {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   76  			switch (chunk_match_type) {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   77  			case SCTP_CHUNK_MATCH_ANY:
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   78  				if (match_flags(flag_info, flag_count,
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   79  					sch->type, sch->flags)) {
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   80  					return true;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   81  				}
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   82  				break;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   83  
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   84  			case SCTP_CHUNK_MATCH_ALL:
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   85  				if (match_flags(flag_info, flag_count,
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   86  				    sch->type, sch->flags))
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   87  					SCTP_CHUNKMAP_CLEAR(chunkmapcopy, sch->type);
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   88  				break;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   89  
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   90  			case SCTP_CHUNK_MATCH_ONLY:
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   91  				if (!match_flags(flag_info, flag_count,
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   92  				    sch->type, sch->flags))
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   93  					return false;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   94  				break;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   95  			}
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   96  		} else {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   97  			switch (chunk_match_type) {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16   98  			case SCTP_CHUNK_MATCH_ONLY:
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07   99  				return false;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  100  			}
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  101  		}
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  102  	} while (offset < skb->len);
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  103  
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  104  	switch (chunk_match_type) {
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  105  	case SCTP_CHUNK_MATCH_ALL:
d4e2675a61890a net/netfilter/xt_sctp.c       Qu Haoran            2009-02-09  106  		return SCTP_CHUNKMAP_IS_CLEAR(chunkmapcopy);
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  107  	case SCTP_CHUNK_MATCH_ANY:
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  108  		return false;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  109  	case SCTP_CHUNK_MATCH_ONLY:
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  110  		return true;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  111  	}
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  112  
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  113  	/* This will never be reached, but required to stop compiler whine */
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  114  	return false;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  115  }
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  116  
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  117  static bool
62fc8051083a33 net/netfilter/xt_sctp.c       Jan Engelhardt       2009-07-07  118  sctp_mt(const struct sk_buff *skb, struct xt_action_param *par)
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  119  {
f7108a20dee44e net/netfilter/xt_sctp.c       Jan Engelhardt       2008-10-08  120  	const struct xt_sctp_info *info = par->matchinfo;
3cf93c96af7adf net/netfilter/xt_sctp.c       Jan Engelhardt       2008-04-14  121  	const sctp_sctphdr_t *sh;
3cf93c96af7adf net/netfilter/xt_sctp.c       Jan Engelhardt       2008-04-14  122  	sctp_sctphdr_t _sh;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  123  
f7108a20dee44e net/netfilter/xt_sctp.c       Jan Engelhardt       2008-10-08  124  	if (par->fragoff != 0) {
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18  125  		pr_debug("Dropping non-first fragment.. FIXME\n");
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  126  		return false;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  127  	}
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  128  
f7108a20dee44e net/netfilter/xt_sctp.c       Jan Engelhardt       2008-10-08  129  	sh = skb_header_pointer(skb, par->thoff, sizeof(_sh), &_sh);
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  130  	if (sh == NULL) {
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18  131  		pr_debug("Dropping evil TCP offset=0 tinygram.\n");
b4ba26119b0605 net/netfilter/xt_sctp.c       Jan Engelhardt       2009-07-07  132  		par->hotdrop = true;
1d93a9cbad608f net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  133  		return false;
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  134  	}
be91fd5e323b46 net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-18  135  	pr_debug("spt: %d\tdpt: %d\n", ntohs(sh->source), ntohs(sh->dest));
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  136  
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  137  	return  SCCHECK(ntohs(sh->source) >= info->spts[0]
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  138  			&& ntohs(sh->source) <= info->spts[1],
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12  139  			XT_SCTP_SRC_PORTS, info->flags, info->invflags)
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  140  		&& SCCHECK(ntohs(sh->dest) >= info->dpts[0]
7c4e36bc172ae1 net/netfilter/xt_sctp.c       Jan Engelhardt       2007-07-07  141  			&& ntohs(sh->dest) <= info->dpts[1],
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12  142  			XT_SCTP_DEST_PORTS, info->flags, info->invflags)
f7108a20dee44e net/netfilter/xt_sctp.c       Jan Engelhardt       2008-10-08  143  		&& SCCHECK(match_packet(skb, par->thoff + sizeof(sctp_sctphdr_t),
b4ba26119b0605 net/netfilter/xt_sctp.c       Jan Engelhardt       2009-07-07  144  					info, &par->hotdrop),
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12  145  			   XT_SCTP_CHUNK_TYPES, info->flags, info->invflags);
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  146  }
^1da177e4c3f41 net/ipv4/netfilter/ipt_sctp.c Linus Torvalds       2005-04-16  147  
b0f38452ff73da net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-19  148  static int sctp_mt_check(const struct xt_mtchk_param *par)
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12  149  {
9b4fce7a3508a9 net/netfilter/xt_sctp.c       Jan Engelhardt       2008-10-08  150  	const struct xt_sctp_info *info = par->matchinfo;
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12  151  
ad14bd8357a265 net/netfilter/xt_sctp.c       Wander Lairson Costa 2023-08-28 @152  	if (info->flag_count > ARRAY_SIZE(info->flag_info))
ad14bd8357a265 net/netfilter/xt_sctp.c       Wander Lairson Costa 2023-08-28  153  		return -EINVAL;
9f5673174161cc net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  154  	if (info->flags & ~XT_SCTP_VALID_FLAGS)
bd414ee605ff3a net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  155  		return -EINVAL;
9f5673174161cc net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  156  	if (info->invflags & ~XT_SCTP_VALID_FLAGS)
bd414ee605ff3a net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  157  		return -EINVAL;
9f5673174161cc net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  158  	if (info->invflags & ~info->flags)
bd414ee605ff3a net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  159  		return -EINVAL;
9f5673174161cc net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  160  	if (!(info->flags & XT_SCTP_CHUNK_TYPES))
bd414ee605ff3a net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  161  		return 0;
9f5673174161cc net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  162  	if (info->chunk_match_type & (SCTP_CHUNK_MATCH_ALL |
9f5673174161cc net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  163  	    SCTP_CHUNK_MATCH_ANY | SCTP_CHUNK_MATCH_ONLY))
bd414ee605ff3a net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  164  		return 0;
bd414ee605ff3a net/netfilter/xt_sctp.c       Jan Engelhardt       2010-03-23  165  	return -EINVAL;
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12  166  }
2e4e6a17af35be net/netfilter/xt_sctp.c       Harald Welte         2006-01-12  167  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

