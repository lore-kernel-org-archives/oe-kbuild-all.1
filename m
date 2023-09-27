Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECF41FA1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 13:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695822859; x=1727358859;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VzwHbqyeWaBlWLi6LgxHlTuu2WFmp833MnDLxxyqJcw=;
  b=YacmzrYo/wUwUl08e9/Zk4n3MOdo0JCGJ9FTfWCS6/EdQfBSyzR50uz5
   XQ7I+gntmI8cknxKnDQrcSpJqDgU8TI0avE3VZLvYEYW0PdMT+HnJ8mzT
   IT3qY4exuifDMJM/B9cHnL8VWFTv5p0a9evOt/RPTctRNPVi6UY/uBY4m
   oyJSbwoVTudY4Lc0+sOC5zoKqLOTSBGZEI0goE3IdLzzdcYlykRGtNd6W
   0L5PeK9gPEn9vn4TkV6sbl417IwaolBRiXox/MzBe6d5f+LqOs8YPFcHZ
   xG7vuRXas0VX2tqqJ+m4EV9sI7QrT7iCD0oX5oIK3r4dX9ebs2l9KzeNT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="468111818"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="468111818"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:54:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="698890533"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="698890533"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 06:54:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:54:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 06:54:17 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 06:54:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nENYRvrH/Xh8LJTmdVOJligWBRGsMCyeBWCjNHxeFp+nZEtHL4E0FsoeurV42zZE6CgkEXTUWLJlD4hy74iBzHDUfdzbL/xGpM4aLCx2639sS9fKY+w0ZcmU8TPJRHYwqRVBehLNNJ13qyBOl+qjo7/S8TNYsMpOM42CEtVk/3vfo39fEhVZ8vsU2oze6Yka+RNOuY/hAzYKsZXWJo2LAV61kuo0yiu6fEypuyFl/vcu6EfpWUWqt0ZUFGOPfdjGiKRjXVCdEQcaRQJwEaR/A6xrQUOMFnKm1ny5UAaryEIRlgUX4fHwDQ2bGtMzCgP8jzdcXqr8d6WtaXSe+h7LmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tX630/Gjdk8bg+Sgo1L4Zbd2U/LwxQveDmaW3R7+BOQ=;
 b=nFNTM2luZpspNzwMBzFQ4C1scwCk3ptP2zlHOg3tsYlKgxyx/STLbflf+PBUkdDMikZIimrdcrRKEW+1zGVvaetyTBFhZJZxsm79hUQif+tqHFKr+HJBS8fMHueTVx2dKrzRpv2t+Ho01/JWDKdWII6nr2LcJlclw5NKlkJwfY0D3Z2VabgHrr3HKsJgGUlxXcBqFJrhBPxkHfp14ovJzdng9UOYMmUOOxWHsi6Ao138xxAXIwnD9bA1rC9g4ay+cuJ5qfQinyWut9KlgCSdCoX0pfDVHOLJJDFyYwuL79etgSDx4arkET5t13Vqq8Q5SyasizM0j98lCOiJC+P6ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
 by DS0PR11MB8737.namprd11.prod.outlook.com (2603:10b6:8:1a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Wed, 27 Sep
 2023 13:54:14 +0000
Received: from SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d]) by SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 13:54:14 +0000
Date: Wed, 27 Sep 2023 21:54:02 +0800
From: kernel test robot <philip.li@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [frank-w-bpi-r2-4.14:6.6-dango 7017/7085] dtbs_check:
 Documentation/devicetree/bindings/block/partition.yaml:26:13: [error] string
 value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <ZRQz+gZVZS2q5Qyo@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3006:EE_|DS0PR11MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d0389f-5cf4-424c-5cbe-08dbbf613beb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vQNJUAhYYH+Hl/Yoy11TVF28qp/lbm41JjE4sZ7/tNo874/lWcAClgPBQu7R5PK0/tfQ3XlvcH8kBQTFtopps75SJpF4kziut/p2dmWkLG8/vyt9ni20dBu91dh7DmKVkItNJ7leZ+1ISbYgYb8vcclNsnW97n4fdlvcJ3p2hRqN8C7lXCa5cxLNnrHycbJ4r5BWc6Z5SBrURu/476wx7LwJwxd1PWmRCwgOL4Fdgwt1gOk3Px1k14glCnAZ6zpjQALNZTUha2UBR3Sy1oLX6QtdxpC+gqjsnKzjk1eGGHjFvnXgmIlVgkK6vVY71BPwNsoqEQTH3Trpx0dab9Idvp4RmtEXcw3ikF4rOe9QTuWVVcysZF1PU2lu74U42+/4yJio8L5221wqVKV2nFVEak58ac+47PkLp5626ThGMcU610AynIuFYhbWAhXnyhUSFMdizWA9buTWZ2J3BXE8JG6T5VfVcQJEqev2RHsiAxtWIAPSFvX+C1ktTbfTzjWh11kFCAfdQPATiGzbS8fxAbQZiqSf3Fu0jpHZQ3K2mU+sKdfEA14KYYbJE2hT1jC7rkjRlb29fsGsuQiLKd3WGu1BvJgaraETIqLgpoqxg8qxBQOzEzhoUeh+OFDSBX+vTbX2HT4qXWB5geETHS3Zug==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(39860400002)(136003)(346002)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(6512007)(9686003)(6506007)(82960400001)(6486002)(6666004)(26005)(66476007)(41300700001)(66946007)(6916009)(316002)(33716001)(8936002)(66556008)(2906002)(5660300002)(4326008)(38100700002)(86362001)(966005)(83380400001)(478600001)(8676002)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TtKsoKZeCKBJg8x/DJCXxZjxDK+9IB0lNhH+fvkw/gxAnGbxyxQzyLtQCZbc?=
 =?us-ascii?Q?bYpsb6/Y2lB8rN7Qb7oUMCxayGb6o3ulvB++ghG9g2yvu+X76jGaxwcDsIrX?=
 =?us-ascii?Q?ovpx1qzDVK4vmbyWAOUshkl0l9NKkqk+yKKvAs9h/NddvaAlOMmzqnJXH7tM?=
 =?us-ascii?Q?R7jnn0xJR9/sxgcpO/ObkKLGK8OKPqtY2y/ftsocAL4Iza2CFq0jscJfHE5p?=
 =?us-ascii?Q?tD+qkxIkqvlKupbNDLiUPcnp3p8LZFnRkY1fYTgpltHUVlOBMh349+MpFwQu?=
 =?us-ascii?Q?MjsOtmf8iVLy+h9zd8aMKnwT2HobVneLG2prLDwYbR/oIvrMfQIlJNJtF9pg?=
 =?us-ascii?Q?gwcwE5YMrv2RXdZuyvq+DokYE+sX2Y1Atg5BujGrCwlKwyrYu6+Sg36nA9Rr?=
 =?us-ascii?Q?Pc28thCMakC8nO6nOSdl8YeEpJ/Y8PkIQhuNITwnqAcZ7AvrWPBUotsPeVTl?=
 =?us-ascii?Q?4sHqBj21tOJzg7zKN6+tuTPu9t0GEgCDaVK7rWbSTRxuF57kjD/YETMhcCFc?=
 =?us-ascii?Q?gx7+JDf3Ae+Sam2JAXGzN0lfHbqAuBWurjkR2+gB5u7OiAyGbFCQwx+AuWJS?=
 =?us-ascii?Q?zyaRx7YxMFq2ZbQf6FHP/Pp7Df4Sm+PZi/fDxXgvbbljcafDsdJ9lCk9/eqy?=
 =?us-ascii?Q?KKV0CTHdfOEEh2Q04wxl2CY/OdN49dnz9oCP3jGPHlaioZVod6Aj3Dz+wlFL?=
 =?us-ascii?Q?VfYHzq+tuzCE3k5GExrmfDR84J/r22rVXZmwu3hiq3iKpRCfxZZ1W5Tin3Hv?=
 =?us-ascii?Q?Ftr6AP9Fox8NHFZepVig6V6HrwWLXfdHfkRSPbm0L3W1mStyA36KWx+UB+Ec?=
 =?us-ascii?Q?tKraC7PEoOjqkqVfRa33IWAgH8JlTRegGRyzeLc112mCkSec+82Y5b5xqD1a?=
 =?us-ascii?Q?d/tk4dcAHIJOKvXuYJ98PZ97k+lGABDCLgD4fLoPW4OlogFdi7UXKFe96OMP?=
 =?us-ascii?Q?Zrbcp3qZLBKgOGSpMb3veQZoh92lowrWkoeSjMKRCj24ugcy2tid66FWyhCu?=
 =?us-ascii?Q?760WWWvwWjat7VklwCs2bYBgegp/MXquT4k8vr3Bh0HUds0ZVkHIwYzNcvfB?=
 =?us-ascii?Q?mXZO4dfiRCwvPl+3w+Lp6PtEinQd5+gMJ/4t+X3Jn4t3tzbCzUBvWwxipaPP?=
 =?us-ascii?Q?el2YSfof/82PhCNAd8O5XsG/k33qSnY0DVpAfSJGDx+2YmWEHU849ZH5sg8w?=
 =?us-ascii?Q?IjqV8sOuDlp8KW1nlBISjc+YYP5Q6ohqdc/WLNQFsN2XvawgJNKnOdgV2SMI?=
 =?us-ascii?Q?Cs4IK2OAZHNaIsm5zHjrocbw206CU1zw668OdFDAE8DLXtOAKFyPrIUQ+6VQ?=
 =?us-ascii?Q?0lkZc375lyRsFK9NlCO0rBChqRvkVuV+8/8JZJURUdBGQxFG0zNq327pEUYY?=
 =?us-ascii?Q?Y4MJpQZW/FMMO/pZ5mrmIRufyOZE/AWR6RPrF36GA6nq05R6OpnDjV65nX6b?=
 =?us-ascii?Q?bfqIl4mpcfIGAa0GrPXA2OflcpWU/ygQksdcGnZsCDFYgEgzEsl9VfgnCo0V?=
 =?us-ascii?Q?MM1E7mSkydyNDAhRW+i5RRzz6/HC91T9pcgxYDcaD8NwxDsPAGjVth23SHcC?=
 =?us-ascii?Q?lPdQhsMMhan/Qz7DF6D50IPS3u1FkqGG5rRByubI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d0389f-5cf4-424c-5cbe-08dbbf613beb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 13:54:14.3718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xX6ItnxYm5DUWRNhrsZf7cWhObazo6pPk6cjmzOuZt7pxDph7NRKzATYXoTVka1pEznsR2l0VS9ijBWn4L9lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8737
