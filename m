Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC383EA9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 06:05:58 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id l12so7634331wrm.10
        for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 23:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679205957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L5o68Y8GxB7MxRzoWxahZl5WtNvv6X9nSD+g9jbql38=;
        b=Le7DYoOL7Bf4hL3Wv77hhmKQmt3mp9QMEGnS2cejl83vA+gQs3Zt0efk+/VsSiHbXR
         MIjLqginf428dvCLxTIKPF3mnB3uWPSRuqJiMBkZopl2GXlLQoKXljWSctOiiF4574oZ
         kKf1mFlZutMKc5karnkdUfJzwvBejCegZUpZ+bfiMwJqd+z6OeOoOAnGwMuHfBpYBKol
         c/JzPz6QEXXTYRgG6JGabibK1A6GzyFf0UspPlESgKNe4bnHExMLcKOaWV5z0GQOcTjJ
         ZaeVlu+HWocBTeKIKptCqRnnPl3gLCS3lIp2joShP2UMzcudCNNQ0jLJ1vQud6O/vto2
         Fp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679205957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5o68Y8GxB7MxRzoWxahZl5WtNvv6X9nSD+g9jbql38=;
        b=dwGFz9mu4HOAt4PvKYaIWKUFEOJjmjjHR/yaONrcUJHkgRDXztnfZkMZLA0cKbd7i7
         yskvCfrXuI5jG5E00LmuECW6ccEmt+XLajcdbZ4oTyTigIYq5oPOD1zh9YOoENrYbP1e
         10jDoBGAJzeKzxbLDanYDSkHa38ow5xlcH83WpTMe49X4oRdyl9DkZEq2ZJp36wVju/9
         BAegVYzxpUf+Yv7YBHt2RNMCT2WzlBaKWREPgJ/exRsUcAgkv9Rsbz+HmT5Gjf7fJrcF
         z7GG6SmLByGFDnbrSY2+NW61d5pjjfv3cwB4PqogRMQjQvI5FpIjJUijKGBUAGGhqHiG
         JvCw==
X-Gm-Message-State: AO0yUKUJgvvD+s3yAQDBDE/g7ZXct859Ln93AEP0wMHp5qwC5/UlTbig
	14cm2syP/cV3zOZASBYDCeY=
X-Google-Smtp-Source: AK7set/518R9yursdpHA1wGwkdPSPJfwg60pyTGSqBIuce0FsEV/Czwz1hRsgEVvtD1i08fwY26OLA==
X-Received: by 2002:adf:f1d1:0:b0:2cf:e8b2:4f76 with SMTP id z17-20020adff1d1000000b002cfe8b24f76mr10630878wro.66.1679205956681;
        Sat, 18 Mar 2023 23:05:56 -0700 (PDT)
Received: from localhost (host86-146-209-214.range86-146.btcentralplus.com. [86.146.209.214])
        by smtp.gmail.com with ESMTPSA id m23-20020a056000181700b002c5694aef92sm5815133wrh.21.2023.03.18.23.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 23:05:56 -0700 (PDT)
Date: Sun, 19 Mar 2023 06:03:45 +0000
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	oe-kbuild-all@lists.linux.dev, Baoquan He <bhe@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Liu Shixin <liushixin2@huawei.com>, Jiri Olsa <jolsa@kernel.org>
Subject: Re: [PATCH 4/4] mm: vmalloc: convert vread() to vread_iter()
Message-ID: <ba07db21-04a3-462d-b5e1-e098799b89e0@lucifer.local>
References: <119871ea9507eac7be5d91db38acdb03981e049e.1679183626.git.lstoakes@gmail.com>
 <202303191017.vsaaDpyw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303191017.vsaaDpyw-lkp@intel.com>

On Sun, Mar 19, 2023 at 10:16:59AM +0800, kernel test robot wrote:
> Hi Lorenzo,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v6.3-rc2 next-20230317]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/fs-proc-kcore-Avoid-bounce-buffer-for-ktext-data/20230319-082147
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/119871ea9507eac7be5d91db38acdb03981e049e.1679183626.git.lstoakes%40gmail.com
> patch subject: [PATCH 4/4] mm: vmalloc: convert vread() to vread_iter()
> config: sh-randconfig-r013-20230319 (https://download.01.org/0day-ci/archive/20230319/202303191017.vsaaDpyw-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/a28f374d35bd294a529fcba0b69c8b0e2b66fa6c
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Lorenzo-Stoakes/fs-proc-kcore-Avoid-bounce-buffer-for-ktext-data/20230319-082147
>         git checkout a28f374d35bd294a529fcba0b69c8b0e2b66fa6c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303191017.vsaaDpyw-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> mm/nommu.c:201:6: warning: no previous prototype for 'vread' [-Wmissing-prototypes]
>      201 | long vread(char *buf, char *addr, unsigned long count)
>          |      ^~~~~
>

Ah sorry, I forgot to update the nommu stub, will respin with a fix.
>
> vim +/vread +201 mm/nommu.c
>
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  200
> ^1da177e4c3f41 Linus Torvalds 2005-04-16 @201  long vread(char *buf, char *addr, unsigned long count)
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  202  {
> 9bde916bc73255 Chen Gang      2013-07-03  203  	/* Don't allow overflow */
> 9bde916bc73255 Chen Gang      2013-07-03  204  	if ((unsigned long) buf + count < count)
> 9bde916bc73255 Chen Gang      2013-07-03  205  		count = -(unsigned long) buf;
> 9bde916bc73255 Chen Gang      2013-07-03  206
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  207  	memcpy(buf, addr, count);
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  208  	return count;
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  209  }
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  210
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
