Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8193538B3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 13:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763473398; cv=fail; b=VB373lbTpJi5ZhzDil69Z1uP7RJdm9YZ1GLXlydVtwOXuN5GXVc2CJB/9Z7XgF0+G7i431UtZgZb0MCaC01aUgSBmWsOih/oJU1CTiJ3GZl5iN7MmmGoECpid7SH4l1VA23B1HpTp2KrxdPv6lSTfsPui8WCBOOcrmNLASKYBjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763473398; c=relaxed/simple;
	bh=bsY536LRPEDhvCZKliPDgkysQX4EfyaePbvxCCDrIM0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NBlUu0A+m9S0sMCgDHvNjD9oRp+c/OTKToghMXE3E7qeMgpcvYjeyZM4xoVda8a/P+C102/d4IeoHpuRA2vyfyd/qg5J0E5G2+3C/sLEyARDT/z0bs6IYKz9dJNWO0zcpsPoKCk/RwcvQcgSaLj2Jcl2h6cPE5Vq4l+ffkdaWTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lD5Wpljq; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lD5Wpljq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763473397; x=1795009397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bsY536LRPEDhvCZKliPDgkysQX4EfyaePbvxCCDrIM0=;
  b=lD5WpljqEkQc6eXw1k4Q+2UC6EmeDDKuWLixl/gECiHe1pUT2nkXlf/B
   zQgNOLqLRUu3YbKAGLMZ9Lr5CoySr6D3L3M5em/8zRymCUSXN3P5fUsw5
   wGbDZjCzqVa4KpQehBK77bq2ntKLIA8o14Ypa6C670m4Bzd9MmYgURnC6
   hmwsaKvpqACPjRux2HYurUz9VnHOfYRWcerCqCTKZj+eE7Av/tLskXPl2
   3fHE/y9Qrf6HXFWAZ2jYXi7Me6fHrE01fGcxT3s9RRf79Cp+n95I94CjV
   tdEM3v2nGXJc1Yi6qe87V93ZIqpgSWw2U9BVRaogG/Cg/P4mNBHJyCPg1
   g==;
