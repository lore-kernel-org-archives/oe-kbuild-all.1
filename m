Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C341DDF3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 04:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766033752; cv=fail; b=YxAbDuSNXnk+5OAfna/vt4cEUWqF80CefDUGjFNdYSaiDJIHlGS/K1OtUZtQFQKlBhSzVqi2U1hOvKMI5Z24x0/Co/jSUc5W7aQW8Jgw8WxcK3bFXqL9t8w8KsayQN5HSU20vZZvJAqo8fohN1y48Nrxg5qBl6w7J8RV+XRzy/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766033752; c=relaxed/simple;
	bh=93G5n00y0K6UPeeldyd1gW4fWFj0VmpuXfPmg9Tq+kk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=KRjBljh7HxkV2L+Nbq8LYp0YyJru17yuLa7ZizdJHO34Katc0Kviqr4pnMUciHuGtGvnunQjuqaQwXC9nPJQjD03rWk5C/PdcK0UOUjDCccr7xCaQL8mjej0FSCrUanJlCo9me/f9aeJgV148f8+GVGoFVGdu4MsPaX30bPEB7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sry8xj6B; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sry8xj6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766033751; x=1797569751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=93G5n00y0K6UPeeldyd1gW4fWFj0VmpuXfPmg9Tq+kk=;
  b=Sry8xj6B3MIFY9/y3ebMmcAAoN4oif3SFBtQbMBrw8Mq1LiI7GLtl19a
   uYRg5eiZpyZXp72UCMhsC/WfjHpUmyObR4SGBYES+QQbupMt+zsaETzlX
   dih7G7Rg1Vcg5UBN6hb91mtt6OmyOA3VfV5JQ1Jic9UgRln+maDZ5aC3w
   xUVxa3h1EdbAF+VZ9KtjKNJRt4iCrMXSbZ0IeIKCTvtCBq2R5WQDEK9H8
   8IIhZ09Ge5lQX7kV5OEYRI7r7eZlLjCTbqjOOA2Sq8hF7aZUky+dnxN6M
   iXI3v5/06y1Vw30/N9JmrGwGleICn3ASrlq6uj+V6ztJlPj7ik/U/tb0g
   A==;
