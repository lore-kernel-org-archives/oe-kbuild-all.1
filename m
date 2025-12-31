Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1891C84D0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767189352; cv=fail; b=Hu5jPsjfXYC+B18egRHKkniDhjpO424qNY5TLWmKW0o1XRyTl2LFgT3Y6cqi4owMB+OgXDh6bw81cj/KN8UckJblWxPDaAEKhsigY1kjgTX/jCh25SMsoUmY1XOISSzFst29Uo5GyFmHTmaylokeeiZ9d/LhAfGplijSc4HZLj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767189352; c=relaxed/simple;
	bh=D4iD3QtkOtfVqlri5Rpv+hBVOvSIQ+PhIgI89Ec3+tE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=M7orMziyz9fbVEBd6hLXx69vWuaUr9oFhoAixoTWh5Pfslv4XrRf8SILPaSnv4LYGKm6FZcgmQr1C9lqvmqDd9O9sqCTskGzjuybmUc7ETFSOM7zbb2FF9orSwjm+oqc6VzQnFcxkzJUtMDKtVVw2fM018C8GDjaZlTOUCIzrFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ht3BdWsx; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ht3BdWsx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767189351; x=1798725351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D4iD3QtkOtfVqlri5Rpv+hBVOvSIQ+PhIgI89Ec3+tE=;
  b=ht3BdWsxySPn0TCfj9xRIzGE3kxPvYhrXYfT/om7zxKuCJkLrfgro1bo
   uykr5r6HVvn4NB9gcd5FzHvxSc7qQPr8s790wkfkAR0AR0uxZkj+TtUm3
   mw1PtsxQIDWEJT6x2sevwkEqUzyu6gjr4RUR2npbUD/xh3jwRgJTWHeJw
   K1Cg3GpJNYGQmWXiw9nJTLQKzCp2zvU8LjuWV+JZHvyWBuHy5jfTgDTPs
   nKfXcrcOWlcL8iJulHv3K58+aXxDJpp7HPFuguha8bLJRPWfGovXkxGgV
   Tlf5Z1KrCszgamh85e2LvkWxX1psSnWCwLHNSj5ZfkXbZbRDwlOCXkosN
   g==;
