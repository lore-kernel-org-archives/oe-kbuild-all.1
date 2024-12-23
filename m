Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E72D746E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 01:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734917965; cv=fail; b=ONKZfq7i5r8GuXWM/qA2IiqMHLYPX/c8fNtZaGci5wgac18cf8evop1syXxc4ZN9+teulpGoZ/+YP86UnBkSLwNFPpS2XmooF9uY6HPI+wCmboVh9jovoS4QY8ul9KeQHOEulneN1kK464hdTZrO8vwOu7rDgTLWwvxWqYSx1zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734917965; c=relaxed/simple;
	bh=bPECRbJ8N1BIaETOCN8DX+V6tqBNgE42F/qu2LgoBwU=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dPId/GRjyGPF7WzdLgCLfMBFIrdkl9U/AmBhOf5P+6aUVhWJFVceoAW6u95joMSXL9hg0fwL1hB+MUVC7Z0Vq/OQ4k1622fUbDE75WhWVTu+CVltyqTiozmrtlNz42yqsUnXCWYOrNitQiQrjmAfWyxdb3p4kRXrDvUeLOsNx+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heqVvF+9; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heqVvF+9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734917962; x=1766453962;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bPECRbJ8N1BIaETOCN8DX+V6tqBNgE42F/qu2LgoBwU=;
  b=heqVvF+9O/HLFslhav7Rbqiei2Tf9HYC3Z6IooQcD3kGjcF7aOdaepUV
   ZAq6j9zFSFReLoo9NbViow3unlFvROGhmF/4OLdzQN+eMZRL1WaqMNvgk
   V1uACJ2cKFq8MtV5SFmIIxq7nhVWUQhxIAJ5aQIwjUDkUcDbaZ62dKR/k
   Br2A0ffutXarTmZlamenvHX7Xpx/pWPgmLfRUaqINHlngC0l6PxBHfRoM
   z5ITnKYEm/Za49+2ppQJ1kmV0jGH6PgNQo0NJpmaGLTwcOqSl5CHtBlwx
   cQo2K+NfwkniQ7ZJ2mx2MDAPapNWgSpB8OIu7EPrtbZiFUMIXdQp3YRkU
   Q==;
X-CSE-ConnectionGUID: 1yM3CZcpTDSnUxQekJcRTg==
X-CSE-MsgGUID: vUGJTUmrSxitK8KX4Mdrug==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35412816"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35412816"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 17:39:17 -0800
X-CSE-ConnectionGUID: 2nGZh/wzRtSM3ChmxNZ56g==
X-CSE-MsgGUID: DV+5C20oQgmcfFguTmngow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="129913326"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Dec 2024 17:39:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 22 Dec 2024 17:39:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 22 Dec 2024 17:39:16 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 22 Dec 2024 17:39:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBQv4u7JQm/DR4AKDD6cq7vWKWumgXQ1oTcwHE5JW8SjWITIUcKXZBv1re817Xtik/5DgT3eyq36TkT8GrrHQ5OC4fZlm3WInD4ImWw8SbUjSEZC5hbu8XCxguJGgpMDlbjyUXlemEKusfH45SFg82No19d7ct7qiInax28uYnVCcV1DUVXWdliVae6+IUv79YC7zlxvWHtsiNcAMK71Qzjf2Icd0+90oo4KGRNOpHMPxR4UA1gfAD+UqLEpDcXu8Kz9MchaqFcVjn4/xuXMic/LcLekXKlgmarbeY7Es6B74CuQY+E9RP6z+qWGlBJgoRDC1YNOHamDLzzerHk0Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k37YFOpC9lsvMf6xSSrkycXwI9LvM7iTCF/kL3kCjTQ=;
 b=aE6f9zNVjqvsmFmxer1xLddE2gKw/iZ/QpCGp9DY4yx088/R36WMtICvwmgvpVHXvGkRmFsFplYubPDk/tg/3p8STGuyPnRaurhM8IYSmMptSLxSKuuynw8Tq8LkcghMLwAznHNK0HwKjvF/e1zxp4EXixHIQ6dttj1ppzHC5AZg7RqIe/Q7El/qAIscmETd7o6+e+Ire6YYut1+tsi2QWPWb9NPTkfWOBV+0UREcmAqwa9z5mWk7DagYIkbTmesoy+v/rsJzPkhdnr/fURaAY3BM6BfDQ4VbtKNYMu6zTlf/Nb13fddZMUaJsm734HN8OK79jaFdpsQEhnas47L8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DS0PR11MB7310.namprd11.prod.outlook.com (2603:10b6:8:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.20; Mon, 23 Dec
 2024 01:38:43 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%7]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 01:38:43 +0000
