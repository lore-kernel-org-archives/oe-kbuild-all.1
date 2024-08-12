Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F28417E455
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Aug 2024 14:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723472415; cv=fail; b=eJa6PzEzcrqgxm5QjcVcVfsB6FucTfZiBXNNABawW2zwxzUuZb6IHSXecmZYWEA8z2wbWh6cJ947XoCBOTtJKETx704nEZXmlsruIdOwrXDpYfcUs7BpDZheMPzntaa4dquNWaXKwrQb9pnUDcjoT09dXP3/TBPq6czdIH5+n8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723472415; c=relaxed/simple;
	bh=8Egm1u+sZGLAj3ZME1QSVpqSOYAr2ZqcQPobUFmFc+8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=rQEOk7yGfDRqLLh6/89efXJF5F5jZm/j1PbVxDoMa7Q3Xjdvn29Cvr8CtRplCnb1LjSr6XYbpkWXosK3dTELBchTj/4QveQy2mtTkwyRgw8bzVarmeOJyGik2N4M6rxiMTnOUexoMU/gGltw9N1W88c0rnMom7ez+TttR5R7GFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvjB1256; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvjB1256"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723472413; x=1755008413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Egm1u+sZGLAj3ZME1QSVpqSOYAr2ZqcQPobUFmFc+8=;
  b=hvjB1256DL4QlOn4Cadn7v6lHTglt5J2UHKvH5uq96OJGQlTRHWeSJA9
   Iq82SbGDvfca//jGNuI4e7s9EK4wfIM3NPCwrPZjIrh5xOtH2IdrgDb+F
   nOJTzmYX5RRJn/UOd9FmtA5WbsmPZhBfUIyPBMmOH1/CimbvVGkKZl0L+
   17EA4Exv4jiXGaCPJRuWEOIJ7WdCRhTDU1kamkHWEZVE5woZejXk2lnwo
   /s/596T0IHV6UFHGIOQf43ZMDNo7AFMIf3EijzVg/Prc5Z++w8y4LwPER
   HFahWR14Qie0qwmkvY2wdxoK5ZbqXqWblJ7VL9soiPzea4vdodPRWvmsv
   w==;
X-CSE-ConnectionGUID: dneKU2CKRlumA6pUQIAxyQ==
X-CSE-MsgGUID: ojoyg5ciTaq6U2+xAlCdAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21239191"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="21239191"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 07:20:13 -0700
X-CSE-ConnectionGUID: AjwwQeBeTO+d8/nzbwTvRA==
X-CSE-MsgGUID: x5uWyBrESfysMmSbku+oRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="58229161"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Aug 2024 07:20:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 07:20:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 07:20:11 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 07:20:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9ivXfdJ93xonfAftAG76X9GMG+U5it+1yPUKI66DqiKjp5IZwDuRh8TNKVnoPI5hdYZDq0f+x+u0gUB/ybl2Ontw+sZ5tkPkLuVLgMmGR6f2DvSqYRf3qLQXNbWPVdV005akWKNJaM0VF/WaT1bG482BAm/EXIY2aZK1cgsnES+U+T2qf48SDwpVUW+YGhe4Lw0be1HrxFARNr+XyPsTI48iJyYpmDXobOiv+CudLcMUjN3rm3uD5tBlEyenWGkjdgThhWFc7Eg9O90VkZGyKK4Ni3exQIeUXmfmLcUAiabhqYpF3/5qJK29ITD0SrP6JI2NkrT3QEeNjk3iZ5SmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJhjwKGFNcb7FJr7gbmtTNQ34aNzQ8jJOyR/ZARmWtk=;
 b=qx1ykEHheMEV+l/DI2xEHrxjrrtBZGwuF5t5thkZCUhhSagxedIT/Y4WbuzqXUZ9ueOFOA8rse30SJ6bjiFNgXyfOU73177SWeoiMVuaefSLjJi0MYLwbt2pAgj9FIv6PTizajXX6VgouBameXkQkjJAbd0AjGf6ygez+UYfTdrs9Yx/wdjgC5791ODVJC/UNmFDUzkd01D7Oj1DPZiZ291VaEsf4LgC7Og4F7E9Vyn3H5uj4mHVoKxjr/BGtnONDZ3/+ROi3shBGHd2dHep9scIdJnkyiaHEPQLveUxUtkn0J5S123USMv4cpDBpHHZwZkkq6D5XOUIvNXvWs+R7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH8PR11MB7022.namprd11.prod.outlook.com (2603:10b6:510:222::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Mon, 12 Aug
 2024 14:20:08 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 14:20:06 +0000
Date: Mon, 12 Aug 2024 22:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.6.y 32/78]
 arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: ethernet@ff3f0000:
 amlogic,tx-delay-ns: [2] is not of type 'integer'
