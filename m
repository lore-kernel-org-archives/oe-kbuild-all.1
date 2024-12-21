Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601C1748A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 00:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734741950; cv=fail; b=dDpSx8J3DzJ/ZNZ2IeNBtRdUQWVGk8Zmb00+hjMXH2rXbaTrM4EcVh0I7wjinR/fvMemvgKwCto+h4VF3SJVlSQakfeQ649jaWlGYm58Q1emYBhTcWmL77HBpM5arCkmigmpNXnEgTz+H7Hn9EijQKq1l0XXgRBIO5AE7qgbJkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734741950; c=relaxed/simple;
	bh=r2FuHiVjedtMXlNLZNBRmPwLUzN1kuikyc22kftNE7I=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QCzSZzJ6wP/XEjK13dtVnaWrAoloBV9Yico+ZSdxpK4CW8xCHLnHAEAC/wbyKX/0ihwtWFQEf33wZI0OIssoJ9SgWfSx4I8OSeYqp55HBw3vYta3pP1udAvUzYj/VxU+HCTw0KSKtee7nR5L0bJOa3bcNyHn3YQ4xe24nIIgMaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1zPMUvi; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1zPMUvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734741948; x=1766277948;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=r2FuHiVjedtMXlNLZNBRmPwLUzN1kuikyc22kftNE7I=;
  b=e1zPMUviOmtKBIzGskvNUgaSVLWJNMIxLO97/qgMqSsy5MtosK2N1tIU
   pshcYH63/q0qfbi0xWemvJIulm8MGRGGyUZn5v77BBQZCOUXCA+PNqSY6
   8AtVAcxbG4qO7Bgc3pF7DZyYvXnCmtE/lqb+BLYe1Yp+h8rBYhvJ0LdZF
   sCSUsys6MgXRfpBpcODFPTqsptmkthwaFdWB2K0Ishtk50BI1JT+cjAZb
   GlsRqQNMJvC7vsgqA1IfhNtCQKc3hM5EPypH6Ns+EyTn78bZDCqX7iERL
   msMSlpH2i0R+eJnlW41yCkhtzUZZ1BdBnCOOXWCYi77AfWeoKDffwgWMC
   g==;
X-CSE-ConnectionGUID: yWs6yLKUTKGN2QYKfWn+DA==
X-CSE-MsgGUID: P1faBVXmR6WFXxIm/p27ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45903608"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="45903608"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 16:45:40 -0800
X-CSE-ConnectionGUID: 40p+kUu8QBOpHGL+FihGoQ==
X-CSE-MsgGUID: aV3xr0EzSZ2/isrrkLWUrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="99044226"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Dec 2024 16:45:24 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 16:45:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 16:45:23 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 16:45:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cC9QSuPqCnehC+QYED0PRM3kefeFC6YQnz55tmbPTSp0CJISkZbb9ZmIQwaWCAiLV2z4AOMnYSxJS23QyEdUy2Z/7Ic4pmAGtCd1z1rYTlNBayKjpjLXetdhjzEVLBmhT1b3YrAwZvZibxhuJUgQb2JiBpBZNFb08KwSwlV39N3YDk46OiRB06qEqG/nhtxPTaNvqsfKXPvRnWNT1IRyHdhRGxcfAAEqoGnD96x+iCczZo0AbdNjnvi8tRbhTwaeeWdClZlzkH9corduW2vs7mmk6IRflUxxP6z6aK4JezU1x8F8Yhrj8DgwB2NLDEUKjRmlVOcyzxJ+t7K1+Vx7Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxhascGYIC8mLLdB7GRhnAQljnLQAHI6j4hdIBweAdQ=;
 b=Ejg3yOYfPdrnTYGpPzkMazO+1AJwG/Xq5Z3zo9+TqAY/a/zYuFCEt+liKEutxi+NHluUmI1a5XKa7NbT3hWx2zuVOZdRN0ExqhgkGQyWnWtvSGefHfUO25RZ+2ilyheMPj0lynolvbxINym4UIOipoSLb3qGtE/heRSLYnbo4nFxBcBPZV+xE/vFDjbNCT4CaGd8ZK4KZZnHlgWuq+H6voTiXyA2vXsQLYSWobs6O+aSAODxNb7VFzVkYoDyptXoJsnyHAmwjZ0/XGMzr3BgGkVjE6J25mPMvqCdlR0BSmxhx0ERpiAeU15PriwCbAXbB1ZK+Zix43y7D3NZorbGDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by IA1PR11MB6217.namprd11.prod.outlook.com (2603:10b6:208:3eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Sat, 21 Dec
 2024 00:45:20 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%7]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 00:45:20 +0000
