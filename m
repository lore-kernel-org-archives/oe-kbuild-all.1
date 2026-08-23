Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BFD339388
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488306; cv=fail; b=SN46v8MrRgQCHrNf5EMXxa7W6eghbF+Emdl9pn6TOd3c2zEjMiFCMMTi4hz+B3Z2QSd5B7nJV1k8YgMmz79BG0xmg2i7rsGkOugmx9nQ/vm2ectBYO8vKGbxYLIZHBiwj2Y++UghQw4Nkc7fwWHKH4fEO2dNFd9NaUvL56ZpdsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488306; c=relaxed/simple;
	bh=Vx7GWdsbBcHrZ7qJIoMi5oERzXuLUPcYqDsaIiJQEPs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=k/rSwaWkFpr6ykXQyqJngYmOoBTG2s90/ZSwBch51y73/xAFjeNk/C42NH/savW7M7QjCUyPMvsSRXb+qhyMrpLwwzFINEc9AMBXoBQBMvR24L+0JfLfeYV2OASx0yty+sMJnbsdDSPxl5ZF70y6VRMCbyZVp3RHoSZ+3AJdZ7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKnh05a8; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKnh05a8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488304; x=1819024304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vx7GWdsbBcHrZ7qJIoMi5oERzXuLUPcYqDsaIiJQEPs=;
  b=WKnh05a8vesPDlcQDBa0pZdhV6C4u3yMd41DqB5l3qdKilpFvZ1eKqJ2
   7ArOVjuOSTGOLJ07ih9PynsN1X+q+5DKh1XaWpQgAMlew5TWNIfPOR7s0
   OVQtNoamm/Bos0eVMqhuxGXtzCbi1Yc4/jSqrOSdtP4rQioy+ZqOnSajn
   0qt03aJ93EOUa1BSslphKELrzdeVNR/mRRz0m16ZilGn0UONbRQMi4F2l
   eDCUEWlRtm8b/8v6UZUs3UIJXPI/xuV0/DUlS9gwk50wx/azomV5shDce
   NzcN3qq/w+ODfWw1gCefPmvtF1MlCJUpUEqKrBTE66EczAvXX8HJSS4SM
   w==;
X-CSE-ConnectionGUID: e9fhOW3ZRk2fXFi1FJJeEQ==
X-CSE-MsgGUID: dvqQM4qIR+eepxP8T0m2aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="113496801"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="113496801"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:31:44 -0700
X-CSE-ConnectionGUID: B7pLghhESCGuvpPtgaSVRA==
X-CSE-MsgGUID: tYB8nDerScKwguvUkRyEyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="260604732"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:31:44 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:31:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:31:43 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:31:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzp3RdHV1kgGOp53ytceqjLBC58LD3/sTdblNla3vigoVFltaVWAz83QRsxxx2cnZ4E0eKIFHWxr9DJchWy2gfdm6VEBKq1hgKlpFGIIWW9kwZ03thh3KJ2zuzlJYD0B1dHgB2SxgHDP1brehuP3g4E3duJyjXSOfNjWwaNl3gYy/Zg16Zlgsun4FtCWQZhFX7lbT3E2FrrrBlWcmm/Gi6d1QaV4eimvn5pr6yxuJPE56DxVWNG6FVVLS2/uRdTGiELuqWeRpF1zRbNSgNbsrh5kl501Wtmf13HROgx1jsG/6xrtXFywBwWgwhhoqhw2l/vyRT8Ho34n3CNUBfR/Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poVaUXVGmxY5zcDY3xjovkR4GXVpGY1zCJ3tZXIfO6M=;
 b=annoJGNxNswfmsNqA1Xxd6ozsfpB/+gGvvZILBfG8LMJ0ZdzbroUqLUQQ7D39mz48rkrUDq3BcxvjkyquifowfBhRfJkKVil7TssmR7bPAS35wc8G1uC7lMrLB6XgYYJJtD8TTbpHC26+3HK5/0CaHTp/Mj24eMUEL/GZcT8kqy1aIZyhPFQPcjDVx430e+jm8LgOTqqKnoaG0nl2thPnzYEGB84hxljwFyguwVTtKRbONFzTm/Demr8OVrqBp3MEpiu3oi7z/Jfc6ei98p67CdswKW5naInWcJZnYC1ajBIQCUVyr1gKKV87Puib95xmhTGwquYtkF8x81206YPdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:31:41 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:31:41 +0000
Date: Sun, 23 Aug 2026 20:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: <oe-kbuild-all@lists.linux.dev>, Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon 7/14] drivers/hwmon/hwmon.c:789:19: error:
 implicit declaration of function 'is_hwmon_device'; did you mean
 'to_hwmon_device'?
