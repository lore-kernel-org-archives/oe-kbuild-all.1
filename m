Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79735EBF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 01:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZO8ym8uD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698717405; x=1730253405;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=QwR1yoFjheV/pOjIKxLCFh7xXgE3O7Cq1HwGHb7/BZs=;
  b=ZO8ym8uD/Mj7GT0kfiSV9yLl/Lvt9lb+2QfxALhuKG/FVbpVFWHx2zu4
   7B0kv+otofvFMTC6v3mcSnXujYvlX2unQOiw2ZOjBgbdB1zBGv+3+ISpQ
   hKAbTf6VfkR7aOYabS//tv2TF2lqgYsUe64lpRbwkhoYGHUv8+x3GuioL
   d1ryTB2p3KebzktMYT1uAmjnNP11in9zApN/6kPc1a3T+U78X9dHn/Ldq
   hIiGYDxbFHu/mvl8egPveJFQZoC9xEhhiLWh2i6ETCWXd8enUBzZ+9na1
   MifujNdLQwzskRtX9iwnXl3oXO3Wzd7colhZ9Uj3oD3otUxo0sHncpKIe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="6821231"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="6821231"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 18:56:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="8551492"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Oct 2023 18:56:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 18:56:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 18:56:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 18:56:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnM7NcX+B+wr1LTNNydKErJrnoN2rd6dT/IGhy8B2MFk4Iq3Kr2BHaZhvuaQTfqhDZCJU11uYjAgypX/pdXxFAZQQ3OVlNvEKtqSYusWRQmTeMYZD6+Qj6R1Z1l4zwgkCYj4AcIr6bxLVv64tzQNM7rSsOx4xBCdOKExqmorQ2mxWsRRjksq6EXhdUCmTZUkSb2gVz+BewKrvfA1C50/VNIEJHHyjmK6BPYt5RsgNkLRGH0O0bXcqdh7iECtZoJ50ySIX0c60CgIO2UFXbyZdlWnjKDeD/42M07xaxSQDYCLLNtS9VAXAWXaVLmOcRJgYEZTaxWg7gHy5n9Q0xVmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKqOu5/16lPTPI0gbEF2x9sEsUV/0K6WPRd3hm0GYPU=;
 b=GziZk2EZT+zGKcLFW60aqYeaqshYH1EMciCQ/Xmk7lFGLgsbrj8Y1SJM3LMYFq6KM5rQ1yzzbNa+x/jCtQn1vWONehRgXH5ClVGjHLKdWH+YTysuZsX+CNK+0IThmnteKyGLr2/a4WkxY+tFANxWzXDcmvYSYvB6ZjYwUvjK8rYIhluouvTtkJgd3HF/YTvUMpO6e7MrJpJ5xQjDshoYE6ubWXp/9BJhgeHOVvMUugIr24+zAe3vYn6WX58bbJmHwNrtHQQlG68vi9z6s8jdhAeVQGQ76XzjIPcGRKCjtfQxaCFXev1l0QU3ivI+QIvIfSkjM/PWfyVc9pyi5C8qJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 01:56:35 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 01:56:35 +0000
Date: Tue, 31 Oct 2023 09:51:49 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v2 6/9] media: atomisp: Use accessors for pad config
 'try_*' fields
