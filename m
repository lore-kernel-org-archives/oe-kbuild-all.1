Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDBA339BC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 04:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719030298; cv=none; b=IaPTa0yro+r0Aa0UKGCjznFCTfUVSxmJobTfDfb8INUoUlMN/Z5tPOtxsOx234BtIeMNX/HweuEsycTT8LV2fQV8/J9e1fzDpFCgVFHh75j6x6g4JVBSkxic+BV6Qiw1/3ri8T9+I4PY7VBGNlAb5Ea4khY6geUWGzckHMUvAEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719030298; c=relaxed/simple;
	bh=UF/2CsaNQ76vHjcvo9sTUoNGEj0xOUcVuXeTH6QiAtk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6ISVyECSijetkfI4K7pwF2FbexgsCcHD2GiYJaoLLdOnV2sz2Rt/3A/z0AKyUMzyz4mZoff7xjYbgV25ZSMDpD7q03VwHwHvFpi6UvjG+76weSjxsyqxqUongDJiAI8X7cc7kaN2e23DIfXAc6CFnfqEYfS+H2HGN7qmDtuE/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEe/E4uQ; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEe/E4uQ"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4ecf4100d9dso1384461e0c.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 21:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719030295; x=1719635095; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5LUtvbklJ0OC7BwX1453vWX6X8qtNhByqH0/q7p/+c=;
        b=VEe/E4uQc3805TmknCfWqGUeUzbsC96ZSgc2PtqJQy4O89B1Tb2Xi5s2syJWwlGCmV
         wkyqlL5woAVID8N5PQ3sw2Ugdz1TJubiyxUNUUXLY0hGKr+dBL5UtF+hge+/IthEmyjG
         oRET4s0W2IwPQ5peXrK9/yZ5cO7uVPgYAIe6uTE+xuz1O+7Vp7f6cg9lVtijFvjWSVRm
         SnKjY3s8Cx/n5y0XA6LYw5oXaroACeZKZFgpQig+Q4mnjNNNLn0b4LQh5DuhHqXHw5b2
         02bz/3YkbuK3g+6bKbrRawV+sp5DOnE1x4UOhVhoVyadMJCASKwOAIHFK+PBzjd849Dc
         zYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719030295; x=1719635095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5LUtvbklJ0OC7BwX1453vWX6X8qtNhByqH0/q7p/+c=;
        b=hxrgqR6HJag5yFb7eHWAS6w3EKJJGo0ZBAsWXkGyJhuvW7CgeLxRFhVnQXvatngb+b
         Qasf3AX48n48CqgivCq0pTtomDfVwbVimz7vo2YdD/wo/k10raPz40sZc0e0Lx1omALx
         czxX/mBlXcWH9VfwkKw0ZOZhCj2yjuiXZSXMBxsET6lLOiOjwaI9fpAhtUdiRFRLMNJP
         I/A5g1ze+ZiolVqmKRuOmr/BkOoHPIrOnzM/yxAaSqsZ2xMoJeEeb3zz3b9MRzap6K5a
         bOiX71Ml4I0cBPhE9phzym5FYgNYdhj8QyFWOnMvoKq+/N5pfMnUaXe0qoA4S972auov
         ynbg==
X-Forwarded-Encrypted: i=1; AJvYcCWr1SohBJgkzy9IRnOU15PIiEkKkI3GEwW7Q9+tM6p6EjTYjEFZ6QiLUSk0WVUlck/iUMl+vwmwMgJwHFkmrmXpbtNt6Fkbc6TyfUUadw==
X-Gm-Message-State: AOJu0YzO+wPvuil8kpBSEZ3bae0z9MwifcFFU7oQPx+GsrOStfOzj6b4
	IqqZySBMkVewd/N8ntvfaBK4yyGrUGQKVfku4+HIdeoLK/eK3FbvBs8QSh/xotXkTMnzV8h18oL
	bDUtsGfaxJ9MuIqp2IpBmKDNWG4U=
X-Google-Smtp-Source: AGHT+IFN+ilfdJ5aKTG+ZybpklgjM4CXArShZxiQtUHqxGXG7iBINXEeBe6pR85Vd1mDXObf5yR8BxFTJ5Oa+VZL6JM=
X-Received: by 2002:a05:6122:4127:b0:4ee:244:b0ab with SMTP id
 71dfb90a1353d-4ef6508a088mr196137e0c.2.1719030294879; Fri, 21 Jun 2024
 21:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406220112.qjyQbasK-lkp@intel.com>
In-Reply-To: <202406220112.qjyQbasK-lkp@intel.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 22 Jun 2024 16:24:43 +1200
Message-ID: <CAGsJ_4xn7bw797EBtNvATgYbu+WiDpqgPY69JY6MxRF8db0jtw@mail.gmail.com>
Subject: Re: [linux-next:master 6448/7397] mm/swapfile.c:1388:6: error:
 redefinition of 'swap_free_nr'
