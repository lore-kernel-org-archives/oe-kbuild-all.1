Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6661E0DD8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 03:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752724376; cv=none; b=bmtjyXZ2gUBytk//XPo0erYw1MuUHP34v0qj8i9FQ0J43Qdu/1aS8vj/RtkeznMO7ZCeNabLcGsAkYNly4sG3FXTlabVAcHOi4WAPOGFsF/1JX7n1SarOs2RS+fATJbMXTof1rvSCmOzKHMdqf6DG2EAD+w3VxBxHeoVkbxdh6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752724376; c=relaxed/simple;
	bh=/z4GYwHjaobsFfMLWkEpzmAPQ7BYXuHIegjFwl/GFN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m15fPpmNQ1pMW3BnnE7HuxZZezwv6avjzujvQrBVau0XJIFeKQZC/Q0V6lYkU1qsYaSrlxuq68ftCldLmNihumRudVIB+b1l6p3z9xASqHC7/gaRSyTJGigxtAgmUCUghcg5Hlb10MaBegZmeDPGznp2y5KbiDNiIEumSbzGafI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Ppd2uxTB; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Ppd2uxTB"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-31c4a546cc2so519460a91.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 20:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1752724374; x=1753329174; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oG3EpdW9G1k+entmtME8v9DE+8iik/HrDmrP2Q0Le7k=;
        b=Ppd2uxTBhOwC51YI9QmQO1lpD4ZXc7RJzRo6Oo98gSDUzZA1ksVLc4t3P7Di1WJ/wG
         kJUwbijmiHF1L5napYMcxa5ekCsKv/7aiwgW84L+7eGBgEps/cQYpMwodattDfO8Ee5e
         s3x7BJ2Q4xAxNlZOiTK7DTohkV2039cftHFlSfBSDXWgs6hfpRX5/j9sPdynz0qZx4RB
         LBnWCZSX0MzFRA/X6JNr8QLwfFChq3Emsz/ANyw1pSDwHZgzLj0hY0LarXIo+vMnQImm
         USjMKPY53/bB981X312ze0EPpKILO6QkWEluvmBoWH+4zkOt04rp7CEJfMa6QyTNOyCN
         9PLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752724374; x=1753329174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oG3EpdW9G1k+entmtME8v9DE+8iik/HrDmrP2Q0Le7k=;
        b=ohWImO78BnMcUdq1jom+nQWeTuXJrPB+pTePgbQNYJRMAJGxO3O+1oH6vC/Ep1l+X+
         Y+/j4+23JqYqUXcOPCrhDT8nwRfzn4ck5xfSgHFrudR4zQFGkYCDXmaERKANgBYVOk7p
         PTMbUIChCW6w1eVXIagbpphZEObs7WoPSAlq/7sCNity/hAQoBgpENucxEJRMqvsdc9x
         3sSSVt+5JnHbodmyWQuQV48MBYuXnSOHyYY9rizhxzMPsfnlTN6EptcjFPNepctyWjSK
         QuBsY1CH0yI2quqI5cav6iR0faA5+Q6/DRtAbpV9xzQ6uMP1jchFLEqwC4vR2BetAMoW
         SD3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXglotkoqYiNagoBVTc3vD39ql3XXc61WcLISJEYlx9owwq30AzbqlcJ6CC9eeJQBI11+nmZ+kaoU9RO8WP@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4V9C0Nt/6GuaoimINFJzmrDCmma64mvmnlOASCSsGSbJTYaho
	f0og3kZJCy9ctodUAma1O3tsr3knHNEZSC9xkZhcAov2PJ4tpcNFuCQs3VNgriOm9A==
X-Gm-Gg: ASbGnctEvuqttb0Pzg0u8WBSOr7milGC6IvO+xcLwfG0/32gHgbq34zoj9jxn4DyHol
	VX/CctgDTfNDuMRZpQ3S/5fi8onlCd1/fF6JkSm73Pby9BZv3CAergxLQ/Omv8hg40WTQ0Fr+2H
	Sgm5VU0jW+G22vEnnDaA0QzMOaIpRmD5uxmo86FNjFsb3xVUmjqIqtZCAshD1IGYDFju7XSrR88
	l3ER+KWFwGdrE4kRgvtxjVgLd9K7MziInbv+cR4yuoOqGrhjy/eN42QCOQe5u9IFYxyoEhTTMDR
	Za16ZYFZxpblLEj1EU1TNzDcqnzwYZ/Agad8uAX30xnHNBNnehYytJBSLgrsApGIFNagM2xcD6v
	2711ly92h4GpZZutC2rQfGQFl1Bm7sokKs3PHP8gUKcs=
X-Google-Smtp-Source: AGHT+IELl7UWfL6ReDIoZqrYNbMcjyrb0hKdAQ12X0Ce9k4vgLuaUhoqNyvz4Zmk/h8IJ45JTVxenQ==
X-Received: by 2002:a17:90b:3909:b0:311:e305:4e97 with SMTP id 98e67ed59e1d1-31c9f4a6b52mr6301277a91.19.1752724373988;
        Wed, 16 Jul 2025 20:52:53 -0700 (PDT)
Received: from bytedance ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf7aa70esm497490a91.6.2025.07.16.20.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 20:52:53 -0700 (PDT)
Date: Thu, 17 Jul 2025 11:52:43 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: kernel test robot <lkp@intel.com>
Cc: Valentin Schneider <vschneid@redhat.com>,
	Ben Segall <bsegall@google.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Xi Wang <xii@google.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,
	Chuyi Zhou <zhouchuyi@bytedance.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Florian Bezdeka <florian.bezdeka@siemens.com>,
	Songtang Liu <liusongtang@bytedance.com>
Subject: Re: [PATCH v3 3/5] sched/fair: Switch to task based throttle model
Message-ID: <20250717035243.GC32@bytedance>
References: <20250715071658.267-4-ziqianlu@bytedance.com>
 <202507162238.qiw7kyu0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507162238.qiw7kyu0-lkp@intel.com>

On Wed, Jul 16, 2025 at 11:20:55PM +0800, kernel test robot wrote:
> Hi Aaron,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on tip/sched/core]
> [also build test WARNING on next-20250716]
> [cannot apply to linus/master v6.16-rc6]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Lu/sched-fair-Add-related-data-structure-for-task-based-throttle/20250715-152307
> base:   tip/sched/core
> patch link:    https://lore.kernel.org/r/20250715071658.267-4-ziqianlu%40bytedance.com
> patch subject: [PATCH v3 3/5] sched/fair: Switch to task based throttle model
> config: xtensa-randconfig-r121-20250716 (https://download.01.org/0day-ci/archive/20250716/202507162238.qiw7kyu0-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 8.5.0
> reproduce: (https://download.01.org/0day-ci/archive/20250716/202507162238.qiw7kyu0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507162238.qiw7kyu0-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    kernel/sched/core.c: note: in included file (through arch/xtensa/include/asm/bitops.h, include/linux/bitops.h, include/linux/thread_info.h, ...):
>    arch/xtensa/include/asm/processor.h:105:2: sparse: sparse: Unsupported xtensa ABI
>    arch/xtensa/include/asm/processor.h:135:2: sparse: sparse: Unsupported Xtensa ABI
>    kernel/sched/core.c: note: in included file:
> >> kernel/sched/sched.h:741:44: sparse: sparse: dubious one-bit signed bitfield

Same problem as last report.

I've downloaded this compiler from kernel.org and confirmed there is no
such warnings after using bool.

Thanks,
Aaron
