Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FA13A6F17
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790498955; cv=fail; b=bfGtGgQcBXKreWwaIPffXYTXawzqIBxLA24yR0CPR7VJxz875jY3vusRYmsC6N2RgnHzujbNFkpSl6ql8adteanWy2gMS6s428BIt38HEKcmPDaPS7Twh7m00FgRTC3ygOjYR2WEmRQAAexPjEgG0VM97moWLvOOe4BAZxPFPf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790498955; c=relaxed/simple;
	bh=wYKT5QO6MYOGW1VQcRz3EKz9AX+Rn1wxEU4nXsJJTRQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=SFotWpCdPjlonquJfZlSW/tzHtM6Z9ZW+Po1SfXOHry72je0DwrSHOS8eMh+EFJEpFMfkx1L4lLlVFe+LrcptxfjL31q9TZIQFIqVfuuwrfLMH6WY64riqxEWeERZ0ysbBJQszC9N7MvJlopOTw1iCWobQpnSGaoNT+R/JUl7dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVgTc5Yp; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVgTc5Yp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790498953; x=1822034953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wYKT5QO6MYOGW1VQcRz3EKz9AX+Rn1wxEU4nXsJJTRQ=;
  b=XVgTc5YphLlMIE0aYtBFa+8X9ouPpTDOl4+fIbXz+Wrsz1mW1YpO0CCh
   4KzN93LOH7u5knpEotkXJYU+8R9lr5j3VyW6HMLuC3hJ62idUkEHclZTi
   Dw9evpHLy3pLmfW/FVaPhkYFTPViFS3Laf1lun5Hsjns08OtYg+mpBWb/
   2qL6o/Gd8iEJcsgstLgg2OwoKtvZA8RmpwCUSnfydhw1DnDS4RjAVhYYg
   GtlMy0oEjaJNSXOTNUsptjjRRTA519DiQXSiDxg+Ntnu6sYuz6SzMg3io
   s3uO3RrM7W6ouFBDSmCsSQREiSKw9Us1EHIUHuCWe5rF3HBk+JhVIBZ8t
   Q==;
