Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B401851
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 03:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689563365; x=1721099365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PdwIbBykQsK84+uK9eIv9O+ALslyiGGe0dUhm0NHenY=;
  b=dcrr00ItKKHlgpTN+Yo1wP4TMwOnb3p2Sfsy24lq0bF1f6RbjjaxWf38
   yEHMbzzXECCw1cEEv/xY2xABrk7ZlT2qZrcgohmYgygZ4wH0WIaSUd/Xz
   He0BVEeJQy8Wv/VkKwMVo38ATiKbswETwqZhvXNfQORBVMM4r0jZaQSj+
   5y13YwOTUAlM5HDSrClH4w4rJld797LITIUQsmskt3AVoFr08K3B4tRTp
   ef6/ILl0nLIbPjhq9Ai70+XdectwCZR2wYOxHnCQF7pmg8pgr4H6OeEAw
   m6lJGpPy4Zt4BD8uj9/zOoRlOrZ3p3Ny/rNzNoCjXk3some1xzin/akY8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="432006341"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="432006341"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2023 20:09:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="1053738727"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="1053738727"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga005.fm.intel.com with ESMTP; 16 Jul 2023 20:09:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 16 Jul 2023 20:09:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 16 Jul 2023 20:09:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 16 Jul 2023 20:09:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWqM3Z7ECBbdSI4sIlvqUIq31L/JnvYODit6bqfiPOvvqkBuqY6gJHKUwUvfujRAO4dVOUoOAx9UDmZ2wiO8oxWZoHL6C5jMRRovXp9DDBzFgKYz+7/55/rqbAVxjgoQIl4/+bt35aXKLeL8gT0LfwDjcOJ6aMm8ZBR7W60Y/jDgvCBU+JBkc02agCnyKQuE3q9r3KvUjwFo99vvqEvSlabBYDOGsScy03m74fR51RnjXCVerCF0dzt/JMDfOyOWVNtKvRfC3J2ke+X6z/cYXX9TvGkV/+G37fsqc/dIJgVmp0lEzhAavILUBoYu0FqYtLh/hNUi2mbvAuH9t8u6Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ol+gTHDcJwTt5etSLqrBVCEo2gSppp3Z378QiGXsVUg=;
 b=HZdpRWMWU4tlH20FjAbFeKlEhvaiuapig04UbVOLy8qnqyQVMr24JetpMd5Gv32WeZoOffmRNBu/znMvWXqr1oiGgzxXAWcJPH8CKER5qajGh6F8YCHx3kyKpnJxW/tyYMRjhP1Fp70J5HqEfUHT2ltYRg2VtZH/6xsO7txhgW7Hr56qfNOaEEPErgwCEMZV37P5d6v/0ev8eSRdBUaheIcO4ClIFYJpEOV86m/UpC0kDS3AVdP5e3wdXfY3VMgEH+W3mX0QKwF34tw3obGWIzBkHFV+6l+a9NgrpOlznOSUCv+VXshRSOZbweeBC74xsIUIAPYw2hnebXN556U7FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CY5PR11MB6414.namprd11.prod.outlook.com (2603:10b6:930:36::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 03:09:20 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 03:09:20 +0000
Date: Mon, 17 Jul 2023 11:05:07 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
	Chao Peng <chao.p.peng@linux.intel.com>, Ackerley Tng
	<ackerleytng@google.com>
Subject: [sean-jc:x86/gmem 10/28] virt/kvm/guest_mem.c: linux/pagemap.h is
 included more than once.
Message-ID: <202307141227.pSP5wpov-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0162.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::18) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|CY5PR11MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: bc69d8b0-f791-4ed4-6323-08db867336b9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0vDqjHdhCpM8WDfDH9SetXJDNwNnt4LUVLADub4vAbbKIxvdex/kEKeHLH7cmARLFtr0V772NORILmh1l35laDT2Tcaf2bptgFcX8I2L9bPSLFwiCIGVBeOhqOyr9t36vnm8ihtrcNtX7Aggp3B15nL+YnEfY9usYzWgvvfZgg2ZJ4U0GTm2mqfMn1RQIz2EOUMcsqWqAg0Q684LuPiTcvuuTCeyIbVs1CfpYXaW+Xn3vupNtAerCTYzLN7qroIyWirnb+MuwfpMEs5HwLNZhvnC3d+iiXsil++stCWdA5IQKZTbZEAGcmZGsXKO+EEEHzvxNXTyxxbH2+47ZcTbP6tKwy0b7aQuYlDVnihBbirxXl9v4hR19ZRES38i6dvEuw2WFG6ZIf8t1No7rmnf8Mqwvs3NZMCNvSjHc2Qm/Fz/MNumbtuqRcFJ86BlEnKjUZXYK4TIw6ZPzFh8ok33BjrZAlmvjnVG6RWpu+og3zRWDgCA5KP7/KIUrF9fzmrOU/dIKN1SEDN9pnfYJ500kqrbjfKks2VfqcVZSohI9A5R6J4RM32/4vSiu/Ql7ET7CvTeP1qBDsuIp1an8+XqfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(346002)(136003)(39850400004)(376002)(451199021)(478600001)(6666004)(6486002)(54906003)(186003)(1076003)(6506007)(36756003)(966005)(26005)(6512007)(316002)(2906002)(41300700001)(6916009)(4326008)(66556008)(66946007)(66476007)(5660300002)(8676002)(8936002)(38100700002)(82960400001)(86362001)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L2JOfLwL83IAvGUwuYhObs2Zf+K6jfGi5Y+dLqLqdyRdR/xjlRjxPJki1v4Y?=
 =?us-ascii?Q?6qtANFeFRvhMKJm2Hsbl67/jv/vRABPh6yJ+JFPruMNakCun0KvFciBiF7NG?=
 =?us-ascii?Q?ZQHk3BNyt3WeVKL5p35TRmmmoPCeNrPwrJrkOqjp05QdXEhPoVI90c/BCzdU?=
 =?us-ascii?Q?R7dvVckurgSouFxjrfnOGNztlTxmWdne0DRpzLos7mYtSEXZRxrEpFWhM5YK?=
 =?us-ascii?Q?ca2985paRgbASo8X9Ez/z1mtzJKxh4jwPp95wCF8NAjc6w+KvvXhBL837/UV?=
 =?us-ascii?Q?La7uUXQX+rJEoZlOXtwhXVkD+8AFsCjBqSD3Utfgim3lBrJgAnKoGaOCX9sn?=
 =?us-ascii?Q?nTVpimDas5F+CXJjVohBdj2HCUXmb+a7VWPXHydrlTRAM21Vk+4Mm8Z/qQkq?=
 =?us-ascii?Q?Yiemj5iNxkKElPt9WNo6Ysv93xEOE6FbyoVRHVBaCll6jSqydcO+eGim4ofa?=
 =?us-ascii?Q?xkYu9aePHjHlTZW0xoUV83bO51T1fqaSgSnjN1zrJGO1GzIdQcwDvSr99cvy?=
 =?us-ascii?Q?pfTfliNpk7CjwUo3qKacq8e4y9Umxu3mOb9cl0GHJTDlYftNTbAnB+zcGdsi?=
 =?us-ascii?Q?z8EoVlVkFJ6AqHoqMoauPZ3wXBwkkpTcqhhVXJrhUw6EsUfNky3SOQqbQ7rC?=
 =?us-ascii?Q?LpI1UDXqiionT22tAkLIasyeGPL1aN0k6HQOS59EUnies8SD8YHoddWSS2VM?=
 =?us-ascii?Q?qXJCIRsBXwrQauX/JujRUU5VDHVxEnt/FoYGIwgHNajpvkz29szs4oF8lGc/?=
 =?us-ascii?Q?860HetLWvOc1niMytLYDhvyEB5OzF3KB3Ijd+oT9MEXQe6g2aHTS+hvHDCiE?=
 =?us-ascii?Q?jZ0j5DBShTwA6MvwV/ItfhZJu4gi7by2fcz9AX0162WUoCuJDbBd9Pe9VJUW?=
 =?us-ascii?Q?wEBIR6ys/fHnyhB83ZdinTyeHWo4EVupZbuPNYXgp59RYl6ARBWFduZkrKu6?=
 =?us-ascii?Q?T5DaG0ZMxK45GouIzp1lNYg50Tb/rBssU2UFTj52UZQRDqAO3fYYdtkf5VgI?=
 =?us-ascii?Q?hAFs4OvDMWaKrxP1032GmGW1//QDlvGOkNZ9BPmxEKkGgakpaCbChu72V22Z?=
 =?us-ascii?Q?Q83WZdlxjZPYSpGlsxycqn6sk5+unYiTc52aky0NzvkRIjv4Iu/SJ3JrZ9Ma?=
 =?us-ascii?Q?aJZFSRmzbCiPjDz4WonkEwzqbbDcf1xfV3St5spC3XT4EdH/LrXPA7Ssf/Bl?=
 =?us-ascii?Q?jfnmhmnl4fxex+8vQi78eJ9ITt7lcjrU4bIw3ghPSm21v/4ARgNdeItGTJjq?=
 =?us-ascii?Q?5NpVB/5eDQcF0TbWmNy9sREJR3WzQBVPIwjcUf3Jx+i4Jz2aYizCJGyFx5V0?=
 =?us-ascii?Q?hDhL6y9QXx4rYjusIL6h9//z7HW2F5EO43n0RhmWeDRXX9nzdbwCRTP233s4?=
 =?us-ascii?Q?Q2I/0WQPCmwObaiphnJDMr803sSXs0awC08jqr5Zv+kYox7VtJBKyCKXIJ3f?=
 =?us-ascii?Q?rjGTbVEEUTKLxrgJtLeLyQcgVVbqLkZECyUGqaqh0r/ST83ZB5OnnieCQFjU?=
 =?us-ascii?Q?JXi6muUgsmmGH5TXXT6WwuCCXl2lrn4W0yMmsrWXvKzpgkaUld/J7eujA5On?=
 =?us-ascii?Q?3VSpwtJkLW5jIF1Ks8LdauvSNJWtfUGbKp+yQKy8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc69d8b0-f791-4ed4-6323-08db867336b9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 03:09:20.2743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dt9wyp0Q+e3yMgZR1ooMNz0xbAZo6XINEMgNkSDupuLN1/FQ5Slse78+gebN7JePI3WYKcYvX0lgF67eJatE+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6414
X-OriginatorOrg: intel.com

tree:   https://github.com/sean-jc/linux x86/gmem
head:   9cbe075ae7adfaccafbef6c181188fefceaf7482
commit: 083ee48321c38c48cb22f98f966de86b2c6ca77b [10/28] KVM: Introduced ioctl() to allocate dedicated memory for guests
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202307141227.pSP5wpov-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> virt/kvm/guest_mem.c: linux/pagemap.h is included more than once.

vim +5 virt/kvm/guest_mem.c

   > 5	#include <linux/pagemap.h>
     6	#include <linux/sbitmap.h>
     7	
     8	
     9	#include <linux/mm.h>
    10	#include <linux/fs.h>
    11	#include <linux/swap.h>
    12	#include <linux/mount.h>
    13	#include <linux/memfd.h>
    14	#include <linux/bitops.h>
    15	#include <linux/printk.h>
  > 16	#include <linux/pagemap.h>
    17	#include <linux/syscalls.h>
    18	#include <linux/pseudo_fs.h>
    19	#include <linux/secretmem.h>
    20	#include <linux/set_memory.h>
    21	#include <linux/sched/signal.h>
    22	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

