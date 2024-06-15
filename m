Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0E519D8A2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 12:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718455535; cv=fail; b=Nhts2T44jkxOWxTfL+TNVgV6PB978lwwMH/4F1Js+TsElKdsV8dZVeRUmvGsnhhe1mimlGTWhEy6peadLa2cah/q/Sg+xE+m+bKUYV1x0f3yibrMWbixf28vbysap6EATlRWq0o7naJOzdxGLAKSUhH/XuOqBvf2At5vayqVq30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718455535; c=relaxed/simple;
	bh=ers045eTQVq7JHc9SaZzDzJKIJr7YiPAFiSpff46+pg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hpz+I8fGiMSg8tm3rKt1oqfjwi8FvbT2/kyK/t5kSEZ5HkPY9GEqAYbMpb9HamSbjK7cpAz6NRz0CSR+jL8UuY467ZW3OXKGqDdfDrpAalf7Bj4PPXrn/dBccs9BGbUjHzriKwepPbFFchWEo63M5XsZDRPUeBKNagrqI83ZSjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWd+N6e7; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWd+N6e7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718455533; x=1749991533;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ers045eTQVq7JHc9SaZzDzJKIJr7YiPAFiSpff46+pg=;
  b=hWd+N6e7WzOq3lUUHsSS2ctbpWHMJC6oFd/yFVcN8VmGYDxN2nLayQpF
   lqVnu1O+lTwPcS4CQfQjXaIbkXMkKsV1yvizv4se86TNkeRnAWmSq8d0d
   0VgC/x5oYI3V8tjbsl4mAzSnq07rgt3SyURcdZw7o/nHAAyZOSZPtrHVa
   X+g9nOqw/YCT/Cs6BljJk3PEsQESb1h9mrXaGo0WKOv3Ur6t2d9ttCG7z
   8RHUQMFppn5eaPwAuAgJf6793xfgHRfcvJhhReId5Os4Oth5KazTNM74I
   QPXI1MzeWaDJZnlnpljkVD1FmNDhlznzRWunYWJDM1V+L12njTRqkDH2X
   w==;
X-CSE-ConnectionGUID: pc7k5frnSx6xGaS8w/pimg==
X-CSE-MsgGUID: OpJul86XQt+E6+++V8Di8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="19198362"
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="19198362"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 05:45:33 -0700
X-CSE-ConnectionGUID: uXryxhZlRh+tHR1Wrk1PHA==
X-CSE-MsgGUID: UCjZcVNEQ7OtKQTiqr+C9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,240,1712646000"; 
   d="scan'208";a="41483293"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Jun 2024 05:45:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 15 Jun 2024 05:45:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 15 Jun 2024 05:45:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 15 Jun 2024 05:45:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hp5evq5LgYKAa4flm66rR2jDDfg4pwFpGdxNiEsSEyG/o5HUWpzMQw82S8BwpPKVZSjV8DA14t1DZO2fKn0wVNybHIBRZt84Cu8BEtxK4+bjJwIhXsn1L6dCAhR8dFJdxgjEBKDIywMOj1JVGytQjGhfhg8jKo/RhJ+AOOEVCQhDaB321RnV+HUP2A7CzRjGIK88U1iDz2sLBjvIashHvpZfhhaaTJmvF+fanzKH4GYLrxAzXVXIeSMFt3vA7K+xRU2h/9YyO4GOkiozNCjU8VNFy7jxdt99jKD0bWCFCsE4ilZWKyCozVk6rGifuP6g+aMoF7XRw7yfxqaY88rFaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQmGM22iVBBDwZC/UknvgQBgWHFdCiAJA/TL1rALxqo=;
 b=kqP1LegPfKY7K6OeczwRCYzY5UyNyEiWcFkiRkzHuR8Z/fnJfyLmC62wQyOU0py/J+kgfWH2dAtU1pngE0dhxagAWB6oo2x+ys/Vzr9mp5Nl+qD1dVQnyqVvHRvMh2kXMH2gbE67ZXscRk9TrpVQUs9oIJ6adaEcBRn1+2mY3/iiFFxYQS0vAocs4svFZXihrlB5tB2Wfavn5OdzE0+d87dznpzZmGD4A+5zug+w7vMCLA+x+42AX69YZlRz0Wq0HfhncSEy+i5s0gI7wUFoV43fqwKBlwHzjIrHp2aFWeX0qlSmZKcJ1j2/vl173zsVc9FEgMN8OcHLauVPL14Pvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.28; Sat, 15 Jun
 2024 12:45:29 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690%5]) with mapi id 15.20.7677.027; Sat, 15 Jun 2024
 12:45:29 +0000
