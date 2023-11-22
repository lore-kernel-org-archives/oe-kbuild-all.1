Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188A2C2C4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 05:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pkt4wYGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700629737; x=1732165737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OwEQGUU/N/fOdwpmFbRqxo5prRG4NpPWNwXRCmhPZMs=;
  b=Pkt4wYGIJdCDCq5vrTAjG3NuI1H/LJu77ea4eawNasELfQq2R7eYI3Fe
   rD8YHEUyBFdtQNAcJ+JD4qKDalfFx77UQQXNCFilWy8kbHbKhmvyuDxmw
   HRVs7D/t4FdO3X9WpWiPmX9btA+p6zEc++avrB5ynWAKCTbXVhaCNkc0f
   JhYu1b/XxWs2p1giINmgtERUdGq7sU3BJUrmJ657CumCLNImSvHIKe9Qh
   ZoPsDN1VgIu3gU0gBHY+hFwCXWbEMpNCg55NeaoxS2n82g8cOeNB2o+Pq
   JY16HsWubZKhzQe0skm2lOdSNJcoyoh10ubb/1INF5r4A28f8A6S/dRAf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="10651899"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="10651899"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 21:08:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="890451291"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="890451291"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Nov 2023 21:08:55 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 21:08:54 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 21 Nov 2023 21:08:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 21 Nov 2023 21:08:54 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 21 Nov 2023 21:08:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DVvN28v1Y57ouLhiKIsIld97h/YbSVW4MwIdn74sD83pPGZz0oXfZ9ENovEJZLigfUYYSViO6hlwATyWVOG6FxXmxT55hj+S9kj+UKhnLxICZYBtU2pLcOhK1ft7n/YMk8GM6PVZP1oMnh8hV2sABHxqfWJqkb12Emk4lTM/xDny9HOg+psVTFvztQSlA1VSl8ecEoH4Rl73wdW+pQIBlf8mC2+M/klAaNaCNwE8BDohhXkdfbzKpoEJqPllZFfX6WsunSwoCjF/6KvilDhQ+iHbBl8P9PT/bYaKQI6989XLOBP8vwi3c6mUU5fHFPf7WgQ2BkevnFnHjV+WQR9JnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcCa0nv+Kd9NvNYacuOKGfElda+RDPtUOGPEcvGUF8w=;
 b=O77A1qQTBnqZQf+v9CkPJIxrVSz227yEj3ETgZWFKgh2XudNcR4xya38JiK/05LNSYcAkMhOSBfOAZtM/LnHWAoKRntRaCjkdrmeI426ViMNAObnJYgqqP2iLdzDu3KGx6RERfbSAqeWlgMVwaPW3hTMk600If/KgBJbNMD0SptqgXYhRy3oUAtdfAp87QhQDhtYH8VdBNvMfi08F9Dsb9M35VT6M5je8tf58rLXUFQHWAI76VyQHfQiHvnJhXA6dKKWIF4q29TaD4Mu4T/sgKoMxPNP/M3D44gaDIcDy0yyuF41MNP+2CqhZ9yJObXpfrkfTpkYNgdfxn0EED8fXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MN2PR11MB4616.namprd11.prod.outlook.com (2603:10b6:208:26f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.18; Wed, 22 Nov
 2023 05:08:52 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 05:08:51 +0000
Date: Wed, 22 Nov 2023 13:04:13 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Mark Brown <broonie@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [broonie-misc:clone3-shadow-stack 6/6] clone3.c:436:13: error:
 redefinition of 'enable_shadow_stack'
Message-ID: <202311220742.p4XRRRV2-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:195::8) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MN2PR11MB4616:EE_
X-MS-Office365-Filtering-Correlation-Id: aeef9f74-acc8-4e36-eb3d-08dbeb191d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hzUk4EQP4I05bdNqGJ3Qcb+mP3W7v/AiPpJ0pIdQ0ZVQL4nR+UVGDfb9OMgi5OFS9w6+ECEsce9UEa5FudiPCeQRDc/pyY8tcc7r7x+EBRV13WC3GVed0jD3knLCjgW2l5CDiMgE5wR9qPd9S80cs8X0bKMUU2WHPsLP1BfkLP/1QkWgcOC99idz9yJ08QF9s54VxNu50HwrAThEvk3AHDkQ2P0N74ryKVI9cQvxXnoIaM+EumzAK8IwGkBPmp7I7FlijXdRzV7nTtsIlblETRzncXtaL6NIQrdvcJS1hCtdIPHZtfa5aeuGUgldbDiPGhOwOZw0Gn+Nt/kIpg9gI6OJCcLUqwBfpjLktwoWAihO2qfrv9BBGuKSFYZIw8blWRj7gpuzyIUmYv8YVw7ENoq2f69rdDfD0gpgHdZiihpl2DD0udGlZ8THMOql0ULGLYJCi7uazb2QNNDIGkZGRO+10gQsXCZ8+B/73BcuhfCdTfMCwUI2uFytq2LI4JzSMFgRW95nUBvYRCEy/WIUl58QGWY7j5al0T04hvQDIrtBhz9hpq/LONtDkcXnRUovMci2TrPRpdzwmAWv6im4gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(966005)(6486002)(8676002)(4326008)(8936002)(5660300002)(83380400001)(2616005)(478600001)(82960400001)(6666004)(2906002)(6916009)(66946007)(66556008)(66476007)(38100700002)(316002)(41300700001)(6506007)(6512007)(26005)(36756003)(86362001)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YyUJRTCgc7ZPx+mPb2R4cEhpaE8I99mFY9U/r9PFupOYIAeDsg1XuuzCL6vs?=
 =?us-ascii?Q?S3e6NmIIkOIPBHe8wIIj3BR2VTyy5qN9CJrgjGnUIlXAG6pFSVqQh40skqMJ?=
 =?us-ascii?Q?lwHMUdlSrCzR+C3FNOK2jqSqUxS3nGODFT0nljJsJv9plWrWbj5gEgp3d7PM?=
 =?us-ascii?Q?OxAg7cyuarS20bwQoN44jWSIvWzS2CRdYCw6W7B4+W456PxvNN4vHCARyh2G?=
 =?us-ascii?Q?OgIlIfErIqvgFmN8whIk+rdMTA0IatRKt1/SmeZ27w/xEv1hrVrbZMR7nlyX?=
 =?us-ascii?Q?OF6KUEblya4afJI4kX1rwzDoRsU0GvrX/TGAkezQcT8c3vro9td0mMC56dRr?=
 =?us-ascii?Q?2ynTkCS2AtluNwnSk8RMi1rAxrIa0Y19b9AFIr6/Xvycd03lpQ4FkIyvwiYY?=
 =?us-ascii?Q?2qPOjfyNGnIvuF4eZA5Gj1Ec1cWwL738FYdUs8FUhh/DBcgf16tiYprXSBvE?=
 =?us-ascii?Q?CS/wQHLgyW+SjT0Ce2ZD4DjTUdzqWielr1PaCm3NdH4oCWDSuclkyrgS1xog?=
 =?us-ascii?Q?FvxWMFTCbMxiBObNpvB2NBDVLfrLm2dHh9iwxYn+Y6Nw4yzx7n8pD4E7AES6?=
 =?us-ascii?Q?2tpkdCac5EkkzIHZXqV2PojGbd2A6P2QpJhuE4BUyGgT2b54oNJgFr2Ng5+9?=
 =?us-ascii?Q?iCc3zQGi9Qq56qfYWT//QhqCsHsrP/nsH8kmUe5W5kjhMmaUcC2I/zRSaJLi?=
 =?us-ascii?Q?rd5T9sYx5JxUxZ61WGAzl3eGSNbMfEjW64jF3kXNQRg6a3E/K8GuPgcTH2fI?=
 =?us-ascii?Q?SUCg/d22C95kvnk2acVtuo8rTS3yZuUeuk5am7uA39AvXjE/zgL+S/LoBUMd?=
 =?us-ascii?Q?87mJ3+7+TyqwYTX0S8ztC312EZoKgQTEp6qmZxT8jbWUL1JAlfkp8LQvKkoR?=
 =?us-ascii?Q?R2nU0n0iECsR/Qr/k3bi3OdOrTjEOj6RkPFWLkKjJjIwcFyU6T+gT9+0SZOa?=
 =?us-ascii?Q?PG8NUacC/tB+GRSsiyseFKxJhp67ZzySbjFjZVv+c/87SaaXeMTpG+47uG2L?=
 =?us-ascii?Q?XnxKkrQhIzcB8GxKGdC87S1niEz04UHRjRSI0y9e1zdpdnPpcOVeBXgFmr38?=
 =?us-ascii?Q?Gg43lkBqfBm173bDSNeQ01hGYKiEu77I02f8dlfDbOB5qDqayiAGfVouC2xI?=
 =?us-ascii?Q?Az9pXEnJLqmg0Z7XNvxsgYqSJP8AFU0k3OJWt0f8uWo96d4gc/2BX0ojGw68?=
 =?us-ascii?Q?VCDEcTgynQKHRXIRJDVOPjMEB3IEIjvm4T6p0r0nwxZwFPeJBOJdZesQq76z?=
 =?us-ascii?Q?gLk3vVxBPN3Sy3nXd+NMk4l+h0BuMJq7F+RBkJnVcjCpw6JiGuJmEtZX4Dcs?=
 =?us-ascii?Q?1upEcEwfTmsuKvUV3FY5Y1whjRyqcS+J/esuEKPWZuPE8/YJVfAAql3SxYgx?=
 =?us-ascii?Q?jarTU0+EhFqAc5+dTjtVyLgkQz/HF1knzbhoDYvsOBG6F0zBB15u6T2+ubIR?=
 =?us-ascii?Q?S+3pL51EpQlxQojxvv3V4usZ6/FCG2StJSh/TlLKFWMHq5OXHLUubtRyJ/Dy?=
 =?us-ascii?Q?Zkiv9PseLA68avVF3Aynlgedj9JgXggCQpyrLmoxiHL63r2/9DnycULgjC08?=
 =?us-ascii?Q?X1EaE1pSdvk0KU/SWxbROpRPmo2T52nS5xGyKrBZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aeef9f74-acc8-4e36-eb3d-08dbeb191d96
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 05:08:50.7447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLmH+5npqyyyFt1xJ90/GVG72QptCYPEl5iUpjiKXSUpRBIxRvmcAa4GSqWCT088yARmt7c779YbYaIC/Iu2Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4616
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git clone3-shadow-stack
head:   d258fafd976a560832c8193aceac1209aa362600
commit: d258fafd976a560832c8193aceac1209aa362600 [6/6] kselftest/clone3: Test shadow stack support
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220742.p4XRRRV2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311220742.p4XRRRV2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clone3.c:436:13: error: redefinition of 'enable_shadow_stack'
     436 | static void enable_shadow_stack(void)
         |             ^~~~~~~~~~~~~~~~~~~
   clone3.c:426:20: note: previous definition of 'enable_shadow_stack' with type 'void(void)'
     426 | static inline void enable_shadow_stack(void)
         |                    ^~~~~~~~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

