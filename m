Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94CDA56
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 02:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLQtaofs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698720818; x=1730256818;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=o5il/NRp9mcbAmZTF9tSEPakPe05H5Ca6J2XZ3NyVWA=;
  b=KLQtaofsu5qgty54NRArmaASGAXpPPre7YUQrKdWQNlvkIiFont779GV
   n3rPEnakXduukLMhOD1LnJMzXNU9sA9flytrvHbpDt6w8LRkz2+UH6mde
   JanndEqfYvG9mjR+5etFbRZaOKo1WSO1w0Ko7Nrc/iSjcRMArZTqF14UP
   wI+9f9xu9R+LunQbbVLTyISoXUPtmzw7ecO1ER2+3D/30k4EerrDHhjjQ
   s/i6n2WFM0M/N0C2VlvkUF3ppKKHNe5HIoXzAf4Lm3GCzfWftgY0eKACj
   hOum/PhscGimLve8RXokeLhkE9N26vvTkfwdS5x5ofb51Nm7Hjv6dv9fh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="419313094"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="419313094"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 19:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="877348325"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="877348325"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Oct 2023 19:53:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 19:53:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 19:53:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 19:53:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 19:53:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghZ7KqkfU+Mwky31bMQpuIilcSieqhxKJgNFk5Iz6DWXoJpvxrXtK5r4gTVCQrHH7hPgzT+ia018nSRIoQEaSIyQcmcEmPM2lo9ABLtc5AROWRvBE3M3eq1H2OEJa5Bs2wil32rgSn0pauV5opgiT+40PuV1/6VGX87WJFQGrzSPI8yxrg8fCCatEJYJx+3YboLE00SjqA7Eq7WdmtI2TtfIZRtT6T2cQZce/omq+2cBdXJzcY5eEOSTs3sNui81wAbm1O7pfj042710pLCijCtUuLN69s85MASua26Gd1xV+Kh3c/r9EscV7ifXn+H+gZgElTkhPXntVRLYl9Ol/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djV8wk2aZG319s8GdKFZrNHTEbhSI1H+oaecE0HMN0s=;
 b=T+Dhv213GNU96N7GE6mQ7ecOFMLdoMtag4XVrwJYeQNM2oSIZeShZEH2FC2VAUAEQ+0ga8EVDLrbLalrcQ1yn1gc+K+gylTEcg+pIwcTwpsD1m2oEnAR8s8100zJPs+w0Wi3u+WJiTjlkIJr+w0VKzii2guR6tFyjiP3/ocKklz3jGz2u4NQz2J8BfysVELIgQ6V0wkxdjOQ6FtWSbdElKySvvRXMEW6dE89l4UsyX26GZEOaOBPL8ZNIaOdr0MecTtqFx8PQyy2mPFea05S+tqIHFPdLX9Hn+XoLZn288L4aaXRRN2BaLxf9KuR4FUw24IkycVNztajCaWlTvKVkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Tue, 31 Oct
 2023 02:53:33 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 02:53:33 +0000
