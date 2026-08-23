Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D970117A305
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Aug 2026 12:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488235; cv=fail; b=TE9xtdjgCqgffAhKghQS9L2cN25wHAP3K8rLrujRtR/heQO2vDQv50hDtD2yPFrhOoZbuWSCXMvlNzvEv3j7o7OKGoEsTrBNqmLqHBj9avGEAvKhO2Jvl4yRPSOM3NjeoIb0pzArWwN4GiulKpuRSlBICkMQht+92/kFwcTBsdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488235; c=relaxed/simple;
	bh=k3t3CA4g7EbtOTqQs1abOhouFQ9IHRAISYdE6mIGlO8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=gnG5bQL9DAWV8QOCiyEEGvENQ/xVAR8OwrBYkev/rQSP8LNf7xlGyHXaqKsGSvPca2JyPkJMdEWLXz/rW2/CklKHnaXpFlgGsm/QM9XgJQWZOP8WC6VuNpfXhGezx138x2k/yUTpVVlXOLLN6XLZgYZRTIzKQ3q8+BSLHUoo0O4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZPU4044; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZPU4044"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787488233; x=1819024233;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=k3t3CA4g7EbtOTqQs1abOhouFQ9IHRAISYdE6mIGlO8=;
  b=NZPU4044DmciaRJJQtzNV4IYyAIE+Ip5c4W9Ls2zMOyiXQl+7KdQHkR4
   xlfZ8QFlTbBk0USvc/+hdRV4Lz50iLrp+O4D57LPxNdCUFPthV/HzsmNr
   XRSwFy7s2pQjGhoHzD69kKv9Gut/QL5q3ykqj45aM+tjXq+38jDF57Jnb
   dW3SqagKaulsxk0F1cJdFZ4VNVJLTFzmma1o3oPpP3DLUeVSuLm8P0q0q
   YWhJJo4gUj8XKFnBDSeFq4jeeZp3XIoN4R5u+J5s+Srk4l0p4LZPPFrNN
   lJen3EbIqUjDSqC7buxEEMjP3U6dxFfv2lIhLAiaIHEmslwDfaWXgWfbf
   Q==;
