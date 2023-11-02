Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FB446BF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 07:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vMVAJAlI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PV5IxqKX8unZMgaSNDlSP57hVHLqH8BwFlt15+lIB1KAhg1T/m8JmZ7EkjFDftDePkrVG5/4KNFcEy39552lhC6Gmx6ojm/Xru2MfhoBWVN28PT5/0oa/jT6S/CMRA6+zfU/ZYzWeiD5t0Niz/fgml9Nky03JGUjXoBe7mSuNHDrZKBDr6GhWbgVSsfQeh3yI2NgIfPYloDXytMRyLMhqAtxDfyQ6eGa+atIdIjhlqUu1+gWmHJ8a0RM+0dMYHHTOFsXk7LAJtQxuff4Ir090pXt1P3dknOgg32siDya2A/s+DA5fobg6sj3/kHo5Q5HmrGKXW6lBDsZ92SB6fTmLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7MDimZRdgVV0R59fR9cy4Zyb2sAUnnW69mKl9CmANw=;
 b=RXgp0rg+KprMv7cdbHIZpvd7HnXCpVq6qwNibgS/sTW6zKrUmTI7Qn3z4Z0gsGFfZFqZDfk3PslrapsgPGSetBYAlzHvEejChUHYDF/QAydNX17BtctLUg6+CEaAibkB4evldYQytG48wdDByP/KLA7PxgZEse2j8xMyF5cSYVrBrMVQxEENEhgxvOtSnuOb2JevvLQOjExuJChBCY7QYi1A/+VpyumON/PxI1RkvO5S7FNiiw5WlIlrHuS9kll8dIz/RmXZJXmZXJ8CR53r7w/6K6u2Q53lv/VnnaMBF6cKMxfd6x6Hhqfs+4IoEWYu+SMknwjzkq55tdiD04sSDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w7MDimZRdgVV0R59fR9cy4Zyb2sAUnnW69mKl9CmANw=;
 b=vMVAJAlIxuCEvZtvDWKoY6EPM3lefPu2fhRm0LNRnT0RBquk51q06y8KkyNN/rmphADAYRCtP+gayFeWi1tl6pNzbQrDXkP3+7KmB1ND0qg8+y7tSVUuEhnh7z/3fZInkrm7Folo56Yt3cVvVqWtQ8HUFYQCGmtOyE4oxG7KP2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3661.namprd12.prod.outlook.com (2603:10b6:208:169::31)
 by IA1PR12MB6601.namprd12.prod.outlook.com (2603:10b6:208:3a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 07:14:14 +0000
Received: from MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::7354:d327:ee4:dd79]) by MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::7354:d327:ee4:dd79%4]) with mapi id 15.20.6954.021; Thu, 2 Nov 2023
 07:14:14 +0000
