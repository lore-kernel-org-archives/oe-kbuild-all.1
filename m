Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464542609E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 13:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787491447; cv=fail; b=GduEUUp4mVTwy9pavf4TgYJRB+6MFRmnFpF3198T+CchaiC9M9K0q0zpnKBmc550KE0EqBiPj4hq9H1YE8STJtPrlfla6H6hEmfzz/twCRqZPN6+NhpTTzbni+4ubuakoqAFSbb5ruW1yNRtMCTU1yGmIjwBI20KkeXlTYfr9uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787491447; c=relaxed/simple;
	bh=VPmhJanM3DPeuHW8yFtGRG1KwPhA3hdD3FmbzHM8HTE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=QDXfT84x/tG6ZQyCwCxqhOt+fRn3/Vs7Tq3L7AT2cCVcgG8UORs6O+SZgWg1WLx2FKJ4Zk0dAoiMgB+ug64FI3gZvReCc6DRxPkO246vWcCLW4d8U9sfB00b8izhklHe3DF1ZxlIA3QS98zU8JnHpfNkMvqrIFPrH+i1V26pqIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFXDXj6D; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFXDXj6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787491447; x=1819027447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VPmhJanM3DPeuHW8yFtGRG1KwPhA3hdD3FmbzHM8HTE=;
  b=WFXDXj6DFLlmlLseUb/vXTmr2IC+ZutABILH+OzW19jEDxjr2vX/9gp5
   sMbzarc6yocJaKhLrASBF3DQuFMHB7dzyTeWboSKEYkPJuqELFHtdwqY8
   x6PMMDgRNR4/b6xpMWj892lzVeJInlLX/gGwoMRiXNJH5PIuqA0MxAkwV
   PSEb1uC4k3nHwZ4lgjj+AmR6vnVBExaW+BfvERgg/MyWDwZgOz82/S/I2
   donp4K3rPjbFnQcBD8qO2ScbFKwzH+twLAL1/Bu4qpiCTKUkUhCk4RV0e
   k3qJ2jgnqYyFGrnEChSHulo2wXHhC9ftKU0HLvkgJTjI/wE/BUKyCMNFH
   w==;
