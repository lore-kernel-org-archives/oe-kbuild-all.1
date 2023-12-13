Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9869578E79
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 20:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VOoIg2mf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eBga0n4G"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BDK25lC025417;
	Wed, 13 Dec 2023 20:15:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=fzn6Ay7KG1ffqn2m5tx196+j/7rG6gEK9aOkK0rRWr0=;
 b=VOoIg2mfAbQfDSKsRzv5yrt83X1kXwPuxMinVDbSwGTbZaxaMJS4/ZuSffrp6TnN7DZ2
 nUnJlmdf4AeudjhS6rRsNFc4u1k7QCBKj2uwgOLZruwYqzvT9ttwD3lHfY2gtCOB1afD
 yKmPNPQ/1VDKYxu0US1lCswKERVvUeDqMvhjt/yqUu2RNSrLhCF8EVFlITk2A9g+nGAx
 k9LkffnJ5dVBADyDznplfr+LfmEGPmc9lAj5ugypBLt/W4WyTpHcX/IA5oretGNLKsbM
 x6BHL4OO4+DlxCPcKQw9PwoJvMMafAnodeT1DnshjYAN50ghMu4H9qAqh7szym+qHz1v tw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3uveu293xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Dec 2023 20:15:18 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3BDIrNbb018689;
	Wed, 13 Dec 2023 20:15:17 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3uvep8wd5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Dec 2023 20:15:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A9HnLQY5cDphFepMmX9bY4MPWEQNafGcgmnzjwCvhRCXrO3a1xvSSHbW0pLf9GxdUkfC1y8JrawmHPJpYTTPU7jwlqGoJcRcD4im191/53Q/XDRpyAjyslmJNBoOlqh7Bm7eEDyP/SWEQ3pbVrBUOXDoKYeB7YotPshtBuiLqz8EiFoTwpZYUAgeU9H+VuRJGs2CaSB+QzrapkvWJ31Zafyx1iOhWpM0xy9cFhsCqodCNdg/P+nGmtmy9ZhCNl8dWPZql4fnx84Nn2SVk7VhRHTAme0dNHfhhlXLOcdB5VmQKsvZUXjm9CBJt/mzMPVfmua/lpyvKv3TkLt+FJ+0uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzn6Ay7KG1ffqn2m5tx196+j/7rG6gEK9aOkK0rRWr0=;
 b=hvsP+SjNK+9pMXf3ea5NHcPkxQIKtDu/IyzUxczY/6HtbSXUU2HkoEfMLo3vwubR//pxBfTk0dYxTJpuddamX4H03gcK1SjH8ujtjur3bwZ8fl2ns/OgyLvHs/mLSBSeNjXpZ5DBU66leRFXuJuXvufXSOTZ4zIUZj0mKEKJEQgqN/SLgWA33f/wPP+8qAIURTdoqv0QYVaEOnjb/bcDphHYt6C02/l5W0fpndh6Fx5HnHS51dcjAAfmBypIUcRc4G7tN031a+UTkuPqObvhOC5wv+r4X5vLTGzKhvM0Nt2RkHUQBKRf0ADFm9iKEEOUTpaglpOapCcV+y3HahoCqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzn6Ay7KG1ffqn2m5tx196+j/7rG6gEK9aOkK0rRWr0=;
 b=eBga0n4GfXzu3p6EDOpxQiF3Rk3kGu9H+9eU3I7vnpER2GDApZw60cGfIkaom9YVwTcFi28AoUtZzBRVyARoieDxeRAdTARUgFmxyX+Q1IbrlgWML09pOId2AKjhHdcYQyJJ+9jqJ3H4uPeZc5DhcW6P8h6BtEBcA7xJ3bOlqc8=
