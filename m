Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B160237882A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 07:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775027891; cv=fail; b=B+XLH805u+sgGYnQC+SWYd/nR3CB3batdr7mbjzveL726v3powY9DkuCrS5QnIjXvNGSZrPlLC6NNX181/4GcKsY/u96FaUgN6ISO50V+gHSLAUr0z2FPXCsCkdPUM+mPexP/M12VZpd6J+6QwPIIuSk0RAxEyl6xkBzQTuHuH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775027891; c=relaxed/simple;
	bh=IznemJok9JFORoAFO9iXYJjxe678WvFn8pL0NZot718=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jD8FtPLvEJXUr2Tmz/DEL+8BGMIQdv4CMs9iPuVm1r2eyZmnscQ9R5IBbu4h9dS98yyYVHieKP+H3HsiUfaIs3ix7SA/BtCV5dDPEH/O+WPApKHafdUZJTObp+x8qA4iTt0FvW0d14+4GslCqldzbqwueWmVpsKEpiXYqaHW5qY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVzm3Lay; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVzm3Lay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775027888; x=1806563888;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IznemJok9JFORoAFO9iXYJjxe678WvFn8pL0NZot718=;
  b=RVzm3LayOgcLXs+CHZZsvljuyDo0c5wKhZZe647riARG/TbyzbS8eRjn
   gVF6FgGxjOZUuV5fm+wiaNE02sV7YB//QbyQ43J4xSiz/dX5VpI1xNjmg
   oCOHmPOZVq0d5xl2J1SdXKyn/h7xoI6MBGDKg091OLZONfrZzgpB+oS1E
   aAlr0TX4JZp/UgBCm07T6ID3mR+3lVeVrwi9kFOSZO4te5/qAf1HIe7Pl
   yK/LIVdGTXXktHCW6zDiInaIVgFN4n45ZN4GOVYx8vqP9XRp8+ZGf6mXk
   nV3EXVI6N7JB1eiJGil9KFb99s0er8/7pcBptRAdEQs5NZ0lpkGf8VbdQ
   Q==;
X-CSE-ConnectionGUID: XEiHcFr5QD2ETW/du1xqaw==
X-CSE-MsgGUID: wbdfunrkTLm6njVMvFP7tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="93639416"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="93639416"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 00:18:07 -0700
X-CSE-ConnectionGUID: QRZy+R0jTTmugPzdUxVUnw==
X-CSE-MsgGUID: XjzFjwoPRga34uuoBoON9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="249812107"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 00:18:06 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 00:17:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 1 Apr 2026 00:17:32 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 1 Apr 2026 00:17:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3XbY4WNYqFmIlQA0/FxehyOJnMrP9AClxZMzYaCsLK9ZFG8LY4kG5YLuBO1A+4E8L8SXGVEy3K9s3NDfN7PAjQ+gmIqfHppM96m6Yz1MNXZzHt8GtiFrbRTAC8Q9N89XcAZweJTg5qOz0OyCY/6q1Z3e5qGLnDDcTnM25TAkruHklzO4Q+k8IziY0cKWXaNfAGrxdRZBZHsFHMZZDlT/IX6i3vDhnTpx8ZRJhrZMhx/C/Kl2A7d4SFeQtxiIQSrFWLferH2Bluadk5S3nguX4YKifboW4v/IE/ZVNEdMLFYo9mif9Omc+8lL+vLd2WotEJsflHenuYM0cp68w8OYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXN2MO9xUr70iljxJ0jJPNeEK5G0MyqlxVD5lYgpnwY=;
 b=hvucDOFICGdu96/JoMuOx6yI3vNcjKtO+L6V/ev3/3ST3+Jr0MsQfxZGOduvnVrpEayIaAuc75gW5x6RXC11wgco55JVqbraNPJChz73Hlp6egV9TsADSwFf79NIkdtsy9KoTTnI4194bvmF1JpPchTetG7PZ/E6wjQgGPx0hSIy7rOr/n3vovy0HKzKuPvtK1Vq+nKJ9UGvI9E742AfUt8px3g5P1fuNxkLu1fW0J1o3j0WDLmfXPjLaL6Fu5tKyTwXzUweCRQtCMV1bJf8XQ1gR9UmFO3jT+CnYRJnjcb3meFAvpW600EuYbfLAJQfwszFS1N6cFEovZWmVV6hPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by DM3PR11MB8684.namprd11.prod.outlook.com (2603:10b6:0:4a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 1 Apr
 2026 07:16:56 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.014; Wed, 1 Apr 2026
 07:16:56 +0000
Date: Wed, 1 Apr 2026 15:16:48 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
	<intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v1 12/16] drm/i915/buf_trans: compute LT's VS/PE Override
 index
