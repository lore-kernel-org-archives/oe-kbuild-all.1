Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6D2169AC5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720082895; cv=fail; b=OimTuRMAPqIuF+cCNiGaUe1kR5aQoHj6su3UTNaw0tdaI+QvFZQ4CYMhzquX/QSP9LdWO4THmcvdo6YcmQALVjY/6Ndog6/1yrPzh536ApmIMsogVSWtX2PG7w3d8kmJWsLiyPLHUKlpnYPibkBLLz1EdkFKSP8jNKx/QTMyAWg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720082895; c=relaxed/simple;
	bh=YY003gsnC0DyhpNMDOzsXN86CgIjHFwLEZdzv4Tv5is=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sLZNudZDLl+yFgyabU4CZgnp92WoUVUqcVMWhdvl1gZ8eajN5Mx7R5/cf9kvS/R2e68FvjEBH4J0Si0H8HJaRdjAlUXHjAIulpc5kexAVgWFnBykxGPDdUEKSNkxbuGham/0dUlK7BLcXwfrsWroJcRK0XnGcA6cgh/tWOJ1GV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bX2Jo5LN; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bX2Jo5LN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720082894; x=1751618894;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YY003gsnC0DyhpNMDOzsXN86CgIjHFwLEZdzv4Tv5is=;
  b=bX2Jo5LN8PATSfRzAsh52dEDehfdC8rHjdKU6BM6setHx3VHnvM0pjjR
   YCd0sjonaTRwTBmegbGHTHKHGNZXRFw1fErP5VXJ/Dk3B3HGgD93vQfZv
   aPY66UReRQ7a9Kcy8Cp1BPDYdP985fVopBqq/YH9s2o7H785xNi8IEBAK
   LNqAliu5qthaxk9Rhee1aleE2xyEn54lfEs0i36Qts0ruOewsB2MCR38L
   Dz/5soS+WWcVBsARvCh9MOSr0IiUD1nwb+xhhzp0hXQOLcwiT2rwUBLVp
   dBwdaRz2RPGqIn3udPkeUomqAuCxX5VrcWfa3b2UFt/EXXP2DTxqkY6dY
   A==;
X-CSE-ConnectionGUID: NPjAOxyqTYKER8Dvo3nRmg==
X-CSE-MsgGUID: eF2ZVjuQQs2uXNEoa0HzfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="42773927"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="42773927"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 01:48:12 -0700
X-CSE-ConnectionGUID: oYCChP/1Scm+gNRmJy0dmw==
X-CSE-MsgGUID: XJ7eS66bTtqLc/Mnrz4u3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46675141"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Jul 2024 01:48:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 4 Jul 2024 01:48:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 4 Jul 2024 01:48:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 4 Jul 2024 01:48:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 4 Jul 2024 01:48:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqdJrsE4YFE9oxpeGImROx/tmiB8mHbDEu7/1HBycXqh37u0CzIQBSXpQx6AlhpHmuImA8ukChQ5uXdVBlnN/K5YD+Y9haqlRDhjaoPQt4celJZl+2FNe+brA2m1ypGUcdsltXRSeQhkQJp13yOipVZv8Kc8KSlR9AjZys7v9d5L/eskiKqV3J9JPQjzUgUw1ueHAnhiMQkjsNN8haklafo7ZS6S7MFSF5nP6oHt3V/QVfjWsKTXtREhNv0V4iDBpWLTqQQTDGgTlGV0Znskj05xIof0UbH4IkhfD+7DtfJdfcYzTh6+RUq72yZhLnW+K2JDBA7jCaio0SzThcyIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=We3pV8o/2Pv5jRsOrB/dE2epikEtf3m7tIJcLsLL/7s=;
 b=UE8j/q2HsKP2H5amqT93c69pWayWuGxr41XUiMtqgWTc6VO/NCSd1XkQwxbyyJjeX7bBc6PpqJ9B3XLVJnTFWCLLp8f8kmgYqBPrHE/oT4G7dzumh+v27miuWBoPxi393/Dk3Kemc9rUJ0Jp28VHvz5Y8AjSDg8KFEWWDKigSoPcOMkGCEVVzXMXHm97XZkl2eVBQGBwIwqUNOBM9T7nNdVczOVBQNH2HOYRuSlGQdld9bPK9irhW/q01pX3HXDZ5HltXv0bxvYxDhI9ChG0iHa6CPZnPUB3xqA7KdjI/hQQUGy59S9ksNpmynz8vtQGSAtlFc4HhTqHexkSuGSAxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Thu, 4 Jul
 2024 08:48:07 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 08:48:07 +0000
