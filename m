Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B0A4694
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 06:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686118108; x=1717654108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pa11jMUMT/u92gu4bJOR1KRV8i23DxcYVBiTxHXFhME=;
  b=aVNb5l21EhvezzbXpvkafZFT75N8Kl+p5jQRWBcgdNZtvxaNtDn3t6Ua
   afslb0luhYmQKVoz9dA2GNJaj2ueK2hUE6oAYZ13+v1H/6ElRA7eD+/b2
   BxoaWY4IzzFtbHVnhqOFiwF1jZYfGTDbfX3SsA43lPn2Dj8CDL5e5gkQS
   PGYHAoI4TY5TxPdnpV8eQZKWwgNxsr10HWlYWsWWPNw2ttgjM8HTxoIVC
   qdF4RM++0w3mbnJgpyC9Hv0cmdsVNYgAdd/77KFUbW9RGCrPTB5UaNjxK
   VFT1usVk71nBDoqRnn8TPF465buHYE5CRJH5XzZbRw+xS97MTparuWiGS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="336520065"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="336520065"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 23:08:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="709357540"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="709357540"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga002.jf.intel.com with ESMTP; 06 Jun 2023 23:08:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 23:08:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 23:08:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 23:08:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 23:08:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8jmQIzdajvcxHpOCMWgnvo1sDkprlCYa9H7Sjn5J6ewHRwnUANP9vWwqkrH0UcKu6seI5FcVqgNVYa9cOSJgMoV+u9CSLuXIhMfIoZ/tjqdnrihZLyRur/nVJ27rIsdS823YoiVxoNW5XE/72fHBo/092x4/IdG99NJIvO+si4X1G+099rXjrCWs0OyoIGaZiNjkm26n89FCOzkhnUtG9GuKBLykRW1sDK1w1ilvc4726jMklaO8eX1sxrgfFY0pCsZoC9Oz+tO5MiwlODNBtbMPpAT8fGJdV8pevtIz3+faL8t8gRGcpK0pAI4s14W1w4XPvKVP/k51MNnRTYpaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWXCP/AuVC6ssIBk0o/7u1RtzMVJGWHGI0qeqtGv7X8=;
 b=GzuW7k7IADEcq7DjK5nPQLmIg4wEj8XUxMAMrvCXbMl9k6gDwrjkuPwWZqaoav/YCEsgQ5pUIcSlVJyf6fUSVUyMHCuW9iFkXvwPZwSPbbsiIivdotjzj6bNc+72X+QKbhJYGQdHY6WQpXK5VRmH9SY1SZRxUYodvVPtYhONi9CTPqak+y64VLSpp2Xu/tgJwIo3cZXUN7CAYIW5Npo77PAZ2h+iaUyyVkciQdoogYUQCRoFVJp93IdBBg/qbfod3Y6iC/uqRbOIsKRWnBN8PwkJg9Vnyi+CQBVMRgloQZ/b7iI7fw+FpbRAO3PWhD3gGUsmSquXrT6Moc6f6mFrPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB7216.namprd11.prod.outlook.com (2603:10b6:8:11c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 06:08:18 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 06:08:18 +0000
Date: Wed, 7 Jun 2023 14:05:09 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [arm-integrator:b4/virt-to-pfn-v6-4-rc1 11/12]
 arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is included more
 than once.
Message-ID: <202305110112.70JBwZ77-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DS0PR11MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fef3547-b525-4913-bb2d-08db671d96eb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uG60ZpsHIXvDEDOXf7syckhe03iE65kRIjqxsb4J7vLzQXd78+sRY6l8a3poe09mELHqOonReFzE4UNdNvmNVXSXg2riFF763rDLNXk5PuMwg60bO98EqGKXuwDPQc2vbcTvzVzVVpzCnXVhfchILXB3ur616PKCBEhgD2rImE0MNxW84vvkQB1G+lrbw6T3LAwu/rRvRQgPIfngwq8BoHtTdfDaA0GXT0/pWHXMtu0Gnbhtt6dQ3xDLfZTptij6AlNNOWbIMoT7Yyx3urxYX/EOAzPlbKJ5QlY2B1vEatyuRmM0yDxrcA3tiNuo2WCr/poGCqB8Mh+9bq/PXnj6rqeUSnHN/LhI1PvBHY2xTz9h6VLeDzxHohlEArirDPrvqL/YB0oYV3v2mkm7AbPwButtAVxTLiIpK341A2Yt+vJDXsc2dixfvgBrV7Fuy3DX9fgj/j1QcH9p4m4cnOe9q5Ziow5HTL9PkemYq2mBnJ89p4x8GZOpTVi+Iz1BTnNylM7t3q0TuLHVcSYw6e2kEsWjVPPZRiz7pbzUy/yu6WBsWXMxOMK0DIUp40kEtcvWjEPNXnGbRo+JxLeNUWDar3gZhVjD/O7MTM0TSBlvxGaYKmV5QJ7+a+8OQjZ8zhmYDFXcR6sYc1bDBR4cYcEPhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199021)(6506007)(1076003)(186003)(26005)(6512007)(2616005)(966005)(82960400001)(83380400001)(36756003)(6486002)(6666004)(2906002)(8676002)(8936002)(478600001)(41300700001)(5660300002)(316002)(6916009)(86362001)(38100700002)(4326008)(66476007)(66556008)(66946007)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u7qQxR0JRn9Ol+fjNAbPfwMEgZEx0n9EBRp7f57tWH6B6fzyHWIeqSoow9/8?=
 =?us-ascii?Q?hAz96kkqOSdgLWK3Lp7/xLbPSmVEY2RNGXJGw/kcq/YU6rh6ms82fFd/Es0O?=
 =?us-ascii?Q?okedrUEO5fyeU9bO0InQzlfcxguHKkL1/9iKVrwZNWrIBT7mKolM+bBKAmDa?=
 =?us-ascii?Q?pnMjtoE9mnTK6SuBVCLx1ll9mKKY8vSFUg6/LvdWoMOaULtgW9CUWBtvPnyL?=
 =?us-ascii?Q?Nun5/UA104fyejAWGsug6RKpCQZYQCy0S2XKJod2jMoCRde1MyOqofvGu4A3?=
 =?us-ascii?Q?6yZBNF4qM0ctskRzGJYnR/UV1W/FaKq2xr23viS9a38EcW3MjdhuPxVh3IJA?=
 =?us-ascii?Q?yZikGDAXtxPt2FWSCCu21tuhmfO0mw+OPnRRik1dxaE6HslrwdbD7X4k+LxB?=
 =?us-ascii?Q?SNfawWIKbU8aAXRN3Mc5NwUnapvPuHKojb6hj0D19RkjYUGPdkdK/HxAywGs?=
 =?us-ascii?Q?Eg1MzgjKhirL+zNRCIjuW7ZPKVMCko8THVZ4f0mB8/ao1CdIxWh1C2SLdmZv?=
 =?us-ascii?Q?9VktigANUF/wWa5ZoTxI7C5rTvtk/aOxlwFAjn9Z1vbEMKOIVtC0CEymviwX?=
 =?us-ascii?Q?0GYVIKnEHOtzQqdlxRlXj3B/B8/LHI10rTp/M1NyD1We24k+1g5Fgzz862fM?=
 =?us-ascii?Q?fBjeyFwAYvG6QPEwbFqgY19Z3LNvIKwOv99fRxCpgbjDpHY9S8lt1i9vz4WL?=
 =?us-ascii?Q?F4ZlKAntKvnBdgOMb0E0PjzVOVH23HXDTow+iN/qWlwWRehGIqJhhLBLVNq/?=
 =?us-ascii?Q?pAfO9tCIYf+u7fckPsyIiIMYGCIjgw5tY/l+Rq0XwBXJaleB3WSTe6ujTeUg?=
 =?us-ascii?Q?x7lw/ZAqyzyuGRRiB15+LqCNjC7R1sdj36xNzda12u7C+4Pz8b5Cz9n1AvCd?=
 =?us-ascii?Q?9PYsueqpKW5jd0nzUjwZt9oVsDIfvRz1kHfF/3fD1alyO9MmOx+0oe3Coco0?=
 =?us-ascii?Q?QPXqws38rnke68WEkwsgNpqqYCLMoJ8Ki0jyD3i8+X4UrMt1gMTZx0J1Rbg1?=
 =?us-ascii?Q?ab92FRWY0rS9FlrFrvvxfRqwmyD2we/ZpIr0QajyYq+Ws1Rlnzrlov5W2z5o?=
 =?us-ascii?Q?oj5vh6VUroxnKCK044GlyAQKFHmB6kNABB8/+w+KYu2kdhYndP6ak2upif0T?=
 =?us-ascii?Q?FFrQsT6Jye1tO4TweArHfVUcQVJQF4+od4Wlf3kxWOQ7GSDEsI01PIZKv2YQ?=
 =?us-ascii?Q?Lc/YPcT+QSUScXqMR1+sAYqmdc5kMjKWbnjpKOSJ6FKpe8ELb0Ot4aMRtgxs?=
 =?us-ascii?Q?kMiIbVhMyhQCyJFMLpmGuRuTbXWJJ8VCRmqzW95BnYCMr+Gq/GWwgdZqmS1r?=
 =?us-ascii?Q?NppizGU61Q9X3p0TtPC896ME7iUqn3yEJSPoCouBtcoEACZt2zwaMyMjh+HE?=
 =?us-ascii?Q?7cIRcJc1KCySN7ciJcizHg+zDqqU9yOxciPR66/dfIsPi/E790j2JkQKLHVU?=
 =?us-ascii?Q?pHMdrBinvpLwxN8FVjh8/DMvDpWEGvkWBcoUqffV08LByu66lceGcNwBBi7k?=
 =?us-ascii?Q?0DRGhjocmLsI2rDJXaQhZv2lhLKCgPwpReNx7hr1hef5Y+/LGlwGWx12zFod?=
 =?us-ascii?Q?kjL+qJq7MmHJGxFJ+dP+3A/VyFZc3pw3/rMK+S7m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fef3547-b525-4913-bb2d-08db671d96eb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 06:08:18.7751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtNz3FSH9sD/s+B/AJqELrXBPEFcrGnIybCx+0Nx/FeJU33Pns4DCxbUKVvss1Gt/lhybmG5lEvRzp869JBpmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7216
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/virt-to-pfn-v6-4-rc1
head:   36cd23770d30181a2aa10538e3c262cde04e979a
commit: 65a0611d0ef440b1c8b8ca5f36e3bbee36f7347d [11/12] arm64: memory: Make virt_to_pfn() a static inline
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202305110112.70JBwZ77-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is included more than once.

