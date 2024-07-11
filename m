Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F89C15AE0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 02:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720664679; cv=fail; b=Wdsn8JDO1W6PbJtQ6S71a5NrfL6/P+cVPF+YXsuMdzFVzY+buOM/p5Ir1+gTpt90o783l6rxOSR+gT0RVXZ/RgXJddJuZ4TQC0i4m6ykW2YJEeidADm3NHuryyg4vFdai0QXKEip0NSBIxsjomgapQ1w2mOuY8wJBf+Kpf8di5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720664679; c=relaxed/simple;
	bh=xIOEo9ZB1vhOkFJkM7HE6HoPSpZ1Kaln1agEqy0rr58=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZiG3DX1kihIwAzjqf6t9MP60OgJdbcoU6RPVv9mSDLH5mWoT8PMM3SC9798L3Ew7zQihXqcW/+yOfIjhVPMXwhGdkQJ8GecLYvTU2ig+t9BMNZH0RPTkuCXfaiZZatkZi8hN7A46S6TFG/JZfk8DTjC/nmkwaPZidiLF1HXpvy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRuFkG8h; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRuFkG8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720664678; x=1752200678;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xIOEo9ZB1vhOkFJkM7HE6HoPSpZ1Kaln1agEqy0rr58=;
  b=XRuFkG8hYH0FGZYhjuMMh/yAACk6t/AKrFIYAs9TNx0vgYmaQ7WZvFzr
   JsaAeNWYY1fZDdE873v8gh+t/ioDv4NDsu1SSHrwpwmRTUMgvpVCyx9D3
   pkGBPnmeYDtxSg2VYCFmwj8PODSBFCDc4gsrmcO7wKbHssz+qUSWti5Ap
   OC+DEzl+/DyiLTFhxFpMDjh4VzQ5hTECzbQTNH+9eOymlC7ePfISnv+OZ
   UFBcu2ZYETtVWdnuHDtw1EZL74Httd5MJYR174jQxnsZC9OFPl1owOre/
   3yzjjUZhjJ3Y7c85dz8DG99aDuW1YgmVFE7tD973fbTe6PAJ3mBRCOigP
   g==;