X-CSE-ConnectionGUID: FUTOqI7OR2W2bcx2cLAVEA==
X-CSE-MsgGUID: FXN4ecbpROWScO/qH0YZ0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67873293"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67873293"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 20:55:50 -0800
X-CSE-ConnectionGUID: s56zV3AsTneL7ee9pOrhVg==
X-CSE-MsgGUID: zAjMOzWHTiC9LZda1p/x+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="197745732"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 20:55:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 20:55:49 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 20:55:49 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 20:55:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9T6+J9AuT0nL6lRnLMGWgTffN5yXzC4IlI6A3Ya0nTqRuGBoEibvwS06tsT7PND6S/tqA4eg8d6lqgcfPyIMRGeJF2FXL/xeIMDtgGtGCuoBhm1KWpaOD6xa9TNIfHx2v2vhy7gGGzvMFYWeprKxu/9M+RvzS4aAmny0fyaO9DZ7BHJHtoFlc+Oa/cGs47hhm3MM59qqHubZY9C1C7Pjlc0vhrSdeSU7J9dqObMJx/a9abQnSNdT/XLsAIJrxtALFQH/DBkdnF7YOC8Pi92HHWdmMKQgU8gNO4QMpXd9qzs4z84D2IuZyzZc3MZbNON5FVN/zRp+vJyC6Nl5o5rOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAH1YOgl7emWr3bstMk8wGQvvEOhgosLIFwyzZYEv9I=;
 b=wTVY8OMhMxlwISFyHeuGJ5xqsaQ/0W5kjpZanbRmlWwrNgJ4PCDa1xGkOMRUIpGE/DIG2C7zHzcUO6f3Oj+cjEdX2iIc9LvIUWNsw6ssFlA4HMgX9XvUKcdDbBvnw49HAk4DjtB62sBEj1cS0TtkQZd3MFwZgG5+op+jRDV+GRhOfmpuZw5J+lmGLSoZlvUDpVOnQGGjLEW4LoWBlC4sV5K/0ku1l9VBWMvssvRE9w0S+eQ75qdp511fSb6bUVY7WnECf+dGjYvnaUFxar0UIAnRwei5TGMH+ENydmIrshgylwWFiD2+u4KoGUjV7Uo0AozOWWLJizZMn/hGl0xTCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SJ0PR11MB6669.namprd11.prod.outlook.com (2603:10b6:a03:449::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 04:55:46 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 04:55:46 +0000
Date: Thu, 18 Dec 2025 12:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jlayton:kdevops 9/10] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'the'
Message-ID: <aUOJShUdffonQwB/@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SJ0PR11MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d95f806-0669-47b1-3795-08de3df1b50f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2LUwsbLpctz+3xm6cNaxxVAtKxUc2F7k+Cj36g+EaRLZKeWGgh1+UdZdgWUv?=
 =?us-ascii?Q?a3sr/OJgpZdmmz5uYIn9RRXf4zfjYFfLlq71hyfuv8UU9du4hjjovb9jXRPD?=
 =?us-ascii?Q?5JUxxnH9DuinDWrCk6vrRXQiX8ZOfMgQsqnq0PafjprPNvbdY8RmydEWlYXx?=
 =?us-ascii?Q?AbCxBXsa7pwNfxwZhI1oBAWi9hLtRfpYyD4mPWJb27jkwCj3abGIGLJxGc5r?=
 =?us-ascii?Q?4CKdvsPlwsv+8ACYElDUVFDH1Zz1xvg0CgoKNNUCsZbfwTPM93kwJMv8chaO?=
 =?us-ascii?Q?30adZqLkpboi+X+NsP/ab9xH6sXWswMOz8BCLHfRbsu+/tOzOEYjgp5NNHrz?=
 =?us-ascii?Q?hTTwFO7olhfrBXvQevvnlgdQe5a2UvkLo1BnY9abvwsHZq79EPZNKbuwkakr?=
 =?us-ascii?Q?H2zjmKlentr5mdYSVIcybG8p1rNlnPTdoVs3j/TjGt3amkRO/jelOMIbndao?=
 =?us-ascii?Q?M6U3GkjcKb66mTdbu655/eOqWWD19drVvHU9trlWCMfpih8PTCzcoOoXbuEw?=
 =?us-ascii?Q?feXMayDFKVtptdfO5AgfRyGc8x99TDKTtOv8lJqAMDz/0Uw/FR9bGpaVdE3s?=
 =?us-ascii?Q?SqoIjgTKBdlj9IfJ3ZdnambofT4reVyq/wUs+PmzskdN2cMwuMg0sXC3BJWl?=
 =?us-ascii?Q?G91yZkPOIivwIs/cw9HC5reIuz+qK9oebNfja0guZRZ0TAYtn+gLoQvZ4EG4?=
 =?us-ascii?Q?AmVKAGw49ribZRE4Cvq2uo6+B2ZuHhKk8+A0kvum1+wZzUP0Hqlf0d871QPZ?=
 =?us-ascii?Q?j/PEX6Uvbekk47keECEf09gcgR3DaAhLkNR05qFX/4/APzt3rgG6kKxRoY12?=
 =?us-ascii?Q?xNsSn9MjAMmXrfv9dKA4MYW5uMHFjsdqBG/7+kE3+sRmUGaVequvIdMcpg/2?=
 =?us-ascii?Q?386iq80ROEl6dMJy/x9Gs/HWz2/7aP5HbKzfUbE4GqpogEIfKwisDMuQRTsX?=
 =?us-ascii?Q?zEphj/KoubIwCRGrforXipkmPovbTJQrXoaGiyxJIYRr30wCn1ZUBp6YOiCt?=
 =?us-ascii?Q?NTdOvuCIJBUDTB9hyvCQqPLK2BMJhb6AIMgUW8Nsf6nblV3W/uKk+GpvPX67?=
 =?us-ascii?Q?OaG3JeszyB6DuT1+ahghsfidPaNC4NdaoxfCYwJNBkYTAla8PhWsBvrp/nJ+?=
 =?us-ascii?Q?zuL2QcGLQ9VZ4R6GMZaZn3mOoIwDZqdVtwnJ4se7LAt/rHaJ2tX/3N1ge0h6?=
 =?us-ascii?Q?x2WQRO43XiTZbeYeeJsBbDCbFOLwE04LihZtiN+sQ2t9gz5ADweNUFyYEdnv?=
 =?us-ascii?Q?pHZ1CVlsp/4fAK7Xfk7KfoTGEVpN+beZoqSuAxxkLosY+p+eQrsybXKfdNJ9?=
 =?us-ascii?Q?WKW5Be6o++0DE0KwBBDTVQ38y3oKdM13LCkf9/xHTiSC7oZThsQs+pG7lRqr?=
 =?us-ascii?Q?8xBaKzxqNuqI+nMOmjKHnDeCzg0eUm9an++xTqC9rGfcxz9FnEDexCbNKzwa?=
 =?us-ascii?Q?ma6V3P8QSPl7bTuPTkwjRYZ4EpKQU4TqE7ofcLyfR3nqxTlB63UEww=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eiG10lL9R937auBB5USLj6Z/mdoTLn+VmUYgp/CopOX0/5Jijd8sgPMDPm+h?=
 =?us-ascii?Q?0HwQt2+U2vn4F6U1MpS98jVMpkrvn0rWc2brcHXlP+9d1uNPEQWro/ui8Kv8?=
 =?us-ascii?Q?knyt4BEXX77RVoJRJWszmpMyRXkGG1/kRu54EttBCm3PA3MoJ8x2i/blY1kg?=
 =?us-ascii?Q?PiBtlnCZsrLdVPDSlzrajnNyNI5Zrk0cAw1gy4Yu+3WEHiIVUMwqNWiq3SBO?=
 =?us-ascii?Q?JEFMkRnohCpkAued5eetEMWEyBzCV/e2gjJnZDUO51yY6olsQkXMGnJDonyV?=
 =?us-ascii?Q?PUSThzCXAFvwI13tCcpAIbRZ58oYwRgJPpF2a6labKCd/EtvwPC1p5MU/u7E?=
 =?us-ascii?Q?aQjDJ1I3m4pkQ7YQy/TsepHs87yL5Bk6GIaLHyJsQ4sMGM4W6vVdr+9c7UOh?=
 =?us-ascii?Q?nafHMGHlekxhwSmu5sz8cOcLeGRckdaCqluC6fZdPalEzGiQ4tWW9sTktBbe?=
 =?us-ascii?Q?qscMj22cARG+GsnS9cP8QgGayYZHnO89+vcilPaqTF3G7oIMXRihIdiFqkOX?=
 =?us-ascii?Q?Q/vUYvIiTbcrk7VZubENCPli9XKELfCbjVEQw/TWqewmcevlfMODQuXaRh8L?=
 =?us-ascii?Q?ua5ME5Jm4U2JFyNZ11MNcvodaQQ7DSat4jhXKra/dGXAwKyCC4SPFzz+6EpS?=
 =?us-ascii?Q?wkkp8hhUPIOqT7a8ixLNsL7bKVnT0VoWNips3gQNxiHFKmolDwhHZU2p6U93?=
 =?us-ascii?Q?SLlNy9FcCzd8x0c+OiNUmtVXPB+kDWPu62c2nQxE3+h1caLFlYIiDyYb2noD?=
 =?us-ascii?Q?EJQMfv/AVCxevAHRaZif5J576m30Aq1TYF0N5G90m3CXdFWdPf+Sz19H866s?=
 =?us-ascii?Q?7OgEhQSLt2vYlC3rhR/Mty6TbfOxxjhsgqjyxwes1A6flhN2PR1IgZcKLwtW?=
 =?us-ascii?Q?cyGjBcsaM4i1I8F7A2gonnKgJo84udNrMN6KYd3S9wI1O1xoqv2Ygao1rQk3?=
 =?us-ascii?Q?tXMAGoS4o+QQWc4iggJbMzaQCIhQ6ocxfjhTMhAhbbcW+6vtv1qqOFbCHjVA?=
 =?us-ascii?Q?hxZay+DjJ3yz5xI7j4h/tH1rhprLocuW0pt0HODzJudLFrEn26QjVEr1vS2/?=
 =?us-ascii?Q?+gTesQnDb9D3wEGRUMNM6xewLWxJHyIR75/AVlVDvnOS7Pv/4wJVGv+go5wT?=
 =?us-ascii?Q?PrwIDkDDv22FrAZGOseQFf7QMtjWhNpicyD39/7WM4YwsGEz6btzXw96X5tR?=
 =?us-ascii?Q?BcM48a4fJjYRs9qi0XpP60wnSU883N7ptAQRx8Na7JOS+2L2mbC16a5peUIu?=
 =?us-ascii?Q?vTOFSkIHDCvx206rAinrufNNvc9YyiW4/UoN559LYCVV/uUBtTsxOCkdkq4V?=
 =?us-ascii?Q?52aaPZrokOICoYx4gRuMpwitCIFCJSd50Bzxq6ald4mNzEFCy8lZy+EX2Zo9?=
 =?us-ascii?Q?qyC6IZBL+NcJ2veLrLBzw6q+HE8M11EXKch4GMW9LJcoXp1AlXPN6KbOtNkP?=
 =?us-ascii?Q?nr+bh5AkpSoNyjM/8KdI7pmCs275ntXNAL5553g1V0LU/Oc9G3EDMhkv5acj?=
 =?us-ascii?Q?2fY2WbnjRrrXmkZFFtxv+uD60lxzLjfM7dvTUG44kPAv4mbXLwllKq/aZYrZ?=
 =?us-ascii?Q?hH2X6dNdzUXDNRU3NQb9IvHrhOH5VUhsoJmWQUNr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d95f806-0669-47b1-3795-08de3df1b50f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 04:55:46.8247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VPwgaq8hqDLxtzzEQl+jEGWcK88GiwWByukqkBO6QeYGjQojYz8XGH/5eKCppBenWlqDBKICV0CWlcZlhkU4bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6669
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   ada48df8b6d8bc392a31138f1084e7bc5b7caf73
commit: 0b317db0ad4b990f6351be9a17aeb0764abfce14 [9/10] nfsd: adjust number of running nfsd threads based on activity
reproduce: (https://download.01.org/0day-ci/archive/20251218/202512180551.pwsytgj2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#21: 
becomes and RQ_VICTIM so that it will exit, providing the the actual

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

