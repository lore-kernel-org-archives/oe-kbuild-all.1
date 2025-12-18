Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A00274B55
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 02:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766023494; cv=fail; b=L+2Edq8Aq7EPQjeyFemfR1UpEDjZGmkJ/mcSoT7KmUTWwIB2tJO1x8e36hPvjS01RcoTbFFRgpBG2jM9uIKLLj6SCOBRkmreAy/HtuyrgWwhzdePY6p8aiTTmeyx2qovB7GQ8yVebUhOKXEu7lODkVNHFfw1gndpTZSWPTGxCnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766023494; c=relaxed/simple;
	bh=ShugO8Ql0Ck/nubEgwUB0ciINP4acyH02c9+i32Mojw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=P3FQtXPEehwEbPVYuUabTz7BTicpN8NqfJb1BYmktyXgMlC2V84hHEugqxWTrIplGzvRv2cSDrR2ShT5qB982GNC/qYt+q54xPmGUM5Vmlea4EShHBgZ8loPJrfMavvSorkIbDqtKtQXdocVbqIdCtUZfRbmYIUVtBRv/oOWrpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=THlIMcPR; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THlIMcPR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766023492; x=1797559492;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ShugO8Ql0Ck/nubEgwUB0ciINP4acyH02c9+i32Mojw=;
  b=THlIMcPR87u4FaIPRl5vTHWldIsDnxUd64f4/QqMwBGaJS67syZP+8rE
   2Ljsxq7swVWOg263OQcR4bQK/MS7XmsbKGV+orCocJKXyDraChW/mlmmN
   QP0jPlt6SKetLmXy5ee0UFTzEdy4/HAumbcP9W5lLmKYZ9wM9uSWgg1nX
   +U9U+AXTE3rnpdhJQCNi5al2ExzcN67n53bANPRRFFh9iBkDrsioB66fL
   tVhxPbhGqsQxBY5Av7W082A5pC2p2a1pJstmFqzDhHEAKWQeqISw1N7BW
   AWukmo2TBlLymHWkj55E9UzAIry/J++vbscT3WH7V11BRUz8BAZm0Z8+p
   g==;
