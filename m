Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31044431
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 12:44:08 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id bi20so2559792wmb.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 05:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20210112.gappssmtp.com; s=20210112; t=1678884247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ODrKHFuHlbbNzMQSNmLvZciPVvtivzZwnmk84xLYGq0=;
        b=OzL2gM+UeEjoL3AEB1ovAx5nyEtQ95ak+w2uwFAEK/6rlQrnD8kQW8qdoVrMBHY5q6
         CFB5lZmIjqRv59FjX2RgNJJgEbb31VpaA+xZc0FfuRcrwDG9djcr+uUf/8JSfhZFJcLn
         vFVK/CncDHKTmBfoe2ZQ6ZHmawYJu7HM+Uf9oIhPKRJ4H5p2lo+n/GXDV7uwgx5GAvBE
         pgSOXgQhVgoQN/BDx2wp9O/b256b1f9jelA0RkFjl1sw2FnhZuUJse2GXB7ZjdeurEZP
         HGlXZMEjwSDxO8MjZvRsiUt/0wF/aowPpReYc2qrRl39OK0huzpgylEvZ7J6Y66wmdkI
         hfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678884247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODrKHFuHlbbNzMQSNmLvZciPVvtivzZwnmk84xLYGq0=;
        b=oJCi82NndjpwHHp6jVC8HoWFXGAp/8ER7FTE84spYDsUrXCdKQVcXj335tIbvJvY8C
         BNoucxmEBSsHfLa1SxU/eW0w6In9ClnTBcFKfRIE2gzlKRj9pIevPOlOpu0QDScZ10oK
         c1RipNkrWSLERV/tjpw1OzRIFEovyWPGN+22RKTCI1tzrOeLDSiIicUZTA1pttiaIL9b
         1vBhqzLRI6LeKkUpSI3zsyLEUwk1Vkv/5owzzOZFly9MFS5H5OG5E/wnxKfZSXljl+gO
         x3VQ6uKUOKKsJEgDovvyEI9Aw9Zs8l9i2lMNmeAzTv7PQMq1iKGjTBnyqmbKH2mzHftC
         4PTw==
X-Gm-Message-State: AO0yUKVB8Mfed7B/49oAk95ksWQkuN9PN9cz930XLURlUtXrQSfHJYhb
	T75sO9OiSZREwUEEZobT/5jZtg==
X-Google-Smtp-Source: AK7set+Z0vhcZUReAUpqHE6U38OoZ+F+omEGy2JIABcogYA40skZwwrIul6i1UFqxPSsxHb6jd1iVg==
X-Received: by 2002:a05:600c:3b99:b0:3ed:2352:eebd with SMTP id n25-20020a05600c3b9900b003ed2352eebdmr10204827wms.11.1678884246784;
        Wed, 15 Mar 2023 05:44:06 -0700 (PDT)
Received: from airbuntu (host86-168-251-3.range86-168.btcentralplus.com. [86.168.251.3])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600c450800b003daf6e3bc2fsm5714405wmo.1.2023.03.15.05.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 05:44:06 -0700 (PDT)
Date: Wed, 15 Mar 2023 12:44:04 +0000
From: Qais Yousef <qyousef@layalina.io>
To: kernel test robot <lkp@intel.com>
Cc: Qais Yousef <qais.yousef@arm.com>, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [linux-stable-rc:queue/5.10 96/108]
 kernel/sched/sched.h:2560:27: error: 'struct rq' has no member named
 'cpu_capacity_inverted'
Message-ID: <20230315124404.3266l6k3ygsyempp@airbuntu>
References: <202303151800.NP9tJsgK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202303151800.NP9tJsgK-lkp@intel.com>

On 03/15/23 19:01, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
> head:   e6a15a9d1bcf661f6bb79a1c2dce0c796234ac80
> commit: db4f76185823d00afb688cbd63fdf7200de209ea [96/108] sched/fair: Detect capacity inversion
> config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230315/202303151800.NP9tJsgK-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=db4f76185823d00afb688cbd63fdf7200de209ea
>         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc queue/5.10
>         git checkout db4f76185823d00afb688cbd63fdf7200de209ea
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303151800.NP9tJsgK-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/sched/core.c:13:
>    kernel/sched/sched.h: In function 'cpu_in_capacity_inversion':
> >> kernel/sched/sched.h:2560:27: error: 'struct rq' has no member named 'cpu_capacity_inverted'
>     2560 |         return cpu_rq(cpu)->cpu_capacity_inverted;
>          |                           ^~
>    kernel/sched/core.c: In function 'ttwu_stat':
>    kernel/sched/core.c:2430:20: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
>     2430 |         struct rq *rq;
>          |                    ^~
> --
>    In file included from kernel/sched/loadavg.c:9:
>    kernel/sched/sched.h: In function 'cpu_in_capacity_inversion':
> >> kernel/sched/sched.h:2560:27: error: 'struct rq' has no member named 'cpu_capacity_inverted'
>     2560 |         return cpu_rq(cpu)->cpu_capacity_inverted;
>          |                           ^~

Need to extend the #ifdef CONFIG_SMP to wrap the new functioin

	diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
	index 10b717533f62..852e856eed48 100644
	--- a/kernel/sched/sched.h
	+++ b/kernel/sched/sched.h
	@@ -2540,7 +2540,6 @@ static inline unsigned long capacity_orig_of(int cpu)
	 {
		return cpu_rq(cpu)->cpu_capacity_orig;
	 }
	-#endif

	 /*
	  * Returns inverted capacity if the CPU is in capacity inversion state.
	@@ -2559,6 +2558,7 @@ static inline unsigned long cpu_in_capacity_inversion(int cpu)
	 {
		return cpu_rq(cpu)->cpu_capacity_inverted;
	 }
	+#endif

	 /**
	  * enum schedutil_type - CPU utilization type

Should I resend with the fix applied?


Thanks!

--
Qais Yousef

> 
> 
> vim +2560 kernel/sched/sched.h
> 
>   2544	
>   2545	/*
>   2546	 * Returns inverted capacity if the CPU is in capacity inversion state.
>   2547	 * 0 otherwise.
>   2548	 *
>   2549	 * Capacity inversion detection only considers thermal impact where actual
>   2550	 * performance points (OPPs) gets dropped.
>   2551	 *
>   2552	 * Capacity inversion state happens when another performance domain that has
>   2553	 * equal or lower capacity_orig_of() becomes effectively larger than the perf
>   2554	 * domain this CPU belongs to due to thermal pressure throttling it hard.
>   2555	 *
>   2556	 * See comment in update_cpu_capacity().
>   2557	 */
>   2558	static inline unsigned long cpu_in_capacity_inversion(int cpu)
>   2559	{
> > 2560		return cpu_rq(cpu)->cpu_capacity_inverted;
>   2561	}
>   2562	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
