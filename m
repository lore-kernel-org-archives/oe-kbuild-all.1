Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5798EAD7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jan 2024 11:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jrOXHeAl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1SDTWkLs6axIsXL8nSQlkzBZ649Q2upx16tnpTjEqhMLAuSQoW9jbrPS5UudhkGwkA+wOm8RNhBhBA6cPJIlPNBsBvMZUejkV2URQa6Lzx9pXYJg1vWysQJDtNuxrHrZbYReHfX9HvsHzmLvTNosqS0U13TApAAJxPSfoaOb1OkFWnnJsFrg9tUU3Iu3NtXekibu6EV4u9pQviXKgY28KfjsskOInIldQ2iQun34Zw1DwdXpySD/eLJp/PtiMpPQL3JRnQhSRZ6Dbo7J2MvP1NCWudT34MBZUftnMMCpSA45+A9Ycxx8ri6rtm8lSaaL4oWH9Oc+yoJxn1T/wgedA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Lnzrs67vcrUvB5FPymNep9MFvswF+GEAEui+tHbfgM=;
 b=STprrMIbbNhuo0FkPdH9laGtke2901oZ5kPSVTcoeyS/trRgjkWf5WJV6eg+/3fDmKpfCnATR2FO4WWOhmxQSuLogxs+GZPsgktbH58hJTl3j5+iNcFGqo//80C9d6UXhHZdwKrbkFsv8fVmZqjPAwOpyBO0xQXtK4yhHAHO2dx2ByChJQFamvFtlT5X5FZNmojFYtSK33aI2ydCeNks4xVhWODeDMNrQTIVZgyEbO5ICD+aV+6odiXX4p1WlBbJBTeAXP8u4txyqmrwTNj8EcJkmIc8zQR8Q9LHXvxDQvd1G+55KCtIyGE01oF9XD5GYhVg9Zxw6yuzDJmvponfLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Lnzrs67vcrUvB5FPymNep9MFvswF+GEAEui+tHbfgM=;
 b=jrOXHeAl6xlbL1YNeyUpIrtt/2ARNa1xxvvjqDFbZE99L+/9UIIBcZ4JKtEmWokU+DosJUeKgK2EqQzBZCx1vHtl4Bja0gsjifQ5Rb15yoYDuZFvVUMhHpeqLSF5MhSQkFgKOLuObztw5FGq+Xt6Gtl4YGA4/bPH0cDPOXNwbDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CYXPR12MB9337.namprd12.prod.outlook.com (2603:10b6:930:d8::20)
 by MW4PR12MB6849.namprd12.prod.outlook.com (2603:10b6:303:20d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Tue, 2 Jan
 2024 11:59:00 +0000
Received: from CYXPR12MB9337.namprd12.prod.outlook.com
 ([fe80::2b19:2045:59c7:cde2]) by CYXPR12MB9337.namprd12.prod.outlook.com
 ([fe80::2b19:2045:59c7:cde2%7]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 11:59:00 +0000
Message-ID: <20812a6a-6351-43d4-a84a-d7ac4e2d3a30@amd.com>
Date: Tue, 2 Jan 2024 12:58:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [xilinx-xlnx:master 1075/1123] core.c:undefined reference to
 `ulpi_write'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Piyush Mehta <piyush.mehta@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
References: <202312260447.PoEgBgQs-lkp@intel.com>
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <202312260447.PoEgBgQs-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0183.eurprd09.prod.outlook.com
 (2603:10a6:800:120::37) To CYXPR12MB9337.namprd12.prod.outlook.com
 (2603:10b6:930:d8::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYXPR12MB9337:EE_|MW4PR12MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: 1271716d-a0b5-459e-acd7-08dc0b8a34c6
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AaRlQtgllw4vhSRP87W2dJ5LfLgjrbwfqzYn9yOUN+b3x9BmOu0A0Fxc0r/ZkWGh8LxLzroMENOyCBPvHlbZwV3BtrTGYJjVFBplfMXtxH88y7dkALx4mhQgM0L5cyWbyL9dixD8sZlfcv6CqaKHucwQ9OkG7wQj+0WbCm2YGqdcGqJyHROBVRq4X5bFuvm3bSG/MojDoA53Jo8DVpKRpXf8naeq68uRxySrupk/YvylN0t5+b0X8PM/mU8SCOaBQElpOm3AzYl5m47lGNDTS932/hugzP0tTLxkh0/JirnwYX0qYz6ERvESj4LOOCesyuQyo3/4G2m5qZzLvmwJbkQE/vFZVUy9MTqijYX5D1Jhv2hv4qNee4FBU5hck0/JcttymPuGwxMF5HhkusfhzuOdo8axibGVIStwAxENArCN8QC2r84C1eeEOTMDEXl+bRM4Fi8j77unXZTXrVrD1zGfi2j7O1dZSkj1mhmjYkbH9ApJHekNi5WVwBAQ4ByAygYKukQsLMf40GuxgY3+24by0e7sVIe/C7vK7IAkhaGlntCVj/yaG3Rj2O8ZXbT7w/RaTOqIhdBvRzYf3eOzZafENbgJTlw54OAjJSLUzuz6//Hcbc2YrLu7LJa3BduEJFasFsAPTkReyns3qrIqjuicGHxGWWac1G6ZvKRM/pxZiETAM3Nr/X/4hJHBs+JwKzCNp0Q+q0F+Co6I0+OCdQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYXPR12MB9337.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(366004)(136003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(36756003)(31686004)(66946007)(66476007)(53546011)(6512007)(6506007)(66556008)(6486002)(31696002)(86362001)(38100700002)(83380400001)(2616005)(26005)(2906002)(4326008)(5660300002)(6666004)(478600001)(966005)(6636002)(44832011)(41300700001)(110136005)(316002)(54906003)(8676002)(8936002)(81973001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME41cXBzUmYreHMzSVI3aHlMMXBMcXF4RldGNTZsY3Y0NERrQXNZYmlwQ08z?=
 =?utf-8?B?MGcvUzQyV2EwNzlSMjE5ZlpBeFFmV25INEwyVzE4bzZXYWNVOTZNTXgzK2hN?=
 =?utf-8?B?UjF3SENxdktDdEtOcFlZWVhYOGNTNEhuMmhZT0JwbkRyd0x2ditTQUlraEFx?=
 =?utf-8?B?ZVBaWnNnT3dkaGNuZTBDMEFaMmNZdmdlT1c2T2paY0RMRW5VSmJzd3RVQ0Vn?=
 =?utf-8?B?K0FGU2FVeVFoMDJRbGQ4TEN0QkNCYmt1cnVmc0Z1aVdOTGtKeTQyb1daUEFa?=
 =?utf-8?B?ZllaSmhxZE1OL0JYbjh0U1VDRmZTcGtZV1NGbEwvYXBSYlcrRkMvRWJMQVVO?=
 =?utf-8?B?WHBiMjVneGxLd0tLa0c4UjlZblhVdGhPa042Z0NCNUJzUVBPWk4xTDNVTHpB?=
 =?utf-8?B?aG5zOVNWd2luUGFQd0tTSEVYSHY0TTRBMXlZNm9Ec1dXRmwrajR5UDRxUkFH?=
 =?utf-8?B?Vkh3WmZ2Z1dHNGFBOWtydENSa29iVlpOMThNNW1YczN6RkFTbjJkQXVJOWRO?=
 =?utf-8?B?L2JWYmRiL1F5aEh6bXB5MkVoM3hIT2xwNVUyTmZUbHFiZVdHVVQzZnNnZUxu?=
 =?utf-8?B?VitMN1ZPMFpLdEVYcmI5VjRvMUxEeTVaMDZoQlh0QzJMN2ZJUlc2UC9CUy9M?=
 =?utf-8?B?cHhNSnhYQUdWZ0VLV3E4ajhLeWEzS1pHbFJ3WDRwUHFoak1UUlJCVC93SUlH?=
 =?utf-8?B?ZFNERFcrT3FsMXdzTzRvNENmUTZTQmw4N3E0WGMvVDd6MUVQVytNSWw5NkZx?=
 =?utf-8?B?cFVFbDhjbkxkQ2lYWUM1YVFGMEZ4bFQyWm5NRzJZcDVESzhZTlFhNEtFMmNU?=
 =?utf-8?B?SytLRm8wZ0N2U2JtNlcxSFVkQy9wamxoa1V2VFpQL0hnK0ErUWxaMkNXR0lk?=
 =?utf-8?B?VmlFanhBUkNkRUpjbUptL0h3N1M0QTNNYmhSVURZN1JDb1VBUVdoMUZtd205?=
 =?utf-8?B?NGZTSFJLOWNEL3FOdmJqaWduLy9HbGFVMUFTQlJkYlk3ZWZHT1JoVzJXUDNs?=
 =?utf-8?B?ZkdrdEhPM0QxS0tSOTFkMFdPZkVnaVRzYTM0VzBUa2xrbWZUTVh0L1paZzBi?=
 =?utf-8?B?K2tqYUttemFxZ3llQWJkR3ppVS9icnVvK3FIOS9BMEpFQWlYbCthb0JJeTEx?=
 =?utf-8?B?cFdRcWtvYkpiczRXbVhEUnIxTGtWaTVDbCtweTJ5d1pjUEI3NjJMOGhvUGhY?=
 =?utf-8?B?SGRHQTlVTjV6QWV2amxGS2dlcWdiOVlvSnRoS2tKMmtZdTgvVnRqL2IrQkRu?=
 =?utf-8?B?dUZ0OVd3ckJabFI0cjJ4QStrK3ZHLzFXdC83S1pHODhBWWJpVy9tVGs5WUFH?=
 =?utf-8?B?dEd5NXM0UHUwckdrTzlOdnY0bFNHU0tvL25kU0hEU1g1dXp2TEZkbUdhdlU4?=
 =?utf-8?B?eWhDOVNiWWdWYncwMWRIaDRHT0J3N1U1YXlVVU1RTmxiRjFHLzhjTDBWelBs?=
 =?utf-8?B?RHpLSGxBa0RVbWhDcWovZlFERnptZGNtaEVucFl3RVppN2VYOXlLOXEyU3VK?=
 =?utf-8?B?K052cEd2Y2FucFh2R3lia3RnQ25TekhuLytWTEtkNThjTThWbUhLU1FST3cz?=
 =?utf-8?B?TG1nMENUNjFoaDVXd084QXJtL0EyNkZzMXBQYUd5czVhcHdGbjRIQ2E3Qjdy?=
 =?utf-8?B?RmFNVy8xSGxBQnJheDk3WjFZSFVnZVJJalRwZldFR1Q0Z2sva2xxOC9NMitP?=
 =?utf-8?B?VUZZVGR4ZVpJbTkwYml5MUdXa2xJTUhtVTFjVTlVc0MybnBvTmw2dzJTTGVo?=
 =?utf-8?B?cktjdVNPNHl3TFh3d2lKd1V0b0UrSlF6ZUkxMjFYUWxVczlnMHZDeUNHWEw3?=
 =?utf-8?B?TGtDeW5BQWlMREdoaG1PaktKTkQrRlNRU3J2UG1MdFMzbERsYUxHTysxOVY5?=
 =?utf-8?B?STFNNnNWT1VsaWFneXk1VUZBZms2ZEtCdnArMm9rMk05KytZY3A5UjFSS00y?=
 =?utf-8?B?dWdGYzFmaVpDLzA3eTJ3U3QzOWxWMEpvWHZDdm5PaXZoUFhQaER5UWdwcmJN?=
 =?utf-8?B?Y3NNVVA1MWhQRnc1Zjk5bk1Wb1hIa0hiTVpIRDJ2MG55Rm9jY1UyVFM5bVlC?=
 =?utf-8?B?L1d1V1NtKzBDT1M1MWl2Sm5mQ295aXRiSDJqdkhYbDAybE1rMUp6LzNjSDZU?=
 =?utf-8?Q?dyluCSkJow15BfzFlZ444w0RH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1271716d-a0b5-459e-acd7-08dc0b8a34c6
X-MS-Exchange-CrossTenant-AuthSource: CYXPR12MB9337.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 11:59:00.3167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2m2GCtNXBRyx7IUSiUZ2PHkEiHn54EAjs0S5PS5dg2FqtYb8fGT5vgJzt1532UIt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6849



On 12/25/23 21:56, kernel test robot wrote:
> tree:   https://github.com/Xilinx/linux-xlnx master
> head:   c8b3583bc86352009c6ac61e2ced0e12118f8ebb
> commit: 9e004927e608d30e05d67689ad398e05be969dc6 [1075/1123] usb: dwc3: core: Add support for disabling vbus when suspended
> config: arc-randconfig-001-20231225 (https://download.01.org/0day-ci/archive/20231226/202312260447.PoEgBgQs-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312260447.PoEgBgQs-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312260447.PoEgBgQs-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     arc-elf-ld: drivers/usb/dwc3/core.o: in function `dwc3_runtime_suspend':
>>> core.c:(.text+0x1b72): undefined reference to `ulpi_write'
>>> arc-elf-ld: core.c:(.text+0x1b72): undefined reference to `ulpi_write'
>     arc-elf-ld: drivers/usb/dwc3/core.o: in function `dwc3_runtime_resume':
>     core.c:(.text+0x26de): undefined reference to `ulpi_write'
>     arc-elf-ld: core.c:(.text+0x26de): undefined reference to `ulpi_write'
> 

I have sent the patch to fix this.

M
