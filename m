Content-Type: multipart/mixed; boundary="===============4067144508575983071=="
MIME-Version: 1.0
From: David Hildenbrand <david@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 2036/2633] fs/binfmt_aout.c:225:43: error: expected ')' before '; ' token
Date: Wed, 12 May 2021 15:14:51 +0200
Message-ID: <c946e8e1-c57d-fb3b-447b-a66028484eac@redhat.com>
In-Reply-To: <202105122057.kahGonCV-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4067144508575983071==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12.05.21 14:50, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   ec85c95b0c90a17413901b018e8ade7b9eae7cad
> commit: 953f99327748a7ed47f6fdce8ec2df85e53c672c [2036/2633] binfmt: remo=
ve in-tree usage of MAP_EXECUTABLE
> config: alpha-randconfig-r023-20210512 (attached as .config)
> compiler: alpha-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git/commit/?id=3D953f99327748a7ed47f6fdce8ec2df85e53c672c
>          git remote add linux-next https://git.kernel.org/pub/scm/linux/k=
ernel/git/next/linux-next.git
>          git fetch --no-tags linux-next master
>          git checkout 953f99327748a7ed47f6fdce8ec2df85e53c672c
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cro=
ss W=3D1 ARCH=3Dalpha
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>     fs/binfmt_aout.c: In function 'load_aout_binary':
>>> fs/binfmt_aout.c:225:43: error: expected ')' before ';' token
>       225 |    MAP_FIXED | MAP_PRIVATE | MAP_DENYWRITE;
>           |                                           ^
>>> fs/binfmt_aout.c:223:11: error: too few arguments to function 'vm_mmap'
>       223 |   error =3D vm_mmap(bprm->file, N_TXTADDR(ex), ex.a_text,
>           |           ^~~~~~~
>     In file included from fs/binfmt_aout.c:12:
>     include/linux/mm.h:2631:35: note: declared here
>      2631 | extern unsigned long __must_check vm_mmap(struct file *, unsi=
gned long,
>           |                                   ^~~~~~~
>     fs/binfmt_aout.c:233:44: error: expected ')' before ';' token
>       233 |     MAP_FIXED | MAP_PRIVATE | MAP_DENYWRITE;
>           |                                            ^
>     fs/binfmt_aout.c:231:11: error: too few arguments to function 'vm_mma=
p'
>       231 |   error =3D vm_mmap(bprm->file, N_DATADDR(ex), ex.a_data,
>           |           ^~~~~~~
>     In file included from fs/binfmt_aout.c:12:
>     include/linux/mm.h:2631:35: note: declared here
>      2631 | extern unsigned long __must_check vm_mmap(struct file *, unsi=
gned long,
>           |                                   ^~~~~~~
> =

> =

> vim +225 fs/binfmt_aout.c
> =

>     111	=

>     112	/*
>     113	 * These are the functions used to load a.out style executables a=
nd shared
>     114	 * libraries.  There is no binary dependent code anywhere else.
>     115	 */
>     116	=

>     117	static int load_aout_binary(struct linux_binprm * bprm)
>     118	{
>     119		struct pt_regs *regs =3D current_pt_regs();
>     120		struct exec ex;
>     121		unsigned long error;
>     122		unsigned long fd_offset;
>     123		unsigned long rlim;
>     124		int retval;
>     125	=

>     126		ex =3D *((struct exec *) bprm->buf);		/* exec-header */
>     127		if ((N_MAGIC(ex) !=3D ZMAGIC && N_MAGIC(ex) !=3D OMAGIC &&
>     128		     N_MAGIC(ex) !=3D QMAGIC && N_MAGIC(ex) !=3D NMAGIC) ||
>     129		    N_TRSIZE(ex) || N_DRSIZE(ex) ||
>     130		    i_size_read(file_inode(bprm->file)) < ex.a_text+ex.a_data+N_=
SYMSIZE(ex)+N_TXTOFF(ex)) {
>     131			return -ENOEXEC;
>     132		}
>     133	=

>     134		/*
>     135		 * Requires a mmap handler. This prevents people from using a.out
>     136		 * as part of an exploit attack against /proc-related vulnerabil=
ities.
>     137		 */
>     138		if (!bprm->file->f_op->mmap)
>     139			return -ENOEXEC;
>     140	=

>     141		fd_offset =3D N_TXTOFF(ex);
>     142	=

>     143		/* Check initial limits. This avoids letting people circumvent
>     144		 * size limits imposed on them by creating programs with large
>     145		 * arrays in the data or bss.
>     146		 */
>     147		rlim =3D rlimit(RLIMIT_DATA);
>     148		if (rlim >=3D RLIM_INFINITY)
>     149			rlim =3D ~0;
>     150		if (ex.a_data + ex.a_bss > rlim)
>     151			return -ENOMEM;
>     152	=

>     153		/* Flush all traces of the currently running executable */
>     154		retval =3D begin_new_exec(bprm);
>     155		if (retval)
>     156			return retval;
>     157	=

>     158		/* OK, This is the point of no return */
>     159	#ifdef __alpha__
>     160		SET_AOUT_PERSONALITY(bprm, ex);
>     161	#else
>     162		set_personality(PER_LINUX);
>     163	#endif
>     164		setup_new_exec(bprm);
>     165	=

>     166		current->mm->end_code =3D ex.a_text +
>     167			(current->mm->start_code =3D N_TXTADDR(ex));
>     168		current->mm->end_data =3D ex.a_data +
>     169			(current->mm->start_data =3D N_DATADDR(ex));
>     170		current->mm->brk =3D ex.a_bss +
>     171			(current->mm->start_brk =3D N_BSSADDR(ex));
>     172	=

>     173		retval =3D setup_arg_pages(bprm, STACK_TOP, EXSTACK_DEFAULT);
>     174		if (retval < 0)
>     175			return retval;
>     176	=

>     177	=

>     178		if (N_MAGIC(ex) =3D=3D OMAGIC) {
>     179			unsigned long text_addr, map_size;
>     180			loff_t pos;
>     181	=

>     182			text_addr =3D N_TXTADDR(ex);
>     183	=

>     184	#ifdef __alpha__
>     185			pos =3D fd_offset;
>     186			map_size =3D ex.a_text+ex.a_data + PAGE_SIZE - 1;
>     187	#else
>     188			pos =3D 32;
>     189			map_size =3D ex.a_text+ex.a_data;
>     190	#endif
>     191			error =3D vm_brk(text_addr & PAGE_MASK, map_size);
>     192			if (error)
>     193				return error;
>     194	=

>     195			error =3D read_code(bprm->file, text_addr, pos,
>     196					  ex.a_text+ex.a_data);
>     197			if ((signed long)error < 0)
>     198				return error;
>     199		} else {
>     200			if ((ex.a_text & 0xfff || ex.a_data & 0xfff) &&
>     201			    (N_MAGIC(ex) !=3D NMAGIC) && printk_ratelimit())
>     202			{
>     203				printk(KERN_NOTICE "executable not page aligned\n");
>     204			}
>     205	=

>     206			if ((fd_offset & ~PAGE_MASK) !=3D 0 && printk_ratelimit())
>     207			{
>     208				printk(KERN_WARNING
>     209				       "fd_offset is not page aligned. Please convert program:=
 %pD\n",
>     210				       bprm->file);
>     211			}
>     212	=

>     213			if (!bprm->file->f_op->mmap||((fd_offset & ~PAGE_MASK) !=3D 0))=
 {
>     214				error =3D vm_brk(N_TXTADDR(ex), ex.a_text+ex.a_data);
>     215				if (error)
>     216					return error;
>     217	=

>     218				read_code(bprm->file, N_TXTADDR(ex), fd_offset,
>     219					  ex.a_text + ex.a_data);
>     220				goto beyond_if;
>     221			}
>     222	=

>   > 223			error =3D vm_mmap(bprm->file, N_TXTADDR(ex), ex.a_text,
>     224				PROT_READ | PROT_EXEC,
>   > 225				MAP_FIXED | MAP_PRIVATE | MAP_DENYWRITE;
>     226				fd_offset);
>     227	=

>     228			if (error !=3D N_TXTADDR(ex))
>     229				return error;
>     230	=

>     231			error =3D vm_mmap(bprm->file, N_DATADDR(ex), ex.a_data,
>     232					PROT_READ | PROT_WRITE | PROT_EXEC,
>     233					MAP_FIXED | MAP_PRIVATE | MAP_DENYWRITE;
>     234					fd_offset + ex.a_text);
>     235			if (error !=3D N_DATADDR(ex))
>     236				return error;
>     237		}

Fix should be simple (wasn't expecting this file only buils on alpha), =

asked Andrew in the original patch on how to best route the build fix

https://lkml.kernel.org/r/49a8cb62-e26d-a351-937e-6fb62a6f4a2e(a)redhat.com

-- =

Thanks,

David / dhildenb

--===============4067144508575983071==--

