Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D236D1AE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 06:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713249723; cv=fail; b=la7i0mMTJEeVKIqx4JO8bZwcywfe1rj1WsoICh0/zT8FMcwNKBxVilF/APC0JrSfwOBszxWpErGY8Qo7UBVgF2q7UTKHuQ+i7fRd500nRNeLaEfAwg8loZ452iF0Ag75t2TcvRtN796BBamKBS0CGdpFT7hjwq80l42dcentQFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713249723; c=relaxed/simple;
	bh=vsvW2ZUnn1HJGE4Z6Gs65pU6BAv3kvXpewvMsWQ4XOU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gUa/U1WP/Ci8kUmrsRT990/UYeO7ydNDZU4DhPP5cKIOgqgBpGZwNHNdehVsjpu1m2HTzrrCxZ8WTUidkc2MX0Hf3VduuSwjUrILqeZ8D9y+FjSSYaCVtq9Z6EZGST//0+nRPvQ3qCALgGt9CyOi+Nl7uVNXNF1zWdnYHhiBT8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mTsMnkj0; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mTsMnkj0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713249722; x=1744785722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vsvW2ZUnn1HJGE4Z6Gs65pU6BAv3kvXpewvMsWQ4XOU=;
  b=mTsMnkj0ci/7IXbxXgpVSM8NIe5UNb4Guw2Wi/PkortJ5qsrKLJ8TQ6a
   E5hyOLVvxU8gy5TRk60hR9rvnpWWpJDNOeRAyWt/i7IojHAurZXEzR4z5
   5xz/JuEmVcuh5P8JflG2O0CjmxA0sO6A1R5nCeJZr4+MOnH34SiSGfo+e
   qsAxMz6xBOhq8nQ2ApwoerjxEP8VS26ELSRefZ7eznyUiogaI9jxCwnou
   I4NyG/9QrvUidz2aVMQEyfGankXUPpLEOgiTXqQ6V/VtqApYv9S2eD5WC
   X3YqL+nMVDZuh7AzVwbGPeuz3GOIR/002qUZhRmFgI7W7QXOVwH1Rm8jc
   w==;
X-CSE-ConnectionGUID: 6fRQiArfTIGk510s1tiNlA==
X-CSE-MsgGUID: dHyRn2LETBO7fppWndDCdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="31149151"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="31149151"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 23:42:01 -0700
X-CSE-ConnectionGUID: kPNoJhluTCy6AGw2cBUr7A==
X-CSE-MsgGUID: 5xF7Kh//R/Gk5LcdxQlQgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="22193840"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Apr 2024 23:42:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 23:42:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 23:42:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 23:41:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjX/ZcBvntF2O/df5l5Qp8RoV6trz0rvShUnVhpKSB+7i9qhhJJt5m2MkWcCRdiJqaDQJ7MVcM0lj61A1Y5EH6YAOUAIFOQxbrvTsTOa9sZbJIbWz0BXRc7J/voPeFO+UDaVK1XJ5Bixq7/JXt28jca6hQ10sDhReTb3Pv0Z2oGEuW3IGWjZA/YyRBNqR17FbJW4SJscpw4jRAxYMjc+IQ4Z25E95+vJ+zYJ6uSpK7WIkxO/vAvBUfOfPVsn3DlShnL4uc/eVvwat/y7wFC/uoR5pl/ExaGhviZqL9m96hLni9TlJ5qCxvGTjbxXorRNRm81q+2VxaDLurWqzPYnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2YfPRNhowmq4I22axrnyehvB8AagqwG0onFX1G+m0Y=;
 b=kCMET85G9GeCsAx+ul5VSppof5UUaS2psEwAWnCOFmp0YHqOZmLL0xgFn6lsR3eWnb/oQlpXtYCi8YUPo4WrPoKdHFn3a5yTW66sL5U16LeJQ9cqivG59S1vNvrDL+myaGK0+0jpcQTZg0QCNbtwXw6eubZRsb1hiawhVZwfqpStBFes+QbQTXx0HnacNXEuaoIYmXwxGtfQmoSOh3ZzW4lPWmOvjeRp7mi5LYgKql9onwAxFi2+ry6jUKZz5CjrQgAVZvdMml2J7Bmftz4lmtZuGYS+UPEdBi4IcPLf8H5ysg6vuH/TN9heOZE15Qv5YbQygQpr3lnePgm0DTF42Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by IA1PR11MB6265.namprd11.prod.outlook.com (2603:10b6:208:3e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.28; Tue, 16 Apr
 2024 06:41:53 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7452.041; Tue, 16 Apr 2024
 06:41:53 +0000
Date: Tue, 16 Apr 2024 14:35:18 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Edward Liaw <edliaw@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 5507/6266] ../kselftest_harness.h:1167:9:
 warning: ignoring return value of 'asprintf' declared with attribute
 'warn_unused_result'
