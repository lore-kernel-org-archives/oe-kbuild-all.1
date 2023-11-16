Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A956CA59
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Nov 2023 05:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/J/4dl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700113300; x=1731649300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/b5r+pgh2drAuFIapXMC8Mylgftw4MthinO0WFviQsU=;
  b=I/J/4dl8xflqjruBWttz2nWkNzR+lBfWSYM8Hv/ISvcrvo5mHYG6fEkI
   HpHhfOG75cqV0zF7a/n05YJO0an+OBjYf8NGnMvnToIxyNN1/Ftd41Gye
   1zjpWaqEeC61tHIYlajTiM6wLXHgfcbAYqvriSFwV/bNYdB+ccG7AYtFt
   Uv3XpwYfVpz4pEFqQpatA29fPnSCQV4i1AQUNvfdYjrrW/OFKPUq65xVP
   SWzmleGiJjq4ZT76Cn30AhSGNtCAsq2k1Ke1PTc6fPAVWoXqiGXP2MNKC
   CFN+rZhwMECEotlVJoLBYJuSoCIWcXJf2I4l3W6mmGyFJXpw79bM9whZT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="455310178"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="455310178"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 21:41:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="855874072"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200"; 
   d="scan'208";a="855874072"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Nov 2023 21:41:37 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 21:41:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 21:41:37 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 21:41:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieDZtEBbEiBlbAbme+B+cVHDfBKX3OOACi5Iwsxxp6CNSTtG19J2N0hiQlQko0RHF2NL6C+mzecWZlvHbBfbiCXqUU0NXKGHjOj4YYMiicRP+zlzPkuO+1ADQVSowEzR7Q/ZomSPXxydKTEBnbOGeJ0lfju0IabuTxclXB704mzZj1zCM6bj1/bYJcBaX45zpsyWTLtPkyzFwoGsKOFh6fakq/DBIEQ0UmlZ5mp26NgPH31HJ7c1I5y7H8ZeXDd/JDpLL6I5QGCtDxJq+jhL3DUb39kZi2+Vxufpe5P5KClak3/bhBDvDWfQhzwltO/blj8J1JUOwrytUy2t8l4TaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CXkUNDb5QZLeXemwGORzhsw0Rt1ylxfnhf7VuTr5Oc=;
 b=KzlreUPHDAU6YSQJM3QmFlgf5UTj3H87jUMW7AjNSZFHlI06meq07TOdWLIZLRcpK9l4bTbzY6RTFQyoLHWoorBbpmd9qCF/7eJv6sjF0uLscR8SgEleI/Lq7MSx5bMXLXZ9Ahv2+pyeNhehPQ//Mm0QTPihqxs6nBCCtD1lbXlb+/7z+uRBM6oH5h4GGcLotXJkihOPUfliM88McmmKgvSWJvUIGrZkja16uHTcH9O9wAxyVkAughKYGy0XGodWyc1rrxoxc2oPmvKMUGXPxCyCI87W/RijFKrlk3Y4b/sAp6JPrKQHEvIvGcEZSCX+azdPiEM0X68BunCppNzv+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SJ2PR11MB8499.namprd11.prod.outlook.com (2603:10b6:a03:578::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 16 Nov
 2023 05:41:28 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 05:41:28 +0000
Date: Thu, 16 Nov 2023 13:36:48 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [freescale-fslc:pr/645 132/15769]
 include/asm-generic/div64.h:238:36: error: passing argument 1 of
 '__div64_32' from incompatible pointer type
