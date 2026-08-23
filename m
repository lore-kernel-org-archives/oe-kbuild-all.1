Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746943D47AB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787489191; cv=fail; b=A8BImW77Fn1si2Ii6WuBVga1KDUkBUS2HPgdfNKb6AzJKYYLxLOb4Fh9qA0SMirG5akkNFboTXQ1B7Kw4J5JGN6xYcwCMf8H2ziFULE8xjJvKK5KFUmaTfUGHM06ECB6NkhYYtcgiDQNcBcryBdBFlfL1qds0jOoFmssmaXXiSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787489191; c=relaxed/simple;
	bh=WDexG0kiJghYakvmMSyelcXVTJX2fzQL6lGGrTxhgCc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=UMpJq2hIOSP/5iKNLqXdEz7czHEGpmErrO/fZzdTIbJ1kNbX3ehjbTJvNhDX4KTDGP/qzeOCifVX1Qgv5PjvrY6gSFH+hX7Wl2lrI6KTLJOrRoBNTlDHDk2QPlVGJW9n8dbUYPk4M34YCqWrbxdzdYI7YP5rEHld+xpChoh3DkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAfuPGJT; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAfuPGJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787489188; x=1819025188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WDexG0kiJghYakvmMSyelcXVTJX2fzQL6lGGrTxhgCc=;
  b=PAfuPGJTcQ2nabadch4FbtwyriDaIexeUQNBPK4jRu14vcc1+jvTwBhW
   knd0xE/orx4ruTesyoJgQrZzZEuyk9HPl8ALGJceWJANS3fj2Eq2bAmPC
   W/QBPki0EF4aRd7iBQqytyKKUvec9cQ4uIZUXv/7CYnZjqXQ08LRyvm0e
   VUC/Fbt4ckDiNIs/TlExxV68UiE4sLyOY9ZqZG4u84V1J0EWy/fV3kHVp
   tWNerXcZBtKD+Ptky3v5OT9MXsXzvS+TioSZ+outNULJcsiUoAqxI/zyG
   kQyRInx4cWlhqh0tWNbZdH5spp1JMQM3fmfOU9Wq/gtVkAmvrDDb+REQZ
   w==;
X-CSE-ConnectionGUID: 7ZJAEwp4Tt6earC5QIqxFg==
X-CSE-MsgGUID: T0tF4f6jT8qjJcAmymoexA==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="75499198"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="75499198"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:46:27 -0700
X-CSE-ConnectionGUID: 21V0MU1dQmCtgzE6k61m2A==
X-CSE-MsgGUID: CB3r0L6KTEG3KWzAoZoByQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="291604519"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:46:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:46:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:46:27 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:46:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHIrxJ8XlF6SrHHLfNIKuyalGeJmvVL4QfSMlpkovQVFEs8chBbxChc13ic8noJIQinaMucg8Si+kR+7doGs4e/5iABntylOyEnMCVabeyPeYarvo1iIMI7WlvutK8FDX21nFNW+4snJ/M2v7eZ2lIjCoGWrfNWzM+sAPOShdlSiwXtC5x0AKOfh8HSETfDqKV45ZvLJVsTvTIsDmWWtQdv/5APNujdEhea0L89D7qZbfLTyduLOEBLtvd3yMIM4wDbgsAlwZgk2niBJ6Qrmb9ljoimZkdJhbL8EKqaycWlkeZWCbtld6AMAHkr4BHOoKMdZLSipWNfKeBcHW4jDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8qB7A6iY+4dGABwwpKzmulW8DOeQ55goz80uu+4A8Y=;
 b=VU15cuwi/NuzOYqO3dd/zEsxFJNr75bEkzGlrG2UivbFEzUxxZlpbyllJn//Wv9CDd1OzaqlnKKeBr5gN5U7LPEb/bUAehYdtDExr1SPYAhuZOM34DVYG7biVeqKp1xiIY3/aiUZAlq8JXGzdI0542pfGqdFM6FJCRh6bLx/0cyHXmYSiAwHjM7Ix+p8P0wAVxTBqK6MstGtqi+NzPJG4ovleJSClpNGcjZlu8mljgQfZeSNJ5HKIqDVVYw18DybkFiQU1Q32zgA+9wwLZMPkaCgA25UOanm3FWSPjYoYFJhGpZAhJKMSMTmRGjzGIQBsD9OEgI3sn8GMjJwzBlxzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by SJ0PR11MB5770.namprd11.prod.outlook.com (2603:10b6:a03:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:46:24 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:46:24 +0000
Date: Sun, 23 Aug 2026 20:46:16 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: <oe-kbuild-all@lists.linux.dev>, Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon 7/14] drivers/hwmon/hwmon.c:789:19: error:
 implicit declaration of function 'is_hwmon_device'; did you mean
 'to_hwmon_device'?
