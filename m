Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D233D9F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Dec 2023 02:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ah08FWzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702349851; x=1733885851;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=wkFVIU7JKkh2LaeRmVGATeVGnR0sa0oRlbOh35zn9S8=;
  b=ah08FWzNBYTbDZrG+Q6zwGDpnU90W9s1KZXwIsCQV9X+kxe7LU3PyVVa
   hBPm9/GPDhKipqS/x0REXtt8pu8CNSiaNC7gj6FYpXdUaOTwGMcMr+cZQ
   xLFrZsl5EZ8yuQZTJTKvqO+2AGq1Jo66VU8q3Cqcr13rCbjK0m1t3oqwI
   HioXFCR1wjHoiI3wrT+gmVAGfBJHM1Vm4aIlxSvIWEBr8cn8966oFBxFM
   qNhpqZjejo2ljjB5+Qz9ez2xnlZN9w+E0SnSzn3hvOFsL7GF25TBkMcXb
   49D1E/owJ2aEW6OLyFUG3F6Ial9nsiZnZXrqUKgCvhu7GsmCZCaBUrcwX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="16297780"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="16297780"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 18:57:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1104728084"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="1104728084"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Dec 2023 18:57:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 18:57:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 18:57:29 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 18:57:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iso1jhu1k3wrZpr/hCBREgYGDGFAQW5jDK6MXp25cTtvRqH0VSckrKvBX3o6sp8GQm4H9NZ65hsJuaQ/2wMOCUUrEnnCeXPgfKve5y7Zv2IOjz/qy4n0pU/irpCnrpC8JEFVxs5eSoDUuy6zAcdWGW9qseQ4fsHjcAmZJKXprUO+mHLKmejF/UwusI3SN24jatvcS7r/gsFmmrvY5kDcKaJa9fxWGV9Q3PtOEkY6Jlxm7DrHenhu7akaZZPhxMFhr7kLyFT4WOTwXZoJzkJZIa8jKpluyIUtMcFH9+iwOWqZ3kjkuQoHIrY9kVJVMjMUhDYATWogwGq7ydyVObt5qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnCUhDjzZxXdfowEWRx2kkPQ0kcQaA5vjEO7/EwD1pE=;
 b=A9CdmA3SG5Ne+l6LhXwMOQuSHKzs8TR3wnpUZchSQQXITy9PEMS8E+L0yMrCu+gFYqsJeE8vY4bU3a4tXA/QFKuOsk1p773+nYEOWbqVfAHcUfzHuJ1+poSurKRR/rHd/29q8J9YfX4RsRumhFZMH1vXu2cHJ22jtBqT+8V/lYFCn6H3PvykNDESoaJTMSC8eoCBPRlXH/78X8c1Fioo0P+ewUEWqy/TpuiHlzRXILWmbPz6SxBq8F7OCSYSu02kMdSgBmcC5CsCfTD14NnOrT9DZdUeQaUzmx8S88EnXLXSUh4E52hi3NxqimFRY21Lm+U6hXIURYTme5ewQjUa1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) by
 PH7PR11MB6554.namprd11.prod.outlook.com (2603:10b6:510:1a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 02:57:27 +0000
Received: from DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::e486:f8af:ca6c:7219]) by DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::e486:f8af:ca6c:7219%7]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 02:57:26 +0000
Date: Tue, 12 Dec 2023 10:52:54 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
CC: Mina Almasry <almasrymina@google.com>, kernel test robot <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, Willem de Bruijn <willemb@google.com>,
	Kaiyuan Zhang <kaiyuanz@google.com>
