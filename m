Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA8F36A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 01:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693101133; x=1724637133;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=PvVZUMVbu+2v+hXCpJ65hGcaXa9gkAzvEWxEMgdoUso=;
  b=hVd1qGJbFwOS6I5y/hGiMX+6Bg6sBawzY//B0+ZxZhuS9M6QxDO3qngt
   7PHTy7ACMR9jG4sSbS8xwT/HgO5tWWm7L3ZD+2/0RB1lT0Qquxg6mI7EA
   h2VnljJnDc7/cjoS3roZQCJl6KOI/smppXFkGNP2Q5W/+IZ95xxi69eo2
   r20/JNWBSJpOwhykqUBRY+PcmD+Vcd56xmsVssOazmiCPC8TV2wIdnK/m
   KPx9ue6+cTsFNsLRCb3PlW74mA2EV/KI2+C2alkrQ3gUlG8blJWL/8336
   pAf4cCzCM2ExnErZDtJZgSnGkgKPMOPOhJcNvuPzk9iC/urweoUe0EDz6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="355242611"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="355242611"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 18:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="984502308"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="984502308"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga006.fm.intel.com with ESMTP; 26 Aug 2023 18:52:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 26 Aug 2023 18:52:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sat, 26 Aug 2023 18:52:13 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sat, 26 Aug 2023 18:52:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcN+v/hiXbJgNoJvz+fgPAp9G+s+j7mQddXIyWny92RjyPhQzfi+y9IPSl92P6rT8dHyYOqQAEXTQXpyEOouzuYm/3DTDBARK7JZVc0BPMV7/5irV8dw6bSKA2JNmn5o2jlbcmDRuapz4u+pQNQPKieD4+p7aTGM8f0byC94Mda0c6EpXavr7XV8xI1VUJvQYQgSbdEH805nvV5blwSGfHzkqap7DNSyAFh1IBMbDHartIroJaUTfWX5bSHuEbEVYzqZ/xh48hMBs1yBXS1FhTbzMumEDteu7dTKe1Idef9ter7ISXsPV26n8afDhdgR/3Xj6r6cRRTXMRkPa8cvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GBERPOe8OC2l/XNagNJOzyhFXQ2dyAtJdSPxQFUNG0=;
 b=bCGrJeeFyzjiwr+MA3n8b0XjQYmnRsm/grbDf/eb0hpCijig43Mhq6kdzYwrpJlobdfarjijjJOQfxnqtiy8IVePURSiHjszYmx7I8kSOTmGotwwBPKmp9FX20oZUw7didDQF2pEimnX0Q9HIpa4CI5iN3d3g0K7TdGd3QX7mEoLL8nw+ChpZaS+7dAe6IXkBddtNG2cunmMG94wy3Wi5+lPht/mfHODgZAQwEKvKE8QIxw6BRwmowspXy5emBX+bxtQyIy8LrYJgZH6LcDAHzajnr2ESLBdlz1H59irrl4E4IInuR9rNk5pcNfwjCVv2Q85la98SdnycoaEEytVTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by SA3PR11MB7555.namprd11.prod.outlook.com (2603:10b6:806:311::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Sun, 27 Aug
 2023 01:52:11 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::d718:207a:ec74:2556]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::d718:207a:ec74:2556%5]) with mapi id 15.20.6699.034; Sun, 27 Aug 2023
 01:52:11 +0000
Date: Sun, 27 Aug 2023 09:52:00 +0800
From: Philip Li <philip.li@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	<oe-kbuild-all@lists.linux.dev>, "Borislav Petkov (AMD)" <bp@alien8.de>,
	<julie.du@intel.com>
Subject: Re: [stable:linux-5.10.y 9990/9999] arch/x86/lib/retpoline.o:
 warning: objtool: .altinstr_replacement+0x90: unsupported relocation in
 alternatives section
