Content-Type: multipart/mixed; boundary="===============5462262102065719285=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: [mlankhorst:ttm 3/8] drivers/gpu/drm/i915/selftests/igt_mmap.c:45 igt_mmap_offset() error: uninitialized symbol 'addr'.
Date: Wed, 26 May 2021 07:51:44 +0300
Message-ID: <202105260430.exZhuQnQ-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5462262102065719285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://people.freedesktop.org/~mlankhorst/linux ttm
head:   2fd51ce6e707358af329fa2d4a91ab7dd7b84c5e
commit: cbea27e180f0edbb6eb5c4f2cb24f18ba8f78352 [3/8] drm/i915: Use ttm mm=
ap handling for ttm bo's.
config: i386-randconfig-m021-20210525 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/selftests/igt_mmap.c:45 igt_mmap_offset() error: unini=
tialized symbol 'addr'.

vim +/addr +45 drivers/gpu/drm/i915/selftests/igt_mmap.c

cbea27e180f0ed Maarten Lankhorst 2021-05-05  12  unsigned long igt_mmap_off=
set(struct drm_i915_private *i915,
cbea27e180f0ed Maarten Lankhorst 2021-05-05  13  			      u64 offset,
cbea27e180f0ed Maarten Lankhorst 2021-05-05  14  			      unsigned long siz=
e,
6fedafacae1b95 Chris Wilson      2019-11-07  15  			      unsigned long pro=
t,
6fedafacae1b95 Chris Wilson      2019-11-07  16  			      unsigned long fla=
gs)
6fedafacae1b95 Chris Wilson      2019-11-07  17  {
cbea27e180f0ed Maarten Lankhorst 2021-05-05  18  	struct drm_vma_offset_nod=
e *node;
6fedafacae1b95 Chris Wilson      2019-11-07  19  	struct file *file;
cbea27e180f0ed Maarten Lankhorst 2021-05-05  20  	unsigned long addr;
                                                                      ^^^^

6fedafacae1b95 Chris Wilson      2019-11-07  21  	int err;
6fedafacae1b95 Chris Wilson      2019-11-07  22  =

cbea27e180f0ed Maarten Lankhorst 2021-05-05  23  	/* no need to refcount, w=
e own this object */
cbea27e180f0ed Maarten Lankhorst 2021-05-05  24  	drm_vma_offset_lock_looku=
p(i915->drm.vma_offset_manager);
cbea27e180f0ed Maarten Lankhorst 2021-05-05  25  	node =3D drm_vma_offset_e=
xact_lookup_locked(i915->drm.vma_offset_manager,
cbea27e180f0ed Maarten Lankhorst 2021-05-05  26  						  offset / PAGE_SIZE=
, size / PAGE_SIZE);
cbea27e180f0ed Maarten Lankhorst 2021-05-05  27  	drm_vma_offset_unlock_loo=
kup(i915->drm.vma_offset_manager);
cbea27e180f0ed Maarten Lankhorst 2021-05-05  28  =

cbea27e180f0ed Maarten Lankhorst 2021-05-05  29  	if (GEM_WARN_ON(!node)) {
cbea27e180f0ed Maarten Lankhorst 2021-05-05  30  		pr_info("Failed to looku=
p %Lx\n", offset);
cbea27e180f0ed Maarten Lankhorst 2021-05-05  31  		return -ENOENT;
cbea27e180f0ed Maarten Lankhorst 2021-05-05  32  	}
cbea27e180f0ed Maarten Lankhorst 2021-05-05  33  =

6fedafacae1b95 Chris Wilson      2019-11-07  34  	/* Pretend to open("/dev/=
dri/card0") */
6fedafacae1b95 Chris Wilson      2019-11-07  35  	file =3D mock_drm_getfile=
(i915->drm.primary, O_RDWR);
6fedafacae1b95 Chris Wilson      2019-11-07  36  	if (IS_ERR(file))
6fedafacae1b95 Chris Wilson      2019-11-07  37  		return PTR_ERR(file);
6fedafacae1b95 Chris Wilson      2019-11-07  38  =

6fedafacae1b95 Chris Wilson      2019-11-07  39  	err =3D drm_vma_node_allo=
w(node, file->private_data);
6fedafacae1b95 Chris Wilson      2019-11-07  40  	if (err) {
6fedafacae1b95 Chris Wilson      2019-11-07  41  		addr =3D err;
6fedafacae1b95 Chris Wilson      2019-11-07  42  		goto out_file;
6fedafacae1b95 Chris Wilson      2019-11-07  43  	}
6fedafacae1b95 Chris Wilson      2019-11-07  44  =

6fedafacae1b95 Chris Wilson      2019-11-07 @45  	addr =3D vm_mmap(file, ad=
dr, drm_vma_node_size(node) << PAGE_SHIFT,
                                                                           =
  ^^^^
Uninitialized here.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============5462262102065719285==--

