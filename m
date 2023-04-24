Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BE27C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Apr 2023 02:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682302843; x=1713838843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iJ/ZW5V2EnuzafxNNSPA78Lw9gM+RQK/LQmTsq0/6LI=;
  b=D4k6Gbx13hB4Rm+nEHPRvdccWByDfoEQeC12P0svW7IR4QW4Wq9r3Gja
   lpEIAKKpNbOkHuEd/8QGnQNqMZnPmhD9ludH3YY8jrXhGeo3ThgwSFvWn
   H8rZopAPfjPv+vS0jJToNLoHlcFzq60YKRPzHVKbioC9gVN9xlcLRX5yG
   XSk0AhgS/jnwDZ4boNlA7XPP0LyoYqxYp7AsfaxZPmZp9viV4Wwxnqc5s
   Iqtk+Zuz0DXm1W+kHNIGFZ7OJuIJXz6TptHXvyHVpoX+96frwtok4M77T
   T0v9jwCle6CuqM4dLZ4m/OiN8ERgdtxLc89zYrZauvjM4UmnLl8tPrJkt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="345100027"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="345100027"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 19:20:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="817084696"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="817084696"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga004.jf.intel.com with ESMTP; 23 Apr 2023 19:20:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 19:20:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 23 Apr 2023 19:20:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 23 Apr 2023 19:20:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEE9GFmcxRPTbBua0VbYvGX1eKd+sFlyhjvbeWtMNiyelRDpd0cgvhIuEWFC8oBKL8kPuZkjkOr8QlEpgRpp8vUzpWnF3V19jIKqNohwFT8ViXr2irGkvZK1qfH1v1nfCUPlxoQIqRVTW6J0/dhCg8RR+++NlMfZ8jasW4XvtiqYAdf7n+ewNHj5liSSjv4rQsK1KWcDHgQ55sLGwabl+OW+oNAsqpe//XKGYZ5VZy7cod3xT0YocIrW39/gWd+zNxwnkP3608t2zxeF9iBF50GTCpjZFyRVlaqEUDHWhxco6lJzURqcz5nbnhRz8YJLQ9B6CWEtiH8hoBb4R3xpgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hj0g3gjQTmlq65Wnwrj4Xj1xNvWs0Rho+jOuHw51qu0=;
 b=AQUptf+DsPdAtySkO7H7HFinw4NrB9Aw1HL8pn4C7zV9U4uFL2usSCxetPX0aZX84dRyKL6/7CrSzHAUskGOjIomrmYdyALNPg93D9anTEDs9auelEgwRq1MFMOCxkR7r7e64l8lQfs+icP9c2F8DalEiN2V/HzOJsngPHKB9F/9pHG19nuZtct4d6q8bmqHMCkR39LVnWgURsrPN+dZKM0khC6NPTlRRNlNfZGX4jHf0Sd4amMsqszCRivSJyxsaX+ZpgotUMpChZNPV8gFmHLkKFDmOCk6i3lDiGoQnqZ1SmPjyBQtr8SjTmjOPGGz/3b3dP2amgobAEgwAw2sRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:20:38 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 02:20:38 +0000
Date: Mon, 24 Apr 2023 10:17:36 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, Yu Zhang <yu.c.zhang@linux.intel.com>,
	Chao Peng <chao.p.peng@linux.intel.com>
Subject: [sean-jc:x86/kvm_gmem_solo 18/31] virt/kvm/guest_mem.c:
 linux/pagemap.h is included more than once.
