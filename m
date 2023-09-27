Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F1B208A7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 13:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695822560; x=1727358560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zyYXKZ60bxsH5bub72oW07Yz8kU2ZTwl5XJQvcO2Eo0=;
  b=PVh2YeTBYfq7qc277vCYhkgd0GMbPrPRqPOsnW/vHx9ZG4CVf/AfxVvn
   mGue9zM//Mnpy6TuHgVw5YdYdXzl04n/+OR0U081CpGLjztViwUsXesTM
   Gw/0IhcWbQxZcfAr7Q2/9ytGLR8zWGENanFei4Z6b6bAi3LKDn3XgDiXQ
   KGRTna2LbexfLBCbVXuTQAUPUiL5px2LeVh/VIXaDJvKejJ9UyCEwDChF
   8rjaJTaZPaxg+mBi2L5XivVKtAneB/9blzoAAMf5MOXzlZN8r82IXvQAq
   vu2gxmBXfwE6T71EBreSiXMp1+ppGgvOX15UHbtnR18WX3CjzUnoY50FI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="362079230"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="362079230"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:49:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="864842669"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="864842669"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 06:49:18 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:49:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 06:49:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 06:49:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IkoLjn0m6dtou24jrvDHcrJEZOu433xPK/zefm6O92lW90q450JdhJuFPbzgzWOi13r1fdInMT6K2jEMcyIr6kUI9QClGp2tzJQDCZaUstwmzoSfyxebqqc4ImS6ZbyelgEhtwmvgncw4XHV6VCMWQthCuyTZyN2DWhFRC/10SLhB9JNA5Rnh8jS7aXzBUJ9xhri4VfX7J3M5IVtvWpsGSclcnOvk2XkYpD9SZ/+QINGPGiTE349f0qHRoJ8dSRYmeU9oWYUpJ7O1SJBD0SV2IbYzH1SK3NR9vjxytFSGlVrsTHuYM+HqW3bHEi5me6eQVRnkz/Y1Dy2aNsJEW+dTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/WLTEQOxEndbt9PauGpfe9t2hl6S+i7Xt7kh/50Tkw=;
 b=TZavl1DBOiKUvtaIqTkDf+JEJZdwX3zcAFGfjWLiiPjIynZ3X+CBhb4f6QwlHVXsKrUKXBEeYb216SXM6yxgWkH0QO7/oIfLZGMhsROGua/LNtyhArpGw50nSKSDJ02ItFe6DWQXumM3uVhLMnaVKNmH72qkg2va0qTf59BrV/RhlyiUI+ctlFudCM/Slhaec2UO4sYJxWWkDJp7f0ERG0ZmJVs1n59OHLXGko0ky0ilqAaR0e+y7c3ZXE86fo+ilHtj2xps1WmEPk4hGiBTVaArD18hvfGTORyXKkiHXu9/WagDx4kPeDUngCDyxETqeKotXzLJkjR8hgbYY/RC+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
 by IA1PR11MB6442.namprd11.prod.outlook.com (2603:10b6:208:3a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 27 Sep
 2023 13:49:16 +0000
Received: from SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d]) by SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 13:49:16 +0000
Date: Wed, 27 Sep 2023 21:49:06 +0800
From: kernel test robot <philip.li@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [omap-audio:peter/linux-next-wip 36/48] dtbs_check:
 Documentation/devicetree/bindings/gpio/gpio-shared.yaml: title: 'Bindings
 for shared GPIO lines in board level' should not be valid under {'pattern':
 '([Bb]inding| [Ss]chema)'}
