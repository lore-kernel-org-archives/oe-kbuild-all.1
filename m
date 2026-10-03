Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F4636C5BB
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 14:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038502; cv=fail; b=lTHml52YLOpjY8SdBLy8r6Vg1HvToUFkQ3IDUjRgyeTLhvRvFk25ISp93TelTkAZ5m82Xsakf0y32yqkdQTuONOEWEml3RGAc/NmKyXvMYP4rzEh4YUDMOP2U61MiRyw3Zvw8c8ezA0V03kClZulfTfYaqprONRwUhR854DTfiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038502; c=relaxed/simple;
	bh=wjz9xtcs3LmY7Mf/daramSVhNCjpMALxTGfVnmhc4h0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=EVlbBpkEvCzIuxJtecBIj3hj/ZFOWusgtSGh8Su33paLuW8MNpQO9duRaos+HXjfMxRnUjJQOaqnn3GOIZldqdcK/Ioum6kSCOeTLsY+e84MVXUEf2FywvaiUGgDkZ1xtBkzhewlG5LoiuPDgn7bk8GBDOTUtc7xwcmxl+3e7RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLcpqlwf; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLcpqlwf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038496; x=1822574496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wjz9xtcs3LmY7Mf/daramSVhNCjpMALxTGfVnmhc4h0=;
  b=QLcpqlwf8f9qQ5Ij7WZSWgj1bJRio2dCCFcst0jZR2kOu22M80HosqUV
   Dav9CLccHPxbNrRGFiP2yXN6pbcXckgvIuN79POWfco8bXdmg/SX/8fNA
   KtEBJBF//qzdSmsulstetXA/vXDHHAQbdBx1EOfxwumhKx8t3bJ4WtCts
   sQF+U1cuYPt4cAmZb7oWFfnsBI4CmuQqVOgRs7wB+VEaCxSRIbe10XhJR
   Yvywt+m5LVNTK3vfTUHS7mi+8X1YZM8futQi9uKKfZTftzXp/yLb/FY57
   M64rou0jX+OCt+hJzCjbrQvWu3RT/yyHzeOrMVlNkt4D7bWb8Lw+ZslM1
   A==;
X-CSE-ConnectionGUID: QWJtqEzNRd+4BJuJgBQdTA==
X-CSE-MsgGUID: 4eegFPnfTDGaz9G3+6oW3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90807924"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90807924"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:41:33 -0700
X-CSE-ConnectionGUID: lVb+j6CSReq6tXkV1g1ZzA==
X-CSE-MsgGUID: WDS0g33vRG20ndUFwxU8vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="444268"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:41:33 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:41:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:41:32 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:41:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7a4RF8MmN18VYL2i2Ii5NfxbQxqVXZGQ9yF40dSmJEB51FT7quhDODTR38n4ZdfMjPxMrTT/NZd88jVn22N3c1zybm7EN3gJRU96VemhJmZ3CMVFn8nWtVIXoYsZ0Zg1BluyZmQs7peE5F6CMN/tqczO7aHsqHfPqTh9yGmmRmG3OLAXTYloxaRW23+IJ4NbJ9GuMpZ5wgaKETsYtkF5eJVdrMoEfcK7rQTFiSiajSmCeuvnJgqZFxRCWnz5uyrWj7wa2QCKXdZIMDfrpSD/RVfHTAiO7JWQZCDXtjTqxth8UyWj9YTPWulkBuJe3mjHeTq0ABGj8lF5dZjhWwelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nL4A3rvVVd+EUifG4jo5zqWO6H/11ExDPcc+JC+DOg=;
 b=q3iOLwsYXjNukrPtgERzGmeOHgjXdt3jrCTJ+WnPhz0pdM3tdC/XRaiO6RFC6+it/uewreKvhKnmex+xxywJSS9Pbfyv8JiMlGabrpUpLrF/9PBtNSmdS/31ds0VCKNHIOQ1jOVbjBrkr8qL8vKBomvh3IINbz/MRNLwiwJMQra234YcOlRZyux4OcTIYoy8fcbwQ3mupU4HH/Ysw4MQGlzG3U4Sdn8bVwC1i4oK0tr/CpODRNZ5IBuwA9+mymejeThpyAb6sKGxLlNN0gbkanJK2AlrkXjm3ZljDEPCYDWRneLNgDIu9MR+u5tCrnsWEJHirAVIyyihRnb1/l4wQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 14:41:29 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:41:29 +0000
Date: Sat, 3 Oct 2026 22:41:21 +0800
From: kernel test robot <lkp@intel.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: drivers/iio/adc/stm32-mdf-adc.c:2047:12: warning:
 'stm32_mdf_adc_resume' defined but not used
