Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE1FF9D9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 03:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769223936; cv=fail; b=jZy2+dPL5UUGEYDCBPF1jUWzHWWyLU7yk8hv6b0TupnauVbQTjhn8EsWJFziS3HC5Bwzgk4BfYt81Q6ZlEdTEOeiLCVN/8/ncfd5VOtCog3Tywz/gBU1VLCNWp4UecChdBP31UN2N9smlRk3zlzvEgpJFpt7eoc5/Lmx87rFoo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769223936; c=relaxed/simple;
	bh=Y5cO3PyaUucxDC9RUt25IGRKTdEnAez3rdO7lQnLuRY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=paTUXO+f+5uJ7SrhOgx6BMiTeVwwVBtz+qyTj1yNb5BoXFOmgdsmscWRSKlcDegLk/qdGXA8pbpU58ydHWun/rC8xY6PBHGlyQQ7r7eQkcVg+pmG9Iq0Vpfgx0M72d/hWFZjBT+0kHRg5uvJVBFQtCRKDi9hXshtX+5aWYjnhR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=juc+Xu+d; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="juc+Xu+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769223935; x=1800759935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y5cO3PyaUucxDC9RUt25IGRKTdEnAez3rdO7lQnLuRY=;
  b=juc+Xu+dpCq1OjAw/mMDaDyI+qtSyRDe1uLUgluvHGlMJbBo1lDOo83f
   XTo7PAoupmOg2CWj8Q0nMja6H9xystoP2woEG0tffZAwZ6CZS1r4pdu2m
   cM79ZX3ws/hSFQj9IVnnN4fCyyB5PRdPEfe5STmXzF6Rk3s87vXvPcroL
   j45yZYaK+EH06XazEcNNycC/sIztCnT9Au29FEpa8SCiwf7urgOzAD1/d
   hBUqx+beWZtwNKzbs2z1zkxQmCDllIINfp38CjvjSYOKd0NLDLrFiHki7
   cItpEFueTB+ZSf4G+4UL3R3wLGLaI7O3chVnllPbaFzhSxLYT9dgu4jTi
   g==;
X-CSE-ConnectionGUID: OKWIQLlbRo+hjljmhdUsEQ==
X-CSE-MsgGUID: 4p21uTm0SEWdAdTLegRvQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88051287"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="88051287"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 19:05:34 -0800
X-CSE-ConnectionGUID: 3eoMDecXSGS1aiwXNDaivw==
X-CSE-MsgGUID: yeJlxI1tTdmyskX9L2qHlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207221089"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 19:05:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 19:05:32 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 19:05:32 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 19:05:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DIfcG0A7hNMp1CkLsJk5VeBdS0smGfTLP5WPViVWRt/eLiW9wE1yxrzCHzkyQmyOW86JCfAuMIY4T70RcV9Px2psOZqH/n88B5Zw4jWCrroHXtBqc4/LxfoLTECPebEVQi5tEf4y4XyoWfturqZ9AGkDytA9CfgnHq6M9U7XBvEZKvmsngCLtRZiGvjM81YMK+HzPGuqGvJkrHo5LQVqYoEN8yp+4dgzSGrnuc7L79De9LFs3KvMDLsv8KNn7KxLgJxhUvvyF3T7EJpND9ZpOmPxWqicFtjUrba+RwWt/4b21HB0xDtoIvakPXP7XzLnQd2fCCT1oOXFLbtxAPQO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrV5RafAYp+M7icP0w3nRi/jen9cjMDQVYWZBVRzmV8=;
 b=KIyw2Nsy4ZYi1DAMtnR3klLmPw0S34eSioqzwdEXJFnmPpofVsme6PfBk0pTRZozDerr52TIdLGe4Az9Tgqctbi0KSR6Ld2CeSaC4RUm63+t+Zt2Zo2wkkBn3xiTxgpgyisBf+13PCnjO1K6jiCLU8j97ZCU776vwQWdYzzxJuN+rCjXwPcVZDGSiehzt2TBxGaaY9uGSzoKQDnr3gRQrznld43xbR0/kT0k3eMTAV4nrsvgiKJxZsljLloggtqbNLXjl8VjlruvKCd/Q0UUbdG2GyirFYGu6qpFcv0d9SzdR257Ey3C+/a/N9hWvTyCSmbJPpbQODs6SHgonNCJZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Sat, 24 Jan
 2026 03:05:30 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9542.009; Sat, 24 Jan 2026
 03:05:29 +0000
