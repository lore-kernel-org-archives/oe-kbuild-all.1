Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3636A6FC7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 May 2023 13:38:13 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34NDYZV1015810;
	Tue, 23 May 2023 13:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=w6fxVMvYw7HMlcLpaVonDVV3h0Zdq5166qwz9urpxmo=;
 b=1cW3Km5881S/SkWK7e2YqbTD3D6x1vJCSB1PKeSLDjgOgIxgp4WW2XL5nacqOYn/ma8W
 VS9Bo42DNyjKOA7ghtlj2rYjAYSvMVopUcPyf7U+FUu3wyB+mg4MAoLTQgypEbKRLK4H
 jP199w5liZHcVArCqRTgxBkkQdhv6fcY7hwIKc0k22+c42j4Jvd0QG3uJXh3QFz97a2x
 bzpoXE33D58vx9ELv+Vb1Goydvgm0G+JcO59uXyQJKBVt+i01YeayZLYws2Y+Ez8XGIW
 U99f+DFYFyjTsaXF8kJXg3Q2RfJBTDypJzlnk8JmbBO8Ftnyqr6Ecx+7ylRI1i+M+5qQ wg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qpp3qn3gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 May 2023 13:37:49 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 34NCwWYE027109;
	Tue, 23 May 2023 13:37:48 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3qqk2dk09a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 23 May 2023 13:37:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpW3I5v2NbO7C6CZ0sRkbTV7L/PuvoQfEhHvXK1L2S8SVM/NmUKNZdLl5Ks18EZ+XJAWectH0FtR3TZsaAMuoXOTqIgjn/xv8tvnmtwR3O78Pir1DCBkIXUIu/sQ3E8afDw66kHdSDlirtsjQbdG3JDi90WDgT029eLmQI74du0Gp/0n8sNaxVKX4zPc0aczM+tG/Jaw37fw4LsTZNHzQ+lB7LtGCAwzx+10I2diYp5BHhiGcehKjjHGEZ4ymq8mg8joxTVYb+d9NkZENNRJtM1yIzJxrdN0RMgXvW0ualHvFV/rzn1OE18kYRTdxAG5NXXQcPEhWTtz8RYvSjRf3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6fxVMvYw7HMlcLpaVonDVV3h0Zdq5166qwz9urpxmo=;
 b=d3fQEK4O/uUx1MfLjQiPWV0I8Ej5cjqaBedPvC685Ufwz5btKu9GULaajystp6aBaiPpXfyydImXpKnhkEGY///wHnoP8tR83ZAAPPwQEGQL45cGhqM7o4P1a4Hkxw7Sw7K+kLT86jyt0D56WfwPFb2enmUIYcIwBEIM7XganbNTKWDt+fF5kNNgXvG9FBYFe08jr9v2MX30EnaCmNA9c5ymjjiRBnQJ5DR7gRPWXTuAVkNSURLsbfkc3pqxtK7WL+KOx+B64/GHucEQKz+InUKvj1Euek3vl+2ABtGTNfoBDm0D0D+j+4x6/jtKOEuhkHgshHQ1hf+sO2cT65gCAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6fxVMvYw7HMlcLpaVonDVV3h0Zdq5166qwz9urpxmo=;
 b=YAIqbg9t+dkV36qjw9v7o/rxn9UcuxDDdi/3yiV2Og3copqI8BgxmG64dcBh9HwkNc5BUhPC9DT71ijBmKLLNF3kriDIEDMQYoYXEKyj7TDJS5jMo+dzcvFJVcnd55CGlb1LXqiuOGe4Geox2Kha4A8mUfvsH8rv3oDVR/Uhma0=
