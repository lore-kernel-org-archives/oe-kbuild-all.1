Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2128.outbound.protection.outlook.com [40.107.212.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A87E1FA1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 05:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712380013; cv=fail; b=IKiB1ddfpnwZniSj296hGSHzeVS5ok7rT+rI2s99qcO9KdrbRrioGjvM++5TafaSpGgKYG/DX8ZfQMEeLjWrYtgeK+1nCe6AnEJdwtOU9QREAE5NYaR3AAy9MfTRMZoNT8YNdIiEABZPMRJyB0KOQ4AgJ8AEg7z8JtvMJ0YABxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712380013; c=relaxed/simple;
	bh=FQixpmu7+l15WINcJLb7rp1mnV4cPNXUOEITE6EIYFE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NaCgFL9JWYnRJJjBA2G2nyzzYm4zzdufoxuSBgcKPcVdTmbpxW2Nyf65oYzUwm8E4OfRqxaGtMr5vdIciSEFCtipqzfvqyF3YqsrK4l4oETS7vFLW/uE25LW+mcf/rv94bNZA/Ockv7VFJlwJzatLNj8fDINcdsLMjKEOKzN+dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CzYl+Aie; arc=fail smtp.client-ip=40.107.212.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CzYl+Aie"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DC5+/66O5hWcyQ9bw2m/DL0dSGavbQZdwqvzpJ/xJsNkYGYASHkIJyqaMBWv04jXOq7qLx2/nmsZarDEkhmYMk5lTplY8wiEerAdjhUv9G04VtqGJUURcLjkkT8j7bfWGrDfUKbhTEDqB0maxqJ3pJ8obF5AjnCsX/I/1D7GIAcDhwTpVdrIDqkfFgOqlvj2joZlyPlWtyEPuAlJFVv5yMiVKHWX0gpBXQJOmi3QaHaYuaIWXLq157/iZUwiguv+Eio8EhIm3sKKN2nVztHj8iX+ciZZ4IDnj2ALro5gP0Xg6Fuss8NwJhEl6qeFGw+Ja18kUwp4y/cLizoSH7uAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9386t8gF7I9e6SFPSdlng4zIvFIFjLfEXUvmwdUura4=;
 b=CSFT+ZcF47fawyteY8SrR4QzKhqI2G/VjFPfGhIAXKZ50nPTlzXD/uGa/lIoT11mlj994LFytQ6PhhkKNaYCrABmoEd+lwt0ZOX2BUEAvkyGQPdZhxlM9kqwlVIdspAiOCH0YGe+UAdmJ3h1dLqaP5KJie2Djl82Jp5QcRCdk0NDbby8uMpyzAAVmGK72hqLf8/7U6HN9Gd4swbueqZeqFJpwL+NF0BC62qSB8CTzrp8PN+Nowos177F6kEjgva8dulZ9C0mKMtpi2jOE9VvEHDSZ/1AczVwQpEXEI53KnLaXJKBYc4ccc2c73HAaKB6liL7utsxnqh3p7ZDmArl2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9386t8gF7I9e6SFPSdlng4zIvFIFjLfEXUvmwdUura4=;
 b=CzYl+AieJyHercqOgXzSZhsUcB+Mh1JT5sXwHtXD0NXMUQfEqGDl38o5CE5VjoxbQktlN6c4BZcAw1Nt2AMRfbMCRXOlZBPNjcaqhV8i0WKBTiCIGIPFZiyLieKoHmp/VtdMVQJHfjRj/as26mT30hYO3A+D0Q8H+rU2/LQRJT8=
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by LV8PR12MB9333.namprd12.prod.outlook.com (2603:10b6:408:1fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Sat, 6 Apr
 2024 05:06:47 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::57a8:313:6bf6:ccb3]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::57a8:313:6bf6:ccb3%3]) with mapi id 15.20.7409.042; Sat, 6 Apr 2024
 05:06:47 +0000
