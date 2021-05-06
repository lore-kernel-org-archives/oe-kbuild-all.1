Content-Type: multipart/mixed; boundary="===============9183585972475510276=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v9 46/96] mm: Add flush_dcache_folio
Date: Thu, 06 May 2021 03:33:29 +0100
Message-ID: <20210506023329.GM1847222@casper.infradead.org>
In-Reply-To: <202105060752.es5znqMC-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9183585972475510276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 07:35:16AM +0800, kernel test robot wrote:
>    In file included from arch/ia64/include/asm/cacheflush.h:31,
>                     from arch/ia64/include/asm/pgtable.h:153,
>                     from include/linux/pgtable.h:6,
>                     from arch/ia64/include/asm/uaccess.h:40,
>                     from include/linux/uaccess.h:11,
>                     from include/linux/sched/task.h:11,
>                     from include/linux/sched/signal.h:9,
>                     from arch/ia64/kernel/asm-offsets.c:10:
>    include/asm-generic/cacheflush.h: In function 'flush_dcache_folio':
> >> include/asm-generic/cacheflush.h:61:19: error: implicit declaration of=
 function 'folio_nr_pages'; did you mean 'folio_page'? [-Werror=3Dimplicit-=
function-declaration]

Ugh, I can't be bothered to untangle the ia64 header file mess.
I'll just move the function out of line.

--===============9183585972475510276==--