Date: Sat, 15 Jun 2024 20:45:20 +0800
From: Philip Li <philip.li@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [mediatek:v6.10-next/dts64 44/53]
 arch/arm64/boot/dts/mediatek/mt8365-evk.dtb: /soc/syscon@10006000: failed to
 match any schema with compatible: ['mediatek,mt8365-scpsys', 'syscon',
 'simple-mfd']
Message-ID: <Zm2M4C0E5rhrK90+@rli9-mobl>
References: <202406151352.R650eixq-lkp@intel.com>
 <1fcb8eb0-add5-4b0d-8aba-98db7b6677fc@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1fcb8eb0-add5-4b0d-8aba-98db7b6677fc@kernel.org>
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|PH8PR11MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 6724c6f5-e4b1-4e36-622e-08dc8d390947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C9mXAtxJtAdreFiiZGP9Qr3s9EJ8QpjwFY0ep5S8wmsxBud9WUuj75uYW4qJ?=
 =?us-ascii?Q?RNlHDrV/QILmtFIltwBPTtcSQomKnORcykCLDpr2AQka39kUMv0fibhqCu3L?=
 =?us-ascii?Q?VblvvH/f2OoCH47JzM8Kk8mk/nClMM2lpk4GxIMW4yteIElLXvNT5RL/0dll?=
 =?us-ascii?Q?9eQXL30Q3x/xDz+tt4eseaHP84z6Uwov1QYl+qAiDWahxHiQosw71M8goQvB?=
 =?us-ascii?Q?LUPda9+UDrAfGsgm0oTSVYnUYyoJlxtJYsDKaaQU9KabAnh4cKupaRRFD04C?=
 =?us-ascii?Q?nczBBC7rx9Q99pcp+V34x58NK1tQQKbASw2DfT9BinRCSx6li9+JzUt0Alvo?=
 =?us-ascii?Q?ijJcKN7So7ezz93ubkUmoLRbmeftzinorJ+zo9bDJq4/t2I4P0Ro/cid1wa+?=
 =?us-ascii?Q?FyQ2lsSWbfGhATKu2RC9sdm3xIp2ClzfGRRUoRgPRzLl3y7LSrxK3+gPPoF5?=
 =?us-ascii?Q?gjOW8x3wo3PZrmX+lBAr1Kk7PUW3xHz06qecxZyV7PDqUcDXcRSjYAew7+pI?=
 =?us-ascii?Q?KZM3RmZfUu5sLNofjE8cD9DTvuy9VXlLfzx+VnFue7WnO2gGmnbpjnfRjnuD?=
 =?us-ascii?Q?qpZxAv9JpsG6qsGpROrcwJfeCRPkxp8h+KWBRLHzwc1DtmyszWZAZ4c2IdJ5?=
 =?us-ascii?Q?KdireCLBzeUgPUFvxCpeLdmWV+liWJ5dUTYy+PyuUytDZDl0Bhib+1r2b4cO?=
 =?us-ascii?Q?g+6O75TWW3lNfhi5D6LOIaI7E7dsLo6y9M62s4B7JHbs76F9cDZcfJmPdxBE?=
 =?us-ascii?Q?3MICCpGGNiYvDNjOA3Z7WPGNPZiemzoJERhFPcS9GlRjP56Czs5weMDHkwUM?=
 =?us-ascii?Q?Q31v/yVtCcMLQ8L74pJI4Zk65k8Bd6OQ6dEwZ3oFm7joXYww9z7pdfsxc4Un?=
 =?us-ascii?Q?PpJwTSGI0CdrCptqSO/QGZOJ2nnQhrqOm/bvPfJK+hW+bIsykcnF1H3DMQk9?=
 =?us-ascii?Q?1brCMeneC0jCC4Su6NlfiOUZHcyBhIkzdQEx4IX3bNqOL/8/lGLpugPhommT?=
 =?us-ascii?Q?45uaseH10/jCDHRTsVLVBQ8xn9f9DuMQaNMQauDMZREbG+f0jUGYhHzJjRLE?=
 =?us-ascii?Q?CQSBJJiQev298COqjEK5KXuOk+ILASSB2yyiDOCHQ1dLBSeo+43N98daBX+D?=
 =?us-ascii?Q?xPlRNpYKTmWU1yVS/K+W1ZhrXtXEVXuNliGqWW6qfB5MlpCSj0CjcMhvaBdx?=
 =?us-ascii?Q?XpZih1kSioiC8IFEs/JrPvghN/UyCd2ZIV6uE2rS6afq3NrYI7xV0re/jpMS?=
 =?us-ascii?Q?OHuUX7fWqSdfgwVreBdsKAUxE70l7QCzISYqKnJ/ORHn1SJfnUjm8XKwMmfg?=
 =?us-ascii?Q?gTNgRi2FyTn5b7PKU1kTmDto?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ro3N6dqqdVatZYoEAh41MNmjxwiQLAjFzlIiDuyPo0guovNFnOB9DIKOXWcg?=
 =?us-ascii?Q?B/FMASwyG5KY9Wv/UGPWH/XJn2twcgn+7Runu5X4Um5pctOaqw7aVxdA7VQz?=
 =?us-ascii?Q?xoVeKRiu61x2KUoV21GwwolZq6gRAMNteKbXzut+DXT7xcRmz2Q7ISCUBvRn?=
 =?us-ascii?Q?nZTCW8I59nokCdCrY9Tf7chORoNkft9JNiwKAu0NcSBCdhSiFcrPxtKE/J9O?=
 =?us-ascii?Q?CZ8oQlMGrQ8bhXYgwDZ4r0QI4Eoay25oGcmtmow1zYLDHmJhx6Y8BOdVkQae?=
 =?us-ascii?Q?I80t4NAeCJG2TeeRAw0higiWXdF8BaZk1yqeB0rYTAxoUh7Zo8+dSgxeBcQJ?=
 =?us-ascii?Q?o8zXgqMa1LEjScin61NY4pbLqrFfoU5QozpfYgx3UN0fdrLfN5zJ/SWvwRKR?=
 =?us-ascii?Q?EMf45Htzuhlf/VPJwZdR7v/DL1WZD+CTonYYqhAVjIH0yZqhCCxbG5VpWjQ+?=
 =?us-ascii?Q?68FDx+OV7Hu3zMfQuD+bLQHupNr3gBTGCva30h8x2xu2nxkozYCHr9NjOkRq?=
 =?us-ascii?Q?kD7iMwRReHhMsRqmTjQxpYezkGv1MaiZRuyrFDjbxvKTMsFxQXfaNHU6M6cW?=
 =?us-ascii?Q?700zyzELHhdT3BUpqO6M+aH8wNuGbDe1VfYJdGy0LxCs+OeNLM65qIwTMGp9?=
 =?us-ascii?Q?YaekM/pZsCmtlR114ZVuqLBaNPAfyiqZ7h5owER6yPQZYHdPbHT3ui4WgCbJ?=
 =?us-ascii?Q?qRhfAx3L9dpXPNe0/kX6VLwFSKOu/skRXr+MjhyZ6l3Kzyv9czUhxZYxS6su?=
 =?us-ascii?Q?n0AFR6yTQIgO17mU+izcw3njGsV08Y7Lin5lyb1SE37e5dzt2Pv3pedFHk/D?=
 =?us-ascii?Q?KFTCr9iu6Y+OUcVnGxcZkCMcw7twtSKAGtwuBoaj7w0bS6pMJtlsZAjPPMp1?=
 =?us-ascii?Q?iDfmh614721QVjOWdXjnFRtcyUvzUHiR6+EWfZYe5iaOT6dvcVI9oSuMOWNZ?=
 =?us-ascii?Q?jb0QHixJzbay0L6AZtlAU4y/Neur0pv/ZH5mWRJsHIkPC9SzC3/Bm2k1Rnrq?=
 =?us-ascii?Q?W4AuZm1XvYWCLtzLKewq7Ijv3W37XMEuCmGyjMVfXAUngmZT4ZhrFMXussDN?=
 =?us-ascii?Q?VIYoSUfms6CRAYu5vjBGqXGkoojznY89R2NALoGBD6/Ce4NFfcHkun65g1zB?=
 =?us-ascii?Q?h8Az71f1jcqItLbs9fLjYyee0GqiBfsxuXkwzY/aOYdd2GDan2K9JFiB1ImU?=
 =?us-ascii?Q?/Jz3qGGLpKl6nzD8pP9wD47azZWor3VkjR+Yvqc+y9R+HYhOdmCWRf79RvA0?=
 =?us-ascii?Q?xW7+0RTqQbZvDNhU8K99MAdLl8QP1tocSdcXZyKHK1uLJWE5liziiP5pcHgl?=
 =?us-ascii?Q?xvY8IBEpbBhnY8BxJatUM7dqeSlj/Qz2cAZTw2UbpIxxLN3sWc9wIYnO6ZYU?=
 =?us-ascii?Q?H5wdUdDvUvPnav9PwX+971bnibfp/DhlF8wkuM/qAxc2cIQQY+iEvXjEnaiP?=
 =?us-ascii?Q?0UYUsrFUQxteyeROdDkHEItzljftG8PG0djUnnmHUXQD9sUZQekhh3srO0Vq?=
 =?us-ascii?Q?dwnJrp4cPja5aTimNDTpb23gcTYMo6jK5KU1CAtq8NTiILZudDWsZB7FO/SY?=
 =?us-ascii?Q?GNMGXhaKwzLvNe2qWPMvmj/7g6jOnAUrBV4CoMss?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6724c6f5-e4b1-4e36-622e-08dc8d390947
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2024 12:45:29.1138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uA8XQaFuaaNoWXXSkYqrkp+rI8NmMqbKnzffn+tIThXp6YSZNOXOfC0lBxD1Khwcu70uLE/8foPSc0GmG/Js4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6974
X-OriginatorOrg: intel.com

On Sat, Jun 15, 2024 at 11:30:48AM +0200, Krzysztof Kozlowski wrote:
> On 15/06/2024 04:59, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git v6.10-next/dts64
> > head:   2f950510411a33d98eea28c22d7880eeb48adb61
> > commit: b5ded35667ce9eb330083116e67af1f2f7886102 [44/53] arm64: dts: mediatek: mt8365: use a specific SCPSYS compatible
> > config: arm64-randconfig-051-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151352.R650eixq-lkp@intel.com/config)
> > compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
> > dtschema version: 2024.6.dev1+g833054f
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151352.R650eixq-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406151352.R650eixq-lkp@intel.com/
> > 
> 
> MFD patches are pending.
> 
> I have doubts that kernel test robot reports on each, known DTS failure
> are useful.

Hi Krzysztof, thanks for the info. Do you mean we can ignore the DTS failure on this v6.10-next/dts64
branch or we need ignore certain patterns of DTS failure (that is caused by pending MFD patches) so
to avoid useless reports?

Thanks

> 
> Best regards,
> Krzysztof
> 
> 
