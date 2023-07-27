Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351E3399
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 03:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690426889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=miXtVJYvgr/a4m1Ba4HP81yvhVVROcwTXQ1sj1GWEmE=;
	b=CGSd0AwAsHK5JLwWqBX3GL4TMsI6/6/HagvdgcXDk9gvUDWYd57cMpPxqSF84RwBi97Wdg
	SEashmqKzLhyGfO22I1vpiQFcOEcqbMetDAMOt34FeYi2mMrBxAOtH6pjk3+bCwj/pS2QX
	ZJH2nLTVXC5mFvQQnfKai/Mho8T7Vqg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-NU9LGsWsPIKLLZwWO-tMrw-1; Wed, 26 Jul 2023 23:01:25 -0400
X-MC-Unique: NU9LGsWsPIKLLZwWO-tMrw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F8FE85A58A;
	Thu, 27 Jul 2023 03:01:25 +0000 (UTC)
Received: from [10.22.33.138] (unknown [10.22.33.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 467862166B25;
	Thu, 27 Jul 2023 03:01:25 +0000 (UTC)
Message-ID: <f46e4f69-03af-9973-25d6-35e0050b4b7f@redhat.com>
Date: Wed, 26 Jul 2023 23:01:25 -0400
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [peterz-queue:x86/core 3/6] arch/x86/include/asm/paravirt.h:55:9:
 error: implicit declaration of function 'PVOP_VCALL0'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
References: <202307270118.Vk93Fixo-lkp@intel.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <202307270118.Vk93Fixo-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/26/23 13:34, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
> head:   1e68adb59894117251d942316d32514d45bd23ef
> commit: 5d78ed0959d293a570ef61dd9a6336aee75a483c [3/6] x86/speculation: Add __update_spec_ctrl() helper
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230727/202307270118.Vk93Fixo-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270118.Vk93Fixo-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307270118.Vk93Fixo-lkp@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>     In file included from arch/x86/include/asm/msr.h:236,
>                      from arch/x86/include/asm/nospec-branch.h:12,
>                      from arch/x86/include/asm/paravirt_types.h:27,
>                      from arch/x86/include/asm/ptrace.h:97,
>                      from arch/x86/include/asm/math_emu.h:5,
>                      from arch/x86/include/asm/processor.h:13,
>                      from arch/x86/include/asm/cpufeature.h:5,
>                      from arch/x86/include/asm/thread_info.h:53,
>                      from include/linux/thread_info.h:60,
>                      from arch/x86/include/asm/preempt.h:9,
>                      from include/linux/preempt.h:79,
>                      from include/linux/spinlock.h:56,
>                      from include/linux/swait.h:7,
>                      from include/linux/completion.h:12,
>                      from include/linux/crypto.h:15,
>                      from arch/x86/kernel/asm-offsets.c:9:
>     arch/x86/include/asm/paravirt.h: In function 'slow_down_io':

OK, it looks like we can't include asm/msr.h in asm/nospec-branch.h. I 
will try work around that and post a new version.

Thanks,
Longman

