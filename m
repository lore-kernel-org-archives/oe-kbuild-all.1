Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657DAD50F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 02:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720664508; cv=fail; b=TbjLg0Jlku+CfoVlS5MhH/8z69ZIMUuROiXF9MYZuxpbY+cCtbtOVSH8n35PbjdUzH5oHU/YWos3xvAiVeQldJ02pfU7WFTJpggvYbifrolwpYq0djuAaeaImN60G7EviXz366krdsFxdJAtHo6PUP0t9y0hLz5p+ikGw02mSck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720664508; c=relaxed/simple;
	bh=Bk/ryq2RX2fbj7lxn3S8x9zJIAPRJQsFvSLrKNBImuk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SlhWZ60oGOu7gOFC8KUato+s2QWV3Zca2iAz0l5U9TDUV+MMaidWskunQKrlbAJbplE7WCJLNqxtDDlMmEZ+6Q11SlZf+e6iyetncqPgMziMWJNst72YtY+zgCzYBqP7uXGC/fElZNR9+TjZChVE4wyNlzFjRb/iZGlzkS2phsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmxO/G2c; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmxO/G2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720664507; x=1752200507;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Bk/ryq2RX2fbj7lxn3S8x9zJIAPRJQsFvSLrKNBImuk=;
  b=jmxO/G2cg2T5/Y/mgVHQeuD8hyPrpyCvA1q8GWQgblSD+t6SW3Ts0/hM
   I73GNNqU+lZEsFQn5lnfzm+FsGUTVAeFq3R3ZJ3INEha2SMdRu4H7vM7s
   5tXDDsKMRNcW+BVo4kOgYH7v9f63+hz1y+ubjBQRy01nR3YChMePMeiYL
   3zs8p+auD8ORu/y0fP4RoqQrivf/cA4ju0JPhy2oKzVxXwtyE7yc4hAam
   77BSc9D9HAx50aXJtYkveUuWcGkh0Api0VG1Edi7qHK8tI8gPPbLXZ/AG
   kZQbp1bfUKGzFkNPJ77ove3IFmZETlVd/TppAjC4HSot1O/LfzpyOson0
   w==;
X-CSE-ConnectionGUID: msM3OvCbQLyCHcVhIcLkkw==
X-CSE-MsgGUID: Vzbaen+2Rr+OwfS3+6tYAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17727212"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17727212"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 19:21:46 -0700
X-CSE-ConnectionGUID: qPy8gGioS5yg8SL3Ryj+fA==
X-CSE-MsgGUID: xcjdULYPRk2upyT6pITJ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="48466929"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 19:21:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 19:21:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 19:21:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 19:21:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgLvG/kGlb0IkkGFKOnBiz7gjqCvJJuhltw/vqkVKQY9R12mMbpE+8aHUU29rsKYt7FJQG600A7EKhOooQSd05pdv3Bs84HhzfrYm+y6wGL31TkiR6e7Zb9+XcJD0DfL08ADeJIWz9LJsI0XxSCq/NDkVPWo/qlVaZ0IbExFLC/xsGXLtaU0tCuHwLaSuTjFii86Qi10QcxW/sugY9tT3kKr98yT2QHjLKjolV6qKX0r5wCLg3RLDoRkTEiKdJ+OePjLyMTIacM4z3KdKUH3Zab7qEO2MvXG0AttHKtdhkCjaMklnfj2h/F2gDiMknMTd6Q8uW4yIzIjlMo60ZTeTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EY3M4kgx19FbCJs4t/xjBbGQZtU1yzcCZDVA6Vz4+oI=;
 b=dX5B+9ZG6snObhMGUcNovI+dr+KOOwGr/DVuV4ggDj8IX5m+ZJcN29m1cJhOxyn6rkd2Sq7uQ1vk2CMDFWFOa+RTM9+i3D64h7E7TGH4bIrgsUocW2Q/9OY5Xn2B+v/TbNYScwCmydGWRvVOkUCAygfDlu0iW78LkJb7714s8uLI3QHBNFKUBb4ha0aHPZKgTmINsMs6ebX1ajH+cPyhyCQYw2IwmPsd+rZoB0f9e2Pv72bfRoPXD46wlvqZZTNAvCdi5snrvRfcCtFYlEtLfJv0bw0djAGkJG3aCpty56uqhPGfRkuCLw2PfEWzWR7b+JF1PnO9Fa71Yb95Rh757g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 DM4PR11MB6118.namprd11.prod.outlook.com (2603:10b6:8:b2::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Thu, 11 Jul 2024 02:21:43 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 02:21:43 +0000
Date: Thu, 11 Jul 2024 10:21:33 +0800
From: Philip Li <philip.li@intel.com>
To: SeongJae Park <sj@kernel.org>
CC: kernel test robot <lkp@intel.com>, Honggyu Kim <honggyu.kim@sk.com>,
	<oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 7416/10451] WARNING: modpost: vmlinux:
 section mismatch in reference: svc_xprt_create_from_sa+0x6e (section: .text)
 -> .L96 (section: .init.text)