X-CSE-ConnectionGUID: 6bLNXKqnSyCUX5gXkTcx7A==
X-CSE-MsgGUID: 9R3jjuXDRyK372E1rviC9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="88021328"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="88021328"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:24:07 -0700
X-CSE-ConnectionGUID: o+VQJsWXRUu474NgaH7dyw==
X-CSE-MsgGUID: s69s0TNoRZulTdurfcvcHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="266246444"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:24:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:24:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 06:24:05 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:24:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkOEQfC65x+/kGDq3ttJqCqRRydOY+4oMVUwmPemTDyUHfdLQrGOgu+j6JJgYDjecE3lbvbnsPL8a5d/nq1HDbVrvtnyJkjjmbTHy7fCabYhEyI6oWIY0efkgut9T5I6NZ9RBj9H51pvcsDZBamOcz2xZMq2yV6qNaxP2M0baOxljDwOJN9tOj1pOPefY0eWZ+VHA7iMHpNEG07ADJ/4S4sj7YWI6fmp8K7RsRCMneWoHroh/6dKP4GQwRvgJogHD2OWretYdlSVZk1vJ9LJwnPmTw/9CzsyCXWubcGTCYRxybPC2sidMn1eaVODaQ+vkZJC1ZxWFQS4AI5TyIKjMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhGfuwFG9kklw54Es88rcVvhvjaO22wR6WVE5gC9Yhg=;
 b=j7EFPTVs9grRDy+gGVkKLFBHqJz18cCRb2qMAW4rsTXzoAU+AizJG8ppenVL4pMkphimbhmHYm+NzPQmWOiL+/1/qkS7zFDvNyzwh1v90yXLy/mbtGe7StVxSL53TPi8Nb1r860OSD67faf/pXeYjOaatNs44dueV6YxulScOiSjo/6YIw5rrZ6FWTvej926A/MzrK2yY8duzZFe/g5cNsYYYPK7U+zsIODCOF95GEnMQFCuiJ3jEFYJSCoR+mfBYym8R8tWBrhsvgB/e88OMvyZeNREsa9m3xTI8BWf3OX0/GV2IvWFjFLitaUG+qfEt7b6bi7Fyivx9AMaPgeFHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by CO1PR11MB4993.namprd11.prod.outlook.com (2603:10b6:303:6c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 13:24:03 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 13:24:03 +0000
Date: Sun, 23 Aug 2026 21:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: Philip Yang <Philip.Yang@amd.com>
CC: <oe-kbuild-all@lists.linux.dev>, Alex Deucher <alexander.deucher@amd.com>,
	Felix Kuehling <felix.kuehling@amd.com>
Subject: [agd5f:ualink 124/183]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2669:22: warning: cast from
 pointer to integer of different size
Message-ID: <202608231926.qd3aKBWc-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0012.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::17) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|CO1PR11MB4993:EE_
X-MS-Office365-Filtering-Correlation-Id: 603a2b72-76c7-4273-a844-08df0119cced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10067099003|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: OlLVVoWOwnDjGQhA8V/YTatiUeqCLylpfyQV0c9ddp3zYFXYcs4IXVZIrvSnhx03sTNmyRn2uhpa2BASPzqs8wAdNSWscarn90uhq7+CjYCDMZaIJ4lGTHZ6uX9k/E+U2/UBdTtzs6E7znklKtL+SVCWc3WHfryZ4pum+STCTBFTekgjM49q4PfipDdd4IlaGXFkvKw+QtP3Q6vgbJwm20yUillPLJl1e8+VgCzPs3hYCtV5cQo59wcb3x7+lyjcLQnYXu4bThS02azd26GO1gv5GI9Ztan9lMQeMQoUiAeKllS2/glSQa/6SQBEJEBYCnapfkr1VZrbZnrTQyvNtNPisBaSNdMI35T95CU7uq/BA1sxNPyPy3aKDg+pthbIZf6akBE96xAunb2LzXm1M4RGw+6D1edXqLw9wLoXd2yXYtT7cqZeqStjyL9QgdYduM0i6KVW1zmuHgpjk6bIMAcxt/n/1XAP6DH+fgXZky45RHPykLS+VrZKS9iZOUvfRdemdXQB6SNmmGmvNJkv54/hYMUKthEzdc2a6RC6NrUnizVOlha6Em02oTEusf7Oo4foQtxWTont2EN6pWtBPSmel/N5G+L3TWK05cnpBEzM/wkg5JenbPixGejQflNj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lxIL+OgNYRNobwMjYd2cu/uZ/m4e2jZEq/f/iY3N6TbvhwR0OV7z0C1fqLfN?=
 =?us-ascii?Q?O+LayJPd2/Q36LidCLpi/SjhTPLmnDHHSqC34kqZ9QSd9U3CkXFtbbLE2Cmw?=
 =?us-ascii?Q?q0PvTUOVhhHsj+1aQeMtyA2jE/yRCbwPaAW2Pht8JznndrD8TWJIGcDJVb7K?=
 =?us-ascii?Q?yyXztHLj0cB8g+Ed096hCWwj/xbpQmXdkCFGF5yvNNCoe3Hc8mXW19CoumCt?=
 =?us-ascii?Q?FDQBOZuQ/yGDx8NL+cUCJqe8+lzRaf+5jlewCmcqEIw6he/RfYTB9HNMWXBz?=
 =?us-ascii?Q?dpASXLENBl0EYYY8cwcqgagIzjUx1Ftsk+Cy3AmRMQ4DN4BI440pfRlRK9kI?=
 =?us-ascii?Q?0z2UuK66h0mTsVaIdiqPddpWIMbpc365OEbVyYXnoCp2jlsW8cgNPD7GJyHk?=
 =?us-ascii?Q?V2LgXMsA7bCDlUUCxvgJaiTCxcbV8L45VnUIPu3ioaePhDM2IvOohdIZvAdS?=
 =?us-ascii?Q?et/Ejo+1bs6SH4veYh4xIVa7EdK0s8i5/byvI4C0c6NTEaAbYtzVw+1+02+i?=
 =?us-ascii?Q?QsMcUu7HnSmYyRyWc3ouJnPiYQnQnjtfHJGzRf+5EBg13fSibIf7bga34ou/?=
 =?us-ascii?Q?tVqKXWwYfo2tMDZdaHjI3oT0qqVZ9UxWS0puHwkQN8XZ2OV+/eprdS9L06UD?=
 =?us-ascii?Q?lnCqM5rWD3hD7Qb0XEXIG7wbezFMTNQ/e2g5Po9MUvBiAyWlL5vRKEE5xgWZ?=
 =?us-ascii?Q?KM5GWOyLaxbe2a/GBjPCnXgXAGNpYyLx0GK0ba9iJV+jonY7As6N6lHT2xTp?=
 =?us-ascii?Q?RgW0ZVr1/P5b58dB3E4I4YROog4YyA5IVHyeWKewlO+i72KzThJiR60uruvK?=
 =?us-ascii?Q?IVYYbOwV9dA/+r92zPrztCd/1qLpyRMlMCQt7L0tvMf+DsyeMzhATkOMyeuB?=
 =?us-ascii?Q?0/z3ExoCA9iiTw8YPrX1L53y+P12hKDkoZDrDG72/CfssCAcGeG0aDy2ciBA?=
 =?us-ascii?Q?iHzR5hCrjfbftCumKuU00zcim0OM5qpV9ShfUPbWZeOnzUxDDG1SyKYFuCOC?=
 =?us-ascii?Q?fnfoRJ4jCzmPIwnGsIupzci4mHfbbBkQEi3ECDBSBYieWCrLNhrV0JYdrsS9?=
 =?us-ascii?Q?c3ODvH2oPOBXpeNBWxyp3dMobnunkbRS32en6iFNczYEG6pjESDOw8YX6nVO?=
 =?us-ascii?Q?O8dy5bxL5aStxTXs01tcxj3Q8v6ywueotDKbjZFPbx3wJ81Fi44EQgD4iDye?=
 =?us-ascii?Q?jrK1acpQ163BDhTXdMSTlNeFuZ/QGXibUYMX3WEkNDNGidEMHz16gJFw0PNu?=
 =?us-ascii?Q?g9UBhRDtK5APUjfAmbRdZLUtC3p76tc3xopkPu2oYP0KtAUI6AmkT062dexo?=
 =?us-ascii?Q?tbiiXXpxmjWr5DlYVAqi5NSVUalNTseJQN92AKA2moeqPeS3QKlr/L3eF7cG?=
 =?us-ascii?Q?sy+MW1lyXykDqcIwswRtdMajfuuguVZuOjg79/dQvPX04/WF0N6uNIz1zTgr?=
 =?us-ascii?Q?VwkzZ3NNlgmN4GZzahr2V8E6aErjvO+tJzPfj/fPDgBVJUyDK0h/s2hBiEkN?=
 =?us-ascii?Q?6L68asBCoLT/4bbTSIKX+neJlkKLFAasnhgtRHU8Z5dohOmmnGXJOf16SSJi?=
 =?us-ascii?Q?AqMATntwQ0VI+NniU4nn0EAa/+FtZNj25bPMBaPZl49dgicfKKjuvXKXsbZ5?=
 =?us-ascii?Q?1BXiNGvluFdI9zALsUOBTd+dANvLyXIDctlUpmBY+JwA7hqIw+9zK4oUf53U?=
 =?us-ascii?Q?LaQrpkRj/12es4VteEtn8CAouDflwISjKYTHn3FAaNm1wmlFaK3/orucH4L3?=
 =?us-ascii?Q?x5iSwgahbw=3D=3D?=
