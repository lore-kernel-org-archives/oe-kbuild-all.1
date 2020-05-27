Content-Type: multipart/mixed; boundary="===============5307125622386545062=="
MIME-Version: 1.0
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: kbuild-all@lists.01.org
Subject: Re: drivers/gpu/drm/r128/ati_pcigart.c:188:52: sparse: sparse: incorrect type in assignment (different base types)
Date: Wed, 27 May 2020 10:24:49 +0200
Message-ID: <CAKMK7uE3ROsQVP8Pyo7Owa=D0bbPgOocbMXu3PPhVVb7ZDgyKQ@mail.gmail.com>
In-Reply-To: <202005271520.RMhDeLDg%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5307125622386545062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 9:18 AM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Jani,
>
> First bad commit (maybe !=3D root cause):

This patch just moves a file, I guess that's a case the kbuild warning
tracking code doesn't (yet) handle?
-Daniel

>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   444fc5cde64330661bf59944c43844e7d4c2ccd8
> commit: be14312472e93d0c9c8c3ea8ef7d4eb59ed73f8f drm/r128: make ATI PCI G=
ART part of its only user, r128
> date:   6 months ago
> config: ia64-randconfig-s031-20200527 (attached as .config)
> compiler: ia64-linux-gcc (GCC) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.1-240-gf0fe1cd9-dirty
>         git checkout be14312472e93d0c9c8c3ea8ef7d4eb59ed73f8f
>         # save the attached .config to linux build tree
>         make W=3D1 C=3D1 ARCH=3Dia64 CF=3D'-fdiagnostic-prefix -D__CHECK_=
ENDIAN__'
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
>
> sparse warnings: (new ones prefixed by >>)
>
> >> drivers/gpu/drm/r128/ati_pcigart.c:188:52: sparse: sparse: incorrect t=
ype in assignment (different base types) @@     expected unsigned int [user=
type] @@     got restricted __le32 [usertype] @@
>    drivers/gpu/drm/r128/ati_pcigart.c:188:52: sparse:     expected unsign=
ed int [usertype]
>    drivers/gpu/drm/r128/ati_pcigart.c:188:52: sparse:     got restricted =
__le32 [usertype]
>    drivers/gpu/drm/r128/ati_pcigart.c:200:9: sparse: sparse: undefined id=
entifier 'wbinvd'
>
> vim +188 drivers/gpu/drm/r128/ati_pcigart.c
>
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16   99
> 55910517af381eb drivers/char/drm/ati_pcigart.c Dave Airlie            200=
7-07-11  100  int drm_ati_pcigart_init(struct drm_device *dev, struct drm_a=
ti_pcigart_info *gart_info)
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  101  {
> 5a7aad9a559a548 drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-12  102   struct drm_local_map *map =3D &gart_info->mapping;
> 55910517af381eb drivers/char/drm/ati_pcigart.c Dave Airlie            200=
7-07-11  103   struct drm_sg_mem *entry =3D dev->sg;
> f26c473cdf557ea drivers/char/drm/ati_pcigart.c Dave Airlie            200=
6-01-02  104   void *address =3D NULL;
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  105   unsigned long pages;
> 6abf66018f7fe23 drivers/gpu/drm/ati_pcigart.c  Dave Airlie            200=
9-02-26  106   u32 *pci_gart =3D NULL, page_base, gart_idx;
> b05c23851ab820b drivers/char/drm/ati_pcigart.c Dave Airlie            200=
8-03-17  107   dma_addr_t bus_address =3D 0;
> c27889ca3bb8bdc drivers/gpu/drm/ati_pcigart.c  Dan Carpenter          201=
8-12-17  108   int i, j, ret =3D -ENOMEM;
> d30333bbabb4a2c drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-15  109   int max_ati_pages, max_real_pages;
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  110
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  111   if (!entry) {
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  112           DRM_ERROR("no scatter/gather memory!\n");
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  113           goto done;
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  114   }
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  115
> b5e89ed53ed8d24 drivers/char/drm/ati_pcigart.c Dave Airlie            200=
5-09-25  116   if (gart_info->gart_table_location =3D=3D DRM_ATI_GART_MAIN)=
 {
> ea98a92ff18c03b drivers/char/drm/ati_pcigart.c Dave Airlie            200=
5-09-11  117           DRM_DEBUG("PCI: no table in VRAM: using normal RAM\n=
");
> ea98a92ff18c03b drivers/char/drm/ati_pcigart.c Dave Airlie            200=
5-09-11  118
> e6be8d9d17bd440 drivers/gpu/drm/ati_pcigart.c  Zhenyu Wang            201=
0-01-05  119           if (pci_set_dma_mask(dev->pdev, gart_info->table_mas=
k)) {
> e6be8d9d17bd440 drivers/gpu/drm/ati_pcigart.c  Zhenyu Wang            201=
0-01-05  120                   DRM_ERROR("fail to set dma mask to 0x%Lx\n",
> d7748bacbbee80b drivers/gpu/drm/ati_pcigart.c  Randy Dunlap           201=
0-02-02  121                             (unsigned long long)gart_info->tab=
le_mask);
> c27889ca3bb8bdc drivers/gpu/drm/ati_pcigart.c  Dan Carpenter          201=
8-12-17  122                   ret =3D -EFAULT;
> e6be8d9d17bd440 drivers/gpu/drm/ati_pcigart.c  Zhenyu Wang            201=
0-01-05  123                   goto done;
> e6be8d9d17bd440 drivers/gpu/drm/ati_pcigart.c  Zhenyu Wang            201=
0-01-05  124           }
> e6be8d9d17bd440 drivers/gpu/drm/ati_pcigart.c  Zhenyu Wang            201=
0-01-05  125
> b05c23851ab820b drivers/char/drm/ati_pcigart.c Dave Airlie            200=
8-03-17  126           ret =3D drm_ati_alloc_pcigart_table(dev, gart_info);
> b05c23851ab820b drivers/char/drm/ati_pcigart.c Dave Airlie            200=
8-03-17  127           if (ret) {
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  128                   DRM_ERROR("cannot allocate PCI GART page!\n"=
);
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  129                   goto done;
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  130           }
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  131
> 6abf66018f7fe23 drivers/gpu/drm/ati_pcigart.c  Dave Airlie            200=
9-02-26  132           pci_gart =3D gart_info->table_handle->vaddr;
> b05c23851ab820b drivers/char/drm/ati_pcigart.c Dave Airlie            200=
8-03-17  133           address =3D gart_info->table_handle->vaddr;
> b05c23851ab820b drivers/char/drm/ati_pcigart.c Dave Airlie            200=
8-03-17  134           bus_address =3D gart_info->table_handle->busaddr;
> b5e89ed53ed8d24 drivers/char/drm/ati_pcigart.c Dave Airlie            200=
5-09-25  135   } else {
> ea98a92ff18c03b drivers/char/drm/ati_pcigart.c Dave Airlie            200=
5-09-11  136           address =3D gart_info->addr;
> ea98a92ff18c03b drivers/char/drm/ati_pcigart.c Dave Airlie            200=
5-09-11  137           bus_address =3D gart_info->bus_addr;
> f67e74ca690d9f1 drivers/char/drm/ati_pcigart.c Andrew Morton          200=
8-03-28  138           DRM_DEBUG("PCI: Gart Table: VRAM %08LX mapped at %08=
lX\n",
> f67e74ca690d9f1 drivers/char/drm/ati_pcigart.c Andrew Morton          200=
8-03-28  139                     (unsigned long long)bus_address,
> f67e74ca690d9f1 drivers/char/drm/ati_pcigart.c Andrew Morton          200=
8-03-28  140                     (unsigned long)address);
> ea98a92ff18c03b drivers/char/drm/ati_pcigart.c Dave Airlie            200=
5-09-11  141   }
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  142
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  143
> d30333bbabb4a2c drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-15  144   max_ati_pages =3D (gart_info->table_size / sizeof(u32));
> d30333bbabb4a2c drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-15  145   max_real_pages =3D max_ati_pages / (PAGE_SIZE / ATI_PCIGART_=
PAGE_SIZE);
> d30333bbabb4a2c drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-15  146   pages =3D (entry->pages <=3D max_real_pages)
> d30333bbabb4a2c drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-15  147       ? entry->pages : max_real_pages;
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  148
> 5a7aad9a559a548 drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-12  149   if (gart_info->gart_table_location =3D=3D DRM_ATI_GART_MAIN)=
 {
> d30333bbabb4a2c drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-15  150           memset(pci_gart, 0, max_ati_pages * sizeof(u32));
> 5a7aad9a559a548 drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-12  151   } else {
> 6abf66018f7fe23 drivers/gpu/drm/ati_pcigart.c  Dave Airlie            200=
9-02-26  152           memset_io((void __iomem *)map->handle, 0, max_ati_pa=
ges * sizeof(u32));
> 5a7aad9a559a548 drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-12  153   }
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  154
> 5a7aad9a559a548 drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-12  155   gart_idx =3D 0;
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  156   for (i =3D 0; i < pages; i++) {
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  157           /* we need to support large memory configurations */
> 7ec700fcaf4f01a drivers/char/drm/ati_pcigart.c Dave Airlie            200=
8-06-19  158           entry->busaddr[i] =3D pci_map_page(dev->pdev, entry-=
>pagelist[i],
> 296c6ae0e9b5ced drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-12  159                                            0, PAGE_SIZE, PCI_D=
MA_BIDIRECTIONAL);
> a30f6fb7ce86275 drivers/gpu/drm/ati_pcigart.c  Benjamin Herrenschmidt 201=
0-08-10  160           if (pci_dma_mapping_error(dev->pdev, entry->busaddr[=
i])) {
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  161                   DRM_ERROR("unable to map PCIGART pages!\n");
> ea98a92ff18c03b drivers/char/drm/ati_pcigart.c Dave Airlie            200=
5-09-11  162                   drm_ati_pcigart_cleanup(dev, gart_info);
> f26c473cdf557ea drivers/char/drm/ati_pcigart.c Dave Airlie            200=
6-01-02  163                   address =3D NULL;
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  164                   bus_address =3D 0;
> c27889ca3bb8bdc drivers/gpu/drm/ati_pcigart.c  Dan Carpenter          201=
8-12-17  165                   ret =3D -ENOMEM;
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  166                   goto done;
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  167           }
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  168           page_base =3D (u32) entry->busaddr[i];
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  169
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  170           for (j =3D 0; j < (PAGE_SIZE / ATI_PCIGART_PAGE_SIZE=
); j++) {
> 03fda35d109b0a1 drivers/gpu/drm/ati_pcigart.c  Sam Ravnborg           201=
9-07-18  171                   u32 offset;
> 5a7aad9a559a548 drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-12  172                   u32 val;
> 5a7aad9a559a548 drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-12  173
> f2b04cd219e5c0f drivers/char/drm/ati_pcigart.c Dave Airlie            200=
7-05-08  174                   switch(gart_info->gart_reg_if) {
> f2b04cd219e5c0f drivers/char/drm/ati_pcigart.c Dave Airlie            200=
7-05-08  175                   case DRM_ATI_GART_IGP:
> 5a7aad9a559a548 drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-12  176                           val =3D page_base | 0xc;
> f2b04cd219e5c0f drivers/char/drm/ati_pcigart.c Dave Airlie            200=
7-05-08  177                           break;
> f2b04cd219e5c0f drivers/char/drm/ati_pcigart.c Dave Airlie            200=
7-05-08  178                   case DRM_ATI_GART_PCIE:
> 5a7aad9a559a548 drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-12  179                           val =3D (page_base >> 8) | 0xc;
> f2b04cd219e5c0f drivers/char/drm/ati_pcigart.c Dave Airlie            200=
7-05-08  180                           break;
> f2b04cd219e5c0f drivers/char/drm/ati_pcigart.c Dave Airlie            200=
7-05-08  181                   default:
> f2b04cd219e5c0f drivers/char/drm/ati_pcigart.c Dave Airlie            200=
7-05-08  182                   case DRM_ATI_GART_PCI:
> 5a7aad9a559a548 drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-12  183                           val =3D page_base;
> f2b04cd219e5c0f drivers/char/drm/ati_pcigart.c Dave Airlie            200=
7-05-08  184                           break;
> f2b04cd219e5c0f drivers/char/drm/ati_pcigart.c Dave Airlie            200=
7-05-08  185                   }
> 5a7aad9a559a548 drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-12  186                   if (gart_info->gart_table_location =3D=3D
> 03fda35d109b0a1 drivers/gpu/drm/ati_pcigart.c  Sam Ravnborg           201=
9-07-18  187                       DRM_ATI_GART_MAIN) {
> 5a7aad9a559a548 drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-12 @188                           pci_gart[gart_idx] =3D cpu_to_le32(v=
al);
> 03fda35d109b0a1 drivers/gpu/drm/ati_pcigart.c  Sam Ravnborg           201=
9-07-18  189                   } else {
> 03fda35d109b0a1 drivers/gpu/drm/ati_pcigart.c  Sam Ravnborg           201=
9-07-18  190                           offset =3D gart_idx * sizeof(u32);
> 03fda35d109b0a1 drivers/gpu/drm/ati_pcigart.c  Sam Ravnborg           201=
9-07-18  191                           writel(val, (void __iomem *)map->han=
dle + offset);
> 03fda35d109b0a1 drivers/gpu/drm/ati_pcigart.c  Sam Ravnborg           201=
9-07-18  192                   }
> 5a7aad9a559a548 drivers/gpu/drm/ati_pcigart.c  David Miller           200=
9-02-12  193                   gart_idx++;
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  194                   page_base +=3D ATI_PCIGART_PAGE_SIZE;
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  195           }
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  196   }
> c27889ca3bb8bdc drivers/gpu/drm/ati_pcigart.c  Dan Carpenter          201=
8-12-17  197   ret =3D 0;
> ^1da177e4c3f415 drivers/char/drm/ati_pcigart.c Linus Torvalds         200=
5-04-16  198
>
> :::::: The code at line 188 was first introduced by commit
> :::::: 5a7aad9a559a5488cbef7aa3d4d96fc28220b8ae drm: ati_pcigart: Do not =
access I/O MEM space using pointer derefs.
>
> :::::: TO: David Miller <davem@davemloft.net>
> :::::: CC: Dave Airlie <airlied@redhat.com>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org



-- =

Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
--===============5307125622386545062==--

