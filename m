Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83103332EC5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038688; cv=fail; b=b65qc1Rz0gvTDEV7Jq6fCjZz8kFfZXbzIrejtBnYLr+vU5KtpgvYtMnxUlxtyjLFxt6OoDvPplovaZsFbV006SsufHyaSeFNSTbJF91s2OAyuqtvIoUh/AQdjh4QPtsGNex15frtUO+ptaUAfpu1tkxjG7QeYWXw+3l8EE0gn+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038688; c=relaxed/simple;
	bh=WWlel14Nd9aeABZ7G5TNHyS+0+WxfVbJGhu3qCMkAPI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gmV5XZZmAEZRDVv6G7S4UzRAagMmV3pNsCSZz1pxCSVUpVilpYt+0c+Nn/BOjjZSkSuCQNS2i79ShrAbnJ3c7GW5i5X3j1c8vbtSQsq46iScZq1hHAac072w2wlAk+7xaEQ1VSKk87VSD8veF/70PZDwrt9r/nFv3YqqNwCriIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gdj+S9qN; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdj+S9qN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038686; x=1822574686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WWlel14Nd9aeABZ7G5TNHyS+0+WxfVbJGhu3qCMkAPI=;
  b=gdj+S9qNc6SYMVbQEzv7St5KK47r6Xe3D77OwX3UTJw9N+g7NYzrbsWV
   WqQ386igTD2oSygmRjgT5P7K1und8GUH2bsb/IG9V1qgbsPLJhhCwlkPS
   nsMa1vC2H3jz5YXpMSJ9HR71PO2Pn83kvRLCksWWt3SMr9aK5KB3pcna8
   Rff6A+AHrIQhdFOyYx11CNe8Kgl0ZN6XyEr160MF6F04Dv6+2RkQ6w1TP
   OMOkKchtvMkvrsrH6xgL/FwaqQBq/HHEzCpgXhQ9rJ/+7UXdYgl6kANjI
   xRBjpWZiSQTURQRNAU0J8ED7trxgdzN6MKc0QHBtiif4tG9eQa1160SPQ
   A==;
X-CSE-ConnectionGUID: qtWqokuLTxqxLBopV5J1HA==
X-CSE-MsgGUID: Aa8EgueORm+JojzfCaVrkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="79336713"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="79336713"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:44:46 -0700
X-CSE-ConnectionGUID: mauKR1NWRvewE7RcQF4rlQ==
X-CSE-MsgGUID: cq6A/VcKTbOfeO4yzzZ+sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="275105385"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:44:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:44:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:44:45 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sLhPNsafLlu+Cn6/S0sTnmfiAEBpw+ngmXfYZ4mngp50jPyIv9jIDJZlvHcyDdEOIztZPqRV94XDVAYT3CPeJH3wws5moh1rxmeJ4ZmsYiVVfIfo2cTEe8+X87BoyE4xqYxy5b4+Y2TcX83iXk5CVFF755DUxnp/CWvi+UQ8wjerALyPDN1/ViRzcPPHfPrLbbzD6rljjcLhI9m0497XaWPoWPTm22NfFhXAFcruOwadNCuvAYWdq+4dO8yy7ZumnMz6d+/g0NG4iMhHJT2CrqvktdldQvrfnYBUlL6PnAjt3S7++lwHXe2T1hgtgAV8vvmADO/Zy+aHkFSgJsfSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFG2uOpjVlF75PjWFcQQK92FrskHnuvwh2BT0JOCgvk=;
 b=FI5yzneGH0GOG+fY7rpIMSsZQorX6e4+KskNg+oYHty0V3OfBJkvGj/mtnlVPQ7OKuZyDkdqxF8LT5k2hoImTgnNpBaW1Q41TN6wXOAwJc6IFYe4bMI9co0SOiNMi03iAyidzHl5gO1hIFBLEH5O7b+RWYw0Xqb3yKjk7dmuI0XDeBngF7cmYNNfdDnhJoAjAs/uQufOB5r1hle7VWPlG1SK79VJpqYc3jIQjCZ16S6Jo+64zlH4uF37hrdQVSQY1T2K6U+Dy4G5e2/iSD3FfQo2An2kuk1LknBumZRIT7nSX9gEAg7M101iPQfUOfmDBq9aoxCdIbx/jg1TjrpEDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 14:43:40 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:43:40 +0000
