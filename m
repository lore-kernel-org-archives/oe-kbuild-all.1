Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE88F259D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 18:34:33 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 363G8H08022884;
	Mon, 3 Jul 2023 18:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=8/Xh2rjOkGJq7fHXC84+Xu09RzR68+yAsqcHJtL49xA=;
 b=wwkbgtOondKO2rs2ym0fMh94sdeClgDFOe6MB2KwP3PSl+QOsyctFLzPjjK8zAjCa1Hy
 Njo0FXFUz+UHRTKaAE1E3wAoJR0nO243znbGWc2n2ZLA6qS2DdD+oCkb5cPNgsW1RjP3
 j/f30iAKOsd1wGRdlws+GEM1dVp5Pr5YOYEH3NEGPRW9y/r1v11Yimw+Fs+lNAFrLMWs
 6g8tXs7p1NTWRRAaF7rTjiahB8ohwa4uhHLjZtrMPKlf1DGgY9ALLrHixrShmlVvKZGa
 TND0SYPfLbns3xgCMgbJt1RsHvZImJtBNYNtfaavwctb9pcMuDmm9XXy4YbTliFJBV8k xA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rjb2bk8uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Jul 2023 18:34:26 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 363HD86I039494;
	Mon, 3 Jul 2023 18:34:26 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rjak3dn5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 03 Jul 2023 18:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6IKXGHoQeNOfRuDo/Z96Co+SyNZ9I6M9KYGE2+5pqBbhfBK7t+vGAzOG0rX6XHamXwwRevkDzu+9jKVCjWONQGbOS63WynbQ/Tx74aZURoZyD572TMTCIwCDN5ObyVgxmfaCvYbUDDFoSodKJzX+TGeaBU4l35HY5DEGKZLU4llTrfL93o8vL1Z6d45re2AC4off/g6bzzPUxUKinPxlV7z0qLwAa19UyPN5IRMae0dJY0qn56gd/K4wOt3+qXOUxKsgr6M0txQeDpa2p8UWfuBDzyhelQN7qnUwi6/4/GDBZrtc+0+fZC3iW0UMmbK96XC1r8dVPP5AbmMZopJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/Xh2rjOkGJq7fHXC84+Xu09RzR68+yAsqcHJtL49xA=;
 b=g+ezbJajgOz621SKZ7ryofm5v7IC0illU0uogItnT+cWidyrAt+od91Ojq/uTTgtLlIg0ifT/dSTg6NT1ipjaoySFQd1nfwO4IybO0pweMGueuiTMgyXxeJpjPOX/tKKYSIc4JNnLDD+XAH60cRAc0tasdgqOo0WySIH7gvUD4LHvUNnmgFrIXZbqpJTPRUEqKHkZDa77HOPAh3Fy/eFk9UMECg5FbuUCVBYYZ3aho8tGvuesl6lCKk0WU2mIVCmCNENrlbDs01Vh0HWYcV9I85LnZIsDfnEmqa9jf1K+sAeCYs3+nUx8twavrHbnRLzYex5GWwCIXnx+8zLq6IhlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/Xh2rjOkGJq7fHXC84+Xu09RzR68+yAsqcHJtL49xA=;
 b=hcmu1bKa+vVeNZSoVEIq8Ks1EmNydAiZTd+BugjVryC51vPmzJbw4n3yAkEhlQfYRxfAvggB9L7ox3/2+DsiKGXd5uxvXAmtfpy5TUrHTUX7RNA9IGGLo17AbwfuVNDGhvfl3qC90s67FHDmttqqMS0KBswNfZNFpRK2exMUV1Q=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by IA0PR10MB7601.namprd10.prod.outlook.com (2603:10b6:208:48e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 18:34:24 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::8b8f:b4b1:bb78:b048%5]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 18:34:24 +0000
