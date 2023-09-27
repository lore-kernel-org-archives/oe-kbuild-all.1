Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7619F1FA1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695822816; x=1727358816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9rQBDLipWbL9C8Mw/nVcV1r8pzNy78z0VH3+P5cclM0=;
  b=BkRcG6RIqUaYmXClRFjJv7xHtWRMoziuUSgYizzmuoQdCj8XvRATo28o
   fWHN9vtaEk3JcZzkT0RkihFlae71QTaCkeB9rsM+K9A7Z3ZhLlm0maZZL
   zZTHhRWrt9aLUdaFevhIDUh5ocWc78D6QBdqJgJACrh7kMMM1VTy8l8lj
   5T06bjWJungc4FSN5CVfqStQ+Zgt5lcbz7Ljwb9pMRWXgljNeTyyMP0m+
   R+pmJIWGgjjMjasL+TLw4BoyvGRv8SNFF7hGQgW1M5qDLfUxuDs/8XS1N
   w3yDOp29TSP4cxpGUD6beyHB20aoIhJO0bTW8unY/WaLVfwuml7L3hHiQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448319876"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="448319876"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:53:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="892596961"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="892596961"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 06:52:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:53:34 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:53:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 06:53:34 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 06:53:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hf+sES0fnEjHxp/w6rNeo/EP9p0nf5AI1/p3/wlXXZc7nPwVE7MK3F34uBAIS51TlQB/S4o8FVIZX3JzIDx4oDwJx/0/xUJGLOFRgkZ5/m/WpohHQuoR25wrs1iPysZCO3FgwOe5QaVEkXfElyV+PBd8mW+1vC/Kc/lZp5g8hKufLYB5TK6l1MzAjtdAx7Cu9kpQjpPdmk85D98OuLZy8oybtb6E1V3qgtDW0THJJ9DzXifvi9pXf/K8dTs+RMdZsH+I3OVA2j8/EcQaAAytANe2ndCeYauPW0YJPr5Uvls5Iq+QcbBD0OCQWCUdJ0Dhggmw3ZUJzswZGsd4Mc/nbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8wJQIqeMt9mQ8dbKpahzm8UQBG4Fm7p7bIlNO0me9c=;
 b=B1FNnU6WpMJ7yK2kArtMR/wumkDdXfua1hjvqHq0JRID0NsuuZjLdcMHzxAWPLtVC0URdwmFA3UdDZUfeFz7qAlpOBbEwMDlW6AII1m15b5buyc3delf9P/JEep2mo/NSHT5L58cJLOX2jrn09tTwnd2x9eqofw9GT+I5InNrnE8pNFw4+jaTedwU7hoUVbKLxc75zzaRD870ACY+Ygd86N5oU/XmfLZ2cHRxi3bw9Txh3VfMV0Lw808oBdky0xiPtV9aCs9HEZwHCx0QzIuFS5qxS1DS3yf8/gkthkpf4sDMqlLKBzTD1/3mK3c1U1Qio41cQS/AAt5Cy44hU5Kbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
 by SJ1PR11MB6227.namprd11.prod.outlook.com (2603:10b6:a03:45a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 27 Sep
 2023 13:53:31 +0000
Received: from SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d]) by SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 13:53:31 +0000
Date: Wed, 27 Sep 2023 21:53:22 +0800
From: kernel test robot <philip.li@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Lee Jones <lee@kernel.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, <linux-doc@vger.kernel.org>
Subject: [linux-next:master 5572/8008] dtbs_check:
 Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml:
