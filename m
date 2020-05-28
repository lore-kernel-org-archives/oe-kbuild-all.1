Content-Type: multipart/mixed; boundary="===============8379097001642891873=="
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: kbuild-all@lists.01.org
Subject: Re: [rcu:dev.2020.05.26a 56/72] refperf.c:undefined reference to `__umoddi3'
Date: Thu, 28 May 2020 17:31:33 +0200
Message-ID: <CAMuHMdXJOeQuA0+iT27vKAB+pNdrBBzvrfVTV=+cjm9r8=GwVQ@mail.gmail.com>
In-Reply-To: <20200528135141.GE2869@paulmck-ThinkPad-P72>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8379097001642891873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Thu, May 28, 2020 at 3:51 PM Paul E. McKenney <paulmck@kernel.org> wro=
te:
> On Thu, May 28, 2020 at 09:04:38AM +0200, Geert Uytterhoeven wrote:
> > On Thu, May 28, 2020 at 5:26 AM kbuild test robot <lkp@intel.com> wro=
te:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux=
-rcu.git dev.2020.05.26a
> > > head:   63fdce1252f16032c9e1eb7244bb674ba4f84855
> > > commit: bd5b16d6c88da451a46d068a25fafad8e83d14a6 [56/72] refperf: All=
ow decimal nanoseconds
> > > config: m68k-allyesconfig (attached as .config)
> > > compiler: m68k-linux-gcc (GCC) 9.3.0
> > > reproduce (this is a W=3D1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         git checkout bd5b16d6c88da451a46d068a25fafad8e83d14a6
> > >         # save the attached .config to linux build tree
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.=
cross ARCH=3Dm68k
> > >
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > >
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > >
> > > m68k-linux-ld: kernel/rcu/refperf.o: in function `main_func':
> > > >> refperf.c:(.text+0x762): undefined reference to `__umoddi3'
> > > >> m68k-linux-ld: refperf.c:(.text+0x8f2): undefined reference to `__=
udivdi3'
> > > m68k-linux-ld: refperf.c:(.text+0x97c): undefined reference to `__udi=
vdi3'
> >
> > | --- a/kernel/rcu/refperf.c
> > | +++ b/kernel/rcu/refperf.c
> > | @@ -375,7 +375,7 @@ static int main_func(void *arg)
> > |                 if (torture_must_stop())
> > |                         goto end;
> > |
> > | -               reader_tasks[exp].result_avg =3D
> > process_durations(exp) / ((exp + 1) * loops);
> > | +               reader_tasks[exp].result_avg =3D 1000 *
> > process_durations(exp) / ((exp + 1) * loops);
> >
> > div64_ul() for 64-by-unsigned-long division
>
> Ah, thank you for the explanation!
>
> This is just a performance-test module intended for SMP systems, so
> I don't see much point in making it work on m68k, which looks to be
> UP-only.  But it is clearly useful to prevent the test bots from building
> refperf on m68k.  So one approach would be for me to make its Kconfig
> option depend on SMP.  Another would be to make it depend on 64BIT.
> Still another would be to make it depend on !M68K.
>
> I could potentially dump out the numbers in picoseconds, then
> do the averaging and other division operations in userspace,
> but that is strange enough to cause more trouble than it is worth.
> (An rcu_read_lock()/rcu_read_unlock() pair takes -how- long???)  Though if
> there was some point in running this on m68k, it might be worth it (with
> "PICOSECONDS" in all caps or some such), but in this case it is not.
> But this would probably require more data to be dumped to allow userspace
> to do the operations, increasing the probability of lost printk()s.  :-/
>
> Left to myself, I would take the easy way out and make this depend
> on 64BIT.
>
> But you must have run into this situation before.  Any thoughts?

Oh, this is not just on m68k. I expect the build bots to start complaining
about other 32-bit platforms, too, like i386 and arm32 ;-)

While restricting this to 64BIT will fix the issue, are you sure people
on 32-bit SMP platforms don't want to run this code?

So I'd go for div64_ul() and do_div().

> > |         }
> > |
> > |         // Print the average of all experiments
> > | @@ -386,7 +386,7 @@ static int main_func(void *arg)
> > |         strcat(buf, "Threads\tTime(ns)\n");
> > |
> > |         for (exp =3D 0; exp < nreaders; exp++) {
> > | -               sprintf(buf1, "%d\t%llu\n", exp + 1,
> > reader_tasks[exp].result_avg);
> > | +               sprintf(buf1, "%d\t%llu.%03d\n", exp + 1,
> > reader_tasks[exp].result_avg / 1000,
> > (int)(reader_tasks[exp].result_avg % 1000));
> >
> > do_div() for 64-by-32 division/modulo

Gr{oetje,eeting}s,

                        Geert

-- =

Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert(a)linux-m6=
8k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
--===============8379097001642891873==--

