Content-Type: multipart/mixed; boundary="===============2986486530566503689=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [rhvgoyal:virtiofs-dax-5.6 13/26] fs/fuse/file.c:2928:16: sparse: sparse: incorrect type in return expression (different base types)
Date: Fri, 14 Feb 2020 19:55:04 +0800
Message-ID: <202002141924.20GgBf5A%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2986486530566503689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/rhvgoyal/linux virtiofs-dax-5.6
head:   b38ced151aa1f5152141e7f9e254ffa85e774dcd
commit: a10bc0adb518fcb63789233d893f926cbd86e016 [13/26] fuse, dax: add DAX=
 mmap support
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-166-g7e4a5b6f-dirty
        git checkout a10bc0adb518fcb63789233d893f926cbd86e016
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/fuse/file.c:2928:16: sparse: sparse: incorrect type in return express=
ion (different base types)
   fs/fuse/file.c:2928:16: sparse:    expected int
   fs/fuse/file.c:2928:16: sparse:    got restricted vm_fault_t [assigned] =
[usertype] ret
   fs/fuse/file.c:2933:32: sparse: sparse: incorrect type in return express=
ion (different base types)
   fs/fuse/file.c:2933:32: sparse:    expected restricted vm_fault_t
   fs/fuse/file.c:2933:32: sparse:    got int
   fs/fuse/file.c:2940:32: sparse: sparse: incorrect type in return express=
ion (different base types)
   fs/fuse/file.c:2940:32: sparse:    expected restricted vm_fault_t
   fs/fuse/file.c:2940:32: sparse:    got int
   fs/fuse/file.c:2945:32: sparse: sparse: incorrect type in return express=
ion (different base types)
   fs/fuse/file.c:2945:32: sparse:    expected restricted vm_fault_t
   fs/fuse/file.c:2945:32: sparse:    got int
   fs/fuse/file.c:2950:32: sparse: sparse: incorrect type in return express=
ion (different base types)
   fs/fuse/file.c:2950:32: sparse:    expected restricted vm_fault_t
   fs/fuse/file.c:2950:32: sparse:    got int

vim +2928 fs/fuse/file.c

  2906	=

  2907	static int __fuse_dax_fault(struct vm_fault *vmf, enum page_entry_si=
ze pe_size,
  2908				    bool write)
  2909	{
  2910		vm_fault_t ret;
  2911		struct inode *inode =3D file_inode(vmf->vma->vm_file);
  2912		struct super_block *sb =3D inode->i_sb;
  2913		pfn_t pfn;
  2914	=

  2915		if (write)
  2916			sb_start_pagefault(sb);
  2917	=

  2918		/* TODO inode semaphore to protect faults vs truncate */
  2919	=

  2920		ret =3D dax_iomap_fault(vmf, pe_size, &pfn, NULL, &fuse_iomap_ops);
  2921	=

  2922		if (ret & VM_FAULT_NEEDDSYNC)
  2923			ret =3D dax_finish_sync_fault(vmf, pe_size, pfn);
  2924	=

  2925		if (write)
  2926			sb_end_pagefault(sb);
  2927	=

> 2928		return ret;
  2929	}
  2930	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2986486530566503689==--