X-CSE-ConnectionGUID: PCXgEUzcS5OmOJZ0xq+Saw==
X-CSE-MsgGUID: oykrsXgBRASHLJLO08mRgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71831145"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="71831145"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 18:04:52 -0800
X-CSE-ConnectionGUID: 43ezrR65QO6xcmfBkR0wVA==
X-CSE-MsgGUID: XoxXnZ2ISKGRE9eBqjZBmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198936670"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 18:04:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 18:04:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 18:04:50 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 18:04:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqvA/iA2bn9iBw2+Y5oafWEXoDfhqvtb8skL8+SfOzE05Y/NemNR8rbwz+5e8Zkv7Mv7WsqiyfoQcUh1ebWkoPFoQ6zG+hMHRWzIA5tVb8om7nn9eDOlQ5VThFg7z+siok3CagXofxk0KBwb641dBeyIVlhhwPdesyPzS9ciKgQrElbay2PpZNQkiEhjoTHqsbQGVBcZECyGl+WQ5lYCc+KMU+jwhckAFu89CnqRL7w5cuvpV4ief0mSgBjD2lGVUieTMp/1EgYlUDhPmZ9LPt+O9YdKPVDZze9+byzISBhUNw8PFHNabGmshsKgZ8+ttQ3Z1PWFaPotRPUYV9xaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mc/ksItwKoSglf9erOtuWqllVvIE0BKpOeuOuwKdPgE=;
 b=xwI4QbG5CGVWwbURWKja0rLTPTJo6UcbZ5prwK4zfVqreffX0w2q5qi6Zb61CSv4B7AKfzOc4xy9z8lwtRNEpOoqzdA7Cz+LCcg1uYaf54dnRr7m+Lojn9TfONJ8b4ilr92Tsz4Ch6Cu3nHgodyW0cTuKNnDRdeq0IEDsJQmDH1zKp08MEqH1fCaNW+MbT7J9nBUw0ao4D3YCW2E05lOUfWLyEapJy9ntMWVUIL7IO4QpuCL3vnET8Yei948h1P567CgOnd0srYCDm5i/WmfePdiEhjDztT1v2WgLJT7ep5AoCv7/HcWjTH2mMDGGCbdozKUCmMn+XhbjFnr0YYl+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA2PR11MB5210.namprd11.prod.outlook.com (2603:10b6:806:fa::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 02:04:49 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::3ad:5845:3ab9:5b65%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 02:04:48 +0000
Date: Thu, 18 Dec 2025 10:04:40 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [dhowells-fs:cifs-cleanup 28/37] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'from'
Message-ID: <aUNhOKVHSV12BxFA@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA2PR11MB5210:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e069fce-934e-49b8-3a61-08de3dd9d2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jJFTY0R2PGDrkg2+nMYS1b7mAk9ykhHJum29eR/qTiuldrKB+02leI/nPyy3?=
 =?us-ascii?Q?YsGbKW9CCXQvmX12Ugnls+pMXioxIXxz1aeO7GRFp39VG4foMw+lYOnIV3I9?=
 =?us-ascii?Q?kys0OCtUq1WoYgLzAmhP5Yo6pGDLvt5EPs+uxHrXlkZaUv+eKN0fpUb/wLqe?=
 =?us-ascii?Q?dO+CjP3vcajD45PDSVE2IFufwtXjd/dL/p5NeRf0bVhk+SZ4MRPxNw8WAczB?=
 =?us-ascii?Q?fFrwlG3r+uVM+v0gBlMMPsKs+/8LGdKoghdt0+xtLKsbnwdq+PpffRiS0d2p?=
 =?us-ascii?Q?DbF5lJr+trvgIpga85bjw904hqT2QvhpKrj2DaEfsY2MHnfiv+omOkaBQibB?=
 =?us-ascii?Q?fJMT2duQ5qevGi3AEjR9NMAL6qKDsmHlDvKzBm+4JWVahnkpVUE0In1S/ERH?=
 =?us-ascii?Q?XBfDaf2ekj/tO0E2NSi0D3G9/OuqQ8gEnkuk/LAQycHnQaXNe2wo4CoezZyx?=
 =?us-ascii?Q?5QsxHhBShprJxn+682wB2Dp2Bwc965SAIzJ8f05rNX163rKB8y5Yieoz6U2V?=
 =?us-ascii?Q?S6hwUYf4I2PskC33m+zS+/C5MAAQTaZ4/8zHWKleJdcESFLjlbeBkVOpj5EK?=
 =?us-ascii?Q?6oLjEBhIR/Fjz85odtqPApXGAutD7NvHHJLj4u9mfjNMJ1KWF/Lzh6sli7Xa?=
 =?us-ascii?Q?6z+L6eFQfJfh1T86LEX2JhvS2aCkN1er9pQt5NBBfwX422oDPOwUGTEEAKZ8?=
 =?us-ascii?Q?3XyZzWRa+kRWWOLQ/hIqDszfdEi3Ed0AXzhGwJijtMhf6uQH9BUzA4grrRa+?=
 =?us-ascii?Q?fz/KzmzM6WZOF84gXJF4m9R2jSP6Rj7Z4+1d09cA0Qt3FrFLPnrVVIO0haFb?=
 =?us-ascii?Q?T0skxOtaSWj0knDnuZ6I2cyzJ/EYyR2E2nL9akmx9H2s8aIFHQ2pBrbs2raY?=
 =?us-ascii?Q?p3cRMEyRXbLG348hU8lWRiumxbV8lzLDdhcd1Na8YIjKrhtHSTPdt/yoE3aR?=
 =?us-ascii?Q?DLZt9c1bkPkOyZKOl44S9fuld9srWunsiWEqdBVNgTS5d4zwYaBwqtopi5Hi?=
 =?us-ascii?Q?SIJSfWvnyZvzg0kbsjD9voKoxhG+S+jr6RKWGtq9CGSEb6q8BncOibNtaTt4?=
 =?us-ascii?Q?Nu+yC1SxFaA7382UEg/L4s11O9Jw1o1SP9R+QRqU/pdE6azZk5PqChNfdp7y?=
 =?us-ascii?Q?IvDJuAZgxzJUBODnHvixM7T7bU8gbP+bOfCu3plVG55I/pzmXuBlyADixZRY?=
 =?us-ascii?Q?I41F+HYXHwU+3cLPo6swrKHgJunYLCgtGMZEh/i6QruBqx1uQGT3u7CfEgrk?=
 =?us-ascii?Q?t6gG+QpWgabrrjEZMqI5yZdq6HP1GGUGXqfn6nlYtUhM4dRI0tHh8o79eM+X?=
 =?us-ascii?Q?hk24buOj3CqAmKNUGWKuwSJ6keOQ22P+iKofdtUwJkfkaJUulFLY3DGWrl/I?=
 =?us-ascii?Q?9WDn+6BDIjX0ZvPp6xwoh53E3bktCcFFo2HNteel7QM/2dQJVYblfIP3/a4c?=
 =?us-ascii?Q?x4s5SsJt5zInjnQ+2U8w+3bDTSb4hvtAApKLVTRJ0Txl34E2e90vGA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?74jcCrmRPbbu1WmLR9lZiCI5sfb5SMvIBV0MOUsJ1KPvb6/jh27WPOOO2nDF?=
 =?us-ascii?Q?JEQI8RxSV9NnWvbzNJuQROooACzd/4xqxvyW31g0PdcCcZh60WhjghzaHzkA?=
 =?us-ascii?Q?maiKCIerfSHJwbN4LKPdNhjcdYEiK3Gszqe1I3kj/fNkoJnWQ14/nW7Eqn6J?=
 =?us-ascii?Q?QoSfznDteTe/8iOTfyX6sqBqDs6LZG4YUhVZP2uEtSOG1ovQAXEdZi4qLOd/?=
 =?us-ascii?Q?NWmOKZtjkplJFlY0xgPytTI2ukhY6OJJnN7tyfDyvg7WKGRpN98EHoIvAQOF?=
 =?us-ascii?Q?zOJcedVDxnuVw+i7CznHNAn28vc9cIOQLzNMZPMzAVHGb67x2kBhrV2Ry4WS?=
 =?us-ascii?Q?QNBZtqsYDZ/nz+3BlgxvGEteL34Vb8Nycl1jbNStIBzNVHyHtqCvdooIzE07?=
 =?us-ascii?Q?qX7HzP+4AerzUZyTs1rYNJ3fg3NElWDYWmSpol7ZJcyrOISZye/U0GxWw5vG?=
 =?us-ascii?Q?kYqsgTnG0fBmjmYrC2RIlLLbRrAWCmsgdtRJ4psZm3TKOVKYm0r9g+0aZZ8v?=
 =?us-ascii?Q?6qTeWp3UCFdATCO6IVS9CVoiJkI7MTz5zjdIhzMHlLgkgb/bwQ+0Uly3If4G?=
 =?us-ascii?Q?2zCk9cWki57DAayywWaYrizmws4FnNo+8JrLGsiRM8YoAAT6sNP/KCM6FzEY?=
 =?us-ascii?Q?lRdTWTwoS8p1XQBTcjzotN7X3hGWebOXOn8QMYXMmUAKdQthjNMf23wWApR4?=
 =?us-ascii?Q?2tZIxcoWXwxks7ezWRf7KCyh+epnUPWnBJ8qxF09+4/08DmalXGJf+dEbGrk?=
 =?us-ascii?Q?drwH20+2UyWTTPpmuhyPLLaxScc7WZSGvvreMBtFsxYzFTib3t4MXEMBQSsR?=
 =?us-ascii?Q?B5KlD9BumEoylatphtc1Mye6X7YuVtzpMzK976BxhX7BWSmu+HarWDt10bqo?=
 =?us-ascii?Q?FOgJXfJyCY5dJOeJzbX//ZJl18MA4a4DFZKPHE7mGgD0boMeiiBC1pOcewgj?=
 =?us-ascii?Q?j4LPWJCKaMR/Z0MZQGE0E2HcgXeYySlpCxUBZMK4yOAmLo59xQIY9doLSGYL?=
 =?us-ascii?Q?BqH+jCVLkfLpCQVjzCo1LT6AmOHpxqz5GKg1C9J/AygzDMwbWp1GTPFgJuyG?=
 =?us-ascii?Q?R8rgS+UTi+W/kD+jq27Wl0SOnkahPdIDNVdh8Rbprov2vQr1qUTDEgBjhYHF?=
 =?us-ascii?Q?eJ3mCWPiqXdo4LJ2xHMlDfTz0V09hSNtQNfolntxreNDg2Rci9ESh9vGROaR?=
 =?us-ascii?Q?rTH4zHYZGlpNcj476KgNCg3VVIs1lgWYERwxpe7KPop2cTQDCSl5cHQT65ZS?=
 =?us-ascii?Q?nQj1wyS0LSMIO4RzfEnl7+n8/JJgB5YFUX3zQ8yZjSlo+oc2AiymQmi98x5e?=
 =?us-ascii?Q?amFHCW6twtCWAaP4Eief1gM4ncCON6mWOdgK4gT7ZNG878QRRSXyhAAeLkNQ?=
 =?us-ascii?Q?FWsuuYeqVl1XqiyNM4kKR0EZqiX5fxDW09Zr5Gcdk7CfzuUPAGAWzgchfQem?=
 =?us-ascii?Q?0hGeGfe0XSFbEVDHuzvCLU85MRXOezpyPJlyAj4SYH327cxLJcmBMvdxDCni?=
 =?us-ascii?Q?wR0kEf/njCjWuGOivCWppcfdUrHxROBvz/cCiETTpgRdBCPiS0ZTBE+3I0JS?=
 =?us-ascii?Q?LDuBjwQDmr8j9q4KqyJS5/l5D8Y7OvYnIZ8pfQ0hpjJNsmEF0Y8j0ANw1IU3?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e069fce-934e-49b8-3a61-08de3dd9d2bc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 02:04:48.8087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dU4sM8rfgBCSKtYBB234sIEpNOVINZUill6V7584xVKNHMMGGhAWLLb4TzokBnMHaEpwRQuiqZp1LicfixcsnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5210
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-cleanup
head:   b85103543e0f050c63f5bdace9c2cef1b53c6e1f
commit: fcbcc65031335d36c8a0f4c5ca73f0e6c0279e70 [28/37] cifs: SMB1 split: Don't return smb_hdr from cifs_{,small_}buf_get()
reproduce: (https://download.01.org/0day-ci/archive/20251218/202512180203.QfGbvGm9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'from'
#7: 
Return void* rather than struct smb_hdr* from from cifs_buf_get() and

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

