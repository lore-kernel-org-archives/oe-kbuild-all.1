Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268C42107
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 08:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675930730; x=1707466730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QsaLyg3vueG9ZaZFVC4e3wAn/nhx3CmEAymFHbUgApw=;
  b=LbqxAvQYVvxoDC828X5qcxb8Z2rsJq/zYETTI65JqQu9EoK+dQ0B7505
   Xu37Ah64o+gKtel8/rEHyuI7fMi7xpbE1SjKle8M9di2B89k3HSeiVZpj
   iSapu//ra/Dw7rBM3zl/KbHRF0V4bSPxUM2SsUQEuXT9t23XfT9CpcygV
   PSKsqOyQ7RD9PE6xJ3ETRgkH/bbYjjHjfh24ZPygJukjuYuYhR5xJ2KxA
   iBnis0u6wdD7U4fDlsXZYeWjP3a79hNJ1VW48eMsMxTo/7MtclESFxuZ5
   e8NaB7sNIDwg77koVL0hRqe6AXGtQQlYoFERMPptsbKf0eVvFpBbMCWa3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309696834"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="309696834"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 00:18:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="697944940"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="697944940"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga008.jf.intel.com with ESMTP; 09 Feb 2023 00:18:32 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 00:18:30 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 9 Feb 2023 00:18:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 9 Feb 2023 00:18:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvShAXUZXXpzT9m8cQ1ViWULc3g78hTpDK253v/59TnSnLeTGMojmwMeK/Ax2Pz5PArfQGaRP3BsPucb7/JOADk6/q7qxoWQ3ZpaTpe/3eqnRxTd7leMxNbNhlwc7QMjtNSe3euKk1m3QlwvGrILD+kjRmG2uN7UYCXdocyrs8T1mtPEGXS7ulZZ8LNQrQEwDSAenystSQUJcXf7LlqYYip6JSEVTrNssDaHDI0fw19CMCXx+biIpkoDvwZoIJJa3Io3knscvbF7uLI0395/00sR47T4YVcveHvIRn38ALuCjECkPitrIXLmhrUEnGYo90ZG1kRv8x3Ld4TZXvipfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeyoJ9w2B+OD4z4Pge/0PL969z6P8Z7uyDKn9rrx8vw=;
 b=l/1cSnHn5T+ajZ7Hcjzud2tXsYpQJCDqojZ4JCq4gXTjkaEL2rVMliUz5dVzDIcVWs07KVi5dQggFRdmPtG87S9c9FdS1Sr7AloCAsLKiwxRwAbhHSuLQUnAfOJ8dg8NAzWXLE03RVIecrpUy92+rwY9wqImikPVAhNr0tRDrXPnK7tCMVjsF216itx6TXgXqwRdhDKjbV8s0Ff2FCCv/bpepEiF3iskwP6fYlzOJp73eZyHFV0WiTyPG4Xh31d1IEFnIFB73JSb0qXBafv8R6/LfpqehvezIn2SpZhtKHfovzmEb3YYYnxQ+F1HlENfZFGOPLN0GDAYQ6eD4vOk9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 08:18:23 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb%8]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 08:18:23 +0000
