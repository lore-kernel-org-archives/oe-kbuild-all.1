Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A852103
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678439056; x=1709975056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O4uK2QlvK1yqMaA/7X36yb5lHGRNwCmijDXJNiQ3pHA=;
  b=E9mpH0uAVBajBqlG3J590ES9oV26M5sFpcerBXaEbu5tOYI3/VUEbXjW
   xNGtf737xazPgTkAqG04IeZkk4CmocniRlSPU8mVyg+GqVzu55NF/OMoJ
   yxs2lvpIV19RWszU7as6IzyrCz6QFAOR/tFgorcHqYaBteRFG/TW94p8l
   CNx733uB9C8dkahlhTqi/57yBa8kCdm79MgmlwNwYOzFRf7hw/gloBbVA
   X4uNNtgZKeQ0wuIN2m4wQjkPnIrawKVdHwaK+FozvibFxsUcEUrhRQgnp
   ICSCWddyUmaLGKmLkaiUD0+j27IrUOopH4ooBrFJ0Tmkx4SMBCuoQ/QCw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="325036555"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="325036555"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 01:04:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="627742329"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="627742329"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga003.jf.intel.com with ESMTP; 10 Mar 2023 01:04:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 01:04:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 01:04:15 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 01:04:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITOmQCh0JlsMVf3qDovKr5le5lJkSNgpD1bjQZZiVVTiWT14JauE6Cr986J4ibUGXcJ0uwvGtR3+BUNMqtQDphfxl5zweb/3DnOZgjTjFx7stt7AdA8bOShufUJHpWtK/pKVMaQ6dQM6A7D8W0DWLrZq0ooQdbaGIAgHgBxhn6PgkPouqKyK49F3Xg0p84mTxCkbJ0UPK9uz6L2unm+1mUKF/E9OR53LaoiIcN/q76nGlwZReC6CzELkScvq/M+Knhz/pzbNfvWNuJWndC5Sc5fgZLBqQDaxt8lpw1YTGwXxHbb9xMuNb82TwyRIhfe3B5a/ANUkUUxV4kaa5WuWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TG4GkT3eELJdiagN+9he1c97LTjmng4rcRTKiHf6c8M=;
 b=D6uO5Jd6TGNtXbAO4oNRqMgAmIgm35n1f4WK2PoPSxgXtaovfzfY159B6TVot8eVqbg40JnRqPfEgxF3VJvnz52laHnNVXv427Mpz7kHytEvgrKnHEw97x42BQuuIpCOnIDUD9tpXQdVVSKvgCdwmS6Llf8SxlIqR4NKY+7sw1AwCCg/8MZNtUEAG13UYBF0wvcy3NNApPAtuATvG0/876FY5h1Fm8Dtr/OFCz4M6ou6elNoC/smkZf9vO1G5a7QN5obWPAksKblbjOYtx7UV8utA6pe479Q164AluvrCKC/60TN2uFh/RwfYx+c7rs4tR3bL2GsyBh8L75EnJHOsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH8PR11MB6997.namprd11.prod.outlook.com (2603:10b6:510:223::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 09:04:13 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::66b:243c:7f3d:db9e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::66b:243c:7f3d:db9e%3]) with mapi id 15.20.6156.028; Fri, 10 Mar 2023
 09:04:13 +0000
Date: Fri, 10 Mar 2023 17:01:27 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [yiliu1765-iommufd:tmp/for-baol-0303 30/53] drivers/iommu/iommu.c:
 iommu-priv.h is included more than once.
