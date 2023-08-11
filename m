Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D31172F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 17:16:34 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37BDQvCw004534;
	Fri, 11 Aug 2023 17:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=pfoGP/JIURHIq6gO/7gBZXWAaDTuvj9Yf/0JhFaRYMg=;
 b=iAFUKf/K3YxlBBBjzwscQ15DRxBo2cHMXJXKnpd19i66qFlsZ1F7HGmDOb5HAjqoPV+R
 s5hCwvzwlzjhuggmMNvRlkTAHUFJq8YA6pvncAAcpJqQe/9eH3okHChtLjsIHn5oXcOi
 /Dcue6QWJ4Qb3UwxNjmA8BL/pLhoWb5hhVSDfHorNnMNE8qfiCCuj1TFZOerDEqYbwi5
 h59ZP52aKyxH/1MSu31kG1UH8/vLOA+zilr96/IT2YkissHgQ/oeTU3nOT8YGGmDSKdx
 MR46YH6V1BHq96gHjdduwCf65GfyWpJxLEFNnLFyX6ROS6BJ3tJyPe5sZU+4KtbXSzzY bA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sd8y5hhjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Aug 2023 17:16:17 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 37BGUsLT011049;
	Fri, 11 Aug 2023 17:16:16 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3s9cvh2r25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Aug 2023 17:16:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbqFvS9rktBg6aWbkgQ8DTxEl/XW5dKrJ5DLBZoyiy0xeDcCf+LrquoL5thhjD8dWNn9vQ6yZnyHQWUzAcXuXYiEg7LnQT9Ke7ZuUS6b0jX0JynZ+kUEpLIdM7ILSQUI2tYzTZSIavHndEJ9AHeHeVr9SQpBW0G2I8Hvuo5ZfI9umSfyzT7Tb3XFN6PcTiWma9fOCcDQLbSB+8fihwC2B1m4+DTX8gWEHrgaV8HFjHa9A/dUC4S3LrqfabKgg5nHe4JAy6WZS/ltVd+aLlhGYolntdHVa9P25jLYZXVnlaFvc6weZr+6jGQvAR5ASUoJmi1pyHESFzIEgWjuEqSr0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfoGP/JIURHIq6gO/7gBZXWAaDTuvj9Yf/0JhFaRYMg=;
 b=L3GOk3k4P8JmhQfqlCEhcSSN5/sYut91yXP8EkhLXisax0LBi6P0n5+pCmCkWpuQn7YUHsH2MdOv5hQzx8ZucmjuvtjkdLvJ4sA4jHb41b0rtC/k3iPW57XpqDWXsqs23fPASN5RVqYAW3j6YiecM9cw65FgiRTypsrcgfE2d+GcG/9QHSYNjlv7FBzA6n2UBjeBinfWLJo7COw+1a3NcTL7GbYelpnuzX+ZePVjlgjNpwDEtEcynlOujiVjvD1XS8JLyOA7nV1RjZ0V4Y8Y7fguq/8g9RYRxEDv9NTgKv4oxggmI/bL7Ki6exO57XS7/fPu4xZfSKudI3epXJie4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfoGP/JIURHIq6gO/7gBZXWAaDTuvj9Yf/0JhFaRYMg=;
 b=l4urphO8fNTrWn/b4P/Vc9gNvuJ85O6VefCu3pdbqh/r5FC5638QyG57h8CNkxI17hkILMDH0PT88vCd+cG+6msgvVibK9HxFzspTUS9qK++uhADlY6Di230RJrD7WT3W8zYhy/hg/9R0sjevHqiVMkSDaslAR0IrQuGEIy4SEs=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by IA0PR10MB6867.namprd10.prod.outlook.com (2603:10b6:208:433::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 17:16:13 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::be4f:55e6:89c5:4f57]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::be4f:55e6:89c5:4f57%4]) with mapi id 15.20.6678.020; Fri, 11 Aug 2023
 17:16:13 +0000
Message-ID: <7e886ebc-fd48-8a77-b058-cac22d5ae769@oracle.com>
Date: Fri, 11 Aug 2023 12:16:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [akpm-mm:mm-nonmm-unstable 56/63] kernel/crash_core.c:331:23:
 error: invalid use of undefined type 'struct crash_mem'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Sourabh Jain <sourabhjain@linux.ibm.com>
