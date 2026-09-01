Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ECB28C2A1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Sep 2026 01:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226881; cv=fail; b=Y1gmsMgdH9ITOEo0W/tU5Wr6v06/KxOKb8Ho7QFvslNmmce5HJp9nyPj+JZiEel8771IyYkFfh3pViRUu/1TE4wsbzR7jeJ9nHJgtP4hC/azoj4RlMdfj7OYaadlFdNn7+9jshNIaaMCpGz/9CrQSHkUmd149EnLEUBh5hDz4ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226881; c=relaxed/simple;
	bh=ft4s6zGw4tQLZfneGWSXW7mtQxIUyuKBpc0gg87TNMw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GYynxVUM69qJYNLR9wQNC08Rz1u31GccX3VPDjVkg8oKH/A8gseKaJg81zBL1xUUFtrMYihBO7+DT/DhYKn45AWS9MER0U6x5RoDB7tpjVSlmo0IYgYDCG8ZQy3DXaqgLwtytnnYyUpsjXYphC3Y9Umu6XGK2DZ66gApEMZaDVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lu+VV+Kq; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lu+VV+Kq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788226880; x=1819762880;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ft4s6zGw4tQLZfneGWSXW7mtQxIUyuKBpc0gg87TNMw=;
  b=lu+VV+Kq5xrBfvtr0ZOf06r7e/GqPP2QiRMyzlVdjQ/jtaDmogHaQe6f
   trRMoxnYeo9gqGz6AcGvCclMmD+WBkj+6qMDokgqQ5e0t1GOvCaDBbpAP
   MAiMmArIaIhiCyRi/DFLppwRlXNifusk4bOzaYuwP3D69SDor3+RlYKam
   pLxarkc/x8mS52IBVIvY9z+RH8NGuHKPeBZWAwhb1Y4ODUW79+PGgbJDU
   jiTeCIOOmDWBzExDx+vI/j78YYvAQYcJJAHA/NpjlXJc9VOZvG/f806e/
   vnc+KQLsNlU0DC31tCPHgAigVzmdNNeEqSkUHgwQs6eZpmMqua8ZweXfi
   g==;
X-CSE-ConnectionGUID: GSsZdelaTQmEfrlEFwy7GQ==
X-CSE-MsgGUID: p6zCKu/mSQaxhVQ2Gus+eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="98981060"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="98981060"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 18:41:15 -0700
X-CSE-ConnectionGUID: FqZZKfKJR/yjQoZtPRtcEA==
X-CSE-MsgGUID: kiZY2AAXSQ+lBbGzI7lOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; 
   d="scan'208";a="267145786"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 18:41:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 18:41:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 18:41:14 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 18:41:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7AT22BtJbI1Ch102qX9gM4gSa+/RF5/ncPQcEqNwH30F+sTOdt9WYFGU/HeTHBJRk1cQ/EJP1T6sx3Pd/JLkG5y5/vFRqqMlhWdwaGDf7gEcpYtEFKUcS7alijqv1qni127BuNrMMcq7C1F7U2ra29J8xBo/E8fTqT4Wqfu5dicc3diAlcebTvNm2Zr0Kdz41pMOj0tPAKXAIms7yqQYNsvM2GMaVd4k8S6cXOP8JRljMpXJyXPtPIq9nv4N9gTALOL60hbL2YQ/N78VOHJEqrntbXBZ3xSRdykOvD1pSW71ef4r30BQFUSRsn3KWeBjPMRW6kYzkg+1g++VKlHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JLjXPnhhUO56jmXqcfXKXsHz66J9fbQqBUUC0Pw6Js=;
 b=DFO+JlletBY3b3/C6qcabxGkq1rws/vZqjHverKPsN9fO9nUwK21tOkSoSCzHm7QwU/OpU6YzdtmAt3nQdISAbnQ67x3+JPKJu1Qr6YYyC8G66pTOZ+VgTM1jOD/fB9TxtVcY8yiqn/bizNTHZgVgt551rgV8OFpZgBDEIgMWfxMcYXNOSNMTq5vbTrOWq6o5G2EOpoJaot9etIPt7/6lBR+BXKdcKssIuyT22x1Sx8PsaU53h+Lorji0ozZbcgkW3blFVuMHyVzs36x0MF5MqiMIL0tl3D8+uMby2CbDOLFtFIK0TfMgXs28EB3//u5xmXLAV07PMFCIvpkinU5+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e) by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 01:41:12 +0000
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae]) by PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae%6]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 01:41:12 +0000
Date: Tue, 1 Sep 2026 09:41:05 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android16-6.12 2/2] ../../../mm/vma.c:7:10: fatal
 error: linux/pgsize_migration.h: No such file or directory
