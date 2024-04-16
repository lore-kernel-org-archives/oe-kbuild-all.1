Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DC233998
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 06:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713247563; cv=fail; b=tLsoRIMQkZbNgeQ0W+VDIg7UzQjxoKYEX5vAdX/8sCk0lJjEXtDIuVwaUnO0bKYZu/4KL1S4TmCDnoe0yGAY5HbIiPXr/5RCO9B6vJh6+voqP9i3JmBPTjlN5rfqp7xafbdvbXQRlLzcWlQnYAqxjzMeZG6R0I5jvl05O+iv8ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713247563; c=relaxed/simple;
	bh=lfL93Fc+1SouEnD/QBXdWk/By2DuhPqZsTXy67pPrBk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jUgdg+1f9hidnkTprfghXOpfm+jSQhFVuaeKBvC/cqrKk6+CcQjinQAlUHeaLDUehL/yjfuvNMj6J91hHiLbxmuuYZsYVGQ/M9/YLcMjN4/fqRxDibwyW8epQoNxPBtjF/ijr/epn90v7B0/k9a49paBoWFRd2IzWPj+uEmoeas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZJ6TlI2; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZJ6TlI2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713247563; x=1744783563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lfL93Fc+1SouEnD/QBXdWk/By2DuhPqZsTXy67pPrBk=;
  b=JZJ6TlI2C2fQ/bos5t78QuyxQvkbKOwFTG6tJw97hCldGPxX0qDTLDxu
   tdRvD9BnqjVBbNORdhZeeF2uv6aFtvsIteaHY09t/T88AZ5QXrqCW67sl
   7hKAzyKs1BjU37cC+EANxI0djyfeRGizi51J2E4Ao/bxQZQw4SK8ZyLoS
   JbI2spg0nyu6/1WGf1PDYy1uIOXffP6MtcaMGB9K9gZAIjyGXs/hTSV47
   tCXYJIsawcLlIj3VF5fliOXe+UOs+8z+0LFg1nx10KF+OPPJOXjjI3i+V
   vVZWvDHU2vc/4rvJ1FqM3I44FQTG9IhxsPy9ZYRL4St4LkuG4PwuqQIJs
   Q==;
X-CSE-ConnectionGUID: mlZLvPXQSyW8NHqxr9dVbw==
X-CSE-MsgGUID: /ElSauupRWiD5sKHdvscIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8545854"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8545854"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 23:06:02 -0700
X-CSE-ConnectionGUID: tdRM4MwbSYKuwe+2uTfW2g==
X-CSE-MsgGUID: KivuCVX+SSmnR+KP3qguaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="26806984"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Apr 2024 23:06:01 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 23:06:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 23:06:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 23:06:00 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 23:06:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XS+XwSqTxFszkpL8KVXkUVDFhEUMRk57koa2lxVurkSjOvQfitgRrFAzZ2WVQ/ylSA9uJLD0NwFawW5k0dpqorRTrVfnxeWtBH6Dbud4nm22DRp3t2E1Q2gzV4A6JAkarPVdJE4TRcCO97LQ7vUjdR9O+R/12RyEFpXyo7HkiwnaCJQ7ktrvl3iK2L4lO9KoCxeGMWkXxZScrADKypEAuuTsXdV/yhM9/GEqPVvUxgXM3PppORB0fYtIOvmLsamVXGXzw/v7KByWeRTnzEwPIDdF/QXB+T+tdMocd+KiE7bxxfdej4OjF4n6xZupOiAwS7yX/UI6fBfQSCy82llQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/iRu0Su4U7v+X7Q1l12pnof/2o79CWtGLpuqSOAHD8=;
 b=D1Ouk1NSmAu0NXVrcve8En7xKcaNe0cgbp1bL978lP5U04CAs4f35TfdeR7Qj7gSvbtx/JAi5xuCKR/drTQ9eOTwyPNVupyCbSUlFZdQDSCoBA465OrAsMlFA6DlrjmRqM4HhgfXbfIBTI3rt8g40tznHEZGUUY2/lbRNfkwScugFX90bBiDcQe+UfM5DQiQzOP7XH3VswzcDDcRe7hEeC6m8TDmh50BErJOrseOONsAn8DJpJ8lGYDrNsrAsrX91G4rP3REavCqAI9KA6IcyISzvXpvCMEyTYnTfKxyyg6galJzmN01ZUKgu/DG16REQipj4NH1OZZTlpwPl7w25Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by DM6PR11MB4612.namprd11.prod.outlook.com (2603:10b6:5:2a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Tue, 16 Apr
 2024 06:05:58 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7452.041; Tue, 16 Apr 2024
 06:05:58 +0000
Date: Tue, 16 Apr 2024 13:59:24 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Kuniyuki Iwashima <kuniyu@amazon.com>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 2092/6266] scm_rights.c:203:18: warning: field
 'cmsghdr' with variable sized type 'struct cmsghdr' not at the end of a
 struct or class is a GNU extension