X-CSE-ConnectionGUID: fkVs25xbRe+KepgHphFFMA==
X-CSE-MsgGUID: xUILOoA9R+e9KMPfJfU0WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="75818659"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="75818659"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 05:43:16 -0800
X-CSE-ConnectionGUID: nHih9XdqQNyfVEBW/GTEkA==
X-CSE-MsgGUID: sNOkOlFBQbu0EOFjDtXeLw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 05:43:15 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 05:43:14 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 05:43:14 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 05:43:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kM+WF1Jh1UgyBBhV8CjZe/1iLzbn2yeP5CKOyTCxsL4GX+lvCBhiGVV2LNFuPEe/LXXvpj31VbUYxaqqACPBCIDrhvR7fmOgCWAt4zjc1/kzPIIR5JF7CbTHKE5ipvT2oZTAKlKtgRuc0ihPuti3xcjgptsp55tbwmCv4VIK1/8XxlODB4yo4OizlJxb6U+rDewL1Jhp6qWUQ6FSOjVGpPyQlF2Px2S32/dKsa1ykyl4XPEB7Nxw119llCTMWa20mJqOzBtMvHFlFghyWodjn4ixdKTG0RQDR7nF3mCIzSzCx1av9S1zD26CXSn/5/Mnv3fFZOvy53Pb/XT4V2vDrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2zOq2f0/sORZtzfh6E2gSkrSYVa+2+hM/75lKfYGos=;
 b=vKlY8VCRDH7P8T8A2Jg72MQGeXcLsz5Md2EpIkn4ecKymTRsiE7CV5ILcDjsR+ewVfujClW4Xm0be9OrTZW+N2IjbR6CGNL6ZCwDkT2hJVFlBlZH6Pu01bt74pcewe+UVrvehJ11Xj1v0Rm5ypVfNaf/Ql94yOi4ddbVOZOwX+lDIqiIeojXG0eFGHcJXDxBGb5QP20rC5bXHG4pw+6J9KrwO5x0A+4g2JbY0aIOTalxKuIzjQmNujv7zS0Ku0QGvV70s/YwSZe1OZfhtEsycHdtMo3o3b+V/RC87Vg35E4VosDcNMPAgXZOyxp0D4ODY+gl44uwA/F/lsKDuJ0OHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by SJ1PR11MB6226.namprd11.prod.outlook.com (2603:10b6:a03:45b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Tue, 18 Nov
 2025 13:43:10 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Tue, 18 Nov 2025
 13:43:09 +0000
Date: Tue, 18 Nov 2025 21:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Richter <rrichter@amd.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [linux-review:Robert-Richter/Delta-patch-of-CXL-address-translation-support/20251114-170752
 1/1] checkpatch: WARNING:BAD_SIGN_OFF: Do not use whitespace before
 Signed-off-by:
Message-ID: <aRx35LdJVJ2lKweg@rli9-mobl>
Content-Type: multipart/mixed; boundary="eLfOj1b05o4yT7rA"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|SJ1PR11MB6226:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b38c57d-c1d0-4c45-5075-08de26a868e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|4013099003|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EHWLBB0YUem/drLmN5ktRYkQDJ9ef1mwFz8fh5b4qr4IBBapN3Mk86JJ/zJL?=
 =?us-ascii?Q?H4t85fYh+J+DuhaIxu2uRubNpXCFAlmxBOPQR1o95K+MvFw95RAY0GjqOvqn?=
 =?us-ascii?Q?CUYspZayq8KMyryCWjrICTls1iVWqTPSk+uPeDxbbH5q3Nfbw4FSjFxI3JK1?=
 =?us-ascii?Q?UfOgZ2nf1/+UuU9/DIhzZZ3fcOh3F1H5ddQWS6DYaK8bfagtScfhSG23XTq4?=
 =?us-ascii?Q?nPSxLpcJuOhvbAG/ChQ51BKXS5zw55VgYCF4STnZ9k2CRMOcX5eFVytrL89E?=
 =?us-ascii?Q?3Rfe/A54lavzKWXYOLW2r7dH6DezXqtdY2X7B5Q72QaG/+mIcqadjRN7NDcb?=
 =?us-ascii?Q?lWibDt46+o1QiMrBt4vFdmZiqnaYv45YqCGasuj8FNwkvKNX19MMRVJ5TTq0?=
 =?us-ascii?Q?O/bqoakMbCs9iwd+J2TLbsTqDDRoxMRFRgZehDiWsFMEl3Cf1CBPKyf2jX54?=
 =?us-ascii?Q?H7NNibxKW99GgP1sGbSDdX8FfDF77OVt0BxCsWmnZJ1/NKTVU+UaEG678jlJ?=
 =?us-ascii?Q?xiZTJGJz0/Dr74CowAA1ZhaKUU4VG5BjFIwEFZirw1H3aQ2cPwaIMFoiShSz?=
 =?us-ascii?Q?ECQcnawKkGZey+TQqtG2tJzO/S1ivHHsOnDThd+Klq5XRRhus60DECxg/GEw?=
 =?us-ascii?Q?Weo0xBTlns4PX48nzucsnD/30kKhn+o3JAGhJoDYYQEeGGJLxditsVH3oROH?=
 =?us-ascii?Q?miv8t6kNRso3XyhC58Yb2j+DUT/0q0EBYTQKrVryCFXE88lLHoKpomlanCei?=
 =?us-ascii?Q?PmwBmmqyFwSxAWRFEW/AZMnNUqpRDG5fiP8f0kU0lIwSrrKRjyhd1RzsjYC5?=
 =?us-ascii?Q?tWsntLVbeYwoDdzNKy8E+HRQicBljqeYwzvJllAPNUHveHWKCU8r+E0OjoDd?=
 =?us-ascii?Q?rlK507LBd3XEhsgbh6v9kOO3H8K7FkfPmKo90k2f3G3kYtznZRQ6oenqA3lA?=
 =?us-ascii?Q?PMERQnlQyul3CzpShpkW/xHd5tUkdsNdc8aY86pyYg1AtLKw+routXv1E6oC?=
 =?us-ascii?Q?ofBlABWP8hF2TMcjuaHqKiPUvRUCkzi0wWInjJ6f40aE9NCYij7YdhGKPzNT?=
 =?us-ascii?Q?NE2+ydk3ajgJ4FJm8k6UirDRGsljL5iHk9b18HHIkq4afS9ovsMJ9AC5nErv?=
 =?us-ascii?Q?N413TKPMNOXvbDgU5LDx38LEduil6HtfUoT/0eDNOZR0OVYD162MY1Y+rjls?=
 =?us-ascii?Q?C607Gtt2ureO6LW/xjbsRHmiLSZTinFf6zS7SeW5SXL6Il4iArqm3wV6WTYD?=
 =?us-ascii?Q?eODWgcNtlwJqL0Rdi2DUnXShfyu2aGrxM4J+pTZzJ85GnNWEpQIENCuvhtBa?=
 =?us-ascii?Q?u3D4owCZxohiB9K5zYfjlQgPeSDqNdusNbQz4G3sAnDzTxpzre0THFKWqk23?=
 =?us-ascii?Q?6dqzm4EPJSphU9wBk3GDmWTPI2HXdR5lmYqyKt7Ud9ZXZ3HdJEOBw7WasE88?=
 =?us-ascii?Q?K+fWBX7CUR18MliOVutQuzKPQ3cLCCPmIP9ISoLAKXG8PcGipfql8A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(4013099003)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U6EvN46XCEfhEvwSxeekq6bAJi2ojkryA91MymUd4SegY8gfimix/0OcJuIh?=
 =?us-ascii?Q?vw9HS1LzDZ39prW6BI+AhdTKyoqTobkA6SLa+nYF8L2Cml1W7DeCSNCmuK2X?=
 =?us-ascii?Q?Ua4rzaoX0Oiemlu0U3+wSc+nk/p6TIP4Ccg2gY61D4yDLR3W048JXM5fpVHS?=
 =?us-ascii?Q?LZeDoP0cdfs/8Nvd9lNc54+mvsogOj7fvJPdKSucpE+fNa7nqMKT1hrc1O28?=
 =?us-ascii?Q?TpYbz888BgY/BYfKNTUFs6zL226NpNE/B6QL2bOJWDuVT/XzJRkgcrYh5uIE?=
 =?us-ascii?Q?QRwgaWDFo09KxfxtijGqs1dJaOTBxZxBXjnYKCdLlaRU9v1b3eWcnJbLuIxN?=
 =?us-ascii?Q?Ae7vXiFc8kAV4C3yrGOVL545M1FFPPpqNnx5KBQbxMStx7US6I0r9eFe78Jx?=
 =?us-ascii?Q?7RsC31zogPGo3MRwGafCXsy+6Ier16Tx3yk9mp7U1Dqh/vAFZZPFLcm1GOp9?=
 =?us-ascii?Q?VXqkgMgL/x/yf5twwXEAnLVfUo+XXydMqrqA5AgP2u3ZGysAZMb7xdHOHXBO?=
 =?us-ascii?Q?E0NG1/wrDQRwlXui3qW6jKD4WAxm/VeXjgjwOwYzsxh6mg3o5fvPCmOHzhmt?=
 =?us-ascii?Q?ZrEO9cODhv7grvrxMtsPMa3JoX69iq7azZRYGsLyj6XUFfFbHNl8dqkmwtQA?=
 =?us-ascii?Q?huSx2hkcnH7SSYP3YmGHQk6DqJU941JaT30IbRdbAzuEO1+mwXJkFyJrnanp?=
 =?us-ascii?Q?BqiuBOm6nIbT4SKMhigvqf55FXLMkbgQt7veS1rEeG0YfYi0k9e5AF91zUsz?=
 =?us-ascii?Q?XqvJ+FlxAEngzVrTsfzFor/biUUpH2vKzSuY1zuws9gfbrvpBEGLNyxnVxhP?=
 =?us-ascii?Q?ZCweuqjn0xN2Pq6oRIVuH7pKdFGx2xkgcAADW65PNgNNYxFx9I+L6gyFIFOJ?=
 =?us-ascii?Q?qRcDne+z+32CXmOCpsJrGaPm64//2LyBXtsMpDB84wmL7M0lBIbwD0toguQh?=
 =?us-ascii?Q?8UMdGk0xsY6YVSrA2UIfO5JP53L1HFiKmSV6v+FL3rGSk3PDHV3EBWiEgcWs?=
 =?us-ascii?Q?IfRbc3GddQF/caGVaNA6RBAi7FsjkQGivz3NH5BELGWan7gOWiDdb41PpF/v?=
 =?us-ascii?Q?0+TtNDVEfylGJ67J5MF1Jxtw7ZrWfaTWfGEi51kOgoXQnmv8ukplewyJq6Kq?=
 =?us-ascii?Q?kMtL+R8wXfgU2XyEOUcVbfG5K6web0wRobgS3RooKg/jKzL0caya2QtXrYYa?=
 =?us-ascii?Q?ABXzy+JBDpehZMAYI35uJd7WtiYB9ltMtwob8PHdRDYVIpfi+6P3ZSsJmtQU?=
 =?us-ascii?Q?uUbqovAxHHIgduE70TKU9apW/9MVVk4dOFYQIOpcn7OEPmS1V5xKWUqVBvXM?=
 =?us-ascii?Q?Tj7vGK6am9hUU8/E+t3Kgs+He3oLnA7K1KXVAV3TOYcRz7hlmMgFPSiDFEUN?=
 =?us-ascii?Q?gVkeOaVoWL4wZsfhG8W606Lqi6LG/e5MOu5bKlIvRDKEnn20Nh6l+OnugoHl?=
 =?us-ascii?Q?C3BefSa6n4FCIsMVnrAmCR1UpvmG1Y9Pma0/qKu/1FwjD12bmbKUFUVt/CtR?=
 =?us-ascii?Q?rcM6kOqti4WMpwBkilfhtWQgPPAndEHFBkFFeMrzPyXxpT3sni7h1K+YE8IR?=
 =?us-ascii?Q?37aVH57pX4zlXtuFbKhVqf+VTbSzpUSyFEoPIyVr60jLAW1/udmY76FvTgMO?=
 =?us-ascii?Q?mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b38c57d-c1d0-4c45-5075-08de26a868e5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 13:43:09.8942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7PqFoSO64Q7MMv1t88B44ShoVO6cRnp+2FSJAJJ2U4kq9gaxc6m3Go4MWd9HDOzqxZcEI9w0lGqmpvu4Lt+33g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6226
X-OriginatorOrg: intel.com

--eLfOj1b05o4yT7rA
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Robert-Richter/Delta-patch-of-CXL-address-translation-support/20251114-170752
head:   9574f124b782a3aa2d34e54336197109dd807c38
commit: 9574f124b782a3aa2d34e54336197109dd807c38 [1/1] Delta patch of CXL address translation support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
reproduce: (attached as reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Do not use whitespace before Signed-off-by:
#21: 
    Signed-off-by: Robert Richter <rrichter@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--eLfOj1b05o4yT7rA
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce:
        scripts/checkpatch.pl -q --strict --no-summary --show-types -g 9574f124b782a3aa2d34e54336197109dd807c38

--eLfOj1b05o4yT7rA--
