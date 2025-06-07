Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D59AD58
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jun 2025 00:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749257167; cv=fail; b=Z2WzieKYvCVMmUvIiMKwqdX6f/KWqJyxh+pblMwlPac+VlUD1RAMzVPKKicM3ZhO9kNq4QpqslwVEJ/55hUPYMupTGIdO4KpeYlMyhtsGjKZ7HIBEVRHSGaKD2E++SmKUPv9vMPYbLKvxG5qV9NrMbv42t8iFH1zGMZbhfvkjsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749257167; c=relaxed/simple;
	bh=KimJgpKIJZebDMqgrpTWBgumq9koQFXMyIEY05H/CRQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rboNx/2Sdptlpe+yOJIeO+K69TCGvuU5q2iaLI9srTimY0jaKS860245Jf15tfmbMGEP7X4zB6D+04VgN8Gd0XkAIAkxNbgJ6K5n4ijud7+OprcqXlmKp1PcAUCUnHkuW8GRxy/aZ+2DOTlO+oIERZxzyonuoVULzQn+vGeRGCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O28P76Ll; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O28P76Ll"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749257164; x=1780793164;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=KimJgpKIJZebDMqgrpTWBgumq9koQFXMyIEY05H/CRQ=;
  b=O28P76Ll4dwuQKzlj6o4NUG/SAYkC6nZKaygSzINTehPaKrlsFfHxoRs
   a2nJeggzCx/q5JkoaAecUliq6pOh0Q7Cx8hjLpyLiH3zmR4/ICd4ermJW
   8Wm96jBmr7cFwTJio9O+b6T5ArXI7RuU8Ye7RawWdCzeMkAgP9SaNqt/K
   wkX250yn6I67hDxO0+STVJMpzrc1HhkCYbVT7ZwseIrLwN81FFKLgRozC
   dPxUqqw8XzVBRibceDOXY4JUaWNQ29gA3Ai0++25ZftxqTRrI2q/AkdtP
   Ga2XKRkyKvvk+zd8Yc3ufM1cO0bu7JshTcBx7D8Kc1UlUhgyLXatbYjEv
   g==;
X-CSE-ConnectionGUID: IdkM7qDKSR2bH3ob7EZBKw==
X-CSE-MsgGUID: rGhxOMIhSCSD04689sTFoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="62813117"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="62813117"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 17:46:04 -0700
X-CSE-ConnectionGUID: D1Hs9aeQQSSRXi0x8TdEqQ==
X-CSE-MsgGUID: cJVDTXw9Ri+7sOaRQuVEiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; 
   d="scan'208";a="145890486"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 17:46:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 17:46:03 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 17:46:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.46)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 17:46:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3XMY4ho7+cvIV+ll9dCTyM70Nq4mJQD39sfw1aslGJWNpqjYC5altnixG8/MpK/0f1cDmB0uofgs449HR2WCR9MZtOhSkD4GrO/gu/xgwG+gcZ8aazIAhsakSlyIR7i434ZsmIelWXp2XGw+/RwxsPM+jf+wTMUsqf0sjp5JoydT1aA5sUSRmGn7CxNISDh52mwUSoyDiaep2AlgW5V2nVX+0epFtGH9y9lHYVYKr/q5TxZ6ehVSxKSagGpzrqG45sAYywPS688x1KGEOqv8pC9ulSZqTbQob0Late1kvJTHSr7Cf68y9mG9YzwXDF/e8ySVtwhYRUcE7B9ODL+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLpulqLZM7AJkbcuIu9LuSm1RuFoZ+Dejtya3XxPWyA=;
 b=F3ShYNVNqe61FsfntdEj4mQqVftO85w0OAis4Vk4hLhvBbkKL4zvF0Vb+K3BQLtHSJAUrjCMsnXN8QSUH69CLQ7zj4VpnDot2G+QVFTqf8ffHgRtCKopfbJM73JUNsHSEu+8LE1xAFUevjGAIixCUJMOF8JBCVpzq7y9323ua41Z0hbirgKeJF/COM55D3F/WUuDRulXG0CqLRbWQ5QqaPpDypufs31h3IAn6u3NTpqbDHbmY2iatFLnXAFD40Z2nDXYjmdSeOqB/lUwc4a0cqfrYQbwW1gCy3boo+kmFeMvI0CpPQrA/v2UFPsSAJ0tZ2Z1yDDV0LwcLctP/paEjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by MN2PR11MB4742.namprd11.prod.outlook.com (2603:10b6:208:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Sat, 7 Jun
 2025 00:45:47 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.8813.021; Sat, 7 Jun 2025
 00:45:47 +0000
Date: Sat, 7 Jun 2025 08:45:38 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC 03/13] objtool: Disassemble code with libopcodes instead of
 running objdump