Message-ID: <202304230856.M38fCNxk-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2P153CA0009.APCP153.PROD.OUTLOOK.COM (2603:1096::19) To
 CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MW3PR11MB4764:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a3d56b-93ce-48e9-68c5-08db446a7ea6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: acdDfmGJOdEhW9i30b5qeZO3vqFgJ+ie+wj3SMEGt532vC66vzi+NpJLKKGtLR+NLN65HstNl1b60tJogMphBvj2/aCPuN+RqeAA1a5b7wUVauXrmKkt/HkvMqpy3jNjibsEFOrNaAm6vu3HO5NtOBDjlr/yj26WkdXwKHYRRUeWT14Dpo/POmersdmWgzrQsDmH8AhhW+5TvJewsvNRQD1KrD0oosPDon6s99D51266OTUvyjoZIeHC/H2HkxnzNBXWRETTHR82j+6xm/nDNIuerM/P84r/gu4IyXlSbryi3kvrXVn5JCMKvI1BPbfY/qomjRRozHFjYCHotk3oy+fiNhW8WfSYTjrbTyOdvw1wPNesS9QAf/JMW/UQLdB9fbpAivTtAf6fkcWMbRbf+2e/qzsqZfgyU8o+Kl2vg6eMhcpbK8uPKVLxB3hLRLtTyg8V2++7xRsfPdPwVbzXf7/GvQY43EL9E5vlPm60MqBCcOvqMViYtQQmLislfDGpLBWLHzYM+z9lybWdY7RCpCU0xEtUpPWkDixtQ5ymbfGROL+bVBgz+FJLouPlKjOovnSx0Q4+er81e5MOT49hHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(966005)(6506007)(1076003)(26005)(6512007)(2616005)(36756003)(83380400001)(186003)(82960400001)(38100700002)(66946007)(478600001)(86362001)(6916009)(66556008)(66476007)(8936002)(8676002)(54906003)(5660300002)(6486002)(41300700001)(2906002)(4326008)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XHAK8MIgYQtlWOfaNjON0EAXSsYyEHPmt2xzzIxe71XERGTJQabCDQLh8jP/?=
 =?us-ascii?Q?Li6Zt4m4PNCgkKWQl+kUcsayJuKP9nbQB3k4mjqDu4z+YzOq/onM6wfyJjbt?=
 =?us-ascii?Q?y09xc5jpU0yYgTdp3kxWV2idj+/npDw/8yQV9VjRZW2B4Rh9djGrFPnDOqN4?=
 =?us-ascii?Q?MvNt73nTQNU+aZ1dcRByTSA3odROOYAtGYSd+Uu0z7IvtZuLAwXRmJYA93mM?=
 =?us-ascii?Q?PBi5U4XxAYl+7P1rPaxOWjQ1R5X1dgzb/Tp/RsFuDiJWhxB8Tot76GvNs3Oq?=
 =?us-ascii?Q?gSKrGRFs9ry/05R+7r2zYamqaKDyrJmrJscbiO+E5gcpIBvj2D6REBDfZBqW?=
 =?us-ascii?Q?ynDn1XnrkstE9F8UaIXudX1vfj1GI8FxmPogZoK3jRb+wLmofeQSUYLy1B4k?=
 =?us-ascii?Q?VvXk+8ziGbId2JZKstvOgIihisIfPKF2KUNttQCMBlrYujTOGu/qddh4sENz?=
 =?us-ascii?Q?hbRd7xCSlqb+OLY04lC6ltR6TcbM7u8k0sbQdZ8SdVB/B2/MPpOZq4pNPT2Y?=
 =?us-ascii?Q?AjMGtn10fN/z87d8UmHm50cgFdm6DjC4zR2QP2yQukcMeJi8hP6AMPiuGVes?=
 =?us-ascii?Q?h4C7ti79HTJstM+Bx9Dy2VL2wufvcYQLy2md2IqV4NSo9BMW0Xr/Fe6ek9zW?=
 =?us-ascii?Q?t30P77E36RlX5DhaqTyliRQCRxsmaCu+SqjH8r+wHlPNX8/s/WZzj2CX6cdg?=
 =?us-ascii?Q?DoEpRNM7HdtC2U7hAnMgOkksfVIr52PuDtG74jkI5KOWwoVWNxt4Ry2NGJB8?=
 =?us-ascii?Q?dqgu3tT9nsYpqkU3YlwrEbY/phhMVZ6HDREXAdKNUHqzinuFBMEDFNZAisLp?=
 =?us-ascii?Q?nB3m1gaGh/e9wYzJl4CZIkibPIc7cfqp/ddaxDXb+Eomi30AEaxM9Wh83sFH?=
 =?us-ascii?Q?JTWrb2SV/K0Nx52VZZathsHwI6EQTgN9EYAg8hkY6r1MlxvPFvThfEPlpmSi?=
 =?us-ascii?Q?Jfgs/QvDHXIW/5MGI5T8ylQXwLe3Ywf89eWBltFLOPonrWeCvbY2ow1dHKp8?=
 =?us-ascii?Q?Mc6XODc5jbP+xHlp3lpCZBwGMwJ3bVi3PDbFuQykxv6tvG7YEBRlxOexbLVb?=
 =?us-ascii?Q?HyyRE49kYU0j6ril37m2jj+F/vBQK+7ahuXdwO3HSGb7stOjxY7vlcdsgh8V?=
 =?us-ascii?Q?o4ZbaVq4p3LpvgwfxgAmBx6GojjE8W2sftJM85nCdQ8DLcMFbsibBrdc4H82?=
 =?us-ascii?Q?5crwf2GxfXIXW2aDoj94G1Uq0cT9IW7niSGB0MB0KkVf3rrUtnB4Bki7BlEl?=
 =?us-ascii?Q?MCrLW9m3OHXp/JEMeSVxu7TfUa8L2FKaMn3Oq34eOyHrhIoZVk0QRX6kVEib?=
 =?us-ascii?Q?8S/IL2wKvZM/QlX1gy81hDRRJeLXYvedN0tVrmLCvsxmq4vAcD4qDLs91LO/?=
 =?us-ascii?Q?XJG6Mmw9D3QYx1nXu3ZAHO98AcBY4EWC1xIYqqgdpA2rROkJxmE0j3J+81fi?=
 =?us-ascii?Q?YeiZNKwRIdpQMR4/ZQV7WCXAiQaRVRfa1JPJjfR8cHPTiy8jk4Q62MkXNJtC?=
 =?us-ascii?Q?n/SQAqq2EKJcbzobC/pk3UtqMhEAAHTb41K6OpS9A/HTy6zAWLiUiqheZ/I3?=
 =?us-ascii?Q?ZSTrze+UcuKiossyfdX8JO3njuGbXxLtuRXriEPc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a3d56b-93ce-48e9-68c5-08db446a7ea6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:20:38.7396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pr45CzQ8orBqT3OO+nnQ9bmpSFLBda+wZqsf2cDwyUhCw5yCSIGtJmXrNPR+DkoksabdTudtejIoqE9DukoTnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764
