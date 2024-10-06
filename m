Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2C81BC41
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 14:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728225052; cv=fail; b=MmonezbqIRViQ/mn35my1hm22QR0iIKr7oHoO0ssIAe+aQfM0j5PPjNfeQ7VoHS7KEmYBS/aDygH3JcMw9toek0KXGb+X/4pvHZzOiwzLsjLJfQb7P/h1C3fONDKNQQDCh7+M2f9/GT2aX4G3q99IZBj3Mp90rANvv8LS6Clows=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728225052; c=relaxed/simple;
	bh=AQPBTuxBT1uRHva8vkqzjaFT7r6GSurwiXy+EppiLTE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jKTZtKzep1h+MCXeaH55xdFOU6EIYJiX97gTU8M5NMavHOSS6I0hDapmwo0q/J6Mnj49inssHPGD/OYCPpBrJHkuQMRX/bQD+Mu9uKfqWNfeFr+E8BAfc4jixxHR1MSedoV8zDYCc32my78kGvrGwqLykAWtjBgShJf5oPGASAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nH9lR+fg; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nH9lR+fg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728225050; x=1759761050;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=AQPBTuxBT1uRHva8vkqzjaFT7r6GSurwiXy+EppiLTE=;
  b=nH9lR+fgavX/5UcQPSDx5wtmzfztpiNTG6ELOrrxkR5iiVNIIOEE6Puu
   lQQFyI5jD6xdYCuqul8gsQwwMNDnDRqOm0Fqu83UhtMNMz9BlI2rvdH3i
   /ThTxLNQyJaYhg2f4GiX0B5KbvHChZbVUaciZ/qYY1Uzd1+hTW5zI3mdx
   z0I3AcFkfenmR+Z+NElAOiZjAQIvP8K2C6rVcEVvdWczFPG6jlwG76ap3
   EhS0b44cSzrH0wJQ/xuXnxflyNtXk29huPjpBoiLAPBd/ttwWu+xeGTqX
   tgH2abRyl6fY9JlFdZSjl8tX8phjGyk/iopHIq0X55Bq70ZEPUyp4ovq0
   w==;
