Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61D0199A5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 15:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Adb1AU0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699458212; x=1730994212;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jSFt8Gs9xY5SNLCqPrm5sTmf+W8stx7BuIgF8V79PSg=;
  b=Adb1AU0PYRcuNPSi2tAXSN5SPXjyEsilV4HZxFIV+v/97S4hjtFZCefi
   QiTsoYyZPznLcZFAhQQnJJS2lmNCoIieSWaF7dSpNjl8sSsYUNZDcu4mO
   RiBNld2YinlwOzf7vuJz2DYVX1fBxqvd+vTtgrVxDArKw9J4P0Phbzstw
   J/mAqO0Y1RNcrsLHdHrlYHANx5bZfTSPrZt8SU+lNVjZdRUML8B1J/Rq1
   3jUzwsOEiGFN8C1TVIIkgs29L5yriQRkYbHj2VR7uR2q2LeJQYFwkwMxs
   ZeRfQxLpRd7stPS3u32l8jmekR1+zX6LTVKFYLwwM6HS8sBXytMc9eFGl
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="8441029"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="8441029"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 07:43:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="739530749"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="739530749"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Nov 2023 07:43:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 07:43:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 07:43:30 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 07:43:30 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 07:43:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMgd9i/twtWJCPIIqQbfzJ6hDGIF8C9/TtOvu469boBd5D4b34nZ2DL8aR/IjgewNtrflbB3CREBN5TZIZm8eVEG0BK4GeoT22OC33tyqrYG9reC7TGgwsRvo9lSW8Ve5BLtdMDG4Do/Tt8C6oZE5ok9L1G1PnsVTCUvIOOhqf/jI/XGgSUpJO3Hg+i7JLwBIAjZpZuPkUfER3C/otjy85xztdFF5/xZPtbXe1zBMshrQzMoGuh9RuVRAR67qUe8vKoW6vlbDljNNCqfzf2GrSyQiQPbge4gL2nmeeBZXp1/aD2AXk/qvwyXMDVZoPUV5wBkLeeaaHAFLIxkkpJyaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BiKo66q4OuhVIRrrxkgR7OPMd0GwNXmy8zYVFTlzTs=;
 b=SEqeS2EfjJp2fAAR9R0VSx+WdvD5No1rtW1d+AMKTrDTW7N6vXzmiU4x9O1oFCHvcUKNi4qqjUXsVaNUVw0jwclPa64TwYGX/WLlcc0lTO3xDt8qio0HVpqFLeAMtVqfCuBD4GTzHrrhzTy2VjDspfWU1a5tFRCetLwVf6HW5okMPcou0ETGqstD3J6+jONh5ZfOM1H5BGVsdTRB1d1/7VB1trbcaHsBGXyYTMUxadC0YtAZs001/gVd7sYxhr2DupTTULezaAwg37TJULtCfad54amtc+IvOIWO76BXNcd2dvl2+J+pB4643FQTRvfj2elXuqCKdOOlSXICrjRxBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5932.namprd11.prod.outlook.com (2603:10b6:303:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 15:43:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 15:43:28 +0000
Date: Wed, 8 Nov 2023 09:43:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, kernel test robot <yujie.liu@intel.com>,
	<intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [drm-xe:oak/drm-evictable-lru 2911/3055]
 drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is
 included more than once.
Message-ID: <i5hiabop2gm67f7yl4zvszqvtczoof3v55ikpt6k7i2ejmglut@reausbodh5kn>
References: <202311070416.8nPv4n6G-lkp@intel.com>
 <87a5rqymy8.fsf@intel.com>
 <j7woryfaopndy26jdcsteie5lsacghy74fvw646rxm7eliaey5@4nlicq3xlzfv>
 <87fs1gy34m.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87fs1gy34m.fsf@intel.com>
X-ClientProxiedBy: MW4PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:303:b4::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d68932-0b9e-436a-de85-08dbe071739d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KAmnKQKeJ9QFmj+AXH8WY+4wScGIzzsmD6XvCk0mb3PwUdS3Bap9bmb17PppCgkbRZzJ94kMRSnQCHaTJJr3F4lGIl7kKipJz2nxPoVtNQT6lo2vos4CqT8vL/5si1+//gSyGnCZVxJJsddJpA387Tg0p7xaWLUY4jd+42DiWBtQfQUPLuoy0rzkZeA1Fw/cCsogJSPYkRbcKqVSd/uPuu27VMwH68xSLpg7q9z6X8JlxPs3nRsraZLVjDXUwimAjAIQ5AJI3QFkRcqZhWmnhLnzPu2R4sglcXPQ42mJT6AD5LRxmmpd8QeoVuDxCHxYUp8qS5/w+enqQVTNOK9UMeI7P5JqNM+NTt9EsFVKI1En3n7KST9nuCzfRI6LNcwByWHdZ7nRO+fAeJyaGYvCKNNH4i+S17Gh0lSOCZ0Zwusx1Z6skyNWdDPN+JXAb3LoInPcyo6UKxPz/tOFmqCpnIbkEYJR1h+TkTH+DOwU1Rf4XysXcALOEwnbyAfEHaboFgXWWtSHnTGhjYyt+tDIRd2+VPRPfxIBlXp/HVM3Sc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6139.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(82960400001)(107886003)(33716001)(66476007)(66556008)(26005)(66946007)(6666004)(6506007)(478600001)(9686003)(966005)(6486002)(6512007)(83380400001)(4326008)(41300700001)(5660300002)(86362001)(6862004)(2906002)(38100700002)(316002)(54906003)(6636002)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7N0MB4QT+l89YuR2CL606widUadA3UlYPQgjfhhG2hNs4wheiCxl90VgTfl6?=
 =?us-ascii?Q?kAZrHggowai2ds8ZkGkzmOMuHdfi9tXQ0D6a5kuCT7H43nh+GLnuwF9uYf/Z?=
 =?us-ascii?Q?bNWG6LHCG63YNI3arljcsymAHnSJ1/HnULANjcOmGr/avCZoFgJSVkituxo4?=
 =?us-ascii?Q?EHhNpHamvG914LyT5eDlJV7rYyjDN4PLNNLxoBDq++uu95qs6RDGMl1jArpD?=
 =?us-ascii?Q?ub1x7pAkI/mHcc4CwR3hQKmSIVxV9vyEJLJ4mNhnZZdPPgqjuI/ajCekPoDo?=
 =?us-ascii?Q?31GFO4z+ouohNHkn/990El4CotbUK+A4acdK84uIVy9z77If9Mqq3ubUIc9j?=
 =?us-ascii?Q?VHdA6EWhxnK5sKLtb7vy2Z7tOs80BJGYN9f62M5ZkHdxbsPO/NV4XBYbR5yn?=
 =?us-ascii?Q?vk5zGEVJOpc8lzb2r7neMjNugDWxM78oKBXt3PlV1TV18g6obZ7U8njnoeRV?=
 =?us-ascii?Q?R9fp2c3ljKD6xE+H+mZVCLKOBu/cLupWly6nHztroGXKD2tX31Rmp0L0OXTk?=
 =?us-ascii?Q?3cfdJMb2FCbYsd1txtwWx6dZsaA0w+4aIW6HlHMWlvJYVrP6ePB728N87LY4?=
 =?us-ascii?Q?vxVL2pHQ1/VaUS2eNGTUIUY44jyu1Wnln9dP3tdG+L8VAA9bn92CHe1y4ziN?=
 =?us-ascii?Q?5mAmiHWewwE0/JVlkphV5DR1YMoohd8myCTPI11gtMomhzkfQPQSedvshoBb?=
 =?us-ascii?Q?tk5nAiz/G21iDQv8WwjFEmjagiq3yii8AA5rjWJ6YcL5i9H1q9SayjQZfzdf?=
 =?us-ascii?Q?VF/pIAQTNrPUziG5Jyv7EdrE3VMyaQQ2rpIfzez/J48CO9H6fxzTRfRdWizk?=
 =?us-ascii?Q?uVk/38inhwUXFApXfQMDUyrWsVtNCdq5ySQOh4dyGmKpjOSXo2RqSh9x5prk?=
 =?us-ascii?Q?2eSt5lhD0EwjSCQZhewWXuCz6HX/qBK5l3fJxh5KrmP/BxzrGiUm/hDIe1L3?=
 =?us-ascii?Q?hqMVEqYT5kxcU95vPxpluEKMfPG/movg5eyLtWgO8Kq7hk5ny+5d5wmINRte?=
 =?us-ascii?Q?JNIf2Mj2W2rBFtVi2316B1DhsCjRDJyd143S/1yczd5z4TL9C1mRI+M//4vA?=
 =?us-ascii?Q?V5G3WIrS5LDht3SgAW+PryKwFSVdUEta4nnzo9SRgHODhk3QbibmRKXL1ogG?=
 =?us-ascii?Q?qGt0rMrtvdXXCYN4fUJ1oyFeemLjgc4lHEW6Cf8qiJL2gzkIWkh3EuTd/laB?=
 =?us-ascii?Q?J4cFJE2p4sNB6qbi6iDQ0bjwoQ6LjZilAjHf0VYF/d/FwbK8uUJP4HCRun2i?=
 =?us-ascii?Q?ms4uoFkzCY1W6GB8qL9SZk+uNCH5Ln1Ut9sflFhqFP3GY58kntvRQaOXzXPM?=
 =?us-ascii?Q?OTILPrg8Fl/mh97KIO2Zpn+mnrA9EjdrCoRVnjrmhvBciQgnjTMThnwyj2Ta?=
 =?us-ascii?Q?uYklkrMiXHRzSxlSAP/3TsRNP44s4bf608FoO78KXAauh5qFQu7V/EMyF8cO?=
 =?us-ascii?Q?4FIQ9sqtm3kueF/vHxxU6sog+9b/OhRip1ywZhdAvgHRNpGeBMV0nWUsVvlA?=
 =?us-ascii?Q?c1SPp9P/H4LoyInXPlxWVl/XoNG5ZmQh8Rz8bd8xEEmq9MZW2Rn3Uaj9CwjG?=
 =?us-ascii?Q?q7SxK+6ffW6TRUFjZzDMQjnqNsoVEcrOfY1iJYA6X3EvduyRf/yHoLUyot5o?=
 =?us-ascii?Q?Dg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d68932-0b9e-436a-de85-08dbe071739d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 15:43:28.1366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFMRRCzG/YVFwN/i6vrbFFltVOuLTyYnWoSQK8DDaO2vD3skqYLi4tKfzKU/YXVZf0Ci9Kyd0sRINpkXvWoxNiyZU+rGT/znV/bPhBCg2os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5932
X-OriginatorOrg: intel.com

On Wed, Nov 08, 2023 at 12:02:17PM +0200, Jani Nikula wrote:
>On Tue, 07 Nov 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Tue, Nov 07, 2023 at 10:41:51AM +0200, Jani Nikula wrote:
>>>On Tue, 07 Nov 2023, kernel test robot <yujie.liu@intel.com> wrote:
>>>> tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git oak/drm-evictable-lru
>>>
>>>Why do we have this stale branch? I don't think developers should push
>>>their branches to xe/kernel.git but their own repos instead.
>>
>> agreed. I just blocked branch creation in gitlab so we don't have
>> those accidents anymore.
>
>I was looking for this yesterday. For future reference, which knob is it
>and where in the gitlab UI?

Settings > Repository > Protected branches

	- "drm-xe-next" [default] [protected]
		- Allowed to merge: Maintainers
		- Allowed to push and merge: Developers + Maintainers, Maintainers

	"*" (12 matching branches)
		- Allowed to push and merge: No one 
		- Allowed to merge: No one

I thought about creating a role to allow branch creation, but to keep it
simple, I just blocked it. When/if we need it then we can temporarily
disable the rule, like we do for force pushes when we rebase.

Lucas De Marchi
