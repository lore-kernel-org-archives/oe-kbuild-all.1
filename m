Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2A9EAF9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cY320xts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696929535; x=1728465535;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=3XtdwgJEORNEicsB9UXn8d1xv0sJufJLbEvRiYLj3h8=;
  b=cY320xtsm6Vxljva8JVyIHX5AakEAJ7NMV7fpAtHYB1ZzgB42QLJmrxn
   1oHHvlk3VWKbw2TQuRzatGqyfh7THK8LDMbjQuWgmca8R9Rhc2nhYd4Jp
   M7eLyfTIxZzbbXA0wnE9Kt7QyOPUJ+rl0xM+GmBPvoSDPnBfr/x3oTRaS
   DP2Rya2cFXSgbSm0GSDGu873fBdMrjy3jkSbVSiQbE8agtNmcujc6dojw
   BxApuNUHDpeIHEwZVhHqVZwX31+6uQ3ZhdB8ftSw70yp55jusSu7LabJt
   Lj/YLeJfcEO5UtxHodrN+miUuP3uC125tFP1Zg7sp7DcBJdMCuQyWlVaF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="450843805"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="450843805"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 02:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="869607193"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="869607193"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Oct 2023 02:18:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 02:18:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 02:18:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 02:18:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 10 Oct 2023 02:18:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTTDo2DleqWbL5ztjuMkzds2gMHk9ZIBSHeSctFggLwb0maZ6vfBtOG8tWchtr5IOr9wIsghkjzq30jCVswaA9jGjgQEyCGcK+beRTIdw0XYpmCZZNS6IBx33tz4rcjnT7J6ESJt2yfM4oQq+Vum8POHclA2t+cZlPUxuAPgUuutNZ2FXAg76/FMsUe7WXcIQIaeN5WrMTtaVd8+56g/8vDtvjS43M5NOhAXRKz+WwXDxMCEs63wSigCkRTg7vc83LCygppttOcy0bN2Cd9sCizfFx8vfaNayHbiDrlAzGqpZhneqM3gLw1dV9ghRUNycBOcAEDztjcM77CnmGcFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DZWyKMXWnUdC/bEg+yoC3OLxQvyAe84B3+BJgxHg9KQ=;
 b=BGGGEgUxvLAmTaqYKKI9wUV+iIzb7mmnP7lpYQ07ai5ZaRj3M5fyy8mf6mmGqT1OMDwqjDpSTWoIOPyqUse0rllTeNVtvdkIsuhs5riBDjqTPcNgaG2aIKq5wdhtRaufu4eekaH+5e8G/rdlaks4tF6ez4YWTPxykhXKMJcXAHVmRw3H4LjdW2EBFwckCDp6rRwIsIGFnMoDJeCvF1u0dZDchvD486k6KtiBPcLmea5NSpU34WP5pbqOrjtxNMPueDs5DgpMqMrP41XEjG42B7tVx7aB4KvWz2GEOpYRS4zkAuqLVI/6gI2NHYSacPYHmPpMBrwht0FYRGsIJikkQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Tue, 10 Oct
 2023 09:18:38 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::f64:17c0:d3ab:196]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::f64:17c0:d3ab:196%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 09:18:38 +0000
Date: Tue, 10 Oct 2023 17:18:30 +0800
From: Philip Li <philip.li@intel.com>
To: Yujie Liu <yujie.liu@intel.com>
CC: LKP Developer <lkp-developer@eclists.intel.com>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH kernel-tests 4/4] lib/checkpatch.sh: set
 finally_email_out to send out report
