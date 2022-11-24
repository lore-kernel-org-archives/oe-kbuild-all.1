Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC8823AE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Nov 2022 09:32:29 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id v1so1565752wrt.11
        for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Nov 2022 01:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xDj10TAbIJfK8BfLajcC+lipEkuKWyOK/mUR17sUMU8=;
        b=OoRqUh4v5X8u/x93mS5wNPRkBWoTAUcUfOYPAnoSKVq/DkFB3mVQqj37YKFTuWIcvY
         a3WadxkJqCl81Qa9keOUgS5yOdAtPcJUPK5pmzB5mK6D0Yn6aFRqyJ0GVEwaWObhVTk3
         GhWJdF3+uzzrw7Tci3O2Bp6mJgjty+8jBSruZJRZYeK25K1axvfh+YDsnpP4r58WC3R6
         drwLQMr9Ubmso8K4FGkdp3Rwfcn21Xlt/2P9/XCo/mMss5L7EmRqjaT5oqKOa9+gr0kg
         zUyegOaxC16XH/jHYMvUkdG4dgere1PxXEvlsCM3WqJFSx4bQIcae+VP4pnhLxg33oGO
         IBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDj10TAbIJfK8BfLajcC+lipEkuKWyOK/mUR17sUMU8=;
        b=079IUkZ3NLFqadYFr6+e2wrh9SZcG5ECWIWAdf8IhGblmTzICTyL6GVtfE9B+Oh4vm
         TbhLC76i5c+NZc7PKVM+3nL/OeKMeVFVqXSBDnwZkXj2C5mJD+rSpRhC5k+vPFsiy9q+
         KcnUlr+SFyELvX2Q8rlOdqaf2QkHPmJOb3w2hta9JEtkVEXn2rUANRdh9dWjoxDT6mhk
         Qbil/CPs4jBfbR8UMsBdKNvd4PwIswprkQuqriNyJGjmLzZzqtnnEN7H43HQdeQlpTg8
         sLJd/QLNIBz3HFpWnONNElc/8zvV2ke0SbnxXeu2xE56PFDM8c0PZAx77o8CtHn0N9tV
         Ulag==
X-Gm-Message-State: ANoB5pnog9FROSPyYy/igCdCh/+nF4NcavTyGkUmkz8Kni6vV7JxLS8J
	KuPOx++oFgfENpsNWiDDhRMWrqrzQaQ=
X-Google-Smtp-Source: AA0mqf75OsNM2796SMfwMtIQ83CSl+SZnkZUxAgL1daB3Jkv0tEe3h/rHzF6bUYfncIyhUmlxZyTIA==
X-Received: by 2002:a5d:6191:0:b0:236:6102:bf3d with SMTP id j17-20020a5d6191000000b002366102bf3dmr19173821wru.705.1669282347523;
        Thu, 24 Nov 2022 01:32:27 -0800 (PST)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id q4-20020adff944000000b002366c3eefccsm832474wrr.109.2022.11.24.01.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 01:32:26 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 24 Nov 2022 10:32:25 +0100
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [linux-stable-rc:queue/6.0 311/314] include/linux/bpf.h:2310:20:
 error: static declaration of 'bpf_prog_inc_misses_counter' follows
 non-static declaration
Message-ID: <Y386KQJ3/WN8apop@krava>
References: <202211232231.Y6OJy9KQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202211232231.Y6OJy9KQ-lkp@intel.com>

