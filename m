Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6D0376
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 03:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676604017; x=1708140017;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=SxUj5+uJdT4B5RoSW5ZxEmJEeQhyGjwOGSz0eUr8xMw=;
  b=Y0ds8eB2kW66HeyD/yAPqAczBFPwI86KQ7nYlCUdqKXrKrd+dY7ZWtRV
   TMbQ8hYWSPTe9XgLDS1NgbXTwgdpmrrqfGzT3uqzlHTFDjEwhMGukHXTy
   DeTVgX9+zp3szsSfYnmPVCOIR8b7nZwAA7SmNxz8MSqieiOi01sQ87FlN
   J2jgIA0ZaqA8g+RPvIB6DIfd6p3ldKNa0HwsOjN2Q7IiVg/qcToAaAsZ+
   k2+aMDXmeg7HKLAuWgWPyZMMQdAoq88aOe9Pt8inhBXQkGu/4pOKDUXii
   I4GJT/q5/ShqWn6Wx+bZUjOkE08iFGB1Sg5jMj0K/cx0wXw10j7CSvc0T
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="311532279"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="311532279"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 19:20:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="620250530"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="620250530"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga003.jf.intel.com with ESMTP; 16 Feb 2023 19:20:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 19:20:04 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 19:20:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 19:20:03 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 19:20:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bjA/vy8WAU+Lw68p5D+w6wmv1Ul//Nw3IO2yLUuJbSArrbJZ2zTfk8EmmRUoT5dVLb4F3ceQpJ06C0zubVPMiNpX5FuEMSJ3DRLspc5rTYik8vMBc0EYKsXmvJCiYjj8tD9/7jog+zKd3AbKPep3E0YNK7cviCizqYTzP/l17Wh2kkFtzIOnGv2sfdA9ugXuTS9oIPVGQ3ChTnaYlA/Ly+sEa6+yBcXLiLkVqy81TIXCgA+ZT0R6Mh1HCNPmMhSV2nfSjhrBOeCIGdlZFI8m71FE7oS6gxqfZD9dqLy1LsC87S2WbNfwgwB2SvhK9oHsN5wk9T4LHqPcDEK1yF2sRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJrY3lQGqHIuZApvL01b+URioFpuPaJD6UI8oMkmlog=;
 b=hBY6q5hsbKXFSeAKxedYF1z+5WaSoSmZMQjz5IR9+giAHfADPXG6u+BIO+AhCLcmatNvmY+vqcoGwTSyZkaz6duevcYl7SMMcXG+fj1Qy02V8ad6jbaDP0krLjgTKp4I0Tldojn1ltZzPgxdRh12UF/7qEwNPATx+heMLGVvV85UBXy/US3NItoqn9NFK4G64Db/ElvzrKX7dT882UVcCj7cf5n6KVM31dzNJ1PS1Y2pZpHQuaHDBcsQFsZcB5BeDvj15Q/RjTltRKosRBeP6iPe3Dfq+ZRnHiRY7mZR31Ds3OXNf5JKCkBe+i/bC0fGu+7wFZTc3lcN72cp+vo85w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA2PR11MB4954.namprd11.prod.outlook.com (2603:10b6:806:11b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.15; Fri, 17 Feb
 2023 03:20:01 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::66b:243c:7f3d:db9e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::66b:243c:7f3d:db9e%4]) with mapi id 15.20.6111.013; Fri, 17 Feb 2023
 03:20:01 +0000
