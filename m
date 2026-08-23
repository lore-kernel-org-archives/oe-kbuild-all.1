Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D735C3BB9E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787485424; cv=fail; b=EY6bSm1nvuxvuYqS0oclA11h3Aa+olOpaL8PRzrq6BO1piMErzMbohRqrZ+2h1AP9UiPIeoTweKcLkrNyf5HjIBHk2EORbKLjtfp6mChNeW43+TzCkV8UzyZmsac+/+4w8PEFk4CZFHUamZEzafZO1bxqqP8nrJlvq21OgCSDNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787485424; c=relaxed/simple;
	bh=PkwcBTKdJi0MIZCR4kLeVjWHBk4GXzr/N2h5fM8bQyw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Ge73Oc13YgqKMyMQIDwDk3yq1mSBOsFKIrhb6U+GC6ZZXlrSwYvCCKisGHabH5UWegDlV7OBMpkMN3e0HwAm3F2t4YBqHu5AU8LIptxVmg2RHJVDPDwtgU+vCmNwK59xab6sCSF16jgRvEreh3TkHN3M7+vDl85Tn3YZ9ddpMXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKjXKdaC; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKjXKdaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787485422; x=1819021422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PkwcBTKdJi0MIZCR4kLeVjWHBk4GXzr/N2h5fM8bQyw=;
  b=BKjXKdaCYhkw/Fuq8fQS0GTZmLa2scnr0VsU5CKQJMDa371d59PUcQiD
   kGC4m8PWnaGHs2zUoWBucw7Pk35vXHE2vsFFH7iPY2PnpO0GLABbISOkX
   BlDfhE44agQYyLBEsBUVPr667INg1xTfqXCgQmexizIu3i8yo3LCQ2yWY
   TJ5OC/kvhNN2jIXidYQdkh1QqiLq/bFvgkj9k5B9wP8lGrA2bIYfHbmF9
   SH1QmpWZGp6CEyF1FBhIp+fhXv8FJT2CnvRrl819j7okCtfLDvrQAotvz
   lmAwCbqa1FwHynE875RDFx68nojCb1ZI458e5NWoc3bti0wBTr24yA5ZV
   w==;
