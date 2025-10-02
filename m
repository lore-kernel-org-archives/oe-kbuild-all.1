Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF4534BA2B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Oct 2025 13:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759412832; cv=fail; b=BixYxBLgvdmu2eksXuHku/KutTDo/GuOb25DFIHaBNgCg+IqSD1BWkI2lXfqgPFEFoWJLyzX8N9zP226+490RjfN/z0qomgbFsWO44ONsnO83tu4O3D38idU12hFbip2cKduo5wbHjTehnk45RWt3aVZyJVFpd+gn/K/KZwcYQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759412832; c=relaxed/simple;
	bh=8NBRBNXADAm1PPqelyU96tNp2N9i66xOmbHUFpt3uBg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hw/XquM2yN6OHeXkVV7rTRbwenR2MSILw29tiKWOrQYVYPrw1C40I6KCxdYlw0ykRIGSx8uQYa5a5uFa7SJPKr261y/il4oG3trOs9yUOkDxg77kSEcakslDDUcBKBebt8MZkayHnUjNu44WjjJ6TaDXX0vlny+UJ7NJr7LMC3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAgUoSkP; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAgUoSkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759412831; x=1790948831;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=8NBRBNXADAm1PPqelyU96tNp2N9i66xOmbHUFpt3uBg=;
  b=AAgUoSkPEI4pX2Jteia4JeQX1tLMGibIM/kpqBAQVMDRs9iU+IuLgQZj
   Mz7RENYHxFWlb6/8Gzdv0bfG449E2bPtJ7p7YL24gjG65+6Zu0acTpb0C
   kY+Fi2psY1TD5l5/HW0BXPqs7I50jSU/lP0G1CRKEt5V9Gc2V/rGGBUww
   mNuooZBUJmJF0kUFbWAPfHoc82YuX/q5+xnqeoohhumjx7tfMRHYajesu
   Drj14ydRtah2y1RZndcufQiFSAt2ltiFqiFa2ixAb/QtEnOCfsnzBVjmU
   5OYJI+sXrK34Npgw3gDcvnhBxMVje184NtAFmxpmnoZzZei6T4N3WLklN
   A==;
X-CSE-ConnectionGUID: SFcj60LzRWqUvyrwa1hhAA==
X-CSE-MsgGUID: fgWmT6WcQ825XN5ma4tIvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65519196"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65519196"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 06:47:11 -0700
X-CSE-ConnectionGUID: SL6ARnQKRj64YyB1ZdCzxg==
X-CSE-MsgGUID: bj2fo3XOSQeGt5D0aol7OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; 
   d="scan'208";a="209998977"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 06:47:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 06:47:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 06:47:09 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 06:47:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MUUF7o+p1sWyWzIvC0bIz1vnpcmK63YZ9UKtc238E5TSftFhY7+5d3X12SWU4QFGKO4AjqBeYr2ygXi+PgEzWnDEBRg/+do4NaRe6dtLQachfT+M4qt/d5Nj75u5Hxvujq5t3C/OqZ17VstnwPcyu58NzaBv7A7r11y6/0R0M5X1CQzPCTmqiZ2+4d+O6hDXIALOdpQU/G4kVQqAMNsUejWHqYaEoDwllFwZpXu9eZHEKc6HSJeAkwoKHun966ZlQp2Q02/Q2fQvK1vwqi1v59JpdEz0Pxd1bMU4sGnRrYiV6RkAZsnqisIz9BfYrq5hJ3DOc92TSc4mPZRls1iW3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBKnTn1sSCrvmE4LY/ys4UFCnU/r4uhKfOSTXd6wy0M=;
 b=lCruVhBty4YilJ71uIV0tdJddo8vamPDRqa1mtjfiSfjSvR9ZdkTfLIIPKfSLlV0P/sxKM92gE4v1cqVwphB2GyZdKs2KjRZEStWDdsT1ElSqy217BPoKXnkwQtBsT5p+uQgwWzQu3S4QAGQCIIp3NjpmvNFLydl3cCbCt/8MXs6QE+DcHqQTqmq5lH807sDG3wYsHy+vDgp7ul3q6u4UjL1SrRKofmLye/lySerbfwNdm3E7/lUSMzRkfoXpw9VsYoJ3YD1UCpe+c/USO8eNQWrZzpj84srZn5uY8ZRo9FPIFIgeLGLgp69QucrhsyJf4XG/p159CsHx53ciPsJ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by SA1PR11MB8256.namprd11.prod.outlook.com (2603:10b6:806:253::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Thu, 2 Oct
 2025 13:47:07 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 13:47:06 +0000
Date: Thu, 2 Oct 2025 21:46:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sathvika Vasireddy <sv@linux.ibm.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH v2 1/3] objtool/powerpc: Enhance objtool to fixup
 alternate feature relative addresses