Message-ID: <202608221934.fUKdfrxV-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0034.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::14) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7788ac-2818-42ff-d615-08df01127be1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: fwUFTTBfigyDPfjKauvrCR6P2zPuoWzt9rHji29zL4QZ+JWoYymYttYE91nVdYUrJs/g8rmgCAiA1gWuUoddIm5XlV7Y+eCGtpcvbM9M/P1VGk/OfJfNcQJS08vXfYm/R+UWs+8J/Tw3XgmHsA6IJaC7vpHkWu9bOT7m2dQ9uwWx14DrnVF0+i8BzsPvpfnWo0IXAq0YY6LOZ6QZjLSVu7B/jX9/jKh8SgmnCXOQgJmp0RJAzE4BqydBGYM/8LRCgANWSMCv6TwnqxrZJ5N1H0WpWYl4WE8FowBwSWS4oTGBjYfE3mcMF9vXpxX0jJhGnsb9khrmXpbKisyV7jSyLKZi8Eut0AiKB4SfVN0DjTWKrdOLs2TPydjSyl/WliAND/U0EblyDKd98hP+jNIqZgz2Ajt6p9FLoTJA2cHTtzmvgdlM4K/PlqH9OLPye7KR4gdyp8WjpuTYkWTwmYaiTfrQLy2hR/htDTwPDPPPpA4Sz+ip7sirzoFOK3qdv3jtYVQreRy/o6PdyMu9iXfF5q08HlOzkKhPY7qwIaQEKA8qrveyt9dTjzxaIVAuxKuwLJyHBhssLxywS6COzSqrY9GwnI3KspMa3Or9IAAUtkMh0vF5p0fl5hGyhVaA9FSBYiLalvHU+Yf2BlMoQZ+OS8he6hiAHPF7/ou0sO27fTo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?abSzMa6lrhZdhmg26P1hZi1yEtICfqOqQ7B1HR//JoKrlB3oMja8CDjwzC1G?=
 =?us-ascii?Q?GUpIIkjafAgu1KvXlhOry2UNVv6VBVtTV8N5nZC71hCZnEe+uNorQ4hIzW0i?=
 =?us-ascii?Q?5Uf64lG5fllS/NTKzERDyKeSlXb4S+j3RwsDpc31JnHzyTL0IMMyT+JoUpZu?=
 =?us-ascii?Q?vqQvMwPHSRXhDJkEm48r07IY43olh+ZGamhMvBfU5yZxF4zFtcfWvZV3WdGB?=
 =?us-ascii?Q?UPOeEYyR//XTT/yp09tJrsixx1F71zJ83OZepgBZP9TdVcbVmVqJXNnZGI7g?=
 =?us-ascii?Q?i5I+dZm7lpFIukYBDdvfyz9V95ciF0vY8GRS/AndYU9VRCQ3Ol/d0ncEL9xo?=
 =?us-ascii?Q?wAcyTiXyiMPbBWCtyWFhLijBpSm5ZdY0V4vHEZpebeheMkE/36GjGtWARntz?=
 =?us-ascii?Q?GMfhf1lkdvTD4MKF+Zw1/EakyoLk7/BV5tDzuHGv5WZvqXuHkccSSTBcVyvS?=
 =?us-ascii?Q?Ji4SuWD6a20XRYFqchBQ3NhAnusW+6/tmIL9BkVGkS8c6o0dH3pvzOyEg3Yd?=
 =?us-ascii?Q?X+CriB0Fr2ih6Wa2tOe3XIUX6K5yVFrGLr3cdLmNmgleLIC/qqgQt7qZRoe6?=
 =?us-ascii?Q?zDIwvVnICmAJl1O4vHyNlOR8eUMPCI8n4YcIlPBG0nEE37X+QHUt1JoV04gB?=
 =?us-ascii?Q?x+1A4/2+Usj5G0I+x2kvisz6Y39Z4q/e8FwkjFNOlcinY0uZcFGbqjgUM0F7?=
 =?us-ascii?Q?w11gvdVrLD49FY0Ssvj5hKD5ULGHP9GzErvO1MyfhPKpeBEjCPze38R1HFrY?=
 =?us-ascii?Q?EMxnIq1Z/Lv9JDoqq8C/xBqKj8qVYbDOzPc6Zj7FeJc8N+aDCkHZNr8UkyAY?=
 =?us-ascii?Q?m8Aq8NuqyFGNFt+496LXKRjXqzap5Opvw89AQMf+4OU0em+BzD3+5U41dPWj?=
 =?us-ascii?Q?Gs658u3/j32t8qq52mqEmHHnNXy0gClH6FM+p2Z3A8Gn64kCN85TtsBNjS8n?=
 =?us-ascii?Q?qoKyDnyyMOCDMh36eXLTxbTeoPNNFq/08464MhZc2uH9h4aBX4FNFCfMoJOp?=
 =?us-ascii?Q?LzWmsgikDWBXDd5m0oZGcm45VMzC6/9lx+QlGjyRMXTJ3Z00j/aTeB3cPviY?=
 =?us-ascii?Q?Uib3NoEyBMWQJNvIHX+JBhAIHhqsfdFweSLjotEqRZZrYEvuOXKfSmryVHTO?=
 =?us-ascii?Q?dDxvQVKFE+Xd2AMZRHuQ/3tPA67jGyqqhF5cMMNyqvUPDkOS+qVtfL9kZd/H?=
 =?us-ascii?Q?gRbdn2y9mDeUWqErM6p0c/Y0CRQ0dDB6Zm7vkqaPVtUVrVHfVQUsvkCPC1wj?=
 =?us-ascii?Q?ykVrKUkheR8icoNEZS2Kv7VWDzDkeVj7yLsAzeq2blanNBofMAEbX2lGEg4U?=
 =?us-ascii?Q?+mHqEpvAWHQzYf0b/5+icQZOoFu6kliaY+yoOiap2atYpTvNUYxJsVPZgsiO?=
 =?us-ascii?Q?ibhZAJ5rbzr3HutwnePcYGDKVOqG6vho5FSu4M1OO4Xs2gm89w2rC3QO+4iP?=
 =?us-ascii?Q?jdkqqEVNj1pYwQux248vYuo1aag4162eAZdyRgMaJUq12g0U54LGfLJ77X6y?=
 =?us-ascii?Q?DYvaL/gKkCaTEpBML0S9W8CAhtYyvLZhpuih/qqkImuVX6Bvil3xw0CUtsYK?=
 =?us-ascii?Q?RoyiUx+vx5xcpuCkt/7cPzYMbCDCLoyIYHXA6XKwGjTcOhvK+wwhQnZV9Pp6?=
 =?us-ascii?Q?liBhlFQYSiAWwJTjrGuBpyQ5nLozWfYyu6YzPYi8bYQs0GNvICN4ch3dJk6O?=
 =?us-ascii?Q?qhCkeVpec1IZmRVyaEjw/qZrDv/PMF2oYdlViG4LrO3uA03Yk+Q3Hls4QbWC?=
 =?us-ascii?Q?4HBboyj5CQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: POwC9BKBBsj/WQNGO17BVw2VRj6X74HxXGomLAR9yfk31/0uiTKkBDtQ0163B457h+N7jQwN7+8scieEZ97QOPzSssgk3aprSnI7QuZAFurqOuU+4mVyJtLADVR+nvwG+XKrWaE4ChwWZHO03vEV8Sr5v5/lRb+eIw2YJzOK5ukpb8ZeRxlm9rjxbnKrs6UpQbeWz2j9L4DJk6c/DZSPUwmMiR6ZtKpB6iQsQF3ireE+X/BlplYWSJSgD8i8KFJzM5DYVehd98Skdem3ZvvTkUef7slIuMCaI+H3m4v5XzsEqOP0iZqKch+xT345dB5Qtbe+s9qTcrH4MPrIUXthsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7788ac-2818-42ff-d615-08df01127be1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:31:41.1348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+MiAAbf5a/flgk4K17PmQVwD527OSt7XvjM1tfC3gQvH0/HkWTbk2wBsh7cUgpq3vcFOFrCY/v1faftZT/8oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
