Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06A0538B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 01:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKIoM/o6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702864007; x=1734400007;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+mKHjhzh6GN233laZktjjuV6pamqaqS/VI0QBvsC51E=;
  b=cKIoM/o6jj4z+/tAwXzfD57/ubuEFKofIpDx9JYHjp3vlcELuMJmf2xb
   ioDfjvaX8uQq3j63a5iKRgUKxsePbpED6u3xQgkaW+J3yv5wL5bRCZg9G
   gkQyVw0AiikEJM6CLMSPnaDEyuECuLvR3Zg2NQn+TscnY3g8b2bOXNZP6
   jqK2aKZVFowEc1sGyqIUxzDq2rdA/xZAngtTCUF9S6nOOy6Uda0V/ZyIS
   gcxT/F28kBJAny4okOPbME0+hgxeze0lqP1+O+yx7b/iEpt7qXzT4cerI
   mUriclOZDoML4TUl/eTIe0jLeqTN1iIU5vdemTSECIQv6KUYsMwY0IJ3B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="385866361"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="385866361"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 17:46:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="898791698"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="898791698"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Dec 2023 17:46:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 17:46:45 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Dec 2023 17:46:45 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Dec 2023 17:46:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WYUpSbx8yck/sg3TLaNtag08FZrg+i7Fh0bKZKSlW71k8Vl/GRqK35lSxF0jRXf2cmOamqlcw14lgZYjQQBd0xizfCztphYMuZ9n4zFWlkPuho8ragJrnD6NwoAEeXENQHXtma6Im9Sf5jbCWcIvHG651MaRP2G4kkGCXNydTNlEvPv2YEILyZyUA0HZJBeQQXSJSgb2gWnLKY0nMxKelmlSMuDHnx2NDrhCz1YhMNVcXlp7+XI2hIOjimAsFxsf8vBSljQ/+T0K2jSV1y2g/n7yUnuiPSGCkIYme+5lvwbhcW7I+lTgx54KG2FO1rv85me012Y4DTb0yhNHeGLNTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzYyGdkeSACWZwu1YWqpAwy4Qw7phwstS6/5xArqFwI=;
 b=hjv3g4nlZezR32Xyf5OHHbhyDy9N6Rk5tX39z9kpytn8p2LJWkvi2hJaU97zdmQbRXso0VhkuWNCSGIlPKRQbKrWt0y0LqNoeP3kLMfSr2osA3GR7ETBADcOSr5f8j2yhN6CuPWWTNMgLxJLJnaxn6ZCtMzNV5ODedvG0Y6zJmi30CjV8mDnYsBisMxeeNrHyuEOdoZ+tIX7DApDCUMlZh+6jA0Rt+UQaCBgT7XXjJa12quzJGyKHBhsWAUTKnhJedmMO6Sll4fhgVdqn5SmzqNUhqiUft3vm/LCk/Y9dMXHQCyG1z3vUR3rXNWvzz43GwH8NYb1fEP6KU9oDLaCBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH0PR11MB5218.namprd11.prod.outlook.com (2603:10b6:610:e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 01:46:38 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7091.030; Mon, 18 Dec 2023
 01:46:38 +0000
Date: Mon, 18 Dec 2023 09:42:11 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, "Neeraj Upadhyay (AMD)"
	<neeraj.iitr10@gmail.com>, "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: [linux-next:master 6386/7300]
 kernel/rcu/tree.c:2965:(.text+0x5b44): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <ZX+jc23iEE/6I3B4@yujie-X299>
References: <202312140939.zA3tdSi2-lkp@intel.com>
 <f42f90f3-8cc8-4bb7-8455-685e699eb2ae@paulmck-laptop>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f42f90f3-8cc8-4bb7-8455-685e699eb2ae@paulmck-laptop>
X-ClientProxiedBy: SGXP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::18)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|CH0PR11MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: 886d7b6f-f804-41ee-5858-08dbff6b2cfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nC1i6oWWhKvatgc5JblCrqmLF1MSAnfLsfg5t2PAd6tVlhM5tWGA1dOjDI9TekgZ/LxqzWIcCdL8SGSx78wdwyCJySd3onhJF+BOyACWvM3okIDs6fW1pKfoKaWQjPXtCPiZ7ZR+TpKtPN82SBUuaqTY2gddMQRmNxLinbGSjRrRHWykpNLUUf4wchCd2/8oGo2BBl/hsgVASnVFNQqzPVnric+c1Sh3/WyrH97DswigOJZk2SaDbVM9PAzNgldqE/eMBCvS+nA895qjuZM293ZWMXPFB1WyQEU84rzsBnpo2SC7VaDXd5GNb58BLXgIsXFMFy7BtpPm9was5mRyu0HXpu68gpg+tIIj9o74rQgZynjCd/s9Tau0OMqyG/3HrT3l8kkdECpSf+HW8KFwVi9oJi8iRs0xtYmsbenQ76MPo5Cmt61m2MFJke3fbBuwg1yiR/XfyKIFkFotIplr8ugaLkh+9H3xIcnx4uBvKVSVfNFI5JZ7hySTaWjwPynqZ2/ZrIkB0bN8H2QvUkGw/JXlj/CZg1MrCE40Ky2QPY9sqbuNi1I57Ylp2MLQYb15hQCa5p6mBlqNfExPDNQj8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(376002)(366004)(136003)(39860400002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(26005)(6666004)(6512007)(9686003)(6506007)(83380400001)(5660300002)(44832011)(41300700001)(966005)(2906002)(33716001)(478600001)(316002)(54906003)(4326008)(8676002)(8936002)(66946007)(66556008)(6486002)(66476007)(6916009)(82960400001)(86362001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p8XjU+Hvw92ydu+2i8qT+i2fvzsgIxt5SZaD7AoBvfrlow26YRwPc44OkaAs?=
 =?us-ascii?Q?Y+YFM5G4es+gDFcDG0yXZEMadJ5X6HA+fzfbsekMrMJPVVwk2jUUhC34Izxl?=
 =?us-ascii?Q?E1QfrOLDW0pSMDcUHmF9UjeNfFmL936FJWWWVAMc8+x7xB5ox9L8YCq9tfhn?=
 =?us-ascii?Q?8MgPWonxEIrlJTYpTCDCcl6fzL7UPm10YH742uiCVEYG0g4abIJE8GoP6V4T?=
 =?us-ascii?Q?ZUw0ACjS2IlN5/Thsuc9+fR7Wbtfg/PPzXOLipxXHPa6kxEmGNuPstNRe/LD?=
 =?us-ascii?Q?pnskCB7twuD83uyoazE1XQQ6kohXDNymCyUuBwZtQ2v0zQLNG7AWCH1637HG?=
 =?us-ascii?Q?sUul4R+J1prRwOm32n/XcvXMaaKtrOl79I17btUcl/SpC6zuA6vuVCDhLzog?=
 =?us-ascii?Q?6Sq2DQBU1bl4LX3InecS+3BLH4eFGuj4QVB+Rg2Fhmss2a/tW1yerleyvRgL?=
 =?us-ascii?Q?/jPFdkoRiDnEiq3W4cEP+bEmP1TfwZUCvFZJ95FS1dPq6Yelhyf/BsGnZ7pG?=
 =?us-ascii?Q?5L7X837cucWomgNIGqDw6VmHYrHBOG3WJb4RRhyF+yyx+z4jzU5mFG5BzMuU?=
 =?us-ascii?Q?Fz+PyjhYMBTwXBrNF5f66foIKqrE4mwyY3HC3RceIv+uR2lBnOpAWgNEjgk2?=
 =?us-ascii?Q?7tQ5TMfI6NGVwX16zUzXdxp9jj8nEfgxQkWGmGK+2jah7iwbdHnCvATVSZcG?=
 =?us-ascii?Q?BW578XugPRIlwol2CyX5kud7YuqFwhNeMIcPAfdki5rUmRGk8h4qR4UMn4mV?=
 =?us-ascii?Q?PJHqkUp8ox6g2DytZiQAmyh+aW/SgAaocGcL31GoSUGcK1GlxIZbxn8dmvdt?=
 =?us-ascii?Q?JMRlWD1FPAFsR1hJTK2JA6GJaM/mhJhITSzcnctgW48ln1W55A21heO5ff2M?=
 =?us-ascii?Q?GhIM9V5hHu5eiWiifX/JsUL1oV1HhzrnyGENKHBrpHw/Zijktn6wLx4FxX6s?=
 =?us-ascii?Q?BDqteJVyn4YnYf4vgqQGthQhFpFior65JVYMHFKy2J2Y9wccZLpSmrlVjD7/?=
 =?us-ascii?Q?gY/JM7Z2144oF1b3ChoU/vSB5EB/Hl8WECT7OjDx239oWFJ8gwW2sr91a3iu?=
 =?us-ascii?Q?Vwoq8IBg+kIV/bKtW76o/LD4N/pG/6UVMG0gvm9IAVFQI3cQJWd8Jstt9oU4?=
 =?us-ascii?Q?4qmeEtC02/VgUBxn3/uE0QKsX6YA8RntxSNpVo0H3hbAmWBHnC18mB+ZGec9?=
 =?us-ascii?Q?REjfDu6H7UwDkWEnfL6Jw/jWSG7oTNqOlcziRe3GqsqSUWMiYoftdhZ/w+eI?=
 =?us-ascii?Q?hLABA3QZIzcPnekqPM/P2fNUoKqfB9e48kYUVSzylcejbuBaXCmjK0I437AY?=
 =?us-ascii?Q?0pTXk98LAsm5mOy25yUkNv784yJsv3jbxudISQyXhmnO31ejTXhMIaLv2TLh?=
 =?us-ascii?Q?+Fhx+Nsg9PSqDpEp5VnQ17AApUOZOAex14dSfhaUPeElEqO53YZxw315ZIkZ?=
 =?us-ascii?Q?/cYGR15Zl98IrdK+OsIOGlVVnYqVbkNt1aCMZ0J3e0ujDgdhp/52/pHE8ZPh?=
 =?us-ascii?Q?NbsJfdi0hKPTsaW42YX2BgXB4biAYCimc1egHo4eYrrdX8GLKYk7gLuBkH4F?=
 =?us-ascii?Q?4bOUldxtDVTHyfESTkflDz+rrzTJ/5jWoYrf0+F+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 886d7b6f-f804-41ee-5858-08dbff6b2cfb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 01:46:38.7791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwBsTY1SeAP3NxmvxnsWqwSv6dvcxmxYYHWAoxcGjtOjex6oiJXgbsU6ylO0TS68sO3slVFxpPY+E0ukaOdnzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5218
X-OriginatorOrg: intel.com

Hi Paul,

On Thu, Dec 14, 2023 at 06:53:31AM -0800, Paul E. McKenney wrote:
> On Thu, Dec 14, 2023 at 09:25:29AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   48e8992e33abf054bcc0bb2e77b2d43bb899212e
> > commit: 4e58aaeebb3c27993c734c99eae6881b196b1ddb [6386/7300] rcu: Restrict access to RCU CPU stall notifiers
> > config: csky-randconfig-r013-20230826 (https://download.01.org/0day-ci/archive/20231214/202312140939.zA3tdSi2-lkp@intel.com/config)
> > compiler: csky-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312140939.zA3tdSi2-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202312140939.zA3tdSi2-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    kernel/rcu/tree.o: in function `drain_page_cache':
> > >> kernel/rcu/tree.c:2965:(.text+0x5b44): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
> 
> I have questions.  ;-)
> 
> Is this something that I need to fix, or is this a problem with the
> csky toolchain?  If it is something that I need to fix, how exactly do
> I fix it?

This seems to be a general problem with csky arch and it is not caused
by the rcu patch. Please kindly ignore this report and we've configured
the bot to skip it. FYI, some similar cases:

[1] https://lore.kernel.org/oe-kbuild-all/ZX0Vv3IyOi+Bp10Q@casper.infradead.org/
[2] https://lore.kernel.org/oe-kbuild-all/202312152147.JntukftP-lkp@intel.com/
[3] https://lore.kernel.org/oe-kbuild-all/202312160759.X3dEVpgd-lkp@intel.com/

Best Regards,
Yujie

> 
> 							Thanx, Paul
> 
> >    kernel/rcu/tree.c:2968:(.text+0x5b5c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
> >    kernel/rcu/tree.o: in function `kfree_rcu_shrink_scan':
> >    kernel/rcu/tree.c:3476:(.text+0x5b6a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
> >    kernel/rcu/tree.o: in function `rcu_do_batch':
> >    kernel/rcu/tree.c:2102:(.text+0x5be6): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
> >    kernel/rcu/tree.c:2117:(.text+0x5c06): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
> >    kernel/rcu/tree.c:2119:(.text+0x5c22): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
> >    kernel/rcu/tree.c:2135:(.text+0x5c66): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
> >    kernel/rcu/tree.c:2144:(.text+0x5ca2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
> >    kernel/rcu/tree.o: in function `rcu_lock_acquire':
> > >> include/linux/rcupdate.h:301:(.text+0x5cb2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
> >    include/linux/rcupdate.h:301:(.text+0x5cce): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
> >    kernel/rcu/tree.o: in function `rcu_lock_release':
> >    include/linux/rcupdate.h:306:(.text+0x5cee): additional relocation overflows omitted from the output
> > 
> > 
> > vim +2965 kernel/rcu/tree.c
> > 
> > 53c72b590b3a0a Uladzislau Rezki (Sony  2020-05-25  2951) 
> > d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2952  static int
> > d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2953  drain_page_cache(struct kfree_rcu_cpu *krcp)
> > d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2954  {
> > d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2955  	unsigned long flags;
> > d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2956  	struct llist_node *page_list, *pos, *n;
> > d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2957  	int freed = 0;
> > 53c72b590b3a0a Uladzislau Rezki (Sony  2020-05-25  2958) 
> > 6b706e5603c44f Zqiang                  2023-04-18  2959  	if (!rcu_min_cached_objs)
> > 6b706e5603c44f Zqiang                  2023-04-18  2960  		return 0;
> > 6b706e5603c44f Zqiang                  2023-04-18  2961  
> > d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2962  	raw_spin_lock_irqsave(&krcp->lock, flags);
> > d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2963  	page_list = llist_del_all(&krcp->bkvcache);
> > ac7625ebd5f7ba Uladzislau Rezki (Sony  2021-04-15  2964) 	WRITE_ONCE(krcp->nr_bkv_objs, 0);
> > d0bfa8b3c411e2 Zhang Qiang             2021-04-15 @2965  	raw_spin_unlock_irqrestore(&krcp->lock, flags);
> > d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2966  
> > d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2967  	llist_for_each_safe(pos, n, page_list) {
> > d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2968  		free_page((unsigned long)pos);
> > d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2969  		freed++;
> > d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2970  	}
> > 53c72b590b3a0a Uladzislau Rezki (Sony  2020-05-25  2971) 
> > d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2972  	return freed;
> > 53c72b590b3a0a Uladzislau Rezki (Sony  2020-05-25  2973) }
> > 53c72b590b3a0a Uladzislau Rezki (Sony  2020-05-25  2974) 
> > 
> > :::::: The code at line 2965 was first introduced by commit
> > :::::: d0bfa8b3c411e25e014e4131d2804afe29c440a6 kvfree_rcu: Release a page cache under memory pressure
> > 
> > :::::: TO: Zhang Qiang <qiang.zhang@windriver.com>
> > :::::: CC: Paul E. McKenney <paulmck@kernel.org>
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