Message-ID: <202311161240.h8OnkbaZ-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::7) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SJ2PR11MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f5a0bd8-b860-4e02-d9e6-08dbe666adb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bGvkeF/phWspapDHiKJb8e/gm8L4Vxk9QPKMN5JEFKMwmch2LDjmXj86hR7/z5FZ2eGZiBibN+0fsDOiNOxFOhkC+Q0IolZndKuE9Zxa+eDvOdglaF8b45N6f5Qxq/novMqnNbL7uaERqaaOoCEcl/+infqhb18snm5LKz2jf02zBr8o0wXuGGJ1kdflsJy5ARX4W831HkB8iPatAaNvCNBH0qLPDnBcWvpr+7vBjOKnJ1oKEiPMLNM+Uo5RsRFDlxplFlMmWgtlPmfWB6SbsS6/4mQLS511znNlDmieJd21MQf6RoTnzlbgaeSY4kq8zl8xqu0h5IhBbJE1s06Omc5GYBcvQPEKTRn0SG63I0ymUKj2uPkZugZASuPVkE6CJxolGx/Qa74jThCmswp0bnmg1K87Td4mrBmSFBc2upXJyJxdj1lrlAKo9RC4tndQ30R1BpEz/VAjSkvmI2K053EiFNY6ggqlH5uP8vw10CybVpwzh0snlUN8AZDI9XrNwYu6oBxb+b2RCHM9A1TYmBkVkbixLouofITYGiCPRqMVvmRZzM1/kyFkgL4hDcVbL7lozj1hIn28Vn0HTqhGltZqFffrdNlP1nVJwee1hSgCQxlgTFA76BPTXwnHXFbb4iHOnlGe1Ni6LXdWMhNWT1OnVazKWx2BD1q8zdnz2AD/Gka4GtNUSy2lnqBYsRCu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(186009)(1800799009)(966005)(6486002)(6512007)(66946007)(66476007)(66556008)(6666004)(6506007)(478600001)(41300700001)(8936002)(4326008)(8676002)(2906002)(4001150100001)(5660300002)(316002)(6916009)(26005)(36756003)(83380400001)(38100700002)(82960400001)(2616005)(1076003)(86362001)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZeV/7xvBtvb3B8jrPb7JF0gy9MVJGN9wYLBh1dlaQbl+muKyJbZSpRfX6SFB?=
 =?us-ascii?Q?NbDj8FXcKNoSMduurn+rJqG3AYYf9KtXpPs9U/6ZCBEmG6eiTBoF6oHvS9p0?=
 =?us-ascii?Q?0aGOjRc2SqAnaQYQUDzzfRE7mCtL+IRxBujZWs6jZEuDp8o1BB8/8fwxrIQ/?=
 =?us-ascii?Q?oixMTC6exGAK/DuTOUW8ZmMIHJpND5T8QYCBPmutQKwb58Nst45lLTtxFa8F?=
 =?us-ascii?Q?Nd5IpdjZL9sDfFMLJ9FpWLBRbBWyj5KaroWpTAU18+XjzKspmDx+AsvNtiPw?=
 =?us-ascii?Q?8hHulgSACRD1SLRaKoagGbzQ80aZJBHNhj8ZhXXFcJYyDu8BSDRO5CokamuF?=
 =?us-ascii?Q?a581h4FTO6HGeIBd44e5VxCCUtEDpeDXZxvNRdwaabYCnzC9ycQgSnBm7zl8?=
 =?us-ascii?Q?ysXfR0ge+kPJK9AsPPNywCb0JHX48v6ZwrBXBL/SH5XKzOmjeT5+lfWCfZao?=
 =?us-ascii?Q?l2xGTLjVEmAbEpRGoxxx7tB5I/8+SFJ1LduC+xIBEoT1mXs1GxRWAQ64s1Ks?=
 =?us-ascii?Q?k1k8s3VjiA7JrT8tYsVLuuA27D941Uymv0CXbgAxyNkxHP99slmVUVLZfDK8?=
 =?us-ascii?Q?F6vJt3Q1o1JwzO1gQAacwYa5GNEljksXGR2sA9HCSatTJmrlRkxpQLTckuHR?=
 =?us-ascii?Q?MOx+GonCSeXli+S+y80k3BeDdFyzkbf2qQzcztn0GtUU7IlQw2wg9kzloPAV?=
 =?us-ascii?Q?tLgUABXqqZTkEOEUHFKN6op9kwGbmOKDfF/2/jOGH+C9C6wmvTWq+dfMlOd7?=
 =?us-ascii?Q?0AEl88EymIGssMRAs4c+GZhttGyVfSwxpeQ5hOtoM6OqdBtBZccnbxf2Tgpx?=
 =?us-ascii?Q?4gHOt9f/V2DazYRWVV9qw+Dw7YtzZcJMKNTGq3nqRtzg+zq1d6TY6FPcE67w?=
 =?us-ascii?Q?uXDbj3lFzQ1ezkl8EyZ5tPuqrxKYRikr/QETdYvgqL1AUux1eBn2xGo6lLu5?=
 =?us-ascii?Q?65ERDfOHq8fI04GH+nJkGNG3fnwzp4FwkdsldxMOThIYNN3rBleRHA+T6M05?=
 =?us-ascii?Q?Cdl9rS1uwSTYgps16MlIAvY/tcBZZgVlma6ugz5/9REC1FtbLQ/ModfZ+HuQ?=
 =?us-ascii?Q?F0Km+f6UkyQ5CG4TvJkWrpM9RS5LTkwZsWsQ7gSuNn/RfxBg6K6W14J+3Buj?=
 =?us-ascii?Q?zmZyLJFiXHcn/oT/AHTkMQD4dJ444ZMjfLDoi4ucBkFZfTHbWN9552T+TrSL?=
 =?us-ascii?Q?Q5fy5Nh+REUTIDtcgABBMjpoKbuDWAQ1Grw5rvKyksutQ8W2WP23U+hroeV/?=
 =?us-ascii?Q?wgpbhyartdRrdtjrSqBcercDnLUp/Nh4YXh/arcRnS/MAY11sM/cdTGdnp2g?=
 =?us-ascii?Q?9SZ3x6ZcyndGadptS3kaIK1UV/OuF8FkOZX/Xzs5xM8qIUr2smYfyUt3eH+Z?=
 =?us-ascii?Q?/lFgvh9/jvAOaHJ69rzIeVbPjhTO8CKN7jcknLs970/D9USTK7bKfWXQIMn0?=
 =?us-ascii?Q?+0yyL7VL4UO2DoG44Znp9Ppdlmn1uBThtotFv5vCzp16D9dlPPN7bP8xt4ZP?=
 =?us-ascii?Q?Ozf8ELrRL5D76O/CojjSaUUqHmW5qqMKLiXNM3MNaVBggSSM5BTsFrrWIZcG?=
 =?us-ascii?Q?dQe0SlIU/x0iaw6V9phknfGChCK7kOFL9/RR7/Iq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5a0bd8-b860-4e02-d9e6-08dbe666adb5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 05:41:28.1449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNAPVOWKq8RE1YIz3Sap6FWmluL646BSLhNXpg20Mq9Kny8WZVFFf57yDAVKzyUSX2n0D/Dv2E1CM3qostMQ3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8499
