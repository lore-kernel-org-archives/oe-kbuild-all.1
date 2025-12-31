Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200364315A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 00:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767142177; cv=fail; b=bzaZITZ/bcb8xj6DUePpDY8fxV3kCoM+lnrPeZqnh7ex6fMjHUlGRLw3YmCMJS63zpx0nP9GQueMjFTVP9sGuU9usJxFh8j1rjv6TnZIrr6rYNaIYFuviTsVrMLx7tsdDGXxD1yVZa+pbuTOUSVrr1ZoIZlcPd+awJlD8kRilzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767142177; c=relaxed/simple;
	bh=mPIgwiCSF90QUeFsH1KAisjkRqwpWu9sZ2xjQT3Bl8Q=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XE3yvvVB36Y1+A4PMoZeCZf4/y7owdksM5aj7f95pLWrm6gAZiJYI694BaHQs91bYtg9oGYi2WT5u9+AooLqVrsTPKgrDVcwKihXoJxAjRdYaX+sun8rPTBHqkG6RWA8CPGDAYuCSisWSlEgsDlYvlOwWED/dN6Gy3GUNeP3sKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IT9yPh2V; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IT9yPh2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767142176; x=1798678176;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=mPIgwiCSF90QUeFsH1KAisjkRqwpWu9sZ2xjQT3Bl8Q=;
  b=IT9yPh2VdmuqcGrHxNutfOUA5bqjdJnz4eyhFrngocuZNoDwGK8wLX8L
   bvLiNG1Im/ausg625XtbejUhq4mhGCKe5deHzg2AclXMS6ymxBxZlGb5H
   rogoFP9kM5yuSWRcWlQ6k2YMAd5Ph7lOBK7YmDgI5D4zzgsGJCRqXsCcK
   J7z7Sv043bxlMbfK+OSBoMphQTBAIJo3P2tTGSxYBYACsvWFHI1b3Atgx
   yhExEe9+QczAucOnETHYxqbFg7O4jBaotidacOEJ/VGQat/DZOWAPYRFM
   43k2wuleD0eB69T8L7rhIn7moeusWYkb8L02pSFQ8LktCwwFz7781deLw
   g==;
X-CSE-ConnectionGUID: gdKj0c9TR9CLIpKWeU4U1w==
X-CSE-MsgGUID: +DPhU3NaQAWlWculOnTH5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="79451428"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="79451428"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 16:49:35 -0800
X-CSE-ConnectionGUID: FoUHAFCBRqyqMnlwsk2ROg==
X-CSE-MsgGUID: CDVOWfVAStuvaHq5y7S3dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="205475366"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 16:49:34 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 16:49:33 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 30 Dec 2025 16:49:33 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.48) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 16:49:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnuUC1fuQCyJ03KVcTU16fbqFLykIjUU3BunX5rnkWmcGr71/DH89hPQ9MHztYTgREJmxT81DjCmpaTQcC82Llt4xELh3BesCQmdDLBUxLxZpXxWH3rLR7gkOj9rKPDr4mx0kDq6dLh1c0LF+mVFgmo4WGgudIzMqLEYY7q0MlnjauFI97uu0Q9ctBXfGimRl17o1SZz9ByQb+QY9qp1zpJgBjF3e3ca8TcuZSzs0MUhPl7cFEsrsNKw67TmoJQLgy0MiHNxEcEcvidcazuDUHP8mq82aFmlNfCyW1kYep8uMsGFIMH4sTxUmbqLMnz/Fvk7hovgRMAi6wn6T3I9Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krEq7ZujyLzrMxK3k+2J2uZZFwiycxzoGrvjn1DcZ44=;
 b=y2IcbWm1U2pE5qY0EqvBCBKg+fPZj6Kd4WT3Pr8D3Mafqf3zo310DS/N0rO2B/kSDWCWER/7eH/YVm2IQ9S5hyry75arnqQMzuEKoNZ9PjJ/NU46Z689RydUpMKzQvDd/2ezloEwPvGfTJ5xRVwqA21+gjFsn7kdKkkRzmNTUX4CRMyhyjltfhL4cyS9EZVbdjEeUQFR7vhaw3PJGqkD+PtdrSIu9TT8pnO13ZpQ3sydP1HSj3uiAaZjRXEb+pz49yUbEH1YMP4x/LmCQmyWqSOW6lFLqCmQRki0S+xHocQ49Ni0xS2BSYIARE4UmsZiP2+vLj3UJx0t3VqKFXI4hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by CH0PR11MB8141.namprd11.prod.outlook.com (2603:10b6:610:18a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 00:49:26 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9456.013; Wed, 31 Dec 2025
 00:49:25 +0000
Date: Wed, 31 Dec 2025 08:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCHv6 bpf-next 1/9] ftrace,bpf: Remove FTRACE_OPS_FL_JMP
 ftrace_ops flag
