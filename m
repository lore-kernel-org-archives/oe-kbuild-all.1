Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48B21F18B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 15:34:32 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35M7pU8Y025428;
	Thu, 22 Jun 2023 15:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=AOkYv95ELxzaQF4+7soqxxiPJ1RdVnFKjHqnDVvD97g=;
 b=Tx3nfEZkSoN6NQ5ArqQarpVVCfBNJYyL/H0TCF4jayV+HbJJ7/2yWOD7za8MbtfHzPnt
 zuTmOz7oXpX/VPu1/vz7SeqTw+V1CaMBIfUuUvhy7x64O6aEwI396xJoS9CeMRrq99Uj
 2FB2kl+zGFDZK3FTrvOTjPajvlx4TegxWXFrCnEdG09KY5j0Vp6TPmaxe1Y8dQ7eo3bF
 hRIEBVeV77qzFGlWNQS5xuaOFUT0n5NHv/ZgcoUaczDkrdCchHS3jKlPqDIqPEW8qUSi
 3ZnmOLMXlAMZIqxJ1UJQroofPC8F6mK0F1TEI5H5Ns+HxoCQU194AZjTR+610rHWMWVh 4w== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r95cu2173-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jun 2023 15:34:19 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35MFTJlW008308;
	Thu, 22 Jun 2023 15:34:18 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r939811du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Jun 2023 15:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iP1/xQnxKCksBVozseWloIHQ7kOzUtM1YBXCq1Ckh3XLHNZ8AeR/yn0zO4ALWWxb96QOPbfA5fD/6iAqWc1MMPxro+1x2+hxXf1qd2T0k7NsYusy4ZmfYiQwILnBu+L1SVnN4t75a+fn2Dg6EJjzcdPB3EyHwSMJcMWaWefQL8GRPjQOseOxUwMGYLg89+RHGBWx07cEI6Ej07MkjfAe/9a+DnXxPb3T8w68/Fk0pwdto6SkOGFG804078ifDW3Ccx90D34c6Ewd/CQOxst3G2Bhghthu/FxkqUf2zgcuR/5/UPE7TlKdVqWCpDq4VAocNa5OKfRsU4Rfq44CbsJuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOkYv95ELxzaQF4+7soqxxiPJ1RdVnFKjHqnDVvD97g=;
 b=VeWpCUTT0X7DsVBf9msqVg2mKxQhJwJ4xwcwra1wsl3tvwTWxU1GZ1tuG3H6m4ntWmGwVHpPAxBbRR3bXTURRepTZ8saDGr+d0aNrFWOq24VkQoqDzdBJy+NLF532+KfVHQIflOcP7dcuNdEGi29a3cuPpAb/sFI21CgqVTsiCfgHT5VkKP3RaISfgRkVEfZBbCIjaBrWeP6faTtyUnj2fJMO40bqoCZJbm6wSyqOSqduX6kp83sUuhgrJYvfnmrOXuK4Y59WBHrYDJRqn/7jnn1ce+iDn1qQeQUbWnwYQAptGytAUYOrbiW23QsYxSuVP0SYYhklreKwyiE7FoEuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOkYv95ELxzaQF4+7soqxxiPJ1RdVnFKjHqnDVvD97g=;
 b=hK9M7UkaLji4kJVCbTxEJNt+QQTVy5MBuoaGImcqNIzqenK+5mAz3RKqsLaU4wAZDdBe+LkInanyAa4brfKOrov9A8ZZ6xXpE48Ls8SILKI6NzTsjbg5uORmhf0zJ7q0XLCKYDjdaA8ZzVZa8T1CPQzxox5TTsJhCFtD12NO1AE=
