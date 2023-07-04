Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7623581B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 08:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688459588; x=1719995588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BQPd4LWko1mGVAx5Qs6qFVFmoxOC48M11sYsPguCF/g=;
  b=i1QHI8XbN0rdUKMchSNkHgT+S7of1ZSOG5AUTXO9+bnr1QP47BLrT6bf
   CDsQrNVmzQoMhuPYlSlG3lAC4kjUPfPunNRzC2vEJMoqtPPbcVqVfL4vj
   h5rakqzcWxIdDZ0vkizY2m6kQXnWkID11DRUmjNXBtYJR/d4Kj2unX4Ud
   15oys+rT/4gbku+t4IDXq7QytYsFmbdyT9Xk9JBD7hPg9YK87Js12c0zc
   LhQ28ZSeGtobBaizj0N0F9t6iYSC1d/+u8rITWgaQw4ZIQ3aty6Gy5I0I
   yJzpkSRGGA34hoIyHkqRTuSCnDkuUWSfkZUQ8UwfJe3v1ZlfeL+jMoPir
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343405470"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="343405470"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 01:33:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="669012527"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="669012527"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP; 04 Jul 2023 01:33:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 01:33:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 01:33:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 01:33:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 01:33:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7OseWq3Ph4/82zkovWxEo7Tf+cGCQusVGIWtRIBylnO0wgZhJHseTJdlygWPJurqUiuYdjr9McVEOZ3wn4s4TVFZw6s0EoNgeEim4Cng57QNrTYu2sBGVKaOsB4BMSWhPSL6UC1uugq3pNUMlSMO8h3Vo/r0429T2dBWMBKaXUGy/2QsUrB4lZQMvTERwIHatEWuVMscy62CYswL0IO5Nv8vcPGUVE4o/sW6Weyv3cK1aEbGS8N0DWJebdFPu/7pHeQMlLTfdtVbDWs8Wo6sv4hS6SgueYbgWc6JmG7pd7WPkLTUiFP89NajZzjHdEYRhsLmQ/ZUbnYj//90n5CoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTe0rNbNKRTloEmeNda0ep2A1FfVYE87YKkCbFy+Y1s=;
 b=GL1UspQO5bpxXYqyOlMibveDABvzI1Rq6Bn6hvX5Pss9ceYQ4aFvQLIZ7ukScI2ddgBkGRmd5Jsm8EcIDkhLMogCtvN40gQnit/DqYTuS8i0W8sBrFCF5fUFxR8G0B2rRguSYr5+tZah1jBDhkpM2qjbR+0+MAGLp6dmXJzodnXITjI++r/dETWB+WrjjpHrtc975LT1njMJLBvrM2UThoDIxFonn4CUcsYktuAWbmhZoaFiN2evUo6NDVwH68BdS/cXXm83ToR86u4Ri6QGVhW4rfk622NkJzCNzymGznHSSmt3/0Y/jym2zgzTU2ofd+Jj0W1z7iPpC2VnGphLUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MW4PR11MB5798.namprd11.prod.outlook.com (2603:10b6:303:185::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 08:32:59 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 08:32:58 +0000
Date: Tue, 4 Jul 2023 16:29:57 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [yiliu1765-iommufd:wip/iommufd_nesting-07032023-yi 1/65]
 drivers/iommu/iommu.c: iommu-priv.h is included more than once.
Message-ID: <ZKPYhf7iEKZr9e+D@yujie-X299>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR03CA0099.apcprd03.prod.outlook.com
 (2603:1096:4:7c::27) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MW4PR11MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d4bad60-382c-4550-94a1-08db7c6945be
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FiE8ciWbsZTEo53xQlKXHuuYOlFmsZZsBLnl3T9dWrABgGnIYWErukh2YoD4XkdT/RNpwOtFn1JdzBg7cOilTxDzycVztsNg1+1S1uVMYF4uK3IDpTKZYoY6w2ZOrRKBF1ZTQqBlBX7Mpm31NfXM93Ll72v54WX41JEQ4G5WisuK5OAVrlQRKL3djwu2uniQ3DJDV4e+UT6HwrBUfhbmGzOed55sZtDhb4oQmav3ProkVBqo03jelHzu3Fso3E1meHCwwiHrLcOlPdm4ezH9rkIbmIYqZtmbfEzd3VVkct9yUYDDAO+mdHBKVSAZrIP4q2ca4DFm9SJAKa8M7N/ncT3WNX9xbmyLobWQ6pa1hil2oMT8zaDIVEyCrHgQKD01s7s6MUqqiG+a8YfeOClDDeGpP15K05IdQ9ijoPykKmvBU7uzIUy3nm2YhX5xRKlH55y76ObJqMvGuhlpGdySw4tP4ukAh9uc0B6SmR3WsxRcNh4CGDyLxRV5ZK+85ioCn2I9NZaopY+r78LF84qz+wj8nr407lmIs6umz04AXDeFqFH7mNlNylzflRM48rDaTl1u50YNew5FY/boi3Pv1lZVLjZINlGO3aaRTMESdcllxUZ/O4AUgk2qSjo7ux1fm7/t/VqG4Kut2WqpNweXiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199021)(316002)(4326008)(9686003)(66556008)(66476007)(6636002)(66946007)(6512007)(6506007)(26005)(86362001)(186003)(83380400001)(82960400001)(966005)(4744005)(2906002)(6486002)(38100700002)(33716001)(5660300002)(478600001)(8676002)(110136005)(8936002)(41300700001)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?68QOQN8GGau/sX20U344AnQH/0JHwdmLRFjjx/7mR7w8XMAvsEGUJzxs/OKm?=
 =?us-ascii?Q?rtTNOEg0PlIINUrxpB7Y2v/AYsqbLZ+gxOhXSrHxUO3p0GRs1Qq5+k9KZ5zT?=
 =?us-ascii?Q?cv+AlJdecXHoFZiiFQvxk7z+kz1LilXg9mjRrVbphj+98qtqKOEuQPsA2ytC?=
 =?us-ascii?Q?9PJLLFq79BAS/IRiESQqXoWlMzrpDwXov4cgW9PjpNvepV5xpwRv0kfJqOg2?=
 =?us-ascii?Q?jJNrgiMD2s8MhMEblCkuDvlsagvgBFQ3y88mI3fbL2672YI9UScr91GZiO+p?=
 =?us-ascii?Q?MMsiEH9HD5RsA345LVCBk34NeAlZkp6cWyBd4q/dr0J5dRsZR16J2WNffXEP?=
 =?us-ascii?Q?t4F3lR3Q9FF7XPQ8TtzAKS60hTth7hJUUyUrlrqVqNVCWUq+O4wIUpjzU7Y4?=
 =?us-ascii?Q?g2mIcRcg+a0pTBFoL0zUwBDpmyKLVpjHkRH2aAvp+NjLEjjiX+SP3Rf9+QSi?=
 =?us-ascii?Q?YMGeVPhS+3Bhxmuib7FttygvSd2TLOJshsa1IdlVt0XIEFg4cR3UbZ8dZ9bc?=
 =?us-ascii?Q?sfI3bsozExuJ5v6Os9YMhPysCV21qXaCeXyA69LAZlgzuCtW/YO2PbsKP/1B?=
 =?us-ascii?Q?XlUUCuE5Ptxh6LqPciJmm7XjaHSLq1qKDoTpB9LgLnE5tb5pN6vhElx3gnKm?=
 =?us-ascii?Q?TBTpQUeK8cmpPmZA1P2jgUxFLBjKcCO8FQS6QLZM3/dK6OUmE/vphq5BupsR?=
 =?us-ascii?Q?wHgqabKaDyDm/K/1zrsv0OLuofOrO4x41zFV1e4XxYjPZekKIuTjwk4Sv+ss?=
 =?us-ascii?Q?562XjHDJEuFa3ewN9AoY63yBVDnUxtV8Eq8eF9vEnPoPZ2K4izP6nI6cb6hc?=
 =?us-ascii?Q?ojxNuq4UR8yoeYcwunBu6YdSbMwx8TO/aFl1VCCOJs5kQtm+ihvjrgoo7csq?=
 =?us-ascii?Q?u3eE2kY12YQc8Fax0/FV4ML/lF9L6Sjp5sebpPltbIjdKnNnb5LTzYf6P11c?=
 =?us-ascii?Q?VnnVMXJOoXJo+b++z90V8LnX1wNmOI4/V3p9lNN+ucs8Pw15m4ukWRfKMjtc?=
 =?us-ascii?Q?rWw7GF3MWeHKgWiY31Jjn5Uzj8DF7+fMAF+2blWyn3JYcXjZtKneLb26dvrY?=
 =?us-ascii?Q?hEjeulgCopujI8Sf2GMqoBqNZKW9jNjvrcoArOp1R/7R13isUNbdkDcgWWXL?=
 =?us-ascii?Q?i6c0kn/fVSlGbEQxpXiO1kvn9kBqahIMFrket5c7KWbUNfM44UF4Dd+UJvzj?=
 =?us-ascii?Q?3ZQFN7LH/o3DOyzBZGd5nzTu0sjqRUDIYjhnefW+DE5MZmN2HK319wZ2Ne2i?=
 =?us-ascii?Q?zQM1mwPahnUDnhREV/pJ7SOEMRW5ItlC5V6XtDUn3QenOVDh2Y5U91MzssJN?=
 =?us-ascii?Q?vEmtQza76BCSaRlxP5uU5A1i1GJ1l4AD4ilZG/zltkDblHFMvxlRTYRGmqq8?=
 =?us-ascii?Q?yuf2f0BtjyzTpOyv9XwR+C4jsaE9MEcGwKC2CwFGRJE1malAu900t60KStro?=
 =?us-ascii?Q?SlxTd1TVAbA6eR1cEBrEvqWkl2HTBfii2hZ+N8ZTClzpA/+eINF6SqgrqjdQ?=
 =?us-ascii?Q?lzuYDQGCMpGoZkF7pkduaKozUD6+vndAdQRJrmjb/ngHDJ1Y8+hMU8WNOXEs?=
 =?us-ascii?Q?ixQyMsSDicEfMkjtQlPZV1ZvoAlvTf9YkJqsWGM3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4bad60-382c-4550-94a1-08db7c6945be
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 08:32:58.8408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlIDDLvjHm4Tas5XPap3Y17nzIL6iiIZ4OAWYT7ksui8Ed9AgvIAyQxLKLFcfIKHiBrfwwOYdV5+RtJZ8nrdiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5798
X-OriginatorOrg: intel.com

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_nesting-07032023-yi
head:   ac623a6f5d61ed4f4d90a3f835c668728b07ab95
commit: 8b5b28620d75c74b41568767094059fbf9529563 [1/65] iommu: Move dev_iommu_ops() to private header
branch date: 15 hours ago
commit date: 2 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

includecheck warnings: (new ones prefixed by >>)
>> drivers/iommu/iommu.c: iommu-priv.h is included more than once.

vim +37 drivers/iommu/iommu.c

    35	
    36	#include "dma-iommu.h"
  > 37	#include "iommu-priv.h"
    38	
    39	#include "iommu-sva.h"
    40	
  > 41	#include "iommu-priv.h"
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

