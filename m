Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5621360
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 05:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693458868; x=1724994868;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=eNhSy4MpeX+/Vq8bUfTRE5ck/rKPTiQnZoTmw3grDcY=;
  b=OHdboC33OiAVKfNZe5yeYo3aoQCjK0R7mKH6hbQHpQPKq8iYEw5rOTWx
   jQEM6iTcQnKoIH+rhdSyM7rbqlJaJ8UP1K7zHJ0D4RWHshcOc2zTQZy4L
   Z92VNvs7hqSEll08A2AD7jKYwDDpzo+DHE8W7X9FZ1dOGztOc4sVtyYhM
   SugS/mxxRjU0/+jk8vwvf0rWZs2AYMy01i20C9cNJnythoGPYCLdFikr1
   Fcd39M9pj4Ss6x65UNoRIU46QwXALl6lPnGDBTtk45QjOOr1VAITdVrkI
   qeSc0LWowUM6joDjfVWBbUji/sAO9GLzCUYhB2nEyO25T1jqUjjpDa5d+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="374729352"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="374729352"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 22:14:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="768663433"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="768663433"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga008.jf.intel.com with ESMTP; 30 Aug 2023 22:14:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 22:14:26 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 22:14:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 22:14:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 22:14:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OI+eXAb3yS86Q8ttF4dRw6O6Ic41wEzT8IkHC5h4rHTMZ7gmbYXrsJc+wqOFxWd8G/sWFUTJ/NhSaegFLuWLO7AqvfGXo00dduIbWVmCb0M+SN1Cgj0wLdeUKhVMQVM4yVdx0cw+I5Czw8c/sEpdOSSy9aCVjLcleExezXb1XXDorlMG0HaLWgbT1AlThx0lfW5QGlidwYrZGoT8r2IlXO9XtZdHndYW5Ybaz+1shKyWZ54VZkS/8A75uAdLAbpV6Bgdk5E/F4R+daICCzDpO8xydoFf/K7xvS+/vX+XRvchBSh/wfWSfSGg9x7u4PHenNZ4eI/mnshtG+YicVf4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHbEZ/c8nzO3DXL/nMVR4EuTuIWiR0I5gqEXkAuX448=;
 b=OchJL9J+ntXaGG6Xv7OO2owHuqBGmxdFmc0F1710Er1nHarrAwRj6cBAToDaanMIin9mFEAm8NKNKO4xY/t/aUALt9ATV+FPvSUnG5DS40Ax8nKRfQ2UuPImzvHuObtQ9ZJWRKRFf0iqt43yzRiTaNda4EFe61+tAjPjEFsbHTZchSK6UOEB/tMYGtZsiUR10DawJz7y06U1kET6b+/eYqg1ScuQoOoYzIJ+ctSilRxBW2vMSxeeEU6qi6TqlQgQSY9WdZSKyX31ysGtxAK6BW3JWnDf6t1tZq3C5U/APT244lLfKElH2XlDGGdbN/azI9OIV9lHS9oej/jbybibyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by SA2PR11MB5066.namprd11.prod.outlook.com (2603:10b6:806:110::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 05:14:23 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::3130:de4a:9f73:a5b6]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::3130:de4a:9f73:a5b6%6]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 05:14:22 +0000
Date: Thu, 31 Aug 2023 13:14:11 +0800
From: Philip Li <philip.li@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
	<oe-kbuild-all@lists.linux.dev>, "Borislav Petkov (AMD)" <bp@alien8.de>,
	<julie.du@intel.com>
Subject: Re: [stable:linux-5.10.y 9990/9999] arch/x86/lib/retpoline.o:
 warning: objtool: .altinstr_replacement+0x90: unsupported relocation in
 alternatives section
