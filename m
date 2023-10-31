Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FDF539B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Oct 2023 02:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7LMf18J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698719321; x=1730255321;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zmmoCnVAJfyAz8i09DwAdq38BZQBn/FVlGv3BE3VZkc=;
  b=V7LMf18Ju7xACtSQMXmGjPjNF2jrMfCH8bEQusYp0N+EeQcoaOQgwsJu
   m8YPX0YsHwvC/+RLFGgwvTSf5rqTTqCmjYqd+SsHAvhUf9H0MTL/lFaCi
   ibGKmgCsr5AyreA9sL8VczckyXzLcYGXQ7IonK4NapJ/6i/SOf8+DtO+p
   93KBi/V4D638F8VSYYleSIgxFHhFFZ4pEfSTQyanvvk3UqQqMZjROD4TF
   2UOBp09MAedftSe9dt9nzfO+GTBWr9ZnIgiRYyz3oA0qLgmJZCoPGhn8A
   R38/zzEQa7MclVKMaxE8PWngjjcOw5LrSjWvMqIouMTqfodyV2hdldPZa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="1077147"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="1077147"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 19:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="884066259"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; 
   d="scan'208";a="884066259"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Oct 2023 19:28:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 19:28:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 19:28:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 19:28:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4zoIRJbNDvEKrO2wU/oRMZSxQtsfHL373DSAAtPzKDc2mRFE51sT3PeEt8FL/CNqP785o8/Jgikejixx+1jmJDMNNdGHd4gb8ecUwagCeg7Owqu0deC/rEzoIrY4r5ZbL7H2fqLo6X0ZLLfzcKTYs9QA6Kwd1j1PHUZXZn2RE6ToMasv2tdBTMzEiK+KMIQflWvF9RZaHnhqMHrMPjsQnEwIEfDkh9Ci46u9AK7TwRxK3PZxAavRtaYX8GBdL9Ij4tZK4tc5dG1lGeg+zemLFxz1PbfqUbQ6wthtwzwjrODBar2mHuRn5sIidtP0r9mkveHmy9eN25EGE4DbMHlBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGfejMuxHDzlQqiMlGVLWOEdOGzOYLkNCk1QDs10Nm4=;
 b=FpcZMf93MHqXOqhkLOdAIC51GK/NKcQRsfaHDa892ukGhAi/axiPPXljx2BcfLPNikzSQ6OBPDuMYeB/A/LglmbWdc0WzUUajYJb9nMRj3Ks5Vn+Lq2qA2voAC15G/IpwEVhNM5Q1wN9a66L2nntAF1lowf0PoUZ/hJSf126gkc5So7f8gyL6A2+VJgqRTVwOPDyHq40kd0dXT5sNeeSfa6AhhKKP26LbruJU4pySo+cJLCjW1THUrCKEJLyUsywbZJbfuEyHFAjmmy4EQJ0zcJ4PByKrCmys4R14dkysyocIhcPkYk/nHAQSH1U8/yfjP18h5/TaJI5xg92RRfM9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB6649.namprd11.prod.outlook.com (2603:10b6:510:1a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Tue, 31 Oct
 2023 02:28:37 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Tue, 31 Oct 2023
 02:28:37 +0000
Date: Tue, 31 Oct 2023 10:23:51 +0800
From: kernel test robot <yujie.liu@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [RFC PATCH 2/3] riscv: add support for SBI Supervisor Software
 Events extension
Message-ID: <202310302119.PQRASCF7-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231026143122.279437-3-cleger@rivosinc.com>
X-ClientProxiedBy: KL1PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:820::24) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH7PR11MB6649:EE_
X-MS-Office365-Filtering-Correlation-Id: 83faa989-4030-410a-2246-08dbd9b9162f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ABCYo+BHDq1oRHtK9NSalVTgCsoXGgUQfqo+uP5VSV5SEiVEhGlHC/vVtAoiihKVVMcDIw7kL5w3PgG/ZPdxiNAf5NXyNhgYPQ/bRuF/a9HMmpC2djgqApvtU4sE5kXwMEwY08hXbyuRo3GmmKUg8162b3T3soPZ4oOwny0s5k+DDtoPx+IO24Pxja7+v+1IvqJRzOgZ+xuuhTYZxcr5nAt24148FataTtZIuIO+GdPUw7u02orMFHaLjtWsxOkurTj45lMiXtvW2R1hM3xk90vdVgnhGwioYc+TKZq41/yQLzD1Z31pgem4iv10tJ7rOPUGbFyr7iV590Wh6/m3S9RLpOzDbaxPB3LSo01JJVeLBX2i3gMWPIcRpJW4yD8INbrYVzwNOKtVxQ8LPu6e9EaSqqDVqVrMz3T96lGJP1n7hyHPke7kHgCKakaQFi0uDglRUQbdXDKikUUDBEF0LQXbK1Rapo9k4dWzVw0X+e5nGq9FBQAxbVl6kkDFGcrhpIJaGEs5X3KIZbIXLmHUFrTlXO1hivJ6OLWKdGZ4XNh8m7UYKBRyFbFxTukRrmVqEi8an3Xo5NhMbw+JZ5tFZMKua9mEJX42QkXqhg+2hQN2jvlULtKFB0zVlcJtb3VdWr/SDRdwfX3k5aIrkQpR3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(136003)(366004)(346002)(230173577357003)(230922051799003)(230273577357003)(186009)(64100799003)(1800799009)(451199024)(6916009)(316002)(4001150100001)(66556008)(66476007)(2906002)(66946007)(478600001)(86362001)(36756003)(966005)(6486002)(4326008)(82960400001)(41300700001)(8676002)(8936002)(5660300002)(2616005)(1076003)(83380400001)(6512007)(6666004)(6506007)(26005)(38100700002)(66574015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Vb1MjY7NaM8npePc6N9uZxzGCX0SmbT67MQ/2/UE0hZNQEGXwWyjOjq/Re?=
 =?iso-8859-1?Q?Z7JCZ//zkecR4OzWk9LyVEYHR9LrG+dMNfj0ViUDzTXm3MAknoi4y0rhI6?=
 =?iso-8859-1?Q?rWVXDvbzutU/Cn0Fkb8M/7hJgq3ptg9sG6qO6VstEajONxgUE7cu00gtC6?=
 =?iso-8859-1?Q?fe0Aav8D9KAapNdSyAcbHwncoYO1jfl3SKvjLsyLG+CJoDP61iBEnuA3n+?=
 =?iso-8859-1?Q?WKR/I6ymsxz7hIzVQgPe6qHnT9+6K99xR4OxW79IUfeOfhERN/4fwK6jJN?=
 =?iso-8859-1?Q?EuGjflTlidJ6LiybsPimRhzJPRNhsprsGSvNjaN2PSkbyjgD3qmincbAVj?=
 =?iso-8859-1?Q?hi+DFzKhtF4C25qj+i+CIke+oOb1GFWOKzNsDb3aaVdcvSR8OWngQolEVG?=
 =?iso-8859-1?Q?FpHq9OpK3Cq+NGvuzjWdR8aKxdw7gnHaHjk/7VYynsFK6W1GUhU89DAelo?=
 =?iso-8859-1?Q?i47yYWwgFaDk2n1+i/O/wyYG51N0SJtYxVOILXTEyMlA1MuncepZHXtQzJ?=
 =?iso-8859-1?Q?Ax5yFL27CmQVuy95I3ShZEVFIi7d4PrjqFarobTFc3VIOjjZMFLmxv2IQ/?=
 =?iso-8859-1?Q?dJj3bb+jtjA82F7Hj/4/SqegpDWlgh9aCLo9+RFFCk5lZApxP9aPyv/Av7?=
 =?iso-8859-1?Q?TdfNz2oIYP5IvN+ZYK6ClExioOZJ7JBW/hjwuvs+zKzTxMEbZqzfyHUzey?=
 =?iso-8859-1?Q?LffhG4NAT91/Wy+HzQwruyken2dgjDpx3hLtJnOiH2lzfq5tRZUgEFh8rc?=
 =?iso-8859-1?Q?8/BLSdeL7j/Qu7gTsewLBcXNopzgeZlExjwXls2+LsSqN6yRudGvWcyPK+?=
 =?iso-8859-1?Q?B7/bi/iCmEXnTVb+n2xwXS1AuWXit/KcLuHVJmmF+i/+Gr7YljUjZadali?=
 =?iso-8859-1?Q?jY8MGPAAZeRUBKmwn1Y/vMNGyBBtxjWX86yA48oS2WUMlL56/dR6gmCeix?=
 =?iso-8859-1?Q?fFyVgXJT75T33Xmq29MnQOZ1x2AHRgUkHw9my+GVrDi0m1b0oIi/wxNEeV?=
 =?iso-8859-1?Q?rSY4UngJjvqLEOQiTYv3ZdOVZ0MYkGW9staNY+2uhHQ7SNkCrobCcnObpE?=
 =?iso-8859-1?Q?ApsKPYkG/Fb/8J3ihfvEYbsZWkgt9kz7pxoHZEAgI3ZBQu2tF/+ByFfFyH?=
 =?iso-8859-1?Q?JC0TFejA2Wdx6RIMfWFm/VUmE32KRK8SH14v7DRMso0C5PXT/hBJH0WV0Z?=
 =?iso-8859-1?Q?u/S0NmRZdpnSO8Vg074htiRdqJuoIiskYdDwU/zddBkgSkKaLDHOCrA7ai?=
 =?iso-8859-1?Q?sRznYQv3whAOJAfWtwaTnPwef80Lf4HbBQP5ZF4gHMxj+Aj+RI7aofOc7f?=
 =?iso-8859-1?Q?YGnVrLGs5epXP9+UgvJntnH5d3J8zeK2mbzOKhegI6ghnLRjaII3XRJOmb?=
 =?iso-8859-1?Q?nBZ1tZDWTyy9Sv87AL/0M7gYj0jPQyyis6UAQi6bqeK1io/IBqneElYCjK?=
 =?iso-8859-1?Q?mrcry8tn8OHvCmfkqxRfXR4+67VccxnHHTzXrLi+It0qYRnhTzoiyFIbsn?=
 =?iso-8859-1?Q?NowLgNbOkg6Jdlar7ZpbFVXBnjMfEOLLI5AWmVqHsofLlpEkBJ3vhSn6Pw?=
 =?iso-8859-1?Q?27u33EhbHa2F7Fc0rHwVtlb92qhGsDsehlRAdKY+324FZISLYDha0hZKy1?=
 =?iso-8859-1?Q?k+mwGlCTFhRNxmyfNKyvMlpA1EY/K5q4cZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83faa989-4030-410a-2246-08dbd9b9162f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 02:28:36.9489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0qHgBhHqVbeLUExGkcTRx5J/nHMIOwvm6CBo+h/yRfs1yEsMx5m3/YMfh4MoYFWybhZlEoY11MduuRN+ZepkXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6649
X-OriginatorOrg: intel.com

Hi Clément,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.6]
[cannot apply to next-20231030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-L-ger/riscv-add-SBI-SSE-extension-definitions/20231026-223410
base:   linus/master
patch link:    https://lore.kernel.org/r/20231026143122.279437-3-cleger%40rivosinc.com
patch subject: [RFC PATCH 2/3] riscv: add support for SBI Supervisor Software Events extension
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20231030/202310302119.PQRASCF7-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310302119.PQRASCF7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202310302119.PQRASCF7-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the asmlinkage attribute
All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/sse.c:36:15: warning: no previous prototype for 'do_sse' [-Wmissing-prototypes]
      36 | unsigned long do_sse(unsigned long evt, struct sse_interrupted_state *i_state,
         |               ^~~~~~


vim +/do_sse +36 arch/riscv/kernel/sse.c

a77c752ef9c2a1 Clément Léger 2023-10-26  35  
a77c752ef9c2a1 Clément Léger 2023-10-26 @36  unsigned long do_sse(unsigned long evt, struct sse_interrupted_state *i_state,
a77c752ef9c2a1 Clément Léger 2023-10-26  37  		     sse_event_handler *handler, void *arg)
a77c752ef9c2a1 Clément Léger 2023-10-26  38  {
a77c752ef9c2a1 Clément Léger 2023-10-26  39  	int ret;
a77c752ef9c2a1 Clément Léger 2023-10-26  40  	struct pt_regs regs;
a77c752ef9c2a1 Clément Léger 2023-10-26  41  
a77c752ef9c2a1 Clément Léger 2023-10-26  42  	nmi_enter();
a77c752ef9c2a1 Clément Léger 2023-10-26  43  
a77c752ef9c2a1 Clément Léger 2023-10-26  44  	sse_get_pt_regs(i_state, &regs);
a77c752ef9c2a1 Clément Léger 2023-10-26  45  	ret = handler(evt, arg, &regs);
a77c752ef9c2a1 Clément Léger 2023-10-26  46  	if (ret)
a77c752ef9c2a1 Clément Léger 2023-10-26  47  		pr_warn("event %lx handler failed with error %d\n", evt, ret);
a77c752ef9c2a1 Clément Léger 2023-10-26  48  
a77c752ef9c2a1 Clément Léger 2023-10-26  49  	/* The SSE delivery path does not uses the "standard" exception path and
a77c752ef9c2a1 Clément Léger 2023-10-26  50  	 * thus does not process any pending signal/softirqs. Some drivers might
a77c752ef9c2a1 Clément Léger 2023-10-26  51  	 * enqueue pending work that needs to be handled as soon as possible.
a77c752ef9c2a1 Clément Léger 2023-10-26  52  	 * For that purpose, set the software interrupt pending bit
a77c752ef9c2a1 Clément Léger 2023-10-26  53  	 */
a77c752ef9c2a1 Clément Léger 2023-10-26  54  	csr_set(CSR_IP, IE_SIE);
a77c752ef9c2a1 Clément Léger 2023-10-26  55  
a77c752ef9c2a1 Clément Léger 2023-10-26  56  	nmi_exit();
a77c752ef9c2a1 Clément Léger 2023-10-26  57  
a77c752ef9c2a1 Clément Léger 2023-10-26  58  	return ret ? SBI_SSE_HANDLER_FAILED : SBI_SSE_HANDLER_SUCCESS;
a77c752ef9c2a1 Clément Léger 2023-10-26  59  }
a77c752ef9c2a1 Clément Léger 2023-10-26  60  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

