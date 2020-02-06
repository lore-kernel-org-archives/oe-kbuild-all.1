Content-Type: multipart/mixed; boundary="===============1391211049971437263=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: drivers//staging/comedi/comedi_fops.c:2380:8: error: 'PAGE_SHARED' undeclared; did you mean 'PAGE_SIZE'?
Date: Fri, 07 Feb 2020 05:04:13 +0800
Message-ID: <202002070502.6Rg3orkS%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1391211049971437263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   90568ecf561540fa330511e21fcd823b0c3829c6
commit: 6bd33e1ece528f67646db33bf97406b747dafda0 riscv: add nommu support
date:   3 months ago
config: riscv-randconfig-a001-20200207 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 6bd33e1ece528f67646db33bf97406b747dafda0
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Driscv =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   include/asm-generic/memory_model.h:82:21: note: in expansion of macro '_=
_pfn_to_page'
    #define pfn_to_page __pfn_to_page
                        ^~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:112:30: note: in expansion of macro 'pfn_t=
o_page'
    #define virt_to_page(vaddr) (pfn_to_page(virt_to_pfn(vaddr)))
                                 ^~~~~~~~~~~
   include/linux/scatterlist.h:145:18: note: in expansion of macro 'virt_to=
_page'
     sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));
                     ^~~~~~~~~~~~
   In file included from arch/riscv/include/asm/page.h:12:0,
                    from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:38,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from include/linux/pagemap.h:8,
                    from fs//cifs/smb2ops.c:8:
   include/linux/scatterlist.h: In function 'sg_phys':
   include/asm-generic/memory_model.h:55:54: error: 'vmemmap' undeclared (f=
irst use in this function); did you mean 'vm_mmap'?
    #define __page_to_pfn(page) (unsigned long)((page) - vmemmap)
                                                         ^
   include/linux/pfn.h:21:36: note: in definition of macro 'PFN_PHYS'
    #define PFN_PHYS(x) ((phys_addr_t)(x) << PAGE_SHIFT)
                                       ^
   arch/riscv/include/asm/page.h:115:29: note: in expansion of macro 'pfn_t=
o_phys'
    #define page_to_phys(page) (pfn_to_phys(page_to_pfn(page)))
                                ^~~~~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '_=
_page_to_pfn'
    #define page_to_pfn __page_to_pfn
                        ^~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:115:41: note: in expansion of macro 'page_=
to_pfn'
    #define page_to_phys(page) (pfn_to_phys(page_to_pfn(page)))
                                            ^~~~~~~~~~~
   include/linux/scatterlist.h:224:9: note: in expansion of macro 'page_to_=
phys'
     return page_to_phys(sg_page(sg)) + sg->offset;
            ^~~~~~~~~~~~
   In file included from arch/riscv/include/asm/page.h:131:0,
                    from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:38,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from include/linux/pagemap.h:8,
                    from fs//cifs/smb2ops.c:8:
   include/linux/scatterlist.h: In function 'sg_page_iter_page':
   include/asm-generic/memory_model.h:54:29: error: 'vmemmap' undeclared (f=
irst use in this function); did you mean 'vm_mmap'?
    #define __pfn_to_page(pfn) (vmemmap + (pfn))
                                ^
   include/asm-generic/memory_model.h:82:21: note: in expansion of macro '_=
_pfn_to_page'
    #define pfn_to_page __pfn_to_page
                        ^~~~~~~~~~~~~
   include/linux/mm.h:213:26: note: in expansion of macro 'pfn_to_page'
    #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
                             ^~~~~~~~~~~
   include/linux/scatterlist.h:384:9: note: in expansion of macro 'nth_page'
     return nth_page(sg_page(piter->sg), piter->sg_pgoffset);
            ^~~~~~~~
   include/linux/dma-mapping.h: In function 'dma_map_single_attrs':
   include/asm-generic/memory_model.h:54:29: error: 'vmemmap' undeclared (f=
irst use in this function); did you mean 'vm_mmap'?
    #define __pfn_to_page(pfn) (vmemmap + (pfn))
                                ^
   include/asm-generic/memory_model.h:82:21: note: in expansion of macro '_=
