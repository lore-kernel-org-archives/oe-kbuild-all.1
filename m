Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com [67.231.149.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636AA107B9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 20:22:55 +0000 (UTC)
Received: from pps.filterd (m0050093.ppops.net [127.0.0.1])
	by m0050093.ppops.net-00190b01. (8.17.1.19/8.17.1.19) with ESMTP id 328Gl4se018820;
	Wed, 8 Mar 2023 20:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=pRDDVX7aZbIPUShdyCvcQLebymDVF4oqIQLzYpeYEB0=;
 b=GMNp+3Dg3E1eVCyMvsAptmrMyVfIglMds6+naHcV+zPhpknZU4v4B3DS6Bmc+FiLSfRp
 zw/Ij4u/V/mNIXJG0HHrx19NJVlaSB2n2/23cCa721OzTnDpDETWheGBDIfc8XIcrJ0C
 czwmSqjMJGvZoKFKTZLbB0MUitE030lRnI7fDnxOpTjmX4cFEvzMs2Uy5NbsKKzuu3qQ
 CxTleQ7kq2N98JiGPXl+pNUC1UK0I2/jVNohe2OuYt7VCm3dExqkIgaYynhaRUd5lRfq
 EIF1otnPKz3s88VaEkKf6ENdNY370voUOO+XNKL2sBGo4qzyNz6BdvSsG7rjfgeSw27k Vg== 
Received: from prod-mail-ppoint7 (a72-247-45-33.deploy.static.akamaitechnologies.com [72.247.45.33] (may be forged))
	by m0050093.ppops.net-00190b01. (PPS) with ESMTPS id 3p6fhcq827-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Mar 2023 20:04:18 +0000
Received: from pps.filterd (prod-mail-ppoint7.akamai.com [127.0.0.1])
	by prod-mail-ppoint7.akamai.com (8.17.1.19/8.17.1.19) with ESMTP id 328HHkEK020151;
	Wed, 8 Mar 2023 15:04:17 -0500
Received: from prod-mail-relay18.dfw02.corp.akamai.com ([172.27.165.172])
	by prod-mail-ppoint7.akamai.com (PPS) with ESMTP id 3p6ffkndp6-1;
	Wed, 08 Mar 2023 15:04:17 -0500
Received: from [172.19.36.12] (unknown [172.19.36.12])
	by prod-mail-relay18.dfw02.corp.akamai.com (Postfix) with ESMTP id DD902232;
	Wed,  8 Mar 2023 20:04:16 +0000 (GMT)
Message-ID: <76f17294-fb69-8cb1-575b-56b607287811@akamai.com>
Date: Wed, 8 Mar 2023 15:04:16 -0500
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
To: Luis Chamberlain <mcgrof@kernel.org>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
        Linux Memory Management List <linux-mm@kvack.org>
References: <202303071444.sIbZTDCy-lkp@intel.com>
 <ZAjo+2O/GhcAb7mc@bombadil.infradead.org>
Content-Language: en-US
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <ZAjo+2O/GhcAb7mc@bombadil.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_14,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 mlxlogscore=849 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080168
X-Proofpoint-GUID: xiBvfOsgUOLW9HLgMaxOkJzcKJCIxtf4
X-Proofpoint-ORIG-GUID: xiBvfOsgUOLW9HLgMaxOkJzcKJCIxtf4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_15,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 impostorscore=0
 spamscore=0 mlxlogscore=780 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303080168



On 3/8/23 2:58 PM, Luis Chamberlain wrote:
> On Tue, Mar 07, 2023 at 02:37:52PM +0800, kernel test robot wrote:
>> tree:   https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git__;!!GjvTz_vk!U0h9mC3o9hyLHdMKkiDSF8QGbG4OjpXUHoA2hrkZN9_XW0Cb3e4Uk2sHDXTT-BfWsSVXa2JKktG7$  master
>> head:   709c6adf19dc558e44ab5c01659b09a16a2d3c82
>> commit: b1ec22f8dc85bb0b2e82a528a7ebca377f46d4cb [816/1532] dyndbg: use the module notifier callbacks
>> config: arc-randconfig-r011-20230305 (https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20230307/202303071444.sIbZTDCy-lkp@intel.com/config__;!!GjvTz_vk!U0h9mC3o9hyLHdMKkiDSF8QGbG4OjpXUHoA2hrkZN9_XW0Cb3e4Uk2sHDXTT-BfWsSVXa5JJ-rY1$ )
>> compiler: arceb-elf-gcc (GCC) 12.1.0
>> reproduce (this is a W=1 build):
> 
> Jason can you take a look?
> 
>    Luis

Hi Luis,

Yes, I saw this. I believe this warning predates the recent series, but 
then it's strange for the warning to only be showing up now? I can 
confirm whether it's related or not to the new patch, but either way I 
will get it fixed.

Thanks,

-Jason
