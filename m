Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424B040A938
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 13:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343979; cv=fail; b=qcy+VnsINo1EJQStciktLBWItMn8T70IGWUmexf2ZIZ8pUBbSlHlaMDJdH/giHxDnYDvOok1OIzjk857UeJoM4gZTBcTsDFRZrgzoG1v7c+dqn+bx3Ucaxmuq8l3NNPQdgSDYS11LwwJlSWORwgk7+WN2H+QJtaW+OIhUbAmgsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343979; c=relaxed/simple;
	bh=pRL/6kfSQt9CiV8EcDnmCqiZ9GV8Bmq4RQdIwMKGecE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cr8U+TKw6gHDhiHRT/yhxvrC/ROwjr0q/+DR9EYIQz7BuY9B+j0HcooJkW65k1QtVPjvrySvPgaVcQKgHiFvgHeW4xdC0jArCoE7dTSkZkrjOFh9hf8mlu65R2qcQqirlqgfgbFGqQJ/EE4q47aSowFj5b8bqeY3eREs7mHVbD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mjO3vOH/; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mjO3vOH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783343977; x=1814879977;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=pRL/6kfSQt9CiV8EcDnmCqiZ9GV8Bmq4RQdIwMKGecE=;
  b=mjO3vOH/JpqYhVJ0jxw3BtpBU0rH5pj9ZKSVioWkdSrFKoyxIR1quk6k
   yO1XEQVmDE8JGt9OKa6Dod3AubKdq993ItBBtxVLsb/2dm5Us5ZEZMIjy
   eNQibcbFfdS3qzbSux0dpaIIf45JBxBORnD5ehZz7oUdv4jRRCTbr94dO
   OFO+sQFKS22grjjHlycnTjSMMJ5S8qQsr9YRmpT7cSVkiOP63yaMXrTuM
   1JnsgkcjpmGiQr8yK+52DuLbxPn/xe4sMmZOy7ajWYsCTzitYonWrro2S
   NkgEj2AsLH3P/R5iPbJE+ZqYA6IIzGGKplurvDWCxn/veAXE6eDwj8Sbi
   w==;
X-CSE-ConnectionGUID: wQAr9XgGS2S2seviv2xl2w==
X-CSE-MsgGUID: YVem49TfSt2i4Po/Snkomg==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="95354863"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="95354863"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 06:19:36 -0700
X-CSE-ConnectionGUID: tqBm2ML5Tsejy7lGNjuwTA==
X-CSE-MsgGUID: XlyIqQTSRUu5WAcq/G/YoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="283803857"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 06:19:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 06:19:36 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 06:19:36 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 06:19:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVl+j5wgikbQOIX2OPi1byfpgXijUesj9GeQuTvLuSjEScm9hv9z1Gm4QvGk16/+yuyFTLnmMQ5jh2WjpiuYZu17Kp2Y9JZRO668OoFaWYZ9juuXO/mOMCprGgWwVztWF9GzEz5W/oYdhKdZHq2V6Ez6tDFX/lo5CruOrx0vgvwHqbLjIt3eE2eKyXuj2GCd7EazwVZpW8LXjeRfHR6bxM4pNGCGN+ESNk5+4e6TXhXrnADRUG/BE+Tx6Kdolq+HpLPTVA/iLT1sSnkR7ME0AkmfqrdR1Nt72wjoUanhYmU50PjhgXVtqkime/Ha1y1hR/cXtEPsDR1wlg2YTEaXrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UICJ3+t8VlANdpoWhVV552LjgcINxXSS/xE8a6BEBFs=;
 b=x6zYLzUw7naVWl98XPXtXuM65mAUIxZTp9y+9dJ5pyxUrwR5N5zufznd02qhx1VQ+aaOfH2EFEOzY6/sCDgjLriOEuxlBzw0NPyUbfdMIe7QZJPKjFgaIb4l8RcICfUmWjW96ZkSs4VDHSem8nclFPTfKklWfzarezjUVeBWIxKT0vt86p401SU+bX7cCG6PmO+EgrdY5ns7TJTnnmO78nfN6gF35nCEkYQA4JRvPaPrk1lRFiK2j331CcXu4Qgbibiq4tAHYcPtcPj9ovXVGlPdC6UBGgUO7uGViNpGize/CsLcyij1fAZV2bs4QHb1zpxCLikP4tf7YBvHSeyhzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH8PR11MB7021.namprd11.prod.outlook.com (2603:10b6:510:223::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 13:19:26 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 13:19:25 +0000
Date: Mon, 6 Jul 2026 21:19:17 +0800
From: Philip Li <philip.li@intel.com>
To: Dongliang Mu <dzm91@hust.edu.cn>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Alex
 Shi" <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	<linux-doc@vger.kernel.org>
Subject: Re: [alexs:docs-next 3/7] htmldocs: Warning:
 Documentation/translations/zh_CN/how-to.rst references a file that doesn't
 exist: Documentation/translations/zh_CN/xxx.rst
Message-ID: <akurVVh0Wg+P/PGv@rli9-mobl>
References: <202607061141.fmjoYjew-lkp@intel.com>
 <7f339754-ca9a-4b90-80cb-d225b402daf6@hust.edu.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7f339754-ca9a-4b90-80cb-d225b402daf6@hust.edu.cn>
X-ClientProxiedBy: TPYP295CA0036.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::8)
 To SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|PH8PR11MB7021:EE_
