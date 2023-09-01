Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323E61FA9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 12:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693571605; x=1725107605;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UjFeY+Bv/Ji/Fk4V4XrPS6gYXaO2yy2izwWbKPFSb4w=;
  b=QRaLnYUHpBGh+3xuXDy6yxQcqRRJJc5Or0D2sCE/mE5mtP+FpvafZYvq
   CXIoMzqtAcovqVoEQ1dpL2moi1lVxJUEcC+vZ7EvBWNU2xpP9l/w7sq97
   ENy2kZuaQDrYpZcDsxiAah7em47w0kbpVy0IvoyTOoAKndqhayg/c2mSz
   FU+JRnKqhy+QhC6t+RNw4j18r4s/AI/uY9VFUgPHMwzvAYG95L50WZkpB
   GSbrZnjpVTxzhrdg+OdMmWKmIQPbG034yaD1lq+idJ2sOmb3CHEq0TrHh
   EhdCofJJBNZrWZ+Y1N1pJDE0yqc8bTO1lAAMw/AFNRJVTspd2jwhSnR2D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442603422"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="442603422"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 05:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070734138"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="1070734138"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Sep 2023 05:33:22 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 05:33:22 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 05:33:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 05:33:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yx/9GxBFvjtzh+rmsKMTX7PJFRScljSEAwF5BzB4KcSunMs9o3n0wFEXIlyHsMsnvS/1GRnCIqa7MsdiZ/Lsf/Y6sOLL2IC1qQeq4OMRJ77VTLpKsBrCOhxt60HPCcs4o7VNxJjzLiiMbbm+qYMGwxJWXlFmRgeBhHHgJQCR6xZiegIG3en05Uru9XsJxIjbgoxAfLGuDL6goquSTRmziEg52BVP/NOXt1HHHfVTQagrI5YK/uuH2l+tULa3JUp/ugEOVUOvq9plmaC867DQI66CjLh8mp7Eoz/24j+cNk9eIDxe9KuSwwr554l0vKrw6mm5os5keyWJO7AfJHfxfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+//IFRDAlYATMggeWZUn4R8ayy4ZJxvyQUPgKXdYAg=;
 b=jb2aRFNv3dDOFjAzoYgaLze7qIXvqlvbZ6TPrSZuRpXpVZ1f9hu0uR9NoUHsS7Pg5Q/NsuSlYlc2W7IZs7qhl+eFyjoUWcgVzbE0lBdwAqHRFzK7PsmVAfpRnG185d4+S7MQRaW6bkU4hFlYhZ+d/M1VqHnnUA5xaiE3L1w33Qj9eNyVpxtN7K/4TlFtqnax47tNkt/iSPOtMfTSM1YXj2DruEsXYG96TysvuHlMojW4OSLy0rBEKNDmJF/mGAr7KPPcx9P8EJJx8pSIdUO2xKmzW+tgdYC7u+nS70f50z/Ll0mC14dotCphdgBMl3byiRAvhyvdgrfTK7f6/EHSFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Fri, 1 Sep
 2023 12:33:19 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::3130:de4a:9f73:a5b6]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::3130:de4a:9f73:a5b6%6]) with mapi id 15.20.6745.020; Fri, 1 Sep 2023
 12:33:18 +0000
Date: Fri, 1 Sep 2023 20:33:08 +0800
From: Philip Li <philip.li@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
CC: Daniel Borkmann <daniel@iogearbox.net>, kernel test robot <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [bpf:master 6/15] htmldocs: Warning: Documentation/bpf/btf.rst
 references a file that doesn't exist: Documentation/bpf/llvm_reloc
