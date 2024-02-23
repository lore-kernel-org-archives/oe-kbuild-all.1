Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C4D79C0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 02:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708656301; cv=fail; b=sRO+Mt9dSj/DWcEmv2EtNJ6RwcfllVT9g3BrUJej13zY/D/Xzw4SjF7rZf/tPLMAzf8DuzlxmTADxEGitLPTOCrGEsW38E3IbVjgPYquBrqCBTRXHSnTEAqv4TLijuxexGzIWXT9tEgxsXFOUp3gw5IQtF14fWVzisJf9aws48o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708656301; c=relaxed/simple;
	bh=lt2tV6kvpZt8hUIUeaJ2m7uGljNsySWIC1UTN9LgsRk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=LCRfpx5EYyo/hltRWmlDLeREFPPyp7EyRQFETL5AYFykYebSL03QROGxj4vY8Fc8I46v/RZVMOBQu5r+vKuiAmHArF5YaRx7sw9EbdkbHk75fNUi4Li7X58rfm/+8s71FEkXs4TpZCYxFa1C/M37FRAFhzUUfB9PAbObMUqFuOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyqHSsLu; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyqHSsLu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708656299; x=1740192299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lt2tV6kvpZt8hUIUeaJ2m7uGljNsySWIC1UTN9LgsRk=;
  b=CyqHSsLuzB8on7EWcr8FClx01wb5Pu0a5ad43/I6tbgPkjq6VWDoTVG6
   2pS/ImjGRADKvvULqBUw1Zin9guirWAttz2zrQzla7BF1fVvb03cLbdKs
   +Oof28dgZ3EVoiZ0yJFZeqzKPFlBYFDARV93ASj8I5ElbQD+E0f6jkDSL
   SbKgLsaXFKYY1GmRWP5ENBoqfN5u3hCRNQVuFjS5lEjkNCRb8ePudV+t9
   dlrTQ6ezan+NQVzU7N5sYXDD0TO8tekwjY9iU07yD0qXfNYTw9vJ6XoSN
   UHCI6DSq4ysWc9YHDHJiBSLHypP8x8/rhzZsriNhA2PuJvQ2DF+7C+SFB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="14381423"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="14381423"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 18:44:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5713186"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Feb 2024 18:44:58 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 18:44:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 18:44:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 18:44:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wst9hov7Wv0rEUJT5e5LYGPvqrMuVWSm1mXlI7U6bbIFg5UE3SK2ZHu+m3/ZftV3Ky/uJGYuTeGDYmcpU53A5QGIcerO6sL5YT/FdRGHn/zMSh+7OqjN6Iuve68wTjMzQWM4TEC1RG774TJqNI/RsJrD5ikVLv1CZ9JMAWld61dXMKcDF5xaOmjuBmSzhFVp3pHhZb7xR0aEgbaTXuFlSPaB6ewao21EIHALB9hFZJcDqcTOO75fHrbxD7Llc91lYxRzN95ZJXN7fHtvGRsKmYdwjn8JZS5jLT38ZaO258i5+XaZsUNw8wA+Xukr5D3QwG9c0wgZDuUzPaN+FIIv5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaqjwFqXFup7Mt1waIS4u98U3FNBwoIN4/BXkwM3J8s=;
 b=DQLEk8JGZxNyR04uskcpIv6hxlagPEeWvrsgK9EUhQrI9JvIVYp6BrRXeBFDI7SX5diz1eBm9YlRKCVmLFQK5tv+XHKmnMVWRtoTh1fenCpc7kHbMx3FemqGbQuzTWtwnNdDHsMbGky4SNYaK/woml9fZ9LEwOvtywtxRQSJd+YxhyhZu8hNHiYgQumy07xb49qMkKh87uEk1UqLm9qPiCKi1eDgyP8836a3SAD7tvn6Iqhz/9O+z38gDrPERRvRofJ87NeMYEmKRKqoKMOwmBFzrBb1SS6Wf8NzizgZNPYTYNGK60Zox2EDnBWkRznr2yhZi0sYlwWZfmva9H8+Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Fri, 23 Feb
 2024 02:44:55 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7316.018; Fri, 23 Feb 2024
 02:44:55 +0000
Date: Fri, 23 Feb 2024 10:38:02 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, Suren Baghdasaryan <surenb@google.com>,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [surenbaghdasaryan:memalloc_prof_v4 14/36] lib/codetag.c:230:6:
 error: redefinition of 'codetag_load_module'
