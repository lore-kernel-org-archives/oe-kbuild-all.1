Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41E01FAF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Jan 2023 09:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673169443; x=1704705443;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=y7vv+ro8G+Og+FCpMhR1H7XyeO6gvwigHI41tgx5f9E=;
  b=PJPTt7CAUQavZnFemrG/XKVjHwg54aRo5MCWR69hj99NB+brmAU26Uu/
   +4K3TXeabIlqhZY2zdCaa7lHj9iYlC4WGUl1lLQsqrK7YIpnzRBjYTit0
   Y6IAKYT9djhCMHDD6GVGXe8/VbJte/KxTi8vOM6xaiy1UUhxK5or/W86Z
   UQBTdjFHk/DktmrfCRXNR8Mn10nrYVSTLHPjThnKayowjnhrThdM/ls5/
   d2+sI7tl0fEZyRLdTGuaxYFlLV2GH8xjeEX7NvFfBhKUY1WVx3MRUcx3j
   P3DG84dvE2X5N/M4G7JK+NtTt9YYg7EL4fj2KJxlI3Vey4i28atLVN+aP
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="385006094"
X-IronPort-AV: E=Sophos;i="5.96,309,1665471600"; 
   d="scan'208";a="385006094"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2023 01:17:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="688728591"
X-IronPort-AV: E=Sophos;i="5.96,309,1665471600"; 
   d="scan'208";a="688728591"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga001.jf.intel.com with ESMTP; 08 Jan 2023 01:17:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 8 Jan 2023 01:17:17 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sun, 8 Jan 2023 01:17:17 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sun, 8 Jan 2023 01:17:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hSN6g7nQUZWo6L5Q3D+S2vO6jr0W1Qjoo6OLa453cJ8gRwMPUYaknsURvJEuB1DIl0ld4bU9X69b0lGwrYkeI5i9OjyQpSxrh4hb1ta9XzPoejYQn/GeQjFVBZMFscrEzg117silhY7YmPYWlnNWu+0ZTwl3wVviVQQfY4vCiPg7a7hN/nhAPjOHIH7iavnMyW7/KtmmUc5dTfVipbohUrl4so+tbV6sF4lGk6TWVUN8acwq4pCvI9c2Pj6Yyj7ynmkV9QoZrzBF/UMW/bKBOepEkzHt5UTHuu3JXp54pYMkmh245pgPXr8tkzR0PFe4xnAmstGd7KIKyewV+2Ykvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QfVdrLusRzehEJK0b6MJTym56RBUjROGb/XLCRjLYw=;
 b=aFbRtx2P9HeMn4UjK+fc/xUboIn6UglCBLyA4zkkezA+J0EM5l5Yp0rA+ElkeDmzMeLTBbQbwLL/RzlhZY9PUsTKjr9/kuuL5XNDVNoJbfyBXbgK393lOWXI8QK5XR4HvAM10fjXIfvVlw1r1ti9SvZPAqvugsTvSBbrMwH8DASgxphoxDGDb91dTAlO6/lWtyeZMA+dwg3QeqPnt8y7TgxcAwGwz/Fsh/gWMpnYz5DwcC7vGdjOqGyqGUnXwgM17fceDYFVVKsyCZdXliZHxcqySy7yQtoKEzr/+Kylc3q5J/rlkRh+Jnle5aT+teIAqyQE1hNKlIzQH1dcVTyxwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6304.namprd11.prod.outlook.com (2603:10b6:208:3c0::7)
 by CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Sun, 8 Jan
 2023 09:17:14 +0000
Received: from MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::868b:ff1f:d827:188d]) by MN0PR11MB6304.namprd11.prod.outlook.com
 ([fe80::868b:ff1f:d827:188d%3]) with mapi id 15.20.5986.018; Sun, 8 Jan 2023
 09:17:13 +0000
Date: Sun, 8 Jan 2023 17:14:30 +0800
From: Feng Tang <feng.tang@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [lkp] [+64 bytes kernel size regression] [i386-tinyconfig]
 [78532abaf5] x86/tsc: Add option to force frequency recalibration with HW
 timer
Message-ID: <Y7qJdtnshG3vu95L@feng-clx>
References: <63b93549.zVwVAqMScLqdk2+g%lkp@intel.com>
 <20230107160132.GY4028633@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230107160132.GY4028633@paulmck-ThinkPad-P17-Gen-1>