X-CSE-ConnectionGUID: JVXLKp2WSRiEregcy7fhkw==
X-CSE-MsgGUID: ULJj5fubR8qbtARkyGaWFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="113010646"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="113010646"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 01:49:12 -0700
X-CSE-ConnectionGUID: sMj1AqfCSTuW7QUU+lHo7Q==
X-CSE-MsgGUID: qNBQ/MKHTECQ9rUcTXZvkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="277953522"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 01:49:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 01:49:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 01:49:12 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 01:49:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uP8xOBYoplVcKVFBzuPwavMTmEbkkjH9uXppW6o+uecRia81dfgSiribY2bZ8JpTXHfUOGK3yKiFNj3roSp2dEvXTyt1vT1C6v/6Q8st28EcNyRRuSfQAX0jhjRZsAioOt/yYC9M/Ag/m9JcDwKBnsKxeTul0mES/ojwn5jiYnKZH0gKSXkYo8A9wvWNIbu8R0qQyV177ASDeNSoenuo+fzQmhWmNakS2jr1Mc5uEFf4NkOmt1CLkjWnpGZ48fA5uImasJ+SLTTJlYh1P71/JwfjfXyymyrIs5FHwdO/l06+wCMtnaZVRNWW3Qbx9Qm8CkosFAwpmqFXNxn9i8996A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4w7+8oKokxxOKBeMi3q/i8agKH1ZPVkQie0ArWwWuM=;
 b=pqTqQSdyVmisHHnia0kkJStkXI2v2Qur6HsE9K4R+Wn8hE8CLdLpFAcOGHVcb6gtA9jegnpOEua09o77nwESO9fTfQ6S1wT1JOrfHlK1QNV1rcADXYlRfuB7EdF7AyEYq4IJe/bTkhXmGrVM1VRTbOG1POpcguDqLI+nlXYhvgOQwnLKx/XZLwuIe8Z3vQFaGYigG8C2HtI3GUfr0Z0ZxT2r13fumVm0eO14S/kcQV/6VRpcideJxKu6jqTMCYBS0VzPQPq7RmINOXvLfvAH8G4awZSFCeqo2ljtiM/hJyvFaO983H7v0OYqrdow43OvUBmPsF3kBwPGZGkF8s7BAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ2PR11MB8472.namprd11.prod.outlook.com (2603:10b6:a03:574::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sun, 27 Sep
 2026 08:49:05 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0451.022; Sun, 27 Sep 2026
 08:49:05 +0000
Date: Sun, 27 Sep 2026 16:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [arnd-playground:randconfig-7.3-next 448/673] fs/exfat/file.c:575:1:
 warning: the frame size of 788 bytes is larger than 768 bytes
Message-ID: <arjYeUf19zkgfzSS@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ2PR11MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9d7681-d986-461b-0aef-08df1c742f6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: V/2FDDdWIMP13hKlV4jHmk7ii9499NOxiKf42SbdjyjOq+NgVfaqVYconHH+USlb4hH5UShdSBjG8/Sy2OCQWrK4XHFUSynglziPilYwm1lHHGohbdX9moaEnxmTwKaDnJCiU5rUI+D1o5V/rYmlWiZtCn50KG6r1kAEcvlEiqUGR7ms3EAIaNVB1wJF9Su2tzgj6dBlaF1VB3MYig0C4PqhC2eIxZhYt5nd1a/XH3gR5i6bNvuau5E+ENFePufjmgDLbPGq6cUSB5Z8WGD87FbOnBe3Z05fFTSWfjyDtxppF49U5qZwbqRE0o1WYnUxYdCtdWJRcAkM1qBJe9gBtVidb7Nut/2IH/5rFJUP734bblMVFLN6mfvDjBQfc+RjEFpxxOYczdcT2p/JciGLieyP83dGxNWkASoSMcKYOhPuSolspnWNK2nzbLgyB2QgSZd6MVaPik5NFx+qE4e8RE+Y/XNYJhrMHHjNG87+s9H/urhe8MOyTjJwJcvQDy+5Qz2mseBGeh0848Kec3BVGSFdySXddMbzmI9kqTDy3NIaqvzFFPyIS3hu+JhAyDZgh4cvYz0MdYcxIExVQmEvgA679xJI/9i8v4XLZoecHQH1Ygjy3k7BPDpgzatuuBf4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lwYYtKt7jwM2NjjKcln6OAfSTSzCTdmblC57j4CJe/nogTWq6mJUbHNmpg12?=
 =?us-ascii?Q?xbVMct84AGFNpdHarBNrJBSdhDiqG5Jnar5MROqap7xMaCRTRMkwopSglDFS?=
 =?us-ascii?Q?onf2ok/cKr/adG52UCvLU+wgsRl7OvGYb/3vV5bJ73cQFHG7Vhh5431uIFMw?=
 =?us-ascii?Q?nRkXUr5CSf+L5mdq5BK8jbGL6FbDstUN+Cf6qk38t8FFsIvFgo9JQ9Tmd5UN?=
 =?us-ascii?Q?aC4AAi4Wszw7ub0CEntA+031JhFbyHhHGeWHL9No6FRoNADBZGepkz1+tqOq?=
 =?us-ascii?Q?J2kBZgUAzoRlQ9vHJNj+iRGwEboXIlunv5dRRTlaKpieWh3FTCr3mDaPLTH5?=
 =?us-ascii?Q?5+sZPnKnytBTmd326cEgmyUrwMhheHU4qCCi0vOXNvtbzjuOFw1e2VDnG2wf?=
 =?us-ascii?Q?GrIlqbLbBQV45+2/vuBGqt1fOMviGn5FXZpBGU+XTI0W/k4Woe6kwXMwZc9J?=
 =?us-ascii?Q?TMvb3ER33g0DJn7gA95wO0asV2/C2pQMye/wGsmJTg5kkulDBmZ/XOUuMGCG?=
 =?us-ascii?Q?ypW/BgOl0FH0P96DMUf/oM22ykP0UurCioxjnOWHxSdrIKcTqeotvGt+2+Q7?=
 =?us-ascii?Q?eTSggh7wMDIKUKl5CMjHztbFCbnLFhW1+ZnzXAHYZfXIS/CP+UK//cfirDEJ?=
 =?us-ascii?Q?HiGBtwSYyDxa9OUp8yUkjZr5j8teTouUANxGRMuvI6+AWW8ZSRcWk0veHkPK?=
 =?us-ascii?Q?ZzmPkpfDQR4xKw+EqAzWMHdhOkn+bYT4kLh+cuWPdlhpNjSomcGRI4mX0MuR?=
 =?us-ascii?Q?K3UiaPA2nDyfjssFcPmwvbiDtzW3e8HgRLtArOBlEJLicDHCS1tua9gvrzqH?=
 =?us-ascii?Q?Ov8v3iLKwtFmhGQ/2//1fHhL3IHv4Ahpi2DjRR4zfMFCKYLndfZ+ElBkZ+UP?=
 =?us-ascii?Q?DqXVj8IBH7BjU4AbqeR3M5fbmeqbs3lqGCuhzASuiA7qdTZJXBOZkOqzp41G?=
 =?us-ascii?Q?ky9Dh/lmcUqhvW3qFqLFatV8ThBbmWA6Z7b5z6H3ZkZ+bnrQbxcUUVfxK9ab?=
 =?us-ascii?Q?TVVibuO0KTB6LTTu8W1yalksoJd8ztddmgsWzW4kqawFb69rv5omRTFo38Cx?=
 =?us-ascii?Q?fW+DNke1OH/hFLyAiQkSMnoUkk9uApf7h9rNATxu/wtg06iJ+W2pLqVFvtwz?=
 =?us-ascii?Q?Stfw+ZruNw43Flg9FT8k62NjJKa+b10OsGveRtEPlThItjAOLK0mOlCTzYw0?=
 =?us-ascii?Q?pPavQUtXBPGQ71Gjt+BlpZc2ugWe2pPcOqJZch7FadGx1pU7PN/zAFi9XVtf?=
 =?us-ascii?Q?RqIjL1IiB0UPWuKsl75CVp3wlN5DCXKti5BY7RhoOPqn6wITVJdrjsGzghYx?=
 =?us-ascii?Q?NnF+YKGMY/lPGOcZiAS0EeENw5irM7tQQEzzehI2JSW6Uamq2ZlBeJ1H08GD?=
 =?us-ascii?Q?gB7EOW7HNdu6fcSaaMOQT7PDBWEb3VReMkt2pHEFqHpJS0jQxdLm/ZG3vCxM?=
 =?us-ascii?Q?bHC8UfCKQd1BE035+Xq47UVSucaDE0BbB13CCCvixUMufKZr05EGqVMC79nQ?=
 =?us-ascii?Q?7Z0g0C6TgeuK5yBPnjFtM/0YPwdCVLiHO1YjzWPij7dA5VgRvbK0/DpO37ry?=
 =?us-ascii?Q?LOJhVFiRWmOQqRNNiFQ4rv9mvNT/LNu7zfaV9U54yBMaljpdh3LGvWJA8oz3?=
 =?us-ascii?Q?33QHLdUAMt5ZWFrHieGAwxOtzfQRxFrTYz/dSfYkEZVuyPNxOAx+XVx1X1W3?=
 =?us-ascii?Q?3x4bpS0Vva5E0uGqrvN0CO+YgbFl0/yM7QjICkekywyb4tLm8Y4I8LZzrHhE?=
 =?us-ascii?Q?hrjqTxL0Zg=3D=3D?=
X-Exchange-RoutingPolicyChecked: cEKOyVhXc3C95ZGkHN009ogvpDc2aIM6u5KpwcYFGYgFxB/eF1dUHHbVlOlZOkpDNHeVIt3juwwkdXQZfE2R9A+pDLrGBsNTeWuYKIy3kaWkR92jIaOH4hM8gai0brqirNkoG4lpmLGzL7uZxEdqPrrsoMnYB3/cv2SQfhuckyQCTbjC3hfq6owpNKmyyE32Q1fKEPZqNcTqMH4GI0G2eGLyucvioI9Fr/Q/Wl+2dspAixVpYcP7QTeKuTx51DMk9IpCgw84ffDkUJBmmSJIE5MxrMgmsJnt9IW3NByyq0bv1k1ILP3qE5FoDbliIjcLrSuncq0Q7o0xvrOaUymEZQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9d7681-d986-461b-0aef-08df1c742f6b
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 08:49:05.0990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6ve0inNOPNRtmXqueXjPQn5RAj4AoluqVSmEPfuSdGyi9LDPp6InT6q7cl+yykqHFCYMCaSmpq1VxtP/X1lww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8472
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 9c85f63886c9ecf71773bacb7ed5524bc5dfce52 [448/673] Kbuild: rework stack frame warn logic
:::::: branch date: 6 days ago
:::::: commit date: 9 days ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260925/202609251538.OEaGBwuE-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251538.OEaGBwuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609251538.OEaGBwuE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/exfat/file.c: In function 'exfat_ioctl_get_volume_label':
>> fs/exfat/file.c:575:1: warning: the frame size of 788 bytes is larger than 768 bytes [-Wframe-larger-than=]
     575 | }
         | ^
   fs/exfat/file.c: In function 'exfat_ioctl_set_volume_label':
   fs/exfat/file.c:604:1: warning: the frame size of 792 bytes is larger than 768 bytes [-Wframe-larger-than=]
     604 | }
         | ^