Message-ID: <aEOLskiE76LkfTAu@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250606153440.865808-4-alexandre.chartre@oracle.com>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|MN2PR11MB4742:EE_
X-MS-Office365-Filtering-Correlation-Id: c525f171-89ec-4aaa-63ca-08dda55ca412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Oroh+H6Y73WL+G1itl1dZ/3XWSeHL0YWBr5kCZfxiSefB2Y9IE+sRBqsVlxa?=
 =?us-ascii?Q?D24o3LQE9nf583sYnnf7ER/ZRS9PWU5dJn/VuzaXhkIqCPDthduW3DRuuxNN?=
 =?us-ascii?Q?g8ybmQ1LOQL1DVTPKG4ElT/2jem1kTnN80mqYB8x1d/UEbnWyLxaqE+lBsWA?=
 =?us-ascii?Q?2QNEEdSbLle2JSeAakOV3JCh/oUZTtIvRWrn7jhLdi2DN2iPba+1anXKZTij?=
 =?us-ascii?Q?4iQR0gWFbv1GmOCg8J0WMM/uZCI9n3QHV1Grv+713PwISETkTkd78jwMej1B?=
 =?us-ascii?Q?vWB9fLA0IwsbIFVmYlks9Svkz38GkJsQ1j8IoeFci/DIUcg8YTXVzTqZa9ic?=
 =?us-ascii?Q?xgf83yDmanybk0ZmFrs7EmqakY12wGQAp3AF+8bRo0BCeVsnMZj8Ag2POLF9?=
 =?us-ascii?Q?JTDKNlYLD4We4sUzO8jMDKEUU5hjdgH2UDq31ozkIChvINhTp5+QpxE01eNk?=
 =?us-ascii?Q?SEneNLSxdamWA7ojTnME7Y6Oxg+CR6SlMtjSj2dLFRnXbqAeC6R9eSW3z5H7?=
 =?us-ascii?Q?CaOaEx+a3X+7JOB01obGtbgAF6oLTLOPuZ648mjT+yt8rQFICIJsuP0MTnl7?=
 =?us-ascii?Q?BDt3hfPAdWesYgDU6IEMbdQPz9iN7dayhflPgr4nVU2ZLJkrQ86aWqAizcFM?=
 =?us-ascii?Q?+IMDsjP8W7yk9zK0mwBvbcymjba6ZSZOk8m9kaZFrqDrTtgUzHo4wzuqMjvW?=
 =?us-ascii?Q?6lxnuzza8+S5A1FiR1wRRFlVyYoJWvTaSTkLrj/ZVhsurdAMNSFlIERtYqYD?=
 =?us-ascii?Q?uOIYDE41EkqO9B+ziV+bX/jX+ZYfF2nSirAuePzrJT3tOAep5KRsq/H+XIoc?=
 =?us-ascii?Q?WfXikc7zCOGpxtFsTF90s7E5f/Pzr3UPyIV2UQJjshzq9EpFQj6Q1j/X3Pim?=
 =?us-ascii?Q?V9WL1l1MH1R64zV9cjE6pPnAIPDI9AHT5Fgue43f7YZ+rY2pW3dJ+T0UONCl?=
 =?us-ascii?Q?f2Jtlyyjuhhawbf2WJkuUrTYBbxaFODknV40nFHQCMz0sB6ldjbRz/nqRJ1h?=
 =?us-ascii?Q?QUT0FNff/s/S+iuj97Y6u0Sz68A/QcvH5HkBxtKIsVqQempuNOKCGu1AT1wp?=
 =?us-ascii?Q?Skj+Oafs+gqS6kn3Ts0zv0Rdpu4N/RgmRAPWXY2/9+y+236uwSCNsPmt9DxX?=
 =?us-ascii?Q?Sl11p9sCGw6aChWNcO/WblK0uy3mAJKhLF8v/QB01mqknN3RMA4WGUKBy0jy?=
 =?us-ascii?Q?SBq0lNk52SBF3kjCxfLndBdCDAfDxuye43BV2Ty1UTEsCmML7pn1dTBKfJvE?=
 =?us-ascii?Q?2sZKvvFdCCVI3OftLEvlL+aqcRd59Ycm4VPdIPR0tEuoDA5AuN0jJscAUt0G?=
 =?us-ascii?Q?m46Ux7COTwpAE+EquBOt7YLFPV5Mj1d/E6FZNXuash/tn/nxzADO/1/4qEx5?=
 =?us-ascii?Q?Qim+nGu6ct53yNRJjZ6u1doixhEl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9VuvdP3Z/IllZqNStznuQnaQiW4gklq1K65lxmG6CMGQQybtB+2pG30QWHPl?=
 =?us-ascii?Q?8dhOxMqKq6ojOkdSn6L5srF+rT5eq5whMPFnBwF8ya6s86IIKQn/f+LQ5v19?=
 =?us-ascii?Q?Q3QuPJyvvUuDJpv8m+VPmRV1fBtwXSJ1zL3jpnE/ft1M1cQamo3O97yhjuPY?=
 =?us-ascii?Q?+u+OEIBre32V2UfaBGzM9L1G/PX/j/85HuiiIH1FLRCahhAOGaUIQYB8lfpY?=
 =?us-ascii?Q?Mo47tYx5e+VNfaI7IvvbAf7oPllaGT11xub92N43qXYM8ZM09UP7Ugkhpx7/?=
 =?us-ascii?Q?K8pHY6yOkz69pJ3tQAQe60STKefKxXUjEHyk9siHTVTVr87+Af6ZhhHoJTK8?=
 =?us-ascii?Q?a3IF3sV0HKApF8C19wNRSL4nITUK/SHcOxbowtzMmG9NtdwPMwtREJuWJL+d?=
 =?us-ascii?Q?kuaOO9pgBWFTyi/eaRWJ57qkjxo6LJfIBozQbwIh9/txSltRQk9XYtZih5hW?=
 =?us-ascii?Q?eWIEUC6997p4rinkXF3GuLW94zDz5433gX4ab4y0lk6NFvRSqnFYdQfMLShG?=
 =?us-ascii?Q?9Ok1d9MceBJ880Gtcin0QTH8pnzysZf5Ary+QewskfDziV6CNBFfTLiP3mT8?=
 =?us-ascii?Q?D+Ww8nTLCv3EYE3aQmf3nr5uZ092CEgQPG4ETDxAt9vWeCYIndKGW4vBuAYu?=
 =?us-ascii?Q?wuyF8wgBPgdZS+Ewm4klY72GdL3CWGVHoH8ff18QDYYyLhVmpGobmd7KDfzQ?=
 =?us-ascii?Q?2wuc7GDa0yiWE1bl7XAu91PPtWSbLB8VKuM20pfshjIjDJajpu1wSOIFoYwK?=
 =?us-ascii?Q?PgV1CVgDnDaqvICZRUq/FpG84ehMVrMkci8sqTxAoEtS00b/uwYZRg4W9psQ?=
 =?us-ascii?Q?h7nWgiRzw4m73d73uQbVq7sJH7Jf5ExIfzfSVxpqdvnnTBx3jVyuLu3/p1LL?=
 =?us-ascii?Q?A32NWPeSDFyV0f+P0QueBwqyxJ9xDzfZV3u3IlKrTjoxxB0wzc/umllCwCiq?=
 =?us-ascii?Q?Aw6rVZU6MvQLn6kUnqXdV8rPGDiJoYNUQH4Tfqt0F5FPmcrqlJJ5VmtXxzXu?=
 =?us-ascii?Q?7FfIsWNK4DrZDLoInJ4dQyK1r7Z0kAJfA/TogbsUyf9aVn/VNdpIA3HwOxHD?=
 =?us-ascii?Q?0eE9bripv+e7e2+stXzxpCEm6sZrWzCxVVD8HFkZnqopcz5Y7zWbnQrGylwR?=
 =?us-ascii?Q?4HtmJbnvEEd2rCYbi+FGdx1tRkZdrKJT73g2nms3f+PgIN7/JgeyK4C2/dT5?=
 =?us-ascii?Q?Bhsv47pxkCwvHwK2y8XK1bjfbhz38BeCYoxbQyxnj2FU/1kr3Oyi+1c18Dkf?=
 =?us-ascii?Q?5xYTwt2sL5Si3oulzNCBRkzFrItxHsLo4PNB5eyXFj03YrzcnVGq6/7z9+Ka?=
 =?us-ascii?Q?68+169zoF7HvXy/Q6/3X4ph12rFSSu74F6qgkDhM9R9qCvwcrSeM9Vq/uWSD?=
 =?us-ascii?Q?746opyamUJy0aM53YAjWEJxheO4ez619osgrCroDnVBXnzMgzl3aYcLucxAI?=
 =?us-ascii?Q?FrjAh2crBbxTqYPU5OqhrMnrTLJoye2FujYtvh3FmpzJkaA0apbpAwwUTPr+?=
 =?us-ascii?Q?N2k9UPk6dgOBcTIHXEqpY1aofJsnJBBKzhD8BOVehEf3/Bf4RHE662Z++j/n?=
 =?us-ascii?Q?ZSyc1AUzlTisKecF4r3iZmDsdWFdMYxxe/hgiJTgj5FtOx2UilBK3wl/a5aZ?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c525f171-89ec-4aaa-63ca-08dda55ca412
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 00:45:47.1739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWxjnehXEMXx02HhRIQhazgr7NIgL37+5B3aD5f2FvTPo8z0JFRqsIue7FOVoDDSJK1GmJRiEKA6KMhfb027nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4742
X-OriginatorOrg: intel.com