On Wed, Nov 23, 2022 at 10:15:29PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/6.0
> head:   18012ab4ede3cad45033b4403c744a54d0b81438
> commit: 618ec81a64fe23571a79b77c26b5d326425934f8 [311/314] bpf: Prevent bpf program recursion for raw tracepoint probes
> config: microblaze-randconfig-r032-20221120
> compiler: microblaze-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=618ec81a64fe23571a79b77c26b5d326425934f8
>         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc queue/6.0
>         git checkout 618ec81a64fe23571a79b77c26b5d326425934f8
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash kernel/bpf/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from tools/lib/bpf/relo_core.c:5:
> >> include/linux/bpf.h:2310:20: error: static declaration of 'bpf_prog_inc_misses_counter' follows non-static declaration
>     2310 | static inline void bpf_prog_inc_misses_counter(struct bpf_prog *prog)
>          |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/bpf.h:1970:14: note: previous declaration of 'bpf_prog_inc_misses_counter' with type 'void(struct bpf_prog *)'
>     1970 | void notrace bpf_prog_inc_misses_counter(struct bpf_prog *prog);
>          |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> --
>    In file included from kernel/bpf/syscall.c:4:
> >> include/linux/bpf.h:2310:20: error: static declaration of 'bpf_prog_inc_misses_counter' follows non-static declaration
>     2310 | static inline void bpf_prog_inc_misses_counter(struct bpf_prog *prog)
>          |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/bpf.h:1970:14: note: previous declaration of 'bpf_prog_inc_misses_counter' with type 'void(struct bpf_prog *)'
>     1970 | void notrace bpf_prog_inc_misses_counter(struct bpf_prog *prog);
>          |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> kernel/bpf/syscall.c:2097:14: error: redefinition of 'bpf_prog_inc_misses_counter'
>     2097 | void notrace bpf_prog_inc_misses_counter(struct bpf_prog *prog)
>          |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/bpf.h:2310:20: note: previous definition of 'bpf_prog_inc_misses_counter' with type 'void(struct bpf_prog *)'
>     2310 | static inline void bpf_prog_inc_misses_counter(struct bpf_prog *prog)
>          |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> --
>    In file included from include/linux/bpf_verifier.h:7,
>                     from kernel/bpf/btf.c:19:
> >> include/linux/bpf.h:2310:20: error: static declaration of 'bpf_prog_inc_misses_counter' follows non-static declaration
>     2310 | static inline void bpf_prog_inc_misses_counter(struct bpf_prog *prog)
>          |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/bpf.h:1970:14: note: previous declaration of 'bpf_prog_inc_misses_counter' with type 'void(struct bpf_prog *)'
>     1970 | void notrace bpf_prog_inc_misses_counter(struct bpf_prog *prog);
>          |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/bpf/btf.c: In function 'btf_seq_show':
>    kernel/bpf/btf.c:6609:29: warning: function 'btf_seq_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
>     6609 |         seq_vprintf((struct seq_file *)show->target, fmt, args);
>          |                             ^~~~~~~~
>    kernel/bpf/btf.c: In function 'btf_snprintf_show':
>    kernel/bpf/btf.c:6646:9: warning: function 'btf_snprintf_show' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
>     6646 |         len = vsnprintf(show->target, ssnprintf->len_left, fmt, args);
>          |         ^~~
> 
> 
> vim +/bpf_prog_inc_misses_counter +2310 include/linux/bpf.h
> 
>   2309	
> > 2310	static inline void bpf_prog_inc_misses_counter(struct bpf_prog *prog)
>   2311	{
>   2312	}
>   2313	#endif /* CONFIG_BPF_SYSCALL */
>   2314	#endif /* CONFIG_NET && CONFIG_BPF_SYSCALL */

hi,
I checked the linux-stable-rc.git queue/6.0 branch and it looks like the
backport patch shifted above inline stub into wrong ifdef block

with patch below I get it built

jirka


---
diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index e0feae308408..73662fbabd78 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -2177,6 +2177,9 @@ static inline bool unprivileged_ebpf_enabled(void)
 	return false;
 }
 
+static inline void bpf_prog_inc_misses_counter(struct bpf_prog *prog)
+{
+}
 #endif /* CONFIG_BPF_SYSCALL */
 
 void __bpf_free_used_btfs(struct bpf_prog_aux *aux,
@@ -2306,10 +2309,6 @@ static inline int sock_map_bpf_prog_query(const union bpf_attr *attr,
 {
 	return -EINVAL;
 }
-
-static inline void bpf_prog_inc_misses_counter(struct bpf_prog *prog)
-{
-}
 #endif /* CONFIG_BPF_SYSCALL */
 #endif /* CONFIG_NET && CONFIG_BPF_SYSCALL */
 
