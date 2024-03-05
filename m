Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9DD5676A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 14:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709647962; cv=fail; b=uNrUQVY6IQqEuuvo9G7hvRRktdyOaMx1YnhbySh+emosEf411sxlGJIQlBNYI0YBKdNe3FLfmebuAFtXCBds0FmTI0xl/3/wZ4Lku8vlRV9hf75x3o9vX7Msq31uq4zechJH85F9L5AO9GRT7uUCnLvja53xEFIRJuBIVf5D+G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709647962; c=relaxed/simple;
	bh=/3tAGUnHnEgNLMZFfzLb2xAHKqaI6I3sYjUp1yTNpYo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RXdfN8pnofRIY+0sBCEpZRfnpH/yRkDt07txXsXbJdEaY1RUsiR+q/0XdDYmb19Gk3OlR5ktH0D7Dab1/C2JzW5MTapUrALbWuE/iZ3ceoytAtbavraAxaZsqLsmhpSA/YQZUKaabGhbYo7V4PzP//+GSJ8HVy2XKyQDtl/nRss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dp8URWxP; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dp8URWxP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709647961; x=1741183961;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/3tAGUnHnEgNLMZFfzLb2xAHKqaI6I3sYjUp1yTNpYo=;
  b=Dp8URWxPV56HJ6PJyizB2npWLNrOi7l60rEC0XoHHOxdT/gVz3LrXn7/
   YEuHXg9Z2SXXNZWDLxQLQkBhCJJnfWiaP2tyjqCjD8UrVd3udOWiKvB5U
   H1G3Pz+yUjZr2DKgdfVOOikmctL6cSQ0PWtLpg4Nqbsq965KPq5ho7Wxv
   s4C97PL+WYQ+6rncRpqG1M5aXFJP9cQQ+pBa1G41k57OkL1djOR/3ezFF
   PDJpS2f6pQ3uJcP2TwTm91NfD+G8pKv/EFQhw+x6PR2vpBfgW0piLa4Th
   t9RXHWrlbPJa+Xptt90NsmlV7mbH+ePp3goSycS+33ycr3ISJSW0NRTIt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15629117"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="15629117"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 06:12:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="13873382"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Mar 2024 06:12:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Mar 2024 06:12:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Mar 2024 06:12:38 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 06:12:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=npnIKPkiDCale1kp0VmRXJeSJXWIGZvuhvUEl+vPby6veHqfe6pLlJDhfZ5eo3cq11j48/GO8c+7D7cxYBh8AmYYKXfTm5wQS94e80SXaxR3N4BXTB/p7xb3BhfWqXZkZHRVLbIMDXGZD00vz80duDIcu0opHwN1f2Czun7IX1KisFnbr3gItZoE2zgi2WcZYZLSzpDdTvv8regAfksr+1lr/rmbY+0HAg99nShyeItCBGXHow6r3ADPA2Y8xPGa1e9spKnkdv6XP8NiENsakEbgzIQnS35eBd3S4yBqBpgNGGip6N1hYVUZhmlsdDQflvdPq7teHi+roCFtQAJW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I36yKVjZ9NqxDLitAbSByHzSV9RpD0Xr8n7TxeUvsxI=;
 b=QBu2U27nIeYpXbT5bLqCqNTn4UrMluj/JtixQ/YCPohi69Wnceuc7TsdXYKizsHZjjxWoAbpe35uOPPItTjanHeSfX+rOea2L/GN/7SCXabUkg1etT7uzPYpSa3/D8/Aok2cCg4buAPQSjpBy7zjmtgn0vanaPfXREPF45ZO6l5Ays5bIk/HljNbAmPCxF9UVPyvuTtRNqEbFCV2dcHUEeB8Gg7eIf0Fv50OfZw3M55sGup/gqwc+Y0maYdWi8YTt9tV0or7tn8/U2s8PB7Eg6niBdl/V9dvqTGpj8hmmROdMrzfCwGhoeHAWauxd8FXqiEYhSuBtwI4ABFL3XhC/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SN7PR11MB6726.namprd11.prod.outlook.com (2603:10b6:806:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Tue, 5 Mar
 2024 14:12:36 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d%5]) with mapi id 15.20.7362.019; Tue, 5 Mar 2024
 14:12:36 +0000
Date: Tue, 5 Mar 2024 22:05:46 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Shuah Khan
	<skhan@linuxfoundation.org>
Subject: Re: [linux-next:master 10409/11394] ERROR: modpost: "__fentry__"
 [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko]
 undefined!