Message-ID: <202404160354.YBvIGPEM-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::16) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|DM6PR11MB4612:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b2591c1-459f-4e6a-1845-08dc5ddb48f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hU3kFrRl1+q6ungolH/W4B6J5SbypeHhFGRC4llp0jonLsICwaZEAAw0AyOxZiUW1boFh2YKyHSsx79dJyAcSklt7/CvtHAcVhjj03VWeuDx4OgWbQwLJP8T4v4dwPWEbRo3Li4a900/vejspB3ZoIq+8Z/lxOZG/QuHvvluC1fQ/uk6mONePF7KvnSVNdsuuu2KBDNL17vIGlymCdH6wiIe0aoFCJipgr/+NHssoNYS3kTtM9+fG8i7/LZUwH6jtT8F+ZfAdYgZjFkWr7Pu3vLYkX5bfzncVOOGOrdr05pcU3mkhDbUiBwBQad1Q6wSTxa+urVbbbV5cJaFwbsz9J2AIo0gSQdNJstyz4qY4NHOT1E6sc4z0ZXgWSljPaQKj2XqSWyjp/0Rf9rNVn+5WBXNmMqo71SwxivWuV9rvkV3gEjfKIrL6iMU2tsSsi7LWNRec7TdGXD12rU8dSMeGNcfyiaZj2lFM9lJxwikNotdCO+lwEW0T34mfHK1FmmKpo0kzAHWNY47OKyMXzSRLqVkS9ukVOBgGC1EhhoRqvlRazCr5Ljdw7dLhxELdpSRgbsjz3HnIRECXPlvyiooWmGvbQH7XpVJOFLA713wVfv2LIwl6snEaiFaTP4IbUDuj+pabM135XbuVa3BL1+llc6r+r+QiG5/RtLT8eGsLJs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NADAVp929MJpmCcTiaF+M5qrRhKkSjE8U+c4qCUlM40EPujzKO3z2YrzNwHx?=
 =?us-ascii?Q?bi3lYfz47Bq0STGAt3wBL/ceH3bv/LM0rwt+SCO67Cml/JKo23xxytyL5Wef?=
 =?us-ascii?Q?mM2SjATtImxNG5Rh1CJ9UJ47bjmRHvf7i5swzqt8eZaA+/AsW5k70rUPLY2G?=
 =?us-ascii?Q?bMnD+cz9s/L3JNJ6dDBlUWTP8uC3cAYFCshxTSVlbp5HWRE1tmCW61kufTBn?=
 =?us-ascii?Q?vP0Fegl8ICImMNhkTHWFhyE4+3bFXmkErz208zhZug9PXjsV4V2jaPfBF7CG?=
 =?us-ascii?Q?6HIJ4sMxrUUso/LWe48MHPMKf1LIN79kQQk9rywCzA4OPz3uVbaAKDxYjlpk?=
 =?us-ascii?Q?a0r9KeV+z5wj0lPya+rJnlZgr8sqRpYOcv2lcEVuPc81e4oi1ozM/cGyrEyg?=
 =?us-ascii?Q?Lxmt6Ci5DD9D5yC72RX+mjdxOdl8FXZT/6RTjt6djpiV5OdgHhcVs9ig4CNM?=
 =?us-ascii?Q?dUqbkbB3gLvWaPYzBvt603SoAsNlHJzJR/KpMB17xX4fpgHWvhQ7rL4NX0Nx?=
 =?us-ascii?Q?hu/d5wUgyWVT0dmqWphaZEKoYQBsqW+7YzRvchO03trYi/QVB8jfm3BHTK2q?=
 =?us-ascii?Q?fTHCfg9oAWVQoMuZvxdc910mJD4afgxFV/nchjKWF9EfnxQZM+tbuNY6wjBB?=
 =?us-ascii?Q?7+xi38wQSBcNG7WayX+9zcGRWGxids1XADlxKQT8sFuEAEpY7DL3lyAQaDCA?=
 =?us-ascii?Q?kN7hIoviIbJitfmjhQNf4BzzajX7fqVYiAlmOng42Q+4xM5Lb6rLOE+l5hEU?=
 =?us-ascii?Q?/QHkE8secCIr5FfafTlZVwOkHyEhJebQSOHBrVUkpw0hH++Rzz/JBvo0nqC3?=
 =?us-ascii?Q?+MJ1XDoPF0iUBnPSHMV/NRrDSUdmb7vpLD5H2s21dnvIhwZLCsq5nzfHHuXk?=
 =?us-ascii?Q?pno+d5PCj5rP4yYGO9pKEEMRxfX75dxNC5gg0Uq69VYb57lxSKh4MI0GvqcZ?=
 =?us-ascii?Q?fiEixOauiSvD/RhdEJSnW8UN2gRY+oq98J8CQgbIJAEbiWUzZ1HdbEZ9pIaR?=
 =?us-ascii?Q?fjsPoFeA2YHwGrf5xARsB1DLsHmtrxudiGvht829B65DYptpMSNkykn/HBr7?=
 =?us-ascii?Q?h3CipNJYPVhfxSPOVwhniqpfNZcRXCHx1hPLK6FkLzT3fU+oDS1ATGnhawvu?=
 =?us-ascii?Q?/NyQTQz+4AVKFQymV3nFjGl3hVFwRDluX6P5PW19beGHAavnOlqEs9xaskwG?=
 =?us-ascii?Q?W8kmAjKvrDux40HYqt2gO4waZH+DWmo88KwAfkFjIZsi5nO9F9IcLclSIZ3I?=
 =?us-ascii?Q?f56gnVkF1fR4Od/Pb17Cz5/XZp1VJ/fcqVr/fahVpUF18tc8mrqZS8Yr5UeO?=
 =?us-ascii?Q?Xa10zRdM9mPJ1yV+O3UZ07q5ZauD7hRpm9nff4xNoqqSRMTc6jFgUpkUFN03?=
 =?us-ascii?Q?1N4Tth8eY/fRy0IItSj05IokvBZ93V3pIBdbutW8cubkVx6MBfTGuDqn++aG?=
 =?us-ascii?Q?wj48YxX4mClKJ3dulG1M/rwXzccOlvdWt8LAN4Ob1lyI8sEc5kILuZ0WrWeD?=
 =?us-ascii?Q?Glbnu906mx3V33H9WR/YJ+i7Ls5SlyK47jeLBFb1opA7MQ/vQorG9Ezx1tXO?=
 =?us-ascii?Q?Zhfe0sHFDOAaijH8q3KDfI8z+cnahe8f9ife26Ke?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2591c1-459f-4e6a-1845-08dc5ddb48f1
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 06:05:58.5259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcIW2CA0i8TQU+GEfQVb4+ne3PUw6kSYbUfbDB9nw9Qo87GTQ9S951ERxSHWTpv+Tvm2ZB9zIOHmIN1NbAhHSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4612
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6bd343537461b57f3efe5dfc5fc193a232dfef1e
commit: 2aa0cff26ed53bc8d4855292b501759435ffdd38 [2092/6266] selftest: af_unix: Test GC for SCM_RIGHTS.
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202404160354.YBvIGPEM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from scm_rights.c:13:
   ./../../kselftest_harness.h:1205:30: warning: format string is empty [-Wformat-zero-length]
    1205 |                               diagnostic ? "%s" : "", diagnostic);
         |                                                   ^~
