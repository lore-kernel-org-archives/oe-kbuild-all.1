Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E576FCD7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 22:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f4TVpNa+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PE926ydW4+ILU4T4q+x4jE3ttNPue0umEzWojkG/uRnrlur2Sjr6yju0h+6XwCEq9FOIkgqhHni24dQRUvnbfulo6yWcrFPefC2DCKlC6rljp7bri+UCO9X9JHH6hynf1gxtgLrXzfCeAWATeDoAC/1WrsU/BVE4nKy1VqdT4soIr7IqKoJqV6pe+uZpNF8r+YZEvUOcSjlHenP2J/OqbwKRVGBOUmhPhnTdznkfMjr15kheteCI1HtvIwHQ3s6H2VK/FZaV3DK9cWcBW2zuXFKI86Tf1aOCNlUI8xJP6zofUlpNelPEhdNnkepoW6p0x4ovbflkKuVUCSFLjlgR5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4H64k4n5JzaWBscR7FRfefc7O/PXUdWNYx3F7wZLSfo=;
 b=oYy9DCdFNza9AksSo2zirjURGpPEr5vAfd9gjR19FIO9JvEm7MhGT+7xhdOE7geh7cwCj4FFqSts3dbV9NVfzllFkHbWAHiuIvfxEod8+AIv3Tt34DBj5m0boG0+fYpqT4Uk09/F583P/4yvqz9h/Djn6uQJiGacXq5GMLUx9e1TAmD03twcCBvu2+RgKtdPVMN3X8pPZwJxCbyNE5bOJOiM/Fgs3LXQK5xTUnP1y+ZhdY6FTTN66oXeFYJKD6Pfk2KkV5zlf1j58NmUkdBPKDaNAZXzkbBCqouCLUC4twsV7tDqH08SgsRtJurmFcqEPf39Z1n4UOe5pXrkx4hEBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4H64k4n5JzaWBscR7FRfefc7O/PXUdWNYx3F7wZLSfo=;
 b=f4TVpNa+bM/YCOtJM2/aYZQOGxobLmJUZnfCaBoJGGugiLnfaCHOPekVVmCZqyrb06yPhrMOOBKTd1Vp8LO8Swi+nXOeSNK/6LFKwNQncdxR2cKY7OkY7sEHXlpnbnHmFCCbmKOgfrzY8F+JK3gJ6HJzO+cWWTLRSg5DAEgP5ck=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH7PR12MB7308.namprd12.prod.outlook.com (2603:10b6:510:20c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 22:13:13 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::7bfc:e32b:f362:60f3%5]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 22:13:13 +0000
