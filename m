Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA18260563
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 14:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757515305; cv=fail; b=oHenvMo/UDrIpeICk8CE31Onw7AVL8WHZz/PwLj7st0MuDCRvPaeO+BarfvzP3mc4cU6Xl8CKPGcORD2PbJo3ULYNmsUVSzDCj8KIX8VxJb2NmxrGys3SPcxX8P5Da5F/SbnJxknY8hGJ9DuPnYzSECEAbI1+ijbmiQvpsY3X7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757515305; c=relaxed/simple;
	bh=NrC+Ixr/bZpTho8Zbnnqb6WDTjD4c7qBNqYMfoCZ6F4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o2/Ct/aoGj9q8MEphh8E0qPkMzJ1IwVrQxTCgk3HiPC1NwVTUFe4nnuQG1kvqbpQuzxaqHJa8Z6FM030TEnHxJJ7ZGaIpoufZzjY2oyT3WvADJRjNBYTsd+usUjzqSJkMUipmPr1t1d9DNr0zhlU2SseskHeqZc/J0t2+Yw9GU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfW0fj6p; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfW0fj6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757515304; x=1789051304;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=NrC+Ixr/bZpTho8Zbnnqb6WDTjD4c7qBNqYMfoCZ6F4=;
  b=EfW0fj6pl2uPyGB/bhnyABCFe0tjzlsF4i48Ht+92lDFjeEC6MXZZ+I5
   MuvK2fUqGqBnrsaT4r8GaQBiLRF04WPh+psE6wjIUrbSkyjAa2k4HLhCQ
   ZndV5odPgQmSCcSB0+sRsFzbR35VYZyTGgRZ3+1dhg/vOb/8iJa9rFV8H
   +IqULxHIzRR9+9ARnyWI5x7OviaTXcEnZTvoEOadXvaeeBRT5exY5Sk6G
   3XilVoxChsrZijmlK1o06qb/gdvP1ERfInI8imfVZdvZEfr52GuNoMVYc
   lBSyMMEltZcGSksYsyCumaJ9bRNlCH7ekgi5EbpywXdLhFAOljtdpI367
   g==;
X-CSE-ConnectionGUID: ospsqqb7Rz+PYWFhl/ICGg==
X-CSE-MsgGUID: Yl+n9ojgQ+iE7z36Mw4TqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="71247914"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="71247914"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 07:41:43 -0700
X-CSE-ConnectionGUID: tbBHgNCtQyulgZaghb2kig==
X-CSE-MsgGUID: SehueONFS9eT5wP7Myz39A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="177742466"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 07:41:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 07:41:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 07:41:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.46)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 07:41:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJu67chQ4nCHukBbpoBgejlpf5r6TIcgRIzLyLjxM/YxUh+MNWsRR7wWfV5/WXZAb07pnd+ow2whpFTAfYlowOQN0AsW/O5SGaSdyCdU5NuDnzzhKan5oFI3dXTtvFcRCotSFYUYauVsTPSVpCjifCx7U+iKMG+lkrdVDUSkpEp9yD/qOeXdEvWvuCuZeeY81BYXdUiyEz5IcoVq33pyYAHyRPs+btNPwRI+xTSsjaGolxsA6j34jIJlgHBejsMd9WXEl9r0FnXmwSIRMF0jDhXtHnWUmGmnKG308UWcZCgur41EWuqG7lbpRrjaGmnij28FBA6/lan6ckZZXxcMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdufPTc3m7Fd7Y098RLMuUwX5DvvE4qoTAZlbg/4iiU=;
 b=y+7pGh8QdP55y7bcaHP3qWK8tdDPiUF0RvcfqwdW0pnY1lngxRqdesRtYk4/ShgFUnWAwJnbqOh/1PLW+SIoWcuxus9Ww16w/laY3Zebo23U74AFyEL1dE1q5KZgbGGyXM3trZ/WSgaEY50DpoWjSrVxXv34HLB9bEeWHMgOQyuVqzWuMRZ5vZ9YPUn5MiKSDNpdEVZoUU68XvDj8pqqwwlPwoulPOqWbsfM5tue5UbEyV5FcbtsLpYbVT6t1h1xSQnu2YwTbQ/hg7ubBrZxnMXPJFeUzjQTpA9qc44Un3j4oSeBMuHyzh4bIgste8uCwx2Rfryx2IHDw+j3ptM50Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by CO1PR11MB5188.namprd11.prod.outlook.com (2603:10b6:303:95::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:41:39 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::cfad:add4:daad:fb9b]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::cfad:add4:daad:fb9b%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 14:41:39 +0000
