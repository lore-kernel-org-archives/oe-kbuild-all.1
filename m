Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E5B2913
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 06:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711607066; cv=fail; b=cDSopazTjCkobWqxZuRpnpGlvz+TrhGIxIaFf4jxKPn1c0+I+ftLT8syqQxFM3cGAlXRo4OUo3eA3cmsiJ9LREvNUJPLHwlLIGFRgHsDiNpHNm/3M7hqNgetfWIJQY8RwF0Wi6qtLsFG3dFJzDCVrGyy+No+onB2wV+cgJXQswE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711607066; c=relaxed/simple;
	bh=KCbvEW2F5R0Y5830kMkZWd7cOMHH4rWWrzEdpUu1k2c=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=YAfKSLkxQ89kYdtWfImyB3r34MLVvtZUdYglzzxeNdJ1Lj1VgT2vSLsRmfe3oF2ZlFJqhP7W3SIjxGDerALh4NM9CJ/Npzt3fJXIqiU4KM1Mxyi/AzuC0oBNKozIzDsco6cSBN+jzvkiXHHRZKS7hlHN/m2Ne24m+UCClDz+y8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mx280FHC; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mx280FHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711607065; x=1743143065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KCbvEW2F5R0Y5830kMkZWd7cOMHH4rWWrzEdpUu1k2c=;
  b=mx280FHCG9F2ek1AqR1rYIPMfoFQyV0tz9NIBFSVzqgJf8/qGmJCiNbU
   178xTwqGHw51e98ce6EwTI4imCXQYrm4enNPdjYYEWIKV0Z+AVG2FdnhR
   MLyOFOjDwVCK2Qz1ebwhFuIJp6mT4/u7NKfTZfFQxOcXYTOJ0Myc+CUdv
   bM2trYkVE4U+7C+h3OBsaV6vsS7tQh2tdKnk92W9tNV9O6cd1d4euEnd3
   ovztM1VT0zo1iBrty14IkagdsLcK0b6+QeDUCHgRbVtTgvCNr7IotdhZN
   7Vi3d3vHP4csSAyOuNVhbv6doXR2AMRoO4JcatYuO3TtzmG7+DbfyXCq6
   g==;
X-CSE-ConnectionGUID: YYx+IfbTQfmFOcQplAyM2Q==
X-CSE-MsgGUID: Cxz0yyq1S0O0ZutWxOCs+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="24234661"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="24234661"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 23:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="47522460"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Mar 2024 23:24:24 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 23:24:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 23:24:22 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 23:24:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 23:24:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQbOMN2ApAmpxV16syULXq456S0X/v9pu6JmyR4ZYMhUDTu/6dxX1dkuZIOS5bGvvoKZnFkquu/rg0YloCYXok5zV03rsChc7MQcuHK5QoBWToOXd0dVhVOlxpoPEf02FMd50ljxP4rJ3qc6Kwax9SXPugsIUdOKuuxxptqJefj0nScorvsQRk/7JqpB7khpdCrL5FCW8WH3xfxsI/8rDZo+Y6sOEuTvqnq/Waa5/iFK3l042w11Q/tFYP3nzpYAU18/M+A+HtBFjgDa7mbjZDglZZRRTi9yMNt4kcFFsDN3PTkgw543iia3uohBXt47dFaak77AMD36q1obTF+dmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FKN+0f01EURFA8LNVjzUli61+Zpax/jBi1o5CoEn/3s=;
 b=KAtWpIOOZwVo5B2QAkvJLKAAIkDAPC3MUTVkZpH8LrL6DRAaECtuZWs0RHb7K282PUf5UjHXu7a41WgtyD2LKCrzKDw01jIsk2gvk75/ZTk6E+wbgVtMR6PMew/k4Du4Gezww+tClPLEYSmiE+7V/8yz5mtMQiSj5PQPGMXhd9GRG2H/kU2HCnzEzJqIahWZk1EldYaudAEH3dNNL58E4ohKyo/SntHSNQ30JdQGYJIdP3lmRuLsv85E0iQnPx+A3WpEiMlS8mdquZjDEMMAfhS7ITqMu1TVWJZ26nGd8e7sZiUmEU6b0PkQE8flMO2y0Q3//RjbFp4LvWx31T+vKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MW5PR11MB5762.namprd11.prod.outlook.com (2603:10b6:303:196::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 06:24:20 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d%6]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 06:24:20 +0000