Received: from PH0PR10MB5433.namprd10.prod.outlook.com (2603:10b6:510:e0::9)
 by DM6PR10MB4394.namprd10.prod.outlook.com (2603:10b6:5:221::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 13:37:45 +0000
Received: from PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::bc77:f9f4:b4cf:18df]) by PH0PR10MB5433.namprd10.prod.outlook.com
 ([fe80::bc77:f9f4:b4cf:18df%6]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 13:37:45 +0000
Message-ID: <07135e22-253f-cfdc-dbba-0e5e670c25e9@oracle.com>
Date: Tue, 23 May 2023 15:37:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [linux-stable-rc:queue/5.4 4610/23441]
 include/linux/compiler.h:350:45: error: call to '__compiletime_assert_215'
 declared with attribute error: FIELD_GET: mask is not constant
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Daniel Santos <daniel.santos@pobox.com>,
        Sasha Levin <sashal@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
        Felix Fietkau <nbd@nbd.name>
References: <202305210701.TND2uZBJ-lkp@intel.com>
From: Vegard Nossum <vegard.nossum@oracle.com>
In-Reply-To: <202305210701.TND2uZBJ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PAZP264CA0231.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:238::13) To PH0PR10MB5433.namprd10.prod.outlook.com
 (2603:10b6:510:e0::9)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5433:EE_|DM6PR10MB4394:EE_
