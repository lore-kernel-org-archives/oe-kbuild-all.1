Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C247F1E51EB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 01:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763601419; cv=fail; b=dJFnJM3elZnf1Xo+ZUkMtV6AkGT2UzKyM36D1A8BaFZKjwLy0JbnJB5Qly/9H8jSwD/FRzViO1qkD5C6WRKys1WLkOSxFpriZgduDIcCSxVRAqjo9ZsQmZF5EbqAFSrow5VAie5h8WIYJtAmlV6BCd+BqiiJtAQDgvG2fY736vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763601419; c=relaxed/simple;
	bh=5r4OlrazEPyk2UnTO0z5bkC3WOdISuslZeGoEL+aDsU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Z0Hi2Qd2VX+9zEjQTpEKjoUABw6T6qjaIWhsl2+Hx+YQjFStvA9Q8XOA5qqsvj+OMoy/fJlT0xbi1cXguKJ7EfIPSWxgaA26P6c7wF87Ik7KxI/xQd84XhD34/8TVi/t7v7vWC6OjwPvXWFzusa04CvGbNqcSzEUaHNrtCFef7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=layEZPfH; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="layEZPfH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763601418; x=1795137418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5r4OlrazEPyk2UnTO0z5bkC3WOdISuslZeGoEL+aDsU=;
  b=layEZPfHnXxkw1idW42pfDiofbcb5hBNKCysUUfSypiG9BvjNB2//rzr
   rPeT1qexFJnJukp2PiFnDZ1RDoB8w5vp0czL5pAvZ64x+T9AANDU4WdSK
   JXuVcVMDAI84oq7ljPfIkYVlPNiXOPT4QTo7huvO1ngDlxH5ZGJhZt9G/
   d7JdDWsfHvNMt6nPdidbcd4C+quSMDYA9fCP6Mv6BEnQ0CFWsgLl+xEpr
   VA/nt3cHdJ4Ad8+XcJEPoL74dmimc01yg4Y+dxOT0qG8sEkX8SAMMKxOh
   wkAPQKkhNwW95jZMBw9qzIlzcvk8QDiKZ42j+hh2SEyqidA+eQzEtAIxL
   w==;
