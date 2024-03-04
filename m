Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86F5A31
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 01:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709515159; cv=fail; b=pgl5CfJKQLA7z5vsdtUlmvpdmjO8wmw4A9mWk/RdoYr+k8b5P/pYN54+hXk23itgau7sP9srgBbaqqS753UVV6Kb5GYMgzq2oV5Uf+ye8ZQ2UEpnjFMtuVnMqXrONV0Xk8OYXuibI2joPyJb+C4MueaQlAVNONEs+1cwmnTzD18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709515159; c=relaxed/simple;
	bh=hKLWlGnJHGKOLD46KwX0RvxSMPB+bu/W/mQTAvYdEhQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qz147eJziWQvOT/OApJjX1SCsbmLtVsST8+K0AoPeikfvuTDjJXU0JCJFsvGmvjS5SZPOrFTcZC0sW/1m4iGx8+AE2HNjV4krzoMK36C7A3bfgS1uH3VF78VdzypL3Y+D2l2HXobhq4A8CL3vIirgd/LRHUemrCIqWeY7x3+AJ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YuF52qXG; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YuF52qXG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709515158; x=1741051158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hKLWlGnJHGKOLD46KwX0RvxSMPB+bu/W/mQTAvYdEhQ=;
  b=YuF52qXG+Qs4dpoiX9/8ChNZZlvKf1qrXcMbfQE3TJABOyW6X4AO3nNn
   r1HeM62szUX2372oImIBF+4sQhu0DxhnNqingM49tnAIVG/0ylRRLA6qR
   9CXvimnareKlUPujbMU9mn8bGTMT90BDHRmsHV7Pbe9+xSq1omYEYKK4l
   XnUDczruNmlV4RdRMG2Bd+SBHZvQ6qp4jxzHOZcpMWeer7nj+kndanEob
   8nE2LelJ3tKsZGG9MBQnlY2IPecrKLAp+lKMKdt7nlT6vb3UDG3cFKd/8
   CFM82VZ7ipfxpe4Yjz0zorB5WNaWcxn0cczpxb6WvDf7HZ6LbmYa6Gr+n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4114814"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="4114814"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 17:19:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="9012833"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Mar 2024 17:19:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 3 Mar 2024 17:19:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 3 Mar 2024 17:19:16 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 3 Mar 2024 17:19:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwrhhWOOUB6t/ymDMZlrFeqYXoehl39uWxzc7jDh5ZNia0YkosE0v0kkgn+yFJsseVNCXOmW3ux2X8HVc9RqJxHwTL0LC0blw1QEFrum2JiF78J6OiU56ofU6L0Okkhcx5tkXO0lEBemMbndZqg9rwO6mstCHBcrLSRYytm0bhtSqehkXbyHnOVbybSzjCXC4g5TokbW7wtyAxrJI6J728fM7B95h+hOVOBbjPogqt9PNcxWuwYOjsfgN9ZsJkuRDAR4WfO6KcM/wQUMihQisqVm+on5N/2x57BKx7zjxQXT0KXo1y9i9BYIsnPlnihIzvkamDeRdMEdoNIO+EfMNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gklfw+k1XohijsYnwMDC4051u+64CnoTzWyrh93UCk4=;
 b=hPdw5M0pVGJZoeIfhDPOf5WKjYKRtlgO570A5sXPVFXepIgj5f8X5g7yp644sP8GlAGMcrZi2j7eUjwXjQypZGIHdrUtwyGNe7EkcwA1k33BoQHt+gpGRCEsG+wCjxChhlw3ayNUoEzDTWHrs2fzggOqfnsqJPXZRoV5SL7BT6l7st4E89NcVaN207jGqMPwqur8pD4UIDo/WUtCSSq/f5W557BfdJQ68PpddI1OekxvlQfYaTE1bdlW9fculg/LW4GuaQy0PuBw5oTrX3hMEvZ6qIuIWpVKnMsYlmHl4YD1XdLPpApzFzs1Dno/rcdgoxB924yc+Jof83UJgCUjLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 01:19:11 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d%5]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 01:19:11 +0000
Date: Mon, 4 Mar 2024 09:12:22 +0800
From: kernel test robot <yujie.liu@intel.com>
To: <steven@liquorix.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [zen:6.7/zen-sauce 8/31] arch/x86/include/asm/string_32.h:150:25:
 warning: '__builtin_memcpy' forming offset [21, 56] is out of the bounds [0,
 20] of object 'para' with type 'struct virtio_crypto_akcipher_session_para'