Message-ID: <asEUEbyX+bZGsTIm@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TY4P286CA0123.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::13) To DS6PR11MB362586.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 511d5164-6b61-4115-9bee-08df215c6916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|260925022911599003|260925021911599003|260925021311599003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: CpiD0G94TXXg0n468MFVHnCvcIaZPXlmE0XHtGQES3HZ1RXVt9+s3Iaf0R3RrU2WbSP6JKd2c0SpmYxYwyMcts1URonlTNb504rLqKXdLDZYOsbXwarK7uhvLr0wr8WLLcFNMke+E4HYw93p1es9pVf8WufxxUHPaK6eskICS7UiyRFTDkKY2Q4vN2f+ccuAbHmpiSJcji+n10kf3Twg0rhr+5K4vgoAVKLsyDCOXakJvqCD7FwpyFhWcZk8E358RAUCQNDpyyFft7EzUiMQ5N77orvAyAyOmOSjsaeohHTKgazQPuWXAPD9/G4aOzlQHYQ2b3rmAb2jYG089ZGn3PFogv1zlM/3XPFryMuxvmcXKdVrkJdJgyO6mvwA5KsxscOQHTdBZeF1F5i2pxU7Y6DHr8Bn38JrlT9GwmBvP9gdX3VAAA0B4l1YIldm4w+kFJBW+L3b0GcIMuIUVc2M9teva8YjIftVJRQ4fVpfYZo77zGmxBAyyvwgfXUPMND40RheEDcGOQpGCM8hrUKVCLhhZ35itsXe3b3SDNy0KUDhKPrtRwwVBB0okRTX/TFype2saCfxf0nBTTtEtjDZj4GceX/hG5YoGy462KdMoExUbZENr0GOFpGF9XYg8kaB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vZgF/p9yb3VQh7W6SfMfSxFUpBUwFHP4kRvxlRB0FROgQj3Tkz3JCTLH18nB?=
 =?us-ascii?Q?5NO89z9koVVMSHnGfFPwOFxZhkxn4gXSZpSSlvYtRhHjy4N+urhDtvJKXq1q?=
 =?us-ascii?Q?ETUTcV0tgSizcUhbw9UfxP+kgnxJejRY9ZTotHnu80pwjZU5NZHFTXFQ4qdV?=
 =?us-ascii?Q?04mXJOEUWcDHF9luTs7IoP8CqpOZBlG9W+tIMp9HMWbXY2B0JUu3pIh4KO43?=
 =?us-ascii?Q?JlEsj1ooPm20UYSdy0MlAfD/2qYB23wjYpA0SoiEyAnXR256VzNnRhe73Jd0?=
 =?us-ascii?Q?zZAx7j0dsn3iOzKes+0Z5BSMgDAGqWRexR2unbokPNoo7Teu/UeWTA7fwxe+?=
 =?us-ascii?Q?XarUVWI0xFhad/ZvG/rQhivrvwaBh2pv7vRP2wR+J5ONQjUITWEaHlgRErFD?=
 =?us-ascii?Q?6SglYnUZBjSwyAfvENBB1ydW75wk1XAx+SqCgm6eBbQs9qgrjD90CnhWrbRh?=
 =?us-ascii?Q?PfmUTo9PReh11mHHgqSw3iCoP3hMxSBZzyLNXr61NJXbY9RQqCAqJDBzwBWy?=
 =?us-ascii?Q?I7AOpPWG1duL0ZD1heVZ7lemoxZdTIB1rMFHxM7RMDiF6MD1V7lyKiKe9A/3?=
 =?us-ascii?Q?WGiaWYw2rD92ZvVwvLVKssbjE+6akvEqe1SwnAEVEETVi2bClh5D27ZE9KFk?=
 =?us-ascii?Q?tQUsQjbnVgmbXEoTCTWbTiJvHAWP50xNPlQZAr0u4tg5DlfPbyDtWPHkYW9V?=
 =?us-ascii?Q?kz2AS9fRv9fsRJcp/K9maZdP+ThwQe0t7lrH1qbFegeSafm1snbC2cTctJPI?=
 =?us-ascii?Q?KCMBdIH2Ka2StyGy/fDZz/r1AWfSOcYHgF2X9INErLxD3qKDvuW7bVs+k6AA?=
 =?us-ascii?Q?vJ7tqRGgbPYnj+rcV1p4rfQZyHn5om5KqFPqtL84erdOaThawx+Zw9q63UAC?=
 =?us-ascii?Q?hR32a2PqHorn4O8GyaB2Mp8VcjNNtXQD7r6eo3P6r4OFyZiinCYhvoGiYr3O?=
 =?us-ascii?Q?gZNiXSF5FRb0rismtNRNc59Tx3FkWf+qwPSCD9jYgQn5HijoFOb3dsO5f2kI?=
 =?us-ascii?Q?GGhv31IqqFYahTHdBl0YF5mjyuWBHi4+JE6zLtQ9Lz5GUVMvhHF0StkezEgr?=
 =?us-ascii?Q?IwTqQYJ5L6yiMDuq8YIc8xVqceiByi9yW3q+A1OeBzcEq/MnFjlqDRz6A6cH?=
 =?us-ascii?Q?p894VwrAxPNC7BRsEt4cVeVoFMITr4kDxO/V8paRgW9HupA8b+t1O8Ymjl13?=
 =?us-ascii?Q?mV5aNDSrXWMRHX8xQYMuNW9K3r1m6cJU3WGdGN6IOzYTiOHLxq7PtoMlOWu2?=
 =?us-ascii?Q?5S9TB5APYEYS25XrwOhbV9TOc5cqKrNqTcfH2da5/J4oE3uRLK+FZCXqSd2V?=
 =?us-ascii?Q?fe3fr9ROwdYTXKHd98FIhJYC/zt5Bjs9+EdAQKftZeAj6w7vVGYA2zcmMLxf?=
 =?us-ascii?Q?bF604aa1KWeNVn8q8LgJ1H9g7J3mI8UBzUGAZAiHTsjsh10oU9QZ/2U6VBdP?=
 =?us-ascii?Q?c4gipQaDt98BfRdOaUb1kWkNsSemFj1KlYnr+4vv2Cx0mA9KBRQ6qmoVZIww?=
 =?us-ascii?Q?p/q357l0cTOEO+0s7SMQ3YsjyCJ5W9JsWBZ8n1NRN/exUenY4DJCpJgv4n/h?=
 =?us-ascii?Q?7Cwejhq57UX0+4za/CRAV26pg3wQ+khHaxDznukq7pJRLSJEo47A0kXGq+aj?=
 =?us-ascii?Q?dDoEf68JNbny0jAR3fLyM07jWpSEb/8lv/RT07HCzQwJqcYNIjYPObiu1pPW?=
 =?us-ascii?Q?/dlS1ST0W0jidItujsGPGxJvrd3deyx/X+iW6D92gW+w+oWQlVmXsn3Bm0iW?=
 =?us-ascii?Q?hIE5pxBYBA=3D=3D?=
