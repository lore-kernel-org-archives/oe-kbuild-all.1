Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54FE2942B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 13:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VffQzEcr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697118590; x=1728654590;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qGn0nmI5c2gCQnr2cIsiltYXd2lyCXyoriC/KFQ93fA=;
  b=VffQzEcrK/n5sCI/gSiZGkmDg40dVInyZW5E9mfF0mycJb1wtPC/xicy
   wtxiw50ZcV+5vggs/oYGrIMNjmZA26PohGoHAjLIOrGVW8OUe7iTNwkCH
   +5N/q2DeQhF9Zxidi2f1lx1VVrIQsHeEDLk3W0spFu3OBAszKsney+TcD
   mw7NeRXSfPlOB1ErpP8N0giBlrOGG9juAs1eaqRfGeN4msPC9ARUnUIy0
   Qunirwtc4wAbMSCAqtnDtQG6HjvZnP67Nzl5Ea10onLe7lrMsQQxMpRVn
   gYx1g+P6WkkzuklvliaHkLxnpHZ6c0m7O+50YNVlcdR27A7SU6ZRFEkwT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="471183183"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="471183183"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 06:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="783710007"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="783710007"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Oct 2023 06:49:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 06:49:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 06:49:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 06:49:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dko2PbT1dcYA7DCgw8VnU7qXaFHbX6N0xr47yDFa0+SXVkm7StQrcB4zIlZxH5gqa9mllgP5QArXkAhFispibNDOewkzPGjrr47Zi44c9TLU8H2xqSUO+ZPgvipZClCxcmV3skpBT8GuzQ3j1q+1P8fbdGhaFuyK+GLbMYnwRsepAhUUgPTbf1fvR4MfziTdzBaXWtO48IpJTYeAsKH4H+J5XKx9U0vSa+3kPLZ9ONsofXFbiGUC3CXjeg94Vw17cQsshTDkMGbYp//bUMFRJul0Gqa+lZ0OV3WmtBteF1qUhQgsZya7KYlDF0kSE5gq/dGii/pOySIC+PQqhGOMOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHSw10lFmEBsSQJE+NghmxMQoPWNMjCnqpeihSOqP0A=;
 b=QYY0EqfOekixB9C88zh5c4NW6bc/DZRmkK9tFp0buQTKEwHvdP8X6dHalMjbejcPQbRZpeSGPy9zkL/uPxvVyyOqWNk/2ZI3ffbZhgmZPOibAeFbCeGh8dSwz5pCBAm1YZtCFKpep8QAMjftQ1kJHl/o3HlIuVA0j7G72dFQsupjlC8cHNkuiwA4Uaz0W+WMMt3LJG3JMUEbBRkzNEzgpLrnuafmd0H3SifGmAiCcaMr/q6eF9VflvGemOP1qA9NKjqFNMRF/OqFnKYeIC5QT6yNG4NW5RZqu9hiv8PSQBBBnmzWRUqCv9bvX4yH0q+5g9sol8PM7udYWuNNuLZA/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by MW3PR11MB4715.namprd11.prod.outlook.com (2603:10b6:303:57::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 13:49:47 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::f64:17c0:d3ab:196]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::f64:17c0:d3ab:196%6]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 13:49:46 +0000
Date: Thu, 12 Oct 2023 21:49:36 +0800
From: Philip Li <philip.li@intel.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [arm:ktext 3/20] checkpatch: WARNING: please, no spaces at the
 start of a line
