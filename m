Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2932C3251
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 12:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774958414; cv=fail; b=u8Wqn1qz5ZQFGvAeQVWBSedxBUmcr+2alIDcI87i20lTU9JOLC6ViaqU4UO1mnoV/fDRCk6KI6tIJRsjB6mwlt/emRTknH5csdDelF1+YQhvkKQ4KpN1/o0m3NmkXaklFMTQS+Wl3rZhHSBqB7aQC4dReFi8yL239TrC7BaAzGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774958414; c=relaxed/simple;
	bh=T/5EgaDCL4zeBB4FkyCkw39RKNhXooD39Dd1SgfWYEE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Ccv5BCsQOY62G1TT3T5fw/JLgzWLStT0fETkrb8UOklMQYwjff5SfVeMTvS4xQpiMgrwEOkzuFvQG0VgND93RvNw8GL/LeE+lu8q7nDFpaW/r60eGKGExUZfgG9iUxjMP7RsAcwUmjGDEgHDyBELhZ5hG9cUaWGMfdb1KGdU4qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBULpyMD; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBULpyMD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774958413; x=1806494413;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T/5EgaDCL4zeBB4FkyCkw39RKNhXooD39Dd1SgfWYEE=;
  b=aBULpyMDKoeT1XUsD16d88nr7A9j88hVLu8ZyanT84ZQWKGZzwR5jrqZ
   zg323EHETNnYdgI5q8UiU63O33K+cwKdQsRKPN0FN0fGotUnke/uBij5e
   167zXuOXsOCadut4rC/qp8iQmGk+hZf5VzvM29ZZbULiIHhlw17dXZO8b
   9VwKq+DHI3KQ2XouvnqIw7WWQUcG3uzkrjMk0VaFc8mCEyeIVanuIFkEd
   q9hwptgJp/vE5XHcigD+X0hybyicDqIRypYKlHbkeGZ39ViQxFiqFczKz
   FB2QEcrxiYq4G5XXKpQuItUpJartvGnH1T965EEZNYrPRz8+awzAxv8nH
   Q==;
