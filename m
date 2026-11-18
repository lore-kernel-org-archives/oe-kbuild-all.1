Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794961541;
	b=VUJpHWFJt9cQiYNOO91dvgnPtkxK0xCrOHTHm4y+jIVSkI+Pp/UcT93WMPM2La70R7H9
	 snCpf/z950B58iey/CfqoKriLyka08DpQLzT5hHWCnIj+9hJrWRk77IAxesByWlKuiPrg
	 drhKqVUwP98fVkVHDWaBbLBOvHxFwbECilAMXjAWIH9niLcxHZ/RNKwavfdx013MMRtvR
	 wUK9TjbeZtjAEnGuHLxzgPv1hMDLo9STP22Xg0pLogrE9/FUJtbw5GuUPseXf1NmWJrxc
	 K2pgniW0NZc/Cq+F4JuYH6u+FAeBwjYgNUrllUK7NVKqTIA2cXqInQ1UoU5/15f4RaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961541;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:Content-Type:Content-Disposition:X-ClientProxiedBy:
	 MIME-Version:X-MS-Exchange-MessageSentRepresentingType:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=j9lDTlzxesNjP9cXnfEid6hd5Hh+ogWZZX9WoI1HllI=;
	b=nDnX086aJ7JqyjGGQ6/4j1iaHf13lzoK0ptB1BIdgbrPRNMjkawBY+tTfpVEPa+uyc17
	 Fh1woFE+6a2zdFaDoizE8jFuY9B3mfDspjEz+kQBEnzTmj4QpF4H7D3NZKDzwLx45Zh8W
	 TtV7BWtA5Y/G9vC4iqr+v3Rgzbh64qdE76YJCBfHjlHBtNmNZGM/YvJkHD18gzPrz1GKm
	 VbqKUdW/v7v9X7ukuoxrpRbcjoZiXvfjHv6/h+fP5l7asdAyoG4Nbl872Kwqxii7kA5Gr
	 1rxMJbQmF2brPhpyAHdMqdC4dWEgZ5LkTaa1eQxMGU8zBEcwhL6ccfobejDjoikskWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="JDuy/54P";
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NLo9FCB3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7D0606A88B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Nov 2026 00:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E7D0606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JDuy/54P;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=NLo9FCB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794961540; x=1826497540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bw04j12rIJ3Gwe7t6ywFGrgNvMG5YsFON3N3TVErai8=;
  b=JDuy/54PXV++W5NesVLEOz8r/wTtt0/TPkvXQp2HpVr9wOWxjblmO7DC
   bgQxheak802jsPvrbe+Y2OR2u/XMKLD9gl5CrVPoWqFiQWp41QkZLbJ6L
   381hiJaTKyIcqY9HehAhm9ZA23euDeAuKXC/eWaW5suS4zahb1fGwCqOl
   zSSKI33LUhztX6qf8Pd3yOwK/uJ+ZK7qDztOZ5WTI+0Y7AzcVh/EWOR/i
   nMK/Wia1lp875yko/qtDj4pdR7RhwXg5GpqNvr15aN8vzZs1GKUNjYMAY
   pKqac4SJUm/b3qcNsKZ3yE+Irb7kyKojqqyuUEPaxLGLtFanX+1rUVz5x
   w==;