Message-ID: <ZRQz0qKsTE2iYlY4@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3006:EE_|SJ1PR11MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dc4e44f-0606-4c41-e593-08dbbf6122a9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fFl06frboHWDEGt3LvNbDU/hSTW57/qq9Vv2jpYT/+tN8Sass9rBwke4ETyeEzemkGeoL6oOUZqU3uh9qnPhJ1WCv2iyssOWk2CMDKly4q/B+nKJ0iHJIzUWpIPcKT7nGHz1Wp5gX7AFFGA/p2WhIaJi/cj8Nnbd3QgzLe+wcSxV9KsrMSgK04w1mOEbcf1zjhonwXlbL165x8grbypqFgwQb7uxQrKKqvkaBSYpqlgGKAlcSz/r+Hi19SAWG6dbO9M8ydVOTe+V8LKzoqpGI417bpJ9NxgJJ7Y+ediEV+McsgnEzbpHwWapQEpXSv6+zG+mQSYsveYw2Ov6lwPUKml12J1VJB+EP+1LlWiVFaG0ll6H0/lzTG6h6xLPue3wYjC6B9C9rJpYFf9aqVXigw3qtA4ewR8yVf4XZ0fN5gdVMy1Pm4SEvTlU2Lbawv1zUw9jrucVjkcjapvTeTQN6WJ+mkzYZ4KqrNwWkOkgRn38c2ucXN572a3OR8IWLiQynDPjMvdsCyAnbei323GAYkczsnmRmxRmweEo32rP6tB4eQusNhO31w2unxQWooKT+A3p8ENI6gdU4XFN2LETkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(396003)(366004)(376002)(136003)(39860400002)(230922051799003)(186009)(1800799009)(451199024)(66946007)(316002)(66556008)(41300700001)(66476007)(86362001)(4326008)(8676002)(8936002)(5660300002)(33716001)(6916009)(54906003)(83380400001)(4744005)(2906002)(478600001)(26005)(966005)(6666004)(38100700002)(6512007)(9686003)(6486002)(6506007)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iIVOLtd8CoG9f++AEfCVHhmAa3L1ijTr5pcGAhUi2EZpRdsBp57VlhzTZ57a?=
 =?us-ascii?Q?a3e8afYI1sJKn/95E8IqY45Var7vvcVAicQoZHdHwcEplIHyLKaQ11+PLZwK?=
 =?us-ascii?Q?5mEHZ9AUp4z0N2G0qp6ZsIc1Dp8G4RqgXsa1DOMbMN8EvRmtUBH+t95iz3Uz?=
 =?us-ascii?Q?pGwQY6iHKCpMhgJl+PKHThDD5DkcG+njmXNSzsOcr0WCq6hM9GXpsCQCgYTb?=
 =?us-ascii?Q?wSqFMUhCXSs6VCZHfatsy6sZ054cX+tc/ieWScRgnz4ckbdkYGNstBvlaJbY?=
 =?us-ascii?Q?DkSdB//NdaR7Gln+dNv7lcjjyLNNgIi77+j7/7qc04gA1j6ogIksF+gWC+Bn?=
 =?us-ascii?Q?pz2/sqMzAiymvX+Ex6S/sMmDOP6zUZaXns2OpnFFUqIEenYsaim3r0Ef4VfS?=
 =?us-ascii?Q?mTz6K+5/8MLhfqhkUp+WBPfKIj9fod1mkU8HmhnfhPl2Y2JidgPOgYJCffS1?=
 =?us-ascii?Q?zEh/gOOFdqs4lpZNnriw1sxraPB3/ZY65229LW4QdR+2Ps6Jq9pftMRAoYgM?=
 =?us-ascii?Q?pRgfSf6/0A179xLmnt1YhVJVKoW7JaDLLl6uQhL+Q7v23ZSrpZscHGkVpmj9?=
 =?us-ascii?Q?NEpjvljkcEKuxm4xoC1vjd1K9lATh05Vqcpg5W+F1DTtQl0TUi1MSMPdC/kt?=
 =?us-ascii?Q?v4PuP1eO25rL8cTM0tNXJfRj5q7ed4ztalfwhdHh7s9GzA8M8sLtABKRx87j?=
 =?us-ascii?Q?xQkTuGKHiVvSyvtuOyvpYugf00TdVSdmJDiVcCDCPLkaF0QwlNU8WhpX+huk?=
 =?us-ascii?Q?QmYtp1NHSIWPU4qnzjPUZzHwZD4222muIv7UH4pBur8wIkO43vmnbtLgDru7?=
 =?us-ascii?Q?kTYJJ1YuA6Pt/7SI/wCII3ZgA7EJzbev/4ZvlDRZz/mau1eEzMz29xTUILg/?=
 =?us-ascii?Q?XHTXjtRS/qtv+4A8I+TGDRBzQa8JnkpiX8aJinTAWeTIVZDdi0KJNFviLhEd?=
 =?us-ascii?Q?E/BCopXVEXshPJdK09WIdDczePsZiykF1ThNlzK6OWhuYu4WA1NSo/E2mbJx?=
 =?us-ascii?Q?sjFufSKb9nFSUDlrg27ZREPNxACs8d/QvLbWb62LzVAxEhqNuvVmdamglxkM?=
 =?us-ascii?Q?EJ2NUCcPum/yiN5pbpsF0b8MBEDxo3ec5DuJEyXafsRLd4SJBg1Zaq2KuA1x?=
 =?us-ascii?Q?BjEe5/954LFN65Kg9jX+7Mmh1o7e2GZ7SRdSCw8/Al9Z7n8jGG/fEctzJY6T?=
 =?us-ascii?Q?+Lkuv8TA5amzrWIUR6tFGdtCh8QC/3GGNlWRZcrlTim/DtURvR7amaqZJST+?=
 =?us-ascii?Q?2Tm/v1uqYBN0bVd2UFO03GERG3nNXrs5x7KYD6doo86pmR2BgBruA8eViFJH?=
 =?us-ascii?Q?0q+0RQF8N/itI0w/KYhYENMX81NyaDXdlh+2ZOoM8I060oswxgcma2PtLyKU?=
 =?us-ascii?Q?KeEfCE+5q4wMbQpHoSosJlL6fo0qTy3YSN1lFczTbyA+N2EVfKuhRnUBMuq7?=
 =?us-ascii?Q?zlYUfZoO8WvfGuf7uXO0tW+YRqEnsrPnPwirjSpPe2V2Efk6ohovQjCiv27v?=
 =?us-ascii?Q?AEUfTHxM4ula4boGpAFB/l9tcdKVPaii7opM43DoFj2m5lZlUeKFAhc9Of1G?=
 =?us-ascii?Q?4PS3ICaEl46yv+FwrFylJ7oEuk1sYesnR26bMene?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc4e44f-0606-4c41-e593-08dbbf6122a9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 13:53:31.8412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QrQuK67EGgtmaKHA4oqfl4GtSJoS6SDDPgeyXZ2cBQtMgwEYNYT00N2n9Pi/5+f7Fac/cvRcHpRMKorBKPoYcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6227
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4ae73bba62a367f2314f6ce69e3085a941983d8b
commit: 2c09766cb133ee4d57d19f56c6a0035b0d9eb034 [5572/8008] dt-bindings: mfd: qcom-pm8xxx: Add missing child nodes
:::::: branch date: 10 hours ago
:::::: commit date: 7 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230926/202309262305.DAUAHrn8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309262305.DAUAHrn8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/input/qcom,pm8921-keypad.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