_pfn_to_page'
    #define pfn_to_page __pfn_to_page
                        ^~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:112:30: note: in expansion of macro 'pfn_t=
o_page'
    #define virt_to_page(vaddr) (pfn_to_page(virt_to_pfn(vaddr)))
                                 ^~~~~~~~~~~
   include/linux/dma-mapping.h:587:33: note: in expansion of macro 'virt_to=
_page'
     return dma_map_page_attrs(dev, virt_to_page(ptr), offset_in_page(ptr),
                                    ^~~~~~~~~~~~
   In file included from arch/riscv/include/asm/page.h:131:0,
                    from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:38,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from include/linux/pagemap.h:8,
                    from fs//cifs/smb2ops.c:8:
   fs//cifs/smb2ops.c: In function 'smb2_sg_set_buf':
   include/asm-generic/memory_model.h:54:29: error: 'vmemmap' undeclared (f=
irst use in this function); did you mean 'vm_mmap'?
    #define __pfn_to_page(pfn) (vmemmap + (pfn))
                                ^
   include/asm-generic/memory_model.h:82:21: note: in expansion of macro '_=
_pfn_to_page'
    #define pfn_to_page __pfn_to_page
                        ^~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:112:30: note: in expansion of macro 'pfn_t=
o_page'
    #define virt_to_page(vaddr) (pfn_to_page(virt_to_pfn(vaddr)))
                                 ^~~~~~~~~~~
>> fs//cifs/smb2ops.c:3542:10: note: in expansion of macro 'virt_to_page'
      addr =3D virt_to_page(buf);
             ^~~~~~~~~~~~
   In file included from include/linux/pagemap.h:8:0,
                    from fs//cifs/smb2ops.c:8:
   include/linux/mm.h: In function 'lowmem_page_address':
   include/linux/mm.h:1322:1: warning: control reaches end of non-void func=
tion [-Wreturn-type]
    }
    ^
--
                    from include/linux/module.h:10,
                    from drivers//staging/comedi/comedi_fops.c:14:
   include/linux/scatterlist.h: In function 'sg_set_buf':
   include/asm-generic/memory_model.h:54:29: error: 'vmemmap' undeclared (f=
irst use in this function); did you mean 'vm_mmap'?
    #define __pfn_to_page(pfn) (vmemmap + (pfn))
                                ^
   include/asm-generic/memory_model.h:82:21: note: in expansion of macro '_=
_pfn_to_page'
    #define pfn_to_page __pfn_to_page
                        ^~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:112:30: note: in expansion of macro 'pfn_t=
o_page'
    #define virt_to_page(vaddr) (pfn_to_page(virt_to_pfn(vaddr)))
                                 ^~~~~~~~~~~
   include/linux/scatterlist.h:145:18: note: in expansion of macro 'virt_to=
_page'
     sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));
                     ^~~~~~~~~~~~
   In file included from arch/riscv/include/asm/page.h:12:0,
                    from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:38,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10,
                    from drivers//staging/comedi/comedi_fops.c:14:
   include/linux/scatterlist.h: In function 'sg_phys':
   include/asm-generic/memory_model.h:55:54: error: 'vmemmap' undeclared (f=
irst use in this function); did you mean 'vm_mmap'?
    #define __page_to_pfn(page) (unsigned long)((page) - vmemmap)
                                                         ^
   include/linux/pfn.h:21:36: note: in definition of macro 'PFN_PHYS'
    #define PFN_PHYS(x) ((phys_addr_t)(x) << PAGE_SHIFT)
                                       ^
   arch/riscv/include/asm/page.h:115:29: note: in expansion of macro 'pfn_t=
o_phys'
    #define page_to_phys(page) (pfn_to_phys(page_to_pfn(page)))
                                ^~~~~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '_=
_page_to_pfn'
    #define page_to_pfn __page_to_pfn
                        ^~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:115:41: note: in expansion of macro 'page_=