Date: Sat, 3 Oct 2026 22:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: Mattijs Korpershoek <mkorpershoek@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: drivers/media/i2c/imx219.c:1053:12: warning: 'imx219_power_on'
 defined but not used
Message-ID: <asEUloaNUdalWzsv@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: dfeb70c0-8705-4d4e-7d53-08df215cb738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 4WG9L5nA/VG5DqF7QWpmmHrUHJoGeZC3vhPjpRkMP5I+WRCBVe/WWM5eCP7NVXXTUCPh3P0be4nzl7iypTg7znjHoRtimozVQJPDw37CxpIfFwnxA/XrrXicgxX4MdLAEQtS6iZfx2h2dK+xynEKcB2jNasSeh1ANgT7nYS/YcjJC+XsHHpjdOHq+hAfdNCkv0BF1+a7oNyhjylP3CA/b7exHTVycFjDZu7Vhad9cq5lzkIOcb2Gg2f+W138kBl2dlI0T86rfAOKiA2AjKbNfuCx/kK/TdupD/fo+Ct6j0Bhrdfb7rk8PoBwDsQZS3Mqho8uaMrxCITihDvHfv5CypVT70HMF2eubAKW5Eh2wDZGV1Ij4FJNmmlO5+jG76dAvCZX8jpazpVkD/tKuRDow5qNZsnoinvngG8gqmFm8XnE8B/eBBnmIil9un0DrOcL0Af1gyWnCFvWgm8W4w6uRa3z9WZGdmblRM6SvbHz3ByU7GUriQWY66ouHhiDI6NeCfVlXPP6umzRCO+pFYhFt4YcJVfRhd4yd+uGhmRMfVOtzGtQATu/yxJX/hNcSUe8afNRdDmWdG7KaUGrlBtmIVhcNZScCNYIWCQb0QCEtFFGn0g+ul1wGB/lSHXoMWpa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iJy/NzCZBlmj9x87el695uaqlb+XQUM3Q4WPOxr402voXPdkFFzhJGwDtazg?=
 =?us-ascii?Q?DqThYV+JiZ1Gp986U5h5tzn4D0lYK+sKZVT9atuh/1G3WnkOiA1PULaMBMtH?=
 =?us-ascii?Q?pxUy8rvhFMYrX5wCt1bcU2GjnEMeDB0jEq0EyXY9sWR6r8wf8vCX3SVsa/M5?=
 =?us-ascii?Q?Yg+ZD9HFUc5H/ySzvdq+RPaSIFzGbuF4EUfEnv8eJRJHw5FRWVkst/D/EDUi?=
 =?us-ascii?Q?/9iJZiv4bfbVWexdbTEzC6+oVwG95ZQlWgXvGJdGdDZe7ftMg+d7GAxCCITm?=
 =?us-ascii?Q?q1sMp56JWKhGUvsgzHf3SDl6WvW1r6/xEATBn50oZDUxRU/6OC/TM5YYuAJp?=
 =?us-ascii?Q?DdyAK2ibatip1hMkN4i8ip+lS4B1aStgGDO8Z7SfzynITV4Lok3Zh3AFW9Je?=
 =?us-ascii?Q?I1+h6rLhRzVOGkQ45y3oVErc59o0W3xA41Md5fwwWfE54IEsEXJQOe1pz5gB?=
 =?us-ascii?Q?u83hg8gC/DkOHEhv1NCe+aaX/bc5+9z6b+gD45mDZjalnjxEqwBs+L8jWFYC?=
 =?us-ascii?Q?VAwLzBFNvYVBxDwFqB9sOmmg5flGoVYaO+67PLWBC05YAfencOo1HHeURfWT?=
 =?us-ascii?Q?itZ2Q2kv0IcB2k+0OVWXAe3UmD/pFZ4MvYBX8vlQlEQwlRhOuSusFfy73DHf?=
 =?us-ascii?Q?eeCg4CsKnIh4kRtXEvfuFScs4PI7MIDHlGjeW3HV2yeTz/QcjDOov4MrkjxJ?=
 =?us-ascii?Q?ZKH9oELtGgGiDYT/Jdwr1vo+jUWCoAz7lppQ8HJp8syt9sq/UALpHXONN2xt?=
 =?us-ascii?Q?5Niw729FJsChQoMUaSfUIQYbSEFdJ5uCUqtTdLilw5z/klBjYzmSIAaEZ3Qs?=
 =?us-ascii?Q?F92fvQV1+jShd42VOWkFCKF8z2UpuahwlEM27lO+yvO7JSiFD0iLGSV/EHGC?=
 =?us-ascii?Q?7sasUS4OEPnoNMhFxyHf7gcrJdWUYNgIHMXbrz/wRVE4xeZ7g+1rmXvzcMTW?=
 =?us-ascii?Q?tAX5tMjhFoKMmEMoj5iv46ePDuI6vKC7wdfIMVL+VsAVQUA+O+0+Dy0mD7Ag?=
 =?us-ascii?Q?KbS1RuqTHo1+xShSAPXdXiPCzBuHF7t/kO9VnisswmJHorknxSqN1NQGmkj/?=
 =?us-ascii?Q?B5yB2RlewSdSNNwGs3sHkdf+byes0SXfyNqxovPCIBSaneXxrju4wOExRU1S?=
 =?us-ascii?Q?qdmL0TjJe3uOmn9g6Wc9+0qBU00ysbFKhPyCbFVBfrFDFLJAF0p5vXa27yzf?=
 =?us-ascii?Q?cd64oUM4lCPcVOsF+DmEC+NYbvsfgkDt9IFOPm9q6Lh4vJEMSyuySm2jUlcC?=
 =?us-ascii?Q?hPzL7JXw87pUE5Gyny8b7V4aU19adknDkWiaMD7In8WLSAaAsHVQ6vborMAy?=
 =?us-ascii?Q?AQz3CyrA1aVAq70QXoahI1HVXWq27IolvAEYZ37xXzxj4XlEDs+0674ILGY9?=
 =?us-ascii?Q?gQwVyRx+wo3mVHWtg8NcBpx159GOr5NMBiovt8waMYtixlkPOUoJ0ASVO23k?=
 =?us-ascii?Q?QNoeekU8zncPKpZLqX1k0gBujeh6wVoNyB59PwIRRdrgbkz2sVVGsSqmhKOd?=
 =?us-ascii?Q?qRItSlOpnrXIm12OLAB1UOKK7AaYci4cpwXE9BKbMeLLgHDUi4UvLO8sk0uY?=
 =?us-ascii?Q?ipMgc/MgJBXxH1q4KJDK+/YPCFSnIzfB+4aQAzzik6UedvkFbVka/fuN1+ec?=
 =?us-ascii?Q?yEpW80BObNk0RLmge1ePSG2vXpv7h+kDvql40Q6vKOoNfxCY478pJOOjYuYm?=
 =?us-ascii?Q?96U/WsG5DK6h42Zu8e6s0Q5SSnHz+xuivSLlIAo3iH6jUaZCniHC8c8gO2lf?=
 =?us-ascii?Q?2nlbvrQung=3D=3D?=
