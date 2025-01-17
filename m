Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8152F25A651
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 00:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737075319; cv=fail; b=FB7EIflMfw7dkLUJ2ooAzzMFo6FOUa4Yv8beH/cH2Z3ls+QEbtP39U65vmj8g72Jllzw4rrcYmX/dmUfDC1F59gLSOFxQoamkHlvlWWidf6VleHYgPi8NYKksZuMzF+gcO4dUoMLwzISoOsqaZcIFuoTUOeMu31lBEKYJNMylyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737075319; c=relaxed/simple;
	bh=fYiQpDeQ5t6Dy3FsXm4TUxS/9V6yj91bc/ng1xoMCR4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=JMq6mZKwuS2GlSfGT9VFXnBocT4UnNhATvFNTOTipBwbuywycM4V6R7tru/IXGmSjwBBvXEeLKQWwg4jZ/AubQHr1vd/Sj+wktV2WlCAJw8yonlkSyYRE183fokYANsnaPWB1hoX6TkWCBCI2IXuyUnyzeQsvKIPgAsLEZaNoA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIucchAo; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIucchAo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737075318; x=1768611318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fYiQpDeQ5t6Dy3FsXm4TUxS/9V6yj91bc/ng1xoMCR4=;
  b=aIucchAooH6D5h8MYQnbPbEzvsJz7EjUX82GXcgjujBGVkAK0EKP9ecl
   IChOj6Iob6h3Ni8RZSZ+EOy4u7byi5rEkbHo7W3048WdI7SCYWYXPZcL9
   C10nWG/NFUYUfNWgiZDp6VPmTRORAH6bb0/NpBbS1Z4FqPqKmARd+3hPW
   Oj/DT380d6HOfc4XFKj35T8iuCC/0hjYFyZMsoKeWBvTNkGrhYq4qRCZs
   Uf4itfN53gZ4yP7TMd+zNRX4AG5OnvJgZ0bhwSVzP0sGndV3c6Rt5wmvA
   V5BL1Bmj4UhqoiLBj7Fc1wAaJSCNGaxYr4P+HV55Kt/vtizOOHef/r0Kq
   w==;
