Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45C563B9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 02:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715739817; cv=fail; b=EC8AAGFBXQU91O5y7DCHHuXbcShRciY1oX2HDSwM4TCpyLr9K23sycOqP6MCraoHonaWIx5lndn+AssBNUp1G5Q6/8qhAXSWcB/CUibRGrPaIUhgxkolgrvVexHReRxIh3qpfSXAGzinto2HGElcxNjHc8C8bqAaGqiZl0eJEvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715739817; c=relaxed/simple;
	bh=qLKR5kCNePSQkhT8XXgxilhl0UHLlREVM/yLrbeBznQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AdXn3hC8BSt0ooPTZdGaGqlShE1iFSJ7H2rj1oO7+z5Y5tbeuh7OlRJNFzJlxBO33VvHVU+H0oOljIzbrchMjp/Ju5GoX5cNgGkWuvKUKmyIWHOrVnD6imbpU1le758i2vq2GSA5AZF4a37q9+ODmod+VwpB3s1CfAwHVC2LYVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+/M4aEU; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+/M4aEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715739816; x=1747275816;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=qLKR5kCNePSQkhT8XXgxilhl0UHLlREVM/yLrbeBznQ=;
  b=K+/M4aEUA10f8dp4c3xkWNb30oNZnJqUAAqp840h5ZWVaCHr1XPegUc2
   3kdTqPAlFMGtK87UlWa1zreIKn8YRCDR4jq7gdNJXgQT0aMp0s1XUwdbB
   OYh9QugwitGFHCSUf6HJmDaFdvh94goVK2z1V11Pep4aqYJWWcivJYZdy
   sbvM+n4fVXCpYZ/lUxuR576f8a35Dpxu3Pt5M0ZMjJU+48IhgRySBuRMZ
   phcmF+HoUBhg4U3QzvryO/j/p9GMUmhyp4bu5+M0l+NQSYrcd9aJ1mLTp
   zcaBVkIk9RuPCZ6R5SCNDmRl5watOcH7wf3f/IPSNLmqJVRAI6KXh96NA
   A==;
X-CSE-ConnectionGUID: iy50q9vASjqXzqqeAjx+VA==
X-CSE-MsgGUID: t6rNcbpDT86hEkDSVNuyiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="29283774"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="29283774"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 19:23:35 -0700
X-CSE-ConnectionGUID: YcyMpBEcRO+CuCunlDyTtQ==
X-CSE-MsgGUID: AoCfCUluRsyD1nv7puUXdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="54099672"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 May 2024 19:23:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 19:23:34 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 19:23:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 19:23:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUQ41rr2/GV5zkn/5qSfQ8uJLy8LaGQ+IsFWWMa3xp+BXM8FjCKmAqSeHWZdBdw5ySQEjZ2+YE0Jg8nTngyyBoUGQwzTsLcf4UZu3omUOAq3nfmu5Vxwlx9BYtg8enPM1dXqzyVgw3ZtYPd86eZI349dm8U7hXoN/XNK8/ffXBh3AFyGkD6cOxeAT/o5jAy5A+45PUx1lp1yWJLWiywZ2J4zcFSmoqs8b6PlkpFgtKxGL9D0u8RY+hi0r4PYR+Gy3zmSXMRPzypiWMwHNcJx6vpAVLFDVDwO6Zg+1HWg7ZFLZKt/O5lMtot763QGRfCZ5lcLJCw4PPoF4mjsOAukhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNZYpl1BR60n8f65ANODfOh1P0Y6usUjNpjaHFtC46k=;
 b=gP2C7dCb8AUwNjBPVqom4F0i29jeG2tEvKaEsLEABTPnvH2aJlODQkbv8454GSxIqxYtuojIb08GLgrubBCeY+3FjO+DqqQJYSR7c9YZ0NVIFIPwKZ5SV6KdKK/mXw5hADCInAXQCX2jTtVCO27ncH8+8rzHY5z4SfJ3njSQ7CX+kHqZlho8WVD9ItYMB8dV14MESTuPeZTrdUiWvHseJXREkliHnVEfuFfK82EM3F81VzfDxa9MXPZghK1r96+mEp8XCdKK3gjr/LTJLbScaAxBz8Yrsvu1ooylOJKI8YSeaPQx6Q4V1Vb3npsYYcorXJq7A28pgP3yhYhs3xQf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by IA1PR11MB7174.namprd11.prod.outlook.com (2603:10b6:208:41a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 02:23:32 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%5]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 02:23:32 +0000
Date: Wed, 15 May 2024 10:23:30 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Hans de Goede
	<hdegoede@redhat.com>, Zhang Rui <rui.zhang@intel.com>, Ilpo
 =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [linux-next:master 8353/12793]
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.o: warning:
 objtool: map_partition_power_domain_id() falls through to next function
 get_instance()
Message-ID: <ZkQcogwAcpUPo+Mb@yujie-X299>
References: <202405141321.RQmskiTj-lkp@intel.com>
 <2880b55bbe08e3ef7762b47b3531cd29f785eedd.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2880b55bbe08e3ef7762b47b3531cd29f785eedd.camel@linux.intel.com>
X-ClientProxiedBy: SG2P153CA0039.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::8)
 To SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|IA1PR11MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: c31c5113-a255-4fda-3221-08dc7486043b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?5T7A6kVQxah7evDo255vi2m0c+SYOLcoXSH5qntuQ4/UZVn3bwgGzGD+XW?=
 =?iso-8859-1?Q?ZKST2QOyIaUhuoFU0JdZ062KpI+pDNglCyYcgqkH9T84RN5uwFXe+UkAuo?=
 =?iso-8859-1?Q?1lLLe6mRzLxU0kAF/Bk+83ltB3XCsPpW35FYGqy899ggyoQ7thucfP+LVP?=
 =?iso-8859-1?Q?syfsOONfLZJmZ8XrLvYIfaUeF6xyCHXC+Kd2alB8QYWzm45E4BKZwDkfo5?=
 =?iso-8859-1?Q?IWmrfXOKjANJKF5Ocb0wC6MWKYG1UJztQRuM9H0SRYegZPgenIPtirBDNA?=
 =?iso-8859-1?Q?7+QSG6nov8+pMRuuVjkf6YRTuunRyTXYiFywO8vzta0GEKMmIq4RHCZuQs?=
 =?iso-8859-1?Q?0750rF0EmdM8APWAI9yklQGbQd2v3GbEWZ6e7kYhsgd/IIk3ycczIZluxt?=
 =?iso-8859-1?Q?F6a6vGE0JgVlPCzix6xqXkKY1UcvgqC3CfGrylCXRwvobA7zEY46W+ML4K?=
 =?iso-8859-1?Q?3vTaCPeS953Yi/PizmEOhNcqyAs05OAlRO4iVFfyjDW+l9hPz42ih4AQDx?=
 =?iso-8859-1?Q?1c0pq2y/NjxVv6wkPUaJW/IBq8e86GrKZ1CrR+40hrCC/W6gjvekDJds6d?=
 =?iso-8859-1?Q?7cgnM9YxBukJz0/G2jKXYA7EdEezU+UU6H/cLa5T8WiCFzzfO5DY6gO2PV?=
 =?iso-8859-1?Q?aLFomhiWfXHBIPxj/qNMeCBU9yrU/ihT1fejA832VTtK9Rj1IjvACKNXjl?=
 =?iso-8859-1?Q?40eQRYH+mvn3HsNNrW0g4qB7hr8aDfrP8cT7WvTfsL31HNmKBT55fbhqaF?=
 =?iso-8859-1?Q?6SxUnfU8y55iByWdnrK9VVy5yf5oCNQNaKCATzVdEQeTmuvu1HL1oRQdjv?=
 =?iso-8859-1?Q?7h/9cV5J73hKun/esLxe48rlUYzu/6QEM0FeUXFPWlAWUTYQtxnCIxWaT7?=
 =?iso-8859-1?Q?UQpMYDvXy+mzF5hMM2z2EzLLzojAUN1ga+eeUNVqxT8dJOMRwtxWhoZZq6?=
 =?iso-8859-1?Q?0JopkFw/Al6+vz3Usy36QRlkFUlMUlnbjuo0MPtyNs9Z2XUzZmNzgtyRGH?=
 =?iso-8859-1?Q?1dJ+4Q1XQQuABKTaumksYldwqZDwqAvqY4oq2xE3cZv+ISFRsx9mmkvaV7?=
 =?iso-8859-1?Q?3ps7OSZQ7BsjWo9lypTmhu0vgvFucxIgFJ2RpSYC2iJuJtWZbbib2v/fC7?=
 =?iso-8859-1?Q?UF68u1NUcd8hOhvbdPp4BnNYEp+RfSy5qjBmQ56joe8kUvGQrzj2Cn07UK?=
 =?iso-8859-1?Q?3YfFdJKG0VLBdgH60EWVMmQHJbH+RL/IfdUWJdcnbRUMtt/0pdf1gWtSJO?=
 =?iso-8859-1?Q?S8TYtrw4kJ07JKtBJXgyA0kyEZIfFLLSMByZxPxEg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?34WJquMggHcnKk6/7xLJn6wRTFEroXWNcLodUatN11+INC+XDecDvMNMQ4?=
 =?iso-8859-1?Q?M0QrqkM+g6gvGsAc7CG2mS9+NfkpOicG5+a1DS5vA0h4+zMiG9/obwvoYn?=
 =?iso-8859-1?Q?L3Kwx6DJ9hYVxPO0/XkGPG+ktxKjTZM7MOp33a+w/CB+2G7OZ7YMAftXsI?=
 =?iso-8859-1?Q?cn6Q+vHGAgVe2VixOCqpyQ/TLFNR5ItWO0qeHYUJVNuH5Do7KqiO8QYmYT?=
 =?iso-8859-1?Q?eH4cMemCERt7zoGdAi63RJSp9qqT2ciM2MXS8N7bFmZnoLS0P5saPkHMF0?=
 =?iso-8859-1?Q?Wmy/9OxEXgFXpkViCwwqkiAHPs3nsamNouDHKdQbm4aht5EQQQOeG/AK0k?=
 =?iso-8859-1?Q?Tq7ww92Vfn8PAsOFAiarf4Pc2aHssNSybodxFN++451b38QZWbosIIwi1C?=
 =?iso-8859-1?Q?8+0AsGsNfqNNyZY5PmqmH4RNnws3sP1P+pC5sPRCijk5r8G5vxjxpXuEr1?=
 =?iso-8859-1?Q?0SvYkAgrKoFISVDccimWUW3iTitFy2DbZtmQ/pZSBSX7Tk+oTW8XM4gq1c?=
 =?iso-8859-1?Q?2pPNFPfFBdSnXjCHYGKvbhc6dttr313fsB9l6zPWmMv4cBYudyn/3ko9na?=
 =?iso-8859-1?Q?/RI/BnUyDr43tLvNVw3G9lDGfBvKhxln03PnPTA01ODaNiOmAcamDCs/Gk?=
 =?iso-8859-1?Q?vmLsKAl9Xn54y92lXC6j+Yb+WycXgl/umsDVyIfZZIxUIQT49G0SNi2tbQ?=
 =?iso-8859-1?Q?FbcT0TikWnbDbKgur0JmO3fbvPwV07NcayRVtRrPXwVDwFxOIjZGB3TitG?=
 =?iso-8859-1?Q?9ejxXzToSt+opNa/rYXzEgtIc/gejFqIHAJMPbKqdydl9Z/crlDz72KeJz?=
 =?iso-8859-1?Q?86C8MFUn/p+iehS8TsbRAaOcd0l8BHqJwV5H8XWd+KRInHeRYDwv7/wgRP?=
 =?iso-8859-1?Q?4iZPpBj/VydQ52VBjwSfw3WCPyqelkfi0c1zmOL7zZMN57bD52rHrHuQ73?=
 =?iso-8859-1?Q?n/SsBIhcpBfmaxKXFO/5YRiLnpOJ+ZpMQdwZig9wO4H2HaYZ2qEXcwKw10?=
 =?iso-8859-1?Q?R8biT5zxmlhmSQ4g5IGLCCIT56pJzv5awdaglOlLHsMzgZ/8PLzo3mhVHo?=
 =?iso-8859-1?Q?pmYRCWl77crD9bdKpQCJ4iRD1CEV9Eq7+bb4W4PSY5iMdxuXzqxne/f0Et?=
 =?iso-8859-1?Q?1EYiCrum7ES0V+M10uZJjRUG8Ajec4LwaJ5D8IMbX5taLd70ZAhRLO+NeB?=
 =?iso-8859-1?Q?F8hiAs2RNXUWobmoQEP3WUbxbJjcMKcczVcGR6nCxQYtbAt1GRPMrepFxR?=
 =?iso-8859-1?Q?EZvCk3+mFrs138NlHlmjFtKWxXoD418z1FkBhXzGITdcE7xZbY5olMn7Ke?=
 =?iso-8859-1?Q?IpSS+WvGs4Ud2F8e/1qJqWM9gnY+t2IbVLE7iPdwZoOjwSDyC+EVZMefO5?=
 =?iso-8859-1?Q?V53AYrubRAJ0R6I1WynLN57t6BLxTDLTA94mISE9NRXp7maqLWVSGAuKbL?=
 =?iso-8859-1?Q?wLTHDdyFld5q+lasCKFk4k3lpGfH6om5nVv8OGaBhWblMEdC3UoMHkCcLA?=
 =?iso-8859-1?Q?+bbctda6PSbtKoKKEj63triK7qAmhBkIq6TWRlWIZncf5EEGoRxbkp/SvF?=
 =?iso-8859-1?Q?tlrC+y/rna3TKAl1PuLCVW6nIffeylNq0ZDyf0OO0khBHNzJjzb578K+hx?=
 =?iso-8859-1?Q?IeYKM/yDsbWFvPa9nYmXYt0Wvgm1SQxiPf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c31c5113-a255-4fda-3221-08dc7486043b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 02:23:32.6138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B55ScrQ9y57xKih+UOrbX/HbLxNLgmcyISLIkIUQ1dCDVngXGMFrKj5oPc7RxJQTrQ2PRAqfkgum10tAbr4CIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7174
X-OriginatorOrg: intel.com

On Tue, May 14, 2024 at 11:00:50AM -0700, srinivas pandruvada wrote:
> On Tue, 2024-05-14 at 14:05 +0800, kernel test robot wrote:
> > tree:  
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git m
> > aster
> > head:   6ba6c795dc73c22ce2c86006f17c4aa802db2a60
> > commit: 9d1d36268f3d8276aefd1fad4e0a415dc8c36edd [8353/12793]
> > platform/x86: ISST: Support partitioned systems
> > config: x86_64-randconfig-101-20240514
> > (https://download.01.org/0day-ci/archive/20240514/202405141321.RQmski
> > Tj-lkp@intel.com/config)
> > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

[...]

> > reproduce (this is a W=1 build):
> > (https://download.01.org/0day-ci/archive/20240514/202405141321.RQmski
> > Tj-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new
> > version of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes:
> > > https://lore.kernel.org/oe-kbuild-all/202405141321.RQmskiTj-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > > > drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.o:
> > > > warning: objtool: map_partition_power_domain_id() falls through
> > > > to next function get_instance()
> > 
> 
> Not able to reproduce on two gcc versions on Fedora and Ubuntu
> distribution.
> gcc --version
> gcc (GCC) 13.2.1 20240316 (Red Hat 13.2.1-7)
> 
> gcc --version
> gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0

We tried various versions of gcc on Ubuntu distribution and found
that only "gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0" can reproduce it, while
other newer versions cannot, so this may be a gcc-7 bug. Please ignore
it and we will configure the bot to skip this particular "function falls
through" warning for gcc-7.

Thanks,
Yujie

> 
> 
> The documentation for this error:
> https://elixir.bootlin.com/linux/latest/source/tools/objtool/Documentation/objtool.txt
> 
> "
> 8. file.o: warning: objtool: funcA() falls through to next function
> funcB()
> 
>  This means that funcA() doesn't end with a return instruction or an
>   unconditional jump, and that objtool has determined that the function
>    can fall through into the next function.
> 
> "
> 
> This function ends with " return -EINVAL;"
> 
> Also the three reasons in the documentation is also not met.
> 
> 
> 
> make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> make[1]: Entering directory '/home/spandruv/development/linux-
> next/build_dir'
>   GEN     Makefile
>   CALL    ../scripts/checksyscalls.sh
>   DESCEND objtool
>   INSTALL libsubcmd_headers
>   DESCEND bpf/resolve_btfids
>   INSTALL libsubcmd_headers
>   CHK     kernel/kheaders_data.tar.xz
>   CC [M]  drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.o
>   MODPOST Module.symvers
> ...
> 
>   TEST    posttest
> arch/x86/tools/insn_decoder_test: success: Decoded and checked 8715543
> instructions
>   TEST    posttest
> arch/x86/tools/insn_sanity: Success: decoded and checked 1000000 random
> instructions with 0 errors (seed:0x5e80fa20)
> Kernel: arch/x86/boot/bzImage is ready  (#1)
>   LD [M]  drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.ko
>   BTF [M] drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.ko
> ..
> make[1]: Leaving directory '/home/spandruv/development/linux-
> next/build_dir'
> 
> 
> Thanks,
> Srinivas
> 
> 
