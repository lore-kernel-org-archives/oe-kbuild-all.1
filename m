Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B827F1109
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jan 2024 05:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8IYWNH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704086746; x=1735622746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sCYl4wz0kZ00+pds9iqGiKcH9kH9kMINhz+1HRxjJKY=;
  b=S8IYWNH61YnNgDVgZmywstFPm+++zrVlITfKWNsm290CI9mUpkmCtBOF
   +jHUpY91trVtO9KBwPwAElyvu69y4QncCeXZXlsLwXzMyfN5fVkDQlFRs
   6yIqZwaLN5v7S1qIELts7sd03Bq+iPZPDHsoMBUasMhWMWRbee5fHXnup
   6a7xeqObMbclR9JELHsx9Lq0b3FJa6kV0TjKBNj04iu/PH7H8XTfHkMKn
   T1fjaGEGHNBerNYzBRUP679eI7R+slOs9bhpOH5pTmrOlIuQAVjojXCy+
   8/b98Ei6rqtPhe/CAyZhTQWdks+7OD4dlxvqw+spveEd20brbJF7yyEs7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="10164710"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; 
   d="scan'208";a="10164710"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2023 21:25:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="782853196"
X-IronPort-AV: E=Sophos;i="6.04,321,1695711600"; 
   d="scan'208";a="782853196"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Dec 2023 21:25:45 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Dec 2023 21:25:45 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Dec 2023 21:25:45 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 31 Dec 2023 21:25:45 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 31 Dec 2023 21:25:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bm11iZdVEVzwdqt8mbo2z2YvCI2QVYuj+LRyCFaoY77bMrloq5ED6AQ3RVEjeeURC4PWJmNMa/JZ99sNJfxOCfzmxC8NqQQLNDKEx7VQsiusLdq6n3r42H4gf48U/xjn9zuFflmMTJzWHU7EsWq53xGOxUB2KnmVYfmxVzovvXR86Z7YXspVeL8WFcLuuj78UPyiyee+3un1IeUK+d+mv+MZje5LR2BudfU9c2DXvnTIt3AZdHbjwBSRv/gxNuZQclAkDkjPSfy10HpjGrZnhH7lBCpVCImtzc1/3uV4vp7JvuidK9UQd+TvmQSS+Svvb4o8R6nWH+Mul+GOudSAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKbbV1k7/DYak8/lCWz6DRU7DJZ/y4Z7jlU628w++ck=;
 b=MYfhPVqpVHoYdK6XPzH6RcGtVL5XQ+EJXCgLWrrhKv4NF0AN1GYW4j6UrOYw/72GNA0neWi99zFdfJZ5JjJwLrXkbtJBo3pTTMVgszG8Vv8Akb8uuFK2p5K8V5bMZ/OfubSLsRvD4YdFl8MucOadGMIllQc8//tZkfLOuRDa3J7GnJ5nbWDjJEbwLkctAWteIliHjX4RchXVzRQSuo8Tau6DazMIVZmjT/Ptxqn9qs70I6+YlmhK4C5b+8l5lumrIHI53Ptjfo2j1MfZ/GcJ2s6x9bXaHu//9Kb9RmlbK3cVwsUjuUhDMnY6g2LIXfQi9o/A91odBHoZpO4+yfErfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by DS0PR11MB7681.namprd11.prod.outlook.com (2603:10b6:8:f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.24; Mon, 1 Jan
 2024 05:25:43 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::a0ff:c576:dd44:3f12]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::a0ff:c576:dd44:3f12%5]) with mapi id 15.20.7135.023; Mon, 1 Jan 2024
 05:25:43 +0000
Date: Mon, 1 Jan 2024 13:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Helbech Kleist <andreaskleist@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [kleist:ipu4-dev 19/59]
 drivers/media/pci/intel/ipu6/ipu6-bus.c:101:14: error: no member named
 'dma_ops' in 'struct device'
