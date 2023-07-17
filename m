Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476E015B4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 03:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689563720; x=1721099720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x1nFHe42TV9i1JlSvBFgMRP672sXsxSambDA24rLWpc=;
  b=lwUrqvZ3lIfevRm6sZxB6JX5mKYr3q/qbixIhTNPEzHWkSFZuPzC261q
   tjftCo/hnBEO9WsqvOLocbXeRAjjLbgLB7odG7uT3DqIswakBuIQBGhsi
   Grgr8BEkFE+t99g1vrEEvDYBr4nrOkDQalx2c67Vlt79paw/AoF/hed2R
   dna/OllIrvfQlL6c/77NWoLOC/Q20N05UZMEkpWUABKlYTF6J0Nis4Px/
   NJ/kjcm/16/Q2ItWZ/DlUArZnGOdc/IDnKijGnPr+A5tzHhbHyGEe4zqA
   Yj3cQM+cowTVBd5q3K4YPkNSRUgl880HXu/FMDqe9w4T7tfE2swYEzIEQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="429593116"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="429593116"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 20:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="813148628"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="813148628"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Jul 2023 20:15:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 16 Jul 2023 20:15:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 16 Jul 2023 20:15:17 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 16 Jul 2023 20:15:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eP8Y5KepvNwRsNlHgEHaE1p+AH9V/nCp7q30IvzyvkpJfGkQU1lBPmewTtLdsi4AMm+FC/j4dJzODkFNWE21saCwGoCRVh/CsykT4Oxce/73S5oXjhYFgbe5gpzMLInqK4DMd24Wcw7Oj5ZT+Xjh3hP0FqKCQELi5jgmfnN3rZbbd+No+ngRptxPim3bBwMOcJhlPzLc4GeVMpti+8/lYPj17r123gjkcplcw+jcY8pH1CXN10BihF8++8xfI2v07bZfWV91kKD+7kOv1M+1xIyymKNyVnh/Ertq6f3tNv/pYHDyCxtzI7/M74ipQ8HkAtvssqb84bzAl12rJkKegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQubbNZBXUWfJ2OLuwp7KoXx79z5eKq0i6eVY8U0jeo=;
 b=T/F2jK0b1noZRUoNIuR9+bfT622I+ZHWu3viChiMXWh6a5EtYzhZEyV8MYG0eUMm6NCs+BZdPkZ2YLG1fQ3d5Ln1sTI1BCcWr5mDSv4RnSvq4LXrwKhUtsS46IGeGKIItY1++tcLNtODJ2eX6ob6NnK9cHhVQ5RDqUlp96RKys4sydSNqZprrRpn0d9zbvAg159wfb1dU0YNimNL26ojogonnRJLNHtsFofwXTpusaoQfXdzNVcKydyRLSQhxWVIKMCz3KZO9nicIwrUO7tTft+iB6mU/GUg2trqks6/tfXgDZHQH+KlizWdiTGuuku+uhch6Jo5M8fv8PBO/0rICA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH0PR11MB5676.namprd11.prod.outlook.com (2603:10b6:510:ea::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Mon, 17 Jul
 2023 03:15:15 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 03:15:14 +0000
Date: Mon, 17 Jul 2023 11:11:04 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [intel-tdx:kvm-upstream-workaround 121/365] arch/x86/kvm/vmx/tdx.c:
 mmu.h is included more than once.
Message-ID: <202307161950.r5m8XR0H-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH0PR11MB5676:EE_
X-MS-Office365-Filtering-Correlation-Id: 87e38ed8-31b8-4c83-4891-08db86740a18
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: flmFpGLnS5vnQ4Zy2jgbgv7oUq1kZuDBJCYBkw1EdRDRERVnVSLX4dWv0A8st7yQBHdWgN4ySlhd/uYA9FKnq7qFHJ4x322a9kwLAz/PzxKbIXtUl4GnffYogBxWOx4BDWmhIuH02IaWd8WveIKLlALRXCuCnY7DMkuvMRZNEdygFK/ONC2FgQ9gNaRtJ//qH+biyY0z1GzFcj6iSjNdgMoyZPDQe6+pRkGTG63GXE2a6mWQXJS0B55/hsczAJYk3thRXwe/wOCzTCpKVNGtkSvq/QvQljUI2QVmxspfDQhFoJgtWfhWTLx5KV2m/hPH8r8sSv96FXTbg5bJI/t8cryyZz52ecnTSl1A3IuRAmw7uryjT7kzompe5eVabQIGQ+OOYwqgUMsJJj3ePjomgbov36WsHFhpbU3cxI9kuXgaww52wGBe4obwuU5qfdeiOB0UG2APclNv+vSrXwxCZoqDOItxSB+AxPiYlsEKQYxd5ibwPE5ziFfXgMbXnh82c2kMOchgn/EEF9z7fumQ3lbUx7wcx//otIBbmksmqP0hRx5Od2ZcLLZoumBk1dpoXteOlG51txyVNdguhKj3sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(396003)(366004)(136003)(451199021)(83380400001)(86362001)(8936002)(8676002)(186003)(4744005)(36756003)(2906002)(2616005)(5660300002)(6862004)(26005)(6506007)(1076003)(82960400001)(6636002)(6666004)(38100700002)(66556008)(66946007)(66476007)(4326008)(6486002)(37006003)(478600001)(316002)(41300700001)(966005)(6512007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uppVya4II1XfPk2NVG6621L8nKZ8rz7Ew09NNO/++K8stwpe+bPjoLIXp++0?=
 =?us-ascii?Q?Gw1kLKYtwCDcczNLt6gXKJtGuhLWie1g5FYza/ddrw1FpeWGqF/Ioqpl+RdZ?=
 =?us-ascii?Q?iqSprmc6mUDIV2rtoR2A4f9W0PVnV8wtIQStgk8104dOYJmfF6PyKdfZJ9LQ?=
 =?us-ascii?Q?DCfU328ofQG6n2jYQxyraQ1CXalq0n1M3DqyMlfeeR6p5jmcDWSCkIN/IfhD?=
 =?us-ascii?Q?xtUOB6g7riGFoRfl/qg1HBmjRxE/KXojqjIv+9FTAq+FeLSZbv4eHPKvuVti?=
 =?us-ascii?Q?SavrcySG0dKkqQdy2kLDm/sOeZe/9+/5klWARU7mYV2gtfq/34yWUnh+/hsv?=
 =?us-ascii?Q?9U8tzhJiko3G4XyXk7ORdqtCBhXWtA+Z/WyYlaJ8ivVQ2aG7RX2OXq7lX9aB?=
 =?us-ascii?Q?yPB9FRpn5Wo+Zxm/KJgp3AxnRW2rBmGqSJUVZ6evwUDGha7PbK0yDIl8W2gt?=
 =?us-ascii?Q?gFz+IUU1h9AAA7WymUnc5iTkMW6zhiPXhCq8T2kAymf7j95AD3y0BshwaI/k?=
 =?us-ascii?Q?EXVqDAsshTotNAUgC6rmYFroiP6uhHoCRFYTNOoe6ANTdXzqfWwEn6g2Vuwb?=
 =?us-ascii?Q?dT9pEY4hBNi3lrZkemyojv6A0u9TkqFk7zwCnmXNtO9fJPZEKwkSZlOwjmZf?=
 =?us-ascii?Q?R7TLGhGE/c9lpQAacz1GjyV2BGItaByYhLgaBnFCcYQ7l2WAeaEtW+v7YjVc?=
 =?us-ascii?Q?+kARAxTMt7aW18kUhhq33A4AWUj/hRWZ+c6sZ+RYK0bw6jdqTJyn3Wy618X4?=
 =?us-ascii?Q?ApvLB8Ptl0BRfzQerfGbtiNI06vQwVlVp+jHj/3Qq6d9eWrIonNWQbrQ10CO?=
 =?us-ascii?Q?fw5NIZiJgJTLdX8aO4wFY2NqqZTAD6dq53VHyT/eH/3uCzxM/HlQb447onFG?=
 =?us-ascii?Q?jUP6z2BeGW4CQkjYH7qZmDA+eQ9c7F+un6F5ZjFU3O1jBc2bBoYYPWI/S/41?=
 =?us-ascii?Q?gBgMiHfRkhprK1iqTAUSWSZlZRteXeLXXWiZp8lArSHn1EdSXzwi8k4EJNJe?=
 =?us-ascii?Q?T2aeK/A7Cjt8VvS1pKn7wZY0Dm/sYuFKGEUXcGgIn0CY2n2eBxdOrIUigDoK?=
 =?us-ascii?Q?GHon0FvwntTJmTtTsmCb+Gf8zh95syb49urFRuDDX1hePko2vsuOn250yGlH?=
 =?us-ascii?Q?Q+56GKGrnSMKepIQC3aIMPCOQiMUADuglkivkScqzciIo3TPtDJ9QssZ/A3I?=
 =?us-ascii?Q?GqtIOMgPWACyvpk75BKVLMb/6dtlE9uG/xlvU13G8bDKE4+Ja+wVjaDiDYRB?=
 =?us-ascii?Q?SfPkpmgDuJfHhhEGqblVa2bqNaRn2ghTdTzK9ADji1H2paEkeD8+fbRAiUo1?=
 =?us-ascii?Q?dWfSEIA3qoD137SpfunodkFsRUqbQIZ11ew34vo5p67RtaQKMxc9lQBMUnJl?=
 =?us-ascii?Q?XpmaTW2H3fvxhC0E99/tSKSaMj/aYWpNH00HtJ3F9z7BhBbyEicwQgRjKq1U?=
 =?us-ascii?Q?aSMh1V0xpTEEUm2REAcUky39AghfIGXv6UD5T8ANuKIm8C0Pc5aleoGcGWUH?=
 =?us-ascii?Q?6ZzZlO4/aPc7prg8Q5RIpabte6ec42mXQxBm14lH66h/t/Zh4O9dqbk4LtfF?=
 =?us-ascii?Q?6s16ypsXXDe52Knb0EXxuu5lDkszLXHhwToIj9TN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e38ed8-31b8-4c83-4891-08db86740a18
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 03:15:14.8129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Th72Y2sj7TIU/u18ry6T42Y2k5mpY5g6nruc6frzIRfYC2rjvtxAu1i3ndL97lqv66zg/WIAkHiDHrbgLIbBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5676
X-OriginatorOrg: intel.com

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   da8c3aa0cbb638a0dff13401bc17f817272110e6
commit: 5f81f9f172b39f1502e95ae8e9120d71b7673e7e [121/365] KVM: TDX: TDP MMU TDX support
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161950.r5m8XR0H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202307161950.r5m8XR0H-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/tdx.c: mmu.h is included more than once.

vim +8 arch/x86/kvm/vmx/tdx.c

     5	
     6	#include "capabilities.h"
     7	#include "x86_ops.h"
   > 8	#include "mmu.h"
     9	#include "tdx.h"
    10	#include "vmx.h"
    11	#include "x86.h"
  > 12	#include "mmu.h"
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

