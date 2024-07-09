Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DED642052
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 06:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720505329; cv=fail; b=cNTPkE26iWIWPX0PZrWdkgp/hCxVo5+Wnh53Rf1vdCOCjAUJ+qWjqLCrcfXnBj9Fb1qdBmZj5UoRBicywBpQLPi8LWgIyQ2KC43zn74702bgPBUE5a6m1HjXzNvymWUMtPZ0LXk17oBxKRlyvkS+SRAz4sfDWxof1Ki0V0UCfc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720505329; c=relaxed/simple;
	bh=Y6BTBJJrjgvohwV5o2YC8zELKKcQmGyAlb0pua/3NPg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=pkEcGGEdWBTfneGzmFDVfURlkyak9ApKPnOQ3pVP9ZD864gYROC7/I+1shtWEGx02nzuCpy2o2gaJr21H/mxiSfgV2fYRmpA3oviw6deybGzjYC1R9+lD9LL7Aj/4uHPoOICv/OVXEtEPcsfahmWHzovFPwzu+EBInxTtmj8rOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFxUc8pB; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFxUc8pB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720505327; x=1752041327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y6BTBJJrjgvohwV5o2YC8zELKKcQmGyAlb0pua/3NPg=;
  b=NFxUc8pBNQ9fFlW/gEa2eAzEOTTnZceaPOqdn975H6NBeybqStNQ8LRN
   Puth9AoWMWm7yodyHZtLgBEbRR5dPxNgvTMHoCP0+Znw3Jk9GIQO8A6gy
   92j6OMuk4KrXuK1PlaJb0AtmdAvJBv5nEHKlWUuERVGTGimGACs3tuSnL
   qdEu1/Wc8mIp9kJlT5ad1Bpmmo3ITJ5m1nGq7+NB9sTSpVavIYSCR1X+W
   dmE4kab15YK+HhpYHORq3yQGcZpgtYau3L3Vwe4l+EJH+7x7ybpe7Ehbg
   92N7W7fhjWc3SXNwu5SUF00vIFdE8bWFDS83dASjScnnrLVO19Dlgby1z
   A==;
X-CSE-ConnectionGUID: 8X8SbrisQrmOiiPRppIb4w==
X-CSE-MsgGUID: 9aW2mAfQSiqdb7dZdT3TAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17608640"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="17608640"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 23:08:47 -0700
X-CSE-ConnectionGUID: UWsDXBj1SzeHLClhGdTcJQ==
X-CSE-MsgGUID: jF60W5qzTiqkuacxLYvOUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="47664390"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Jul 2024 23:08:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 23:08:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 23:08:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 23:08:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5sSoazriN0PBL9FAVnME06MHR+50YeFBnezVIX7bTjAgSz5N1788EoqR60bnrEFyopnJbuxfCRwZfLSp7K3eluUh+kEyenEyoUuMWU5AHo7grHsQ2Zy44AQfACESUoedHIDz3Nuvtpq0KBVJNHWwejawuzARL7ZHFDZ/NoP7y/JuxuEpKQJ045NjF+IQz9xiMk4fk5iHDGR7n/JeoZrwmRQht/xbNQEzXLA8Jb2IjuqiKbh77RbPtDIUVK7QoBxkN+QDF7UFCE+Mz9MsuoIpJjtmzexHO3sCasueL0gkOF+ph4EzViUebaxQdEiF+W10UwLvFpW+tpgixEX/UpdNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+TkY8PcJFueidrUdE+Od48AXc+5cSeQf3Pw9rTPbpA=;
 b=AVue6FaF9IUFLL3lhGy8GCjZXJA8vlDn3xF4rjYryyFmcRnbSY5HMzyG83ztQi/7Uavbjl4onHjPUuczQJk7WHGyYNHVuWfaIav40k+4vPHbJa+CZYfLC2QdXmmrfi2OTrLvj0GcVola22F8Xlbg9Pan3Se6FciM3jnfhdmGOCE05ZbnMhFicBoe14pzqcNa4WAszNuqTz7rFbdng2b7nYbevE4xTACCt4h9nanMEV7NaWchhyX5DsDD6y3OjYTa+5NG6BlPxBvL9/CH++pX9JvVzUTaMAmM3MJWsfiLDDbbUukHCFr7hfw3eLsK016foEiqejKaiKZrRU5ci+mk2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 PH7PR11MB6426.namprd11.prod.outlook.com (2603:10b6:510:1f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 9 Jul
 2024 06:08:43 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 06:08:43 +0000
Date: Tue, 9 Jul 2024 14:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Pavel Machek
	<pavel@denx.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-6.1.y-cip 6/14]
 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: fcp@10880000:
 compatible:0: 'renesas,r9a07g044-fcpvd' is not one of ['renesas,fcpv',
 'renesas,fcpf']
