Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208EE45038
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 12:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782943; cv=fail; b=Ek1NAo+E4eyS7gUr5mVFRKe5m5gLljPMWMX5WMES1CNJbjjCKHDk8tHaXkkECB+xVyluU94tnTKhGkPYtRtKG6unVYnz5hyxyesLBbcUT/TxBC5TBqWb9u6u0jN0I6HhZSVjyVd9JVJiKjCkX/8r3Luv+zsFOr5SvU5tY+0B24I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782943; c=relaxed/simple;
	bh=go/uIkpEw8hNdEBpabvBo9zI2KMlk2o3AjynCphcCDM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XRXS7apicNa2iT9Bht/DuFFpEqN/n5T2mYXOpf9YgGGigHLmpbCrsEmrqWYgHCND5Q05LBkNCPGoOxgWzF+thyI2+z97x7TN5E0Lv+XN2uBLUfSwgkgFwUN5+YWU1TPjDnZ0TgvuSwl/0HS7artwVIDgaTLzXVWymS4IFt5k6Ak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgCamXup; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgCamXup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788782942; x=1820318942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=go/uIkpEw8hNdEBpabvBo9zI2KMlk2o3AjynCphcCDM=;
  b=IgCamXup84Hvpov9yczsKwcjQ3eqWSNakiUm4XUWzE42lfdp7L6HxSod
   4wmFbn8pLrI7cTGYtAuaKFU1yKalZsujtT32RnjoD4rno6cZJ0kqn+cv+
   0KhkSWlpWDgOK4Rvq3Jj4g/JKlsJYa8shNMyCdIYvalXr4VN+nPfS86/s
   38rIs5nhZasez0Zk7eclCejze+okr2OV+r0AUvKz071oo35iy6tnw7eR4
   nef+8GofFmf0HaXnIXFIvPZDfvWh8uBNj/pMduXlLzbVUeVNRknVHTfxB
   f85RzJdGBgLsIx/DJQEyl++aZlfXmVhIAVfU8zUTICgdG7Ax5dXxdXuG0
   g==;
X-CSE-ConnectionGUID: 6yuGDiazSMetE94qFlcs5A==
X-CSE-MsgGUID: ZKxpQ3EiSviIjYHrwywXEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88333515"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="88333515"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 05:09:01 -0700
X-CSE-ConnectionGUID: 3U2hY7XJRfmmzKKHiLLuHA==
X-CSE-MsgGUID: fnVR9SR9QwmdQCmIXhW30A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="300579584"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 05:09:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:09:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 05:09:00 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.12)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:09:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/tkMXecw568U+jKat36ZHgpSfQ7aXm3o7xn7eUJA8RrMyD8jXgAKg2SaOiH9k2pwvhJLSnau/tbu79/UdyC8OEc22TjBX+Bi49WjOu0IYKeDbn87e6L8+DI6b2qnv5wuL/KfwYz+U8x6AVoMkAEqd4fO5xSiie9xA+g/OypzlJf5mGk/HVa7Yj6FjZEzaly7lcJmoFZgua2njBMVFzuAEjBaj0D25KtOHinuzKa1xebqCZ/UFn0iu++9iE5vmAKAF9hTSfr3+VrseGdNMadcoyYfu2RXwgpC6KC4igrwfua6H+BmY7UfnIWyJRHf4cq1q1Ffw7iB6fgw4QuRZEruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKFIhXnxWXDPWuBhRLUXlmrFV+FYekfsKtToO+0QfdM=;
 b=aDo8XdM5L2/eH8CLH/GyEK8hukxNwULxZF5W00WtpyjkVKYGZZKHe/6smdhPJdUb2/jnz3kGtiKWbZNbBazAS3gCZ9mKZP77sKLoNJme0oPzIcWt0YLCvp2qxvgGRbusZdcDoW2l1cY6fW/F0NAvXs2e+/Ju5Aem9gOaCSlGFhnkT6EeMwAviHGAJ8BAUFD6Au1laCtOGaOY74IIta1k8pkV1fTac/4tDy7oxpQU07wuUV0tZDKD0nqP1C490icWEiVq0jVaByM2VOOOL2ujjTkfqqUJmWK85D6Wz8mM2pZp8hYncaIR4iH3jqfKJXCVpVFAsyQCS4+6uaGByVuQiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e) by CO1PR11MB5043.namprd11.prod.outlook.com
 (2603:10b6:303:96::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 12:08:53 +0000
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae]) by PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 12:08:52 +0000
Date: Mon, 7 Sep 2026 20:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, =?utf-8?Q?=C5=81ukasz?= Bartosik
	<ukaszb@chromium.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jimc:wk-merge 161/169] ERROR: modpost: lib/test_bonsai_tree.ko:
 symbol '__udivdi3' undefined!
