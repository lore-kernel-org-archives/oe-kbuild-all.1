Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DB914294
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 10:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709980655; cv=fail; b=XKT1VeRzFVNQV3uk6ph4Inee3JYiqsk/vzHJR/mu+PAblg24/qGJ8zSvqxV+81E8YioUgzlZLN4ZRQoMLgCnPhWKmAATRb0NoPv5xHTF3OICCoiTDeiLBaJPGDADgSFWdaIV15fta1onq4rVecstcNej1VMYT0DlcpYFrpRBnbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709980655; c=relaxed/simple;
	bh=ncILg97NJTW5yq+LX/3XRbyu5YBmlK8m2kc4as5vP/c=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Rrzg4YuCjlgMDzyjNun1h8VuMSizjLFfmOxe8eJ+BABOLAvB+becBUSnW4Q50zv7UfR7OUvONek6SZ/U9lRvfSBFAei+WaPpad4Bt2epREDHG7SPRENVqK+OMJbM8dacKBcs7TpV3sEZ5C4hdWIgEHQH0xIKL1y0W/8yoX82hKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mj00tg3c; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mj00tg3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709980653; x=1741516653;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ncILg97NJTW5yq+LX/3XRbyu5YBmlK8m2kc4as5vP/c=;
  b=mj00tg3c9+EUMqQgngS7kNxGf0zHs8LdB8LEQ4PUrpirI2QcOV/qbBEs
   hlfDeJPz3ZzGEyMTRG8z1NizLwJESc+xcOW/1i2RzTfAwOUwdAkmZSGkQ
   FPOhrc3e0WRmZZa/4X9bfgG9gaw9mT6G+u9XqYZr9UiTcqsB/7rgyyqGu
   zbVeEdy6kQAGv2kZD/yLvjS2vsOxq0jsqewwygGBWERaYIXm5BBZQ/tIK
   oWSMblFnc0Upsi0CiQq4RJxFvCTUDErZC9YXBaQpNK5JHi/FaMu1k4wxJ
   sLcR8kSJYTSN2Ks6mzxXRBYGEIMgvPK9fSKAgEvMz4Jd+oHHfMFrXsxfO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4831530"
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="4831530"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 02:37:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="15407395"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Mar 2024 02:37:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 9 Mar 2024 02:37:32 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 9 Mar 2024 02:37:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 9 Mar 2024 02:37:31 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 9 Mar 2024 02:37:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqupDN6xFvThd6SYJed0UeF2dFtDCD5gBHUPXg8kH7WaDgAejc6XSqBCdxxGc0dOFefDQIgdtRRB56rMyqY3lhgqsh44nK3c4msfCIQNVXbFEI7W7TIsuTAj7eYvmYn66BJXJHr4jksmuJuW34A0Q4mcV51P+gG/WpeTOGobSky3ayA3OmsMFOPBx+tKF33NYC0Wqe+ScVzjhmf7Y8hvm+PJL1aQ+X9siRMgerjReaSUglYI94ioAuFU/qserCMGxfmCeTK3OjRE7qEtcjzTowxgNhULh4TWVNTy36ekUANjdm3ubHxr63PFpxLnaX3UEBFkLH8+baqzvo6Q+xiLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPEKmU3mzbrlpeoJXLInvT0ZyfS+zS8j628LVsKOdFw=;
 b=Q5G1s42peEKEiPBT22ALPZfSGV07yihQa46Pzu+4Y5SDMTB+Q+AvM+5aErBS4CmFPtn4MTKmtkCZX3nXixxiPx5lHnYPqhwYokxJVoAFfzWClaBNh3GW+1pzWk+YUhjEA0OqqUP98tWAVP+gpxdNXgxet56BxPfoW/Ch2yDZ0IqPgjd/016dQq9wx4gcgUCDcFhhovXdnSRQoBzafDmP0TS99EnVfnyXQqHTSViLdm2/JsWub0PfAr9t8tBFGdWb+RZz56kN01DCXlikI3fz9qTJbo3bu2eMjzdPrFbVv1R9cTuX7zdQz2Ip/XFY3n1WK76WKshbqKb3w2UPLjr0JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by MW4PR11MB6933.namprd11.prod.outlook.com (2603:10b6:303:22a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Sat, 9 Mar
 2024 10:37:29 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::df02:f598:edc:808b]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::df02:f598:edc:808b%5]) with mapi id 15.20.7386.006; Sat, 9 Mar 2024
 10:37:29 +0000
Date: Sat, 9 Mar 2024 18:37:21 +0800
From: Philip Li <philip.li@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: kernel test robot <lkp@intel.com>, Yazen Ghannam <yazen.ghannam@amd.com>,
	<oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: Re: [linux-next:master 1444/12944] /usr/bin/ld: cannot find
 ../lib/api/libapi.a: No such file or directory
