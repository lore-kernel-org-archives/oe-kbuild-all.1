Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950E52135AD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 00:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763772231; cv=fail; b=q5MwU9+XF8EjFzJmgRqKZTO3unYV4Xgx81ORVUg+DPBNWg49Ua3WVnWdB1FoZzgnKiq8rckk13xPjhPaqAmVZYsSk3686xutlAlVAee4OuN4wmUCWj/pfBq1UdMKEk/TxEGhdZNOsQNKQ7VL9JojHfszwWpHGx1imeLsYmB+g0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763772231; c=relaxed/simple;
	bh=rjVGExKGzKq05/WM3byX4Q2Bp0lAv4Z18vNYpIMcTmI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=u9H3YAL1KyLGYnIicLES6JZWIpYMMsADnnXKUfGmwECUOuH0Q+KyjiRVWmAX/TKNp72eM3vpwJ1p+V3K9Rf3F5sN/Nc/XNy4TwQGvN9NHzO4cGRRDbEPa8CGJNWtIm+XCZHfna/7OgCGRKUoLP+S2qS+7JhXidcI0tNf6fVZJUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cge7CuZ3; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cge7CuZ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763772229; x=1795308229;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=rjVGExKGzKq05/WM3byX4Q2Bp0lAv4Z18vNYpIMcTmI=;
  b=Cge7CuZ3WK+iFORwEvWvQhf08F/JLTxKiyo/eWvnsvLNaWW4ZjTlf1nF
   gYb0ppbE1edE7G95Gi8PP9ln9Gd4BB1MDcvd+wUpfqIZPq4QbqJAqVvBC
   0i8IdbZ+GBcYAM3HtJupqJiq6Q2y2uMUynyFzvZPIGx1vJ03BVPqChl52
   6I/Azmil+agdqZuQcXr8Vm9cISgPSZZtwJEqXOioZvXHKJ12FF3DZzdOG
   XYY3dKzF0xUo23MzizwDHFTyfFFO7pTN9J8rExc2F+aErkk3B6AW0HT3H
   ym1ZaX11DIWSKykTFbuhJkRqG4ZsSNI+h/tYH8azGSxzoSgXxHCK846Rw
   A==;
X-CSE-ConnectionGUID: PB78gPvCRiyP6CLvP8aQVg==
X-CSE-MsgGUID: a6BpQ2L0SBS6PcYWJWtF6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="68471882"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="68471882"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 16:43:48 -0800
X-CSE-ConnectionGUID: tX3Z+p2KS3yyPH4jNXFc+g==
X-CSE-MsgGUID: 2AcOIYxFQ0GnrqS1qcM6Zw==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 16:43:48 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 16:43:47 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 16:43:47 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 16:43:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5q2rMBNWNVH5ziCgfR4EzoAVbHnRmrS99k/Xw+Oiuxn9zHDZ7nYZAj1IdGNX4ucgDmp4UiXo+BxmEfdmvrVXwR/vHx6owk3cTizRk0dTRcOsyzD+wZlNatieyxRrsz0HsoxqGKZSnkHhhyqV72VMfHHFK2P7qDrPXs7GMjzvRGjbBkYScSQ+XtzceKTgaYB6cohbSyeT/bkNN7UojAR+HE4A3gp+66IvpuNGDYDtQ0Ga4kuYcEStggn+LZfyhIJaOY3SmpLW0y+kOM8sCYVGuunCA5VAf8/H5OIKjOIYhpD4eEgntFsU/9j4XUWDkAoRy5VgoygtpYSkBBG1obg9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+eGOiKUK1c25YAt5HRKNw64Q6NV7Chmu99d8bJRhuM=;
 b=j6JTX9AAn1gOAVvAyb+86346krwCwKbUODHbK/0Zpe50/1UldygG9SA4BhVkti4BIno+24dTvM8Z/tLFgQaNZFsmSj5wPN6bV8h46kgmLyaIDbaJ5/zdywcRg0XDI0q0Ff5tq+LkwUitXrvlhI9XnvRDcmOp37w660Mt4qj8YWEA0eZ3zrCGUamnYnBaApMGnUtkAtc1tRndBCJhrClOk0Bcf0hhQGrEnHu4oBxxw168piwA1Oen29VLFf69xeeDmm+gRmW8lTXugYI8+9IY0FzrticNet7uQ2bwCNAeA0DFFtr+rlullBLU7IeEMJfftsGjwb5BoLE6TQFFtYMQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Sat, 22 Nov
 2025 00:43:44 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Sat, 22 Nov 2025
 00:43:44 +0000
Date: Sat, 22 Nov 2025 08:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
CC: <oe-kbuild-all@lists.linux.dev>, Arnd Bergmann <arnd@arndb.de>
Subject: [linux-next:master 9003/11041] tools/include/nolibc/arch.h:41:2:
 error: #error Unsupported Architecture
