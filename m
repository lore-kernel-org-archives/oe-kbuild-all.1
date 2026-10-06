Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C13D39060C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 12:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791288210; cv=fail; b=Qn80Z7LuHx9eeSicxuD914keEhz6IuOpbpO/eP52Kl3uhLPMOYZS2FMI9rBjKiIK7S6F3Fs+xHVpal+TwJv06ig1r34Jk+1ZixM+nca5Sv8WsoTz52o7JgYKRC1IMu1Rms7Kxf75Ou/6BDVGrwgbnw4CDiErribRSQZCzLdoUYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791288210; c=relaxed/simple;
	bh=XdwqD1Zc2McVHU/SgNjcRizoOnZceTURw4u8ZZLKydo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=u/Jh4oKEJnmMfq2MtaQ90aSzyBgDStsu0QOUPNAc5ohMyG2PmY8S4L1EaDyyK8LkCEnkMFsmkoMni00OS8HnUhJvC4a0Mjgd2UHGI1aAT13lAKy/PNotZRDWIkveUxPNoI7ux7PhhOE4GoMNXsKfiLzkmkowuQG1mTVBWa5NFFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBfJ2XuZ; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBfJ2XuZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791288209; x=1822824209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XdwqD1Zc2McVHU/SgNjcRizoOnZceTURw4u8ZZLKydo=;
  b=QBfJ2XuZCuF7GMbtFiNhoOEhe1bFUZ6RctY21RS5h5Nu19YBs/YOeWRt
   ZcdRllPWk1ZD773iN0IqeK3Z2i4cQ8ymsnzYQ1n8lCMQBnQAForPWYMgP
   8jZa1jR3BLdRx0hX2zndo8AXCwWM1e6XHjct426PMy7Y4WaZ2TM0lOcm1
   OzqrqPXghjY7e66+Bwn/xzGRu1yCC53/snOVy9dUNnSciFbfatouxaRXH
   QRbbXFZnTcRbq1SqX9AJZ7L8EgspVPMcX4mE6ZF44uMPNoZZBSPxw/TVG
   NuJJ+N8k8EMEqAU2PxRVEbL5Pkg3f5UI0YiD3R5XyNUK6pUollwklSimT
   A==;
