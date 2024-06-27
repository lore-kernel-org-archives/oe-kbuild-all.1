Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6B91957EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 14:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719497136; cv=fail; b=lSGl0CGmB8FGtVGXWNkY6xR8NlguoByjRNzivdl/K5Za5oNX3fePuABFeO04tA8U3fz5zXkubEKzTEPnOEi6H2FpnHH8ncdIWmWwNA7uTpUjNbgMLF4vocr1sA+rUWB2a2OuZNvBPl1ez7E1PtL38XF1Mc9PYwhCw+QeUJRgt2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719497136; c=relaxed/simple;
	bh=f1EM2MwJmKH+UN9nEu7K0+croiYKLTdvdwrWdmgqxPc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=LjYz/XZl9PagCm4Oy81f/+OC+Z6FB/XHoCTK+QVopFK1zO9atoygHOnWb5UEggQCqGw78XdaveXjumeiesFtyq9O7duHec6mc4C9qsfLCXDTommFbqCAIZwzaRq2GycbbFicV72ZNVswvfqyV7lAlJGmtzaVX/ZCDLt1ygfPUJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n44H17Bq; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n44H17Bq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719497134; x=1751033134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f1EM2MwJmKH+UN9nEu7K0+croiYKLTdvdwrWdmgqxPc=;
  b=n44H17Bq3RPEXtNd2OKxVsTVLgKc+ZskzYAgTBXdL1GzQErd5iSmlUAI
   DSmDWnxXCGrQ86hNAIWvbfnx5FagGALXc2xYZKa/LoXl4g7C9YD+awoRj
   MdulfvI3K9JJ4LckLXSVSJDg6+rAy8YfH1HhZjUUUjk37P94028Si9Whf
   tXidE+z3kj+r+8TZU52xiO1L2p0kzM6l4GYi3gMHVTd7ayG0HQMMq9wt8
   7OGV1uy9eXlg8A6cJib9/SMUBemy3WDBJM7WcrkN8ow1Zy9A36PVChT2u
   GejM37budmgrBa8qoDue8xP5SRKCrTgniTR2MO7zJO8oWqqZVczzn+jgq
   w==;
X-CSE-ConnectionGUID: a0ioM2ORQw2KXsHseDuoJg==
X-CSE-MsgGUID: PJxNgeKaS2Oy2ZNPMsP3fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="42045044"
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="42045044"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 07:05:30 -0700
X-CSE-ConnectionGUID: VImBcC1bRdqqk9thwtR0cg==
X-CSE-MsgGUID: DHGaiwbhTdWnejUeHN3sqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,166,1716274800"; 
   d="scan'208";a="44806810"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Jun 2024 07:05:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 27 Jun 2024 07:05:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 27 Jun 2024 07:05:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 27 Jun 2024 07:04:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZtz+xrghpi6do2RtSuVCb8vswhyDzFffaIqhzJ2JqZPDanZo8LzAMTV+QUI2vMoQ7I8MrcEPAn+32im5jceuu6LcT/qkei7sUlv1e2o5tOf5fVU5aQImHuvHKiYT+21WhceBW29DNKEBV++ccLgOHBsGfDwh7wtEJzeuOUqlrsUncR8P+FLyL2sQVBR303DMl9iY/51y46x/mb4pvZRcRMqAPAR/2cAVHVfgKP+pN8issZ1c3hQRtZ+7xtj+H97nwt3erL0DCXAoun+2/yrdEVJexk6OpEE+cB+SYyS3fKo2NzWW6UwKxAF9mDOpD8d3iLgHvSQMWJPRThgmr8drQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fiHabWcNEp9M3fAUAAhrcWvlRLvGBvD2ivDWbEB01nM=;
 b=gwKPZplsGQ7h4N50rLtbI4XzA8+Z5etTF2uAXayK85gLNLkbhQs6Bg3SH7XTNWjWXXOSCBzyV2yBjstUhJJ2XUiwl5LxxibRh4w/Cv9R43Q0ov7evdyh9KIZgeHe76XvrluzoOCzqQ2PZ2Eymc8v2lwv31DicvzxQjlO1/z0Qw525yeoVFKjJ+Qr37DUxD6gw01/9oG3WHhB6XyrVWSGMe1BCRIhFK4b8x60sw7BzU3noO5a5JkBhllWHau2YLYcZ+EsdEZkRtMGrhmTHG/Bh/6rJO+Pf9pH8HtgaJ8ahFSXSkDOyOY5hJHI023WUVb+iDLNfpKN7S8oAjcbHTpoKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 DM4PR11MB6237.namprd11.prod.outlook.com (2603:10b6:8:a9::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.35; Thu, 27 Jun 2024 14:04:21 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 14:04:21 +0000
Date: Thu, 27 Jun 2024 22:04:12 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 7931/8719] statmount_test_ns.c:27:17: warning:
 format not a string literal and no format arguments