Message-ID: <202404161023.K0EsnDmF-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0047.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::15) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|IA1PR11MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: f618efb9-81b4-4baa-483f-08dc5de04d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5bRH9memM1zEi5BZAYH+50LiN+PamqP7dtSqOB3Bnh0Evi/7Kf3BsCiA+RFAogX5ozecALa2KxsQnZOwzs+mIQCZGPGC4bq/CD0nH5Yopqe/Ih2pjpT9BTunXV54Vce1jxvLlkLeMd+z6HjWqt/TqT0nfkfgUV6+9o40PDvCUqAm2RRr6C3LT4xeEQqI/0V8ynVjXf/4oqruuN3k+aigtC2wBZR1ovjRO8Q1dDtCnaub5YzNPRvDZG7XRmNzXF6vYrRBq16waRIwedvrI4IU6nR/UGpEL+idsg6f7D99+QKILMSlvEO9I8iD109xZo69LmtvT3zi2psEJWrUmx0QCUBgLOrPJ+9XUGiaHWjurawwmfFSvCeZBXVBKxkq8xSr/m6rCt4ExbJqb4DGqgkZeNj7LQXgsFeROR/vmF8+6To7Iu3pX8+pWgxPg5u8VdQA68cNNA5mPEf4snoqSv91YbiEyVOW6q2mTg8oq3QfHZ0mz1zfpKnqSjIdr+E6GBBvXq5uVszGTzRe/eFIN4vW+iJ8Dd0QeB+Hz3odZ2hbZ/9S8U6lsI4eO09ySY8eTMAN/om3urK3iF4mgXX7xQpEIUWyrOCtCkcpvAZK64GnsUcVVS9EhpDUAB9P25594rUf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lNbqw9Rx31YHm07AqGtehS5Hh2X0LJ6P6KeMnqXnqmk/w9kE3N3vvhC+N3xr?=
 =?us-ascii?Q?r8hgwXVi/DrvRuDz8VOrDifh7YllJcxiChvKEbUyBpBrtDCLyJeqqILaBLY7?=
 =?us-ascii?Q?nzTzHKP+/tj8JDuQaKBeaszB4yRJUMjkQD0E20XFC0RCWNBSmpYpiZsGzSNY?=
 =?us-ascii?Q?2KSZ4d1MTfgDGMTg8PFfaSFMiAdX7BOImSftpYot0BNtxRL0HeiVegwmcDi9?=
 =?us-ascii?Q?Bs01qv9uLoFKuSqm5lmYBeaC2qPl6H71nwrL+z2mI4fbhSizqS14H4cs4RUc?=
 =?us-ascii?Q?mAXOIarNSDSefgRnQ8RqIpX0kOyNUjdoy5l4g7Q7b9cqQJ72zTt6PAtvHpq3?=
 =?us-ascii?Q?sde0kxzBNBjjuS6gtnuanoMYq/od1UGI9FeKp1HTNsiRcWZMrKYx33DS/gFC?=
 =?us-ascii?Q?wrwfyM7yirkZA351xYBwVXzHTysD1DggKCEyyx+K0zirLBfMY12y80Cae0vh?=
 =?us-ascii?Q?46aFIzuEJ9xPuLKkz0//+IrW83hs+HjT937WVEBn+psAH9moqExC2hzPVGXg?=
 =?us-ascii?Q?PbLB2ngeiVEQsOV9n9MZ95jaPbgL2q/TtaK00AN/HvwY5SUNyuprWXNieb0A?=
 =?us-ascii?Q?AhfhAlnclwoC9rckvap0cErXRzO4OKOuySS6D+tvMnxU7b8OcNCnCpGnXs/0?=
 =?us-ascii?Q?2kBklIuTr+h1k5nAtSfTTh7ZM/yRSM6LKAWXha0Xk2FwKb3q1kc0nkU0Nn9F?=
 =?us-ascii?Q?B+eI5YujFu+RQke4fQjgZVvQ2q7UsY4YcSdAkkhWSgS1g5900bl/Xf585GsY?=
 =?us-ascii?Q?I8ABD+QOHejVbu2200A+K1OF7vL+hX4W7/cKIsEAOR9gqsPC37UEpM4Ydbp0?=
 =?us-ascii?Q?vYplPWLEM/3kROMaBpikygKhp6/gnW0MvbgSojqSGivePtGqNkflxVPDMw3U?=
 =?us-ascii?Q?IM4cYKH4KqqDDfC8sdt02PCJzRMM2zUCkcFbeOdT19swMeXotroP0lA6PSQX?=
 =?us-ascii?Q?nBSI/Ea9yqb1xJaLWrbKGDVSJad1mU64vW8iO/+TCEWKywRy9Tz6IwH0Ox71?=
 =?us-ascii?Q?crO4/ULAYp1DJuWqXKOvF1rxQwuVfFqxdQhD+aUQcPBJ10Xf/Wrpy+08Mr9t?=
 =?us-ascii?Q?oNGxbeAGs6RYTmq4mhuuwPNEbXjHTdlvb4z0V/ISBHzpbBkKzPcd+oxUxKL7?=
 =?us-ascii?Q?3o3EtqMn4d9BkY4FzVS4Mnz4O+O7X/zBqp/aKPmEkGqn8iNX7ueGOMfuwr5p?=
 =?us-ascii?Q?ViEQujsO6nHzCQ13xvDI+kE8f9Sc+8DEYgljG47PcLSK4f8XB7PreoOsC2LT?=
 =?us-ascii?Q?ucRVw84L0eSNhP9KyQSPmfuSpcEVaQ87AFyH+4UZnXmjzptf01nvSNbK+P9N?=
 =?us-ascii?Q?Wjf16EBcAE4iqGx7h5H7i2hkMAtnfu1Xx9MJBMveJPA4yX55yIqFMDlQMpHP?=
 =?us-ascii?Q?OZcLldrjHlUa3fHZj2pOM1VmctpMaSLyD8XsUSl+7riTq6c7pzXK4AzZ9TMe?=
 =?us-ascii?Q?Evu0RjdfKWemYNOfOw8P0bcifycjq74D57DTT1vS2gunGLTC0q9X7PRx0Asy?=
 =?us-ascii?Q?RJ0IPEb8vycOZS56Q+6QO3zgjihkvmi1+efs8Jt8CjJYd8e2ILnsxCP6+uay?=
 =?us-ascii?Q?jyYNaDVosF6psijdWCzaSyMr8219DcPbRqNeZ+qr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f618efb9-81b4-4baa-483f-08dc5de04d37
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 06:41:53.0681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7h/2ghX/DOrj1Nl6nxnH9+RQt8IJd5e9bHSI1sEJLKEP0kkThYqp7H7i6Y9Pz17UQ+bI04t2vpZgVvbAOteuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6265
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6bd343537461b57f3efe5dfc5fc193a232dfef1e
commit: c19377e23d4cb45f69c5d226ae3436f7fa818c8f [5507/6266] selftests/harness: remove use of LINE_MAX
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404161023.K0EsnDmF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202404161023.K0EsnDmF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from tls.c:24:
   ../kselftest_harness.h: In function '__run_test':
