Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257ED8C1F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 08:45:36 +0000 (UTC)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38K57Vgx018580;
	Wed, 20 Sep 2023 08:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=R3EOxq46Q3t992aL6CQuxzhbC72CnhZ3c0YWtRD84fI=; b=
	Ifp85oAaefNchrwcCkebJWfsyC1zJrMAfzojqyXlZbsIWczume6RhCYTPSTtAsTU
	+952nFHZ0x6iCOf8f8QEs6EChHlYSrX23ZEwchc8XufL/8XzUC6TRvRPZW4tzZ/Z
	TyCMwzmHlQ2fubbJejk4me7h5S5hkBMJpVmdE3yzY5b8+WowYFjHpSmuQE+emP1x
	+QR48pyRFvJpN+OdouHUEfjHk0nehiIYq/1BF+sbkIqXf2+S51Si6xSk/VOKxxZR
	vvaCBeC2HtiQlXd1Bve1Dl+5ROTQUICqEhuT3L5SMsSUKHURvnHxUTBBl77u+1YO
	MzlwihYiF44pxj+CoVMS1Q==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2049.outbound.protection.outlook.com [104.47.56.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t53b5u9ek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 08:17:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWAEnvwe+UOqGDjae3j/4TEJKEKYOckfXyTNxKSC26qEpir2pQ/XRlMQfXgNkTrFaxhukyLkbzw7rCAObBoqWpWCg7J3CtnoXIvnjF/q9NnglsImSRdpqfJani6cM6ouKjtVbmmdQKYUJJbVakSX7Pzmzt7yCzcpD+Jcb1NPmhsuz/z/etLooHQLn8YZEA+WjB9t0cSRoyRRqEyDVDeAZ4tXMk1O91bmLf78MFR6gYbhhAvcnABmDvXcz4UbVdC/8PpuvZWENhTO1Snqv0Xg/6PyRGFxIRdn0w43kKoBAYeEj+Y32qKLo0F54bt5V8S1uaL1LeP5OhrXrUSUZ0iNYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3EOxq46Q3t992aL6CQuxzhbC72CnhZ3c0YWtRD84fI=;
 b=fTrg3LcMWEx9d7XM6bfEmMDib+C5ZhcqOkXBXJHc5qmAj+vrW7EmQZZBlOvcyXhrMHbBjnnz8k98HGSRSrshAG2U8os959XKTNV7xclcTrI5WXnlNFJ3zjzz0UW6ZcdrjSvNAFhqfCOOmzbpQQxG7sjozYKgunHuF5Pa2lzfI8ApYAxJAHQmYRu6GzKWV4kTvHUnTRp7joqo5GCS3YNjxidr9NbOYEPtnVzUovZ/bLvjVuGCKnWl8xDP3MzcI2DAY2h+0v9wVCoUisdVLZ78XBpXnefxxBbsvNDELuZFJWiGX26awmanVMwOu5ww1932tsdcEQxXkpJ5DKuL7cGM6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB3008.namprd11.prod.outlook.com (2603:10b6:805:cf::18)
 by LV8PR11MB8461.namprd11.prod.outlook.com (2603:10b6:408:1e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Wed, 20 Sep
 2023 08:17:22 +0000
Received: from SN6PR11MB3008.namprd11.prod.outlook.com
 ([fe80::60cb:4bbd:33bc:66f3]) by SN6PR11MB3008.namprd11.prod.outlook.com
 ([fe80::60cb:4bbd:33bc:66f3%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 08:17:21 +0000
Message-ID: <be341b96-5f58-d38b-7dbb-d7abaf703c58@windriver.com>
Date: Wed, 20 Sep 2023 16:17:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 736/1363]
 drivers/mtd/spi-nor/sfdp.c:1206:12: warning: 'spi_nor_parse_sccr' defined but
 not used
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
        Michal Simek <monstr@monstr.eu>,
        Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
References: <202309201506.10r0YmWL-lkp@intel.com>
From: Yun Zhou <yun.zhou@windriver.com>
In-Reply-To: <202309201506.10r0YmWL-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To SN6PR11MB3008.namprd11.prod.outlook.com
 (2603:10b6:805:cf::18)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3008:EE_|LV8PR11MB8461:EE_
X-MS-Office365-Filtering-Correlation-Id: 111c4a87-294c-4800-671b-08dbb9b20306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fPlQGNp6Tg/YEQB3KqBJIcVRB3NNqcwY9gEQpTg7NUbx4/FJ9d8jTozJ/3mm6CWa7s9u8dVfd0rv6fu3Va0wXssDhq4cSvuIDbmsGgLLsB4eZigIWkmsB7HE38U2abA2ZzcAgIwVfxjBF4rPXkk4hqu9v26CjBcZv7LKyNh4MJZBxg1b3idTL9cjt+5MKYKSu5rFzoapbVZrgBarBFxv1d5yC8tBSWUQ+gqyKNCQhW+q5mVkNJ4fD9icS44XNBMl419sRi2h1jwV7M56rH5LNHmVJx7eemLuGmHtA+UHPjyMcLxHdR1XlzUvA+gC/0854npaJx5sgiE/kx0KdKNVTgiNq5RLyFe7LyuKjUAoUEAYJTWkO8Y5ZxFfopreOOfqnEvjKVPNq/1KDKBxRtJoEjVQxMkgHyixDDxC+nc4dx7jkMtjVelqKoOOTl2j48jKptL3yHcVhWfT8AAEPbTQmBaozzkbwYa1NekshFcgmz8TKb7W+owz1TnBKuaNbjq1WiIa+zZInAo4hGK9fnZwfmt0SPiUTQyW2Pks6VqHdZQDJD4pCHb90IZaRezC6Q3WKdK+OMegyj3svrMMREjVqd8u2tEaAOm/O3ahQO9kgmCv7OaS8qZe0unBdmEtyMvonffrBAi8VoQyNB79+m2SuA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3008.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39850400004)(396003)(366004)(1800799009)(186009)(451199024)(31686004)(86362001)(31696002)(36756003)(38100700002)(53546011)(2906002)(44832011)(478600001)(6506007)(54906003)(66556008)(66946007)(8676002)(8936002)(6666004)(66476007)(4326008)(5660300002)(966005)(6512007)(30864003)(83380400001)(6486002)(6916009)(26005)(316002)(41300700001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?clBVRld6OTY3eGE4dDN0ZnpqS2ZlaERXZTZ5R2RLYUFjSWFOc1RXS2RUc2p1?=
 =?utf-8?B?SlU5Z2x6RVFQZzJxUG9QSWRiVjd5V3c0WHNYUW1FN0RnY3pMMGxpV2tGbDF0?=
 =?utf-8?B?MlZtTU1hblU5Y3BlYlRNbVQ3a202VFRLNHlvTWYxY3BEdHc5V1BPOXliZjhV?=
 =?utf-8?B?TTJnaGlPQTRWcTRDZldXU0x4L2NaTEJLRTVlczVVYjVRZ1I4cmZhTjFic2Vj?=
 =?utf-8?B?aStVaFNieUgreGdlL3JacTh3UEN4aVNuS041RENmZXpuNjhkKzFCekFOQ0cy?=
 =?utf-8?B?SWF4OXBhVk9SMWpTbENqNFBmelJzcjByRmY0OFFrRFQzK3hWRVlTNStGTnlz?=
 =?utf-8?B?RkN6cjlSRGFBSzhvbG1vZ1JsL1ovY0xqdVB6NGNtZVFhTGxRWDJ5TmpiNmpY?=
 =?utf-8?B?Z09vVVQxd3Jzd2FocnVjMkt5QkN6ZnBOQ2hGd3FxQzByZktKTkFsRGhTdHl5?=
 =?utf-8?B?ZXI0TlB5MnZKMzF5UFo1cTF5d0hNbjFCa29lcGtJUExXYlNiSXZZMklHL3R6?=
 =?utf-8?B?WXlBTkplVmVjN2hSNUpTdmtsZ1lRMUcvZE1QMFkxSG5Qa0d2SVhWQm9Mbllj?=
 =?utf-8?B?VTRwSkhSazBCWmROMnBFeWNmODhXRTluZGdiS0dJZy9OT1BPZjQ1TElPdkRu?=
 =?utf-8?B?UzkyZHIzQ2pvSU1acmtHWlV2ZnFHZ2IvRENhaU1zK09qMFpCbjRrdlpRZm1x?=
 =?utf-8?B?UGZBUkRYbm9Td2JpNkh1N0czU0phMDhVdTBNcmU3Y2pjdkhTLzZVdzlWcis2?=
 =?utf-8?B?aXVFSUxtRkJ5b3p3eStvc1pyTTNlUm01aHlrTytqU04zcG5LWm5pbGlyV3Zn?=
 =?utf-8?B?UlBXOG0ySkltMy8zcXd1TGZwblFmTldsUklweG9WbEwwbDNybWUyUWV5MjRz?=
 =?utf-8?B?S1k5ZUVQa2VYVkJ4QTZmQUpSMDBtUVdRclk1QVJNRkRKMFl0cUx2RW41U0s4?=
 =?utf-8?B?VzVTb0tEd1pjUE9nYk1heWFhVEV4Vk9hMEdQMVZNOFhyekxRNW1xbEgvamo2?=
 =?utf-8?B?ZTR1L3g3R3R3L09EZHpTSjJ6RXNIcDczSHNJNVhQcUttSk1VU0kyM0dlZkFo?=
 =?utf-8?B?VzJjcHczRHUxL2JxVGZuNURWa1M1aFN1YWsxS05jQS95SlRZS0c5ZlRjK1l0?=
 =?utf-8?B?Q0dVQjZuRUZieSs5Z1I4Mlk1TVNUbmtGcVlOeGo5NGd1ajY5Z2wwSysxSHBk?=
 =?utf-8?B?eFBhZUIwRHFSTWl0Z1JlaEFDK2VkMFFQKzZMa0psM2lrTm9aRTFqalBmS0Nz?=
 =?utf-8?B?djFTdm9ERjJkUTlwZTBWYXdoTlNJZWhrY0lyY3FZcWpvQ0pjWENKaXlMMm9Z?=
 =?utf-8?B?UDRDM2E2bXI0NG9mejk1V05ES2s1N2J0UU1wZW1GRWcxTW83YWRSNyt1WG1k?=
 =?utf-8?B?Z0JqemdTSXltbmo2azRoNXpvQ3RHOGhuUHJGdnVtOFhNVzNWSmcrRVpMYSt5?=
 =?utf-8?B?ZkRhS1NtY1FzYkVUUTA5RkkvM0FOZ2pRUFFlME1YUlFhY1VkMlhGYmEzNUhJ?=
 =?utf-8?B?dm9vWUUxbVJEM05Sd0V1RklmSHlhZ0h0VWFoWFpUbG9jWlJMaEhnQVhBQ0FM?=
 =?utf-8?B?YkYrVHdCQkRIcjB2N2pTT21kY1c0cnluYkhrTWVVWVRvZFJkMTlBVzJhbjRs?=
 =?utf-8?B?RFIwT0J0N2l6akt4bzNiVzFPaUJpNG01cEJWMHJST2dCVUwxdFc0cDVZenlL?=
 =?utf-8?B?ZFZDMnUrRWRMa0dVUkFuektXVllSZEcxWjlMUXR1aVdNU2hkV2kvV0FjRDBv?=
 =?utf-8?B?dmJNb2Q0SGpkLzJ5MnFVR21tNnVTYWFUK2VYZmdTbW9qb1V4NjY4eEFyU3B3?=
 =?utf-8?B?dEpZallqK2lHT0p3d25wS083cFdqM0J6WnVHV2tRZWVXZ1dhdVBoektEN29z?=
 =?utf-8?B?UldYZ1NyMDNIOUE2KzQ2SWFhS21mSlFSRjVHSmkxYjZSUEJFOFY4VldOdFVl?=
 =?utf-8?B?UWFYQmNNS3RYUWpSMkNoSmNqeFJSVFFOemxSQWZqL3YyaGR1bVAyeVpBTTRk?=
 =?utf-8?B?RVZyUzN4bFNFaGZTMEV1WDNTTVlwRk80RVVUU3E1dEUwRUNiaDlYb0MzMzRR?=
 =?utf-8?B?UWRuODc5OXZtSFhzVklHNWtxTGxrQ3pnS3F0eHptd2hJZXdYSXNudUpqOHc2?=
 =?utf-8?Q?+wgF3jCRRRFtvNM9Y+OUm+FZh?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111c4a87-294c-4800-671b-08dbb9b20306
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3008.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 08:17:21.3154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1etHkU48YjikzyYh6QoCDOdB8ztGBPIAHnC9bV/zKT3I2Uk4NEdVp7vwjG/LWAz8rcQL6J7MJDihwpklUe4p9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8461
X-Proofpoint-GUID: efqJPpRDqMPG2mvZCEJIGu4bPVr8R4GC
X-Proofpoint-ORIG-GUID: efqJPpRDqMPG2mvZCEJIGu4bPVr8R4GC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_02,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=780
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1011 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309200066

You can remove '#ifdef CONFIG_OF' to eliminate the warnings.

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index a327bdb216c4..74f8dcbc305c 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1404,7 +1404,6 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
                 case SFDP_SECTOR_MAP_ID:
                         err = spi_nor_parse_smpt(nor, param_header);
                         break;
-#ifdef CONFIG_OF
                 case SFDP_4BAIT_ID:
                         {
                                 struct device_node *np = 
spi_nor_get_flash_node(nor);
@@ -1423,7 +1422,6 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
                 case SFDP_SCCR_MAP_ID:
                         err = spi_nor_parse_sccr(nor, param_header);
                         break;
-#endif
                 default:
                         break;
                 }

On 9/20/23 15:23, kernel test robot wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
> head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
> commit: dc2415e2e9dfa89252ea0ecceaa605cbbf903af4 [736/1363] mtd: spi-nor: Don't parse 4BAIT via Zynq QSPI
> config: x86_64-buildonly-randconfig-005-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201506.10r0YmWL-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201506.10r0YmWL-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309201506.10r0YmWL-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/mtd/spi-nor/sfdp.c:1206:12: warning: 'spi_nor_parse_sccr' defined but not used [-Wunused-function]
>      1206 | static int spi_nor_parse_sccr(struct spi_nor *nor,
>           |            ^~~~~~~~~~~~~~~~~~
>>> drivers/mtd/spi-nor/sfdp.c:1128:12: warning: 'spi_nor_parse_profile1' defined but not used [-Wunused-function]
>      1128 | static int spi_nor_parse_profile1(struct spi_nor *nor,
>           |            ^~~~~~~~~~~~~~~~~~~~~~
>>> drivers/mtd/spi-nor/sfdp.c:943:12: warning: 'spi_nor_parse_4bait' defined but not used [-Wunused-function]
>       943 | static int spi_nor_parse_4bait(struct spi_nor *nor,
>           |            ^~~~~~~~~~~~~~~~~~~
> 
> 
> vim +/spi_nor_parse_sccr +1206 drivers/mtd/spi-nor/sfdp.c
> 
> fb27f198971a68 Pratyush Yadav 2020-10-05  1119
> fb27f198971a68 Pratyush Yadav 2020-10-05  1120  /**
> fb27f198971a68 Pratyush Yadav 2020-10-05  1121   * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
> fb27f198971a68 Pratyush Yadav 2020-10-05  1122   * @nor:                pointer to a 'struct spi_nor'
> fb27f198971a68 Pratyush Yadav 2020-10-05  1123   * @profile1_header:    pointer to the 'struct sfdp_parameter_header' describing
> fb27f198971a68 Pratyush Yadav 2020-10-05  1124   *                      the Profile 1.0 Table length and version.
> fb27f198971a68 Pratyush Yadav 2020-10-05  1125   *
> fb27f198971a68 Pratyush Yadav 2020-10-05  1126   * Return: 0 on success, -errno otherwise.
> fb27f198971a68 Pratyush Yadav 2020-10-05  1127   */
> fb27f198971a68 Pratyush Yadav 2020-10-05 @1128  static int spi_nor_parse_profile1(struct spi_nor *nor,
> a580293a19fc49 Tudor Ambarus  2021-03-06  1129                                    const struct sfdp_parameter_header *profile1_header)
> fb27f198971a68 Pratyush Yadav 2020-10-05  1130  {
> fb27f198971a68 Pratyush Yadav 2020-10-05  1131          u32 *dwords, addr;
> fb27f198971a68 Pratyush Yadav 2020-10-05  1132          size_t len;
> fb27f198971a68 Pratyush Yadav 2020-10-05  1133          int ret;
> fb27f198971a68 Pratyush Yadav 2020-10-05  1134          u8 dummy, opcode;
> fb27f198971a68 Pratyush Yadav 2020-10-05  1135
> fb27f198971a68 Pratyush Yadav 2020-10-05  1136          len = profile1_header->length * sizeof(*dwords);
> fb27f198971a68 Pratyush Yadav 2020-10-05  1137          dwords = kmalloc(len, GFP_KERNEL);
> fb27f198971a68 Pratyush Yadav 2020-10-05  1138          if (!dwords)
> fb27f198971a68 Pratyush Yadav 2020-10-05  1139                  return -ENOMEM;
> fb27f198971a68 Pratyush Yadav 2020-10-05  1140
> fb27f198971a68 Pratyush Yadav 2020-10-05  1141          addr = SFDP_PARAM_HEADER_PTP(profile1_header);
> fb27f198971a68 Pratyush Yadav 2020-10-05  1142          ret = spi_nor_read_sfdp(nor, addr, len, dwords);
> fb27f198971a68 Pratyush Yadav 2020-10-05  1143          if (ret)
> fb27f198971a68 Pratyush Yadav 2020-10-05  1144                  goto out;
> fb27f198971a68 Pratyush Yadav 2020-10-05  1145
> fb27f198971a68 Pratyush Yadav 2020-10-05  1146          le32_to_cpu_array(dwords, profile1_header->length);
> fb27f198971a68 Pratyush Yadav 2020-10-05  1147
> fb27f198971a68 Pratyush Yadav 2020-10-05  1148          /* Get 8D-8D-8D fast read opcode and dummy cycles. */
> fb27f198971a68 Pratyush Yadav 2020-10-05  1149          opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, dwords[0]);
> fb27f198971a68 Pratyush Yadav 2020-10-05  1150
> fb27f198971a68 Pratyush Yadav 2020-10-05  1151           /* Set the Read Status Register dummy cycles and dummy address bytes. */
> fb27f198971a68 Pratyush Yadav 2020-10-05  1152          if (dwords[0] & PROFILE1_DWORD1_RDSR_DUMMY)
> a580293a19fc49 Tudor Ambarus  2021-03-06  1153                  nor->params->rdsr_dummy = 8;
> fb27f198971a68 Pratyush Yadav 2020-10-05  1154          else
> a580293a19fc49 Tudor Ambarus  2021-03-06  1155                  nor->params->rdsr_dummy = 4;
> fb27f198971a68 Pratyush Yadav 2020-10-05  1156
> fb27f198971a68 Pratyush Yadav 2020-10-05  1157          if (dwords[0] & PROFILE1_DWORD1_RDSR_ADDR_BYTES)
> a580293a19fc49 Tudor Ambarus  2021-03-06  1158                  nor->params->rdsr_addr_nbytes = 4;
> fb27f198971a68 Pratyush Yadav 2020-10-05  1159          else
> a580293a19fc49 Tudor Ambarus  2021-03-06  1160                  nor->params->rdsr_addr_nbytes = 0;
> fb27f198971a68 Pratyush Yadav 2020-10-05  1161
> fb27f198971a68 Pratyush Yadav 2020-10-05  1162          /*
> fb27f198971a68 Pratyush Yadav 2020-10-05  1163           * We don't know what speed the controller is running at. Find the
> fb27f198971a68 Pratyush Yadav 2020-10-05  1164           * dummy cycles for the fastest frequency the flash can run at to be
> fb27f198971a68 Pratyush Yadav 2020-10-05  1165           * sure we are never short of dummy cycles. A value of 0 means the
> fb27f198971a68 Pratyush Yadav 2020-10-05  1166           * frequency is not supported.
> fb27f198971a68 Pratyush Yadav 2020-10-05  1167           *
> fb27f198971a68 Pratyush Yadav 2020-10-05  1168           * Default to PROFILE1_DUMMY_DEFAULT if we don't find anything, and let
> fb27f198971a68 Pratyush Yadav 2020-10-05  1169           * flashes set the correct value if needed in their fixup hooks.
> fb27f198971a68 Pratyush Yadav 2020-10-05  1170           */
> fb27f198971a68 Pratyush Yadav 2020-10-05  1171          dummy = FIELD_GET(PROFILE1_DWORD4_DUMMY_200MHZ, dwords[3]);
> fb27f198971a68 Pratyush Yadav 2020-10-05  1172          if (!dummy)
> fb27f198971a68 Pratyush Yadav 2020-10-05  1173                  dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ, dwords[4]);
> fb27f198971a68 Pratyush Yadav 2020-10-05  1174          if (!dummy)
> fb27f198971a68 Pratyush Yadav 2020-10-05  1175                  dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_133MHZ, dwords[4]);
> fb27f198971a68 Pratyush Yadav 2020-10-05  1176          if (!dummy)
> fb27f198971a68 Pratyush Yadav 2020-10-05  1177                  dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_100MHZ, dwords[4]);
> fb27f198971a68 Pratyush Yadav 2020-10-05  1178          if (!dummy)
> fb27f198971a68 Pratyush Yadav 2020-10-05  1179                  dev_dbg(nor->dev,
> fb27f198971a68 Pratyush Yadav 2020-10-05  1180                          "Can't find dummy cycles from Profile 1.0 table\n");
> fb27f198971a68 Pratyush Yadav 2020-10-05  1181
> fb27f198971a68 Pratyush Yadav 2020-10-05  1182          /* Round up to an even value to avoid tripping controllers up. */
> fb27f198971a68 Pratyush Yadav 2020-10-05  1183          dummy = round_up(dummy, 2);
> fb27f198971a68 Pratyush Yadav 2020-10-05  1184
> fb27f198971a68 Pratyush Yadav 2020-10-05  1185          /* Update the fast read settings. */
> a580293a19fc49 Tudor Ambarus  2021-03-06  1186          spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_8_8_8_DTR],
> fb27f198971a68 Pratyush Yadav 2020-10-05  1187                                    0, dummy, opcode,
> fb27f198971a68 Pratyush Yadav 2020-10-05  1188                                    SNOR_PROTO_8_8_8_DTR);
> fb27f198971a68 Pratyush Yadav 2020-10-05  1189
> fb27f198971a68 Pratyush Yadav 2020-10-05  1190  out:
> fb27f198971a68 Pratyush Yadav 2020-10-05  1191          kfree(dwords);
> fb27f198971a68 Pratyush Yadav 2020-10-05  1192          return ret;
> fb27f198971a68 Pratyush Yadav 2020-10-05  1193  }
> fb27f198971a68 Pratyush Yadav 2020-10-05  1194
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1195  #define SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE              BIT(31)
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1196
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1197  /**
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1198   * spi_nor_parse_sccr() - Parse the Status, Control and Configuration Register
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1199   *                        Map.
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1200   * @nor:                pointer to a 'struct spi_nor'
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1201   * @sccr_header:        pointer to the 'struct sfdp_parameter_header' describing
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1202   *                      the SCCR Map table length and version.
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1203   *
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1204   * Return: 0 on success, -errno otherwise.
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1205   */
> 981a8d60e01f7e Tudor Ambarus  2020-10-05 @1206  static int spi_nor_parse_sccr(struct spi_nor *nor,
> a580293a19fc49 Tudor Ambarus  2021-03-06  1207                                const struct sfdp_parameter_header *sccr_header)
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1208  {
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1209          u32 *dwords, addr;
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1210          size_t len;
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1211          int ret;
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1212
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1213          len = sccr_header->length * sizeof(*dwords);
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1214          dwords = kmalloc(len, GFP_KERNEL);
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1215          if (!dwords)
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1216                  return -ENOMEM;
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1217
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1218          addr = SFDP_PARAM_HEADER_PTP(sccr_header);
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1219          ret = spi_nor_read_sfdp(nor, addr, len, dwords);
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1220          if (ret)
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1221                  goto out;
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1222
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1223          le32_to_cpu_array(dwords, sccr_header->length);
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1224
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1225          if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[22]))
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1226                  nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1227
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1228  out:
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1229          kfree(dwords);
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1230          return ret;
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1231  }
> 981a8d60e01f7e Tudor Ambarus  2020-10-05  1232
> 
> :::::: The code at line 1206 was first introduced by commit
> :::::: 981a8d60e01f7e76d6bccb621598d087c9dd4a5d mtd: spi-nor: Parse SFDP SCCR Map
> 
> :::::: TO: Tudor Ambarus <tudor.ambarus@microchip.com>
> :::::: CC: Vignesh Raghavendra <vigneshr@ti.com>
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