X-Exchange-RoutingPolicyChecked: oNL3gcu0af45i+VaKZLqEG+dh8PHnHh4FzRNLYkW+A66wRkeejikU/G0WoQJqQxW3Xl3jzUDOSQtKD5TI4wFhZddBdbHfJEm7tV/3IvNa4FI55zdDtWuJOUUhmby44fGHA2w9ia3Q4Qxizl1Wgv9qmuMWH0RsHJmgjD96u1crECpkH1OYseCpfofZxAwxwWZTcaINKKENx2BMN5u4zQEBYmMpSckTyi0xEfP0Gi4EoKqRiIN/fFeUWBMVpd26K5o3dcifpRpkWeSsDAtpZg6cx+D17H1gaOEros31rHFb0o0YQFSCOcKvyWwr8wKLT/1YO1aQjnGlxeYkKyFeUnWmw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dfeb70c0-8705-4d4e-7d53-08df215cb738
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:43:40.5570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vnvTauXgrmDycQztUIcTcpJzhdycp6wEYI/FKCuDnP8xMNODJ6wyzZ0kZlkxle+hGczmEwtMH7TjMLPso0b9YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Mattijs-Korpershoek/media-imx219-Move-LP-11-state-switch-to-power_on/20261001-145519
head:   18288596e9f9f87a17687c2897086168462d7648
commit: bd5cfc31508e17cb9fbe84c9cce7e0cf90946f97 media: imx219: Allow driver probe with missing sensor
config: nios2-randconfig-1001-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020736.6Mh3IWdr-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020736.6Mh3IWdr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610020736.6Mh3IWdr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/imx219.c:1053:12: warning: 'imx219_power_on' defined but not used [-Wunused-function]
    1053 | static int imx219_power_on(struct device *dev)
         |            ^~~~~~~~~~~~~~~


