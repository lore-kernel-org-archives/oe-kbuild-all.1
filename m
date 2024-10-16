Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA85F20820A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 13:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729086422; cv=fail; b=GkotKVBjCxO7fhTeES6ychaiwDzHVIpYAwChNx38FDgpyL4bEFXWPxlYX5HsQqdmCHBrnLqJOVo17IHqnFO+h7yzjcupJu4JGg6S1e/WH3uME7Q673LZJTn6Vp8cyjVJNqi7fbKZQJUPfky22TyDSYAffOXA7Zy8moO5SZbBPfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729086422; c=relaxed/simple;
	bh=CWYTw/+Nm4195iZeGuC7yu1JGbpLQHe+GiRZEeUj338=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=cwHWbkNX74KAFMNzpqTc4LOz6aKJhL6FmUesBYQcIbr42WzLAH6jeEaOAASFTd3XuEEYabXTdvvv5ccHbovVb+2Q0Cq9ZsGn46x0Aq1jL3Jf2c4KPmOfCkebxUwmvl1E9Y9miIwaFZB5jvUJzxIm74Tz1DtsNu8xGIyERAVNPt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jmUAS2MH; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jmUAS2MH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729086420; x=1760622420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CWYTw/+Nm4195iZeGuC7yu1JGbpLQHe+GiRZEeUj338=;
  b=jmUAS2MHKZCHKamF+zToE+zY7HPDxbAft74DGjDRUiWaOUPyIm2vu4ib
   FCMqp12MXHC0O+1sAoUei2C9zvPbwFgF+0k9JrFWwD+Sg4j5i6XiPFp/I
   YQuCFcNtcMuZ+W6PO7FRzVf47h1kL+D1oxpMxRsDpnsnubyHtSa8W55Qt
   8CIAf+AdUX//v6uxJprEzoGTw3rOJzVhzhE1FeGamubecy7ru0uQoCKFU
   ZuW7wW4bejN4IpM5Myjz7iuloH2kpYx+6bWjuLRlV0uLML+jUgRrkuz6G
   jjK7I+go+xtDjla3Y69gTwqDwnPvjsnoa9EnIbB3/lhBIJ6Cb5CRe1w+x
   w==;
X-CSE-ConnectionGUID: QhmmDOCzQAecARlmE+kYPg==
X-CSE-MsgGUID: nUnzKtUsRXii0uVFzd8Yzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32335059"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="32335059"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:46:59 -0700
X-CSE-ConnectionGUID: yc2MQ0i/T9SoqIwJUkax5Q==
X-CSE-MsgGUID: eKLW9zD4Q0GYhfeKGsF69Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="78282874"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2024 06:46:59 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 06:46:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 06:46:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 06:46:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rqyz60On4SxdwRAhJM49X5I5gk/GoMo6drHEoftGpYTilGW39xpTu5emiyB84NWGWfLkmcB1GJY2ENw+mxBu5XKypQxNBRXe2zIHwmN5vxi2X0cpQea0VaAPQiEKMn30C9Lcbe+hg+c23NDDc2ZU79hPefNwPqgh8XACe1wAWcWwRGcFUOSNrX3zYMMD3MYqTcMtUlXVb0uVmWzeTggCkkiqXhyDMn5si9O0HIKaKL5rzZEBrcWVf36RscuYdlR1S9hEDRVot4FOJkHTrGzdqcrNaksATBjdyQ/IfAHkVFFdljDs0nymdtTOGPWMNaVTnaKITUWXDL1DcbFmXuzbrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oRNXXiiUatUMR2WZU4v+wsQLpN0fEwqMpkkwuDwjrA=;
 b=RC0M7vd1A/C+GvFimsTboLeTTuO9s/txDpkc9cVKxFROcvtNAMrd754myacei0JtlIU3HKtUWpEO1zaSpyXleM07givw4rWpVJaytNhZp9qAXbDUpevGItyp5P6BV1Alsj/lxUYUoDufhdRYR5yvIn2S6OHZS1WvmvJP9WbLfARCO3Odg9tu5cIweL3eJo/mqMlqb8HCZ3M952kfJaC6iH4GjYoPZv9moL2Xza3XTdRx/oh0Jwdo02UE8sjdjg7OP+GTDw26zAQZluBWak1hkV/JAsi1XzPncBHC+ksnQ+/sCc1yDpDfLqz2Mnd6CN35RCn7ovojaalh7B5eXJxNvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by IA1PR11MB7872.namprd11.prod.outlook.com (2603:10b6:208:3fe::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Wed, 16 Oct
 2024 13:46:55 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 13:46:55 +0000
Date: Wed, 16 Oct 2024 21:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Vaishnav Achath <vaishnav.a@ti.com>
CC: <oe-kbuild-all@lists.linux.dev>, <vigneshr@ti.com>, <nm@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 11/44]
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi:184.37-188.5: Warning
 (unit_address_vs_reg):
 /bus@100000/bus@28380000/fss@47000000/mux-controller@47000004: node has a
 unit name, but no reg or ranges property