Message-ID: <202403030354.0JmmpenE-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0036.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::11) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DS0PR11MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9af167-a338-4ff4-577c-08dc3be918d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q/c0Kg5lQ3mamL9hlS4gqdHoFyj3paS3RwRcdYgevbcy0taLy2JcGtcwXwUde8L8dn5/zC2mdFQMaLxfqNQ2CTQHfzOHBT0HfMm8Y+jmy95fliGEK8lTwA3Dd0La+RzJMuqmtEztmJVWntvUtNMs3h8gw++eaNg0TzTaji/Gu73O95A1WbaQvaUXWz0nxc9yZmEq5PWG1E8reJ6EsvSaOS3MF+o5pqpD/sV55HVvBLMoOH7sQzcLN9O5SSnsDq/xEd8NcgQZWGng/5YtzgcmI9vxNrYq4bgyk70cVe7eL49lUf7/9/uyN3mVi119A2WmePMzeMjPa/wY9d1773fUzcQY06DRo7zgcEImMa+bF1Y4EA210ZRVOUvaZ8fkS736KzbtVcM+HR07qdUEraUuyo7db09MSvrogDm2OnEpnEXjTN12GHW5nSRQq9MeKdkOkwt5n8UViEINHnVM3AjzGeGnJl6DwZ0IRVwQVpX/plWnqv6DvRxkEcjat3dx5M8fq4g8cp1uJXSgWaKdNmiJ0eibT0t99EvSa/N6eilTC4dhr3hSv4H3rS4vmP0FYGWyJgPRcGXWHPCOJz03h8x3OwgvObK5+6mru/4tjWprD9q1f67e4ONXqr3NKg/EjYm3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P4zgklFdjU84CMpaZgO/8zs8b0X6U2ecLKQ7nDfrLz2fNTHNozRqoEqMp3co?=
 =?us-ascii?Q?ZDSTeQ+XWA9XjMnQOk4YZQq3W3xF+C2u91k8X9ucK7ThQmrrdvpqzhXQYxEs?=
 =?us-ascii?Q?ELNvU3AV7Y73aN90n6C7OEl1Um+X/ymEgDvp29j2vGEvvszgR2e6QD6CRRJg?=
 =?us-ascii?Q?Zcl9sjm/2ZUQsCq6WbEymxiEiizjNfIGdM5vX2aKL06vrw94BSHOdRR8XuAJ?=
 =?us-ascii?Q?vH/PK+8Y3Nwh7GaqMNyhTjnwTmRN31Img1d7IuT7ynZwxN8SGNBM6n3A+tnI?=
 =?us-ascii?Q?wCRPZhFnDMI+Anc701wOEvIkGjmTBN3gsze4r6H6ax/2ngOJjM+VfhYut+lT?=
 =?us-ascii?Q?oz8L7AD3ovlJ7PTMcY9QaDUlJldRox5k3CzvAExAByvP7/Y0wlmjQkhiSkgd?=
 =?us-ascii?Q?4X3uFcqFYcNRO1HI+4JS3gDwKh1x8+m151llvI2/pXPmWy2pmt4amt/Hjmkf?=
 =?us-ascii?Q?8eGskaCssPmAUJedqTulQquq+6vF6ABwnRLTzpfmYpxmlmPtrnAJoJYoFSu/?=
 =?us-ascii?Q?QL9BnJB1nyjqq8XbSJrJTLGB0BB74JO5mbhzL32TwqFMxlG0oxVQOmFX8TNi?=
 =?us-ascii?Q?RjxmT2wpEvgXMXAMWZWcb+v8jDMYSdPFS/f2ENWv0klMtNVy27jH/2tl4pcZ?=
 =?us-ascii?Q?PfIy6zwNRqUUi8bgB8NRf6dwiZBkP7dO3C9qafRSczul4r1HZ4Oecd112W+d?=
 =?us-ascii?Q?GfZIb+bfv9Us4bpnT9BZGtVbS4TpdXGEcdEO9kmCgqmy23k++REewXu/+hU/?=
 =?us-ascii?Q?EyyRwELgYpHYz3VsvNCX8SG4YjtdF0Sw/QQVqcDXsZeeXlg6FRWRnTCJUx2S?=
 =?us-ascii?Q?rqwP+hpxdoFh5Ox2krE7aWViT8NOd+OmyuwLdXnnDIS/ZkJnEPI/t0GHAT2t?=
 =?us-ascii?Q?zjlXAP/C/kOiWtri80ndh5ksgKqBR79P0uw5M38BzucbepMI0w/ZlXFOwBOe?=
 =?us-ascii?Q?6/JA2PyeR1qI3CexIR2YxoG+N+MkNl/HfSMn52/odeiZEKJ3gv+RY8cL4DQk?=
 =?us-ascii?Q?wKYTCeXxEf7JL3+N93f/4TrDyl1XrqXxL3RgrsnehRGCsteYq8Oi4Gm+c/75?=
 =?us-ascii?Q?wko0X58AdEL+yevqNEslNUAtRYsYz5p+R52U+hciGxVV+pwZwdWrXJA21USX?=
 =?us-ascii?Q?TVyCFVgLOL4sR2fb85GfHa3gby8JQwFadaBHUMWKyUV+5kLAfr5Gk+KKSNcG?=
 =?us-ascii?Q?c4zDrGtPLZWEYV29HLEpggq2A7gTXbRsldpuknJ7mKvjn5AWB3ArNVZZ7JVo?=
 =?us-ascii?Q?92yl0aukhzLc4AwFB1EIP4Ow82v11saXH8gFM1dt/Nbu4YaHPq7gAlHUnKCV?=
 =?us-ascii?Q?LhuGNxJfOG4UdGQyBu3uo+NBEwQqXF7D1ZDqfrKHNLdXG0af6i8GaUQjVHxv?=
 =?us-ascii?Q?hRXd8r0onSkhNPj50usiTudb4WWVkGWUJU+HHwmb6u01yU+NABHvKk5oEC5o?=
 =?us-ascii?Q?cXz+kDN0nm3Lm6IgMY6RTvXzWJbuEpKjIdHIVB/x49Canq5XofuSZAFCqFuX?=
 =?us-ascii?Q?5L5VH9I6kWa6MoW/gAoi3IM8543FhOZHt36AtQhFgcE2KPPD8H/qVLAhs9NT?=
 =?us-ascii?Q?iGI/OxxLMWp2yxpxtsTO3w9hiqhfIZiQq9I0KDcH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9af167-a338-4ff4-577c-08dc3be918d5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 01:19:11.2369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwzUZCzoq1xItL6U3r4LvdyPsaZbaLkpB1kfUrRGdP9T5m3jqYofE7RaDC//3588ND61DhEl4sN4knvax4owCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7736
