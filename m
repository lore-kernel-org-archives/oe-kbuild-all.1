Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A6A3E0C4A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920505; cv=fail; b=u8K42H0U/u2LJPwFOhn5CzE9SR5nIivFOpS6AKI36NWC0M3ROV6JyhihlQA7uAKSWMTsSc2QvtbM5XwSvyxZlf0c88U6DHc0Q15gX5RaHOxkEEWoPLKkYVcPfP5SjSfTdg+DFjgprCzRDOanV6DlUFJj8UWKmqa5tdzi9ypNyZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920505; c=relaxed/simple;
	bh=+/GZhTLiLUdjc21Rf23YyhrNZv3eWzGMhhP7poVEgVg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=cMCgjqF4faLP7Pa0qI3amxXGi4DKkhUag6H1NC2D85V7N8dWvFaa2AC23x45Xp7PwBWRkwFwxvD1++qcEYo/LskBHpD0KMcSQwfw4oKuPepyxTGpvU7kh+3p9CS8DbX/LVmCy5IcwA0ZPRVbhvSaaZ/Yohx30FLxD+I/mr661Bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ce9V6MjJ; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ce9V6MjJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787920497; x=1819456497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+/GZhTLiLUdjc21Rf23YyhrNZv3eWzGMhhP7poVEgVg=;
  b=Ce9V6MjJ7bUIQukP4iA44juP5ObdSz3tHQ8tD6IaqDFnyz62XI6b1sIA
   lijAQ7kHheccqLJX6RcNU/Zfxx2ZbPhlsNdG5NgLMZepcz0SHcsD+j2XS
   saUMq2J4d14dIxw2J0Kr25BOUjbGxacP7lh/U0Aao5ZuYFGLSbOxiecZp
   4+YSsPnoDXae59sEsrHUGIHhkzJquatNCvzaKrn6jUGwfxHbEASoAlTqw
   Y7xpvrh6iWb6Brv0dUd3iNb/m2BbKkgjfVWNUHQfsl8uKz79Fo4E+zvZ/
   ERLlLKae5I+qyMVx2ibQCk/i7GgdVucTNRPGLhwKVd6STn0qI0yTAE7+7
   g==;
X-CSE-ConnectionGUID: UwF7OFclQ+yBGvBO8CZzSg==
X-CSE-MsgGUID: 3dFhotnSQyyTvF2aknZn3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105951281"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="105951281"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 05:34:53 -0700
X-CSE-ConnectionGUID: OYGCfY5+QG2NkSQm/HqYfw==
X-CSE-MsgGUID: bZqSOVL3T9OjnRxOI5mqvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="261994960"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 05:34:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 05:34:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 05:34:53 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 05:34:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1nIGQUU/pzP3SFulud3/IjpKW0diHNn6WriUTERRrMiSjeQ8TCXXs250k0+SaTSQqGx73gPpagCvXljYB7o37dehjdKzxlkD0TN1O+ng3KTlr78FROg65D6HLoAW4Dqjx/8HI0Hbj2ZPQKRYD1Zfx2MP4r6o5vUzFRNEdWG4QcAI+fdCx+VPeAziEqRQjkv4ESqXyZ9rjQni6lBfOucfJ9fJ2fSFKs8hflyrC9uEFDoGrzzNOCiUSGoJD3TQnMdy4ZL3CuV/TXJmgQCSsw1DSjpQuKyptpm+jJCF7rOJjQmGjdqbiZhx+B3FBjPYGbCvFMZmwGFavSpXDet66UtdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hh+yFV26F5355okdeTMdCqU8mnP1+GLnL+iQnit/Lqs=;
 b=MItk0KfOf6joFbtZC9eeI8l3CuuaBxoyv3HhKCq4/1hAlfKJHsdppz4TgiBnWV2rS5tj6aHfWGcfvXSHhS4ymaZF9rBLB0r3wv9Bpy/rqiyxr/BqimKh6m3iejybYfY/iNgprfLPJwlX4l+XGjbhCP+1qLhYq5FLKo8rjEjdouJ7A/zI601nL9oTyinjsxnd4j6g9n+NIDb+gg06+FGBbJWNxMQ8UlvsTqC2mwWcPzbioq6g7xrDuolVIxuMsCNnWycjEevru11dXHXEWy7B9D9gXe4MQUzAfC9PKzgp7OOca5fnxshXh3NIXaDnk6efFQlWIzrNuLJVBRZTJI+0Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e) by CO1PR11MB4884.namprd11.prod.outlook.com
 (2603:10b6:303:6c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 12:34:45 +0000
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae]) by PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae%6]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 12:34:45 +0000
Date: Fri, 28 Aug 2026 20:34:38 +0800
From: kernel test robot <lkp@intel.com>
To: <aubrey.li@linux.intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [anolis-intel-cloud:devel-6.6 254/254] test_cpu_identity.c:943:62:
 warning: 'snprintf' output may be truncated before the last format character
