Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9275224C2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 20:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qxI3Hy/l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ek4IIujc03S4PgV2sPPEui79iGATMWDDJl2LyA/nHwwEEOJPkIB/ChVNKmyLnWcilaMeBKp7V5jetsFJtI2xClQwRY54Y3/vRXOIfGVqfiBah3Cn1OoCd+8WFT++qbmx8yWRUkNeBQAiuMooQkYMuSWJdYvIe+F2IaxQUF0ya86RSZGACoAEeDgEyMTz4F6VGil0ebw5S9niBRpUXLgzS/eZ/l44cP2WP/H+mdNu9xM9CFtj3+VbKR6VZW9+RIkovr9BXV3g28WhmmdPTp6YgUExZ2A0PunvUQNVvwR70qx9DLtYdLd1nlQk7j5b079A0tkHE6OUI9psT1TtiBNtgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yzks0g2fiGd31ISaiTfSqJX371+udFaujjDcsK0k02g=;
 b=AAFz255ylsvq7wwNvxzj+inXl4IFw5yJ4cNRxcJdUYaISpfJk99RdXeveOM/LG0/hdtq8rcqlfa0SnY4J/8L8XdDAl1xApQQ6+uF/huAC/Udzb29M7apNpLmQ5i7amMj+12I9zS7JpevVc8yME65LPznkQ3vG1qexSrftvW/A/gZ9nf1hj/PdHEX6Ufif/9YG0K9oyGu3o3f0BEGurw2X/euUuhuiHn5P5HIHSKzflDWdgg9un22EyVdNCr+quzew3d5SQw/gEzvIr7Fq3+yakwAIRnt2MVmnoYpPZeVPUuJ2UmCOXCSUe4PpwK0UGraE0ULyLAOOdQ/82t/QmM5Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yzks0g2fiGd31ISaiTfSqJX371+udFaujjDcsK0k02g=;
 b=qxI3Hy/l5PK9pfoUDDfHIDoZC5MEOgBI80d0XeakPCjmATzyi7ruaFayQfLxyiGX6U9bi5mYCQ33r/BYOWaSXJ8XsNGbVfYWmJkmF89vV1rUK9fvUg6CMgOu9432QwdTOcbYj2hJSIA6Dbv0h1HEl7vpFO1aiBh4As+87gP5u0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DM6PR12MB4219.namprd12.prod.outlook.com (2603:10b6:5:217::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Fri, 13 Oct
 2023 20:30:53 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b5d1:8b74:fe73:bd39]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b5d1:8b74:fe73:bd39%6]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 20:30:52 +0000
Message-ID: <810c6182-979c-7a20-6d2a-f24f3a47dc6e@amd.com>
Date: Fri, 13 Oct 2023 15:30:50 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v12 04/10] x86/resctrl: Add comments on RFTYPE flags
 hierarchy
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Babu Moger <babu.moger@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
References: <20231010233335.998475-5-babu.moger@amd.com>
 <202310131002.oQRx2Rgc-lkp@intel.com>
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <202310131002.oQRx2Rgc-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0065.namprd04.prod.outlook.com
 (2603:10b6:806:121::10) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DM6PR12MB4219:EE_
