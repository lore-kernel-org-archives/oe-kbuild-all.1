Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEDC13AEF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 21:15:42 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365Ktmiu015129;
	Wed, 5 Jul 2023 21:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=5kP3bV06uiMoIQwz9MHWFHPsPGHBVCiPsFUnOyFngxE=;
 b=dLPvNGGxGZzjCadjpueWxdsYZi1yiwf6SRVn1ZIGKBcdqA5Z0NTD7pP/+1+nB/u+1wKd
 5IHrAxjXupRkjcy/opGiub+k75u1Zg7K2yBIANGcD2x+pWNbZQVz5Ig2Eod1wHBwHw04
 goQ8YnyiX26cmQGD7ECUGzZhfj0N3+tRzvaVRvfoqVnMWGWQhIelToKnZov+xYnflBOw
 IC2a14oXD+wf0fepgeQOlhrItih4AsGd0AnV1kGTkKzV2Bqp862CGHDtKcXZI+8EnKJq
 2obHjWRAWwz4jvnYnZvuWiPQiEJySf6eBFMHBqFB2KHJBxSqWaqhg9QiOy+GzX/GVczz AA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rnfkug2cg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 21:15:35 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365Kt9ir033330;
	Wed, 5 Jul 2023 21:15:34 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak6c3as-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 21:15:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipkbUvgb87ld22cd/WBiPXoWUTlYCOd9rZlc1LBFmndk4Q120WdE0Glya6aT2EvhspfN5z3GIWNMDW+TefEkQXNP9QSFn7A1Fc47oE+3FnXLjVH7ota+nExXPdgYhEKOV9QV7S/ONuL9x9k5eadlfmmmx77CdagZg0WkjZUNfWACdxVj0ejpl5gZ0i5RCF+ceyU109E2cLLgCCNGHQXECHWtgzRxWDQO9hQCL6LojskvxgGYBOYdeyhDL3HMBTL3VQHJtFKwBWRMLilh6aGrWvVvEnpe66AQ79tgwod8ylW885rTi+RG1wKal1LgUZltnvu7dYPE5YUmdOJjtviH8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kP3bV06uiMoIQwz9MHWFHPsPGHBVCiPsFUnOyFngxE=;
 b=bpKKw6R83woa2cXRf0OfXkDbpe+W7xLygbmi5QYDbyqEWcVAOa6IVXpGGiAJVP8Jb8gVF20TIIyhYNxCPhHFF+FsJH4lxdzmz/yWslsKABONopjcHRNsWizOr0CqRW/aWRHfIrz1NfQzOsXsNZB78if4/tUm5/E94BVI8GEaNWlq7/9bkbSbSXO+45sLpbXESB9LmvQY3Wh0Bwow1ZksHKqC7Qwa026dSEzdj2LYUyjS9AlpYBOA5GrdQZpm+Qq7IT7OFDsSkJds0NN6b7IhF6qXQStTI/GnP49wJC+9MSjhFPrss+NqJjIkiPMk5mb9pr/6QTPIQZrt3swXzauH5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kP3bV06uiMoIQwz9MHWFHPsPGHBVCiPsFUnOyFngxE=;
 b=0Lsi8UW8/qtwgp2WJw3Czrs8jejfEVXAsyun0YOFVVnyEWJFOyi/DzwcrGxQS+Nky5sm/4jy/0FaIcPGYZ84IaXGxeH/8RtjxGFpR1aNIdwi9csjpALtN6Nc6Hg4YNG518iksSkxSZUPgTZwFU7/tBULJzfMiyoedDda3enEHZ8=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SN7PR10MB7103.namprd10.prod.outlook.com (2603:10b6:806:32b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 5 Jul
 2023 21:15:32 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 21:15:32 +0000
Message-ID: <3b087121-41b1-a072-d58b-fdf0214ffded@oracle.com>
Date: Wed, 5 Jul 2023 16:15:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [akpm-mm:mm-unstable 62/89] include/linux/kexec.h:41:2: error:
 #error KEXEC_SOURCE_MEMORY_LIMIT not defined
Content-Language: en-US
From: Eric DeVolder <eric.devolder@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Baoquan He <bhe@redhat.com>
References: <202307031404.Mjmo2JK6-lkp@intel.com>
 <3e8eecd1-a277-2cfb-690e-5de2eb7b988e@oracle.com>
 <20230703093144.27aa0d991c380f54be34ae93@linux-foundation.org>
 <b5682972-bc67-4b65-33e3-d95182b5e0d0@oracle.com>
 <20230703131726.d505551a7ea964341ece91ba@linux-foundation.org>
 <9bf2aca1-ac14-506e-bf7e-07fe1b071668@oracle.com>
In-Reply-To: <9bf2aca1-ac14-506e-bf7e-07fe1b071668@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0142.namprd11.prod.outlook.com
 (2603:10b6:806:131::27) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SN7PR10MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b3a229-d9fb-459f-fcbd-08db7d9cf75a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kGqwE3rj0qtR8iz19FCD/nnD3HFfKtpJx5x/br97iV2BR2nt8beiVXvFDIFtD1XTqIvWCOjcIkuq3TUsl+Q9CKnOYs97UXSxdcicNeHXDLJvAJnxHqOzqYFjCHpBo6qaGZE7LaSAirUWpZ6VqEe78L6UXfa/X28ghDVzvKaEU7zFJkxnHqnfiXrTcRN1mVKpYz1vXQEJwsEsv3AGn1eQawc+YNxZPfpgcAO6Riu0+lvYEaSVROvJhEIPgdE1EpV2Sv+dMX/LS2ez+SCWKkqFLSmd3C8Oj/v0NpZ0JU4eA7Wcx58jLxd1LsgNZtwkDoKyrDZ5R0LDM1bG3+cm2e3YJBrjK1Z0msKLEc1YC01dm0UGgrlUE6inMR7a6YDlb2dXcSZr6PpNi3QG5hq471QJ9T5E2yp43mulQwPXCCwgAWnZfjUDKpbcYn4rq0ieH3BhmrhhrFA86qBFjK/ss7Uqglg411AGdL5Lr1/bW4otHRQONiNd7Tgl35UMOk/vHMqJa+ONHy75igaHKXRI9d1W0xgcXs3NW+9bb09BbAK4oRHC4EQ5DV6hb4V4pUwSFNN3eyXq89P/peszpM+MXVLz2YqxN0OIlXXXs3usNxbsZ2pRynzhZvU+yd2Rtcn8HCpX0wA5kvBg+/FRfjtCkocliQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199021)(478600001)(6666004)(54906003)(2616005)(83380400001)(6512007)(6486002)(53546011)(6506007)(2906002)(186003)(26005)(8936002)(5660300002)(36756003)(38100700002)(4326008)(66946007)(8676002)(6916009)(41300700001)(66476007)(31696002)(316002)(86362001)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SDc1RkZKMExxM0JicGhMYUw0Y2UzRGsvYTA0R1NYT3VWME1YdVdPSWY4Q05m?=
 =?utf-8?B?ZTNoRmplaTNTNks2YnluMWNSSlBvTE1IeVduSkFtZ2J2d3o0OS9wYUhTVURM?=
 =?utf-8?B?aHdYZTdsSkd3ZkNZOG05OXZ1UHk3cWo0SHdNS2NrOWdvV3RtWHFtWnFPSHlS?=
 =?utf-8?B?SzAxeVZtayticVZIVzZHK1diMll5bzMzYkpCVWcvNEtWN1FOa2dvZ3ZqOGRY?=
 =?utf-8?B?WWJ6U05sdTNQeUdVcTRtL0RZSWRMMWhUek5memt2VjlLdi8zV3lReVhxNHlW?=
 =?utf-8?B?TXVXUUV4K0paZ3BBcjlWMFhQQ3dtN3duMUlmWGdsQStmSStvdGhqdE9KbnFI?=
 =?utf-8?B?QzVKR0MrZ2ZDN3RvK0pQYUtYaTlld2FsQUd0cEh2bGNYWnF5TXBHanBqQ044?=
 =?utf-8?B?Z3FDbXAxcmdaeHZuVUxZenNkdERJVmJ5WEZ3Y0IwUnFOamlsUElpcVVGYmIz?=
 =?utf-8?B?UTU5UmtKeDRlTVlDS1VhVC9KZ1l5d2hNdVkxcGZMNkpkK3N2TEhXakFQaXRQ?=
 =?utf-8?B?K2pOT0hqU2JvR2lWV2o2NlBrdFFrQlJVcVFqUGxoUjNPUDYxMFB1bmhlUWRw?=
 =?utf-8?B?cVZmWFl4VEh2QzRtdDFIVmRDK0RiWWNzL3ZaQkdqYnpFeUhJSHRYQUpzRkpa?=
 =?utf-8?B?T2YremlVSjg4R0tNUTNKaStkbzNlYlZOUkxNTzJiN2lIandBZk5ta1BwRmZ6?=
 =?utf-8?B?TDk4SlRQMkxuRGxpS2VweHFXQzhpb1g2em54WUt3bGtTRnE1clFHTHM4eW5T?=
 =?utf-8?B?UTk0WmVjd0puOUpranpGS3U0bHlHNmZaYStpcit4VnBibnZkaFE5VWw0SVpn?=
 =?utf-8?B?TVMxSmZteExHM3NZRHFzWWZ0ZTIxT1UrNjdYTjE5OVFhc3dGV0xSdExGUUZw?=
 =?utf-8?B?eUgybGtsNk40VS9WNk05VVE2OHNyLzNWWnRaSnBmeXRjYjRBZ1JvUHlpdXlh?=
 =?utf-8?B?RG1qVWpPa1p5TDZPZm5KNnJpenVDVXlUeDgrUHVyaEhWR3E1djJ6c1hUd2xY?=
 =?utf-8?B?V0JHampFL3EzeG9ZNlp2eFEvUWMvRGVoRjJNVm91QWtXUVBDMDJyN1FNRUY5?=
 =?utf-8?B?VDRXWUFQdHF6eGJFYzNXT29KREgvNmR1bjBCcXNxZ1NUY2YxM0Y1NTNFUEtI?=
 =?utf-8?B?aGZ0WkZjcWhQNjI1MWJ3UVRFd2dvbWNNbXFjMDNxQk4rdjNZdFZRM0oyRXRV?=
 =?utf-8?B?aXlMNGVxdEJRM1FQOTQ3Ly94NS9kTmVqNVNGWWtPYjRoL2Y2d1YySUxhelQy?=
 =?utf-8?B?a2dFQ2FGN24wUjl5cHd1TmEwenREMTAySWJtUy9tOGxFSzBqQXBNTHRDOVQ1?=
 =?utf-8?B?UGlSYVkwamVqSjVZUFNUcjlGWDY3R2s4RkpOc0xLQnIvUXdaQWxqUGpLVExL?=
 =?utf-8?B?K2tUU0RsRnY0c01mQitPTkJmRXdoRnZWL05rNkNLbE94TEpnTHBCV3I1eXhs?=
 =?utf-8?B?Rmd4eUJUY0Z3OEFRRko4MXFSTG1NSGpXY0xsaHJ5VElKSjVML1hKQXA5RUVr?=
 =?utf-8?B?ZHpuZHRtNWFsaU82d2tJcmdXNExzUWhSMDBkbWNhUzVzSk9wU2d2NHlXOEJQ?=
 =?utf-8?B?bHFPeGJtcWFKVEJWRWxYNE9WKzNqMEc2K09ETTRjYmcxRlAyU2cwTE9jZGNl?=
 =?utf-8?B?a1NldzFnc3BDUERMK1BRM0hDUUVUMFNmMmJBdW5sRUsvMFRtUmlWMXduYXF4?=
 =?utf-8?B?QksvRm1XYzlCUTBNWkZranZjR29Ock51VjhPemk2Q1RHeUdKNmJPSXZSdDZm?=
 =?utf-8?B?blNUckJHczFJQkorVlUxdlRyVTRycWt4K0ptbC85UG12SDc2VjdyQWpUL3dL?=
 =?utf-8?B?aGF1TXpBSGlXckxmM2pUTEMwUEwvMjlSVjVJSXJxOVhsbzg0MEk0aFA5NW1a?=
 =?utf-8?B?YUx0Y2lFYTVlZEUvWGRtWFR6em9QUG5wQkNVajY3YzlYUFlDZExKZWJuVHBN?=
 =?utf-8?B?enlpMEUzeFlwbjhQZDVvcDhEL1IyZmprbTAyaG9NanFSbTlUNVhBNEdPb1Rz?=
 =?utf-8?B?RGxZNDRabzRLa1ptU2kvekVrSVNWS1RBS3JoUytqR1Z5a1RPVXB2UTcyQ0dK?=
 =?utf-8?B?L2hjZHJ4V09oTVNwR29oc0Jzb2NpM0I3c1lKcmpBdkFZYm52RldxUG9nV3BJ?=
 =?utf-8?B?NlRqUDl0WTgwRWVzNnRjZjh2NVlCWGV0K1NETmFNMERCR21HcW9lZTZNS1ZE?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	6aki/YIKpA8xAh5R5JGlqmTyz6NMJO9GgyZVtYDiZ2vBwT6ij///FFYz8eLyJpEJmqtAyfoKvg9klTryFs4v1Cw56XO9fbYyAfSuxlZQGHfUwZpOYT2da4gw3pyWOi6w0QaelQhOI0HEMo0KtDNjMvKaSLOUk6Fq4i/n34pahlB+BWgzze6AIvOSslAYZjN7YF1wPh1gLBjCe4VTZaoYf6Wd805dhEOVv6DZm8+eDR68SVCLI4/J6Yo9Il+nB1E+mi0klYS8NLZ2gd7fGIo2bvrsKTyFrlKj65satkvWgjRHD6Py0iB1j3KDm+XY8Nb86axZaiDKC7jXIlpdAAl7Du7edC5Gz4n9VbK2P+dQ04FMk0qdvBIdDsvx2LSkw0P7S4RPL1CKHo3/UCmojcBydFWlxzTG5F/yhEAz8jcB6yzCQ/2UvehJfPsbvPGj6kPrxo55XZ9xhhALmz8c5YoPq5+emG8dVjT0RyrpHLGeoztnUL6Sbu66o/3+fqKfyRhYSxrxrYBVtTME+s6fZ7rT4zuHG0DdZ8ilalcV+uMz1Ev/GEsoPrrNxir2Aag0IBSWvZJvK8YMrb0DRYUH9WD+qfPFY62aqjAT3npw2CDJEMFi6fUaT94G5Cf3GAaQh4H//wNMCTQKP+/jlFHPmT7+X5jJCnTVOIaD9M/lPRH6tyxUpQ5ta5BZDzpHo7E1agCkZzsaYYptt4Ezt14shRTCHpFW6IiP6MT3QuGYqweQTuMlP0AKLNC8HBHot2pC7/uOFi/coNC7vm4LRRcCdpLkFMCq6E3vvooWsM3xcwdDzK1TTluR8vm9jqXor2F6qvawVg2FncdK3XovUplzilb/doAebyTV/UagdKg3ETB41NQEy1ABZHM55y4rPQ4/7vGNY3quIIZH4cOHStEleM20rA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b3a229-d9fb-459f-fcbd-08db7d9cf75a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 21:15:32.3356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3QQMctovDC2oXunM8qrIARRar8DXiajTfV1O/f+uqiKqi6NPANEU4TFE45GDI2iAvaJoX+0G7IVz1pk7bZZ1lLUKEiu6bZYo5csX2ougac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7103
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_11,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307050193
X-Proofpoint-ORIG-GUID: JNraa7Kf0KSuHSU1Gn4oF1KWXtVqJtBY
X-Proofpoint-GUID: JNraa7Kf0KSuHSU1Gn4oF1KWXtVqJtBY



