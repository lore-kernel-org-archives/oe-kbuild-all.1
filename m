Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B74BE560
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Mar 2024 01:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709776764; cv=fail; b=g1K2iJgh/wqMTNZIAvV738VQlaIHFdcLl2bGxvklp/b86/gEvSWBPhAp7qZ4hW/Mc/e+99P0Nls9tx8EVkfsjb1yQD1qLmQC1jjYHGcW09XSi66GMkUlRjPV3+q0NxHix1HIBz+bZidh7b/aV/3Yv56vmx2qxZQEF3qYkAwdhSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709776764; c=relaxed/simple;
	bh=wQhU6b43IjpsBVzTsC5vhIZaO/rSiNDbNUWBJzEkezw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hI44adMoMbZHhwbdoVGoc7uIXzzY7HUM0tsevs6bmEt33No0gesyuqjr7zy+R7Zu4GqUrfxvx3hu4XPeDrMUqL5nmTQKZyl9UEetj0YM1atbX92A63xSaPT5qENA5stYNLOdXpPYM+HQay7NzFiO+nP2Dkcl6AsAEPg4uw4iQEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/mx7pSG; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/mx7pSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709776763; x=1741312763;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wQhU6b43IjpsBVzTsC5vhIZaO/rSiNDbNUWBJzEkezw=;
  b=H/mx7pSG/AX2FrcAB8GH3fNkeeIlOK6jaO/P5A8yJMiy6zN+TqVfokyy
   VymzYvDzEUJgF0URUblYdSUJYR0Hc9ov128EG5FauYlP4fMM1pA4kSs1b
   wB+P8rJU0Yr6HuYst5cb+T9tSNwxqqMI6DwK7IUbRE+w31M735z5Wj4yb
   KjNKPZgGR48vhYs2phTQ4RF4BEgtFL6pCpTQCcp0KOXTxwB4Gi5RjllTp
   PukLcTf9WgYYO8B0bL1/v1ZIL8bSzOAGbG9XfuH+KFlc7JUn+rl2GVfNq
   Mnh2i8CCoAUVKtQrGKUnZeub18k8xHkegITD+q6inzUrlcMMrR6aKVLSr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="4273587"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="4273587"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:59:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="47453750"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Mar 2024 17:59:21 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 17:59:20 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 17:59:19 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 17:59:19 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 17:59:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxhLvJ82/E8fIMg0Em5avoom2OS9/4K6KRO8nC5PIeLG11btI/WPcYeVlRIY1XIZR8Z2FmFB9uR4NTVQOL1roENhWuF4fJiTR2F35EXngwNEZUYvp6TBegtF6nakCAAaie/s3pr3CGXy9/NJ3wzxckgjfaDm+9ixiW3bpEJDaMm6sqv0ctY7V0BKehyTXOLZK8zMcf56ww+CVekYeQ974ouwKGJbtxIJRslKUhcgV88Ll2cgcPodNRzdYwbYywSaz8vegYl8lV2x0yenF6ZSZu8B+VVCmKquzw8xZdChASnk/yJuyq9zM50lE0NtDaCMqHrDHxdRwF+AxayIAQ0iUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOgKhhbEOLNsBJh/M60shacatsYs7nUsdnaWZSvMVJY=;
 b=iu9dVhttuUpSQAGvW2rCVeFR4xHDfhd9ayawkJAhwbScPUDFZSZSTz0xm1osQ+1zqPizw7bUfVCKm3Cqikmzj5CpJQyWU+usUPjISklpxjhBKU+iqwONZkjf3/R7/huGaVtMT1cEMGM2YDkSW9R/nAgZQ0hqRVpj6K89XXAfBs6mcLnNBfSB/aYezDJkNkqk2OnexQOV081Gz9XWH1cWAPA72aCoAB0VykMPAbQXysxwhhL89liewbz0IjjkVlmLBZSCjYwOJMlHoX6zYfc2AiHcvoZzJOq5+2rVgNrn0cxnLbLj8I5ETcweb3dn0k2Z2Ax5HLg3WIZ9BsjUZgluog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by IA0PR11MB8353.namprd11.prod.outlook.com (2603:10b6:208:489::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 01:59:12 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::df02:f598:edc:808b]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::df02:f598:edc:808b%5]) with mapi id 15.20.7386.006; Thu, 7 Mar 2024
 01:59:12 +0000
Date: Thu, 7 Mar 2024 09:59:04 +0800
From: Philip Li <philip.li@intel.com>
To: Thinker Li <thinker.li@gmail.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Martin KaFai Lau
	<martin.lau@kernel.org>, <sinquersw@gmail.com>
Subject: Re: [linux-next:master 8264/11963] ERROR: modpost: "__fentry__"
 [tools/testing/selftests/bpf/bpf_test_no_cfi/bpf_test_no_cfi.ko] undefined!