Message-ID: <b5682972-bc67-4b65-33e3-d95182b5e0d0@oracle.com>
Date: Mon, 3 Jul 2023 13:34:21 -0500
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
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230703093144.27aa0d991c380f54be34ae93@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:8:2a::26) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|IA0PR10MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: a1405575-53d0-4807-29c8-08db7bf41fca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RPX2hsZCPzbrf01t0LapK7b1yEr5FliLaF0RzZZaoKoHyYdAzlVWgHwh+Yku6vvaza7n7ZfDmsA8Q53CTG54fN4nTVv1JxWYTUnlwL5sM/Dfcdt6A/TGR/Zal4XW8hRRNVYWKbCpnaUkUZ2odh00vMA4VpL+8gLAK19iSZR/F+ln1Q3nSNj3FnaRIFJpTrdfnhI63Leu1x+mE4xCFuczws6v57e+NCvypSajTynCwUUl3wCqNNAkkMftcYi2PIcWNF13mA+TGIvL7sPxgA44W5OJT+Kw81VrbLIrPSW40DCVuftRzDWl2mclhLRFtv0XOjORraQWAzWP3dMjUsL8Azcnok+tUWryC1bPVg7/sDIkNZdoI8xy+auIhyDtJQ0hi8nTw2dUzCFAA0unHrAuDVi3jxSE6vovfgF2RD+X/vDJiFe+V5du1osmXfcmsBacwhVkp0ALOuZIDqUDCRk6t2vwUEbGwa9GeXOAoec3lMyW9xOCYC2l7nkldbyADgq0XFhf9z/9GjBOfChR5HGxD9QAsGxTrBWhEgOYvB6czybf2+7FLJothwBkFm7XynANpN2SB8qF29e45L7+t/an4xUWCVafiWZqZtDi0Xnhmo/VW1lMTIb0fY25dIbAwb7gJM+C/c2cTon4owp/YLyGRA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4531.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(38100700002)(6666004)(4744005)(2906002)(6486002)(8936002)(54906003)(8676002)(36756003)(41300700001)(5660300002)(478600001)(6916009)(66946007)(66556008)(66476007)(53546011)(26005)(86362001)(6512007)(6506007)(186003)(4326008)(31686004)(316002)(31696002)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RmxLekFYVXJkNHBpNkNraFJyS0l5c0dEdFB2eGswZFlWMFdya2IrYVF4TnNq?=
 =?utf-8?B?c1BURDFGdnFPaktUcHFacXZsNjdEWi9yVGhVTkI1QVlQL3poYzA3Slh0aWEw?=
 =?utf-8?B?QTFQelBxOXJqQ3pDTDV4TEhYSTBBTnJSZG9KSWZ2KzZYSDUyY0c5RUFlaVds?=
 =?utf-8?B?K0k5dUlQMzFpUTN3OVArT3BOMHN4ejRXRDVxcmdkbmtXU052NkdxWVpUd05q?=
 =?utf-8?B?MkJXa2g2V1JxM2s1R1hQVWRMVkNpeDFFNXhROWRXOXM4RU5tMzkreDJSdHhz?=
 =?utf-8?B?R3ZDck9xYndvYktoZ2V4cy82NlBJdUp1cnE4MmVkaHQ1LzRYNEF2ZWRrQ2w3?=
 =?utf-8?B?cE5yb3dQVEtXYnQvQzhXV2FTTHR2ZTJjWG1DcXVRUVdja0lxMEVoUHJSZXRq?=
 =?utf-8?B?RVR2NlN2d3dPUVJYREx1SzYxZ3NzNk9hUmM4VmpEYThnbXZBN0hGWW5rcm4x?=
 =?utf-8?B?WmZGZ05vRG9DSFd2alMrd0lReFNhU2FET01tRWorM0JJS1dnY3llU0lFL09k?=
 =?utf-8?B?RDVzUCtWbWF1Mit3OFQxTmtMVmFIS1BiMEx1ditsc2JuU2dCTHMzVmhoUlk4?=
 =?utf-8?B?WnBhOWsxazF6cmVqZlN4RXlrMW0zS2tzWTYrd1NLNVJSYllrbkxrbmxranZl?=
 =?utf-8?B?OUlxQUsxTGFwR0RjVFpxNGI5V0d1TFhJS2s1VXdWNnFGanZDZnJtbGxPaklP?=
 =?utf-8?B?WWUrUjFDUlFBTWhFRFFwaVhWMldKZkN1Sk0zOUpZd1RMMjZEaUI3TzBGb0Ny?=
 =?utf-8?B?L245elp4ZUpzcHN1THpRQ3ErS083SlRSWjY3bnBaVmhlTnNTNmt0dUIwanRM?=
 =?utf-8?B?LytMOWM0WUwrN0ZJaFFQYzBXbW5zd00vcW1mUmp3ZU1kSndQbFpqcHpYblFI?=
 =?utf-8?B?T3VvblNaS1pqbVk4WjZ3SlBjR1V4ZUNJVkpLbUtRbzVZejczYzhPRHhpdGg0?=
 =?utf-8?B?ekRYYU5xZ1A0S2tqTGsxSlRvRjA0NGFmRkpmMUU3V0hoTkZSb2NQT0ZTMkpK?=
 =?utf-8?B?L0NwaHorcklZZElpZk41NjludEJOL3U2aVZ1OVpLNWE2Qy81VldkSmVNT3NV?=
 =?utf-8?B?cVVCYTRlVXd6M0NqSlgvM2daRE1KNXU3TmlmdXpEcXhHaHVjSkM2d0Y2eVBC?=
 =?utf-8?B?WEZUNkEvdW80YzRsaUR0Y2syRTJ1Rm02ZCtLN1BjMGdXWHovZUFzN2tOelVj?=
 =?utf-8?B?czdJQ0xIQ3lzSkd3bldGRXFpVDh1Q2w2bFZtRXlYS2k5R1h2ZGYwbnk3U0F0?=
 =?utf-8?B?ZlVKaXVsSmpTSUNwNGFWZzhiUUc2c0hpTTJmNG43cUFzOGRRMjV3a0VibHJx?=
 =?utf-8?B?Z3VZT1B4TEN1MDZwSW8rMEhsNGpuL1dlQmV6ODJUMDlicWtjUWhLemh1dk0r?=
 =?utf-8?B?QU5rK2Nha0Jtek4yRkMxSnRzSGdRQUNwUlVWa3ZyVmMrZFNheXRQRzlHWWh1?=
 =?utf-8?B?OEtGd29CM09jWU00SEl4blJ1VXBRODJWWDJrQThsMENiUS9Cdkt6eEJOQ0Qy?=
 =?utf-8?B?UlNZYkVkdXFlNWNBVjJhZm5kdUhzQmlpRTluUitvalByNzJTcmxxSHNCcHBC?=
 =?utf-8?B?d0hic0ZVYnltUFdldi80RTVlbjA4dHpUZUVFWXl2Y1p1eGdUeGtLeEU1VTgx?=
 =?utf-8?B?NDBiTlBWOG0xYVV0WnArS1JwV1RqVzFRemxqblM0MmpjdWRmVWJGeGMwL3pQ?=
 =?utf-8?B?Nm1DQVRIUk9Ib2JraTFheXNxa3VkOXFFQWI0dUQ2ZXlIZkJEbnNPRzgvRU9I?=
 =?utf-8?B?WVRHUTNFb3RJWHZPejRDM2hrc0o4dDJaSUxhMURUNnYzU1BDMHZ4VGRGUkw0?=
 =?utf-8?B?dnNhMjZGK1MrMVpvMjl3Qm0wY29LZC9jVHI5VWNXR0JtZEI2TEMvVFMwZVZP?=
 =?utf-8?B?b2NRYi9Gb1Q1eU9vbFpDOWg5TFBkMEg4ZFdzd3FzZDdqUkRJQWZQd1JKY0RT?=
 =?utf-8?B?bExDeG5ROFNFeCtlTHhDRnlUV3B0eS9RYXI3YmRRWWpTYWdRYnBSMkF3cnhj?=
 =?utf-8?B?RGd4WW04U3hMZWFoblpvM0hsdGZBczNtZ1lualJNSDR4RDlPMTFBaWlhUGMy?=
 =?utf-8?B?Rll1VlRzckhEV0VvZDRBYnUxV3hJcVU0NzNhblVEWUMwTTB0c211NHU3K0px?=
 =?utf-8?B?NXlXUGpDWUFFTDJSYUNIOU9wZFh4blVpZDUzeFI3N1QwKzU1K1ZIZXVGQlN1?=
 =?utf-8?B?cFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	GXQtS4ic/2OyK9u8T2Iwxxx8vxvBuijTOcIZH2L5wyw8m/vfheRGbYsX5T8riLpWxZuch65B5isye1ELPls2UwbhtOzgND8ErBxdUm1C2c2apBHfbILiex9pWcZ4lS/Q7pqnaDh28TvUkztzcyNABnUmC0niRdNid5e+3CtNQ4rHRqlQWfmjLVFeyclg/QATAeFtzzK63ax2F4009GeDHNvXaa+6n2gSf4ckApXR1+qe3eAA3LWxNfJV32n4DKBJc6krdaES9rqs2RobUiywrwBuFPl5+KoQ4s7HTQ8sx0QI/dKcnwoigFTyhnWxpWev5/Xo7ajN/4A3LmGNrCr2e5ANgkYXZzeqHd9SxqATFu23cys9/qUIauswcCQXkHiXj8kOqVWzvqhgt+ChTafmWXPEX2WwwJuUDxcmEHQ1szN/nCsYfBofwTnT4zJ5mn+DFbZddUP8ksbPzyEedtWVNVXwrvqfHczMekqnzDNXkUkA1FRnB3vJ2IQLUFMjdgocXozh23Ntn33ftvegQa8GDc2CsTUU6YGEL2MI8vIn5vAKB2Exuz3nxeCNPSOIJBUbpqP1hvHm6ZSerOBgInzTEK+cQrMQjq1c+ifV5nRNsQv2kyGQIxgfro4TC2NAdzOLOuRlcnHsy4jomDllsy4F+pEKujLSh5xSkZ4n43PiltRYVXfcNMzP0qucs3h8U5z6RDe5k8WoyQrLNqq/7gSChUH1EORNC5r1QT2sOGRmON2UG67wX/m8nypGhuGon2xrsj+eE2brBQj5pqrBEF0pAh/TRhVFWw05ae9IVUivMkge7V//AW6o7O+IA+9cu/O7nCSpvQFNbkBmHZDyLHXfCXXgnq5G3kKFFNwii78Yeq+HvPwgR5QyM0euOJBaqRf8azWDYVJCTkmPpPL4yNJwyA==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1405575-53d0-4807-29c8-08db7bf41fca
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 18:34:23.9802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9xbIX7uXUrT/D41vmzL5scw+Rq21Z4po9JbMGM+hQgmvZJsUSt3HYMxsSDqpF831tG3kzo+FB7Z3G8uHImB0X5rmrMs6uVglPshTn6RZKV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7601
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_13,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 spamscore=0 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307030169
X-Proofpoint-ORIG-GUID: -9G8SArwr-ngHY_0_pQMJ7G0bH0z-rjt
X-Proofpoint-GUID: -9G8SArwr-ngHY_0_pQMJ7G0bH0z-rjt



On 7/3/23 11:31, Andrew Morton wrote:
> On Mon, 3 Jul 2023 10:31:34 -0500 Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> Here are three possible courses of action:
>>    - do nothing; preserve existing behavior as intended by the series (even though problems like this
>> can occur)
>>    - fix it with CRASH_DUMP selecting KEXEC to eliminate the problem
> 
> This one, please.
> 
> Or make CRASH_DUMP depend on KEXEC.
> 
>>    - do not fix it but document the reason why this problem occurs in the commit message

ok, great!

I also have an unrelated fix for riscv, and this correction (for both arm and mips). Is the correct 
action to post a new v4 version? Or is there a different method?

Thanks!
eric
