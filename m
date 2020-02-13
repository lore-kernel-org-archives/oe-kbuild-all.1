Content-Type: multipart/mixed; boundary="===============3725006833335278466=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] block: rename 'q->debugfs_dir' in blk_unregister_queue()
Date: Thu, 13 Feb 2020 12:38:02 +0800
Message-ID: <202002131252.CCCKxfBv%lkp@intel.com>
In-Reply-To: <20200211035137.19454-1-yukuai3@huawei.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3725006833335278466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi yu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on block/for-next]
[also build test ERROR on v5.6-rc1 next-20200212]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/yu-kuai/block-rename-q-deb=
ugfs_dir-in-blk_unregister_queue/20200213-091022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.g=
it for-next
config: um-x86_64_defconfig (attached as .config)
compiler: gcc-7 (Debian 7.5.0-4) 7.5.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=3Dum SUBARCH=3Dx86_64

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   block/blk-sysfs.c: In function 'blk_prepare_release_queue':
>> block/blk-sysfs.c:1030:22: error: 'struct request_queue' has no member n=
amed 'debugfs_dir'
     if (IS_ERR_OR_NULL(q->debugfs_dir))
                         ^~
   block/blk-sysfs.c:1031:11: error: 'struct request_queue' has no member n=
amed 'debugfs_dir'
      return q->debugfs_dir;
              ^~
>> block/blk-sysfs.c:1035:24: error: 'blk_debugfs_root' undeclared (first u=
se in this function); did you mean 'blk_mq_debugfs_attr'?
      new =3D debugfs_rename(blk_debugfs_root, q->debugfs_dir,
                           ^~~~~~~~~~~~~~~~
                           blk_mq_debugfs_attr
   block/blk-sysfs.c:1035:24: note: each undeclared identifier is reported =
only once for each function it appears in
   block/blk-sysfs.c:1035:43: error: 'struct request_queue' has no member n=
amed 'debugfs_dir'
      new =3D debugfs_rename(blk_debugfs_root, q->debugfs_dir,
                                              ^~
   block/blk-sysfs.c: In function 'blk_unregister_queue':
   block/blk-sysfs.c:1070:3: error: 'struct request_queue' has no member na=
med 'debugfs_dir'
     q->debugfs_dir =3D blk_prepare_release_queue(q);
      ^~

vim +1030 block/blk-sysfs.c

  1014	=

  1015	/*
  1016	 * blk_prepare_release_queue - rename q->debugfs_dir
  1017	 * @q: request_queue of which the dir to be renamed belong to.
  1018	 *
  1019	 * Because the final release of request_queue is in a workqueue, the
  1020	 * cleanup might not been finished yet while the same device start to
  1021	 * create. It's not correct if q->debugfs_dir still exist while tryi=
ng
  1022	 * to create a new one.
  1023	 */
  1024	static struct dentry *blk_prepare_release_queue(struct request_queue=
 *q)
  1025	{
  1026		struct dentry *new =3D NULL;
  1027		char name[DNAME_INLINE_LEN];
  1028		int i =3D 0;
  1029	=

> 1030		if (IS_ERR_OR_NULL(q->debugfs_dir))
  1031			return q->debugfs_dir;
  1032	=

  1033		while (new =3D=3D NULL) {
  1034			sprintf(name, "ready_to_remove_%d", i++);
> 1035			new =3D debugfs_rename(blk_debugfs_root, q->debugfs_dir,
  1036					     blk_debugfs_root, name);
  1037		}
  1038	=

  1039		return new;
  1040	}
  1041	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3725006833335278466==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3725006833335278466==--

