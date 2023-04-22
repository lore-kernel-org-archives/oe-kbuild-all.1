Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9666AA0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 17:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682183448; x=1713719448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZhSvknSirY3/OS/NAT22dooMzpS6JGw+cp49F2pkNgA=;
  b=XyyGyUZIaNRCCrvUP2QKXqs/XU82Ww6VnmlcL67Ne7loZH8fuMqfMjdf
   GOU/hWQGsIrgDnafAu06wgO8hrSFcTg9zr9KmDaKkbnsCIQCSDiokqGIp
   x6pokZNqL5hrBeeFge74Yvnu8gLzIHZucKx9j/n1vQLvxOIzr7uhOFOE4
   7cDWVAkJnkPJdWvXdnIUbmfFQio9drpPe9ujaqm5dynTIOnsLA6XbB5SF
   ohWaW5RK3Q1PRdzPRifub6sVUREosbYYyuA6Jl2axBd0bgW1vvgLLnIGU
   JaXvMhSaEL+xlrD0K9cKzpp/YAL4r+rQ5bRVlaZhMvDzJOdZx5zxGencV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="411456242"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="411456242"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 10:10:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10688"; a="867011187"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="867011187"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga005.jf.intel.com with ESMTP; 22 Apr 2023 10:10:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 22 Apr 2023 10:10:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 22 Apr 2023 10:10:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 22 Apr 2023 09:59:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwBwD3e4NI9WYi07qLwE0xzuqMr/fF9yoGx56M97USoXI+rlQs5jrVP/Eo3P3QlFsjVQi/u0ZFa9N1r018xawaTIAt7MJouj66oVIjKDMx1V1JdfFwq+CZlI4rYrtMCXjz65qf9JjbtX0iCklsBdirFj6cZ6D/iUTHt3H3hkuHPLCiXXKK1qsy57pCxzTx7MppZzf+5Wzg0SUqBKypzJYkY+wnmi1MWgt0fYdGBuEAmNRL+Vky90Iw5QkVrQ4sIEjQvg9VaW5qErNrmOMAR8q4nZwM9Geoji3CqYbOp/QYxqwef2XApj2vCzwJfxMbI+v9/sZcTbMq6cZbGaEbAd+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Ks0VxdPMYADBDGOlbcbTltMO91UC7SQGgVu6XltieY=;
 b=EmRxNSk8phoMc6m8OtuxMGpwRt5GxHjUB74EfGkAzjhRcyfsiaDO2wCN1SPCq/ZPycat6fZwMCdYhhVFtE3EE9JCWEm/N+1MzET/5kCT6TgYxzinVikU9F6mEuBZJQdYvX7yIi3NbGzZtqyZyeVmKVkqt2naJ5Ax4KLhFewLuqmkwccSW7dkotBfwJ0ELMGmH85cW2r1gJUlla9/kGW8DirL8CNvC15LFMoICHJiGlIKjuK47QgSH1wtHkLjVu61H2npWVZw9RhSdxRiuIKHTZIlErR2rQKyzhOjGdqkFenM3seKnpgCOar1n3FEHv89jQ2pBRTXkat4lx4STuOj+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB7558.namprd11.prod.outlook.com (2603:10b6:8:148::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Sat, 22 Apr
 2023 16:59:11 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c%6]) with mapi id 15.20.6319.029; Sat, 22 Apr 2023
 16:59:10 +0000
Date: Sun, 23 Apr 2023 00:56:07 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
CC: <oe-kbuild-all@lists.linux.dev>, Lyude Paul <lyude@redhat.com>
Subject: [linus:master] drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c:
 chid.h is included more than once.
