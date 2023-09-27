Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AAA1C681
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 13:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695823164; x=1727359164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wf+bOvsA1YEQyPWc9xpQuhPxxu+Zjn8GIx+jbEwAltc=;
  b=GqQjZddzaAX21bMXpnP/Au5GeDLUagXetBEZ6KkK1zt2PLki12Qipb2m
   A9cxbsitBg7hMEEF6aHln/q9rvswfcOBgLJp6685Nxn4GQbdx4wCaJol5
   Uqdkt5LJpu5C4VludZ9vx1sxjUoQiQavf6JGzRG+9+7zf4FHsx7WRbjTN
   PiZz/IX4kmh+cA2ixTigmLx4jCe3lUKeI1Icq1dXYFH+SWyMQ8M2m5X7d
   YHMkMJNWB2mstbU9npZaOOOyEy1BLYlsyXptA+eGoUieGKLVAeCDRbxGo
   RGXtfFH8xdanqJyvniMgQCCiAZV5pvBGNP/5h+GN6kdOv+q0lRJtz5D2l
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="362081516"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="362081516"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:59:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="864846559"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="864846559"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 06:59:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:59:23 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:59:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 06:59:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 06:59:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdbmTNJFLiMzZ2KhJ1NH7KGV4TnpGss/eWOkPddi1Tb+ZYzAGYKqzV4dBTVZDWJggsiciygquE7/SjDfC4tnY9OhnvHCJKafuiXfIbb7hc0T4WBh7uGBUJ4nQjQsfR7cgDh75b3DySXPoh+TyPtH29IxLEk73Nc97ET1XaDDBKCtgek5B7VFzAGBD03PSBTp9ThFNZHJq8gZghjPAqKUj0yj36jJC7P7DPU343QOelfRpoOwKXWcH0X1WrvUhC4nqL+MVpRufL2jd47mEV8O7xjOMczaVaiVuBJvvcVUvPl6UgENhfZ87fiAUnrIV0iufQ19ViED3h4WHnF25BqdWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhWXk92PBp/WoQtaO93FStTnT/VHebxsIx1vhRHClTY=;
 b=ljixsYKCvvoWeM85drqwSsvamfmDYc4ZmS2PvRPMVv86KHUBRaHCvd0am1P8rRkieU+toUF1xEEjUxagvdX0icqmMadvS2w5FmuTvfHm4GmEpi6AYrrkIB3S86zBVzjpNnsfahbQDkrJji9uRZEZWdrkvxQ7hI5fDLRwXrtDTOIyqeeSfBXoTasOXQtmfIzUHCPZEJy4L8HRGDpSrRGxAcMAO2JeeuejQPnZ3yKHxmMlW8+INw/zMO1ioUsNKvXls/I6XRPXkfkx1krzGrhsPKFzX75ezhlM6S+n+QR4Pl0y3mlpGVPMqsHIrG7gAxrdqqq5H/d5M1Fw5aNceUBgrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
 by MW5PR11MB5905.namprd11.prod.outlook.com (2603:10b6:303:19f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Wed, 27 Sep
 2023 13:59:21 +0000
Received: from SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d]) by SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 13:59:21 +0000
Date: Wed, 27 Sep 2023 21:59:12 +0800
From: kernel test robot <philip.li@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC: <oe-kbuild-all@lists.linux.dev>, <git@amd.com>, Michal Simek
	<monstr@monstr.eu>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	<linux-doc@vger.kernel.org>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 75/1370] dtbs_check:
 Documentation/devicetree/bindings/perf/xilinx-apm.yaml: title: 'Xilinx Axi
 Performance Monitor device tree bindings' should not be valid under
 {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <ZRQ1MJnE3b9u9boC@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: SN6PR11MB3006:EE_|MW5PR11MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a03ab2-4696-4ef0-3b65-08dbbf61f2c3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ADw91/yQFZiEfg9i/MpJk+2uTl+gSiL8F8cVI0BBMPaAkzK4e+aqelikO7cJT6C6XNopgKW0Reom3KsjztLTlFqTL2/D+OG4xyJ587UyWj4FbcMI6ooTgGjNCu2tpRI+MoXVn2A8/D42PtsPoMm+/2lr2Jhh1o2Uwv/sC8QG5R5VgbaqdgJiYTfzEJ/2vkPLi0qvN3yrOmmbJkXx8gD7/4R1yEch3T6tDE/LElJRopq2odptdK0r8B1oFsh2mof6m/zFBwyGfoQkDZ6IW7u1ySHlp1EInljWyejS02XxbQg1nIb/mz0wmZ0l19tQIloKRicvd/wQgKJCPZEcVX6dn25qSVc6N7z+1ur6ndMtVE1i2I2J92fofW9jFAWnWF/MLhkfl4s10xt1FxbuugJkcpunx536Z+vtuvyijOUa7K1FU5l8ADVmWHwdmkCqV7jfyac22GnWmRw7cD6XlVqhJ0V6jPKcSGdeCkkR9gofI5ziYENTXMVJqFVmkxWXLgjBasAmiz4RBDMpvdW4nlw00rdCFhieyIBi11HPwpIt5MUzS2g5lLc4n3oq9Xnv57vp9oVS7+mcfn3b1pi54BLBW6D3CGe8oz/rVK8HShWggI2ueylz8qEZWBBs/O+EVolSZpy2/LeoWeQH/Xv9v7/H9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(136003)(346002)(366004)(396003)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(41300700001)(316002)(66946007)(66556008)(66476007)(54906003)(5660300002)(6916009)(83380400001)(82960400001)(38100700002)(86362001)(33716001)(2906002)(4326008)(26005)(8676002)(8936002)(6506007)(6486002)(966005)(478600001)(6666004)(9686003)(6512007)(219693005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2W8DdQO1Xy+ii1RBzLKYRSuDNkwYJytwu/CAhyvtNhT61kLCXkpLR4yqi3mg?=
 =?us-ascii?Q?A4Uf1pE5itA8ywit7pEHcEbRyJNglozYvQvjH17wqyTUYP1XAd4R4d8tPVOM?=
 =?us-ascii?Q?ULgW1ii19cIwsKWnt5sbZ8IuA3L28NrnAIHCu4MqGvt2YD5KN+99Py0XcZH8?=
 =?us-ascii?Q?ib7oscq7bueJRvqSy5MeAMOajnTo+ZFAM5T+KNh1cYXZw7iJcPpBCnYMCik8?=
 =?us-ascii?Q?Ul7TGgIagnh6sPLEKlyZT04aD2k7qQBgnJaApBRWCKskzBzPtim3pOGgLRhs?=
 =?us-ascii?Q?dkPLDv+xTx2/i3ftc8SxoGo5lRZjsye6e2y96jQvRyZi+/82Qkh+5KFiT7ar?=
 =?us-ascii?Q?sXSLpqBSaQAm57dASALJheC+UMnDlVdMyt8wuM09g6TCCs28L1OfFim7h8X3?=
 =?us-ascii?Q?FOi6HzlhLagXfL25RfuzqYvsmSoAyOwGnH+Fx6tNjfgsuZbOy6zUcE4CqyXd?=
 =?us-ascii?Q?TJOREkr7Hmv4DyGbZitU4YkQO9LulxSDuCNSylFJFMQ5mdPEA9A8YenF5xWE?=
 =?us-ascii?Q?4hMsuU6vRUlyj2o+qk3FBhMVRIIazuqMhfUTvfgDY6wY/0wreELY2frs+Bmu?=
 =?us-ascii?Q?ViWqAsNNk1yC3M6KbfU02Az48Stnsfz+gr3UajkOXY2FdM7j2D40FpjWxgIc?=
 =?us-ascii?Q?veeEina2lDx9xcw8Y5TeR3P/BbnswgU+ZGWQwjS6E3oOKdFeCn09usPQ8OJS?=
 =?us-ascii?Q?QiE3SEIgVVxGZaOb3sQhFjML0AMzWFWF1Qa2/XNWKSszr1U/K9X66WZmxeWT?=
 =?us-ascii?Q?ZR2x8WtF8IjWPKEZW+5xbiJ2tVv/u7d8Lp9yw7wcZEjCQ45AJb2eqveWEBhY?=
 =?us-ascii?Q?4kQITSQ0M1zzZyrUZjFTIOccLL+Eqj4u2c4hE+Ufk411+DQ/4sF/RcbaeA5V?=
 =?us-ascii?Q?pV8TSWaScLOQYnUQSqBKzsQ1o390Hp438ZyEyXE7lvGfdNtr0/b0of+cCv5f?=
 =?us-ascii?Q?zECWfS2FjK2Ajeuyec7qSHfYRQOYhMM8fx8hWxoRf0HHodOvWecGk9DOREqK?=
 =?us-ascii?Q?5GIJjcpOBaMJuXJ6xFr6PUMkB6VNkUZiswzIBIkVo4j1LWuSUCM2/cD3piVx?=
 =?us-ascii?Q?/kfMvAMLtdk7x6MX7PsPflGtWkGSjI6ysG8EdOf3bVKBBmXJGK/tkQSihtPY?=
 =?us-ascii?Q?1KmD57Qc6CXoip3yybn9saom/0pjhzdbA74TMb+5Rg9/11021suIUjqjjAcf?=
 =?us-ascii?Q?GCb48xIDA5QQfMZZLMGpaiKH5pAmwBV9b1qSnxrCSXD66yu8oq422atTysH8?=
 =?us-ascii?Q?lHVfyCxfAAUf0wGUMVqy1odzHCsKAPKX/xgxXX2/zgetWD2mdRbfMjV03t+K?=
 =?us-ascii?Q?V3hB0UVV19Jaxc9XimvSTNSY0WvF589KK5wP/ZG/Zc3pqwl+yyTeaW3iuyQE?=
 =?us-ascii?Q?96EufvLNtdXlueNtzBf1npVfoUWVyBuO+Hnmvm+ugYgqf8sGTtHd7YhXkkbG?=
 =?us-ascii?Q?MkvAnxXdl9uzNw11C3g8f0W3OaiXOalUuVxK5rWSsojzokus+X0DPHuQSIf8?=
 =?us-ascii?Q?FIEP2rgUX4DR2bRoGPdZLQ74IK6xKaUrXXBqjnlGJthaGbT0KMnxLvQvKLBw?=
 =?us-ascii?Q?yeDOM7if2Iz20uO3D+MmGJblMDRr+R50pUrrSvdY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a03ab2-4696-4ef0-3b65-08dbbf61f2c3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 13:59:21.1421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMXT/0r73ivKHxZfFR1knbFiPQ3BHZet/tk/FmQolRzk4jL3FCHR8hwxVjBbsjgiP14fDS4b12jiXApW6ZVBew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5905
X-OriginatorOrg: intel.com

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: dd65426231fcfbf88e45190dc2846ade079bde8f [75/1370] dt-binding: apm: Add the binding document for APM
:::::: branch date: 4 days ago
:::::: commit date: 9 months ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270251.ReB7r3Zs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270251.ReB7r3Zs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml: title: 'Qualcomm Global Clock & Reset Controller Binding for SM8450' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/imx28-clock.yaml: title: 'Clock bindings for Freescale i.MX28' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/imx6ul-clock.yaml: title: 'Clock bindings for Freescale i.MX6 UltraLite' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/perf/xilinx-apm.yaml: title: 'Xilinx Axi Performance Monitor device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml: title: 'Qualcomm Technologies Inc. LPASS CPU dai driver bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/ingenic,aic.yaml: title: 'Ingenic SoCs AC97 / I2S Controller (AIC) DT bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml: title: 'Realtek rt5682s codec devicetree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