Message-ID: <ZSUW5rHnkFoJeLxl@rli9-mobl>
References: <20231010085713.2187549-1-yujie.liu@intel.com>
 <20231010085713.2187549-4-yujie.liu@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231010085713.2187549-4-yujie.liu@intel.com>
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|SN7PR11MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: ae83ec23-2052-4a96-9d6b-08dbc971e324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WkkoIzH2ViTtDO3m1FxiDrN461Ovt7jIQqZsBO9IlNPcY6rq+2w3y52lVm3+5tp45tTPXqart2r81MzpdkvcGQ0M2cavaICFymYXwSOPGL9mi0hk02n/IVru37oChnWuxjtJWXjPBWvy9HSn9nh390v8fuNaIytDHN5mvMxWCTrve74DY/85lSvccvrhHKL8QTu/v8X3Q/12rT0b0o3asaZf/YYgtyvpd2hA7Gc3Te54IIA6wGIwvsGTM9l88+ylr+p0K6SFdP8u088XmbTHSpKHNxapMSuNiLKeroRQUnPgwTlgH/nWyj3r9rrx1Z+jxgrVzJSP1rMQX50KeVjExZc62BS0/heHgZPs9sCuQomfhy1NRbsZZlLD/iz1XoM/+ZL3gOQxG4BifiaFrS4DagkfLjXdS0+OKk4X7orZARpUR/MRCvH16r1Jr0iE4aOHSwV3Hhd+78FPg1fCSJemKGeM81ggKphcld+IUx/7q1OkDsEYFhQRs3ZCmx6+nIyei5kroIKDNPiQn73fjxZOwuPtbXxbLC3iidQpuAN+OrS58RbFNSbVSO1sqCTzZUVz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(8936002)(6506007)(6512007)(8676002)(6666004)(478600001)(4326008)(83380400001)(2906002)(6862004)(66476007)(33716001)(66556008)(5660300002)(66946007)(6486002)(44832011)(316002)(966005)(6636002)(41300700001)(38100700002)(82960400001)(86362001)(9686003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tLIt+o2r/i74UoBA6dLpWufkcLgxNiBUwof5im41kuBOkNdh2SnnjdMyFk55?=
 =?us-ascii?Q?3p7cD7q4a0qMbILZT1pkx4xho6YSEYlEPCo42MjIQQOZQN6oO1gJWozeAKO8?=
 =?us-ascii?Q?Utzwc7CMxayZTgeZ4E+LEXx3HkhSP4cT18+xx7iADmcOnKOORKzCLxivX58r?=
 =?us-ascii?Q?NqXxd/oRbzcpetBCqejFgflGXQcDFG6CvLGSJsxyBMcbw2+6/yDZcOBLpC33?=
 =?us-ascii?Q?O9FIvs+NDdsuS1koxhq0WlEomLKHLiYVMNEiTFxrp5WTZMzfvYP5I4ysUM6i?=
 =?us-ascii?Q?vvXv9q7N3QXTzicx2KaSk2zr8Ry6ju7LsDUvxN3uJFFy3GQX6qoYNSCRqIEm?=
 =?us-ascii?Q?7RmDzqdX40ceCe+6wQjnc/kCnkKSeyGaWv0Zoc23aDEc6qP24L9Taic+h8Tm?=
 =?us-ascii?Q?/z1zRR+U8R62DA0L95Ed6NTId2ViE/JhG0UwewMkuJxkZGL2vi0yNhR4ywP8?=
 =?us-ascii?Q?TR9otdtUecYmGA4bQEaBJombxi+S0XlbpbLuWqis6+1fp8dF01dtmfOUk0GZ?=
 =?us-ascii?Q?w6sdV4g68cpCm/8NhzUJj1D/94Ze7DUdfOF3TXmyL6BL+V7tAOupUSlNbAmq?=
 =?us-ascii?Q?ArMCsCsqKpP/ahABYGHcF196SIkKp9BLhoQg24U6TeKUI3F9CuD0SME5vvEc?=
 =?us-ascii?Q?PbiVBuufXviIocSk4GuXq+EQeOab9T8skdvnDzoTeBYLnV+AhMLxXDHL62ou?=
 =?us-ascii?Q?p4dDEjkK2vuV+rZVMfJI7czlh8my6kjsayYtMVXX4DJytmIzQkh97bQ0sUM9?=
 =?us-ascii?Q?rWHCFBOXg8t8ZEmOFooFIUPlPcGwBSxPqU5mDtnuJ44ORrT2l+NHrml9AiHj?=
 =?us-ascii?Q?FMn7mbOsAN/HZt5t0Du1H7sUsXyPiiAYZ6DlvZoDrF1y+xshNk4AGZ4Vlye6?=
 =?us-ascii?Q?/dhpLhhWbMjsxmsH5wZPgJBvRgT6a1blmlTNH4HrFe/wCl9eX9mQduUV+kVd?=
 =?us-ascii?Q?EVkfC5pjJuFyC3fN6cJ4zhcgyKdB8184fFelXeXJmNB9Rk/WgWKCZv8QYzLW?=
 =?us-ascii?Q?LXxljD9uIkPJPAntwEY1+V36i5kgOc/Z4YXKddJlBK1/RlmsXgVZ7xk0HcVZ?=
 =?us-ascii?Q?A97qwCcvQZRlAYw7BsiD2CIkA9X5bIjJCMZSeP8C5ZJMLPUnHw6a5/ibRUnW?=
 =?us-ascii?Q?YOVVJzJPSB0Qe8TLVYYNPfwnv0QM7wBFP1KNESjCi3Sx7xf1wirrhf7ewOuk?=
 =?us-ascii?Q?u0oh1Km9vsEZXbHPAPLDH8+Ab9SJZTxEFpOVwQgBj4CPE/VrUY5TMv6Viw8S?=
 =?us-ascii?Q?Ju30F9VfRJ21ERq8cLgiWf6+Ucpg4q5wFXqP1OMiJ3D1odBfatjenVYb7mv2?=
 =?us-ascii?Q?L8pNH4ifzJPHSga21Sj7lz5ABAAoJnzxY5s3DKTVzK2r9DQJTAfJfvZA1Ohx?=
 =?us-ascii?Q?MlID9KP+i2d5ZcJYAtQ0EM/JJjQW3qFEVdP2afKLpgu8UwCUW7XuoraeCufa?=
 =?us-ascii?Q?WYVNF6qNHHWvW9dD7Fos6rADMYpCR2H7uVX9+5EBugKUJbFhacbnyBSIualL?=
 =?us-ascii?Q?QqChEJH1qct+1WYnza5eyq2qG1ilV1dB097NpHyfgJa4j2UiO4Qo0hWycUvv?=
 =?us-ascii?Q?Le6cnsge+QxMOkB8SB6ZNCBS+UJz1H3X2K9Ze9C5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae83ec23-2052-4a96-9d6b-08dbc971e324
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 09:18:38.5542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30km5xYH/jMLvIqwzbdR3GLOnQxBozen32vAkP1G1DOVnoTNkJJVL756dLGEZ+y9VUsnnARwiRGuyrNBoqh2ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6897
X-OriginatorOrg: intel.com

applied 4
On Tue, Oct 10, 2023 at 04:57:13PM +0800, Yujie Liu wrote:
> == fix issue ==
> 
> Subject: [0day-trouble-maker:qa-system-test-checkpatch-5cb27d30fc3a281e830a2099d520b469e2b82008
>  1/1] checkpatch: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not
>  preferred. Consider using octal permissions '0644'.
> Message-ID: <202310101418.7qw45u1I-lkp@intel.com>
> MIME-Version: 1.0
> Content-Type: multipart/mixed; boundary="iI9uoeB3EPjtZ8AP"
> Content-Disposition: inline
> 
> CONFUSED
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> TO: Mariusz Bialonczyk <manio@skyboo.net>
> 
> Link: https://jira.devtools.intel.com/browse/ZDAYCI-18319
> Signed-off-by: Yujie Liu <yujie.liu@intel.com>
> ---
>  lib/checkpatch.sh | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/lib/checkpatch.sh b/lib/checkpatch.sh
> index a2f3ad376..e490dfca3 100644
> --- a/lib/checkpatch.sh
> +++ b/lib/checkpatch.sh
> @@ -44,6 +44,7 @@ email_checkpatch()
>  
>  	# MANUAL_CHECK=()
>  	# set_manual_check "checkpatch"
> +	local finally_email_out=1
>  
>  	local report_message_id="$(date +'%Y%m%d%H%S').$(mktemp --dry-run XXXXXXXX)-lkp@intel.com"
>  
> -- 
> 2.34.1
> 