Message-ID: <ZekfaPDRU+ecVSXJ@rli9-mobl>
References: <202403061307.f7nX2Ma5-lkp@intel.com>
 <CAFVMQ6ThBWmoSEz==zVH_MvXq+=yvxO5XZJSLUUqJV+kVeULuw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFVMQ6ThBWmoSEz==zVH_MvXq+=yvxO5XZJSLUUqJV+kVeULuw@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|IA0PR11MB8353:EE_
X-MS-Office365-Filtering-Correlation-Id: ed987d01-db59-4300-2e15-08dc3e4a2f31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AFLsIzdQppK++Ke22KEerN+/X0EFgYj6BBX5xDUpJKrK7CYnby5L7PIsV+Rrfv9DkwlZiOYPhz1SeER5z2Wks8RERvWUCheiDNg1lLYCqM1Zn+EVr8MlyO64R3y8TDHRQJyIyKGV2xNPvi1PcGyr8xHNIRss6BoL9IlP1fabl2p5qA+FgGNRLNGYaK3vL/W8K9G6Sngy9B88Pw8Pm31XX45aupR0GWneiYYutakb9Xtk+30c/qHhlpwcrh8ZESnsR9Uts4GTKJ4zDf+0cdUiyg6MgBvM3owGmXqc/SiKykQFITfkqzFWSqHOX/MK4pHmJEbo3IPW/vhKBBZ7jPDF0LINCgJuRZl0CK2Qoc472oNjaw32Jbh7EmlgVqKkkx7iKeANgOf2daEGErrJQ4bpezeJ3n4f7DJNOB5+V6snvQt9WAtcmscVJwnUB1OHzHX/KXRHJ89KKNqhbC1cmAAUCKM/w6AJ5Bbf4D6SE2ifwo2nyea8ppRdsnLmIDdt1PIwu49q6RnnPAvkX+2zCAD4dbQZlTiG6mwatWy8aSC5t2T/flJrTxxqN/GFS1fmZDroHLdkPoysbpw5UNTUHIbhc5Alg+09bd5zjTrrRSx+4tJ9fMREEzhOz2mF/TRbsKpg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWpvTThCUUJkcnR1bkhpajlTTGY0Q0dvazJMVzc0S0x5RlJkZ0Nsc1JKZXQr?=
 =?utf-8?B?RjVKZUhDaUZRb2VrOGlicDA3MFdZeUExNnl4RHFlbC9WT0JJa0IwRG9HRjdR?=
 =?utf-8?B?WjU0MXdOSXVVRGdaQkE0OWFUTFBFeDRJZ3JFUmZaRy9rUVVDWGNnVlBPS0Vs?=
 =?utf-8?B?R1hTWmhaa3BweWR4eTc5WWlqV0tHem9QRUVjbFJiWDJDaWJxbWNaa0d0QjZh?=
 =?utf-8?B?S3g3dFlUeXpKVURWM3VwT3lYNS82TVhZSmlLdmtkVHJFaU95ZWFSdDRDZXoz?=
 =?utf-8?B?Q2lCUG9lVXl4VmNXYW9JR1RydGQ2dzdOeXFsbTJycURrUTlDbFM4TEZtSGNC?=
 =?utf-8?B?R3orMWJIRjdGSjVQNi9tdUJMOU15VlBzT01DWG9zL0cxN3M2VW9JRDMycUpN?=
 =?utf-8?B?UkZ2UEdqK1ZELzZHZUN4Q1Q4MjJDQjhONnh2QnltTnFwa0dLeFBzRHdjek9i?=
 =?utf-8?B?bjMxbTZrdmhBeGVEQWFIQU9ZVndrdUhiWDFJSENEc3MxQ3g2cTdOUi84TE83?=
 =?utf-8?B?L2ttQ0FUVzJuM3BxN2RzZ2FXWURhYmtTN1NYa2pFOHUwdGZ0c0w1UkhsdVJC?=
 =?utf-8?B?d2RHVFdVeU9vWkFwRi9Wa2NtcVcyTEZzZ0hhWU9vbXUyV1BKa28xNGtpQ0Rn?=
 =?utf-8?B?ZHRmbk1xa1VyQ1VUVzVrdHM3VlZibExFdXY5dkRVTVZ5ZkxNaG5rR2haMElv?=
 =?utf-8?B?SXpNRFNCdmxEdDlUR2VYN0lSbnI1MGZsUmtLdENySjlBQ3FQWmhMRzFhMG9X?=
 =?utf-8?B?TnVpSFdtOHgydmt3RVkvT1ZiZFV4MzZuUGFqNFA4anhrTGM3VUg5dTdQelRH?=
 =?utf-8?B?N2c5ZkgrMDFnNys3T1R1aXJTR0FyM08rSTVxQS96amNrU3luRnF0VlJNSUY4?=
 =?utf-8?B?eEZWWW1OWHRWaW5OUXNHVkZocklKc2x2RHF3MEsxTE9DK3NqaVUzenFDQzBF?=
 =?utf-8?B?aUxTaS8yRUYzRnU0NTFZQUNBWndYdnlldm5wWGZXWVRWTmIxajdFb3V5ZktT?=
 =?utf-8?B?MldiL2hNRkJ5YkZYZ2kzM05XZEpJOXNrVkJDQ0owOGF4SlArYUhtSk00R1lR?=
 =?utf-8?B?bVpCeXhZYUxiZFIyeVVLczdiVDZRekhoN0tpVHZEVXdVZ0EwbVlVckpQSDZs?=
 =?utf-8?B?S1ZqV2FnRkZQNmpRUUpmK1hwZ2N3cS8xeHkzTVc4VTkwbFdZRlo2ZHFNK0dl?=
 =?utf-8?B?TFpDSTM3L1JNR1JEelg3RDFUNTBURVFwOHVGRFVvRnozN2U1OENIT0YvQjM5?=
 =?utf-8?B?T1Q1MHlSZzNDYUtRTFoxNkNaQUIxVVdCQ29KL3I1NTJuRElwanIvUHNNQm5Z?=
 =?utf-8?B?cmN3SXNNMTIyUkk2OFdhcWFWSnlGWmpOcm9rbWttLzBlbUgzUll1bTFiSWFI?=
 =?utf-8?B?cGxBYVl5SDNTSWI5MmpvakJ0NFVLN0hjc0ZkZm1hT2ErZ0g0QkxlZGt1QlhL?=
 =?utf-8?B?RlFETFM1L3QzaUZ0S1pNbUU2bGJXNm03RGh3bUVGNUg5Nk5sWWZNZExTdzhK?=
 =?utf-8?B?UFc0N01Ca1J6d1FTMGtVbjE2MUJGdHVWOSs5M3ZRMDNITVh1SkUyNTA1cXo4?=
 =?utf-8?B?eHRRZjJ0clZFcys4SHpKbzE0NU1INlZFRmlmQnRYNSs3Vmt5bG5lelV1MjFM?=
 =?utf-8?B?RWoveXZnRTVEeWdtQ0ZBVkpDTTVUZDBQa0NCekI0T2pUZlJveWFvb3FtSUFv?=
 =?utf-8?B?NGU4cm9ydWFjd2ozNUhJRnNVNGhEUEtCczVBektRV3JXY3FZTHp2bHhkSE1i?=
 =?utf-8?B?NHd0TWE0STZ6dVdadEhCanhZT2FJMStEeGFRWlVxQUZhckhiZ3ZpZVRPOSts?=
 =?utf-8?B?cDlQYXczSDlWbTFrR2UyKzFDTUZJVUQ0eXdUUUIwK0J2VFhVVHhxMGl0VXV5?=
 =?utf-8?B?UTkwKzdwckk1aXVZaVBsbHVnVWJLVkVGeFdMK2xyaURieFg2V1BwQnJ1ZFZG?=
 =?utf-8?B?c01SNk1NTXpEUkpPZTRuWTlQVGJISnU1K3JONUhXTkFnWnFYVmJXa0FuMGZa?=
 =?utf-8?B?TVU1aitXeEZleDhQNGxpOWx1Qmg5OUV1YjRaSi9jT3JKd3R5WDFURFh6a3Zq?=
 =?utf-8?B?K01qWGw4UWtFbC9kN0pXMk0wRThiMUoyYitTMnphdG02cklRVGlFUmJWVUI4?=
 =?utf-8?Q?acR9nLAxXWswbURjmuicu4PUX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed987d01-db59-4300-2e15-08dc3e4a2f31
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 01:59:12.3173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pib3ZrdlHETPyTZIQ/QuizQFJKR3aEDlGc7g9SeQcKYtDPysVbITu32IQS7yYcyqcptocMMxBvLSq0jMxDhAPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8353
X-OriginatorOrg: intel.com