X-CSE-ConnectionGUID: gpg73KPsTKmFVt6kKochfQ==
X-CSE-MsgGUID: DR69TKhpRXiw8vX4P3AQ6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="31267075"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="31267075"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 07:30:49 -0700
X-CSE-ConnectionGUID: EbVAFGI2Sm+N3lFueSULaA==
X-CSE-MsgGUID: lXpQI5BEQt20xm180gyS8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="79617866"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Oct 2024 07:30:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 6 Oct 2024 07:30:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 6 Oct 2024 07:30:49 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 6 Oct 2024 07:30:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qLjcmqHPr67+uOiR6Yz++ZektSqIfC4m0/yUMEVPtBkC0LOzfu+TE5xOS8hdesUEy8/nqTCkkuoql/qIToLRBEl0G3XbHGPPzRsAlQ9oWsAYhYMUkHosPeeEeOU/p2ab8//ZcAsTX3OG8kuJtomWuoMAKhFls0Ge7vKKf/7EVkpCpYvFrMvJErtIUsFcXM0GIACErbLhHRQAiVszX76dg6PLkfF3y99K6aBsuCfaHin17HSxJwhWO0ypBGnogdZriBYLGLJjpcaTEBG9JLX2p0NJscLqFBmCbEbZ/0TzvlV6KS/LVpyvu2smni2X3fMtNDAFfpeqN41J0q/WxCAS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmZJ7phXtLJqD9oeza7WsztkD2zh6fn9PhFDRw9zOZI=;
 b=dZfvLWFYtPB0osBt97Z2CS4OXh9cPJVDOVG79pzmGeXfXAQ+3vqwswT7+pDywqrk7naY+Uu+PEHQr08iA0GdsUq8Z/DqDtEjgYQckl0qVmv44Lb/OKf0+VC2MYq4d3qNVHnPS/AGUYktpzcf9eiiO2BCkyP4Rc3l3K40vlikJprwT2lNX0PtuUC5Oypb7YQLfI8EU5sVN790oQKsTkR0GcfinlhP6WN0cORhv00xPWY2XL1FkLEJGv7+6UR1p5CDuobx/Y7Fi4RLVsSMNaKZR9SgTpKPTKTuhfxWrLL2HovNble4wTWp4K26yqPVXd6oskNVW7VCLDS0Jw5cL9snYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW3PR11MB4634.namprd11.prod.outlook.com (2603:10b6:303:54::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Sun, 6 Oct
 2024 14:30:46 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8026.019; Sun, 6 Oct 2024
 14:30:45 +0000
Date: Sun, 6 Oct 2024 22:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
Subject: [linux-next:master 1158/2483]
 arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: pinctrl@9880: Unevaluated
 properties are not valid under the given schema ('reg', 'reg' were
 unevaluated and invalid)
Message-ID: <ZwKfDBFBgX1S+/8t@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW3PR11MB4634:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2d158e-b2e2-422f-a321-08dce6137693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/oWJ2kFtUAIk01BsXzijtcupnALxPkdBUejdm3nJgPu9z4w9UJGMiLyZ4a+f?=
 =?us-ascii?Q?c/z8moPlmLh2rSK7LRRZOW7N7HbF1VZRNhMNKKjqO6MIj5ISfN8WLpe0iHgU?=
 =?us-ascii?Q?n8TY9EF6Haeoj5nIh8jTu7IoKLZku+1n3opAVzZElBVUri06tpFpaIo97A7U?=
 =?us-ascii?Q?XuODahkLG/7paY2ysO/cvduSruSN05DZhKa/Dj7ko0w3yDQqRYfnJN4aFGp9?=
 =?us-ascii?Q?VqtCrG+saJ/SW+Ns+x1d6zDNvYLpYD8jxkHZs7dQJKWaZle89diuoESvTDxQ?=
 =?us-ascii?Q?IA/XsvgzCrjdOqXWiFBdgENUDWyiIT1KgQnAJoWMO3cKCzigvQkrtBoDz1Vs?=
 =?us-ascii?Q?6nHMOeE95QbCiPY3cCWm/MfYqfojU1YOvkiTJooKZA1UelbRt89pteSO2FTf?=
 =?us-ascii?Q?/BTA6tG5yz4PHvt6koQSIuQJeuMjHmW35pKevEkeOVGesmwoovoYlFheMVcb?=
 =?us-ascii?Q?aYrOAKvzzNPbISB0g+h8HJt/bD2NCS3dpCrgFGyGVocCesgSvr0eJU/5ytIz?=
 =?us-ascii?Q?upYMBKR+LVAtl4mN0eiyCSId9RsVhRSLyr0gZ9IF0LjINfpYDwjt8qewAxie?=
 =?us-ascii?Q?SHH/W7ozkKVt7ws44CJl0d1REx49LjWOmmdlQxGCGvRRupEFUzYxAaUqyyIJ?=
 =?us-ascii?Q?BlOwh2Y6wnPyn3ckUuuut26za3QJYpVhLxp5wmLFQhJXXkMFazAEuzK0XubG?=
 =?us-ascii?Q?R170HMGS1QNIsCAEukD61bx5Jt1bsFaWLp/rTSe653YlPHUWXlDDWlAhfqBj?=
 =?us-ascii?Q?LDanbJ/0jCQzQdN3ef1X97ElxpK4HawpZrprjczP6YcEBy2qiHXIE2zQi+eg?=
 =?us-ascii?Q?dvpp0QhcCkuzyqdA7jdHOjnDwQM4oHbyY5NZKErA+CD4aiEnWBIh7EkzeA3x?=
 =?us-ascii?Q?ww/Lf7kfBkOL5TWpVOcEPOLlCmyJiL8t+yI50yQVJ9KHYhsPG/Ih7q5uI8sw?=
 =?us-ascii?Q?y/pLiej5gp/VbPt3vHWhQVl8gJBjg15kZ6J3mCd04A2RRgccf2CPT+n3IotX?=
 =?us-ascii?Q?OyUclL3y+XjKM3+DArkYXDA+rQbap0QkWxrYpoCEUl/b1OErboFo4ZAVA5UR?=
 =?us-ascii?Q?Vph541qqJHcPqK6GavqDsamar9PaTMMF7N//wkRUifi7cxmH1U/hayjXv83d?=
 =?us-ascii?Q?GxZxKBjwMs98ufLmW0ruwOFYefr/WT3k19V+M+GHhzMsjiM4ykgkvHK/fe9C?=
 =?us-ascii?Q?iHjZFewtYG4cL4aC9TlDWQekYCjPmVh6RAsjobRzYldleb9daqrnHoVp5FSt?=
 =?us-ascii?Q?nPgk0UPDWrmFXjSaLXi0BYbgwtjigeRGUgkbU94Se54r14S1LpZvgOQ7+Q1r?=
 =?us-ascii?Q?bT8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AHq2JUajlB5gEAAuzJFCX6jSNX8df4iulhB3KuouioZP6qe2UWuagMJWVh89?=
 =?us-ascii?Q?C/KuSSpGKenFP8KXoweLH8C///odfZkzFovE6eZ2zkU5NZyVxJRVvDNvksPt?=
 =?us-ascii?Q?IFZB4bc4Z68lNTK/VwdcW+otqlz0iubAm7yemAGCUg0Y2CsriQmuyJIyI57T?=
 =?us-ascii?Q?c7SX2pttJwqaKoyd+lOqHx6qBvNrPFBlvCkecqekNz79FE4KwN+fhGPY3r21?=
 =?us-ascii?Q?O1VYljNUHB1/ZmBVipK0GR6tI2WrWB+5FNSYExXjVV5o8M0xfAAyAMqUA8Jn?=
 =?us-ascii?Q?3YxMH9/zSrdrieqHzIjohYg0u11OHL9jJtEOMXMoKSQJX91eSCzXOUns5AbE?=
 =?us-ascii?Q?NnDnGhV4p9iRAx9IQPCKhb1X/RrQODCCebBa2L6ZaXzjzb5acu2IDAeKE5r8?=
 =?us-ascii?Q?jINEMfe7HterVKPPHlYZJP4dhh8ENOwovwGvTsqAvjfQrMjx/IaBqQYbA0mO?=
 =?us-ascii?Q?eJqNLnlWT++ROpii8eamnhltfezgkAvp9ERiRt+DB8WxSR/jTUdnllcb6l7X?=
 =?us-ascii?Q?7AcAADQ6VwuBdwzfsWSmrTFp1juKHtbRBHTX7joP65pUJS5zxpaEg9t70q7I?=
 =?us-ascii?Q?c5e7NhnpJRdQHpON1BVZpJd+U9kN9EomUaYpSwi1lQszfdqqe9mkN8SUHktl?=
 =?us-ascii?Q?q2Ckz/0KPtuOTnZvOZmIdyMDX07KeWbKTrllTjCsmTpu2WMCkYqA3ToqKD0h?=
 =?us-ascii?Q?+2KsrmueiDtO6mvx9Ox13EUsXDKGTVr3VwthdMuFU7BUBJ6LuVwoJF+3SDKv?=
 =?us-ascii?Q?3isdgxgLJlgDR/nQKkEfozu+DXuziewgkZdXDk0Nex1+xEMn2RpkYxwNx2Jn?=
 =?us-ascii?Q?nA1iCBbdVPpNJgiY5uvaTzU/kSHHNdW5xA0KAFO8jmIkPFr4KE7Ca+bhJNUm?=
 =?us-ascii?Q?ud1X/zsI4Shz6/Opd3ozl8Xgluy0BEel63qcCeXqtUYV2nIS2Acu5GmQCnE+?=
 =?us-ascii?Q?XYN+P02M0rMjfZ4K4X9qeyQsnGFv+nMy6P1TMIfyR5ZXlbZK4Gt+CytMyZaj?=
 =?us-ascii?Q?H92pF8vVqwRDeC5ZRL5XlgcS4mFNkzoDN4RwinvqqWaVR3QhyJEZ7/MTeeqF?=
 =?us-ascii?Q?yAc0bU957h+9hCoL05HybhOGrb7I1IOEB8RdcslyKHQ18k6rc7uAZVGqD4ZA?=
 =?us-ascii?Q?L9rIypdE3gYJetv4dc68IyNKeXcsqKrV8grOZUTMkgi9KErjipCH1K6LegO3?=
 =?us-ascii?Q?ExtZFrrXMZuOEQ9qzViOrST2peI8lz/axT8CxJ1g0HocfUvqzu1km/LrF5ox?=
 =?us-ascii?Q?N5DGhwIJwxnZ8yEh69Lo2T/cf9JvchSkcEIOuj2lSl8wXAni2KshulPabRNd?=
 =?us-ascii?Q?RsPLSSMxTks4xslRZFnUk3KiP458DMCOoKmHJqjbTHQ7gxREGO0+Rbkthdln?=
 =?us-ascii?Q?jSgDtkodfkianxeOtdV26g6QcfvXVS0YJUgEHv5KrPLqoH6STnvYUz7Q4fdX?=
 =?us-ascii?Q?8mZ4dWR6N/HorxYpZDfvGGt3cDLftdSMf9rbchXDn3M+ebU4C3xMs0734DPX?=
 =?us-ascii?Q?CJA+BgdIarQg/N9a9XzLMcih/QF2YXgClQAwF11FGmWxxPhg3pdODnx1JvzK?=
 =?us-ascii?Q?SicadnHEFD0parbmaDWDiCcAnAFmjrQR5VkEpoBx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2d158e-b2e2-422f-a321-08dce6137693
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2024 14:30:45.2377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tN8dBNPdpMKLtJgDtTfSUOLZTSBxVwmgusPnGFD2nKlZ6uVi/eNPh1zwdDZC1VJ7l2Lp2r8k/nNy3B/SWW07rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4634
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   58ca61c1a866bfdaa5e19fb19a2416764f847d75
commit: c3806b25c0f3b95a7f6e6edc23f93ff293173bfa [1158/2483] ARM: dts: amlo=
gic: meson8: use correct pinctrl bank node name
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-051-20241003 (https://download.01.org/0day-ci/archiv=
e/20241006/202410061918.5v7hXIQ3-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef=
3566a25ff0e34fb87339ba5e13eca17cec00f)
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20241006/202410061918.5v7hXIQ3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410061918.5v7hXIQ3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/amlogic/meson.dtsi:161.41-168.6: Warning (unique_unit_=
address_if_enabled): /soc/bus@c1100000/interrupt-controller@9880: duplicate=
 unit-address (also used in node /soc/bus@c1100000/pinctrl@9880)
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: /soc/bus@c1100000/sys=
tem-controller@4000: failed to match any schema with compatible: ['amlogic,=
meson-hhi-sysctrl', 'simple-mfd', 'syscon']
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: /soc/bus@c1100000/sys=
tem-controller@4000/clock-controller: failed to match any schema with compa=
tible: ['amlogic,meson8-clkc']
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: adc@8680: amlogic,hhi=
-sysctrl: False schema does not allow [[8]]
   	from schema $id: http://devicetree.org/schemas/iio/adc/amlogic,meson-sa=
radc.yaml#
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: /soc/bus@c1100000/mmc=
@8c20: failed to match any schema with compatible: ['amlogic,meson8-sdio', =
'amlogic,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: /soc/bus@c1100000/mmc=
@8c20: failed to match any schema with compatible: ['amlogic,meson8-sdio', =
'amlogic,meson-mx-sdio']
>> arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: pinctrl@9880: Unevalu=
ated properties are not valid under the given schema ('reg', 'reg' were une=
valuated and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: pinctrl@84: Unevaluat=
ed properties are not valid under the given schema ('reg', 'reg' were uneva=
luated and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-aobus.yaml#
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: ethernet@c9410000: 'p=
hy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: ethernet@c9410000: 'p=
hy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.=
yaml#
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: ethernet@c9410000: 'p=
hy-mode' is a required property
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.=
yaml#
   arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dtb: ethernet@c9410000: Un=
evaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-n=
ames', 'interrupts', 'pnictrl-names', 'power-domains' were unexpected)
--
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: /soc/bus@c1100000/system-co=
ntroller@4000: failed to match any schema with compatible: ['amlogic,meson-=
hhi-sysctrl', 'simple-mfd', 'syscon']
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: /soc/bus@c1100000/system-co=
ntroller@4000/clock-controller: failed to match any schema with compatible:=
 ['amlogic,meson8b-clkc']
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: /soc/bus@c1100000/i2c@8500/=
codec@1c: failed to match any schema with compatible: ['realtek,rt5640']
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: /soc/bus@c1100000/mmc@8c20:=
 failed to match any schema with compatible: ['amlogic,meson8b-sdio', 'amlo=
gic,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: /soc/bus@c1100000/mmc@8c20:=
 failed to match any schema with compatible: ['amlogic,meson8b-sdio', 'amlo=
gic,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: /soc/bus@c1100000/mmc@8c20/=
slot@1: failed to match any schema with compatible: ['mmc-slot']
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: pinctrl@9880: bank@80b0: Un=
evaluated properties are not allowed ('gpio-line-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: pinctrl@9880: bank@80b0:gpi=
o-line-names: ['WIFI_SD_D0', 'WIFI_SD_D1', 'WIFI_SD_D2', 'WIFI_SD_D3', 'BTP=
CM_DOUT', 'BTPCM_DIN', 'BTPCM_SYNC', 'BTPCM_CLK', 'WIFI_SD_CLK', 'WIFI_SD_C=
MD', 'WIFI_32K', 'WIFI_PWREN', 'UART_B_TX', 'UART_B_RX', 'UART_B_CTS_N', 'U=
ART_B_RTS_N', 'BT_EN', 'WIFI_WAKE_HOST', '', '', '', '', '', '', '', '', ''=
, '', '', '', 'VCCK_PWM_C', 'I2C_SDA_A', 'I2C_SCL_A', 'I2C_SDA_B', 'I2C_SCL=
_B', 'VDDEE_PWM_D', 'VDDEE_PWM 3V3_5V_EN', 'HDMI_HPD', 'HDMI_I2C_SDA', 'HDM=
I_I2C_SCL', 'RMII_IRQ', 'RMII_RST#', 'RMII_TXD1', 'RMII_TXD0', 'AV_select_1=
', 'AV_select_2', 'MCU_Control_S', 'SD_D1_B', 'SD_D0_B', 'SD_CLK_8726MX', '=
SD_CMD_8726MX', 'SD_D3_B', 'SD_D2_B', 'CARD_EN_DET (CARD_DET)', 'NAND_D0 (E=
MMC)', 'NAND_D1 (EMMC)', 'NAND_D2 (EMMC)', 'NAND_D3 (EMMC)', 'NAND_D4 (EMMC=
)', 'NAND_D5 (EMMC)', 'NAND_D6 (EMMC)', 'NAND_D7 (EMMC)', 'NAND_CS1 (EMMC)'=
, 'NAND_CS2 iNAND_RS1 (EMMC)', 'NAND_nR/B iNAND_CMD (EMMC)', 'NAND_ALE (EMM=
C)', 'NAND_CLE (EMMC)', 'nRE_S1 NAND_nRE (EMMC)', 'nWE_S1 NAND_nWE (EMMC)',=
 '', '', 'SPI_CS', 'RMII_RXD1', 'RMII_RXD0', 'RMII_CRS_DV', 'RMII_50M_IN', =
'GPIODIF_4', 'GPIODIF_5', 'RMII_TXEN', 'CPUETH_25MOUT', 'RMII_MDC', 'RMII_M=
DIO'] is too short
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
>> arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: pinctrl@9880: Unevaluated p=
roperties are not valid under the given schema ('reg', 'reg' were unevaluat=
ed and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: pinctrl@84: Unevaluated pro=
perties are not valid under the given schema ('reg', 'reg' were unevaluated=
 and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-aobus.yaml#
   arch/arm/boot/dts/amlogic/meson8b-ec100.dtb: sound: 'anyOf' conditional =
failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
--
   arch/arm/boot/dts/amlogic/meson.dtsi:161.41-168.6: Warning (unique_unit_=
address_if_enabled): /soc/bus@c1100000/interrupt-controller@9880: duplicate=
 unit-address (also used in node /soc/bus@c1100000/pinctrl@9880)
   arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: /soc/bus@c1100000/system-cont=
roller@4000: failed to match any schema with compatible: ['amlogic,meson-hh=
i-sysctrl', 'simple-mfd', 'syscon']
   arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: /soc/bus@c1100000/system-cont=
roller@4000/clock-controller: failed to match any schema with compatible: [=
'amlogic,meson8b-clkc']
   arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: /soc/bus@c1100000/mmc@8c20: f=
ailed to match any schema with compatible: ['amlogic,meson8b-sdio', 'amlogi=
c,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: /soc/bus@c1100000/mmc@8c20: f=
ailed to match any schema with compatible: ['amlogic,meson8b-sdio', 'amlogi=
c,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: /soc/bus@c1100000/mmc@8c20/sl=
ot@1: failed to match any schema with compatible: ['mmc-slot']
>> arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: pinctrl@9880: Unevaluated pro=
perties are not valid under the given schema ('reg', 'reg' were unevaluated=
 and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
   arch/arm/boot/dts/amlogic/meson8b-mxq.dtb: pinctrl@84: Unevaluated prope=
rties are not valid under the given schema ('reg', 'reg' were unevaluated a=
nd invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-aobus.yaml#
--
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: /soc/bus@c1100000/system=
-controller@4000: failed to match any schema with compatible: ['amlogic,mes=
on-hhi-sysctrl', 'simple-mfd', 'syscon']
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: /soc/bus@c1100000/system=
-controller@4000/clock-controller: failed to match any schema with compatib=
le: ['amlogic,meson8b-clkc']
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: /soc/bus@c1100000/mmc@8c=
20: failed to match any schema with compatible: ['amlogic,meson8b-sdio', 'a=
mlogic,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: /soc/bus@c1100000/mmc@8c=
20: failed to match any schema with compatible: ['amlogic,meson8b-sdio', 'a=
mlogic,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: /soc/bus@c1100000/mmc@8c=
20/slot@1: failed to match any schema with compatible: ['mmc-slot']
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: pinctrl@9880: bank@80b0:=
 Unevaluated properties are not allowed ('gpio-line-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: pinctrl@9880: bank@80b0:=
gpio-line-names: ['J2 Header Pin 35', 'J2 Header Pin 36', 'J2 Header Pin 32=
', 'J2 Header Pin 31', 'J2 Header Pin 29', 'J2 Header Pin 18', 'J2 Header P=
in 22', 'J2 Header Pin 16', 'J2 Header Pin 23', 'J2 Header Pin 21', 'J2 Hea=
der Pin 19', 'J2 Header Pin 33', 'J2 Header Pin 8', 'J2 Header Pin 10', 'J2=
 Header Pin 15', 'J2 Header Pin 13', 'J2 Header Pin 24', 'J2 Header Pin 26'=
, 'Revision (upper)', 'Revision (lower)', 'J2 Header Pin 7', '', 'J2 Header=
 Pin 12', 'J2 Header Pin 11', '', '', '', 'TFLASH_VDD_EN', '', '', 'VCCK_PW=
M (PWM_C)', 'I2CA_SDA', 'I2CA_SCL', 'I2CB_SDA', 'I2CB_SCL', 'VDDEE_PWM (PWM=
_D)', '', 'HDMI_HPD', 'HDMI_I2C_SDA', 'HDMI_I2C_SCL', 'ETH_PHY_INTR', 'ETH_=
PHY_NRST', 'ETH_TXD1', 'ETH_TXD0', 'ETH_TXD3', 'ETH_TXD2', 'ETH_RGMII_TX_CL=
K', 'SD_DATA1 (SDB_D1)', 'SD_DATA0 (SDB_D0)', 'SD_CLK', 'SD_CMD', 'SD_DATA3=
 (SDB_D3)', 'SD_DATA2 (SDB_D2)', 'SD_CDN (SD_DET_N)', 'SDC_D0 (EMMC)', 'SDC=
_D1 (EMMC)', 'SDC_D2 (EMMC)', 'SDC_D3 (EMMC)', 'SDC_D4 (EMMC)', 'SDC_D5 (EM=
MC)', 'SDC_D6 (EMMC)', 'SDC_D7 (EMMC)', 'SDC_CLK (EMMC)', 'SDC_RSTn (EMMC)'=
, 'SDC_CMD (EMMC)', 'BOOT_SEL', '', '', '', '', '', '', '', 'ETH_RXD1', 'ET=
H_RXD0', 'ETH_RX_DV', 'RGMII_RX_CLK', 'ETH_RXD3', 'ETH_RXD2', 'ETH_TXEN', '=
ETH_PHY_REF_CLK_25MOUT', 'ETH_MDC', 'ETH_MDIO'] is too short
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
>> arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: pinctrl@9880: Unevaluate=
d properties are not valid under the given schema ('reg', 'reg' were uneval=
uated and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
   arch/arm/boot/dts/amlogic/meson8b-odroidc1.dtb: pinctrl@84: Unevaluated =
properties are not valid under the given schema ('reg', 'reg' were unevalua=
ted and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-aobus.yaml#
--
   arch/arm/boot/dts/amlogic/meson.dtsi:161.41-168.6: Warning (unique_unit_=
address_if_enabled): /soc/bus@c1100000/interrupt-controller@9880: duplicate=
 unit-address (also used in node /soc/bus@c1100000/pinctrl@9880)
   arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: /soc/bus@c1100000/sys=
tem-controller@4000: failed to match any schema with compatible: ['amlogic,=
meson-hhi-sysctrl', 'simple-mfd', 'syscon']
   arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: /soc/bus@c1100000/sys=
tem-controller@4000/clock-controller: failed to match any schema with compa=
tible: ['amlogic,meson8m2-clkc', 'amlogic,meson8-clkc']
   arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: /soc/bus@c1100000/sys=
tem-controller@4000/clock-controller: failed to match any schema with compa=
tible: ['amlogic,meson8m2-clkc', 'amlogic,meson8-clkc']
   arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: /soc/bus@c1100000/mmc=
@8c20: failed to match any schema with compatible: ['amlogic,meson8-sdio', =
'amlogic,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: /soc/bus@c1100000/mmc=
@8c20: failed to match any schema with compatible: ['amlogic,meson8-sdio', =
'amlogic,meson-mx-sdio']
   arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: /soc/bus@c1100000/mmc=
@8c20/slot@1: failed to match any schema with compatible: ['mmc-slot']
>> arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: pinctrl@9880: Unevalu=
ated properties are not valid under the given schema ('reg', 'reg' were une=
valuated and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-cbus.yaml#
   arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dtb: pinctrl@84: Unevaluat=
ed properties are not valid under the given schema ('reg', 'reg' were uneva=
luated and invalid)
   	from schema $id: http://devicetree.org/schemas/pinctrl/amlogic,meson8-p=
inctrl-aobus.yaml#

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

