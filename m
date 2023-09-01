Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8F51FA5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 05:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693547351; x=1725083351;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ELiKT52JSavBDWtAXI93ujOI950aCiyi5KnCw/OIajo=;
  b=HZDkiEBaWLpAOTbdFZEPm0BVN/fq5whlaWYFoguLgCB3fGyxSkEjoz+G
   5HXu8LgueMf+8GXrFKJjmAUX9WuoSLYqJRn1CwCfNHGqeQ5GhB+LukXB5
   0YMGC9q1x9RxExuScBNdm0rXtw2WcUz174dIU2t8etLNpxXC98mpNJFgC
   WhWKW8MiXoFopbeZJXUvKFvzUMvrBJOHDHRoAh43ZhAbFAhgBNb9iRO3x
   Fhhp+k4/GIfOy1Lm4gXISEUE3Wu04YD9vWo8ME+UwPGMQ+3NHUtlYa7js
   cDvrogV70GMDlIueWiIOCjl3jqobnaevjDUhwLvcnAsK4Th5CRIYAR37c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440122876"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="440122876"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 22:49:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070607910"
X-IronPort-AV: E=Sophos;i="6.02,218,1688454000"; 
   d="scan'208";a="1070607910"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Aug 2023 22:49:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 22:49:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 22:49:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 22:49:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZGZh6j1cBwq4Er5WVP33Lx99/dGsD8YfoVvdS2arjLj4r+w1eBwEM4yO3HuMpyHFDIuWcLEYA8Fpc2g6F7OT4WBzUbcKVTWqPqTQ3Zj5BaurFPfHnQHbpjGfeqvmGXoQBLVhcwmTURx/ThMIXWpYhvN8EP7cCxxtq4B1rPnbJxHWrF4hLDs9ma27vR1E8HtSD5+mUhkKjz/suHIkNVAmgDQzy+ESGOy5abZVKqWjno3RWPY2wwlqfAOmMBtJPKWVAwH0jBpUp6drBgKvrri9HiWdtKCyL/xi59arQ12+LicdBn3o/u5mJgTbmDdXZCOUwK6W7Ds7Xl9xfW0ek7icA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JY1S54FZ1+V5gBpwr2LoGvWb9gaW8NirThhmvAtRVHQ=;
 b=ixWk1V3WiwCObNJdZPzgOTVOWZgdHfkkaYC2OqlXkZ6Q3ioXk4EeXD9+xSN7v52Ti5JACKOLckZiAh/5IkZRwKDI35G4/WEKBijreIrt5cgLbKZnm42sxu4IyzbsHv93iNS4WN3XcTpO8NLyXnsWbeKVq5uSY9kX5k3IN7cezs0NhwV0wZL1TH7cpDogUHP9j+e9GwAidkKd9CQYzZ5un1AtUIuGesa8VytNjBj8LHewivH2yNYQ6pvcnbThScXuOJKRfPozCtoeS4DFY9i6Z27JMi50X/dI2QunMs5QE8aI4rptoz+rYeOKikXXIgWkLWrOxfPL5L7Nz/lx9zbzbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH0PR11MB5013.namprd11.prod.outlook.com (2603:10b6:510:30::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Fri, 1 Sep
 2023 05:49:03 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6699.035; Fri, 1 Sep 2023
 05:49:03 +0000
Date: Fri, 1 Sep 2023 13:43:54 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: "Berg, Johannes" <johannes.berg@intel.com>
CC: lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "Greenman, Gregory"
	<gregory.greenman@intel.com>, "Ben Ami, Golan" <golan.ben.ami@intel.com>,
	"Golant, Michael" <michael.golant@intel.com>
Subject: Re: drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.o: warning:
 objtool: kfd_mem_dmaunmap_attachment()+0x201: unreachable instruction
Message-ID: <ZPF6Gt2ZcA4kF8XT@yujie-X299>
References: <202308301712.gQOqyzU8-lkp@intel.com>
 <DM4PR11MB5359C10CDCFD07E05B0F5935E9E6A@DM4PR11MB5359.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB5359C10CDCFD07E05B0F5935E9E6A@DM4PR11MB5359.namprd11.prod.outlook.com>
X-ClientProxiedBy: SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH0PR11MB5013:EE_
X-MS-Office365-Filtering-Correlation-Id: ceaa7336-21aa-4d6e-cf82-08dbaaaf25c4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mUiBPCroJnJpzfLiuhT2XCAhPEnzR27zuxRwREoAH5XqdaJSq+LU+yHJVRbGZodocMUFRjEg6hLN0SZz7tNj1ybh0/pBDLrP0pU9hb5Pyu8+vYHSyX/C6j1Kt708um1rfShWCnzJWhR7F67HjXUlp44Mmyjh2ewjoyhpH2WmM+9ZQsVCEkDxLBEb9LfTcJCCkratqefsYVJArz0YZzyTLfGfA0RtYpIbKdT//Qhwl+WUugXG4oXaZrryw2pBdiTtCwyeT2ZePioFkMYKptRlamzwLG+GMfaUZHEud3M2tmy/1NetYbJWsFY8bBUGXTh15yWgCZG2oQ2y1beLdtc2HqAfeHwa1TtlrAu8ZO55Bw09BWLf566a3CIZkB0Y2PeQcQKkVfITK7u+isZbljCb9S/mXJx4JzBvPrtecZV4gDS6itRpvGBXJVFq69zXcOHZbfQbhuOGcwDw0KSgAHwFMRPq7ey28+dAcmx+yv6CnJRJ4DipKVNqn3ZBKc9rcY8UnFYPQ6ApzEWDBn5YbMnwiBMFmHIwQyy9RojUfpKFz8Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199024)(1800799009)(186009)(4744005)(6666004)(2906002)(86362001)(316002)(82960400001)(6636002)(478600001)(5660300002)(107886003)(4326008)(8676002)(6862004)(6486002)(6506007)(44832011)(9686003)(6512007)(8936002)(966005)(38100700002)(26005)(33716001)(41300700001)(66946007)(54906003)(66556008)(66476007)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EvMs/ruRNZJH0zhIwbg/X9JZdTuWxP9zdzrUh1TlKEzF+5RrO+2HRFTYAG9w?=
 =?us-ascii?Q?mMilXgwFQFpjfY7j8vq2nKfHOfhCMDusVxEJG+bHxDAg3Ylf2Zo/Dj6XWvC/?=
 =?us-ascii?Q?KXMy40aYUwbKprs9TjWVpS2EisduEpvc4uYx4Ot9klhFJbMd7gms0Vd0r24X?=
 =?us-ascii?Q?y2ZjCRdRLUV99C91iGKUWXr4IMCo18rtNIKHvS3CFlUqFhSXNI6p04/wGQjn?=
 =?us-ascii?Q?sxfH6B06yEpbbAFT2+kaTQT+astIY0/EXgKogsaiA5dvMQlUchoAlHznR6yi?=
 =?us-ascii?Q?yvA9GUvyRyxBx76smvnAtzPUlkkHUVUcrIPrs1D5SUOquS5suBxGM+BZT+XR?=
 =?us-ascii?Q?24Swrk9a2VfWzwiPYmxkg3TEqNSgyNjqic6DH6eZrBPvkwTPVPvhtC1evLl7?=
 =?us-ascii?Q?y6FIXZJ7Knfr5sXRMSaMnMWWijw3W/79Q3f7vg7HmnRDJpYKZGzn/CXfjXx8?=
 =?us-ascii?Q?EbJ8WKNBmzK/RUV2DLx4clijEqkgD56CNTLPm1I4VI5ErL8zyZFkCPGQLqT+?=
 =?us-ascii?Q?6+VlzQCEUUYz8mG4lpjfEMILSEoQEeCHBvSL4acyqfV6cIoZ+Z2UK3zsjbif?=
 =?us-ascii?Q?HmkAswsXA/qW6yW3hso91xKB+QPPhDZWTSgU3CmwVNKACw4C75VCk9k0+1Jd?=
 =?us-ascii?Q?TXsOpYb3rIo5FEopH1YLtme5+hHUogrkJiQhewhRJU+NMJ0CawEnD6s4Na5F?=
 =?us-ascii?Q?bi8aVpDdW2c39x857mTu5uCdR3oJEvRPIUr+avvZ0tyEujysk3cMP0RhrKdy?=
 =?us-ascii?Q?57GuPl4a6tLv2UYUvWTHowfEhMjG4W1Ie5sUvnCA3nX8infvjmeDkiycSMjB?=
 =?us-ascii?Q?PyM17vr9VKmGll24gJodFqhAxFN7y9xtbZfQcmdX6Oc6Pc/rv80l4rR7HXSl?=
 =?us-ascii?Q?fp8zjAG30L67uCDEMwlZsF4xLEfUfIgb51P5+xTtYxsijwlmS2X7MCgLmyqA?=
 =?us-ascii?Q?AvhcdayKpoqXwZ+LkI1xYv3HxygJrpI6KNW0H7gmnTvfVGUVkQFr5QwXvxjq?=
 =?us-ascii?Q?mGsEUD6x7do28sEo1kmpaBsJBsVdy4z3zc22a3/pzmXxTcdXSGJ77Ob/4seI?=
 =?us-ascii?Q?IOPXeXwOe0WK7TxNcfiP+cfQuB4aR+5R+1zYjjakFcijrzS9M8R899OEJ/mc?=
 =?us-ascii?Q?b4vTEucnq8BWwB0sRjmupaKLX/bDEbopq25RBoKUzpzig6tHUPmZ9Gi+vyEH?=
 =?us-ascii?Q?4u5K/xVa4aWu9BKG6sh0yi289AOQ62ndt/3ju6jIJpMBW7I8d0UN+yNIqeE1?=
 =?us-ascii?Q?G0iz/Ej8+NhnUPyCozt0r04nzivXmJjHhFE5GvtVLEDhI4M4N0jX8TyQlySM?=
 =?us-ascii?Q?bMwuiF6CmBFzvbv5tS6wUMUKb0tBThu9/CtwSJTs1jWFR+Gn5MHvQ+ks0oeB?=
 =?us-ascii?Q?v0WFtiQFkheRuLVJsq3xGBjQN9jS9uuUt1JInIyCZrSoxmuuEjgXJOOKPNem?=
 =?us-ascii?Q?kBDdFBGCWynsohGBzb3uiz8N5ADPSBjHyaLimA/z9QUdCxOXAijTDWOyjHtr?=
 =?us-ascii?Q?4FaGLe4pCGjhvF10SFFCDU1AvSUUTmKP4TSv2MV20Sy7qZd6wsBptIh0qyCE?=
 =?us-ascii?Q?ExDlphHPRP2VYqg/su6DHc4OMxElMAY5T7ZshDpf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ceaa7336-21aa-4d6e-cf82-08dbaaaf25c4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:49:03.4945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pOVnaCfrLyqX23l0WkfWF+3t5b9R3hKqcI8oihbaLdPpuUCcaB4fx5omgwrSHepHaXxz1zVI7GtCAsbP4qXgfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5013
X-OriginatorOrg: intel.com

On Wed, Aug 30, 2023 at 03:00:13AM -0700, Berg, Johannes wrote:
> Hi,
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
> > chromeos-5.10__release/core63-43
> > head:   61b59f76f27b6ba04eb55fcc6b6d84d2bf4e76b6
> > commit: 42e6a211eecffbf811f5d643272779a72500e774 UPSTREAM:
> > drm/amdgpu: DMA map/unmap when updating GPU mappings
> > date:   2 years, 2 months ago
> 
> Can you say why this is churning through some really old code/branches now?
> 
> We really appreciate the service, but looking at all these ancient branches is pretty much pointless?

Sorry for the noise. We adjusted our test coverage recently and
caused some reports on old branches by accident. We will update the
bot's configuration to filter out these old issues.

--
Best Regards,
Yujie
