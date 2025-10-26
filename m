Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90209288D6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 05:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761457618; cv=fail; b=CWSOZJYeX5oJzBRwa4HQRcIZDwYs9ESrNQw79quYYvoj9VnxTpbYYSBt5zzcw4Cit1b75iLCeyQUP1O23y+lBno9eissKfFlCWbxeK6RIG0/bqeIzZKHPvLpDTEmJCAe1naVATVwXGJNBFlasUBlFSNkRpEj8kUZUuS47ZeUves=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761457618; c=relaxed/simple;
	bh=21O+LhagNLcHdqUO4R/xZo3bVqpioLEByfkd7p8ISAk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=OVIEAEcDMdsWyrHhXTvejt6qF77uDJFLd43+Kj90Ne1VEfNFlh+IOWGPLZ+P9c4shqNuuE5qUBTT0eA/d9UKJkqjDpgiKxfORBJgtZW22yK68u7sD96YMTScP7xUCjN541+AoOXuI2vNKnCMW9nEtTlvXQWajxelkSgLeJtQYK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyTlnvs0; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyTlnvs0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761457616; x=1792993616;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=21O+LhagNLcHdqUO4R/xZo3bVqpioLEByfkd7p8ISAk=;
  b=kyTlnvs0lvAa18zmw8cnkc6QBTZ+PvXuds3MIV5T4c/F+m1BZYOh+KTy
   qUgfDiQfrX/8U/FPffERrJ97LWV2l/zJUe7Za3rSOops4lIAO02CNqKWW
   jcaAnpNOGRiBQN5iespuikKc13C4VuXvyNvYAxxI5RGEJL8FlhCWuNdCD
   sqQY5AH5iaLlWO9DbxVfd910nHBpRZeGUUvmL3WeJKDNE6lBqzr5z8ZTu
   iKMoaf7EA131Bp2k5dVEUzda2I/59gFAHPvM8pRj3DZkxV7pwiX4LpB/C
   FUwFAuH/b7IZmTTpGYKSmkf1IFS5/1TbMufAaR2wqZNV53flkE4rItoo9
   Q==;
X-CSE-ConnectionGUID: XJzFdMpIQqKkxSC5AptU4g==
X-CSE-MsgGUID: 0mfx1pu8Rl2jHXo0yVfT6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74694042"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="74694042"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 22:46:56 -0700
X-CSE-ConnectionGUID: eo6i5Ch4RGyDVe8N3CzLTA==
X-CSE-MsgGUID: +App8Nm6Twi0hd2mTcVhpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="184843185"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 22:46:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 25 Oct 2025 22:46:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 25 Oct 2025 22:46:55 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 25 Oct 2025 22:46:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v3IEkuvSS6OAqgo4twiQnNdbSU1ker11KWbGQ1pYZFqF3TnaBU7ULqJ3yggs/YNsjQkuTN+6P44EAmKzYFytxf9xz9fzOP8eM6o5PYOzaOTyLbroTVyb1rpGIeBIqpYI+a9Fy7jugKevY2mF2/14yQUyuAXj4W1PEDGInlYf3dKmpYlGRvhOKRl7uSG5lA0P5DgBGx4LvUlZaj5wvq1XIo6m3uBMh5zsjGBlYBDtRkiLp4Cwin69KGPHXj4Dz7/d9AgJFtDVX4g8lMq0HsQ3hGUjpCVkvmQ+Yj4+v9dcjo0YzYHJLErNA4QB40BRZsRZ81CMY4G1o3R6nwZiSWRRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+tMLoEXaDp11f2S1RjNutwe0zq/gj8GOzbC9rK5LSc=;
 b=HiLz+NlafuxQT5RXIjqdxFQdJSpHAixbbwN/XpkiEM3GX7zkoy6ENCfnr3ok8mprmyP31ORqEvaa05VWaTAkrca3/Bqq5ndMubtPp580fzrgZHbGX8j6HSWuOISyzJc6Vmh1C9v6/gdWlvyZDSNYBSzePshVrDiqjwNCjOzro6NHWsBdkhg0Km91Bu1FAg4ePxgjilIeWS3fsfbIpMw2KvPknDi5Z0xit0B07wjqC/YxuNLsqPm3XKneCSi72ebaEjuyiSlri220+haqaH3qtZ7HGktWY2kFsuR3hQsCsB6K/GbYKh1ZbW/q0eKZNWuctJKEDMkb+i7ywMbGQ1pVKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by DS7PR11MB5991.namprd11.prod.outlook.com (2603:10b6:8:72::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.16; Sun, 26 Oct
 2025 05:46:47 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::d9f7:7a66:b261:8891%7]) with mapi id 15.20.9253.011; Sun, 26 Oct 2025
 05:46:47 +0000
