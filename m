Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474C91946BC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 05:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770700833; cv=fail; b=H1cbG877sK2hvxpJvPaScWSYZhrGVPXaGSYMqiE/PHeIa63AuGz2UDY756Md8fDz5zgXAFU94f65W9Mo9dIGM+QPrX8l1xQJs4RM9grd/5I++mE/NCxjdbXmKQlIjj1eC87D/d5N1Uaw/otGj3CJcjJoJfnXLVM4AY/jFfHXLVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770700833; c=relaxed/simple;
	bh=7y/Y6LUhPU+4U4XgrQMGyYej1Z6358XSDT4zYpoahOw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=rn+VF9+AuPBD41RYbq2UCBUoRiWEC2dAnhrqPewYUjmZiz4fVcScfdtTihVFe1Ku8IUN0otIXySk7k7186qW9XnihCYWZ7iPdG0n/KicfsWhqAL3IAfMzlimPIOFt6KNnZ1gPBIzhRy9S2UsTqWJRVK7DzG+O473SWvzGNCIsgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcjsFfsh; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcjsFfsh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770700832; x=1802236832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7y/Y6LUhPU+4U4XgrQMGyYej1Z6358XSDT4zYpoahOw=;
  b=UcjsFfshi+bW1fdrAMGwHZRXb5fSwBVL5vZrskm9bcXyxE/RkNZJD0D0
   Y4+5nefg+L4fssBFlZC93qQ0A+Se+hrYjZqcnqMG2WSSEoHIleC2fuz2R
   hw9l8BFb/a8tG6SYc6QjVF7kbkW4yXh2niPxHpYLX6tYU+jSMnXqXC96E
   WTecPpTKGLM7SUoX1EYG7noN+qOYBzRVKGbg6sJ6OvvJqwr1YSyljkOdt
   DBlylGpoAsvm95P3GoaL0zvbXjdx7LrU4xDLYqVAL6/GZadgLngEMekdH
   CzqcdBqBvdLk0rSmskhQshFBFMYiohqIUPm7x2HKezl0O4FAX5wIDs3DT
   w==;