Date: Sat, 24 Jan 2026 11:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [djwong-xfs:scrub-syzbot-fixes-7.0 11/44] include/net/sock.h:1918:2:
 error: missing initializer for field 'dmabuf_id' of 'struct sockcm_cookie'
Message-ID: <aXQ28XNRTw78n2f/@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|PH0PR11MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: 98288b07-03d5-4eee-5b05-08de5af56e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4xA690NaggeD5cc8twDi3cFy04RCR8T5Y3KrkvgvQ/ppXn20DXKwRh0Pa7N/?=
 =?us-ascii?Q?k7s0w+NzDdPimOqifRCjSbggPz67ZsCruNBzSER7HgC9InwWWEwbKnbIV2jv?=
 =?us-ascii?Q?7c9jfXFTP2Ml3PYmJGbMrOyHNP+kneUA5ApTnkGsSiJgr1PEM0EhRLh6NsWJ?=
 =?us-ascii?Q?T3B9TIMK44pYrb+HmzJ0LKvR+xZv7VXQmzlPlxT/fyeCjHG9xndawkYuts6M?=
 =?us-ascii?Q?8ttYlMGVsBN2se5rnY8C2cqxoUt6jTkpBWewPUI0nQB9YNt5MyYESxnJM+VH?=
 =?us-ascii?Q?xofnfZq6a4EOVCEDpA3/wleYMlUXDHozwuGqEhYCWFlcfeqx9HlJS5ngwE/K?=
 =?us-ascii?Q?XgO6+kp0wWhf/oGyqyylt9IjdN7Yi3DBlkjYacSp2B8ZmapLs8iWf8IYVKyk?=
 =?us-ascii?Q?HHxpCvB5q0ZP6M7nSc3iymv/BZqLj5IQQkDEdWB07TmVrDGlT7psKrVQk0Im?=
 =?us-ascii?Q?jiSaYJgCu7ERysZTKq47JIg4LBvooA7vHhmaiVRLLaDcpI1rllktd1dlWnNG?=
 =?us-ascii?Q?8LACw7IDjV3hLZ6XeEIhkH6KF85Jbrek8SKT/9+vpBtDeF0ciLf0DDnAcTLb?=
 =?us-ascii?Q?VxfhxGRqaDFG0c48UaSnJ23GCt3fd4GWajsvVHFGX0W0DTb2C6DkJuduP/qx?=
 =?us-ascii?Q?X8BX3AvkWcVN++FJWOEoVQfaYS+SoOeYk786gOYnA0lvaaaYBW6pifw2kK+F?=
 =?us-ascii?Q?PMt3NYa1T+6jbiAK4RC+GxH3jP7Bdi8KMdJAGm2T1saM7Pb99I3w4D49DDyM?=
 =?us-ascii?Q?fDPnTLKAI9C1ZZP1TqkYaHZO6YoY2nSda7eQ7kkYi5SUb64QEwejHtHey37e?=
 =?us-ascii?Q?Yo7fAMiIx+JjDih/Ghdczabyh69C5e8G6tgtxzrKCTQ02BcZ5B32E0vCVJjj?=
 =?us-ascii?Q?U0LQFSVOxA9/2yCoRTIjzPwy/UoItzrJNNXz/6QJpbjCIDCyHIn6vsG/XwoZ?=
 =?us-ascii?Q?p2gtRrOUWuL6bnBu8UM4AeR9k/9QYGFH9HbefH5SpWkjiYx6jUV+/LZOS/ce?=
 =?us-ascii?Q?mX5eLiTWHHoumkZzsxw8fPjBJ/mJwXRv55mEYg6YIVEsPEN0788y+7IosaDA?=
 =?us-ascii?Q?1ku1udaQAjhZMOWM7elo8EqD+Gc+Gu/Wpa3FxRyG9Uejl3eljr2UYotW6++6?=
 =?us-ascii?Q?JAHgyA5YSuWKohGSua/Av4rsMNokwUIObRXhhVLa4eGtC11Yzp2bX3+FRoGU?=
 =?us-ascii?Q?iuPuzYaNWPmCi3e31GjPd4DQBPQjzdBb7M6Ii3HgTvwlj7RetgkM4a5K+Wmr?=
 =?us-ascii?Q?oK4inUur+xCy/vOQ/Yh+R+X9CArjNsnE9qVmSBUEngUhnQCX80NkNSbMTR2Q?=
 =?us-ascii?Q?Tzrev0WQk/3tI75sfPDycJSHFaSLIjwab194SEfoOt5tV9TZJYus0PKAn8cy?=
 =?us-ascii?Q?p2bv5L3s+KC0sYibhB+Ksx3Ut71QuY0K3ORkTjbePsZEVff5v+NyfLS2KHdA?=
 =?us-ascii?Q?VO7ccfW1d0h1r8wGw5rIJsw1PGHpb53y9/gm6XBfADmb8zGj1yEfK6DWIZf1?=
 =?us-ascii?Q?Ot4/JNgWq5sc+4eILXmGE3Tp7gZNw+QMRw4nWDwRbG08SVcNqySbmECjFMdQ?=
 =?us-ascii?Q?fytmTaIbRCGKWKKPTFvhWsrxpcBd3Q3ECSrcQzaC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?84fFDmC1dFBmI1bAY14BY4jjZJKKsiEC1sIoVqNPGaFnQlmTYU8X2MY0Adz4?=
 =?us-ascii?Q?6JqUEtZ11NmNmEQPwSy/dSSU5dBNqUpC0f1A6PykdBDnsmvyY1KbvtzyEX8p?=
 =?us-ascii?Q?E6Mvzt1JuWzQFShRy0nfrHsnjkEXnt6l481tfCiyr7UtVgshbmBfIWgdOta0?=
 =?us-ascii?Q?D9SvhVBwcLQ3BheD5xwBAX22/4jdeHuAiERyQsJtmh5mAK05mtI952bnvIbL?=
 =?us-ascii?Q?jvzz7T+IioRy/8AYlPdU1D59Qk/muBz88jsn4SUC5P+iCNN0ZkH4voEDFGMG?=
 =?us-ascii?Q?hoEpI6K2SdntpysX1E8ASJ+RSqZZCUoaO2E4ICuGmPbLOyu1/sP2bDa9cnXj?=
 =?us-ascii?Q?MKPO8wN2DqHsr6Sz1IoAFATxrbam0HZsvgSJukeFSXlqCc4lad0gNTBePW7n?=
 =?us-ascii?Q?Heydg7os96hAzSp9S1QBQh6Sm5ZKMBBuc5nQCs5bSBs/CtWLKz6NHxmOoR+y?=
 =?us-ascii?Q?ePV4HRIOMIV4nVE+tZ2Ni4nuwxTNTh2t3X8VovYkUqqqoHHvkJMxXAFJ5WFb?=
 =?us-ascii?Q?rD55Bh5OHrpBbRtij1pwwOA5qpb1Oj3bFcbHNo5h1bnpSpCzLhwdvtME3QSu?=
 =?us-ascii?Q?YSOLUf/+jJAiJTqBMDtauYSwrsivTDB/Dn2EMOFDF1sumOzqsV0pETPXpxCO?=
 =?us-ascii?Q?T6+MsF3cWZLR2sUT+K3bMYzixsAwAtMSCX+eEpO8Hgc44f4Wg0mefEi/tWiJ?=
 =?us-ascii?Q?UUeKk4voaOXk6E7AIslf9N1Ug6qes0FzRdYCseJHuRAioPaFWeVsxkHjrfvz?=
 =?us-ascii?Q?0qVwFC5sRhJGgiZN9NBf1aGdEfawBeb4R0NwMRZwaU8HsNPGxBHlKlgaRtHk?=
 =?us-ascii?Q?7+T4NSBhUuAsrD16TK/aFeYeCcIpKaTaRpR1ldqHRx3bbRryusYBxdLvUH2p?=
 =?us-ascii?Q?3QCCuvEOm/p2H/CjEEDyBW8KI8AGFkU0N5+prxwaE5vFmkn6DM4gRjpgq7lv?=
 =?us-ascii?Q?sTh34Kc1ESUBV3e7K6CRyi4lk52kpO9bDSy/nB6ul/axY2mWaAoRlXBTsy2e?=
 =?us-ascii?Q?Yw3hTr4ioG0Byu4YYN6qbmj6Wn6wWSLFUwQo6H1xQJ2FmrxFXpqd7WldQpKB?=
 =?us-ascii?Q?E6YOrh897hvRpX/ByBt1zB28rZnHSFWRCzzAfSlHv+APd+Xls6IzDECY0ovg?=
 =?us-ascii?Q?fVSwnPpl7izG0VD4f1U7rcxS9REI9fYVLSFaYKzMhgP6uR4bYT5hLXJRDtmc?=
 =?us-ascii?Q?xYOsmP+z/9cyU6OnH7fQD9qIsNew5re08d/YLUDf15fSIWiSme44C0Mxzc1U?=
 =?us-ascii?Q?Zj9F1eCRgMNDZT9qH43VUd+SbBgkAQ9svPm/ziTdLKeiNYJzCVGZt2YsALNq?=
 =?us-ascii?Q?UU9wDxcQKH7jJ7hVfLjO/Fi50hXc0mg4IXYyA7Vcwm6ePXbpValphx9OUEfm?=
 =?us-ascii?Q?UBW6pyuzy8+TQQShskYou9Qrj3EDqjHW5fapSo3cuWmFSb9qS/fiNNVFnbW0?=
 =?us-ascii?Q?HAW0YjuOSDqPPnYDDQepl5ji0Aou+mtDNMJJ3QAwRKbeE4GZn9VKtDyeCK5o?=
 =?us-ascii?Q?V40T2I9q4UIpWMlPEEVRjkltKDRfgqZQqPEKd1TIgu9/4xU5e5wzl0z2HpUf?=
 =?us-ascii?Q?OccgmE2b5RdDRBnTvkaxY+k9VfrysURFItSUkMn+PnH1XtTSM2NSP4CdpTj8?=
 =?us-ascii?Q?i4qj2oWydjCVsc3/rgS6eVfdZODPYSjs90yrAf5mr0e84hYSoQVPAeqcEZRu?=
 =?us-ascii?Q?VmK3uOklWuKlwNZYiVHq2887xtSVmlZ2uTlfpyUvvlNp+lYEDaTGbKLJoJi/?=
 =?us-ascii?Q?13O9Gj7yLQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98288b07-03d5-4eee-5b05-08de5af56e1f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 03:05:29.7891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpSTeOAkw71ekZjcHkxpX25/vVEfzkCE9XalCCGWEsrULOgYEqpP/pMoPTewFt1D6QiJWJ7V9NW4JevVmCP3Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
