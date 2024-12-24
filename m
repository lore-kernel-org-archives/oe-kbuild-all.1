Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD90EBE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 03:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735012548; cv=fail; b=pmeyhME7Be9CYEoHEjfnEPbXKu8gXGudkjKPV5sqC2qMORcBf17Wv6frMKR6E6/2F8yvMpK4rDsHV5SrDOJ/QsrU6FVNStb5/uf5f89zu/OIarTA+FBIppC2jxRS5u/trXmkvjj1z3ccdWs014jSGpMIZv6IFaBBo9ujMkoFgb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735012548; c=relaxed/simple;
	bh=jJFqSF9R79dhh+SG/Z8ypkRZnNzlqrFA7MfqUDKxNVw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ZQRHB2Y14sOefR9zJZZWqgdG10Fmu1XKOGIqOxjhe0FM4upbnA/wEx4g8VezT7Vrzf3iXY1rHaZPYx9DI2MGltsJevka2fQmaNxTzhodFP0SqM/8Pq2QJ4/r3fV9tf2kCwOZItkBFIGYhYqNqGeYibuOsDjvyy9L6HHcv4iIy+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XetAVLoa; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XetAVLoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735012547; x=1766548547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jJFqSF9R79dhh+SG/Z8ypkRZnNzlqrFA7MfqUDKxNVw=;
  b=XetAVLoaqGso44dmc4M/lZKZ67jUWzyI4mOu5fUD45fIweaQ6wJ9CH22
   hpqOsdSimY+3I7kc5psiuDUncUAwt9PKFsMuBtvvId2xu4nMV0+F8Yi9K
   Qy6e9JK/75rAtdxPRZoJoPfqiDdzRYFgghRMpvoIkW748tvUVWCXi9HdV
   NjIqfUbTnskMj9X/azochx3hsOlL7CXq717r3NBDBh3noTjhV7aN8F/+n
   Us4M1YHTyFoRFCod6g6gqwtGfXo3iU0DmfwqAIhq1HcuI15dWVuQw/9Am
   pqUA9X5Jk2FeE45YooVxftBcHQZh1qRjGLNDERkzdESte2FH5YjeHwGGO
   w==;
X-CSE-ConnectionGUID: OZCgiUw9SRyGH//UUMk+Zw==
X-CSE-MsgGUID: KvX8LFbJR9+HD+OxJxmhYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35384199"
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="35384199"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 19:55:46 -0800
X-CSE-ConnectionGUID: 63z6e5jdQq+fKNPU/S6geg==
X-CSE-MsgGUID: pPA1PCyXRXqSUelJKNk21g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="99903335"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Dec 2024 19:55:46 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 19:55:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 19:55:45 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 19:55:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlMp8b79Ihnu3/dv7Xliz/AwZw8DLcHJTzksyMmvfYpLmjtoOV9e/cmZhppL/rsUijcYQqtDe0Ar3LYyx5+/hZKYxrp/RZt+y54v2u9mqYGBvOqQfIKe40UaMe3hae1fpTzI5S0wne+/QcdSeSWgdOEdsrk0k12VhUzNM1OJ/wa84sbXs7Tx4+KuV2bbDXbktTh0qnIzBtNzqo+gxJKX+NFAs+YuO0eLBGQJG4AyL9dv6WwfQzW0HhIfMt9nYcfsUh1siTzMIbEQNVvaF6/NZSmFWMhp732QlVfIVMjnv4yZ/8lyc99mwZPwm03mRDYPcHQK5uNIDuYgDxCgMb1qUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOquwW4N8Sa3cFNyVNuq23s51ayzn0Wz4RSB8DshnyM=;
 b=yTJgqGH+IFcdmYOVGZOQhF2sRr3JbzZlUSUGZemHzoU5JrtH3sRa+kBbyRfhYymcnaXM9p+yM81PpwZja8DMdw862TC/TKHrtNLmbcrpFp0IF086moK81N0RvBv6UINmSUQZiQ8ZsRd7a36V8e7cC8skYqvrUAFtO8Qd9/eL6JnPaVQ5kitZZJjZS6WjMAxehOrUfBULM4maEri34RrITIgnUY+5zlMrsbDV+ny8Uo1pgAeq8EYdB2RTfw1Sbqj/dKBxjytKpXr2rElXX0se/dZbFFw0itINZUHi24NlxkNrSZojVxJ6eXxxMLMUfBPn/hSGndt3FSsSpC8PNXjPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CYYPR11MB8357.namprd11.prod.outlook.com (2603:10b6:930:c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Tue, 24 Dec
 2024 03:55:39 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%7]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 03:55:39 +0000
Date: Tue, 24 Dec 2024 11:55:30 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Masahiro
 Yamada" <masahiroy@kernel.org>
Subject: llvm-objcopy: error: Link field value 83 in section .rela.plt is not
 a symbol table
