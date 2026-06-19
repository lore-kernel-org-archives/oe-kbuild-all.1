Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ADB40D59D;
	Fri, 19 Jun 2026 04:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781843183; cv=none; b=clMR5amOfiV8YjO/Gr+yTWM7fiZFhZsgQkovykjsSK3nq3APxXEuK3YERwrsAk3rECE7hABuKPcsYz903lvOQ9bNUUirTV6/4gt2nAhff9D2/ERot9lit0jaND3Xm5voMX9vy4/2XOpwRP/Lj79rPxWnc5pXWZN6/CQyUb01yqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781843183; c=relaxed/simple;
	bh=uwxAwMXrGqhDiqQ3swQsEHdcdNPKbjnfEdjrLsxkWhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3CTxVfl/h+PLFbWEgWUdh16thoNLCZrH3br6O+hZw2nyxQ1HdfFbY+6fnnetwSCGXnlgIZ/rt8IvIaIPy4Cc4kJYpY5DO8PijO0W+Mssie8nLUr6IZQEy/aM2ni6E6V9W+kk98ipqkdpcEYlLDJGAAYB65Q4jde2JmUzxrlFTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=niBwA7YU; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="niBwA7YU"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65J3IHEL1055914;
	Fri, 19 Jun 2026 04:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=p5ZBqd
	Pp5QejhFBSFSFxMK8E6kAD6z5spAbmb8Wl6v8=; b=niBwA7YUBwRsPsD8fISyUg
	laBO1IKnttTKWuviezorNvQkw/dwZf9efQ5+VRd36YJuhHcX7QHo1znV6CuMyjcC
	GckJDx8RUATc+7hSOQIHTQdvZEg2h70tkDXaCEMWUV3vel3+yZgMlx19Bx3cIHtM
	boA0sTFT9KAjxnYoWeo4TYKuXnrPJMkaJUj1DdECWbPhoYlDmikyrygk4ltgILkE
	OEFfmKQI17DZg2sfzsmrInflAJr8LiGoRuX9aThpmQKoss/ouyoTKZBd79JdBhaS
	h3zBHEFiS9Ed1b6Q5v7uUnj72ErKoSRJFeHhT0hA2c711ww1r4O6QkoNf6n2usRA
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4eueqxkec1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 04:25:12 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65J4Jsrs018367;
	Fri, 19 Jun 2026 04:25:11 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ev17273rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Jun 2026 04:25:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65J4P9QC49742180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Jun 2026 04:25:10 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEE9A20040;
	Fri, 19 Jun 2026 04:25:09 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CFD320043;
	Fri, 19 Jun 2026 04:25:08 +0000 (GMT)
Received: from [9.39.16.125] (unknown [9.39.16.125])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 Jun 2026 04:25:08 +0000 (GMT)
Message-ID: <7f5909c9-0bff-4183-84a7-050d7a94fc2f@linux.ibm.com>
Date: Fri, 19 Jun 2026 09:55:07 +0530
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: htmldocs: Documentation/scheduler/sched-arch.rst:108: WARNING:
 Block quote ends without a blank line; unexpected unindent. [docutils]
To: Randy Dunlap <rdunlap@infradead.org>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
References: <202606180717.yNM0yb41-lkp@intel.com>
 <f1a4c4c7-9ad8-40f5-b1a9-ba631977dac6@linux.ibm.com>
 <299a6f3b-708d-490e-8866-f15bf851cf83@infradead.org>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <299a6f3b-708d-490e-8866-f15bf851cf83@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=OcSoyBTY c=1 sm=1 tr=0 ts=6a34c4a8 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=NEAV23lmAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=JfrnYn6hAAAA:8 a=20KFwNOVAAAA:8 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=zd2uoN0lAAAA:8 a=ag1SF4gXAAAA:8 a=1XWaLZrsAAAA:8 a=meVymXHHAAAA:8
 a=7CQSdrXTAAAA:8 a=QY18SFpNAAAA:8 a=5Jhpb4gTAAAA:8 a=Ikd4Dj_1AAAA:8
 a=nE6AjyESf_fJV4SWJfoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mmqRlSCDY2ywfjPLJ4af:22 a=1CNFftbPRP8L7MoqJWF3:22 a=cvBusfyB2V15izCimMoJ:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=2JgSa4NbpEOStq-L5dxp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=mZPqAYP_hWW8blobX25d:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDAzNSBTYWx0ZWRfXxpPdNDCwt5fW
 cfZWYhF34eSTmIIQyM5L9BMBkWAXEDWfRmCDDYHvtdVbQmyxAoSFvpwRaD6Xr94kQfuFkaJQ5PZ
 rW08oGlKaLAk9uZRATz5e8A1YLFpOSaP5Pjwd2ODKxQr/2gzlQzC7dqcCooxS8lf8hdkvo2msc8
 dcq0EAhI8eAGGF06ZnPQZFmJ/+2ajd5ZkUdiQ9rnFNGeZ7qM3oM6Rd5YkNiR/vjtEK3tpXRZh6b
 20jejI6/XYINPhoCjjL/AH7XFQh/3U9xmW/j0mDGi3Rh9Fz/cyj5E0e8qxQ5Yf3IOR3apU/SaXb
 nYTpK21khJfkhrUvQZiygnzlxNFXczoJYVWiermXOKQBPBi1FsQmZr3aVS1S1Ss4ZtJYnv3lCmz
 WTXmSDXxkG+lyTVa5eszSjN64W27QUOVbeK2SlHJNtqV70UfTjwcpRY3dUwlIGqI/immr1nlJZP
 ZgXt8Yy/ROMrnmlPbaw==