Date: Mon, 23 Dec 2024 09:38:34 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: Re: drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or
 struct member 'timing0' not described in 'mxs_i2c_dev'
Message-ID: <Z2i/Gqg6TpWhKiQc@rli9-mobl>
References: <202412230939.8AJO139S-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202412230939.8AJO139S-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DS0PR11MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: fbdd00c4-7a5d-44a9-478b-08dd22f288ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?D0T9wt1I4fbmIYCLHO1+QLN4jGIujA3OZjFp4YcZhG65N/CKMGne/51Cvo?=
 =?iso-8859-1?Q?X6LzFcexYN1AD7/E/xGou/5hRo3gE3uXWHw3yvRMlFnLUb4E8BN9ZRxZRO?=
 =?iso-8859-1?Q?3KTS/t0oOA3YJYVtSgJbJk9YiYLZr29TLKmU5KHTYf6k+5lGCGjQ5+eIIB?=
 =?iso-8859-1?Q?o1Yyz3WvDyHDccoo348Z6rwLK7pdeyItjrd1UCD+MIi0ChsScvTXdxpwJs?=
 =?iso-8859-1?Q?g8gZIYmWeJIeRJXdMsb3lv/0jo/bgxyIgKZqB2aJwcscnFVni8ztkgGfi7?=
 =?iso-8859-1?Q?JdXtXFoRv/qAXSsiAEMG4HJbY6l98PQEduywlk9aG5DNIZPvFVc2Ys/hxm?=
 =?iso-8859-1?Q?oWiNbc/6qzu3Fm/WDPQeyZK5XQpKIQrbOqK9R1k949O0rx9URAYYEJp7jX?=
 =?iso-8859-1?Q?l4KsgJs+xXGXtPrhWUOBamrTImo8PeuNM28K/+fag7Hh64VV9OzKWhSs6u?=
 =?iso-8859-1?Q?5CLAEClGGVOJJyM/cHuicENNDW36OM7Kmap6uhgySaX9BS+kcahxGxuHCD?=
 =?iso-8859-1?Q?pS1bG0uVMlSnDFcSbqkBwp1ur2VFuzOag1R3muDeTa6Kgo/kLO2Atzv7rU?=
 =?iso-8859-1?Q?uDnkt2c1gC9ep5XG6UeUIku5r4p/E/lRAEw4lFpOWDZbmWBaNWEWucIq62?=
 =?iso-8859-1?Q?x2cDXFFjA1LmzbW9n/qMn3MUotP4M3zAVemp75JpxtXIJr/lH6aC5ORiUH?=
 =?iso-8859-1?Q?V8U7nD3YMD8xuiXmqtyq5GAgND7rcxwH9ywXAOwd6Z5IvUl84IXGe2rziZ?=
 =?iso-8859-1?Q?juGZxFwkrDK3N5CIQOOB3wh19byGY73nvSrINfLsok2ciiE3NlE/i6+anK?=
 =?iso-8859-1?Q?asJR41725ZbbYi05jxROmMaRAFKV6VzxFtUoiSOasuqqLGHmPB9psQ8WHy?=
 =?iso-8859-1?Q?85RlPXkSkAhTM0fLuoAihkd/P8O5gwrSdWfBWZBArMI3MXS+vZKhjzmwZF?=
 =?iso-8859-1?Q?KMd3Karrk7nYr6cHdSfBDcxBP3t6OyakK78tIDWd6vY5/KbPtPJkfytIj4?=
 =?iso-8859-1?Q?xJgBzEqVJANLbNOagquzCyA4LhZrPHFjklSzBIyxhTBkM+97SmjoRmCu3g?=
 =?iso-8859-1?Q?3oGbvOF07yB/pr4jSrCXvQ67bNuPKEUVbU8gmZLbKbcIZTDrY5AK/g6FA6?=
 =?iso-8859-1?Q?l1TjaerheKJQ6ZUlb2Y2b0fEP7sgyiEqCejfQLokOgAmbomFOuAO7ghEPu?=
 =?iso-8859-1?Q?jY8tTT3lqP7XOdVhBxjlEjLmb+ShI6LXqWjTLTW8nmYy4A1A/6JRh6RPCK?=
 =?iso-8859-1?Q?QrSVVBAxpTkejLLJ2YG3EQFY/0C0t2KLhKspzBLd71zmdlukOu/yvmTrf4?=
 =?iso-8859-1?Q?ObnOuvZ8kHPS3NchrCfVEKmpV4YySOhKpNBlwfIX8o3MkbXdFC/YbArQi8?=
 =?iso-8859-1?Q?xdtCx2LwxrOqwAWnsyXCyjtWzoRZ0WyQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6EVd0zj34o2uQ/YQ1TiGRg5rC/cy/e/waXuFr47jRotArAO2TBr9LTpZp8?=
 =?iso-8859-1?Q?9xG+lR4PBtFkLuVIApz3awwpoB7pnVWta3NB1nC4qO9doumc0j8LTttvbe?=
 =?iso-8859-1?Q?09UVTgQ+dOxyp1pDFikOc8RzeEeJgnG6Evu3ZzyiuQcMX7z+InWkpbPsLX?=
 =?iso-8859-1?Q?vXNZmpzhV/ZlV3+rSZZnh3emcBBX/IzLR5isOQiaQ1wq+Ln3Xrv4aTnF6b?=
 =?iso-8859-1?Q?RQjRA+0UtwXTEaXAZ9CBMSOZQQLUa1SXRlMXJQZuFTw0Gm6I6wzFqbFh1Z?=
 =?iso-8859-1?Q?zAqQCNjJ6qb9+3IxBxvaxgeaeWM93jCzLj00PY9NnBR9qiHWJgfTKnepM3?=
 =?iso-8859-1?Q?C8dK7UooJz4jTf06d+Tbqjys1kHDAHXj6/f+Cs2zO9erbWXgBvVnBKtyrv?=
 =?iso-8859-1?Q?3AGdzQbVUQL85qAguilbOFv4uAGcjBduJ5p58izNFOaSs8syZfL1pWUQxF?=
 =?iso-8859-1?Q?XCm51ic1tvDUMRY64Ig/H2nqUSdM2HruB5PC3CB9W4Nb60/dAF/LS9sTOo?=
 =?iso-8859-1?Q?quIgVcpE/cxxo2iGk27k3p4U3ZYRw1ATT23/KEV1pLKi/zrnULuCZZSkEL?=
 =?iso-8859-1?Q?CyCOAcnuGUll9DRMunk9FT7YCMha65qjHuf5jHJdgqfGmDlEU2sxXFZu6q?=
 =?iso-8859-1?Q?zlXPtrf/E/6UgmfQjzm2D1Qhu9g3QVC2Wjq13ExoyT7birY2mIp1Pm4tBo?=
 =?iso-8859-1?Q?IAi55yvYAFRFhwkN+Lj4uNWw9gIKmYyRT8cVGxiRRCbjFGh0tTxHCafyHP?=
 =?iso-8859-1?Q?E35cdZCO5ZZ53oojkruDNZsn3xAvRdI+5INu4Imw7TuUuQuTYHn45nkC1w?=
 =?iso-8859-1?Q?y12xTpsaoEqI+7EIS3q1/tSyFyl32XvDLHaWHEQuOOZhnm+0/EZ8H5rNis?=
 =?iso-8859-1?Q?lmp/4GqijD+EqwWxhojyjQ41gTB3RlfVN3QgHfkf5vYgH0pvGh4E6ORemo?=
 =?iso-8859-1?Q?3RYfhc6pfV6M3Gf6u75xub+H2Zj7V4jNsBFExz/77B61x4nYCEVD1M5S0v?=
 =?iso-8859-1?Q?4rE+7L42lOatC3JXloFT0ZezyLNa5Z7bnU9nSQxeL4RHReJYQn+j+pDfvB?=
 =?iso-8859-1?Q?SDqaremBT53rgrimB6IziI3HLBBepGmARfZ9VxomT5EOSSOnytKPH1e7lT?=
 =?iso-8859-1?Q?5XYva+1STWjZsaVPbmjN1zNvbK/cJTm2ssfeWacO3ePc+8RrApb7Xx8qDZ?=
 =?iso-8859-1?Q?wx8SSmZlRKOoDr+rGsCqJKpmdO9Qfq84MNS+zf43GbVoUSWuSCuY5tG2EF?=
 =?iso-8859-1?Q?um1Q2DPPtsZ5gSNbsLTy7sGKBXTz0YSuwckQGOurAsvwSBr6Ky6pDV98Ye?=
 =?iso-8859-1?Q?6XSIRewO2kalHYkZ3myWrTNR+vR9VG/+AG0vD37N7PCcy1gYesvEaZO24Y?=
 =?iso-8859-1?Q?I2toErBvfc0qXKOnnNOQh45WayZ50y7FvtgVT4y4D53krIytUY3XeDnouo?=
 =?iso-8859-1?Q?jOOzO8MtpKbeLnKY28Wbk5MenlR6dFMA5UZJhhclEQwdGzkkSCxVtsovSt?=
 =?iso-8859-1?Q?zg0ztm3tIfN/xEGBO2SRVloMmxc/Q8Wbjs5WVNMtnjMgBTtXCUGzZSGgQz?=
 =?iso-8859-1?Q?+/rbk/b4QoG9iEcn+WKnr0l6aRSTh/atuEsKQ30rEptkoKcGn4UtMDfoGt?=
 =?iso-8859-1?Q?WxvA5CxizoEvj58LoCRNo5OBqRamXuFmSZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdd00c4-7a5d-44a9-478b-08dd22f288ef
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 01:38:43.4222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sV0C/NiS+NBB7y+/QzVVsPIIJUH5jXbJn/akCyD5HjTpAAIzKUuxWWEBh0tqRJnowWXqquwtx3HlUVpJMmnW4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7310
X-OriginatorOrg: intel.com