Message-ID: <Zecmuk1OlU7VO8Bk@yujie-X299>
References: <202403021440.Rs4qG6fP-lkp@intel.com>
 <20240304122921.31671-1-mpdesouza@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240304122921.31671-1-mpdesouza@suse.com>
X-ClientProxiedBy: SG2P153CA0032.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::19)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SN7PR11MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a35891a-a984-41af-ea16-08dc3d1e4edf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OBFYFkh2NYKHbQqLUi/bF5qYA3A4io2aUQ6gtMy1HsU8p13itvQiBEu169rUeraR7q3tkR+hSy3uzaEG5ixhkMDWQxWi4480mU0OxJaufYGVTGCTLag0FiUOegedoD3E9PMMLoWvud5+4dsg1ftaS0YCM39LMwOc5kePjtaByP4BK+cvfE55+Cp4pa6yWHVr4k5R+wf/CqEpoHFBJuYeUK47O9s7u5OTH6O6dN4svFvptZiuWIbtP7UKnpJ41dSbh2uIrYGHnV9tSJ1XvfMoA8WjRhenUM/qTORjq+P/cQOpmy6qZgkpnEXUg9H6FZe9dY/DTO0WMg7vnc5iGv9QVxK83NfnfTDvi3gmWObKP+EfhgE3vHhNuSWxbLcZ7wXwmNLtgqBKysnxWlNln1OISc2Cv6EEnRpZigaIQkfaTWYA+vElNes18656aFDkNi0hK/trYujaKcmTnRUrK+OE+dAbS3Rk2285FM/q8YUcuG4A96GPcliQ9RqcmToZptehbbYZUrtKZ6DuHcgBNmgcEFozk9UQPAdSdP9zxm6aT7Jv2c5HERc2pMLi/hrg78wKqkHVPLMSn+M52vfpZ39c0xvcZVVfba9ULRgY9/l3OoE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Op7EAD2NdhoDFrw8yLaMGjGyBXYOGJYf/YTfYxP1RirkJn+/A7k8Lckstahf?=
 =?us-ascii?Q?tlfhj7lCXBDaQg6EEAU1vd1Xzum6QAxC8iJy4N2oLZQP9f8YH3MUgscSZyIO?=
 =?us-ascii?Q?oXR27VQ+sB0B+ttxGvZP4xVDotT6grFHd4kDqbN42U3r+a7LoewBGdb0x2+R?=
 =?us-ascii?Q?sMmnA+bEUOyk6QMy9r2hwoBMuqnIafCYeLkXjoIocVLp6yV5zrxZ+XywXG81?=
 =?us-ascii?Q?fHjSs+UkwH5EAONUPMD3Cp7jKg8SGyLjohf5bdthMFGQWZHgMU1cvqMQfx3/?=
 =?us-ascii?Q?9m9PqzARJDx9eZkIttSKCBMrDJYCMxX4vcIGubY4XAO++NjCWj6sYhxnqpqV?=
 =?us-ascii?Q?RjsM4SmM7+1gNPWZvfIYVEBlcxEnLyvW5W7okRYZrihDCXF77LdKZWHDoo9Q?=
 =?us-ascii?Q?hZXoRyD8pPSCpS9xgJgpp12hsuBUHnNH1SrVhosZJuFiq6c1+JZUZLHAFN1z?=
 =?us-ascii?Q?5BIWpDyhUOs7BpgCY1ez0gs0qz5PC9nEpp0RYf1Iyi05lfGKqMMnxM3LHc9p?=
 =?us-ascii?Q?FZFbQ2cJaKQuL5IwcI/9HqcSWpgHtb+a+yKbUrfP2/C9X6fJB7cCI5Lg0a0L?=
 =?us-ascii?Q?vHAUan3cLoNW8cft34awy5aNZMYBsyqIqjv6FcLfwtcOVC9TRZp9uf1MhxMW?=
 =?us-ascii?Q?HmybByZ48T/2w63h9lpzUTIOOTuHZK1hysoF/8RJgYKGP+F4HXh4iG5aHDe9?=
 =?us-ascii?Q?eLckJGY4zrraAf7rsjhJBv1EE+V0ZK/taxdue4nlV1tB5/yXw3VyFXpRI2Kb?=
 =?us-ascii?Q?zRN/+D8rSznK3555Rp17KhQEa/xUTpzYWP90wUl/g6ppdpA+ylc6tBAklx0J?=
 =?us-ascii?Q?yF+xc9ggoqd0yuD1QgTWGXmSRIkeSrl3ae26/ZDzROQOZmmxuuIdwlDYe1JR?=
 =?us-ascii?Q?Qo4ifubDkeXfXxL2bW0t0AF8aZmD2S7doDNrpqYXVa2L0vx4ixG43DeedGmM?=
 =?us-ascii?Q?s3XP8QO0p0W3qgtbyet4oYLN43MlxJDF34LKpl967f/WEVAus9Jb1lOonfSZ?=
 =?us-ascii?Q?v1mmqiqbZ+IbIhrV/HH1+l/H+yycBeo3FVV3N8fVIpHLJyKc0KKALh3MwL2M?=
 =?us-ascii?Q?i4gsJb5zPCLv0GDPNWnnQ4x7wdMTmnUIcTgo08tumE2T+oWMwzAW15nfahV2?=
 =?us-ascii?Q?QdF0a5YsnKpY6f4mJHqRyBE68W6RtWJNEkwQPOaC23wzXdFgcW5JwrPFXvnc?=
 =?us-ascii?Q?bJi0vNaRdVvGX/RWx/bch6xOiHo8Wxx1Kw8iX6HCNCFD9q/13jmNryK/vwvR?=
 =?us-ascii?Q?LJdYV1W9PW1z0iTkwrWaU+S6aTW+9yqOd7wPA5OVhR30owIlwubraUMBkvoP?=
 =?us-ascii?Q?6qm5QwI/3FR+2TQtayg1O4rr81MwzUMNJIVHpfBxJy+Aw0pLEh4a2HcOT5Qv?=
 =?us-ascii?Q?uMquC5yM41dc0mwvOUzthv/nprNVxFfkDR95BBv0r0rdJEHgVx+2tMYN4Im2?=
 =?us-ascii?Q?jBhQdEzL9BJ1n8w2p3Dm99CcM4H6F9bCcXyvrq+MBZMeqqqnnMtAc9cu3qXr?=
 =?us-ascii?Q?ql/NBmcmO94CGdbexIdkTaRerrbWWAs/kij62T6rCgIdot6mQzDu5Vh/oRtu?=
 =?us-ascii?Q?R5QFjK1KplCdtBjkggFuHWBNAGk0UiKbJJs7i4G6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a35891a-a984-41af-ea16-08dc3d1e4edf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 14:12:36.4217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nE1EJdCREol9sgUsvCx8lEyTmv5qI87sI9VXhX4/wcxdn+qn4pAHhnSTxcnuKtTX0bAKHwk8UPahbInsLRrw0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6726
X-OriginatorOrg: intel.com

Hi Marcos,

On Mon, Mar 04, 2024 at 09:29:19AM -0300, Marcos Paulo de Souza wrote:
> On Sat, 2 Mar 2024 14:14:12 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Marcos,
> > 
> > First bad commit (maybe != root cause):
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   1870cdc0e8dee32e3c221704a2977898ba4c10e8
> > commit: 539cd3f4da3fdbe7dc353634e004e4b0e725c35a [10409/11394] selftests: lib.mk: Do not process TEST_GEN_MODS_DIR
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021440.Rs4qG6fP-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202403021440.Rs4qG6fP-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > 
> > WARNING: Module.symvers is missing.
> > Modules may not have dependencies or modversions.
> 
> This seems suspicious. Can you be sure that kernel-devel was installed properly
> in this machine? We have landed a patch to skip building the tests if
> kernel-devel is not installed. We check if /lib/modules/<kernel-version/build
> is present to start building, but I would expect Module.symvers to be present.
> 
> Please let me know if we need to adapt our tests further to avoid such problems.

Sorry, this is another problem due to the different way of organizing
the files at the bot side. We are looking into this to put the required
materials to the correct path. This report should be a false positive,
please ignore it.

> > You may get many unresolved symbol errors.
> > You can set KBUILD_MODPOST_WARN=1 to turn errors into warning
> > if you want to proceed at your own risk.
> > >> ERROR: modpost: "__fentry__" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
> > >> ERROR: modpost: "klp_enable_patch" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
> > >> ERROR: modpost: "seq_printf" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
> > >> ERROR: modpost: "param_ops_int" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
> > >> ERROR: modpost: "module_layout" [tools/testing/selftests/livepatch/test_modules/test_klp_atomic_replace.ko] undefined!
> > >> ERROR: modpost: "__fentry__" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
> > >> ERROR: modpost: "flush_work" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
> > >> ERROR: modpost: "_printk" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
> > >> ERROR: modpost: "complete" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
> > >> ERROR: modpost: "msleep" [tools/testing/selftests/livepatch/test_modules/test_klp_callbacks_busy.ko] undefined!
> > WARNING: modpost: suppressed 80 unresolved symbol warnings because there were too many)
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
