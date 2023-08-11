Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2034F1172F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 17:17:44 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37BDWfp0003729;
	Fri, 11 Aug 2023 17:17:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=Zdtl8Br5dMVQvK52LBth4w7DLz6qUxA7ZCHg1Ava20s=;
 b=qk8ucHDo9s2b/StmbgWZvbtvazYDTM3+E734YMxwjNsq0F/bKtSIftmp7xkUN1zhVIqT
 sBXzwSWy4831IxirmZil/Ki6wZXkfZ/Mc0IvLAawcGxzbZnUOCIskjGLL7L15WXAkCmP
 cpfGkOek0Zc/s024CZPrC8ArK9EL5al/gu6OS2mRAry/9CSoMzEngBOxVfBYwU4ba8L6
 upRpKAeluz8bi3vGLm/36+xgI4KjKag1nRnTdfbDJ3tcR874PtTFLA2/aJjOw9hd7Yrh
 +1vsVLTCMOyWcqufOL1ftkY4AkYhUviM6p9bDG3fLLl8gdbBhIlSWYKuie0Vtwh0QFuT Fg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sd8y5hgmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Aug 2023 17:17:00 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 37BGNjVf033461;
	Fri, 11 Aug 2023 17:16:59 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3s9cvam82w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Aug 2023 17:16:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iq76dtKVZGSRs2yiRxSYpmZ+Ka5nma4b40vBDTKYGLFrqIxufpmTBba2LrzUz8bG5Ce3M9FSU16vfUGE8qxgFFY2TLbaUY4z92Dvsm3ml2hfeCVgMOac3SPrYvLKGrH+zDMNUfQIvAPqtMNCRyoBu62qw80mlq7zJYG9J2J8Nq0u8CG1GsjYY5nZqWnNl4XfJtbVAidgJPjS1rxEI6taFkgeiXSSibtImhZfRT7jtoAWM8hA5dVf3GQHwvXu8z0TdgyE9U19nRPmEqES/T8HgW4sBmC5ntD8ymPFelx5maMEPwXzmeez54+1BZ8siDHjdwit96OihhrtUfb4/Bhp2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zdtl8Br5dMVQvK52LBth4w7DLz6qUxA7ZCHg1Ava20s=;
 b=lcL4aYpJU0TxSC4LWDnwxqgOLmFodEOHZ7XaT3ZE5C0OX+QNpoJGZ2Bw9RhU2pFXooO7geYXEPlujzYyCWEE30a04FIG3Crfau0wPKAv8pr0r9GueQ7Rl1eu8ELwBag6O3W7WSCgd4jSrBAjZo2h8d1uhbZiwzcL33NGbijIbXFPPy9o0HHDd/vf8z2oserAm6lpx8JoQXKJxvZJoeNu9FkGbAPcR4dJlHoHd3DgtxGI6I98PSKMl0iMwKYE4IiZyiKJ0kZMjVGbquPpryfP/R60s6PT1k+Kh8Yu3ct+/wyAjk4vxhrBcNCQRNyZIidf3Ez4/pxo+m0SQk4sgu9RrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zdtl8Br5dMVQvK52LBth4w7DLz6qUxA7ZCHg1Ava20s=;
 b=T8n9bQEoMdY6nVil9WBAoM40OK1hakqCpUbvO4cLkqD2EaZBnDbsFqau6YAVeT7J6yghLE7Eyz/PTn7/UPFgLjdkmrCiD7dwGwJzvG64HpAiYsDvJIatS7m9oE8vxt88cJ/sMAD0XzDRzieLoBuxivE42geqQhMGUAMG3lbmhhc=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by IA0PR10MB6867.namprd10.prod.outlook.com (2603:10b6:208:433::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 17:16:57 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::be4f:55e6:89c5:4f57]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::be4f:55e6:89c5:4f57%4]) with mapi id 15.20.6678.020; Fri, 11 Aug 2023
 17:16:57 +0000
