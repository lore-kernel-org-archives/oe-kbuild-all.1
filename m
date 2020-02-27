Content-Type: multipart/mixed; boundary="===============6931932709913023874=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: kbuild-all@lists.01.org
Subject: Re: [kees:for-next/pstore 3/3] fs//pstore/inode.c:105:3: warning: 'return' with no value, in function returning non-void
Date: Thu, 27 Feb 2020 08:08:23 -0800
Message-ID: <202002270807.9A31D3A@keescook>
In-Reply-To: <202002271332.KmbI95cq%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6931932709913023874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2020 at 01:01:48PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git fo=
r-next/pstore
> head:   6099dcfe31fb9eee10c9f272244603dd890472ce
> commit: 6099dcfe31fb9eee10c9f272244603dd890472ce [3/3] pstore: pstore_ftr=
ace_seq_next should increase position index
> config: x86_64-randconfig-s2-20200227 (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
> reproduce:
>         git checkout 6099dcfe31fb9eee10c9f272244603dd890472ce
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    fs//pstore/inode.c: In function 'pstore_ftrace_seq_show':
> >> fs//pstore/inode.c:105:3: warning: 'return' with no value, in function=
 returning non-void [-Wreturn-type]
>       return;
>       ^~~~~~
>    fs//pstore/inode.c:98:12: note: declared here
>     static int pstore_ftrace_seq_show(struct seq_file *s, void *v)
>                ^~~~~~~~~~~~~~~~~~~~~~

Argh, that's what I get for adding a "quick fix" ;)

Fixed in my tree now; thanks!

-Kees

>    Cyclomatic Complexity 5 include/linux/compiler.h:__read_once_size
>    Cyclomatic Complexity 5 include/linux/compiler.h:__write_once_size
>    Cyclomatic Complexity 1 arch/x86/include/asm/bitops.h:fls64
>    Cyclomatic Complexity 1 include/linux/log2.h:__ilog2_u64
>    Cyclomatic Complexity 1 include/linux/list.h:__list_del
>    Cyclomatic Complexity 1 arch/x86/include/asm/atomic64_64.h:arch_atomic=
64_read
>    Cyclomatic Complexity 1 include/linux/spinlock.h:spinlock_check
>    Cyclomatic Complexity 1 include/linux/spinlock.h:spin_unlock_irqrestore
>    Cyclomatic Complexity 1 include/linux/dcache.h:d_inode
>    Cyclomatic Complexity 3 include/linux/slab.h:kmalloc_type
>    Cyclomatic Complexity 28 include/linux/slab.h:kmalloc_index
>    Cyclomatic Complexity 1 include/linux/slab.h:kmalloc_large
>    Cyclomatic Complexity 4 include/linux/slab.h:kmalloc
>    Cyclomatic Complexity 1 include/linux/slab.h:kzalloc
>    Cyclomatic Complexity 1 include/linux/pstore.h:pstore_ftrace_decode_cpu
>    Cyclomatic Complexity 1 include/linux/pstore.h:pstore_ftrace_read_time=
stamp
>    Cyclomatic Complexity 2 fs//pstore/inode.c:pstore_ftrace_seq_next
>    Cyclomatic Complexity 1 fs//pstore/inode.c:pstore_kill_sb
>    Cyclomatic Complexity 1 fs//pstore/inode.c:pstore_mount
>    Cyclomatic Complexity 2 fs//pstore/inode.c:pstore_unlink
>    Cyclomatic Complexity 2 fs//pstore/inode.c:pstore_show_options
>    Cyclomatic Complexity 2 fs//pstore/inode.c:pstore_ftrace_seq_show
>    Cyclomatic Complexity 2 include/linux/list.h:__list_del_entry
>    Cyclomatic Complexity 1 include/linux/list.h:list_del
>    Cyclomatic Complexity 3 fs//pstore/inode.c:free_pstore_private
>    Cyclomatic Complexity 2 fs//pstore/inode.c:pstore_evict_inode
>    Cyclomatic Complexity 1 fs//pstore/inode.c:pstore_ftrace_seq_stop
>    Cyclomatic Complexity 3 fs//pstore/inode.c:pstore_ftrace_seq_start
>    Cyclomatic Complexity 6 fs//pstore/inode.c:parse_options
>    Cyclomatic Complexity 1 fs//pstore/inode.c:pstore_remount
>    Cyclomatic Complexity 2 fs//pstore/inode.c:pstore_get_inode
>    Cyclomatic Complexity 3 fs//pstore/inode.c:pstore_file_open
>    Cyclomatic Complexity 2 fs//pstore/inode.c:pstore_file_read
>    Cyclomatic Complexity 2 fs//pstore/inode.c:pstore_file_llseek
>    Cyclomatic Complexity 1 include/asm-generic/atomic-instrumented.h:atom=
ic64_read
>    Cyclomatic Complexity 1 include/asm-generic/atomic-long.h:atomic_long_=
read
>    Cyclomatic Complexity 1 include/linux/rwsem.h:rwsem_is_locked
>    Cyclomatic Complexity 1 include/linux/fs.h:inode_is_locked
>    Cyclomatic Complexity 68 include/asm-generic/getorder.h:get_order
>    Cyclomatic Complexity 2 include/linux/list.h:__list_add
>    Cyclomatic Complexity 1 include/linux/list.h:list_add
>    Cyclomatic Complexity 1 include/linux/fs.h:inode_lock
>    Cyclomatic Complexity 1 include/linux/fs.h:inode_unlock
>    Cyclomatic Complexity 3 fs//pstore/inode.c:pstore_init_fs
>    Cyclomatic Complexity 1 fs//pstore/inode.c:pstore_exit_fs
>    Cyclomatic Complexity 1 fs//pstore/inode.c:pstore_is_mounted
>    Cyclomatic Complexity 12 fs//pstore/inode.c:pstore_mkfile
>    Cyclomatic Complexity 3 fs//pstore/inode.c:pstore_get_records
>    Cyclomatic Complexity 3 fs//pstore/inode.c:pstore_fill_super
>    Cyclomatic Complexity 1 fs//pstore/inode.c:_GLOBAL__sub_D_65535_0_psto=
re_is_mounted
>    Cyclomatic Complexity 1 fs//pstore/inode.c:_GLOBAL__sub_I_65535_1_psto=
re_is_mounted
> =

> vim +/return +105 fs//pstore/inode.c
> =

>     97	=

>     98	static int pstore_ftrace_seq_show(struct seq_file *s, void *v)
>     99	{
>    100		struct pstore_private *ps =3D s->private;
>    101		struct pstore_ftrace_seq_data *data =3D v;
>    102		struct pstore_ftrace_record *rec;
>    103	=

>    104		if (!data)
>  > 105			return;
>    106	=

>    107		rec =3D (struct pstore_ftrace_record *)(ps->record->buf + data->o=
ff);
>    108	=

>    109		seq_printf(s, "CPU:%d ts:%llu %08lx  %08lx  %ps <- %pS\n",
>    110			   pstore_ftrace_decode_cpu(rec),
>    111			   pstore_ftrace_read_timestamp(rec),
>    112			   rec->ip, rec->parent_ip, (void *)rec->ip,
>    113			   (void *)rec->parent_ip);
>    114	=

>    115		return 0;
>    116	}
>    117	=

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org



-- =

Kees Cook
--===============6931932709913023874==--

