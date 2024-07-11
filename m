Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053D0D28D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 02:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720664774; cv=fail; b=RZGBBvzgIwi7qyc6laG+2ic+su4BkyBFwxo3D+vlVZgEWf1OLZ0YcJ9uU0A4JfB49X9IPayxBKmgm8Dar51zRJDMZYZoY3njZ7H158kOtsGGgQwP9e13+GFkE3/f6+t9BS5XglPgvgx31s1sOfH/4qnnyp2EWhhTxJqk5I/JliY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720664774; c=relaxed/simple;
	bh=kj+RQbBizBYOsPI+BGqiCdXsq3A6C8SKx+TTsXuYh+0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uypwWF+OTEJxkYu5ux1KDd7J0fNs0Wf7eHf008H7I167EYwtesGrXgVJKyfM7i2c3/+th1v7GhvUIkKNXowRzkeaag1vN/FdqQ17ylSwAEBKLDc3fd/iaQ5FyYIH0vCsB56oVlYOW0S6WshYFsgY9yenZoo32wgB9sVd37+cQB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJ6+9vzQ; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJ6+9vzQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720664773; x=1752200773;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=kj+RQbBizBYOsPI+BGqiCdXsq3A6C8SKx+TTsXuYh+0=;
  b=HJ6+9vzQlNSQ/piuV6S+CHwWh/hcio9kkULkkOmt0YUMT4sI7Bhvkthd
   /9zUc0XSKBvQJSPHfM6HLGPJMnVku0imLp3U9KjXBikwQCFAT59R0Fmce
   AlwGi5oOx2suTWx5M0/Mlc4wkfwbGyWOm0rMhmbSoxIDQUsnPJ2SSzt8P
   e4vxvPVwJVJkqg/GIw3tW3tbSzpRLt8Mo/sxurjiSw0rmNPwJs0W6xzyP
   o2A8ErhaW2QCLDDMUIicVJgKAL/a57Hf6EI1m4L0pINEqmVhiNHRKe6Qz
   SxKmVOC+wEDWAThn1MSqkTZ7UBj+oi18fhrAm5JofTR1CyvE43SjaL0ZQ
   Q==;
