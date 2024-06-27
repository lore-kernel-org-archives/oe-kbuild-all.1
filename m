Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFD51957EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719497108; cv=fail; b=tfcNQLJfGGJeCyuiuRlIHohXYT7tYzSmf5Czn8uLuxT1P75SI9PbSi43E+IXOmcD8auXcwvilyLTjkMayfRriktWdE3ETrs+AZ5uMFUPtxRzv4x3LF7kzZIJ5K+0ZgdtU257plGOYSOGuYbIp9mhKCmTZzk9WRgHJ69NQGRawgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719497108; c=relaxed/simple;
	bh=HsOEKLXCWqCqELTktLNI2JI55BSE6wS42NNSG+y1mAI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=bfCWkixJIcqtjeR8epDztDvwyk9fKVLPsPCZ2Dm5ygSjkkgvnvov4RCS/FgHodELxr3EocMyfufHqzFMkDRWmUQs6Hj58b+DZ6MYI8uIt7vb0RygBJSv+Nk8B1Mns6TuN5kDGTzXB4GRZcIPLaC5lHnNDiVXLlDuyHgketnw0M0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V76I2CCP; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V76I2CCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719497106; x=1751033106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HsOEKLXCWqCqELTktLNI2JI55BSE6wS42NNSG+y1mAI=;
  b=V76I2CCPhxDAAF8JIJXDDB0cVecnHKxHMTBSdfZLhuN1F3pjD1zs4y8R
   4C/DgaBrX7FbkCEAU5NTjS+n7H9P9qjm2fnjQK9kTmc6ZQ3qQgr6P/glA
   443CRY4zmdt/hAWjEGA6JTQ3UoZP9LbuRJ9rQo6g6Ox3wl+cOTTPkvQuq
   0atxhdYYfxVpkpGvqZCVqMJIqM7YFM40sSaAhkFrCcjBjTiVF70IiaMcj
   +af94xjf2o3KulTHc47chk7IrVU91wQPhbaW8Oyk4KsJeAU/Ljq1zbVyQ
   NLI173fvvpHoo/Bj4pJdDgoQvSw0xsx2jCicVULiznYfdz09SAkwEUiGL
   Q==;
