Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BB036B10
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jan 2024 08:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.55.52.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705912339; cv=fail; b=oCPBBlZ1w092TxR0G4pM6LLquPrPMw5CWqAOfCSZ+cgZ+GM51EGjXrUof01h9IqfchaTl/dnf/2CB3ssiOpHHDIT0F8yUo2tRYidGavvoTph9PZQPqkb3ShHYGUI7MSp5tW/1Hdgw5J4e7IvQIoql9k8a4aGEyg1Mu2S8hgfAEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705912339; c=relaxed/simple;
	bh=eUdS4CgueCIb8E4/66y0MhUkGQIadjajEiRpIZiZOGc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=r6sJulJCMKQzC6PvNMH7XYMgVdQ+ZN4WnSXLxDIaAa/vkgP6rcUYaVeQnl3KMPT2okDpLO8uadOG59p+dMh7H2rZUqX4Nl6AINnt6g3R5+uqxtPtalIQs7t34R0w7lkTGOCS6rcclvb66sR9uiAdanBISAgx+NKJaxRQGaMxrnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCOfjJfn; arc=fail smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCOfjJfn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705912338; x=1737448338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eUdS4CgueCIb8E4/66y0MhUkGQIadjajEiRpIZiZOGc=;
  b=kCOfjJfn8ZgoCRqcxw8PjvENhLda2bbnfiKs/TSCAeUlPgQZb/gljQ4m
   zr/e1CaBz62lNQSrvkPNF/KGBgVtngKbIsW1cLfFnzxI+uvAAGjC0eLFv
   4XyhUMBnCfVt9CWzojJGJ9EHZw3uUWkSDw06YCGron+niFzsq2txfZl8+
   yg7DrXu4ZtBVG5PRrgdcvyvHlqVDVVBcmbDXBNnPs0D6SEKX894UbWQPB
   pATQ/tVGkzSXj8lZFRp80tXpnhbUzM0D4jqzW+NERuj8aYQD6QZygPSjL
   DVF4S5gC2WO8XztZLm5sWoIrGr8EcDj/Y9r5fDKb06DvMw1eyWf0JWLuR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="400792685"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="400792685"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 00:32:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="904774320"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="904774320"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Jan 2024 00:32:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Jan 2024 00:32:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Jan 2024 00:32:15 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Jan 2024 00:32:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6lDTXFPAACjVN0vJ1AyUP8ha79bmYD42/a47I9knxMc059XmREY6VX4TOIgMU7kvtXdO6h97Rq/ecY5BhpMcXOg6W2FnU2IYeRwYIDh7YTbfMvOWsXYsvaH0JkZR3FRXOctOq6Ak5V7Uav4q/NlocCYe2HN8tYmKQPvCo10ArNxo9l1jSKgpNRXNgBPr7xvq7VcOadDecbpYPL2BQAIUNk7r6/3CAlejNKvLDhWH+xcGIZLuDOH4P13DoTicXbTVLTvOu3lLfFiKG8q0ObbReS5FPOkrkifE57aq66FFPwXqJpoC7XPDxlge14glyg6tw/mrCJ5PWZDlLbH5IwgPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qprRw+UJYQHoW/8XFKgJ4u9G0yZinXl21wRaEy7PM44=;
 b=Py4RfjVPePeI/C58gxMurz2rfJ2mcAn6p8sj++4WMO3LypTHe6EpwQFX/rQXwE6ZjT+/wdBmCezr2LruCCz140tJ/UJi1g6tTo5SDut2E9bHzepwlmWsZ9QLm+NIsWDxSgFiJCVYGG7LhMH7o1LJN6um2LNeFYTHHWlaPlWPI+8rBEz+tNnY18fInbU2cStBUsQvM55SGMo6lwwpfNbeIUve4kDBiZpz4+Fm28PVoVu0g/CNZB61MrC536P3H3KcWvjkSbD2dNS9KUPzSxomWLgUKUQP0uUZer4wufZUumy6n8TpqXIvCrliW23VZH37RncnZhTvyxxfGZt7qIquXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31; Mon, 22 Jan
 2024 08:32:13 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 08:32:13 +0000
Date: Mon, 22 Jan 2024 16:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: <steven@liquorix.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [zen:6.7/zen-sauce 8/31] fs/bcachefs/chardev.c:528:1: warning: the
 frame size of 1056 bytes is larger than 1024 bytes
