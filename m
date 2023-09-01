Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C76AD41
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 12:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693570997; x=1725106997;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=O+Zd8LLIEecMBEfWaJEFJgo030IqUSE/+ZOONeNGIJk=;
  b=ifMiDka3SUmIzy0ztZ/v5FKZfrblanLWUa7KwE32lPpOYQp9wPkNa+n4
   /u1q/k9G8BaNquwGnPw9TtqKMCZ0urrYO7SLoA9VjXebR+qSol7M8HTvb
   3M2Uy6HEzj4rJ+qPDFf4cM0wm1glWh6V7l1fdJuoNZhhEIQLX48oTVtYn
   MFk1KEznU9BQPbvbhAgd5RDdcW3m+7E9wiBzQqHFQMPDp2OEm2TU2PtIH
   9XkDyPaLHluyBwYINP369bSgro62AFpZYD/KTO5tqbuDQMnJOGGiWB4Tx
   Sdava4iCke+mnrKqgLrJFVtBM8rAyS3X1YmWxiqshT1+XhrULW+GrUfLw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="378934034"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="378934034"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 05:23:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="854691508"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="854691508"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Sep 2023 05:23:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 05:23:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 1 Sep 2023 05:23:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 1 Sep 2023 05:23:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bL34haAmlrhfjZVdV9TZAUSpS4m+b8Gk7Y/C9acLCOXMuc9e7HU3LtZM8BDrXOqpCB817/OEbu+fAbLziVg7vOVkScFScb0cdebpBNUesjKRLxkHmzncfWJnruBWuMMWqzIwQPqHHbRhGXtukSP34JGUIgSzixNwRiD3iFkYeAhsE1bj6tGKWbbFGjCYjwbDTJV45UzYcJLTw/XZXCD9GfpnD47nV++9V2Q2zBssFeM485cmaBvbrwqxDS9kf149GKdjlcPYhHlQymKPLa220Q43lu8OQp6xcpqKMW8mkUVs2vtWyVObxtwAqgWICD4b8W0KjKtr8BlPz+UyDDMdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/DWva4+uRP20pyVVxJclTWwrEW2NrxKnbX6ZZYqz7U=;
 b=DCQHH2566mQSy9PPH4JJESIU4AHheaQ7BXbVz3jksaek8cE7zKW3zxhxRm9tsgvWocVj6oi27okFHYibTqZTnvUA8z5BjgmCG++YiDmcMc7QYSuqjrxzB1rbIlBGJQZlib91juzqKtzt5URWKpv5MRzH/OobzXHLicKM4yorn4EP6fiOThUuxWRsBVKXgB/NFz8k6aP+50g1hUPU7k1g8pw0JpuALESp3CH3UMFw0WQNMEd/J5Y3ZuS7US48pby08coO1rTMviN8XPJRCNh/09oZd/Aw5ZJ/CejfI7cQhqkUaamzR/6iUjf1wEgg1Y0qgsxZbRTHGD8ZgYYuD4RyPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by SN7PR11MB6899.namprd11.prod.outlook.com (2603:10b6:806:2a7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.26; Fri, 1 Sep
 2023 12:23:14 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::3130:de4a:9f73:a5b6]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::3130:de4a:9f73:a5b6%6]) with mapi id 15.20.6745.020; Fri, 1 Sep 2023
 12:23:14 +0000
Date: Fri, 1 Sep 2023 20:23:04 +0800
From: Philip Li <philip.li@intel.com>
To: Eduard Zingerman <eddyz87@gmail.com>
CC: Daniel Borkmann <daniel@iogearbox.net>, kernel test robot <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [bpf:master 6/15] htmldocs: Warning: Documentation/bpf/btf.rst
 references a file that doesn't exist: Documentation/bpf/llvm_reloc
