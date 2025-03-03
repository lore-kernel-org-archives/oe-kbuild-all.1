Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B974235948
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 01:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740965820; cv=fail; b=AglpNFyb7iapsNicwG6vhQA4AmtyzPiPCmXe5gqGjBeYGP2vIbxiU3UrJJFTkYeOSUWX1uZixFx4m2vzxKqcONlSEQL/cl8wQtOQiv51oRO7emyHmldJ/GoQ8ZIJ03IV7OQs+4HHyUlq1MqO8M+RXaUAB3QrnMzs49l+J4jid4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740965820; c=relaxed/simple;
	bh=2B1wNkou2DRqkvzm/Z7m2HiwmpFdnv+X8ucsW3L/QR8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=buyAZqZ9V5vSIofoE2Ef5KOQJLm6w7H+6dUnZhIoF3nZqD4SOvdKNITOow3SB3Hf6HUd81AxX71yM3hg5/WueZTZm3VDnrElApWLOoPt6bl0UuqJKVGiWg0/n90jScytXm9hk6rFg+6+9641q1YUtWnJ4rDqoF/NzsTE1GlGgjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=akoj2ARq; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="akoj2ARq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740965819; x=1772501819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2B1wNkou2DRqkvzm/Z7m2HiwmpFdnv+X8ucsW3L/QR8=;
  b=akoj2ARqcnb367xGgxvvuQA6oszS/CQmrgqG3CBUng1MIAdPwbJfjW63
   zOSQLbyHh8UVSJobHp6JVzlRdgob5l8/hBKhD/fhpzW/reqKW0DLlCYc4
   00d6nlc9CQxg2R3G39CGtMtz8aYB9zDI/RL40ntIQMeEZBosfgQcl/zX3
   n0be92jyAxu9Rd+j9AgoW6vvQxIZ11xY1yZG/lOTO7cHs6yP+w3QGw1uJ
   i80c7YsEZeXHMdmSCpX3CAN6IstjzXfGLJtTcAk5V7IZRApcGHSspq/sK
   TS5g3CFOYFEdGIySbhNBiy0mTAi2tEVI8spI/pNeSANhJPxCLNtbj5s0j
   Q==;
X-CSE-ConnectionGUID: Zk66CkuwSqGuD7Vn0bGP0A==
X-CSE-MsgGUID: 8gQMPTH6QGmiCBjPu/pk7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="53217645"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="53217645"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 17:36:58 -0800
X-CSE-ConnectionGUID: 1IaMqV8LRxe1p1+LvZKqlQ==
X-CSE-MsgGUID: V46MMhVuSmGrvG5H6b5ZEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118400611"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Mar 2025 17:36:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 2 Mar 2025 17:36:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 2 Mar 2025 17:36:57 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Mar 2025 17:36:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5kvL7qRgrXyIOdsd5ZBsNc1Avr6YEOr6/I7ZRCEwzUSNGbXNcsAb3bfu4ZMYq/eJm3cnbLfjvWRguNqcYRKpHrSOv3J4CkO+dtnluPQcAq2oigTQ/1VUixstgNjsLmFDKUXCKIqUNLdYPcGmzxj3yUmTR3Fsj51CsefmqaFDB/B96Tj0NHenmhJFY+2fctJn163SFbv9kvLRYwCuX0q/GUq4VfQhyahqdKCMI4/1aJdFeRbarEdKTuoZnmk3iIjDmHl77xpmDxIMiBSv/bVdj8lGURvQ2y/DEtmfhXrKumxnNJmD877xXOXbcfllc1n8UcDwy0EUFDrvqCN9d5E+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNqm/fGRq2Wy8UmLx4h+75klp2AB4O6nkkZ5uFEP1+U=;
 b=wh/gPtP42bQ07VlWQqXGDzo2GWUFT4+ACP3ckqG9fNNLQ/keuXMdORdDnte8GQBh2shlnZl8dSa20be8dJyLcLZdXbcgApsUXzV69zE61mJNcyD6Mc3lMkxeoZfO+T9B/4qCI6KzuyEVFj0D513cLh3fnrKhc5kKxsNrP4qG1Eptq7N/6GaaBdWds8GLri++sOZf1ivIYzHR0MUTWUFmat8cPakZwBSP/JD7YN+61l1LSzcfDemzzBGWbY/FRVF+Dkbe7dJ3K35YUGbolbX34fQihw7zE0gFtUbCAgO3i4+9SkwN6848LIEubZPvmwRsLkhnjo6ww1TiuW/3FXOAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 01:36:13 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 01:36:13 +0000
