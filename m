Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8422F8F44
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 01:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707096789; cv=fail; b=W1xrmQbIxky8nOOx5BA7s0dSy/qGnkClBvDMMwQnPj2QDDUPXvScEk3MlNukKnGJvRBrOfUPwe0Sjj2lvN4bj02FeDfLb+kqrsh3gWjsLitCMWOlqizPbTKy/ZsN47hi71mtCZpz+3HkTVhnogmBSdoeOHWKV5BBdwIjN/NJfBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707096789; c=relaxed/simple;
	bh=qVyR15urpcUH2XXkTdC1xuq4uScTGew7WJ7+0xqpCV8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=AXzAiFX6obOZTcYY7nV+k+Uc9r+k17p/Q3w9eMdsAPsfaEAAMBYtEQOx028sBsgc55m+jMyoGhTDmRzRNGtFnZVqRsMbbOpQhSspPLx7ZARxLc+1cLjOYWC60aNB5VXFomdAdLQ7NzDrWwAd9DpmB4/L3Pa/pHTyb8IEiHFT104=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iZ81J1Yf; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iZ81J1Yf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707096788; x=1738632788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qVyR15urpcUH2XXkTdC1xuq4uScTGew7WJ7+0xqpCV8=;
  b=iZ81J1YfKfvK1jY8H0HapX9JuFlYRynEp79qBWn/5De7TdZhHt/VI4nQ
   4CEn8k5YkbQkCZt+6Rml7bLAHLrdh4YCObJ1srkjZYS2ougHjeVIoaoLl
   XcDs2qxmdyq2ksdXlIG7zv1lScyEDhcg2Z57jzZRrqNRhohb1zPkTWiCN
   X59RJ40wmvVlMY0zqaG25mQJui8fZttq2ktnXqMK9no5Bj6sdq0lYw5+f
   B+XhBq7kUv1Zf3BMkb0xGJF5GZbJXPdipby8Juarw4/ez8WSLK5N+ahYk
   V4gNrY6jnAbliJfEumf0bP5LP2uNS9rggBHxq4evB555CxlZCT9K6RIvQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="342038"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="342038"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 17:33:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="933012797"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="933012797"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Feb 2024 17:33:06 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 17:33:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 17:33:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 4 Feb 2024 17:33:05 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 4 Feb 2024 17:33:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OeL0UCmgl+YrF7bxZg5UaV8AnHLdEI1jC7EDOqqNrixnHt0BYtYp3KApDg6MsF7OkGFqQtt3Ezc8Gp6LA0cmV4WT1cCtLqG30pQuwIXZkBAdziVjbLJXVr0dEniuIB14OqJYPfdNNzBnFaIlPuPJpak7FIelqTXR89QMlQ7Rm8H8JQJdGRnX1dc0rTsQqRuOmHlxJcMp2GC4vwAGlLIfrR3oAosLPvRIiIdyI8QOqZXR0JSHAmtzrzaza5HMCYdQPAfrOlu+quQjoK2rFfMTOCRDTwuUFm4U5LtwuUOADFJbpjNln6W7u9pFpMP/dSg5elZGJth3aPoR2XTxNm61ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U6ggXznGEnag7V0C9X5RmxwSXo/JkXPHLUXyt+lv14=;
 b=blJXDv2WF+qEhqNGUDRKYgUk5TVV767NeVmQ4QhfYWP8gQEqy9lX8lPh8u0xlS4IaytXKIynh2XKWuDubRASdPzQgj0Wx8hDRBIKZwwr8Y88z6QTTBAmgfjV9hz2E3gWbpne/8cepJ2aEtrha3avPe8PLzlMGXQ3al/YhzHbpCv+bd/HnE+xOb1GINN1dJMFtUDYtHdOfj3r4K681vC2MoXmc8SadCG4VheYuMa90sW5qXtP0xbydx0IEZNWEEALKZLvgVP9cGCbOeTR7Zq6PRCA3Ed/cUhzh5x9vfEDSrUFVfxnPel38S67CiDxfZek70e+iUWx1Fzj2zgoJ+hsVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB7261.namprd11.prod.outlook.com (2603:10b6:8:13d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 01:33:03 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 01:33:03 +0000
Date: Mon, 5 Feb 2024 09:26:04 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [frank-w-bpi-r2-4.14:5.4-main 2083/26476]
 utils/cryptodev/cryptodev-linux/lib/benchmark.h: sys/time.h is included more
 than once.
Message-ID: <202402031827.xqMghzoI-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR03CA0092.apcprd03.prod.outlook.com
 (2603:1096:4:7c::20) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DS0PR11MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b628c34-ae11-470a-1968-08dc25ea65ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sxUht0uopRppNHLMetE6Y3S2FtXiE3paXYEB9i5GeuHqEM01TxSoT8FmlKrfkM7h02v9kE5uaUWRAJMUwCC8A/8HPshvsQiZ0IMw1MxI5i696mhs/erXORV27SgNqjGPXguI6J47Nd8u7FcV8WXMp01fq//ALWlBhaWaTx2fVN96JyCP/v84jDUEsylDAtR3j0vbFs5HN1lY8enVu0qkEyJIjTTKV7Rb6DuxYSj33nG94PiU5UKhWtzV8TqAkAEmYIoZcqDNtXl9uzPLSH5YlXY2BcB+VgKVWmcI7rG/7VddXxjtkIdekjIaNTbwP/Vpx4Ntu00bwkjcTcmH1XXrwR1ERkM3yY2hdqHy0IesdeE0l7TTa/AedCJnddOVxW7qIQKuAd93NdQK9YK4bSWMdrVbGVpnxKBdhz2IqWQ5at7Fq0C58ekc/qoIyAc5qWNAuQmKVM/Pj1hTf+D6dyndAEUKGCFr0/jUJBU+flUHNRBf7FLA0SKDqE3Kh3TRWO5KBdXeWn9sSf0/k8lF8Kg8s8PQFBEOHXR5Q64SAPkJAMLJpoYrtqMMOIK72liM8E3e6ZKjNOmyehW/8txSt4r5kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(39860400002)(136003)(230273577357003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(41300700001)(66556008)(66476007)(66946007)(36756003)(6916009)(316002)(5660300002)(4744005)(2906002)(4326008)(8676002)(8936002)(83380400001)(38100700002)(82960400001)(6506007)(6512007)(478600001)(966005)(6486002)(26005)(1076003)(2616005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/eDJnoSDkiXR+YJO/SGJyxJAfuB6CELF4yIzCuTRh/Finf5Hu1jgemrshWJd?=
 =?us-ascii?Q?g1fnVv8zaFkAmTnnJ7ffCQTaqynk1vjZDgeSzo+DPTixKx7vkdOnHgrOmjqC?=
 =?us-ascii?Q?ZE5l7AHFCdRP34O8pkEp6LTWJb2N8BBSCzw1ewWOfb/iPKGamqZekYMSLloE?=
 =?us-ascii?Q?BVQctQ/+nNvAoBUAaEjH8lSalH2f3T2kMyXGtaRVE2jxrv8gAqzL4e89FaLv?=
 =?us-ascii?Q?FBdQw50+3TUI01CrMEAhqraQ1YbsITEt5hw0/81NS23X6G3Ef8FKPpC2xOk9?=
 =?us-ascii?Q?qwNHcHkb6f+edZ/P7qnioubrTeicmWndAjwfvZJUOW6qFQYWDXkN+hfdjney?=
 =?us-ascii?Q?JWwuGvAG6ILO2jxfZHSUdQFjF+2HUhauL5Z7HNUZpfcBZ1NOLLCEAL/bgYYU?=
 =?us-ascii?Q?c5VSZKm6IjLwirukMqRaB9IY66XHsdKu69WheWMnikp+urvX0ow8nAQJqUMU?=
 =?us-ascii?Q?mYqvWwKaC3Lf+cI9L5cqrJ0KCeaXgjna7adzPZgau+0zjIhP+Drx3SO+V9GR?=
 =?us-ascii?Q?HJW3EV1fVWsc/FUkz8G4DHjGC8MTcTZJBMnSq2fNJXAWHKvFJ/119CcuWSHm?=
 =?us-ascii?Q?E4gKOGn2iBDP6XQYli0sfT6zQr1pNguO8naCg0UlcpfCxdB8VkFuCsdrC103?=
 =?us-ascii?Q?KdggcmcRLCh2fk1tGW1cU5UE/NcOou8tjlAEM1QZQ/KrI/fPT5BHRRmee7hD?=
 =?us-ascii?Q?th+e6grPs9/omWC7Wt2o1TGUBE7YrU2s9XE3Cz2pcYMXx9xZ5hwdhKhPq9We?=
 =?us-ascii?Q?04wA2esZKqc9bMSNACt2c+OFBOI9XFD+2pQHFL6RnWDZqPi+/I2II9Cyt+6x?=
 =?us-ascii?Q?4BXMcl8E7z82j/48DE12E17/gH39046IxTgB5SINQD+J/LOdQ5U14a/dXOdG?=
 =?us-ascii?Q?m0CVf/kbpNoak1L6LweGk5fRaTJCDYYQj5FZ4L7zNCRoxDGyYFiZPoqDYGZj?=
 =?us-ascii?Q?MYbUjPprv0nZM+gNXDoZRmneFULZmgbu9vXiCRQ8/Ue9D/YwJsyqdrPPjB2z?=
 =?us-ascii?Q?FRAcXUXhYJc6aGF8a6ThHFySfSDeOQP19Gd447YNk+8DDJNpuhwRT99fCo6j?=
 =?us-ascii?Q?35ty9mFGHQK8+WSaypBRhD8cP7RldmEZP49WX2jMWYp/qkXNKYslc096WyYy?=
 =?us-ascii?Q?P/aU+oSDaxiTUhB3LSY7zFKeSGPY3q8Agy1HggtlLk+CthhtFnWnAeI3JfXo?=
 =?us-ascii?Q?PQgMMIM65Kv04k09HMpN5GTs53fCoI070eJ+eMDRwq8X2lQUl9hrNjka6q33?=
 =?us-ascii?Q?zdwC2pqf3FpyU23heYzDQceE0jQrQSpYIgYLdegBCN4j2doLfTMfSPPF6Mzk?=
 =?us-ascii?Q?tHLNnDDod1RrxaCsAsYHvlA+c4JQGPDhFQ0KjpeaOtkQASj4VwMf37qW89Dc?=
 =?us-ascii?Q?oMwVGO6JaWcSe7ZnrcRAl6ykCAyC+SPR7NtjFNXqAfefrctrETMR2MA9oPDR?=
 =?us-ascii?Q?F6wzRLzWo5tcD8JBWqR1v9hq2sxqdhd2x2gzh2c3py8GrxhaPLF4XM0Q2XOc?=
 =?us-ascii?Q?3Abq/XvqAgVTHIZ/uxS91HvtfTvcIflM5Ihb+hNUzuF395TrskTyMW4nBkBu?=
 =?us-ascii?Q?k6q523vEcCKzqOU97MyxnjzwyT9EQfCDwAH8vGW3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b628c34-ae11-470a-1968-08dc25ea65ad
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 01:33:03.9017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wd2bUQrbSbO3F/iGnxuJehO5WxnMLrEIE0Xtr8UGFqAJ1PUk0A+hWA70gKpTpJ45UkL2g/bhUSKyZhAPp4duOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7261
X-OriginatorOrg: intel.com

tree:   https://github.com/frank-w/BPI-R2-4.14 5.4-main
head:   645dca86a686ddae272b209432af075ecc0185c5
commit: c3b89e4625bb76475e992292ee89d37d48a0e748 [2083/26476] utils: add cryptodev 1.10
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202402031827.xqMghzoI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> utils/cryptodev/cryptodev-linux/lib/benchmark.h: sys/time.h is included more than once.

vim +1 utils/cryptodev/cryptodev-linux/lib/benchmark.h

   > 1	#include <sys/time.h>
     2	#include <time.h>
   > 3	#include <sys/time.h>
     4	#include <signal.h>
     5	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

