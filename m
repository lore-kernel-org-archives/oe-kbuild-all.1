Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE2C384CCE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787487287; cv=fail; b=KOGkhEnpDoP9HVY5GxT9f1jxa2acSEe6PX+z/kc/el78IIWWrOmtMpb/DtQQUF91ULUOCpv2i+9S8AEhcTIP/2Mj+d4Q7zeU0L7Kxl6JTktLvDwdHyklXNmWA5OltkO6hGyx8no09Xa9XJKpplv9tglGeKNQwWdgpeyF9Yz1cUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787487287; c=relaxed/simple;
	bh=2CEwe1HukSUPdwhuavU1FXADkHN1s0Xcsxq7bh3Tm1E=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Z8PC73w2YJZOiJN3axZfxfhmz40Yu61CvpP4ZZRQD+uJDk62pGwagPRXuRPgEwOEf0YeqxUQ9tADkMnLYNqFWbtsR9BAioDFBnQ5a3yxwgRlYuOlFMNs974vkZ5CGvOBeGq9UXjTXs/gZ9Zjfs6GvyKJyTVasCqSpxpB4PsaEKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROzfjZlF; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROzfjZlF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787487286; x=1819023286;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=2CEwe1HukSUPdwhuavU1FXADkHN1s0Xcsxq7bh3Tm1E=;
  b=ROzfjZlFGhIovu7qc/LfdC7dgN85U5aPV02A+FYQ+SrUtKC0rR2Rbm4d
   TQdFGQgp6SM5LYDgdqGuhDGwtK+7hdBid2VfJpz4aTH5a662NPrXJyD8e
   9PXGnqbO6CPPmV8lpDlmWySk39Xrn9lyjOoKIu0BE0Z4ghBHlJwRsHFZz
   1yp9HuO4iebOH1frx86WYw/iVuJFJeOrWkxPkQXThOkLUaqA6zm2LdT5Q
   aLe2cd3m91COOzM/IhLfDB33w4nXycIzvizi9ZFWxxa30k4NwJ0CIW+4c
   M+/wWkl3lUp40pvmPKqC8T4oIZM2djDvuIRMPlEqo/C3VrjhGopizEw4G
   g==;