Date: Mon, 3 Mar 2025 09:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android16-6.12 3/3]
 Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml: fsl,liodn:
 multiple incompatible types: uint32-array
Message-ID: <Z8UHhrzMODJM5k/M@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW3PR11MB4748:EE_
X-MS-Office365-Filtering-Correlation-Id: 45db8209-81ab-4f04-ed6f-08dd59f3c841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?amQ6Gc6dnto2yj7njEcNvDUngkQAKidW3GYhxUyY6aQZn3CzmS7UHaEWtrv6?=
 =?us-ascii?Q?wxd15+MbApTzWvXJEqPvO+ZyuBlbfVB9FdzDKOpETrKhhoUpeZPGTPIbIs/s?=
 =?us-ascii?Q?/HYRaZZqD+FiPwnFkJBjN0DciiJ39uPU+YYC1uYv29OlyL7Yplnj/el6qvdh?=
 =?us-ascii?Q?RQCWC881yxcQSxdojs+pK/VFjojt0JXotfW+5eY/ZVrJffw11QGRqWlMJ6MZ?=
 =?us-ascii?Q?ADPITwAUBebWsmu2Ufu+U/ok1zvNDzQ0s9e6IqvNV6odu6+AYytVeGGL+jYA?=
 =?us-ascii?Q?2RCxOgCdDHnsNhSq424uhfEzsssWf4LId7MK6pgMHQCnwvA+TonkFqjkoX+W?=
 =?us-ascii?Q?Du5yMGUEa7OyLupFJx+gD88deVQugzVkpdMOWAB4CLnj2JmFG02bF/EeTpXT?=
 =?us-ascii?Q?CFacyYAqsrBn9LdMy6SU31qFqn+W+BuTm4R/O4gLZn4hAhkHVYc+YclliMzn?=
 =?us-ascii?Q?qYzomoQ+jdTNUftXyQHsJT6diqmBtfj2cVD6lYRTLlkKjKKvQ11n8Blci0J2?=
 =?us-ascii?Q?aeFa+Z8sDNBCwOEtKjQVKRHx4Z5/wgI07uhh4ChIdTzRDVcFCY7Y70ZZrj/9?=
 =?us-ascii?Q?w7rmZ29zlm2peTbohVn3k/WV/GCIDBGrZYeo6tYoOimio3wmUWhe7ipzyqo6?=
 =?us-ascii?Q?HN0RtjzRAvIPJFqIHhnXeiU6IExrSJufKbpxrOHRF7KICm9PZ9LHEw09Mwwv?=
 =?us-ascii?Q?G5Xn413O67NamOFoNl9fe6EReZsQmEQV+rSyk3vQmBJ81dmKe9zAL5MyHVee?=
 =?us-ascii?Q?JC/nvZGJNRACrEanJBjfSYwcivMlMYC2vsdyxFrpTevNvKGLJ50QLw8pkn7A?=
 =?us-ascii?Q?bZHMswdk3XYFS0IWd+Zaf5uXmZOShvKB31A2v8rXYzQwK6rYtwy/FIYyhKIP?=
 =?us-ascii?Q?ovQG3EmVQZwVSX3/maou7+2pxDgz2IpV3O0Yjs6zXBRlb83myEIrtUhMEpZ4?=
 =?us-ascii?Q?RsidtlMabAtzjwNt7kSopMu1KvH2Ph1T1j7q1ldmbANM7ZqddKrBYY6yQH9f?=
 =?us-ascii?Q?ikqqKiHT5jIvubamvOg0KY3KZR0xJgbz/VzbY0z1ggoaQwLK+u0eQWDpku8p?=
 =?us-ascii?Q?Pq32uA0H9/xz28KGF322cA1pHym2ilsPO9ADRf1ZvVRtsCPThZ4jo1mwufwJ?=
 =?us-ascii?Q?0/vx5t4UyfM0deKvdiR75ONjKqxxV8soBbRiyvJyFBaL/fxkQu9ZS/qY8ANj?=
 =?us-ascii?Q?628/YN+tmFCchxCQJAXhTLDhsDcOgqr0ThZaXLRVc9l7CKA9aqHZZ1ADNsbX?=
 =?us-ascii?Q?K2p8a2d9va57r7ASGAvOVsPtwG1zOBHZDp6At2h7kl4wHKQtrInZmiLnHroW?=
 =?us-ascii?Q?ctnvENkNctne9Wj8ChgEWma3I/LYWZqDN3SpTAD6vaM+bg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pVqy59lmbW+ErWYPme1Gh4Nqje/q73Nlxt9QS5WvBVBC76/cYE7RwVBZBuVX?=
 =?us-ascii?Q?XAg+DyTZ/ni8fu5H4nfe7lcbo2pe9OgA8HULU8dauh/1w8QQ46tBruSAKO3k?=
 =?us-ascii?Q?hSCuhD36HoscZYwSMcMVu2imqTiwiKCD/f8w9KCCSZK4dmNnskA2wO8facRJ?=
 =?us-ascii?Q?MrSqwhQrCweACZWbs4MsTeQ82Rdx5I2VQUbdcH6OZ3vbn3/FIi82tltHWTP1?=
 =?us-ascii?Q?KifgBQjVqqXd+YYAD/E4qs77bdG9/tJk7kGIFZF6wm4uB/HI8u63fqoXzOUc?=
 =?us-ascii?Q?Cs1qbdW9Wjxljl2BSH6feC7hjxowCH5wZVWU42YtvQc2Y9pcAKVw1AyuJmAo?=
 =?us-ascii?Q?v1/BIUmrLgH6YtvmR3hsSa7YaOB33/gUd32ejonZhHUn1NCEoLDvt7gKWFn8?=
 =?us-ascii?Q?SjQcmnRjS0x7ohA8YgSiLtmCXliyulrm1TOq8/J6eRB7BR56G14spcB+kmLP?=
 =?us-ascii?Q?rkb2Jxsdp7HCvkftzpkvpxA25245U3jie9cniLpg5QV2Z+lLF8MQj6DHNW7Z?=
 =?us-ascii?Q?UdzQiSsm8opgVMSW0Syw4EeVG5OjyL2PIRgMDUxopoJFtfI1s/pIDmDMqXwv?=
 =?us-ascii?Q?GN7xRbNWlGtSmJhkol86eOLCA91MucH5q5TShBdvMXT+FF4AMCHctp3EAQ1J?=
 =?us-ascii?Q?GHuy7hRvNfnocF6n0M8hUGgI3juEgs3W+VhjxMvsQQzQ0r9pVscir+4HvQBS?=
 =?us-ascii?Q?djTfVssfvV9kZIdcagDSp02cU/Cyv//DvWU4U4lCihrPATQRJ0aj5t3CtbQa?=
 =?us-ascii?Q?JnV6a321nNeq5YsPvZUIZqT56UBugHlbJmAJZXZIYnLhnjYElVxOaiCgIprc?=
 =?us-ascii?Q?Eve9x68daPaFKfu/5YIv7Kja/PT5AVu9dNeAPTh3XETynMoZUAvWLXBKFg9O?=
 =?us-ascii?Q?JnH4L+ASLokWVEDgxCzdawmi44sbvUQ+uvn/vFML0TZg8eWgIqHv4IfT79je?=
 =?us-ascii?Q?iyymGtX74V0qnEmVe1nrtG34S8zAhXRioFcN02xlEnoBv57XeDUjb+FWIpPh?=
 =?us-ascii?Q?uZ8JI9oO/jCTxH7H+cAbpj2NrE4tKs6nrxMBF3U4LG+a6qcAuY4pXdqAA/hF?=
 =?us-ascii?Q?v456W1fxiz56hz9ra0xzjdMm64vAhZyiWzgN8Idxv4RBZrL2RAQI+AuWRZnK?=
 =?us-ascii?Q?aoBoQWglBxpv/8dgOH2sAYm8x1NS559F3+mtcEPA6719b4yj7V/8EDg4H87I?=
 =?us-ascii?Q?qfHjYMv8DMjuQ9h+EcoAKgFhRDjBE9FLhGHa8lB3zsdrNv+Fzu4CVbHsYwZQ?=
 =?us-ascii?Q?mnUYJEo/i8yu9mJqHuT30pfWdx3EqaiHsSu4yOrKmIAtXWq67MKourbRWqsl?=
 =?us-ascii?Q?Ai/jLmkVS0MDiV3vcpoxI6FAMoKQ6LEtAy/LrU4OgMOqKMYEUOcBXAe/lZ2q?=
 =?us-ascii?Q?2lf9bw4MlE2IzTOP3b+ZLYiiJMANUHIBzSrvbLKd2Eo3ww87mXizWGAyRgAA?=
 =?us-ascii?Q?uqVZ3f1LPkv8RsLQJ3/nGp7jq+H1lp+1dNvfgkEPYir8zNjScQdcNIQHbTaT?=
 =?us-ascii?Q?jsPIAPdCTQT2R556wXo4Ri6MooqeklbBRxhmWJ0wfkAxEK7zVPmrSmdENomc?=
 =?us-ascii?Q?SSotQ6P7V77RBxCgqph66STYuH0uWoBQMSLbt3Rr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45db8209-81ab-4f04-ed6f-08dd59f3c841
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 01:36:13.1033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkksnSd0ZzdgPiXJ+IrJPlotrHyL5A+bUJRooTYwSDOX/ru5fN78l/n0F73yKZorAIPProHP5iMSlSy6dRosNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4748
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   578bcc20c07e88c093e63192c838b7245b3bfc01
commit: 304a90c4f75dadd0f80d0b27e61e8ed04b36ad95 [3/3] dt-bindings: soc: fsl: Convert q(b)man-* to yaml format
:::::: branch date: 3 days ago
:::::: commit date: 8 months ago
config: arm-randconfig-052-20250221 (https://download.01.org/0day-ci/archive/20250224/202502242202.5B4OKs2C-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502242202.5B4OKs2C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502242202.5B4OKs2C-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml: ti,x-plate-ohms: missing type definition
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
   Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml: voltage-ranges: multiple incompatible types: uint32-matrix
   Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml: voltage-ranges: multiple incompatible types: uint32-array
>> Documentation/devicetree/bindings/crypto/fsl,sec-v4.0.yaml: fsl,liodn: multiple incompatible types: uint32
>> Documentation/devicetree/bindings/soc/fsl/fsl,qman-portal.yaml: fsl,liodn: multiple incompatible types: uint32-array
>> Documentation/devicetree/bindings/soc/fsl/fsl,bman.yaml: fsl,liodn: multiple incompatible types: uint32-array
>> Documentation/devicetree/bindings/soc/fsl/fsl,qman.yaml: fsl,liodn: multiple incompatible types: uint32-array
   Warning: Duplicate compatible "mediatek,mt6795-topckgen" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/mediatek,mt6795-sys-clock.yaml#
   	http://devicetree.org/schemas/clock/mediatek,topckgen.yaml#
   Warning: Duplicate compatible "mediatek,mt6795-apmixedsys" found in schemas matching "$id":
   	http://devicetree.org/schemas/clock/mediatek,mt6795-sys-clock.yaml#
   	http://devicetree.org/schemas/clock/mediatek,apmixedsys.yaml#
   Warning: Duplicate compatible "dallas,ds75" found in schemas matching "$id":
   	http://devicetree.org/schemas/trivial-devices.yaml#
   	http://devicetree.org/schemas/hwmon/lm75.yaml#
   Warning: Duplicate compatible "dallas,ds1775" found in schemas matching "$id":

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