Message-ID: <ZOqsQPPZnKsyr60J@rli9-mobl>
References: <202308270243.86PKK5Yj-lkp@intel.com>
 <2023082641-overbite-deport-600b@gregkh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2023082641-overbite-deport-600b@gregkh>
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|SA3PR11MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 738aff2c-ea51-438e-3441-08dba6a039f8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ln4NeQ6xMg8s1rtWKk1sUpfMz9zusZ88vKw78Q/E7j9/Pd5jIb3kaJhHY2ANbQ5enkc83g9Cm7aUpEnPYVtj2SVi6kRpNdZ+ouAsH+avaGRyrlG6n5B4AU8D4vU6JTa6f5jDgvxi9f4l3FyjbLgHtujI16J0srptWnICYxRSQtiYQVS0Q6nVblP9YCr5+UskUy0Brrm89ueU1an0XGQ1auSAh7m3W2G8WjxvEILV7uAO+wgjZAGOVS6asFo2crQPCn1lKCQGWvVggn29trDgFBFN3V63jsO4dxjqGqir+xVF3vs9PxRoJ9wotPFhuUQV7ZgWREr3sI4krGdT+CMYDBYIPcgEMAfPALzNc2n5JOVtCy2m0r1ozt3gF1KVxUzODDOKh1lGD2tlYyISUTOmpQaOTXugly9BiOoC8cronsB3N3DxBQJd3J+ME3MTxZdfMrviIiJM20M+MSdqQJMqwD5Fd/sKttfXm/qkDA9+5u0k8TKwIPqXY7/A52eVgFWtiImtLrV7XK3/q4Fgy3UlVnfqDkuFe9bURSY7h+yqQCkbH/LQgdGktw7ZM2lgTwMpmkGEjdyo3o7yDTxG32pl+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(366004)(376002)(396003)(136003)(346002)(186009)(1800799009)(451199024)(9686003)(6666004)(6506007)(6486002)(107886003)(6512007)(86362001)(2906002)(44832011)(82960400001)(66946007)(8676002)(41300700001)(66476007)(8936002)(54906003)(66556008)(4326008)(5660300002)(6916009)(316002)(33716001)(38100700002)(478600001)(966005)(83380400001)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7cKSH9EIc0a/CCgsiJ5h9IsTqz5NMszs4WpPqnL+10V/avKMQkFg+nHJjmxN?=
 =?us-ascii?Q?ULjtNJ3i44hrmucIOnUKoQq/vP5pA5HP2UwBSKK6tZ+ip4nYZ1ezdp6dYiT7?=
 =?us-ascii?Q?esytiZ6nCstaOiVQy/Nmy5oiTy01JJfG2qpENv4SuuT3652WR8RbSdbYa9tT?=
 =?us-ascii?Q?n+UioIEL32nTlaLnMjn2PCKkwDCQMCK9fzcn7dmnBCp4/94pU/8C0tHSvqR3?=
 =?us-ascii?Q?OFQ/6sUFydWobP7reCuGLBF7qK+pIY12HLhGqWDIPFCySxfpPchCEy+cWSsp?=
 =?us-ascii?Q?xlNyUSjEMxxrsAOVpHelLt3xk8k5U84aMMqukqfBblXy0zKjI3KAcl5veTzm?=
 =?us-ascii?Q?G8l+3ZrJUIgsX6WApdMX71d02bd6ayU9pNH+vn8SZLTR4UwiyyZGpbBdls0o?=
 =?us-ascii?Q?AKP9/+Fhuyc2ZZkqw/jm1Yso0p6n8E/XOWzlWkKvDcnk8WjmPnXk7P9Y958H?=
 =?us-ascii?Q?/s99JOW+0gS4lNsNNqRznxKknL95+h1taqBv1wXpftSVV+Y8NrN2i+r0G+bt?=
 =?us-ascii?Q?8tmhzVSa3l64TZuUh2bcj2lDKCYuTTmHeYzfW6XP2PCpysl+0+SnT8IJRVmH?=
 =?us-ascii?Q?p7oGcxO6yB2CGaHOTk/LG1RGJF/AYnAAwGqCriYteQqeDHB7NhZeL6Sqzv5K?=
 =?us-ascii?Q?boGWffOVe33YWW2FuG4MsE0FlSOl7DIkZ97YhyVM/YiuFOfMRUMA5ncxG1be?=
 =?us-ascii?Q?TB9SjsHEGj6C5Z9yDj4SglX2Bfavr3xp5Pb5hRo/VcBaaW+LbGegoZGm7U91?=
 =?us-ascii?Q?3b9rfnohod3UELTJEUKGzmQ9BgL+QAe7/aNSEREMO+RPFOkKuDR79WplYOYE?=
 =?us-ascii?Q?yzjh8aakGccZ6iqQrUKqPzRDeK/uoyogwjUqvzU03UL32R4h2N6N+ECEAPzL?=
 =?us-ascii?Q?0pwkbkMzwE0rW8C96BN9RsZUwTr35WI4WXEG/xRSQDEk3WxZZW5E+UFO7peo?=
 =?us-ascii?Q?zcxT9ndOylDBkgFeH3NbDCeAT+bimxg7bWRLE3WWPf+HJASmR5sQLNBmzw6s?=
 =?us-ascii?Q?TWAxiOaj07D+h6O+pDltA7VMpFaYhE12jDGBj3eR0fJUTcTDDfz5bIHdL8ue?=
 =?us-ascii?Q?ITULMTeq9PdyWSEKIfd9tpkxxVKNfWSmW+FTNR1nqQxa1XnDfO/9ul0b63Yc?=
 =?us-ascii?Q?mKCteZb16gUv03pEsk75qOUeSAziKJom+dp8mHJp0Jg4yOSb4JN+kf1pOasX?=
 =?us-ascii?Q?WpasgD3NLGDFiehiE+Ez4kpUQuCCsjwPZWwPXx67OXZr1BSvzgWIRTA6NcER?=
 =?us-ascii?Q?7EeEIPAnC8xVBzvx0Uw93oFGD3kRM0sZGmq3nIlDHKx1b/XQoicy/eocSgoJ?=
 =?us-ascii?Q?3yG2EzHvJixiqY9cyt8Wqek0Ue8hiivfOpVyIKN3B96viEBdCb/4zdWnip+I?=
 =?us-ascii?Q?NzYAB0U0Zbh842OsU4g4+0rWMEdEb4cJxpvtVAYBs97F1h1fGrHuB2fGkh98?=
 =?us-ascii?Q?51fTv0j7yyG8FevaVm/TdFzEoUcN9mvNBDaHMgwCYd/riKaNO2+9drg7fhJ/?=
 =?us-ascii?Q?V7ofOey/UAsI5H7bFf1rrp+RVIOxBfx8M00qc+uKlfgm9p8oEu0Najhon2Dp?=
 =?us-ascii?Q?sv/HcZ5Cw7DQdJb+8tIM6SwZOcEBrKL6ICEf58EG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 738aff2c-ea51-438e-3441-08dba6a039f8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2023 01:52:10.3466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3dCmNucNQT8AB0jd6I5IZl647Oj3dO0D0XA+f+Zj+QANnUEODboEJxnACNBTWJLSb5Mu7zHEzN7KPhJiCBH2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7555
