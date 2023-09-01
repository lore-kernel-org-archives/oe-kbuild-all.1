Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46F7AD3F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 12:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693573061; x=1725109061;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qVlpE3M5eA0CTOKYefYN2axFic/lrW7XE5Zz5PcRYYA=;
  b=nNcI7cg2to5aFaL/lSrGLpJM3Yf+9JES5t3TFBZpGpjqraISR6oFkc0P
   xf2A4TVg5LmkQis/Nis1GOm2nwVVx8jIMsX7TYYOqopIcDIo4VAuqmSrR
   bhCWVXYD4Uuaj466djXk8Ipi6CMO7zZo6F9gvb1IRNkW4FxD/yuHNh3Fl
   uJtzB+XJ44xDbs+Z7vKyGidvZKWXn7A3Ba1wmVaDiixzY+F9jrHpO3TXR
   cpZiLt5M9l34wOx/lP4it68V2s3nHcqj2OZctxK1DxEpkiHvU7pjDzgED
   EmWwBl+msa2iA+JcijTP5JWQASUqTm2QVF0j+7ZadGB11rh9GOUw6DmxX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366439140"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="366439140"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 05:57:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070739644"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="1070739644"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Sep 2023 05:57:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 05:57:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 05:57:40 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 05:57:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZMGnHKxek/CQc+EEcsI88+YbYf5DzDWcDoPpFWEiT91g/lM2CWyKie+j+5WtNOXchTLeb10/zl1eMBs6WXmIAUhLbKjMnwIRq/4S1UOrdE6f/HRenxsUeFnf6TOdgyk3sb608dkuM9o+6P1G0ZUpMMX+ijAd+z7ksPR7W+187dbkDcxbthcIIFdbphRlRrfqkSB7IbGk8vh9x0dTlpGouMUV7JUY/Z51Dt6+Bc+FmNIFSxl8XNF+KcGCnU1BiHBMoQfSFiu//wAcYklAqf/iEw+XCVMtu93uLAgy3sUwJQTu6dSdQxECzLHU5mY1m8vHv/vhYZaiczLfwjqLcA32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/KXOWGBUDlLqwVTSUyGYqMn0pVEK0rFN/xlbD8dn8o=;
 b=fow2KzGLRFBZHI1TCd+25dkHqUdzdWrx2P5m6XmwUA3sECrg3ka4XO4J7J0XC6o+H4ETaDnXNZB4CK97U/XlAeaj/yc1AI/5nsXkDzAio372NFWqVLftfzF88qHe8Hl2W/k9/r3h3Jk4M7BBRxw8qIyFW8zzu4xKgNaWME+6M7TxDRVSPhm3l1fWnkfFzaKifPO3YjvTOwpmLeemyGcAhUlbK+5ovIKxMkfkhD3AZguKPLI4aLmsyi4S/O2Djc90MPoVFOSwOEMT8NuSWq5qUIboHu0KpndNiKwOZ5dCg1Ll3vwEioZMRTc2CU+s2KSEwvwYT48iXSLzvOUsemuUGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by PH0PR11MB5048.namprd11.prod.outlook.com (2603:10b6:510:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.27; Fri, 1 Sep
 2023 12:57:37 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::3130:de4a:9f73:a5b6]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::3130:de4a:9f73:a5b6%6]) with mapi id 15.20.6745.020; Fri, 1 Sep 2023
 12:57:36 +0000
Date: Fri, 1 Sep 2023 20:57:26 +0800
From: Philip Li <philip.li@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
CC: Eduard Zingerman <eddyz87@gmail.com>, kernel test robot <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [bpf:master 6/15] htmldocs: Warning: Documentation/bpf/btf.rst
 references a file that doesn't exist: Documentation/bpf/llvm_reloc