X-CSE-ConnectionGUID: 2qZVvlQWTGmVvRbKO8d9iQ==
X-CSE-MsgGUID: ybltOO4hRpyRrqI82cJ1Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88088899"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="88088899"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:14:45 -0700
X-CSE-ConnectionGUID: JbuSlsoRSwaoWFefA+tRQQ==
X-CSE-MsgGUID: otijDAloSq2EPMuQAcwRiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="260603133"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:14:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:14:44 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:14:44 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.70) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:14:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fj1fEwxiBUylXcZD/51a9TdcPM71wZelXYkpV+fUa8F/t3wdciveFO8w67gqfLsjEATRl91srpuXMxOQX+mCdxSY3GuuxhPgwnOWiXNKP3gI73vHldJDmMJvPqy37y2IA8nRqsYP1jHoQSR18mZpwXeAODder5df1E6UJCy5T1meSpvPc1eoT1e4erFjWxZCWFknn83nIsN9U4fqcZA8VNx1FJh5jMhlmrFdalbNAEk+RSSyhJ5o3sHB4WVwqcHymud/UXg0YR6J9EMutF+RF+WCDwggRUj5jKiRGiB7UbeK/nS6gB4k7aQtkbr/Cd/K7xecjw1aXqQ28NrG8JCAjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dIjKxvo/Qeqs67akXxWomjgxMGkyeGAGN0WeCKVp7E=;
 b=JK4Z62kYDWXcDEhi8zDQ4kM3jRGh9dy0evJKbnSINJgzYNHqoRTgylcruwtJMcYMMstqpgD7nmj9DFBMUMDFY9936bWs4HgIF1A1I8i3/z78qMqarhm6I26a/7uaWFeXiEC9b6j6Nb4vwk67/Rou3JuFbkBg1y+yK4q2H5TDmrGqk8Bc6r+w7Sm183tQaHFVnMEEOgYTHwUvM/FKthDA6OBF3X+K34u8edQN6CMyKx19qyX/W+8lkojx2zj955dYAIlItxUWslowz5Tmq2RrTFWz2ZB+2WiWVPVRQh6SBaP+eMlK11nIU1x4mMEFIr4QhZ3W49N9c/pZj/GA8m7HFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by PH8PR11MB6998.namprd11.prod.outlook.com (2603:10b6:510:222::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:14:42 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:14:42 +0000
Date: Sun, 23 Aug 2026 20:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [willy-pagecache:headers 17/21]
 drivers/gpu/drm/nouveau/nouveau_dmem.c:163:2: error: call to undeclared
 function 'folio_lock'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202608230822.sTidNfSE-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0035.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::14) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|PH8PR11MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5315d8-188c-4554-690c-08df01101cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: yL7OvP+opolkMs+nmXsm+rbwDabExJ8fVMYMP71gtgpHWz+qZtURUFZronc/n2WXgz9rGPufR8utrU8gECtkFmr4CofEQxTVa+teeYR+cVlAUm1fPMNGJKWQYZvITE8DohHHbq+wCSsmWZ3DYC8vHidNHY+ZivHEvXwsm3Pv9zHeyLm31/1Xu3Lg3SrK9rS0W4hSnrxuUlPgGi75cj1TiqXwr19aFB1D9J8Ig0hJ1FQ2omUOsRTTS6dFrOp0JG6cjwU0HaIS/EDE0//N+x6YgRTHe6cK7ljExYOHL4sY5JsuYi4hgy+uHlByGrKAlM3gdpA4scku+b2C6DTPne6CYqcpdDImbwl7VJxXI/DbScx/Y/V8zOpEga0A7rAs8ZTSlq2APkdAd/0BJ5XxJ8NP4NUcg1l9ggFKgLaNqJlILfiOUEzkmfRxLdmXOiIe4lUel2WlRuAjjCXB2QoiCkDJCJ4IELZnh+advJXoSerIIdkxip5YHPfZwkgs57AF3T/uaBjLQ+ibzyU+JY304keh51GHH2q69ZpU+34F8xZCzQ19LlUf1/aw9T1VzmTMpNoQAcN94N8PC/HV5wtC29UMEPtUjmPwUHLHWD5bNi3OmXTN3T4valWJ73NgxT6h4eIodDLqxj0T1SmUDrVNReIGAD/uFOFHgDvBo5Mj+qaYB8c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HKQ6i8GI8JrQGqIPDsrR7JR+BfhrEqCq1ItKyw+LYw3QaayKc5mlp/gOnS?=
 =?iso-8859-1?Q?2l4LHc2EBz0Pf8oZWw4QD74HtdJegr8ArHFBZel/vaj3Xn4Im3VgnhXvS/?=
 =?iso-8859-1?Q?vbO9CqvXPITjgqZILmkzzji0VnImLtZQZIr0PVlrW4tfggeZJz92uL54hB?=
 =?iso-8859-1?Q?Frep3mL4aciEENbwekjZWboDlSUwrcS7B/hZPlcCq/TcHGEi15khTtYm9L?=
 =?iso-8859-1?Q?1q9X+XqMZbwwLAPwJ+jCaD0OkHRSO4K6aTgeNGuYtXC7oqRaWBfjBqC8Vi?=
 =?iso-8859-1?Q?92EBkvof903we/WPBHALJNqQbjSfsV1a//tTM6ySryNwv4626O0tkc7JvN?=
 =?iso-8859-1?Q?+k8mRA3MPOEvHZgpBf8Gx7G46iEoZ1VTESsyssE+hrWA2CHMWuJEpQUM4z?=
 =?iso-8859-1?Q?OiPfORhYc1/zd/Hk5SfkS3PAub+4jqFKWb2wDtir/G+D/kVRmJGWbq1hxW?=
 =?iso-8859-1?Q?CRQVDBVBarJu1EN1sd1OQFk+izNpAYwsr3JYYGcNoZlAqrvFxBaFrj54fw?=
 =?iso-8859-1?Q?7dyQ57AFxOfXesL91v3F6yif6tbn4IUY9xMbqxWHMHfjz4RGvLRKCI48EJ?=
 =?iso-8859-1?Q?mJ+yc3ggFQBTbaVR39WNwSJhrrZkike5K8kNUPFGPgXC03RnhtejC4H1ry?=
 =?iso-8859-1?Q?2rtIS2mkuHAv0khFEEcRL3jsD5EWZVo/c6Xut6PXWLE7StBoE3NxBTBNJs?=
 =?iso-8859-1?Q?21MiR6lVUvfFPtPdqKLIkwrtqOB8ODZg9fdgwVbwX+4QJMwlOypHULQptk?=
 =?iso-8859-1?Q?7BRxuP995ghIR6tHdN/bKFvYIYQ0cg2DTqQmPut7asfPA/LhWYQQDlop7n?=
 =?iso-8859-1?Q?90v0k/JOaBOaw2npQV5t7slSY8lBL+my2WjXeax07vM8zeB6SZTzRkFepo?=
 =?iso-8859-1?Q?Ep1/WFhfTHqBui6kfB3JP6emfVFDP7SGsMfbmBziklz2BLFPNjaa+oEG6J?=
 =?iso-8859-1?Q?/PryehkimQ22b4tLoX75kZC89ygSxuYUMiSSXtjV4K6SL7DTMtTkI6nS/d?=
 =?iso-8859-1?Q?qAmFq+dNWkbkd/bKlt89NkryEAgopY2r/vIIqyjabI5TJ5/vK7KmW82Lsp?=
 =?iso-8859-1?Q?8DkzsXltZMmxRVRglVFS55WIhyOnzHBKstC0ktiNE1p7xFu+4jI9afaP+Q?=
 =?iso-8859-1?Q?oeXuIUqIKpnT6QOhDWlOkeSeF/Xb5P3lzql/ucI/1j6DUKrU3VIhGg1NXV?=
 =?iso-8859-1?Q?G/+Qwwkmq3m/9gK4lwIUr9T+gR/ZBT9LFpwaGXdDgWbrAIta3VksY69Fq1?=
 =?iso-8859-1?Q?kZgf1I1Igu+1UEGD/MZdBriSBTcrqoa3sFUmQA89p+29UVuzBYaWwzY7Au?=
 =?iso-8859-1?Q?NAPL8jtsLzWe765R3lx+ivdboxvc2WRvDK2OUc3REuOhFA4lNhZ8yEtI7t?=
 =?iso-8859-1?Q?gV4nS4/ebf9VKqiVySHrhRH7Y9hIOzqDBgnp/Gm9+hx1sD7W+UracLniYg?=
 =?iso-8859-1?Q?54LSeQh7Nwo7M0HRM6ArZBYPSJzWQfpQxs0fqugQDav0B6HgBk6yNK45Gy?=
 =?iso-8859-1?Q?flB5KIpReZdd2ojOlfizKx/87Ai3RLsoat9R90LqBhfq49o82/biTEGpBh?=
 =?iso-8859-1?Q?iK5h6dci6GHhxY2NiMRozIzfnAV/GPsF/GB3JJEaI/GY1Y1ln7+FNLV3CZ?=
 =?iso-8859-1?Q?3+3HZujgQ/6rxCZgzY0Ac5HrLsvxOcmzCtqal4RBJUx2cE4e++z+nR6QvC?=
 =?iso-8859-1?Q?CDcpuEuu2kKegsADuATiHqpezQZyXYVph7lc8DTCsQKWaUQtguLy9C8jkO?=
 =?iso-8859-1?Q?BeZbfaI9R/cpMiKvGIGtECYbWK42RsIqSQFSsGH/y5ppgrdOCa/STa/OX4?=
 =?iso-8859-1?Q?7T8i1wxawQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: x6b9fIFRq9OZKbOetsI7S1WJUu2FQmLB7ReEeK0XRPnjqHqltLkubfJTQxQOoVSQIjEh2eE1w9248dCi/ZMMjoKj6AxZy1Qvfy2n3MzONmyCz3nF7UyZDo71Q18lM1tyJv2k7Fb9zTyRI03oNqG0Yv7yNh1b6UQOaJ4BADMIVV8z6XbxLkk0pK7y3KDgEgvhWpZGg9zN+z/X3xAAKjYMt5LgbC43MpkE/9P8hv/gKs030MPCSV6InfJbkCTQw8H/iVHuKQvG9HPSggL2t0yEBwedL4iJ8dwiWLQHZFXoL6VxsdvXsQ8pzOtoNzYkGUXejfPoT0W9p/Vn6R8FRxB7oQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5315d8-188c-4554-690c-08df01101cbf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:14:42.5549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8udLPzXcA52LI4DlhuCxj/a0+ciTeAv9AbSh1sao6g98FLg6JLCrb5wZbwFtm9odrbTsF9zZ1blXEDaBT3JzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