Message-ID: <656bda57-ce54-45b3-91b4-7677cee77a97@amd.com>
Date: Tue, 5 Dec 2023 17:13:11 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3341/4884]
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Alex Deucher <alexander.deucher@amd.com>
References: <202312052245.yFpBSgNH-lkp@intel.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <202312052245.yFpBSgNH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::15) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH7PR12MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 61fbf840-b189-4aff-abeb-08dbf5df5f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fsTz/5+kB0ckdPkvXIMMqsq8LdDgw/kOZtDvWW0FrzA5ugrepkMiiCgrVJmWzlj3tI6J3ZMq6d/xa2re3uecx0eL9Vmi2X0MiwKiagIB5vjrgKof9Au3yqF3n764n/7hdUqBE+XC/u7qNBsUnpmJFVkv0i6JCkcee/vhTcznp+ArGD1+La3ACPxdCVWIPb6ENWvaCTTZ28c4m016s4IgFJqVxQdd9W0PgTfD8xDiDVLKTulZraYO2AXaDhg6rzBjU7tGY0+4qsKXYZ9MhcyqlHXWCsllxqrQjw+0PC8PaVk0ezTF9R5bzSDk8iKHxh76lKgiYgb75YzELJcnfFUD2z5PuCEdQGwpSjIeZvb8HhY2wfHa/x2WnrxsGJrjeXYHBPSNLD2fQSAXZhFcLNeCdynnRBIPGRsc69AlAyGElPqq5X6RvHSOkhg/VfCI85KP2oAvPuevGDFcp/axHzF173iRXV9pmaRiEsjgn9vhop6iXN6fSzCDoPTZ5W8cR5enRovQD1F+DN3s5g6PNbf2z1xs2nK3wr8TqBOXN2qwKnA+A5Z5ZVq6W6Mb0NSnr9njlfBjgVLHRlW48h3YggB7Cu6b+fqe5YumdkV7jZJ1SldCNT/djqE0ky8uyYItjaJqhYTxs5jeH7PMMa+EfOnqyzblj2NmEx/rIaKLN1LgY8xDi+bWs9bzrYB/aUVumrWxi5o8YmRvfbpLN2nuptj4GAAs72fgpuJ66IL8HpDRYDA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5115.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(396003)(366004)(346002)(230922051799003)(230273577357003)(230173577357003)(186009)(64100799003)(1800799012)(451199024)(44832011)(31696002)(2906002)(316002)(6916009)(66556008)(54906003)(66476007)(8676002)(86362001)(66946007)(8936002)(36756003)(41300700001)(4326008)(31686004)(5660300002)(38100700002)(6486002)(83380400001)(478600001)(26005)(966005)(2616005)(36916002)(6512007)(53546011)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aCtsazJNK1gxVVlXemhRYjRsejMraVdUWUpUNURmbVdtMWxnZ2pDQUNES2Z2?=
 =?utf-8?B?OVppWHlQRmlqLzBiSnBpeTh4M0ZTWGh2UTMxbTYyQzRvYytTQlp4VEdpSUF3?=
 =?utf-8?B?d0gwUnlSZHNtVWNEYnRnNUpOazlyQS9CMEtpMUlING9FbytiUkhJb0diUCt0?=
 =?utf-8?B?clJCbGdETjBra2RPYVNacjlicTBVbVBSeG96QVZ4a0I0MUVIaW1wek9RR2Mr?=
 =?utf-8?B?cGFhTFNXOW8vTjhWQm9wcWJZR1poSlp5QVZ2SEc1cUN6ZVNUTCtVWUVLT0JW?=
 =?utf-8?B?RENlSXBjNVFqZGdPY0dDcnNFTDZMWVh0Smo1SkExajA4ZUQ0SVBYWWxMdldm?=
 =?utf-8?B?eXV6cTNPZ0lpelJGb3ZBNlZwVE1kNG1KczY2R3dpby9INHJsVzhhR2kwVjRX?=
 =?utf-8?B?ZE01Z2ZXWldJNTNMTXlPUkZuQng0TzFTVlRGN3BDck44a25oS1h0ZktsdTNx?=
 =?utf-8?B?aS9DYklHYWFpS29uZHhlMW03WHMxMWV3aG1MWFRJT05FNm43MkRIek9TUVEy?=
 =?utf-8?B?TWZsLzAzZ1FSUXE5dlFQQ3lldVBON0tHc3ladlA0N3d5NHF1amZqQnpJYXF5?=
 =?utf-8?B?TlFnajk3a29yeEYwUXJkbktKbjBEMnNKbUpCVzE2UWUxWlF6ZzFBT2hYa1hU?=
 =?utf-8?B?V09ENkVVTGVkQjYxVFdRbjY3L0JjaU1mU1J0S1h2cmFOQnpXOW5PWGppK2d2?=
 =?utf-8?B?RTZnaElVUGh1ZmJBeWVXQUh2SDZldlN2RndUVC81b0RiSzVTN0pVTE5aUWFO?=
 =?utf-8?B?b2Jxb0I4US9vWjBnYzJSWWZHU0h1eTJPdHQrdVVDa0NLUVYwY0ZWRk1VQUJX?=
 =?utf-8?B?NGRNYjZyZzZ0QjZZeE9Qb3RaTlpOeXhoMW1rLzJvTzkzcXJXQllyZW9PNTVH?=
 =?utf-8?B?TmJ4QnFwV2Q3MVBVYmZFVDdKOThwRVlkNWJrbE5xNnBMeDNJVU1rUHpnQnh4?=
 =?utf-8?B?M3ZZZERkcVd6aUpGQXdKTktXT0w0aEczc1FqNS90a1UvY0JKZUFNdmJROHl2?=
 =?utf-8?B?QmhKbWpQRDVTbXlnV2tqZjZ4bG9RNGRLTlJrVHhob3VTdlJxRCtxRnMrZzd0?=
 =?utf-8?B?eTVnUU9CTkN0aS93TGxsLzdBN1d0YTN2SWMyN3RXdDVlQ2dKdm1HYWZHRTJI?=
 =?utf-8?B?S1ZHajZ4ZjlhR2xqMU5kMzVmczNIOEtKRmNZcnZRRG1Fb2NFN0VvRkI3aXY4?=
 =?utf-8?B?eXU4aFNmRXZFOVZTL0dZVXFVTXdXKzBYMFhiNnFldU9yb0ZXemRuV0daVG05?=
 =?utf-8?B?RWpBUXp5SVJKaElpeVI5WHJBZmVvUW5KNjJXSXJUWjkvNFVCMnNmQVlnOFZ1?=
 =?utf-8?B?V3F4QUJzNEdXa1orUmtRdXcrVnMrbXZIKzRDaEh2UGFwVXVzQU1heEtYZkty?=
 =?utf-8?B?LzFPS01KUXp3azBQdmpTWGxZT2h1S0pYTWJmSjBHcCt5Zk04c0FsNEFTRzAz?=
 =?utf-8?B?Y0srRm4wTXQ5Z1E2TEN5WXdQbmkwR3R5NGpCRzFPSFdZQjA2aDhSK2pmRjFZ?=
 =?utf-8?B?VFdkZjNyK0ZwOWZpcmptbUc0NTljNFpwMk5Nd3BpSlRNemZyaDlZTGpVR1dF?=
 =?utf-8?B?Q0ZiZm8vMWhuakM1RG4zS05JZU0xWUZwTE9jWmppQU1nQkxrUCs0a0ZTYXhv?=
 =?utf-8?B?Mk00QndRdEtJZThxbWpuUEltb0pwNy9kcFNNT1JSdzd2cHdhUndCVWViT1dM?=
 =?utf-8?B?dWpPNUkxRUdCQW84R2ZENkVsbi8wM0pVa3VpV1JENzRBQS9oNUh5SlJDbnlj?=
 =?utf-8?B?UnNQN1pHS1BRZUhhNitiS0NlclpNbUxneTd1bk05T3hsL1JINy9raUNHSU5Q?=
 =?utf-8?B?MVhCcG5PUUtXeE85V3hVcm1sMWlKakZONzgrSGVWaEVzNXV4VEZRNk1DTDBM?=
 =?utf-8?B?RG5QNHFhNTYwWW1MR0xNS254QXR2YXFMNGk2M3NvcVZSOEpXQkpMb2hMU2t0?=
 =?utf-8?B?dlB3d0R0aXJNQ3pLR2RadVlPNmNMTW1nRlFaRSt1V1BiUW9oNEpZZFNBbzhC?=
 =?utf-8?B?UVUzekRqelM4U1dRb0NJYm9UdHBrZU1zdEpFaEw5enZML0pFSURacmZpT210?=
 =?utf-8?B?aDJmZmNackNiUFBXWVJiMk93YnJ6RFJTTFkzY1ZSUzZkNjhRUjZGWVBMYVRv?=
 =?utf-8?Q?3tHjZTU65G67a1XBb9+iLPYEU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fbf840-b189-4aff-abeb-08dbf5df5f90
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 22:13:13.5089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Byvf25dhyjlpx7CApIyfsQOkgf0kv9bwmukYVErYhjB0vA2sj2xmUG5Sw0SSlQ259N6as8pia2fgChnwPXvuMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7308

