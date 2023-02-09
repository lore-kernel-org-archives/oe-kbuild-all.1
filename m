Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC8C2107
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 08:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675930312; x=1707466312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zBImtf3tG/wZNLZ2Eq1nVn/h/Qm52IfqLAAuxShE0ig=;
  b=RFMhA+kapPmO1vIW0b7AaqOjKeiVK7g+xARMMmEhntG8d+8hgClVBSFM
   PqdEBK1kwt6R4cYGvEyJvgWRBKBBcBpKoTqMwu3dvshaKE9QSWoW8nnny
   jgM901c9H8xCDDGcIl2HqkZLNQcbuQLYJWbMMuvG9srD04CAQ818zFJPJ
   zcmsChddSzDtCeM6pj0VbAJv8Uuuhmak8ugewhPINmiY/pmsp5z0YBhxD
   6BfbH89UNYPG8aYJS06SP1xjnbwuuLFwzk15PCy6WY/kYUeFerK3iEqVo
   Smi157fwur17+dmdJP2oYUk6CXEJcTjtr+62zj+gYPTvWP+Erf0HIQcOm
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="328693664"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="328693664"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 00:11:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="810258245"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="810258245"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2023 00:11:51 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 00:11:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 00:11:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 9 Feb 2023 00:11:51 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 9 Feb 2023 00:11:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lyUUmja90hSwHxA5V9Jf+UWU8KROmB1ndc0+2ppjLxMk4r7QSbSUeIgj3FcppK0P9rwc5saAwMGsYbqDYOtof0MCRlSBbRCOz6BgffRFfDryVCZd3TUMnAkjouIsoSs4bayZJACzJkhGcSK6ftif3rWJ8ci2qLTIm698TuS+FFt3L055ZaNB0bdtR0GT+1TtT0tJ8eFf3rJthfuwqSEu+F+R0Jqy3a6e+ZGVADitVigGpOZKat719dMBXEwaHqG9JpPHLNZJSuuTurH9py6aC8mcOzEN+EGLlzoUvyry6QZzvmL/5lXIWfUNnvoDmvDiJM/uxe3Ev9dR7CB6IRvAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BON9CFuRg5KX9Ra6qo3amYhnRmtvslKPKHROVRCgWX0=;
 b=EEEMAWA8MfnrHJ0P4frwRb/EhKMAbjKwAZB4oxwQBjCguz3mOxOsk+nHiG3L7uazsj/pyZHVwVmCs6ABkWtmWEYLcvWO0PvVpjVrnMBEWLGP2U0DsAP/Vx+2LiYd1FtatobPtdHxB5Y1HQtPGGUVGLeAbdgYTn5/6bpQ7mObajgKuNsVQPjgpXK4jbR3x3KFlsxk4XVE3Dv2dTsnG2Xi7JrpkTOEkM2EnGrOOLYLWLa6mhvIxv5W+ovZ7Iq5kGnPwa9WApZRP6d0kDallKIFbjyjDzxq7SzO0pmh5huSsuFIyYYAw4JJHo5IKPCJlkwsEb/5vAMLYxeJU9p6mTcPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MN0PR11MB6280.namprd11.prod.outlook.com (2603:10b6:208:3c0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Thu, 9 Feb
 2023 08:11:48 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb%8]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 08:11:48 +0000
Date: Thu, 9 Feb 2023 16:09:16 +0800
From: kernel test robot <yujie.liu@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [djwong-xfs:vectorized-scrub 426/495] fs/xfs/scrub/rtbitmap.c
 scrub/repair.h is included more than once.