X-OriginatorOrg: intel.com

tree:   git://git.infradead.org/users/willy/pagecache headers
head:   14ed95ee1eed0c72d54c159582017588ad1b2d68
commit: 1ca7605be521e2f15fe5667bbc65b7854f5d7737 [17/21] headers: Remove pagemap.h from swap.h
config: x86_64-randconfig-011-20260823 (https://download.01.org/0day-ci/archive/20260823/202608230822.sTidNfSE-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230822.sTidNfSE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608230822.sTidNfSE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/nouveau_dmem.c:163:2: error: call to undeclared function 'folio_lock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     163 |         folio_lock(dfolio);
         |         ^
>> drivers/gpu/drm/nouveau/nouveau_dmem.c:435:2: error: call to undeclared function 'unlock_page'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     435 |         unlock_page(page);
         |         ^
   2 errors generated.


vim +/folio_lock +163 drivers/gpu/drm/nouveau/nouveau_dmem.c

2ab2bda53c986a Christoph Hellwig 2019-08-14  154  
c3228747107705 Balbir Singh      2025-10-01  155  static int nouveau_dmem_copy_folio(struct nouveau_drm *drm,
c3228747107705 Balbir Singh      2025-10-01  156  				   struct folio *sfolio, struct folio *dfolio,
c3228747107705 Balbir Singh      2025-10-01  157  				   struct nouveau_dmem_dma_info *dma_info)
5be73b690875f7 Jérôme Glisse     2018-07-26  158  {
a788ade4f6e030 Ben Skeggs        2019-02-15  159  	struct device *dev = drm->dev->dev;
c3228747107705 Balbir Singh      2025-10-01  160  	struct page *dpage = folio_page(dfolio, 0);
c3228747107705 Balbir Singh      2025-10-01  161  	struct page *spage = folio_page(sfolio, 0);
5be73b690875f7 Jérôme Glisse     2018-07-26  162  
c3228747107705 Balbir Singh      2025-10-01 @163  	folio_lock(dfolio);
5be73b690875f7 Jérôme Glisse     2018-07-26  164  
c3228747107705 Balbir Singh      2025-10-01  165  	dma_info->dma_addr = dma_map_page(dev, dpage, 0, page_size(dpage),
c3228747107705 Balbir Singh      2025-10-01  166  					DMA_BIDIRECTIONAL);
c3228747107705 Balbir Singh      2025-10-01  167  	dma_info->size = page_size(dpage);
c3228747107705 Balbir Singh      2025-10-01  168  	if (dma_mapping_error(dev, dma_info->dma_addr))
d9b719394a1147 Alistair Popple   2022-09-28  169  		return -EIO;
5be73b690875f7 Jérôme Glisse     2018-07-26  170  
c3228747107705 Balbir Singh      2025-10-01  171  	if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(sfolio),
c3228747107705 Balbir Singh      2025-10-01  172  					 NOUVEAU_APER_HOST, dma_info->dma_addr,
c3228747107705 Balbir Singh      2025-10-01  173  					 NOUVEAU_APER_VRAM,
c3228747107705 Balbir Singh      2025-10-01  174  					 nouveau_dmem_page_addr(spage))) {
c3228747107705 Balbir Singh      2025-10-01  175  		dma_unmap_page(dev, dma_info->dma_addr, page_size(dpage),
c3228747107705 Balbir Singh      2025-10-01  176  					DMA_BIDIRECTIONAL);
d9b719394a1147 Alistair Popple   2022-09-28  177  		return -EIO;
d9b719394a1147 Alistair Popple   2022-09-28  178  	}
5be73b690875f7 Jérôme Glisse     2018-07-26  179  
bfe69ef94aeeae Christoph Hellwig 2019-08-14  180  	return 0;
5be73b690875f7 Jérôme Glisse     2018-07-26  181  }
5be73b690875f7 Jérôme Glisse     2018-07-26  182  

:::::: The code at line 163 was first introduced by commit
:::::: c3228747107705d47c7e9a03598a434a0380cb73 gpu/drm/nouveau: enable THP support for GPU memory migration

:::::: TO: Balbir Singh <balbirs@nvidia.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