head:   ece58c6620869b5d7f0e1305370df473367c085d
commit: b6868a406c5b0bde10303f596fa95010ad68a456 [7/14] hwmon: Ensure that 'dev' passed to hwmon_notify_event() is a hwmon device
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20260822/202608221934.fUKdfrxV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221934.fUKdfrxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221934.fUKdfrxV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/alpha/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/hwmon/hwmon.c:13:
   drivers/hwmon/hwmon.c: In function 'hwmon_notify_event':
>> drivers/hwmon/hwmon.c:789:19: error: implicit declaration of function 'is_hwmon_device'; did you mean 'to_hwmon_device'? [-Wimplicit-function-declaration]
     789 |         if (WARN(!is_hwmon_device(dev), "%s is not a hardware monitoring device\n",
         |                   ^~~~~~~~~~~~~~~
   include/asm-generic/bug.h:164:32: note: in definition of macro 'WARN'
     164 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~


vim +789 drivers/hwmon/hwmon.c

   778	
   779	int hwmon_notify_event(struct device *dev, enum hwmon_sensor_types type,
   780			       u32 attr, int channel)
   781	{
   782		char event[MAX_SYSFS_ATTR_NAME_LENGTH + 5];
   783		char sattr[MAX_SYSFS_ATTR_NAME_LENGTH];
   784		char *envp[] = { event, NULL };
   785		const char * const *templates;
   786		const char *template;
   787		int base;
   788	
 > 789		if (WARN(!is_hwmon_device(dev), "%s is not a hardware monitoring device\n",
   790			 dev_name(dev)))
   791			return -EINVAL;
   792		if (type >= ARRAY_SIZE(__templates))
   793			return -EINVAL;
   794		if (attr >= __templates_size[type])
   795			return -EINVAL;
   796	
   797		templates = __templates[type];
   798		template = templates[attr];
   799	
   800		base = hwmon_attr_base(type);
   801	
   802		scnprintf(sattr, MAX_SYSFS_ATTR_NAME_LENGTH, template, base + channel);
   803		scnprintf(event, sizeof(event), "NAME=%s", sattr);
   804		sysfs_notify(&dev->kobj, NULL, sattr);
   805		kobject_uevent_env(&dev->kobj, KOBJ_CHANGE, envp);
   806	
   807		if (type == hwmon_temp)
   808			hwmon_thermal_notify(dev, channel);
   809	
   810		return 0;
   811	}
   812	EXPORT_SYMBOL_GPL(hwmon_notify_event);
   813	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