Message-ID: <ZPAhoysFb9PcQqQZ@rli9-mobl>
References: <202308270243.86PKK5Yj-lkp@intel.com>
 <2023082641-overbite-deport-600b@gregkh>
 <ZOqsQPPZnKsyr60J@rli9-mobl>
 <2023083046-spout-hesitant-e8c6@gregkh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2023083046-spout-hesitant-e8c6@gregkh>
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|SA2PR11MB5066:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ca631aa-3c25-4a3d-92e5-08dba9e122fd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FVgvO/vTBANjVYvGO8o94P8Nz7MiBvfOnm1fqUX+1mgGuDsK/gDYIJixAChoql/2jyNtis5uuhculPMALofpUbP1K4nfHfWqsL5mPBxeKDqPsiSuNGiMbi8zyDtKcirDlGNmDym+GVGU1BXx3Jw1Zlig2egAhQG8W18AIc1NMRnjC91iiQ3e/UGIojyrJ5+lqJ67uX6suD2SmdMKjpB+FTqtdt1LKewYx+dDeCzmm++T1ApURoVdvR8QDihOTH/LrYA6oDh81OglX9kbW8+JAm+shApuY6RBFobF04p5kHdKKN0sUivb0A/MuDPaxg/RxjNQaAxLvQhtuSZm7BmEatJoJEg7NEaMMycB5KZrftkSeklTdClTEhgWIQmE27a0ZWkqyLfV6kYHFkBj4u3OasdFay73ECpkaPP1xYAhQXiesxdwfJz4OVmi7yZqf4H9EDzzuvyu6YGRQXsfdnR2n0TYvkCFjsD1CCeiyTnk2F1NiaRs3SXzRDqkXnG/ELM8scHhovn2xt2QV1LCsUaUFw4YcWvtZvn6O0av86nw4wN5Dso8dUJPL8ZsfHfry59D50RqLouHBYPgcN9ZAyJb0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(346002)(136003)(376002)(39860400002)(366004)(186009)(1800799009)(451199024)(8936002)(6666004)(66946007)(478600001)(966005)(66476007)(6506007)(54906003)(66556008)(6486002)(6916009)(316002)(38100700002)(82960400001)(41300700001)(9686003)(6512007)(26005)(8676002)(2906002)(107886003)(33716001)(86362001)(83380400001)(5660300002)(44832011)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dtbq0LGPhLNBKKB1NPGF5kLqynaDfDSkoAliGbxVB7QRAr4hFqu2z+SwfixI?=
 =?us-ascii?Q?N5wSliOVQnesGo5yWYk+Sgtqsr+EPNlcxStgo2B5FjNhSlQm+9qvzvFT5vbt?=
 =?us-ascii?Q?50uGgEUvXWDgknIPzC6RnX8kxvKIzSvzv96NWg6a8go7KkPiPJ9BbO6r0Mxs?=
 =?us-ascii?Q?hcBcHW1qzlcsz7DGBJA9/IkjpPVPq9kTeoM3g7/mY33VI1aByCijVCWMk0ku?=
 =?us-ascii?Q?tiwPSYeBFU4Z1u4VLKxn1ugrYRxO6mHaKUK2/UsZ+H5FMknpKdEPFM5l843x?=
 =?us-ascii?Q?4HVJHYCCZU8nUOd+BZLQIuyEPdMdGLLhYMbi9VX/P6E/ohXJq+myPv/Jy5gz?=
 =?us-ascii?Q?G3MG6ePoWoyryKKVUGBjehIgvYoQyml+ZWWg9EjreliyreiPpwO/vWL2cf1Q?=
 =?us-ascii?Q?ciu6TS5ugY3YwpHU5cVZopqVwP/pSE6XJBEhqVceZq9EGsNSETzUP4NQ97b0?=
 =?us-ascii?Q?m0dmNRmwRkkd4EnqicRbVaEcVhO0mmyGfV0i3JoQU3XKvkuD7Q1rLom+fVRS?=
 =?us-ascii?Q?3/Tc0XWvUeuWIgEk+u9tfAWHB//ivf9NcFJ2Tcfggo1JbLrNglDYVvZ3fT/B?=
 =?us-ascii?Q?MZYIRPdxgZoM9w5GYQIi8d9Vow7UJePavFNVjD4zEOeMJCuz3U+lMjoWgJ/5?=
 =?us-ascii?Q?b7Eymb3pMfCEFZXs9+XovNu0Y4PV8WWQUKYyon8UiMi/AVOn6224ICZLAUYg?=
 =?us-ascii?Q?AW9jMhnhR28wEjPUIb8kGtqiGCDbr/QfrJk7v2MMYOsYNomjXfKNCq2HOPWn?=
 =?us-ascii?Q?zDT3V8V3IVxpmRda0+o3/TugIat8jVeNlSWAXoJZKzVl4YR03FeWyK1MHi+r?=
 =?us-ascii?Q?+aYd9tsWAJLcuIIXQiOIcbE5gMlMx73fIqGSULl4oFk+SNPO9Yw7Pdt8BBwD?=
 =?us-ascii?Q?caK3xmHBuM1bu9Z9d7EGmi9P1dqJ27flKwjcfTpCEaFtQCZYzADJN9Qu7lkt?=
 =?us-ascii?Q?xScBFrq886xY28mOoQXcEtC1W66gdmT/6nkf6avr5ALSU+nsI0Pw99kIR82y?=
 =?us-ascii?Q?VNsAPonQtomOlDXQd7BTPlwlV0r9evyut/0VmlQB54F32y2xpZBQ08f2Fl8u?=
 =?us-ascii?Q?s7g34kFGVKalAl5g9aduGGrVNYxa+2x3SUEiIFJrTcFwGURfBxN/BYvPhqKl?=
 =?us-ascii?Q?msls/Z7r+g8nmUaYwq/SlNWd2lL1UnXMQm/jWJI8H7BG9r8oqtI3Kx3ejiAX?=
 =?us-ascii?Q?G3V9uBBrHOAHDvFgL4bP5GcpyQ5OsM8mmq5LiBsiMrOJ2mbsGGp6mcLTpR+O?=
 =?us-ascii?Q?FXR3kD9U9QUDpmTOfft5rOAPco9E+htcw94f9qwjLwoV5slQI0peHGtf/ggT?=
 =?us-ascii?Q?3QBf/3x/SILXSXUHPCibShQRloy0ICgHcoM5ZRd1J0JY3dCBuSs0CQLoTem5?=
 =?us-ascii?Q?yMf/He/ImoZTlMhkE0bPZA4J14fLUpUxipXuwLRL2A8sEuxM2pymnNd8MqBm?=
 =?us-ascii?Q?A24djv2OS4WCTWN2sH3I61tFum+yLONlZesO6Ev0IpTauXQpfBTMk3jQeQLQ?=
 =?us-ascii?Q?XVSNcFc+Xxh3TpU5zsemrYxGKRN7lP5kSmdeqyaEPeI9oi6z8zLGlZImpOCW?=
 =?us-ascii?Q?NbcprB+le+I4/rL6wNquUeBXYrk7PafG4AsJFTnO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ca631aa-3c25-4a3d-92e5-08dba9e122fd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 05:14:22.6950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aTHXINp+cV4R06iT0Nx0zbp7yo9Y/yZXVaoF+k5k44iiipsZMW2X8ZHBzDVyVw6D7V/uvo81ZmZdZh1fskKdhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5066
