Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273A1EC5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 03:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MptoiMFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701140732; x=1732676732;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=w0a8zXy3p4jecsbIyE+x0xXZHeIpQOLDGWySTH5g+io=;
  b=MptoiMFBF1bGT+i6a5GM/+xgx4ovQ3woRhDg70ffHmV8cNKVybpAG160
   MmbgsZwkcmwjdJSGfoLvfNG9IDFFrMFTD1CNtIcQwG4vwtXmd9f8Vwi9h
   b0RuEUj47L+9561oFPkg8vVZG1OOuG4xtCGuLetmhz6ksWvllIJQNsFbS
   a1MxUV708cBVUZ+2TJO+QYBji9iOrsWaPJ9dU65zFjJGv0hFUU4TAF8qv
   Qozayt0X3zESSVsx1NFph/Ar5goEz455ZBojxAj2J6KKIonGpjY7VXMlf
   af96DCAxvsYDwsQBPxksoQ1DfOe0xT5+vSdkN8E19vuMaCGHcanKbxVj+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="396740104"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="396740104"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 19:05:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1099956816"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="1099956816"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Nov 2023 19:05:31 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 19:05:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 19:05:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 19:05:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhkurUtXYZ6+w6w2poHTDXPubXR7yoR4H2F7AawfO9KK2GCUqtWBxL48b7kfLXAkKrPjRwBufokL8UOAw8Rxq5OW7GcKyAdD3dKI63n4v++N4Way6l8o8ZIH1E88Wbb0lP7AiZL9Q5CJfBxguYNarek07m5xXJXDG8ZbIZ174jLqbEenXT0doHEAXKhd7P0uEKTfbwNoaa52Vmaxv1oMWfY8FpZabASlGJhEONnf244pbaxltlNAyYA3CJcbKR7tpWDvHn3sqFh6Bfx9MoHDQeqPX4yjNSmivSdPhY3Nx+/B5Q5Mu48h1KnhJjTB7uxRYrd8jmvjSgo5lBDlBd3WFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JM58tjYiLj7Kxq49wm/Jtao+Vr0+SfDnlNu99g09LH0=;
 b=BzqoF63Z6Hriw3b2tLm841nYX07HXFrAC7lVILZIJg9mFZO79WWfi/+Q6pGIuXguMdLj7QSok8c1WyA1qQ+Xij/pJfrekt9K3POcfSdZFhNqa8R+tLjrhrb1XsNUUKIVB6VHlwCrtK5okX4y+YZ3ywe5snKWSnZdTkVXswNLgWAbuE4v7/EnKAgk5+9OduW6CrB817gpLdf8YFsv/53LFAtlTDg0vlrdAvTUhwWBD6M+7rY3DomXGoC0QqZTatyVYr+2e+BDL/yrzQdFwSUPPCkpLDhAEv63Vtv0/ciIIDiu65werH2eieyiPs3PNnxc/53DoSElEJF/9Wo923NLBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH7PR11MB6770.namprd11.prod.outlook.com (2603:10b6:510:1b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 03:05:28 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 03:05:28 +0000
Date: Tue, 28 Nov 2023 11:00:53 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Song Liu <song@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v13 bpf-next 5/6] selftests/bpf: Add tests for filesystem
 kfuncs
Message-ID: <ZWVX5WJCPv28Z/m5@yujie-X299>
References: <20231123233936.3079687-6-song@kernel.org>
 <202311242013.8tAOSgat-lkp@intel.com>
 <CAPhsuW6NhihzM5h50yvU9pKtQ6PkWegFqG167rzWvhPa-cGdxA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW6NhihzM5h50yvU9pKtQ6PkWegFqG167rzWvhPa-cGdxA@mail.gmail.com>