to_pfn'
    #define page_to_phys(page) (pfn_to_phys(page_to_pfn(page)))
                                            ^~~~~~~~~~~
   include/linux/scatterlist.h:224:9: note: in expansion of macro 'page_to_=
phys'
     return page_to_phys(sg_page(sg)) + sg->offset;
            ^~~~~~~~~~~~
   In file included from arch/riscv/include/asm/page.h:131:0,
                    from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:38,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10,
                    from drivers//staging/comedi/comedi_fops.c:14:
   include/linux/scatterlist.h: In function 'sg_page_iter_page':
   include/asm-generic/memory_model.h:54:29: error: 'vmemmap' undeclared (f=
irst use in this function); did you mean 'vm_mmap'?
    #define __pfn_to_page(pfn) (vmemmap + (pfn))
                                ^
   include/asm-generic/memory_model.h:82:21: note: in expansion of macro '_=
_pfn_to_page'
    #define pfn_to_page __pfn_to_page
                        ^~~~~~~~~~~~~
   include/linux/mm.h:213:26: note: in expansion of macro 'pfn_to_page'
    #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
                             ^~~~~~~~~~~
   include/linux/scatterlist.h:384:9: note: in expansion of macro 'nth_page'
     return nth_page(sg_page(piter->sg), piter->sg_pgoffset);
            ^~~~~~~~
   include/linux/dma-mapping.h: In function 'dma_map_single_attrs':
   include/asm-generic/memory_model.h:54:29: error: 'vmemmap' undeclared (f=
irst use in this function); did you mean 'vm_mmap'?
    #define __pfn_to_page(pfn) (vmemmap + (pfn))
                                ^
   include/asm-generic/memory_model.h:82:21: note: in expansion of macro '_=
_pfn_to_page'
    #define pfn_to_page __pfn_to_page
                        ^~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:112:30: note: in expansion of macro 'pfn_t=
o_page'
    #define virt_to_page(vaddr) (pfn_to_page(virt_to_pfn(vaddr)))
                                 ^~~~~~~~~~~
   include/linux/dma-mapping.h:587:33: note: in expansion of macro 'virt_to=
_page'
     return dma_map_page_attrs(dev, virt_to_page(ptr), offset_in_page(ptr),
                                    ^~~~~~~~~~~~
   drivers//staging/comedi/comedi_fops.c: In function 'comedi_mmap':
   include/asm-generic/memory_model.h:54:29: error: 'vmemmap' undeclared (f=
irst use in this function); did you mean 'vm_mmap'?
    #define __pfn_to_page(pfn) (vmemmap + (pfn))
                                ^
   include/asm-generic/memory_model.h:55:46: note: in definition of macro '=
__page_to_pfn'
    #define __page_to_pfn(page) (unsigned long)((page) - vmemmap)
                                                 ^~~~
   include/asm-generic/memory_model.h:82:21: note: in expansion of macro '_=
_pfn_to_page'
    #define pfn_to_page __pfn_to_page
                        ^~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:112:30: note: in expansion of macro 'pfn_t=
o_page'
    #define virt_to_page(vaddr) (pfn_to_page(virt_to_pfn(vaddr)))
                                 ^~~~~~~~~~~
   drivers//staging/comedi/comedi_fops.c:2378:22: note: in expansion of mac=
ro 'virt_to_page'
       pfn =3D page_to_pfn(virt_to_page(buf->virt_addr));
                         ^~~~~~~~~~~~
>> drivers//staging/comedi/comedi_fops.c:2380:8: error: 'PAGE_SHARED' undec=
lared (first use in this function); did you mean 'PAGE_SIZE'?
           PAGE_SHARED);
           ^~~~~~~~~~~
           PAGE_SIZE
--
   include/asm-generic/memory_model.h:54:29: error: 'vmemmap' undeclared (f=
irst use in this function); did you mean 'vm_mmap'?
    #define __pfn_to_page(pfn) (vmemmap + (pfn))
                                ^
   include/asm-generic/memory_model.h:82:21: note: in expansion of macro '_=
_pfn_to_page'
    #define pfn_to_page __pfn_to_page
                        ^~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:112:30: note: in expansion of macro 'pfn_t=