X-CSE-ConnectionGUID: /oMJhqLgT1iha9lcCwbnQw==
X-CSE-MsgGUID: pOtSbM/6QJuCquVa8waWAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48905632"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48905632"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 16:55:06 -0800
X-CSE-ConnectionGUID: bRaK+V6STLOmTcM4Ku7mYg==
X-CSE-MsgGUID: vZzc7vaORiq5U/jyF6rtFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="136494826"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Jan 2025 16:55:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 16:55:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 16:55:05 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 16:55:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwYDVb4DHkWhAuH71GJHdvJGlU0JHePYq492vM2Lmgg422vf9+n160ZiZEeyiZI6VAijGjxuk11/vjATHj4QNayuVL4vDRg1Asxb9aYWOE+b9xGFsP9ngDhkC/cf8BhzH620bdK7iLG5n9cVAPegs9O6UXrSVDT0JUI6Ig8qsSw+B1NzyT/tGy/vDWIno/rUXOVJOhSp8PrL1+/cK/B2VRjgI9FFZshCAapxo1qw3VrR8MNDVNUP/Q9bzl2cgQVmHzX6ndmx1JgjPKDGyb4khBJzHXy+7s/mEaRX7Xeuxl61CRKkAI0A2pmflp3UeDPxEV5LdlBjP0hniXrQrpkf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+A9Axb7g8dPcYh9DrH5tIBzw1d6Ar/xKVBz3q2CoxM=;
 b=x/vBKwxVvPF8tX+i/sQR4x3+8tvGgx5qWmS4P8ZKV6ZbJ2jKnpSBxbhkvpcmGZijD5f3jBkBuCyi0pKqrgeNlWgt2DcF6W2o0+2TRlZbrTg62o/kX5MDYb2Q4dvH0tbinKlyqosx0FbopZJ1v28N7QRTLVAp3zJJiqQxmW3qHgOSobTtWgFRN3a4sO8GAXPujXKLDOgaWAEVjRhT4jBBAeIy3nqFesaWscuE0UWpnOW+zWwtoJI5huvLoobv1D4+TZgYNQ9yoUWadd7OQUe4pFKZVK3rfVV4VSC+i1xgWQcaoeqQchJZRd+iLfCt/aIdnT+SYuEHECWklsiJe+4Alw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW4PR11MB6739.namprd11.prod.outlook.com (2603:10b6:303:20b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 00:55:03 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 00:55:03 +0000
Date: Fri, 17 Jan 2025 08:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>
Subject: arch/powerpc/boot/dts/adder875-uboot.dts:77.12-90.5: Warning
 (unique_unit_address_if_enabled): /soc@ff000000/mdio@e00: duplicate
 unit-address (also used in node /soc@ff000000/ethernet@e00)
Message-ID: <Z4mqYCn+Gfmb3aVD@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW4PR11MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5fab77-525e-4cb6-3a3d-08dd36919376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2d/QRq3N3OCJwFenAHVFx47h566T0VXjklHmmR5XCyb5DqU3CKqMRFFGAQvz?=
 =?us-ascii?Q?dqnCLOQRr8bB5eX4MkK3VooJaeAI3sfgDfnMH66Sz39U6k1uYuE8K4KRe9Fb?=
 =?us-ascii?Q?DRr87WMO8Q3SgJixDjdzzZx9ppkiSjyItqBf3Uh+7Ko85sAqsumUCWwt6qJz?=
 =?us-ascii?Q?VoENFptFAReFctqCe/MwgSPaArLQDYRzBj5YOw1cNY2wwf89m0HI/BRQCWhe?=
 =?us-ascii?Q?RhFnqkcZDdcryKo3WOqmyj7u83Udbep0c2fJ+qs0AyQivatDr+vwyovB1/BU?=
 =?us-ascii?Q?L5JpZnsK0OZu+xr/hz67Mya3CkNLomYIKWBvKmewzcnXX+jYmchVwbIcDpxT?=
 =?us-ascii?Q?KTW46y8Ix8Tf22bL+CoqLCC9MpdT89badSb9+NF2t3W8AyYvFKCIZ06lsMAe?=
 =?us-ascii?Q?Sk81MpBirp+EjOba+oyhR8Qd2t9y8TLwcs9W38hakLOqpiuPzkE5xEPwe1kb?=
 =?us-ascii?Q?b0QkuxXdNf2Je/wiPBV7eneeJxuNC7YCArXZ/LBDIh3XdkgwSYN1xiKc1bBn?=
 =?us-ascii?Q?XfGY4pYQIYOxoL3oTGkIJnSRftDA0XPOpUPqZ6sL37x3N8a4hJndVlu+N6y1?=
 =?us-ascii?Q?2mcDg3iER+3tFdnJkOWpS9ktydz7qZmvBv1HUPtw1NabGLgoLKCZs85g0+FA?=
 =?us-ascii?Q?BQT906WuZXoQHcKd0vzJ0XOk7Qy/LVKNfre9peSEd6bIqDl2zsKAf0+MEsjJ?=
 =?us-ascii?Q?+yhfywmt2PiKqbqfLFLjLveCOq7NDnsTdvCa2NbkkYseIQ/4XjRen/6FZjTe?=
 =?us-ascii?Q?lTTcF0IuZFPMVZATkb0OmFl5d5o5O7Mjf5MVwMaoLDTJjNLQqHno59ptiT2g?=
 =?us-ascii?Q?qkZ+1PXQkLrngoGqG0AJUjJJI6E4Rw1pvB4zyHzS4sUqZrWMHCN9wLKGHRDA?=
 =?us-ascii?Q?Vlh+kuIWw1We+TJS/0WQtlrMyFcYeosfg/TtJHDHLsgVoAgUj+1GKfAcSqdk?=
 =?us-ascii?Q?H8MpcV1RAYsydnmoOjHPz4+28GXk67I45qKuHX/Gnr+n1lGnXK8mRmdDs649?=
 =?us-ascii?Q?cCo+bT8x5/j5EKIXPnLbySXOPVOHI9bptKHvgUMSCmRVSRonZvWfNpL1jebv?=
 =?us-ascii?Q?OI20CYY0zXNZFiCLxRicxRdqbdlGHjj58IgA9pd0/SDoi2fWzsWO+ZMqlBN+?=
 =?us-ascii?Q?bsQ+SxAlTmdjbDWlONyKGw5tKE1Hka6hPqzyjgw7iNhi6anCbmFvbL4mHzIO?=
 =?us-ascii?Q?+ZXvyD6Xht8p7pjs07VIzf5yzIq9V6dVeU+YcrSPgj2RmRuFEr5AGBguA6JH?=
 =?us-ascii?Q?SQ2KFngOKuA0gvTUUwSRcbaywIVtSaCPFh/Vs/nxwi+rUeUEUvfOlHfjDMzy?=
 =?us-ascii?Q?pZySW0GGUf5rYynyVUTk+s45Jfdo+xi/OwaV6HV+5eiP+KobOyicZoItJk4d?=
 =?us-ascii?Q?/fvBHWI0iDjcgPvP2Dtgf8YgXzWNmMYQuK0GoG8u1tSF2q2Uhg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jiTlVTNE8AUByCgI6+eNwiE5h+7Cx4lRvSh0Sv/eo/js1aN4+GlP+FBcy5Ds?=
 =?us-ascii?Q?S9kTqqHaWY4uEjOfoEDQ8YmmNAdtkj17rJ+fEKS6O+sR7gX15ais6CDEk3aD?=
 =?us-ascii?Q?22b9LkE38se29hkn4wtoi16HZHvJD1WWCYqpZhvl+fUFe2klvAcAlIt8Gich?=
 =?us-ascii?Q?p4e7ABRkgApLGdkgG0D6cOICvtPFo4sFQhioKa/sMFs4tNTizEmQ5POWom8f?=
 =?us-ascii?Q?3B3jIcsHVZXpWFNpVXN+peVZiFEGofD46d0ywdlnRt0IYBSgEX1FlwyQudvi?=
 =?us-ascii?Q?Q5597mw6jegRWyf6Er3TEoNOYPmOFtCQiFpc2YtnzbOc9TT9DBZT12ukl38+?=
 =?us-ascii?Q?nzccWxW1f9Up0Fvzve4n2OKW9iZ4PhgR1Vqp1erg62Oj1sKoQEZZUtAyeiTe?=
 =?us-ascii?Q?87+zSU1KnpN5wqQBsi+oSPcVJ9AZKSNk4vTFtcl0ROReQTolKZvNCToxWP+f?=
 =?us-ascii?Q?fASRNpiHSyrARDvI60JDzzC6jqqsgiUQIhrWszCZVCWenDiDeoNQ/bL2a5Ah?=
 =?us-ascii?Q?Xc4akOFPQW+a61V3WAKNrGBLdM6ZdZpt0r23yKEj9GO4hp3lhrqahi1kcUeq?=
 =?us-ascii?Q?7bI7RWedL/XwHk4u2DkUBYZGFZ7QjfDWVTaYxmfa1N+F+MDWEgxBCwjNSh5S?=
 =?us-ascii?Q?ZOsJxZ04cZ7bPQ9KeyA7C70UUhAaWmnEUoDxFyeMpq1YXyVmHNh+6/fRXVUd?=
 =?us-ascii?Q?OJ3imCd0ucgj5Js2KNAJH6mA2/InnU6/fltyBRx8ODBz5n9Hs//ZPQS9Qtlx?=
 =?us-ascii?Q?wqJl9XqoR9UzFlCqHtt1W1V3Hs7e1U8XXkPv6bNdY5KTqyPmVuZYekqycCTq?=
 =?us-ascii?Q?vkJT2TZq3FwM4W7TPvdc8cJU/NUMDHG2jp3yaAvS7REQcsUuMHUbw7hByxah?=
 =?us-ascii?Q?pKAwYPjBCG8OFmJiK/a59CRyxlaCaebzh4M2wzB7jMtmHiysk1ZXPb/gaeRA?=
 =?us-ascii?Q?iVLHvHFe5NmCggfexxqOFQNjDrGEF2Z+VDKyglJunJThQ0TCZILmjnA3zvMi?=
 =?us-ascii?Q?5hzo7vM1beXomRk9JnaM1K7DyxdMFjFGo4VatqzhDF8tpYmkKkpCFMxuP332?=
 =?us-ascii?Q?VkRRRYohOrjZDIw4NpOEnGy0jPdLqIJivv8Yh8V2qxmUN5HZGBqjl7bGefFR?=
 =?us-ascii?Q?CTxIfqftrezTyuViylOEsyqbJ0fWbReyoxQk32+XuzvS5QBUavfo8TzfU/Z6?=
 =?us-ascii?Q?flE2GpaX18BvUBffJywb2S4sg7L3Pw/qdwPAZSozIAHgTb3N2WEDuUlJmXFR?=
 =?us-ascii?Q?4gmQUMA7i/cM+a0eYRqYmc41lFdSyBSEPtxYaXF1li4X/Tk1pHCTMJrfbz6p?=
 =?us-ascii?Q?j/KkbG9+KDhcB0yZPB+I0unmWLwnqlTCdR6PjUGkSj3GqCofmAAVtFkLQTxA?=
 =?us-ascii?Q?zJdKbTVFgBOt015FXXQk2UiY5INZ2PKitNXrgDsMAQ9Cz31XHh5t5UfRQgPm?=
 =?us-ascii?Q?oa3MXw79nr/EAG87f7I7jxfoHTjc+cRQxxNLmXBWwmTDfIcXP/DO0j17gxV8?=
 =?us-ascii?Q?hIaW5zjcjWhWAfSUl/527kBPA71diO/XetP4zAOdutmGO+m2ghd0iZP+72Qb?=
 =?us-ascii?Q?R7HSvt94JEjr7FyW4i5lK8Ts19nP96yCf9yS1kH+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5fab77-525e-4cb6-3a3d-08dd36919376
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 00:55:03.2939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swU99HXALRKa9tmnOVvFwEWmUNHu/NHmYVDWU5wgjW2c1E2N6bv6lTZPB5ex5SUVPJ2HDUc+Go47GLdc7mz21w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6739
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ce69b4019001407f9cd738dd2ba217b3a8ab831b
commit: c5aebb53b32460bc52680dd4e2a2f6b84d5ea521 powerpc: Force inlining of arch_vmap_p{u/m}d_supported()
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: powerpc-buildonly-randconfig-r001-20230115 (https://download.01.org/0day-ci/archive/20250117/202501170625.y3ACLyqJ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501170625.y3ACLyqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501170625.y3ACLyqJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/adder875-uboot.dts:41.9-44.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/adder875-uboot.dts:132.10-141.6: Warning (unit_address_vs_reg): /soc@ff000000/cpm@9c0/muram: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/adder875-uboot.dts:57.13-62.5: Warning (simple_bus_reg): /localbus@ff000100/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/adder875-uboot.dts:132.10-141.6: Warning (simple_bus_reg): /soc@ff000000/cpm@9c0/muram: simple-bus unit address format error, expected "2000"
>> arch/powerpc/boot/dts/adder875-uboot.dts:77.12-90.5: Warning (unique_unit_address_if_enabled): /soc@ff000000/mdio@e00: duplicate unit-address (also used in node /soc@ff000000/ethernet@e00)
--
   arch/powerpc/boot/dts/adder875-redboot.dts:41.9-44.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/adder875-redboot.dts:133.10-142.6: Warning (unit_address_vs_reg): /soc@fa200000/cpm@9c0/muram: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/adder875-redboot.dts:58.13-63.5: Warning (simple_bus_reg): /localbus@fa200100/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/adder875-redboot.dts:133.10-142.6: Warning (simple_bus_reg): /soc@fa200000/cpm@9c0/muram: simple-bus unit address format error, expected "2000"
>> arch/powerpc/boot/dts/adder875-redboot.dts:78.12-91.5: Warning (unique_unit_address_if_enabled): /soc@fa200000/mdio@e00: duplicate unit-address (also used in node /soc@fa200000/ethernet@e00)

vim +77 arch/powerpc/boot/dts/adder875-uboot.dts

b09c16440eb39c Scott Wood 2008-01-17 @77  		mdio@e00 {

:::::: The code at line 77 was first introduced by commit
:::::: b09c16440eb39c12cc91aea5b572c753a5567d57 [POWERPC] 8xx: Analogue & Micro Adder875 board support.

:::::: TO: Scott Wood <scottwood@freescale.com>
:::::: CC: Kumar Gala <galak@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

