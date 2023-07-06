Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8B2C2C4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 20:04:21 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366K46Hm018514;
	Thu, 6 Jul 2023 20:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=HSsHb4qBDoSAHxELZ0puTzRj88T7kn0FMf7cMfzUgxo=;
 b=s2rFeeyAGMjC8WiwAijwyavYHEMsU/JcmCn153SFGVTDrystgALkdfRdb2SGBzybDqri
 bx0m1VD2FOyjtg75xpJjhVDxQs7YdH3N727QQINHqZWghPXeY3YFgGIfAIQItUdFSs3o
 Rv0+K5JNBUnNCJP9VEx1DxPQMZfGxN+svN78GJ/qcBQvnMF29SwPYv/mVoE5Re+JiRRx
 gfDd6Bnf8jjzPvo6BNptnBIBnkz6Mij5O48ykSiBfhNEmwyHgF7L+oX/2KJQl/fU8InB
 wf5g0xcWVzM1aUrdDKtFLBXDFShJZqPs2TdpoWe0m0qGo4nhsVeVSvzDzECYg7AHQuZf Dg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rp3vy81xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 20:04:12 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 366IPdmg001658;
	Thu, 6 Jul 2023 20:04:10 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2049.outbound.protection.outlook.com [104.47.57.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rjakdhem3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 06 Jul 2023 20:04:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=meKeZ17iXH+LiDq89ykmJmu216UIaGvoRwFGjjkPhmfgAGpERpHIEZl85nijFn0TMmlbfKvNBqS3hSb2f3IFcN/BXwUC7Jb17o52Bl16/I1PfuaF/KB+01dPGqyESCGrywdnpOJ4G6uXmotvUljweDspk6hqwyz6rjr0BnRNAe6RMB0zXHr6mWt0YqZXaC09aUsmtwSq8HVOcqhqZqW0616To0kODzXhQlYCgL5OayvNa0a3ARtwAu2WmxHSS5VCLZDJeCduY0YuoYO1xcK5rxzuuEUotw4T+HkejkJh/iKiSUatUzk+1RURIM7z0VYByjwj03bYUx3n/V92ipS3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSsHb4qBDoSAHxELZ0puTzRj88T7kn0FMf7cMfzUgxo=;
 b=YU1BuWSM7pbcUDrh4ShXDZ3hmCBD/JK+JW3IiTx7B9vw/muz2F53HDA/qo0JIamy/o7sbXXQ6NyMFwdVfu2PjnXI1lDeiq4hOoY0bntRl73nnh4pf5QlX4H67X81b2ckJ7kOJrRRLSN5ZjQLVFKUE7PLZdgUhp25ZBmiyeHZUI0idrd/rs0ymG7NJcFkD0eWKlnsX6noTf437K0Wf+b2mtMgPk+Dzr3iiKUq2SRN1/vCxXtPMl5cOFpATRpERkQFDTXQRW1uoiqWMzZKVfdNPa6X0q1m4clEMFGIdTnVjQVvdGmTCu42bas8tcYDjZr3P1QXvDpz/m1HbMXUTnuomQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSsHb4qBDoSAHxELZ0puTzRj88T7kn0FMf7cMfzUgxo=;
 b=It0sVm05NXt1/XajxeuvZ7biblpGA0k4Zfh7H5EMItYKQFZHIbpueTJa7/HcBQMtkXpM14KlBk58TULo2uMQCTuJjebRt3RWmBiOXsVMCyD2Wdodf2uxysGVfLVAj0EdGO3Nnv79/RmZa+EjGz6jsHghK2BJ0ydlg4FJGv50jhM=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH0PR10MB7499.namprd10.prod.outlook.com (2603:10b6:610:182::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.24; Thu, 6 Jul
 2023 20:04:07 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 20:04:07 +0000
Message-ID: <d0dcaa2e-e4c7-184d-5f64-f63709f0181c@oracle.com>
Date: Thu, 6 Jul 2023 15:04:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [linux-next:master 12991/13166]
 arch/s390/kernel/machine_kexec.c:192:18: error: invalid use of undefined type
 'struct kimage'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>
References: <202307070320.eW5rfZ7Y-lkp@intel.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <202307070320.eW5rfZ7Y-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0323.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH0PR10MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 49de237e-bf58-4222-0dcc-08db7e5c27ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O/fkfHxpotd2TAGlQTvL3anAnob7aFfjbSzLALQBZ3jtl7zusj2bXr82/2f2Y3o1h7kJMSzRDtbM399XHWJ26/UoTdb4U1yV1Xh7UGcZXEyuRlZy3jbI1Ucdt+UgIcAIheY6ra/ZXT8Eu+hLzsJ9oZbeX/kezPEXrabuNTZ4CjLcNZyYFObamDfpVVWlzelS5OeQ/OwMgnNOgT96vAbogTnHtumxIJn21RXN5PExAnKvsw3pHRWJXS5exIDnY33KPo/m2W8awNlGw+XE1ccop/AxFFjrXkrcOZvbxQOKkw6g4X9scluldr1IVTDQQr7A2LtcNlMNHdnX+Xx5QENZS26xIQbgmy+stHzxthHpZKH9IFRMUhTLYQMkFiDcD6zZueKn3+ycR0SuzsrIZSk4jFEQOXYXmiv1w2Jiw/C3mX9nCr9eN3u5+iUnMWd8luVEFofNAiWPjriZQ0hKzbJHeqkBowQZhNu3oJhnhUXIM2BT5R/2+3l+XMbAfWxMyxOhzElUUj/v6JcV4XxptWMdUmxHo43c5C70Eej+XjtbsYDbTvP5gSAaoQms7/IUF8eS/4Jjq76+R54lmXqjVsZX9dDtGK7VHKuT2NOrXgA9+bVciSIa9RH47d0NpYo5oNSwAN1cYAjqkOJPUTEnkIotNQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199021)(478600001)(6486002)(6666004)(54906003)(6506007)(26005)(53546011)(966005)(6512007)(186003)(66946007)(4001150100001)(2906002)(30864003)(41300700001)(316002)(66556008)(4326008)(66476007)(6916009)(5660300002)(8676002)(8936002)(38100700002)(86362001)(31696002)(36756003)(2616005)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dklNTTBUcVNZdXNsMmtKb0hNSUdLNGtRTGM4SW5FRXhxQkZrNGIzaDgrMlBE?=
 =?utf-8?B?QlE5Tlk1ZDBIcFQybUNQOWNHcGdpcGI1Yys2R01lYkFHOWRSNUpzQVcrNUli?=
 =?utf-8?B?SFh4QjAzaTluQ3FVc0ZLMVQ1OERTdFhVT0JwV2M4TmJhVW90ZXE5cTA2TXJs?=
 =?utf-8?B?Ky9KVnFtREtQWFdWMWN3eEQzT0YyRGNraE9VUjZrY1F6ZEhab29pL082dTVj?=
 =?utf-8?B?K0JIZnJhenBEWmlhcFFXQ1pNWEJwdm9wbG1INlk0eDdmSm42MTVrY3YwRjdV?=
 =?utf-8?B?VlU0czFHR25QcVZscmVuY0Z4bmVadTU2Zi9EY1dSV28wUVcxMWtHMlJ0RXpX?=
 =?utf-8?B?K3JIbkJpcnI0bFdkTXAvWjJpZE5OdmJIbzYxUG1ucTZrVHU2MzVGQVpIQjhN?=
 =?utf-8?B?Qk00Z1k2RTY4cEZFRGxlSFJiUG5QVDF0czBlbUNVM2xnSnkxRUZqTUFMb0JN?=
 =?utf-8?B?aTdKb3BQU0lYZHlXOElIeVQwcXg4bW5NelovbThJQ3NWMnB6Z2pxckpRd2w1?=
 =?utf-8?B?OWhpZEpDZnhGRUs1cGMzZlBzdzVoWHdHZHlZbnM4M2duVGpkbDFmQi9ab20r?=
 =?utf-8?B?OURmZFo2MEZCcnJJVFVoYTh5YXFLcXBUTkRlRmo5eGJHemRBVzhpa1FrQ1Qz?=
 =?utf-8?B?dmk2eFh2RU1LNGM0M1dMT0JkblNZZGIvQ2JyRXJ5SkJNNzJjd21Qai8zNHFO?=
 =?utf-8?B?aEVlcGhXdlJsY21JcFNqT0NqbXk5S1dEVG5xb25EYm5WYTZmNEpxVzhUaWRG?=
 =?utf-8?B?RmcwTnBlYUhWb251czZ0RTgzbXlIb2FyVHhxbkIyU1p2cmhjazdFakhhVWYv?=
 =?utf-8?B?TlN1NFd5SVJxQllxNmpqTjVxNGhmcTkwR1pLOUIzalkvMjBJZm94djUyam5S?=
 =?utf-8?B?ZENCSHpvYVpHMTdlRiswSXVFSVdZRFRDNVJKOWN0dTJBOThuZXdMSVVrcWE0?=
 =?utf-8?B?RC9kRVBxL0pPQjE4ZHo0RW9kemlFWDBCb2JsRDl1Z2hxZ2VuSnEvdkhDeCtk?=
 =?utf-8?B?YTFWcHFoNFRmd3psNFVtcDdXTVRtVDduOGQ5ZkdTOWhWeHVJUEcyT1Z0TXlh?=
 =?utf-8?B?TFp3OUZqdjJ0YkgvYnhLdXQzaGJWNUY5Z1V2NFFmanJpWkkxT0M3UzhEZUhF?=
 =?utf-8?B?RVBjNEMyWEZMUHhqSktZbVRwei9HOHB1NUpYSStndHFXVm1iWEFHYlkzMTM1?=
 =?utf-8?B?aWcwc3h4cmdKT0ZwdVl5TmNTNnQxWlJrdmdVdDhrYmNIcUZUWXVHOEtpVmVM?=
 =?utf-8?B?bUJraUl4aXJoU1JrNmxUdDdMRzQ4RGRTUE1LNnFxM2dnNVByd0JWUXB1bGhs?=
 =?utf-8?B?bUR4WDBFMGZKREdxazNoQUk0UTlkclYrWTFjT1p5NnQyLzNqUzdKMGpQSndq?=
 =?utf-8?B?SzZDQWhSWmRvYVlVdWZ4clVCNTBxYzJvZTRNT3RaMUs4VkV6cXlQa2d6c2Ri?=
 =?utf-8?B?blhHNlpFazF4WENvcDZIbEw4RXkvbkthZE5pNVo3T2lFelJjSnczU3dlODVw?=
 =?utf-8?B?dEdmWlJvOUMyQzhEL2pxelkxV0djT2lGMm0wODZqNnNSTzdwRkJDYWJwTXhH?=
 =?utf-8?B?aEcvVDFZOWhkRFRGOElFcnF4WFI5Q3o0eTZlYyt6dnBCSndvZ3E2dVVMam1r?=
 =?utf-8?B?Vkx4RTZJK2srdU4yV3BZK2tNRlZDWnhaVWU4a1JCa3NMb0hMOG5GSklRMHBC?=
 =?utf-8?B?QlN5UmJVUHNpSnJWR09jcTZsVE1OOHV1T2hoZFFuN3VmNnBjNURSMGczL21D?=
 =?utf-8?B?dlU0Q1RPT0hSTE83dnpwUURvTDJqM3hHWFVjejJ5TFp6OVlPaWVCVjFPejF5?=
 =?utf-8?B?ckY5aGwrL3dkZTZ6RVpNWXNGTWNaZU5YY3F2N3FGK01sOWx6Qk1yQjhiTE1i?=
 =?utf-8?B?VENvOEEwNnlqVUttRWprUnRycjdkclZKdFFvZmpVa04xOXc1OVRpTVZ2aWsx?=
 =?utf-8?B?RERTTFpnMGtncE9KRG90Y2NsdnlGREdqempob2NzYmdvQUR6Q3Q1blZFakxt?=
 =?utf-8?B?TkVwWkhXVmxHSHhwYXVFdkFTNitycllwckVLNUd4RisxRGV1cGpDMlpWZDgw?=
 =?utf-8?B?NEVMd3dZNkJaWGRqU0NzakpBQlBSTkFBSUdkcnZlTjFLbU4zUkNickFQdGRv?=
 =?utf-8?B?TjJkVzJVZGw0VktENUdlUnZPbFdlaDlSN1VrOStaMzkrRnBtYzQ1NFZSendO?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	7QYdDWgngUDg8mWsmWdftykObpJazh+w5VwNBOt5XLHBhSHA6diP/Oi5iZp27pG8zA5cjVwuTTshBBGeKMsAThFA0kHRtOm30VUelhwaBFYojm8o2v+Ur5KVLGH7hQrETK3xv+LGKJy6ALqAdPxBfxFqcKlVDkWEQslvpuH7dG8UQsdIwnpBYbAk3k8CM30WACNxWQWwOFFWTAN7DTrogHmWly12iZqgNX0j98BQB4ulzlkErjD6fHW9OzlOcsa1eFtpybtr5eiBHU/7p9waSujvyS40WfwaHmGYgydOJEBtpdPGu6axniTnUICSS9ixdTuzEABP90n9wDMI2iWPcrxoV6F4uTFPEBdCnvCT+xlyZOXRLlldyMMH/nQebA0auaSgMb9h1goBUsjxoLaMWzQ4WtAjWi/6lOoImsdZMbEH5xg6Yng6lXJAwJuv3uTd5ooj7v4AiE2juSZZeZIm8RDvju382Z4+sJOwPcKLA5NvMnsCQuu515Smpg9Mf52dAujEDiTg4V22h2SCjqPI0a45hhtnJpXtNenC3e09Z90YiHAKgF90U5nzE5aD7v2MJjK7kHS8dRwCq0ibVsTrF8SX4MD0utztsuG4bF8P0h9fuAgnSd5M9jPuV+XxJNmvD+34EN6wwVp+yW19H5S+wvvTl7K0nuvvFELhl850mh2NbPBrSKpxf4IsIWObKf/tkbsy61LBfCnSQYMh5/9raC1as9qY/Q9714lob35yrzdpnTeMI5Bdl8WghAqET/knEFF4SkPNRoFNx9rT1xVkXb8hDGjvE3Nh9/a7OqONTUCyUKBpjydjY9ZP2FbyrzPzFAWJ+UVDt7fu1gkje2fsYNjg/HX2Jb/aFuwwnkcNylln4vKeZe7vd/6+qyy/Xsbx
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49de237e-bf58-4222-0dcc-08db7e5c27ed
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 20:04:07.7291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjoWbiXshJA3ARnHJA+CSWB2GqCQYkXZifcdTnZ2njw0LGVAcOjHuk/C9713/Abm+jaHxpGLrs2gKqAZRIEIa/4CZML52d/O029racrWrvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7499
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_15,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060177
X-Proofpoint-ORIG-GUID: YfaXWfXYua34BzC-FOvdkN7OD3g23X-J
X-Proofpoint-GUID: YfaXWfXYua34BzC-FOvdkN7OD3g23X-J



On 7/6/23 14:57, kernel test robot wrote:
> Hi Eric,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   c36ac601a98fb148147640bae219108ee81566f8
> commit: 2d4f027c7ebbede209555e9ef93d4273818cacc9 [12991/13166] s390/kexec: refactor for kernel/Kconfig.kexec
> config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20230707/202307070320.eW5rfZ7Y-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070320.eW5rfZ7Y-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307070320.eW5rfZ7Y-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
>>> arch/s390/kernel/machine_kexec.c:120:37: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
>       120 | static bool kdump_csum_valid(struct kimage *image)
>           |                                     ^~~~~~

The original s390 Kconfig always enabled KEXEC; the refactor didn't preserve that behavior, and this 
is the root cause of this issue.

I am running final v5 regression on my end, and this version does preserve the always enabled KEXEC, 
so this issue should go away.

This regression is still a few hours away from finishing, and so far so good. If all is good, I'll 
post v5 then.

eric


>     arch/s390/kernel/machine_kexec.c:188:34: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
>       188 | int machine_kexec_prepare(struct kimage *image)
>           |                                  ^~~~~~
>>> arch/s390/kernel/machine_kexec.c:188:5: warning: no previous prototype for 'machine_kexec_prepare' [-Wmissing-prototypes]
>       188 | int machine_kexec_prepare(struct kimage *image)
>           |     ^~~~~~~~~~~~~~~~~~~~~
>     arch/s390/kernel/machine_kexec.c: In function 'machine_kexec_prepare':
>>> arch/s390/kernel/machine_kexec.c:192:18: error: invalid use of undefined type 'struct kimage'
>       192 |         if (image->type == KEXEC_TYPE_CRASH)
>           |                  ^~
>>> arch/s390/kernel/machine_kexec.c:192:28: error: 'KEXEC_TYPE_CRASH' undeclared (first use in this function); did you mean 'KEXEC_ON_CRASH'?
>       192 |         if (image->type == KEXEC_TYPE_CRASH)
>           |                            ^~~~~~~~~~~~~~~~
>           |                            KEXEC_ON_CRASH
>     arch/s390/kernel/machine_kexec.c:192:28: note: each undeclared identifier is reported only once for each function it appears in
>     arch/s390/kernel/machine_kexec.c:196:18: error: invalid use of undefined type 'struct kimage'
>       196 |         if (image->type != KEXEC_TYPE_DEFAULT)
>           |                  ^~
>>> arch/s390/kernel/machine_kexec.c:196:28: error: 'KEXEC_TYPE_DEFAULT' undeclared (first use in this function); did you mean 'KEXEC_ARCH_DEFAULT'?
>       196 |         if (image->type != KEXEC_TYPE_DEFAULT)
>           |                            ^~~~~~~~~~~~~~~~~~
>           |                            KEXEC_ARCH_DEFAULT
>     In file included from arch/s390/include/asm/thread_info.h:31,
>                      from include/linux/thread_info.h:60,
>                      from arch/s390/include/asm/preempt.h:6,
>                      from include/linux/preempt.h:78,
>                      from arch/s390/include/asm/percpu.h:5,
>                      from include/linux/irqflags.h:17,
>                      from include/linux/rcupdate.h:26,
>                      from include/linux/rculist.h:11,
>                      from include/linux/pid.h:5,
>                      from include/linux/sched.h:14,
>                      from include/linux/ratelimit.h:6,
>                      from include/linux/dev_printk.h:16,
>                      from include/linux/device.h:15,
>                      from arch/s390/kernel/machine_kexec.c:9:
>     arch/s390/kernel/machine_kexec.c:200:48: error: invalid use of undefined type 'struct kimage'
>       200 |         reboot_code_buffer = page_to_virt(image->control_code_page);
>           |                                                ^~
>     arch/s390/include/asm/page.h:188:58: note: in definition of macro '__va'
>       188 | #define __va(x)                 ((void *)(unsigned long)(x))
>           |                                                          ^
>     arch/s390/include/asm/page.h:196:38: note: in expansion of macro 'pfn_to_phys'
>       196 | #define pfn_to_virt(pfn)        __va(pfn_to_phys(pfn))
>           |                                      ^~~~~~~~~~~
>     arch/s390/include/asm/page.h:201:33: note: in expansion of macro 'pfn_to_virt'
>       201 | #define page_to_virt(page)      pfn_to_virt(page_to_pfn(page))
>           |                                 ^~~~~~~~~~~
>     include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
>        64 | #define page_to_pfn __page_to_pfn
>           |                     ^~~~~~~~~~~~~
>     arch/s390/kernel/machine_kexec.c:200:30: note: in expansion of macro 'page_to_virt'
>       200 |         reboot_code_buffer = page_to_virt(image->control_code_page);
>           |                              ^~~~~~~~~~~~
>     arch/s390/kernel/machine_kexec.c: At top level:
>     arch/s390/kernel/machine_kexec.c:207:35: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
>       207 | void machine_kexec_cleanup(struct kimage *image)
>           |                                   ^~~~~~
>>> arch/s390/kernel/machine_kexec.c:207:6: warning: no previous prototype for 'machine_kexec_cleanup' [-Wmissing-prototypes]
>       207 | void machine_kexec_cleanup(struct kimage *image)
>           |      ^~~~~~~~~~~~~~~~~~~~~
>     arch/s390/kernel/machine_kexec.c: In function '__do_machine_kexec':
>     arch/s390/kernel/machine_kexec.c:243:40: error: invalid use of undefined type 'struct kimage'
>       243 |         data_mover = page_to_phys(image->control_code_page);
>           |                                        ^~
>     arch/s390/include/asm/page.h:191:35: note: in definition of macro 'pfn_to_phys'
>       191 | #define pfn_to_phys(pfn)        ((pfn) << PAGE_SHIFT)
>           |                                   ^~~
>     include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
>        64 | #define page_to_pfn __page_to_pfn
>           |                     ^~~~~~~~~~~~~
>     arch/s390/kernel/machine_kexec.c:243:22: note: in expansion of macro 'page_to_phys'
>       243 |         data_mover = page_to_phys(image->control_code_page);
>           |                      ^~~~~~~~~~~~
>     arch/s390/kernel/machine_kexec.c:244:36: error: invalid use of undefined type 'struct kimage'
>       244 |         entry = virt_to_phys(&image->head);
>           |                                    ^~
>     In file included from arch/s390/kernel/machine_kexec.c:27:
>     arch/s390/kernel/machine_kexec.c:252:40: error: invalid use of undefined type 'struct kimage'
>       252 |                    unsigned long, image->start,
>           |                                        ^~
>     arch/s390/include/asm/stacktrace.h:101:32: note: in definition of macro 'CALL_LARGS_2'
>       101 |         long arg2 = (long)(t2)(a2)
>           |                                ^~
>     arch/s390/include/asm/stacktrace.h:216:9: note: in expansion of macro 'CALL_LARGS_3'
>       216 |         CALL_LARGS_##nr(__VA_ARGS__);                                   \
>           |         ^~~~~~~~~~~
>     arch/s390/kernel/machine_kexec.c:250:9: note: in expansion of macro 'call_nodat'
>       250 |         call_nodat(3, void, (relocate_kernel_t)data_mover,
>           |         ^~~~~~~~~~
>     In file included from include/linux/irqflags.h:15:
>     arch/s390/kernel/machine_kexec.c:252:40: error: invalid use of undefined type 'struct kimage'
>       252 |                    unsigned long, image->start,
>           |                                        ^~
>     include/linux/typecheck.h:11:16: note: in definition of macro 'typecheck'
>        11 |         typeof(x) __dummy2; \
>           |                ^
>     arch/s390/include/asm/stacktrace.h:136:9: note: in expansion of macro 'CALL_TYPECHECK_2'
>       136 |         CALL_TYPECHECK_2(__VA_ARGS__);                                  \
>           |         ^~~~~~~~~~~~~~~~
>     arch/s390/include/asm/stacktrace.h:219:9: note: in expansion of macro 'CALL_TYPECHECK_3'
>       219 |         CALL_TYPECHECK_##nr(__VA_ARGS__);                               \
>           |         ^~~~~~~~~~~~~~~
>     arch/s390/kernel/machine_kexec.c:250:9: note: in expansion of macro 'call_nodat'
>       250 |         call_nodat(3, void, (relocate_kernel_t)data_mover,
>           |         ^~~~~~~~~~
>>> include/linux/typecheck.h:12:25: warning: comparison of distinct pointer types lacks a cast
>        12 |         (void)(&__dummy == &__dummy2); \
>           |                         ^~
>     arch/s390/include/asm/stacktrace.h:134:9: note: in expansion of macro 'typecheck'
>       134 |         typecheck(t, a)
>           |         ^~~~~~~~~
>     arch/s390/include/asm/stacktrace.h:136:9: note: in expansion of macro 'CALL_TYPECHECK_2'
>       136 |         CALL_TYPECHECK_2(__VA_ARGS__);                                  \
>           |         ^~~~~~~~~~~~~~~~
>     arch/s390/include/asm/stacktrace.h:219:9: note: in expansion of macro 'CALL_TYPECHECK_3'
>       219 |         CALL_TYPECHECK_##nr(__VA_ARGS__);                               \
>           |         ^~~~~~~~~~~~~~~
>     arch/s390/kernel/machine_kexec.c:250:9: note: in expansion of macro 'call_nodat'
>       250 |         call_nodat(3, void, (relocate_kernel_t)data_mover,
>           |         ^~~~~~~~~~
>     arch/s390/kernel/machine_kexec.c: At top level:
>     arch/s390/kernel/machine_kexec.c:278:27: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
>       278 | void machine_kexec(struct kimage *image)
>           |                           ^~~~~~
>>> arch/s390/kernel/machine_kexec.c:278:6: warning: no previous prototype for 'machine_kexec' [-Wmissing-prototypes]
>       278 | void machine_kexec(struct kimage *image)
>           |      ^~~~~~~~~~~~~
>     arch/s390/kernel/machine_kexec.c: In function 'machine_kexec':
>     arch/s390/kernel/machine_kexec.c:280:18: error: invalid use of undefined type 'struct kimage'
>       280 |         if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
>           |                  ^~
>     arch/s390/kernel/machine_kexec.c:280:28: error: 'KEXEC_TYPE_CRASH' undeclared (first use in this function); did you mean 'KEXEC_ON_CRASH'?
>       280 |         if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
>           |                            ^~~~~~~~~~~~~~~~
>           |                            KEXEC_ON_CRASH
>>> arch/s390/kernel/machine_kexec.c:280:66: error: passing argument 1 of 'kdump_csum_valid' from incompatible pointer type [-Werror=incompatible-pointer-types]
>       280 |         if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
>           |                                                                  ^~~~~
>           |                                                                  |
>           |                                                                  struct kimage *
>     arch/s390/kernel/machine_kexec.c:120:45: note: expected 'struct kimage *' but argument is of type 'struct kimage *'
>       120 | static bool kdump_csum_valid(struct kimage *image)
>           |                              ~~~~~~~~~~~~~~~^~~~~
>     cc1: some warnings being treated as errors
> 
> 
> vim +192 arch/s390/kernel/machine_kexec.c
> 
> 2980ba6ae8ca55 Heiko Carstens      2019-06-10  116
> 60a0c68df2632f Michael Holzheu     2011-10-30  117  /*
> 60a0c68df2632f Michael Holzheu     2011-10-30  118   * Check if kdump checksums are valid: We call purgatory with parameter "0"
> 60a0c68df2632f Michael Holzheu     2011-10-30  119   */
> 7c3eaaa3917d8b Philipp Rudo        2017-10-17 @120  static bool kdump_csum_valid(struct kimage *image)
> 60a0c68df2632f Michael Holzheu     2011-10-30  121  {
> 60a0c68df2632f Michael Holzheu     2011-10-30  122  #ifdef CONFIG_CRASH_DUMP
> 2d1b21eceaf076 Alexander Gordeev   2023-04-03  123  	purgatory_t purgatory = (purgatory_t)image->start;
> 60a0c68df2632f Michael Holzheu     2011-10-30  124  	int rc;
> 60a0c68df2632f Michael Holzheu     2011-10-30  125
> 2d1b21eceaf076 Alexander Gordeev   2023-04-03  126  	rc = call_nodat(1, int, purgatory, int, 0);
> 7c3eaaa3917d8b Philipp Rudo        2017-10-17  127  	return rc == 0;
> 60a0c68df2632f Michael Holzheu     2011-10-30  128  #else
> 7c3eaaa3917d8b Philipp Rudo        2017-10-17  129  	return false;
> 60a0c68df2632f Michael Holzheu     2011-10-30  130  #endif
> 60a0c68df2632f Michael Holzheu     2011-10-30  131  }
> 60a0c68df2632f Michael Holzheu     2011-10-30  132
> 7a0058ec78602d Xunlei Pang         2016-05-23  133  #ifdef CONFIG_CRASH_DUMP
> 7a0058ec78602d Xunlei Pang         2016-05-23  134
> 2d0af2247906cf Heiko Carstens      2016-05-31  135  void crash_free_reserved_phys_range(unsigned long begin, unsigned long end)
> 2d0af2247906cf Heiko Carstens      2016-05-31  136  {
> 2d0af2247906cf Heiko Carstens      2016-05-31  137  	unsigned long addr, size;
> 2d0af2247906cf Heiko Carstens      2016-05-31  138
> 2d0af2247906cf Heiko Carstens      2016-05-31  139  	for (addr = begin; addr < end; addr += PAGE_SIZE)
> 2d0af2247906cf Heiko Carstens      2016-05-31  140  		free_reserved_page(pfn_to_page(addr >> PAGE_SHIFT));
> 2d0af2247906cf Heiko Carstens      2016-05-31  141  	size = begin - crashk_res.start;
> 2d0af2247906cf Heiko Carstens      2016-05-31  142  	if (size)
> 2d0af2247906cf Heiko Carstens      2016-05-31  143  		os_info_crashkernel_add(crashk_res.start, size);
> 2d0af2247906cf Heiko Carstens      2016-05-31  144  	else
> 2d0af2247906cf Heiko Carstens      2016-05-31  145  		os_info_crashkernel_add(0, 0);
> 2d0af2247906cf Heiko Carstens      2016-05-31  146  }
> 2d0af2247906cf Heiko Carstens      2016-05-31  147
> 4e042af463f806 Heiko Carstens      2016-05-31  148  static void crash_protect_pages(int protect)
> dab7a7b1538fec Michael Holzheu     2011-10-30  149  {
> 4e042af463f806 Heiko Carstens      2016-05-31  150  	unsigned long size;
> dab7a7b1538fec Michael Holzheu     2011-10-30  151
> 4e042af463f806 Heiko Carstens      2016-05-31  152  	if (!crashk_res.end)
> 4e042af463f806 Heiko Carstens      2016-05-31  153  		return;
> 4e042af463f806 Heiko Carstens      2016-05-31  154  	size = resource_size(&crashk_res);
> 4e042af463f806 Heiko Carstens      2016-05-31  155  	if (protect)
> 4e042af463f806 Heiko Carstens      2016-05-31  156  		set_memory_ro(crashk_res.start, size >> PAGE_SHIFT);
> a9fbf1a53836d4 Michael Holzheu     2012-05-18  157  	else
> 4e042af463f806 Heiko Carstens      2016-05-31  158  		set_memory_rw(crashk_res.start, size >> PAGE_SHIFT);
> dab7a7b1538fec Michael Holzheu     2011-10-30  159  }
> dab7a7b1538fec Michael Holzheu     2011-10-30  160
> 7a0058ec78602d Xunlei Pang         2016-05-23  161  void arch_kexec_protect_crashkres(void)
> dab7a7b1538fec Michael Holzheu     2011-10-30  162  {
> 4e042af463f806 Heiko Carstens      2016-05-31  163  	crash_protect_pages(1);
> dab7a7b1538fec Michael Holzheu     2011-10-30  164  }
> dab7a7b1538fec Michael Holzheu     2011-10-30  165
> 7a0058ec78602d Xunlei Pang         2016-05-23  166  void arch_kexec_unprotect_crashkres(void)
> dab7a7b1538fec Michael Holzheu     2011-10-30  167  {
> 4e042af463f806 Heiko Carstens      2016-05-31  168  	crash_protect_pages(0);
> dab7a7b1538fec Michael Holzheu     2011-10-30  169  }
> dab7a7b1538fec Michael Holzheu     2011-10-30  170
> 7a0058ec78602d Xunlei Pang         2016-05-23  171  #endif
> 7a0058ec78602d Xunlei Pang         2016-05-23  172
> 60a0c68df2632f Michael Holzheu     2011-10-30  173  /*
> 60a0c68df2632f Michael Holzheu     2011-10-30  174   * Give back memory to hypervisor before new kdump is loaded
> 60a0c68df2632f Michael Holzheu     2011-10-30  175   */
> 60a0c68df2632f Michael Holzheu     2011-10-30  176  static int machine_kexec_prepare_kdump(void)
> 60a0c68df2632f Michael Holzheu     2011-10-30  177  {
> 60a0c68df2632f Michael Holzheu     2011-10-30  178  #ifdef CONFIG_CRASH_DUMP
> 60a0c68df2632f Michael Holzheu     2011-10-30  179  	if (MACHINE_IS_VM)
> 60a0c68df2632f Michael Holzheu     2011-10-30  180  		diag10_range(PFN_DOWN(crashk_res.start),
> 60a0c68df2632f Michael Holzheu     2011-10-30  181  			     PFN_DOWN(crashk_res.end - crashk_res.start + 1));
> 60a0c68df2632f Michael Holzheu     2011-10-30  182  	return 0;
> 60a0c68df2632f Michael Holzheu     2011-10-30  183  #else
> 60a0c68df2632f Michael Holzheu     2011-10-30  184  	return -EINVAL;
> 60a0c68df2632f Michael Holzheu     2011-10-30  185  #endif
> 60a0c68df2632f Michael Holzheu     2011-10-30  186  }
> 60a0c68df2632f Michael Holzheu     2011-10-30  187
> c6b5b847a7cf11 Heiko Carstens      2006-12-04 @188  int machine_kexec_prepare(struct kimage *image)
> cf13f0eaffa31b Heiko Carstens      2005-06-25  189  {
> c6b5b847a7cf11 Heiko Carstens      2006-12-04  190  	void *reboot_code_buffer;
> cf13f0eaffa31b Heiko Carstens      2005-06-25  191
> 60a0c68df2632f Michael Holzheu     2011-10-30 @192  	if (image->type == KEXEC_TYPE_CRASH)
> 60a0c68df2632f Michael Holzheu     2011-10-30  193  		return machine_kexec_prepare_kdump();
> 60a0c68df2632f Michael Holzheu     2011-10-30  194
> cf13f0eaffa31b Heiko Carstens      2005-06-25  195  	/* We don't support anything but the default image type for now. */
> cf13f0eaffa31b Heiko Carstens      2005-06-25 @196  	if (image->type != KEXEC_TYPE_DEFAULT)
> cf13f0eaffa31b Heiko Carstens      2005-06-25  197  		return -EINVAL;
> cf13f0eaffa31b Heiko Carstens      2005-06-25  198
> cf13f0eaffa31b Heiko Carstens      2005-06-25  199  	/* Get the destination where the assembler code should be copied to.*/
> 39218bcf941ab1 Alexander Gordeev   2023-04-03  200  	reboot_code_buffer = page_to_virt(image->control_code_page);
> cf13f0eaffa31b Heiko Carstens      2005-06-25  201
> cf13f0eaffa31b Heiko Carstens      2005-06-25  202  	/* Then copy it */
> c6b5b847a7cf11 Heiko Carstens      2006-12-04  203  	memcpy(reboot_code_buffer, relocate_kernel, relocate_kernel_len);
> cf13f0eaffa31b Heiko Carstens      2005-06-25  204  	return 0;
> cf13f0eaffa31b Heiko Carstens      2005-06-25  205  }
> cf13f0eaffa31b Heiko Carstens      2005-06-25  206
> c6b5b847a7cf11 Heiko Carstens      2006-12-04 @207  void machine_kexec_cleanup(struct kimage *image)
> cf13f0eaffa31b Heiko Carstens      2005-06-25  208  {
> cf13f0eaffa31b Heiko Carstens      2005-06-25  209  }
> cf13f0eaffa31b Heiko Carstens      2005-06-25  210
> 60a0c68df2632f Michael Holzheu     2011-10-30  211  void arch_crash_save_vmcoreinfo(void)
> 60a0c68df2632f Michael Holzheu     2011-10-30  212  {
> 4df29d2b9024d6 Alexander Gordeev   2022-07-20  213  	struct lowcore *abs_lc;
> 4df29d2b9024d6 Alexander Gordeev   2022-07-20  214
> 60a0c68df2632f Michael Holzheu     2011-10-30  215  	VMCOREINFO_SYMBOL(lowcore_ptr);
> 7fe7a18cddf35f Michael Holzheu     2011-12-27  216  	VMCOREINFO_SYMBOL(high_memory);
> 60a0c68df2632f Michael Holzheu     2011-10-30  217  	VMCOREINFO_LENGTH(lowcore_ptr, NR_CPUS);
> c78d0c7484f0a8 Heiko Carstens      2021-08-04  218  	vmcoreinfo_append_str("SAMODE31=%lx\n", __samode31);
> c78d0c7484f0a8 Heiko Carstens      2021-08-04  219  	vmcoreinfo_append_str("EAMODE31=%lx\n", __eamode31);
> b2d24b97b2a969 Gerald Schaefer     2019-02-03  220  	vmcoreinfo_append_str("KERNELOFFSET=%lx\n", kaslr_offset());
> 2154e0b3282d00 Alexander Gordeev   2022-12-19  221  	abs_lc = get_abs_lowcore();
> 4df29d2b9024d6 Alexander Gordeev   2022-07-20  222  	abs_lc->vmcore_info = paddr_vmcoreinfo_note();
> 2154e0b3282d00 Alexander Gordeev   2022-12-19  223  	put_abs_lowcore(abs_lc);
> 60a0c68df2632f Michael Holzheu     2011-10-30  224  }
> 60a0c68df2632f Michael Holzheu     2011-10-30  225
> c6b5b847a7cf11 Heiko Carstens      2006-12-04  226  void machine_shutdown(void)
> cf13f0eaffa31b Heiko Carstens      2005-06-25  227  {
> cf13f0eaffa31b Heiko Carstens      2005-06-25  228  }
> cf13f0eaffa31b Heiko Carstens      2005-06-25  229
> 48a8ca03f8fd49 Heiko Carstens      2012-08-27  230  void machine_crash_shutdown(struct pt_regs *regs)
> 48a8ca03f8fd49 Heiko Carstens      2012-08-27  231  {
> 3b9678472bab86 Vasily Gorbik       2018-04-04  232  	set_os_info_reipl_block();
> 48a8ca03f8fd49 Heiko Carstens      2012-08-27  233  }
> 48a8ca03f8fd49 Heiko Carstens      2012-08-27  234
> 60a0c68df2632f Michael Holzheu     2011-10-30  235  /*
> 60a0c68df2632f Michael Holzheu     2011-10-30  236   * Do normal kexec
> 60a0c68df2632f Michael Holzheu     2011-10-30  237   */
> 60a0c68df2632f Michael Holzheu     2011-10-30  238  static void __do_machine_kexec(void *data)
> cf13f0eaffa31b Heiko Carstens      2005-06-25  239  {
> 39218bcf941ab1 Alexander Gordeev   2023-04-03  240  	unsigned long data_mover, entry, diag308_subcode;
> 2c2df118a64407 Heiko Carstens      2010-02-26  241  	struct kimage *image = data;
> cf13f0eaffa31b Heiko Carstens      2005-06-25  242
> 39218bcf941ab1 Alexander Gordeev   2023-04-03  243  	data_mover = page_to_phys(image->control_code_page);
> 39218bcf941ab1 Alexander Gordeev   2023-04-03  244  	entry = virt_to_phys(&image->head);
> 2ba24343bdb863 Alexander Egorenkov 2021-09-03  245  	diag308_subcode = DIAG308_CLEAR_RESET;
> 2ba24343bdb863 Alexander Egorenkov 2021-09-03  246  	if (sclp.has_iplcc)
> 2ba24343bdb863 Alexander Egorenkov 2021-09-03  247  		diag308_subcode |= DIAG308_FLAG_EI;
> 7a04d491edf476 Alexander Gordeev   2023-04-03  248  	s390_reset_system();
> 7a04d491edf476 Alexander Gordeev   2023-04-03  249
> 82caf7aba107db Alexander Gordeev   2023-04-03  250  	call_nodat(3, void, (relocate_kernel_t)data_mover,
> 82caf7aba107db Alexander Gordeev   2023-04-03  251  		   unsigned long, entry,
> 82caf7aba107db Alexander Gordeev   2023-04-03  252  		   unsigned long, image->start,
> 82caf7aba107db Alexander Gordeev   2023-04-03  253  		   unsigned long, diag308_subcode);
> 1a36a39e225d35 Martin Schwidefsky  2015-10-29  254
> 1a36a39e225d35 Martin Schwidefsky  2015-10-29  255  	/* Die if kexec returns */
> 98587c2d894c34 Martin Schwidefsky  2019-04-30  256  	disabled_wait();
> cf13f0eaffa31b Heiko Carstens      2005-06-25  257  }
> 2c2df118a64407 Heiko Carstens      2010-02-26  258
> 60a0c68df2632f Michael Holzheu     2011-10-30  259  /*
> 60a0c68df2632f Michael Holzheu     2011-10-30  260   * Reset system and call either kdump or normal kexec
> 60a0c68df2632f Michael Holzheu     2011-10-30  261   */
> 60a0c68df2632f Michael Holzheu     2011-10-30  262  static void __machine_kexec(void *data)
> 60a0c68df2632f Michael Holzheu     2011-10-30  263  {
> 60a0c68df2632f Michael Holzheu     2011-10-30  264  	pfault_fini();
> 3ab121ab186692 Michael Holzheu     2012-03-11  265  	tracing_off();
> 3ab121ab186692 Michael Holzheu     2012-03-11  266  	debug_locks_off();
> 10ad34bc76dfbc Martin Schwidefsky  2015-01-14  267  #ifdef CONFIG_CRASH_DUMP
> 1a36a39e225d35 Martin Schwidefsky  2015-10-29  268  	if (((struct kimage *) data)->type == KEXEC_TYPE_CRASH)
> 1a36a39e225d35 Martin Schwidefsky  2015-10-29  269  		__machine_kdump(data);
> 10ad34bc76dfbc Martin Schwidefsky  2015-01-14  270  #endif
> 1a36a39e225d35 Martin Schwidefsky  2015-10-29  271  	__do_machine_kexec(data);
> 60a0c68df2632f Michael Holzheu     2011-10-30  272  }
> 60a0c68df2632f Michael Holzheu     2011-10-30  273
> 60a0c68df2632f Michael Holzheu     2011-10-30  274  /*
> 60a0c68df2632f Michael Holzheu     2011-10-30  275   * Do either kdump or normal kexec. In case of kdump we first ask
> 60a0c68df2632f Michael Holzheu     2011-10-30  276   * purgatory, if kdump checksums are valid.
> 60a0c68df2632f Michael Holzheu     2011-10-30  277   */
> 2c2df118a64407 Heiko Carstens      2010-02-26 @278  void machine_kexec(struct kimage *image)
> 2c2df118a64407 Heiko Carstens      2010-02-26  279  {
> 60a0c68df2632f Michael Holzheu     2011-10-30 @280  	if (image->type == KEXEC_TYPE_CRASH && !kdump_csum_valid(image))
> 
> :::::: The code at line 192 was first introduced by commit
> :::::: 60a0c68df2632feaa4a986af084650d1165d89c5 [S390] kdump backend code
> 
> :::::: TO: Michael Holzheu <holzheu@linux.vnet.ibm.com>
> :::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>
> 