References: <202308081133.DyoThWwi-lkp@intel.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <202308081133.DyoThWwi-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0080.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::21) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|IA0PR10MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a89288-9aa1-4d05-b52e-08db9a8eaa02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hoX2ZFZGuMLywhVYMd9452gPssjetaT7wMjY+FRBBT/Y8cs3ziadVqGigRN2Q2JYRcmWcN8tF7MKPnCeHMEXk7QF1DFY0yLDLTR5OCsf7/x9ep0vGVPzvf4MMmoi0N41vN+1uXiYehnwtZeJHJL5ooRBrH5YTq4jLdW61bJa6NhUhQJ9Z8X+aHfcuI6Hi6aNtwRcpho0rmWT0ktCk8BeQcX5Vxq1SWABE7gVK426V4R1Iso5PKgYXv1eVoXi8DcqIHRt0+KZ8aw5E835k5QVtVPB95OvuN6gfuyRHQCvkrLSkV5ftZRbPxKHxeTzgQqhOzBHelgWEztBPO62BJWaW/N9RQo7zxJUBl5QPsPXucytvVtBwaDattudRnyaPC54C3jcQ09XVMShp+YXogYTAycqXHYkfLrYkVuh7+wNha5TlzGbEOQDKVV8cE9jy3ZFTV/loVyZp11Vw7fe5Z6nc+8GhopnVbHJ4mhgobL4diOVGIByCr2Zr3PKcygv09C0MEPWW2wbQg0IgjsWxNYQ9w7zuySjN1Kf+De//dM9CvjU9JQXVDezqjZ4Qa0yyW5Xgf1Q+fvKFP+YcNX2taHfxG1QNFm3kzBodygE/lzhooMxEwIKzNJUKDg1SE/0p5pUeA4hocMHXnYbqOS4dy4uhFe1ZRxOpJh3QSl5di8jvRY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(346002)(136003)(39860400002)(186006)(1800799006)(451199021)(4326008)(6512007)(31686004)(54906003)(478600001)(966005)(6916009)(66946007)(66556008)(66476007)(316002)(6486002)(5660300002)(6666004)(41300700001)(8936002)(6506007)(26005)(53546011)(86362001)(31696002)(8676002)(36756003)(2616005)(30864003)(38100700002)(2906002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bGJRQVU4djdPZ3haZytQd0xtbVN6bnpXMGM1WHpueGx2U2NHSlYyMDVTUy9H?=
 =?utf-8?B?Q2F3V2RydUxvVTVqSVNZQUlPVnhmOFQxZEtwRUxSaXdiczh1WSswVWwyM2Fw?=
 =?utf-8?B?YnRrSmZnTmdkWG9qOVJqMmJvQ1RyM1FJcTY4L2hFMVFPdlVwM1YrZWxTZ0lk?=
 =?utf-8?B?bEZsaWlNamxLYkNMOEFDM3R1bWNCSVhPUTZYMi92c1U2bEFOSXYwd0wxR00r?=
 =?utf-8?B?T1hRMEVYam9lQnBhZTJRakxDakY4MGpYZWpLVWFMUzd2Y1lRVTFhSlZGeTRG?=
 =?utf-8?B?cjVXQUpSZmRQWjlDMVdWU21JYjZyOXFTNjhFUVZnM1d2dkQ3aFdRdS9zWjUr?=
 =?utf-8?B?ODJ1dllzQUh0ZGhscFNPVzBINzhzVUNUQ3JrNUx6UWVjMzVKWVR6Nlp0ZWdO?=
 =?utf-8?B?dVZ6SHp5UzVBdk8xM0RrSkVKaDdXQ0lFaGVUaUtCNWliTEh2b28yZDJ2c1Uw?=
 =?utf-8?B?clM0c3F2WThvQWhUNTZEVzRicUZvc2t3cWxmeEZTRjNWZDRwcnJ1RXU4N3la?=
 =?utf-8?B?ZCtxSWFTaWpqOFV1K2d4RU0zM2dpTGZReE8ycEJ0WVVWRGhNMGVOSTNzTjJ1?=
 =?utf-8?B?eDFHUXI1SjBFMis4NCtPV0U1WmpZNDhSbGplTlN4NTNMZkR1T1o2N0lVc1NX?=
 =?utf-8?B?YUpkbDZjREZXQzdZd3lvY0RPR3ZDMGw4dk5talBaS2YvbkwyT1FGVE1jREYz?=
 =?utf-8?B?d3YwbDQva3VKTHQwSGJRUlNGY1BaSXR4MUtXV1ROYXZQaWt6ZTJZeEFKK01l?=
 =?utf-8?B?UnVVVHBrNVlCUTJjRDdqSmE4SjBNVXQxd0NOeUtxZzBmd2ZKSzNjMVRKOCs3?=
 =?utf-8?B?aVBneE5TMm1Iek1oME91RW1uUTJTaUZDbTZob0lzYjVpWWdEbHRLQ2RtV1Zl?=
 =?utf-8?B?TTlLb1ppQ2ZkMzMvaXh4ZWpvUTVKVDhTellDenR5RzkrUVlsaExMdmVyUUw0?=
 =?utf-8?B?SnRMVG1zcFQ1V1pGbDBnd3YxdVdyZWt3TDlnNXN0ZzdzbEo3NHM0bUlFaWxB?=
 =?utf-8?B?Ly9CQnJBV05GYklwYm5XeXh4SkpQUjJqZFNYTTJwOXlPU0w4SDdUMm5WY0I5?=
 =?utf-8?B?WjRscVhIZ2UzcVJQZWwwcDl0b2U3QWkyY2FIWit0cEczQ3U3R0R1UXBwSG45?=
 =?utf-8?B?UjRMUURhckd0ZHdSY0x4TDRTcDFIeGN0ZjdMaUpiM2h3NytuVHE0TmJMNXor?=
 =?utf-8?B?ZWFSNTRacEJLdkY1emF0aVJ3am1lMFVPMVVMbEhFRHN2STRWNVBqeHZTenVE?=
 =?utf-8?B?MVgrOFQxMktxTVQxWU5JMVF4Mis2L3l5ZUlpL2FrbHpwZTBrRG9NOFFhYS9z?=
 =?utf-8?B?STVpcVU2ZFEreVNsaWp6ajVTTjNYU2FLMHljZzBqUEREeVhyWEtGb21iVm9N?=
 =?utf-8?B?QitUZklNVnFFNkgwdVAzYUdNNkl2MzFFdlNRNGhacXdTWDVSVGczTU5XZG94?=
 =?utf-8?B?WnJjM2lqbGJTU0w3YnpRZFlkYkRSNVNXTXdqQ2EvUTJOT3BqQjVDN0ZMK0RG?=
 =?utf-8?B?eUozN3crTTFKaytNN005WlQ3cTlpYWFjZDJRYnQyY05BaXQ0SjAzaDZ4SFNL?=
 =?utf-8?B?K2U5MzVCd0ZHZkNTbGlCd1BxRnAwYUQ4a0JxWEJpM0RjUlBSYXREWThqZE10?=
 =?utf-8?B?emRqWExENWJ2L3dUM052M2JXZVhzODlkaDRCNVEzM3JWenp6eTB4VnNZR3Vt?=
 =?utf-8?B?dlR3RWdxTUdlck1IaHhNdUh6QWd1YzNDSUNjRUM4SkdXb21mWTNoOGVWZVVk?=
 =?utf-8?B?K1lMR3A0MXUxTUI2cXpxamVkWjZIRHAzejdkemVFQjBCcWQ1RjhEcXB5TXlG?=
 =?utf-8?B?TkhtZi9XTFo3N3ltUmp1M3ZFRm1ZaWpob2dObG5UL01XeStnTHBITGIwcXlX?=
 =?utf-8?B?YzhSdDBERG4zRS9ybUwraldCc2R0WGoyaU95bkhnQlpKSlJMa0NIS0FPcFc4?=
 =?utf-8?B?c1VRL3NTNjBtLzBNZHkzUHQxUFBkSG9oSERKMTZNayt3KzNRNkwwYmdBZUcw?=
 =?utf-8?B?algxQ2NQc1l5QmJyNU9sNllMa3FzZXpCdXpWN0NrTUFZSGxLSlVSTFZnTXlW?=
 =?utf-8?B?bTFUZy9lSDZiSmVZbzNGUk9FZkZkZkt0NFg0MTk0TmJFOFl2czE4RERlVitQ?=
 =?utf-8?B?SDN3bGozUzJZcFN2WHZvWEIxNXAxdnZvUTB6dDZXRDVYWVlTSW5RU3BMSmll?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	NPPyJRc55IjlgyPDTOi4ADwiSt3KjaR/gG1Yage4R1aeeWs800jsTNEbm33vsbOfRMGs2MZVKw5SZwvvJ1CBfGPnzgOjFNC/l+mAmnaqhrFCA44cOgrobrOBLUMiM/T3FUVWx2ibI7VbrYvOlmsoKZZ70qE76zTwME5A2Jd019uSlQBexunY0Q4PI9cwLlxBa94wBJVbQh44F17w6Ne1oWzsNvOJ/bgEa2q8wlrkXODiGJuYqVX0QQd/zzb01MsUlAzMij03bu1EE53vf3KatkJc4tiiYXs+8j9UWAHHDB96mldC2DAF78nh9bkgLYkFJzsAxk8amWVi5+p0mySM1zFMp7C0nFWeoIVWseB8e1eHKhTqlMDW7glrb57jxgFbsU8RcLbU9VDvlkPnHHsJAGA5Ag9w7IHal5IYgEV/NCI0fsHmvdvwAPAUpou5VZ9Mk5+9v4f2WlM4md+qW1rMLSgLyHkZYS9hZVQp3jQc/qawoCKezRsAikLG03ZFRDtqibivhydIxz3KwKJkekZdlQ5pbaXBRz8Gd7ADKhU+iQ0/ywQyvKTrbQx2V5AtF+Gj1qw9WRARy+UqMsH+BIU6Tsw+il+S8j/fWdJo+0S97XQlY5aW/x+aJBKKd+AVEzJS39DFhc08qClh/sJdRh9Y7hx/8Y9K5rg1WXR5pvelDxDX4qhFHzWO2kuGwtDbI5X4eAHTbNgro4+Hvt0lC0kpqzWbGo1Im8C6MNSnJzVK6uJVBnS/rJa0Yw6/O86OAhaBlW4/1LvMN33jt0tN412xqWYLuwTdjEAcvi33sTGmx8a5qMNrLQv+Scv6/L0VNMdtbgExJDPs9BNs3CAa4YjQhll12Tqgk4ehwKeC8H3lrDMQ8ZJU/ToIQ2uXyiovMP4knD/vc0GrVcBbo0AfFm/lVg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a89288-9aa1-4d05-b52e-08db9a8eaa02
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 17:16:13.3943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcZKVr2/8hXKQje4rCuMjpx0hhNvlDxFzZiwCg33LIKt/PbVoT8gunFwMD4GsUadO61CDJR1HFAmhB28ZnNfU3WTNZBj2cYY5M7NKe6gQ/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6867
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-11_09,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308110158
X-Proofpoint-ORIG-GUID: vOJOCfGL9H2SgFY2H71Q6z9yOxwKD525
X-Proofpoint-GUID: vOJOCfGL9H2SgFY2H71Q6z9yOxwKD525

