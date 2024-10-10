Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FB01BE239
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 10:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728555682; cv=fail; b=FCrVAsv+uHo1BLVoyO7/pKiVixHQu/xXtytzERwSj1ZxepoxJprDlaI8rhg36C+D8GGyFhzam0m0x75R7aGizElGkB7Xg2C07PBmqRmgJFyeW3jCC1bO5B33sTLnW0Plms/CRr5tYVg+Rya8+k+Qk/TclNS8wIzqqt4ACj9XDow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728555682; c=relaxed/simple;
	bh=7K94//xMUTsc+6Ln/+pQAByE410PIVmf+TpJjuk+7Vw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uesa3eXP70jKbb7xNRqaKnfNMiDcxq+Yw1n/aiQphJIXQhMBcWeeT6hXLLTcNKIiLSZvDui+auadzDxxItniIrDBnWO2GBMEkrzIzRO8UlZvXskgkEd6rjxMany7TbynxH+p/ANOmjs8pUnX90jXJJ7QgM5n8jarBlIUA1s4Ug8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebRCSmLr; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebRCSmLr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728555681; x=1760091681;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7K94//xMUTsc+6Ln/+pQAByE410PIVmf+TpJjuk+7Vw=;
  b=ebRCSmLrr1RZIgazb321yQku0RpWLi2XVN6iRX7YmQSpDZN/+Zp3EGGX
   a5N4liKqmLOyc3hjVg5ThHXw9Fj6qROmf9DRwxZzU+1x6mfwMW9kgtDQE
   xfjyIsMYDo6KNR2GQ10bOwj8ADHna8x6FhiMJtEyli8NyJr6tiOo4c044
   BNMValaDbGegjrJtE70In7IZFhSJP5ZF4vvGGpYOl045WI5iksa8pdtZh
   N9WT/jzwJTHN5NVvmjGH5OFP1uwbikvBuD1zHRE5gqa1763PlDcg8CX/q
   r0we9Eg5NhSJEGAdjpITfESsmkHsiUX8mKA/zZNISftDYu65njTtegPl6
   w==;
