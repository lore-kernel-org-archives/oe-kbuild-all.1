Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FF21642B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jul 2024 08:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720858547; cv=fail; b=t4pY8AsJLY1Q+7TY2AiOIFQofXYiFgicNXnnwghiNQNk2gfCQQZwemYO7SubaZ43ogLaET5Lh5SaB/7SfUOP75T5Swb7WQ8466RhI5sJayWp10i8P5MvqDWzyhIYIoLnXOKB7B5wvB+T4OtbjhenBb1ijcTJLcpohgNDkMBOJ0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720858547; c=relaxed/simple;
	bh=l6hr67NuFb5VqsB8IKvyDwQcQjE/0kjur8Nu1ApawGM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=b9rz2WY3xY85zG3wzVne+f5qKgyeElejAQ3dHNM9WxsoZ4gvEGTS8CPizW9nT5Ntebhd53q8q/TEDkTsXjKoF16EBMZZP6pjoycSEd2hCqzHCHm1PrR0jF8GO6yhSTXWoSiScMb1nZiFCfvTGlw+8SxZ/7PKCW4mXmiEu3pmBEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4Vl1ADK; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4Vl1ADK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720858545; x=1752394545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l6hr67NuFb5VqsB8IKvyDwQcQjE/0kjur8Nu1ApawGM=;
  b=j4Vl1ADK9E9drSVacN/tQZK94HSd01bcHZxYHzJI/zRfqnFlNbyf3eaG
   t1K1fYzc/Y4mGhn1lkbEKYZWOrX2gFze8exk7j+I1r7b7XVehDzl9b1Wl
   I5wfFIuDh+wDR/eMeRlvVdOAXTV7if7kJCSHMhx8dWHqbDmPz7r9q7O27
   5vd34Ut2r7bJYXJ0TgLzEcQgswmWPe6n5wgwqzTWEkeOkGaJDbhzvSO+O
   2Bybwj8mKKLCUwCE1Opt+KzMhbBxbKqJWb2pHBvy8Ex1xXx/dUEhk1KP0
   10p4F+foTBiRDTj+sfHhXHgwAjWTdfVvFbjwf/xAVVS5JxJPuD7WyuQ7A
   g==;
