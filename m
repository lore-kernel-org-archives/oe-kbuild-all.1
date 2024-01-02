Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F8FCA66
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jan 2024 09:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1EUeYeUv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEJ8gpD3MKf/b2YiiigaL59TsYm5gs0Ib8r+NSLfd0z0PFsf15MtxqGGUU7LFTjC7/C2b7kcfPWsVhIXfzkawd4y8A1vPhJFUVoxjHqYY/tGQsv83ePEvpBgN2I8CP2ZN9UF7k2G9DiqzSo0JYXoYIK2Ke4cQVs4YW0FvnENuz5VhEaRyFLsSnXhyWHE3kRo6Iz4OAElf0oqdxhrxWjmFK6wfztCHHsoLYtBYsdZmXGa4PgVoBDrjKVLJKHJXEMHdnHX4e6Hn6g0HQytL9eit9fVF+WYP5/fqGjXg/m/5DSvaagnddUq89hFlBijUyVFNo+IgKfrqb/v9ZNp+UwHFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LCVYWBE1cGfN5GioUgmD9jSQLlDFC0YrQUw70KK8AA=;
 b=R1EwDyBHSS9jbne6Qoo6b3I/azRArGgo2iISjNV0mN3JLvU+IuXb3+5U3tqDBzpBWjqOZa0q+Qq4d+VnG+2XtsLTPC+lt0F+FPViQB/qRUW98555BUC3XdNWIH64PTCN0sQwvfizfNrW9HsxdCaBd/hKnvBSgscmKx3hcuaeXzZWJInbvog1OHmIw2e1iJPXWxEtH+vRF/ymvmA31ottsthV/18geXp1XJgos0/HiizYq1sP+9wVHFsZVehrb08Vl/1fVhmLK1tp7jpqH/+2Y4lrJJiRTQji/pWYgq8sNjueUv0q9UX2T2h6ZWGfH+LQm/veMuxKHIIEHu7ngnNG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8LCVYWBE1cGfN5GioUgmD9jSQLlDFC0YrQUw70KK8AA=;
 b=1EUeYeUvOU7xsTVPQJ+WRIM7E45cH8lNgnsmagkJTSYsbXIZsRPTM9ufWIntgpyzU6i6/OOTuDzhDHDEHWxnOrn/OBUoADg+K8OG6Po+jujADNCvjQmSDNSxfPbjlBn79qOFLiya+cNOuz8rOHtb4PIeGMVjuEuZkdxNSfQICuc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CYXPR12MB9337.namprd12.prod.outlook.com (2603:10b6:930:d8::20)
 by DS0PR12MB7653.namprd12.prod.outlook.com (2603:10b6:8:13e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.25; Tue, 2 Jan
 2024 09:10:08 +0000
Received: from CYXPR12MB9337.namprd12.prod.outlook.com
 ([fe80::2b19:2045:59c7:cde2]) by CYXPR12MB9337.namprd12.prod.outlook.com
 ([fe80::2b19:2045:59c7:cde2%7]) with mapi id 15.20.7135.023; Tue, 2 Jan 2024
 09:10:08 +0000
Message-ID: <23eb1bed-6342-482c-8193-7309d813a3f2@amd.com>
Date: Tue, 2 Jan 2024 10:09:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [xilinx-xlnx:xlnx_rebase_v6.1 627/1369]
 drivers/irqchip/irq-imx-mu-msi.c:448:61: error: macro
 "IRQCHIP_PLATFORM_DRIVER_END" passed 2 arguments, but takes just 1
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Anirudha Sarangi <anirudha.sarangi@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>,
 Mubin Usman Sayyed <mubin.usman.sayyed@xilinx.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
References: <202312292240.z6w5WALy-lkp@intel.com>
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <202312292240.z6w5WALy-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0176.eurprd09.prod.outlook.com
 (2603:10a6:800:120::30) To CYXPR12MB9337.namprd12.prod.outlook.com
 (2603:10b6:930:d8::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYXPR12MB9337:EE_|DS0PR12MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: 19572750-c552-4549-9c01-08dc0b729d11
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YinlUzcQaAVbTHRxZc1mwm9Xw7+VjEe8bcuTOn1KIAPBaioFuKsMEQ57eyVZnkYxClyjpydNivMnIH4wXlDnrcFJ4qUUCjqoNNNvdF5zY/b1DWHZnqPqAvDPWvXytNYRMI9+aZ9hXBsEUUzz3GFxkh3uaQGOUudZsfFlBYt0YbnSpId2tpUKxCfKEChRHNAKFnFMA0xDuq4riiBAlAD8YjpmOhSqqggiLzwEiKhkAM3hZ0II07PhppIcdq//Xf2UhlU/4rEJrJ+HWWF4k1i0sRcIwi43DhobtLDlcewm4g9FNCs5RED0Mz2NR8siysot+QVTk5K4pMOm0CqOQZn0L1kaI5Fg8MHaDh0JL/rL+L9wVf3DjDLymbfo4+smI5ZrZvqFJEEU694aEpl8Hd7e9XbiK4x1u+J6fZEVCpn4yUjpAt9V2/9h0FKS+mX8eP94FstkqgTzqaCSPSXAlDWkwJI9te6bfAZav6KQEREB3ydPxskO9TKsIz00mF5vffsIJn+uFTQyRjmFJ4Fk/QytvNVl0ql2wF6bIDIb1a2CocicVyYCzgPR1UiKWYHuWCmc7OCW8zeWRmZUTGsHc44/hsshcWKAeF7T4FyBn3WAqAdII3ioj4ZXONMg1BhCLDzkBYzwwb/K0tYCv5C2D7krESKy9SxkaNYzwTJTqcuPQ7dMxMen4pbokYBcq5Gidjxm3Buc2H3E3hWyMmRNLWMJtg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CYXPR12MB9337.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(396003)(376002)(366004)(230922051799003)(230173577357003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(38100700002)(36756003)(31686004)(86362001)(31696002)(26005)(2616005)(53546011)(6512007)(6506007)(6666004)(478600001)(316002)(8676002)(54906003)(6486002)(966005)(8936002)(110136005)(66946007)(66556008)(66476007)(4326008)(83380400001)(41300700001)(5660300002)(44832011)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2ZRRkhDcUJnNFc1VFdUb0tFN1lvTGFKY2lNSWdoZ21LY3pucTAyZE56OG55?=
 =?utf-8?B?MVc2TDc0WDQ5VWRVY0pKS09UWEdGaDdocE1JMVhNNFRjVHM3bEhNa2pJaFNJ?=
 =?utf-8?B?ZVpDQlZBK1hOUmNob09aYjZEN0tuWkxwRGd3djNjWmVybjQxVDlmQ1dVOVJY?=
 =?utf-8?B?SGtQVW1jcXNPUXpqc1hJK0poSHU2SVVoRGNkWlRFQ1IzbzM2NFRTN3k4aXNZ?=
 =?utf-8?B?aE9YNkdsT2JnZUlKSXBWZ1BHUmZQSjRFcmRBWDQzQ1lzSVVHODgxbEtmWnkz?=
 =?utf-8?B?Z2l4aUo2UW9TbnlJb3h1LzBTSHl2RzZWV0xLRlUzc0hBMDNXL2k5bXVIOEhr?=
 =?utf-8?B?anFycWhFdlRuV3Znb1Y5YXJKQnBYN3AyVmMxNkhVRkk5cTR1QXZSWUFVU25y?=
 =?utf-8?B?RWNaNURtcjlnRFJ6UFJ1Mi9HenJDNE5LR2tRRFRWbTYwbnhHZGhpR21aRVdl?=
 =?utf-8?B?djV5MGZ1S1U2SkgzRHgzb0ZxOGFlUHdRTW1SY21jckx3YmwwNFNlbGRFZG12?=
 =?utf-8?B?QnBKOHlPS1ZnaW51YVZWNFA0a3R3dkYyOGdXTm1FZnd1NnNUdk9aQUJDZ0w1?=
 =?utf-8?B?R0lDaGtpd2ViWlFmYWNaMFh3blBVZHdBMittNi9td2NTd3VRcEVvYXdDaXh0?=
 =?utf-8?B?TzBSdFM0dXUvVm9wZlIzVVNETlNLK2dFUTcxVXJrdG1RanRXNFl0L054VVdn?=
 =?utf-8?B?MklyeDc2VW1JcE5WMWI0QWFPR0hJSklBdGJxbzhvdUpST1ZhaWJ3WUFOcUM0?=
 =?utf-8?B?WmgyWlZ6OFFTN0J2Z2loMk54OHd2ak5JQWZ4QTVhS1R0T0ZKTW5pY3lmVkFo?=
 =?utf-8?B?YzhWU0R0QTJhMG95bXp0bjNLc0s5eFJ6bWNZbkN5cnU1SkxqdXkzYzFYbkNz?=
 =?utf-8?B?b3drUTlsRmp1eTBud2szS043TGo2QWlwM2NqQXhzVjZZRkQ5R3ZYRmtCdEMw?=
 =?utf-8?B?dEJPWURCTyt0azRtbkJwcGdLSUt2Y1p0VFNiMVduUU83a1NWK1FNclNzdFRi?=
 =?utf-8?B?ZTZCREl6ZENBTFVxZUhvVWdpOWE2Wk9uZ0JLR29tdXNOOXpta1NVNk5TRnpu?=
 =?utf-8?B?eGEyelpGYi9vTFhZYXphemZwQ1BMOHZvNC92NnFtbnZmbGZYbW1RQlpYek1p?=
 =?utf-8?B?UXBhUjNBWmVqbG1IclVaOUdhSTRhYUVHTEJuUnhVRnRyd1g4N3RSS3NvS2NB?=
 =?utf-8?B?S3RYOFVXaGhvOFpzQWJFMmRNa1Q1QTJmUDdrSmwwYjg2MGF4T21zNTk1Z21R?=
 =?utf-8?B?ZkNCOUJtYUYrTUlGR1Y0K28zekw0RUNBWUlCTncxM1hiY0xrS2xBRUFWL3FT?=
 =?utf-8?B?bEhXQWVHQUN3M0ZTVEYrVktLTXU5a0ZRbG44aUdRMXQ3ai9GRjRWV2xQeXp2?=
 =?utf-8?B?Ryt5ZFY2MlZYZmdYVHFHY056NjNjeG1paEp3OHV2SUJyQUx4bEtvdmFaNVpN?=
 =?utf-8?B?V3lWQVFUK2d2ZWI1WGJKRW9FNkFWTkg2ZU9FSzFvNzlSNm5pRlJSaUNSVWFq?=
 =?utf-8?B?WHlyN1RRYlM4VXVSNHZ1N2ZHM3Z2WWxtWFN3cUJUdWwrdEZzbXpEN3Z6TWZt?=
 =?utf-8?B?eTdwWHJlOCs3Q0F0RVZyVUdIb2tHQjVHUnBxS3VxK2c0V3BWZGVGRTVxeXFG?=
 =?utf-8?B?a2U1bVl0QkFsMSt5OFUzeUFOR08zQzBMUXhiK1YyUUkyQUdmdTlZdFQwVVEw?=
 =?utf-8?B?aWNaaWNpY3U5V0NaMWtLZlNDQ2R1S014bVV0eG9xNm9pdnF4TVRYZUhJUENq?=
 =?utf-8?B?L3orWjgzSFBhTTc3djd1OEhYbU5WTGlGbmU4S0JRbitWaHRJZFF3dUthY2V4?=
 =?utf-8?B?VmU4dHBUT3hvYkRBRElrK2VCc3NaZFZqWGRJWktEMmtHTzdmemI5eWk3TXh1?=
 =?utf-8?B?MGs1Z1JVV2hxSVVSTE9xMVUyK0tpcUZZODdZSXFUT3pnM2ZwcVVvYmJ2Nk5i?=
 =?utf-8?B?UjBWQUpHM1drcnY5ZWY5VG9SbUhyRm41QVQ3TDJ4dHZ5Q1pZd2dxaGZQVTlk?=
 =?utf-8?B?bURKTFVicFlkTE9BWHhIOFNReDdKVHNVdVNIZWpRamFOdFdTUlEzdXRQMzIx?=
 =?utf-8?B?MTFDdktLbEpkdFhIaXpGVTFuZ01LTzg5eG9QQUlnNjNOZk1RL2l5Q083SktK?=
 =?utf-8?Q?bC9noucCHwBJHXSUvUKqn9Pfi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19572750-c552-4549-9c01-08dc0b729d11
X-MS-Exchange-CrossTenant-AuthSource: CYXPR12MB9337.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2024 09:10:07.1491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tae006SFpcYzIqmNJLwMLm1HqAZ5d18waD/dyN6ChegSSVU9Xhl+hSL1v5mD2Xnp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7653

Hi,


On 12/29/23 15:32, kernel test robot wrote:
> Hi Anirudha,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1
> head:   cc7310fda242b85900cc805b028f2f21d1d8f210
> commit: d57a0ce28405d21558291942fc17979408936244 [627/1369] irqchip: xilinx: Add support to remove Xilinx INTC irqchip driver module
> config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231229/202312292240.z6w5WALy-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231229/202312292240.z6w5WALy-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312292240.z6w5WALy-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/irqchip/irq-imx-mu-msi.c:448:61: error: macro "IRQCHIP_PLATFORM_DRIVER_END" passed 2 arguments, but takes just 1
>       448 | IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
>           |                                                             ^
>     In file included from drivers/irqchip/irq-imx-mu-msi.c:15:
>     include/linux/irqchip.h:68: note: macro "IRQCHIP_PLATFORM_DRIVER_END" defined here
>        68 | #define IRQCHIP_PLATFORM_DRIVER_END(drv_name)                           \
>           |
>>> drivers/irqchip/irq-imx-mu-msi.c:448:1: error: 'IRQCHIP_PLATFORM_DRIVER_END' undeclared here (not in a function)
>       448 | IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
>           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>     In file included from include/linux/module.h:22,
>                      from include/linux/device/driver.h:21,
>                      from include/linux/device.h:32,
>                      from include/linux/acpi.h:15,
>                      from include/linux/irqchip.h:14:
>>> include/linux/moduleparam.h:24:9: error: expected '}' before 'static'
>        24 |         static const char __UNIQUE_ID(name)[]                             \
>           |         ^~~~~~
>     include/linux/module.h:165:32: note: in expansion of macro '__MODULE_INFO'
>       165 | #define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
>           |                                ^~~~~~~~~~~~~
>     include/linux/module.h:235:32: note: in expansion of macro 'MODULE_INFO'
>       235 | #define MODULE_AUTHOR(_author) MODULE_INFO(author, _author)
>           |                                ^~~~~~~~~~~
>     drivers/irqchip/irq-imx-mu-msi.c:451:1: note: in expansion of macro 'MODULE_AUTHOR'
>       451 | MODULE_AUTHOR("Frank Li <Frank.Li@nxp.com>");
>           | ^~~~~~~~~~~~~
>     include/linux/irqchip.h:45:69: note: to match this '{'
>        45 | static const struct of_device_id drv_name##_irqchip_match_table[] = {
>           |                                                                     ^
>     drivers/irqchip/irq-imx-mu-msi.c:444:1: note: in expansion of macro 'IRQCHIP_PLATFORM_DRIVER_BEGIN'
>       444 | IRQCHIP_PLATFORM_DRIVER_BEGIN(imx_mu_msi)
>           | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/irqchip/irq-imx-mu-msi.c:444:31: warning: 'imx_mu_msi_irqchip_match_table' defined but not used [-Wunused-const-variable=]
>       444 | IRQCHIP_PLATFORM_DRIVER_BEGIN(imx_mu_msi)
>           |                               ^~~~~~~~~~
>     include/linux/irqchip.h:45:34: note: in definition of macro 'IRQCHIP_PLATFORM_DRIVER_BEGIN'
>        45 | static const struct of_device_id drv_name##_irqchip_match_table[] = {
>           |                                  ^~~~~~~~
>     drivers/irqchip/irq-imx-mu-msi.c:421:32: warning: 'imx_mu_pm_ops' defined but not used [-Wunused-const-variable=]
>       421 | static const struct dev_pm_ops imx_mu_pm_ops = {
>           |                                ^~~~~~~~~~~~~
> 
> 
> vim +/IRQCHIP_PLATFORM_DRIVER_END +448 drivers/irqchip/irq-imx-mu-msi.c
> 
> 70afdab904d2d1 Frank Li 2022-09-22  443
> 70afdab904d2d1 Frank Li 2022-09-22  444  IRQCHIP_PLATFORM_DRIVER_BEGIN(imx_mu_msi)
> 70afdab904d2d1 Frank Li 2022-09-22  445  IRQCHIP_MATCH("fsl,imx7ulp-mu-msi", imx_mu_imx7ulp_of_init)
> 70afdab904d2d1 Frank Li 2022-09-22  446  IRQCHIP_MATCH("fsl,imx6sx-mu-msi", imx_mu_imx6sx_of_init)
> 70afdab904d2d1 Frank Li 2022-09-22  447  IRQCHIP_MATCH("fsl,imx8ulp-mu-msi", imx_mu_imx8ulp_of_init)
> 70afdab904d2d1 Frank Li 2022-09-22 @448  IRQCHIP_PLATFORM_DRIVER_END(imx_mu_msi, .pm = &imx_mu_pm_ops)
> 70afdab904d2d1 Frank Li 2022-09-22  449
> 70afdab904d2d1 Frank Li 2022-09-22  450
> 
> :::::: The code at line 448 was first introduced by commit
> :::::: 70afdab904d2d1e68bffe75fe08e7e48e0b0ff8e irqchip: Add IMX MU MSI controller driver
> 
> :::::: TO: Frank Li <Frank.Li@nxp.com>
> :::::: CC: Marc Zyngier <maz@kernel.org>
> 

I sent the patch to fix this.

Thanks,
Michal
