Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7832E329E62
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 16:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771605820; cv=fail; b=fJGSVp36HV79q5+I4BsAa/fi1t9QwhthPOnWyciaVYPecQ+q/0jg+nS+n/JWrqpHhK8imNioIBV1UXmD+UanZbc0kRK53u2oU4EaSXqqVpZMA2pWLr3H/iGoOTah++94MJQeEO1jbQkvIuH1BOVXmc1lWi5rz6nv6gfA2l+/bI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771605820; c=relaxed/simple;
	bh=qN2eO14z4BE4pSILZjxYqWz+XMnhmi2U/MQxOGpoxrc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aaeT0UQ0OoYo2NSiZ/fBn13BnyKvRgaaPpM7Wpyleiniwgpvomt769Qrl7kJA77Xqjjgo4rNi/sh9IWHCkyutjZ7zhcTrkzgUJLGCOQwAiTA9aqK+QWpIbizq61jVk19lK55FLyHfhvIbYoW2/uo+h9EP3cHqkxGXQr8Pe8Gu7E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYelpku6; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYelpku6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771605819; x=1803141819;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qN2eO14z4BE4pSILZjxYqWz+XMnhmi2U/MQxOGpoxrc=;
  b=kYelpku6Jxn5VQx35zyWdNmAxrwm8m3I8IzLh4HzIAWOHlNbOoPrPvP2
   XtIA63jPMwPM9RqYT6J94L+14ySI7GNNsX4c0QNjBKlqGEEkOyAQYG83j
   YId4Z368E6cXU/36HwKo6soj6RqXc7OQBAB+7jb5EbAwTks/aIwyOaz3G
   pIV6NoCEqYXugAY6+mRRw5G3H/TDmy14MzxHDdenHU7oPb5Ev8M8dkYhm
   OT7QA1CMTJn7Be0O1ZSLmwoUCNeSE3G6Zp9YQp6aBKTmPWn2DsjwCaSUc
   srmkkoltzuX7OBeG3o+GzTTVjaMWET4ZTYi9pa7kT2Z39oeyXSlnCqx69
   Q==;
