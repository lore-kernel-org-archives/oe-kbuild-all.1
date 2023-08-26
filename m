Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872E8190
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 00:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693009128; x=1724545128;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+3TDpsSUBxk8xzeKrCBqguR6Nh7HlQNxb4/GU7Ye9X4=;
  b=eEJ1RxNhxWyjzi5kXRKSJHWLMkv3PprlCaq8n4v2B9Xm/DBCrlF00JCQ
   TBE/maW/4Q0UBd933CPRZuLXxn39QeAnBSmSHfxxkmKjPbPElOg3DqVQA
   QgeqXzA+Z2P0b/6JHZ0VdyDjrqLm6pV5SveoCY1gOt8D+W3jHILta2Xqc
   o4I803nvv7GOlG16J/Mad1uK6mnFaf96M3YLa5jqRuYpWxMX6hPftEYo9
   PH3IXF0zrRGX0M0uJTDnZlZqpkDrCLkVNMJ56PcqK/eBeyXwKl8CTJ1KA
   a7maI65d/Ao2sxJBOLBL5XV0kYkUSLCVSjcAlMgIqiGXQrir1xxaGhava
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="461194129"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="461194129"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 17:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="687499636"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="687499636"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga003.jf.intel.com with ESMTP; 25 Aug 2023 17:18:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 25 Aug 2023 17:18:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 25 Aug 2023 17:18:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 25 Aug 2023 17:18:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 25 Aug 2023 17:18:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HiKclQvUlNBQOAsLxTPRZZ+aodqIYlpDoXUdK+2t8dNuE/ofjp3nhJ0rYRBMG9Ph53eyr0Pz8zqXiaT4lvzOZ3hh8QH56qObCnW4pSU2+UIfLZ9mjoPxVeWE5H62J1rszdB81ORIm3WFafqp08Sg6ljJqnbi6Kdtvw+Nd7JmureMm4g/5rpf23rx7n2cDJVCTXRWgasa8s66EzQQz8Tv2ddF2SRxCQ7yUt1lKbZqSluQVstwrgjN9V3vGuVoC/89T3Dzw6bTXxtOVvqCjho3iH0HmLad0YWCqEv3nc/35/Orn8Sz2r137SLnoKoRGpNuPMqN76Rx+caYFT1QmdLNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFXCrwUfGcK+H0bjL4ZyUess8wuwu4YdI6CccSQR+V0=;
 b=RwruWdI6f1wRx67sJTuF9sZ/7n7YjtFWb6Piixgtk4Lq2+FF0JUvgASHC/JQgKxwkhBFoXqlIGu2OhGKDd7CwtlsBBuls/PMC2L7Ia1iFysCgf37J0URJHwhbPIVi9K+0K5T6CvfhfqN+qdFW6B23L3iwdhNvwV2E89KZnERXBFBvbFmrLSxuCLFFG74qvxZvGVJtNstLISAnRuJ9ShkozTqM+P3q8sPQYS+Tpa7qm0QBIEnfxuj9zu1HGi3EvwsV6tGYhv3Hxmyf7t/6zX4cG92khqtYDRt4Tr/ahz/uQzWZ/7G7rbwOZIxzFPNlrb4JZBthteX6YuZjk9zz9f/Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Sat, 26 Aug
 2023 00:18:35 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::d718:207a:ec74:2556]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::d718:207a:ec74:2556%5]) with mapi id 15.20.6699.027; Sat, 26 Aug 2023
 00:18:35 +0000
Date: Sat, 26 Aug 2023 08:18:24 +0800
From: Philip Li <philip.li@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Avri Altman <avri.altman@wdc.com>
Subject: Re: [linux-next:master 5069/12910] include/linux/build_bug.h:78:41:
 error: static assertion failed: "sizeof(struct utp_upiu_header) == 12"
