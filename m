Content-Type: multipart/mixed; boundary="===============7448186539835800906=="
MIME-Version: 1.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [mlankhorst:locking-rework 61/63] drivers/gpu/drm/i915/gem/i915_gem_userptr.c:315 i915_gem_object_userptr_submit_init() error: double locked 'i915->mm.notifier_lock' (orig line 270)
Date: Tue, 13 Oct 2020 16:25:34 +0200
Message-ID: <a1d29b3a-579a-8819-059d-5c1963fab678@linux.intel.com>
In-Reply-To: <20201013122741.GT1042@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7448186539835800906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Op 13-10-2020 om 14:27 schreef Dan Carpenter:
> tree:   git://people.freedesktop.org/~mlankhorst/linux locking-rework
> head:   a7bb9c136fffddfb2e1c5132deb1682c0d1f9fc9
> commit: d2902d100d21d7af1cea25975007e7ac4e03ab4c [61/63] drm/i915: Keep u=
serpointer bindings if seqcount is unchanged
> config: i386-randconfig-m021-20201013 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> New smatch warnings:
> drivers/gpu/drm/i915/gem/i915_gem_userptr.c:315 i915_gem_object_userptr_s=
ubmit_init() error: double locked 'i915->mm.notifier_lock' (orig line 270)
>
> vim +315 drivers/gpu/drm/i915/gem/i915_gem_userptr.c
>
> f53270c47078c8 Maarten Lankhorst 2020-07-10  250  int i915_gem_object_use=
rptr_submit_init(struct drm_i915_gem_object *obj)
> f53270c47078c8 Maarten Lankhorst 2020-07-10  251  {
> f53270c47078c8 Maarten Lankhorst 2020-07-10  252  	struct drm_i915_privat=
e *i915 =3D to_i915(obj->base.dev);
> f53270c47078c8 Maarten Lankhorst 2020-07-10  253  	const unsigned long nu=
m_pages =3D obj->base.size >> PAGE_SHIFT;
> f53270c47078c8 Maarten Lankhorst 2020-07-10  254  	struct page **pvec;
> f53270c47078c8 Maarten Lankhorst 2020-07-10  255  	unsigned int gup_flags=
 =3D 0;
> f53270c47078c8 Maarten Lankhorst 2020-07-10  256  	unsigned long notifier=
_seq;
> f53270c47078c8 Maarten Lankhorst 2020-07-10  257  	int pinned, ret;
> f53270c47078c8 Maarten Lankhorst 2020-07-10  258  =

> f53270c47078c8 Maarten Lankhorst 2020-07-10  259  	if (obj->userptr.notif=
ier.mm !=3D current->mm)
> f53270c47078c8 Maarten Lankhorst 2020-07-10  260  		return -EFAULT;
> f53270c47078c8 Maarten Lankhorst 2020-07-10  261  =

> f53270c47078c8 Maarten Lankhorst 2020-07-10  262  	ret =3D i915_gem_objec=
t_lock_interruptible(obj, NULL);
> f53270c47078c8 Maarten Lankhorst 2020-07-10  263  	if (ret)
> f53270c47078c8 Maarten Lankhorst 2020-07-10  264  		return ret;
> f53270c47078c8 Maarten Lankhorst 2020-07-10  265  =

> d2902d100d21d7 Maarten Lankhorst 2020-10-01  266  	/* optimistically try =
to preserve current pages while unlocked */
> d2902d100d21d7 Maarten Lankhorst 2020-10-01  267  	if (i915_gem_object_ha=
s_pages(obj) &&
> d2902d100d21d7 Maarten Lankhorst 2020-10-01  268  	    !mmu_interval_chec=
k_retry(&obj->userptr.notifier,
> d2902d100d21d7 Maarten Lankhorst 2020-10-01  269  				      obj->userptr.=
notifier_seq)) {
> d2902d100d21d7 Maarten Lankhorst 2020-10-01 @270  		ret =3D mutex_lock_in=
terruptible(&i915->mm.notifier_lock);
>                                                                 ^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This code looks intentional, but I don't 100% understand it so I'm just
> going to forward the zero day bot warning.
>
> d2902d100d21d7 Maarten Lankhorst 2020-10-01  271  		if (!ret) {
> d2902d100d21d7 Maarten Lankhorst 2020-10-01  272  			if (obj->userptr.pve=
c &&
> d2902d100d21d7 Maarten Lankhorst 2020-10-01  273  			    !mmu_interval_re=
ad_retry(&obj->userptr.notifier,
> d2902d100d21d7 Maarten Lankhorst 2020-10-01  274  						     obj->userptr=
.notifier_seq)) {
> d2902d100d21d7 Maarten Lankhorst 2020-10-01  275  				obj->userptr.page_r=
ef++;
> d2902d100d21d7 Maarten Lankhorst 2020-10-01  276  				mutex_unlock(&i915-=
>mm.notifier_lock);
>
> Unlocked.

Yeah, the unlock needs to be moved up one branch, thanks for reporting. :)

We need to always unlock it, as it's used way inside core mm through mmu no=
tifiers.

As the notifier_lock only needs to be held for extremely short amounts of t=
ime, and we cannot do any memory allocations. I think I'll replace it with =
a spinlock instead.

~Maarten


--===============7448186539835800906==--

