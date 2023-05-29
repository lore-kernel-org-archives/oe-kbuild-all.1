Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5612C7C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 May 2023 01:48:39 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-64d341bdedcso1993885b3a.3
        for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 18:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685324919; x=1687916919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOFmGCk423gofimhUTypVmaxA2qvZ0yuurXuTjvYLfw=;
        b=jibXYiYmwLiopIJYKDGIPRzwzROR366vt6gB89i85i09h8PfCqHj8l8NyRDnuVSK2l
         SAc+ik3xKkJgnMfmd4JjNO4Kx1BVcWXGOl4NfYBUbYFBhoh4r4sVdlC82WT4O7n70tNp
         opTeHfTg83//59EYEnoT5F+iM+ModLYdXmKdiH0D0eevK21f8BWMl9zSK6k61UHIxWwV
         t9FpterjvI4DavD3K56ng5JwtCIFkeL2mUkwL2PUyDnPtbCShYpTVHHpZkyL0MXbifDg
         l5kG5deEds164bHYeIPZp+JVkzW+EOL2hTXDCaVAPXGEAXPbjua5+GPQP1JlrREAjXpy
         Votw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685324919; x=1687916919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOFmGCk423gofimhUTypVmaxA2qvZ0yuurXuTjvYLfw=;
        b=DETjd+HZzlNtJm4WlLMIET2+rvspoqXgajb/CLn8NR8n4oEIOzfADTHS/T0kU5N0Kx
         bbz8Q4voEOZQisrsNJaxPzA5sTSz4YIDwFi9k2zY97FfyyHX/udDfzo/42cMb3qKdCim
         xSIwO94dG7xYTNbI4jqspFJmLr20U0z089cCBSGQdDyCBvL/zfdqCw6v01JylNK7ALIO
         oActgdMftyOuU7d3/Ia/oHKqnkM5f1fQs3hDZZBKWNuRGGz6AhX1i4yyzZrnAYO7aMeA
         3RvjjIGC0BOStAmcEt9qTKsnS28z8UsURazt15JTqex8xHEep92l4TKmuy0fNWlVAs4q
         2YEQ==
X-Gm-Message-State: AC+VfDzGQHqAt0RpzS6lwU5InNY4AUF8gjUA16S1SYF5NDA6HwlyBNMj
	QjktjkD66ApoBe718Ci3FIo=
X-Google-Smtp-Source: ACHHUZ7DHB7Fdyg+9PCkKPW8ga4BTWYCCV7h3UeUevABUwn/vf+CXVVjFaPHehEyxfesDCys+hCXTg==
X-Received: by 2002:a05:6a20:8419:b0:10b:f590:5a26 with SMTP id c25-20020a056a20841900b0010bf5905a26mr8672281pzd.26.1685324918456;
        Sun, 28 May 2023 18:48:38 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id q32-20020a635c20000000b005134fc049d7sm6013854pgb.31.2023.05.28.18.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 18:48:37 -0700 (PDT)
From: xu xin <xu.xin.sc@gmail.com>
X-Google-Original-From: xu xin <xu.xin16@zte.com.cn>
To: lkp@intel.com,
	akpm@linux-foundation.org
Cc: david@redhat.com,
	imbrenda@linux.ibm.com,
	jiang.xuexin@zte.com.cn,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	oe-kbuild-all@lists.linux.dev,
	ran.xiaokai@zte.com.cn,
	xu.xin.sc@gmail.com,
	xu.xin16@zte.com.cn,
	yang.yang29@zte.com.cn
Subject: Re: [PATCH v9 3/5] ksm: add ksm zero pages for each process
Date: Mon, 29 May 2023 09:48:34 +0800
Message-Id: <20230529014834.47677-1-xu.xin16@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <202305251415.OLELa7qJ-lkp@intel.com>
References: <202305251415.OLELa7qJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Already fixed in PACTH v10.

>Hi Yang,
>
>kernel test robot noticed the following build errors:
>
>[auto build test ERROR on akpm-mm/mm-everything]
>[also build test ERROR on linus/master v6.4-rc3 next-20230525]
>[If your patch is applied to the wrong git tree, kindly drop us a note.
>And when submitting patch, we suggest to use '--base' as documented in
>https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Yang-Yang/ksm-count-all-zero-pages-placed-by-KSM/20230524-153333
>base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
>patch link:    https://lore.kernel.org/r/20230524055800.20498-1-yang.yang29%40zte.com.cn
>patch subject: [PATCH v9 3/5] ksm: add ksm zero pages for each process
>config: nios2-defconfig
>compiler: nios2-linux-gcc (GCC) 12.1.0
>reproduce (this is a W=1 build):
>        mkdir -p ~/bin
>        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>        chmod +x ~/bin/make.cross
>        # https://github.com/intel-lab-lkp/linux/commit/c9da8338fa8f95db948cd4d826053d8f6cbcf19c
>        git remote add linux-review https://github.com/intel-lab-lkp/linux
>        git fetch --no-tags linux-review Yang-Yang/ksm-count-all-zero-pages-placed-by-KSM/20230524-153333
>        git checkout c9da8338fa8f95db948cd4d826053d8f6cbcf19c
>        # save the config file
>        mkdir build_dir && cp config build_dir/.config
>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
>        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 ~/bin/make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash
>
>If you fix the issue, kindly add following tag where applicable
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202305251415.OLELa7qJ-lkp@intel.com/
>
>All errors (new ones prefixed by >>):
>
>   mm/memory.c: In function 'zap_pte_range':
>>> mm/memory.c:1419:60: error: incompatible type for argument 1 of 'ksm_notify_unmap_zero_page'
>    1419 |                                 ksm_notify_unmap_zero_page(mm, ptent);
>         |                                                            ^~
>         |                                                            |
>         |                                                            struct mm_struct *
>   In file included from mm/memory.c:56:
>   include/linux/ksm.h:116:53: note: expected 'pte_t' but argument is of type 'struct mm_struct *'
>     116 | static inline void ksm_notify_unmap_zero_page(pte_t pte)
>         |                                               ~~~~~~^~~
>   mm/memory.c:1419:33: error: too many arguments to function 'ksm_notify_unmap_zero_page'
>    1419 |                                 ksm_notify_unmap_zero_page(mm, ptent);
>         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
>   include/linux/ksm.h:116:20: note: declared here
>     116 | static inline void ksm_notify_unmap_zero_page(pte_t pte)
>         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