On Mon, Dec 23, 2024 at 09:19:58AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   4bbf9020becbfd8fc2c3da790855b7042fad455b
> commit: 4a2d5f663dab6614772d8e28ca190b127ba46d9d i2c: Enable compile testing for more drivers
> date:   4 years, 11 months ago
> config: sparc-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241223/202412230939.8AJO139S-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230939.8AJO139S-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412230939.8AJO139S-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):

Kindly ignore this report for the wrong bad commit that is not the root cause.

Thanks

> 
> >> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'timing0' not described in 'mxs_i2c_dev'
> >> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'timing1' not described in 'mxs_i2c_dev'
> >> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'timing2' not described in 'mxs_i2c_dev'
> >> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'dmach' not described in 'mxs_i2c_dev'
> >> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'pio_data' not described in 'mxs_i2c_dev'
> >> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'addr_data' not described in 'mxs_i2c_dev'
> >> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'sg_io' not described in 'mxs_i2c_dev'
> >> drivers/i2c/busses/i2c-mxs.c:130: warning: Function parameter or struct member 'dma_read' not described in 'mxs_i2c_dev'
> 
> 
> vim +130 drivers/i2c/busses/i2c-mxs.c
> 
> 616228a164d436 Juergen Beisert 2013-09-30  101  
> a8da7fecb60102 Wolfram Sang    2011-02-16  102  /**
> a8da7fecb60102 Wolfram Sang    2011-02-16  103   * struct mxs_i2c_dev - per device, private MXS-I2C data
> a8da7fecb60102 Wolfram Sang    2011-02-16  104   *
> a8da7fecb60102 Wolfram Sang    2011-02-16  105   * @dev: driver model device node
> 616228a164d436 Juergen Beisert 2013-09-30  106   * @dev_type: distinguish i.MX23/i.MX28 features
> a8da7fecb60102 Wolfram Sang    2011-02-16  107   * @regs: IO registers pointer
> a8da7fecb60102 Wolfram Sang    2011-02-16  108   * @cmd_complete: completion object for transaction wait
> a8da7fecb60102 Wolfram Sang    2011-02-16  109   * @cmd_err: error code for last transaction
> a8da7fecb60102 Wolfram Sang    2011-02-16  110   * @adapter: i2c subsystem adapter node
> a8da7fecb60102 Wolfram Sang    2011-02-16  111   */
> a8da7fecb60102 Wolfram Sang    2011-02-16  112  struct mxs_i2c_dev {
> a8da7fecb60102 Wolfram Sang    2011-02-16  113  	struct device *dev;
> 616228a164d436 Juergen Beisert 2013-09-30  114  	enum mxs_i2c_devtype dev_type;
> a8da7fecb60102 Wolfram Sang    2011-02-16  115  	void __iomem *regs;
> a8da7fecb60102 Wolfram Sang    2011-02-16  116  	struct completion cmd_complete;
> 0f40cbc4f85e13 Fabio Estevam   2013-01-07  117  	int cmd_err;
> a8da7fecb60102 Wolfram Sang    2011-02-16  118  	struct i2c_adapter adapter;
> 626f0a2ff6bc98 Marek Vasut     2012-11-30  119  
> 626f0a2ff6bc98 Marek Vasut     2012-11-30  120  	uint32_t timing0;
> 626f0a2ff6bc98 Marek Vasut     2012-11-30  121  	uint32_t timing1;
> 869c6a3ededbb1 Lothar Waßmann  2013-07-05  122  	uint32_t timing2;
> 62885f59a26195 Marek Vasut     2012-08-24  123  
> 62885f59a26195 Marek Vasut     2012-08-24  124  	/* DMA support components */
> 62885f59a26195 Marek Vasut     2012-08-24  125  	struct dma_chan			*dmach;
> 62885f59a26195 Marek Vasut     2012-08-24  126  	uint32_t			pio_data[2];
> 62885f59a26195 Marek Vasut     2012-08-24  127  	uint32_t			addr_data;
> 62885f59a26195 Marek Vasut     2012-08-24  128  	struct scatterlist		sg_io[2];
> 62885f59a26195 Marek Vasut     2012-08-24  129  	bool				dma_read;
> a8da7fecb60102 Wolfram Sang    2011-02-16 @130  };
> a8da7fecb60102 Wolfram Sang    2011-02-16  131  
> 
> :::::: The code at line 130 was first introduced by commit
> :::::: a8da7fecb6010222fe495cc2b4330b99bca20c61 i2c: add driver for Freescale i.MX28
> 
> :::::: TO: Wolfram Sang <w.sang@pengutronix.de>
> :::::: CC: Ben Dooks <ben-linux@fluff.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
