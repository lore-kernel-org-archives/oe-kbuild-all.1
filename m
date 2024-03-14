Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34174D9F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710407767; cv=fail; b=nuAWoPl191rFd/O8MCwK3ZVv43jhjm55GtVnTrkoPJxt73jeCzgHMZnEoU6RhINQRQr2pqFdcZ0LNtR/9O321H8twGEQAG+z4x6U4ZQ+ya+EsjYpHpaiPmrR/faP0CPottPjo6nz41h14JjkXegij48GroVPC8UpJkDtjy3LGh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710407767; c=relaxed/simple;
	bh=UODvJ9LLAJ5o5C4zEBYP6htmTP8RfQQwC7Xj9B+CjZ0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=II1Y/IxnU0hqckpUWVuNbY9odEE0wuICDbtzBzv3DLRH38FeOqCWLk2aR7Y9LhQqwctw0HtU42TdqsTFkBGk1YGWGtPpYFel1jM1Gh1KgFC/YuDcYSzVwYko3Qvc9GNX89nocZnK4dLOf8a+bX5NBhikBRNBprphrJNepAhlIpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAfCFC4z; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAfCFC4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710407765; x=1741943765;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UODvJ9LLAJ5o5C4zEBYP6htmTP8RfQQwC7Xj9B+CjZ0=;
  b=nAfCFC4zVWqrephtqFxdmDSfpXt73AEY/8d1V4Rcu9pg2t9e++0JQqbQ
   8M1UQ4frLdr0KjrTUVkG/JLtt1cYq/kcWRNHvSxEzSFARohCE9tZmY0gR
   pQuuqgWTnSxI6kwNxINEVhc749cS7hZTswcEl3SgAPMzGnyeemG4Y1Hmt
   6J7EEW+sFiHuFbh/YZ1NqwL54UpK8UyGwDUrt7/OyyzlrFzIjz967SDMQ
   xE4kV+LjvNBAXgvg+pqVis+DIwN3lL+sQd7C7tfhrXmKHK5w0YaOkxtTC
   FQdYJISSeSB1k3319ir8e6LhOWTqHaWKnZtHtk9LImhUXmZOGJolbW44a
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5076332"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5076332"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 02:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="35356792"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Mar 2024 02:16:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 02:16:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 02:16:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 02:16:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKoyZhYeBdL3gSv/s5X56U4tmlZ/FfCR3BleHZMENsC5Ht8vZ09Kf7LD0IrbVA2wqbof/l+mQBoWqPUUlsemHdhu8XVLe0dl0DWosS/3lfr31E39sKBLjdXS+2c2jUg2b7qxivEZ2EI2apbasfr3PZKzoDEcCVL2Bwn/Jt4GU6otkWi3dkh7zS93IO35wH6zzwHNYFJKUax32Y/drgaLMJ24qbkESqe3JYbBNT2tA1V/h3h+gBFiVdxP+ZK+MPOuJLFed+9pAs6eHkbfHaI4knWO854gk7LYt2Ddk5FX/KAmwxxr0KP5nS+zavkY0YubGqrB7Mrb5sDQIYxCl5Ki9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uolmXIhrKmWI7n6Vq3NY3Piu6jsA8mAb8kIQtYJAvw=;
 b=M7gioj59ztSOffxyNEp9HBDTeSNDfRZKuy8rxAjCnbyAYnINONwg9yJlTiSbKlUzfCLc/stytQNlj5PuzQ6dqdpUM4AtNEdSvrlLKaUnzjROXCRe+ZwusGCQA74xCX8GhiCvEnZN7RP9qhHcxb48zCGeLo3nwwcfc8RX1a9MKgYO88qO1jhOkAbJiK6OKA9nyPqpPJ7+hu+VNIR3aDnptCI+zgQZBWrX7gIFB/KVQgXBEgCMasDdnZuVlXsOuH/eaJPhkJ7oUzTXyDdM6SAtGlSOc1CnEUyKUgFgoNJAYlniaPlUwpDcqPsrm5HQ+hhlVzuuZZh4UDJiGIsKtPAXpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ0PR11MB7703.namprd11.prod.outlook.com (2603:10b6:a03:4e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Thu, 14 Mar
 2024 09:15:59 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d%6]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 09:15:58 +0000
Date: Thu, 14 Mar 2024 17:09:12 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Peter Xu <peterx@redhat.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>, "Mike Rapoport
 (IBM)" <rppt@kernel.org>