X-CSE-ConnectionGUID: dUiTqrN4QYWv95bW0/8Zig==
X-CSE-MsgGUID: +3NzdZLtQFOENs2U0Nh2tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3746774"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3746774"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 16:25:39 -0800
X-CSE-ConnectionGUID: YakmWRGBQPCLg0Y6BoDbYQ==
X-CSE-MsgGUID: 15qCHOgpT/uizHR2Mqkkpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="11791360"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 16:25:39 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 16:25:39 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 17 Nov 2026 16:25:39 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.68)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 17 Nov 2026 16:25:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFgkqmWC8klVSmKzJwbVvLFLw9YgFSbl1m08xmvFa5JLQ4m+kOMijsYN5uI5+RcIMv3fOP6cVmxDKfkm74Yv5RuIVCSLDEt0pQRc3kFop/Fa+gx854MLIvh4yF4AYUi1PsuECL4aj6O0O22v49JObwWyyWPZPGeMgsL4Ok6Dv0qx2S+Xu92WPLTIsi4S569fP2AtoDnvtJuEuDavc8KyoLHnUsL9lTD/j77O+mEJ9yk3Ez8CL3+mWStFPuk2lakF8irk2yB/AF0+AhDlbwioW5RJXLIizqm0SfzVbcosxzThcKxVNGpnXbw1VdSgGoUNa9ns9b3fnH2J8n+T3dGrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9lDTlzxesNjP9cXnfEid6hd5Hh+ogWZZX9WoI1HllI=;
 b=UnXAm/x+Yo3LqTo84t/cHXw+Ex3Dvn5r4UyMmo5QrKSJbZfkSkCRCfdYGInhcjf1497Tze2eDI1gQbfvk8kfQdGlwg95td0vqa8+7baYPME4DFlR4CFvEUGbsbQGsRGMv9OWTaZPe3HexrcoWcExFgjVjPTr1dvYu+8DXSEo0ObEvfKBPveFT1oqhz5/pNCiwTpyN5op7Ea6f/x7mpF2L/GRAPG45RyJdtD1xvLe6ePBPgayBFJvDrD4+JvrLNIVZ0NgMOdyPeNrc6nVZgd5nZf7I/8ErqmKICUd4wKz9DNmvI+LDmYtFD9+2tXPwk3Q1DLIxfnY37eTgaWPj/lyVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9lDTlzxesNjP9cXnfEid6hd5Hh+ogWZZX9WoI1HllI=;
 b=NLo9FCB3BnwWuu6Bjo8Jpr8Tyj428zisV0Kku/Lx6zuLee7tSAlpHD+76IDWe7phT/3HFAv7p04OWWgPHKp9KByfD4wMMCrXI7NLrsTkn91jdPGAuTKYYZaJJ9pgKoraRbh8H4o2ePd5wPe4TCa0VbLEkYs9pImTWns9OBVrq5g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by IA1PR11MB7776.namprd11.prod.outlook.com (2603:10b6:208:3f9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 00:25:36 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 00:25:35 +0000
Date: Wed, 18 Nov 2026 08:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android16-6.12-lts 152/152]
 reuseport_bpf_numa.c:111:8: error: unknown type name 'bool'
