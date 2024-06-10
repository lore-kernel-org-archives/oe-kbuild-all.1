Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BB0335A7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 12:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718022934; cv=fail; b=QHK2cF86luhye3zQbDGZ4G1tlglqMqMRoyFdyMMxsxaanzyTF40qET/G5M/Xh4BtqblCk+1RE28oQjski+2ALOQj4VQ1XhgZq7EGmjvkV6FbviBR/Ek00q9LTUfIYqHRJU4MeorG3amTVuRjCXQ+GoM0snSbb23RYyCCP4mQs98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718022934; c=relaxed/simple;
	bh=cLfwLQ0z+Tzhzfy0pqnL2DkukZ95fnjBeTMis0GS3lU=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=t5PCRh2ThiHlIPr1iPhhDZahWUIe8siOjpGOifqUM+84pf52S3BcAjHiEKwBNIZ+gQOXJxYGg0W4MaLM1obciOiAEXNs0ubAmalrsqEB7G85W30y8kHOehZxx4c0grE92k1XiN4+vkkgGjjK4Nl6xEy/upfoGq0Lp/4u2yO54Vw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4bd6sLI; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4bd6sLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718022932; x=1749558932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cLfwLQ0z+Tzhzfy0pqnL2DkukZ95fnjBeTMis0GS3lU=;
  b=i4bd6sLIPJ6yhmmePPIxxXHiHHfAG2z/sB0u9mt0yDliRKJhvgxzw2+c
   Q7ytAkaDVI1gudtZLhU1D2MffAbHnYS6uz/8bHjeGX9FaGjYzJwyg8pqG
   XNCTktccDPFjeukqf+HC0JZ7HBEubYYYF3EIkZ2FnDi0Mhw4/wUSbIwCF
   dZxN6tKQ5VpcouZQHY8qtKcVTVEMbGFl4jJNcyaKsjIEAauQbfpE4nciB
   ZeYqtjBMfvTr4lrB1P2eQ+QGPUvYI3XpDRoqbs9qU12a4F6k2t7AFcHPw
   vBFrAowsojoNpGTMimIMKflt75+4v27qC/u2n5UE0PbY5DJ5YLxDyAwG9
   Q==;
X-CSE-ConnectionGUID: jvWgcT7QT1GCcydFFg7IzA==
X-CSE-MsgGUID: npyIEmFTQrW5Sn0OahPofA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14474134"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14474134"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 05:35:32 -0700
X-CSE-ConnectionGUID: KuJLd3kyS5em7k2Kf8P3yA==
X-CSE-MsgGUID: sQ29XeBkSAOhSkZ5q1mAwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="44192907"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jun 2024 05:35:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 05:35:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 05:35:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 05:35:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kinaO2lXCT2WuzqF04PcICFuOVsKmMu5lqrd3s5wIRjDnmAz2jwWj+Bh3bKwS3+tz47YkuuY6SE0M462O6DVXwfqkbtUHdl891r3x7Dm7m4IwvuEjrxHFpSN6xBgSa8DgkOz1VOmdC1+ZRW0ocuqpCwrjoJxwpr3jzKm6o8N4HHQCk8qGNBdB3Ym7/TMjw/K1bUF3ZfY9hKppKGo+sXyn8JgZ0hcuGW98m/ABHLp0x9XzKmLKX8cvNu7PYM5SFjYmWS55g+Lmg0P7oUF/W0wpOOcfAMCo8/wW2MS3fFYDujD3lMpLRcB9urgVxuoGkiJAyFO5cWdd2wMEUNGvgBbAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iI3Iz5lMVHa2d/Zn/7WTjf4jHQvefOWs2LnpvmzHIRM=;
 b=nipB0uLE2Is1HknC1aAo59Rq0pWGUoet4FXheF233NCy0XjStnvbz5QVpa/4zABDFAE7qcMQIdTWoB+q5yDhfkSSBaQO1M3SqOZF7W8MG+xOBwH4B7dkNx6+oEqvcTlFgUfA8fumJO0MKjnVM3yjRlBS40MRwUgC1Lw68Hp3HeL2unihSuMtdPbB4llr8GUIyqnE+yObfcfjMnTK3sPI/cYx2AUXQcn83QKnfpk/sFyMc/5egJH6cX7HLB4zjZhnGVozeNnw83jjLqE15l/dU2XG9qwkCIyYCMEblzL/jkPUdODF3SjTDMOfeLh7kZ+pP88ZDQu5rL2H0GkEw+hm6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by CYXPR11MB8690.namprd11.prod.outlook.com (2603:10b6:930:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 12:35:28 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 12:35:28 +0000
Date: Mon, 10 Jun 2024 20:35:21 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jcmvbkbc-xtensa:xtensa-6.10-rc2-esp32 46/46]
 tools/perf/util/evlist.c:1533:8: error: unused variable 'bf'