Date: Sat, 21 Dec 2024 08:45:13 +0800
From: Philip Li <philip.li@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: kernel test robot <lkp@intel.com>, <kernel@openeuler.org>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [openeuler:openEuler-1.0-LTS 1336/1336]
 drivers/mmc/core/.tmp_core.o: warning: objtool: missing symbol for section
 .exit.text
Message-ID: <Z2YPmW710Q8mQExf@rli9-mobl>
References: <202412201128.mwjfPZy6-lkp@intel.com>
 <20241220102137.73764ef1@gandalf.local.home>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241220102137.73764ef1@gandalf.local.home>
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|IA1PR11MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: b31889b8-1985-4541-7caa-08dd2158bef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m0ZUHlxDmEcZskuuWtYfuyethihn4vGiDzDgTc8t3x7cjDQLIboNhSxuDPNO?=
 =?us-ascii?Q?YxDgiC4PH8ZGfNk0EXl2oIfZ0fje2Qz+p3p4N/hPAM3KiPjK2cORncz2fVIH?=
 =?us-ascii?Q?qyRzbE2lpKbNHN/Tx+dnd6A+bgJlTHVEvq6ujQ8FDoNjVrYDppbh1sfYacHZ?=
 =?us-ascii?Q?QcCq4D70qxHIPfJEPN8jrF+VbqD7+42Ious+vhXDI5w/agNc5YEMekLTeoQ6?=
 =?us-ascii?Q?dG5j8pIwG8n2a8+BnjDmEnoS5ZNwRbq/dLOsxxtMx2iKzlzzwwfGWosrKurb?=
 =?us-ascii?Q?y7YrHavQFJjMhULiMOMLVtlkYj2uGiLspdlXx1A7615oFelYkBN5GHWlv9f5?=
 =?us-ascii?Q?IxQr3KBZ/kxPdNLGvUbiYt8xhc6Yi5v40z5LEs+tMVN9CKXtweVySA1x7iU2?=
 =?us-ascii?Q?v7Rvs3SFeAMjPPXYfnpNNu4duYij4/rFZ4t1cLxmZaTZ4a0am+fTbjNiHHEk?=
 =?us-ascii?Q?5h77u6/RmFsOfq6Cno3m6YIIhrLjwHld1MnsXw6zCTPUas4Kus6j1+6M45Mo?=
 =?us-ascii?Q?Xi2q6JfJuJwcr3nWVgH5h7uoQdLvi6Gz6SKz5UpUAMMn2DikB5IF7BNmGPhH?=
 =?us-ascii?Q?Agzy60FsjNls/00Iok8VpwPqSOFqyyL2bKfLzHSJESS18tHlWKRAzQG6y+IN?=
 =?us-ascii?Q?/mzNEo+f7Ri7dEoJoqXmJiR4IppNwy6tkQHkmEOJw47H+7lJliA64iRCV3cR?=
 =?us-ascii?Q?f25SW/wYiABWaeqUtf4F7haeEhMh+80cu7R46LwvVm8RMhYmKBJwhYhPzWkC?=
 =?us-ascii?Q?6nxrtzULPtBvnl6DHhNuDCBiOa+tS/OTt8PojXiBL5EdaLHVve/d5YQ6is7/?=
 =?us-ascii?Q?GNbX2frmXSraQmyYSnxGUJjmN/chITIAFiXBIdWY0DpIdn2+5M/95cbP3Xi3?=
 =?us-ascii?Q?WXu/8VTBhOLPO4Xtl4RkcoT3MxAl2BDAgGe3ISmi8Z/Px13AFctRwol/OJqi?=
 =?us-ascii?Q?D/9xjfR1lzS29pS7tLg3875o1gxxYNMLozHzH2SKuG/IBFd8cWfzSFeC3Jm/?=
 =?us-ascii?Q?Lt9Fhk9UB2nFBcH0Li5S+Ei4yAsIJIu9a2pAA7aKw334swB9on45nY2tLHhE?=
 =?us-ascii?Q?cC2Lnpo4Ws7rJgqB2T4F8Y3lvq2dlGJoKCRGpywvUpWLq/O71gdF+n6ZeI00?=
 =?us-ascii?Q?8LPFMpTAp9Mw8SMq+1CxMIs4JzJtTabx9rIrXG3KODU0CF9KorRNF7/JNVbj?=
 =?us-ascii?Q?7Veqm6SdEgVrwCgLGn0uMnos5RTgEOVFKv6SSe1rzJOyt4BcrgdiyBZx/eL6?=
 =?us-ascii?Q?jAXWqIV4SL84Ff6Awy27MvpnG0oUNni+IgLRPm+VJ14pjkBQ8VgSijKwY0d/?=
 =?us-ascii?Q?sldK6xtc9T5P8elEiTqMcPmbIG9GW5CwYuTsegRdjbDrZA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pNN8yR+D7R5SP8yqU58Wg+3vpisy1IjeXpr4hzsjv3R47z4s2i+2B94eK9S0?=
 =?us-ascii?Q?PcFf0Ym7ZDWZHj1gdr9ehsqypq4G9q2sFGeW5SPYkcozsf9t3voxDzjBlwZn?=
 =?us-ascii?Q?0EF+UPLv0lirn4XTtmDVmbkmjq+pOVKdHwQzeqSqci2NZDs7OoiLRQXB6Qk8?=
 =?us-ascii?Q?MPFDCtLpoJo9y71kQDYT5gg+7FHL5yINVX9tnJC98oMbYjsd98NU08ku7I5C?=
 =?us-ascii?Q?+poe0VdU4mLv3p/j2Afok7ujqSpBCCKdWnJ9IST7v6xT0APTGdMYCu3w3IAG?=
 =?us-ascii?Q?N+lg5BHIUrbG5zhuLkEfMvWr1FGEs44XLYXiorh1taL4K8sPI76OdTpqz4IP?=
 =?us-ascii?Q?5RAe4tWJOgIQsX6/0n+YWVf/zMM6faCrAOkwR8lk1nGWssT8iI+f9ttX6diZ?=
 =?us-ascii?Q?hz1xigU3iwMO2hSeRh2E74kQKIsBwKkooFdc7XrhQX2HVHLiLCaLUxjKlkse?=
 =?us-ascii?Q?/p0E1cbKPqYr21wuT1gVnUMlbba9nDC3IDK9EGX21ViPzAe+xE5odciiSI1t?=
 =?us-ascii?Q?t55wnA/LvfiyFENt8f/oQwzddN4ZUtn7bZ66+CQSeitQ+fZTxcxOsPjYuO3K?=
 =?us-ascii?Q?gLpirsnFBotld4/XGYlRvgMzT8XDKr0ucIsn+ZfSFGqRpPeZLjEViPIdjbUI?=
 =?us-ascii?Q?Aw8EkKLp20MXK/sMHoHWGBxiV24TDkfDz73D1Tg2AcqadjOs7lXdxCz9YxMz?=
 =?us-ascii?Q?YVml3XLmOJkMIAZ8PqTF4URaUJClvRFcIpEKqmseX8kjuXl6ygDJ/O/hVNIc?=
 =?us-ascii?Q?O9ZiQ5/pqJ+uPYQ1Wp7Ix0qoHY42VI4WBRy8QDPfGW3kqXgfMa4cLFj+DOyo?=
 =?us-ascii?Q?JCt12inK4NvXU7/ZO7Ylz4fPHOzuZT24ipjWU0MeisoVddhW6UwuIDQguGtE?=
 =?us-ascii?Q?X0jQd/JfPEAbCBUNtGpzmVu/9qpQOiLiLVVndNLWL/EwROTDsqIZOi0V0pW3?=
 =?us-ascii?Q?HA0KJv3LJIP7nxSKrnhuDm0Rl2O7irIMnGAzXo9AxDXIdXS8XFuKnngAlQhA?=
 =?us-ascii?Q?Cjly22ztC7fNjjLH9RDv6ePbbdMmpwl84usen/FjrJZHp4o5ifYxsxr1cB8E?=
 =?us-ascii?Q?j48FHAAbiBIZvGJPHYRxwKNuAQWg05RQts99AM/XQtdcQ5vaDyy+GLyvgUaF?=
 =?us-ascii?Q?J5a4FLEWlzM7QsBReFMVASZpbj4AT+8yYI4BzfP96nWG8v13UDUf9jOGamv3?=
 =?us-ascii?Q?rihpYnsIENFXiKMAylZWZXjesHeHrXk8Z8dDlkHPK0vwOMiWel0JVF6Lqofw?=
 =?us-ascii?Q?T+rtg/CJG9kZ8BKqRlEHdMkw+WsYVW5tXkwmcXKYNHQV2QeS9geaDVlss/G3?=
 =?us-ascii?Q?6GmMkykZw9qlq27qhLVzaEAloLD3Bk5BYeSRiKiLEdYCkDZ3p0/dV6tWzdSZ?=
 =?us-ascii?Q?o8/RfPVQ8qF0N//G67NmrguORCkr5pPiJ6ORja9U3m3oe52NKQg2VhdQk3ke?=
 =?us-ascii?Q?tO07KNTO2aggOPrEO2bA7lKEnnVPknFTsIK+6RS7GfjaOaZ+GfRKO3yhUasc?=
 =?us-ascii?Q?uMVmCijlI3it5JNjBTPuI5eBvM9AjLUee9UGe5EesvSWYv760hqfew5r+lBR?=
 =?us-ascii?Q?I/jOHiV9h6Yvy3p2Tlg6MyAdw4exVDTaLKNIxIgd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b31889b8-1985-4541-7caa-08dd2158bef0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 00:45:20.3870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KeAYXqxXO7ynDi5O6KQSZh7KCtZwk0mRdUjtzsgQDzzgTbeh9vXGIWf+hooCAw2cMskXPOsE3T6iXMVeImoLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6217