Message-ID: <ZArx54NEtzmf/574@yujie-X299>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0049.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::18)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH8PR11MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: 696f0d16-5de4-4b5c-0fbf-08db21466b28
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jRl5SEaKzMDr3RqF4+Zpzaw7PLd9AMKSrFAnROL4T1iUKNrS1mrN5MF06+zztsLBjVhpWxwWS/+2RgBl3XWMsJoDfdDRAAn7g/0g2zbisM6hZw9Xja8ZiIVPYzk1aHoJrMhCEEV79wXMb0DsTYqBqlzEsOe6qB5PWHEMd3a30TJr8qkBemjmoGNozfM72HVxdjq9fIkRawfqPeMrioEfFCojv7x60l49iYuWRff4EHfgSB6dCbfH8ICL1+6FidtfLf40AwTA1jW/XE6U5IptCSQEO3hEkUFOcNFXsBuJ59ORtmQqi9KJYzyJIBK1kdWCMomoKiVb3slPfIzVxQ1uVKrv6lQwKf2v9vvdxknoZLJypYQshmYkbtttmWFfBtyTbtxO4BkwOLK51wFF50iF68cDFPVKEet4zJ6EryGjsDtKT0OLY6L1KyhqqMOpeeVRNd6PsnjL+tHrIZhN2B6oeKSeUvAOwGqVtdRKWVO7pSvFdX8gluYUmXm8O9lfj4WO8Wkp2I44IfJYc5uKS4MJgQHv3PgJp9c0q/yMQqn6tctOYB96wPNrqit0HPTG9TuHwwyQtMLrLq781csB8gTSR+d3tbKdYcH6pB23QwLVe6nDVM0LKzWDjZ3Xy7Tdt6vo1f9OSB4gz9IbTjRE7X5SIPa98yLGAafunSz/SQZqrRg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199018)(6666004)(6506007)(6512007)(26005)(966005)(6486002)(9686003)(110136005)(66476007)(6636002)(186003)(316002)(66946007)(8676002)(66556008)(8936002)(82960400001)(4001150100001)(41300700001)(5660300002)(4326008)(2906002)(83380400001)(38100700002)(33716001)(86362001)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wVBwiFxPphq7mTRnzzgbsd1Lp+dgptX7BA9KWC73TsctIfU1o+Og0PENX+zW?=
 =?us-ascii?Q?7rcHic7l5McrbQeetrIQ/bUHYQ4+zFpn9fw9BNBvhl38O70NjIp7fhxLQcU6?=
 =?us-ascii?Q?k0FKBN2+et+5K1Ur0dCmRUqjZwC/iC8+zuFYjiG1nIG5maYg1wYGPSk1xeDl?=
 =?us-ascii?Q?HN5kW2cDB7s+z7pzd79kxlamWUJRL/Z2PewpIy2YWseM8Uv0SnNYeFTOainx?=
 =?us-ascii?Q?sRniZHDScugkfL+0Izy2ThEVyhikCpm8VX+y0P+l9xQO0E6sN/06BsK8gD9o?=
 =?us-ascii?Q?pLUTWN0CWdMDVUVTEvcuVE1vfT/gB5VF7pXLPK6EfqQk8th5oU597XDKJjl/?=
 =?us-ascii?Q?f3w4Ym0Vso5/ZhAc8UT4nN1DfQKw/Ng5aZYmSKSzm/9V33pCjVPRLIuliRLE?=
 =?us-ascii?Q?7BFqeqB+yxaa86qv50gvXPOQXPbYZdZaBdyjNof6m4Si4jG7RmoQ0R2RaihW?=
 =?us-ascii?Q?CphdflUMwBhaVv/C9s1lvD5Xg/qOp8Vjeonn6+VwF0kPcEmujKtbXVrkUtEY?=
 =?us-ascii?Q?gW945A9F+qk0tmh4Tel8CUCb/YLRFMAcrIHPtEVx/AquMXzbFTIZ+nyzhjAj?=
 =?us-ascii?Q?Yugq69B3keX8P3nTnhjaheZZvSPbrdzSASJDLo+T5YeMHWwkckYFuUOzE0CX?=
 =?us-ascii?Q?/bYkrHQJQ2ZKrveWbl9Rw0gKUgl+bkDpAbuXpejEMEtEOfNEST2DD42Xy/nf?=
 =?us-ascii?Q?V6WJlNihK4u/9FI35Atb52MfxIB7gRSIBxtwyI4JYFTKElKKMaV98WXIwgop?=
 =?us-ascii?Q?2HllNMqexzLtI7VpAijWLyKNtzXJvJTUxLSYUElZb7onqSaKZGAg9IPFpmJp?=
 =?us-ascii?Q?7ImzsoL4IyedpyhHcW6EYdy1wkrrTlz4Z6zHF03dlQ6GiWGps4YqNdvoCCJV?=
 =?us-ascii?Q?XGeK8hjAlbqmi2UuENG/FsXzsdxdahcDTjMX69VN7UdmQd6pxMicM9xpbyuG?=
 =?us-ascii?Q?v0a7S7W2g/pJM+4Zi2VTFcvTJrBLkqOrn4HxBLcck+nDJtmKz9f2YO2xw/LJ?=
 =?us-ascii?Q?FnU0Hq+HX6a0sOO34SQ1s5ymU2nNN9Z1WfBUZ2UzglRu2ch9LOxmChid5uqQ?=
 =?us-ascii?Q?q+24clQksi3s8epEaXUjYmTDkMLOZyiIPgXEhMKiRhwO/WqVChvRW0u/xCE3?=
 =?us-ascii?Q?6wgEhCWBXuJ0xQLlp16abdTbUPtAmtUVwv5OJWoHvEINqynzHhlWxrCXyF9K?=
 =?us-ascii?Q?G+jBPuCoAuMB7NLyMz4iCPsNXBtSa5jmT5FFuo/FV2ftjj3EdexdcsmMcSUX?=
 =?us-ascii?Q?gSzSdUVVfRvPh6O1VL12YVrMvM7Lw/wjulOzUNAS60c1BkgNfEjdDNuVPnFx?=
 =?us-ascii?Q?JagkoT+zHjOjqDwYzi6PVCMAq/e5E+oytUeKb+ZT7zYdHjYQ2q7PrJ2UYs/Y?=
 =?us-ascii?Q?K+hTx1iMImJE4jRAff4sd/gRUe4xwgv5hrnGE+tmQSboti6OBHci4uy3fKPe?=
 =?us-ascii?Q?KtYwgALGsun3R+I17DtFPtTyTirO23Fwn4Gg2yNrFR0Ky7y5ZVok28nzp3ZJ?=
 =?us-ascii?Q?JKf4YPKN5+F0NWvcW9p7lgm+c22jelAHSnSuPinEB4MlA/okI+oEoC8vt/fV?=
 =?us-ascii?Q?FOewCp+gXNv1xaOuonKJrynvArp9HbQx+NlJMdZQL/4Hoo43fIzV338+tACL?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 696f0d16-5de4-4b5c-0fbf-08db21466b28
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 09:04:13.4302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mg9y3hkVJvpOraU5ItxRxnLm0EiKWKEwrcWcmNtQDnKDM3D1yjd0taqiTWFyAlSATrzP8oOZ/pfIJ1InZKBd9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6997
X-OriginatorOrg: intel.com

tree:   https://github.com/yiliu1765/iommufd.git tmp/for-baol-0303
head:   028abaf51f935755b020cbb2c8f196862dd3a312
commit: 9df01e25af3a064a860025a38d73d05c418b08eb [30/53] iommu: Move dev_iommu_ops() to private header
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/r/202303050926.Nu8TXzXW-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/iommu/iommu.c: iommu-priv.h is included more than once.


40ad7dcd77887 drivers/iommu/iommu.c (Nicolin Chen              2022-12-21 18:21:32 -0800   36) #inclu
de "iommu-priv.h"
f2042ed21da7f drivers/iommu/iommu.c (Robin Murphy              2022-08-16 18:28:05 +0100   37) 
757636ed2607a drivers/iommu/iommu.c (Lu Baolu                  2022-10-31 08:59:17 +0800   38) #inclu
de "iommu-sva.h"
8cc93159f9196 drivers/iommu/iommu.c (Lu Baolu                  2022-10-31 08:59:15 +0800   39) 
9df01e25af3a0 drivers/iommu/iommu.c (Yi Liu                    2023-01-18 20:28:07 -0800   40) #include "iommu-priv.h"


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

