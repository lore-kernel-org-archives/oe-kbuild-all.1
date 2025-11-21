Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ED19476
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 00:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763683708; cv=fail; b=E0WOS0RNrfzNx21QMWOSAf5/JbWYKCHWM7dChwHKDQ6uYg7Fl56YLxcR0LlH69scARo0p+DrRQmb44FomH2ybPXuuAV5nRLVrG9cnVYcV2rGLuNEJqmmEw5lhPpKoJOga1HC+QFKGFHxDHyVhuVjVwN0w9VH8nqFzSSB/adVzz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763683708; c=relaxed/simple;
	bh=qYERXYZSRV8reGjSLERNQvGZLl/thqRG7bl6R3/Sj8w=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=DznsHHLqnUpZs0Dc56V7N2FAHUI0n88+GrqinQkVmBKi9/yBDtRtx3NyR4tRrLrbRFVqhVUDAJWtBpOmWGi2JI7xSE4riK4tUUXKPvrUly8Y1thTVoqB9B2osy2ZuMC84LpnZLL4nrM5fRnlZ/1JBI5LiKA4by+rog0tWyvGvOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKTncyqE; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKTncyqE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763683707; x=1795219707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qYERXYZSRV8reGjSLERNQvGZLl/thqRG7bl6R3/Sj8w=;
  b=TKTncyqEqaz2cLCBcmHoWO+gs9nBZ63/LBKWfdiGYSWjcFDYoaI2KxaN
   UoEEew4fiEIF59k7qfyr/GaZSCJih3u7zs/9JiIjP4kL8InPNWzo6+Qld
   A0Lf4egyGcFoLV6dC9mH78qkBm5bR90Msp9d9KS0WCWLFpEsZi4GUIj/w
   0znSbY7EIdgnOBZBoR902lZkzO3KKNbCELaI5ufOgZkfy3RkCT/1lheep
   4Y9oYD0XdjUq1vxdZioH0pAdhVb3uKot54xkBt2bd293reqtBTUASZrrH
   FsnjWYGax0NJaG/EeSxmNlXBFTDU7dXaGbYkIyuAK2GFDXqmk2QWGRGCK
   g==;
X-CSE-ConnectionGUID: inRLHW6CSzWNgKPbSAPjzA==
X-CSE-MsgGUID: 64rnLvdQQhq3mhOzA9AILA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65933510"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="65933510"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:08:27 -0800
X-CSE-ConnectionGUID: JqqEgj1XTWOvBo3qGE7S8g==
X-CSE-MsgGUID: 1aBZy7pyTYKkXPfJ3y3e8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="228819703"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:08:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 16:08:26 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 16:08:26 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 16:08:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTn7lLaP20O/jhtHTIJnKXXg3kceMtPwA/Y/SXKC923LomJ4fgCegsD0E7HrPOzeAJye7azRUDvV2l/4w3ISdT7CinIUiQ7JNNABv4RQ33hSXs1OG6Siyvy+9XO9H+EynQtwlew+G2q+6G0N8zJAnvqUV38x7UM4jejWdXvtQo7GeOFtRT06QpajJAfroZuoIhx8OjhSm7BHudJxxaxL1WsIWZewMuksX9TXWC1HYPw4XGkc0B58UNrBxs2TUX5HvT8IpESQ92KM5CWAk3Egt2im2DLz04aikICeaUT6Yk88agNgAZW3NCoYSL+6mimEHSSLrpyXVA7vJz0E9rxniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjgB33v4NB0R8EOYe1XLyV2i2mYXU2Qsz1Sj5Q57HLM=;
 b=PsNFP49nBgBsLIu4xv9h48BCA6CrMIh2EvRGrIKuAUELAJZ8X5TILYIKXD5tPjaznOcc8TGMrGWDLiyGYqKZ+qdMxgU5FU/B6/iDS+kpOAsyU7mmMVpnJLcHvhVRbEBQPPFmrVlYF2R3+9gTq1yG/PHdz5zWGmTvON9n1RXfCGXwed2xMXBxBntpp/YCLti0aTPHM/D+kmLT/hnxXbBh7FaoGYUS9UfNuNWHxZ1krHi0dKqAWR30qPWneAC2EQ0B1/X9FfJSP+cX1LsCybwGTlWlCCqXeO+jQFaIBGVs+XCiEPeL8V2PgRQXgpvW2c29SWRYCzIU98hyCxHfbT9/rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by DM3PPF4C690C788.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 00:08:25 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Fri, 21 Nov 2025
 00:08:24 +0000