X-OriginatorOrg: intel.com

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git scrub-syzbot-fixes-7.0
head:   2d76e519f5fa0d3323cdd2ce3404fc19e6c23f3d
commit: c45a0220071a896d5492a1b839c518327df54f9f [11/44] fs: turn on more warnings for the filesystem code we modify most
:::::: branch date: 8 hours ago
:::::: commit date: 5 days ago
config: xtensa-randconfig-r073-20260124 (https://download.01.org/0day-ci/archive/20260124/202601240921.UDfaOg45-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240921.UDfaOg45-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601240921.UDfaOg45-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/net/inet_sock.h:23,
                    from include/net/ip.h:29,
                    from include/net/busy_poll.h:18,
                    from fs/select.c:33:
   include/net/sock.h: In function 'sockcm_init':
>> include/net/sock.h:1918:2: error: missing initializer for field 'dmabuf_id' of 'struct sockcm_cookie' [-Werror=missing-field-initializers]
     };
     ^
   include/net/sock.h:1908:6: note: 'dmabuf_id' declared here
     u32 dmabuf_id;
         ^~~~~~~~~
   In file included from include/net/inetpeer.h:16,
                    from include/net/route.h:24,
                    from include/net/ip.h:30,
                    from include/net/busy_poll.h:18,
                    from fs/select.c:33:
   include/net/ipv6.h: In function 'ipcm6_init_sk':