Message-ID: <Zn1xXGAHRqXHFN0J@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|DM4PR11MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8df126-18b7-4a38-c739-08dc96b20acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UabZuE55M7MYO2Gu1Gi/SxB0iWXTbyVF+x+yB1A5q0TQGOyc1KStOEuEKHZR?=
 =?us-ascii?Q?/Ut6b8/iQPBjttRpGVNpTcE/GqPW3cnHwOj22EPcvKKft+WV4SY6EOrMKuom?=
 =?us-ascii?Q?qBFXNBFMm8nAuKSj+YFyEL+SCfEbPF/0pX95gwkZyToihS4axHg7+CtKl5Hb?=
 =?us-ascii?Q?9s3Z9Nm5jHPS3wbpJP1RP+/pCF/v5S8SHmda3uPDwcOex/8BDOOqnowNjPmq?=
 =?us-ascii?Q?Y1s11BtOUecGJd5BYaasWqDcBpAtcFvu5SBSfuHLJSPEv8IROPvklkaauf9F?=
 =?us-ascii?Q?aRODw6DoFe2cp3DXxAAXdzmguHB9aj8Q8lKAdJLt+BY9VXFfmD5JKGu8gyv9?=
 =?us-ascii?Q?GQHDIP1KOtnFw8Ob4Qt5y2pCURpOO5AmALzBeN51qOk3kSsJK9+u1karLkNv?=
 =?us-ascii?Q?JrC4CnGqHohDMRSi6nkiSd9Ij0B0IMy0U9CPzIRSxhp/+rTiTt5hZYuBEFah?=
 =?us-ascii?Q?icC1piBxoQwZQ4GBmbjPnAC87bD/hVzuIvGP1cIKOoMjmZRjz3WpupnuOHUI?=
 =?us-ascii?Q?RZYD+h7LVyIEo88MyvYP0Qw+HOQmZlro/mbjQ4eW2wkyO1umxeCgKTiEHTKs?=
 =?us-ascii?Q?vsljx3xElqHSHiJKMdn53UnzvQuaMPTBhk0wrilquYzPiumhwiKvX2lBTADB?=
 =?us-ascii?Q?Z0REU7/7m7S8BkaAzudPZkMWV1g0RyLSLivGG0PoG50dTNhSDGIlKKxBhrEz?=
 =?us-ascii?Q?WigfJK1hugPZfaKm1l+SFBlhGOKM3c4tJ81AaaRx+V4RhWU61OYoviI1csEo?=
 =?us-ascii?Q?1IzYBl+TwA+/lK2un/XTjSgfBezea6ytVRsDuFV4J8nbu8AgzPdGn2Y66pn8?=
 =?us-ascii?Q?xLwZ04LueTR2ltQaMXCZKSmP0v71jbpFwvjhyq4cIcvvRfN8bpKknYhZlUBc?=
 =?us-ascii?Q?VkTka0fO7YkhkMIvkyPT7fCmGviMGs2b2umViiTx/P6Lsgvx15jUGpcNWYaw?=
 =?us-ascii?Q?wLCSiVqaKnOxQpJFYmqkKi+xBNGTLOKouv9dFYmR+Kz4/d6DPNj1pdsxsGjG?=
 =?us-ascii?Q?7g1Xo3eGbekMVJfQoBCdfPsEgONtA0gchP4e6STj5D/YG4lFAe6FfUW4C0nM?=
 =?us-ascii?Q?eV1hCxA7QoUWXs4X4ug42+HX3AvUUKFDp2NDLsJQJVrbWyZgPaIja0Ss6iw2?=
 =?us-ascii?Q?wGo8fcCvKUvU+TG84K6FSnoJ71ItdV8PCYfGjX+kjhJ9LTB2cSQI8EZn5xqt?=
 =?us-ascii?Q?ZU8+bC84HyKU0b3aHRn+e88Hdj0rl2/o3VgNbHRHER+NSxE7ljXt358hUD3+?=
 =?us-ascii?Q?Zwql9RqiT7GvhoLOrvvGwp5nLi7FFLkNbfx0uJ3RJqTSdW/Z16glT2chPsJK?=
 =?us-ascii?Q?2sM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I7wNtkM3dnfgisJhrGm9TIQPfBOZ1ts+qUi0oYNLKe3BV3JCO82EkG8Xi7RD?=
 =?us-ascii?Q?X4qwynHr1cZ7J1+pShFLHV3P3J2VG+r1Gy02CqVrlKs5chXObRnvG561/Y7A?=
 =?us-ascii?Q?pQORPz9uMeb8qeSvGoYytjB1zzDortShx6ZmfAtwAfma6q/nFjeCRX+4TEcL?=
 =?us-ascii?Q?d7F5DBYmYkAzv7QM7bnNqjNsyY+Et87FQ7Sip9sE3vC8S6ZCnQBL7ZlLMdes?=
 =?us-ascii?Q?Xd8LI8llE4VjeKfIwsdpcIpzAbsEjysHNC7YVXfZ7BrFe8QupqGMzhkb4pFw?=
 =?us-ascii?Q?mibKMSHcg0EcbyM6kmCAEhd5MdYMV0Z4977O9ZDRfxx9whjdYXPItn1mRRNw?=
 =?us-ascii?Q?cuhETWjkw9tX3ltFedrGETirCPG04u6tqnjv3tY/oGDCPTiaHQFF1+34u/cs?=
 =?us-ascii?Q?z+ZfSHmAPTvy6aRi7JTBtbAOPcZMhcQmVhze6AC+vAZPz6eJPHL3eZ1vJkLU?=
 =?us-ascii?Q?4xU7CijhemP7QjzGLbOmYXEJbeGWsxe3Y4S/5U9cyLzioxg1XBL2pMXXfh8S?=
 =?us-ascii?Q?GK/53GKNhcH7y0h3KwP/wnmOS8DzWGHJGS/8kz9Ou6Df7/Vw00LhMlZAtfwA?=
 =?us-ascii?Q?fomVN6KVV3FabetYhixxPj0cebvAcbCu2vgcO8nwxsXfrPQnuoOycvG7qA2v?=
 =?us-ascii?Q?0dezP/2WQJJPhw2HAv+GEnl3hBkKMaX5CQPeTIDtybE90RLpHyJJV2x5Cp9d?=
 =?us-ascii?Q?6CVK1nSXX601BEA1dlj2ecW3eeUBBy12rAenHSV6O1SqGi/Lp+k8RnO3zZOv?=
 =?us-ascii?Q?HMLdZ9ovJkm58nd/5CVN9FXU4cevwk4n2ag/yC9but8eNt44NXr1utgCP/Qh?=
 =?us-ascii?Q?nxpoxXri/FH8zHkHFbhmBGHxoLq/DMxRqxG0HjleowSJUcX9xoKJ8fGL0zDy?=
 =?us-ascii?Q?SUrUc8g6XFyDHOFZxVqSuLkQQME0CvgSqITuzsTzn7O8GIv8yGgwZ8fQAff2?=
 =?us-ascii?Q?oy/s2+f8BVeafssX8ngCgQnb6n28W0pUglU6cl1+qDnkbnCXA+3qZyWbaJcL?=
 =?us-ascii?Q?OzzvC+TypO+ZY2fDHJnNunQT/Xruv0lQQH/gPvzB8AWNKyhg2FSvSRnnmC2D?=
 =?us-ascii?Q?KgPaxKSSV5UC5tb5lcC/LEQ3GDN98VG0FtpFjWYQ/2rC6M5lrjgrgore9qgU?=
 =?us-ascii?Q?EmPfNxYuoRO7sl8ZgDMRO12AnDTwggOGmskPi7vCprztzcC3LsMS0sVV8EGt?=
 =?us-ascii?Q?gZxkdqecaVk+sR32IyUY1DGkp2/ad2glTYoEG7mAssIiP1V1RrywtvEwnVym?=
 =?us-ascii?Q?PXin1GgWYz1ISZ5GAcKgQkRcwwwRs8iGpGgPosrXM2ZSXGdp5pv/7JIyWDma?=
 =?us-ascii?Q?f1YKookEvlVgctlvJEY+8BAXEys5sERGGmtJwhgGyptS9F5QPnRSurLnnFg6?=
 =?us-ascii?Q?MoffiRQsqUIDkkRNZ3FHy8JyEeNj2GW/azm1ZaIo9fbK27MKoWU5mK1YXAPc?=
 =?us-ascii?Q?lPB4sd8vXjH4yXPA2wZV2oNJq2ZD4Qu5nxKjPvAilBu9ahp6ZsjXg3F2t1GI?=
 =?us-ascii?Q?Ag30E640mWMiahrKDJFWpyhKyEOM/m2YlMkI8PgsJ/CoB3viC8PefLvOZe5t?=
 =?us-ascii?Q?uAHLbsHcSLVxb9cDRsfMMDqtX26oQc1quk1pzIlK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8df126-18b7-4a38-c739-08dc96b20acc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 14:04:21.6029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaPUR9dw2NnnQw5TDzQASo2hVvxTXl+j1A+JsH8RjIvePuKEsWg97n9bsesgw4AnUj2/0Zhbu0VZqOsbWheDsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6237
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df9574a57d02b265322e77fb8628d4d33641dda9
commit: f0f1033dd078339a6588b571fe1243e2a2c5e519 [7931/8719] selftests: add a test for the foreign mnt ns extensions
:::::: branch date: 16 hours ago
:::::: commit date: 2 days ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271913.5Vxny2Tc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406271913.5Vxny2Tc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   statmount_test_ns.c: In function 'handle_result':
>> statmount_test_ns.c:27:17: warning: format not a string literal and no format arguments [-Wformat-security]
      27 |                 ksft_test_result_pass(testname);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   statmount_test_ns.c:29:17: warning: format not a string literal and no format arguments [-Wformat-security]
      29 |                 ksft_test_result_fail(testname);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   statmount_test_ns.c:31:17: warning: format not a string literal and no format arguments [-Wformat-security]
      31 |                 ksft_exit_fail_msg(testname);
         |                 ^~~~~~~~~~~~~~~~~~
   statmount_test_ns.c:33:17: warning: format not a string literal and no format arguments [-Wformat-security]
      33 |                 ksft_test_result_skip(testname);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   statmount_test_ns.c: In function 'test_listmount_ns':