Message-ID: <Zw/Dxv7KHwBlUiwF@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|IA1PR11MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac2b90c-02e6-4c87-54c1-08dcede8ff4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lj3Pd2y8r0M7lhDzLxxYULoui7+gaVCHMks2s3veu7uDPCmZEpQuPB9fGtaR?=
 =?us-ascii?Q?ROwRTwmm6DGCjxbmwjj+iwl5sWNcdZse3joTby5OO+V3KJMJgTzyirpxm/M3?=
 =?us-ascii?Q?Kspive4/JVzijwILTZTCjlCrhsGZzrn8As80NcJN4lwdJJ0TJV1EX1RQxGfr?=
 =?us-ascii?Q?GvEPRxx14b6FLmllry4jDVqusXbE+h8M4Q/cUu5icFP4fhdFmXVYRIPhuZ+F?=
 =?us-ascii?Q?a/+pI2Dg4HSUkHdgOZEM9QKx8clYV+F1wgvY2HdfJCrY1FpsIPfLID7aZh/E?=
 =?us-ascii?Q?dg0LMXoRcqSnuN0a2C3VSKS0WvhJqTuOlpabEm9KxxsUk4ROGiMOC3Fu9ka7?=
 =?us-ascii?Q?4bVPhmTa55i6vNm7S9ltgF7+CQg+ZaOSXMbmMgH8xARP/Rud1CVzVAnoGz9t?=
 =?us-ascii?Q?LevXenE3diEp1FnabnCqHFm2jsDdUbjMarzmD1bWwyqb0OQclppz3cW6Ijtl?=
 =?us-ascii?Q?HFobr54+247+XEGVO2rOBgJHEJ8Zn5voQeUqF+wkI9KdABzWpeNy4wmUpfnK?=
 =?us-ascii?Q?1QYey+BaEGpvKkX6BpBQkVt58SZowr7r3rPlz9uQsxiq7SPKoxZ9lXYtZQqf?=
 =?us-ascii?Q?ITecDACTDRDFXtvW4Q6eCiyNt+4NnxiaL+kx87g9nXlXVkFEw0sghp+r2xRG?=
 =?us-ascii?Q?fUdqsc7SBjrJfgmX1+V4/dM9NbNJY7tcLJa38mxp8XkXK7/rPP5KGFwaLroT?=
 =?us-ascii?Q?fx5in1fF4xH6qI69Q7c2wyRKdwXP05Ppc/NqVApFzZ8vxfSMT8l9Bm/mI8PC?=
 =?us-ascii?Q?sht0Y1hGenrps5C6N7whE+mfyQGJaK5IsCY4aP92Aw7jKjRND6PcAyb+oSsr?=
 =?us-ascii?Q?BVESf0fKszMMuZprDmId+SoCu9fSTxA2X8OLmD1cHYvQqGysveAVX1jy4gmt?=
 =?us-ascii?Q?4thq6lgs9NpKTPk/segHd5RRJL/oalK9iyEbk0QWA+trmuzYJj2vv7xAc9Ei?=
 =?us-ascii?Q?uUoGJaVPXPOdAnCWtg4CTEc/0+XhQGQCFZJZe7RUSdxgMZHh2uZfjtbLno9H?=
 =?us-ascii?Q?Tk0mIcp0KO/iMJujPJc7IBDaf8KxKqJxzSreeYbFffKfuqFyl/TwdR9Rarj0?=
 =?us-ascii?Q?siaNnxwlrqdqPETGmgm0AXJUCRW++hyj6OENd6C/0F6lSmWwIOr0XZBoRkoE?=
 =?us-ascii?Q?J6Bokxb56SZozD6c6ef8vjOXvXsyRGxBNI6Im2K73PZAaiW5HG88ARAjOi+/?=
 =?us-ascii?Q?r4uddvA15PimiiVGj0NDzOab15RZqE5VGbmgyBmEBCOicnZ+rcByT06PJPpe?=
 =?us-ascii?Q?mpclv6tcfIXZZ76DDgicwiim47eJ7KXfJ66TN/9wFlRWyut/kNtMYR1bJNqA?=
 =?us-ascii?Q?9Kk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AtvfJB8Lf9kR4nn/TFg71Dc+O6EjhG2V7wZEtETNSTb2o8b7peQAR8vWI67Q?=
 =?us-ascii?Q?lhinw56GqRYsCWwyO9qwqPeEZwLe0htHtdMCnqOcsFBqw0b/EfNRHELXgaYF?=
 =?us-ascii?Q?vcMLkWoeD/hfX+4mJFAqjE3mLvbW/pSEHMq6f6pz4/pF5vahDnfRfOKy5ZLZ?=
 =?us-ascii?Q?JKMSCzVnz5K1jLYGTRpMi+ApkNR1XJFwm/xI+eGrvzMooWCtRkT8cvqdUAJ+?=
 =?us-ascii?Q?VBCXL1qssKg0lYMOLJJA2GvMf47NM3kUzHdeoCZKwIKDwdT12ItQq/tRDmVS?=
 =?us-ascii?Q?ZLbnh2Cb+iHbScqZ9pnBGcng/PBYK9Vr5k7I2D7KoyqbvdX7SmEhMJkgSScB?=
 =?us-ascii?Q?Yn4DzT3x57uz6mup+JiQJXABHDI3Mr+g/VkLAMM5SFZrQWeVGSlPWnTY7ReO?=
 =?us-ascii?Q?Inlm8gh+qSvS7y8BmMKMXiP8SQMaH4jwXutLQJsItbo+FDJLULbGqTNP/CGT?=
 =?us-ascii?Q?TJ5E/jpoOSxrw+aTZpq0eKxkxeDGrttUnbTfc1z9JQqOJup6eVUp/CGBrTZU?=
 =?us-ascii?Q?k1QnsGL+L3owL9pUhsdzngH7N0m+FpYDLR+30ViT0AY7DuW8SAt7x9q6s3gV?=
 =?us-ascii?Q?Dif3nqS44STvpcYs6fgOGuqlDxvczi9iwQYqGn1PXR5gShDUzMuUjuiFwYkv?=
 =?us-ascii?Q?PYJ72JV+S8d951eqCPssWy84F7rWMZGkWvVUZUZrhyeF6/j00PL4DV4Ur0co?=
 =?us-ascii?Q?1va3duaduIGvLo+GuMJZoFWC3UGjptHclhaKblyZNQ5z5014fed/CtcMWz82?=
 =?us-ascii?Q?f+nEHs1WavG9Ycdpou7HTXQ+XUsxBqpDa1HPuev43de7vKzFitJImqfRG0Cf?=
 =?us-ascii?Q?Wn76PknCHWmzsDa710NrrVEsPILHLan6PFucbSYjbEu8Ef2phgUFKs+pMtfP?=
 =?us-ascii?Q?4iXZnXBZ/JBcljIPHAdRikSi+lU5diNuC8QPy9HUeYtL1eZP6Bf/gLzOo9s/?=
 =?us-ascii?Q?0VbSo3Hun6DqcKb36eNgYDiGOn0qLIypL6PHbDerQ3S8STqxOXq7WJERuaFQ?=
 =?us-ascii?Q?Bu/O42i4sl/cfD08pKiiwtVjcR4B65bFENhgbmImw6nRLpGgPYSrj6I86uJ5?=
 =?us-ascii?Q?f0vsMGolqOvZ2a2Zp0Xh74ffejjuT/dzZgOy/JiK5WS1iEMZyMRMpWcuF3Os?=
 =?us-ascii?Q?21QvieDQLoybeC5uul0MmapTcnQFUGt9mlEdAkgunm7yWLG1FDaLBDq02KX1?=
 =?us-ascii?Q?bGMt6iHc2ItBrDprk7DekPQakNshIX7GqgNm900xbpqzwVR5mi906eypxc56?=
 =?us-ascii?Q?fbyRJTfg7BPFFCCcSUDiiHqpyL7pfNN8Hjvc0lXX/zNrf7XqJeaBqeWgT85j?=
 =?us-ascii?Q?Ve3/rWsWXL127EzhTns/mk6KDm15jzws/wj5CB8CSjRZGP+8cQvY0MWfn9f5?=
 =?us-ascii?Q?3anDwHOEDPffPHcvnTIzYL0ujvNNXzHDzHm8sjdKrjLK2I6VDGlYe6qhZL5Q?=
 =?us-ascii?Q?0mEZqHbYii6xfe9CCwb3uKap+j3eLzOoOAscXg5VB1KsWy4KAXRnwgqSh2yb?=
 =?us-ascii?Q?3McWAV8cOZQTkWtNqzVFMQ+WL6lUZWt4+97b2FmjmSESLmgKU/aIzQKuaLUq?=
 =?us-ascii?Q?1o9cTMsdS7GRLHD8mzNW2XwAqtC0xhAjAVFL2PpA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac2b90c-02e6-4c87-54c1-08dcede8ff4f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 13:46:55.6314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQyZr6aMWQqi8R6DPATAgjSgMCFnZSe4xmORJvmEO3ddz6utU4dE6wtbzwnIivHuaDz+caStsrR8JdKb+6gzYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7872
X-OriginatorOrg: intel.com

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   e680678e5fef8c191b1588d8d7520171011ebe93
commit: 453e0e54ada305a3320d743e5511ee0fe844f23f [11/44] arm64: dts: ti: k3-j721e-mcu-wakeup: Add HyperBus node
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 4 months ago
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241016/202410161719.zUzN6742-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161719.zUzN6742-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410161719.zUzN6742-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi:184.37-188.5: Warning (unit_address_vs_reg): /bus@100000/bus@28380000/fss@47000000/mux-controller@47000004: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:71.39-76.8: Warning (unit_address_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:1909.34-1918.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:725.25-751.4: Warning (unique_unit_address): /bus@100000/pcie@2900000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2900000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:773.25-799.4: Warning (unique_unit_address): /bus@100000/pcie@2910000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2910000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:821.25-847.4: Warning (unique_unit_address): /bus@100000/pcie@2920000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2920000)
--
>> arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi:184.37-188.5: Warning (unit_address_vs_reg): /bus@100000/bus@28380000/fss@47000000/mux-controller@47000004: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:71.39-76.8: Warning (unit_address_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:725.25-751.4: Warning (unique_unit_address): /bus@100000/pcie@2900000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2900000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:773.25-799.4: Warning (unique_unit_address): /bus@100000/pcie@2910000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2910000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:821.25-847.4: Warning (unique_unit_address): /bus@100000/pcie@2920000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2920000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:869.25-895.4: Warning (unique_unit_address): /bus@100000/pcie@2930000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2930000)

vim +184 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi

453e0e54ada305 Vaishnav Achath 2023-06-07 @184  		hbmc_mux: mux-controller@47000004 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

