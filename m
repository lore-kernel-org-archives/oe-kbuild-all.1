Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF443FFAC4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 14:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767788; cv=fail; b=hku6l2uTsflslfu2HY1LFKbqITwYFmkqLdKUO0tXx8nZTGZVmp0CKcb/V7DJ81++blr3g30BNCDvPx4GtYOJTT+DLf71B5umitQdKcIWsBOI8Wp0XwXVHcmUrit4Z1YHDdbANxW10UB+hsiMGBHCjUrT97Tr0NNu3yYs1gr8sUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767788; c=relaxed/simple;
	bh=9UjWrVxXBdXVdg6r01H6XC6FdueOhsbkonvx7KxMATg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TFdcwdAz+YSbWymuTmja3PUykvQ4yjndnRgTYXAqUscwGDyZvzCe05eDqb88/6nCNxppt8c81be4dtc46aTpYqQ+kC+wGXakNp5ES4pcGmL7voSNFrc4f6kwyQkD3dZiInazYH+sDKR4wYChvmr6s3BXuL063b3PM2miBiylr4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7yreCiA; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7yreCiA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778767786; x=1810303786;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=9UjWrVxXBdXVdg6r01H6XC6FdueOhsbkonvx7KxMATg=;
  b=F7yreCiAc5z3ydxbW91RNQTi8Nv1Bgichk6tDmH35HhBjMmgXpLLiDuM
   HBTYQ2+s3Cz7aXZH3d/jV7IjyzsfoEnCDw+r0SQfYH303ZOsxky7wpHW3
   XH/iicl5wigquqJEb+OVquuEufglO6euvACOdLVEtu9qZZUxPuvBH8/Ct
   IzkThTsynHCU+gLE2SJVddkcjy7aZCANREZ4vQY4lWhSC9Cny1pevOmGb
   p6d2CrPV0K4aC0eXjCzd0A6BwsMe9VVhIcIyM303hQ7LkBPFbH1oXV+Bz
   rljOvFsT6A6O9sf2cM6N56XbHXXjB9gs9dcf5mVNwfmV3GIQ6GHonhl77
   A==;
X-CSE-ConnectionGUID: bhObZQrYTDmCvFeSQPIe4Q==
X-CSE-MsgGUID: ZxJ54hFBT1mFkvt7LA32dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90019674"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="90019674"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:09:25 -0700
X-CSE-ConnectionGUID: SXBNQuDXRUKkZ5jzrZmcqA==
X-CSE-MsgGUID: 8HtYmRskQKCkIaudq27cBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="261917081"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:09:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 07:09:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 07:09:24 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 07:09:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OjCq8D+0KxwHG3GbfoMHo9iaYLSb5/Q7JFz12CkessGm4kpJv//W/fdrfVVvbwe8oA2JsyRf8GpeV72UJQsta0+hsDCIGOmJgca6ildLd++3yG3H00KlWh3KwGhR1cdDtV+SJsqvRi2TBwMPzT0+y2iBrk3Di7YP4sg2R1hRmuYQt2r5ya6fhspFKrCd0Brex/HsrCIiXXnawjjxlOXHSkKYyAJrygfNbcXAjkcQVJ62I/0iFjNOegio0GgO0Sb2TpSXPTviHNor4a/0/1WPP+FFx5gp7Ps2opD09CNBJZsnwImbNHoVchybnoLPKddA8PAu4u7v9gBE4SoEymG9MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69ijMaANf5KVPENKYOOCznYvgD2Z1O6NXglylNjAcp8=;
 b=DmUObQLSE0ldGt268t129EZ+tC9p50apX18P0SxgSgJsyyZpJnxEVHwWbr+F9uHuVDIOS0JUHlbi0cI7C/hLKPSb2lrcFdwb1IC4+zjecqP3YD8khOm0VoyYP488uG8Hjo362RVHczaYbFdzXhsd6klAk9d6RcUc4FHq175d/h0R5Gb4gkMPQWCESWTJ0/tCNkL0AdiTUz8ALATbxlRt62eiRgHKapvrOebb6MS0K/s0fJQ4lTcNHUQJA+5Ou8HQeS1xAbZKWOla2pp1sjtXty/+LIf6WYz9GqA2luCaSpfJDGJHWXS1BW6XJwMX5Aoon2GE11miSrNyEKSvwY0qTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 14:09:17 +0000
Received: from CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da]) by CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 14:09:17 +0000
Date: Thu, 14 May 2026 22:09:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ruidong Tian <tianruidong@linux.alibaba.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <zhuo.song@linux.alibaba.com>,
	<oliver.yang@linux.alibaba.com>, Ruidong Tian <tianruidong@linux.alibaba.com>
