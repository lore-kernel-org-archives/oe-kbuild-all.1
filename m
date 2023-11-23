Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB31319465
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Nov 2023 08:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWsRHs4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700727677; x=1732263677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ytAdOZub+JcluitejvtpNjrnwYgyh7oznvm6E36/asA=;
  b=gWsRHs4tlDR5ExZVuzzF22AyyzWXYhallU25Z5ueNjR+WLuvCfF00gI1
   vvXWF6nwJCSVjCpY8oGQEyQhIS7FKL+vlrvN+Fa0mz8ozlJv5yL3dL0Sn
   xQo1+mUZTv9IR34tgNRafrQV4KrOjn1Ot1y+yn9+5yFY0Q0GStUX8k5fG
   W1LBssRIYAEuJLDFvCV3b9IrTEHM599zt5yPBDdFMyj3Kg2E2zXuVY79i
   qg51dW1CfOyFCS0YaiTRLWk68/NPMA/XXQG9/RZq97EUr+bq5nkIM8xE6
   BVp2MQe45r7je/fguCzdJzMzOp/FjG6ZHXSdl0MN6Fkjh7RoVV5wd1L70
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5411348"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="5411348"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 00:21:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="15581943"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Nov 2023 00:21:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 00:21:16 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 23 Nov 2023 00:21:15 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 23 Nov 2023 00:21:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRx37SZAvhw6bPCZYcsMphWqMyXdDHABMgz/6OFSxXIrl0rT5pLdcroso5R4JLs93qGiVg77SJ1HwvqWSKejot39XULPUxvRKW0PHbfjZi3BmWZZ6orb8rDbQr0X/V69Rrjpgcg0CAMvoKl1M8X9+tD6QUrfqSqwMIWp46fv7bYHwIHFogXknITSOs0jsEHXvWrdk7oLdb63tkhnclLu2lIUyB/BtJGeqOLBLI1t/NGtDIfAK/6yuOIKiInvqrRpLob1UCV5cWXL1JANWN1ZkLNzQHQVrpido4tFFXC+gCxP25rfcYI61fDoBq8p5L3Z+MYwSSAepbUjo3c9SMlQ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PU57Qnw97/ST2i9ov3kEhZ+e7wRGULtnKieICToQo7E=;
 b=CwX4niI+/DfkS5ke9MmxlA97WzOR/g+9al02Lntzzu33Un2hDwnCCByIyNcWdrplJCyCVAP/IOin/XLd9wwsM0usO6Qft1dloL/BUQJ5OKNirpdxGvjHsaw78cTOVrK8ludUfRz7bJH0U+x53y6THI4R1+ZWW4w6aiKAQ4T/Fk77llZlcpmPmqQhOlBluPf4TP0LM6Z+aaB3EW8xmOHaEitsqUUY8fY/cU/oiA/wRS0Uj79+3ucFH6MC02h2kLBPjAJTO7plQytEqo93MzdrW/14jY3n5jPqaLjVvt5j9ApK+0h3PBP8z5A9j5KS2UcdtCcGTGnGh6nxekX1l/cnUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Thu, 23 Nov
 2023 08:21:13 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.017; Thu, 23 Nov 2023
 08:21:13 +0000
Date: Thu, 23 Nov 2023 16:16:36 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 7/20]
 iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared; did
 you mean 'IOMMU_HWPT_DATA_SELFTEST'?
