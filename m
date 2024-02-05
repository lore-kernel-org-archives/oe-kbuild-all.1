Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D648AB664
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 05:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707110326; cv=fail; b=BGVe58Jvfyw8oisdMLrS9Ru9wFwVQhC2DDA6+eSIZjp5hRwaB2uAi9gkR5O5I2NfFUcBPLY8q36B9QeNwNzYJfYnut1bp3Q/2cvi/i7T4EOMZjarzXNLUcB6E9bRo1Q3Jx6DtU/yUz4M08Y/EUIv+TDnwamLwVq+FYiCZ5vYRnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707110326; c=relaxed/simple;
	bh=+ur3QQjVlVLQ2yzY7f0mAwzLfHZ8Fw5WylHRWCoD7FA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Dlj8s/RI7ylCMYqItxlkS+Ce57v2SKPjr0ENVAiQhsGasNrlrMUfaoLWJutGxSXsvfm0syIuXG1AyOabNenzwNJgt8QceeL3a4R4NB+f0K/aplmui/4NxXYOJs2A2Kd5R8eL2PJ8pNN+j9Wze95eo6E8Vdfl6UOiBrbFC9sRj/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cBEoloWU; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cBEoloWU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707110324; x=1738646324;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+ur3QQjVlVLQ2yzY7f0mAwzLfHZ8Fw5WylHRWCoD7FA=;
  b=cBEoloWU6gfxpZQ3EdtR8osNHMLqZYFXmq/1Y6xUdNfgn9D9uhMbXsNb
   oyyhubNaHH2QnijeYB8La5dU66ckngufuXpnuwqPWovrMacoFZvNFdeBr
   5RHLnj+ExS3uEir0xJmhAuZoZtD0n/7n3Xd/YxNFbpBYeAQp/+lTXmy9L
   XLE9/NwGWvOhyW1cACjTYEzNJQdT2+MuZFdzKpNdmxw36lpcy9YLAbwsj
   G7iNtTqz6wkInzbKsdbwX+JtomWLd3CJjW06FxUV0laFeC7wMcb8nxqk1
   bm2G7/xEAlLNu36JvswQNN+0VckIn34xOtIiDX3STR1FP35pOT1BA7WzS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="344866"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="344866"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 21:18:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="673111"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Feb 2024 21:18:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 4 Feb 2024 21:18:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 4 Feb 2024 21:18:43 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 4 Feb 2024 21:18:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTBzfpmgpCdaJNgKY3zn02hHkWmPsBk0P9hlRhwShsw1RnEBd71yhBCNQ1O2pdAOW88ofCFRWg9bhfAocssT377PPzNjreAtnPmylZmO41ZRPPZRVDxi7XprFD420y5AqHCwzyrwOS0nhc1fyu+G+5ANGCZGewWZv/DzKJhJky+I8McrgFoiFGJB6v8nSfmxlpzgVXnlE4bHYEPcilWd82io/L5UNSNCsYqlhPrp0B9gaQKwnyQ9vbMDtG4AnHHKv+Ra/35ckI7ljl6HHlKkjJEFWJOt1c1R1zoeSdzGRbs7KMEOmtYJoOK0hShe4Lj6RZzu5HRHIqXEoXKirex2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+6F4h7h/962RoPoU7+gUmGe9p4uN/UVcHJjRRvwBC8=;
 b=JUT6bj+HlXGSWWJKmXVgqdLr+dvfaityIrD4ohIkyPCKgrblY4L5yRkSStaMW17PRqky0sZzMZYvB+fb2XCOCc3z9GeVnyd4XVw3AP7m7zsvpfjIhbeOo3N/SHsP5V4hatdQ5/vcS7th8uCT36DbMBUW8DX8U5Y/hz17Y7ix+NMSvQYXdtUtG07L0CFCqe+LpPuAJCNmcftf2DwyvHT2uCeswq2eMvhj1Sw1GjQQLxHg+juWd8kVuJ/mqExP61G1ywFDEpvSz9zh8KIREzCwJ+hF0iKha9e+UySTeppUOdw9hfEAkcEHEFEKZ8afjwJkooFH9aLGtuh1uFmdQynATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 05:18:41 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%5]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 05:18:41 +0000
Date: Mon, 5 Feb 2024 13:11:40 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: Hans de Goede <hdegoede@redhat.com>, kernel test robot <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, <linux-doc@vger.kernel.org>
Subject: Re: [linux-next:master 12610/12662] htmldocs: Warning: file
 Documentation/ABI/testing/sysfs-platform-silicom#20:
Message-ID: <ZcBuDHWVO1LghgER@yujie-X299>
References: <202401070202.BQvPxgyp-lkp@intel.com>
 <97f7e278-725b-4453-aae9-6a80664920c7@infradead.org>
 <23509de3-beab-4afd-b76f-4d675797e7d7@redhat.com>
 <7531b72b-e44b-4135-85db-2c75c4805c2e@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7531b72b-e44b-4135-85db-2c75c4805c2e@infradead.org>
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 004d742f-7b84-4b01-a7d7-08dc2609ea73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Ka8UUtksSA11ghz8C4ixMvXo+6izQHjrCE94UecZi5rzuwDHbVB5zrd4moCtIRmqgWPZQJHXE/c5KIpW2OCg8b4MXadmJWRX+3PHCKVinWmFfASCDjWn/zVwsBhotCdSL5U+lDt2o5Bnkp0IcwL6pDlRNvw49s07ILzro2gHkR0wvmSobZeJGAQtEc4kZ5CtnoXmlwMFFrrG+rYrGtdonY52lKHm/ilI0VZzLrZXN12hMqUJu4BlqXik4bX2RlH1vYhbRSm8F5hX4bHS/QRigKGEXlCqtV13MoNO/i2whdXeaud1FFZEyqSsGz1o2P4y2k4NjQ/a/zLWkWT+THWT8sLQodzZvn0DNj3HV7gQI8iSlh+qjfUAYkI1zfZdA8ML1HYK9VjnJL4x9HUl1o0n8WS6ENndEmSAWTzeNygyrmA0IaTAEkpC+UsjMAKakSHDyxZH1CMzkpz4pMpvPns62bz5+lIJ3c7eolglvztHpS0DIjn8AMlzmMS4DtmlfIstzAdN2HrQvIvTJ58pKkqVwkC9OYQQsTtRli13vncrMUAxrBnd+SpUAV+GB7FCtP0ad6NFD5CtHSYCoZTSGoNaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(396003)(39860400002)(366004)(346002)(376002)(230273577357003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(316002)(6506007)(53546011)(82960400001)(38100700002)(83380400001)(26005)(86362001)(41300700001)(33716001)(4326008)(8676002)(8936002)(9686003)(6512007)(2906002)(478600001)(6486002)(966005)(5660300002)(66556008)(6916009)(54906003)(66946007)(66476007)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lgsl7R92HBZNT4dkHECmj2KHnCa1Uq5HHCwJO+K10aOgVfYLuQv7itOFfdzT?=
 =?us-ascii?Q?pdh3saMlqNjDz3bg1x212peVUjFF55HzYC6SXoWLgDDp3g/zb/vz/wguC74B?=
 =?us-ascii?Q?96PhvpJrEylxY5ijU5YyA56t0BASDLTI4NbQ/WHq2NZaxdUcz9WKD6Chy0LT?=
 =?us-ascii?Q?vAPhTfCJ5LMFu5kTDBNziw+uJgk+mrmqu3lcqMgBlXy+saBdwDmKSre6s9gQ?=
 =?us-ascii?Q?N8ITZqi91WeAXvmjBDyjKb8cmsUUDDfsCXHPTNsRxf8vQTCscNT5pa8wZsdm?=
 =?us-ascii?Q?A+VrJZQiD3VWttbqH6FrtYZ7dQChf9XBj0WR/muxtCsyXR+X66emI3f4loHz?=
 =?us-ascii?Q?DecUTKkziGToKvT0Myp2ygHFRmxe9fh4cu2pIJqfeY+5+UkzjVd0lP3qhJho?=
 =?us-ascii?Q?tqJZ1M98PXq/WzV0Gfl+XAdvbFWHRKaLLcAaCcjFl8Cwyu/S9hAQo+LwjsEz?=
 =?us-ascii?Q?W/hHVvMY2HnjEJaJQthxLpjAuyaMuzP+iBp8pkZn+vakLHgk2aHuH3xxi2Uu?=
 =?us-ascii?Q?F8q38aZL5PUPytmARdYRANjmZir1eJx6xsp5eFjSon5EY+JH93K/nF/y2IoC?=
 =?us-ascii?Q?I8r70NVUGjMeosbY1cEQxsrdRVyHHr2Fro+3UfPPuNwtnaM1kd7ftE9EY8dt?=
 =?us-ascii?Q?OYt1lySqJMFSi/Q9/RSmBidgcsVwJo5g14j6l9iwvOVL5xy4Y9gpAtAwkh1A?=
 =?us-ascii?Q?1FZnsEI482AHZDFC7QxOfqZeG02vdVQ9oH0vSZYyi1khjccZ1qEOM4Aiv/8U?=
 =?us-ascii?Q?c/XYKx/+Md2yi27fnNASO9TGbSYjERRMBuEl26vfi6o5169iNYzI+jFG3G07?=
 =?us-ascii?Q?jjgJ6nz/DVFMbpWtU5Mz6G4Ln7ASl3oC5IioOttvEzgvLyUOPt0TNMgPSZiF?=
 =?us-ascii?Q?ddvrwGfVR1NCFBTFiSEWu80cOiAqI/95EOIIamvjDkZnqb0S0NA3P5UfD+O0?=
 =?us-ascii?Q?UgYf/C157vQowN8pBo8Uv7twLxwCTBgQY8/f436HqBaCNZHP6BXMl0lVm7a6?=
 =?us-ascii?Q?Bc21fG5563w9DtW0FXIt2DXFSDfGUQQiIcFMvAhDrnzXa9rK++iCmD7BXo4J?=
 =?us-ascii?Q?H/Pq1Q1tASPixuowfyPwYrkw1ABhNxnW/ZFBU5qhVfat8e1fOsdqtl9If0Th?=
 =?us-ascii?Q?AOC57wnQvJbGr/3ID2ExsyYPOYKJI5UWIhgJuUWSum1rmqmYbM/a0N+I5rFJ?=
 =?us-ascii?Q?YRc6m6an0OtIx3P1ynUBz7rYGwtT7IsyiNnmqPPkVG5gF1onUIv0tg0CaA8G?=
 =?us-ascii?Q?ebDU81pyisML7QfKoSCoKZFBL5cLyqP9JWwq1AzWD+s9Epn3EGiSV1XvzcbX?=
 =?us-ascii?Q?S0ZfRH0YD6HB0d9zcMbtkDhoAjGTlN2maMrAnz/xALvlFYbE01hPWnlzYRxb?=
 =?us-ascii?Q?zEnPLQWEIl+P7uoc9O5xBICZ+L0sf3g0jOwIOiKcTMosb09dFgl3WW/PUG6r?=
 =?us-ascii?Q?loL+umo+cuvWziZbOAHR9KMoHzGKi9EKS9dqcdRivuYeEpfYZysfW0yLbS4b?=
 =?us-ascii?Q?GnZRLWXyBgejGmVbUQfeq5IUu3n1E1MwodRilS2zE22u33oDMsuyMxYFzAU3?=
 =?us-ascii?Q?qOphsnVZftHanY47WPWsqMK1Hw7b6mJOgNQbHOjG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 004d742f-7b84-4b01-a7d7-08dc2609ea73
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 05:18:41.0781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3nCwWzRuia4utL48WLxru+FAYOXeN92kVLY++9QHLKHC803e/4mJkRfZL9V3ZpRtlThhBvnkVBRj8wqnVSZpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
X-OriginatorOrg: intel.com

On Sun, Feb 04, 2024 at 07:40:12AM -0800, Randy Dunlap wrote:
> 
> 
> On 2/3/24 23:21, Hans de Goede wrote:
> > Hi Randy,
> > 
> > On 2/4/24 02:26, Randy Dunlap wrote:
> >> Hi ktr,
> >>
> >> Sorry for the late reply.
> >>
> >>
> >> On 1/6/24 10:13, kernel test robot wrote:
> >>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> >>> head:   e2425464bc87159274879ab30f9d4fe624b9fcd2
> >>> commit: f24945c77ed4c57b602632b9e3cbf5752e202a6f [12610/12662] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> >>> reproduce: (https://download.01.org/0day-ci/archive/20240107/202401070202.BQvPxgyp-lkp@intel.com/reproduce)
> >>>
> >>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> >>> the same patch/commit), kindly add following tags
> >>> | Reported-by: kernel test robot <lkp@intel.com>
> >>> | Closes: https://lore.kernel.org/oe-kbuild-all/202401070202.BQvPxgyp-lkp@intel.com/
> >>>
> >>> All warnings (new ones prefixed by >>):
> >>>
> >>>>> Warning: file Documentation/ABI/testing/sysfs-platform-silicom#20:
> >>>
> >>
> >> but what was the warning or problem here?
> >> I don't see it.
> > 
> > This has already been fixed by:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41237735ccde2cc3fe1d83ae0b776a085be6a22f
> 
> Hi Hans,
> 
> I was trying to understand the incomplete warning message...

Hi Randy,

The warning message is:

Warning: file ./Documentation/ABI/testing/sysfs-platform-silicom#20:
        What '/sys/devices/platform/silicom-platform/power_cycle' doesn't have a description

Sorry for the incomplete info in the report. We will fix the bot ASAP to
show full message.

Best Regards,
Yujie