Message-ID: <Zew74W3IaHzZzgpa@rli9-mobl>
References: <202403090834.EHWSv1gO-lkp@intel.com>
 <20240309100231.GBZewzt2ueVJcNzZHV@fat_crate.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240309100231.GBZewzt2ueVJcNzZHV@fat_crate.local>
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|MW4PR11MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a88746-f838-4fb9-e1e6-08dc4024eb46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eJqE2Ko6X/lTo0BTFgGApOpBuwIUngccbhebPcc3xM9u/nvVvBmiBgnn60mLPfzl07UOpqZN5WO0DK1ecy2pfZkJtTCF3LbXWNdPllQBOuZQblqfp1TvOW1bvQQ7fR8L2FxPrjRLn7IVggIh1K24sx4rz2HIHmQAKc3UYZsh41DLoFPN/5lw6CfjplucWGIxBb+qkQCkzclqzSXVjrMSVVHML9c9r0LFd6iTj0Dc1Kk7RVHwZDmVwsvjSgqKCnnHqXNeRqOgrC4F2HNS6sqYrtDr9xMLO+UUbPPthVaV/z8RdkGdH6eb4jE7PX+vWOV2a6HSugI90FBoucYwEfyIB9HEiU46oKqs11PUQatINL5uePT5dOPErT4FgkdmFJ6r8a0xqvSPSPCfHCf2K41Ad/tKS9HbzDwfQO30yDP4TMbDOkUHaYjobkg2m680vZxF1y5Gn7jKzKjOXa1S0uDRWOsJlPMYeqJ1U8fOKNr9PczEGY8WPl4OGF+151rMc2ojDRJCJ1mYBK0NK7g78nQXpxL792biecs0ckmSi5dt0uqM6JZxrAzrHYVm2CVj42xJBtUFNssClulptUdv/E8ppBLuKiJnLUj0oQe74eQE/RrRaDxtiHTw4e3L+pOyIo3W
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mkhncbcisnxNJkXOzJ54jDglrTE8ObUS6nVHVBztHfZ0GIsaorFeuJC+9INN?=
 =?us-ascii?Q?VGLh7crkpVolqz3F8ivEi+JVyIbNzg7gliaMGdHDSvV5UnVr9Wjwpiu395Ba?=
 =?us-ascii?Q?zEjVYiW3THKrJrI4V297Pqt6N1QJ2sx+U540h0qKFoZugVE/AZIwVDhe61Fj?=
 =?us-ascii?Q?z8bfozLAb0r4Pe/iurAmJEcUNbCadneInagvB/G5WiCaKTWE0S5oHhvuK+VQ?=
 =?us-ascii?Q?cvo/R2tMhfCrUEWcCLc0BAfGUtTPqMOXclaoPC1XTC977UdDzutvvXseJgND?=
 =?us-ascii?Q?dtUdJNw4I8njVdaoLd6T19FrNe96ufeHmVGeOvzBGXq3GK3GytTgnnv28pEo?=
 =?us-ascii?Q?RYWGgN2sh0/ZVoqc3a+h+Dwwlqa+xvW+lUASeMlNp8rZlDKi23R/f9fuqQoR?=
 =?us-ascii?Q?KILHxDK40bN0tlWB5XnofQ9/Lc/sOwe/U3aKtTKaSBNTmfm7lMEhcaJEfXLp?=
 =?us-ascii?Q?E/3p868vxSR82NN2B56UWmLsEKfNtCDxB0sFApK2lHAoiaStwfdvyoiyrlc9?=
 =?us-ascii?Q?Nn9RREvyt6042hq6eSzKT2Gu3FyPwKyb9GJOnz5vlpTcDxxEasFm9cv8fmxh?=
 =?us-ascii?Q?Lo0Uo19kNNhXbVjwJQj2JfQNvXNjcIlMOuB+RxBrBj6ZblSJSWpFHasF0+1r?=
 =?us-ascii?Q?di0Fx0tpir38QzGm+5BOFTR7CqvQBuD8BOhLYgh74CSlLJtm8rvGqW6XHGxI?=
 =?us-ascii?Q?CHXkmZ7yGPIyCqbsdQrZueayJIasw3XVb+6iSaSaazTbmuj+EB6vNhiWtey4?=
 =?us-ascii?Q?sqbBEGWfVWHGQpr7dhhWNHBippLEYxd/yCmvf/CUCAEJZTeJMY/dgrtLuob/?=
 =?us-ascii?Q?7SZRKwMAOA0AC9lxA8c8IgitQK/aDzASGyVii6U3dm0DTBOln6h9z+nEIlAD?=
 =?us-ascii?Q?1sixlbAmi+VQKH9F2VYUpAnVlh7e3jMOcZIEtk30QXxoZVWfL5wsRmiwYfw8?=
 =?us-ascii?Q?m7eg0hRz0xEJjqEy8vRdhfBcgl9h3SgT0HUzBHIisMZxOnamkB4JcxUBQubf?=
 =?us-ascii?Q?p/cQaNSqREylYejg+Fxc0iu2Gtflt4AXr3xXNEQADv0UeSrAF3O6+L+Xsmz1?=
 =?us-ascii?Q?gK/vt3PFpXi8Zb46dH8XUWYCyz7eoEGyZO5pXPG0S0RlMJm9lHJKAe2FrwjP?=
 =?us-ascii?Q?Cc2Me+vSohJUbI+d1JfLXTxsNggSl0KzuLNR/3pGYRX3yZzxIDqi87NR73AO?=
 =?us-ascii?Q?/0om0s8eVsfO/Iu/kq711d89Za4oDJ6/aqZ0nKPJjhKUYVo4RqK9Z5pFXA+V?=
 =?us-ascii?Q?sUPKsGkUQMPPOqYt0R14VzauWHPOlAI98twmL6kznKhXSzECc5vw9eWLhyqB?=
 =?us-ascii?Q?4Wr/UOoq7Z5bQek7q81J4u7Lm1l9I3pWi8Tq4EhBehyn8x7dRSJ+COvIAJN/?=
 =?us-ascii?Q?/5i5bSF/+i0G4QIveoI96kH0Ka09n9Hpd6bJD8488s039yNxhc72Ei+DZ1hp?=
 =?us-ascii?Q?RH6Pju3B20u39Id780ipXXNOTrof9Jn8ROMVsrTk1lKjEEC5mkZebyPvzL/F?=
 =?us-ascii?Q?zV5qwNpknf3A7ZC+3PUKPKmZFGmB99zW7SMkJzNwteaEVlS6G/W4Hm+kSVGH?=
 =?us-ascii?Q?nf5SlL0/I1SXd5aIooFGFRpKdqEydEiBKCUkiRvr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a88746-f838-4fb9-e1e6-08dc4024eb46
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2024 10:37:29.3219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5phX0hsxLoUb+BAO3e5J+wwzbITTf/Poh8ZtegsOFGuwiVoGxezhIkQxMCPLbrKZDJUUw8E3NKgpvL6D3AXMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6933
X-OriginatorOrg: intel.com

