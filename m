Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF7A27707
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 00:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775520929; cv=fail; b=LmE+Us82WsSDkFPJDniBAQIwZcTCzORnyMKAwmdQupippQSCRLrxEvI+r7gaG+etk5lcachfDtXuATp5PMpVzPGfsHoygCxfX1eOP9Ij92IkXoBRWpMfL6f9TWX4oIP2CxZF8QoQ+lvVORj+axntvLfWcZeZJryEa/G+Acc6tLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775520929; c=relaxed/simple;
	bh=It3IpTk5YprQyBf3om8rVpR5s5C9HBLWF0Ynnu8vjKg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=phyOZ/NVZPZ4LTV/xd+PH1kVgSZ4a0Pi1oS+FpRQctVGwAoP4syD+l0ugPZimG/DEZsLuJc12W5oCt2V1+alRI+mAravV8IJ/WiryNdcOSNtR7L1phVUEmqe0kIIqx6sfUi7V59Wm7D/HsABMYaiMAvInPhtUYBAu1MsjfpRKtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCrBtCGF; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCrBtCGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775520928; x=1807056928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=It3IpTk5YprQyBf3om8rVpR5s5C9HBLWF0Ynnu8vjKg=;
  b=lCrBtCGF828aTHRVHzh/zxb1MiAHV9PZR//nQYKDMX31M3AbuAdk24Rw
   afxKquAoE2GRTR++LC1lRLwBzEuX0FjSmEu7mNTq7D2APUAHHSWD3vJEG
   +PdjPG3WkEYrTbf2IF1u8UcGnuCchQOj0tOOFDWlySjOCNWdVFvXUiA9F
   zttqif1Nc7prSzPpKRcb5NKL6GFzvvp1vdi/2VaG735tQ3AxlE1NLj6W5
   CKEY1AZrKkHLNvM/cP6t6bcTWKi8SHv6FtURq1+wRUOepsL167TkrV5Aj
   hDoBuxRp8t4GpuiRIwagawCyFXie7yTa0MdRWLJCp59mncntz3LUuLHDy
   w==;
X-CSE-ConnectionGUID: nDa4eenlSNylviczyzMg/Q==
X-CSE-MsgGUID: U8Y/91ZqQiCWlDt8908Suw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87930457"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="87930457"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 17:15:28 -0700
X-CSE-ConnectionGUID: MZ/84guoQ2WFjK+6A1ZF3A==
X-CSE-MsgGUID: HhQ/JurMSrmrbQdVkRPf2w==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 17:15:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 17:15:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 17:15:26 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 17:15:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlFw5MKYe8m28wdFkmFs3iy9HRROzfGDTNWLMAPcTCUx/4xWUta/R1NhfISA3Z5/A/kObYUxmMRNcoO6/EsFxxnHvRCu48/89Yz+UnkqOjqsIyKnLRC/vU9/y1HfBCpr/+yFckR0IVy58szTCk5ZX9smRmqFvCOd635QGrUFgzaXl9t9z8teKjlB5xXEP2JJTdk9bovxA/UwFt8GieZWpuXwlF9oTBmT4lFNzb5UKKvbdEFGURdd4KhGr/xlKb/j7R7YTMJ+SktM1JOpQu5HnpSfY3jTMi7I2ULytVs+3bzaF7ZiJKxxoaSX6IMppwktdA+2TBUunLCrLb5kU+fHig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBJsb/Sm3oAKMMwzLVszYNxGtKcKBjXvSi2KRz07WJs=;
 b=n6ynRQggZplN/DvSuOO1sIb5LL9s9lPFpx1+MQMkMqX97hPF5OHAKtwxkrrprJolEW1SigJBT70keS6kZ4NIqHDGyMWyw8mzsiNJaOyCoOExuEjWtU5GkB9njp1Ym5/3xVX25hhR86g0K1mJ6u+eGK6e3NK1d60Ltjg8nmtVomoPOszTw9Q3aMs/t5BX27t5qNVNrRIaEwoX9jORTYOKq6yL2NLhiNNh0g/UqcBtfs6MpFMBKhcAMZA9wSRxnm8vPLGIvaGtvZVMhwOAgL99cDQkzseAhYipdNs6o7oF/Nx6LwuClN66NlsW+L1Vjqc3QqFACvnkuH/lwViWfutsIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Tue, 7 Apr
 2026 00:15:24 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 00:15:24 +0000
Date: Tue, 7 Apr 2026 08:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: Zach Brown <zab@zabbo.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [zab-rpdfs:rpdfs-initial 1/51] checkpatch:
 ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