X-CSE-ConnectionGUID: 3LT4EGaXQWCnvJsPSRUxFA==
X-CSE-MsgGUID: +tCC9/pyTYGlrsJHe46zeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27779913"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="27779913"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 03:21:17 -0700
X-CSE-ConnectionGUID: xA/uDTjpQjCI52BVM1DZ+g==
X-CSE-MsgGUID: gpH05M1ZT7O7KYkaS23Huw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="81348169"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Oct 2024 03:21:17 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 03:21:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 03:21:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 03:21:15 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 03:21:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=palm+c0WikUmL3nMDpFpqx9BliYwGghXH7iAwZ2MLedcks5BncGSOJgEGdFLRzH3nMKxfMFtWIre0RYmMWLVZpQQVsxQ3oQom7zbKV7lZr5kfhlTDzvSpbWeuhXABM8CSyVSh9lXbxN5Mb33OFyZ+6h9zvlI+mO6NrUnrNH4B0NQz8sdz/f92BD3e4rWcjDXshfOXcZ45GGX9JWH4EEuYzJ4FkErQ+coQHigIVW4uBLriT0/XdIaQjfWjHfraYWIBt2D9xRYa/8nya9vTOfg8KcCYhF/3fIx2FG/UmPvqjeRbIN03xVeLrhznXGrCDAnVUN2yQbNmAb+G84g6X/x3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUEK0U5yjlqSmWqy59xOx/jfj5to5b2lxUi5CAs35SA=;
 b=FqByaLo5S2ieR5LL9JGscF7sHek8TU7x044A7vXm7W/CVUyA4I+BMpueEBMLNzEBNX8Y9LoW3rhA7h0RWx+9HfqZ9MCAaxa89h+w17yocUhDXrAdwDkwPIgw09d4nasK1yE6qwRNV6LDQxG60uDSBxUzJFU3SPy5W5vApxspCjCnfQG5xJNMK1e8AknwWiE/H3mqvwKgJFhtuCWSYxn4iygAUDfbANPFDI7EQ1sYRxGwNc8b0PARlXsZ6Usu2yC/6vdku4uK68Ybn6hGAcL6uDBSiJKYuHgLQctncHbI6STxvs7HQKoSFZZYGDtsSJoZfvYvZBDEa9PZVJ7ClH4KGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CY8PR11MB7009.namprd11.prod.outlook.com (2603:10b6:930:57::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 10:21:09 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 10:21:08 +0000
Date: Thu, 10 Oct 2024 18:20:59 +0800
From: Philip Li <philip.li@intel.com>
To: Marc Gonzalez <mgonzalez@freebox.fr>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Bjorn Andersson
	<andersson@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, Arnaud Vrac <avrac@freebox.fr>
Subject: Re: [linux-next:master 2288/2853]
 arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb:
 clock-controller@c8c0000: clocks: [[31, 0], [34, 178], [144, 1], [144, 0],
 [145, 1], [145, 0], [146], [0], [0], [0], [34, 184]] is too long
Message-ID: <Zweqi6WL+sTZ+sPb@rli9-mobl>
References: <202410090230.1TqAdril-lkp@intel.com>
 <bcf56fde-9f5d-4266-8249-d6489bd95c35@freebox.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bcf56fde-9f5d-4266-8249-d6489bd95c35@freebox.fr>
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CY8PR11MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f4eba0-5889-4159-ad54-08dce91541aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RDIKo48QWMG8dOJ4/MNe7ltfzcRuWpA5+syuFOGZo36pTrrM/pG4D3wTPbIV?=
 =?us-ascii?Q?L0/TZvMaKOEInmKe01hHT/2CxAcwed3hshMx1cJFsFmXAf77PXlulNCfEKwc?=
 =?us-ascii?Q?vDPPynXRh7tF0L1eGndpNXHfgQNlM/+kPKqf20SMMjNYCbA1+9UMmO4IdfwM?=
 =?us-ascii?Q?jagmY9i7FGYTpqV9ITSw/1FfjIOyYf0JPZOGV+yswFV6GW9f4o4QigffviLL?=
 =?us-ascii?Q?HbD3MCcsERI92H7MjDY0Q7mPakPxlPNzV3ksyTjf8fauj2JnH6ubyiboAlox?=
 =?us-ascii?Q?kqVFGz0Tp34qmOmwx/Xz/6O3lF7gpVeJTdBEy5XyIbxXz2QE64BMYIHfDBqQ?=
 =?us-ascii?Q?A71TErOkwOePe5C8UgWcXcVDKlyNlZK0ZHeWTkmt/4SgYXr6Q3kn23Tt0DmW?=
 =?us-ascii?Q?0/6Y9weJo/w4yJ6V4MenWY56jMtrSvOSrDv+DO+m0xN9G0o/A/ob6eUNMU1e?=
 =?us-ascii?Q?SMdkr6YQ38wQ1wziyDT/wJU9/C9gfHjSssrCE0+SqZIHkWltaNyEnsw8YqV5?=
 =?us-ascii?Q?3lTNXPVBK/TbtS/P9dmefITpstfbAykHFaUFgpcqOLp8gHOBxQWnZSK4Hosa?=
 =?us-ascii?Q?64u7zoRQ4rlrRbHUKgXPISojzhWZ0ieZYokxvCtNUDMAQBK3VQ+KQj43+2b+?=
 =?us-ascii?Q?ByhtnUy/V8X2XqAQ3phTKsExo3eysKSbAxXK+KGF6I9u2xBrVDBLV24jU9ga?=
 =?us-ascii?Q?UBcOmdjh2wCktvIoGDOWBKieeNGv41jzCqbg0M9MOJEf1k1zErqayrI5KNDt?=
 =?us-ascii?Q?cn/IfS5Qkeybw/z+jltjEtV8QgKitlqaRkfSsxzo/8ZztIp9+qspmU42KazI?=
 =?us-ascii?Q?SSQ56JlYN1gqVV4j6dInFMBPLznk1uaKyi0YeaS4yUmgjXPswkZGBQBnpKkm?=
 =?us-ascii?Q?VLE0AyGYTkMHBOX3tTKvYYdxb5DUX5OFc1hhdd9RFjEv7OfyZnlyv+E8cLAn?=
 =?us-ascii?Q?mpY3v8zy8KMAGMnBTpHr8O5uEVqucwiKDLT5v5KczuS+almRiS8HGVJqbkWY?=
 =?us-ascii?Q?oS9oX+UHmJsCB8vQtWQRVOmmHttIsV9JX2KBu4W/yvokOd07/AwoiMc01+U7?=
 =?us-ascii?Q?AU4qVYA7hbHsoOYRUbRLSPorLKb9hFrSNUssc4dL6O+N7W2fJ844ycS7cdKK?=
 =?us-ascii?Q?uCakQzA7f3RRxOUpHxhegBxhMH15bxioxcp7kFulJBy9YHUbgR94dWkd51VP?=
 =?us-ascii?Q?LFHlF5XmFs+t44GcHrRMWCpXr8zyH/h6CHcxByYBRTCKnS1ojaj9ZdMUefwa?=
 =?us-ascii?Q?Ecoe65VhEzVPHPGuotVYnbtGXHTdYxhVYYWB0zWQST3WSMcz3O0tfi7Lrfu8?=
 =?us-ascii?Q?aRc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DfdwMu/pBgKslz8Oldrcik23by89vZdgMdxTZSKr3b/IDhqwvVHHcM0QWbby?=
 =?us-ascii?Q?ej48Qs9XuQUadMv7vOi9g9sk5S2nDWb1hBqGF9PZ6fOcrtBj/ILgCJU18uXm?=
 =?us-ascii?Q?XmVgjb289/8xftIWp+B+Oo/adwS15N/304H4JMrpPX/dzkFtDHwLdmhRJK6I?=
 =?us-ascii?Q?eW3+B0RYmQHcpZp6Qn9Y+jV/NE6bqygUdAb7Hldi7esAPO4zSI8UwdA7K4IJ?=
 =?us-ascii?Q?EjNgam7oq85ECmD5avbujMWKNMrFborlUd17fxecO9uzJB0a6w+LFdkbBsm+?=
 =?us-ascii?Q?H0dkhR1N1pMGvn2X4yBmYLUEbSwNCMsJCHF40LVen1UF/yUvHNE/7lQcBHVO?=
 =?us-ascii?Q?dA1xSvamJMllDqbNl8QrGrWjXdNChy2BGkkV4GBk1BMpzuUSzKHBjxE0KhZs?=
 =?us-ascii?Q?WPqiwkNGUq8aL6EomZqSb8hSzGUiv83euNVGnqOAj2nEO7Gigtuzb/a0l73m?=
 =?us-ascii?Q?+LXn3N9CMSDwhCoiJyOeYfkfiBaq4mQOytLgGbxUW8gy+8qFKiCgJ1vI4Evw?=
 =?us-ascii?Q?/lHlZOt7csaHh23gzsNdQHd4wWeAhkYFVAdaqn5jUrAaz1iKrufeo5+Rave+?=
 =?us-ascii?Q?mGMJFke0BV6bbhmSzfjszX1Tsg052mIRtkAxHeMegmXudwiHoMIMc0NHXG1F?=
 =?us-ascii?Q?zWhgocp+83R1ZVp/BLiglo+6jG0so50VvtO493kDFtIsRT+cEqtWU8OvNd27?=
 =?us-ascii?Q?Hj6WFrRDwTzxXHqBO6YBqg+Uufn1Ga9k9Z+jvtQtULsxyzkbx2MW+gK9Wipz?=
 =?us-ascii?Q?J1QuxVu8Q76rD1Dpbf3FLIuCHnOSDPUmT42U2fNICuXXPJ2dFZO3/kwEc1NR?=
 =?us-ascii?Q?v9jS2r3e6/Sh6MnZ4T0CSsVV7FDMeOQgwM1QP9+wOYcBbB7wvOKKbdu4/X8Q?=
 =?us-ascii?Q?WO5TpM4y+KDqYkMHSLQFp6QU9kfXTy5D3sIMWXbYtAx5FZqMGXMzeb1O5iTk?=
 =?us-ascii?Q?f62UTZNL1d1xeIG/Pt0Zzvw50a2MD+BnOE/OttLgYsDJU2TGL9bJ6coCIlnV?=
 =?us-ascii?Q?c6aSrHOZJygrw4jEDnTcwX8GfqN3vJ94uGDi3FtRDVQ3zhHPfqC1X07v28Qf?=
 =?us-ascii?Q?3FFt0BJzBuf4ZKCzMfmue4xp0vXCaoAYIMtNufWHXX+VBXPjYenl9hr6+xpP?=
 =?us-ascii?Q?mBzRsmM28OQ1ESN3P8GqEHO9U+GXixmxBbflUgwS89FHh2SxshXNFjWcFg7D?=
 =?us-ascii?Q?3QsDk/DXFmZkMKcXNtvK2TiXdyFmIB518ZM8Z51OxQYzEB1cS3vmR9lRQ6K+?=
 =?us-ascii?Q?1SNexhnLESCie+t36xpg9iXNzFoS2ZUmTJYSvRnWvMFZVOLeOUvi+XhOpWiM?=
 =?us-ascii?Q?eVf94aZqpDK4zxYoGO6mC4c7UFm5Pq0j0/SBsG2Fc+YTtEyqRCYvA7r1rzf8?=
 =?us-ascii?Q?ktrW6o7yD8w2ww88B1CE2zQtaGMrst3K1GbQO0ldV9tbO8eHy6aV7lSRr41U?=
 =?us-ascii?Q?nLRgKhydGb+rXcM+ClBSPBabOGbBCyqkLasY+rO9YTdyaBCROoVEZ1afohhu?=
 =?us-ascii?Q?RgAJIqbKpxQWodxV3qbkmUo22togPTU9/MX3FN2q5ndmZImOztj0T4PSGFQt?=
 =?us-ascii?Q?dR4P0JiZ/WOl8kQhe7PxNb/RCb4QrGLNgTvy6mRl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f4eba0-5889-4159-ad54-08dce91541aa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 10:21:08.7937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oRn52ppTFPFOwwqJL+f9TPNWEFgALoeu7UY96UWrys2HzCGKnK1ms2ex6urm7WhochUVUWnv7Pln3BAh340n7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7009
X-OriginatorOrg: intel.com

On Thu, Oct 10, 2024 at 11:43:08AM +0200, Marc Gonzalez wrote:
> Hey bot,
> 
> At this stage, this is just pointless spam.
> 
> Also, not sure WTF linux-mm has to do with this DTS mess?
> 
> Cut it out.

thanks for the input, the bot will take care of this to avoid
sending to mm list in the future.

> 
> On 08/10/2024 20:58, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   33ce24234fca4c083e6685a18b460a18ebb5d5c1
> > commit: 2150c87db80cf7eed3939f32cbb18393055c58ce [2288/2853] arm64: dts: qcom: msm8998: add HDMI nodes
> > config: arm64-randconfig-051-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090230.1TqAdril-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 14.1.0
> > dtschema version: 2024.10.dev4+g577c1ab
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090230.1TqAdril-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202410090230.1TqAdril-lkp@intel.com/
> > 
> > dtcheck warnings: (new ones prefixed by >>)
> >    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >>> arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: clock-controller@c8c0000: clocks: [[31, 0], [34, 178], [144, 1], [144, 0], [145, 1], [145, 0], [146], [0], [0], [0], [34, 184]] is too long
> >    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> > --
> >    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: phy@c012000: 'vdd-supply' is a required property
> >    	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
> >>> arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: clock-controller@c8c0000: clocks: [[34, 0], [37, 178], [155, 1], [155, 0], [156, 1], [156, 0], [157], [0], [0], [0], [37, 184]] is too long
> >    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> > --
> >    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >>> arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: clock-controller@c8c0000: clocks: [[31, 0], [34, 178], [144, 1], [144, 0], [145, 1], [145, 0], [146], [0], [0], [0], [34, 184]] is too long
> >    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> > --
> >    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >>> arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: clock-controller@c8c0000: clocks: [[31, 0], [34, 178], [144, 1], [144, 0], [145, 1], [145, 0], [146], [0], [0], [0], [34, 184]] is too long
> >    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> > --
> >    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: phy@c012000: 'vdd-supply' is a required property
> >    	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
> >>> arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: clock-controller@c8c0000: clocks: [[34, 0], [37, 178], [150, 1], [150, 0], [151, 1], [151, 0], [152], [0], [0], [0], [37, 184]] is too long
> >    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> > --
> >    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >>> arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: clock-controller@c8c0000: clocks: [[35, 0], [38, 178], [151, 1], [151, 0], [152, 1], [152, 0], [153], [0], [0], [0], [38, 184]] is too long
> >    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> > --
> >    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >>> arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: clock-controller@c8c0000: clocks: [[35, 0], [38, 178], [151, 1], [151, 0], [152, 1], [152, 0], [153], [0], [0], [0], [38, 184]] is too long
> >    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> > --
> >    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: phy@c012000: 'vdd-supply' is a required property
> >    	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
> >>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: clock-controller@c8c0000: clocks: [[3, 0], [39, 178], [156, 1], [156, 0], [157, 1], [157, 0], [158], [0], [0], [0], [39, 184]] is too long
> >    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> > --
> >    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: phy@c012000: 'vdd-supply' is a required property
> >    	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
> >>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: clock-controller@c8c0000: clocks: [[3, 0], [39, 178], [156, 1], [156, 0], [157, 1], [157, 0], [158], [0], [0], [0], [39, 184]] is too long
> >    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> > --
> >    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: phy@c012000: 'vdd-supply' is a required property
> >    	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
> >>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: clock-controller@c8c0000: clocks: [[3, 0], [39, 178], [156, 1], [156, 0], [157, 1], [157, 0], [158], [0], [0], [0], [39, 184]] is too long
> >    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> > --
> >    arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >    arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
> >>> arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: clock-controller@c8c0000: clocks: [[34, 0], [37, 178], [149, 1], [149, 0], [150, 1], [150, 0], [151], [0], [0], [0], [37, 184]] is too long
> >    	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
> > 
> 
> 
