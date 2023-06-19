Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261F46ABD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 08:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687162798; x=1718698798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=56tSs7B9v9f0j29dt0LrGeALGBzwFTNv5u/opBzIZBg=;
  b=gz2+KJkoeh/IdrNi2/+2a+DkPBbp03ENvmiP/95iva+Tp8LMfJKegHWp
   IaWt3v9nqMKyvVR6CQZd+IZdou8tlt+hgh0aJiCo9m1i8sTu+ljApgN4n
   igdnW+ZhFo837gkRDulOQmxgpHFSj9R4PZQWR0wkCLHC+lWckxNVrmiDP
   ZmkIbW7FRWVscgn+HQbRrcrGhzE/aHWr8tmW83LrLW/hIfpZnBQhc2a0M
   0+qX8eBwkR1WtTTgp2jyiA9Yr1HGsl8NokPH7SKtPwtVitd20Ww+sZ+ap
   s6257QDCcj5VVfS976hdS+y9x4Az3D4VzFj29Fg9nsnMHfMXtO2aDKLXu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="344322308"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="344322308"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 01:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="858135714"
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208";a="858135714"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jun 2023 01:19:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 19 Jun 2023 01:19:56 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 19 Jun 2023 01:19:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 19 Jun 2023 01:19:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 19 Jun 2023 01:19:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0XTOotwmYtqKKD1ZLhg3rPUXZfDYvcYLmSRQpZxd3QGKFEWS/agE6NUWNgrhpZG9OJdytIyqraKZsbyl+Q8FX4RPR7IxZds6pBh8njlfdOVWsIhu+zVY0xcRjAWT1QwbflxUA5HMCEF+x7T/PxJrlSEGly76oioc7lkrW10l8KPEh22xhQIH29a8rgcW5jnC2sKAiOKqsNxRT0a+DS3PZP9YbTD7izvOy88YbJWyILfQuvfzUCa5qMbmXghpdA3foy7YI4rn4Sa/ZWvc7kalwofCwTrINY47P4r0XA/AYar2CAAJJrktTElrEw8dPCzrM9J0++bYZmB54YlHygOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOs813gFRwvct7ADgPG1BLhOwo8u6ojhk1+3WuwAF1A=;
 b=fm9xdndIsPFhsBdYt2zxT18u7AWdPBSZbllgHBhz6ysMPWScooP5R7YAnH+4F5SQH68ltHDXS7d5pqixgTPR16nQ7CP0e5id23hsa3LPlveFR8uNtftN5gB2q00wYGPoRQ7W8Vr0QygdAdzDzKZiVjIwVC5RoK3uVPs3EeFW9HETAgrhb9s0wZHrLlt2p5Sae7UQavqNq3d8vgbzYmFj2+kf5iiVwj9tjUG8KrjsotLzXJ18ikkNVvSPB1YhjtmihWlXiqF7YW8tC7XCo6TgG3dVzM6Xd4i8EJRQpibsgQOKHus2uuyYeUVeuqRXIk9pjqYAxVOy2x/bzfeFulqZNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CO1PR11MB5027.namprd11.prod.outlook.com (2603:10b6:303:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 08:19:54 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::5486:41e6:7c9e:740e%7]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 08:19:54 +0000
Date: Mon, 19 Jun 2023 16:16:47 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Richard Weinberger <richard@nod.at>, "Sasha
 Levin" <sashal@kernel.org>
Subject: [stable:linux-5.15.y 8065/9999] arch/um/drivers/virt-pci.c:644:9:
 error: implicit declaration of function 'virtio_reset_device'; did you mean
 'virtio_break_device'?