Message-ID: <Z2owsjbEqC+lOodQ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CYYPR11MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: a4cf318b-8372-4185-1476-08dd23ced457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ydSj1UnjsaANAAovjJdX4R89Dpm53kLIL1N24hEhMeOfxcDXXevix5EE4kvH?=
 =?us-ascii?Q?37HzXcPX6tk9/orQIjOskLUg4cxyth9FaChYGi4xl6f6UJo9fwy1XpudOxNy?=
 =?us-ascii?Q?OBSvD+ghfBTW2GvWct6HyHOjwiUyXJT/DBCchQWL/JE6ZtP/vsVofIx29dK2?=
 =?us-ascii?Q?02gHDWRUTTtfbM9v79DhBbE1d8KS7bxBlm7c4f2wEIiDu4lyH6NGMjLb0VvO?=
 =?us-ascii?Q?Z0K356Fcvr76uuoWdbSGOrDmZYu6haxxa589uvfzpo3JnsTOvCmo7bmqiywT?=
 =?us-ascii?Q?MwYMOTVNKw34TBOnRZ0mxVAp9o6XnHKFb8BEIZ0INasjVbJXrk0a0AxO9g6X?=
 =?us-ascii?Q?C/wVchuI/OjlBd1xV/P6LMiSp2TrLQzfxI7aMQJL3IxHc4jIZ5cLzAzPOSkC?=
 =?us-ascii?Q?jV5qeN8wi6G6pfSyPaEhEv5blgOb81E2Fx/Iz6n15JdK+lv1jJlmOr5govuI?=
 =?us-ascii?Q?fVuwDuSMnDJHCwZ4tGSKjvCzE9opik+XdnzfSS5HM5qxlbG0u77TR6Hr2Bvo?=
 =?us-ascii?Q?Kl8WBxDGyqbFgQm5p/NrIiSUqeKCCKLZfoQveErpMqSRZjKthXmHmAq6yZSg?=
 =?us-ascii?Q?u/4WcjcE/xzhBBL5csPGNwPtCKdLoYhmVcuwRcszR8hHDQgnJ/07BSbv1/0j?=
 =?us-ascii?Q?GgFqozkSuVSuLPcVzhPGLoyLb8ju9Et8gt51PU6kbc8ODY7EjXjK4/zgudIK?=
 =?us-ascii?Q?/YDMujnjZx3eJTV2oYSqq4YqAdllJJtfzH3AnVxPpeAcEJtTj5jzd1SBodcX?=
 =?us-ascii?Q?/J+4Azh2SmMKVwi3Mnn6la0R+PfcX6ko+SSPnq8OppHxvMdDHK2Yudh6DnVN?=
 =?us-ascii?Q?mymKICo8CZfO7QItBl80W0NxVX1Iyn1Q6vLh6zqGDLfHGKu3n1wPC8iHKVCP?=
 =?us-ascii?Q?W2TRWXn6rSt4OS2mcTxGRC0tdD5uciKXw/pBDB3nmAi2VqIqdTh3iSIp78o4?=
 =?us-ascii?Q?JrvXLW/quu8I083Psd3JD8g8CfIX8kJIcSPd6LP4UArym3GzOVzVZs0HkVFF?=
 =?us-ascii?Q?JSbw3qxR/ADJRhT6XXXNEwRcJ/v06ryqmb8nTmd8KIVLNYwoZ32AaUGMfF8o?=
 =?us-ascii?Q?OXNbk7z9ZPEFxnama7/wMv++MKw9WKK8HGnjHTIH6/VUCC8w/9Udi8reMbHV?=
 =?us-ascii?Q?Y/k54c22HHfu+UQKbkpbFzHsV5fGZKKexyL014SNBvGpGpP+q9ZHoiWj8OLi?=
 =?us-ascii?Q?2Bj+OW02B65wIdcHGIzmE/lwMfKNMmA3NoxenQ3SH8nqiYcfvh8WzY6n8Pt2?=
 =?us-ascii?Q?AFpPtxukErR4QhwDnjjpKhnlRVfTxX/0Dt/pBSgQx5kqiel4TQZiiFB5fe9h?=
 =?us-ascii?Q?FSH/xzAal/jFwGtP5HrXHEHvxmi6z4GuoyGNFk8VcAT5rA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yvE9AcRrTJna2doE6Qep8Va3jo7Bal9OkRUm1pymixyhX3yczl0yCaiLej/D?=
 =?us-ascii?Q?ms/873iV8kwYUbAt7KzI56GywICk7wlHcibBsD32ggCttK1U4iwHiCCjRtxy?=
 =?us-ascii?Q?Ky2U1pksHnRbzBMsth4HLRV53Fjfds/qZLoI7yhYF8o+vO8JOKA1HS+WY1HZ?=
 =?us-ascii?Q?7jfRmhaSecYLMAj6hHLYQNGYANdJqDYobZ2+bJ4cRIoVjQXxzZ92xHGEFgTK?=
 =?us-ascii?Q?+S/0qUxYriBfPyH3v5ujwkspbpK8PP8cUDvijgtdUGJlH57+7YGLzK/sHMB7?=
 =?us-ascii?Q?EHIuNxIVmaENewLJPYmXDMan2rom4aqoJpF/J+y76Ug0Wp2JktpTrRt/IzPX?=
 =?us-ascii?Q?YPS/X/ofHXjoshSnAAScVP9Rc6CyQ3cIPr1bhhueMxdVqS+F9VlKHt7GvGGj?=
 =?us-ascii?Q?2Nb33wapZu7vrxfAgA5/s5P/v0zd1OQ7oevbgm3cGT/sFqvvo/v53qpzjVlg?=
 =?us-ascii?Q?i3hGtSjYczrLrWdsu+F/kvoJdGH+6l+wfR/SW3VYNKHwHufLN0dzx2to+8w6?=
 =?us-ascii?Q?9YaPpth3g11cwujQoOEfnV9YJNhn3HwTEioKYXk3MZC7iOMMlPYXgbqpOAZ3?=
 =?us-ascii?Q?pw019kFGjEknlssbTaCayQzhHDZeXEbWqUrt/nf+egpwVJa0O8rJIWloZ9NY?=
 =?us-ascii?Q?yBE7P2jPsXE8jz5l9/j2Dm2PKQ4c0dhpSN7M8jxjreBgxs2D7Z6gxywgqJPy?=
 =?us-ascii?Q?pSEDgMFZceMOlTMkCLbmwD4DtM+GkE4mU8yEm9ya4SxLqtA2FmTdV6k7ClOD?=
 =?us-ascii?Q?Yw8Q2wGW+HjW8mIfro/E2qqOThQe/szrQ6caAYSr8lwOuURJgSzC5l1EmOPn?=
 =?us-ascii?Q?c/BLVVDp+0ZhYHDc5TRM1CZDSg2vYY5EOcJhrp9n+X5kvxK8ExLxQ2w7EiD4?=
 =?us-ascii?Q?sdYWpcohwMl6Ek/WBNq1ZoLrtfy+HkXGkllG+QzfsOA3SdxhLgd822SwwI3T?=
 =?us-ascii?Q?/hNq079niqzNtV1nNXa/W5z+de8k+LpYArBtAUJQeTuMe9DZlDv/LSWhQvgY?=
 =?us-ascii?Q?igkOG5PDj9Krs8euD9MSQkEdY6tzmSjh9PbWuVm4wBZIuyHDAAyhByeGquRR?=
 =?us-ascii?Q?MX5HC1dWnnlrELzKQWZf5y1Rt5gh4jKWdg4MEoL6yx7EXH7uN49bf4vtYK4J?=
 =?us-ascii?Q?lc5jHdq57BW59ksA5XcLiK8RycEx3ZWpy9LnsOF+jH1FAVlmgBXfcwLy+E0C?=
 =?us-ascii?Q?mrTnahTJAJZFxvkKoHBuQcn5XVWhaYfIyucLATqtTxFSUV5AGGF7IU2aWbtD?=
 =?us-ascii?Q?4gXkWpD3xL5Wry4r88ijhP6I4O0YMP4RtIeglSnevoMW9+chkfIfxItlxjVQ?=
 =?us-ascii?Q?uuFEjfZGaF57QFLoJrUgWdYEwBWRr+KuLJoK07w87EBSNPRVXcDrGoo54gay?=
 =?us-ascii?Q?SFyQeCf/lR4CvL1ktEbNMOqkxmL4vUFO4HnsopBHPI+OMGad7xxV/zzoJFe+?=
 =?us-ascii?Q?KhLuRSlPRUbubmD3LOoRa72hgH1j7W+K5Ebs18H+fNSvYSBAcq22WVD8USbb?=
 =?us-ascii?Q?KrYJnpLnly8QM+Sit0rI7YwozLWBayEG1E8CR5k3uj6g4E/+1GU8WU4nW7XB?=
 =?us-ascii?Q?E0vYjAMC66VUKgNIxMq+qdJ97PcSKUghc2+mU2jBTSxdZVWmFINzCR71yEK9?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4cf318b-8372-4185-1476-08dd23ced457
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 03:55:39.4756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iz8j1SS3cwkWADzIDImI6V1vf4WFz4czriUsT6PZE3WPqWXUceQfJ+nDRhnZdQSF5Na4yKNcCd0Pe1ANlg0cOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8357
X-OriginatorOrg: intel.com

Hi Nathan,

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aef25be35d23ec768eed08bfcf7ca3cf9685bc28
commit: 397586506c3da005b9333ce5947ad01e8018a3be modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS
date:   11 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 months ago
config: um-randconfig-r133-20241218 (https://download.01.org/0day-ci/archive/20241218/202412181651.ZY2nZCnO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241218/202412181651.ZY2nZCnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412181651.ZY2nZCnO-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux.btf has a LOAD segment with RWX permissions
>> llvm-objcopy: error: Link field value 83 in section .rela.plt is not a symbol table
   btf_encoder__write_elf: failed to add .BTF section to '.tmp_vmlinux.btf': 2!
   Failed to encode BTF
   .btf.vmlinux.bin.o: file not recognized: file format not recognized
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