Message-ID: <202608221152.2Q11dTiT-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI3PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::18) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|SJ0PR11MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d1c494-20e6-45fb-b154-08df01148a3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|56012099006|10067099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: CotoLqWHjL6CiboZxDzfQuSTKBew7O1lUJ3YTG6woqvm7J2oetQ4D5KCfaV6dZ7j+qCd/UqsI876zYIRY6XXUXI6zQCNV/9S/LCII0vJ/JObkhntXF9fCrTCeht/RRIz1kJERuGn9legpl1LS6W+9rOZOkzyWSEIglxosi1GzgjO9ut+fUICyt8Ekpq/HXZlaFCtKaRobJbrh8rG4VCGYzm+HyZsqQEvhxb5NAOgjJdRqp7Ve8/aM/nVfWJ8T0b183ubn9dp1RsYDNenXNlLY/Kv2B7UFp3zbbVm7/IbHTJpr1TDCzTCtEZmw8JM/kQ72Sk0yj6vXRAFNurw6yYAADB8ZBp/lkRFoJOhXL3rr/LnRgGb7iIHlpgvKV/tUF7pqW3APCboYfbjWjEcFWgC6Juioi4AKEcMeYh4KJ06uZ5SYrIpDGbsWrA963io9k0/XwVoB7NWM4ndH3f7DS/WUfKg8i7jlYCNCDfOr+FYkz1PVVSq1FKJlSrd2maakZAoYAhgOTTehAJVGhGD8DsE38VsOGLxNPoPeUbRj+JdhT6DmwoD5mZLLKPUxEdjtCtkxWcgEyh5zxAC4Khm1khozUNqWAvA8Tul0xAtTqj2bAdnTI9CIUmGDQqGciynlCcaj9eYC9+h/80uz2lttC7L1tuD9EHhN1fZvjykWlJ1Lag=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(10067099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?klbm/XDs8ty3CprKyF7/ukdFRa2POwnMa9IPVJMleV0fHtyeZZRSYMzVRkjJ?=
 =?us-ascii?Q?eT6kbxP6BKtPkIb5JzG4rHnz8yGmTfF0L2+Cw7EasIbOldeaOGViyIuwJHzQ?=
 =?us-ascii?Q?CLZM85YWBXqW5binH7jcOcpEME8LvIsYA2ryemfAxXsCWs8nMMmHtEOqFkMZ?=
 =?us-ascii?Q?ihiAdwNeidpUNShQKwIpNvnFCwzU9jW+KAWUDF3ExhPvb8PZuVkiQye3IRgp?=
 =?us-ascii?Q?0UIvRxBkidaLNCcqy8j2bwmx/UtsvPz3LQx6bnSvEZFKBnSLiEpIPLeDX3j5?=
 =?us-ascii?Q?nrnFB5WDJD/J5ltlTW2quKU2+iOgjUYjUEGavmBe2OgrJOxpB9IC3fgqX9+i?=
 =?us-ascii?Q?w06454yQsasyaqv/q1aGfv9622qLrCMTV/mc5jp+rXTu1MYIXsR5ikHrlsde?=
 =?us-ascii?Q?vRyUEil2KrAy5wnXYuyv6mn17g5CY+3yfZicM36m1oAAdT2f0e0H+UZ1BYmo?=
 =?us-ascii?Q?lAduZkk3GMNvedzkmd7OuXkfIoXDLi66dip6RK5ZWJOlA6rP8f5IZjyzI2/f?=
 =?us-ascii?Q?4eQEq8mLtG9XY/A1jf0abuCFNKFki0W9DZt19aTioam1B3hsYLfNZpzXJSyB?=
 =?us-ascii?Q?MXyThGmw2gbrpAiWOAhBe7MVVvLJCUDH6wetofdZ9Z3g4kZng+RdZ5NxzXu4?=
 =?us-ascii?Q?UDdKxKNC7uyKUer24SbI3yxONslosaz4vCuAHryAfQp3/AdJXSUnALpkOCct?=
 =?us-ascii?Q?+ViuERuFaTHIGm1lSkznlAtbcAM+upPt1LTWmXWahVWnWH+ZTJ/aR/guYWAq?=
 =?us-ascii?Q?AnHEvzin7NHKAOz90DIrJK4jJutgQT79psAgxLo3/DScrFswFrAP8yJDslVn?=
 =?us-ascii?Q?q5+uNwNi+9rbdybdk30M7Mq+yf6ILQZ66qsd5aIi01AeycWPGO+g0smpSBP7?=
 =?us-ascii?Q?9iCkAqgv53HI7ggQgx28kWXHlo2TmSdvEvhre3BOKwwTQlNfXlpXPd2sWFk7?=
 =?us-ascii?Q?eP07nz43n2cGcqk3hbFASsroUs8Ny7M44sJuAteaTz5w6WF7L5AUJswOREkp?=
 =?us-ascii?Q?qf1e1YnLR0TYTSpEiusMbY9VXkmyknSWugdXrWTK0ai+BmAW3v25b55HeBox?=
 =?us-ascii?Q?kPaabvrzEYs1DQztgITupcVVT77swsil8FJIYB+CF7/DFQyBLFNQvax4jLZB?=
 =?us-ascii?Q?599Jr8B4bve0v6wwgSKe9ZcBfXptaRsXJmBLeP9R2oXWRGQa8NjTBIY9HMk3?=
 =?us-ascii?Q?lZX+KeClXL8HUFk2jCfQq5XYb+eSuXB54DA3h9fPSxthcfSsxK7xCjkue3o8?=
 =?us-ascii?Q?6j8Wnj+B12PWo8ejRgtT+WOIS3yw6qBsAqKH0YICYNAMwYLCHS5mPyF2KrP7?=
 =?us-ascii?Q?bkEeHIQ+B1BXBjEm9uFMF/u5z7iyii0MwQtJ0sIF6JpZC9U6ho+fdG+ER60+?=
 =?us-ascii?Q?tmquABYXAQEhiO+o0D9nVqHJ883Ub07n7hmGbraUtK6wUfr2rTYM1pHAR9GB?=
 =?us-ascii?Q?oLYNu7IhLnzs1pZY2b8PchhjVp90B6RPvy3XItC1zX9DCNB5d/7a56+8UgKF?=
 =?us-ascii?Q?KOO98fyEO4vMN65NNTvNLa2LhclFTyHgaoR0yWZLxu1ZPeXmmeu6g8Q8n3iE?=
 =?us-ascii?Q?/+eeFuXTszyNbshpvy62tBLrxrIDF9fiI5tO+cZCX6/A74aab385awHgeJ3n?=
 =?us-ascii?Q?4Ecgr210u6UIiXOoNg17I8IrxV9+Hl7dYEcKzVGQ3TENM8FDgqs+naF8uef8?=
 =?us-ascii?Q?+uiG9RhyPntoQ86oxX2rplHHWyXy0QAgi55mIyZZXHSPqnezo7a4N5GuB5Ce?=
 =?us-ascii?Q?Wu8a6/pqEg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Sy9/2XoRDhHPFN+44uLi+8pmQoW9ccVjACkumR6zmThZZejGTLmzkrIahOYCSvQXFsXYVAspKYGN+h9bSDM8e2t/uKGC5qhiYm+/fZ2NEvMKEDk8fneV2QmhSlrcopCOg7uco3q2nK/EWPwptryBBxUTKPeSeHZxtrxUBhghx3utMujssJlZwKyMPNzLrLlBnTvYx4GsAcnCkkGvRwtRYaZyzyTtl4WjiTlBt6Yck3SNAXqxBheCzTzgu9uvgKRzymjZzKyAHVKx9OFRjX339jiDUxVB8HHMDD+vY4ngk4mYJ4ux26OB+7fY2sbl1TUeYyIRo3aqRrXSzMmtugN7Ig==
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d1c494-20e6-45fb-b154-08df01148a3e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:46:24.2430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0GHGIqM47H7g1WTDPcnjDjkw+5WNcu8bLfnEI9bJC5HobuZqUdNDOa/HAJW6cOdWC6j1yDlAexITznPfKClwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5770
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon
head:   ece58c6620869b5d7f0e1305370df473367c085d
commit: b6868a406c5b0bde10303f596fa95010ad68a456 [7/14] hwmon: Ensure that 'dev' passed to hwmon_notify_event() is a hwmon device
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260822/202608221152.2Q11dTiT-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221152.2Q11dTiT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221152.2Q11dTiT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/s390/include/asm/bug.h:139,
                    from ./include/linux/bug.h:5,
                    from ./include/linux/mmdebug.h:5,
                    from ./arch/s390/include/asm/cmpxchg.h:11,
                    from ./arch/s390/include/asm/atomic.h:16,
                    from ./include/linux/atomic.h:7,
                    from ./include/asm-generic/bitops/atomic.h:5,
                    from ./arch/s390/include/asm/bitops.h:75,
                    from ./include/linux/bitops.h:67,
                    from drivers/hwmon/hwmon.c:12:
   drivers/hwmon/hwmon.c: In function 'hwmon_notify_event':
>> drivers/hwmon/hwmon.c:789:19: error: implicit declaration of function 'is_hwmon_device'; did you mean 'to_hwmon_device'? [-Wimplicit-function-declaration]
     789 |         if (WARN(!is_hwmon_device(dev), "%s is not a hardware monitoring device\n",
         |                   ^~~~~~~~~~~~~~~
   ./include/asm-generic/bug.h:164:32: note: in definition of macro 'WARN'
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
