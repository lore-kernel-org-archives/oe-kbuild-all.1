Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10473C661A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 13:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783776086; cv=none; b=Zx7a5sK27ZdNXA9jp73U6ES1wRgrLdk8JPASxcOUpZjrQ5lfxW8KBnqqaXk8vUdthMl9ZvoIk46ezHMIZIRvMVxxGg5SExe0UF+WbGQ59dhlmLDnKXyoVHxVC2eU22Vfz29zcxxebJ4cNmmihrlifLLe2IVClV5q3PQdHVHMOX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783776086; c=relaxed/simple;
	bh=bq2Fu6RZtjHzu4/pas0YFn0rfgSLJIssAv+HNFQDNNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujlmm9b5DOx9Mi736lzz7cRhvNN6jfDQO/WtA5zc909SYT9cokwNaxRIGt0Q+ADDicVSQr6YsQx1BmmT//eIOS1EPH5NEbN6bmNeC/yGoUwlNp17F88oPdXjA3EzXlxILLDTCfWqeYm/tcnZXQeOrRPrjcyilqAC+sM+kSIykCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Y8/X9YQc; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Y8/X9YQc"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BBBrUp800067;
	Sat, 11 Jul 2026 13:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=O7lnCK
	XnQW2QPH2AldFO23uDPdCuDkc7c/nYmFujzPY=; b=Y8/X9YQc9yU/XnaCLjWF7r
	uUchAEqouSYg7cSx9WNzAx96N+iqCSfOpP3UnByT6n9dbYYziAafmSgkfmy1zMzK
	qtxEWXuPZZISpmaSgQ4LL2GGJ3+Vj/A+dMuvM3BWn3QvHw4r5mLXqt0Gf8A1LiSd
	dp+1hyRtPk8PCt2vDXHqBcJlNH5i2LO1mXtU6CrPHXx/TiVDuvbQH9cVIX0JtMKj
	Svr4f59X79PxpbHWltrDnGJPCJ2fYPOBg6sxJ/Tk4jehyJRHzifbFP+koZIRG05L
	XvTBy234TLv+BrQnzGLqPxPT1GsIZ4Kr9iD8nNzY1Lnfwb4xw4fnvztA+a09vDWg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fber8168p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jul 2026 13:21:14 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66BDK1MD007646;
	Sat, 11 Jul 2026 13:21:13 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7e0hxc8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Jul 2026 13:21:13 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66BDLBFj50069844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 Jul 2026 13:21:11 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A66A320043;
	Sat, 11 Jul 2026 13:21:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E83D020040;
	Sat, 11 Jul 2026 13:21:09 +0000 (GMT)
Received: from [9.39.28.176] (unknown [9.39.28.176])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 11 Jul 2026 13:21:09 +0000 (GMT)
Message-ID: <8e6869e6-4d7b-4cbe-93f4-d3ee242fea6a@linux.ibm.com>
Date: Sat, 11 Jul 2026 18:50:40 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [powerpc:fixes-test 10/12] include/linux/static_call.h:223:9:
 warning: data definition has no type or storage class
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        Josh Poimboeuf <jpoimboe@redhat.com>
References: <202607110847.u4TL0RJC-lkp@intel.com>
 <621a46b3-74a3-4a1f-b81f-f50ea18a541e@kernel.org>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <621a46b3-74a3-4a1f-b81f-f50ea18a541e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDEzMCBTYWx0ZWRfXx6GfIUTh6iXd
 QGwn5xcm/UmCT2hDYNzV8k4aHxhAH2u5z02JAmFACE5eHwvyITSnawZDPv2ivaHg6W44UJd1EPi
 bznFR/Jzs1mg/W9o4gv+iV5n0+vK3RuIEOGFsRb1YsDAXFBOHKPulToeW6faVTABvbTb3BnLNUe
 xhNSWMMiLGkL7rFf41dhUXVC2L/4XJIpbQSdQJCWZLHg7W3cQ3aB5q9o9dSiuIGkndQ9kmFVTrg
 hOneOSOLlkwNtXHKO5hcgvdGE+CrQdUD3fKLAEVGzlsFfFLQW/w4u+RKRdJWS9JYrMqFwFYuA2U
 zAJoFiPAkVfcdQzP2dalxJelT/+oCOVmApI7r1rFCjUTKgTX3QxEzXP6ChK0NAvsudgYYNCcY4/
 +4FcuAUEqvrvCCyVCLrJdK/CC3cIegXPNYdE07Hl46+x50fb1ASu5wcM95iQWKillSQUllVbQRa
 vgSZNbNGPrgkLkB8ECA==
X-Proofpoint-ORIG-GUID: V0otMKFZ1wVeNx_I_OVpQ3vuExixvjPp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDEzMCBTYWx0ZWRfX+2oFb/gbwxps
 81XGxChyhfFTIp0Bsb0cdq81GFfiQBhQNHSDFktJ8mvGs84zvVreKJWva5jCDT3LZh7PMqUp0JF
 yiGiJMMuFSGeKJKgoJKM5hyctCsbM/o=
X-Authority-Analysis: v=2.4 cv=TpzWQjXh c=1 sm=1 tr=0 ts=6a52434b cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=i3X5FwGiAAAA:8 a=7CQSdrXTAAAA:8 a=QyXUC8HyAAAA:8 a=yH6aI7yIYFAsTmX0VQgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mmqRlSCDY2ywfjPLJ4af:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: V0otMKFZ1wVeNx_I_OVpQ3vuExixvjPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110130

Hi Christophe,

On 7/11/26 1:10 PM, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 11/07/2026 à 03:52, kernel test robot a écrit :
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/ 
>> linux.git fixes-test
>> head:   afc2830892a128a13a65f677271a0a48aeb61b5e
>> commit: 4747e17fe063720a30b1c0075bae3e8f8acd26f4 [10/12] powerpc/32: 
>> Use HAVE_PREEMPT_DYNAMIC_CALL instead of HAVE_PREEMPT_DYNAMIC_KEY
>> config: powerpc-randconfig-001-20260711 (https://download.01.org/0day- 
>> ci/archive/20260711/202607110847.u4TL0RJC-lkp@intel.com/config)
>> compiler: powerpc-linux-gcc (GCC) 11.5.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/ 
>> archive/20260711/202607110847.u4TL0RJC-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new 
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202607110847.u4TL0RJC- 
>> lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>     In file included from include/linux/tracepoint.h:22,
>>                      from include/trace/syscall.h:5,
>>                      from include/linux/syscalls.h:95,
>>                      from include/linux/syscalls_api.h:1,
>>                      from kernel/sched/core.c:16:
>>>> include/linux/static_call.h:223:9: warning: data definition has no 
>>>> type or storage class
>>       223 |         ARCH_ADD_TRAMP_KEY(name)
> 
> Looks like powerpc is missing ARCH_ADD_TRAMP() macro, introduced by 
> commit 73f44fe19d35 ("static_call: Allow module use without exposing 
> static_call_key") for x86. I missed it when adding inline static calls 
> with commit f50b45626e05 ("powerpc/static_call: Implement inline static 
> calls").
> 
> I will have to fix that before we can activate HAVE_PREEMPT_DYNAMIC_CALL.
> 
> Christophe
> 

One more thing to note,

Below series would remove all the EXPORT_STATIC_CALL_TRAMP
instances in scheduler.
That series make sense given that none/voluntary can't be selected now.

https://lore.kernel.org/all/20260703133358.698078-1-mark.rutland@arm.com/