Message-ID: <aczGYNu+5KEQ5Q7U@rli9-mobl>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260331183332.1773886-13-michal.grzelak@intel.com>
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|DM3PR11MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a985aab-9df4-4c0f-2365-08de8fbea81c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 46vfa+bMnix3n4gHpfv45enJkrP0lQjhEdjGD6rxKu9PToTDaybD00jF56Ym3a+tQZHIJWLjQIyPlF8R8kiCFk/DMHJN6dVYNNiTbYmQwkiGYLqauI4t/fCR0/nzNMCiWmBpsX8fki4Iy+hJCkXGe1M5TvEKwazO3XHmP/KYw0OOlp45BPXZCKOa/v7JWm1HTHMRrClEddxuV7ZQ0ykTQbuHRuaz30+RvkC/Fgn1XkjZWgOxdOO0H0FzZy3Ziztw1BoXthAjSN2iq7Tm0ve0dI4SdF6IDXBlwtuM5XSjYgFdHvhsTWFdY3oP+Y21zIoN0cmkJtjHGaBC3uURSvxk58SxleprrzRhU2gkDVxvFz6wheUVhs9e9qMvetrQSxyJHNN9gVsEew5V9lx58BryHqLCupFfDr09k7bAYR4AWqQw6b4P3uEg/1Dl4jCK3jaTFeh1SCDQ4FzAPFAN28cRhwnxfpv2u6qVLF1QZ8oHlNVhYPhkumaQZntd3CNVJTqfAzL+gITjZNRpOGPAvH4nL3SUxZLLx0it9SqCqSA4JZG75FRYqUI5YULtZ5n0ibYFQE0Ac28fCtQOrLzpt/YMW90dhdlbq63CdScqr+cQOHm0jcdA4c+lJJOqCLIrJDZLlA2fkQZ1Ddzp8jx8WxmBsn3OAjJIssCQ8+OaEOJ4QHiG3pXoH6efWfv36O/d6x88
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2hEQTdUV3oxMHlaWk83ZnBHVjFDZHNvQXBRbjlmcnFCbVBCSm5telExcG9r?=
 =?utf-8?B?bzB5Z0t5R2hCeERzNnJIbVRheEJ0Zk85SGo5cnVUaGc5bzFNR2ZiMjhNZHVS?=
 =?utf-8?B?b3ZYSDBZbDNsL0h5dXdtWWZqWUduLzUxcGNTUThMM3l1Tk1DZmFtVU9leUlN?=
 =?utf-8?B?RWZYSUFHUXJMeUlyMkRqMWNFWk9tYnhGVFVLWjVXVEFvWkJQaWNQbDM0U0Jt?=
 =?utf-8?B?RHd6YzBWMmFYb2RBSGlwakZtbWR1ZXN2ZFpJQ0JHcXlpSkluRmVxRHZYa3ps?=
 =?utf-8?B?WFcxOTdDeU1TdUdBMGZ4bThIL1YramNSNzNnWFVHSGRLRVFoUnNVcWRJZERy?=
 =?utf-8?B?YlB5S3pVVlJIZGVBVjdyTTgwNnc2QUV6ZkpOcWtqVlZKSGhtcEpLWG8wS2FB?=
 =?utf-8?B?WFNad01WajZUVFQ2em52TSs4dm5NeFErNndhZS83aEgxbThiVGVLMWlVeWxi?=
 =?utf-8?B?VE1tYlI4YTlqTGhyaXlNUmZXVDRvZ3lKMldvOHNIRjZiaVVFSG5pVFRRUFpE?=
 =?utf-8?B?UUE3ekU3OTlVbzFBWGNCMkQ5Sm96NmYzeEhNL0JsL25uVzdXcDBSUVd4MWlB?=
 =?utf-8?B?VEw0aWFjU210Wm9wOUVxQVRLZ1RqNDBQYlVaenBNM0hxWmRWNlpDTW1ISVky?=
 =?utf-8?B?bnZ4L0owdTZ3dE84RW16TUdPekROQllLdTBWU0grT3NERlh6VVhZbTZrVHNy?=
 =?utf-8?B?VThjbnkvVlQwQXlqQVVneW1JTGlHeGh2SXhXelVBN1lSN3BZNllLZm5TRUlz?=
 =?utf-8?B?RTZ1QVJWenlNd1FjRGRpU05nQXExd0ROZ2JYTWVMckhXQjZDcmtmMFR0T3Na?=
 =?utf-8?B?Nmo0clFONGxmNlJ1Z1FZbUJvOVpiK2l5S1ovOFBLSnA3VEowYkN0Zjk2S3lY?=
 =?utf-8?B?MGxnQXVjYy9DbUpzNlJDWlJrV21YdmdsSUZES0wreEhMRFJsMlg2RGVBWEZQ?=
 =?utf-8?B?NG9tRlh1RVBDbW1QbjBVS05hK3YwT0FONEoxRnRXZXg3YmZnNjJEYjlsazBE?=
 =?utf-8?B?cW1tbUpCazF5RFdQUDgxUEtjcVpLNXFsbytvVFFuRkowcEtrNjZWUjRVSE45?=
 =?utf-8?B?ZFR4WThpUW90SmN5ZVBBUmJtczlNZlBNbEFMZnhkb0ZMYm9ReWpqc3Q1OXJC?=
 =?utf-8?B?eEkvazN6MjZjNDlqb2RnSWpTaW1nbHVuNDRETnppQUpRTnN6WUJkdXo2dU5X?=
 =?utf-8?B?bGNwcDEvNXg4Wkhqd2F1cHZCOEdxQTBhT2VtY1g0djJSSktrQjJoRWlvLzhj?=
 =?utf-8?B?WG94OEhLdlJjdVhZYVAxSTNWMC92M1FDOTEyclpNRzFGTUJRVDF3Tmd1YlZm?=
 =?utf-8?B?UUI5cE5KZlNCSit1SFRjSmdyeGc1YjVoWkJUNFlOZXl0S0U5VkIrRHAzQnB2?=
 =?utf-8?B?YjJzRWhrNE5EWUluQ2hvOUNoT0QreDlpTVhGb3dYMGlrV0tOQkIzN0QwN21U?=
 =?utf-8?B?aWRZSnBPNlE1V2VVall1a1NYNk9BdTNzMjFNNVQ2R3d0YkExNE1YU0RBa08y?=
 =?utf-8?B?UDFkUWoxdTN3NEx1N3ArcjJQMDFxdnFvQkUrcG9RdkJQQ1JyVys3cjh0WGpT?=
 =?utf-8?B?UTJ3ZjBiS2xCWEtkUWRrY09UVG12aHRQUVNyNmlSMDRuaUVNVjNVblM1OWJI?=
 =?utf-8?B?b2V6ZFMvS1NQZDkvclUwNGtPQm8yeFVRMGlGUUZHL3JZaUp4K0w3aFVVYU0y?=
 =?utf-8?B?Q0ltM2dCMkhjT3lqbmdXN0wyRXRmTVpqdFBVVEplcFVnck1NeDZ4Qlpvb3Z6?=
 =?utf-8?B?Wm9rVlRWNWt6TnBmMHA0ZUNOMWRnRGpVdDBhT3VTM1dhR3NsYlk2bFZnNEdw?=
 =?utf-8?B?YVd5S0UxNE1CTlpwMWt0NmMrTzBQN3M2SHJHWGp2SEZEZUJpWmtseC9vMDJT?=
 =?utf-8?B?UEdXTUZJcmtGeDkxb2M1WUhVdDB5UEdUOWgxcGpOMGJudjJTSWU1anNMUUtI?=
 =?utf-8?B?d0QrVlZYUTZuSE5uaUoxT0tkOFpTUFpROXZOVmx6K2JHMEdhdG1Da3hnUGJ1?=
 =?utf-8?B?U1BSaForaXlvdGRlTDNIVXl0MDIvTzF0U29QdHAva2VXcEdNVWsybWluOFFW?=
 =?utf-8?B?bEplZWo4ZXFlRmlGcWV5QWNESlpvT1dmNzQvY0NNa1NQS0JKMUdsR25DdmdY?=
 =?utf-8?B?emdCM0M1QVNSc1RrODB2cTM0MHA5WHJtV1pRTDg3b0Jmc2d3SnlkV25ibnBr?=
 =?utf-8?B?M0dKUVJzTXQzbjcybm12TTZxVGtoN29WdDBxK1lZZk12dGlkbWRyU3d4MjZ4?=
 =?utf-8?B?SlN1MVJMRUJiZ2doNXRldmd1LzF4dXZRNWU0RUdSa0s5Q3BzVExQUHp5Tysw?=
 =?utf-8?B?SnpRQzdLUld3b3dnbGgrckNqbkNvaEZra0F3TjVRV1hOK2tBWEZsdz09?=
