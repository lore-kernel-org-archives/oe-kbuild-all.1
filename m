Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525AC1CAA6C;
	Thu, 18 Jun 2026 19:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781811187; cv=none; b=Ui81GtaikALte2j3Oq1+CEozAtGHVQ8TUcJwdHWFKvdYvJtsVPkpna8XNvWHG023N/m0NnwWOwKk0YJD2c90l+M3YR79hN5cZjhoIcoUyt97ZOoVo1Jqv9nr7x48d+PqXhJwF3vJsRC4G6Kplpgt/hrdCD6F6xSRIZLa+c/EnnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781811187; c=relaxed/simple;
	bh=jbw7nH/SleJ7izsm6pDgjvWsDyISaIOHSpBZGMBpk6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G/q1IZNuKc6zMaYekZuR67/Zaj/jwjeoN+7mQ1BFCIlGAWNOKb1vPsYqRnW2KqeaWEC6LmbvdKlPqF9ByjmXfGlR2LsEweDLFcdFCRTJOHgjABygEhaCLJipq3mhC6U45wj+vQ13TWSJ99agJ+HLvOrPSG81oyLunaSutXUlxwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=4ds/CkhS; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="4ds/CkhS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Vns4AkM7LBEuQEqheb4FJKwhZODtcNlIv2ZYD+zOODE=; b=4ds/CkhSn/SS4avY4fsM+umtnt
	CI9BYR4mVxJK70gg6/tBNSVflLWYTLJUts6qI53uBTxUbrXemsuKq4wRXRHjIn/CSNhDrHxOzVImu
	pTeilJRjbm5DEo9K2fuFU/q2cfml59C9XaNdGyo5dGxXIeJvkraOsbJfyHBDJhRE4CKU94jutd08Y
	p9PJGHfzDcTrHX2wCP6KLdfU7zQGJsgcQWtX6tu3fqksPxnijW7RD9H8zNLV09QrOp22tTenrUiVZ
	c3f5zxfBcgoT3jIKDv4J1wE9ZUzI/p4jK4BDATHvTUiDJJGo4qqDoa8KkEYYrrAq9DOliBgdeeaJd
	626zfgxw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waIU4-00000001kFU-3YIX;
	Thu, 18 Jun 2026 19:33:04 +0000
Message-ID: <299a6f3b-708d-490e-8866-f15bf851cf83@infradead.org>
Date: Thu, 18 Jun 2026 12:33:04 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: htmldocs: Documentation/scheduler/sched-arch.rst:108: WARNING:
 Block quote ends without a blank line; unexpected unindent. [docutils]
To: Shrikanth Hegde <sshegde@linux.ibm.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
References: <202606180717.yNM0yb41-lkp@intel.com>
 <f1a4c4c7-9ad8-40f5-b1a9-ba631977dac6@linux.ibm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <f1a4c4c7-9ad8-40f5-b1a9-ba631977dac6@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/17/26 10:19 PM, Shrikanth Hegde wrote:
> 
> 
> On 6/18/26 10:40 AM, kernel test robot wrote:
>> tree:   https://github.com/intel-lab-lkp/linux/commits/Shrikanth-Hegde/sched-debug-Remove-unused-schedstats/20260618-031604
>> head:   bcb0c494e4af36dd6306a5a1839a0c03046053af
>> commit: 4c29e4f3ba22adc04fc456620f2c6abf539d76df sched/docs: Document cpu_preferred_mask and Preferred CPU concept
>> date:   10 hours ago
>> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
>> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
>> reproduce: (https://download.01.org/0day-ci/archive/20260618/202606180717.yNM0yb41-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202606180717.yNM0yb41-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>     Checksumming on output with GSO
>>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ [docutils]
>>     MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]

>>     Documentation/scheduler/sched-arch.rst:107: ERROR: Unexpected indentation. [docutils]
>>>> Documentation/scheduler/sched-arch.rst:108: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>>     Documentation/userspace-api/landlock:504: ./security/landlock/errata/abi-4.h:5: ERROR: Unexpected section title.
>>
>>
>> vim +108 Documentation/scheduler/sched-arch.rst
>>
>>     102   
>>     103    Notes:
>>     104    1. This feature is available under CONFIG_PREFERRED_CPU
>>     105    2. This feature works for FAIR class only.
>>     106    3. A task pinned, which can't be moved to preferred CPUs will continue
>>     107       to run based on its affinity. But no load balancing happens
> 
> is it flagging here due to missing . ?

No, but you could add that anyway.

