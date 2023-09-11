Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4D0C153
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 13:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694439864; x=1725975864;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8WP2bwf3rQmZ3hGBIkoXiXblb3vnwxn8d7ivwF9XR2M=;
  b=Wk2xggURqA1nVKwIl/y0Eu/QRyE6e7/WC+qI2X9SQ3wYX1M/pJ4ws1om
   t3BJVVklSzmv6Rq9I/DbchrxY4rMZpAPTsuC6iN+b9OAiLDJYIMR6AVV0
   +aqa+XuMLCoL3AWdU7e6544n+FkwfxZjbAvwJlaDGTvwiyXrn4HsR9ZIT
   ER9XvOzfd/0pkm1SC6Tv984hKdC8o/eHF1t8jcHmpBA/eEzq/AOaalO32
   lqRFvsFOHyclrDPtXyDKxn8VKL5/MbUrh+JMKdO4B2BL+adn/Ks9DmpNS
   DYdU10udUon06JVyTdm724kpdF0plAdQfMkWzH/617p09YqcZejp5Sag0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="380782100"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="380782100"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 06:44:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="736775309"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="736775309"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Sep 2023 06:44:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 06:44:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 06:44:22 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 06:44:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPbVic4/DsPGxsrdZthQEaU0YufgzJhVTvOL3CtX8RXeB8q6XcRTAA6cVZBZe4p/+27IiTw1DzlS9sqoRFF9hJgVdaS2gYqvJjuLvm+Yfs1crDVV8Jg4JRWEjK541JaGE0HfgWB9sM4gtLzxjTAYua3vn4iayQzTM9w3iTEBBV5gRsFy71iOwiUnWJsyujZSeglH4kqdAQNFRM/aKKWcIJ6AvdQXXckTs6mJODyuIa6+n/oqXPqS1b1xqbHQa/MSQuNq0p+XToMiP7O00nxE7uOSIB0xdgKxczWY2TivrM8vWWZmhizcwPq72IbDfiXtiUPQM2O0rr1cuKRt3b+Fyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=556B8uDWe17APHWaEAThTV4Rr5Z4PnOgcExqKW17Cdo=;
 b=lMKFOLHTKlckrYaPRm8tFAg1XyZZ+AbvdoOjMtr7Pp4Ve1wxaPnh+z0r24/Wo7IlfPqNumKdh0YCpsLGSSTmQhxxeig0s41NphcA/mXg63mqq4Dw966tFaKNb2nsMllJ8U7PNIIUiHDmSHP54LNVpMPUwjwNkZvJDqDhUWWzULFOpVm3zDOGXfGCJ7sC7HgwWy2/YernDZDLLcgSTzIR9OZMNDVP7I6z2gcSVewXNzGMOqBSfGW9e7K05n4yFfbXckLDfSLfCi8vxMag7ALNiZCMF8p9aw9bdfyztqLQecAWem1Lc3HJ7CQz/HmHnf/80DfyJhdNVZb2GCcJeLBDHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
 by BN9PR11MB5243.namprd11.prod.outlook.com (2603:10b6:408:134::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 13:44:20 +0000
Received: from SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d]) by SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d%7]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 13:44:19 +0000
Date: Mon, 11 Sep 2023 21:44:09 +0800
From: Philip Li <philip.li@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
CC: Eduard Zingerman <eddyz87@gmail.com>, kernel test robot <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [bpf:master 6/15] htmldocs: Warning: Documentation/bpf/btf.rst
 references a file that doesn't exist: Documentation/bpf/llvm_reloc