Message-ID: <ZSf5cD3PTF8oJ0CS@rli9-mobl>
References: <202310122011.vD7J81PV-lkp@intel.com>
 <ZSfvMoAhTXtT7G7l@shell.armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZSfvMoAhTXtT7G7l@shell.armlinux.org.uk>
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|MW3PR11MB4715:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a5bc453-bf52-45a0-fdf9-08dbcb2a188f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q+ZMjJs4TLnKzRxuSn548gV07AEeNNY5L8r+z5WxIQTCXihikAfQ60MAy7Oj4cdYl8VshuAY2uOln9+5XMXkUCZqBvb4ldyel6vx1AT6K/CJs15tIlOuZsw7ZLo2deF7ogi/Yypl0qBGjdmjZdWyAkmsstXNOgfzPQwM6/A3sy82WpuPEAFts8p0LtMY+xJnx68uefgHE5VBsJfGhLuEv7Xa+1qyODNGcb0f+o1rpnY46Dwv3KHMppYIDDXxYdmmX5Pdc2OUKzRp8pgyEe9Eb7anIiULQywXnR/Nie1xdNxaTigIcaFR4wziUrhFJmUvGy+0UF/kcA1XUNw5QvUg0KbqphMn7rNo4uU4+vfm5OGHfOessDwi65b8d1dsuXfJgQEKLsiOd4zDcCfQgaiTja6J87yMFP6YZX/cZg+fjm7E5tZLebE8wcrpXWjoKhL5yh5G+tfsKxx0sLSPyZkXL3UJnKrkWWN/3dgkoGqClVl4Xy69SM1rjwCHiR1Jpv+PN1HT97+Gn8rXt0HscSCqEmKVZwNclU9q/RJJAyG88W2QmedxoC6YDv218JDu18qyK7Lrr+ZGxb/l6oH3jbI9LQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(346002)(136003)(366004)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6506007)(6666004)(33716001)(2906002)(966005)(6486002)(478600001)(4326008)(8936002)(8676002)(44832011)(5660300002)(66556008)(66946007)(316002)(6916009)(66476007)(41300700001)(83380400001)(26005)(82960400001)(9686003)(6512007)(86362001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YGYjHyseScn5kxJdz+sQIfZo2jQ5mRhPZh/BQvZZgnDVkuztINIwF0vQMvSG?=
 =?us-ascii?Q?Kc8SEjIZyREk+mSeRPjLuOrtR28xIoSJb/vzEn+2xe/Qb4oWX1F6GSKxR+Gd?=
 =?us-ascii?Q?7vixLCR2bsTkubRxCWiG4YacJBKslEzuQIRkbI/mKM6ls8Pv16hfim+46QQB?=
 =?us-ascii?Q?zT93GIiIhq+4YW22kWtUjAtMrmXW/fpeC+2u0U1accnCSwEaL/bU6KQ5YgIO?=
 =?us-ascii?Q?8UGM0NzVdc+uUePXZLiZxIw7iej5ngW25FfLepvmjyEEPTGFOlKq0IOIuxzK?=
 =?us-ascii?Q?6eqENAfXmcp7Llf/2N8VDQDMrbAo01nqkTlLD3vyvAgpKxgVMd1pTaS1q5JO?=
 =?us-ascii?Q?Q6ZBbszEjuI83Ffz9oebC9/iIT4AhXRFKyYD0SdxBYkqjqD2gk/O7GTLd5Y2?=
 =?us-ascii?Q?BW0xTLIX/h/XglgHebboov2vpQqTvg32/vFwJX6s0hf9kkbiEaGQbocae+nM?=
 =?us-ascii?Q?3MNwBA9tSW/tvi12VdYDgwJkEN3kv5aSGZu+vLSHt57BnyRprbNjvxa5mH61?=
 =?us-ascii?Q?uqGWmZib5VzWOYG1kT2jTr7VfuAv15alRaREAN2zBh8tysf9tOqV3vMhexkL?=
 =?us-ascii?Q?3J52YSxX6JhYTUyXQGr/+dBFacb8M7ofnTkHssOy+4wOkcmSHQtQozOWmfcg?=
 =?us-ascii?Q?413ev2hlDT2R8ElUy8Wce2k0kqp6zfcE/qFqm1N4bKsH26N57Q1oGovKhMx8?=
 =?us-ascii?Q?ssM3d65v/b89TDkVgNopmO5kwSi6ZZa2h2zVV0FkuhwSEGpwRTIPMxJKMSef?=
 =?us-ascii?Q?liZq1uh8ZoCQckNgZLY36PGSTkuhV9ElYfGwPqY+ERgRAk4M7ci3ZnMJd2kR?=
 =?us-ascii?Q?4mvtwA/ShPh9O8dPx9ThQ7vGDz6IBxaDfthD1ZpE3mh8KynMuHUsP0gtWDF1?=
 =?us-ascii?Q?snEEGhBU9RswxtTMJwoZSK6kxgIXh/0IEjZzdXmUkhdXhzOfL3vbZXVNCwAE?=
 =?us-ascii?Q?5KSMXVtWVqvcDS1Yvo/1BHLmQ5KG5t91wQcrR0J9tnwl5a06O1C0Ef81I217?=
 =?us-ascii?Q?4Lr6PvzovRG7P/7SbpvnkJDsZQ28do1PIAOpAtMuGAvOXZ6XwIVrhVC1wk7m?=
 =?us-ascii?Q?ivqIu0ivH5WoRDxfCUe/X5duyczdZgoOPMcIlg5rxE+cKxtURl/ATwa9UcrI?=
 =?us-ascii?Q?egLf/Ht6DovwXxALQQwN1jEw8b4cciMkaoWRJJMw4OzTUEtipZw4SlIyMhfG?=
 =?us-ascii?Q?cx8RnKGja7kDEzorDDlioJVQSIwdCT/n+V92IXp/U4QoECTOcgCfMWR/YpMA?=
 =?us-ascii?Q?WzGxcuZmoNWP6z0t4GJz9qmeSDkg0x3OsLFT4HrS4eL5f9OLTuETFbqaUG8d?=
 =?us-ascii?Q?EZe6+U3XK0xjfTPx7lH7uhbcC2Fyr1crYUBBpi9sbj54kgiH2m9YQpgCX7EP?=
 =?us-ascii?Q?FsQPv7k3K/bgVCqoXJSkwpvn1ciCjZqqX6VacRULBm4tGwMDy/knL2EGuvVj?=
 =?us-ascii?Q?JYfwCuTplZtdxwYhu6uGCHZB1Mece55N48hw1VeTBiGTdkJT3YK4KqEVzpAL?=
 =?us-ascii?Q?UrnflgiceTj6kKpKiNrEm1IH/g/0nj/8t4/EzVdHshFYYtgqp25iaUHSbISD?=
 =?us-ascii?Q?vMs4ghpZC+GFndqT2gQJOlPnkUr5J0iTN9PsmHoy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5bc453-bf52-45a0-fdf9-08dbcb2a188f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 13:49:46.7401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nTD3Ajxr/+ITiAimyz0/5DVIKkeFffH3+g2IwQDnCK2vhMJXe2VA12HZ9ZW4gzgVtoUCDiMLp1QVYOYrGTtICA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4715
X-OriginatorOrg: intel.com

On Thu, Oct 12, 2023 at 02:05:54PM +0100, Russell King (Oracle) wrote:
> On Thu, Oct 12, 2023 at 08:59:37PM +0800, kernel test robot wrote:
> > tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext
> > head:   7fa946ce05c273d5ff092c814efe64978e5faf45
> > commit: e4881183f9059ed8aaa3f16857fd9e0c1db5c168 [3/20] arm64: place kernel in its own L0 page table entry
> > reproduce: (https://download.01.org/0day-ci/archive/20231012/202310122011.vD7J81PV-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202310122011.vD7J81PV-lkp@intel.com/
> > 
> > # many are suggestions rather than must-fix
> > 
> > WARNING:LEADING_SPACE: please, no spaces at the start of a line
> > #72: FILE: arch/arm64/include/asm/memory.h:57:
> > +    (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \$
> > 
> > WARNING:LEADING_SPACE: please, no spaces at the start of a line
> > #73: FILE: arch/arm64/include/asm/memory.h:58:
> > +    (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)$
> 
> Sorry, but I disagree with these warnings - and if they are being
> applied blanketly as seems to be the case, they will be doing more harm
> than good.

Thanks for the feedback, we look into some existing fixes for this warning
on mainline, but seems no similar case to this one. We will turn this to
manual check to avoid bringing noise in future.

> 
> What this is complaining about is this:
> 
> +#if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
> +    (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
> +    (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
> 
> which is perfectly reasonably laid out, whereas what it is suggesting:
> 
> +#if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
> +	(CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
> +	(CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)
> 
> Is just awful.
> 
> No, I'm not going to fix these, and this emails are just needless
> noise. Sorry.

Sorry for the noise, we will fix it asap.

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 
