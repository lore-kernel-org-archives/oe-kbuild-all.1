Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631F69476
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 06:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769322783; cv=fail; b=qzL6bAaXbIm4BvIgMAoxCMq0eB2Iupl1BfoCNGFDKVvExxF2r5deyNTJAoUP9tD/GjROjimij5LwKAEbZX+EKCeeLINaam0VKWvvQ21XSyJ8gY812M58UqygCJSnDK3cHL9KGeeMw4MobbD693AOoTuZPmmkWboeb+YMDpUGfY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769322783; c=relaxed/simple;
	bh=u71GM0Ztjbt9aEZAwGCh+SDAm4P6Z2oAPdPeIif2uuU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=J/lwfTk2yHwp/gPd95DbpcAb9IITci6NMTJZY3fMxtVso9Va2dfxzI1eGI0QeJxPraANYa1mNuz/wz0F2DfPLMq8UhZjRhP+HDdGC67ISBg4JP702H2ee4TSRMK3mp3eRDw4+PwDLTYb30JY3zk4ZmJIKPHhc+gem/aEKv/VkIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpFd0hpX; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpFd0hpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769322782; x=1800858782;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=u71GM0Ztjbt9aEZAwGCh+SDAm4P6Z2oAPdPeIif2uuU=;
  b=OpFd0hpXfmDRXr+Ykos9PPe/IMmkT16iiC3BAH6R62lQYy0a+GCPQjVd
   JfeO08Pecd8YfJUWHCi+IyC9LXKVhljxMYNP1VY6kg2yDSZgDuibuvsx4
   Z2JfTjb+ohbZHBSgpAfOwbCbLyKZ1AYGQxlU7DhrQoDdF6hLkbHN7LOM8
   x6Ymdd3oxSdOW3TOP9Iq7iHja2l/ablN9/ED/C3E48pH4IIQsvqoLOwJr
   ZXmWIYZaQn9Y/cqZvz3v4mhY05hnSLx2CGw9KSglhK6CtpSHkp5/hk3ly
   B3ZQ/0YDaYjkdJ+rLwuXZA7WAmRTbV9HXSARjs6Kxh00xbhoSlmXw8C/5
   Q==;
