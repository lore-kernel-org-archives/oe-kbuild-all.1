Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A491119
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Oct 2023 01:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZ+HynMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696641365; x=1728177365;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=cc116KUs2Lj2Pmtw/mo0gEs33LYmxxWNTB+bKLx6FG0=;
  b=QZ+HynMObnH3yfn9IrMxoIftdyOAFreSyY/EavODgeph48kOHKok/nF8
   Ga6SsyDn7ymlJIVWtV+G28wMz/LfOvVfN1Q20heLQJaP4+/UxE7wtKz3K
   ONxRg6qiDrCj5aGAkl7UkyCrYwMDX0JhL1GnydYAlhgOEmxYtL9LGu9T/
   Q83t3rgIEDM+L7wHZdfvqOgUYdIxfUzEYf9nLkMPcJDuq730HUbGQaWKF
   Ll8OuBRMLtDDy8r/3T5g9bmk1278r63Pw8ZzxWvMD20/HXhHK7d5ntnG8
   pig797+ynVpsAzqJ81DLegSCkBfnFgwlPtFK5JBbrwYmDg49RQTXUvye4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="364154002"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="364154002"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 18:16:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10855"; a="752367640"
X-IronPort-AV: E=Sophos;i="6.03,204,1694761200"; 
   d="scan'208";a="752367640"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Oct 2023 18:16:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 18:16:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 18:16:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 18:16:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SkpYcdiEQX4O5P15GzGQf5VFHvbmhax/q0SaSf7cAvtHscq/YdtHxrUzq7AA/AGjluQsvHQ4jT9lTHixd83Jt1dJDDzlySuNoAxxglPxUdQJyw6sCHTHGuAPwTZmLCer6txR1/dF73cY6Af+WqnSaK17cB7ZOB2kUSfilEi1H2hsyewbvQDo9lBpZ/dZwKqCQH8P9fy+KvtdArF12WngW4i0eT9e+6l+lqRmw34hidSu/uUYdPJgRIAEmczMLrNSrq6dVvSjmHzLOQHvRgzc7n77eeOfarmJgRdNhknqJL/vSMTqseAUY+J6akonA7UUZWPkXe3fLgf/K1G+4YP7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pVp1COrsP7+aTSDQ4/9+VfwqcN0ujOxCmS30HaTyzuQ=;
 b=A2t3+2zU9q6fdj3gcy9IARbTaoa02XDpSqhRgMoaK6KfEe8cg9GwMYbFa5Y7tvNnGqW89jEYGzeAH8GRn51IqmfxbAXAWeHRgqa0yLZ5Cg6OhhFIXyO1ZFf8fvjHRk4fj61sooD6BTqR6zRwrmt9Y9Bxf/p7IHp3yhv5kdeMHZRS89X5MCqvZyy8nZFaakxy79SlKc5es/r7tdtyCI71Dh8+GT2g/phOpI2vavUX9tXR4eHu26lsFe4Om9tWvsCGH8LiiThrUlu3esQozPC2xKuGjDRyNwKj8KY3gxTne0r4KcELtJfC6HgaCFU+vOKTFFQQXnPaxc3JurWuszg26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH0PR11MB5235.namprd11.prod.outlook.com (2603:10b6:610:e2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Sat, 7 Oct
 2023 01:15:59 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6838.030; Sat, 7 Oct 2023
 01:15:59 +0000
Date: Sat, 7 Oct 2023 09:11:03 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Jamal Hadi Salim <jhs@mojatatu.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH RFC v6 net-next 14/17] p4tc: add set of P4TC table kfuncs
Message-ID: <202310011424.k8UpHU21-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230930143542.101000-15-jhs@mojatatu.com>
X-ClientProxiedBy: SG2PR02CA0072.apcprd02.prod.outlook.com
 (2603:1096:4:54::36) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|CH0PR11MB5235:EE_
