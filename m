Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195E411C82
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Dec 2023 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7xWh755"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703860808; x=1735396808;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=CrSVu3+QCMPbuZuJnFqzfdD1YanIAKAAbDKgggzZma0=;
  b=K7xWh755QipIqyCcC9S30HhkJRv603wBDLqhs81UTWIw3iubUvrWOWyE
   OYbotDfC2ci9E8KyYlng/peCXoOMVddQXsiTV33uMCX/8A7W5Q7k6vg8U
   KypyqSfRhQMyHvr37X3ipnNu83sruKvNvNJ0ps8rFneEnqpdWIOBPIOzq
   TZJCslW4ofDpV0RiSSiu0hzgrqSFkfYgFsbQB33mOZdgLI7WIE8TfYSHB
   Lubx6YeUE28mkjXiOSrQn1S6T8+4Yn6c6OQZ9vu2E+KPkRIvX7N5QMIuZ
   0PmtLukGBRRf/T/9J21sY1KK3c6bdVlgjXYInd908CXNvcVJMCi4wZdYN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="3436192"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="3436192"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 06:40:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="922363940"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="922363940"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Dec 2023 06:40:07 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Dec 2023 06:40:06 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Dec 2023 06:40:06 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 29 Dec 2023 06:40:06 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 29 Dec 2023 06:40:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3nB4OtUj24SY6tBhXqbMkeNEr8XgVHF/JYRW+KLX2kI1Z/L1Dyd+TsU9bJw5gJRkhooT4veEcQqKlGOIhM5qjf/NcaijEETNXDz6rCeeoOkp8ovOO5Wi4jCxZYFZuchKBeHhd7iEVtw6JiI49PeQfS3sv6HsZkxwAFV+2yVeGAYEJ0ttJkICfyra+IVKSIQOWv46xPfixysF7PhBbKkY5NSONtSf/fSlYKycYx3sQkibdbCYNjnbSARZ8VO2cI4JFQaoIozN5j4VbB0suopAznfN1yx490oYYD7EWYNeESrkWcHK4o3/7WtbIHu5WzD/icOol+73AioDxBnWG0reA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyHAuMKTW3xPDz7f9PAUFnKl8+ZNL4zwTbfbeAEw/NI=;
 b=ZsxNsHVR9NAKAmRgU0rwXx/iOgbplGHX4GcK+ZVlVf49pF8T6Vf7qBdDI4yA/xPSt4A+OoPX+Z9VXtYNVhSfxy26VqBXLUyWuEbjY1OMUE9uJkea4YszbVK6dys0JKZKYmrbAZPzur58+R+2yAonebYMCLWjfKtLUOlm3Qrm5ELTuHo9lnDpAPBUruApKlsZhSq9ShwIeGB5n8VeuKQGOSsk4E1fD8dXLuWuxnq0pO/NX7LUQM5LBnWcyuFZObCNT6IuOKfnV//cy73LGkPpgHMBE4MgEjNS15SIptaDSdOUKJPyiTaPvRiklv3VWDdlHhNVZQlnu5C39VFeMBCX7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by BL1PR11MB5555.namprd11.prod.outlook.com (2603:10b6:208:317::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.21; Fri, 29 Dec
 2023 14:40:03 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b99c:f603:f176:aca%4]) with mapi id 15.20.7135.019; Fri, 29 Dec 2023
 14:40:03 +0000
Date: Fri, 29 Dec 2023 22:35:40 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: kernel test robot <lkp@intel.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
	<oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [linux-next:master 5175/8213]
 arch/x86/kvm/vmx/hyperv_evmcs.h:133:30: sparse: sparse: cast truncates bits
 from constant value (1b009b becomes 9b)
Message-ID: <ZY7ZPPqXIC8Cp2n/@yujie-X299>
References: <202312171230.oCaBKFUr-lkp@intel.com>
 <ZYBgDTkt_tZVbfnx@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZYBgDTkt_tZVbfnx@google.com>