Message-ID: <ZRQy0jcaDmvRk9FE@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3006:EE_|IA1PR11MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: 6becb555-0dfb-4130-dcc0-08dbbf608a1a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QHzdFFUz9FSy8i/7ynftlt2cP+PoKX2p6CUxmgJOwft6gz2KQlyDuLtj7QW83D+o+PZFW2Xq9hAyQiZtFHtlLc6LRs5iwl4nNfP776LrUe5G2mg4PX+gMRYFxza+vVuGY+3/bw4UhLNBrtAIbq+hdOpvQGXyYav8fM+mTNndoEVTU84r+j+x8rQzCnaOiYD1SmzqC7RA5985zp0km8YaWKHAB1l3UACJrtDs5NfQ00yBLcGQCv4+KfiK1h0xpQexA29psKKVu0Vy6MPdwnhO1WmwPM3D+/496o8K2aBl6Ri8KOXV5RpCv32RxeUn1k+nolAAgc1H5rMd6aOPxzIhK/Az/d0/slkvTKd1ogVz/PYNWpOygnGi/39Bu95g06XdjklbnY9VnNlgbjv33hXvvwsHq0zBst1RPlwMR0gADylO0iaoR3r1pFHFcvhspiY0I+AXd4Xlwy5gq2AX98Dcsq1NcX0L61by0f1LstSxGO1j5uNnSwjtkSrK/lVM31D5AGzpDQgqoCNqQHYBUUdXt8drKEH/GNdhjxpB9uwrDwP0QgJxPX3Enlqg1n+WRjXReU+wyO4Z+0pJC6XhiGP36ps6r/z/v+JKosrjQ/MpoXFTnOr4CQBfuGU4TzY3RWKLN81DDB2yh29qyGynxap/Ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(346002)(39860400002)(376002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(4326008)(8936002)(6506007)(6486002)(6666004)(478600001)(66946007)(33716001)(41300700001)(66556008)(6512007)(316002)(26005)(9686003)(6916009)(8676002)(5660300002)(66476007)(82960400001)(966005)(38100700002)(86362001)(2906002)(83380400001)(2013699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HNcUfRopyvxvTBzsJI3MLJOu/jwJfayp2afE5qM5sxt0235RmvB8Om8UlbVb?=
 =?us-ascii?Q?cwx55Y8J7wQobs3se8ZGg9yzcXFPOjFVe9tghQwElFz8VzT0DGIMwz142ETG?=
 =?us-ascii?Q?GytY7W1+ZBBGY3VSh7qzvAxpI51vy9Y3wgkJP2CsLP8itYVX3eJvs6/C7Wdn?=
 =?us-ascii?Q?AJZQEVH3XP1zFdI76CmLxoAjbtXR5D+xFhwEc5vMEK/ypgkumpZ6ctouvoZL?=
 =?us-ascii?Q?9wi9ydozFxSdCoo+geDJzdsKN4bwbwXm4hxx9tIl/DcUAX/qGzU22239vNWJ?=
 =?us-ascii?Q?UtWvwfm/4qBNOMwYaJ+z9JFt7Z7YRZUvgIuVJJqM1ZJAcuM85OQXbp7c09Pn?=
 =?us-ascii?Q?cITNfNt+V6g5rjnTkTOooG3AUDtREMf7ir/faNHQ48Va9F2u1JNOhmpEnGfl?=
 =?us-ascii?Q?sSZmvw7nF88To7W9eNX/DBqW/EXojO/cOxwnzn920NNByauUZrHBxDJupHia?=
 =?us-ascii?Q?98/q3L4nvrLHBDjk3xEpvT2fXoyzb5oz9LiSkLWdUQ6CStBIS1vvkZ2XSsy8?=
 =?us-ascii?Q?hd1WK41JNkB6DmDWdw26VoCbh8Q3I81fSCERnsZIcedi/HtXzj1l5AmzZTQW?=
 =?us-ascii?Q?4n+6FiDILwe3BxoMioyX4NY5jMz5icltno4hwoXkX/JUtcTidPBIZEEEenuw?=
 =?us-ascii?Q?cVI+FQ70T9vMFgqbIMchoUovKVrNMz/9zVt1EnWNjj0Gtxe1HPYWIynFeByC?=
 =?us-ascii?Q?hPKDmJ59clN78Omy/k68ru7mcCaoXwkgHLQiCh5MGKKQgtihNglc2J/aK6r6?=
 =?us-ascii?Q?xuTXdqtiGIyLRMBt417BJCNT30nLpFbCNEcaL+unqK+dm3dt7vzDtLg5fcSK?=
 =?us-ascii?Q?tXogN0xAdIO+NSziSvicy7otO60eAbJTpsP359lkLbiWCkoXN3K9275Ytmcp?=
 =?us-ascii?Q?mp25ULB2DtU01ogYnOeeX+rH3d6dnrep/GFFKPcadKbSsq4klLEoW9o+Xmaw?=
 =?us-ascii?Q?OR+oZaDAVfaQ48iw+775joEqg/8e7X3AFa6DrRYRQ6xAIGI+6huJVI2FkoXx?=
 =?us-ascii?Q?FFFc+3Z5WyOF8wFq/16mg5waKK3esqwXoE70I/5uchg5gps2hyFDLXynsygi?=
 =?us-ascii?Q?BN96CcUOm2nS8QOzZ30LpoEThuyq+8CazTAJGLYARVw3p9EGY8AlBmzQWn9i?=
 =?us-ascii?Q?WS5oN5Uu4n1Zxwg2FdEuzPrO1nO0XFYHDua2Ak5xK0O2lDALezBAuolo7WHO?=
 =?us-ascii?Q?TXkbkXfRipzriShq1gceZY2BLKe4I0vocNfHC6eezJftGRojqE1+6h4DpPww?=
 =?us-ascii?Q?4oi4LVuOcldzDKyxtEk6j4NQ4jcCwP1qrXgrb5DzZ6YDvr0EZU2Ap7YAhTK+?=
 =?us-ascii?Q?rmaerJaifdBENV6BciKngZQVp0RFIX+uJ+llsor3nd+xgxiZGIntwVowMyzW?=
 =?us-ascii?Q?lcp+HeHaZsFHqYtvTGdXATPu7v63jw41RNEKNMdc52azk8nHXAy05gwMJeSj?=
 =?us-ascii?Q?U2WM/3M/kOAzQ439Yi76whmV8Z42jKhx0IvYFFrpy6i61TehTWCtXsj3uX3r?=
 =?us-ascii?Q?da/CTmafFnOGulACP/KMCpE2XNskr/55UdZCIAaCEjf3amZgKFpZXcggHRe1?=
 =?us-ascii?Q?u50MaZel+wAA3xyKsH1TuUy6Gy3PrVC+RE/zy6Rg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6becb555-0dfb-4130-dcc0-08dbbf608a1a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 13:49:16.0473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6Zn8xgh5dRa4AmflFMPVpN2DvltVJd3aaW6/dcVQ+ZNIv348hoVIgYWUvELH6tzSA+6XTCXRSMIZqwacNW+qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6442
X-OriginatorOrg: intel.com

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   53915ce9abe60ba07d0e5456948553edefc6cbfb
commit: 6527d988f2f5e2df2ee10ed231ffda16e54c7720 [36/48] dt-bindings: gpio: Add binding document for shared GPIO
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270114.61PtY3qe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270114.61PtY3qe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/gpio/gpio-shared.yaml: title: 'Bindings for shared GPIO lines in board level' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/gpio/gpio-shared.yaml: 'oneOf' conditional failed, one must be fixed:
   	'unevaluatedProperties' is a required property
   	'additionalProperties' is a required property
   	hint: Either unevaluatedProperties or additionalProperties must be present
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/sound/loongson,ls-audio-card.yaml:
   while parsing a block mapping
     in "<unicode string>", line 4, column 1
   did not find expected key
     in "<unicode string>", line 65, column 3
   Documentation/devicetree/bindings/sound/simple-card.yaml:65:3: did not find expected key

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

