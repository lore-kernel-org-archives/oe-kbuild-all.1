Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A693019465
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Nov 2023 08:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPYlOdTe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700727752; x=1732263752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=02ss5QKObTI26BCWnRvl4bzieW7VyCYM3+Db0Gu5zlc=;
  b=CPYlOdTeQpFvKtKs/8TdIxxd90zRoj2DnlxAGt+k/Ho3YiTiqj4VvVDV
   EJg8Sq6B7zi2/RB11Qti6U8YRmgK6wPKw2bzn1LuvIqE3MFRgrXaQnzYW
   46U+857OAhWuppQfs/1ClxQ0MBbWuhf08Udtax/TIpOYeGBCMj2rQneMi
   6Sq7f8bDYOrVKnqgFpvGLEbmBWSQqt4MWkJr3G1Fv4ao8/XlJ+lV9QEP+
   lw9Smag/PbH36bMbmzHU0Ho1Ghoc9zbJFgHkKwcbvy31IJbRkb9guECeF
   3p5F+L4TdCpOlcNNR8D3+041V5H48D0vqQwW/5P2v/7EDX4nW51pgLZO1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="391995338"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="391995338"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 00:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="767132268"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="767132268"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Nov 2023 00:22:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 00:22:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 23 Nov 2023 00:22:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 23 Nov 2023 00:22:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fV9FhXSt68qSAM4ridoic5jI3NYKFJMaW7PcKVu6nRIxPdzaOHg9NEDwrg+xXfVueU5qd5PEMTYL33teJDJYRsNyrO0+qLQx76DUk0cx/0v/BgyBtoVQn2PC9Mb87YK2mY4FGI0+ix/m9coVq78uAn10PFV8V1BCUmMC3udwFM1Zey7535hmpaBPbXOHd23D+scPu4I7rzCJPtukWsXXTYkxbVMj0ZJrQ0hEfct97ccr/SVTNw9hSEOqswLRzWQ0hYGKpMg7bD8YyY0By2uM7hM6ocSH8MDHQHddVviVbLS4Pru+XGx7o6rnE/+sxIjYzNG5ObKJXdbybALGYmvIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oki7iMYtP4tBY5x7eo0ybYn09dnOEFhs+/qsiCJmD9E=;
 b=MOSEACOBWLhHFohAz35/4SEfwqQPeWWcETSuz/4aJDiDruXI87ygBqFL+LkmD73kYoLGcfdHBAGFB2WcJJsYJn30qb8LR/2R1ILQienwv6GbZd66Ecqb5GztteHI47Q0tRCXbZsAr9/Ot68xkDQM4zY97B5DN6uxZxwXDCz0uc2LxwRMKtrf8ueaUZy9mEPN9JHg84loL7wq2mtpXt0xmAgjbd9lQ1x3UldUEcWcUVBHi9HwsaAoUF+4YpGd369oGgOlq6btAPnT23n8tp/jjpm35aPNxMzl8ia4671yweTHIyxs8ffJ0lOLAQdqWdXcRupVfUtwRLfegqcfZXhKbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by BN9PR11MB5244.namprd11.prod.outlook.com (2603:10b6:408:135::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 08:22:28 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.017; Thu, 23 Nov 2023
 08:22:28 +0000
Date: Thu, 23 Nov 2023 16:17:51 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [yiliu1765-iommufd:wip/iommufd_nesting+pasid-11142023-yi 17/20]
 iommufd.c:1676:44: error: macro "test_cmd_mock_domain" requires 5 arguments,
 but only 4 given
Message-ID: <202311220103.2mel2uEZ-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|BN9PR11MB5244:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e093e1-9c36-407c-49c3-08dbebfd54b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O+SWipq1tF+dJErVGxqm8I2zB97KMnHJzVQcC/X2AnCknKMUo1ZnRFx0tkmgyT+SLG9piH7AZUk6dDHdcKkixYSKc0duIwe0I4Q++Xm+Fg6fCAe2Sw4F+j4rOPHpyaSR6Q92gYpEzt7RH2Jq1HtXMhNmg6gws/dXa8Pxrs87cELM8WZxn58wYjXWXCqLn57SAZMYaxlcDH2+p72cWd0Fo2H9CcI6Sbw7kJWMlJRumH3oT3MZYe0NkArcxUPURxSCMm/cN2MmE4GvC7zWH2r5qGXgyDRt1EQJM5YUyfulwZJyztwSPw/DDRoaH8TL2puXqN55qk1EfcMTZuWc7rbcxXuPPoEt4wOO2l6D7RQxthw8GvY0ygSPnSUr9PuUGKKRIxs2pL8XjGcO1+K7sOEc6C8gLKyeGf6WJHSALu6XqhScQtmZnE4X28+0J9NN8tDSYkbu/eknFT/XqTMRsGC5OeihAegyKjelsQd2b71+K5O/tLFQIzTsq64XMTLXmkQkaxfM28Qh6jI8luJzdjX1sx3SchJgg8V8VoufCYyUaH+wyxgexnJzlCYyfhEkSvVFabUatqGCu9FBCO91GxGESQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(396003)(366004)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(26005)(2616005)(1076003)(6512007)(6506007)(6666004)(478600001)(38100700002)(82960400001)(36756003)(86362001)(5660300002)(2906002)(8936002)(8676002)(4326008)(66946007)(110136005)(41300700001)(66556008)(66476007)(83380400001)(6486002)(966005)(316002)(6636002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4SpCaLk+Qlq+D8yH00bBnvy36aT/1HgwfECK+LB07DkStSs8bE8ebfQo/Ei7?=
 =?us-ascii?Q?Ho+xKWfp7ePnnSqogOkT5lEfcz0xGjzxmwp5VRZQUpQrrcfLwhuC3KR6n2Qw?=
 =?us-ascii?Q?gnWeIKbR/XVcvFl3es7RXEB3cjjBOK5LaY3agTdTQLRMKtFDkLRb5XQPJ9d6?=
 =?us-ascii?Q?ViQRoEMNFPygFL6h9DWyxzxRVsitU0mJFUXCISK/qbn+MsrRbjcDp+qcDsVu?=
 =?us-ascii?Q?8AUctJz78MH2r+dMhi4fO4pINNig2wPhzdmh6BEIQXbFdNj5ixOuXJthnt6Q?=
 =?us-ascii?Q?cojbz2EV1PL9rMqV/QOvuvBoq/ShTgTy1aXnXFiI/TZcTCmW+rpyHKGnQuAd?=
 =?us-ascii?Q?FGuyXxPoNYB3EveRFjdoq8pVg9iKsKZ1eEnuX2tj5qva3BM1GW3vj2/Vtn9D?=
 =?us-ascii?Q?WCC1Bw989Shb9ffsRmpiea/6mPBD/oprJqdbxUbePJ7ZVLvjc2JrsHogZnru?=
 =?us-ascii?Q?g4922rRosMB7vGYms/PGoSWeVBYVQHRADOuxSOZ01RP8jWWP5aI9oa3j5SOl?=
 =?us-ascii?Q?hNhBDX0YjlYE93GkINZJxWsqJuWvsWvY3hu8KT0tcvjDl+TOUlpUbQfLb4fT?=
 =?us-ascii?Q?3ZS95Z3sQQcFnBPHcSrPTRnDcEuJixMH/SV/6VFJM6S+sSmiPNwx4Jcn+RI/?=
 =?us-ascii?Q?f82JOQ3viDtJXfsVde5U+l5B28IF5m9UBX604MrCX8tb+hyA9rMpBFF0yMOI?=
 =?us-ascii?Q?nEB10n6SP6CVcqBn6vL/8cpxr8k/XdKTM1rd58FJmRlozd+mOe2In4ZbH3Lx?=
 =?us-ascii?Q?ta+tWNs5rNkNQh2iQ+FQem1msfPTxoZsBDG14RkMkGLvDkvf04g2cj5apKiW?=
 =?us-ascii?Q?wqB/Vk5I4P5WcenrBfT3PUFZev+l3i8gyiNaTLnhmPRjNgbZWAuCsnNWFuSd?=
 =?us-ascii?Q?1mH4nbC84rO9TuXsUS53GzJ3hw0iKdVIqXlgqi5Fkga5VmNTY2OPVWAZxD4R?=
 =?us-ascii?Q?BT/LHW5R/Y6NzBfQDE/DzmiY/Nl7msMPNy/W36lVt9WxVDsxl3Ei7DRc/FBX?=
 =?us-ascii?Q?7/KPFLykc9kgYM84FTELU6VzsV7IHNK2itkUsskLwTZ/owtibGNs9UUwfNAv?=
 =?us-ascii?Q?ypz+oRumoxaqocKIc/mR1pTLJw4/WbUp+8MFcK75KfQhwAPZUx+0cmQGcPwM?=
 =?us-ascii?Q?87W4088bRUr22XnRngy87tEPLYzP4IlUpVCXsgbfPRIerCwwWDU1DSsDtnO/?=
 =?us-ascii?Q?u0MwBMjLITClY3WpvUrqDN8CkdylC6Qrm2YnUMH5YqwACDkDzF3FD7TMYuVn?=
 =?us-ascii?Q?fjxk1oBJScDxHYUbDkmIiX1w/JUtiOhdrSvWNIw5Pf4x4y92xdZomytN/Taj?=
 =?us-ascii?Q?HAyJxLqt9sXkiW3eIFR5+B3kE4mBNKciVJEry3horaj+C8658BWi8WF4Z89j?=
 =?us-ascii?Q?JM7avwdRQ0kNMC25NJHAsP/Z8+iFSxTan09X6kB3aALQUNsRb0SnGpIXG6xm?=
 =?us-ascii?Q?shmkojK3WDr7Epm7nBSv8D1nb5ZiEw6M+UdNAj/YReWpyLbxuNbplbskBeWN?=
 =?us-ascii?Q?UTCk/owkq448BBQN5YnvHYnlcF/2IHIHTvDsZzhcCiP2oH8tNtWBkaXwQUnK?=
 =?us-ascii?Q?FzoM60Gg7bYG10pk270PPojFebJ5OprHZgytcTLn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e093e1-9c36-407c-49c3-08dbebfd54b1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 08:22:28.4898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqw2ykSDCoMbUNsN4yqoG6rm7V8Y7o8yaKqTmwxgPavb8NSfy55u6n/5RBxzmYSmkv2kZcgyV+dwB2wH6Juibw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5244
X-OriginatorOrg: intel.com

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting+pasid-11142023-yi
head:   92f313909ee3753f73c9b3341a34aa28116edb62
commit: 706387616ffbf6d04773de49dc53324f599d2e64 [17/20] iommufd/selftest: Extend IOMMU_TEST_OP_MOCK_DOMAIN to pass in pasid
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220103.2mel2uEZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311220103.2mel2uEZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   iommufd.c: In function 'iommufd_dirty_tracking_setup':
>> iommufd.c:1676:44: error: macro "test_cmd_mock_domain" requires 5 arguments, but only 4 given
    1676 |                              &self->idev_id);
         |                                            ^
   In file included from iommufd.c:10:
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, idev_id)   \
         | 
