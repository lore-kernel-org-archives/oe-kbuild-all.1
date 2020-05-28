Content-Type: multipart/mixed; boundary="===============8978008634424332620=="
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: kbuild-all@lists.01.org
Subject: Re: [rcu:dev.2020.05.26a 56/72] refperf.c:undefined reference to `__umoddi3'
Date: Thu, 28 May 2020 09:04:38 +0200
Message-ID: <CAMuHMdUsD=xGa97tHmHZhohHiEqn5eD0QaOEwGNW7DGibkhB+g@mail.gmail.com>
In-Reply-To: <202005280819.lJ4qjCcP%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8978008634424332620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 5:26 AM kbuild test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu=
.git dev.2020.05.26a
> head:   63fdce1252f16032c9e1eb7244bb674ba4f84855
> commit: bd5b16d6c88da451a46d068a25fafad8e83d14a6 [56/72] refperf: Allow d=
ecimal nanoseconds
> config: m68k-allyesconfig (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout bd5b16d6c88da451a46d068a25fafad8e83d14a6
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dm68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> m68k-linux-ld: kernel/rcu/refperf.o: in function `main_func':
> >> refperf.c:(.text+0x762): undefined reference to `__umoddi3'
> >> m68k-linux-ld: refperf.c:(.text+0x8f2): undefined reference to `__udiv=
di3'
> m68k-linux-ld: refperf.c:(.text+0x97c): undefined reference to `__udivdi3'

| --- a/kernel/rcu/refperf.c
| +++ b/kernel/rcu/refperf.c
| @@ -375,7 +375,7 @@ static int main_func(void *arg)
|                 if (torture_must_stop())
|                         goto end;
|
| -               reader_tasks[exp].result_avg =3D
process_durations(exp) / ((exp + 1) * loops);
| +               reader_tasks[exp].result_avg =3D 1000 *
process_durations(exp) / ((exp + 1) * loops);

div64_ul() for 64-by-unsigned-long division

|         }
|
|         // Print the average of all experiments
| @@ -386,7 +386,7 @@ static int main_func(void *arg)
|         strcat(buf, "Threads\tTime(ns)\n");
|
|         for (exp =3D 0; exp < nreaders; exp++) {
| -               sprintf(buf1, "%d\t%llu\n", exp + 1,
reader_tasks[exp].result_avg);
| +               sprintf(buf1, "%d\t%llu.%03d\n", exp + 1,
reader_tasks[exp].result_avg / 1000,
(int)(reader_tasks[exp].result_avg % 1000));

do_div() for 64-by-32 division/modulo

|                 strcat(buf, buf1);
|         }


Gr{oetje,eeting}s,

                        Geert

-- =

Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
--===============8978008634424332620==--

