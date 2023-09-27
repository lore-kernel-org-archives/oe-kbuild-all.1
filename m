Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C9E107BE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695822467; x=1727358467;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=IvFTe+doHs13i9P0ZgW55ecUUfpk0PJfabxqFn+7pVk=;
  b=QrvF+9GNZjj+KqzsPZXHE1zvW3YmDD+Rf7KCQnAlElxtj1SwImGV4+UX
   1aLwvESk0C3wNdpP8mueCvM4J3sKXb/Qw5na2Mz3RFddz+xVrHnLC8VM6
   5L9E4RXv6BuWZ7kaKXOE1h6ardI/6SJfVOkTCeTr4AzbWuoP0QBChP1NQ
   JBZzgAKswUk/M9lTqj9TOeFpu/2Et1kxAYABpX9yi2svnW7qdcUSEg/3f
   qjiEaJ04GYW9FffliOZ+/GlYUaAIkht7eMLk9axz7AAGV8YIJYPZ2Q+Kb
   w0NbMX5wvQCpKWhSQbq9pgxL8MdOe0sOT7oc8vxryuas5rpZFUtDZLZO3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="448319088"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="448319088"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:47:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="698888083"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="698888083"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 06:47:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:47:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 06:47:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 06:47:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYX0mZXC40yRSzAOJgG4a5FBrww131gC2bIdLpNrn/lWNa4SC+El7XYwFsQ4+Wo+4zVb1RliwOKBWJxumfpqoR6NQKx3R4Mb8MJrpArfuR/p0FIIF6i05B2sgQQ+E+YN/KKJ3HULhPYHaQf3tPgvviE7QnmitqO9jWJnLczr5xk1cTCzeVsi1bV/R0ciEYCqXOV0L3Om5WQBOpZCNrpSi87F7j3cqtyIoZOUqV1C4sNfS5/bWwepfbXsV06qCcmZp5nemfSFAA2AZv6bDCtoGknQrZJgPRqoK/nesB3ClWJkGU0GPd5V/h1PaXhhg7tBegsg/+GJf2Inq65DhfBBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDBl6QlDOuU/ttYAIPf4SB7jkGlPJ6IzAZxVOmWL1pE=;
 b=KHEQx6+c8rByt1xBB/E0m9aXxLAbeXQByyuPREIgmK4Unj2/95jIIJs7pI5vGMuZ6ZDmF9JcpEEEdZJRkPboeoAI47XqT8NRERNGCSXYJ6ebkgtHQfAR0d+HmiNi+u1j/S0XWlTgf5FUEEwDiZptNj6RVJp9wZuu5Mgpa+QYaZrqLhzHFfGUUjQWXkCBwab4jpCxNPaR1NMCSBzr+RRqT0XTg/zzXKPhVuM7DeYnjcHDRkZMdRFFdJ94VBr19d2gGrcnOCrcltCX8elbzqMdPu+8AEFA1fvWRnW1xMqepbNaDQgIHkhk5AGERUyxjDXYv0KjDSsdoowbUHyWeor/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
 by CH0PR11MB8141.namprd11.prod.outlook.com (2603:10b6:610:18a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 27 Sep
 2023 13:47:42 +0000
Received: from SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d]) by SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 13:47:42 +0000
Date: Wed, 27 Sep 2023 21:47:34 +0800
From: kernel test robot <philip.li@intel.com>
To: Lucas Stach <l.stach@pengutronix.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: add binding for the i.MX8MP
 HDMI PHY