>> ../kselftest_harness.h:1167:9: warning: ignoring return value of 'asprintf' declared with attribute 'warn_unused_result' [-Wunused-result]
    1167 |         asprintf(&test_name, "%s%s%s.%s", f->name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1168 |                  variant->name[0] ? "." : "", variant->name, t->name);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/kvm_test_harness.h:11,
                    from x86_64/fix_hypercall_test.c:12:
   ../kselftest_harness.h: In function '__run_test':
>> ../kselftest_harness.h:1167:9: warning: ignoring return value of 'asprintf' declared with attribute 'warn_unused_result' [-Wunused-result]
    1167 |         asprintf(&test_name, "%s%s%s.%s", f->name,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1168 |                  variant->name[0] ? "." : "", variant->name, t->name);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1167 tools/testing/selftests/net/../kselftest_harness.h

65177e47d3035c tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2023-01-25  1153  
142aca6b388c8a tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1154  void __run_test(struct __fixture_metadata *f,
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1155  		struct __fixture_variant_metadata *variant,
142aca6b388c8a tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1156  		struct __test_metadata *t)
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1157  {
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1158  	struct __test_xfail *xfail;
c19377e23d4cb4 tools/testing/selftests/kselftest_harness.h    Edward Liaw      2024-04-11  1159  	char *test_name;
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1160  	const char *diagnostic;
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1161  
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1162  	/* reset test struct */
69fe8ec4f673b5 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1163  	t->exit_code = KSFT_PASS;
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1164  	t->trigger = 0;
0ef67a888375b0 tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-06-22  1165  	memset(t->results->reason, 0, sizeof(t->results->reason));
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1166  
c19377e23d4cb4 tools/testing/selftests/kselftest_harness.h    Edward Liaw      2024-04-11 @1167  	asprintf(&test_name, "%s%s%s.%s", f->name,
c19377e23d4cb4 tools/testing/selftests/kselftest_harness.h    Edward Liaw      2024-04-11  1168  	         variant->name[0] ? "." : "", variant->name, t->name);
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Ellerman 2020-09-17  1169  
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1170  	ksft_print_msg(" RUN           %s ...\n", test_name);
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1171  
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Ellerman 2020-09-17  1172  	/* Make sure output buffers are flushed before fork */
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Ellerman 2020-09-17  1173  	fflush(stdout);
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Ellerman 2020-09-17  1174  	fflush(stderr);
c8bd596f9388bc tools/testing/selftests/kselftest_harness.h    Michael Ellerman 2020-09-17  1175  
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1176  	t->pid = fork();
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1177  	if (t->pid < 0) {
e80068be21824e tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-06-22  1178  		ksft_print_msg("ERROR SPAWNING TEST CHILD\n");
69fe8ec4f673b5 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1179  		t->exit_code = KSFT_FAIL;
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1180  	} else if (t->pid == 0) {
92d25637a3a459 tools/testing/selftests/kselftest_harness.h    Li Zhijian       2021-12-17  1181  		setpgrp();
74bc7c97fa88ae tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2020-04-27  1182  		t->fn(t, variant);
796a344fa4315f tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1183  		_exit(t->exit_code);
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1184  	} else {
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1185  		__wait_for_test(t);
f46f576280595f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-03-13  1186  	}
38c957f0703827 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1187  	ksft_print_msg("         %4s  %s\n",
69fe8ec4f673b5 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1188  		       __test_passed(t) ? "OK" : "FAIL", test_name);
9847d24af95c7f tools/testing/selftests/kselftest_harness.h    Kees Cook        2020-06-22  1189  
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1190  	/* Check if we're expecting this test to fail */
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1191  	for (xfail = variant->xfails; xfail; xfail = xfail->next)
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1192  		if (xfail->test == t)
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1193  			break;
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1194  	if (xfail)
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1195  		t->exit_code = __test_passed(t) ? KSFT_XPASS : KSFT_XFAIL;
2709473c938602 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1196  
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1197  	if (t->results->reason[0])
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1198  		diagnostic = t->results->reason;
378193eff3399a tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1199  	else if (t->exit_code == KSFT_PASS || t->exit_code == KSFT_FAIL)
378193eff3399a tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1200  		diagnostic = NULL;
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1201  	else
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1202  		diagnostic = "unknown";
fa1a53d83674b3 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1203  
732e2035280bf4 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1204  	ksft_test_result_code(t->exit_code, test_name,
378193eff3399a tools/testing/selftests/kselftest_harness.h    Jakub Kicinski   2024-02-28  1205  			      diagnostic ? "%s" : "", diagnostic);
c19377e23d4cb4 tools/testing/selftests/kselftest_harness.h    Edward Liaw      2024-04-11  1206  	free(test_name);
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook        2015-06-16  1207  }
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook        2015-06-16  1208  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

