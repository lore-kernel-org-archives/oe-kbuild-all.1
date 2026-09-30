Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B802CCC5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 06:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790748736; cv=none; b=kGwG/oJq2R+rg8yRnO6gVdSidRLYBU3PyY6JicvKDBN0phQOeAe2Qj0DIzBMQLj3Z0GaPtDQlTIp9JpBJPPA5gGJ0njPJsm+bf54R5PIN426VfsMDHS+4O595zqsTOardNaYuv41cZfHryh6f5Z07R/hWwnKxOmEIXEDJxNEFKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790748736; c=relaxed/simple;
	bh=Dq2EEzdDu1XGSAF5e5hqEv/EOk6k9s2bWSjgr6En2GI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mdK3UTfaEAvLHAA/0f1+e8Y2Ih2wp/fpkYs2qD0JmZKbF5siSxTgF6b7EBpXiuObGDZmqB/y2WQDon28oD9Vz2h6NvsFm6yfHA3Ep4JIC+JBwMjtg78jhwbs5WbTqGXGOymXzWmliR11mdVZ/Z8uE85bI6tHi05DR1Vg5dTMl1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=R9cXyEh7; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="R9cXyEh7"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TNZfip1395249;
	Wed, 30 Sep 2026 06:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=chxxTu
	smidLQgIYY4qVWkGDsEhN1DpJw7S6Lqcv9UvQ=; b=R9cXyEh7tpJHkNHxLmmnqy
	KyWBTTyFvTC/aUWxrEOCsu/M6+1pVRH7mB7Uz7crLJ+Y3mQVxzDFoJ/3XPhnPyYR
	++vxid0BLc4fyfzw5Hye9BS5ZG5+GXna5dOP+gO6pbbl8/S/K2pSSzq0ovLDkTYO
	2+wjBCVI/NXCO2WbOPN/lws53AcAnttdfxcrOiRGLjjDwc8StnA8st7d2TcYuqy2
	YQURx0U+bb1fQZlkJVCZoCGH5S1a/0YKng757lidR0pYSfaSp/JuiLHRaehMpDIX
	3E55baa/YaeyWhEdIgQI/o3VQaObz0NyzWjxjz0lxtoqXMMuF1g7YjmznyDa5WUQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5j5bb5a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 06:12:13 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68U4e9Ja1290050;
	Wed, 30 Sep 2026 06:12:12 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h0q4p9530-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 06:12:12 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68U6CAEG30671524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Sep 2026 06:12:10 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87DE02004B;
	Wed, 30 Sep 2026 06:12:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E86E20040;
	Wed, 30 Sep 2026 06:12:09 +0000 (GMT)
Received: from [9.39.21.243] (unknown [9.39.21.243])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Sep 2026 06:12:09 +0000 (GMT)
Message-ID: <1f4b1731-d1fb-487e-b3b6-d6bfc6609065@linux.ibm.com>
Date: Wed, 30 Sep 2026 11:42:08 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linuxppc:next-test 3/37] arch/powerpc/kernel/irq.c:116:undefined
 reference to `irq_proc_emit_counts'
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
References: <202609300040.mopAJGuz-lkp@intel.com>
 <ad1591f8-2719-4636-a041-1fb433c1293f@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <ad1591f8-2719-4636-a041-1fb433c1293f@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNCBTYWx0ZWRfXyHcvwu9bedyo
 MBWz8LjR3AaCby+EPMURJocUN6RVbZVckdjwPDi92uB1jOBRpwUdRPTM3CJ1IWs4RBC09O4Knkq
 QSjwyDgCOOL8xhUey3Q4w4++jhLIhCA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNCBTYWx0ZWRfX9IsRvOubgYqR
 C4X4vE0gQG5XISuSR3csWxrwcQKYqv2Ljc9cNVD3mpm87FnCYzuZUbFUEkboPJ3OjN1SIm/ofFp
 6Mn8oHnZeBZh+3PaylUacmiNLd8aXL0hlOT2H4KKWbnnsBsYvpia8WLQ4wsKZ+Gs+QK2kKKLyRC
 TuLWRxwJpkfyaz3hZYyYAqBH3xzA8/uso4pnYLvYZz7xqSLo1gzLYijlko8c0xgz9YfXhO7ZGiT
 G82ytgISMmHnDxkHVN0TC0bE8wlNIRCbKFc2gXTJKrHq9EgMEbc8jUoPZnLMTjA6D0zFBR/jvsz
 1t6ieGtwFqMda5V8cEiBW8zRO9uG2YH+AleKbIriF8HDoH/BGAh17Kj3QjxHdYjNkygIbFOSFSy
 MX+mQFeK8Iikpzy1abRi/HzYhfYbWDgwm+31+yraVkSS6Kes0bAwg7RmMDcw5eB32lwCoJYDMt2
 wUkLiC9BIOz2RURnZ0Q==
X-Proofpoint-GUID: iiP5G32M45C5U7qwBhXiocVZR4--ZvJ4
X-Authority-Analysis: v=2.4 cv=RKcmjIi+ c=1 sm=1 tr=0 ts=6abca83d cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=NEAV23lmAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=Y-1eg03KOPFTfgDPcAYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: iiP5G32M45C5U7qwBhXiocVZR4--ZvJ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300024



On 9/30/26 11:32 AM, Madhavan Srinivasan wrote:
> 
> On 9/30/26 3:35 AM, kernel test robot wrote:
>> tree:   https://github.com/linuxppc/linux next-test
>> head:   0b8b0c17a8998709ecb2852d56442ea981102941
>> commit: fbb22ceaaf8f9c6786e6ff5da1962fe6ac0fc904 [3/37] powerpc/irq: Make irqstats array based
>> config: powerpc64-randconfig-r2100-20260929 (https://download.01.org/0day-ci/archive/20260930/202609300040.mopAJGuz-lkp@intel.com/config)
>> compiler: powerpc64-linux-gcc (GCC) 15.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300040.mopAJGuz-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202609300040.mopAJGuz-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     powerpc64-linux-ld: warning: discarding dynamic section .glink
>>     powerpc64-linux-ld: warning: discarding dynamic section .plt
>>     powerpc64-linux-ld: linkage table error against `irq_proc_emit_counts'
>>     powerpc64-linux-ld: stubs don't match calculated size
>>     powerpc64-linux-ld: can not build stubs: bad value
>>     powerpc64-linux-ld: arch/powerpc/kernel/irq.o: in function `arch_show_interrupts':
>>>> arch/powerpc/kernel/irq.c:116:(.text+0x49f8): undefined reference to `irq_proc_emit_counts'
> CONFIG_PROC_FS is not enabled in the shared config which
> is why we are seeing this
> 
> Maddy
>>

Yes, i have responded already to similar message yesterday :(
https://lore.kernel.org/all/ae3e35d6-8dfb-43fe-aa69-0a60b51b2f9b@linux.ibm.com/

I will send the patch today.

>> vim +116 arch/powerpc/kernel/irq.c
>>
>>     109
>>     110    int arch_show_interrupts(struct seq_file *p, int prec)
>>     111    {
>>     112        const struct irq_stat_info *info = irq_stat_info;
>>     113
>>     114        for (unsigned int i = 0; i < ARRAY_SIZE(irq_stat_info); i++, info++) {
>>     115            seq_printf(p, "%*s:", prec, info->symbol);
>>   > 116            irq_proc_emit_counts(p, &irq_stat.counts[i]);
>>     117            seq_puts(p, info->text);
>>     118        }
>>     119
>>
>> -- 
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki

