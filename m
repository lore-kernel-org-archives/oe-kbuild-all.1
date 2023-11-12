Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E9323BD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 06:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eg9q6vpk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699771384; x=1731307384;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Hc6srEGhPzqCeiXVpDxC7Me1BkfH8RdwhIjw7Y3y8wY=;
  b=eg9q6vpkdi3QOan/du0rTOiqrBrMGFKkFBgtgroatUcmO9HhTid9oVPI
   7LIQCrawBKqWp+quhAIaOzT/SverzM29lVkmdMUQpbJyx8StKkTrkWZHz
   PZiGOTRaNmdKL7ssFKi+L9MbphSsFCZIBrX9YgbIJNta3wtwmZJWq85wX
   hAyI82ri7RCZLE/8Ao9ahN9zr1fZeUgPnrGgJVrBsRs794E9hgAwCtye8
   CFzAScJtsQko8xpXOo2Za8M5/xQXWm/syB79rdOTuBGl/nKQrVXN4i9AU
   0U/DxrPHiX9TE96lzfnFtlT1cEQ58TP6DeqLjvu1sLEkAcVvO8rjTnRDR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="394215747"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="394215747"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 22:43:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="854700350"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="854700350"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Nov 2023 22:43:03 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sat, 11 Nov 2023 22:43:02 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sat, 11 Nov 2023 22:43:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sat, 11 Nov 2023 22:43:02 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sat, 11 Nov 2023 22:43:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acdFtXxAozRw6JlOmo4dJ2arpfI0Gxq5dNPW+AiJhzbk+nwWMXwivWMOQNKTDqLqrjNMTWE1aCj9f61WZ64G7j4aCfIy3f3Ql29qMS4pwtYY3yIqdk5MnuTfdhOtfMYE6OhMsboqVxeqPyh5P/rVUQBevAsR8fphecOdBcphQaPgTzwq9+8w6/gkK9Uu9Qi+JwJv5bzuak9ObFr96pd7pwVEtpgtgQ9UAj7mtUSvN8AQSVQYpKVSKHF9KOFR8B9p2Y7ZsN9TUiTlv/haG3YYWoUBZROD78e5N0j19IcpPrn4Lm2mXH3bHKK3C+G7gIG5kG9U9K69kZtdIF74QwzcbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/YOFxQtyas0KL/YJg45CVQj4pzDZono+ZjzsrBdNn4=;
 b=VAoEYeEWerwQgNhtzTApO1/TnawNUEYNQ/JeFaJyz2EU5VWteLTHzpTbfEEH9Bd/OGY/HSrpMrTeST+2JWRbaBnjRByBqoCQaU6SiRARGagIF0Rar4CudlVR4g5cwt25Qsh6QznJVZ4K0zXdxMZ4rJA0QQDYtMglUDeYJh/k+8iuZD2qylnHW4UH9ABaktCDyepCpwlwDdWVk9sAVhZpcS9/83jKsUYzNTtmSWyKPouYtiMRB09uHi4FV4sJD540Ks43p9hyPoHkyzHPvzkHx9qwO6Y5muKl1BZdW7EDDJVne3M07EsUEE1Gvj+cmR/IwJj04PWgPQcVVwuIYfW+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by LV8PR11MB8486.namprd11.prod.outlook.com (2603:10b6:408:1e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Sun, 12 Nov
 2023 06:42:59 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::2f1a:e62e:9fff:ae67]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::2f1a:e62e:9fff:ae67%5]) with mapi id 15.20.6977.028; Sun, 12 Nov 2023
 06:42:59 +0000
Date: Sun, 12 Nov 2023 14:42:31 +0800
From: Philip Li <philip.li@intel.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
CC: Boris Brezillon <boris.brezillon@collabora.com>, kernel test robot
	<lkp@intel.com>, Boris Brezillon <bbrezillon@kernel.org>,
	<oe-kbuild-all@lists.linux.dev>, Steven Price <steven.price@arm.com>
Subject: Re: [mmind-rockchip:dev/panthor 36/41]
 drivers/gpu/drm/panthor/panthor_drv.c:1326:6: warning: no previous prototype
 for 'panthor_debugfs_init'
Message-ID: <ZVBz114xPbTE6KuY@rli9-mobl>
References: <202311110058.uP4Vh1gN-lkp@intel.com>
 <20231110202058.1c05283a@collabora.com>
 <ZU7dU5TPM3N7Ur4Z@rli9-mobl>
 <4217073.OBFZWjSADL@diego>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4217073.OBFZWjSADL@diego>
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|LV8PR11MB8486:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d91e47-d6b8-4247-5c84-08dbe34a9be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dkqSjHvpy6l1ceBQ7U63TtZawKvQaHt6VvopH8LyB4rX+uW1/FCfgsXrNhFFeuku8QQXuhwkG+KrO/dhlmoH44vFCgVULH988a6TtNTnBtFRWUuM+sSPM8FugRV+8rEqtDEFjFZevrvgN8YLItZgvK8d5kc01qWn61mkXqqxDtTNLTYMJh/+jXfF8yrRXuaX8jt5Ifqnxr9pBsTIqg5vDLGZd6svwSTkofQQtVPe7LRKIWZwbVtsKVWqjFaUkGvYKFbSS9wHHt0aQxq+7ElEMNLaNTtWTiuCN0H/NtKlZbiGRMvqvxPUlFEuxcJ6WvnXI0OXYJCQWpHLKfDsW4Q3xxHt+4BhiP/1L3hDWP+Z3DI4CNn8kciMsaYfcbkgrIy3AHRGmyi8lvBs4MPeMDS3McWv/BO00n9ZEfgq79/5nU4ikSvgwe0/vegVfgVMAZBf5ex0DySlcNRUDJWc0oCysIYu//WPoBVrQGrZaBRG5qOddb1lD9jkUb881nl6F5GunfSI2fIymFyta1ZbJht6lXVSWrkpn6WO/Q10Ds+lIPAWTHIDyOI94VNMOd+2qvbqL8L+aiKoAT1Lp6xfSIuRz8SMN0v3QRGvbCvl81dPKsSQSQgm25/B/9raPWWp/O/KTXz1hzJU7Y6P2u9vilXcow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(376002)(396003)(136003)(39860400002)(366004)(230922051799003)(230173577357003)(230273577357003)(186009)(1800799009)(451199024)(64100799003)(66476007)(66556008)(6666004)(6486002)(6512007)(6506007)(9686003)(966005)(2906002)(478600001)(38100700002)(66946007)(83380400001)(41300700001)(86362001)(82960400001)(8936002)(33716001)(66574015)(8676002)(6916009)(5660300002)(54906003)(26005)(30864003)(44832011)(4326008)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VdKIHIlTegqZcA/6wqdm8tCybXgbhZiEPJuv+R/bFA2EAoOBNTBzHlHizj?=
 =?iso-8859-1?Q?Z89fJKHGzo92MMrzYd5t3AvpPz5p9Ew75/PtMMs5SCJ0jvSkE9W+ZJe9aj?=
 =?iso-8859-1?Q?kxku8K+oNZUh8W18OF++WLng35Ub1qPUs9OoU5ivSCIVtTTBzYmHHOMZh3?=
 =?iso-8859-1?Q?u2sH6y+mobXlE1XP5dYB07yBcq2bGw++VXySV8nGFYWlNFLrvV2dxNRK1G?=
 =?iso-8859-1?Q?nZPTBs5Ctn45qvLdMSTlaZvfb91zpial2yc7aTb+L4OSvnff1HIk7Ao4YB?=
 =?iso-8859-1?Q?6qUTYze0dJGhDGDMPYKp/vd4peWVba16WAXG7f1KPYcjfBSJZEeLHMdGBm?=
 =?iso-8859-1?Q?M5kNLiEngEz3+dkMQmZDdfkAuZvXCI7QA4Au2tJgz2tNymRxyy3fAqyNmF?=
 =?iso-8859-1?Q?/hBdvxVoYAq/x09X330JhNg+W48ZEnahTosRaBRxyOs1vJW2+3QydJO4sB?=
 =?iso-8859-1?Q?190kH4jMWcx0rZ/6mPeVXIpJbKev4kx8xCCMktJh5tVAAnJFvp37ZdmDDP?=
 =?iso-8859-1?Q?dTDJlcESpMYOgOdZg5K8XeIl8vE4cMh/72HxHunrqJHqM4cg9yqD3rXdLV?=
 =?iso-8859-1?Q?EFEqgjFa3lGfCpdZqdkYe1Wa36Al+Fk7LxB1GcvKW3eHWhQpgYMrP/0zl8?=
 =?iso-8859-1?Q?EF0Ou7KcfpQZU6aBNiPKMG3p24WYJEcUpyJ+30WjqJYEWntcUqST6Ti6qI?=
 =?iso-8859-1?Q?aLDqzzCwdqcDAHYfnZgR8bnhwY4IFo4vV/5p4N8NzGH7xoCyWaxxu1CNgP?=
 =?iso-8859-1?Q?FgG1Kwbpjf/rl/XYnVWIZgmQzFXazzOBc5CnDeJSAxqK4UfhpWDlVGTD/4?=
 =?iso-8859-1?Q?5wxh8JbJqvx6kBFHQYgoYUunZImUk4fBpz7Mf1m27anmpYRwsW/ZWf3Q1C?=
 =?iso-8859-1?Q?3gXjjfMtPWOkcrYP+EPCeEEsTiLyBT7i5mv40WVWrAD1GdUrAHlkxeZ5hm?=
 =?iso-8859-1?Q?rm6X8atNnkWiI9hExcTQxssVZAaHY2l28jjAjYxrqSjf8W/gUJr8O0xwXu?=
 =?iso-8859-1?Q?1gHR9Fnn4Ew36Tfcx9knUpmE210kHeTxm4IhsQl/yPMIF02Hc2MpQSCNSk?=
 =?iso-8859-1?Q?AWb3x1CbaocEfbOyDxZ4BdK5+ku4Bfqwm5qkN2qr4EWsP9nqqB+zFxAjgi?=
 =?iso-8859-1?Q?ULSP/5eoF2m2mINr0AULGrxg4P2gPkEXu3Zg5HG2ktxgXpcoy3RafuQ0w/?=
 =?iso-8859-1?Q?K/nqXhrBD7lTov/7K2WKEqX2XUkfBGD4b2bj+SzV+AsziohsFavLijsazX?=
 =?iso-8859-1?Q?funxEBXH5sC6mUOFqit4trtiTLtvIt16konibi9BkFnpL0+y4H9v8fI786?=
 =?iso-8859-1?Q?Cwqc9hfd1pvBk6AjIJFDMThJ48s0I/cbICDyXeBdhFWsCOg6oBwqBIqHbp?=
 =?iso-8859-1?Q?bewtc1JPpOPeRtUHQgRRoy4K0fVykY42C5ZFmbyUkOkCCmM1Lr1kDzaUx3?=
 =?iso-8859-1?Q?plxRt2CB5eWzdFF8/+wp/3oGAjKr5X5xV/Bc+JlXaaI/ORlWWNtGJ9IBYp?=
 =?iso-8859-1?Q?Mg6tnD8rpAv9wfgCt8dQUgwJ0nzadbWP2Tns97M88ZYwywKtMRzwBJgRzx?=
 =?iso-8859-1?Q?59asdRib7oze533SO2HiDa80xbVXf9WmTdAdgeyVgTczxurJXoc9EX+u+Q?=
 =?iso-8859-1?Q?D7nfTVRMcsUz82rt4ZE7IzWbDelzk3Bf4Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d91e47-d6b8-4247-5c84-08dbe34a9be7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2023 06:42:58.9883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3B0vG0FDax4oyP35hoCv/5YS7oIQL9vb6PYxyb6Lum0sK0JZOy4Cm72LeUY4i270ajmEQ3lLE/kKybnnpjr7nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8486
X-OriginatorOrg: intel.com

On Sat, Nov 11, 2023 at 01:17:08PM +0100, Heiko Stübner wrote:
> Hi Philip Li,
> 
> Am Samstag, 11. November 2023, 02:48:03 CET schrieb Philip Li:
> > On Fri, Nov 10, 2023 at 08:20:58PM +0100, Boris Brezillon wrote:
> > > On Fri, 10 Nov 2023 18:21:05 +0100
> > > Heiko Stübner <heiko@sntech.de> wrote:
> > > 
> > > > Hi kernel-test-robot,
> > > > 
> > > > please don't build-test my github kernel repository.
> > > > 
> > > > I've never enabled anything for this, so I don't even know how it made it
> > > > in some build-test-list.
> > 
> > Sorry about this Heiko, the bot scans the possible linux repo and add to coverage
> > to do shift left testing for developers, thus this is added. We will skip the testing
> > of this repo.
> 
> thanks a lot for changing this.
> 
> All my meaningful work lands on my git.kernel.org repo, so the testing
> you're doing there is very much appreciated.

Got it. Sorry I missed that there's another repo from kernel org already.

> 
> 
> It is different for my github stuff where I really only post stuff I'm working
> on and want to show to someone for reference - or similar cases.
> 
> So code quality will never be as high and code will change anyway
> and going by the fact that your testing still will cost time and energy
> to some compile-farm, I just think other repositories are way more
> deserving of that energy ;-) .

Thanks for info, i have removed this github repo from the bot configuration.

> 
> 
> Thanks
> Heiko
> 
> > One thing to consult that the robot also supports private report to only
> > send mail to repo owner (and only cc oe-kbuild-all@lists.linux.dev for
> > archive purpose). Do you like to enable this and continue the build test
> > coverage of your repo?
> > 
> > Thanks
> > 
> > > > 
> > > > This is really only my dumping ground for work-in-progress or test code.
> > > > Case in point, I just wanted to play around with the panthor patches, not
> > > > cause email messages for Boris.
> > > 
> > > No worries. Actually, that's good to know I have a few more things to
> > > fix (probably a weird combination of options being enabled/disabled
> > > leading to unused functions/variables).
> > > 
> > > Not trying to say kernel-test-bot should scan your tree, but those
> > > information are useful to me ;-).
> > > 
> > > Regards,
> > > 
> > > Boris
> > > 
> > > > 
> > > > 
> > > > Thanks a lot
> > > > Heiko
> > > > 
> > > > Am Freitag, 10. November 2023, 18:04:14 CET schrieb kernel test robot:
> > > > > Hi Boris,
> > > > > 
> > > > > First bad commit (maybe != root cause):
> > > > > 
> > > > > tree:   https://github.com/mmind/linux-rockchip dev/panthor
> > > > > head:   ef8d76d568fba69012333ce6e9d7cce4aebbb2da
> > > > > commit: 86d43fb902f5db2a81e432041864dd7523314c70 [36/41] drm/panthor: Allow driver compilation
> > > > > config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231111/202311110058.uP4Vh1gN-lkp@intel.com/config)
> > > > > compiler: sparc64-linux-gcc (GCC) 13.2.0
> > > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110058.uP4Vh1gN-lkp@intel.com/reproduce)
> > > > > 
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202311110058.uP4Vh1gN-lkp@intel.com/
> > > > > 
> > > > > All warnings (new ones prefixed by >>):
> > > > >   
> > > > > >> drivers/gpu/drm/panthor/panthor_drv.c:1326:6: warning: no previous prototype for 'panthor_debugfs_init' [-Wmissing-prototypes]  
> > > > >     1326 | void panthor_debugfs_init(struct drm_minor *minor)
> > > > >          |      ^~~~~~~~~~~~~~~~~~~~
> > > > > --
> > > > >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'cs_slot_process_fatal_event_locked':  
> > > > > >> drivers/gpu/drm/panthor/panthor_sched.c:1233:37: warning: variable 'csg_iface' set but not used [-Wunused-but-set-variable]  
> > > > >     1233 |         struct panthor_fw_cs_iface *csg_iface;
> > > > >          |                                     ^~~~~~~~~
> > > > >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'cs_slot_process_tiler_oom_event_locked':  
> > > > > >> drivers/gpu/drm/panthor/panthor_sched.c:1321:13: warning: variable 'info' set but not used [-Wunused-but-set-variable]  
> > > > >     1321 |         u64 info, heap_address, new_chunk_va;
> > > > >          |             ^~~~  
> > > > > >> drivers/gpu/drm/panthor/panthor_sched.c:1319:13: warning: variable 'fault' set but not used [-Wunused-but-set-variable]  
> > > > >     1319 |         u32 fault, vt_start, vt_end, frag_end;
> > > > >          |             ^~~~~  
> > > > > >> drivers/gpu/drm/panthor/panthor_sched.c:1318:31: warning: variable 'queue' set but not used [-Wunused-but-set-variable]  
> > > > >     1318 |         struct panthor_queue *queue;
> > > > >          |                               ^~~~~
> > > > >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'tick_ctx_apply':
> > > > >    drivers/gpu/drm/panthor/panthor_sched.c:1983:54: warning: variable 'csg_iface' set but not used [-Wunused-but-set-variable]
> > > > >     1983 |                         struct panthor_fw_csg_iface *csg_iface;
> > > > >          |                                                      ^~~~~~~~~
> > > > >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'panthor_sched_suspend':  
> > > > > >> drivers/gpu/drm/panthor/panthor_sched.c:2481:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]  
> > > > >     2481 |         int ret;
> > > > >          |             ^~~
> > > > >    drivers/gpu/drm/panthor/panthor_sched.c: In function 'group_create_queue':
> > > > >    drivers/gpu/drm/panthor/panthor_sched.c:2927:53: error: 'DRM_SCHED_POLICY_SINGLE_ENTITY' undeclared (first use in this function)
> > > > >     2927 |                              NULL, "panthor-queue", DRM_SCHED_POLICY_SINGLE_ENTITY,
> > > > >          |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > >    drivers/gpu/drm/panthor/panthor_sched.c:2927:53: note: each undeclared identifier is reported only once for each function it appears in
> > > > >    drivers/gpu/drm/panthor/panthor_sched.c:2926:49: warning: passing argument 7 of 'drm_sched_init' makes integer from pointer without a cast [-Wint-conversion]
> > > > >     2926 |                              group->ptdev->reset.wq,
> > > > >          |                              ~~~~~~~~~~~~~~~~~~~^~~
> > > > >          |                                                 |
> > > > >          |                                                 struct workqueue_struct *
> > > > >    In file included from drivers/gpu/drm/panthor/panthor_sched.c:9:
> > > > >    include/drm/gpu_scheduler.h:533:25: note: expected 'long int' but argument is of type 'struct workqueue_struct *'
> > > > >      533 |                    long timeout, struct workqueue_struct *timeout_wq,
> > > > >          |                    ~~~~~^~~~~~~
> > > > >    drivers/gpu/drm/panthor/panthor_sched.c:2927:36: error: passing argument 9 of 'drm_sched_init' from incompatible pointer type [-Werror=incompatible-pointer-types]
> > > > >     2927 |                              NULL, "panthor-queue", DRM_SCHED_POLICY_SINGLE_ENTITY,
> > > > >          |                                    ^~~~~~~~~~~~~~~
> > > > >          |                                    |
> > > > >          |                                    char *
> > > > >    include/drm/gpu_scheduler.h:534:30: note: expected 'atomic_t *' but argument is of type 'char *'
> > > > >      534 |                    atomic_t *score, const char *name, struct device *dev);
> > > > >          |                    ~~~~~~~~~~^~~~~
> > > > >    cc1: some warnings being treated as errors
> > > > > --  
> > > > > >> drivers/gpu/drm/panthor/panthor_devfreq.c:43: warning: Function parameter or member 'lock' not described in 'panthor_devfreq'  
> > > > > --  
> > > > > >> drivers/gpu/drm/panthor/panthor_gem.c:167: warning: Function parameter or member 'ddev' not described in 'panthor_gem_create_object'
> > > > > >> drivers/gpu/drm/panthor/panthor_gem.c:167: warning: Excess function parameter 'dev' description in 'panthor_gem_create_object'  
> > > > > --  
> > > > > >> drivers/gpu/drm/panthor/panthor_heap.c:339: warning: Function parameter or member 'new_chunk_gpu_va' not described in 'panthor_heap_grow'  
> > > > > --  
> > > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:52: warning: Function parameter or member 'product_major' not described in 'panthor_model'
> > > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:64: warning: Function parameter or member '_name' not described in 'GPU_MODEL'
> > > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:64: warning: Function parameter or member '_arch_major' not described in 'GPU_MODEL'
> > > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:64: warning: Function parameter or member '_product_major' not described in 'GPU_MODEL'
> > > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:168: warning: Function parameter or member 'ptdev' not described in 'panthor_gpu_unplug'
> > > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:234: warning: Function parameter or member 'timeout_us' not described in 'panthor_gpu_block_power_off'
> > > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:234: warning: Excess function parameter 'timeout_ms' description in 'panthor_gpu_block_power_off'
> > > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:294: warning: Function parameter or member 'rdy_reg' not described in 'panthor_gpu_block_power_on'
> > > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:294: warning: Function parameter or member 'timeout_us' not described in 'panthor_gpu_block_power_on'
> > > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:294: warning: Excess function parameter 'timeout_ms' description in 'panthor_gpu_block_power_on'
> > > > > >> drivers/gpu/drm/panthor/panthor_gpu.c:472: warning: Function parameter or member 'ptdev' not described in 'panthor_gpu_resume'  
> > > > > --  
> > > > > >> drivers/gpu/drm/panthor/panthor_drv.c:84: warning: Function parameter or member 'obj_size' not described in 'panthor_get_uobj_array'
> > > > > >> drivers/gpu/drm/panthor/panthor_drv.c:84: warning: Excess function parameter 'obj_kernel' description in 'panthor_get_uobj_array'
> > > > > >> drivers/gpu/drm/panthor/panthor_drv.c:268: warning: Function parameter or member 'syncops' not described in 'panthor_job_ctx'
> > > > > >> drivers/gpu/drm/panthor/panthor_drv.c:732: warning: Function parameter or member 'job_put' not described in 'panthor_submit_ctx_cleanup'
> > > > > >> drivers/gpu/drm/panthor/panthor_drv.c:1406: warning: Cannot understand  * @cleanup_wq: Workqueue used to cleanup stuff.  
> > > > >     on line 1406 - I thought it was a doc line
> > > > > --  
> > > > > >> drivers/gpu/drm/panthor/panthor_fw.c:293: warning: expecting prototype for panthor_fw_get_glb_iface(). Prototype was for panthor_fw_get_csg_iface() instead
> > > > > >> drivers/gpu/drm/panthor/panthor_fw.c:310: warning: expecting prototype for panthor_fw_get_glb_iface(). Prototype was for panthor_fw_get_cs_iface() instead
> > > > > >> drivers/gpu/drm/panthor/panthor_fw.c:438: warning: Function parameter or member 'input_fw_va' not described in 'panthor_fw_alloc_queue_iface_mem'
> > > > > >> drivers/gpu/drm/panthor/panthor_fw.c:438: warning: Function parameter or member 'output_fw_va' not described in 'panthor_fw_alloc_queue_iface_mem'
> > > > > >> drivers/gpu/drm/panthor/panthor_fw.c:1190: warning: Function parameter or member 'csg_slot' not described in 'panthor_fw_csg_wait_acks'
> > > > > >> drivers/gpu/drm/panthor/panthor_fw.c:1190: warning: expecting prototype for panthor_fw_glb_wait_acks(). Prototype was for panthor_fw_csg_wait_acks() instead  
> > > > > 
> > > > > 
> > > > > vim +/panthor_debugfs_init +1326 drivers/gpu/drm/panthor/panthor_drv.c
> > > > > 
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1324  
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1325  #ifdef CONFIG_DEBUG_FS
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09 @1326  void panthor_debugfs_init(struct drm_minor *minor)
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1327  {
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1328  	panthor_mmu_debugfs_init(minor);
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1329  }
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1330  #endif
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1331  
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1332  /*
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1333   * PanCSF driver version:
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1334   * - 1.0 - initial interface
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1335   */
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1336  static const struct drm_driver panthor_drm_driver = {
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1337  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1338  			   DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1339  	.open = panthor_open,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1340  	.postclose = panthor_postclose,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1341  	.ioctls = panthor_drm_driver_ioctls,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1342  	.num_ioctls = ARRAY_SIZE(panthor_drm_driver_ioctls),
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1343  	.fops = &panthor_drm_driver_fops,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1344  	.name = "panthor",
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1345  	.desc = "Panthor DRM driver",
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1346  	.date = "20230801",
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1347  	.major = 1,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1348  	.minor = 0,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1349  
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1350  	.gem_create_object = panthor_gem_create_object,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1351  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1352  #ifdef CONFIG_DEBUG_FS
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1353  	.debugfs_init = panthor_debugfs_init,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1354  #endif
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1355  };
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1356  
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1357  static int panthor_probe(struct platform_device *pdev)
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1358  {
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1359  	struct panthor_device *ptdev;
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1360  	int ret;
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1361  
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1362  	ptdev = devm_drm_dev_alloc(&pdev->dev, &panthor_drm_driver,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1363  				   struct panthor_device, base);
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1364  	if (!ptdev)
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1365  		return -ENOMEM;
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1366  
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1367  	platform_set_drvdata(pdev, ptdev);
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1368  
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1369  	ret = panthor_device_init(ptdev);
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1370  	if (ret)
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1371  		return ret;
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1372  
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1373  	return drm_dev_register(&ptdev->base, 0);
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1374  }
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1375  
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1376  static void panthor_remove(struct platform_device *pdev)
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1377  {
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1378  	struct panthor_device *ptdev = platform_get_drvdata(pdev);
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1379  
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1380  	panthor_device_unplug(ptdev);
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1381  }
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1382  
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1383  static const struct of_device_id dt_match[] = {
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1384  	{ .compatible = "rockchip,rk3588-mali" },
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1385  	{ .compatible = "arm,mali-valhall-csf" },
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1386  	{}
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1387  };
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1388  MODULE_DEVICE_TABLE(of, dt_match);
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1389  
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1390  static DEFINE_RUNTIME_DEV_PM_OPS(panthor_pm_ops,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1391  				 panthor_device_suspend,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1392  				 panthor_device_resume,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1393  				 NULL);
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1394  
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1395  static struct platform_driver panthor_driver = {
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1396  	.probe = panthor_probe,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1397  	.remove_new = panthor_remove,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1398  	.driver = {
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1399  		.name = "panthor",
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1400  		.pm = &panthor_pm_ops,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1401  		.of_match_table = dt_match,
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1402  	},
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1403  };
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1404  
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1405  /**
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09 @1406   * @cleanup_wq: Workqueue used to cleanup stuff.
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1407   *
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1408   * We create a dedicated workqueue so we can drain on unplug and
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1409   * make sure all resources are freed before the module is unloaded.
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1410   */
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1411  struct workqueue_struct *panthor_cleanup_wq;
> > > > > 560b6916e77920 Boris Brezillon 2023-08-09  1412  
> > > > > 
> > > > > :::::: The code at line 1326 was first introduced by commit
> > > > > :::::: 560b6916e779201356a8db10cec8dc5183d9fe5f drm/panthor: Add the driver frontend block
> > > > > 
> > > > > :::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > :::::: CC: Heiko Stuebner <heiko@sntech.de>
> > > > > 
> > > > >   
> > > > 
> > > > 
> > > > 
> > > > 
> > > 
> > > 
> > 
> 
> 
> 
> 