Message-ID: <ZPHXqAUX6aLXp9Dy@rli9-mobl>
References: <202309010804.G3MpXo59-lkp@intel.com>
 <6a92003b-e47f-01bc-57d2-d2fb30292ad0@iogearbox.net>
 <a62b47218f1852d09b243b8fb1741c2baca4d336.camel@gmail.com>
 <5009129a873cf20adacd679d5073c799f79672d2.camel@gmail.com>
 <5ce81342-c565-f7fb-1c93-ec4eac8944c9@iogearbox.net>
 <86cd932cd5a6ecf44b3d4dfd2b9446bd721d9e78.camel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <86cd932cd5a6ecf44b3d4dfd2b9446bd721d9e78.camel@gmail.com>
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|SN7PR11MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: 5171092e-4bae-4597-4ddb-08dbaae6368c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rK5PxL+sk53VCy0QvJi0b0gjSXMD7rdRf5SZt2mxANpx368DDpMFExH5Tf9ArlE48QsQLkLPRVFUSQX0vHgQZtaL7/A/EAdKozNcDHhtbmqXt7SKight2HaBq0mgWRYhFKFDK5ulaREdt425IsZFMhbc4hQCsk23ZsLtGpdLSkLtdbGr/TrNZX2gnasUgDuF0qr7WzPRi8lxV1ang268GFAGCzrPbpHCs/owCP0alSJLOHvfSc49EQM72q6xDCoO4JM4Is1KuqPOLEFFwoir0znDaKEQoF9AQjSv0RpJ0ooQ0HbMfatmccBFmMlN71dX8oSoC85oZbTK31rfWpp0b5qfeLSwfgs9tLU0+pnwZ3ywRDDskR+R8ehe8pCxC98Yy90PLZ4BeGdrYZZeHwFe0I6Vx3ElW/Oxszd+VDOaTDnfhAzs+KC63CK3qHnUVnqZ7w8Plt5wkS1D6ttye1fLBsUUFEJdF60LV0qiQeCMaSE2+gapB0/dSuCj2OAbmBJx9BLu9dEAiD1Z95kaxTbmnVqldkizxJ7/0UYhBzWg6jt+9yFYprCIbxsfe/cuMZzOK4Xtdydt7JPu293DidFHcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199024)(186009)(1800799009)(6486002)(6506007)(6666004)(6512007)(9686003)(53546011)(966005)(478600001)(83380400001)(26005)(2906002)(33716001)(66556008)(44832011)(6916009)(54906003)(66476007)(316002)(41300700001)(66946007)(5660300002)(8936002)(8676002)(4326008)(82960400001)(86362001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fvNmpp0IqyFPiGRP3QuosdsbIuzrxWUo0Tab1q11alsnJUMvQdvL0ymxXwxS?=
 =?us-ascii?Q?2U6an8IAgXnBImPMZ02D0jYOUWBZFKeFlGASj7HNMiW9SzPgrrIHnuXgk13q?=
 =?us-ascii?Q?uJD/QtQ1AwQSt126BzNycoAVH4DKZJMCsiw6/EszQ4qcsbXug1oL/ZOSHp1M?=
 =?us-ascii?Q?0XJQn2kwL3Db5RIlCSFeeM0QrtJS4nv7THGdqORv9iSXedLxOFCCWZyjmG0V?=
 =?us-ascii?Q?4f6rPplKa60BiGwZr/Q2G+SoiTlr39QtCmdASd7nY5xFk0Ewo2XatVW/E1+f?=
 =?us-ascii?Q?kWf4JcFjXgXnOLlJyV6PS6KVvaIl8TRxz1J19SOiUyXycN3R6yfnpK4CLTNh?=
 =?us-ascii?Q?5Oi7kP5Abbn424BkvLVEsZkrKrjWiLbXEpoaMdRpLLbIJCPWaDTa5Vvpu4A6?=
 =?us-ascii?Q?ZlngInb+G0NHm5PJ3q7OPHYKiez8z+9VxAjrsoKrFbBscMJ8hUyRCDr8RT92?=
 =?us-ascii?Q?gqfxTb4QDRwv3IHtv3mFAgXL4YvA/zXA3UQi+8QWUuaqu+aaS1G5spk4+6UJ?=
 =?us-ascii?Q?rgbIcqbmDyIKKSYLrZgySw2t0iQV35vUdhf/nzImcvIOf3WD2Xp1nafOd7b8?=
 =?us-ascii?Q?YNM83n1jbjbgfPgDhnXuipWYIH8B/ca+U240NxZ4lc5y5rnXPvjdTjo9Ndg5?=
 =?us-ascii?Q?YJGNa0kynJXf5rtIilxuV/XDeW9CfWYaAaFHEsEk1URP8vBEr+/hIcpRq7rJ?=
 =?us-ascii?Q?Ngx8uDBM0echz3CCJZoClm8XL9VgLNKVhli16I3m3/6OdqwuTkcgJ6s0/mXz?=
 =?us-ascii?Q?he8dH+CzZIv6wfkaAC94iBsQKyKGWIhOtlqV7K2mkiz7IyuesoAknsFyDkJ2?=
 =?us-ascii?Q?RdawGab1d9lwGXD2k+vKMWjSSby51rVqcPC3FYBePo7PUyGPSCdPS9MBe8H4?=
 =?us-ascii?Q?12bJP13vFiuuewANTuDHHoMuQwwN3qYXwbRtKy4dUOHwhYMWFCxXxfOtAmii?=
 =?us-ascii?Q?5Yhu7auoUVwyEqRlP8L6AGUsFOt1zyVWwQITk/jb5+/3HQrwASj6xjM5F3Ja?=
 =?us-ascii?Q?Q8B9PKoif4o+FcpTXZIfdqKGYICHqkQG52cePLrqh9muc2cwvvOPaUObaLqy?=
 =?us-ascii?Q?R9gtZpOojnIGGbJNbiyIySPS0JmYm06ZdhD5zlRH8MfcNsc8ISK2Epr/Xt9v?=
 =?us-ascii?Q?lF/epd9omqaCDMedV+hnjX4IXkv3Ga06RRNj33vL+vGsNYrwHkHPF/ifjhfv?=
 =?us-ascii?Q?bjqjmvmZIDk6MURlGivgvnXma82vUXG3ZDwfd9Bd2Kbbm2D4sy0aMGaQ8g9l?=
 =?us-ascii?Q?2RfbH0ORvdglVSykZgyi1tgg5uJeBpbWsmRbr534iiP/G9BrKlZAZcIwHHxO?=
 =?us-ascii?Q?abH0nCqeARTfRYF4MmQPFt5sQyaEkg2+8FtMNRKlTG/9NBNh0ZUEWNJi/Qeq?=
 =?us-ascii?Q?JJF04da+4+z5h6i9JXmZP/RE75SBKT+C1OobVYcsvvkG2tsBQ6vfBPFWaukg?=
 =?us-ascii?Q?NWBjddg+4Wy5AQIq6UjHpQlbbja131PWCoo/Kns3nkcSzq5RiK98hVjXQXxw?=
 =?us-ascii?Q?pZo/102bUr0Wxk1G7zUcXCMm7LvhqJSZMTzTKrqa8NX1NcvVtPHFF5b9OruF?=
 =?us-ascii?Q?HRInPbEaK17QjvixvUMNFdMXjHqyOsCORbeeymJv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5171092e-4bae-4597-4ddb-08dbaae6368c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 12:23:14.0687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESRyIvaJGnCpP2vidV/+TibYcuV5KxASnoYxY2Ebis31nj/kJ/uqJlCC7HigYjMwxx+yFgOAnojLjnXry73fgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6899
X-OriginatorOrg: intel.com

On Fri, Sep 01, 2023 at 02:48:26PM +0300, Eduard Zingerman wrote:
> On Fri, 2023-09-01 at 13:22 +0200, Daniel Borkmann wrote:
> > On 9/1/23 1:18 PM, Eduard Zingerman wrote:
> > > On Fri, 2023-09-01 at 12:26 +0300, Eduard Zingerman wrote:
> > > > On Fri, 2023-09-01 at 08:29 +0200, Daniel Borkmann wrote:
> > > > > Hi Eduard,
> > > > > 
> > > > > On 9/1/23 2:05 AM, kernel test robot wrote:
> > > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
> > > > > > head:   be8e754cbfac698d6304bb8382c8d18ac74424d3
> > > > > > commit: be4033d36070e44fba766a21ef2d0c24fa04c377 [6/15] docs/bpf: Add description for CO-RE relocations
> > > > > > reproduce: (https://download.01.org/0day-ci/archive/20230901/202309010804.G3MpXo59-lkp@intel.com/reproduce)
> > > > > > 
> > > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > > the same patch/commit), kindly add following tags
> > > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > > Closes: https://lore.kernel.org/oe-kbuild-all/202309010804.G3MpXo59-lkp@intel.com/
> > > > > > 
> > > > > > All warnings (new ones prefixed by >>):
> > > > > > 
> > > > > > > > Warning: Documentation/bpf/btf.rst references a file that doesn't exist: Documentation/bpf/llvm_reloc
> > > > > > > > Warning: Documentation/bpf/llvm_reloc.rst references a file that doesn't exist: Documentation/bpf/btf
> > > > > 
> > > > > Could you send a follow-up fix for bpf tree?
> > > > 
> > > > Hi Daniel,
> > > > 
> > > > Will send the fix shortly. Strangely, I did check this syntax locally
> > > > before sending the original patch, and had no warnings reported.
> > > 
> > > I followed reproducing instructions but can't trigger this warning,
> > > tried several sphinx versions:
> > > - 1.7.9
> > > - 2.4.4
> > > - 4.3.2
> > > 
> > > I'll remove 'Documentation/bpf/llvm_reloc' and 'Documentation/bpf/btf'
> > > labels from the documents (and these are link labels, not actual
> > > links), but it looks like I don't have a way to check the results in a
> > > way compatible with test robot.
> > 
> > Strange, perhaps LKP folks could chime in and provide some more guidance e.g.
> > wrt Sphinx version.

sorry for late info, this one is using 2.4.4 sphinx, the full make command is
like

	make W=1 --keep-going HOSTCC=gcc-12 CC=gcc-12 -j32 ARCH=x86_64 SPHINXOPTS=-j1 htmldocs	

> 
> ...sigh... I rebuilt the kernel and all of a sudden warnings are shown.
> Sorry of all the noise, will send the fix soon.
> 
> 
