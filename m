Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com [67.231.149.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEDEDABB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 21:30:25 +0000 (UTC)
Received: from pps.filterd (m0122333.ppops.net [127.0.0.1])
	by mx0a-00190b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32AKQKnh002333;
	Fri, 10 Mar 2023 21:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=6xOr0bWGyLHy5x2SgCpeWLNSE69lPH+PAqyIDGKuw68=;
 b=eSBzYr4rKsLCV29WdadEjkKDCA0x1KLJuA87xw+/luzJsKeHk4jqAdIlBEi1vA0KKE8W
 ITXWqezRtyGPFpzcS15eG03Fyx5UIJKwKAGgHhT44tIH2rSLfDSJ/qCfruF+jqbnn8Y8
 4SSczaEQX/R4y8jnxWL9YKBiDVOWgUCz5O1LMI7CR7sLXDhjES0YJ7yGvPXynKKxbCNh
 ByYqhrjLDuhj2AwD87pBpUHlHS2qXUpSN/GP25hLTBq0wHfem/vmTDnbcsub8XtzY1TB
 d7k2leu/fX/N1yweSEb2mX+UrihfkyVnWD0XtoUfYuf32k4iwf0O3utfux7U8cCWLeIm bA== 
Received: from prod-mail-ppoint5 (prod-mail-ppoint5.akamai.com [184.51.33.60] (may be forged))
	by mx0a-00190b01.pphosted.com (PPS) with ESMTPS id 3p6fk4nday-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Mar 2023 21:30:09 +0000
Received: from pps.filterd (prod-mail-ppoint5.akamai.com [127.0.0.1])
	by prod-mail-ppoint5.akamai.com (8.17.1.19/8.17.1.19) with ESMTP id 32AJQhHV003795;
	Fri, 10 Mar 2023 13:30:08 -0800
Received: from prod-mail-relay11.akamai.com ([172.27.118.250])
	by prod-mail-ppoint5.akamai.com (PPS) with ESMTP id 3p6ffkn63u-1;
	Fri, 10 Mar 2023 13:30:08 -0800
Received: from [172.19.47.124] (bos-lpa4700a.bos01.corp.akamai.com [172.19.47.124])
	by prod-mail-relay11.akamai.com (Postfix) with ESMTP id 7981030AD4;
	Fri, 10 Mar 2023 21:30:08 +0000 (GMT)
Message-ID: <b7253da0-3fcd-1047-08c9-197761401d8c@akamai.com>
Date: Fri, 10 Mar 2023 16:30:08 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [linux-next:master 816/1532]
 drivers/infiniband/ulp/srp/ib_srp.c:66: warning:
 "DEFINE_DYNAMIC_DEBUG_METADATA" redefined
Content-Language: en-US
From: Jason Baron <jbaron@akamai.com>
To: Luis Chamberlain <mcgrof@kernel.org>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>
References: <202303071444.sIbZTDCy-lkp@intel.com>
 <ZAjo+2O/GhcAb7mc@bombadil.infradead.org>
 <76f17294-fb69-8cb1-575b-56b607287811@akamai.com>
In-Reply-To: <76f17294-fb69-8cb1-575b-56b607287811@akamai.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0
 mlxlogscore=792 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303100171
X-Proofpoint-GUID: vCDYS6FMX-zcIA0NXMTBf_DbYz9sDheM
X-Proofpoint-ORIG-GUID: vCDYS6FMX-zcIA0NXMTBf_DbYz9sDheM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-10_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=754 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303100172



On 3/8/23 3:04 PM, Jason Baron wrote:
> 
> 
> On 3/8/23 2:58 PM, Luis Chamberlain wrote:
>> On Tue, Mar 07, 2023 at 02:37:52PM +0800, kernel test robot wrote:
>>> tree:   
>>> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git__;!!GjvTz_vk!U0h9mC3o9hyLHdMKkiDSF8QGbG4OjpXUHoA2hrkZN9_XW0Cb3e4Uk2sHDXTT-BfWsSVXa2JKktG7$  master
>>> head:   709c6adf19dc558e44ab5c01659b09a16a2d3c82
>>> commit: b1ec22f8dc85bb0b2e82a528a7ebca377f46d4cb [816/1532] dyndbg: 
>>> use the module notifier callbacks
>>> config: arc-randconfig-r011-20230305 
>>> (https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20230307/202303071444.sIbZTDCy-lkp@intel.com/config__;!!GjvTz_vk!U0h9mC3o9hyLHdMKkiDSF8QGbG4OjpXUHoA2hrkZN9_XW0Cb3e4Uk2sHDXTT-BfWsSVXa5JJ-rY1$ )
>>> compiler: arceb-elf-gcc (GCC) 12.1.0
>>> reproduce (this is a W=1 build):
>>
>> Jason can you take a look?
>>
>>    Luis
> 
> Hi Luis,
> 
> Yes, I saw this. I believe this warning predates the recent series, but 
> then it's strange for the warning to only be showing up now? I can 
> confirm whether it's related or not to the new patch, but either way I 
> will get it fixed.
> 
> Thanks,
> 
> -Jason


Ok, I've looked into this now, and it was indeed caused by the recent 
dyndbg notifier patches. The patch ended up being larger than I had 
hoped but I think it hopefully prevents future breakage of this type. 
I've sent the patch separately.

Thanks,

-Jason
