Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BA11D86C4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 10:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729850477; cv=none; b=SmeCjNAO2ZqoZ3q2svhLFx/+y+GyBPO/dlgklLRm1HPTRv2hikbXF2SfbrPFPKcf2mpO/B+sdr6bsTOFDl56v7GZiIanzIBSUqL9XntEsYsVZwOrlYENA1HNWfjWFEqoStNQYddapg+x2USq1Tz1CXf9rW2bIfQDOlvU6Yi2eqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729850477; c=relaxed/simple;
	bh=PhhRQGAk7xkZb7McC5o/7fUc3tRZDZ4uAhMFlHJZs+A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ufv7WaYAkFNb2slQjgLXDlV7tAX060GL2W63D2cVp1zpedjsA7EyBL2tRqpmxlyzKZHr8vkx4WCNJXtC/KFdd7gj5Ub1RtEG3hNLOzs+G81n9DQ1cE8oRq7bFq+SjHHH+6QSisDMv70rF68zYzCF2pghfx9oLDCjhAHIB4ZH2cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B818A339;
	Fri, 25 Oct 2024 03:01:43 -0700 (PDT)
Received: from [10.57.55.246] (unknown [10.57.55.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24B9D3F73B;
	Fri, 25 Oct 2024 03:01:10 -0700 (PDT)
Message-ID: <087769c7-f8e7-4701-b6f1-4585570b8be8@arm.com>
Date: Fri, 25 Oct 2024 11:01:08 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/uclamp: Fix unnused variable warning
From: Christian Loehle <christian.loehle@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Valentin Schneider <vschneid@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Sebastian Siewior <bigeasy@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, oe-kbuild-all@lists.linux.dev,
 kernel test robot <lkp@intel.com>
References: <b2ad1f31-21b9-42a5-a735-b9496470348a@arm.com>
Content-Language: en-US
In-Reply-To: <b2ad1f31-21b9-42a5-a735-b9496470348a@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 09:23, Christian Loehle wrote:
> uclamp_mutex is only used for CONFIG_SYSCTL or
> CONFIG_UCLAMP_TASK_GROUP so ifdef that to fix the compile-time warning.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410060258.bPl2ZoUo-lkp@intel.com/
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> ---
>  kernel/sched/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 43e453ab7e20..18d9622eac8d 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1394,7 +1394,9 @@ void set_load_weight(struct task_struct *p, bool update_load)
>   * requests are serialized using a mutex to reduce the risk of conflicting
>   * updates or API abuses.
>   */
> +#if defined(CONFIG_UCLAMP_TASK_GROUP) || defined(CONFIG_SYSCTL)
>  static DEFINE_MUTEX(uclamp_mutex);
> +#endif
>  
>  /* Max allowed minimum utilization */
>  static unsigned int __maybe_unused sysctl_sched_uclamp_util_min = SCHED_CAPACITY_SCALE;

Gentle ping and adding CCs