Message-ID: <aN6CU1mohBK5i/ij@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250929080456.26538-2-sv@linux.ibm.com>
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|SA1PR11MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 8023ca8a-801a-4cb5-0c28-08de01ba2d09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c3OYNMiNSAwZK2AcHGj9ka6tOW9gS/nToXv7uH4FKEqCFdWrDhu/qBhW5qkQ?=
 =?us-ascii?Q?HzbMDcrbYLs75V42QZxQ7kJB0vmVYVx8Oa4n4Bn0bDdRVJE0ZxCEtTGCZZT4?=
 =?us-ascii?Q?ma1ooatBkrz+slX6qqdw3u0Fh6Q5+T/hE2NI7ecv7OFLZ2lRVUuMzXs6t3Ei?=
 =?us-ascii?Q?ShYKYU9xzSzX7lLIC3CHk3SGvvsrSNoPu0LIX5m6eTqIYNfzqv3v+86ZdIV3?=
 =?us-ascii?Q?9f4cD9qC67lPiFV8/7LbsDIi7G9ejJOlLqSwZZMeIJRcpVe/RThoVJ89Ly63?=
 =?us-ascii?Q?USpZtxXJPWwqmIS+zKYGQxcw12RhfVBmkMusrwxqH7vI0YF8U8MDg9mLvSpS?=
 =?us-ascii?Q?Zhd3TXlNxyPa1QunvjQJvsdS9/MzvGm2IWsPaCLKZaJNNK05o4xhMYshcI9q?=
 =?us-ascii?Q?xRDmyAT2L1dnVBWiIkczY2Gp+CdyIkUY0TqTHRneoBw02tjNfYpxJYVAdog6?=
 =?us-ascii?Q?2lPm62MUnB6SN7R7/5sIE/m1aU6fHL1xc6JlEsnSk6RxORBqeyYzHCMgLLAB?=
 =?us-ascii?Q?hSYXGZjHGQGZwPl7t0It5dniYmV43r4pZjD56rLQEaLegAhoQiaMube0Pu48?=
 =?us-ascii?Q?CiOOsxvVrNfRvmcKrRvARQQDFJ2wkVJDt/BPQICng/rQuxOuI/YcgNGWp7uq?=
 =?us-ascii?Q?ZBWK2VaVPsoqL9LVzImqZjOYQYZeBv09HQWMWHYFEGbVSqX2mJ+gB+2AnXAH?=
 =?us-ascii?Q?4FbeuHElfSTrX4+cgQBOlren4zyC9y3AXO274gK7lZQgRQLaY/OHtDRE1TTp?=
 =?us-ascii?Q?27fwRJL8YYmsHV/nmUJKPi7CjuicVeH1V5mMYs3qpHXuTXxfXkujw5MTRFfg?=
 =?us-ascii?Q?qBIVsc6Tm2nK5grQPedRDxuhTTC/Y+cAYAqWQr1bLUV6tkJSmPcTr/NSGzfT?=
 =?us-ascii?Q?fcVJidTfGBqwP3M/WhVjcsM2x0yoX6t5B0tNmuJ/2nOl4UOjBCthD2DV69+M?=
 =?us-ascii?Q?+UCBmfGVOPWYrET3KuSAeEXsAyr6O+n+1XAq9FSSIDhYADZ7l4tvPhJHozpq?=
 =?us-ascii?Q?fdqiaI4aLMMgr15KxVRa0D1Hc+7ofj9fsMseveg4clZH/ipLUReSfX7Eio5e?=
 =?us-ascii?Q?5++1fpoG5S7Uige5WIC7j2JKfriGnWPABpDJlQaEwKYb3NN+84hXhhUJqnI0?=
 =?us-ascii?Q?PfESruua8Cu/K9ac4SoJY1jXE7njG8OOz9Sb1bMFyap+QNNksX5UuPU6yfxf?=
 =?us-ascii?Q?SUbyvPZuJttZvuEay0xHycJJNLLrpT5KRDDg60aCiBDpe9i8Kutc3/8Ooo8D?=
 =?us-ascii?Q?aIczN0Ctd4deS0Q4nkpzQ0yy7eRR06HOLrFq9AhMMEB2IN35rg1Hm48NcX5K?=
 =?us-ascii?Q?kPXqn5KRl1M47Lv1QxQmgSNiOWjo8ICk0B5lAaDMFmbwhRfZnIOt/56Nd/Ro?=
 =?us-ascii?Q?3tznc04V631jwrT4pfQuLTfdUCN34rtBMRKuw8hBC1G8242z7g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hcA9UKr1Ntxyiu4jajFEvRNA/vkdGy6o1OovElo8CWA5w16SfT/uYDCxSVfb?=
 =?us-ascii?Q?2cAq39YW9R8aA9tl4YKL1U4AwNP1mcy7miRxEGoIt2oUhaHVBHfPfkhfR9sp?=
 =?us-ascii?Q?EnJRYNjFP3QHhGenHb6EXj+PhropV9HB9j3HHYlCe3FYbO/pKFGq4ef+LBBV?=
 =?us-ascii?Q?9Mlq/4Qwbq998bi7gRNGZnG7STn0dGuld4TR46N9q6l/X6qpD9rYrJDyQkHB?=
 =?us-ascii?Q?h3zHDz13KvvnecLc7objjCYF3+21KbqhRb7tA7X4aQ/V4Wk+QPC2wXDTFqpk?=
 =?us-ascii?Q?yxqvAIvdteTCJVL30MFLQRD56krucqGa/X4p29eWQNQqgLVz8QKeeVTbGuKQ?=
 =?us-ascii?Q?Yr6x8KTpftzNrWOC0X4Afxv9O4rgcpt4jbzHzqG4i3qib5wTc/XgyNsGGj5u?=
 =?us-ascii?Q?a/bq5Q1pB4S02CDMbsgcEt+GUCW8VX0/2yjW9+Ima7MqJRreExFbkwevXopy?=
 =?us-ascii?Q?f5XEiI9wh2OjJupZF5zb1ywTx6zMeB4LTchsnlvkb51wHUh4Aklp+EGEqTDE?=
 =?us-ascii?Q?oq+xeyF/f8ucjygmZLbgJ1JxBxzfGxqHmZxUNqzC6SRsIGGveV1GmrVYnqEE?=
 =?us-ascii?Q?0/ygVd0J8F0/wCyUnPtauYKidbqPVj6HB/rsq8ueZZhW33ZnW4Uf7H4w4gyg?=
 =?us-ascii?Q?I2AFa1UTEzekkxpyhmRjAjrB3sN4XQfoyx/E5aSGczxxPFxaU6iSj8CnnXO9?=
 =?us-ascii?Q?kYqH2YmgETrwIvtcN9cIwlTdW1LbaGz8hNzy2tqp/55Xf3TEC7kOKxNbRCjz?=
 =?us-ascii?Q?HkDJSEYNtFgqFzdltepznVuiR9PwS0+PP7FXPNZ7xUSkfjpeaJgJbjbYc5KC?=
 =?us-ascii?Q?d+wdyHNnhXpL9be8nIA5g3MmEIWtwAvTx5c5JbQuU7vPF5XP62zVhNn7/a61?=
 =?us-ascii?Q?KkF43mYqgPaZ9LYiMNSPCRYNXpvnHEX+fC0Sy9xbe4VakBRZCT8YXzJWaane?=
 =?us-ascii?Q?kxQVYrWbqFmlol5ssfM4U+pROXyRb9J3/Z8xHaNcOLShMQ7EnZ93ACLpOge7?=
 =?us-ascii?Q?MGE539Qj3RxuHYI3JabM0uv+9pkYt6CesNXTbY/xmlkkNd5HHjz0YRj+9swV?=
 =?us-ascii?Q?xhMxDQXE9jnM7x+rJm/81YSBTvwosGzGkxiny1aJobsHzEUmbM766bQKkLFp?=
 =?us-ascii?Q?ySjhndbRlJy3iYENVgl3biYf8yNHCUCZa29Kpv+Cf6GWNlhJ3x0n4d5ma+Wd?=
 =?us-ascii?Q?ATnPOY1JQMrdSjARPAbrQU2HCtLSGU2xezgJaax3J4HIDHydzmIDsqoTUeec?=
 =?us-ascii?Q?gF7wg7B+IkDhESTeHSJZ4/Glioex/dZsILikrna0EZSpvOr88r1r6DpAglcg?=
 =?us-ascii?Q?UI2oUF3U/gtYyS3AxeGTiqXZCbB8vGnaAQ/z5gUtXwJmkSzBlILPvkLOENlC?=
 =?us-ascii?Q?K40KuVwY6+jxccdVRLFHqdBzCg2e2WZEJIpaxW9ZS/JrYLjZcRzNyPa1plzf?=
 =?us-ascii?Q?eUvH5wAdSFz4FetDdNy4IeBTJJ2xa19UjKdi7F+f1wMUrYnivCX6bW8QMxE4?=
 =?us-ascii?Q?P5TOIP1sB2BwN8FQLb4uGv3Jqq6CyEgCcKx4qSSicGUtNOgZfdeV1V1Wvi4t?=
 =?us-ascii?Q?bSKfk+QYCR/nDPDXBn6ccEgymeLhHWBWWClemRAI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8023ca8a-801a-4cb5-0c28-08de01ba2d09
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 13:47:06.8901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/GnnJjdvQFgrm77gNRSZ4xAPjh8N+ycBMRblqe79IpT5yS4KO1Dcdjjrg7d3AlI+tJMoXpnq8DeYAegIZsFGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8256
X-OriginatorOrg: intel.com

