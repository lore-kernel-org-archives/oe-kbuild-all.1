Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B036F9D9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 03:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769224043; cv=fail; b=c7A5F/bG9ir7tb3xXaGMEPmGZ/jvU3csUU1ARpvqfizwATGufe6/yzMFObycbvXE569ySj+0rUl4o/Yhe2ASH5k9xSy31PfQrhmJkGqBwwIn16FNHV/4dIy9mKIk7Nnv2JbbWHVPAwV54G0SKsF9YInJWPVpusGs6YY89rOGQu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769224043; c=relaxed/simple;
	bh=Md0OdVVELXzPcEZ7bREl4U4W0nSkTnmfjFLZv8IMk6M=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qnYqA8/+MGZvm+g6BYkbyN1krZY6KtVqAul5KeBi8FU0/DeAQJKT6te6dejgZi/2C8I9X1nQZ9BbjZ7QpqlP/BCQhnhBQEfjc+/PynrzTgYcapRRgwLZlVbagY5Ln188yHHJkhoqkl04J4KTTMa+N43cdc/xJeOxFgxpcVYQCc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/Gq6fHr; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/Gq6fHr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769224042; x=1800760042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Md0OdVVELXzPcEZ7bREl4U4W0nSkTnmfjFLZv8IMk6M=;
  b=c/Gq6fHri5TP773QcFT1hS/M0d/Q5YeGlfh7h7HY+Ms7563cBGKOfAFz
   X8fBolWSDYBaf1FJ2btqUBdl9+Vjg4sqLduLnITZOnhRTT0m1LS72rVJR
   KeaG0OgO0BIzdGQ1yHet3A9ctELYrdvHX8QhUVt5Cp+OtW5uXxnzJx5Ys
   UHhpyCfYgtdEqBUSHPf13t6B6kGIfhAW3nCTsdpBg6w/77DjZDyOQqveT
   tW0uxZP2LAc+VcQyz5X/enuEBVE+mRoW6+Bl+XHC8cKRqC9+C+HxLeU+h
   OyJ9HXS6PQTV01IOlX/N7bVu1Jf4QmXARZgF8j+L40yCU856si0NFUnt3
   A==;
X-CSE-ConnectionGUID: QGcxrc7vQJqTbs1NWOORGQ==
X-CSE-MsgGUID: yFNpHo6GTOeQ8OcMvB7KHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="88051349"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="88051349"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 19:07:21 -0800
X-CSE-ConnectionGUID: P3Oc1kT1Q9+ku/2CEVCCEg==
X-CSE-MsgGUID: ZQx5+PL7SKO82Jyjtqlzrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="207221280"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 19:07:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 19:07:20 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 19:07:20 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 19:07:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBLepxxifte/JjXP5ZGstcxlsceyi1SHDCV+VaOPrG3VO8NVqK1jf3EtyYJ7Djq0eGiv8r2HSEwCu6sWZjFddpGxxdk/628WJGv/QzGvkqjqn5BrmDgGoNwDSTjuboFh0iOatZXMbl5YaCmJQCykBtg2n7bvpzrR54gvAl7OPGM32AUfla95RTjsGf8KurORoYVObZntrRy7+8aUGJxkMAMdDzyhQtGL6Hp+4ytCcCLCWNXDg/b4aKIWVzcoKjZw5SxgRpDT3jjQT6XTV41wBKUdaYXpnCX4Fh4TRNQuyAfaUJIHCOlL3pL0GX2Qscg21IgboBlS6qtZSmMbLehPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FegHRwcudg+ZvinOsC3nJDQN5Ux1FUJtINyOcW1n7iY=;
 b=NbLjnhrTXLEUkcBU46ZySQFQChJqZhY+9Pu2NXzfUl2G5db3NVHlNyU/uz92Lfxnt9BYeGZZSquRvQo528osDgpRnouDFZmAIRD2sIW6cUP9Au5qEiPEzPU6qf9EjnfDtw/eIfWz+VpSkw7CpV353mtcGByGex8kJ5vf2uEv7e7AMKdR8jNZuffaguejlV2L9MqJs5upFw3O6lRsKqYM46fmnXibRhkQ9AowX7P4cQnPdtShxUPEx/16BGLlg246NNCi+TmuhYclT5e9NWvbuvZgGa/mZVJRIiZQHnIgJJ8BGwkgzGis8rDOKaLYuVc6Ya9fM0Nt26hlA07xXGD2mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Sat, 24 Jan
 2026 03:07:17 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9542.009; Sat, 24 Jan 2026
 03:07:17 +0000