X-OriginatorOrg: intel.com

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   1c519676c30e4e5a2acf84784a1e524528bf664d
commit: a0250b667b14e1ec983b9758d07d8244583558af [7017/7085] dt-bindings: block: add basic bindings for block devices
:::::: branch date: 28 hours ago
:::::: commit date: 34 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230924/202309240708.M7L6eM8C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309240708.M7L6eM8C-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/block/partition.yaml:26:13: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/block/partition.yaml:31:13: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/block/partition.yaml:37:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
   Documentation/devicetree/bindings/block/partition.yaml:40:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
   Documentation/devicetree/bindings/block/partition.yaml:43:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:18:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:23:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:29:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:32:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
   Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml:31:15: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +26 Documentation/devicetree/bindings/block/partition.yaml

a0250b667b14e1 Daniel Golle 2023-08-07   8  
a0250b667b14e1 Daniel Golle 2023-08-07   9  description: |
a0250b667b14e1 Daniel Golle 2023-08-07  10    This binding describes a partition on a block device.
a0250b667b14e1 Daniel Golle 2023-08-07  11    Partitions may be matched by a combination of partition number, name,
a0250b667b14e1 Daniel Golle 2023-08-07  12    and UUID.
a0250b667b14e1 Daniel Golle 2023-08-07  13  
a0250b667b14e1 Daniel Golle 2023-08-07  14  maintainers:
a0250b667b14e1 Daniel Golle 2023-08-07  15    - Daniel Golle <daniel@makrotopia.org>
a0250b667b14e1 Daniel Golle 2023-08-07  16  
a0250b667b14e1 Daniel Golle 2023-08-07  17  properties:
a0250b667b14e1 Daniel Golle 2023-08-07  18    $nodename:
a0250b667b14e1 Daniel Golle 2023-08-07  19      pattern: '^block-partition-.+$'
a0250b667b14e1 Daniel Golle 2023-08-07  20  
a0250b667b14e1 Daniel Golle 2023-08-07  21    partnum:
a0250b667b14e1 Daniel Golle 2023-08-07  22      description:
a0250b667b14e1 Daniel Golle 2023-08-07  23        Matches partition by number if present.
a0250b667b14e1 Daniel Golle 2023-08-07  24  
a0250b667b14e1 Daniel Golle 2023-08-07  25    partname:
a0250b667b14e1 Daniel Golle 2023-08-07 @26      "$ref": "/schemas/types.yaml#/definitions/string"
a0250b667b14e1 Daniel Golle 2023-08-07  27      description:
a0250b667b14e1 Daniel Golle 2023-08-07  28        Matches partition by PARTNAME if present.
a0250b667b14e1 Daniel Golle 2023-08-07  29  
a0250b667b14e1 Daniel Golle 2023-08-07  30    uuid:
a0250b667b14e1 Daniel Golle 2023-08-07  31      "$ref": "/schemas/types.yaml#/definitions/string"
a0250b667b14e1 Daniel Golle 2023-08-07  32      description:
a0250b667b14e1 Daniel Golle 2023-08-07  33        Matches partition by PARTUUID if present.
a0250b667b14e1 Daniel Golle 2023-08-07  34  
a0250b667b14e1 Daniel Golle 2023-08-07  35  anyOf:
a0250b667b14e1 Daniel Golle 2023-08-07  36    - required:
a0250b667b14e1 Daniel Golle 2023-08-07  37      - partnum
a0250b667b14e1 Daniel Golle 2023-08-07  38  
a0250b667b14e1 Daniel Golle 2023-08-07  39    - required:
a0250b667b14e1 Daniel Golle 2023-08-07  40      - partname
a0250b667b14e1 Daniel Golle 2023-08-07  41  
a0250b667b14e1 Daniel Golle 2023-08-07  42    - required:
a0250b667b14e1 Daniel Golle 2023-08-07  43      - uuid
a0250b667b14e1 Daniel Golle 2023-08-07  44  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

