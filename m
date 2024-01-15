Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD5E63C5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 08:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNyAHXW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705306996; x=1736842996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JzdlulXBe73yiUDRRXzZjPde3NfNOikX6mjM1bq+jfA=;
  b=eNyAHXW5byFzt6oFk9hwfovsohH+O/cSx8QfbvQKiNblXk/Gu1grAMLA
   LAkEcalTvsXhsgA+fiyzhQ1xZm/ap8JXs226YQhlmKGoFbqpwcxa7U7At
   h4tDK9XM/pV+oeMV9aK4+WpZ2JtnXIOrJ2djgbH+NpbH8SJVWjKkFwqDC
   24gDOkhFgbwRqzz3jE5ZsTOR8eiFx+EjunamaDZFwm7qNby/4/LDhmst5
   wgstlrstcQSc9+3wHcR0rmWgEuJIxDF+jWpKtMKtOxP9Our0zDVpMqMGZ
   1vKaOftnUWYKj3/Wt/QnXSlrRHIr+LWkO/hff3ZE8fXcME6Pi58cmHF9+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="12919149"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="12919149"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 00:23:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="776667538"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="776667538"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Jan 2024 00:23:15 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Jan 2024 00:23:14 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Jan 2024 00:23:14 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Jan 2024 00:23:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgXZfs4eo5rytIAI3c3R5lBpYI/bs5ISTPxbRHa3/8R3m8Rz9zMxWpnJP82Jo5nBsgEi0K+tMoV/HpGKhdwKx9IGZkb4EV3CjGvsdBxbaHP18PdkrRs0iBM8f6s3l6B6uA9NY6pA38pps/ovuDClnwQD+CqIlGdvEwaV7kZ8yN6afcRdLbCQcQRm7fiJFiVaeRqbd3EsaWZG1edu54lFbpG0pizA5hPT8D7l/p+CwTt9i0/f/Npg3wYOm1iUPwqHq1wN/qvoDOu7XtP62o/IpBYlI5c4KTMmIbAoFLrJrYz98rg/C8Dm3fsX8/CUmfIUwjxkPq3HfUHEp/uVYlwsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zWVBNuyMJdfebeBpAdK9oQFvCsEWoLrZZkWEA2xziY=;
 b=W0ZtBi1uYvzAILuhhG9MLifyEkrztHDGXPqXLxFKofPyFegPDSLgY2ADqdEhGAw5kBxMiASv7qEKoEVkMsQ79M6NQQlc/Z4GVe6I9Ls6KM/+fPsBYc8dkAWqgy4ewabKA2Wt+zSPimhcU6taN38spmbVCinyyX5tTgCJwGrFRzlf+X/SvlatPBbVqVgOsPPd52E3I9lXEenTkSXVtYZ4X07Io6lpLFiY33Dsgt1GfQxpuNgc4DvU9RbaCrTokpd9qDxYjHPqNHnE/PHHs2VJISBdRB1zaD4GQhSkKIKYkRszifnf6U4yLGF+agJv4f2RvDa6EIcEra6VkGXxYjfw3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Mon, 15 Jan
 2024 08:23:12 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7181.019; Mon, 15 Jan 2024
 08:23:11 +0000
Date: Mon, 15 Jan 2024 16:18:56 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [plbossart-sound:sdw/start-BRA-support 18/24]
 drivers/soundwire/cadence_master.c:2491 sdw_cdns_prepare_write_dma_buffer()
 warn: replace divide condition 'data_size / data_per_frame' with 'data_size
 >= data_per_frame'