X-OriginatorOrg: intel.com

On Fri, Dec 20, 2024 at 10:21:37AM -0500, Steven Rostedt wrote:
> On Fri, 20 Dec 2024 11:44:22 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
> > head:   8fbcff0074ff9f93ea927547e99e1dde27ddc7c5
> 
> I don't have the above commit.
> 
> > commit: c3bc8fd637a9623f5c507bd18f9677effbddf584 [1336/1336] tracing: Centralize preemptirq tracepoints and unify their usage
> 
> That commit is from 4.19, and this is just triggering?

Hi Steve, sorry for bothering, this mail should only send to openeuler mailing list,
let me fix the bot to update the logic.

Thanks

> 
> -- Steve
> 
> > config: x86_64-buildonly-randconfig-001-20241219 (https://download.01.org/0day-ci/archive/20241220/202412201128.mwjfPZy6-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201128.mwjfPZy6-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202412201128.mwjfPZy6-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from drivers/mmc/core/core.c:13:
> >    include/linux/module.h:132:13: warning: 'init_module' specifies less restrictive attribute than its target 'mmc_init': 'cold' [-Wmissing-attributes]
> >      132 |         int init_module(void) __attribute__((alias(#initfn)));
> >          |             ^~~~~~~~~~~
> >    include/linux/module.h:115:41: note: in expansion of macro 'module_init'
> >      115 | #define subsys_initcall(fn)             module_init(fn)
> >          |                                         ^~~~~~~~~~~
> >    drivers/mmc/core/core.c:2871:1: note: in expansion of macro 'subsys_initcall'
> >     2871 | subsys_initcall(mmc_init);
> >          | ^~~~~~~~~~~~~~~
> >    drivers/mmc/core/core.c:2839:19: note: 'init_module' target declared here
> >     2839 | static int __init mmc_init(void)
> >          |                   ^~~~~~~~
> >    include/linux/module.h:138:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'mmc_exit': 'cold' [-Wmissing-attributes]
> >      138 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
> >          |              ^~~~~~~~~~~~~~
> >    drivers/mmc/core/core.c:2872:1: note: in expansion of macro 'module_exit'
> >     2872 | module_exit(mmc_exit);
> >          | ^~~~~~~~~~~
> >    drivers/mmc/core/core.c:2864:20: note: 'cleanup_module' target declared here
> >     2864 | static void __exit mmc_exit(void)
> >          |                    ^~~~~~~~
> >    drivers/mmc/core/core.c:1343: warning: Function parameter or member 'mmc' not described in 'mmc_regulator_set_vqmmc'
> >    drivers/mmc/core/core.c:1343: warning: Function parameter or member 'ios' not described in 'mmc_regulator_set_vqmmc'
> >    drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_hw_reset()+0x93: sibling call from callable instruction with modified stack frame
> >    drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_sw_reset()+0x93: sibling call from callable instruction with modified stack frame
> >    drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_wait_for_req_done()+0x86: sibling call from callable instruction with modified stack frame
> >    drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_do_erase()+0x9d: sibling call from callable instruction with modified stack frame
> >    drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_of_parse_voltage()+0x33: sibling call from callable instruction with modified stack frame
> >    drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_execute_tuning()+0x3c: sibling call from callable instruction with modified stack frame
> >    drivers/mmc/core/.tmp_core.o: warning: objtool: mmc_set_uhs_voltage()+0x35: sibling call from callable instruction with modified stack frame
> > >> drivers/mmc/core/.tmp_core.o: warning: objtool: missing symbol for section .exit.text  
> > --
> >    kernel/trace/trace_events_trigger.c:68: warning: Function parameter or member 'event' not described in 'event_triggers_call'
> >    kernel/trace/trace_events_trigger.c:912: warning: Function parameter or member 'named_data' not described in 'set_named_trigger_data'
> > >> kernel/trace/.tmp_trace_events_trigger.o: warning: objtool: missing symbol for section .init.text  
> > 
> 