Subject: Re: [linux-next:master 12265/12944]
 arch/arm64/include/asm/pgtable.h:904:16: error: implicit declaration of
 function 'pud_leaf'; did you mean 'pmd_leaf'?
Message-ID: <ZfK+uOh1PgeB6ij/@yujie-X299>
References: <202403101607.a42gaLOS-lkp@intel.com>
 <Ze8vFNV9YSdgC2S7@x1n>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Ze8vFNV9YSdgC2S7@x1n>
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SJ0PR11MB7703:EE_
X-MS-Office365-Filtering-Correlation-Id: d4905e83-ae53-4c8f-f4d2-08dc44075c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6HbfzOx6RsjHP1A5yLeipbS57i/r+p/AcPYPA3vmArnu264o+xKz/HBih72eINoWWaR+aDKJoCcivOFczzpICcbwGjaI7y4DVelKOqMpzWBIcB4KX5GsvXYzdoVvuVvHrZrXdDJCdMwYasaN5hKuMoQDJZFyKLeNbHFfxsLcioUn54t9hI+NhjtbMcGsHkEFCW/z8ZU6dSgiN+KKJJPOXm496JufPU+KMvfLUzLG1uiy2onjfYYKzac+4zSr9acPwBGvF9qs4HFbIYJhYbu+NBywhqt5OoGKbMOo1rpu9N/nJWzUYD1bgekcjeG+Px96x4VW21toUoGbptM+H/qgRP2D2Q+hQHVwPlAo7Wmn9rCtapbAbqJekZhBHcfj3rhB6nHgs4H9XHAfpyipTwL1JceMS5rD0KT+qWnQuvzrd5F6bBbuKxomsUjNW+igNUKidqU2Y68f6NhUTETPD4QdeAEJ+IIbi8NQWbstmm/daED60zFFYzC48ERDj0UeOYBacxtCThUP2GDBDhBZ8UTtlvgUriAghtxgridVVi4M8H82fKPZmbjiH1uESwRq/jg4Nw95PWIS3Uj2P565J3C3bLk/3EduADNV+RQKyN4JmCArE82xUovKNDYvwKpyAAPY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RO3V33dJilGL0e6d/DQjeygc/fL1vVOd9nfHF30t/TUoVPGl5Q1LQfXoKniJ?=
 =?us-ascii?Q?kUHbup/xgVFUt0zrdfXjXctOyWaAFnr7mnZrrTs2Uq80165fSV9QAKvLV5oe?=
 =?us-ascii?Q?ysntzZnTSjJwRmi73o1AlRCqNwZ0G4pEqewocwBtSaOdagHXxgqVoV2ZGrxy?=
 =?us-ascii?Q?nf1JJzZ0fmB5hxAzFRrex8U4zZlr7rVfG1bJZ0Ufa7Gj4pFldhTw0AQdtJpa?=
 =?us-ascii?Q?jbrgedfU3YMT9nTY4IURdRLtEDLiBU1WFctAsmTuHeBaENgUalkYCEJtU4Pe?=
 =?us-ascii?Q?O5u4F+Bk8W++q4QH4y5tNZ4SXwiHJoWGsvdh4lncIpcifvJHPitQ9Cv2kLMs?=
 =?us-ascii?Q?fg6GaLaPAJDUHQlLDF99LvqkXLRvmJK4uW862HojKspS4f5I2D7neXAkdFKi?=
 =?us-ascii?Q?m0asmw7SbHxGVg0mR/eHAkXJYPVutR/hmZJfNCtdvWWpAVndfCXg/K4dNJq2?=
 =?us-ascii?Q?5Uh6kVdU5ZVW+6axElUU/nehf1uZEmLPxE5zpCrP55wgn0+2HLlWy6WdtL8N?=
 =?us-ascii?Q?atD1EWafcpsSdTSU5JL2Onx++xv54LC9OAZY1DN4yTR1EzB66wEFGIELXrb8?=
 =?us-ascii?Q?DeKQ2Bc1UenYHGqa1AZfkT7neq+RgC3eCsStFPeqoDRNEy+xm/6+UHaFz3Lf?=
 =?us-ascii?Q?MTdtg54Pjoa7I+nCuX5Qq5qgyLgvLpoFSDdZgs0c3iRpqAVZaUlrg/UIga7a?=
 =?us-ascii?Q?jP0j1RI/umK7ddofxrRvuEsxhf1uOWJxHacfn9pfDT3s68b2gBj30/XfHDRO?=
 =?us-ascii?Q?rJA5pA+BZJkn6th34NzA3AjE9YwK6gXPb9b8j0Y1BXhvyLE6Kd3KxvlPFwZX?=
 =?us-ascii?Q?6cEo+knRTFbbMBApc9wf9++76fd77q69PFhYt6yEUDPUH28mSkjPUrZxLCTK?=
 =?us-ascii?Q?oadBBuSA7zYe7xbjygBRRj+OS1HdoY47zOkrMTlelST5S5gVnUGri7dRZEU7?=
 =?us-ascii?Q?xS93JKgdXvBH8ShfxshbqHlm+Lz7gIHjAHlt3Aw1MeBRaA75IOQ3cP+vKzQh?=
 =?us-ascii?Q?t74YrncXaZ67T/FfcQtDs3wh6o2ClfQHlmT1/CRNZqDn026Zj6fPSmTdd5p8?=
 =?us-ascii?Q?QSTb0WM3kbRGB5yeljLwu32R1gW7rewse30UGqmVKFRA+02xjA1Mws4ygDxV?=
 =?us-ascii?Q?tArBNxVu6TQMATgSBOCam4GCOAJs3o2IXPV8qz7UdAgOJDdFw5vpr6VJlkwM?=
 =?us-ascii?Q?EKfbIbFOUGqSIY0WQ2MaHOJKS2zIbq0xAYBYCyGd6iidYR8YyvxV+lmqA5Q8?=
 =?us-ascii?Q?Lo2d87eqprjCM2jArjEzt2JBLdwHgZP4+qRnprjsbhuUyAkm+njW6bQS4HSe?=
 =?us-ascii?Q?OV2/ejx+XOtYIP2IF5PjEFkhyZTxXNqE2PGGWuZv8DmL5bau8WBwntUCi8Oa?=
 =?us-ascii?Q?6ALjNlwvoGrCbiltOa0AQalfYiwiJc360/ZJUO0AdWT831w63T4K0V3fnZl3?=
 =?us-ascii?Q?qD93GgRFnSUnxqrk5u3pwsQPw88CjbtZeo1Iq3g0Go5BwYT0RtgaY/f360Ga?=
 =?us-ascii?Q?Q9V2Uvt9mAEphUrcGVbD8ud0vdYV3AWLKMgbvrWQ3l2mTaj/oBhTImMoz8Nl?=
 =?us-ascii?Q?RWdmJSLwZIK4Kd/nNiDdaeQSDk6CQXoZHd/R/nMx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4905e83-ae53-4c8f-f4d2-08dc44075c87
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 09:15:58.9318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYfZ0+m/omiLuwjZJBCxwIytz0EZZfh4Yu7EPjDqMwqA8na6NcRwBqBxVOXTbeNrAEZ//Bw1AARrPg/UT4SJCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7703
X-OriginatorOrg: intel.com

