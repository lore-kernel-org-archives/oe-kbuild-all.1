Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4746D2564
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 07:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681890157; x=1713426157;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=QFYdgF6cSG6/Kh1egbaUs5JZGJHOiPeZbI3ymZsrPcw=;
  b=cNlRe4xTiFuX4uEViVvvsVzSrJcWUhSTS39+ZkkDI0+AaCVDcONe+srG
   M6hnj7npIm0MlBY60KzgbDpgeln5tgN2T0UFViWYT2KpxSos35sPa+xJQ
   O5GOFEme3B367I3EqUl1ETmKtAZH+AuQ8JyrbMVLDYugpPA2YHhSKtPR9
   zoCLRcIbOya1ICiFKlJXoLYBJRI97xcLnYmr7b6l6U5ZenxKUKcg+ePSs
   WsDtStq4Y8JK+1cgGs2TmCQd1iSNWJ/xNKmHsXEYqu0h3cDxw4p4OegdV
   NiH8mqgTnTmyAJ+QavPrvOvLIQhJ0Pu2eKCnSRor40SutBtkmoeAEtHO1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="431657949"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="431657949"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 00:42:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="723955410"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="723955410"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga001.jf.intel.com with ESMTP; 19 Apr 2023 00:42:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 00:42:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 00:42:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 00:42:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 00:42:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HH7LgSG93ukde212GMLdziKOXWkXJB+DbHUHLmxw4HDHtCT2ugpPljJb14weFMmeLpkjHLPqzCMAs2z9Glu0EOL4BMdi/rGcqv/YrGQkJX+FLlYDvNcZklM2KiDsTRMBwfbIccfzaXx8xuGBPZJU3k5ZwHJgJpzsHYFH3Euf9gnTvteoKyCNfdNwtBHE4SuaDp5E4zcLW1WktWsFPU+uRQGNPtkxyzpt/0/ebp+ndV2zkZDZ0y7zIqTmh5GbBEx39jNjr/x9cdbEVwsw45lTQKMs9lqJbWq6DSBtXiWpwVYeUCrB27U6ICvrGj8xUSix+Ks0dME4NmsQiSPWjvaA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UvIcSxv6SViTDQwHrUH7SfLojz9AKB5YvAYNH9XFlk=;
 b=avdVHDEREPPiZtty/ME6eJcWC7aEDKmx5GnXvwqKpJJ4luMS8rwbVoC1zVycmIsh7SsEFVA3Lo0NPLLmLRGxIE0I1GV3nawgsNHRBGwVaTQr6hrx6gKlMrRoruep25rkG7+yyEFkWsOot9IZXrypj6s2JTdGOpcET4P9O2G6S06iQD7J63GYjHJsxucYZEKKC3cFmEhSE8244urmcIeX039w8CY5yIr+Qiyo9KPhk4AhMToGxBk+okKGtwXu23Spnho0GwGhtv14A8kFlPF1AJhEdOzx8Hd9hqzBJc9vwPObezDzTfOjrcxRIy7otWQeiDaBeU10jcN2atCs17fTDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA3PR11MB8075.namprd11.prod.outlook.com (2603:10b6:806:303::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 19 Apr
 2023 07:42:08 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 07:42:08 +0000
Date: Wed, 19 Apr 2023 15:39:04 +0800
From: kernel test robot <yujie.liu@intel.com>
To: William Tu <u9012063@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH RFC net-next v20] vmxnet3: Add XDP support.
Message-ID: <202304140107.ud5iiJZQ-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230412234434.91819-1-witu@nvidia.com>
X-ClientProxiedBy: SGAP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::34)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SA3PR11MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: b241532e-f87b-49e4-8e42-08db40a993aa
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x+NztpABxkMloPTMEsxSfzHNGxO5bO97Xe7Gb9AvMsBKI3aN6mge0ElJC50mxUja8+jREVrkDybmGtT3Iyie4gdCLKjT0aa8f+zEJJcrHFtH9BvcABNeONUTI9IRrOmBoTpFQsZ1+1FCl88VXu4yz2OEmAka3m4B8e3XOzxFn4CbkNleRXX9aUR2duN9FWDPqNRZqHJj6LlKm7iXU4eFF0Wjtu2PBXUpUod5Ezg56yLkgPUbLrGkr8/U4CIvOIf9OfhCpGECa9k/ZpU5mrTIxJm29+LMrsYUtaw2zKF7MEdRuVeegACYHHZsoewwCbdUb9deLsIX0ELqaDtZkWs6yDw1OriNS2+g30U25y5jtKcVEbJUToCtTs0xhrmsYoZxwrVDl2iIEKdRvh5Jykl95x/2dG6pDyukrzevPk/cXzzZhUYAnl0Lz5cFb6KjyuNcGcPWTRHXK/Thi0JM4zXDjYwu3+DYzJPgQ7NndxPilr+UMkpKSo3syqi8mfvlhhlqZfL3uNRP3cyyHpySjzbPWJudnGFmQT7rD/4LGRL+/aFKzbn5sz/ozBMWlaLO1Vz1NgnLFINv+qIEk2k0uOIGAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(5660300002)(966005)(6486002)(478600001)(66556008)(66476007)(2906002)(4326008)(6916009)(66946007)(36756003)(86362001)(8936002)(41300700001)(6666004)(38100700002)(316002)(82960400001)(8676002)(1076003)(26005)(6506007)(6512007)(2616005)(186003)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GgA4YE0YuYdUzPPgpw2usczmznpbVeUPaEbGzyT0to0atQyNZq6bauD5GAo5?=
 =?us-ascii?Q?0VsvV8JQ5RJThjzv4TxjIEdnSnMwoflktE7U/2DTNhqOFMamhstguFXC/MHi?=
 =?us-ascii?Q?VGSxKbI7Uostup01XbWamRtI8pBZcGfGC2dVxsv4rW+Y0KWeuLtGObBqOSfa?=
 =?us-ascii?Q?fKbKYOh0PnCUzsW6L85dJ6pJbIWWMO19hHgBMI0SOSypTsG0iNSHBwJGJkrb?=
 =?us-ascii?Q?qYm8nvLAOVOhmHHBILyI1Gkd7BLtW4TYkJqhlAMw7CNoUnFKRDToVpopzNpM?=
 =?us-ascii?Q?7tEGNfsX51s79yEUEyqOy+CzN8bn2CDGGiPbPZorimkqJ85G5DgfBxPcWAl6?=
 =?us-ascii?Q?03iK4TzKw45+vzGmxjbHDzbN5JuaOYuvSG4YVA70bRaLWgbLPfXTHk//wjTw?=
 =?us-ascii?Q?+T7U+Wymuk/w5e+bSLZMVszPAJ0gyH7DtYE8E8DnJnn3XRyoNNI5uoQ4/p8J?=
 =?us-ascii?Q?CXPcU763WP4ZlfYHmhTtxPA26Jeuwlb/rVYBsuRxE6nDtmf1ESX+bwKtNA+a?=
 =?us-ascii?Q?UOB0PLBMxPpZnF2gWfFAa0Tmkg03BwCHsUF2HGhDpSBgj5hj9GKqoZWPGAH7?=
 =?us-ascii?Q?/rphI0SXhGKb+Ke2Acjh/GXSSswAnTktV7lhBqYr3I1Be6Cf6/PVWVPyjkw6?=
 =?us-ascii?Q?2pKf+zXtJOhspuI70o73MTu2E3lAOLfZWXI6MZhcXGykr7Ku8KEepBmtxVg/?=
 =?us-ascii?Q?9RszvNynSfUsdw6obzUZiDO7fA6Dgg2IfFGvVd+TxPxoIiAcOMvvidv4EM00?=
 =?us-ascii?Q?4anNUq5W56Fnyto3hnIC3gMfZv47CIowYwBoIoth4UsEYcpXDqewFrZwsnNU?=
 =?us-ascii?Q?V7CsmKwpov2rYt8Fib5Wvd8A/oTeI5NBoE6YwNGPddZmKlqerp+2Q8FO5Mpr?=
 =?us-ascii?Q?CdWRj3CoSOnRJ6jbMN4Xh1kRVD85107Ji6ZzN8fT6kODGlKaAy0PuN4rSAVG?=
 =?us-ascii?Q?pf2gPfshMtIGY07Zxu4a8Vx1X3gbpTLK+4m1WNF5aPtesnBS2go3aw429s3W?=
 =?us-ascii?Q?a+Wr8QG9sM3A/qwvD7VQKnCPZZdUepnatIw9HhnZnTziGvDl40IkXrhP+rTM?=
 =?us-ascii?Q?Iy0w7Cw4qY/UyKd/qv14oHJwEsSo/kZk6+SsaIWgJaMATF/8FyQFcjyWC8ML?=
 =?us-ascii?Q?RWA04GANzntJ1xGspweomrZEt5a4VkasIui/xwUE4ocAXygasbGi9bDq4kIJ?=
 =?us-ascii?Q?84r9qwylc7ZxdiNKAnrJ1nULGHhnzX3JOTbMVaAYHZv5u4mGdsxGDglH5+hI?=
 =?us-ascii?Q?OrGvIBgftDksDVN+ZHjjHoxofixSs0mFmI0T6eNl5eZOKcjHpdPKzwGPYsfb?=
 =?us-ascii?Q?gD5debOkplD6bb1Vdw/by7NhdTIPUm/8vvOeC8r4QUXNfw7V0q/VoFhFfFMg?=
 =?us-ascii?Q?CTvz3Yzg8GIeMGaV8zaINXkytiNdVc1utEiKimKJvFz84ff1o8AODeHnkHrv?=
 =?us-ascii?Q?zFg/6Y2nvcRAQmdjkaAwi8//OZrnliGHBlW0BllIA5wBOam0e0GRSIUYpbtI?=
 =?us-ascii?Q?+0BmsJg0kbJg/ShfJwDrKhPl1mq7MttH7zoC7jXgs77KdGqBr/5RlRUWlG4e?=
 =?us-ascii?Q?12wHBSWkb7iq93xIWrVnoFWD4QaU1j2V9pMBeEPZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b241532e-f87b-49e4-8e42-08db40a993aa
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 07:42:07.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sF5alUNDvZstrAcyJEXvkhn19jcdRs2RtnQvqONC/aoGS/IJWuO36ndP9A/rQi7UHKbTyWOrhkYbC4qS2zpGkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8075
X-OriginatorOrg: intel.com