X-OriginatorOrg: intel.com

tree:   https://github.com/zen-kernel/zen-kernel 6.7/zen-sauce
head:   01ffb5c93fff64050b2eda359d20f812f62c91c3
commit: 47715d438aa7c28ae732ab8cce27b832e93b6b51 [8/31] ZEN: Disable stack conservation for GCC
config: i386-buildonly-randconfig-002-20240302 (https://download.01.org/0day-ci/archive/20240303/202403030354.0JmmpenE-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403030354.0JmmpenE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202403030354.0JmmpenE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:21:
   drivers/crypto/virtio/virtio_crypto_common.h: In function 'virtio_crypto_get_current_node':
   drivers/crypto/virtio/virtio_crypto_common.h:135:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
     135 |  int cpu, node;
         |      ^~~
   In file included from arch/x86/include/asm/string.h:3,
                    from include/linux/string.h:61,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from include/crypto/aead.h:13,
                    from include/crypto/engine.h:10,
                    from drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:10:
   In function 'virtio_crypto_alg_akcipher_init_session',
       inlined from 'virtio_crypto_rsa_set_key' at drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:425:9:
>> arch/x86/include/asm/string_32.h:150:25: warning: '__builtin_memcpy' forming offset [21, 56] is out of the bounds [0, 20] of object 'para' with type 'struct virtio_crypto_akcipher_session_para' [-Warray-bounds]
     150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:131:2: note: in expansion of macro 'memcpy'
     131 |  memcpy(&ctrl->u, para, sizeof(ctrl->u));
         |  ^~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c: In function 'virtio_crypto_rsa_set_key':
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:375:45: note: 'para' declared here
     375 |  struct virtio_crypto_akcipher_session_para para;
         |                                             ^~~~


vim +150 arch/x86/include/asm/string_32.h

^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  149  
ff60fab71bb3b4 arch/x86/include/asm/string_32.h Arjan van de Ven 2009-09-28 @150  #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  151  

:::::: The code at line 150 was first introduced by commit
:::::: ff60fab71bb3b4fdbf8caf57ff3739ffd0887396 x86: Use __builtin_memset and __builtin_memcpy for memset/memcpy

:::::: TO: Arjan van de Ven <arjan@infradead.org>
:::::: CC: H. Peter Anvin <hpa@zytor.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