To: kernel test robot <lkp@intel.com>
Cc: Chuanhua Han <hanchuanhua@oppo.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Barry Song <v-songbaohua@oppo.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	"Huang, Ying" <ying.huang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 7:09=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
> commit: b858a8a49e72678a7e0ac90b8135d746b31d7586 [6448/7397] mm: swap: in=
troduce swap_free_nr() for batched swap_free()
> config: x86_64-randconfig-014-20240202 (https://download.01.org/0day-ci/a=
rchive/20240622/202406220112.qjyQbasK-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240622/202406220112.qjyQbasK-lkp@intel.com/reproduce)

I'm not sure why this is happening. I've downloaded the config and
kernel code and tried to
reproduce the issue using the same GCC version, but everything seems fine.

Is LKP experiencing issues today?

>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406220112.qjyQbasK-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from mm/swapfile.c:17:
>    include/linux/swap.h:519:49: error: expected identifier or '(' before =
numeric constant
>      519 | #define total_swap_pages                        0L
>          |                                                 ^~
>    mm/swapfile.c:67:6: note: in expansion of macro 'total_swap_pages'
>       67 | long total_swap_pages;
>          |      ^~~~~~~~~~~~~~~~
>    mm/swapfile.c:236:10: warning: no previous prototype for 'swap_folio_s=
ector' [-Wmissing-prototypes]
>      236 | sector_t swap_folio_sector(struct folio *folio)
>          |          ^~~~~~~~~~~~~~~~~
>    mm/swapfile.c: In function 'set_cluster_next':
>    mm/swapfile.c:797:22: error: 'SWAP_ADDRESS_SPACE_SHIFT' undeclared (fi=
rst use in this function)
>      797 |         if ((prev >> SWAP_ADDRESS_SPACE_SHIFT) !=3D
>          |                      ^~~~~~~~~~~~~~~~~~~~~~~~
>    mm/swapfile.c:797:22: note: each undeclared identifier is reported onl=
y once for each function it appears in
>    In file included from include/vdso/const.h:5,
>                     from include/linux/const.h:4,
>                     from include/linux/list.h:9,
>                     from include/linux/wait.h:7,
>                     from include/linux/wait_bit.h:8,
>                     from include/linux/fs.h:6,
>                     from include/linux/highmem.h:5,
>                     from include/linux/bvec.h:10,
>                     from include/linux/blk_types.h:10,
>                     from include/linux/blkdev.h:9,
>                     from mm/swapfile.c:9:
>    mm/swapfile.c:803:41: error: 'SWAP_ADDRESS_SPACE_PAGES' undeclared (fi=
rst use in this function)
>      803 |                 next =3D ALIGN_DOWN(next, SWAP_ADDRESS_SPACE_P=
AGES);
>          |                                         ^~~~~~~~~~~~~~~~~~~~~~=
~~
>    include/uapi/linux/const.h:32:44: note: in definition of macro '__ALIG=
N_KERNEL_MASK'
>       32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(ma=
sk))
>          |                                            ^
>    include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNE=
L'
>        9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1)=
, (a))
>          |                                 ^~~~~~~~~~~~~~
>    mm/swapfile.c:803:24: note: in expansion of macro 'ALIGN_DOWN'
>      803 |                 next =3D ALIGN_DOWN(next, SWAP_ADDRESS_SPACE_P=
AGES);
>          |                        ^~~~~~~~~~
>    mm/swapfile.c: At top level:
>    mm/swapfile.c:1071:5: warning: no previous prototype for 'get_swap_pag=
es' [-Wmissing-prototypes]
>     1071 | int get_swap_pages(int n_goal, swp_entry_t swp_entries[], int =
entry_order)
>          |     ^~~~~~~~~~~~~~
>    mm/swapfile.c:1278:26: error: redefinition of 'get_swap_device'
>     1278 | struct swap_info_struct *get_swap_device(swp_entry_t entry)
>          |                          ^~~~~~~~~~~~~~~
>    include/linux/swap.h:509:40: note: previous definition of 'get_swap_de=
vice' with type 'struct swap_info_struct *(swp_entry_t)'
>      509 | static inline struct swap_info_struct *get_swap_device(swp_ent=
ry_t entry)
>          |                                        ^~~~~~~~~~~~~~~
>    mm/swapfile.c:1350:6: error: redefinition of 'swap_free'
>     1350 | void swap_free(swp_entry_t entry)
>          |      ^~~~~~~~~
>    include/linux/swap.h:559:20: note: previous definition of 'swap_free' =
with type 'void(swp_entry_t)'
>      559 | static inline void swap_free(swp_entry_t swp)
>          |                    ^~~~~~~~~
> >> mm/swapfile.c:1388:6: error: redefinition of 'swap_free_nr'
>     1388 | void swap_free_nr(swp_entry_t entry, int nr_pages)
>          |      ^~~~~~~~~~~~
>    include/linux/swap.h:563:20: note: previous definition of 'swap_free_n=
r' with type 'void(swp_entry_t,  int)'
>      563 | static inline void swap_free_nr(swp_entry_t entry, int nr_page=
s)
>          |                    ^~~~~~~~~~~~
>    mm/swapfile.c:1409:6: error: redefinition of 'put_swap_folio'
>     1409 | void put_swap_folio(struct folio *folio, swp_entry_t entry)
>          |      ^~~~~~~~~~~~~~
>    include/linux/swap.h:567:20: note: previous definition of 'put_swap_fo=
lio' with type 'void(struct folio *, swp_entry_t)'
>      567 | static inline void put_swap_folio(struct folio *folio, swp_ent=
ry_t swp)
>          |                    ^~~~~~~~~~~~~~
>    mm/swapfile.c:1461:6: warning: no previous prototype for 'swapcache_fr=
ee_entries' [-Wmissing-prototypes]
>     1461 | void swapcache_free_entries(swp_entry_t *entries, int n)
>          |      ^~~~~~~~~~~~~~~~~~~~~~
>    mm/swapfile.c:1489:5: error: redefinition of '__swap_count'
>     1489 | int __swap_count(swp_entry_t entry)
>          |     ^~~~~~~~~~~~
>    include/linux/swap.h:571:19: note: previous definition of '__swap_coun=
t' with type 'int(swp_entry_t)'
>      571 | static inline int __swap_count(swp_entry_t entry)
>          |                   ^~~~~~~~~~~~
>    mm/swapfile.c:1502:5: error: redefinition of 'swap_swapcount'
>     1502 | int swap_swapcount(struct swap_info_struct *si, swp_entry_t en=
try)
>          |     ^~~~~~~~~~~~~~
>    include/linux/swap.h:576:19: note: previous definition of 'swap_swapco=
unt' with type 'int(struct swap_info_struct *, swp_entry_t)'
>      576 | static inline int swap_swapcount(struct swap_info_struct *si, =
swp_entry_t entry)
>          |                   ^~~~~~~~~~~~~~
>    mm/swapfile.c:1518:5: error: redefinition of 'swp_swapcount'
>     1518 | int swp_swapcount(swp_entry_t entry)
>          |     ^~~~~~~~~~~~~
>    include/linux/swap.h:581:19: note: previous definition of 'swp_swapcou=
nt' with type 'int(swp_entry_t)'
>      581 | static inline int swp_swapcount(swp_entry_t entry)
>          |                   ^~~~~~~~~~~~~
>    mm/swapfile.c:1611:6: error: redefinition of 'folio_free_swap'
>     1611 | bool folio_free_swap(struct folio *folio)
>          |      ^~~~~~~~~~~~~~~
>    include/linux/swap.h:593:20: note: previous definition of 'folio_free_=
swap' with type 'bool(struct folio *)' {aka '_Bool(struct folio *)'}
>      593 | static inline bool folio_free_swap(struct folio *folio)
>          |                    ^~~~~~~~~~~~~~~
>    mm/swapfile.c:1655:6: error: redefinition of 'free_swap_and_cache_nr'
>     1655 | void free_swap_and_cache_nr(swp_entry_t entry, int nr)
>          |      ^~~~~~~~~~~~~~~~~~~~~~
>    include/linux/swap.h:532:20: note: previous definition of 'free_swap_a=
nd_cache_nr' with type 'void(swp_entry_t,  int)'
>      532 | static inline void free_swap_and_cache_nr(swp_entry_t entry, i=
nt nr)
>          |                    ^~~~~~~~~~~~~~~~~~~~~~
>    mm/swapfile.c:2303:1: error: redefinition of 'add_swap_extent'
>     2303 | add_swap_extent(struct swap_info_struct *sis, unsigned long st=
art_page,
>          | ^~~~~~~~~~~~~~~
>    include/linux/swap.h:598:19: note: previous definition of 'add_swap_ex=
tent' with type 'int(struct swap_info_struct *, long unsigned int,  long un=
signed int,  sector_t)' {aka 'int(struct swap_info_struct *, long unsigned =
int,  long unsigned int,  long long unsigned int)'}
>      598 | static inline int add_swap_extent(struct swap_info_struct *sis=
,
>          |                   ^~~~~~~~~~~~~~~
>    mm/swapfile.c: In function 'setup_swap_extents':
>    mm/swapfile.c:2389:21: error: implicit declaration of function 'sio_po=
ol_init'; did you mean 'mempool_init'? [-Werror=3Dimplicit-function-declara=
tion]
>     2389 |                     sio_pool_init() !=3D 0) {
>          |                     ^~~~~~~~~~~~~
>          |                     mempool_init
>    mm/swapfile.c:2396:16: error: implicit declaration of function 'generi=
c_swapfile_activate' [-Werror=3Dimplicit-function-declaration]
>     2396 |         return generic_swapfile_activate(sis, swap_file, span)=
;
>          |                ^~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/swapfile.c: In function '_enable_swap_info':
>    mm/swapfile.c:2444:26: error: lvalue required as left operand of assig=
nment
>     2444 |         total_swap_pages +=3D p->pages;
>          |                          ^~
>    mm/swapfile.c: At top level:
>    mm/swapfile.c:2499:6: warning: no previous prototype for 'has_usable_s=
wap' [-Wmissing-prototypes]
>     2499 | bool has_usable_swap(void)
>          |      ^~~~~~~~~~~~~~~
>    mm/swapfile.c: In function '__do_sys_swapoff':
>    mm/swapfile.c:2574:26: error: lvalue required as left operand of assig=
nment
>     2574 |         total_swap_pages -=3D p->pages;
>          |                          ^~
>    mm/swapfile.c:2650:9: error: implicit declaration of function 'exit_sw=
ap_address_space'; did you mean 'swap_address_space'? [-Werror=3Dimplicit-f=
unction-declaration]
>     2650 |         exit_swap_address_space(p->type);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~
>          |         swap_address_space
>    In file included from include/linux/export.h:5,
>                     from include/linux/linkage.h:7,
>                     from include/linux/fs.h:5:
>    mm/swapfile.c: In function 'setup_swap_map_and_extents':
>    mm/swapfile.c:2995:22: error: 'SWAP_ADDRESS_SPACE_PAGES' undeclared (f=
irst use in this function)
>     2995 |         DIV_ROUND_UP(SWAP_ADDRESS_SPACE_PAGES, SWAPFILE_CLUSTE=
R)
>          |                      ^~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/compiler.h:284:55: note: in definition of macro '__is_co=
nstexpr'
>      284 |         (sizeof(int) =3D=3D sizeof(*(8 ? ((void *)((long)(x) *=
 0l)) : (int *)8)))