X-ClientProxiedBy: SG2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:4:188::23) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH7PR11MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: 04d8a82e-42c4-4d06-ff11-08dbefbedfd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rL0UTD6iQxXyL/WGVYPNQb/v1sIc6bwSVoGFndfWiHX/Hr9kov48JUGLWJAD11jqr3ftkWZWsMU8wmF2iF75iGxZyLsV4B1o2s6D42zQQSSFYJLzt5xyKNgu6xsISOQBCo9oY2bjfWiphLjdMZDWgTCdxiN6VxjURHfyHGqL6g8jo26zb/AGbhW0P4LdLhIpSdMuRlbcjtxbsRTekx/z4UX7UJy2D8C7GB4QhIKVXPBQTFGJ032jIa0SfPrK9d/o0acRSmeqtUmz6WMHrUpKr90HApv0xu7nYgncptc5QULSMQVfjFlTjcJvpD7zIAcvx2J76dPGFD3lfoxIe2YCwj46VcaJv0w1BvLsT1/HHszcqHysYdo4AfmADFP8bJmskXuWNfHi6SU+eFhZs2Hbsrt5mtokv1IuiiVInwqtlcCPv3D/3gYXS5wOs46KthfwiGSkWWsC5IonETTmKFncI+wvMssajUG4hCI5u74EB1rGHSHE7ylOw0ubfhOnt+vpTZayTx/YxpzA6qJlDh6b9amCWPXmZR8RN3e9KSzqBUPsEVh5g5KfREK7FRDL2GEuehZqmL2jEvjdDlzl7ytxqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(38100700002)(41300700001)(2906002)(33716001)(83380400001)(5660300002)(82960400001)(26005)(86362001)(44832011)(66476007)(9686003)(6512007)(53546011)(6506007)(6666004)(8676002)(8936002)(4326008)(6486002)(966005)(478600001)(66946007)(66556008)(6916009)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUR0aWNIOXFZZ3ZRdDAvUkR5UER0ZHlTZWl3aHE0Z2VYd2hidVN5aGxzLzk1?=
 =?utf-8?B?TEU5TXZVWnRBYzFpenZSdWpzNS9ab0dYd2RwemhEU3R1WFEwdFN1Y01kQnY2?=
 =?utf-8?B?RlN5eko3M01Dc2hxOC9PSFdPU2ZKOGlBTUtZbVAxZkt5Zll5UVFGRFg1Zzcr?=
 =?utf-8?B?VkJhSzQ5eGw4MS82VFFvRVZTVGs3bDhyVWt0RkU0SzJUQlQwNUJ2UnlnVGdi?=
 =?utf-8?B?b0tKZ3JhdmovWnh6SCtOd0x3dWRBUWpGelMvTDFRYmZhSnZ5eGlSNlpBOW1o?=
 =?utf-8?B?Y0pWS2RmR2RiZWtCZnY2Z0hZUkFrL0VzWmlzR1laS2ZDZVhLRkQrUVR4aU9H?=
 =?utf-8?B?SWRGV1k3eHdyakpPR0pIdlI1Z1VXZ0xNSi9DRGlPUWRROERrT21ucENxOTVP?=
 =?utf-8?B?c3BPbk9yYVVhYjE2WHdKT0lJRTBBb1RDKzZiN1QwTDljK1BRbmg0cTFjVnVH?=
 =?utf-8?B?cDUvZkZaSGVYcEdXZ0tXQW5CVzQ3a2tLaERNek5qUUpJcGE1TmcrNC91QW5y?=
 =?utf-8?B?OWNiVlMvRHhscTd1WnVVQ2FIei9Ja3VkMTlhRnlVOS9pcU9PL3pQZUdWZnJo?=
 =?utf-8?B?WGtYbjFQUWVoaWZrR3RNUkZBRHdFQ0IxN2NuNlhqK21FTWNSclAzKzRQb24w?=
 =?utf-8?B?MlVWZWFKT2RJYzJ5Nnp4ZFBhN0xWYjVSd1FTQ3dGbDByTE0zZTVRTWVrYWZr?=
 =?utf-8?B?Wkk3d2k4LzdiWGU0cFV4Vk9ENERmVEpxK3FEdWMxRFg4RjNwd0N5dnE3QlJa?=
 =?utf-8?B?Z1c1Y2ZjbjhSRXZvczFYWWkrNUlFcVRCRmExWEo4VjBkTVNsOGdFTlBuMzkx?=
 =?utf-8?B?a2k4TFljUTJpTHlwamsweXlIT2dvT3c5ZEEwU1FQRWxTTWEwa1paU2xKcXpR?=
 =?utf-8?B?eHJnUFpFQTA4ODVreEluRHM3Q2l4MVlKdjBUTmdOeWZtNHhTV2pQQTNwVHI4?=
 =?utf-8?B?bjNTL1BtUllDeHNSU3Nhd0w1QU91UE5PRXVpZDI2RXpieHAyTmcrK0MvRFBT?=
 =?utf-8?B?VDJxYVFqV08vOGpaZkFESGNKMnVmMmRoVGlLRksyNUZKY0lWMVRmVjBLMEpn?=
 =?utf-8?B?NjRjUXpUUHJaeklGaUtveFVObFRPb3AyekFqYlc5cXVXTk52Zk5GL0NiVzEw?=
 =?utf-8?B?S1JPcUl1OTNFRVJEcGJyak5CeUYvVDlSNzFUWGt0SnUzYThJMVN4bUF1eU9X?=
 =?utf-8?B?Q01xUjJhb3dBVmtWdXd5Z0N0Z0ZrRFU0YU9tM0pIYk9kbVRXVVhBRlZha0FV?=
 =?utf-8?B?NCtKN3VmcnJwOTB6K3NZUjFmVGU2V2V5N29XVnhmdU1taC9hMDZjRWZLYW1a?=
 =?utf-8?B?cHF5YTVoNkpxbks2NVJMMU11NExCcFZSWVpVQUpFZzluN1haRm5vaFNYZ0l6?=
 =?utf-8?B?Mlg3MDNZMXhMNG9YWnE4RURVb1RtKzdQaGZac3pqWGd4Ykp1Y1NNaGdPbVkx?=
 =?utf-8?B?Skt6Qy9SY25ISGtuVnNyOVZKeFNQTTZYZnd4cEN2OE45bWlZZHhPQTNnNkNU?=
 =?utf-8?B?WVhIcHV3d0N6SUZCakVuaVVxVVZMV1dEamhqU1NXYXB6TU5nVjRKRWE3TVpL?=
 =?utf-8?B?WFIybG5PWjllcFl2R3ZCa2ZPSG5pYjhjQVgyaSs5U0F3c0pKczNVdmRTL2Zq?=
 =?utf-8?B?bFJ0cHRPaE9IdGl2RTdvcDRpNlY5VHQwT1JxZVd3YkM4WU85MXVmcjNTcGxy?=
 =?utf-8?B?dmRmdmovTkpMWG5oK293T0tSdXBOUlErbUMxV3Y0Y2xCNmR6QXk2cVUwOUFj?=
 =?utf-8?B?UWJtdi9JS3UwUU1hY2R0clJ0U2tMMGRZRlRPR3JFaTltTlpjejcvdjN1Y2JD?=
 =?utf-8?B?RGdUNENHY05JK2VrdVNBQ0pDUk1ZWDJ6cjN0bElFcmZRQWRWSzZ3T1ZveU9Z?=
 =?utf-8?B?QnM3ZlV0LzVjN2dBaklXa3ErekxVOXZ4L3JxbFlCT0ZXa3NCZUlURDJmMmZV?=
 =?utf-8?B?cGpndk4vM2VCRlZCS29PZWxTbjlSM2FWZ3VCMVJlTUlOVk9mZGJaSWlhSUxv?=
 =?utf-8?B?dTV2Y3Mwa2JZN0lkdmxUUk1QY1hHVS9wWTNNcjdVN3ZDcFlJd2N3OXV6YW84?=
 =?utf-8?B?bk1YT2sycHJPaExZcHRld2t2RU5pU1N3UGYveDF5cUNBdXlQeWFLdHZKOTVa?=
 =?utf-8?Q?5v9qWwFilepSZan2nqSmfB0jO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d8a82e-42c4-4d06-ff11-08dbefbedfd5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 03:05:28.2609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOCGxgqPt02kO2RP06AMrn6T40IK5tk4CHjwewXZNTpwu/q6xeDUh0F5OO1u3nw8Qfk1amUGjLF2iYNcaoD9mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6770