X-Proofpoint-GUID: RJFa1qbhnjCUSCFaLeSNN13e1TKnCyie
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDAzNSBTYWx0ZWRfXyQUaZTcZzO5V
 xsGEXg2aRiEDyaaz9FowgE3RI1tJlS55Nkbx5uww6w3SyyNXnOF6N7n1jUg1lr6yexl0VLcnlwj
 3k9y3pC6tp3/ub7UL7RPMOKMmfN6Iw0=
X-Proofpoint-ORIG-GUID: RJFa1qbhnjCUSCFaLeSNN13e1TKnCyie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190035

Hi Randy, thanks for going through.

On 6/19/26 1:03 AM, Randy Dunlap wrote:
> 
> 
> On 6/17/26 10:19 PM, Shrikanth Hegde wrote:
>>
>>
>> On 6/18/26 10:40 AM, kernel test robot wrote:
>>> tree:   https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/sched-debug-Remove-unused-schedstats/20260618-031604
>>> head:   bcb0c494e4af36dd6306a5a1839a0c03046053af
>>> commit: 4c29e4f3ba22adc04fc456620f2c6abf539d76df sched/docs: Document cpu_preferred_mask and Preferred CPU concept
>>> date:   10 hours ago
>>> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
>>> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
>>> reproduce: (https://download.01.org/0day-ci/archive/20260618/202606180717.yNM0yb41-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202606180717.yNM0yb41-lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>      Checksumming on output with GSO
>>>      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
>>>      MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]
> 
>>>      Documentation/scheduler/sched-arch.rst:107: ERROR: Unexpected indentation. [docutils]
>>>>> Documentation/scheduler/sched-arch.rst:108: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>>>      Documentation/userspace-api/landlock:504: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.
>>>
>>>
>>> vim +108 Documentation/scheduler/sched-arch.rst
>>>
>>>      102
>>>      103    Notes:
>>>      104    1. This feature is available under CONFIG_PREFERRED_CPU
>>>      105    2. This feature works for FAIR class only.
>>>      106    3. A task pinned, which can't be moved to preferred CPUs will continue
>>>      107       to run based on its affinity. But no load balancing happens
>>
>> is it flagging here due to missing . ?
> 
> No, but you could add that anyway.
> 
>>>    > 108    4. If needed, steal time based governors/arch dependent method
>>>      109       could be used to cater to different types of cpu numbers.
>>>      110       Arch can do so by implementing its own hooks.
>>>      111    5. Decision to use/not use is driven by kernel. Hence it shouldn't
>>>      112       break user affinities. One of the main reason why CPU hotplug
>>>      113       or Isolated cpuset partitions was not a solution.
>>>      114
> It wants a blank line between each list item (if the list items are multi-line).
> For the list above this one (3 items, all single line), blank lines aren't needed.
> [These comments come from testing, not reading specs.]
> 

Ah ok. I was wondering why it flagged only that.

> I made these changes and a couple of others to make the rendered html look
> reasonable.
> 
> Use (or not).

Sure. thanks.