Received: from CH0PR10MB5113.namprd10.prod.outlook.com (2603:10b6:610:c9::8)
 by MN2PR10MB4317.namprd10.prod.outlook.com (2603:10b6:208:199::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 20:15:13 +0000
Received: from CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::7361:23aa:7669:bcce]) by CH0PR10MB5113.namprd10.prod.outlook.com
 ([fe80::7361:23aa:7669:bcce%7]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 20:15:13 +0000
Message-ID: <297ba758-595c-4951-6f83-28f0b264e765@oracle.com>
Date: Wed, 13 Dec 2023 12:15:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [akpm-mm:mm-unstable 208/262] lib/maple_tree.c:5506:30: error:
 'struct ma_state' has no member named 'end'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>
References: <202312132207.KsGGGt1v-lkp@intel.com>
Content-Language: en-US
From: Sidhartha Kumar <sidhartha.kumar@oracle.com>
In-Reply-To: <202312132207.KsGGGt1v-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::29) To CH0PR10MB5113.namprd10.prod.outlook.com
 (2603:10b6:610:c9::8)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5113:EE_|MN2PR10MB4317:EE_
X-MS-Office365-Filtering-Correlation-Id: ea4246ce-fb50-41dc-3228-08dbfc1836d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+XEkZlNaXUp184tXCB+q7m4MXxUJQ6wSzJtuMJ+55siyfOfllCtF9Ngecw3HkMEo6s0Zi2S84cXPIX3Gyb5MRnqJOPTFIDN3yidm9JhFTFUUXWsZZl455OgDqusXy0VhUdg7owB7H08u0j1qLqffs1FHox5P1XWz2kCSVxZofKv2MlhVjYXzH/lubtpc//9NIox27CTXT7rlFOtmpRVqf9vz8WmuTQNtO4GeCUCYVUmeMR8rJARfaz6JeOQSqTg1hc1Zahs0Asd6ZI/NYmm0nSXQA0/kleb7ffyaRrcc9UHeD/pgYHrESReMWmiOnYP2kFqs7g8B/OzeKEgArAJseTGKlV9AyDaYwjI17NUwvGcHo9ys0ZmoxvkACnVP3x/6ZM+i9YTg+/Jf5KwG60t9lrQ/+vuoHn3jNa8gtYJ9q3mRoql+86gnWQPESDO8QcRMDjgwUXY+tqQYimD0VEs02+9j5Lp0WP7q59pFbPxXj2QLb0bErhc6rZ+BeESvxvi9++LYouXPXQkg83zk60iPvyV0/xwF6mthyNEv7gjIk+s2JWznX7styleyODZujM8vDkDcZcRzIEGRCYfOxQp2CUrnPf5ZdBPxLIRl3+KfY97Gfj3OITR0SF+e1JJY4scutMSFt/TXM4lrWrRMxNcwgbAtSqWhEjY+auJvoi6gQCSXawSLlDvoK5fJpeRLK+o0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5113.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(6512007)(6506007)(53546011)(2616005)(107886003)(44832011)(5660300002)(4326008)(41300700001)(8676002)(8936002)(2906002)(6486002)(966005)(54906003)(478600001)(316002)(6916009)(66476007)(66946007)(66556008)(36756003)(86362001)(31696002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZXpFdmd1WUl4RytCR3VhbVJJZ25vRGJ1bnBxMndjZnh3WndNQ0k0RndrUkNa?=
 =?utf-8?B?Z2ZtM0JHV28xOEhTZllmN3hKUVlsWjVIckR0NlkybzhtTXZsMi9FK2Y0YmNt?=
 =?utf-8?B?eHZReENzUHdWYUN1MHNxNlhNclJlbTc5eTNjc3QrQjFBRGZ6VmVyb1IrcGhK?=
 =?utf-8?B?MnZNYzVOeXJDWk55TmhOeTdTcU1oR1VtSXFSRDJvM0VPV1p5dkNpN2JNYjZH?=
 =?utf-8?B?RnlNRlF4V0NFZVE2R1VKc0ptMlIrTWdoMjNJSVkvQzduMkVaU0JNb3gwYmE3?=
 =?utf-8?B?SVFoSzBJc2ZwUStvZlNEajBpZ0gweDFPRkxnZ3JHQ2c3UW45SjUvQnJTUDNa?=
 =?utf-8?B?bi92ZFM1Vk0rY0pZTE5KeTVSWkt1Z1duMVNRK2p4elpWNmpIRXJGR0xHNWg0?=
 =?utf-8?B?MkMxaGFhK05tN3piZFAySVFka3RDQ3phZlVaSklSV1BHcndXYUhXb3JnOHpD?=
 =?utf-8?B?Z2MrZWRpMCtwclZGalNnbmd0akNncVdlVnp2cmR3VW0yV21GNnBRVWpwRUNs?=
 =?utf-8?B?UDVBbXZhWkF2SnplYjNtRk8xQnRwN1gyK2VLL2FsVVhHN0tnVjVVbW9rV3BY?=
 =?utf-8?B?V0FXTkUxd1grRHRSWko5Q1RiYlBqQTAxeHNnRXVXZVBjQW14OUVOTHY0RWE2?=
 =?utf-8?B?bkExbG9mMEpmZjNEUWlLMVl5b2FqRkxOUzNjY3dVTUR2R1grOHVkQTZQejNo?=
 =?utf-8?B?dzR0OFg1Y2ZSVTBuQTdPT0RNaG5tdXhCam1DSWVCK1J0UUtvdHhFK3Z4ME9z?=
 =?utf-8?B?YWNIMk1HaTRqZGVidDJxOUswc280U3NxTVc3ZnFkU2RYQVBMTUpJL291WTNy?=
 =?utf-8?B?K294SFdGLzJGdnFQMmZLdjBIZGxJVUtCZEpvVWROcWJvcitvZFBRbndTVmpk?=
 =?utf-8?B?NmVmbTB6MENUYitCUFgyTkllTHFzVzB0N2JUdEY4cHZURmw0SVNWVC9lTmgx?=
 =?utf-8?B?YU9uUSsrMGJGMnNIM0diaFBMNmJzckJhWFNHSFFuWWpERlF2aVU1Mk4wU2FO?=
 =?utf-8?B?dHgwVjZQMEdPU2ZwWE1TcFFQM1Q0Y0EwV203VXBVQUtCMW9WOXdQQTcydy85?=
 =?utf-8?B?cGlZMFphWjR0ZllReXJ5VHpzdlZUejBNU2xNN1NSSlBwUVE1bitzWTBTUW9D?=
 =?utf-8?B?V3Q0clFqUllFeFlaMUNJZVdnbnlTeGc1UnZicjAzMjhDUHhUeUZPSnBsSVhv?=
 =?utf-8?B?aHdJR0RGL1dvS2RCUmhVRno5MUJRQUNrZUEzQkRqK01JTkc1NnZlaEpqcmZ5?=
 =?utf-8?B?VnkzKytSRUNVU3Zla2xVcEN0cmswSEVGQ0tNd2JmbTdmNUhyVitnQzhBVlBP?=
 =?utf-8?B?MGNVMUtmeHlLREt3SnFML05LbUhvWVAzS0pkV2JJTE96MVppVDA3WUlqQ3NR?=
 =?utf-8?B?blVIb1dRV2FDM1FZWXV3RWZEWHMwMTNoK29VRnlaK0g4cVF2aG5rWWc4eXhT?=
 =?utf-8?B?cmNOeFM3dHNvNzliRlRTVEVxT20yL1RmSWxPaHJFV2ZZbXdzTyt3clZTb2RU?=
 =?utf-8?B?VitLVUFHQitIelA2ZUs2SWV6V0V5QVczNVFIcll3dko0SDdIUytCM2VKczB6?=
 =?utf-8?B?WHBQTThldTFCNDdudFIzSllzODhpeVlxOXl4T2FOT0d0NDBnbUJxUkFJN3Na?=
 =?utf-8?B?UjdTSGYySUxLbUh4c2RzRGVRRUJVZGZUL2J6TkMwOUVmeHRsZG11OS8yVDZW?=
 =?utf-8?B?dTVLOGdXenMydVlGSENZbWRVSU41czlQMkRNRTRzbklyaFJidm9ZcW9sYUtJ?=
 =?utf-8?B?cCtpbjNUL2xZOHN1UThKMUYyTTU5Y2RoNlF4eGQrckVTa0JvTWJSZVgvQWEz?=
 =?utf-8?B?NXQyd2w2VjF5ejRBeGVDcDhhS2g0YnlXNklVUFJOZVBIWFpjU1llYStsQ1I4?=
 =?utf-8?B?WlUrWGVzZlVsaXJWME0zRkJDeE5BUEkrbzBPd3RyN0hRL1NKaUJRaFNBVVRN?=
 =?utf-8?B?VFc2UDZLL2lDR1p3Vm1nU1RJUWNCKytyRGc4Q1pTaVRkVGtybUQwZHhJRExJ?=
 =?utf-8?B?NG5pbWpEUVBHZnB3KzhydU05UmIvVSswUnEzZ0lQQ0llNDhzNjJzczlLZ1By?=
 =?utf-8?B?T20yZDFDTzIzV0RDajBjRit3RHZJbWNSSjRhaGlEN1NWZmhYR1Zsc0xSQngr?=
 =?utf-8?B?RWVTLzdTN200UDFDVURYU212YXVONVY1dXhjc2xsMnBGL0pPeE9BajYvQmla?=
 =?utf-8?Q?gfoiDguaaLNUkRJxFK9V1CM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	xblH9/JAihbmJFZRfryBQY5fgoFcWTgRJLGjvyuQiuV/07KBG8AI/BCbwW892MZp4jJYk60OgXwXbWSVLDyZGwRz5frEzSrwiUaR4gBVC8HO1mCxqreCJRpW+mVoKFVU1ECHdIYR1E5LfRMPfviDeBIeTCbA+o8ElrEuW55WRcinePjqBI7V0J/20qGkCvZhgo0b/lPpOibKJk8Q/scJx96KC1Crnpki8BNMYktizLrgmYvs2EqRdapmInM4AwBZww3QNvxpEQ8eNUTGbMDwKOVzLGwh+gPOhwSRPoCgjPlTYfEN9UrLOasdowNLPqa+Ue+uSq56Q9Y8ot/7pCT8HoombnjfyZPeMUi7I6KtucBAcpEh4CAfDbB9ltF3MRetSBzAAmEe8hOEWtPJbItg9lHgz4uHaz9CMnMOAYeqbkf43vvrf2B4/Xr8LA5sujWXBZtrDxaHcXETjYoF8Pu8VMWDkkuhAoLS3hVMztfprWhXqPerO2vmZLH3CPwOgM66JAbgzLx/CYwSK3/35JJQEBjHivhiicriRJFmED8cBFCAbnfd1pdanxpmjwM/SBxuyPWBAUSmZ8sM4zQ6p6lnxusIou4XCufJZrXAn0en9zk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4246ce-fb50-41dc-3228-08dbfc1836d5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5113.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 20:15:13.3867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Is49yFGQrIv26XtGCsfMt1ctWDaGQAqVB/FQzE3/Czm8dwtkyT8eyvuTK0QOzNP8BBUkSjVRzh8va+qE57YcnsF/jYSwjwm7LzYkTQHspb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4317
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-13_14,2023-12-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312130143
X-Proofpoint-ORIG-GUID: hQdUJQj1ZOX8wPjpZCwM8zEeg3uvM39H
X-Proofpoint-GUID: hQdUJQj1ZOX8wPjpZCwM8zEeg3uvM39H

