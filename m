Content-Type: multipart/mixed; boundary="===============3515861808654725932=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v9 74/96] mm/workingset: Convert workingset_refault to take a folio
Date: Wed, 05 May 2021 21:57:48 +0100
Message-ID: <20210505205748.GJ1847222@casper.infradead.org>
In-Reply-To: <202105060454.QWwnGhDV-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3515861808654725932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 04:17:27AM +0800, kernel test robot wrote:
>    In file included from mm/workingset.c:8:
>    include/linux/memcontrol.h: In function 'folio_uncharge_cgroup':
>    include/linux/memcontrol.h:1213:42: error: parameter name omitted
>     1213 | static inline void folio_uncharge_cgroup(struct folio *)
>          |                                          ^~~~~~~~~~~~~~

Fixed (also reported in your other report)

>    mm/workingset.c: In function 'unpack_shadow':
>    mm/workingset.c:201:15: warning: variable 'nid' set but not used [-Wun=
used-but-set-variable]
>      201 |  int memcgid, nid;
>          |               ^~~

I didn't introduce this one; not trying to fix it ;-)

>    mm/workingset.c: In function 'workingset_refault':
> >> mm/workingset.c:348:10: error: implicit declaration of function 'folio=
_memcg' [-Werror=3Dimplicit-function-declaration]
>      348 |  memcg =3D folio_memcg(folio);
>          |          ^~~~~~~~~~~
> >> mm/workingset.c:348:8: warning: assignment to 'struct mem_cgroup *' fr=
om 'int' makes pointer from integer without a cast [-Wint-conversion]
>      348 |  memcg =3D folio_memcg(folio);
>          |        ^
>    cc1: some warnings being treated as errors

Fixed.  Thanks!

--===============3515861808654725932==--