Date: Fri, 17 Feb 2023 11:17:18 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Daniel Golle <daniel@makrotopia.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v5 10/12] net: pcs: add driver for MediaTek SGMII PCS
Message-ID: <Y+7xvvAmUXTlY9TI@yujie-X299>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ea7658198d2a1480746882a7e31adf0f37793086.1676128247.git.daniel@makrotopia.org>
X-ClientProxiedBy: SG2PR01CA0144.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::24) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SA2PR11MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c9401e-dcff-4a1b-a378-08db1095dab7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AhKljuPTHWmYprIpLvjTOjTP3GyF1MwswslDtCUtAFGed7UFdoTLLzygWbIuTzv4SjpL/mVOUYTKSGNC6VVFh6IbabTwJB4WIBC5NQs2s023NMN4sdy544Vl6W3vTtKDLze2nN31doi6yPgUS5d6QPy1uwyOYOQdDStbr0tZuzBizQZbeh2uplZIbzLMlqGmP3ns3y1mW1lYjEE8rPc+k1djGGb1jSbdtiEd3ONiD+vu8UaaNm0m39ghygvsS5zPBi3L9+nJobbCc9rT7tnYooNZ1MWKcNI7O9VRWoRT5U5Yaiuy57kXtYrD8gLwSIgmW+MLaGLgpQ1lOmOOFTYLoO0MLhIKvP9hQTKl6nBpPPGgJULLW5He3vqhmNiGn/+egNcHtJEith3nbBV7T2Lembq7vS2OwBDvQsC70trkguosKSZ+/hZqynw7Jsha9EoLLqEmPROVIQQPpFfzRPSueDcEk+pRo5TfVygnEAZiG+HaD7SfJud/w3RoH0gR/1jU54qD6bqg9UPQsZ+RPd571gVK488Clp5P1VJKwRUUg+WZPXYjgNW5aUIoy4B1ZEM7Crmstn0zMqt0AaPNoV25wKFzBy8zrkijkI9J6SlIwqdpjkxddhlA/hEK4gktCahSniJrvjGHqa1DRID60fVX2IP3I08tqKDyeYpdCEqvRr2PHmwtey3DoeW9mN+BxNhYQQ04DV89CsCCf98aiYEmwMcmO8FKAEOBitSGbEvw1Z4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199018)(86362001)(33716001)(82960400001)(2906002)(38100700002)(966005)(6486002)(6506007)(6512007)(26005)(186003)(478600001)(9686003)(83380400001)(6916009)(66476007)(66556008)(66946007)(8676002)(316002)(41300700001)(6666004)(4326008)(8936002)(5660300002)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NRMFdoF/dr3uIqfDl6sucWylQy6sGXCMxoH5/5eD8jm5teAOLcH9cTYkOSqF?=
 =?us-ascii?Q?kOGVIB8A+ZQwIRNZUsTOj0Ai4tgC0Ea18F7qn98xB7m9xmsH9nJoYe8rVVp0?=
 =?us-ascii?Q?9kvVblrt9Ss01FNYe9oYsY2/c7aqU35kzBoo0NxR/1B8Rz8sKXWCgV9e51rz?=
 =?us-ascii?Q?Kr98nAVM+KtowUuRF/uJ5kFN1eHpnPq2wqEBg8jvBOBnRh/5t2WeVvc0Q+yg?=
 =?us-ascii?Q?qctc9J/fo5pYQfVqXbNLMVYe9rAZVCH6tLcYJ3N5Rd+sR/n8J3jW7ALp33eA?=
 =?us-ascii?Q?FSFFPapid9GBUIP+5FnEHWk7G0zFPBo0sMwP06iGlVfxyR0ri1i+lnL5mIjs?=
 =?us-ascii?Q?+Yo5xXgyRavhGGL8ljGf9KB9apSnuu5uoSgvbL5PX7OcSnRpc23Yk0r/oU57?=
 =?us-ascii?Q?6L35kUv6wC0E8/YerL/6MhGHwmc4InW09nvbhJMcd7EsJhCKBTui4SlQVlil?=
 =?us-ascii?Q?k4FKc5rPyVzVFVmB/JUNbEsZRTSPVzyKur/xXiiueJez3nlbze9XVSmDlPyM?=
 =?us-ascii?Q?7sI77G+bgvshqVXUQQx4PwPeiHQZAxd01mGBYKBDlCr/pxRtmdgSC4VTsctO?=
 =?us-ascii?Q?ISS3hlvck34AM+/7/Ay/4Ilf+06HdbSsNhA3KSRaUvdkbFo5RKI/IRPfu/Cm?=
 =?us-ascii?Q?3KqgNLHCTh5Wuqd6b42JDEA2ho8sngxlIsOgnO60NQ+NAYvXNmD9iKrz3DHS?=
 =?us-ascii?Q?mdWIzIV7LFFuTFdbDXoRgNO6xRqolQMuFo4kiRwqzKgJK/nC9tNSL1e+RJ2S?=
 =?us-ascii?Q?PG5msC9Exl+QxNUNoBMFbYGtcN1yzcUato2TIpjQofb8jkCqT52MhfusA/lS?=
 =?us-ascii?Q?CihVLx4Eb9cYsIWxX9njKaI79WhrSkCxJY1DfU1RJ2esneqHD2fFOTDs/rdR?=
 =?us-ascii?Q?JZKXFZej3cCJ8WJzq3Us0J/65o/KgLDKeoWIeCaGWLlkqcsCzt+I/Xm5GYAZ?=
 =?us-ascii?Q?FekOAP41zDxPgF9ieIAS7omR93c0VzNCILA0WRR56E+A0a4BrMU1j//YzWFI?=
 =?us-ascii?Q?qW276lo5daaompyDgn66BRZ29oJl/5VckDe0xnfuXg6KFE5juC63OFr/tsY7?=
 =?us-ascii?Q?fVONFAFOWERop0KXyGdrSVJCZygfd2yQI3jgRDydpT/IcP3HYxt9s2LIokSK?=
 =?us-ascii?Q?C1lWNnr+yoxuZ6SW25ZPMPsYJ9XH87VFtBDI+JhjCGTXLJru88Fxfi6tZerU?=
 =?us-ascii?Q?QuHFnJFQ59eLLLN7uSCCeL1WFCu4ev7o02w9A0stBOjwVqMUVOF0mtpZ/q6I?=
 =?us-ascii?Q?7ZaSLrIrM7mcrB/bzPx+kwM5U8331Kc4wyTt2c/R2G5AwW/c5oeefQuHUco+?=
 =?us-ascii?Q?fspNOB7wO5fFqK7jwoJHNFKDO9EJ4MudNNJa9u9HKUYLF2DVcX0YiF1dETj9?=
 =?us-ascii?Q?vEihACJEP5oVCrDG5KbZppRsb8+D4VKIsJAj4sG3VmQqjtyH/p/esOP9UHrF?=
 =?us-ascii?Q?eqKpFm7MzIaNyrERKiwCsjCM0MavLOu85zs2vjhV4IkHcZad3ly48uab9ARZ?=
 =?us-ascii?Q?zmQMnBzTbEAT471tJgMzKrkhel1uN2WIA2/Q7d0d/4jgoVlBGKgyILLEBhGA?=
 =?us-ascii?Q?n8PQf9TePZgT8zMdjB3C/Ety+2DTHp6cPIyvXNqn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c9401e-dcff-4a1b-a378-08db1095dab7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 03:20:01.0583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DnSm2blJcLmPdMLJVLqrjlgLZCL742w04Bt/GmYKipkdMXiPSOepAZAYQbg+PtEDcebtbsrAbDCdMw/qPkLZxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4954
