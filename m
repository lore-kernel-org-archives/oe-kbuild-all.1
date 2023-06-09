Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6920EA9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jun 2023 01:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686274175; x=1717810175;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cJbiQr02abrkbVoMOhM0nM58efq7GumR83VlxH+z8jA=;
  b=h2EIwW6CjMeToU79Z2nlRYN917wJNGiGZG/bmfuWWP102wFcYwiKuAGz
   OfhdH8AehSdGKuG0jxMuQbd7/QhMUrRzPO5OltSlEmTay7hIOdaBM0NxP
   GACqDYQvjwgwdbrOO/4Z0f5dkY3TjYzXz9sw1213e/u8HgCM78E6PuBMJ
   eNvtvh0PkQj7bVSjED2ErNE/QAdtxuK1S1lGuFRJDqOwxEwHNGYqIskxk
   yvCUpf4V+nCdJzMuY3Y0z+FRREFXr82j6ibUaAYHagvgpnwYEtNEIL+Xw
   5dYtuXTo7KtczODL3rdfY5AqA0eDlDxQfNFknLKCHnZc5P0HEv+ELr7mx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="385835121"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="385835121"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 18:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="710179901"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="710179901"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga002.jf.intel.com with ESMTP; 08 Jun 2023 18:29:35 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 18:29:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 18:29:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 8 Jun 2023 18:29:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Coiqiez7Y7ZseBZCl6FxZoG7/NyhPxuXCCviOZl67TcSb6VkzVJR5TFPvmnoHHsWDiwvTEcN3Ssk3Sau+ZG1zhG0W+pk6cq4szO+z+kyA341xtz5xTv7bPIqZUyeVGIZ4SSJQsQBchxTcIuBJUKkv7kjQ44k6SE4x52MsRpxmV3qaYp5HHlnxCbbZmY/uIW4akFJvqN6ofWuMQvKyO2mgvHX3t59h8boF2RSMrSzZBRkOG2Ozi3BN+pFQYJxIwSLItcNhGtCRy65/7oRovgC1tJZTg3/CuPpkKr7xRaP8be5R56pib9BFZFT4GTdBWeJrbs6EdgUBE89DZfOc4HYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRafOerDKjEVImaveorkyXcjh801EqC7DiOzg+4SAYg=;
 b=Dq/fMr3jH4rK7vVmZ7qyFL0skmD+iyn95+OquVP8k94FkZcVQKzkuUkoFO3dySkwZqLSguD7YSGCfg1jPOBHLRi6fbuvQsoNklxxrEN7jdFt+T0D9vTJ5bCXyxMMs5Rs/mY9Nhpx2qoMNuq27957FIdE1OnIgK+gjOXRQi9gakD3FqVkkZFWp5BEpKTfs9MTmXkZz/8NjmmPdd0MlKnDTItf1tdKk6so/nVz8f798AqkQmEpT/zcGGr+589i35hWcUzgLrL4hzISz+LRM6QpF1TxYjzpBUtO+xXtkPyYe7SrhuQPB2rrhwKVfLcdT5Wy4vuQOFB2IwRlqojEKpIbdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH3PR11MB8467.namprd11.prod.outlook.com (2603:10b6:610:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Fri, 9 Jun
 2023 01:29:34 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 01:29:34 +0000
Date: Fri, 9 Jun 2023 09:26:22 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Richard Weinberger <richard@nod.at>
CC: kernel test robot <lkp@intel.com>, Johannes Berg
	<johannes.berg@intel.com>, <oe-kbuild-all@lists.linux.dev>, linux-mm
	<linux-mm@kvack.org>
Subject: Re: [linux-next:master 12780/13853]
 arch/um/drivers/harddog_user.c:6:10: fatal error: stdio.h: No such file or
 directory
Message-ID: <ZIJ/vvquEQXN8NBf@yujie-X299>
References: <202304250419.YtCLtUhG-lkp@intel.com>
 <280967570.292780.1682370047405.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <280967570.292780.1682370047405.JavaMail.zimbra@nod.at>
X-ClientProxiedBy: SG2P153CA0028.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::15)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|CH3PR11MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: c19405fe-076e-4879-914f-08db6888fadb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HJwZUeMZ7d/vR6QPWgJSOR+mWg62N//jKSfE6BowxiQrhgAUPPihk8Ls2tCnH7a+yKPrtMLdHSbeRal6vC0tk30iHTQ05ziu8DjkqGHS57XXszBHSfExvyt8blpoQcV9Y2AXFnCeTw3knr78Tqp2RINXgpk0yxxXDbKT+9K2Jo4T5MjZay0l8Klg7RB7MrC/2opKbypAD08xsoLHxRdmgveX724Pow6DufhPV/g1vujWh/VBRt2e/J002/qbza+p8AqV9wrteaVuOv0k7fjmpDAns6NJg+CHz3DHhayVk/TfDRGBAC5Sep+fmOTVFVBG8YYt5hw0FgJrAC25BFw7h4tNCdOtO2QDUGLEk07UCXqBTHdZXjExrw4UEYFiu3by5Ous5qo6gjvRJsegvSfCwtvqggYmXpjPiKFX5Jmh2CcXYoECdfmFFcCI0GA/5URzEPp7B2hpMm8lc1o6dMutGUUE9WZzNwRwYtYBHv4nT4USxTvKAFDOT6Q2szf1Xh5Xg2dddsCYUBC1WZDgpvjLADNh2/IVYGOB9zjPCEPqnD0GffvJZZ/Wrc8ZNUooc4jDDavRLza99mvRw0tot5aQTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199021)(86362001)(2906002)(83380400001)(26005)(6506007)(186003)(6512007)(478600001)(9686003)(66574015)(82960400001)(33716001)(38100700002)(6486002)(966005)(6666004)(5660300002)(8936002)(8676002)(41300700001)(66476007)(4326008)(6916009)(66556008)(66946007)(316002)(54906003)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?drHQPBhIjC/7Bl2f1Ypa3NGUMW9Ip9AynCrmxV4yAYuXk196bQN355duD4?=
 =?iso-8859-1?Q?Kh41aCYlj9+ygdCYI7GBZDOD9kpdXLcM6KpEq/5Km2lhBF8p9owmms1fpw?=
 =?iso-8859-1?Q?YUYA+BD1fBGMxN/O7Twxmi/2YPhgDx0+5kwS9GaMgPOGi2uaB8uwI9+Nx1?=
 =?iso-8859-1?Q?gIGRAozvgkyOFbMIFGknxBT5TdQ0Qfv3JMNUa1GV3APvhYPric9vVgfJbT?=
 =?iso-8859-1?Q?fKvzbZUp8cboDl2ltsDtNXWuQFEORkAZNaDd0LwEpqsqGfwqCG/xJKB36B?=
 =?iso-8859-1?Q?gWdpUKxSnZMsTwm+serAi+IpGYBXQ6wd1DySvbZy80GcWJbDWhthBIUBJH?=
 =?iso-8859-1?Q?798de80Lo7f7xpowidi8VFG03tmdCyKLp8PXCsPD0XHTAhjKgi64MNGyfj?=
 =?iso-8859-1?Q?VavvdVFRhBNTPKbjWAIA/CUn/Wd5HkcRgk5PCvaquaY9Wm7PkiLnW53RRC?=
 =?iso-8859-1?Q?M0yTKdsf8ffg2o8nMfDrVrAXdg5e6BQlx4J4Ii2KV4mcoxdAH3NZkB1Ys4?=
 =?iso-8859-1?Q?neSFe2RWkscgQJNiOnzQeI+w0QYXQwqmxF17iRWkMYTMpRyUhMkTzM1CpU?=
 =?iso-8859-1?Q?hqcjn68UZ0Th8Ab3sYTLHnMC/gSr+Rde1fbxdhy2m8nZGsb5ZW5iaGw7MS?=
 =?iso-8859-1?Q?0hQ0MJRglzri/X4cf1QWn/5Z24foaJioP6AT6+/oD9IiNzGYUPB5nxbROi?=
 =?iso-8859-1?Q?2qGpOOMXssLJRwWWvbRY75DzLLasvY/aQ6jQZJMhah+PSpIaz/muX8cgZQ?=
 =?iso-8859-1?Q?IdiQuZzkNOxQxSwAFxsK9FwbZ1QRQeLpz+jopOGBMtmh1iA/WTAMZ644Ln?=
 =?iso-8859-1?Q?Oq7f9AM4Z+h20Y4RMYcqCfZLyng4FjONMEuLd3TnvD0qLYzU3nqOvAp7qi?=
 =?iso-8859-1?Q?ZLzt2HvPY4VPRbuzna6epo+2InuWynIvJZ5eH1Z/2ccIisAZRFZ259W1YT?=
 =?iso-8859-1?Q?HuG7qI9DjrjCGnaJcAXsZJmXAD0Zq6NWeuLjYhymP4QdUmOhYaBfsxoC2Z?=
 =?iso-8859-1?Q?zquL4hio9HiHcjlxextEHjSNaBBUrd9XYs4t0QTFvJw/Hk9Xere4oqGTCM?=
 =?iso-8859-1?Q?V++r3sWrkHF1xQ+K0OY5M1b6nm1ih+tNGej3s4tD7rtVwcxx7xQwsDaHRc?=
 =?iso-8859-1?Q?0rhv/tbUb6OnD7FbWodVxf68Fr9T6TutL3UVyfiek2orh7aVw80T4m8ceG?=
 =?iso-8859-1?Q?uIjpu/kbQ0+MLTIlHqiKzbr3PYCRUh0JB5c/uJ6e9XS5dg+5U173g45nH+?=
 =?iso-8859-1?Q?abRlESOnFT2DgIC7qJ4f0DZPCDL8U8Jd2X5hLk6fZI4nOFFltuF3evaXiV?=
 =?iso-8859-1?Q?Mjh0axgfbZ1yVUJno2//71QfhMRBM3Lh9jt7BDBeIqffPHV7eq7Dy+9oL7?=
 =?iso-8859-1?Q?IqHJcLKmPTLrsLaxJoO5rUL6ILDqLCgkQ5AsG7VzLH1RAtBX6ygUXNIPXf?=
 =?iso-8859-1?Q?DkNPL9A0f4hf3JcbwpLA7vD04hDfHfrD029jGP0S8T0gpUEmCjc6fEjI1m?=
 =?iso-8859-1?Q?wFqtwR/Rj1IJV3tRh2fHBezvTqyl1dqU9jA9d1ixhO0SwLXumKcLK9Vy+k?=
 =?iso-8859-1?Q?Ke9MzNdyBEP5c/VYm6nKhxDD68cIchqT6xiSKeQQvgmTJSKvH1B+FvniAj?=
 =?iso-8859-1?Q?QYBCBwGV4UgivOWCRN8qdNtCH85BHETSzm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c19405fe-076e-4879-914f-08db6888fadb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 01:29:34.1004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PKzVwxYCvMdzMHdYD7rD6PdPkdEBK4zAT37CLlqc0plTot9OCNL5qmYE0gcc3Ju2adG2mNAkYMd5Br2+LwcWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8467
