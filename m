Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7002112
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 14:22:01 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EJp4r025499;
	Wed, 5 Jul 2023 14:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=SXFleUEHt8EncWKNI0LE6S28KXR3TZ/EeMoXs7mDicI=;
 b=TR8BBqTC+XZwJkXdRid7Ftet25379tkLRIx4QJ6lPWScT4AGl83xI93envCNjJn4EDq4
 NNAAXIR/4TEVfQyoDWiP8AJHwfPergyUZCpTKMZc8L42DeTugZJgZ20bzWFAjDpPw5ZB
 u9T1uxGPavYg+4KHgriTBwkl32Ltr4tx6+DFfK7SQzJ3WuIaq+84SlLyW9uOeb5zSfXo
 885Pz4UCxqf39gJyKB7nU3mWBhiOjF4WtLvUv488sZAL3ke7X6dtj+JpPbR3+DlYdU+B
 S+zJ8rzYnhl2Td+sg7OaXLACUNvZ/dgMiYUrm9R+M3blI3suU1MUt4jS5/lnOnG7JFDK +w== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rna6a804k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:21:53 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 365DMsPK007211;
	Wed, 5 Jul 2023 14:21:52 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjakbnxup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 05 Jul 2023 14:21:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3DS2F8qoU1ESrgD0zDJvYNL4s19wNEiZQPu3ZWf/HKxpBDGN/AW1goJuVPvc7+3LT7BAvkXnUKc78gR3hsBVN3XUZSL1e5268yAV7cNnZnzX0pIVBhOmTLWFChHEgwKrarrO/cGNLKLDd2xAv6OxxiaBT4XUKgiUhvSZkSpBZjhxpKe1vGIwxGu6M/4DGudKE4z2g3w1DJoRZWTeyqTfxdxi4Dr0uYYYyzv2gN8vCBqJNRQx9sQkkIAX0bjvQNfa73+PSplX8Ui7xLWt9Re0IErp0J4rDgRXQmZLDuDEUTNGe21ET+tyv18c+XuR7k1qpSMxlZ+BV1igjHFgZ/L/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXFleUEHt8EncWKNI0LE6S28KXR3TZ/EeMoXs7mDicI=;
 b=bxc4SzUAon8fEg7M4cF1GjntOcnbOrQS0+VDZtPhSFxV1rytoSXwSCkcU0Ne+4qdzM1RIVCAjCIqXa5MqbWbyRw4PjKQQPDW8bw+Mj/JdUT4mqWYUwCPEg5UA3fwP2fsHK+J1rsr4zKCYUwEZ+i3XTGnAHp/0IH6MYaYBMUlttYWmAU+vEuNqBsX8zIwzQRrmrB/DDtjOtRbO4ZHtL/iLWoUDFijWSy9kc+ATIWGMKbSaCzJFzVIbuKdpW0PmzYuRNp69s9abbw/8u0J8vF2AghhjsO2IMJohvvKBzRQNEAPH9lU4LUqG0oCV3F4juoir/XaWJ2VKlbe2LgRReoUeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXFleUEHt8EncWKNI0LE6S28KXR3TZ/EeMoXs7mDicI=;
 b=DrcTDig2V6ysHdYaVxur9ZcUPqbvZ0wIQyqQIBsN5B8cWOiGhNHzb8oSxrdb6sUdh2QWfPfv6Ie0vNr3YPZ6bfRPJHoQLhQLn/u1PVlVqPbMXpDmS3mv5HpATekZadTxfVNgVhP+qLVcbHXLglrCz6mLStzA/96ltNlmNnsC39A=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA2PR10MB4732.namprd10.prod.outlook.com (2603:10b6:806:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:21:49 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 14:21:49 +0000
Message-ID: <9bf2aca1-ac14-506e-bf7e-07fe1b071668@oracle.com>
Date: Wed, 5 Jul 2023 09:21:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [akpm-mm:mm-unstable 62/89] include/linux/kexec.h:41:2: error:
 #error KEXEC_SOURCE_MEMORY_LIMIT not defined
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Baoquan He <bhe@redhat.com>
References: <202307031404.Mjmo2JK6-lkp@intel.com>
 <3e8eecd1-a277-2cfb-690e-5de2eb7b988e@oracle.com>
 <20230703093144.27aa0d991c380f54be34ae93@linux-foundation.org>
 <b5682972-bc67-4b65-33e3-d95182b5e0d0@oracle.com>
 <20230703131726.d505551a7ea964341ece91ba@linux-foundation.org>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230703131726.d505551a7ea964341ece91ba@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0222.namprd04.prod.outlook.com
 (2603:10b6:806:127::17) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA2PR10MB4732:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ba0733-8876-40e0-f195-08db7d632bb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XDxSEzxMaiWRqJYTiP7bVvWf5V0dPC0sf1J/Q20PG3gcXI8IJsjqbgyl+eF1L4BEzMFHwcbIllhGSyBG1+VLOwaAHTLjuT35A8oMmVcA49Bg0L8fl/ym6UzB3vaaK5NA8/KDsRQUBtq5mlxgOcUzBO7bM2xdy7ZO35dWo76pHWsI3r1dzjA039sygd12shFq7OlzezHUKp/2AXdd56434zxgrSmz/1uHF5KAZCR3fEeJHc3PeMrp+kWfeWnGj5kyErYZ89pXSLZjOXjCl6yjBLhx32bdWhDVvXP26OeLTCC9Bv/rd/MCWt1KguOjW4Yd6yxHc4K+bYTnq6r+xVw7TU4pZ2cV7Z9s+G+2Sk8Y7n+QSozCRC2fjU7gv7g0WbfZ+tcae4Ie6hqpW0JvBzYtW+zC+DzYVxUtXOsAjjkQlT9w+klVX8mC+JXS7N543w5yFQLsZuiTZBvdWIKITEz4IvuZ88hu9YRft2b6p2+dKuMS6GRNcT6pbRWlV0NcbaoMKpe90UtbFiknyXnPgaWEaIGMRoOP4aQX57tWzHtvg0LU6nWAHqKLwnNqTJEblN9vGx9+s/Z9QcvpDlrU3+2FQxwPdOHw+Gt4ZhOAgXKC3KfmDfUWFFHFaS3JBPe+VoP4s3wIvAaH0O3giiyMXkvHaQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(39860400002)(396003)(346002)(451199021)(8936002)(8676002)(2906002)(2616005)(5660300002)(53546011)(6506007)(26005)(31686004)(186003)(66946007)(41300700001)(6666004)(6486002)(4326008)(66556008)(66476007)(36756003)(316002)(83380400001)(6916009)(54906003)(478600001)(6512007)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y0V0amlCMmVYUUw1dkJNSndhNm50M0JLWjFielhpWG5ZckRzTllGUzAraFIx?=
 =?utf-8?B?alRNZ3FHTzhFZWd3QzVyQkFlQ09ESEZrcTArVFhRVTdrOWplWURaSktlMjZN?=
 =?utf-8?B?dDlMMDlnU1I5cHVsUXVqZS94eEIwaW10cEZZV0lzM2pLdzBMZ29BajlGL0tH?=
 =?utf-8?B?R0ZYa0YyOVpzRzdnK0hFZGZaTzV0aXFSS3ZLTDFtb2o1NVRXb0g5bE92aUJD?=
 =?utf-8?B?ak9IM29EMGhBRFJpMEVma012d2JKL2RwY0hHZHZWeU16cFhhcmxqaTdUY2Zw?=
 =?utf-8?B?RnB4QnZPOURSVFBQVnpmWS9NNlJ1VWNpR2ZjZ3RwcGRFQjZTT2Y3VC9Yd0I1?=
 =?utf-8?B?TW9XeEtRZEplTTc3dXJpSmg1VkhZazdjVVBDdDhTMkwyVGxOWmt0UFcweFpE?=
 =?utf-8?B?N2VBaXFhcXc1cmxIOGQ2a2RlalBJUEo0TmE3WEdVWlNkYlUzZ0YxemdvVkQx?=
 =?utf-8?B?WmpZMkpsSTJqaFVUd2VheEFoQThnODduaGVkc3pNUEdQRUR6TGVMMzNCY1g5?=
 =?utf-8?B?bnQ0cjJ1TjJlOXV3Sm1ueXdGSFp3N3p5Zlo4LzN2TDFNaUl3aXpidlJ4L1pI?=
 =?utf-8?B?T2JmMUlEL3RHdTRNcDU3b3haZlc2Rnhza01VS0hDcGFJQWRvNjNYOFJuVzBI?=
 =?utf-8?B?dDRKcFZ3ZTJBL2crME1iWG9JUXRGbml2bkpHYjlUbTVHK2FiR0lyME8zMFBZ?=
 =?utf-8?B?bSthOXFWc1dQaVN6c2dkZVQybWV6U3JtcTFLQWp6TDlpN3NSRHJxUlFTa2xq?=
 =?utf-8?B?TGgxT0YzTzFvWHNMWFp5YzU0RXl0TUc2c1J0b2hmR1ljNklRRURyVUdmQi9q?=
 =?utf-8?B?K1dBNm1IODZKUmcwZWp6V3JBd29pTHFMdUFhU3FhNGNKeTRvblJQMUE3c083?=
 =?utf-8?B?RGpvSDFMWm9lalgyMzFyVGxuNWhKRW5aaVJyeVNDZ2dEN0twcmtadlBjMGFI?=
 =?utf-8?B?bTRRQk1GQy9INlRxVHZNczNzSFM3NHcxMndLTzNUMWVhM0tmeDRwc3hIdkMz?=
 =?utf-8?B?aytLYXNMOXdYMnh1MUN4RVp0VzV5Rk9rK1dHY1ZFcmplKzc0L1JTUmRRWmd5?=
 =?utf-8?B?MThiSGpPaG1GYlpra2ExS1ZTZlE1UlFJYi9PemFSb0NDVjg2WW5Ld2pzeTFi?=
 =?utf-8?B?Rjh4U1AxeEVGcU94T0pVaFZpYU03anBIbkpVUGZEQ3hRS0NJQ1Q5aU5qZm9C?=
 =?utf-8?B?cnFaSDJwRXBaenVFY3dlb1VtTkZlMFVPMmNSOFAxMCtpMFFMOVZiQkNRRlpD?=
 =?utf-8?B?UDE0SVdjRy9NL1FMV0dWWFprdDJsZk5KK2o3TmpWRER4NHhWYmxaSDFTQ3FM?=
 =?utf-8?B?OUNRcnk5QnlHZ2xkcWFxVHRpb3BWbms1TW1adDhhYkxXcGkrdkhUUXk2L0l6?=
 =?utf-8?B?OTJEZDMrK3RJSkpDTjJjOVNtYXB0aWtsTUhQL2s0MWZpMVFKTnBxaUdjYXda?=
 =?utf-8?B?WGd1dG9zdWE2TjJsbWRWK1RFakJ3Q1daaVlib0lHbGJYRFNJODJXVzcweU5I?=
 =?utf-8?B?WVRXd0hISTc5SzViSWhkRkpTSWU5UzVwSEhic2R4eDg2MTlhT0R3Y0toYy9u?=
 =?utf-8?B?UzlIQm5wb2d0L3d4ZisxbmdVbFYySmZCNUNnVGRHdzRvQjVhL2thb1dNYzJJ?=
 =?utf-8?B?eTIvZFIyUXgwQVZRUm9idWlsYWIzeE1UcmtFcGhoNi9xRXNxWHUrSmRHMFgw?=
 =?utf-8?B?MTYyc01aYWs2L3JJTUlkTzJkSUhKbmttQ25QZzlQdTVSNXBYYWU2OTl0Y0h0?=
 =?utf-8?B?ZjdNc3JCc003Wmh3dzJsOUx5V1hTTm1TSWJka2dabGdyVDlQOWErdWtKWE5q?=
 =?utf-8?B?eGpzb3VGRVh1YmJlRDhxV01VSG9JMHlvcGtSaEhwdGp2Vk16azdlT2VRT285?=
 =?utf-8?B?ZXNoMko0dUl4cUx1U2hPUGZRLzN2Vmgyd1RmRG9BekZWdVFPUVFkYm41ZmJX?=
 =?utf-8?B?WElmUUpMMVUwQjJSYndYV29uT3lVd25JdDJDeHZhOWhZNHdBRTB5Zk53QTlJ?=
 =?utf-8?B?N2h3TjFYamYzeWVYQzRsN2JIZkdKbHhBYmJFeWtSUFRUVDM4YjdTV1RqdUI1?=
 =?utf-8?B?cXpDRGd4OGtvaFgrZ0ljMElkL25QNmwvSVRSL2FlL0ZXbjdqbkI5NlB0dEdT?=
 =?utf-8?B?YVAvbGhHbE1rdjBvMXRPaXRQMlNFZUdvS05ZSnRBYVFpU2hmTkZiZlI1ZG9P?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	fapASpStMJ1QRd1BtrYamqcvrD1PoEkn2mgFSwpub7ZKJWzae5Luyx4fgF0LbkMeMlia83avISEuZURiARX1AhcOtaBGPxrs2TZ1DalT/MuZcNwL+31e9kL5S5nZhB1EhPx4eDosrbBuPnh6M/SIatMyVGJzoyOYhiZoH1J+v4AI9D1hLADG3qSFxcNIC8cpYFRCwRmvWhK9/cwDf35m0oZ71lXh4+Qa2YiXXv0AjVSgcHolF2gg04NbTU6eO+dv4zeU8ffN8F/nQ8VbDL2VQMEgR0lcls19T6R41bjEZbQSsChZoxRghVaNUnTlqNEchRyLbYRzlUYr+onLlPJAgUL/xzvj1eEPjGL0PFqzKG6SKcbpwv9OnvtId+N1sZibsBsU5oc+u4I0FZ2iqE6Qmp5+AVVouVOLuHVKSl6B0pXE33hPlzDi6kbfJsTQ/EkECS9pB6hH8q4W/vCVC1W+42cnX9tcdAp5O0Utnj0zacdicVP2vd0QwPipkA/hW6DXl4vAwELAzfsiNzFAiQBDt9Ujjo4/0sBNEba+hGK5cbIx7VpHdr6FTuVcuxIJ3NUGR7OrbuGBxoHetC0lfuxZzRQueWrCF4VCy0Gb4z1u9M1EJi2os3rDACr9PqDGRHcbvlGuj1k0Xeo42oysjPSeQsSAANUNafBz9pPnbQYe5DLFVC4Qx2lrk4LBHzQM/My+F46bPjQ37U71J8iLRje2NbXGh9G+yY/ECmhaHueirgBMmKoN/MmAisCiU4KyGiDdBjj0axTaHYB1mjJtj++n2Q2gCFbXnbdbdCu3AX5k602FkVX83JwNNgwCplYWzeQgKnKU2uuS0aRJs9RpKL6kuMvJerZWc7SvKC6PDCxT5Fjdr5d9bJuGxvUlezq8rd63+6/PiMqAjELzo6dCKWCX/Q==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ba0733-8876-40e0-f195-08db7d632bb7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:21:49.3519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHFUZ8/++qfn1qO70d290SrqiPANwdvyBZ/Np2CWSWW1OXH2SYJ08L86V3xuG52/ve6mzxEf05W+f1a2nsUeCFvMi2DdUVjH5KbVCmHBrvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4732
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307050129
X-Proofpoint-GUID: _9nyJJ9MBu10M-6q2lSOKfsgorK0lHYh
X-Proofpoint-ORIG-GUID: _9nyJJ9MBu10M-6q2lSOKfsgorK0lHYh



On 7/3/23 15:17, Andrew Morton wrote:
> On Mon, 3 Jul 2023 13:34:21 -0500 Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>>
>>
>> On 7/3/23 11:31, Andrew Morton wrote:
>>> On Mon, 3 Jul 2023 10:31:34 -0500 Eric DeVolder <eric.devolder@oracle.com> wrote:
>>>
>>>> Here are three possible courses of action:
>>>>     - do nothing; preserve existing behavior as intended by the series (even though problems like this
>>>> can occur)
>>>>     - fix it with CRASH_DUMP selecting KEXEC to eliminate the problem
>>>
>>> This one, please.
>>>
>>> Or make CRASH_DUMP depend on KEXEC.
>>>
>>>>     - do not fix it but document the reason why this problem occurs in the commit message
>>
>> ok, great!
>>
>> I also have an unrelated fix for riscv, and this correction (for both arm and mips). Is the correct
>> action to post a new v4 version? Or is there a different method?
> 
> If the changes are small then I feel that individual fix patches are
> kinder to people who have already reviewed the previous.
> 
> But a new version is OK if that's more reliable.

Andrew, I chose to post a v4 since not all pieces have RB/AB's, in particular the first patch 
introducing the consolidation.

Thank you!
eric