--
   drivers/mtd/inftlcore.c: In function 'INFTL_foldchain.isra':
>> drivers/mtd/inftlcore.c:393:1: warning: the frame size of 804 bytes is larger than 768 bytes [-Wframe-larger-than=]
     393 | }
         | ^
--
   drivers/accessibility/speakup/devsynth.c: In function 'speakup_file_writeu':
>> drivers/accessibility/speakup/devsynth.c:95:1: warning: the frame size of 796 bytes is larger than 768 bytes [-Wframe-larger-than=]
      95 | }
         | ^
--
   drivers/iio/light/tsl2772.c: In function 'tsl2772_prox_cal':
>> drivers/iio/light/tsl2772.c:907:1: warning: the frame size of 808 bytes is larger than 768 bytes [-Wframe-larger-than=]
     907 | }
         | ^
--
   drivers/interconnect/qcom/bcm-voter.c: In function 'qcom_icc_bcm_voter_commit':
>> drivers/interconnect/qcom/bcm-voter.c:367:1: warning: the frame size of 836 bytes is larger than 768 bytes [-Wframe-larger-than=]
     367 | }
         | ^
--
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c: In function 'brcmf_feat_firmware_capabilities':
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c:253:1: warning: the frame size of 772 bytes is larger than 768 bytes [-Wframe-larger-than=]
     253 | }
         | ^
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c: In function 'brcmf_feat_fwcap_debugfs_read':
   drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c:289:1: warning: the frame size of 780 bytes is larger than 768 bytes [-Wframe-larger-than=]
     289 | }
         | ^