Message-ID: <b969cf18-d326-493c-89ba-bbf9f51b8eb2@amd.com>
Date: Thu, 2 Nov 2023 12:44:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 14482/15964]
 sound/soc/amd/acp/acp-legacy-common.c:392:19: error: implicit declaration of
 function 'acpi_find_child_device'; did you mean 'acpi_match_device'?
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Mark Brown <broonie@kernel.org>
References: <202310312340.o6CthxSp-lkp@intel.com>
From: syed saba kareem <ssabakar@amd.com>
In-Reply-To: <202310312340.o6CthxSp-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::21) To MN2PR12MB3661.namprd12.prod.outlook.com
 (2603:10b6:208:169::31)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3661:EE_|IA1PR12MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: b410d2f3-733f-43fc-ef2c-08dbdb735126
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4SiEv/2dAW99lYofgAC1hAJrSgF0vNX2SOOQbIS4Qq9jNGHXDh2P/gIqZdsDURJR1iSiDCBf7WTAoMozG1LoYR6Cj1mw7UwnZogml9mb/hBbFJJU8vDABjDDLxchMmUatijFz2S8TTGtL7KGlRYCsRXJ2B/Uzgk8hpCNDVm+ZsfaY0szRIYUImNOHTvaybHV4bomVfq8F09FUgS6BKISbTgj1dqeOBuFQcX5C/Y5RzYDwTi8T4TyeYiDJcZLXd+0cD6qlTtJaWzhzoII9zXKva9KNRcJbLJBEolC0CBX9eX9xovfniSEg5GMJXeTNh/9X9V2yIQ2uGIcBpDymIWs6ol4TWg6MzGqt1+Yl8S40THZDbR9ks7b7lxYYkHvsdjxUnYRBDFNe3FrzyXG0wHV1/heG8PsZLTV469ZctocK2UQ24HSmu2nq97KtfhseXo6cQr3Nx1hwmIMGzjidubulfDxteHjRRxkyliz+g0kFkprgRZ5rghQReWA/Ubd//u3oZc+17chE/pdbP0veF+mvwCE/Asquf/drFxFeHeRl8+Hf1NFAsFcadZua52wcUpWXpXlwOHDwGaaqJdUYcM5VnN5z90CbJTJ9k6uyiehYbsAMO0IDNznydEI75GoiXmSyk1Scj99seLccnLzf+bIsZZ2LR675Ilx43gc+t4ahv0I1R9FWZH6WEnVhriWYPPgYvnRCkhPRKYlO9wmAoQhyw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3661.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230273577357003)(230173577357003)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(26005)(2616005)(6512007)(478600001)(6666004)(6506007)(53546011)(83380400001)(5660300002)(2906002)(41300700001)(6486002)(110136005)(966005)(6636002)(54906003)(4326008)(8676002)(8936002)(66476007)(66556008)(66946007)(316002)(38100700002)(36756003)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2svcFNtdTByMnlhSFBuLzh0T0VyYWk5UG1EbTNab3pNMkVyVU1FTHc0ZTNR?=
 =?utf-8?B?T0NMY2IxRGVSS3hsQjNUamZkSjk3aitYbktHTm80NFQxK0VreHRLVkRoZlh2?=
 =?utf-8?B?SGZnY3FoS0pVN3BMZnVDa0x3SHM4TlB1K3B5cmZ2OFNkNkR0dHNGbWI1VXhj?=
 =?utf-8?B?S0d1MGVwK1ppeXVXeXlDTFM4QmIvUzBmSVlpd1poYmd6VWszSEJwcDhGeWNL?=
 =?utf-8?B?dzVVRHJxOThhRTJWUGk1NjY3aXVxOUJpSjFtcEtldzFFT1dhUmg4UnN2RElJ?=
 =?utf-8?B?R0oySy91aE9oUkF4bWJveXg5VmFINW5IV2JDL1lVcEVyb3JtZi9DamRDR0Ix?=
 =?utf-8?B?djkyenBGRlJlVnlrNU5MR0I1b2NSVHc4SWZRcFgrVVdNY0JkZTg4L0ZHN2o0?=
 =?utf-8?B?ZkRReWNFOXBETUY4UEJtY2J5SWZFQmY5aEhxTWdka2hGWTJhWnNxOWV3UHhW?=
 =?utf-8?B?OFlXdXMzdkk0emhoZzBwV0ZwOGM5MStwUmlyMGgxQittaGlkWHYzVnFyVlQ3?=
 =?utf-8?B?bFNXdVRsSUhpSTBYL09ZdlhzTk9xZ3FPcGo5RDdsbU1oS0FVNWFOaDI0Rkh4?=
 =?utf-8?B?UFVIYlVtWkV1VUs2ZVZsRjUxZTUzQ0dNS3ZyRlUwRjFSdFF6QjNxNmdCaWE4?=
 =?utf-8?B?L1VxY1JIdzYvQ2RGSXVTaTk3c3FMTFZpS2srMjZMdGR2Y0g2V3gzZUlkenVw?=
 =?utf-8?B?aUFrRlUzcTZpemFEOEdscWZHbzg0OEtIQ3dGZjFIMk5Vc0hEekMyOUxUN2Y3?=
 =?utf-8?B?dS9qZTFaMEpnTUVsenlmWnBWRTZsUlNsRXBQS1VWRnZlVGxUdmVtM0pyRlVQ?=
 =?utf-8?B?TFAvK0JDK1ZXaUs5elRwVjR0d2VPWld6NXdEK25LN1FvbWo0RFdnSG5MZ1Fy?=
 =?utf-8?B?SUZDd1lGYXd5U3Rmc2JSQVpIbHBLVVV0MmdzTHJOMW94TnZhQXJWMTBiSEsw?=
 =?utf-8?B?SXdvS2drSHVPOGhGTkdQTGpCT1BOWkxQNWdha3o5WHNldlB1WllCSlhHSit4?=
 =?utf-8?B?M0E5SlQyMXhxelhIVzI4Y0ozczJkT2xwUGxSNm1OOGEyU1ZmSmFZNC9VakZr?=
 =?utf-8?B?MUZtWUMzcXhRZGVPbUxsc1k0Rjlvc3h0cXhFd1JyUDdSK1RmRzNGYVFXNmQ2?=
 =?utf-8?B?eUJadFRWc25xYjZhL3BndWNxTTRuT1VaODJLTmRsc25IWHRyTnlrT3IrdGpW?=
 =?utf-8?B?eEtKR1U2RytLcWZRVGg1R3FKeUFMR2lWM0t5SDNUQW9hWDZKSStpTUw0MVpm?=
 =?utf-8?B?aVFudlZLZWNYYmhldXpsMEdJN3JkUndvdTlkMlNlc0Y3UHlnSjhSTjZ0SFdN?=
 =?utf-8?B?UjFIMkNPU1NMWTFZS1puQVZYTkRQK1JiTGRzTy9weGNqdDlYeHBZTVJNOHhE?=
 =?utf-8?B?UHN3b2ZURVJLZ3M0cE5UaHRkV1ljMTJhSmd6aDViRDllS2tCL3QycVhpRldk?=
 =?utf-8?B?UW4vaGlwdStyd0lBL1U0SzRXalpHOFFNbFdwZFI0Z1IvMDMyU0hHRjZSdnF3?=
 =?utf-8?B?WFRkdWxvUGFYemZ6c3dqeDUvbSs5M1M1dlVpVlEwREVXdk9WYTZTWHpqV1d4?=
 =?utf-8?B?ZkFseFV6djZzL2YzeElONmNiV3NtN1dpa3d3VUhqNktPaDdHY2E4bmJoVTFu?=
 =?utf-8?B?MjV4SXVWS2YyOHBLNTV5TjFIWk5McTUweEJ6alNRMzlOYU0wRFcvczFsTnFE?=
 =?utf-8?B?L3ZjamhuSDg4U2ZXb3NSN3F4OERjTU9nV1RXNWNwNVdkRE5wYytSdlg0bjdl?=
 =?utf-8?B?eVA1SkJLL3RTYUNJNkFlbFlTUHZHMFMvc2U3cTRhSkdDMlQ3UXlyb1FnZHlQ?=
 =?utf-8?B?am1GQnlocnRrdEFKZms5ZWc0THNLblVpaUpPMDhTK05xdWliY1pnR3pNL1hV?=
 =?utf-8?B?UE9XQ09pb0tBeVJVT2JmVmhxOHoxaWMvSmIrQW9EVng1TWJCcVpKeUU1MlZ0?=
 =?utf-8?B?RFVzcmQyVFg1Z3FiWElydUYvQjJvbFU1TGRFZmFMaGNVTUFTcUhBZXZTWUx3?=
 =?utf-8?B?MzNHQUNxYUxORUxGT2NRYXZCVTR6MTB4U3FFMUF2NU5GZVFSdk5ScTJpM2hU?=
 =?utf-8?B?T3Z5SUh6YlBNV3dIWG5KRXhLSzkrUWR2cFZReDVHYUdGZ0R4bG9wcHRuWXZJ?=
 =?utf-8?Q?FYwHWQ7pk7P16s4GFOzgJQAlU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b410d2f3-733f-43fc-ef2c-08dbdb735126
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3661.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 07:14:13.6491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idW6VfL1Brlrd31QaJEpIyZWzCtWlefOTgL9/AlL45UzU5lZ4NaT1x/dTUjSUVYKKagpUFHZD39CPXcomyl+Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6601