Message-ID: <ZRQydiamvGVEqo3Q@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230906184211.1857585-1-l.stach@pengutronix.de>
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3006:EE_|CH0PR11MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 884ccf5e-3b2a-4dea-935b-08dbbf605252
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MX6W+D1s8WW01NThVKTOJH2x9glgsilVPrxp/Q9GSpO8F9zL7TrwNQmQecsojMWUQoVRxXyeWvvaGsrxW69fpQPboVXujjFE2V8iWl8NVgZIQAPcJ2r8GfPhNV0NFJaOA9erHSvYyhXLVkSsKeiNKv81x5cBnyLlo3bajIa0CaCy3L1APRGbg6b2vhM4kezch1I2/KQoKbAAsaofuCMrsF4fFwbFYNYxwqJsl+q6gDWcGWmYopSIDZv8/l/EcqT0krYh0cdIazFNamhCexpO5k3U1ogXfBedVnjBKiJ+TiBY78jRsn/EnV2pOhalw88dts1SvOp74OGfeSIxRiPGTYe0Bp/1p2CLZUl7+8XjC9smnbdZcfpek2mvVcvxSTSu/vBFtTrFMBC6SAZ7IK/fXH/8F5Vpk+9lN40r4wJTMYYIoashWXjIUvL0gTVix+H3h+uG7F8V27ZeyY25ZTF2w/lkyaM/hniTRqRIy/jz5bYSrdXdfq+lZ5AcePUoM6juDIXtiphNU1CYdtHF2PmvwJXBAkyGsb7kWuRbjFCM3RM9sv2HdSAZQq8Uyw5tNvQLeTXa9vR1t4Yc0+RaiC4DiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(366004)(346002)(136003)(396003)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(66476007)(41300700001)(6916009)(4326008)(5660300002)(316002)(8676002)(8936002)(66946007)(66556008)(2906002)(6512007)(82960400001)(33716001)(83380400001)(86362001)(6506007)(9686003)(6486002)(6666004)(26005)(966005)(38100700002)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mhemWtiKju+o7oe+gff7RwySik216+KrAYg9MjvBStc2nzitV0Xo1Vzbxxbi?=
 =?us-ascii?Q?RiSTCIH0c4+lSvdJnh5Ro0ka+EkFzbq7AG071I2b0fd/ggJa8N8lKi1hEqzB?=
 =?us-ascii?Q?eczEhB1HMToGg2PFstClhXWlo/DQTxXalQCHJQ0xd3oSOHBEo3oYmr0FVy03?=
 =?us-ascii?Q?qh9opEoNQxUPDvVumjDi0uSO8hVWv2Lo/XRjM8mySrNRliWllFMHChpdbBNO?=
 =?us-ascii?Q?jaPggYsc/RClYFJsapMEwu8EStwzXzWX1ip/S4LNC8GCBmcMyEG7spCoNXgC?=
 =?us-ascii?Q?Dk5ygTUiGJU3UalgDoVQ5JCnPhVex/FW7fWhRQTOsd45upVourvTt9WOzYJv?=
 =?us-ascii?Q?kYNRf1/W41Q0LFSkEH/7gTS3jVYeQuOT3lax5uYK37ypviQqaaMXnIawSeOF?=
 =?us-ascii?Q?+FLJ6Bm9HkuE74j77uaSl17J6KPhaI9a/sasHZcpvP988dsLIkv+pliuNCiB?=
 =?us-ascii?Q?VXsuOPUZPjjQ6DT8UeUF+jYWCpMmiy9MbUObKYAFvquP2GeAKNsC1inVYus7?=
 =?us-ascii?Q?XqC8sII8Ow+7f9M34EWr5yK9rcmbdW5fRSuFELsN6+DNyemUs617jkDiizUF?=
 =?us-ascii?Q?jAzeLCwlJhahfEz4rTdpsGAlAYz0LLezvbaK5ZVlCDDrFiUbU9r/vgJYqX0Z?=
 =?us-ascii?Q?QXPewgdx1hVzLM4zng8GsGbi7RMOIjrhQtQbgiRq605XRzsMJMI9KTaX1tae?=
 =?us-ascii?Q?ujPtBA81i4EpbD/jnuaGULT7Z3p7OGkaJVvp3pcBhl5VIXzPKBcdAZaFZQlk?=
 =?us-ascii?Q?cNCQ+eCw8dIwDxM3Cd9RrvH3Bro5p5/W4WTLk/YzDqBnMzTyh/w0dyLT7V0W?=
 =?us-ascii?Q?3hnx3gSXme07RbgemJ0aoEJjjnkhqPfDS+sXG2bpCQGhcVfDhK0bZihMol4l?=
 =?us-ascii?Q?oJ5vYLNQNuM67RL4DHghTocO714TDTt3RPmZqacGvzpZos2tXja1ljyjAZuj?=
 =?us-ascii?Q?0m7tqFVNmQuDWp2TAnbKgUkEiTP66uyiHkbIbwdBwcJ8unQrsu0HQcH5U3d3?=
 =?us-ascii?Q?bfvOodHC5fW143bzzMFK02IcypfiBLz3okGcKHNHUoGKZkSh5v98Nq3OlvDz?=
 =?us-ascii?Q?eJeCGuN6An46HD8oNaMuI1sA4eKgARZKEbs/KweY5UzB4FSoDHL8Hwj2f2mn?=
 =?us-ascii?Q?ZdO/7KmBsL+SWsLumwjWIPbef+YPFoTB8FO/M/G465CgNvO1XosfBjMdIAk5?=
 =?us-ascii?Q?N2NubuA/SGfqlEmNLZHdjWlegEb/uZJJL8/rDlkdeFQSsU4SKhXUaAz+A0wB?=
 =?us-ascii?Q?rV0aWAxoTFji48ALNYAANnQ7GT+6VJqq6QBoeAEoauLb+0K+COmTIq0bkFSm?=
 =?us-ascii?Q?0q1aEGxS9yv3OU3aqVmNAqNarfp9/6hEnGAAe//yBhCgpyY8YPO5qJzjwDMe?=
 =?us-ascii?Q?CaYx9pqIKKGcJGeoTyEYCye0mbT5mq5PHIA2kFpQamX6uMCTMJzVKpu45Fku?=
 =?us-ascii?Q?h5ePebJGOKS9Bqw6P+eqK8LjTINGSh3UGLbXgijYT20nM5dqVsxLyGL6M6wq?=
 =?us-ascii?Q?FHKfCl/GaSvFvR8CY8BJ7eY3tpIYIVkmC2vZGntSIWmW9sT0Yu6SbjeL5kXA?=
 =?us-ascii?Q?OBMc/cb7erAsW2UIMdh/PTrNYEfIpO/y/Ci8zIYx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 884ccf5e-3b2a-4dea-935b-08dbbf605252
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 13:47:42.4719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H35+SpNIESfhmxG9DXJTN1B0tKvJxsJhycu8B6KarhFhIDM4jF3f/k75/NQvuSs1AY9FfHbQIYtpErEpOHa4ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8141
X-OriginatorOrg: intel.com

Hi Lucas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on soc/for-next linus/master v6.6-rc3 next-20230926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Stach/phy-freescale-add-Samsung-HDMI-PHY/20230907-024449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230906184211.1857585-1-l.stach%40pengutronix.de
patch subject: [PATCH v3 1/2] dt-bindings: phy: add binding for the i.MX8MP HDMI PHY
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270258.sXXln4tF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270258.sXXln4tF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml: title: 'Freescale i.MX8MP HDMI PHY binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/iio/addac/adi,ad74115.yaml: properties:adi,ext1-burnout-current-nanoamp: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/addac/adi,ad74115.yaml: properties:adi,ext2-burnout-current-nanoamp: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref
   	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
   Documentation/devicetree/bindings/iio/addac/adi,ad74115.yaml: properties:adi,viout-burnout-current-nanoamp: '$ref' should not be valid under {'const': '$ref'}
   	hint: Standard unit suffix properties don't need a type $ref

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