Date: Thu, 28 Mar 2024 14:17:39 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Mark Brown <broonie@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [broonie-ci:kselftest-clone3-set-tid 2/2] clone3_set_tid.c:136:43:
 warning: format '%d' expects argument of type 'int', but argument 3 has type
 'size_t' {aka 'long unsigned int'}
Message-ID: <202403280640.wfzWalmq-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MW5PR11MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 605b50d6-94de-45ce-83f7-08dc4eefb3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gdx4Xu3yVu9o4pw8jYNu09m6Z0F+3F2m7qLtxlFFsYynkWingqJ1IDXwS1u/EsYa2JWLKF5qsnHEdpXBZxeZyo7ehWgv/+thVgsONJJ4sRLQsehHLXCkrkcyuGNbQ1FarZ0MScbcUe136Pol/MkgYyCVOgS70ky0/1q5/XMkQHgEszqjmCw2MkOUrnSry8Y0hje4vPxqbn5/mBepeRYAS2RFCRKyxebqjYAsO07oGgXug5c5QXTib6nsKCV5hbpmKB5w50DF0YTLuU1SRikDBBB1jVDSvNRgTyuEAopAwWz6JeaEKWD152GaccWO+skCTaaPGZFUCv7AeXVz9YjC4gMuzO6aenug0W1ga7OeY7WVGD0FCVTj78kYcdZsPotfmljiKmxASpPzyigleQ5K3EmIQItZF+lzJYo/+H9Vt2SjEEaKYYDt97ucz19EHDPmRvslU/aFZaPV+14dvCtmHKLDbUYi7AYcv04tXGkJy2+ylIbh2nZy2qavTD8CRSLtGbkpigKyb7620nbi8GrEnSeqF2FouGUXuyQmVh9IQqQOSeeHK2UFO4Mc4ZdCeb0lJ7Z26/PVPju1/YDgN3t9rzGITPo2ANrdNqToG7YhR2kVc2gd/ANQddZG0+MwRWNX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AEQ8f+Z615KXenw6dA9+ujX9WsHOZhefiLBx5v6GNdBchLooP2pDWKFvwzNi?=
 =?us-ascii?Q?Y5FP5FEzroAO9JZxXWUFcY2CVdg9na58FcjKcDQqWmhiXEQD2Qjxsj+qU/3o?=
 =?us-ascii?Q?ODLfr1KKxxFGDa68URRrCrHGhxCN+aRJQtEcQ5xpYWEGk90gHnu8+RvM5MUl?=
 =?us-ascii?Q?obHl3qESbiVUbyKuv7EYl+/mZVN0j0ndaymGBlm2eQLibXTRfax6nAmi8jXT?=
 =?us-ascii?Q?S5/XnPhq+3B7UcL+6bPihTZUX2uRjzJeWBxHJpNTVQGpUPs9AAWzY18GFw40?=
 =?us-ascii?Q?1f27Mgvgfr8xQbZjpQjzeV0Vd+lRaMFStBvFRAY98g5AXWoexwf3x3iOjIud?=
 =?us-ascii?Q?0NvdebmydEcrPtuM9rXZZDG79kXX++7Jt9IFDQFYTFeimF74rdkl8kRqvOB5?=
 =?us-ascii?Q?96Dw9VxpxYY6AvSp2h26GuLxmktuVdXqvl6RNTo3Dl2rQDcmweDt9SGJhO7P?=
 =?us-ascii?Q?5K4FCfl1HiFP8m6VrUgGC95S1xycu/sMX39tJ1jALYNoAHqKe7SNN1ED2xcj?=
 =?us-ascii?Q?mxto9cz4MOm0ZzIhisG7DWMG3v4vIoVpYAoEC81bEI66abxq4PoNxXPFjdKT?=
 =?us-ascii?Q?L+/bmbLkpoODQPsah4ugsJTSrNKWNkdUFxYxpEQP4ojEXv35WfPVOfiEmLJX?=
 =?us-ascii?Q?ZbGCHJWlOtIhOLg5ljADW+FNi0yuZEhMGvyqQj8PRyArnZPknDuObArh4Z9C?=
 =?us-ascii?Q?PatdOFSTgwZqjzu/C39YrV0Wg5IcTsaFM6A0povNOyulOHuTOBv2Cpu++6Uc?=
 =?us-ascii?Q?zSniHzt+1BX3RfhPF0swF4KNDoRouZeS9O/Ro9jyE8pAzviUlgpPKfg64V9c?=
 =?us-ascii?Q?tUYR7d8mlIUVzWVvW4kHI3VTJ2VXnh+TveWAeOpMGeIQX3ATf/hpQVMTVcYc?=
 =?us-ascii?Q?PhxeCyfuvygbL1yOmCZHmx7jY2nUbjBBEdAL/I0TQJ5kv45edoPUGM4/VUfQ?=
 =?us-ascii?Q?XUxRoE3SVbioJEXJVBazEbsTnZ+icdzwsxIj43BZBP8L7pROylmrKQKjx9Pf?=
 =?us-ascii?Q?kwr86a9aK5YJ/ygaa4hOijY4GeE2q+JRuMCN0gIb8+FFQto4i/yRPXm+dUmR?=
 =?us-ascii?Q?lNVBw9CmTIYV9wvmQHVwqbz+HP3RjE7sLqxxYEUi8Ng8fFw6pedC+C4HIsLX?=
 =?us-ascii?Q?/dWVFrhuZrmKnIGlwMwP5z/kqnsbz1IwSh/yrujWtEylqOpi8qeYxNFXYAAF?=
 =?us-ascii?Q?Kg+o6hodzfXRDI1sncXtemHZZsW53urPz5lNRdvIpbBZo8djytfH0oPx13hA?=
 =?us-ascii?Q?qWJb8q5xE13jgXo5YcTh0uEMn2L+qu5liF1WHQamnC668Gk/rmAAoPvZlzYD?=
 =?us-ascii?Q?Zt/qLSZJj59FZBdVf1YyOQZghwxasUjh23txes2e773LaJUXXtgPUJz+uQE4?=
 =?us-ascii?Q?N1kfqLX87OqRB+dhy22X6Hlb16msQE7Ka9x9RkuyD5gUBWEL2vsdVC2v9E2k?=
 =?us-ascii?Q?se1H4eN8Za57NHP86egVpDSpIjvf23zoFZ7W/CQRBfY385Ql77OjVLVOvO+9?=
 =?us-ascii?Q?JeHtrqhgnjazx+RrOEjSzWTefKLzVKUjVQ2X+h7IIw/54XCiiNzwR6XmCtt3?=
 =?us-ascii?Q?BX7Fm25YAC/BqCepcTbHuGePNfRI3wcm57htXGTd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 605b50d6-94de-45ce-83f7-08dc4eefb3ef
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 06:24:20.4896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXOl1qqqbdCW3NxZv2dxKlGn2vHYQgQqoVDxsUMcVhe0VvQJ150KOaUzp2V1hIZ2TJvgeEpJDd/T0ZY5DUSXJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5762
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kselftest-clone3-set-tid
head:   6ed9d474840a027cb6b1c5c16fbce9ed626c9dc8
commit: 6ed9d474840a027cb6b1c5c16fbce9ed626c9dc8 [2/2] kselftest/clone3: Make test names for set_tid test stable
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce:
    $ cd linux/tools/testing/selftests/clone3
    $ make

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202403280640.wfzWalmq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from clone3_set_tid.c:23:
   clone3_set_tid.c: In function 'test_clone3_set_tid':
