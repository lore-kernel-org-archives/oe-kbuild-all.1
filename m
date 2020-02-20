Content-Type: multipart/mixed; boundary="===============8575440208553802680=="
MIME-Version: 1.0
From: Julia Lawall <julia.lawall@inria.fr>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] proc: faster open/read/close with "permanent" files (fwd)
Date: Thu, 20 Feb 2020 15:47:56 +0100
Message-ID: <alpine.DEB.2.21.2002201546100.2210@hadrien>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8575440208553802680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

It looks like an unlock may be needed o lines 721 and 732.

julia

---------- Forwarded message ----------
Hi Alexey,

I love your patch! Perhaps something to improve:

[auto build test WARNING on jeyu/modules-next]
[also build test WARNING on linus/master v5.6-rc2 next-20200218]
[cannot apply to linux/master]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Alexey-Dobriyan/proc-faste=
r-open-read-close-with-permanent-files/20200218-231203
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux.git modu=
les-next
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>

>> fs/proc/generic.c:721:2-8: preceding lock on line 706
   fs/proc/generic.c:732:4-10: preceding lock on line 706
   fs/proc/generic.c:732:4-10: preceding lock on line 748

# https://github.com/0day-ci/linux/commit/3cd4ad42ca7c52d1513e7ba9f08a06197=
a7380c8
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 3cd4ad42ca7c52d1513e7ba9f08a06197a7380c8
vim +721 fs/proc/generic.c

8ce584c7416d8a Al Viro         2013-03-30  699
8ce584c7416d8a Al Viro         2013-03-30  700  int remove_proc_subtree(con=
st char *name, struct proc_dir_entry *parent)
8ce584c7416d8a Al Viro         2013-03-30  701  {
8ce584c7416d8a Al Viro         2013-03-30  702  	struct proc_dir_entry *roo=
t =3D NULL, *de, *next;
8ce584c7416d8a Al Viro         2013-03-30  703  	const char *fn =3D name;
8ce584c7416d8a Al Viro         2013-03-30  704  	unsigned int len;
8ce584c7416d8a Al Viro         2013-03-30  705
ecf1a3dfff22bd Waiman Long     2015-09-09 @706  	write_lock(&proc_subdir_lo=
ck);
8ce584c7416d8a Al Viro         2013-03-30  707  	if (__xlate_proc_name(name=
, &parent, &fn) !=3D 0) {
ecf1a3dfff22bd Waiman Long     2015-09-09  708  		write_unlock(&proc_subdir=
_lock);
8ce584c7416d8a Al Viro         2013-03-30  709  		return -ENOENT;
8ce584c7416d8a Al Viro         2013-03-30  710  	}
8ce584c7416d8a Al Viro         2013-03-30  711  	len =3D strlen(fn);
8ce584c7416d8a Al Viro         2013-03-30  712
710585d4922fd3 Nicolas Dichtel 2014-12-10  713  	root =3D pde_subdir_find(p=
arent, fn, len);
8ce584c7416d8a Al Viro         2013-03-30  714  	if (!root) {
ecf1a3dfff22bd Waiman Long     2015-09-09  715  		write_unlock(&proc_subdir=
_lock);
8ce584c7416d8a Al Viro         2013-03-30  716  		return -ENOENT;
8ce584c7416d8a Al Viro         2013-03-30  717  	}
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  718  	if (unlikely(pde_is_perman=
ent(root))) {
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  719  		WARN(1, "removing permane=
nt /proc entry '%s/%s'",
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  720  			root->parent->name, root=
->name);
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16 @721  		return -EINVAL;
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  722  	}
4f1134370a29a5 Alexey Dobriyan 2018-04-10  723  	rb_erase(&root->subdir_nod=
e, &parent->subdir);
710585d4922fd3 Nicolas Dichtel 2014-12-10  724
8ce584c7416d8a Al Viro         2013-03-30  725  	de =3D root;
8ce584c7416d8a Al Viro         2013-03-30  726  	while (1) {
710585d4922fd3 Nicolas Dichtel 2014-12-10  727  		next =3D pde_subdir_first=
(de);
8ce584c7416d8a Al Viro         2013-03-30  728  		if (next) {
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  729  			if (unlikely(pde_is_perm=
anent(root))) {
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  730  				WARN(1, "removing perma=
nent /proc entry '%s/%s'",
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  731  					next->parent->name, ne=
xt->name);
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  732  				return -EINVAL;
3cd4ad42ca7c52 Alexey Dobriyan 2020-02-16  733  			}
4f1134370a29a5 Alexey Dobriyan 2018-04-10  734  			rb_erase(&next->subdir_n=
ode, &de->subdir);
8ce584c7416d8a Al Viro         2013-03-30  735  			de =3D next;
8ce584c7416d8a Al Viro         2013-03-30  736  			continue;
8ce584c7416d8a Al Viro         2013-03-30  737  		}
8ce584c7416d8a Al Viro         2013-03-30  738  		next =3D de->parent;
8ce584c7416d8a Al Viro         2013-03-30  739  		if (S_ISDIR(de->mode))
8ce584c7416d8a Al Viro         2013-03-30  740  			next->nlink--;
e06689bf57017a Alexey Dobriyan 2019-12-04  741  		write_unlock(&proc_subdir=
_lock);
e06689bf57017a Alexey Dobriyan 2019-12-04  742
e06689bf57017a Alexey Dobriyan 2019-12-04  743  		proc_entry_rundown(de);
8ce584c7416d8a Al Viro         2013-03-30  744  		if (de =3D=3D root)
8ce584c7416d8a Al Viro         2013-03-30  745  			break;
8ce584c7416d8a Al Viro         2013-03-30  746  		pde_put(de);
8ce584c7416d8a Al Viro         2013-03-30  747
ecf1a3dfff22bd Waiman Long     2015-09-09  748  		write_lock(&proc_subdir_l=
ock);
8ce584c7416d8a Al Viro         2013-03-30  749  		de =3D next;
8ce584c7416d8a Al Viro         2013-03-30  750  	}
8ce584c7416d8a Al Viro         2013-03-30  751  	pde_put(root);
8ce584c7416d8a Al Viro         2013-03-30  752  	return 0;
8ce584c7416d8a Al Viro         2013-03-30  753  }
8ce584c7416d8a Al Viro         2013-03-30  754  EXPORT_SYMBOL(remove_proc_s=
ubtree);
4a520d2769beb7 David Howells   2013-04-12  755

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8575440208553802680==--