Message-ID: <apYtMds9tB70Didc@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0037.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:4::9)
 To PH3PPF4E874A00C.namprd11.prod.outlook.com (2603:10b6:518:1::d1e)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF4E874A00C:EE_|SJ5PPF57F27BA08:EE_
X-MS-Office365-Filtering-Correlation-Id: a538b6e8-a51f-4678-561e-08df07ca1a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: vpXhXwypTZae6a5qPw7ZhLVuDmyLfBFLSSvoXj0RnQ+kSn97o1HwRR4LVEPHmvlm6X8Rnwp0dYecjiWJnBwV94J+JLl85ujS+VoN67AIz0Cw1halUCfqQebPIkfSQ8sdXr6mZuFTJNWU84+qYAtq6Vb65o60581wX19jYmB6Kka7i3AaN08qxsXKBzYyHrWnTdWycNOB5aSg7xTx3J1o6JMD6jkwFexqjZBFbO8/SWo+x1RWZGmdewyJgurfj8rGANgWw1kbX4BQh9ne6QnxETqd0Q/MpSD1NkV3pcnUA1qFZRjLRsAXeJUgrfnbYgU5hGymNxHQ8GIvnmkGksBvqSjFs5QZUWj5j8brZlix4PwXEmjXo2jl1Sp81uD6faxEN8Je4BJHOdEt4B9ITzkjjGZL7VpfPJqcCb73AC/RNi/Z2hGWfIFA3HRIRwoYo7FaJA4Y2oUwBUrej4YBA4QwJYEYYsBXgN4bzVbRdRQ4NHCbrFDzTl72sm2EjsKjRYtWjDTsJ3yUkMIUMKnQhQv0egjr3Wygs6fHmnQmcJvqZubF1GR+6h4PXf9lwwledOQpNH/oOEOODQtKAe/rpWgpIJrGiIF14JMGmX/WJB8EGvBmU2bjTiI1Ncx5FKgdLja/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF4E874A00C.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XpN2WbLr56zcqnhO/H6pmbGJWPIycpURUXS72XsxzMwbLz421ZtT8Kqpj3uo?=
 =?us-ascii?Q?GOIOZdseKX6ehPvyKYWjIC6hDJNq+MVL7hQTd4NJnrUXiw5v2rfVXwXbPAUx?=
 =?us-ascii?Q?TanKgehWAsascyX0quJPlsEYrJumnmUwNBOWFyAwgUxmTTiyMtNQ4SxPT1S9?=
 =?us-ascii?Q?ZEFWDHwbdE+0samJ4Mpv0Nqul/LzUnbGBB8jKY7zhZaLbxpCMzO+1APOzjvp?=
 =?us-ascii?Q?NfUW6nwheN/XM28m0zj3sa3lF2izakV6+wrRP8rGfFTyBtL+N6LujfRm6oB4?=
 =?us-ascii?Q?JeFnnccSszetEJ0LmPczcQ4ubdSqvCExFHKQBQT4zkgRXZfDN+6a8PGYmYdt?=
 =?us-ascii?Q?GdbudO4sdgztVFlL4fGO7ny6+hTDmkEQf5790qlwVxDsrPMgVvfGx5F66A4I?=
 =?us-ascii?Q?feZC/H8zu6G1rHb5lihYV3y7LBfsl8XvuIYLYwxYAddjnHzGDCnQItwAR6H2?=
 =?us-ascii?Q?25os6Gt7dGw5NKwMi5ANfluuxlur0wNj08VqQmoiBeKvtG42j1/oWzNEdaKh?=
 =?us-ascii?Q?3RGpg/ZkFwV9E33s3qqG4o+BN7ELLdCq6lXQNc336YqP4rANIHzgKcggEkYc?=
 =?us-ascii?Q?HpSprjsyKaxUEV3HgVqHeYsHsQ8kdXG5IJDZUwv1wOEdLH6JrLfjIm9BVoD0?=
 =?us-ascii?Q?GK5UxmjFxx6LUuykzm44KsI+hKCH3TbnQclCWoaLNxgiZTt0hYlOZyNm9SvH?=
 =?us-ascii?Q?ccd8sMj9EB3vJFcYpsOWWY507p5gH77+F2adYHdqifiT5kFgVvJ/yMKU/jaw?=
 =?us-ascii?Q?iMC7tIG4FgomYpSj56cx/fdmGSoEQuP80DFDdrEgGhmmvj0zYkYllJTg7dOl?=
 =?us-ascii?Q?Cf4/LV2VlIydgpxhBiuykoCKAu2QqX3dy52o85XWVlIIUodByO9FJ6xTtHHZ?=
 =?us-ascii?Q?Tl7f8mK58uvgW8ejtAKLZUPUUJvQhg3X+HYLmi/7SqvcByTPWHK+5Bl4nwp2?=
 =?us-ascii?Q?JfWD29h7d3QDmkJfM3v4AFDzwvNb0GHtPHtr18MblUgIi+TPuFnPHqZTlXB4?=
 =?us-ascii?Q?AQ4SIRxPajyBxE+ZkvbXflHWBbxXXOAtancA1B08dtYp4STbnbP0Nk4sCqLM?=
 =?us-ascii?Q?TjqX60L+ymEzbdQFkYdGC5Y1X2B6J6r+THyR5BK69NAUw0p8lRLKy2RcHia0?=
 =?us-ascii?Q?d2qQGD3AABnz7xJBOQUu3wD/yQA+E5YtKchW19iMmRovjr9k9x6OcCE6SYa3?=
 =?us-ascii?Q?tGY7Caey4CsRbV3s1JNlTk2IFGvnt5B1d7f6E0KmfItpitUOiNa/oEPfwIvS?=
 =?us-ascii?Q?ou0z2JRRYdWq2c/VTd43zmgmPyiN6NtAewP4jAXFxAfm1eF6Hy11l/Z7EwVn?=
 =?us-ascii?Q?f37JWVNNwy1jG6TgnX7Z5C08Stta8gMK5FDhIJp2iGPy0WUyvvctDECg1Z/j?=
 =?us-ascii?Q?Wc0YYkJ8l96FHShrIqdm5Zjb4NfYWaOJstOJV2ua8C9KSxGIOeqy0y0ip0pN?=
 =?us-ascii?Q?fg6zSnh74AwuyMCWmpAGw3LXsHO47Dxw3eMts3IWgxAmaKJ8gFgnCmJilIM+?=
 =?us-ascii?Q?9dJph9JnDME84jxA0UX9q506d09zgpxLX8mzj+pRnXCZ/yXJZgsauTz6xUOd?=
 =?us-ascii?Q?+SSnCpFGXTDT/ywEx31yZONohpbQ5K0Qh779UNTzCzzpOj6kizbDBaSGlVMG?=
 =?us-ascii?Q?2BwrPiYH3V14FkrfaK+Z8Gow8nqxlD9AA4pNU3RHUqfm8jaKiJNRnVLMT1o/?=
 =?us-ascii?Q?0io0FgqCmtjriOwWJm/u4kaP7yBe0dz3xy4ys1nQK2IiQxD733bSvU8+bdNx?=
 =?us-ascii?Q?tfDv5t55Fg=3D=3D?=
