Content-Type: multipart/mixed; boundary="===============1093161636993090955=="
MIME-Version: 1.0
From: Minchan Kim <minchan@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 4/4] dma-buf: heaps: add chunk heap to dmabuf heaps
Date: Wed, 13 Jan 2021 17:04:01 -0800
Message-ID: <X/+YgTWY2k4AjxlK@google.com>
In-Reply-To: <202101131134.ACIz6uj2-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1093161636993090955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2021 at 11:11:56AM +0800, kernel test robot wrote:
> Hi Minchan,
> =

> Thank you for the patch! Perhaps something to improve:
> =

> [auto build test WARNING on next-20210112]
> [cannot apply to s390/features robh/for-next linux/master linus/master hn=
az-linux-mm/master v5.11-rc3 v5.11-rc2 v5.11-rc1 v5.11-rc3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Minchan-Kim/Chunk-Heap-S=
upport-on-DMA-HEAP/20210113-092747
> base:    df869cab4b3519d603806234861aa0a39df479c0
> config: mips-allyesconfig (attached as .config)
> compiler: mips-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/531ebc21d3c2584784d4471=
4e3b4f1df46b80eee
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Minchan-Kim/Chunk-Heap-Support-o=
n-DMA-HEAP/20210113-092747
>         git checkout 531ebc21d3c2584784d44714e3b4f1df46b80eee
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dmips =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    drivers/dma-buf/heaps/chunk_heap.c: In function 'chunk_heap_do_vmap':
>    drivers/dma-buf/heaps/chunk_heap.c:215:24: error: implicit declaration=
 of function 'vmalloc'; did you mean 'kvmalloc'? [-Werror=3Dimplicit-functi=
on-declaration]
>      215 |  struct page **pages =3D vmalloc(sizeof(struct page *) * npage=
s);
>          |                        ^~~~~~~
>          |                        kvmalloc

Looks like we need vmalloc.h.


> >> drivers/dma-buf/heaps/chunk_heap.c:215:24: warning: initialization of =
'struct page **' from 'int' makes pointer from integer without a cast [-Win=
t-conversion]
>    drivers/dma-buf/heaps/chunk_heap.c:228:10: error: implicit declaration=
 of function 'vmap'; did you mean 'kmap'? [-Werror=3Dimplicit-function-decl=
aration]
>      228 |  vaddr =3D vmap(pages, npages, VM_MAP, PAGE_KERNEL);
>          |          ^~~~
>          |          kmap

We need vmap, not kmap.

>    drivers/dma-buf/heaps/chunk_heap.c:228:30: error: 'VM_MAP' undeclared =
(first use in this function); did you mean 'VM_MTE'?
>      228 |  vaddr =3D vmap(pages, npages, VM_MAP, PAGE_KERNEL);
>          |                              ^~~~~~
>          |                              VM_MTE

Looks like bot was confused since we have missed the vmalloc.h
In next spin, let's fix it.

>    drivers/dma-buf/heaps/chunk_heap.c:228:30: note: each undeclared ident=
ifier is reported only once for each function it appears in
>    drivers/dma-buf/heaps/chunk_heap.c:229:2: error: implicit declaration =
of function 'vfree'; did you mean 'kvfree'? [-Werror=3Dimplicit-function-de=
claration]
>      229 |  vfree(pages);
>          |  ^~~~~
>          |  kvfree
>    drivers/dma-buf/heaps/chunk_heap.c: In function 'chunk_heap_vunmap':
>    drivers/dma-buf/heaps/chunk_heap.c:268:3: error: implicit declaration =
of function 'vunmap'; did you mean 'kunmap'? [-Werror=3Dimplicit-function-d=
eclaration]
>      268 |   vunmap(buffer->vaddr);
>          |   ^~~~~~
>          |   kunmap
>    cc1: some warnings being treated as errors
> =

> =

> vim +215 drivers/dma-buf/heaps/chunk_heap.c
> =

>    210	=

>    211	static void *chunk_heap_do_vmap(struct chunk_heap_buffer *buffer)
>    212	{
>    213		struct sg_table *table =3D &buffer->sg_table;
>    214		int npages =3D PAGE_ALIGN(buffer->len) / PAGE_SIZE;
>  > 215		struct page **pages =3D vmalloc(sizeof(struct page *) * npages);
>    216		struct page **tmp =3D pages;
>    217		struct sg_page_iter piter;
>    218		void *vaddr;
>    219	=

>    220		if (!pages)
>    221			return ERR_PTR(-ENOMEM);
>    222	=

>    223		for_each_sgtable_page(table, &piter, 0) {
>    224			WARN_ON(tmp - pages >=3D npages);
>    225			*tmp++ =3D sg_page_iter_page(&piter);
>    226		}
>    227	=

>    228		vaddr =3D vmap(pages, npages, VM_MAP, PAGE_KERNEL);
>    229		vfree(pages);
>    230	=

>    231		if (!vaddr)
>    232			return ERR_PTR(-ENOMEM);
>    233	=

>    234		return vaddr;
>    235	}
>    236	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============1093161636993090955==--

