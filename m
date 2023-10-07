Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF1D1377
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 01:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jopauiUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696643596; x=1728179596;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OqAjalKuM7D8lf+PPUZknO+V6abv7cBHOuBJszTTW7w=;
  b=jopauiUzsVtnLmjBFbaNgN5pcBgs79QAWITIwdTmj126vDgjl73pou8b
   pEuUdVpHfYORcO6mJ/9M5IqwD5lVNsTtvm5wcJOHMbDDDHdu/gpEabLv7
   S0GJQktLp/FHD1bqxe7apCmQIGmwvdTs4/L60N1WLEwjtayIufOhsuFMB
   BTaislPj4bp68ISe/vvaw2AUpHeI/vAXPQ0HLVSxmBcl2QDgS7qtbC02e
   /BvfJj+3poR9cfls+Ed5biD9/1B3E2nqG3ih5MJI+74HtxruraktTJefW
   VHco20tq/iqZ5HXwNSEpdqcNlZPKlbcSiqVhV9SRKVK/J/SGeCz3iTwfz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="381147902"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="381147902"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 18:53:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="729046933"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="729046933"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Oct 2023 18:53:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 18:53:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 18:53:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 18:53:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 18:53:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g6wH3v6UuKM8EgcaYO2IOmGXrRYSQt++ZL6qcAM4q6F/C0kMVaDdzqquEN0ey7VplHgVlub3z+ipFnmZiimRNk1OCyhl279ikq/SLGz9mjuMSPSdf6WBJlglZLd3lhbHhhBjSTArBYoBELXxqQOF+PhI5kfOnxIU8erT/R5wAjKh0I9S62kjV9h0joO7YHIhJbu8bIOZeNf766adoV5xFV9GpeA9dhDLu1j06rUVSqT0PjHCI8+U32/wFV8h9CwLJKDEux/cdhI0wPy/5qBrtWRx4c6mw044AXLYgvdUUfe8sCwa+/UDuG2pOgjou8s7/jhHRpBSX/rz5IM5sU5Yog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbGJ4m3Um5hG9m91C1zB+mVj3fOjB9bqmazPlT7Hke8=;
 b=ZtP+4w0FOIDL0/CKX4FwU1SJw0DaAk4/CIIm8TaPJdXVCrDRJdhV9KzLgZS6KgrQqOOqegWhtBhnEvJs3M9x05IrCXmhIP88LVyhVikYgc89CB6BvVaBc/Qs+7kXvhDbfbfzw/Edz/8lMuSto5E03cm2mVd9dAqoUcwPi2FyHEyNfXWwgI1K1oKnVO4HfkDdRHsYQn5lcjnMcy4Yf51ULTF9NoAs0VedFrMHLBDW+MJMcwHOk9w53h2md0z4ts7cW4/eyvVExpicNn7si4GX0PSrfXUyYnlBPXwvfNmTW0eqALzs828HKKoSKk9ZnNLhkKRlaKUXaIRa5edmA5UBMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH8PR11MB8105.namprd11.prod.outlook.com (2603:10b6:510:254::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.38; Sat, 7 Oct
 2023 01:53:11 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6838.030; Sat, 7 Oct 2023
 01:53:11 +0000
Date: Sat, 7 Oct 2023 09:48:17 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
CC: <oe-kbuild-all@lists.linux.dev>, <git@amd.com>, Michal Simek
	<monstr@monstr.eu>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	Sarath Babu Naidu Gaddam <sarath.babu.naidu.gaddam@xilinx.com>, "Srinivas
 Neeli" <srinivas.neeli@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 776/1370]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c: linux/clk.h is included
 more than once.
Message-ID: <202310022337.40ktutIb-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0027.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::22) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH8PR11MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d82e016-e28a-4bb7-1e6d-08dbc6d82976
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uuVXxX+UUd7gU7NkHsw2ss7a7sNrADWJi28YSOSnAM/Pw/ZUhUf2DA6lVrZBL1fn1y1JJA3V5Z+v09EGKab44GzzKErGhUa++Qi1r1ScFGbeSELNCRW7PsgE92BL+qyMOGlgmTIIDsQ+f0sgIluKiY8Oh66tyPe+sdxvaG+feXRyiQ1g75Ps91wiiVD04DnSrXa7DXkGgQlMueXN9ejLdWrggCc/YpmU/Rr4rn10dyAMNJjDU5AQZYB96g4iektnAUTksctAzNq//E0YaNjt1YQ3zBvmroIwf1Hhy1m4f7spntdySFhHKAe/LVt3wwESQTMrOYTqYZ/agLX8llr0NzDVLK4KiVzup5w/3ZFoenguVu4Q+mzoWtwGh0idLMGeb4GWxV9l5SCxAl40w1zspTc6tRormKctlHm3y1alt1Igxv6EFOozB/IuEgB6kYv4oZTMAdnHusiSxx0DipByFdlNnWq27etQ/eXf+athIV5gcZmz3MKfcSF9ZekfogADZIl0uqhUvb1bkwVp5cHVRwf9l0UlOtjIsHETPx6Wqwwefsi/QjAqcwgyOsEwn31QJcv0+GU3AqDlC2bV9c2afA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(39860400002)(396003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(38100700002)(82960400001)(86362001)(36756003)(966005)(8936002)(5660300002)(4326008)(2906002)(6512007)(41300700001)(8676002)(478600001)(83380400001)(1076003)(2616005)(6506007)(6486002)(316002)(66476007)(66946007)(26005)(54906003)(66556008)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ILauMv+hSmCRjsesocRJGstmphlb7cdGenTnYQATFBetUuSCndNWHTYtNL/j?=
 =?us-ascii?Q?KPAEKo5jEa6vMBH7UnUNiTxDn/tluFSf2NPP3TVGWEVdUMpEIks6uVSZWpX2?=
 =?us-ascii?Q?CIagz5VL9UC8cfcpUR+njWNsT9LHIrj7KXAHf+vfMBwEHt0tj0ygrVnec7ZT?=
 =?us-ascii?Q?7pMIBJaGhab+Usb1rlRfbSnoSQRi3VnSmpc1W/3Y2ioEa4L5UoDeeVGbQDin?=
 =?us-ascii?Q?JGLoG9hG2ng1F0LHbkhmF2YjMNUsKuyrBqky60kH4iKUXCWuO+iqt2IIMkgg?=
 =?us-ascii?Q?qZvpPYoia99WG+1S769WiJYg9/NI5r/H/+m2hR8KIRX3kDv9JskhR6Cw+oY8?=
 =?us-ascii?Q?ON2mfV397xUpDBh0fL5GMTE4TKveB3GKK1Kf7jS/nVUNTDs5u0O7DDDwCAns?=
 =?us-ascii?Q?IWzl3NBcu2X4XXpoTP93Do5ECuI6UJUVcn6xha56sUlSk1DnHddnKuEza3lY?=
 =?us-ascii?Q?mwiP4ofJQsUeDybd9vsUysubAD3toZPrBVS2uT/M4mZbN8OEI96ptTrJKU6p?=
 =?us-ascii?Q?A3VJL7SM6CkKfDKqH+VX6O//MTp2PgsE6atPAhVBu+T4W+KWLe1hd/E1Mqd6?=
 =?us-ascii?Q?6boUtvan/yFCnyaSGOt9QJpbgY3dBwtl/p95Hoi6E5FJhb8BrAhFY4hoMeOi?=
 =?us-ascii?Q?vNGoF0tBKCxHYPX3oh4ZcZtY7E6ySl2PUbFV67w5dvhduSuMgBBUtneLipCP?=
 =?us-ascii?Q?xck+ykf6furh6gs6lelruBM08jRc1B90XDNgCINUwCbwYdSXTCgJ8jyuKrOF?=
 =?us-ascii?Q?tXTuY8i0VUm/l086x7QB+pihwNjDBONPfw6UE2R9TCIBGg8YnlunF5cp804E?=
 =?us-ascii?Q?8RxA3V+kgN4I3IQ1+NusgX1Lw4PNQBzoj5NWWM/9RYlpIePWE68gthfdM3yq?=
 =?us-ascii?Q?sCPoB8pQuO9wMxN+rMokkPj0EQ+YCZyo81krIINZwZ3d8nUyotV/p9v+c7/c?=
 =?us-ascii?Q?SauQpvmh0dfwNSxmRV7LVmF0TFqjTJuveI0JBKIZdXdvU3AssuKOnoBdbmQT?=
 =?us-ascii?Q?dZF0Jtpua/KP7Fvql3VcXrGl4swBLPrKF7ur8qMRmaezVcZ7Hzf2dw1Q9d++?=
 =?us-ascii?Q?RSl1ZESllZAugYkgcZ6N+6bAi3T/jl8hL6bzQNqUna05tDHizctDWyZb/NTi?=
 =?us-ascii?Q?ThEldg4+3v/bsH9vzTGnU+U1UEAf+5F3HmJkxB/yOVp0aZg8+I4xfO7C7rZU?=
 =?us-ascii?Q?6upFMv2GEG40aePRQNNXOR/XSHxb0Sg4FnmjSyQ3USkuezYuT7bepZtL0oCj?=
 =?us-ascii?Q?VHBquxXlSHI5ODEpZAvgN8O3FQhZuBSApj2m2uSRPCHG33vGOyT/CwD8tjLh?=
 =?us-ascii?Q?F5He94fuTbGTGY87LXjw32p9M8IVQFYIflbxR8AhBLOIIMgzpMEJMGRbNLud?=
 =?us-ascii?Q?rx2+CoiNEW5Fd/gP9MtNILnfOOQ+vuPmX0tuJ06zPltSCKeNZwKTs9Gq2z/9?=
 =?us-ascii?Q?VbLfiIKXxTQjlzEvhLahWvsa/IcyB9MFmU/vUoGomA0qbalW67jdMgEouFSh?=
 =?us-ascii?Q?veQ5VWYnLmwqKuZ65rA9ZSwJJqhBN62vlekunwqxGKZfNr6Qa2cky/90Mday?=
 =?us-ascii?Q?pTb41WldLTEQlEDgjLIeaxIPuU+JoCy+Og6LzzZi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d82e016-e28a-4bb7-1e6d-08dbc6d82976
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 01:53:11.4989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rz9Xf4Pnbw/bIMsscYmvW1UysDJbYzs3UI6R0c23ikZtGrHx+kGPHx4D3vyvQxMYoGaTk0Ki8okz089DA5Hinw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8105
X-OriginatorOrg: intel.com

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: 5fa84b9723e42132e5a1b6c98f13b0ae75df64ef [776/1370] net: axienet: Add clock support
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202310022337.40ktutIb-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/xilinx/xilinx_axienet_main.c: linux/clk.h is included more than once.

vim +26 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

  > 26	#include <linux/clk.h>
    27	#include <linux/delay.h>
    28	#include <linux/etherdevice.h>
    29	#include <linux/module.h>
    30	#include <linux/netdevice.h>
    31	#include <linux/of_mdio.h>
    32	#include <linux/of_net.h>
    33	#include <linux/of_platform.h>
    34	#include <linux/of_irq.h>
    35	#include <linux/of_address.h>
    36	#include <linux/skbuff.h>
    37	#include <linux/math64.h>
    38	#include <linux/phy.h>
    39	#include <linux/mii.h>
    40	#include <linux/ethtool.h>
    41	#include <linux/iopoll.h>
    42	#include <linux/ptp_classify.h>
    43	#include <linux/net_tstamp.h>
    44	#include <linux/random.h>
    45	#include <net/sock.h>
    46	#include <linux/xilinx_phy.h>
  > 47	#include <linux/clk.h>
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

