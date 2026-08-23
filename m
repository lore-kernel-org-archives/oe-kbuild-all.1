Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAEC49364A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 13:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787491306; cv=fail; b=us3Ycf9BajdPx3j351D238/jet35GqpW/H5ptL77O40s4WnjsLQP7f/5jBNMeWSCON1RnLxLfoGU2iSS95bzcxbPWm4uDbCvNY7GovFQcsmQSeXcLsS6a77G4S5t2EazBGna5rGrWkz56R9uamGo0eJVBSbqVf7y/dZw7gSujt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787491306; c=relaxed/simple;
	bh=SWVTqM9H0egiVlenZ2mEtv8u9Iq7u1EXqKnNOgQLNUU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=EYMLgLS70oG6aeLVhWPbY2Hmv/dtIkH9nyHI8QZPwk70Y63gAs5heKjea/wg4WFfJmwjRJh2ZIL/BpQXCIa0NApjCvULrUWAGW67nQWlyoFXxZkxZ8AUD7ETUJ5yjodMyICC9ZE7ObMYnnhP0lT1oBRoFAD/M3a0xyknWi7+DhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpSc7mW6; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpSc7mW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787491304; x=1819027304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SWVTqM9H0egiVlenZ2mEtv8u9Iq7u1EXqKnNOgQLNUU=;
  b=EpSc7mW6eUTWa/+xR1+/RQkwOndNpYhPGuFFsDn9qIzfeBQSvhvyOni9
   9K4Suq6FAGCYLkpFMMNko56RkVsZv+RobgurH6Pf9YfFfjlWaW9ZbtK0B
   /QSiYwhi7mlN1JA5eeYEiyk78Ij6JYJmGSVG+lmKJrECELsZAzfCUsUn/
   7pglKWEEcaImV/FEJSUN/nKL8yA6r+Nm5+9kfF5d1hD35qCU9I3Pu0TR7
   44lA9x6mS2vGOi5jzdfYGkHEtuQximGp1AVg75oaoaqZ4qqOu2KzXUSb5
   6uw/iB+RAYuLjQIUgN9fjnhEnp1fpAPWAkoPiphLXFy/D7FnRJ1g/oRzE
   A==;
X-CSE-ConnectionGUID: jNUTjSx6TbGwwCoGwKb29g==
X-CSE-MsgGUID: 5vxm+n/2TxGV0jsWfWrWyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87823020"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87823020"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:21:43 -0700
X-CSE-ConnectionGUID: w74wpweET5+Vnzskl7VEcA==
X-CSE-MsgGUID: UPgo265PSoe0fdI4Q6/GfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="263509721"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 06:21:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:21:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 06:21:43 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 06:21:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EgL3fUeIGJIXslC2pSM0t5vBzpS6jstfzbxrOg9cw6V/U2mhdH+NPQMHHcGFy9arOFFcO+iOB+f7J35jQj5aHUvfn2UexuRAE8m1DJMKZq4CVCKJM+tzFz6cl+Y92ChDMMh4vPsrlXAOODFMrSmcQD/RuLJ8o/nfKR/Mp+2zVJj+Pn2HSC2ogilh2/O6gHHNcBffnvymcmRrOzgLinVreUAu0tMXvWuiDw7G96EW5K8Uk4VqzgJtREiI5gFKux+HLBiwqe2aGm3SxHZnSw+pb4VUXJNohVbX+TJZCTBzdqwFi7rC/ix05zmHprruuMlZU3ShGZ4tbE91s7HqkJvoKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xs+uEUtonwSecuh+ZolGCTAKgFB5r0vRhFk5sIh3TNM=;
 b=jeZDefSkEW9VCaDgz8wPMmv1qZQZSiM6UgfgYK5cmkNjW9E+VWuWttgZwTGqxjiLFrmfyA71nhCepax1+egn2CKfHCWBL9hU71V+MBU7NK3+KDqYB11ZeXQvnOCUKZ2clcmxM2tH/wIwe0XcJqJeEPVlD7aP/bmVIi/I32dZKA++4mpfL7SV9+7adWIIv5t+YVpcSxnoo3291hJYKXCND/keJch8Od2MFtKHJVWqlZGz1eTk7YY93eOzQXhu02bexR5zN/QTa2vfcDKOeCfJsBdqDI7XhAH/kh9K/eWlYMgm9NKCaiSVBhg2scrfTVrtvozdtX7+BbtrxLmmFqKKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sun, 23 Aug
 2026 13:21:40 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 13:21:40 +0000
Date: Sun, 23 Aug 2026 21:21:32 +0800
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: fs/file_attr.c:100:24: error: implicit declaration of function
 'bdev_fileattr'
