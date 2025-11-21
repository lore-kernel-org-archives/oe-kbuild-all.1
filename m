Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84F410A1E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 00:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763683680; cv=fail; b=J5ea67BZ8FK+InP934zOFLwecocx2jqV7NlWp4pHNsHjEc1wKBtJqrHSc424a5WPGeqcxzdcAu3vXO9ojbpyK2ZUQWLafKolGg9BnggT5EbJy+YJ9GUXioKl7kY84fpxdP72ifHdc+oNxvd6ELm7CX6AAXh5VsCQznUUD064Jb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763683680; c=relaxed/simple;
	bh=7aJZgSpAcSEAjBTZc0BNpI5dpv/KXhhH8eervL0+X84=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uKs0QHZrlV4hJeDSv6FfEMohfTn3X938fSTkj+nRv7vQ9mDbW7stm1Xm/b7D9F/1r1QsFu3u/gAe0DKyWiXYOYIml6+HL813Ct5fhG9uj9KTFBKziDwPmb0fcS3phgXbyV+FJ37OsH1Kh9WtcDs5OvoYz/h3w2FWsufEVnlQsM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SC5Rc+O6; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SC5Rc+O6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763683679; x=1795219679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7aJZgSpAcSEAjBTZc0BNpI5dpv/KXhhH8eervL0+X84=;
  b=SC5Rc+O68Q3V+ChEfYmVDhM9rxFgcFWKnEXUiiQkrcdEqQcRqkN/W5KN
   G0YL4X71bvVoV0AlRdpX0CDwIeTzZaAV9qIB9xWloL1hk9C7j1wd6DJDk
   AVRuO0sDQWHpeRRcTDfslDfvqFrf0JE1bNCfURddY9WZFOwT7AdcqxdjG
   U1FHAHavK+eYBMfe/FjzVTBILRLfKL8xhLDVQlFN7N+IeWsgoVMPksAFC
   Xsf2vPjKbuTvdRnG+sg2Y3R9JV+BBgUnr9E58PTci7KM7GuIQQa+cGhFJ
   5rn6NrYZ3cm120iw5TylQDnT3JxsOiFdVHUqdvSv0zCK2k1y0T70DmERI
   Q==;
X-CSE-ConnectionGUID: KxkHXowoQj27Qe+uG+OQ8g==
X-CSE-MsgGUID: v9SST5C/RNqwjhzMYeVRQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="88423486"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="88423486"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:07:57 -0800
X-CSE-ConnectionGUID: CM01AI3VTdGaGMmAQPW+AQ==
X-CSE-MsgGUID: GJLwO9nBTZ6XSNWx6gP5TQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:07:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 16:07:56 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 16:07:56 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 16:07:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUJuHXZjc87ax7Qv5r6sg1FvXOabCt/NObtAVtPLucgcKDgiVSltt17e1oSCrfQeoZgcfHQZ/IxJAwcLpi/O72IpjRG6D3S2D/Uzd/v4dsHcZKmlj0OW2UUFT5ccsiT+OXunRraUTf1x9X5DgmBS+IMXA6q0bZk7Ye0yT6tl8Lh4HNcRcJUSenbXmbogms0FZXZLqfOQ4B91aSG5VJlE1JwLfoMjU+B2tASVIzA756AaFo7cieoWksJ1qerNe/WQCh14e0TDeshzs1pg6HBeQcQp4ecGTS/2rHi1hQK/CaGQZpheQr+j6Ybk3+qGuxwil3b8XewxzLjgJhZbPLgtpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/uyGivyV2cvmek6TCiWgaePL/biOniV21nIwOu6hQc=;
 b=nhLwQRQiEcVwalhH62JmStjj88f4Ac/5xfqeyB73utfQLW737Uxw78Abt7UAyf6bCV3OmEYMd7S71xMjqJ4jsLX0UgPVCO+ATTv/o1n5TPfhLNs1e00X8cicAd93lpsZA2SkSgaYLUIOv9Lym0tRq4c2gWRDhC5cWMtfmpo5uRw1lH9UHNDx+UTWIMGZQYpfdxYGU38VjNX95sK0vVhdyFmXAVjmIWRroMnUprGCkstNgDx5GxbRjlEYxMXsLO0FZg+pFcWfcTh9uu/gDVQcaIGjts3ZKOmizfDFfC3a9lWWQ7ocGh2g72chkMOv8i+sTDKoaP8Rt0aN+Lp6MrHNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by DM3PPF4C690C788.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 00:07:54 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Fri, 21 Nov 2025
 00:07:54 +0000