o_page'
    #define virt_to_page(vaddr) (pfn_to_page(virt_to_pfn(vaddr)))
                                 ^~~~~~~~~~~
   include/linux/scatterlist.h:145:18: note: in expansion of macro 'virt_to=
_page'
     sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));
                     ^~~~~~~~~~~~
   In file included from arch/riscv/include/asm/page.h:12:0,
                    from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:38,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from net//sunrpc/xprtsock.c:24:
   include/linux/scatterlist.h: In function 'sg_phys':
   include/asm-generic/memory_model.h:55:54: error: 'vmemmap' undeclared (f=
irst use in this function); did you mean 'vm_mmap'?
    #define __page_to_pfn(page) (unsigned long)((page) - vmemmap)
                                                         ^
   include/linux/pfn.h:21:36: note: in definition of macro 'PFN_PHYS'
    #define PFN_PHYS(x) ((phys_addr_t)(x) << PAGE_SHIFT)
                                       ^
   arch/riscv/include/asm/page.h:115:29: note: in expansion of macro 'pfn_t=
o_phys'
    #define page_to_phys(page) (pfn_to_phys(page_to_pfn(page)))
                                ^~~~~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '_=
_page_to_pfn'
    #define page_to_pfn __page_to_pfn
                        ^~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:115:41: note: in expansion of macro 'page_=
to_pfn'
    #define page_to_phys(page) (pfn_to_phys(page_to_pfn(page)))
                                            ^~~~~~~~~~~
   include/linux/scatterlist.h:224:9: note: in expansion of macro 'page_to_=
phys'
     return page_to_phys(sg_page(sg)) + sg->offset;
            ^~~~~~~~~~~~
   In file included from arch/riscv/include/asm/page.h:131:0,
                    from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:38,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from net//sunrpc/xprtsock.c:24:
   include/linux/scatterlist.h: In function 'sg_page_iter_page':
   include/asm-generic/memory_model.h:54:29: error: 'vmemmap' undeclared (f=
irst use in this function); did you mean 'vm_mmap'?
    #define __pfn_to_page(pfn) (vmemmap + (pfn))
                                ^
   include/asm-generic/memory_model.h:82:21: note: in expansion of macro '_=
_pfn_to_page'
    #define pfn_to_page __pfn_to_page
                        ^~~~~~~~~~~~~
   include/linux/mm.h:213:26: note: in expansion of macro 'pfn_to_page'
    #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
                             ^~~~~~~~~~~
   include/linux/scatterlist.h:384:9: note: in expansion of macro 'nth_page'
     return nth_page(sg_page(piter->sg), piter->sg_pgoffset);
            ^~~~~~~~
   include/linux/dma-mapping.h: In function 'dma_map_single_attrs':
   include/asm-generic/memory_model.h:54:29: error: 'vmemmap' undeclared (f=
irst use in this function); did you mean 'vm_mmap'?
    #define __pfn_to_page(pfn) (vmemmap + (pfn))
                                ^
   include/asm-generic/memory_model.h:82:21: note: in expansion of macro '_=
_pfn_to_page'
    #define pfn_to_page __pfn_to_page
                        ^~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:112:30: note: in expansion of macro 'pfn_t=
o_page'
    #define virt_to_page(vaddr) (pfn_to_page(virt_to_pfn(vaddr)))
                                 ^~~~~~~~~~~
   include/linux/dma-mapping.h:587:33: note: in expansion of macro 'virt_to=