Message-ID: <avzwd10TR28EZEyd@rli9-mobl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|IA1PR11MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: ad3d9e04-21d9-4f05-3afa-08df450a76d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|261009223027099003|56012099006|11063799006|261022075727099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: +6lpIDlmXHFmpW48Y4YXQAPxBiwPb1fguojAPZFrXroq7QdAPZZpY5SkTC0Czz5Y0EW0UYHbjzkniMoFObnufovnP2qUz5FNG22+fPkJc8WVvRwrBKMkKYgIc+bSViD6ncNP6XWMtVqLfjnhybXtca+0Ra/xyjC9fQlotbrhIu8fthSVhDGb2MJbD2RKwSSvBO/abJKvLyTJg7NW2OxwV4a0luzC34wtQjLOjaQ+GPWRAlnLGqHgMO7ZmisYjS876Q4y9FeqrFHYSMesqcdAcOhHeCkTtK17rm4vQsqqjqcLWB6tnjdclhCl4n/MlEEFATJ9aubTh7euye79j82peU2NP/vkRlKUV7+SFMy90e2VsWxJcOFLE7YVlULkk3iZyffhRL9TNmTqsbQlWQzSawESqMLgaqeVRV2WZ0NmNQ3UIRFKvpE7UywKDLck0Gw6Fow36BpPpxwF6KdDX/DOJiKRC/1k0xoc3IjvNBgMIof18t4iA/FAaJB7d8IN6W5XAQJLsS8z6hPKzaf1lW9vPyRfkWWKQLkZZOv4Lg44jU4QN2diV7h2cS7QCYn7RwC7fwAouQR0zbfLAQzboXGmCpj7P+G9kicSRqQEflOV9ek=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(261009223027099003)(56012099006)(11063799006)(261022075727099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gJv4+CwZkWlDuBkVDsdOBuVznbmTuYR1WtuI0nOSMnjeVkKoUIQDXtqkzKtS?=
 =?us-ascii?Q?UxeUrZXYijulY4fl0aaHRtO6XZisM2Rp1rqdcWIEKw832WYDiw1+EzLCgbUK?=
 =?us-ascii?Q?Cu9bXoqj3mEbF4YQE6jBnPir2YF25Jvd2uByq6oU2/UYYDnq2kolJ++kW/aO?=
 =?us-ascii?Q?GxNKCmFGG4ntUDiS6wg8OdTIbnidbPOTlj/GUWT5m0CR+TJMJxE+/7jmDgR/?=
 =?us-ascii?Q?VBh720sQnBp8UnOsDQK/zlBimOTvCNQLQCAL0dYmN4Ben9R3V47VJ9TvzS2C?=
 =?us-ascii?Q?c8+7Gsk5APBMqTWkvwd0+ihGAtLEeIf/+Q8ODp8/LO20zdpl8vcB1+MXTDnL?=
 =?us-ascii?Q?mhxaUduKe3W6N8cCArgmYq9n8hDuz9ArZrxiyfci1M08PymOj3Ao5XsFmy5z?=
 =?us-ascii?Q?NytIvYyRVQm7y69XheOowsYeLa+kdzB7yMN0fooPEx6bY+TXJNFMm1so1UTp?=
 =?us-ascii?Q?tnVDLO5LIaSnUIIvQOyGhssAMv9l0Frbt6r7PqMtEmqOeabY9BiYMYs2X1v7?=
 =?us-ascii?Q?3EZL0hZju1RUr/rACeK3VhM1d2oIHS2nb+xNWT2WUPIbiTDRbLPJyBkoCXwU?=
 =?us-ascii?Q?NcP9iRYVxuK3lNYaYQmmgFhMRxItrxfFNGMlivPD44rvNIGCryAUg9I9E+WT?=
 =?us-ascii?Q?nxgMiE5rkDL5hMOuxIwTQbqzXWKfYr7xjmo4L9w+4/BUjxJ5VD5F2YCcshQU?=
 =?us-ascii?Q?dyLb1jJauz9PFTbkHTNU/93kCBKieFZAHMjhXq39MvtS/gMWvhdK33q5CxKJ?=
 =?us-ascii?Q?i01AOF9iPC+Q84cr16JYu9AviyW91FwVY7dYhU09oxJ3LhgYAUDl3oVmxbBF?=
 =?us-ascii?Q?7t7UOwlezngI/4VJmUUKL9kzpwL1or6pfNfLWEuW+5Lcd+ChcZCW5l0232bM?=
 =?us-ascii?Q?lzjSIbCZydjRmjIzvPZT1lqfBU/8T23r5SOtOsMDmeLlDmgRoBtwfi4fpSzP?=
 =?us-ascii?Q?GV4O4D8amfjBFfA1lIi6OaSMZblTI742BpRVOwI+OFwkSVsGpwTTS4FQp9Qi?=
 =?us-ascii?Q?Azz8fpnxpomq7cT8G7URkxaOBe0dBVeYzNn5EpNgVGg957Oty5XuqOyxEPPt?=
 =?us-ascii?Q?BqXUOiomSNYOwVZaJgxmAbMGZvda8Jm2fPJNu4raoPgPjlrrD/Mf2q0erMCs?=
 =?us-ascii?Q?jJtHZxoZCmROAOZP2rSz4nXUj7KFLFLRU2UTVaN5oxAjslh/lUYBHZbujIIG?=
 =?us-ascii?Q?bWW4FjdbEUcEX0Xo2EBxGd8LF1tiqpRF0u5iA7Tf3CitLnTk8Oy5ptW6gi86?=
 =?us-ascii?Q?RSXlb2YqM5zieIK3lXPrLloHRxCY9sKZBM68qX02wIXs+ZgrDUdgtvc3DCX3?=
 =?us-ascii?Q?yMJilEJ5dBzKa4B5xJJAg/HCdYHUtn+U7OfPjQwYlT7+alSiOCRGScguE4Ni?=
 =?us-ascii?Q?mkk6bNm/rS2AwfH/UIr5iGUtnDnnSxRGh6jg9nx0kxK769PPazY+aVr9bTeP?=
 =?us-ascii?Q?pSMkPuxIH0yLy8FPICyWW8oo8Wcw/f+6kMc7A5e8AZopawwb7wVVM5D4bP9w?=
 =?us-ascii?Q?VG30ev/xAcCHYtWsYFsydimcbjTLAe5Z8hGMKnzu+I34BfLfwTGTKuio8n7v?=
 =?us-ascii?Q?5wbz53yOaEraXWavPvU1rQH3vmmeEuc+riewAV8RcUZ9YB1hOJJQMzPJofwD?=
 =?us-ascii?Q?u85UgK/bxBcDn3CT9N99fhT9DZihhouYkvWpyujBpbZQ19pKMTLPvwuwq84T?=
 =?us-ascii?Q?Lr+YI2xgL1jtmVD/G9FRXQHMgrmlzVF4hBpD2iqoBb82lI25kByHMP7wrnvp?=
 =?us-ascii?Q?CAoAV3OQKA=3D=3D?=
X-Exchange-RoutingPolicyChecked: Nelau465TGhKB4YUO2rstiYYbjUs5lPEgHCpAAZPwP0OV3usGL4DHPBmn4tOxetgWWrjhSJD3Q4697CrKPWe5LR0wuMba7MKYujeyEztEyJjlIDllss4Egflf4MGIyXmnxZapxH+TJU1DeCnDx+Xo8+YVYwqnuOUjvO773AMNHBrTczhLz5jl63dUXDRlU6Vr115BV22dEWasfpzm+0hQTYbsyuW9MQeKt5Y1YIw8yWzEa4dhX1rYB+XgKgzj09bwK8/SS3Le5MvDRbHFHjiR+Q4Z6lM8pgLbMu2mANxgbCOs6bBSKogohmnnucgwjTqd92kSuJQ5PbMEUOMWLhKzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3d9e04-21d9-4f05-3afa-08df450a76d7
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 00:25:35.8567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PrrOImF4ey7SGyfzJnOmNmtNK+hR05ZKJdgP0ravuQxO2UO4vub9Hcejw7SQfJ68zgeUG0704ZaTt131fotGxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7776
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: 14b39ed41b930d65901ec4fd4e4f1e7e72317c37 [152/152] selftests: net: reuseport_bpf_numa: consider cpuless numa node
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261117/20261117224728.dIe1dxGB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117224728.dIe1dxGB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261117224728.dIe1dxGB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> reuseport_bpf_numa.c:111:8: error: unknown type name 'bool'
     111 | static bool is_cpuless_node(int node_id)
         |        ^~~~
   reuseport_bpf_numa.c:27:1: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
      26 | #include "../kselftest.h"
     +++ |+#include <stdbool.h>
      27 | 
   reuseport_bpf_numa.c: In function 'is_cpuless_node':
   reuseport_bpf_numa.c:114:9: error: unknown type name 'bool'
     114 |         bool ret = false;
         |         ^~~~
   reuseport_bpf_numa.c:114:9: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
>> reuseport_bpf_numa.c:114:20: error: 'false' undeclared (first use in this function)
     114 |         bool ret = false;
         |                    ^~~~~
   reuseport_bpf_numa.c:114:20: note: 'false' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
   reuseport_bpf_numa.c:114:20: note: each undeclared identifier is reported only once for each function it appears in
>> reuseport_bpf_numa.c:121:23: error: 'true' undeclared (first use in this function)
     121 |                 ret = true;
         |                       ^~~~
   reuseport_bpf_numa.c:121:23: note: 'true' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

