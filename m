Content-Type: multipart/mixed; boundary="===============8459829669459004080=="
MIME-Version: 1.0
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] rtc: s5m: use devm_i2c_new_dummy_device()
Date: Wed, 06 Jan 2021 07:59:51 +0100
Message-ID: <CAMpxmJXca8Wc0Fwod+mESC6cee5SEamyN6ayj1AqFQJBHVqQ3A@mail.gmail.com>
In-Reply-To: <CAMpxmJUxKD9-J+MESZMxMePZX4WO_QFj6FudrAKS=Tp_kW8iOQ@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8459829669459004080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 6, 2021 at 7:52 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Wed, Jan 6, 2021 at 7:47 AM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi Bartosz,
> >
> > I love your patch! Perhaps something to improve:
> >
> > [auto build test WARNING on abelloni/rtc-next]
> > [also build test WARNING on v5.11-rc2 next-20210104]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/Bartosz-Golaszewski/rt=
c-s5m-use-devm_i2c_new_dummy_device/20210105-214736
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.=
git rtc-next
> > config: x86_64-randconfig-a004-20210105 (attached as .config)
> > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 5c=
951623bc8965fa1e89660f2f5f4a2944e4981a)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install x86_64 cross compiling tool for clang build
> >         # apt-get install binutils-x86-64-linux-gnu
> >         # https://github.com/0day-ci/linux/commit/21651184178d1001f3bbc=
858c9161f1b7fd65321
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Bartosz-Golaszewski/rtc-s5m-us=
e-devm_i2c_new_dummy_device/20210105-214736
> >         git checkout 21651184178d1001f3bbc858c9161f1b7fd65321
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dx86_64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/rtc/rtc-s5m.c:773:4: warning: variable 'ret' is uninitialize=
d when used here [-Wuninitialized]
> >                            ret);
> >                            ^~~
> >    include/linux/dev_printk.h:112:32: note: expanded from macro 'dev_er=
r'
> >            _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
> >                                          ^~~~~~~~~~~
> >    drivers/rtc/rtc-s5m.c:719:9: note: initialize the variable 'ret' to =
silence this warning
> >            int ret, alarm_irq;
> >                   ^
> >                    =3D 0
> >    1 warning generated.
> >
> >
> > vim +/ret +773 drivers/rtc/rtc-s5m.c
> >
>
> This isn't caused by this patch, it seems to be an older bug. I can
> try to fix it while at it.
>
> Bart

-ETOOEARLY actually it's my bad, I'll fix that in v3.

Bartosz
--===============8459829669459004080==--