vim +/imx219_power_on +1053 drivers/media/i2c/imx219.c

1283b3b8f82b90 Dave Stevenson      2020-01-20  1048  
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1049  /* -----------------------------------------------------------------------------
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1050   * Power management
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1051   */
ceddfd4493b334 Adam Ford           2022-12-20  1052  
d03dfb7d4c5fae Laurent Pinchart    2023-09-24 @1053  static int imx219_power_on(struct device *dev)
1283b3b8f82b90 Dave Stevenson      2020-01-20  1054  {
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1055  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1056  	struct imx219 *imx219 = to_imx219(sd);
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1057  	int ret;
1283b3b8f82b90 Dave Stevenson      2020-01-20  1058  
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1059  	ret = regulator_bulk_enable(IMX219_NUM_SUPPLIES,
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1060  				    imx219->supplies);
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1061  	if (ret) {
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1062  		dev_err(dev, "%s: failed to enable regulators\n",
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1063  			__func__);
1283b3b8f82b90 Dave Stevenson      2020-01-20  1064  		return ret;
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1065  	}
1283b3b8f82b90 Dave Stevenson      2020-01-20  1066  
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1067  	ret = clk_prepare_enable(imx219->xclk);
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1068  	if (ret) {
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1069  		dev_err(dev, "%s: failed to enable clock\n",
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1070  			__func__);
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1071  		goto reg_off;
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1072  	}
49b94d580abc47 Andrey Konovalov    2021-01-26  1073  
9d108d226224b9 Krzysztof Kozlowski 2025-08-18  1074  	/*
9d108d226224b9 Krzysztof Kozlowski 2025-08-18  1075  	 * Note: Misinterpretation of reset assertion - do not re-use this code.
9d108d226224b9 Krzysztof Kozlowski 2025-08-18  1076  	 * XCLR pin is using incorrect (for reset signal) logical level.
9d108d226224b9 Krzysztof Kozlowski 2025-08-18  1077  	 */
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1078  	gpiod_set_value_cansleep(imx219->reset_gpio, 1);
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1079  	usleep_range(IMX219_XCLR_MIN_DELAY_US,
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1080  		     IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);
1283b3b8f82b90 Dave Stevenson      2020-01-20  1081  
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1082  	/*
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1083  	 * If we can't identify the module here, it might be disconnected.
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1084  	 * Consider power_on() complete and exit early in that case.
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1085  	 */
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1086  	ret = imx219_identify_module(imx219);
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1087  	if (ret)
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1088  		return 0;
bd5cfc31508e17 Mattijs Korpershoek 2026-10-01  1089  
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1090  	/*
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1091  	 * Sensor doesn't enter LP-11 state upon power up until and unless
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1092  	 * streaming is started, so upon power up switch the modes to:
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1093  	 * streaming -> standby
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1094  	 */
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1095  	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1096  			IMX219_MODE_STREAMING, NULL);
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1097  	if (ret < 0)
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1098  		goto gpio_off;
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1099  
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1100  	usleep_range(100, 110);
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1101  
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1102  	/* put sensor back to standby mode */
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1103  	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1104  			IMX219_MODE_STANDBY, NULL);
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1105  	if (ret < 0)
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1106  		goto gpio_off;
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1107  
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1108  	usleep_range(100, 110);
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1109  
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1110  	return 0;
1283b3b8f82b90 Dave Stevenson      2020-01-20  1111  
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1112  gpio_off:
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1113  	gpiod_set_value_cansleep(imx219->reset_gpio, 0);
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1114  	clk_disable_unprepare(imx219->xclk);
70f13b5683f82c Mattijs Korpershoek 2026-10-01  1115  
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1116  reg_off:
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1117  	regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
1283b3b8f82b90 Dave Stevenson      2020-01-20  1118  
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1119  	return ret;
d03dfb7d4c5fae Laurent Pinchart    2023-09-24  1120  }
1283b3b8f82b90 Dave Stevenson      2020-01-20  1121  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