X-OriginatorOrg: intel.com

Hi Adrian,

kernel test robot noticed the following build errors:

tree:   https://github.com/Freescale/linux-fslc pr/645
head:   d9e9cb8ce9bc751887fd5ed53e0cfac82c8aae13
commit: a876adc3ae12aec519af4b9cbb6ed25f542f6fb9 [132/15769] MLK-24930-1: sound: soc: fsl: imx pcm512x: iqaudio dac
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20231116/202311161240.h8OnkbaZ-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161240.h8OnkbaZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202311161240.h8OnkbaZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/xtensa/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from sound/soc/fsl/imx-pcm512x.c:13:
   sound/soc/fsl/imx-pcm512x.c: In function 'imx_pcm512x_hw_params':
   include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                                   ^~
   sound/soc/fsl/imx-pcm512x.c:189:21: note: in expansion of macro 'do_div'
     189 |                 if (do_div(rate, 8000)) {
         |                     ^~~~~~
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12:
   include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'likely'
      77 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   sound/soc/fsl/imx-pcm512x.c:189:21: note: in expansion of macro 'do_div'
     189 |                 if (do_div(rate, 8000)) {
         |                     ^~~~~~
>> include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
         |                                    |
         |                                    unsigned int *
   sound/soc/fsl/imx-pcm512x.c:189:21: note: in expansion of macro 'do_div'
     189 |                 if (do_div(rate, 8000)) {
         |                     ^~~~~~
   include/asm-generic/div64.h:213:38: note: expected 'uint64_t *' {aka 'long long unsigned int *'} but argument is of type 'unsigned int *'
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                            ~~~~~~~~~~^~~~~~~~
   sound/soc/fsl/imx-pcm512x.c:193:33: error: 'PCM512x_SYSCLK_MCLK1' undeclared (first use in this function); did you mean 'PCM512x_SDAC_MCK'?
     193 |                                 PCM512x_SYSCLK_MCLK1, mclk_freq, SND_SOC_CLOCK_IN);
         |                                 ^~~~~~~~~~~~~~~~~~~~
         |                                 PCM512x_SDAC_MCK
   sound/soc/fsl/imx-pcm512x.c:193:33: note: each undeclared identifier is reported only once for each function it appears in
   sound/soc/fsl/imx-pcm512x.c:198:33: error: 'PCM512x_SYSCLK_MCLK2' undeclared (first use in this function); did you mean 'PCM512x_SDAC_MCK'?
     198 |                                 PCM512x_SYSCLK_MCLK2, mclk_freq, SND_SOC_CLOCK_IN);
         |                                 ^~~~~~~~~~~~~~~~~~~~
         |                                 PCM512x_SDAC_MCK
   cc1: some warnings being treated as errors


vim +/__div64_32 +238 include/asm-generic/div64.h

^1da177e4c3f41 Linus Torvalds     2005-04-16  215  
^1da177e4c3f41 Linus Torvalds     2005-04-16  216  /* The unnecessary pointer compare is there
^1da177e4c3f41 Linus Torvalds     2005-04-16  217   * to check for type safety (n must be 64bit)
^1da177e4c3f41 Linus Torvalds     2005-04-16  218   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  219  # define do_div(n,base) ({				\
^1da177e4c3f41 Linus Torvalds     2005-04-16  220  	uint32_t __base = (base);			\
^1da177e4c3f41 Linus Torvalds     2005-04-16  221  	uint32_t __rem;					\
^1da177e4c3f41 Linus Torvalds     2005-04-16  222  	(void)(((typeof((n)) *)0) == ((uint64_t *)0));	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  223  	if (__builtin_constant_p(__base) &&		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  224  	    is_power_of_2(__base)) {			\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  225  		__rem = (n) & (__base - 1);		\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  226  		(n) >>= ilog2(__base);			\
c747ce4706190e Geert Uytterhoeven 2021-08-11  227  	} else if (__builtin_constant_p(__base) &&	\
461a5e51060c93 Nicolas Pitre      2015-10-30  228  		   __base != 0) {			\
461a5e51060c93 Nicolas Pitre      2015-10-30  229  		uint32_t __res_lo, __n_lo = (n);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  230  		(n) = __div64_const32(n, __base);	\
461a5e51060c93 Nicolas Pitre      2015-10-30  231  		/* the remainder can be computed with 32-bit regs */ \
461a5e51060c93 Nicolas Pitre      2015-10-30  232  		__res_lo = (n);				\
461a5e51060c93 Nicolas Pitre      2015-10-30  233  		__rem = __n_lo - __res_lo * __base;	\
911918aa7ef6f8 Nicolas Pitre      2015-11-02  234  	} else if (likely(((n) >> 32) == 0)) {		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  235  		__rem = (uint32_t)(n) % __base;		\
^1da177e4c3f41 Linus Torvalds     2005-04-16  236  		(n) = (uint32_t)(n) / __base;		\
c747ce4706190e Geert Uytterhoeven 2021-08-11  237  	} else {					\
^1da177e4c3f41 Linus Torvalds     2005-04-16 @238  		__rem = __div64_32(&(n), __base);	\
c747ce4706190e Geert Uytterhoeven 2021-08-11  239  	}						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  240  	__rem;						\
^1da177e4c3f41 Linus Torvalds     2005-04-16  241   })
^1da177e4c3f41 Linus Torvalds     2005-04-16  242  

:::::: The code at line 238 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