X-OriginatorOrg: intel.com

On Sat, Aug 26, 2023 at 10:05:58PM +0200, Greg Kroah-Hartman wrote:
> On Sun, Aug 27, 2023 at 02:56:55AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
> > head:   1599cb60bace881ce05fa520e5251be341e380d2
> > commit: 06597b650beb49bffc61e077f41e39b830d72128 [9990/9999] x86/cpu: Cleanup the untrain mess
> > config: x86_64-randconfig-074-20230826 (https://download.01.org/0day-ci/archive/20230827/202308270243.86PKK5Yj-lkp@intel.com/config)
> > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270243.86PKK5Yj-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308270243.86PKK5Yj-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> arch/x86/lib/retpoline.o: warning: objtool: .altinstr_replacement+0x90: unsupported relocation in alternatives section
> 
> I apprecate the help that the kernel test robot is giving us, but this
> constant bisection is a bit annoying, especially for stuff that we
> already know about (like this one), or stuff that is years old (like
> other reports.)

Thanks Greg for the feedback, sorry that such reports are not that helpful.

> 
> What exactly are you trying to help out with here for the stable kernel

Initially I thought the issues detected on stable could be a summary of
issues with the first bad commit (since we only report when bisection is
done). This can help maintainer pick up the fix per need based on it, though
there's already automic approach at stable side to pick the needed fix
from mainline.

Another thinking is per 0-day ci's randconfig test, it may find different
issues (other than mainline) on stable.

> trees?  Why not just always test on the latest release and go from
> there?

Got it, this is a good suggestion for us. I want to consult that

* We gather the issues on mainline as well, maybe we can only report
issue to stable if the issue hasn't been detected on mainline yet?

* Meanwhile, we limit the time that only to report issue which is
within one year?

* I really hope 0-day ci can do valuable thing to the community. Do
you have any suggestion that you think 0-day ci could be more useful for
stable side?

Thanks

> 
> And this specific should be resolved in the next release.
> 
> thanks,
> 
> greg k-h
> 
