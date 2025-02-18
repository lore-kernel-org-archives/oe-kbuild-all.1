Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446551CA81
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 00:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739838745; cv=fail; b=WkMYd99TECF9y8lsKc5e0dix38Arvdj4IA7VbP1u08IeVl20CmLuJYodF2x6ax4sLlRALTtwtvey48SRuF/yi6ZzPMifbjcPg7mtcq2VCjNaIDTcrSNL7xdcXLPyUzkgkZV3Wrce4oPuRmplHSYH+0yN9IOW9Wn7W42Uy607D90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739838745; c=relaxed/simple;
	bh=CUEs57YRQL/rS8xxJ2FWgqYydYq7nDF5rfi2wRarm9c=;
	h=Date:From:CC:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=IJy82yeeYvdsQGtEl78UtquJv6K22ZzWy/v0kIi/SV2GwaCz/Es6GHPQfOfIA197Jby4220ksWKMD2b7pNLy6Z7SxB02rkS1XokqR0OJ1xTCuPZ/gnEVObIE2ZKMs1uVizSVA4QtX7wgCdxCJg2xP7zVx5FVw9Q8UQjA3vemEAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7YKlc+Q; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7YKlc+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739838743; x=1771374743;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CUEs57YRQL/rS8xxJ2FWgqYydYq7nDF5rfi2wRarm9c=;
  b=h7YKlc+QfCQxW+KyaTbD4MZ6eUKltQasTtV40g8seY+czM9LUjD2Dtkr
   9CF4ZlSe/jUXUt13go95JfY7VtOiNkkkOvPFaR1Bkqh8pE9QqQ6c6Gkp+
   jwDnpoSHXMSHUndrQZ0zz/9tg/+aH2egx6wLqoGJwQ42jg03B5W5gPmTF
   tyYOne3lPEjKes11VGK+kcoASg0KUM5FVWOcN5eBzEwHrOIWj5LkmdxUc
   yjynuNkbZjOj4bhWKrSnuqcpm2Dy1EQU8OG+g74WsM5rE6NTeu3Ks9ke2
   RvbjVSfU1vifyqXb0/bfr1FcqgfL1SalVD+S/Ejrw6urgb01IU3Edxnd/
   w==;
