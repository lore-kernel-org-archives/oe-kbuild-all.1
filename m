Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2051.outbound.protection.outlook.com [40.107.101.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDE18C0C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 06:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PkTrfu6o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLB6fcwX1zWGwmOn+PYy8IS9zvAW1juyUrDbWx23Xze/dUeRK75a40KfkeftZdtCQhJanJLTkptjRaTFJdJBEA7h1FYnKSD7pMfzcP1umUE4UItHRFZtXPYV4L+DmgFtm+tAKwcLeVFm1NFFrqgfd4hAVmqbGdLLc7s7crKJ9beJqZIyrCFdbrodW18j4TIs27H+PmN9piJ0dCo6WD3sSbXG3qZxpVPvjxRck6fc2B5HJ8JBYbhZC05986fvoWzI3w7+UB60Fl7nVEV5MgObvH/VDKIsenzUaykSXon4mfJRDmSPNN6Q9W8dtfcb7+gpjzH6WPMY/uCJX73deC+uzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gObzfH1jAnpRdGgkxrvHOn/azyea7EdpPc/Tx7AzAkY=;
 b=mi/YNFyLUkREh6Wb9NrW0JmiJuBxeYx6QLqscne5k2V1JKCPEHEp7A8khI8XDQyOUrf9w/OzB9C1Cb3BcW73IVAg6U6m/5fBNQmIvVkuk4Y8jw537/Y9LCqcWTRGXH99T84XYXf4dIUrkmyhO8gT2IQ0y8x903xibB7A5sFlmaYLdPqcywDB1GYmJ47kD9MypcHb8/JInuHe+g2D8HEPEm+sGV5zbORfbO7xZ5zEIYfTr004nK5XFrj4iamGmwd+y+Yj7T8XZ+ANutW6VikQtx2qEU9IVCPbEQz9ypkglP/7+KoX8d7savj21uLjZlAXvdihsE1+eJ95iCyv+kLA4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gObzfH1jAnpRdGgkxrvHOn/azyea7EdpPc/Tx7AzAkY=;
 b=PkTrfu6oK68k09EYxEqQI0KK3HFKrTNJf+ucGdjfMPz8/JyK1CiJXZ8ATKWWttf8tnXTyXeCTydtS6Zj3ONNX7FnsTEoj6nZ9G+HIwcz7nKdXwRkSwFp3AJyKoiSmQhfNiLLkTFsFqagjmAioFpULyZxima3ifiKzCg2sclfAZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3661.namprd12.prod.outlook.com (2603:10b6:208:169::31)
 by MW6PR12MB8865.namprd12.prod.outlook.com (2603:10b6:303:23b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Fri, 27 Oct
 2023 06:18:40 +0000
Received: from MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::7354:d327:ee4:dd79]) by MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::7354:d327:ee4:dd79%4]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 06:18:40 +0000
Message-ID: <66dfa43a-deca-4c7f-a3b2-f2528a39d9af@amd.com>
Date: Fri, 27 Oct 2023 11:48:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [broonie-sound:for-next 45/75]
 sound/soc/amd/acp/acp-legacy-common.c:392:17: warning: assignment to 'struct
 acpi_device *' from 'int' makes pointer from integer without a cast
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
References: <202310271326.7xKHbFDH-lkp@intel.com>
From: syed saba kareem <ssabakar@amd.com>
In-Reply-To: <202310271326.7xKHbFDH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::11) To MN2PR12MB3661.namprd12.prod.outlook.com
 (2603:10b6:208:169::31)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3661:EE_|MW6PR12MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: aade148d-70db-47ed-35b0-08dbd6b48fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CtL8CgNBUlsBFOH1mHYm9eje3KbPYPGU8/WFRMJm1ZdFqTEDn4d1xOEaQtDpkqjD+qDt7R844O/O0bdkiPMh+GO+ZDXUIsXmR4euVjMwc8f6p7iH4yLaaPEqL92sHQWTMMSWo/PxAZXMYhwsnnnlMYH6NDsyFbUC+0R1EVYRMVOjz7lSopKmQvxxIOmacIAyfDfzsEAchM4JYA02rpkCoSB/luEX6G93ksV5nTK1Lc/SDLW4zZ2IoJL7Ik+V8kgxmN0rziIoogtfqZgaz+JN1cgbYx/LZ0UKAcZUMSlNUykXzEWfIjYx0roXTgdUxk174/Msg7DIft9WF2sk+1owGsk9SkNrcw0JjhmQTV9/sOqhsBQBTfP+iMzEZ4uF5TDOaz9ZXTumZCg5PIL5h0agZ67bRZ/wTKYJveKWtDpD3tnO9GhPNqn9fnBv/FCjQBR/rmy+BPGiup7J7zWA9L6+5O0rmvZqzp5cOQOBCpFUvcnp6yDhaZTwi/16qImrUUMOQyw/KjP1LNvGJA7Fy3QpXGSRTtIrl/HgUqgEUDM0MbuiC6YdNj+HWNkVmQsgy63EqoL0brx9dfzvvUAzA3+UND1EQQAzJptFs0nrGoeg51DI7eZ507RsnIpijrqk7y8HWHEx4AbskfmVSEX1sNcelBWF22ZUfOSXSaZOz/cY7cigupUEibECxDNToLa+rHuA2WWsBe23pEsVwYd70ig2rA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3661.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(2906002)(8676002)(8936002)(4326008)(83380400001)(966005)(6486002)(53546011)(31696002)(31686004)(5660300002)(41300700001)(6512007)(316002)(6506007)(6636002)(110136005)(478600001)(26005)(6666004)(2616005)(36756003)(66946007)(66476007)(38100700002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cExmSWZBOFdYaElVU3hhUnFQR0FKSk52V2RaeXVVc0crUlNvQnZLUm91UW9C?=
 =?utf-8?B?ajI2T2w4R09oa1h6RXRvRXljRVM5RlhHbW55aUlqVGdXWks5NSs5M2NCZi84?=
 =?utf-8?B?VmFEM201NElpQ0tUaUNxWnJQS1d0TlUzN0dUK3FhY0g1a3VSVlhVWEgzbGh0?=
 =?utf-8?B?MzQ0Z0paWTFXZFdmYi9PcDhCWVFSYXVlTnliWTU0ckZNQmlqdlNkUWRtRU5W?=
 =?utf-8?B?ajBJSXZGemw1akZrbUFLbTdYQmd3U29Fc1IvRGh5dGEzVjdQZXZMeVRVZnFt?=
 =?utf-8?B?YUs4YnhIbHZ0djhXOXZRWjRuNyt2WFhtSW9JMmRQSjNUeG43VmhzU3IxQ2hB?=
 =?utf-8?B?YWxKbmZOb0J3V2ZiWFlvS3NWMmlHYXd1TW1rbXVUQ1gwUHZKQzBnR3B1NThO?=
 =?utf-8?B?TndZQXduUUpMT0hDbGFPZjNRQlEyUitHTWtIWWRNeDZkQUc2YkcrR3lKb3F4?=
 =?utf-8?B?TDVtWStKZ20wZjhYRnpiTmNXMW90d2VGOTBDZVVDeFBJaDZKT21zdm95bTFO?=
 =?utf-8?B?T0Fha3VRa3BnUTNCMHIwSk9pbXNtQm9heFBZK3E0eFkrZUY0elZoTlVjdVYz?=
 =?utf-8?B?dzhyMmtibFFJdStOWU1MMUdONndLNEwrbFc2NUU2WXYzOUJvclJ2Z1NndXcv?=
 =?utf-8?B?V0FydktyK1hoMGVPVnU4eUkra2VUb0lXYm9iam1aUmw4TzZZeml4c1E0Tlhy?=
 =?utf-8?B?SXhtaWF1UERYUW9IYTU4aktRRFdLWGREdDBBZFdZTngrcEYxeTFIQ0FGdDU2?=
 =?utf-8?B?YnM5ZFVQeUk1ZGY2NEs1cXhVSE1kKzBGRFJnQ3RYdjE4aDFHNCtZVVVkcmNy?=
 =?utf-8?B?dW9LSzNtOC84Skd1bGdDODZKWUdvOTM0VUdwL0tVeWtEMjVhUTBpOGFTS0Vk?=
 =?utf-8?B?dTFCTWczUTlTR1ZUTzNMOWVjTXFaOTVmd0xWVEVZUytId2JxRVlaTjUweEls?=
 =?utf-8?B?WlJiWE1uTHdIWjBYNGtIVEprazlmaW1FSzVjREhFZlRCeVlHVHUxb1RMbE95?=
 =?utf-8?B?VWZHN3RkWlB4emh0dDljeXBkWUQrUFhacjBiZUp5ZnZINC94OXM2RENoYVk1?=
 =?utf-8?B?cGN6TDJocW5lZ2dDTkIwSjVoUVNoL3M2aEdHWEpBWWxMalNMTDBLR3BqbThk?=
 =?utf-8?B?UnZxQS9VR1JydFpjMEIxMlRiU0RlR0J4UjBJZjZNdGRQYUNLT2hzNys2L3lI?=
 =?utf-8?B?Zm0zVzVGWG4yeEhlTUxQWGd0cTFlckFMRlNvbFZSWkh3VWVaTitKNml5aDlX?=
 =?utf-8?B?TGo5V2FqN1FCREVkVHF2b01KSG1sUFVydVI1QzBIOFk1WFozR0o2ckh0RzZt?=
 =?utf-8?B?aS9lcVhZZ290dDl5MDg2T0Q3b293NDMrRFFuRmVoWWlTN293REFnVFZuOVc3?=
 =?utf-8?B?WnZLdXVYTCtJTU9BSXdJaXRydEc2ZWJPQ1oxSmtuNFpuMmNUK016dUdwbmVj?=
 =?utf-8?B?ZVp1QXFHd2xQckZ0eFVPMXVudEYwMDJ4VkNFQXRVYjIrNENHWXBOZWJLSUJM?=
 =?utf-8?B?TWlsZ3p5ZjVqY3BpNmlPZ1pQNEZnOWRTS016SWRlQVRqUlRKQkpycUpZTFpV?=
 =?utf-8?B?YWxBRGZmRWlKOHhMeWdFcW5FQmhaL0hkb1pBZTJZcWpaaGYreE55UGtQbE9u?=
 =?utf-8?B?ek9VNW4vMndocytqY3hWQ095c2NjTjhLTm9HNmFoZmN0YUtFcjU2blZaeVVp?=
 =?utf-8?B?dTlVcllnaW1JaXJvK1lTcjZEQXNsb1dSeUR5cGlxWG1SNWRsalJRM1dpZmda?=
 =?utf-8?B?OTQ5MG1QL2NIQmVSNXAzbnlmQVRBMkZYemlGb1ErZ1lsZksvRC9ZSzFHVzVq?=
 =?utf-8?B?VE5jTUtUd0dmWU8zL2NhMWxZUXA4QXdmeDA4enFXbHFKMnp5b2RneWFuZlBu?=
 =?utf-8?B?U1RKYXh2R211Z0ZNU2dQTVdzTjI4TDBJczhWdzJCTXR4alRadmwva0dQUGZY?=
 =?utf-8?B?c1ZlY1VDemJpODFHLy9FSEVqZHU1MnVkcmJnczNZbEVSc1pwbVE2S3k3T1d4?=
 =?utf-8?B?VVcza0xEOVBWMklMSEdiSW82MzNVdkxwUmN4djlmWlFRWENZaWhtcnV5bXk4?=
 =?utf-8?B?ejZkQUlGdDZHTEdSbHNSYjF3UkkzRThiVWx3T3ZmakdQVWVFeW0wUVBHOURT?=
 =?utf-8?Q?sigPf1aEWh6GAuxlBEEWPdBUX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aade148d-70db-47ed-35b0-08dbd6b48fc2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3661.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 06:18:40.2469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYcZVQtPtzzlz9lZCtlP0ywg8oAaOEecG0wPtlG2jQfA0kOKza6ICzgbygRw31H1+73/tmQPU8xfBJvEYspXiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8865


On 10/27/23 10:41, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> head:   00236a89602f7b67016bd1d9bc63079f2c0f0a8d
> commit: 3a94c8ad0aae2b14a55059869871ea2d199af489 [45/75] ASoC: amd: acp: add code for scanning acp pdm controller
> config: i386-buildonly-randconfig-001-20231027 (https://download.01.org/0day-ci/archive/20231027/202310271326.7xKHbFDH-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271326.7xKHbFDH-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310271326.7xKHbFDH-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>     sound/soc/amd/acp/acp-legacy-common.c: In function 'check_acp_pdm':
>     sound/soc/amd/acp/acp-legacy-common.c:392:19: error: implicit declaration of function 'acpi_find_child_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
Will fix it.
>       392 |         pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), pdm_addr, 0);
>           |                   ^~~~~~~~~~~~~~~~~~~~~~
>           |                   acpi_match_device
>>> sound/soc/amd/acp/acp-legacy-common.c:392:17: warning: assignment to 'struct acpi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>       392 |         pdm_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), pdm_addr, 0);
>           |                 ^
>     cc1: some warnings being treated as errors
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