On 7/5/23 09:21, Eric DeVolder wrote:
> 
> 
> On 7/3/23 15:17, Andrew Morton wrote:
>> On Mon, 3 Jul 2023 13:34:21 -0500 Eric DeVolder <eric.devolder@oracle.com> wrote:
>>
>>>
>>>
>>> On 7/3/23 11:31, Andrew Morton wrote:
>>>> On Mon, 3 Jul 2023 10:31:34 -0500 Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>>
>>>>> Here are three possible courses of action:
>>>>>     - do nothing; preserve existing behavior as intended by the series (even though problems 
>>>>> like this
>>>>> can occur)
>>>>>     - fix it with CRASH_DUMP selecting KEXEC to eliminate the problem
>>>>
>>>> This one, please.
>>>>
>>>> Or make CRASH_DUMP depend on KEXEC.
>>>>
>>>>>     - do not fix it but document the reason why this problem occurs in the commit message
>>>
>>> ok, great!
>>>
>>> I also have an unrelated fix for riscv, and this correction (for both arm and mips). Is the correct
>>> action to post a new v4 version? Or is there a different method?
>>
>> If the changes are small then I feel that individual fix patches are
>> kinder to people who have already reviewed the previous.
>>
>> But a new version is OK if that's more reliable.
> 
> Andrew, I chose to post a v4 since not all pieces have RB/AB's, in particular the first patch 
> introducing the consolidation.
> 
> Thank you!
> eric

Andrew, just a heads up, but in feedback from arm and s390 folks, I've discovered that relying upon 
olddefconfig alone is insufficient for equivalence. I've enhanced my test setup to include 
allnoconfig and allyesconfig and that has revealed a few more problems. It'll take about 6 hours to 
work through all the configs, and then I'll need to do some cleanup and another verification pass. 
So a v5 is forthcoming. It does seem like this will close a few nuanced holes though...

Thanks,
eric