Message-ID: <202310301422.ueunKw1B-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231027091649.10553-7-laurent.pinchart@ideasonboard.com>
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DM4PR11MB5232:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d0ebad-30b0-47fd-a2cf-08dbd9b49c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qXDz6mBTOT/JyM0kd8CindXEPTA58bDCxsxdIUi9USBJ1Bwz2vEOJxVgjHvYoJzkRv4ZPn+FNpwKilCjGynyCgGxoe9fa2FKS6Kb166RZxb6Hf9N3kGUJ5jSYNp4pycH9pk3vSjr3u8xEEjzWimY2CSKtd3eUShIcu+Zg91pT1KojnYn2a+qtZnqeEYyU1ASvhANd+GPkIsDpl/5adz0sFzO0MZ98eT5R0/Cax7VU+RluUvOXl3yz0Sp3IyPvAif6OrdMC/CwXg/cuMugBELMMFZeXkiZw2y5Qbsf/sXlQSrSQ868MdywdT5rcraTjpL6ujdOFKyUAYSfrDuRTaK+iH8NG9iAfgtrIjzTTaX6RZT62SdMn3r2LjP2/pKillI8wqiT0b5H75fYn+L3D7KEMJ4Q27RxR4z/hE8YapKlpx1CxLrjBgW8BOjqdK/gz1KjcCSDgtCYSmMFXv4NSW3eC7OdqWFkGV16108X07sQgkI4htXbyTjkJNsTpm0Yfi0JDCn9WiJiP2+z4Yi/tqYNoVOpYO6r+oV7GOh+YHX28H3o3Mq+ardIdeMQykUCBhnrtjQvatN7Wxuk05QAkPggXjkogfx6UmLpGwgjh2sL5Q9TV5hkeRQOpJBGt2K2viPM7ZMplyXvOIUaAvoEqwn1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(376002)(366004)(346002)(230922051799003)(230273577357003)(230173577357003)(64100799003)(1800799009)(186009)(451199024)(316002)(2906002)(4001150100001)(38100700002)(41300700001)(86362001)(8676002)(8936002)(4326008)(36756003)(6666004)(66476007)(6916009)(82960400001)(66556008)(66946007)(83380400001)(5660300002)(1076003)(6512007)(26005)(2616005)(6506007)(966005)(478600001)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/1tIx/SIKxn+V2SAPUtk02D3YNHjdOKb+itEr4hY0M3uMRB+KWlmgZX51C06?=
 =?us-ascii?Q?JH7ZwzMwudRxT06xI2/n5OUTtCs6022tpypzpq/vvYlsGwZdsDgcJgt2m+7P?=
 =?us-ascii?Q?2LKKjTV279ofKFsE/fwFMVl5JFEY9PklB/hh25tbSn68cDWPrgViOKMVMLom?=
 =?us-ascii?Q?6PGIJZ2V924SKjd1W4e1zdr4dycR0oeR3Xu6gNXM1hc9QiZKDKNn2nU+65Ke?=
 =?us-ascii?Q?iPwEIZlPmO8h/Qkl/ghmC3pksyAguTQSF6xYSBElhZfOEO+O9kGYC8G2A9l0?=
 =?us-ascii?Q?gh1DzcEnVj4QVyu2JbnCknkn3SGL083wRpOe39PE9GsHcVT3j+1dEHRlj/6t?=
 =?us-ascii?Q?rOEMos9ny4huoXZyTCbzX5Z5zjhRuGMh1/Qd3reAXoUZzpo4NsaTiuavXYsJ?=
 =?us-ascii?Q?7CNpJCPJGupBcIhcEWsxfWH2K65RQMavNC6tayFxhg6uPSMzSsH4bxAPnUll?=
 =?us-ascii?Q?PwjCjm+3FiiEVYGwiPdZZaUJyJqhLnlLqUw0x2ZW6e8IzZKJv+8Nol5oOfvS?=
 =?us-ascii?Q?BNdwJlHE1SAuI5PhNIZaNcB8V75ueK12oDDGi28Rh8+dg82uvpemtdg59TvV?=
 =?us-ascii?Q?Jx/4DXXflKKI+HaXxg2mWH7/9jxy27bCT5G+C7qHaFsb3p8IoBfkBUYtTyQs?=
 =?us-ascii?Q?0dplkplYd8cA45RmJMH1/1d0r0R9HL4wYRq2VfTduyYfhXYzVZsjazdJuMTs?=
 =?us-ascii?Q?URrF3hBG01q2cAS8w6SfI8b/jic7Urqo1UKzQAdyimn5iIdDhIxDMhcKAXK4?=
 =?us-ascii?Q?bgGgryZu+hJdxNqRU+aUsqU9RruXUJ3mLYfdN5LVESuANa5qYP8sNf43Guuc?=
 =?us-ascii?Q?AiBehGUucEoZXMMTiaf1ke/+VdIZehhCQnenp6WUqdwqGn3+XgAusbRz/m20?=
 =?us-ascii?Q?ZMLvaKNd9FbjgHk0+Uzi7uM0R/cMp6lda2xNPSsB/lNspcWUhi9yeCycTF3e?=
 =?us-ascii?Q?b8zIB9WHV0vGIoiYJGsoaY7vCzJmHL4NnNCj0Lq1Ujldze1KxPYBUvfQ1SZM?=
 =?us-ascii?Q?Zs+n6zjidG459+3MKUQM9H9tFHZcONFuuIA2dPyAmHH2AY/9FNtP5bot6s9d?=
 =?us-ascii?Q?gsEJeOGR7H9ALLOiDl3Cay36nhyixnc/9Hv1HVbq07jjo/DRbfx3o9gLHOFr?=
 =?us-ascii?Q?X9Zybh02+7CXrK7bciczpZFNT9M1m6tV5ukoePxG2Y7q9N6xczkhwI+ENuea?=
 =?us-ascii?Q?KmVik2Pic7kIk9AiulCHiXII1a11o9vqWBBpFytTjkfZtC9auU3Jsco7uH6W?=
 =?us-ascii?Q?9M2eJ69a0jQZZGa7waV3PLjRJIH+9A6g3Ag3RBjxMKHWxSyrRUQlymFEBnFJ?=
 =?us-ascii?Q?1AJqDDqNjtLXj7On1v0GPnIgXme/1mocNPIMAK5flI9MUUgYHSfXrFs24iLc?=
 =?us-ascii?Q?e1FATpshaobn9aMPLsZQcJTysl2RV1UZJGHj0xcPXjGGcyWbuSUUCpV3gM57?=
 =?us-ascii?Q?jkuHJ3YeAvHastSGG3eQ7hhVRV/TZqv6GpPpqdgLFiN/URGG3azUOiBI8oqg?=
 =?us-ascii?Q?KHt/QnhuGKQRuTKa4Kod7q9bORu5HUSu1JboKi4FsjYo+7GypsNoGr5aGlTC?=
 =?us-ascii?Q?dV9W4nGd+2phT2rzuIrwbj6ThQRsO26PGvLHDcrd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d0ebad-30b0-47fd-a2cf-08dbd9b49c8f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 01:56:35.0411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itXeEaXYizWmTyFlK2R4wqeOliJ2+hRyuLdqtG4pE4Rs5EzNBIH68e25iHdV/wqNYHyxCN57dPFlg0l8WFXHXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5232
