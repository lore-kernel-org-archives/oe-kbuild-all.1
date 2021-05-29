Content-Type: multipart/mixed; boundary="===============2783358952093004291=="
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: kbuild-all@lists.01.org
Subject: Re: include/linux/avf/virtchnl.h:852:33: error: enumerator value for 'virtchnl_static_assert_virtchnl_rss_cfg' is not an integer constant
Date: Sat, 29 May 2021 13:59:23 +0200
Message-ID: <CAMuHMdXZumxTDSG5yx0K8c1SfgodDPm6xCtb+Tb8B5U3HUyT5w@mail.gmail.com>
In-Reply-To: <202105290646.Ov4yx6Pr-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2783358952093004291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 29, 2021 at 12:26 AM kernel test robot <lkp@intel.com> wrote:
> FYI, the error/warning still remains.

Fix available for 10 days:
https://lore.kernel.org/lkml/20210519194350.1854798-1-geert(a)linux-m68k.or=
g/

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   5ff2756afde08b266fbb673849899fec694f39f1
> commit: 222a8ab01698148c00c271cda82d96f4e6e7b0a8 ice: Enable RSS configur=
e for AVF
> date:   5 weeks ago
> config: m68k-randconfig-s031-20210528 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-341-g8af24329-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D222a8ab01698148c00c271cda82d96f4e6e7b0a8
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 222a8ab01698148c00c271cda82d96f4e6e7b0a8
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Dm68k
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    In file included from drivers/net/ethernet/intel/i40e/i40e_prototype.h=
:9,
>                     from drivers/net/ethernet/intel/i40e/i40e.h:41,
>                     from drivers/net/ethernet/intel/i40e/i40e_main.c:11:
>    include/linux/avf/virtchnl.h:153:36: warning: division by zero [-Wdiv-=
by-zero]
>      153 |  { virtchnl_static_assert_##X =3D (n)/((sizeof(struct X) =3D=
=3D (n)) ? 1 : 0) }
>          |                                    ^
>    include/linux/avf/virtchnl.h:844:1: note: in expansion of macro 'VIRTC=
HNL_CHECK_STRUCT_LEN'
>      844 | VIRTCHNL_CHECK_STRUCT_LEN(2312, virtchnl_proto_hdrs);
>          | ^~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/avf/virtchnl.h:844:33: error: enumerator value for 'virt=
chnl_static_assert_virtchnl_proto_hdrs' is not an integer constant

Gr{oetje,eeting}s,

                        Geert

-- =

Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert(a)linux-m6=
8k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
--===============2783358952093004291==--

