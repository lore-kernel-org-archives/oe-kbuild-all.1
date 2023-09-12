Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE748F54
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 17:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694541319; x=1726077319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yxW49IcJu1GbrJqb6wi3h9X+EmgVAg9Bp0XJTJpJl2k=;
  b=Vmcjhpi0mRAN4Wf+ZEQ2E9HR0TyPzN/Q0dJirEanQysBbzZ3ntdNn2cH
   bflhL7Yuiw5MMfmACcvpkMfqNJ5P8RnZ2M7DN7WhHocb83NqccxhAArpU
   oUUfTB6OworTMUMz6VEIN0sGguuBBi4lzkGXdsM7vciLXm054esIBnfNu
   ZiTO2R9SJ3n7GYzqLEYkpY72889M6NHYb94ZiRe1gx0qXVL12dn4LGTOm
   RIH4WyR6Ik+CjcNMGD8G/5qMBgHKY+JrNbGd1rGYwCHMVGWc/Sg/slVc3
   Un/KbsrmD+S73orbmLfC/SmUw37JXZtUTVpdcmLhBRcYKUCsvJD4lAh9S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="357882762"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="357882762"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 10:55:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="720509383"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="720509383"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Sep 2023 10:55:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 10:55:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 10:55:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 10:55:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 10:55:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHvr1YbeE8dpCxAiiznbGaXqUclC6VmbRNtUNsZIXWmgqOtk2UtHHbgw5CON4yiowTbb8Q9Xfpu8Jo2zDdrU+oS5xF/ZS7hHltb3J0NAyEX+GwXEUCKhoZTyk+hjXEdUbnBENyi9EyRk6omb3sOYNVyk6CsGmNHjTyU8wQ4ad/6oW5i2LHjDk3PZZqkEXrS1WgJwxkksHak+G3QA6Y/dm2HOBusLEfR0M/F5Fu5lkBMRFURcxdNV6312YFHRU3z1wc8pvUAyTOF+d1yBww53gFxp2IUcXXO+tVN+nelHk/Za34qz42aEMCzzS7EtmDSdDvmKp0H+nH3ZkD+rEJ0/yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3O2PbGRBBtkc67N88jvl+fdK1CPNfxke6jEVDqAU/w=;
 b=jQOlnB9uEfISah/26rd8+kOY6oX44G6UT5QbzUE778jrM/1Ppk2Nurk1SoR8dWTcDorAhP2IGsA3r7xFYcLaXVwZax4DmZBSGmW4kZ/+ftRo6pQQDV1kEa+z6/RCN4Wn5/1bGV9sn/JZl2qVYClZ8XTmFxlqxNjPnPo9UdZdJn49KHjNp+5kd3zWxEXLdtla+ePXyF4f/z344u7d1V1jpqUi79RQjMSTdBel5GL9zRN9yop5Lui2vzPtnotD76pnG13fvjZquz+sFrxYmgAzKdqPk8ZKd/ZvhRCRYI/fYJTGdIIO1z5asuT4PcuGGIalUYYESy5qFuW8VbTFHOPF+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH0PR11MB7564.namprd11.prod.outlook.com (2603:10b6:510:288::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 12 Sep
 2023 17:55:13 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6768.029; Tue, 12 Sep 2023
 17:55:13 +0000
Date: Wed, 13 Sep 2023 01:50:08 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Jonathan Selnes <jonathansb1@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, Hans Verkuil <hverkuil@xs4all.nl>, Erling
 Ljunggren <hljunggr@cisco.com>
Subject: [hverkuil-media-tree:hdmi-dbg 9/27] drivers/media/i2c/cat24c208.c:
 linux/of.h is included more than once.
Message-ID: <202309110546.f8QdSkwB-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH0PR11MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef48947-9224-410a-4154-08dbb3b96a0b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TMrDWS4hSOv70YtsVTt6EXfdpG5dechHk+MfKcVHoIMHX2t0imnNEoNuh+ODO4E12RHlKZ9sUA1Jw8MfD/TezaouIz4K8CbUXjE4u7SVzbM/pqLiIxYsnKw/OCKOwCAkYd6QDQ0RI5LTYNy/sGU90U2S6c4Bsep1+g3kk4fJlycOv/5fDUT9heiygl2r7WNnxe4uzHNO5l4kM63hvPeBhy3LqURfhZ61yaLrooCYmkEJcgqbNDOTBCuaOzlpBOSyN3HHZLXxAd3r5Hl6urMofa8BI1k8t5/xyOBEyoqxWaja/fEzJhIE7QZ2nYlgqb7jIPMtYp5XYdGbONvFuWV/Cs6cKXG3ArKQNc1iq03J8+IBiyo2P7Ktrn2iRlAFafFvYnEzwgoccLQZFSC1OtTAgmEmyCiRqnQC6jOcBzmqGp4DYDda4ragvyNRiUaNYWXbdhsHj7fQoOqbQHLb55FmLL6L46trSMcZdRBA+C6xzpmIFbTLAoXcpf8r4d95U6KbGquKXcsK5BXPDbPI5F+x/vKMfuzNxq5MYEFn526nqHrm5XJCIt3bKdzk0DkgYBINY2aA7N0Qf0UCk5ueHZAPBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(39860400002)(376002)(186009)(1800799009)(451199024)(36756003)(4326008)(8936002)(8676002)(41300700001)(5660300002)(316002)(1076003)(26005)(66556008)(66946007)(54906003)(86362001)(66476007)(6916009)(2906002)(478600001)(6666004)(2616005)(83380400001)(966005)(6512007)(6486002)(6506007)(38100700002)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?11YqrE3Ji8A5x2kRNP+W44qq+CNGOdeT+j07UOzbVnyuO+mybjXQ1LW9xOhR?=
 =?us-ascii?Q?xwzgUGAqCEWvT7BdTii6xAOlsHY7aah3/UbjUC1Crgw45q9pHf/y7HYmmca5?=
 =?us-ascii?Q?jHSdUQCtN/kxFX52IWvZLCVna8QlkLz1KyhqApBVQDfKX0iIE3Wfx20CULXt?=
 =?us-ascii?Q?qtN+kOrPyTkHEnHzdr04IFYZh/LmdEdmr3H4OZuVgN6Bxa2iZ9OAjQqctTKj?=
 =?us-ascii?Q?DaHGtaybcZZl5ZXHCSmnOiFVG1YEcA4m7tKtdbXTqjQnimtOWy3AcdOGoajC?=
 =?us-ascii?Q?VSci2BMxyXbVE2l7YcdUNvXa/27I1hUWnyuqW8tGyCSlCcgQtU84N9J+ReS7?=
 =?us-ascii?Q?dEUo5v7HuQFcNv2MhZeOkr9oLily2rjn6bdCOtCqX4IDPdJPVWTB7RvzM63/?=
 =?us-ascii?Q?dOJeQP2kNieNbBUxcEjru741GnKcsOZe9ycIyISFdTdPXRLFfWMKDSblDB1G?=
 =?us-ascii?Q?/sobUDEhrn+KqU9AqODBlJ4Fp/2QHgMsUYq4w13aH9XByPMuxGDwswLKDiqo?=
 =?us-ascii?Q?znHfmKNIn1irsGFaJx++Xx7PDzjEqlxXr4+L9a2kYYUYELVFWgb5zWG4nvDi?=
 =?us-ascii?Q?RIU80j8nGEdtwl/8m93M5P/hBnoo6n3aLkqnY3vgKK6i9WFXkT35mhEkoZq/?=
 =?us-ascii?Q?WotinSSMxDOK2E3BqywbJt8bvbcte8I1ZMD2sZ45cQJpAkHxgzLrCy1PcRK6?=
 =?us-ascii?Q?h1vSziRV9OaHzcogW9HKZYAFvnC39weM1TUyFwLYC70qeh3NZ2NYDo+PMnQD?=
 =?us-ascii?Q?ZqWzTL8S7l/q4TfuCgIUBOfepS2dLE372COo6zomJCZwt3hKAOQElWVCHfVD?=
 =?us-ascii?Q?ep6ywTYH0zzeuR5RjRLR17wLni6iw+7eY/qN7e7fKmBCZ2NGH7LlLGL1sPiq?=
 =?us-ascii?Q?jYYljiEx05CQu/779uEnuz78Ss5G0hGCrwwfDWeHF3J8lyqJtSejkFXMgoxB?=
 =?us-ascii?Q?3mweod219HhtwlRqJZvRULRdpf+9kxuEPLZca3sp5uati6DS9pv4WZURVZrG?=
 =?us-ascii?Q?q9XhJabVXBCSBJFZ+aXBRIJrC5ii6M4Cl8WsZao4lLYqOsLqq8610ADeoJyJ?=
 =?us-ascii?Q?u/5l/P+IZ+qQu1iQKggHG5+meJ5cRn6MLW/WW4OVcu9w4CpxuReUSCnTU/JF?=
 =?us-ascii?Q?dKqXGWtrbPkUE1zQe2reQpZAw2vxzAAGrEPDG5H8cx2JAo0Rm5HAvy+st762?=
 =?us-ascii?Q?+SM60OomXLD6c590sjRAQVOrwvo+mFklhsp3kiw5yKkWbW5L/udVBthn4x6t?=
 =?us-ascii?Q?il2Ia6tFwH50XL8Ppw4Q4m4Md208J6L2uGivLYF1XcLoOB3M/2ca1eJ8CVj7?=
 =?us-ascii?Q?XA5clmm8j/SdJUG0+dhH86PTsOf9gQLLFpKFXVZ5fJD4/xv21gv9VHzhE2ZM?=
 =?us-ascii?Q?tSHSbwukkyZqH9z3WhP5PTeOfdG3e2ZekL3AC7bEwPBhMcxYa2X2990nCmDZ?=
 =?us-ascii?Q?jO8zzbLJoOzU9TbapgTtfoyTv0WlYBnrgQrufBTyYCdoOBvoXocu5WMjxhtg?=
 =?us-ascii?Q?SCrpb/5wbh92XjfnRnjNn3snYknPkQtDpDvY40iq0Ji+Y1TqxPq89DXcRog+?=
 =?us-ascii?Q?oZSkJXKzhnFJu7Z9OB2oxNJZqY92S1Y3THeMp1se?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef48947-9224-410a-4154-08dbb3b96a0b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 17:55:13.3756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQBtU+qZ+h7+aVdQIV2c1yO1iznK8sBAb4AYoG8t/fT9tSZXrl9OuIG+7iED4h7qymOwsS05bNaBkflctVfJlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7564
X-OriginatorOrg: intel.com

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   4e36f69879c101236bfb136deb83de210cf43046
commit: 888bec9a94511b113c044468ba95d33eb980daed [9/27] media: i2c: cat24c208: driver for the cat24c208 EDID EEPROM
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202309110546.f8QdSkwB-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/i2c/cat24c208.c: linux/of.h is included more than once.

vim +15 drivers/media/i2c/cat24c208.c

  > 15	#include "linux/of.h"
    16	#include <linux/delay.h>
    17	#include <linux/i2c.h>
    18	#include <linux/kernel.h>
    19	#include <linux/module.h>
    20	#include <linux/mutex.h>
    21	#include <linux/mod_devicetable.h>
    22	#include <linux/gpio/consumer.h>
    23	#include <linux/slab.h>
    24	#include <linux/videodev2.h>
    25	#include <linux/workqueue.h>
  > 26	#include <linux/of.h>
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

