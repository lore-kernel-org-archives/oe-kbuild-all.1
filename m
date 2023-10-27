Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9DA168A4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 09:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OF6ewbyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698399534; x=1729935534;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZwKfTkGmX8+z5l7rcbau/P4Zb5kRLdJRqsHwRSPpT98=;
  b=OF6ewbyVGwes2bEjsa+uX8Kg4EHxqOHN7jvJYmSwx/xkzsP6HnDVVjH/
   u6bXCEQmkvxfj0lFE1TxQIaG/FfGCFu9WgfXm7RdIBQxMZEKDtsIRJvYG
   ytizZttQSdLdR6kJB5YP9DFhroJRHy540byWUaw8ezkFFsf3kxtUaPMRy
   Dr886QYbQHbq5s55G0n1kFZmRpedG0n+P2D+zwCNPHlZIiBgmc/f4+3RF
   8WSASMjxQWy6M9wRm0K15uF1mM1rLyJKqtXE9NnJlIKJJtFrutY/iUaYg
   zPS6jEDGOdM7uIg6gK760bhbsQPrs/Ai4T9HUukhEAcaMyY5AYm73cnvf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="372792893"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="372792893"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 02:38:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="784212"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Oct 2023 02:38:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 27 Oct 2023 02:38:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 27 Oct 2023 02:38:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 27 Oct 2023 02:38:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCjNBZaiL3n+nQceE9J/GNCTq0K1LRJVX55/llrJmDaxBcaDU0FvpPjbfTu82HHWg6RCGCVhgC58LxL8IjCBftLSamEv/44j7+hlCjVbgUUEAtp6IW1Za3B8d5h7r0ReEN+K9B7g0VtcWNouthuem8JGqwYQju9usGmCrQkdxR9P4TKIXwjWbziFmgvWilV6aiCXtrGQ7EJUqDXezp0a82PiMFrV8MmQGDOsvLGRKYInATm4azqti33jAogAoXlS7zjGu0VwXnC/c2fCD23QoViJpOEd0sKOSItS5Bx0/Hl8VJnpHs7z9tggIf2fHOMNjdG5mqAbZEZNaravJ8AzAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmJBOTY9dO1Voyr9l4pgQ+p3F3oZ8zdv0hl7Cxl+odI=;
 b=A3UTfXpPVnxSiy9MTMB6oPzFIzdeJnB7+YIpIyti/RRwuz6+5zSB8Ajuf+iaSiSX8y20GxD+7Jm2gRDweEnMS+uQeqbUdekriaugKYQLaxhb4xTL7/7dm2OVLwxhl2OgkuKW62BHmvJgubQeuaMyZB/S7iXazFMEzNwFhH+P8Rb1wc1q/vvK9C6kdO0lgl0JtB+GTDJs1ttoaCKI7eLP8pNVno/Nf3jZ2yO0PUYGLzP3o29b6KfRZU/eyMez3SeRMIVbAsNfi+6Mmidj6SnL1o47/2Qm9O3Ec14JOlZU9ww4s8JR3rsUtpa9WA8sikePAvWysLFaFfFXoreNzfnzsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MW4PR11MB8266.namprd11.prod.outlook.com (2603:10b6:303:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 27 Oct
 2023 09:38:47 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 09:38:47 +0000
Date: Fri, 27 Oct 2023 17:34:00 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Rob Herring <robh@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, kernel test robot <lkp@intel.com>, "Simon
 Glass" <sjg@chromium.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [robh:for-next 14/19] dtbs_check: ERROR: dtschema minimum
 version is v2023.9
Message-ID: <ZTuECBlqd02INzEo@yujie-X299>
References: <202310270254.99Gj7l9R-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202310270254.99Gj7l9R-lkp@intel.com>
X-ClientProxiedBy: KL1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:820:d::20) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MW4PR11MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: bd3d7c88-7fdc-4fbf-bf3f-08dbd6d08495
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a/mliLApycrtQFIAKqUhXP1vvQJD10VVkzkbtAMZzsWmswenrmVxeesyWC7fIiRyEqXhD/TIB4o39SSAGUfwFQqv+PVzKo6MO1eH4XtH3MZp9mIiHNN6mDLIbSDilCF+82m4kK2iauABU+HUCt/xT5jVIWcZQFRyEzmDRAQBsOJbWqioP5y6+rUJv5GBqsV8tssYSaJI549pRglT1w6OEKnsryrxatPrXMA75KRW77umjlNPOqogGp6vaVEpbmtNsDHuCB4/2/2RkSsFzueWjF+8uoJKxVjNFjVgrPLSSWB0IOPjFCv+mSzYp/N2vKoijz53t5c6TePxzTFY06JYzd3Sgz+917Jw422KYYyH2nrLETSqs8FCwef5YkazZiIrMj/4jH/5Hq/6gd44HptizBee8yq6Bj3IhWuk6y5+H6XAbqlbrkhf5EaYNCSyYzfuFdt9QjhpYfxq5fMd9QhWK1Xza3ZsQxuNaj4y//YyehzYwlqiSlKSbUMXgLZo7fjFgG4QNjxpwQQRX6kAiRslMgIagZ4dM1GfTLeJZjYlY3vbXookxf5CXpNhbEoZV++x4naRp2n2AplYn2QkoHfPeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(39860400002)(346002)(366004)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(66476007)(2906002)(86362001)(44832011)(38100700002)(41300700001)(6666004)(54906003)(478600001)(6506007)(66946007)(316002)(6916009)(66556008)(9686003)(6512007)(6486002)(83380400001)(966005)(82960400001)(5660300002)(4326008)(8676002)(8936002)(33716001)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dMNtWgd7MpN+gAwU7B0/RG5zrvS0yirY8HCD9SK50nlHyN5WS5CGJiAIvVzm?=
 =?us-ascii?Q?nAkVda+Nw/qvsr92PVtBGbrX8sJJH+c6jzMvhHhGJRJK5STuWhkjOCHU1Pti?=
 =?us-ascii?Q?TJFFV76e1WPhYfnGRCOD+ipBESSVEHZeKq1dG38Yq2tbEJb+HrtPv5RLJZxg?=
 =?us-ascii?Q?9+Qe0/17b9yoMlVoSm+O2ZJpZyO0dRkPGy6vOr57L04onMjaUcshDo/NcGeP?=
 =?us-ascii?Q?Ij2zQFJt2Q4ixsqvMpVffhGZvwvJH7PvatOTHEHk1eiBErhJuxg+6jTEvfhy?=
 =?us-ascii?Q?pD2Xg3quYAF2bhwXJj1ERoHJ3NFJHUaR4MN+cMDZhb7XpTJPMmj9oH/8+a2C?=
 =?us-ascii?Q?m+Aq96UdeUrxzontKHqyUGmAX5OBq+yqAWs+3+naraf6lF0/KlXXTqRkxXPs?=
 =?us-ascii?Q?6qR62uZxNCXylq/NOHrhBHbxYNy9d5WCNxP3rvmkxQKrZ/9G9D/UmV+yMqCY?=
 =?us-ascii?Q?lRJsOwLJvC9TTMfylgsjX3K67o/ysN4vUs5BCBFk/PCzRRiz61rcwFg7XDhH?=
 =?us-ascii?Q?RLPLSN1N5hk8zA8ju5E/EyC4RNwAfeURl6Wvn2MvNTPdY3cHJeuF3QLCB108?=
 =?us-ascii?Q?lhyZPW2KA8T80T13MK058y7aXrnuYt8kJrvi2Vt5G7/fzQtabmRSwNjyDfPd?=
 =?us-ascii?Q?4xay2aBLRIgTBYrdCdDoKt3r6TLandpZm+NGtBBjENfNxQ4T7nLPGrNQEeuT?=
 =?us-ascii?Q?ff+Zllu0GhDl/5rUBaDOu89T3w6BJFcQW8kLVjweCDn3G2Ud2WcpDw47q1d4?=
 =?us-ascii?Q?y1R12LWoK/BJmdJ1rLggfVKxKO2lyo4O2O+mHbUDv358QQdi9j8xGhilYF9a?=
 =?us-ascii?Q?9v8ahEy96x+l0VWiDpGIxBKCtKsijwyT8sgg0Th8l+a7Eo7ghfrwJR6ACO5H?=
 =?us-ascii?Q?bXPM7rCI/xqlFUmP0ippzk8Va92Agui69Q20V9hsWoeaBtle2QApe4GVGEi9?=
 =?us-ascii?Q?W1Vu7VL3t/LXI8foMVFLZ25rsfQTk7z4tBMUPIs4EwgMEM9rnZYM5acwW4po?=
 =?us-ascii?Q?OMPHp1q/c7VZm114Tdpxo7xpG8G12VOjVO2B49ZF4/h1Xin0rGgNCJW9NfHC?=
 =?us-ascii?Q?xfnxVDBPvEBU3Trms5PrHTIWxQDzQmGBLT2tq2s2KSG8UHj8uZpXphgkrftD?=
 =?us-ascii?Q?PvksE1yEwgdqAAyfilo/ki3sfle5o99ikZQ7n61iiDzeq3k4CX990Z/uOw62?=
 =?us-ascii?Q?LrLCsbTDvAaRavu7u152FUW4nT9CLzurAecjL/UUe+CKCQ1awFFgzHd0JknW?=
 =?us-ascii?Q?XAdnvEBI+l4AMrYOikuskUK5YKEQmuI1WZVTtRZoPR3+Aqe8th/S0lqxPN35?=
 =?us-ascii?Q?VUTena7vruxigS76PjRkAYJEzup8+9Jn3Gd5t9tEqV0oph3ru1pPBMBlrJ1B?=
 =?us-ascii?Q?KTnyu/ihivnCZgt6K/pMDV+B2m3KVnooKJxqY0K048oAfOdNJEYtINKizHJ4?=
 =?us-ascii?Q?pJER2Oxk3q3u3aIr2pZOdQ7xHdXQLnYEqezQ5ASjmLU4MyTDpfEvUq7Kw23D?=
 =?us-ascii?Q?SQZN5mcSIQvplQgWhLwuO3egEctrJ488Decou8LnyGI1T5PNMS/3MA9/E41l?=
 =?us-ascii?Q?qGfM+tWliFPd1vzy01m5pJigFX3D2BNFareJyTem?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3d7c88-7fdc-4fbf-bf3f-08dbd6d08495
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 09:38:47.0125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1QJJIiapofwZjS4DsfMhiJ5CRNHP0y4tFI5KbG5Pj3DsGdKXKGTxaexiTuytB5UVf4Cf7FrJXMR9tYOdfms8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8266
X-OriginatorOrg: intel.com

On Fri, Oct 27, 2023 at 02:26:40AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> head:   a31226cdc877133081b131c2e7c79fc94890b1c7
> commit: b32dcf23a03eb170dfaa482fc28d4b01d39eda80 [14/19] dt-bindings: Drop kernel copy of common reserved-memory bindings
> config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20231027/202310270254.99Gj7l9R-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231027/202310270254.99Gj7l9R-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310270254.99Gj7l9R-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    sort: -:2: disorder: 2023.8.dev2+gd5e5147
> >> ERROR: dtschema minimum version is v2023.9

Sorry this is an environment issue of the robot that dtschema is not
up to date. Please ignore this report.
