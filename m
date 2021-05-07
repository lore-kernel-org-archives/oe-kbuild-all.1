Content-Type: multipart/mixed; boundary="===============4031587955258146746=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v5] mm: slub: move sysfs slab alloc/free interfaces to debugfs
Date: Fri, 07 May 2021 08:21:20 +0300
Message-ID: <202105070253.GuJL1RPR-lkp@intel.com>
In-Reply-To: <1620296523-21922-1-git-send-email-faiyazm@codeaurora.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4031587955258146746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Faiyaz,

url:    https://github.com/0day-ci/linux/commits/Faiyaz-Mohammed/mm-slub-mo=
ve-sysfs-slab-alloc-free-interfaces-to-debugfs/20210506-182420
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
8404c9fbc84b741f66cff7d4934a25dd2c344452
config: i386-randconfig-m021-20210506 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/slub.c:5891 slab_debugfs_start() warn: possible memory leak of 'spos'

vim +/spos +5891 mm/slub.c

88e180b99466c1 Faiyaz Mohammed 2021-05-06  5877  static void *slab_debugfs_=
start(struct seq_file *seq, loff_t *ppos)
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5878  {
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5879  	struct kmem_cache_node *n;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5880  	struct kmem_cache *s;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5881  	enum track_item alloc;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5882  	int node;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5883  	loff_t *spos =3D kmalloc(=
sizeof(loff_t), GFP_KERNEL);
                                                        ^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Generally avoid putting functions which can fail in the declaration
block.  Allocations inside the declaration block are a tiny percent of
declarations over all but they are an outsize source of static checker
bugs.

88e180b99466c1 Faiyaz Mohammed 2021-05-06  5884  =

88e180b99466c1 Faiyaz Mohammed 2021-05-06  5885  	s =3D seq->file->f_inode-=
>i_private;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5886  =

88e180b99466c1 Faiyaz Mohammed 2021-05-06  5887  	if (!spos)
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5888  		return NULL;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5889  =

88e180b99466c1 Faiyaz Mohammed 2021-05-06  5890  	if (!(s->flags & SLAB_STO=
RE_USER))
88e180b99466c1 Faiyaz Mohammed 2021-05-06 @5891  		return ERR_PTR(-EOPNOTSU=
PP);

"spos" is leaked.

88e180b99466c1 Faiyaz Mohammed 2021-05-06  5892  =

88e180b99466c1 Faiyaz Mohammed 2021-05-06  5893  	if (*ppos =3D=3D 0) {
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5894  =

88e180b99466c1 Faiyaz Mohammed 2021-05-06  5895  		t.count =3D 0;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5896  		t.max =3D 0;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5897  		t.loc =3D NULL;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5898  		if (strcmp(seq->file->f_=
path.dentry->d_name.name, "alloc_traces") =3D=3D 0)
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5899  			alloc =3D  TRACK_ALLOC;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5900  		else
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5901  			alloc =3D  TRACK_FREE;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5902  =

88e180b99466c1 Faiyaz Mohammed 2021-05-06  5903  		if (!alloc_loc_track(&t,=
 PAGE_SIZE / sizeof(struct location),
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5904  			     GFP_KERNEL)) {
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5905  			seq_puts(seq, "Out of m=
emory\n");
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5906  			return ERR_PTR(-ENOMEM);
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5907  		}
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5908  		/* Push back cpu slabs */
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5909  		flush_all(s);
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5910  =

88e180b99466c1 Faiyaz Mohammed 2021-05-06  5911  		for_each_kmem_cache_node=
(s, node, n) {
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5912  			unsigned long flags;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5913  			struct page *page;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5914  =

88e180b99466c1 Faiyaz Mohammed 2021-05-06  5915  			if (!atomic_long_read(&=
n->nr_slabs))
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5916  				continue;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5917  =

88e180b99466c1 Faiyaz Mohammed 2021-05-06  5918  			spin_lock_irqsave(&n->l=
ist_lock, flags);
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5919  			list_for_each_entry(pag=
e, &n->partial, slab_list)
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5920  				process_slab(&t, s, pa=
ge, alloc);
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5921  			list_for_each_entry(pag=
e, &n->full, slab_list)
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5922  				process_slab(&t, s, pa=
ge, alloc);
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5923  			spin_unlock_irqrestore(=
&n->list_lock, flags);
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5924  		}
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5925  	}
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5926  =

88e180b99466c1 Faiyaz Mohammed 2021-05-06  5927  	if (*ppos < t.count) {
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5928  		*spos =3D *ppos;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5929  		return spos;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5930  	}
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5931  =

88e180b99466c1 Faiyaz Mohammed 2021-05-06  5932  	kfree(spos);
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5933  	return NULL;
88e180b99466c1 Faiyaz Mohammed 2021-05-06  5934  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============4031587955258146746==--