X-Exchange-RoutingPolicyChecked: bsIL8autsPLNACPyr6oN3ST3Nw9V5glyh9k7YTAK2/yKC2oeSdxk3xZNAMu143NE2NfcOoiqTDXWQ3LDOv3u86IhFZb2nSurkp5fYaoaRUL3LEuQBEOot7QIxBf6bP03rsrdd5YpW38RFxdbdDmRCrq8C+IDqhbuE5DXZBvK+Cjcn/eh0jNbBx4dti2meqpLWIY3boXwlwlpOrpgH9RVQocL/HOs5uMz4ZE9XDh9frsUgL2wO7p96HyZytzz1eyxfmkToKpIpj0N9LSVnlfNGVUWvPC8Glvqu/+gfhUqetaEbFFNZh7aDuUd6Fp11fUd5Jup39fZk50FNYGtHTSAfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 603a2b72-76c7-4273-a844-08df0119cced
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 13:24:03.4765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ku1Y/stnKAyaN6yj+H/Tpw4/dWnPVQSEmEIQRQ0UoIuXXBvc2ULXk0AyC9yXi/nxT1bOXnUjv/LaM0Ia3DDyng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4993
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/agd5f/linux.git ualink
head:   67bd1d6d1b25ea1f893a76fffd13dd6335d297d0
commit: 53459fed72b6d01843bb228453ddd905efc32038 [124/183] drm/amdgpu: Add UALink firmware writeback address configuration
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260823/202608231926.qd3aKBWc-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608231926.qd3aKBWc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608231926.qd3aKBWc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c: In function 'amdgpu_ualink_gart_map':
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2073:26: error: assignment to 'dma_addr_t *' {aka 'unsigned int *'} from incompatible pointer type 'u64 *' {aka 'long long unsigned int *'} [-Wincompatible-pointer-types]
    2073 |                 dma_addr = &npa;
         |                          ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c: In function 'amdgpu_ualink_get_wb_addr':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2669:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    2669 |                 wb = (u64)remote->rb_cpu_addr + rb_size * remote->num_accel;
         |                      ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2673:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    2673 |                 wb = (u64)remote->rptr_cpu_addr;
         |                      ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2683:19: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    2683 |         *wb_cpu = (struct amdgpu_ualink_wb *)(wb + offset);
         |                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c: At top level:
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2691:12: warning: 'amdgpu_ualink_update_wb_address' defined but not used [-Wunused-function]
    2691 | static int amdgpu_ualink_update_wb_address(struct amdgpu_device *adev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2443:13: warning: 'amdgpu_ualink_emit_interrupt' defined but not used [-Wunused-function]
    2443 | static void amdgpu_ualink_emit_interrupt(u32 **cpu_addr_p, u32 wb_data,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2404:13: warning: 'amdgpu_ualink_emit_shootdown' defined but not used [-Wunused-function]
    2404 | static void amdgpu_ualink_emit_shootdown(u32 **cpu_addr_p, u32 wb_data,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2144:12: warning: 'amdgpu_ualink_metadata_init' defined but not used [-Wunused-function]
    2144 | static int amdgpu_ualink_metadata_init(struct amdgpu_device *adev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2099:13: warning: 'amdgpu_ualink_gart_unmap' defined but not used [-Wunused-function]
    2099 | static void amdgpu_ualink_gart_unmap(struct amdgpu_device *adev, u64 npages,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2052:12: warning: 'amdgpu_ualink_gart_map' defined but not used [-Wunused-function]
    2052 | static int amdgpu_ualink_gart_map(struct amdgpu_device *adev, u64 npages,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:2029:13: warning: 'amdgpu_ualink_sdma_entities_fini' defined but not used [-Wunused-function]
    2029 | static void amdgpu_ualink_sdma_entities_fini(struct amdgpu_device *adev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1996:12: warning: 'amdgpu_ualink_sdma_entities_init' defined but not used [-Wunused-function]
    1996 | static int amdgpu_ualink_sdma_entities_init(struct amdgpu_device *adev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1840:12: warning: 'amdgpu_ualink_metadata_npa_mapping' defined but not used [-Wunused-function]
    1840 | static int amdgpu_ualink_metadata_npa_mapping(struct amdgpu_device *adev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1718:13: warning: 'amdgpu_ualink_metadata_npa_unmapping' defined but not used [-Wunused-function]
    1718 | static void amdgpu_ualink_metadata_npa_unmapping(struct amdgpu_device *adev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c:1631:12: warning: 'amdgpu_ualink_gart_npa_addr' defined but not used [-Wunused-function]
    1631 | static u64 amdgpu_ualink_gart_npa_addr(struct amdgpu_device *adev, u32 type,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +2669 drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c

  2656	
  2657	static void amdgpu_ualink_get_wb_addr(struct amdgpu_device *adev,
  2658					      u32 remote_accel_id,
  2659					      struct amdgpu_ualink_wb **wb_cpu,
  2660					      u64 *wb_npa, u32 type)
  2661	{
  2662		struct amdgpu_ualink_remote *remote = to_remote(adev);
  2663		u32 accel_id = ualink_accel_id(adev);
  2664		u32 rb_size = AMDGPU_GPU_PAGE_ALIGN(2 * AMDGPU_UALINK_RB_SIZE);
  2665		u64 wb, npa;
  2666		u32 offset = 0;
  2667	
  2668		if (ualink_addr_mode(adev) == AMDGPU_UALINK_ADDR_MODE_SOURCE_IDENT) {
> 2669			wb = (u64)remote->rb_cpu_addr + rb_size * remote->num_accel;
  2670			npa = amdgpu_ualink_npa_addr(adev, RB_TYPE_TAILPTR,
  2671						     remote_accel_id, accel_id);
  2672		} else {
  2673			wb = (u64)remote->rptr_cpu_addr;
  2674			npa = remote->rptr_npa;
  2675			npa |= (u64)accel_id << AMDGPU_UALINK_GART_NPA_ADDR_GPUID_SHIFT;
  2676		}
  2677	
  2678		if (type == RB_TYPE_TLB_INV)
  2679			offset = ualink_tlb_wb_offset(adev, remote_accel_id);
  2680		else if (type == RB_TYPE_REMOTE_INTERRUPT)
  2681			offset = ualink_wb_offset(adev, remote_accel_id);
  2682	
> 2683		*wb_cpu = (struct amdgpu_ualink_wb *)(wb + offset);
  2684		if (wb_npa)
  2685			*wb_npa = npa + offset;
  2686	
  2687		dev_dbg(adev->dev, "source %d remote %d wb npa 0x%llx\n", accel_id,
  2688			remote_accel_id, npa + offset);
  2689	}
  2690	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