Message-ID: <ZP8ZqUjWHSowCYlJ@rli9-mobl>
References: <6a92003b-e47f-01bc-57d2-d2fb30292ad0@iogearbox.net>
 <a62b47218f1852d09b243b8fb1741c2baca4d336.camel@gmail.com>
 <5009129a873cf20adacd679d5073c799f79672d2.camel@gmail.com>
 <5ce81342-c565-f7fb-1c93-ec4eac8944c9@iogearbox.net>
 <86cd932cd5a6ecf44b3d4dfd2b9446bd721d9e78.camel@gmail.com>
 <ZPHXqAUX6aLXp9Dy@rli9-mobl>
 <d4c9c399724d2465945d432ce658ff2d9baa296f.camel@gmail.com>
 <ZPHaBGXnnNI5AX3y@rli9-mobl>
 <43eb35e8-c00a-22e9-b4a4-dd54b1fbd63c@iogearbox.net>
 <ZPHftmH4tvcYObbc@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZPHftmH4tvcYObbc@rli9-mobl>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3006:EE_|BN9PR11MB5243:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f53722-98af-4145-c141-08dbb2cd329c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EFY86zaUr4pTSF3wrPTMr7W8ELoE/10hV7eoVpZXi6tsPXGTki72JHUILTGbb6URMvTlHsc53wONERk2i0JgLUb6eW6HgxPvXD0Q4Ry4ICqtah+1nOA9BKcVLNn+onzHbYX2LyR+8ZpdQkBbrR+1TAz3OJp/MZq78ipJjwj8H3pH+gphDYoqUZTLUaS5u54zoEOhVTwroclFeiO4TkCBajLMyeQkXlZxQqRjU8ZhBldhFi/sSDWiQjBqKttRDbo2RbUtNEf/6iTKc3yO9Sse8mT9KanWwBRiQqnv8kNNZAHDOShB8kLOYkDQrZ0+ev/m9hMZgwA/1T69jJaAAjD6G40/kkggIVM75mEeXnIwnJxaJfnTjjqTusrDBiWNB+epjFnvX9ZfVcG+iIbzp89jVoqUKG2WQuWIoBqm5Y+Jlx/dXsmbC7vY6Dhku8tLllrBECo0jsgZedjJQgmrKhMC97vcFFCGCgrxkXRugWr3fIveW0cewSgII65YxKwHGNWJXKq4c9otlVZxTfLN6JdGeIXGMow9ANkDZmdKXx9iQxEl9/EU/i8IcYbRH6hapxn8Y3qEwKJFpY43GVIE18oCsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(346002)(366004)(376002)(396003)(136003)(451199024)(1800799009)(186009)(6506007)(53546011)(6486002)(6666004)(966005)(6512007)(9686003)(478600001)(83380400001)(26005)(54906003)(33716001)(44832011)(66476007)(66556008)(66946007)(6916009)(4326008)(316002)(2906002)(41300700001)(5660300002)(8676002)(8936002)(82960400001)(86362001)(38100700002)(66899024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L1kFy+Sd9ncWG7i98vhG01AkmZWfcSBJOga55Cb6dD68qm++/j3JJ24Ma5FP?=
 =?us-ascii?Q?gbwhDW2rToUvGppLoVZGhlGfMAqA387dnPJDZiwoNJjZnGQzQ/WmUkfXQ18e?=
 =?us-ascii?Q?gXw7ZKxJi11nFKn1lDQqknI/YUh5XI2sbU1Oin96T+4RcpYsEUsDt8BGFhmQ?=
 =?us-ascii?Q?Wlgx2WrMkqSYXOYhdFcJwVXHlTip1y6WHjtbEC15r5Azi/l3BGyzbwLd5ddm?=
 =?us-ascii?Q?IdoTFsP2TIyOGuJ/h7MVYdONunVvrpwByyx4ptvHLTR501ZujBmzYXLR89bS?=
 =?us-ascii?Q?RGgjBOjAId7cz7jlib0LK5SyxnXyoKy2m+gu84gAHc8jMYu+v3Ia6YlDepXR?=
 =?us-ascii?Q?y13msH4lZBk6Zujw4mp2ZMkjR1d5wT35QXLgaEB/BCYRnDI2uG4jJO4aZNQ8?=
 =?us-ascii?Q?LWmO1AvrwzClo6tT/UjyjYLQWJeEFLF5WOfzqxVxhkbqMxeIdjb+xY83FRIT?=
 =?us-ascii?Q?vKuF7srKK0NOqB9OxxNI+kLXRb9s20WfZVVCRFibXmDiIZ2HLzTC73K2a8PH?=
 =?us-ascii?Q?Qhr5gv5HooDZR4Gp15/vqKMP87OAXKVlhfHqh8d1syjFlP4DyoQNWZNna80c?=
 =?us-ascii?Q?dHjZKu/Z9+C9Ia4J+oiaNTg5ZtwpQm5raxoSoO1qhMcv6OdcHgnXICfi/KRC?=
 =?us-ascii?Q?VfTOG7bHrAl0lUfwU4qpHAeftUiEhmiNkpnjKj7/BV4nCg/gpDaP6kgl2xss?=
 =?us-ascii?Q?Tshn5mDtsjCJQWl1LKyig+d6Q4OWrysncj+eIPKOl34LWAmKS7kZAJt2GXxQ?=
 =?us-ascii?Q?TZBpxaHI+jGLkPFMcZ3mkWKbSGay9TwibtwF3GIElWuxCGeNl6mhyGwrjuJL?=
 =?us-ascii?Q?b0m2GqIMOw627BoOts1tarZORh00z6ZEnuRzYO+c4W205/5Kw4cL8Wv9qPAS?=
 =?us-ascii?Q?TlEgbYPIpVCm5H1bEYRZ5cehiw5wC8ScIuySrpOyE9nX7utLcwmFEjJYouxx?=
 =?us-ascii?Q?iiBBalwE+YR5rePV0c8BALaaN4DzH5tjgUH/ypJy3JvNmVnuz9Fr3ra48uLG?=
 =?us-ascii?Q?LUebAF6qbCDmDAayyAjkYZKWENpOrzknVXzxa7dwXs2kzbdbxdmTLqf4pwZG?=
 =?us-ascii?Q?a6vLqPSrNrycn8pgOBVvSfPkwFU/dqsl+0ZzOd/P6eM07dt6xMwjp+9H1rLZ?=
 =?us-ascii?Q?Q5t+dLFrZ3hBqIsPgbGnefvak1f/JezDHFibjZkX4nXFOfcv7Y6c37NuZgvK?=
 =?us-ascii?Q?uwjrXcAlLf1UECPAv2+NJIfXyofEspJqcfWxt4TBECcm+tEjqfkkIiB42Ylk?=
 =?us-ascii?Q?hDaoFKawiRzm8AhE/ZXvC7zsx9CDgZ9cAXA97ikEBgq8h6lWxSlZveWwimsl?=
 =?us-ascii?Q?HsvFxXGw5BEmHtILRHwGIhCMjlpadUuVQyQoRJq638QrXqf9xNTgaYyCrv/s?=
 =?us-ascii?Q?hYD7lkAYmROyrtrl/pw/TGSDEbk3k0zxSYwDkcy0b2Kkp4/Az+mnGr9ecd0x?=
 =?us-ascii?Q?ywPyVuCShgfTIIMUimLZDe2TveDW6S97dN+VNJvGejxFpbw4orXVWZ7E1fs1?=
 =?us-ascii?Q?8rSK1Z5B/5P3WqZ2Hi6/NX9Cpx9GOaBfogBuWIfhYH8U/becjoaFFlZ760YC?=
 =?us-ascii?Q?5tSLHqQLmfSSQjnuaSFVTZ2G6WDjtM8LiDa2+F/T?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f53722-98af-4145-c141-08dbb2cd329c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 13:44:19.6275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMREJqgZCBXQ4H3xXgasSGEmm4H3WS4yzNZnCwqjMlDgXX3DMJyOYVsZ2KrEsYejjzWlHHRzdybeSDdz7C3ajA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5243
X-OriginatorOrg: intel.com

On Fri, Sep 01, 2023 at 08:57:26PM +0800, Philip Li wrote:
> On Fri, Sep 01, 2023 at 02:49:32PM +0200, Daniel Borkmann wrote:
> > On 9/1/23 2:33 PM, Philip Li wrote:
> > > On Fri, Sep 01, 2023 at 03:27:19PM +0300, Eduard Zingerman wrote:
> > > > On Fri, 2023-09-01 at 20:23 +0800, Philip Li wrote:
> > > > > On Fri, Sep 01, 2023 at 02:48:26PM +0300, Eduard Zingerman wrote:
> > > > > > On Fri, 2023-09-01 at 13:22 +0200, Daniel Borkmann wrote:
> > > > > > > On 9/1/23 1:18 PM, Eduard Zingerman wrote:
> > > > > > > > On Fri, 2023-09-01 at 12:26 +0300, Eduard Zingerman wrote:
> > > > > > > > > On Fri, 2023-09-01 at 08:29 +0200, Daniel Borkmann wrote:
> > > > > > > > > > Hi Eduard,
> > > > > > > > > > 
> > > > > > > > > > On 9/1/23 2:05 AM, kernel test robot wrote:
> > > > > > > > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
> > > > > > > > > > > head:   be8e754cbfac698d6304bb8382c8d18ac74424d3
> > > > > > > > > > > commit: be4033d36070e44fba766a21ef2d0c24fa04c377 [6/15] docs/bpf: Add description for CO-RE relocations
> > > > > > > > > > > reproduce: (https://download.01.org/0day-ci/archive/20230901/202309010804.G3MpXo59-lkp@intel.com/reproduce)
> > > > > > > > > > > 
> > > > > > > > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > > > > > > > the same patch/commit), kindly add following tags
> > > > > > > > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > > > > > > > Closes: https://lore.kernel.org/oe-kbuild-all/202309010804.G3MpXo59-lkp@intel.com/
> > > > > > > > > > > 
> > > > > > > > > > > All warnings (new ones prefixed by >>):
> > > > > > > > > > > 
> > > > > > > > > > > > > Warning: Documentation/bpf/btf.rst references a file that doesn't exist: Documentation/bpf/llvm_reloc
> > > > > > > > > > > > > Warning: Documentation/bpf/llvm_reloc.rst references a file that doesn't exist: Documentation/bpf/btf
> > > > > > > > > > 
> > > > > > > > > > Could you send a follow-up fix for bpf tree?
> > > > > > > > > 
> > > > > > > > > Hi Daniel,
> > > > > > > > > 
> > > > > > > > > Will send the fix shortly. Strangely, I did check this syntax locally
> > > > > > > > > before sending the original patch, and had no warnings reported.
> > > > > > > > 
> > > > > > > > I followed reproducing instructions but can't trigger this warning,
> > > > > > > > tried several sphinx versions:
> > > > > > > > - 1.7.9
> > > > > > > > - 2.4.4
> > > > > > > > - 4.3.2
> > > > > > > > 
> > > > > > > > I'll remove 'Documentation/bpf/llvm_reloc' and 'Documentation/bpf/btf'
> > > > > > > > labels from the documents (and these are link labels, not actual
> > > > > > > > links), but it looks like I don't have a way to check the results in a
> > > > > > > > way compatible with test robot.
> > > > > > > 
> > > > > > > Strange, perhaps LKP folks could chime in and provide some more guidance e.g.
> > > > > > > wrt Sphinx version.
> > > > > 
> > > > > sorry for late info, this one is using 2.4.4 sphinx, the full make command is
> > > > > like
> > > > > 
> > > > > 	make W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 SPHINXOPTS=-j1 htmldocs	
> > > > 
> > > > Hi Philip,
> > > > 
> > > > Thanks for info, I'll keep 2.4.4 locally to be in sync with test robot.
> > > 
> > > You are welcome. For the robot side, we actually read the version from
> > > Documentation/sphinx/requirements.txt of the test commit.
> > > 
> > > For this series, it is 2.4.4. And we also support other versions like
> > > 1.4.9, 1.7.9.
> > 
> > Side-note: @Philip, if it's not too much effort, would it be possible to add
> > version info into the reproduce file as a # comment in future?
> 
> Sure, we will implement this early next week.

Just FYI: the latest report with version info can be found at

https://download.01.org/0day-ci/archive/20230910/202309102306.O46hkAzJ-lkp@intel.com/reproduce

reproduce:
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree hdmi-dbg
        git checkout 1eb159538ab221d1ffb1002a0cf8585906e75ca0
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        # install Sphinx 2.4.4
        make htmldocs

> 
> > 
> > https://download.01.org/0day-ci/archive/20230901/202309010804.G3MpXo59-lkp@intel.com/reproduce
> > 
> > Anyway, thanks everyone!
