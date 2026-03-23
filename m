Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012034.outbound.protection.outlook.com [52.101.48.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EC625393B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 17:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774288567; cv=fail; b=ZkbrXAINl6kN6JtEVfpjFEcOeGdJ4piy/klTht1G+uULXfi6cD8l2Wyq3DBCCrkWYLNdRTo46arogjWSSnlZRAN4b3/tntCQKIZs7GafXsSR+6ue+5itMT66HBztCO6MdPzOLGSG/jNO7YGjcPWvPGYBwdS2dqF4o+Ow/NP0QDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774288567; c=relaxed/simple;
	bh=YdMYaKkU/3WyYCuL/wrwDvTvdZNRX5m5jHqf10zPNXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ULB9Rj3Qsh++fK9DFwN9HOI8cf00EGSOn+PwRQKLCD5A1oatPbG8xW+gJh0YEJ2aN5Zc2rKZbqur9dSxjz90CKrnoVOOhzWEy1iok9vDMmy+nBE7DZEpNWtkSAD9wGyLJ/Iynkd6gx4xDLWDX+3f0erSDE/sc1LVqj0zkVoeswg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PIRnSZBD; arc=fail smtp.client-ip=52.101.48.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PIRnSZBD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHFrSgHW+2MAHo/TmQa9KTM+FazexkF8qqSsh6gC09uPZOmIuUKlleEchtp9QvtitHIUfI5/082xTNBj6c19KdVPRfo1y9kGjh+OxUrzrli8r87a1N5DLCVbWSCuPbntYmGN6OgvOHWkZvf84qm3dc+7VX8T5PWWK/3loHvf9/ntD/XSd1kzWZNsCqo1BAQpJBtx5eWqxktyC4hsHI9++QnrOvYb7XyZ78RYv/xX8oqLRDMbKEGwqs/cKbXSRqqgX7ZBoiQVOUQ7VQoUzDl/GaM+JYwUWhcXtNlX7qC3ZrPXLfu1O83fLyDlDI3LjQ7rqPFIdzHS9fnrDUl6dAwHBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8g7ZziYJ8aW92tCcT17LZ6pN8SwyBkt44Z4So6lue0=;
 b=q0PLfyN0DFUzCx6FjYFPBsxOYSd0Mie9vmV+ZZQZw4m/XALPUKx7yl2ya/apnxShVpEyH3j7Ah7qSWm0QcMeNBFI4WiBE74mzw2KF7Gekr2MJbVhgTUJgDl4AbFsejL0O5IEc59KJ9OPQ5/IN4en/F3LlAJfn3zaAKKYJASXyT0zgvo3fKsH3OxnxUa5IdwAxGSqt3jrgbO3u0QAvDMf9yMco3ut0w7lCi0U+Zm6Koe7+rzSp3cg0jEq+qCDEIUZj22z4UR+FLVhWlaQGgQITRt/4mhUgU+r/8j74UBTHqH7G/rTkLiWR8MUs2hy3ZwO8yzQCbAyiZOI2Mij6LTN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8g7ZziYJ8aW92tCcT17LZ6pN8SwyBkt44Z4So6lue0=;
 b=PIRnSZBDANgNwpqPR5kwL0roTYLnrQ4UmZndrVXVAsxe9GgV2oETuTL9f/fjpEB9sTCk3ALlbMuXGvIx/ZPqLGb+PcCT3RWkoTNHFB7t9jSOVhsRN5p8uzhqor6XsI853Pg6OBLIHo6W/MDqgv5sN0lwKnMSLVKZoNDenWOaG2sdCfIZ5aRaAESYW7ddYLg8rTO33HUcBMCt+xZVzZKPHXFxW/ewUrPkmN3SFhwrzFTRF5k5lPMpi7/L+gt5/7uYRwFdootQBbEYYwIoiiVHFN8K/AljfeGxxBIfpaLSsA1nk9g9Qz7CojyP5ABQ/EbiSFn94+g2QE8RagfwlmYHkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by CYXPR12MB9441.namprd12.prod.outlook.com (2603:10b6:930:dc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 17:56:03 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 17:56:03 +0000
Date: Mon, 23 Mar 2026 13:56:01 -0400
From: Yury Norov <ynorov@nvidia.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH 3/3] bitmap: add test_zero_nbits()
Message-ID: <acF-sTWyjdZk6jbD@yury>
References: <20260319004349.849281-4-ynorov@nvidia.com>
 <202603220114.k5BHBav5-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603220114.k5BHBav5-lkp@intel.com>
X-ClientProxiedBy: BN9PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:408:fc::24) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|CYXPR12MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: 21837e87-8a1b-4ce6-599b-08de890572ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|18002099003|22082099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	OJUaEGf166KM77vrwAnR4kPdPZi504zVaf5C2TXZQ5BrUf4/J+U4osomZ8STASaCLb+UNr2CJfTaWzgRVRCdSkUUl1SiTf4HqNK73IJ8Ybe77OM9qL/9grEM9AeI8plaevpakieoWu4YMmbQcTzaxgT65VaSRfCeIuhFrpXtUCLz1cZTQYdGgJNQDe0rWzx3jvxVtHxH+xC6xlA4Z80SDgYOY4/CH/9DT81nrzF2Nl0StqHxBgdZEAuqg5C1Gn1yHOtr+OTOXsk30HnkZUmPeXhYqONqO7fGdIn8nTukO0cGIgEjkuA8ZIo4bXG2OzGhfQ9Lpr7XkDKQi0QyA0jWlNN1+4B9QM1bPNe+9/Q9I1l74PQa85BYZw1kk/RRi4mfkA9ebOKj4qih3XcahVODALIRycoZDWNl32APp+jBfD+oBC9rWPwZz8bcKGNGoGi/+s5ZcENNplQ24+btw1gdrLumY/o4al3paULFKeJi7PqWjZzswN1HX4iYA4RtWSQEaD6gg8ycWeuolI4ET0gy0DNLK5i5BAWA0KwwGffDN2RnWcoPwytBEpxfMm07fPTVZsIMb1iAabaxC1XdKwa8t2qpN0mx57Ewqif6m56rWjpW9huOLEBuZKUL/bI9cEF/xQNbNYVWoKLUBzdmfOVv2YrQg4zKZULnjQ1QML91aAimLNtmGPQGiBFsdYnMyzhHKQ7+FVevC/pcAwCJXAsW4G3adHy6Lwp0K5DLgAD3HX/j9fbEzqlAmuDTErABGKBb
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JDgYyJZk3iScCVbWKk9/kR+PwnthhMFdL2hJGI/OGOuCYLPkemfoFjodHee2?=
 =?us-ascii?Q?WL7e33WET9arZBMTgEtdgtMzcdLWuX0B5AQfPZh5b8pk7Izn1+F+3Y3xR5TF?=
 =?us-ascii?Q?E0CkNE8Y6c686A4vOO1BqYWjScn9trt0S1EwjpZK0Rd16tEhifSOmh80Pt1l?=
 =?us-ascii?Q?aKTKtAfpeGUmOf+W3UOxIw2zjuqU5f0N6GTWsdnk4fhISnlvhPMMfMShNGqB?=
 =?us-ascii?Q?95a0EoRC+wMqCnxps7eslKKkur9O36lTLtSInXdCEuFnOxycAGtuLmyVzsKc?=
 =?us-ascii?Q?/PX+0aiyxW9GH92K7jv7rVzy77I2ZeqntHBOoawNrhlB8I5x7AhZxXdJhCFg?=
 =?us-ascii?Q?lDv7Q8ihYZT/3zZpi+/RRVNEMDK+VJ5iOoJTF8uSS+lHQxGf/xuwFhZapznd?=
 =?us-ascii?Q?AktfbpCTNagu4IN+1HyNBKV6ZFzkIAnS8a2N5NnbQzIDbaTxjmGkpnjrdgXX?=
 =?us-ascii?Q?6ETyNZlp83cy+sNsx0bTlMdKuxp/Eh52BhOBevVHNRJxX8VeXi5OyjLokZ29?=
 =?us-ascii?Q?ShRwNmVjECtSrRq7iGnyf3u8IOzryTsiFj7w+yziUHTmkVDF8aajI2Et4/eq?=
 =?us-ascii?Q?9pLXEE1LfRfK37szQGBQh1qcVhuQaPGnv0EJmsfyLL0oFVBIGmuG/QVnr7rM?=
 =?us-ascii?Q?xT84haVXHjkrRN7D0CheQPGHItRA5SRrXlnXJM7xaO97aISXVPEkGHHpWAuV?=
 =?us-ascii?Q?qXbIblrKq8m2ccmbfFbRS1+g0VZK0qh9kS3njbL+oUDwcQhxdj5ikdVPSXk6?=
 =?us-ascii?Q?HB5hitkV4j7Is+t878Buaha9Rj8UFs9gECDnr8XsLaEeumQLrzH6EjwBfeRF?=
 =?us-ascii?Q?jw12zD4HSXC0vOiE8XDzyQw4KCTlpYXOqaWwJc0W8kV9igYC/0DR79q3niHk?=
 =?us-ascii?Q?p3DDCH4Fs1v55cyafENOCtY0OZmhuthEAKjQ4t9kkPJ8IGm3Daox6rZIQd2N?=
 =?us-ascii?Q?vJ7Livkw7PgMfWTdXpIxbcYO9g2UsFSxcvEkBhAPZkqj4ElY/wG7/tacPprt?=
 =?us-ascii?Q?Q+EbwEofpP/vylUzbZe4SX5/saRLXkJik0oJkNBGrytJ43JbFMZdMsTLk6Cw?=
 =?us-ascii?Q?jHIhiWYP3/PfKqTjUAA7QhucgoPZxN+jeFkw22Eqk1NcoJs8wY3eYMgN3Yd2?=
 =?us-ascii?Q?E2oxvbvSN8IucgKVSLnTClcEQU2T2vYMSTN6zqIkldvy3VS7ntUfQFpkAOi9?=
 =?us-ascii?Q?4f4JEGXk7liJ7H7jUVsJPpPiMayiBkuuQj0cNPa1VXHvGEivsvvLvS8sOLsg?=
 =?us-ascii?Q?epqJSocvGpO7sy3TTwBhfWcZ0VjUTUD8lvbHUmSYAQQhVwKi1FeJ0pSqAbSm?=
 =?us-ascii?Q?ZDuGNtrgXpVQtNZ3SlBoCw960+4M76qdUJuOdDdc7G8MVMPO/MeQe4zWulJk?=
 =?us-ascii?Q?t+GtwKu99EQY/zwJalD5WarJPE+nKpoDqjITOtK3TAikO3t9aUZs7SR20LiB?=
 =?us-ascii?Q?PlK3EmSJqssf30ZD66GMX7VZiRtQOtttMmRu20vUKWMyygd7cDvChQJgYpNP?=
 =?us-ascii?Q?17hAGuAPYEYwyAu3VFc2nsr7PnMq8HPoCm1ZDsR5S2z8WsAe+BnrZ4Xp3e8+?=
 =?us-ascii?Q?qjosVE4Oix8OEomD9zgcXwieS1+eLsddOisDCXk3cesPwmvH639ZoPYb/BF9?=
 =?us-ascii?Q?RrOJ5o6O/G9KjP11tdfREdIRd2+yK6hslUvjKVrjuotKo4/hzg+9mxWs33R1?=
 =?us-ascii?Q?cGjtJwoZYc30lnbYEtm4Dqm1bDbyRKpdMR/7gR7/fE8tD08y9faIu+6beJZB?=
 =?us-ascii?Q?Hi3U6bRY2EHRBDA48Aazo/b8q2qOGQ4g65mETJjOeUfjFg6t6x96?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21837e87-8a1b-4ce6-599b-08de890572ee
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 17:56:03.0874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ggdGPqo1FtsnkZsdl6TU6WIs5UdbUVLOvneVs1TeBIyqT1Id9Cnjct28wDXlPmuQOLc8wgWwX11IjA0mcQcGbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9441

On Sun, Mar 22, 2026 at 01:09:51AM +0800, kernel test robot wrote:
> Hi Yury,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on next-20260318]
> [cannot apply to akpm-mm/mm-nonmm-unstable v7.0-rc4 v7.0-rc3 v7.0-rc2 linus/master v7.0-rc4]

Just as said in cover-letter: apply it on top of -next, or
bitmap-for-next.

Applying this in bitmap-for-next for testing.

Thanks,
Yury

> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yury-Norov/bitmap-test-bitmap_weight-for-more/20260319-221930
> base:   next-20260318
> patch link:    https://lore.kernel.org/r/20260319004349.849281-4-ynorov%40nvidia.com
> patch subject: [PATCH 3/3] bitmap: add test_zero_nbits()
> config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260322/202603220114.k5BHBav5-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603220114.k5BHBav5-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603220114.k5BHBav5-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "__bitmap_or_equal" [lib/test_bitmap.ko] undefined!
> ERROR: modpost: "__bitmap_weighted_or" [lib/test_bitmap.ko] undefined!
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