>> scm_rights.c:203:18: warning: field 'cmsghdr' with variable sized type 'struct cmsghdr' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
     203 |                 struct cmsghdr cmsghdr;
         |                                ^
   2 warnings generated.


vim +203 tools/testing/selftests/net/af_unix/scm_rights.c

2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  194  
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  195  void __send_fd(struct __test_metadata *_metadata,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  196  	       const FIXTURE_DATA(scm_rights) *self,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  197  	       const FIXTURE_VARIANT(scm_rights) *variant,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  198  	       int inflight, int receiver)
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  199  {
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  200  #define MSG "nop"
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  201  #define MSGLEN 3
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  202  	struct {
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25 @203  		struct cmsghdr cmsghdr;
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  204  		int fd[2];
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  205  	} cmsg = {
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  206  		.cmsghdr = {
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  207  			.cmsg_len = CMSG_LEN(sizeof(cmsg.fd)),
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  208  			.cmsg_level = SOL_SOCKET,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  209  			.cmsg_type = SCM_RIGHTS,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  210  		},
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  211  		.fd = {
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  212  			self->fd[inflight * 2],
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  213  			self->fd[inflight * 2],
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  214  		},
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  215  	};
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  216  	struct iovec iov = {
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  217  		.iov_base = MSG,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  218  		.iov_len = MSGLEN,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  219  	};
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  220  	struct msghdr msg = {
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  221  		.msg_name = NULL,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  222  		.msg_namelen = 0,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  223  		.msg_iov = &iov,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  224  		.msg_iovlen = 1,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  225  		.msg_control = &cmsg,
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  226  		.msg_controllen = CMSG_SPACE(sizeof(cmsg.fd)),
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  227  	};
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  228  	int ret;
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  229  
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  230  	ret = sendmsg(self->fd[receiver * 2 + 1], &msg, variant->flags);
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  231  	ASSERT_EQ(MSGLEN, ret);
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  232  }
2aa0cff26ed53b Kuniyuki Iwashima 2024-03-25  233  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