X-CSE-ConnectionGUID: 4tPxR0f8TdaziNbSxlE00Q==
X-CSE-MsgGUID: yyW8yPqySSSvPqM6EDQMlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71863071"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71863071"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 21:20:31 -0800
X-CSE-ConnectionGUID: elNE46ilSbebRogufVdEMw==
X-CSE-MsgGUID: SBHNJH3wTZaxgjW0fJG5LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211127429"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 21:20:31 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 21:20:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 21:20:30 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.54)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 21:20:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DzJNg454PfjetCg3VeDwXqHlB30wGyid/unsspGkbeNVls9kYRYkAYjidQVDBlhYLjtksq3a1ObLAaVrxP+ex1cdzxsYsvYnCSjqhKGuTza9Yy+tqGenNowyBpExbgvcxS7fZFNSjS+eyZHcfonyzSEbRsamAF3BvIk4hyCuKZMuSHSK3nHFIF+fnlzhwP+KeIc71TZEr41FUKs/4eLO6exs2y1790SckJFY4zyQOesii57gkO9LX6tt+xrAVN+YHcnzgmoDbDjD7hn7FEkGruRvsfBfeJtTbnEV6VzkbD/i3NlQAdiDfEsIB3OtTnDQfLYtvIJUh+8mXneK61nUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRDTT9qYaKkakJCqzQJO/wvUelXZR+04U3dzNRcmXhc=;
 b=R3kgbq8m35xi6m7jDXABq8lXrQWn36TDgSdN0HjKch4N+x4g714mwWNUw8sLRZ8EFLs8/wF7LqzGlSzDcs2QCZmrqw/Ng5eVCWtVwxXiuTBrKWbXhVdCj6ZyAFHjvvVL11s9E66yUbAXKUkN1D6xJ57ECZZAaE/f/BLhAWnXgLYUN7LgZYbZWKgoHKiMSrFMuvkXss58mfxAThpHhOrnUUiFQJr6ulW9VtZvTGy6NIS5vwMNP1aaO4kqGDPbu7RILIMLrrycUsDW0hp5Nrme5so7w73QZpbPt84eVyuScVe2VVW57I3Q9cryA8acHImMnLMATYAgj7YjyL/75mYqdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by DS0PR11MB8050.namprd11.prod.outlook.com (2603:10b6:8:117::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 05:20:27 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 05:20:27 +0000
Date: Tue, 10 Feb 2026 13:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Manana <fdmanana@suse.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [kdave-btrfs-devel:misc-next 1/19] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'by'
Message-ID: <aYrAE4/kn45Q60iR@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|DS0PR11MB8050:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1e245e-9986-405d-c461-08de686419f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LVgMr00VSb/mSAo9OsdNVjP8mH/ACVZaNRJ5+GvUpvXbUJZXzMENgD9PFlzN?=
 =?us-ascii?Q?ugCFOktxjmQlmxPZOsCePYxApHE61KIxjM70cPK6h7fH65YjLZu4c/vRo8TS?=
 =?us-ascii?Q?1Her9yCmykXKk+jGcJbsNFy0aBXvmMe0Wk8BNgi1gXuj+mKlv8jwKhyNRNnM?=
 =?us-ascii?Q?+dXTyKNBhmUbmXH9GsaERNdEYHS86LVX5u6KZmNifB2kcQTZKBMhgiGOSQWO?=
 =?us-ascii?Q?nJ+hrAttv8j2Lgbm7PvvtPgbSfzXt67phI+hbr+KNa/XbXKLDxGRwDcuT73u?=
 =?us-ascii?Q?48AoqC9aqFiElrgQbtRcRGUWAjYcLPPHZBcbHFZVAzZEDfzeUSX7DSDH2uPG?=
 =?us-ascii?Q?vio1eOvd0PfSiOINDsWBCmqGKiWanewWhVqIiXzCuUm891d0ntek5cBODHlx?=
 =?us-ascii?Q?JBBUbGsbdN0ZtzPZw3OTi+vC1WNf3rne3K0ADyhnA9QFt6pOhjtWgPPWp9KT?=
 =?us-ascii?Q?Mdak9xHfJmpOoo/1yYAIAE9GcWFtPep/+WQfgpcNL8Fqo9ibFRBZW4kMzBH6?=
 =?us-ascii?Q?4KipiU9qBRzzSKcC2ht08B3qyNrbI27l1YrcpF+pW0IfJWHemhs5RhJACSF9?=
 =?us-ascii?Q?qWc/j9jTrin4tRFM9bpelM+wdgDZqY0UxRU6qWmg0zGMMQ1SEdYt2Kf6xsf+?=
 =?us-ascii?Q?jjZo6nhGZjLE/l7bSs3xy2iadhjkEQYSeZd57lXgXgYzk8Y0SMq+U8E8JLMY?=
 =?us-ascii?Q?9OpPnj1UBrBHItc3v7BUmnx8xASZFfQMMNlDPFG5O2ZgH+4dIjIPwdxnNKP6?=
 =?us-ascii?Q?geObe9yJG/QwBsx8nDbQ/M0v6ecCzkM63SaMhfivblkfUs6bY5Mj567ESgM8?=
 =?us-ascii?Q?nnnqQgRojwpX67rzV9AWgk9oc8cd1YOhbobS//7xegjmVweO7cRocxlLw5is?=
 =?us-ascii?Q?H4Qfn5F1yoKD0zPk0I8+NRYWdeBk+MygWHw4+Na8ojQpb9vKvlQKVkPAbXyO?=
 =?us-ascii?Q?KCAqQffL6q2Za50ao4qU3GecPAB1c2FNCqNUlXG/URsOapIueudNt/uysJT0?=
 =?us-ascii?Q?bzj1IezrtD1KPUDlqnpgVkn9l0NELQniRgqLXQXAOajAlRmKke201AUNwtFN?=
 =?us-ascii?Q?52cwiz2D0OBTPacP0cGte6GF5OvyOhp/VU6HyWj2KB12fOWlmdzHr1oBBRGI?=
 =?us-ascii?Q?gbYe7h1O/CEHICYrMPzYUzfldut/EKXsBxCTUiSBLbH2t5S5W1KxDCvU+4rs?=
 =?us-ascii?Q?201+Glkf0vco+EQDkARH2Q6ajQmILR6TBNkfHIN8wMr8Y5iaYujcHRay/mqD?=
 =?us-ascii?Q?AUvyGGxeF5Mk83/PKw2BAblMFe71JBPPMJn7wjFWMn+jxJc8zoFt4yp4jvaK?=
 =?us-ascii?Q?jytJHwJSdUxG+iVWph+tZ0xowrPi68jUn1zT33UyYOurPn2clWijumz0/KKj?=
 =?us-ascii?Q?WgTQIoqR5xmamJY+9pF2YQLy7mdId9HfJV2NKUhwXD7X/63o3uz8ytZ+XFeN?=
 =?us-ascii?Q?0v5tYXkk4Dv4SmyMjh86biGUGcnmlwUrgXm3gg7aQptktW9gjg7TIwLgEcud?=
 =?us-ascii?Q?SbpqxfldTKIxHC6mbiQw7bdgV250yFBUznw8SSE61QeYZzJdKyMrxiqpMg7c?=
 =?us-ascii?Q?snDBy+VOmzpxc3nZkL7W4xzj0hrP0CB3jP7GQvYz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FD59Wzra0zeqwVjnG2xYPMBtE+Qeszgj5Y6MwbKWx4AUB6Qoju8Z591GHe1A?=
 =?us-ascii?Q?NAv+6GQ35KjBO+iB2ORCjDEZS1r8ExfgMjJj8ERLMglAQCM8Uc24Zy0J/wvm?=
 =?us-ascii?Q?MkuaE1zRwQvBKI5V0dAR1bQMyirtGKLfr3jaJHLHLrJwvnQOuijhOeCOMVpU?=
 =?us-ascii?Q?FCHZk6ImMF3PCzqFn03XrQ+v5sWU2uj4pyl15rmzQaZwSNTueWkcRDmd/tKy?=
 =?us-ascii?Q?y3Rhr6TbSMUX66Lr/4ofZP78ymVfvJaV1UxajRHxUDE27sQlHSLcS7RUPVPw?=
 =?us-ascii?Q?G3aYkS2Xog2qPfJc4PwiM68fZB9DbgztIiWCojXKzDaFrmdavxKMYRErOghK?=
 =?us-ascii?Q?BoD+uJ0NDqdc4Y46v6aHcxyV1WadrFplxFcb3Imcp4y3xBhnZUePo3Q/3Vvj?=
 =?us-ascii?Q?wLD9tVxfsZ0+8AOz3Mj0kNEi3w77B0d9Lj6JillDjrtjiNgxr97IW5SDYYVY?=
 =?us-ascii?Q?mnVcCHWRt/Z1R3xq7weBWSPsAKomsl+sPCzK5UEVe/2soUGHA2j0S1/CYtRz?=
 =?us-ascii?Q?10zbBh6JO4Z0dlqJGTnZzYOwQzzPhtneU/BFCCBSQ0VCzE6Sq77v/oUEmuQ3?=
 =?us-ascii?Q?qhwb+Q389xJhEihuwdcZsY/bdZLIhw1zIOEZlH3nCBhddBimAnnevfGtL+0I?=
 =?us-ascii?Q?lyFiGXiIk9IlNZ1/ytUY/6prNdn4W9Uls+HdVPy3plmlmaxcxYT8qJRY7g87?=
 =?us-ascii?Q?tZyGiQUuKgQxxbXDyW9SEZ6EQXrbAUoH3a21sDF0quUAhNMU1JV6Uuiib5ZO?=
 =?us-ascii?Q?Gb1P4AJL4LQNvVJVHLHhKWiN4ohWUL5S1J/Tf0Y5gV9GtLnatRIkxkwfbPrw?=
 =?us-ascii?Q?uz9DYjI6F2wjS7IGftwqn/Y0DM7fQRQI+GkMpkaehq5SWGu641miLZS044bx?=
 =?us-ascii?Q?UnK8QeP9/mrd+sTcicuIUGYB1TknN4TI0uFTA4wo2yYvddWYEyNgEXaa+wVW?=
 =?us-ascii?Q?9VIx0BpYtAt0Yqcfh/SLneprdbttGdAPpKV1j0Gdkh12KTjuT/MvCreXRxeT?=
 =?us-ascii?Q?NwHscVldh0myzgsKNOLJKcTm4WMxkPM4tMA/lUpU8myizSsPVTiof4XprjY/?=
 =?us-ascii?Q?0mVvIx3X4Mdwon1JX98UQSOPsucKpIb6oSHEQb89bUz7grjAav23AV1JrEJJ?=
 =?us-ascii?Q?8y8i3Su6KC31FDPdi9MO7UqhbrsDSmJ3oFuQpNDUVy9+fpbJEld90uPB6iP3?=
 =?us-ascii?Q?4KvKCGO9XD3dg1SInOsQjf19koa7q1kQQf6bb6HoLPahQS2JJA73pHvqTTuj?=
 =?us-ascii?Q?sBx0gJMKRPcs4HEhavFx8irQRcOGBAYlvIx2MLei6B0Wn/gDZ6e23SVfddz0?=
 =?us-ascii?Q?cLdLm3vh0fYUsVqTUyI+/vPzU66b7J7TdlaqeNL34df0HJrIYlR5OUA4Bgwf?=
 =?us-ascii?Q?bJRKzJUDoOkMFGXffE2UzJ0ut37OAVdLqNWESGNNdvoVUc4ow/13Dduhyi98?=
 =?us-ascii?Q?7SSEKA3OoovwZ6aQs+yJvIlDiC/dgtfRMBT8kCZFVNJT+997Bmg/8rSBo/t1?=
 =?us-ascii?Q?ELl+HN4MqMEvPWC/6I64Smino+5+c0K7KrvRroEX16MaC/zd81kyratbsFuD?=
 =?us-ascii?Q?GOfC+CUTcZKa25tzlvv21UJCHk+bbuwOpsg2v1awqjj6by+mFKKwDbJVMM2z?=
 =?us-ascii?Q?htbDk854H09I1OJghAzUvFR4XLZ9pAb5lfw97BzzfpjzhH7S7O32VeigTW/M?=
 =?us-ascii?Q?e2mG8U/cKhwCSLzA7dRW6J9eQ/03t9ZLlP8Vi2r74dm2OurZYU3gNN5oasZI?=
 =?us-ascii?Q?GnI5UbjsnA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1e245e-9986-405d-c461-08de686419f0
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 05:20:27.6891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3yyexLq5E1/vkEQJGLCjn7iplSIBzXLuZOhN7kj1FLNGM1NFViotj7yptTBjUEIcQN47U7hB2TMr5PGY5IgJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8050
X-OriginatorOrg: intel.com

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   459f5c410a7536ce8089c6da551124869dca4a79
commit: 2b6b9e5b88e29db778fe1d74592684a46479247f [1/19] btrfs: be less aggressive with metadata overcommit when we can do full flushing
reproduce: (https://download.01.org/0day-ci/archive/20260210/202602100517.HnI6jMBj-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'by'
#239: 
and got deleted by by the cleaner kthread - when the abort happened, we

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

