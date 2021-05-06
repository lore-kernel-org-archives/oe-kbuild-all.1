Content-Type: multipart/mixed; boundary="===============6648782972830942666=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v9 77/96] mm/filemap: Add filemap_alloc_folio
Date: Thu, 06 May 2021 03:28:46 +0100
Message-ID: <20210506022846.GL1847222@casper.infradead.org>
In-Reply-To: <202105060717.iCOhoRD0-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6648782972830942666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 08:00:25AM +0800, kernel test robot wrote:
> sparse warnings: (new ones prefixed by >>)
> >> mm/filemap.c:1000:52: sparse: sparse: incorrect type in argument 1 (di=
fferent base types) @@     expected restricted gfp_t [usertype] gfp @@     =
got int [assigned] n @@
>    mm/filemap.c:1000:52: sparse:     expected restricted gfp_t [usertype]=
 gfp
>    mm/filemap.c:1000:52: sparse:     got int [assigned] n
> >> mm/filemap.c:1000:55: sparse: sparse: incorrect type in argument 2 (di=
fferent base types) @@     expected unsigned int order @@     got restricte=
d gfp_t [usertype] gfp @@
>    mm/filemap.c:1000:55: sparse:     expected unsigned int order
>    mm/filemap.c:1000:55: sparse:     got restricted gfp_t [usertype] gfp

fixed


--===============6648782972830942666==--