Message-ID: <Y+SqLHCG/JANzSBX@yujie-X299>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR01CA0185.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::19) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MN0PR11MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da41599-0c8b-4c57-2c4d-08db0a754a6b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KO4Xm28Wl7SeBxLBtkG/JGitrx0hTLUeihslOOsutiOT7DeQ5r7ywh0GypyC+2ULl0uD04J8i1ylXhs6MeSgkrvLxu3dtWg8NN4RwOAJw8quRxmC1+yFWRT99l1w8IdKqwq0+ohiiacmw62pD79gP2NM1FMFoSu2da9Pt797GldNDOTSk/pFQ+Dp19w0nRR5FwekLRKweLCRPgZSIDobTDqVEFDwKqGytgF+sFa6CEFiZG0HCY7NkSWVT+qWJihMGI5i+maiN5iO/1/JjtqK7Wps0Lthbl0UXDZK0vJueO1MBcQHmKUnb/FY/EzfEQiOgQ17HDX/6bcaNOQYB0c7A7jbpPxCVpa/HAopaey394HKmTYj5JT9WvkAIIDY+CrpGADaqvw9pit4nZzz5lVjR6IeWrxMGjv8tLdc24qiC4YAXn3OboMM7naF6TD4moZ1ylu5lEFwYrVlgT0MvwlMZQQsdEKGXN1UeqZ9d26AjG7YQnFc4y7maVdx8qbtXybG+zStUKZQqsvtAW4k+lGJS82R3/vL4TT6fxqSTKHx4XMSKdzkjWTXjBARLwBemxzik7peLz+br83hNdvc6NRTgFAxBpKzpd8szvmBQ2m5K5DTskp0rZdH9xTxZfOeJBSlKDrbnT2c1SIH7/5poM/I6mEJB16FUWwXV0drMvLtNRtDDPy1sWX9WJbpTaYf8of5RBYAzDllu7amNTQzDoinIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(136003)(39860400002)(376002)(366004)(346002)(396003)(451199018)(2906002)(4001150100001)(8936002)(5660300002)(41300700001)(83380400001)(66476007)(66556008)(66946007)(4326008)(6916009)(33716001)(316002)(9686003)(38100700002)(6512007)(86362001)(186003)(6506007)(26005)(478600001)(6486002)(966005)(8676002)(82960400001)(6666004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gYMnOInW1Cp5CJ2Kt8HGYjIuvv/CUx6b52oSQ5VHAvtrqNxYvEH7UI3KyJSU?=
 =?us-ascii?Q?P4FYutRDEFIIE3czVc5SS5iVI9wLEXG2ZOHTB9SyPNNln0NqPjY3z/t29Gpj?=
 =?us-ascii?Q?2vnrdnoaP7o9sduflX6KysGA0XmAAJMQNrEG4ptiNFhQyzqMrG/sXdgQLR79?=
 =?us-ascii?Q?Oszd/1Oza6hDK+YtT9lwPRAaSrLUzJLbB3CHOwRxLqL+FAffatJPuGBAAV8U?=
 =?us-ascii?Q?aY0a2NRUnQFI3TaQ6Rl3+TOcT9qsLCvmTBqpTI+x0kmC1Hzb/KlHYsU+BSib?=
 =?us-ascii?Q?9aFaCahmdN5+gAym48M3sY5gzmySilLe9yTSkyE76eTw5Fqzc1cwJdSnA3dI?=
 =?us-ascii?Q?AXF8LQ+ro2DbuAt48De967edMvKnVGcumgfmCe+xYzK9mVzfhoek0gpB7nQ6?=
 =?us-ascii?Q?lgLQDRk9L4C0qL7CkObUgpn5OvK3srKKJWBK6UL89A0nkfGn55x0K1FSEVL0?=
 =?us-ascii?Q?DD9OUM3pCX7sM0VEhKs664W1lRq+VAZAhnQrx9wAPn38Sbw2wHVS++/CU5fN?=
 =?us-ascii?Q?ipT8b8FpJTHCTWSvjIqzMKDDnnz9f2Ha8qqwUdQGrOi+IaM5M6bYzbWW8Zua?=
 =?us-ascii?Q?TwmVTKM6834g2lffR3ftKZHdgqT9Q6mk0uBw4APlVnlCE6naKIugiiy7JdOz?=
 =?us-ascii?Q?28fi7Wz7uYQH7ZWjrGNNXKarZ7pNyBXMp2H8QmATr1CGTVMOE3yZOjRjIijs?=
 =?us-ascii?Q?ZFErY02IPrxUIICIWNBgFlFMIsznFnNojGdJ9aYNgOlgW7NATEwH+SHrDHUJ?=
 =?us-ascii?Q?zfF2A5KGHrYm3zhJzi689rMTEjmW7IF6QC1G9XXX/pQTWb3OlQbH1KuexG1m?=
 =?us-ascii?Q?1lxooNve/LYTKg8oMNUGtULwz6RTxYkxnhgTvL4jsGeRHbCYwoquW9whyiMj?=
 =?us-ascii?Q?P9JT2SUEQDIfD1ItsVDcOFc/9PlIcrt7Ofz6VI03uKB9R2zvpvRXmhB1iF0s?=
 =?us-ascii?Q?FEbjk0T927vPK7ynTDJpbQyCvXgTCATQYNMzYL4dr/tCfCC/kjFdy4H/L44Q?=
 =?us-ascii?Q?hnY4n7Zt9rfxmAJZBpw+ny8jH+toR2vdJalEBVWOFxr+tYYgEm3pDbShW240?=
 =?us-ascii?Q?uqd/NWnFsYJ8+i7FM+R6KHhpKTEeHYDaVHY8tbxLNxJqwHNQ++wMLId5u+rx?=
 =?us-ascii?Q?K/FX707x9HIZfSSDQtQ8QZHzLne9F0LRAY2AXtay7sVykCURR9gVYqfC1CjW?=
 =?us-ascii?Q?EzLhfMW9UrrtKk3mOeDemNDK9iVuUe0aTQJOwxDlA97dxdKFe+XVtQAPNEzc?=
 =?us-ascii?Q?dWgfye75jsCH7jOsPfd8+XrtSr9ranb1dMS0KnYHE6QMQMHJXMiVF5nDdtPJ?=
 =?us-ascii?Q?BtP2Kj75HaYsGc4PkvORIjWIc/qzr6lwb42DqrzyCXzG9r4a5c54yW1qrfG7?=
 =?us-ascii?Q?FNSGjLHuiM6Lq5v3cKzmdL4S1jzQdJEL6yJTKSTw2HjQzhilR3h3JEB8WTE7?=
 =?us-ascii?Q?U1kD+ZECI+vkyYAGRWavMIht5MbhKRskBQvRUtBhAxBd8+6YhjbVNqzjNoM3?=
 =?us-ascii?Q?hZAG5zcVsLoP2g3dnueO7t9s4C+newC8aGqySbL3lPILGPc7/m8y+IUQGe+W?=
 =?us-ascii?Q?AgGI2XhRwQ8A5C45p62CJU0YutrdHLeUNB3HlfZe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da41599-0c8b-4c57-2c4d-08db0a754a6b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 08:11:48.0608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4B8S+r+N2uDVW+9jnxWYMLHR3whs9+MMeIZF8XF7lT69w7hI/MBEwac1dahdf+G/0wGAU/7M9FDockvcg4K46w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6280
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   4315ec0cda3c70a7df76c2516694e6d1219b2995
commit: f8451880356773abd2792811580114190db35bd2 [426/495] xfs: online repair of realtime bitmaps for a realtime group
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/rtbitmap.c: scrub/repair.h is included more than once.

29b0767b8beb4 (Darrick J. Wong   2017-10-17 21:37:46 -0700  22) #include "scrub/common.h"
b59c287a155ad (Darrick J. Wong   2022-08-19 11:28:42 -0700 @23) #include "scrub/repair.h"
acdc482e07789 (Darrick J. Wong   2022-07-14 11:15:44 -0700  24) #include "scrub/btree.h"
f845188035677 (Darrick J. Wong   2022-07-14 11:15:46 -0700 @25) #include "scrub/repair.h"
29b0767b8beb4 (Darrick J. Wong   2017-10-17 21:37:46 -0700  26)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