X-OriginatorOrg: intel.com

On Wed, Aug 30, 2023 at 08:36:37AM +0200, Greg Kroah-Hartman wrote:
> On Sun, Aug 27, 2023 at 09:52:00AM +0800, Philip Li wrote:
> > On Sat, Aug 26, 2023 at 10:05:58PM +0200, Greg Kroah-Hartman wrote:
> > > On Sun, Aug 27, 2023 at 02:56:55AM +0800, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
> > > > head:   1599cb60bace881ce05fa520e5251be341e380d2
> > > > commit: 06597b650beb49bffc61e077f41e39b830d72128 [9990/9999] x86/cpu: Cleanup the untrain mess
> > > > config: x86_64-randconfig-074-20230826 (https://download.01.org/0day-ci/archive/20230827/202308270243.86PKK5Yj-lkp@intel.com/config)
> > > > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> > > > reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270243.86PKK5Yj-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202308270243.86PKK5Yj-lkp@intel.com/
> > > > 
> > > > All warnings (new ones prefixed by >>):
> > > > 
> > > > >> arch/x86/lib/retpoline.o: warning: objtool: .altinstr_replacement+0x90: unsupported relocation in alternatives section
> > > 
> > > I apprecate the help that the kernel test robot is giving us, but this
> > > constant bisection is a bit annoying, especially for stuff that we
> > > already know about (like this one), or stuff that is years old (like
> > > other reports.)
> > 
> > Thanks Greg for the feedback, sorry that such reports are not that helpful.
> > 
> > > 
> > > What exactly are you trying to help out with here for the stable kernel
> > 
> > Initially I thought the issues detected on stable could be a summary of
> > issues with the first bad commit (since we only report when bisection is
> > done). This can help maintainer pick up the fix per need based on it, though
> > there's already automic approach at stable side to pick the needed fix
> > from mainline.
> > 
> > Another thinking is per 0-day ci's randconfig test, it may find different
> > issues (other than mainline) on stable.
> > 
> > > trees?  Why not just always test on the latest release and go from
> > > there?
> > 
> > Got it, this is a good suggestion for us. I want to consult that
> > 
> > * We gather the issues on mainline as well, maybe we can only report
> > issue to stable if the issue hasn't been detected on mainline yet?
> 
> Yes, that would be good.
> 
> > * Meanwhile, we limit the time that only to report issue which is
> > within one year?
> 
> Again, that would be good too, but why so far back?  Why not just run
> these on the releases when they happen (i.e. every week).  Why dig back
> into really old stuff?

Got it, thanks, we will follow this guidance to focus on issue like
within a week if we haven't found such problem on mainline yet.

> 
> thanks,
> 
> greg k-h
> 