X-Exchange-RoutingPolicyChecked: rrtPEDLlV38MnBbcRSLVl+Uru1PMYG5936cowMnaH3mlqGChY9BupbbtEFF39pqu81mQ8DGbUVc0m8k+owPAefGMRLJsT0DapCkLC6xzyoWx0X00RduVcplO6MMpU8wxJ4fzrwwYwL4ij+UY5AqaXqnHG+h+MPBJPeFAxMZXQpNr8qhpF1OUI0pgNo3moAyR2u7Ktg1qz6DBG17pSYwMbJHpxrwnJDjp6vppBa6hWjipDuPK8tVTOjyzdd0ki/hW3m6aZ6VosmMkxkMbbsEGyDdB71QT4JBrZ7dgUP2sSASOZQt+vGZt1L1VnS8aY4dKv9BoCNcFWO1hL+aJTA4acA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a538b6e8-a51f-4678-561e-08df07ca1a55
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF4E874A00C.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 01:41:12.0355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKKJuW+tQUPtKUNgmo5r+tNby50WBNo5CIb4cIi9KpOJ5AKQDvkO7dOHRrMDUyNtGfGkacgJfvYIG8Tzx82b5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF57F27BA08
X-OriginatorOrg: intel.com

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   be43d38e0381514d69dc00b6537910cc7d26c8c8
commit: 95d0b11a65a39d4f3f25751436a4fde6c1718479 [2/2] ANDROID: 16K: Handle pad VMA splits and merges
:::::: branch date: 4 hours ago
:::::: commit date: 1 year, 4 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260831/202608312343.Ok0Dhixr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608312343.Ok0Dhixr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608312343.Ok0Dhixr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from vma_internal.h:26,
                    from vma.c:8:
   ../../include/linux/mm.h: In function 'virt_to_phys':
   ../../include/linux/mm.h:31:16: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      31 |         return (phys_addr_t)address;
         |                ^
   In file included from vma.c:23:
   ../../../mm/vma.c: At top level:
>> ../../../mm/vma.c:7:10: fatal error: linux/pgsize_migration.h: No such file or directory
       7 | #include <linux/pgsize_migration.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