X-CSE-ConnectionGUID: +M3hwm2pRKefQZF8UbaDjA==
X-CSE-MsgGUID: Se568HVRRkKooTfsXOntYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="40540235"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="40540235"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 19:24:37 -0700
X-CSE-ConnectionGUID: 9Rhpe/t5RVCVl03jbPF4JQ==
X-CSE-MsgGUID: OR76ovNcTeSwDVFerE9u2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="53012400"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 19:24:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 19:24:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 19:24:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 19:24:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6/3BQrTVk5czi+WLcVahNHJCUSdCX4wW/TO14ve98cH0awSwdy0kNNfVlPaKNNTGjRSKAI82qOTOkdj+3WJsEWvGSrbnaPDSDGq6MhTTzQlGjaEuf4IvhrAngiCYb1d7aHHvZZX7BGzglbnnT998KDOhsaoJirWfHxMhIbK0kFw8NZocqioaSAqYhta6rdaD0tqllhNOlNWEDPiaF11OW5If5uR68dZEbQScTcGCx7wXiMEpqtNPGERGHU3dMnmSbOvstsoel4BDpgdatMa8Hmj5aC+CM/B1L6635pytZwqZD4qCXiEBweiC6xabuvM1NiBFMS3Q9B1q8XNaGD3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjNsuOR5Iki/lEBlNfSC2cSxYnPJQNNpVSRfK8ljo5I=;
 b=JDjNK6yEMbQWAefmFWLxZAOF+MLxNYTpsidBy2B8mCPoybP44FVDfV+s1Jhp7HsGu0qX8xYqIGJnWn+ep9PXNpAQPyAypj7YEq1XgupZRXTr8suWF1+blx1GlZWySBpxNVymG1kpI6OEfdVZLbQ94m7x4kthQ6nBIGiqZI+SqDFFQnKN9nbWBEuLEkL4FakdNTKSlWvF49rlb+9vOcSJ14bxAyx8Apuxw/9f4B23fXzFHvmcAMzH6MQ3m1Answ7VujNp/EQmg8JHNFwYNPrT2S2Op1WbhDJagBorAa/zrYBErh5f1TFKYTM8FJXCrIDz/X1jPaABY8J+A9T1+KNoiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 DM4PR11MB6118.namprd11.prod.outlook.com (2603:10b6:8:b2::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Thu, 11 Jul 2024 02:24:34 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 02:24:34 +0000
Date: Thu, 11 Jul 2024 10:24:24 +0800
From: Philip Li <philip.li@intel.com>
To: David Hildenbrand <david@redhat.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [linux-next:master 9094/10451] WARNING: modpost: vmlinux:
 section mismatch in reference: remove_device+0x4e (section: .text) -> .L604
 (section: .init.text)
Message-ID: <Zo9CWFsJWComLMjK@rli9-mobl>
References: <202407100540.VWczFcnh-lkp@intel.com>
 <6c6b2f14-9034-44c0-9ac2-81365086a788@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6c6b2f14-9034-44c0-9ac2-81365086a788@redhat.com>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|DM4PR11MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: c7429a56-2ddd-43d1-5893-08dca1509a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GAJl2i5C8Pyd4vkDNfQYv9JFmK7gdZ40DsU3KNZYyw5+ZeGWjIkIVvmzlaak?=
 =?us-ascii?Q?lRgNYXiioYOuwTMVd3fmhmZkAru2ZdkHLGhKRPqJOnTdeq7+yrMTbWOFg4nx?=
 =?us-ascii?Q?W+WChkRurDdpDY1fOcv/3IYLVqNf29xsM3XwCi9Gq+qHGdvqN7ZD9sUXM9/S?=
 =?us-ascii?Q?FOI1GRbOjqyV3rAPxfneF6ARm6XRm0VwF2wAaAsIQPoT3G6djiqiRUriqEja?=
 =?us-ascii?Q?87b6wYe2VCBOvDTJkkBRgRAKQh3V9qlNbTFbHMAGJNjQ/6w9K148ycfBhh3P?=
 =?us-ascii?Q?kNYEuKUcOBG/Ickhs+j9sMQI329EvbaFzl79jM/m96mpx9Jcn2u8GDDzwrKr?=
 =?us-ascii?Q?s24+5NdjVTYG9QvtASeeAPrFAANy5MteNmtXYBR8+pHLrsEAdIcSZPQ814+4?=
 =?us-ascii?Q?iMJdV3cJTHTH/1P8NK8nj+MpZzeoELcvxffc8pgU6Aj+ffxY3TzBFbUvgCQt?=
 =?us-ascii?Q?zxsR33SrH5blP99SMZUB0nd0bh4igksSUVSf3OETf0hRVgE+phEgFW8LGvUo?=
 =?us-ascii?Q?hxPSFF7pHMPXBwk5AkwB3mX2/4cZkwp8DdAcCRmOrNc0obtE0BWIDRGxZEIh?=
 =?us-ascii?Q?fSKg4O6Z6H7tYJDz2WDEPFBl8xemYvET0mSjjQOsGEFQeUL5dPoRkkP4oPBZ?=
 =?us-ascii?Q?Eu7BphhijfxDnCJ98+tgA8ScC0ZP/1OT2irionMhT/KaYFW9DHjj6rexxTZT?=
 =?us-ascii?Q?dhIBcc3l0T9kzb6gNUEjrx9fW2wTilCLbk5iRvWnscC/jKvVzJVgVCxaN9GU?=
 =?us-ascii?Q?xQu5yo9PoLneDoxHJh9OiqUj38Hy0qzLxCQk9Y1XjElEnkreHKjRN7swI5tj?=
 =?us-ascii?Q?rT3T2y0iGdTNVLRPhCeiJvoghf2x+55L9FR5wVoL1dllBOcptfHZAewZofSA?=
 =?us-ascii?Q?kGVBGn5rlaOVcAvLlcvDKCPJ0BgdFRiudiwVfArghCaTJ1Ho1LeZpAoneQYw?=
 =?us-ascii?Q?9MoJaJeCjxwTzih/mi0svLXRWy8SZN9BNe5guMmBvJfmbeZvHxX9hsFXUcys?=
 =?us-ascii?Q?7NoCcJmEt+yCPwjignpJemOAa0JXcLu6xLsHXYOfUyBkQP4hoed0/B6zWcaI?=
 =?us-ascii?Q?CRNDjPn/pzs/9kog7XLdKKG9Rdn3WLTvDx7Gn8GSeSOdWhslrRYEYdg4jzhp?=
 =?us-ascii?Q?HnmTclsw8Or4ninD6/CgO7CWEZgGdc6qEf2z0yEY1E1hs/dYnTMnERe2u9Y/?=
 =?us-ascii?Q?sSdupuQAlGkqV278E+xRWbRvmrXoQ6/twEzv3Y+VOD+FUACn+jVGhwNvBRck?=
 =?us-ascii?Q?nTcqZF+HqLWPTbKSMTmWdJFNWSdmUVqXi4uRLRzGqN3NMhCSjAvOXbaV+SmK?=
 =?us-ascii?Q?Qa8tK/N3vfxLSdsY9d00SpRj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fm2f85wLETxO5mtd5I81H8da+yc5QjvpQ9muSuKSBjB08bFxqD0/RU1G3jQ2?=
 =?us-ascii?Q?D/NG8xjwJfeX+2+zOX7yVltxur8ywGPEncphjC2jTKU/JdIM0ZjEa5kiAQMq?=
 =?us-ascii?Q?s4mX8w+WJVxozyObXnOOMPJHF0z23lribnmtCKcpXrxnziolIo65IERWWvNw?=
 =?us-ascii?Q?zHYZwgaJ/n5y1JkgxMVDy3Xe+MjpJGWQyjxltQrh9+rotCwcQnVp9LL5XjxD?=
 =?us-ascii?Q?YH7Jd3Ak3Zmc6EiwYSctrZ64gdcVi4/7EoFs6x8pEURIqe6q+RiWPrdLcU2T?=
 =?us-ascii?Q?AzqpumatV0SAlT5J9wYaoTozNaGaNAgpd7pAdUtrkltgY2wzj55cXHJprNTW?=
 =?us-ascii?Q?QhDo+OeAfk3U4aeJWrc4AbmJozjJ21mQm0PGhaeDgZ6XxZP2xXLtOItpV/9K?=
 =?us-ascii?Q?lutoU4MrqfB7AQYq42u4BjSo6q11zUm/Mj4UpAcGQ79k7vnmVoXS4DYVOmzj?=
 =?us-ascii?Q?KPZMN/kRFe6TD1qvMeTRpSpcrGwAk4mR9LWfhm1kyrJL2VR8zCP3ILuet4En?=
 =?us-ascii?Q?r6RCVDtcdakJfYE3d9A3xntnXa3AhjG5xqyE5+ScVU2mZ8QGZPAdJdXybR34?=
 =?us-ascii?Q?w2GrQp3x4Y45W/7zni0X5qKBE1QF7AGs2iOpwh78v03nd1m/zNxAxpgUNqH/?=
 =?us-ascii?Q?CRVjrdU29ZDFiwuUJo1bXXeUPqbijRhCYcYrQxP990OAROh6MDHUEFxArH9s?=
 =?us-ascii?Q?uyEq5hgUbGVqf0ooVhytQu2PBVU/Q/LuYauZ01tlNMa69dHOsvxIHrew6Lmv?=
 =?us-ascii?Q?qjS9i+fOf7UPzEhN4060+McpImUzTJJS6A4eoztdcU9EHgTAbRyvNmQSwWDp?=
 =?us-ascii?Q?d0bIQkz+qn4ezkyymhshW1fKgBbIdv+GR2F/H3SNNUdR6d3cCPCEelSeKre+?=
 =?us-ascii?Q?eJK1NG7fYGKJZ9BaxDDBfuFeA/2xPm7jNO/VHGv5lmQI008U4SymjeKk1NgI?=
 =?us-ascii?Q?O5r9khrnp00nx16W548D0+OsKB8JKYn9zvVugmhAIVdKrF6zW0d8BnkN1+OJ?=
 =?us-ascii?Q?caIHpVIAL0cRFneRy6X4tZSdggimJUzGQmlIZ8MrCxAgta/AaoSCLjttUCUE?=
 =?us-ascii?Q?NY199EyIe8zQugumFnm2pNocYkHsfKIpaPth/vyCTeFnXBBQq6mCAVM/g4ss?=
 =?us-ascii?Q?DJvq1Km4iUKTIHnPr/lwUNZgeWaJfVz0rpeNoX+WsAJ+wnabrvmviGIvh4uX?=
 =?us-ascii?Q?fST13VvS3dX7plWwhfGOSJwgUjvlzBS2NW8KP6CqhCzab3bgiBm0+Ydy8pl8?=
 =?us-ascii?Q?xykGiPD57e0hBVHN8F4Y4WJg2Ownmp81mNjkkfAoBWlmjQSF8XbzlrS72b8D?=
 =?us-ascii?Q?ndgyQovWHq36+WdlToHr+Dvv2B7WOXjt8HcponnZ2Qq7LNlRHLwOrmu1p/NN?=
 =?us-ascii?Q?C8zm00eseqBIZtKZ/sLmi2qIPIchC7oI28PIi1oiVoFlr53VOfFZeO65VLrU?=
 =?us-ascii?Q?aJgExrr0xRXICrTF7MANfHHyrbwcnRQKO/MNIjHAnn42c3A11XTQmcYZ9FQS?=
 =?us-ascii?Q?Ct9L4sP6COMT2XEBqejIsCmw4s5Gh62v1fqzvfgmkGUhrOwv8Lv2VZbgdeS5?=
 =?us-ascii?Q?8F5x45tsqXBq5trMrlhHkKp9gI/un+NafE1+bB+I?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7429a56-2ddd-43d1-5893-08dca1509a64
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 02:24:34.2171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59zVzImb4gr0kU62bAje7TOTr8SzS2FEhrmrzY8mPcWakGr/3/0AuPkapcVn7hbtrIQFudfeGwkjaD7JcJnQ6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6118
X-OriginatorOrg: intel.com

On Wed, Jul 10, 2024 at 05:03:28AM +0200, David Hildenbrand wrote:
> On 09.07.24 23:55, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   82d01fe6ee52086035b201cfa1410a3b04384257
> > commit: cbdfb23849b330b0156760ee0d73348e020b8cdd [9094/10451] mm/zsmalloc: use a proper page type
> > config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/archive/20240710/202407100540.VWczFcnh-lkp@intel.com/config)
> > compiler: riscv32-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407100540.VWczFcnh-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202407100540.VWczFcnh-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> I assume this is completely unrelated to my commit. If not, please someone
> shout :)

Sorry for this false positive. It is a wrong report which seems to only occur on
riscv arch. The bot will be fixed to avoid sending this kind of issues.

Sorry for the trouble.

> 
> -- 
> Cheers,
> 
> David / dhildenb
> 
> 
