Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B8E363
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 01:08:28 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35MNLIED005713;
	Fri, 23 Jun 2023 01:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2023-03-30;
 bh=wjY6305rprFWastNptlqyNPnDkmDtL43QCDiItr9WwY=;
 b=FDXr3eUP7UPG2Dj/LKpBF+YkcVdQE7omTJGQbw939sFicXkdBktQO4B+oph3sFbTsHqz
 /jD10RagFplqnFX/BCgIJJZudii4+8HvZ8fQEt8b7zivppTjARVv7boCfyoIr68AJUGH
 rVXhv6OrjB8ZNJNhx+mWOtRv9NCfeux4WA3y15yOH20hIKcf3mF+DWkvsYJh/zYUsSTM
 F0ZrrOj4e6n9GbQSsc9p7ziox7pDPYcX1DjA1VafMJHLkjQ+0fQOfIlfEYgDeoaHfelv
 DV3uIWS0wGz10ltEJlBKijuDoArjmuc2a6iWTxclyDAAAqkp2C0J5l6R/0sqB55gpyLY Dw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r938dtyth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jun 2023 01:08:16 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35N00GwF008279;
	Fri, 23 Jun 2023 01:08:15 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r9398maq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jun 2023 01:08:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7vmYkvvCeTshAUCW8XG/9ZEZZp9h4nQOjr4AtTA/WxA2P/PPZNQDRj9c3B94wq/kBqdEvXdq/idVWaQpDRV7K4gJtBch2+mQHRcSsYQ1lRRv64R/PWB/FR15M7Xccu0jwEPnGW6PupAfMPyq7Dwbe19Uk9/bfTi+nYIATsjPhdmBQZAnuFoSA0kKCpKfim3P5IoU8CEGQ5l4sHT3Gj5rZvRmA8obw3XGx7eXaZCOJrKP4ZpiauPPIE989LBjJDhRgL8fFYu5f3Ruqc8xfijlxAdcuc2rufElxSikGmZPCluARo9QgjuewyVLZZMwPUauyuexGRsMJaVICi22WegGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjY6305rprFWastNptlqyNPnDkmDtL43QCDiItr9WwY=;
 b=ABkqfSLk6YDMqWZI+ON9pBm8hqCd97i+CZp53qXhaiGh627XNLbBQW4VAQbFgMlqwqaHfrkZsC6BXgR0Of4s/LJZRr4fw+dJ+CBLpvAXPmZwvi39Nzm1aOc8bziahM4K35YNedAH5EhRzeCXKDesDZiSmbvMaNhLlETg+qq5MUm2EXd6EcN11WYzSZcQntuAYvl08es1SYfU7LJziYVvvdpkaO6UIm0uSVmN2ZQ7Z7zi/8lNCFjtSt89vNa3mNP/9F/Xt5RWqeAW6pCT7tIWfug5RbRKxEgc7gFAlLNHrbylRATcFlhC3Balm//dAv2oRfhMDp56ZLSImea+F/aifw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjY6305rprFWastNptlqyNPnDkmDtL43QCDiItr9WwY=;
 b=lDYJsQogUQjb2kM77fYRxcVwPxP9uKWJ5sGB/TqJAmLX6ckVpqI4KK3R6Ruhd2XpLhjZEr/uXNCtgKzqflwHfJl2C4SYB8nmPmsH+VXtwMF60CV12RVj8DsLLPAfap30tIbvmQoPDXeNJ9BEF7skrys+pvVRCkXox/5hNNSol+8=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by SA1PR10MB5735.namprd10.prod.outlook.com (2603:10b6:806:23e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Fri, 23 Jun
 2023 01:08:13 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::b77c:5f48:7b34:39c0]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::b77c:5f48:7b34:39c0%7]) with mapi id 15.20.6521.026; Fri, 23 Jun 2023
 01:08:13 +0000
To: Mike Christie <michael.christie@oracle.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>,
        "Martin K. Petersen"
 <martin.petersen@oracle.com>,
        Christoph Hellwig <hch@lst.de>, Hannes
 Reinecke <hare@suse.de>
Subject: Re: [linux-next:master 211/11867]
 drivers/target/target_core_iblock.c:892:30-35: WARNING: conversion to bool
 not needed here
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1r0q3ouk0.fsf@ca-mkp.ca.oracle.com>
References: <202306221655.Kwtqi1gI-lkp@intel.com>
	<5faa5807-ec8f-fd8b-6a86-95cea3728ac8@oracle.com>
