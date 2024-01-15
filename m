Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C3B80A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 08:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehUPx6u9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705307991; x=1736843991;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Q6L/YyjEsOOg4BdBf9stDnQRcUylYIhuOptzIN52Aw4=;
  b=ehUPx6u99lKyAupv0OGme8IJZroU+wU8x9bRvfQODC1585+hqgZeg7k6
   tw26UigthoZ0GN5PhLtR0shgvNrN+KQspwyRpZwX84qqZ0vLldVWIDgnh
   +O//TH1eyY/uKRNr8JYsNOeV9ZXtoHy85zn7tMv3qJndYB+2WurY9liJi
   adnxlQx54L0HQo+DGyrlgyuh8/QJf94SR0PWGUu6X9CV9J13oUmWHrbtt
   YBvxsoGFvkMU9tX+o1uCJzJHJ62tnfEXWMaepn80SSrQgZQSuhQgpq2m4
   D7/JRUOW4QNHWdX7BOemg+QwJmJ/jgFRrZidCskoPY/dFgWMLD1Xwt2L6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="12922258"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="12922258"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 00:39:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="759797274"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="759797274"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Jan 2024 00:39:21 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 00:39:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Jan 2024 00:39:21 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Jan 2024 00:39:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=El9UGuuakHYD0kxDnjSLGLZ7WnKrVO5MeVeTgDlQhkLxywrzxgb/Rmnop2ggx4xElPGPFiAokG2nkPtI/5tIp3BeSbNPb0fi70RI4fK1YMSmyKvlKX536d5jp6KEaBHtVBoqrs08lI6MTg+Raexjl/dWo8lA5c1v8aTYFq/Z6UO35gAyDZgEcNzKybeyUcgcUMEeO+6cdReN5Uz58VOgaqjU23NRvYdwZs25YYPGd3OhttAP8AEI1F5xtRNzGPQKy93pzGEmR3a2BN3IadRSHfuS47GMMymNCYbGweDSKhwjawI+5VK4j/7NceiUfvNSeQZj9qfq3mZE95uryEGYvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSsRcqqTSZPnzTUOt5cEgB1/XipUqFectBYgZUTTslc=;
 b=LFUPll9W1yHU7irr7nWne6cju4CyoS2upOvFommXVX5rPs8fO0tp5AyqOgmlS7ewJIY3THdVPihEHoip6dt6aglWHFETtuqxqe+qyxhuQ2eRyvWR+Eialrn9D/JRTObqQ3NX9WB2XX9y0h05vSplI8X17e6PJ5U8lShICU19XFvqeWgcztIm9WWrk17qh95v0x0Q3/vijbzJnMZdfrbeyF6EtbanQCfzpl1vXgQ/DTpNalNGyfnuptlhjd/ZEgyRAAu4/JtSvtoxiEf/Tlv308nB0vVu5g12ZNsfh8/3MTDfimFZ6xE4k9LeG+U7cDJkZecj7eC+i3Ankq+nnc+W6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM4PR11MB5294.namprd11.prod.outlook.com (2603:10b6:5:391::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 08:39:13 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7181.019; Mon, 15 Jan 2024
 08:39:13 +0000
Date: Mon, 15 Jan 2024 16:34:58 +0800
From: kernel test robot <yujie.liu@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:6.1/dovetail-xenomai 15661/15708]
 arch/arm/vfp/vfpmodule.c: linux/smp.h is included more than once.