X-CSE-ConnectionGUID: N34eXVckR2KKrWTeuHvHWQ==
X-CSE-MsgGUID: bGbWaFLWQv23s1NAypJZtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84152971"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="84152971"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 08:43:39 -0800
X-CSE-ConnectionGUID: DTr3k9sNR4aK9aQEAKTJ7A==
X-CSE-MsgGUID: IWNtRZvqTrmW1p+udl1ZZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="245481469"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 08:43:39 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 08:43:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 08:43:38 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.24)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 08:43:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9d7cM9j+0lDxfC1+frOWzy6iKIFKEuKNJ6YR2S9O+RaFetYbaoojNe9VMaORh40KYz5Gzcbc9W4saOQ6Ly39YitYWq7cJUGl8drePPEq8U0aXs8lJKVNzAHp/xK/OoIvtQT3Yxgb0x2giqA2SsiKt3AbZD5b7GqjjFEmMuwFAOZe2hLiKGDFTs4zR+OiTB6N9uW/BmAK/mLeOim4haH5506ATuphD/sofAF6/sLz9ArRhhZhuU9WBexaM/uWqXR/yCdVclhKNpeZDe/luU8v95Fe5V6K2bt7GDPx5K7ROAERH866ViSdSbPJbttSIyjTs5n58VIZhdr8v97DBKYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jah4aCcDhWZHPv0U7qz5DTnXySkf7k06YVrtc6q1RQ=;
 b=vJnhCKRHjKFgeabOVEBg+UdTs0rGLhg2ILZSqT0mUbIf7tpyLeRvagwJKavyYgMzuJeSXVYVqdEcgqJt2tbxvi/rEiZ0v1sSiBcxwb4W1z1qts95m6Di/9IY2e4ErR/mhYnn0FqNDnC+Y7dsNVAtU39+SXu1SSys/q/QNMIkUwOztT3NIJQ0/+f+WF27u+/cJDTN600oWi+FiojjhuhMib7NUqlOpg5Z+udALCnXQiJ6yycfo2OfeqtnHrIlBdxrp0HzFYmITrTXf8lMt6ZY+rl0rQYOKit9lT/kPoCkma8/91o15z9HiIiW8/L+snh+R23YndmQeQVB6MP2GJRPaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3282.namprd11.prod.outlook.com (2603:10b6:208:6a::32)
 by DS0PR11MB7681.namprd11.prod.outlook.com (2603:10b6:8:f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 20 Feb
 2026 16:43:29 +0000
Received: from BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19]) by BL0PR11MB3282.namprd11.prod.outlook.com
 ([fe80::5050:537c:f8b:6a19%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 16:43:29 +0000
Date: Fri, 20 Feb 2026 17:43:23 +0100
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/3] x86/cpu: Check if feature string is non-zero
Message-ID: <aZiOuAuYrbjVFQLF@wieczorr-mobl1.localdomain>
References: <bc0eebc8310acfae28a73e3780a67d721c739b89.1771590895.git.m.wieczorretman@pm.me>
 <F_3FNzwbno-oz9E8kYYM_1LJMPPQRRQyyyylXF2Q3tded8DznGLLPMhb6OiF7GWaVyxF-c5Ll0SksIlkxXEUDg==@protonmail.internalid>
 <202602210027.MJpPrtwD-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202602210027.MJpPrtwD-lkp@intel.com>
X-ClientProxiedBy: DB9PR06CA0030.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::35) To BL0PR11MB3282.namprd11.prod.outlook.com
 (2603:10b6:208:6a::32)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3282:EE_|DS0PR11MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d460bc3-913f-4cfd-0dea-08de709f2cfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nBFJiZhT0ddWWEh4ugoKjE5/dC4F1j8eHSgqGgzaBqBVOJ5GLCbdCMSjXI?=
 =?iso-8859-1?Q?H4yCFr7pnI15nO/5pShHTchVi5ts1XxK6VyrHPBCzclJL4KEJzMdqjhLDr?=
 =?iso-8859-1?Q?KJPn+tUfmr3bako/3m47KnT9+RTdCvCpimoeGJLyQm0kBo28FPVXioViqx?=
 =?iso-8859-1?Q?8KyCfa21rFgqErWLBexkjNhyhihdddDYljAkBtolNFy/sCZW+S4v5I1hqc?=
 =?iso-8859-1?Q?HCNiXbkiZ+pJP3SnD6NMX6+lGZ3Hgy/GIhpZNs+XAM7x8qF9MIt2f6qLWx?=
 =?iso-8859-1?Q?sRCItU3utE8+ebIZoe4zMumZxR2zt0o+WyUJBEe56+2PR3Bd+xQA3GC91k?=
 =?iso-8859-1?Q?N4/G9jcpRkXR3+citLYutTiwb5JETfPws3sWpZWEeNqpGsZE6ni47+xYhO?=
 =?iso-8859-1?Q?z1pOtvnF9MwrREzamFVj6poO873kDEJYSAldmlnTh/9YYzq0Czz4+CTIsY?=
 =?iso-8859-1?Q?FQ89l5/nSRNtckV4mLI2vSg4fxpXUcwVIT25l6I5cUcC3bCMWAUJV7Up/U?=
 =?iso-8859-1?Q?Uk2guCHXtvZZTtX4j/6pO4AtFdq/uaadQ6h1nuyhxEBilYBGZpD4vqFF/+?=
 =?iso-8859-1?Q?JZurAmQJa5N9jEc0hHqbcAYDBK2AclXK6R5rJRDl7A8WzI40nuQ22BDJT9?=
 =?iso-8859-1?Q?ETL0ONyPmVhl7bgKcelcHpzg51mUOF20YhbH0HLRSqxKLejt1C2S2QDQQh?=
 =?iso-8859-1?Q?3Rt88sZ6z1MSgMPt2Kis3nvitC3huWqAR5XflS4NLvNNF3T+3rDqGVjYKq?=
 =?iso-8859-1?Q?MYdniIHNk1urrwrZJEVapFlSHLomxsJchgalF6YLLSIUJo8l/qyedI9hzU?=
 =?iso-8859-1?Q?17NjMotYQDfrQIMnhPIZDW7b2uELNmbMarOn0XDrtK1PMOUc6SzYcdw98o?=
 =?iso-8859-1?Q?fv1CmAW1/u98l0JxK5ijLAJCtHYC3thGLt6CEN9vmKq2t46NBpL+Q6EW4w?=
 =?iso-8859-1?Q?/4130u5lvx8MlkWQKj29/f1Ocriq7d1I+GRyXinw5FTe8xkPdRM4xOj+ax?=
 =?iso-8859-1?Q?Ry8hDhE9LIpryFlHfP80Ca1LXRDe1NXqKesPVxUlXn2qF+fH4rzlnfUs/o?=
 =?iso-8859-1?Q?UW5gFcDKI2axAhllx7PxCgdprHeywHVrtb5vVb6mNlpVfp7CKiz7CvPKEs?=
 =?iso-8859-1?Q?MvTAb58Zn43KIx+gFqvahgsTuQtCF+Ps+P4KDPUIgg6f73QoHD/n15IIj0?=
 =?iso-8859-1?Q?7Fz2i1Y/qWwCerQaSctNFOomCvFdMxrptXZTiD5NjdwQQbLD3L02S0Fwkf?=
 =?iso-8859-1?Q?9FCbWp8efH/dZeqHrqucgBCj/hjF7hJsfsTVdSC0Ii/hbiOs0K0TyyjOte?=
 =?iso-8859-1?Q?qIdgLfy3YjdPRwUXBo3ljoMycPCqWfFVhBml3toWrtVDJZPr1dwklf+g9V?=
 =?iso-8859-1?Q?aY8Pw0/sPsVLKAP9/gntgGN5GcXk2Hn1UOkFXDSYpLH4JTnRdy+piDjiHG?=
 =?iso-8859-1?Q?0W3PH3F0XIt1MejCA0D/mEh1x1ZloiIpx134MSCTXedtlcXwElzYSUPotx?=
 =?iso-8859-1?Q?Pwnga4230vHfs8mvBkA2GNG3kY7jmuJQ2QUCPeCfIf3uCHLx8qFS2eU/Ni?=
 =?iso-8859-1?Q?PpIDjxdmPMH1VAlMdg9ot6RclBhe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3282.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OpJHbnJjFmckfuJ9t2Zl8CayUot7HBiSmniFKAvzHXCqpzi+/BT+rnMVKQ?=
 =?iso-8859-1?Q?FRR/TQ0VrLs2MzOVq/IUOF6z3p0iJqbtOyK4ERqFmht/dToKXqZe8529jq?=
 =?iso-8859-1?Q?Bpz0eWH4SF97ep5MtpgV/zh3iPkOJk2tgA8Roti2sN4jNiWYpT/kEbvfVY?=
 =?iso-8859-1?Q?/2ZzoKcZ3imCq68K84weRi0c/uTCYTOnzZkZvvWP+4gW5N4CWAryLebEII?=
 =?iso-8859-1?Q?jrPOoIwuDlEL0OsEJ94ENSvNITwoH5EGtiFPk1IiT1wTO/mA+AMT6FBvba?=
 =?iso-8859-1?Q?eM6egDnUJj+KuHv4xoXtQw/N2mCSOV1oGk4JXNUSwbdA0QEYcUBqcuEbPu?=
 =?iso-8859-1?Q?SSnbEuZn/Hgn+cq3vKp6X8ooGwq5Ds+ESGZfJ6aVf3wUyQGaZv6WZgWxmU?=
 =?iso-8859-1?Q?jMWXs1I5xMXGB+Ejs3k9xJ7DFbzWnaGn0nAV+mQG4VWXtWCFOalV6PuZkL?=
 =?iso-8859-1?Q?VvmvAXZr0olkIoJ9u24YaIW9Dgmfyy9X43spjCOhNpuTo/VzKmAndFNJ3e?=
 =?iso-8859-1?Q?JPtyyzQqJe5re5lSl8EzLih3BMGMro9bUqBXZMpfoVagw1I7tqWjXu8/Cj?=
 =?iso-8859-1?Q?UoeuyGCCvt2T3YTT6TNALs9j8uCLYtYyarISJGhAWdL2lUgdspwG3DAxC2?=
 =?iso-8859-1?Q?Rr0UG2y/zSAIadPqgKciF6muczB0ka1fZ6EQqzSmASnQpdHXMurPX4bpqe?=
 =?iso-8859-1?Q?XNezpH3Y90cHuakU5BYu+I4cUWaDgKOLKf7iwVRE3UXmEAOfKiQmVuaT74?=
 =?iso-8859-1?Q?vC7G9uKHWP+GBP0V6DcEe4jhaifsxa4yKlJIWplNkLFbfE/9ZiZnuUG4vm?=
 =?iso-8859-1?Q?NLB9cfTRyE073nH/E0lDJmyfDOseYmJOMPn22NEiMpTEon/uL25RGlVZ2W?=
 =?iso-8859-1?Q?N3we0lAehRrT+EkXNDd79wOYz8/EfcfUCkORRi3Rr6UgGiJaPfV1HdJDBc?=
 =?iso-8859-1?Q?iLy+310hEoteziLkwiMEeog4uauxmXmvaYVwK3M4v/3pAeg0TMnqnyPoJG?=
 =?iso-8859-1?Q?8Mu5nztkymSSXeUJYEMcFzRm33QaZmO40tPWpk21CTXIvop2Z76k3HnxxI?=
 =?iso-8859-1?Q?3CIUnvo/To8X60nZXzOUTLaMrOuAm6Nj1gDkNZyMnsYLXklsl1LUpUmVaW?=
 =?iso-8859-1?Q?WKsnLmnLdIt+uksvxquNi6gBqGJTQCXyOkTK7Y2hoRsYmLQ1KV7Ez845uc?=
 =?iso-8859-1?Q?RGuGQ/VpSR4VKOy8wgDO3WJO0Jw70ikuU84wyrNw/XVtJkk6His4IEFyGt?=
 =?iso-8859-1?Q?HYcJIdwlvUb6vifSXotbYmI69ZORTE12cNyp0P60sT7pzgN2e+qsDSNgfq?=
 =?iso-8859-1?Q?uc8lU8/iv6nYx/4IC6jyNnKpTWtzryAwR/eGBx1cu8Efk4WGxf5nI3FrEy?=
 =?iso-8859-1?Q?UQWYNwNanaqrJNNfsWoODql3EfGmsVkkQQRaGPosnA+qgzUiMlmSUA3WHm?=
 =?iso-8859-1?Q?AsC9mlEhTdMvxKQqqgnf4MXdlAUovBovmBp5igXY2wTYGrETqCVeRMbf4z?=
 =?iso-8859-1?Q?XV5Dsa1uuyLbNgU/Q69VnQBpbfa7Kysg3hcHvjgOemOgrdzvqyv5kvIUQD?=
 =?iso-8859-1?Q?rvjiezrMpFc0TaezL7Pv6kxaS55l6L3rdpODUfYgP3Q2Adwh+XD9/z1PZm?=
 =?iso-8859-1?Q?ORVwEjNCpkQh7adXya8wvGLvVwBTm/xBmsg+pKRUWuswI1uoFwa50tB4ta?=
 =?iso-8859-1?Q?g9LTTUlNR3xwsxFZL9hej+kqkpIuGWM0Ds4yqbPo6hMKgOccEVyKW62B5/?=
 =?iso-8859-1?Q?7W21d9hqAZBsA57EQk8THceXmEgphgRNxpsfOHNM1fYZNEOeL6OzQxJ0EX?=
 =?iso-8859-1?Q?GDVBNNppvpMMhuHwd4zsxByLRYBX5rrNrYnDaOwoiDFPy3xO98iw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d460bc3-913f-4cfd-0dea-08de709f2cfe
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 16:43:29.2139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEFcib2w/oRulDzF0OSwe6opJKB8Edi9554/QAskm0dLT2hcn0NMS3waywjfo16vTO06L3o8cVMEobyrl9fiKNCSE3vXX4Q8qFagYyq0G/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7681
X-OriginatorOrg: intel.com