Message-ID: <202311212250.lTDgKUwk-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0029.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::16)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SA3PR11MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b368cae-d870-4ebf-56e8-08dbebfd27d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 00cFyG72pfGy78z+ndG5zZUFRMd2M8HKhvTqCJTd+IRl1TFwkgqkCyC31p5fZQByYAfdW9Y5PyyMJ+AVq0F2R3smdSrfSzvhvN1SyfKcLlUEkuqD9O9T7ISvSjRows/BASbG/1+GfQXAhf8KXdpOuZS9DOztINXwkmN7IYWBMwF63MriibfiBB+K5/eTS54msX67NjMX4Xq6dGwAACGdvNrlJB7GCPTowMlavChSYOPMsvY3eNydXEsaFUsrV8gCMx8/FddJzMxoUBcX2J+05xru9UXhYTEePgINkLMl9+MqzHr8lZJitqju7EKdyhXUcEAwy1rInCemBBzkgzBWo0Ys1b0WtWWIhFN04GhHPoEvxbvCQ7QzOs908rPRhmVJigXbj+2MccfCiDcs11e8MveIBLrGYvoAjjkPxNm0gEl60S0PdCwII2SzbfUUk1w62RPINaXShvAK4y22QxqFUb10Vcc9qvyiVe7f+w4ORrMA7un7pys4XbeUabs2SVwQv/5S/fVsFaorwhMcY+sOHf/cbbedRTKqCIkp/VUXACCvWmfupngl+dnbNTQmgt6MgTG9PBMA48Jn05wSjbo5AQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(1076003)(83380400001)(478600001)(6506007)(6486002)(26005)(6512007)(966005)(82960400001)(6666004)(316002)(66476007)(66556008)(66946007)(6636002)(110136005)(38100700002)(2616005)(8676002)(4326008)(8936002)(5660300002)(2906002)(41300700001)(86362001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y61mbxgSPQybYds5O5DTy6W+f9ta2PgNjAZyGsnpPk7eJFOpDWory9V1/vko?=
 =?us-ascii?Q?L0XtX+OnZ4ahfaKuogV5l7w7R+UUsrSe1vUFru6yi2zMMMSt0xiIv2I8WU9m?=
 =?us-ascii?Q?MElI4LwMii2z+F9MGZw/j117STKRtUhhuI/m9924A6/KRA7TGHEKLnH0IOav?=
 =?us-ascii?Q?vT95Juc63R7YpWOUnMPRbz3aVEub4S8pnZLxmrD0b8BB8f55dXK8GX+92Ty1?=
 =?us-ascii?Q?BsgQiKuSu2iDKB/LXjo4BN8BhSHUKH3K+wUchSQdGy+C0WhnMGTcjsIcE6W7?=
 =?us-ascii?Q?75RG2Yv6p3uU5UtHS8SR3jVmOxd7QlguLXCG1HUwTrT/ExjXLYKisFsGnoed?=
 =?us-ascii?Q?wtfBdTnorxNpeNB6YdP3XXh62znnLYJa9crdLS3dgJBPxULtZNX1LVwfMAPF?=
 =?us-ascii?Q?myzf64s8Kbwbghl/T2GSCgy9QFytVS852a9lr9p/kfDueJHYw79zVjsaJw7n?=
 =?us-ascii?Q?jQwTIgfY8OO99IHSrJfxd3RHQKcRlq38Muz79DGX3U+9ESQyU9c5usBCwiRT?=
 =?us-ascii?Q?OMdcZqhBf06tfNdVie4el6I8zem8CRo+cQ4gBPZJ24WivMK2hTLyN25MRMR1?=
 =?us-ascii?Q?ZXpOYzxCCf77zTzw9gb6/e037NQWV+I6q+9ajerkOJbY9ASmJADz7ipvrkqn?=
 =?us-ascii?Q?O0mC2a3oYoBsvtllBh3rDvq4OxxJc4NiiZ9Vr8/2jwAxuN5uKBqgtrLoMTzL?=
 =?us-ascii?Q?cHfmCKXPQyvK4jsFinu2khaVdoex7TNVPoEUr3L91HahBuHLgqoDs7Pad3gr?=
 =?us-ascii?Q?NtBoXD6fcECAllZ5IvYBJRQNAInvK2CIgrgtvjnb5tW+JDzlNgRdVkipWLvt?=
 =?us-ascii?Q?mwUqrQ4dWLKyli9+15OCQlN2kcLe9bUEe0l75TB+PE9VxHRMQNRDscT4JZ4g?=
 =?us-ascii?Q?tU+CAIEJ/AtGGKvVhu5BZPt9rgadxYNYqNi6nARGxJNngqJN75GhXb08ByXV?=
 =?us-ascii?Q?NIIXm/2/rZHSVQxqm4YdzmISPZwbhkTfWWVbSDokjZ3SGAb2+eTJwMHr40HN?=
 =?us-ascii?Q?Yk+xLvaCx4DLvsLTEgtf7PUBQlfjhl8jjmyAeKu1aLo332jk5WE1mQHr6/Ac?=
 =?us-ascii?Q?uuvQLj8IRD18OI/WwZMVlq3d3tnODASZBvTsG2ZzikL3RMZ9QbiCiGKxLXRj?=
 =?us-ascii?Q?UbppkPC6CPOYi8t8/QBQTKgDOZImpnrsgPKqTlAA2Rr4fOTva0NkbaAT+Hjd?=
 =?us-ascii?Q?qfPK687TxyYi3FitL1mZTBs5wd5RwsHhRqVHr7fQIUMFKLEltuSo91XUj7hU?=
 =?us-ascii?Q?T+iVUiXbs6lzCoQqJc9rEcf5J6va/CrlnKmq6HQJqYT/x+f6D1rpYYdUbems?=
 =?us-ascii?Q?cpocmgljIWwfgEW5fhfmVelyAyPFsu3G38RGSzzNfaw5ylzzdLgF/y6WrV0C?=
 =?us-ascii?Q?2C/rsqmFEg0eCBxqq/zrTj/MQ9IwiLyM3TnCdjLHiQ++/qJt+R8NPfutMccZ?=
 =?us-ascii?Q?+fLcI/bGQsaRMIJEsflngZDdjplX/Gg/pyVAhhD1uk6rEwq52HNqOFGxjxq8?=
 =?us-ascii?Q?AU9kTObuU8FoOZYiuQHQcToKGblosUxvO7E0ivnXCCrVzxGCPYNhn4SHfc80?=
 =?us-ascii?Q?EO2ME6v6/17GStEIzk5UW2G4wMV4i/493/cAMPA1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b368cae-d870-4ebf-56e8-08dbebfd27d9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 08:21:13.1872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klHDsIw/Asvr2sTg//Lkc2B9PIKvJUpUmEkofGFQoBbr+rCvXPc5qRj+5k1efkmTNJgR1esQlQ8zGV3YvG9Qsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8046
X-OriginatorOrg: intel.com

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting+pasid-11142023-yi
head:   92f313909ee3753f73c9b3341a34aa28116edb62
commit: 731261dcd9270387e7ed95813ad05a02c01006d8 [7/20] iommufd/selftest: Add coverage for iommufd pasid attach/detach
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311212250.lTDgKUwk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311212250.lTDgKUwk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from iommufd_utils.h:13,
                    from iommufd.c:10:
   iommufd.c: In function 'iommufd_device_pasid_pasid_attach':
>> iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared (first use in this function); did you mean 'IOMMU_HWPT_DATA_SELFTEST'?
    2266 |                                            IOMMU_HWPT_ALLOC_DATA_SELFTEST,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../kselftest_harness.h:707:20: note: in definition of macro '__EXPECT'
     707 |         __typeof__(_seen) __seen = (_seen); \
         |                    ^~~~~
   iommufd_utils.h:190:9: note: in expansion of macro 'ASSERT_EQ'
     190 |         ASSERT_EQ(0, _test_cmd_hwpt_alloc(self->fd, device_id, pt_id, flags, \
         |         ^~~~~~~~~
   iommufd.c:2264:17: note: in expansion of macro 'test_cmd_hwpt_alloc_nested'
    2264 |                 test_cmd_hwpt_alloc_nested(self->device_id, parent_hwpt_id, 0,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   iommufd.c:2266:44: note: each undeclared identifier is reported only once for each function it appears in
    2266 |                                            IOMMU_HWPT_ALLOC_DATA_SELFTEST,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../kselftest_harness.h:707:20: note: in definition of macro '__EXPECT'
     707 |         __typeof__(_seen) __seen = (_seen); \
         |                    ^~~~~
   iommufd_utils.h:190:9: note: in expansion of macro 'ASSERT_EQ'
     190 |         ASSERT_EQ(0, _test_cmd_hwpt_alloc(self->fd, device_id, pt_id, flags, \
         |         ^~~~~~~~~
   iommufd.c:2264:17: note: in expansion of macro 'test_cmd_hwpt_alloc_nested'
    2264 |                 test_cmd_hwpt_alloc_nested(self->device_id, parent_hwpt_id, 0,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

