Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB34366
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Aug 2023 00:12:28 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-63d0d38ff97so1763736d6.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 09 Aug 2023 17:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691626348; x=1692231148;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5uOVqVWqPz+ojEEhEhryKkkf49SNrsxUtFxYnP4qxc=;
        b=gonEncTWJ/PeSDPOxS1kXr8sebHJRFWOsmPPsFW1ADHeNyQ5oV8oX4BnF/G1DuXNjD
         xAngFrdKO8PIjrZromMknyi9RqvQxFzsU2rHFc2pKeduTuJ0X4rsdIVshlmL8zJr/agj
         57HLSuLYEGTGyuN3dG13rJQgZMVB+BujRrWNtt4q/CKoMqcai+fLxykJDNLV3USZ+/0N
         of0onx0fJRMi7GVnPnQckN26Od9+XEK0qqVWrhbEuaOoi1gOTlA+edB/weC1rcgaX9qS
         Qk3gOwALIQeuxa8LcgkVXEWpYbzXHaz+mY1nSTyEWx6Z1ydjcLZO+7ZmVZ3iievTUU5q
         Jj9A==
X-Gm-Message-State: AOJu0YyD2aGI8A5RLPRN+mTYQx8M5SmLwlJpRN3nLOyzVTf8qQvQVysH
	p4i4e8jmli2HLwIGh6RiKTeeGvu6yw+l71BV
X-Google-Smtp-Source: AGHT+IHe3nbetZPK9iWXTtqUu+9Lk/g0GoPger/cQi6c5kYym9FBp6r39B0FLwgMoydV/Elhiodm3Q==
X-Received: by 2002:a0c:e445:0:b0:636:1275:8419 with SMTP id d5-20020a0ce445000000b0063612758419mr622014qvm.13.1691626347726;
        Wed, 09 Aug 2023 17:12:27 -0700 (PDT)
Received: from maniforge ([2620:10d:c091:400::5:ed08])
        by smtp.gmail.com with ESMTPSA id u8-20020a0cdd08000000b006360778f314sm57180qvk.105.2023.08.09.17.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 17:12:27 -0700 (PDT)
Date: Wed, 9 Aug 2023 19:12:24 -0500
From: David Vernet <void@manifault.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, tj@kernel.org,
	roman.gushchin@linux.dev, gautham.shenoy@amd.com,
	kprateek.nayak@amd.com, aaron.lu@intel.com,
	wuyun.abel@bytedance.com, kernel-team@meta.com
Subject: Re: [PATCH v3 7/7] sched: Shard per-LLC shared runqueues
Message-ID: <20230810001224.GA194574@maniforge>
References: <20230809221218.163894-8-void@manifault.com>
 <202308100717.LGL1juJR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308100717.LGL1juJR-lkp@intel.com>
User-Agent: Mutt/2.2.10 (2023-03-25)

On Thu, Aug 10, 2023 at 07:46:37AM +0800, kernel test robot wrote:
> Hi David,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on tip/sched/core]
> [cannot apply to linus/master v6.5-rc5 next-20230809]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Vernet/sched-Expose-move_queued_task-from-core-c/20230810-061611
> base:   tip/sched/core
> patch link:    https://lore.kernel.org/r/20230809221218.163894-8-void%40manifault.com
> patch subject: [PATCH v3 7/7] sched: Shard per-LLC shared runqueues
> config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230810/202308100717.LGL1juJR-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100717.LGL1juJR-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308100717.LGL1juJR-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/sched/fair.c:198: warning: expecting prototype for struct shared_runq. Prototype was for struct shared_runq_shard instead

I'll split this comment up in v4.