Message-ID: <202402212245.S2F7Wcl7-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SGXP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::29)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: dc7651b1-3e60-4445-be51-08dc34196b1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ktgNP/0v4W8ZYuCRuc3fnRfz5/BeKWnWHlVu+Ya+LVdqdKzAXpqPNt9n4dDdNgrJgB5c13mYUwlfwVqIlh4y54lqKZv2OObczSjoWmITekCo7Rkp6YcnVoqAEb3L6Uw5Wo58iJOW4uwM47DP7FpYuZiPjDCiwAlQLFMVgekaEH3tbbyl/7+8WvausnnIsdb/SpjewePs70eq9r/Jz/jbv4sfksqY14uPdKqLl4Fcbvskxmx5+hEzdGGFBLd4S+72zTJY3NmtuV2qZ38sGys7GVNt2BSNxp4yF5WVjnyxCAJGCVYrmsiidOWWqd4ZGqBUNH9rztUhFeHvaladpWuGOA9zoi9qHfn5SAlUCpNW8ePEcxomwdo1H/T5mvgXjDn+BGBxfhywpCe7fFd3Yd8+C7NFl+r+lpbz0zw4wlr2s2/TkjV/tjd0HMk1vlyZKYxL/SQmfj8lmdyFKAJG8Hsk2qPvCsw2VDliqKJa8uwZkQekeOakGzA5dlD4ObfkNVyS7P2kEwjnzPY3wtNe8Z+b2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ii7ed9J7J/PEP/+u6geKhXLxjO1s8XSFvwmimLI2z27oGgQyH489Q8ZxygEP?=
 =?us-ascii?Q?pxaOki+DiQkEkRb8W/8URnw+S8wHwCYlQOVvAQjTOHiNFbmVqgmyvA4XGGxQ?=
 =?us-ascii?Q?la4s20UOwuOJ5K3ICcrGN1Ata5pVEjajaJ8/Nfm9qtAcSlciLV2NdLiij4+o?=
 =?us-ascii?Q?UoHQPywnr05ngjTOEtvZoe7zYxfbW6l1cIwU5Pd0g/rr1hRcWYjxTiiL3Ep3?=
 =?us-ascii?Q?289inJ0KQePNiraXfhasT1BA7jTk1AjDQEu2ASVoVz6Be+1xqZ0/xbYo0p2F?=
 =?us-ascii?Q?kWRKJNaCRMHMWaUGT9fHgCPnR9Ge+RNfgbCPM/dXO5VJW21gXPwmKuVnmoDw?=
 =?us-ascii?Q?d62AZlp62PxvQY1562yuSoTyT4UavDWRKAnaax6sDWR3Yg9WCgyUR7xJjzrL?=
 =?us-ascii?Q?UEtaGig+yeW18gWCgerelvtT0vhA06SAmuB1rrLGYVhJeMXrKAiiSajNB5fb?=
 =?us-ascii?Q?2eIHoYjl5B1v+evcC38Kweot1SdwYirmP7cuxMx9Jp9qRzZ7Unua3QOHjqQq?=
 =?us-ascii?Q?2Zd8BBzNmnqi5y+FmnMW31wOr0mzB+1lJFRXRHPACeUGD2r2lXBmEzLmhwqx?=
 =?us-ascii?Q?LUZLVOtSke0w/BqsV2ogTGQHBrPpBNrbkaU3HdW4m6tXGM6mZM8GbO22syF4?=
 =?us-ascii?Q?olNMTX5t82dLI9yemgIIaDJHmkjdLL4Dt4BEuAHAHsJljvaECNbkXW3ZWQLt?=
 =?us-ascii?Q?noqcXkoNtH+N6mkNFoU1x/LIrdmhGG4a39OaBErG2Q+mi9Ie4nt0CFKhFX7P?=
 =?us-ascii?Q?ACli7q1tM25aiQGjR59C6giy5O426zv6U6Zz153fZupW8t0BkovkY+E0b1mD?=
 =?us-ascii?Q?HyltLfA25/d5Kkkbjvv/W/7Rhd+rwjexodpt9qyPQ9jy49H2gUtmdVUcZUMW?=
 =?us-ascii?Q?iKS37xESC9IlSvK0oxiy47r7Kihs6FOWJBgQOev75aYnvCGlJwI936xn+HyU?=
 =?us-ascii?Q?4toZtw4Wm7aFgW8JIa1Zr2fJGu0TYWrRMEZL2+UU+3cdNjoNuZZwu9fhIpMK?=
 =?us-ascii?Q?pEMC3XRZRsK4yomL/4hpKBcikWjXNrD7Ir2T9w+G37P3h5HpNx+jh0fApTX+?=
 =?us-ascii?Q?k9Cr+9M8y5Nx08lTBgYdu/+ERnaxAbI6vJXNDufebLWpW+XFs8cuw24+yGaI?=
 =?us-ascii?Q?1+GDvEoUAth16dJ9MTUPytCc5GxVU3yVw/hvLVj06YkHD0EbEdYR0r7/t6QY?=
 =?us-ascii?Q?jOniYg/Tns6YRAGn4ArudgDfJcCPdmMnWG4DDIpAVAHoCwkBy31QE5UtiJmU?=
 =?us-ascii?Q?8XKVi9c8J1Y2qbThwU/29eEfwCWStpx8vkWGAiSUXJMKMfj0fNhfqOjpd7PA?=
 =?us-ascii?Q?qKtyj9IgYKnTND2SVHc1ZccogVghOGT/J0zrd+OB4DxrRAERosKmfGAmbVo1?=
 =?us-ascii?Q?jXggi/WJmxVQFYKp37z1GDE9JjjSpovlY7ZiDheEum5MvgdUrTfJXtA2SzCJ?=
 =?us-ascii?Q?SVKA38xQfVNzpuBhaPthGSAQuzxJPdXN2qQVQNlJaEmdKyKK9mEisI59UZX0?=
 =?us-ascii?Q?Q33x+PtsMG4HZEKkFPuJ5/WP75/JZrgFw4OsnJyBMGyspODRCq+Yt550g0uj?=
 =?us-ascii?Q?tMSjGHfgm1Nsz0lezgtNZIpchc8o57daGheBbEWa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7651b1-3e60-4445-be51-08dc34196b1f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 02:44:55.6545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJOaBqdGnDzhj4JK77mub6KpigzEo9DV+FHK9JwwrpYZfIjMYLKFsWmI45mU7xq6q4EFYsdjKYguseFTtdabCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
