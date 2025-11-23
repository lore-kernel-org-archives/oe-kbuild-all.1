Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7627E50276
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 01:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763863014; cv=fail; b=JLxNA6RBqaAZP9KKGrC8tQNQ/QAEcP7i2B4yMQP/GUGTwgLK/3MOd0RYD35AR617CtNY8aSob6Lsj4gm/r3eGtfmR2ikgNRmopiMYzyKH7aWaauDnAU+ToUSS/wQOEQT7j3adKPPKb6iDZKE9kHzQQ4a6fPoWbgBp+aVo6nJ5D0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763863014; c=relaxed/simple;
	bh=K8WKabFv3AoPkjUVHfkVtliEJ3K0y/ddg+weBl9FaE0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=YTA8FCi0LTv6A8zCYusnwwLg0pkCWUyZGh21RPolOG92S0RXRIhRHJA2XyGc4V8cdDYF53epsTda46YfmMG2GzIgjvqW/Yf5kPEhpKiel2JLDt7DTzF4htSxo7mWgkxB7gP9BTnEG4i7QYF0rSBTG49WDzWJ8F8HSv/1bDzmGCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUrQpMFX; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUrQpMFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763863013; x=1795399013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K8WKabFv3AoPkjUVHfkVtliEJ3K0y/ddg+weBl9FaE0=;
  b=aUrQpMFXio6r8Xq53NRlS5MRKVU5rvRPj1nDuEwDtFOPJkAw85R9FSHf
   kzRjObGtJKfP+rhsky4/adctaVwfJyv9HwtTfwZJtD0yo6bi/diSgpa7w
   +J9FMeMJIRZsGJFUzx+keLWU27Muaxd3CCSxnoN4EkdH0n5pz8NT0hAzm
   VSuDdAuWn4T5oXyKVUnrSOAAgJZSfF1brN6bP9yam/KjhDaCzV+N3hGsL
   /vXzu67N8vyxy4/U5HgLAPRbSMqgGu198kciKyyKqQOYMIMRF5KaUyL5Q
   4XdPjX2FaeyjTFc9x1M8phhhDrHsiNJ4oMST+t4O2BBq+VOUa2VNYhAxg
   A==;