X-CSE-ConnectionGUID: Xwxo30WGQb6hkE7vKS3jFA==
X-CSE-MsgGUID: BMT9KhY0Tq6Z1B8NuyoRtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70425002"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70425002"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 22:33:01 -0800
X-CSE-ConnectionGUID: 48Y0zOZwSjin9T2oTTOpeg==
X-CSE-MsgGUID: d1U/v3IBQo+s/Gun49f9Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="207205509"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 22:33:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 24 Jan 2026 22:33:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sat, 24 Jan 2026 22:33:00 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.65)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sat, 24 Jan 2026 22:33:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJhlS7nr2HA/AroIukT/9YQKPrBQBQts0zbf475ggE2WZ4OYimco7BuU7kvFXMJZhOURbUaIrO15BNbXKkGmQjEunlAxm63flQVOV3B77GQodAVbn5vJZkRpAheKdum4s5wucxuwMisHnQA01nRsP0WVVOxNbDxtrCeUoHU6Jfar1l/SkvbXi1vcHpzw2nj/LFs2JdEHa1zyY18fkTkGTA2GC91vbBeITEVsHVAJEw8/iKCJ85Fm8kJJ/Pn9hCpTzm2wVeDMZdLX9rpVQ0U/78P6M3DURTgXHc0mV/lLMvoOu8XKHyPUW6+8EOe7NOMCw4mDeiWwHxlWae+pv4uYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7hDQgzj6EfCumLxdhAxgEFwC8AWv094PNHBsBs89O4=;
 b=dpFqdgUNd6rZXste9Ekl7G580JV7T45RVbbLkHmdp66r88LiuIFKbPMuQekQhYNvbG2tqCYP1vuyxW2nlzkHQfRrkFZgVLi1WGTCNNMBxL63xytBWVpw6LLh+A27VjHyXYIeUYI0rSPAymVvQmBraoRLfoRvNmGUlaKRVmS85dPX5qAJIxXRcTpxAU4r4WejGMgWkE048QpEjy7kP0Vc+orVJ6xSYKWqW2Clw6EQIkAL2WNH2pnqaRtfHtuxKpE/0B2ZcRrBKhcCMsvyMhFSQN2TktpqZdEs4z+jQd9H75AcIlVgob+4/IcBaZenU2XndTEZOQ+FAPOpXQGqh5NlXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by CYXPR11MB8729.namprd11.prod.outlook.com (2603:10b6:930:dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Sun, 25 Jan
 2026 06:32:57 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9542.010; Sun, 25 Jan 2026
 06:32:57 +0000
Date: Sun, 25 Jan 2026 14:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [thomas-weissschuh:b4/kbuild-uapi-libc 5/7]
 usr/dummy-include/string.h:1: error: header guard '_DUMMY_STRING_H' followed
 by '#define' of a different macro
Message-ID: <aXW5EeDs18qj9OlB@rli9-mobl>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|CYXPR11MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: c0341ff2-9cc3-4629-cf96-08de5bdb93fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?suPvOUwPgEbu9WGmsus+2WNuke3JKUQRb2QRZrdOqHSlqwuGcRQDIEkd+c?=
 =?iso-8859-1?Q?2lvxHjWq54NRPmo6dSDO/PV9WUjb1CoQ5/fV6B5A7sM2cJjT8F7+oHSTHE?=
 =?iso-8859-1?Q?alD33kKh9W1tnkHmYN1rhwcBjVZXtuPyCS951fC2SXdBP/Nb8fvL3jgH2o?=
 =?iso-8859-1?Q?rztRLhriyMdziTwaBIb6bRdyy8bn2ehNPuVUQ4FYuLmKb0rGmmW1oisQcP?=
 =?iso-8859-1?Q?czu2/TOL9JfcX4CEWPSPnlQBnJoweQPfCA8c5qqVJvMaK2lNSv/x6yo66p?=
 =?iso-8859-1?Q?vXfMhF9d6G/6bRI7UBMgP8BnfNoyUd2svuqDE5xmz4eu7UIFWpE3AqjLzo?=
 =?iso-8859-1?Q?MV+TUg4Wgpt4ZO1D0RvpIYDZTBXGUI3N/t3fRX4LKWs03x1l/S7Chg56e3?=
 =?iso-8859-1?Q?9cIFpwMzorE9+ItSdNJcksJJruGd1iuKd/UFnwnPyRPAB4SM24Zy7u3nBf?=
 =?iso-8859-1?Q?PDLHm7Iq4rQnHTWeS5eZ+49Ed73HHOqIy4HCIEwpqiza/qTCjIGEbIMiDm?=
 =?iso-8859-1?Q?IlCjPxpZKFdWIjWZpt22kRQkH9Dz5VnMKw1JdCiDi/kIHSqrQosQvpkwr/?=
 =?iso-8859-1?Q?UKPqCujDJwR98+vjF3/xzL0jFgGmKSzDxHplcpOeZpbNPf3BRzAc9SJ4zl?=
 =?iso-8859-1?Q?wlPyjB9bdfMOPn/w2P+LElnzlFB8Q+jbSzyJ2hUlRwJ62qDEyH/40qyl7K?=
 =?iso-8859-1?Q?ECEQX35JGlqMxm/nNDWD59Rle1tJKrz0LfDNlfIT0vTVydJDfvWfBWHXYZ?=
 =?iso-8859-1?Q?vxhCZvRMzKBBzYXF7S8v9xtpwxhLen83WRhpNeaQ2tv99fMA0kLEiNlPsl?=
 =?iso-8859-1?Q?AtA7J7D5LknUvQc/jGARNxDVFsKFdx5nJGB/Xya2znePXwl7aIAwfBCSNC?=
 =?iso-8859-1?Q?k+m/6PHXTjBgHoBWI1tLPhr0DXeg0somyOYXPupaU8nhsuEnDIiYYXvq9Q?=
 =?iso-8859-1?Q?JdVNnWbt3qPZhnOkOC1G1/bG5/5l0KRj+najsLEjas0EmSnDSKW2+DbqNk?=
 =?iso-8859-1?Q?JrnYwU1Lr3B0NEnznIJ6fik6nxpiw1UorLjjzJrn3MZGrNjODkccJ0NBDb?=
 =?iso-8859-1?Q?1Vd5mY2PWu6YGYwBrQU9/dEvC15b8Gzrj+TooDeQrL4gzTdx5u02B7HdXh?=
 =?iso-8859-1?Q?rd8cwkUjzXccyq8f3C6SX4Y8MfQgylRBf649uFSET7CVm5K7by5UdBjtVM?=
 =?iso-8859-1?Q?DpE4NVhIpJAprajd/oZeGF+k+Jm78zRm+H/f/Onb2U5Ldq/KX2mkN0BJ//?=
 =?iso-8859-1?Q?N92TQh9qOApQJUUJoH9I3/gxslA7ZkCxY+QwSTE5RA3utJSXdx78g4bu7Q?=
 =?iso-8859-1?Q?r4Asu0hEwI+d5T4k6+83G+43bEa2ExS/lhOFIdrcXGtT9ugUQc0hPnQBpM?=
 =?iso-8859-1?Q?NprEELKmqpHbEIQtSGrI0zH/UrvhtIvsf8+LC4FIK4ya9euLWRuZzqat0l?=
 =?iso-8859-1?Q?dhi9hvrxKD931Gn1xXqN5zTav8jacqCqhmgocF0RXkcs3GYoqFL80xtxY9?=
 =?iso-8859-1?Q?Lfjfhc4/tW0Be6eRy1rE12PqqOOwFX5zmkhPP+pvffqRhTTrT0NaPmMAFw?=
 =?iso-8859-1?Q?MMCRssmL0JA7fO/fKLrIsvyVdOQZzoDpRgMNejjv/6k45pDSRWQWoilero?=
 =?iso-8859-1?Q?W458SDTojkhYXT8x9F8kmJ9EdmtFQxD8UI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uc6N6X0u/9xLqD9ZX5qNUZnRSc8/pYdaVx5gEkpM+RuUTcWb43fr0Tyrq/?=
 =?iso-8859-1?Q?NkuA7DpmpIgCQPXD5vuJrH7wKQ2m1FTM0Yhrz5shGL5zpoNmYpmPfVNVkC?=
 =?iso-8859-1?Q?u0REPjJMrz7ivfCRj5lc54YAFKd2Czheo0v+x5Le864ZdzvUXfeFsks1si?=
 =?iso-8859-1?Q?RiYDj1Jia8oposI1QkfkJKQAMf0NR/LpteeGVlmJa6A6RXuarSp7ucivOm?=
 =?iso-8859-1?Q?69TwgPPxN/XxjsL3viZjmZOGg5GY6rYL9GM0K9ySXOnzz/K86moDTHAk/0?=
 =?iso-8859-1?Q?ruZArxVqvj4h/Cvsyx/p4k2+voS4fvUmOp9m+Hej2Ubv2fNTU4x3AtWXr7?=
 =?iso-8859-1?Q?m3VObshRjdwRlNoG5en0H4+7wx225FUlOBzngIWy9a+XSZgPFwornGdK9B?=
 =?iso-8859-1?Q?JGL9+uR2VHcqkf6Y6mRGJFB9tfzrym3qVUzR7thIf9pC6wlXHarcomw97C?=
 =?iso-8859-1?Q?eWr5tpDjcpshnfNdk6WSQ40vJf5Qew5Nb/rxkTYIM4RqoVRuHiSJUcOgps?=
 =?iso-8859-1?Q?+1CyYwaiB23pXMuK6sCTPpPbdd6kRIWbZ6xuVhMAfhENepeJVHWKf+bKCt?=
 =?iso-8859-1?Q?4spI2UqKBrPwdIJbN1sx4xJbZFBizizs6lgFxB5B49pRNhexbb/jSpiYVB?=
 =?iso-8859-1?Q?T/eyHe39rV2efpSXMPHOg3P5TyLeamWiWx4QpfY94gQ49FjUDTG3BRePGa?=
 =?iso-8859-1?Q?6CULxvWeL0vbA+1Y5TDNFpHHhMWyUyvvLzd/mjKgI6C2wb6RUPQMjkkIJp?=
 =?iso-8859-1?Q?ljyDNnef3Dy+M9NKPtDgEgyeNmbwfS2L9BUIR+Tl1frNawYJJDrwhPTGsR?=
 =?iso-8859-1?Q?0+dPepu4Wwg6rSLImxX3HeLR2edN5AMvm7SkmubyezOmDXOVAHAlk1XsLQ?=
 =?iso-8859-1?Q?jiYAyAs2XEoZkd3PdjL1GRGSaQekKKeSPi3SoZ8E/2X9qEBUigC4ulaJlT?=
 =?iso-8859-1?Q?Z+39V9rpJgPw9j+e7B+ZmNH1l7GJsVqH49vtAyPjwBePBH0NaPaaur386e?=
 =?iso-8859-1?Q?nn6hoNQt5QEglTn8xpV15cdYRVRC1kYHZZO93wLNO8w5HXFK4Cad7hvBVH?=
 =?iso-8859-1?Q?18F/5WLJo0QxWRXwy1zE/A2awvZ0uMQ6qVvYD4Rd1oB3OnW4CydHh1bmdF?=
 =?iso-8859-1?Q?alc6qz2fP8I/E67lc1o+5cjDmQjYWe8v6OezI6SzUBIiagTc4CEEgbG2uC?=
 =?iso-8859-1?Q?TiL0LdA9eFBh/gnVnGiHb5friy6Pai9gR8y5/8yxKpL8jIfFockQmY8nC4?=
 =?iso-8859-1?Q?eXJicM+229S2nT6Shr8ByZ4FjkXrb6/Vu+3sYhMU+qbDz+9aUQ4vWgHMb8?=
 =?iso-8859-1?Q?/kBAVUcGWMUJ7IB0a5UKM+wJsqjRLMnCh89LYGc0bGS8XUvFCkZHM5IHXY?=
 =?iso-8859-1?Q?tkqErLwf3AisH6DadPx0hYgmSqDTokVijOnptFFKvUfuT2INXtEpuInWOr?=
 =?iso-8859-1?Q?bWVfLcFr/WLHZPqymj7hSHoHZ+uoQp8YckaGq+qHynQ4X2sXB8wsJQM97m?=
 =?iso-8859-1?Q?f+dFO2ZGjROV6BBtX7RpzWgHcW24OuOW1rKbWlkkODmM92Zx+UC7ifYCr1?=
 =?iso-8859-1?Q?nKH440GkiSV/P1bwnaPSCrJxBNULsKhtO1aKNY92uKkSL3m0NDjrxYG4WF?=
 =?iso-8859-1?Q?o+bk3zn91PomoAlOkBtj0jrikelCSrFimGGSngmk/XKEsCHIQr81hO+2J3?=
 =?iso-8859-1?Q?z8rABPuutK0u4cG2F/C0ge3Jr/URpqOq6tcPrMvPgtI9BKCXpgASfvR848?=
 =?iso-8859-1?Q?7maYo99OanZkKNZ9wDXSTQVsLixPr1WTlpfl0brLMncAP9L8vgpjLOE+FT?=
 =?iso-8859-1?Q?tnwQgDJFwg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0341ff2-9cc3-4629-cf96-08de5bdb93fc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2026 06:32:57.6235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WEqw/A+C8ankVRAM4pR8hdqWva79Btmaad/wHB07uYRqVMCiSassJC53P5HIgNeTOHO8UoxP6SEtPdy9QTZ1Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8729
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-uapi-libc
head:   42f8899f5959bce93a899d194c5b14d2a809bd31
commit: dad08d57845cdf10080325af1084b1a1f6bfc05f [5/7] can compile
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260125/202601251331.LbuvwpRe-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251331.LbuvwpRe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601251331.LbuvwpRe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./usr/include/linux/string.h:7,
                    from <command-line>:
>> usr/dummy-include/string.h:1: error: header guard '_DUMMY_STRING_H' followed by '#define' of a different macro [-Werror=header-guard]
       1 | #ifndef _DUMMY_STRING_H
   usr/dummy-include/string.h:2: note: '_DUMMY_STRIGN_H' is defined here; did you mean '_DUMMY_STRING_H'?
       2 | #define _DUMMY_STRIGN_H
   cc1: all warnings being treated as errors


vim +1 usr/dummy-include/string.h

c2504abf729a15 Thomas Weiﬂschuh 2026-01-24 @1  #ifndef _DUMMY_STRING_H
c2504abf729a15 Thomas Weiﬂschuh 2026-01-24  2  #define _DUMMY_STRIGN_H
c2504abf729a15 Thomas Weiﬂschuh 2026-01-24  3  

:::::: The code at line 1 was first introduced by commit
:::::: c2504abf729a15f7df4bff328def344426a2b6da dummy includes

:::::: TO: Thomas Weiﬂschuh <linux@weissschuh.net>
:::::: CC: Thomas Weiﬂschuh <linux@weissschuh.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