X-CSE-ConnectionGUID: 5P7l6Ht7SeWcuDxUKw9cGg==
X-CSE-MsgGUID: 8oNkxFuMRyu9vhkMy5DdqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76764523"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="76764523"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 17:16:57 -0800
X-CSE-ConnectionGUID: wIeUA/HHRvWv0Yy4SPx4gA==
X-CSE-MsgGUID: qU2oaT60RIiYcmf7U+o2Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="195521906"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 17:16:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 17:16:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 17:16:56 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 17:16:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3ubjN92kGBmh3Vumcao1rqR99YtDTPgIZ56UKj1yM06Ug933bB+3z4C60NSyC1+UFVG8BE+M3/GfNKOAkn4DzLM2Mn3eok068wD+PYTUEINjt2iGxfJzoQXEr0W5hkKSbIidqSPD/9eTGe19yyWPWEH1MVdCxD5Kt0Kj1pCceRLAPI6+68mImF6yIdOYOeaG7uV40bqh5SexoN3v03K37bg16+2p0RKHWJ+CMDPzyta+ralbAud0pFBeMWFueR42uCMO1jo3XKtXejqy3UHhdu7G6AecdUgaZyCJG9Y0sgFhborNWNqTjM/2nKzZf/rpF7cuo1t7LwWL9OZE/xZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNQxEdxdzkY9RhRfD3bx5bVZutU9fpfq0jo9UIIp+J4=;
 b=wdf8etB4p8qj30SI/63J5qIksq/7CmsnOgf4gjK5jjNwNnF9ztKP5yxBNGGDOmANpbRyH17V78A18DJm1cduba6sdX5r9wn8zM6gzbk9rMgzYxKTx/UQEsuzT27o8kAg0QlPokAmbXcbMmshey/FDVlvv+AvwQ4SyTQtN+sMLd2Onml+fGGiUtpz8t7BbO16B5F7ynWn4sa6LLiabhBfWTWeOoyn2c+bFpWTGsDKoGbN6ud4wIH1O6cN0Sl0AaGGu8dgFp/kIqlzmX2+govIYJmW+JCq+EaYPpS0bKGjI8CaKkKw2OICEgZKK+nIbR7VoJWoPdl+JZW7HMhcVNEdcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by DS0PR11MB8720.namprd11.prod.outlook.com (2603:10b6:8:1aa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 01:16:53 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Thu, 20 Nov 2025
 01:16:53 +0000
Date: Thu, 20 Nov 2025 09:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: Xiang Xiao <xiaoxiang781216@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [linux-review:Tanmay-Shah/rpmsg-virtio_rpmsg_bus-allow-the-different-vring-size-for-send-recv/20251115-030350
 2/2] checkpatch: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email
 address mismatch: 'From: Xiang Xiao <xiaoxiang781216@gmail.com>' !=
 'Signed-off-by: Xiang Xiao <xiaoxiang@xiaomi.com>'
Message-ID: <aR5r/ZQV8MThucrS@rli9-mobl>
Content-Type: multipart/mixed; boundary="OCLScRs+dJLabFcC"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|DS0PR11MB8720:EE_
X-MS-Office365-Filtering-Correlation-Id: e1d42f2e-2f38-499e-e9a4-08de27d27d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|4013099003|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/GHUBd1WuWv4sI4O3v70laSz9xr5m+Wgc7Ta39sDvpfHDT6ec2g2q1LtAmMG?=
 =?us-ascii?Q?JVXBdZ/2rzG0zINq2cW3xeHwGtofpsnOrN2w4lOMCeeEbQPhsMqMm3ioAad6?=
 =?us-ascii?Q?diaaTyvEW/cNZ4BryLvoTdmQnhaUgclvhUMm485tcW2DGrMpVH/SMde3aKEZ?=
 =?us-ascii?Q?9cjG0plUh2enIavuBT6fF5+BhM5ljEDH1CCtRRIcg9KeqEQWGr2lbM/jhlN2?=
 =?us-ascii?Q?JwbPAzfEnMUy2vJbe/PgvTeCJcO9V7SwvQ1/RWfp+dPgmHSseH8eEmRAejw7?=
 =?us-ascii?Q?RLVWNqfWiml7lX+Q3VO9OpDZtw1uil29/EuFEjN6/GZ2xjqwEgMfI7MupT37?=
 =?us-ascii?Q?seiOcz2oyZI0u/13J38MXQHVRv7NedIqrEw4ax7qGA3QLQ7P5XLGffH2q6JE?=
 =?us-ascii?Q?q08BAvKucGW3N3p7QhL+TEhX5UogVM9m057kElpOrzyby46hAiaNxcl7OGOY?=
 =?us-ascii?Q?qy91mg+JCh2800i908o79UUe0zeEc2gdcCB6YOa2xzDtZ+kCyHSJB64diMzb?=
 =?us-ascii?Q?6HQkLoM4lfKfNyQk0TjU5SrW1omQsAIf3Hj2hGHW7XxWj0gF00reokhhx1iQ?=
 =?us-ascii?Q?FpFuohnWbfIjoG+Z++8jYkc2mSumpsQuKZz/zXU2fecpz8b4Np7H5PNBHlna?=
 =?us-ascii?Q?GLoKj7LSXdcdLw6nNPEtbxAohwhrxPa9VR58kXPTvXRMP2c2H0zF5f6EIyfF?=
 =?us-ascii?Q?YxiYZS3NdbwEjnOS9omxKz0pJJfRtFi71IHjjz4a6tSOOaaJpnmTggpG0mNC?=
 =?us-ascii?Q?Mf6vn/7I2he8xUwoDjiQmbYVeeKgpYyHi1rq4JvKQBuAgQMkh7sry5UADbgS?=
 =?us-ascii?Q?F77m4RNq5W0d2csmSB3qLzogxRMwoV8YhnUvA98Z6rNJsYxaEzEzBtz4eDnY?=
 =?us-ascii?Q?PNc+4neBwu8/qSdTVtiDqHdYiQymBNNHIGo7tzXi3FyrLijA5CvGsFhcGmik?=
 =?us-ascii?Q?bI6HydJU06DFDnLfDqRHcjaj2cuBP+M07OoMqaF0boUX+yzgGzMevg/rJF8l?=
 =?us-ascii?Q?9dgXH2VIS6s/rOxseCCRjEbxyT5azcghU37Iot3h55xn7jruA7U68o/ljZCj?=
 =?us-ascii?Q?yqM7EWSrcxTQm8071+bWEtFOAij8fUt1qhc9lnyXvwJwDoUijp6m42c96hMu?=
 =?us-ascii?Q?X+QzBKE6poofMdPnhqGtKOcP5CCSlNOYKed9ytNc/6fRycQEGgyB+zsOJQFA?=
 =?us-ascii?Q?Wito6MhyysJVoFTDJ17e61CghJmgGzz/kFX0LYF0o9fFMPaVtbWZRXVAbfex?=
 =?us-ascii?Q?p9MmFDbWXNbG5Xq6G0pmq55MbRxqBIhzFx2AGXJJRYd8bQeWud7fKgwevAH/?=
 =?us-ascii?Q?Kuj3Jv8Q0wtp84ukc8EItMWFtAcEBV4i/pDRmUNHWkqizHhg3ZBej2Kfu1uq?=
 =?us-ascii?Q?Fk6Clh/PttG60ttu+m9Uf1kELS8jgjbTS98ey2hEZi/uddX/rpZPWIfyJbiU?=
 =?us-ascii?Q?sJR92acKFEWv3fwlbpqYOd2zO7oWcoNX2LRbTsesGbJs7aEXJ0/zXA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(4013099003)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N1jxvu6+NMwSd0zeYuokCqmNCSLrXdnEza7aB58s5rCyRtRT2J+akysci+Q/?=
 =?us-ascii?Q?B8pzIUwQCpSD9kOGp0xjH2YgVyKmnVDRfqnsRNfhzK58jMtx3uNy5Yz7myjz?=
 =?us-ascii?Q?M7hu7VCsNcJe8zzOCUTPSgDc00x7h2SKfU+re8Rql6gDe9nqWSUzp1J9KZz9?=
 =?us-ascii?Q?UsNFmqdK0aMRPe0E4MMXGHqgDEdcUZwNPcGVlFE9X+9aL/ELkhjeYM9f01ST?=
 =?us-ascii?Q?L3jg8fFfPgn96zry633GMDYjmn4LtUoCFFoqaWJSJSgiD6l5DJJxZHj5WD7x?=
 =?us-ascii?Q?9pauYv/Fuz4lA94Hh7EIWzOZAcTxr5VpOflVdpG0loFkZNmP0VRsy9AmO9Aj?=
 =?us-ascii?Q?2NWNxl8htnidbK6lPwkFyGgYf2mdismTlV65pBNh3TVR+hB4bcA+Lx0Qh+Wk?=
 =?us-ascii?Q?V6sVMlNSAs9BpQBOpyqEH/hj+oLhGpVn/AHwrzEddqP9jUpR5dhtwvI/vBrC?=
 =?us-ascii?Q?tt6893zNP81Y9CGJXI8xyNJxtbqAmgF2BvWNvu6OPmmeAmATX7yDIXLtLa2x?=
 =?us-ascii?Q?OfAhJJyoKN6j3O1Pnn22kLfTlvSZlRzUlDAVU8PGrYWni9+P79SHTd6Ft4zy?=
 =?us-ascii?Q?A3gzp5baKbn4O5DYztBHDDv8youH9wlk4FPHgmzwWzNRwPPYdak5wii6vINg?=
 =?us-ascii?Q?Og1OI6RcW7Y/4eF+OP1MRjxyMSMFEyDPyt2nNi6rOls2UgIFnGndwF7GNCkx?=
 =?us-ascii?Q?/IoOw5qXx21QwVeYyYgcZHgg0EENe3ujrHwrnbjSBhFhmz8RaFM9VQyKXE8k?=
 =?us-ascii?Q?UjrGO8CukV1dw7iOrE8B8u2vJghY8tpqwGwyzEMzo3Y178gjjKe7a1reSBk1?=
 =?us-ascii?Q?V8f1pJTseim4NqK2dlboukQheiq/8RJdk/Dhtgur2slZ0FRbSB+eCXyXJaFE?=
 =?us-ascii?Q?t0d/hPFgCBS5+00JS19RDdwmSNGNPFi4kM4aekyQ/vrc8ciFSaXKiuBjDKYk?=
 =?us-ascii?Q?E+d0vQWIxXct0FaIEchW/l6Yk7+QOv+bWLXHwb54ZGhgWov4kxrlnY233V+s?=
 =?us-ascii?Q?UEEPkklePAeixaSyHL1Pm2qg9Mm7PX1y2RB13lHr6mnTh0EINrwIGOTmOY/Y?=
 =?us-ascii?Q?UFOt7VK8LIcJFh2UanXlZYrcyGheMaaKXqGcGCzSLYK1kTy1oayAjnaRBXq7?=
 =?us-ascii?Q?gScTmyw4d25mL479m9Jq7SYtDFKktv+3zZoc7fPNg6/XfPXsY14XLQjeaFoD?=
 =?us-ascii?Q?mfctqWnc4yI1fCwjSgOp4kTMNfTQbL9orXdZuLMOEznd6nzHqhSwdYSoGupm?=
 =?us-ascii?Q?0d6oiTo5mWl48uw6s4LLyIbI9I5VUwwT/mOXRYJftb+fnF3CJMjukZZAxdKq?=
 =?us-ascii?Q?g01PM03iImZnvchLypeZJNzHi0W/m6E0y6Cv08NbriO3rGg+18hHO5wUBMYl?=
 =?us-ascii?Q?Y+nD2UqKr7n2G4aNJXahsAKdcqU4d4pBi6jAmss5ONKxIGlb3XTYrLifnIar?=
 =?us-ascii?Q?ZnfOVxmpa56px0t7OWEbUbR0VdVyAOjvL4ibOsdxRXvQAPSWF+Bu+CZc9z+/?=
 =?us-ascii?Q?DELiNZm28uM7sCcY2cPMY6uD6Ifv58C/HNZoRBWH9antjsZkuOLcRcy+28QI?=
 =?us-ascii?Q?YsRg7flGfl0up9dDKR+9E8eSoqjFk+eIKddIOe4GjeAWu5slBkBU690gETZH?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1d42f2e-2f38-499e-e9a4-08de27d27d3b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 01:16:53.2403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5VF3l6/xW3DIiNCmnQ9LY1LvuQ65Tf5jRnZr7uFrJVdccPrNe+YE3TjyPK+xq6D4Fv9gWOXlAE9W1wzgiLI2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8720
X-OriginatorOrg: intel.com

--OCLScRs+dJLabFcC
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Tanmay-Shah/rpmsg-virtio_rpmsg_bus-allow-the-different-vring-size-for-send-recv/20251115-030350
head:   a007aa03e33ef752e01518e211d9707017cf1aba
commit: a007aa03e33ef752e01518e211d9707017cf1aba [2/2] rpmsg: virtio_rpmsg_bus: get buffer size from config space
reproduce: (attached as reproduce)

# many are suggestions rather than must-fix

WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch: 'From: Xiang Xiao <xiaoxiang781216@gmail.com>' != 'Signed-off-by: Xiang Xiao <xiaoxiang@xiaomi.com>'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--OCLScRs+dJLabFcC
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce:
        scripts/checkpatch.pl -q --strict --no-summary --show-types -g a007aa03e33ef752e01518e211d9707017cf1aba

--OCLScRs+dJLabFcC--