Hi Alexandre,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Chartre/objtool-Move-disassembly-functions-to-a-separated-file/20250606-233948
base:   linus/master
patch link:    https://lore.kernel.org/r/20250606153440.865808-4-alexandre.chartre%40oracle.com
patch subject: [RFC 03/13] objtool: Disassemble code with libopcodes instead of running objdump
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20250607/202506070147.yRx7HyNf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506070147.yRx7HyNf-lkp@intel.com/

All errors (new ones prefixed by >>):

   1 error generated.
   make[2]: *** [scripts/Makefile.build:98: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1278: prepare0] Error 2
   In file included from disas.c:12:
>> tools/include/tools/dis-asm-compat.h:10:6: error: redefinition of 'disassembler_style'
      10 | enum disassembler_style {DISASSEMBLER_STYLE_NOT_EMPTY};
         |      ^
   /usr/include/dis-asm.h:53:6: note: previous definition is here
      53 | enum disassembler_style
         |      ^
   In file included from disas.c:12:
>> tools/include/tools/dis-asm-compat.h:51:23: error: too few arguments to function call, expected 4, have 3
      50 |         init_disassemble_info(info, stream,
         |         ~~~~~~~~~~~~~~~~~~~~~
      51 |                               unstyled_func);
         |                                            ^
   /usr/include/dis-asm.h:480:13: note: 'init_disassemble_info' declared here