> ---
> From: Shrikanth Hegde <sshegde@linux.ibm.com>
> To: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com
> Cc: sshegde@linux.ibm.com, tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com, mgorman@suse.de, bsegall@google.com, maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org, tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org
> Subject: [PATCH v4 02/20] sched/docs: Document cpu_preferred_mask and Preferred CPU concept
> Date: Wed, 17 Jun 2026 23:11:21 +0530
> Message-ID: <20260617174139.155540-3-sshegde@linux.ibm.com>
> 
> 
> Add documentation for new cpumask called cpu_preferred_mask. This could
> help users in understanding what this mask is and the concept behind it.
> 
> Document how to enable it and implementation aspects of it.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v3->v4:
> - update docs to reflect preferred is subset of active.
> 
>   Documentation/scheduler/sched-arch.rst |   61 ++++++++++++++++++++++-
>   1 file changed, 59 insertions(+), 2 deletions(-)
> 
> --- linux-next.orig/Documentation/scheduler/sched-arch.rst
> +++ linux-next/Documentation/scheduler/sched-arch.rst
> @@ -6,7 +6,8 @@ CPU Scheduler implementation hints for a
>   
>   Context switch
>   ==============
> -1. Runqueue locking
> +Runqueue locking
> +
>   By default, the switch_to arch function is called with the runqueue
>   locked. This is usually not a problem unless switch_to may need to
>   take the runqueue lock. This is usually due to a wake up operation in
> @@ -62,11 +63,67 @@ Your cpu_idle routines need to obey the
>   arch/x86/kernel/process.c has examples of both polling and
>   sleeping idle functions.
>   
> +Preferred CPUs
> +==============
> +
> +In virtualised environments it is possible to overcommit CPU resources.
> +i.e sum of virtual CPU(vCPU) of all VM's is greater than number of physical
> +CPUs(pCPU). Under such conditions when all or many VM's have high utilization,
> +hypervisor won't be able to satisfy the CPU requirement and has to context
> +switch within or across VM. i.e hypervisor need to preempt one vCPU to run
> +another. This is called vCPU preemption. This is more expensive compared to
> +task context switch within a vCPU.
> +
> +In such cases it is better that combined vCPU ask from all VM is reduced
> +by not using some of the vCPUs. vCPUs where workload can be safely
> +scheduled which won't increase any contention for pCPU are called as
> +"Preferred CPUs".
> +
> +In most cases preferred CPUs will be same as active CPUs, when there is pCPU
> +contention, Preferred CPUs will reduce based on the amount of steal time.
> +When the pCPU contention goes away as indicated by steal time, Preferred CPUs
> +will become same as active CPUs again. One has to enable the feature by
> +writing 1 to /sys/kernel/debug/sched/steal_monitor/enable
> +
> +One of the design construct is preferred CPUs is always subset of active CPUs.
> +With CONFIG_PREFERRED_CPU=n, it is same as active CPUs.
> +
> +For scheduling decisions such as wakeup, pushing the task etc, needs this
> +CPU state info. This is maintained in cpu_preferred_mask.
> +
> +vCPUs which are not in cpu_preferred_mask should be treated as vCPUs which
> +should not be used at this moment provided it doesn't break user affinity.
> +This is achieved by:
> +
> +1. Selecting a preferred CPU at wakeup.
> +2. Push the task away from non-preferred CPU at tick.
> +3. Only select preferred CPUs for load balance.
> +
> +/sys/devices/system/cpu/preferred prints the current cpu_preferred_mask in
> +cpulist format.
> +
> +Notes:
> +
> +1. This feature is available under CONFIG_PREFERRED_CPU
> +
> +2. This feature works for FAIR class only.
> +
> +3. A task pinned, which can't be moved to preferred CPUs will continue
> +   to run based on its affinity. But no load balancing happens
> +
> +4. If needed, steal time based governors/arch dependent method
> +   could be used to cater to different types of cpu numbers.
> +   Arch can do so by implementing its own hooks.
> +
> +5. Decision to use/not use is driven by kernel. Hence it shouldn't
> +   break user affinities. One of the main reason why CPU hotplug
> +   or Isolated cpuset partitions was not a solution.
>   
>   Possible arch/ problems
>   =======================
>   
>   Possible arch problems I found (and either tried to fix or didn't):
>   
> -sparc - IRQs on at this point(?), change local_irq_save to _disable.
> +sparc:
> +      - IRQs on at this point(?), change local_irq_save to _disable.
>         - TODO: needs secondary CPUs to disable preempt (See #1)
> 