>> include/net/ipv6.h:376:2: error: missing initializer for field 'opt' of 'struct ipcm6_cookie' [-Werror=missing-field-initializers]
     };
     ^
   include/net/ipv6.h:366:25: note: 'opt' declared here
     struct ipv6_txoptions *opt;
                            ^~~
   In file included from include/net/busy_poll.h:18,
                    from fs/select.c:33:
   include/net/ip.h: In function 'ipcm_init_sk':
>> include/net/ip.h:98:2: error: missing initializer for field 'gso_size' of 'struct ipcm_cookie' [-Werror=missing-field-initializers]
     };
     ^
   include/net/ip.h:85:10: note: 'gso_size' declared here
     __u16   gso_size;
             ^~~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from fs/file.c:24:
   include/net/sock.h: In function 'sockcm_init':
>> include/net/sock.h:1918:2: error: missing initializer for field 'dmabuf_id' of 'struct sockcm_cookie' [-Werror=missing-field-initializers]
     };
     ^
   include/net/sock.h:1908:6: note: 'dmabuf_id' declared here
     u32 dmabuf_id;
         ^~~~~~~~~
   cc1: all warnings being treated as errors
--
>> fs/namespace.c:5967:2: error: missing initializer for field 'mnt_last_node' of 'struct <anonymous>' [-Werror=missing-field-initializers]
     .poll  = __WAIT_QUEUE_HEAD_INITIALIZER(init_mnt_ns.poll),
     ^
   In file included from fs/pnode.h:11,
                    from fs/namespace.c:38:
   fs/mount.h:15:19: note: 'mnt_last_node' declared here
      struct rb_node *mnt_last_node;  /* last (rightmost) mount in the rbtree */
                      ^~~~~~~~~~~~~
   In file included from include/asm-generic/div64.h:27,
                    from ./arch/xtensa/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/uapi/linux/aio_abi.h:31,
                    from include/linux/syscalls.h:85,
                    from fs/namespace.c:11:
   fs/namespace.c: In function 'do_mount_setattr':
   include/linux/compiler.h:69:32: warning: 'err' may be used uninitialized in this function [-Wmaybe-uninitialized]
      (__if_trace.miss_hit[1]++,1) :  \
                                   ^
   fs/namespace.c:4683:6: note: 'err' was declared here
     int err;
         ^~~
   cc1: all warnings being treated as errors