>          |                                                       ^
>    include/linux/minmax.h:169:33: note: in expansion of macro '__careful_=
cmp'
>      169 | #define max_t(type, x, y)       __careful_cmp(max, (type)(x), =
(type)(y))
>          |                                 ^~~~~~~~~~~~~
>    mm/swapfile.c:2997:9: note: in expansion of macro 'max_t'
>     2997 |         max_t(unsigned int, SWAP_CLUSTER_INFO_COLS, SWAP_CLUST=
ER_SPACE_COLS)
>          |         ^~~~~
>    include/linux/math.h:37:22: note: in expansion of macro '__KERNEL_DIV_=
ROUND_UP'
>       37 | #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
>          |                      ^~~~~~~~~~~~~~~~~~~~~
>    mm/swapfile.c:2997:53: note: in expansion of macro 'SWAP_CLUSTER_SPACE=
_COLS'
>     2997 |         max_t(unsigned int, SWAP_CLUSTER_INFO_COLS, SWAP_CLUST=
ER_SPACE_COLS)
>          |                                                     ^~~~~~~~~~=
~~~~~~~~~~~~~
>    mm/swapfile.c:3010:66: note: in expansion of macro 'SWAP_CLUSTER_COLS'
>     3010 |         unsigned long col =3D p->cluster_next / SWAPFILE_CLUST=
ER % SWAP_CLUSTER_COLS;
>          |                                                               =
   ^~~~~~~~~~~~~~~~~
>    In file included from include/linux/container_of.h:5,
>
>
> vim +/swap_free_nr +1388 mm/swapfile.c
>
>   1387
> > 1388  void swap_free_nr(swp_entry_t entry, int nr_pages)
>   1389  {
>   1390          int nr;
>   1391          struct swap_info_struct *sis;
>   1392          unsigned long offset =3D swp_offset(entry);
>   1393
>   1394          sis =3D _swap_info_get(entry);
>   1395          if (!sis)
>   1396                  return;
>   1397
>   1398          while (nr_pages) {
>   1399                  nr =3D min_t(int, nr_pages, SWAPFILE_CLUSTER - of=
fset % SWAPFILE_CLUSTER);
>   1400                  cluster_swap_free_nr(sis, offset, nr);
>   1401                  offset +=3D nr;
>   1402                  nr_pages -=3D nr;
>   1403          }
>   1404  }
>   1405
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

Thanks
Barry