Message-ID: <ZmbzCefGpVJbv677@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0161.apcprd04.prod.outlook.com (2603:1096:4::23)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|CYXPR11MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: 12457ff9-231e-4e55-885b-08dc8949cf09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+ysy8A+cWVJ//76GHwFT1RoSvZZvu35QWi3yVn7o5J7r41dNvQ2TIqxnQCLq?=
 =?us-ascii?Q?FQT75v5eGF9htGNMTjk1DwANp+bRLoIr7OLnBq/nxfmQZMD7lrxGt+HNybhB?=
 =?us-ascii?Q?YT8RMzhDhv5ZL5HcCeDPpI4FiRs/cRYetFghg2F1ez3Y55SVb0AOO9oc49oy?=
 =?us-ascii?Q?cstkn+8om9du1wFpObpW7VL4ufzPrAL2UQnU2JHC+ycAcaJdvN4xKNmpkEGF?=
 =?us-ascii?Q?xxpL/rjjuiIS871opU3e/y02YQIFg1+1+FB72BJGN88NvDi07u6tbFls+pUM?=
 =?us-ascii?Q?pOT58nzVLEWHLPTeyd63CU3smevYk2kdKOgwVQMZlYUDnU519N9MKssKjPeV?=
 =?us-ascii?Q?pVqtEKGUXSbZKadtmj11APnsisi9GAsXYQGe+TuzoXulCgC1yLf7jnt6VbPp?=
 =?us-ascii?Q?kTSa1iZV6+jLlXDaYswcb8OvVF0NAftXt+WYE9qObekpF3H2JikrGgesOFSr?=
 =?us-ascii?Q?KvkSzFDuopiya8V03W4O0A5DvWEuYYC3I5kIh+9IBHDJ6S0dGYNORu413dQ4?=
 =?us-ascii?Q?DiPo56J6O3+XISA4yUnZVpREsySyy4acnlQFXBH5aqAPD0mFbgODQ0pQeUaG?=
 =?us-ascii?Q?bJ99mMR8RyW+ZFmAgpKhsC4WTVaslKePZM61N2PodIGhXQvwFI4Ll50q3sm6?=
 =?us-ascii?Q?2LILQJ23CUsKOvk/s0Vtm1XSlERjvNKoMBbtaqrgYiwmgXRG00cG3KJjI4Uu?=
 =?us-ascii?Q?+RhOyT7cbhJuxPpQuV40kYH7vDWiDJCkBVlaFOj9CLTUeoyS0Cn+UQ7SwV83?=
 =?us-ascii?Q?Tm9qFCxzE3RMaqKToTkptdbm7vU5Ox35uav+AxsZyT+YLbGTkA2Wn2mkUyCx?=
 =?us-ascii?Q?X1avmBIdaNJ5KpkFABG5/JsElFB2B6Ox/Iy9O2BFwVHML8MinNOvo3IMiKPQ?=
 =?us-ascii?Q?UkoxTmkzCAetlapPrpGqsmAU8g9MaAIh6zrs3zapD3tEdNnxxiBl+qH+IGCg?=
 =?us-ascii?Q?AtF4cRhgz19D2R3T/ap2p3B5AQuXIOPgpwzFtOreFrk3zRkDCGNmr+N20V2u?=
 =?us-ascii?Q?nqCWPDrfJ7tVsMGmMOLP8mHJoaDcSTEZrMjXQQyxAyyV0qJber824hjzEfX2?=
 =?us-ascii?Q?79/s7Vw3V3DekDn3kmYlVGE5qGwbkIlWnhW1KWJ79rcO7mqVNcxlENHJiL2S?=
 =?us-ascii?Q?U7nBC2Wfo57bledJJbalYo3b8SN56QirtKiGlGZ/bsm5WAChReXBMIZoNk18?=
 =?us-ascii?Q?XxMaRiiTc1+TQsCOBHdjtVFzT44mdpR6WTLO2ZOvZjtgaWBmpInIXe8ZQFuk?=
 =?us-ascii?Q?JeIztHYUigzLlhne2pu/A78qUwu22uTnSnftbohX4g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IpiuaK4qdXCrU5fUGwZvWJcB1uE++/HcgOYveTHKvX68NQgcdi7pMCFiKTS9?=
 =?us-ascii?Q?RLjGvMMpPA48DyUnBSgaIMVM/cuhBUTOknAf1If8BSUwxPuBDxKNLgNL122G?=
 =?us-ascii?Q?5+SzVq8QnzMSmy/0QDZmR/wZbz00tvY+cJo/9ZGjYwww6Ln97RvCtGF454g9?=
 =?us-ascii?Q?3b6ZkAymVKTDh120pOWS34vkwCdRslMq3cy1PfK0egvEtYVnU9ze5pIg/6Z9?=
 =?us-ascii?Q?HCFLAEn0kbqvrGOQa1aelxunNeoeqIrpZrm7Kh04e6/t9Q+zCYD3DRg1kutN?=
 =?us-ascii?Q?gtjyghVeYrZOvv6hSoxCDD3QYDqpgVIiBJWK91XpUbn5BdwBPZbTE8Q8B537?=
 =?us-ascii?Q?vuzn56QqE3vkWU3MLiLU3ui0NX6Dk8em6eXB/Gz5WvzQzmD/uUo5XzxDawql?=
 =?us-ascii?Q?ZDfCk1rbgs59ISHAwMCAVzAWTWYXaeN2hba4Xf7iHuUBcMeaLOSUqEIyKV1M?=
 =?us-ascii?Q?geiK91LLUDJU9RSW4ZxYiO509lQ7XcrtCgmURseW+Ct+tUfv9VsFFBZPaQVZ?=
 =?us-ascii?Q?TkTjgz7jGQZGh+KrosL//RknhkrjW1zL/3A97xoZMjNTLc8cmc3TBHk6Eyeq?=
 =?us-ascii?Q?KoTdkq2MNbON2vn4RxOrA+J5TWaGJj5IwW66w/aQLCKsLUXOq4A52ePsnASs?=
 =?us-ascii?Q?pRtyh0pGJcHz0cHkC79fH2HwomaV0bGU+t2g6Gt4RIW0P5BNo0+7pqFO5ntR?=
 =?us-ascii?Q?eOIuaMH+PMrI8pSSXMJGLB0PuSYIr5r++hd9QDmMrdu/plGmjRyVR07NXrYA?=
 =?us-ascii?Q?8pxyVdZugR59dnUNfw4wDhid6z7qPS8nSJPNxRT8HIjN7I/8xWcH+6F8dv39?=
 =?us-ascii?Q?FzoU+LwFBTAyRbYbBwQtNsdOcnEs7k4ByvRuEBcNVmYOB9/NUfdb62o4hvTD?=
 =?us-ascii?Q?pDv+J5uWw2Wm6SgTSKnYtMTs/23JbvkoDTleCiFPpVISUjldpiD0V/PU5HF8?=
 =?us-ascii?Q?7IB9cmFGXEEpW89LXd/qEPm1moI1In2jzGr53TwHJ0xF7Y06lQMAb2psmCLd?=
 =?us-ascii?Q?992kFq9nRyd10JJlU3Iga6rl+70RNMv4z0xHQjpcvLox4wDNCjHDyGV2Tohr?=
 =?us-ascii?Q?k8RnzzSQDg7k2iCGKe4MLKRpmfca/AvPB/37xeTD9Kk850KnZRQHVGuWGfro?=
 =?us-ascii?Q?satvHyIeu7BPBSI6NYtoG40+aOXRTCY2/eYh3B5YFAyJri43PXxPGGyHPmfa?=
 =?us-ascii?Q?Qans9ee7twFA24wmF1I/SqfZrpabZgPxFhw3ItFQd/oUhvXSCGzqFdr7+6oy?=
 =?us-ascii?Q?QC1MX5j2V5LaaOK4bgn7fLrPyVQu3Df1Ny1oLNayFt+60kdfr9QdTaUDycCj?=
 =?us-ascii?Q?nxCPEP+AS07orT4thEx6nWPXdxv0wWQXMy0bpu1wpqbrqc8WWJMo7Fg+IARc?=
 =?us-ascii?Q?zF4rI5vJnMveP2o1oVpweufaP5Sqhkgt84hIlsSVnJWk6d7QTAkJ30WMo/tq?=
 =?us-ascii?Q?LB7dchmaSQptXGKUP3TilIakFJaR7RZRAZhJmle1EkXwsIxl5gQPn7uQikYp?=
 =?us-ascii?Q?6+HDORi1Ee2Rjm+e5QiSYT/ALVs8bAK/wndi5/sj+/JrKhpS9OSe7KCW6AXb?=
 =?us-ascii?Q?hupPeKBirB3AK8mJHcq1R5NRczhoIlofBxV91sxt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12457ff9-231e-4e55-885b-08dc8949cf09
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 12:35:28.2615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K2fcDzR/XE8YdRRRvAlwG+1rb0TyB4YfEyHxvpfzt0rPtnIqhGqLt6G3mOyRjaX2eDRBtcl8qXVpezK+mlrBOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8690
X-OriginatorOrg: intel.com

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.10-rc2-esp32
head:   abd44c5784518efb46e1601d9b04cb5a63506944
commit: abd44c5784518efb46e1601d9b04cb5a63506944 [46/46] WIP: tools/perf: make work on noMMU
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406101319.AgYGRdaD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406101319.AgYGRdaD-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:663: No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR
     PERF_VERSION = 6.10.rc2.gabd44c578451