Message-ID: <Zo9Bjjeve5ddBwoO@rli9-mobl>
References: <202407090506.BxtnYHgZ-lkp@intel.com>
 <20240711003251.161484-1-sj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240711003251.161484-1-sj@kernel.org>
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|DM4PR11MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: 996e2f2d-bf5d-4733-9610-08dca1503473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TwCqvN0T883/t789fLRxYu7mgkU8gDRd8pjlgpacMWERdb4KNis/k8518elG?=
 =?us-ascii?Q?UExVNhuuRt70cW/5ETfJA6INFNy3EDfkGK3HpGkDWv227FZN548qI6ksnDaA?=
 =?us-ascii?Q?hNvMXSnbNSTqLP3XFH+mOmxx0/DW1OZwhHnA967C7c1OWtEpoOxaJC76h4PO?=
 =?us-ascii?Q?iJDHhmtxXrxsGRvlsOMmBb7KmG/RDlMaPMo6t6b7VLEbrjKbgIIXpgfH1T7d?=
 =?us-ascii?Q?QbojOZiBexh8vAcxXTiva1zw0UaGSaN1g78LGJgAnvHzQgel7RHD8+rxCAsc?=
 =?us-ascii?Q?tND/Ga36+eB05RzhbS38ymDAu2beluBiNWgOUbVhm0HM4Ir9Wz7eQdbgy606?=
 =?us-ascii?Q?vco/NaNP/C/6S4S4UbknWEjck9Bxcr9E3ZDXpC0ZaC0BSBsz/+iquerIbAWm?=
 =?us-ascii?Q?OpwGibh29qTCqbfcb5B/l6ruoknd+RFOx1wvBeJ2DIP47HTaEAExbPDzzGZC?=
 =?us-ascii?Q?DfDpwzX48Ygqv9PJB+nFlYIxqB3OHdMB0UivJZde9N3i0/fkrrgkelw550gj?=
 =?us-ascii?Q?MMml6bBPWBwXfGl9GwgAPSoWmIyrFWLBOFNXV0KKlWBV6lIZSCMstZ3On0q9?=
 =?us-ascii?Q?LvmZJGvsl5zpz7bgh7XoRVsBBCvwoKbeObI+0K6kNsTMEeqyFGvftYw9g2L3?=
 =?us-ascii?Q?RG24S8tLtEIXxQKxYPB1jjDs1SHrY1Byb4IzbcfjFGHiRqQPiEUV4HqoA0Gc?=
 =?us-ascii?Q?LPSjeFSIFQpADJpXsSfYlkD9mALaaM3i8uSoMDkXYLpqHtnMnywDJ0Ap8HPm?=
 =?us-ascii?Q?+DHZffnYZ+7YpXgoBaMzl/40rjCDH43/GXEvkA/IX9WPGRMU04e+zLoC+5Wp?=
 =?us-ascii?Q?jHEsLXhKQN3/gdf8KcDsv1ZIdpAfIbjMMXjWzep4R552yFRmZemM8yBnk/eZ?=
 =?us-ascii?Q?6PrzK9cVfQ+LPAdO5Mq/HEYVR7nB+K+MrmyMrSjww1Sww3II3CXseVOD6IAv?=
 =?us-ascii?Q?2B1hIt+HfVwr7DFx8+UQN9s4B8nC+G7wv/1aMJbc15XHrSBivwNpOHd+4DV9?=
 =?us-ascii?Q?aXPcV8AKC5cyhH6WzZqo2FPFe7WiulJb48dh268CrqycF+m98nyl3J3odtlf?=
 =?us-ascii?Q?MdwpXgA3nQVmN+vVgMP4MDyxxkXH61/qBn0EKwI3LoX4t99faA9j7Ii5k0RO?=
 =?us-ascii?Q?i4oc8Hxe1lxl09yfyDLRx6LUio65GbeXkzRyVMWkbJZX8HcfuH1to0CxEKnR?=
 =?us-ascii?Q?lQnlVmNVbLaki9kK+LX71ciO9XDLHHSXqfNRAnSzOxSc+OUESB6K+9nt7bYm?=
 =?us-ascii?Q?aFR6FJmoA3FL3v+tbvowKJmo2WVG2pSZMtKJdwE1AylqgX0JvnsUEFybR9Bc?=
 =?us-ascii?Q?bclZQ3uN8mOKNIdaOLIYUpb7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RMdDilIZJCzHVSitW9LQxLSzr+slj5BHHIDNELAWvrJfMYw8NKj+K9hU/Cpb?=
 =?us-ascii?Q?gfQJKMGbDMz8LbZDt3HK6ZzAYsUKl4HKpjpXTykmv8S36Rnmf3NhRwr1ZG2G?=
 =?us-ascii?Q?MXJ/ulwQPh1hvtr17IaGl+EEy4aeDxXd28KAv3zE11vADq7oLOw1Xj9Tqmaf?=
 =?us-ascii?Q?cCRBRFpxTbDKwslWEEgA/BKflfR8NptVgql8/tUNyyxDcsUwPkBho+ODzFDy?=
 =?us-ascii?Q?55UVWnCyCPXpKO8POAkHKNNx+DQEpQHcNcQtApzdUPTEhDkvoHvY1hNDDxyM?=
 =?us-ascii?Q?rcwCn3Fk3626KCZw6RwzY6PgL0VGvndJZ8jJRo3elpnIcqRosquKhNEHgCWN?=
 =?us-ascii?Q?b0wPTm9snKRDMgDG+S2mQnhMGzqR7QWSOmirz7M9t6ACWeD4nYiGzImKPg/W?=
 =?us-ascii?Q?LUw4voFMcbS8uYGupJqmKE0y8AIcM30fvSTV+PTbKF4V02kUM6X0WYxs5WIK?=
 =?us-ascii?Q?NO04DdV2mfJATo8AXeDR6IDGCHkVsRh9urbupWGqpJpHGgwFDJSiiCyNzVHr?=
 =?us-ascii?Q?EUtPiFUxO1ykI0lP8H0pSXaQVAi0rLsNoWso0D7ns59l6s0Ys4ZFzudoUiCg?=
 =?us-ascii?Q?92dU12yM/HhhbAtknkFs9derlzoBLnPsYbTtIYEFy/oGv61ibVatQZxGToT9?=
 =?us-ascii?Q?MZN9IX2cKf91uMS34h0INJnzxULPQ9xaSbde4/+x5gi1i5jrt4iAHCbu7LeA?=
 =?us-ascii?Q?BXJI0tE9J/R0phC/9zB29Br13Kz1xzX6ZMqxbQD0muBdwYHgghgv2kw3H4lJ?=
 =?us-ascii?Q?xtb/Blnj6MWlbSrYTkEq/L2p4/IoLe27h1rfe9d641ji/dcRdSgET4I+C15o?=
 =?us-ascii?Q?TgIUJUSI9jMUZeGJP3v3jQ6vafaO8KM+l1GeIPy3qGSFJoGDkJbJkT2Wi+zJ?=
 =?us-ascii?Q?HCKu7DAIdBOsTZECoV5IVhGtwtqSQPW1pArR6t4NK8ZYDDrMrjb6xp4qGFWs?=
 =?us-ascii?Q?7TDiKCv6plaNW0W2sjCOEqLdULrK2xmB55CckEEywvnJ6Q043S2hdR4NIgjb?=
 =?us-ascii?Q?SZBdWDnbn1n22cGUTCjtCirb9l0onVCsPrwsWvVDyiSIHuQ5w3wsZKfreUyC?=
 =?us-ascii?Q?zzaonXMyHnf1x372zMr2/f2sVEHnblJ4Uv0MeoRKo4VUaPunHHBaIDXlNlcE?=
 =?us-ascii?Q?3RvKHPUutP2tAaCmwxTv0CA/VPFoDs7BM/Rnc/wXEEsU+IuG3W4GWY1xaZgl?=
 =?us-ascii?Q?Q6JXpABA+b2fAvqkrcEgcEVrpBYGxN9YqmxYHyXp2Mn5rSZYrDoaX2hdMbuX?=
 =?us-ascii?Q?uPgnQfPotkbpKKop0cdsnL46oaIaa7K9Q246448kWnWCcs6cOIXMZucOH0io?=
 =?us-ascii?Q?Hm4yfvO1s3DSfhSdFyDUeLAqihbq0gWY2sSSuQZLeJ/tQO5c79vu7H00TgTJ?=
 =?us-ascii?Q?wy4g88r1C66JH4VpYBZak3fYaVV/Ot6Dt6A1VvDBOzAuSnwWK/guZjFAoqi5?=
 =?us-ascii?Q?FmfZRlGcRrCkZCA/cUWPIP0eKmuvtQIVGB5HiPAF9Qwd56vB6wd9iL9y+IpW?=
 =?us-ascii?Q?CWm7Eh/4O4A45izbY3AjA/KknqQB+l8/Ssk2bEFPKAsD7kZEVBElyhs/qo+d?=
 =?us-ascii?Q?Fun/F1buufrR/PHwaynmbKMXECw6yy98BaxiQHZk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 996e2f2d-bf5d-4733-9610-08dca1503473
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 02:21:43.2149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NoHoHThbXuDr0RR8KfWXHpTlnbxJ0s4zNji1f5r5OfzXioj0Az1o0CQgsbf1QWXC5cGzII+6GOhjvrTAgVmrBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6118
X-OriginatorOrg: intel.com

