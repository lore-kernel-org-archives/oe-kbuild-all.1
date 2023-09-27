Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC1C374DC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 13:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695822891; x=1727358891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2VR+2uG8stWtq5dXp2kNWOEjPso3ErjvCr9DpCqFab8=;
  b=ZkRAwk85SpYmW0RiQv48b/tksGMEbTheEJLooHnNpDcvB0HIU8vLuMjo
   Aj7dBm4Wqn52/GOP5o1r3gdnrXS1P9arrbcv9IcCXPzACZZiGCuTj8z8r
   zXFOk5eP1lVY5IHQBYfCCVK3Bjt+gDsKCSDlxn/abCnXmOhtX9K0t8HQ0
   nLbmSqRD30MmeP11j6hbv0aWmIj6IDtS3gSmqXnsqfZ6rYm8Zu0vjnxhm
   R7iRG5c/tnHvUTDyTT2wpTErLhMdAWEhL5wNskFlZXtXVgV+P93lzKeNY
   hIi4tk8G7FY/0b5Cw8yL9d/B7x3DkmiY7Z2lQyd2ZDbZoYEsqwdEl5385
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="425507"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="425507"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:54:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="814871199"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="814871199"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 06:54:48 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:54:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 06:54:48 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 06:54:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrEqOqTKK21+XrYzjjENChSn3Oyo0gt290xPngUWbacxB2FpSbuHWcTKPC4yyh0TOLlvi9qfa5b0lbKGWhX/eqrn2MTDenl+xCu17YZJepjXBNdgvcKHEf1Vgcr5Lr6pBSJcYToIhdRIpEAB1Fr9MdsA3xcmDYLCN8ZK6gjjiAvIe0c3vQ7/omEaEHHrgf3UREvEhdfefvmNzRFu2R1zGfXcV9xLijIMmPPzJxRxh4ZDyyocihiaYIvoQG80JI/C4OX1PbxmImiw46uA+PkbjeRGnTUk9HOkZHuIVZfqeg4/O456/NnySTapz2Ic8YrOr3zY/BgRfQpAgwnDFLp5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSj9F+MJO6kXPJRltWwebD+5/xjVcxdDjUl6dYAm7A4=;
 b=hY2OaerGgftwqcIO2XHoJJROCJwAiVhWRlcZh7dmj6zn1z1fSCh9iKTxB1LbRXvd/5wT+ei4P6/EM6Fu3W5XENKL0W/EiMTKWMwlht9vCcxCQ+RlOpKr9zObemRSK1Ofe67EvzIEEPgyQmMDGRczli9bVFrjmGQAxvLucIh/6gmQKslFdw2Z8TDlhvrsdaxFWlXyZJGNIb6yRNnuXRF5wUJ0XgqtaLrIaqZDw2MDmHbXhUfKQPVBDAnjee92SNaeZEEwGBKkRgVJ9z3iyzfSw41Bg/8CipvDlrW816zu3UTYPTClyIMZpLzXU+eK8QGeM9rypoCk/4Nf0m2U2h6iEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
 by DS0PR11MB8737.namprd11.prod.outlook.com (2603:10b6:8:1a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Wed, 27 Sep
 2023 13:54:40 +0000
Received: from SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d]) by SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 13:54:40 +0000
Date: Wed, 27 Sep 2023 21:54:31 +0800
From: kernel test robot <philip.li@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [frank-w-bpi-r2-4.14:6.6-dango 7009/7085] dtbs_check:
 Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:18:11:
 [error] string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <ZRQ0FxVJ7y79q3ur@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3006:EE_|DS0PR11MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ade053-2b1f-444d-ad71-08dbbf614b78
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xMRHgYfU5K5S8nhY9CyiH9pHCQUC4fyVmDqroC+E9wVZGMqnyPKUHWwl7uxETibn4eFasv9Ta485LPKNUHF6XUcLjo5iYTLOIaitWH7PjImd2qxLssAovamHc+UnQgRlaVX6KcfU0HwgN003qaJ1EVZb2Xr9SEH1Y41AzoTf14dbHhw1iY6WHyBwqBVUEcY7TKQ2//L8DygBLDPhQklXuXo6M3woJWPYVYdViKTk/ItDRc1d0BbH/CKl/nuVVF/lzsSnM01z62HbHBDo3QFbeIbd7t+YAZsbSxOviduxH0CM5lvolCx/B+CdrKEQkRnaHNp8DtExjGFtgY/KSnxr4T9Pv9o5gs/+mgYQH88rHHIR1qOnY89m6WhnqMaK2GnFYoU+emddkI5KyFO2YYzeMEkxEArCMqUS4MGFcDlG+NwRxxrE/yytVqKVV4eoTLVT5lctTgJHELjHHPWBCm8p+0lZQlP1IFcoT1i9Btgj16E8AEU/Y4KzglE3s+RhG86nSPc5BFT9XJUJsvB3zyjpJ+dgr//S/AxBSUSNrJQRWdtZA/P6/45OM9+52CsaKp/ny/kwW2kEneVtJ78o3WwOhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(39860400002)(136003)(346002)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(6512007)(9686003)(6506007)(82960400001)(6486002)(6666004)(26005)(66476007)(41300700001)(66946007)(6916009)(316002)(33716001)(8936002)(66556008)(2906002)(5660300002)(4326008)(38100700002)(86362001)(966005)(83380400001)(478600001)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Sy7g14sin1iIKdP1MptZODugSgCPd0AWsQHGcB0a8j+AvQw55LviE2rkd1/?=
 =?us-ascii?Q?lVU75pOd0Rhe8aFsMxy8QtrimrY6PpjdvQajTXUgqBYcY1KiafQ/ia0TkIO7?=
 =?us-ascii?Q?Veqp2qPm77byp5FGuKDWutIzGmVdAaqwixl4YLiQea89NOpvtyxjaFqXe/5E?=
 =?us-ascii?Q?m6+qTwtUZyZ9LLZbt9RD5I4oDkNPjtXJCh35Xd8xF+K0fEv73FrCw1Yx8j6z?=
 =?us-ascii?Q?hWcjGxil2E8RHyKnJ7oFP8+ThxeLm0FkeBSIhxlxwkwKmURxWDL/pjbQfmOK?=
 =?us-ascii?Q?/krOtmzbyMprbOMONxpJ/0vNTkotQSvTDDHhjJaAX7TcJtGDv/YaSyglYp41?=
 =?us-ascii?Q?4HiiWBm4j+MRZVGjRo2Qgo6CCmdIdu7WpD9CkOmaXiyqIduHPhH7HtzSn7L7?=
 =?us-ascii?Q?ADSrdwieGTK86UD4nVDjdkSwFQeXtK/GkS1h7ePJiwqDMdRz2+AQ9DWDwcNl?=
 =?us-ascii?Q?FlDflkkU1NvbaKg/cRJgg98lBCdnqoCTE3DLHI+0ugHKYI7E8zOQHiHqC5MQ?=
 =?us-ascii?Q?2Tvn4avjM2htXCzMZX0YSOcTxnrT8fWb+aTdSyFpzKBnd08pYPHaFuQQR5+8?=
 =?us-ascii?Q?Mma2koFzDwD4aMBvojGeFFlpPotDfkUNrWFTJzirA0mMehvyUH4OJULkl65o?=
 =?us-ascii?Q?WVySTUgHU73UE+jH12GmLNVO33uspW4jtnnNC5xdcPytHgrCLCnIEesa9eLR?=
 =?us-ascii?Q?gQJSZevac0pxVSs/nLZgNZZP+5Wq+30KuuthuWaBRzeLQQDbhGnqYins0aOS?=
 =?us-ascii?Q?Is72B+Zs/NoTP7WVBCl6GjtzVVXK7bW44FUVpoaDzIFGVOtpVQ614Y7jn2Mr?=
 =?us-ascii?Q?dmhHxTF2veCMaFd7nqFfOz9cZE6Ccq/47v8j9jNc6YYgnLrweUZtmvfZHYLC?=
 =?us-ascii?Q?vih5rXdSZMdY3NXZeLr9caoXNER0O3CX5J9unoMvOJlSpPu/KXLfQ0JHbfV8?=
 =?us-ascii?Q?06KImVQaGv37+mYXESXhCadydGls246iU8oybTafXtaJGXrEHueXELRnab/o?=
 =?us-ascii?Q?UzG9yRHnhVrZutZNngOxsuyD6ZfaLH/hqKgCw3XSz78xnEgubXP6Z28aWu+S?=
 =?us-ascii?Q?8nVNCXB335pMFOO44digkd8la2T7EJx5BQtiv7vOpLtdeG4RiiatgQXt5+FZ?=
 =?us-ascii?Q?sevJleenIa5fEThgPxAA2otDC0nA8MorwiCHo6laV8sJCzf9jNaMTt1xJEEM?=
 =?us-ascii?Q?icm3gQaw9pycQM3EOQO0vdl9u+8d/HBpD/v6X4ylE5BUtL3mEp33gDVzfcPS?=
 =?us-ascii?Q?42MRaxz2JDI48FCGLNGNxqNzswtHtZHQ7GIR7TSuKsML6dDKFToNNl/cALDo?=
 =?us-ascii?Q?tkD6FumCDi1a7OvusIRr5ta+DEFez+PW/Ta6/v2mmT5DsoXTgp+5OfaQCMAq?=
 =?us-ascii?Q?GiVJPJJBRgK6DEZh8bfDa7fs/zCp0Sfqcft+MdXM/n9jgVqHinpGR0L3WEF4?=
 =?us-ascii?Q?Frda33ad7Yvy6zNZpn5reZSgA74BCyOYlwjmXJIktxFXvLtk3IycWlvbd8Cr?=
 =?us-ascii?Q?asxmcLwd7/UAjemwy7gr0YMgqLDl1IVsG+gFaIQ/Pzdv1bk3XRA6wWFgqHrO?=
 =?us-ascii?Q?fkjuyH87Bm/nzluhtao9PZLOyQVed7Ub5EcfFzKW?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ade053-2b1f-444d-ad71-08dbbf614b78
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 13:54:40.4210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qH76+Y94MzNR3sGtxBuzp4sgkl+0efUg3HNUE9oVi4nj3a6fsvCdChFiY+itdOk+g3LHh5zQfMQ2i4jilErVmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8737
X-OriginatorOrg: intel.com

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   1c519676c30e4e5a2acf84784a1e524528bf664d
commit: 12d0338fd07dcecb5151e18c5c96777c6addd8be [7009/7085] dt-bindings: mtd: add basic bindings for UBI
:::::: branch date: 27 hours ago
:::::: commit date: 32 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230924/202309240545.Ijy8Ra4z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309240545.Ijy8Ra4z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:18:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:23:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:29:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
   Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml:32:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
>> Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml:31:15: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +18 Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml

12d0338fd07dce Daniel Golle 2023-08-07   8  
12d0338fd07dce Daniel Golle 2023-08-07   9  description: |
12d0338fd07dce Daniel Golle 2023-08-07  10    This binding describes a single UBI volume. Volumes can be matches either
12d0338fd07dce Daniel Golle 2023-08-07  11    by their ID or their name, or both.
12d0338fd07dce Daniel Golle 2023-08-07  12  
12d0338fd07dce Daniel Golle 2023-08-07  13  maintainers:
12d0338fd07dce Daniel Golle 2023-08-07  14    - Daniel Golle <daniel@makrotopia.org>
12d0338fd07dce Daniel Golle 2023-08-07  15  
12d0338fd07dce Daniel Golle 2023-08-07  16  properties:
12d0338fd07dce Daniel Golle 2023-08-07  17    volid:
12d0338fd07dce Daniel Golle 2023-08-07 @18      $ref: "/schemas/types.yaml#/definitions/uint32"
12d0338fd07dce Daniel Golle 2023-08-07  19      description:
12d0338fd07dce Daniel Golle 2023-08-07  20        Match UBI volume ID
12d0338fd07dce Daniel Golle 2023-08-07  21  
12d0338fd07dce Daniel Golle 2023-08-07  22    volname:
12d0338fd07dce Daniel Golle 2023-08-07  23      $ref: "/schemas/types.yaml#/definitions/string"
12d0338fd07dce Daniel Golle 2023-08-07  24      description:
12d0338fd07dce Daniel Golle 2023-08-07  25        Match UBI volume ID
12d0338fd07dce Daniel Golle 2023-08-07  26  
12d0338fd07dce Daniel Golle 2023-08-07  27  anyOf:
12d0338fd07dce Daniel Golle 2023-08-07  28    - required:
12d0338fd07dce Daniel Golle 2023-08-07  29      - volid
12d0338fd07dce Daniel Golle 2023-08-07  30  
12d0338fd07dce Daniel Golle 2023-08-07  31    - required:
12d0338fd07dce Daniel Golle 2023-08-07  32      - volname
12d0338fd07dce Daniel Golle 2023-08-07  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