Hi Peter,

On Mon, Mar 11, 2024 at 12:19:32PM -0400, Peter Xu wrote:
> On Sun, Mar 10, 2024 at 04:10:37PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
> > commit: 924bd6a8c96767a05323d575bdefd664631dce73 [12265/12944] mm/x86: drop two unnecessary pud_leaf() definitions
> > config: arm64-randconfig-r031-20230409 (https://download.01.org/0day-ci/archive/20240310/202403101607.a42gaLOS-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403101607.a42gaLOS-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202403101607.a42gaLOS-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from include/linux/pgtable.h:6,
> >                     from arch/arm64/include/asm/io.h:12,
> >                     from include/linux/io.h:13,
> >                     from include/acpi/acpi_io.h:5,
> >                     from include/linux/acpi.h:39,
> >                     from include/acpi/apei.h:9,
> >                     from include/acpi/ghes.h:5,
> >                     from include/linux/arm_sdei.h:8,
> >                     from arch/arm64/kernel/asm-offsets.c:10:
> >    arch/arm64/include/asm/pgtable.h: In function 'pud_user_accessible_page':
> > >> arch/arm64/include/asm/pgtable.h:904:16: error: implicit declaration of function 'pud_leaf'; did you mean 'pmd_leaf'? [-Werror=implicit-function-declaration]
> >      904 |         return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
> >          |                ^~~~~~~~
> >          |                pmd_leaf
> >    cc1: some warnings being treated as errors
> >    make[3]: *** [scripts/Makefile.build:116: arch/arm64/kernel/asm-offsets.s] Error 1
> >    make[3]: Target 'prepare' not remade because of errors.
> >    make[2]: *** [Makefile:1199: prepare0] Error 2
> >    make[2]: Target 'prepare' not remade because of errors.
> >    make[1]: *** [Makefile:240: __sub-make] Error 2
> >    make[1]: Target 'prepare' not remade because of errors.
> >    make: *** [Makefile:240: __sub-make] Error 2
> >    make: Target 'prepare' not remade because of errors.
> > 
> > 
> > vim +904 arch/arm64/include/asm/pgtable.h
> > 
> > ed928a3402d8a2 Tong Tiangen 2022-05-17  901  
> > ed928a3402d8a2 Tong Tiangen 2022-05-17  902  static inline bool pud_user_accessible_page(pud_t pud)
> > ed928a3402d8a2 Tong Tiangen 2022-05-17  903  {
> > 730a11f982e61a Liu Shixin   2022-11-22 @904  	return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
> > ed928a3402d8a2 Tong Tiangen 2022-05-17  905  }
> > ed928a3402d8a2 Tong Tiangen 2022-05-17  906  #endif
> > ed928a3402d8a2 Tong Tiangen 2022-05-17  907  
> > 
> 
> There's another possibly relevant report for riscv:
> 
> https://lore.kernel.org/r/202403090900.OwPqmRuI-lkp@intel.com
> 
> I think I messed up the nopmd use case.  Since this commit already landed
> mm-stable, I assume there's no way I provide a fixup.
> 
> I attached a formal patch below, but I don't know how to test it myself,
> and I'm not 100% confident.  Before I post a formal patch, can anyone let
> me know how I can kickoff the test bot to test the patch (or help me do the
> kickoff)?

It is recommended to firstly follow the "reproduce" link in the report
to see if the issue can be reproduced.

  reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403101607.a42gaLOS-lkp@intel.com/reproduce)