I'll replace the sizeof(buf) with 16 for the next version.

-- 
Kind regards
Maciej Wieczór-Retman

On 2026-02-21 at 00:19:59 +0800, kernel test robot wrote:
>Hi Maciej,
>
>kernel test robot noticed the following build warnings:
>
>[auto build test WARNING on tip/x86/core]
>[also build test WARNING on tip/smp/core v6.19]
>[cannot apply to peterz-queue/sched/core linus/master next-20260219]
>[If your patch is applied to the wrong git tree, kindly drop us a note.
>And when submitting patch, we suggest to use '--base' as documented in
>https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/x86-cpu-Clear-feature-bits-disabled-at-compile-time/20260220-204916
>base:   tip/x86/core
>patch link:    https://lore.kernel.org/r/bc0eebc8310acfae28a73e3780a67d721c739b89.1771590895.git.m.wieczorretman%40pm.me
>patch subject: [PATCH v6 2/3] x86/cpu: Check if feature string is non-zero
>config: x86_64-randconfig-003-20260220 (https://download.01.org/0day-ci/archive/20260221/202602210027.MJpPrtwD-lkp@intel.com/config)
>compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210027.MJpPrtwD-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202602210027.MJpPrtwD-lkp@intel.com/
>
>All warnings (new ones prefixed by >>):
>
>   arch/x86/kernel/cpu/common.c: In function 'x86_cap_name':
>>> arch/x86/kernel/cpu/common.c:1987:29: warning: argument to 'sizeof' in 'snprintf' call is the same expression as the destination; did you mean to provide an explicit length? [-Wsizeof-pointer-memaccess]
>    1987 |         snprintf(buf, sizeof(buf), "%u:%u", word, bit & 31);
>         |                             ^
>>> arch/x86/kernel/cpu/common.c:1987:37: warning: '%u' directive output may be truncated writing between 1 and 9 bytes into a region of size 8 [-Wformat-truncation=]
>    1987 |         snprintf(buf, sizeof(buf), "%u:%u", word, bit & 31);
>         |                                     ^~
>   arch/x86/kernel/cpu/common.c:1987:36: note: directive argument in the range [0, 134217727]
>    1987 |         snprintf(buf, sizeof(buf), "%u:%u", word, bit & 31);
>         |                                    ^~~~~~~
>   arch/x86/kernel/cpu/common.c:1987:36: note: directive argument in the range [0, 31]
>   arch/x86/kernel/cpu/common.c:1987:9: note: 'snprintf' output between 4 and 13 bytes into a destination of size 8
>    1987 |         snprintf(buf, sizeof(buf), "%u:%u", word, bit & 31);
>         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
>
>vim +1987 arch/x86/kernel/cpu/common.c
>
>  1973
>  1974	const char *x86_cap_name(unsigned int bit, char *buf)
>  1975	{
>  1976		unsigned int word = bit >> 5;
>  1977		const char *name = NULL;
>  1978
>  1979		if (likely(word < NCAPINTS))
>  1980			name = x86_cap_flags[bit];
>  1981		else if (likely(word < NCAPINTS + NBUGINTS))
>  1982			name = x86_bug_flags[bit - 32 * NCAPINTS];
>  1983
>  1984		if (name)
>  1985			return name;
>  1986
>> 1987		snprintf(buf, sizeof(buf), "%u:%u", word, bit & 31);
>  1988		return buf;
>  1989	}
>  1990
>
>--
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki
