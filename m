Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99D214F70
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Oct 2023 16:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YN7PPWKi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="e2EMw1z5"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39NFO41R004550;
	Mon, 23 Oct 2023 16:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=/JDFqqEiRl/hL+erdWxkQUp2D0BN5pVOt6eVJsiN63g=;
 b=YN7PPWKi3svaE2vjONEoUKZBrSLdNFae79uJsuVmQ4r9UGCKIVlVQHSB/kXP0rd+bAtF
 9ABt5yAhw8eObaPTqaklb5GhY8imRP2xTAIA1BMHha8jALi4B+iA5heMkW4RTu+WoL5L
 4ZD7UipvTN8wEH+Q+wRwdrJ1Aj/VP+2n0sCKIvE9EM9RvOlfpvtv+KkvQWlkDstpEds7
 xpgchUSbiGKVuSMbTRl8VSmsSwY4eLjWil8FsOtJ8Vo5xXlp+IhnsftPiiDpE01VlRV3
 wonSuNOd9f54tA11by0pKPsfos0YldYFL6aubHbxJRKEBngFCLp40fqiYDdbfI4WXMC/ Ew== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tv6pcug0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Oct 2023 16:14:45 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39NFTcZ5034688;
	Mon, 23 Oct 2023 16:14:44 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3tv5345vb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Oct 2023 16:14:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QABH5olZYUtV2INAxwFYd1dewLbpPH+QvQJOWdsPFTOdJUoYyBW7PyO9x8PYjDhVI7K7u8HiAyn0Y+3/eybxNq3GiXqUK7jyeFnQXiidQVa4EXrUU7QcJZS6/eh7vKdZSE9af3K24+tdXiQ+uJ6CAiycVCe/hNUE27StX37zJajF50kr29hgdx+DtG/hNCJnerRM3S1y6ljUgSckNBx/SEirgCZvx1bD7jgjEz0Gw6xZKqYORWiLL5UUbBH3rtLMXm6M3RcP0DlNs0/CXg81JrxCIalgb/WZlHTVsbodfNqv7vq7QmlCTBU6s2XbniCcwb26yaQmIFQs6NguWLn/GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JDFqqEiRl/hL+erdWxkQUp2D0BN5pVOt6eVJsiN63g=;
 b=NIxhLqwU8gWroNMZ3gtxrYPgDMjV2BZbp997w8tcSAkQY1N/QroU/Cwr7w9tVTN+ZEo5fS4OPjozVBvUSphBBxQwlk94aWJPa0oKwCyKMyx+WcAbF3KovdptH7TEZ7IJIK7nEsH0GAUQkuRW3EGFq/GRkM6QCe/g5AB8EHWulGWQLoRg3zhp/H+r6qL1UM7kO/rnCQ94kM+u7NZ3uCVLh2l+Ukpn0dwvzmXz55P3V1BdxAetbsuIIudRUHT8fkjHv1iQxhlynA8ADs8DpJcMYinZjJhYu33AUQXSPdRguzPeoRfKsJsZPMAfRKo37oYHf8p63bLTwrIc44DU/9IXkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JDFqqEiRl/hL+erdWxkQUp2D0BN5pVOt6eVJsiN63g=;
 b=e2EMw1z5jzhMIHOvLuNBwp+zQrWrfqipr96clyH1vPcKEv1bkeCJ8Gf6gBl9vistvYK4ABN43pNpxCUSJiizGj9Aptsyeh/rWwKsU1zwWSlZU+hnKse6VFJnrDkOQ11fm9HB1AMmyF6+SjQ6vhOksshI6QWjDeia3aez8WP8uL0=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by IA1PR10MB7197.namprd10.prod.outlook.com (2603:10b6:208:3f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Mon, 23 Oct
 2023 16:14:38 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::c8c3:56ba:38d5:21ac]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::c8c3:56ba:38d5:21ac%3]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 16:14:38 +0000
Message-ID: <418f7d16-4424-4131-8eaa-cc4e17d0dd00@oracle.com>
Date: Mon, 23 Oct 2023 17:14:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 11303/14422]
 include/linux/io-pgtable.h:172:44: warning: 'struct iommu_dirty_bitmap'
 declared inside parameter list will not be visible outside of this definition
 or declaration
Content-Language: en-US
To: Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
        Lu Baolu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        kernel test robot <lkp@intel.com>