X-MS-Office365-Filtering-Correlation-Id: e31d890a-6fae-4d43-14d9-08dedb613353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 0lsdO5EKBk5nMGaqZwHI71M578GBZztvf9VcOTH+5RyzrF0eU6z4MJT14PSp7LzB8liGv3Sfu68rHE6zUvPkt6o99BPsgoxP6ihlb8A33ludeZdfipv9gfuepjHFoI8UAQRVjcHdu6p9mA9xlwMFlITptlGVhQzzhEsz+hhuJyTqPphI0EHZppudpsmOuyqWGkvXBlX8WCwWzLaDb84y2+4VsTv1dJhT0wmc/sNQfkoWG+JDFkVV7BfDZIal11cSOC9QvZbhcioQWKY05lOoDc4ewK0GWE1cON5uOjdtX89I66KLbtpyPUWJOSEXX0JH5KwZVoWu7uhBClJY5UjESSs/Xb+Y5zDQqAhuL4s8QHV8arwq9EbJiQh87dRpGri+YppJROmfnkiF7XE0tw9Lf4e5kCHxDHou65f+e2Ivu3G5Q+pOfUbh0MJF5+fFGYVpMlFAjhjtkfHyd12vNvOHJYe9Ij44WRsKItF7Y/lki6Gu0qV2v/MDGwpRhCHucRZqxJTIE9Jd/hzHW7r72BF1gqhGl1mnsaTJJXKprwau7BOS+s/PyV6YgyNxTYAFqLi7guggqMx9XejDqxJpqTdPiNW9pcK5oPQtWVT8WsoI4UlmlkziLdL8Q53PR0xUrOZG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2PentFZ4bLYkoxWgBD3zZWS/wooSITxO6WWPbmYdAeiz5wUdSupmcVQBbXf6?=
 =?us-ascii?Q?SXhC9ypDEtSe73zsp0SL3FFcNwCeuQglXLolesyHUf7eSoMlAAGDJnl6L+TF?=
 =?us-ascii?Q?hzprXXalbI/eM0O5P026mKzPN+4n1BvrQ4CIGPhODYNp08AeNaWkA/0NMkdS?=
 =?us-ascii?Q?BOoVR0goiRTcufut+0ZiWg3cJggsEFu22yeJjs7hfk2arvTs2VZthXEcs/C0?=
 =?us-ascii?Q?yzUGO9GmxN17M7KtzdaoQqLoq0JXcXl5yDnTllf8E24PTHZ6gSwvwWoSKEQ1?=
 =?us-ascii?Q?sWQjfvrYHnBXkZghI3uChCftUZ5AtoOA5JKbROnECG6oQGBimhaUOR9gNuqx?=
 =?us-ascii?Q?0Xg+xt8SmQqzMIwSgtX9dfXvTKeD93434hMPUEtXbLIf/NUbR6911IQTZQxK?=
 =?us-ascii?Q?mBj+90fHggiYFSxc0s1kyNaWPhTLSclq/ErBZUOtpfpx8B0CBVjh3dyIx6R4?=
 =?us-ascii?Q?nxOWPm9mvSbYLCLR+DrtMJPIzvtPprapXtB0sa+6EgCZOht73LtraksE7JSA?=
 =?us-ascii?Q?YKl1G/CQ18mpP3qZJupSGjZxzV7BbqqrWtT3jDK+D6vkTmcbyHms979zsjch?=
 =?us-ascii?Q?TKMzKWnxQxD42fpqMTJI6ZEqRCcqz2xK+rtffm8nDBuM2vdwMewwo7jVLqnJ?=
 =?us-ascii?Q?l1EC6VKLgE1BYTAzBzBWZgWoxA0FBRHw7YOJq8WTdxfOtScOAH/XmBm24/Gv?=
 =?us-ascii?Q?a288Y9Og0rMM9JexIHUSJBDh8hDjm5OXw/5Xzt3OPddlJWKIoKYzm8pIlqjM?=
 =?us-ascii?Q?Djw8wt1BjbpDw1eXDDUk3tRSuGksiiYKuTmThU2fqRZAU2QvszC3ZzVc5Ms5?=
 =?us-ascii?Q?bn0OrDiBJize79c3g9/BvsD1JfxKdUTgiPsUC5LaWTItt1G82E0JlFB0qR6b?=
 =?us-ascii?Q?++Z0jjzxszKwaIGEIlLdQ96tzu1CEV6WVBvby8PH3Qii/xhHzPMY4RwhGFrn?=
 =?us-ascii?Q?TRzITWgrE47ZL/j/qAecDvaRRIv7WBcAeUvDf9OIIs38jRWFfSYt8ThO87Vr?=
 =?us-ascii?Q?jeIjAbzWpXslrLEtpNL+zlVHXxa16RhuOh8csNBWY9DuyyyOFEKJ33X4Ur79?=
 =?us-ascii?Q?i9aCPlgmqxDgzpW5SIAjGTD37Gvn17RNgMtR4/Yw1hpeCbsQ/s4FNA3xcDnx?=
 =?us-ascii?Q?vvNK5p6iN2oKc5W3Wo7pwMObDwX/mdvnXuNXuKaOHlpw+IWbbrp6l4JCSIeo?=
 =?us-ascii?Q?+xr05xDsf8cBpfoqfXtHvN1Gom1hsH5/us/OSNnwPDjALnmEUI9PdA8AI/W5?=
 =?us-ascii?Q?YuEioBJqrkP+HmwvX5q75bAWThhnAhO9IVD/Q/kC4zxNd7HOykiW9lvIPIzJ?=
 =?us-ascii?Q?OO67h9DRMnDVjQAmGSvh/ZcPTx1DOwtvu99nj1YkDM2ez2KRMuHq+U7Zt7O5?=
 =?us-ascii?Q?gmM009AHWkzKlWS81hIa7z5RvURXu3kMViWlbbI3PIngUS/Q72ToGZU07jGO?=
 =?us-ascii?Q?YgJ3pycWSxEzdagKKOu/dt73xXdoRajrKCMUzN4QqsKZ0a3UA3keVxribYlh?=
 =?us-ascii?Q?98adzHMqG1ho8qhzKQJy+M5OlG4UgzEJ/PJ9WcM/lMoQsC2RSFRWs4J/w+aP?=
 =?us-ascii?Q?aC3rUnZtDlnO7EBhbdpP0CY5A/wYvBFO2uo91mylLKZ1aU2TnLvtIrcgFg/1?=
 =?us-ascii?Q?GKoKOkb87+SFSG1L7oQjCKIzK1rXqNUteBrh0155z5htOKTosRwY/8FXcafx?=
 =?us-ascii?Q?b3JGobHZEn5U5Oi9G0s4FpQFYTbfYt+GMGOYmth9fE5RBN7BGkbXq2VL1RWF?=
 =?us-ascii?Q?HeQCN7kRwA=3D=3D?=