--
   fs/kernel_read_file.c: In function 'kernel_read_file':
>> fs/kernel_read_file.c:123:27: warning: 'copied' may be used uninitialized in this function [-Wmaybe-uninitialized]
     return ret == 0 ? copied : ret;
            ~~~~~~~~~~~~~~~~~~^~~~~
--
   fs/mpage.c: In function 'mpage_write_folio':
>> fs/mpage.c:601:40: warning: 'first_block' may be used uninitialized in this function [-Wmaybe-uninitialized]
      bio->bi_iter.bi_sector = first_block << (blkbits - 9);
                               ~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   fs/mpage.c: In function 'do_mpage_readpage':
   fs/mpage.c:306:60: warning: 'first_block' may be used uninitialized in this function [-Wmaybe-uninitialized]
      args->last_block_in_bio = first_block + blocks_per_folio - 1;
                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
--
   fs/binfmt_misc.c: In function 'bm_fill_super':
>> fs/binfmt_misc.c:934:18: error: missing initializer for field 'ops' of 'const struct tree_descr' [-Werror=missing-field-initializers]
      /* last one */ {""}
                     ^
   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1268,
                    from include/linux/pagemap.h:8,
                    from fs/binfmt_misc.c:23:
   include/linux/fs.h:3228:69: note: 'ops' declared here
    struct tree_descr { const char *name; const struct file_operations *ops; int mode; };
                                                                        ^~~
   cc1: all warnings being treated as errors