Message-ID: <202401150045.Mx2uvYjc-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DM4PR11MB5294:EE_
X-MS-Office365-Filtering-Correlation-Id: 412d3ae8-4c67-4d25-9b3c-08dc15a573d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GjQsTeoIDVFAZJ9UwfvW5YpJ5vLWplTreAkzWC8IeeWh0nhcrvI4Fg0I+7O7nwA2mDEzu0PHmsECCNEF72TZxyH09qTP4TOUez8fMl4Y0GacgxfgVxTDlUQhKTP6d584MWUkDpKAy6svLu3tUKaiU4UbFM2tAVQpWf2LMfmOeejUBM2QFNnzXg9NhOw0FkAzFftnNQ8rr/8aOI9XzrmVmm1EIHM1p4ygI2OaiGM6Dk+yNbW4uICGxDYqSn8s4drSEkO9HaN5+C03RddeTrh9Mp8D2y5BftI91/rR/igl+3ENOX9emwIhLYrfAqVGinzuUp685XUifGoO4QalJH6CPUGpk7jnfGkLAaFPnXErV6Slbe4mfemi4oGKjbHddb1PhOk9QBeInGsOUm1PwuOk4qIwRpAF+qsl1rqubYtaXFV0r1mDZzsia/dFVQ2ucOgS/p37iUI+jMFMsfMkEGGmeo2J73oYv+ol8Acel/Q8cT0lUEqeSz3qOhepv5nQXE3pFcXqK6usiBpAUGVntCpB1p0aN5dir4Gq1z4CsFksomTiG55IX0kNJt3ecCsgn49Dy+7AgUwUM6zeZn36ATYIdtiTv/I2APXN7c1GuzG822w4ri50KGn7V9IHUr6SjMYSVj0tggk83Q1kzVkeQ5O48hXcdT3N5H96cDCbTP/cElk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(396003)(346002)(366004)(230273577357003)(230173577357003)(230922051799003)(186009)(1800799012)(64100799003)(109986022)(451199024)(26005)(478600001)(6506007)(1076003)(6666004)(2616005)(966005)(83380400001)(6512007)(2906002)(6486002)(5660300002)(4744005)(41300700001)(66946007)(66556008)(66476007)(316002)(107886003)(8936002)(8676002)(4326008)(38100700002)(36756003)(86362001)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PIT/owu5/SUZXhfGnOcrSEwSRZHtFu5gb6EA0cBTXx4iL5Y/gs5wquj5EicT?=
 =?us-ascii?Q?ttCPQafRUQtbp3bDKgpnPpwIP4z/9SoPx0s4/f6i1wCQ5OyexaAd4zolUCKB?=
 =?us-ascii?Q?iKK2KHGSgaEhGBkhvmWNR8WHmCAYqtoFqtpntgIBXgIXVQo+AlUK/AIsWgCQ?=
 =?us-ascii?Q?Tg616v6T6al/hMqG7Q/J75dCxxiKq2g3UpV9wpe9XpDP2LVVn1Bm602F0Tja?=
 =?us-ascii?Q?rl7UO6pqDF6yHbf4qbFntH0/S/5aYNXlCYYSkNJQhTgczdKtZBiaIoug0fnB?=
 =?us-ascii?Q?ZgipOC3DxmWI4lYutBXXHi9Aovq8dw8mn6IMIyhyQPAIx3osAWKZ82ezmRNq?=
 =?us-ascii?Q?IcIUK/VVWjNXCKC5dpTe9q2Jtx3c5GCTUjcLLUog9VRtWR/ERyeTUBQytlCh?=
 =?us-ascii?Q?yi2qex6og/TGQXEHtrhtgfyS0ROWNMXfwZd6sBbErBQpMW/1+lGN2ubbXs08?=
 =?us-ascii?Q?SYkJWjO4EujpDlZb5Qo+cVpAt8DW7yT3iBDWpxB6fVfhrOtNGWwWZ7jPob7E?=
 =?us-ascii?Q?R8Ug+XLoepQSE6xuV7+539O8y10agoXhq04wGPYl8A3IROrX6OWUFuHn135M?=
 =?us-ascii?Q?2h9yd+koKHnIpbb9Hhntr5DaMDd3sdSIIM40gP6yUAxy5fnMZCkr2IGUQXuH?=
 =?us-ascii?Q?dY3G4zJGYVXm04m9a2TvjvGirPEgZPAR4A87v0XASNKjwTHBacHUsBWgHBOk?=
 =?us-ascii?Q?Z0ZorGvPlYt4PXzyzFqG0b6/BrfsWgPHfUnuB8rz5FAcCja2hoKqJD5T2ZrB?=
 =?us-ascii?Q?uWQGULMN3wsAF41lSbW4/N2Pfo6YwL47D1xGoFizpQR3EA4igUZL6P3o/zQ5?=
 =?us-ascii?Q?w3VCj4t/t2qG1vzR0tLwbnwxOgu93Lc6+N/vkgYEkUg3bEKYzCTX+y50NMkM?=
 =?us-ascii?Q?42hBmNL5sNY4NElHVI1c4sTZPbX81QZbreuYGoVWmycIPfEtkyjXE8Aa/dBG?=
 =?us-ascii?Q?IREeK8ocEhPCPkEIUq1Rnc9frg1+QweA58YymZWEQ+JtPmNmRlGO8UpH9p22?=
 =?us-ascii?Q?XykXVd/7SCEjN/aIi2jHOohQCFnru08/SJyBm9v2ehiRGR1gNuVdBYalFO9a?=
 =?us-ascii?Q?OlPwuMhBOBxxYIe4YcP20AITQ24xZbh+akuV3l8w545oY2X4CZ3R5whCqtXd?=
 =?us-ascii?Q?Od2i3IYR4JV6klQPY7nxsn+LDhwo5BdKihW37WQr/qrUDgbkAFzlQrglmG3R?=
 =?us-ascii?Q?lFjEypPr1/CSHJ2hLDsk+f2KORz5Hdr+ZqUPamB3ejXfBE+vsFMp/vz8HPsV?=
 =?us-ascii?Q?U2oVsH8/eveK+kvjBkmWbYesui9TcPGavUeqbNYpfO1+/6ePXC3n1qVgr6fB?=
 =?us-ascii?Q?UPqLoiKgfGWKfSwwBSxFu3ul9Clpr17L2blIrSXxPwOs5ZWP5tU1aPeD8x7H?=
 =?us-ascii?Q?kL9M1AQDNR1rkbMcbkfiA8QrNA6ppfYqeGz4Ju4upfSuVDUxOE60GTkBUg5z?=
 =?us-ascii?Q?npe2P7QP+6eqHF1Qtc9kx6/sWyx/ZtZvMfCBc2CSvmZFX7V8V0XnLyxjRgjR?=
 =?us-ascii?Q?nfgCc1N/wmFS/GfLKjI5GITyC9hMV7Jg4B4nctGOmPNlnx+WUUD4He0QPpVe?=
 =?us-ascii?Q?yqhDndfIZ5wCIsLmK21VIJKSKslSeIUQJ3AV4ZVT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 412d3ae8-4c67-4d25-9b3c-08dc15a573d4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 08:39:13.7438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uB5SmGB5+ejBLj5Y8pauKP0hbPrPjLahCUy3qPyAgcmTMqazu/seFvSdtU9bbh0Hmf2f3+68/NsxoiltZdHSVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5294
X-OriginatorOrg: intel.com

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   b21b4201c7eb0370e452a439cb4ce6e97c732972
commit: e208bb70a0c75a7032385d20e533bb1498e09dca [15661/15708] ARM: vfp: dovetail: enable alternate scheduling
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202401150045.Mx2uvYjc-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/arm/vfp/vfpmodule.c: linux/smp.h is included more than once.

vim +16 arch/arm/vfp/vfpmodule.c

  > 16	#include <linux/smp.h>
    17	#include <linux/dovetail.h>
    18	#include <linux/init.h>
    19	#include <linux/uaccess.h>
    20	#include <linux/user.h>
    21	#include <linux/export.h>
  > 22	#include <linux/smp.h>
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