On Wed, Jul 10, 2024 at 05:32:51PM -0700, SeongJae Park wrote:
> Hello,
> 
> On Tue, 9 Jul 2024 05:52:19 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   0b58e108042b0ed28a71cd7edf5175999955b233
> > commit: c3bf782bb0fffebcc4e467033cf6bf5e5e1b0784 [7416/10451] mm: make alloc_demote_folio externally invokable for migration
> > config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/archive/20240709/202407090506.BxtnYHgZ-lkp@intel.com/config)
> > compiler: riscv32-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090506.BxtnYHgZ-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202407090506.BxtnYHgZ-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > 
> [...]
> > >> WARNING: modpost: vmlinux: section mismatch in reference: svc_xprt_create_from_sa+0x6e (section: .text) -> .L96 (section: .init.text)
> 
> Thank you for this report.  However, given the diff of Honggyu's commit, it
> doesn't seem to be the real root cause of this issue.  I also confirmed the
> warning is not reproducible with the commit on mm-unstable.
> 
> Please let me know if I'm missing something.

Sorry for the false positive, this is a wrong report which seems to only occur on
riscv arch. The bot will be fixed to avoid sending this kind of issues.

Sorry again for the trouble.

> 
> 
> Thanks,
> SJ
> 
> [...]
> 