References: <202310232131.TOhkKzZa-lkp@intel.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <202310232131.TOhkKzZa-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0311.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::35) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|IA1PR10MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: 4911475a-c679-4c41-d1e6-08dbd3e327ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6FNVPEkNLarTG45pJSq9UYOBmQf+cjnMXGanvAeP+QCiP0HWIR/W1T7FBhitTB85a+kyq3aUf0U8MpQ20OEnhjnZqavn/tWLJgij+bNzV87geF+bpbjcsnFNWTFTnPy9IPhRDIxCNHMfU9BhNlxxmXqdd1Vd3LttlTa3qOHZ5TR9FM8fK3j8tB8WUHgRfxz6BMJqEkdRC3G/SOrHrvH0H+Sv01yEs6V2uyrvwOOGIQ6P2S0fuydqA/okIKFrpWDYjcl+JZUeptJ8ZBPmBmZqWNTLSmlIatTD7vprte0H0m3KRA2o34fnMsXX3uC3SZ6357fZSdv4QSPxkcYgNtkNQ6kQhWv+rEP9T8vESGuxHE0ePoOyEPT8mgGNC3fJZ00iEdsmNHgH7I6/+6zVLki6JQQbPgZKlD+BFO+Yi+bQg5zr62ujvziA221rpAmqZVApcwMAvbj75Sskvr8676pHpoM/tjbAKZxIVgFJ7H4+RDtNCJ8S5y/AvkwMouexEeAHA48hOzEWURc8jak5QkCoMzwd4/ph61xjGfLnC7ddxVme/HOyDp0xIineLzPLRyLtMG4W2cQwrLX/TrIhn5D4B93HqoIaW6PttC4Nj0B0cA7InOr4RN93F0Hpo9YoPKlv/Fi2EtFwbwwtGoNAD1cwGkokh94dQU8pY+ELYvREok0oqna7Uh3N0CPt9ueBZtO8QWUoPgoTtZRlih2rvZJY9Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB4835.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6486002)(478600001)(2906002)(6512007)(53546011)(66476007)(86362001)(31696002)(26005)(2616005)(54906003)(66946007)(316002)(83380400001)(4326008)(6666004)(41300700001)(38100700002)(66556008)(8676002)(36756003)(5660300002)(8936002)(6506007)(110136005)(966005)(31686004)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y3AyRllCeDN6SnUvTkdOYnhOV28zSVJPZXhaR3dQOXlFcHd6bVRyWllHM0oy?=
 =?utf-8?B?RnBnSks1U2Z6U3JKY083YWYyWXFRNjNSM29Sa01mNVZFSmo2K1ljK2dEVVcy?=
 =?utf-8?B?WlZBR0x2MEN3RkpPclZQWFg3WFBTRmxweGVxZE1GVkpLNGM3VjlJS0Z2cUUr?=
 =?utf-8?B?VVl6NkpjM2FtU3NsL3pROStaci9DWVBBemQzUU9CTXRHRnlBRVN1YncrbVJt?=
 =?utf-8?B?N2VOelhhdW1GY1RldDdvQUE1c1lleW9HYSttQ0t4Y2V2ck5FY0lsZlFkaDlG?=
 =?utf-8?B?SklPWWNBU2k4RkRaMEpKaHF2M3EwUFlTQUdWejhwcjVEYWVleUVPbUNCSHVa?=
 =?utf-8?B?S3FET01EUUJKcEZZSEdHWVlQL0E0STNNVzlpUUMydXl0eURuNlBCQnk1Uzlz?=
 =?utf-8?B?NHpCVWdIMzVBd2pnTCtWSHV6alR1V1JqeFJjQ0lBRlA1UXZGU01pUUt6ODMx?=
 =?utf-8?B?YnA3UmZJcFMvZzhVTUM3eW1leWtiRGRTMjV5L1ByS2pZRXhuSjZlU2h3MGNJ?=
 =?utf-8?B?azU1NUdJWStxY3RCNVc0NnpsUVNkc1MyUkhHQlV1ZjNlSThFWXliSmNLZmpP?=
 =?utf-8?B?N2VKcHRydUw3cmxDeU8zNzdQa0o2QmZnNVJiTzRCenVwOG1TZEN5WUxiRGdK?=
 =?utf-8?B?d0NYbEc1RkV1K2JGRDdNWk9oUXlQU1ZLcnBPdHhhZ0JBQWlZYkg5UGR3L0x4?=
 =?utf-8?B?YUUwMktOMncxNXpOZENGQWowV3JzbkRJRnlkOUZiWk1MTmNGL3VtK21ibUFq?=
 =?utf-8?B?clRXZHdXYm15RXRqdzFlNFdDdWNWQ1pYWEtJTERkS2J3TFUwM25Pd0ZrMVV0?=
 =?utf-8?B?Q0oydmV1ZmRJUlp5ekdyQlNyT1h1QnZpc1BLQjA5SVdMQUI5eUJEUWg5cHRj?=
 =?utf-8?B?Y3A2T0R4cjUrdkdNMFIrSXZQdVp0UHhCYmV0RWVXS3AyQTVCWFpKMUl5emo1?=
 =?utf-8?B?Sm5zUndDNWZkeUJSVEphYUNpT0VJcTludkZxaGVoOG1reHJpWWlpbisvMDFO?=
 =?utf-8?B?a1NmSlY1NlE0S3JUZHhONkc0R0hJTkJFdnVYNVdkV2txdjVDZXdTVUVIbldz?=
 =?utf-8?B?YXBHcDhpMG9qTFgwRVVZdnkxRUpCbFRQTm9HcmNDWDhDWFp2Nzl6OFNnRW84?=
 =?utf-8?B?WWk3citSU3p6QXhFWnM2ZzZZVmYwN0Zkb2RKM05WUUlDMXpzWk9jUzQ5U0ts?=
 =?utf-8?B?N2xYWXFFNlR0dDExRU5sUUIxbEdvckJTeGlVQVAxbUdLemRWb2NUQk1hVzE4?=
 =?utf-8?B?WFY2Uk9hY1dWWitLQTFLKzZXSXg3VmxmRnd1THVZaTNXWE1WVjh0aFpRUkhn?=
 =?utf-8?B?aFVmMlVoZjZDTWo4RFBFb2ZodFhrSEtWdE9OVnJqRTN0S0d5dnR0QUljSDAr?=
 =?utf-8?B?WEJPN2NTaXcrMWxRNkhObUJ5ZnF6NkdHU3U1QVlYWWJxWkhZZjJiRzcxSHBW?=
 =?utf-8?B?Y2VQR0VjRzdkR0RISGd6Ymo4czlRT09rTGlpdmdkMG10MHZqYVBvWk5XK1RZ?=
 =?utf-8?B?ZVdBOE4vNllQVUtzekNyRmhyTTN0YlBiTEtLOExFQnBHNG1laStiWHZ0aWFr?=
 =?utf-8?B?NCthQWdaZkN6L0lxa29ET0VyUHN2ZzJNZVhORmlJaEhSU05SbW5VMDFST2po?=
 =?utf-8?B?VkdzbzFTOGZXcEoyN3FDRVZZTHFvcEwvYXhwTnFTOXEyMkVPT1Rhc213OVNY?=
 =?utf-8?B?TG9vdituYnJ1MkpMNWZaRzh5T2FoRnR5a3dhRk04bG1EbzdOdEd2TVJJWk1O?=
 =?utf-8?B?VEloVEphM2dJbnA1TC9kbFhSVHdYNGMrQzJRN21YSWNXZllURW1LMTBzaG5S?=
 =?utf-8?B?MjVLNHJQTHk3MHhFS0kyWS8xTVpOWlNWRXc1dEJVb3dxVldaL3ZtTTlWeSs4?=
 =?utf-8?B?L2RTS1dDTTZwcDIrNUs5N0RvRWhZNEh4YXhUQXBKd01vVUgyN29Xd2k3UCtZ?=
 =?utf-8?B?cXJyMTVkZW1keWNQeGE2RzlIOURZV2R3VzRrR1htNkc5bHI5R2NoYndiYzYx?=
 =?utf-8?B?RktaNmp0UEVmNTF0QjdGTlhRNHlTM2YxT3RwNHZwUm1Qd3UxM3dDa3hUVEla?=
 =?utf-8?B?UFY1TFlCbGZmdGRiRlh4N281aFYxTEVvUDdxd1FsWTZyMi94MXVCUVAwNnN0?=
 =?utf-8?B?NVdWQTYxRDk4M0Y0ZzRSL2Q3VFVSVHdlNUhOMldaczJTMHpQemh4dmdKSWNK?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	86xLCBMdWfqgsO5MNKewxIRcOsMV9MG3/b4KbM8dj4mgO7ukz2qZIXvuTwjHG7tWsLC2qrv5mLg14gt8GbDnQW7gC2DVd+zg16iOG5tw8bIU+0AQ0J5G23+vyURhHZtZsTFBAh8WjP8wXupzSPsKn++35d1eQtmbfaFLePYjidwSx2qbbVRn1oXj6FBf0sZpg24AlSEdWx8SwFtaQTtM1XdYA6q3sK/StgsEhLbA9Pg7cujtdf9SN/SCW6R1hhKU/HEJHqYHeNPiihHaxPJE231rXwfrDs+dTX++D/AZ7zXFWDDmCqyQ7OUdVQscGAQYyqOKO5jwPvAwHEWCke9g8agBnI3co1VILlk49RQpj5jKSSQJ2ExgCPQE+AR5o8/ZIxaIZ5fUUrA7D2drHQ5uteh33u14f02fjUsEPOON0bHK4l53CKPjuN8PNd+9G2P5CByLRYzNBzLMYydrI0GK1WFjenoSjl8QIM+U1sMS+61KtxK7Fk7/OnTxcPJGt071mDxs55S25q5nBtR4ZnObxL4JchdgnhMsrY2Za4SnaDVIXg0RcVZsZK3+PnQbsHVHmtBDR5hB8+RNBpAGZIF8nsBj4vESG4d2WOG9DGNPGwVe4q4kMtWZVbacvwTG7Pv5UI+FEc1PjSWvwX1LltP8JfXlsPauiZFXsdKEHOmzKvsjLlj0krzup7v9RebXpwXrNiCNE0oyF7lG3rEyIzHjaRq8tQnBwMwn2uCB86tG2nvXvL5gobPfduA+nj2bE0EEvJLTTdLwuSxyiu/GwZNvMH01gyQ9tynkrsBgKvK3h+7UhrNuBvFruFNM5eoKrSmGvC4Ixh16/BIiPfr4f3tNS0sOtrRXiDdqA032L3jCD86umP6vp1Psb9c9YSYQacl0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4911475a-c679-4c41-d1e6-08dbd3e327ac
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 16:14:38.1813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEl5KRfrRZQnbcQwwOwOfEbzBt1MJyaQUGfHWKFtckVyttjiJ3/+bRipmyUEDWRV7xSNkX0j9JfrLDkVTJQWX/GQjnwoclCz50fVBAziKWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_15,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310230141
X-Proofpoint-GUID: 8kQmf7BevYEe9Z76loiUQenL3xlr9Pb9
X-Proofpoint-ORIG-GUID: 8kQmf7BevYEe9Z76loiUQenL3xlr9Pb9