X-CSE-ConnectionGUID: 1IHuSDeeQfyhdg7nJLF7xg==
X-CSE-MsgGUID: xxvvFjXZS32hCB0+varaIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102496049"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102496049"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:03:27 -0700
X-CSE-ConnectionGUID: rnMLEvCwQ3SQp80TOFwzFg==
X-CSE-MsgGUID: vmPiCX29T+ab8e9N1u+Nvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="285037701"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:03:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:03:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 05:03:26 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.18) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:03:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NowLiRvURjPVguKMNyzZFF2Za0MNoyTjZ35trdRK4mko1M2aLnOITUi7fca7xt21bjt1x2CMCRu68VjlaJNQTr+W+hJxDdqxHI2dFmK4QolEI90vYNdWoG2gzmj6oJUc9O2Lf5CRvB9+E+gPdgaC7mPe6D2hefPVzoIqAHWvAoK2pmrew/bMEqS9xNy2FNICdMD9gS0rPPTu0c8ZgZdAPzvdtzRzwB4EgVupIA/t+LjuPuEDyWq7XtbdH2YTQQ8ZGI5XN4cJn2R3mj/zL9hGv0Qq8B+esmm/xWHs5d92xZ0Pd9DvbO2AfHCO90bn3/gM3kCfMT0jMM8lhxlAzDaYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaTD6Jgnm3GjIwboVSiLC9HPqhQc26uq96NkhAPedoU=;
 b=oSefEAuR+rS+BnlCtGr9G7KZhtJTshVxp81nXCi9iJpmNdYRmC/U1TMk0B1To4cReKazAaePF6yLHun9Vk2dvQjJDE9wcP2laBeMUjOBr8igIwg3yZ134sGaqXlEGdLfSP4lmVCUUmJCyNIaAMDEfFMYdFZWWewpyxOHIRwXgH9qLSM6fnTkq8hhXSlC/NPD9eu0AZn+QzZmCEjs9UwhZlxZU2gQoQq484QoFI2HxCxSG9KWZ7tlLfQ9D5upWuMvrxU/pCouZbLny+7J5CRwV863xDeq7rEjlbv2bmtkTYVNw9nVBlLWJAsuwllcDeqB0YM2dE2qUhZ0aCiHqL1Wng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ2PR11MB8404.namprd11.prod.outlook.com (2603:10b6:a03:53f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 6 Oct
 2026 12:03:23 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 12:03:23 +0000
Date: Tue, 6 Oct 2026 20:03:15 +0800
From: kernel test robot <lkp@intel.com>
To: Prajwal N <prajwal.n@oss.qualcomm.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: drivers/watchdog/riscv_sbi_wdt.c:327:16: warning: assignment
 discards 'const' qualifier from pointer target type
Message-ID: <asTjg2C4rP+HBjNm@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0038.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::11) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ2PR11MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a854b1-5dba-4504-0c5f-08df23a1d200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: X+VTPUNWzg/g2mGyPy3zqvsrNRh8snlv6YWFKUowZhPFMlvV0qohKbJQhTy82cXU4vJvQeiPEm0LCugDwbIX0xx905BiJysxfNMRwZGylfMBsc8kaWTcMVQxQ0QiZX+JMDBcihgTCDaJmSDST/dBSfUK7HGELu0Dd+R7+8VqmOxrEbpGvSsmighWIEMlYcqw5orGbgHaOYkCzZoXbbABJ4w0C0cqV8WCnWLnM7Ii/milWpoYzR8oWxhZ8M7jV1MwfLWCYiQl9h6OEL1TJ3L9SiMWdMwCSp+uO1Jwau2UxS+hSYG3Sjma7C+HIC9ESJA2pxEaCdniQQO1uoRvyhHq26fgGpmYAnfoqv8S5t6T7aVEpwpFpTj9Nx//195e/54i/4/akCiHrKOvcg3vtDshzkF1TYFExRm5f6yL8vdJR/5r4nl+JipuZsMjRx6sumDU4JNvYBhMw87lwSxNWLn2CZWPS++nclYhcQhSG9MD+EA1dM5I6OMU8/CY/8rA5Kuu6YLYlEZJbnztNA2epXDKJW8XaU+Db1iSsY204T/HE+oyFbyveXkpO54aRP7R35RFnDPjJTZwDjXK9D0hieboKEYjtgJkwr1vq2Y+GrevcCBfU/1LlGkrOtcHuwukbKt1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zfWjSyyXBy2xjsbl1osF2bhHhc+tIkqSyWm0BiNXOZaicTX1TJHnokq4EGG6?=
 =?us-ascii?Q?+4brZC/zc6m64Bgs7ARRTJEDfF317/0/BVUqSBoN+jgNctRKCX3ESSyFX3Tq?=
 =?us-ascii?Q?qp2eNO9TVfEqYMsmbPtZ/yPfdOi7mON9MiolL1YdG9ecwLT1FmSPVt+lIUPp?=
 =?us-ascii?Q?0Z9wCMDR481c4gaLYUHAKbvOg4pb16rZyZ+X3WQ/bTocJ0Zd4MNTR592lPAi?=
 =?us-ascii?Q?PKJvkvUnhp27Iq/0V6T7KaFnVMR5DLfcnHNs+9lpz6ghnPerm/LDQ6jBiAuk?=
 =?us-ascii?Q?SSU/fz1e0ZMIi1C3RtrsFFxzHGOLBTbRXKiUe3mXdp2ZmaGNf3Wbi4LBiIQr?=
 =?us-ascii?Q?xWfax/ujhnGT4ZM2QRBG43q3+bEDziLw4L1ovqAZ0Vctr8Kfu32jvSCy6aAp?=
 =?us-ascii?Q?UNBQYokrFokmuzTN5NHNqBTDa7nnj4uUDU7KyDEUzaZJ2VOCfkrQLz5oAhBZ?=
 =?us-ascii?Q?FSt0rBUgcpC6yvS8vxZ5AWDjQnALenXpICOA3D4O5nrWfPTnE4E8xa7sjEc2?=
 =?us-ascii?Q?aaln/1PktYPxuEQD7vz+QCiQlNM6TGpIjsgHB2vvG/ZkHlJ7K9Hjz5J2ZuPI?=
 =?us-ascii?Q?9SB/Rh4fQJZU9qf+0lXo66bmgywHoszjv2JNeTY8Lnvn+8SxizJ1kD9aCknJ?=
 =?us-ascii?Q?bywFxGoEdMrNWysPqgDqOKlxsRjUwFaHmCcVV0A/62gg/1pXAaW+/Id89yJX?=
 =?us-ascii?Q?895Us6nqyK3iO6GNKI0AIVXsy7uqXSIjRfs74EJUz5kqQCmWKT5GYPm2jVZy?=
 =?us-ascii?Q?ORlToAK5kNsm6AJhVA9jcBStutd3hQs9Xt1825dQqm0EFuTlN+cgswYx8XRy?=
 =?us-ascii?Q?Gc02lYxRnpbazml7GgqplRHolpRysNSGYlcmPC9LS3hksNCpDAINDqDh4cM5?=
 =?us-ascii?Q?+1OYN22uaAcbiUQKIDe+5YLW5jvSj21q9UOFhmGQIItYZbaIDByVSnpWgRuC?=
 =?us-ascii?Q?TPDV6mirANXpx59a5+oskYYu+xPLxxdllHYi6igwjsxDnuRgnhb8WWSfzReG?=
 =?us-ascii?Q?CJ/LvL36kuBj3KWaOA6W7HHm95XoFByeBXNhXGV3BIwTLL1wiw3ntxCedtky?=
 =?us-ascii?Q?cYy4rxG1z40DBTT117ROIXpm7eGk+52M4eNSBWKCUDvmdUmNyYLiU5ALjVku?=
 =?us-ascii?Q?0rP6PEjnMrunbTUsPtDZgBnZveV8NMZxrAkUBUEbiLtwkl7RTUQS5GjzDE1B?=
 =?us-ascii?Q?7j812isu6e3XJPaLfvpeCkhSSsngV+Bh0dqSZMvoG0uZty3lBpe2RomBeeNu?=
 =?us-ascii?Q?HXWD6bwRY2/RC27LOxsJWTs4e6uax//VoVX9uPbZg6e8b8q9cdqzsiOrsU+M?=
 =?us-ascii?Q?0SotvIbwTjnwq00H+oDU/hOLloOtSqlFEE2jiPHat1RQoYVd/N4BNfepIZiw?=
 =?us-ascii?Q?z9pI6PFqaZe8rR1Y53liblELYwa6rwkGz0sAsZ9dP4Po+RN4NHq/bwUAozrV?=
 =?us-ascii?Q?B2rSZkwXfLFj1Ha3/h3cBua2CUAg2u6gjojTVb0cvSgI+8eJDg3jd/XAmGEy?=
 =?us-ascii?Q?x8mGCwsyxqS3YrYHvdeNetIa5X0XFWJseCzbp85JIdVhAUktIoa/Ex0Zeq37?=
 =?us-ascii?Q?rg+eYtBwEMA8wegzPkNCwyWpb50iBwBeCJueTVbWIJ+ZTeWLngDgR95urb16?=
 =?us-ascii?Q?sIzfIEs6zST8LiDrd+Is/+N9EB+Gd56ZurRQdJTf1a7vumjxT3kLA0ZHlceQ?=
 =?us-ascii?Q?StQoHUUga6DGveLgqKI0IYWCbd4P3JOktOPQJRlVgh/m3gbWEjFPh78HGPu0?=
 =?us-ascii?Q?GoMXmyYd+g=3D=3D?=
