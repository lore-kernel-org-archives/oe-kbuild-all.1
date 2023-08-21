Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118D68C17
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 18:07:24 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37LFxUJT009106;
	Mon, 21 Aug 2023 18:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=L8d/fQeVreGbf/oCU39PodUBY2RhsPrtrS8cvOkvmDU=;
 b=G1cpJzuBN0IA7W/6EL3Sq9k0F+Meu3Swz2OqGf4CPdVhRbiprE4XPFSBb/o5ZstJJAqb
 +zuWVY3tZc8ARuMOvoGoUQevIGQd5ZVib6BKbvEtAg1pNUY7iVjT7Z8OUjOb0Xbbqvym
 iGz0HFoQjKm7/m2B5CMy9ZfK6AyqYRPx7ViEAHgInsyXTUJLFRiZmz6+pg0Nm0so4zMQ
 B1Q0/CdvBiRumzEAdNicaALFDxN2LwuI5sF0mtLLlrMXgzKLmyzGpD9IRkOMXUhqMd42
 /7IMIJrQJunaEEopU16dfvMyWA6uwizrc+hkzZbAxLZHFiSBgE+uYF1wuteRnRVV2Pik og== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3sjm5duhys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Aug 2023 18:02:10 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 37LGmqP8017805;
	Mon, 21 Aug 2023 18:02:09 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3sjm6a9amd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Aug 2023 18:02:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOArnbMq0aj+8pXePeh/lL+Laaf0p7V2nOlxebXRa+EDGFO2YAh/djrIZdICuxr/iS9q2k/AYZ8NRhcBKmCdpreSVO5ctBqgoIZiWB5bX/YbVaHEelRPElHez9kM6DcHpaKvtZxLneD/145qfJNDUJNaiRMZokdR2vsVm7Ng1Pnn2IX21XRFgG5a0RtSkbX/82iKNnzhby2Z4cmao4szRVmD7tBdR3TzQ9TNpM9bwHivJDCobyu++b1pu7jIg9mRZAabkiYJqya41Ji4lOTx7HdFV8W3pMQE9i9gMPED/5hg2UPj/dLPxHkST9ji2Kjl1/gIS4E2UxkGeZpTfNEo8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8d/fQeVreGbf/oCU39PodUBY2RhsPrtrS8cvOkvmDU=;
 b=ApQ7Uzfz6uUzVM0EjwnopgtSu8cNotzWWHu8UHt0KPzekw0EopvJY0vyCmgdThQ3MiLkgxdciRfgxIkI6t4r4mRzNjtskSXdZ+aVtopRnjtOVeEDaGowWgdf8igh9M1OFMXbPQpfuljEywLhQhL2nihn8kuazq45D1z28MMbj8ZgY7yQ0MrwAtWWzeHhN+E/am4DaY9Xb81cGrHVVvJ5sPp66VUVrakmEF7VOHs4D/j/d/+un36Pdt21esJo0lzdRM1LnsIdw1WEQYWfvPuhO4UpoxSamnSD16lMV735o95n+CEGflI2UN1vE/u6cx67S0AYyu6DO/At8ab1JZC4mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8d/fQeVreGbf/oCU39PodUBY2RhsPrtrS8cvOkvmDU=;
 b=JVETFxdt/V1LKYa+OIW8eMNsXt3AtiA90yKoN30lfq8nUY0F7Tgb1MmizVJ1aOq1DMZdLeUm8QK3TzgV3WCplncXph2FIH/DMO775EY2xWlXH2mSKyRguNv57ZvL7J3icfwbsjkuQmTYSrQGZc7AEUSffnRaKUXV0Sns639HpYw=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CH2PR10MB4245.namprd10.prod.outlook.com (2603:10b6:610:7b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 18:02:06 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::be4f:55e6:89c5:4f57]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::be4f:55e6:89c5:4f57%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 18:02:06 +0000
