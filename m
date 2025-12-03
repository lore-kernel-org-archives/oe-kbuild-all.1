Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1715827732
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 04:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764736306; cv=fail; b=MoAKGzbqvPSEWdwugJ6COpxnGKm+j2PsJUte2Gyqs/yWlWCyGM9kyDyZsvlXCNDYK0yFjY+004QR0AdOAssWW/WkODep8NZhx8h6tkr+XCM96r5MbnF244QM0fa7/feM7UEf5217ATZURhfN54CbPZDaw6sI/34BeeOhuFyneQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764736306; c=relaxed/simple;
	bh=yh9eJtMPZxaqYHVhTAGZGTL8aEKN8mODvyvRBgesGvU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=dR2NpqAqHQPeD1LaNa7lK0UZ5XBCFCIrXbwiBndACmyUj11qATSjHDQB6Fl4YHE35vH+K01mkilfUYMre2gFsJV9H1SOGZx6PuOb0Qn3f16H5iBatjUjolwu/Lp1ndawVWVPs8O6RnuwBotKhv/2CoARVbqbgt1QQEkhFX8lH78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFv9KB1W; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFv9KB1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764736304; x=1796272304;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=yh9eJtMPZxaqYHVhTAGZGTL8aEKN8mODvyvRBgesGvU=;
  b=cFv9KB1WOxO3BhVjO/G8sUEEqtbTmy+NH+sWKyX1ZvdKuTVOJHeqNfm5
   JAwErs0dk0vVCTHRtq8Zb4u0Dp8SExbVpMCY2tUXAsjf2LbQW/TLR2anI
   HdWoPxYjAyKerKVmcB8YinLp+afDEZgnoTx6qNKqytVPtwmpjnXnTrIlS
   GJHSA94uuZwDUCXYSCKRxZleKLmxgQTPS/S3AHkUit1SPs61mOQUNdSr7
   1NhLvV7AI1FBEd2WosZsHRJexXJcrOm/E34sphvxcY074kO68xmk1+Iae
   bJfw6iFIYrDEYds6rTYd+oaeiAQMIOSAbfsvsR4aXQ+ycjrsFn2p7Arqm
   Q==;
