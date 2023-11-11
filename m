Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B46633FB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 01:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TpoZsnQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699667307; x=1731203307;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=VTBLDRNN4xAIPxDyQfYlN0Kg2z2hSWbJQ9+qhHQuQBs=;
  b=TpoZsnQThiNxHGrYbesUL8evrG4faPfLfagS/Cf24E/CJXbvFiuwIGHk
   zwyK1WMqO9cp8fVLISjbrvBLAvdU51nr9TpUM3a5a+qYSczcDI/uTx+b8
   oj8jvUROQZeBCoaGooPRlZ27vTYmueHOhY7Zs9Ycg7mwGzzdop4UzhkFK
   RGFD347l5LMgQzWjyJoZsfLIRwyLt+IGj8izzAE3rMDBvxHgeWuc9544p
   Ge1g72wVzkwKJcnzW8HEzwo+9H4+JtEbh7VVPJlcl9dx2DVqvYN3uS5xf
   QYmmpZEm66+K3C90g6M4ytFPkjEPkxf2lzNUQuM1oBlui3Ri1lNN9jlpK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="454552364"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="454552364"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 17:48:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="767448351"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="767448351"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Nov 2023 17:48:26 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 17:48:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 10 Nov 2023 17:48:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 10 Nov 2023 17:48:19 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 10 Nov 2023 17:48:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXsdgS6BUWP2wpnkXboF8nVt0aIY++dEnG1dU51ITN0+kIwbrXZaFye4TOOHW459MGfN2aCih7gP9avBBWKbmxrfK0da+sY679qVdcOE5UgjEs0u3ESwWmfudJ8pEE4TREMCMMCK5yAPnqTvtFP7aTWfQIkEYe90vT3PM9USIPkyK6tD1xSsGz+/cG0UbC2hzSMl+aPHB1fSHxEEoKJeHJSIRQCNemPa0W58UeITuleI4LqT64mpBIU+DAEogrhhgM32Tz8Fd9yFolTU5odb9CTmTN55nHSNcjjNcCTlGBWD2T+fpgEvPyNc0ngGVuYjWvdC/+9uaq6A9jrnqW5INA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWcycETWtXEbNdKjTbt7SncSiBfRdro58LSvXytxZCQ=;
 b=ngUeM3yax7R5kJahY/8j82eAFGnGewi2aWIirXpq60HrheetePQt65slswLTYcvVpdA2p3S0X/FN2UuaapJxPHd95ElV/I9RA7XsfeEJpVxC+jEUxRd3NA7nUzpkLJPburlwJ+26iz53dhpY+qpix1n3FkyrhcLi3V+5lWCnDaTnydNxnKeDuEM1cyAOhtLtPpn42rk6adzyZAXGjVZP1EIq1YSI5yz96n2fi40/EqQ4g58VNnqcE17agPUbuFyIZyyz1es6wKfvVqfkvOlr7QLu8zbr6TYsJ9lUF9F2UaScrJuYf23dtCmDIDTDJmWjBVhzABA9zlIY1VZag2LsPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by MN0PR11MB6229.namprd11.prod.outlook.com (2603:10b6:208:3c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Sat, 11 Nov
 2023 01:48:11 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::2f1a:e62e:9fff:ae67]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::2f1a:e62e:9fff:ae67%4]) with mapi id 15.20.6954.029; Sat, 11 Nov 2023
 01:48:11 +0000
Date: Sat, 11 Nov 2023 09:48:03 +0800
From: Philip Li <philip.li@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, kernel test robot
	<lkp@intel.com>, Boris Brezillon <bbrezillon@kernel.org>,
	<oe-kbuild-all@lists.linux.dev>, Steven Price <steven.price@arm.com>
Subject: Re: [mmind-rockchip:dev/panthor 36/41]
 drivers/gpu/drm/panthor/panthor_drv.c:1326:6: warning: no previous prototype
 for 'panthor_debugfs_init'
