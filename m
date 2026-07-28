Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11A8377AB8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 05:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785216103; cv=fail; b=fp5jR9af/WxLXMw2KHLHov/LQ1Wq1zEiJAYcCpccsqfUn4RbU4UKCDptnKQGxtH3/QzF+/2t8oQRZwl0pShE/LaCLcb9iaMe4zSlo0jkpKWfgRVvLWR418yUkejr8D+ZpwXSR+cq5wUMJI40zNsaDw6rGqE8D0vTxJ1daAgQXbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785216103; c=relaxed/simple;
	bh=ppyPWw7qeXqtdZ3u/q30cENYdN7DAtCrz3TATPpNLmI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MTWo65loPZDAIMzvh+qtrlmjYzNhfXNWGIo4+HV1Mg/Z7ssyc2pE0LC73QNf3vit80Zq8F1RIm8ut9Cvl84EmBRXOinpCjybnEVYZmn2DbRVK20Gar/kMzRfTgEUGsx4/mAOK7L246U1a7gahaIg3acLKcI1uxXxfrbqmvkS4LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWtPI4Ww; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWtPI4Ww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785216101; x=1816752101;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ppyPWw7qeXqtdZ3u/q30cENYdN7DAtCrz3TATPpNLmI=;
  b=fWtPI4WwkQMIWvZcciNQ+0Ww8aN59UA9YyrShahXSv5hLV9AbbRK/V2b
   2Wn4jHycwEK0d2ZnIFVRkvxyy+mVd1WJY/vG3Jr8ou6iJHqYy5PKg8e5y
   GZqK8wheEfZF/vakG2rO1UdSjoXb3qQ/2UMkmS3Rcosf7Vw/vqJza2yEj
   yFa3MJ8UHy6JDBqFY/CG8YyFqbMPjOnxjsVRtxIauNLK/ErXDM5so1kmC
   HL7dYCnKHfCBayuDYMTwjvV6tjtvngmGEucenqgGzU1+JcckdmKRY3xhI
   gzqCjYmbJHZ7oSLvDFNBTg8x6TzbG/kl6r6pEF/aCioVo+dWs6aFfq1G0
   A==;
X-CSE-ConnectionGUID: BckiJaRJTQOxfIiIcLYXYw==
X-CSE-MsgGUID: bqmh/AWmTcOFhXlIS0Aqqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="108590134"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="108590134"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 22:21:40 -0700
X-CSE-ConnectionGUID: Q3p5rEjdQ/yWPAVC2twG4w==
X-CSE-MsgGUID: d8aZYWMeQsSa/kpnmJ0TBQ==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 22:21:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 22:21:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 27 Jul 2026 22:21:39 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 27 Jul 2026 22:21:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nw6fOLq/TGFtc7WfhIWy6W7qvuHnm8LSVvdfZM36Soq8pfD4D9y6J0BKOVp7vWQWonYW7zpDVSntjvZU3f66CUzwZNKPUSHXW7HgctUv8h6Arj34Qx+PtR2xLd3KQdXmPHrGUhO0O8g4M6KxWzbh47qirBCP5/BMAzg05xdHmD578N5aFa9W/sOqjYtWl8PiX+6kF0zimzFnDbzl2bdTtvzloVz2mqiS/bIsa3YqS8OsDJbMUoNSg85f1hVLWY+URSYbn9z29UG8Lvmm9sq0z0vymTWXBcL/gT/fQ1TdspV1zxoSHDB52Cp5ZuOCkS7IZ8Sswxn1nyP19Tlh/um0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVSmGRUog27fRDNF4k4juoSnhVavuBzfXoga+9/PhnE=;
 b=od1FEMxtFb/2hTIbcwFiWFfjxYRD1qMB0/9MGnG3Ge1pWBA0iHlXTsj+6C6VJ1d1a+SyRwZ44kN/jM6a/AB6eNARkPDeyfQt+Vps85fj0TMB849MZbEM66xDM6J8aLL/WMbHXNjE1XKr0RGsFsIMeqEu4S8vpY7rXVlUNy5RwnUvKDr87lABDlKgClTj9qDD4mU+BZtMuOZuD8rjS+E7Tpcm571Fuz0pd/k/4t3hvPSYlTs7nhu3mSRPh1eKxPhzNDQeYZslz8Catdr0bIXC9HXuBEY4tEAsFT/M4sNm5Bm7VpfqZv2Kxaq8tjHuHW6x515uu3jJPjgkj600dE2DYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH0PR11MB9773.namprd11.prod.outlook.com (2603:10b6:510:398::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 05:21:37 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 05:21:37 +0000
Date: Tue, 28 Jul 2026 13:21:30 +0800
From: Philip Li <philip.li@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [char-misc:char-misc-testing 1/1] Diff in
 drivers/android/binder/thread.rs:1296:
Message-ID: <amg8Wqhs5paocBLl@rli9-mobl>
References: <202607271720.zYTH7DRy-lkp@intel.com>
 <2026072716-tattoo-praying-ad27@gregkh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2026072716-tattoo-praying-ad27@gregkh>
X-ClientProxiedBy: SG2P153CA0025.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::12)
 To SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|PH0PR11MB9773:EE_