Date: Wed, 10 Sep 2025 22:41:29 +0800
From: Chao Gao <chao.gao@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Yang Weijiang <weijiang.yang@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	Sean Christopherson <seanjc@google.com>, <linux-doc@vger.kernel.org>
Subject: Re: [sean-jc:q/cet 44/55] htmldocs:
 Documentation/virt/kvm/api.rst:2917: WARNING: Block quote ends without a
 blank line; unexpected unindent. [docutils]
Message-ID: <aMGOGVEvQz00Bm4J@intel.com>
References: <202509101552.nq7TgVwt-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202509101552.nq7TgVwt-lkp@intel.com>
X-ClientProxiedBy: SG2PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:4:91::19) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|CO1PR11MB5188:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ad33764-088d-4d43-2617-08ddf078266a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z22bOy2+K3mE6mfnMJoKUdFgwiSxIA0JGIgTE0Kk2daZumw5zdKEaCmyMeyS?=
 =?us-ascii?Q?brQ2kwg2nNtF2mGJPCfQtw00DErKBOK4m0wKZvfU9bBhwoxUg/qj9wFT5fQE?=
 =?us-ascii?Q?jw4LljbBtCzQLq4UEQr2Ou+4Nl540yKnAsn4LvfWm5bvHdPseADNdVWfXXbL?=
 =?us-ascii?Q?l1JJq5lkumgYFc1MvpHm7LOABxQ8bJlCEpNuh4eXdh17vagNT0luXgXfQSc4?=
 =?us-ascii?Q?GGtvtackYRQgVbEZVPVIP1RldMchRI9FMcofG3dDveJhASrtBl3KUnM69BNT?=
 =?us-ascii?Q?f9fyWrd41bCIdwSuqmyOW+iMNZFf5W98MR+B3X2T1ghsXee17Lv4jb5Elrot?=
 =?us-ascii?Q?WtzCQCLRuiDZJSC9l7vldwXSxSMcIkM7GuVva0KIrmKToUseqlSMEaxeF+bG?=
 =?us-ascii?Q?1zOM6spgUxvM5BFwrnc56KLuQwXOIw4z6rRl9YJ7z/T0ZmLj02wqtoWDEvVA?=
 =?us-ascii?Q?sKbS8R+wuCJKG4BPEKIjXyZh9YZe/RxuKd9Og27xiYkLJ4QP3VNmlzx26/RZ?=
 =?us-ascii?Q?gHo0cVV3pEJGf7zTT5IjxX+tMxW5gheRr9N64xxju/Q73RbLQslSjQaaqptL?=
 =?us-ascii?Q?dL3Evb+Xwl7UZ4oILoBv4YILOMPXYggZYSzamSXMVdPvifTP8kHxrOQWk0v+?=
 =?us-ascii?Q?CTtaw+9qulfCK7ptTa9CyUpq70k3tVIP8s5wJ+qh0Twa7C6axWZQR3JqVJjc?=
 =?us-ascii?Q?ouLx2ACDR6/kq2qNQPEcFZfTkIJJCwtkcvRmj8IcmOhvkqNrJDCD1C2qtoUF?=
 =?us-ascii?Q?S+HZwKirrA1E1womnk4Zx02JV4OafRqH/k1KQQ7wVh19Pm8Pc1Abmw8gPInA?=
 =?us-ascii?Q?aOUr5KT96W/AaTZ7rCCc2FusrFVS+EaCml2MqKZsuhrUe336DDGiau9sFfbG?=
 =?us-ascii?Q?o+nUXKeV9TUvGx1/zR/1GHT0CcDBa/HniQmuvHNScwDWHTsiC70LOOYko44E?=
 =?us-ascii?Q?veIoHS5F9EtBZ9DkbRJXYny+mrUtVxRhXdtlxbp3oX+JiQI9ZrZw3qDg/kJ6?=
 =?us-ascii?Q?Ect3WKygdI1z84NmgXVR5cNv7xKHik28gviXEvWVPlxJFXkfVr+Sdu4i2bd1?=
 =?us-ascii?Q?HCT77xKI0o1b17sVTeWN+eI7Dn3SGkMsSsmfO3ftfNzUj56psLgIT2dplF7r?=
 =?us-ascii?Q?R7E2PlEXUA8PpEqqrVijh0zn0Ci6EXEMwx1egClppCZAf1tVQYCQtWTdfG3T?=
 =?us-ascii?Q?JP7cg9kDjQoVu9TXgA84+wP/7N2WLgNjKyDlf1cp8SARbUChEf6yZP/O/xns?=
 =?us-ascii?Q?98bJGv3xLqVr6UAlibaB1iBhMrZpOPQDE1GtzKxtR4xZA4Y5QPb7vVO3apmq?=
 =?us-ascii?Q?b5I8WwalNwCxfq+oSp6/5vbZXI90j58gdCSSozrsOMT/x9aau9BsiYlFTWY8?=
 =?us-ascii?Q?y1VCfjR0dpY4OhqgheW/+dHlihLU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZP27tBfGEuXPH7q2pa/ed3rUiQACdWbRFroL3a6Ho24fzrd3r7r3ow6nhvGU?=
 =?us-ascii?Q?4E6uiGCepBHnnHvwsHQmlnB3WJedmqpvWgK8ZCVJiJJymE41WoSQC7ZBOp6p?=
 =?us-ascii?Q?7u4Id7NY3WiAPVuaaiyMQkwm7WnGzii/jWDly3EDAvDTLz+R82m8qww9YAhn?=
 =?us-ascii?Q?krXHAx6mfBbHyU9FwBrBdMpsmRBr84qUvclcW2BSncrKuY9bOaBrSI5Debjf?=
 =?us-ascii?Q?jxX4vEWMJsqOzp4WarG1cTegscyXvaweom5FAWmTprC2lOdk38FntorgB7TL?=
 =?us-ascii?Q?VZ6qa657fW9Z1/3ACsyd0FGdojin/Y/xLZRScymx17diE+a+Dog6jUohz38e?=
 =?us-ascii?Q?XtlBMv/yOgzGPv53L2mrXN6wRWsi7eip7ToSdLv2GWn4cy/7UFCUGk3t1K/N?=
 =?us-ascii?Q?7apdQWEFs/8QiHlIwnw7LQfAPjekBHgI7W/dXLqNzW4zT2qlHzPTFWb3vgRT?=
 =?us-ascii?Q?tO1hLVEgJzQRuOHW3Ij1a+ZGXFylb2r+Ulrr9Cv/AC5jTdvhgaaT29XcVJCU?=
 =?us-ascii?Q?Z5pM+iZ6KuB6D6Z8j7JhxjLH+I1HnW8wwIq5UGLA1HCu9rTBdIGFtk0Gllv6?=
 =?us-ascii?Q?xskwiVyH+fWLcBMlx+clXnQ1sEg6rK6Sz+PSHWa1JmH3D2aqpjzfatRm5UoV?=
 =?us-ascii?Q?7VFoFQJ9TO87sUVEHphjf6SjA4BGHk2d8VaV7YBrCf8WErJq1xV4DmBxSPRX?=
 =?us-ascii?Q?NUrIgJQ++zHEfphJCEglGggGEMSVxPsO7JIelPnxl42SW3Qv+g0zaUcerggb?=
 =?us-ascii?Q?phs+HZjvGn89OJ0RU1mSeMmqm03NrjQoJg09NAVVqAHKnLUsOejhQIH1og+L?=
 =?us-ascii?Q?OW1t8Pl4ct2rCjjkT8SRWzkgmEiGHFRFYnchGLzuVP/0bm62ToBALq2SKyIU?=
 =?us-ascii?Q?NyzmHfn7GHPJXvHEPKvlXRAhbxgxR6BIOi7yqMZfsWUE4z5YT4bhTzhPvUBs?=
 =?us-ascii?Q?IGAurfWAgMyLmhO3Nv1v7RjskcIXMb5cP/bZBZDbodz2wc5W8oAUdOxAyuSU?=
 =?us-ascii?Q?UwdZPLiKtTnutEEvXMK/d/FUKsTvIvdzjgjpTPNGgyNk+qXTNbQSH21r0Kv3?=
 =?us-ascii?Q?HT4/+MmklqhG7oBtN5QOMlPeKSRk05/WyGk1eRlKpBHVgyAwxm4Q0YpzzNbx?=
 =?us-ascii?Q?7sgnbc4qBhjnynJvmhyi781gbpuQs0nMKQeTA3NEt9a5ze8xjKM+a3Fe9V3D?=
 =?us-ascii?Q?Tpvgv9DLnSLF08+rarNVAgmBuz71yRPgKCa1A3dovEuW5qkwQE/6S8VO+c89?=
 =?us-ascii?Q?EWaH6/Hz3N6t8JITu4FjDeBeEVpi3QoC0/vDEo6HWYIlgI6jLQVa7UNd34sI?=
 =?us-ascii?Q?z809343S5Ze8qwIgHNiBOOCje4tWkDqbxpHThilrniL8dgYol02xewY8EICu?=
 =?us-ascii?Q?1sWZuaMgJYN27KOfZHSH4KWWWdSs5rU3m1ruuJVzGrBta+xvOGiaR8rEQ4Mh?=
 =?us-ascii?Q?33yfzeU+ev4sO6uuZDG+kDxA6yoB2xQgqquecFbLVDesDUUK8sItTMN+yaG/?=
 =?us-ascii?Q?GY3rfrtxsALw9YoBGrSZXMXTaXuwLTm6Y5tvDmJNDjTKHV1BbSCIpwEXXM3K?=
 =?us-ascii?Q?VemKuH3b6u4F/5WNdaXBOqkQPGmCzr2f0jDb6pr1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad33764-088d-4d43-2617-08ddf078266a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:41:38.9355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzT34JJMWbnRysEt0t7MSejMyiKmoWXipdpvS8jUMmYLw7nGoeJ3UI0vjhCSL6H/EgPGbggGQSG6Si/8w9yfjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5188
