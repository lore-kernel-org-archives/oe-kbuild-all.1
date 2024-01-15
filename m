Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BA46FC8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 08:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJcWOO/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705306697; x=1736842697;
  h=date:from:cc:subject:message-id:mime-version;
  bh=7T1zkhLOU7tZvUcQYcPWfz+nV3ItnziXXE7atcMfpN0=;
  b=hJcWOO/da6R/Ic4Lfw+0nlfaUvwC+nJpunrkgSQaOk+7fSG0RiDXZ+TN
   xYsXarc6k7oj+DqitiOuhmJA72QP8PEm7aciFNCWkCPTDp3D2sN9c9kLJ
   xcCGFXKXq/oNKpcQc6sYT6sTtXZAGT+Z8GqY5ehWTKeUYspk21Ga8kAHh
   IrkkJG7NthwrCtm3MgFDNh0DKESEWk6vBywXP6MbZykZwAirlSpJOhQnb
   RBpZkZVzvbPPSqrD8IvdHDIQlmkNWqXw7xnXhoRufQUd3GFy2+nN6GZda
   YLjLysO5cYZ6Ux+rss62GCZaSMSLNKgev44kDu4ZNox8EIyhpHYCj6bRb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="6283236"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="6283236"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 00:18:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="874030591"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="874030591"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Jan 2024 00:18:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 00:18:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 00:18:07 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Jan 2024 00:18:07 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Jan 2024 00:18:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lyw8OZKQ8n7O/cb/FWcRVGNTKK7uAfkPLUTPGM6Y1oj+rOIygzMErJDQUWx/PjvojkddI2h4O5wKeOyfPQJK91kTIXDbZ5D+HLAWw2D85kuzKSpPs/amlV/UStoohOvmgUJHdWx4yocgOiE/Ha6NwJcq8Lx3/a+EvIcIEjqdWAUWnSRN59n+oONHbjMLJRZ+kBh2fSgTITHe5g0IMSWTK3O7i4976xniSwArciLkH1IjeZ/nL6PRhOdQDIGKQJjr6TcC4++wG9FFDq8YPWbID+OQbdGscMoeKqh2v9ou2NfVkKCfcHYmZgPCXH2abBMNax3JLbLHgqYh+ZzXcKzNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adxf42CcNAFH7bGQr8qAsSOzPNqcK4Cl8vY4cyqFOlE=;
 b=Eyv2CVxmQIXYB3B/T0G+CgRMVgmCJlWiNAraywVklKNbB5JChVGHJX4Dn/t4iT+bE+l3l407YQej6UWp8ljSwJlw9hrmYzQ00JrdzDDFBY17mY9Kkss4C9qwWZdZFtisZ67IJu9H3gSg9trqRwQGU98B1U6lNYgKjaONwzEUtOChq53OgMmTxuIt2i+KumYvOGlxEx16n5zQ1DITF54ge8nBgoDBDVlagHbo3nEVWhi17DAnPGRWjYIlLcAHaKadQXtdbwMoc6PZ3QtQ1k+s7/JOenc/XXITXIuZHaSuXhC3nR87QyMxHDO8kg0cvS695ml4Gw9OfZU/GBHPSEOaJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA1PR11MB6664.namprd11.prod.outlook.com (2603:10b6:806:258::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 15 Jan
 2024 08:18:05 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7181.019; Mon, 15 Jan 2024
 08:18:05 +0000
Date: Mon, 15 Jan 2024 16:13:50 +0800
From: kernel test robot <yujie.liu@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Hao Li <hao3.li@intel.com>
Subject: [intel-lts:6.1/dovetail-xenomai 15605/15708]
 drivers/clocksource/mmio.c: linux/slab.h is included more than once.
Message-ID: <202401122105.8DOW8dWD-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SA1PR11MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 990468e7-f937-4285-5d97-08dc15a27faf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0bgLEZ5GCRhDhaEZChp2IuQ/8GPEGgv/ZudQZNHEaOwWJhPLLi7ryY/bGmORIpQLE/wHxQ8+3mHDpdz1BtVaVEJn5vMjcOFUBVyFItx3jwSk6TojclnRgcu/lbEg/tZoIRFzElREdlk+K0vbZmyw0sj/iyo03tQdQUjDY/c5uMFxwnwj2INlWfOP5ay93nB0x+/aDn1utmxhbSLaknYJbGrIps3TLCf/zyegneJhrCiP9WkIXL8AU2Ra5w0eObPV+2ReFS+VZ7D9dDZiv9lXFPPoqz4TDkZH48VH6Ltr7MdsF7ERiMGHJdxPTfXCVSZszLStcr3np7haP0zpoleeIu0TG6Ez2eK106dLGd06vgkBjvqeuDTQRtmnm9OA4DjLcqOTjatWytsBGzMwrUFa66RiJHyXZrvPTnGveMb4NIMUGGcRwSjjBN3avFVwo+z17YoG8QN4+I+RNDJgtX8spbEy9q9+In+X3lOmofabVxoxeFez20pT6lCmvvul2R0UUS9T07yX8Q1bw1CrxqCtOd665VYjOUnLjcshU0w3ItJ+97oY3Orhz9B6JvvkjDCc2ZmkxQttsKhJe66MDZUpYlx1M5F53zejYcXwVSL9j9wsG+0T8zP4EDN55Tkz4rRiLobq7bas2jEBTAZ3aVetRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(366004)(136003)(346002)(230173577357003)(230273577357003)(230922051799003)(64100799003)(109986022)(451199024)(1800799012)(186009)(38100700002)(26005)(83380400001)(966005)(6486002)(8676002)(66476007)(66556008)(8936002)(4326008)(2616005)(316002)(36756003)(66946007)(6506007)(1076003)(6512007)(107886003)(82960400001)(478600001)(6666004)(86362001)(2906002)(5660300002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tXq/51Mtciw0M3wjafx+6wdh3FKKdcD6CAOhmuPfsjaIG76S6t5UTBOYsOZg?=
 =?us-ascii?Q?Y05n2dEr5NkuDbd4x8PS1JUdtYkA4YVoMivoEHGXB6U/MUM9pv8rIDPcBVkP?=
 =?us-ascii?Q?eWnvEhR2bL/ABZHbG18rNsNKrXw+iAlBMATjbENDVVtamHAjps9BU9yPdi8l?=
 =?us-ascii?Q?LFcntx5WWT97eMXJ7hmj1YPYck0R5eXAYN7bLqp+VX3EgcywMLgCYZU/wwcD?=
 =?us-ascii?Q?N8uQkENNXCTzDQASbTaLj4yiCs74ZqiYutULfzVHFMCzVS8uEAQ33olTZ3c4?=
 =?us-ascii?Q?yfoKjWlmJxyAFUJnAGZsM675kH5l7zRQD3h2KRIRXVncm29Sq0rL6Ejz7IdO?=
 =?us-ascii?Q?RLbOZLk84yQP1CBwOuhACJLt27mgv+MJhyaa1buwsZB4PA+/S95ozznNfZ26?=
 =?us-ascii?Q?2T/pUJr5RMj9h/wlmM9adF9Tac9y29Q7CeXsbL8ouQ3uw63sEgk6u2hg8Mem?=
 =?us-ascii?Q?c4WrCleJogXBDTxuD3nprm0HSERauzMp9hmjf2B8xSl0jUXBHbydHbynBz/h?=
 =?us-ascii?Q?o63Kp5wGit1gbTfEPAFAXyyvClCtpNaXs+DZA3XMmGdT+7Wre7TQGXFRP6st?=
 =?us-ascii?Q?LcAOsJIqwHuVcGApN9jWzS2K1Tqgw+1djZ5UJKzNn4oJUhId0fwjMnq3RwO1?=
 =?us-ascii?Q?5F7rLhBNCvJCBMqg+OyJdYEGJPi+FLEELQLpiFTMkbIjhx9iaaNaaggzyEoq?=
 =?us-ascii?Q?bnVAI6/UDyPk/0KbJDnAL0o/Q4VPCd+UTC15KJKHL8qjTKiGwxDOgsXyJvdd?=
 =?us-ascii?Q?Me19NHJvn0ASkIKGPsCHed6hEzJVKSO+Z05RX0y9hoPWQW+pgxxPaa4XF54/?=
 =?us-ascii?Q?Y8XUlmzm3YG/6BW+GewXserqcJKEt+aIHIDdgEJ/e/0AZ5aUBq3blOSe4Zo5?=
 =?us-ascii?Q?6ilREhuQcsF4IRsK4Slg8omnDlLKf1EAioE2YxR+Vwd7O3Zw0FjZkfghL7Gt?=
 =?us-ascii?Q?9DFX1w0pk2d/vWVlZ/jbJRxxTXzLjedin//16t3tAICQNcUcQD2NGIsfIgHf?=
 =?us-ascii?Q?69QPDPJ6f3ngJprWSSf6gMadiIbaiEKixSefROtsG9dAov1Lf4+hmi8OCeGG?=
 =?us-ascii?Q?G2BnxnbW/JSUhu3x5GSNLgJQXd7fe4hfaCefUB8+HqNJCFjxnL04jDNUaMsL?=
 =?us-ascii?Q?lnXKtBEBtDCVJez9QBrYF5gdlh4unFWyG002er+FvZufFA0+l9ljXUucrpaB?=
 =?us-ascii?Q?UoAb1rfkLUh3J0JvGtfPaOemWoT5pwC3eAoxbwIqZmva4W17mv3129UlJhRV?=
 =?us-ascii?Q?7oqkaS2tvTZmq3hD3s5IxwXHGZXHgCdeSthyoTYDpXgG3lNwjknG9ZEb7O8W?=
 =?us-ascii?Q?oCFIjsSME8oYnOUXH2pGOa4QxEuFYqTiU7IPcMOaH3DrY6ikXPRTavQ9NHt3?=
 =?us-ascii?Q?zC0iDIML2PBK145a+BXuB+I8pe5GVT15ooLjW2+e0bznGAgTazJOoGfMV/rP?=
 =?us-ascii?Q?k+GWm+6IayUlSw8PSDGPTqtyDKLcU1+LeLLzrnnFKKDeUsarAmu1ATFbbJkm?=
 =?us-ascii?Q?yFLvhnyZzxY5MWtBOUwBHFwah7/zPZhChGUMNJV1gf2rtmwIvjC/3diNK2cK?=
 =?us-ascii?Q?aGSMBqqjKhtXkvtWhov38I60iPm6876qGgazY1aN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 990468e7-f937-4285-5d97-08dc15a27faf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 08:18:05.1526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HAFosJRVEv+B1kh8lfTK0ioDdNENCzK4pCVDPr6Azu0BPrnkFx4tyuyPGPIal6wFtcn+OVVIeq7A5wYgpY1AzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6664
X-OriginatorOrg: intel.com

tree:   https://github.com/intel/linux-intel-lts.git 6.1/dovetail-xenomai
head:   b21b4201c7eb0370e452a439cb4ce6e97c732972
commit: d4e16bf0941a00ae6aec566cfd1496d416139429 [15605/15708] clocksource: mmio: add user-mappable mmio clocksources
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202401122105.8DOW8dWD-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/clocksource/mmio.c: linux/slab.h is included more than once.

vim +8 drivers/clocksource/mmio.c

   > 8	#include <linux/slab.h>
     9	#include <linux/spinlock.h>
    10	#include <linux/uaccess.h>
    11	#include <linux/miscdevice.h>
    12	#include <linux/list.h>
  > 13	#include <linux/slab.h>
    14	#include <linux/fs.h>
    15	#include <linux/mm.h>
    16	#include <linux/mman.h>
    17	#include <linux/device.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