Date: Fri, 21 Nov 2025 08:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [brauner-github:work.ovl.cred.guard.prepare 43/53] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <aR+tT3+Q/9qAJiqT@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|DM3PPF4C690C788:EE_
X-MS-Office365-Filtering-Correlation-Id: ae5f6661-708d-4bbb-f4a4-08de289204b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mXcfHNM+HggLnXxu1+WJnUPnUSDSM+DORnSmBkOs5xR09Dhb3UR+ozufIYqd?=
 =?us-ascii?Q?euUkDkhz330tXsSFq24x0qDm0qirTF/cPkmBR3IRYpeHYpqxqvgxg6PDkvA5?=
 =?us-ascii?Q?4n/SeZR3e0voMnPMhJ4X0AS0S+329vTBmXFP0dJIVfUGSYiXQUAnmim2vhjf?=
 =?us-ascii?Q?xEZXFKNku68pp97YPhEgcKKQVCMHaZQLV3H2RhwkudRUqZ3WvA02Q/1rZCLt?=
 =?us-ascii?Q?HihquUgOk8iIta12c7CE/q+wdNV+RGWJA3ScvENM5YvcWI51lNnmD6RuLud7?=
 =?us-ascii?Q?rDvvTBFeaFV+EbGzAw+u1un1OSND2fgZXAZGyGjlXIT2QJtLHznJ9CpihUWh?=
 =?us-ascii?Q?LKaKf1cFPlt7MPdAH/1KwBzAbPLTqdpyJaIMI+gmkfWl9q50MOBxyl8DFV8d?=
 =?us-ascii?Q?UDCiiJyEHmtmD85wGEzTmYjjf51BUsPOI0zIH5h6r9s321p0Z9jUg/R3uB1l?=
 =?us-ascii?Q?SIyFWDOodBL+wos5IWZ0ENOtfMRCKZ+GcRFyelTxp1x7nQcpbGW8pG6U84pM?=
 =?us-ascii?Q?w2tnBYFWNlNNUhZ5telY6JG1kHut6l9LVQn2Gi3sLF1mHsplMQeKDChfVsLv?=
 =?us-ascii?Q?HreMLaU0nO8XHUpXhYWGmKgf7tf7RI66PG613txydxBeuH/ml7jvMMWypc61?=
 =?us-ascii?Q?/8WHWEZK7b/N6DlRUWHA/gv6MgpplX5OxwO/6kqG8cIPEFqDrgRDREzDtJoF?=
 =?us-ascii?Q?kRny7Q5R9Tg6zn1CuecTZiukC2TH8+XoAWdqy3wSq6ZlaeJb8fsL0Cra4Y+I?=
 =?us-ascii?Q?pDcbqaV1CteiQDxJqKozen9Z8Epji+rT7JkeEfhpKIyliVyVCtvyA2CE7rtY?=
 =?us-ascii?Q?/n/Nesc8myrbtYrzhyCZoyHCi0hhBTjZ1hZ6vu/CYt8FCYWNZIKPUj6xiLGn?=
 =?us-ascii?Q?zO7AV3UqyD8pQc3vXeMiGolA47HyM0cnCmFpZpzWSmg2Izx94QI7Rk/ENRNi?=
 =?us-ascii?Q?rtG0+v4YPiEYNcXxwrluSQi0DTwwR6soiu3VyBLMNbEaASBTKlkrNiNZIp2R?=
 =?us-ascii?Q?xvQZ6LVHjiSYohPOgZXMsidO4aRpgVNrmuaDdso2CxcSK0xIzftT3d7/OBJm?=
 =?us-ascii?Q?lesBa19nWzIJyzQv/db7FS7z4ovpvGkNMAFgrjJEGwBNAmZbyHKXSfp83XSt?=
 =?us-ascii?Q?DGTp7nWHHwlfVVx+gk3twe7vBuc77jnSLIHTdTJKyIk2SuT2NvmMIMRaJUs8?=
 =?us-ascii?Q?jqIxIz9XlNNDd419ka5x9Oh9hB2c+ij3t5UrIG1b81qhH2botkenH1+FItbH?=
 =?us-ascii?Q?CF/2W5wAkNG8an3t0TJGTYgF5uT9nT9ZtxtueoOnZKJkoZvpaLY4VUjf0Buf?=
 =?us-ascii?Q?5OT52Uno8DwF9AwZHK1KdldnqaeJsrJPla6hRZF2pBuo+Ah7s9Im9FcDsAjb?=
 =?us-ascii?Q?pJBCNOTQyGBSxoTQleOz0UtcVj2tEw9UGdalFd8GeomdfGbbQI6z1KWDyWMX?=
 =?us-ascii?Q?N/N/TBpJMqd18zLh1fZUWy4BKlqUtbYb9WGIwpQq7wCwxsTJNBa7oA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W63BupvlvIfHOpfStO1BYBAC3ef7u+2+By3iT+/3O4Ctqpn13vWV1R0XhB8H?=
 =?us-ascii?Q?Lz3+clBor3ErZpBagKqxUiBVesedxuxhwGR9dWHkk3blHuXzKaUfN4UQelOu?=
 =?us-ascii?Q?igN8bWGnfGmQrOYK11BUpJcWweNFepXS5fSCIuxmKbJPbOWMPJDXjb8S2Md5?=
 =?us-ascii?Q?lHDEFqEJQt3qZd8JWh3nila4AbqEyQEf4i0B4Uels+xylIX5XE/iEIArUAsb?=
 =?us-ascii?Q?DSZNPWrCZE1Lx85dQcIJFYPJkr9z1y7BNeMpgT5O9KhP2wl9IfwaUPba3I0q?=
 =?us-ascii?Q?0a49kjvz/QVwnUyPcqLL2CQIODGt9bQOPrJ4PgMkZmOBFtkPr3p89ARLYYG2?=
 =?us-ascii?Q?G83ilNdfLLb/c8JucgzgKz6ArXcmmyya3C4tZBx7Pn4XLn0k/MwPqoKT4k8w?=
 =?us-ascii?Q?8EUxqRmt7fLu6tqbvTGrODOHhAp4HQXYIMh+UwsTdSKORW/I2k16UhsOtIFY?=
 =?us-ascii?Q?fKM8WlUABfB2ZYtv6OkDdOjDy+mMtMGIQ4O3kUyutGJY7Lc18GKeQwHV0qvI?=
 =?us-ascii?Q?5tieuCYw7DWs+LEu6VPtGkO4dO9wWFIBwqFo8ySG4nEhDBFMEBuBv/P0fFBM?=
 =?us-ascii?Q?4IVP6uCocrC92bEiemKFrXtxJ/E3B+UA+W9YU8jMTC0pWPAmIEsGSt6XmF+8?=
 =?us-ascii?Q?/tYl4TSmlLzsZXSL/L+I57RZc2HBI9WskG4cYmpCO/QpE6I3OnHXfEAUazua?=
 =?us-ascii?Q?BzrrLE/h4YJoNnp5xoqxKtvSAsUby0PG7BQbUK4jZdcOxDdmaztFeiM9qqmD?=
 =?us-ascii?Q?4zE6eVR46R/wQNsFLRwbkacKLuUesyoeiI4TXnpfV7S0RJ+8Y1uTZA4mtWBE?=
 =?us-ascii?Q?Yl8SR85EN6fPgAj7NYyRL5IGe7SD58Pm4Kmzb+pSfM8WQ7ufbECQAv+ZCYmQ?=
 =?us-ascii?Q?awKgVew64TAsK5Q2zcR/1JqnW844DYjqxZ85tLweGSq7y7iW/t7S30LQMet3?=
 =?us-ascii?Q?2ad3oSdSXOD2jo05c08bte4Qx1PBoKFUU2aB7ZNXVEdIj3Rk2CwNZWS+Rz4J?=
 =?us-ascii?Q?ElGd5WTFYpAEx2BXyf3GjHIWGmG4arLoWNk0QmqSDz1ycbgE8kvMFdF7osv3?=
 =?us-ascii?Q?1Yl+iveMbbgYMBIPCgQ6E4o2nv3Fonq5OKzwGfFCHtOP974bSpXc8WzUurz9?=
 =?us-ascii?Q?XXCS+WXIAX2tV4xtH8AVi6ZcAtZPNCQSGbFhR6y9nwrxe4EyV4WgTfJMaYlT?=
 =?us-ascii?Q?JnAknAGMDo7mKeDZmH/3RUs3pc7Ws/cMTnqToOxYyQH/MoWrcAvbFO+3dvxs?=
 =?us-ascii?Q?RYjz9cAqUPrN8gX4fdUo5Pyd4MZylPFDo1zHugpX9x9HXpsI5x4BId1tBB48?=
 =?us-ascii?Q?9uoTmO5DtnXAex0zMlGosuYWiYRia2uMsBOmys20zc8BbTKkVHBY+yUpoRGY?=
 =?us-ascii?Q?UCiVpFbMke4oHchECrW34NYJIyct7477tDyTWpD6GrW8XXUmw9HDD5IzXGV7?=
 =?us-ascii?Q?vHNzggY02Q8vfYaYFlSm4Y6GtYdSFa1a92N24Os01UfOOXkLorE8eqIXgryo?=
 =?us-ascii?Q?0lFbT6Hv/sr1AYwfXq9bhRb2Sc/3KGDJa22WlcMpJtl5RskGjs4EWnoT3zjx?=
 =?us-ascii?Q?XNGBJx8mr/PBkl+OTuya58Ox/xoxs93IKP7WAYVA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5f6661-708d-4bbb-f4a4-08de289204b4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 00:07:54.4540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXcTTjVJeTUofaDHozZ2qZmQQr4OMC9r3/mrl+tEB554IEuQxUEtekykNxxoazqoSFY+g9wBBxN0sls+5dMIFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4C690C788
X-OriginatorOrg: intel.com

tree:   https://github.com/brauner/linux.git work.ovl.cred.guard.prepare
head:   64676d6627645d999fb10d936a6af2d7fa2a54d7
commit: 1e402a0d277559953d9a57ba998ce3e723bebe2d [43/53] ovl: port ovl_lower_positive() to cred guard
reproduce: (https://download.01.org/0day-ci/archive/20251120/202511202347.03IpiLHW-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#79: FILE: fs/overlayfs/namei.c:1458:
+					/*
+						 * Assume something is there, we just couldn't

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