X-CSE-ConnectionGUID: a21YNFUoS4m2gg/HXvpxVQ==
X-CSE-MsgGUID: 2rpa/8u5TWa7HuFecdynOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="87974867"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="87974867"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:30:32 -0700
X-CSE-ConnectionGUID: JNjStMqXSXSKij0rIvkQVg==
X-CSE-MsgGUID: By57g5UySQuwnFTGbVO0wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="264993569"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 05:30:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:30:31 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 05:30:31 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.30) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 05:30:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jj4AXqrTknbvAEuzqFSyz7sqvqupEIVl5vSRy/onpdjwd/cwL7e4w1OlKIrWk5feIhvcsu2VbjXz4Q3TeWj593BOdYGx7A8wUcgAJQPeKGkOt6q1718QdDh9xybWeakF6itvzkRfD8x8XZfYN/704WNZqjfzzHcLmflYNVtdAc7zjoz+UBGgBzns19EvACFOVA6YwA+Su/V0ClO6KfLSb6zPn4oMBhccaJsODFejRZDSsvThy16tnuckUjTno/Yx1mTPGxGfKQduW03lVie83o20lcpIR3xvffwrMGOakoBHbG35wIvwg1Y43naC6wU1R6PiaK4EU4qgMmpMuOqJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DrBqKNgzYZoWCoxBTUtHErXM94P+71sBlEjWRhK3hNI=;
 b=LxptsAE02EruLwPXGZ1dEIV8nOdHjBtM9F9Z/qXbHWNlL04DHLASU2DDWQ+Yp14tYQ0HlKB2kA2pQXApwj3ZvHVOISaQwZvrzn3pClhnKkIMrEqErIMnjFWGT4gv/dsBPQogtOAt/Y5bFCL1PlXygF+6RX9A4GF3Wu6G7f+cRlaok0igwCw9XZu3P+TVDLKd+2Pee1rxzc9C5BaI8t2pMiwkaf4A8otoKRWIo2zwjvnfKGyhwl+yGvorawBrg8qhiHi9jmtrU3Z5YYA5iQaxnl2mnMqtb7F0MTjfLPgrq8WmCtQcllco3lR9EUqFzBNc2ofy42WaYFjxYD0Rj9x8Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MN0PR11MB5988.namprd11.prod.outlook.com (2603:10b6:208:373::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 12:30:23 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 12:30:22 +0000
Date: Sun, 23 Aug 2026 20:30:15 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [bcain:bcain/qemu_boot 34/87]
 drivers/tty/serial/serial_core.c:1939:1: warning: 'optnone' attribute
 directive ignored
Message-ID: <202608222156.tLRgZ1JT-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MN0PR11MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: cfaf6027-c623-4f43-4c4a-08df01124d1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|3023799007|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: V6liR+Cn+eLpPt+Nd9rZhvLezWr7xlBLxfMH7P6SRd5au3ltU9N+EojJ/XSAL+4lcV2ct53LzoOe482arAqbVjZ0ei7q9rpxlysQby4HYbFdeBXq/qENzCF4Vi1NMAxqvPMGuoHPPnWs75eJMQiHn0YGfh83Phj6SlskuMNHEilSxuE7Q7GCazbAKikfoP5cr+QCljffjdWtNT2cabbFmVeY3y2MDyDBXs/965npoGgUL4+bsZm1QrmyEbeB2iNVuxi+2VXdgXg6wQMvF9dTHt3c/0f9KHeNv6UNNwMNPGfd01T0juva7vfnEWMBmOM2VpXWXXhUgLO/7SvFD/wcWWXNh5+u4ZlALdqiNy1hmMH9ceXihHFktR2pm5YzuK+SPaxPiQ+cgwQ02Cfuj5Fb5TSB6FIk1Bg8ITJmzycy+4kTbbDSPlZddEdyio7XYUtwYxdTSSWsMo+NtBEe21kAHn9zFd/NMINYeGFXj4lKTe/hXwa8WNk+W2IG8afAHt3AUua0L5CPgtyv46mhXedptCTlkbFKzCkbxOn1RwkHKFQzxNwe3O058dbq/m8Ld3W3imRQrJVL03NbLqvwpZcegeBL0blqtd5CvqrXbROfcHKW7Pv9Px/UsFiWk4Z2kPFmDjg/sqPMR2gwa4w9BvwZKdnimd8ZkFeFbtA8Vdi08w0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FSbn7PJJlesj9LhIsoaPGt+UqCLXooiSl9CM32gz9zbELN4UcbXCf6e2Wi?=
 =?iso-8859-1?Q?O5/lAkvJYLaxN5flutjzrcQB3N1Z9YAdQGyXqPCDYK8SW1pwY8WUfIZlUi?=
 =?iso-8859-1?Q?/lTs+F7I2M0zwOlHkT/5LNEgREhykAYFKpxRaL4J/bKIjWlIoDGYMxwtL9?=
 =?iso-8859-1?Q?ztVAmuNob6T4Qh2baf+yaRr7iSy0h/OoYZiWCyVWDP/W9WV+iim2I0wAYr?=
 =?iso-8859-1?Q?Gk5IBSfXpKIAdtXu+4oggo+CDYrJ9KWh2G/9TIn/3fTYnnWYdIvcuRiW4i?=
 =?iso-8859-1?Q?rR+rZsPRDDNu6uTnC3ak7ouSEG52gZAKviYEUyNmalZK+5DOQlBrkrvyWk?=
 =?iso-8859-1?Q?SVJcwBM4eumwm6yoFZEDwIJL9S3yU7YUi5CiF1y0KTKKkheWYU72SlVPxk?=
 =?iso-8859-1?Q?BI7uoZKfc0c4tFmeZiuOrQlezlO7zbu7PSxbPhJDovH0st8M2L4W74uddH?=
 =?iso-8859-1?Q?SqDTrYqNnWdvXIS53S2InYVNSn3w824jF0Sr3OVl3MrhlWPat8OO3MOhZ2?=
 =?iso-8859-1?Q?7aQtnkTYowLVtTxt3ukJbsE1AiYiw7SfNgd3DU+AgO+t+O6aXXrfJWwAiH?=
 =?iso-8859-1?Q?+FjePqPTXxcM3mw68iyzdHl9XTLoQy/z3IXXoVzzwRf2aCnrNOiDr37qL5?=
 =?iso-8859-1?Q?MLq/P5nwUgp1KIHzos+aXeHgsLtQzex2xiSACPTR+aYNbv9MM0SbOT0QNO?=
 =?iso-8859-1?Q?MUU/wHwWta1eY/NrDNJJSbHjej6DajpNS3yFxTjrikXHUxOC3KtkJ5LwQm?=
 =?iso-8859-1?Q?8FKvXiSGshfMiWUjO7aiOW4qi8XbvIT3Mh4mnAUcSIg6/rE3xoFH+spfFO?=
 =?iso-8859-1?Q?rXKBs5f8ZgpuT13HUW6UrmKOTPQjDJr1/HnrAxbS7sq075uhIh4UbL1uJp?=
 =?iso-8859-1?Q?8zlTupRfREsAq389lhSn38WjGqmpwQH8XvHrEzttUv9zv4UX7HCgw3zy5X?=
 =?iso-8859-1?Q?Vjr7vXiQwwFl+R6orLbpeV2a8o7tzvD/wewAPikuJ5NAq9RI0Q5nRQZMB0?=
 =?iso-8859-1?Q?Evqnat5FhmcnlwTbrruc2qqo4TTXb92WRcLRusJU40upf9L4nb0xgQZ+xT?=
 =?iso-8859-1?Q?swwmWEsX5mJyEtL4veGqJBFzHffsmZl0rTYEvCAwf3DaYthhWvwgFGqFAx?=
 =?iso-8859-1?Q?54AdpVmtOCt1JpObZImZ4cdO7l4leHlKOMpnfij9jXB8ZwsTJD6lX1TysV?=
 =?iso-8859-1?Q?joIodFsO5QOrzWCSpw0laW3EQ2j5KvD7VtHWNiRnJLrT9IqzlvdItWZk84?=
 =?iso-8859-1?Q?pkLNzxeSWcmNBeJRfBel+IiJETI525/lLAjqxXueoiKbqWV1Oevbb9hXPn?=
 =?iso-8859-1?Q?f5TXLyUA5EokILjEKJmbJ6S2RoixmUg+nL4j/jzES2XkLzfvy75qPCGKSL?=
 =?iso-8859-1?Q?57SIH0NX7L1Z344SQEdWKgyN3JbxefTjUI+ofPTeYs4KpstJgCrywKU7T+?=
 =?iso-8859-1?Q?tyarlkZRg+jQG/2SqxwszLL/MksMOCohsOxILiNp/eymtK20CIPFsi0UmC?=
 =?iso-8859-1?Q?chp1N93+QN8f4ET3DNaDH5LHRmu4IgFA4SnUAbcProhoUwEfDr8HnZjoU+?=
 =?iso-8859-1?Q?cci0Z/sCiYiGEFvECx6tKki271HEY4lR+/zd9smin7jCaSP6ikjhKCF7yB?=
 =?iso-8859-1?Q?SXxyVR4kdZ3Fs3Qywal+3KdG1BPZoxNM1EoMnhlFg/ULD5kgcGvHwZl+P/?=
 =?iso-8859-1?Q?Ov27CIAzDv02qJZmuGXteLx5ZcVrlbJz3pzlLfz9jmQis79Tp3/tWiyMOO?=
 =?iso-8859-1?Q?a+nr1vvcTCOuFQyvEcaBvbeXS4v/JX3dWWH4x1+r1uA44Q6EpmX1WK/l0K?=
 =?iso-8859-1?Q?iHIejqDHBg=3D=3D?=
X-Exchange-RoutingPolicyChecked: An8+An0rKC5iGX1nG55LEoRWhUgfd9Aj0OjZ07FihjxdVfdb6AiqDZT8ko4lyaMxuJwyBYdSI1U1to4hOW/O7hzshjO7A1QSYt7SoQPwunr5531YEYFzOYTwgxiF2vZPv6nJcQqTdUFExNTW2+sjFvCOS0AtGwh2SjA8yVmm/8ly73bj14PO7dlP9BvTw7kKL47j+3bdKbQGtr6l0hdmbQa9hurK/rhkf0KfoElyI0pJ2toHwAClsyy5cyjaZAi4Omnrcg/Bt2lGnizW0cjgLRE0z1lXVkpauDo9CTlWROE2sqYOldxKjpaBbUBYv+jmlOknXhARcI6JFGkohtiaNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cfaf6027-c623-4f43-4c4a-08df01124d1f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 12:30:22.5583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52aSeVtd8LZNmb38uio+3YVZIYwF1AqVGiEsnSvnLyzsV7uMjOm9nUzIhPQ1NiVDrjFL08lPVAs29pfVjD0cyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5988
X-OriginatorOrg: intel.com

Hi Brian,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   844bcfb5bee7bf0e713f61307dc2a4e16963c2f9
commit: 520783c1a795b1b4bd4c87483c2300e9f8e866c6 [34/87] hexagon: work around QEMU uart_port_activate codegen bug
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20260822/202608222156.tLRgZ1JT-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608222156.tLRgZ1JT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608222156.tLRgZ1JT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/serial_core.c:1939:1: warning: 'optnone' attribute directive ignored [-Wattributes]
    1939 | {
         | ^


vim +/optnone +1939 drivers/tty/serial/serial_core.c

1c7b13c4886f5c drivers/tty/serial/serial_core.c Jiri Slaby     2011-11-09  1931  
520783c1a795b1 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  1932  /*
520783c1a795b1 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  1933   * Work around QEMU hexagon emulation bug: the conditional
520783c1a795b1 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  1934   * memd + dealloc_return packet generated at -O2 corrupts
520783c1a795b1 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  1935   * callee-saved registers due to incorrect packet semantics.
520783c1a795b1 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  1936   */
520783c1a795b1 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  1937  static int __attribute__((optnone))
520783c1a795b1 drivers/tty/serial/serial_core.c Brian Cain     2026-01-26  1938  uart_port_activate(struct tty_port *port, struct tty_struct *tty)
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22 @1939  {
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  1940  	struct uart_state *state = container_of(port, struct uart_state, port);
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  1941  	struct uart_port *uport;
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  1942  	int ret;
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  1943  
4047b37122d1be drivers/tty/serial/serial_core.c Peter Hurley   2016-04-09  1944  	uport = uart_port_check(state);
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  1945  	if (!uport || uport->flags & UPF_DEAD)
b3b57646186400 drivers/tty/serial/serial_core.c Rob Herring    2016-08-22  1946  		return -ENXIO;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  1947  
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  1948  	/*
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  1949  	 * Start up the serial port.
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  1950  	 */
dcd794c6ed631b drivers/tty/serial/serial_core.c Ilpo Järvinen  2023-01-17  1951  	ret = uart_startup(tty, state, false);
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  1952  	if (ret > 0)
9b5aa54986fc85 drivers/tty/serial/serial_core.c Ilpo Järvinen  2023-01-17  1953  		tty_port_set_active(port, true);
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  1954  
13b18d35909707 drivers/tty/serial/serial_core.c Serge Semin    2019-05-08  1955  	return ret;
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  1956  }
^1da177e4c3f41 drivers/serial/serial_core.c     Linus Torvalds 2005-04-16  1957  

:::::: The code at line 1939 was first introduced by commit
:::::: b3b57646186400d4f54652ab7bbf55f5764d9467 tty: serial_core: convert uart_open to use tty_port_open

:::::: TO: Rob Herring <robh@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