Message-ID: <apGAXlaTyMTBY6Jm@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0014.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::11) To PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF4E874A00C:EE_|CO1PR11MB4884:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e8e93f6-dcd5-45e7-bda8-08df0500bdc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 86SWHIpJEc9EDQqHLhq+07JKxURWcd4tzhZJCVAxn4fWY9EU+KEnVxm6V63fBMuR4z/+P/hTk486ybzAqfyflgW2vTzDhdaPmKDZgd83JaT2D3ZVW6JJx5gohEB0uGTyFAs+F/bf5iarrjy612BTJIldbRrUV9w3GpmmAtwZoPRBTIWpaS5vGgkyhU9s3W1PvjcA8SKgb+FJeydELFV9pb+bPoQp3KiXIWZGcxlnY9YJhPsvrwXA6q06t6s17QPAVr8xP947BBw+zfXTTOJZLeyIA9MxWvNVHol5xDzf6Gr2mF8cM93BtUUuPqeaseACSa9uem/jnqzjmKpzctoGeaLdES5emOTjqbGdpHtKwyMhuFjmRWReRmeLUfL75yw2vfWGJeQQBAJjakHRVau43J1/PsaMB2XoxBSllXT6HITQbXZan4mLyg84/kVM1GrpcCrqLjumk0/1azNTOSg8l6idjJgRz9aTi+bK+kDyjiPCIFB1Re5nuWJp2SxKMtYB3j16ARAdIhlGPWSIdZXOnKysec/6Koz140CZwjY0KAXMO9bHeio0mW1+3+102dAOYUTuTCJchSloDeWmYQu1P20QhHds0UN8zX3e/zUY98WSXr7iQ3gaE533gjPQ0zjZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF4E874A00C.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o1tg7UdcgvekrtTu8gF7qh9XsnGvIQ3W+W88KM8Nv94Ekl1oiSh+PoCtwLoW?=
 =?us-ascii?Q?dXYc/s1e7sUbZ4s/M7J0S74TPz0TQGST980fZ30wuV/9UPeM5GHDfQV9Ch+s?=
 =?us-ascii?Q?9S+zEnsKn92ElMPk0xwhiWvbaPRj0wjkg1WS3PIVp8vaociQVvgCFbwL/dKv?=
 =?us-ascii?Q?WiMO7097znQXmDUJ9tbVDMFXq7ZBjQGJZiTYc6DJUAUVITCaRvoK2jKBvtJs?=
 =?us-ascii?Q?JmhgUqdkPe3NjrTVQHqvl6yiRZ1+CwIAA+IbA35MqtLlpPSH7jYthKqgQW79?=
 =?us-ascii?Q?6r5JH9ng6ZD23T17szjuZsC/vzsSj3lp9gjsEr3rdqI9q1b4I6naH4HKks/P?=
 =?us-ascii?Q?PJ0MOx+s2HTk7vRsZWV0RWpFYro6+2qChuED5AhbB1wDhgTE5UZ4XhYPOEU+?=
 =?us-ascii?Q?ocXEJpCwbV0I9rOEfnvzSpXks5GLsfop0Gbyr4TJ+JtmsPwK0+8Fk+auFyak?=
 =?us-ascii?Q?XpGeGcNW50j5inbkw6JCvOojX0TATfLj8M5UZNIoD3iZp9J1nOOkrtSJmY5a?=
 =?us-ascii?Q?at2IeMdJVMYv8eWO1FqcjgclZbo0z0c0GqRVnvyz9+gWpPgJTSubSzwHIEg1?=
 =?us-ascii?Q?49++33QKaEda6/vTqAr5uAvxPghhdOWGuV0U5MDk0PfUQiaW3zvYXkcvZjnq?=
 =?us-ascii?Q?ig0UdIb3o9Fm9gUbRlKdvB8leY78qnl2QZj7bMfUVHzVNfMhmZTEYH0D97qP?=
 =?us-ascii?Q?n/5vUB5AYWgqdKmcfgj8M/HvKm+gh06og8ff/ZoFCUAZzwdQAqzy1eTIxf75?=
 =?us-ascii?Q?iXMLkYGOjv2G3M/kh1hL1BsSnaTNUZaVaedSZMM9TA2SV36zEKc/LUvjVlgc?=
 =?us-ascii?Q?J6T43iDtXpUFkvfzKwN08i/Wta1fQRqgtD28o7ZhTIufL17PYTPftR7eekAr?=
 =?us-ascii?Q?7nSDw4IRiTt3ec8oHHmbObVUtZG5JzHL2rWLT3p87K1dZZwR4VCcwT1nPClT?=
 =?us-ascii?Q?toca7corAgJeprwx3tuf2jawUXeI4NIqyGdin9RDss2edeloKxy7s95qSP6l?=
 =?us-ascii?Q?YUmI2XQOIC+HbiWA/XbGmRzsbEZgWfu32oecQjmeefPKYx2lNGozLEsWkj6m?=
 =?us-ascii?Q?UXqqL5kDvhnDqDcF2sfZkuVZXZror8LKN/irMDyyXnXx40EEIJfZJVWJVHw9?=
 =?us-ascii?Q?W9en4/2GuqnC3YOvMNmzTVnvj/SryROuO+aTy3h9sdMlpO+BQuPF6Z5zX8NI?=
 =?us-ascii?Q?T/nXq0TeA7ik8JjNq7gxLyc8VY2JZ/EYtv/mzFnNkv+5YwykT5KZC/HhP9AI?=
 =?us-ascii?Q?0RktfZlVkfCRM/MYTyuCjsWgqkDcI6QohG5XT+PTDUjJpEIVM2TLGNLp71ln?=
 =?us-ascii?Q?oEkzCjJaCYXM+uwDl/UTG1Dz/JW/laQM5piE3aCTvhcZaLGR0U0xAUeLkqXn?=
 =?us-ascii?Q?/5k/Wfxsccb54mHWgWgBbsqpalowjwMSlHjJwKgacFqem/7Yuvamhxsifp72?=
 =?us-ascii?Q?M+LEq7ZUMNU4wrxwOd0YDRC/3Ko5K7rol+K+svvocqoCs5L/snABfu6TPqYg?=
 =?us-ascii?Q?rD0bXhzZjaazQa5GjRU/oqbjpmwypzo4lhOAkQ+Fn44uMAGMB/Vb9xyCYkbY?=
 =?us-ascii?Q?M6bANdtNXBhOXlsNfq3YRzmFZh17VGdPqN+nOFSMwZkD1RnY9LFnM/n4+Zcj?=
 =?us-ascii?Q?hyx1vXu6FvgHN6QtH2/s7XplE3z4fP2HUeLfFfbzZYewXjAaFdWsiH8oVESo?=
 =?us-ascii?Q?mI3xwuIGZeQegKuak6vQKNdS1zFa58JXnSsd2/5D8Gd30kVM2A5n9WM6lZ0x?=
 =?us-ascii?Q?HjeydbSsIQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Lx4q2tKVYxj64t+wkBNxOmUaandBWlrhhPgNw37WYgSEylOjdDZB5Ntzs2LvdsuVOpxub4jUclRgs2PqfoAfYmduo33Jx4NqkEkzOUBh8nlpuui2pGsMgS6Ph0PQ3uv1bcM+SzqvO9iaOMTcFfm/ls0KpreIPgfqYV+c6WrotG2jbwjL+4ITIS+iqqA6D/C7+y6uu41gr4nMQGVAwct3fDlNGB5VYWk5y/dnK/IqUcq5s8TC76iYzwSr1+TLQW//nnd+HBZHBnk9CVs5VgdGtQdkGtqTWqGXUcPMObtlp/YQtw36fdVie7Em6j3Dv8xL4sx3A5aOcPsUD1IDnMICJw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e8e93f6-dcd5-45e7-bda8-08df0500bdc4
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF4E874A00C.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 12:34:45.2676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWZYlRbdR7xR2/1TlO5scHP4JUA2gk8sGrniPY0f3biCev/T3hQ1i86e8u2GK8DLbe/+iMsVQgccVIvan6Y4Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4884
X-OriginatorOrg: intel.com

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   1cb14b8ebd706a55e3cb0251941355687e595e1d
commit: fdeec2f4f3f7d414eb7b9cf11360e7268bed1615 [254/254] anolis: tools/selftest: add cpu identity coverage
:::::: branch date: 20 hours ago
:::::: commit date: 3 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260827/202608271113.nWwO5k5V-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260827/202608271113.nWwO5k5V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608271113.nWwO5k5V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   test_cpu_identity.c: In function 'test_identity_hierarchy_counts':
>> test_cpu_identity.c:943:62: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     943 |         snprintf(expeller_path, sizeof(expeller_path), "%s/%s", parent_path,
         |                                                              ^
   test_cpu_identity.c:943:9: note: 'snprintf' output 2 or more bytes (assuming 4097) into a destination of size 4096
     943 |         snprintf(expeller_path, sizeof(expeller_path), "%s/%s", parent_path,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     944 |                  strrchr(expeller, '/') + 1);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_cpu_identity.c:945:62: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
     945 |         snprintf(expellee_path, sizeof(expellee_path), "%s/%s", parent_path,
         |                                                              ^
   test_cpu_identity.c:945:9: note: 'snprintf' output 2 or more bytes (assuming 4097) into a destination of size 4096
     945 |         snprintf(expellee_path, sizeof(expellee_path), "%s/%s", parent_path,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     946 |                  strrchr(expellee, '/') + 1);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_cpu_identity.c: In function 'run_multi_child_parent_throttle_pressure':
>> test_cpu_identity.c:1555:76: warning: '/' directive output may be truncated writing 1 byte into a region of size between 0 and 4095 [-Wformat-truncation=]
    1555 |         snprintf(throttle_parent_path, sizeof(throttle_parent_path), "%s/%s/%s",
         |                                                                            ^
   test_cpu_identity.c:1555:9: note: 'snprintf' output 3 or more bytes (assuming 4098) into a destination of size 4096
    1555 |         snprintf(throttle_parent_path, sizeof(throttle_parent_path), "%s/%s/%s",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1556 |                  parent_path, strrchr(normal, '/') + 1, strrchr(throttle_parent, '/') + 1);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   test_cpu_identity.c:1558:72: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
    1558 |                 snprintf(child_paths[i], sizeof(child_paths[i]), "%s/%s",
         |                                                                        ^
   test_cpu_identity.c:1558:17: note: 'snprintf' output 2 or more bytes (assuming 4097) into a destination of size 4096
    1558 |                 snprintf(child_paths[i], sizeof(child_paths[i]), "%s/%s",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1559 |                          throttle_parent_path, strrchr(children[i], '/') + 1);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