_page'
     return dma_map_page_attrs(dev, virt_to_page(ptr), offset_in_page(ptr),
                                    ^~~~~~~~~~~~
   In file included from arch/riscv/include/asm/page.h:131:0,
                    from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:38,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from net//sunrpc/xprtsock.c:24:
   net//sunrpc/xprtsock.c: In function 'bc_sendto':
   include/asm-generic/memory_model.h:54:29: error: 'vmemmap' undeclared (f=
irst use in this function); did you mean 'vm_mmap'?
    #define __pfn_to_page(pfn) (vmemmap + (pfn))
                                ^
   include/asm-generic/memory_model.h:82:21: note: in expansion of macro '_=
_pfn_to_page'
    #define pfn_to_page __pfn_to_page
                        ^~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:112:30: note: in expansion of macro 'pfn_t=
o_page'
    #define virt_to_page(vaddr) (pfn_to_page(virt_to_pfn(vaddr)))
                                 ^~~~~~~~~~~
>> net//sunrpc/xprtsock.c:2668:14: note: in expansion of macro 'virt_to_pag=
e'
      tailpage =3D virt_to_page(xbufp->tail[0].iov_base);
                 ^~~~~~~~~~~~
   In file included from include/linux/pagemap.h:8:0,
                    from net//sunrpc/xprtsock.c:27:
   include/linux/mm.h: In function 'lowmem_page_address':
   include/linux/mm.h:1322:1: warning: control reaches end of non-void func=
tion [-Wreturn-type]
    }
    ^
..

vim +2380 drivers//staging/comedi/comedi_fops.c

ed9eccbe8970f6 David Schleef      2008-11-04  2296  =