Message-ID: <Za4oBkJyB1JaD1K/@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|SJ1PR11MB6084:EE_
X-MS-Office365-Filtering-Correlation-Id: ef3c90b6-b4d3-45e8-53fc-08dc1b24a1e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QPIAKVguqDf5bAPpoEw/Pb2gTkNcXhngmCmLtqzB2h5JEAs8Ca8aRyC5ow1c/FKs1mnJReQ8OzLJNcql0Uay0FVAtYBqNifsbSi+p0b+sZ+/ygbeUrI6FIoYTm4GCN12QFWvwQGMB5vqxSQcCP5KqA+nddAtBw2Oq1Vy64m0gRay1NsgSyB5LOL5IgTGPj9aJJVnvDVUTTwCuFZQ2zPxPSHgBheI7JF/y5tfPxCkOVzDpBP0a4dB4mCAhwxFdtOLt8yXj35ZQQPXf7K9BFu/r1riu+uOtgbppRHf/3QUNvPPgHs/sGZozo84EyxwfzTPLcuXBwGdU9jBABV5zOjyXk00cfCBoFvj+sYYsHkx5vk3gGuTJf+rKJCLKau1FuDCFhGGJs0+FeyGD1yiOp47TGeGH2/oAz0ABj7Q68VCqbCOU+Vw0KtP8RyWKfFrlLVHmg2DQPjkOWujoXlgk/mWKCX8c+T1hOw62d3o5oZpBqb7vf/uJYBhuF0KiN8p6230l1JOU7Yt4ekZxtfcsu2Sr2vR+MiJlipPgv0YJfRsjLMmkIGoWy5GzRbz6/9Bv0HsLYu7mra8Y6DbYK926zTLhuwoXDJH3K3epz6gyy0Z4yvZRbGEhpa3tpd0at1TIzNcewGxAA2eofAMGANVX7qMm2m7gtlos2RQgHKf38b0X6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(39860400002)(376002)(136003)(396003)(366004)(230173577357003)(230922051799003)(230273577357003)(1800799012)(451199024)(186009)(64100799003)(6506007)(9686003)(26005)(6666004)(6512007)(966005)(83380400001)(5660300002)(6486002)(4326008)(2906002)(8936002)(33716001)(41300700001)(4001150100001)(316002)(478600001)(6916009)(66946007)(66476007)(66556008)(8676002)(82960400001)(86362001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Th4OpxDI0q0Qe/NSEpcha7gyvh51b/EZ+nUg919hMg6FrbnpLSERheDcMBc8?=
 =?us-ascii?Q?Px2CutvCYHkaNT4EUojfmqGm74+2cypwIvKa6T7URevqYDxQC2PbaqM/bz3F?=
 =?us-ascii?Q?a54ku6VLNdRVuU4IKTNrYrJhrDgHuRTS2mC2iZ74vM0nDzqh0dznLxIBR5u5?=
 =?us-ascii?Q?vvhu4HJME829ne/c3Kd39NDrO7iZJha1C4wtbbmO8XOqAgHonqKf95YZ+8FX?=
 =?us-ascii?Q?QPmrTuBxe3BEVCqFz71Q1BbfmYpu1Q3UFbwuXNqMqi1NPRscI7LZLkPyIDtz?=
 =?us-ascii?Q?Fhg5Ahu2mMxUMoa9QMMpR7yDKEnlxcgZkW7xYv4A1gFsk9GC+YO5X1Kt8123?=
 =?us-ascii?Q?A0qfdtrrtF3Nl04jBzZAEBG10mEtVgpglNf3IonZf3U2pf72tqrDa8UDREAq?=
 =?us-ascii?Q?JK9RpZbJTFHLbejkLW4buldquFOxp9tyGrSb1Qpmt1FTKEC5v4+SsS+RTtup?=
 =?us-ascii?Q?aZS5HZUnRGSaoHO9kdwPlL4+TZxRSyIXaunTqhJIjKDbPOdFWyVZqD7mRX/0?=
 =?us-ascii?Q?2hGDOQni3M8sTVD7Pqu5t7yiIOLQ1VXlPn8YjsQP1Krz4YWA9s4qDze5HP6G?=
 =?us-ascii?Q?q5hR/21a2uL61kwGLBhbfXPSefpJhCQw4zcdI+f6Au5hyrIs/bANfh2gep+a?=
 =?us-ascii?Q?CczoOKqnVC379rSNy0i4WzBKxbI1ccHs+e4EOIsn2l5wcYjMH7UaJ02dzGQR?=
 =?us-ascii?Q?xCiz4jMQnd5/821YQCmoBxYZHBNFxQ0TsCJB0HG4UAHH3B6JCkhWCCwwHA2h?=
 =?us-ascii?Q?z7eqfH9u3L5TAeqKr0XcwH8zXvWW4/PIqNHgEF4iEXUmwnCqL48dM56oS1/W?=
 =?us-ascii?Q?ix3OeBKJjOUx5PNSvl35nIzr++tlADvEFVkXHnX+FYCH9D5EEmMnn/jcWebt?=
 =?us-ascii?Q?oCPpsH+MeuFdeCPr3iSH5uQaqMdPuVD6kH0abuJaid2XzZt++WwIb7+6GF6/?=
 =?us-ascii?Q?sH5EIuaEBBU58xifDyQ9ksZHrl+4v0LEvXYuW04+kiIm421aKa9cFW6AJkA2?=
 =?us-ascii?Q?WNEdg6r6qvmrgpT5sQP6LnWJgobGUjqSo/csNGiPH0+ZmqWb6Mda0hDUsRUH?=
 =?us-ascii?Q?Wxm5w6pug9cSTi2HFkgtsBRqY1zKDxu3fo65E4+W9RHLogzV/W4cJ3xKPeri?=
 =?us-ascii?Q?xbBdxLC+OAywBrkEZWa1Y0cZcL6l5JAcIPqEXfxHgwzUQItHH1JyhJ3Ayyp5?=
 =?us-ascii?Q?yJbR+O/xYP9DNT7cfv0jYcxIeeOQpeIZRuvMiAiPv9VUIb6WAFF9LGvTE2ed?=
 =?us-ascii?Q?CzR5HZdvRx0w+v1+o4YvPcHu0L3taIOpi8E3E/nz5WXTNQeiiiF/fEf5BEc3?=
 =?us-ascii?Q?6SdOJCyoVH6eDARfXRd2EsAO2BU7SI2h1rTSLnlj43tmzMC+VNmF9HE+oKc/?=
 =?us-ascii?Q?nE+Lx+tZFkTQ7La0XpROnkDE9LO8S40Ogi+J+LopRUYtIhZHtUpRc0QFg7Oa?=
 =?us-ascii?Q?pTrMdfntSriW5f7FjkTuYNnbN0uobShVylFQGF0pm5ATxmDWEGTw4X+9oSjC?=
 =?us-ascii?Q?+wLdKfVcSJHzULP/8usfm2hVKWKKJTV0DWX5szoVOM9sINA9FgCDSPh6XWPs?=
 =?us-ascii?Q?142I52v5/YKbl/nsK7PL5LGTfLqkslykMhS6r2WJiWYlKKBbYmp1YrU7jKIV?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3c90b6-b4d3-45e8-53fc-08dc1b24a1e8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 08:32:13.1698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ln+2WAzFov2OkuVXAuBo6TbYP0Qu4BmuGESPCKAIePdCv4i/ga0sTbCoFAiru+z5+MWf5JRRm28bOaIGNYA9bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
X-OriginatorOrg: intel.com

tree:   https://github.com/zen-kernel/zen-kernel 6.7/zen-sauce
head:   01ffb5c93fff64050b2eda359d20f812f62c91c3
commit: 47715d438aa7c28ae732ab8cce27b832e93b6b51 [8/31] ZEN: Disable stack conservation for GCC
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240117/202401171828.NWEcP9pD-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401171828.NWEcP9pD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401171828.NWEcP9pD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/chardev.c: In function 'bch2_ioctl_dev_usage':
>> fs/bcachefs/chardev.c:528:1: warning: the frame size of 1056 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     528 | }
         | ^