X-OriginatorOrg: intel.com

tree:   https://github.com/surenbaghdasaryan/linux.git memalloc_prof_v4
head:   62d6d360c9fd4bbfabe5aaacba64c4c02e8e6ba2
commit: a955c0c54931160e15915f315d43c9cb8acbb505 [14/36] lib: add allocation tagging support for memory allocation profiling
config: arm-randconfig-r123-20240221 (https://download.01.org/0day-ci/archive/20240221/202402212245.S2F7Wcl7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240221/202402212245.S2F7Wcl7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202402212245.S2F7Wcl7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/codetag.c:230:6: error: redefinition of 'codetag_load_module'
     230 | void codetag_load_module(struct module *mod)
         |      ^~~~~~~~~~~~~~~~~~~
   In file included from lib/codetag.c:2:
   include/linux/codetag.h:76:20: note: previous definition of 'codetag_load_module' with type 'void(struct module *)'
      76 | static inline void codetag_load_module(struct module *mod) {}
         |                    ^~~~~~~~~~~~~~~~~~~
>> lib/codetag.c:243:6: error: redefinition of 'codetag_unload_module'
     243 | bool codetag_unload_module(struct module *mod)
         |      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/codetag.h:77:20: note: previous definition of 'codetag_unload_module' with type 'bool(struct module *)' {aka '_Bool(struct module *)'}
      77 | static inline bool codetag_unload_module(struct module *mod) { return true; }
         |                    ^~~~~~~~~~~~~~~~~~~~~


vim +/codetag_load_module +230 lib/codetag.c

d40a98f6656f63 Suren Baghdasaryan 2022-08-07  229  
d40a98f6656f63 Suren Baghdasaryan 2022-08-07 @230  void codetag_load_module(struct module *mod)
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  231  {
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  232  	struct codetag_type *cttype;
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  233  
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  234  	if (!mod)
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  235  		return;
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  236  
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  237  	mutex_lock(&codetag_lock);
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  238  	list_for_each_entry(cttype, &codetag_types, link)
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  239  		codetag_module_init(cttype, mod);
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  240  	mutex_unlock(&codetag_lock);
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  241  }
d40a98f6656f63 Suren Baghdasaryan 2022-08-07  242  
e1dcad488eb077 Suren Baghdasaryan 2023-03-22 @243  bool codetag_unload_module(struct module *mod)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

