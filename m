Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D295379D5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 15:32:01 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 363EndK9018359;
	Mon, 3 Jul 2023 15:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=q6TtHkttASPuEAJYVTyi9rJVUSfC93zKrqw0hMTsBYE=;
 b=MfYLv2dRlDFqVWYp0X45qo6FrFVat/4n8lbROrgt8MqsLB9RvF2VXCF7i0Q9Z5T5Gpod
 b5GGL/F9TqskrlJAh5Qe8dFnGmMALKqpw/DKaUxBBqRZH3GWfTBlxxQ4rPeYyDtszz8T
 MrAlYrBDQqcJ9LPuAWbOEigVhAeTmSf8DaQTbT5z0BcxeXpU+Q749Z0fgoUy3ghasqH3
 DkNx8iZYK0daZ55puLh1jicBzVT/qWam1Zrs2phoTq/xqcrYsqR61/yf6RQfIv1UqHsA
 fHnmwqCQXiyd1FeVXVlws3vWlVRA/eUocmtro0CbG1KckXZy6luwB96r1rY4B01yh/za 9A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rjc6cjy3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Jul 2023 15:31:44 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 363E0tow004176;
	Mon, 3 Jul 2023 15:31:43 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak3qgfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Jul 2023 15:31:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njZ5SBrZa1+293sj4uGLKwgDj2MOOqw81NvKjP58r+mi7bJxvW7H/vhccISq1BlI/L9Lx3+FKNRnkNkWve/X+kl6qW7JRzDNlXP1TgDbHknh3+nwMTk5Wk2cfT/YyKi03SRLfWrPUr037TKJ1SmMOIk5/3WwF3cD6rrgcUwokd8cJaxUu9Nt9fhNgC/uZL9y5jwXXtDn+7Q/tSy8gjjMX3YSVqAhzdDg4qyRq+ZlNCZdZUhhNy7ofrT7PJUK4IllZzcNDBEYf2n3mZYeCbXLHo60x4Chng4MFwKjX2pFjvKQjSvmsVA/zwjJLSK4IzxtZvGMUZXnvr1usXNhtQTwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6TtHkttASPuEAJYVTyi9rJVUSfC93zKrqw0hMTsBYE=;
 b=cYZ7vP2IcbAH9zaz66nLn+n9yKLamcJofaHfI1u4395g1mGmloUzWjTBSrtNX2O6bfcdKxoRSLZx83n4gn3H6vaMSTTucEozv1MDw3ZaR7zeq8PxJHDZcoOoOj5c5kkuMU/V/N1jf5FT5SMzW6wePL11Q1v+k5+uSo41Pgkgsnx0RkZ7aDv8hN25It957GLWfzq+lN1fuMSSoLALLiPl1K60Gw5cmfbAxM11/wtnCkd5V7bpuzknJyeN6YxiNf0IYBguTAu1/m5ll8MI5epG06/R5FbQ9X2v09yiJoCI3xtrgjvr42iOzhFlDNZh9UKIJuIhCWGopOqTtZ0euMD49A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6TtHkttASPuEAJYVTyi9rJVUSfC93zKrqw0hMTsBYE=;
 b=hIdgHzpyZCKr+ZEpsYpEaWnq0Rwy9/E/8GqdSYmvXw1ZbPKcyD7695ggRwG1lekAsfQynsxvAuADyKUNMadSNqKg6stRo/UDECkr5Jh/4jbZXri01nmASQiGdWn55NT0wT3rLwtiUg8kZD+Ng5Hy/kesVqyfc7qhH4Fz36c5Brg=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by SA2PR10MB4746.namprd10.prod.outlook.com (2603:10b6:806:11c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 15:31:41 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 15:31:41 +0000
Message-ID: <3e8eecd1-a277-2cfb-690e-5de2eb7b988e@oracle.com>
Date: Mon, 3 Jul 2023 10:31:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [akpm-mm:mm-unstable 62/89] include/linux/kexec.h:41:2: error:
 #error KEXEC_SOURCE_MEMORY_LIMIT not defined
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Baoquan He <bhe@redhat.com>
References: <202307031404.Mjmo2JK6-lkp@intel.com>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <202307031404.Mjmo2JK6-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0276.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::24) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|SA2PR10MB4746:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5fc360-c4be-4f59-5b5b-08db7bda9959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QsTMZFd70UGDCdo2donMr9Bc2yQ26McLu+q1hoc43eGNLc/Yz6pmE0bpH7CUeRW5t2bTv/r5al2hY0h4M0azu+QfJCfRxZjQ/qqZd73pt8y4xSyiRVW3cVOgJvSGIz2VVj1SERGQ09bQWe9U1H4l9R00+nPnR4lDlB+TNelnnCuCsCrlEa7Ba4tznTetqvFUw5fharzQgfzo+fqtqHI93zuwH1zdNu9J5tBVpb36PvpipgP/2AVxbd88fwLvwhxBj3aOHI7t4ZsY2df8itzWyVGlc6dMMqnDcNkM6EEPikpyvLeUFDUs/gPuGkA3jr96EKCbztG/ss1eGsRJz0V3Q2ZgSIsJYsce2IdRV6+sfcFIZsjhz8VidImi0oE3HjME2eyjBh/k9cjqK6zpHy9IG98UpkZ+VcTKQUQXr2wJEppq6UXmeL7CpnnQd38KLKFk21xTlhCryzdQI+c0/qPF4J3B7T76GJ42ROhC8SCJh7v6Uir6CvS3rrJcK5vkDNu4V5cbS2F2gm9nP5o6SD9dy1B1SSDeI20piRhocOh1FVbwIiU2WN9aqRKdVwHfbP1tCMr0SW+udNh1eRuWBZ5Mr7FM8e2ZjalHfPqkkweNgiY+vW2fhnwb2oOCE/AZ/xxA9HN3Mb/vxz8KwzddM37jOA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199021)(4001150100001)(2906002)(41300700001)(8936002)(5660300002)(8676002)(36756003)(31696002)(86362001)(186003)(2616005)(31686004)(478600001)(26005)(966005)(6506007)(6512007)(6666004)(53546011)(6486002)(316002)(6916009)(4326008)(66476007)(66556008)(66946007)(38100700002)(54906003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dXZacm9VYU53cHhQRU9FenFNWC91c1BObk5tbGdYRzZibW1uT3MzU3M1UGd6?=
 =?utf-8?B?dmk5ZVlBWHBVQ012b2UwYXBXSmRDQUswMExDWHRwZU42SDN3VTBJOElUb3Nt?=
 =?utf-8?B?Zy9HZGlTT0trcWV0R0QvRnkweCtLZEQ2UVNsdC9XbGVUZk1Nb1gyeTlDQlpB?=
 =?utf-8?B?TXN2YVZKODdKOUxXSzlaeDhva1VaWGF2WlJUSm5uOHBzaWdaalZDMk9rbjdR?=
 =?utf-8?B?TDRJbS90MWJucnBWTXpIMzErNHl2NEQ0VEpWWmZEejJ6SUdUdnhQZGVtcWJt?=
 =?utf-8?B?eGxOdzJRcFpObGZMZHNtT3huNFN6eDkwNlN1UEtXclUvSTFMK0s0aW9ROE5R?=
 =?utf-8?B?UXJlYm43emRlSTlTY2diZlhDemluaWdTU1VHMklaZTB1cUpOZFFnaG5qNVhy?=
 =?utf-8?B?NGF4MW1RbkxpSU5vRzdZTk5FLzh4akF1UUdzem5SUkN4Qy8vKzBBaG9UNWk3?=
 =?utf-8?B?WGh2aVY0clpBRnc4RXhONFdZMTFjQjZObDk5OGFYQXZ2RnYzd2c0cjFWbkpY?=
 =?utf-8?B?aDdWWm5wZFVNclo4bXNTbWh0NzNUZGVBVHdkVlBtWk9HUnRodVEwM0pZNFNr?=
 =?utf-8?B?TEpTREhnRWNxdkFIRE5qb1B1eGN1aVJYRU14RGZhbSsyT2RTcEVYWDdEOWZz?=
 =?utf-8?B?WW9FMUgrZFQvaWRCUFE1MWZkZTVvRTd5S25XMkRhYUVocGhYVFEzMUxWdG5X?=
 =?utf-8?B?c3dkQ1BhcHlBNG5SdThlTGo2QlBQeGM5WTFJaSs1cVQyd1ZRU0VmYUNyWGpU?=
 =?utf-8?B?VlRub3h2Q0pUZEx0OUQrVGZBQ0ZrMC8xUHI2R2NSVFM4ZC9sMnpjZldwUGdH?=
 =?utf-8?B?QjZIcUo3eThaT0wwNkYxVGVoZm5taUxBNUo2Y3BpSWRJUGJHNnlxZ0JvMW9H?=
 =?utf-8?B?UFFJSDVnWlRWUXpUUGoxbXF4bHpaa1llY3JPZnFjWmpGekp2UDM2Wko4YlRK?=
 =?utf-8?B?em9jbmNWR01ZcTIyNFV4NGs5UmVBUXpaL1FvS3N5aFN2cTlEZWc2THNqTnhK?=
 =?utf-8?B?UFFZamo0OThNYUNxRkpkTTJkUHJyYlIvWHZMaHJpdXQxbFVoYXJMa0NzdWZl?=
 =?utf-8?B?OTl0cnd0Y1lTTjgrcExpeC9Ic1FOWFppY21oT1QrdEpCVUdBaEZPVDJNOWdl?=
 =?utf-8?B?SHlIQk1BU0NoTC9DOTFJakdiM2RWU0Fsd0thQjQrRzg0bGJpMTFZVlROV2ZV?=
 =?utf-8?B?R2VPaXE5dWtHUjhObHVTR01zT2RkcmRnaUFObHZNZWRIME9iK0lOMm1GaHc1?=
 =?utf-8?B?RGc2bDh0VituUnFWbXczTnE2UWZFNE5sc2lDbTh0SytCTDg3dmw1WDl1b3Vr?=
 =?utf-8?B?YUlRWFVsTnNRZ0c2b1R1Sm1DcWtHS2E4KzNMS2Y4WWNQSnhpdDA2MjNPSysz?=
 =?utf-8?B?UkFCbVRvazl2ai82aGZCeVhReUU0UWRjZjRhWkJuam8yS2VoLzRoMWg4a29w?=
 =?utf-8?B?dnhJMExZajROcVFuZnlVYzdBbG5pZlFMcllHM0tYQWxady9QT2tKbXBXNHgy?=
 =?utf-8?B?ZHlrZ3VNYlRMOEk2ZlRORC90QlhEMG1lSEFSYmVRTmMyY2tKQ3U0ZnNUMjFl?=
 =?utf-8?B?MTgrOFA4endNSXkxalA2R2NlUkM2V3owL1pDSmxhZ29MdzFFQTViV0dnZXIz?=
 =?utf-8?B?Y2lSSkcrbnAxb3hqTGYvdjM2bXllVENyVEpBbmhuQ0R0UjBQV1VmWG1sd0hW?=
 =?utf-8?B?aWpsOVZEQkdGdmRrQjhyaGJJZHd5Q0lCdURNOVBTU0l5V09wQTk2bUpGVjBy?=
 =?utf-8?B?RUx4Zy9mUUlMdUdnUGhNVnJWSWFvclZMWnc1eTdlNXhnZm1vaE5WM1dWZU5o?=
 =?utf-8?B?bThOM2ZCNmc4TXJwYXc2ZHpTRkFIbmJVa1RHdTI2UDZCc2tGM09HMGN4TTEz?=
 =?utf-8?B?a3pvSVNGak1QZW4zTUNlbzE1QW1DbEZRR0JUb3BtaGRxNDM1MWJtY1YydXhW?=
 =?utf-8?B?S0FFZVNhQ0g0Wm11SXlkejZCUXlyQnZYUHd2WXp6NDhWRFJRWDFmbWpoNFJl?=
 =?utf-8?B?Y2ZsUWF5b01DYXpGbTFwT21xTGpuL052azJ5bEJkaUJHNmxEN2ZTbVAxd2xX?=
 =?utf-8?B?em5vVERUeTVUTUlVeTgzRTFneitxRFNJODB5WjBlelZsL0tEOVVkTHRwS2tn?=
 =?utf-8?Q?1fTFzCpG7l2U64zujD+1lUjs1?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	8nGR8bBIYrNLRiUmmYV4AWZz3qK2t2bdt+fhVkEu/JoXusZ8/UzT7gefTZbOnzPrtCILGJ2B/vSo2LFvgU4RXnNx/Jvx+WVHGntwBJAUUqB1EQYBVe1zgXiKGyoTN33RG/QMvcOVHZLsK4LKr1i58i6uSCVtw9A0D/WeGqIovKm6Ri8OakAwYmA09vIWkFWzpxThSF+COefZLgdo4PIF4nVEzOgpZEOYRK4D8nf3IYdU7ssVzrp/mSfjoqvSpAp67Rlf9m1V+WapoKadO/2wqocxB1w4Q+kFOOwHfuAFUVbHPsyfH5r91DPcAoQ2iMU0q2SoIel6gXZrbGk7LEN2e/KgNibbqZKe2oBtr7auQZPngzO1zaD7wVKMEBiLdwpPcBE6TetdWulKwjeAQ4d1+3GCwDTZQEgt/N55MammVATKLxf/tuso1QBGQfBKnR29EaaJWZ3XmWzE581T/24kYJZ12RvD9trha7qZhZy2GrHe987GyI4c7GJAntRsVc+WLBF0yEDBlp9dCL/W7Z/8c0zmcSM/FlqqhK7awJBJ3YRcMk/eK850SpjiOJzT3dD1N82F2EgJrrhxE0j6q4b4cGXcjV7MC22SHjUnAZiL/7JqG6F8G3HjlpiILUPPMeWzOmXFpz943E0HnMKIv58Uxmz2HdIPESqKrv8Vc5qAPhU8ZBiL6w1KNk3naF+mnYXvcYiDlzLSpN2/BW6oSDI32/3dfOsDfsegbZmM1KQ/v2jazGldX7Jw2cL51T6iehkCaUkDG2RLcS73zHSP0gU3uIJK+ujt34k5lAbusgEZLgLruSokz8w9JYU5zuQFpoiWZym4hFOKfc94VvEhFi7z2453wrqvCgHDOd5UQlVo8jdeGaKg191L3FJU09PuHbJKIZQ5gdNB+2EMYryx7X2PAw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5fc360-c4be-4f59-5b5b-08db7bda9959
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 15:31:41.0233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGVxPTOsKDEVO2tqWSQrp2S9kuiN5vT2XoTstbTDrtrHTGgMkDrbUU587jxxTw3HIRU6usCe3OEN+qITqMk5Ae8/Qltpa3yaksbr34/D6js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4746
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_11,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307030140
X-Proofpoint-GUID: 8yZXcAIVFc87ZGzrI7NkrO-cgDKTV60I
X-Proofpoint-ORIG-GUID: 8yZXcAIVFc87ZGzrI7NkrO-cgDKTV60I

All,
Not sure if I should reply to this or not (so please point me in the correct direction if needed).

The problem identified here existed before this patch series. The problem manifests because the 
CRASH_DUMP can be enabled without enabling KEXEC. Or perhaps stated differently, CRASH_DUMP does not 
select KEXEC, and so they are independent of one another, even though CRASH_DUMP clearly needs KEXEC.

CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
# CONFIG_KEXEC is not set
CONFIG_CRASH_DUMP=y

In this patch series, I only sought to preserve existing behavior, which is why this problem shows 
here as well. This particular problem can be fixed by having CRASH_DUMP select KEXEC. Here is 
original CRASH_DUMP definition (notice no dependencies listed):

config CRASH_DUMP
     bool "Build kdump crash kernel (EXPERIMENTAL)"
     help
       ...

Here are three possible courses of action:
  - do nothing; preserve existing behavior as intended by the series (even though problems like this 
can occur)
  - fix it with CRASH_DUMP selecting KEXEC to eliminate the problem
  - do not fix it but document the reason why this problem occurs in the commit message

Let me know if there is a preference.
Thank you!
eric


On 7/3/23 01:31, kernel test robot wrote:
> Hi Eric,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   f30ee81787a5abee6c7c72b0fcc30d428319c449
> commit: c717f7a0e6b98a52da146e1c09e4c5d92934ca41 [62/89] arm/kexec: refactor for kernel/Kconfig.kexec
> config: arm-randconfig-r046-20230703 (https://download.01.org/0day-ci/archive/20230703/202307031404.Mjmo2JK6-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230703/202307031404.Mjmo2JK6-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307031404.Mjmo2JK6-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from drivers/misc/pvpanic/pvpanic-mmio.c:12:
>>> include/linux/kexec.h:41:2: error: #error KEXEC_SOURCE_MEMORY_LIMIT not defined
>        41 | #error KEXEC_SOURCE_MEMORY_LIMIT not defined
>           |  ^~~~~
>>> include/linux/kexec.h:45:2: error: #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
>        45 | #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
>           |  ^~~~~
>>> include/linux/kexec.h:49:2: error: #error KEXEC_CONTROL_MEMORY_LIMIT not defined
>        49 | #error KEXEC_CONTROL_MEMORY_LIMIT not defined
>           |  ^~~~~
>>> include/linux/kexec.h:57:2: error: #error KEXEC_CONTROL_PAGE_SIZE not defined
>        57 | #error KEXEC_CONTROL_PAGE_SIZE not defined
>           |  ^~~~~
>>> include/linux/kexec.h:61:2: error: #error KEXEC_ARCH not defined
>        61 | #error KEXEC_ARCH not defined
>           |  ^~~~~
> --
>     In file included from kernel/panic.c:25:
>>> include/linux/kexec.h:41:2: error: #error KEXEC_SOURCE_MEMORY_LIMIT not defined
>        41 | #error KEXEC_SOURCE_MEMORY_LIMIT not defined
>           |  ^~~~~
>>> include/linux/kexec.h:45:2: error: #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
>        45 | #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
>           |  ^~~~~
>>> include/linux/kexec.h:49:2: error: #error KEXEC_CONTROL_MEMORY_LIMIT not defined
>        49 | #error KEXEC_CONTROL_MEMORY_LIMIT not defined
>           |  ^~~~~
>>> include/linux/kexec.h:57:2: error: #error KEXEC_CONTROL_PAGE_SIZE not defined
>        57 | #error KEXEC_CONTROL_PAGE_SIZE not defined
>           |  ^~~~~
>>> include/linux/kexec.h:61:2: error: #error KEXEC_ARCH not defined
>        61 | #error KEXEC_ARCH not defined
>           |  ^~~~~
>     kernel/panic.c: In function '__warn':
>     kernel/panic.c:666:17: warning: function '__warn' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
>       666 |                 vprintk(args->fmt, args->args);
>           |                 ^~~~~~~
> --
>     In file included from kernel/kexec_core.c:15:
>>> include/linux/kexec.h:41:2: error: #error KEXEC_SOURCE_MEMORY_LIMIT not defined
>        41 | #error KEXEC_SOURCE_MEMORY_LIMIT not defined
>           |  ^~~~~
>>> include/linux/kexec.h:45:2: error: #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
>        45 | #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
>           |  ^~~~~
>>> include/linux/kexec.h:49:2: error: #error KEXEC_CONTROL_MEMORY_LIMIT not defined
>        49 | #error KEXEC_CONTROL_MEMORY_LIMIT not defined
>           |  ^~~~~
>>> include/linux/kexec.h:57:2: error: #error KEXEC_CONTROL_PAGE_SIZE not defined
>        57 | #error KEXEC_CONTROL_PAGE_SIZE not defined
>           |  ^~~~~
>>> include/linux/kexec.h:61:2: error: #error KEXEC_ARCH not defined
>        61 | #error KEXEC_ARCH not defined
>           |  ^~~~~
>     kernel/kexec_core.c: In function 'sanity_check_segment_list':
>>> kernel/kexec_core.c:179:29: error: 'KEXEC_DESTINATION_MEMORY_LIMIT' undeclared (first use in this function); did you mean 'KEXEC_CRASH_CONTROL_MEMORY_LIMIT'?
>       179 |                 if (mend >= KEXEC_DESTINATION_MEMORY_LIMIT)
>           |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>           |                             KEXEC_CRASH_CONTROL_MEMORY_LIMIT
>     kernel/kexec_core.c:179:29: note: each undeclared identifier is reported only once for each function it appears in
>     kernel/kexec_core.c: In function 'kimage_alloc_normal_control_pages':
>>> kernel/kexec_core.c:388:31: error: 'KEXEC_CONTROL_MEMORY_LIMIT' undeclared (first use in this function); did you mean 'KEXEC_CONTROL_MEMORY_GFP'?
>       388 |                 if ((epfn >= (KEXEC_CONTROL_MEMORY_LIMIT >> PAGE_SHIFT)) ||
>           |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>           |                               KEXEC_CONTROL_MEMORY_GFP
>     kernel/kexec_core.c: In function 'kimage_alloc_crash_control_pages':
>>> include/linux/kexec.h:65:42: error: 'KEXEC_CONTROL_MEMORY_LIMIT' undeclared (first use in this function); did you mean 'KEXEC_CONTROL_MEMORY_GFP'?
>        65 | #define KEXEC_CRASH_CONTROL_MEMORY_LIMIT KEXEC_CONTROL_MEMORY_LIMIT
>           |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
>     kernel/kexec_core.c:454:32: note: in expansion of macro 'KEXEC_CRASH_CONTROL_MEMORY_LIMIT'
>       454 |                 if (hole_end > KEXEC_CRASH_CONTROL_MEMORY_LIMIT)
>           |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     kernel/kexec_core.c: In function 'kimage_alloc_page':
>>> kernel/kexec_core.c:721:34: error: 'KEXEC_SOURCE_MEMORY_LIMIT' undeclared (first use in this function); did you mean 'KEXEC_CRASH_CONTROL_MEMORY_LIMIT'?
>       721 |                                 (KEXEC_SOURCE_MEMORY_LIMIT >> PAGE_SHIFT)) {
>           |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>           |                                  KEXEC_CRASH_CONTROL_MEMORY_LIMIT
>     kernel/kexec_core.c: In function '__crash_kexec':
>>> kernel/kexec_core.c:1061:25: error: implicit declaration of function 'crash_setup_regs' [-Werror=implicit-function-declaration]
>      1061 |                         crash_setup_regs(&fixed_regs, regs);
>           |                         ^~~~~~~~~~~~~~~~
>     cc1: some warnings being treated as errors
> 
> 
> vim +41 include/linux/kexec.h
> 
> dc009d92435f99 Eric W. Biederman  2005-06-25  39
> dc009d92435f99 Eric W. Biederman  2005-06-25  40  #ifndef KEXEC_SOURCE_MEMORY_LIMIT
> dc009d92435f99 Eric W. Biederman  2005-06-25 @41  #error KEXEC_SOURCE_MEMORY_LIMIT not defined
> dc009d92435f99 Eric W. Biederman  2005-06-25  42  #endif
> dc009d92435f99 Eric W. Biederman  2005-06-25  43
> dc009d92435f99 Eric W. Biederman  2005-06-25  44  #ifndef KEXEC_DESTINATION_MEMORY_LIMIT
> dc009d92435f99 Eric W. Biederman  2005-06-25 @45  #error KEXEC_DESTINATION_MEMORY_LIMIT not defined
> dc009d92435f99 Eric W. Biederman  2005-06-25  46  #endif
> dc009d92435f99 Eric W. Biederman  2005-06-25  47
> dc009d92435f99 Eric W. Biederman  2005-06-25  48  #ifndef KEXEC_CONTROL_MEMORY_LIMIT
> dc009d92435f99 Eric W. Biederman  2005-06-25 @49  #error KEXEC_CONTROL_MEMORY_LIMIT not defined
> dc009d92435f99 Eric W. Biederman  2005-06-25  50  #endif
> dc009d92435f99 Eric W. Biederman  2005-06-25  51
> 7e01b5acd88b3f Martin Schwidefsky 2015-04-16  52  #ifndef KEXEC_CONTROL_MEMORY_GFP
> dc5cccacf4272d Russell King       2016-08-02  53  #define KEXEC_CONTROL_MEMORY_GFP (GFP_KERNEL | __GFP_NORETRY)
> 7e01b5acd88b3f Martin Schwidefsky 2015-04-16  54  #endif
> 7e01b5acd88b3f Martin Schwidefsky 2015-04-16  55
> 163f6876f5c3ff Huang Ying         2008-08-15  56  #ifndef KEXEC_CONTROL_PAGE_SIZE
> 163f6876f5c3ff Huang Ying         2008-08-15 @57  #error KEXEC_CONTROL_PAGE_SIZE not defined
> dc009d92435f99 Eric W. Biederman  2005-06-25  58  #endif
> dc009d92435f99 Eric W. Biederman  2005-06-25  59
> dc009d92435f99 Eric W. Biederman  2005-06-25  60  #ifndef KEXEC_ARCH
> dc009d92435f99 Eric W. Biederman  2005-06-25 @61  #error KEXEC_ARCH not defined
> dc009d92435f99 Eric W. Biederman  2005-06-25  62  #endif
> dc009d92435f99 Eric W. Biederman  2005-06-25  63
> 3d214faea6e4f9 Michael Holzheu    2011-10-30  64  #ifndef KEXEC_CRASH_CONTROL_MEMORY_LIMIT
> 3d214faea6e4f9 Michael Holzheu    2011-10-30 @65  #define KEXEC_CRASH_CONTROL_MEMORY_LIMIT KEXEC_CONTROL_MEMORY_LIMIT
> 3d214faea6e4f9 Michael Holzheu    2011-10-30  66  #endif
> 3d214faea6e4f9 Michael Holzheu    2011-10-30  67
> 
> :::::: The code at line 41 was first introduced by commit
> :::::: dc009d92435f99498cbc579ce76bf28e837e2c14 [PATCH] kexec: add kexec syscalls
> 
> :::::: TO: Eric W. Biederman <ebiederm@xmission.com>
> :::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>
> 