Date: Thu, 4 Jul 2024 16:47:58 +0800
From: Philip Li <philip.li@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [mediatek:v6.10-next/dts64 44/53]
 arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: /soc/syscon@10006000: failed to
 match any schema with compatible: ['mediatek,mt8365-scpsys', 'syscon',
 'simple-mfd']
Message-ID: <ZoZhvjDsHSHtvpP3@rli9-mobl>
References: <202406151352.R650eixq-lkp@intel.com>
 <1fcb8eb0-add5-4b0d-8aba-98db7b6677fc@kernel.org>
 <Zm2M4C0E5rhrK90+@rli9-mobl>
 <09d83e32-762c-4e49-a581-5af4bcc0872f@kernel.org>
 <d5921989-102d-41bc-9b1a-98f8b39d2ed9@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d5921989-102d-41bc-9b1a-98f8b39d2ed9@kernel.org>
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|SN7PR11MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 42582d09-1057-4e4a-0e14-08dc9c060649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mZ6ZBzmePwC64hvSrbSPUelKCzqrp2frVpGc/LXzVQ/XY/5oa7yS5n3QGsCe?=
 =?us-ascii?Q?r5Cxoucc15ywu8fJCmHWGp556ghV5J3KH/jC4O09OmAG4lvt5SNNwRBS3Qj8?=
 =?us-ascii?Q?KBm02iUE3NVPz59VtKHBBfaOfO3NZj11YpPUmVy4p1c0QUVrsE8hkT+CWGrr?=
 =?us-ascii?Q?aErYKcha6hm4dKsBqdsWuw5TaaaPl7XKarzUWo5WG2kGnhPNTvAtXuPNuGKR?=
 =?us-ascii?Q?ofvnSWlxUDkwXpgAcnJOsqcgfPpFBjau9vLQ9R1ThK/QMZvIIx2FuRvp88uq?=
 =?us-ascii?Q?Ub/lPHyYXlg3oBGV3XenQ7VoeLBAfhUp3errl1Ax12hO2MrP0xhmd0DM/gel?=
 =?us-ascii?Q?G87v6aXiC3hyfQSVyk5AnZOyL5MvOsoNv3j7HtYFkmDa/lSt3Jp5JlqUpT/i?=
 =?us-ascii?Q?m6XwhiN0s34+rBGU7Ezv5mVULToPlloIDd74qlXUzY4T2J2W2b6xizb+IJVp?=
 =?us-ascii?Q?Vom2G7AwwzkQnfG23ntT3c7FKkYzP7s2XWwWBDqJb61wrHRh4lL2acAvUjF6?=
 =?us-ascii?Q?riLzZv01t6C7wQpSrGnrE0ZEgwCYTqoVfss0u44VwWyEfD+mPY/4NOCEu7E7?=
 =?us-ascii?Q?2GbHXzSBM0/WvYmf/Tf3fnsRbyKZaqTYk9kPdKJNQC6fG9sKywqLylgPpM2L?=
 =?us-ascii?Q?vsBHCJkJ+PF5fL5I/XsVp2ybXWvgYCrwp4N3WwQb8gBdeYlRAqRHfAsRNhPA?=
 =?us-ascii?Q?6snr8ztYaoZMLRKymKw+9Dkp0bwfS/nRzRB4phA0tMhHR+4ZtvHZ1NfTGlsD?=
 =?us-ascii?Q?eqQHcb39sm7pDqYAriydfydkKqz2q9jSeDDDDMhTOV7DjunST5uWLnAAhdTs?=
 =?us-ascii?Q?HlLHmwyrligETuBn7WKiS4xO7OoHJ45dytQ3S/n4OcsG/lMkBzqZbAK/zyn1?=
 =?us-ascii?Q?17txd5LbJ7F0wpCBhNokYJml+C8e3mUxiFlIw+OIPRINUKMIOtEXVUjeU9VY?=
 =?us-ascii?Q?7StS7D3E5BUbmkAZalZwwnQmWyZWnAdLWP2rich457WhUZt1SewpM3VeNzyF?=
 =?us-ascii?Q?KzPpp2o6EwwO6oMLmyfZBWpF3nJEy4sPOSwX5fae/aBK/rtWL664mZicFfQM?=
 =?us-ascii?Q?6tef28IOoonmBSYND56q3KNUIdTkZHGFH9kxVhxpeVXawe1S8w12jxMZRXq9?=
 =?us-ascii?Q?0ZHIkFE8D/pSmq2dwXD+iTkQfM0MMgjiTRwwLRfhQAIvu7komfJJs5HSvDQr?=
 =?us-ascii?Q?6tOnfqzMVi+SCE0GuPJyh8z3XJ+Nw/sbPOLupgGbhsyrxHl/Ug+kk56LxSP3?=
 =?us-ascii?Q?LV3VUEbYG9LZJB3cdqSbDsZOShkqFveavGRzB3fi/M6cg2aegPNcCSp59OW0?=
 =?us-ascii?Q?fAY7OFkw4arAN26Swr/0OEWhbkuwtXFaY1UPTGJ9qJVFBj6fgQw6BWmetmFf?=
 =?us-ascii?Q?jWUzwIE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VMn2Y573dL+IzSozadg/Bw6jakvBIPfhhEa1w9ocyLxkKHJ2/kboczmAGRVi?=
 =?us-ascii?Q?udd4GrTzbTFDxkOF8hJjjOcrTboK6k5NizxtHW/AKkz5nGAw/Zf6z+YUEq/C?=
 =?us-ascii?Q?V/LFGgQkUUR/6RAHrhAh+yoqrbqwKwzsykL7pp4TvM444vrt/EELsX6nG38I?=
 =?us-ascii?Q?C1IPyYE/Kgxqe8J415Qrn6KEjpn8GNtZLk901rK+uB3fXsjyh2Q3wEPmnIgE?=
 =?us-ascii?Q?qbXGttpKWE+nFfu+TYi+o9g3I/O1wgPxxojnRZv/weuXMCTMfHk3RGAJbWHG?=
 =?us-ascii?Q?eU7TrqRgmpbzkFZ0zTYvg3L88+Wq0qK2YZaqQgoruEhK8q33DOS2LDMUdSsc?=
 =?us-ascii?Q?LOdNH+u2msQVCzVk4c0nqVWvKoXw/Kcp/qFpybtmAHf+U8inPUCsGv/48PJ9?=
 =?us-ascii?Q?aC/hF/ir5YKi4ntfJTffaym5ZuYSmKch1HdJcX1nZWYntnEcs1jMNfFDsLjr?=
 =?us-ascii?Q?afosBlMCnH0XlvjhrssGMpHybv/gywhodB5+2ilfo/Pk7OvW4F8Z9NWRdRZc?=
 =?us-ascii?Q?zgdDXleJavrtZaRMVn9IYVehABXl/gCxKDDBJbFVbuCd1gK0iWtrPBRm5c7C?=
 =?us-ascii?Q?ARJ5Ohq4QQv64d4hwfvXd2ueVURFjs6jRBeMCISNHoE8W2JC+nn6TgJnIuQ+?=
 =?us-ascii?Q?5g8vw73jzTHZy61RZ8waw+wKJi3xjrWx7KXKdPQDobczqgQoAL2lMSE8dPBp?=
 =?us-ascii?Q?f1szt5a1RDyyEc3xKWcM1YL/Z/Y2shSeS3zoTJmZGpeVrrRFkHZCDK1GI0MS?=
 =?us-ascii?Q?RWHBCanUeTZkt8XygydLcFEnzEAGMeTUOq1lnw7E1/xKeKCMYLMr6nzb974P?=
 =?us-ascii?Q?fWdR2uoAvbkQU3BK7+ythKZdHZjoG8+nyGnCJnVCpPSOHzOh/sxW4yPBOJdK?=
 =?us-ascii?Q?mZaCpMzyeXPoqHf3G41qBofE6c+E3X9cdhOQ8R4wEXo49SjKTWMDqjZ4yEOj?=
 =?us-ascii?Q?9Q44yIjpNXG4iK0ImaH+LnYB5bT7+6B+GlDVm8r/GT62SQFf1WjRRazNPB0J?=
 =?us-ascii?Q?lFOVWzNqKNnC5R/H4FcikipaUYDmUghFKXx30TQuxyhlTdwsMEBwwJHeLpUU?=
 =?us-ascii?Q?imqDAYetqJDRdQ58y1DGuutVFXPaEeKrguUdt9LA+j4K835v5LUK/fh2PeHh?=
 =?us-ascii?Q?6JNjQQtbe8hGLBH2c83J7yE3QsiLGjsgZwEIfGAgAQpAIAr5C9AZ1a3jFGW2?=
 =?us-ascii?Q?1TZtiqiYwPk+NpWD4qJpGpvikLqRBPIug8NPWUbrmvDgfnisPF1mWjk8N9bm?=
 =?us-ascii?Q?c+dqWXATpAWhMOgXREDvmIgL3UiGBFOp0Lz7A8jsuL6xnaODTbTx5qTMc8HJ?=
 =?us-ascii?Q?Hs9cGB8xQ7Lks3c0Rz30buVPYP9y5LsCAS2fkWiKQ0cTHgmp0/OV6SIEJ6Xy?=
 =?us-ascii?Q?u0NUXS0EZp8dF+h5JdirbYfVDqo7imiC4LWO5sdf3r1hiBJ68IuKmeIiOv8A?=
 =?us-ascii?Q?9UcrD1Paz2/oDyCOINaXt68CYA/uwB06+eDvAG4l7tLHaFQDKTkt0hussWIy?=
 =?us-ascii?Q?w0QSSrjGavDAuc8Y/o6IHlfJPw925zsAtu990ZSJ3k2OcqtE4NAmw3AJFN6A?=
 =?us-ascii?Q?Ywk8JFUIBo8nBhBR0YTjHlGoOFIp7B3Dhh4yZHTh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42582d09-1057-4e4a-0e14-08dc9c060649
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 08:48:07.1598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6F06Z8JCCscgM31doMpIaWb8udzRTnfPTTyRGJb5gedyoSQRKlpKNN3j/V+bAjWm+sc305vOv/JSeJk3OU8WQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
X-OriginatorOrg: intel.com

