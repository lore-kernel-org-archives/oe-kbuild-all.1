Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690FB3C46B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 04:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706503088; cv=fail; b=IT+bJKRRhZnbOFEBYnxrRhuGFdYAg7X8/Mp9T4reDQt/MW77agjryW4R8s57fJJdYB0UUxmKFyB138kj9i05EayZZ0Wcs6mO4CWakJ3VTmQa8A3kzTsHzNKlrqcMtQYW1NwMJF+RgJVoaqwiMEq0sFx4hRLf+0Ww64CJlsHZhjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706503088; c=relaxed/simple;
	bh=Y3KAieH9OgutaDEXDB1e4f1vwmenedzvqAVCW9eLUW4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=KTt7l7xH/ZG4PVVtAMMWuxgeYf47P3GtyB/mzLA/xzIbrhQDBVC55P3NlvmQdy9mqz3ifzHAbuCXlL126lzcSOHFJXZjsFZzH0LGdZ1PfGZWPVt6hWSm9tvKGUbngPYv3ayLsZo/CyeEv/AzJKCKATB/RwCbgY7ag8JFE36GGxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jqf2imlk; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jqf2imlk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706503085; x=1738039085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y3KAieH9OgutaDEXDB1e4f1vwmenedzvqAVCW9eLUW4=;
  b=jqf2imlkuc2YcOSflRycOs3UaZtoynl7Ip5yykwRXgS5lFZkE8nSaXJG
   WYLx3qBQxKShxeC0HFmZ8sOhForAoLt3APtWpM/zutmJMNAwf+VOcg8Sp
   s19/Xmy1LzkayyeGA7tkKWc0fRATbTe984dch1F821Xna/amjbzrXiq9U
   M4bgJi8oJNxC4KgqgvRAHJUjiObAoDrYSa2W6kOw5d/8zrGGkBpOFQqjp
   0V34+qFNagwntQinlCYR3W0tQeCCRgN2qy0z67WHNPdvBg6Z+jpu4LCLN
   lp+Y2lySBvnrBFCXFaBvBGkiKWOF102CXc+24JQplvVCn8zyFhtRnf7sx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="21378373"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="gz'50?scan'50,208,50";a="21378373"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 20:38:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="877946109"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="gz'50?scan'50,208,50";a="877946109"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Jan 2024 20:38:03 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Jan 2024 20:38:02 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Jan 2024 20:38:01 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 28 Jan 2024 20:38:01 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 28 Jan 2024 20:37:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpnQa1WcIQSGGsra155wH3yL4TjDnZOONbutgXfcJvUcdwimCIpLVDf5DQPQUo2LxPNOP9Lt61EXph4wEu6KxvCMcGt1o39zZZkfMoCw5pAUCsLezBHzmQGFkzwAzeAUr+UaFAU7tfucSvTOyHV3OG0o8w60Snaj2W+aO8vLpzQeCshSsEt1r8TfBJ3Yn4pLYRfPCGuPMK5T1rHCQB5q0A/vQVECiFfq+7TB9b1NbgJ4tGeXevJ55KpIkgw1ZWimBqk77zkRIfxexSLqcD0T4FN7ZkTdNpu8HSapElfkJsyj6T/Pd6/ydK9hd0YwnrSqY1X6K8qqKDM32FMN6Mohiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GhMvG2giUCpkczRGx5nD3rV1uOGqkBVCmB1bPt7Ucdk=;
 b=mbtv8J7nGkwheta1Pe4canQb/MgpLGq9MPoh5Y7iKGxtJYzy9DTZHoCEBZLfZRmFqYBLCrsqqSB9AvwvqFJF2StaDzFugtG+3OdFDEJ0SXM8W+HV7jvn70gYpVxyfT9Rvgxf1zY+Riq7rpxkHnfplrPmRmzl6pNXzPgsm6BuSggbD2zvvDMcDXwsVBuXOGH3Gdo5D8r5HI08Cw6MXhZOv+XnLRc2Woc90Y1WPZt+nzXGdsmi6q0uDBkVV5309ZWXGE83pOwyFNSD6cr3hnGmM8Tb3LasMGHVF5JM5q76FXsPB4mgPcVGTtxjUNe2j6X6uyfHYbNd3LHAm3HaIKDaOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33; Mon, 29 Jan
 2024 04:37:37 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 04:37:37 +0000