X-CSE-ConnectionGUID: Edhh0SuBTrO+Ez4H7h1dkQ==
X-CSE-MsgGUID: Ptdjjpr0TlusicAijZgiVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="44279311"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="44279311"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 16:32:22 -0800
X-CSE-ConnectionGUID: SgxcfePKQNW6KAETCsLE7A==
X-CSE-MsgGUID: BEu+7HPKTVO7C3QliT1s4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115141516"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Feb 2025 16:32:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 17 Feb 2025 16:32:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 16:32:21 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 16:32:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGj83o8X0XgQ4/bTyAH7eib8LDS3ZPO7iwSImb/i2hLxc8Ih68tDRsd2Pslg9/sjztUrMDnzAaRVTAfgBmMfDXfZgpDCwj0uScJOOjPWXptE7SGtoERgSUKfATk4eRXPIiSqtC4ofFbg2jr9Wf7QRllzrLoKloyfMqOuQXU7Y5MxAZmBSN1yMOUkW/tr0FcCkT+Q2AImTM9m/6VONDCbY1Sb+HOpDFEm0fcKf6mOgGmIis/RoyFtELmR4L63KpbEOQCbsmxjcaw7lRxe7EqY9vI6ndo2ZupzufMJ6sX+WeiUbKG5VE0hdzh5WaPI0qJZq9/5MgK/u/TiUrTSlkPeQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEZTd52jzIlEaOgGF3cS9Wm9B4YrAaXGzgBjFkDwsms=;
 b=bwB+BhijCZmr26pRzt7RQNOZcP8J6BQOpIFtN9GaR3zzQeCf26+o8yt1h4nQAB9RisFLQg7vx8vR4a9FHJMhqPhvHs8ANWRpdxetXFUGQQHAsC8Mhol6xEgXRQCYA9Q9iTo6BVfxNGWx20OCxGJyZu3Wxi4fEpQLDe6Ii9yzj6lI6AZcdxQ5kUi3fvXFYJVMUzBiDRtJkzga7dOl4I8W5NfkCDD9IYML/q7xGrMjpyWZ6mBtm1NOOyR3FbU0zBJvSG12iCpWlFrTOGp0dNHxuLiXnbHuJQ3LONc6uTViMwecJHEj+1NI8Ei/hJ2rC19yoixWz6B4eFn0TmjIo1uVng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DS7PR11MB7949.namprd11.prod.outlook.com (2603:10b6:8:eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 00:32:13 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 00:32:13 +0000
Date: Tue, 18 Feb 2025 08:32:06 +0800
From: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [intel-lts:pr/56 1/1] WARNING: modpost:
 drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.o: section mismatch
 in reference: tfp410_driver (section: .data) -> tfp410_driver_exit (section:
 .exit.text)
Message-ID: <Z7PVBj9uSQhG8ZvJ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DS7PR11MB7949:EE_
X-MS-Office365-Filtering-Correlation-Id: 99fff8ec-26bd-48be-7ff7-08dd4fb3b020
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cWbeiquLeTdCOBznyviFJ8LUyxFRq2tAaaFWtFxTf0dHX5CRkezF5iyS7tpV?=
 =?us-ascii?Q?yubBcmcjhrPveWVcBnfaPddHcSLfJr9LCykTW/0Gt41zVlJduuZ5UifNx0gW?=
 =?us-ascii?Q?KIA5fT1QNFrKRzE8Nb2MEwG6APXV4ZKYU1tAfPWjLhRInl81sbOekb5PWWDv?=
 =?us-ascii?Q?or/+u8PCnz9Cz5PmzRuwWuK8MdiyUs+mtw+lo+F0saWwx499JapFmKEOrLr9?=
 =?us-ascii?Q?hDeSKBEgyzccT7oBBggwAGKif34cgdHuv9PZyDhKG15iVCNy88h5krOj6AKr?=
 =?us-ascii?Q?mI0YO5qGpWn1mHRtqQEut3dpptvsQSUSilWZUX6S1rDXy+Wgk7t0behy+Xcb?=
 =?us-ascii?Q?DIEZJWe/2QQdtgmW+hww9QfDI68HybgOnM0PgTLJHriUkqquK8bTrWRfX/tA?=
 =?us-ascii?Q?KWM7zX89OQAQCx4nCSB/OItVj44FqG5bya7xKGpGM5VkC+4eMXtEm/mgfLZ8?=
 =?us-ascii?Q?nY+jGxIwIJFOJxYTmV+xN2beL7gIZMBQpoDYl85bdB/aHuWwLpdhIUnSV2dB?=
 =?us-ascii?Q?ZtfURdvGrbfSaZyiGv1RLPOiHCKQ55vrTZdQgDb3qBRIg4PTNGxsyAr9pPtr?=
 =?us-ascii?Q?zCp+WPx8qaYdPCtAwZAZFv7nNBeRliH1ikYNqFpVaDKDGdXKcx46gSSoEzNT?=
 =?us-ascii?Q?qrufMM8jJqb4s5MnlREsWTW3VmvYrzqMqGV+tqEuzTDSUoem2NXMKeeX6hXB?=
 =?us-ascii?Q?mmmBVajoYBwU35436eRuqGlUCzWxqPr4aND4PM2KiLVWlL/HRusyI9ZGZLxI?=
 =?us-ascii?Q?VbZ1Ev0E6CZsOhCZAlSYlK5M2irKUdZkkfswCGVlZb0JSFTc0GfXYc7Yi7N/?=
 =?us-ascii?Q?r/ACJxe99pspr10MAA93brmXKAFknAloAKAxnXsmFUfIs86kaywPKLjBTu4o?=
 =?us-ascii?Q?jNE7z+9SwRPtNfG+rd3nRzue5R0wY/AVZaI3L6sP3OlE49UpTSS/DYkRXxid?=
 =?us-ascii?Q?2k2ErvFcKF/OIf1IGI6y0LxAfHxfqOVH3TYa8taUtcD3Aee+cK258+oiWpjL?=
 =?us-ascii?Q?15Klog/S178717XAbDEuPPSkTNsiPnzmsBDwt5BOpntxCNz/fMCCTMFUVvtX?=
 =?us-ascii?Q?ihfLjLHSDRV9Ex8Ilv31nlcCsSj5+O8ewtq24VxCtSyIaAFyHXSnQlqiqJSx?=
 =?us-ascii?Q?0WNDlq/P0VZD9VY0yhl2mvo07iIdL6LxoVuy+v1F51QUAP4NEhyGufrXb4Va?=
 =?us-ascii?Q?ldfvyS2Ox5ySxXqtgFo9VlKPCD246f4oaX+pb3ZnnZUYs0av2GT2jIoscx60?=
 =?us-ascii?Q?oK3kFuZFAvu0RVBXWeHMXDlJ1jTnjcnF8j3LPMia9mwLXVJ2q8cY4yhaFEqG?=
 =?us-ascii?Q?bWeyUeQNPteT5io+ZPbsYA/5EqkhSKKUq0riDxYr+9+PaQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AMTQgzIxI7dRK9twxSUFZl1KpV1mDAD+psP/QqG/ENOA+QVH8mEltHyzeAOS?=
 =?us-ascii?Q?1riY0+nv3GhL7MqRuSD281GkgyokMH0ytG3/S4Rf9qZu88WcBS/spmBWxcIN?=
 =?us-ascii?Q?G3evr66PqaaBQQy+2iRkDSLKhFcUP5Jd7xsefPmwds9tvnx4EniqbGo3w8rx?=
 =?us-ascii?Q?t0usJpxDcou1dybvU3PyLXSBsgvvvjjNEpLCf4yrNwt14qMqjQJ/u4qu6iG/?=
 =?us-ascii?Q?19Y7EWKOchmGtS+IjhT6CchjN+vGFlKpI4naIGYDpjeS8NXF4eJ/ocSAF5Oi?=
 =?us-ascii?Q?95CofoDVODE5H/bCFbQN8E5VBQywSWurcJk/wWRLlTkqiK7y6xwOJbeo37pP?=
 =?us-ascii?Q?7Hn5eceGi+jRknp7qX1Pg9DBaxJDKPLDc7fd1ZWo63ulyi7e/3gmtVuYlsOq?=
 =?us-ascii?Q?lXZJ/5ArKRcPxtzO2J56wjrKETqJmtsddNYqp2kc2quGAjaycqT2qHl4uOCJ?=
 =?us-ascii?Q?NaOUiAwmtGhdfBXkfCc5/3GY8Nbt/eDLe+hFPNYkFdDx69a5M4/SXhdIC5NL?=
 =?us-ascii?Q?QGctefSbJS8KsdSjKIrImiTOiYWskDTSuS82NF3h1sqAy//+Vam84Z0Bi0pt?=
 =?us-ascii?Q?EsG0Je6k98I7oZBwZd3SHC79TwoyGuq2atWP94pO1ZHN4RG0dImifG0PMhAs?=
 =?us-ascii?Q?wK9OWNFmwZ8YrZI+HljLBF5LXRLvLG+kJtqZuSibUfbdgW7caB3WuQgQ5Ffv?=
 =?us-ascii?Q?8bp/1rsgQedFjA7vdC8p/S7n3GPp2Knut6xIK3RGHW8LjJnhhM74zgUZSDU8?=
 =?us-ascii?Q?posxw54hFYdJHxHI/Ep83ltI1zRuZXgv9Sav+tzsrMgi1L5Z6RE0GaCBPIY8?=
 =?us-ascii?Q?Sbqp+rbc0d+1X3d42VzEI3vQnhRoOkh2fhEndE9Ox/h1o2NbbWXQnNcEzR71?=
 =?us-ascii?Q?KyiHnKPxGKolIGQw8FIVqAfCSjWGgMDaXep3g3YO+yFiWYWtUt0MAP8iLZDq?=
 =?us-ascii?Q?Gpfah9tfsffD27xbVXdBNkyhfHjmYBlrhSLI5zuZJPeCYn9URSzXbh4t/TQJ?=
 =?us-ascii?Q?bP0HAVYoovIaXEu/TstZVyCzVdkTqOa17RsMrjfRDeWnm3VSdUpi8P2iXt50?=
 =?us-ascii?Q?2KjIcoEhp1xDeNjjMLE6Z7q2hjN10+JOAxiOjfd4t7W2I6LoBIlrjdrjeHJ7?=
 =?us-ascii?Q?+7yDEiFIoUbR5FrRS5v+GA3Z20K0ebt9lWmIpn0nds4ankqoCDqy4ZlUBsYg?=
 =?us-ascii?Q?jPI6d0F3J1Q3Vysc415m1Ol6FbzfkklXGbYi7az8AtMoivGVnxsFLLkQorVb?=
 =?us-ascii?Q?HnnLAunLIhza5xOGvG4dTK2GYBlrnu3rhS5UPrEcsUuDZmBGubyPQwT6zUIs?=
 =?us-ascii?Q?sKER6xqvuoyzXgjYSgstbOsHUy60dK4FtY0Qs3FjJhrieNRBGqohKNHm8Rue?=
 =?us-ascii?Q?0VcD3j3aoN0WzzmV1dSude1vlUsw2yW46no9nvXD/TGACs2T0LgwVi6wgXf7?=
 =?us-ascii?Q?4cI604N8oWAca0ZLkjINqrdRyRSH3x1HS4/4P/JUry9K8ILd8+nyDIqumJqO?=
 =?us-ascii?Q?2fQts2N8bnLWRWST81kFxut41MzylwSLTjCsh3clHn3XYIM6q1VewZmaBSdh?=
 =?us-ascii?Q?cfGkfP/wqkoual4FpTT6R3j8o6rcBFtmwlFbYo1aehEXulZQfR2jolrYotIg?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fff8ec-26bd-48be-7ff7-08dd4fb3b020
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 00:32:13.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xho5XJl4O5fyficJvTxBt+sIbCGAD0M49bJVqCMGTNtpu+bEJeNghdGgfXBeVvze9Y2fQVdm2ZJJabDLyKXWDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7949
X-OriginatorOrg: intel.com

Hi Uwe,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/56
head:   bb98b2d2ae2bd66f1a46663bdeed5d1d70afd128
commit: 999ecc936a99cdd3392a652fa3686e74bae5d671 [1/1] modpost: Don't let "driver"s reference .exit.*
:::::: branch date: 26 hours ago
:::::: commit date: 12 months ago
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250218/202502180521.ogQ4rodj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180521.ogQ4rodj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502180521.ogQ4rodj-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.o: section mismatch in reference: opa362_driver (section: .data) -> opa362_remove (section: .exit.text)
>> WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.o: section mismatch in reference: tfp410_driver (section: .data) -> tfp410_driver_exit (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.o: section mismatch in reference: tpd_driver (section: .data) -> tpd_remove (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.o: section mismatch in reference: dvi_connector_driver (section: .data) -> dvic_remove (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.o: section mismatch in reference: hdmi_connector_driver (section: .data) -> hdmic_remove (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.o: section mismatch in reference: tvc_connector_driver (section: .data) -> tvc_remove (section: .exit.text)
>> WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.o: section mismatch in reference: panel_dpi_driver (section: .data) -> panel_dpi_driver_exit (section: .exit.text)
>> WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.o: section mismatch in reference: dsicm_driver (section: .data) -> dsicm_driver_exit (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.o: section mismatch in reference: sharp_ls_driver (section: .data) -> sharp_ls_remove (section: .exit.text)
>> WARNING: modpost: drivers/video/fbdev/atmel_lcdfb.o: section mismatch in reference: atmel_lcdfb_driver (section: .data) -> atmel_lcdfb_driver_exit (section: .exit.text)
>> WARNING: modpost: drivers/rtc/rtc-at91rm9200.o: section mismatch in reference: at91_rtc_driver (section: .data) -> at91_rtc_driver_exit (section: .exit.text)
WARNING: modpost: drivers/rtc/rtc-davinci.o: section mismatch in reference: davinci_rtc_driver (section: .data) -> davinci_rtc_remove (section: .exit.text)
>> WARNING: modpost: drivers/rtc/rtc-mv.o: section mismatch in reference: mv_rtc_driver (section: .data) -> mv_rtc_driver_exit (section: .exit.text)
WARNING: modpost: drivers/rtc/rtc-pcap.o: section mismatch in reference: pcap_rtc_driver (section: .data) -> pcap_rtc_remove (section: .exit.text)
>> WARNING: modpost: drivers/rtc/rtc-sh.o: section mismatch in reference: sh_rtc_platform_driver (section: .data) -> sh_rtc_platform_driver_exit (section: .exit.text)
WARNING: modpost: drivers/media/i2c/et8ek8/et8ek8.o: section mismatch in reference: et8ek8_i2c_driver (section: .data) -> et8ek8_remove (section: .exit.text)
>> WARNING: modpost: drivers/watchdog/at91sam9_wdt.o: section mismatch in reference: at91wdt_driver (section: .data) -> at91wdt_driver_exit (section: .exit.text)
WARNING: modpost: drivers/mmc/host/davinci_mmc.o: section mismatch in reference: davinci_mmcsd_driver (section: .data) -> davinci_mmcsd_driver_exit (section: .exit.text)
WARNING: modpost: drivers/memory/emif.o: section mismatch in reference: emif_driver (section: .data) -> emif_remove (section: .exit.text)
WARNING: modpost: drivers/ata/pata_samsung_cf.o: section mismatch in reference: pata_s3c_driver (section: .data) -> pata_s3c_remove (section: .exit.text)
WARNING: modpost: drivers/mtd/nand/raw/txx9ndfmc.o: section mismatch in reference: txx9ndfmc_driver (section: .data) -> txx9ndfmc_remove (section: .exit.text)
WARNING: modpost: drivers/hwmon/smsc47m1.o: section mismatch in reference: smsc47m1_driver (section: .data) -> smsc47m1_remove (section: .exit.text)
>> WARNING: modpost: sound/soc/codecs/snd-soc-tlv320adc3xxx.o: section mismatch in reference: adc3xxx_i2c_driver (section: .data) -> adc3xxx_i2c_driver_exit (section: .exit.text)
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