X-MS-Office365-Filtering-Correlation-Id: 882ac45d-3137-40df-139a-08dbc6d2f6e1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mwGN9jMJd2omfA3G4C0LOceEQjxSdDu5bNlaFyZuOVHxtixd0bbjb1b8PecDxAfMwY2F85Z54TMwbr5QYxXqOGYJF2TfAZRLp2P/F7seii82i0JrP/Ue0U5hyEr5OU+BZ7Sww1gcZ2Jc3Y0008bY3jRPV+/PvzDiWRMfLgHwSwVZIa0ihhjzjG4sXXrAlxA0qxAFzhZ3Cei9lw2nJ2l72wfSC7OIRo8ED9kEzTqOYvHN1mBgLUppwa+DEnbnZ1Nxqkvqd2s6l5z3+G3oyhOJP1MExoi2iv4eXCn7QhowXqbpwXhLX7276cJ8nkXZu8Xt2hiJcBJRaVdtQsW2/Mu/q20JJhlIgqpi7QIu87AngkLUdL+QiJN56qR14u/22KpsCObQywvx9+Pd3/y8PYhwoNugVPIwRjPjVp288jwDKZ7qkcNWnXhOUTCYzag5NVRtOkBMsb18idibqmNnmx/WTsRcugdYj5NiWLvNl21UusJfLHTpIMJ4EO+HByL2PYVrlnt/XnyIfUKmDoYauRym+RdwUjLumgWOIkQWxdnq8ifd8SgyD8/M5Ol/Y+irKHYw2GBqyokcDbqKDwFjLjkQsuFMFHkDSomi8fKpBftWTJPGWfsPLPN+wVFzkHXp7H5mv67lCK9lQmRF/ZaEXu+PRtZ0N7B0KGSMg/qLAib4BKY6ROsfhojZpl405KVa5FBO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(346002)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(38100700002)(66476007)(316002)(1076003)(6916009)(6506007)(41300700001)(6512007)(2906002)(36756003)(66556008)(83380400001)(6666004)(5660300002)(26005)(4326008)(8936002)(8676002)(2616005)(82960400001)(966005)(6486002)(66946007)(86362001)(478600001)(32563001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0ZdHXK3zrvsi4IrGwnG6zxKP6HrpXXlDlfS9holM5I3qVwU+MZYpiKsshiV5?=
 =?us-ascii?Q?1jkTx//s5I2iRRwt8lgoqdvCGnFCJ6s6DoTDD1xjsdxVdL2xc0LsFlqNs34n?=
 =?us-ascii?Q?2fsyVoJyPwO4aIy5hv24Q1OV0xT+eTPIfIkUb+V6/DbezQl0aXsCnObdIOpX?=
 =?us-ascii?Q?8osooALagkYZH5VcnqJlYRNyPaUB6143nYse8WjwtqzTCcFudcTfAIItDTTN?=
 =?us-ascii?Q?o01RqBqGmNFPlonRBHu3/QDYFEF92AsG2+kf0wBr0TpRZhn7MgNjfdU3LIXP?=
 =?us-ascii?Q?8yWsqGqDkidlrJ1zPXS/CM/PDuUsAi6zeZGBU2suJXajiY8LMXclU42/EYok?=
 =?us-ascii?Q?j+aDq1i6FSe9FMJm+bs6b5oqU2kcPL/IdV6QkXCFM83JiPoF+6e9JU7Pi1ni?=
 =?us-ascii?Q?sju6w5B4ske55bBrvTEponuo063gEGxhm96FEqQVW04lzlt0BN2rt9gp4r4+?=
 =?us-ascii?Q?6+Jb7PBz8O/wXYQvEhAEP7rPuCFQlAWb29AUsY9z0JjMI5sXU7CejrDyL7ow?=
 =?us-ascii?Q?8iS/YHAPfmcCWPkbj+sGHNFL35SrjB9/Qg5YblDP3JbkjEh0mpVoyQdqh+Fs?=
 =?us-ascii?Q?C0tLZIWiVk/VOGcNn9vGMUDN1TBPiXSVf2aAa+nW808E/X3A8Xfri/tJujh3?=
 =?us-ascii?Q?8yCc13P6ehB8DRywlekCT6MmmVGILweUlTjsLLs3v5Bu/C3wQHxPEDm+fdc0?=
 =?us-ascii?Q?tQVfQcHqRNOL3LdnbsIHicSFj9ziYxc/xp7erJzG2EAA7lXBYZaIpSv+uTE3?=
 =?us-ascii?Q?xiuuqfWE8ICEpsp14c4G8H5k1wPn+SCvETmmAhS+6gqPSUOmt5qnwYeDu622?=
 =?us-ascii?Q?ghs09ug2ajupyAxEWyAtTJ6QWSisrUjOvs1L5zdwN0muB86spXeqUSHza7O+?=
 =?us-ascii?Q?Q9KJCKhmLCdtqpWu2tmQnpehzOjqYLW3NLsFhG4cSGoHmfq8OnvW4JQH9Bcy?=
 =?us-ascii?Q?F72RUiALnsRRHT0Bh6Ca5T02TG8qcXCD3JDW42IaXdpKS456pVAOH2lG0zzM?=
 =?us-ascii?Q?Q0Fv9fZ+mRmdXB53as+1tGUD2MBR8dlR9NrT8tO9XbIjZMzZfztGKiy06eCa?=
 =?us-ascii?Q?f68+j6EOP2/LuMsiDNCyXmV/Oaecvm/vIzM54+2VL6pZVu4IoGd4Q6FOaPiW?=
 =?us-ascii?Q?yuWUcv8iO+JBVXcpzKQnUuPjpMmzLsNoyjof4z9wFMF1SpxCJ5sJQLMgd7gc?=
 =?us-ascii?Q?sjgRiSzVWf7+8pd23Xkb5ftyQdCgAA/vNAhUprsaiXkaeH77KNkZiLRpxVAF?=
 =?us-ascii?Q?DJYpVPkr1yTXf8RiTu/m17+ciLh1SubyEINAZjcSN+IH6tZKwKusc9m1A4+0?=
 =?us-ascii?Q?nxslLgDj8oPZvw9cqBr8tL+lzUnNZcyLCsqRLnL+aIeXpVS9pGQx57L67zOJ?=
 =?us-ascii?Q?R2V+tzyD3+1rXPLZMQb3aV6GQi/7sKGvOwrfWz003hmZ7rXBLGnE6d1mdJGP?=
 =?us-ascii?Q?xvqYhHqc6w2jdfesU3HtPTsjjI/FiBV2gMd6tTFFvmdOeOZFDMVNYPuebbSb?=
 =?us-ascii?Q?wwRBYwH06RjHr+axO+UDRpCOY3B1DNikCU84DvvP85IAE+j0mnpRy21t2CtT?=
 =?us-ascii?Q?OFN5aFyqxG026dkfAsNkeslDVeJFKclzPZVr/kNL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 882ac45d-3137-40df-139a-08dbc6d2f6e1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 01:15:59.3753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gM0nzddgCF7zLB28uuddqBlBXYVWuMwnrxkjW/1MNB6K1L5m7dGnkCZjflHKXGuj6VkvMnTb0cmGTqSWQp9ouw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5235
X-OriginatorOrg: intel.com

Hi Jamal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jamal-Hadi-Salim/net-sched-act_api-Introduce-dynamic-actions-list/20230930-231804
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230930143542.101000-15-jhs%40mojatatu.com
patch subject: [PATCH RFC v6 net-next 14/17] p4tc: add set of P4TC table kfuncs
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202310011424.k8UpHU21-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> net/sched/p4tc/p4tc_bpf.c: linux/filter.h is included more than once.

vim +13 net/sched/p4tc/p4tc_bpf.c

  > 13	#include <linux/filter.h>
    14	#include <linux/mutex.h>
    15	#include <linux/types.h>
    16	#include <linux/btf_ids.h>
    17	#include <linux/net_namespace.h>
    18	#include <net/p4tc.h>
    19	#include <linux/netdevice.h>
    20	#include <net/sock.h>
  > 21	#include <linux/filter.h>
    22	#include <net/xdp.h>
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