X-CSE-ConnectionGUID: xQkTgkkXS7Ky2ft8BFrrTw==
X-CSE-MsgGUID: BuANcwPhQimD3euTnVsWQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66755271"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="66755271"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 20:31:43 -0800
X-CSE-ConnectionGUID: Pg2wCnU2QIKuF9aNOQKVHg==
X-CSE-MsgGUID: fsT5z+uDQLCWlgwYImLeiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="217896675"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 20:31:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:31:42 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 20:31:42 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.23)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:31:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qU0mtT3TyOZ1rLk0XS/4kwkgcdLHgP4WMnNr5mmm4Z45PXdMxEBQfJhozZrxQGkJg+6qW6BitQamBOmzpdiXCWwzeHpOGrD9V8/z3hxSXrHTNTSAcubkfAM/+kbbwLEdNAycr8dK/AEHT+Ik9Dk0J/+eZ4pn9ctfwRErpN5XI2/ZDhRT7OY6x2qzJf5ZpLzPewXzIJUnGWWRgUA2ih4DKY6ytejkefVqpObG9id/a5MGybSzKLJQ54RYP0csrf+XfWxpBjGXC3fLhAlXUYIanNPuSeXl5Izt7dfDRdOFWXzFKklCfHva7RzDCzZ7m5nOJKvVWlb8gB/FOxlnQ5g6dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DA1aw0mx8PRGEN5eeXrAVdlxoShKwr+fvjWIAuL+CWM=;
 b=qy7wjcw7aFKJrDvV/rR/cbesnJex3EE/pPDLI9UiPLoW1NBh4NIuRYPDyOdQi8m/8VzxDew7tng+pbGZmZpmfKke3JoW93msJdtAHv5ewLI5uwBvOxZcTMu2uR0GUQToVqUrKwKjPzW46xk2jXESWXyOhWC5KAxpF+siG4w6ZzJIhKXZ5I4K+ItQxSU8RuNFtvqjZnFF8gpK09nGiog3/DJgiDukEkuC6+UtrP8+7drfjR7H0eZmWDqTgxdhOuZruk7cfLkYGdNWxGlZcFcViVrrJdgynEAY96SqmGs9FyTN/x49sMebu/2yYfXdElwEhJmqtdDPUufet5mIhx9wIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA1PR11MB8317.namprd11.prod.outlook.com (2603:10b6:806:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 04:31:40 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 04:31:40 +0000
Date: Wed, 3 Dec 2025 12:31:31 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>, Suraj Kandpal
	<suraj.kandpal@intel.com>, Chaitanya Kumar Borah
	<chaitanya.kumar.borah@intel.com>
Subject: drivers/gpu/drm/i915/display/skl_universal_plane.c:1288:21: error:
 implicit declaration of function 'drm_color_lut32_size'; did you mean
 'drm_color_lut_size'?
Message-ID: <aS+9IzJ9C7yg9ZAp@rli9-mobl>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA1PR11MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 6083cf51-7262-4dc3-abc7-08de3224dab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+2zdBL+J68cw0oen1muEU/QJG91xtHGqq38LShYvvZ65cLV/Im1KsKsKKt?=
 =?iso-8859-1?Q?R6R812BbkA4w5t0K9X0bshmWIx12qnCfBp6+O6/5HT+I1As/F3gCk479pH?=
 =?iso-8859-1?Q?Bbb6unaaB5biSzkzRzu9k3dr4+xmcxwBaHrc8icCzLjoA7TUdU824YhBjk?=
 =?iso-8859-1?Q?z7iiHcmL9i3+e3jvBZtpw3xlmxnTy4PyhLkEWoWrc1jj9G0oD56gDSTzq9?=
 =?iso-8859-1?Q?joyENvFRcuA3hI+NCKN/REQyCjMFu354DQ6IDX0tyEU3ARi2lXwoSfRMwj?=
 =?iso-8859-1?Q?T/GLb0jBdyAkibiaPPpwu8parnDMDmnuwmWVidoCbVxTZ7xOBfyNy6C9WW?=
 =?iso-8859-1?Q?GN00q3SDepGWxFckm4MH8qSmI1MAvka8jDWn7q3HMsZYRVRzRq606Yz4Bl?=
 =?iso-8859-1?Q?0pT4mhr6h0e4U6UsU2Aa44t6paRggcqVSR/ZGzhDTQkLJEzqCzUEItx1p6?=
 =?iso-8859-1?Q?KNlZKMfutk0SoTcSsdHDVblr4AoL910QMnRTEuWAEIN1u7ZjCDGKd0e5yN?=
 =?iso-8859-1?Q?93e4Mts0wU6Q1ajK7AaW7DaavJOnjdKklNeM8jPeKW2UsB4PNrJo3Y0LUI?=
 =?iso-8859-1?Q?W5GTiuicFw3RkkcgG+geNwm1/LoxL41IwztaBobdAYW08xxKVYObJG92x4?=
 =?iso-8859-1?Q?+Hx8/QxNkHltWEYqh8oB4caFljFylvxLTBNn/PtRAOkR9HUTSSH2mU3M6V?=
 =?iso-8859-1?Q?6opWc6YoDsHFQ5zMjqB8BC9/vXpZBoWxUOFDuS2kQqlA24oSA6Hp71OblO?=
 =?iso-8859-1?Q?8yQ/MwPVNUT7jGkR4azKpnWzEfDLhncFqdw1jJBdiMy4CvqUxBYDrVE5qk?=
 =?iso-8859-1?Q?ez0yOBeUsMKHFpHJLuud4ikYEr6kxBAQ3kuJj0U4T1Hb4+z3ArjtD/tX8P?=
 =?iso-8859-1?Q?ohqbB/CjfUBAH7XQNGLrq67nSPaha1wG6QL6CbrYiqdy5CHvCCUfoc2QNt?=
 =?iso-8859-1?Q?5DjEa7arhyB8UxsT0S3W8F1bfifwkeeIaUp1Yr7awihYR2cu13r+Rw0OlW?=
 =?iso-8859-1?Q?Bo2kaSLjGAJWHm3EFbKdaxBUTWFxvMm5XWuzzm86Re/4SYpKy6LsdTlzsW?=
 =?iso-8859-1?Q?pkuQdCh4MklVkDSkwydF0HArVAWtLfz9NaBXrrNgSH8tM5mNfTE+rGzpp/?=
 =?iso-8859-1?Q?kJOcfwKoP0glQki0NsquIET7ac0I+ZKH8gGvitGrKlGNLbeBm3xpumLeQk?=
 =?iso-8859-1?Q?bQRINyHIRnQp6cz+S/nAHt0O09UnWo6Prj73T+pT0cA2oDyRCZ5vOvOVs1?=
 =?iso-8859-1?Q?WO2Ze75W8LaPAjiGZaY5Ux3J9PHzGeWfHlOcnPeU9VLAbRboQZVAGcXild?=
 =?iso-8859-1?Q?SKAdGfsmBw4EBhW0bszLQMnRW2EIdIgf7Ywzefz7zWN0tUTa/bBrih1/Ev?=
 =?iso-8859-1?Q?F6qF06TIUlcHiFjjo97SMzo0Icvuzbe7yUxQki66ANgAI3aWLk8RlLSmkn?=
 =?iso-8859-1?Q?1Fal/el1K1CpoFqSRvPm2P3OL08r3GHfnyYsAz/V6LUXlHmyAN845vbGqB?=
 =?iso-8859-1?Q?A4CbOpvwHyArmqODjCW+xOpYtiBHcStPDgWswXjfAeJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mTMA/HVZeyX/1tWOgf8jdh2CoIjEgRuiZohIfUQTLui2YxW/3QD08D+W9q?=
 =?iso-8859-1?Q?sj2mIXjZkbiUv/xRD7laQAin1Fn8GboUsIqVN6SAOLXrhw8ruYCiNVVF/t?=
 =?iso-8859-1?Q?394u1WdUXvq178QaE8AmFt9OKwBC5N1uqy90XXDjrSXAOcdYPXiB8XTMwx?=
 =?iso-8859-1?Q?yfHUtJJENvGqv9Ga9RPktlV3gTV5BfKdkpjo+A8hXqm8gQ8XMupZ89lmnN?=
 =?iso-8859-1?Q?3rwGMy3LqXPd8pu+nsIWppWuxV3GfhGRqeCEGVc1QaFpXrNoBUog5M3epb?=
 =?iso-8859-1?Q?tfLlikFLhcFsSaAlA8FYIZ7ClEb6cdE3lyki5UzJyFqirzsJyoC8gw777n?=
 =?iso-8859-1?Q?TVZvDWsMRZd/E5YculdBrfE7z2eNqPpL1kQcDaIRvWVCNNh+cN0dZsnxPT?=
 =?iso-8859-1?Q?C2+f7sI7YYTVN/dbbV9NhJR91rYt1YVKb4C2Ot/o/8pvZLY9FL71fO1Hq+?=
 =?iso-8859-1?Q?jyoGo5Y8MhA1EDen8K1lchyEo/BW/nYLTsyMALFJyKkHAKDgBX2eQeoR1N?=
 =?iso-8859-1?Q?kjskrBgllQkp5m0F775cLfrHLc7EjKq6EacSJDjPCVdmb8E+V+/W7/ntst?=
 =?iso-8859-1?Q?EMQBmwi0r/FSkGyYX6aRokqyO80yZYHB7TzZP5ugs9YiNl0uLzbd1pL4ud?=
 =?iso-8859-1?Q?tsn/t/oC+KoGDKjwdb34iY0/7iGF4b/hkfzy+j7j77o2FcWyjXC+viSzGn?=
 =?iso-8859-1?Q?93LaNJ8KbU2TyyWnPFLccd37u6j0rSqL7otrVJdwxaE6UdTmZY4MsP29Fi?=
 =?iso-8859-1?Q?KztY6QTuqBOV67tnkkFyNHJ/SEgt3EGS164b22eBX5qDrYc9MkkzEZxYQt?=
 =?iso-8859-1?Q?MTZTpNjLG4qIQKweVCTEkP3SXXxb+2U3LjGW/viD/q98YdiOih4g+uro7h?=
 =?iso-8859-1?Q?2VQDgWFwcpa+A5u91Vh9Fm/+N3+mIxGVyC0JWck/M/tzTxFlLWbSqhnQzG?=
 =?iso-8859-1?Q?N3kUFkWE/j554so40rITES40bXfJtZWxxPlFk8etGIvyrrx+KOSGkUTBFs?=
 =?iso-8859-1?Q?NZ8ojwsGzCQyj8cumz4S/AWxEsbDtcw4MK6nktaapnS+19hzhl6ZCh3cJt?=
 =?iso-8859-1?Q?CwlIz61FWev5QkCbYCeYq+YHdqFGMDR6/AtWYIDKUIqcl4HUJu7Iy5Q6xP?=
 =?iso-8859-1?Q?/N4rNpkYJoVpQeVQNIWPkZd7JsnbupyCopGhUkCTewGdo6tKPGBOjughb5?=
 =?iso-8859-1?Q?W2MzO1PPOdlpeyTJMKj8Vx+ZyAirBunmv4qiLJzb/lSIRq0w8YvPyXNU2u?=
 =?iso-8859-1?Q?YBE3vm+UpeIjaD24CxAKbuisTWuFyTR0MIvv6Z7ZhmZGBacUc1DD5MWDZ4?=
 =?iso-8859-1?Q?iEmMwgElcGqRpphz/0vE7MHmipReHGVHFvcIy01zp9yYG47HXHxMsuZEV6?=
 =?iso-8859-1?Q?KsorYw7wGJA4Wtnicu6/9qGrrEnCfKyPGXydJXpoLaDtKq0PnafDgOsi/N?=
 =?iso-8859-1?Q?Wrc6QI8W/ITSnm/GkEMIaNp3zqEzdqJFa4UKpFNXZkK66cimIR5vf2zCXU?=
 =?iso-8859-1?Q?/Nxgd0XCHxoMqYT3SdWc+BFhJW5BjibfedTxekhRWhMxaZr5pFSJTlppxm?=
 =?iso-8859-1?Q?lIVumz+VQH+3wCit70TBwMNIS/iX0RZtJvkeawrxCBL7EKcMdlVrGd/Qux?=
 =?iso-8859-1?Q?GzlnJJWsmT69Xhbn0ke1z5MBW3XLDwbC5VCeOrrEpL50XHmaGHETi0Vw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6083cf51-7262-4dc3-abc7-08de3224dab6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 04:31:40.4889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUxF/aWTGBGK80/vnHzI5L21CyeGvugeQVaKeB2nPtS9eflOhH8oZJp5u/LXYLvAqJaMTJiXzbVKYIaDSiFz7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8317
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-i915-display-Add-identifiers-for-driver-specific-blocks/20251201-150245
head:   a475844eaf5f5246fea92d8289f2c8555f2c0c7e
commit: a475844eaf5f5246fea92d8289f2c8555f2c0c7e drm/i915/color: Enable Plane Color Pipelines
date:   2 days ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251203/202512030005.UiqaQB5p-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512030005.UiqaQB5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512030005.UiqaQB5p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/skl_universal_plane.c:19:
   drivers/gpu/drm/i915/display/intel_display_types.h:1993:28: error: field 'base' has incomplete type
    1993 |         struct drm_colorop base;
         |                            ^~~~
   drivers/gpu/drm/i915/display/skl_universal_plane.c: In function 'glk_plane_color_ctl':
>> drivers/gpu/drm/i915/display/skl_universal_plane.c:1288:21: error: implicit declaration of function 'drm_color_lut32_size'; did you mean 'drm_color_lut_size'? [-Wimplicit-function-declaration]
    1288 |                 if (drm_color_lut32_size(plane_state->hw.gamma_lut) != 32)
         |                     ^~~~~~~~~~~~~~~~~~~~
         |                     drm_color_lut_size


vim +1288 drivers/gpu/drm/i915/display/skl_universal_plane.c

46d12f911821f7 Dave Airlie   2021-02-05  1245  
01e1575609f100 Ville Syrjälä 2025-07-17  1246  static u32 glk_plane_color_ctl(const struct intel_plane_state *plane_state)
46d12f911821f7 Dave Airlie   2021-02-05  1247  {
a2ed9f84524795 Ville Syrjälä 2025-02-06  1248  	struct intel_display *display = to_intel_display(plane_state);
46d12f911821f7 Dave Airlie   2021-02-05  1249  	const struct drm_framebuffer *fb = plane_state->hw.fb;
46d12f911821f7 Dave Airlie   2021-02-05  1250  	struct intel_plane *plane = to_intel_plane(plane_state->uapi.plane);
46d12f911821f7 Dave Airlie   2021-02-05  1251  	u32 plane_color_ctl = 0;
46d12f911821f7 Dave Airlie   2021-02-05  1252  
46d12f911821f7 Dave Airlie   2021-02-05  1253  	plane_color_ctl |= PLANE_COLOR_PLANE_GAMMA_DISABLE;
46d12f911821f7 Dave Airlie   2021-02-05  1254  	plane_color_ctl |= glk_plane_color_ctl_alpha(plane_state);
46d12f911821f7 Dave Airlie   2021-02-05  1255  
a2ed9f84524795 Ville Syrjälä 2025-02-06  1256  	if (fb->format->is_yuv && !icl_is_hdr_plane(display, plane->id)) {
46d12f911821f7 Dave Airlie   2021-02-05  1257  		switch (plane_state->hw.color_encoding) {
46d12f911821f7 Dave Airlie   2021-02-05  1258  		case DRM_COLOR_YCBCR_BT709:
46d12f911821f7 Dave Airlie   2021-02-05  1259  			plane_color_ctl |= PLANE_COLOR_CSC_MODE_YUV709_TO_RGB709;
46d12f911821f7 Dave Airlie   2021-02-05  1260  			break;
46d12f911821f7 Dave Airlie   2021-02-05  1261  		case DRM_COLOR_YCBCR_BT2020:
46d12f911821f7 Dave Airlie   2021-02-05  1262  			plane_color_ctl |=
46d12f911821f7 Dave Airlie   2021-02-05  1263  				PLANE_COLOR_CSC_MODE_YUV2020_TO_RGB2020;
46d12f911821f7 Dave Airlie   2021-02-05  1264  			break;
46d12f911821f7 Dave Airlie   2021-02-05  1265  		default:
46d12f911821f7 Dave Airlie   2021-02-05  1266  			plane_color_ctl |=
46d12f911821f7 Dave Airlie   2021-02-05  1267  				PLANE_COLOR_CSC_MODE_YUV601_TO_RGB601;
46d12f911821f7 Dave Airlie   2021-02-05  1268  		}
46d12f911821f7 Dave Airlie   2021-02-05  1269  		if (plane_state->hw.color_range == DRM_COLOR_YCBCR_FULL_RANGE)
46d12f911821f7 Dave Airlie   2021-02-05  1270  			plane_color_ctl |= PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
46d12f911821f7 Dave Airlie   2021-02-05  1271  	} else if (fb->format->is_yuv) {
46d12f911821f7 Dave Airlie   2021-02-05  1272  		plane_color_ctl |= PLANE_COLOR_INPUT_CSC_ENABLE;
46d12f911821f7 Dave Airlie   2021-02-05  1273  		if (plane_state->hw.color_range == DRM_COLOR_YCBCR_FULL_RANGE)
46d12f911821f7 Dave Airlie   2021-02-05  1274  			plane_color_ctl |= PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
46d12f911821f7 Dave Airlie   2021-02-05  1275  	}
46d12f911821f7 Dave Airlie   2021-02-05  1276  
841f262e74a7c2 Ville Syrjälä 2021-10-07  1277  	if (plane_state->force_black)
841f262e74a7c2 Ville Syrjälä 2021-10-07  1278  		plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
841f262e74a7c2 Ville Syrjälä 2021-10-07  1279  
a475844eaf5f52 Uma Shankar   2025-12-01  1280  	if (plane_state->hw.degamma_lut)
a475844eaf5f52 Uma Shankar   2025-12-01  1281  		plane_color_ctl |= PLANE_COLOR_PRE_CSC_GAMMA_ENABLE;
a475844eaf5f52 Uma Shankar   2025-12-01  1282  
a475844eaf5f52 Uma Shankar   2025-12-01  1283  	if (plane_state->hw.ctm)
a475844eaf5f52 Uma Shankar   2025-12-01  1284  		plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
a475844eaf5f52 Uma Shankar   2025-12-01  1285  
a475844eaf5f52 Uma Shankar   2025-12-01  1286  	if (plane_state->hw.gamma_lut) {
a475844eaf5f52 Uma Shankar   2025-12-01  1287  		plane_color_ctl &= ~PLANE_COLOR_PLANE_GAMMA_DISABLE;
a475844eaf5f52 Uma Shankar   2025-12-01 @1288  		if (drm_color_lut32_size(plane_state->hw.gamma_lut) != 32)
a475844eaf5f52 Uma Shankar   2025-12-01  1289  			plane_color_ctl |= PLANE_COLOR_POST_CSC_GAMMA_MULTSEG_ENABLE;
a475844eaf5f52 Uma Shankar   2025-12-01  1290  	}
a475844eaf5f52 Uma Shankar   2025-12-01  1291  
46d12f911821f7 Dave Airlie   2021-02-05  1292  	return plane_color_ctl;
46d12f911821f7 Dave Airlie   2021-02-05  1293  }
46d12f911821f7 Dave Airlie   2021-02-05  1294  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

