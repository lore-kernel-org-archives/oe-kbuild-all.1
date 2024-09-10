Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA1D38DEE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 00:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725928845; cv=fail; b=say/fg89mdoxLsvzTDcMcpMucHPSITLPgRdOb+VtIhyneI9E0BlcOAnmnRn+v5fHeqJg3aOKOewSHLea8Z+lLABk6pfmYWdeJ+v3JGHsuoaM1meiP7osdMlRzabRKqQXZKkIUJNI3lVMSYs8cEl7LoIiu//QfgGbYeyWP9j6rvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725928845; c=relaxed/simple;
	bh=FT8TarOHuwit1RzdNeaG5uSpcnL5fihSWH8OPmK28Uc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pJg74VvqNDGa4B5+EBbUwkt2J+wkBgjqhBphzjmIX35NilEsEQH52niKQBMxYLeTdjR2lf5ssRBzpvYmSHGQA53Jjbr/B37rSEg5SUqi0BKWOvLDd3SGfxBVKEybpHAVf+ZFczF/hTBzedCcdEjrOT0lKlTIR5dYoP6ghx3dTp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mELMIaX0; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mELMIaX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725928843; x=1757464843;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FT8TarOHuwit1RzdNeaG5uSpcnL5fihSWH8OPmK28Uc=;
  b=mELMIaX0TUjX2HJcG0LeqjEQO5NE7TUd4hvLjfGSSOT21qF8s2Dn0VN+
   xP8FA3VtpT6JQetQNj21fdxfxknquTuL5Ssy0LhfPAbzoc8yEE+LxYdlY
   x7cjrJMzvQkG3Gh3o0/n7PELL7vNCuJ4kBr+s1k7sfXwd/7JSkOtNFFPC
   KvhtGx6e/9WmnyR/IRnyTTFlFCR0547ZLtZ0IxmQHk2VPD56cOTBsj9mp
   vHQJPjGT1QY4n2XTszciEsSSd4pgCpPWwIBdpJS105tx7bvQypR/LdaqZ
   gKRE9eaubP0Sr4XYv9m0cR8Krj61XW4Uc9shxUJWzMqnfI8uWhB+wlh8M
   Q==;