X-MS-Office365-Filtering-Correlation-Id: ee9ed791-4ee4-4ea1-872a-08deec68189e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|4143699003|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xwCfXp6oAwawWmgq10m6dNbpq9Z/Yc6Kb3yUV8HighYI8j03O11aAKau2qB73HtWE2JOCZX7yDefpvhk0vJI3vi13zT8NbW1SmLeYX9ixGGG4pxsoHQs3Vn8F2fecOznRaHK3gqUdGMtrlH1NEmEyEsKObkXwEdg2LYzf5IOyKVz4Q/BcWkdwW9ptA61EXuKf39+V1T0u5tD+5VZ++B/i7XCif0IsgesM9vu3pILHH4VjEFhmmwezTqmZyoEvSmwn8FBIUavP0EPmFzUyoL+h8AEITa1LA6sI8SxmiOeMEnZm9IT3E8/RNCpYIADHMHlg4bCrlaQIA7JcbxjCvpFP2rtrAncQhmvAYaHwY1TeMpB+ZubdsYRUemEXe+NP/LRnLnCuxRQKLcr6Sq8cy4e//rn066ajTG7hFuwM4VagFBklHu0RUbgNw1Xi0i8ud2fLYIF+UwJUUfeQ7w8FFownqFKjrC46GjDVgw5965dXhB+5TBk20yP0DTU83C4sh73eCKJUq6cfgZ7F0r9FlNO6+6jYyfycqwY62YWMxqWL+usPWL+tWW0ZmNA56ChYUCVvsI/uBTrNep8RDaNZC7UyYrIWwvg50wuTwEe1fwt6+Ab3MZan6OlF18to/ei75ii
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/sQTeizYJi9oL14pZjvsBh9Mr1aGHxiPXUXP/LzOl+TlNwlbX1geFuk3V0B4?=
 =?us-ascii?Q?fXy0TPUHG+wq6TG8Mu7Ldq/5UJTFXJ8tNA/C4kMZlOk57p855RszJ164ZHOG?=
 =?us-ascii?Q?/tFwep5WtmQTCyjZUgxszCIMs3X8dEcux1L5+aC2iaU92Mp5iCQGN8vja1gx?=
 =?us-ascii?Q?UxdJr0L5utwDjZiip5KY/jKopWvUrlkTTSGN6qmq1lpBLN08qHhHQKi8dD7n?=
 =?us-ascii?Q?W12OWcyHxy9wLzbmcdhhf7FaVWKFhHzR5E92LXp9Qg1soswrrBnygE2Jpog/?=
 =?us-ascii?Q?+H04ZRna+4v2Vy8e2MG125NlNoHMunIV81NEgFvhvMr9M/rKmbZsBAxIWF7z?=
 =?us-ascii?Q?uYwipsgqvQ4UuFbBXzLYD2AM6yjy5rase1M4ej3nIZcyo5i6G3mOBBPj3QL3?=
 =?us-ascii?Q?EcBFZbjHEuzYEmpO6bw9PdxCYVnDWiEIxxDXbzVOEzBKY2bt9i0BFGbDQrxl?=
 =?us-ascii?Q?bAVl+zqM+gYaBAQ5pXvU40oLvTbb5f3ped6/sTvrsL8ZVuDx0aEu6s5TLrq8?=
 =?us-ascii?Q?PfJrpyXHPbRJJeu26AunLZ+mVM2OTTAT18X/AF0ysUOyryjmVa8KQg5yzzd0?=
 =?us-ascii?Q?fWPgMZkqrUvZ1UMftMgi3g8SgyV7OCA/NzLjAdBOUFFiPcKyaxxPEQMDNAtR?=
 =?us-ascii?Q?8FoWUtJvp2KLgCcRJFeClQECSN7LsQKHexjt2JUkLbwhWeRC7nXY4mQp1i1x?=
 =?us-ascii?Q?1YeJEs3uSaKh0aFHtnpsgjhE1+m5kSRrUZg091er2ealhdoxy62OIDij+uIq?=
 =?us-ascii?Q?EpizGLm7hd2xfo1+s22cwHKcyUKg8ZqDas/FHyiXvajqWf7EB98YkLXMvNzw?=
 =?us-ascii?Q?zok1FriNJ1zZ4927evofHNmvUb0409h0D1jdU0IQVMvpM3eFfQhMiyxamDle?=
 =?us-ascii?Q?d/WBzX8GuzhmnbPCYGhxBugwJXnuL6tMD+e+OCjFmEcx6ViyzvH5BHUrLBOQ?=
 =?us-ascii?Q?gdOptuhCrg7+tCKpxxQwyX2OMeBMaKyVgjWloseirZy0ZeEYhFtoekl38HRk?=
 =?us-ascii?Q?h89mHRyDa5ZKlmylIFQjONCPtNrU28LmF46i8+qRdtE2tuIDoK/DU+V+XaZ8?=
 =?us-ascii?Q?y+dXBAxUPudbdgVb2PdCzz//CJdKPjLrgyXkA/LjWYRNqrD/2mvJig3DpTGR?=
 =?us-ascii?Q?a92n2WGjrEoM5LeAInwxnJcuGoluxOFp+i6w5Ct2VqUs0HBuA85Efy7/wP9/?=
 =?us-ascii?Q?y473YUgHgVE8B48Q0RibD1xVECo7zI/YjxehkA4D3lmlQk0DNDMFqcnsyzy4?=
 =?us-ascii?Q?4EEYZEeKkDcHkwqsVE71shffkS+hTdfij83vriacdP+sFbzLyKfx60GWv5O6?=
 =?us-ascii?Q?iAWBhQOtJPLADh+WTP12Ewf9TWUbrT4xqnO0KjNfGcDUMzMMlP/jS6ZnVdSq?=
 =?us-ascii?Q?U55c98GN8KMykiPEqvB8uU18kNOfA+MF7rLy0emictveyHtTfw9uPGyK10fj?=
 =?us-ascii?Q?tugRSBJSuiSBMp3OruNThM9iXo1BZEfPUT2d0pUNqBy7g0i57LDsxd3GMudA?=
 =?us-ascii?Q?C5IRkp1QNo3UERLI+m06LGBqqpGm4hZkw8jynNIC/8/upqO3sjyyxoHr6WuS?=
 =?us-ascii?Q?UXzAzLDeYnQuqz5oc0FdfIw/dsD0MVL4wtyiy/xJLJhUHQeh6pg8Cn8+lXE+?=
 =?us-ascii?Q?EuMXsCU5+xBpZqahIFsuYoi4TtFfadAjlvu1qd/vCv9rgzguIfDvNGN7g4+c?=
 =?us-ascii?Q?7uSAfpD+0VOc4OB9SQEn9//T0cLQ6RKTrGUlNc9YvBCcC2b7x9W7QvBjoVBj?=
 =?us-ascii?Q?bqi/oK3DaQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: eIQ6gIzf7qW/l0K+dVPUErU8pd6vwrapgK9XK6c8mqEJvL6GuVkE6+mzViLfXkWWfRUY5fmkiXpMg8PdWjYX8uqNk7+7vkq7KfPZgzWyXah4UQv86cjyUxjbFH6ulm9oXGR+MxYSbH9bl6iZWE4oeXoJ+1y0LVWjqWcRcciCjnsfcnIEsgFYYu2AeePCh2HTFVDkDoki1x409c3oMMaTRZEOx+aLGDV5QzYiylCB50Y9qM04T9+toC8/nrT4U4/Tc8ISl0AIP5OpCCu3a7dYfGx6v2BI1bf4L4iFySyJxa5KS+az7cI9UeZCHnHnPXrYKk6tKFGZLr0Z6LPTudVmAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee9ed791-4ee4-4ea1-872a-08deec68189e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 05:21:36.9711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQ8EyGPN1+tk3Eak9JYt3reUJrRp9+BevXK7Z7KX92hOl2vOGzzojMsjzuxGzyz9vQqUdTiOWXUu2z5c02jgcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9773