Message-ID: <202608230621.c9CRXHtf-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:194::14) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 39a40701-58fd-4002-43c9-08df0119775f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 3PJqG3MpWbYMs+vyxkSHBx+iK0AZCjQUsGHmRX4O+kJg/JRrcsDxrLwqgNbgam97860aEqXmOB4Q4uF9VJSZyMcFPdnrJ71kzQZVOjWOm/pgtR2KrA/cAdvWYC1aKnevlqKriWvKmx9pRCR1M3dkWlkiAdMm7tvYzOsmbGNXHPwROXGkQynlCjcqZ+Nbq4nySi7IapeBmcPyqh7fPHxNpNQ+WfS9PGs5KtLAfZXeRRh5Fi4UJ2Fl84C3v5uMUJDsbllzBgGfTP2aX/DDFO6gVHyzB/vs5iM8Py+uzJlzLe+22PYk8D1RxaxxTOeFNFEc6GBfzXCB2hF+zxNTuF/I0Q1cyQBkEAIaBAqRn0xSqhajOes1kyoaSZn/hSKj4ipR5Yuidhd+UNUJy3NKszZr+sdEZLGSuOD8pT4os8SneGEB6d7AdwGk6oowX9xXxpvygKR/ubGoneUWWGJbm2/nH0Vlay5rGwvy0dfOavf4TswkPKlUHXACuPUQxgmkB/R5UqwQqwKjDbY0tQ+LSLwGUivAJ+uP9Q7W1+O3rBk0Y/jWE2VQQrouNAc3Q6zrKkYNTAgumJITlZ9+R851OSC6RkOYGE1JfY62vV6OoeEb+VFTG3zrZArymTWkdyEfDkxT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l+i2t5S4dLXTu5MRKCe8wN5wgv0GExJA2URZb0x2Ez7/HUdxp2PYaDlR1x1X?=
 =?us-ascii?Q?5Y8dLCNFOnW+meWskuOpbPlmvK+mV58Hb2lJRZhHovmjFO7zlqMdGX7tjyz3?=
 =?us-ascii?Q?Iva25nUixHlEnECEDeYaa4t72ky92H0X/4msO5WHSB1hfRTCUHcstPLUXVws?=
 =?us-ascii?Q?gIq2p/YtkGLkoXoTwTQWmDKvL0Cgy+4UDJW7twLAUh+VLWeDLVy0RdJFp/mI?=
 =?us-ascii?Q?g7nWtjvwEo1pTJEEJSlrXArlxx5P/LKyY7gu+2inB9vKiKQVIMHi+5DVsecO?=
 =?us-ascii?Q?yAburILnCZ3fl1nohn5wk5+dY610LH5CKR+q2lT2qbO6dwFUvUEAWGYs8qAc?=
 =?us-ascii?Q?g8ZN8a9KeBd52oLdyYtRz71cv7QPFffbHjU3Jke9X4+ZTdjOKUOaxdIcdrwR?=
 =?us-ascii?Q?OxI4uwMTXJWppXCfxAsPkqTwV1uap5Fb7F6SplXM5OiI93JpTSZRBI1NHYbJ?=
 =?us-ascii?Q?VrUmrA+mO9XqOpR7ByHWDajhj3Qw4Iu2Lg7aK1hdVbut4mUvfrCH0o1ssahY?=
 =?us-ascii?Q?sEDIEpAwfRLiewlzfGGRMOssdBvBOOHyYRrvIQjzHLz3dI+pD9tCRAjTQyP4?=
 =?us-ascii?Q?o1YB2qIe4bXFHeiqHhw1l3KVJLjttm8azhjD7oYxf48V6PohAXQyf43xgRsQ?=
 =?us-ascii?Q?F5GNb4KYQfD8QTjhqRFButwjuIdglZox0sMgVSkpZMsozJCK9Q7SEzivgzy9?=
 =?us-ascii?Q?HWYTwkf/+g2TRClJXOGEC+wl8X7MfqkMiWO7il+awxSHJFD/m2TscrsOWUSG?=
 =?us-ascii?Q?oPEQftZWL37P2a0KyJHMsuNf+cnNlJNljN6IhtkpPdI7WChIGKgv/9hERdHV?=
 =?us-ascii?Q?FtTmzjcl0y1Kr3FPNLJAuSvvPcCQM2ilSj1z9yN7bMykEtVO3QkB1wyMrXfa?=
 =?us-ascii?Q?+W8Ds8HiVkUO1COnBeZKJbei+NAl4LyzUR08qmSkRp0BBz09WhKqey/vMdKf?=
 =?us-ascii?Q?lzFQus3SkzmXWI5zmYua3Q03s9AIXMLB5kU+2YO9084IPQAFC2NKlqCVfDva?=
 =?us-ascii?Q?CBZI3gkR0jeOQ+DcV/+F+r/4zdoB/vTHhlQawrhMksTv6vh3jyhLbkOrwOBi?=
 =?us-ascii?Q?j/efj3mLpvoX7tOgkll+IjZPeyYXs0yTxA0F7UBCzn1WJFdgHuncgY5PgEso?=
 =?us-ascii?Q?aUb6gufSjLNgV+f93FLkTs9I8ec67eaifXuWdYM1AcBui5BjZOChkrKG+p9n?=
 =?us-ascii?Q?w2B4St9srecJTuT0uW5S+HHZNDYQA1Dkb98iEY1GNampka98uyRLrZzEZFxn?=
 =?us-ascii?Q?RVdpnwheDdkOV56hTAO+wco51EH67hLzijKy7OtjaXTwenM9qif5HZaZOp+E?=
 =?us-ascii?Q?4b7/oKVTB1EA1XvQjIVBlwXTZ4ofJz+5jPJL142rBBV9jLAQ6aXV+dM0Z03c?=
 =?us-ascii?Q?T5sYIGRq4QKLBCaRSDYwbXvnwuUS4ISmc5kcxGFP4DIOWuP6yP78lq9dcM3k?=
 =?us-ascii?Q?avmsR5J2XMZN0/fBtM9vUxfLckBZdk1LQnH9WhZnVd4D3JZAQu1+gWw7QXL5?=
 =?us-ascii?Q?Dq7iYgJfSOHeGKClglLVXgCJi3WOTGbRnvHFOlUtWaBJXolkKkQRKhwD6MuM?=
 =?us-ascii?Q?BgHYn1qHosmNkBv5U+nVYmi+Q/Rl2t5u4WIeZoaxGSSJ8HkYzoIZlxdb1dRD?=
 =?us-ascii?Q?b8+8faIvLd1DBaP8EXNnz1nCYyXzgtMuZ+Ovwmj2PupZ5CUj4KdqoCjNMUPL?=
 =?us-ascii?Q?QXtMY1PUOM/lWyzruMcFAZENVSnimVfNejLIBMLARitHfVXovxFB2mYr8gNN?=
 =?us-ascii?Q?sEvEQ5ak1w=3D=3D?=
X-Exchange-RoutingPolicyChecked: K42m6UTbktPHVf3sjXZIQLXBLOKJzIxWl8Eo2qB8/Zk/WwIuy6c5x17lNAvZIOR2TUTk//6olArDesNObXj0at/N/heH/caug1AQD8Z4jGq/GTdHGFRqWmlxl/lsEncIyhxw4laCK+QUER5ypNN1V4YnYMiiRzV/MZor2wAAYaT3VJa5UCPDuFC0XeJR3gzaQWPCaXdL/Cklavs9ZTxb91I1mVJKPhoDDO8Yq2m1aTM0ZsB5zvUqcUgZCRI3BekGrorDPz3hHBbh8L4VbkXo8Aj8/AJ8Ktk+m284zUgismEe/+rfB5RArWf3YBW4MDL9eoiYHWLpBm9bsDLjEdSJ3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a40701-58fd-4002-43c9-08df0119775f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 13:21:39.9336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQPJ5xnzBvREKnJY1NsyjWKzMKB1SncGJs42/PPhPo35s8JKWKJSPc4QJZIapCjboWpuMQeGTMlmq0g+7qPaXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Keith-Busch/fs-add-direct-io-attributes-to-file_getattr/20260815-124138
head:   6501161303f993815f8074b592e0f7c264537f72
commit: 311da0a53d527a6287f6d3fd89bcf394c03f663b block: report direct io attributes through file_getattr
date:   8 days ago
config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20260823/202608230621.c9CRXHtf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608230621.c9CRXHtf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608230621.c9CRXHtf-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/file_attr.c: In function 'vfs_fileattr_get':
>> fs/file_attr.c:100:24: error: implicit declaration of function 'bdev_fileattr' [-Wimplicit-function-declaration]
     100 |                 return bdev_fileattr(inode, fa);
         |                        ^~~~~~~~~~~~~


vim +/bdev_fileattr +100 fs/file_attr.c

    77	
    78	/**
    79	 * vfs_fileattr_get - retrieve miscellaneous file attributes
    80	 * @dentry:	the object to retrieve from
    81	 * @fa:		fileattr pointer
    82	 *
    83	 * Call i_op->fileattr_get() callback, if exists.
    84	 *
    85	 * Return: 0 on success, or a negative error on failure.
    86	 */
    87	int vfs_fileattr_get(struct dentry *dentry, struct file_kattr *fa)
    88	{
    89		struct inode *inode = d_inode(dentry);
    90		int error;
    91	
    92		if (!inode->i_op->fileattr_get && !S_ISBLK(inode->i_mode))
    93			return -ENOIOCTLCMD;
    94	
    95		error = security_inode_file_getattr(dentry, fa);
    96		if (error)
    97			return error;
    98	
    99		if (!inode->i_op->fileattr_get)
 > 100			return bdev_fileattr(inode, fa);
   101	
   102		return inode->i_op->fileattr_get(dentry, fa);
   103	}
   104	EXPORT_SYMBOL(vfs_fileattr_get);
   105	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
