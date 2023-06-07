Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9248A6AB9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jun 2023 08:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686127446; x=1717663446;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UN7vhSF04JEmYffqvipGXyaX1F7LoQixENGW5z8fUMM=;
  b=D0Jw0GFv1poD1F6zo9YTk2XBrmRZ3Y79TfZD6yRqKnicWENx3kEfCVij
   a1XyBjBbW4COL18/cQDtBd/MQ8fZhiQIfvTeYAfLO1mp4rAJOMk7dbSjj
   nPyNqnUceR5eGo+bHevzUaQVmDCOo2qG8C8TzeIt4Cu8IFh9cWzKwwwgN
   Y3+LgFeMfqQp+FXuBMOaJUoUGZAaXa/vptexAVxJKIO0rtxbECdb7l9Jt
   kttPlrS54Frgo8IxJXs4fUPCAL/5qDbSNxY8A91PgBaWLporil8eh2Xyg
   SAUWqoSXs3tPjsxZzLPyD2rQoUCy+vDHRd8FCzCUFlsTy83dupsO2xIAE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="422769825"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="422769825"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 01:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="712515530"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="712515530"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jun 2023 01:44:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 01:44:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 01:44:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 01:44:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 01:44:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvAaHWCi116/EUzyjSCbM7Cy1iYLVv9Dg4GBmoWUtq4ZRjigiRL2ubkjBqim2s+2+5EVAW+bCrQJZyddcRxF3dPxkIQ1+J0GzedJEvd0pVpJBLeukaOmqDF6KYhIsgyXgcdPeSnLxA2VCf5RXicb1txRcaF/yL/nOEnfQaY/YUR0olJLzSqeAAYmYUwRbv3/TM22rlMnj25icE8aiuADoyUN4f/I5EWyxzDtnMIyYGOqecX6fBUEBFtd3BtAU12/Yd4+xvKR3xVl83NMaya4mRcdSB5JXQ5ThvEBWYX/hZGeQZmYaaXxNvyMXEP9gU43aQYjo6tn5tniTckhsmYTrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1p7OHlTIztycA5ZAYJLD9t29HHXzuB8i7BZBrRXKPo=;
 b=DO8ceH5HLvMgCuaRo1er9AY6YY10wrJyxSS19vhlHjcoLYPDjy53eBsCwv75w9+JWrSkkuWZRF2iMHPqe/6SgwgiYE2AC1nCfc+sccsukBzwV04M2hNDHUz+mRUezs4AX166DkQFmXR/NGVGlrLZrxsN0ZF+3Ca9mFBAYpnB8Dk51dH/p6oQvZ4tAGtcYygjKYBO+noZj7XwIKV51aFG44ghSV4F+A4cmhVnFEhTbvVk034sDB8meYtc2pkYNM2MIjTPJYeWsBfiBRJHGs1Qb8Qyf8a8Rdk8wMP3NC0Fh9AQH9shXbsSKhE9lfTMISYdDvcvHaDfrLrqiKxuyDJcFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM4PR11MB5454.namprd11.prod.outlook.com (2603:10b6:5:399::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 08:44:02 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 08:44:02 +0000
Date: Wed, 7 Jun 2023 16:40:52 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: kernel test robot <lkp@intel.com>, Philipp Hortmann
	<philipp.g.hortmann@gmail.com>, <oe-kbuild-all@lists.linux.dev>, Sasha Levin
	<sashal@kernel.org>
Subject: Re: [stable:linux-rolling-stable 1764/2160]
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c:28:33: error: 'rtl819xp_ops'
 defined but not used
Message-ID: <ZIBClJHqrXM97n2j@yujie-X299>
References: <202306071504.3W3mGNNn-lkp@intel.com>
 <2023060706-companion-sublevel-2e18@gregkh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2023060706-companion-sublevel-2e18@gregkh>
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DM4PR11MB5454:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c8b1ebf-d8f1-450e-2075-08db67335845
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8UYdIMnuSA/6uDoORlpjwHzUW8qzDTnI8DFJHz4u69XkTEeqp1U7kS03VW1D61gGYYnaOKlgEVLvEH7ajrG8nl6wKbFK0uZIKIlijJxCZNY26qhfESk1Yjfr/C1lDUSAKRaKNYNJI47pxohlLEGDGuTcpmVtJb55hNBhGH2qRvkacGNc699oKw6k5ioqdbV6lsJc0k9K2k4i8QbFcbNbGtfCqvNDII58oZWja2U2l8rqynVZkfaxqyFrsVzaa8sCqBW0T6EvIorUETuTnYSoKP5bk3arK2QQ4Dr4hx3QfG7xs03Q+rqmD743rd6E6D/w5Vc/Or1GT+GKmB1ppdqr34DSeT9OQnXqGxw9TSjrIQ2slk+bphIwZEyQvIJjTBjKrua89IY1vjmr3DHrSuSuQdfyD+x4vQ2qESO+jQMQQj6dVotzHFpuT0An5Cs4xZjO8dq/ulBEcZNSLiNpuPimGt19pUUxlTofGtgh8WMQ9VzqvFVDq2yp0TULY7XSBhOqhLk9P8fOls+vQRwyQzVNk4yJ/T+aCdpPkDFQNRoL77U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(376002)(39860400002)(346002)(366004)(396003)(136003)(451199021)(9686003)(6512007)(26005)(6506007)(966005)(186003)(33716001)(6666004)(6486002)(4744005)(82960400001)(66556008)(66476007)(2906002)(66946007)(38100700002)(44832011)(8936002)(8676002)(5660300002)(54906003)(478600001)(86362001)(41300700001)(316002)(4326008)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LQfRwFwa6gmewjG/fCVQST1sAOOubXv12XrKMtfGU+TUCxskoRvDrkb7uvWF?=
 =?us-ascii?Q?DhOh84Bhfwg0RPClldsts2KrJ47NeZL3QNoWv/1tlyzVZw/HZZsFD5tM+25k?=
 =?us-ascii?Q?hrvXw7zEMGIGxTwXOUNwHMZLUezSxYBCcyoPpUnpoloiu6qDwE1SgOc7uhQp?=
 =?us-ascii?Q?cxXOmGf50x+/BQ365ssbmLg2faeMSMX4XH+BGAJ1QImPIP9hT0BJ5rKwgAn0?=
 =?us-ascii?Q?a6HSt9F8OV5V45Oyy/BnNBqn0lXlRENBM4mXlgla8OfkYOQ6UxH+nfsrb5Ls?=
 =?us-ascii?Q?+ZluNKhv319ndpehZEk+UYUS1ddeZasC3uWhn/hT1Xw2Q50X35f8U+ELmO1h?=
 =?us-ascii?Q?6aPxQwXuJftcy0ZvYpQDSFFxgo2i3fHdvUGn7BGcBu0rs4XhopNULVaxyH0N?=
 =?us-ascii?Q?mWUsbv4FRFFVWBkoSj+kGkGEIxi+O6azAZL2nVLpfpzjJZJPuljzSB4P4SPm?=
 =?us-ascii?Q?ArYyw+Y9TtImnt2TyArAmL2gBZEinRdVCu1lh8jBLRWKDJFQDx33XFujApFI?=
 =?us-ascii?Q?nVF5RXN6RrRTF1qGhHhD6gYFIMVUraPxOyABGh5Fv68zmDClfy/jY9ZNiisZ?=
 =?us-ascii?Q?KcZWbaF0VRiGzKdaX2onSgXGE+e8STXAPx8kdjG4AS6BcJGifTBxAmof5CgT?=
 =?us-ascii?Q?Dglc//YGcdUwh3O0XSjmfewJbKxqOb9VWYqmqist+Q6zhkscN4AbxNc8pMf9?=
 =?us-ascii?Q?UNKAzHJwNL2pUeCNJaapEyZHr7UMAek+gKLCjfA2StkqZZaI2NRNB9IZoZUs?=
 =?us-ascii?Q?EDfCpiWj6L2xDR/1C/QP0kuT5b3YNb45rqFEjobij9ZMxtRYSHec3deLwJKY?=
 =?us-ascii?Q?dNmrgweuw54iz0UQR5yeV9CdpMoU5/oQjAO/5H2RrE4iDdyKejkgCT4ebCI6?=
 =?us-ascii?Q?rxRrVLBj2khXPYWU5cgRTbuzofyo8eCjdj6BSyzVgo6amqvtNGkXNAeqbhqN?=
 =?us-ascii?Q?JVY70UJdjsDeq0QmXgaeSm4e6XeIsyjlr8aRf34DcsoqLViVNK0S8YvRTlwt?=
 =?us-ascii?Q?ZmC81iIjupxzgNhmW62LsWWT4oRx3dfImgyWLKEl+IMGJfEqWWi3FLVy+gi7?=
 =?us-ascii?Q?9kf+VPvsFrcWJ0r6dUSLU4toffediSQ/PP6hNAbsx/VKzbP97mSuWeWcrO0J?=
 =?us-ascii?Q?dGhtj9ZQoIwBU3LcfAUklHk2FJfB4TZH5FNgoRO8ht5Z8so6InrBC7sHdbRB?=
 =?us-ascii?Q?QKsBp3tLa01vAw1eCPmSDChpdo7+FKhP5dH5BIGJ41w23D5loVFM4UV39Pja?=
 =?us-ascii?Q?qooMFYb/Il0J5TvnzLD96IHKt4aD6Hj5b4cDrygETXMGB/1ZkyuK9dWnWqxB?=
 =?us-ascii?Q?qQWSZkziVFnOSfPMUZWUNt70UzXcKLlTwewbIZRzK1W5NA9uEreROqdsEES7?=
 =?us-ascii?Q?o76amIUh0bWz/dSbEYWkUWXyEG7cAjBowR4CqScTMnxXBPQww7zGOFrGcaHS?=
 =?us-ascii?Q?/vp3OJTH5l4dLZt/Mn6BGhfxK8lo7mqVsDrHBJJu46jXQunrUb6JgV+dqCRO?=
 =?us-ascii?Q?uIZErY4o8Cg+A3dnk7MJCVjdNjS2nBEukeVNdYsmIIVMv1YWBINsP7LEq93Q?=
 =?us-ascii?Q?R/VfuFGQH8X8l5o3S8ktFWZTcSu5hogih6ICN27a?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8b1ebf-d8f1-450e-2075-08db67335845
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 08:44:02.6586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TD6vMOjGF59+oYhBAyuQuFPsUfCKEsXWicbfVR0XJPTD/PdZmXdlQdN74NUmxlU65iamJoAuie5zV7OffT9yag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5454
X-OriginatorOrg: intel.com

Hi Greg,

On Wed, Jun 07, 2023 at 10:13:12AM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jun 07, 2023 at 03:48:26PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-rolling-stable
> 
> kernel-test-robot maintainers, there is no need to test this branch, as
> it just tracks the other stable branches.  So anything you run here,
> will also "show up" in the other branch as well.
> 
> Same for the linux-rolling-lts branch, please don't test it, it will
> just waste your resources.

Thanks for this information. We've configured the bot to skip
linux-rolling-stable and linux-rolling-lts branch.

--
Best Regards,
Yujie
