Content-Type: multipart/mixed; boundary="===============8046440237414588712=="
MIME-Version: 1.0
From: Faiyaz Mohammed <faiyazm@codeaurora.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v5] mm: slub: move sysfs slab alloc/free interfaces to debugfs
Date: Tue, 18 May 2021 18:19:24 +0530
Message-ID: <b42b02d6-08f4-01b1-6ab3-72237ef58034@codeaurora.org>
In-Reply-To: <202105070253.GuJL1RPR-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8046440237414588712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Updated in the patch,
https://lore.kernel.org/linux-mm/1621341949-26762-1-git-send-email-faiyazm(=
a)codeaurora.org/T/#u

Thanks and regards,
Mohammed Faiyaz

On 5/7/2021 10:51 AM, Dan Carpenter wrote:
> Hi Faiyaz,
> =

> url:    https://github.com/0day-ci/linux/commits/Faiyaz-Mohammed/mm-slub-=
move-sysfs-slab-alloc-free-interfaces-to-debugfs/20210506-182420
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t 8404c9fbc84b741f66cff7d4934a25dd2c344452
> config: i386-randconfig-m021-20210506 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> smatch warnings:
> mm/slub.c:5891 slab_debugfs_start() warn: possible memory leak of 'spos'
> =

> vim +/spos +5891 mm/slub.c
> =

> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5877  static void *slab_debugf=
s_start(struct seq_file *seq, loff_t *ppos)
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5878  {
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5879  	struct kmem_cache_node =
*n;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5880  	struct kmem_cache *s;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5881  	enum track_item alloc;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5882  	int node;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5883  	loff_t *spos =3D kmallo=
c(sizeof(loff_t), GFP_KERNEL);
>                                                         ^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Generally avoid putting functions which can fail in the declaration
> block.  Allocations inside the declaration block are a tiny percent of
> declarations over all but they are an outsize source of static checker
> bugs.
> =

> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5884  =

> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5885  	s =3D seq->file->f_inod=
e->i_private;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5886  =

> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5887  	if (!spos)
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5888  		return NULL;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5889  =

> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5890  	if (!(s->flags & SLAB_S=
TORE_USER))
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06 @5891  		return ERR_PTR(-EOPNOT=
SUPP);
> =

> "spos" is leaked.
> =

> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5892  =

> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5893  	if (*ppos =3D=3D 0) {
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5894  =

> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5895  		t.count =3D 0;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5896  		t.max =3D 0;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5897  		t.loc =3D NULL;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5898  		if (strcmp(seq->file->=
f_path.dentry->d_name.name, "alloc_traces") =3D=3D 0)
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5899  			alloc =3D  TRACK_ALLO=
C;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5900  		else
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5901  			alloc =3D  TRACK_FREE;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5902  =

> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5903  		if (!alloc_loc_track(&=
t, PAGE_SIZE / sizeof(struct location),
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5904  			     GFP_KERNEL)) {
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5905  			seq_puts(seq, "Out of=
 memory\n");
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5906  			return ERR_PTR(-ENOME=
M);
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5907  		}
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5908  		/* Push back cpu slabs=
 */
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5909  		flush_all(s);
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5910  =

> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5911  		for_each_kmem_cache_no=
de(s, node, n) {
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5912  			unsigned long flags;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5913  			struct page *page;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5914  =

> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5915  			if (!atomic_long_read=
(&n->nr_slabs))
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5916  				continue;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5917  =

> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5918  			spin_lock_irqsave(&n-=
>list_lock, flags);
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5919  			list_for_each_entry(p=
age, &n->partial, slab_list)
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5920  				process_slab(&t, s, =
page, alloc);
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5921  			list_for_each_entry(p=
age, &n->full, slab_list)
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5922  				process_slab(&t, s, =
page, alloc);
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5923  			spin_unlock_irqrestor=
e(&n->list_lock, flags);
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5924  		}
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5925  	}
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5926  =

> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5927  	if (*ppos < t.count) {
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5928  		*spos =3D *ppos;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5929  		return spos;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5930  	}
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5931  =

> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5932  	kfree(spos);
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5933  	return NULL;
> 88e180b99466c1 Faiyaz Mohammed 2021-05-06  5934  }
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20
--===============8046440237414588712==--