Date: Tue, 31 Oct 2023 10:48:49 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH v2 21/21] ACPI: RISC-V: Create PLIC platform device
Message-ID: <202310311026.2FTakVns-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231025202344.581132-22-sunilvl@ventanamicro.com>
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|IA0PR11MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eac0e1c-d8ec-4325-2158-08dbd9bc9270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RibiQLxjEYGSUlExLZ7S6HaEqledhrlTWFdFFl6jsIe9w41eh+CkRDq3yy9VAALv+GFHsaUsz/wudCiDzO7N+wScEU01KRAEMjMVNt/ZjFW0WxxRZG83IsmzoSrYp2lSJVuBtmCCgj1Vm8IPql8tDUdQ7uHUadNXc1G4ui6pyof0uBBYdi0AwwMKHJ2Cm31yxaEIm8rzdneGAywnlpCzzgMppKos8yfur0CmQCMMeUkaxUIoGcvta7ERBAEhvBMp1mVqlX4IkkA6Io3K64MC5V24AgPqzwYcX6B/mhLN+4S4BRdGD+aWF3hCoIW6A4+oRgBPBY/F7E8RJfMMEqNmCxGgUI42pd7NK7796Dk3sdp6poSnblLqR5LCPbmPK8xB2k5oEwsKHTkXbMD7V/kwzO9zqRNo06k64+DUfC+mpaMnTdZU5/4ABDW5FPEOOf6kpobRrzLt7iCcbuO2qyoaN8OhkUi+rEXPX2fHrx99XqAIQfEKd3rubjg5DIp/Rk2RmMuB1t992HUApkR/Nzc270zWEzs6JeLP5E/3uOIUOKd3TUdwSt34xVnAIaBemjkYhoyD2QQ1woQow6qsnk03Z+JUcV6bp0sV9HrdDrMBwHOe+wPyKb47/O1jwFMTHBUtoPJ7r4knl9T/Arije0tZrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(396003)(376002)(39860400002)(230173577357003)(230273577357003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6666004)(6512007)(83380400001)(966005)(478600001)(6486002)(6506007)(86362001)(36756003)(38100700002)(82960400001)(5660300002)(66556008)(66476007)(66946007)(41300700001)(6916009)(26005)(2616005)(4001150100001)(2906002)(1076003)(4326008)(8676002)(8936002)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fZCyVk1JrJ88e1KtXG7w8hcWBa/d1zU2gFXei8e7EptK+fnh4gFgJRpXGT+C?=
 =?us-ascii?Q?GpjWTvH4FmZI0glLXkCD6jYHCEYuFV3JoDhXWvVhps/zbRUxejHvnPxMPYUw?=
 =?us-ascii?Q?T6D/nbmcdenkeUEujMLDuO3i+OKwjywjMYIB5v7/b8iFkVa2sr8nL2ElGEGo?=
 =?us-ascii?Q?39ydMGi7FgIJRD8vnrRRIT+AsKBffaEBfuapw1kTfYvYcxDBPt+Rur4lIYXg?=
 =?us-ascii?Q?vTwT4bpe30ve2T+PMa7wuQmVNo1aCBBDDCFNW84qXKXqzZC7G9/CTCaOpusq?=
 =?us-ascii?Q?TqGU64dYBdZXBviuADwBE1zCcdFXxmFXG0LQ+xXH4WT359I2eOZtymAtEmnx?=
 =?us-ascii?Q?3TrQI3erV9qFxacmbRBmvBU0N4PW9Tt5H47mFnJZwEREGU2j3eNlDHP5m1ev?=
 =?us-ascii?Q?1OH4vPSan+e1jAdaCzvOj4OuxWhVeQejVQb8K8/lKzjXwE4dygLY2hUbEDuf?=
 =?us-ascii?Q?lv6ujzZZmhRa8KYgYA+lHPowTzYoJ87J8x8UQXJdfFAAJQFPCp1zmaUxpORG?=
 =?us-ascii?Q?av3Ng9e2IcwGY4IAls4H5br825BEYRzAfUVGSPMpomrkagqb3kMevpYLGBaQ?=
 =?us-ascii?Q?wSrADworFv6zL8jjOsoIStj3oCX6iP4Ic2vTnVDJeNElS+FyZlk4gKM0V+i+?=
 =?us-ascii?Q?KaVGG6dPmHH8wfiqtJhgi9YNitBRQBAkHtR7mV+TxO3SVljKxiowPdCPvy2w?=
 =?us-ascii?Q?oSUUQc+bQP9v5JZ5NKEGJo0+kgivO+IJetFi9i0318Q6Sg3jb1hXmffpiuw5?=
 =?us-ascii?Q?lpMuuLN5R9vwxY1IMkAvmEMZlkBuKv5/LBcdHCG0QUFDn+9fDBud7qJyZ1xY?=
 =?us-ascii?Q?RbnV4eOZHvZpD8wwiMpo4NdMnBlU1aMobFzT653/9F6UGL7XwCsROMzlzX4f?=
 =?us-ascii?Q?7158aEyHVkQzYseKKUfPoRJ1+s0zvuolGJ5aNUEg7gwqfhiO0vWW6wHBQdD2?=
 =?us-ascii?Q?XIi1uTmicYT7wM7FANQjdBp+hgZQ+8xYUfSZLpor9dRh6K3YykoAytLc16cB?=
 =?us-ascii?Q?nW8fe/XfYliFiWvm/j068pI/OU9m4KCbY0bPZvz7LJk/hjhGN+ibmbpcn35Z?=
 =?us-ascii?Q?T/NNaNJ8MYQgr7fOYRO8ixXITrmsn4pWSQN6rOlyh0A2bRd/m78K6lxpHPrh?=
 =?us-ascii?Q?3b8Aei2FtwWXWh4rRX3lPrBMX/T4sEugNgoXnuzAtnpOD/Q9UG7K3ut0+wOF?=
 =?us-ascii?Q?3EVTRkqo0oexBCpe+DFzcTu6DOB/ccXAEuhhXtJ7JS/+iWIW+OI6du3F2ZBp?=
 =?us-ascii?Q?2VDnm/xoohGdHf427/nehgHEnNu1efKtc3+X/l3VVn5XA3vGZF3j7UTkwEdY?=
 =?us-ascii?Q?u9sypCWo3gZWWuZ01KWqLtS/JTpBwGgQrk/65gGZ0ngUTUIGQja6AJVvGsG1?=
 =?us-ascii?Q?lH5xyKuzktxVKVny5MiDrGEFBmtV3h0FVGsjfpezLJ7vptol+tZWJyjm5r5G?=
 =?us-ascii?Q?tOMRo9AdjC1hhQOXgu195f6SH601um5Y56zAAkrKf6qRwnmUVtXyd5qJOX4v?=
 =?us-ascii?Q?Qq9eas3VJO/OojNWSwvNfnFVmsaR6mfNiXr04JuoUkE+trW5nw1LCHRCiUQy?=
 =?us-ascii?Q?CKtoZX+qBx2r+OGhu2snh2iwU1v4iR+4hXxToQct?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eac0e1c-d8ec-4325-2158-08dbd9bc9270
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 02:53:33.7675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFMCERPC/uVns8vcSrk60U8nYAHjPPk7YuBRwoMHO3ss2SAoWl97xq9tCa7P8jRrUFgN2Azo1yL9Dod/Yub9OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
X-OriginatorOrg: intel.com