On Thu, Jul 04, 2024 at 09:34:24AM +0200, Krzysztof Kozlowski wrote:
> On 15/06/2024 19:54, Krzysztof Kozlowski wrote:
> > On 15/06/2024 14:45, Philip Li wrote:
> >> On Sat, Jun 15, 2024 at 11:30:48AM +0200, Krzysztof Kozlowski wrote:
> >>> On 15/06/2024 04:59, kernel test robot wrote:
> >>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.10-next/dts64
> >>>> head:   2f950510411a33d98eea28c22d7880eeb48adb61
> >>>> commit: b5ded35667ce9eb330083116e67af1f2f7886102 [44/53] arm64: dts: mediatek: mt8365: use a specific SCPSYS compatible
> >>>> config: arm64-randconfig-051-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151352.R650eixq-lkp@intel.com/config)
> >>>> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
> >>>> dtschema version: 2024.6.dev1+g833054f
> >>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151352.R650eixq-lkp@intel.com/reproduce)
> >>>>
> >>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >>>> the same patch/commit), kindly add following tags
> >>>> | Reported-by: kernel test robot <lkp@intel.com>
> >>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202406151352.R650eixq-lkp@intel.com/
> >>>>
> >>>
> >>> MFD patches are pending.
> >>>
> >>> I have doubts that kernel test robot reports on each, known DTS failure
> >>> are useful.
> >>
> >> Hi Krzysztof, thanks for the info. Do you mean we can ignore the DTS failure on this v6.10-next/dts64
> >> branch or we need ignore certain patterns of DTS failure (that is caused by pending MFD patches) so
> >> to avoid useless reports?
> > 
> > +Cc Rob and Conor,
> > 
> > I meant, regardless which branch and repo you test, there will be a lot
> > of false positives in DTS checks. The problem is that often patchset
> > consists of DTS, DT bindings and driver changes. The DTS goes separate
> > repo or separate branch than bindings.
> > 
> > If you test them independently, you often get warnings, but these are
> > expected.
> > 
> > What matters it is linux-next, but even there patches can end up with
> > some delays, thus causing warnings.
> > 
> > I don't have a clear solution, but I am afraid that after seeing many
> > false positives people start ignoring all of such reports, regardless
> > whether they are real or not.
> > 
> 
> So now it turns out people actually remove patches based on these
> incorrect reports.
> 
> I am not sure that you understand how DT bindings and DTS work. They are
> applied on different trees, therefore all your emails create huge amount
> of false positives.

Sorry about the false positives. These reports are monitored for a while, and
based on the feedbacks, there's really no simple way to handle this to make
sure all required/related patches stay in same tree.

To avoid the negative impact, i will filter the reports only for linux-next
and mainline to be more conservative..

Sorry again for these confusing and false reports.

> 
> I started receiving a lot of emails from you and it's getting time
> consuming to even sort them.
> 
> These emails confuse other maintainers because it looks like a valid
> warning report, but it is not.
> 
> Either improve your system or do not send these emails.
> 
> Best regards,
> Krzysztof
> 
> 