Then please apply the fix patch and rerun the build command to see if
the issue is gone.

The kernel test robot sends reports when catching any new issues, but
the bot is not yet able to test whether a patch can fix a previously
reported issue.

Thanks,
Yujie

> 
> Thanks,
> 
> ======8<=======
> From acc5598c7af0b7c9a486a49b8c562bb351e8d35b Mon Sep 17 00:00:00 2001
> From: Peter Xu <peterx@redhat.com>
> Date: Mon, 11 Mar 2024 12:10:45 -0400
> Subject: [PATCH] mm: Recover pud_leaf() definitions in nopmd case
> 
> This reverts one change in commit 924bd6a8c96767a05323d575bdefd664631dce73.
> 
> One issue with that is it broke nopmd builds for at least both arm64 and
> riscv (CONFIG_PGTABLE_LEVELS=2).  The other issue is it was overlooked that
> it's a common change rather than x86 specific (relevant to the commit
> message of the commit).
> 
> Normally there's no need for empty definition of pXd_leaf() because of the
> fallback functions, however this logic may not apply to pgtable-nopmd.h,
> because that's a header that can even be used by arch *pgtable.h headers,
> which can use the *_leaf() definitions _before_ the fallback functions are
> defined.  Leave it there to pass PGTABLE_LEVELS=2 builds.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202403090900.OwPqmRuI-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202403101607.a42gaLOS-lkp@intel.com/
> Fixes: 924bd6a8c967 ("mm/x86: drop two unnecessary pud_leaf() definitions")
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  include/asm-generic/pgtable-nopmd.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
> index fa27e16bbe1b..8ffd64e7a24c 100644
> --- a/include/asm-generic/pgtable-nopmd.h
> +++ b/include/asm-generic/pgtable-nopmd.h
> @@ -31,6 +31,7 @@ static inline int pud_none(pud_t pud)		{ return 0; }
>  static inline int pud_bad(pud_t pud)		{ return 0; }
>  static inline int pud_present(pud_t pud)	{ return 1; }
>  static inline int pud_user(pud_t pud)		{ return 0; }
> +static inline int pud_leaf(pud_t pud)		{ return 0; }
>  static inline void pud_clear(pud_t *pud)	{ }
>  #define pmd_ERROR(pmd)				(pud_ERROR((pmd).pud))
>  
> -- 
> 2.44.0
> 
> 
