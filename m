Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A5F2F659C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 08:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767946182; cv=fail; b=VzLmu5/gjAtnfUdqjMtzluQsfBYrrLQTG8at7iStD9ITH/sSwgywlh1UsfilkGsyxCzTZ/DmZp/CQ1TbTdgU7NNq/iRIvJhsJbyywZAAEVg7K8VeMmKF7+k6xBcVDxIOw3rj8mfGSy7PvdWykACpSP5ACVLv4CM7KH0divAmPjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767946182; c=relaxed/simple;
	bh=fDX9SOLo9wjYRIyr5s/7vZb4WBuBFOZD1qchyyfgOso=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SDikZJvZCkGPBdT1Uj3lSfdxDqflIGWfLgBpJo/rvM3/X3iFJs+ydwvbfPtLUj6m+J1ZueXITlkfCHk3seEcfA0fOKpcxicGbtWlN4krfmj1MpWiyXZmcpy9tzVAzHCR9h4Vjd1f8jAqFXehFa+4dp29bxrjEqDhlBjeIf4k4uE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Slv4X26n; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Slv4X26n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767946180; x=1799482180;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fDX9SOLo9wjYRIyr5s/7vZb4WBuBFOZD1qchyyfgOso=;
  b=Slv4X26nOv3G/jnPEzNhSIaQxU8Xrwi7Mf5xtDWNUa2a8jjCquBWvuwY
   jmvLUR1EeLLUQUF6aOIjO5GG8VkOhxKMKGNHJs2PsFfaRJSWJV6W7SlVG
   ITyduf6TjiWMbVYLot8+wr51BhBKSN4uOkoD2eV6ikSWMFrHgVtHGmTYj
   ++ZiP8exd6dUI+CGrUx0Q1X774f/t2XnEQAV7+LuBP9VPGMM42vHYoVpp
   vva1gmYPjfQZkBuMGgQHxGlwXJbt2JPZho8U9CnP3A8NGCoSjpUk8QgJF
   ojH+6mOZ1RTb6FXwt3FYcD6CoM0bx+sO5AR+FW8Ez8+MOilcWQnq1HFao
   w==;
