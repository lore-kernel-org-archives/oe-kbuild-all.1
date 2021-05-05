Content-Type: multipart/mixed; boundary="===============4999451234088263797=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v9 92/96] iomap: Convert iomap_write_begin and iomap_write_end to folios
Date: Wed, 05 May 2021 23:10:56 +0100
Message-ID: <20210505221056.GK1847222@casper.infradead.org>
In-Reply-To: <202105060511.863ZVBcq-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4999451234088263797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 05:36:54AM +0800, kernel test robot wrote:
> config: nds32-defconfig (attached as .config)
>    fs/iomap/buffered-io.c: In function '__iomap_write_end':
> >> fs/iomap/buffered-io.c:645:2: error: implicit declaration of function =
'flush_dcache_folio'; did you mean 'flush_dcache_page'? [-Werror=3Dimplicit=
-function-declaration]
>      645 |  flush_dcache_folio(folio);
>          |  ^~~~~~~~~~~~~~~~~~
>          |  flush_dcache_page
>    cc1: some warnings being treated as errors

Argh, nds32 doesn't (always) include asm-generic/cacheflush.h, so it
doesn't pick up the generic implementation of flush_dcache_folio().
Copy-and-pasted it to nds32.

Thanks.
--===============4999451234088263797==--