Message-ID: <ZPHaBGXnnNI5AX3y@rli9-mobl>
References: <202309010804.G3MpXo59-lkp@intel.com>
 <6a92003b-e47f-01bc-57d2-d2fb30292ad0@iogearbox.net>
 <a62b47218f1852d09b243b8fb1741c2baca4d336.camel@gmail.com>
 <5009129a873cf20adacd679d5073c799f79672d2.camel@gmail.com>
 <5ce81342-c565-f7fb-1c93-ec4eac8944c9@iogearbox.net>
 <86cd932cd5a6ecf44b3d4dfd2b9446bd721d9e78.camel@gmail.com>
 <ZPHXqAUX6aLXp9Dy@rli9-mobl>
 <d4c9c399724d2465945d432ce658ff2d9baa296f.camel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d4c9c399724d2465945d432ce658ff2d9baa296f.camel@gmail.com>
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|PH0PR11MB5175:EE_
X-MS-Office365-Filtering-Correlation-Id: 399c0362-0972-4e4b-46b4-08dbaae79f16
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZDD4c6vphEFvoerHF79Zo7LQ30qERT9ZdZkD3RMeFOXLGnoJp0SmA7EIpiALyseUNKdK+3qz+zlNDNIG5nqXzM7tCVLB+5UQ8Dmidl2yDzGM3OcwBfnOj7SGDCcg4Xa3gb/ky03fwrcXOtQ1UOCFkrAqA4MrJofEa+bqpzfVG3ZHw89y8u69u6o8l433z5q2XMvCpKuuB0fp0PamgptOLtax+wmnhiM+DYGZz/WXvVTS3FRevlR8tieOtLdU1s22gxH6TNpXJh/Dgfc6hnfGFaHZDUZ+6ayOqkyfLtsOF9dVf6xOGLGlDCKEiW7xGshLMlCDLLfnvx5lLtVH5cCrcNGERRZ2s912vdglYeKoaSgjFGYOaBzyvxTJo4zyUbofR3PhnlS6co94y0SEDhScc3CxVGyX/AE+OgkS7zKDUMthvVMxOAHpYIaOfVflz5geeO9IPmdD4i6/hZKgZrxq1L5/9jlocSOamQcJr9o0Tnub0/dsOWE9eXuEJqKhG0nzNe25A1tHCi9YitpyFq/7yIeXLORCVctNyC+ImmUfoXUa12r688NG+AXJkHEm6Xqdh0Zua1Tx/o1JKZ2nc6Z6Sw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(346002)(366004)(136003)(376002)(39860400002)(186009)(1800799009)(451199024)(478600001)(8936002)(6666004)(66946007)(53546011)(6506007)(66556008)(66476007)(54906003)(6486002)(966005)(38100700002)(316002)(41300700001)(82960400001)(66899024)(9686003)(6512007)(33716001)(44832011)(86362001)(8676002)(26005)(83380400001)(6916009)(2906002)(5660300002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EFC5A070pTR4GgDX+HRB+kOn2PXYXMPGqNX/LvxraQP235ez4xoG5p3ao8vu?=
 =?us-ascii?Q?h1eia/Kd1vqqj8qGXSNIvYkiIJzHHYC+T9RHXJZDNrJG84/rekR/3Y+vXSzm?=
 =?us-ascii?Q?7Bn0Bu0zVGs3ci/6e9BmFvhC2SSUJQG0CfZGXmin3fGRTTWwv+VedkTI1r6H?=
 =?us-ascii?Q?T+D3m9oTJ1LaG1tMf7Zqpj+yfI/E7Iq4foaHt9PdGiGpmMtzARRsfyAavZcg?=
 =?us-ascii?Q?CAdfgmKrPNkAWD936nZ+CQX/Qxq2Oe48B0RySgYLzKcISU390SxOtm6HipZa?=
 =?us-ascii?Q?4OKAcG90imZKpMsXhGtiXTPpV4KawRhMHryEVre3gGM9ZT4g65BtK/9YsnZZ?=
 =?us-ascii?Q?3xirdDlh1BWKgHa4ejrYT3p+t2uKWVqFWgOwusU/zpdFgklLeOVYOSwX8bl4?=
 =?us-ascii?Q?e3/9+OcoU6t0mLISv8nQoU8Rbd14wZ5THriTsAo7WwyVxFFrznQbgfVHjxsU?=
 =?us-ascii?Q?gbzV1tC2Uwfx3AK0hIyoQGnqHr8nEVCWLIIEqio86mIOnQk7U8LXI01h87FF?=
 =?us-ascii?Q?0v2TNIXJbEnrVeESYE9Z5tFgY00du16R7cWkAUoASf4MuJRbvxPWfOvgG31E?=
 =?us-ascii?Q?jrreO96dSlpMblCnul7u60ZF3vAFtHEFJULyIM2L/j88X0dcKrCfbiFgPoA8?=
 =?us-ascii?Q?CcbMQrt4DKBM+tlW01PZXnsFbbit5BSLLTx2lzPwdgj8/DhVlxjkDkMYfFXV?=
 =?us-ascii?Q?A5+TZUxcL1ilal8uZu1JRXicRPo2sQeksPEvrBbyEc/teCUlMPvaIV7oNo1Q?=
 =?us-ascii?Q?HsSLwlRtJ9mmQnVCQdxDq2u/hnBdlbJnWiqCQk1SwNbt/ehZAPOEUunGYmz1?=
 =?us-ascii?Q?56PwE4bpZO9oh+HLSJ9BlMkkjO+ReUcLyQi4YocyHWePLI3a3gXzoMpiR7Pp?=
 =?us-ascii?Q?PfgsNGgXzHTvDQtFWC1mhjDhDnalFbbVeZuUDT7aEYw0IoizBqPTZwH1UJ5y?=
 =?us-ascii?Q?KEYPiwnLmjq+NsA4LD0aj+TupLHsG38XIAJolHxNl0OpZfBMKn6vsnObBQcb?=
 =?us-ascii?Q?Ph4VXfnapaN+z+U88SsPzpiRLZzHHqhN1NaZGzC6Qa/TY4VrD+JOnyX4evPL?=
 =?us-ascii?Q?t+djml5euH/S4DE6bxO5GMC9OHSbBG/mau7KVbhZT/0YZaYTqJkUta5sKi5Z?=
 =?us-ascii?Q?zod15TCO8+fBWYUntSQdyB7lesPwiWgvwq7mKnmnez2//GyfdI220e+qKwnf?=
 =?us-ascii?Q?xzt9sDvhORANZlwFuWzCrRFFqZqpHEDD7U7dEyM6FyhEeJRJNaqPZ0jSPFnG?=
 =?us-ascii?Q?TGXbh9G6JhD5jyUPOl/1+4kdlbmFUS/rgjE8adlSs6ppE/Ni9OvgeLoudOgJ?=
 =?us-ascii?Q?IWGBBzQlAHkCxkUBQnOb50tUwNTbG2NWz4IH/u5NH6XMkDYtUC0ZLFs95jBv?=
 =?us-ascii?Q?tj+TTWHE56s2rupLcPsu2jJo+o6wpjjACYaeqGxqJpo7mbcU+oPOZQJND1U8?=
 =?us-ascii?Q?SqQbfj/6xmh6bk2m2oTBBt2o/CEWVfLhQ0EDmFvSjkVHxrklECr8Ozp3i1TV?=
 =?us-ascii?Q?TXU/B7PJPZHrLl+3Mu5YLjIVJPYEQZX/juDKPQ3nMfYVaNd6SLUx0xolTHb6?=
 =?us-ascii?Q?iR4bvUlmIbEO1+TAwkpbhF23SYCOwe3BGJnkR3UN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 399c0362-0972-4e4b-46b4-08dbaae79f16
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 12:33:18.9369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLxCG7LMMCy6ORKdDqPeJRVpvDuAbJLZfh3Wy8+KQXCU0b0N6JNoHsPJ3zfiEN3Q0Y7So1hSiTzCJdxJbKklaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5175
X-OriginatorOrg: intel.com

On Fri, Sep 01, 2023 at 03:27:19PM +0300, Eduard Zingerman wrote:
> On Fri, 2023-09-01 at 20:23 +0800, Philip Li wrote:
> > On Fri, Sep 01, 2023 at 02:48:26PM +0300, Eduard Zingerman wrote:
> > > On Fri, 2023-09-01 at 13:22 +0200, Daniel Borkmann wrote:
> > > > On 9/1/23 1:18 PM, Eduard Zingerman wrote:
> > > > > On Fri, 2023-09-01 at 12:26 +0300, Eduard Zingerman wrote:
> > > > > > On Fri, 2023-09-01 at 08:29 +0200, Daniel Borkmann wrote:
> > > > > > > Hi Eduard,
> > > > > > > 
> > > > > > > On 9/1/23 2:05 AM, kernel test robot wrote:
> > > > > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
> > > > > > > > head:   be8e754cbfac698d6304bb8382c8d18ac74424d3
> > > > > > > > commit: be4033d36070e44fba766a21ef2d0c24fa04c377 [6/15] docs/bpf: Add description for CO-RE relocations
> > > > > > > > reproduce: (https://download.01.org/0day-ci/archive/20230901/202309010804.G3MpXo59-lkp@intel.com/reproduce)
> > > > > > > > 
> > > > > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > > > > the same patch/commit), kindly add following tags
> > > > > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > > > > Closes: https://lore.kernel.org/oe-kbuild-all/202309010804.G3MpXo59-lkp@intel.com/
> > > > > > > > 
> > > > > > > > All warnings (new ones prefixed by >>):
> > > > > > > > 
> > > > > > > > > > Warning: Documentation/bpf/btf.rst references a file that doesn't exist: Documentation/bpf/llvm_reloc
> > > > > > > > > > Warning: Documentation/bpf/llvm_reloc.rst references a file that doesn't exist: Documentation/bpf/btf
> > > > > > > 
> > > > > > > Could you send a follow-up fix for bpf tree?
> > > > > > 
> > > > > > Hi Daniel,
> > > > > > 
> > > > > > Will send the fix shortly. Strangely, I did check this syntax locally
> > > > > > before sending the original patch, and had no warnings reported.
> > > > > 
> > > > > I followed reproducing instructions but can't trigger this warning,
> > > > > tried several sphinx versions:
> > > > > - 1.7.9
> > > > > - 2.4.4
> > > > > - 4.3.2
> > > > > 
> > > > > I'll remove 'Documentation/bpf/llvm_reloc' and 'Documentation/bpf/btf'
> > > > > labels from the documents (and these are link labels, not actual
> > > > > links), but it looks like I don't have a way to check the results in a
> > > > > way compatible with test robot.
> > > > 
> > > > Strange, perhaps LKP folks could chime in and provide some more guidance e.g.
> > > > wrt Sphinx version.
> > 
> > sorry for late info, this one is using 2.4.4 sphinx, the full make command is
> > like
> > 
> > 	make W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 SPHINXOPTS=-j1 htmldocs	
> 
> Hi Philip,
> 
> Thanks for info, I'll keep 2.4.4 locally to be in sync with test robot.

You are welcome. For the robot side, we actually read the version from
Documentation/sphinx/requirements.txt of the test commit.

For this series, it is 2.4.4. And we also support other versions like
1.4.9, 1.7.9.

> For some reason script/documentation-file-ref-check (which reports
> this warning) did run for me until after I compiled the kernel.
> Probably some issue on my side.

Got it, thanks for the confirmation.

> 
> Thanks,
> Eduard
> 
> > 
> > > 
> > > ...sigh... I rebuilt the kernel and all of a sudden warnings are shown.
> > > Sorry of all the noise, will send the fix soon.
> > > 
> > > 
> 
