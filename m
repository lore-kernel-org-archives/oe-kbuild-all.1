Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47F43438A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769115; cv=fail; b=Fo396UlugfcmZq8jMCcqXANq7WqguQWTHW6H2YK6uQJQsZxV0Bt0EnXNxfYVWoPCSzAqbPMr4AnG0KJYszo9/8dP8v5swhOD4OQDd1gITomu8rofXxCsbyJ27mxW0k51ZmYwaEK4pztsfeV5//WXfWE2H32VaKA6OjmVBYYvOjM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769115; c=relaxed/simple;
	bh=R6sW3s/tvSvh7zGB49FU0XcvYHPObuAv/ccbOckd8pI=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dC1yLjQeVtOH+Gtu+NQEbQPw3BomfQQmYxtDnNjOmEkSqOlsswZqgOzwkojN8LQ70zLdsGUJKSrgmqQDfPGtjaanA8bejaO2ORJndQX7ceJFqyEsk7yYQtlhX1hCWXgQYXZeUL8zguVjn7jwK3r9HzTbtMYeXLtTlSrb1wuckpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEwO+UfK; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEwO+UfK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790769113; x=1822305113;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=R6sW3s/tvSvh7zGB49FU0XcvYHPObuAv/ccbOckd8pI=;
  b=hEwO+UfKGlvMAWS4a+hjSbNQRdueAq36klj8ngtTaVsDVqzTPoMypvhm
   FI390+UPMDep9dQ2+UEqOWMATrPNDnIbe79LxTWAFHcKUs4v9rrugAYFn
   VNSYkYOzsRec1TVMTm6vUZz5vHz08pzFOBatDmfkGFCvPfA5h2C9HxhAG
   BJP0zCbAcX5XDnXs6M67Y1w2ut8DLJaDLT2hRPyW/oqOMNzKcAxvInp1x
   gxaKlgZ1XXm75VJnP9oIeBZSzcsqz95K09csdG2P+WTBMSNjF/vg0CwAv
   37F3iiFlyKIl8hmY5Z1AKlTnXPMYg48JQ2oYe9wNvTidFMFstlegjC9by
   A==;
X-CSE-ConnectionGUID: /5XutIePReSvgRIL6NXleQ==
X-CSE-MsgGUID: B286LIjTRE6mgWoXt7DWSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90634327"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90634327"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 04:51:53 -0700
X-CSE-ConnectionGUID: yZvawzQORUqMuwrQcMHXCw==
X-CSE-MsgGUID: xwKDtk7xS0SYBrFVLZFoUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279010114"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 04:51:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 04:51:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 04:51:52 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 04:51:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L150p3LTOJSn5z+npibmgsav0O4L0hBHGqHf/Qw053AuKuLahoE5EKBXhDW31JFaWt0T7Fqcfu/yjq7EzZdvsLqO9goVVq6b01gNpp4VzCakZDNwwZa13K729yppQ5O3MpLxL7Aw7cEhA9Pxkzpt+WXjK2uTXnGlNJfMRwVtkqCAtklgCXJZWfhK8+g7BZBEFbj590ARAO35cKvIoE3Iq79tQQWA37z9XNEanYa2OQR1nMYglfQN5lD1u/AahE/jIaorMu3bI8TQQeHB7d2T9ACMh1AZfR+qpu0cX8Af8QnHIyWCJOHNhb8ne2jdx16mCtNQHf8pra2HHX0nLUOFoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0ffh5gl46vNWNFWnTvIQMQHdQR/NEgz2DZ8w/WAdow=;
 b=nILRt7/byoBALyO2vXAP4Xnwd+GaN1pdlnAYYbS9sig16bztreMvt5bF3+G7CiDFhGYqyDodDSnrQiLQMcXi3bTldRcyOy8WkSjOwAqV4NHGQJORSAtmG5ACWDmYvIK26ApZKWwyLzcO/I0/EZVxNe86g8I27kqVwgkvkcFCAIpfC821bTt9n1D2+DWvX9FI0e8w385E7LxbzQLLA0otfrd49Dc3i48kxHt2yURl83U+6a92XMvrub11TGIKIGf1RvbkCMBrUPprge9f3PSjBW4DASUu6tm4BYCvLEtNHgrzJ9qxMJmf0vmMVRymiPEx1gcyvZ+WdCbx2hFLQnD3xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by DS0PR11MB6518.namprd11.prod.outlook.com (2603:10b6:8:d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 11:51:49 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 11:51:49 +0000
Date: Wed, 30 Sep 2026 19:51:40 +0800
From: Philip Li <philip.li@intel.com>
To: Linus Walleij <linusw@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Lee
 Jones" <lee@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Subject: Re: [linux-next:master 8900/11456]
 arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: prcmu@80157000
 (stericsson,db8500-prcmu): ab8500:codec: '#sound-dai-cells' is a required
 property
Message-ID: <arz3zL71l1hCBciW@rli9-mobl>
References: <202609301056.m1VNxu3Z-lkp@intel.com>
 <CAD++jLnqJ62g1=jqGPOJPZNmRukzArgNNMJdh4wsAeRe--U+XQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnqJ62g1=jqGPOJPZNmRukzArgNNMJdh4wsAeRe--U+XQ@mail.gmail.com>
X-ClientProxiedBy: TP0P295CA0003.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:2::9)
 To DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|DS0PR11MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: 08aa66fe-a0ce-4328-b80c-08df1ee935aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003|220923002;
X-Microsoft-Antispam-Message-Info: S5N+EXu3guc8ljz3bjs93Tmd77Pq2PHL0HKzLObltvIgp6T5zld72eVMGp9czJHGZWgMohvsQCsR0bdoSoCHbrhUTqsvbEj5A52Y6PUX/bTurGb0sL9SbYrdwLyeXXtQqjwR8FO6OsaIAK+SWhHXr4PgQe1sRUnvXakuBACzyESoRxpaaxSgqXYL+T0rWqjDMztt4qavwAJBb8qjHGGZOkKztFwoBnFlJwGMciH7waGpLzfMILNfzkyNHwN4Eyf0P36iR2nq5UdQrZ5MuwZB9KVkLMsI3mzfedWgaJn0Iz7k8BpKvA9Ca/RTOOI0CeHvhcgLtRErL1LUKThs1YTax5UVdF0QI/cLvv8Fo91cE7LJvDOiscq6qgpYsm9crTI59viLvM9avVU/FVCwjQw5p0A9JZrfH34u1KjJt8z8Src+XKCjB/ylI3wECbK/VXaaC9bh4fUi8e1pwewfy7GrT78hDHsiBMR3icQMZK1cpiD62hK4SzS7SdVxLjiPA2j+E1lVoYIIaK6xW9ZeK57LK5Rhx+yL5AvN+GgySFA0gn6QvPK+vkfgb8vZrP9vO+/581VHqp8Ht3FLKK6NrCnsPqLiQf/caRJkPt5VLUMW8ThPzaXCxcijPcOP4GyTqPFRZXTXFOfaEUWAP6QjW4BXhIKWIUiAteNNTLf7m9GV+E5z/whUm5X9Tes0R/dxyizXGxuK/U1gAekw6zU8jAvcyQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWlobHN6QWROdmNvd1BjRzB3MzlQSm1qckJDaElWU1RpTkNGWkEwaDl3Y1Uv?=
 =?utf-8?B?eGFnd3c4U1hMOVk3N09kdm5BajBWZ0d1eURFYm0yRUdKQVBwaFB6M1VvbmVN?=
 =?utf-8?B?Rk53QnVRRmEvK3EwZWpmRlRmTE8xZUxsYW9ES3QvZGhNS0RvOGJJTWdVSTNS?=
 =?utf-8?B?OG9PT0VmVkNiWnBLd0dZZkJmWXkzZHFNR2psQlloSS8zYkYvWDI2RjR0bWoy?=
 =?utf-8?B?VkFxMWQ0c3Fsd3B4Y2EyYUZMVUZ0ZkNTVm5vQUZzYXM5cXgrSHU2NTBvVWxF?=
 =?utf-8?B?OWVSbUlBTUdEczdDMkRmODM3cnMyaXNzWnFtRktGbXJVVzZaQmpYelF3Si9s?=
 =?utf-8?B?NGkwb0tEZTFKM1dNMStrbWNMblNseTVzVzA3SkNVREZRSlhtWFFmdkVZNDFR?=
 =?utf-8?B?TUo4Y0lpckRTNmRQMk5hMXVXME5vV3NISXhheCs4Q2hDVlR6OWFuS1pwSVg4?=
 =?utf-8?B?VXZoTkJoQmoxN3BnN2IyYUpZU2loaEdrUGFZRW5XU1VRa3pjeVZlRmYyYkpS?=
 =?utf-8?B?L2ZxRUJtRXBOTVpWM0gwM1pYb3RGM0E3NzRRcEV2RXVXZmtTUXVHczlJY2p0?=
 =?utf-8?B?N092NHl2Z1V3TDNERU1LVjZrTWg4WHA5cWQ1ZWVtREVMbHhibldRS2Z4cFBS?=
 =?utf-8?B?S3l6MVNyTHIrU2RpNTNpYkUrOVhSTmovbzZPMjBYbUsrRlNobTVFRUhUcE1y?=
 =?utf-8?B?M2hIV1BKaUJwVXl1V2dSWDQ4dzNTUXNMRXF3UHJFcVBha0VvV2tMT29QM1hR?=
 =?utf-8?B?RldacDhwZzZIUUFyY2UwbUxMN1dvcDJ0ejg2WmNkcS85Y3ZPRFV2dGQveUdj?=
 =?utf-8?B?bVFWTUtKeVlWeDZPZnE4YWxxUXpxN0loTXJWYlRVaE5IMHNodUltb1JNSXM0?=
 =?utf-8?B?M3BEN1JzUmRtMHZyNWZhbFp3aEY5UGJYNTNONldQTkUzbGVNUnJibmJZWnJt?=
 =?utf-8?B?MmpMY0tuaXRrRlk2dXJORkgvelFPcXA3alVLRy9Ed1R4cHVjdkc4dW11d2ds?=
 =?utf-8?B?ZW1pVlA4MzdyQUtDR01VS2xLWjB6cHpyZ016bm5xaGhvaEpVeFNCTDllUVRR?=
 =?utf-8?B?ZVhJelNyNFlZSWN2SzJrSkhzUVhhdzEzMTN2UEFMaGVnU3QyQmJqRytPTzFX?=
 =?utf-8?B?RTZRcU5pUnhaa0QwVmtLTE0vT0lPL0hxNThJNmVWQ1J6cC9pbTVOV1QyYTZo?=
 =?utf-8?B?YlVPVGZwR2JXUHBXWSs5ejNRM1d2dEtseHViNDdjaExzakhlbXljQkNDUWcr?=
 =?utf-8?B?RXVFM1dYdnM0T3d3MlVrZ0VvdThNYnNnNThMTEZmdytuckZ2THpWNy9sOGwr?=
 =?utf-8?B?VXlMOVVkZklGVTlaeGI2cWg0YmQ1emtmTTBqL05VRWd0RE43Z2pvR2REWUh6?=
 =?utf-8?B?UzZ3NEc1ZmdTVU1rdnBmbGsrWVdPQlNPU2hrbk0yUHZYVElZUFZHUEp3K2FJ?=
 =?utf-8?B?SzhGTWYxSkc0bWdhenp0cklZbVBqb1hFcm8vYTNiNjdrUjRWbExZajM0YVAv?=
 =?utf-8?B?dUk2UEx5TDJ4UlVNdmpFcWttK2cweTJGUE8vV0RUOEtWTFZBQzlMYUM0T0cv?=
 =?utf-8?B?eFJjaHRKZFc1d3hmREF0c1VPSklWQXpGMWgzckIyUi9JdnNXYXkzY2JRd0Y3?=
 =?utf-8?B?QnlCQzVQRXhib2ZnU08vdUVsdGJ3YWxhS0VnL3VJL1lvOWRvVHZQSE5yNWcr?=
 =?utf-8?B?ci9LUE1wSTh4WWVGclBva3B4LzJHTmpFT29lYndEblI3RzE1M0RXYXdYc242?=
 =?utf-8?B?c1VibGF3TTY3a3ZGQWl1Q3RuOXlybGNPNkV3NVFZN3RyMzg0M2ZXclJRZC9U?=
 =?utf-8?B?Y3NVOEF2VW5OdHRxU0w1b0hpeVpNMVVoblJJbGMrTEF4NU84bytGUnBacTZz?=
 =?utf-8?B?citlc014YWUrdWtuNDVFMjk4WGdBWm9Kc2pwQ2hYWE14eVhHTkpuekNqRFFv?=
 =?utf-8?B?aDBGNU1LTzd5dzF1bnozK3JrcjBIK1pLSG1KbVN5UkJoTkhxWnNybUJxTVQv?=
 =?utf-8?B?cURxYzVsUUV3dDZueFJscW5YM3QzcDUrcjdCYStyVkVHYlMvOW1jZmxiSDly?=
 =?utf-8?B?ZVIvajVNMEx6K0NyQXEzSDVBL1krMGtXZDRsS1BYeUl1ZGVqRGlManlxNmox?=
 =?utf-8?B?dkNVRkVUL2orRitkendkWjc4MEZXUy9nL2h1MWlPMDZlbnRzQTczMGFGODZi?=
 =?utf-8?B?anVkZjFnUnFmaklFenU3aHJvblQ5bGdaY2x5VHBHWkhQQS9QWDRPN1VScjUz?=
 =?utf-8?B?aWpMM3ZTd1l4KzA3bE5vQWJDUzNmajczK1hnc2JhZll6TUtXajNETlBTb2tL?=
 =?utf-8?B?WW9JVjFUM2dFNUhPNjFodlorQ0ZiTmtLU25HeStuNVF6VDRMeXd1dz09?=
X-Exchange-RoutingPolicyChecked: sJwPv2AwTTbnUORYjHoa/0twC3oMA5FYQ+55VVAEst7FS/1CQ//MkkmHu0J56q1cYsToIHAU0rK34zakN/PekJ/i5TwhMVbsKC+90FNfPkQ293nFVrEOZqouKtCIZ9m7REjH4LT2OjY9D7YEK+adPtbLTQ/foTlKWhOfS1BVghll/uSjdHOXK220PFXekkivDrubQ65NApcTolZwjmGWG3rYzTN1RrdOraS0Fh6YLFhbncou8mb4IdoQxYpsnYG+Yvrt0IMKiuWoir/4J2fOSWpK9TJOSzlsaLnW4nMycspZVjpgCTUT+pU7Xw27B9/VTc/tiq0km0hXFeS3WcmcdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 08aa66fe-a0ce-4328-b80c-08df1ee935aa
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 11:51:48.9535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dz68U7B8msDXx/FKAZTOMkDMh2E2Agm0XNDPl0hb0SdZQD4hMuVrqI0cSqC87sNYI7QvGYbLUuJwDRsiiEqhCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6518
X-OriginatorOrg: intel.com

On Wed, Sep 30, 2026 at 11:48:21AM +0200, Linus Walleij wrote:
> On Wed, Sep 30, 2026 at 10:31 AM kernel test robot <lkp@intel.com> wrote:
> 
> > dtcheck warnings: (new ones prefixed by >>)
> 
> I'm not happy about how this bot keeps hammering despite I say this will be
> merged in an orthogonal tree and just isn't applied to linux.next there yet.

Sorry for the noise, I will configure the bot to ignore the pattern like
"'#sound-dai-cells' is a required property" on linux-next to avoid further
reports.

> 
> Should I go and just merge my own pull request into the SoC tree just
> to shut this up...
> 
> Linus Walleij
> 