X-ClientProxiedBy: SI2PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::8) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|BL1PR11MB5555:EE_
X-MS-Office365-Filtering-Correlation-Id: 852e6e2f-3cfe-4be6-77d2-08dc087c0aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zCoLpy/77ux066AN0UjM6oMDyfuLVUhlgGB4PyFcsLTvnlA3BtBfJgSH71KTZoQcKQSTwnbduzdtX4yCqjWT5BAHcuAqtQ+46RKeC/bdLDQSFnePgdnJN9cTALmO65C9LZDfgTC/ldg9kiNNCqREferkH73nQCKK3t5eA3QuyXIA4lOZk1Qtt2NMNrU2dfVT3I7zNoNAU48jh/xc5L6UP8syoqN9oC1pzHZudm2SIpGpRUXoxt29aY3nrStXk4s9XM+8D6J6sducI+iQVsjlvzVOJrYlkT750hrZGN8unhUvt3YFsOw7fK58wpLzQD7HuE2ZsWYobsLNTDK5GqCG+/9q8CY2k9sS5CHrarVhlY/scuY1H4cE20+pwHl0FjsmvSA1UiqM+8ozyxbD3dGO5lL0824/6/sEiONBBs0OJpArnV3cI7UxxFWqsHh20UCuzWHsGMsGOPx8xFJ9JWp6Ix80oYRPOvX1YRytRwxxG/0OiHHj8rkUdfz5KDEqNO3cBk6X9r1iNkY/obvTXOdhenoiumfoYZc+5R/WITn/Dw0fhT5AMJ3vVQCt6yVDUR8/7Wwuel6A2vkKbjQ1y9Su0+c9aVanttPVplz3QpwJV80AIMwUy+foOhJ3vBnh//w+rKAk0cuCjzbl5Ye/AF7Pcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(396003)(136003)(346002)(366004)(39860400002)(230273577357003)(230922051799003)(230173577357003)(451199024)(186009)(1800799012)(64100799003)(26005)(83380400001)(82960400001)(33716001)(38100700002)(41300700001)(316002)(2906002)(54906003)(4326008)(966005)(44832011)(6916009)(66476007)(66556008)(66946007)(5660300002)(6486002)(86362001)(8936002)(6512007)(6666004)(6506007)(8676002)(478600001)(9686003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8AA0GwRvrqsTfyv8WCloKWoljup56Hvji1y1aN4ENYAD5KyOMsibAXsKmtvV?=
 =?us-ascii?Q?Wt0ZM9QVla73L1HXPFOI66nz+mH9DClbGknIQZz+N+6kzSt+4Lu4UII2wtrb?=
 =?us-ascii?Q?Sc3U2kpux9ZFR61Ko8rbLOocd/XCfZFinWxpw/ZFst2FO0Zo8o8+Oe6po7tO?=
 =?us-ascii?Q?NWWRPRSjKXTduoisuGSXHw6rIeZTiReibITFCQPHDlN17xOGBvtSLOVTptIr?=
 =?us-ascii?Q?498u5f5UFl+Svc3czpr3Iz1NB6TCi5dh5zeUMOuUHtXVX2buYY9w0au23hsH?=
 =?us-ascii?Q?+Yf3NL76xr3pjGEMpQUMdOKfuvcUJRnKd5hJx31Lkvw8aJ0EtEp5nd9CfEcN?=
 =?us-ascii?Q?FtOSsn9CA3orobZ5wDHreFWmNNuSJQv+sJIPQsSXKKGiQQyMcPZ0wbCRf5Vz?=
 =?us-ascii?Q?AArBfsNAKG6BlZotqlVkerlACMz9FIr3nArOXEU8KiapBt3aHDK5Ybi2nydD?=
 =?us-ascii?Q?rdNt2MUB/jiiaGUuf/AYhYonfhvfgrCf4MVbIZZ12t9eKzwNz4h43ll0ax1u?=
 =?us-ascii?Q?LIIObxDtfGeQcX1j/gTZ6dDXpkkY6cEmd1KXxpLT6RM+EDiL+cQJLkqNpbr2?=
 =?us-ascii?Q?KGXja8+d20hLCzZQoz2wZMlLX3yH3zs8tVssb1Z1SevSly030vDt80uewG9q?=
 =?us-ascii?Q?NlPE83sQHXSBwk44dEoH0uqPwIN+t79bKP4r7i39nGy+vdCIubunUu+WsRZz?=
 =?us-ascii?Q?7exGyHozAIdoq86N0G8xY8Z8RCG6YH44284XMEjHLfp4pCWxhi1i8owyXPFH?=
 =?us-ascii?Q?2WOBLPuBx3kN8f+X0WYXI092NrWwnliAbakkrbT/A8AgKqItaauqU8284L2x?=
 =?us-ascii?Q?oC5qXABaGubOCHZLH7bWPXkm1oLugQmp582lfn1su5QUkNS0sMsPi2PTOr/c?=
 =?us-ascii?Q?NNmMLSun3pU/C2LR9qqP0Z5hqroIAj7hL4nT7CifT6Xq7X0OYIV48mFsFMU7?=
 =?us-ascii?Q?w0MV0j0GSA+uw2YZulBiF+htnt8/YcVnanpGh9pTHZkzKK9Y5FLfdMF9s3SU?=
 =?us-ascii?Q?QpkpsTSRqW3VyieudoMsUrNrpRUC/h7P0bnpK199hG9n0sy4+hG2ehpNPnwZ?=
 =?us-ascii?Q?VubUw5EbsHP+YTFqllGLeM/nMAWaB5Ta4cXVIybKGt2B6KQfyZMewrH0Sdd0?=
 =?us-ascii?Q?r3Tj1AZbGNUUtDwlWb41n53h4wzYSFw3pDYPnkuaH7t2bh2oiD1fo/U1BPrt?=
 =?us-ascii?Q?B1nAv8f9YCm+0u1uZVYUeimcGfkJBaISdwbsemv+4ap1S73X28Mi81aspZyg?=
 =?us-ascii?Q?x51Wxlpwl1dxU+acNzJICdIoiWXIxA8qYsSk51XGuHj48ax5IedBKX2PJtTo?=
 =?us-ascii?Q?SqmZqCIcTErdR0nTT0RPnViuWhYYoaTBvz1E1hkaxd5p+VVVmRY1qqYNcCSb?=
 =?us-ascii?Q?QZC/xY527jdCQ+d2g0Id9OM103AeSqJD+E3e3GBLToGlXqOoJjq8ayiT7PEO?=
 =?us-ascii?Q?q0uKydo5hB7WlgB/IoSU3M9iP0Aw1/1klujOg+xbBJ5X6Prs8iWc/fwlOcTK?=
 =?us-ascii?Q?YGiZAw1xJVd05TMZo+rbTiqGi+dwRRDt/rescTLJe+1XuD/Zsj4qaLl79Vgj?=
 =?us-ascii?Q?H2BX11rI9Nz6kCtKGgMVP3oM1nePnPTM7yB7xHNG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 852e6e2f-3cfe-4be6-77d2-08dc087c0aff
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2023 14:40:03.4576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkUj4NDSTnQ0J3xXO/ryHrGbAs06oziCbDIBn4IpNJCXh4bVnS4DTLP4EnsUnM4myMc+SOLum/WZbWdIOE6cyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5555
X-OriginatorOrg: intel.com

Hi Sean,

On Mon, Dec 18, 2023 at 07:06:53AM -0800, Sean Christopherson wrote:
> On Sun, Dec 17, 2023, kernel test robot wrote:
> > Hi Vitaly,
> > 
> > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
> > commit: e7ad84db4d718e18c7a133e941ba4c7d4c6d4cbf [5175/8213] KVM: VMX: Split off hyperv_evmcs.{ch}
> > config: i386-randconfig-061-20231217 (https://download.01.org/0day-ci/archive/20231217/202312171230.oCaBKFUr-lkp@intel.com/config)
> > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171230.oCaBKFUr-lkp@intel.com/reproduce)
> 
> Known shortcoming, just ignore it.
> 
> https://lore.kernel.org/all/87v89jmc3q.fsf@redhat.com

Sorry for the late reply. We noticed this is another case of sparse
shortcoming. As you suggested in [1], we still keep this sparse warning
enabled, and we are planning to implement "disabling just the ROL16()
warning" for the bot in January. We will come back once this is done.

[1] https://lore.kernel.org/all/ZWoCEUvk3Nlmlb9v@google.com/

Thanks,
Yujie