ed9eccbe8970f6 David Schleef      2008-11-04  2297  static int comedi_mmap(=
struct file *file, struct vm_area_struct *vma)
ed9eccbe8970f6 David Schleef      2008-11-04  2298  {
20f083c07565cb Ian Abbott         2014-11-04  2299  	struct comedi_file *cf=
p =3D file->private_data;
20f083c07565cb Ian Abbott         2014-11-04  2300  	struct comedi_device *=
dev =3D cfp->dev;
a52840a98bbb50 H Hartley Sweeten  2012-12-19  2301  	struct comedi_subdevic=
e *s;
a52840a98bbb50 H Hartley Sweeten  2012-12-19  2302  	struct comedi_async *a=
sync;
b34aa86f12e884 Ian Abbott         2014-04-10  2303  	struct comedi_buf_map =
*bm =3D NULL;
e36472145aa706 Ian Abbott         2019-06-25  2304  	struct comedi_buf_page=
 *buf;
ed9eccbe8970f6 David Schleef      2008-11-04  2305  	unsigned long start =
=3D vma->vm_start;
ed9eccbe8970f6 David Schleef      2008-11-04  2306  	unsigned long size;
ed9eccbe8970f6 David Schleef      2008-11-04  2307  	int n_pages;
ed9eccbe8970f6 David Schleef      2008-11-04  2308  	int i;
e36472145aa706 Ian Abbott         2019-06-25  2309  	int retval =3D 0;
3ffab428f40849 Bernd Porr         2011-11-08  2310  =

b34aa86f12e884 Ian Abbott         2014-04-10  2311  	/*
b34aa86f12e884 Ian Abbott         2014-04-10  2312  	 * 'trylock' avoids ci=
rcular dependency with current->mm->mmap_sem
b34aa86f12e884 Ian Abbott         2014-04-10  2313  	 * and down-reading &d=
ev->attach_lock should normally succeed without
b34aa86f12e884 Ian Abbott         2014-04-10  2314  	 * contention unless t=
he device is in the process of being attached
b34aa86f12e884 Ian Abbott         2014-04-10  2315  	 * or detached.
b34aa86f12e884 Ian Abbott         2014-04-10  2316  	 */
b34aa86f12e884 Ian Abbott         2014-04-10  2317  	if (!down_read_trylock=
(&dev->attach_lock))
b34aa86f12e884 Ian Abbott         2014-04-10  2318  		return -EAGAIN;
a52840a98bbb50 H Hartley Sweeten  2012-12-19  2319  =

ed9eccbe8970f6 David Schleef      2008-11-04  2320  	if (!dev->attached) {
272850f07c47ab H Hartley Sweeten  2013-11-26  2321  		dev_dbg(dev->class_de=
v, "no driver attached\n");
ed9eccbe8970f6 David Schleef      2008-11-04  2322  		retval =3D -ENODEV;
ed9eccbe8970f6 David Schleef      2008-11-04  2323  		goto done;
ed9eccbe8970f6 David Schleef      2008-11-04  2324  	}
a52840a98bbb50 H Hartley Sweeten  2012-12-19  2325  =

476b847733636c Greg Kroah-Hartman 2008-11-13  2326  	if (vma->vm_flags & VM=
_WRITE)
20f083c07565cb Ian Abbott         2014-11-04  2327  		s =3D comedi_file_wri=
te_subdevice(file);
476b847733636c Greg Kroah-Hartman 2008-11-13  2328  	else
20f083c07565cb Ian Abbott         2014-11-04  2329  		s =3D comedi_file_rea=
d_subdevice(file);
a52840a98bbb50 H Hartley Sweeten  2012-12-19  2330  	if (!s) {
ed9eccbe8970f6 David Schleef      2008-11-04  2331  		retval =3D -EINVAL;
ed9eccbe8970f6 David Schleef      2008-11-04  2332  		goto done;
ed9eccbe8970f6 David Schleef      2008-11-04  2333  	}
a52840a98bbb50 H Hartley Sweeten  2012-12-19  2334  =

ed9eccbe8970f6 David Schleef      2008-11-04  2335  	async =3D s->async;
a52840a98bbb50 H Hartley Sweeten  2012-12-19  2336  	if (!async) {
ed9eccbe8970f6 David Schleef      2008-11-04  2337  		retval =3D -EINVAL;
ed9eccbe8970f6 David Schleef      2008-11-04  2338  		goto done;
ed9eccbe8970f6 David Schleef      2008-11-04  2339  	}
ed9eccbe8970f6 David Schleef      2008-11-04  2340  =

ed9eccbe8970f6 David Schleef      2008-11-04  2341  	if (vma->vm_pgoff !=3D=
 0) {
272850f07c47ab H Hartley Sweeten  2013-11-26  2342  		dev_dbg(dev->class_de=
v, "mmap() offset must be 0.\n");
ed9eccbe8970f6 David Schleef      2008-11-04  2343  		retval =3D -EINVAL;
ed9eccbe8970f6 David Schleef      2008-11-04  2344  		goto done;
ed9eccbe8970f6 David Schleef      2008-11-04  2345  	}
ed9eccbe8970f6 David Schleef      2008-11-04  2346  =

ed9eccbe8970f6 David Schleef      2008-11-04  2347  	size =3D vma->vm_end -=
 vma->vm_start;
ed9eccbe8970f6 David Schleef      2008-11-04  2348  	if (size > async->prea=
lloc_bufsz) {
ed9eccbe8970f6 David Schleef      2008-11-04  2349  		retval =3D -EFAULT;
ed9eccbe8970f6 David Schleef      2008-11-04  2350  		goto done;
ed9eccbe8970f6 David Schleef      2008-11-04  2351  	}
44b8c793fc0d63 Sandhya Bankar     2016-03-06  2352  	if (offset_in_page(siz=
e)) {
ed9eccbe8970f6 David Schleef      2008-11-04  2353  		retval =3D -EFAULT;
ed9eccbe8970f6 David Schleef      2008-11-04  2354  		goto done;
ed9eccbe8970f6 David Schleef      2008-11-04  2355  	}
ed9eccbe8970f6 David Schleef      2008-11-04  2356  =

ec9d0754e0c640 sayli karnik       2016-09-20  2357  	n_pages =3D vma_pages(=
vma);
b34aa86f12e884 Ian Abbott         2014-04-10  2358  =

b34aa86f12e884 Ian Abbott         2014-04-10  2359  	/* get reference to cu=
rrent buf map (if any) */
b34aa86f12e884 Ian Abbott         2014-04-10  2360  	bm =3D comedi_buf_map_=
from_subdev_get(s);
af93da31634d6d Ian Abbott         2013-11-08  2361  	if (!bm || n_pages > b=
m->n_pages) {
af93da31634d6d Ian Abbott         2013-11-08  2362  		retval =3D -EINVAL;
af93da31634d6d Ian Abbott         2013-11-08  2363  		goto done;
af93da31634d6d Ian Abbott         2013-11-08  2364  	}
e36472145aa706 Ian Abbott         2019-06-25  2365  	if (bm->dma_dir !=3D D=
MA_NONE) {
e36472145aa706 Ian Abbott         2019-06-25  2366  		/*
e36472145aa706 Ian Abbott         2019-06-25  2367  		 * DMA buffer was all=
ocated as a single block.
e36472145aa706 Ian Abbott         2019-06-25  2368  		 * Address is in page=
_list[0].
e36472145aa706 Ian Abbott         2019-06-25  2369  		 */
e36472145aa706 Ian Abbott         2019-06-25  2370  		buf =3D &bm->page_lis=
t[0];
e36472145aa706 Ian Abbott         2019-06-25  2371  		retval =3D dma_mmap_c=
oherent(bm->dma_hw_dev, vma, buf->virt_addr,
e36472145aa706 Ian Abbott         2019-06-25  2372  					   buf->dma_addr, =
n_pages * PAGE_SIZE);
e36472145aa706 Ian Abbott         2019-06-25  2373  	} else {
ed9eccbe8970f6 David Schleef      2008-11-04  2374  		for (i =3D 0; i < n_p=
ages; ++i) {
e36472145aa706 Ian Abbott         2019-06-25  2375  			unsigned long pfn;
e36472145aa706 Ian Abbott         2019-06-25  2376  =

e36472145aa706 Ian Abbott         2019-06-25  2377  			buf =3D &bm->page_li=
st[i];
e36472145aa706 Ian Abbott         2019-06-25  2378  			pfn =3D page_to_pfn(=
virt_to_page(buf->virt_addr));
e36472145aa706 Ian Abbott         2019-06-25  2379  			retval =3D remap_pfn=
_range(vma, start, pfn, PAGE_SIZE,
e36472145aa706 Ian Abbott         2019-06-25 @2380  						 PAGE_SHARED);
e36472145aa706 Ian Abbott         2019-06-25  2381  			if (retval)
e36472145aa706 Ian Abbott         2019-06-25  2382  				break;
a52840a98bbb50 H Hartley Sweeten  2012-12-19  2383  =

ed9eccbe8970f6 David Schleef      2008-11-04  2384  			start +=3D PAGE_SIZE;
ed9eccbe8970f6 David Schleef      2008-11-04  2385  		}
e36472145aa706 Ian Abbott         2019-06-25  2386  	}
ed9eccbe8970f6 David Schleef      2008-11-04  2387  =

e36472145aa706 Ian Abbott         2019-06-25  2388  	if (retval =3D=3D 0) {
ed9eccbe8970f6 David Schleef      2008-11-04  2389  		vma->vm_ops =3D &come=
di_vm_ops;
af93da31634d6d Ian Abbott         2013-11-08  2390  		vma->vm_private_data =
=3D bm;
ed9eccbe8970f6 David Schleef      2008-11-04  2391  =

af93da31634d6d Ian Abbott         2013-11-08  2392  		vma->vm_ops->open(vma=
);
e36472145aa706 Ian Abbott         2019-06-25  2393  	}
ed9eccbe8970f6 David Schleef      2008-11-04  2394  =

ed9eccbe8970f6 David Schleef      2008-11-04  2395  done:
b34aa86f12e884 Ian Abbott         2014-04-10  2396  	up_read(&dev->attach_l=
ock);
b34aa86f12e884 Ian Abbott         2014-04-10  2397  	comedi_buf_map_put(bm)=
;	/* put reference to buf map - okay if NULL */
ed9eccbe8970f6 David Schleef      2008-11-04  2398  	return retval;
ed9eccbe8970f6 David Schleef      2008-11-04  2399  }
ed9eccbe8970f6 David Schleef      2008-11-04  2400  =


:::::: The code at line 2380 was first introduced by commit
:::::: e36472145aa706c186a6bb4f6419c613b0b1305c staging: comedi: use dma_mm=
ap_coherent for DMA-able buffer mmap

:::::: TO: Ian Abbott <abbotti@mev.co.uk>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1391211049971437263==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
J5rjSV3t28YqJ8SzQ/RCh3V8k/8Bg+JWen6RAQA=
--===============1391211049971437263==--