On 2023-12-05 09:38, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   0f5f12ac05f36f117e793656c3f560625e927f1b
> commit: 9a1c1339abf972477aeef4ea037e650f49c5892d [3341/4884] drm/amdkfd: Run restore_workers on freezable WQs
> config: x86_64-randconfig-123-20231203 (https://download.01.org/0day-ci/archive/20231205/202312052245.yFpBSgNH-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052245.yFpBSgNH-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312052245.yFpBSgNH-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>     drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h):
>     drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:316:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>     drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:320:49: sparse: sparse: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"

This is confusing. The assertion failures in amdgv_sriovmsg.h seem to be 
completely unrelated to the __rcu annotation problems that sparse 
pointing out below. I have a fix for the __rcu annotations that I'm 
about to send out, but I have no idea what to do about the sriov stuff.

Regards,
   Felix


>>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1671:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1671:9: sparse:    struct dma_fence [noderef] __rcu *
>>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1671:9: sparse:    struct dma_fence *
> --
>     drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h, ...):
>     drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:316:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>     drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:320:49: sparse: sparse: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse:    struct dma_fence [noderef] __rcu *
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse:    struct dma_fence *
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse:    struct dma_fence [noderef] __rcu *
>>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse:    struct dma_fence *
> vim +2765 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>
>    2761	
>    2762	static void replace_eviction_fence(struct dma_fence **ef,
>    2763					   struct dma_fence *new_ef)
>    2764	{
>> 2765		struct dma_fence *old_ef = rcu_replace_pointer(*ef, new_ef, true
>    2766			/* protected by process_info->lock */);
>    2767	
>    2768		/* If we're replacing an unsignaled eviction fence, that fence will
>    2769		 * never be signaled, and if anyone is still waiting on that fence,
>    2770		 * they will hang forever. This should never happen. We should only
>    2771		 * replace the fence in restore_work that only gets scheduled after
>    2772		 * eviction work signaled the fence.
>    2773		 */
>    2774		WARN_ONCE(!dma_fence_is_signaled(old_ef),
>    2775			  "Replacing unsignaled eviction fence");
>    2776		dma_fence_put(old_ef);
>    2777	}
>    2778	
>