Hi William,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/William-Tu/vmxnet3-Add-XDP-support/20230413-074504
patch link:    https://lore.kernel.org/r/20230412234434.91819-1-witu%40nvidia.com
patch subject: [PATCH RFC net-next v20] vmxnet3: Add XDP support.
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304140107.ud5iiJZQ-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/vmxnet3/vmxnet3_int.h: linux/skbuff.h is included more than once.


d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  40) #include <linux/timer.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700 @41) #include <linux/skbuff.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  42) #include <linux/interrupt.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  43) #include <linux/workqueue.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  44) #include <linux/uaccess.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  45) #include <asm/dma.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  46) #include <asm/page.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  47)
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  48) #include <linux/tcp.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  49) #include <linux/udp.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  50) #include <linux/ip.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  51) #include <linux/ipv6.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  52) #include <linux/in.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  53) #include <linux/etherdevice.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  54) #include <asm/checksum.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  55) #include <linux/if_vlan.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  56) #include <linux/if_arp.h>
d1a890fa37f27 (Shreyas Bhatewara 2009-10-13 00:15:51 -0700  57) #include <linux/inetdevice.h>
eebb02b1f03b3 (Shreyas Bhatewara 2011-07-07 00:25:52 -0700  58) #include <linux/log2.h>
35bb56a2e103e (William Tu        2023-04-12 16:44:34 -0700  59) #include <linux/bpf.h>
35bb56a2e103e (William Tu        2023-04-12 16:44:34 -0700 @60) #include <linux/skbuff.h>
35bb56a2e103e (William Tu        2023-04-12 16:44:34 -0700  61) #include <net/page_pool.h>


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
