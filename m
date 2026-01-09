Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FEA3382D5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 10:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767954771; cv=fail; b=E5y/Vykq9ehNLykhSYO1iiB/t7d2sOfwbHcr9Xt/YINAjQ/RCGeY8oyGPMtYuM2LZ6UVPLEKZMUYqbjZDrI9Y0DswDW15eEyX90oOBQipw5vxDAtyTqbaecdegqsXxMxsREEyZm5MdkfKK1KSYi40GyyvPJlnfwoQQcXCFLn0Gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767954771; c=relaxed/simple;
	bh=Xh/4l5lXlYOhLWR5dLuNVfPtcOfFAqufixWWs0EsXfY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QliAo8eP9HrhgRWJQwt7BedtZzF+ZIYAKa+TpKhSDbNnfYRiTpcpsIa527qCOhKorLTP/wuhvMgLak5/IpASEOaq6GB6aCzs+FYxkOb6fYtKhzkWcfxbMcM8HS7Z1C8nnTdWYg3xrxqBfYY02wK266DNDg6/rISwRiL7uoASiQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxzG07r0; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxzG07r0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767954769; x=1799490769;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Xh/4l5lXlYOhLWR5dLuNVfPtcOfFAqufixWWs0EsXfY=;
  b=MxzG07r00o6GxWcS6WYfgyiVj4s6iNgjnKwWb12YxGeQi32qJFL0NJKT
   cRl5OG1aGHhjJI2O72rvmCDoj8M0GYFNjdXKZs+gWB/eMnXrGCTEFL4Xz
   eosS52xJtfTxM6GRp3WfLa9Y+EsearRa1c0CUwql4ueooOERFVky+Er5t
   2t5tOfoelsy9iHipxSt92gylViDoj2JcTgEdDvLo3m1r93M1QMsjgSadB
   anHDijcISUSz5kSIkj7wJQxPFK9pCoptu+K20VmeZYvTpkrK6trzOnaQJ
   26k+nNP0cV72uKbO6eZIyVV5Qad45agd9mfZvQErq5f3QR2HgqLRod0DY
   w==;