65a0611d0ef44 (Linus Walleij     2022-05-30 10:46:39 +0200  334) /* Needed already here for resolving __phys_to_pfn() in virt_to_pfn() */
65a0611d0ef44 (Linus Walleij     2022-05-30 10:46:39 +0200 @335) #include <asm-generic/memory_model.h>
65a0611d0ef44 (Linus Walleij     2022-05-30 10:46:39 +0200  336)
65a0611d0ef44 (Linus Walleij     2022-05-30 10:46:39 +0200  337) static inline unsigned long virt_to_pfn(const void *kaddr)
65a0611d0ef44 (Linus Walleij     2022-05-30 10:46:39 +0200  338) {
65a0611d0ef44 (Linus Walleij     2022-05-30 10:46:39 +0200  339)         return __phys_to_pfn(virt_to_phys(kaddr));
65a0611d0ef44 (Linus Walleij     2022-05-30 10:46:39 +0200  340) }
65a0611d0ef44 (Linus Walleij     2022-05-30 10:46:39 +0200  341)
...
450d0e74d886c (Zhou Guanghui     2022-06-15 10:27:42 +0000  404) #ifdef CONFIG_EFI
450d0e74d886c (Zhou Guanghui     2022-06-15 10:27:42 +0000  405) #define INIT_MEMBLOCK_MEMORY_REGIONS    (INIT_MEMBLOCK_REGIONS * 8)
450d0e74d886c (Zhou Guanghui     2022-06-15 10:27:42 +0000  406) #endif
450d0e74d886c (Zhou Guanghui     2022-06-15 10:27:42 +0000  407)
4f04d8f005451 (Catalin Marinas   2012-03-05 11:49:27 +0000 @408) #include <asm-generic/memory_model.h>
4f04d8f005451 (Catalin Marinas   2012-03-05 11:49:27 +0000  409)
68933aa973740 (Will Deacon       2019-08-13 17:06:29 +0100  410) #endif /* __ASM_MEMORY_H */


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
