Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C6212E4E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707125543; cv=fail; b=nQ7VgHzLmbrePjODPFSOep8IOPAL8GTdVauAuZZTEf4uZdQ5ejV26Gjy/rLnM/W+nptCLCE6a/7hH4XGFHK692HEDSGTPL0p11VTrhKA/6P2RBl9lTLjj3zO9KBUXrO3xZ+roeTbiU+gRQlD6Yf+EtPSjAom3gV3M1sQt/ry0+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707125543; c=relaxed/simple;
	bh=8JRJFOttjny7/iqazOpUu8rIynKVPlY9IzN3fwfNNjQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=PG8/UyRyGo0TCMJms06iuAI6qKkld7KpMzaxc+qGbUMn1R3H6+VuZI1frRMaMn9IlEovK3PFrvthzAcxE8fc2up4m8VeHy+zd62srlsE7nYkNm6LOlIMpo3ZapFXAUcZ2HyqPOvClKQKlpwkF3jIpgnmCr/6+cFY7YT7Isq5D9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ie64AmGr; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ie64AmGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707125542; x=1738661542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8JRJFOttjny7/iqazOpUu8rIynKVPlY9IzN3fwfNNjQ=;
  b=Ie64AmGr39tohZpupqbEcg9jLOQ8R60XJ5SXgF+oP5U2dZsA05WZDJu8
   ZoDZtCO+nGqPV5lybJd28SrSW890RxexbNerX+IQlWDQcKqx8xBUuBmQC
   9qsihmyh4I6Vhoean/6a6xY66bKfhGf/BaVBdkUs+L3iQQp60QQRYooYD
   /Oa7ovlL0omnsbHVkvjz/zrebz/9gq0RSS+Z/KvQJBbL+gqB0aIbjUPUC
   jyiRHfZ/9zBFOVTpXNxxcZqCsrkuyEYecx/X7SpXGoR21vTZ86MIZoPaQ
   kZuYJcqaO7DuxzLsFshchTNn8aeKDdH+Zxs8RmsxVLtKvWTz/K0XJrMq6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="3442153"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="3442153"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 01:32:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="23923656"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2024 01:32:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 5 Feb 2024 01:32:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 5 Feb 2024 01:32:17 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 5 Feb 2024 01:32:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VliI65HPrI4SmTyiXMqCwo6qbPFSUnFqGwJXX9roncFm1bdka/0LiQ5BcOleeuwwx9B+zCgH3wfbi2PUwpIgC25tFxlATrZLXrTadZeSbWN4owIEiScjFsdQHL3SFETe/XAMj4cwpbD8DMVwAzV232zEtk9Ygufxmbg0dK+bRnQN4QgrVvBpGCB6bZ5cP5thMlwimPFwcFys9NUQiydKqBxmj2jv37OYwwAWCD1UP4nOr6R0eXuQ04GhhTPJtDzaNezbhYYGsIjKqkBtCY7lxFt7APDeXZ+fYAMODxIbeI0Qy4IjibbAmd/COcWefsrhOxRZ6FlmLXmS/wlx/vAIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUqvBTEKiNvS4K//9PbZgdhtorqxJB6ERNBgZaV/44g=;
 b=LHiTgxMVfNAKJ0W72+j+7HpwzKTlf8fDYZE0axO56Qi+ZGWSHiWd3WUiTmnV8WZFcLllS3ULPmVP0XHWPtKf81uVYOZtVkys+y2dVLN6mRZR8SK2drbdhstqmuHntL2FPSNQx/5OwwPQ8ynmtGpff6X34MsHuKT4fd4o97mQyWiG/re2/BgkCNSDc7xMZGlkbi9zCjDwVRDV1TJLAa414M4vB7cAtCJCKrjvVqmOYdzhHGhcDx8RCfLCeSmKqScKVjqLjIoBGa1ShscwZRoYWru40fo1kaeBvY4GM1u5+TinzV5P+LQAjecnGRM31ynK8zfTyDn6ZsQ0VTcq8ZOYnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 by DS0PR11MB7441.namprd11.prod.outlook.com (2603:10b6:8:141::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Mon, 5 Feb
 2024 09:32:14 +0000
Received: from CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708]) by CH3PR11MB8414.namprd11.prod.outlook.com
 ([fe80::ed34:4cf2:df58:f708%4]) with mapi id 15.20.7249.035; Mon, 5 Feb 2024
 09:32:13 +0000