X-CSE-ConnectionGUID: E3Tu5Vk8R9SUPL6lejgaNw==
X-CSE-MsgGUID: 2bRIh0qFQVGJxg9ROJglTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80787917"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="80787917"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 02:32:47 -0800
X-CSE-ConnectionGUID: Uitpy38KT4asNkE+DBsibA==
X-CSE-MsgGUID: B94V/x6aTLeSu4X0N78QcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="207970088"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 02:32:47 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 02:32:46 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 02:32:46 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 02:32:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8BjmraxH6UyJcSsgTv8P80cGsX3n+T5UK3NzUNVqsuDVZgFSjSF9xQyGUQWiCN0HYDfRCItnPLmqrym1bcCP7Js0qBZ7o9h3BnVNjYcXHmhqYiPkRrXdOl1Ip/kCl/ABG0d4gbvVMO5qXhFTojePEfRrpl2i0EoMuE9byZ90wnXAslDX3aZ8Ip6gh33q+y4tQOSKxZYCRtOCM/6Yz3Fx8QToOlgg+gWJ4Mro5QsmMBJ0nbATHLiHwy6DxgwDgkePIX+X3BtkYbkskUxQZodTq80804NMX2IUNAjf5g2UwQ+6r1zm5iKsjRSfR1TbrQk7w5a23zTeHXh7XzFVczTWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PndzcGdZWrNu/SnUDO3CTPn0+Pu3KuZDG3pFwBmklvg=;
 b=byrhXwgsL0wmlJ3mlAWWpLJGguPx0YCGjl+qehOgc0NOqbnj9pKSYOWM1EIzpshlj5RLQg+w2yEeH+o+SKkC7LuVYIbVx6GBu32wCGePWi3/oWTizhSFYHdtEc9dPh03Im4lkZrGF9SJq0yVaKoutxyqhlKX9R1RnBb3GnUsqi09wDgBlcP43JQ2HrKUDpKy7hGzdOtcZJYBwupwFOEx44d9KaolPC+7nRN9AqidMoj63564/gB3OkC/Kb3ImpF2CHinMR/+td7KeZRrN7EGecl/ncIlwngjNEZFTxSkX7WFF+0VZQhO2x5jS6H+QFxWW34y0JWfiv5ibd+c/xjWfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by PH7PR11MB8598.namprd11.prod.outlook.com (2603:10b6:510:2fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 10:32:39 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 10:32:39 +0000
Date: Fri, 9 Jan 2026 18:32:30 +0800
From: Philip Li <philip.li@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1378
 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
Message-ID: <aWDZPl1MIg4nvjuj@rli9-mobl>
References: <202512200337.um368Um1-lkp@intel.com>
 <aVt23tyDlVK0JaEU@stanley.mountain>
 <aV/a8jIBT0s7sx0b@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aV/a8jIBT0s7sx0b@rli9-mobl>
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|PH7PR11MB8598:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e57ce4-6e76-4278-9fbc-08de4f6a694b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bq6uKVG7EVRxNPVUvlcSoLzywYlP0/EqCk+o3KlSkrvaitUUX8adtSK3ZleP?=
 =?us-ascii?Q?JAqX9igd70IpX3ERiJ5g7Jd0Eep/gAoQaZojTf3Tf3RiZN3wz8lrct8RGav1?=
 =?us-ascii?Q?Rka0OM1s7+mUVh1mapVgpsk/5UOw7P9K9MthLd/oCfK/futhM2g/dgnQPcln?=
 =?us-ascii?Q?t5XN2oCA1Uwc9ModoxhB8rl4mNEBvg3lGtFa2pQH0hhsfBdP0QQKks9UahI3?=
 =?us-ascii?Q?iPM5pKAjsSvKNUCPMaUe6rWA/Wcrd/4Fk1JEAuedVLOy6fLSJCOF9/e6eAQz?=
 =?us-ascii?Q?vovUNGlM6j+dPHowU1GocqjnOH0+r6X+ghK0RFx+VrcdaQw0ndB7ddjay4Gh?=
 =?us-ascii?Q?4hJXY3P57+d9UhZWOC3L6QpZZOeqIFGrto7x8oNjM80UDXX3TPu95iNrTjWv?=
 =?us-ascii?Q?ANkUsj8indZaLjlXlyz6SgXsmqkfpVLmQpCg+fFDN4+WddfAg8yDCVk+4wnN?=
 =?us-ascii?Q?j70iQ6zH7pvpn1O+db8G0uGpdq0+qozuRtp0XVMKjmcRuiP4CIkr9jwIZEI+?=
 =?us-ascii?Q?0d+Egl9DAkqNXEURh1hAxhsUpd2vo3+qwpBRtWr9vs4ajFQJWbixKpmBZOTh?=
 =?us-ascii?Q?osiUKwVcoHP1kvpk6qa7TT16IHQU11UpwHYsI2jZgBHhHrt2rNXLs348LPj1?=
 =?us-ascii?Q?/kNvbqKAQfureKbxXwA148CZnZ9cZKsLCxq1nKRSiMOB1L/nqfnBHpoq4UUE?=
 =?us-ascii?Q?eYIuD9W4Ng+eodYfk93AVvq1xvYx6jN/IiJqrV7+QSo/ysBY4DwXEtzIJ5EH?=
 =?us-ascii?Q?qKLUkWzgaNjuNhY1/5t7xD0YLS81vjIZS/OUp8a+GBhIz3rY/10e/bc+A5Tl?=
 =?us-ascii?Q?SOuafueFuYpjK7YfDbMIpa8nq+eqK8Hu6+lOQ+bocfYgdQIXGJZg5tnnI5+I?=
 =?us-ascii?Q?j8Bn1Zk32Mb4bHGqFNdRRus9bfWyTHygEJCBMFX2xUOEpfUWis91ZvKiMUbn?=
 =?us-ascii?Q?4rTOSgziYstSUnVCdHi0tG105a9d4+FGgyqM0mle+ayjKLUHSHAlxraRn9J/?=
 =?us-ascii?Q?ISOyg4pS/uXQHIfFVuOJI8UJEKfn/Yoa5XAR+7NMD+w8qg6W8j2SaAb9fQa9?=
 =?us-ascii?Q?t+dOoheTpk32s90s9l0a1OPksJ7/9H3g+Ur6eR+j5MUn1Ku+Y1bWStFKMs13?=
 =?us-ascii?Q?nv5R2siclQ3RzYd4kkq3Z+N2wbrKL4RM+dkLOh/h6Jn+hrEwjB+frTLWLxqy?=
 =?us-ascii?Q?sCSXGoAQz8UKioZhVhplAgmrqgar/4GP0Ygjdy7XHsmo1M2hD7EygSNwyFm5?=
 =?us-ascii?Q?pPgmTOIjox92Z1Pz4V7Fz7D363NZlK33ZKKGhDCBOF1Zqw/bASu6R120E4Wt?=
 =?us-ascii?Q?bEKy9cXxond/fWahsr6o8mMdiM4DPmRkXeNJaYRCuzu4XLgdeI6dd3C/xUUp?=
 =?us-ascii?Q?VlzgoPSJ2PD6w9e+O8zl87RlL+Ba6qoqmzX0FA+hqy+7WF01hYwgPacL3Xox?=
 =?us-ascii?Q?y0das8zmSqlCYJ9OwhmSoPPiJAgrgib3rD9vISKpLeFs+4kkM/Q1Fg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vgwyN6wI4pz8eI0q+XJIoQkTvOHwIlLKILF3cLOSdwrPogBsFBT748Yy473a?=
 =?us-ascii?Q?RUoAGj1HgUy89T/uNu0gj88+Ix1mxR6jOdIA/raddiSI0YdGXi5o1E0BC+bS?=
 =?us-ascii?Q?xaBZXb8Rjd1fRJ3ZMO2h4mBE6XnszHKONgpXsNvBTvUf3ifBCf4K2WxVBiL6?=
 =?us-ascii?Q?g0WC3AFl5dwZgidK126h88FoTYHcGYLwCRd24IQJtBpWYUKegqFYCM3zjpcs?=
 =?us-ascii?Q?6qQZDjYSVX+uouGLQI8o64h/rBfIiS04OMoMsoT/251WZ3AyMe3DCfBmVpcE?=
 =?us-ascii?Q?0vSVGT3c+NCIbCbRyK4hjxTJluPg1IDBK2+0eOmbhWGjLNrhBICT08CL6YC7?=
 =?us-ascii?Q?42oDEJwnnif31DzV0gIBg/GkBcTDT1EpxXHNBEkHiptE6dhrs/PVxC2Ys/wV?=
 =?us-ascii?Q?tFW43OqanaIFN5unintSLaQkUZf5OR8wFSyChgg1/itR/CnjZgQCBoX+pMQf?=
 =?us-ascii?Q?Oh05Uv5N0UZWFqUsRPsuVGua0pfcqK+9coKd6ZVa0kH//c/ziH7czenaGhWo?=
 =?us-ascii?Q?TF0D7CgkUCvdOvJ5X9jkvbNC2y2m8DROcmehtjHhd/jNDyYLcdycI7/cdKi4?=
 =?us-ascii?Q?IRmEJRM93r6zO+AluiO0Qgprc2sVb3zlNNj8sGzku1945Uirj49vj0ikgTPE?=
 =?us-ascii?Q?52zj+fk2EhrsUTxxnlQgQ/eiVapUGqxQ4iUtkZmFpwpVDdPLv/7IuXAVUnXY?=
 =?us-ascii?Q?BCSWprkoTHIkCeKzxt2yNa+GaAob/2vCHJgT1983NKXETKfThGKr5c02rKSj?=
 =?us-ascii?Q?Xdqg4S9Xp2PbQ2y1qXgY+OGNqiD9hwFxbo8l7Nf3SN43enf36LTN3Sfmrcwf?=
 =?us-ascii?Q?ZYu/i8b443luvVmtJeR3wGwgk9ZBwIAE/CFu9/nilo+fgYw8KfhyLaZ9KAH3?=
 =?us-ascii?Q?xgowi/O79nk0qWgmuEp2pQ0sFVyTyb1vsrwK4BfJdH8HbLudvhaFHrPxPcl9?=
 =?us-ascii?Q?OiJUw3qXpHWMRpn3r31B6giF6jI8cMUJZP5EciDzHVqhY9nf58iAi5nPwU24?=
 =?us-ascii?Q?Q2aOz/DY67+hE13MsuzIPRnRRC3TUTTE0njZPPkVOKSbbVIt2XxV1UXh9zcd?=
 =?us-ascii?Q?xsOkAefYz8QmNm9ghQ25v3NA2iXz4v1+Ni27FoJfM/yzGL4NG6O7qtLK7f/4?=
 =?us-ascii?Q?ffb3XkS8cfP7F+vjdv4lZ0OYpWpFXdELfZ6wvx36D4lVvFHbaFPK+ocnH0ga?=
 =?us-ascii?Q?sH//6QxLv0A4/98GuUliEWPY/aJz7aVPPLn60b0D3ZQVGsU48rxbWIAe+w/Z?=
 =?us-ascii?Q?7Ed7gexdER6vs4D1DGEgpPmsDQO4dopVKzdjqOmpWYsbjWmQmlu0nQwnpvDG?=
 =?us-ascii?Q?3XfQDz9E7ZlGkieMzu/qYJKIWtDeXDxWY9KjSi8xizMfvMZQnUKWfU5d5R6C?=
 =?us-ascii?Q?My6kWkHo1vgXOsNdhL3iFqXuFFGvuwgEiY5teMsxJkACmMHslo8DfckLhrb1?=
 =?us-ascii?Q?NdMI07Rp3ImsMzrtQ9NWr2Lsd3BLNiwO5k5lCxXA2oRGp1h8fhJePlSHPtiR?=
 =?us-ascii?Q?KpTfipz5msnBaa9EeVDaDhAIaa0uYYFr7O4UuLJleDwm3QzU8oSQA9SV+05y?=
 =?us-ascii?Q?hX3xY5T1o71oWdZ1StAkF11n8MKLf9MAvRkEntjfSwZ60jt7KWGTpGHPU3pU?=
 =?us-ascii?Q?dL9dTG+NuTFRbAoHXvsj4zTZLzEWo15AokJndmW61I6rSmpCyXGOTW+tQ2V/?=
 =?us-ascii?Q?9z53mYSCn56D928LoifSY0lDh6zIxWeaDQidec5u98QUHeqdkZGIGFV/01/j?=
 =?us-ascii?Q?26twhSS2BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e57ce4-6e76-4278-9fbc-08de4f6a694b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:32:39.0194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZy80sITa+oDGjCYvCz1ounKXGpMoFFUzu9/Dln9elQQulHeVTMjfLsBxYamAKViUks1gjqp/GKC1TGRn6aNbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8598
X-OriginatorOrg: intel.com

On Fri, Jan 09, 2026 at 12:27:30AM +0800, Philip Li wrote:
> On Mon, Jan 05, 2026 at 11:31:26AM +0300, Dan Carpenter wrote:

...

> > I've never been able to reproduce these warnings "iterator 'i' not
> > incremented" false positives.  I've tried deleting my cross function
> 
> Sorry for the reproduce problem, let me further check.
> 
> > database and using the exact same config and everything I know how to
> > reproduce them but I can't.  Are you using the latest version of
> > Smatch?
> 
> The version bot uses during Dec 20 2025 is
> 
> 	3a2a0587 kernel: add some more once_through macros
> 
> And I will upgrade the smatch to latest after trying the reproduce
> in current bot enviroment.

Hi Dan, it can reproduce the "not incremented" warning with 3a2a0587
or latest 2614ff1a commit.

Not sure whether it is caused by the way how 0day setup smatchdb and
smatch.

Can you share me which kind of info or artifacts that would help debug this,
i can upload them to downloadable place?

Thanks

> 
> > 
> > regards,
> > dan carpenter
> > 
> > On Sat, Dec 20, 2025 at 03:40:19AM +0800, kernel test robot wrote:
> > > BCC: lkp@intel.com
> > > CC: oe-kbuild-all@lists.linux.dev
> > > CC: linux-kernel@vger.kernel.org
> > > TO: Maxim Levitsky <mlevitsk@redhat.com>
> > > CC: Paolo Bonzini <pbonzini@redhat.com>
> > > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   dd9b004b7ff3289fb7bae35130c0a5c0537266af
> > > commit: e4a454ced74c0ac97c8bd32f086ee3ad74528780 KVM: add kvm_lock_all_vcpus and kvm_trylock_all_vcpus
> > > date:   7 months ago
> > > :::::: branch date: 22 hours ago
> > > :::::: commit date: 7 months ago
> > > config: riscv-randconfig-r073-20251214 (https://download.01.org/0day-ci/archive/20251220/202512200337.um368Um1-lkp@intel.com/config)
> > > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <error27@gmail.com>
> > > | Closes: https://lore.kernel.org/r/202512200337.um368Um1-lkp@intel.com/
> > > 
> > > New smatch warnings:
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1378 kvm_trylock_all_vcpus() warn: iterator 'i' not incremented
> > > 
> > > Old smatch warnings:
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:283 kvm_make_all_cpus_request() warn: iterator 'i' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:487 kvm_destroy_vcpus() warn: iterator 'i' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1384 kvm_trylock_all_vcpus() warn: iterator 'j' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1401 kvm_lock_all_vcpus() warn: iterator 'i' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1409 kvm_lock_all_vcpus() warn: iterator 'j' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1425 kvm_unlock_all_vcpus() warn: iterator 'i' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1721 kvm_commit_memory_region() error: we previously assumed 'old' could be null (see line 1714)
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:1723 kvm_commit_memory_region() error: we previously assumed 'new' could be null (see line 1715)
> > > include/linux/kvm_host.h:1010 kvm_get_vcpu_by_id() warn: iterator 'i' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:4961 kvm_vm_ioctl_reset_dirty_pages() warn: iterator 'i' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:6092 kvm_get_stat_per_vcpu() warn: iterator 'i' not incremented
> > > arch/riscv/kvm/../../../virt/kvm/kvm_main.c:6103 kvm_clear_stat_per_vcpu() warn: iterator 'i' not incremented
> > > 
> > > vim +/i +1378 arch/riscv/kvm/../../../virt/kvm/kvm_main.c
> > > 
> > > 6aa8b732ca01c3d drivers/kvm/kvm_main.c Avi Kivity     2006-12-10  1370  
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1371  int kvm_trylock_all_vcpus(struct kvm *kvm)
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1372  {
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1373  	struct kvm_vcpu *vcpu;
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1374  	unsigned long i, j;
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1375  
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1376  	lockdep_assert_held(&kvm->lock);
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1377  
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12 @1378  	kvm_for_each_vcpu(i, vcpu, kvm)
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1379  		if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1380  			goto out_unlock;
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1381  	return 0;
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1382  
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1383  out_unlock:
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1384  	kvm_for_each_vcpu(j, vcpu, kvm) {
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1385  		if (i == j)
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1386  			break;
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1387  		mutex_unlock(&vcpu->mutex);
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1388  	}
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1389  	return -EINTR;
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1390  }
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1391  EXPORT_SYMBOL_GPL(kvm_trylock_all_vcpus);
> > > e4a454ced74c0ac virt/kvm/kvm_main.c    Maxim Levitsky 2025-05-12  1392  
> > > 
> > > -- 
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > 