Message-ID: <ZroZ/uRyp9wex6LU@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH8PR11MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: de8ee979-1c1f-4744-b909-08dcbad9dcee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ckfyl9hsY8DescNt6lMLrVyFXNejNWcfQOg40y5MQMZmi/DIkNooYDYgamyr?=
 =?us-ascii?Q?lyMmmyRAI4PYklqwqOkkPKMEx2dUFgfe1AnbzeZgn2TBnpQ+vPjuY5cWI3ro?=
 =?us-ascii?Q?Xn4/LlH9M8VlqAS99ruByKijpuWEzDMSvtdhSfzm2JKjZQASJU8+1I/4ke4R?=
 =?us-ascii?Q?/T6cwLS0U4VUc3fT2KTzDq4CNbCVyLg36xTEee3sph9uluCi/JBWgK3mcS3N?=
 =?us-ascii?Q?yB7FuJqcPFsQNN2/pUDpSmda7ePtsCdPgDOqY8NxuUZrGuNRvnXFChefeoW+?=
 =?us-ascii?Q?oYHQpyPlfE6N8zIKX6m/lYnyjxekQiU6RH0FhF0vkJKVnfgE+1L4J9j60sO/?=
 =?us-ascii?Q?drLUksJ5gw1poCNdPq1dXTB1kFyxbC6vJHHI630BcnALZDcrhSFaBTHFnSyZ?=
 =?us-ascii?Q?VAX9/jh338m24VN6JFV7L5QoET8i6/HmNL0YKgeWUpa5TuBYwQg2u36h73/T?=
 =?us-ascii?Q?/TnYJHZDfDA6qLf8Zlxl7/e0FbQ3aP1NQosDq7EXX0xFjWEUB4D/5gVvDfjk?=
 =?us-ascii?Q?wwgh1RKEno3YjJRbcjxQt9Or7PehNLkN+OMno2k+IBrLUwoB9msJGkq7gd29?=
 =?us-ascii?Q?jJchRh+iyCxR3O0SiIFWn/ZgfBZgLjp4+leqksDBqaHLN1U1cukpSf5rXQxV?=
 =?us-ascii?Q?dpKlmlF+dpdtysq3kFZP6Yq3Le09UVhs8FcWF4GgQSRsh0BBV2FJDJ+ONNN9?=
 =?us-ascii?Q?qOARkSKczLq9GLOhsE8EQRU8nvs+ooDsLaJ19maVJZD+qOGE5CiVx0EveGNk?=
 =?us-ascii?Q?n/8gV23Z7A3GmIGMlI/tVQ9WpdGb/W4lbkOcYiFSLEAgzQefGGL8AJmMua9C?=
 =?us-ascii?Q?iIRAtMSLaKZ7o2/5biNDNoBOKHVqir3r+YQFyo2IPd95OXmjeR+aikjYIVqW?=
 =?us-ascii?Q?nJ2IEKsfXJ9tdwf2Ow0l4GiEBXRhapl90eSbYLur+YX5LVtJ/Ju6Jfk9x3mU?=
 =?us-ascii?Q?1gq1kNOAoJFlHV6LcTXq4yB6BQFr369rCFZL4eS8sWaSqNyLCHJhTN0ttePu?=
 =?us-ascii?Q?U3fLl2mWDeGq3yUZYttw5pnXK/ndwaWd80k/Tep0x4J5hTvcb9ko5DwvocHG?=
 =?us-ascii?Q?7tPpLXIEns8XZTdtCA/RLsoBP57etFkxWUc/WK87YSxYFxY6DeIahCu/fVUU?=
 =?us-ascii?Q?E7WqNfUf0MEb7jDV73TpL/zGJf8aXYB50yHRQigguOMgTIBsusSGhaDxAsRc?=
 =?us-ascii?Q?6z3r6V5ktvjd3ANyGtF7d6UjIi/UNFeSN38yoKR7KCHi7LG86n5W1HSWP+Dw?=
 =?us-ascii?Q?iL1p7fQnypwqf2uGweXwpeTLwq2Q8T8/XJJ+jJkOAyT0KPsvte2VHCEOwrGs?=
 =?us-ascii?Q?7e1R1QK9akxwwSGnZeetN7peOLs2ZXdSBztme4FEBnWALnuPU5ls7nr16q6l?=
 =?us-ascii?Q?ZS95psU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T9P3pvmbLKlktI+KXu0sVWd+PsBBSbH/lIU/HoXGdw3b05tonZqlnpix/c3l?=
 =?us-ascii?Q?pSXptwD8A2rFiSr/MLEaf3AfJ7029Lmq3NSyFH0Sya/jS48DxePFZPWqjRnG?=
 =?us-ascii?Q?bHtexGZ1S2WD2s7ibwMiXDFBjTiHS7x9gXgfUBLL6oFfRH2Cctqn1Q6EZ9Qv?=
 =?us-ascii?Q?cIrroD4WFmZG/OhwpoY+Ofkdpgt71pCxS2vWN/3ks6Rl29uiHpm374FCL3mL?=
 =?us-ascii?Q?LvU7MTpQXc3msPX3PXFUxgzJirRAC/13/x3NtoEArouPkh3ARSUxhHK0zUOs?=
 =?us-ascii?Q?DmTVtqdwnpxGlfYTjX9BQ/anZw6LhcPdp6h7DjSOffDf/0mjVV51Hj+O/wTv?=
 =?us-ascii?Q?aEg63tNpiEfWzaoPXr6yyQzHTDCZFO9h/lqIJzUb8Pk3WD/7Nh0EvUL2Wrhg?=
 =?us-ascii?Q?GYuppr0+n1TYccj868X+skepB6agVSUqUstCTFQPsHSIdqBJUT5V0kW1A1oD?=
 =?us-ascii?Q?bo3Ltxs0RBwitEdEU9hJ4zWplv02NXU6gYQBVeYg4WOCpKzSrpO5FaA21aB+?=
 =?us-ascii?Q?lYMV3lLgUJFP3fw2WVyDhWMrRHDbUhZr1fqYaO0jGTRQ9SacnbVguT50aLAW?=
 =?us-ascii?Q?/y47Fgkz2MmOWwk6V7p6bw3juW9wNU/y1r3/TbqAF8ox4U95gCvbqs6sT4MZ?=
 =?us-ascii?Q?nlxvuVqaJDzR0pP2jlqY/fjaUNORkx9waZYrnsAa2R+PS7H0lOnTSYrD5nZZ?=
 =?us-ascii?Q?fdrh/iQlwbaXiIrFlCwlkG9H1GaocFy4HVF2BjRfgbAUXX4b6FF+MupF9aQy?=
 =?us-ascii?Q?7h+1LUjJRmfgp/+vVeO0xAyXEV2pA8gxvm3GRtl+LkIW/B4ZlM6XfD+a/KvV?=
 =?us-ascii?Q?85ZOjIapz7LF5MqL/Ji0D0DRAo2ST9GPltWxIbGebUDTiq6bQ8Y6W7FHpzoM?=
 =?us-ascii?Q?my+izVqBhMzjWuv8JKUQaygeOY1nYE9E81HoMUoD9kTEarWZvoVi5wV8xJUZ?=
 =?us-ascii?Q?KfGO8S9rYxewTsRr5xgNQA2nkZldbU7t7nXDkjkxTYX9Gvt89KdfL3GAzygj?=
 =?us-ascii?Q?peS+e/dPBYpwl7rqwV1Yo1D8D1jxhOTEMIOQcp6NLhiZcN21WCkfs/DsaAvs?=
 =?us-ascii?Q?/nlO02GIdbjzTkQraYmPc1S71abAZA4oCv846+JDMkw28wo4DDL0FVsz7INa?=
 =?us-ascii?Q?njpPkr9hKmhKHCtF311HGrSdJZtg+0nSgzoS9y/4itosg//he6gCV/Co3sEd?=
 =?us-ascii?Q?Mhf+BcqsUjdF8Kkc5zOqsIH6Gn2IzOfYr8y7QirbFXPZS2I1ECho1GYHtHjc?=
 =?us-ascii?Q?LuuGJM4e2bU22Hc2B5dWYw+eiVl0e+ZJWVPPkn/vtAhImkfk5ZOsEAvZRxi7?=
 =?us-ascii?Q?4zgw+alPUe9+E2H42nkm74T0CdQjgR/1JSN5pURTxyX9r0bvmF0pBtAiGgmH?=
 =?us-ascii?Q?HiLGB56rf2RiYVe+1lV5qin6/iDHDG4Ohd2GZ6HWoIVAlkGss5mOj5CYaL+t?=
 =?us-ascii?Q?JmVlW6gC/KWeILIFH54YF77maHLVDZlXnC2I5AGSIpOFPhiCqVUjrcwN1QNd?=
 =?us-ascii?Q?PrlLjO8MH5hc7a7RMVndIB2ErL3nlkJuDT7LEA0giwEWT2JRW5r+H1U1SUyY?=
 =?us-ascii?Q?YRa9WNdtOPTNbnry/pnGAfqTFLLTHwY/AMgmKcGg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de8ee979-1c1f-4744-b909-08dcbad9dcee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 14:20:06.1951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJpKqMxID/zq+G2PxJVNqqsf38z1DbsovkqdE4HNzXLc+MbzSnZcSVSZAOMP41OCBfYNGQ0ybPZTXaJZZi/AWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7022
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   db2e15a776d1205387db09cc4cd4b3d97c5de1d3
commit: 7ac7a6e2dac16d26212911a91515a49a08a10371 [32/78] ODROID-HC4: arm64/dts: add 'meson64_odroidhc4.dts' for compability
:::::: branch date: 5 days ago
:::::: commit date: 5 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240812/202408122132.5ONgvITU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408122132.5ONgvITU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408122132.5ONgvITU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:266.33-1540.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: ethernet@ff3f0000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: ethernet@ff3f0000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: /soc/bus@ff600000/bus@60000/clock-controller@0: failed to match any schema with compatible: ['amlogic,sm1-audio-clkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@300: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@340: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@380: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller@3c0: compatible: ['amlogic,sm1-tdmin', 'amlogic,axg-tdmin'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-formatters.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: /soc/bus@ff600000/bus@60000/audio-controller@744: failed to match any schema with compatible: ['amlogic,sm1-tohdmitx', 'amlogic,g12a-tohdmitx']
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: sys-ctrl@0: '#address-cells', '#size-cells', 'ranges' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-0: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-0: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-0: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-1: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-2: clock-names:0: 'sclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-2: clock-names:1: 'lrclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: audio-controller-2: clock-names:2: 'mclk' was expected
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-tdm-iface.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: pwm-fan: 'pulses-per-revolutions' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