Subject: Re: [PATCH] riscv: add copy_mc_to_{kernel,user} support to enable MC
 fault tolerance
Message-ID: <agXXgcLJbPWeSfBi@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260508062439.3000014-1-tianruidong@linux.alibaba.com>
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To CH0PR11MB5428.namprd11.prod.outlook.com
 (2603:10b6:610:d3::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5428:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 112bfd1f-b9da-4692-5b0d-08deb1c26304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: q4wDI5+py0sTGeFybPf84Swt0+KqIg6+gEEGblN6PyyzOApvykV8a6/Oqw9RYBW40EjOJG5riVqul5iXoioP064iM1sIecYWeJrrkNumPywCeLu7lvyDapeUzJb+GIS6oQS8uitFd3RPZGULWImrtf2d8WIAGLHeECtt00GsVm7OmF2ajQNK/MsLwIp8soJ77u8L2YcM6Lxg2Atw+Vf83x21Gyhs5NFQilkXqqE+02mWrCRwAIyEqPGRrB1SKZx6diTV9dOEIbO8LyqJzDaJ7afO5FVoY6ErirrlkYqoCM22UAvQqf/PySVlrZbIaoJyFvswthtHKLgDarA/4+d7DtgOlYGCxlQxMHSc4lI7aj8a0SM2y//Cs9PIaaD/JRdwX4IKH6ctYZHJGDJjM1EMvLPPBR5GsxNU+MLbTmNo8scTtEH/u17NGw5AgfxonqggOLwji1Gs23gVJKCsejduxckSp58bDtW6Ku3I13W0xaqnOMfe2ksqboUFDnoID81hQ+fZ7JDAHPx6AywHammw78ixzhsDoPemiReZ2c/NwCyMwZeBq/QOwHjO+P/iW+KPefi/hqV4t5NooyEJbdU5chdl6IM15ESKkk00/2eQbn/GyQFVhkNuWeGTFuUjqhcCi3unDh80sCAg15TQnGiGIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5428.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D/MYRHAB61YcUSUKL9imGUdAYkNJFy8M+wbdFjyr2vVeF2RTxJWVXrjGNgjS?=
 =?us-ascii?Q?ESspHkxgHP6cw6fHv5iZPG0h4UkKS5OADak010gQgoA/+v7hIIwJZcO/dXfB?=
 =?us-ascii?Q?mBVxpKpHfuPMUZ9N6TVmmAp4XhL0IvY1lQFnDisQ6PfzqR10KL8wxFKx2muW?=
 =?us-ascii?Q?vhh1FORM6S2P9SLvvcGlxwpuJje+yuz7PQ7pRSfPezCbg2f9re1l2PNh7RFx?=
 =?us-ascii?Q?N6Xd/Lol0wIRoAprdp36ZD1ErHnLl9h+gNZSPcX+hgordCjMg7xLKpqlO8ra?=
 =?us-ascii?Q?xP2JVMWUpaQEuXRxiyDpZaNv7FF0cID17rz4KayVijoLZ736laJTZMdUiwuL?=
 =?us-ascii?Q?hmv8FR/VokZmkt6UZRRDfINz+zrVPTHRBQ6cDn/k+q+g/goaehl/41/pJqvJ?=
 =?us-ascii?Q?00TXQy0TZaQ3jtuftAHYDqAq/xvOaHBMKmlkfCxI490CNL7dBHfNyJ8ddSbV?=
 =?us-ascii?Q?4ejDXN06LYxuTjY+JNYPcTuiPTVwl+eeZaeJf8NU7b6+6TISDg4pfGrYBoCB?=
 =?us-ascii?Q?1BSRogLgVf59BRNTnwm1/OJ6bc0r74eMlWEOkBc6C4ZM05pu6EgZRN9+AxD7?=
 =?us-ascii?Q?fF47m/DAg8Q4rmavJFB+XyplgPxsgyRzjLm6rH8pqMTKyEfQte3QqnDqNYhN?=
 =?us-ascii?Q?5ApqRlgCrDPd7E3iX/5XwGEPB1SQsLnGFP8pU4kbka2sI3wpEWIWPFX7yWmy?=
 =?us-ascii?Q?XjoOM60ALsgmNNkeF91Wss/SK/tCYlPLcN04bV26+jPMrbUhmEynFkMFaQPW?=
 =?us-ascii?Q?FC2yrL+VD/3ZWQFanhHGJKOMpbpsUv7/R720f43glNCl11/RqW7+NE7STBWC?=
 =?us-ascii?Q?MuHdI6Z1XpQ5URuh5c/aIPDUID+QEmQu34cUxRZ5TX1T58sfVkYnXixW+HAV?=
 =?us-ascii?Q?Z+GdJImWjo2GL/H/RWW49futAJbty5vkqtVEJsELNxhL5oFZCLn3nI2yi/lr?=
 =?us-ascii?Q?DPDBiLQ6Sw4hgN+KceKuim7y8BoDF0HSZcHQMyAQD/JkN8FEU2Gue4x2GVu1?=
 =?us-ascii?Q?sHFPf+R8tFkJffzPN6+xL5scgFCr7kxI0b67q6S9C/AMcJ74YAYaiz6zUhnB?=
 =?us-ascii?Q?YdTMDmF7ROIJ3oSGxm7BPxc7tRKF8t914Adh/cS3ubtmWGWakVJwYBxW+2VA?=
 =?us-ascii?Q?BBSix7dsdxHr7sSwOUdxuIzGjAxmEfMLJLknlRWBhlnXnXuF9kkQBI2B7czB?=
 =?us-ascii?Q?Za3vgPEuDNikDeU0SqI2LgWzcPLzwO9PO+lQdPhsCXMKadg9XrcaHPHRae6x?=
 =?us-ascii?Q?mymW7IXBQ0Oll2UgL28FT9cMCgNAf20PMDNyrk2/ergFitjTSQU/jMDFdg/X?=
 =?us-ascii?Q?jPLRM1PEolPtPxohXXqZ2ljtX0Zu8xamZ6YtWfa1zY+HuwuhA20In1KxHyQD?=
 =?us-ascii?Q?OnLGxsKdJ1JmvDKKY3Qwarqph8gDrUBzYe8lBW6nYWX3a/fTzhsqkkbvGKe6?=
 =?us-ascii?Q?fMphVgDKNFVwje8DDXbJb539PKOHqXl3ovRoe+GQUlJjibNj8Wyu4dmCp0rz?=
 =?us-ascii?Q?qJ6MKGkf9MTUzJFNFeBuBPJ/aMvOCd6KNkzJC8BVNa1QpYwlDHVDd7zvjQAx?=
 =?us-ascii?Q?dY4VHAp/w5ghT3e01oB+53CEx+HIIRrHvHv+0IsDlwAvfTzi8/ZIwOCXutlE?=
 =?us-ascii?Q?2QIOhayfD+jppZELtLz/go6gOze45QAo9DkejYIIeqPhu7YlJ7avRI3UzD+h?=
 =?us-ascii?Q?gzUenbhRmINEDPhIHAvy36Qk60f3cWnrw5uE2B15O9s3KR+j3bT4SHKlrYkg?=
 =?us-ascii?Q?VPA63LwJkw=3D=3D?=
X-Exchange-RoutingPolicyChecked: FwdotIgApLVVnU0flgTajx/XRriRszg7DcLkTleWYO4UaXyeRqSJ5XB0NogLHH4njkxetmooQE7TCMNUzALBfh3tNLiOPk0b3uzOeb1tn1u2nVvoRmcB2a6mWul+DsegpoOxWTg64W2a4dA1mhTUuWcQb5z6qwzISAJNnMnNtO+h0BLUC1G5rrlLsQAVsGI+k1z3MM1T9E1SRMEUwXt09bhkWhnuEfndbjApycF71lIPjg13dVc+u1SHs3rJYRUH/4pWonHvzmicBH15kpkNyagm0w6ikJ9oSSJ+VV+6+M4uiw9WNo1kSjM3aeOC4+N9ZE8t97I2VCQQV0702+dtXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 112bfd1f-b9da-4692-5b0d-08deb1c26304
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 14:09:17.7800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzjG8VfzOGz2zlrW4DBUTqSkMd5SIUl1tghwrQxIa2or9ScIoRE+002Eni0F1WC/iBikEBsqR7XDGw1A74kkIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
X-OriginatorOrg: intel.com

Hi Ruidong,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc1 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ruidong-Tian/riscv-add-copy_mc_to_-kernel-user-support-to-enable-MC-fault-tolerance/20260514-020843
base:   linus/master
patch link:    https://lore.kernel.org/r/20260508062439.3000014-1-tianruidong%40linux.alibaba.com
patch subject: [PATCH] riscv: add copy_mc_to_{kernel,user} support to enable MC fault tolerance
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260514/202605140846.VOAZjcrL-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140846.VOAZjcrL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605140846.VOAZjcrL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "memcpy_mc" [drivers/nvdimm/libnvdimm.ko] undefined!
>> ERROR: modpost: "memcpy_mc" [drivers/nvdimm/nd_pmem.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