Message-ID: <ZU7dU5TPM3N7Ur4Z@rli9-mobl>
References: <202311110058.uP4Vh1gN-lkp@intel.com>
 <3931875.atdPhlSkOF@diego>
 <20231110202058.1c05283a@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231110202058.1c05283a@collabora.com>
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|MN0PR11MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: 381e0a3f-9ee3-414d-12f1-08dbe258433e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ESWLwycXf7V6X34/SYP2H23/unqckl1CmzuosC2oBhVu8Ehrz9os+3RwrwFurMdrC6l/1w61BnRbojpa8mfzNACzx/sc49rARa2aVfjlmGKdOjDyHgF2gL/z6jwjqH19Zt06d8HoYs3fG/MA0viDFB0xsp+7BOjDvQ+9/PDaUk3qudsnE5h5ChrPEY9S/LCRRCJHrbJ868aaM6pxqTcCJYEAE/aeZEFr+jF9WrXJ8GIIpamZ+d+VsB187gBHbv1hdh4+YVDgQYhlfh+y/T6H6+mjRmDnIIq5GuRpLfgy/09ARMAWsCWUsxefKjNPYCOaMb+qskKxdutYQySXPc9pM4zlQCgSbmhk/iy/9mXMnMBXY+86hzCnwVdmI45WY8vmLGK57cZzJZhXQULVWiDrufSlU/LEEGpic0P0eudvW1i0/Wq1GXEEhu4/aQBAclA/hSd6vNM7K86qiwjb1B7gt/CbWpZUzYlfSta41MMrI7rahzoyeaoGgnSAZJ42MiidQ2KnfdDMcJoD9aiuuNxeDSnNvi6QlOo8IU5xruq7+IXSaAvrnlwa0q79+77Yl3FOtoMJ87g6g9Yo97y/rM88qAZiBJNvaJWVxAf50Kz/A2gzFFD8J7ii6yYTBXtz9EizusLU1LzFLxB3J6pd+EYUeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(396003)(366004)(39860400002)(376002)(136003)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799009)(186009)(451199024)(33716001)(41300700001)(44832011)(4326008)(30864003)(8676002)(8936002)(2906002)(5660300002)(82960400001)(86362001)(6666004)(26005)(6486002)(478600001)(966005)(6506007)(6512007)(83380400001)(38100700002)(9686003)(54906003)(66574015)(66946007)(66556008)(6916009)(316002)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?klskLXMMu9nYHbx5X4a23Dpvfes5hVv3ssvhpHCfqm2XUzO5T6dHI/o8Ay?=
 =?iso-8859-1?Q?RYZmYxzPre5ofm//54Mu5V3nT/TX1Z0cdgIkzOzJli0O7Fkq0KbJ5qD1CF?=
 =?iso-8859-1?Q?HIHKB1wqOvVIV5OvNnGoN1cUgS/obalcw1DSp51vgShnrCfZ3feUt31i4Z?=
 =?iso-8859-1?Q?oiZdJv8lyekwUuC5P6k7Qx80Q2tvA95d64h8s5NKfWTKNhelw3NR54C4PD?=
 =?iso-8859-1?Q?Wt7SUCkGEceRceAtqyqOBzHBVAJ/4POWHJR5fs5oUEjswrReEe4ime8r8X?=
 =?iso-8859-1?Q?c9LxKZBWbQqTJlsxsbkF9t1CsiGBZFzwCmjTl5DRYjjYOe9lyBoDmiZvvv?=
 =?iso-8859-1?Q?462Ta0SjDmil+GMipg9i85NEENGjF2TRzSJMG24aR2x3VJKfMI3m5k6DjV?=
 =?iso-8859-1?Q?AhIsnXO4LJPkL9utmJZ5cEcO1dCnfQENeev0uhnLTrDdmboyjrC/2qkIeb?=
 =?iso-8859-1?Q?XQS9TnQ3Paacku/MjChYhIvBukqV2I8+LlU9oIm+bTLm5Lt35h88kQ8et8?=
 =?iso-8859-1?Q?2OnUs/2XLl5s+w92eTj/xEldROwoaJtkVMhCrJWeSm/r6zatxnzUWbtJvl?=
 =?iso-8859-1?Q?GyBJuUdPsy8Rtt/ZkGAM8tNWeAXx5w7Gjbo7eGt2O6tzI24FcjiSaD6nbH?=
 =?iso-8859-1?Q?eSn6T9gOaf49gYFFaHj0+Arkj54oAmkDHi2CARC7KO4j0vBniaip8r9yHt?=
 =?iso-8859-1?Q?DVAeALFAfnmD8oGeS+BN+CXPy3lGBWbwsp5OKt0tuqN9Cfi99QE5A3vpXa?=
 =?iso-8859-1?Q?ArcIYzWzwzEAVy/O+Vli+T1D9oQX6IfBscEe5l2zhtv8NqQ+AAn5R9ADYE?=
 =?iso-8859-1?Q?JaWB9LKqe19mmTNNAoV4RkhjJXE4/kN3V5XdCoPz4Am31+J8lNLNygzUZd?=
 =?iso-8859-1?Q?upZcDTXE3w5tNxvsqC/MfTfyYGbxsTRhnXAnETZmVpdQ0FRqcsQnq+7fgy?=
 =?iso-8859-1?Q?JZA/+flM/yJY0DOxQqZn21CJLEgEURCfQwgZ+a5NWAY4cCwAnH6/8rFU21?=
 =?iso-8859-1?Q?DayKy0m29aB1J6fqGLDN6m8m6IfzIxX1pcJBJRMVGPLQUKAvGaYSTNmXro?=
 =?iso-8859-1?Q?yh4yhR45YtqOvkb3YGO9LyLTkWgYWJ8oErW+f/P4MqOA5nNgqfKHbrfFT5?=
 =?iso-8859-1?Q?k+qcJLb7WZI9f2iHCwXoGtP0CKoz2GV1TwfBi/mNZzJN1GPIhMloNSsCu2?=
 =?iso-8859-1?Q?EEgylqLkO+OlI0Hb3o6qcgbk6I96L/tmxSbNXEBcqSctVhxj4x4/MLVEcC?=
 =?iso-8859-1?Q?9APH4GzMwqNSMX3dThxn2iUB+TihnlkplACMrmXn08eDhKksRro6mlvgia?=
 =?iso-8859-1?Q?cOpuk/62Nn5V/y9Vg5MY0GKdXrHLucgZCgYNy2mQhc9JU0v3WKDPANQPa2?=
 =?iso-8859-1?Q?kl+GWaB14WUX/QwCRpyXsGScRnVqgjQtLeyYrTjKnJEDOewqBOlKxMa/rs?=
 =?iso-8859-1?Q?YawJAIDK1pEDOyrseamtvciZiO4v+5BY4OOJeluaKP6bpz3J/tews8VuLR?=
 =?iso-8859-1?Q?YDNbJZbHpV2UHG3laUKk4/2egwGiuaG7ynsSjm7iCX94e/+eQqTa+s85Jx?=
 =?iso-8859-1?Q?ETTB2PQR2jxZ7+bvVQIXc0reGZqFAXpIYTu5K0znqkREKuMOAXfFsE71xz?=
 =?iso-8859-1?Q?j0WRezUB9mUj6BOZja6fWcQAU6g+9ro658?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 381e0a3f-9ee3-414d-12f1-08dbe258433e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2023 01:48:11.8142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wvRkpWIyqmf4pqdympIQQhKTSe49Qo7JshbOPLfEJnDAzZ7xoX0r2qu6S0PoL8KtDu5R04Zp+F74yI2SLbyxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6229