X-OriginatorOrg: intel.com

Hi Laurent,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master next-20231027]
[cannot apply to linus/master v6.6-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/media-v4l2-subdev-Fix-indentation-in-v4l2-subdev-h/20231027-171856
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20231027091649.10553-7-laurent.pinchart%40ideasonboard.com
patch subject: [PATCH v2 6/9] media: atomisp: Use accessors for pad config 'try_*' fields
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231030/202310301422.ueunKw1B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310301422.ueunKw1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202310301422.ueunKw1B-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/media/atomisp/pci/atomisp_tpg.c: In function 'tpg_set_fmt':
>> drivers/staging/media/atomisp/pci/atomisp_tpg.c:50:18: error: implicit declaration of function 'v4l2_subdev_get_pad_format'; did you mean 'v4l2_subdev_get_fmt'? [-Werror=implicit-function-declaration]
      50 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  v4l2_subdev_get_fmt
>> drivers/staging/media/atomisp/pci/atomisp_tpg.c:50:17: error: invalid type argument of unary '*' (have 'int')
      50 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c: In function 'mt9m114_set_fmt':
>> drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c:669:18: error: implicit declaration of function 'v4l2_subdev_get_pad_format'; did you mean 'v4l2_subdev_get_fmt'? [-Werror=implicit-function-declaration]
     669 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  v4l2_subdev_get_fmt
>> drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c:669:17: error: invalid type argument of unary '*' (have 'int')
     669 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/staging/media/atomisp/i2c/atomisp-gc2235.c: In function 'gc2235_set_fmt':
>> drivers/staging/media/atomisp/i2c/atomisp-gc2235.c:564:18: error: implicit declaration of function 'v4l2_subdev_get_pad_format'; did you mean 'v4l2_subdev_get_fmt'? [-Werror=implicit-function-declaration]
     564 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  v4l2_subdev_get_fmt
>> drivers/staging/media/atomisp/i2c/atomisp-gc2235.c:564:17: error: invalid type argument of unary '*' (have 'int')
     564 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/staging/media/atomisp/i2c/atomisp-ov2722.c: In function 'ov2722_set_fmt':
>> drivers/staging/media/atomisp/i2c/atomisp-ov2722.c:674:18: error: implicit declaration of function 'v4l2_subdev_get_pad_format'; did you mean 'v4l2_subdev_get_fmt'? [-Werror=implicit-function-declaration]
     674 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  v4l2_subdev_get_fmt
>> drivers/staging/media/atomisp/i2c/atomisp-ov2722.c:674:17: error: invalid type argument of unary '*' (have 'int')
     674 |                 *v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +50 drivers/staging/media/atomisp/pci/atomisp_tpg.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  38  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  39  static int tpg_set_fmt(struct v4l2_subdev *sd,
0d346d2a6f54f0 drivers/staging/media/atomisp/pci/atomisp_tpg.c          Tomi Valkeinen        2021-06-10  40  		       struct v4l2_subdev_state *sd_state,
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  41  		       struct v4l2_subdev_format *format)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  42  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  43  	struct v4l2_mbus_framefmt *fmt = &format->format;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  44  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  45  	if (format->pad)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  46  		return -EINVAL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  47  	/* only raw8 grbg is supported by TPG */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  48  	fmt->code = MEDIA_BUS_FMT_SGRBG8_1X8;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  49  	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
64195792383424 drivers/staging/media/atomisp/pci/atomisp_tpg.c          Laurent Pinchart      2023-10-27 @50  		*v4l2_subdev_get_pad_format(sd, sd_state, 0) = *fmt;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  51  		return 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  52  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  53  	return 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  54  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_tpg.c Mauro Carvalho Chehab 2020-04-19  55  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

