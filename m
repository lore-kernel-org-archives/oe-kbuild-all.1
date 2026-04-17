Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A301B13DBA0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 00:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776385937; cv=fail; b=TIJ8zvBAzuMAyRzw++6GZKz25k/SY8z8ueKxN1knI6P5PWxeWJ+NhcWS1hct4F1yO26CHCkmep897IQ+QBXh+GGYvZnFvcQWGty+vFmqiCJv4vkO8SDzHlFpq6i3lGbhqu083NsFudDgXaNgZlNGgx/NYYuV4CBstjQejkphwko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776385937; c=relaxed/simple;
	bh=8CDhGp9ij5485HYwn8u8KgZbDzsdpHBpuO+3AWnczF8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=UoHjPENtR65yG8+PiMG2jokkxwRuva3BqtWxcKEKXzZRSMCOe8QGIYlB4D1uVQADNozRUBquqtaERZr0poRitX5BFeoeXkHl+sg7wkkIZakc8Y7NryVahaQ7n0ZnmMDZ0k7Pk8UCf1eHCZzzrp6lgoILpTpWCFPE88RXVABpgCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQAOcwr1; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQAOcwr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776385936; x=1807921936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8CDhGp9ij5485HYwn8u8KgZbDzsdpHBpuO+3AWnczF8=;
  b=BQAOcwr1FMgyHbIu24yECfUckSvJz+UsrbLx9Ue9s4Y+AsTglYMrw5PN
   WjmNm+vKfuN8hJmJKY5y1ptPgWc7agF4g4XXcpo/HYiEh1qBaTPsz308K
   BJ/1O30qmDqDo7RtiDipriAILKYtkfTTVTCkuMbWD2v1/rg2Ry3QhZpLA
   aKGKqeSbWgCrQa3Hx/0ebAOaZiF/5k4lCxddCzeJlHF/yel9ZW2rbizze
   bDtDY6qx/cyP6ox6K22y2bwZVrZrFnVbqT+rl+BjrFYbbW4hzsErmU/nH
   O+iCtg5DeRLzgQ+xskMR8LzdMkgyrPwxgWpQAtobNl6wlc45eb1uxfQdX
   A==;
X-CSE-ConnectionGUID: rJz38mdzQ+KNZc88C9p6vw==
X-CSE-MsgGUID: 9a3doV3gQMu8grVOhWqlvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="80998877"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="80998877"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 17:32:15 -0700
X-CSE-ConnectionGUID: U7byaSGfRCu44zh3Q3db6Q==
X-CSE-MsgGUID: nQ5MRoLmRh21Nozy3BBGJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="226536140"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 17:32:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 17:32:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 17:32:13 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 17:32:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODHeddYSTpbIsE3E1rblejC/3E7iBLeiUO0oFPBDQnFYOhdpzyTJUYnauffCzAI7WRhNkb8gIHpOj9K95pqP3Axg5K0llstfA4/Z/p5ryO/gFf8179nYJXZjoTsCl6Obxux7Z8eqOaJ+ZqeiltpdCCxlr/LTS8ID/9btkJHkiiz2K4UUpqe4OyGEQFhIB/LCXvPYAYM93TeFENcLopJSIq/2Bp1Hj9hqR/v1B9w6mKxq7hxoW24nrUB4rmpnQt1V9oBSWQcdjoDlR00XpzgaK+uLWmDCx9IDaW+61qln/s8k7RDSY5D1Rzs89jjRo/wwwPkvLQwBYTGsanV93ytlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KFTrASNTd1wj6ZDkMVlRdFskaXtk9qiZzpKb+kIAbU=;
 b=CW2g3xsQ3KP8VPYMMHYti3AM83pWSfAVvwMsK+sj7i9WriaOSSaOlPwBt55RcupZLjt3XgiFITPzDWQTe/zd8aDNYwvG+hzaLhDrYgjU5mYWYi4/g1XKT5KMqLh5FFiqKBseob216g6zCgw3fs/lvHWfA7EVj8oJDLqYqeVCnSOPUhYkr4ZK9YaMAolqTn5ozUVPcFV2SyCKOREjIeZYBR0HxvdA++KL+nPLfPHJvISij48K3XEQjvRDWdQVR5xpFI6oRohFntaiSoMHpugTt7dA3xUb2MZtYmkiuK22hWvkaSjfiI6RTOT++RNueiMET5aSf9pnSByRiYmxpJAYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 00:32:06 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 00:32:05 +0000
Date: Fri, 17 Apr 2026 08:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: Steffen Eiden <seiden@linux.ibm.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [kvms390:sae-part1 4/27] checkpatch: WARNING:BLOCK_COMMENT_STYLE:
 Block comments should align the * on each line
Message-ID: <aeF/fsWazhy6b4jw@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|SA1PR11MB8427:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cffab5c-5401-4892-c948-08de9c18c098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: V2MzY8JLIER9IjdKEtl71wEFOV05HYoZwfJT+yCv4gTyA2AVfvlpm6G4OUDHHm77ZtTNwlG9kGiwWmS4Obc4OwZ6JEiXSJomYegsLDp9UVGMVFwO9JPcjhdUJMsBNH9XSoqE/LFnqAcdY2OzQnV7dkdV7koxurhfhrOo3rBMVgVhHjKv4GJSiwGDkLkwTpYF+0A7dFIF6fNuyCN++1CADzsf9OXTE3ZNVYn2YWnsTFdTkVgtYumgv5ByIrqJ0L2Af/dv8hLA+yxx0OjgpcPo17fX+4GV71nzR4D+ADHYRkD07Cf5PRIeK9CaQqs25/LD+WHgLbrDucFJ6iSmSLVEBtnJ01MMqQbnsQvMvs2dp5cbRNjQFCMkothDH9fDR21QrmvroU2nUTwr/1ZSrkw8tw8s8de/YH444oucCn98Gz0AEzuayxyDOqLiXSqMGMQeYOmHolCzld+yVh2n66zO4gTPYbq5pVMDQyVCD1PsMiGsT5yRxO6/3a/tZyamxzl/GQXpk6SP/4tvixeCe4yJEyA4BrKlLjQFinWQwWWYBkMI+7vcQPJYBGVtuIMPyB5GIIcsIo/0AFIzDttNYVOVJuT1rF12mCJ7aeXPawzOS0WlQu7DVGccU7kBwlsyisemwfUeAM8TjL0jKIsY7YdgShCNRPPOSLiMMDZGFYazXPdFCV7/OnOIWv4vRWDO/BY8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RAQysIqTBaPlTo93GvMuzv7PJcieLhEa6aVCz+tV7fvboQCx8rTr2rTa0vAl?=
 =?us-ascii?Q?GJIwBdQii3zhDgNjCHCsOpexdcPUISiMv8miuuKP3EcehzCBFckd+dVeGpMw?=
 =?us-ascii?Q?eoH52ehSiBEOT6eE7JI3gK1X/CEA7vf4qGLpXRkFS4oGTYu7wMVMhZz/C2H9?=
 =?us-ascii?Q?l39pdE74j0cM0zNaB+isVYHxX3jZQmy3r/Y8dyin5eiufBoJ+1cJgs3EoSGq?=
 =?us-ascii?Q?rzviG8R0vS5lkDdaE9P4igBs3UMzvJRF8tXP2REuygY6qQaSiKAjaQoOQoQx?=
 =?us-ascii?Q?xikdQeUBBUhNJLQYn3bbLiFHDMmgw94q296xLvwPq7BrmZGIYTZ/gAzEII2C?=
 =?us-ascii?Q?6FTPgnPrRrwYfL5p85cJ1PLY2wC6Bwc4Q4dE+E6wY4Rf/k0XljudKCG+SXbp?=
 =?us-ascii?Q?bMJHt9eZAdMr3N9tt24nvCsailo+cP9rwAWlkxcUFiNjDRf+ORAAKWq+qm+A?=
 =?us-ascii?Q?eHqlMDdJGGFWTeHjzLh2bIyZcXoEqmkGVZADqD2jM7pmCwLSJRmItfL/a9rw?=
 =?us-ascii?Q?SBvO+F+tNViNFYCKV9mXch2bEoo5y3s5Fc6KJmSvZUP63ALSDSFyHiiQ2XWZ?=
 =?us-ascii?Q?kRZ91Lr6HhzpO0x81DeeHlyjrOcHhZFmBkFc2ZcTGhTg/ylIgD/vgMOvzTRE?=
 =?us-ascii?Q?VvcV0fLo1B+aonUAwx5mvthyTZgAcYQvsIYwQrr4XZvD0U8Q0JdxfK9NlcFE?=
 =?us-ascii?Q?1wIUf1jX8HNm3Y99zXK7ctIQXDdYb7CGm4HM3hYK/P7o3qyLKkqtkd08sp5+?=
 =?us-ascii?Q?lQRg0hN2Q7igZmH/Ge1sqivJ7QymTgTV/RIl5JY6hx/Dazlx9KLqrHrJ/kdp?=
 =?us-ascii?Q?Op2JZUQRLpYk51zWsRYApOljzuH+zyK8lojxNeMa22wHiw5cXNGhsJOyoD6I?=
 =?us-ascii?Q?VEOXzBYAyMnQu7ZdLZuHerwEecTTrgYEbp68cO21Kt0n6dT78GZxxECbEBCi?=
 =?us-ascii?Q?zRGG4WvkJCr7bz9tgYXwpVmokw1Yi6k3YkxJgGy9BvEmJejUeDRUYz39Rnq8?=
 =?us-ascii?Q?lLpZjQYKO+DnqBInv0NyKNaTneoL9UCJWH4FBIB5Lgw6LSMjugPYmZivYg0t?=
 =?us-ascii?Q?OC13I77RpctjogeOJskD1A9x/waud0NR+8wbD9iVUEhDi61D/nI3smegz8t6?=
 =?us-ascii?Q?1j15dBh6fwcDAj//l8B/3Gld9yRQQALezHoFxAMDETkuDGwtWhkRKeormc+G?=
 =?us-ascii?Q?hGZE/2Y0bhTtflmwMDYJ1DCD2SuvtZSKrHFibwSiy6tS4SPVxlwzO0thkrtd?=
 =?us-ascii?Q?pPwI1hcVSVH+rUcnlFncG9ByeQt6q67AqYuxgjcmWKL0D8YL3srYMdIqso/3?=
 =?us-ascii?Q?nRu4/bFFm7AfIQ6THtVAWIA2NQHgMuDe6n7G3861CxdhcKnv2SbL75H3DSmL?=
 =?us-ascii?Q?hOYtTPkRSukLkuoz9Qbnlclnz4q5OOqp+aB0gezu1rXG7scR3UJVZ6I8XSX4?=
 =?us-ascii?Q?SEllLaLP28CS4UWiTz4hqA3oiv5QTIJWqDEhURY3phmGIozshPVtcq+D/Doc?=
 =?us-ascii?Q?HAa2bJEBMTxYT3MKZvccUwxSSLITu3YS+A65VJInp9aPGBZLIXI+exLTDBFK?=
 =?us-ascii?Q?A1mYx732OtMncVOUQ9ZFTeECWOtzFCOe4DqfB7b3jMG4W0++pYS36VL+KNoC?=
 =?us-ascii?Q?OoXjpGJWbPg2JN6C6XDwDJwGPEltXgTr2FGF7DQVhUkP/ntAyf11VkS1TTZr?=
 =?us-ascii?Q?Tq+R6pDw8ShY7QF+ZE0gcq++oK8k102D6MM1PVbCvRqODe8nZCfdS0u1UdJR?=
 =?us-ascii?Q?yH1PUQ7caQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: BrIzDEgfY1lgI3mKcjhrAlWiPjJVNE0JB4s9Jlqw+Ov8geOmooYQsmRyl/Av7zpdU/Ff9Dhcsyc1hMAJNDxnIt+3nkVB35XZX2znq/iYaazPLCycj2Bhse0GZV8IybGJ+4ld12n7u36LTN7G5wH2m55hV04349z4wP+HbvvPnQIg7bOwD2ECXxh5kTjJx+klmCRKvVZhY0JgH3aw3yjJTVGHj9cNVydjM7QNNJdq/s7Vter/LY+gwxSouCtCV6eTOJgsTqZPn2usIG0KtfnhMmuyo54jbL9Ez8X3MvPZEV7QUSnXYEqVzrDnaz5hKlJ5sHP06XRETewR+9NQy/0F2Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cffab5c-5401-4892-c948-08de9c18c098
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 00:32:05.9601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6hqGmVjAnKpvBwBs/kZEFYLBptSXGa/FBwAbu2IjQj2/a+YcaZWSRwibTGby/0J+9L7VGXykm5hOdMcqBtMVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8427
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git sae-part1
head:   c8ef958593be02ec09131a1f5e2744a98b6c01a1
commit: 20bb0172aa62c38d868d0e61f3bb57d225697efa [4/27] arm64: Provide arm64 UAPI for other host architectures
reproduce: (https://download.01.org/0day-ci/archive/20260417/202604170128.01CfV10E-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1476: FILE: include/uapi/linux/kvm-generic.h:1299:
+/* Available with KVM_CAP_TSC_CONTROL for a vCPU, or with
+*  KVM_CAP_VM_TSC_CONTROL to set defaults for a VM */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