X-Exchange-RoutingPolicyChecked: knp8xmEpcPxoI1S3NOQBE62Rmi7iIu0yo1OlHZj+0EIjqPZmavJwhpOmBg2OqgWcoq/5uS7Eep1ML74FlgtHRhzO0ODfA1eEJ1HXiGYL8UDQu2d9vXwr95BzgKPNVpqfKPOu7oC6QFJkzmsAnfSnWw7eC5r5OngBLmpbhzdT7ENNWTyoSZZEcxOgvuDRWp0Hl2g/K8zieJEsiM1G0Tbs2cCs94qhvZ8Vp1GkiES6n+R5SezpqfS+NnONkxPsIjqZsTCQzcHnVdma64Tezv1NXcRp5S5l7LEDkhZ6JM8aQExyStAYop/UEHRoXsKxYHAOORT5egHJZwDlRZQB+H3Oiw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a854b1-5dba-4504-0c5f-08df23a1d200
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:03:23.2068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Jy/ndTEMk4YzvUSx+Xi0zPvuTp4H4bzF6NBVlfhLj0F+Kn+Prkt1LagY/uXpabuO5GZUJo7+b9OeTLDqr66Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8404
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Prajwal-N/include-sbi_ecall_interface-Add-defines-for-the-RISC-V-SBI-watchdog-extension/20261002-220757
head:   aa91eed7420580c83c9c8d500ef9379e539ca8c7
commit: aa91eed7420580c83c9c8d500ef9379e539ca8c7 drivers/watchdog: Add RISC-V SBI watchdog driver
config: riscv-randconfig-1000-20261006 (https://download.01.org/0day-ci/archive/20261006/202610060557.qyC1dD0C-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610060557.qyC1dD0C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610060557.qyC1dD0C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/watchdog/riscv_sbi_wdt.c: In function 'sbiwdt_probe':
>> drivers/watchdog/riscv_sbi_wdt.c:327:16: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      imsic_global = imsic_get_global_config();
                   ^
   drivers/watchdog/riscv_sbi_wdt.c:333:53: error: 'struct imsic_global_config' has no member named 'fwnode'
      msi_domain = irq_find_matching_fwnode(imsic_global->fwnode,
                                                        ^~


vim +/const +327 drivers/watchdog/riscv_sbi_wdt.c

aa91eed7420580 Prajwal N 2026-10-02  298  
aa91eed7420580 Prajwal N 2026-10-02  299  static int sbiwdt_probe(struct platform_device *pdev)
aa91eed7420580 Prajwal N 2026-10-02  300  {
aa91eed7420580 Prajwal N 2026-10-02  301  	struct sbiwdt *wdt;
aa91eed7420580 Prajwal N 2026-10-02  302  	struct imsic_global_config *imsic_global;
aa91eed7420580 Prajwal N 2026-10-02  303  	struct irq_domain *msi_domain;
aa91eed7420580 Prajwal N 2026-10-02  304  	struct device *dev = &pdev->dev;
aa91eed7420580 Prajwal N 2026-10-02  305  	int rc;
aa91eed7420580 Prajwal N 2026-10-02  306  
aa91eed7420580 Prajwal N 2026-10-02  307  	/* Allocate memory for the global watchdog structure */
aa91eed7420580 Prajwal N 2026-10-02  308  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
aa91eed7420580 Prajwal N 2026-10-02  309  	if (!wdt)
aa91eed7420580 Prajwal N 2026-10-02  310  		return -ENOMEM;
aa91eed7420580 Prajwal N 2026-10-02  311  
aa91eed7420580 Prajwal N 2026-10-02  312  	platform_set_drvdata(pdev, wdt);
aa91eed7420580 Prajwal N 2026-10-02  313  	watchdog_set_drvdata(&wdt->wdd, wdt);
aa91eed7420580 Prajwal N 2026-10-02  314  
aa91eed7420580 Prajwal N 2026-10-02  315  	/* Initialiaze watchdog attributes */
aa91eed7420580 Prajwal N 2026-10-02  316  	rc = sbiwdt_init_attributes(wdt);
aa91eed7420580 Prajwal N 2026-10-02  317  	if (rc) {
aa91eed7420580 Prajwal N 2026-10-02  318  		dev_err(dev, "Failed to read SBI watchdog attributes: %d\n", rc);
aa91eed7420580 Prajwal N 2026-10-02  319  		return rc;
aa91eed7420580 Prajwal N 2026-10-02  320  	}
aa91eed7420580 Prajwal N 2026-10-02  321  
aa91eed7420580 Prajwal N 2026-10-02  322  	wdt->wdd.info = &sbiwdt_info;
aa91eed7420580 Prajwal N 2026-10-02  323  	wdt->wdd.ops = &sbiwdt_ops;
aa91eed7420580 Prajwal N 2026-10-02  324  
aa91eed7420580 Prajwal N 2026-10-02  325  	/* Setup MSI if the capability is available */
aa91eed7420580 Prajwal N 2026-10-02  326  	if (wdt->attrs.wdt_capability & SBI_WDT_CAP_MSI_SUPPORT_MASK) {
aa91eed7420580 Prajwal N 2026-10-02 @327  		imsic_global = imsic_get_global_config();
aa91eed7420580 Prajwal N 2026-10-02  328  		if (!imsic_global) {
aa91eed7420580 Prajwal N 2026-10-02  329  			dev_err(dev, "IMSIC firmware node is unavailable\n");
aa91eed7420580 Prajwal N 2026-10-02  330  			return -ENODEV;
aa91eed7420580 Prajwal N 2026-10-02  331  		}
aa91eed7420580 Prajwal N 2026-10-02  332  
aa91eed7420580 Prajwal N 2026-10-02  333  		msi_domain = irq_find_matching_fwnode(imsic_global->fwnode,
aa91eed7420580 Prajwal N 2026-10-02  334  							DOMAIN_BUS_PLATFORM_MSI);
aa91eed7420580 Prajwal N 2026-10-02  335  
aa91eed7420580 Prajwal N 2026-10-02  336  		if (!msi_domain) {
aa91eed7420580 Prajwal N 2026-10-02  337  			dev_err(dev, "IMSIC platform MSI domain is unavailable\n");
aa91eed7420580 Prajwal N 2026-10-02  338  			return -ENODEV;
aa91eed7420580 Prajwal N 2026-10-02  339  		}
aa91eed7420580 Prajwal N 2026-10-02  340  
aa91eed7420580 Prajwal N 2026-10-02  341  		dev_set_msi_domain(&pdev->dev, msi_domain);
aa91eed7420580 Prajwal N 2026-10-02  342  
aa91eed7420580 Prajwal N 2026-10-02  343  		/* MSI setup*/
aa91eed7420580 Prajwal N 2026-10-02  344  		rc = platform_device_msi_init_and_alloc_irqs(dev, 1, sbiwdt_msi_write);
aa91eed7420580 Prajwal N 2026-10-02  345  		if (rc) {
aa91eed7420580 Prajwal N 2026-10-02  346  			dev_err(dev, "Failed to allocate MSIs\n");
aa91eed7420580 Prajwal N 2026-10-02  347  			return rc;
aa91eed7420580 Prajwal N 2026-10-02  348  		}
aa91eed7420580 Prajwal N 2026-10-02  349  
aa91eed7420580 Prajwal N 2026-10-02  350  		wdt->virq = msi_get_virq(dev, 0);
aa91eed7420580 Prajwal N 2026-10-02  351  		if (!wdt->virq) {
aa91eed7420580 Prajwal N 2026-10-02  352  			dev_err(dev, "Failed to get MSI virtual IRQ: %d\n", wdt->virq);
aa91eed7420580 Prajwal N 2026-10-02  353  			return wdt->virq;
aa91eed7420580 Prajwal N 2026-10-02  354  		}
aa91eed7420580 Prajwal N 2026-10-02  355  
aa91eed7420580 Prajwal N 2026-10-02  356  		rc = devm_request_irq(dev, wdt->virq,
aa91eed7420580 Prajwal N 2026-10-02  357  					sbiwdt_pretimeout_handler,
aa91eed7420580 Prajwal N 2026-10-02  358  					0, "sbiwdt-pretimeout", wdt);
aa91eed7420580 Prajwal N 2026-10-02  359  		if (rc) {
aa91eed7420580 Prajwal N 2026-10-02  360  			dev_err(dev, "Failed to request pretimeout IRQ: %d\n", rc);
aa91eed7420580 Prajwal N 2026-10-02  361  			return rc;
aa91eed7420580 Prajwal N 2026-10-02  362  		}
aa91eed7420580 Prajwal N 2026-10-02  363  	}
aa91eed7420580 Prajwal N 2026-10-02  364  
aa91eed7420580 Prajwal N 2026-10-02  365  	rc = devm_watchdog_register_device(dev, &wdt->wdd);
aa91eed7420580 Prajwal N 2026-10-02  366  	if (rc) {
aa91eed7420580 Prajwal N 2026-10-02  367  		dev_err(dev, "Failed to register RISC-V SBI watchdog device\n");
aa91eed7420580 Prajwal N 2026-10-02  368  		return rc;
aa91eed7420580 Prajwal N 2026-10-02  369  	}
aa91eed7420580 Prajwal N 2026-10-02  370  
aa91eed7420580 Prajwal N 2026-10-02  371  	dev_info(&pdev->dev, "RISC-V SBI Watchdog registered\n");
aa91eed7420580 Prajwal N 2026-10-02  372  
aa91eed7420580 Prajwal N 2026-10-02  373  	return 0;
aa91eed7420580 Prajwal N 2026-10-02  374  }
aa91eed7420580 Prajwal N 2026-10-02  375  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