Message-ID: <b0c0c449-1201-f325-a4a0-43e3dc79a015@oracle.com>
Date: Mon, 21 Aug 2023 13:02:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [linux-next:master 10295/10848] arch/x86/kernel/crash.c:232:12:
 warning: 'prepare_elf_headers' defined but not used
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sourabh Jain <sourabhjain@linux.ibm.com>
References: <202308220012.gipltORx-lkp@intel.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <202308220012.gipltORx-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0148.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::33) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CH2PR10MB4245:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e6ad7f-8280-42c1-c622-08dba270bb03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DYlrdvDWubSliJ9Prp6VtLoTKssB4nMb6UIpGxeyUVN/MS/RSkeDojjm0N8uTp5tCRO3mn8OlVg6nm1bfYObC54tQq9UvW7NTR3L2YfCYX6+WdOwRCaNYZPCVLf7Za65/L/Hlv3wP/HOk19POm5BPLLdFf9VhIBry7e4vMANrygLU0QwyiQ6vIDIfqpUdq0p5UK9DicYzfeZJKsxXa8gPpp1omhahzak2A+fP0Mvl8RZBlzvi5LNp3w3loMaHuS7LKWvcMHmJCtHUH9f9mHMtM6dVMllye9NMVQhoHdrVTyU2UdCbV8l9zUO9MB3GUhkzd6M91kN0sZKBVxtYPkNnRHtjgzuhGa84MsG0VG+4TNpFZAhMpvbfaw6Ss53lHZpH6PsfVOlXC2s3g1wxa+R+6FkOAOPTifX2F1pn2YA1PawZDP5ftbXj9FgJLE4/oLSFgKQpuIZKEYsJLpKHC1Syl5w+M0uBR/aid1wTbnnd/5zn6VDFbfEVIToH270wiWRK8ES3heDM4cW1S3ZraMNivCNdRSVx4kxUASvz+g7xhTnD7eftnwWlG2DrWJkp/3SB61kWjMTvA+fMwSokM2nxKy84qwksBqXXt0Mx5A0GostpJlQ9kWTOLRISr+ZRuzvjhCQAhonTSo47kFbavh5eQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(1800799009)(451199024)(54906003)(6916009)(66476007)(66556008)(316002)(66946007)(6512007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(966005)(478600001)(6666004)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(4001150100001)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V2hDTk00NjNqa3VsU2hseWtscmZEQ1VMbUQwczZta3NYOVM1d0NueEZHOEl0?=
 =?utf-8?B?RGlzdWpOM1FYRjRxTWh2MVlQSVdnQXY4aTZPd3JRYnR5WUI0MzBsLzdHWEpu?=
 =?utf-8?B?eG5NK2dtSkhyZlE1Smk2M3BtMVBvY1kvek5TSXJnUGhDaWVGOHYwNnl5Mlpp?=
 =?utf-8?B?VWdPd1I4Tjc5TkY4QUZJWENueEFGREJOMDMwK3VTSUxETEJBODlyaUJGeDZE?=
 =?utf-8?B?NjFMNlFmV3djaDVTUnRjMitRQ25WOGVqbUVCNVJaOXpEajhTdkFaWEIzYnd6?=
 =?utf-8?B?Szl1Q1RtWkllQXVqSENQT3VLUVJwVUdvdERVNHhGRnAyYnBMVE95TTBUTkcx?=
 =?utf-8?B?SHMrdVJnQUR3TmJ6ampYdVVlODFUY05Sd1Bwb1JYWUZMS25mVjRoMHZ1THMx?=
 =?utf-8?B?RklGM3MwMjd3VjdaSEpRVVI2UTdJdzhGMEZKaVJJcldKVjhNS2taOEhlKzdv?=
 =?utf-8?B?NTNmdzJuYzVpeWFBVEtncngxNDBZTWdTU1llOFdQSGJRTjk0eFB4RXp3YUp1?=
 =?utf-8?B?KzBRQ0plcHlDZE5zVHdIa0dHUmR1d0d2b3NWVmczeEM0emdXTU5CK0xtbG5s?=
 =?utf-8?B?VDRoSlZEQXlaR0RLdWVpSElEakkxaTBzdjhaWGhwSUlKSWd4bEtZNnk1Y2da?=
 =?utf-8?B?WHVGTmtnVzRVdlVyUnBLdE5JTGpCd2F4SmFGRWpPcGh1ODFlMFprSHVEbVJm?=
 =?utf-8?B?Y2h2UUpJNDJaNzFnV0tKZmRTOUM5UmxMRXVxczZQOGRrWGVsT2NaZ0xmK1ZC?=
 =?utf-8?B?eGdnN282eWlsNFE1ZGJQV1lna1d1NjJ4Zk50TklmWWx0aDdMdVZNY2hRL29q?=
 =?utf-8?B?UFhHOXd4REJIQm1CTDhaVnZVYnZNTkJWYUVMWmR0WlR3WnYvY1FUMTNmcktL?=
 =?utf-8?B?eGdzbHpqV0M0TURWdkFFTFQ0NHFvamdVdTF2cndCMktpVU9LYWZUMThsemRj?=
 =?utf-8?B?d3dKYW1uYUdKUHRWbEFraGdvS2t6QTVRUmpDb2d5ZjBoZkRKWHFwaThSaWlu?=
 =?utf-8?B?MlZ1TDcySkI3MzdVaksxL3NwUW8vcTdzS3o2S3V6TnZIaUQ4QXVaTkxwMmRy?=
 =?utf-8?B?cEZPZEtVejAzUG16cmxNNDIySkNoNU1tSDdZQ3B4UmlkOXczMnZESkcrMXB0?=
 =?utf-8?B?djdnZXJEWFYrK3pQL1pDTEliVmUrbGxyQmx6SXMvVEJLTjVKNXRTMzFJaXdV?=
 =?utf-8?B?Qm43TW5wZC9yTzU4VHg4ZEtKclpkV1ZUTFo1ck5hMUZtdlNQak4weDZHOVlR?=
 =?utf-8?B?Yll5R0lUTDlGWTRhOWh5dFJEMDlmTUNxQ0NwOGRVMVMveHpzQjU1dkw5d25W?=
 =?utf-8?B?b3cvZW45NHpISEhPMTZlK0tjM3d3bGdBN0xpUHBJQ3V5d2phQzlENHJ2RmZ6?=
 =?utf-8?B?eUN4ZjdmWFJHZnorNE1jQVUvNW1mdGUxNDcvbG9kYVNML29UVm9WYU0vNzMy?=
 =?utf-8?B?dGVrQXk3VDN0d1BrQ0hqN1g3dWV6WU5yTWtDbmhiejR0ZU9KWkh4bTZMKzlY?=
 =?utf-8?B?eERCUDB4WEs5Q1gwT2ZyTzhGVmlGSndxN2JCcGpxT3JNTGZGZkw3VDkySzRz?=
 =?utf-8?B?a3ZEL2lpM2hQTGxpN3p2R3ErbE5jaWlPZTVmYi81YjZVYklXSnZONGVSWlRK?=
 =?utf-8?B?K2JESWNDMXhwZFBhTHlnN3NQdkkyUmRZZWVGU2VoTkJTMEhkQ3ZUdFpSN2xl?=
 =?utf-8?B?RnVpaW41RktJS1RmVGJMOEo4WElJNlVWMURRTEppRFQvaEU5NUl0TUR4eENF?=
 =?utf-8?B?TFhtelI5Q2NPUGhSL2QyNzlTUEcvWk94dkMweXU3QnRmODk2S3ZnemdiZmRL?=
 =?utf-8?B?b1hZdi80OFdxWWlHaUVYRS9qSTNNeEE4a2xRTk04NDh5Q2tKbytBa0pvcG5x?=
 =?utf-8?B?b2Y0Z3ZtNlhBQWh6eFZUTHg4dXJXVG4xaXNrcit1QW5BNDVQRTM0NlA1N3VX?=
 =?utf-8?B?eWpOVTFqTFR6YVo1Wk0xbnM2eDRHMWVyUU1VT0N0QzVpMzVzbGRSUmJTQkwv?=
 =?utf-8?B?b1k3WjRibHFESkxtbVkyQnZ2aXhtbTRQUGhDb1RSQnBuWE5kenJsQk93cWU5?=
 =?utf-8?B?WVNlVTZ2YmN4cmxXWjZ0K3FNZEF4cUEwckJSNGMvMUJXbWVMWm8rd1FPSWNi?=
 =?utf-8?B?aDhQMUdiN25xZXRmWlhRbUhEU3FnQTR4dnZQUm9CcE5mazVrOXRoYjVWdzJy?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	mqbghH49AOdQM/c6cWWpVFyEvFaIx7xtjNf56mRmTRHk0X0VS1qtKuCHyCumx94EP9npkbJBi3wDlukW5iaQAFEw8wgZ/C9eu/KEUuqAkz+pslieV/C6p8SSDnUCJ8vHbcsuJf9uh55QFFch8RQSM5gx2MoklT2aEqUZXw9fX4sDtXGDuZNSny3ijKwVV2D1jw2simmrXEpgdQDMr0kpEAm8C+nkPKrv6VSq4bGWwEjKg0OFtE1ItjvPcoEDgdkCqnWoL5ueskNzuFtnQ6DfzMeSVRjNJkYh8rItPmq986nlb5MzJ6VC7WNlOXWx3/FDCV+kvO0zSdxXcjYEe5PYN1tK8wb4PyDtKMA0O4rtsBecuGZFgXtLkmjauFzDxOIbvRJpOIrwNf8hXzH8A9KQ7UVkWLom8gqqaP054AcR8QgH70orQP+AJa+Pq796y5AOtSva+Y2E9l41XYtVO2JuOj24rOH4WKmsjo4nvt1+Gz6LoxvrPrmMDkAdxxzoR9UQWrPTH5dvf1NOaqEV/PHhqJWqgwXAtQGTmxUWEvdyIk9sN+Zmx6o4xaiTdXWERKhNkw2lcOsQP4e0PK+vSVNTDS7TonsX8yq6h1X7vDIcfHRBXSqLIuVu9lxcmZGGq33Ebws5XZux6UiuI8JUQQXDyR8F1SoabghtW27vSr9miduthulId0UdshilQdG1kpBaQGd5nRq0opimmrDW0J+T/fq2bFcu8B4URrtYP3JkL5yYiG8woKWGLn9uVuf19FYFo3k4j/sNY2y37vdJ6QaL42IkRgOVY6AWDtm7B2Vvuun/UXWYvQUaqEmyPPY3Bn328po4znm4QFmeSAK3kx9I1nfTv3sfZwHqU0htfASH5qqcA0wL4F8+314n9vcjjxxFqWaNHXVTFIv/lXV+rNp+PA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e6ad7f-8280-42c1-c622-08dba270bb03
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 18:02:06.2768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lLOhSI2Hzlrb4WhR1RNbGoECwYkPFSaebr7BZUeTkppu/crF9DOTnF/6NsKfkkFBW0OpGdF/KxW4JMlKGyfawwr4Oghq+PpuezYAw0bjQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4245
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-21_07,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308210168
X-Proofpoint-ORIG-GUID: 8xvfHJfBNohN0MH_No8-BZ4pLfRwD5kA
X-Proofpoint-GUID: 8xvfHJfBNohN0MH_No8-BZ4pLfRwD5kA



On 8/21/23 12:01, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   47d9bb711707d15b19fad18c8e2b4b027a264a3a
> commit: f59d77dc3eea31329e70dbc9ba6fea9faa24829f [10295/10848] x86/crash: add x86 crash hotplug support
> config: x86_64-randconfig-r024-20230821 (https://download.01.org/0day-ci/archive/20230822/202308220012.gipltORx-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220012.gipltORx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308220012.gipltORx-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> arch/x86/kernel/crash.c:232:12: warning: 'prepare_elf_headers' defined but not used [-Wunused-function]
>       232 | static int prepare_elf_headers(struct kimage *image, void **addr,
>           |            ^~~~~~~~~~~~~~~~~~~
> 
> 

This has been fixed in a separate patch. See the thread:

https://lore.kernel.org/lkml/2dac3bf6-dc57-4e60-ba82-f3eab73e1d5c@oracle.com/

Thanks!
eric

> vim +/prepare_elf_headers +232 arch/x86/kernel/crash.c
> 
> dd5f726076cc763 Vivek Goyal     2014-08-08  230
> dd5f726076cc763 Vivek Goyal     2014-08-08  231  /* Prepare elf headers. Return addr and size */
> dd5f726076cc763 Vivek Goyal     2014-08-08 @232  static int prepare_elf_headers(struct kimage *image, void **addr,
> f59d77dc3eea313 Eric DeVolder   2023-08-14  233  					unsigned long *sz, unsigned long *nr_mem_ranges)
> dd5f726076cc763 Vivek Goyal     2014-08-08  234  {
> 8d5f894a3108ac7 AKASHI Takahiro 2018-04-13  235  	struct crash_mem *cmem;
> 7c321eb2b843bf2 Lianbo Jiang    2019-11-08  236  	int ret;
> dd5f726076cc763 Vivek Goyal     2014-08-08  237
> 8d5f894a3108ac7 AKASHI Takahiro 2018-04-13  238  	cmem = fill_up_crash_elf_data();
> 8d5f894a3108ac7 AKASHI Takahiro 2018-04-13  239  	if (!cmem)
> dd5f726076cc763 Vivek Goyal     2014-08-08  240  		return -ENOMEM;
> dd5f726076cc763 Vivek Goyal     2014-08-08  241
> 9eff303725da653 Borislav Petkov 2019-11-14  242  	ret = walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
> cbe6601617302b0 AKASHI Takahiro 2018-04-13  243  	if (ret)
> cbe6601617302b0 AKASHI Takahiro 2018-04-13  244  		goto out;
> cbe6601617302b0 AKASHI Takahiro 2018-04-13  245
> cbe6601617302b0 AKASHI Takahiro 2018-04-13  246  	/* Exclude unwanted mem ranges */
> 8d5f894a3108ac7 AKASHI Takahiro 2018-04-13  247  	ret = elf_header_exclude_ranges(cmem);
> cbe6601617302b0 AKASHI Takahiro 2018-04-13  248  	if (ret)
> cbe6601617302b0 AKASHI Takahiro 2018-04-13  249  		goto out;
> cbe6601617302b0 AKASHI Takahiro 2018-04-13  250
> f59d77dc3eea313 Eric DeVolder   2023-08-14  251  	/* Return the computed number of memory ranges, for hotplug usage */
> f59d77dc3eea313 Eric DeVolder   2023-08-14  252  	*nr_mem_ranges = cmem->nr_ranges;
> f59d77dc3eea313 Eric DeVolder   2023-08-14  253
> dd5f726076cc763 Vivek Goyal     2014-08-08  254  	/* By default prepare 64bit headers */
> 9eff303725da653 Borislav Petkov 2019-11-14  255  	ret =  crash_prepare_elf64_headers(cmem, IS_ENABLED(CONFIG_X86_64), addr, sz);
> cbe6601617302b0 AKASHI Takahiro 2018-04-13  256
> cbe6601617302b0 AKASHI Takahiro 2018-04-13  257  out:
> 8d5f894a3108ac7 AKASHI Takahiro 2018-04-13  258  	vfree(cmem);
> dd5f726076cc763 Vivek Goyal     2014-08-08  259  	return ret;
> dd5f726076cc763 Vivek Goyal     2014-08-08  260  }
> f59d77dc3eea313 Eric DeVolder   2023-08-14  261  #endif
> dd5f726076cc763 Vivek Goyal     2014-08-08  262
> 
> :::::: The code at line 232 was first introduced by commit
> :::::: dd5f726076cc7639d9713b334c8c133f77c6757a kexec: support for kexec on panic using new system call
> 
> :::::: TO: Vivek Goyal <vgoyal@redhat.com>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
> 