Date: Thu, 22 Jun 2023 21:08:10 -0400
In-Reply-To: <5faa5807-ec8f-fd8b-6a86-95cea3728ac8@oracle.com> (Mike
	Christie's message of "Thu, 22 Jun 2023 10:34:13 -0500")
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0208.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::33) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|SA1PR10MB5735:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ba3f5d-01a7-4ac0-ceb5-08db73865151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vPmnrpUkMH5PMoI45sZPKGkhAowwzMKpkrqUaj65zOs3y4ped/1hFxspnVNGst/Z+wJ9hjpQSu9z7RrVstB/Ac8NhlCqcXJfbhWqRJ67WX2C23+ZPcWove4aGh7gmAe24vH1Bqsbh9JKz+fzWQ5/jfnPaXxZpgNSxhr26PhMdvAj5Y4JAe+nK8BlcyvZqZkI4btgbRMVnhwktqVitHVRX6E5LoWzB+HPDRwbWC3SA8GjQ9ZKRNS1NUqmqNTgdFEz7IfZDwjKlVumxd+35XUSFEFw6Nhq1ct17/4P7XgoY4iBtIxdfompebfEufUOSaCAtnoSMqfz2wjNWRvmS9Hr29T/JrTVc+YFF+os1GcbzrkH7S9IBZl0umxYf3/p/FG6ogLl40G+zsVi60k3f/TyCn9w56ZIr7Bz60aFIjTZ1Cc+pn4NrKjkyBdEQ6UsgiQrOgywho2yZPqUABf756uenhB6us0BrnQBFnX5L7whn3Qzo9YAgdV7HiYa1w8hxg8oEmkN72hn+6ub0e63SmWRcSF3o1Gw73Pf+1oE3WrffQNjfFWEULzCjG0SbTM3lyrn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199021)(66476007)(66556008)(6636002)(4326008)(186003)(26005)(38100700002)(86362001)(6506007)(6512007)(36916002)(66946007)(558084003)(6486002)(478600001)(54906003)(2906002)(8936002)(8676002)(5660300002)(6862004)(316002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WGpN2o/82aLOCw6VTYlEsL6mbDvAWB36egT+v1nQudGylth3DSgKVNUoCbH2?=
 =?us-ascii?Q?lWihhxHut4w1aNBB3C8PHHjNKE4OXmFOq+qrbZj79A6ORK7+cHl0RODx6oMc?=
 =?us-ascii?Q?vBxCZ7vqfOkME3SqUxEMvj2F6nYt/Bzr5RDk0gLaALdN2LPlf7laUkzr1U0a?=
 =?us-ascii?Q?fRGrFMM2sJN1Pkl1ouB5dflXF8GNVedks96CLg9Bz03ZWIscDr/JP1K5guuM?=
 =?us-ascii?Q?UF1riB2CkStH5Z0IDCNHLGZt6c20ER1n6Niqudp1Te32odrhIKVCAZ127gb1?=
 =?us-ascii?Q?/wNOfhyhLfH9Z9pkQpXuO1xHW1pz9JiOfj19T1Hz+W0BIKhrYph3UObd270x?=
 =?us-ascii?Q?MoNNCux62J0twCM7oKRIeBdkqWg5hcdYYYmgu/xCJtYSgJKdEj0LnT1mHVgl?=
 =?us-ascii?Q?kHmyRGFDBUL8dvEO3Fsk+lTDJ+d5Fh8aqEMqNOzrKCoZ7AYYKiVD+jZyc1Xi?=
 =?us-ascii?Q?3XKLZhVJBNqwS+Rcm9613db/CQ4bgSecN9vsAUGgGrt4MnN+KkNKeCW2BPAH?=
 =?us-ascii?Q?g4Oxp49z0HB/PGrLcEMLtU5WkVxumXZPRZn6nwC2qXLPee6R58UuMXJIq00f?=
 =?us-ascii?Q?izxO2mo0yn7U4dEpbGLzeaLNHR43LOfxY7uH9oxhnNR3+kSeSWbXeZdKwSGQ?=
 =?us-ascii?Q?rjhwg/Omqk7bKG45oHG/pY61uWfbFLfhjKMw8U72Y/IUfAZVTvqoeYglSrh1?=
 =?us-ascii?Q?+5wjWtVC0+Uklata+9n16iLBb0peo+Iu3I+TrCmTXWaHJpeqHis0JX2PNwL6?=
 =?us-ascii?Q?e5UAWKkDXV7m7lCBwhApgtrMUPgS0uQEov/Cr65Va9A1pBp/8OdKakkFKSqt?=
 =?us-ascii?Q?SKzpCSmIGEHHAaotKBjJfROC6Labt/HJoop2vw5DxUrsbxTcBVIaNzoLltqx?=
 =?us-ascii?Q?r/C3ixhxpaJNLr4CeAYY8HoQKz+EsOEM5YZb2sgXmgxiKEqiOGDn3hahlg6y?=
 =?us-ascii?Q?nPw4aI0hCKN/4B1s8JoaeMyJ7GScyykB86uhftRcESv8NdVU8vAbfaJu+z4Z?=
 =?us-ascii?Q?eu0Bbe1CnVmyuRu6EoZ+A0ZllSp8A4LopynPp/553qaip9XPjIuxUmSS03Mr?=
 =?us-ascii?Q?ob4uEcOL0eU/eDJGtPfJ1sM8nBp5K8qkxqemCFy/A/q+hL8+fGClIEo9yxvK?=
 =?us-ascii?Q?oRKbTniuATs4LydEAIs76BuXyr7Z16EItOQ1RlweVhFt9CPp3kxNzCSu9MuK?=
 =?us-ascii?Q?w4pSPhtRrV3Pg0ABJORJQCkEITOq0vhYpuX/CYIdwFQvG1RFM80reG2/b8y+?=
 =?us-ascii?Q?zOfzFLX3yz0IODRtcjsIRREUyUvOfXUUSlLwcKqgsfH2fR2ocwlZFil/9Oh+?=
 =?us-ascii?Q?+8a/Qiul4X1bShaYJdKYa7zvDE+Q8eEOpEdFF4EhGyWA1h0E0uTRdIu1Vl6H?=
 =?us-ascii?Q?5NGuaJ9oEaA6Wn3zqhq0ilxmQtSGDuQ8Hz970+Gy7prMmzTM6uQhoa5/x2E7?=
 =?us-ascii?Q?33VB7U3xin8KbquU05JHTlfTzkIerEG+ao5lVAAMCZfqctTupvPytI/ABHJ6?=
 =?us-ascii?Q?enLKd3XCv04+HlcAVPU7hBvipj9qIrqL2/xFVaEO98ZLU7A0rNzBoAOPAohv?=
 =?us-ascii?Q?rcIMu3A0qdwV3jHs567GorMucloXCrybBVcEHoM909g3EBOcR1BGDTGzuL3Q?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	HK41CC5d38DTwhLbD5Eoxjvb/mxFrEg5Id3tffpqAlxT8RIL4ZNIHKqwpOoLlH2giqJ0a0d9kowgc5Ci63kADC5YExWdrJfvHsnVIEM8CQta0DTOh1kVywQ6sshGdfmGch1lqA5lFROHZZ7vHU6pNTjxKm3mw5ZJWUgaIT4PHYMC4AlE2UzCJhVf5wwNN61zMPohSbOc6BjRf+qtD+PJdygYnymCXu9lz21ue/UacEPCD2eiWKv01ClsidikJQ7PiQ8zGixwZE8YmAvK5faWAQITuE6BHoxC6AbKvc3Q1CDjOrlpySRYJA/hW3IgcCfwyVgO+sYi/tXodeRRvsOdTaoBJcXyx2ooBXp5XLJERxAozC7KRz2Jzl0OwdrpMmTsOplf6ZBq2WmAhlpuI+NptN7wd6W0qTaWlsKqnB+bUoy2KFcmgFhFuGAo9J6HKhN0uEXiw8Dj3lsS881Uhlz0ANbnAuxOHbNxUv3KDBputAOtKL+/nUSYBl0GlSoiW5y9H3C+34iJKJ/WhanQfBUCzrFbEc+Mc0Xyj4p1jTr2sP6gfCEKjLw4C6D9VlfDmdYF+v0E3A0hpXY0O1c9eSpzzPnu8viIyupW5fjm/UmiMiOpMtdDaTFHRnBzRW0/K+iHMxdgMDTBdo9Id39bISdk5TVbLSwGvNRmXMiGfvhjC+bTtqX5GPbbT5hSZhOm+ZfDYmYl2+Sffh7tkNv6ipkURiYixSiGTGElRc75JFTHiqsMldUbn7tdXvzaPouh2SHWTZudh30EFZM+gto0Xi0tbCMOAEdMNY3WJ4I6Kw7eO1XhgAnySDG/ZjsmLSOZKquU8zBrtFuStLkl8EcaszZQSFr5Efb+EpUbRbWg6IU3gcI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ba3f5d-01a7-4ac0-ceb5-08db73865151
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 01:08:13.1189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+Gu2PvN0AlfTN3wgtl5/aJ436IqblEzwvrouL7whCvLlYJCQ52y6EehxzyrVc8BCMgrx9kHM3wco3vrkdczSruPzW4qI0cb1c8znmYb7pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5735
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-22_18,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=725 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306230007
X-Proofpoint-GUID: d65ggeWepZGs-u_NrPb_DT2MmHltgYNA
X-Proofpoint-ORIG-GUID: d65ggeWepZGs-u_NrPb_DT2MmHltgYNA


Mike,

> Martin, do you want me to just submit the patch below to linux-scsi or
> fold it into:

Please submit the incremental patch. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
