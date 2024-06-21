Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42D915B973
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 12:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718973874; cv=fail; b=V7o1rqpWsys+wFk0ECgx6CqisocBZXmzvgYfv7yoCIm556t67H5KS69MP4ucs8hVG5SUEXsuR8AyYuhEjd7LtE5IEhq+FpasmjRbUeAmG5IG9LwTolSSmBDYw9HxVvFDAhDUEO0gkCkOFMclV6xlHQkzUdlAUntSZd+Um4V7O5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718973874; c=relaxed/simple;
	bh=UYtDcloZeXt7HeapqFOlZ1O1Otv/8MH2qjmywzLt49I=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vDK5v5CsSQz6k0YZNj1k626QjOMrPsMhzrR11XL10DG/F9r4e9Vj2jTszovQlKzxusON/PU6sH90ZucJEoBko0dc4OEdlGnP9biyfrnAC/s6PifIX0faZJk+ORtROkJc8nSfsqhZk1WeQclyDZzuTB5slP6mjAjpKq82i/Muppo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RlMYf7Mr; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RlMYf7Mr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718973872; x=1750509872;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UYtDcloZeXt7HeapqFOlZ1O1Otv/8MH2qjmywzLt49I=;
  b=RlMYf7MrVOAocXUXwJC+CUFqFCW3qFl169LkWkYU2jRKE2wmKbjlPI4G
   Bqd5THSDiMrQuO3vp8M7sPcc4nM/XomIxNbTVxzSWq+gIdeATRPyozqEb
   n1SNhMc0aejc3w+3zKBIOt2Nq6Qzfxh5gGSdcfcQfnKCbQAA3VfV17v1H
   16wpiGgTqC3hRghH/BBGRaNTfphdHF9flkk35wwbZrdwJ4vgXfX1PnfnE
   1b0AyJO7uJTQ8I8SSykdAe1IUPb8d+ECAUAo0KZSUd8vTeZSjn0rG7Ds+
   q+4i7blhRzJw/VzqbclvbrRaPrlmJJ+NzpwQKYPiKYR/z57sSnOYNClTR
   A==;
