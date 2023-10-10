Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8225332192
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 19:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0qRaoPdg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYgMz7Sc/RmyAR0z07IRODHBZ4pnSNVAfrA2AxdKtkX/bW3TwH3IyaoxfXdrHp7/VAwrghqAa4+8SouPLGtBJpcCd/OEqVLvnFk6Cha+vpBbq5RU96FK0eamanOTzQ5FFFza5A1UXhpFjxlX90TPydHdarb324OY0bBbpGDsidnNe35GgG09scPLjnNbPsQNH74JcWtXgaW3zUtTn8MFnZBrbcO33mcCcpgRIaD5Li87oDKc7e+KUbFbCfhxwjszZTxqkxtV1L9tkkELP9QZUkUlrzGKnMsvSC/LL75dhnGEqJOh+GxhTDj9u/hwY+lmezWv497WcOEH5GMxKXJ+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsMQ3vbe3UvZO9RjmxAEDBfczhJzh9Ji9mQqjYsGgsI=;
 b=YYiAYEZIau+Bf2ROWUGSdv4ex6fHrrfyVhtd+ZdU04rNKBNIWXcgdxS4vL8X64ryu/Ip5x3BW82fbKceztnZEIYqZlzdilZOGWH+iMlTzfT6TVgcl0nXmZC25Admoyp0Yk9TJpe9ANRf/RwrJ5TNVOSW0ogdeWPJNM8HGKmViA7nvNAKe2RvLo4CX02dnk3+Ewz+jLC8sgvSd4TnH9dxAXCwksN3J0IYnP4Q9UX+KGC1JRMJTYYH9plqcMLaWiZuNRgOegd42s2syguUo6fWAGEBojCGcEWf6hZCGlRN2STwuppfwvJJiUWFYRNmrUoVm3mR765HgAJsfhTxFKPX/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsMQ3vbe3UvZO9RjmxAEDBfczhJzh9Ji9mQqjYsGgsI=;
 b=0qRaoPdgcrE36S9nuU7nMOxO32c+rKZbyesQwLXERri6va9wuhsGxXshfBLqWpEehIWw7ClMhc2eAsSOO5LElg8absAPVeOJBNX35E5Gom0vBVdxKZ/tXguqr+jZjv1xfWmplMA9ysDGcjOh0fdhbMafO6FB3/SyjFjJrLW4PaM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 BY5PR12MB4290.namprd12.prod.outlook.com (2603:10b6:a03:20e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.38; Tue, 10 Oct 2023 19:52:10 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5aa2:3605:1718:3332]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5aa2:3605:1718:3332%7]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 19:52:09 +0000
Message-ID: <52b2aa0d-d864-428e-b7da-90f7a38657df@amd.com>
Date: Tue, 10 Oct 2023 15:52:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 6935/11192]
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:538:25-29: ERROR:
 aconnector is NULL but dereferenced. (fwd)
To: Julia Lawall <julia.lawall@inria.fr>,
 Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 oe-kbuild-all@lists.linux.dev