X-OriginatorOrg: intel.com

On Wed, Sep 10, 2025 at 03:45:08PM +0200, kernel test robot wrote:
>tree:   https://github.com/sean-jc/linux q/cet
>head:   4a74767a033d98cd3e37a25c072d200d2d5545e2
>commit: 3ee447c42c42b6df04a5c8a0b9694bd0a5935078 [44/55] KVM: x86: Enable guest SSP read/write interface with new uAPIs
>reproduce: (https://download.01.org/0day-ci/archive/20250910/202509101552.nq7TgVwt-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202509101552.nq7TgVwt-lkp@intel.com/
>
>All warnings (new ones prefixed by >>):
>
>   ERROR: Cannot find file ./include/linux/mutex.h
>   WARNING: No kernel-doc for file ./include/linux/mutex.h
>   ERROR: Cannot find file ./include/linux/fwctl.h
>   WARNING: No kernel-doc for file ./include/linux/fwctl.h
>   Documentation/virt/kvm/api.rst:2916: ERROR: Unexpected indentation. [docutils]
>>> Documentation/virt/kvm/api.rst:2917: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>
>
>vim +2917 Documentation/virt/kvm/api.rst
>
>  2908	
>  2909	  0x9030 0000 0002 <reg:16>
>  2910	
>  2911	x86 MSR registers have the following id bit patterns::
>  2912	  0x2030 0002 <msr number:32>
>  2913	
>  2914	Following are the KVM-defined registers for x86:
>  2915	======================= ========= =============================================
>  2916	    Encoding            Register  Description
>> 2917	======================= ========= =============================================
>  2918	  0x2030 0003 0000 0000 SSP       Shadow Stack Pointer
>  2919	======================= ========= =============================================
>  2920	

A newline is needed before the table to suppress such an error:

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 2b999408a768..dfb7a23020d1 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -2912,6 +2912,7 @@ x86 MSR registers have the following id bit patterns::
   0x2030 0002 <msr number:32>
 
 Following are the KVM-defined registers for x86:
+
 ======================= ========= =============================================
     Encoding            Register  Description
 ======================= ========= =============================================