On Sat, Mar 09, 2024 at 11:02:31AM +0100, Borislav Petkov wrote:
> On Sat, Mar 09, 2024 at 08:51:23AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
> > commit: 3f3174996be6b4312c38f54d5969f5d5b75fec9e [1444/12944] RAS: Introduce AMD Address Translation Library
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090834.EHWSv1gO-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202403090834.EHWSv1gO-lkp@intel.com/
> > 
> > All error/warnings (new ones prefixed by >>):
> > 
> > >> /usr/bin/ld: cannot find ../lib/api/libapi.a: No such file or directory
> > >> collect2: error: ld returned 1 exit status
> >    make[3]: *** [Makefile:22: page-types] Error 1
> >    make[3]: *** Waiting for unfinished jobs....
> > >> /usr/bin/ld: cannot find ../lib/api/libapi.a: No such file or directory
> > >> collect2: error: ld returned 1 exit status
> >    make[3]: *** [Makefile:22: slabinfo] Error 1
> > >> /usr/bin/ld: cannot find ../lib/api/libapi.a: No such file or directory
> > >> collect2: error: ld returned 1 exit status
> >    make[3]: *** [Makefile:22: page_owner_sort] Error 1
> > --
> >    In file included from commands.c:10:
> > >> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
> >        6 | #include <netlink/netlink.h>
> >          |          ^~~~~~~~~~~~~~~~~~~
> >    compilation terminated.
> >    make[5]: *** [tools/build/Makefile.build:106: tools/lib/thermal/commands.o] Error 1
> >    make[5]: *** Waiting for unfinished jobs....
> >    In file included from thermal_nl.c:9:
> > >> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
> >        6 | #include <netlink/netlink.h>
> >          |          ^~~~~~~~~~~~~~~~~~~
> >    compilation terminated.
> >    make[5]: *** [tools/build/Makefile.build:106: tools/lib/thermal/thermal_nl.o] Error 1
> >    In file included from events.c:10:
> > >> thermal_nl.h:6:10: fatal error: netlink/netlink.h: No such file or directory
> >        6 | #include <netlink/netlink.h>
> >          |          ^~~~~~~~~~~~~~~~~~~
> >    compilation terminated.
> >    make[5]: *** [tools/build/Makefile.build:106: tools/lib/thermal/events.o] Error 1
> >    make[4]: *** [Makefile:105: tools/lib/thermal/libthermal-in.o] Error 2
> >    make[3]: *** [Makefile:120: all] Error 2
> > --
> > >> thermometer.c:21:10: fatal error: libconfig.h: No such file or directory
> >       21 | #include <libconfig.h>
> >          |          ^~~~~~~~~~~~~
> >    compilation terminated.
> >    make[3]: *** [Makefile:23: thermometer] Error 1
> > --
> > >> Makefile:65: warning: overriding recipe for target 'emit_tests'
> >    ../lib.mk:111: warning: ignoring old recipe for target 'emit_tests'
> >    make[1]: *** No targets.  Stop.
> >    make[1]: *** No targets.  Stop.
> >    make[1]: *** No targets.  Stop.
> > 
> > -- 
> 
> Does a human look over those reports before you send them out?!

Sorry Boris for the wrong report, we will investigate this ASAP to fix the bug
in bot. From the reproduce info, this is related to "tools/testing/selftests"
build testing but wrongly bisected. Apologize for the false report here.

> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
> 