X-CSE-ConnectionGUID: 5d33lLY/SCqoOJP6bCFb6w==
X-CSE-MsgGUID: YgW9+F3ZSQitJ5EE/22UMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="35249565"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="35249565"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 17:40:43 -0700
X-CSE-ConnectionGUID: XPd6HBsoTgyrRSGJA5ostw==
X-CSE-MsgGUID: fKrutwktTBaFJrskFofYqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="71241324"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Sep 2024 17:40:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 17:40:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 17:40:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Sep 2024 17:40:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 17:40:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9RfRUyQo55jvv1Z+2qXC4COW3dVIWzG+FwMSZyFv3swLXVAnilt++RZhpcKdvUnCO5N024MJeearmjtzTwpEbmz9+kaIlbOrPuWX94tzJf1NYd3a9nOH856/D+D9EHJqxhICf6O0VAxU/kmZdxYgMaHnbd8bDFV17lZjYsuWaZllXqdHjlSMR0MnqpwxG2fIzbZb+yFiDAVrDcNEo88uTCccrvw6zTzvNbGF99NjlfhkwbYkqsiKIZg//yB8hnlQ3nccT7NauzRQkfQohw09Q58DNghzK4KVmnTsmMqAz7FVShZDhNGuwOdvdKvNrA117ED0v8GLJ9pwI2NiBTS7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsAkUQlzouzGYn8CofXwl9LsXtUsNGEKUWJ1XlF0XHU=;
 b=R796tYmjPgbX4G9qAeP/GnmJGU89ignRefF5eMUq9kpgbvpr3qf1eZ4a+1x80+5a7bDs+gFFdGOXqWIJz/t6eUt/qSAj3SEUwnfu9ReCW4K73eTWPY3VSqVc31kiVuxloO4rN4ptze4K39oYq+WLLFYTG/R0omyS2YEMTc33w/31R9Nc6bTWRofoGi9RsQfXwrQe3M4MLjOQdzZ2csUXznj+qIk+8jfbzRXcvG3vL7umDTO3w6Y1OBQSKo/UVHCq76HALmHwILPCvO16T64GxgrYkrHwZapbvRYrC1O67r2WCpb9+TloAZ6dyjFxl4KRON4vbUUWFm3zoGuAEnHCXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW3PR11MB4619.namprd11.prod.outlook.com (2603:10b6:303:5b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 00:40:39 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 00:40:39 +0000
Date: Tue, 10 Sep 2024 08:40:31 +0800
From: Philip Li <philip.li@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Neeraj Upadhyay
	<neeraj.upadhyay@kernel.org>
Subject: Re: [linux-next:master 3671/10296] ERROR: start_text address is
 c000000000000700, should be c000000000000200
Message-ID: <Zt+Vf2E42Qi5GdcC@rli9-mobl>
References: <202409090839.Gz712lD2-lkp@intel.com>
 <41c30910-93da-4476-89e6-e04911d723f6@paulmck-laptop>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <41c30910-93da-4476-89e6-e04911d723f6@paulmck-laptop>
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW3PR11MB4619:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e207e41-d336-46d6-454f-08dcd1313156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MSTVWL2Mfynl4EyLuJXoXBWWnyrgYqHxwTQ3mAGfmwjTW5teNKUYcTvszGiJ?=
 =?us-ascii?Q?y1TxIcIFeFrfEHjEQcAWVlbkvskQ14X0P7HCv1TnraGkQQNshPeRneR+zLUk?=
 =?us-ascii?Q?qszia34xTuGW1084LneHBfHToS6f+8ZXXx0/8Kr7Mi7xwu0vMTTFP/Cjaj9m?=
 =?us-ascii?Q?rf6m0ZkTzV4TIk6TCVkVGkL91qBvgUurR4K1r7zZVfWXilIWfzgVI/dGqCt3?=
 =?us-ascii?Q?E7iJ/Cok8BqNMuMA4/d0l6ak3LOyd5BCL/GDOb2OKG7wgb8vnnZKJBYRzT0L?=
 =?us-ascii?Q?ByFmHRZNhi8DpQ0Jykk7RUDJ7z8MKVcs9MUlYM8791DQuPtXKcUpEWN4JsGw?=
 =?us-ascii?Q?6Ah3YSdLGBxBx6C2aN3whx9rSa/Faj2xXmuUkoK1tclwb5X25M7gYqJ9qb7W?=
 =?us-ascii?Q?006O8gmw9UbD3eZZuQ2qQ9wkelKzFDVNw3dKDQoT1B8+ZLSjyW+MG9KHa66d?=
 =?us-ascii?Q?T666AzTAOJ9xM8+a62zyJOGGY5UXFrQ9rqG4bM03cpbWkawotFy74xPojMAa?=
 =?us-ascii?Q?y6jyDs0t0JmZHTCXExSqOHWJUfgIXoU+Xzgy0wolEaXedRs23Da8Y1sfQQLv?=
 =?us-ascii?Q?zmaa9jj4lR2mJpSfiyWLvo4nrtyfoFKGDSESFlDw5n6kCbEjftVT3QJPLqqv?=
 =?us-ascii?Q?4ViMoXqYm3eX/KLKZsnYEAqsBuaV8m1z2935RfMt1aw2Fuhpqb0uDaAWHBwi?=
 =?us-ascii?Q?fnmBMa6c0W40CQG8lNcuILq2kZTYaxr4MpdBp1aDZgZBmv1sSeHgZE3DU1pd?=
 =?us-ascii?Q?XFDv1LxVP8KZpzFpSStoFiuw7vTy2084zqyS5+ArSC/MGuKnE72OLz3U6rSj?=
 =?us-ascii?Q?zjAyEN455WrbUBRCtUCs/pcXMDuTVauoUjerofAKbyOrTRaod0YRVAy3Xctt?=
 =?us-ascii?Q?0pf8lQHgcB2ZnjUSxeg0GNHullwuobLIwVx7iw6HbC1BFANdohQcR/OnkWsE?=
 =?us-ascii?Q?UaJasRLoGhqOryzOi2MTxupehKbUZdZIu/KgX6a/Tgy/ckAPGPhlVV3khWRa?=
 =?us-ascii?Q?NB4Q69/v2VFngPBjErL5pGmUXMNM/WJCSjguRX/WILUy5SGUA+i8FVK590X5?=
 =?us-ascii?Q?QgwPtEFWImiituEwl/wNlHLbgiC1YBJBMWk2PziWQ1XA3BGoikQJTIghZ0/S?=
 =?us-ascii?Q?NfDeMumTN56XhfEYr61SxeqjQwcXMjAZC0wOn7TCerW2zPxX9TLcq03Zdv1+?=
 =?us-ascii?Q?lGQPwS3xcHAc+5SjlgLtL6Xz5oiirjlLYyspwGz3CUX9tWoC8PA753m85YGx?=
 =?us-ascii?Q?0OC633Aat6wPulcCI4Dn5GnJiogsNpJ0BH0b7eLik6wF5uAoDt4JPM371/SV?=
 =?us-ascii?Q?66kPobmB2ThBeKQ41UTw6ZrLDsMI+mH9rqiqaHXoYFFu+eI/S3KxZFYexpV0?=
 =?us-ascii?Q?3JQiIIs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QuolNHV90bIR4wy1IN8ne11velWAJuIcolOC2xcHtPdBKEKtTrxjQ9Z2uQBO?=
 =?us-ascii?Q?CjHHQ5IVGIVfqzgpjxoL7no4jHvhJ1n46h58LTL+Mb/IWC0fyT6MAepspbb+?=
 =?us-ascii?Q?VMKUfbYFM7CsraFl3F5UwODmagcixxGDPRysqc9/oo04e2go8AItCYsCUyZz?=
 =?us-ascii?Q?0gYdkhvnr674apyQJ3NtSsynCrR838oO1aWycxmcTt3seuD5elKXmSnTVOjL?=
 =?us-ascii?Q?nHMP+YGgNCns8SJcQ6CvxrgqnJZCky3cpP0PHDMz/b49VMl4B8+tCFO5KT1p?=
 =?us-ascii?Q?r4Pe4ye8SDkV5mc2a8QO/w2wcnU4mrqwg92yhmF6wzCOiMwN3Vr+vR/Cwvpp?=
 =?us-ascii?Q?YsmL0XuGWwJO4TlWvNKdP0+RCBHxB9NUqSN1pIz60loJLGdp+SxQ95uZPGqg?=
 =?us-ascii?Q?C7R3UYpVd/Mtuj/o4R7iF7hBHfyHQpX1d5NrETho/UJycp+vDtS9XO6i5b/+?=
 =?us-ascii?Q?di+IJbvZSLiFMXLHkO5MwabH3/qV3eLBpbnXwg9dGKH0aCqM5mVJiHEkQqXE?=
 =?us-ascii?Q?tUHi+wHt/Y2EIq2RwdrYuhKrOtl8Xvx4Tn8LtMrRqL3H9sbhqcGBkQ+/zG0W?=
 =?us-ascii?Q?Ulvh02iTwiunyxRRiBexwwRYyQMQ1iIiSPkZe+5IMe6OrPCqJv8LYb7WP7HU?=
 =?us-ascii?Q?5hXtVpVCxh+Npn4K2o/9BbQsckdfpbZWHPb6wyDEN/foE3/MCSYucaw8x0NZ?=
 =?us-ascii?Q?94Jiw+KpFgSD9YhVKVxO1MohbBofOzG2VG2mzCmT1l5Ria9egOdD6QB72Xx/?=
 =?us-ascii?Q?k4Csz1pwmDZc2LE19RovsfzCklFWvfYCRIBq77MAdZ+Lo6eXedlP4JB+Fq1C?=
 =?us-ascii?Q?bn1YE5e/22f0pxw78o59YKLmDkFmlGY8Q45+U4E9yrSGrDMnQUtmWCFkOZnH?=
 =?us-ascii?Q?IhTR37uNWDdTYHY+4Cdb3de/fz5ng5iDMplduPWZgLkbNv8h9vs1q+3C2vGn?=
 =?us-ascii?Q?xuo7fMU8MbDq/uWdHFLDydj3SJcd/dePJMA/8rOyWHYNaBI5yICUsg0yhuYG?=
 =?us-ascii?Q?xXwRBGszn8ulYOxT1le8cAZS1yEASusCeG/eHDsGvZW+Qga9mYB0QDqZiUs7?=
 =?us-ascii?Q?VGoJgV0ufE0td8rtTncERVjvFjzLfQbBw9l1cnUU2yt5r2xKpBfMxdm799q8?=
 =?us-ascii?Q?kBOw1L4RyJkQK6F1wy7MnE62+0l5B1JcSOo9T0qd7aqoGhyuaWfQhC385D3k?=
 =?us-ascii?Q?cX4KF7wE3VnaS1aRk8zPFzLC2jwvMGpsNzOGemDWJviE+FtYr0O5me7CWwTH?=
 =?us-ascii?Q?BLMVh0wp0pEl6pMf4UxgNUdK5DzRNpZB4NDpgjCS83J5k+hwM+tRS7tPDElW?=
 =?us-ascii?Q?OqBgQRtixybNrbq7Dg8ar6SWcgUr1Emw7wnyKJnHjPKW0kSROQK+uielFrUW?=
 =?us-ascii?Q?Ny3PbXIBMQjayJqjNgaD+N+KMRjwil9nGjSX7GiHpvkSmtuCNB158959UogK?=
 =?us-ascii?Q?Grb80VaEIjC/QrYj8uEAl5ZT8CV2QQ6RBf92P2T8RSk5RUNTwber2Ym03zI8?=
 =?us-ascii?Q?vzej7AiJNLQKumKPpEhwL5obrUaJITe/SvxPRs2ka/kRymJ0maFp1YcYxC4D?=
 =?us-ascii?Q?fNFyyyF+uuPv+ImtUigzzc+ZNAbZMq3H4YnZSUYf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e207e41-d336-46d6-454f-08dcd1313156
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 00:40:39.3920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sV4V3o7sbYhH6lAPejiW8hWPzjI8HrX4/Ei5iquNeiIWLr1okY5hfSpz9f7tXxJ/HFRTXtIP8B2b197rKwrZeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4619
X-OriginatorOrg: intel.com

On Mon, Sep 09, 2024 at 09:20:00AM -0700, Paul E. McKenney wrote:
> On Mon, Sep 09, 2024 at 08:42:42AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
> > commit: fe91cf39db0939ac8d523b5a1c31840f7cbe205c [3671/10296] rcu/tasks: Add detailed grace-period and barrier diagnostics
> > config: powerpc64-randconfig-003-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090839.Gz712lD2-lkp@intel.com/config)
> > compiler: powerpc64-linux-gcc (GCC) 14.1.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090839.Gz712lD2-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202409090839.Gz712lD2-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> ERROR: start_text address is c000000000000700, should be c000000000000200
> >    ERROR: try to enable LD_HEAD_STUB_CATCH config option
> >    ERROR: see comments in arch/powerpc/tools/head_check.sh
> 
> I have no idea how this patch could have caused this.  Help?

Sorry about the false report, kindly ignore this. Seems it can't bisect to the actual
bad commit, another similar false report is at [1] with a different bad commit.

[1] https://lore.kernel.org/oe-kbuild-all/202409100106.A8692079-lkp@intel.com/

> 
> 							Thanx, Paul
> 