X-CSE-ConnectionGUID: Cx8lt6L2TpyNm24GBopvog==
X-CSE-MsgGUID: DgyQoUzxQrqcAhEAKjgj0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68656501"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="68656501"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 05:55:49 -0800
X-CSE-ConnectionGUID: ECtnUIBSTva5db9Fcp43cQ==
X-CSE-MsgGUID: zYIIymXbRSKPY8IzTfxFig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="202397382"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 05:55:49 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 05:55:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 05:55:48 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 05:55:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qv8zR6Zx/6PNntelJWCcg9GyVyCFaB3FaiHmoMhWkdoM9nmoQrPokl+THufiMjh70KRclbBtPwTzzie0WRm5akkgBPTiIYFA+QSeBwhCmjhORC6y3fx5R07BgRX71LTWwMoL72F2O3Fv7Oqz/Oam/xaOjMXRxwg4Dat2P5U0d97DenP74uC32SMP+0blK5+vrfN5pGUQ3jhPaVNb7y/UvMiFbjA/Dk/2Qdfm5k6pSNdoxW/hSMBXGY/sYf/QWzRYkPc42KPWldoJx8Dny7L7yi51HqCDJ7Fj/vBsK12AAkqJUdtXUf03ht+A+P59a9gZrzopkx9T+us4XEVOKesyqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSEcxWN4trYqLqm9r/PLMFqAbUNM9mDZ7PjkytaHWuY=;
 b=K4WAlXLAcOnNG2caQdL0tKFU7B3vZxTcOyZwjMp6bqjWBnhyDANLlw0w2Q2j3a5FCZ88uTG5KRkuCkEM0/XqwLJ4vO7tseOrOuYLInBoy65xXlwMu8FJ60LNyU9K3tdEb6O+R7fBR0/kvYJJ+7zA4fuA23aQ/FuGhtHhQa24mFJEQpjA48GaoU7ej8P7Ms6288kYJxs9FtV6Cu2GE8zO+MA9YDlH9QOgbMdLLP7j9MmE959khu757/Wrkk+m4NJvIbVNgmZ82hjykpKwoQgRrj5fCJu3gMKq1XkO4fj7IUXP9wjBORnLoWBIIC4dbfQoCYGIX0jSV4GJFqe66K9s6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by IA3PR11MB9158.namprd11.prod.outlook.com (2603:10b6:208:57d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 13:55:47 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9456.013; Wed, 31 Dec 2025
 13:55:46 +0000
Date: Wed, 31 Dec 2025 21:55:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [rppt:hugetlb-init/v2 22/28] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'it'
Message-ID: <aVUrWxgUmXFgh3wU@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: s-nail v14.9.25
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|IA3PR11MB9158:EE_
X-MS-Office365-Filtering-Correlation-Id: 63951953-1db2-4fe6-6e4a-08de48744c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k78lWmgccEHIr+ym3lYHzW67i/CMoTxizhPc9EOXpr+pHRRXleLENjEPUIo4?=
 =?us-ascii?Q?t4rB34l7AmzvN/B/zKo+/oGpYvx3nSLRGhft67EuX09APihy1z/hztLdateD?=
 =?us-ascii?Q?eZm9QB1pBQFFgt8lGA3WrK8grVmVgMsCZG17uE+QWGkbDLjn4vfevJJwoNPV?=
 =?us-ascii?Q?8/6yy6WsDx43nGtwj0xf6y0Oebf2YtGo5O5gbzs/dahoMcU8V0Cjhg7Qhy7Q?=
 =?us-ascii?Q?EtqkxO4n2Cr0SRLbTrc3wNDw/FIf3EEVV2o5FtiYHviYNIHbDKFP/7taOVNr?=
 =?us-ascii?Q?MRazMq4kKINlx0vAorYi6Z85l0AoZdkEKl0+ZPHn/LfFwkhD2LyWja0ZtZbL?=
 =?us-ascii?Q?KtcrOxWmqiJXHy+uCqhfgmfNPJV2NeW70hYvXoVjY0T/RytG3wMXmfvj+O/K?=
 =?us-ascii?Q?yXK7dePGWhJk/XF9h4M3mmP0uCOoehGJMjXXFYTm8BTxziA6qOFTNFfAHu7x?=
 =?us-ascii?Q?vQU8/jC2epfe3G43iMPKG0OHEJn56lIRqEolyWpDUeaAai/Rf4HrVYpzMKCI?=
 =?us-ascii?Q?ykTmFsYzBX793GHapaEpbftPbJRkcFIWrocB2wMvb+nKiyE+JyPSO21P4dvd?=
 =?us-ascii?Q?slZBn0jC1BPpmGR6ESqF6rZ9o+4VdPLwTGNHRfgl/vLHcMIWesgPJ8dqUlW2?=
 =?us-ascii?Q?u8yyDp3GoVmVWbG/BMZCg2mU2DbKsAiA9cuH32RS7Ql1xe51ajg+Bl6LUG1U?=
 =?us-ascii?Q?2ZHa9wFCzvvErCStzBlztNuFU6ssPr2oB4phtLVb9SO9vUTTz1Gs4IPb701Q?=
 =?us-ascii?Q?ZLDGiQpFIVzGFRvZBYQ4DdWTHXYzQ4ax5dP7Eu0+IYmBWfWAIe5lBp7sRO0E?=
 =?us-ascii?Q?/je/0Xadq2g8zTuZhhDANX9G2vt5+i+WZcEiT1SlGWzeySpZaL0iv6a3drj2?=
 =?us-ascii?Q?1avpUT8FuyRg/EJuKHCYy8G9wZsZ+uiu2xqxkiyo2nymwMuwrOGV6o/cfheo?=
 =?us-ascii?Q?JVM8qLOxn9PldL87dy6tIWT+b0TJFFp4uSiX1BcKNqt2sbqKb6mz6H00PcH5?=
 =?us-ascii?Q?LD5NPuiDtzGjeBSUu4JIuYLTxREESOQpLlREV1M0evfK0qIpy6tnSJKugcRs?=
 =?us-ascii?Q?34ADc5KSgZBoe6l/js8j6tzybMlJJ8R/X0K8otvcIohwh+hL4I4ipKIpIBGB?=
 =?us-ascii?Q?X4sEaHLini0WXAJgFBIACnHhoH0TrRYbBE6whqEkCuRiESZaccs3yy81KK5H?=
 =?us-ascii?Q?XQ1s5R4D0nB9DnSi5fwLaVknhOeGg2dyuWVcO49Gkhip1cPfZF6etIXXag8n?=
 =?us-ascii?Q?8OvdKL0OPlAGUnP5yKTqNEn1DN/0t7/snpjVD34FESncb0s0qMRh5DRjJBcS?=
 =?us-ascii?Q?GULQikCQ5Ty96p0lCltT3i1NB3ViPjWU3d5bgoM0avd+Xfe0+5WeS7jQXIhK?=
 =?us-ascii?Q?9x51QDayDi7Ue6a4eQvbpAzUYnDDk0I7IBKhQjF36GfJD/jv/MWF5o9JUPw9?=
 =?us-ascii?Q?9VgoikwV/dGB93PiceiCf4gni3zVAjdqtheyQA3HQJyafTvXgjM+LA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vJ/EDuZ8BercJfxKJX/p9gsl1TVcVLhzauhUnFsQFu9gRjHzYyWNNJCTTNqU?=
 =?us-ascii?Q?FVFRoRgW8smkRhITuHNldxctLNQBfwzJap2YXn6WonWUc1ITuPNcEdSohBjN?=
 =?us-ascii?Q?ldDWSHYl9uMdQFzKJny4AhEc3fA3bKuor/Lp5o8HUJ0WXEDopEaelXkgHFFM?=
 =?us-ascii?Q?SEVEh1WGyTci9+gg0mvFtY37xoq0pTtV0UsuAsrVPz9oDn/sToDI7oQBJVmd?=
 =?us-ascii?Q?Ov0ctMkH63sGKkFnirtpUhecsoWl6aym5R5+Z4n1towSp6SOxS5jPZiiuhLN?=
 =?us-ascii?Q?sDIahU9fTsdCxuJbN9i7CUB5fdYroutXfepjYOrj+Y1Xwhdpysy1DX60kyD6?=
 =?us-ascii?Q?xp0m4mda194wAajEomxuDiuA3kXKY2bJoIGXn0xT6QiD0yUwCrOcehOgsqPG?=
 =?us-ascii?Q?q3Jk3YyxZpJFe4u4J1OPNeaHq5pfk01Asf+vklRHY7aO2ZifVa0NWvUWAwBz?=
 =?us-ascii?Q?EPIWcpSIOnvFxVFAAqaK43Uc2jifn9Jp7/slu9wOei39W/4VHcljIi7kMtjO?=
 =?us-ascii?Q?8X0jTm0TYSRyoh1FhIVki0VKSq9D13coO50LMsWuD9jT3brHqB/kXNNoYjic?=
 =?us-ascii?Q?EFesj8BPRZdcaRGJ4oUVPlU2iUwtQHoWWYKOg/hN+id4emzDxpJrkLIKAIFr?=
 =?us-ascii?Q?CUt6/FnAu0AfEt9ZPwQqEohcajHgsFbnVy5fNXUKXCS4Yl+n4NL7+EiBQ4z7?=
 =?us-ascii?Q?Q/HFiKr8fscB7/k/7Gp6yooEcgUO1etk3x8ooCnS+LdYoc5hRmKfKkcUg5e+?=
 =?us-ascii?Q?iYpxxvgrUrKMLTprhUfW3jYekEYR0bHkdWg5WWsAsnYysRj9uzFsMW2L9jAR?=
 =?us-ascii?Q?Iz6R0blNGhr6KwXUfBWHs8FmkAYqICiQhTi6ulnGX6hHe4tDYPHWXHGjU5Yu?=
 =?us-ascii?Q?fgm47d1ZiIRkwEQd+ZMsHtO0ywFva2cyYmP9V+ZoC5aM/SkyaeCOV4Wzrf2/?=
 =?us-ascii?Q?xxJ7klyPo8Z3PtFrJF+fK+DEAO5FjKgjtS8+iyXXRLbCjqYr9CHB37nIn4FZ?=
 =?us-ascii?Q?eEtkjc6lDqI1VnaUK/RhelX0Wo6Z1aPv/6pWuaIxTZZ7/s2ac6srjYlzaQMG?=
 =?us-ascii?Q?YnUukI/UZ8zO5of1ACoRqiMczOgBlYDiSNIWNPPYdJ0T0JsETQpRGTq0AjT9?=
 =?us-ascii?Q?cOjL9TYx0rFTDi/jF6bWe3O/QvvqjjbdbvWzDUUDJm3Z+fddVCS+e/MJQDLr?=
 =?us-ascii?Q?g3aDMKXZnOeyCL0Y69uzQDO4CYhWsLo2fjTx/G660T5cX3b1qvTSi9kfJIKd?=
 =?us-ascii?Q?TviYAqEBQZFIOX4DKCdBaYNZoIe4gutMZChcCg3j9RRmsPaVOlrYb4Okk/4H?=
 =?us-ascii?Q?c3XQX4LkvK+pccqoBGQyX4gf/qoxJ8E/lLfqz1zROkh5RAf7d9yMvZ7q6rVg?=
 =?us-ascii?Q?wDCgEuSdnRBDYAhX8snFtqZig3rdNqRuthmrnCpDVMREKZYQdjpMsM5MkED8?=
 =?us-ascii?Q?uC5znJHNxJXxIcA7e3p1Jwge4g5oArEEYSVWIJyUUP+O01kJyuvZSP0mJJbm?=
 =?us-ascii?Q?3ZDZeEFP2Ayr8XkmssQ5rvVqMS/wLpwtF6CFs3+EpI/tfJojcRtoAkm9UFKX?=
 =?us-ascii?Q?2JFF46eULfavzWZSC17RU3JM6j/mRn/iHPgIGc5Ue8OnPwi5vGm0gaHTndno?=
 =?us-ascii?Q?5ONWsXWOME12Ji8I/sKCeeRNblDVmj7/QsbJKQMx2l6jX+IpaNTN0IWzFD+T?=
 =?us-ascii?Q?HtrbWFwg9loY5edP7Jo+61e7k8Gpb+TN/HJ1wpdQY7YbQQtJnh6/JcueD3h2?=
 =?us-ascii?Q?f+TVSF1IJA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63951953-1db2-4fe6-6e4a-08de48744c4b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 13:55:46.8670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWYqN2kDxAStx1G+9TpoTe1n1l+DK5Q6LrKmdPc66GEvxbBWLdiWKmIh6C5j7JDUwkqX753K2X86nOECgjZGRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9158
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git hugetlb-init/v2
head:   7d599e1adc180839a78060d547becaa0d5bbc061
commit: f3a9ab7909ff815b296d1893774d4bb7d816d61f [22/28] arch, mm: consolidate initialization of nodes, zones and memory map
reproduce: (https://download.01.org/0day-ci/archive/20251231/202512311100.blYQXq6w-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'it'
#29: 
After this refactoring it it possible to consolidate hugetlb allocations

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