--
   drivers/net/wireless/realtek/rtlwifi/rtl8192c/phy_common.c: In function '_rtl92c_phy_sw_chnl_step_by_step':
>> drivers/net/wireless/realtek/rtlwifi/rtl8192c/phy_common.c:887:1: warning: the frame size of 812 bytes is larger than 768 bytes [-Wframe-larger-than=]
     887 | }
         | ^
--
   drivers/net/wireless/realtek/rtw88/rtw8822c.c: In function 'rtw8822c_dac_cal_rf_mode':
>> drivers/net/wireless/realtek/rtw88/rtw8822c.c:376:1: warning: the frame size of 816 bytes is larger than 768 bytes [-Wframe-larger-than=]
     376 | }
         | ^


vim +575 fs/exfat/file.c

f761fcdd289d07 Dongliang Cui  2024-09-18  556  
d01579d590f72d Ethan Ferguson 2025-09-30  557  static int exfat_ioctl_get_volume_label(struct super_block *sb, unsigned long arg)
d01579d590f72d Ethan Ferguson 2025-09-30  558  {
d01579d590f72d Ethan Ferguson 2025-09-30  559  	int ret;
d01579d590f72d Ethan Ferguson 2025-09-30  560  	char label[FSLABEL_MAX] = {0};
d01579d590f72d Ethan Ferguson 2025-09-30  561  	struct exfat_uni_name uniname;
d01579d590f72d Ethan Ferguson 2025-09-30  562  
d01579d590f72d Ethan Ferguson 2025-09-30  563  	ret = exfat_read_volume_label(sb, &uniname);
d01579d590f72d Ethan Ferguson 2025-09-30  564  	if (ret < 0)
d01579d590f72d Ethan Ferguson 2025-09-30  565  		return ret;
d01579d590f72d Ethan Ferguson 2025-09-30  566  
27af3392196ddf Yang Wen       2026-08-10  567  	ret = exfat_utf16_to_nls(sb, &uniname, label, sizeof(label));
d01579d590f72d Ethan Ferguson 2025-09-30  568  	if (ret < 0)
d01579d590f72d Ethan Ferguson 2025-09-30  569  		return ret;
d01579d590f72d Ethan Ferguson 2025-09-30  570  
d01579d590f72d Ethan Ferguson 2025-09-30  571  	if (copy_to_user((char __user *)arg, label, ret + 1))
d01579d590f72d Ethan Ferguson 2025-09-30  572  		return -EFAULT;
d01579d590f72d Ethan Ferguson 2025-09-30  573  
d01579d590f72d Ethan Ferguson 2025-09-30  574  	return 0;
d01579d590f72d Ethan Ferguson 2025-09-30 @575  }
d01579d590f72d Ethan Ferguson 2025-09-30  576  

:::::: The code at line 575 was first introduced by commit
:::::: d01579d590f72d2d91405b708e96f6169f24775a exfat: Add support for FS_IOC_{GET,SET}FSLABEL

:::::: TO: Ethan Ferguson <ethan.ferguson@zetier.com>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