On Wed, Mar 06, 2024 at 05:55:58PM -0800, Thinker Li wrote:
> I am checking!

Sorry, kindly ignore this report, it is a false positive. And we are working
on resolving the bug in the bot.

> 
> 
> 
> On Tue, Mar 5, 2024 at 9:25 PM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Kui-Feng,
> >
> > First bad commit (maybe != root cause):
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   11afac187274a6177a7ac82997f8691c0f469e41
> > commit: e9bbda13a7b876451285ab15fb600b809e5e2290 [8264/11963] selftests/bpf: Test case for lacking CFI stub functions.
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403061307.f7nX2Ma5-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202403061307.f7nX2Ma5-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > WARNING: Module.symvers is missing.
> > Modules may not have dependencies or modversions.
> > You may get many unresolved symbol errors.
> > You can set KBUILD_MODPOST_WARN=1 to turn errors into warning
> > if you want to proceed at your own risk.
> > >> ERROR: modpost: "__fentry__" [tools/testing/selftests/bpf/bpf_test_no_cfi/bpf_test_no_cfi.ko] undefined!
> > >> ERROR: modpost: "__register_bpf_struct_ops" [tools/testing/selftests/bpf/bpf_test_no_cfi/bpf_test_no_cfi.ko] undefined!
> > >> ERROR: modpost: "module_layout" [tools/testing/selftests/bpf/bpf_test_no_cfi/bpf_test_no_cfi.ko] undefined!
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