vim +/disassembler_style +10 tools/include/tools/dis-asm-compat.h

a45b3d6926231c Andres Freund 2022-07-31   7  
a45b3d6926231c Andres Freund 2022-07-31   8  /* define types for older binutils version, to centralize ifdef'ery a bit */
a45b3d6926231c Andres Freund 2022-07-31   9  #ifndef DISASM_INIT_STYLED
a45b3d6926231c Andres Freund 2022-07-31 @10  enum disassembler_style {DISASSEMBLER_STYLE_NOT_EMPTY};
a45b3d6926231c Andres Freund 2022-07-31  11  typedef int (*fprintf_styled_ftype) (void *, enum disassembler_style, const char*, ...);
a45b3d6926231c Andres Freund 2022-07-31  12  #endif
a45b3d6926231c Andres Freund 2022-07-31  13  
a45b3d6926231c Andres Freund 2022-07-31  14  /*
a45b3d6926231c Andres Freund 2022-07-31  15   * Trivial fprintf wrapper to be used as the fprintf_styled_func argument to
a45b3d6926231c Andres Freund 2022-07-31  16   * init_disassemble_info_compat() when normal fprintf suffices.
a45b3d6926231c Andres Freund 2022-07-31  17   */
a45b3d6926231c Andres Freund 2022-07-31  18  static inline int fprintf_styled(void *out,
a45b3d6926231c Andres Freund 2022-07-31  19  				 enum disassembler_style style,
a45b3d6926231c Andres Freund 2022-07-31  20  				 const char *fmt, ...)
a45b3d6926231c Andres Freund 2022-07-31  21  {
a45b3d6926231c Andres Freund 2022-07-31  22  	va_list args;
a45b3d6926231c Andres Freund 2022-07-31  23  	int r;
a45b3d6926231c Andres Freund 2022-07-31  24  
a45b3d6926231c Andres Freund 2022-07-31  25  	(void)style;
a45b3d6926231c Andres Freund 2022-07-31  26  
a45b3d6926231c Andres Freund 2022-07-31  27  	va_start(args, fmt);
a45b3d6926231c Andres Freund 2022-07-31  28  	r = vfprintf(out, fmt, args);
a45b3d6926231c Andres Freund 2022-07-31  29  	va_end(args);
a45b3d6926231c Andres Freund 2022-07-31  30  
a45b3d6926231c Andres Freund 2022-07-31  31  	return r;
a45b3d6926231c Andres Freund 2022-07-31  32  }
a45b3d6926231c Andres Freund 2022-07-31  33  
a45b3d6926231c Andres Freund 2022-07-31  34  /*
a45b3d6926231c Andres Freund 2022-07-31  35   * Wrapper for init_disassemble_info() that hides version
a45b3d6926231c Andres Freund 2022-07-31  36   * differences. Depending on binutils version and architecture either
a45b3d6926231c Andres Freund 2022-07-31  37   * fprintf_func or fprintf_styled_func will be called.
a45b3d6926231c Andres Freund 2022-07-31  38   */
a45b3d6926231c Andres Freund 2022-07-31  39  static inline void init_disassemble_info_compat(struct disassemble_info *info,
a45b3d6926231c Andres Freund 2022-07-31  40  						void *stream,
a45b3d6926231c Andres Freund 2022-07-31  41  						fprintf_ftype unstyled_func,
a45b3d6926231c Andres Freund 2022-07-31  42  						fprintf_styled_ftype styled_func)
a45b3d6926231c Andres Freund 2022-07-31  43  {
a45b3d6926231c Andres Freund 2022-07-31  44  #ifdef DISASM_INIT_STYLED
a45b3d6926231c Andres Freund 2022-07-31  45  	init_disassemble_info(info, stream,
a45b3d6926231c Andres Freund 2022-07-31  46  			      unstyled_func,
a45b3d6926231c Andres Freund 2022-07-31  47  			      styled_func);
a45b3d6926231c Andres Freund 2022-07-31  48  #else
a45b3d6926231c Andres Freund 2022-07-31  49  	(void)styled_func;
a45b3d6926231c Andres Freund 2022-07-31  50  	init_disassemble_info(info, stream,
a45b3d6926231c Andres Freund 2022-07-31 @51  			      unstyled_func);
a45b3d6926231c Andres Freund 2022-07-31  52  #endif
a45b3d6926231c Andres Freund 2022-07-31  53  }
a45b3d6926231c Andres Freund 2022-07-31  54  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

