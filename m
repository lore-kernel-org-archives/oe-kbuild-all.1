Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2262564
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Apr 2023 07:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681889521; x=1713425521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QNkHEbNsQwM+Kg2sDLooajqVR/Ipoysh+ZyH3jzvl/0=;
  b=Scl8LdSVsWf8saSbrlQag+AKCPKH1RXLh8anDcgHEmkE66CDyNlcXIkX
   bySMj/uPEAxTmFjOcKybuNbRSXJ5o+TnQiGfDcmWC1s/s7G6/FKyMiJAi
   uPA4hDLtd0FskYLsHq9//senuNAb8aQRp+BeDlnBFBTYtiagXCQGS7YSE
   ZwfDHl9RUEdlrRgTzajRNiE15xrSeHzWr04+CwXh8J0TDtp35GIGkv6qj
   FG+jguxA6xmPCQExHpnATEei7/8klwZDGPZ/T3q4hJw/dNyUPCaIZL03g
   p0R+xDQR21sQ7d5eAtHH/Oi2sVjkcKGxMPHhBLwWUjdfJfQxpOU+t9Cos
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="345379476"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="345379476"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 00:32:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="802834963"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; 
   d="scan'208";a="802834963"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga002.fm.intel.com with ESMTP; 19 Apr 2023 00:32:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 19 Apr 2023 00:31:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 19 Apr 2023 00:31:59 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 19 Apr 2023 00:31:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRdEpCam5YZ2B8pzhBcQMJ4Sz3gHw+o2FWCWKcRddCw7FriywO6lJEpHGtO+FW2pTyWSVeuxtJtQD1GWD5Jen9Y+cCt0OXHqtM+jQ1gaQWBdqrf6xx02o7TcdodGoQcI/J9d1jMDL+Fg6eZVycCKk91Kto7INiPzEa2luomh0j7nw38X7MjRdQ5LOqb6KOlyCrvSz3+hebLEGgX9NctuhRNVyw8OYWEA10NrThY0V4UTKr6vMH8R96L+44nX6Z+G+CqYrLuDnt9c3IGZV7qEUtaPIve0ZCUxDh4MF9KklOS4aGzOtZMV3e9Frhw4FsM1afG+Y2xkrpdFsE327/FOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YVn+eDYPUb6sch+YtjMhcwStCQFgTcpI3jk+wDUJ2M=;
 b=kzikBdFl6lQA6YS6PFkrDb3WuPlH3y5W2nS5Nl4IXBb5uCO284Bh38n14v/iMaDlO5EyfP4A9Bdrz8Ht4W9JwgI6WelBc/r8/VA3sRuzDoD+sF5A8OwdBxZqJxrTw66yoUt7OPsIQVdXot2Rh0VWTkPkEHERyhWiR+VjkS92FS8/0NSvtSdY9UHPwJ3x0hqnNoqbELyCGuVtQq0uJL16Aao8+lxTpP+zqtpObDtiD5qJkjjMb8EJHnCBlVwQas/TP77Ktu1kdbQUuK3cPkXmoIWHJ0qbQkhgKQspcxmRJKUxM1E89RhhdDxPGUlJbOCOxFuZsHKYtpzu2N/Qw9hhAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB8124.namprd11.prod.outlook.com (2603:10b6:510:237::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 07:31:58 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 07:31:57 +0000
Date: Wed, 19 Apr 2023 15:28:54 +0800
From: kernel test robot <yujie.liu@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Dave Chinner <dchinner@redhat.com>
Subject: [linux-next:master 10579/12016] fs/xfs/scrub/refcount.c: xfs_mount.h
 is included more than once.
Message-ID: <202304151202.l0mNcH9D-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR06CA0204.apcprd06.prod.outlook.com (2603:1096:4:1::36)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH7PR11MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: bcadca15-9b37-41ab-354c-08db40a82823
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6tAVIWFFSUDrO0TRVvn9HoINws0gkKkDc73Te3JilBugCs0YzQR4+BXHuE87+3hBdkjyu7hy3m1CIzfl4CvguXauUooQl0EwQL2p4m4TB37MWCLNQnTZqQGJYv+PWfuE+FVyJUwn1Dd0IluASasASJy0CubLr1ESpIQrLiKb/x73jeJYq1ZvsFfr4WfZJDnPJorVeJgxOPlTicI/HDNFxULMvIIbT5UtZg50FyE5QWHYgcO8SNge29XQTkqevtTLcS0xdCU8vlzgn9Np1Ge/Kz39O8LHSwX1VaZtvTblFPU6eWdBThRyTeSSTa85np0ktjAXtRfDXYq5jwy55ugIShnZVsfBJ/WgczwEnlHKzSmNUER+rLoLR1QjGhOevVMbgrWP8EsHvSjVM0MZBB7ygr4KAnyrhm5kj9+wvufG4oQJhSndQOkjyz4iOH2TS+0Ixn5dkOd4+L9WcHwVk916azijN0tuuX+sUz/DSs9VYNS3MFa0a7pIT983NLkj2kD8JdlXDw4gYqvgR5b5wylX4e8BR13nmwmH2fn0KZVn+hXE0AUF4nfRbJ4Xqr+YNFhlvDOh4q38YCRc5jMbwE2v7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(376002)(136003)(366004)(451199021)(36756003)(4001150100001)(2906002)(8936002)(5660300002)(8676002)(41300700001)(86362001)(38100700002)(478600001)(2616005)(316002)(26005)(6506007)(1076003)(6512007)(54906003)(186003)(6666004)(966005)(6486002)(6916009)(4326008)(66476007)(66556008)(66946007)(83380400001)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZniQXheQxdNyz7gIQBpoeg6gE22fry8AQjLTzGMydEReBlhT+Auxl75ULWHF?=
 =?us-ascii?Q?1GlO6K51HBURep1EsRnL3FENKdp3+GoJU65J/W4nJ+NOoSPaPmjT1LSzPrBl?=
 =?us-ascii?Q?em8x3udyR8rrpOU/74c/M49bvPjc5Hgz9B+F9zlp1Dr/ED3s3MXiA9E0wkEy?=
 =?us-ascii?Q?zQp3YT6H1nbsn1OJ8iqUv3zSYmL/D8I+VsPl+K6rhNgLTA7319gIVQVNU/oQ?=
 =?us-ascii?Q?4VPGxJAlUd595GyeJrP295IqMTUgN4qPW94lt8d8ZMTErMbPIzrhmkJXirk2?=
 =?us-ascii?Q?EZisEm7pAwvGk5+evamXYk6Ej/Mq0GdklQitexRxqAkmD6ycYuH0+9ImsIWE?=
 =?us-ascii?Q?SdPCNbdTAZ3rPbztcscKJzI4KkueJM/n6b4n+EWBB9/IAQheG0Qv7qEohX8i?=
 =?us-ascii?Q?S+kitn1Qbdk7dewODbashgjr0XpRCq7ic60I75FHEa4PcaAxOSthJpMwlV6S?=
 =?us-ascii?Q?+QYuH2mUkEQGBdaKmiM7Ox04bYRavbtVu92SESi/ovJ1KMQleXpVLD/D/Clx?=
 =?us-ascii?Q?7YVawGz62OVB/qBvCB+LhPj/7uF5W1gLS8qcXNeJnO52nWyUTaKh4oZ5E4e9?=
 =?us-ascii?Q?ttyF0hBtUkdNle8BdwT+qaiqBCKDLv0zIOoWQ7LqM+oATh2rK3xYL6QP7wSf?=
 =?us-ascii?Q?a7Zl3ZQHeJRjLWmuiqZdFhoqKXZiVZCRUuv8JBCsicyYH/JiyC9d6WcRnTyX?=
 =?us-ascii?Q?yNFp2cvLxG3hgKR8iCUumxsmelkZi8XrBM+Sw0pOOogMyDwkgEmLLjnEz+hL?=
 =?us-ascii?Q?PgH5TiFn+I34bglNdv/lmJJjoR8IEBh295aiTP8KYatiPGoD1PketsdkfEwb?=
 =?us-ascii?Q?17zUHsDzlfGbsYYJt2eX5E1b8ML5RlF0iYF99v8/Cune28Ny1czAKyM70/mi?=
 =?us-ascii?Q?e2Pv48eVbgFt6p9m6koqsY+3uQzlWX8XhDWM/dz/KsTovkGyxrbUv47ifwwd?=
 =?us-ascii?Q?NAV9ZMbiOu3AOPNVF37JhiikABmX7YyZx3wv+AwvOa2g1GRozy1D/CaF4ez2?=
 =?us-ascii?Q?t48wsay2XRUHFDg4ChXqEMmaCnG5f6C3NwAPpGe57nYSJZUqOhyKtK0yDHXR?=
 =?us-ascii?Q?K4OE9Aflji2ebjtAnTU0A+w/AwY1zp3lo/+NFPcp62QoYMohCkw9u2F1V+br?=
 =?us-ascii?Q?zglWt7/cGB5/aP5N4KiZEfR+6d1B9wbB9Fxr+tmWdNSSZim496gzSjCH4GjC?=
 =?us-ascii?Q?+3v/YMkFm9OlQPVmDO29/0LjoXiUuxsR5DjgMo3ADxu3g9ZMrF8hG2ur0XA1?=
 =?us-ascii?Q?kq3az9aE5y6PNeKFrX+cdNHIxcyQdm0rRDlGwNukv9qns+jUnvs/ZRUhh37E?=
 =?us-ascii?Q?R/q6j415HuB7XPYXc5mVPqRDbKF3mAvbYIKlw1tJHMCbeIMYsHFgh6OLFjSR?=
 =?us-ascii?Q?nShoIoe4+qmsXyNWnrJhSDKLwIUUBBqpFqyb6toJISb38TzK2MTOzFKpgovB?=
 =?us-ascii?Q?1gRUjUfDEDAiTArBjcBBnoaXpAbBotNmYShPwKKg3clv51c007JgXrf/HZpI?=
 =?us-ascii?Q?DkwZQ+xYAoaQOUCTzJezGViXdBURGlJ26CHb41Yy12zIuoVd6EP1VzAHphCJ?=
 =?us-ascii?Q?bXDvQfWqiquT91A9ScMTw55Sb4C2sItYgeWAcRku?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcadca15-9b37-41ab-354c-08db40a82823
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 07:31:57.6646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZ/a9yMeHK+FOp0ofEd9Hp81oSySGYYWRIvwHFfOrYFKTiaIt53V8JsrAgpZ3ITga5FasDBW/SS13px0/1HjjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8124
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d3f2cd24819158bb70701c3549e586f9df9cee67
commit: d5c88131dbf01a30a222ad82d58e0c21a15f0d8e [10579/12016] xfs: allow queued AG intents to drain before scrubbing
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151202.l0mNcH9D-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/refcount.c: xfs_mount.h is included more than once.
>> fs/xfs/scrub/refcount.c: xfs_trans_resv.h is included more than once.


edc09b528628a (Darrick J. Wong 2017-10-17 21:37:41 -0700   6) #include "xfs.h"
edc09b528628a (Darrick J. Wong 2017-10-17 21:37:41 -0700   7) #include "xfs_fs.h"
edc09b528628a (Darrick J. Wong 2017-10-17 21:37:41 -0700   8) #include "xfs_shared.h"
edc09b528628a (Darrick J. Wong 2017-10-17 21:37:41 -0700   9) #include "xfs_format.h"
d5c88131dbf01 (Darrick J. Wong 2023-04-11 18:59:58 -0700 @10) #include "xfs_trans_resv.h"
d5c88131dbf01 (Darrick J. Wong 2023-04-11 18:59:58 -0700 @11) #include "xfs_mount.h"
edc09b528628a (Darrick J. Wong 2017-10-17 21:37:41 -0700  12) #include "xfs_btree.h"
edc09b528628a (Darrick J. Wong 2017-10-17 21:37:41 -0700  13) #include "xfs_rmap.h"
f6d5fc21fdc71 (Darrick J. Wong 2018-01-16 18:53:09 -0800  14) #include "xfs_refcount.h"
edc09b528628a (Darrick J. Wong 2017-10-17 21:37:41 -0700  15) #include "scrub/scrub.h"
edc09b528628a (Darrick J. Wong 2017-10-17 21:37:41 -0700  16) #include "scrub/common.h"
edc09b528628a (Darrick J. Wong 2017-10-17 21:37:41 -0700  17) #include "scrub/btree.h"
901489030441f (Darrick J. Wong 2023-04-11 18:59:58 -0700  18) #include "scrub/trace.h"
36029dee382a2 (Dave Chinner    2022-07-07 19:13:21 +1000 @19) #include "xfs_trans_resv.h"
36029dee382a2 (Dave Chinner    2022-07-07 19:13:21 +1000 @20) #include "xfs_mount.h"
50f02fe3338d3 (Dave Chinner    2021-06-02 10:48:24 +1000  21) #include "xfs_ag.h"


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