X-OriginatorOrg: intel.com

On Mon, Jul 27, 2026 at 09:29:48PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jul 27, 2026 at 06:01:47PM +0200, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
> > head:   0957fbab972a9499626ac457fd924b24491c6315
> > commit: 0957fbab972a9499626ac457fd924b24491c6315 [1/1] Merge 7.2-rc5 into char-misc-next
> > config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260727/202607271720.zYTH7DRy-lkp@intel.com/config)
> > compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> > rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260727/202607271720.zYTH7DRy-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202607271720.zYTH7DRy-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
> >    INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
> >    /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
> >    make: Entering directory '/kbuild/src'
> >    make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
> > >> Diff in drivers/android/binder/thread.rs:1296:
> >                                 ExtendedError::new(info.debug_id as u32, err.reply, source.to_errno());
> >                         }
> >     
> >    -                binder_debug!(
> >    -                    FailedTransaction,
> >    -                    "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
> >    -                    if info.is_reply {
> >    -                        "reply"
> >    -                    } else if info.is_oneway() {
> >    -                        "async"
> >    -                    } else {
> >    -                        "call"
> >    -                    },
> >    -                    info.to_pid,
> >    -                    info.to_tid,
> >    -                    err,
> >    -                    info.code,
> >    -                    info.data_size,
> >    -                    info.offsets_size
> >    -                );
> >    +                    binder_debug!(
> >    +                        FailedTransaction,
> >    +                        "transaction {} to {}:{} failed {:?}, code {} size {}-{}",
> >    +                        if info.is_reply {
> >    +                            "reply"
> >    +                        } else if info.is_oneway() {
> >    +                            "async"
> >    +                        } else {
> >    +                            "call"
> >    +                        },
> >    +                        info.to_pid,
> >    +                        info.to_tid,
> >    +                        err,
> >    +                        info.code,
> >    +                        info.data_size,
> >    +                        info.offsets_size
> >    +                    );
> >                     }
> >                 }
> >             }
> 
> I don't understand these warnings, there was a merge in my tree, and I
> resolved it, so where does this "diff" come from?

Hi Greg, this is the result from rustfmtcheck, it sugggests the indent of
this binder_debug! is wrong, thus it shows the diff for the expected style.

Thanks

> 
> thanks,
> 
> greg k-h
> 