References: <alpine.DEB.2.22.394.2310102123460.3328@hadrien>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2310102123460.3328@hadrien>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0254.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::21) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|BY5PR12MB4290:EE_
X-MS-Office365-Filtering-Correlation-Id: cc2ad055-fde1-40ef-e266-08dbc9ca63ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VsMQ1s+j3mnStmsNYKCEu1emJ4C3A3GIICM0I1RIXf9dFkBRjQFyF1b/7LBzj93YRtT3mMUmxixOGfcApsGSnTK5YVD1mA2U8iCx0uETsBlruzclCBk+QagvYkxLajDcP+Rveol4oCCMt8Hv/8wIQTYjAuwqi/RDBP9gs1GpoQ90bS8UEeIVxSjjD8rWN29IYyDU3mech0XcB8EJG6+nQpnzUMDf4IjrT6tHU8ofWQbwZ3i0HcY7Xxnh1WTvTlyHPDS2OM/3IkbmSxYGFdV28Su2gxpFhXngoKfR5BN5ltePHeX16JJDkKq5Ss5way6o9YwgVpmtYcRoOcHpqKDXyPMcP3jp4dGJGnvD1clSt6N2uvoymn5pzxK3dX7Cuk9nyWQEAZXltYww5cSMcfmGNpKll5/jcpjX1nQGRw/F3UIpm0obUEKDlHbsjo26DAwt74tNhO+NN93oekrOnaEgmtI0/Kxi+EfRl47wMgBezd9mwNqYJRxhh3ZgUYjCBYcpJ1OB2Txo9h4WvirRnmT3qkh2koYwpCpc8iQezwyvTQRrBh2QnB1Z3oDpGOEV7mXkBwti/HG/cSh+vV9DzbTqm64d4qtGIAU/lEvsh0gx5uWxnslj54ZYY2NJQcu4cFKubcLxKE6J9E9H2k7ZcXA4yZqeO6fbjH0SnMUQt1H8axQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6280.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(39860400002)(346002)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(31686004)(53546011)(2616005)(26005)(6506007)(86362001)(36756003)(31696002)(38100700002)(8936002)(4326008)(8676002)(478600001)(2906002)(83380400001)(6666004)(6512007)(5660300002)(44832011)(6486002)(41300700001)(316002)(6636002)(966005)(66476007)(110136005)(66946007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MS9LRDFYZ2thRUEvNDc3bEE3cmZvcTlCRFQ4TkJZM0JybGlJNUlqT3MvNFpy?=
 =?utf-8?B?T1BObE12L3pCVGxNVzdjM0FMMldPNWtaL0J1aSttVnZ2c053QlNKN0dQNVM0?=
 =?utf-8?B?dVROVWRoZjdBaVVHMlVBVDZIWHNBaFZRUERtWmliNXpIeHpPSGZUallNWVFE?=
 =?utf-8?B?UHFVQmhHZHc1eGlRTjJ1dmdNWXo0UTdkVko4VDExb0ExN21tdDlhLy8wWEVX?=
 =?utf-8?B?Q1lFY2pWOGJhSlNKdWVOSlRUc3Ivb2pmRW0yR1MydlZTMFVaWkhmdzhNZEpL?=
 =?utf-8?B?RGRYbXFnQ1ExWHpJUWk4N0NXSkZ3V1VCeXBRZk50a01ndHZwaUhWeG5xdlo4?=
 =?utf-8?B?QXBod01ia2pFSlk5V01zb2NnMXNEMmdIQU1qZ202TUhkbHJPdmpiWkY1bHVF?=
 =?utf-8?B?cFdMZzFKeERSUkwyRTRUeUNTb3dKMmJiNENiNjduNWNlZWZMUG5PbWx5dm5m?=
 =?utf-8?B?azl0bEtpMlZRVml6aGU3Y3hZV2NGSXU1SmJPb2t0K25HN3Z0U2dkYitZWVdO?=
 =?utf-8?B?UXVMcXRkcDNhaE5JUE05c1FDck5TRGpreE9aTjg4M1JQVzZwSEZBNUM2TzF4?=
 =?utf-8?B?QUhuSUVDNW0wU0pRVXJya0ZLaWt6QWtQODlFSTRmd04zRnE2MlBTZlNQeWZn?=
 =?utf-8?B?YWhsbXZEMHd1Vk1VUHByd05wdG0xdWxwZ1ZnU2RYa3lZVTJIaWNiTmdOa3Bi?=
 =?utf-8?B?NjdwYS9GOVpYVTBsSm9hRSsyY1lGVUsrRGRVWU8xOGNLQWsyeVo4bnpWSWFm?=
 =?utf-8?B?OWhCYmlwQ1F5ZGJyaTJSdCtHWXZXbmJHSFlFZlRiRVVkUElnRUtTRmZJNkp6?=
 =?utf-8?B?UDlBQjBiYzlPdWM4L1N0cHArejllVC82OWJ1Z3cyYUh6b3ozeTNhOEdoZ0h1?=
 =?utf-8?B?U0w2VkxFaVlCdGlkSnFiZkpBRHZJVklzRWdaUVZubW04M09DcC9ZRmJlQ2Nh?=
 =?utf-8?B?MEZHQXB1Ym5YMFh4NXZFck9xSStqOEtKMS9sTUhPclVqTWExU2Fxc2ZUdHAv?=
 =?utf-8?B?aUQ5SWphTFJMNWlkb25VSEc4K2dFdnJINWJSbkt5aS92SWR4b3NkWUNCNUYy?=
 =?utf-8?B?TWxZblN1Q0VscGVybkdVcjh3a2JRTDF2MEg2cDFvNkdkZ0dUTjgvUTQ2bld0?=
 =?utf-8?B?amhNek5ETm05eWpSVFpJd0lSeEE3eThGbFRvc2NEVlJacGYvaFQwMk5HZ0Rq?=
 =?utf-8?B?V0VvRGFHSDNFaWpWZlBWUkM0MzgySGY5R0hYVmJLN3huci9uYktRd0RPY3RT?=
 =?utf-8?B?SHpqWFpVeUhIRzVuRXQzWDNMUENyNUFTUVpYMEw2anlvNkpFSlJCSWJnaExE?=
 =?utf-8?B?R2xtSHlsdmI1aG9YSzBGeEpKZXhGNnQrWUlZSml6ZitHektuZFVMWnYwallO?=
 =?utf-8?B?Wm1hTysrQzVpellMQ2xBYlVwam9ERTMxd3diR1Fic2FSU0xJV213ek02SUpa?=
 =?utf-8?B?aTdtWHlKZUIwM0gwQ1FpZ2RkZFlNWDEyY0UyMjNEbnlJbHh0Q0ZsekkrcXR1?=
 =?utf-8?B?NFFEZkRBQ3dHZW94R1lwWWQrdndoVnZKMXd5bC81b3NmRGxueHljalg3SjBB?=
 =?utf-8?B?VTNiK3dVZkNsOCs2dXNFQUozQTF2UkhpckFuNC9kRndTaXN4bEttYXdLTHNh?=
 =?utf-8?B?OVdwZmROS0NVVGxvbmlMeFlpTVUzNUp0VzZHaW1ZLzdxVUhxQ1oxenJDNGw4?=
 =?utf-8?B?UWVHd1AxZURGbmZpOTVUdGtWbmxxdk1BaEQ3WVNHcUkvcGJCQW9xOHpYek9K?=
 =?utf-8?B?aEZXQVU3R2tNaHFNUmxyRWJSUkhXellwUUpINTFjMzNlZ3UvamZFMTd5R2hO?=
 =?utf-8?B?dVk1a3Z6MXdZbDIySjJhMVNJYkpuYnF0bVFMSzNHMExoQ0I4ZzJQQS85bHho?=
 =?utf-8?B?VmpDYlQ2TFdRSndjOWZGQndQRHNVaWxHTEtXOFM1cXgyMXp0Nm1PeXpPZm95?=
 =?utf-8?B?bVNxcDZBS2ZkRUlzODFMb1hHWFpyVE4vK2I4T3Z3K3lNVndtTTRIL0Rkc3dt?=
 =?utf-8?B?WE1WTUIyQUx3WkI4Q2NjY0hqcDNmbnZQZ2lKZCszbXd2YnZHZ2N1Z0FRQW9E?=
 =?utf-8?B?Q1A5K3hBNW9ySlpZYTduS3M1cXFsN0psL214YUNaZXdLaEFnZ3E4Z0oxb2k5?=
 =?utf-8?Q?H7ECBKr97Gz7INgV625fS8A8d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2ad055-fde1-40ef-e266-08dbc9ca63ae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 19:52:09.8154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CkSHniNsgZmZ4M5ZEK4mW1TFGEQEP6o5cfE5DaWjp5xPrSy4kvLAoF6mqYfU1YJ7nuglwvbuUxsHVSXByq90w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4290

On 10/10/23 15:24, Julia Lawall wrote:
> See line 538.
> 
> julia
> 
> ---------- Forwarded message ----------
> Date: Wed, 11 Oct 2023 01:30:34 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: [linux-next:master 6935/11192]
>      drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:538:25-29: ERROR:
>      aconnector is NULL but dereferenced.
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: Linux Memory Management List <linux-mm@kvack.org>
> TO: Hamza Mahfooz <hamza.mahfooz@amd.com>
> CC: Alex Deucher <alexander.deucher@amd.com>
> CC: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   c0a6edb636cba9c0d1db966a54d910a02e52e4be
> commit: 5d72e247e58c966f4e50cffebf0d414de7fc90ed [6935/11192] drm/amd/display: switch DC over to the new DRM logging macros
> :::::: branch date: 12 hours ago
> :::::: commit date: 2 weeks ago
> config: x86_64-randconfig-104-20231010 (https://download.01.org/0day-ci/archive/20231011/202310110104.H593hwLd-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20231011/202310110104.H593hwLd-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202310110104.H593hwLd-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
>>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c:538:25-29: ERROR: aconnector is NULL but dereferenced.
> 
> vim +538 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> 
> 4562236b3bc0a28 Harry Wentland 2017-09-12  534
> c84dec2fe8837fa Harry Wentland 2017-09-05  535  	struct amdgpu_dm_connector *aconnector = link->priv;
> 4562236b3bc0a28 Harry Wentland 2017-09-12  536
> 4562236b3bc0a28 Harry Wentland 2017-09-12  537  	if (!aconnector) {
> 5d72e247e58c966 Hamza Mahfooz  2023-09-20 @538  		drm_dbg_dp(aconnector->base.dev,
> 5d72e247e58c966 Hamza Mahfooz  2023-09-20  539  			   "Failed to find connector for link!\n");

Can you send out a patch that drops drm_dbg_dp() from here? Since, it
should only be reachable before hw init and it is expected at that
point, so it doesn't provide any meaningful insights.

> 4562236b3bc0a28 Harry Wentland 2017-09-12  540  		return false;
> 4562236b3bc0a28 Harry Wentland 2017-09-12  541  	}
> 4562236b3bc0a28 Harry Wentland 2017-09-12  542
> 4648cf5fc8c78d7 Hamza Mahfooz  2023-03-08  543  	return drm_dp_dpcd_read(&aconnector->dm_dp_aux.aux, address, data,
> 4648cf5fc8c78d7 Hamza Mahfooz  2023-03-08  544  				size) == size;
> 4562236b3bc0a28 Harry Wentland 2017-09-12  545  }
> 4562236b3bc0a28 Harry Wentland 2017-09-12  546
> 
-- 
Hamza

