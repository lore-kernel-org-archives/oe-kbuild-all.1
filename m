Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18C71EA90
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Nov 2024 08:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732004848; cv=fail; b=FKZiqtXKO/RkVPLGdH+9gfExQEPCpVaM9PmsZAlPUfjg2sgEvkvrUZrJJdHZ/BNSDktSDP3hBmBKAosRVtbX5pzY6dfOUPu2uH99NEpF1UV5q48NNn0gqJq+vPvOB/2CcBAe7fSFLNgHLpi6VI4okgxazg41bnT2hz3egiWIg10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732004848; c=relaxed/simple;
	bh=9gZGvWFPvc96C8q7Q+sYZRkZwgqKgcmvWB/glrTznk4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WRJKzI8bfixB/b/O/48yovgGi5Y69HYE5qOK8I+AXzSGJTmRNig5ZiiV3149JTkYhKywl3vp21GqIf2zaDze4lb34TJQ2uOLua7iu2SYGdooXjGM9g6w7lEiUqd09t+IuxqJVuNGHBlIBjtoLDdvFhBRYFlYg62ZPMMX6p7sa5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZvxWRlhj; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZvxWRlhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732004847; x=1763540847;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=9gZGvWFPvc96C8q7Q+sYZRkZwgqKgcmvWB/glrTznk4=;
  b=ZvxWRlhjOJUvDGOGjm9P5S63g5lsJTn0Bud5NJvNowEFAQ5Nw9VRGrmZ
   JnA62cxBXpUMTjX6J2RCFvhC14pWeAHidsXL9VLGWbIHowHRZ7tkoBMp+
   18Sx77xm5s8O36b3azw+nvm2Ka+RmdaDIsyqLNzyau8FJaUk+AUINYyG4
   AE90mITflRK1IxIrxJhtjFHHINucZ0euzCgYFwl9L731oSYNEh098HI8g
   DFosrNHjffa8Ti1MNxwcIiQseK8q7dchjI0vr7MDWMnN/5RjfaEMMa7VS
   qrE4NWDkk/w0EXhk2/PTcMQlLhv+jfmRYkkINdVRbAhAJ7xRzTY3R6w3w
   w==;
X-CSE-ConnectionGUID: zOM8kS5yTj+RvCEs5NZ28g==
X-CSE-MsgGUID: 5aUnCvVUQ166FXiQMFHtgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35659679"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="35659679"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 00:27:26 -0800
X-CSE-ConnectionGUID: toHWGzZAQre0k+aFhwUjmw==
X-CSE-MsgGUID: 2SIEOVvkTNe74nkEriKAmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="93937828"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 19 Nov 2024 00:27:26 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 00:27:25 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 00:27:25 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 00:27:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBFc8O3VHBvNPpSL41HDtwtP+Gp3WQtjGd2T0XnjuujyI1gocl/cN3hwY405yePSp93mw1sXWJVfDqyT1DL0jBVJPjEFZSzGBZmohfAeurDs4bej5up8dKYJiCiq5YCQ0ix0xXAZdzsnGckLofOEV8oM6x9DAYmQrdsL6YZT9lYnS70qIhUkg1W2XuWfISFPTUA3JfYUpRWVBf5nCzhZZgJl8zaecF9T8PIibmrDqUMoM+0LZ0GTBf/w0eSCrfuOZnkrchLqxBVuLXkjYqXAKg24Egmr6czB9/PKhCI8wjS+7rwB/IqBBO0kQX3sN74zrxOXnS2KLZbrTfd8Rbo3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gXHw4iqFCSQW0oUi4o8WElO/YWhaSdBKybEMJV7K+JM=;
 b=qjb9NUxuokRmWobTN2w/juSjAE7OzaW9Uihr3DrizGn2WEZJxiQA0XniQ+mZ4WaqqqKH5AQ4WeP3/Kkj3evrteINIxSwlgbGf7h8Qvbyc13b0G5iy6AbdTQhbBdJZ7DyXPlMOGtfRT6titym4eOdMeRAZDyqcZeS/ggjQVKx5AXJi443/CDQPsBnyFzYPhlFeiKo5z6WNp9WL8ej07xMfRX0S+Iwhr15OHid2N2eiY79ZxA2vRKXtyQsg/zmpC17PnaRwrjtg46bSejSizajgZLegSCj8FqA4j8IfRc22ttSp9W2UYt1zIX1EihzC2a8DaklZXarMfSzFJS1ZDmrmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 08:27:17 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 08:27:17 +0000
Date: Tue, 19 Nov 2024 16:27:08 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: "paulmck@kernel.org" <paulmck@kernel.org>
CC: lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, <oliver.sang@intel.com>
Subject: Re: [paulmckrcu:dev.2024.11.11a 57/57] ERROR: modpost:
 "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <ZzxL3ERFP1sC/5dC@xsang-OptiPlex-9020>
References: <202411170515.xn5afSbv-lkp@intel.com>
 <2865de48-b9e4-4746-ab28-0e645ab97d1d@paulmck-laptop>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2865de48-b9e4-4746-ab28-0e645ab97d1d@paulmck-laptop>
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: bad3944b-b491-4047-d8ff-08dd0873fa5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lWkX/67Am0GJ+GHvue9Lx20JPSDUCVqva4a+IppwxpEqFFhgR4y4ycV6oNlH?=
 =?us-ascii?Q?/tyoPFhTbsMKzi1R36Ro4ZmdTB9MVN/zZxJz4fdOXuTS+zbV13JomDlKxDmH?=
 =?us-ascii?Q?o/JgKU0+53+COoKzYdMMw4nRJL7YdahuiVxF/fYR39Ofx4dhf3F/OjQtKTQb?=
 =?us-ascii?Q?9W9pXn6Jd+e9dZEaRD7VvwgQCde2PatjMX+wyhI7hbTVAQPib/q+eZZE6LIb?=
 =?us-ascii?Q?ZSOHSTi1IO5tCASOouMAdZCl/YCVnR5oFLfEpHH7w32IjeDA3B+w8kIftEFg?=
 =?us-ascii?Q?2OPPVqNIjMFBK4hxXjOVUHcCN2SMjZfy87fY9Vo3L9uuysdVvzfDFKCwLmKw?=
 =?us-ascii?Q?PM7vEZOyh1j4basaP7P/UTn+JA0yXtv9rHohV5Dyy5L4zOeRsz3gLxXT5621?=
 =?us-ascii?Q?QSwSxrCcmWM1jP1mlLDno0uBAri6ToyhLXaqOpOj5FVySZXiHI98MLrbGds3?=
 =?us-ascii?Q?H1UdC65MITEaGnFaMbUs/YF4YH3EcOScyVJhvucdQXu1aQC1njYyw/HuGma1?=
 =?us-ascii?Q?vGlmIdf9cpdkm94t8KfbFawd8uuVCPkDj4HqCay84TpljJoilQvvUz30FGli?=
 =?us-ascii?Q?xZUeiKSZwyzGT6pDd2CRDRvtGb3916H5ewVsEiPyujZS7HbEhlFjPwLegfzz?=
 =?us-ascii?Q?faHB1tgackFsxD7ft8hOJo9hOM619Wd/n9lg61QMfe969Po2r+ht+yh6pm72?=
 =?us-ascii?Q?YbBGeXUVigzYRDGz9uFujJlKE10qzQd2+LfxyQ7WF7RC16T2/SstY2IT9qJs?=
 =?us-ascii?Q?iKO0sJbjZgRb06Tx3BPAe9iDBczPBYK9Dho+Mt/tjf/nTJRlqadetX613mDT?=
 =?us-ascii?Q?OWpuBlrsSUdTqogHHtwH0FTUAoFUh7KxgmVXsePhON8mPWcy79bUjebGvTML?=
 =?us-ascii?Q?qOaUOlbcPelOcU4r8tfMWx6lOiljkK6Jvpt1Psx6t4WP+3sF/8Eglge9c+6x?=
 =?us-ascii?Q?x58UQFH+5fQSlf24UU6GMt/tsLqVncsTTVeqUpySje8SJ21SOaO5jDUwZ2em?=
 =?us-ascii?Q?Wvh4Cw0pROsNoAfwysnb7fc9mavSYdjB5KRm+UJF228N5Yu8UDgpLW3jblDC?=
 =?us-ascii?Q?Tg1kcb1OePEe6pK77P7yOmdUjZydWVNBm26+VnRRIV8pWLFqV70uWabaV+s1?=
 =?us-ascii?Q?qcRE/vEiEFlwJOFe2Cij3avM1XLrZ3clSwlIaDJkP0POr59rKkVCnMwSU67F?=
 =?us-ascii?Q?SCbBYN5KCQsLUSGZzXrRQNft4L+7eJNZTr3D+3zve/mS9bc9h7olfnIWsIMC?=
 =?us-ascii?Q?YFqW/iJO6WPlA73liJC/W86lbFCHTl1sXTbZbU2nNQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T5P55duMHnV1RvixNVsmSauRY+k4JkSNRYKHWybH2r6gAMQnZvFQXm/y2QkL?=
 =?us-ascii?Q?6dhA2t/iGaBUa+O/SudEJdgSVoARUfL6vxz8IUaNHlsSn8kLK6bQrp3ZlE69?=
 =?us-ascii?Q?1hDMqTrfYDWe5gpYeKYeJAhqVk6QkBzOI18FrFQRl9kXjFeEXn/qgWEoN56/?=
 =?us-ascii?Q?7G4u3W5t8uDn0PSzR1QB7KR8mrRnuKAXjKgjUci7mXCRxKm+UaL8ZQH1NxHD?=
 =?us-ascii?Q?O+GuGuLjNURqs28KigPaqblEEJDHfKHp5+cXWvmzb8nTtsywKjCm8cW5OBTX?=
 =?us-ascii?Q?4xyyjRKxqjnPRBgjn/1sLsKGLzSpfOKiSfjY+JYFJQZwTvMxoIDtvnzKFa7y?=
 =?us-ascii?Q?0kx3qm3IXk6tPLeojJeqci9w4wBwC+4wCKBOJrioH5IUvspbPtK1gMRLVuwJ?=
 =?us-ascii?Q?zKg5LiAKKpUQAp1uoep7BKuPZgSxSGCL7mDovjSRPZk+T0+V9cO3iFayKVgO?=
 =?us-ascii?Q?KCkYaegI2g2m8hyvOFc81WUdKLkLvcTSoNTcQeqAD88OBF6Ule2yWZWQ28dU?=
 =?us-ascii?Q?Zzv0wfj+kancR9vCq9sALfUVPskf9SufN7hW/Z0tIz+rAm7Pth756O7ek27x?=
 =?us-ascii?Q?xOGEp+UgM5DufoVzrdikqv2QFHnxF7K/9IL4clopbr+jnLbxhinuZ9HqlDUL?=
 =?us-ascii?Q?QWyFTPpX3237pfamQytMrEnaudXkoN+AzEqAnwebpstdGaZ3J84T104To22q?=
 =?us-ascii?Q?Qz3vpBNV99LSalwiRIKfkjZ6Z/SN3a4g5czvDZX0P+Ip1DJvp1t+W4G1azPQ?=
 =?us-ascii?Q?lUk/38+kwY+OTm8MFiyP1/WiMELqgwx/HoZ+NvPwLhsJSL6Z5iR0+VXGNchX?=
 =?us-ascii?Q?bbLEoa/eml1M6gJZ45tXABxgljfouba5CiopkJdlEXhBPM2qcOmqw7FxtEww?=
 =?us-ascii?Q?Kv/038oYaUvllANdL8yr6ceNV+nU+focr/eOHfjfJA9Nw33I6KiArfiN4YEa?=
 =?us-ascii?Q?yOgZZhbojFLhuonPQBVJUEFhkrya8SuuOENpdg5/LHCZzRQp5XMjvRPpwx/C?=
 =?us-ascii?Q?xFJsCgfvYpXUsYEr4Wdx86hV0dYKJS4gcjm66utMIRC3olejCor8wZ+IhRYQ?=
 =?us-ascii?Q?Zzsvo1GSZHhQ90RvAB0fmZdUtxFAIkcNbwYTIoSeCBLA2rtRmQEnzvYkNVo/?=
 =?us-ascii?Q?zEs0ORtg0lxwbxVHmyhv6JN6ZcKNUzaQJ7VgNUM+1EWWa+zI4wRsxmogFpVV?=
 =?us-ascii?Q?INEPIpMf/Ok7bc3Ig+oq5RmzzDvwIAYkJ0UnCTFV/YAPSWA8eY5uvhnqUbyA?=
 =?us-ascii?Q?vBMOEj9xSUxJQ+fp10frYgFAZ4V14+YQArvPgEWliR1R2fNiIaFSG5HRtKXj?=
 =?us-ascii?Q?M2MpKnTiE9/ZcHbeEq2AvNmggcXaxLsyB3zBLwOwUNG81YaYA9V/Bgfk9FLb?=
 =?us-ascii?Q?PwgyLpkf7nELaBmW7b9oMsItxM68lXsgqXoTd5KRdYVuO94EyfUFqQ8z51kY?=
 =?us-ascii?Q?WM4ee/FZpiw1k+0hUuRz8+OyUVBRbKPGNRntma6ot1T+tMiNA8eE/IGNHVk5?=
 =?us-ascii?Q?yM340QIq1txNn9tEtIOJXO+QOvJwtWwzycS2bhfmLjPuqwJsF99OKagb5uQ3?=
 =?us-ascii?Q?iv4ao5e00KAuOSqPvUI+UyeOgyTdUbQecE2Dm7Sd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bad3944b-b491-4047-d8ff-08dd0873fa5a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 08:27:17.4672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTP53rq7mWpk4pvNQMMSpWxkdfCZIfNprevmQKe/N2+Mne96zfWDb2J0GvhoUdwttBz8rydVBZwfC6D/cfJVeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8562
X-OriginatorOrg: intel.com

hi, Paul,

On Sun, Nov 17, 2024 at 11:20:01AM +0800, Paul E. McKenney wrote:
> On Sun, Nov 17, 2024 at 05:36:37AM +0800, kernel test robot wrote:
> > tree:   https://github.com/paulmckrcu/linux dev.2024.11.11a
> > head:   b97695352d2b790045081e2c9afe32736f5ae3d6
> > commit: b97695352d2b790045081e2c9afe32736f5ae3d6 [57/57] rcutorture: Include grace-period sequence numbers in failure/close-call
> > config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411170515.xn5afSbv-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170515.xn5afSbv-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202411170515.xn5afSbv-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> > >> ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> > >> ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> 
> Good catch!  Does the following updated version of that commit fix
> things for you?
> 
> dce261566c2a ("rcutorture: Include grace-period sequence numbers in failure/close-call")

after applying this updated version to parent of b97695352d2b790045081e2c9afe32736f5ae3d6,
and run below build again, I still saw the similar failure.

root@d3df53de803b:~/linux$make W=1 CROSS_COMPILE=sh4-linux- ARCH=sh -j$(nproc)
make[2]: 'include/generated/machtypes.h' is up to date.
  CALL    scripts/checksyscalls.sh
<stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
tools/testing/selftests/arm64/tags/.gitignore: warning: ignored by one of the .gitignore files
tools/testing/selftests/arm64/tags/Makefile: warning: ignored by one of the .gitignore files
tools/testing/selftests/arm64/tags/tags_test.c: warning: ignored by one of the .gitignore files
  CC      kernel/rcu/update.o
  CC      kernel/rcu/srcutiny.o
  CC      kernel/rcu/tiny.o
  CC [M]  kernel/rcu/rcutorture.o
  CC [M]  kernel/rcu/rcuscale.o
  CC [M]  kernel/rcu/refscale.o
  CHK     kernel/kheaders_data.tar.xz
  CC [M]  kernel/torture.o
  AR      kernel/rcu/built-in.a
  AR      kernel/built-in.a
  AR      built-in.a
  AR      vmlinux.a
  LD      vmlinux.o
  OBJCOPY modules.builtin.modinfo
  GEN     modules.builtin
  MODPOST Module.symvers
ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
ERROR: modpost: "__clk_get_name" [drivers/phy/rockchip/phy-rockchip-samsung-hdptx.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/phy/rockchip/phy-rockchip-samsung-hdptx.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/phy/rockchip/phy-rockchip-samsung-hdptx.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/phy/rockchip/phy-rockchip-samsung-hdptx.ko] undefined!
ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
make[2]: *** [scripts/Makefile.modpost:145: Module.symvers] Error 1
make[1]: *** [/root/linux/Makefile:1888: modpost] Error 2
make: *** [Makefile:224: __sub-make] Error 2


then I did a 'make clean', rebuild again, still run into same issues.




> 
> And thank you for your testing efforts!
> 
>                                                         Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit dce261566c2a67b8e088a6c6ed1e8a1d68e3c5b0
> Author: Paul E. McKenney <paulmck@kernel.org>
> Date:   Thu Nov 14 13:55:32 2024 -0800
> 
>     rcutorture: Include grace-period sequence numbers in failure/close-call
> 
>     This commit includes the grace-period sequence numbers at the beginning
>     and end of each segment in the "Failure/close-call rcutorture reader
>     segments" list.  These are in hexadecimal, and only the bottom byte.
>     Currently, only RCU is supported, with its three sequence numbers (normal,
>     expedited, and polled).
> 
>     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> diff --git a/kernel/rcu/rcu.h b/kernel/rcu/rcu.h
> index 2909662c805f5..dfcec925013e8 100644
> --- a/kernel/rcu/rcu.h
> +++ b/kernel/rcu/rcu.h
> @@ -590,6 +590,8 @@ void do_trace_rcu_torture_read(const char *rcutorturename,
>  #endif
>  static inline void rcu_gp_set_torture_wait(int duration) { }
>  #endif
> +unsigned long rcutorture_gather_gp_seqs(void);
> +void rcutorture_format_gp_seqs(unsigned long seqs, char *cp);
> 
>  #ifdef CONFIG_TINY_SRCU
> 
> diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
> index 79689a14359a9..de8f7f9ed99cd 100644
> --- a/kernel/rcu/rcutorture.c
> +++ b/kernel/rcu/rcutorture.c
> @@ -273,6 +273,8 @@ struct rt_read_seg {
>         bool rt_preempted;
>         int rt_cpu;
>         int rt_end_cpu;
> +       unsigned long rt_gp_seq;
> +       unsigned long rt_gp_seq_end;
>  };
>  static int err_segs_recorded;
>  static struct rt_read_seg err_segs[RCUTORTURE_RDR_MAX_SEGS];
> @@ -407,6 +409,8 @@ struct rcu_torture_ops {
>         void (*gp_slow_register)(atomic_t *rgssp);
>         void (*gp_slow_unregister)(atomic_t *rgssp);
>         bool (*reader_blocked)(void);
> +       unsigned long (*gather_gp_seqs)(void);
> +       void (*format_gp_seqs)(unsigned long seqs, char *cp);
>         long cbflood_max;
>         int irq_capable;
>         int can_boost;
> @@ -611,6 +615,8 @@ static struct rcu_torture_ops rcu_ops = {
>         .reader_blocked         = IS_ENABLED(CONFIG_RCU_TORTURE_TEST_LOG_CPU)
>                                   ? has_rcu_reader_blocked
>                                   : NULL,
> +       .gather_gp_seqs         = rcutorture_gather_gp_seqs,
> +       .format_gp_seqs         = rcutorture_format_gp_seqs,
>         .irq_capable            = 1,
>         .can_boost              = IS_ENABLED(CONFIG_RCU_BOOST),
>         .extendables            = RCUTORTURE_MAX_EXTEND,
> @@ -656,6 +662,8 @@ static struct rcu_torture_ops rcu_busted_ops = {
>         .sync           = synchronize_rcu_busted,
>         .exp_sync       = synchronize_rcu_busted,
>         .call           = call_rcu_busted,
> +       .gather_gp_seqs = rcutorture_gather_gp_seqs,
> +       .format_gp_seqs = rcutorture_format_gp_seqs,
>         .irq_capable    = 1,
>         .extendables    = RCUTORTURE_MAX_EXTEND,
>         .name           = "busted"
> @@ -1989,6 +1997,12 @@ static void rcutorture_one_extend(int *readstate, int newstate, bool insoftirq,
>                                 rtrsp[-1].rt_preempted = cur_ops->reader_blocked();
>                 }
>         }
> +       // Sample grace-period sequence number, as good a place as any.
> +       if (cur_ops->gather_gp_seqs) {
> +               rtrsp->rt_gp_seq = cur_ops->gather_gp_seqs();
> +               if (!first)
> +                       rtrsp[-1].rt_gp_seq_end = rtrsp->rt_gp_seq;
> +       }
> 
>         /*
>          * Next, remove old protection, in decreasing order of strength
> @@ -3664,6 +3678,14 @@ rcu_torture_cleanup(void)
>                                 else
>                                         pr_cont(" ...");
>                         }
> +                       if (cur_ops->gather_gp_seqs && cur_ops->format_gp_seqs) {
> +                               char buf1[16+1];
> +                               char buf2[16+1];
> +
> +                               cur_ops->format_gp_seqs(err_segs[i].rt_gp_seq, buf1);
> +                               cur_ops->format_gp_seqs(err_segs[i].rt_gp_seq_end, buf2);
> +                               pr_cont(" %s-%s", buf1, buf2);
> +                       }
>                         if (err_segs[i].rt_delay_ms != 0) {
>                                 pr_cont(" %s%ldms", firsttime ? "" : "+",
>                                         err_segs[i].rt_delay_ms);
> diff --git a/kernel/rcu/tiny.c b/kernel/rcu/tiny.c
> index b3b3ce34df631..f068bd9dc0376 100644
> --- a/kernel/rcu/tiny.c
> +++ b/kernel/rcu/tiny.c
> @@ -257,6 +257,20 @@ void kvfree_call_rcu(struct rcu_head *head, void *ptr)
>  EXPORT_SYMBOL_GPL(kvfree_call_rcu);
>  #endif
> 
> +#ifdef CONFIG_RCU_TORTURE_TEST
> +unsigned long rcutorture_gather_gp_seqs(void)
> +{
> +       return READ_ONCE(rcu_ctrlblk.gp_seq) & 0xff;
> +}
> +EXPORT_SYMBOL_GPL(rcutorture_gather_gp_seqs);
> +
> +void rcutorture_format_gp_seqs(unsigned long seqs, char *cp)
> +{
> +       snprintf(cp, 8, "g%02lx", seqs & 0xff);
> +}
> +EXPORT_SYMBOL_GPL(rcutorture_format_gp_seqs);
> +#endif
> +
>  void __init rcu_init(void)
>  {
>         open_softirq(RCU_SOFTIRQ, rcu_process_callbacks);
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index 976b31778273b..aeceac2ea29ee 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -559,6 +559,26 @@ void rcutorture_get_gp_data(int *flags, unsigned long *gp_seq)
>  }
>  EXPORT_SYMBOL_GPL(rcutorture_get_gp_data);
> 
> +/* Gather grace-period sequence numbers for rcutorture diagnostics. */
> +unsigned long rcutorture_gather_gp_seqs(void)
> +{
> +       return ((READ_ONCE(rcu_state.gp_seq) & 0xff) << 16) |
> +              ((READ_ONCE(rcu_state.expedited_sequence) & 0xff) << 8) |
> +              (READ_ONCE(rcu_state.gp_seq_polled) & 0xff);
> +}
> +EXPORT_SYMBOL_GPL(rcutorture_gather_gp_seqs);
> +
> +/* Format grace-period sequence numbers for rcutorture diagnostics. */
> +void rcutorture_format_gp_seqs(unsigned long seqs, char *cp)
> +{
> +       unsigned int egp = (seqs >> 8) & 0xff;
> +       unsigned int ggp = (seqs >> 16) & 0xff;
> +       unsigned int pgp = seqs & 0xff;
> +
> +       snprintf(cp, 16, "g%02x:e%02x:p%02x", ggp, egp, pgp);
> +}
> +EXPORT_SYMBOL_GPL(rcutorture_format_gp_seqs);
> +
>  #if defined(CONFIG_NO_HZ_FULL) && (!defined(CONFIG_GENERIC_ENTRY) || !defined(CONFIG_KVM_XFER_TO_GUEST_WORK))
>  /*
>   * An empty function that will trigger a reschedule on
> 