Message-ID: <aVRzDpb/FGE26HZL@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251230145010.103439-2-jolsa@kernel.org>
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|CH0PR11MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a08a9b-43d0-4c2c-8779-08de48067238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q6mj7v8XgRpLdIOsx2Q0OlWFUfRuUrdCXjVTgl6N/Xv9TX83GJixkdBxoacM?=
 =?us-ascii?Q?lix3B6CgtAvFf+ozl90lfv1ZZCB9UsHvSacamrjvnsjM/GUC9lrQbUhnQLdE?=
 =?us-ascii?Q?aRMT4hCcNsBJk8RZ/YAIYS/nFsmIHgAFox7SLkjIZQW3NUsx01WwW9BLfIyc?=
 =?us-ascii?Q?/3BFwHGtQqfLR95rsPY35Gn9EkD4foXil8Ata/a31anhlUYb1RyLODa2djT3?=
 =?us-ascii?Q?0d0C8ky4DUJAai1I+ZVP2r7rcXdocRDc/AcKU+IpiugWAUnTbMCXW7cAhSC6?=
 =?us-ascii?Q?OMz/hPMvvHpMtlL+fGD7Ux/dfmatVZd7eBGLmq6xm5J+Eh9I1CLJj2UzNJGJ?=
 =?us-ascii?Q?vUL1h8WEG8BZ8pmrksu5bcX+d9mBGYSzzJy+/YIGJ3x//oe3aXeRYiTmuOiz?=
 =?us-ascii?Q?EnhN+TXZCoyA+vFbm0pC14JKxP391L1aslmV1jlJE9ox8clFaOj2ntp7yyRH?=
 =?us-ascii?Q?2YMwwFSyuXczbCpj26CIB0pUhhXzDQg9J4rindWZjQyVYBdCNegCrHRj93kV?=
 =?us-ascii?Q?8Sqgl6ZE7oQAcJAhDixHYOdEz7h6d7UJoqKO0xgOnjATJScoXUFNUEl8fiAg?=
 =?us-ascii?Q?gWf9kcl+Q3rdhOYLY4s0G8f7N938x/BZsKxt8JNEs8jWmde9t4e06P6xtIGg?=
 =?us-ascii?Q?uP+nlFlqX9v4npqiZAFR7Y/Un9gNDQEFW6Rt8AkTwIhaf8VyO5/gOGGPvaR/?=
 =?us-ascii?Q?FYWDbJfFBVeQB/QnIFF48en+RuOu9yJob4FI/OvMgnyn5k7N0Gtk9qec1z2c?=
 =?us-ascii?Q?sa9rINB5V011KGCrHmViHAxRAf+QQa82zhLKvQzFVn9G+GvLxsOU/hx6TYTZ?=
 =?us-ascii?Q?LlpU6aIxIWbVNw+FrvYgcCD7dbf8tFOEU6tnchlxXCWvnGUAJKM8Fdp/5DPQ?=
 =?us-ascii?Q?mFPp4r2c4KFn6xrKoqmKLninJ0nIRrlIzNJ2u7iGkO8cYVKGPydAEp4EPt6a?=
 =?us-ascii?Q?gA5hJNibp8E4Y4NnSlE3Y3tFr5bMFptVa4RGbCp9wlJznUUgsrG8u1Jy2yy5?=
 =?us-ascii?Q?93kRuPs7fqU+XsqHruU7l/LCBTb8+5x04jjeNuCBfwfpgtt7l9D6gn51dHt1?=
 =?us-ascii?Q?GOM6QQQMdPTG0Y3FwbI98U/R0E3nit32zpyeQcaLG9AfMHzgsgY2gizkq/fz?=
 =?us-ascii?Q?qe2O7fpQzyygQWGZHIiDx4Y0soTHIXSMKl2Z1WEw2VLNXPcqlvh9jx92ou9B?=
 =?us-ascii?Q?Jvn6/UDl92nqZiXt2ZTfE41h8wtY1FqmcvP++HROHO/O+RC019vbdKbSbgZr?=
 =?us-ascii?Q?UZ8Ye+Eavubk4MjCPJkG6RTBCprLiiCpd/BHE2Tj4kE/Fx+qps5CNlnZb5B8?=
 =?us-ascii?Q?TIMRgist2G5efBswI0EaB9iYguCWSMJTHZgmkS5VCIU7BLwi/yv6ISQcDV7v?=
 =?us-ascii?Q?F6+lGj618DX4e5DfFQfv8WJrv0LcsFfb0nCKNx5GLtH1ujLzmTdfqUf2lHY7?=
 =?us-ascii?Q?mF/b68WeDCgFpkCXpD/bEVsds9pxTTOJkLPCX8z4SjXar38JR8/trQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4MmEncHsO9HaZLU5QaS14up8qBxdBMI5h4OPYg/AnGi9Hn3gfvp9Gpan2moM?=
 =?us-ascii?Q?KtzQ2paXEHdJxnj9kPXLGcGW6k4VsucrIoywqnUq0q0J1/bAqwyetSTcmnhS?=
 =?us-ascii?Q?kyOdDmZsYzVJxJ5uKLuxrZULSvWi21OMwPBf7c6H/kkni78MJGE9dCfeqcMt?=
 =?us-ascii?Q?4HdYpG6OZBtlkP8Vu1kmW4sMPpxyJh1a1Mbcp2ExUnr4SgWdk0Of4UjqS/gX?=
 =?us-ascii?Q?hcTt/uZWhR8zepZcfMJZWDy2KGTXfS5T78HO05STOcRSTU3Mp/g5PkHztzE2?=
 =?us-ascii?Q?EJxsRbKMXd9k3Ylq2d8FIsag5MvarB/U4nrryk05p+iVnp48NVR4H5lKn1GH?=
 =?us-ascii?Q?ZCvC3RrjmyNPBKVl/ZhJhA5BA4OGT7PP9g/15CHFfUyb6uE+PO2yoxHwUowN?=
 =?us-ascii?Q?0pj1o049cDQ0sbyUBvQE5L1yCqP/lOy0zyZOyURZXRyHWF+CYi9+2YgtuvaK?=
 =?us-ascii?Q?oe4wBTdEPa+s997CZkulFrNF2H9PauR8G9aMMIAsBwHClkua0d1ABtIUVQIF?=
 =?us-ascii?Q?M4Cq5JUr0R5F0gs31I4ljLyhxu/VNYUjVwHo6lI+l7VcV1ew400NOlJ20qRA?=
 =?us-ascii?Q?hjirPBYSzYyTqkWvfSHQBAnSBsHZKA2rOpb+9K4CCQu9PpdQtLwuXmgQhPWf?=
 =?us-ascii?Q?vEjwCD03gdKwh1c7quJybRgR2isD+ugCWmbxihTDA/pN+2h5EfFYF82NvvG8?=
 =?us-ascii?Q?MQ3TGEAjQVBoxTIGb8M0JCuO3T4u1T1UrgQN6vncdq2I2zh6kNktRrpremZK?=
 =?us-ascii?Q?oD0AY/9OPvv2TfORYyX5Zd9lm/dQ+dezKlHUEJ7RCNPe2ah4eWxgeCK2+lkT?=
 =?us-ascii?Q?w8tE03sPWdYMeqh+22hhv9XSVT5ktiJQLkpcWnV8+JlJWdoqAYeCGGUKIwKM?=
 =?us-ascii?Q?D8ZVhNue3t0SKd9SsdmVjnE+wvGYCSB6psgtr5fvmK77Qvn4Ul0LaX9s8Y/z?=
 =?us-ascii?Q?dk6k2S2i6zGBQmFD4cUxHDD9eiHwciWfL5rJXE9e8lnwyVSIyYWfq1Al+OyQ?=
 =?us-ascii?Q?NxVkCSSRtaoo8wp29n/2TXioxf1Q/5ipudOtjXAYa9dJ9GyU3NkmCzs8gxup?=
 =?us-ascii?Q?XbSqRt9aRNZV6d88xG5LBQGgkStn0SPzXY4AAx75XE0BBETDDy6YkAC4ecgk?=
 =?us-ascii?Q?gkfbdxnfY4XYWFTBdcXaP4EJ77SZNZsoXvBUSr15dkNbb/arSaNeBf7X6azS?=
 =?us-ascii?Q?Nq21Q5GkEp4zxnJSlJ0FwnUzIUca1kfsVKhizee+7YJrb6LeHFdePx++mha2?=
 =?us-ascii?Q?tCtY6uhZ8j996FsiDiq+XbMIS5aahhRy3gn2H7O6Nol7VF7EwyH0/TmbJ+4D?=
 =?us-ascii?Q?m3nvZwkjLK6PdD4r0vR5k66PNGHj5mLPYVrcv6nhQazELUZW+ciB2IuaDYTa?=
 =?us-ascii?Q?PeD+Y8jd/SDOKxxIf+EWzCFmwlhIW4hFSB5ydVOc8r0bq4PpTOQVRHMySSPi?=
 =?us-ascii?Q?8AEsILO5ErRvfVGLYLASgdGMGoTSUs4l+i3CQt36U+I9AvLS1vO1cYoMa3ki?=
 =?us-ascii?Q?MK0AXfJ9bNft22DUpByAooUKkoD5iJNZznUQCueOS1Z2eIBOj+ghXOkWQdyC?=
 =?us-ascii?Q?BO0c/bBU1o3hDmoFhQU6hcLW+CB9QPW2ebrjaX6TeHMyGVduAKQnu6+am4qW?=
 =?us-ascii?Q?BebD9c6yQWE5qd4Jt2EkJk8AFl9UmyfJDkP+FPHmdv7md6+a0bPzd1c1gI6J?=
 =?us-ascii?Q?mRWyNN4Tx/iImyHQZZzJLB3vx0hRx5hG1g887IharE/Bssi2QSZT6UuwdOR7?=
 =?us-ascii?Q?izqfbjiBCQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a08a9b-43d0-4c2c-8779-08de48067238
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 00:49:25.8599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0eKJNSIjxxGFXuNvRA6hPx0bNIM4t7gsFumc6L97ZRWDuSjIFLv+b1zQIjqwg5EK9EnXi4SqkLLm1anvwuncw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8141
X-OriginatorOrg: intel.com

Hi Jiri,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/ftrace-bpf-Remove-FTRACE_OPS_FL_JMP-ftrace_ops-flag/20251230-230824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20251230145010.103439-2-jolsa%40kernel.org
patch subject: [PATCHv6 bpf-next 1/9] ftrace,bpf: Remove FTRACE_OPS_FL_JMP ftrace_ops flag
reproduce: (https://download.01.org/0day-ci/archive/20251230/202512302154.FH3UwBYy-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'be'
#12: 
so all could be be attached via just call or jmp.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