X-OriginatorOrg: intel.com

Hi Richard,

On Mon, Apr 24, 2023 at 11:00:47PM +0200, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
> > Von: "kernel test robot" <lkp@intel.com>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > master
> > head:   3b85b9b39960c08f29fa91b8d984d055dde6017e
> > commit: fc54a4f15988e228cf88f888483e985c5f35031e [12780/13853] um: prevent user
> > code in modules
> > config: um-allmodconfig
> > (https://download.01.org/0day-ci/archive/20230425/202304250419.YtCLtUhG-lkp@intel.com/config)
> > compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> > reproduce (this is a W=1 build):
> >        #
> >        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=fc54a4f15988e228cf88f888483e985c5f35031e
> >        git remote add linux-next
> >        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >        git fetch --no-tags linux-next master
> >        git checkout fc54a4f15988e228cf88f888483e985c5f35031e
> >        # save the config file
> >        mkdir build_dir && cp config build_dir/.config
> >        make W=1 O=build_dir ARCH=um olddefconfig
> >        make W=1 O=build_dir ARCH=um SHELL=/bin/bash
> > 
> > If you fix the issue, kindly add following tag where applicable
> >| Reported-by: kernel test robot <lkp@intel.com>
> >| Link: https://lore.kernel.org/oe-kbuild-all/202304250419.YtCLtUhG-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >>> arch/um/drivers/harddog_user.c:6:10: fatal error: stdio.h: No such file or
> >>> directory
> >       6 | #include <stdio.h>
> >         |          ^~~~~~~~~
> >   compilation terminated.
> 
> Wild guess, is this a nolibc toolchain?

The bot is using the gcc-11 provided by debian distribution, so we think
it is not a "nolibc toolchain".

    compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

We can reproduce it on commit fc54a4f15988, and its parent commit is
clean. Please help give some guidance if anything wrong in our test
flow. Thanks.

$ git checkout fc54a4f15988e228cf88f888483e985c5f35031e
HEAD is now at fc54a4f15988 um: prevent user code in modules
$ make ARCH=um allmodconfig
$ make ARCH=um arch/um/drivers/
...
  CC [M]  arch/um/drivers/harddog_user.o
arch/um/drivers/harddog_user.c:6:10: fatal error: stdio.h: No such file or directory
    6 | #include <stdio.h>
      |          ^~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.build:252: arch/um/drivers/harddog_user.o] Error 1
make[1]: *** [scripts/Makefile.build:494: arch/um/drivers] Error 2
make: *** [Makefile:2025: .] Error 2

$ git checkout 5d90cf6dcc6a4cb85a51ffe007a8e34375799164
HEAD is now at 5d90cf6dcc6a um: further clean up user_syms
$ make ARCH=um allmodconfig
$ make ARCH=um arch/um/drivers/
...
  CC [M]  arch/um/drivers/harddog_kern.o
  CC [M]  arch/um/drivers/harddog_user.o  <--
  LD [M]  arch/um/drivers/harddog.o
  CC [M]  arch/um/drivers/random.o
$ echo $?
0


Best Regards,
Yujie
