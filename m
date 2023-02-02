Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330E463B7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Feb 2023 14:12:13 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id cr22so1873354qtb.10
        for <oe-kbuild-all@lists.linux.dev>; Thu, 02 Feb 2023 06:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8lKwPpkPDxwm1VBqDHuuHVHYFGb1CHGpldcsBIhtkdM=;
        b=fN/lac7S0hEha5x8ywniY7iRYMzhonZYyA0EvuvEBq5QbCZHEPgZsn7N4hiR5LgeaO
         Jh1fkkK4eKeZKgNa2tMvfn6N0q4W+SCCRrKMyDuJpUUIVYH+luyi/t+uEtsaoQ6RidvS
         beRW6DCDMqRhXeoLebx7wyoBwmlzf/++Rcl1TcoypuidOIior69I1RwPavAz1vBRIXLS
         y2jK89CaBkav/OtELC5vP2FOEgvZvhV4asMXSwWK5UNyYghmj2vBPaGB6gvBXYtfl5l7
         78ctZVTOxPjqXUT9T0nMxcfk97joBOH5rjcet4q9urTUosSkzmy+bs3WZs+6xHIYkT1r
         ej+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lKwPpkPDxwm1VBqDHuuHVHYFGb1CHGpldcsBIhtkdM=;
        b=nXnk8lCWI4FZGblo2xvcqitv09wjjN8vcarLDSClXd2IVgb57JP91gYlI58oy9Q4E1
         pj/H+W8t/Yj5em3qUC6NIPYWqdUrQvcqHTJZBmr2LWEjGf8Uymtkv8AH5f1Pq8rfpHO5
         qfKLQ969WJ+Yc9bYz3kUuqSMwg3UNUw8hFiInYPytmMPz69orraB7Rd8JtN1mWToSaao
         AGQBBmnRrlNX9uKl6Xci4tzdUwVa14ed+BokpVe0pcf7RE9EW78VimkdaEznAFqnen2x
         XgTzWQQaEjiF4H+fVw5GxKc6Yvhl2ZT+aBoocYpQWgv0GmAlCpPFPJlAIh8WGwZHx7YY
         i8Ew==
X-Gm-Message-State: AO0yUKXNGCMaVJWhqUOXXCh38NunNMiNWEZHu/adMq+M2hXqnrVYcOh9
	3LQLX8tCRqow486yGrl0Xpw87Abl7iS95RVzYNc=
X-Google-Smtp-Source: AK7set9k5XCQtHVBDhmS2cTjynxpRw3/UekFOEHwWW/291ryl6hyF+HTz1I4NTG83hwQ78BYzyTyhDxsbXw/IdAbDg8=
X-Received: by 2002:a05:622a:1ba9:b0:3b4:6444:546b with SMTP id
 bp41-20020a05622a1ba900b003b46444546bmr581897qtb.295.1675347132004; Thu, 02
 Feb 2023 06:12:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230202014158.19616-7-laoar.shao@gmail.com> <202302021258.By6JZK71-lkp@intel.com>
In-Reply-To: <202302021258.By6JZK71-lkp@intel.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 2 Feb 2023 22:11:36 +0800
Message-ID: <CALOAHbDFtsL5BPDPt8XnHyfEzTRH3xz3=i42YUn43uo+H5hhxA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 6/7] bpf: introduce bpf_mem_alloc_size()
To: kernel test robot <lkp@intel.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, kafai@fb.com, 
	songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@google.com, haoluo@google.com, jolsa@kernel.org, 
	tj@kernel.org, dennis@kernel.org, cl@linux.com, akpm@linux-foundation.org, 
	penberg@kernel.org, rientjes@google.com, iamjoonsoo.kim@lge.com, 
	roman.gushchin@linux.dev, 42.hyeyoo@gmail.com, vbabka@suse.cz, 
	urezki@gmail.com, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 2, 2023 at 12:54 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Yafang,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/mm-percpu-fix-incorrect-size-in-pcpu_obj_full_size/20230202-094352
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> patch link:    https://lore.kernel.org/r/20230202014158.19616-7-laoar.shao%40gmail.com
> patch subject: [PATCH bpf-next 6/7] bpf: introduce bpf_mem_alloc_size()
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230202/202302021258.By6JZK71-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/996f3e2ac4dca054396d0f37ffe8ddb97fc4212f
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Yafang-Shao/mm-percpu-fix-incorrect-size-in-pcpu_obj_full_size/20230202-094352
>         git checkout 996f3e2ac4dca054396d0f37ffe8ddb97fc4212f
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash kernel/bpf/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> kernel/bpf/memalloc.c:227:15: warning: no previous prototype for 'bpf_mem_cache_size' [-Wmissing-prototypes]
>      227 | unsigned long bpf_mem_cache_size(struct bpf_mem_cache *c, void *obj)
>          |               ^~~~~~~~~~~~~~~~~~

Should be defined with 'static'.
Thanks for the report. Will update it in the next version.

>
>
> vim +/bpf_mem_cache_size +227 kernel/bpf/memalloc.c
>
>    226
>  > 227  unsigned long bpf_mem_cache_size(struct bpf_mem_cache *c, void *obj)
>    228  {
>    229          unsigned long size;
>    230
>    231          if (!obj)
>    232                  return 0;
>    233
>    234          if (c->percpu_size) {
>    235                  size = percpu_size(((void **)obj)[1]);
>    236                  size += ksize(obj);
>    237                  return size;
>    238          }
>    239
>    240          return ksize(obj);
>    241  }
>    242
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests



-- 
Regards
Yafang
