Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E992AD02
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Sep 2024 03:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333075; cv=fail; b=qRh7Xjc6vqT0kMKHMKi8cRukpdqzA2/BkVHO0CcYEN3690Cey/5JZ0sYKJ+IAjUyua7gWXsHBW8T/i0iFYSMiBSoQElcPAaZ5ED5bc71KgA6iphfyusA6ZM6bxr8Kt6uF827OKmwYs3HfwYZEEztPK5WmFCvgwq2m++wiiQMbWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333075; c=relaxed/simple;
	bh=h5xnEVC4MQrSdTLcHDgIDCl+sP91LYQ3oXMEN6mPXVw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sFoUWwrgQywEFG2GCUEhR+HxEhqBb1Adg55oNb9JhOCnY1Cfyugm83NrDq+p/toPtsS8K/4lKbaAD3UBiZxc2pWAzvgFzN6lp2sJPkiE3LtN7cMxbkVx5fVgdWyPFo/uno2vGZ8QlJ/UF7eE/yMvD21kkoSFNnGT/DuOsqr6jHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyQXZ+xK; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyQXZ+xK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725333074; x=1756869074;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=h5xnEVC4MQrSdTLcHDgIDCl+sP91LYQ3oXMEN6mPXVw=;
  b=kyQXZ+xKLrsfoxDmrjeNL6fY8ArcZqZsUp1RJR/LICoip4GVd6RR5iUD
   RrQWhuZ9sUQuHHZ1v7f4JCk2Bn5k4cFDV9BopxLkIHgsfmO6vSXLSZupU
   dmkNiFMBsf7NVxAzEja49WBeR5mTvgiEReU1n2EzVI9agdB3WsjRNbqbj
   ZpPw31Tf3CmxYljzBRga3zaDacKYnbNqQxNhUFVj3Aw9mXOi6WyWYZdQ/
   qMtbG+4/4MKSe8TMjDjBnx2MuTo9iZMt8CoQ8kJ+XApZ/CYGPKM43pRAe
   ca6cGmY9yVdKn/NtJfnM/cVzFSEy/Jstkj8qy7u0i99XgOxA6iqbcblhz
   A==;
X-CSE-ConnectionGUID: gv7GHD2QTQWILZWBUbq4gw==
X-CSE-MsgGUID: JdAioR0GS6yYuwI8kccmeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="27663915"
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="27663915"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 20:11:13 -0700
X-CSE-ConnectionGUID: hRkMhnadSbSZu4esSKxkmw==
X-CSE-MsgGUID: 3z1Rsd/FQsaAVRWi3+2cxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,197,1719903600"; 
   d="scan'208";a="64796509"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Sep 2024 20:11:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 20:11:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Sep 2024 20:11:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Sep 2024 20:11:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Sep 2024 20:11:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQ1RQUBTtUVMdDDUTn7OFtVfqr+DP3PwS/RNyZLuT8D4PMoVMLfWvglU9yc7FGNdyO3SYXEouWjSlN30ylQaT6C+GMUzFutXkvwLkwOpOK/C9hHP4YmdGWGiFT1emouvBbnRHWJxm9B0USMyXBG6cahTTUh+Rqdh71y0K0HXetPYEAn2bdLiXRpX1JxSThjEGTobCa0pW4v4LDwABDMI7JJWTTuNf8ZMGbZdYCu/eRqyoy/IKUrx/G9BdbVFpj1HSr0NjwBu+NHFsRsWAYPMx9DhXZ/D9rrPQtCM8TmVjww8ueVYYcNuv/dx8yJfBlnQHWUCHhf3hKDeCZK0LyrZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdR4OyuLSRnIk4l9H4Q4uWlbtqcssyq8vzYzOqOjgTk=;
 b=S9/+B4FcM2VEZtt2vlhrNL8Ny5ioryZRNbMotm8aeq7o07rBLmCx5+h2VCkVIOCmxxrg+blPOn0RvqbuQmb+9wl3kucIyCB0GxVcaGtGzEHkH6mvJsrktB7WI5TY1YVft32waNYzQGH37+4Ng2xN4ntYvLtdR0m/BvIuqPUIUTTQpC8psOYFFyKVa93TcXlcgoDQkLjXG9J5JaBGFme5lFvdhH5ZRihlotKYz1eGl1LapY4FaPnMr17YZvy7z61ws7ms7ETtsVC8fwZZ1c0FgGgPLlJbSxz/cvl/BOA//7GMKESv4jNz3ZiBQjIHbEv0GMuYa6mM5sNNQ1R8w4b9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW5PR11MB5907.namprd11.prod.outlook.com (2603:10b6:303:1a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 03:11:09 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 03:11:09 +0000