X-OriginatorOrg: intel.com

tree:   https://github.com/sean-jc/linux x86/kvm_gmem_solo
head:   7c98330658cf3711469536c8381120158bdc89d7
commit: 6bbc66eb07de8ee71e1eb038e496673ca160d378 [18/31] KVM: Introduced ioctl() to allocate dedicated memory for guests
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/r/202304230856.M38fCNxk-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> virt/kvm/guest_mem.c: linux/pagemap.h is included more than once.

286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700   1) // SPDX-License-Identifier: GPL-2.0
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700   2) #include <linux/backing-dev.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700   3) #include <linux/falloc.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700   4) #include <linux/kvm_host.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700 @ 5) #include <linux/pagemap.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700   6) #include <linux/sbitmap.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700   7) 
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700   8) 
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700   9) #include <linux/mm.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700  10) #include <linux/fs.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700  11) #include <linux/swap.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700  12) #include <linux/mount.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700  13) #include <linux/memfd.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700  14) #include <linux/bitops.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700  15) #include <linux/printk.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700 @16) #include <linux/pagemap.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700  17) #include <linux/syscalls.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700  18) #include <linux/pseudo_fs.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700  19) #include <linux/secretmem.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700  20) #include <linux/set_memory.h>
286a947329fa9 (Sean Christopherson 2023-04-18 09:29:29 -0700  21) #include <linux/sched/signal.h>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