Date: Mon, 29 Jan 2024 12:37:29 +0800
From: kernel test robot <lkp@intel.com>
To: <kernel@openeuler.org>, Xie XiuQi <xiexiuqi@huawei.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [openeuler:openEuler-1.0-LTS 4369/21577] drivers/scsi/sd.c:1222:32:
 sparse: sparse: incorrect type in return expression (different base types)
Message-ID: <ZbcriRjPvEjm0jZu@rli9-mobl>
Content-Type: multipart/mixed; boundary="/VvwsvS6T57vYgFf"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|DM4PR11MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 0750b72c-6a49-4eac-b4b3-08dc2084049e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xsz6alN8C2MKnFBpmGyKxD6PF2I0MNiS4oOHLHBG1gM4qvsbrLzctydna/cHi7hE+i+dRz2bz0aYCV2m0jTl39m2rJozLlGrAG5qpzaU7yyX18bgHoOy0rlqGb5aSrfMRZvzRvsO4/BnNBVjOBMi9mI4UV1KONejC8vz9RrW/P/mIqwPzeLJZISXYDvrfqwGJs/1UsiRM9mxGWa9R8mU/i4KVkWw8phTyTugBmeJAt0fYOesrzKlliPMRLxY+hAWRSg1HjUH71YjhuKvuodDQ9vsgSjyVjwRRgcqLUw4YUwGtG3D5uTD/mAN0loTkgyWOR82yxBkU88pInY8Efll+2mhGK1UFX7KycRPHtUJANLZjSu5qn5YJogrOx/m8rX3PeTda3VwpvxgJXHSV9K/02ck0/VgvFoAVv/36a2xotMq7g7eSiptBuR9unEMYmSEw6c7K5iYYbm+cIYQ3jaxSoNFfiYXuoXFRN5Zhptse/LKyiNseHuXP80ga7f2YZMzMWl4WzBaM6EEhcnAoLfhA2cdjrul3H0BBY7v1Fgv5Snt8fFsdd02kPWryEPRX7JEMdnXo1DHMefKTOCqSovlLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(39860400002)(366004)(136003)(346002)(396003)(376002)(230922051799003)(230273577357003)(230173577357003)(451199024)(1800799012)(186009)(64100799003)(66946007)(4326008)(66556008)(316002)(66476007)(6916009)(8936002)(8676002)(26005)(83380400001)(478600001)(82960400001)(6666004)(6486002)(38100700002)(86362001)(2906002)(30864003)(5660300002)(235185007)(966005)(6506007)(44144004)(9686003)(6512007)(4001150100001)(33716001)(41300700001)(2700100001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QC9KdcM0auC+eMgyBE/z4TpG2U1eBWEN65rSjAbaHX05OOEhJy4gyRt211eU?=
 =?us-ascii?Q?s56d27pSmggJMbZphbkpZOrryaX1igVtiihN0yfvpVFy49b9Ri+cmtTV2yil?=
 =?us-ascii?Q?kZi+bSU/UHv1xVitLvGUn7ylaDq05i6kkRAl7mRTLQ7cU9BYM24IiAACCA8L?=
 =?us-ascii?Q?DCZvSUNZ0jBVeMepUzRXX8alQqnMUsYGgfroB+pc8DbVGpIBxiW6u/oOijS0?=
 =?us-ascii?Q?Aaf+qG2lW7FMfaQUciVAHiNoo9J/dPB3ZcEuM1p+kxZ/MoP6Q6ZjM16N6vAj?=
 =?us-ascii?Q?cD7vp2cMIGecc5A7kM92TPqzM3cDOOXDTyp8ZP/Lrwp5yf5Tt4+vJ19qd5g6?=
 =?us-ascii?Q?vBGShtRWSnYgzZKB73dw3dWIfW6RyJ92Mn+/3WLmaUjBLyxk4aClrzIySKF+?=
 =?us-ascii?Q?ROp7E9Y/mN+IS1TD/Pe5Lid+D18qNgD5Z80D6FvvqWNG2PISdze9aqJwNyqR?=
 =?us-ascii?Q?pvZFqSBhZQZnnB8i5hGu+SgOhPAl537qcOMrf59hPbsAPMVoO4hwWM78evEa?=
 =?us-ascii?Q?nwUxFnlS71F1NEg3mbYR8s7Tnw/MKmEUZ+9jH2h7QSKDcsGicTc7ZT6wcYlB?=
 =?us-ascii?Q?lew7G3XWgAy2MWhNZIihNuVqaRvNuPkj8crCdXmJjPPCkvdExxyTzdA9VXLC?=
 =?us-ascii?Q?O5wNFtO1QcGGe24Tsg8lAYLOgmTlK3RmfDrVXiWrl3zchD+DGygvBA+JbL1X?=
 =?us-ascii?Q?VEo9b13fh8tHsyHvQ5vQe0AZsQziLFVR6/DMdIrkPnMFcGZa/Enfx+dv0A0R?=
 =?us-ascii?Q?vzgz3zfaaKKSEn65px/mT3qTN8Fv+in+ShobH1QCSJXUBo3nIMCib0H1hgei?=
 =?us-ascii?Q?ADARFmE494ORqJ9gIjloqMmoT/JggzI0TxmszDwwQ5dofjNRch+v8gHsF/vA?=
 =?us-ascii?Q?ST2RDGKTq3XRdlMpQM0x/k/tRkIkpaS3n9BXa+t1qhITDEo/6mnyi18ZMzb/?=
 =?us-ascii?Q?dEOIALHz0dlscL28aNy0CrBYwYSGpimsj10ze8YZOyhJTeO3yyGrR9raF3KB?=
 =?us-ascii?Q?bfRefEz+YVRXWmKKEEUbnuQOVnAVLUzEqr2KYs18WsNnXn5Ept/a3v+yMkKg?=
 =?us-ascii?Q?5GRxuv9VQ5d4PkrjkURjLEmAustbBlrSEsa+/cKW3FXo4Judqa+OQ5gE+gFR?=
 =?us-ascii?Q?sLouuTB8+37tBAtuOgnoawx2dFMqjgPeFQ3KCmDQ/xVZHIm+/Oz1nXkNklD5?=
 =?us-ascii?Q?g7PJ2YnwW23uGmMN1kOs3s/OnOfs8AyLOiKnX+CTKp+Mh15XxPSgfSTq5eIj?=
 =?us-ascii?Q?b+gBSMrU6a6nYjzVZDSwWTDTLkBJAuBgvv3dDK7R8zpr1Ev1t0Immnmnrlub?=
 =?us-ascii?Q?obrNr/brJLtxsAl/nEQety2lyGIOCv+u8pKUjIXwQFGdLMiR7GghdqpyPKRj?=
 =?us-ascii?Q?pcDSuO7FTx3vtsIM8wfOPogl56YSm3MzJ3NfKzcmkV2aruhMAvsh3gfjxCKB?=
 =?us-ascii?Q?LPcDP2FZfveJUbryT8k2D5fhs6k5ue3xf+xXKzAm9tNM+pZdfq/MU+UCqlCl?=
 =?us-ascii?Q?z8gfCH3KCOnHK8iGmMfmqxA/6JzeUyJM08hruGSsjY7g7lRrNy3g7mfsU/7T?=
 =?us-ascii?Q?bvONaVgu3bwcNUMLJ4JJvudeGgIwlf15EVrLqwn82GJsxboiXxWLbG/49RKv?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0750b72c-6a49-4eac-b4b3-08dc2084049e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 04:37:37.0262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6j57qNiAz61/ccCDB73/2+pULbRxx2c6yOv/HoNwZyxucIA64ocNUY1USCNQWGDqZ5uyMmxkq6omWc5uC1cSHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
X-OriginatorOrg: intel.com

--/VvwsvS6T57vYgFf
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   992b5fc139d3aa14b25613b06adee4bb9c110b28
commit: d597314e1e561e653a9dbeafec69f20d6b372af1 [4369/21577] scsi: sd: Protect against READ(6) or WRITE(6) with zero block transfer length
:::::: branch date: 7 hours ago
:::::: commit date: 4 years, 1 month ago
config: x86_64-randconfig-121-20240125 (attached as .config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (attached as reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401262223.5mM2ZI39-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/scsi/sd.c:1222:32: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted blk_status_t [usertype] @@
   drivers/scsi/sd.c:1222:32: sparse:     expected int
   drivers/scsi/sd.c:1222:32: sparse:     got restricted blk_status_t [usertype]
   In file included from drivers/scsi/sd.c:46:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:401:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     401 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.

vim +1222 drivers/scsi/sd.c

90467c294aba7f FUJITA Tomonori    2010-07-03  1019  
87949eee7e1547 Christoph Hellwig  2014-06-28  1020  static int sd_setup_read_write_cmnd(struct scsi_cmnd *SCpnt)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1021  {
a1b73fc194e73e Christoph Hellwig  2014-05-01  1022  	struct request *rq = SCpnt->request;
a1b73fc194e73e Christoph Hellwig  2014-05-01  1023  	struct scsi_device *sdp = SCpnt->device;
776b23a0363d99 Christoph Hellwig  2006-01-06  1024  	struct gendisk *disk = rq->rq_disk;
89d9475610771b Hannes Reinecke    2016-10-18  1025  	struct scsi_disk *sdkp = scsi_disk(disk);
83096ebf1263b2 Tejun Heo          2009-05-07  1026  	sector_t block = blk_rq_pos(rq);
18351070b86d15 Linus Torvalds     2008-08-05  1027  	sector_t threshold;
83096ebf1263b2 Tejun Heo          2009-05-07  1028  	unsigned int this_count = blk_rq_sectors(rq);
d597314e1e561e Bart Van Assche    2019-03-23  1029  	unsigned int nr_blocks = sectors_to_logical(sdp, blk_rq_sectors(rq));
c611529e7cd346 Martin K. Petersen 2014-09-26  1030  	unsigned int dif, dix;
c611529e7cd346 Martin K. Petersen 2014-09-26  1031  	int ret;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1032  	unsigned char protect;
7f9a6bc4e9d59e James Bottomley    2007-08-04  1033  
3c356bde19e9a7 Christoph Hellwig  2014-09-05  1034  	ret = scsi_init_io(SCpnt);
7f9a6bc4e9d59e James Bottomley    2007-08-04  1035  	if (ret != BLKPREP_OK)
39051dd85f2870 Damien Le Moal     2017-12-21  1036  		return ret;
0624cbb1e2e64a Bart Van Assche    2017-08-25  1037  	WARN_ON_ONCE(SCpnt != rq->special);
7f9a6bc4e9d59e James Bottomley    2007-08-04  1038  
7f9a6bc4e9d59e James Bottomley    2007-08-04  1039  	/* from here on until we're complete, any goto out
7f9a6bc4e9d59e James Bottomley    2007-08-04  1040  	 * is used for a killable error condition */
7f9a6bc4e9d59e James Bottomley    2007-08-04  1041  	ret = BLKPREP_KILL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1042  
a1b73fc194e73e Christoph Hellwig  2014-05-01  1043  	SCSI_LOG_HLQUEUE(1,
a1b73fc194e73e Christoph Hellwig  2014-05-01  1044  		scmd_printk(KERN_INFO, SCpnt,
a1b73fc194e73e Christoph Hellwig  2014-05-01  1045  			"%s: block=%llu, count=%d\n",
a1b73fc194e73e Christoph Hellwig  2014-05-01  1046  			__func__, (unsigned long long)block, this_count));
^1da177e4c3f41 Linus Torvalds     2005-04-16  1047  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1048  	if (!sdp || !scsi_device_online(sdp) ||
83096ebf1263b2 Tejun Heo          2009-05-07  1049  	    block + blk_rq_sectors(rq) > get_capacity(disk)) {
fa0d34be06213e Martin K. Petersen 2007-02-27  1050  		SCSI_LOG_HLQUEUE(2, scmd_printk(KERN_INFO, SCpnt,
83096ebf1263b2 Tejun Heo          2009-05-07  1051  						"Finishing %u sectors\n",
83096ebf1263b2 Tejun Heo          2009-05-07  1052  						blk_rq_sectors(rq)));
fa0d34be06213e Martin K. Petersen 2007-02-27  1053  		SCSI_LOG_HLQUEUE(2, scmd_printk(KERN_INFO, SCpnt,
fa0d34be06213e Martin K. Petersen 2007-02-27  1054  						"Retry with 0x%p\n", SCpnt));
7f9a6bc4e9d59e James Bottomley    2007-08-04  1055  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1056  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1057  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1058  	if (sdp->changed) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1059  		/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  1060  		 * quietly refuse to do anything to a changed disc until 
^1da177e4c3f41 Linus Torvalds     2005-04-16  1061  		 * the changed bit has been reset
^1da177e4c3f41 Linus Torvalds     2005-04-16  1062  		 */
3ff5588d3f8afa Alan Stern         2010-09-07  1063  		/* printk("SCSI disk has been changed or is not present. Prohibiting further I/O.\n"); */
7f9a6bc4e9d59e James Bottomley    2007-08-04  1064  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1065  	}
7f9a6bc4e9d59e James Bottomley    2007-08-04  1066  
a0899d4df534d2 Hans de Goede      2008-01-20  1067  	/*
18351070b86d15 Linus Torvalds     2008-08-05  1068  	 * Some SD card readers can't handle multi-sector accesses which touch
18351070b86d15 Linus Torvalds     2008-08-05  1069  	 * the last one or two hardware sectors.  Split accesses as needed.
a0899d4df534d2 Hans de Goede      2008-01-20  1070  	 */
18351070b86d15 Linus Torvalds     2008-08-05  1071  	threshold = get_capacity(disk) - SD_LAST_BUGGY_SECTORS *
18351070b86d15 Linus Torvalds     2008-08-05  1072  		(sdp->sector_size / 512);
18351070b86d15 Linus Torvalds     2008-08-05  1073  
18351070b86d15 Linus Torvalds     2008-08-05  1074  	if (unlikely(sdp->last_sector_bug && block + this_count > threshold)) {
18351070b86d15 Linus Torvalds     2008-08-05  1075  		if (block < threshold) {
18351070b86d15 Linus Torvalds     2008-08-05  1076  			/* Access up to the threshold but not beyond */
18351070b86d15 Linus Torvalds     2008-08-05  1077  			this_count = threshold - block;
18351070b86d15 Linus Torvalds     2008-08-05  1078  		} else {
18351070b86d15 Linus Torvalds     2008-08-05  1079  			/* Access only a single hardware sector */
18351070b86d15 Linus Torvalds     2008-08-05  1080  			this_count = sdp->sector_size / 512;
18351070b86d15 Linus Torvalds     2008-08-05  1081  		}
18351070b86d15 Linus Torvalds     2008-08-05  1082  	}
a0899d4df534d2 Hans de Goede      2008-01-20  1083  
fa0d34be06213e Martin K. Petersen 2007-02-27  1084  	SCSI_LOG_HLQUEUE(2, scmd_printk(KERN_INFO, SCpnt, "block=%llu\n",
fa0d34be06213e Martin K. Petersen 2007-02-27  1085  					(unsigned long long)block));
^1da177e4c3f41 Linus Torvalds     2005-04-16  1086  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1087  	/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  1088  	 * If we have a 1K hardware sectorsize, prevent access to single
^1da177e4c3f41 Linus Torvalds     2005-04-16  1089  	 * 512 byte sectors.  In theory we could handle this - in fact
^1da177e4c3f41 Linus Torvalds     2005-04-16  1090  	 * the scsi cdrom driver must be able to handle this because
^1da177e4c3f41 Linus Torvalds     2005-04-16  1091  	 * we typically use 1K blocksizes, and cdroms typically have
^1da177e4c3f41 Linus Torvalds     2005-04-16  1092  	 * 2K hardware sectorsizes.  Of course, things are simpler
^1da177e4c3f41 Linus Torvalds     2005-04-16  1093  	 * with the cdrom, since it is read-only.  For performance
^1da177e4c3f41 Linus Torvalds     2005-04-16  1094  	 * reasons, the filesystems should be able to handle this
^1da177e4c3f41 Linus Torvalds     2005-04-16  1095  	 * and not force the scsi disk driver to use bounce buffers
^1da177e4c3f41 Linus Torvalds     2005-04-16  1096  	 * for this.
^1da177e4c3f41 Linus Torvalds     2005-04-16  1097  	 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1098  	if (sdp->sector_size == 1024) {
83096ebf1263b2 Tejun Heo          2009-05-07  1099  		if ((block & 1) || (blk_rq_sectors(rq) & 1)) {
e73aec8247032e Martin K. Petersen 2007-02-27  1100  			scmd_printk(KERN_ERR, SCpnt,
e73aec8247032e Martin K. Petersen 2007-02-27  1101  				    "Bad block number requested\n");
7f9a6bc4e9d59e James Bottomley    2007-08-04  1102  			goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1103  		} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1104  			block = block >> 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1105  			this_count = this_count >> 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1106  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1107  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1108  	if (sdp->sector_size == 2048) {
83096ebf1263b2 Tejun Heo          2009-05-07  1109  		if ((block & 3) || (blk_rq_sectors(rq) & 3)) {
e73aec8247032e Martin K. Petersen 2007-02-27  1110  			scmd_printk(KERN_ERR, SCpnt,
e73aec8247032e Martin K. Petersen 2007-02-27  1111  				    "Bad block number requested\n");
7f9a6bc4e9d59e James Bottomley    2007-08-04  1112  			goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1113  		} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1114  			block = block >> 2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1115  			this_count = this_count >> 2;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1116  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1117  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1118  	if (sdp->sector_size == 4096) {
83096ebf1263b2 Tejun Heo          2009-05-07  1119  		if ((block & 7) || (blk_rq_sectors(rq) & 7)) {
e73aec8247032e Martin K. Petersen 2007-02-27  1120  			scmd_printk(KERN_ERR, SCpnt,
e73aec8247032e Martin K. Petersen 2007-02-27  1121  				    "Bad block number requested\n");
7f9a6bc4e9d59e James Bottomley    2007-08-04  1122  			goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1123  		} else {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1124  			block = block >> 3;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1125  			this_count = this_count >> 3;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1126  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1127  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1128  	if (rq_data_dir(rq) == WRITE) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1129  		SCpnt->cmnd[0] = WRITE_6;
af55ff675a8461 Martin K. Petersen 2008-07-17  1130  
8c579ab69d50a4 Martin K. Petersen 2012-08-28  1131  		if (blk_integrity_rq(rq))
10c41ddd61323b Max Gurtovoy       2018-07-30  1132  			t10_pi_prepare(SCpnt->request, sdkp->protection_type);
af55ff675a8461 Martin K. Petersen 2008-07-17  1133  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1134  	} else if (rq_data_dir(rq) == READ) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1135  		SCpnt->cmnd[0] = READ_6;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1136  	} else {
ef295ecf090d3e Christoph Hellwig  2016-10-28  1137  		scmd_printk(KERN_ERR, SCpnt, "Unknown command %d\n", req_op(rq));
7f9a6bc4e9d59e James Bottomley    2007-08-04  1138  		goto out;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1139  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1140  
fa0d34be06213e Martin K. Petersen 2007-02-27  1141  	SCSI_LOG_HLQUEUE(2, scmd_printk(KERN_INFO, SCpnt,
83096ebf1263b2 Tejun Heo          2009-05-07  1142  					"%s %d/%u 512 byte blocks.\n",
fa0d34be06213e Martin K. Petersen 2007-02-27  1143  					(rq_data_dir(rq) == WRITE) ?
fa0d34be06213e Martin K. Petersen 2007-02-27  1144  					"writing" : "reading", this_count,
83096ebf1263b2 Tejun Heo          2009-05-07  1145  					blk_rq_sectors(rq)));
^1da177e4c3f41 Linus Torvalds     2005-04-16  1146  
c611529e7cd346 Martin K. Petersen 2014-09-26  1147  	dix = scsi_prot_sg_count(SCpnt);
c611529e7cd346 Martin K. Petersen 2014-09-26  1148  	dif = scsi_host_dif_capable(SCpnt->device->host, sdkp->protection_type);
c611529e7cd346 Martin K. Petersen 2014-09-26  1149  
c611529e7cd346 Martin K. Petersen 2014-09-26  1150  	if (dif || dix)
c611529e7cd346 Martin K. Petersen 2014-09-26  1151  		protect = sd_setup_protect_cmnd(SCpnt, dix, dif);
af55ff675a8461 Martin K. Petersen 2008-07-17  1152  	else
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1153  		protect = 0;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1154  
8475c8118551f8 Christoph Hellwig  2016-09-11  1155  	if (protect && sdkp->protection_type == T10_PI_TYPE2_PROTECTION) {
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1156  		SCpnt->cmnd = mempool_alloc(sd_cdb_pool, GFP_ATOMIC);
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1157  
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1158  		if (unlikely(SCpnt->cmnd == NULL)) {
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1159  			ret = BLKPREP_DEFER;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1160  			goto out;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1161  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  1162  
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1163  		SCpnt->cmd_len = SD_EXT_CDB_SIZE;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1164  		memset(SCpnt->cmnd, 0, SCpnt->cmd_len);
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1165  		SCpnt->cmnd[0] = VARIABLE_LENGTH_CMD;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1166  		SCpnt->cmnd[7] = 0x18;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1167  		SCpnt->cmnd[9] = (rq_data_dir(rq) == READ) ? READ_32 : WRITE_32;
33659ebbae2622 Christoph Hellwig  2010-08-07  1168  		SCpnt->cmnd[10] = protect | ((rq->cmd_flags & REQ_FUA) ? 0x8 : 0);
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1169  
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1170  		/* LBA */
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1171  		SCpnt->cmnd[12] = sizeof(block) > 4 ? (unsigned char) (block >> 56) & 0xff : 0;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1172  		SCpnt->cmnd[13] = sizeof(block) > 4 ? (unsigned char) (block >> 48) & 0xff : 0;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1173  		SCpnt->cmnd[14] = sizeof(block) > 4 ? (unsigned char) (block >> 40) & 0xff : 0;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1174  		SCpnt->cmnd[15] = sizeof(block) > 4 ? (unsigned char) (block >> 32) & 0xff : 0;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1175  		SCpnt->cmnd[16] = (unsigned char) (block >> 24) & 0xff;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1176  		SCpnt->cmnd[17] = (unsigned char) (block >> 16) & 0xff;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1177  		SCpnt->cmnd[18] = (unsigned char) (block >> 8) & 0xff;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1178  		SCpnt->cmnd[19] = (unsigned char) block & 0xff;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1179  
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1180  		/* Expected Indirect LBA */
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1181  		SCpnt->cmnd[20] = (unsigned char) (block >> 24) & 0xff;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1182  		SCpnt->cmnd[21] = (unsigned char) (block >> 16) & 0xff;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1183  		SCpnt->cmnd[22] = (unsigned char) (block >> 8) & 0xff;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1184  		SCpnt->cmnd[23] = (unsigned char) block & 0xff;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1185  
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1186  		/* Transfer length */
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1187  		SCpnt->cmnd[28] = (unsigned char) (this_count >> 24) & 0xff;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1188  		SCpnt->cmnd[29] = (unsigned char) (this_count >> 16) & 0xff;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1189  		SCpnt->cmnd[30] = (unsigned char) (this_count >> 8) & 0xff;
4e7392ec582cf0 Martin K. Petersen 2009-09-20  1190  		SCpnt->cmnd[31] = (unsigned char) this_count & 0xff;
e430cbc8bbd779 Akinobu Mita       2014-06-02  1191  	} else if (sdp->use_16_for_rw || (this_count > 0xffff)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1192  		SCpnt->cmnd[0] += READ_16 - READ_6;
33659ebbae2622 Christoph Hellwig  2010-08-07  1193  		SCpnt->cmnd[1] = protect | ((rq->cmd_flags & REQ_FUA) ? 0x8 : 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1194  		SCpnt->cmnd[2] = sizeof(block) > 4 ? (unsigned char) (block >> 56) & 0xff : 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1195  		SCpnt->cmnd[3] = sizeof(block) > 4 ? (unsigned char) (block >> 48) & 0xff : 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1196  		SCpnt->cmnd[4] = sizeof(block) > 4 ? (unsigned char) (block >> 40) & 0xff : 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1197  		SCpnt->cmnd[5] = sizeof(block) > 4 ? (unsigned char) (block >> 32) & 0xff : 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1198  		SCpnt->cmnd[6] = (unsigned char) (block >> 24) & 0xff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1199  		SCpnt->cmnd[7] = (unsigned char) (block >> 16) & 0xff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1200  		SCpnt->cmnd[8] = (unsigned char) (block >> 8) & 0xff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1201  		SCpnt->cmnd[9] = (unsigned char) block & 0xff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1202  		SCpnt->cmnd[10] = (unsigned char) (this_count >> 24) & 0xff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1203  		SCpnt->cmnd[11] = (unsigned char) (this_count >> 16) & 0xff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1204  		SCpnt->cmnd[12] = (unsigned char) (this_count >> 8) & 0xff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1205  		SCpnt->cmnd[13] = (unsigned char) this_count & 0xff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1206  		SCpnt->cmnd[14] = SCpnt->cmnd[15] = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1207  	} else if ((this_count > 0xff) || (block > 0x1fffff) ||
af55ff675a8461 Martin K. Petersen 2008-07-17  1208  		   scsi_device_protection(SCpnt->device) ||
^1da177e4c3f41 Linus Torvalds     2005-04-16  1209  		   SCpnt->device->use_10_for_rw) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  1210  		SCpnt->cmnd[0] += READ_10 - READ_6;
33659ebbae2622 Christoph Hellwig  2010-08-07  1211  		SCpnt->cmnd[1] = protect | ((rq->cmd_flags & REQ_FUA) ? 0x8 : 0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1212  		SCpnt->cmnd[2] = (unsigned char) (block >> 24) & 0xff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1213  		SCpnt->cmnd[3] = (unsigned char) (block >> 16) & 0xff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1214  		SCpnt->cmnd[4] = (unsigned char) (block >> 8) & 0xff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1215  		SCpnt->cmnd[5] = (unsigned char) block & 0xff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1216  		SCpnt->cmnd[6] = SCpnt->cmnd[9] = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1217  		SCpnt->cmnd[7] = (unsigned char) (this_count >> 8) & 0xff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1218  		SCpnt->cmnd[8] = (unsigned char) this_count & 0xff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1219  	} else {
d597314e1e561e Bart Van Assche    2019-03-23  1220  		/* Avoid that 0 blocks gets translated into 256 blocks. */
d597314e1e561e Bart Van Assche    2019-03-23  1221  		if (WARN_ON_ONCE(nr_blocks == 0))
d597314e1e561e Bart Van Assche    2019-03-23 @1222  			return BLK_STS_IOERR;
d597314e1e561e Bart Van Assche    2019-03-23  1223  
33659ebbae2622 Christoph Hellwig  2010-08-07  1224  		if (unlikely(rq->cmd_flags & REQ_FUA)) {
007365ad60387d Tejun Heo          2006-01-06  1225  			/*
007365ad60387d Tejun Heo          2006-01-06  1226  			 * This happens only if this drive failed
007365ad60387d Tejun Heo          2006-01-06  1227  			 * 10byte rw command with ILLEGAL_REQUEST
007365ad60387d Tejun Heo          2006-01-06  1228  			 * during operation and thus turned off
007365ad60387d Tejun Heo          2006-01-06  1229  			 * use_10_for_rw.
007365ad60387d Tejun Heo          2006-01-06  1230  			 */
e73aec8247032e Martin K. Petersen 2007-02-27  1231  			scmd_printk(KERN_ERR, SCpnt,
e73aec8247032e Martin K. Petersen 2007-02-27  1232  				    "FUA write on READ/WRITE(6) drive\n");
7f9a6bc4e9d59e James Bottomley    2007-08-04  1233  			goto out;
007365ad60387d Tejun Heo          2006-01-06  1234  		}
007365ad60387d Tejun Heo          2006-01-06  1235  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1236  		SCpnt->cmnd[1] |= (unsigned char) ((block >> 16) & 0x1f);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1237  		SCpnt->cmnd[2] = (unsigned char) ((block >> 8) & 0xff);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1238  		SCpnt->cmnd[3] = (unsigned char) block & 0xff;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1239  		SCpnt->cmnd[4] = (unsigned char) this_count;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1240  		SCpnt->cmnd[5] = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1241  	}
30b0c37b27485a Boaz Harrosh       2007-12-13  1242  	SCpnt->sdb.length = this_count * sdp->sector_size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1243  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1244  	/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  1245  	 * We shouldn't disconnect in the middle of a sector, so with a dumb
^1da177e4c3f41 Linus Torvalds     2005-04-16  1246  	 * host adapter, it's safe to assume that we can at least transfer
^1da177e4c3f41 Linus Torvalds     2005-04-16  1247  	 * this many bytes between each connect / disconnect.
^1da177e4c3f41 Linus Torvalds     2005-04-16  1248  	 */
^1da177e4c3f41 Linus Torvalds     2005-04-16  1249  	SCpnt->transfersize = sdp->sector_size;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1250  	SCpnt->underflow = this_count << 9;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1251  	SCpnt->allowed = SD_MAX_RETRIES;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1252  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1253  	/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  1254  	 * This indicates that the command is ready from our end to be
^1da177e4c3f41 Linus Torvalds     2005-04-16  1255  	 * queued.
^1da177e4c3f41 Linus Torvalds     2005-04-16  1256  	 */
7f9a6bc4e9d59e James Bottomley    2007-08-04  1257  	ret = BLKPREP_OK;
7f9a6bc4e9d59e James Bottomley    2007-08-04  1258   out:
a1b73fc194e73e Christoph Hellwig  2014-05-01  1259  	return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1260  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1261  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--/VvwsvS6T57vYgFf
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
wv8DjpQPZBqxAQA=

--/VvwsvS6T57vYgFf
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-52-g1cf3d98c-dirty
        git remote add openeuler https://gitee.com/openeuler/kernel.git
        git fetch --no-tags openeuler openEuler-1.0-LTS
        git checkout d597314e1e561e653a9dbeafec69f20d6b372af1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=unlimited -fmax-warnings=unlimited' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=unlimited -fmax-warnings=unlimited' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/fpu/ block/ drivers/i2c/busses/ drivers/md/bcache/ drivers/pci/ drivers/scsi/ kernel/cgroup/ kernel/sched/ mm/ net/sched/

--/VvwsvS6T57vYgFf--
