Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DBF23770A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 02:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764728703; cv=fail; b=Roje3w5Kaol2UQzmSMSo0lf3oeVcF32uF+kFjmelqGwwhwELDdrTcM6t3IYUKogbGEXhf7GB9x9iu7N7wefRriY74G/tF17onXGXbcgSuUx25VKRr7zWFYVxUhovG6k+0vJrKd5FN/00w+mlxBqDiridC+kboZ8/1qcXHWudAeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764728703; c=relaxed/simple;
	bh=3UtgJq0TOGCJgBWaEvSwVY5Ihnv+oSntAdMJbW+WbmA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=PNviGfl1WmPJULhQ0CdvSLz6rltgS2wa4KS/PnD8wq90x+fYQ/N6TkYWzGxgKRUIkMThteyc0CH/RlVn068P6410Gj6+Uo/eSLfEuCezUfUGB3UlEbTQBeiDJgiUcZ8pAMaN55cam+eFtMwLheojbdKWPnxdr4I63c3Z1rFznl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SC8Odarh; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SC8Odarh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764728702; x=1796264702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3UtgJq0TOGCJgBWaEvSwVY5Ihnv+oSntAdMJbW+WbmA=;
  b=SC8OdarhoQU2Rfvos47X9F/wtNbW0OH8TPXFzsnHqR+RaW06gRwnnfwX
   WEB1jD89DPRXW41rzI70X/dNqZq261JeqUTg5GpkHEHik56IrxyYTaHSW
   uTWIQGnt31JSWdI1OJX6zcqmXlWsN90XqX6vILbLuJC2h8d/KYSLpAlxl
   +L0AskJYa6yq0BaI168NNA5tJaqNTfFH7CjFRpa0mlFcNFQ1c9dsn1q9/
   xXVmm077REEsU8mWcMMMla7wBUGRQP0ur2wjlNTuJ8/pjqshD4aSsieFH
   6FuQx45EhBm5iLkIdtRlRWTSyOTmLNuqQcCzDUn6ArunbW3luHCLrL/aT
   Q==;
X-CSE-ConnectionGUID: Fh20jEAXR3WymCBsdxk4fA==
X-CSE-MsgGUID: 5AWBPCqCTzOGrlwVzIC2tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66880226"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66880226"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:25:01 -0800
X-CSE-ConnectionGUID: G5Miaz2yTQ+ZwnocAYd2Dg==
X-CSE-MsgGUID: SJ3wLCL3RuOQkpFBBXOyMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="193833403"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:25:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:25:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 18:25:00 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.58)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 18:25:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RobLR1ahIld2GaFbjDW1P0emLpLwqVYVz2UgZBQ90zkc/TNVPhTzUWvHsLadxziJ4gTvqhOMk4TqzVqARX25hVhvfZZDDIId1RdLNRfzpZanT0wC6z8u18RvtEEL0LEJ2Q4f1Dxp77PIhzva3wCe+GXIFhWdqhP8NI2S01AoX76/9jzPc8QEb0tK6gekUDWbhp9ERiee2HJQtZlanndy+RSPPm+Q02lODna7+8oOFqaYuQjL+Lwb9bBRs8kCftMhfuBbTVbCFchBfV+tT/YH9x3EYD5QtUtKI3Fxwa5FL/cH3HSHB5vSfYhbj0zcG88aaybur3iiSEyqJavBY8VgOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXIzhWmsbgDwVlKviVed4JK43+VrYPutbh3ROXxza5U=;
 b=nOGlcJWy8bskRPQU6nb1cpDyo+Z0w8KYPs0j8Qih/GI43B2dGaRwGiIRCZhQaf35uiFmW6HEfWz7FSSsdK1fhS6W3ejBY7Ugq2OKAX/05lsSpEINdIMci/BBxnqK8OvrETMTQPSAWOHOMg8jhBTHIGxqHlB9M0BmTPWW4Dt8qHF7ebmtTZ5azUEUogenv/aebXXwRsmDMBuUTAz6jXrKvkyD2ouravOSKwg0Pc3xEoTtxzTfZTjzL7H5HRC1cpFhjfhUtwg9vIoJM3pUTTve8qhM35EcebkEZvbzzsNzPBPlP8wfETSfhV5nFJCEi1+OffXJtvFuZ5kIA5ydSZUdzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DM3PPF1CEB6B7EF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 02:24:58 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 02:24:58 +0000
Date: Wed, 3 Dec 2025 10:24:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: drivers/char/tpm/tpm2-cmd.c:210:20: error: invalid use of void
 expression
Message-ID: <aS+fcYOdAGU6EjSF@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|DM3PPF1CEB6B7EF:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ed80ab-712a-44ad-5c8e-08de32132751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?njfEUMkppwgm4XdD2fkNs+MKesvDcq8xfFhfj17G6rR14/L/ztysFtPcVuwA?=
 =?us-ascii?Q?fFLtK7e9ZJ2dhH6Ezzq+y626ltNZipMwQjNyHeb9wOapVegxuTutIHDKom55?=
 =?us-ascii?Q?cd/IGL6MUPM3e1hpIn6KfNZ/1Dr8Zy+rW0pZqe1LImYD9fPT9NgN0R+ysn1C?=
 =?us-ascii?Q?ElYFTMHXTPo77hBVq+W6I9ArszUBTBwkxvqxMtwaxTzk8wLIdf3mV7/SNJEk?=
 =?us-ascii?Q?CE8AYuqmx22c6rEJzenMBCM6n6bWlgIRX1cfZzF0fPs+nwaHL4oHJD/iTxUp?=
 =?us-ascii?Q?xY0asj4xnTVN6aaVakhWJ42gmpzf67QCF1KmGv/o8+1QDsU6AiNsOsldnWih?=
 =?us-ascii?Q?aceAM3py6pCVfjSeLZLrVfNKqCA6j3zjqivuzYs90BwyK7n17BUziRKe8V/K?=
 =?us-ascii?Q?lsXBY06oW1bA862AwkDwQhVdVsghwmFuns2cJikByrsVbtVL7NxkRT4TwFSw?=
 =?us-ascii?Q?P6chHPnoxShQ8RYxO/8i/Rpwb/1JiC03x2hrbHvIbsztED85pXl6grRKHQ1c?=
 =?us-ascii?Q?uZrn8ijdPjyh9bevQP/97BYfX+v6iRReGmy3xpXIhrxQArBrx4yUjXltiKfe?=
 =?us-ascii?Q?Pp8goco5RVhhp2EmUdg/zFQY/IUE1wz/k8/IqCorv0Gcl8cTjpKEnYtY/en4?=
 =?us-ascii?Q?9TS9WlPugBYyRAcshMiGB6UHcLB9VXZFlP+uTwv0tRDEut7U3f2ZC+H0PZH5?=
 =?us-ascii?Q?Hpvsk/FQKi5xBhaMApok35CtilwHrcQUrCUfl7XyvVEl0nH5bOFsHsmpxhvC?=
 =?us-ascii?Q?AZaCs8PljXbfUWxEOkkPren/6QTNym8wIOuM2s77nTwUjvM0CCWSeq5Sm8FX?=
 =?us-ascii?Q?xUW711bHFYoSCV35k2Y5S75XOiTZ3QG4lqQyCnB3y/efMsQseGg+RD36gs7w?=
 =?us-ascii?Q?KYNEexNG4F4ts845DnZAoTH4jK0D+G4GomYVuVk+2OUhepQpOTuCmdSpFdMA?=
 =?us-ascii?Q?1/wFjbq5Ti6ZNc6RZKFPl5szNRXo3rYgFs9P9kUKEdFNllSJVS8DxhPblZ40?=
 =?us-ascii?Q?uuHNGRkv+95EpLfy6pZygKkJbhIXbrCmNh/7hm4vzYKfMI3YpkQksCyTawEj?=
 =?us-ascii?Q?8hhFlqmSwMfVVctDjyyG042D+bJFiU2Bxo1vFs7j4H/ZrDF8S0NxA17LeD4w?=
 =?us-ascii?Q?IVUoVdcxC61GUqF7ghDvEgL9nU5QAJBG3dQ4vM07e2XW9FmC1e+yNwbBAF9K?=
 =?us-ascii?Q?Vl9CfMcv7BShvAIXpQYifimQy36v31jqM1kwIpz6EZDxoBpAWzG70K6m6QGc?=
 =?us-ascii?Q?HlyCpbkufFoYj9WOE2+OxgezGQ/jt9pl3zlgF10PWgpyd5hfAyvhH2JFD/rh?=
 =?us-ascii?Q?Fo1lGlDNLG9vxG4e6p8jtTbqORJfyh+2r6SVlkTgNY8e0blMBpcpeuCkFURx?=
 =?us-ascii?Q?VZVlYd6CBKJEVXlxkpjRqpWEMP98tCOICb84UOvlFF5mLPOJmQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Fi+3g33INU0Bemcf+qLTzyBVQ707pTRNC6iD5/7ySqwf9BlUgzyTHFAa4s1?=
 =?us-ascii?Q?O3L3vEHeRC+msc8qR8ldbBL9qtuG3PrUW4QbfN7vB5C3kvRqvMSe4mN7Z3I/?=
 =?us-ascii?Q?3InOlk29p0hZZ7/zY0udjqoaQCSIlRkeB/TKis4T27LXyP/0gpqKTgLG98dv?=
 =?us-ascii?Q?a7zfPnYSE0mNiKxtDGPazAlIXEGBsegfb+OoncMK/KoYCIUVB4B2hCQ1p6lm?=
 =?us-ascii?Q?fur7E+59dFfgK+frnP6xQJ4z6OiWuSI+kHT+6+3iBSwq1/Ufo4e2mnGkYFgi?=
 =?us-ascii?Q?RNjrn0AOFxwTr7C3vbEsI+X55PsMKrimxtruc+GJqO0sjrLFCAI/hyuiUvNz?=
 =?us-ascii?Q?1kTrur4ULrdcpXBwAk4msuBsCGog/2+zu5BfXlwYAZwVSbEyJ+JfFUy7Vnk4?=
 =?us-ascii?Q?7EXKMsMzjQd6CtapEAFiZtMENY48cjwILzUD1kzGNUix3zGusDQti681vezN?=
 =?us-ascii?Q?DtxuSTdVA6fkpnM3SHtMJE4SQ3TE7jlmopUPvPM8QiDkHAzxSD0/bn+ZGaYh?=
 =?us-ascii?Q?TXzYdEikmozbFqURA2AWz93FWp1oQysjk89inAuL3KOwsd5UfJ0jPrX56Cnt?=
 =?us-ascii?Q?nfgIR4VTC1OTcln7My3oxtkN8EUh8MYfuGDg4rMSC4P5Z2Bsk3tnNBlPTRyo?=
 =?us-ascii?Q?IyF6qIyQaJn9VUpSsxYvcV6+UWqT5nmxWhA4GE+VtBPbQelE8p0/flqoLnaE?=
 =?us-ascii?Q?mlPaGkPAbXeehjxkT3//e0VdqyHstMWm02zJVZVNa3j+pwHZpzamMrid0r1K?=
 =?us-ascii?Q?CCdVUfMgEQXmASGdisVdAPzikQA8veflSfYfyYTVeL/5v9pxNvmnaptT5Mwi?=
 =?us-ascii?Q?MW/6RcFuTN32i0pMCjIz+M92DhUdjwjb2Znn64os61vpfzgb+55L7Vbuh1oy?=
 =?us-ascii?Q?9ApNC78XlY0RqhmmGT7FumCjZ2poJj/XlgJ2ApIhxYqy45icqQP+znIk7NB7?=
 =?us-ascii?Q?2GNfw76kW4UODkU2zmAPgwroYmEDJCEa/l8oQiecZ6NRYrTA2ah8X0r9qmAp?=
 =?us-ascii?Q?6mwo7g/pA7RE0kYnyV8ZW11IIe3Gj2SCS2kKs6XPd/1PkQZbKkLd6WTzOdXF?=
 =?us-ascii?Q?JjZdfj4FNn3EWurrcuoT8kOpUva4b/oFz2hoHfMJfFbM8yHRsdkFlSGJca4A?=
 =?us-ascii?Q?XTmjvl52Jo4+IMMGGBG0GLXpua5GQBAdMy38acD+hzLFR7PggG+5uHCMmq2m?=
 =?us-ascii?Q?9ZO63UmnS28/n61IH97OOpSwDHj2vk2iZ7vRa2wlhl08cPZCmFhsao1fgoew?=
 =?us-ascii?Q?P9pH5orl8ZuuajrstknSlodj5e1GCI8zgIEU7g2ro0155m2rMQxQ5rMK3T8h?=
 =?us-ascii?Q?uugfnyrHpEnxHt1gLIVDs1MnED3kQKSII1gsPWR9BNAj6UhBhhW+Dx3NtgKg?=
 =?us-ascii?Q?IlNXOPlIhs2IhOTw3Z2gwWbtT0l0xLhD47HxIUwKVlbDEN6pir2z3gcvOSUG?=
 =?us-ascii?Q?Axl/kAH/nJ2m7SadcEtQA/RvuMo26pZvnngVa8/DIU+cy5zKY1dZwWcwnFcz?=
 =?us-ascii?Q?RmJkxU3b25x7qRqkdnp5ABq2zOxpn+GKC8cj9Vwafi8Snoa8u5ofR4FUYZ3o?=
 =?us-ascii?Q?usNKw8fg04tnayJSpaQ9UywNowu8tSd6K6dICNnilp7kLqVZMu8ji32pkt+N?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ed80ab-712a-44ad-5c8e-08de32132751
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 02:24:58.1850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0ZJiPTD2hzGLm4QV12ruk7lhy9uiB6klSaNOrNzOHEOzfXRIUIMKlHpJ+voPeupoUkdW6fAKIzU9iIYQUNrCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1CEB6B7EF
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm2-sessions-address-out-of-range-indexing/20251202-034236
head:   991addbbc9ef9c912d1dce90bf0e8a9b83b1704e
commit: 991addbbc9ef9c912d1dce90bf0e8a9b83b1704e tpm2-sessions: address out-of-range indexing
date:   22 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021855.UvxHIno1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021855.UvxHIno1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021855.UvxHIno1-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/tpm/tpm2-cmd.c: In function 'tpm2_pcr_extend':
>> drivers/char/tpm/tpm2-cmd.c:210:20: error: invalid use of void expression
     210 |                 rc = tpm_buf_fill_hmac_session(chip, &buf);
         |                    ^
   drivers/char/tpm/tpm2-cmd.c: In function 'tpm2_get_random':
   drivers/char/tpm/tpm2-cmd.c:274:21: error: invalid use of void expression
     274 |                 err = tpm_buf_fill_hmac_session(chip, &buf);
         |                     ^


vim +210 drivers/char/tpm/tpm2-cmd.c

7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  159  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  160  /**
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  161   * tpm2_pcr_extend() - extend a PCR value
794c6e109b5938 Winkler, Tomas  2016-11-23  162   *
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  163   * @chip:	TPM chip to use.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  164   * @pcr_idx:	index of the PCR.
c1f92b4b04ad70 Nayna Jain      2017-01-30  165   * @digests:	list of pcr banks and corresponding digest values to extend.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  166   *
794c6e109b5938 Winkler, Tomas  2016-11-23  167   * Return: Same as with tpm_transmit_cmd.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  168   */
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  169  int tpm2_pcr_extend(struct tpm_chip *chip, u32 pcr_idx,
aa042475938f58 Roberto Sassu   2019-02-06  170  		    struct tpm_digest *digests)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  171  {
c1f92b4b04ad70 Nayna Jain      2017-01-30  172  	struct tpm_buf buf;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  173  	int rc;
c1f92b4b04ad70 Nayna Jain      2017-01-30  174  	int i;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  175  
27184f8905ba68 Jarkko Sakkinen 2024-11-13  176  	if (!disable_pcr_integrity) {
6519fea6fd372b James Bottomley 2024-04-29  177  		rc = tpm2_start_auth_session(chip);
c1f92b4b04ad70 Nayna Jain      2017-01-30  178  		if (rc)
c1f92b4b04ad70 Nayna Jain      2017-01-30  179  			return rc;
27184f8905ba68 Jarkko Sakkinen 2024-11-13  180  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  181  
6519fea6fd372b James Bottomley 2024-04-29  182  	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_PCR_EXTEND);
6519fea6fd372b James Bottomley 2024-04-29  183  	if (rc) {
27184f8905ba68 Jarkko Sakkinen 2024-11-13  184  		if (!disable_pcr_integrity)
6519fea6fd372b James Bottomley 2024-04-29  185  			tpm2_end_auth_session(chip);
6519fea6fd372b James Bottomley 2024-04-29  186  		return rc;
6519fea6fd372b James Bottomley 2024-04-29  187  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  188  
27184f8905ba68 Jarkko Sakkinen 2024-11-13  189  	if (!disable_pcr_integrity) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  190  		rc = tpm_buf_append_name(chip, &buf, pcr_idx, NULL);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  191  		if (rc) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  192  			tpm_buf_destroy(&buf);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  193  			return rc;
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  194  		}
6519fea6fd372b James Bottomley 2024-04-29  195  		tpm_buf_append_hmac_session(chip, &buf, 0, NULL, 0);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  196  	} else {
27184f8905ba68 Jarkko Sakkinen 2024-11-13  197  		tpm_buf_append_handle(chip, &buf, pcr_idx);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  198  		tpm_buf_append_auth(chip, &buf, 0, NULL, 0);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  199  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  200  
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  201  	tpm_buf_append_u32(&buf, chip->nr_allocated_banks);
c1f92b4b04ad70 Nayna Jain      2017-01-30  202  
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  203  	for (i = 0; i < chip->nr_allocated_banks; i++) {
c1f92b4b04ad70 Nayna Jain      2017-01-30  204  		tpm_buf_append_u16(&buf, digests[i].alg_id);
879b589210a9a0 Roberto Sassu   2019-02-06  205  		tpm_buf_append(&buf, (const unsigned char *)&digests[i].digest,
879b589210a9a0 Roberto Sassu   2019-02-06  206  			       chip->allocated_banks[i].digest_size);
c1f92b4b04ad70 Nayna Jain      2017-01-30  207  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  208  
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  209  	if (!disable_pcr_integrity) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01 @210  		rc = tpm_buf_fill_hmac_session(chip, &buf);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  211  		if (rc) {
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  212  			tpm_buf_destroy(&buf);
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  213  			return rc;
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  214  		}
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  215  	}
991addbbc9ef9c Jarkko Sakkinen 2025-12-01  216  
47a6c28b6861b1 Jarkko Sakkinen 2018-11-05  217  	rc = tpm_transmit_cmd(chip, &buf, 0, "attempting extend a PCR value");
27184f8905ba68 Jarkko Sakkinen 2024-11-13  218  	if (!disable_pcr_integrity)
6519fea6fd372b James Bottomley 2024-04-29  219  		rc = tpm_buf_check_hmac_response(chip, &buf, rc);
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  220  
c1f92b4b04ad70 Nayna Jain      2017-01-30  221  	tpm_buf_destroy(&buf);
c1f92b4b04ad70 Nayna Jain      2017-01-30  222  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  223  	return rc;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  224  }
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  225  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

