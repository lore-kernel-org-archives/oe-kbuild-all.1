Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AE029AF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 05:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6lNBPjM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700459233; x=1731995233;
  h=date:from:cc:subject:message-id:mime-version;
  bh=SMkr+D9K4exYoOJ1gYdUDYK0yirirgQvZJWzBKRIMjk=;
  b=P6lNBPjMRbKiqiOQOBeRbzcef7PH/9j8982CyaRQVC4N8ABI/mR4BrwK
   Pi5ntL5nQjil2ZT2AGkJQeMKBbU/w3aMWIr8Gkrg67sJC6YyRvX+uPPZN
   FrXhjYS4wmueP3rmyJKOr0eP76AHfKb+z3Aew5AFoCJBmLRVq6BVEe1ou
   v/yVr7DkIR44+PKI7ZVuwdbvlafelG52phPV/9MWGmO3/N2hEyzqFklXF
   miukUzDGNvorcLSSw2OcCODuYsuYML/I0a12nP0y0T8+SyQMtGjMe6nO7
   h41XqeuTvwetSsODb5wSetppJms9r1XB0/4mnLC31Ba8qtVOHXACXUMHO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="458056686"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="458056686"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 21:47:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="766158433"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="766158433"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Nov 2023 21:47:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 19 Nov 2023 21:47:12 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 19 Nov 2023 21:47:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 19 Nov 2023 21:47:12 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 19 Nov 2023 21:47:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZJReh1J5htlRFXnkUXxij1tFtFygYSYxgCAxgKnPyeSLN/Br1OqfnnqAe/5ip/pYWJDg38HtBjPZFQUZIEy7z/N4u6dc4Uydi1XHSybgknsDaST7POzrMFqgyhHRRDa8V6l4wnyQRbE03LyWMv0QDLsW8TpzVpu2Gob/0F9oQMiW/pDjilhzLDTHwjaCBG4QHdNT4z6zKHo4SgbvhFN2Lq3OdTO4VKcIWP5JRJXHg/voKnxv4W7GzxZaBBAwtKLqXjW8LZ/mJZahA2Pw2KKD9b0HGQKFe+GkF5tQhNWtpqUT3sqxA4BV5Cfit0sn74AOSbLDvKAnia0QPHKWb99/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPE4PbN0FDrmIxtiTvhbluhkMEKshq4I0H9BEf+VnPo=;
 b=jEVpE6NJWjQcEBhYm045+UB67ssFw2EUwY20GT2qmT0HrP1RFHM9QG580XMrcEHp1v9RmKjcffB9L4SgkrGVPT5qqQkTQp6/qtwGs73hTfxre2kesAZPPbEW5g+p8XSbe5Axl2VHk/qO8AvjG1W8Y/bTVTS4cFwzWDZz9Qi2Ehs6aDMTt8xpxJO8rqrgXgfjTlCnt3H+P8PSfynODW14iXr5KUu2i3r0LrxP5dBZQ0mpFkSTsta0V+mgcKpJfl4G5YbaKTBG4CnoLNbqJo1xiHX/7QfuBhbWEHmG3eMp8EzeRU6NQMbyTg+K85dU8QKeiBntq51Dl/2+MtHluHuAFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MW4PR11MB6617.namprd11.prod.outlook.com (2603:10b6:303:20d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 05:47:04 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 05:47:04 +0000
Date: Mon, 20 Nov 2023 13:42:25 +0800
From: kernel test robot <yujie.liu@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, <vigneshr@ti.com>, <nm@ti.com>, "Praneeth
 Bajjuri" <praneeth@ti.com>, Dhruva Gole <d-gole@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 83/90] drivers/bus/ti-sysc.c:3127:19:
 warning: cast to smaller integer type 'enum sysc_soc' from 'const void *'
Message-ID: <202311200340.grMKjVXZ-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MW4PR11MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 184fc2a9-5594-4fb3-344f-08dbe98c1f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yD5d2zddpWqcaLs522GqXfpUYuH40PxaxZ8HxNFh/OJ8AadmgdE3FODDo+BMnesl98dnTHpnkvhWOQSRF3vDlYVM622xrjwjY1xx5TVQj/uvZH6BJJUS9dOcghDH2qw4pHAHeDJ495jABuB8uwwtUftu313B7uJIslrRkvB2kDWemnvU9Q8MkjDEQ13vq+/x0RVdwA8lGhiuy/2c9uW0/LWpeWKGCyrSj//ahhRBdwo6U0QLSCnc6GzBjYy0cl7kculzKGeZsMysZ77ETzz76G5VDNvtmYsYQGVHr5OSyuF6dmhl0oaJ6mpZ1n9OYXJstOWQUoNgI4QPlSGrjwsrseh6opraAtgwThAf3NgErYsTCRnK20FLRP6t5qkvVcJgwiyLRDyXEBDiRx82vi2UuSPgKm6FTdA+93aiMcrgEeqlZFjciXWj9wntRC8yjXR4i+F/+cNHQ4jAVGN6sP00kuqYK/0W5kPW+FGqPjWNukHzot+A66WTAw8LL4PHcNUpqG3XzJaR3PjlFDAZ355CDonFDhUJDTQ3bjRyMK+fqm4XBo/wyJRkAcS2OpqK1/YNJbvGs983+7NY4D3sX7VcOb4AN1x/W9uJ6VTN93YyUjtQw9P5Dg7S04E0+uAdTLKbdJ+QAGoDTg6tARNWhQJ7Nw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(396003)(346002)(366004)(230273577357003)(230173577357003)(230922051799003)(186009)(64100799003)(451199024)(109986022)(1800799012)(66946007)(66556008)(316002)(66476007)(26005)(54906003)(36756003)(8936002)(4326008)(8676002)(38100700002)(4001150100001)(41300700001)(82960400001)(86362001)(2906002)(5660300002)(83380400001)(966005)(6486002)(478600001)(6512007)(6666004)(6506007)(2616005)(1076003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YmEtcZCmEMey64TZlu7puU+dk7HrZZRS6XBco+MwoGfMI0KL/L26uOKt3ks6?=
 =?us-ascii?Q?cYpWMnX2NjNZk8qbM3NXH3YAUb38MAyVKCiDjUkMZIKZKOuzQnca0bi6YY+K?=
 =?us-ascii?Q?qCmNnRtzlpIzuc3pf5e5cCMWQqDC4m44+kncWPAgRf+RW2JwAyqM+SUZ8Mar?=
 =?us-ascii?Q?3vGfHuaUGgRmnKlxg4Ewn3IqH1rF/IPitxbTPGBcly9YzwTLrYr88mvkmR6S?=
 =?us-ascii?Q?KsDKZMaNsdcpdH/dYwMfRcI414ov6D5e58VmWL1T7fVJPZ3GzccV4S3NoST6?=
 =?us-ascii?Q?QIyjE6GPpJWsl4DFHhoiexYAlEfHXzQCMUj8zbQNGlEnKED6BmO0tOiu6Klm?=
 =?us-ascii?Q?j9MR4jyRRGCzXfiJ5G4seAJo0rZDO8k6/fmxckktSdS/nN8QFPgxTrXGM9XC?=
 =?us-ascii?Q?Pqm0aFeRCooLcuoIuaBY/r87b1flG8E4vf3wQmoQrw55ev4VsAGUZury4XVF?=
 =?us-ascii?Q?maJTqF5pfK5FkJJldxsJ4Qy2bF7Sjj/hrBKa9W7SNqiOKVoo89s3dxb9/J2X?=
 =?us-ascii?Q?lht4kUJTNLSR/iENLsari4ocupOIScLmbEV6rWq//BMMheNn6IiYYa64XxPn?=
 =?us-ascii?Q?L6TCBaucYwLelPAdhuZypUyVEhEzdXU8syBwvJqblUJOSVvqBR21E1H7J1FO?=
 =?us-ascii?Q?X7Hmp50qizxsEP1gW+PezJInBk4NLwe1UDq+B4hnjhWsa6mqz7eb7MuAD4N1?=
 =?us-ascii?Q?GrSpsTM52+m9rNPw2shMndMPlJMjwKRFk7VJfaRJSVl5mDpysQjkkR4M2igh?=
 =?us-ascii?Q?8gq/mGLcs3DPuNN6ljBNp0uLgISczjbAefkAnUDfUEN5FynjyswwxlCXsLKT?=
 =?us-ascii?Q?gnHoNaQHFTaZ2MnZukaw4qUIiiPjE9fAdAzMtiBg7aWkUu+wOSIR3s9qPZXV?=
 =?us-ascii?Q?GQ/crREk7HssnhXuLS2GAWzGbUjOB2pljzFj/PhwbM+4C8zuCZLcAgiMfvzZ?=
 =?us-ascii?Q?OK7nFi565goxODpRArrLxkPd8m0wOxqcZVT3oYt5eO2KhAIj8182TZO90uVm?=
 =?us-ascii?Q?TlbfWZ4kryWSvDiam6uvjUr/W3sAUwQh/37lPVX18l0nRcxCxnBFR8Bf3YNw?=
 =?us-ascii?Q?EFRGFAOMYugFk8Y4JNPV6NpT1HA82hOOx5fhPrdvb+cGJJcHBHwbGjoaoj1y?=
 =?us-ascii?Q?frVXOn9rzBE3GzU6ym+7J3bSxK5o2+IYslIzVkzvi2juY444fBMEw3WbmnTv?=
 =?us-ascii?Q?2OdXxNTJkGVYQsJgG3gWeMe+7M9At534KuZZAh9uXfcXq7MPvN0LjnPncYF1?=
 =?us-ascii?Q?27Bgf6/W63DANqiwZUVfSmHnps8l8OA5qKkN1H8aAPmfVDEPGK/74BNvh7Nz?=
 =?us-ascii?Q?fjKAFYVRj6PwI2o1cnQUfaMycPNWiZmZ1XDgvN4+1fifZbsqHIeJoY/7rWhR?=
 =?us-ascii?Q?VEIqRfC1y81oUZa5Gboitu4IaCLFHlySUmgmC7w0sGRTcDTS6OapaJBB3dLa?=
 =?us-ascii?Q?Rp25zY6tvWj1ZMBwaje3yxFaon2AWzUFVrIuJeLOAsFLMD+aL73UsLeEw5GO?=
 =?us-ascii?Q?smths0P5lKgQDh3n37gd1TfDo6WblPs7U6pOsTCU+6p5T8JL72w4sF7pizLp?=
 =?us-ascii?Q?6qHLbx8mRwnTk4h8PPf3xuSqgyGxl3j6urLYnK5G?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 184fc2a9-5594-4fb3-344f-08dbe98c1f84
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 05:47:03.9035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZfXH7wCU/gAeBAhthuznJ8VHwD87iUy9urjttaiHPEQ97ENP5miM2/ivl12qW67UJMUezGOR3OH+hRnWaASFtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6617
X-OriginatorOrg: intel.com

kernel test robot noticed the following build warnings:

First bad commit (maybe != root cause):

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   da9bbd5b8e9256096f5e068401df1bd53cc2e897
commit: ed53d4c9725f817d6ae0a2eba92a92a2a39d7f28 [83/90] bus: ti-sysc: Build driver for TI K3 SoCs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231120/202311200340.grMKjVXZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311200340.grMKjVXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311200340.grMKjVXZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/ti-sysc.c:3127:19: warning: cast to smaller integer type 'enum sysc_soc' from 'const void *' [-Wvoid-pointer-to-enum-cast]
    3127 |                 sysc_soc->soc = (enum sysc_soc)match->data;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +3127 drivers/bus/ti-sysc.c

feaa8baee82abab Tony Lindgren     2020-02-24  3093  
feaa8baee82abab Tony Lindgren     2020-02-24  3094  /*
9d881361206ebcf Tony Lindgren     2021-09-21  3095   * One time init to detect the booted SoC, disable unavailable features
9d881361206ebcf Tony Lindgren     2021-09-21  3096   * and initialize list for optional cpu_pm notifier.
9d881361206ebcf Tony Lindgren     2021-09-21  3097   *
feaa8baee82abab Tony Lindgren     2020-02-24  3098   * Note that we initialize static data shared across all ti-sysc instances
feaa8baee82abab Tony Lindgren     2020-02-24  3099   * so ddata is only used for SoC type. This can be called from module_init
feaa8baee82abab Tony Lindgren     2020-02-24  3100   * once we no longer need to rely on platform data.
feaa8baee82abab Tony Lindgren     2020-02-24  3101   */
9d881361206ebcf Tony Lindgren     2021-09-21  3102  static int sysc_init_static_data(struct sysc *ddata)
feaa8baee82abab Tony Lindgren     2020-02-24  3103  {
feaa8baee82abab Tony Lindgren     2020-02-24  3104  	const struct soc_device_attribute *match;
feaa8baee82abab Tony Lindgren     2020-02-24  3105  	struct ti_sysc_platform_data *pdata;
feaa8baee82abab Tony Lindgren     2020-02-24  3106  	unsigned long features = 0;
5f7259a578e9c67 Tony Lindgren     2021-03-08  3107  	struct device_node *np;
feaa8baee82abab Tony Lindgren     2020-02-24  3108  
feaa8baee82abab Tony Lindgren     2020-02-24  3109  	if (sysc_soc)
feaa8baee82abab Tony Lindgren     2020-02-24  3110  		return 0;
feaa8baee82abab Tony Lindgren     2020-02-24  3111  
feaa8baee82abab Tony Lindgren     2020-02-24  3112  	sysc_soc = kzalloc(sizeof(*sysc_soc), GFP_KERNEL);
feaa8baee82abab Tony Lindgren     2020-02-24  3113  	if (!sysc_soc)
feaa8baee82abab Tony Lindgren     2020-02-24  3114  		return -ENOMEM;
feaa8baee82abab Tony Lindgren     2020-02-24  3115  
feaa8baee82abab Tony Lindgren     2020-02-24  3116  	mutex_init(&sysc_soc->list_lock);
feaa8baee82abab Tony Lindgren     2020-02-24  3117  	INIT_LIST_HEAD(&sysc_soc->disabled_modules);
9d881361206ebcf Tony Lindgren     2021-09-21  3118  	INIT_LIST_HEAD(&sysc_soc->restored_modules);
feaa8baee82abab Tony Lindgren     2020-02-24  3119  	sysc_soc->general_purpose = true;
feaa8baee82abab Tony Lindgren     2020-02-24  3120  
feaa8baee82abab Tony Lindgren     2020-02-24  3121  	pdata = dev_get_platdata(ddata->dev);
feaa8baee82abab Tony Lindgren     2020-02-24  3122  	if (pdata && pdata->soc_type_gp)
feaa8baee82abab Tony Lindgren     2020-02-24  3123  		sysc_soc->general_purpose = pdata->soc_type_gp();
feaa8baee82abab Tony Lindgren     2020-02-24  3124  
feaa8baee82abab Tony Lindgren     2020-02-24  3125  	match = soc_device_match(sysc_soc_match);
feaa8baee82abab Tony Lindgren     2020-02-24  3126  	if (match && match->data)
e59829853456e23 Tony Lindgren     2023-11-14 @3127  		sysc_soc->soc = (enum sysc_soc)match->data;
feaa8baee82abab Tony Lindgren     2020-02-24  3128  
5f7259a578e9c67 Tony Lindgren     2021-03-08  3129  	/*
5f7259a578e9c67 Tony Lindgren     2021-03-08  3130  	 * Check and warn about possible old incomplete dtb. We now want to see
5f7259a578e9c67 Tony Lindgren     2021-03-08  3131  	 * simple-pm-bus instead of simple-bus in the dtb for genpd using SoCs.
5f7259a578e9c67 Tony Lindgren     2021-03-08  3132  	 */
5f7259a578e9c67 Tony Lindgren     2021-03-08  3133  	switch (sysc_soc->soc) {
5f7259a578e9c67 Tony Lindgren     2021-03-08  3134  	case SOC_AM3:
5f7259a578e9c67 Tony Lindgren     2021-03-08  3135  	case SOC_AM4:
4adcf4c28f6dc19 Tony Lindgren     2021-03-12  3136  	case SOC_4430 ... SOC_4470:
4adcf4c28f6dc19 Tony Lindgren     2021-03-12  3137  	case SOC_5430:
4adcf4c28f6dc19 Tony Lindgren     2021-03-12  3138  	case SOC_DRA7:
5f7259a578e9c67 Tony Lindgren     2021-03-08  3139  		np = of_find_node_by_path("/ocp");
5f7259a578e9c67 Tony Lindgren     2021-03-08  3140  		WARN_ONCE(np && of_device_is_compatible(np, "simple-bus"),
5f7259a578e9c67 Tony Lindgren     2021-03-08  3141  			  "ti-sysc: Incomplete old dtb, please update\n");
5f7259a578e9c67 Tony Lindgren     2021-03-08  3142  		break;
5f7259a578e9c67 Tony Lindgren     2021-03-08  3143  	default:
5f7259a578e9c67 Tony Lindgren     2021-03-08  3144  		break;
5f7259a578e9c67 Tony Lindgren     2021-03-08  3145  	}
5f7259a578e9c67 Tony Lindgren     2021-03-08  3146  
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3147  	/* Ignore devices that are not available on HS and EMU SoCs */
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3148  	if (!sysc_soc->general_purpose) {
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3149  		switch (sysc_soc->soc) {
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3150  		case SOC_3430 ... SOC_3630:
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3151  			sysc_add_disabled(0x48304000);	/* timer12 */
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3152  			break;
a6d90e9f22328f0 Kevin Hilman      2021-07-20  3153  		case SOC_AM3:
a6d90e9f22328f0 Kevin Hilman      2021-07-20  3154  			sysc_add_disabled(0x48310000);  /* rng */
e879f855e590b40 Nathan Chancellor 2021-08-15  3155  			break;
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3156  		default:
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3157  			break;
52fbb5aabb5cf62 Yang Li           2021-02-02  3158  		}
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3159  	}
4bba9bf08ff41d7 Tony Lindgren     2020-05-07  3160  
feaa8baee82abab Tony Lindgren     2020-02-24  3161  	match = soc_device_match(sysc_soc_feat_match);
feaa8baee82abab Tony Lindgren     2020-02-24  3162  	if (!match)
feaa8baee82abab Tony Lindgren     2020-02-24  3163  		return 0;
feaa8baee82abab Tony Lindgren     2020-02-24  3164  
feaa8baee82abab Tony Lindgren     2020-02-24  3165  	if (match->data)
feaa8baee82abab Tony Lindgren     2020-02-24  3166  		features = (unsigned long)match->data;
feaa8baee82abab Tony Lindgren     2020-02-24  3167  
feaa8baee82abab Tony Lindgren     2020-02-24  3168  	/*
feaa8baee82abab Tony Lindgren     2020-02-24  3169  	 * Add disabled devices to the list based on the module base.
feaa8baee82abab Tony Lindgren     2020-02-24  3170  	 * Note that this must be done before we attempt to access the
feaa8baee82abab Tony Lindgren     2020-02-24  3171  	 * device and have module revision checks working.
feaa8baee82abab Tony Lindgren     2020-02-24  3172  	 */
feaa8baee82abab Tony Lindgren     2020-02-24  3173  	if (features & DIS_ISP)
feaa8baee82abab Tony Lindgren     2020-02-24  3174  		sysc_add_disabled(0x480bd400);
feaa8baee82abab Tony Lindgren     2020-02-24  3175  	if (features & DIS_IVA)
feaa8baee82abab Tony Lindgren     2020-02-24  3176  		sysc_add_disabled(0x5d000000);
feaa8baee82abab Tony Lindgren     2020-02-24  3177  	if (features & DIS_SGX)
feaa8baee82abab Tony Lindgren     2020-02-24  3178  		sysc_add_disabled(0x50000000);
feaa8baee82abab Tony Lindgren     2020-02-24  3179  
feaa8baee82abab Tony Lindgren     2020-02-24  3180  	return 0;
feaa8baee82abab Tony Lindgren     2020-02-24  3181  }
feaa8baee82abab Tony Lindgren     2020-02-24  3182  

:::::: The code at line 3127 was first introduced by commit
:::::: e59829853456e23c433d2182233dd00d04577f0d bus: ti-sysc: Fix build warning for 64-bit build

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Praneeth Bajjuri <praneeth@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

