Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3730B15AF1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 03:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720668982; cv=fail; b=Nf4lr5VxtX22J88O5fQnd+iR91RwZtQqkpwCH6XIa+gvNp+dPNT9cH3cy8ChFCeduYiyQBE4GkVJt3/rh/yBEx1Mmt3s0jhyxDKL5P5kYONFmK7yezBKLBlLpKIOxrPD1INVAaz7k/EoRY+i+j8xZdALB0cmATW+yFQ/YnqV8YE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720668982; c=relaxed/simple;
	bh=fXJCUi9C5fE7g8ULcmi4IJILGJ0uWY3gM0pRzIqdfVM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=MBUhR7v4w9RNbDwxDRfpRN2xEf97c0pFNoTo7PEZC49Mw2iljTS29bH43V+GDPPLhNMuHd0ud/FhoyinvQswWwOQJoBdr1BnT8sPaOMmsU47H97t3FFS7RIM05qMPtJWfYV0NyFkxfIZStNjKjHN6dTUuz6Uhx0FXa4WqbhhnHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VJDkpJ4g; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VJDkpJ4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720668980; x=1752204980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fXJCUi9C5fE7g8ULcmi4IJILGJ0uWY3gM0pRzIqdfVM=;
  b=VJDkpJ4gHwKRQpLl3WnG+HwTERaqYDcsFEb1sZjUyyVDzrB4Hn7Vh++t
   pY2ZgWFUaxV6ZZue2IbJQ7zz0dVoT3OnKP7MJmIza3SZd2If6pX+n+eH5
   +HS3DQyxV7nIbwy4DmyB8msMfa63tZVbm1uSQ9uprEX9ozJxpknqJNY7g
   KGolf7s3Vqzwc+Zq/M0P6QY0JCCYkCPGydDBu/+3pWZAHNZLFBbCAMAUc
   7fPk7KwimOMJjUpZv8JsrhjiL4HiYfos+axnaV8xjuAZHzUpxHXFUwvvX
   QMMAnjR6Y3qNW20x+nzbDCpgvJud5opjrwJmFHwDrKFSzJ5E1R46ftZBA
   A==;
X-CSE-ConnectionGUID: PKk2I+C5R1+hR4SGCZiA9A==
X-CSE-MsgGUID: QgSLOpL8SbalUusjSNCkpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17974870"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17974870"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 20:36:19 -0700
X-CSE-ConnectionGUID: Zh0NE5qiSfK3/9acTe/Fug==
X-CSE-MsgGUID: nEDKm9NDQUGyTRKQ0u3UPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="71643733"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 20:36:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 20:36:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 20:36:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 20:36:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqawFtBLyhVRXeO82jw6JmBEawvFEpSEW1cTVpTTjHS/kJ3xBGKKbI5Tt7wFGteb6SC4BOYyTGrcUL7lFb8M4rjtycK2Tm4XjskAm/CmDs1Ot3PgzJAwNVAYDZEQeAZGRw0BhJomkruR/LxTqAm4YGMd80MoVd1/fJKfNccizYNgHvAheaQ2dEjRGzYWgDLniUYlhgNGUVUfgdLjXewDnmjPhuYN14P7fj4rDqF5XozN5sdi2LbcwTj7WsTzYJSCllJjy/MRdWzLDDpo91s3gSb/XCxkZSXynJnyD4pSUVJm0l1aCF4Zafr6nrpGwWqbf0Im26Has/PnXHFqDpSbLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FE2aagrEanHpLN2c9UhjQIpWfu9jwJlD0Fdm/uAfBL0=;
 b=CDnwveIrcAfEuz5uqwB/W4qelAADb1HVUdkjpP7YcSQqJIjrhz8hhvvuQiAyH66q6lgo3QbBVaYtZrjjf3HlhViAg1u9VPl5tyaa9FN6lIWu4plfLmkPaqzGohXrQ/A4PtbHugovVD1iUtH5fAVWTzoK0gVE3W9q7PZucAQlBmt9J9fJdqU4eRhTWlvIoKhVXrTkhpkcpGV/KFNefcdkiiHx6sUxRPau0HgOXYXv3iIsP2diJZ3GspbU24JQwvohcmaEzy4yXKVKJz1p4cUznd+cHDCiKH5r4/2gL1UgrxUTdjqX0iOCfefpEdP6aCCitL7cJvLdMyIgaIVNU/rG5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
 by CY5PR11MB6437.namprd11.prod.outlook.com (2603:10b6:930:36::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 03:36:16 +0000
Received: from PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d]) by PH7PR11MB6029.namprd11.prod.outlook.com
 ([fe80::8ad2:f4da:864:424d%7]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 03:36:16 +0000
Date: Thu, 11 Jul 2024 11:36:08 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [freescale-fslc:6.6-2.0.x-imx 10939/11381]
 Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml:68:21:
 [error] syntax error: mapping values are not allowed here (syntax)
Message-ID: <Zo9TKG4W9GauHrof@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0151.apcprd04.prod.outlook.com (2603:1096:4::13)
 To PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6029:EE_|CY5PR11MB6437:EE_
X-MS-Office365-Filtering-Correlation-Id: 0be23745-ff20-4315-cc5c-08dca15a9eed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tLtPG1MkGC8KH3kbOVPKo2lWRZY8IDSfWZRU9uTmSA6jHHMjsMflQN6r+8JH?=
 =?us-ascii?Q?7UlCetWS0NbOOQIb83sxcRlqgvueDKsjAnB1+pGgIXDGHTQKfWAq6yCea0NC?=
 =?us-ascii?Q?blXHnKrdbEp4v6znzxtCBlW/M+SfQ8lOLooiKZXW1FJcuof/4YIdsy7zNSA8?=
 =?us-ascii?Q?kycUPK84qQacHnz+thnVjGI7ERDPEqq76ocxWkiX+dnp8FM1TgZcSn7Zbqq9?=
 =?us-ascii?Q?qzPwDbHDRNAPUoPSLi25O99c6GdpbT0ZF6r0bKZefMrAsMCeUiezqts1vl2T?=
 =?us-ascii?Q?n52oEs7MbOcFGnpnzIbUfvK0K/vHv0es+4Klwu9zqxvQARp2pqVjMI3sgOtg?=
 =?us-ascii?Q?OFO5l+xLCSZseObNFchpReU5FFLrhQ7Ux7EA26EOvGwwuvvZ64uUJeCa1kBz?=
 =?us-ascii?Q?sjcMQHe87a5drDWSPfuPQChFgQZLZcZG9cJ9AeVW5fKnei7pmlv5DD7sSyU+?=
 =?us-ascii?Q?SYJezqC7MJI4b/R+3G2FA/mXhIMgkppWKLwCfrRpCWzhG0Pb1b57FW5xCAsE?=
 =?us-ascii?Q?X7AE1VQhKkmLYORhvh9rTZk8OX65Go5fiHoUPrQnKuKCU7cGytRXQSTePSky?=
 =?us-ascii?Q?e2iEOI/mSYsOTc+hNH/6uhiD3EAouv5PerLlBhmi4wmgtXD9+UFfOaRpT/oH?=
 =?us-ascii?Q?85albxoRVyGzjFerSni48Rr/brlb329p/7bzfRHNB0o6xX73POge6+Hxpm5G?=
 =?us-ascii?Q?+HyHpsr9/ih0PpFDTugySN8bRJv675sHLi5D7MHeFnxxOCI9KVfGvWmYJhEN?=
 =?us-ascii?Q?7zY+4gJqrNjsHT53l+Zuz/I3MkXwZPHlbpC5eR1vmwaj/K8E7WfmjGvJpTA9?=
 =?us-ascii?Q?4Kg4xtxxUvvBxLsZgmbb7QJfPBP9d7I+Xn42A21cBcjTPiOKU0Z4WiafGVFg?=
 =?us-ascii?Q?5eZfb9NpLRZzvzTLBXtleGDFLtXHOt9kznz1VDGf860bZoC7thIiKfScGwNP?=
 =?us-ascii?Q?aNMzX2TLxxtDeTicuR4PHMeDmPJeh8c/qTcJuaxVVx1654uSh0u78htWBApi?=
 =?us-ascii?Q?wNz9KfPRAzRsDMR36fgYTm8a/BnedJN42bRtjUpOcdGqxQpI2GLwWFsA25Ce?=
 =?us-ascii?Q?UlKBmBLM+6Gaf3grrjI0NQ4g5AHB6V2k5Te5ROp4kGE2hlcAJhAultVul4KL?=
 =?us-ascii?Q?1DURMnNwAZG0QIj5ZgITUrlyW3/3wFqUYqXa3ONdeXT8Ac2pXB1QazAF0KZQ?=
 =?us-ascii?Q?/BQbZZhf40yiz2RbMNMggCousPuSrkvj7702Yh09M6XK7SwplwU+cQAJTnog?=
 =?us-ascii?Q?R9tJAaTXfMGkvdWzNMgOUxjT7/jnYGmaJWf9Jyk3//DKZnShlO00ExFn8Q9Q?=
 =?us-ascii?Q?NbY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6029.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AYHqAF2O+LuCszFGcz1Yl6inzQpQw1mQPa1JmuCNjoLEf0daFPQDBHpMeWkU?=
 =?us-ascii?Q?sBU0pkGhZSBJriM01mERJq2JK3zCrlPA20o0s1heNJatRKyxDebBmboTc2wM?=
 =?us-ascii?Q?x7SmunyJzFdTL2kVed7/GHhY7Iyr6+rfres05vl03ID0YgYkPEBPqsvk8gjt?=
 =?us-ascii?Q?88rneZttjnhLkc//ZLxKA6qsa9ISK+6i/mSGUtJtYG4BrrTH90sYa36QRnjV?=
 =?us-ascii?Q?KNMxHT9jjfm6A5/WiPP5nCYS6dNnzmHSM9fdtU00/oDnG0tcyYXHRPuM4EP7?=
 =?us-ascii?Q?ObgY6w2YT/WNal+uDPpFJLntzAEHxB4s5Iq1uIMZnqUAKGx/0ZFkJVF1Vbvl?=
 =?us-ascii?Q?6Yvzs6gC5qp9s2cS72/Js4Y9E5bAzWT2vs+nJuEmU/DEM6j3cPGhclpJbwCb?=
 =?us-ascii?Q?X/Kf0ffItj0SKC4s5c10dVS45bWWEBE8xK5Wv06k/gKfMboVec0u7hZE0EaF?=
 =?us-ascii?Q?YSmKUT3lo3EzTqUIFGml6bQXIn115eqmRqEWEBHyGHf9cwzuPbQCoug2GxR7?=
 =?us-ascii?Q?aCDvHKoXlWo5hGcR7OFA9D+k6D8WABFRVG5TyaXlLNV5g+NKnqHgG9wVeQ1D?=
 =?us-ascii?Q?+dQbMDO3LG4ek7SS7AcVJvmQjecpiTpIWwUjT+mYx/T9F6wx1mKIB1YYP1nm?=
 =?us-ascii?Q?+R3x9Ak7rlNLI55irvhdrxPjKRTULbNh3m00T/5Ok+pDS2M4r80dE6JUcP2d?=
 =?us-ascii?Q?dcKuqiFpfMkj1uvcZCNhZeVg8hnS2/rxn5B2ZBxDequupEJ99iz1lYfVWbw8?=
 =?us-ascii?Q?gqvS8bR3/L46dSH5sX0bLfgpYeEj2sH0/ZqGL5Pqj8OxMvdTZvXIY3eBwknV?=
 =?us-ascii?Q?T8whH70oO6/hEo0UpETfax/j22O1L+eSuWtQzIMKbK+V4jqVgOrWxYe4N0qb?=
 =?us-ascii?Q?6cEiFx95y+AbRvdCpbGVZ8y7g+DlLTIJahK5WuSvZ84AipElQ+hyOjZ6R1XZ?=
 =?us-ascii?Q?s/BsGf5j1LXHXRfhRA6gIoElm0ukTwiKF9jnt+JLd7r83UT4G5/gzGeQuFRC?=
 =?us-ascii?Q?EbnSCxtn+lmEuc+rLkV2lnSypQZrl44GfJbKblXnNbUhX4jM3UQNvoB5L25d?=
 =?us-ascii?Q?cRWHtbw3eVX8kcHMUfuk55fcFl75aK8z/Ef1Xbs35shk0mT/xCYDWTlTEk9a?=
 =?us-ascii?Q?6f5U/a3omZCqnIjmn0zOOLH9k+kSbZF4SmtKeAVI7Qa3CjsBL6C3LKUKvMiA?=
 =?us-ascii?Q?BtzVm/2CMaSSpRIBGUxoqY/XarXofHdjeOCFjZcKeZTyeNSvHGu1bkaKEuYd?=
 =?us-ascii?Q?1bsmlWoqNUk+fZQi76OR3/YQh8ihFsjbL98V3eavT7GBhevO/vwkU6Vy5f6d?=
 =?us-ascii?Q?VXmuAdjaaBhfUdTTFJVHJhmlHEwVgl8IETTx2mz7w+OxqFItq6IAcLFilXix?=
 =?us-ascii?Q?cHF6T9TEy7LrTJDozll0yXilWFYPZtYnJIIke3hFtCPZcJiXWV0tXOIuFIAi?=
 =?us-ascii?Q?kQ2bkTNlGRfRZCf+lcEd5Txdqr+CGlS+piucDgvJhKo7xvMV9EKnpIioDjW4?=
 =?us-ascii?Q?503B0s7jkmY/5btXjIShHnT+tA+RojAnir2k78yLY4rm/5b/OnftaxdUbD5Z?=
 =?us-ascii?Q?Spbnmagi9jDzKruF6bUalKl/bBRKJMD9G50fkjEPxuI1VFyWLqBPnNOqlOLw?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0be23745-ff20-4315-cc5c-08dca15a9eed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 03:36:16.7669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJ6gLCKLdfLEaWTawWx8DZAVSZOln1DRu5bi0cqkGuAtruabBTJcLdb6tLRka54K7ujwcOgWGmUkbN7hS3ivlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6437
X-OriginatorOrg: intel.com

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ee366aa641d84d61e265cd4f571394aa4e7d4e6d
commit: 0d6dfa43d09c25e24c9b17f85432e57cbdcd64a6 [10939/11381] LF-11070-6: dt-bindings: firmware: Add nxp,isp-rproc yaml file
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: arc-randconfig-051-20240711 (https://download.01.org/0day-ci/archive/20240711/202407110412.64R7IeKf-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407110412.64R7IeKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407110412.64R7IeKf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:21:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:22:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:23:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:24:2: [error] missing starting space in comment (comments)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:67:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:75:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:83:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:127:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/vendor-prefixes.yaml:880:3: [error] duplication of key "^mixel,.*" in mapping (key-duplicates)
   Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml:64:6: [warning] wrong indentation: expected 4 but found 5 (indentation)
>> Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml:68:21: [error] syntax error: mapping values are not allowed here (syntax)
   Documentation/devicetree/bindings/rtc/nxp,pcf2131.yaml:10:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:244:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:258:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/arm,scmi.yaml:259:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml:14:1: [error] syntax error: could not find expected ':' (syntax)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:62:9: [warning] wrong indentation: expected 6 but found 8 (indentation)
   Documentation/devicetree/bindings/net/fsl,netc.yaml:76:14: [warning] wrong indentation: expected 14 but found 13 (indentation)
   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml:115:13: [error] syntax error: mapping values are not allowed here (syntax)
   Documentation/devicetree/bindings/display/fsl,lcdif.yaml:65:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
   Documentation/devicetree/bindings/mfd/nxp,imx-flexio.yaml:44:11: [error] string value is redundantly quoted with any quotes (quoted-strings)
--
>> Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml:68:21: mapping values are not allowed in this context
   Documentation/devicetree/bindings/net/engleder,tsnep.yaml: mdio: Missing additionalProperties/unevaluatedProperties constraint
--
   Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/phy/fsl,samsung-hdmi-phy.yaml: ignoring, error in schema: properties: clock-names
   Documentation/devicetree/bindings/firmware/nxp,isp-mu.yaml: ignoring, error parsing file
>> Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/vendor-prefixes.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml: ignoring, error in schema: properties: out-default: description
   Documentation/devicetree/bindings/display/fsl,lcdif.yaml: ignoring, error parsing file
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml: fsl,cd-gpio-wakeup-disable: missing type definition
   Documentation/devicetree/bindings/i2c/i2c-imx-flexio.yaml: sda: missing type definition
   Documentation/devicetree/bindings/i2c/i2c-imx-flexio.yaml: scl: missing type definition

vim +68 Documentation/devicetree/bindings/remoteproc/nxp,isp-rproc.yaml

0d6dfa43d09c25 Robert Chiras 2023-12-20   8  
0d6dfa43d09c25 Robert Chiras 2023-12-20   9  maintainers:
0d6dfa43d09c25 Robert Chiras 2023-12-20  10    - Robert Chiras <robert.chiras@nxp.com>
0d6dfa43d09c25 Robert Chiras 2023-12-20  11  
0d6dfa43d09c25 Robert Chiras 2023-12-20  12  description: |
0d6dfa43d09c25 Robert Chiras 2023-12-20  13    The Camera domain from i.MX95 has an M0 core with an attached OCRAM, where a
0d6dfa43d09c25 Robert Chiras 2023-12-20  14    small code can be loaded and booted on M0. This driver handles the loading
0d6dfa43d09c25 Robert Chiras 2023-12-20  15    of the firmware binary, configuring the OCRAM and starting/stopping the core.
0d6dfa43d09c25 Robert Chiras 2023-12-20  16  
0d6dfa43d09c25 Robert Chiras 2023-12-20  17  properties:
0d6dfa43d09c25 Robert Chiras 2023-12-20  18    compatible:
0d6dfa43d09c25 Robert Chiras 2023-12-20  19      enum:
0d6dfa43d09c25 Robert Chiras 2023-12-20  20        - nxp,imx95-isp-rproc
0d6dfa43d09c25 Robert Chiras 2023-12-20  21  
0d6dfa43d09c25 Robert Chiras 2023-12-20  22    reg:
0d6dfa43d09c25 Robert Chiras 2023-12-20  23      maxItems: 1
0d6dfa43d09c25 Robert Chiras 2023-12-20  24  
0d6dfa43d09c25 Robert Chiras 2023-12-20  25    clocks:
0d6dfa43d09c25 Robert Chiras 2023-12-20  26      items:
0d6dfa43d09c25 Robert Chiras 2023-12-20  27        - description: m0 clock
0d6dfa43d09c25 Robert Chiras 2023-12-20  28      minItems: 1
0d6dfa43d09c25 Robert Chiras 2023-12-20  29  
0d6dfa43d09c25 Robert Chiras 2023-12-20  30    power-domains:
0d6dfa43d09c25 Robert Chiras 2023-12-20  31      description:
0d6dfa43d09c25 Robert Chiras 2023-12-20  32        List of phandle and PM domain specifier as documented in
0d6dfa43d09c25 Robert Chiras 2023-12-20  33        Documentation/devicetree/bindings/power/power_domain.txt
0d6dfa43d09c25 Robert Chiras 2023-12-20  34      minItems: 1
0d6dfa43d09c25 Robert Chiras 2023-12-20  35      maxItems: 4
0d6dfa43d09c25 Robert Chiras 2023-12-20  36  
0d6dfa43d09c25 Robert Chiras 2023-12-20  37    nxp,blk-ctrl:
0d6dfa43d09c25 Robert Chiras 2023-12-20  38      $ref: /schemas/types.yaml#/definitions/phandle
0d6dfa43d09c25 Robert Chiras 2023-12-20  39      description:
0d6dfa43d09c25 Robert Chiras 2023-12-20  40        Phandle to syscon block which provide access for processor enablement.
0d6dfa43d09c25 Robert Chiras 2023-12-20  41  
0d6dfa43d09c25 Robert Chiras 2023-12-20  42    nxp,ocram-cfg:
0d6dfa43d09c25 Robert Chiras 2023-12-20  43      $ref: /schemas/types.yaml#/definitions/phandle
0d6dfa43d09c25 Robert Chiras 2023-12-20  44      description:
0d6dfa43d09c25 Robert Chiras 2023-12-20  45        Phandle to syscon block which provide access for OCRAM configuration.
0d6dfa43d09c25 Robert Chiras 2023-12-20  46  
0d6dfa43d09c25 Robert Chiras 2023-12-20  47    nxp,isp-firmware:
0d6dfa43d09c25 Robert Chiras 2023-12-20  48      description: |
0d6dfa43d09c25 Robert Chiras 2023-12-20  49        Default name of the firmware to load to the remote processor.
0d6dfa43d09c25 Robert Chiras 2023-12-20  50  
0d6dfa43d09c25 Robert Chiras 2023-12-20  51    mba:
0d6dfa43d09c25 Robert Chiras 2023-12-20  52      description:
0d6dfa43d09c25 Robert Chiras 2023-12-20  53        node describing the Master Boot Record, that the core will use to boot.
0d6dfa43d09c25 Robert Chiras 2023-12-20  54  
0d6dfa43d09c25 Robert Chiras 2023-12-20  55      properties:
0d6dfa43d09c25 Robert Chiras 2023-12-20  56        memory-region:
0d6dfa43d09c25 Robert Chiras 2023-12-20  57          description:
0d6dfa43d09c25 Robert Chiras 2023-12-20  58            phandle to a node describing reserved memory (System RAM memory)
0d6dfa43d09c25 Robert Chiras 2023-12-20  59            used by ISP (see bindings/reserved-memory/reserved-memory.txt)
0d6dfa43d09c25 Robert Chiras 2023-12-20  60          minItems: 1
0d6dfa43d09c25 Robert Chiras 2023-12-20  61          maxItems: 1
0d6dfa43d09c25 Robert Chiras 2023-12-20  62  
0d6dfa43d09c25 Robert Chiras 2023-12-20  63          ocram-map:
0d6dfa43d09c25 Robert Chiras 2023-12-20  64            description:
0d6dfa43d09c25 Robert Chiras 2023-12-20  65              Optional property describing the size of the OCRAM that can be
0d6dfa43d09c25 Robert Chiras 2023-12-20  66              used to load the firmware.
0d6dfa43d09c25 Robert Chiras 2023-12-20  67  
0d6dfa43d09c25 Robert Chiras 2023-12-20 @68              maxItems: 1
0d6dfa43d09c25 Robert Chiras 2023-12-20  69  
0d6dfa43d09c25 Robert Chiras 2023-12-20  70  required:
0d6dfa43d09c25 Robert Chiras 2023-12-20  71    - compatible
0d6dfa43d09c25 Robert Chiras 2023-12-20  72    - reg
0d6dfa43d09c25 Robert Chiras 2023-12-20  73    - clocks
0d6dfa43d09c25 Robert Chiras 2023-12-20  74    - power-domains
0d6dfa43d09c25 Robert Chiras 2023-12-20  75    - mba
0d6dfa43d09c25 Robert Chiras 2023-12-20  76  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