Date: Sun, 26 Oct 2025 13:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android16-6.12-kminext 1/1] posix_timers.c:257:13:
 warning: 'check_sig_ign' defined but not used
Message-ID: <aP21wJkJt8lWsVAB@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|DS7PR11MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: f324bce2-e2a0-4cc7-f0ff-08de14530d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MATw8zD4Ii/h0OAzRp2cdB8f1DdI31+KKs9XEv8gmtc2x8bRL5etj15bNoqS?=
 =?us-ascii?Q?Q4RsrZZZCVpVRDMugf3fcem38vdlJEUIgKQUJb/EZcb37ThFRHofHOiiKQqq?=
 =?us-ascii?Q?u1XqiR+DjgYdsTmD1LriWBLwNHHRr8q3yvDRjOlBZPvA44Qv2+oeB96t1mnp?=
 =?us-ascii?Q?krMVC9jHz2XXt53/KKLnmzMO4EgrWSZpv/L01lijku5EUtu/S2xcl28Nbm8u?=
 =?us-ascii?Q?h/o1to4ccbZx7cRxYl14v11yYqD6ElHgsuX/gZYMDFX/il4e8EcVr20nIhm9?=
 =?us-ascii?Q?FwJ6LZv1kjgeZN2KiE5/rbAB2FA5U1azN7PcIJ8La6ap/uo9ch4LTGTtN6fR?=
 =?us-ascii?Q?sEHyH4soUZWHFrHTSi9e7keVTLxH3jGbzU3IYFK8Yh57bK8ITrtAWcjDEd+d?=
 =?us-ascii?Q?FH8dyFkIKhNvtakFHMJ4Iczln/gk7kX06uE8O/ei9tfD+pOhyxA4dir/pd8V?=
 =?us-ascii?Q?vbB+EV77UEf+kbTruwZEgj/U2JvAe/peq/+2iaLqTXjAwnsRlkjxUJGdVSKJ?=
 =?us-ascii?Q?bjNcBv3+tpEzx6UxJgYj/LlsTDAtYcvtPenkZvdyro9Xj77RXfRO2hBSUvv0?=
 =?us-ascii?Q?jYSfTlla+bPRsV4P5k3bI3vbI6AtAj4ocqflNu9oeNKODsyAxNCeYbHzgSWs?=
 =?us-ascii?Q?vl4c2thTWtcJmQ3hzgsINjoM7NocOgAw/4es0IoBORfDa7yLibIRvvHu1eHq?=
 =?us-ascii?Q?AMeszzPJyQmzb0ffv3w9qBGlRmVqfzRssvt5TWWCt6tEFD7Y5zPmUPiz1Px1?=
 =?us-ascii?Q?ddv/TNpudWEauChJ5syD7qT3LhkbzG4vmU+YXvYyGJSW6ouXDGIglwNL0zZV?=
 =?us-ascii?Q?eVOqjgPz2/hBZJUUoww3IpzGMzwUc8L+Ije+F0iBR8VvTEKjcQdtEIRrHNh8?=
 =?us-ascii?Q?Bk1KO4F3Ww4BmxBZ45AqcwaPVMShis/MHvArU9truuRNH9j0iJy89dsWPl52?=
 =?us-ascii?Q?cL80OaWGpnXwVy8cwWv5r8RoEW4XFZdvHfByEiD/FTVyR+bkQRPnq+fWNdTi?=
 =?us-ascii?Q?vNC6GpTLYGviTXn4T/aqMaVvqwE8r2/T2EHrbFonwYvwduzvFzX9psHRGW/4?=
 =?us-ascii?Q?DjbEKYxgpi4oZwvsa5HN9PGMhrX/NfwiI2vQTfodTOCgGMj8TX1amR8oPKg9?=
 =?us-ascii?Q?gLvR2sqeA5YKgAf25HK8P/v8qIUL25WJSmXLdGJnEstGv6g6sBC2+lIUQX1S?=
 =?us-ascii?Q?lh4/y4NTod0ayY84mGARZ+U5SHUYr8uj3KDNmrUW/Lzo0Exa6GXD+Umkcp87?=
 =?us-ascii?Q?PJatjoXgcnHHvBxtiU2r9YaSjrJiktp9oO6j8FBqiObsNLMkg5plf6VHL7bv?=
 =?us-ascii?Q?rf7bEXrnfxLrsf5notJaPZAwbonwM3WdcyIrgcDI4P2X2f0HDlWq1pWWXMQB?=
 =?us-ascii?Q?rvHbLgc+Fhb4I3UMYBCKjDT/P340HefIxrPOjyo6k90NhESn/opd8WkVOMsn?=
 =?us-ascii?Q?nBTz3B+55x4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/FWx1otdqDRqKDb8HAkdfR31d9vkbJJXDNpHIFNVWAoRq09UJuJtNK6XsTs/?=
 =?us-ascii?Q?c+TYXU0zFcdArr6t9nUq6DrOd3/IHyhv0O5yX53F6Up/lDA+5ojT3t3j+W82?=
 =?us-ascii?Q?F7E6HLSLkueIAd6SCMR1cNXyHdpKgu2hFJdwiDg/Lr1Sg2a6D2NA2dcIRoEU?=
 =?us-ascii?Q?upbn8TKjVRSvdfd0KsxrKMLU2Yu6RoCijS1FAd57D1wRKBNijRYmc8X01/jC?=
 =?us-ascii?Q?1lx0+uIWm2Lh14AnL0GP1SEFmyP0hu3n5m/aFiLbnQX6AsbMK1W3GXtIXNF8?=
 =?us-ascii?Q?JWouqfIcq+japHQ0OTB7IVFKgTwKPgFmEEUTeyyL3OvuFpl0vlMJUAgijKBx?=
 =?us-ascii?Q?l6zAv89PlMjarUIyPqTZWxPqboyV0OU0+r7+6NFImbUijrQedrj7RrUx4bDr?=
 =?us-ascii?Q?ijyiBA/0XEUiyyrsr0I9xOSbWxERueeU8yurr83KhlRSmLMd0qzxARKPlddl?=
 =?us-ascii?Q?qf7fSGgJUt0hjPNw1aq6JwDSyycZ/DZe2a2x1F9kCjnrrnrFCxAH8q8D6khA?=
 =?us-ascii?Q?fZ4f2DicjIONhfPfCqMw/QCwDDmr9JfIDJFuZO6O1o+bfL7kZNIZBpeFsQbt?=
 =?us-ascii?Q?BLwEgQNUSwGcYjvdYUE7r2+nAUDL91jkFUH2hxmU6/WG9qaOKsdwZsPY8kTf?=
 =?us-ascii?Q?9mBp+rrbLBTodmobKtuK277pVlfh6Dam0GscnbOmQkCkjX7SGUKiIUnWHIXj?=
 =?us-ascii?Q?RDVEAqVxlFRwLCYh5X+Iy5T0zNH8kdB6FbbkT0OReZd/c623tMLd49Yjme1c?=
 =?us-ascii?Q?SYg+UZIIooBLRn+oh6As8bU4TtA5UrNb+lEo61YJrcL83RCzFrh/pNVXM8fD?=
 =?us-ascii?Q?mf4ypfKI8lDKGd4xCakW6nhmAfacunnWMJtTLMcpMmWKEdkjAd1kPnJbRNp1?=
 =?us-ascii?Q?Au2TItOP+7LFzcrULZ/NKRSCeLInmpU1AmjbBBNjWQRcSw6TngxW/UPjCY1Y?=
 =?us-ascii?Q?VBz9cQuVlvmQwC9sNjkOxJdrlBUQI8H6umQUToUxDcTMz60K0dLMQVip5YEB?=
 =?us-ascii?Q?Xa0Ar+JQE4kV0jRqdk/H5aJuZH+w9VZmJP+r9dZ2rNQg2bbVlZdfVn5qg/4a?=
 =?us-ascii?Q?qTVUdwYo4mPF3zi8+1Gxpsw2MJh2TZ3EkW71QE9kzLr5+ja4f6UCjNiGGLok?=
 =?us-ascii?Q?bbjULDdJeCeFFoxWg7SsE5UW35W8gpymuOLhEO6Smcp+FsfX15Ug3GGkQ5PA?=
 =?us-ascii?Q?9KcTgvFZen6KLOTo2q7fHvkK2E9VrrMezXEW9lwOy3hXr/fNat6n977iPLRT?=
 =?us-ascii?Q?2uPDxh64A0xV0oUOVu7tyz2WCSQoP0L9hUSDt6cznLU4PixLlNWCl9P4e42y?=
 =?us-ascii?Q?y8QBlydqZjAfCYI0vXeZhBkHmGbcNYLLGDmQQt3a+DANQ6knJb5qTrBWbVx9?=
 =?us-ascii?Q?vGNM1vsdJlkqLUGATS79O3BIhZfSlaonOxl/UDrcCj67VhSgia5mAnFWO29a?=
 =?us-ascii?Q?I+AnTaV3diD/ylaq1Q4V/D05mSwTIVCo0iXbTY3tmkd+WRAZL1REj0gUGy5R?=
 =?us-ascii?Q?qhogQoCc+1m51cdSbCgLNofIc5QxFHn1/5/APWFJjXSKe+96Aq8lUvEfCsex?=
 =?us-ascii?Q?othacvUmq12i7Bnlth089agDB4fgWh88wZ+GehMB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f324bce2-e2a0-4cc7-f0ff-08de14530d6f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2025 05:46:47.5860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wAOC1cOSLaDxOaT57RGl7PsP5YVY3ywxIZxqYrDUvPGZ25s17gBhJaxgkBBRnMy9Lb+1Qo7o8b2P5nM0NSomsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5991
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   8979fee435bfd762771c71f3cf99f6f279038337
commit: 32c1bffe815c9ed746ce7d84cae07da17db6bca4 [1/1] ANDROID: Compile kselftest_timers_posix_timers code
:::::: branch date: 2 days ago
:::::: commit date: 1 year ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251026/202510261057.CubMnZ3S-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261057.CubMnZ3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510261057.CubMnZ3S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   posix_timers.c:399:13: warning: 'check_delete' defined but not used [-Wunused-function]
     399 | static void check_delete(void)
         |             ^~~~~~~~~~~~
   posix_timers.c:343:13: warning: 'check_rearm' defined but not used [-Wunused-function]
     343 | static void check_rearm(void)
         |             ^~~~~~~~~~~
>> posix_timers.c:257:13: warning: 'check_sig_ign' defined but not used [-Wunused-function]
     257 | static void check_sig_ign(int thread)
         |             ^~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