Date: Thu, 9 Feb 2023 16:15:51 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [frank-w-bpi-r2-4.14:6.2-netnext-pcs 8/18 drivers/net/pcs/pcs-mtk.c:
 linux/phylink.h is included more than once.
Message-ID: <Y+SrtxX2kx9r4fid@yujie-X299>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR03CA0094.apcprd03.prod.outlook.com
 (2603:1096:4:7c::22) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DS0PR11MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: c5f3421e-7ac1-4c13-d630-08db0a7635be
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1BjeAlLORUYfKYsQxVo+5WzIVM+jWdhZ/65kjJkZv0vP9h3z+zAW4Z6lgmZ639r5vTKxR6IOO3fOIrj/oDCi0NOuhkJs56E+0W+cMHPVr4yIRJzHw08p3HaC3IMa8zx7MRykNLjP2LlOYqwZX5HU4WKRGILWpP7mRiwtzNHq/4YHLUm1ZBR1VQGqU3iWZpIn4u4Yv9TPWMPq3CXjBjZonlYn6ntukR8YAzpCN56vOZAjcwsFAwzmoYLGCtCDpLrxu/75dNFOR5J6xNyL1F8+ifKYRaHEsAAe7Q4T9ZE1Fk8X27xC7ozV/iHLO7vNEgZ+2emt4/98OI7mWe25EWiSHMSQ9f74WCBIWWiv9XEVY0uf6IdXUUMk76X+rlZ5a4nP9IuZg+W5s8dOc5DQYtxAR/Bo8SCrV7mpr+XGIVukC7VNeKWrVpIX84X4Kzza9icYGDwqwXoo83Xujuy5itUCuerN/LT2yF4wLb86PeFXiz9wj48xg8kh/651U/JmuuoDChkfXJ5KMzmpLI3wYIhWMjTXGgq6X7RAV7W4u657+x96BwidRT8ltYvCIVLXY4jlfRoNyCRenCVwz1qaCGA/jJ+j1tFzJEPhYnY0pqVbepBXMHqevOyhSjbHMP0eOLkv8WHTEI1BbTgqMJ+d8wSbPPNLFNh+2Ua1aYtLsvYKmTWQs436DgOfNSFEBONKKjwWCCRnXWatm44RdsU9/0kQMbpcSePJyKJlww0ITw/wrPqcGLgidVKd1s6H7M0dKLfib1PNH0sm+CAVGh/40UtPSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199018)(33716001)(5660300002)(8936002)(83380400001)(2906002)(66946007)(82960400001)(186003)(38100700002)(26005)(316002)(41300700001)(66556008)(6506007)(6916009)(66476007)(8676002)(86362001)(6512007)(4326008)(478600001)(966005)(6486002)(9686003)(6666004)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2GhQLRDJO9M67Jui7g/3jOEbe6jJfFLb86t1V/4y1ZtY3URCt/uYmIfBaOg6?=
 =?us-ascii?Q?7I9kTg96oXQ69GMxw0cc1/NfvghnO1u/Mz2Z5VDnJuudeDQdW1Hr8JA8YOTI?=
 =?us-ascii?Q?hgOy0DZWzF5b3UcjmBPayUSZzmulcOa1XR3bZX0MnOeFW+GRSiFAbTc1cJlQ?=
 =?us-ascii?Q?0jqBHdRr69pFks86AKqG8ePPlzpVQczAXtkexI5zDi/T2GOEhSXrA2702XHx?=
 =?us-ascii?Q?mKT9ru1CDlYjYQxBS0GRsu2OE1hG/HcamrOFm12TCsdYPDlLw4NQ1z+P+pWM?=
 =?us-ascii?Q?A/E53faGwbrjU9qKlIe6ldkXSiP8dcSdZ7nVc14tp7/qg1n7vzJj8JM1Ry/E?=
 =?us-ascii?Q?P6ub7BkHHnjuidpW7wIuvCjr3P5Hqi3mZlC5s6ZSNEHYwc501gomWs7XBOgC?=
 =?us-ascii?Q?z5D5sToZ4GBcNW6g44oZCKTwlH7eQAuD/8FXoy5qMwHyaql6LLL6cvhW8CwZ?=
 =?us-ascii?Q?dw1QToGCjmbgZIPbKLAJgpCmTgCaScyJ4YxRacNvKrWFeQet41toz493dNqk?=
 =?us-ascii?Q?mwD82xc2oom7ENUU025N3O1kXHvmpuQXdssr4KA0rmkAzNYIbC7jFLVFIA91?=
 =?us-ascii?Q?wsgtcE9hsDbq7jW1KVFmTifkAqoBlH7oKmSzMO5Kzocd4n9zhWEiPfI394U9?=
 =?us-ascii?Q?T5XbLYMz3DMP533h69hYXSZUNk/zouZCDlCLUO51MH4eBY7qEJLnn0VKlLHo?=
 =?us-ascii?Q?DVfHj+DyEPIZ64i78f9d3lvgcXDRytHik7QpYzUSQj5a9719xJJVYb+l1xsj?=
 =?us-ascii?Q?3aSu+bCnX9RMmtc09pPWOiYmoDUdKh+qCZm0U5PMgwN0WpNH6daET5IqOPYY?=
 =?us-ascii?Q?xSSZie+jWFs05ZCuNPkmgwbvtl5Z7yr9M06kJhRGiXnxvUzr8+T/oUDD3o2Y?=
 =?us-ascii?Q?JCp1WdjySG7r/vRrALyJ0zLv/Uk75ujmf4I6YfSZnYWVAXETlrHHHXvSy5BN?=
 =?us-ascii?Q?yAdNHUvDIyQQg0DXoPZ8nL4L8uPSB95OJr04T8w/VrmJmJkuNLRwhXc5HJvm?=
 =?us-ascii?Q?GDHSXSCKa9ZU0vUUa6des1DR/1KY/1Fic3gzyQ4GVqoDdrYC+tU1Gdt7dX5N?=
 =?us-ascii?Q?ZXMBkPLnyjrnARQjtR3alPhFZyz0T0RM0MBlkiT1R5SZ+5JwnoUwHkgy82V3?=
 =?us-ascii?Q?sZkYAYrJEDDY03VckFLAPO3mKYbyxDUFEh2or5I0eUXdmIow8LSm8UCJN8kR?=
 =?us-ascii?Q?eHvUKZfFI4V4R2t1wtBWQju31sn/ajSjN2iuisXDzENYEMpqNYgc7zK/OhVF?=
 =?us-ascii?Q?GMTFxbgyMGhxlAF1bb6rChuotC5oK5ZhpOu2ErtL7Y2atlCp4sg2vdjUtWJ3?=
 =?us-ascii?Q?Liq7mx6u911UtKBILoCxHc6eUMLY7Zec8V8ewUctKTvIAcoyE7WXKaQD3Rlk?=
 =?us-ascii?Q?lmegyar49qQr70xcPUc0Nb5xo1HD95YT2kTdcwQCYlYy0WqYZNXgaUvEBiy7?=
 =?us-ascii?Q?uBX4bDLIDN4NIiC/A4Vq1klrzbQ39JMnTXQz7k9BwjZujvZG/UmWdjRFtgKx?=
 =?us-ascii?Q?QnJvHXflQvrk811p6Mby7PRRvsY0vAnJScrA24KnCoAyx3qPoyp4umKPvIek?=
 =?us-ascii?Q?EzBQMwyAVKyylnS5VFD2QsIU5dzNaC3Hd6irKPUB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f3421e-7ac1-4c13-d630-08db0a7635be
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 08:18:22.8737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPtTWxnqDAdyvxgY3FnVOBnpRkwT5NOT3335bn9YyJSmox7ZqBGjYlRt1lLHTehthu9HLzaEeSwNUxcsmhYoSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7997
X-OriginatorOrg: intel.com

tree:   https://github.com/frank-w/BPI-R2-4.14 6.2-netnext-pcs
head:   a90e4faf55c95fcb3f43d2ee0c38c5c5d0d4bd72
commit: 2ac429fc69485d3d7ff1158bf8d57118565b8301 [8/18] net: pcs: add driver for MediaTek SGMII PCS
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/pcs/pcs-mtk.c: linux/phylink.h is included more than once.

$ git blame drivers/net/pcs/pcs-mtk.c

2ac429fc69485 (Daniel Golle 2023-02-03 07:05:34 +0000   9) #include <linux/mdio.h>
2ac429fc69485 (Daniel Golle 2023-02-03 07:05:34 +0000 @10) #include <linux/phylink.h>
2ac429fc69485 (Daniel Golle 2023-02-03 07:05:34 +0000  11) #include <linux/pcs/pcs-mtk.h>
2ac429fc69485 (Daniel Golle 2023-02-03 07:05:34 +0000  12) #include <linux/of.h>
2ac429fc69485 (Daniel Golle 2023-02-03 07:05:34 +0000 @13) #include <linux/phylink.h>
2ac429fc69485 (Daniel Golle 2023-02-03 07:05:34 +0000  14) #include <linux/regmap.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