X-CSE-ConnectionGUID: nMrDsw+mQrqmZRoLMGdFIw==
X-CSE-MsgGUID: beKAtCBKSLOH9U/rO4/unQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="42044897"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="42044897"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 07:04:58 -0700
X-CSE-ConnectionGUID: bVV3wdTMTYizPa48Q6vu7g==
X-CSE-MsgGUID: 4i1iXcrcRsekV6CKdFintA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="44806618"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Jun 2024 07:04:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 07:04:57 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 07:04:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 07:04:57 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 07:04:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VlOzijrYHrtIDxvBi2bhUpN/H+VtzRkuTnuTsprqa4WbNuQnfBK2WSgOIkIard4t4X8GpUTHz/YZP76rI9H3FxzqTjuleptZCKiFFDuhm3D0/FBTjFpTBfM/SXcUdRjEL3Vc9ljaq0Wur4oS5dJp6aBs4CM+PLA145eF4Yr68Cyo2WpfSeN102fbzaLyxtWOBFTGbCkJAKPDEWdVoPglY0+GEw1SgrYiTmST85jlLJZcziVWiO1D8gUTYqosCIHuap9ZmYzC4e50PzKj5xu2jIMwUHe3OtywlRVXNNE1YXKWMWsvrrwBib0BLhiZTs7qwsWbU54FHTQUaAxdfuwFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9j+5jvFXsozP3gMuQIb9Wyz2JVK2Wnkrz0FAH5kYS4=;
 b=HBzUwEYq9QbUEgHxYQtw1qs+Jo6gYgd4dEqHtn1dYw4FahyMUJ1y3g9TE0T00wiRvVIVmZ9GGAT1RVdphkCPs2AFe/Ywwre0u3LinnUfgGjK9GuQcoMtkxDmSqbZJuATf0DGNOdMyDmWLGf0d36ct4D/g3oUv5x1KzvVogrPozzNcP/MGT/lCYO3vinYIgXsKBSsWNMi4QR/UZr7Py2kLCrZaPh5/pTV3tAraWSWXmBmodPWZ9AyR2CijDtx8IsY/nm/YmqwTEmNlbR8xVL9RMVIP6zHrsYHFu0hZQAL2QAHK9RYPOKdVvc2R8K7Ko/J9M8s+378augYqu5nBLYzjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 DM6PR11MB4706.namprd11.prod.outlook.com (2603:10b6:5:2a5::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.26; Thu, 27 Jun 2024 14:04:46 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 14:04:46 +0000
Date: Thu, 27 Jun 2024 22:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: [linux-next:master 5081/8232] progs/hid.c:33:20: error: variable has
 incomplete type 'struct hid_bpf_ops'
Message-ID: <Zn1xdfuXYPgbMdwz@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|DM6PR11MB4706:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c1ae27-edec-40d5-929b-08dc96b219a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MNwI9+hVIAjfkd+Mklm9CFp+azs4ow/UXSmwZBIbqUK2ATGhQwn74a4YdMkS?=
 =?us-ascii?Q?lVtIyJRf71EIQroneLA1plAkENo4HwsG8SV/H91aQ9xhG2DxQk6npGbc2iPT?=
 =?us-ascii?Q?v3gzZJUublGAUBgpNiy6iEdHd2nXA9BxeEYElXU0RJQ93M/I8y+ncT3xNFTW?=
 =?us-ascii?Q?cFdLUBlb4o9OfYICupiLuKePVwh0T/zOJ52BhX83vPzCfb4V1REWqO+btQYi?=
 =?us-ascii?Q?MgpyleKVHW9DYE+6Mngay1gZdv7WnSA2Cp4k9RL/R6EjwZoREtnSNOaEDwIY?=
 =?us-ascii?Q?nCqZA8PHZuAkoNuyiY5v3RY0MDZckz13kkmkyEsdj90e3zz236rugSM1LQeP?=
 =?us-ascii?Q?zmw5htsr6WANH9X411HO0AkwPI6Mgc0tJdAlzFnV70Bm0vDx5E2D14swP9d4?=
 =?us-ascii?Q?gjXHeWkLYIdd1zLJMnEja88Wi7LDJ/9XKnvKYWzyxnjKJo8g7JKSK4VxCqr8?=
 =?us-ascii?Q?BLCazKE5TjrUxN/aeHAH0QrQKJPx721Y/JxWN/PZYaeTCi3/alS8OETk4Vwp?=
 =?us-ascii?Q?SjONr2fQ1tLRsiBBo27zn3sVMzXMXxlFgfKRCTHGiwmsF1j8pK7sMlfjYmAw?=
 =?us-ascii?Q?z4cdB8nXrKQRBbD7CW886Ii32uZ7Zbe/q9N1K1gG2tJsbFZjwLOA69ypgFXw?=
 =?us-ascii?Q?Y7BugsEFXuAEizt8OilNh1r8ld5681eeFDpDQEHC8+xxU3Ys9DB0rGy2Va0R?=
 =?us-ascii?Q?1ARSMx4QmtrX+Np3vT1jNXPphMRNc8leTXniRFOq6HR1Z25VixelZhkZK5ZN?=
 =?us-ascii?Q?MFEJQu3SLbCF3EnbX6WIJjzLJoTbxqVKHXgQtOEGBnoMES5vn0kR6mGPdete?=
 =?us-ascii?Q?u86lpqbpNAg5HO4UW79HfHv0WaVoPW083IPYPnxk5OUsxWS7qNeM87oXR+IU?=
 =?us-ascii?Q?EkzjZcn1m1zxuu2K9fw+cAU/g7UOfrjxIeJFpA3vaJErecGTqEXsjtVWD24J?=
 =?us-ascii?Q?HXjSR8R8yfMBnI7WLQonqecCVkYwJE1OI4oUqzpcdhF2P1EDlmbgUOLMBCIo?=
 =?us-ascii?Q?EKMdiCRbHK0tLst0iAzZ6B7pZY42pYKtMGOh8nEzOcXNvkhEdTrWPa6Rb07i?=
 =?us-ascii?Q?8pQS1FBpamwRYm77JGH+DOAu1JIqpcS4s/FoLhmBl02X7JW/p6X6uRAs5l8R?=
 =?us-ascii?Q?68/3bDpTdTmqnxDYl7C8O55PHO+DoE0uQZYbJY3VnfDodCnh3InQ/85cFCZb?=
 =?us-ascii?Q?NFZcrcBek39bVTjE1EMUcFpzaJiyocOSNXr2prbX9bfkhNNf/lqRpYfb38HW?=
 =?us-ascii?Q?tFiydTnrk7Jl314ThYZc7k6LmuHefZY+ow0kzXvvQVqoPVIT9wV6Qmo+DgH7?=
 =?us-ascii?Q?UYh6KNVambV6HspSgrx9rFGj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gFzpx0yLeCUVFH0R0yDlFxZnB4g8ACWt7p3XvdM7Bp/F7saDnBfrL2bfk5ON?=
 =?us-ascii?Q?6Ol3LAcrYxcPHm0LxgtJXHdAeJfVvTLetc+wEGRNMjSg1XxIE/ns+WvPLTPi?=
 =?us-ascii?Q?+IcrcR6CR48S+isvJWI+Us68aE9DSO9P/gFVZl1BsV+Olb+BvBiOC3NwWjc/?=
 =?us-ascii?Q?/vXb06k21zyuL9IJO8BygH8EcDoSTbLhTwVZL4wY0bhw/XzCSgyWsIF5qwKS?=
 =?us-ascii?Q?qcOpuaxlmuImTVkucWByyKGPt2z3MWxGChYM8Hqk9L3sHsBWACh0A8LkTiFA?=
 =?us-ascii?Q?uXdeRWMIvTHdmw/G88bLfJoM1AFpIqhoVHCrs0dWpF8Q2zxFx1EHoyFXhzNP?=
 =?us-ascii?Q?2U084g56ao3sg9Fyi/qwqXlyXKILHchXDx9AmARA75M85TY9RhkgMCE8UNSd?=
 =?us-ascii?Q?By/7f+iJEipjHJk0+jT3b7Torz9w/1xRCmm/KCvid2EXHapwXopeYe0t+Z3O?=
 =?us-ascii?Q?DkrqMyj4YHiNWr7Z7CzRi/uJ/Dbl3raqgvbLFY3jas61mbxdzsCdzSOZIT1n?=
 =?us-ascii?Q?Ka4S4PeFlGW1wkJ8Z/O/fE4riiQeY/TXtCowq9Lq450KsjlzqQddc+MOAds0?=
 =?us-ascii?Q?dQm9zTBdji7PLgRHoTrBD2fYUYugVuhDsNaLq0jXlk5QBTgAxKeLgYRUL34C?=
 =?us-ascii?Q?zNMGBSlPmqSFhx5lTetcTMddE1sP1Te8zwYa1lIyybYnWvk0wyQOOTov8Ncw?=
 =?us-ascii?Q?8Vu5rguiw82QN4FAskN4loVvc1QjCAUSJptGHvUx3paUds1KwsAJJ7ckFVN8?=
 =?us-ascii?Q?JY/if4P4RLz86KuHUN5N92lRTc+pjlM1WdZdHRs/3BpUYbhTDwJJ7cLC3+kr?=
 =?us-ascii?Q?5uNBNIO0jqaTJ6YLDH+kUmYrVTHNkECwtcldc1FA/wlX2P32jWMj1e1q51T8?=
 =?us-ascii?Q?BWV807RJJLa6PfuNvx62LoZ4/zIj0VW7W7funeMOJ2jA78iZC8YHp3RYxs+v?=
 =?us-ascii?Q?xnLBt3SKDX4SMmAapUugfrFRnNkltwAU4Gjq1yAQgmvAvK0gvjDqZJZJ1Y+R?=
 =?us-ascii?Q?FNbI9tvZWacvsoRg8XZgmYI5DAFMEvpkzK46hiwPUogI4PT7wlpjbLMPK8yu?=
 =?us-ascii?Q?+Mabcqsksjdhg94QrGllo5x6uM6/Wh1jnxcdrLK7BJdU0knHNGciZSrP/xTY?=
 =?us-ascii?Q?sL+G19PxgUc9+N+t62BDrUBIoGutzt2QBjlP+9ds77dHnihEy9jpTXCgZno6?=
 =?us-ascii?Q?Irjo2PZkVCUgzHt6G1DvY7cx99JJnGcbzPnC0qLh+eWF5wdkcbvtKkQXCBHY?=
 =?us-ascii?Q?8eYmNCDyzaqMaH2ke6pVYfhdSHMTOWkP+WTofPGegzYCz6Xf1GlIzdypBuTz?=
 =?us-ascii?Q?KjqOeXQLo2wJpNgGdJjmI/XOrnOuWxc3nSkq2OMwnxjmXSoHjLe5U/73JeT3?=
 =?us-ascii?Q?p6g0nJzVyhgzZwtrpcj9MS0psEwP6rWE3KI4yrX/gg3lM6gTME5051cE0KPY?=
 =?us-ascii?Q?iAQtp+RPV/kbN7P4mxR7QxjY+fmWE0+5UpH3WiSLQwtHiKZJQguZqx7cU+yT?=
 =?us-ascii?Q?rdSWPb00QtTCLFv5fn66ESGfjRiwuR8hh6XVy5zrIHgN6GSdFQd2odDhPrZu?=
 =?us-ascii?Q?OmvCt0+S9BxcHHuuT8xcxDA5YldcPiKjxsv1I6Cl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c1ae27-edec-40d5-929b-08dc96b219a0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 14:04:46.1163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gl3b7qSKf1O/z1W2pEJ5gquXydOZFzYunkoCyVKT+B0DGj77TbDDWkkP3gU9+MzCw7oAq/a5lRPZVA0V8hqIXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4706
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
commit: d7696738d66b4f1379fe77eef61cd1047d7f0773 [5081/8232] selftests/hid: convert the hid_bpf selftests with struct_ops
:::::: branch date: 27 hours ago
:::::: commit date: 12 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406270328.bscLN1IF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406270328.bscLN1IF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> progs/hid.c:33:20: error: variable has incomplete type 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |                    ^
   progs/hid.c:33:8: note: forward declaration of 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |        ^
   progs/hid.c:52:20: error: variable has incomplete type 'struct hid_bpf_ops'
      52 | struct hid_bpf_ops second_event = {
         |                    ^
   progs/hid.c:33:8: note: forward declaration of 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |        ^
   progs/hid.c:70:20: error: variable has incomplete type 'struct hid_bpf_ops'
      70 | struct hid_bpf_ops change_report_id = {
         |                    ^
   progs/hid.c:33:8: note: forward declaration of 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |        ^
   progs/hid.c:215:20: error: variable has incomplete type 'struct hid_bpf_ops'
     215 | struct hid_bpf_ops rdesc_fixup = {
         |                    ^
   progs/hid.c:33:8: note: forward declaration of 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |        ^
   progs/hid.c:237:20: error: variable has incomplete type 'struct hid_bpf_ops'
     237 | struct hid_bpf_ops test_insert1 = {
         |                    ^
   progs/hid.c:33:8: note: forward declaration of 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |        ^
   progs/hid.c:260:20: error: variable has incomplete type 'struct hid_bpf_ops'
     260 | struct hid_bpf_ops test_insert2 = {
         |                    ^
   progs/hid.c:33:8: note: forward declaration of 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |        ^
   progs/hid.c:282:20: error: variable has incomplete type 'struct hid_bpf_ops'
     282 | struct hid_bpf_ops test_insert3 = {
         |                    ^
   progs/hid.c:33:8: note: forward declaration of 'struct hid_bpf_ops'
      33 | struct hid_bpf_ops first_event = {
         |        ^
   7 errors generated.


vim +33 tools/testing/selftests/hid/progs/hid.c

0330f725cc5b01 Benjamin Tissoires 2022-11-03  31  
d7696738d66b4f Benjamin Tissoires 2024-06-08  32  SEC(".struct_ops.link")
d7696738d66b4f Benjamin Tissoires 2024-06-08 @33  struct hid_bpf_ops first_event = {
d7696738d66b4f Benjamin Tissoires 2024-06-08  34  	.hid_device_event = (void *)hid_first_event,
d7696738d66b4f Benjamin Tissoires 2024-06-08  35  	.hid_id = 2,
d7696738d66b4f Benjamin Tissoires 2024-06-08  36  };
d7696738d66b4f Benjamin Tissoires 2024-06-08  37  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