>>   > 108    4. If needed, steal time based governors/arch dependent method
>>     109       could be used to cater to different types of cpu numbers.
>>     110       Arch can do so by implementing its own hooks.
>>     111    5. Decision to use/not use is driven by kernel. Hence it shouldn't
>>     112       break user affinities. One of the main reason why CPU hotplug
>>     113       or Isolated cpuset partitions was not a solution.
>>     114   
It wants a blank line between each list item (if the list items are multi-line).
For the list above this one (3 items, all single line), blank lines aren't needed.
[These comments come from testing, not reading specs.]

I made these changes and a couple of others to make the rendered html look
reasonable.

Use (or not).
---
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com
Cc: sshegde@linux.ibm.com, tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com, mgorman@suse.de, bsegall@google.com, maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org, tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org
Subject: [PATCH v4 02/20] sched/docs: Document cpu_preferred_mask and Preferred CPU concept
Date: Wed, 17 Jun 2026 23:11:21 +0530
Message-ID: <20260617174139.155540-3-sshegde@linux.ibm.com>


Add documentation for new cpumask called cpu_preferred_mask. This could
help users in understanding what this mask is and the concept behind it.

Document how to enable it and implementation aspects of it.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
v3->v4:
- update docs to reflect preferred is subset of active.

 Documentation/scheduler/sched-arch.rst |   61 ++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 2 deletions(-)

--- linux-next.orig/Documentation/scheduler/sched-arch.rst
+++ linux-next/Documentation/scheduler/sched-arch.rst
@@ -6,7 +6,8 @@ CPU Scheduler implementation hints for a
 
 Context switch
 ==============
-1. Runqueue locking
+Runqueue locking
+
 By default, the switch_to arch function is called with the runqueue
 locked. This is usually not a problem unless switch_to may need to
 take the runqueue lock. This is usually due to a wake up operation in
@@ -62,11 +63,67 @@ Your cpu_idle routines need to obey the
 arch/x86/kernel/process.c has examples of both polling and
 sleeping idle functions.
 
+Preferred CPUs
+==============
+
+In virtualised environments it is possible to overcommit CPU resources.
+i.e sum of virtual CPU(vCPU) of all VM's is greater than number of physical
+CPUs(pCPU). Under such conditions when all or many VM's have high utilization,
+hypervisor won't be able to satisfy the CPU requirement and has to context
+switch within or across VM. i.e hypervisor need to preempt one vCPU to run
+another. This is called vCPU preemption. This is more expensive compared to
+task context switch within a vCPU.
+
+In such cases it is better that combined vCPU ask from all VM is reduced
+by not using some of the vCPUs. vCPUs where workload can be safely
+scheduled which won't increase any contention for pCPU are called as
+"Preferred CPUs".
+
+In most cases preferred CPUs will be same as active CPUs, when there is pCPU
+contention, Preferred CPUs will reduce based on the amount of steal time.
+When the pCPU contention goes away as indicated by steal time, Preferred CPUs
+will become same as active CPUs again. One has to enable the feature by
+writing 1 to /sys/kernel/debug/sched/steal_monitor/enable
+
+One of the design construct is preferred CPUs is always subset of active CPUs.
+With CONFIG_PREFERRED_CPU=n, it is same as active CPUs.
+
+For scheduling decisions such as wakeup, pushing the task etc, needs this
+CPU state info. This is maintained in cpu_preferred_mask.
+
+vCPUs which are not in cpu_preferred_mask should be treated as vCPUs which
+should not be used at this moment provided it doesn't break user affinity.
+This is achieved by:
+
+1. Selecting a preferred CPU at wakeup.
+2. Push the task away from non-preferred CPU at tick.
+3. Only select preferred CPUs for load balance.
+
+/sys/devices/system/cpu/preferred prints the current cpu_preferred_mask in
+cpulist format.
+
+Notes:
+
+1. This feature is available under CONFIG_PREFERRED_CPU
+
+2. This feature works for FAIR class only.
+
+3. A task pinned, which can't be moved to preferred CPUs will continue
+   to run based on its affinity. But no load balancing happens
+
+4. If needed, steal time based governors/arch dependent method
+   could be used to cater to different types of cpu numbers.
+   Arch can do so by implementing its own hooks.
+
+5. Decision to use/not use is driven by kernel. Hence it shouldn't
+   break user affinities. One of the main reason why CPU hotplug
+   or Isolated cpuset partitions was not a solution.
 
 Possible arch/ problems
 =======================
 
 Possible arch problems I found (and either tried to fix or didn't):
 
-sparc - IRQs on at this point(?), change local_irq_save to _disable.
+sparc:
+      - IRQs on at this point(?), change local_irq_save to _disable.
       - TODO: needs secondary CPUs to disable preempt (See #1)