X-CSE-ConnectionGUID: WWcwiPouRiCAWoGKoP9Nbw==
X-CSE-MsgGUID: k8ie+vRITGuC7cuApWgm5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="90473365"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="90473365"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:43:41 -0700
X-CSE-ConnectionGUID: WMRTUE0ORqq7WWtg5ExGCA==
X-CSE-MsgGUID: duG9SUSARJ6svCHyxWXRkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="296664376"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:43:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:43:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 04:43:40 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.26)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:43:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBzPMZFACPRnURGndp40ncCFEQ9kACHaCaReYhHv1HU+O5E4rVdfJlnUWjQMN4DCBOvcfPpm0Ow9mKmOY4wEDwcMj44J9+VLAUJppuswRxa36zwoiXXcTckcca36xXlYiXN+bFT5LOFEmDFOVc6jhYgcjbIttIVjsh6xQsi+dj1Dmr1QzJNFTb3kwymvBJO8wkHcYa5hW9iFKP8NHtGmF7dk6Q/trcrcNHljTQKt7hyM0ekVzXKggElUfQ3jRhMOh56ooldNZSbuP9UEIOB6CiAddQ1HdIA7+cSJyq+xDNVTbOQm3ym7HFOxWzA4IW2hwkwm4/d6b8w3pvYx5iVpnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMKVKrBXeC+icFk9RGyN7ROEu9XvhrYv3et+xEiY1fg=;
 b=RH7LFzf8kHaB3/b9nOYjEN9fc0QAdjS/Uy6q6XHk+2xMJY94Lk0K0wKRNVNtaMzVpobTXtAvu2nSJbtPiOY556xfkaolHNI3IRhVr2EG99cwOTZb9ZwTz1EWQLvGeB8p3/QuP1Q6RCjFX/sJrFICfWjYp+w5T1zZPHcKcE4s5ueixlRShvnKRq3km9xuKhysQCC3WgCIgyoNrwEbDDPX0TB3oZaKM4Exv5nf1P3Vh+RmWsadGYz5Tx5/hpbwvySSuvnIj1Z6AK+s2BNPXX7o83oX4elP0zzlzyy1Qq8jAhmbQKZ9o6s0Oe828++eCUgD2CI4n9yzDIFuR4uufJuPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW4PR11MB6786.namprd11.prod.outlook.com (2603:10b6:303:20b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 11:43:33 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 11:43:33 +0000
Date: Sun, 23 Aug 2026 19:43:25 +0800
From: lkp <lkp@intel.com>
To: Philip Yang <Philip.Yang@amd.com>
CC: <oe-kbuild-all@lists.linux.dev>, Alex Deucher <alexander.deucher@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>
Subject: [agd5f:ualink 121/183]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2051:26: error: assignment to
 'dma_addr_t *' {aka 'unsigned int *'} from incompatible pointer type 'u64 *'
 {aka 'long long unsigned int *'}
Message-ID: <202608231737.Sp2rttqA-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0009.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::8)
 To SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW4PR11MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: daaf1b14-a6fb-4661-758e-08df010bc26f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|42112799006|376014|23010399003|1800799024|366016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: rftZrXCSpFAmLvSO1Rk9bb2ItYs3TRZhrHmml+gqKqLVxDxlWbkCsmepzvGvdil6+YbPILI63c/C0WyUsdejYssNoAKTpWoq1YZxh3s2KQXaZamI8cAzO/q945uU7nsdXn0YUj2ZeoXZJsAZwn2U8LSEX0uqs/R7Ia+wYFUE18RuHzCabZ3vPFVbQvS2Qc+W+8gsK8Z8gqcqSoijY8TGGNm4gga/2iRWhlP/yNmZxLLG9+zzNmH5G7BVq8h5egHjZjPv0BEjS/nypt+gEQiwYaUQJv8MUjftkXatPFA/+FKCefU5/dvd16k0OVJJOXMVRW7+UcTZNKl4xgapZe5aTH3uCwAiaNzUG0G3y9c4G4jtNmjxkcGam58efwJSqkp66NF+6NX45/x6OMu/m6MbC22YwnGh7jCrgieFyZxj6KHePWC/Tasek8XrDNCizWbm2au7U4+ucSxX6h/Vul/m9a88oW1D2NrSqs8C74XZSvSJUsVx5TMRbmtISYyupVhc2UUuAeAwp3Oz/FyM58v934Krio71tcWBi8gWZwGYQmjK8dpR+7yqkO1uSaEjVUZQEMuPHP/4NiotDN9SCIsHFebJtSNZw/LT3qo4psfVlI/K/+04BOSycRkIEbCkU/rM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cQPVqlI6S4B5O+f56lY0gdoHIkMuigQmgDz/r1A2d/hf3TnaJm4SwukCsVJc?=
 =?us-ascii?Q?69yoAHv0YJ+0teEqjoQTyuUQe4kMJtl6I1sy/fyKzu+bmydQgmsNDLZYrW7a?=
 =?us-ascii?Q?JFuiwm9TMWZ0fPyU7dAIcacfUyS2++eHSad3UECu7gW04i9WQdw6V2j3aOIU?=
 =?us-ascii?Q?TDQfALbHKh0EfQj0s4xc27Lv1AnCDMlYG8NFGhMYx5xNtcSlJvjI3fnWGOcF?=
 =?us-ascii?Q?RRcY9t5HtZLW5pn/NU4Ka4dBZEVEEG0v4g1pE6pV+DsagA6qQme4xK3gYIql?=
 =?us-ascii?Q?A/wVEN7HQnI9+UCXyvDQNF4IxcQYCs1508xYaxEw2zbC3wuOcJRvwtYIzcUU?=
 =?us-ascii?Q?aAQ2Hh+5DSHPlVVA9LRm23ljvhNkBWQEev/ec5rElPIaIW3XRr18bPfQgPss?=
 =?us-ascii?Q?NZ2Kmzm3AGPhivqtMjnd3J1t6YrSBa8jiPT9XYUW5H7gBLbaIVWw+QfOFnjx?=
 =?us-ascii?Q?sdl+96SajULGqoLNn7moyOqgcRbwMdc5E/Mqbh3DLMNGzgTGlB8xzxLGLnxf?=
 =?us-ascii?Q?T2eG8GKhJDmQfwufKOWaSQ4olmYAC/+Z9olP3m+G8T6/mW+qcXk5SZ0XSUAv?=
 =?us-ascii?Q?g8H/5/67qZZsONSF2KMgngPLK0m6WRmVk8O0JGDzcxyD89PZNvJJM1Xkl/5Z?=
 =?us-ascii?Q?OQ/9uuAwcWOmXRSUT4KbRC4usYe0jYr5V/QAqiuqCikfl37FRjYbE/iSgcXA?=
 =?us-ascii?Q?dB9gfiLQzFdz1s0HzG2geLlhs+f9SuEbUMPCCm7Q4Cs4lY7PaJnuecfi/k40?=
 =?us-ascii?Q?y3gwUxzViv3Sb+aE3KhEwxUyrGV/BtLIuOvWcM5WtiwJ+77z3YrigZwF5F4s?=
 =?us-ascii?Q?ePjykx2QuZkK45cBVCJ5Il+A/Je4BmRzBZe+px8hchMWvQ0zDpbGIz6fEeue?=
 =?us-ascii?Q?/34jK5un0lGCHFf9w+q4pcCA9Ftw7KRlRApnFkPUwXNnKa/H07w0PVueDhbU?=
 =?us-ascii?Q?Pt/JaiHdmqEqSVK16n0GFnOTgjDrGZx35xwH4/aQ5lBEICMD7+QpUsxJr5XT?=
 =?us-ascii?Q?eXpU59Tn8jXfrvPXPB5lClyUKckaZNNzw+Rc5DTK4HHLFtQ9jH4Gjvq1Nnt5?=
 =?us-ascii?Q?/x1UJ6GfRUf8KUT8cVpnD1+xgarsFMz26tQCHloTdbd5e9EUkQNExgI2dGYZ?=
 =?us-ascii?Q?VgFYdRpPwt4u0bfVFszWm1ZiE2jD3LiknXf6lZFgdBR0gI26mfFH5ZLVkluP?=
 =?us-ascii?Q?GR4lzpTKTchtKYmTmkQCtGBeUmm2nue5OJ/KOf6x9K/aV/RLTjb+1meQwI9F?=
 =?us-ascii?Q?qFF+An3BkQYxnteZP7fJuxx1yk8YiIXkjahEghdZm53qJw3yco/Sq4b02S9N?=
 =?us-ascii?Q?hzpXK5VQaA+WnnKGtq07HG4hykhs/K58CcSm5MLMmFIptJBl7/G44HduPRf7?=
 =?us-ascii?Q?7Dq5PF7bTt0tE63O/QSgoFgtXEHDOG2EX3rr1wrbT8Z9jkWAXXBdOqfolRAp?=
 =?us-ascii?Q?yVpBHCwVH8hIBoiKz3lX3CDR5b6K8GaALIgBChLCKoBMWZau1vxf52Cp2VdC?=
 =?us-ascii?Q?s0G7CQp06to0pgD6N1wstEvpg5bgjDj+EQPQ9sydJGTos1fM8icqGDJT/FGL?=
 =?us-ascii?Q?CdRch/SW2U2zZY73bQm0nNuIhUvv+3lx009P3vl3BExRQESGV+veS8T0djLg?=
 =?us-ascii?Q?GyFbqOeF/BXr6kaTJPQQOvjX0mD80FSseV/KNr5zAun0xeo8fT2ywcw0rBKa?=
 =?us-ascii?Q?PfWi1r4iQ7qCzOaKnUdZK4yFKrRf/hXvT6bFyYTU1mf/CLAUjsZjen5bNCt+?=
 =?us-ascii?Q?nIXiZCJtVA=3D=3D?=