>> tools/perf/util/evlist.c:1533:8: error: unused variable 'bf' [-Werror,-Wunused-variable]
    1533 |                 char bf = 0;
         |                      ^~
   1 error generated.
>> error: command 'clang' failed with exit code 1
   cp: cannot stat 'tools/perf/python_ext_build/lib/perf*.so': No such file or directory
   make[5]: *** [Makefile.perf:702: tools/perf/python/perf.cpython-311-x86_64-linux-gnu.so] Error 1
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile.perf:264: sub-make] Error 2
   make[3]: *** [Makefile:70: all] Error 2

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +/bf +1533 tools/perf/util/evlist.c

35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1529  
7b392ef04ef570c Arnaldo Carvalho de Melo 2020-11-30  1530  int evlist__start_workload(struct evlist *evlist)
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1531  {
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1532  	if (evlist->workload.cork_fd > 0) {
b3824404ebbd489 David Ahern              2013-07-02 @1533  		char bf = 0;
bcf3145fbeb1bd9 Namhyung Kim             2013-06-26  1534  		int ret;
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1535  		/*
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1536  		 * Remove the cork, let it rip!
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1537  		 */
abd44c5784518ef Max Filippov             2023-07-26  1538  		ret = 1;//write(evlist->workload.cork_fd, &bf, 1);
bcf3145fbeb1bd9 Namhyung Kim             2013-06-26  1539  		if (ret < 0)
e978be9ea2990f1 Soramichi Akiyama        2017-01-10  1540  			perror("unable to write to pipe");
bcf3145fbeb1bd9 Namhyung Kim             2013-06-26  1541  
bcf3145fbeb1bd9 Namhyung Kim             2013-06-26  1542  		close(evlist->workload.cork_fd);
bcf3145fbeb1bd9 Namhyung Kim             2013-06-26  1543  		return ret;
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1544  	}
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1545  
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1546  	return 0;
35b9d88ecd8c5fb Arnaldo Carvalho de Melo 2011-11-09  1547  }
cb0b29e0861659c Arnaldo Carvalho de Melo 2012-08-02  1548  

:::::: The code at line 1533 was first introduced by commit
:::::: b3824404ebbd489858f3a7097c715120118fa5cd perf evlist: Fix use of uninitialized variable

:::::: TO: David Ahern <dsahern@gmail.com>
:::::: CC: Arnaldo Carvalho de Melo <acme@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