On 23/10/2023 14:53, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e8361b005d7c92997d12f2b85a9e4a525738bd9d
> commit: 14207f68dddf152fd0b2916451a1f4702de886e4 [11303/14422] iommu: Add iommu_domain ops for dirty tracking
> config: sparc64-randconfig-r002-20220915 (https://download.01.org/0day-ci/archive/20231023/202310232131.TOhkKzZa-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310232131.TOhkKzZa-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310232131.TOhkKzZa-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/iommu/io-pgtable.c:11:
>>> include/linux/io-pgtable.h:172:44: warning: 'struct iommu_dirty_bitmap' declared inside parameter list will not be visible outside of this definition or declaration
>      172 |                                     struct iommu_dirty_bitmap *dirty);
>          |                                            ^~~~~~~~~~~~~~~~~~
> 
> 
> vim +172 include/linux/io-pgtable.h

'Interesting' randconfig where we build sparc64 with ARM io-pgtable code (also
with IOMMU_API not set but with IOMMU_SUPPORT=y). I have fixed the warning as
below in the ifdef clause for !IOMMU_API following the rest of the style of the
header:

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 9379ceefa5da..291b663c6c05 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -802,6 +802,8 @@ struct iommu_fwspec {};
 struct iommu_device {};
 struct iommu_fault_param {};
 struct iommu_iotlb_gather {};
+struct iommu_dirty_bitmap {};
+struct iommu_dirty_ops {};

 static inline bool iommu_present(const struct bus_type *bus)
 {
@@ -1034,6 +1036,18 @@ static inline bool iommu_iotlb_gather_queued(struct
iommu_iotlb_gather *gather)
        return false;
 }

+static inline void iommu_dirty_bitmap_init(struct iommu_dirty_bitmap *dirty,
+                                          struct iova_bitmap *bitmap,
+                                          struct iommu_iotlb_gather *gather)
+{
+}
+
+static inline void iommu_dirty_bitmap_record(struct iommu_dirty_bitmap *dirty,
+                                            unsigned long iova,
+                                            unsigned long length)
+{
+}
+
 static inline void iommu_device_unregister(struct iommu_device *iommu)
 {
 }