Date: Sat, 24 Jan 2026 11:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [lpieralisi:dev/gicv5-host-acpi-test-v3 2/33] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <aXQ3Xsd+nccABy4A@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|PH0PR11MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: 38015463-9a00-4f15-621b-08de5af5ae9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GsZumS2qDe8S0eLDHIBO3T12KoqoFTHopWarr5vCc1c99rGxfVmhXujpnFJo?=
 =?us-ascii?Q?dAmnsYE4d+uiGfmFC+siBx/r+iaxuMTIpajJQXHm8H3OGSz/GPCNkycKf/dT?=
 =?us-ascii?Q?iI6dX+irqsSxanQxnIJX+6Ip/PgUy5kn84CWpH8EnIY7hcJtTOv7erI4cdv4?=
 =?us-ascii?Q?JR17SYU6PQ8QVBv4YQeDguyDN83UwV0MuqscUGuwbrkaxpY3sgTtPzeMDq1t?=
 =?us-ascii?Q?YNRO2NIPfuh3RZCfIPS9I9I7fpjWJGiS512MgMBDG33pj+4MA+tmSm5oqygI?=
 =?us-ascii?Q?1OnnOQ/1Z3pAth2ZCQmnePqEl1YPeLVqZ/QYHublcO0U2KrHyIKrJWkAHwWM?=
 =?us-ascii?Q?9MExqdyp02EQI/BTbu3SnTtbU1GGE5JSiLfzqRmO/CivlCMh/gWFc/q6lHQQ?=
 =?us-ascii?Q?tapqnIq41gpj0R+OeX5qxwvymSR7JOul/L9XyShvhPcy3ez+QLoyzZYaOQnV?=
 =?us-ascii?Q?Oma+KsLcWpIb85WEzzoLN3nZUeyXRCalH0wK3Pa1JeNcBiGjztUOesnBGcuC?=
 =?us-ascii?Q?PkJqO+u/AE3SXwHzJCIjAN2nS+xXo5TbyoQs8VqW9E6iNC4FL58eGyyXCu1p?=
 =?us-ascii?Q?gSRBbiuLlMiYP9wArYNy0sJYlD0dr9p8LsWdh0Kfz9lmTRn/uRrxDwatcTAM?=
 =?us-ascii?Q?LFMklZ2Vdjk3lwqcKISABYivhEjE1J3JfH2VIUbdJF7f6++vVHTe9eKQO0I5?=
 =?us-ascii?Q?qKth5vdtfM6SgJGCjUK04HXSpdnyKippd0STJqROWjJ8JGEjAUmBfemybrCA?=
 =?us-ascii?Q?rm1GQzWAzRWjuB94JjENS/BFhFDNQnWoBEv9XC1fy85mwdSDxGia2HPNV7FW?=
 =?us-ascii?Q?Ys8rfsvt6quc0dKDiGNa4Bi4BnKrFQ7FPT9vB0tvHVnuF0esGZC6EdADBmK1?=
 =?us-ascii?Q?jqAiLiMY6EE5oh7+4KSh63fBmA7eqlGDlQM6i7C+lU8Ltg3u4iSWL0kEo9LQ?=
 =?us-ascii?Q?0yhpZvvCxlruOSRimF76pnt7FLCuoPNAUeyHxMCF5AeVObsgT/Q9j/Lmo/j8?=
 =?us-ascii?Q?4NaqkHJ3v4JarkXAdKyuyukwwtnF3Fg2h7JGck+edfXzWwyD/KjYG/q/QGMC?=
 =?us-ascii?Q?pb+idxgHdvFU+bHxd6BlpKz/HStuRHlIc0U3mxikCmgwD4X7ajh0BSUwzwNC?=
 =?us-ascii?Q?wzwul7o9rCpTplGy5kohXDB1okBU5DO0VYUUCn8ZAxu4PgiCSxy0hFpyIsnI?=
 =?us-ascii?Q?xnYkxHBfFsDI1HP8Gr2S6OR8h/UkKmjsT5VNH2iMtQziL4M/GZENhs2jfD4U?=
 =?us-ascii?Q?delirHJ4dM78vLynlbiGw8RElI4LhEWZ4jMl/G29Y+5lwd/MfRaaB1rYx/QB?=
 =?us-ascii?Q?WB4lnyL9RDIpYgIQnFW/eTuS2CLvylh5p8MCKNM/U3gOJx8lgS6UNv+g8giN?=
 =?us-ascii?Q?N0r/XhVJxkPAR2HQJRVqx1KsP9NB06rXQamz1UQeKg+6sToI/7n5ICJmu5od?=
 =?us-ascii?Q?UgNYDSFx8Rmrl3GPMvYJoZPUAAfpaF0tkO6LBmV0m2vZZrUfAUveRr9mUgsR?=
 =?us-ascii?Q?iYnadVAuc6c+tEgCyv6mCo6opqQdcXBKFS3U8NTeCs6BR1J/gBtQ6jMiHONx?=
 =?us-ascii?Q?R4F4pK0LY5hyTHmsJknlGtzg2dql23dznNxsdKb4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SFlokNxNZJwI6awFjKVzpSWK2C1xhvqAt1fZxZ+msKpNzBm7uIO42n60VQsS?=
 =?us-ascii?Q?38GSK9Fifc02XO9SWePT40IKe5F7g5itwJtJa41r2gGhQaduLMn87lIqZ47Z?=
 =?us-ascii?Q?DYIK5hGeLQuAbo1Gqu6Xv6L/2mSgj+ZqW3qUFxAgYIlCbDFD2HQ/0NGQlwm0?=
 =?us-ascii?Q?+v4BrBuPi1LWLQJxwL/2leqfZw5sU+Z04Nm/CKJjaVtrQ12dycFSeZEo1dRq?=
 =?us-ascii?Q?4EdRVckcmNcvaXO4VrYSm4yQ5yDaaE6vcVfqkBH4P8e9LunFL0mPo5oUqaCO?=
 =?us-ascii?Q?E2Xl4XNcaLIrdikGY2pygCsWNMn4avLDqxSDxjivCDIknaQp8h2oR3LBFKKa?=
 =?us-ascii?Q?D73fMu0IsXMdOYBhAtE/Uirj+hBdtqMR1ZEMQaeAfg+gub1G9vJaFPODCwI6?=
 =?us-ascii?Q?WNleEldGV/3+U/e9GwWRh48/JKNc12DyltIDFP6I3tuMVnpF8A6xtQmBWjR8?=
 =?us-ascii?Q?XMN6WNY8hq6aNBecyuWBk+SiJfKl+YK+Lc3ADhwWxR7vCQ+0wyfS6dhYuNRW?=
 =?us-ascii?Q?iy+noGRjR913liC/P+uHTbfAS7k7WZI524pH5hqnSYsFyND8093MsfOrObjs?=
 =?us-ascii?Q?uwInx2KsD6fUpN7YO3Upym2cj5/xcyPLesNau/V2GXbHf7lYB8wkLvV3/diK?=
 =?us-ascii?Q?9W3+kqAu2bj1zSVQWVK/2+ldIrPd2Sw8OwfMYvwIbuOqNCjz8C/9eygMv/9O?=
 =?us-ascii?Q?A9JP1EzFfEBgR9rbGZEG6HvveG/oHOwi05IRpk+uwIUVN5EXuZdmgbsCpDfu?=
 =?us-ascii?Q?aOU00gqaRMrosyggSXDuUSlSB0kWY7GgismHN78hx3+nBzWeRUGo/OB9jyUc?=
 =?us-ascii?Q?rtIzskS/leWO1BGPNQOrRRFNeXrT9MKUMZnUPq9berhoeHfezQvCcn4dQiTo?=
 =?us-ascii?Q?s762dXT5YhTuVb6diC1/yYrPS9CybWmZjaAuyC5EEDPWOnzRdBGEQ+P071Ot?=
 =?us-ascii?Q?R3dL3TidfamMJ2CIp2//Pu608i9JGsSNNm7+olYq4/o/ZXww3/Xb72AEsWte?=
 =?us-ascii?Q?LOkgtgCfnm2B0v3X58u84eA253NrVdL9Ps3WS8Whi2tT1uMBzVd/f9DyJ43c?=
 =?us-ascii?Q?JmF8qXwhI3m7RKWdsf9XPm0VMbE13aRDGxMlD7GZvfPnKNBwGbUi4GR5NKix?=
 =?us-ascii?Q?Vs6IihnLTwo7OYyUgKkafGo2ys3NI1O3eToA3q7odfPDmbBq8H6jtezGQvPj?=
 =?us-ascii?Q?y0DL+viZsQTtCkM80XhZe2h2WrjcvtBDYG9O7oJP3zItNEwmICZ8EHIUkFZY?=
 =?us-ascii?Q?h/bclhOCOhfe4DEo6IXwEKzuoSffgADQx6QZ69EEr5206xuZwVFXbmSTJ+US?=
 =?us-ascii?Q?WblfPeptIskCHKlVc33GciHp1iMuatdNqPQJqiYFIX8GrZsQb3h5oKqwmy8s?=
 =?us-ascii?Q?bBr66rhGJdW4Q8kYwk/0/m6hZocix0JBvwFryWVkor7uy3KFbBgHvZYAqv4l?=
 =?us-ascii?Q?Uno1ATgYnfso5UdN2sYUYj9wVCmddY5Psf2RIhBqSocIwvFvUwRTDY5ZYMHg?=
 =?us-ascii?Q?CvnhYNmen6huymRJHBBD38DWVtoYUjUr3mpOBnLUsQyriG7vosliSEk1bzwA?=
 =?us-ascii?Q?KfyZmecURvacjFtjL0DeHxcydg/d99eWyem33J43eZBG1qNvlbdASW4Zl/GR?=
 =?us-ascii?Q?krO+qZ5e0YdDaz6KE/dT50rsuYJOIrikzuMhF9NO7s2z/0H3pp4spsJdsiGa?=
 =?us-ascii?Q?9SlQYaxmgK+hrXhgGqPkLHBxNQMGbsFhULFD6U/w+VIBvooTzn5ikonevptJ?=
 =?us-ascii?Q?BRoG5TkonA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38015463-9a00-4f15-621b-08de5af5ae9e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 03:07:17.7291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S3LJ5VtxgLieA9H4vXGPyHTUVItDcz+knPqUhZySXZEdVzw9vEpESz79K1CDpBk3avBmIgadQH6xd8dgw3/pzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/gicv5-host-acpi-test-v3
head:   84f427465d36ed431494f6f69b46a80f5543bcfc
commit: 3d3cf2c58dac88b3a8bd61aadbde9f805ae523ee [2/33] ACPICA: Add support for the new ACPI Table: DTPR
reproduce: (https://download.01.org/0day-ci/archive/20260123/202601232135.ggR80UAh-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#76: FILE: include/acpi/actbl1.h:2010:
+ * access fall within the TPRn defined region.
+*******************************************************************************/

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#97: FILE: include/acpi/actbl1.h:2031:
+ * transaction from changing the state of memory.
+*******************************************************************************/

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#117: FILE: include/acpi/actbl1.h:2051:
+ * (base / size).
+*******************************************************************************/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