Message-ID: <23b7b3d0-9616-7027-73cf-7115e1104bcd@oracle.com>
Date: Fri, 11 Aug 2023 12:16:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [akpm-mm:mm-nonmm-unstable 56/78] kernel/crash_core.c:331:23:
 error: invalid use of undefined type 'struct crash_mem'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Sourabh Jain <sourabhjain@linux.ibm.com>
References: <202308111729.ApUbiGtj-lkp@intel.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <202308111729.ApUbiGtj-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0101.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::42) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|IA0PR10MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 61363f41-2582-40ea-55d6-08db9a8ec3fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gKgnlXm7Yrgnn10zrPO/c1TYcRMAYFm1v3Dj9BFzInnpXaHocwzTfcTqpDBanc2E49AZEn+hFqNJ1KV6h1arYLAVaIbq7pqp4jqSfYd4wnfvfWC0xpXw9Ptr3X7cG49Auv1HVkRht+0RHraITfDn/d0rA9WAWQrx+jAPbWkLYFlkUSHLf/G4oIgW1/CNNJntDieuz/IUY+GhmD3uaRRbn4G/UbSryIkg7ZxaAF7uLOwkFDFFblo9A/P8pcgoNd7zqKSKw7Hu/BdjXl7XAm6evN5DNRvo3sphnCytbQHH7jmRHhUcLUjOs21QiId+vAsoJuyABh5lR7bbCR5XiHyEmEOF1XsSAXZoMV504heKfnMwRZtj8QOahONI+3Y8+rLv1Nevd1g2uC9Q52rsMD2DJZbgJx7RT1gsxUuPgDZ9wbyNtMpCxCHT661Vjflind0PTuAEjftL7+clpKfDxkTMNtqapMbqIyAamRlodDfRljXLEmJPFsVw+eohEr6V1sh4zsmBDwDWd5CASJQMmMmFI3Tt3puEHifqy6ZOp7tanuh3z4Hit0maNIcaCye6jalnNtpkOicnmNkSSvlkHEW0sKqzXc5VcfbIM0BPwXCpmbT3rFrTO7E76S05j/ufE8nZXxntlaYJ6zUsu77YXZSgvPmFo8H0FTeaNnzIBILGFos=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(346002)(136003)(39860400002)(186006)(1800799006)(451199021)(4326008)(6512007)(31686004)(54906003)(478600001)(966005)(6916009)(66946007)(66556008)(66476007)(316002)(6486002)(5660300002)(6666004)(41300700001)(8936002)(6506007)(26005)(53546011)(86362001)(31696002)(8676002)(36756003)(2616005)(30864003)(38100700002)(2906002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bWllUEpJRTVaWFNtL1d1ZHJBaENFTnZ4bzRQZXhmYnJPZ3U4WTlHUlZEVGFh?=
 =?utf-8?B?bWJDdnIyK0prYUIvTzNlUlFzRDRPV2c4QnMzRTZObExSNGhyUjJDTVFadzdk?=
 =?utf-8?B?RnROaFhwcUNBeEIzQmorWjJId1dFZ2VmYUZld0RwUXI3emlVOFpDb1A5V3do?=
 =?utf-8?B?SURGV0lkRG85R08rZHBra3A2SDBVUXY4TkR3cS8vUjNqUEVQWnpFenFPaXZr?=
 =?utf-8?B?SGtUbjFvczI5TjVoQmFaZldYWnNId1daMktMMVdvLzZjbnBvanNSRmcxZHZh?=
 =?utf-8?B?ZEtwU21uVVoyTkh2SENnaFJqQWgvTHlKSk9mWHdXUlJGWk01djA0RnY3K1A2?=
 =?utf-8?B?NndTckNNbXJPYmdYUHFlbzE5WTZDUlA3cFpmdkl4a1FMUmtSRWk3LzErdUQw?=
 =?utf-8?B?cVVGVWlVd2RHQ210aytoaUs5eU9ncjhiWkZlaTlYa2lFdmRMYnhUMGM2LzE4?=
 =?utf-8?B?TElMVmY4dEkrb0VrY1ZDRHlSZG9lckNyVTlKcDBrWXF5czFpdFZlcHRicEVJ?=
 =?utf-8?B?STBQSVpDR1R5UHNpaExPb2dFV1ZjamNSZ2syNVZESFhaRlE0bGdkU20rNTNL?=
 =?utf-8?B?dkFGZUtEei9Vc1RIK2lWanZ0MTc5elBaTmFRd1FPK3pIZHZYVnZKZkc3MUpC?=
 =?utf-8?B?MDVPSFRCZ0NrUmpkU0VoRkRXTUt1SExiZ3dsV0t6cXRaVkh3R1ZaOWI0czFk?=
 =?utf-8?B?YXkvVDlLMVA0QUJqTXFlRHpVUXc1M0JJbjdrSzU3b0FKUmRvc0tlczE1WjFW?=
 =?utf-8?B?b1lVSnJlTm9HZExuU0VlVXJqMEYvL3ZSNGE4TjAzLzdkTEZKa1VPVU9rbWJT?=
 =?utf-8?B?ZFFoVnRzaDZXL3VBU2NaYTNNdlRYNkNDOFEzaDM0MzJWaFhOMHp3K1RnTE45?=
 =?utf-8?B?WXpaT2tlVUFaRkdLK1VrcXpyMkp6d3l2bXdNQmlJaWRyTmFmemNuM0dZR3BK?=
 =?utf-8?B?eWNQL2Y1K3M0OHd4K0haWUwwQTdHbnREeldvSEh4YUEzU3RHTTVwVDZnbmRU?=
 =?utf-8?B?bHRuMStxdDFHbGhEZjRWcmp2SlNPVFZSaHdBSndRUGt4QVRudmRHU0JPTDBx?=
 =?utf-8?B?cVBFTE5QTWVuelVDUDltQTN6TzJQMy9uQnY3MnJSVi9CbFROelVKdkJJLzM0?=
 =?utf-8?B?Q3JveDNCcUVmNkFvbEprQmZOakJMM0RhYmJXeEhJeGp6YU9zZVBSTENQT3lR?=
 =?utf-8?B?SXZUSlc2Q0hpTzJPaEUwY3BsbGRDZWNwMlhVQlEwVGU3SGJodUd4eWdrQ25H?=
 =?utf-8?B?bXhHZE9NbHVmNWFFYm9HTHFmZlNQZFZDc2hGL3YvZ2diREZ5ZjdDdTZpSit1?=
 =?utf-8?B?aVFNanI1MVVqcEIzSU4zYnRwNHNaeEZSTTBhNk1JaVE5cmdNRG1FcGlNOGhz?=
 =?utf-8?B?ci9WdENWbFFpNzc4SHJkN01WclUwZnN4bEVjcm5lelE0MitpUXVPUjl2bHhn?=
 =?utf-8?B?SERFSXgwWEtsNkxyNzN3MzlKTDRsNGxCeSswK2hlc1VXWGVkYkJkZUloMUUw?=
 =?utf-8?B?OVREbVNFd1Zkb2syZTlxWTkwL214dHVMTnFYREgrKzZ0RHZSclZZS3owZFZN?=
 =?utf-8?B?MEI0eEVwVWFBTG1LTnRiUVBDajhSQlRRZHJ5eEdtNHp2cTBVZUZDaEhYajRH?=
 =?utf-8?B?QnZGQmgyZFllYWVnSDlHd2hMT2hkd1k4MTlZcFFYeUxhM1BndlVxeXRteXpQ?=
 =?utf-8?B?VmsvVXo4MzhmZW9ndURZc2JDV2RCbmdVMS9uQkMwUU1KSVFrZ2t6M2NPVW9n?=
 =?utf-8?B?NGowT0U4SUQ5M3ovRzlZQ0hJMjlEWEVCV1hwUzZEODRRelo5bmE0bnJpUXJM?=
 =?utf-8?B?Z2wyY2prU2UxNkl0OWM3MURaS0cwZ3c3T2dhVVBlbUUxYlRCcFpTVzM5R09p?=
 =?utf-8?B?ZFBUOHB4ZkFTWVJMN00zSnZkT3V2T1Vya2Vkam5HY2kvWFo2b2pGVEdiRGht?=
 =?utf-8?B?dmh2eUVSMHJLcS9kc3dBNzR2UVVoaXIyZlhMOEZDWUM1Q3lieDFZSlZnS2dO?=
 =?utf-8?B?UlNUTk9hbVo3cE1QNDNEcW0yeHZzV09JTWVKZEloQUZWYWgzamlFYVl4YTFF?=
 =?utf-8?B?QysrTE0va092SW9EdXEwZXRndG5tZUljRmd3WEtNbUVqdnNxSVNIbGJrY2xj?=
 =?utf-8?B?WTBzZk8yMlZla2EwNDJiOHMrN0NBczJRWXRUSDl1RzdReVdoM3l2ZHNlV1hH?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	LXCbfFqqHwL0tqsdk/PUIzdh+01VtMV3Xf93y1egLPktQUgbDFGA9H+x/yyxQe+JIPsp1PqsDp0E6cXjULICI0cGQx9bgsB5S1oO2LelFEIYvKIS0SwX3OkwZsp52qwYKsjfYPXuOQ4XOcizs6shYMwqtzE3szQgD1UALCGX+l/g8KrJK1PNqHecVz9KNtTiODYnBW6OoA9pRYy9m5p1dfoxdbZINHd/hSC7fulQURzvcLjqb9V4bfPbI2S8nVpE9VZ3maNFW8Q2hPQ2Rv/4nzxI+tYHb5fQu9O2XfnOgDsbn2oe/OiuWftwsD2r3i7I4kWt/C70RFfnY4KghG2CvnG04Kn9POdGPDT6x316sGasMxToILuSWgt8KQkLHbuw3Wn2XLWw+oFKCdOeFh/G35Xvpp5kclythSj48kqoBMkYFOjT/FJfE/ZZx1Sz5Q2tQy/L1W5kQ0H1+/I20arhvo1XIu+jzznvLT1ji6gq8eoq4Mt4z7083ciCG0ow2fyGbNC2U3kI/d1MtaUP+G4DCvE0wyhy16pvv+Goxau3IdyIp0j2WPW3YB/Lg+aRTPfACuwwucMGdyZ1I39oopoHSqmwv5BWj3BxrQ6KWsygLEkNmgCcxUJYjnJXNisYl0RsKGRPWM7F/mcoTMQ+2du/thtxvdIJD5IEE6pWuQx0VhB/mCPVCCPpFwuWWtMLfT2f0U+2mnVvTabK2PU921qomkWz4QlUjkMO1mSdM4n968loScCpfLzKkLM52ZMPJfJaXMVUo71JwCDjd/da4enjZQcCbgFNk3g5mf8krksh+c2NGde3S5luBOdZapN80m4I5TKYeOfO7jFcAwhjDwZztkplgC3HxZvCEzFaKGsK+LdKCUAv2dxT0KXAxV/oTEMw+SGfD/EkxxvkFhT+XUQMzw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61363f41-2582-40ea-55d6-08db9a8ec3fd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 17:16:57.0496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0U2Le/DXvZkiPNMxU96evlUwBtUgY4kmITc6IePwK1cl2O4i70rYeyf2lHRk0+PFPsEr5AjEEROvVUWka/tniAthCIygQbK8aRCW2mhR38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6867
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-11_09,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308110158
X-Proofpoint-GUID: V40d4R_tU-TyVJr3aWwzdZ9py2I2JAeN
X-Proofpoint-ORIG-GUID: V40d4R_tU-TyVJr3aWwzdZ9py2I2JAeN

The build problem has been reproduced and solved in v27. Specifically the builds that fail are 
because only PROC_KCORE has been set, which only enables CRASH_CORE by itself. I had to move a few 
items to obtain the needed visibility.

"[PATCH v27 0/8] crash: Kernel handling of CPU and memory hot un/plug"
https://lore.kernel.org/lkml/20230811170642.6696-1-eric.devolder@oracle.com/

In addition, I've spot tested/built a few other architectures and do not encounter build errors.

Thanks!
eric

On 8/11/23 04:10, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   0f6b2c125ce19074c1086a70119b02dd30b089a4
> commit: 3f1eba00ee9d93b66f1859d40537befe44ceb1cd [56/78] crash: move a few code bits to setup support of crash hotplug
> config: i386-randconfig-r015-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111729.ApUbiGtj-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111729.ApUbiGtj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308111729.ApUbiGtj-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     kernel/crash_core.c:318:40: warning: 'struct crash_mem' declared inside parameter list will not be visible outside of this definition or declaration
>       318 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>           |                                        ^~~~~~~~~
>     kernel/crash_core.c:318:5: warning: no previous prototype for 'crash_prepare_elf64_headers' [-Wmissing-prototypes]
>       318 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>           |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>     kernel/crash_core.c: In function 'crash_prepare_elf64_headers':
>>> kernel/crash_core.c:331:23: error: invalid use of undefined type 'struct crash_mem'
>       331 |         nr_phdr += mem->nr_ranges;
>           |                       ^~
>     In file included from include/vdso/const.h:5,
>                      from include/linux/const.h:4,
>                      from include/linux/align.h:5,
>                      from include/linux/kernel.h:15,
>                      from include/linux/cpumask.h:10,
>                      from include/linux/mm_types_task.h:14,
>                      from include/linux/mm_types.h:5,
>                      from include/linux/buildid.h:5,
>                      from kernel/crash_core.c:7:
>>> kernel/crash_core.c:343:32: error: 'ELF_CORE_HEADER_ALIGN' undeclared (first use in this function)
>       343 |         elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
>           |                                ^~~~~~~~~~~~~~~~~~~~~
>     include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
>        32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
>           |                                                  ^~~~
>     include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
>         8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
>           |                                 ^~~~~~~~~~~~~~
>     kernel/crash_core.c:343:18: note: in expansion of macro 'ALIGN'
>       343 |         elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
>           |                  ^~~~~
>     kernel/crash_core.c:343:32: note: each undeclared identifier is reported only once for each function it appears in
>       343 |         elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
>           |                                ^~~~~~~~~~~~~~~~~~~~~
>     include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
>        32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
>           |                                                  ^~~~
>     include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
>         8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
>           |                                 ^~~~~~~~~~~~~~
>     kernel/crash_core.c:343:18: note: in expansion of macro 'ALIGN'
>       343 |         elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
>           |                  ^~~~~
>     kernel/crash_core.c:393:28: error: invalid use of undefined type 'struct crash_mem'
>       393 |         for (i = 0; i < mem->nr_ranges; i++) {
>           |                            ^~
>     kernel/crash_core.c:394:29: error: invalid use of undefined type 'struct crash_mem'
>       394 |                 mstart = mem->ranges[i].start;
>           |                             ^~
>     kernel/crash_core.c:395:27: error: invalid use of undefined type 'struct crash_mem'
>       395 |                 mend = mem->ranges[i].end;
>           |                           ^~
>     kernel/crash_core.c: At top level:
>     kernel/crash_core.c:417:36: warning: 'struct crash_mem' declared inside parameter list will not be visible outside of this definition or declaration
>       417 | int crash_exclude_mem_range(struct crash_mem *mem,
>           |                                    ^~~~~~~~~
>     kernel/crash_core.c:417:5: warning: no previous prototype for 'crash_exclude_mem_range' [-Wmissing-prototypes]
>       417 | int crash_exclude_mem_range(struct crash_mem *mem,
>           |     ^~~~~~~~~~~~~~~~~~~~~~~
>     kernel/crash_core.c: In function 'crash_exclude_mem_range':
>     kernel/crash_core.c:424:28: error: invalid use of undefined type 'struct crash_mem'
>       424 |         for (i = 0; i < mem->nr_ranges; i++) {
>           |                            ^~
>     kernel/crash_core.c:425:28: error: invalid use of undefined type 'struct crash_mem'
>       425 |                 start = mem->ranges[i].start;
>           |                            ^~
>     kernel/crash_core.c:426:26: error: invalid use of undefined type 'struct crash_mem'
>       426 |                 end = mem->ranges[i].end;
>           |                          ^~
>     kernel/crash_core.c:441:28: error: invalid use of undefined type 'struct crash_mem'
>       441 |                         mem->ranges[i].start = 0;
>           |                            ^~
>     kernel/crash_core.c:442:28: error: invalid use of undefined type 'struct crash_mem'
>       442 |                         mem->ranges[i].end = 0;
>           |                            ^~
>     kernel/crash_core.c:443:36: error: invalid use of undefined type 'struct crash_mem'
>       443 |                         if (i < mem->nr_ranges - 1) {
>           |                                    ^~
>     kernel/crash_core.c:445:52: error: invalid use of undefined type 'struct crash_mem'
>       445 |                                 for (j = i; j < mem->nr_ranges - 1; j++) {
>           |                                                    ^~
>     kernel/crash_core.c:446:44: error: invalid use of undefined type 'struct crash_mem'
>       446 |                                         mem->ranges[j].start =
>           |                                            ^~
>     kernel/crash_core.c:447:52: error: invalid use of undefined type 'struct crash_mem'
>       447 |                                                 mem->ranges[j+1].start;
>           |                                                    ^~
>     kernel/crash_core.c:448:44: error: invalid use of undefined type 'struct crash_mem'
>       448 |                                         mem->ranges[j].end =
>           |                                            ^~
>     kernel/crash_core.c:449:60: error: invalid use of undefined type 'struct crash_mem'
>       449 |                                                         mem->ranges[j+1].end;
>           |                                                            ^~
>     kernel/crash_core.c:458:36: error: invalid use of undefined type 'struct crash_mem'
>       458 |                                 mem->nr_ranges--;
>           |                                    ^~
>     kernel/crash_core.c:461:28: error: invalid use of undefined type 'struct crash_mem'
>       461 |                         mem->nr_ranges--;
>           |                            ^~
>     kernel/crash_core.c:467:28: error: invalid use of undefined type 'struct crash_mem'
>       467 |                         mem->ranges[i].end = p_start - 1;
>           |                            ^~
>     kernel/crash_core.c:471:28: error: invalid use of undefined type 'struct crash_mem'
>       471 |                         mem->ranges[i].end = p_start - 1;
>           |                            ^~
>     kernel/crash_core.c:473:28: error: invalid use of undefined type 'struct crash_mem'
>       473 |                         mem->ranges[i].start = p_end + 1;
>           |                            ^~
>     kernel/crash_core.c:482:21: error: invalid use of undefined type 'struct crash_mem'
>       482 |         if (i == mem->max_nr_ranges - 1)
>           |                     ^~
>     kernel/crash_core.c:487:20: error: invalid use of undefined type 'struct crash_mem'
>       487 |         if (j < mem->nr_ranges) {
>           |                    ^~
>     kernel/crash_core.c:489:29: error: invalid use of undefined type 'struct crash_mem'
>       489 |                 for (i = mem->nr_ranges - 1; i >= j; i--)
>           |                             ^~
>     kernel/crash_core.c:490:28: error: invalid use of undefined type 'struct crash_mem'
>       490 |                         mem->ranges[i + 1] = mem->ranges[i];
>           |                            ^~
> 
> 
> vim +331 kernel/crash_core.c
> 
>     317	
>     318	int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>     319				  void **addr, unsigned long *sz)
>     320	{
>     321		Elf64_Ehdr *ehdr;
>     322		Elf64_Phdr *phdr;
>     323		unsigned long nr_cpus = num_possible_cpus(), nr_phdr, elf_sz;
>     324		unsigned char *buf;
>     325		unsigned int cpu, i;
>     326		unsigned long long notes_addr;
>     327		unsigned long mstart, mend;
>     328	
>     329		/* extra phdr for vmcoreinfo ELF note */
>     330		nr_phdr = nr_cpus + 1;
>   > 331		nr_phdr += mem->nr_ranges;
>     332	
>     333		/*
>     334		 * kexec-tools creates an extra PT_LOAD phdr for kernel text mapping
>     335		 * area (for example, ffffffff80000000 - ffffffffa0000000 on x86_64).
>     336		 * I think this is required by tools like gdb. So same physical
>     337		 * memory will be mapped in two ELF headers. One will contain kernel
>     338		 * text virtual addresses and other will have __va(physical) addresses.
>     339		 */
>     340	
>     341		nr_phdr++;
>     342		elf_sz = sizeof(Elf64_Ehdr) + nr_phdr * sizeof(Elf64_Phdr);
>   > 343		elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
>     344	
>     345		buf = vzalloc(elf_sz);
>     346		if (!buf)
>     347			return -ENOMEM;
>     348	
>     349		ehdr = (Elf64_Ehdr *)buf;
>     350		phdr = (Elf64_Phdr *)(ehdr + 1);
>     351		memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
>     352		ehdr->e_ident[EI_CLASS] = ELFCLASS64;
>     353		ehdr->e_ident[EI_DATA] = ELFDATA2LSB;
>     354		ehdr->e_ident[EI_VERSION] = EV_CURRENT;
>     355		ehdr->e_ident[EI_OSABI] = ELF_OSABI;
>     356		memset(ehdr->e_ident + EI_PAD, 0, EI_NIDENT - EI_PAD);
>     357		ehdr->e_type = ET_CORE;
>     358		ehdr->e_machine = ELF_ARCH;
>     359		ehdr->e_version = EV_CURRENT;
>     360		ehdr->e_phoff = sizeof(Elf64_Ehdr);
>     361		ehdr->e_ehsize = sizeof(Elf64_Ehdr);
>     362		ehdr->e_phentsize = sizeof(Elf64_Phdr);
>     363	
>     364		/* Prepare one phdr of type PT_NOTE for each present CPU */
>     365		for_each_present_cpu(cpu) {
>     366			phdr->p_type = PT_NOTE;
>     367			notes_addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, cpu));
>     368			phdr->p_offset = phdr->p_paddr = notes_addr;
>     369			phdr->p_filesz = phdr->p_memsz = sizeof(note_buf_t);
>     370			(ehdr->e_phnum)++;
>     371			phdr++;
>     372		}
>     373	
>     374		/* Prepare one PT_NOTE header for vmcoreinfo */
>     375		phdr->p_type = PT_NOTE;
>     376		phdr->p_offset = phdr->p_paddr = paddr_vmcoreinfo_note();
>     377		phdr->p_filesz = phdr->p_memsz = VMCOREINFO_NOTE_SIZE;
>     378		(ehdr->e_phnum)++;
>     379		phdr++;
>     380	
>     381		/* Prepare PT_LOAD type program header for kernel text region */
>     382		if (need_kernel_map) {
>     383			phdr->p_type = PT_LOAD;
>     384			phdr->p_flags = PF_R|PF_W|PF_X;
>     385			phdr->p_vaddr = (unsigned long) _text;
>     386			phdr->p_filesz = phdr->p_memsz = _end - _text;
>     387			phdr->p_offset = phdr->p_paddr = __pa_symbol(_text);
>     388			ehdr->e_phnum++;
>     389			phdr++;
>     390		}
>     391	
>     392		/* Go through all the ranges in mem->ranges[] and prepare phdr */
>     393		for (i = 0; i < mem->nr_ranges; i++) {
>     394			mstart = mem->ranges[i].start;
>     395			mend = mem->ranges[i].end;
>     396	
>     397			phdr->p_type = PT_LOAD;
>     398			phdr->p_flags = PF_R|PF_W|PF_X;
>     399			phdr->p_offset  = mstart;
>     400	
>     401			phdr->p_paddr = mstart;
>     402			phdr->p_vaddr = (unsigned long) __va(mstart);
>     403			phdr->p_filesz = phdr->p_memsz = mend - mstart + 1;
>     404			phdr->p_align = 0;
>     405			ehdr->e_phnum++;
>     406			pr_debug("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
>     407				phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
>     408				ehdr->e_phnum, phdr->p_offset);
>     409			phdr++;
>     410		}
>     411	
>     412		*addr = buf;
>     413		*sz = elf_sz;
>     414		return 0;
>     415	}
>     416	
> 