Message-ID: <aSEHOMJL7a6QNfoZ@rli9-mobl>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|BL1PR11MB5253:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d2bd4ad-30a2-4868-4646-08de29603087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?3zykwM6Y0xNA65vSMUGrU0+fn5etUopmmgD3l3TZdcFn3XOsPrH7QZBcR+?=
 =?iso-8859-1?Q?JMWaaEJrpEZo7Ib658PEDramKclNbOR9TMK0xfG91xcx6CA0q3Rj7ZCvXh?=
 =?iso-8859-1?Q?yeucNOJ2og73BQ6NamdQUUgUEUxfVFzzm8IcTPyYOwnI2pC2zMpI0n0cN1?=
 =?iso-8859-1?Q?doO6J5quY5VoeJjWqYCDUPUEkX0pS/pagiKnFrHY1BF9YjQHW40X23LzW1?=
 =?iso-8859-1?Q?Y8wgdVChZ3RFdpqguHVpc9HiPbT7wYn0BdItHuWLl2z8vgc75U+uiQQAZp?=
 =?iso-8859-1?Q?+whKog/CCyE2Xq4O19UAsUpWAId8PFnRVXM8uhmBu6OGIEdXntfToPVIjF?=
 =?iso-8859-1?Q?k45xEaUD0d+o+U3u30EYbgx1HablGleSmYYD44JEkQ4+OKOGgd0YuDv1sr?=
 =?iso-8859-1?Q?zWwaf9J9QQ2VQcshst6qD9QZunFdmUgaIhMUzW6W0aG5gkecLI7j0y8Zkg?=
 =?iso-8859-1?Q?lz+vIS6SCoC90Ym7P5yQQrX1KVoJJBFcIiXralyCmqYfKxjGYRCx0QdBzT?=
 =?iso-8859-1?Q?8GFj+Pw38RVATzwCe/Rer6FcCD1z/XNyBqCbEQ1K2g1KPdYMnd2h2G4JeQ?=
 =?iso-8859-1?Q?G62Hh2Zh399rqIIOuW/nj1NtDwPEFKXuweHUz8nZihzWxgwU2aplCJhg63?=
 =?iso-8859-1?Q?UqCdJcObNbyHHbGYIqpKF+KjLmQHtta7RQ/TMf+h1veF9vXiR9liPbTO9D?=
 =?iso-8859-1?Q?ncQ25trO06BLsjTZLknKb+hZ97cBWOKvnOIip0kQ/6dz/4rRvesN0dnysA?=
 =?iso-8859-1?Q?XNmW7/iegxmjaeJsxahyltDQBtFrj7XWryU0xAqbi6ICPf4imYKgZZhiC3?=
 =?iso-8859-1?Q?l3CFEqYUQYpdh6vq+G60U7A7zs+z69Yf2O65DWqrbJaictVSw3/QxQ72uD?=
 =?iso-8859-1?Q?j81ZjvkeDSBk94CQ9jGHO6wHKumQ3zPj1KyED2T/3IqjBuC8YXDXXt3ZPP?=
 =?iso-8859-1?Q?9Q40nmA38dM/ghv1HeOdMbqpyBbLdixcrIZnlylK/q4yDzwkEJF3ranzEd?=
 =?iso-8859-1?Q?1ictqf4LbBSaMbUxDwa/2vmfmgA/z2kMqjQWlTo43sPKagvFGSmJ8I/OzM?=
 =?iso-8859-1?Q?cLz+YZ2U6H2KV8eu9s6V5OtQpU51OJRMxxe6sIgSGhPdMx/oCthawszqJd?=
 =?iso-8859-1?Q?wSeZVjrr8L3bwj+A1ZuN0O4dkDRtZWOa9dudswgTV8h85kAF9VTrkSKKDc?=
 =?iso-8859-1?Q?vuVh+mYd9MrhWaq9uue3eHQgxpP48LEF1RF6szpw6wKRXMHYaUhtS9YfEy?=
 =?iso-8859-1?Q?UhXBIV+9vmGBKXoKkovxlu1efxlDV1gQ7ZeCOpOD4pwd2P7wggmxdB8SGi?=
 =?iso-8859-1?Q?gH+KlImfxOV8X3P2r4HJsunbps+h+fALA+1ZE3/CeeWgwe483b2GAeTbkA?=
 =?iso-8859-1?Q?WVcsxG3I3CY5dobLj8u/docVc10Gd13llrDh79mbBZtEeK+RswLMZAcnZa?=
 =?iso-8859-1?Q?VDDAen32+S5lmWhIjKNko69KcvaOgdS5x6hkkjhbRmf+h9lq9gd+doJfLz?=
 =?iso-8859-1?Q?2MC1+lqlUwSAx5z2JxjhBTU9EeMAkdM67MXF+Xh3Ju6w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TcW1AeIwj1ioV7D/ybVaCU30UxWFyZ0tanFLD8+Pqv6MyOuecklWqdTGzl?=
 =?iso-8859-1?Q?BbdGhQuz8m9vEwe4DRSCrz3BCx98Hnbm3zhkEGTIBmfpo3fC/nLdLK/kP8?=
 =?iso-8859-1?Q?GxHcYFy0uQP7Nxrr+PwBCKl8c9uDKdbGqmS9tB7Go8zmqKf3rAgtYHoUvo?=
 =?iso-8859-1?Q?n9NUbuLz052qWOo1To4U0pYgex2WEeTcrk1uH4yCe/vak0J/i9Z606ebGy?=
 =?iso-8859-1?Q?pHb3bkTI0MNQj9KwjiYzFW+PGzVpHzfgZHVahApWISkBH+r1z2NhLVR+7f?=
 =?iso-8859-1?Q?DERTmEOnb8MTr5uogL7XFKsaei5W3+f0RB2bPl1AbBjbmUXIScOiI4pDeW?=
 =?iso-8859-1?Q?ZdMfFoBfdDSKzAYWUJgrZ+gD0IabfB7ilfyRdD2Hyf9hK1s2rR4OlyZT0Z?=
 =?iso-8859-1?Q?F4Ced6vNo9YSB4DlRohRlh55bQq3XsuAO+hBQ+lT8QeVUs6hW6dTcBAeDm?=
 =?iso-8859-1?Q?6tXRtr3UdIwXw9WO5wW1nPL4ZKm6nMPZb1XG0tfZK8XJkxxGNfGXQbPdIY?=
 =?iso-8859-1?Q?XmCHvfHhhq+0qV2lTs6EIICia16pmwzuu703noroNzcS58aUBo64ooD4aJ?=
 =?iso-8859-1?Q?2wr0kqVUV9fvgczXO9qwMH/fc5wo0S3gKq4V+Rabm2WTgvkNbSlWHncR6+?=
 =?iso-8859-1?Q?7D6JZ5Rci9T0hUGqr0mpDD5nMwp5jylqdBR/5Hc/JL6c4+Vsg2K0yUVerC?=
 =?iso-8859-1?Q?3UAasoLXFO0AFyEHQpzipGt7xgTHQ0lxirJk+5yopZGovogr6UqI7KC8OG?=
 =?iso-8859-1?Q?DRfDridcKlSYYvb82ha+CUVGiQwHV8B8QHkuB4068fSvU26N2yQ/xnT6xG?=
 =?iso-8859-1?Q?a1HW62fuLLCWV0arWLGN4ju7zxMB+unbHJD0zBUgTY8nvPAjsR6M1DGNT5?=
 =?iso-8859-1?Q?VRBF42rtqRl49ajjQlIv20Qs4PTU5apg0LwP0zVz4Fh1qYJd3QbEY9a6wg?=
 =?iso-8859-1?Q?wRYIR/4ua7+d9Af5r28KUJ3nnuKZGFGNlwXcLwSZ1713YgQwVzSR2mcS6m?=
 =?iso-8859-1?Q?kSf2l3W+w3WacJqJHNympiDW6892Bo/vGQ6JZ51p7M7Vkdhf3buchAC6yc?=
 =?iso-8859-1?Q?iGE9AsSeoF3qnxBCcUUFUY7pFvAyhrZgtoWblMbQ4jn8esKplufHAxgPeS?=
 =?iso-8859-1?Q?Y8WF9CrVPllAXoq60TkGZeZqWWac0H8MDje7LxLaPd2/KzVhNoZOKHpbqe?=
 =?iso-8859-1?Q?S7/fz0Q+wIz58Ofo6INUHDrUlDfFnN/NY1Zwy0uJYaH3wRbptWtZuJSIZG?=
 =?iso-8859-1?Q?VfCEeohNsN6isHaxhd+w1rWVmZVU9ssFj659hQk04dRZm68z0XmFWSH4+7?=
 =?iso-8859-1?Q?Os5nViWV8V6el1XWaztAuOkS/GQcHikI8/GBml5zBzXSO1ZTMhpyvdneWK?=
 =?iso-8859-1?Q?X9BR/RgBLoRcbDN/6ZkF3vp2VBZ5Wks9B6R/XxsQFwvua2SYCguM6M13pu?=
 =?iso-8859-1?Q?HYxXJX+1AcO9Stl59K4uxeRjq35Hqq77T1sKUzz5j2iswkWPT/ZTs4bGef?=
 =?iso-8859-1?Q?q/VtCIegBn4AyGtUkmOOh73ni0MsE/PLnhU82GzAELHkR8G2hf5WT07uj6?=
 =?iso-8859-1?Q?rleVPvz6/ZKV30YhJ+auftNcyDY9QxEeewRzh3qLgT7RM3Kpi0GDohIo0W?=
 =?iso-8859-1?Q?OQ8EStEy+zeFEcD7tc/mMhJxM9/SCt6I9De1sz9ERZgr6wOCrzlruUtw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2bd4ad-30a2-4868-4646-08de29603087
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 00:43:44.3549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5oz0H20EUzPhyAQGHFdG5xLYgHmdoECtLf9krKUePlCOmsH1jSPHSDO2mEvl3Z7Faek5t0Mly6FN3oPaP0IXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5253
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
commit: 169ebcbb90829bec0429ff9f6012a0313169e45f [9003/11041] tools: Remove s390 compat support
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251121/202511212331.pYBUDx2S-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511212331.pYBUDx2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511212331.pYBUDx2S-lkp@intel.com/