X-CSE-ConnectionGUID: hM45Zt7lTGKP/ljX/iYI2Q==
X-CSE-MsgGUID: K6Z/24Y4Sh2dXWywKYrvUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="76080886"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="76080886"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 05:00:12 -0700
X-CSE-ConnectionGUID: 1qCVGAcyRlqSk57s6tZoPQ==
X-CSE-MsgGUID: SHtz/4ATRRONhxxi1dhvTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="230809871"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 05:00:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 05:00:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 05:00:11 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 05:00:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtTztEQts7Ka08clllPHOp7deEmudl/fs+dWaUPZpnqOGjbWKVl/Yh8qdeQ0azKbzYpvjemVDXXntW8B6QA9WtZHBShvIZbL2Y1pcPlZrgGwImNWlBWphX2A/h1OYxUBEAQPiCXVSYOB+4W7giQXrzIRpNmJ1aUraZ3C3eL/kCP88ntg1l32ScKO4Na760uqgiOCMsvepMAILFvIEOZ9CNHs3kpSrHfBGFrb2RcF8u7Du6xWa1KM4+m72cX/rVGtA7dYR3WhVB6BGxvwj2XEKQnSqv5cmcAekK38kQ4hkV9TJPy7XfrTcAuWVUfuytopdY0y+XTUH0Uq0149XHLqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=za1qGps5JyL0iOxGEkfH0eMJnoic8vSNTmirZ2MbOeY=;
 b=DYNhr7W4PoZnEDCUXgkc/u6sRn88YSGf3dQhllpNnBADy5lRHs/9whHCR/NMrkSG3DWouG8hr1kM2Bd/hJlTnYokY9qwTOtW8DNBSiKY7dMQ4gr/f7sehbLJd6InBg9Wa2pS9OJ9nD1DCGEwcZ2TJRITr5ciG4ZFDjUWHnNOHAja3C0FDKJnKKZiMAjBvfY6hlVpHcKUlyUkhipwYxmh/4PGI/LCb0rnGSbXsE/5Vs2ZDPD/SvdwS+Wd+gyRVVtjZhaXJ/2FCgvOEDxFsE7N4VBiHJMo7BPST/DgZFGVsV6HR1TsZgt2FsQLnKHTDaksZebUXV/9tZBZzajnUTokaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by SN7PR11MB8112.namprd11.prod.outlook.com (2603:10b6:806:2ea::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 12:00:08 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 12:00:08 +0000
Date: Tue, 31 Mar 2026 20:00:01 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Namhyung Kim <namhyung@kernel.org>
Subject: [perf-tools-next:tmp.perf-tools-next 9/10] grep:
 tools/include/uapi/linux/fadvise.h: No such file or directory
Message-ID: <acu3Qeoy3pRcCrpl@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|SN7PR11MB8112:EE_
X-MS-Office365-Filtering-Correlation-Id: 7671d401-f120-4a4c-7b1f-08de8f1d0e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: KnLLBbaWaknIUcAld6UJZ2cYSSgpQDVWXl7v2qnlVLFkYUpUgsTi30i4DatbdZhc0ST0X95cWhdtOruJpwxXIkxffq2HsXKn/bCy2N4oJqGHN1zo0sRegVo2fEYfX1w/YozQK3g46pvPt0Jx0mG/VKjRPmlYn7RO8USbo4hyAzOPWXm8DglOcptmLiLGc/TUCb9vdOtnXomluf6hJ98di9uAKRNOgP9Dw6AS7aEkshlPurers9oZaO7gGqflfOUDggAtJdTRPrf7q9BSEyuiPiRXKzn/qUte95mANJWZoAuSMvEf9m7esEh4kvo9lYeMw8MPj5btk26oLvQy2L3qCAygzz1vMkdZ18dKj7cnR6zaBV9Dc/ihnvrupKDEPe3hRgFW3nniYNBHhbtS93iUegXDZH21Oig8DJ2aCWl9ySGpnQX0ELZ4QWo4+ouHg5GiqeZ+99nhzB3tyH3vO6mhyi5ix5IsAVJIa4lYkiMvfxWK2lg6unjq24UZj+5Thnjs2KctXxMoL+2zNKwI0UMOTaz9UaDPRJZcJi2R9fww3msfaAEXkOmXqH1aJexHftQppbrRAL9u4JVn8nxvY1CMiIUC5YxEOP86sy8cTh715fzB5rRulbVs6PSsT1FYQ8sBnMM+gy6Lqp93+6IZ7anw+GBgSM4atLxfAotz7lMG3iizXntssy63fIb/SxrwB7uP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qHlOVQGsATVELSF9KCDI3lExyJnM+js5tc2641uJW3xcXT9BumLBRIKareIA?=
 =?us-ascii?Q?oF8X1xOIRQRPwoxlYXqaibxIBZ5JnKrxllzYnC26uBN2eXyT+0ulaxlpfPNh?=
 =?us-ascii?Q?eRp5pt2wAcPrWOAnCONvEvxSZrBpt/vmxcHdQl8Kzqp087pNyNXmgddp73wx?=
 =?us-ascii?Q?YxPBGtUX/abq180jHY8dQbmiw4WH/bDMd2vR78SKKWqHRFDvFVclSbXG9RRH?=
 =?us-ascii?Q?mfVSZg/cPv+VK8r+SP2TN1L2ofl/m3QQoI9MRC3Kc8RX6tldEzVwQVWo9gs3?=
 =?us-ascii?Q?78zQg2ajl9Pyez5RZH2NQ7b0fjz7CYQOpESNdpk9osALwq5GwDU1XiynPH8o?=
 =?us-ascii?Q?ZKxgZ1Ztnv+Lrp7i0lNzB6gXSFZVGc1f5UsWvIXVYM49iFrccMKyo979mJbx?=
 =?us-ascii?Q?ypD1nuJx9DkMpM4p9kEeeu3sayYcdRr3Ej6rYYIXwfH9RcC9iKJ2tLQEC87W?=
 =?us-ascii?Q?K/isFNDGdCuzLJQb4y1WV/LNx+0DlmDnHvWcMLz6iNWi6qD/hmdrPdXNOSE/?=
 =?us-ascii?Q?xKE2+v3K28aCkVGNiGav4H05OWWVe+UUFLQsiuX5nMn4T9yYbDBsk35q3z7Z?=
 =?us-ascii?Q?g2EvSetrw0QXNy9yfYEHHWB/dPepzG0CT5a3BpFwg+haUXVSHcieL81bmRKm?=
 =?us-ascii?Q?N7QFvXqmpJTpzuW/zLpAN2kdgQ/Pn9DFF5Gjkv13cJ7ROnklgbIk1so43wp4?=
 =?us-ascii?Q?LZbRPKzdn+uk6legmK5vFX5QNPzKmDt1avFkGJsYEdusM+42ukDh6ZGYDlrQ?=
 =?us-ascii?Q?U8MWGzDMaFkmiGzL1+nq5GRey5pUN6e1Aj9pri6fzRn35aVtX3K8hFBYdval?=
 =?us-ascii?Q?MQolYWLxxq40VKXrHNei72bOw03z7P23oED7/GdxH1Lg11DFEWPOOzAcGuWY?=
 =?us-ascii?Q?aWQnHbfZ3zURB8SkPSHwC1wmIK1oGtSSPOM91n2CAJ/biD8xcactZ8MUgDVb?=
 =?us-ascii?Q?eSJJgmTFcYMgNE4o/JLeGd93jd8mojNobwHnSvjtMrEMehq8U95LTEcMzobK?=
 =?us-ascii?Q?Gl41tJmAxX8uMAAZb8Rqf0gtxs80PDD8temheCmWKL3Cnud8vv4fVKyKydXo?=
 =?us-ascii?Q?PYXazDZuJ9Du6XYzNZh0+fm6zrLXmvL0Rhk1VdnQ1ipc5vqaD7LrDwil9FW0?=
 =?us-ascii?Q?ipB2dveX8Zijl6aTTOFlstNGhap8GUVzRUKAHwwV70Dot0Vccr3CBe6KRH0i?=
 =?us-ascii?Q?XsffZRptI6ir/dYtgBLAtzcBygnq4Y0FxLHj0PGcV9E2z0OcIPowRokbRY6V?=
 =?us-ascii?Q?WARNu7HvWQ4wyBrnqdZ3ESLHUtSmbhVXTXCPhgKawbGkCXNguXwa/Ua65GJf?=
 =?us-ascii?Q?vRpnz6ffuIOfvYSMnqi7+vTyHTEX/GAZh9DkYb8fPsgxyzxpns2aEbnf9VlK?=
 =?us-ascii?Q?MfOxZWv/0lKTw56VvOawG491cOI6ia+1xC0CbBXB0H69AHOpl3l+EOtx11Bd?=
 =?us-ascii?Q?+ZxcnoXkVaNDmjUtMQd64mF4tCFGAriO354XcmFRKWBlRVKESGUtbF0lKIhT?=
 =?us-ascii?Q?tLIA/xpq+WuTuwDeuOa2E6ivI8cOcBsxHgq7dGu1uiqK4g6WmY2Oj9ZwWr2l?=
 =?us-ascii?Q?AUSZMCgqKPIggQZKeHsex28J3GHmPrjx6lPBQOWB58gMe7NAjpaji4OSzHcJ?=
 =?us-ascii?Q?HyASTNw9YcPgnHHobD4NHEWR9C5ngnK6MYIYl0gr4a/3/e1J3BU54CtYKP5w?=
 =?us-ascii?Q?YC49b00w+DSFGpkGcvrjJmTNT+R4lqHVpaXKZhcD+bC5D2HzVPWbnf3m2uMH?=
 =?us-ascii?Q?69/o73BM6A=3D=3D?=
X-Exchange-RoutingPolicyChecked: WV6UN10GYFKpYXJO+fShbT4nzptABM5AxmSlX7rPqkkuzsPRtQYtFC0Sbwxq0qQTniOjX+Yq4Nx/alAxjLPC/0dg0PKjkqc3k8ylLjH5nDGkvCeNbei8gdqDamZWn2F6xm78XnwSEcSY/MA42G5DRRNitAQG3osPRH7zGdBUlX1OmSg50CnBC0Gh6VDpIIaCmEKrd5Id+Ua9eh9dM/F6cd4Wto8tnFXYqcE76fB7QmlPwD0sm5L9GZb/PQP6Z7WFUjUbRnwUSUPK3jzTyoGioZl+hI1qS7jTgwfTO6oTIF2BU0XkbBY+2ZOXfW3AubQf8s7qUka/H0AIwAlYjN8w6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7671d401-f120-4a4c-7b1f-08de8f1d0e08
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 12:00:08.6718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/SdR+YnIe2p2ACgYEvFNTXR5lDQfvDXd7mV7pJnmeJ9DvKSrHLJ8jVvlP24NMqzvZbmhTH1OeIJRpTMqsPFSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8112
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git tmp.perf-tools-next
head:   02288074fcf09dec98dcb3fefdada4ebb4a91d33
commit: 7eb9876f1d9fdb6f6a8ed5737452178ca2169205 [9/10] perf beauty: Move copy of fadvise.h from tools/include/ to tools/perf/trace/beauty/include/
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260331/202603311011.IoMYrQLJ-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311011.IoMYrQLJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603311011.IoMYrQLJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile.config:576: No elfutils/debuginfod.h found, no debuginfo server support, please install libdebuginfod-dev/elfutils-debuginfod-client-devel or equivalent
   Makefile.config:963: No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev
   Makefile.config:1159: Rust is not found. Test workloads with rust are disabled.
>> grep: tools/include/uapi/linux/fadvise.h: No such file or directory
     PERF_VERSION = 7.0.rc4.g7eb9876f1d9f

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