Date: Fri, 21 Nov 2025 08:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [brauner-github:work.ovl.cred.guard.prepare 40/53] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <aR+tcfD/5EFhpWH3@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|DM3PPF4C690C788:EE_
X-MS-Office365-Filtering-Correlation-Id: 856b0e84-e0da-4484-f19a-08de289216ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JX5aBvMEWKk2yAC3m/ot7K7mD6TXgh5GerqnpFvwPsWA7FE+T0xCmIpJRTYv?=
 =?us-ascii?Q?ZuqKPwwkNjebDdOJVr2ysBDfyng6LHVShUfHeyYqZo6+heSVO9/yW1D889AH?=
 =?us-ascii?Q?7/F0PqAQZCyuGq0MqxDy4tWw7VmS+xJMtL5Qbqi4OrQflom3WgrF4GCdQqB4?=
 =?us-ascii?Q?zCB1M5CGMjEpO2Xultp1hwLPaqY8i/okZ+Lgq+2F3CXYU/61+/bOvhd2UzGx?=
 =?us-ascii?Q?wNjKbCy5bHoq/OGCpF5P7qEXsQSGNN2xoiUy0min6u6PSWxyVxE4yeJZ5w8Y?=
 =?us-ascii?Q?dPGJJyLjoN74H//+e1sWa0bLHNXGt4yjVRoiX3Uu002DrKiUo3XtIo6Qk1Ep?=
 =?us-ascii?Q?Utd6rsmc6zHwqo4uS+cINitcl2Ou3LbbRWUpomD7e3GacO+3s1zGr/D/m2hG?=
 =?us-ascii?Q?c/cNtln81B43tZda/hlvUpjhikzSUwyAQ3NZpSe5at/GozR91G80veks5pa6?=
 =?us-ascii?Q?akjXMS2GKfvrtshRTKEqgULCXbTT10Txk8BoeqQzx7dtTz61rN/XrJOu52Vp?=
 =?us-ascii?Q?EOy8vgCuxISv2ljV2FMANeNBsC8Nq1bIkPB6MuXPC6TDcMr6yavUBhRR1MFQ?=
 =?us-ascii?Q?2mB9AWyQAvEl+KfJpPsjyxjeoo/wtH+P5pMFubbg3QNaT6QO2lu2E/I6cd/K?=
 =?us-ascii?Q?7d35PZehiH1A9+TABvoWsTBSZsp6jZrKYg24IxO6LfKx7fxIniY7bo6jO5D3?=
 =?us-ascii?Q?24MpMVshIUIM8T/wc6iE6hYtKAzjWzsWD9f5qqzASu9Wi7YBedSIfegK4hSO?=
 =?us-ascii?Q?dx3gHVQx9BLA7JNFUKGVIKbfGNZx5q8uCdxGo2QjXkwvhpGYFoBPcbEYpWVo?=
 =?us-ascii?Q?qyxI7JQgnGesgNn08cx0ACdh2Oc8M+i+qGDKXOreMe0/64vq0JcM7Z8VhNcL?=
 =?us-ascii?Q?on1mtuBQZCxCQo51GStjo26CW1ofSxgJK/mF4vyaLQM9RiOkXnNjnI3yjQOB?=
 =?us-ascii?Q?t19Uok2lpgT337tdidnWAFsHyyZDQbEc5X1pnkZ1g2Ep55aM+U2RssRinp4+?=
 =?us-ascii?Q?VsMo5CkXWx+t/Z+5m/VQtKrBCxzM+RBEXzQVbbRmZVS47h3NiTwQTK6CgGn6?=
 =?us-ascii?Q?cNJttkHLEiCm23+4YM1Q0bsy+gg58FEnIo381Zi3FP7JRvpQZEGNhxTEzonY?=
 =?us-ascii?Q?xGlCqo8rFu1hgfhxA2W1nvVVSf7KU3PM65dDTvZ8+AQ9m/10vV/c4iV66eQA?=
 =?us-ascii?Q?c30FfMRqwoqaFRChCxhaZP5uqbMI5imRlYhmlNgVk4u+3f4k9OuL4bgRT8MF?=
 =?us-ascii?Q?bRmkmytfgYivIvXIoqIyTj911QfhuhNgZLORUVA/FK+YgMnBDguyBHhz7NtD?=
 =?us-ascii?Q?SpId2/hWf7y/+5/JCNcMP8kASBzWSCg2Ej/RIbJko4H0/3v78J2evWx6JR4g?=
 =?us-ascii?Q?Ray0Xwu01v2eT1jEPIgGe051e8yG788fG3Ccrao0F/tpZ3Wz4NAsXhZCd2PK?=
 =?us-ascii?Q?w8FpUU8fZ0Rgf54lCx43IdgvftI+8hvj79lzrTTvCVnzjuab+SSBJg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uW/jPfTI9qgztpSmI2TPSuOq286VKkI4L6Pyj0nUS6OlrLiOhbBEC8B4kcQz?=
 =?us-ascii?Q?tzeSps/V9W53RqJcLK2qnqULR0W//Xb0OJb/qyNnPNwOcNASgxBeFQkavKDP?=
 =?us-ascii?Q?7Pz7SPl7Rka5ugdiz3QI5y4C11Hu5xS1qnIIDtOc9FiuEx9IWtA7Ko+KXjM8?=
 =?us-ascii?Q?wfJjCPtiBK/L+C/NT7HxqQb/93rr/9m2cZNBAuO9u+xFmqUXABiP8UafWE5b?=
 =?us-ascii?Q?phRHU45E6qIDl0bEK/0ZciMBqiMH+ytRHgRNp8HUQpJvZujbeO9AU+S8fClh?=
 =?us-ascii?Q?OJp3f6Vq650b8X416Y/X+g4wj/FfJ0wVK/WAszDtA6J0IiyCtFilhZq76e87?=
 =?us-ascii?Q?KzHQQnoszu9vODlIpeFoODPwEc4fSINwEUvHs6V+iBE/0ZWXkbBJNuDYn54r?=
 =?us-ascii?Q?EJBVWADyW0ZnW4dHrPhRO84p4X4ei+0ubJIDveH9/lrk5NYOl0A1zXAVmdfh?=
 =?us-ascii?Q?Ai+BKHQmGYMf8yf9BdpdOAducTJVZSVVdsHUHuPTDttirwjVgxu6bsCN6Jrc?=
 =?us-ascii?Q?L5Z9HJjv++nYBQLqqgceyIVYvN9/GyH6npOdk0euC5fYXEEvTCmWL1HXdeAR?=
 =?us-ascii?Q?ykK9Gk7hXXiQ7tcsVU+OaTDU7mHjESAz+r2qPtzgoCLHyd4JVw83yC9ibKLN?=
 =?us-ascii?Q?wATcC1t+PtaLGZcezEZVHsfDHcgxb5uHuRWqGRi1MPLWg436Cbt3Xu7Yuvz+?=
 =?us-ascii?Q?/5/yLc1ZbVJhX9MdPjQaLoJ8wo/lzDTOZ80e8tSE/IkBZNXJq8YDJcWlyZCK?=
 =?us-ascii?Q?E8jcTGz2aCj1UjLwm2JL/UgRLxAM8wTx1rQNaHVdetNOhNqUwhO5uejIXoNY?=
 =?us-ascii?Q?fNZarbEOfwM3DLHVPO0Ig3smsS7S+DlPt73sLnSVtZwuxr/CFNZp5esu5K06?=
 =?us-ascii?Q?vVLeWf+dR8CN+aQCkbNPvROdIM7ARGt5gliS5Uaq4Q4INedWp3kvFYRqUVlW?=
 =?us-ascii?Q?Z9Nk9KzqlxFCakE3IpvTynPe0TLGJ2qhr1JqHekaZ3RcLq0mExmxzPlvyIPw?=
 =?us-ascii?Q?H/AT6m5Egtwvc2h6Z4K17GPGQlTUJls9YEizb5mAzmkzyQsvaalc0a4+E7Ac?=
 =?us-ascii?Q?v42uGPLVbUNcFrcgkQ2LePmjvNhg932R2W400IjW7Iy+hYS5iCsHRxPPX6rm?=
 =?us-ascii?Q?WG/m9ktnTw7BMXP0j0bBVVVw2bonvMgBQktd0USes+jJVX22U0eqnR7xKe+p?=
 =?us-ascii?Q?XkB+9I+gHyJ5Y4Ay16Tif9wCStxLgZG4U4SuiBHcKXRLBl+DrmLn92cXfCtQ?=
 =?us-ascii?Q?RPF+5lTzAMqZi8ZN4q5prI04MNhHOJ4r7VEtRqyho73C7yqiGhR4eVwDDuyM?=
 =?us-ascii?Q?WAjbZA+0ZabX0y4Ovvgbga5XS6rRyxoYG8dUggVKtKVHmdq2KHtlq3m0hmnj?=
 =?us-ascii?Q?BLZQhsjsFtAoTahv4Ldq9iYEU2cpuKKod9IgyHdGGScgjZlnasvqAIW4likx?=
 =?us-ascii?Q?6MMddqAgs6TYd995m0JgfgQLc8Hne3yh3TzttslX5Gc7buDfr1KQyCzJqVb8?=
 =?us-ascii?Q?6zAbJoWE0qM+YLCaTBkXgcWgHFirajW3wDIetEQVeRC+0Xxr94osPHCo3e96?=
 =?us-ascii?Q?vFEC/zNDPwRsEOHMeezo/NYpcJiu/hXiVhSgj+iI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 856b0e84-e0da-4484-f19a-08de289216ef
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 00:08:24.9019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KKvwzHxacEoTIMP/BkotBtHuvTnZAnVyEw6FY2hz2TjLJ88ovUBFSzMXxQ9+ALkwrjUyWc212MaLp67/+g9iaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4C690C788
X-OriginatorOrg: intel.com

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard.prepare
head:   64676d6627645d999fb10d936a6af2d7fa2a54d7
commit: 5040a02336335d27f7e8cee0eea213bbdfab8bc3 [40/53] ovl: port ovl_copyfile() to cred guard
reproduce: (https://download.01.org/0day-ci/archive/20251120/202511202336.qTQLAotm-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#48: FILE: fs/overlayfs/file.c:556:
+		switch (op) {
+			case OVL_COPY:
[...]
+			case OVL_CLONE:
[...]
+			case OVL_DEDUPE:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