Note: the linux-next/master HEAD d724c6f85e80a23ed46b7ebc6e38b527c09d64f5 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from tools/include/nolibc/nolibc.h:96,
                    from tools/include/nolibc/stdio.h:8,
                    from nolibc-test.c:12:
>> tools/include/nolibc/arch.h:41:2: error: #error Unsupported Architecture
      41 | #error Unsupported Architecture
         |  ^~~~~
   In file included from tools/include/nolibc/nolibc.h:96,
                    from tools/include/nolibc/errno.h:8,
                    from nolibc-test-linkage.c:5:
>> tools/include/nolibc/arch.h:41:2: error: #error Unsupported Architecture
      41 | #error Unsupported Architecture
         |  ^~~~~


vim +41 tools/include/nolibc/arch.h

271661c1cde5ff Willy Tarreau    2022-02-07  17  
cc6dc5fbecfdf2 Willy Tarreau    2025-06-18  18  #if defined(__x86_64__) || defined(__i386__) || defined(__i486__) || defined(__i586__) || defined(__i686__)
cc6dc5fbecfdf2 Willy Tarreau    2025-06-18  19  #include "arch-x86.h"
271661c1cde5ff Willy Tarreau    2022-02-07  20  #elif defined(__ARM_EABI__)
271661c1cde5ff Willy Tarreau    2022-02-07  21  #include "arch-arm.h"
271661c1cde5ff Willy Tarreau    2022-02-07  22  #elif defined(__aarch64__)
01e8a6d0c39ca0 Thomas Weiﬂschuh 2025-06-23  23  #include "arch-arm64.h"
aa68a5a83a0acc Thomas Weiﬂschuh 2023-10-20  24  #elif defined(__mips__)
271661c1cde5ff Willy Tarreau    2022-02-07  25  #include "arch-mips.h"
0cb0675ec37e16 Zhangjin Wu      2023-08-06  26  #elif defined(__powerpc__)
0cb0675ec37e16 Zhangjin Wu      2023-08-06  27  #include "arch-powerpc.h"
271661c1cde5ff Willy Tarreau    2022-02-07  28  #elif defined(__riscv)
271661c1cde5ff Willy Tarreau    2022-02-07  29  #include "arch-riscv.h"
169ebcbb90829b Heiko Carstens   2025-11-10  30  #elif defined(__s390x__)
18a5a09d90a75f Sven Schnelle    2023-01-09  31  #include "arch-s390.h"
73f12c6da77a7c Feiyang Chen     2023-03-04  32  #elif defined(__loongarch__)
73f12c6da77a7c Feiyang Chen     2023-03-04  33  #include "arch-loongarch.h"
8e1930296f921d Thomas Weiﬂschuh 2025-02-26  34  #elif defined(__sparc__)
8e1930296f921d Thomas Weiﬂschuh 2025-02-26  35  #include "arch-sparc.h"
66a4f9bb1e895a Daniel Palmer    2025-04-27  36  #elif defined(__m68k__)
66a4f9bb1e895a Daniel Palmer    2025-04-27  37  #include "arch-m68k.h"
02217ad447d7b1 Thomas Weiﬂschuh 2025-06-23  38  #elif defined(__sh__)
02217ad447d7b1 Thomas Weiﬂschuh 2025-06-23  39  #include "arch-sh.h"
48946c5aa7a848 Thomas Weiﬂschuh 2023-11-05  40  #else
48946c5aa7a848 Thomas Weiﬂschuh 2023-11-05 @41  #error Unsupported Architecture
271661c1cde5ff Willy Tarreau    2022-02-07  42  #endif
271661c1cde5ff Willy Tarreau    2022-02-07  43  

:::::: The code at line 41 was first introduced by commit
:::::: 48946c5aa7a848c7dfc2151267af92956f492f58 tools/nolibc: error out on unsupported architecture

:::::: TO: Thomas Weiﬂschuh <linux@weissschuh.net>
:::::: CC: Thomas Weiﬂschuh <linux@weissschuh.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

