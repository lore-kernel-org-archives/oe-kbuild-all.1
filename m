Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2EF27710
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 22:15:35 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id n4so12251686ual.13
        for <oe-kbuild-all@lists.linux.dev>; Wed, 08 Mar 2023 14:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678313734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OqQ3EI188CowuYOZmSAukdXapAzBQtZ77d6uRCmdYk4=;
        b=ay+Ezf9jdxdaGM4cq2PuqUZpXPcRi0Kx1uK/t1moBAtWBWbdg1vK/LCExdiXqE7tpc
         L4T00adO4Vtf4rm7hTqgtntFvRFg9+PHHpMQg/LaJa06U6Ufi5WC/AKncEgW48uFP0hL
         hsqHBah7vx9k6fAcopggWVaoz1xN6FdlKL12MqDJX+ynMl3w6w4LbGJoPP7YnyOPbPKw
         JUTs6S2baCe8PAlIawlkrTfziYD/lXIZZod0tsQcDphW//azwRhqBt/f6GLxEHOx3eLv
         jDuZD6k2TRmrtXqyQQhy09dzUJjkT71LjXbNuU/yCPDEmacGucPveVxuO1jh3Dr9lQhx
         r1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678313734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqQ3EI188CowuYOZmSAukdXapAzBQtZ77d6uRCmdYk4=;
        b=5JyHfswRV+gWmDBMtMp2zVMGM2E1SXx95VDsw/RLBAPQRJoDyi/2FtEzurx+VwsXJ0
         Fd2NjllUCnsE5w6JQhkHwTW44RDgHffeK7pf067+2OWvs6ArAAI7L1IuWzkPNLfBBlh8
         w++toqaCaBYZPeB6TFmaex9PKHQZr/+D6lyWZl+PWsh82nLaFUpeoXqJZxTtIxMvuF/m
         OuFDU29SXlzQnbCM0/XUTa+9pBvEpX8GguHsy/VMR8d8S+LrL9bp8cQhMtvGOfiTtUD5
         24ExCeo14ZSZwowBoXfvsAQCcY2X4Z2nIq/oiHnpogy7rXoXn5KpBrufWUkgF/kXMF1l
         wdmg==
X-Gm-Message-State: AO0yUKUQp9GDaYt5nJi1EpsYOBZWMVToM7Zpu0N7/eMYtEdcIdRf3VYD
	9Jw8mPfJ7sjOKgrEk2tefB6BV9X9qwhPcQLtf+yswg==
X-Google-Smtp-Source: AK7set8qOFCTlsiSulkEPgGML+flaI1zps+GAKkX3YWHu4GvtmRKJrr0ZCGTo8L6VyWz7WfxnrGjIpRpgaVIXo8gfiI=
X-Received: by 2002:a1f:c847:0:b0:411:ff57:d3b9 with SMTP id
 y68-20020a1fc847000000b00411ff57d3b9mr11444842vkf.2.1678313734597; Wed, 08
 Mar 2023 14:15:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202303090422.ss2Hbm4f-lkp@intel.com> <20230308130735.bbc4b21a3aff977bced451fa@linux-foundation.org>
In-Reply-To: <20230308130735.bbc4b21a3aff977bced451fa@linux-foundation.org>
From: Marco Elver <elver@google.com>
Date: Wed, 8 Mar 2023 23:14:58 +0100
Message-ID: <CANpmjNMGd=mfz3tBJcGMYeVo3iRy7F2EqCk_5j+2mJT38_ZNbQ@mail.gmail.com>
Subject: Re: ld.lld: error: undefined symbol: memcpy
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Mar 2023 at 22:07, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Thu, 9 Mar 2023 05:01:04 +0800 kernel test robot <lkp@intel.com> wrote:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   63355b9884b3d1677de6bd1517cd2b8a9bf53978
> > commit: 36be5cba99f6f9984a9a9f0454f95a38f4184d3e kasan: treat meminstrinsic as builtins in uninstrumented files
> > date:   6 days ago
> > config: powerpc-randconfig-r036-20230305 (https://download.01.org/0day-ci/archive/20230309/202303090422.ss2Hbm4f-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install powerpc cross compiling tool for clang build
> >         # apt-get install binutils-powerpc-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=36be5cba99f6f9984a9a9f0454f95a38f4184d3e
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 36be5cba99f6f9984a9a9f0454f95a38f4184d3e
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202303090422.ss2Hbm4f-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> ld.lld: error: undefined symbol: memcpy
> >    >>> referenced by xmon.c:1896 (arch/powerpc/xmon/xmon.c:1896)
> >    >>>               arch/powerpc/xmon/xmon.o:(prregs) in archive vmlinux.a
> >    >>> referenced by zstd_compress.c:4814 (lib/zstd/compress/zstd_compress.c:4814)
> >    >>>               lib/zstd/compress/zstd_compress.o:(ZSTD_createCDict_advanced2) in archive vmlinux.a
> >    >>> referenced by zstd_compress.c:4910 (lib/zstd/compress/zstd_compress.c:4910)
> >    >>>               lib/zstd/compress/zstd_compress.o:(ZSTD_initStaticCDict) in archive vmlinux.a
> >    >>> referenced 5 more times
> > --
> > >> ld.lld: error: undefined symbol: memset
> >    >>> referenced by slab_common.c:579 (mm/slab_common.c:579)
> >    >>>               mm/slab_common.o:(kmem_dump_obj) in archive vmlinux.a
> >    >>> referenced by kasan_test.c:558 (mm/kasan/kasan_test.c:558)
> >    >>>               mm/kasan/kasan_test.o:(kmalloc_oob_in_memset) in archive vmlinux.a
> >    >>> referenced by kasan_test.c:505 (mm/kasan/kasan_test.c:505)
> >    >>>               mm/kasan/kasan_test.o:(kmalloc_oob_memset_2) in archive vmlinux.a
> >    >>> referenced 10 more times
> >
>
> Will this fix?

I think this patch got lost:
https://lkml.kernel.org/r/20230227094726.3833247-1-elver@google.com

By the looks of it 36be5cba99f6f9984a9a9f0454f95a38f4184d3e in
mainline doesn't have any of the powerpc bits.

Thanks,
-- Marco
