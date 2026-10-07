Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010065.outbound.protection.outlook.com [52.101.46.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27261C5D72
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 03:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791343580; cv=fail; b=fCvsjXFKW6fvnXe+ewZsW4GFbPvI+IZfLCzaFeYhxCkFAjvSO3Aot+35J0v026UojORJmdsCuiqiL60PSg687swg8ypIKYXBHygpOYXu6rmXyblm9tUHt/+VAFd7hlAqOmKEE2Qj+jFVvOyoLNRXPZJRuB2rAnMez/fI99WiuMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791343580; c=relaxed/simple;
	bh=qHxLcxDYXXRCkxiIFJTqAFFKnWljoYMqmaz/HBSHSC0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=X+c3EBGYjXwoA7RK1+VV2ck7kCzBo5H6XObtcPzokAqcCu8g/oTguRdn/uUU9aR65BdA2+NgmcTK0nsq48+uWuGhV+tQ8SisYXGhqEy8OxPMvvpFFAztNsWDQyk9zRB2baNYD1kxa92lOQc6H62lJlQrGZCvX9bv4LSXx/+M8xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cPsOEx9V; arc=fail smtp.client-ip=52.101.46.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cPsOEx9V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivnDf0IHrc5jPWDFIZ1QnLt+Z4RFhCQc3O1kplzMpQFPtflCnRbupT7fZzgHv6OItZblD868IvY/vfh5pagPehAaNLJzUMKI4+LU4lMepyBRXa8QFLQcjTj6yXjzRri/g3aC16cidrCzmVc/iFUILFWxGW05F8GSPkQ++HbwbIKrsxmJ3LNnf0f4puofszgRpAIUvSs8HBQ7SCebwGNaRJCGqkbcKq3VKMLBWC3CWq4BYo2m2oseeWoWGpmsgza4jB7VDjpy//QdR9PYz+GeJxsLiVuU8gOEE9H2LD47CR+EcBtiqFJTEo1zAxPWVK7ZjFsKvjlSvB1RxPhLjM54/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gscAa667+eB23cBFl5psv/tDAMur2Dh6ZrcG9mOLkIg=;
 b=s4CLoai0FTQuqYAqQMVBxTVECusgxAw16Sztph6MhOSP06gcAu8ehWJjabtRp0U4/fRVObSxWuvJQQWuWs1ye0BbztL75F7IKgXOinEf6CIMHuc0J7ZpyI+tf9ZbmHqjK2G5sUpArGVXu7fHspo80CspmCNiQx6f3HdqaYgOLUcOdnsTEnj9hJ6OoCUKTxB9qj5/rEXlIwKZ8xZ65saEfIix1WhvfHWu5Mcouuzk+raUfj8fQWIBb3PDN/Vzzd8Aw5vGgCRVV5XTmZpeOzRj6sJ7vJPSx+PKCt5FhG4LjQeNohH3znqX8jFX+WH//UgLTLcCluMy99G1mFvJVE9EdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gscAa667+eB23cBFl5psv/tDAMur2Dh6ZrcG9mOLkIg=;
 b=cPsOEx9VdjWstqeeyMX+u9rn66rf3BmpH/OMDe78yLSwiet3C5sD+qYyrXyZQVu3LDslRn8ZJKr1caSsuOLRaoeRsuWRp2sU4mzBlBw4nnlDu9f3JLhH95pgLpCyN47OR1pNGfuD5Tm1rL/rw8atZy5pMwL8RzagcsQe952MNtE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 DS7PR12MB5958.namprd12.prod.outlook.com (2603:10b6:8:7d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.15; Wed, 7 Oct 2026 03:26:13 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 03:26:13 +0000
Message-ID: <ba2bc986-23cd-4027-9069-9c789d29b955@amd.com>
Date: Wed, 7 Oct 2026 08:55:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [morimoto:sound-cleanup-2026-10-02 0/332]
 sound/soc/sof/amd/acp.c:1153:27: error: implicit declaration of function
 'acpi_find_child_device'; did you mean 'acpi_match_device'?
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
References: <202610070851.VWGLXfJH-lkp@intel.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <202610070851.VWGLXfJH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::21) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|DS7PR12MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aefa338-4b60-4d78-bdc6-08df2422bd08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vZ8pGuQZ+Mdkdjkpwe8IAIigFCeTjmVCsDVGqHkupSlWdVW/ZPY7PUYcKNT+lfBo9zFbyd2cZAIdXwDwlEvVngJtN/cUB6a6oeUzSLVhTW0E93K+wlFm1Z+1anhG8woIMLE2pkViA2GDVh6EZ4EU3tDUanh5pnojQ1fcurx66tsbdCMsRDAZ+Pc09Hf4MCEGA6LgvFp+6Hh22xwnhujLphcFu5k54WdYoQ9xxbMD1TYDL+s5KM9pF3Qx9Juc84SCW1KjOGt68vmJxiDaWTR8gcY4Yz1KmZpKu0gXZ4d7a5tesNdaQhSJvNCbMs4bpnI0rA6YnABawiS5dr3rfU6LSKHWTZtt5FWcZWgexoMbZWwlM2a71XIy6iYne8HFm320o/HEvt4d8Uxooo4F06BXA+TCidr/hqv0U6WDOsnzacv0m9FqYiGIGEpB41fjJI7xXLF7XYHgYrI8ahmAiQPuNeEjioXAdFWtSM5FcbBxtiAy1WaJanZgkcEvCIh3mIzjFUMJK344LazMON0qKelEZkCRP9ATF/zkcZ+vLqzJi3p0YS8b4K/kWnRxIkEb+Dau2+KYvytf0d1zmRbyBU9p8KFz2CZvjz5xzmFKlddpSq+9TA7592WxO6GwmAM+yx8t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aU5XQWNHWVUzbTR2MzNzS0FrUStjSW1pUkJTWnN6SXZNc2NoRnBFTGtDQnpV?=
 =?utf-8?B?eGdHZlRFL0E5allGZDc3dlZUYXpPVEpjWXdra3Z2aWxaeDU5TU5TSnlwamVZ?=
 =?utf-8?B?bDdMUEtQc21zeW9CMjhaTXFGV3Y5SG4yY2N1bno0UXF3VDFJZ0xGT0FzUHBW?=
 =?utf-8?B?b3hRdGRqcEczK29KNjA2YzlMdnBOSWlUMEY3N0dOYm1sbmpIVThvWTBoUU5r?=
 =?utf-8?B?dkppNE1ReFRvbVlVR0VvWk5ncjJGc2s5aTdnT0UzTWFLY2h0S3NkOGx5cTVC?=
 =?utf-8?B?VFNBdEZpQnYxU0JBUHE0ZTdsVno3TmpBNXdNN2dqeG13eldTTFZuZGVsQWpo?=
 =?utf-8?B?RldDazdjakZkN2wwMVEyeG9EU3Nvanl1YUJZSlE5eTZFcURQY0dQbEg5VVNE?=
 =?utf-8?B?aDBlMHNoQUp4V3FHS01RSEVuY1k2T2dEVis2YzBramFxNjVZZzdZYTl6VlZ2?=
 =?utf-8?B?TjFzMVVxaXJIZnNobEhodktZa1F4NXRwS2x2NHA4R3BicTVacnRtUlpPSUVT?=
 =?utf-8?B?RDFrWHhDRGRQREtXSDY3Mnp2cCs3OEtDSGtNUzM3OGNTOVR5Z0YwR1JadTN3?=
 =?utf-8?B?WVlDbXZFSXBReEt4T1U4VGJQOWZsbC9IamtBTm9pbDN0T2JzdXd4TFBHVnJD?=
 =?utf-8?B?WFdjQXhVMDZFODVEUkhSVUYyeFBLaCtxbEs4cjMrbmp4UFNvYUN1SVMzdXZw?=
 =?utf-8?B?eVNJZUJMNWs1WEpRSkdHaisycTN0b0dMZkRYaVF1Sm45TzhLbnE0Umg0ZDBO?=
 =?utf-8?B?eEhOMDJ6ZmZaSUR3YWVXblg1K1R0c3ZEaWtydm10Yy9DaWVjYm5jZXVoM0Nn?=
 =?utf-8?B?M3ZMYUJEeEU2UXZ1L0JnRVhENVNudzlZa1J2UW9MUTJzWlZIT0c3aHFKbHFM?=
 =?utf-8?B?ZEJZVVdSdWdRWnF2QWZONXo3b3hMMEZDUEgyYkVqalNuakUvUnhETWQxSlNY?=
 =?utf-8?B?RVU4Y2MwWU96UGNCdVBPdlJNSVY1b2RKSXA5WkZ0RG1GKzBFdkpWNndkV1VB?=
 =?utf-8?B?T09VajB0cnZZOUYwYWtDVEVGRVdXaHFhdnUzamUzTnNBMHdBQXRzV0dzcTNG?=
 =?utf-8?B?cGs4SlJuUHdJV2tKUzlzWW8vTkFHVWZpRGJlUXkraHBndzRyZEdhd24yZlBj?=
 =?utf-8?B?b0dGNXNOcEpsendpN2ZUa0ZpdWpMZTZWSEF6VGk2ZENTRy92RzVFTC9YOG5a?=
 =?utf-8?B?MmQvMHpKdHR5NllicjVMZFBPK1ZmeTMvY090aG96MmY2cnFxVkJTVzJhV2gw?=
 =?utf-8?B?ak96QTdXS2syZWp3WFRXSG1iMklUK0JGU2VHUnlJUFlCNElCdlNpelpVWUdx?=
 =?utf-8?B?Y2VQU1JPWEk5b3dTU3JiVVhKTG81QUIxYUFBbmZSNlVYb3Mwc2VHUUN0RnJI?=
 =?utf-8?B?b01yMHRkakIrTStOMWVzazFQenBOUlBNRk1BTDZFWGxFa0VjZys0OTkzZ2Mw?=
 =?utf-8?B?TlROdzFENks5NXQ0SmV1aHFiOWhqTm5yM0g2UG81MXBpdWxZclZHYkZzeEx5?=
 =?utf-8?B?bGlrUU1WazByNnM2TVNBK25haFpKaERYaUlrdzFqdXd2ZWo0b1I2ejlwU1Ba?=
 =?utf-8?B?djhIVTNOMU5lSjlRL2hUNGsya1pYS29TR1JvemtMdDArOXYzRUFhaEV0NGtC?=
 =?utf-8?B?S2JFL0Y3MlBhS09PL2YzOXh3Q2VXV2d6eHhaQ2RQZGFoNTgyaHZGb2lmYVVK?=
 =?utf-8?B?YWlyQ0VnTnBZTFFoOUVwVnIyUkhHRjFudGxvRjIySWxxKy9FTGhSWkxLanJz?=
 =?utf-8?B?Zm5aWmhwK2c3U3VGbmdVNWhQOEtFQmN5U3NKNktyRDhkcmh6cDIxOUJ4MVdP?=
 =?utf-8?B?aTBGcXpLaTh3OU84YXA5VlNoLzF4UkxQZ242ZTlwbGg5ZEpvYWlEV2pMZmtr?=
 =?utf-8?B?Ymhoa0FBVXAvQ2tKMTU4VnhnSDhtak5VNCtrT2s5dS81eDVQWWpQTVhaZ2g1?=
 =?utf-8?B?MkdnaHdKRllzM1psNHpGM09KallJYWVhWkwwVVdtbGJWVjMzRXcrakkzRmZ5?=
 =?utf-8?B?cTExMHQveHZWemU0N2JFUll4bUR1Q1JvTGpRV3U5akVXQXRPSnRCU2FURjA2?=
 =?utf-8?B?RHhqS1RhVmlBNlVQL2ZQR2pPSml4VWlkdkdVL20zQ0lHU09UWWtXWGdKTnAx?=
 =?utf-8?B?dFZJU0dDUTBUdjVhblBPVmMzQzBpRkQ3WDN4NDZYTnBUdGZTckNrLzZDMy9N?=
 =?utf-8?B?Y2J3TW0wNkUrdnIrYlJkVmtmY1ovUTBTN0FsOUt5S0R5WlduUTF6dm03aTFN?=
 =?utf-8?B?SVdwMnRCSGVhVVJvZ0hLeUZ2Z3prQlNPQmh1NUFNRSsrakk4QzU0dHFxREgr?=
 =?utf-8?B?Z2tPUm5NWFN0eHNhYW5pR016c1pGWEo0OE10cnBqcGp2azBlOTdBQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aefa338-4b60-4d78-bdc6-08df2422bd08
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 03:26:13.2265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8DWvVoZM8Q6wQj63FiTPTwiMSKxfEM4gNw5s1yckwtQr+T94bSVvsdAKVmMwNN5NMGzTNtTBUkkdxsw3CalFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5958



On 10/7/26 05:44, kernel test robot wrote:
> tree:   https://github.com/morimoto/linux sound-cleanup-2026-10-02
> head:   f081696132aafae20dd9ebf62abbf292789b89f9
> commit: 203ea76c4b0a84f0c70e0ab27503a29f77e0a471 [0/332] ASoC: SOF: amd: add ACP7.B/7.F PDM controller scan and pdata propagation
> config: i386-buildonly-randconfig-1003-20261007 (https://download.01.org/0day-ci/archive/20261007/202610070851.VWGLXfJH-lkp@intel.com/config)
> compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070851.VWGLXfJH-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610070851.VWGLXfJH-lkp@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>     sound/soc/sof/amd/acp.c: In function 'amd_sof_acp7x_probe':
>>> sound/soc/sof/amd/acp.c:1153:27: error: implicit declaration of function 'acpi_find_child_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
We haven't pushed Soundwire patches to add support for ACP7.B/7.F platforms
which will resolve this issue.
Below is the dependent patch series.
https://lore.kernel.org/alsa-devel/20260917090407.3828816-1-Vijendar.Mukunda@amd.com/
We will submit the  ACP7.b/7.F support SoundWire patch series along
the dependent patch series after addressing the review comments.

>      1153 |                 pdm_dev = acpi_find_child_device(adev, ACP7X_DMIC_ADDR, 0);
>           |                           ^~~~~~~~~~~~~~~~~~~~~~
>           |                           acpi_match_device
>>> sound/soc/sof/amd/acp.c:1153:25: warning: assignment to 'struct acpi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>      1153 |                 pdm_dev = acpi_find_child_device(adev, ACP7X_DMIC_ADDR, 0);
>           |                         ^
>     cc1: some warnings being treated as errors
>
>
> vim +1153 sound/soc/sof/amd/acp.c
>
>    1090	
>    1091	int amd_sof_acp7x_probe(struct snd_sof_dev *sdev)
>    1092	{
>    1093		struct pci_dev *pci = to_pci_dev(sdev->dev);
>    1094		struct acp_dev_data *adata;
>    1095		const struct sof_amd_acp_desc *chip;
>    1096		const union acpi_object *obj;
>    1097		struct acpi_device *adev;
>    1098		struct acpi_device *pdm_dev;
>    1099		unsigned int addr;
>    1100		unsigned int irqflags;
>    1101		int ret;
>    1102	
>    1103		chip = get_chip_info(sdev->pdata);
>    1104		if (!chip) {
>    1105			dev_err(sdev->dev, "no such device supported, chip id:%x\n", pci->device);
>    1106			return -EIO;
>    1107		}
>    1108		adata = devm_kzalloc(sdev->dev, sizeof(struct acp_dev_data), GFP_KERNEL);
>    1109		if (!adata)
>    1110			return -ENOMEM;
>    1111	
>    1112		adata->dev = sdev;
>    1113		adata->dmic_dev = platform_device_register_data(sdev->dev, "dmic-codec",
>    1114								PLATFORM_DEVID_NONE, NULL, 0);
>    1115		if (IS_ERR(adata->dmic_dev)) {
>    1116			dev_err(sdev->dev, "failed to register platform for dmic codec\n");
>    1117			return PTR_ERR(adata->dmic_dev);
>    1118		}
>    1119	
>    1120		addr = pci_resource_start(pci, ACP_DSP_BAR);
>    1121		sdev->bar[ACP_DSP_BAR] = devm_ioremap(sdev->dev, addr, pci_resource_len(pci, ACP_DSP_BAR));
>    1122		if (!sdev->bar[ACP_DSP_BAR]) {
>    1123			dev_err(sdev->dev, "ioremap error\n");
>    1124			ret = -ENXIO;
>    1125			goto unregister_dev;
>    1126		}
>    1127	
>    1128		pci_set_master(pci);
>    1129		adata->addr = addr;
>    1130		adata->reg_range = chip->reg_end_addr - chip->reg_start_addr;
>    1131		adata->pci_rev = pci->revision;
>    1132		mutex_init(&adata->acp_lock);
>    1133		sdev->pdata->hw_pdata = adata;
>    1134	
>    1135		ret = acp_init(sdev);
>    1136		if (ret < 0)
>    1137			goto unregister_dev;
>    1138	
>    1139		adev = ACPI_COMPANION(&pci->dev);
>    1140	
>    1141		sdev->ipc_irq = pci->irq;
>    1142		irqflags = IRQF_SHARED;
>    1143	
>    1144		ret = request_threaded_irq(pci->irq, acp7x_irq_handler, acp_irq_thread,
>    1145					   irqflags, "AudioDSP", sdev);
>    1146		if (ret < 0) {
>    1147			dev_err(sdev->dev, "failed to register IRQ %d\n", sdev->ipc_irq);
>    1148			goto unregister_dev;
>    1149		}
>    1150	
>    1151		if (adev) {
>    1152			/* DMIC ACPI child address is 2 on ACP7x platforms */
>> 1153			pdm_dev = acpi_find_child_device(adev, ACP7X_DMIC_ADDR, 0);
>    1154			if (pdm_dev)
>    1155				acp_sof_scan_pdm_devices(sdev, pdm_dev);
>    1156	
>    1157			if (!acpi_dev_get_property(adev, "acp-sof-signed-firmware-image",
>    1158						   ACPI_TYPE_INTEGER, &obj))
>    1159				adata->acp_sof_signed_firmware_image = obj->integer.value;
>    1160		}
>    1161	
>    1162		sdev->dsp_box.offset = 0;
>    1163		sdev->dsp_box.size = BOX_SIZE_512;
>    1164	
>    1165		sdev->host_box.offset = sdev->dsp_box.offset + sdev->dsp_box.size;
>    1166		sdev->host_box.size = BOX_SIZE_512;
>    1167	
>    1168		sdev->debug_box.offset = sdev->host_box.offset + sdev->host_box.size;
>    1169		sdev->debug_box.size = BOX_SIZE_1024;
>    1170	
>    1171		if (adata->acp_sof_signed_firmware_image) {
>    1172			adata->fw_code_bin = devm_kasprintf(sdev->dev, GFP_KERNEL,
>    1173							    "sof-%s-code.bin", chip->name);
>    1174			if (!adata->fw_code_bin) {
>    1175				ret = -ENOMEM;
>    1176				goto free_ipc_irq;
>    1177			}
>    1178			adata->fw_data_bin = devm_kasprintf(sdev->dev, GFP_KERNEL,
>    1179							    "sof-%s-data.bin", chip->name);
>    1180			if (!adata->fw_data_bin) {
>    1181				ret = -ENOMEM;
>    1182				goto free_ipc_irq;
>    1183			}
>    1184		}
>    1185	
>    1186		adata->enable_fw_debug = enable_fw_debug;
>    1187		acp_memory_init(sdev);
>    1188		acp_dsp_stream_init(sdev);
>    1189	
>    1190		return 0;
>    1191	
>    1192	free_ipc_irq:
>    1193		free_irq(sdev->ipc_irq, sdev);
>    1194	unregister_dev:
>    1195		platform_device_unregister(adata->dmic_dev);
>    1196		return ret;
>    1197	}
>    1198	EXPORT_SYMBOL_NS(amd_sof_acp7x_probe, "SND_SOC_SOF_AMD_COMMON");
>    1199	
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