Message-ID: <202304221942.sCJx2Sxv-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR03CA0101.apcprd03.prod.outlook.com
 (2603:1096:4:7c::29) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DS0PR11MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 575f5967-3cd8-45b7-b0e6-08db4352e43f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: saeyKczBm2KynwQ2i5T6qNy0O7tbDrMV5M3Q1i4gqfvA9sUzq2vbQFHqI+KbYy6wuU3pxELOcpjwQk/Aj1h+WMXEdpq/dvIgpPfn/9bKYmKvtOsFNMFBPCM3R8Gj0gHX4InE0NFZd+JgRwsl1OvtMd7K+D/boAn/2J+jskG3aUFdSEhoNrR2iI9GMGHgrWt69aBCrHsjN3r33sIib1Dtwz7ogsd/0uUGHBP1VR1UzM2g0HxEFXJV3m+kj8n3T6oHJ682viXY7oz803oYth07WNa2QGOWV3+yZXIQgd6wiQQn5KXVhjzVt5ya2QPdtoFo55Idsxhky6aV+h+v4/1cyzyAf+rrb7B+4E48H6SGd6jGtVmpIBrEeJIP7CNN5T35zLCOoExz261i5NH6KubNa6lNmEI1tHdzN4fXzljCTbFzaycnTbyPuKyLI4I8xUV70ovIHWi2CeMq//ZhVM0IYBuS1nylxhvhw473im5MwYKx1JwLgtD+iq9r9hq3rd1Uzj25NP+2fnAdYJ0XRYyARwVNdmqGMLKKLza+3yT6NPkwpkDhCjJqZxn3pxAtyuUxKr/rlhXD7ODz+ZPsKgdV4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199021)(8936002)(38100700002)(8676002)(82960400001)(41300700001)(5660300002)(66556008)(4326008)(6916009)(316002)(66476007)(66946007)(83380400001)(2906002)(186003)(36756003)(6486002)(2616005)(478600001)(6666004)(6512007)(1076003)(966005)(86362001)(6506007)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?95My6ExO9oLgU+cAZVuZp/8snRbFAvai4DzujdizWY6YKmLkq00L9iU/K8gH?=
 =?us-ascii?Q?jeKrNIlOdDNSNXoaUeBpvGiZIIEF8mIIduSBSyTNfXs3VDs2Q5+kFly/iIAp?=
 =?us-ascii?Q?/lgMjCAxEbnN2ztr2nLPGhnWq7aI+oKHiXEClYoG/E9SsomL7EHhVXKtwGKg?=
 =?us-ascii?Q?XXt2X7wav9If45gJHHJXDB7p6q0m6EEWtE4qUvWsjkiEdme1lS2a7FfnBQSp?=
 =?us-ascii?Q?JqNrBu7ZyAhrRxKwN//1KNkpzhAu/mRf5PPdJtgToc8Xc9f2KIKtTxvyQbO8?=
 =?us-ascii?Q?L7L9fVFcnEklwRyByk0Hy0/yIl6rBLoI9Fyg3Qd0+SM9qCls4aThsnrBSx53?=
 =?us-ascii?Q?XG1nrXLOKRLLpAV4Ib4PKzTDxMl3UklzCVgjrjVKym55J0byiM4VzN4yXWvV?=
 =?us-ascii?Q?J1aC8j4cV6EDjXSY22qIttL4mXjFQXI46swZHfE1WqU9549pz7Z9GGYGA0RE?=
 =?us-ascii?Q?0qvv9Rkff57WEhtAvPIAn3uTpB+h+bW2TjGbqm1onvhl6nXViVxIvALFicoZ?=
 =?us-ascii?Q?EAE0RZw/7+GW2X8DZQBljaVn5vgb66ihGsF27ZPmoFJVth9uK3Dl5VKy0BFH?=
 =?us-ascii?Q?gEY4WqUWqgUQwwqrE6/Dm3Ilt6w7en+1W65Wte4izfKgQpFJNzC/KlnZCee8?=
 =?us-ascii?Q?NkNj2nNnpbfh49EZBCTWNommjLD7zKso+uuSO4eqvNxTGnh2F6PLuzQuRm1n?=
 =?us-ascii?Q?+9OVFapNy+DT09IyaVOMaujEWtQOJoKYkAJn0LCn0f7k5j83diG2b7a9M4MR?=
 =?us-ascii?Q?bn7tID/3jYfFN03wWNIygD4roYggzmQk/Nsn3w+34Z9C7t2XGt6wepZGOU9A?=
 =?us-ascii?Q?r9h8JBM7fQfZ8L/jbisVmUmFNqdlkaauQw89D26GMb0RSJ6Ldif61dKjwtrB?=
 =?us-ascii?Q?F4Y5HYku8RpHMIa31TJPrEuSuVijrrhPhjkGF96NjGefIGoYRbCLmGOzh0qh?=
 =?us-ascii?Q?bSAozD4uzYOE2LD60HYScGuirZte56AomQU4zWynofECfOvAGA74T/SSYJsx?=
 =?us-ascii?Q?LP1t3+mkDJqophb9h68scKleDb4XsygYM3QpqcUE4eO/CIwGGEus8IQEknjv?=
 =?us-ascii?Q?dx/FhPyyeo1ehWXtht85WIcTgUV7qJG8/BkiIgVN7FKDuV4sxDVXXmQDNsFq?=
 =?us-ascii?Q?csyxzT0zTkJ8vBniavjSNbFp5hYW3QGKHKmS/S/MPhupJNyk4PNE0MIp3eCl?=
 =?us-ascii?Q?MZ9SCH1mHAoPKkyPacKGruPK0qIBSh+V/8bOgsnmiWOzw22UCOvV9c3Hp81c?=
 =?us-ascii?Q?OtOR9zN8YtdbdtGW//Z1Me/xOSKG0lnLDEZwJ/O0oj8iveBFgO0FUUT+wiea?=
 =?us-ascii?Q?iJe4liA8sJxapOkjj1y54OXbD34yh0RB0pEbwKWFG1a3ohYuRfM10a2Fve/y?=
 =?us-ascii?Q?PugBlfNpYm2l1yFD9TJiTd2jmXUJVzJYdJzKzTOjZKi39zYMruhVHES0h0og?=
 =?us-ascii?Q?M87VnQjx0Nn2SIDUp5WRoefzVcio765cUqt4ScEZn3TuABvdL0flJTJBOR04?=
 =?us-ascii?Q?w8t3tiwp7U3bhhJa7P5aG0KLCt5TF5L1XUBgxOWoVSXXgLbheNl03uLCblt5?=
 =?us-ascii?Q?BpggxgvSoMz3MN2jkh5iYpCk/USxWlbHPlZGaWDQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 575f5967-3cd8-45b7-b0e6-08db4352e43f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2023 16:59:10.1842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNJlMykVHaVciJTzhXI20TEmHAyoMofngy46pCeaFy+Zn2OWH+dKknLTxPM6HLKwxBvxuqjxMEsvMJjfzHLSlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7558
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8e41e0a575664d26bb87e012c39435c4c3914ed9
commit: 67059b9fb8997f3d4515d72052c331503b00274b drm/nouveau/fifo: add chan start()/stop()
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/r/202304221942.sCJx2Sxv-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c: chid.h is included more than once.


9a65a38c456eb (Ben Skeggs 2015-08-20 14:54:19 +1000  24) #include "chan.h"
468fae7bb0a31 (Ben Skeggs 2022-06-01 20:47:26 +1000 @25) #include "chid.h"
468fae7bb0a31 (Ben Skeggs 2022-06-01 20:47:26 +1000  26) #include "cgrp.h"
67059b9fb8997 (Ben Skeggs 2022-06-01 20:47:32 +1000 @27) #include "chid.h"
468fae7bb0a31 (Ben Skeggs 2022-06-01 20:47:26 +1000  28) #include "runl.h"
f5e4568991f60 (Ben Skeggs 2022-06-01 20:47:21 +1000  29) #include "priv.h"


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