On 10/31/23 20:39, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9c2d379d63450ae464eeab45462e0cb573cd97d0
> commit: 3a94c8ad0aae2b14a55059869871ea2d199af489 [14482/15964] ASoC: amd: acp: add code for scanning acp pdm controller
> config: x86_64-buildonly-randconfig-001-20231031 (https://download.01.org/0day-ci/archive/20231031/202310312340.o6CthxSp-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231031/202310312340.o6CthxSp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310312340.o6CthxSp-lkp@intel.com/
>
> Note: the linux-next/master HEAD 9c2d379d63450ae464eeab45462e0cb573cd97d0 builds fine.
>        It may have been fixed somewhere.
>
> All errors (new ones prefixed by >>):
>
>     sound/soc/amd/acp/acp-legacy-common.c: In function 'check_acp_pdm':
>>> sound/soc/amd/acp/acp-legacy-common.c:392:19: error: implicit declaration of function 'acpi_find_child_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
>       392 |         pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), pdm_addr, 0);
>           |                   ^~~~~~~~~~~~~~~~~~~~~~
>           |                   acpi_match_device
>     sound/soc/amd/acp/acp-legacy-common.c:392:17: warning: assignment to 'struct acpi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>       392 |         pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), pdm_addr, 0);
>           |                 ^
>     cc1: some warnings being treated as errors