X-CSE-ConnectionGUID: 1qeGcIvWQpyHFALHmA1sCQ==
X-CSE-MsgGUID: EMM/w2gFSM2XaeZyJieUfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="40540401"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="40540401"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 19:26:13 -0700
X-CSE-ConnectionGUID: B6uf/7pzS0GZ95jjgExCNQ==
X-CSE-MsgGUID: GEvLjU9sQ0qj51bMzx7rGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="53012708"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 19:26:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 19:26:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 19:26:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 19:26:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WecGcgzzF4S8ICj6tANvyziZgCxnpOesvlmRxCgWfM0RqdU4mF02TcxbkvZtGwudzW6M/z3dHos1WJ6uBpoDvoJffmeY7ueop6kTjW7aDw6PHoJeojXpFG4xjIW4l3IM6ju+nx9y3iE3QTAdlYbIQXyyehOTFTYNo3xOj5YGbFLz/LtntKv5Tju9GC1tg11ETdGtYadOc2q0SEpVBNYLvLnRDc7wiEkjVVDlZBMjHpdZAW4A1lx2WS89AIKSzRO38M9mYRtETmB7e0UuhgNJ8i5z670YcBUCOfynUoFJYh4r1ADcRN6yofdbjodbmluXLuO6eieZ0vU65hlWHPaSeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ARXwU5GZ40v7FfZUzvy/mirJr3d6buS2fRypRNTG58=;
 b=ogW0LELb0T0AnugrKvfTcNL6fk5v7BwKmOsABjgeN9ARsoJV+SzYVPO1JCqfmcvrTCcF36UWIa0jIO++zv4PvAJ6Srpxi5z1z3bz/sOsrhMRK+bRXdOUy/tXV6kPHs9daoCfZdv3VfmAlu4WKpk0uqqaO/sF0ZXkYj8vFcktOxkoz8XIxJTB7ycZt9ZbzpHGpRgdme1iKG8JQV+1tD+CHJoUrqNu9IAVSEcv8jllnNFwkhgQagSoKL70G/AayNTe39F5hj2t2RtjHGxb/kxGMtkSiGYsQ4dB8xQVkRdwn3vtysgCyH54CoPqiIY7/JmbyLFHD3cmERk6vt+jXp2ybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 DM4PR11MB6118.namprd11.prod.outlook.com (2603:10b6:8:b2::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Thu, 11 Jul 2024 02:26:07 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 02:26:07 +0000
Date: Thu, 11 Jul 2024 10:25:59 +0800
From: Philip Li <philip.li@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>
Subject: Re: [linux-next:master 10192/10451] WARNING: modpost: vmlinux:
 section mismatch in reference: mgmt_index_removed+0x24 (section: .text) ->
 .LBB3864 (section: .init.text)
Message-ID: <Zo9Ct9nUT7/nHna6@rli9-mobl>
References: <202407090029.a72M25wz-lkp@intel.com>
 <CACMJSesFR4L4wYFDX0xJKGqfZ80vq0HG3J+7Y1kWqodjqTS_Vw@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CACMJSesFR4L4wYFDX0xJKGqfZ80vq0HG3J+7Y1kWqodjqTS_Vw@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|DM4PR11MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: 67fd8c10-7fd5-4636-dc8b-08dca150d229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6pF3MbHPN5GjWBWypuA/e3VOU+xMM5WuvlW4CIX39rXfafdqYGYMZLO+V7wE?=
 =?us-ascii?Q?bhyZpj4tsYBWXNppY1vdmF2TPhrxtoG1h/sHcJSPUSt87ak6ifXlBrk4UJVn?=
 =?us-ascii?Q?RUEmhoa/FfCEQwsvFKg/lbiDYxsT/EPqu96VEzoymUFZE7rAicYfmM/35NOh?=
 =?us-ascii?Q?ou8LSYPKp/wKBVqQYYQMwkv9fGLwLUtSny8VHDIKXDfA/Zw2jNRMOr5+y26p?=
 =?us-ascii?Q?Bxp9gKuBwlMGCbPzshPHHFW0+fVHqIQmCLquXBxBDpSg5NeQAptczyyx/CHd?=
 =?us-ascii?Q?E+Bkf5EPu1/PXPDcA1gYmxWAAEmQbCHdNPOBTTAGtKoRD1UePgnN48IwEy6P?=
 =?us-ascii?Q?uvfpphzL9iUMxFyzdDtFKRAMw3wvC1vwxutshiTtnYdRyMpcw2IcHnuCWhN7?=
 =?us-ascii?Q?ppBBzCF0nYc/vdJa8Ag/rnc8N69cREu9EeOqbVAgNnPODM1B2r5y3qzYi2s0?=
 =?us-ascii?Q?ZR6zZj6MBtvh4tWEOzpZOchTKT3+hy9YlMUnCXXRM6ZbVmHslh2gmPKRtwz6?=
 =?us-ascii?Q?pxYY1yAr4AmsI/lxKZR640SP5RkczmBqsQ5Prl575omwkm3yM8dszMmBtHGR?=
 =?us-ascii?Q?K9H5yYQXVO5T3OkTvXBe+2RH9TBlcvruCfmwcbEuvjKmPfMN7e1ld+6MMNAO?=
 =?us-ascii?Q?cPzrx9cjOH/J6K/No75xifiHeLGHLe0KfSwowtJVl+YhxwxFduRDVOO2FMr3?=
 =?us-ascii?Q?snrOTOXRjqSRTYaZvVHCMfqIluF/6lZig9e5vuTaMj4RCVKSXZek6EqimJe0?=
 =?us-ascii?Q?j4VJj+Y2tuqUn3XEcnXrX9atD6rre3iGXWCfEsgAkyCUoPd3LAjTnqeyZQww?=
 =?us-ascii?Q?gUNAuCktdKaQa3h8s2kXeCVQL7lRUcLTR0zzZKk+jjjmIMgRkFBoBoc6eIpG?=
 =?us-ascii?Q?fd8TGH3KqCB6PNqtLTxn1hGi8Ifqa1LSQK3sdYV9FDMoguyMd/tD7wQa4uIJ?=
 =?us-ascii?Q?DRmhW0TtRSsm8WLCgO7D7hYVdtqPY1jPQR8frKJmj9YdWXL7zIhIkMbuVAyi?=
 =?us-ascii?Q?VptTRuzo5GbSVFQ77RMZj/E5SAj/vE4v7E+lh9/a3/Z03Fsh9d6JoEwJ5+lR?=
 =?us-ascii?Q?4djuPCSaVC4yOH2jJSXlgkLhHxZVaV/SDA3Uewiqty98vKCGvYM+T2CIpkD4?=
 =?us-ascii?Q?siTRm2vC3BjfCtm0HpZFwcfJaeq/FXJrVH5jq909PfK2ZBc64Tjx8PpMPuq9?=
 =?us-ascii?Q?Zn+/z/F+v/5M/akVt8tFCFk1YFKChp//ubickg0mCesXWYX0WuLfGpeLSEwN?=
 =?us-ascii?Q?2zGyZIVaAZU28xhTj+Pvj0QQkiGLLE4kQ+3NUis2OYfZrcK2RuBqEZvQMn0b?=
 =?us-ascii?Q?nzWBFxKddRO+e9Rz9VMRXclk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jCsSpNzUyxZAfKvB76F1soZgBhLvt3VKiaaXvPn3M2wFWJShcMXfLGmrvoR7?=
 =?us-ascii?Q?bIhIHI5P74kws3apVxHhC4u1pijdi3JLltudyYWdVaj+1e7s7tKGh0tku3of?=
 =?us-ascii?Q?UkTI0gyiRSjRDV8bN1jEhMaJKBbi2tMi/oGBC9JmC0ZeFbF/pbyDh7UhbRbj?=
 =?us-ascii?Q?taitoZ1lA3J3LyLTSjTEdpyrecyjKTGtNo8h3s8UuBhArOXOrF80f1o7gOqy?=
 =?us-ascii?Q?gpa2kXmUE9h/XycKn5V0HQKYxYYxDGzmgrBZBB0fOCPjRMNKc48v+FlYM6qP?=
 =?us-ascii?Q?p/rATtMFfNf73H7NRgLLPeJ6gg8O01aG4Cw7761bMLAmloQLkdvpUj/WkHPn?=
 =?us-ascii?Q?e2arwv3y2ZZMIggiNJU14f+IvZ4woPwWPmOtvmILy4imgkhmpywATratirm3?=
 =?us-ascii?Q?6GnP3ToOKUfPz6AHjeEVOCQDSYjWnpFzeUboQoQmIl8SWdzns+18fn0Ue3ML?=
 =?us-ascii?Q?NaRTqOfNO5JkSPh9ybTZYGBoMAHBO0OfAkTBo8DFmHD8xGqZdGn1SrHKh3bf?=
 =?us-ascii?Q?gwYcrhKgFuJtvdPmN2R2Q4Iqz0syI1PVsuQq428ZjWB0pKuONz4Y2algT3kD?=
 =?us-ascii?Q?vprQUmmhDnO+lk8KtuGQ8u4j7dqFQqfUIH2LgeAVQGsafNX/Sxo2oyXAg1j5?=
 =?us-ascii?Q?ZP8Dk1Q7e0R3AK5NW5Tim5XGBu9gzw0wA+Bkt39E+0H8Z5b1ssBkgYxDzohD?=
 =?us-ascii?Q?+ZgzqHndsh4lLDuOxuvKKB2WonUbc5xspSgQM9CC7F3Qsa20ewCh8W8sIcCl?=
 =?us-ascii?Q?UuRjnsN4CEFKzO5JEwaUV5DNr19bjpLNSfB5VcTXOnug3o6GSvKuR2HTUtIV?=
 =?us-ascii?Q?3PH2TA0wMI/M8Rl+f9Uw/xJjiE82sYvgVk9E4a/hKRhKM85lS2oyk3TDZYRI?=
 =?us-ascii?Q?cXByGfmQJGR6ftUkysj0qGVcEUmOMeXCQ/VWHYrl9FKs+3XWw2OzUlQ2Hrd9?=
 =?us-ascii?Q?jUd3R7w0K6XWt+/GeYHccQU8p24zjcpUbkS/5y4XdNNZcIfCHufnlV9gd4i1?=
 =?us-ascii?Q?bChv+/LkIA/VbAYkAyLkRutIdNp/mHwhYd4N5WOXH6X6lhty7e3vbklSMS4b?=
 =?us-ascii?Q?Y6O8bVMrr6zAOCfBTExvMZA7JsVU2EzNrBHPfPfmMwfdCax00hAtPeKPoZwH?=
 =?us-ascii?Q?K0LTgzKioFG8SgUHlHyyYS1+TVRww5LnGaE+/oj5r6vSDVZ2mQHUErLgDgME?=
 =?us-ascii?Q?xFU9VsmYQwGp62nt+fFJr0hyBF/SFSw+cECYwlE0V9eByNZFnz2msbxJMvQu?=
 =?us-ascii?Q?j0sFgGVy1WcyuZ4WHQ/dj0HMOJvfjkQNop6i2ZX9qxUIph6OzDJ5XToMdGWL?=
 =?us-ascii?Q?RQvHrZcFoWtvPCWH4TT2RMmuGTswC7D6yUpRAa4xeKLWei4OXq+SSY+R9Ham?=
 =?us-ascii?Q?qNFqEdkvYF7H12mA5dRAv6y0MuwXgxmcxkjk4VVJIwJgKXICNd6BwJE3D8ut?=
 =?us-ascii?Q?fnvOCYY2B2y2/nz9jKryqglii8eO+IEtFWVXete8WFOJwni8CYVcdxvhJcW1?=
 =?us-ascii?Q?UVtzVAgtX4Q0s+gEf1diNeIwHvXUATqZg5PvqynarO+Lf0XNWQm8iSqhJ8UB?=
 =?us-ascii?Q?EFGQKV4HKIk/4FCS2uMp/Xz6rzEU8ZvJ9T3t+WHg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67fd8c10-7fd5-4636-dc8b-08dca150d229
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 02:26:07.7859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaWhFA56QvYUEpcXKDuFc0zQ54Qs0TjF6/HpNH5AMpGavywkYRuSu7hkX4Dzyg9cp3rvU8TJjlQMRChsTPgBdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6118
X-OriginatorOrg: intel.com

On Mon, Jul 08, 2024 at 08:51:53PM +0200, Bartosz Golaszewski wrote:
> On Mon, 8 Jul 2024 at 18:15, kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   0b58e108042b0ed28a71cd7edf5175999955b233
> > commit: d009853d746532353e0d1517c75289bb7dbf0450 [10192/10451] Merge branch 'gpio/for-current' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
> > config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/archive/20240709/202407090029.a72M25wz-lkp@intel.com/config)
> > compiler: riscv32-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090029.a72M25wz-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202407090029.a72M25wz-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> >
> 
> While I can confirm this can be reproduced easily, I am not sure if
> this has anything to do with GPIO? Looks like it's an unrelated issue.

Sorry for this false positive. It is a wrong report which seems to only occur on
riscv arch. The bot will be fixed to avoid sending this kind of issues.

Sorry for the trouble.

> 
> Bart
> 