X-OriginatorOrg: intel.com

Hi Daniel,

[auto build test WARNING on 6ba8a227fd19d19779005fb66ad7562608e1df83]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/net-ethernet-mtk_eth_soc-add-support-for-MT7981-SoC/20230212-000942
base:   6ba8a227fd19d19779005fb66ad7562608e1df83
patch link:    https://lore.kernel.org/r/ea7658198d2a1480746882a7e31adf0f37793086.1676128247.git.daniel%40makrotopia.org
patch subject: [PATCH v5 10/12] net: pcs: add driver for MediaTek SGMII PCS
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

We noticed this warning also exists in the latest version of this
patchset:
https://lore.kernel.org/all/72139f8ec8b917bab9dbd8630a2f63a52887fcb8.1676491901.git.daniel@makrotopia.org/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/pcs/pcs-mtk-lynxi.c: linux/phylink.h is included more than once.

$ git blame drivers/net/pcs/pcs-mtk-lynxi.c

01e623bc7a2f3 (Daniel Golle 2023-02-11 16:04:51 +0000  10) #include <linux/mdio.h>
01e623bc7a2f3 (Daniel Golle 2023-02-11 16:04:51 +0000 @11) #include <linux/phylink.h>
01e623bc7a2f3 (Daniel Golle 2023-02-11 16:04:51 +0000  12) #include <linux/pcs/pcs-mtk-lynxi.h>
01e623bc7a2f3 (Daniel Golle 2023-02-11 16:04:51 +0000  13) #include <linux/of.h>
01e623bc7a2f3 (Daniel Golle 2023-02-11 16:04:51 +0000 @14) #include <linux/phylink.h>
01e623bc7a2f3 (Daniel Golle 2023-02-11 16:04:51 +0000  15) #include <linux/regmap.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