>> iommufd.c:1675:9: error: 'test_cmd_mock_domain' undeclared (first use in this function); did you mean '_test_cmd_mock_domain'?
    1675 |         test_cmd_mock_domain(self->ioas_id, &self->stdev_id, &self->hwpt_id,
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   iommufd.c:1675:9: note: each undeclared identifier is reported only once for each function it appears in
   iommufd.c: In function 'iommufd_dirty_tracking_enforce_dirty':
   iommufd.c:1726:61: error: macro "test_cmd_mock_domain" requires 5 arguments, but only 4 given
    1726 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |                                                             ^
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, idev_id)   \
         | 
   iommufd.c:1726:9: error: 'test_cmd_mock_domain' undeclared (first use in this function); did you mean '_test_cmd_mock_domain'?
    1726 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   iommufd.c: In function 'iommufd_dirty_tracking_set_dirty_tracking':
   iommufd.c:1748:61: error: macro "test_cmd_mock_domain" requires 5 arguments, but only 4 given
    1748 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |                                                             ^
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, idev_id)   \
         | 
   iommufd.c:1748:9: error: 'test_cmd_mock_domain' undeclared (first use in this function); did you mean '_test_cmd_mock_domain'?
    1748 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   iommufd.c: In function 'iommufd_dirty_tracking_device_dirty_capability':
   iommufd.c:1763:61: error: macro "test_cmd_mock_domain" requires 5 arguments, but only 4 given
    1763 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |                                                             ^
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, idev_id)   \
         | 
   iommufd.c:1763:9: error: 'test_cmd_mock_domain' undeclared (first use in this function); did you mean '_test_cmd_mock_domain'?
    1763 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   iommufd.c: In function 'iommufd_dirty_tracking_get_dirty_bitmap':
   iommufd.c:1785:61: error: macro "test_cmd_mock_domain" requires 5 arguments, but only 4 given
    1785 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |                                                             ^
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, idev_id)   \
         | 
   iommufd.c:1785:9: error: 'test_cmd_mock_domain' undeclared (first use in this function); did you mean '_test_cmd_mock_domain'?
    1785 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   iommufd.c: In function 'iommufd_dirty_tracking_get_dirty_bitmap_no_clear':
   iommufd.c:1815:61: error: macro "test_cmd_mock_domain" requires 5 arguments, but only 4 given
    1815 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |                                                             ^
   iommufd_utils.h:91: note: macro "test_cmd_mock_domain" defined here
      91 | #define test_cmd_mock_domain(ioas_id, pasid, stdev_id, hwpt_id, idev_id)   \
         | 
   iommufd.c:1815:9: error: 'test_cmd_mock_domain' undeclared (first use in this function); did you mean '_test_cmd_mock_domain'?
    1815 |         test_cmd_mock_domain(hwpt_id, &stddev_id, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         _test_cmd_mock_domain
   In file included from iommufd_utils.h:13:
   iommufd.c: In function 'iommufd_device_pasid_pasid_attach':
   iommufd.c:2266:44: error: 'IOMMU_HWPT_ALLOC_DATA_SELFTEST' undeclared (first use in this function); did you mean 'IOMMU_HWPT_DATA_SELFTEST'?
    2266 |                                            IOMMU_HWPT_ALLOC_DATA_SELFTEST,
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ../kselftest_harness.h:707:20: note: in definition of macro '__EXPECT'
     707 |         __typeof__(_seen) __seen = (_seen); \
         |                    ^~~~~
   iommufd_utils.h:193:9: note: in expansion of macro 'ASSERT_EQ'
     193 |         ASSERT_EQ(0, _test_cmd_hwpt_alloc(self->fd, device_id, pt_id, flags, \
         |         ^~~~~~~~~
   iommufd.c:2264:17: note: in expansion of macro 'test_cmd_hwpt_alloc_nested'
    2264 |                 test_cmd_hwpt_alloc_nested(self->device_id, parent_hwpt_id, 0,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