The build problem has been reproduced and solved in v27. Specifically the builds that fail are 
because only PROC_KCORE has been set, which only enables CRASH_CORE by itself. I had to move a few 
items to obtain the needed visibility.

"[PATCH v27 0/8] crash: Kernel handling of CPU and memory hot un/plug"
https://lore.kernel.org/lkml/20230811170642.6696-1-eric.devolder@oracle.com/

In addition, I've spot tested/built a few other architectures and do not encounter build errors.

Thanks!
eric

On 8/7/23 22:45, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
> head:   6a41fd4665e650c659412a54f90cf364c592039a
> commit: 626775922a575bc420a5f1b5caf30f9898fe9cf6 [56/63] crash: move a few code bits to setup support of crash hotplug
> config: arc-randconfig-r026-20230807 (https://download.01.org/0day-ci/archive/20230808/202308081133.DyoThWwi-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230808/202308081133.DyoThWwi-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308081133.DyoThWwi-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>>> kernel/crash_core.c:318:40: warning: 'struct crash_mem' declared inside parameter list will not be visible outside of this definition or declaration
>       318 | int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>           |                                        ^~~~~~~~~
>>> kernel/crash_core.c:318:5: warning: no previous prototype for 'crash_prepare_elf64_headers' [-Wmissing-prototypes]
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
>>> kernel/crash_core.c:417:5: warning: no previous prototype for 'crash_exclude_mem_range' [-Wmissing-prototypes]
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
>     kernel/crash_core.c:490:49: error: invalid use of undefined type 'struct crash_mem'
>       490 |                         mem->ranges[i + 1] = mem->ranges[i];
>           |                                                 ^~
>     kernel/crash_core.c:493:12: error: invalid use of undefined type 'struct crash_mem'
>       493 |         mem->ranges[j].start = temp_range.start;
>           |            ^~
>     kernel/crash_core.c:494:12: error: invalid use of undefined type 'struct crash_mem'
>       494 |         mem->ranges[j].end = temp_range.end;
>           |            ^~
>     kernel/crash_core.c:495:12: error: invalid use of undefined type 'struct crash_mem'
>       495 |         mem->nr_ranges++;
>           |            ^~
> 
> 
> vim +331 kernel/crash_core.c
> 
>     317	
>   > 318	int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
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
>   > 395			mend = mem->ranges[i].end;
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
>   > 417	int crash_exclude_mem_range(struct crash_mem *mem,
>     418				    unsigned long long mstart, unsigned long long mend)
>     419	{
>     420		int i, j;
>     421		unsigned long long start, end, p_start, p_end;
>     422		struct range temp_range = {0, 0};
>     423	
>     424		for (i = 0; i < mem->nr_ranges; i++) {
>     425			start = mem->ranges[i].start;
>     426			end = mem->ranges[i].end;
>     427			p_start = mstart;
>     428			p_end = mend;
>     429	
>     430			if (mstart > end || mend < start)
>     431				continue;
>     432	
>     433			/* Truncate any area outside of range */
>     434			if (mstart < start)
>     435				p_start = start;
>     436			if (mend > end)
>     437				p_end = end;
>     438	
>     439			/* Found completely overlapping range */
>     440			if (p_start == start && p_end == end) {
>     441				mem->ranges[i].start = 0;
>     442				mem->ranges[i].end = 0;
>     443				if (i < mem->nr_ranges - 1) {
>     444					/* Shift rest of the ranges to left */
>     445					for (j = i; j < mem->nr_ranges - 1; j++) {
>     446						mem->ranges[j].start =
>     447							mem->ranges[j+1].start;
>     448						mem->ranges[j].end =
>     449								mem->ranges[j+1].end;
>     450					}
>     451	
>     452					/*
>     453					 * Continue to check if there are another overlapping ranges
>     454					 * from the current position because of shifting the above
>     455					 * mem ranges.
>     456					 */
>     457					i--;
>     458					mem->nr_ranges--;
>     459					continue;
>     460				}
>     461				mem->nr_ranges--;
>     462				return 0;
>     463			}
>     464	
>     465			if (p_start > start && p_end < end) {
>     466				/* Split original range */
>     467				mem->ranges[i].end = p_start - 1;
>     468				temp_range.start = p_end + 1;
>     469				temp_range.end = end;
>     470			} else if (p_start != start)
>     471				mem->ranges[i].end = p_start - 1;
>     472			else
>     473				mem->ranges[i].start = p_end + 1;
>     474			break;
>     475		}
>     476	
>     477		/* If a split happened, add the split to array */
>     478		if (!temp_range.end)
>     479			return 0;
>     480	
>     481		/* Split happened */
>     482		if (i == mem->max_nr_ranges - 1)
>     483			return -ENOMEM;
>     484	
>     485		/* Location where new range should go */
>     486		j = i + 1;
>     487		if (j < mem->nr_ranges) {
>     488			/* Move over all ranges one slot towards the end */
>     489			for (i = mem->nr_ranges - 1; i >= j; i--)
>     490				mem->ranges[i + 1] = mem->ranges[i];
>     491		}
>     492	
>     493		mem->ranges[j].start = temp_range.start;
>     494		mem->ranges[j].end = temp_range.end;
>     495		mem->nr_ranges++;
>     496		return 0;
>     497	}
>     498	
> 