Message-ID: <ZPHftmH4tvcYObbc@rli9-mobl>
References: <202309010804.G3MpXo59-lkp@intel.com>
 <6a92003b-e47f-01bc-57d2-d2fb30292ad0@iogearbox.net>
 <a62b47218f1852d09b243b8fb1741c2baca4d336.camel@gmail.com>
 <5009129a873cf20adacd679d5073c799f79672d2.camel@gmail.com>
 <5ce81342-c565-f7fb-1c93-ec4eac8944c9@iogearbox.net>
 <86cd932cd5a6ecf44b3d4dfd2b9446bd721d9e78.camel@gmail.com>
 <ZPHXqAUX6aLXp9Dy@rli9-mobl>
 <d4c9c399724d2465945d432ce658ff2d9baa296f.camel@gmail.com>
 <ZPHaBGXnnNI5AX3y@rli9-mobl>
 <43eb35e8-c00a-22e9-b4a4-dd54b1fbd63c@iogearbox.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <43eb35e8-c00a-22e9-b4a4-dd54b1fbd63c@iogearbox.net>
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|PH0PR11MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: ba744214-c309-4bd7-4e39-08dbaaeb0403
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5My8cFMFtviJ8oF550tkXxF9IUyjr3rHwHB9GG4s3j+BnE0Wx18DLcwm07H7apiqyWScaHx1J1P9Ivrvpw2rGLWg6YqrE2PnUQUQG2oBZDESfTa1B2OWrqqT1hrSpjBwMWqYXqnCYwk+bi2LDfG2Jr0UOYOYllTdAV2xE4BrHLGVRIG+jDGFODf3694sKuC7lJK/22gMHFDxFHX9mSi84+AQ+S0iqATeJwMeFg1ryQYah/AQ2Qk+y/0fM7gA2Dxt2SnZ/BtQPlEOw/PmoOL5wvFFsVHAcdVfn31DMvt/U3MPYG8fjbuXJFfV2IuTx7iFJyteh1j/fzy92uOb8z889nsF0qLyXJ24TB+YnQH9hcyxiYQd96laSyprKJJb7s/8ac9TrbngbPzPBEsT6fqhy11XQJ9iEm/CldhN2W2tMH2THrElNyaQMkuRiebSuiGWAguK8MJUqX5+3aRpEphIyaBI/cYPSAkP+1psVeqEesJrTg1DZKXWiFCz1jcLf8o336DDRLOgzadzaM/JiZbjjuD6XZlFueG06fNanE0MzRsGQF81+3v1++WaXcJ/Iur0UvE0ZfnPfpQBTonjLi19ow==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(39860400002)(396003)(136003)(346002)(451199024)(1800799009)(186009)(4326008)(8936002)(8676002)(44832011)(6916009)(86362001)(6506007)(6486002)(66556008)(66946007)(54906003)(66476007)(966005)(6512007)(6666004)(9686003)(478600001)(41300700001)(83380400001)(66899024)(53546011)(316002)(26005)(38100700002)(5660300002)(2906002)(82960400001)(33716001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tceElbi2rqtIiuBDdxj7mU9SIgAeJJtKPRnt/czOf8flLEHmLrjlSCyt2FR9?=
 =?us-ascii?Q?743tdG8rfQIPipKO/L4HJASEjAENteHJAA1w5AYhSchLXWxR8k16eTpUT9m4?=
 =?us-ascii?Q?cCDmBqIsJCCvJY8c4OjH7Lv11/fWhobdhgyRGapqO5XqiHV+47Q4D5fnaBWg?=
 =?us-ascii?Q?mQ2YIdmXN1Jb3Q0id9Evb+dIR5O4Tegl8N1wD82wrR9z4PMorvdxuV2Q4VsS?=
 =?us-ascii?Q?DqQcOfMJnoK6eh9h/YOmPkpD9hDiXP+dmUaWP8M1PhbV09erbqeU7T8lJ88i?=
 =?us-ascii?Q?WgPJLjxd1uubm9BTuYQcHJUUTz0XrubviJxadFEdqsMGZxANtfQXc8ZDohWS?=
 =?us-ascii?Q?DuklNB48Goad+XkLu2v6AlDkgGQyvrwbaNPqhrXhJQrMfQEdHmVoRj4V9thk?=
 =?us-ascii?Q?GGB9UBxmz3cPiLFHCgREZxapmi/t34CFGh0Sl62E1waXQVj4QTzF1gSGUT/Y?=
 =?us-ascii?Q?JfvlgLLoD9d1lrmvl+Onf0mzTt9Pa/N4tJnFgMD6Lx+JqEFsfECINjVECRBx?=
 =?us-ascii?Q?BO6KvpigoNefei74bEaMYMeY7uxTyGiraGZAFUkLddMrSjCOuA9gK+g26QYq?=
 =?us-ascii?Q?AbG3vQLLmVamgb7PgI0j3uT4OgUNDpGN/r3tgKGBQmtjrReTkXrLq2lisW0q?=
 =?us-ascii?Q?Bc73WMCUFrwmGjUnhomZsI8Ta11C7alX4NEtEWdLDQoMfy3RhdJ8lFWKL8Uj?=
 =?us-ascii?Q?On1J47PpxwcdveyfV89r+BMOg+F0rCIsaeTcKk1MiTBppFaRI2tJ3cnYlp3m?=
 =?us-ascii?Q?NqR2ND0JTEdB4+Hi4B0yDg+7k/ohqHxR+8z9EmoaMGS3gOOkJLDjNhezNXmq?=
 =?us-ascii?Q?agEI2tG+l1qbSDaEyE2YWnESdRnI8oynHFv9ftNoIw+7gjJRr6CPFW2yXink?=
 =?us-ascii?Q?hPbdCiGEcNtH6Eifa+kQhkkdv7ALd8P5vWXlFzlS7DWKBK4+oxAEaP6flP6D?=
 =?us-ascii?Q?X5IsIIrO6+TZO9doWsjttBrZXmV0cyRXnQ6wyZROzbkZm4r931YPQ4a8utgq?=
 =?us-ascii?Q?JQ1OALVoa+VuTxipVtN8MrLjrLbsZ+2ZwDoLzxVzkSL3tykF2HEdESxER28M?=
 =?us-ascii?Q?f2X8SplUNt3W4BsU6/Y0UuL4WX8Uw6ZcHH5VICX9YW7D9GGOogoRqCL/tA8d?=
 =?us-ascii?Q?CU/SmHnXzgWbdvMHk1P7lFcUoC0jm+9SVcIGgVdfj85xpV6lAk87Q2jvFSkA?=
 =?us-ascii?Q?096vUtqD8ZrJnoACzmavjFzX2K5XaJb9dXP1LSUiI/XT20onKA7EO35nAmM4?=
 =?us-ascii?Q?ydsjiMU8S0GHwX32ElDFAOzCB//7E+uxUsTKOV//jhccdCHZS9DF5uGx8YHD?=
 =?us-ascii?Q?ltAcFzjs7NQB2r5S73snOJpIT0RwinMgvdv8kCWpZqQrzdQSi1a2c0WQADJV?=
 =?us-ascii?Q?Ic//rhA3irDSDqiNNT4EaUXoOgt7zMALVzi4SC6JX+9aV+OvYmqjaertmO5T?=
 =?us-ascii?Q?Lwaqm2xuz7d0PxVloTSbkeA5zbrZkrDAeQE81yOiU0smhH4u+/E95PkX4+3f?=
 =?us-ascii?Q?HpKRPPzbQHe9ZO/MmQHk2LfXdYzPR7UrJzAOmgt/7R+yTKGU9SKMGsfQ3a4f?=
 =?us-ascii?Q?6vSM7ljAYOMZ2bDlkZb4I4e7py5tVB6D4m4wahUl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba744214-c309-4bd7-4e39-08dbaaeb0403
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 12:57:36.7839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FUIA0zfqDrSPgr4hRia5v4ke7kMVu2EBJZ+8+V5ML7mP4OX5Bvxw4RMWCudtM2fFcDHrT6To5MtrBKHaHoymA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5048
X-OriginatorOrg: intel.com

On Fri, Sep 01, 2023 at 02:49:32PM +0200, Daniel Borkmann wrote:
> On 9/1/23 2:33 PM, Philip Li wrote:
> > On Fri, Sep 01, 2023 at 03:27:19PM +0300, Eduard Zingerman wrote:
> > > On Fri, 2023-09-01 at 20:23 +0800, Philip Li wrote:
> > > > On Fri, Sep 01, 2023 at 02:48:26PM +0300, Eduard Zingerman wrote:
> > > > > On Fri, 2023-09-01 at 13:22 +0200, Daniel Borkmann wrote:
> > > > > > On 9/1/23 1:18 PM, Eduard Zingerman wrote:
> > > > > > > On Fri, 2023-09-01 at 12:26 +0300, Eduard Zingerman wrote:
> > > > > > > > On Fri, 2023-09-01 at 08:29 +0200, Daniel Borkmann wrote:
> > > > > > > > > Hi Eduard,
> > > > > > > > > 
> > > > > > > > > On 9/1/23 2:05 AM, kernel test robot wrote:
> > > > > > > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
> > > > > > > > > > head:   be8e754cbfac698d6304bb8382c8d18ac74424d3
> > > > > > > > > > commit: be4033d36070e44fba766a21ef2d0c24fa04c377 [6/15] docs/bpf: Add description for CO-RE relocations
> > > > > > > > > > reproduce: (https://download.01.org/0day-ci/archive/20230901/202309010804.G3MpXo59-lkp@intel.com/reproduce)
> > > > > > > > > > 
> > > > > > > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > > > > > > the same patch/commit), kindly add following tags
> > > > > > > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > > > > > > Closes: https://lore.kernel.org/oe-kbuild-all/202309010804.G3MpXo59-lkp@intel.com/
> > > > > > > > > > 
> > > > > > > > > > All warnings (new ones prefixed by >>):
> > > > > > > > > > 
> > > > > > > > > > > > Warning: Documentation/bpf/btf.rst references a file that doesn't exist: Documentation/bpf/llvm_reloc
> > > > > > > > > > > > Warning: Documentation/bpf/llvm_reloc.rst references a file that doesn't exist: Documentation/bpf/btf
> > > > > > > > > 
> > > > > > > > > Could you send a follow-up fix for bpf tree?
> > > > > > > > 
> > > > > > > > Hi Daniel,
> > > > > > > > 
> > > > > > > > Will send the fix shortly. Strangely, I did check this syntax locally
> > > > > > > > before sending the original patch, and had no warnings reported.
> > > > > > > 
> > > > > > > I followed reproducing instructions but can't trigger this warning,
> > > > > > > tried several sphinx versions:
> > > > > > > - 1.7.9
> > > > > > > - 2.4.4
> > > > > > > - 4.3.2
> > > > > > > 
> > > > > > > I'll remove 'Documentation/bpf/llvm_reloc' and 'Documentation/bpf/btf'
> > > > > > > labels from the documents (and these are link labels, not actual
> > > > > > > links), but it looks like I don't have a way to check the results in a
> > > > > > > way compatible with test robot.
> > > > > > 
> > > > > > Strange, perhaps LKP folks could chime in and provide some more guidance e.g.
> > > > > > wrt Sphinx version.
> > > > 
> > > > sorry for late info, this one is using 2.4.4 sphinx, the full make command is
> > > > like
> > > > 
> > > > 	make W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 SPHINXOPTS=-j1 htmldocs	
> > > 
> > > Hi Philip,
> > > 
> > > Thanks for info, I'll keep 2.4.4 locally to be in sync with test robot.
> > 
> > You are welcome. For the robot side, we actually read the version from
> > Documentation/sphinx/requirements.txt of the test commit.
> > 
> > For this series, it is 2.4.4. And we also support other versions like
> > 1.4.9, 1.7.9.
> 
> Side-note: @Philip, if it's not too much effort, would it be possible to add
> version info into the reproduce file as a # comment in future?

Sure, we will implement this early next week.

> 
> https://download.01.org/0day-ci/archive/20230901/202309010804.G3MpXo59-lkp@intel.com/reproduce
> 
> Anyway, thanks everyone!