Hi Sunil,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linus/master v6.6]
[cannot apply to rafael-pm/acpi-bus tip/irq/core pci/next pci/for-linus next-20231030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sunil-V-L/arm64-PCI-Migrate-ACPI-related-functions-to-pci-acpi-c/20231026-042858
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20231025202344.581132-22-sunilvl%40ventanamicro.com
patch subject: [RFC PATCH v2 21/21] ACPI: RISC-V: Create PLIC platform device
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20231031/202310311026.2FTakVns-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310311026.2FTakVns-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202310311026.2FTakVns-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/riscv/irq.c:103:13: warning: no previous prototype for 'riscv_acpi_aplic_platform_init' [-Wmissing-prototypes]
     103 | void __init riscv_acpi_aplic_platform_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/acpi/riscv/irq.c:117:13: warning: no previous prototype for 'riscv_acpi_plic_platform_init' [-Wmissing-prototypes]
     117 | void __init riscv_acpi_plic_platform_init(void)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/riscv_acpi_plic_platform_init +117 drivers/acpi/riscv/irq.c

e501748dc32f47 Sunil V L 2023-10-26  102  
e501748dc32f47 Sunil V L 2023-10-26 @103  void __init riscv_acpi_aplic_platform_init(void)
e501748dc32f47 Sunil V L 2023-10-26  104  {
e501748dc32f47 Sunil V L 2023-10-26  105  	acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, aplic_parse_madt, 0);
e501748dc32f47 Sunil V L 2023-10-26  106  }
417e6dc5b730e7 Sunil V L 2023-10-26  107  
417e6dc5b730e7 Sunil V L 2023-10-26  108  static int __init plic_parse_madt(union acpi_subtable_headers *header,
417e6dc5b730e7 Sunil V L 2023-10-26  109  				  const unsigned long end)
417e6dc5b730e7 Sunil V L 2023-10-26  110  {
417e6dc5b730e7 Sunil V L 2023-10-26  111  	struct acpi_madt_plic *plic = (struct acpi_madt_plic *)header;
417e6dc5b730e7 Sunil V L 2023-10-26  112  
417e6dc5b730e7 Sunil V L 2023-10-26  113  	return irqchip_add_platform_device("riscv-plic", plic->id, plic->base_addr,
417e6dc5b730e7 Sunil V L 2023-10-26  114  					   plic->size, header);
417e6dc5b730e7 Sunil V L 2023-10-26  115  }
417e6dc5b730e7 Sunil V L 2023-10-26  116  
417e6dc5b730e7 Sunil V L 2023-10-26 @117  void __init riscv_acpi_plic_platform_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