X-Exchange-RoutingPolicyChecked: 0E24TykMzvV7a7WtRx+195+fIIEaKTPk7KQ0SfWALR+avXSTcM6Z/9OR0IETRSFXwxvEd9+BHfl27hxTIqAPzpnTsaJ2H4Ogp+3z8MimOQrj71em+dd8OY9jS33TWqUtOZzIiLbGlcVOwUBbUi17v4sLoNOnHUuMWceBAD7bJTAprdzGbPjVOC+K0BhIZK2kaXeAeNzeZR394hJ0zKOk6DawwfgaMYY9FbCh2mOgq9jYE6VstZffeFOojMkJZlXoRDGqV3QUvjFSs12j5iOQQtV7O5JH88oTqnRkf/H/RomgxWm6pdZ09hjN0Aplb6ITxuUgzGl+VMNdnNZ/aGpNkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: daaf1b14-a6fb-4661-758e-08df010bc26f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 11:43:33.0285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2r8ebK1K95qdyh0L8IJmu+p1kvDFpVcuBAJwuFxcbopmTywlD1BauBLPz2M97JOsfm6a8Ock5IWXqUM4Dr5JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6786
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/agd5f/linux.git ualink
head:   67bd1d6d1b25ea1f893a76fffd13dd6335d297d0
commit: 6a0b2491c4a894d2dd8d4fa86b1c50008841c017 [121/183] drm/amdgpu: Add UALink GART helpers for NPA address access
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260823/202608231737.Sp2rttqA-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608231737.Sp2rttqA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608231737.Sp2rttqA-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c: In function 'amdgpu_ualink_gart_map':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2051:26: error: assignment to 'dma_addr_t *' {aka 'unsigned int *'} from incompatible pointer type 'u64 *' {aka 'long long unsigned int *'} [-Wincompatible-pointer-types]
    2051 |                 dma_addr = &npa;
         |                          ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c: At top level:
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2077:13: warning: 'amdgpu_ualink_gart_unmap' defined but not used [-Wunused-function]
    2077 | static void amdgpu_ualink_gart_unmap(struct amdgpu_device *adev, u64 npages,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2030:12: warning: 'amdgpu_ualink_gart_map' defined but not used [-Wunused-function]
    2030 | static int amdgpu_ualink_gart_map(struct amdgpu_device *adev, u64 npages,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2007:13: warning: 'amdgpu_ualink_sdma_entities_fini' defined but not used [-Wunused-function]
    2007 | static void amdgpu_ualink_sdma_entities_fini(struct amdgpu_device *adev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1974:12: warning: 'amdgpu_ualink_sdma_entities_init' defined but not used [-Wunused-function]
    1974 | static int amdgpu_ualink_sdma_entities_init(struct amdgpu_device *adev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1818:12: warning: 'amdgpu_ualink_metadata_npa_mapping' defined but not used [-Wunused-function]
    1818 | static int amdgpu_ualink_metadata_npa_mapping(struct amdgpu_device *adev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1696:13: warning: 'amdgpu_ualink_metadata_npa_unmapping' defined but not used [-Wunused-function]
    1696 | static void amdgpu_ualink_metadata_npa_unmapping(struct amdgpu_device *adev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1609:12: warning: 'amdgpu_ualink_gart_npa_addr' defined but not used [-Wunused-function]
    1609 | static u64 amdgpu_ualink_gart_npa_addr(struct amdgpu_device *adev, u32 type,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2051 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c

  2017	
  2018	/**
  2019	 * amdgpu_ualink_gart_map - Allocate GART entry and map NPA address
  2020	 * @adev: amdgpu device pointer
  2021	 * @npages: Number of pages to map
  2022	 * @npa: NPA address to map
  2023	 * @mm_node: DRM memory manager node for GART allocation
  2024	 * @pte_flags: the GART mapping flags
  2025	 *
  2026	 * Allocates GART entries and sets up NPA address mapping without TTM BO.
  2027	 *
  2028	 * Return: 0 on success, negative error code on failure
  2029	 */
  2030	static int amdgpu_ualink_gart_map(struct amdgpu_device *adev, u64 npages,
  2031					   u64 npa, struct drm_mm_node *mm_node,
  2032					   u64 pte_flags)
  2033	{
  2034		struct ttm_resource_manager *man =
  2035					ttm_manager_type(&adev->mman.bdev, TTM_PL_TT);
  2036		struct amdgpu_gtt_mgr *mgr =
  2037					container_of(man, struct amdgpu_gtt_mgr, manager);
  2038		dma_addr_t *dma_addr;
  2039		int i, r;
  2040	
  2041		dev_dbg(adev->dev, "npa 0x%llx npages 0x%llx\n", npa, npages);
  2042	
  2043		if (npages > 1) {
  2044			dma_addr = kmalloc_array(npages, sizeof(*dma_addr), GFP_KERNEL);
  2045			if (!dma_addr)
  2046				return -ENOMEM;
  2047	
  2048			for (i = 0; i < npages; i++)
  2049				dma_addr[i] = npa + i * AMDGPU_GPU_PAGE_SIZE;
  2050		} else {
> 2051			dma_addr = &npa;
  2052		}
  2053	
  2054		r = amdgpu_gtt_mgr_alloc_entries(mgr, mm_node, npages, DRM_MM_INSERT_BEST);
  2055		if (r)
  2056			goto out;
  2057		amdgpu_gart_bind(adev, mm_node->start << AMDGPU_GPU_PAGE_SHIFT, npages, dma_addr,
  2058				 pte_flags);
  2059	
  2060	out:
  2061		dev_dbg(adev->dev, "npa 0x%llx mapped to 0x%llx npages 0x%llx r=%d\n",
  2062			npa, mm_node->start << AMDGPU_GPU_PAGE_SHIFT, npages, r);
  2063	
  2064		if (npages > 1)
  2065			kfree(dma_addr);
  2066		return r;
  2067	}
  2068	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