X-CSE-ConnectionGUID: C5oNT2ClQ5ySKIpiMRfi2w==
X-CSE-MsgGUID: PunRQ+mqQ/S+h32dB9nWEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15838428"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="15838428"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 05:44:31 -0700
X-CSE-ConnectionGUID: bVZa/i8nTJWWJLr5wl2CfA==
X-CSE-MsgGUID: 9OS4IYj+SuG4WH6tqkAoDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="42552078"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jun 2024 05:44:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 05:44:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 05:44:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 05:44:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 05:44:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIBKjWt2tROpS/EY1sfjsrmL33TsKgC1mSSIKHXpM+HiJXsxFZWRrPRYOjd4AyPrBAJsHOEzE0S0t7E3GClV548Sh0z6QcdKXuIFXijF09BlHKWhFeFj395FBlhMYCFKSRBLZUiAGsi5+k7ZSFWzLkDapV3TPMN/6gdyiHIgqPz+oi31iL6xotKrd8OY4hkrjhVyMOll4KGR8uiAZbpzCIFBP4U0BJP5t3xG86sYtW4jqjCY27P/+pXp68dVF5+Fc8KCjRIahnpxw1dhelWIOQqvCPh5yrePtRdoDXz05cGEFtIQULNrjk7E3gfWorzXEogwfM+SN3bHluDgiDEI6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfPxK3R1PoyODluN2kW+PcXmJYJ3Istm7VkU9IymFHY=;
 b=GmKehr3T30ZsuvCkh8loBf1FXCuceKSkkhtmnd4SwQQLvnyZs+77UUiKZs5ADjS50xFQg/trBLgupoZXzG1ah0JwrV90pG78XNbdbrRL8zYYiuCptGNnS0kgffS35b04Y8MRK2tPujCM9sl/tpiMSKc2q2tm4jR0mLE85f0ZrYO2QYz0MD8uzJ3djSRFsDQyNeqGDKk5QrqLGJQEv9cJ8cibOJg7ukMIS6TXM3GJlZzqQgFQ43znJ960B9VjIsZqaXlP1ChXKwf9mNDm6UA6FrNirk8AAKwRT4TAyckG4zRtfKvNpcdBSutb+YBJsE9GPDqqI5Ior46tPPM13INbDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 PH7PR11MB7076.namprd11.prod.outlook.com (2603:10b6:510:20f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.21; Fri, 21 Jun 2024 12:44:28 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7698.019; Fri, 21 Jun 2024
 12:44:28 +0000
Date: Fri, 21 Jun 2024 20:44:19 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Kairui Song <kasong@tencent.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>, "Huang, Ying" <ying.huang@intel.com>
Subject: Re: [linux-next:master 6386/7397] mm/swap_state.c:256:46: error:
 'SWAP_ADDRESS_SPACE_MASK' undeclared
Message-ID: <ZnV1o/sJ3Mb77KA+@rli9-mobl>
References: <202406211750.Ks4k82Gi-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202406211750.Ks4k82Gi-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|PH7PR11MB7076:EE_
X-MS-Office365-Filtering-Correlation-Id: 5630039b-fe32-44f4-5b4f-08dc91efe392
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tvUiqpb8GakOI0VHbOx5jrfzj3Zu7s9BapHVnQ5ETD5hktvXwfp3DqdsfR6W?=
 =?us-ascii?Q?/GQIbPzTz/Ea7CrIZsBxmbBB3cac86nPLTWY4RDMbKy3nNLvngIwv8elwmBF?=
 =?us-ascii?Q?OfiHgxEc8J+IpOCsMISxOsPv5TzIACBX8PFFc04YmyfmzLUV062DjsS/yR8A?=
 =?us-ascii?Q?o8+8gtRVeows3Tdt7R5vc6uBSP2YPBVoR0A9LTJP6bi9vS5dzZ+oDO1l1F6t?=
 =?us-ascii?Q?aWkA3qpuh0G1SB9WpeZQ4hVE4roF6T7Dlqenb29IpE5ynFjenf7mEYPGAxbl?=
 =?us-ascii?Q?2oluNGck/udXo6dS9ovDVxxxeqJKbmu6QCJ3q/3UiwR1UebwWHJ6xrpL8QF/?=
 =?us-ascii?Q?ZPDmIWjY/EKLpwoNaju6+E9KbyiRlaN4YE9YlGSi34EcWPcKDmk12uFHmvGm?=
 =?us-ascii?Q?GR5tfOj6C5GQKU4Wn2uEEYm2i4p5pBxUvxTF1/CWDfrMmoTmTKB0A1Sy3D0X?=
 =?us-ascii?Q?T7xGf1UxnHOXHtJEkSlwBxIEawnX9q7nLbm39rtYVVQV4GqrvjrMzf80o47v?=
 =?us-ascii?Q?gc+a4I6FHapXkyH5EWDWGtOAeQ+6ecAxL/BA0CAcRrXOXqpFXHI/JVLRAxrE?=
 =?us-ascii?Q?WtyMxGCM7AhS22rtWzt3iqNPqnxr922jxNNIArf3+UAL2da+KEYiBzTl/F99?=
 =?us-ascii?Q?UkGJgqBdAeJSm+qvxGbCdcaAOsBwPNIJ66lJneC9bjgmZmBm8QBzopuJhiHB?=
 =?us-ascii?Q?794hcXrO7A2Zs1ffyl/QOdKRtt0ig4k5m2356PnRW7cuzTsQxqKtGscm4Ekc?=
 =?us-ascii?Q?EL76UekE+KkLfOPx5J9RQ/TMGHD5vU9tzrstLWx3MpMahMnhDP9Yi/vtUgiM?=
 =?us-ascii?Q?S9JWVV/Ngr208sFHntFbwnMBDxnljo865rcUDyue8kV9TePEk3Os8osm+gBg?=
 =?us-ascii?Q?JM4pL68FVgzu87c6YLtJpBB8sFnuundLHCsgIH8Y4/RGGBtgv7kP+nsvi5nF?=
 =?us-ascii?Q?i5oCqI6KzLFDUXtXT4ooyvkVI3yjKb3ck+kFsDo04tcbJgLHqj+lrfGcDioz?=
 =?us-ascii?Q?RlTXrbz+Sld52Axobx4kq/Kpadza6OIDR4NXe3Gd0iwHcLBs+RDgVANY8e1Q?=
 =?us-ascii?Q?I/QxMyGaPeWT7/roAsFb1JUReUT2GTxm3cNFdJ3cAq7MVjBQIuM2FWp11Mgc?=
 =?us-ascii?Q?XeWhU5G23w6bCf8e0q4DzCgE3iaoq5rsqKrvce0UI78PochwnXCULFYkSWrq?=
 =?us-ascii?Q?ARD55P+UlJs/RCsxDtkXQAJiW4xDJDir/dV3c0rdmKaH6SeUuMTfWNm1BzBZ?=
 =?us-ascii?Q?jp11c3D9oyzv9bg/+EJiLC75Pr/YRQqpaEeS7ezFAw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K64pq+Wh3nZIyrtAlQy4kmyZVaa5tGLNbHaw6QruKb31k1JJWIAlIoQ1RAD/?=
 =?us-ascii?Q?uz9jrPJ1hlEV45b/srokPc4sNxDqSwuskzuiQ7gjHlskvhOPcLHQKaJMWSpl?=
 =?us-ascii?Q?GexZ6xKakvi/d+2LuKFAgAqmV2zAv9E5sRGk3x/UQB2zjE1xtHl0lRbpWExn?=
 =?us-ascii?Q?xKaeyF0eZkuGSNSNB7m0jJlOgKfe9SIYMgfrbdJcuwEAcdngXtRx+Zytnb+R?=
 =?us-ascii?Q?tnDwVKqMB++jQyiP/PdB5fZl2jQuEp9x/GmZJFyXJciKDed3X9FrXkLm4Kd2?=
 =?us-ascii?Q?IqY1j/m3l4Nh9L8xeo2527dFzmRYxqQNvETueFV29BKWtTBoExn/3ZMC1oxO?=
 =?us-ascii?Q?RaaMvrhLOjqd0RxQ+Y6icrHZrim8UCWA/URTc1UF92VFGDyC7hYmA2iDjzP5?=
 =?us-ascii?Q?0jHBJonemel3bFwurjYNw63cKDNhQ0hmONEGE930VoCR3Xft4H+nZVKXR1P2?=
 =?us-ascii?Q?Dnm7lujy1dNODR49gbyuV3LvUlB6pt3LdQnOXGlWZH3qd/fYqHy8bbH/qKM4?=
 =?us-ascii?Q?C7CVh58tGui9jI/L/1fPv/5O0LOTH9tIGApQCyhaaKHUksRlp0zmmu7utU10?=
 =?us-ascii?Q?fmZFgHWe0ppJRAuBmPp83/y3dVmCkWDcQirkoiiCYsWfZD0SnI96BQZQ2pjy?=
 =?us-ascii?Q?DJbki0FFSjqSY1Wt0TBZhICNYCS1NTr0D4F/LxL3FZeuALZPsQtrrmInwckt?=
 =?us-ascii?Q?1fPMOZM5gQr7Flr+8ulox75G8endSpCFZ5kz5puFTEzihY3kr2cATHxLiavt?=
 =?us-ascii?Q?TjzE+JchRjicxacM4pZTSZNfgCb6KIpwYADJMzEJhRUOGUgoriCcFNPoCKN8?=
 =?us-ascii?Q?rGFgYGrimi42z6Edzm76r2Dt3ibz9gAALdTeN+h8y+z7R6O5EaGTw4T1k/Y8?=
 =?us-ascii?Q?Q9y1YWriorxb+UCGogqnKdyx4kO2mE11TeM/6HRvOysXXGZs/rCARkzqxckC?=
 =?us-ascii?Q?F9fD3bRpTQMyj1haBFiwheo2jA2lGo07W223ohZ6NbNjj1cz0bIRE6el6cke?=
 =?us-ascii?Q?Cidfj6XL9QSX7vSaGJ2R/0mfRNVd6uvdkSZ69cdnn7VcvZU1U2jlRrmnVnIo?=
 =?us-ascii?Q?Zn6Cx/hsPceJ7hF+XY7gfjRqW8eMDg1ypOPMOjO11hcwqyH76X+heAoL9+gC?=
 =?us-ascii?Q?gqJGX9SOhdO9Oibo8nvZj5WDpgs0B/4/jDc0yKvIFnvkYRP4LNIFozZFo+cM?=
 =?us-ascii?Q?gXxnACAhMKOdLv0kcz/8wbgoHbsrirrZL0Ak9rDfKHbJ1JCNbKbzzqzWjSY1?=
 =?us-ascii?Q?/Pb7mTog3W6HHXcyv4AdaDWzhFGuI+I5701pwm0FuYfSnIuBkQJgjYtbBH7x?=
 =?us-ascii?Q?S+ZHWYy2aAD7LSKwwHPsuC95YW1+RCPcZbcbwlYXMWXMfeqkKt+ajvxZaISH?=
 =?us-ascii?Q?5ojLlcJsXCpLZ7YoioXzmLrYHvv7i6PRWyTbiEgEc6dfkOsEGRy7eUVXQDZ/?=
 =?us-ascii?Q?HwPpTtLx61YGIzqWxwsw9K3TslMVdSp1kiaRoRVflKivDrqW7efkOBwHl1eG?=
 =?us-ascii?Q?oZpjXFl+tPZVaxAxcmo/X35qTbeUwp1qn39geCE2NqKtpJJds56mbjNu8kHb?=
 =?us-ascii?Q?4gYPsH0qsxHTfUa4v/QXi6Ya66lhSN5XM8eJOqS7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5630039b-fe32-44f4-5b4f-08dc91efe392
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 12:44:28.2769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6H3yX8FnGcEbww6jIpJS0LL33MEgc5l0Hbz//hZEqHLjQSXD6kgbOtU6n1GIedKFJD/gDpwK9dl2rpolRus5xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7076
X-OriginatorOrg: intel.com

On Fri, Jun 21, 2024 at 05:53:00PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
> commit: 23c593d8220af52504cff1d99fbd39ab56a02c82 [6386/7397] mm/swap: reduce swap cache search space
> config: x86_64-randconfig-014-20240202 (https://download.01.org/0day-ci/archive/20240621/202406211750.Ks4k82Gi-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211750.Ks4k82Gi-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406211750.Ks4k82Gi-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

Kindly ignore this report, which is a wrong report. We will fix the bot
asap to resolve the issue.

> 
>    mm/swap_state.c:65:6: error: redefinition of 'show_swap_cache_info'
>       65 | void show_swap_cache_info(void)
>          |      ^~~~~~~~~~~~~~~~~~~~
>    In file included from mm/swap_state.c:27:
>    mm/swap.h:104:20: note: previous definition of 'show_swap_cache_info' with type 'void(void)'
>      104 | static inline void show_swap_cache_info(void)
>          |                    ^~~~~~~~~~~~~~~~~~~~
>    mm/swap_state.c:72:7: error: redefinition of 'get_shadow_from_swap_cache'
>       72 | void *get_shadow_from_swap_cache(swp_entry_t entry)
>          |       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/swap.h:147:21: note: previous definition of 'get_shadow_from_swap_cache' with type 'void *(swp_entry_t)'
>      147 | static inline void *get_shadow_from_swap_cache(swp_entry_t entry)
>          |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/swap_state.c:88:5: error: redefinition of 'add_to_swap_cache'
>       88 | int add_to_swap_cache(struct folio *folio, swp_entry_t entry,
>          |     ^~~~~~~~~~~~~~~~~
>    mm/swap.h:152:19: note: previous definition of 'add_to_swap_cache' with type 'int(struct folio *, swp_entry_t,  gfp_t,  void **)' {aka 'int(struct folio *, swp_entry_t,  unsigned int,  void **)'}
>      152 | static inline int add_to_swap_cache(struct folio *folio, swp_entry_t entry,
>          |                   ^~~~~~~~~~~~~~~~~
>    mm/swap_state.c: In function 'add_to_swap_cache':
>    mm/swap_state.c:124:48: error: 'NR_SWAPCACHE' undeclared (first use in this function)
>      124 |                 __lruvec_stat_mod_folio(folio, NR_SWAPCACHE, nr);
>          |                                                ^~~~~~~~~~~~
>    mm/swap_state.c:124:48: note: each undeclared identifier is reported only once for each function it appears in
>    mm/swap_state.c: At top level:
>    mm/swap_state.c:141:6: error: redefinition of '__delete_from_swap_cache'
>      141 | void __delete_from_swap_cache(struct folio *folio,
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~
>    mm/swap.h:158:20: note: previous definition of '__delete_from_swap_cache' with type 'void(struct folio *, swp_entry_t,  void *)'
>      158 | static inline void __delete_from_swap_cache(struct folio *folio,
>          |                    ^~~~~~~~~~~~~~~~~~~~~~~~
>    mm/swap_state.c: In function '__delete_from_swap_cache':
>    mm/swap_state.c:165:40: error: 'NR_SWAPCACHE' undeclared (first use in this function)
>      165 |         __lruvec_stat_mod_folio(folio, NR_SWAPCACHE, -nr);
>          |                                        ^~~~~~~~~~~~
>    mm/swap_state.c: At top level:
>    mm/swap_state.c:178:6: error: redefinition of 'add_to_swap'
>      178 | bool add_to_swap(struct folio *folio)
>          |      ^~~~~~~~~~~
>    mm/swap.h:142:20: note: previous definition of 'add_to_swap' with type 'bool(struct folio *)' {aka '_Bool(struct folio *)'}
>      142 | static inline bool add_to_swap(struct folio *folio)
>          |                    ^~~~~~~~~~~
>    mm/swap_state.c:235:6: error: redefinition of 'delete_from_swap_cache'
>      235 | void delete_from_swap_cache(struct folio *folio)
>          |      ^~~~~~~~~~~~~~~~~~~~~~
>    mm/swap.h:163:20: note: previous definition of 'delete_from_swap_cache' with type 'void(struct folio *)'
>      163 | static inline void delete_from_swap_cache(struct folio *folio)
>          |                    ^~~~~~~~~~~~~~~~~~~~~~
>    mm/swap_state.c:248:6: error: redefinition of 'clear_shadow_from_swap_cache'
>      248 | void clear_shadow_from_swap_cache(int type, unsigned long begin,
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/swap.h:167:20: note: previous definition of 'clear_shadow_from_swap_cache' with type 'void(int,  long unsigned int,  long unsigned int)'
>      167 | static inline void clear_shadow_from_swap_cache(int type, unsigned long begin,
>          |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/swap_state.c: In function 'clear_shadow_from_swap_cache':
> >> mm/swap_state.c:256:46: error: 'SWAP_ADDRESS_SPACE_MASK' undeclared (first use in this function)
>      256 |                 unsigned long index = curr & SWAP_ADDRESS_SPACE_MASK;
>          |                                              ^~~~~~~~~~~~~~~~~~~~~~~
>    In file included from include/linux/list_lru.h:14,
>                     from include/linux/fs.h:13,
>                     from include/linux/huge_mm.h:8,
>                     from include/linux/mm.h:1120,
>                     from mm/swap_state.c:10:
>    mm/swap_state.c:263:67: error: 'SWAP_ADDRESS_SPACE_PAGES' undeclared (first use in this function)
>      263 |                 xas_for_each(&xas, old, min(index + (end - curr), SWAP_ADDRESS_SPACE_PAGES)) {
>          |                                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/xarray.h:1799:36: note: in definition of macro 'xas_for_each'
>     1799 |         for (entry = xas_find(xas, max); entry; \
>          |                                    ^~~
>    include/linux/minmax.h:56:31: note: in expansion of macro '__is_constexpr'
>       56 |         __builtin_choose_expr(__is_constexpr((x) - (y)),        \
>          |                               ^~~~~~~~~~~~~~
>    include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
>       85 | #define min(x, y)       __careful_cmp(min, x, y)
>          |                         ^~~~~~~~~~~~~
>    mm/swap_state.c:263:41: note: in expansion of macro 'min'
>      263 |                 xas_for_each(&xas, old, min(index + (end - curr), SWAP_ADDRESS_SPACE_PAGES)) {
>          |                                         ^~~
>    include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
>       31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
>          |         ^~~~~~~~~~~~~~~~~~~~~
>    include/linux/xarray.h:1799:36: note: in definition of macro 'xas_for_each'
>     1799 |         for (entry = xas_find(xas, max); entry; \
>          |                                    ^~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>       77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>          |                                  ^~~~~~~~~~~~~~~
>    include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
>       51 |         static_assert(__types_ok(x, y),                 \
>          |         ^~~~~~~~~~~~~
>    include/linux/minmax.h:39:28: note: in expansion of macro '__is_signed'
>       39 |         (__is_signed(x) == __is_signed(y) ||                    \
>          |                            ^~~~~~~~~~~
>    include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
>       51 |         static_assert(__types_ok(x, y),                 \
>          |                       ^~~~~~~~~~
>    include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
>       58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
>          |                 ^~~~~~~~~~
>    include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
>       85 | #define min(x, y)       __careful_cmp(min, x, y)
>          |                         ^~~~~~~~~~~~~
>    mm/swap_state.c:263:41: note: in expansion of macro 'min'
>      263 |                 xas_for_each(&xas, old, min(index + (end - curr), SWAP_ADDRESS_SPACE_PAGES)) {
>          |                                         ^~~
>    include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
>       31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
>          |         ^~~~~~~~~~~~~~~~~~~~~
>    include/linux/xarray.h:1799:36: note: in definition of macro 'xas_for_each'
>     1799 |         for (entry = xas_find(xas, max); entry; \
>          |                                    ^~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>       77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>          |                                  ^~~~~~~~~~~~~~~
>    include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
>       51 |         static_assert(__types_ok(x, y),                 \
>          |         ^~~~~~~~~~~~~
>    include/linux/minmax.h:40:41: note: in expansion of macro '__is_signed'
>       40 |                 __is_signed((x) + 0) == __is_signed((y) + 0) || \
>          |                                         ^~~~~~~~~~~
>    include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
>       51 |         static_assert(__types_ok(x, y),                 \
>          |                       ^~~~~~~~~~
>    include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
>       58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
>          |                 ^~~~~~~~~~
>    include/linux/minmax.h:85:25: note: in expansion of macro '__careful_cmp'
>       85 | #define min(x, y)       __careful_cmp(min, x, y)
>          |                         ^~~~~~~~~~~~~
>    mm/swap_state.c:263:41: note: in expansion of macro 'min'
>      263 |                 xas_for_each(&xas, old, min(index + (end - curr), SWAP_ADDRESS_SPACE_PAGES)) {
>          |                                         ^~~
>    include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
>       31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
>          |         ^~~~~~~~~~~~~~~~~~~~~
>    include/linux/xarray.h:1799:36: note: in definition of macro 'xas_for_each'
>     1799 |         for (entry = xas_find(xas, max); entry; \
>          |                                    ^~~
>    include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>       77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>          |                                  ^~~~~~~~~~~~~~~
>    include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
>       51 |         static_assert(__types_ok(x, y),                 \
>          |         ^~~~~~~~~~~~~
>    include/linux/minmax.h:36:53: note: in expansion of macro '__is_signed'
>       36 |         (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)
>          |                                                     ^~~~~~~~~~~
>    include/linux/minmax.h:41:38: note: in expansion of macro '__is_noneg_int'
>       41 |                 __is_noneg_int(x) || __is_noneg_int(y))
>          |                                      ^~~~~~~~~~~~~~
>    include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
>       51 |         static_assert(__types_ok(x, y),                 \
>          |                       ^~~~~~~~~~
>    include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
>       58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
>          |                 ^~~~~~~~~~
> 
> 
> vim +/SWAP_ADDRESS_SPACE_MASK +256 mm/swap_state.c
> 
>    247	
>    248	void clear_shadow_from_swap_cache(int type, unsigned long begin,
>    249					unsigned long end)
>    250	{
>    251		unsigned long curr = begin;
>    252		void *old;
>    253	
>    254		for (;;) {
>    255			swp_entry_t entry = swp_entry(type, curr);
>  > 256			unsigned long index = curr & SWAP_ADDRESS_SPACE_MASK;
>    257			struct address_space *address_space = swap_address_space(entry);
>    258			XA_STATE(xas, &address_space->i_pages, index);
>    259	
>    260			xas_set_update(&xas, workingset_update_node);
>    261	
>    262			xa_lock_irq(&address_space->i_pages);
>    263			xas_for_each(&xas, old, min(index + (end - curr), SWAP_ADDRESS_SPACE_PAGES)) {
>    264				if (!xa_is_value(old))
>    265					continue;
>    266				xas_store(&xas, NULL);
>    267			}
>    268			xa_unlock_irq(&address_space->i_pages);
>    269	
>    270			/* search the next swapcache until we meet end */
>    271			curr >>= SWAP_ADDRESS_SPACE_SHIFT;
>    272			curr++;
>    273			curr <<= SWAP_ADDRESS_SPACE_SHIFT;
>    274			if (curr > end)
>    275				break;
>    276		}
>    277	}
>    278	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