Message-ID: <ZozT4rc0O6mza9IF@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|PH7PR11MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: ca850566-60fa-490c-dc8c-08dc9fdd95ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YUJHlKvMwJ5IUnP5mh6jX2EbBTBXEZqUFmU6gS8YDgd2yUIKfxVNmM2saTxr?=
 =?us-ascii?Q?6ezs+AZjtxSGiQFUEN0aaPUsIigRUWbDeacQY0cCKzrYciqz4wesjMu81YrC?=
 =?us-ascii?Q?HolrN9yXeTGF586OyJ6OXihvYsbI0m3MpXh7hqZaJaQzXnUvnxluv+8aWA5B?=
 =?us-ascii?Q?5SMN56GZqpcW5CO87i1bO7ckC7m/slTw4aoLDXqd4d8GkejMKYScDrphplMp?=
 =?us-ascii?Q?SbcvsXrAGTalt1wLxJEUKyU+dCY8Y5iJbTWKOrf3xk9APj4jS5cyn+T7BGf8?=
 =?us-ascii?Q?tIiK/2jwzcq6ij0+EfXODKIpSPSHgihaqhPzwUd/AhyDlDLD4RVnQ8lQJ3ag?=
 =?us-ascii?Q?S6jQ3asJkF/imolXHk1HleNJM2NBY7TsIYEKKnk/cBxopCulaCd4xMIZrlRN?=
 =?us-ascii?Q?KWOuCD4fo/oGS5RskbEv1vCbv3LSuIC+4wVOSENAauLWaNckwxN7EcQ3GTsx?=
 =?us-ascii?Q?lw/HyjwrLP3Dt1qM3xAh1QEvtQbQhWMnfQvIZh15bCI//ua086PB5imc7NeH?=
 =?us-ascii?Q?XwqnjJwEdHGi6ILfRpOERhqzipSPrZez7iIAVkqy8lJNX5p0Jx4NMtYi03AC?=
 =?us-ascii?Q?9WjoWV7zN2H2RP5SSf2IGkX9F5jp8EsqIkJ3mOdISBg0+nAI6Xf5NfQhytOq?=
 =?us-ascii?Q?bFlw64E6Qv4JWcx9+taa3uEpb7xbJfpaA24guiWj/hUteob0xsuD/pSKTmWo?=
 =?us-ascii?Q?hT5HiJHWPr0PerGTR2Vrsxs5KKUS7HFcWYFj1CRpweETEjaAiyIuWm7flXBr?=
 =?us-ascii?Q?DRlhpfkEH0SxbU0m1JJusaAjJ4aDrAOh5VPwxpJOLyYur0xDEtzL4hcgQ0Bv?=
 =?us-ascii?Q?US44nLUSrB5JpcizAgynOf1mFi7U6piXZVyQ1cveccYUty4PBheaIUX+dEBl?=
 =?us-ascii?Q?LbmbRgcwZHAoAOYyi7J1MIO1UN4AwI5wK/smc3/IchfP4kwQMEkhSkaoJIe6?=
 =?us-ascii?Q?Ic2+bphPluD3QrJmKcIqu6B+cxNh5/QEpUNKXfwF5AzNNU3XrvcJvIX541Zm?=
 =?us-ascii?Q?2WsS7sM4TqnuZaTsU6Cp5mrYW237NsLwvzX0cF4FoBG4wiOn/c3SePOcIG6e?=
 =?us-ascii?Q?arC0CxcC4J+MyYR2WMu5eCpn4juZ9y6EsEJ/tj7TnIcm1FLfCfuAzTqsPzCe?=
 =?us-ascii?Q?VW8NeyZKo7iqdyY3FxUQ9Vs2o8nW/elW22iEqclxQVcTVGqXrcNg7ZZPjMuE?=
 =?us-ascii?Q?o3htCSi1Ed0DIZIgHD9vrKhbsvw1gg8rjazlPal2VqkX5l0Cscr+hLEgdIO6?=
 =?us-ascii?Q?VqHsq4CqXoN8+B+JK+VkOe00LloZVvK/HtA3WRrIzPBDunWP/QN3VoOmAaRQ?=
 =?us-ascii?Q?TSwAIoXhzqRc+P9YXFvLBGSp0qubIFoNX+GCQidsP77sOU7XjOJK8/CsDleT?=
 =?us-ascii?Q?WNxOMxM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tF7nehwQk9UdUZyOjOWgfX9ZN0ajOcW/xYQhHeFSVeSZdIGhy2208202biSz?=
 =?us-ascii?Q?zAqEYMofteMXEqh28uGiBWStU/VDb7ETIbreC+akCxZrKK5VR7oIKjCFHqTp?=
 =?us-ascii?Q?o4eXCrT7vigJAy+PqrvqmIhDY7anJetmCW3tN9kXgXuVuvn1+JkSSDGj0zwT?=
 =?us-ascii?Q?9VWVoheyeV9xjrBwjgxmp0qjCUvQ+ZrfQ7d2i2Cox8XlvA+smmHgs/8LKHLR?=
 =?us-ascii?Q?MRCNuHoyuRKMZyg3eDC6+gE5NekOTG8gUssZdz5+DHB0CPuhENZ0Z/6VRCqz?=
 =?us-ascii?Q?TJPqn3OFUlYctnEnSnLoWKmaRxA35g+z63n19DH4u3EMy1vpg6of1VMtq0rf?=
 =?us-ascii?Q?/EzkZWhSr7RoBmu9FUsSApb1MwnVp1ZExE/+wQVO3kntRDvXec3DQ1wqMo49?=
 =?us-ascii?Q?9YmwyrtEqc5ajgoOWDUjdRM5/P/XW5V+3QAfKc15GKHN/jg2lZSkGgejCGt+?=
 =?us-ascii?Q?RJ8aair8cGbpVNbaFrttYitPiEYAzd8LnzlkIq+4SXPjLCm338tINUIYfqZ9?=
 =?us-ascii?Q?Tm0WQABd0mRvx2Nv110xOb31AgvAv7mgFOtVhkhiHOdPhBqmKzhI+BrhfLNz?=
 =?us-ascii?Q?Cho0QzCChs+366RGpESaUca/bmgXnZyRnGBIgtfiPgxx6GDfeBPMEQqpcdvf?=
 =?us-ascii?Q?PJPi1k4IzvJLx4Iqe2kc/ia1NQynkGB7ic4o39VEl9RSApwEJAiJDqOxB56Z?=
 =?us-ascii?Q?J6ZTvj3a6SngM7pvHko1jUZB8pOKlI79qRPk9yFsM0OpSONKRBvB8UMpROsk?=
 =?us-ascii?Q?fLUh2qGWGWz2vm54K/5ED+G7pgPteS5pq3ddtsEk6ct2p+8k++uk9Fp4fEU6?=
 =?us-ascii?Q?g97wMQ9HNtAUeNef+Kcw4vmgtvocretqrS0VGWrV++HNhjyA1xF6h/6XMHn1?=
 =?us-ascii?Q?R+RjjNdC9vVuwXXYDXT0Eh4T8Tv5puilGG53hGTzHDeIi8LvH5jZih3SDvfb?=
 =?us-ascii?Q?dgbbnlHwrH2zw9zfmO5lLnJzbPZFq0UC1IjnW+15QgdQyDjgpzI4+1JoxNQ6?=
 =?us-ascii?Q?buFWwcAKROJpGiY12yofjYE8C7Najx96bpAtAi1McFmBdc+F8etmGJbwPFX2?=
 =?us-ascii?Q?eQ6hz5tcr1JSi5q98qpPBXfdup6Nm/90tKjQC2gjwUKjsGoJ/kHBU24B3wxS?=
 =?us-ascii?Q?ffitGHDB8EyCwy2npzv8FoD6RyH8fZ3wkiHWV0oaX/EKbXHUtogi9+e1vOcJ?=
 =?us-ascii?Q?t4/XZnDeP5uW8z6+V9wF9bi38ExEGgIrAtEYR6AvnMqG8NYbr0KXhtIobPN4?=
 =?us-ascii?Q?uI8MGOe83+32p/RvQcqf5bpwg4G+5uQMiCXlQzJ39Gjnus6zWDAB7qGg2CB2?=
 =?us-ascii?Q?WtoKdh0vJRUyRGQCJP6V1OrpYfz4mz5K08Fj4T9YtUHX9hyDloypmU5ltbsY?=
 =?us-ascii?Q?hAWnCItfrb4LFKDIpzLaRbFIlxFDtftJ2hwugDxwTC27U9EoWfRlvLvY5X9o?=
 =?us-ascii?Q?sSxMS7959vr5d45E6ymSp4j8Cd2d0ksvTN/TeWC9LP2/CoitBaylB6wJb+Nt?=
 =?us-ascii?Q?46HhlyoJxPDjKNzq1KO0IUg44zEGVuIkOWhESUzRJAq75BibyjeWNut2CM6t?=
 =?us-ascii?Q?lNfmDGrjnC2gnpyOl6r3Gf3Wgz7wKZwLb/24XDhOwiGqICcgLzG3UL83jXvO?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca850566-60fa-490c-dc8c-08dc9fdd95ac
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 06:08:43.0041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jc4SEZSJyU7pzV1KPgQDS7xpb5l2SF6fSCEzwf04n9rNNrBv87rxSN7kvCRr79KetwouDii7ooSEu3ccRBinkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6426
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip
head:   36ec072fc37c836df41fdb600a933321aa4804bd
commit: d22ba3fa55a226ee0e19b868d4575932d50b9217 [6/14] arm64: dts: renesas: r9a07g044: Add fcpvd node
:::::: branch date: 13 hours ago
:::::: commit date: 10 months ago
config: arm64-randconfig-051-20240708 (https://download.01.org/0day-ci/archive/20240709/202407090525.Hr8cGDXl-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090525.Hr8cGDXl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407090525.Hr8cGDXl-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['micron,mt25qu512a', 'jedec,spi-nor'] is too long
   	'micron,mt25qu512a' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'micron,mt25qu512a' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: flash@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: /soc/spi@10060000/flash@0: failed to match any schema with compatible: ['micron,mt25qu512a', 'jedec,spi-nor']
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: fcp@10880000: compatible:0: 'renesas,r9a07g044-fcpvd' is not one of ['renesas,fcpv', 'renesas,fcpf']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: fcp@10880000: compatible: ['renesas,r9a07g044-fcpvd', 'renesas,fcpv'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: fcp@10880000: clocks: [[4, 1, 57], [4, 1, 58], [4, 1, 59]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: fcp@10880000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dtb: /soc/fcp@10880000: failed to match any schema with compatible: ['renesas,r9a07g044-fcpvd', 'renesas,fcpv']
--
   	from schema $id: http://devicetree.org/schemas/sound/renesas,rz-ssi.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: flash@0: compatible: 'oneOf' conditional failed, one must be fixed:
   	['micron,mt25qu512a', 'jedec,spi-nor'] is too long
   	'micron,mt25qu512a' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at25df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'micron,mt25qu512a' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: flash@0: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: /soc/spi@10060000/flash@0: failed to match any schema with compatible: ['micron,mt25qu512a', 'jedec,spi-nor']
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: fcp@10880000: compatible:0: 'renesas,r9a07g044-fcpvd' is not one of ['renesas,fcpv', 'renesas,fcpf']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: fcp@10880000: compatible: ['renesas,r9a07g044-fcpvd', 'renesas,fcpv'] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: fcp@10880000: clocks: [[4, 1, 57], [4, 1, 58], [4, 1, 59]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: fcp@10880000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml#
   arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dtb: /soc/fcp@10880000: failed to match any schema with compatible: ['renesas,r9a07g044-fcpvd', 'renesas,fcpv']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