X-Exchange-RoutingPolicyChecked: tEMMv3KyRpQWU15+NRqo4QJKJoeb9v7sUv/xhLj4PXzt8XKvMXt/O+Roavo1DJTpewJGqKs7Q3hdDnXqACBrVvtVSJ77OUpqL9fVc0LOBrdITvlMJS6Nx1QXxtUmSqIIqK7eRCroTQcGl21n+tJn/Mp99oEQGFHSppmPql4TiiUe4V+kiJpZBNZgisVOxwkxSkmbbdY+wwYFn/I2XGbj82oM3fD5o4k66yUpLbHGDI/90fFgnEi4i0mwnHA8OHMJqrJr6CUKWYTupMos0s8P5diwxUZOmflUSarEUeGSRwRLQbOje3emq6ikpCOEGa4i9QPEYH+jf/EHMQFcd+E5sQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a985aab-9df4-4c0f-2365-08de8fbea81c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 07:16:56.3666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JgBolBaOMfUlOcd9QJI756nQvxkDfiPj1NOaunDp2VcQXvW8U/EQzPER5bNPJzBgisbYQ3gXUQZhvLR4o30w8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8684
X-OriginatorOrg: intel.com

Hi Michał,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Grzelak/drm-i915-lt-align-xe3plpd-with-VS-PE-Override-layout/20260401-092928
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260331183332.1773886-13-michal.grzelak%40intel.com
patch subject: [PATCH v1 12/16] drm/i915/buf_trans: compute LT's VS/PE Override index
reproduce: (https://download.01.org/0day-ci/archive/20260401/202604010401.ywwXdvN6-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#34: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1796:
+                 /* FIXME need to check correct parsing & table index should
+                 * this ever trigger.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