Message-ID: <ap6pTayij9PRvP5N@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0032.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::20) To PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF4E874A00C:EE_|CO1PR11MB5043:EE_
X-MS-Office365-Filtering-Correlation-Id: 176e4d0a-4049-4807-9bd7-08df0cd8c864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: ibQtbpniyQ46hqoL2wj7F0sT5og+Jf7nw94HNH72azXjNXHouneEQaxu1nl7Ka4CqPCoM1FDzIyjqNBiUvA1yTMhgqfO63X7Z7eHT6hqqwLlltigOCVFaSFhyWESGpyyRFnfuHEEOw8g1/d7XM3/y98Dr2edu43w7DwNuGzZydp0TelM9yInRQfgAET8XImK74IsF7NdOL7xSWEoEstF64081OqxrqtbnLEb4TyHxoKCNmchU4SKzWsyH7I30ZtzpEFmeppBtsn3LVPy3wVCtvCspxbHP/nG0Z61h+o7kaWkf0XhyLQ7J+FjRDTUvTtETd/gQf5L6hpfPiLNUkx2K2rUvOmuC28ZuWsv/4ilcSwpBhwXuf6I/7/bsg+uU+cmTmRKBbVIkmL0ufz2rd+IQUinFjclWKog7HzgDKkjYV8t7bLqQUAXIprpSRkeZL0Q5zkbxroVifJfYUF2hZs2yA5YZx32lsDZHxqKY7JgYpD3fIYCAFuX1GLoDGH99zHsm3fL9pyqufdkX2ZaAjXHKbXLjBnqTdx2jllsW77AsDXDPe2rfZLAbQl907+hiRq3OZpCUFbvti3Ga/JNmG0Hf5yIb/BPtdoJUgmE1QQSVcc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF4E874A00C.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WJHAqg2HFdZ78l+JAWzltJ0WuBPznq7LDPHSM6UkQcssaPdPyGccftMWeA5z?=
 =?us-ascii?Q?PtsKxfU++yfrskxWq0IWCKMrJ9L932nYC0dnyXBlOb/TTq1xq0ZTU/Sj3Ceg?=
 =?us-ascii?Q?iP5+Qek3llKCLmLBF1VRIvtlt1Fwnw8iWMPkDm617mMUimdXzuCKAhGgQkCw?=
 =?us-ascii?Q?0xmqq+ddsGF3reYKJIWKEpa5zpVgO0PCUnwt+AFYQbbN/tcZ5X3obIWBSDzA?=
 =?us-ascii?Q?PX3vLl+3wiHUfAs2N2jwEXjlUeyT1dw9OXcxLqVSBlUrjVvLPLtzZfXIM4m0?=
 =?us-ascii?Q?r2MokH5y+8x+qJHd4ir0Al+mlFahOw4gY89Oxmxx+5pCZHWYwuZlD8FThpzV?=
 =?us-ascii?Q?UXPaxS3829qaVDKC+mti4/VNGstw7E3scw9k8pBl+J5XWzUQKvExi8Ck0sug?=
 =?us-ascii?Q?IoHDMqTuLzZklNJ2Yezu6GoU8X40BL5v7BGApHK+61gLW1+8kVUfQ6wjV1lU?=
 =?us-ascii?Q?HsKWWyVHRD9VOMe/WkkEpyrhqSifXWMlq/3bG/mp4/qIabHnHuMynzRCH323?=
 =?us-ascii?Q?Anr3M2gaAgr/Mw/0lS9XWp4U6JrSiEYK5W40CcDZRh+z1pJsR+xqJIuZWLvA?=
 =?us-ascii?Q?pMcd6nCVmv+vbErObu8RZtuuSxlL3btLHTZeemMWhs628xDvabdjGkwg0Ogr?=
 =?us-ascii?Q?3WxuEFi/BeTgJ4zR3qq9i4AOG147HfGldWEuQTFd4Gu1ulvTqzntZXfj1ssU?=
 =?us-ascii?Q?eSYzfH4003lV46ZdSJe9dvifEXp6cQaWThr5BcRybpSAqc7wSgd3KHNqtcNT?=
 =?us-ascii?Q?7+qD5g9ylLcVx/Faa7xCNr5hFKPW8G5F76/qqkgJ3yBRHisBFvr2bZgLW88C?=
 =?us-ascii?Q?57JVQpPERDfS/NPafGpaIybWlDSTGvtAqWx09FN8NnkFEGwt98yyTNrke8OF?=
 =?us-ascii?Q?DlgLpviS40pm0w4CQ+0Xtj6P4oBSIyxkPFGv/iCZz4HkcOevlJKxuuRXxSgP?=
 =?us-ascii?Q?2HGCVS4/eAYotf/o0KpbXa21E02RcR34FJBXPl2g/uS5NUrrdj9HFISt+iKL?=
 =?us-ascii?Q?tpcIDRp3RXkJvwE61hHwfzMdktEtl3O1FJEdTBLFXn0Xt8ftSfJR/2keKPZB?=
 =?us-ascii?Q?9ZHdk0BBosvaA9+/nejU+daz56vRfpI0BbJ87GEhDp9u+eJOosXVc43dieiN?=
 =?us-ascii?Q?mE0R1KdYWzFITtEhXuoPUmqT9b2cWPApGO9PX+IvpW3l7ZDre6mK3EIRlmq3?=
 =?us-ascii?Q?Ufh8VhMa8Vq5uSQFfVUsUcDYuQcld35wwp1hCs1UUNmN9CzPFqOuaj5HxhEY?=
 =?us-ascii?Q?tEVoSpFOKb5r4kzVzROeTtr/MkP4gv+HO35CwtWAAP9b6VY0UK4khkpbc95x?=
 =?us-ascii?Q?nYdroUExAlTEhQJXkiFhx68HNeiPM3LT/KK3Ay3OejraZaMF4eKJkBAcg10e?=
 =?us-ascii?Q?c9XsqU7fC4p8EE8Moe5y762kklC4115VZ7keY/ZOvSsXAxvxIlJLOKgdr9o4?=
 =?us-ascii?Q?j1PhgARwLknnlUlbAmlo4drrIAv91V/gDuun+sEM4Tptknu/wU7pxRZ67mZO?=
 =?us-ascii?Q?AF8LKzdTHf/m7xj95aecw5CReRDcyRKP0paco0pl1uMlWF50vkndnLpgYS/k?=
 =?us-ascii?Q?BC6q6Fs2Cjmz8m8MwQHl87Zge1QMC0KTD72XG2kLsx9N9/tQPVSAcVs5ebNe?=
 =?us-ascii?Q?lHE2CKMthz6ZniIzILhUp3i7pfEMMG7GSAb5SoXX10T9JKA5Mj/aIBknwHyj?=
 =?us-ascii?Q?dPT01rWvlEQCpeQiTibexfJM627Eau4llpCEvTvZZEik3k1pBdZlsjsHD9n7?=
 =?us-ascii?Q?9uQfWeD/yg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 10tFUwjU8s0eQI1QVk7QNf36fYsZPlO/GXE3PDYATW1vKuCQvKU+Mtji0lKOwZP9WEUQnltlnMrFzPpcUHUAgWhGqGbpjpjjIEOxxM2F9yOpkAF9Vxw0pmA/mwT8RRrwA2SYeRPSulUM1cMOUaHd9eDL6Ti7UUddyRmTDLSgGR6CzFP1Sag88cz+W16MKY1Zzk8De3a/FEsKfVjh52gsm8/lZe9AwN6qPzadQ60ndwJb7lI/rj/NDoFmhKidUwdKeqmjv3y87qyxpfUleuk0nBF31LlT0aFr6AVe2Mqu4WtBE192PzQbz3nj/QNfoZb/IgY+uB7dfjaZUVmal9atog==
X-MS-Exchange-CrossTenant-Network-Message-Id: 176e4d0a-4049-4807-9bd7-08df0cd8c864
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF4E874A00C.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 12:08:52.8709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VbawkntUsNLh8quIKSbNb7472L0cm3oh7iFricntlK4VHJqWKs/9QKgfRa+ox+xmm7SrJirHWrpbJ57qeYjPMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5043
X-OriginatorOrg: intel.com

tree:   https://github.com/jimc/linux.git wk-merge
head:   0a0ae42743814d601c19e361402c731f47824ec3
commit: 5cf266e83cf71b2974c60844183582d4d0b0a5c9 [161/169] lib/test_bonsai_tree: Add benchmark and stress validation test module
:::::: branch date: 12 hours ago
:::::: commit date: 14 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260907/202609071309.ZM6MB5LP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609071309.ZM6MB5LP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609071309.ZM6MB5LP-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: lib/test_bonsai_tree.ko: symbol '__udivdi3' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