X-CSE-ConnectionGUID: 5hlyNtYxSqCivLOe9LHNiQ==
X-CSE-MsgGUID: ZuDewcf9S92JXpN+xgZ/sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="91989801"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="91989801"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 00:09:40 -0800
X-CSE-ConnectionGUID: zBEl9FQGR6eP6bfaOnczig==
X-CSE-MsgGUID: JlTmpREMRciVymd7qwZXMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203193495"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 00:09:40 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 00:09:39 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 00:09:39 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 00:09:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvIZA+O62WftbNi42Elu2wGHmJ+HAxtvLiv3uiFlJNIy47BtoBqHbXgNcHtXbA3J0ywdYxz4IlxrEXAh2g8uUQQ67jo0BkpRJ0GzOTnavj1rhlEDwD2yokbrH+P+dPshzcTbjtL7To67dznRwpPzKbwccLF3ayq1eLO6/r66fLVtaQeMEqiWQnMLVZDdkO4Lm7Ws+25xVgsxUwpuqGNIzkVzpgOl1C00J5etMp3z3Q940ujW8nwKqpbHqFguzjTKc6spin1Hu89A45YPXIf5k64BKT3XJppdkYTa+c87IxxQ7qcfaHa+K/M26BPBRJiacpokNTgTsgdWwzOJX2yzwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1C6vr+napbJzndkjgSwLdShhL9wfAlP5p8G/ffW7U8=;
 b=vH+Ckx7F4SGDAjqHIpkukXpSG59CCA+moIfzQ6jcYpkRHAkN08NtB1kMyQzUVKyzF74Hxc8cw5NeBnfLyClJhL2kSMynr/83Lbqcd0X2Wajn8gvhleBcykZpOrlfxhZ0n4oFrgmHOHp01G1zo24AnqdfLPnPI2k9/eQIjeeYBc6iKsZAD5y/ZQ52xeD7bIwQDjOfN3gB8NYRhSdN5/xeQQUkDkKM4Ybg0wGujccE233LqfstXqtE3mgUhAnaUzniejd5dKETJX19G6P6EZNubi3yWNkQ3Fe+x0RU37NobGfy4glzla845xJplR3aGXSXqXc9KpGFkz3kiaBbicAIxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DM6PR11MB4756.namprd11.prod.outlook.com (2603:10b6:5:2a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 08:09:37 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 08:09:37 +0000
Date: Fri, 9 Jan 2026 16:09:28 +0800
From: Philip Li <philip.li@intel.com>
To: Vincent Mailhol <mailhol@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	"Nathan Chancellor" <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: Re: [linux-next:master 3642/4725]
 arch/x86/kernel/cpu/aperfmperf.c:444 scale_freq_tick() warn: unsigned '*_d'
 is never less than zero.
Message-ID: <aWC3uCc78M8djYv6@rli9-mobl>
References: <202601091047.oyAz4jQp-lkp@intel.com>
 <0fc9bf7e-291c-46f2-aafd-bd15835f41e2@kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fc9bf7e-291c-46f2-aafd-bd15835f41e2@kernel.org>
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DM6PR11MB4756:EE_
X-MS-Office365-Filtering-Correlation-Id: a5f41e0e-ece9-4060-b474-08de4f566e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?f+LXfhU4VjVOfyL/v8WfcSnWU0eechr4bIerlw/iYBmndXEHwCQ50u1Tg8?=
 =?iso-8859-1?Q?gw83JCPo+IOxtxTlRh135LwLISrlF93gSI0GpUP2/gfJSUvLODkvOB/mK6?=
 =?iso-8859-1?Q?UDzY6fG7ZVdW/vvkfTnw55SP/jzvD1wPlzwUG5hWdmynsS8vWcd6D4RSqn?=
 =?iso-8859-1?Q?jemr20vshFd5AnrsgCvHwXpiJIW8otry1FQ6CuKIlOeG0c2CCrdA4aEu8d?=
 =?iso-8859-1?Q?O7s5u4bFSD/b3KcnP8b7XxHFm9xQ7oZCPDmdcW3xxk74Piew5kXVu5S+Op?=
 =?iso-8859-1?Q?pcJ4eOvq3PVaE1rckcGCB2qPLEgQna5/fLAXCXuIlA5ZPQlx4u5jIpLy5P?=
 =?iso-8859-1?Q?8z+V6A1vF8ScjsrYPjIF0UUKWZSb/y03BDDK8PtaX6FEHORKm6XXL+qIjL?=
 =?iso-8859-1?Q?EbQKNbw1vmV+cYbW3BirdNDoQOWW7CLg8NYJsm9fxT68rFZQ5Pq2XZjuU+?=
 =?iso-8859-1?Q?uOrdI6kEIINGC4z7j4FDVmZZ5HBb9zRn6GAXMUY5odro+E5w1SFoOfcjAf?=
 =?iso-8859-1?Q?7oGcZzeSRTSVFFCDZJ5rqfSTk2MsawrsIYn9seYYwSNB9oL4LcyXNteBNk?=
 =?iso-8859-1?Q?5yeW3omI4hLH6iTMMeJrOHclgspj8z7KOc0/a8tpHOW6HFUtUz+gdp2t+E?=
 =?iso-8859-1?Q?mJJmm7oL7N3xfXimzhjln8V9HNo9BINHDsKAuX93T8ANcYbE4dOeuAmI9s?=
 =?iso-8859-1?Q?KtMbZs9uPKYZJOi44YwYDi7SDf8clP+03274CJHzYLPv7xhWoPAU5GAAPG?=
 =?iso-8859-1?Q?k8CP26NHScSqDj9k1uGWVrd7W7PZkQw15UOjmwgL6qWgfHremUHoKUoHMq?=
 =?iso-8859-1?Q?F8AbmOW+05UBcz8sjqNmzGTd2DRHJXK2F/H8K61hXlY3s7fqnkmPH5jBCX?=
 =?iso-8859-1?Q?8HRmMM8tFv2dpKjVbufp8r+VsmF79mQoWys1gOtrruhkcQd8NhcXV3yr20?=
 =?iso-8859-1?Q?Oun/mpku5oXV/3dPaNqdl03VQ5kS6FlOUdvtpKGXsFGRFCbJZ2X1UCHtSy?=
 =?iso-8859-1?Q?Hjev8/ujamB/3NQctlLt4OkGFy2BT3KXWS2qqzfyoQu4qHQHtd+jDhHLO5?=
 =?iso-8859-1?Q?W7FUPaHX1EzWxmuBZB8Nk585eIWk1rI2dHGswI4GaPcKGnDB0dK/3LRLfY?=
 =?iso-8859-1?Q?5pI/HIKa9LUfehc+iEwDhQcD0T9RC01kvW4SLdM8Bjv/HobLKklhCr/3Xp?=
 =?iso-8859-1?Q?E5COQvBULgafyCFrAiKVdsA5HyvQWENwBblsxr9vuORqutRNl8WZ2p2hq6?=
 =?iso-8859-1?Q?bpym5VGSJYzg5hXo7fCg8I2x7ZiQeEKPIUPi0vlDY+jqU+pqZnKwbcF+Z/?=
 =?iso-8859-1?Q?SSSv9hUhV8qH1YtkTHXYlMfTsuYVISCpskrKn/QO4B1frFNS8cUF2Lx5ED?=
 =?iso-8859-1?Q?xcVZ1zpYlXUWZ4aqi9URrqOM8vjR9D8xqhHptY0fEov5tp3ikBtLR0mMNs?=
 =?iso-8859-1?Q?mYqN8rk3bLqTbT4oul9DwqrakdvzgwDUMvxOUMTvMIcyzECIoMSPj7GECx?=
 =?iso-8859-1?Q?m//5S9NyJWZxa81YQ9Vb/ZjJQfm4fk7EKm4pjzL9SPqw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?tVAUvetYD+i8i/HYE0IiYoz9vKp9hZWCSiDkBJyVaElkvcZr5j/ImL9q5m?=
 =?iso-8859-1?Q?neEMKkUMxUUqZVvijRQvNZmr6AT1kvK7lx8sgIoPWzFfUZi5FTC7FybLRI?=
 =?iso-8859-1?Q?k/WKt2ghbGt0j8L7BfWtqURAlAmUuqShbdWucPh/0ub+V8sU6hjxl7E/Yj?=
 =?iso-8859-1?Q?A4g6l964jTnjDICZE0tUGvH1s0dizSdICd7xM8p/wlZX4qNHouKkJBiUmF?=
 =?iso-8859-1?Q?6RrInwq2SXMFOV/YYsIqaDJk31q9BePnOGK0hQLU0wSgPM6BjT9e1H6eB7?=
 =?iso-8859-1?Q?bsXxV5av+tonOf3zkX/MmSAec4kaUAVakuDctkZkNMmf8nedF6xQ3aNb9k?=
 =?iso-8859-1?Q?XvAcFhAgRl4GzkS78PBJTqzhreX9CpYQn7cAUXIDsA2LCf0rqbE9r2ZwOy?=
 =?iso-8859-1?Q?wFFvAxZ18KtDTIKqmiw79oNLgJhEk839aab53C9QKttxm1dvkvAK8yMbKy?=
 =?iso-8859-1?Q?t89oTJpUPmPXwyBl8m9s3p+R+R/8nF7OFqN7amAQlAb1L3b2t42bwSFZS9?=
 =?iso-8859-1?Q?xKUhzc2LssRaLcaAhIEptTdkybSghP/oRtQByGQJ8KC1jJGjtmjW5MQVX6?=
 =?iso-8859-1?Q?JkwIqt7n7VEvaKDuBIslxIdS6RpHhr6jGztP3wVQgxpEBfAxJEVzpIBbUj?=
 =?iso-8859-1?Q?BHABgLZ0pP5tx1b4Ziu57jqQRThahD4oQDicioOcfNkCF7BnpSyKJLUT+7?=
 =?iso-8859-1?Q?xeGA21J2+6RzEiodQDqYDWKPyDVStSQxrv2kJodEfAlXjqHhutbiByh8/9?=
 =?iso-8859-1?Q?AD9STDf567Z9wJr9IYi9jDLLlJ1NmkGGxYvmsltrjr3ekBZpb7COZ8nbgP?=
 =?iso-8859-1?Q?thTZ2PZ0U2/CvJjwMBnxcyCivBWKC/zvwVb3p4AFJyZLcut5GG8D69XFxj?=
 =?iso-8859-1?Q?Qjw0/cgEwM7QvL1EtMDRUosO+QX02C5zBIr3mLmNfXBHq3ImnCYKuHDk9b?=
 =?iso-8859-1?Q?SYQ+RfuS0Z25z1UJgulFlttJXkYzQgLNtkorMpcG/gH0xGZ9FESdqYVaHn?=
 =?iso-8859-1?Q?3q9n7DF4sqvrzlO5y0Ta7SIbwMHz/0xalAP7/imYZBJ0TdqpudPg2GW3iI?=
 =?iso-8859-1?Q?Mtj5zMHWp1C+rCyrpZP3m5s6OQL5YjChzx47sLn8AlJw11PN/1oqRa4a86?=
 =?iso-8859-1?Q?PtdkAjqI38LP9wAIElsRGxzwZHL8uCWcyExakKSOn87wtpvgbpAkZ1tvLl?=
 =?iso-8859-1?Q?1ykPsmByI4eN0VOZ/C7ZfUhEzMUbzYZTvSN3A3PgSAbd/c93H3sYI0I620?=
 =?iso-8859-1?Q?OunK+7QDaittIR7ukqIIv5MzYFrxxOSF8/0wIpPuZJFnOYStPiT35A3e4Y?=
 =?iso-8859-1?Q?NTs840RP5JhFG3KM6YLcOt+0dg7q47shqZA1CWD7952MuGLC8f5f8PnyzC?=
 =?iso-8859-1?Q?YaGcBNg0WnxO4mcKMfKTVTBDrAw578w93OdM+5X3VvUTGAlCaGEWHIvWEh?=
 =?iso-8859-1?Q?vhUHEIqSZFu+4S674uk2w1DwLa0myUWSGHXkxdDFIwlmV9RRkpKS1lh5ss?=
 =?iso-8859-1?Q?1pVaOZA7CTk/s9I60+Y1Gr7NSiU94SpDkAaqtQKQlznzfRMDHp3JQRTibg?=
 =?iso-8859-1?Q?Bk04OoztG1ORemobh3Dc5qjGmbI+tXnkLVeXYMpo7xfIyMDVgzTCLZAl14?=
 =?iso-8859-1?Q?2TmXPyEaUdUoOcJCQfy6gNkw4Q6fzx8FT2O0B52NTjMHckPnUEZdXC1cL2?=
 =?iso-8859-1?Q?YwByIFBfrZDRQZSvXkBI+ocW0mPh5bhBoFsBVIoEKiSxmZlZlSFVjDMTIa?=
 =?iso-8859-1?Q?QQWQ68eiLO9yDzjuZdktx9f7b8+7dsjariYIqYtvXkVtQS824ckRL/902r?=
 =?iso-8859-1?Q?Bw9V68gzTA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f41e0e-ece9-4060-b474-08de4f566e5d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 08:09:37.4026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEzcqAJV1DhmGI6yEw7mYtAflN6rSqiS3gqozfZTJIe4oIqyD+2+oq1GvNS6Le3c4DD+7VeK4rLQ9wVraSQ7yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4756
X-OriginatorOrg: intel.com

On Fri, Jan 09, 2026 at 08:53:57AM +0100, Vincent Mailhol wrote:
> Hi kernel test robot team,
> 
> Le 09/01/2026 à 03:45, kernel test robot a écrit :
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
> > commit: 5ce3218d4f102aca5e90d3c831259b6e380f88b4 [3642/4725] overflow: Remove is_non_negative() and is_negative()
> > config: x86_64-randconfig-161-20260108 (https://download.01.org/0day-ci/archive/20260109/202601091047.oyAz4jQp-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601091047.oyAz4jQp-lkp@intel.com/
> > 
> > smatch warnings:
> > arch/x86/kernel/cpu/aperfmperf.c:444 scale_freq_tick() warn: unsigned '*_d' is never less than zero.
> > arch/x86/kernel/cpu/aperfmperf.c:444 scale_freq_tick() warn: unsigned '_a' is never less than zero.
> 
> 
> This warning has been silenced in smatch this week:
> 
>   https://github.com/error27/smatch/commit/a7b509b8171b4982b5a2a355f64d083dd76e03f9
> 
> Can you update the smatch tool in your CI? That will fix the issue.

Thanks for the info, we will update the tool by end of this week.

> 
> Thank you,
> 
> 
> Yours sincerely,
> Vincent Mailhol
> 
> 
