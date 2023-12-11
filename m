Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E1F7493
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 01:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvcRkKQP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702257799; x=1733793799;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fQgzAx3JN2p8478svDa2q1rYfM8gE2F/YpurgMd/F4U=;
  b=hvcRkKQPKRbAhCE15XaGvyT/FbkgiEFg7NlnjIao/uils9qgf0l9JjEk
   sxjx0KW50B4SOKlC3jTLxu0aqEVYV9o7SztuSMW2KDbvdATMKCSY4LLv2
   fERztm1pj1FozZdTJxl/6N7JHDspp7mC+YKRufkpheQHXeTQPVWdKPTnB
   Oq3TnSuYnEsWc81HWc5q240jgyYG+W1u/XqC+QiartdYxsJ/ihB7XrmtU
   mZX4zRVpjpKV6icnG/Kz1nrYtva5SQKPePJJ3hVt0qPH9iGM5q6RdA/4x
   PhkloHtPTwRM5j/Vq4yn99eY89jpFQyuzhavnpB5+L5PbnbKIJBI/Llrg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="461055860"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="461055860"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 17:23:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1020036897"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="1020036897"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Dec 2023 17:23:18 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Dec 2023 17:23:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Dec 2023 17:23:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Dec 2023 17:23:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDuilHHYGICMs4tF8KpDFV7NeEHJD1rtjB9//PZFrImkKrFFBqNOc9IgK3PEStnVUrysx0ytllA9g3Se9Z9mfkiMpGJuS70gmYpVRjHEx1veufr43M2BXApdThttPCKiX+ZQpSt1dw5Je9wwFkaX0st4jUfUp2QyDwCHHMTkQkbXBOicYhg5SDacDlVbmh7A5sQjtgPalO3Z+1T9FKR4rsbt4lTH/wrev+7WqQ4u1vOU83+KEJrMW3+PInYDcCGoSkzqfpDTDxt9mg37R1k5ZBxfWXFu7Cf2vqFLXP0X2NaAf6Z8M+0S4gn+o+PjXYbbO2vU8RJFnG7mdCiumuP3EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SWROxhj0WLPMsNpBx/0ZoaV7MJ+TQg8ihrnurD/mraI=;
 b=YDUcBfYdiKJwfyF14jcwLkXnKp59AhTtCF0eRFzOiIsmQM4DkvqFc6mxxL8yrf5g61tkD7QI1rzI6lKlpxHJ1GMwOgdbqSrK8nhFXlYlBVLot05tgmve3zm/csMIO7RwQCdoJJJ/2Ip259MNgMwwy9X9VQDDi15M02CUhSiJIvcCbaol0zk8+79nRJLZ4qSOfCCBxCfW/oYMsuLwsjZyNt6aShZ0EaSwN5pRxZu7f9i8KDOtl9i7YxbfzyCBwkxPbKIL3W63lPnzL/FwB44N3E4o6nUEdDkRmz3DbjTnWbqNxyDUvcZfOf+Yw97D7U0+WeW7JNG9Yba3ABG+WfpbEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by CH0PR11MB5505.namprd11.prod.outlook.com (2603:10b6:610:d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 01:23:06 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 01:23:06 +0000
Date: Mon, 11 Dec 2023 09:18:35 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
CC: Mina Almasry <almasrymina@google.com>, kernel test robot <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, Willem de Bruijn <willemb@google.com>,
	Kaiyuan Zhang <kaiyuanz@google.com>
Subject: Re: [isilence:zc/rx-pp-provider 5/31] net/core/dev.c:2065: undefined
 reference to `gen_pool_for_each_chunk'
Message-ID: <ZXZja1UjyhyHDNiu@yujie-X299>
References: <202312102313.zJHWVLAZ-lkp@intel.com>
 <182d28da-8822-4d2d-85fe-5a1843905eb1@gmail.com>
 <CAHS8izMn0JhRkmvF1yEvk1iUdYmHNbxbs8GgO=0GX6Qq5uR80w@mail.gmail.com>
 <18a68cf6-7738-40aa-869b-401bb08bc41a@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18a68cf6-7738-40aa-869b-401bb08bc41a@gmail.com>
X-ClientProxiedBy: SI2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:195::21) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|CH0PR11MB5505:EE_
X-MS-Office365-Filtering-Correlation-Id: df9fe499-545e-4d69-3b00-08dbf9e7ba76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dXwdudxF3+AqtOZwW96+c3Z5l/2t/DDPSYw24tNiCJ7sJYnz/Ecv1JtaE9x51iOE6cM/f+u0QwEiu9to0CSa2EO0xCJbmWFnqaTKBt9qO3POHujK3d1nUcurc1qOIYTdh1/x6nRr6rBEEDxo3AgQhMO81Pp/adc5pJyheq79two5fbkdivFnjmgSCiVs82z9g0tNaECSESOzINiu2bdXtBfJdQZlCQYijFy02ZIYWi0sPQXDdIteikfRV6BPXwQbajBYNBvkdTiXEhw4XtAB4ifUZ+ATUmAlU4VomzZD2m4RWXoJUvZiuTQEyBk6GxW8jTDcwzstW+46OeI+sEUfM33t/HESx8riR8/4BrZR8rhVDztzh/mUmGPpcyELjg1z6WtOCLL40hfJISfx0HQmWOmTzeSYOL0+006W/U7yzB0gNoSUNEUnQ+5AzDyNlxlzRL+nmNnWnHjjuAlmHY0CYW728vj9LuxRjrVWj95LRYDII8RCgS8Eupiy5Q2tR0PNJGT7zPKLq5V2EYDjQm6gs1qLOl2xKagjJs3Iyl03+Qfy9NUBKiZYgOelAJWyua9T1y0nFxPN1c+HOYpANsdS8tAeDmLau/IP3Jdul4/31Q9Jo9YBqRFWuBNTmbYru0V7Xm0yPpn+1wzXWTDAGB/qzA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(346002)(376002)(136003)(366004)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(83380400001)(2906002)(478600001)(41300700001)(82960400001)(66556008)(66476007)(54906003)(6916009)(66946007)(966005)(6486002)(316002)(38100700002)(6666004)(86362001)(4326008)(8936002)(8676002)(53546011)(6506007)(6512007)(9686003)(33716001)(44832011)(5660300002)(26005)(81973001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGxnWHVjaytmRzBwbGFlUFNSd09vVW5HeUlXOHRsa2t0RU5LTGh4Q0xyNllr?=
 =?utf-8?B?ejlORkxVd2dzU1pPamZZTlVvUUFWMnZHZkc0cU5hbmczRmhLNWxoQ0d4T0lO?=
 =?utf-8?B?UlJGNC9hMnVSckd1Z1BCdmtsQ1IrVlQvOWFyaDlPem9SMThaSHVVc2V1UDhG?=
 =?utf-8?B?T1B1VXdPZzJQaWhHTEFWVUFHNlIwcE1WWC82TDBvaVF1WVozRW9BM1Y4VmZh?=
 =?utf-8?B?ckRNbDU5UVBwa0FydzdSVjROTG1obVhQVEV3YllZV3VINnM2UWxrWkJpaWRn?=
 =?utf-8?B?RDJNb0xaRURUOTR3YXJDWTlHK0JlVjVJcG90ajZRaHNqVmpJZXJhZi9RRzU1?=
 =?utf-8?B?cElTZEhJRWx3U0VVN3QzSFVYRjhxK2NoV2FSVEpXMWh2SWpiWm83MW1ZUHFY?=
 =?utf-8?B?Nng3QVQ1ektSeTlMTWE3RGpWcU5uV0l1QTFYcFA1bHpLdHpPZlJEYUlwTlRH?=
 =?utf-8?B?SlRUby9MSkE2Mm5MRXpLbEg3VVZNV0U3SFh5cTcxWEtQdGRNVHk0cWdMWGEy?=
 =?utf-8?B?TC9UaWVIWEtOc096dFl2UTJUaGZRMkdmNTJTQnpFOW84UHdZNkYyRkVVdEdO?=
 =?utf-8?B?RDNiUjhSNDBuNjJwTVprTXdzRVlTcXVaMWJWYjQ1cE9yYXNDSDFUQVdDa3ZD?=
 =?utf-8?B?ci93NDJ2OGovYnZpWU1RanB0bmxDWjRSSHlrVTFZUm82V0FRRTVtQU9tbmtE?=
 =?utf-8?B?TjlLT2tsN2lMdVpQT0RHSGVEb2lEMnZwUmFUYjJVNWFsblhEeHFRRGVwUkhY?=
 =?utf-8?B?eTF1RVZleVdaRFpKNWlRRERiRXc5cTA1aExUK01NVU9WOUVxR1o0ckRMdDVu?=
 =?utf-8?B?RmFIV1N5UTFuRWR4VUIycWFmOGZFREpyMzNJR0RlQTU2RXgxNEFURTI0V0E3?=
 =?utf-8?B?RkRTd2g5NHdKcnJRWnk1L2dKdHRwaC85NS8rNHJnZGhKTlk2Z2V3U1NIbEVM?=
 =?utf-8?B?RUphcnVGdTF2Rk1ReU5obXpTM215VWJyZk5Md3lqcVQzRFpQQUZQM3pxQk9m?=
 =?utf-8?B?a09GSWVLN0ZPU2NCUVZLWkpVRXVsMTVsNzVldGRuS0J1MXpBOGMrb21Fd0pJ?=
 =?utf-8?B?WEZ6Z0hwVVhuZVNSWUpXdlJjY3I2VExoUlFqUVV6anRVejJJQTdJanFHOUFN?=
 =?utf-8?B?SXBVdTdRUlc2bFl6TStxN3hFN1QwMFRxNlp0TERHNzM4cm9kMmpvVE1MOHdo?=
 =?utf-8?B?Ym5vemRXNS8xUEliZFFKM1pOUEVBR0YyUGwvWk1UQkwwbkk0bHJFbEpUdXc5?=
 =?utf-8?B?TGZ1NzRIS3IzMzRNdDU0TUIwbnhVUEV4UjI2ZmsyaFdKWHRHV3VvVjVkTEJV?=
 =?utf-8?B?Wmk3UWdUOWcxZE5KaHlxcS9ObDlKMG5wY1JvU3owb0tSR1NtLzZUTlhlb0FL?=
 =?utf-8?B?TUplN1lTQTdwRmNBaEJ1KzZ0QXlyRzh3bUU3WStlcFEwNGZTNjBoL0tzcWhx?=
 =?utf-8?B?WW1UM2wxWTJ0aHlpTGhMekxYeDhucUpzdWE5R2tGa0ZJdkVoK0ZBN1k3OWg2?=
 =?utf-8?B?N2djbTExaHh0WnZ4KzVxVXEwUlVSc0FCTU14eldIQ1JVdWhzZTlNY1lPVzVD?=
 =?utf-8?B?dDhVazBRTUdtWkFHUTlzaVZ2U3NacjRHcWRCMEZZNSs3Rk9iSE1kbGZNdEJ0?=
 =?utf-8?B?bzVEVHdjQ3o3NjBadjdaYi9YbUI2UEwxTk00QjhSWWhQWFlUa2UyNmZNSkdO?=
 =?utf-8?B?U3MxbTZ2REVIUERvRG1EVDEycDhuU1h0ZkpiK3lueFNONkR0TmJzMVpQaWpV?=
 =?utf-8?B?bElmZTFzTkp1dzBqcXVPTGJLTDdhSUpnMjNjdjZCUzNJb0JCSGlXUDJEaEdP?=
 =?utf-8?B?MkpXMjQrVWtjeFZ2Z28rWDRBZUliQXZYQ0EwamI1WGpPQ3ptR0RJWVpMdEpz?=
 =?utf-8?B?U3FENHJvMjRRMktsYVlza0ZkVlI4eGZmS2ZkSDg5ZjZKSGtzVDZ5TUx1Mnds?=
 =?utf-8?B?dElGbitMVVh4RkVRQ2RlbFBLN1pvRzY3a3Z2L3J6SjFISzIzc002VjFnbFI3?=
 =?utf-8?B?c05BTjdqQUtnaW1RSFl5eFJZTlFHVDh6THUxZVZob1l0Q3JpRmVsU1RXeEN5?=
 =?utf-8?B?ZEtSMVBIb0Q4dFZUQ1A3bldTMUFCUDNsUHpaZmN2MzFqVVNYSVJsV3JLSjlD?=
 =?utf-8?Q?iT6pSCgpU6gzVfkoxz7NuW1Id?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df9fe499-545e-4d69-3b00-08dbf9e7ba76
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 01:23:06.5018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEsib/m96nwQLvpZII/TCYF0NBv5lFWXpWq3rwFlZp8cOI9LHegkVQJRu2shE3idt1jucb+Bgy1WL8sfa4GCWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5505
X-OriginatorOrg: intel.com

Hi Pavel,

On Sun, Dec 10, 2023 at 11:15:50PM +0000, Pavel Begunkov wrote:
> On 12/10/23 21:05, Mina Almasry wrote:
> > On Sun, Dec 10, 2023 at 8:54 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
> > > 
> > > On 12/10/23 15:45, kernel test robot wrote:
> > > > tree:   https://github.com/isilence/linux zc/rx-pp-provider
> > > > head:   4b8de8977565096e38b6da993c68da6f2ef9b89c
> > > > commit: 161f99ad49ca48fa141161b409eac11a6b63c105 [5/31] netdev: support binding dma-buf to netdevice
> > > > config: i386-randconfig-003-20231210 (https://download.01.org/0day-ci/archive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/config)
> > > > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/reproduce)
> > > 
> > > Ergh, I have no clue, why lkp thinks that it's a good idea to spam
> > > about someone's non-release repos, but just ignore it.
> > > 
> > 
> > How do i enable this on my repos? I have branches on github I'd like
> > reports for:
> 
> That happened long time ago without my knowledge, but apparently
> you can just ask them
> 
> https://github.com/intel/lkp-tests/wiki/LKP-FAQ#how-to-request-testing-a-new-kernel-tree-on-lkp
> 
> I'm not aware if they have filters for what branches to test

We do have regex filters for this. Please check the "branch_allowlist"
and "branch_denylist" entries at:

https://github.com/intel/lkp-tests/wiki/Repo-Spec

Sorry for any spam on non-release repos. Do you want us to stop the
robot from testing this repo, or could you provide some info about what
branches to be tested/ignored so we can set the configuration for you?

Thanks,
Yujie
