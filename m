Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85C83D3488
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488400; cv=fail; b=Drz449hHkqYz7E2I0xfvbsYHA6z78I1898Q6HPlveE9GXrNUW2MGascqlkwKxWjfsTSIWKpV4kh1m/WVLt2WUmK6Q9ZtEGnf0IJR27iO/DI56YkUIsapaY7HtdV7zYvrFBOpAAyOrVwScTA5ZPszDWYlLtPnBOds6NsLRlfx6yE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488400; c=relaxed/simple;
	bh=7BEETU10ypUGQkQpyC8p5pTaIrcUMC9cBbgIhYHm3G4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ObaYiA/ONDKoyVOeJnecyda7L9SqMYDCQcZ6mpaa9U3XnzXjLSMuuCsJYwSDle/gc52+FSEzCHmoJMO0jjVThBQuVsLW0E33woMFtRhcBLmwpdamiDKe4sWZdOffeqdKlt2mI+wnw6YiKHmWPtamdoFkOOlUPNchqa71PuD9g04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlXVko8e; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlXVko8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488399; x=1819024399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7BEETU10ypUGQkQpyC8p5pTaIrcUMC9cBbgIhYHm3G4=;
  b=TlXVko8eOkBxGStctDWe7BkwucXK4gcglcWCgy1HdlC+0C6vAmYn1GpF
   RCjRmyP8HMp6r3UK6QArYKkTrF1cygyAPiXsXS024etteml6eNc4HvFq0
   BldTAlh37DKZrVT5i6F+hgU7cJ+duD2xBgsWos6UDdPFQvShfoXrDAQEo
   yGjqFAssoG9odcTvHzZHb9iXBJfAI7WSIpMJXmLXuqdtJxFoBsZe7wiNY
   DyyNsKp+Zm8kcOtZaJtw2mWXFjpknrUubuytyzkjcjnajzM7Q4/Ou96/c
   39j3KhZaP12kNGSTj12SnsWGV8tHl4xcT35jkFe/xaBXpj70aZ9WLykjY
   A==;
X-CSE-ConnectionGUID: +81l/k0fQt64wpgrKkEBpw==
X-CSE-MsgGUID: GNLN0gQ6RSagfOs2qtxNAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87830854"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87830854"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:33:18 -0700
X-CSE-ConnectionGUID: wMIjBtLkSLCr7cVYgYhUgw==
X-CSE-MsgGUID: SH5Nmjh2SiuI7GmScyIp0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="270573785"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:33:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:33:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:33:17 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.40) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:33:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5LzrraHEQXDHjfBGcW0YVdmQ2+sSwO8z5fC4ZONPIfd5TbaGgB/WLltQNDEuIZ4oDbQz3BKbNgVNEFeu9BNWB3xmpghkKEt/1/vBXs/Q3yDfsN9iylPi6XNW/WpQZl0I4vwKk/FjyrTq6Mh551mkJ0UY057QPoF7xTa//D7YQu5x+OWorwLFFBuFXk6wZUG8TGMDtVod4PJblH+9lWYWam3D79tsZsqmSwegYTz18luUab4wbne9g5TbV7Zq7ZrOPRJ727Ecc6tCj588NmIV/nFzvSePYk+Z17/BTZMaJ53X1kEbBfwJ3Ee9kWyBQmZ5wtS6LzcvNx08j4fggpOfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+5HaVboY1jOeEGpmhCKO+o0j2ImOvWZyWwE6sM8+0E=;
 b=Tr/ZWhLC6aAU6M30yrkjUEtaUhCDr7pw/3m8YVGjf0UOkw1LrGhWiuzRHSswSYW2kpuRYK/zNhDmXBWCPYUJJJ1+UT1razjQ20qcZaCUocusIYT86zrkCEKckr18cQxTPlY1RdZWdOGAZRvX3XJfKhTjgXubj3XdaIu8ak4Yrdxe11kHlt+r8l+AJabcJL07DqJzLWukmZql+hCNnQjLIXg914oFli1wH8gWwY6sWCnNzHVWqaf59XhzRpq7XDACXPcVBGpLPlThdFGmme61fsXVsqboZI2xVGCeEiSgP2jlDVOrGOAC5NXfGXd/fR5B75FpZ0YH4xp5i7TrUqxEEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:33:14 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:33:14 +0000
Date: Sun, 23 Aug 2026 20:33:07 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android-mainline-desktop 1/1]
 drivers/nvme/host/sysfs.c:397:25: sparse: sparse: symbol
 'dev_attr_io_errors' was not declared. Should it be static?
Message-ID: <202608221831.CkrAeAjG-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0034.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::14) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: bb480331-f467-4c4a-0549-08df0112b338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: pXvW9m5SPsvNlMtfaErWU5AK1DML5nYEZtheiFTPpYXGbk/3rCU28tE2c/ibsJ5PJ4nQ3bW4wPj6bchuGxTp7EXu7EVO0V8rOeVmw0LZznroybYJSLxsaf5eA83UpyPG5qG8a4a/I7H/NKsjywQYHC5/edvVqdHAs8WL55glwPLq+XvP9/so6uY4pswhYy7ToSG5CsQPjLWh/U3qWT3t1ZttaZK1JRK00eyD6IVSDRajeQfS5XUcVQgSZtfsNaMT/QBH2hy4a5vr1ndcGtWfHSlDcqZUMG1j6gSINStBG4KbrEELtEeZCMP2yDGRQF4cP2WULaRNkS9aWe1uR+dESGWR7z8PvaRpLSWf/i+IAQtmpAMBRevTyZAZXwzEcVTLbZAZcJS4SThOwpBJWvQckhkd/5mUim3LqKVn98RzyR6/vA3i1ZqNzXopTLcaHw+VYHTsJdSwsA7yDWnYpMibEfuL4QD0AW6fjzWj/dWAB32R6iobFXbaIPtITqrGp/JeZ8gQhcLa4d4AkdQ+QiHuA4gaVUeNJlwdJgsfHbTQR5Vk7fy48oHc5JIcnuCUroU+f6uy5Wu0pDvLpWhGr+hkEkQTss5ffomctJ5D/2Ygxg0A8efFqw6rfsmfSg4IU9WNbAuMkrOPJCPBjItGztbgVl68UtcouJgdK9F8YlNv1YA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VLqy+M1iYg7if7Qk2cfpN0H1P6T44rgnarTgm8lchkm9YvA6uou3O4AyB55V?=
 =?us-ascii?Q?KYWj+qBmqTygmKVwPJjgHWr6U7a02QE+aousTdA/e1zpnMRb0rVjhFyV6uBh?=
 =?us-ascii?Q?aGcnDmpcKzgizXi+8MkBw7ofRBgPUgkVUljq9qVK2OGNXJSoK1PTAyP0D5Da?=
 =?us-ascii?Q?9nLXekPx2AQCumioADSh2B2BLKU0NuA4MmnNw8Sj3R5FI6r9NoCKde4ONqTy?=
 =?us-ascii?Q?Z9hQn3AWkyKuPIIT+vpSr56s/Ae3qiqkvQcvUXy9StrbCManE0g5dnMM99+T?=
 =?us-ascii?Q?h1L+jqGkV7EU75tgcIxNscbejkOdlt/SC7zl021gWtPyY9XoemUF6i3S2xTk?=
 =?us-ascii?Q?F93tg3AEi6+oMUNOohQa06hsQGEs83rXzD2Tt0Ub1fpelW8DwypJbN6ewWgv?=
 =?us-ascii?Q?zOQEl9zKj0uPkSnuiuYiJPnW7APUfmOiJo2tH3MbO5pL5awNzS1DA97A6hpq?=
 =?us-ascii?Q?lB+DkgAcFfD92RlZMkgAbrx7FOpTfa+mgMvgOUhFx6zmxGfWT1kch6m2vzUs?=
 =?us-ascii?Q?KJhNyQOxhx7nPJKztCf9+YYvT/ByKji1f22bKktMZAZ3tAMD6Nsr1XIiWmkt?=
 =?us-ascii?Q?aqdyypI1VSlxmyzvxH4dmeSuOGGuqmokUMsxJmm5zv5FUMHxWmfEb/mudQuy?=
 =?us-ascii?Q?XvcrRig1PKKwDHtLCxmTyfDZCpmA3HbTUVuvDEYkgEyyKyIbapgIRt4fEoXJ?=
 =?us-ascii?Q?G7Tlyfci0XXoUx9uCg3502VoJtDYVjUSL6UBAi7dyKsi7WHwB966aflrR0Si?=
 =?us-ascii?Q?1mwbtMyhyazEWl3gD6yM9nrYVHU+8ZF8GMVXKi4jBzK9r8nz/covQTZ5qTh3?=
 =?us-ascii?Q?mxUINtuAtxMUKHkCD2ski8DjXy9Y+m0EcB2UtBLT7ETpYEBsaj4uwo5m3hdR?=
 =?us-ascii?Q?rw0g0CMdrZIF6naH/gmtZbyhgMJHBxYd+YcBf5146RVLdH7FZvenk35qWF+g?=
 =?us-ascii?Q?vMKuYXYrMm+YK4Tt6LCgMc4dUfXxi58IjntlRIKb+IqwZ/QFkKRur65sW1aq?=
 =?us-ascii?Q?ACkWf2k8HzYvdhKBjpRzrUb4ySJX1t5vsFq6/pqjK1Oy2ny5E63aEvmjXeXY?=
 =?us-ascii?Q?dJMxwxwqzal3KL3V+x/R9GXdQEcZtkci1IdLjxsq/w46LW7fjeJUYAbrNVfJ?=
 =?us-ascii?Q?UQThlZGXSNbVdYtvT5BFSV3XV1iDNYVD5sx6x4L1cjv6rVuhiLNZL+7moxfP?=
 =?us-ascii?Q?NCn+LE6r+Y7PU9x7fMVpg2Ogl7CJV/S9N5nSosrWaO+pJEdP6Go3oOflQP6Z?=
 =?us-ascii?Q?YKeK8DTEjIPJmpZFXwzlz7DvQYDPbtZieK4+0DHCXmkFp4/9jkKrlXF6wwjm?=
 =?us-ascii?Q?UJTyzLNfC2CIVC4b6fccijpLoH1k68kRivsNCPgz/x5Uh+eyYusKcXFPfpHn?=
 =?us-ascii?Q?C2F2UXcd2QQlwuK/v3bBIt8jUnfwW5cNom1qleRXpyfCiqQfGgzsfhGTiApf?=
 =?us-ascii?Q?Bd3ocqjpj+VYO6o05rEib31U82pQMS0hvK9hgENmkTo26vFRAQlyP5atbh89?=
 =?us-ascii?Q?aaUPGRwwLcKNy9f2B7b9l6FsSnhsnWPbG02odVvMpcmLLbUeOdNa3JXSxMNS?=
 =?us-ascii?Q?v1rtnDCduRw5g7SgIEIkX7ztJAUZzx7V38C5cnRlSFiUovThLgeKAFGJ77hQ?=
 =?us-ascii?Q?RcJ3kT67jzHpxt5DGreg3HDaKj5SxdZzmh9XPawpmijxTOIL2VEeQYqXCCxm?=
 =?us-ascii?Q?1tCiuP++y6/uvevgW7HKJXkSwibFSV7sQOJN4ynFfg/hH4KypqvAWq2+Xk4v?=
 =?us-ascii?Q?QyJM1ZiGjA=3D=3D?=
X-Exchange-RoutingPolicyChecked: I2CYButYaIr97HyFvqh4saAWy44mbVzt7snXAvPJcRW8ppiVbik79BPK5FQ9h08ESOcQZNnqO289dSD//WYaiI+OabQTvJXHr4t1Cg/EN+r7QEPeBed366dUQ+Crc5qM69xkPb6WNpSzhNLUwfl+1U+Kpg7iOKFCFUpJZsix2Gig/tU5+YeSa0qG1gCMnczfqaO81hRYXJcYKNvBP447fneQ8n+gme6ewahpnez6WdztqbE/IaDug8lp2V7NZQ48YsPCt/EGRhyuDnsRvUfJyusbaQHgKS1ELV1+iDlwLYmKP5LO66NMgGsM3KLadT+6YXINIfkjuQlRwBaLGoIM6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: bb480331-f467-4c4a-0549-08df0112b338
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:33:14.0026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDd8mBTIHP/pwO70iibUFdgFdHzJ8pjevCERWFqTMC6tEBN85VXvt7OnL1bit6UHGcjSnpLN8PReE2y8JLKl/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   32fbb9061c7aac9d3b2343d85e199cedf31e1f67
commit: 30ab37a128000600dcaae2b35d4a594e304dfe7e [1/1] nvme: export command error counters via sysfs
config: i386-randconfig-r122-20260822 (https://download.01.org/0day-ci/archive/20260822/202608221831.CkrAeAjG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221831.CkrAeAjG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 30ab37a12800 ("nvme: export command error counters via sysfs")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221831.CkrAeAjG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/sysfs.c:397:25: sparse: sparse: symbol 'dev_attr_io_errors' was not declared. Should it be static?
   drivers/nvme/host/sysfs.c:434:30: sparse: sparse: symbol 'nvme_ns_diag_attr_group' was not declared. Should it be static?
>> drivers/nvme/host/sysfs.c:1140:25: sparse: sparse: symbol 'dev_attr_adm_errors' was not declared. Should it be static?

vim +/dev_attr_io_errors +397 drivers/nvme/host/sysfs.c

   396	
 > 397	struct device_attribute dev_attr_io_errors =
   398		__ATTR(command_error_count, 0644,
   399			nvme_io_errors_show, nvme_io_errors_store);
   400	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