X-CSE-ConnectionGUID: 37d9ekkjSWOBta4VjlYGcw==
X-CSE-MsgGUID: HG1BAq1iSgq6EqF98m9JOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18174392"
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="18174392"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2024 01:15:44 -0700
X-CSE-ConnectionGUID: noDgVj/vTBWAlsFuIDV7cw==
X-CSE-MsgGUID: 3GqsVOoYQ9Co7qvL3mdC7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,205,1716274800"; 
   d="scan'208";a="53423611"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jul 2024 01:15:44 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 13 Jul 2024 01:15:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 13 Jul 2024 01:15:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 13 Jul 2024 01:15:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 13 Jul 2024 01:15:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQ9gWOHydzaSawxOzw8C+PpEeXnMNRNxTBFIUTwC+PfXUDtWlE2chJRcaEPlpkiA6N5E1ZxmXhu5FaNW7AxcXIN9TMk6Tm5yNdOAzskfYwpbVpf2jvImvDfCZB84q4tD+s/8nUmQ+7PQ9Z8qhcTE6Rz8mH0QLl4BQ9gRmjZkG9sNkai1w/hjdy5syd4yR2esGewxLuY72BQ9krQWb3mCO5nGqKOar2bxGuoBh4nSiNBvaJwbr4ait7Iz7jkaMliZrhTKOGBGY918lVNWczhEvSDkMtBGxXEUJWse5B4cN+bXFktT0g4sauo7vHP47dYQysCieAPRCJ+3rSjVYrCcLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BM+Jx3iKjNo19Hylav48mJmM8S+vMj6VCjW+s2Msxoo=;
 b=LhrVjYPBdE73olq5JCI6UNpkGtNCMXrv5MSTTMQZ7xi/F1aWHWnUhmi/+Us37JZGtE1QaVt6u7TOoZ1Hz3FWgnEOKyIe8RoJ3MrS0hC73VviMPM8wbPXdp18nqkxJbIRnDJZKHR0oCRM3wUY8/EXiQ60f0zQRk1tpQ2gl+vwjwHeXN9FaaNhym7Yo5NY0MctzSKhH61Y60kBgowxLq2er22IFJQ2m9cH8dntl26EOfjqJV2FG0NAR/f25tYu3SsnULcaWY3lVU4XZuSpsS/E8+z9nYzaQ+TKQRPsMzTN74CK7lQtnria0BlDI0dTYy5XW6oB/8aOmUS42MNdtaGd7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 MW3PR11MB4634.namprd11.prod.outlook.com (2603:10b6:303:54::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.23; Sat, 13 Jul 2024 08:15:41 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7762.020; Sat, 13 Jul 2024
 08:15:41 +0000
Date: Sat, 13 Jul 2024 16:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: KP Singh <kpsingh@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Paul Moore <paul@paul-moore.com>, "Casey
 Schaufler" <casey@schaufler-ca.com>, Kees Cook <keescook@chromium.org>
Subject: [linuxsecuritymodule:dev-staging 11/11] include/linux/lsm_hooks.h:
 linux/jump_label.h is included more than once.
Message-ID: <ZpI3oi+XKDkqU0Nb@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|MW3PR11MB4634:EE_
X-MS-Office365-Filtering-Correlation-Id: fb50815c-0870-42b2-125b-08dca313fc35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cBWIOADqUeq3c3SquBXIO7PWiRr+GxdJxOp55gj92wjLwMnRZPdDbxpMUtHt?=
 =?us-ascii?Q?EI8GY6Not2dhTwT8LmLQBI6Ow6qBMzRiVzLoPjEb4LLijiMR2hrUiZ3cOtzv?=
 =?us-ascii?Q?hhvT/A450pHUjQ46S8x2bz4dIrA2fpG7U0viKASpnWizJbMyZsXrVjUlIOQL?=
 =?us-ascii?Q?OXpUh0ADumEsh1HtdZqj1qIaGAKpvqr8GzfHHyj0xAgl+bXPSQxV2eb09+2+?=
 =?us-ascii?Q?mgyvyfqFcBHrvJ5uo2Z7/eB2YDD6NsdGMk8HO5HR2HEsUk1RhoPuUdlFzWPv?=
 =?us-ascii?Q?pRJRbw5AJJWcchmJkSmBH0ODIDh2N11EvrLuyAzF9zieqdHvrSSN6gMp1X5P?=
 =?us-ascii?Q?48Yo6RbXLnUTC5KCed5TP5DicFTt5wzRj15JlNuzlwu/sPlUJ5hyuWs5YuTz?=
 =?us-ascii?Q?2D3k7OosKrSSdqLrjG0vhuaaQK8h9Cz15PKgv52/yss8WjiqwcYEMMpPcspB?=
 =?us-ascii?Q?DuT7bMwwCtvU7b7DcXBkaptSxa+2eB0oRIAjfcJJCeX9sFP9ZUkCHTtmBhKH?=
 =?us-ascii?Q?SjVuPCRFQr0Ha3pTOjsoeOFO+fuUZWS0FeruCGVtFi+oz7fHuBoQzD7xUsd8?=
 =?us-ascii?Q?lqhxo6xA6zylcDA1PwfJ9EWWnXjn6P+lRY82kPgJfaxaMWQQDRdAHdUORsc/?=
 =?us-ascii?Q?EVwiyUTexWbHrLv4E9cNjCEFw4koq3e+ITOngJgN8eS6yEaeQHCS2LtWlWtC?=
 =?us-ascii?Q?jibOj1o8nZ0SN8jhi/Ze1sI4vmP6vuxgBq9F+i/IwI505mDvUrPgupo+x2+5?=
 =?us-ascii?Q?orpalSjhtnwCrTnahnF47seyXmbF0TXdxP+wyRPGRkIlZy3AeZTfrfMSo+kE?=
 =?us-ascii?Q?pDhaFWU8FH0y8a0nazysuoWo4zGXc38dAIP2bjpqHefuvZyzTsjOF4GrQAvA?=
 =?us-ascii?Q?iQwe/OJCxEl9Bao1SYtCXAajJjDxrTEGkHySMgP8s55lf/UfXEBipX82wKI8?=
 =?us-ascii?Q?90rFAsZC/NC0A75zYaTGqTaJKT1T+q9rIiDKnNlxB1P0aQoOVXhtMO+GNz2M?=
 =?us-ascii?Q?lWWmup1l0XSItRLjUdJ6aNW0HaztZtBCnLejPiheIo8435EPS6/HBMs7SZCF?=
 =?us-ascii?Q?J1PCXRKN67FVQ54h3Q2snfxpG7mkd8voTodlxfP+QJWjan0aryPPNOhTA/Yn?=
 =?us-ascii?Q?D9rlv4WDKIfKGG5AG6/+7Q8l5JMTA3HEoZHKrnoPgzgjNz1NKIAiTIYfH5lQ?=
 =?us-ascii?Q?Erkwx7jStFOQg5v3nuJ8LrYUrLGu46nPewb0/+77jU12cdnqgqhA1B/lbU9y?=
 =?us-ascii?Q?ZzyPXgaqmSANj+oYZCCM0+fDI8gtVYzm/QYZUUMVPz02YHNtDJEK2vnnwB4F?=
 =?us-ascii?Q?tsc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rsRoYdY1ib+gzjN937YUuUY/JdApERYsjpERVN5TW7yEVbIDNoz0d6Q/ZT6+?=
 =?us-ascii?Q?4eicndf1op3XYg8nrwY6iCpiQZNzYxDQ4X05JMoq/E0cA1AGN8W1PReaLaVA?=
 =?us-ascii?Q?EVraRC0JitcKNnX3Ht5gdfWnbfsme2AaUYeAk0YzNm9mvN3+/D1SCCKjJyak?=
 =?us-ascii?Q?qztEKYss03/NcmWw+E2jfk+Y1vcf6Ak6w5GWGv5GT/fp6pdQW/Eox5LsHaNR?=
 =?us-ascii?Q?Em4gd9E9E8/GsBKH5VNNqxlTJfVDYGADJotvGEwyRiatSGxCTwNwN1xGPwtO?=
 =?us-ascii?Q?0Qjenqv1/MI/+d51m8EC5knbjO3NmK5hz6rBjsTXCCIwCEuBTUvQE600HvDd?=
 =?us-ascii?Q?4om+cTh2BKD+Q4aAFnuifwiS+0JHPQXxCwIqseZHQJz7trWsoR2HD8ux+iTX?=
 =?us-ascii?Q?2LT4JoQ7CpKp6tOWvjyTOpI1Ohwj2L9z7pbESUPCBOmWnDJeppadUsT4XGXB?=
 =?us-ascii?Q?ayfXBSFi5GVv47GZW63MhsoQf87QXbSCsqK6pmAVUXw5KPCKHhvu+w+jdZFx?=
 =?us-ascii?Q?XXZYqiFLs3l4IudmXnj6ZX1GKsd/wldaE09pwpooSMkt1datShWG84F08wQU?=
 =?us-ascii?Q?b53Q3ArPxBschE4E8d9tpshp6VGN2LwdAF5PSyp/5PXelfMSqiXDsA7orQ4B?=
 =?us-ascii?Q?13ujF9Mtige3gm8IOEowJgcKWU+P6h2PC6tDOawkiRDn6TViFRmATF4lVXXQ?=
 =?us-ascii?Q?58EenpKNvK7jAUgrIImtqL2qsdMAvu/YI/Y+8KZTHF89T2Y8VWom6+JCt37B?=
 =?us-ascii?Q?9BIz8bBgcl5Pmmi77wIunAkkKLjDaF1yPMJ/ugrHV37wrzviOtm00nR1V3Fs?=
 =?us-ascii?Q?KiJI98dIAuLgcR5SaUfjwB6yVv1BnQEsd/p9we29R2p+jRj6UN/3kXdS1ecQ?=
 =?us-ascii?Q?WMwvOQ8vDdOCK2F9f0o02clpf5ovjOaGezLB/ymd6WB14OQim1sVAMOJW/MZ?=
 =?us-ascii?Q?mJ8Sy2mkkgIsH3SPDIRmNUmHU6z3JpX8gc9f0w9X3Ik6mNpYDrgfDDTkIBPe?=
 =?us-ascii?Q?1HPdvtEN9CCJpdfOUYsH6VKkrtpaooDwyNvsZWe3LlWdDOKgf34PrXFpqgU1?=
 =?us-ascii?Q?36QRcK/5LVRFmiRdhnoBnWWq2OHXWKqlGS/3HSmGL1uxr7l4FoRyMfMINX5i?=
 =?us-ascii?Q?eqjrrVW1QcouQPbstesLixxYZsPfrQnxhu7qCdpVmttbAefL1G+BPPMyubaX?=
 =?us-ascii?Q?ZICa9mteus/Lix8I95+7qrkhBl/Y7QrHH2DvM4Gg9eSddXJubvaRekxQ/4Bg?=
 =?us-ascii?Q?2Zs43L+Ldg++sFKJ+UnmGq7hmZRTu9sl+RE6gQExDTwX4KcyjUaW1CW4PYdz?=
 =?us-ascii?Q?yUhH+o4edj3B4b4+lJ3qOQ/KxzwmZnYxJZ4s8u8exg9w9EYzQszSpPvlhbxp?=
 =?us-ascii?Q?q8yXdzmk2gkym6Ydrk0oYVg3+fMGyHzqhmeAsulRu7330IV4UzhmYPDymYOT?=
 =?us-ascii?Q?IViPPrTBjaH6WBucqxDr66nMNzRMJtu1NIiX5r+gn7JeWavY/vQ0NweP7hZU?=
 =?us-ascii?Q?AR2iXZuKtS31/zAPK1ktdDpVHstsWrX5D8NTMSdC+UmnrNrEmOZGINun8D7g?=
 =?us-ascii?Q?2U0A270l2hO/98iSqxmpBVV7XuuXAUYTjLv4G1tfAzkJrKmTwRla8s0oW7M5?=
 =?us-ascii?Q?XQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb50815c-0870-42b2-125b-08dca313fc35
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2024 08:15:41.5784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sG4mAfzPejszRdPc1uWp731LrfZzCxmtt7SyCqGE2jknkIFTH0TrBjZ3MxUeRJlUK7Vlpwx6irHopNpR9dN8Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4634
X-OriginatorOrg: intel.com

tree:   https://github.com/LinuxSecurityModule/kernel dev-staging
head:   fe232b5ad921472638f2034c93b15cf3940fa3cf
commit: fe232b5ad921472638f2034c93b15cf3940fa3cf [11/11] lsm: replace indirect LSM hook calls with static calls
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407122041.NOQqOcs5-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/lsm_hooks.h: linux/jump_label.h is included more than once.
>> include/linux/lsm_hooks.h: linux/static_call.h is included more than once.

vim +35 include/linux/lsm_hooks.h

    27	
    28	#include <uapi/linux/lsm.h>
    29	#include <linux/security.h>
    30	#include <linux/init.h>
    31	#include <linux/rculist.h>
    32	#include <linux/xattr.h>
    33	#include <linux/static_call.h>
    34	#include <linux/unroll.h>
  > 35	#include <linux/jump_label.h>
    36	#include <linux/lsm_count.h>
    37	#include <linux/static_call.h>
  > 38	#include <linux/jump_label.h>
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

