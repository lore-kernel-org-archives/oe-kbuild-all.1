Content-Type: multipart/mixed; boundary="===============8023471671639767730=="
MIME-Version: 1.0
From: Giovanni Gherdovich <ggherdovich@suse.cz>
To: kbuild-all@lists.01.org
Subject: Re: [peterz-queue:sched/core 4/9] arch/x86/kernel/smpboot.c:2083: undefined reference to `__udivdi3'
Date: Mon, 18 May 2020 12:56:18 +0200
Message-ID: <1589799378.6030.18.camel@suse.cz>
In-Reply-To: <20200518093540.GC277222@hirez.programming.kicks-ass.net>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8023471671639767730==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-05-18 at 11:35 +0200, Peter Zijlstra wrote:
> On Sat, May 16, 2020 at 06:11:20AM +0800, kbuild test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.gi=
t sched/core
> > head:   073d35d51f30267ccb43479be42d382f9b03fd9a
> > commit: df24fd8a5838c3e24dc7a41b37c5812cce80dd43 [4/9] x86, sched: Prev=
ent divisions by zero in frequency invariant accounting
> > config: i386-randconfig-a011-20200515 (attached as .config)
> > compiler: gcc-4.9 (Ubuntu 4.9.3-13ubuntu2) 4.9.3
> > reproduce:
> >         git checkout df24fd8a5838c3e24dc7a41b37c5812cce80dd43
> >         # save the attached .config to linux build tree
> >         make ARCH=3Di386 =

> > =

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kbuild test robot <lkp@intel.com>
> > =

> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > =

> > ld: arch/x86/kernel/smpboot.o: in function `arch_scale_freq_tick':
> > > > arch/x86/kernel/smpboot.c:2083: undefined reference to `__udivdi3'
> > =

> > vim +2083 arch/x86/kernel/smpboot.c
> > =

> >   2061	=

> >   2062	void arch_scale_freq_tick(void)
> >   2063	{
> >   2064		u64 freq_scale =3D SCHED_CAPACITY_SCALE;
> >   2065		u64 aperf, mperf;
> >   2066		u64 acnt, mcnt;
> >   2067	=

> >   2068		if (!arch_scale_freq_invariant())
> >   2069			return;
> >   2070	=

> >   2071		rdmsrl(MSR_IA32_APERF, aperf);
> >   2072		rdmsrl(MSR_IA32_MPERF, mperf);
> >   2073	=

> >   2074		acnt =3D aperf - this_cpu_read(arch_prev_aperf);
> >   2075		mcnt =3D mperf - this_cpu_read(arch_prev_mperf);
> >   2076	=

> >   2077		this_cpu_write(arch_prev_aperf, aperf);
> >   2078		this_cpu_write(arch_prev_mperf, mperf);
> >   2079	=

> >   2080		if (check_shl_overflow(acnt, 2*SCHED_CAPACITY_SHIFT, &acnt))
> >   2081			goto error;
> >   2082	=

> > > 2083		if (check_mul_overflow(mcnt, arch_max_freq_ratio, &mcnt) || !mc=
nt)
> =

> *sigh*,.. I hate computers. I'll try and have a look later, but if if
> you have a nice solution Giovanni, don't hessitate to tell me ;-)

Hello Peter,

today I'm speaking at OSPM but tomorrow I'll see how to fix this.


Giovanni
--===============8023471671639767730==--