X-Exchange-RoutingPolicyChecked: LjJk7h9TjxtE0I3ALkCGZE15yIODSAi2bAWoPnCxHLE7yAaZ8Hvr8r3+I2/HJ/SuInKd0Fd8CBuz2fhf/OE8NS81ZTKr/7YSI6PWacEaMgXBEmfBQMyvXfQhiZtI06zzhfZ+AeC6qpiL9RYGLGE5et73JHCXhzO36Jebk7ytwHfOnqaK+QNuMSUIZPdZq6jgInQc8K6uERyOrUfwxFwszqJQzWX0A/9YiPiByX9NALkGqI2vrMcjo/1hl0d5krVyw7wxDA4QaX1i+M/3bztWcopOVAMWHprZYkYly+e3eRCHp2QaiXfSskkogoDKvIn+7wZbBKfK4RFF4KYmGS5how==
X-MS-Exchange-CrossTenant-Network-Message-Id: e31d890a-6fae-4d43-14d9-08dedb613353
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 13:19:25.6081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHlrMj1Am1nkB+GPMleCycDHQGpvCchBWc5wJprngXT18A6X2ckg5WLhebn13Dk/lAwYft+v4YJ87GoGvEa5tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7021
X-OriginatorOrg: intel.com

On Mon, Jul 06, 2026 at 05:55:42PM +0800, Dongliang Mu wrote:
> 
> On 7/6/26 5:45 PM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git docs-next
> > head:   bc2e3e1124b7362f83c5fb8557274bbca3da1a74
> > commit: 359c3caf50481aa08b0ab761436e4b70ad027f73 [3/7] docs/zh_CN: restructure how-to.rst patch submission workflow
> > compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> > docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
> > reproduce: (https://download.01.org/0day-ci/archive/20260706/202607061141.fmjoYjew-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202607061141.fmjoYjew-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >     Warning: Documentation/translations/zh_CN/doc-guide/parse-headers.rst references a file that doesn't exist: Documentation/userspace-api/media/Makefile
> >     Warning: Documentation/translations/zh_CN/filesystems/gfs2-glocks.rst references a file that doesn't exist: Documentation/filesystems/gfs2-glocks.rst
> >     Warning: Documentation/translations/zh_CN/filesystems/gfs2-uevents.rst references a file that doesn't exist: Documentation/filesystems/gfs2-uevents.rst
> >     Warning: Documentation/translations/zh_CN/filesystems/gfs2.rst references a file that doesn't exist: Documentation/filesystems/gfs2.rst
> >     Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
> > > > Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/translations/zh_CN/xxx.rst
> 
> 
> The above two references are intended as demos, other than typos.

Thanks for the info, I will configure the bot to avoid reporting this false
positive again.

> 
> Dongliang Mu
> 
> 
> >     Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
> >     Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
> >     Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
> >     Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
> >     Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