--
   mm/vmscan.c: In function '__remove_mapping':
>> mm/vmscan.c:761:3: warning: 'ci' may be used uninitialized in this function [-Wmaybe-uninitialized]
      __swap_cache_del_folio(ci, folio, swap, shadow);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   mm/memory.c: In function 'do_swap_page':
>> mm/memory.c:4985:2: warning: 'nr_pages' may be used uninitialized in this function [-Wmaybe-uninitialized]
     folio_ref_add(folio, nr_pages - 1);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from mm/pgtable-generic.c:16:
   include/linux/iommu.h: In function 'iommu_iotlb_gather_init':
>> include/linux/iommu.h:897:2: error: missing initializer for field 'queued' of 'struct iommu_iotlb_gather' [-Werror=missing-field-initializers]
     };
     ^
   include/linux/iommu.h:363:9: note: 'queued' declared here
     bool   queued;
            ^~~~~~
   cc1: all warnings being treated as errors
--
   In file included from mm/init-mm.c:13:
   include/linux/iommu.h: In function 'iommu_iotlb_gather_init':
>> include/linux/iommu.h:897:2: error: missing initializer for field 'queued' of 'struct iommu_iotlb_gather' [-Werror=missing-field-initializers]
     };
     ^
   include/linux/iommu.h:363:9: note: 'queued' declared here
     bool   queued;
            ^~~~~~
   mm/init-mm.c: At top level:
>> mm/init-mm.c:40:2: error: missing initializer for field 'start_code' of 'struct <anonymous>' [-Werror=missing-field-initializers]
     .arg_lock =  __SPIN_LOCK_UNLOCKED(init_mm.arg_lock),
     ^
   In file included from mm/init-mm.c:2:
   include/linux/mm_types.h:1207:17: note: 'start_code' declared here
      unsigned long start_code, end_code, start_data, end_data;
                    ^~~~~~~~~~
   mm/init-mm.c:41:2: error: missing initializer for field 'start_code' of 'struct <anonymous>' [-Werror=missing-field-initializers]
     .mmlist  = LIST_HEAD_INIT(init_mm.mmlist),
     ^
   In file included from mm/init-mm.c:2:
   include/linux/mm_types.h:1207:17: note: 'start_code' declared here
      unsigned long start_code, end_code, start_data, end_data;
                    ^~~~~~~~~~
   cc1: all warnings being treated as errors
--
   mm/memblock.c: In function 'memblock_add_range.isra.19':
>> mm/memblock.c:709:3: warning: 'end_rgn' may be used uninitialized in this function [-Wmaybe-uninitialized]
      memblock_merge_regions(type, start_rgn, end_rgn);
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
..


vim +1918 include/net/sock.h

f28ea365cdefc3 Edward Jee       2015-10-08  1910  
657a0667025e77 Willem de Bruijn 2018-07-06  1911  static inline void sockcm_init(struct sockcm_cookie *sockc,
657a0667025e77 Willem de Bruijn 2018-07-06  1912  			       const struct sock *sk)
657a0667025e77 Willem de Bruijn 2018-07-06  1913  {
e3390b30a5dfb1 Eric Dumazet     2023-08-31  1914  	*sockc = (struct sockcm_cookie) {
6ad861519a69ec Willem de Bruijn 2025-02-14  1915  		.mark = READ_ONCE(sk->sk_mark),
a32f3e9d1ed146 Anna Emese Nyiri 2024-12-13  1916  		.tsflags = READ_ONCE(sk->sk_tsflags),
a32f3e9d1ed146 Anna Emese Nyiri 2024-12-13  1917  		.priority = READ_ONCE(sk->sk_priority),
e3390b30a5dfb1 Eric Dumazet     2023-08-31 @1918  	};
657a0667025e77 Willem de Bruijn 2018-07-06  1919  }
657a0667025e77 Willem de Bruijn 2018-07-06  1920  

:::::: The code at line 1918 was first introduced by commit
:::::: e3390b30a5dfb112e8e802a59c0f68f947b638b2 net: annotate data-races around sk->sk_tsflags

:::::: TO: Eric Dumazet <edumazet@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