X-MS-Office365-Filtering-Correlation-Id: c74afcc9-c473-4d44-3c8a-08db5b92e3ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	64PwNiGgoJmjf8FXtFFgPMUNNeUydUoxPj05zw/CQvHGek3gIzrpFM3lkWskRS4g28mG7WtiCQDXNYVE9bsDHiVhUGBAmGUS1dQLUKN+F1su8dxqRSVsytygR0iNrThqLfEIkmsT9HcY3wbs156o3P8FfhxU1iohYwi3JeJqyc07HOy15Felrw1AxTNsY+YLKHsppLlru6ijlVSJRZFCEc24g/Ss1fGoZdj177APktSYz5wMWGAORU5AyZGf5m+KcZam/C35yESLYw/UBDvJVcLqmRz4+2k41d17Nn98hJ/aCfH/+0aqObokrQyPMAiaH7MRrFncwRWkuh3Fi6FywUUnun35j68AKzxe6JOZwPKTbbLhVsHxcggp24QyySUAHrQawOyAH9BzUZDEPJp4hkK1ZtQY0J2DSOworpRO9bDZUItJ0ukQbidabM8TYECONfXFoKGx1inGLmV7oFq9wwxRWcAlsHEfPJhAfEKtrBPScAOX41HmPWPTJ7Vnul9leOdFKEdMAQGpXIs2unKbYqwWXAOKXaZ/TaivJHPzjrkpJIlNXqMMopNA12poGf5hbQnn4C5NnP5poDu2tKqbM6IxAB+o0kMfIVWohPFAiDlifBMK4rQvaKbJNcbRBE3xVVQoeVyEUn+HWrJ5n5+nT/vi1HmnIDj599S/63DTCo8LAjK/W38bRG4w49d3mqTM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5433.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199021)(7416002)(966005)(8936002)(5660300002)(8676002)(83380400001)(2906002)(186003)(2616005)(36756003)(38100700002)(31696002)(86362001)(44832011)(6666004)(26005)(6512007)(6506007)(53546011)(316002)(66476007)(4326008)(6916009)(66556008)(478600001)(31686004)(54906003)(66946007)(6486002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZFlmbFEzcVE5TVFYQ1hDNmEyVkI1STk4UzNTZldrdTJraWhkWjBqd2lCZjNW?=
 =?utf-8?B?K1BGanNzdVJYd1hPNWVXY0lCM2h0eXJja1FZSDIrRHN4clhONW5kcjdoYktU?=
 =?utf-8?B?M1V0eTYyY01oWFllZmw5NHBMSHllbDVOZ3Z1bTliT0ZrTzJNb1VKbXduQ2F1?=
 =?utf-8?B?VGJLT1VEdVQxS3dFaERyRWE1OEgrWXhYNElJQ3N1S2srNkxvODVhczE5RHRV?=
 =?utf-8?B?UitRRzQxckhtUkpiRHdLVmxFNlBLQTZ2dktxL3dzNE4vd3lkWTYzcWUySGdk?=
 =?utf-8?B?SjMwNXhwWnZoVGQ0M3MzMWJhZkhLT2RkdXFJZ0huOG5kbGJ3VEdsL0I1NWhl?=
 =?utf-8?B?V0pKOEtBWkJJcVNIYlBMenBHZ2xSVE5lZ2NwVDM2ODJoZ01Xb0RvZGlyS1Mz?=
 =?utf-8?B?SDN2SXUrYVhaWDVpL2JRaVg2RHpJWEs0amdZeGJJUnk0N3lIMFR5bmtOWTdh?=
 =?utf-8?B?dDJBK0E1TFN5ZEVySVBOM2tORGRwaUdwUXVDQ1V4Y2FsdHUxZzZoQzRvYUNq?=
 =?utf-8?B?UmpmWEYrQlFKTmdKajQvUG9KQnUzSXgxN0wvWUlDQk5uT3JxVnJ3Y1N5TlA5?=
 =?utf-8?B?SUpyS1hGOVBKeEFNWWlvVzBOcC9Fa0NBdU5jUmthN3hOQjNDa1MxS3VJTk1L?=
 =?utf-8?B?WUw2M1ZjUlNWazVnZ1ZPRTFrcHUxcTNiakkzaEI2SFNXaWFNUU5xckcxYzlo?=
 =?utf-8?B?c1ZQT243OWdMeEEyS2h6ejdNdlNvVEhiKzdKbWd4ZmRNSTRhaDVXV3NlWlRC?=
 =?utf-8?B?M29ZMCtKdG9VeEdSWXUzdHA3U0QxL3NNUzRmSGp0UW1DVXY1YWhoMWlvUFJ3?=
 =?utf-8?B?YjViSDNwcFhDSXExa0p4ZGlDK2l5SDlTbThxajVtQmZtd0J4Z1dvak5td09o?=
 =?utf-8?B?OGlZV2FoMWJ6U3I5M0xyMHBLanppTUdvRTYzWVRFRVhRaWFaeCtJY29hT093?=
 =?utf-8?B?UXlQYzBjVVJmbUpzc2VqWFNJSkVmVXYzeUdkQ1ozUlh2S3NpOUx2eStSV2ls?=
 =?utf-8?B?WHlLb0VvQjFESEZnMGFLTlBSekphMGhRVnJyblpWZUt5SkhGa2pmOW53VkVX?=
 =?utf-8?B?VWt2dE5Rbm1memp0bHJaSDkxSTc3VWlPb0h0TFpyL2lNamk2MTVUM1k3L0Ev?=
 =?utf-8?B?UGc1QkhMRnZuV1pRMkJlWEV6ZmQ0Z1EzQVJNVnNlSW5ic0NpTUlNOXk2aUtt?=
 =?utf-8?B?dkhMREpPRytvdXJyejdkSmMyMDZBcktDUEVYZXFaT1ZmdmtlejJSMUJISHJz?=
 =?utf-8?B?eHVxNHdLMkgyZVR2N052UVhxb1RNeUVLZUQrd3VRZUpra1NkYkJyd0NIT1N6?=
 =?utf-8?B?RFBoSGFJL0EyN2JwbW1uN2w2UFRKV0lxRDhCTjNYeVUvK2c1QUlzbnBuN2lr?=
 =?utf-8?B?NzltdjViTFQ4WVVVVXAveHhYRnVKbjY4SmZjN0JUWkM1NVFIbVlnSlUxMWJW?=
 =?utf-8?B?MEI4eU9oR0ZjSUIveVZHb2tTMzVmL0ZZelpJK08wSzhUMGZnSGpnc0JVbDZH?=
 =?utf-8?B?Q1gzTVROVEFydnF0SjFyNEJibElIakZ2a1o1TStwMDVWWUVWYzZ4aCs0Qmxn?=
 =?utf-8?B?VzlkU0loMlhGL25lRnRxbkRqQnVOTFBuOTRXNyt3R0dBd0p3UFh1cklIcWJx?=
 =?utf-8?B?THUzZGNPeFpzS090VEtERjRDaTkzNGlabFROODRySWh0N2ZYbWd2QmlGOEkr?=
 =?utf-8?B?OEduUXZocEFpdVlWaG05cmxCclMyekhaRlFxUzlGaTBpR2xqVzNkWkY5UzBE?=
 =?utf-8?B?K0wxaFIwdEdmYk12M1NvSDRmS1RLUnljMlc2SDArR1JzZWQwajF4RXh5S1BQ?=
 =?utf-8?B?dXYyN3pDVW1ZZDY3OGtxUFdmYlRETWFWaXFzcFMwU2k2TzRXeU1kR0JZblZ2?=
 =?utf-8?B?MU45TGZ2NmZwbU5vR2JZdCt2aWoyNGRVNWswQmhHcy9Rdk1FQm0vMVRqTG82?=
 =?utf-8?B?aFZYbytUY0tBY1N4eld5MmR2blczN1RvMThIT2ZpZGdtOUZOSHlMaWYxd3dT?=
 =?utf-8?B?b21aWEFsNVN2WlBwNHZVVUY2Y3c2WUFaUEYvUXZaTlU5eDAzQk9KS3NUUlgv?=
 =?utf-8?B?cjRMY2g4M1VzQ2hraTJEY0hocDVWVGI3Q0ZKZzJxL2lSVHBScGViMmN6aUZ0?=
 =?utf-8?Q?ydyXgmbd+mtG0hsPXKbYZ1KkI?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	=?utf-8?B?cjlLYnN3bGo1aTlJM3Q3RnFRaWZSaitpNllnQ2VOUVRYZC9zM2o1ekxsbkhV?=
 =?utf-8?B?eGFrSDJBNlM1VVdENlBwREpxbzV1aWdhOGZvZVR1eVBSWkVpbTNZNGFabHNx?=
 =?utf-8?B?bWp2MWhlR2pHMytNaklsTXlkS0FUNlEzTzJuMHNEMS9uSGNLcThQSnAvZjg2?=
 =?utf-8?B?eldsRWJ1NXdFQU11TmdPbzBwR3VpWm5jdlhyc2k1Ti9WWFJQdHhnY05xSmdl?=
 =?utf-8?B?SkxsY2hMSjdMR3V3RnBLV2Z5eWNGaWhCcFArQk1TTGZtWDdYeDFPSWFkeEJI?=
 =?utf-8?B?UkdpQVJTbEdOc2FPc0xrV0lYcDJIYlc5Y0EzZHF4NlJWMXhqWXEyUnJIZzNz?=
 =?utf-8?B?U3U5OStpUFVtRFVnRlFWbVVMQUFSL0o4TjgxTnFwZjF6MWF4ZDNaazRuZ1BT?=
 =?utf-8?B?aFBibnVRNlpKQXVsVFRMbTlEczIrZkFqQURuUUFrWVVYK3RoZXJkZldOU1hG?=
 =?utf-8?B?aEJkQ0Z6eE1jTjEyTlNQZnhuK0lNcUp1T0hhMWpzSUkwM045MDBydFFxSGk2?=
 =?utf-8?B?RVhlZUlMRHJ0THRoemdJdC9jZm5sN0dic1c2SkRkVEllMjN5Q1ppMzlnMklh?=
 =?utf-8?B?WGtiK2tUdHV5WXp4anZzQXc4dFo2ZkRGZlZyeDRpVDhKd1k0cCsyUjBQL1hx?=
 =?utf-8?B?Z0hrK3dmckVnVnFqRks2elFEeDh5YkRkNmhoSlVwYzlya0tOS1RmYzBOYVBM?=
 =?utf-8?B?Slh1ZnRuVVUzYlgxOGorTUdMYXNGRnp5d0tlbFQ5dGxCOFpFZ0lzNThoS3hG?=
 =?utf-8?B?L3dLWm9qcTZwNUJ6ODQ3Skl4emFrbUtJc2trTXlKUXhMcy9zNHlKRjJyb3RO?=
 =?utf-8?B?S0VleUdvUHJHTkFtRm14NkwvTEExdTBKQTZXenNhSjZ2RVRqZ1V6VUkveVQy?=
 =?utf-8?B?REY5aFk2VDNoTW9jbkNHU3UwWlBNOERVU1kzT2hXLys3bUMrcitsejJPaVdS?=
 =?utf-8?B?STdsbVg4YzNicXlWZGx3NUY1M1hEREdvck9ad01NcEFlQ2FjRElvbU93YWRk?=
 =?utf-8?B?eHd2TnNlaFhKUjU3dzgyQ3VlZkFHcUxnRHZya1Z3ZGtKZHQ1TFRTMDB3dXZ1?=
 =?utf-8?B?emJRbS9OYUd5WXVoR1QyZkhhRUZxaU5DaTB1THlya2E3aWNEQ3pNcjFIQUg5?=
 =?utf-8?B?K1FKUEVDYzJIdWxIcnhXNm11elUvS1RlL2Z4M2dTVzRKWWIzdmxOZmNGNnRs?=
 =?utf-8?B?UEhSLy9Td3RPWHZmVFJCTml6Z1hkL0pMY2RKOWJHbkY4R3ljSGU1MnZlWFNU?=
 =?utf-8?B?NkxWNGdlR2FMVGR0M0xsOFJhS1pieG9Bak5IWldMQWJLNWxaVUx0aW5KM0VL?=
 =?utf-8?B?N0N1Mmk1U2VzMjF3RkRLMG9KcXJvejhhTWdMTWlIcEV3OEtvRmkxR3lNSnps?=
 =?utf-8?B?Z2VkZXhaQ3ozN1hxVHdZc0NENGRDVTFuYUJxWmZCNGEwVHQzVmc2Q2xTdEYx?=
 =?utf-8?Q?8seXXj/B?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c74afcc9-c473-4d44-3c8a-08db5b92e3ca
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5433.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 13:37:45.0852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMcuAXDZ9vWuiCfxMqEj13JiDSVDJMwhGGnVF86yPJ9LgMeSwUGsvdtyYU1p74sKqN39NK8dSZ8wTfIyD4CLS9NfQ2mCj7XRsbo0n1CbHuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4394
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_09,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305230106
X-Proofpoint-GUID: yb_s14ZcUiU8Hj14awtxGYWZ-13SkxCt
X-Proofpoint-ORIG-GUID: yb_s14ZcUiU8Hj14awtxGYWZ-13SkxCt


On 5/21/23 02:12, kernel test robot wrote:
> Hi Vegard,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
> head:   9b5924fbde0d84c8b30d7ee297a08ca441a760de
> commit: 3910babeac1ab031f4e178042cbd1af9a9a0ec51 [4610/23441] compiler.h: fix error in BUILD_BUG_ON() reporting
> config: sparc64-randconfig-c44-20230521
> compiler: sparc64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=3910babeac1ab031f4e178042cbd1af9a9a0ec51
>          git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>          git fetch --no-tags linux-stable-rc queue/5.4
>          git checkout 3910babeac1ab031f4e178042cbd1af9a9a0ec51
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc64 SHELL=/bin/bash drivers/net/wireless/mediatek/mt76/mt7615/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305210701.TND2uZBJ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from include/linux/kernel.h:11,
>                      from include/linux/skbuff.h:13,
>                      from include/linux/if_ether.h:19,
>                      from include/linux/etherdevice.h:20,
>                      from drivers/net/wireless/mediatek/mt76/mt7615/mac.c:10:
>     drivers/net/wireless/mediatek/mt76/mt7615/mac.c: In function 'to_rssi':
>>> include/linux/compiler.h:350:45: error: call to '__compiletime_assert_215' declared with attribute error: FIELD_GET: mask is not constant
>       350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>           |                                             ^

I'm not sure why this flags my patch as the culprit.

I just tried this (with the supplied config):

git checkout stable/linux-5.4.y
git revert 3910babeac1ab031f4e178042cbd1af9a9a0ec51 # revert my patch
make drivers/net/wireless/mediatek/mt76/mt7615/mac.o

and it still outputs the same error.

The FIELD_GET() call was added in bf92e76851009 and seems to have been
broken from the start as far as I can tell? If I checkout bf92e76851009^
then it builds, if I checkout bf92e76851009 then it fails.

Should we just redefine to_rssi() as a macro so it actually passes the
field as a literal/constant?


Vegard