vim +528 fs/bcachefs/chardev.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  484  
22502ac23a2eaa Kent Overstreet 2019-12-16  485  static long bch2_ioctl_dev_usage(struct bch_fs *c,
22502ac23a2eaa Kent Overstreet 2019-12-16  486  				 struct bch_ioctl_dev_usage __user *user_arg)
22502ac23a2eaa Kent Overstreet 2019-12-16  487  {
22502ac23a2eaa Kent Overstreet 2019-12-16  488  	struct bch_ioctl_dev_usage arg;
22502ac23a2eaa Kent Overstreet 2019-12-16  489  	struct bch_dev_usage src;
22502ac23a2eaa Kent Overstreet 2019-12-16  490  	struct bch_dev *ca;
22502ac23a2eaa Kent Overstreet 2019-12-16  491  	unsigned i;
22502ac23a2eaa Kent Overstreet 2019-12-16  492  
22502ac23a2eaa Kent Overstreet 2019-12-16  493  	if (!test_bit(BCH_FS_STARTED, &c->flags))
22502ac23a2eaa Kent Overstreet 2019-12-16  494  		return -EINVAL;
22502ac23a2eaa Kent Overstreet 2019-12-16  495  
22502ac23a2eaa Kent Overstreet 2019-12-16  496  	if (copy_from_user(&arg, user_arg, sizeof(arg)))
22502ac23a2eaa Kent Overstreet 2019-12-16  497  		return -EFAULT;
22502ac23a2eaa Kent Overstreet 2019-12-16  498  
22502ac23a2eaa Kent Overstreet 2019-12-16  499  	if ((arg.flags & ~BCH_BY_INDEX) ||
22502ac23a2eaa Kent Overstreet 2019-12-16  500  	    arg.pad[0] ||
22502ac23a2eaa Kent Overstreet 2019-12-16  501  	    arg.pad[1] ||
22502ac23a2eaa Kent Overstreet 2019-12-16  502  	    arg.pad[2])
22502ac23a2eaa Kent Overstreet 2019-12-16  503  		return -EINVAL;
22502ac23a2eaa Kent Overstreet 2019-12-16  504  
22502ac23a2eaa Kent Overstreet 2019-12-16  505  	ca = bch2_device_lookup(c, arg.dev, arg.flags);
22502ac23a2eaa Kent Overstreet 2019-12-16  506  	if (IS_ERR(ca))
22502ac23a2eaa Kent Overstreet 2019-12-16  507  		return PTR_ERR(ca);
22502ac23a2eaa Kent Overstreet 2019-12-16  508  
3d080aa52f6c1b Kent Overstreet 2020-07-22  509  	src = bch2_dev_usage_read(ca);
22502ac23a2eaa Kent Overstreet 2019-12-16  510  
22502ac23a2eaa Kent Overstreet 2019-12-16  511  	arg.state		= ca->mi.state;
22502ac23a2eaa Kent Overstreet 2019-12-16  512  	arg.bucket_size		= ca->mi.bucket_size;
22502ac23a2eaa Kent Overstreet 2019-12-16  513  	arg.nr_buckets		= ca->mi.nbuckets - ca->mi.first_bucket;
822835ffeae411 Kent Overstreet 2022-04-01  514  	arg.buckets_ec		= src.buckets_ec;
22502ac23a2eaa Kent Overstreet 2019-12-16  515  
22502ac23a2eaa Kent Overstreet 2019-12-16  516  	for (i = 0; i < BCH_DATA_NR; i++) {
822835ffeae411 Kent Overstreet 2022-04-01  517  		arg.d[i].buckets	= src.d[i].buckets;
822835ffeae411 Kent Overstreet 2022-04-01  518  		arg.d[i].sectors	= src.d[i].sectors;
822835ffeae411 Kent Overstreet 2022-04-01  519  		arg.d[i].fragmented	= src.d[i].fragmented;
22502ac23a2eaa Kent Overstreet 2019-12-16  520  	}
22502ac23a2eaa Kent Overstreet 2019-12-16  521  
22502ac23a2eaa Kent Overstreet 2019-12-16  522  	percpu_ref_put(&ca->ref);
22502ac23a2eaa Kent Overstreet 2019-12-16  523  
301e0237cadfc7 Dan Carpenter   2023-09-14  524  	if (copy_to_user(user_arg, &arg, sizeof(arg)))
301e0237cadfc7 Dan Carpenter   2023-09-14  525  		return -EFAULT;
301e0237cadfc7 Dan Carpenter   2023-09-14  526  
301e0237cadfc7 Dan Carpenter   2023-09-14  527  	return 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16 @528  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  529  

:::::: The code at line 528 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