Hi Sathvika,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes masahiroy-kbuild/for-next linus/master masahiroy-kbuild/fixes v6.17 next-20250929]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sathvika-Vasireddy/objtool-powerpc-Enhance-objtool-to-fixup-alternate-feature-relative-addresses/20250929-161302
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250929080456.26538-2-sv%40linux.ibm.com
patch subject: [RFC PATCH v2 1/3] objtool/powerpc: Enhance objtool to fixup alternate feature relative addresses
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251002/202510021348.gM9ZUxT0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251002/202510021348.gM9ZUxT0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510021348.gM9ZUxT0-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: tools/objtool/objtool-in.o: in function `check':
>> tools/objtool/check.c:4710:(.text+0xeca9): undefined reference to `process_alt_data'
>> /usr/bin/ld: tools/objtool/check.c:4714:(.text+0xecb5): undefined reference to `process_fixup_entries'
>> /usr/bin/ld: tools/objtool/check.c:4718:(.text+0xecbe): undefined reference to `check_and_flatten_fixup_entries'
>> /usr/bin/ld: tools/objtool/check.c:4720:(.text+0xecc6): undefined reference to `process_exception_entries'
>> /usr/bin/ld: tools/objtool/check.c:4724:(.text+0xecd2): undefined reference to `process_bug_entries'
>> /usr/bin/ld: tools/objtool/check.c:4728:(.text+0xecde): undefined reference to `process_alt_relocations'
   collect2: error: ld returned 1 exit status
   make[4]: *** [Makefile:70: tools/objtool/objtool] Error 1
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:73: objtool] Error 2
   make[2]: *** [Makefile:1451: tools/objtool] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +4710 tools/objtool/check.c

d93b5935fd4700 Josh Poimboeuf     2023-05-30  4682  
d44becb9decf44 Julien Thierry     2020-08-25  4683  int check(struct objtool_file *file)
dcc914f44f065e Josh Poimboeuf     2017-06-28  4684  {
c5995abe154767 Josh Poimboeuf     2025-03-24  4685  	int ret = 0, warnings = 0;
dcc914f44f065e Josh Poimboeuf     2017-06-28  4686  
baa41469a7b992 Josh Poimboeuf     2017-06-28  4687  	arch_initial_func_cfi_state(&initial_func_cfi);
8b946cc38e063f Peter Zijlstra     2021-06-24  4688  	init_cfi_state(&init_cfi);
8b946cc38e063f Peter Zijlstra     2021-06-24  4689  	init_cfi_state(&func_cfi);
8b946cc38e063f Peter Zijlstra     2021-06-24  4690  	set_func_state(&func_cfi);
1e4b619185e83e Josh Poimboeuf     2023-06-05  4691  	init_cfi_state(&force_undefined_cfi);
1e4b619185e83e Josh Poimboeuf     2023-06-05  4692  	force_undefined_cfi.force_undefined = true;
8b946cc38e063f Peter Zijlstra     2021-06-24  4693  
b745962cb97569 Josh Poimboeuf     2025-03-14  4694  	if (!cfi_hash_alloc(1UL << (file->elf->symbol_bits - 3))) {
b745962cb97569 Josh Poimboeuf     2025-03-14  4695  		ret = -1;
8b946cc38e063f Peter Zijlstra     2021-06-24  4696  		goto out;
b745962cb97569 Josh Poimboeuf     2025-03-14  4697  	}
8b946cc38e063f Peter Zijlstra     2021-06-24  4698  
8b946cc38e063f Peter Zijlstra     2021-06-24  4699  	cfi_hash_add(&init_cfi);
8b946cc38e063f Peter Zijlstra     2021-06-24  4700  	cfi_hash_add(&func_cfi);
baa41469a7b992 Josh Poimboeuf     2017-06-28  4701  
6545eb030e6f14 Julien Thierry     2020-08-25  4702  	ret = decode_sections(file);
c5995abe154767 Josh Poimboeuf     2025-03-24  4703  	if (ret)
dcc914f44f065e Josh Poimboeuf     2017-06-28  4704  		goto out;
8b946cc38e063f Peter Zijlstra     2021-06-24  4705  
1c34496e585688 Peter Zijlstra     2023-02-08  4706  	if (!nr_insns)
baa41469a7b992 Josh Poimboeuf     2017-06-28  4707  		goto out;
baa41469a7b992 Josh Poimboeuf     2017-06-28  4708  
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4709  	if (opts.ftr_fixup) {
1512a02c86c678 Sathvika Vasireddy 2025-09-29 @4710  		ret = process_alt_data(file);
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4711  		if (ret < 0)
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4712  			return ret;
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4713  
1512a02c86c678 Sathvika Vasireddy 2025-09-29 @4714  		ret = process_fixup_entries(file);
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4715  		if (ret < 0)
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4716  			return ret;
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4717  
1512a02c86c678 Sathvika Vasireddy 2025-09-29 @4718  		check_and_flatten_fixup_entries();
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4719  
1512a02c86c678 Sathvika Vasireddy 2025-09-29 @4720  		ret = process_exception_entries(file);
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4721  		if (ret < 0)
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4722  			return ret;
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4723  
1512a02c86c678 Sathvika Vasireddy 2025-09-29 @4724  		ret = process_bug_entries(file);
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4725  		if (ret < 0)
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4726  			return ret;
1512a02c86c678 Sathvika Vasireddy 2025-09-29  4727  
1512a02c86c678 Sathvika Vasireddy 2025-09-29 @4728  		ret = process_alt_relocations(file);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