Date: Tue, 3 Sep 2024 11:11:01 +0800
From: kernel test robot <lkp@intel.com>
To: Bernd Schubert <bschubert@ddn.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH RFC v3 05/17] fuse: Add a uring config ioctl
Message-ID: <ZtZ+RdrSifGi88m8@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240901-b4-fuse-uring-rfcv3-without-mmap-v3-5-9207f7391444@ddn.com>
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW5PR11MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 9006e705-ef23-4a06-0cad-08dccbc60e84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mbts5QIy0mDHMz+hEnESHpf5XEHNN+tLRRkleRTfIroxmv6ckk95zJtn2lN3?=
 =?us-ascii?Q?vddjYb9nmLMvzKnNZc33C2rry6hsaBWqqbgf/5zCjzMzTX1cqBVpKoTTelvu?=
 =?us-ascii?Q?a+a6dt7GTbsgZrL6KPbRZdFAOwdQ7FR+syrKS5Wq1WcyVncdSirO2oh5HaoE?=
 =?us-ascii?Q?AAX8oAf4VNCh4KITXe6oHwytNMqS9fOXJcD9dE687ene12TVWBxiOlXX9Tkl?=
 =?us-ascii?Q?ZX48fMW/nzM4Pt8d+xsyJl40uZJNNDI7pmYYw/wfJ14gOSCfn1S4xscAV0NJ?=
 =?us-ascii?Q?xucdWRlMvqqagDTZMoXj1a9T/ub/p4wHiq46pwc2j0IiHF0EBgPxx/20jlcg?=
 =?us-ascii?Q?TtVNuew12ARfnCFjgWDbNm80jOMSWNe6uUxKGaecO9WGSdjnB9jsAtvrLLLx?=
 =?us-ascii?Q?DwxTQ+cmHnEDybRGigixA29Rvz07BseNs7jvrdsojWbvl5TKUHPZrVYhB/a3?=
 =?us-ascii?Q?oBjQMqeDZv516nsxYtdiWzxahVRMBK21RwCBQ/gzSLhyXfKkTo0EKYAhf88C?=
 =?us-ascii?Q?m+StTc4+AVG3AoBR3GGo5U+9UeMuI6rRWJ3VcYToNdTRDDZ2bhtrEL8jVcqd?=
 =?us-ascii?Q?UQ7+Hd175xV6ClcTaLDpIOWr70sp1xZaGBhRpn6+8BbXv6Vt241sznKdFya+?=
 =?us-ascii?Q?XQflTcgg+XYBpyBjvc88KahunUMxEEKI5hlhqOs8bmj+k9gHgt5vs0FOEJjX?=
 =?us-ascii?Q?TLEtiZxSqWnT8dxhjaRMEAlSCsDVr5vDGBaCnvO0KGeyWlRKzKJl3I+QHeHA?=
 =?us-ascii?Q?QAPSqvwXnVTip67a1qt7nLBVVlxWC2HbRlCzFhEdMdZI7xxDuoWaapA9qXoa?=
 =?us-ascii?Q?XVrKLYl/ZUDTqFbO86015mchn3s6HHcaULgHeF2Th9lddYkdtWc/xypdUUsT?=
 =?us-ascii?Q?L5ZxuDwng05BNv2KDIDtTc9YeYLltuzN00Rqqio9JzfiYL0wyEXYGV6dHfyz?=
 =?us-ascii?Q?SWh+qN/1PBW0XpgaD1Vw+rJN376sOnaTS8MwK/zK2Z+mmqvqleXlJ+wZRPf0?=
 =?us-ascii?Q?bS2gsGjLtcHuN/s0kq75jZb4O0mk/0TMQpIs9xUu5MJ7QX5dyo62p3A9OeYC?=
 =?us-ascii?Q?AAOVAcT+OQXGjKzPEqWqXKsMVH1t4ZJNXmWOqsZhcHEZKjezORUDKsoeN/Jn?=
 =?us-ascii?Q?I8IsDa1uEx28pfc8hsP/6zNIs+MkMDNN6UgcQA8Kfg9SsydnhZ/Uy31iKy4D?=
 =?us-ascii?Q?B+oYBBVq8n0dbGkjKOIK+v8qZ38T+vImHBG42pK3mqKE6p0Mc4KQJxKXKOVA?=
 =?us-ascii?Q?E8zDMJlz1N1DOXpcIwuyRelxDxV48DQqz0SrgbjG6XTfzzSJYu4xWkht7FJx?=
 =?us-ascii?Q?Pko=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ajiU/4Z+DCz2yQi0wnHc4oKSDfmY6Pdt2rLPOV7740pYzr75mc/nWV4UWaAY?=
 =?us-ascii?Q?Mj1z+k4MbUWC0evWT8Yr+letnwWeS7gzyrb788CtRdqxjlra0DJZR1DiK9nT?=
 =?us-ascii?Q?dG92fCjdF5NmtffhKjLPZbUiryV8UBZAzKVmqt4hevga0452LRa/A6THwvb3?=
 =?us-ascii?Q?amrhpG/jKOLpeUVkGwnX6kqdCGrOnJeJPFBjVdDL+ELXPYmHtJ6AfgXFj6zf?=
 =?us-ascii?Q?9I7AyD/FopifedJI92icT4TQfo6MINMyALe4pmGIv1SXxGBq55r6wHkcGqIE?=
 =?us-ascii?Q?nrr8s8SAyyL6bgDlkMUkVbfyTVHeozn0Q4rGMMZG7mCmSGVYXjsJV+ScRJmT?=
 =?us-ascii?Q?5hJB+M8dVOt4SV5mdfohTrMkFgsuuH642OR/0BOh2SYm1XkmQaEV0WEhNiqm?=
 =?us-ascii?Q?QjbK++iyvqA0wQ4HzSi7DDZdn8dJwqMPkqV3Ldg8YLKXl3/f98EDW+rqLjeF?=
 =?us-ascii?Q?twtRm8+VFwhid/+Zj24feRN5H4NdljkytY9tu3afVv/pk4ok8gXSnGhLa6dA?=
 =?us-ascii?Q?Znee6z9akpPx46Utfq6M7XHWqTy8UtdzLz/IAq0fGJoYzZ80X9ptFlmy2jMR?=
 =?us-ascii?Q?rZItv2ErU8N/bCniNCFr12YB46QxTh6WarjvWkcYedzBHkL2OBi5wUUBUN21?=
 =?us-ascii?Q?tLDLb7sPGHQOzkNWiLLKHn1weijICHzXocWA3NkeG4CPh/HqApBLe1XbU+AZ?=
 =?us-ascii?Q?hp64ILjxomXX9KMCCTSE8GmCYH9iXLTZ60Go7Q0dVXaEj7RvpDmNaOhc+3xa?=
 =?us-ascii?Q?NC9ch51VOW+heuAmhYkKHhzY6ncX4vP0hx10R0DKaSvdz0Uehw5aUemAqGFf?=
 =?us-ascii?Q?4W3w9wyG8n2IHQukcaUFo/N6HfDzbjsYIQcZnRM8ABZniSzyabgg7FE+1FE+?=
 =?us-ascii?Q?pIAmz4ZOhPLBBqGeLs4+aiUfmfjg2kB8IerfO8CgzQmBg/5eJFCN5wDYCVrP?=
 =?us-ascii?Q?TO30jopqLflBKPf4M0rhM0LmGZBnj8WklQJ8Ih3ZuNPHWYli3/aSHx0ae3Zl?=
 =?us-ascii?Q?FhwMU2Ix0FgnW39FWRrpOAyLVOoXaOPg48Wdm3E16xwlpmNDCxv0vVocWCPo?=
 =?us-ascii?Q?dxDz6MNW1qTEUZtC4a68DCOjRSw/T/DQ6lzAxOHUQudW6RPDmlCdid8gbdL8?=
 =?us-ascii?Q?6TIsbk8KmLu4Oh08DclRBglUk26wS+0TBpbOIp0E2NqdXkYuBtAr5ALPfyzl?=
 =?us-ascii?Q?sI2fCsCYH14+uK9ncUZqMmDXtgyJQTeJjJ94HXSJphGXbTGe+4dTeD0n/QRw?=
 =?us-ascii?Q?IKMpe67mYtz0dNfljNFTLILd6Ac7bJFGc+6wmPZU5+1ip2h56m/IO07tZRUh?=
 =?us-ascii?Q?NBn3aE/r8jVYVv8whJy8Y+bq9g9WMtFO67JcXKICuVJi4iUbLA8cMTHEPDr3?=
 =?us-ascii?Q?fBBbJvpGC7m7KI/5rKUcDdpBKh27vKcAGcxeQUsGnAmhbm6OHz57PhYGNXnk?=
 =?us-ascii?Q?KqmqEBo8ax3kPCdE1ulA7IuxK2uQJ5Nw6aMlMBnMmCAfK+rEhgLXQ9byDlPI?=
 =?us-ascii?Q?hRcj4Z9SPDl/ajOg11Dnzh46jg6eUo6WaxV5FzR1LEhJ7sz1ZtQfItW2OYhN?=
 =?us-ascii?Q?XhCrjc4z+aQ5KnHhHrwr7YaORqoHPmDd8appdlqXNlD2kitNfBZiJj4bLQu7?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9006e705-ef23-4a06-0cad-08dccbc60e84
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 03:11:09.1632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyNKjH6ovNl07IzSySyOV+p++xLnRBIEasjmj7a6f5krmnImzw9VYROzZ0NgpOUGHD7eNrid+pQy3oEspIIC3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5907
X-OriginatorOrg: intel.com