Fix for this issue is already merged in ASoC tree.

https://lore.kernel.org/all/20231027152403.386257-1-arnd@kernel.org

>
>
> vim +392 sound/soc/amd/acp/acp-legacy-common.c
>
>     354	
>     355	int check_acp_pdm(struct pci_dev *pci, struct acp_chip_info *chip)
>     356	{
>     357		struct acpi_device *pdm_dev;
>     358		const union acpi_object *obj;
>     359		u32 pdm_addr, val;
>     360	
>     361		val = readl(chip->base + ACP_PIN_CONFIG);
>     362		switch (val) {
>     363		case ACP_CONFIG_4:
>     364		case ACP_CONFIG_5:
>     365		case ACP_CONFIG_6:
>     366		case ACP_CONFIG_7:
>     367		case ACP_CONFIG_8:
>     368		case ACP_CONFIG_10:
>     369		case ACP_CONFIG_11:
>     370		case ACP_CONFIG_12:
>     371		case ACP_CONFIG_13:
>     372		case ACP_CONFIG_14:
>     373			break;
>     374		default:
>     375			return -EINVAL;
>     376		}
>     377	
>     378		switch (chip->acp_rev) {
>     379		case ACP3X_DEV:
>     380			pdm_addr = ACP_RENOIR_PDM_ADDR;
>     381			break;
>     382		case ACP6X_DEV:
>     383			pdm_addr = ACP_REMBRANDT_PDM_ADDR;
>     384			break;
>     385		case ACP63_DEV:
>     386			pdm_addr = ACP63_PDM_ADDR;
>     387			break;
>     388		default:
>     389			return -EINVAL;
>     390		}
>     391	
>   > 392		pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), pdm_addr, 0);
>     393		if (pdm_dev) {
>     394			if (!acpi_dev_get_property(pdm_dev, "acp-audio-device-type",
>     395						   ACPI_TYPE_INTEGER, &obj) &&
>     396						   obj->integer.value == pdm_addr)
>     397				return 0;
>     398		}
>     399		return -ENODEV;
>     400	}
>     401	EXPORT_SYMBOL_NS_GPL(check_acp_pdm, SND_SOC_ACP_COMMON);
>     402	
>