X-OriginatorOrg: intel.com

On Fri, Nov 10, 2023 at 08:20:58PM +0100, Boris Brezillon wrote:
> On Fri, 10 Nov 2023 18:21:05 +0100
> Heiko Stübner <heiko@sntech.de> wrote:
> 
> > Hi kernel-test-robot,
> > 
> > please don't build-test my github kernel repository.
> > 
> > I've never enabled anything for this, so I don't even know how it made it
> > in some build-test-list.

Sorry about this Heiko, the bot scans the possible linux repo and add to coverage
to do shift left testing for developers, thus this is added. We will skip the testing
of this repo.

One thing to consult that the robot also supports private report to only
send mail to repo owner (and only cc oe-kbuild-all@lists.linux.dev for
archive purpose). Do you like to enable this and continue the build test
coverage of your repo?

Thanks

> > 
> > This is really only my dumping ground for work-in-progress or test code.
> > Case in point, I just wanted to play around with the panthor patches, not
> > cause email messages for Boris.
> 
> No worries. Actually, that's good to know I have a few more things to
> fix (probably a weird combination of options being enabled/disabled
> leading to unused functions/variables).
> 
> Not trying to say kernel-test-bot should scan your tree, but those
> information are useful to me ;-).
> 
> Regards,
> 
> Boris
> 
> > 
> > 
> > Thanks a lot
> > Heiko
> > 
> > Am Freitag, 10. November 2023, 18:04:14 CET schrieb kernel test robot:
> > > Hi Boris,
> > > 
> > > First bad commit (maybe != root cause):
> > > 
> > > tree:   https://github.com/mmind/linux-rockchip dev/panthor
> > > head:   ef8d76d568fba69012333ce6e9d7cce4aebbb2da
> > > commit: 86d43fb902f5db2a81e432041864dd7523314c70 [36/41] drm/panthor: Allow driver compilation
> > > config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231111/202311110058.uP4Vh1gN-lkp@intel.com/config)
> > > compiler: sparc64-linux-gcc (GCC) 13.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110058.uP4Vh1gN-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202311110058.uP4Vh1gN-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > >   
> > > >> drivers/gpu/drm/panthor/panthor_drv.c:1326:6: warning: no previous prototype for 'panthor_debugfs_init' [-Wmissing-prototypes]  
> > >     1326 | void panthor_debugfs_init(struct drm_minor *minor)
> > >          |      ^~~~~~~~~~~~~~~~~~~~
> > > --
> > >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'cs_slot_process_fatal_event_locked':  
> > > >> drivers/gpu/drm/panthor/panthor_sched.c:1233:37: warning: variable 'csg_iface' set but not used [-Wunused-but-set-variable]  
> > >     1233 |         struct panthor_fw_cs_iface *csg_iface;
> > >          |                                     ^~~~~~~~~
> > >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'cs_slot_process_tiler_oom_event_locked':  
> > > >> drivers/gpu/drm/panthor/panthor_sched.c:1321:13: warning: variable 'info' set but not used [-Wunused-but-set-variable]  
> > >     1321 |         u64 info, heap_address, new_chunk_va;
> > >          |             ^~~~  
> > > >> drivers/gpu/drm/panthor/panthor_sched.c:1319:13: warning: variable 'fault' set but not used [-Wunused-but-set-variable]  
> > >     1319 |         u32 fault, vt_start, vt_end, frag_end;
> > >          |             ^~~~~  
> > > >> drivers/gpu/drm/panthor/panthor_sched.c:1318:31: warning: variable 'queue' set but not used [-Wunused-but-set-variable]  
> > >     1318 |         struct panthor_queue *queue;
> > >          |                               ^~~~~
> > >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'tick_ctx_apply':
> > >    drivers/gpu/drm/panthor/panthor_sched.c:1983:54: warning: variable 'csg_iface' set but not used [-Wunused-but-set-variable]
> > >     1983 |                         struct panthor_fw_csg_iface *csg_iface;
> > >          |                                                      ^~~~~~~~~
> > >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'panthor_sched_suspend':  
> > > >> drivers/gpu/drm/panthor/panthor_sched.c:2481:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]  
> > >     2481 |         int ret;
> > >          |             ^~~
> > >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'group_create_queue':
> > >    drivers/gpu/drm/panthor/panthor_sched.c:2927:53: error: 'DRM_SCHED_POLICY_SINGLE_ENTITY' undeclared (first use in this function)
> > >     2927 |                              NULL, "panthor-queue", DRM_SCHED_POLICY_SINGLE_ENTITY,
> > >          |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >    drivers/gpu/drm/panthor/panthor_sched.c:2927:53: note: each undeclared identifier is reported only once for each function it appears in
> > >    drivers/gpu/drm/panthor/panthor_sched.c:2926:49: warning: passing argument 7 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
> > >     2926 |                              group->ptdev->reset.wq,
> > >          |                              ~~~~~~~~~~~~~~~~~~~^~~
> > >          |                                                 |
> > >          |                                                 struct workqueue_struct *
> > >    In file included from drivers/gpu/drm/panthor/panthor_sched.c:9:
> > >    include/drm/gpu_scheduler.h:533:25: note: expected 'long int' but argument is of type 'struct workqueue_struct *'
> > >      533 |                    long timeout, struct workqueue_struct *timeout_wq,
> > >          |                    ~~~~~^~~~~~~
> > >    drivers/gpu/drm/panthor/panthor_sched.c:2927:36: error: passing argument 9 of 'drm_sched_init' from incompatible pointer type [-Werror=incompatible-pointer-types]
> > >     2927 |                              NULL, "panthor-queue", DRM_SCHED_POLICY_SINGLE_ENTITY,
> > >          |                                    ^~~~~~~~~~~~~~~
> > >          |                                    |
> > >          |                                    char *
> > >    include/drm/gpu_scheduler.h:534:30: note: expected 'atomic_t *' but argument is of type 'char *'
> > >      534 |                    atomic_t *score, const char *name, struct device *dev);
> > >          |                    ~~~~~~~~~~^~~~~
> > >    cc1: some warnings being treated as errors
> > > --  
> > > >> drivers/gpu/drm/panthor/panthor_devfreq.c:43: warning: Function parameter or member 'lock' not described in 'panthor_devfreq'  
> > > --  
> > > >> drivers/gpu/drm/panthor/panthor_gem.c:167: warning: Function parameter or member 'ddev' not described in 'panthor_gem_create_object'
> > > >> drivers/gpu/drm/panthor/panthor_gem.c:167: warning: Excess function parameter 'dev' description in 'panthor_gem_create_object'  
> > > --  
> > > >> drivers/gpu/drm/panthor/panthor_heap.c:339: warning: Function parameter or member 'new_chunk_gpu_va' not described in 'panthor_heap_grow'  
> > > --  
> > > >> drivers/gpu/drm/panthor/panthor_gpu.c:52: warning: Function parameter or member 'product_major' not described in 'panthor_model'
> > > >> drivers/gpu/drm/panthor/panthor_gpu.c:64: warning: Function parameter or member '_name' not described in 'GPU_MODEL'
> > > >> drivers/gpu/drm/panthor/panthor_gpu.c:64: warning: Function parameter or member '_arch_major' not described in 'GPU_MODEL'
> > > >> drivers/gpu/drm/panthor/panthor_gpu.c:64: warning: Function parameter or member '_product_major' not described in 'GPU_MODEL'
> > > >> drivers/gpu/drm/panthor/panthor_gpu.c:168: warning: Function parameter or member 'ptdev' not described in 'panthor_gpu_unplug'
> > > >> drivers/gpu/drm/panthor/panthor_gpu.c:234: warning: Function parameter or member 'timeout_us' not described in 'panthor_gpu_block_power_off'
> > > >> drivers/gpu/drm/panthor/panthor_gpu.c:234: warning: Excess function parameter 'timeout_ms' description in 'panthor_gpu_block_power_off'
> > > >> drivers/gpu/drm/panthor/panthor_gpu.c:294: warning: Function parameter or member 'rdy_reg' not described in 'panthor_gpu_block_power_on'
> > > >> drivers/gpu/drm/panthor/panthor_gpu.c:294: warning: Function parameter or member 'timeout_us' not described in 'panthor_gpu_block_power_on'
> > > >> drivers/gpu/drm/panthor/panthor_gpu.c:294: warning: Excess function parameter 'timeout_ms' description in 'panthor_gpu_block_power_on'
> > > >> drivers/gpu/drm/panthor/panthor_gpu.c:472: warning: Function parameter or member 'ptdev' not described in 'panthor_gpu_resume'  
> > > --  
> > > >> drivers/gpu/drm/panthor/panthor_drv.c:84: warning: Function parameter or member 'obj_size' not described in 'panthor_get_uobj_array'
> > > >> drivers/gpu/drm/panthor/panthor_drv.c:84: warning: Excess function parameter 'obj_kernel' description in 'panthor_get_uobj_array'
> > > >> drivers/gpu/drm/panthor/panthor_drv.c:268: warning: Function parameter or member 'syncops' not described in 'panthor_job_ctx'
> > > >> drivers/gpu/drm/panthor/panthor_drv.c:732: warning: Function parameter or member 'job_put' not described in 'panthor_submit_ctx_cleanup'
> > > >> drivers/gpu/drm/panthor/panthor_drv.c:1406: warning: Cannot understand  * @cleanup_wq: Workqueue used to cleanup stuff.  
> > >     on line 1406 - I thought it was a doc line
> > > --  
> > > >> drivers/gpu/drm/panthor/panthor_fw.c:293: warning: expecting prototype for panthor_fw_get_glb_iface(). Prototype was for panthor_fw_get_csg_iface() instead
> > > >> drivers/gpu/drm/panthor/panthor_fw.c:310: warning: expecting prototype for panthor_fw_get_glb_iface(). Prototype was for panthor_fw_get_cs_iface() instead
> > > >> drivers/gpu/drm/panthor/panthor_fw.c:438: warning: Function parameter or member 'input_fw_va' not described in 'panthor_fw_alloc_queue_iface_mem'
> > > >> drivers/gpu/drm/panthor/panthor_fw.c:438: warning: Function parameter or member 'output_fw_va' not described in 'panthor_fw_alloc_queue_iface_mem'
> > > >> drivers/gpu/drm/panthor/panthor_fw.c:1190: warning: Function parameter or member 'csg_slot' not described in 'panthor_fw_csg_wait_acks'
> > > >> drivers/gpu/drm/panthor/panthor_fw.c:1190: warning: expecting prototype for panthor_fw_glb_wait_acks(). Prototype was for panthor_fw_csg_wait_acks() instead  
> > > 
> > > 
> > > vim +/panthor_debugfs_init +1326 drivers/gpu/drm/panthor/panthor_drv.c
> > > 
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1324  
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1325  #ifdef CONFIG_DEBUG_FS
> > > 560b6916e77920 Boris Brezillon 2023-08-09 @1326  void panthor_debugfs_init(struct drm_minor *minor)
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1327  {
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1328  	panthor_mmu_debugfs_init(minor);
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1329  }
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1330  #endif
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1331  
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1332  /*
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1333   * PanCSF driver version:
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1334   * - 1.0 - initial interface
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1335   */
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1336  static const struct drm_driver panthor_drm_driver = {
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1337  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1338  			   DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1339  	.open = panthor_open,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1340  	.postclose = panthor_postclose,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1341  	.ioctls = panthor_drm_driver_ioctls,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1342  	.num_ioctls = ARRAY_SIZE(panthor_drm_driver_ioctls),
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1343  	.fops = &panthor_drm_driver_fops,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1344  	.name = "panthor",
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1345  	.desc = "Panthor DRM driver",
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1346  	.date = "20230801",
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1347  	.major = 1,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1348  	.minor = 0,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1349  
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1350  	.gem_create_object = panthor_gem_create_object,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1351  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1352  #ifdef CONFIG_DEBUG_FS
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1353  	.debugfs_init = panthor_debugfs_init,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1354  #endif
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1355  };
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1356  
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1357  static int panthor_probe(struct platform_device *pdev)
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1358  {
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1359  	struct panthor_device *ptdev;
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1360  	int ret;
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1361  
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1362  	ptdev = devm_drm_dev_alloc(&pdev->dev, &panthor_drm_driver,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1363  				   struct panthor_device, base);
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1364  	if (!ptdev)
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1365  		return -ENOMEM;
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1366  
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1367  	platform_set_drvdata(pdev, ptdev);
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1368  
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1369  	ret = panthor_device_init(ptdev);
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1370  	if (ret)
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1371  		return ret;
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1372  
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1373  	return drm_dev_register(&ptdev->base, 0);
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1374  }
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1375  
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1376  static void panthor_remove(struct platform_device *pdev)
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1377  {
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1378  	struct panthor_device *ptdev = platform_get_drvdata(pdev);
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1379  
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1380  	panthor_device_unplug(ptdev);
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1381  }
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1382  
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1383  static const struct of_device_id dt_match[] = {
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1384  	{ .compatible = "rockchip,rk3588-mali" },
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1385  	{ .compatible = "arm,mali-valhall-csf" },
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1386  	{}
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1387  };
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1388  MODULE_DEVICE_TABLE(of, dt_match);
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1389  
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1390  static DEFINE_RUNTIME_DEV_PM_OPS(panthor_pm_ops,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1391  				 panthor_device_suspend,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1392  				 panthor_device_resume,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1393  				 NULL);
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1394  
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1395  static struct platform_driver panthor_driver = {
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1396  	.probe = panthor_probe,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1397  	.remove_new = panthor_remove,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1398  	.driver = {
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1399  		.name = "panthor",
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1400  		.pm = &panthor_pm_ops,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1401  		.of_match_table = dt_match,
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1402  	},
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1403  };
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1404  
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1405  /**
> > > 560b6916e77920 Boris Brezillon 2023-08-09 @1406   * @cleanup_wq: Workqueue used to cleanup stuff.
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1407   *
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1408   * We create a dedicated workqueue so we can drain on unplug and
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1409   * make sure all resources are freed before the module is unloaded.
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1410   */
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1411  struct workqueue_struct *panthor_cleanup_wq;
> > > 560b6916e77920 Boris Brezillon 2023-08-09  1412  
> > > 
> > > :::::: The code at line 1326 was first introduced by commit
> > > :::::: 560b6916e779201356a8db10cec8dc5183d9fe5f drm/panthor: Add the driver frontend block
> > > 
> > > :::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
> > > :::::: CC: Heiko Stuebner <heiko@sntech.de>
> > > 
> > >   
> > 
> > 
> > 
> > 
> 
> 