X-OriginatorOrg: intel.com

On Sat, Nov 25, 2023 at 12:57:26PM -0800, Song Liu wrote:
> On Fri, Nov 24, 2023 at 7:42 AM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Song,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on bpf-next/master]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/bpf-Add-kfunc-bpf_get_file_xattr/20231124-074239
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> > patch link:    https://lore.kernel.org/r/20231123233936.3079687-6-song%40kernel.org
> > patch subject: [PATCH v13 bpf-next 5/6] selftests/bpf: Add tests for filesystem kfuncs
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311242013.8tAOSgat-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202311242013.8tAOSgat-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> progs/test_fsverity.c:16:22: error: invalid application of 'sizeof' to an incomplete type 'struct fsverity_digest'
> >       16 | char expected_digest[sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE];
> >          |                      ^     ~~~~~~~~~~~~~~~~~~~~~~~~
> >    progs/test_fsverity.c:16:36: note: forward declaration of 'struct fsverity_digest'
> >       16 | char expected_digest[sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE];
> >          |                                    ^
> >    progs/test_fsverity.c:17:13: error: invalid application of 'sizeof' to an incomplete type 'struct fsverity_digest'
> >       17 | char digest[sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE];
> >          |             ^     ~~~~~~~~~~~~~~~~~~~~~~~~
> >    progs/test_fsverity.c:16:36: note: forward declaration of 'struct fsverity_digest'
> >       16 | char expected_digest[sizeof(struct fsverity_digest) + SHA256_DIGEST_SIZE];
> >          |                                    ^
> >    2 errors generated.
> 
> In the patch, I added CONFIG_FS_VERITY to the config
> (tools/testing/selftests/bpf/config). I guess the test robot didn't update
> the config accordingly?

Thanks for this information. The bot does use a static config to build
selftests. Dynamic config updating is not supported yet. We will fix
this soon.

Best Regards,
Yujie
