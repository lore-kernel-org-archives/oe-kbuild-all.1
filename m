Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E3447376
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 13:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VCJj3Ul4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696944461; x=1728480461;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=YHBpDPUtbSCj60siWyyYsXxGeBoWvu1774yk8vm9fRk=;
  b=VCJj3Ul4AcQBXec8ZSVanmQYFGCIkFDzpl1DXh/ZVRY+jyblHzsRor5X
   Is+KBaFHodZmzVrExSlPTUwhhAXWF4xBVUnv573NansqWAYIobwUMWXRc
   9pz48MF8mXbfHOYA8NYSZb4MOLoHtFHO3eoAwhTDpt5Qp8DC6QxxRmiNO
   h+wT23cTRqNI6bMgI14/Km3E6yLSGC6nUnr14EDYDw2tlhbkA+1qVE0LS
   XPS0fxZ3VXGVQAycbYmvehYRiFZczlOlmYDiblwAzFHqreT94sgCw8lLR
   19rvFDiCjvLo2JkcP4PM5PM7AzbSmB2lyMRS3jXf6mCVSJ7uOs1IngEMT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="387228752"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="387228752"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 06:27:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="877222562"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="877222562"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Oct 2023 06:27:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 06:27:39 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 06:27:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 06:27:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 06:27:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SVqqdOZT0x9idAWRftdv+eR7SPt0K/jws7VExRrS3tm1Zie/N3wPDh1FIVoPjq0jdzqcvmqauSNGrshHCpSan8dhzm4QmxMcl1bW1kWFPxf6YRjx2awQxdnnJZN8b3ZruyI47fOj6WvTfkLJxoL8DEuST6gYSzKyDhlK1DpdcOLZmBU834zdTP2+dPbRrouuPPz48DCgHpOO0bCBogLCVeMzngnSWI+RF2MYFipwnoBshmUSdD0uWhNWf5K7iKXDFq5GZMJWF2k9SJEzhWn8EJsYJvsosN1J7gzfLqW/cvkP2qdPwdiWNfF8CX3orVIotZXmY1Py/+A4rm3fSzEBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/XcMHxR/di2sq0aEA8D2/5kQQGPcg7mAac3sp9NWuQ=;
 b=cIrkZ9ZRkbP5xNvk6whU+bAobudI/01NkbO4yIKRzRzRgsdPd0M0uVVVj8f6B+7BIDdxwvgy5Iygng/9s0y+aFJ3AKMOGvB2lBo1182P3z5lwCaNsbMvDEAk3mmp2z4J6RqVM87mTMBxBuFXPsXPlJ7Ur/STWj0rvgd8GUfihCA6BpnGLpuBUgZtq7fgpjSLOjkoT7c78Rag0rTKjGuozDP7Vu3R02cHCORHMpwocvOMLhdN2o/qXA0dhhPuijwuxFVoimNWPDnddB7aFa6MZWdcnQRWszEzHxIe98xXLo2KF3AoDhxR1uMcZfiGfsQPvvqkaeYiaBXLtDMsOOmnrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by LV3PR11MB8508.namprd11.prod.outlook.com (2603:10b6:408:1b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Tue, 10 Oct
 2023 13:27:37 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 13:27:36 +0000
Date: Tue, 10 Oct 2023 21:22:44 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [jcmvbkbc-xtensa:xtensa-6.6-rc5-esp32 14/38] checkpatch:
 WARNING: else is not generally useful after a break or return
Message-ID: <ZSVQJEEc8X7Kk1gd@yujie-X299>
References: <202310102025.poxDODsH-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202310102025.poxDODsH-lkp@intel.com>
X-ClientProxiedBy: SI2PR01CA0053.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::7) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|LV3PR11MB8508:EE_
X-MS-Office365-Filtering-Correlation-Id: 0095319c-8d49-445d-6557-08dbc994ab1e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XD7mdDOGuMUcOfm0r8SnlkZnj8XBNK0GAlvTMAjnIXPrraNbiF38j/c0W0rOPkXX4D36tMlI0fD23MqwCRVOCaF/pkgeqZL3R22kKfvMfDkAvS5CHbRhlIGm/8R+20woQIHQ69kUa78LYtUBxet0s1CSVppFLWPxeFtKaNkG9e8rqQiy+VUixzjztaN6vwbqJuzlslkfnaHYg3f6SiSniEf1V2ejLswXbNdMS0xG/IK9gTApC3ongNNW3tkVf+J55KaOHX4b8lbiHnUi9zpuDhrszXboEBZdXn2pBwpZ6cV7iqMo3L3BSb0sa65W5SeX5NUcdrO9C7uB1wIvEkcecjSuwsUMhT1OEWyhO7wq1TLysQRqqweIzP0s6zafvUn9TMeZ1tZ8pn4cQVZqFzSq+Qrp+QSYo2I6IxcGFnWtkYzAfqAOU8MU7d0yG9NBnlK+6sZlxOIuj6s9zMKApISAml5PnEcVWML+j72qB/NGwzbGurxGwic+pHpCb+uGorAd4jxAiMFQLOcn2N8/Ro28wKSQyz4qtUUdp+KGhtC9zfzqHpmgRtdeN+Ricj1faQdj/fpCJXBFFHz+5wRftMZEvcAPiohFG6Yv3jNsUELWWeTmKLBW8/JUC5gNHCFRyRHdMSe06qodTGyLZ38X/92/kA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(136003)(366004)(396003)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6506007)(9686003)(6666004)(6512007)(38100700002)(86362001)(82960400001)(316002)(83380400001)(2906002)(966005)(6486002)(478600001)(41300700001)(44832011)(8676002)(66946007)(4326008)(8936002)(26005)(5660300002)(66476007)(66556008)(33716001)(6916009)(121003001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QrwSLIIsADdC59kwEuOqYjSlyrXbc+0DhfeLzv9PBokn4buiHeSf1D4zbDCF?=
 =?us-ascii?Q?A+Q0EcDGX4t4p9z6CQP6TtQLTydJFS3T2tk2pvZsE6SaaIF5KiIeHq6CDu8k?=
 =?us-ascii?Q?LZR+wwiBJAt+5OhmItxK1Gw/SARdsFK7jjxRlUZXWRrIAODw2v+eMDRM0gRA?=
 =?us-ascii?Q?CyrbBIOSTawdQIpjMvce/QKDuP+I5pyDKL3XhDDe5gwu9U+G9dHauiZdQzoH?=
 =?us-ascii?Q?ID8JS/FAiwedXF49kLGH8UFsCIB0Zv863DKkBwT3v7qQ1la0Z7segOmADWZ9?=
 =?us-ascii?Q?hswxTcL/xWryJRcOEzTYLAqvKuIQKoXIugaj/K6JC3T6pKwi27rYt8jHpUKO?=
 =?us-ascii?Q?M9XnghCOj8L9c5qClXsA04CSs3oKlkmCSnz3L6gW7kd+wlVGulOjq+yvTMLA?=
 =?us-ascii?Q?vqCrrN9YI7my96zR80yAmiLDWPizUO8mKnDJwNkxde49Ylkp9g8limYCR6F0?=
 =?us-ascii?Q?c9S8EiwMhi7dnLdstspgtAa1LzyHR4tE1gi8JGVscGQyb/diUVYB+jMDoS1Y?=
 =?us-ascii?Q?ivLZUH5y+7AC2JeTZYw5AMVpToxxIrPZTpCa08HuuMSM85ac7PckbQ4rxzZc?=
 =?us-ascii?Q?XT9POUIuhKzzf6fF9KBx4FJh7WekbTaxuRBCrInJFSapn6meOE+166yE2spu?=
 =?us-ascii?Q?AxBjuWGSae0k4UEKwTGYiiqFi9sOfgB6w7ALHZSv2BSYPNz46YG8zpo8m5li?=
 =?us-ascii?Q?olYMRVxoSG0YzntQvbouUoV3jJnemkn1ZN0j84Tp99yKYRVPpNXPwf1Xb02W?=
 =?us-ascii?Q?Ccu7u0JjCNXl8au9kG3x1oUUiyo7bkBrL/OO2OW5jopmtsbAeftLsIRJ45bP?=
 =?us-ascii?Q?eetV88LZcwd+f6s+TzSzlSKQ1Df75VOy7x6iJqLsIuhdJ/Ft7HfxnIqqcR1l?=
 =?us-ascii?Q?vk7+nIh0wYYg8PiF5LbcDQj3e8uvhNRDQcxQLl0LbV6/x+DgwLsSJoDVOrvh?=
 =?us-ascii?Q?qZ+x0sYAlSckHLVEskDpmRjf0+V6DppZ6szsHqqm+in6Z4JS6tb7tKMDzDOO?=
 =?us-ascii?Q?YRzrv1vIYbbQ5+Jixwx1QL3ZMNKlL1syhiFGHE2Vstptm8Qr/yCsJziArGOa?=
 =?us-ascii?Q?v5gRGiByjSavMtzeyOKHHsKYKgn6UvgoFnBOyN7tIFkMhTF1iCAxw8q0C61Y?=
 =?us-ascii?Q?daqW2AHCCS6vW9oYAZVLCy7c9Au/OIbU3DpLhhDZ5TQaIlr46ILeHpGVGDtN?=
 =?us-ascii?Q?xQIYdTnaJQiIkVejF8ilvF4X9PL/wSpr+gS+vA5R3wT2IIXtTi8CGaWt00La?=
 =?us-ascii?Q?s9F64J5je523ozZHVqfcZI8GqrfRhsnJqoRsj2b0ETFGDpeIgalQHm+qaWQ0?=
 =?us-ascii?Q?qxFWMdYmXsPSG8M0QDjHrxX+yVH8lqwhXoCe0apCb1/LX+FYmxEd7b4oBxCS?=
 =?us-ascii?Q?a++rZR6tGOMobMv6SvZRI3dsW0rYatjjYxL26xnfThS+ReZLwa9Qb1TzOvlB?=
 =?us-ascii?Q?fEplbjhiTqsKJQ+mW+ozVSGTREZNe1Zfjp5jA10Blfipc4TLNi5jq3plH9b3?=
 =?us-ascii?Q?EIdAuSXPYGl1MiNiNIMm4PtPi1hhsLkdw7CuLdQ+IkF+SYV9DkITzmBr/GA9?=
 =?us-ascii?Q?Wn5z/uf65RB0Te/GNQ0TCqPrsklcS7Qxqz0ZpHJO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0095319c-8d49-445d-6557-08dbc994ab1e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:27:36.7260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LD60NkI19umRhSssb1w3H2xOn5oWMUgVLcll69/cLI+zPw0Xt87RCwXeNPpJaiF9v8P9XMTlLf8DylyKegdZeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8508
X-OriginatorOrg: intel.com

Sorry for making this noise. We made a mistake when refining the code of
the bot. Please kindly ignore this mail and other similar ones. We've
found the cause and fixed it just now.

Apologies for any disruption.

Best Regards,
Yujie

On Tue, Oct 10, 2023 at 08:31:46PM +0800, kernel test robot wrote:
> tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.6-rc5-esp32
> head:   224f43124c24326eb21de553984a58d8528a48d0
> commit: 8264985b44b56ae0e4bc756d11424b7297ae34e2 [14/38] misc/esp32-ipc: introduce generic IPC for ESP32
> reproduce: (https://download.01.org/0day-ci/archive/20231010/202310102025.poxDODsH-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310102025.poxDODsH-lkp@intel.com/
> 
> # many are suggestions rather than must-fix
> 
> WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
> #161: FILE: drivers/misc/esp32-ipc.c:112:
> +			break;
> +		} else {
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
