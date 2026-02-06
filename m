Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD75323B61E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 02:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770344994; cv=fail; b=cV/QQVoFCitTzzYRcgs8Jj1qupvJ/J/UGa5N0OEdF1E+AaIBpU7UYIryIMyCfGpF/RLL4Hiq2l6V3eA4mp21DXIXgsgvMDC1pjWN68mrguws0yrM2LusQsXhTFBOJukHi7xLfKXcOAZZn/lvjo6grZwnsxWX9bKArV8nDfxY8Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770344994; c=relaxed/simple;
	bh=5OWIoa9iVhhPaefnJ8KQQxX21DdaFz67jdWFM6i8xO4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X2cy6OiH6gFu3o2g+TcK0oETyZcm7368S06m4K78pGo4CSQ0WQP32iCQmNjrObf9r8fdcx9OV1PfFoyeYEN+mOaFaRJVWzHPyQHKT9esJnucggZmKsejZZcdVeqDE3IuEQ5OTiwK78xZ+pepu0qmy6qaXBvhvVK1Co5bOquPOfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eOQAVcbq; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOQAVcbq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770344994; x=1801880994;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=5OWIoa9iVhhPaefnJ8KQQxX21DdaFz67jdWFM6i8xO4=;
  b=eOQAVcbqHntHxO3ZKf6d5em9+xIV1SbFkWIG0YYY7kLGLi47n3aC0WH5
   DTUY8ixEgBWtS/D5qdevIMCCv9JxqJzFHHrvwSWH/I9tvhOUDY+rK/KgW
   db2kGNnL2Orb7vLXoJ7nSnHAQ5RmiFNOkox0HinffMkX5MX8bXQlfzjAr
   bvQMOjH8B7yJOg5/vIVrTLfs88GakgKJG8et9yOv+mdzQVSHt7hcqLyc7
   FRwr3hpdYbtffPihMu2h2TzSLm1es1YDax1GUqJWD2ncis3n0q/Wju5j5
   Pqj5nUms1F2s900FLNlPFdXGfYbPj3C0oBDiB5RDXlgT0N34ad0eVnSrh
   w==;
X-CSE-ConnectionGUID: xOeHg5F9R0C5NblxOzB0Jw==
X-CSE-MsgGUID: Vz++9M9GQTmBg9pDSG+1EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="71280282"
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="71280282"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 18:29:53 -0800
X-CSE-ConnectionGUID: pvx6dEETQAK9qUWfVThnOA==
X-CSE-MsgGUID: tcpkiF5JQtqjU88YIEpPMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,275,1763452800"; 
   d="scan'208";a="215705330"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 18:29:53 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 18:29:53 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 5 Feb 2026 18:29:53 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 5 Feb 2026 18:29:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDmsTLRS26wogDfoDlH5ETl5iMTn4pJjr48qX+LXHVsB+Fl3Vhd2hMcJmbbP74fc9A7RiOFy1g5yV0To64UufCCBDcjNStdsvbEdhSo51IPiZ8O/oF2cPgG5f1wxrSlGNorYYiKIgzdmD8qnOnzKMW/5O5iIU8SWjhDoY/El62blf2Qpj+Xz+ibdE9G7bTtIJVcSR9eSGUbg0xecJicmIbnLas9SuRbhsmrpDBEAAo7tJrG4FfGo6CMXjWfOcJ4LhyUVJELMB9KDbbT6db3Ntu9J5QTNzyNfi6E3jZrGdUzPZc4d0GEg5o2E1b86Q4zWDk7bZFiJ9rTblw2QKcjuhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlSHhYe9AGXPo7YFqVegsRNJ+LWgigIK8KwN6lvGeN0=;
 b=HA8QWoGH+iziQs7zMVERbppLZ9xXelhxTGVcKFy72vhVuy3QDHXzQreMMIU5+bPfKq/8YLtDwABGnOdQpuuQGs8kcRydxydbSBWT9Qz5XUsQvmu5X3RSdtq6z9K5trQhMn7YPspE+0XGMbyP52w2hL1mBYuBJ2nP4jej6ipD+m6CXV70ngWNcswry8V2rekvwLQ1fjEjNlj5leWWuTMZJANjf7JbKqJ5SJ2uwpLopVEmbIYCBC7aUn5ifS9mHUsHqpPV0OsLmIz7Mkfn3dVEh0v2L1YQ+zhf2DKXxjSAUmGC5pMroX/Vsb01K1u2oXCSGjJTvO8SDJpS6lj1zh69sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SJ1PR11MB6274.namprd11.prod.outlook.com (2603:10b6:a03:457::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 02:29:45 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::e4de:b1d:5557:7257%5]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 02:29:45 +0000
Date: Fri, 6 Feb 2026 10:29:36 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: kernel test robot <lkp@intel.com>, Jonathan Corbet <corbet@lwn.net>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <oliver.sang@intel.com>
Subject: Re: htmldocs: Documentation/driver-api/tty/tty_port.rst:65: WARNING:
 Document or section may not begin with a transition. [docutils]
Message-ID: <aYVSEOnbqsdc3Rha@xsang-OptiPlex-9020>
References: <202602022007.fALe9bGB-lkp@intel.com>
 <0d0b90c1-db32-4eab-98c2-9bb46cea7a8d@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0d0b90c1-db32-4eab-98c2-9bb46cea7a8d@infradead.org>
X-ClientProxiedBy: KUZPR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:d10:32::15) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SJ1PR11MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: b92673be-e4b8-4dce-a996-08de652796a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f9eYg5gEABBTRWyjCVregEO99+LvPYP/KarRZfnwNyt4UtOj6ScEv1M3LWIO?=
 =?us-ascii?Q?2X6R8STzfZF0+W9eSKOvn/fU0j0+S0J5d3HuWBKJ0yKPtKORO547hh3JbNH+?=
 =?us-ascii?Q?d3KYsge1lr5q2/ErqtCzVA8SkRuGdGmQpyXmx/9reZCiDCHs6x1FpbH+8r4y?=
 =?us-ascii?Q?4JR2D3bWuoY2zbKKf5rweHtDHPZQ4OiV6HXxXu+QF4eNn2uBza1g2H/ZMqKj?=
 =?us-ascii?Q?CNwCBwcDOkHKl5+hsuzXU883waec3VpIN6kVoCkrDx/Ayp+pyPywauTeIBhw?=
 =?us-ascii?Q?tlNJl40w+pEvd6rkjpcAmBWt9JJSS6172y+WW/9zYdBdKMIZ+jxi93DPQkBf?=
 =?us-ascii?Q?mI2NySmie9jWMNIFXDnPWjN7Zi2LTe97ZFJXSjMA5qWihi33IRimz6x1aeUD?=
 =?us-ascii?Q?5ZB800U6WQcmfwCHfDsRxNRgYKOEW/f26NcQDTP9yRlJdDEPawrORSyAwgJ4?=
 =?us-ascii?Q?Qg/PRtMUMkt/9LAAppIIQuW2vJBzGYxMBYHGBp9Y4MZBdmfpQ/DjGiBduKXQ?=
 =?us-ascii?Q?jBRlYXt9akzCM93ne36vVJVkHZ1MySX8V+pRZl+jZevPUfYhX6wXqM+AHsCY?=
 =?us-ascii?Q?jMTKc9bkdbawPf2rjPG5Oj0OkZwlybQ/9pHRSJ9VP29ZSKs/Zh5rHRkg2kgj?=
 =?us-ascii?Q?n6Pw0uF3NhUnfropcao5bq9E0DyfNQjFJiX+Ajkd6+M+6HTl4S9GdTC3/mW8?=
 =?us-ascii?Q?i3r9Al39PTNxTbe3jCcOp466WsGj54Xb2eyi6EQ86qFy6RygZiDz5V9dEJhN?=
 =?us-ascii?Q?hSLDxcLs4XV+BQi5IEs9LbXJnJCko/9Fkbw5UQnxtzPjegL0MEfPhG5C7Oe/?=
 =?us-ascii?Q?4bUjLvxTRl1mTs/l2Wo9alzxSZD86U5Aq2nAufXpoaRrpLC2vpuv17B7uN/e?=
 =?us-ascii?Q?qYXVcrXKjKguUgGa6RCKQ4MicW8gQ6KIq5LYjFl4kRv5exvUL81BIGcxhmVP?=
 =?us-ascii?Q?9rlWhXFHll3nurrxSVj56zVL3B6wqW04F2h26a3wY4GSIzFZvKSbQlU0LzjY?=
 =?us-ascii?Q?unIj0xdCgw6XISqxpg8w1aOVHV3uGYa5yBe1BIY+b+cQl5tAqpJuVbDkGeIe?=
 =?us-ascii?Q?ONxhSR2shboXVoAzM+f58neP+DjJtRc9Zoq/W/dfTBVmumxCOl9AeOi3bWhg?=
 =?us-ascii?Q?65gpC/rfa90ZZD6uAKULYljU0Op5qnm0C9rOO+EsTevjZgyth1mjdKM+HMpP?=
 =?us-ascii?Q?ezhxsb+X42XOWwEW8+qnst++GxYWs5iL+h7oCNeugO10cU+cQOx3W2Q1aLZn?=
 =?us-ascii?Q?Y0BiD7qYzFKRfRPG1qXEzXcnu8T2htaDCQyUQG3IKFjl1IBq4iaNH6+yFR3N?=
 =?us-ascii?Q?6W8ZfIqae+uWOZcXXHOOeJ3Mo5geJZ4N09HtSnFSiDXVhC7noiK88fDU1WbI?=
 =?us-ascii?Q?x4Tveva2ECMATpujMZMvIFY6+w96x0B2UWX3PWWuV7p/TWv62SddvVJXvPw1?=
 =?us-ascii?Q?h4ZImpoM4YzUDof1ECzm1QEdkcGpuWMKWTjvzZQBl5UFh2jscd4ig/rt6khp?=
 =?us-ascii?Q?fQ9OkO46mcEh0NrXTe5iwNjR9wyOs6f8rdwsDVm7jLUoKg+Z+68r+sgyovhh?=
 =?us-ascii?Q?13/QzCc8mUjJLjjSGimPlGAeHQO4W0mgslmhcA5G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W1g/Fz/oYjDLrJz77hBYLoJOBcTJBWT+3IZtnzxs0knzGs228mlFLctpIELW?=
 =?us-ascii?Q?tKr/YmbAi61VHkL9VxJYwTC8RPfsvkIAKZwvGwAZ9Dc6pLnwg3fdAmg7SPH2?=
 =?us-ascii?Q?7366NWKZ+9+2Gt85StpYTonOYsbN+02ip+F2mcw7oA5qh8Jx0vnZOQIGh5vz?=
 =?us-ascii?Q?eAn0ZjDWRdk8fRJJKhSceMa6ANdyreLBp53fB+2yMOp4MNJz2o9Yhr6Tpqef?=
 =?us-ascii?Q?05kqJ+yscciV9K+hfY1c+BKtmU6H/OscAf30mVkvWPBqga3GrmVRVvdji5lX?=
 =?us-ascii?Q?kHoKj6cBTMUUmDFQGrfXRx1NUyn0lw7u+paYMOIdQqNcNx5NzwgmAXkyOkcX?=
 =?us-ascii?Q?G8RWncfdQ8dlGsEbePKpdKz8rSCXDSrpNIag9TVFPg+bg+VW2LpkztxUwupX?=
 =?us-ascii?Q?3pQN3cPYQG7bXF+N8youzDLS4CsX6jFVTegPs+kAPr5CkNWQYfNnAtYT1tOg?=
 =?us-ascii?Q?0GKGHOHbJX+fpaIp5pUFQvy5UEJyNncYvMPYfGl2qn7SCjj2pf2LzAbmvWt/?=
 =?us-ascii?Q?fLsW/wRlVESXp3KmtnslkhMBiycMZmPFgLubyAhN+a4ZoaGq4i5nMCQCc2C4?=
 =?us-ascii?Q?zr4dzqWBQ1gC9/y9+Mw03iMmbcsQ63/BW6nGLKKtkA8SR40W9LjHOUFZ7anX?=
 =?us-ascii?Q?D00EIveGFkdC5DpPvlEv1/qSfvnB3k3Ct19drnsB3oswqW5TWw6Asm7uo/DG?=
 =?us-ascii?Q?lAGRyVmc071F7LMufdnU6j2jbmFwiSP2l5RjCxAVLifW1Ve+BeF3riP5LiA6?=
 =?us-ascii?Q?TQVEf+KhgxibsAwY4MLewaRTBCbxdy8+I3mGaNcVPzsOfQa/OkIvM5L6F1vW?=
 =?us-ascii?Q?elQ6ZbbwpeExCgr1Mp4Mn14hF9hCgJskNMpXdGj96+e6a2JURFRTi2fXoH8/?=
 =?us-ascii?Q?RPzIJXEuLexla0zuk8hwaqRGcP6G/5IHrzva8ZXl1f9c3rHuczoE9vN6S2GB?=
 =?us-ascii?Q?bbrj7LYGu3soE8Dwp8VIO8WND4xa2ir9RTzwnckivPpMhs6BdZ3MPZTm3O/9?=
 =?us-ascii?Q?0jbHJY/8r2sNwC0K7a5LNiCBCEYtRt5s7p3lQX1kOfJNeWikeM3Z0fyXx8T1?=
 =?us-ascii?Q?vszXCb7bOa0vs1XHr+3y3NWYKZIGbKph6A3Q81EkDavPbst8yvdR+5K9tOp3?=
 =?us-ascii?Q?57MK0KbQdjhNutpd9wYmpS5vNwwJd8ZDbG29MizKc6ds7oaUNRt9+7CsCNPF?=
 =?us-ascii?Q?j0tkQ7cAy6njJxqk7pcNWs6ePP52wL3YDYD9zMbXsXABxm5CeWGKs8PRPcvz?=
 =?us-ascii?Q?x774AwTRQvEz73bxdBP+lUu0oLw4P4ZAiqnJBSp2kLFHCQ7jepI0RdKdxy9M?=
 =?us-ascii?Q?k1i8gx6yWHQhZ640mjGC0071fuQ3CPezhIQBXagYbPGexkSNt4ajlsIKG2Oh?=
 =?us-ascii?Q?sELZczHP5/ayI4ZL9jBg89GfKAIthZubtAlBvy4bTKpf28Qw2C6Vokm78RBX?=
 =?us-ascii?Q?Rhg8SHM+KMNtrPK97Bpnvro3jTKpMB5R+j5MbBqB8oqMq3VSuQwRiU2NF7c5?=
 =?us-ascii?Q?AjYFmrn+47u2s8vsvVnE10p+H5V3xELlDzLAFoIRgpQhjdFqc8p5WhXKbqJ3?=
 =?us-ascii?Q?n8anMPbmUTc8eCstN0OS8RTOw9zQ++8B1OgHCNXN1GrkBAOa1nCnYyka80+s?=
 =?us-ascii?Q?Dg6zkB7QKH2zlfRVeAhW722Nm6kmtYfZHTklmIZsSCJyvFYjq9dKCp6wiJXo?=
 =?us-ascii?Q?1dPFRaL/GzpIEy8Q/xP9UWIGwnsnQmo8X7PIAkV9iiL+qKVrtvTVu/YQv15O?=
 =?us-ascii?Q?PNOeIEbnRw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b92673be-e4b8-4dce-a996-08de652796a6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 02:29:45.6950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Udq3+fi0QR+x1diPFdfaam5o5X8Y831sptzURqkHUR3YLk0WpuY1aIe63WDuV0JKidNRkaS8mCHgWSSbtsCnQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6274
X-OriginatorOrg: intel.com

hi, Randy Dunlap,

On Mon, Feb 02, 2026 at 01:57:46PM -0800, Randy Dunlap wrote:
> Hi k.t.r.,
> 
> On 2/2/26 11:45 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   18f7fcd5e69a04df57b563360b88be72471d6b62
> > commit: 00d95fcc4dee66dfb6980de6f2973b32f973a1eb docs: kdoc: handle the obsolescensce of docutils.ErrorString()
> > date:   5 months ago
> > reproduce: (https://download.01.org/0day-ci/archive/20260202/202602022007.fALe9bGB-lkp@intel.com/reproduce)
> 
> I cannot reproduce this warning.
> What version of docutils do you use?

Python version: 3.13.5
Docutils version: 0.21.2
Running Sphinx v8.2.3

BTW, though it's persistently reproduced by bot process, now we also run into
problems that it cannot be reproduced manually in a separate env.

now we're investigating the env difference. thanks

> 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202602022007.fALe9bGB-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    WARNING: No kernel-doc for file ./include/linux/tty_port.h
> >    ERROR: Cannot find file ./include/linux/tty_port.h
> >    WARNING: No kernel-doc for file ./include/linux/tty_port.h
> >    ERROR: Cannot find file ./include/linux/tty_port.h
> >    WARNING: No kernel-doc for file ./include/linux/tty_port.h
> >>> Documentation/driver-api/tty/tty_port.rst:65: WARNING: Document or section may not begin with a transition. [docutils]
> >    ERROR: Cannot find file ./include/linux/tty.h
> >    WARNING: No kernel-doc for file ./include/linux/tty.h
> >    ERROR: Cannot find file ./include/linux/tty.h
> >    WARNING: No kernel-doc for file ./include/linux/tty.h
> >    ERROR: Cannot find file ./include/linux/tty.h
> > 
> > 
> > vim +65 Documentation/driver-api/tty/tty_port.rst
> > 
> > 3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  61  
> > 3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  62  .. kernel-doc:: include/linux/tty_port.h
> > 3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  63     :identifiers: tty_port
> > 3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  64  
> > 3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26 @65  ----
> > 3f19fed8d0daed Documentation/tty/tty_port.rst Jiri Slaby 2021-11-26  66  
> > 
> > :::::: The code at line 65 was first introduced by commit
> > :::::: 3f19fed8d0daed6e0e04b130d203d4333b757901 Documentation: add TTY chapter
> > 
> > :::::: TO: Jiri Slaby <jslaby@suse.cz>
> > :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > 
> 
> thanks.
> -- 
> ~Randy
> 
