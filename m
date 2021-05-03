Content-Type: multipart/mixed; boundary="===============6094453338113337384=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [stable:linux-5.4.y 5541/6083] ERROR: "__memcat_p" [drivers/hwtracing/stm/stm_core.ko] undefined!
Date: Mon, 03 May 2021 10:00:42 -0700
Message-ID: <CAKwvOdmCmvHNpyjNtNU1OeSzK_E_9n9T4CPiFGD7K_JuJDOj-w@mail.gmail.com>
In-Reply-To: <CAK8P3a0ZdZY94KVwF-C_t+7rx=iHC60ty52AQAmc1VDZwsn9Rw@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6094453338113337384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 3, 2021 at 5:42 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Sun, May 2, 2021 at 9:28 PM kernel test robot <lkp@intel.com> wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able.git linux-5.4.y
> > head:   370636ffbb8695e6af549011ad91a048c8cab267
> > commit: 99f1960cae4f417d513be5ea55136383c2a58798 [5541/6083] stop_machi=
ne: mark helpers __always_inline
> > config: x86_64-randconfig-a002-20210502 (attached as .config)
> > compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 8f=
5a2a5836cc8e4c1def2bdeb022e7b496623439)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install x86_64 cross compiling tool for clang build
> >         # apt-get install binutils-x86-64-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-=
stable.git/commit/?id=3D99f1960cae4f417d513be5ea55136383c2a58798
> >         git remote add stable https://git.kernel.org/pub/scm/linux/kern=
el/git/stable/linux-stable.git
> >         git fetch --no-tags stable linux-5.4.y
> >         git checkout 99f1960cae4f417d513be5ea55136383c2a58798
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
W=3D1 ARCH=3Dx86_64
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> > >> ERROR: "__memcat_p" [drivers/hwtracing/stm/stm_core.ko] undefined!
>
> I'm fairly sure this is unrelated to my patch, but I don't see what
> happened here.

It's unrelated to your patch. It was fixed in 5.7 by
7273ad2b08f8ac9563579d16a3cf528857b26f49 and a few other dependencies
according to https://github.com/ClangBuiltLinux/linux/issues/515.

-- =

Thanks,
~Nick Desaulniers
--===============6094453338113337384==--