Message-ID: <ZZJMzcpposIbvJ2l@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|DS0PR11MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a5d4aca-79b5-4642-c2ab-08dc0a8a17a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hF6rpyDq8LJ3HKi120++Owygs9n9OAsDquyk5Mlzj4EJIgt5KBt6GiRq6JKy9VOFPJB4nqgHQHk4AxXh4uAQAza2QNZ+yiBovFuui1+2k8Y0JNpns7mhQNncb6vjxt4s51NrWC2m9lXb9TGLBhiyN2TZeJAy89NAVB8PpcALaYguhvXfAhIozoeHbmmhrb74+BK9qnAJ2XumHiXJ2SHdt6Et9CR44T8BWqDuEy2jbnNAN8OiZbzqz63l68WfsSZsmCeRgyrSSXM+SNdwDIS0gjkfnJp6ie681Dro9q3XESr0GI6zkISBdJM+fax/dKotoe8k6AxUYt+mHUX5HEwonBsg5nBbcPS15ID1WV7xwn9rn7Kd/kOTWG4VWnyO7/16GEze6z3/vPxAGMz6Hs3N30cDn35qS2yYMGjSdPpC2VEKsBqITJHndg/v5gQVrhw/EyW8pwpI5fqQ0Y02tFHK5fPJ/7aQWBJCvFwkKA4WezhTXrywrK7ywxY02CYmq8beMCw8Yh23tPG2FGOofIq13DNgcS9egDmEChDoeguGsG3SF0iRDn2x14xHj+5IpsjYH0bQH/TFkmGrKkJbeCxQXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(83380400001)(38100700002)(316002)(6916009)(66476007)(66556008)(66946007)(966005)(6486002)(478600001)(5660300002)(4001150100001)(2906002)(4326008)(8936002)(8676002)(33716001)(26005)(41300700001)(9686003)(6506007)(6512007)(6666004)(82960400001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/qS06a+Gc2WRqTVzkTYDyf1n4WyE1/qSCO59LDccJfXdVkyp+/xpy3DjzsRh?=
 =?us-ascii?Q?VJnZiKIrCef8gDr8Pnmo8eDsuXFOruOBwCGJc+YtMLPzPXVYxQzFY9M3wZkh?=
 =?us-ascii?Q?ZaEBR4Oj3HXGyx7w5P+n2u3ebQbuAQHZodSdrR8bKpZ1gRHmqeFQnOA9ZZX3?=
 =?us-ascii?Q?wdfzpxBMEYHBbdNLbkROGSb5Peu1xmhAZ322r50fkMUgLnYLa0gaeaOUcOyn?=
 =?us-ascii?Q?3FkfLOlUTDFTAF+90S4LCqP56h+SLYbrN33RZ/fcWLcKs+H8xVdBgn6jhaKv?=
 =?us-ascii?Q?2fxRgY/L7cSvUNWlzdNExulCEJcIk+LZvzZk/JVAKALDX6aCQPWrgT5GligL?=
 =?us-ascii?Q?yZt61+iupxdzKMe6JbvGuIvxBYiGOk69+D4nHQlcWfh1CFlcFLvw2Wzj9cin?=
 =?us-ascii?Q?zzK1ZRr+fKXJP/IgUYhBwA3dB8OT7JF7xeuBCUyFc89mRTVyqDnCJg0DSsqt?=
 =?us-ascii?Q?ld3b14+KQ0bxAUBeClCWysK8r9FPkmizK2Q2I+TruUvDjVBfS57eQdAjjk98?=
 =?us-ascii?Q?EteeyIkiI7EYrLu6UbuBEqysv2u7cv/flWl8i/ITRJUQd9063AYCvkVtSTlt?=
 =?us-ascii?Q?KnDKSTmwVbByrm2cYhKKSZXcmNrwG+SWXiFerMKfgH/+W1y0hVEauTy/hoWx?=
 =?us-ascii?Q?Um1T3sA6xTpX0/Kc3cjsyJjpruuWzE1N4gPdCAnxj2mK/lvbShpKEVTCXAPl?=
 =?us-ascii?Q?xBNV2PjSgqhpcjX/K9sbZkOlVggB/7n4+DI/6tN6jZqgRppgWyFzXzBb/SBC?=
 =?us-ascii?Q?rf1HQAHDfloDzse6rvxHmGfcqSwfHIfh7s487DQmYgU0T4drbLObDgjYuMQr?=
 =?us-ascii?Q?zobLgu5Azo12qev5CZPGZlXuMYdX410fYPzS3yBHIN8TJkgyOygZhD//Ltff?=
 =?us-ascii?Q?LV+tAPkPVuwp9liqDs+yRZHig1obXoNJ1OBmOs4/61zMjdrnDYG3Zr5lsAnN?=
 =?us-ascii?Q?pUN2AOnEDHeSw1fjGq38ztRc2IzyHzHlg4i5wt4A/3itnm9qcFME+uYGbL2J?=
 =?us-ascii?Q?pzti+rFI6olxzPYqwyi74O8CX1UMuBS9RwnznoeWSVvbq09m3E8LCIJfrqUO?=
 =?us-ascii?Q?qG2W/PotByjlJrk/WVR9oQzAeklfcZU6hUBhTJzfulDZLP4nVk1/jTORTOIZ?=
 =?us-ascii?Q?OmpqjwDdpxskG9SYZLjsh+TKyjOwU6EWh2/bqF4i989ABDWnl8PiMp6LUIXD?=
 =?us-ascii?Q?3A3sxgTrrtxjNz3+YT+gMt8zT9ud19AzfCIsmqYpHuxIInBqRVtPq5lcWTO6?=
 =?us-ascii?Q?J4qXU3mDyinCBsXstirBH/eyyzRgzepfMWmIam2XkIPQAZ8w4XIFYmksE0ey?=
 =?us-ascii?Q?7A/tIGZw0e6fnYXa+Qo7m8unJpJh9vzGp3oI8uuWFmnml2ceXfbw42nxYk/g?=
 =?us-ascii?Q?SnzmSWcpb2xwjYAoyH2YrUSejUTFFkUnEi2XcMQhQlDRHPEPpJkua6WgVWgd?=
 =?us-ascii?Q?X7DGCnQSTEwUoNM3TNkgr5taiCFYstGjhBuoWt8nqOdFHpTxDZabY7F37GJM?=
 =?us-ascii?Q?N3IKJdD/tcjRbFAy7odR0jY5PemY42J8hBC47QZwvaAwQNvTJcAEmbUteErn?=
 =?us-ascii?Q?DmTh5VpmWnppCc+njie/+ABl5ajcL6Rt9bHjNG35lHqcHHDN3LM5il+2lFbU?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5d4aca-79b5-4642-c2ab-08dc0a8a17a0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2024 05:25:41.6887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5FzxDRkxDHhgkyTzGwuS4M+ZjrMkWj4GuAafnxiLu3fbKlqnAzUFN2SQKV2PayY2Kl9vg6tElnST6QkJkfcPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7681
X-OriginatorOrg: intel.com

tree:   https://github.com/Kleist/linux ipu4-dev
head:   15245fe26e07c9118f0f5c03af5469832928f3dc
commit: d35c2043fb50817f1e5eb1ddb6ae4b95d367ae55 [19/59] media: intel/ipu4: HACK: Re-purpose ipu6 files for ipu4 driver
:::::: branch date: 9 days ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-r112-20231229 (https://download.01.org/0day-ci/archive/20231230/202312300202.D9KXE9bV-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300202.D9KXE9bV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312300202.D9KXE9bV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/intel/ipu6/ipu6-bus.c:101:14: error: no member named 'dma_ops' in 'struct device'
     101 |         auxdev->dev.dma_ops = &ipu6_dma_ops;
         |         ~~~~~~~~~~~ ^
   1 error generated.


vim +101 drivers/media/pci/intel/ipu6/ipu6-bus.c

214681ec4e2bf1 Bingbu Cao             2023-10-24   74  
214681ec4e2bf1 Bingbu Cao             2023-10-24   75  struct ipu6_bus_device *
214681ec4e2bf1 Bingbu Cao             2023-10-24   76  ipu6_bus_initialize_device(struct pci_dev *pdev, struct device *parent,
89e2423725f00f Andreas Helbech Kleist 2023-11-10   77  			   void *pdata, const struct ipu6_buttress_ctrl *ctrl,
214681ec4e2bf1 Bingbu Cao             2023-10-24   78  			   char *name)
214681ec4e2bf1 Bingbu Cao             2023-10-24   79  {
214681ec4e2bf1 Bingbu Cao             2023-10-24   80  	struct auxiliary_device *auxdev;
214681ec4e2bf1 Bingbu Cao             2023-10-24   81  	struct ipu6_bus_device *adev;
214681ec4e2bf1 Bingbu Cao             2023-10-24   82  	struct ipu6_device *isp = pci_get_drvdata(pdev);
214681ec4e2bf1 Bingbu Cao             2023-10-24   83  	int ret;
214681ec4e2bf1 Bingbu Cao             2023-10-24   84  
214681ec4e2bf1 Bingbu Cao             2023-10-24   85  	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
214681ec4e2bf1 Bingbu Cao             2023-10-24   86  	if (!adev)
214681ec4e2bf1 Bingbu Cao             2023-10-24   87  		return ERR_PTR(-ENOMEM);
214681ec4e2bf1 Bingbu Cao             2023-10-24   88  
214681ec4e2bf1 Bingbu Cao             2023-10-24   89  	adev->dma_mask = DMA_BIT_MASK(isp->secure_mode ? IPU6_MMU_ADDR_BITS :
214681ec4e2bf1 Bingbu Cao             2023-10-24   90  				      IPU6_MMU_ADDR_BITS_NON_SECURE);
214681ec4e2bf1 Bingbu Cao             2023-10-24   91  	adev->isp = isp;
214681ec4e2bf1 Bingbu Cao             2023-10-24   92  	adev->ctrl = ctrl;
214681ec4e2bf1 Bingbu Cao             2023-10-24   93  	adev->pdata = pdata;
214681ec4e2bf1 Bingbu Cao             2023-10-24   94  	auxdev = &adev->auxdev;
214681ec4e2bf1 Bingbu Cao             2023-10-24   95  	auxdev->name = name;
214681ec4e2bf1 Bingbu Cao             2023-10-24   96  	auxdev->id = (pci_domain_nr(pdev->bus) << 16) |
214681ec4e2bf1 Bingbu Cao             2023-10-24   97  		      PCI_DEVID(pdev->bus->number, pdev->devfn);
214681ec4e2bf1 Bingbu Cao             2023-10-24   98  
214681ec4e2bf1 Bingbu Cao             2023-10-24   99  	auxdev->dev.parent = parent;
214681ec4e2bf1 Bingbu Cao             2023-10-24  100  	auxdev->dev.release = ipu6_bus_release;
214681ec4e2bf1 Bingbu Cao             2023-10-24 @101  	auxdev->dev.dma_ops = &ipu6_dma_ops;
214681ec4e2bf1 Bingbu Cao             2023-10-24  102  	auxdev->dev.dma_mask = &adev->dma_mask;
214681ec4e2bf1 Bingbu Cao             2023-10-24  103  	auxdev->dev.dma_parms = pdev->dev.dma_parms;
214681ec4e2bf1 Bingbu Cao             2023-10-24  104  	auxdev->dev.coherent_dma_mask = adev->dma_mask;
214681ec4e2bf1 Bingbu Cao             2023-10-24  105  
214681ec4e2bf1 Bingbu Cao             2023-10-24  106  	ret = auxiliary_device_init(auxdev);
214681ec4e2bf1 Bingbu Cao             2023-10-24  107  	if (ret < 0) {
214681ec4e2bf1 Bingbu Cao             2023-10-24  108  		dev_err(&isp->pdev->dev, "auxiliary device init failed (%d)\n",
214681ec4e2bf1 Bingbu Cao             2023-10-24  109  			ret);
214681ec4e2bf1 Bingbu Cao             2023-10-24  110  		kfree(adev);
214681ec4e2bf1 Bingbu Cao             2023-10-24  111  		return ERR_PTR(ret);
214681ec4e2bf1 Bingbu Cao             2023-10-24  112  	}
214681ec4e2bf1 Bingbu Cao             2023-10-24  113  
214681ec4e2bf1 Bingbu Cao             2023-10-24  114  	dev_pm_domain_set(&auxdev->dev, &ipu6_bus_pm_domain);
214681ec4e2bf1 Bingbu Cao             2023-10-24  115  
214681ec4e2bf1 Bingbu Cao             2023-10-24  116  	pm_runtime_forbid(&adev->auxdev.dev);
214681ec4e2bf1 Bingbu Cao             2023-10-24  117  	pm_runtime_enable(&adev->auxdev.dev);
214681ec4e2bf1 Bingbu Cao             2023-10-24  118  
214681ec4e2bf1 Bingbu Cao             2023-10-24  119  	return adev;
214681ec4e2bf1 Bingbu Cao             2023-10-24  120  }
214681ec4e2bf1 Bingbu Cao             2023-10-24  121  

:::::: The code at line 101 was first introduced by commit
:::::: 214681ec4e2bf174045d6527cb97d44941d84eb5 media: intel/ipu6: add IPU auxiliary devices

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Andreas Helbech Kleist <andreaskleist@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