X-ClientProxiedBy: SG2PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:4:91::23) To MN0PR11MB6304.namprd11.prod.outlook.com
 (2603:10b6:208:3c0::7)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6304:EE_|CO1PR11MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc9d5e0-b75e-4e2a-c420-08daf1592128
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oe/7TzMwHPW0l4entEqImwDe8ucL70VL15FRVSl78r8oZTi56eYGqBZctl0lM2izhXBsg0n1HTb3/92Cp7pFnnu47sOuqdMY3Zkw3GX64rQYRxX+LpSNevPWpCsbHnPGYKnpoXdB7aaCu2LGD43xr7ia/ONgNA3TESFumatRrBQBDHG8wOX0KqANrdWUmoDaZ836aEobPV5iFh0XV4mdfw6h+6dIGLMqzFhz3XpSTYbPZaIP77CxaJw0Zn8QckFqZy4YQL9GO5LDGzkr6vWACqkVFBV+r794IkJz1nuJQXyORRgPBehEdzJrxx4oG63FmXclO5zfnLl7HpQHoscA6ArO+141F185s650jWb6Nxzhs9o6dpmvyFnohePva+w+Ir/lj9Pk6jETKXtIQfK3vHQtUhNy9+6hHMOTRP846D7Ra4tXghC66h8+9LDCqOsyviyxQ/Vujb0Hv7xBRPdIFOoPib+8pdM83K7hzXjWZA0F5kbL6oadh8q0lEv878iCQdLdQwoUew7OV0NGkPvfS67q/twUabZyPjpTBpWPFaYZSo7TCHWcLNEo9cWD3kJAtT9KvBzUKfweI2Oxgd9Z410Uxy+/FnTpujEs44ICQ9N9PbvG3V/yBwNAtg2vZ0KjMfepfJ47MB4bK48ZnulPJXTLBP8K2yucugNVQ+avfSk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6304.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(2906002)(44832011)(83380400001)(9686003)(66476007)(66556008)(5660300002)(66946007)(6666004)(26005)(186003)(33716001)(8936002)(6506007)(6512007)(478600001)(82960400001)(38100700002)(41300700001)(316002)(86362001)(966005)(6486002)(8676002)(6916009)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tj/DrdQ0WouvOOAADANHR7jCyN55OteLKrYC/P7KR4YwpwmFKpMES6LX9MUM?=
 =?us-ascii?Q?uhm6Fz062EEWsQniGKC5tHCXDKZijm9rUDPV/UksAzUcLAzzzTGcCJg6M6QE?=
 =?us-ascii?Q?dz/MaLvJKneGergfjoDqjQOnO+7Dsrsk7oKupepCKt3tugAS23nIxWniK80Y?=
 =?us-ascii?Q?zi3MfnhEXrq3wR7XSU3IO/5IpFIjv+Dvvedw2See/ppeZOQcr0zRmToofXGq?=
 =?us-ascii?Q?TC3Ux/LgNg/Ed5+sfGfFHjIFMB3ABaVexipfBn36jm1zs8WM57ZE+l5TnClR?=
 =?us-ascii?Q?gZHzibCfyZebfbYsk+Tpjfyny8486ALf+7XaOOGmhjlBAsWtVrKeTkQrrQzh?=
 =?us-ascii?Q?UREvaLOvunwyCauJSxddQE+h5pP41jPkbXGh7V1vxAwYt0NzTkbinSa8qynZ?=
 =?us-ascii?Q?hEdb+ke7Qo696Ay7VDeCEEqzoHmxjAV52kqWOENiUwTkyIcS1B55faDkmqim?=
 =?us-ascii?Q?BoatBJKvhTg1Y+knS5WW4IdsiqL/HJH6AGhlx+jrYcfd9ZMLeJZCb2V8TLxX?=
 =?us-ascii?Q?WjONbIvm+f+ij7OXiRh1RNvkSFH4vb2rEcb6SO/ur23lucqLPkeUhxcb5vGO?=
 =?us-ascii?Q?p51iTryYM5ijsKugMCVMB+KNPwySlYSimmhUnzda7vW/cxAwZZD8sMiJ5gRE?=
 =?us-ascii?Q?0kIfc5ufpAoICdBO7eXsc4NMsvOzJsJSvZo7n8dlZSRBpBXxgyom+LkF4xN/?=
 =?us-ascii?Q?bQ4ckX+ZGBU2HxCLXANerONmN63cNH+fvvlYcyX9oP1abcBN0I2UlAGIuuV6?=
 =?us-ascii?Q?l40RFpbHA/T0C0qoTqKH9JIwn3X7+3Ugqg8NjwIRQDA+Ql5YIZLjFHUxCGNU?=
 =?us-ascii?Q?4ZK0DtA4EcGuyrDTm5t34qmCcqeuJsoKJC5jPx2fThFvwjoBE8dhTOV3mDxN?=
 =?us-ascii?Q?8sob2o8O6xUUYHman13Y3MlT3sABxDlswbi6VVX4vEgt+FnsWp/mz3NyXAXi?=
 =?us-ascii?Q?xBJhH//vZ/A46VqINd+U/Kdd8jqQtTn+dI/8PeQXEIpNRI8C2Iv6ENxosc+M?=
 =?us-ascii?Q?thBjLB0zVNyVF1L4J3zmYZdFvPMi5zCT4SmWy99YDHmLBjEbAIupRslum7Da?=
 =?us-ascii?Q?Yk18NQVPUnyh4LI7/F5pQS64p4IlskczQ6THYVH06obRFLpU+l8qXBH4CuxE?=
 =?us-ascii?Q?08j6uFYM+81ueJQcLk/s/wHtsNlib0X0an/NL9uQWA7faTknCeqM9CRWQ/Ve?=
 =?us-ascii?Q?JjmjAuuIt3T2vs/jKvv2E199D9vW+75fGW4ZYz5x9KDGQYW+AbpZVgpLP3/I?=
 =?us-ascii?Q?ASyluHWyAPl4Xuwh6CM9/ww6GYkQdrheJDD2q8jiKRenSzrLRRA7TaalD/jd?=
 =?us-ascii?Q?1ZoRogH/7x/4t0fNefRp4T/1y2+zDLXRr5LlA6hP9ObuLJc4k4x8rGx9WQHs?=
 =?us-ascii?Q?FD0DyBgkjeY1QSPuml0h/xPE5tOQm8BDB8Qga8GJrbOUmFqNnsO244+iwf7Z?=
 =?us-ascii?Q?8+9HeVW9PrCwzfF3iwY1e45bnpfgyMrHl3CQutm6Fqqu/ixuyo/CFYkNlBL/?=
 =?us-ascii?Q?ivdYtiEyNOMdY7vWI+s+y1+eSpZLqWonVB+BsvNf+xvQzDHKMiE45OegvX6B?=
 =?us-ascii?Q?AW/3xsjzdlSZMgM8HLBEmDIiTUHPJlnF7JxeJhP9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc9d5e0-b75e-4e2a-c420-08daf1592128
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2023 09:17:13.8768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /pIcmbZ1T6FyQsJYw3rkmw8ZZGVoaVYADpZYK4YixtgXRmcWeV7+TnU/X6u2epwBdJyZVB7626MleZzdXrg6SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5057
X-OriginatorOrg: intel.com