Message-ID: <adRMlS49EtNNUNgW@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|IA0PR11MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7a716f-7566-480b-8fa1-08de943ac384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: poO5fG54Smqc1cwOT3iC+/1bt1YoQxzPSZjE6qEuXbTyT6o1s2MEawsRpROcgaYZ5SWTTJ0LzKhDWtqVYr33DyUXkkii/lNbpu7ON3njy+WGyNd8/PjcTcRUd5O10KbIsUd1H8Ll45159tlv13LMRoYobD6W/WIHjDVdI7U9p3cYn6ePFNHxoPvvJ2C6NrZe+bTUVxR0v9g10HUoix2SLx5F+8gUfcuOnz3sfWMoUqJt9+FDWg8B00eIbfwX8SBoyLL+W1BoRZKCMgfewsraZmeq2x7lLDwaL0xa7ZGqXSaZX/MKHvYNap+uB7o2h64sPycaLinSPvxbQ2vadJ0b/ugBlDlDx2Ujy2IkyQ4rXwVZDAkK/kX1g3ttSfr2U2Bm8sWqw6C5A43LbX4+fENFGGaB494LHfqq9KVK9WNJ+tv6cI+ukmb0+0BaG2e7knX5PkDGLc3mEDOodJ811M2bKE1Ev/YvjAPZVirneJa7Iizzpm9ZSLNocsnrNTKQTFWBO0X/1PojmyIMc4HEEnSjCKqtoW84rweAxARV449UcPlEx5Aj8Cp4cx9VCFA1yVlW9C/XdjFhdEi+otuc0TwbqgV6Vw+BXS6/z5x9hzcEHgPKaIjmI+qg/9RZfr4hpvWIznjljGET3hLxLpZ0NqmYmw+Q8CJhk80/b7vaX1n1F7xsCrfFzXUr5nX5UENCAzQIzJUYC0ItUfaRmGrbetnYSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6cXBropUbkJiqkYQQqpCXmMr3EzKSz3HTymR5Vz5bjG/22jzsvfJLrIR6xiR?=
 =?us-ascii?Q?zM5qBm+8VPmu35r/qV2P7rVvsEUHqlJgB5PgZA7xFIO6dQZ2TMB82/E/EGyZ?=
 =?us-ascii?Q?9SVB8ShKkFLC2d8IJfZ3X0qFHcbwX9S7e/k2P5qdLmfBcFDTI2faebj1uM7s?=
 =?us-ascii?Q?3csLGplk88hwA7qzEwAN3IjYF+LAWIYRxg0orL56iWtAmYdbTEvG0N2xl59J?=
 =?us-ascii?Q?8ttuZ0594PcCcTXOZburFuVTL478vE7jGRpNAbY53+lx2HHR5of6Nonk5a4m?=
 =?us-ascii?Q?6pp5v9GOOe7GeRvQ0mC2703LfsnMpZHW3EELUAdTyJoZBZY2ieqrfcGuip2A?=
 =?us-ascii?Q?+fWePkhOBRAMCsMmYiudTIu/7eYI4nduZ1/dPxmOVx6W0S1LaU7IGILOF+BT?=
 =?us-ascii?Q?KOyn+C2WU1DfJ2cjVEl8GIAjpQT7p1dSSVD7ESvwSvH8RCYFBtNrA34J8EaB?=
 =?us-ascii?Q?9+f/leEYM617RJwuHnGUwVOaSwj+/awfpZUw/ZBFiqNd0rsDgiMr44jlFmmt?=
 =?us-ascii?Q?L7CknTaZBTsJhSYbqQVRAVw6v8+jYulquihPn7JwDlMeIHIT1PqDlJ7DrO7x?=
 =?us-ascii?Q?gzLQYbbyrLT6StBp8QTF0VczCfQcbpEAVjuw0BWIIwzK59fxpQ0NOB8CS8Zg?=
 =?us-ascii?Q?9SZ0pQMiRl5yJevxhuP5dSAoedsLdgWGepohV4VbJp0vy4q6Vfc1swou4jnR?=
 =?us-ascii?Q?1brw6LmoXD3LzLK+pjnVD8SSqgJBZoNUxz3pGNXKDRYgXdqrugYKhweLcx1b?=
 =?us-ascii?Q?KeZf6703v4X53BaBTYk52Aboo9PAuO8ynOPZBl0Vn1+0vlhgQsyN62QDawVo?=
 =?us-ascii?Q?KmClh7Cq5er2nO/YGZa9ajyekVnkF4u7K/+FRZ0DG58xhgVtDtKc6pUg557h?=
 =?us-ascii?Q?mkcNQShlaZHkQdHDcu0xQoW1/HboHl5fqH17cP3jlNCiT7k+hns5FvagV5aZ?=
 =?us-ascii?Q?Y4O8xWQHIrsNpUKl6eCGeTZqx2bR4W9TNgOyn9n+XE6b1WSKlBRy6VE54ogw?=
 =?us-ascii?Q?gO0hFDWxe17QxQ/UEQFfeuTbzJPa826YcFAhJJi8Rfu6cNoYLrdkBXLCBAdL?=
 =?us-ascii?Q?W7zsLCNuqi4xx2DwUyT243J3AAvA4kq1lj24KeO9akQXMkleHyuLT8K+36Ql?=
 =?us-ascii?Q?TMilHGubnm/KChup01upK51rsGlNp6rQT1oXfRzv/1VSybCd3Luxgq6MM7A6?=
 =?us-ascii?Q?anJe+ZS7UvZKgtg3fPO8KytTV+B/4ExlepXhn4RUQSj2ZxUTN+LIL6VQVbrp?=
 =?us-ascii?Q?msx4w7tvyEfwPw1VzRgJZlAtq2xLc7hkHG+2ocg8fqb9RHnXNtOzq7Cmw4g7?=
 =?us-ascii?Q?M1o6M0xrs6tKupQFe6pxIeZwt347IvggXBF/qY1VVRJdyeULCJ5P9j1FtcGH?=
 =?us-ascii?Q?zFcZ0kbFXuKYnnKtDKbBbhXO3hATGx7zq8h4kbtmBqRvi2Q+1svmU/dhbTw9?=
 =?us-ascii?Q?ddzgra0m9O9nco/sCvAGPh1vh7cZmiqKOxQvRvO/08zeaShZUy6UQYF+9mWy?=
 =?us-ascii?Q?DNUKugd8cN4hKbLnIkmg+KcItwAVB8Oe6+BMwsg3tlFh30vZc+hBxmr4RnWv?=
 =?us-ascii?Q?yKaYm9IOtp571f3hUbR+jAQHxK7mPqFshC9mF6GjzwZlQVufV5kAzIr9JS6s?=
 =?us-ascii?Q?0+MoCOuCRyEgzABgXWt/r+eF8gIO7aCf7xhseFmqDXYj8zZz1EWaxUTBMjsn?=
 =?us-ascii?Q?7oWhSi0AKwEU8gX1027+bjXWJioWsvT8y2yhFarll/uFWcFenVf1B4YyKt5+?=
 =?us-ascii?Q?ZydMly8HgQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: rqY0GOZq6eQwnXNHDfvU0wt+KadGBykcZkAayQU1/eTxVabSf2AoIXiHScmuviF3PBtphGJ18yAnbMkCHCcHb44bjxpefGMod7ThBjdnFv2rHOlVfeymBADOyd8bFFCj2tOKLA1n29rZrEn5TWw0xovc6Nx6tvE9ke+L2Og5P6pq1rV4nXsO9lajMwgocMBGEWbcyXkqq+8hX7GfYha3AkwAL7s+livDf/pV5QPH5hB7ZUVoRILh1I5w/zpYMx96w+sPh2UKXx7mFuarVUQ1vrXLaOpSc/iBCcEaCqHlQHnXvsvIn4J3b6TYDK69Ab8QyUNdX4gFvHxjFtHem1P+Cg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7a716f-7566-480b-8fa1-08de943ac384
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 00:15:24.3618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgAertAwRTWkAdCRFGaCzVTEaYQk2fPcF4AcAdH9W5S7giyYB7rvzN0j+zt7CXt9Mgn+tYCmxroz8SWggywqPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7307
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   9a0627207ad856d2a5eb09f3458afb1e34ac10a3
commit: e8e76da7ed715ef67ccc4436f4981a5b39983d9f [1/51] rpdfs: initial commit
reproduce: (https://download.01.org/0day-ci/archive/20260407/202604070003.JU8KiozS-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SWITCH_CASE_INDENT_LEVEL: switch and case should be at the same indent
#5989: FILE: fs/rpdfs/net.c:470:
+	switch (nerrno) {
+		case -EIO: return RPDFS_MSG_ERR_EIO;
+		case -ENOMEM: default: return RPDFS_MSG_ERR_EIO;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

