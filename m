Content-Type: multipart/mixed; boundary="===============5636935522556954742=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [rhvgoyal:virtiofs-dax-5.6 17/26] fs/fuse/file.c:3044:21: sparse: sparse: incorrect type in assignment (different base types)
Date: Sat, 15 Feb 2020 04:58:54 +0800
Message-ID: <202002150404.1cJOwDrt%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5636935522556954742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/rhvgoyal/linux virtiofs-dax-5.6
head:   b38ced151aa1f5152141e7f9e254ffa85e774dcd
commit: 94ac6ca060984a6baf3d9c3b847923a57aa7dcc8 [17/26] fuse: Add logic to=
 free up a memory range
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-166-g7e4a5b6f-dirty
        git checkout 94ac6ca060984a6baf3d9c3b847923a57aa7dcc8
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/fuse/file.c:3044:21: sparse: sparse: incorrect type in assignment (di=
fferent base types)
   fs/fuse/file.c:3044:21: sparse:    expected restricted vm_fault_t [usert=
ype] ret
   fs/fuse/file.c:3044:21: sparse:    got int
   fs/fuse/file.c:3074:16: sparse: sparse: incorrect type in return express=
ion (different base types)
   fs/fuse/file.c:3074:16: sparse:    expected int
   fs/fuse/file.c:3074:16: sparse:    got restricted vm_fault_t [assigned] =
[usertype] ret
   fs/fuse/file.c:3079:32: sparse: sparse: incorrect type in return express=
ion (different base types)
   fs/fuse/file.c:3079:32: sparse:    expected restricted vm_fault_t
   fs/fuse/file.c:3079:32: sparse:    got int
   fs/fuse/file.c:3086:32: sparse: sparse: incorrect type in return express=
ion (different base types)
   fs/fuse/file.c:3086:32: sparse:    expected restricted vm_fault_t
   fs/fuse/file.c:3086:32: sparse:    got int
   fs/fuse/file.c:3091:32: sparse: sparse: incorrect type in return express=
ion (different base types)
   fs/fuse/file.c:3091:32: sparse:    expected restricted vm_fault_t
   fs/fuse/file.c:3091:32: sparse:    got int
   fs/fuse/file.c:3096:32: sparse: sparse: incorrect type in return express=
ion (different base types)
   fs/fuse/file.c:3096:32: sparse:    expected restricted vm_fault_t
   fs/fuse/file.c:3096:32: sparse:    got int

vim +3044 fs/fuse/file.c

  3027	=

  3028	static int __fuse_dax_fault(struct vm_fault *vmf, enum page_entry_si=
ze pe_size,
  3029				    bool write)
  3030	{
  3031		vm_fault_t ret;
  3032		struct inode *inode =3D file_inode(vmf->vma->vm_file);
  3033		struct super_block *sb =3D inode->i_sb;
  3034		pfn_t pfn;
  3035		int error =3D 0;
  3036		struct fuse_conn *fc =3D get_fuse_conn(inode);
  3037		bool retry =3D false;
  3038	=

  3039		if (write)
  3040			sb_start_pagefault(sb);
  3041	=

  3042	retry:
  3043		if (retry && !(fc->nr_free_ranges > 0)) {
> 3044			ret =3D -EINTR;
  3045			if (wait_event_killable_exclusive(fc->dax_range_waitq,
  3046						(fc->nr_free_ranges > 0)))
  3047				goto out;
  3048		}
  3049	=

  3050		/*
  3051		 * We need to serialize against not only truncate but also against
  3052		 * fuse dax memory range reclaim. While a range is being reclaimed,
  3053		 * we do not want any read/write/mmap to make progress and try
  3054		 * to populate page cache or access memory we are trying to free.
  3055		 */
  3056		down_read(&get_fuse_inode(inode)->i_mmap_sem);
  3057		ret =3D dax_iomap_fault(vmf, pe_size, &pfn, &error, &fuse_iomap_ops=
);
  3058		if ((ret & VM_FAULT_ERROR) && error =3D=3D -ENOSPC) {
  3059			error =3D 0;
  3060			retry =3D true;
  3061			up_read(&get_fuse_inode(inode)->i_mmap_sem);
  3062			goto retry;
  3063		}
  3064	=

  3065		if (ret & VM_FAULT_NEEDDSYNC)
  3066			ret =3D dax_finish_sync_fault(vmf, pe_size, pfn);
  3067	=

  3068		up_read(&get_fuse_inode(inode)->i_mmap_sem);
  3069	=

  3070	out:
  3071		if (write)
  3072			sb_end_pagefault(sb);
  3073	=

  3074		return ret;
  3075	}
  3076	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5636935522556954742==--

