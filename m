Content-Type: multipart/mixed; boundary="===============3021939892646685582=="
MIME-Version: 1.0
From: Quentin Perret <qperret@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 3/3] kbuild: generate autoksyms.h early
Date: Wed, 12 Feb 2020 19:56:28 +0000
Message-ID: <20200212195628.GA120870@google.com>
In-Reply-To: <202002111002.wXBhAK5H%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3021939892646685582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tuesday 11 Feb 2020 at 10:14:14 (+0800), kbuild test robot wrote:
> Hi Quentin,
> =

> Thank you for the patch! Yet something to improve:
> =

> [auto build test ERROR on kbuild/for-next]
> [also build test ERROR on linux/master linus/master v5.6-rc1 next-2020021=
0]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
> =

> url:    https://github.com/0day-ci/linux/commits/Quentin-Perret/kbuild-al=
low-symbol-whitelisting-with-TRIM_UNUSED_KSYM/20200211-020659
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-k=
build.git for-next
> config: i386-randconfig-c002-20200211 (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-4) 7.5.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=3Di386 =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

> >> ERROR: "trace_event_raw_init" [lib/objagg.ko] undefined!
> >> ERROR: "trace_event_reg" [lib/objagg.ko] undefined!
> >> ERROR: "ida_destroy" [lib/objagg.ko] undefined!
> >> ERROR: "rhashtable_destroy" [lib/objagg.ko] undefined!
> >> ERROR: "kmalloc_order_trace" [lib/objagg.ko] undefined!
> >> ERROR: "sort" [lib/objagg.ko] undefined!
> >> ERROR: "__raw_spin_lock_init" [lib/objagg.ko] undefined!
> >> ERROR: "rhashtable_init" [lib/objagg.ko] undefined!
> >> ERROR: "rht_bucket_nested" [lib/objagg.ko] undefined!
> >> ERROR: "__list_del_entry_valid" [lib/objagg.ko] undefined!
> >> ERROR: "__rht_bucket_nested" [lib/objagg.ko] undefined!
> >> ERROR: "kmem_cache_alloc_trace" [lib/objagg.ko] undefined!
> >> ERROR: "kmalloc_caches" [lib/objagg.ko] undefined!
> >> ERROR: "queue_work_on" [lib/objagg.ko] undefined!
> >> ERROR: "system_wq" [lib/objagg.ko] undefined!
> >> ERROR: "kfree" [lib/objagg.ko] undefined!
> >> ERROR: "__list_add_valid" [lib/objagg.ko] undefined!
> >> ERROR: "lockdep_rht_bucket_is_held" [lib/objagg.ko] undefined!
> >> ERROR: "rhashtable_insert_slow" [lib/objagg.ko] undefined!
> >> ERROR: "__local_bh_enable_ip" [lib/objagg.ko] undefined!

I find myself unable to reproduce this error on my box. Could you please
provide the full build log ?

In the meantime I'll proceed to send a v4.

Thanks,
Quentin
--===============3021939892646685582==--