>> statmount_test_ns.c:322:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
     322 |                 write(child_ready_pipe[1], &nr_mounts, sizeof(nr_mounts));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> statmount_test_ns.c:323:17: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
     323 |                 read(parent_ready_pipe[0], &cval, sizeof(cval));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   statmount_test_ns.c:331:9: warning: ignoring return value of 'read' declared with attribute 'warn_unused_result' [-Wunused-result]
     331 |         read(child_ready_pipe[0], &nr_mounts, sizeof(nr_mounts));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   statmount_test_ns.c:335:9: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
     335 |         write(parent_ready_pipe[1], &pval, sizeof(pval));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +27 tools/testing/selftests/filesystems/statmount/statmount_test_ns.c

f0f1033dd07833 Josef Bacik 2024-06-24  23  
f0f1033dd07833 Josef Bacik 2024-06-24  24  static void handle_result(int ret, const char *testname)
f0f1033dd07833 Josef Bacik 2024-06-24  25  {
f0f1033dd07833 Josef Bacik 2024-06-24  26  	if (ret == NSID_PASS)
f0f1033dd07833 Josef Bacik 2024-06-24 @27  		ksft_test_result_pass(testname);
f0f1033dd07833 Josef Bacik 2024-06-24  28  	else if (ret == NSID_FAIL)
f0f1033dd07833 Josef Bacik 2024-06-24  29  		ksft_test_result_fail(testname);
f0f1033dd07833 Josef Bacik 2024-06-24  30  	else if (ret == NSID_ERROR)
f0f1033dd07833 Josef Bacik 2024-06-24  31  		ksft_exit_fail_msg(testname);
f0f1033dd07833 Josef Bacik 2024-06-24  32  	else
f0f1033dd07833 Josef Bacik 2024-06-24  33  		ksft_test_result_skip(testname);
f0f1033dd07833 Josef Bacik 2024-06-24  34  }
f0f1033dd07833 Josef Bacik 2024-06-24  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