On Sat, Jan 07, 2023 at 08:01:32AM -0800, Paul E. McKenney wrote:
> On Sat, Jan 07, 2023 at 05:03:05PM +0800, kernel test robot wrote:
> > 
> > FYI, we noticed a +64 bytes kernel size regression due to commit:
> > 
> > commit: 78532abaf5f1c973c99680960ae22bd797951ddf (x86/tsc: Add option to force frequency recalibration with HW timer)
> > https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git workqueue.2023.01.06a
> > 
> > 
> > Details as below (size data is obtained by `nm --size-sort vmlinux`):
> > 
> > 8913f44d: clocksource: Permit limited-duration clocksource watchdogging
> > 78532aba: x86/tsc: Add option to force frequency recalibration with HW timer
> 
> Perhaps there should be a Kconfig option to disable the clocksource
> watchdog?  Not sure that a minimal kernel would worry about such things.

Yes, there is a CONFIG_CLOCKSOURCE_WATCHDOG option. For 78532aba, IMHO,
64 bytes is a relatively small cost comparing to its potential value.

Thanks,
Feng

> 
> 							Thanx, Paul
> 
> > +----------------------------------+----------+----------+-------+
> > |              symbol              | 8913f44d | 78532aba | delta |
> > +----------------------------------+----------+----------+-------+
> > | bzImage                          | 495904   | 495968   | 64    |
> > | nm.t.tsc_setup                   | 103      | 129      | 26    |
> > | nm.t.init_tsc_clocksource        | 111      | 132      | 21    |
> > | nm.t.tsc_refine_calibration_work | 427      | 440      | 13    |
> > | nm.d.tsc_force_recalibrate       | 0        | 4        | 4     |
> > +----------------------------------+----------+----------+-------+
> > 
> > 
> > 
> > Thanks
> > 
