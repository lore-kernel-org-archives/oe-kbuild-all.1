Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8B510E9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 01:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692669322; x=1724205322;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=dchHuT7pcYe7SnhPdI1vX3Bo5ZvuMCl2TAZsaJkQ2eg=;
  b=Z5S7S8pDdaPpUV3GiIUdzLVD+GsEXMGbeVuQnK4/Ywn6YveO4ey+vL4i
   d9WvIIItx47xzPZuGW27/gnMQs5PnJh8pauwTUUgqNKGHcVjKF1S7JazY
   mRMyBMZFkKz4imOQJC53RsOypyNG+gMPddRAjM5BYg69usBA1XfVi/W5g
   zQCYDloP20kbPgVmFNlgfoMOnAzmClZ6B+4NLMfOaDbQuvSNOa0ghkHx+
   7Xj2snYLOn5JVAOGGi9vUrED5+j59HpuPqWN5OQOdIm77gekdlL/TA5AR
   7A55J7PHU7l8xNsMOL4fD3JyXZQdZeu/0qfiRX/Cq89qK0zM3L22jLYAl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="371178701"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="371178701"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 18:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="685870571"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="685870571"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP; 21 Aug 2023 18:55:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 18:55:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 18:55:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 18:55:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=asMIm1XKqVexVRTkSWcKn+z/2E2f6o1cnFUGMYN5D2pQHbnOaYuHQepI7eRb3vGUMM+wPf5EaTz/DAPJt86eNVHjSn6IxvUKomKpM2WG0R6FQzF4koFXIm8rJgDeQOcPVLRAqUf4JxEP0hBcuJJBd4bNvgSmfk1sLyJltvtaoE7niqrBBPnAx3+PXHAxMCwAD2yWQ/6g9haklzBtWyGTlZlXHwa0l/PSAwfL8YUDFYeoasK091DmDAlDmdSGo+gDHpMr2EFnRwm/eajykoVIqgTqSM9sq/qqjR+n9yCp5tytWM1AjJ3SA1hW0tksh5XrUUhqjQzCwMVBlA5EMogE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mV0QKvki7lDz4aUPFQSaaLwYWeth2QGxzpmUJbQwsus=;
 b=PAiTfLhZWWwAvn6brGK3DiUEOKocK8JjzlKnkhGXWRWLlIZZrZyWvYeDFN82Af99iTx0d/SnllwKhIpytEzjiX+Vu923odBmgK08cxFBj4KMB/w9++XkMbu6TsnqTFXGG7uD5BaBo+vW5f+62V9NgBdOm72PY/AkvCE2J9eE7BCwiCiPKkkpFF3UzOXiCRMWA5SFEJEEpBCtnRxaT0FCcNsoQLPA23E8VHi5HX7wCMKpCPz/5qe7sQmFwgeNmc2/hzlBH/ZTagb0Uli7LIuwlGA2aFbMj7UBe/O7UI3PzrNr/qA/daFl7FQ+f3CHol4zMPkXDctIvy7MFjgztcKebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 01:55:18 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::589b:22b8:e509:c001]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::589b:22b8:e509:c001%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 01:55:18 +0000
Date: Tue, 22 Aug 2023 09:55:08 +0800
From: Philip Li <philip.li@intel.com>
To: Matthew Wilcox <willy@infradead.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: Re: [linux-next:master 10448/11214]
 arch/microblaze/include/asm/cacheflush.h:77:13: warning:
 'flush_dcache_folio' defined but not used