>> clone3_set_tid.c:136:43: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
     136 |         ksft_test_result(ret == expected, "%s with %d TIDs and flags 0x%x\n",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     137 |                          desc, set_tid_size, flags);
         |                                ~~~~~~~~~~~~
         |                                |
         |                                size_t {aka long unsigned int}
   ../kselftest.h:210:39: note: in definition of macro 'ksft_test_result'
     210 |                 ksft_test_result_pass(fmt, ##__VA_ARGS__);\
         |                                       ^~~
   clone3_set_tid.c:136:53: note: format string is defined here
     136 |         ksft_test_result(ret == expected, "%s with %d TIDs and flags 0x%x\n",
         |                                                    ~^
         |                                                     |
         |                                                     int
         |                                                    %ld
>> clone3_set_tid.c:136:43: warning: format '%d' expects argument of type 'int', but argument 3 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
     136 |         ksft_test_result(ret == expected, "%s with %d TIDs and flags 0x%x\n",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     137 |                          desc, set_tid_size, flags);
         |                                ~~~~~~~~~~~~
         |                                |
         |                                size_t {aka long unsigned int}
   ../kselftest.h:212:39: note: in definition of macro 'ksft_test_result'
     212 |                 ksft_test_result_fail(fmt, ##__VA_ARGS__);\
         |                                       ^~~
   clone3_set_tid.c:136:53: note: format string is defined here
     136 |         ksft_test_result(ret == expected, "%s with %d TIDs and flags 0x%x\n",
         |                                                    ~^
         |                                                     |
         |                                                     int
         |                                                    %ld


vim +136 tools/testing/selftests/clone3/clone3_set_tid.c

41585bbeeef940 Adrian Reber 2019-11-15  116  
6ed9d474840a02 Mark Brown   2023-11-14  117  static void test_clone3_set_tid(const char *desc,
6ed9d474840a02 Mark Brown   2023-11-14  118  				pid_t *set_tid,
41585bbeeef940 Adrian Reber 2019-11-15  119  				size_t set_tid_size,
41585bbeeef940 Adrian Reber 2019-11-15  120  				int flags,
41585bbeeef940 Adrian Reber 2019-11-15  121  				int expected,
41585bbeeef940 Adrian Reber 2019-11-15  122  				int expected_pid,
41585bbeeef940 Adrian Reber 2019-11-15  123  				bool wait_for_it)
41585bbeeef940 Adrian Reber 2019-11-15  124  {
41585bbeeef940 Adrian Reber 2019-11-15  125  	int ret;
41585bbeeef940 Adrian Reber 2019-11-15  126  
41585bbeeef940 Adrian Reber 2019-11-15  127  	ksft_print_msg(
41585bbeeef940 Adrian Reber 2019-11-15  128  		"[%d] Trying clone3() with CLONE_SET_TID to %d and 0x%x\n",
41585bbeeef940 Adrian Reber 2019-11-15  129  		getpid(), set_tid[0], flags);
41585bbeeef940 Adrian Reber 2019-11-15  130  	ret = call_clone3_set_tid(set_tid, set_tid_size, flags, expected_pid,
41585bbeeef940 Adrian Reber 2019-11-15  131  				  wait_for_it);
41585bbeeef940 Adrian Reber 2019-11-15  132  	ksft_print_msg(
41585bbeeef940 Adrian Reber 2019-11-15  133  		"[%d] clone3() with CLONE_SET_TID %d says: %d - expected %d\n",
41585bbeeef940 Adrian Reber 2019-11-15  134  		getpid(), set_tid[0], ret, expected);
6ed9d474840a02 Mark Brown   2023-11-14  135  
6ed9d474840a02 Mark Brown   2023-11-14 @136  	ksft_test_result(ret == expected, "%s with %d TIDs and flags 0x%x\n",
6ed9d474840a02 Mark Brown   2023-11-14  137  			 desc, set_tid_size, flags);
41585bbeeef940 Adrian Reber 2019-11-15  138  }
6ed9d474840a02 Mark Brown   2023-11-14  139  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