Message-ID: <ZOlE0C8lm3EVS+8m@rli9-mobl>
References: <202308251634.tuRn4OVv-lkp@intel.com>
 <b9c87261-9358-a76d-62d2-743d8162010b@acm.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b9c87261-9358-a76d-62d2-743d8162010b@acm.org>
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|PH7PR11MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d75072-e772-49a7-c6dc-08dba5c9fc9f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OK49epP+L/DR2tSPqkH1rpbwK0AMS8ZE6hR36zLhNEgWkGXefNKg2e+gMtNWgxzSIEv/PuQZPRkLnMH7r+v4Mb+SdL1QM1GcTx0NiH3qQoQVJTmRYZcKV83AtrS3dqJ4he/muXe/pbuX1rJwLf5xxnAW4/u8ZyUmiSfCoO4MHjhv5pazzTaTxj/EUmouhUwktOMa7PtYk2qSz3PblSMgd1+TRc1V3sx19qAZC/lMB9I9IxHdnAYdD++KJTzV30Zf5Mj6xict4ub9LfpuZUOery5u9cfEIyQdIMC8T0lWtI0RtR3yVfy4ikLpADMwa8NdyprpzLTMDRnNPMKx6qEqGEMKuSguJVOzfXrUFKiYUORLNT2b3EHN20pNGG9h70ZOmUSXQ4Clch6dEotomGFgA+TVATGtpm5pBXoNEppqq5S3pGQyFOlhbsycXq5YibINP+7M2njmMeKz7IuVnazlp23xST79ZxPTk+rWwZ/OHFcO5Wia4G6pBWRStgFZkubpvJQjppwN33rK+6HzIWPG696JVTP/Oxe6R2312dzJeN/42m1jdDppA0UDlRWLIrsUSSm+cxiLmM3Sq0AhU8WB/m7QyxP7lCJsQQ/41QqWQr41LNf/bKkkHDZ9qbc3RWGDP2spaU5Ju3kas2iDcTLCxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199024)(1800799009)(186009)(44832011)(6506007)(6486002)(26005)(6512007)(53546011)(83380400001)(9686003)(41300700001)(66556008)(66476007)(6916009)(316002)(2906002)(5660300002)(8676002)(478600001)(66946007)(8936002)(4326008)(6666004)(966005)(54906003)(82960400001)(86362001)(33716001)(38100700002)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IteBfRpuVz2UvX/tzvweYXG9SLaOSMSR9a3xNs0W/NJp5OCMUH608/xByQ2n?=
 =?us-ascii?Q?NoHqHXU6sZWU2qq0Th1WmzYevpTvceYOhQ9plbmvuQxMT3b3kjvuE8R5Y2aS?=
 =?us-ascii?Q?APbVhzuQb6pr8N6XjXN4mjVdM3M++AyBuHkWpCB9c8eT4Wd89Yd/6GB6KQi+?=
 =?us-ascii?Q?HamaTLVCdzewiS9nlp6EB03DuIhPXv8p0Mw/3IZu2BhfwEKY2l/oHxAMSxV7?=
 =?us-ascii?Q?G7qxzaURI2R/cXecdf6zvbG7EeFmP8Q/F6d23IEb7fUDCKrcDnCxN3E+/4qM?=
 =?us-ascii?Q?UJ3ZCvJ+g3i10LENp9Dpmhg7aWwJSlqnYUT7F+7TwLMPve6t29DU+niGTp3e?=
 =?us-ascii?Q?Rc7Js6ae7XQgnTek4qwOYZ1aHjUeKLImuLp/lElTGPdMOXSK/nQIuRHpI1S7?=
 =?us-ascii?Q?KnFQKHB6U4Q4Ht6ilhT46pwOCuD0vu13xGxu9aXUKqoMaKjsJHgW4EqLQdJr?=
 =?us-ascii?Q?ba5tOU2cckOuEAfPmkEySP5v82VIvcI21NxlVqirHfytf3z48iAxhw0GSNVQ?=
 =?us-ascii?Q?ed0dM23yy+qDyZ3MGUcz4h67FGx9QDGfWYAFgOzbXdDN/BOklj6KOGlC4hZJ?=
 =?us-ascii?Q?sHXPigfX6jZdqEFTXPFQ/mWm1SyX2Ia/FzARbmCpTRSEBbsuy3IEOvQYKvyg?=
 =?us-ascii?Q?lLHwUKffzVzvrxPUNv9e/1zJriGyBymdusN6IOC9dQ/OL6N6aghjKVjkOTZx?=
 =?us-ascii?Q?asTzxlAacJVxhOhcM1zpqh9wcwvW+tsjLLODZzevNh9yzqR7E2g8ebI57nbs?=
 =?us-ascii?Q?GwLFThQvqrlYOKcP8Ra1o+aiHUp0zhS0Y7h+h0upv8VWUEEcTYDxt0Mgd554?=
 =?us-ascii?Q?MRUXYyY5ikSSuUHC1kNntKmhdaw9RzRUX/Is6k89NPABxJJoqvYDcoUFH5H0?=
 =?us-ascii?Q?EqNsMtcTwG213KuHTZfQk4SwVx6/4kfqXL1O+3DIzGdA9KF1tSl+4/4Wuwos?=
 =?us-ascii?Q?CcqYPYrq+ak/N8UzEs791lBtS8n915BjwFVs3x2/k3dsvBuChV/zLvlZrJRM?=
 =?us-ascii?Q?h4EwqLdDOo1sOix1RvB7mHg0OUjD9b59tGZecaQkTgBgeCSvzk2vcB098YXu?=
 =?us-ascii?Q?U+gAv1LQJyMiBEeE0wmErB0r1JvrkDgd/7Qhj8v2sVcsQdhUaRuuqpsK3tag?=
 =?us-ascii?Q?rFT3llc3sXExQp6J+2LHlRx4Nif9+77XAA0g0sYXkzcOLjYbskjdxkF2TK02?=
 =?us-ascii?Q?x+xO0+KQGOYn6JVp9AyBxQPZrOl0KkOJEAWWktHwRGuTycigffiXeDGguyRK?=
 =?us-ascii?Q?BrH0/bc/dxHLWqc1j8r94UawI2SAuBbN6GgH1gr4e/S5QGn96HNv/w2j8UGP?=
 =?us-ascii?Q?6zxnluoWDZLqKyT6xAy/00QfHxl4bD4l8s/WgItx2BgCuJDNi7pk2T36+CEv?=
 =?us-ascii?Q?9HmO3QCoBKktsTuSnDomVD99E+26EJT/AQT6e8VoItPVn+407hQt/nQnQawf?=
 =?us-ascii?Q?zHHMsJlrW7YK/QmQFw67lRgIu94E1aFQPTmVHIbFslQhOe2BbWSPtQlBEVTc?=
 =?us-ascii?Q?MVbcAhCvUioUIwV7lOkBtvQvsUpdTpv2ab3Vb0jayKpsC69A57Lf0nzfOtNX?=
 =?us-ascii?Q?HWUyivQzma7imHVF8aysPyQaGOuV4zk5492Kx7eP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d75072-e772-49a7-c6dc-08dba5c9fc9f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2023 00:18:35.2129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sra/EYYz+iShpYSGss7mOnvvfVjmjtlx24z7v9p+YiY6O7UGq4znPozM51Pxx40DXCOSec2uegTzZTepmfftgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6425