X-CSE-ConnectionGUID: bOi4OAv9R8Gcmn9cbqme+A==
X-CSE-MsgGUID: joDn7yECRM+cg8pjZHy4IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="77272473"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="77272473"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 17:56:52 -0800
X-CSE-ConnectionGUID: VzauzUVeRlqgEMaWOVAsFw==
X-CSE-MsgGUID: t6kHjUlHTyuI302LDH1cNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="192122723"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 17:56:51 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 17:56:50 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 17:56:50 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.29) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 17:56:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXeUNZwHuBrkYT1Yaa+KgOw/ALAe1SX+9oBTTKIKzJ7V3boYUHn/pX65bvklNKqvRiVtjXHGTmG2JKEDkuS9ao8kngygFpdd5+9GKXN0OOaqL82ESJ36X+GZe5+Lv6ExNshlJiy7Ekih2JvNYUYITF9A9ukl0K+hcL4kP4SqviyADFloSb95F+7rghTXQheePQq4HMGcGe8kC/Gn5iNc0+uib6LeV3o4cZr6tina/NfR3JIrMtDKYei+Su9LIQ//lnw3XQEvpesRPrbDexJWW8lyMAvoEXmJSQ1XH/3QeyvX//XX3sfcgxwzxkvMajKio2jBlw6l0zcIFe/wZDYDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEWGlaVtrJhxwcGrTKVTC92Mu1kK4+nqG90ban7tBWw=;
 b=grWFa4Z3AJmeSYPyccR6MaiOerjv64HxS/iF13wG2BQQa4iKi8vpLFkc2/CA0dkZWKgiJ6IzsGvJNmcScUM88ej/5lbNsgpJ9Z8yHm8XpwkodQ+pD1Gh2TjmYmJSLHLcQvxAb+4OT5o+MuCeeVbHptTptfUi9WILQmifpXFpRcusWscrK4TkOglrMmbTnydcZsdIH2toLHy3SXe4lkfs1NMfPLHkzPDLHj7QEeHNIWYomMQX2sYXohyT7EnhxJ9mlfG+S+55Lvbv6LBdj2DlF20WeW287dAbBAg/APhHzKSScrdmdVaklcrYaUq8Z1wZ3S6TWrWYk/+1Dqf3V7OHHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH0PR11MB5111.namprd11.prod.outlook.com (2603:10b6:510:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sun, 23 Nov
 2025 01:56:46 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9343.011; Sun, 23 Nov 2025
 01:56:46 +0000
Date: Sun, 23 Nov 2025 09:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: weisicheng <2724853925@qq.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [linux-review:2724853925-qq-com/input-touchscreen-Add-ilitek-touchscreen-driver-support/20251116-215220
 1/1] checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align
 the * on each line
Message-ID: <aSJp1tXHhyQOeFaq@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: d5cd7878-240b-422b-d638-08de2a338eda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xH3dQzyLrrdZFgbIWyfViRJ432eBeSiflDX2jXFLD8TOJbcDe7Tb6nrJwMfw?=
 =?us-ascii?Q?NIBLZH0KFJ2dKNIJDhFTCLT0Q3ceN63CvCRCzz3G8csjIEHSbjRYbLW3Qo+O?=
 =?us-ascii?Q?ZLWJa60a2sAwiAScbR3f3ylzji0gOhw4TLJdupLw0AcBdqYb9qmjgtjjZOG0?=
 =?us-ascii?Q?2YIJrz6X8+2oInVej3L9ahvvWnwMoeQvxTza63j556NWpQhbVvs/5L16h76i?=
 =?us-ascii?Q?SRe6a7lpHu67aa0ZMAzKKtAfZ9uzWKmEfqpd2KPvRWiGTyuD9sOkToPOS5fW?=
 =?us-ascii?Q?2eKInPgBqkP38IDw2/vDuUmDScYRg83Wd1tyW/b0NqOWfNUyCX+WjEN8OX5v?=
 =?us-ascii?Q?+FtGa3GrUC5ppQAtj6V7rl9NKzfeZFKrywJPdJJCt8SbW01iS6g5WPctLJZn?=
 =?us-ascii?Q?GPOLHc045rCLC/Ecjn0mL8SLu7Ysjh2UJOgnBSznwkOiIRYyrn4tADWCDbz2?=
 =?us-ascii?Q?gKhFt27me1y9qp5MzDyEZ6Qugq9KPiOGAIn8uK3T5Xe+yORdUv0TFsqV4uq9?=
 =?us-ascii?Q?dDnk9iNjaecMJI++BPEj+mxZXiGXM2ZXmFk6/WARctNKpHu6+j31hRSg1oxJ?=
 =?us-ascii?Q?trLE+kpnkCr1R+4P4JqveoT5l5PeMrRFs20a+7JViNL/dU0JdxR9iTh2tLM4?=
 =?us-ascii?Q?eBVfGqmqUvVpnNTnq5gU07o/KNZezwPd57hsKrEKhzUDwOu0g9ms6910I58a?=
 =?us-ascii?Q?rnVhHP3m2XagYp/273GIlTvtLTJEeMkLEfPm9dw2zM7L4W2slvctEjqFFGBS?=
 =?us-ascii?Q?qaHwAaTewfJyaW7XbFsO17WzptBWUdWRAZ6KRWASHo0rePikMvhnnJJKkBF6?=
 =?us-ascii?Q?Vtzht71WVPbo9RX6VHeWGquysPvYSAaYMYuH3feFbE7my2XqOe2Di85+8E/i?=
 =?us-ascii?Q?NqgMv2qXENIlS3kbbiJYSbLxQGqVsGpeer1nSI9pHbrOYkPQX38O/z53M5qQ?=
 =?us-ascii?Q?WzvqTmjULB7HpTf1hsYNs+/F6u+94dzMN+3Yuj52HKKLX/q3/+A41a4jnKnb?=
 =?us-ascii?Q?72oh4hAZVyF25oTBCJGbtiy70UrJD4wbamtNXOiOzTo4xem8Y8H1Y5Q9mXdQ?=
 =?us-ascii?Q?dMLazlsA6uxCr0anutinr9yqygfnHEbDlLT7g/LYPNP2vqDgC2Uu7q1zpMDi?=
 =?us-ascii?Q?urCDSUhCO6Rri+UvkUBdus3fO4I1xCUWbJJSo+2H4xUkmqS7TMPT8GzeQ2lP?=
 =?us-ascii?Q?O+c3JWspEGk9DgQZKAXNJsZmrX6lm7PgthIYVNRmmHbLUYLQdmiPh0c59h3A?=
 =?us-ascii?Q?lUzfuDB9YIAnVH+KDUYk8eAaO1xLHQYw5VDKldyt8OpCxVw5HZ7hhusmA8x8?=
 =?us-ascii?Q?tNThkyhH5+EHybGC4is6cA4syXUvc/P2PpYh2kC7zqAy0eP17M09l+g9pdM8?=
 =?us-ascii?Q?bpegFV5HUo0fWybwQ/+zVPa60SgN7KfgxB+LBC/X2qMAmKvGzbPhCoWPpu9O?=
 =?us-ascii?Q?w2HIaLbGkE8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cKEaT/5p7wALwnN9iUI8oZHflswHvarKacD2ZoYVD0nx7sRUPkl6XCW1H0dM?=
 =?us-ascii?Q?Z6k0MAa/7gGEBHMN/jyD3GHa+XsVc92G2ctT/S3Cu1TSCcoEPncJzcfpA+4e?=
 =?us-ascii?Q?otI+2YKSZD7JVICldpoFR0FqG4xzxWvFuPioYhXDjkESaMl19hCIlJrLtNb8?=
 =?us-ascii?Q?llfssrFAXF3PhX31Do/GBHAqPhuNkX8KhAIon/g2LhfWTuNN/T6h7Hw63+pH?=
 =?us-ascii?Q?q0QixCE7P9btX7lOmt3dpbO+j8wYV+AKORcreSsRAT1EUYYBesZXQQcXtYiT?=
 =?us-ascii?Q?VDsBzrvIkmlCFdIFH5WNFv4H4fvx3/f5js+m7xxy+fNks1d4ah1Eh6aU8e+t?=
 =?us-ascii?Q?L2DUftQiIpjdWPyYDyEUrQV8qHDOXjK+vPgVebG33UhRTsQSqFW/LHEjcMpY?=
 =?us-ascii?Q?FDSJvPSvUvP16XkrdOaspFSc80a2d5r/pU30PLeLSe5xL95Z0ghwCJ7NcuH1?=
 =?us-ascii?Q?oaEe6iYjT11wDSo72gNR5L+MPhtE1/B8gKyEEf8gpC4asKSeVxLAqU4H6HdY?=
 =?us-ascii?Q?krrFEyTJ2Ydl66F0P4mjzouKRzX+Pg1/c7rOaXvf9HbWlUbzSmMvZdQ3PTb7?=
 =?us-ascii?Q?855FwsqGM4QUR98yyZmZXf0h7bC6NCKQDT0oBX0s2nzFGcecWgnvpoJNelf6?=
 =?us-ascii?Q?xOd7xnm3hitLjiAGg+R9MyL5SPHyN0OZe3ZegJ01FsSR6unZLVTWBNxuLwLq?=
 =?us-ascii?Q?BQn67Fw9sX918hMhJA1H8pyOqNtdeBRvb7QGe452aOHb73dKVe59IWBKA5o7?=
 =?us-ascii?Q?2JN1jqKUVjLpbycLSTnOyqQJZYyZSX4MpP9TWwcjaPdRWssCmmqTM0CoFPaE?=
 =?us-ascii?Q?DHmzAUqsfSV33sU/pDeielxuCEZO+H/S7fKERhLHEiBaYriWxx0SCCEp9UP6?=
 =?us-ascii?Q?ylMcp12S0yO5e0MSwVJ94ubuQmCh99GMAEzP2WZcZntk+YZQbWxOEHYLPH4e?=
 =?us-ascii?Q?g2FCWKoMQuNn6B4tJOio8D9x+x90+ur+AuD8dZSFdcYrUa+breSuclrtDCep?=
 =?us-ascii?Q?M21MMDdDnGmXmEQjTViwTx0nS1tDs2qRIEUT6sSgdbz04QYmiDGsafT1/LAx?=
 =?us-ascii?Q?tsOGrbNdI5iTLGzcUMffX+fMXr3hWfaIGZBA61BrHYP8QbsPiTxqII0SoGvL?=
 =?us-ascii?Q?PyJ1rogDeyXWpssFuUd9PIhXZ7Qw8BpKa0grBThLYcA5jUnE8X6dEFaQQUF1?=
 =?us-ascii?Q?l3RcBPNzQQZFXopzC48Ux5cyqSH3uxSKccEXUG+899fpCVeqUrTX3KSygsUF?=
 =?us-ascii?Q?du4q/M5ZIwz8Zncg5xClx6USD8ITiVCHAUOxDWaayyqdLP/WlCUn1N8oFOPz?=
 =?us-ascii?Q?CK2vsT2e2lMe5STWQNl27WXeauNqqD6rL4vc5anAYCtAM8jwZ8tkojtZWfrd?=
 =?us-ascii?Q?B/vf/9Av81KX8hNzibwIWc1vW8sf5TpLop3inD5q4+u8/w+jdejBFz4Ew8uK?=
 =?us-ascii?Q?mAIZKBDSGiS0XNecrvR79CYruES+isOgZY+6r94lxahw1QTqS3AzPID0cRGO?=
 =?us-ascii?Q?i8TvuHcXLqfNhWg/3oh2b3juyWdQdYoGrRL7AR1XHP/hcunnjSpCDNQY0C0c?=
 =?us-ascii?Q?KNwwNsW5Sl1Sha9FiDtUMaIPXLeP0mi8fHYP8g+4qGt+BGzeVRRiQABcjDUv?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5cd7878-240b-422b-d638-08de2a338eda
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 01:56:46.4593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDJ6NjAPvVUpd2l/PyT7Bq7se8Szzneh2QG29wVPUdFDpw6I/o4jgAIxGDMOk9hYlLckPinQ+anP75aEkUic+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/2724853925-qq-com/input-touchscreen-Add-ilitek-touchscreen-driver-support/20251116-215220
head:   0458c09b79ce0e1e0f8e6cdddb494562aff9035d
commit: 0458c09b79ce0e1e0f8e6cdddb494562aff9035d [1/1] input: touchscreen: Add ilitek touchscreen driver support
reproduce: (https://download.01.org/0day-ci/archive/20251122/202511222224.eG7rLdyw-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#4966: FILE: drivers/input/touchscreen/ilitek/ilitek_protocol.c:604:
+		/*
+		* for no-INT-ack flow, add delay to prevent

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#7416: FILE: drivers/input/touchscreen/ilitek/ilitek_protocol.c:3054:
+			mp_result("Key Raw Test", _mp->station[i].key_test);;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#7488: FILE: drivers/input/touchscreen/ilitek/ilitek_protocol.c:3126:
+		mp_result("Key Raw Test", mp->station[i].key_test);;

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#12216: FILE: drivers/input/touchscreen/ilitek/ilitek_update.c:1301:
+	/*
+	* Update AP code forcely if AP crc/checksum not match or

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