Received: from CY8PR10MB7243.namprd10.prod.outlook.com (2603:10b6:930:7c::10)
 by DM4PR10MB6039.namprd10.prod.outlook.com (2603:10b6:8:b7::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.23; Thu, 22 Jun 2023 15:34:15 +0000
Received: from CY8PR10MB7243.namprd10.prod.outlook.com
 ([fe80::f5ac:d576:d989:34fa]) by CY8PR10MB7243.namprd10.prod.outlook.com
 ([fe80::f5ac:d576:d989:34fa%4]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 15:34:15 +0000
Message-ID: <5faa5807-ec8f-fd8b-6a86-95cea3728ac8@oracle.com>
Date: Thu, 22 Jun 2023 10:34:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [linux-next:master 211/11867]
 drivers/target/target_core_iblock.c:892:30-35: WARNING: conversion to bool
 not needed here
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.de>
References: <202306221655.Kwtqi1gI-lkp@intel.com>
From: Mike Christie <michael.christie@oracle.com>
In-Reply-To: <202306221655.Kwtqi1gI-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:5:3b3::15) To CY8PR10MB7243.namprd10.prod.outlook.com
 (2603:10b6:930:7c::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR10MB7243:EE_|DM4PR10MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d431d9d-b10f-4ff6-a64d-08db733622ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rz1gfB8Obc64uqwBnxI3W9/sDHXce12d3NsMYnw4xkcc7/wcngorROcQ2TMI1mTANYsO1pi85rsjs/bEdD53IowWo8YvYSAgPiPK6aq8uUHO3p2+tu6GzVym5svQwJPQFIs4b74lFnjJtYGQmYB/pYWObiSSnu8Eu1DkJS97uDw3l/BrVOP/pb3Z06kCqL27+SD5njgbDQExNQn0Xj92AqHmbk3vi/Uwu6eT6f7NMmFFxdHbQqQT3goWpbmIhpnqe0RXsLkbhuc7LHu09jgaPCjBv8wzVVXCNsCdH8PiGurx/pjpXf7p3A+96ZT2N899C9bEItmkqJQzfg68Dqhje+cgSqSkGs3bN+j5C0K0TxSqHSocy1XELP2x/QvQ1yz/eKgHHrf1DAt5WVpyoTYu6SGGSAJSfZJMQPTe6r1hk4XDpCEQsoaHm6txHwKdxMiNA8rpbW/6zhXQ6WrZtnyJyGEDFARoxN5RiDf0CxFOXnLAi6YTz6nAROMJDCFU1uRSdPvnaLjgIGxK28cVwrONpxJybJ97/AI39GEFdcg0rjwfU2EApiGG1l+CsGu5myCCAYTmdrq7VNQrjh9uMTPcrmE/yBkoePsuorKx3QgC37q52n7z9iBmML6wKp3pwJbStHTkGZbvx7OIU7RHS5CT8A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR10MB7243.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199021)(8676002)(31686004)(4326008)(6486002)(66556008)(66946007)(66476007)(478600001)(36756003)(316002)(54906003)(31696002)(86362001)(6916009)(83380400001)(6512007)(26005)(6506007)(186003)(2616005)(38100700002)(966005)(53546011)(5660300002)(2906002)(41300700001)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VEpOblUydWhwQnQ3d3BJTVlQNWF0bmJ1dDlxenZiL3pnR3B1TWdUSCtadk1E?=
 =?utf-8?B?aXJ5Sm1LWWk3aEZJYUpJRlo5bmVyekF4OU9oaG1kRUZ6cURDWDVxQXFiRi9L?=
 =?utf-8?B?ZG9iKzFOYkE1b0p6UzNLMUNFcWFPQUhLcVAzUHNBT0pSWm04QVc4RVVaUFJ1?=
 =?utf-8?B?QmRueERkako0cUhiaGx1SFNiMHE5bUhBMS9mdUhRWVhDR1pGandyeENVeENF?=
 =?utf-8?B?RUh5ZURHWDc3MkpPLzlqYVFpNk91VFNUQ0tjTzVaMUFZeFJvRUN4MTRyNUlX?=
 =?utf-8?B?WE93U2dXUXpvcFNhRjN3WWxYUHlnOTAvSHU0NWsrK3I2a2J4ZlJEODZMMDVs?=
 =?utf-8?B?cEwyc2w0Z2orMVJ1eUMwUEpCMXhIVUl1SGVkU29iWkRjeG4wMGZpNlE5SzdH?=
 =?utf-8?B?d1c1cmVjdDFOUmcxZ0hjMTdBNDBiREY2UEpGa1k3MHVBY2ViWEFXM2J0MzRN?=
 =?utf-8?B?OUsvbXc0R1laOFI2QzVlaDczZFN3ZFQ5T2Evdm5FdGlWRGNtWFdSNnlyRXJU?=
 =?utf-8?B?VlBsclVmK29oU01BRHhIYWFZeGFMUGlrVmFpNVdlM3lrUUp3TTMrTUZwRUJa?=
 =?utf-8?B?dUtsWHpCTVh3MnJGVm5zaGdlbEhIZFZlREdacURiNDZZSllMZGZEK2xkUGlo?=
 =?utf-8?B?K2wwMmlROFFaK0x4WS9SY3ExaWNjeko3RXU5TGVwSmRGMW4xYnNxYjZwZlFQ?=
 =?utf-8?B?Vzc4RnNVa2s4RmtZUkhEeXNKdStsbHVnZVd1TXk0UGpBUUNRdjZCTmJlRnVp?=
 =?utf-8?B?d1gyMUp1V3NhQjZuL0E5ZmZ6Y3NkVWMreDhud3pIMEw4bzNDdDRxZzZMb0Ev?=
 =?utf-8?B?Y1BmeHBUeVl3VndReDJRQWFXRFVVSU9EY1hkN2JaR0g3MFgxVlVkRk01R0RC?=
 =?utf-8?B?RThWZUFpa2tEeDZ4bkpLN0hWL0FKdDIxNldSVWlqaDh6YzJkOXdMQzlQd0RN?=
 =?utf-8?B?TWNvdEtwSTIwU1daZWx1M2Z2a0xTemJid1gyT3haa2VWckFyVXp1WFYwZjZl?=
 =?utf-8?B?TEtzWkRjNmN0WFBOT0xVb2g1cXBTVHRkV1lkV1YrRjRzMUlnNWV0ajE3TkFL?=
 =?utf-8?B?dDJrRFNucm5lZU12MWE3aXdtQ1lmVHRpamEyaWFrUDZqenVqU2MzZlBOa2VY?=
 =?utf-8?B?UXYyZjNudHVrNU9sSHVDT3hqYk1mN2JwV0QzVDBVcnJSbWRITEh6d3ZZL1B5?=
 =?utf-8?B?NmZMb0FTZFJxVG9wSXBsdUlWNWZJaWNoU3lmTmtMYkd0V1JvbmJZeVdxQjQ4?=
 =?utf-8?B?SUxxOVR1RUExMDdybjloKzZKS3pNeGpXbW5OWW5rcTBHRGV3L3F6N3VxeFcr?=
 =?utf-8?B?ZVpGQjQ1WHNqcloreGdIWExJZmtmVm5iYWNJZ0hIeTl4bE9CbjhlbHdSanov?=
 =?utf-8?B?T2QxVGoxTHM5cTNOUk80U3dxUHp0MFcwbTdIL2JaUmNKVFRHNmxTd2NTeE9S?=
 =?utf-8?B?SzNOeE55cjk4aFdOTWx4QXhqcnJhZElrM1hIYUFjOFNqa2E5V29EeGh4Smlv?=
 =?utf-8?B?YnRKdy9DMmIvcmFFaG9HZlBsZDI1dkNmQmxScWIxSldJaFBMNDJoUmZhRVUx?=
 =?utf-8?B?WHNwRGtNVGxJV1BZckwyeEM5NmljRWpTMTMxOW9pU1lXMThjd1FtYTVDUzBQ?=
 =?utf-8?B?b3Z2dm5sWnpCa0pJQnVvMUFmVjJ1WGd3N2wwcFdZaHR1WE9OOHhFa0JGTmRt?=
 =?utf-8?B?Y3llRkJmbUVkVUlnUGhmK1VEcEFMVTFsUzRVdHUrUWovbHB1RERDU3hSU2VX?=
 =?utf-8?B?SWVJWkd4U0ptd0lOSDhvQ0dWejA5NXpnSG40eEF3d1NXeWNQSVhjVDZZWTVD?=
 =?utf-8?B?cE9DTDFUNThldXE5bnpyUGZRQWVhdUpJdUlsMjZGT2x1WnkvOElCWXBRd2Z1?=
 =?utf-8?B?N1Z5emZENnVBOUVpYWd4OHkwMjIxQW4zZ3YweU1IM1FtbndDcUs1R20wVGNH?=
 =?utf-8?B?ZEw1VFZ1Z3U5N2tUaWZQMVluckdyVmlTZWZYTHRwa1JHanpaamo0ZFRpYWhR?=
 =?utf-8?B?QW4zV3ZsbXM2dldwV3RLNlFpOXJxZTZDTFY2cmJJQmdXU1JvUXh6WUg4a2dh?=
 =?utf-8?B?L2UrVXRyWU5MQkc5eHRZdUQvRmp4UHhPTmUySGxuQjZCNkl4dENPUW9kOW02?=
 =?utf-8?B?OTJIcGV5Ull0WnpIVjBldUkwdVRNRTJtdzJXUFA0S3J1a1FVeUFXODVIa1lw?=
 =?utf-8?B?YUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	5HF/IZOZf1yx2qrLrpfE3ZtTvpY+EFmD2hNru6TZX1i3km/CkXuHgAbS+0/9rdZk/jmJtZRD9k/tA3qCKmnzrGiEC+mjk1QsF6IQlVnl6j4WK4F0BGuh7gZxADhY8F0wU2yF1kH87OjyUCtT56AVBmZUiVtk6BYAS06uqNPicerwrtuzPdO30O1klXeDBTQ6rvG6yeJAoUtF54XPxUm3/Cw3VprljKTmkQJk5j4CDrqBJ1azU417vVFQTK0xS4h27xEgzTVTonRUaL/N1fzJ1KafTJCFFVueLIEJzx/DSqHLFYFqTLgiSDwQKYrJtmJxQXoqBEA8skKPS2fLMNjXdmc6/RLAwRD3uj67doim8Fwz3I6aHFQ5n6+t7ezSr9gqHWFD45xYZ0cMEVlIDdDT3r7HvtXgaBv4UYl064zvzLSqxM3C5Fan4zHUZ5Dwpqe42F1CQV2UNd9cwkwG7kpJtErqPMeAYE7HDWjXOi6LJBS1G3Ebq2cd0XMQjYXesQ33Mh/5ZoGt05sGyM6byyD77Tw/eBBasxLnjiS086WFXXXXiCLTHq/OJANabY6Or9LjFWFMfcO1ZYwIisNYKE5OAg8fQmmDz1/qqLVfPnfghnWLmSIHfRXWrLyw+rhdwFE/gA6n27NfFBZ33JkuRzFzR+hQouL/CSyrs/tPTeTknrfrY98+5D9sX7dEXx0udcHiQ7CqDE7LgDyg8GV+5ztZoi4O5D6bB4OjUmWRQuP0hZgztywpEoSVIItxup5oIj3utpg9VBB8GJ9fxp1a9N9hwEOGX7KmjOKU2KyPH7ktW5Fjg7EIaweElAsq5x3zUIJhwWxm0YZ0eUazT5RvnDKCSsi1WiebnqTGe7TQVK89m78=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d431d9d-b10f-4ff6-a64d-08db733622ff
X-MS-Exchange-CrossTenant-AuthSource: CY8PR10MB7243.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 15:34:15.7532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDRyqD1uaVTJ1834gW7MRyMTC42RFOYYz73IX8GLIr20GKWm9+wlgqGdxe58T7xVuko0apsWkwEH7EWeWm10StMeKLHsDeBpTpVey0Zl1hM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6039
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_10,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306220131
X-Proofpoint-GUID: dIplwjh_j6rbRUCISma_15aS0gw63_Iw
X-Proofpoint-ORIG-GUID: dIplwjh_j6rbRUCISma_15aS0gw63_Iw

On 6/22/23 3:48 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   15e71592dbae49a674429c618a10401d7f992ac3
> commit: 394f811848827ad23d2b43e94e5d72a24cfbc39f [211/11867] scsi: target: Add block PR support to iblock
> config: sparc-randconfig-c003-20230620 (https://download.01.org/0day-ci/archive/20230622/202306221655.Kwtqi1gI-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230622/202306221655.Kwtqi1gI-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306221655.Kwtqi1gI-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
>>> drivers/target/target_core_iblock.c:892:30-35: WARNING: conversion to bool not needed here
> 


>    883		case PRO_PREEMPT:
>    884		case PRO_PREEMPT_AND_ABORT:
>    885			if (!ops->pr_clear) {
>    886				pr_err("block_device does not support pr_preempt.\n");
>    887				return TCM_UNSUPPORTED_SCSI_OPCODE;
>    888			}
>    889	
>    890			ret = ops->pr_preempt(bdev, key, sa_key,
>    891					      scsi_pr_type_to_block(type),
>  > 892					      sa == PRO_PREEMPT ? false : true);


The kernel test robot is correct. I can do the patch below.

Martin, do you want me to just submit the patch below to linux-scsi or
fold it into:

commit 394f811848827ad23d2b43e94e5d72a24cfbc39f
Author: Mike Christie <michael.christie@oracle.com>
Date:   Fri Apr 7 15:05:51 2023 -0500

    scsi: target: Add block PR support to iblock

and re-submit that whole patch?


From 96f7e2fa06cd39f2e661530ae14160286f189fbb Mon Sep 17 00:00:00 2001
From: Mike Christie <michael.christie@oracle.com>
Date: Thu, 22 Jun 2023 10:30:12 -0500
Subject: [PATCH] scsi: target: Quiet bool conversion warning with pr_preempt
 use

We want to pass in true for pr_preempt's argument if we are doing a
PRO_PREEMPT_AND_ABORT, so just test sa against PRO_PREEMPT_AND_ABORT, and
pass the result to pr_preempt.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306221655.Kwtqi1gI-lkp@intel.com/
Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/target/target_core_iblock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index a3c5f3558a33..3d1b511ea284 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -888,7 +888,7 @@ static sense_reason_t iblock_execute_pr_out(struct se_cmd *cmd, u8 sa, u64 key,
 
 		ret = ops->pr_preempt(bdev, key, sa_key,
 				      scsi_pr_type_to_block(type),
-				      sa == PRO_PREEMPT ? false : true);
+				      sa == PRO_PREEMPT_AND_ABORT);
 		break;
 	case PRO_RELEASE:
 		if (!ops->pr_clear) {
-- 
2.25.1