Date: Mon, 5 Feb 2024 17:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Salyzyn <salyzyn@google.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: net-procfs.c:(.ref.text+0x60): relocation truncated to fit:
 R_AARCH64_CALL26 against undefined symbol `wext_proc_exit'
Message-ID: <ZcCrFo3h65d5D0cb@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8414:EE_|DS0PR11MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3afc48-0442-4549-3fe8-08dc262d5595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HCS4HdBvDFf9aaflFpygwCDcTcBYLx9JW9fdIkjQ9ZEgW7hYWWXjwn2tBOf7//YIoUFjvSSdUza4plexD1Kj5luI+dZqejXa0fWwR/RbNCMF5UWW3Pa6ZleN4VdWIZZX/xOPWBN6XT40GRI2S44/k19FOvJi1jMj6s2RDRsbmgPwN4dMHf0nthZiZziH5h9Jgs8dB0WlNLfRohnA5prGlVdflky5crl4M0LKYzzCZtZqCk9Pw+ux8OhnL8nh18es31vLSIKZhkQjbKq2ptjNePsaen+2VQ73HzZftxIWY6y3/640x9gp5A6QreRqQYvNQpheeYWNhYRQbhEIkI8uYwp0K26tmKZT2sM1m+kl04hd1sTVg/+Xorf6eBPOs0h3YI2wa5RgHYr1+viRLx5+3kPoW3QgvZD46UGCWIp9u2bXBuq9jHziLZ5sW38Sc+oyUXPsCe/Yl9UYgz8LKn7CiO44UuKvo7ggC0DLDg0tX0wlGL4PHs3ybVYv0E2Mf+kf/wP5Mx5zU67vpbpvsM3xaaHzpNyxYWKB39zdMSJNY8rEKWHJ0gzGPIYLerpI+D5vBWQrweXR06pVX/JqHsLY+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(39860400002)(396003)(136003)(376002)(230273577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(38100700002)(8676002)(4326008)(5660300002)(8936002)(478600001)(6666004)(33716001)(9686003)(41300700001)(6506007)(2906002)(66556008)(6486002)(316002)(6512007)(66476007)(966005)(66946007)(6916009)(26005)(86362001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0/TrYaf8pRb2YN2zPSBQrwtdYBmsUBtv+WFCZTQVcqD1XsMbga8RbUG9u9Ol?=
 =?us-ascii?Q?Ub4JNgppp2pA7XWZvtOjtsm63diZiwjYBjC9Frjurf2hwWQW54ZnIzp6diJL?=
 =?us-ascii?Q?wKWCkDHdgl0jSSv1JbbHqn8PQPLLm7ibl9FSa8cwYlFQcWT6mMPT0uT6PQ3x?=
 =?us-ascii?Q?bFg3Ru/DoKM4/m8aTTHDYaQsbYtOuTvhc+pGM2h76ohbCq4ARd3omiLc6Uvg?=
 =?us-ascii?Q?ujvExPBEE9aRlrRToUV+YzKY0S3pb/3Uj7idxFixW/JotIPMVWgsOpWQ3iQG?=
 =?us-ascii?Q?7q9o7nMk0gTUODeSksf/D42K5MQXp8u5vcos+W3UZevm+KYRx99IOwQcbTb+?=
 =?us-ascii?Q?srWxvJOUx/ZFoZm22whZOg56AzLIImuNyEFfqYtlYNHLzeg5FLbLgcREo3+m?=
 =?us-ascii?Q?fm0SEKOq8LJQooEjZkWEvLytFUc58Aeg0a5Y64PR5W0NLMTV9FNgn+qV/HvB?=
 =?us-ascii?Q?sBVRtaejd6U8LWQ7BeBJcdPMKC6qjmXVQZ5P/8o8Z/WvkCgiIUbHNFlKfP0O?=
 =?us-ascii?Q?DcsuaPJLUAuQsKyBuiaxqKNA2DuBRIGRnPSk7IGUMmhosYengDRKzioxx1v9?=
 =?us-ascii?Q?mxHAZ8123J9luAXf7fu4EwpXOaxxteCtF6xdbk4R9wJwETH9lBxUKQ5KE6pw?=
 =?us-ascii?Q?xRSfFy7euR8CG6LyREJ5P3s8Oku5RhfFKdN7D+R5Il+McwyQIfHOcXz60Uvx?=
 =?us-ascii?Q?524xfaverPsPNGE/814rTQ+KxGAUSLT2FYVBUoaj1NTTPStOHOj/ttz5IOYY?=
 =?us-ascii?Q?4TY16Z4oXQXw1JM4CktIuSzJqgBUcleyt2dG0cEgii9mtwyvJ/yWmr4BvRha?=
 =?us-ascii?Q?ZfNoUcpL68q8uy6fVLXrvPL6kH1BF6FO8lR6U5OBFh/y9cNC2xdtY44knL3f?=
 =?us-ascii?Q?s2t7dVmiJ6jqEgvrEkIrh+d6to5Jt/mbLXxgFWzYhNCjWP8cG3ZFdq/JhXDh?=
 =?us-ascii?Q?24W3yTT1np3/Dtai1I1r9wohJf85y+59fFVzNGHhBDJpb/fPpJyRhWZiI9MI?=
 =?us-ascii?Q?TtijrgPQsrf3HbE7BDpQhv/Z5sVEqTlw4vY9Vsde/k6AXOF/ICAPu2ecCpRo?=
 =?us-ascii?Q?yljSc+5QkmQHWBY83LZ5GopUXpjGqjW+q44Ocps9MeXwzQKVz2LUTp5y8SUR?=
 =?us-ascii?Q?oGE8cYjxA/9fjEc05VWDdvG2WIKmqua9e0wVQ/d2fborMyDXePZ1vTp32VB4?=
 =?us-ascii?Q?zxDH8zN1XxFJrJaF+DIqVPSzRQ4UexRuHFAfkTJqXR/ChyfRR5PPrcTjQTG9?=
 =?us-ascii?Q?i/f/GkuczeYNqlIbbhxkPMXr4TVT0eBvIzPzK6xV81OjgScvUvC/6sFjzyQq?=
 =?us-ascii?Q?PJZ/kbsC7+i2V98B0mcvllN4B2bg/Jo0Iwx2zDQV7Tgq42rMOdK6xuCGU+Yo?=
 =?us-ascii?Q?iTdP1dQK92eH1SJVll8q+onz4z56ds/s6IcOppcwGMBubAowPLG0VnhPSsC5?=
 =?us-ascii?Q?jK2YIOTZtEt+7z4S/0RMFaQ24vyPHMm8E0iSuZEmniHUn0hxJ5gO6K7XM6dM?=
 =?us-ascii?Q?0/6tkCqehkuN1oIBAI8Nt40zDbFs6BZobbHcH9zxmyhVzNxV77RZ75sX5yre?=
 =?us-ascii?Q?hRrHJXYuZt3XISB4MG+drtwB+w1s4FKU9bSoIPPTULUHL3EB00mAXdvGtf9B?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3afc48-0442-4549-3fe8-08dc262d5595
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 09:32:13.8368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovIZD8UAPNA3RJV53yap7S+9/1p7WhaPtPSFTRQ9NzJT/gORY4U1BHb+1XNowUSqlrBriWWYMxQAH1qriGc25Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7441
X-OriginatorOrg: intel.com

tree:   https://github.com/ambarus/linux-0day syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f
head:   caa714448992ba4eb583735a4acb26917fbc67a8
commit: 8a167346a33aa28c6e422739e69abc87f57f81bc ANDROID: net: enable wireless core features with GKI_LEGACY_WEXT_ALLCONFIG
date:   4 years, 5 months ago
:::::: branch date: 1 year, 2 months ago
:::::: commit date: 4 years, 5 months ago
config: arm64-randconfig-001-20240117 (https://download.01.org/0day-ci/archive/20240205/202402051349.XPu1hxff-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051349.XPu1hxff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402051349.XPu1hxff-lkp@intel.com/

Note: the ambarus/syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f HEAD caa714448992ba4eb583735a4acb26917fbc67a8 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   aarch64-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   aarch64-linux-ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0x32cc): undefined reference to `wext_handle_ioctl'
   socket.c:(.text+0x32cc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `wext_handle_ioctl'
   aarch64-linux-ld: net/socket.o: in function `compat_sock_ioctl':
   socket.c:(.text+0x497c): undefined reference to `compat_wext_handle_ioctl'
   socket.c:(.text+0x497c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `compat_wext_handle_ioctl'
   aarch64-linux-ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
   net-procfs.c:(.ref.text+0x60): undefined reference to `wext_proc_exit'
>> net-procfs.c:(.ref.text+0x60): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `wext_proc_exit'
   aarch64-linux-ld: net/core/net-procfs.o: in function `dev_proc_net_init':
   net-procfs.c:(.init.text+0x100): undefined reference to `wext_proc_init'
>> net-procfs.c:(.init.text+0x100): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `wext_proc_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