Message-ID: <202306190915.1xcsSzA4-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|CO1PR11MB5027:EE_
X-MS-Office365-Filtering-Correlation-Id: 10113c50-ed77-46c3-47a9-08db709df59e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tCrNH8hiwwbet6ZrQRbu9GtmzCfDKcLdIQxSRomIByg12RoHkr8W7o4W4ZSHQ5FEnk1NLijeKX9SMm3ymiVcRtQW/vXNLHTFxLSfgyiB6twz+s7Ygh0ETUf4adzL5rrRBSkTSCfqIw9NjisGvUYnqfQmemt6tkVi8BrYaTvW2RHRJch4yA8XVJdDye20VLwWQIbWejPtV6xSl4Vs0cJj/CSDpG/jVNx3uqxZeCn0STh6K88DpF3sEQSPSVnv2DnwoXCZmq7yQF5Vy6+LSPU5KI9RbLascm2y6/hxwoEuSFE44s2f2y9iP943/Tplg6lvG/5dIyHlAVtnBb0bGh00wY2OwBiUYIZwLfSZi3d1OVPg1DFqwBHsOanGCR4ejZFsNVhN7iXKG+c2YYm157Y2+tsnI0WaorIO1z3lnRM2D5iEZYfkt4BDPaoVBpr6SsTwN9z5TvJUzinHCdDKmExJDHcSO4z2Bdsw9Q+oS48rhy5wTVdQNdaVOr8+NNYoJOX6ricbFK2uXsMu/0bwcw2enVy7K7FWcksji82q1uDFul1tgG6//dz3WOb3HpxP8mar0kcHx4welVzP4pWoh7J+cA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199021)(186003)(26005)(6512007)(6506007)(1076003)(82960400001)(2616005)(83380400001)(38100700002)(6862004)(478600001)(4326008)(6636002)(41300700001)(66556008)(66476007)(66946007)(8676002)(36756003)(316002)(8936002)(37006003)(54906003)(966005)(6486002)(86362001)(6666004)(2906002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kefMuju/vnxaBUWSUQQ3W78ckfrGcrAjpVTUNLAYIPLL1DFEh0mRp0stq08m?=
 =?us-ascii?Q?yPXoEp08Vbl6K4ymWgcgOu+zeEaOMrLfdkj51QdD1fSWl40pNkU+WIGqhtTH?=
 =?us-ascii?Q?MrjiDkJpgqhP6NBjsfqioUqpi08TuFXviBipvDUL5OUu42h5IBOlAarX6pJp?=
 =?us-ascii?Q?0nO1jp2g+HAeRRZvngVh1yn1cwlfPCU0aZiLa2szFjJWw7YYt4EaTE4r0JuU?=
 =?us-ascii?Q?gN7QO79tfIXZ466Vv1jcHnr32cQQYB044+t7Qsb6dwf79zphwYEvopogp19A?=
 =?us-ascii?Q?2X9BW5R2bd4WrhxgzbL2ZUme0PUeHuJ+HG+aukdkRRBURIOi5D4Dd+uSOoct?=
 =?us-ascii?Q?7zO13rC522SPf4y86YQNPsAV6C3UR34pHZjn0iyUP2Ij/gp9MvEgNkIu8z+/?=
 =?us-ascii?Q?EWD3GlTm91RDoPQyBYnCkEkpO221LSyxwr14vWxOG0+9Fhehqq3m1mhey5aD?=
 =?us-ascii?Q?PE4UnkurzLCZJL7O4bWdYKseQK/DH3Qpb/Dk+mzge2FuwGO7plC6pZrVq9Xx?=
 =?us-ascii?Q?kHtD7LbKEFHCe7w5sreovo0AvJwNPB0YLQMrAafOVA7DX7zy4fSBWIO9AopB?=
 =?us-ascii?Q?MlhLYnRI6bEenVVosCUPJ/Gbq78/1H9yOwtiYnX4BgGL5uOAR5exkCGX02am?=
 =?us-ascii?Q?ShIVnnU4nnQEYKCa8EMMvvaTWzoEeO0ZKiTxmHml47G+66Zqw9dzSS+XyR2d?=
 =?us-ascii?Q?7iv+WZapnH32JBxy9fuL1uBEv7nQRKTg7vdO8l/EaV7AbJHmaCytKg/u75nd?=
 =?us-ascii?Q?FEGKC3begiu5l5fZJGvp+3orH6e2C3LyjKecJHvHEOd4i/OlVTWVtWStxivs?=
 =?us-ascii?Q?+nVpRBeu05T9C+sYJ4ymtYQd+V58OIWZ3Ps4Sbh4ZaJISKrAz0GSY9tMPrqv?=
 =?us-ascii?Q?dyzEDQfhQeldK122tiSFsFBW2RRAsT0Chtstcq2cwc4jU13d8Doc1051C9k8?=
 =?us-ascii?Q?qu8OHQz6yNV/8msPjORK62ZCNOJzcV94jz3iiz4NKeFtfuREuctxrMfIC2cO?=
 =?us-ascii?Q?ecB8+d+ixOPfYhKw+lkuaOW32i3oztQTtsEUmO0Cwizyb8rbIOuR/aQbQONN?=
 =?us-ascii?Q?ERrW+ZgIoiBdlvVgEdL1Sw4ACh7/LsJRAL1vuKGvKqanORCzZGOHyKF+rUQ0?=
 =?us-ascii?Q?NOI+BhrbFF9m8R7wzpF4fgEGkDI/YQtekFMW50uCkhB0gIanwo6c+1gApsb/?=
 =?us-ascii?Q?+Z0yUZ8qNpwrcI607ZJUOQI7FsQim6a37lhO8bRMxA7acN9QA1lpP13GYo+3?=
 =?us-ascii?Q?kxQPJ54Q9ANgYnbhPNJKcLRITgkAYx3TsnwG2g+qlaa2F4imqRGzDlLRqHuo?=
 =?us-ascii?Q?KvMy7ae7lBzniVviukMsdQfXq+xznrdXjszCXBGdVG0HSdLSknkBDHnNgh5Z?=
 =?us-ascii?Q?1EabkWQk1Ob+oexRhBuLPRz9PEhy9C+xAKmw7alg+OkRlBbvvK58MRlW7Bqi?=
 =?us-ascii?Q?wMIfeRWDwqd1B3t/LUxioKsOp+YQrJJ51uay1RUDI+qvGYy8R+ent6hh2Cra?=
 =?us-ascii?Q?K8WHFrNqWnr4VZmWBa5q3ul8n3QBOfRr6GRArFjNHNNPuCDkP8OgaMMPk1gn?=
 =?us-ascii?Q?MC1vGWTV//XGHaxddwgwmJM4FvagQVbvXHd2p4AY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10113c50-ed77-46c3-47a9-08db709df59e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 08:19:53.9679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B06dVO1d8eczAD6yCrGmEH8tmPQr8EAkt+xM/s++otuMlFlnklKuEvL32e44CqBzCGPWQDjZQ4TJcWaf8fonyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5027
X-OriginatorOrg: intel.com

Hi Benjamin,

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   471e639e59d128f4bf58000a118b2ceca3893f98
commit: a27e95a6ff3fd633422ca44c6d571ef84392f5b8 [8065/9999] um: virt-pci: properly remove PCI device from bus
config: um-randconfig-r002-20230619 (https://download.01.org/0day-ci/archive/20230619/202306190915.1xcsSzA4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306190915.1xcsSzA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202306190915.1xcsSzA4-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/um/drivers/virt-pci.c: In function 'um_pci_virtio_remove':
>> arch/um/drivers/virt-pci.c:644:9: error: implicit declaration of function 'virtio_reset_device'; did you mean 'virtio_break_device'? [-Werror=implicit-function-declaration]
     644 |         virtio_reset_device(vdev);
         |         ^~~~~~~~~~~~~~~~~~~
         |         virtio_break_device
   cc1: some warnings being treated as errors


vim +644 arch/um/drivers/virt-pci.c

68f5d3f3b654326 Johannes Berg 2021-03-05  615  
68f5d3f3b654326 Johannes Berg 2021-03-05  616  static void um_pci_virtio_remove(struct virtio_device *vdev)
68f5d3f3b654326 Johannes Berg 2021-03-05  617  {
68f5d3f3b654326 Johannes Berg 2021-03-05  618  	struct um_pci_device *dev = vdev->priv;
68f5d3f3b654326 Johannes Berg 2021-03-05  619  	int i;
68f5d3f3b654326 Johannes Berg 2021-03-05  620  
68f5d3f3b654326 Johannes Berg 2021-03-05  621  	device_set_wakeup_enable(&vdev->dev, false);
68f5d3f3b654326 Johannes Berg 2021-03-05  622  
68f5d3f3b654326 Johannes Berg 2021-03-05  623  	mutex_lock(&um_pci_mtx);
68f5d3f3b654326 Johannes Berg 2021-03-05  624  	for (i = 0; i < MAX_DEVICES; i++) {
68f5d3f3b654326 Johannes Berg 2021-03-05  625  		if (um_pci_devices[i].dev != dev)
68f5d3f3b654326 Johannes Berg 2021-03-05  626  			continue;
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  627  
68f5d3f3b654326 Johannes Berg 2021-03-05  628  		um_pci_devices[i].dev = NULL;
68f5d3f3b654326 Johannes Berg 2021-03-05  629  		irq_free_desc(dev->irq);
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  630  
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  631  		break;
68f5d3f3b654326 Johannes Berg 2021-03-05  632  	}
68f5d3f3b654326 Johannes Berg 2021-03-05  633  	mutex_unlock(&um_pci_mtx);
68f5d3f3b654326 Johannes Berg 2021-03-05  634  
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  635  	if (i < MAX_DEVICES) {
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  636  		struct pci_dev *pci_dev;
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  637  
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  638  		pci_dev = pci_get_slot(bridge->bus, i);
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  639  		if (pci_dev)
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  640  			pci_stop_and_remove_bus_device_locked(pci_dev);
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  641  	}
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  642  
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  643  	/* Stop all virtqueues */
a27e95a6ff3fd63 Benjamin Berg 2023-02-09 @644  	virtio_reset_device(vdev);
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  645  	dev->cmd_vq = NULL;
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  646  	dev->irq_vq = NULL;
a27e95a6ff3fd63 Benjamin Berg 2023-02-09  647  	vdev->config->del_vqs(vdev);
68f5d3f3b654326 Johannes Berg 2021-03-05  648  
68f5d3f3b654326 Johannes Berg 2021-03-05  649  	kfree(dev);
68f5d3f3b654326 Johannes Berg 2021-03-05  650  }
68f5d3f3b654326 Johannes Berg 2021-03-05  651  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