X-MS-Office365-Filtering-Correlation-Id: df73fbaa-b848-42e8-ed05-08dbcc2b4b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GW6SDUudoPDqjVWZc32pOCuDqJ1Vw8sKM1/RuVevZomPnnbTV3QS8WUxoEQ2j7N/lK6wn4XgTf87C3+eMU6pO+gtWjL+dxvfAvyOOHJKSVJUZ2qD5+ufaMcVAtoMkRzLge2yMvqOPwA9XHzR7grhXVt5KO7inQEHSt0CQQdbNCDaefvrJItbu3pGZtYq+jeizYZ6MaNV6Fzq/D3GciC6+mtvbbKelblHlx6C4VRhugXmVUIE2/nsEw4fE2MijqIAyMZzUTs4F2ovjxkoauWYL1I3SjUd1lWDFUzg+SCoIX8PUWd08Kv58PlZ9OQzsn9/XVqZYVX34VECyyyx+TXnOz9uopv1gEgpmOfA7YfIR83X392B6wn/R+rGlk6tRi45c3dAZwP2ZWQQF5Gj7bobL51zaVQCALqANgHs01JZyPR56KXRTULvty63ZNRog7TqdEO4KdnMCZqe2aFq5JQGv7mkvmkER+3jAr+9p7PF3VuWX1XC7s3ZuW9TIFA+wLhX0Qv5Bkz/ifm1g8heAy0NEh1EUuWSZtcYbIJQXJFOBM8lxXsVHkqQW3HGQbbpTxod3WS2MK5hUUH2KX2nKySqNupNMOSRVv6AUpF5/lI9FJ5efYBROLb3tVrEoiNeVQNwy1NYndJNlUsUrw/vE1PLcxr0rzkF2pU03yyggkU/7OU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(136003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(6636002)(966005)(26005)(53546011)(2616005)(6506007)(83380400001)(478600001)(66556008)(5660300002)(6486002)(2906002)(4326008)(41300700001)(66946007)(110136005)(66476007)(8936002)(316002)(36756003)(31696002)(38100700002)(6512007)(8676002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDFTSXV4Mkh6OVJpQ3poTTg0bUI5TDVNVnQ4eWhOZXpYVnQwUm8za3Q2aWx3?=
 =?utf-8?B?aURTU2pyN0k3cW1acmZQK2w3Tmdhd2FXK3ZoblV2amdjeWtTODVuNHBxRXdU?=
 =?utf-8?B?ODZDYUo1Zm05aGMrakVneklWRDZyOGJOS0NxRWt5eC9VZm1kQ1hlYVBjMVZr?=
 =?utf-8?B?K2tEelVjaXNaeEJPZmVCamdQYWNWNHlaeXRrelRKcnMyUk9aekdsalViNXBG?=
 =?utf-8?B?MUV1MGJubzBzayt6UWZDZjd1QTJBUVZwbG4rT2tZNTJQMWFmYi9reFdkMWIr?=
 =?utf-8?B?ZmhMM2hSNjlwdGhUanpGdHhKaExabFcxN1B0Wm9tOHJObGlhQ2hCY1FvRUlO?=
 =?utf-8?B?ZnRQdFRPUU1EWFFjV1IyUE55WWVFaE52RUYrTjhYcVVUUnY5ZzVidXlvQW5u?=
 =?utf-8?B?TlIyUVZlNGF1a0tJMUdPN0RHVFpYblpEckxVaGc5NWdzbGc2enJHS0VCRU9z?=
 =?utf-8?B?N01WTlRzOWJRUDFGekJlZEpZZUZWQ1VrS29DWWJBSkszS3huZ0NucWh2VktZ?=
 =?utf-8?B?bXhnRVgwVFBTZ2JUSHk4TXZ1RlVJMlJDemNERUNmL3oxNk9yQ053UTNwTG9Q?=
 =?utf-8?B?a3JLeEJCTk9Xb2J1c29xWlRoRE9HRlJlMUpFMmpodWdKU3hWR2l3NmZJcW9o?=
 =?utf-8?B?U0RTcGhCWHFnbW03dGdxMEROQWxISzUzN0lYTXdZQjVIT3l3L1cxR2J1a0I1?=
 =?utf-8?B?Vkd1TnVOYkZjNjRtNmUzaTh1amd3enFud3p0ZEh4VEtaRnV0RlpHVWtHczlJ?=
 =?utf-8?B?Qk5ndUQxUVFTVnRreEtwSWtXVElZQlp0NTNaSWhnT1E2eFAzRS9FZjlYWE54?=
 =?utf-8?B?MXFSSzlwck1JUTN4Um9VQmU2T0J5QVVYNFFTQ0E5TlBzM2RPUVdLaFJUeUNU?=
 =?utf-8?B?U201Si9GMEFpa2JVLzkyeTVibnBHdTNtRk15bEwyWmFjaGxBWW50dHEraU54?=
 =?utf-8?B?LzBmTDVEMkJwSWZTSVU5SEdyV3plS2s3NkNZR2FzRDhKMkFPZllIbXQrVlhZ?=
 =?utf-8?B?QWVBb2JpblczMks2Q0p5SCtiZm50cjJSMC9zMittYVdiUVJKTGx4cTlFTytH?=
 =?utf-8?B?THE3eHlPZThmQWdHTkI3WG1oU29yYlpEM2tYT2QzS1dyNmZZeVhtekxmejhF?=
 =?utf-8?B?ckVqYWxCMWQzQS9yT3lLM1FJNlVycWNJdHY4NS9WTGdDUmNLenRHaTdqUFF0?=
 =?utf-8?B?VjlsZlZLY3dHbE1USXhBMVUvTHg0bjhiU0IwVzVZYm5hVDVlY1UrQzBrZS9u?=
 =?utf-8?B?UVhsMzJvNFVUS0hVNTUreGZJbzVBNXBLZTFhd3I1UkU5dGtxbUh4R2JrWUJq?=
 =?utf-8?B?OHN6TE1FSWJHRjJZTXRRS3l6c3lDNFozWFdMV3BONzdTbmE0WUNQeGNjZ3Y4?=
 =?utf-8?B?R1lxc21zUC9vMmtpMzZnU2hwTEdScjlkcmpNbE9hb3M1aWRPdXkzQ3dTRjI3?=
 =?utf-8?B?YzR1cjl2cjJYMTF5WlpPV3Y2bUZBRTdUUWMza3lkTS8yeGtJWldIQU5FbXg3?=
 =?utf-8?B?ak1PdGQ5dElhV29ZUGtwWmpaSzMzNUx1Yi9taWcrQzlhUjlETVB3Y1lnaStO?=
 =?utf-8?B?SmxpeEQxa3BWaHMzVVV1UUhCQ2FmK2ovTHYrZU9lendLSHlkUWcyNjh1Qkxa?=
 =?utf-8?B?YSsxNlhYWjhOYnAyVXJwUVd5YUR4NElkKzNnbTRhSzJsTTFJUGNCaWltaUo4?=
 =?utf-8?B?cUNBaHFFVWxpNUNldEp1SDBnNSsvMnptWUJpWjZwcDlQWlhHeVpGWXZwOEJ4?=
 =?utf-8?B?Q1ozeC9OVkhDKzJiMnJxZEVoNEhOaXA3SVZFeFhTYzd2RFVsUktVelBQVHBN?=
 =?utf-8?B?ZnBIYUVuSnNIOVhGQ3pDM1ZHSkduLzZVMk1PbXpSOHkrUjd0N1FvQ0c2Mkt6?=
 =?utf-8?B?a05FZCtvTnNFYnc0emhxTS9hVEVuWktOckZxSkZEMVpWSWNCOTZ2MGpMVTVG?=
 =?utf-8?B?YUdaRXFMT0JkNCt5V2dsN29EYmZNZTlXaEtDcVA0NFEwZVRScDUzV2lkazBt?=
 =?utf-8?B?TkUxdFVmQVJWaXgwVXBPTW8vMGZpZkFJZUJhZmZOOEJHU1lzenpEeXludDBn?=
 =?utf-8?B?WXQrclhqakxRUytReWwrWnp5SERndmErSEJlcks4T3Q3TzZyYnVqRmhEb0p2?=
 =?utf-8?Q?5NUQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df73fbaa-b848-42e8-ed05-08dbcc2b4b95
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 20:30:52.9387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a11ZUxn+sX6pAa8WMRjFPD3RpRzx2PHfTFUAxuB222OEvR9E3eQ9X8w1Ygj6Jnlf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4219

Thanks for the report.

This has been fixed in

https://lore.kernel.org/lkml/20231013202602.2492645-1-babu.moger@amd.com/


On 10/12/2023 9:41 PM, kernel test robot wrote:
> Hi Babu,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on tip/x86/core]
> [also build test WARNING on linus/master v6.6-rc5 next-20231012]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Babu-Moger/x86-resctrl-Add-multiple-tasks-to-the-resctrl-group-at-once/20231011-073704
> base:   tip/x86/core
> patch link:    https://lore.kernel.org/r/20231010233335.998475-5-babu.moger%40amd.com
> patch subject: [PATCH v12 04/10] x86/resctrl: Add comments on RFTYPE flags hierarchy
> reproduce: (https://download.01.org/0day-ci/archive/20231013/202310131002.oQRx2Rgc-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310131002.oQRx2Rgc-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> Documentation/arch/x86/resctrl.rst:373: WARNING: Line block ends without a blank line.
>>> Documentation/arch/x86/resctrl.rst:377: WARNING: Unexpected indentation.
>>> Documentation/arch/x86/resctrl.rst:387: WARNING: Unexpected section title.
> vim +373 Documentation/arch/x86/resctrl.rst
>
>     353	
>     354	"mon_data":
>     355		This contains a set of files organized by L3 domain and by
>     356		RDT event. E.g. on a system with two L3 domains there will
>     357		be subdirectories "mon_L3_00" and "mon_L3_01".	Each of these
>     358		directories have one file per event (e.g. "llc_occupancy",
>     359		"mbm_total_bytes", and "mbm_local_bytes"). In a MON group these
>     360		files provide a read out of the current value of the event for
>     361		all tasks in the group. In CTRL_MON groups these files provide
>     362		the sum for all tasks in the CTRL_MON group and all tasks in
>     363		MON groups. Please see example section for more details on usage.
>     364	
>     365	RESCTRL filesystem implementation notes
>     366	=======================================
>     367	RESCTRL filesystem has two main components
>     368		a. info
>     369		b. base
>     370	
>     371	/sys/fs/resctrl/
>     372		|
>   > 373		--> info (Top level directory named "info". Contains files that
>     374		|	  provide details on control and monitoring resources)
>     375		|
>     376		--> base (Root directory associated with default resource group
>   > 377			  as well as directories created by user for MON and CTRL
>     378			  groups. Contains files to interact with MON and CTRL
>     379			  groups)
>     380	
>     381		Note: resctrl uses flags for files, not for directories.
>     382		      Directories are created based on the resource type. Added
>     383		      directories below for better understanding. The RFTYPE flags
>     384		      are defined in arch/x86/kernel/cpu/resctrl/internal.h.
>     385	
>     386		info directory structure
>   > 387		---------------------------------------------------------------
>     388		--> RFTYPE_INFO
>     389		    Directory: info
>     390		--> RFTYPE_TOP (Files in top level of info directory)
>     391		    File: last_cmd_status
>     392	
>     393		--> RFTYPE_MON (Files for all monitoring resources)
>     394		    Directory: L3_MON
>     395		        Files: mon_features, num_rmids
>     396	
>     397			--> RFTYPE_RES_CACHE (Files for cache monitoring resources)
>     398			    Directory: L3_MON
>     399			        Files: max_threshold_occupancy,
>     400			               mbm_total_bytes_config,
>     401			               mbm_local_bytes_config
>     402	
>     403		--> RFTYPE_CTRL (Files for all control resources)
>     404		    Directories: L2, L3, MB, SMBA, L2CODE, L2DATA, L3CODE, L3DATA
>     405		           File: num_closids
>     406	
>     407			--> RFTYPE_RES_CACHE (Files for cache control resources)
>     408			    Directories: L2, L3, L2CODE, L2DATA, L3CODE, L3DATA
>     409			          Files: bit_usage, cbm_mask, min_cbm_bits,
>     410			                 shareable_bits
>     411	
>     412			--> RFTYPE_RES_MB (Files for memory control resources)
>     413			    Directories: MB, SMBA
>     414			          Files: bandwidth_gran, delay_linear,
>     415			                 min_bandwidth, thread_throttle_mode
>     416	
>     417		base directory structure
>     418		---------------------------------------------------------------
>     419		--> RFTYPE_BASE (Files common for both MON and CTRL groups)
>     420		    Files: cpus, cpus_list, tasks
>     421	
>     422			--> RFTYPE_CTRL (Files for CTRL group)
>     423			    Files: mode, schemata, size
>     424	
>