Message-ID: <ZOQVfFhvdB61CuO2@rli9-mobl>
References: <202308220106.VDWkCsdG-lkp@intel.com>
 <ZOOqPZNvScEc+3aK@casper.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZOOqPZNvScEc+3aK@casper.infradead.org>
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|IA0PR11MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 577c21ea-29e1-42fa-fc0c-08dba2b2d611
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M9Ynde4g9HfYFADN/NZXyveEZVKEZQU/DxYPJ5m2OXXwiVBZZIRRKD8pCOg/oCX1GBNc1w4UfcW2Bk9z0e3B7GRLtKvxpsfh9twgdR2sYHdBmzWOyK3uaahqJouspmRWwS31mIGcgURbpXEqCN5xtx5Li+G2i/xiDh+ZWB20MlE9TVQV1NwUXTlRl5x0cZ+UFiQW6rjjo/fIICHBfrNOBJtVkovJaX6NT0mzE+dzYp2spMQNVPqLhPCdRMuIMfKrQDeUF9iFshniGqqCalCXDK0KKZ3rKLqIP8m2Y2Db8SwjqBdftkmvKvf/9YY2ssYO05ViJsbFAsEbTkQ9BGepo5v+Fj9Fn5RivK8/gja9FlJaRL96UMQGsSLadoBnSfkeUlJWL3uF14iaApLmDEiMw1xIdst6Q0NjhUKl0M2XPHmGVTrG40RSWJQfnZqGrphgzVxALsjNfKFpMI6RCOJEoT9iSSyXCKrCgl8WD5ymeqv/1CrTUyrCqyx3D6jZA9KvQTm/+jk9gX5yY8yb85+ZcalXNlAJYLtCiPsbf1YgeFnULsIJMH+n159ARnft3ly2wzlej/Fk8Y0glB/d2HN67Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(136003)(39860400002)(376002)(346002)(366004)(1800799009)(186009)(451199024)(54906003)(6916009)(66476007)(66556008)(316002)(66946007)(6512007)(9686003)(82960400001)(8676002)(8936002)(4326008)(33716001)(41300700001)(966005)(478600001)(6666004)(38100700002)(6506007)(6486002)(83380400001)(2906002)(86362001)(44832011)(5660300002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AgdXUB8S3PE3V7R8d9adSQ4w5ksUIqWhiu/76zR0ylthstsmyO7ttF0UwNCE?=
 =?us-ascii?Q?80jD9zcrfh9J8n3wYlzwDZSPd0IMLWjEWSIyVWAS+64tklUpSwtWzoqY0g1n?=
 =?us-ascii?Q?U8BabLtJkFxR2SHRNx7kom3OWWavhOhPReF+wd8NPcP7ge2t7CPpjg0niexP?=
 =?us-ascii?Q?mFG5ze2lmteuriKV1GYbHBr9MVJRfITcmsNnKdr0sIDzgthZ0OMFaG86ArzB?=
 =?us-ascii?Q?dgqy+UhYi603UXjl9UgvjDvOrOC5I6gca073jIm+3wblz7dS+APPaYCA0gMt?=
 =?us-ascii?Q?eY4bWukKoW5trkYPf9vICBTn0Duj9IK2/DKfDr8xGUEmZgjy+9R5PFM8vdSa?=
 =?us-ascii?Q?w7YLEKLVWhucSZJvzfmPM1FrO7cOAhMZ+gJI8Adj84bnh5lq8wa15asVagPt?=
 =?us-ascii?Q?bHBIg9WnG7HCGbzW+xRtm4lK54oPuNxS6ZMAVBFl7pZeHDKkrBKN+LN4Czi/?=
 =?us-ascii?Q?CYR1FK1LeOK+354N3OhCs+r7SW/2g08LpQzPNVRAkMmcGU3dN+LfNavnEo+T?=
 =?us-ascii?Q?Br+jActqnHDGQN46UIgq4C6QqeQVaF3gMdVeZ8guyYldjERWKqfiPzt9IQ5O?=
 =?us-ascii?Q?cLtpfwEEExUgzeHyLUoHeZ4qCkQHvOyCBGM5ht8e/KR8ZWMvJ2H2Oo93PF/W?=
 =?us-ascii?Q?f6aLIdIDv4T86a496SRct2xTS3OlqeyrAnyrMP4dbl6EfYPkUzvzVzpKSt66?=
 =?us-ascii?Q?sBPXZiWOVKx7oI0EMtIZ+V617BBIqm5VQ0ll4WG1Qe2NHMl2GN2c678dzVR2?=
 =?us-ascii?Q?J+/93NTm1cFlBEq0adO45qrmIMJjaiFy6Yu6qIyM+RURhPYYYjdHnTNPUdjb?=
 =?us-ascii?Q?Z5R/adACB7L6u70yshxKocDvsbL2U5MTeAY+O0YW+r2JP5as5rjMUv30kAwu?=
 =?us-ascii?Q?I1fnnod8Xv/35q3RvJvCiSZ+Y4iXhc12OKlAZYCdhfYruB13qim68OiAKhkd?=
 =?us-ascii?Q?Ta/2ACB6g3SWqIa1Cptdv3hqy4StqYd5ijimNSSe5fAx5GW7bfLraMAY9ayV?=
 =?us-ascii?Q?fhTxTb1IlZmF4i1a36w9TPhe0HQbcLxkiXlitNnms2LQ4nlwSrWg1rbaYQQf?=
 =?us-ascii?Q?+VbK1n1lU70o4NUt9jLRVVmuBv1odsveuJune09mEXWtFaJxRhXd16CL8YfE?=
 =?us-ascii?Q?GrVBxY+Ul/EMjhdggspcUoafy4Jf5YqErf/O7zVxV4d0lN0X5NswPketOlWE?=
 =?us-ascii?Q?aOO8e/c2jAKbT6IRrvfIZTrXgAwq+I0UkGtSE1210D34BR/oj+wqJQs/WPrp?=
 =?us-ascii?Q?j9LP7plsyOInzTgSzM11Uzavx8rVWOkFR/m8JWMCCjYIhQT0hsLKpge7mRAP?=
 =?us-ascii?Q?loiivE3Ke7xYD2r9/9g3QOcnnsadMPfBS5+n2z/lr7DxTdl9MIZy/MVloWWj?=
 =?us-ascii?Q?EhxNtT9ipKkc+XGH+xf74PbKPy9M8I8/d2lbyH83QLpI7bOOB9N7GJ2SqXp5?=
 =?us-ascii?Q?hLGKsa2wTD7/4KB4JVwEl1L9NauUXzNo1WGYFtKhpmq6CHGhdBMMkz1bIRI1?=
 =?us-ascii?Q?Jj6ynngPPh1WvYgR+Jc9pin3wEGl/qrAJm1RRuKMSoFcplnIG4q9apUECfJy?=
 =?us-ascii?Q?RSUxZd8ooVBNkktFLfVUIAvriLj+0MM9mmbS2qq4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 577c21ea-29e1-42fa-fc0c-08dba2b2d611
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 01:55:18.6459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dscJiHrVbtjoMKs1OlC08TnLyK171fTMGd0e48cJak55+zImvJ7GoCqnTJbI11NsHDff1+8A2OhTKlSwUxkJiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7378
X-OriginatorOrg: intel.com

On Mon, Aug 21, 2023 at 07:17:33PM +0100, Matthew Wilcox wrote:
> On Tue, Aug 22, 2023 at 01:21:43AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
> > commit: 2fcc20defd8a07415f6b346d941c22c50bbdada5 [10448/11214] microblaze: implement the new page table range API
> > config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20230822/202308220106.VDWkCsdG-lkp@intel.com/config)
> > compiler: microblaze-linux-gcc (GCC) 12.3.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220106.VDWkCsdG-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308220106.VDWkCsdG-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from kernel/signal.c:57:
> > >> arch/microblaze/include/asm/cacheflush.h:77:13: warning: 'flush_dcache_folio' defined but not used [-Wunused-function]
> >       77 | static void flush_dcache_folio(struct folio *folio)
> 
> The bug is real, but I'm a little concerned that I got an email from
> the testbot a few weeks ago suggesting:
> 
> microblaze           randconfig-r002-20230731   gcc
> microblaze           randconfig-r011-20230731   gcc
> microblaze           randconfig-r014-20230731   gcc
> 
> all passed.  Perhaps you could do allnoconfig testing more frequently?
> Those tests should be quick to run since they are allnoconfig ...

Got it, we will better balance the test resources to build test the
basic configs like allnoconfig in early time, and to include the results
in build summary mail.

Sorry for the "false safe" summary report for this commit.

> 