X-OriginatorOrg: intel.com

On Fri, Aug 25, 2023 at 10:00:47AM -0700, Bart Van Assche wrote:
> On 8/25/23 02:07, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   6269320850097903b30be8f07a5c61d9f7592393
> > commit: 617bfaa8dd50d6a3ffc8694b4696bf2aa196bd44 [5069/12910] scsi: ufs: Simplify response header parsing
> > config: arm-randconfig-r001-20230825 (https://download.01.org/0day-ci/archive/20230825/202308251634.tuRn4OVv-lkp@intel.com/config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230825/202308251634.tuRn4OVv-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308251634.tuRn4OVv-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >     In file included from include/linux/container_of.h:5,
> >                      from include/linux/list.h:5,
> >                      from include/linux/async.h:12,
> >                      from drivers/ufs/core/ufshcd.c:12:
> > > > include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct utp_upiu_header) == 12"
> >        78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
> >           |                                         ^~~~~~~~~~~~~~
> >     include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
> >        77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
> >           |                                  ^~~~~~~~~~~~~~~
> >     include/ufs/ufs.h:22:1: note: in expansion of macro 'static_assert'
> >        22 | static_assert(sizeof(struct utp_upiu_header) == 12);
> >           | ^~~~~~~~~~~~~
> 
> Can anyone tell me where to find the gcc binaries used by the kernel test

Hi Bart, the gcc binary we use is put at [1]

You may also give a try for the reproduce step [2] which might help to
ease the reproduce. If it has issue to access the url or other issue
during reproduce, you can try to

	export URL=https://cdn.kernel.org/pub/tools/crosstool/files/bin/x86_64

Then rerun the make.cross command of reproduce step. Kindly let us know if there's
any issue.

[1] https://download.01.org/0day-ci/cross-package/gcc-13.2.0-nolibc/x86_64-gcc-13.2.0-nolibc_arm-linux-gnueabi.tar.xz
[2] https://download.01.org/0day-ci/archive/20230825/202308251634.tuRn4OVv-lkp@intel.com/reproduce

> robot? I cannot reproduce the above build error with
> arm-linux-gnueabi-gcc 13.2.0 from godbolt.org.
> 
> This is the code that I provided as input to godbolt.org:
> 
> #include <stdint.h>
> 
> #define __LITTLE_ENDIAN 1
> 
> typedef uint32_t __be32;
> typedef uint16_t __be16;
> typedef uint8_t __u8;
> 
> struct utp_upiu_header {
> 	union {
> 		struct {
> 			__be32 dword_0;
> 			__be32 dword_1;
> 			__be32 dword_2;
> 		};
> 		struct {
> 			__u8 transaction_code;
> 			__u8 flags;
> 			__u8 lun;
> 			__u8 task_tag;
> #if defined(__BIG_ENDIAN)
> 			__u8 iid: 4;
> 			__u8 command_set_type: 4;
> #elif defined(__LITTLE_ENDIAN)
> 			__u8 command_set_type: 4;
> 			__u8 iid: 4;
> #else
> #error
> #endif
> 			union {
> 				__u8 tm_function;
> 				__u8 query_function;
> 			};
> 			__u8 response;
> 			__u8 status;
> 			__u8 ehs_length;
> 			__u8 device_information;
> 			__be16 data_segment_length;
> 		};
> 	};
> };
> 
> static_assert(sizeof(struct utp_upiu_header) == 12, "");
> 
> Thanks,
> 
> Bart.
> 