X-Exchange-RoutingPolicyChecked: Xa5BWTEfuP6gBoY5Um7pjVsoAotCaT7KItqFUNjGoyMFdlEsVuk5nx8v2rDyScKX9dKdWbSCWOUHmvaIIEhtSU8QMzByyFl/QWi41563Izng1jDyZzrypDQ7K1+UUZOspZo493r9z5/KHHBOyYtFPUfDxlv4u7s4eyTv8Zf88PkV7FFAKPPQKne6DRI6nWxahb4MW8lT4hHkhq8HxD/4UyYmjTydk+/fGYSh7bsJKuUIm4zss8soGCx27kNaWws7eBVwukc1bSBjbE/lVMkRwfL4TLGENAeO94muRWNwarTBOeZ7jjLjL9R6NUc7fKcZw/rhFmGmSMUpa+v/b17Blg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 511d5164-6b61-4115-9bee-08df215c6916
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:41:29.5556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNAdgy5V3H88FQ9zYTu4OvbFpYgZ2z14TO4zmt4Hx/slcPbiXnEHiYoPIsuY71bfdOAUlG+E/BhPFcl+Knnzhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Olivier-Moysan/dt-bindings-iio-adc-add-bindings-for-stm32-mdf-filter/20261001-165645
head:   45194ccfe8e4b43c0d49821b0839686030e0d99b
commit: 093a1f109deefe2285de38fae696822eabdd6338 iio: adc: add stm32 mdf support
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20261002/202610021438.gxPsdPBI-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021438.gxPsdPBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021438.gxPsdPBI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/stm32-mdf-adc.c:2047:12: warning: 'stm32_mdf_adc_resume' defined but not used [-Wunused-function]
    2047 | static int stm32_mdf_adc_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/stm32-mdf-adc.c:2032:12: warning: 'stm32_mdf_adc_suspend' defined but not used [-Wunused-function]
    2032 | static int stm32_mdf_adc_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
--
>> drivers/iio/adc/stm32-mdf-core.c:833:12: warning: 'stm32_mdf_core_runtime_resume' defined but not used [-Wunused-function]
     833 | static int stm32_mdf_core_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/stm32-mdf-core.c:828:12: warning: 'stm32_mdf_core_runtime_suspend' defined but not used [-Wunused-function]
     828 | static int stm32_mdf_core_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/stm32-mdf-core.c:793:12: warning: 'stm32_mdf_core_resume' defined but not used [-Wunused-function]
     793 | static int stm32_mdf_core_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/stm32-mdf-core.c:774:12: warning: 'stm32_mdf_core_suspend' defined but not used [-Wunused-function]
     774 | static int stm32_mdf_core_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/iio/adc/stm32-mdf-serial.c:279:12: warning: 'stm32_mdf_sitf_runtime_resume' defined but not used [-Wunused-function]
     279 | static int stm32_mdf_sitf_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/stm32-mdf-serial.c:274:12: warning: 'stm32_mdf_sitf_runtime_suspend' defined but not used [-Wunused-function]
     274 | static int stm32_mdf_sitf_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/stm32-mdf-serial.c:265:12: warning: 'stm32_mdf_sitf_resume' defined but not used [-Wunused-function]
     265 | static int stm32_mdf_sitf_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/adc/stm32-mdf-serial.c:253:12: warning: 'stm32_mdf_sitf_suspend' defined but not used [-Wunused-function]
     253 | static int stm32_mdf_sitf_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/stm32_mdf_adc_resume +2047 drivers/iio/adc/stm32-mdf-adc.c

093a1f109deefe Olivier Moysan 2026-10-01  2031  
093a1f109deefe Olivier Moysan 2026-10-01 @2032  static int stm32_mdf_adc_suspend(struct device *dev)
093a1f109deefe Olivier Moysan 2026-10-01  2033  {
093a1f109deefe Olivier Moysan 2026-10-01  2034  	struct iio_dev *indio_dev = dev_get_drvdata(dev);
093a1f109deefe Olivier Moysan 2026-10-01  2035  	struct stm32_mdf_adc *adc = iio_priv(indio_dev);
093a1f109deefe Olivier Moysan 2026-10-01  2036  	int ret = 0;
093a1f109deefe Olivier Moysan 2026-10-01  2037  
093a1f109deefe Olivier Moysan 2026-10-01  2038  	if (iio_buffer_enabled(indio_dev))
093a1f109deefe Olivier Moysan 2026-10-01  2039  		ret = stm32_mdf_adc_predisable(indio_dev);
093a1f109deefe Olivier Moysan 2026-10-01  2040  
093a1f109deefe Olivier Moysan 2026-10-01  2041  	regcache_cache_only(adc->regmap, true);
093a1f109deefe Olivier Moysan 2026-10-01  2042  	regcache_mark_dirty(adc->regmap);
093a1f109deefe Olivier Moysan 2026-10-01  2043  
093a1f109deefe Olivier Moysan 2026-10-01  2044  	return ret;
093a1f109deefe Olivier Moysan 2026-10-01  2045  }
093a1f109deefe Olivier Moysan 2026-10-01  2046  
093a1f109deefe Olivier Moysan 2026-10-01 @2047  static int stm32_mdf_adc_resume(struct device *dev)
093a1f109deefe Olivier Moysan 2026-10-01  2048  {
093a1f109deefe Olivier Moysan 2026-10-01  2049  	struct iio_dev *indio_dev = dev_get_drvdata(dev);
093a1f109deefe Olivier Moysan 2026-10-01  2050  	struct stm32_mdf_adc *adc = iio_priv(indio_dev);
093a1f109deefe Olivier Moysan 2026-10-01  2051  	int ret;
093a1f109deefe Olivier Moysan 2026-10-01  2052  
093a1f109deefe Olivier Moysan 2026-10-01  2053  	regcache_cache_only(adc->regmap, false);
093a1f109deefe Olivier Moysan 2026-10-01  2054  	ret = regcache_sync(adc->regmap);
093a1f109deefe Olivier Moysan 2026-10-01  2055  
093a1f109deefe Olivier Moysan 2026-10-01  2056  	if (!ret && iio_buffer_enabled(indio_dev))
093a1f109deefe Olivier Moysan 2026-10-01  2057  		ret = stm32_mdf_adc_postenable(indio_dev);
093a1f109deefe Olivier Moysan 2026-10-01  2058  
093a1f109deefe Olivier Moysan 2026-10-01  2059  	return ret;
093a1f109deefe Olivier Moysan 2026-10-01  2060  }
093a1f109deefe Olivier Moysan 2026-10-01  2061  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