Message-ID: <202401121708.r7RedJy5-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH7PR11MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: cc49dfa4-f3a8-4838-7f9d-08dc15a33668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 57XVW7GEnOk0D8CfyuRzWHUoyB0w4RPRnb5r+Qj2P+bLrmR3C7hi7NptQctrkEf+lo5AwfjoaXUjHLsmw4JzeFAVvJRjFHauGCO6Eh1Rij0a7VljIdLM57exKv0AilU7W/57Tzup76J1E/xrbImdnhyqLlZGLdnDnXxYjBpvpAE/bOUcaFQ1IP8JSDUVj89efOrxfXOBqe3mgUteld8fQUmuKSWicEQ0/fnEdy+O5IFln4XDLPfm2fE2oZgff8vaMkKh8HsfzATdhFccUOyc9cVstThejCx5g1UxJCWURIakqgGPxTzpRMYG/+6XcQifeHtngJFUQFaaDRfWgYCLMgtjPBWg5C4Ocuy+yYl7ZO12esIjqcKLAckHM5W8G8M7oooFbubrQf/DX2CI8J5PO3IWzSSW/EWaZNMk4w9WDrOmpDoPCzkWaikUL2LEosmBwEtlPDmcwd/pgpXnENi8ByUM2L8jnEtJWIg1s58SI1MUeB1Mw0WsiNFgKMgoPMqDn/BXQPF2tJz9mzlHjVh6BTW4FHKFZUQ1AHEpOnR3nu6xbhuU22NtaooHJF5c86yE6GhahroaPmSMMPZqFShB++eB5fY4Ojsi81hEjXkVGsG/2hDezCnQUUPYwQ+LOr2WRO9iQ5ER5exfGDTEKf9FI/9gDz7V4R/Nxu24dARQ07A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(39860400002)(396003)(366004)(230273577357003)(230173577357003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(66946007)(6506007)(1076003)(2616005)(6666004)(82960400001)(478600001)(66476007)(86362001)(6486002)(316002)(83380400001)(66556008)(26005)(966005)(6916009)(5660300002)(8676002)(36756003)(6512007)(41300700001)(30864003)(38100700002)(4326008)(8936002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a+iQN97romCPj5e+mDrnWqrZnAwiCFZEwx3g9PHykjFPguck0V2CqcT3yWPf?=
 =?us-ascii?Q?i8kBIX9+VkcFWeXDiIbSrZjYUd6e/3cp9xiF2IT1vZGkpwTjygY5nLVVwu0H?=
 =?us-ascii?Q?isT3l+WXGFzof4wHoMLQq0Wolx1ibXdsAAkPOIE60PL1KN3CJm76IRu/ghct?=
 =?us-ascii?Q?ceMl9hcltBDEe4twl15Q2MWxZulSIkoy+EBmkhuS07G3e/t0SUvgtk2bgxGY?=
 =?us-ascii?Q?L6qO/7bUX9O7Nxux/L3KHFdmiRI4HnuVha5kW9nUZ5+br6/U9/lzMZA3tV2i?=
 =?us-ascii?Q?RZeOlN3FddGYQxV/NEtThacuR3rlcF/nJ5e7xN7MXefdmuIUz/gpQCJSmdJZ?=
 =?us-ascii?Q?jbuXCI1RTQ3eWSoFR7QaZNJwlVy/R5FM46PbSpz9478uNCv/hpAaP/3Ry6Ib?=
 =?us-ascii?Q?0iR//TxhE1kSZM7ckRrywWWoHk2+huZjXQD5JUy6kM+8w4ItK1QhVvOuW/GC?=
 =?us-ascii?Q?oBVLoUpSTEGxOco79prxN48JF08wv9P49WxP4FZQRRILcQRuCS4PpBcGTKUV?=
 =?us-ascii?Q?mtFGDF3o9/GFeYOjioZIO4Tc4QGDDaCFywSkSedF1N7pPoQGr6XVojg7YHr8?=
 =?us-ascii?Q?d85VY2ZQtfBlDSUAJkwhLoliJkI713c6YYLD7lcP2L+lDb5/mbhLOnVdKVLh?=
 =?us-ascii?Q?Wuq7q6jxrMEu4eOaSrTnARDWmEbCOD3bG5TEzKh4gZ3IiY+2bB5p4R86o/pE?=
 =?us-ascii?Q?Bn8Bf+Tjesl6wjtHjDIB0VKIc4w64KzzFHdLY/XFAux4Vn/0h55vUuNIMdPl?=
 =?us-ascii?Q?b8XO93X1//aRL20R/wEc2XvjSCI7Sn9wRtwAVRKvszHKX3Wt5W8C9XPbGcjz?=
 =?us-ascii?Q?EHF9dOiDfDp/v+9Hv2hgr3pw0vWOuXfoYXPj0Pqz7xtc19y5tbz0185Gbign?=
 =?us-ascii?Q?SPJz3QJdeqLDk/aapfvvwLKDs/UUy5Hv7vbo57okO6QwuULIvR7JuU/B9Lkd?=
 =?us-ascii?Q?9DZuq3EwM1xJkCPAJOm4QL3BcTxU5af6Y7eAOg/tOxe/11s49eCfZivYAhBq?=
 =?us-ascii?Q?1CHfMZKoxBNloV783MkpugwEczSlZILRPxGp6TiWurK1lUvMWmtfYjJYubBV?=
 =?us-ascii?Q?84dGmn9BwpSqQRaNKSmS0Zku9GxpI0QJy5MQHi9U9UTnezqkKN4fY1wxsLlT?=
 =?us-ascii?Q?BsC1nIEOgvBIypKPGYhZoN2xzE7OhIn0nRDznQh2t9tEqlyVjW5cJsc3LuBe?=
 =?us-ascii?Q?aDeTBfGfAduwVlIXDXGVAAVHVK5n9t6vb6Hi2gOGEW6U3P79vmCpdrBjnMkh?=
 =?us-ascii?Q?vSYO6mzHu47sWLxYUxmcDKIU4eaXv6TJS86KQfgDvhCViMRVdCfQi0jI+bJd?=
 =?us-ascii?Q?cGpFZW+Cu78vWzu/jaG0buuwcR4sioYeABYf67wAIg8PwwE/ms3sUg6W8rc9?=
 =?us-ascii?Q?VsMgJkJHcOCTOhsHi/S6Vsa27N2mB4QSSc9kH9ifVuyjdd0Mq+qZAecwsO7w?=
 =?us-ascii?Q?TrGJxPd70waKyKOMV4YrhL98PDvEm5Jijpai+vxBhPjEpv8CJarzvjvaO4s1?=
 =?us-ascii?Q?t3O//zVB6/oHKnT3VrWXnEzWmFbJJ1SpPwRxo5kuiqwNuYDNscxLq2o/QqrQ?=
 =?us-ascii?Q?wt1FkONHqenUQxX0N/fyDz3Gb9bJ5ayJRzeUQk5I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc49dfa4-f3a8-4838-7f9d-08dc15a33668
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 08:23:11.8876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epLvYrJZXg+yOVvaO0RuSzle2W8HXtrWdW56mYCKIL/mmjsBjAviOxNb6j5tpITjb2ZjeauzXYtgeLRsqneDzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com

tree:   https://github.com/plbossart/sound sdw/start-BRA-support
head:   50aee9a5ec1045ec898ccd6d62210aafda658368
commit: 295c9047b649086d38dd4582c9c0f3e1e331ac72 [18/24] soundwire: cadence: add BTP/BRA helpers to format data
config: x86_64-randconfig-161-20240112 (https://download.01.org/0day-ci/archive/20240112/202401121708.r7RedJy5-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202401121708.r7RedJy5-lkp@intel.com/

smatch warnings:
drivers/soundwire/cadence_master.c:2491 sdw_cdns_prepare_write_dma_buffer() warn: replace divide condition 'data_size / data_per_frame' with 'data_size >= data_per_frame'
drivers/soundwire/cadence_master.c:2491 sdw_cdns_prepare_write_dma_buffer() warn: replace divide condition 'data_size / data_per_frame' with 'data_size >= data_per_frame'
drivers/soundwire/cadence_master.c:2566 sdw_cdns_prepare_read_dma_buffer() warn: replace divide condition 'data_size / data_per_frame' with 'data_size >= data_per_frame'
drivers/soundwire/cadence_master.c:2566 sdw_cdns_prepare_read_dma_buffer() warn: replace divide condition 'data_size / data_per_frame' with 'data_size >= data_per_frame'

vim +2491 drivers/soundwire/cadence_master.c

295c9047b64908 Pierre-Louis Bossart 2023-11-07  2465  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2466  int sdw_cdns_prepare_write_dma_buffer(u8 dev_num, u32 start_register,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2467  				      u8 *data, int data_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2468  				      int data_per_frame,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2469  				      u8 *dma_buffer, int dma_buffer_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2470  				      int *dma_buffer_total_bytes)
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2471  {
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2472  	u8 header[SDW_CDNS_BRA_HDR];
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2473  	u8 *p_dma_buffer;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2474  	u8 *p_data;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2475  	int dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2476  	int total_dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2477  	u8 counter;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2478  	int remainder;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2479  	int ret;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2480  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2481  	counter = CDNS_BTP_ROLLING_COUNTER_START;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2482  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2483  	header[0] = BIT(1);		/* write command: BIT(1) set */
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2484  	header[0] |= GENMASK(7, 6);	/* header is active */
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2485  	header[0] |= (dev_num << 2);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2486  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2487  	p_data = &data[0];
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2488  	p_dma_buffer = &dma_buffer[0];
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2489  	total_dma_data_written = 0;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2490  
295c9047b64908 Pierre-Louis Bossart 2023-11-07 @2491  	while (data_size / data_per_frame) {
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2492  		header[1] = data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2493  		header[2] = start_register >> 24 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2494  		header[3] = start_register >> 16 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2495  		header[4] = start_register >> 8 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2496  		header[5] = start_register >> 0 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2497  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2498  		ret = sdw_cdns_prepare_write_pd0_buffer(header, SDW_CDNS_BRA_HDR,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2499  							p_data, data_per_frame,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2500  							p_dma_buffer, dma_buffer_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2501  							&dma_data_written,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2502  							counter);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2503  		if (ret < 0)
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2504  			return ret;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2505  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2506  		counter++;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2507  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2508  		p_data += data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2509  		data_size -= data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2510  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2511  		p_dma_buffer += dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2512  		dma_buffer_size -= dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2513  		total_dma_data_written += dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2514  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2515  		start_register += data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2516  	}
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2517  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2518  	remainder = data_size % data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2519  	if (remainder) {
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2520  		header[1] = remainder;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2521  		header[2] = start_register >> 24 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2522  		header[3] = start_register >> 16 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2523  		header[4] = start_register >> 8 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2524  		header[5] = start_register >> 0 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2525  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2526  		ret = sdw_cdns_prepare_write_pd0_buffer(header, SDW_CDNS_BRA_HDR,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2527  							p_data, remainder,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2528  							p_dma_buffer, dma_buffer_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2529  							&dma_data_written,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2530  							counter);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2531  		if (ret < 0)
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2532  			return ret;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2533  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2534  		total_dma_data_written += dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2535  	}
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2536  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2537  	*dma_buffer_total_bytes = total_dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2538  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2539  	return 0;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2540  }
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2541  EXPORT_SYMBOL(sdw_cdns_prepare_write_dma_buffer);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2542  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2543  int sdw_cdns_prepare_read_dma_buffer(u8 dev_num, u32 start_register,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2544  				     int data_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2545  				     int data_per_frame,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2546  				     u8 *dma_buffer, int dma_buffer_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2547  				     int *dma_buffer_total_bytes)
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2548  {
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2549  	u8 header[SDW_CDNS_BRA_HDR];
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2550  	u8 *p_dma_buffer;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2551  	int dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2552  	int total_dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2553  	u8 counter;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2554  	int remainder;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2555  	int ret;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2556  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2557  	counter = CDNS_BTP_ROLLING_COUNTER_START;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2558  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2559  	header[0] = 0;			/* read command: BIT(1) cleared */
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2560  	header[0] |= GENMASK(7, 6);	/* header is active */
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2561  	header[0] |= (dev_num << 2);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2562  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2563  	p_dma_buffer = &dma_buffer[0];
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2564  	total_dma_data_written = 0;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2565  
295c9047b64908 Pierre-Louis Bossart 2023-11-07 @2566  	while (data_size / data_per_frame) {
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2567  		header[1] = data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2568  		header[2] = start_register >> 24 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2569  		header[3] = start_register >> 16 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2570  		header[4] = start_register >> 8 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2571  		header[5] = start_register >> 0 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2572  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2573  		ret = sdw_cdns_prepare_read_pd0_buffer(header, SDW_CDNS_BRA_HDR,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2574  						       p_dma_buffer, dma_buffer_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2575  						       &dma_data_written,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2576  						       counter);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2577  		if (ret < 0)
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2578  			return ret;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2579  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2580  		counter++;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2581  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2582  		data_size -= data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2583  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2584  		p_dma_buffer += dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2585  		dma_buffer_size -= dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2586  		total_dma_data_written += dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2587  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2588  		start_register += data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2589  	}
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2590  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2591  	remainder = data_size % data_per_frame;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2592  	if (remainder) {
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2593  		header[1] = remainder;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2594  		header[2] = start_register >> 24 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2595  		header[3] = start_register >> 16 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2596  		header[4] = start_register >> 8 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2597  		header[5] = start_register >> 0 & 0xFF;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2598  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2599  		ret = sdw_cdns_prepare_read_pd0_buffer(header, SDW_CDNS_BRA_HDR,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2600  						       p_dma_buffer, dma_buffer_size,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2601  						       &dma_data_written,
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2602  						       counter);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2603  		if (ret < 0)
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2604  			return ret;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2605  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2606  		total_dma_data_written += dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2607  	}
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2608  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2609  	*dma_buffer_total_bytes = total_dma_data_written;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2610  
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2611  	return 0;
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2612  }
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2613  EXPORT_SYMBOL(sdw_cdns_prepare_read_dma_buffer);
295c9047b64908 Pierre-Louis Bossart 2023-11-07  2614  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