On 12/13/23 6:24 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   4d9256c0c56bafd76b8b1517916451e168fae495
> commit: 84bda0b24555d3fdf52b56040696ee1ee00700c9 [208/262] maple_tree: do not preallocate nodes for slot stores
> config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20231213/202312132207.KsGGGt1v-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312132207.KsGGGt1v-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312132207.KsGGGt1v-lkp@intel.com/
> 
> Note: the akpm-mm/mm-unstable HEAD 4d9256c0c56bafd76b8b1517916451e168fae495 builds fine.
>        It only hurts bisectability.
> 
> All errors (new ones prefixed by >>):
> 
>     lib/maple_tree.c: In function 'mas_preallocate':
>>> lib/maple_tree.c:5506:30: error: 'struct ma_state' has no member named 'end'
>      5506 |         if ((node_size == mas->end) && ((!mt_in_rcu(mas->tree))
>           |                              ^~
> 
Hi Andrew,

I developed this patch over mm-unstable which contains the change to make end a 
member of struct ma_state. But because this patch is a hotfix, it shouldn't have 
been developed on top of feature commits that won't be a part of a 6.7 rc. I'll 
send a v2 with the coding style changes and using wr_mas->node_end.

When this fix is merged into mm-unstable, it will cause another build error 
because  Liam's series [PATCH 00/12] maple_tree: iterator state changes[1] will 
have to be updated to converting this patch's use of wr_mas->node.

Thanks,
Sid



[1]: 
https://lore.kernel.org/all/20231101171629.3612299-5-Liam.Howlett@oracle.com/T/#mc0e5000f6de822182bf7579c230030c5ec4ec1a7

> 
> vim +5506 lib/maple_tree.c
> 
>    5465	
>    5466	/**
>    5467	 * mas_preallocate() - Preallocate enough nodes for a store operation
>    5468	 * @mas: The maple state
>    5469	 * @entry: The entry that will be stored
>    5470	 * @gfp: The GFP_FLAGS to use for allocations.
>    5471	 *
>    5472	 * Return: 0 on success, -ENOMEM if memory could not be allocated.
>    5473	 */
>    5474	int mas_preallocate(struct ma_state *mas, void *entry, gfp_t gfp)
>    5475	{
>    5476		MA_WR_STATE(wr_mas, mas, entry);
>    5477		unsigned char node_size;
>    5478		int request = 1;
>    5479		int ret;
>    5480	
>    5481	
>    5482		if (unlikely(!mas->index && mas->last == ULONG_MAX))
>    5483			goto ask_now;
>    5484	
>    5485		mas_wr_store_setup(&wr_mas);
>    5486		wr_mas.content = mas_start(mas);
>    5487		/* Root expand */
>    5488		if (unlikely(mas_is_none(mas) || mas_is_ptr(mas)))
>    5489			goto ask_now;
>    5490	
>    5491		if (unlikely(!mas_wr_walk(&wr_mas))) {
>    5492			/* Spanning store, use worst case for now */
>    5493			request = 1 + mas_mt_height(mas) * 3;
>    5494			goto ask_now;
>    5495		}
>    5496	
>    5497		/* At this point, we are at the leaf node that needs to be altered. */
>    5498		/* Exact fit, no nodes needed. */
>    5499		if (wr_mas.r_min == mas->index && wr_mas.r_max == mas->last)
>    5500			return 0;
>    5501	
>    5502		mas_wr_end_piv(&wr_mas);
>    5503		node_size = mas_wr_new_end(&wr_mas);
>    5504	
>    5505		/* Slot store, does not require additional nodes */
>> 5506		if ((node_size == mas->end) && ((!mt_in_rcu(mas->tree))
>    5507			|| (wr_mas.offset_end - mas->offset == 1)))
>    5508			return 0;
>    5509	
>    5510		if (node_size >= mt_slots[wr_mas.type]) {
>    5511			/* Split, worst case for now. */
>    5512			request = 1 + mas_mt_height(mas) * 2;
>    5513			goto ask_now;
>    5514		}
>    5515	
>    5516		/* New root needs a singe node */
>    5517		if (unlikely(mte_is_root(mas->node)))
>    5518			goto ask_now;
>    5519	
>    5520		/* Potential spanning rebalance collapsing a node, use worst-case */
>    5521		if (node_size  - 1 <= mt_min_slots[wr_mas.type])
>    5522			request = mas_mt_height(mas) * 2 - 1;
>    5523	
>    5524		/* node store, slot store needs one node */
>    5525	ask_now:
>    5526		mas_node_count_gfp(mas, request, gfp);
>    5527		mas->mas_flags |= MA_STATE_PREALLOC;
>    5528		if (likely(!mas_is_err(mas)))
>    5529			return 0;
>    5530	
>    5531		mas_set_alloc_req(mas, 0);
>    5532		ret = xa_err(mas->node);
>    5533		mas_reset(mas);
>    5534		mas_destroy(mas);
>    5535		mas_reset(mas);
>    5536		return ret;
>    5537	}
>    5538	EXPORT_SYMBOL_GPL(mas_preallocate);
>    5539	
> 