Message-ID: <755cda9d-fef3-48ed-9690-984b8fba5c59@amd.com>
Date: Sat, 6 Apr 2024 10:36:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1149/4242]
 sound/soc/amd/ps/pci-ps.c:271:undefined reference to `sdw_amd_probe'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Mark Brown <broonie@kernel.org>
References: <202404061257.khJml82D-lkp@intel.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <202404061257.khJml82D-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0058.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::17) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|LV8PR12MB9333:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FhO+6E5E52E7sO0iSno5Zh+r7+aSbwuE+W9sJAjna4Hm9Gb4m+3DT0O65gCHuZVD9fqIhdsetbqZUY0L2HAaeZ/wYpTc22mNHe0pZIJ6O9EmG6DQpxwiXsv5eJ5n5sTerYXLk46l1EIfDoD4KN57dA5telwE84hPueKC2OWqL2z8Mo9+jlOghwZZ2gkTudDPcP0IfLgfr0eZWlL3IhiTSAk+tAxi3QC4G44ZkF9Ntnvu1rmyOL6VdMk8E5YeJSo3TN3LZ4Ew07nS3bDbwEBFU8YB4ucJSb+gDy0pssl8fW/1NhvBt9AzIOr8AetaPZXBseGn0QRtrJjqD+lXCm1gS9SExm5W42KGM0qHqEDfcuY49ul9vB6x2CBKU3LHdHuTuYpv3xZsUrKCB33xNXMtGVKprFDsoAYame5Mux76+MlLPt2NrKt+NOHlMS1Gxw/GD6ND4iLTZpCvNbZSZi9QBL/vuWBgKnh8WBoM15hM3UHNScRJUPM7yIgp1Vr4dYOGMn/lCWLSUP5nGlVm1lXXN5Bb4sDMeNuiU98KCHKBjrx7KAShvD0k54VF8MHfrd/mJky1zuVcPzvwvRv3xv0avGUJ4slyMeuJQcHz/QEZZmuTwQr4doSCVfjFyYjOaCKv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmp0aTEwT01ZVHZXSGdvTG9HZ1BrUFlycXV5aFN0cE1kNDJ3TldySkJicVNY?=
 =?utf-8?B?VU5jV0dCZldFZDc4aWVQRDNaUnB6NWVFaVNROSt5NlBpZDRHRllldUEzUG5r?=
 =?utf-8?B?YSsyT2JZanpOL0djbW5ja3RodnFzQ1RLVHFIOS9oVVV1UWpRUWpTVDZKK0x5?=
 =?utf-8?B?eWJ0VUpiSnNhOU0zSlF6UmFYYTR5dGdDSXRnSHdKeWd3ZENOSXFlTnh1ZVNY?=
 =?utf-8?B?NUJwZnVyL2pqZWthNGRKVVVpTzNSc2ZPTU9ZeUtURitUYUVxUnZkNDRPdkU5?=
 =?utf-8?B?WW1aM2Z2azFieTVVaVRFOHd6VGZ4UWlHcEVrVHFvd3ZYTzE1SFJDUytobUdy?=
 =?utf-8?B?a1lDSGw4b0RjdUFzL0tpNkIzS2UzSXU2U0hqVm95Ulg1V250NitTb0VuR29k?=
 =?utf-8?B?WE5TZExrRzhZVmJ3SmxZbDVkNi9zd2lMdnVDbDlUMElkd002THVaNEM2eEli?=
 =?utf-8?B?bjhBcVgvMURVbi90ZWJROWV6ZDQvNFRBeHNjNlpGTWVFUkxJRmlKeGdHYUhW?=
 =?utf-8?B?ZTk5TDlKUzZCa1lsTGx3UkZMdVhZQjhKVWw3MGNlOUVhSHVYc0lQTDJtblkw?=
 =?utf-8?B?d1REOTJ3a0YzU1JzaUh1WFNPRXE2SmpQMkNlZjFsVEtmcVY0UkV6VjVEaVU5?=
 =?utf-8?B?NllHMmdnaWF1ZVpKUDNBSkl3eG54bUo0MmZxL0Rva2E5YlJPY0ZPR1BRWnNk?=
 =?utf-8?B?aDJZUGY3Rkx2Z0NjT1J1emxxd3ZKQmJFYW1YMWVXVVJwRUZpTGxyQlBFemhn?=
 =?utf-8?B?a3JGV2NvRjE0SjU0RGQrU0lGcXhvYTJIYWdWaXJ6Mm8wQ05Makh4N1VKcWdy?=
 =?utf-8?B?QnlkNFVtNkU1bFhEYjlWL29ubXNJTjVzTWtSR25kQks1U3E3K1Jlak90ZjFJ?=
 =?utf-8?B?TmJzM2tnT0EveWtpMGJNTlEyTmN5MmcrbGtEc2E1c3NqUnBnVldjWjE3NW1w?=
 =?utf-8?B?VWpIU3ZHUTB2bDlDYXAvWUE0Q1Z5VXlIcE5WMUZ5N1FEVUVBclU3YTR3NnNu?=
 =?utf-8?B?bzFERFdwVEFYSDQ3dWg4ODBUUHRsRnlkaDl1R0V3K0JNSGRQdUF3M0JjcGxm?=
 =?utf-8?B?bUQ0UG5QY0hHT2dPWjgvTlp4emhJTWZqTU5WQ3FqSXVUWVFwcWpCamFDZE9z?=
 =?utf-8?B?RVduOWF0SW5xMTF6VUtJbzZLZW9tdWRSYVJDME80dGxHLzhzQkVvekx6SGh1?=
 =?utf-8?B?c3NTdktCMFd4MGpBM2p6S05NSlJpSmZuU2IvTS9BaWtEYmV6V3VsZ1ZvZFRx?=
 =?utf-8?B?dUtzclo2WXZXNTdFdnUwc3JhblpaYVZiTlpKWDRaQ29NOStwVGVpc0hNV0pD?=
 =?utf-8?B?SklTUG1sTjIwVmpvczMrdCtOMEx1bGlBT3Nmd2p1QXdOS2owenNOMDRLdldn?=
 =?utf-8?B?Q3dkZGxiUGpnemR1eUU4bFlndlI3aVk4RzRXcFpxeERwTDFtaGpmZkxveGJv?=
 =?utf-8?B?THV4aStJcnNnWmZLRE05NXZFYUV3MWltempPS1NXS3dzNnVtcUJERENZUHFr?=
 =?utf-8?B?ZzdJVWNyT256aUFZT1lNRm5vNEtnUFpUeG1VNTFlOVk2UEYyN1REcFluV0NK?=
 =?utf-8?B?VHdZRi9lWXNUSU01bmVDMUN3MVJEc2kvcEZIN3d5S2FnQzhNTm5sSVYwd1VH?=
 =?utf-8?B?ZHFJdUNwOTlqR29VQkorMUFUMmtuTmtlS1JueUJHQmxGa3N2MUlwell0VXdF?=
 =?utf-8?B?ZEVmeTl6UU9LWjhabVlCUXV2WlpXODUzYUJyY1VHcXRlK0wwMXJOcnY3VUpI?=
 =?utf-8?B?MGowRWJ2UWJxeGFTYVlUT0tPK1V1QXdTemxrYkNzQ0d2b24raW9EdzlRQk1p?=
 =?utf-8?B?NVdLdE1ndGIyamtJWG1CQ0tqQnJYTFVOaVFBUWJSalp4RXRJQjViN3RxNVZq?=
 =?utf-8?B?TEk0aGYweE5YQi8zY2w2ZDJnekRFSWlGb2RONFZUajNkZlVSNXJMTkEzb1lL?=
 =?utf-8?B?d1h4WElyWEROVytIUURoZzZCMmNWOVFPejZkZko0QjBXQ1ZKQXhFb0hheERU?=
 =?utf-8?B?dmx4WXFsV2FNU0V0ZkkzM2gxdzlMYTlRcDJRUmpVMGM5b1ozN3JCYTRrYnVT?=
 =?utf-8?B?Z1R2RjZxRGYxUlVUaWtZWG9uOWgzU0YrRy9HMFVzd0RxbGFnZUZGNzd0UHpT?=
 =?utf-8?Q?uE9bNhP4S5bXj1bRtcB8bkCQ4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b291af-50cc-4bb1-7e9c-08dc55f75bf7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2024 05:06:47.3580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+6UrtgCspuL/omc7kGN56rKrLg4ZaJ4E4F+EsYZ2X4M/BcuQ/YuAtjOGxy1E15UzA3tQ1iTo9RUMuObKI/p9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9333

On 06/04/24 09:50, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   8568bb2ccc278f344e6ac44af6ed010a90aa88dc
> commit: a806793f231e390510343837668d8f0eade75a72 [1149/4242] ASoC: amd: simplify soundwire dependencies for legacy stack
> config: x86_64-randconfig-r052-20230716 (https://download.01.org/0day-ci/archive/20240406/202404061257.khJml82D-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061257.khJml82D-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404061257.khJml82D-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    ld: vmlinux.o: in function `amd_sdw_probe':
>>> sound/soc/amd/ps/pci-ps.c:271:(.text+0x1d51eff): undefined reference to `sdw_amd_probe'
Will check and fix the issue.
>    ld: vmlinux.o: in function `acp63_sdw_machine_select':
>>> sound/soc/amd/ps/pci-ps.c:294:(.text+0x1d525d5): undefined reference to `sdw_amd_get_slave_info'
>    ld: vmlinux.o: in function `amd_sdw_exit':
>>> sound/soc/amd/ps/pci-ps.c:280:(.text+0x1d538ce): undefined reference to `sdw_amd_exit'
>
> vim +271 sound/soc/amd/ps/pci-ps.c
>
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  253  
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  254  static int amd_sdw_probe(struct device *dev)
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  255  {
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  256  	struct acp63_dev_data *acp_data;
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  257  	struct sdw_amd_res sdw_res;
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  258  	int ret;
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  259  
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  260  	acp_data = dev_get_drvdata(dev);
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  261  	memset(&sdw_res, 0, sizeof(sdw_res));
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  262  	sdw_res.addr = acp_data->addr;
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  263  	sdw_res.reg_range = acp_data->reg_range;
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  264  	sdw_res.handle = acp_data->info.handle;
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  265  	sdw_res.parent = dev;
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  266  	sdw_res.dev = dev;
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  267  	sdw_res.acp_lock = &acp_data->acp_lock;
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  268  	sdw_res.count = acp_data->info.count;
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  269  	sdw_res.mmio_base = acp_data->acp63_base;
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  270  	sdw_res.link_mask = acp_data->info.link_mask;
> eaf825037d6df8 Vijendar Mukunda 2024-02-14 @271  	ret = sdw_amd_probe(&sdw_res, &acp_data->sdw);
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  272  	if (ret)
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  273  		dev_err(dev, "error: SoundWire probe failed\n");
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  274  	return ret;
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  275  }
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  276  
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  277  static int amd_sdw_exit(struct acp63_dev_data *acp_data)
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  278  {
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  279  	if (acp_data->sdw)
> eaf825037d6df8 Vijendar Mukunda 2024-02-14 @280  		sdw_amd_exit(acp_data->sdw);
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  281  	acp_data->sdw = NULL;
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  282  
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  283  	return 0;
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  284  }
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  285  
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  286  static struct snd_soc_acpi_mach *acp63_sdw_machine_select(struct device *dev)
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  287  {
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  288  	struct snd_soc_acpi_mach *mach;
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  289  	const struct snd_soc_acpi_link_adr *link;
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  290  	struct acp63_dev_data *acp_data = dev_get_drvdata(dev);
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  291  	int ret, i;
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  292  
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  293  	if (acp_data->info.count) {
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14 @294  		ret = sdw_amd_get_slave_info(acp_data->sdw);
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  295  		if (ret) {
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  296  			dev_dbg(dev, "failed to read slave information\n");
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  297  			return NULL;
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  298  		}
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  299  		for (mach = acp_data->machines; mach; mach++) {
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  300  			if (!mach->links)
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  301  				break;
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  302  			link = mach->links;
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  303  			for (i = 0; i < acp_data->info.count && link->num_adr; link++, i++) {
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  304  				if (!snd_soc_acpi_sdw_link_slaves_found(dev, link,
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  305  									acp_data->sdw->ids,
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  306  									acp_data->sdw->num_slaves))
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  307  					break;
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  308  			}
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  309  			if (i == acp_data->info.count || !link->num_adr)
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  310  				break;
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  311  		}
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  312  		if (mach && mach->link_mask) {
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  313  			mach->mach_params.links = mach->links;
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  314  			mach->mach_params.link_mask = mach->link_mask;
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  315  			return mach;
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  316  		}
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  317  	}
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  318  	dev_dbg(dev, "No SoundWire machine driver found\n");
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  319  	return NULL;
> bbf3e6145ea09c Vijendar Mukunda 2024-02-14  320  }
> 0386d765f27a1f Vijendar Mukunda 2024-02-14  321  #else
> 0386d765f27a1f Vijendar Mukunda 2024-02-14  322  static int acp_scan_sdw_devices(struct device *dev, u64 addr)
> 0386d765f27a1f Vijendar Mukunda 2024-02-14  323  {
> d1351c30ac8a6c Vijendar Mukunda 2023-06-12  324  	return 0;
> d1351c30ac8a6c Vijendar Mukunda 2023-06-12  325  }
> eaf825037d6df8 Vijendar Mukunda 2024-02-14  326  
>
> :::::: The code at line 271 was first introduced by commit
> :::::: eaf825037d6df89811d43391be920bf6ad731463 ASoC: amd: ps: refactor acp child platform device creation code
>
> :::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> :::::: CC: Mark Brown <broonie@kernel.org>
>