Subject: Re: [isilence:zc/rx-pp-provider 5/31] net/core/dev.c:2065: undefined
 reference to `gen_pool_for_each_chunk'
Message-ID: <ZXfLBk8F4eoQmmZn@yujie-X299>
References: <202312102313.zJHWVLAZ-lkp@intel.com>
 <182d28da-8822-4d2d-85fe-5a1843905eb1@gmail.com>
 <CAHS8izMn0JhRkmvF1yEvk1iUdYmHNbxbs8GgO=0GX6Qq5uR80w@mail.gmail.com>
 <18a68cf6-7738-40aa-869b-401bb08bc41a@gmail.com>
 <ZXZja1UjyhyHDNiu@yujie-X299>
 <7ad9d49a-d649-4f78-ae89-c592117d7665@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ad9d49a-d649-4f78-ae89-c592117d7665@gmail.com>
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To DS0PR11MB6397.namprd11.prod.outlook.com
 (2603:10b6:8:ca::12)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6397:EE_|PH7PR11MB6554:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b6af7e2-82a9-4377-c89d-08dbfabe1261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VwyZ6qN5VONQ6vHhDbQEDuZ4hicVPWyVkUfYhUcZ2AZ5WRLz0x08DMQOKm0bT5Dg3Jrsn+TTL6ATArP0+F9B3cc4YvvShA901fjkDa4Y0jfMqUYxSRoumPtx2C85jMplK9A57yT+3fBlLIiKK3MGKza1hQU9aFJOIyAk5RWMDAR0TnJjmJSUmqwY72P4/IPEDWdOPmSXBN6HTmWsPev2pBbkjls1/dPIG3Pm4aipz+7wqroLKYy9RHYOG0e22lYX7Pl+ezOyuzVJYFgdMyBDQxEFwu/CZgMBXN20WKYDweaFt1EUkEd6Y6QrsTn851zLeH6UdKdJXW7EEVxM+BkH1HFnytxFn3envCnOxbnokI7sKAtCzEe9mCNbL/wlVNv/acJQB5bfFuaM2iMWb3JKw3BK8v0cuQ7Gr323ZKV1kECdKqsaMvNFqrxOTBdsBxgMo9Zg08GEJzHFDZ2CI7a/oBOyNYzvRGU6ykndVgX114UrFKz+5MCXt2atQrybdAU27FlSCl2U0ONBmmYIiTuwY9D2Q66AZ5addWGnLPwgYeJM3bW8oe1vBp9v4emCdgcBmyB5Pfgt1kejHWxYw1eu0JRvt9Eaq4Ws1YFlK1wuzn9Wnt9tLnK645c+tymjFsms/ffZ55fGqHi1NSzSNOxJ7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(136003)(376002)(366004)(396003)(39860400002)(84040400005)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(66899024)(6916009)(66946007)(66556008)(66476007)(54906003)(82960400001)(86362001)(83380400001)(26005)(6512007)(6506007)(9686003)(53546011)(6486002)(966005)(2906002)(316002)(38100700002)(6666004)(33716001)(478600001)(5660300002)(4326008)(8676002)(44832011)(8936002)(41300700001)(81973001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnBlWHlTcTY4SjFZYkk5VTBkZTgxNDBEbWpibDdNSWlXZ2EwcmFLZ09ZcUhT?=
 =?utf-8?B?UDdxM1I4MDFWVGlSaDNDSWR0MGJ1UFhNZ0pDYXE2Ym93WnlqaUU4a1dJRSs2?=
 =?utf-8?B?MmJ6ZGFBc3RsTHNlL0Flc1k3L01jYlhuZldQeEdtaXhOcHZ1RzUyUXhZQm1N?=
 =?utf-8?B?ZStWYWprbmw0aWxQOTNvc2tWVnYvWGF1TGpnN3hzakovcFVidytvTFFNZW5L?=
 =?utf-8?B?OEVxSVo1cU1ZcWh4UTN2aWdSRmtGWGUydFBDQyttT3BNdmlvVzQ5dmRnY0Ri?=
 =?utf-8?B?ZFBQM1Z5WEJ6Nm5uRGY0NlFiaEd0REJleWFMNzZueHJRcW5uZkxlMDB1QlZK?=
 =?utf-8?B?TXZJMlBmVW4zU1JlMXVIOWxRdlRjMGIrTGhTd3FVRk5vY1B1dU1EcFdpWktS?=
 =?utf-8?B?Z2Z3SWdvK2Y0UG8xTU95WHQ0RDM3eWJJcDNaZmJDd25YQ3c1M0tqZmJocThi?=
 =?utf-8?B?QWx4R2tQd1AySGZOZnhwb3NSVWh1b3ZpMGh1Y3BDeVpIb1U4ZVI5bUJtbU4v?=
 =?utf-8?B?NDlJalQ1SGMwR2ZtcEc1dUQ5UlBTTEZXQVFaNlVRUml1dWFBalp6U00xeUF0?=
 =?utf-8?B?TkJBT01CbWU0YnVHWU5QOXl5bC93WmN0bjBiMEUrQlBXT0tWbTVCeHdoenVC?=
 =?utf-8?B?U3BzK1Z0S2kxMDRadWdwSVdvVHcrOHljTXpyMHJRRGF4azFlT2ZMRE5aTlcz?=
 =?utf-8?B?OXV4ZmowSlZMbG5jRnBMQ0NiOWFOWGlMM3VSRS9qTTZwS2IvK3NaODFqZkRp?=
 =?utf-8?B?Tkt0T3hJMXZuRjNDSTZWMElyVXVVRzRQT3ppK0hQZlZnL0w1QzU2Q3YycW44?=
 =?utf-8?B?L2ROMXRSQmcvcm9obkdJMUpUNkhCTVdoR2tDSE1YRkNJOXc4c09tYmdzK3lr?=
 =?utf-8?B?N1ZmQ0w3MzdjekJ1b3VESlorRkpLckhYK2RFcUs2U0Z0dFIrSlJJTGpwNmp3?=
 =?utf-8?B?UmVZU3JKYUR0N1JHZzVONlJLTUg3UXphV3p3aXZ5a3VyamRnMWdFbnRJc0FB?=
 =?utf-8?B?V25BY2VHZ2lHR09iZFpFa3MrdHBBeFB0VTEwMVhiWGRRL1Vqd0JIMTRuejVR?=
 =?utf-8?B?c0Y3Ri8vUVBnU1dhenJ6RDFGL1kvNUhLVWVaSkRBS0luaDBGVjB1b1Vib3V2?=
 =?utf-8?B?Y1pqYytjYllGVE1mODM2NUJBRUlvRWhhbkloMVFrckE2UEtvc2d5MGJxdThQ?=
 =?utf-8?B?WkZ2MDNsVEZUc0ZmZzk0WUluenV5ZzhXUHZocWRRVldKME8yOVdHdFBvZTcx?=
 =?utf-8?B?bm1xSUJWVFpQU1BWOUNPR2tTK0w4ZHB2ZkJUaW9hTGxDTmF3VnJLeUEzdHdx?=
 =?utf-8?B?QWVyT1o3ZjFXSThhSmE5MlUvNy9iaHNtV2wyeU1DdXpvaXcrMjRkRnNXczJk?=
 =?utf-8?B?MXhVNHA3bXNIYjZKQXcyc1NOaWNCeVNqQ3hZQlBVVDVEbTlTa2dLeWhGaTho?=
 =?utf-8?B?Q0Y1NGxUNGZ5aGxYbGQzdXhSRDYvY0xJeXZrU0gvbk1US1k3UEJqaFUzVmFU?=
 =?utf-8?B?S3Z4TjgvSi8rSi9Cc2wzckRwV0Y4TW94dVlxcytQVVg0K3U3cEJ4SWh5c29O?=
 =?utf-8?B?WWl3VGxQcXY4Nk92bTdhRjdKR3RkbXpqMjRkRHdWMWF6OVRYelpvTUVWUlVi?=
 =?utf-8?B?VGdHa25pV1ZDMTNvMzQvSVBTdU9ya290aC8vdmx3TkZsQi9hYlh4OG1HaVp6?=
 =?utf-8?B?anlkdnJHZ0QyNU1yY2JSNXVvcWc3M29kbWNvRWlNSEg5bEtHVnFsNWtBTUFZ?=
 =?utf-8?B?bjdFbnZqN2laa0FlbFQvWVhtclZkZk5pY3dsR2hsVTROVnNZa1BVQjJqSC9Y?=
 =?utf-8?B?dUNpTnBHYy9aUm5ReHd2TWErRlYvYVJXREZSakpxeWRUejU2Vk9tL2dkcnhu?=
 =?utf-8?B?bU5SeWpTRWozNXBjUjh3cDJEbG1HV3VXYm5RblVQTHNkeTNwS3U1aTFXVVV6?=
 =?utf-8?B?cUh3TVFrWkZEQm5pWDRIZERaNWZHOWVFUnBTTTljTHNnNEtVTHplZVpHUlZi?=
 =?utf-8?B?dWo5UHF2c1Yrck0wWjRLMUNLeldtV2dNVytUUERYKy91TEdQV2ZaTWREUUJl?=
 =?utf-8?B?cHFCN1RXbGpzb3QwU0I4VERzN0U0SHpKWlJ3UWttNTMxTFNlZWdyMjMyM2ZB?=
 =?utf-8?Q?rSDfzsUnQQ1t/0/OpvM/pgK3g?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b6af7e2-82a9-4377-c89d-08dbfabe1261
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 02:57:26.3580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DcTehrzVpkBMRgfqeFVmV9LDY9NtjnpNmXilvvcibd4dM50INaUoBIXUBWkbdPSUG5Tt/hYWDlpScznPXX/XOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6554
X-OriginatorOrg: intel.com

On Mon, Dec 11, 2023 at 01:25:19PM +0000, Pavel Begunkov wrote:
> On 12/11/23 01:18, Yujie Liu wrote:
> > Hi Pavel,
> > 
> > On Sun, Dec 10, 2023 at 11:15:50PM +0000, Pavel Begunkov wrote:
> > > On 12/10/23 21:05, Mina Almasry wrote:
> > > > On Sun, Dec 10, 2023 at 8:54 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
> > > > > 
> > > > > On 12/10/23 15:45, kernel test robot wrote:
> > > > > > tree:   https://github.com/isilence/linux zc/rx-pp-provider
> > > > > > head:   4b8de8977565096e38b6da993c68da6f2ef9b89c
> > > > > > commit: 161f99ad49ca48fa141161b409eac11a6b63c105 [5/31] netdev: support binding dma-buf to netdevice
> > > > > > config: i386-randconfig-003-20231210 (https://download.01.org/0day-ci/archive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/config)
> > > > > > compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> > > > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102313.zJHWVLAZ-lkp@intel.com/reproduce)
> > > > > 
> > > > > Ergh, I have no clue, why lkp thinks that it's a good idea to spam
> > > > > about someone's non-release repos, but just ignore it.
> > > > > 
> > > > 
> > > > How do i enable this on my repos? I have branches on github I'd like
> > > > reports for:
> > > 
> > > That happened long time ago without my knowledge, but apparently
> > > you can just ask them
> > > 
> > > https://github.com/intel/lkp-tests/wiki/LKP-FAQ#how-to-request-testing-a-new-kernel-tree-on-lkp
> > > 
> > > I'm not aware if they have filters for what branches to test
> > 
> > We do have regex filters for this. Please check the "branch_allowlist"
> > and "branch_denylist" entries at:
> > 
> > https://github.com/intel/lkp-tests/wiki/Repo-Spec
> > 
> > Sorry for any spam on non-release repos. Do you want us to stop the
> > robot from testing this repo, or could you provide some info about what
> > branches to be tested/ignored so we can set the configuration for you?
> 
> Dear Yujie,
> 
> To be fair, it's a pretty useful service, and I appreciate the effort.
> The annoyance comes from CC'ing a bunch of people and lists who don't
> care about the patches, and who will then be asking me what's that all
> about.
> 
> Ideally, I'd prefer to limit recipients for reports for that tree
> to only myself. (and maybe some necessary technical lists like
> lkp and oe-kbuild?). If it's not an option, can you help me to set up
> a filter to only test "lkp-test/.*" branches?

Hi Pavel,

We've set the mail config for you and the reports for this tree will be
sent to you privately.

Best Regards,
Yujie