Hi Bernd,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 0c3836482481200ead7b416ca80c68a29cfdaabd]

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-rename-to-fuse_dev_end_requests-and-make-non-static/20240901-213956
base:   0c3836482481200ead7b416ca80c68a29cfdaabd
patch link:    https://lore.kernel.org/r/20240901-b4-fuse-uring-rfcv3-without-mmap-v3-5-9207f7391444%40ddn.com
patch subject: [PATCH RFC v3 05/17] fuse: Add a uring config ioctl
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409020829.pfrqKsc1-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/fuse/dev_uring.c: linux/io_uring.h is included more than once.
>> fs/fuse/dev_uring.c: linux/io_uring/cmd.h is included more than once.

vim +24 fs/fuse/dev_uring.c

    10	
    11	#include <linux/init.h>
    12	#include <linux/module.h>
    13	#include <linux/poll.h>
    14	#include <linux/sched/signal.h>
    15	#include <linux/uio.h>
    16	#include <linux/miscdevice.h>
    17	#include <linux/pagemap.h>
    18	#include <linux/file.h>
    19	#include <linux/slab.h>
    20	#include <linux/pipe_fs_i.h>
    21	#include <linux/swap.h>
    22	#include <linux/splice.h>
    23	#include <linux/sched.h>
  > 24	#include <linux/io_uring.h>
    25	#include <linux/mm.h>
    26	#include <linux/io.h>
  > 27	#include <linux/io_uring.h>
    28	#include <linux/io_uring/cmd.h>
    29	#include <linux/topology.h>
    30	#include <linux/io_uring/cmd.h>
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

