Content-Type: multipart/mixed; boundary="===============7403282605798101811=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [EXT] [linux-next:master 6663/12912] drivers/net/dsa/sja1105/sja1105_static_config.c:463:8: warning: no previous prototype for function 'sja1105_vl_lookup_entry_packing'
Date: Tue, 26 May 2020 14:07:27 -0700
Message-ID: <CAKwvOd=9w8fMazrrjrttHSXgFBHA0vp5tN6qA+dX=D5rqCRN4A@mail.gmail.com>
In-Reply-To: <VI1PR04MB5696BCF57BEEB9E874F98443E0B00@VI1PR04MB5696.eurprd04.prod.outlook.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7403282605798101811==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2020 at 12:40 PM Vladimir Oltean
<vladimir.oltean@nxp.com> wrote:
>
> What's wrong with a function that has no previous prototype?

It's possible that functions definitions don't match their
declarations, which would be an ABI mismatch.

> What 'fix' would be recommended?

Including the correct header that declares the function.

>
> ________________________________
> From: kbuild test robot <lkp@intel.com>
> Sent: Tuesday, May 26, 2020 10:38 PM
> To: Vladimir Oltean <vladimir.oltean@nxp.com>
> Cc: kbuild-all(a)lists.01.org <kbuild-all@lists.01.org>; clang-built-li=
nux(a)googlegroups.com <clang-built-linux@googlegroups.com>
> Subject: [EXT] [linux-next:master 6663/12912] drivers/net/dsa/sja1105/sja=
1105_static_config.c:463:8: warning: no previous prototype for function 'sj=
a1105_vl_lookup_entry_packing'
>
> Caution: EXT Email
>
> Hi Vladimir,
>
> FYI, the error/warning still remains.
>
> tree:   https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.gi=
t&amp;data=3D02%7C01%7Cvladimir.oltean%40nxp.com%7C08e6290ccbe844ccb10208d8=
01ac6954%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637261187457956492&am=
p;sdata=3DTIM2F4HXtmN2AXNm5xM5TjwaYNmdstN8orTe3V%2BwNOA%3D&amp;reserved=3D0=
 master
> head:   b0523c7b1c9d0edcd6c0fe6d2cb558a9ad5c60a8
> commit: 94f94d4acfb2a5e978f98d924be33c981e2f86c6 [6663/12912] net: dsa: s=
ja1105: add static tables for virtual links
> config: x86_64-randconfig-r006-20200526 (attached as .config)
> compiler: clang version 11.0.0 (https://eur01.safelinks.protection.outloo=
k.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project&amp;data=3D02%7=
C01%7Cvladimir.oltean%40nxp.com%7C08e6290ccbe844ccb10208d801ac6954%7C686ea1=
d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637261187457966445&amp;sdata=3Dy8IInLZ=
xjz%2FF6cqTJIdeL0izRRnP2dnJP8yehJXzNmg%3D&amp;reserved=3D0 3393cc4cebf9969d=
b94dc424b7a2b6195589c33b)
> reproduce (this is a W=3D1 build):
>         wget https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmak=
e.cross&amp;data=3D02%7C01%7Cvladimir.oltean%40nxp.com%7C08e6290ccbe844ccb1=
0208d801ac6954%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637261187457966=
445&amp;sdata=3DTw6wTZsqKIRtdGuIjiiHiKKlzWFIlWJhsGyb9XSvECU%3D&amp;reserved=
=3D0 -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout 94f94d4acfb2a5e978f98d924be33c981e2f86c6
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> drivers/net/dsa/sja1105/sja1105_static_config.c:105:8: warning: no previo=
us prototype for function 'sja1105pqrs_avb_params_entry_packing' [-Wmissing=
-prototypes]
> size_t sja1105pqrs_avb_params_entry_packing(void *buf, void *entry_ptr,
> ^
> drivers/net/dsa/sja1105/sja1105_static_config.c:105:1: note: declare 'sta=
tic' if the function is not intended to be used outside of this translation=
 unit
> size_t sja1105pqrs_avb_params_entry_packing(void *buf, void *entry_ptr,
> ^
> static
> drivers/net/dsa/sja1105/sja1105_static_config.c:199:8: warning: no previo=
us prototype for function 'sja1105_l2_forwarding_entry_packing' [-Wmissing-=
prototypes]
> size_t sja1105_l2_forwarding_entry_packing(void *buf, void *entry_ptr,
> ^
> drivers/net/dsa/sja1105/sja1105_static_config.c:199:1: note: declare 'sta=
tic' if the function is not intended to be used outside of this translation=
 unit
> size_t sja1105_l2_forwarding_entry_packing(void *buf, void *entry_ptr,
> ^
> static
> drivers/net/dsa/sja1105/sja1105_static_config.c:254:8: warning: no previo=
us prototype for function 'sja1105et_l2_lookup_entry_packing' [-Wmissing-pr=
ototypes]
> size_t sja1105et_l2_lookup_entry_packing(void *buf, void *entry_ptr,
> ^
> drivers/net/dsa/sja1105/sja1105_static_config.c:254:1: note: declare 'sta=
tic' if the function is not intended to be used outside of this translation=
 unit
> size_t sja1105et_l2_lookup_entry_packing(void *buf, void *entry_ptr,
> ^
> static
> drivers/net/dsa/sja1105/sja1105_static_config.c:268:8: warning: no previo=
us prototype for function 'sja1105pqrs_l2_lookup_entry_packing' [-Wmissing-=
prototypes]
> size_t sja1105pqrs_l2_lookup_entry_packing(void *buf, void *entry_ptr,
> ^
> drivers/net/dsa/sja1105/sja1105_static_config.c:268:1: note: declare 'sta=
tic' if the function is not intended to be used outside of this translation=
 unit
> size_t sja1105pqrs_l2_lookup_entry_packing(void *buf, void *entry_ptr,
> ^
> static
> drivers/net/dsa/sja1105/sja1105_static_config.c:344:8: warning: no previo=
us prototype for function 'sja1105pqrs_mac_config_entry_packing' [-Wmissing=
-prototypes]
> size_t sja1105pqrs_mac_config_entry_packing(void *buf, void *entry_ptr,
> ^
> drivers/net/dsa/sja1105/sja1105_static_config.c:344:1: note: declare 'sta=
tic' if the function is not intended to be used outside of this translation=
 unit
> size_t sja1105pqrs_mac_config_entry_packing(void *buf, void *entry_ptr,
> ^
> static
> >> drivers/net/dsa/sja1105/sja1105_static_config.c:463:8: warning: no pre=
vious prototype for function 'sja1105_vl_lookup_entry_packing' [-Wmissing-p=
rototypes]
> size_t sja1105_vl_lookup_entry_packing(void *buf, void *entry_ptr,
> ^
> drivers/net/dsa/sja1105/sja1105_static_config.c:463:1: note: declare 'sta=
tic' if the function is not intended to be used outside of this translation=
 unit
> size_t sja1105_vl_lookup_entry_packing(void *buf, void *entry_ptr,
> ^
> static
> drivers/net/dsa/sja1105/sja1105_static_config.c:513:8: warning: no previo=
us prototype for function 'sja1105_vlan_lookup_entry_packing' [-Wmissing-pr=
ototypes]
> size_t sja1105_vlan_lookup_entry_packing(void *buf, void *entry_ptr,
> ^
> drivers/net/dsa/sja1105/sja1105_static_config.c:513:1: note: declare 'sta=
tic' if the function is not intended to be used outside of this translation=
 unit
> size_t sja1105_vlan_lookup_entry_packing(void *buf, void *entry_ptr,
> ^
> static
> 7 warnings generated.
>
> vim +/sja1105_vl_lookup_entry_packing +463 drivers/net/dsa/sja1105/sja110=
5_static_config.c
>
>    462
>  > 463  size_t sja1105_vl_lookup_entry_packing(void *buf, void *entry_ptr,
>    464                                         enum packing_op op)
>    465  {
>    466          struct sja1105_vl_lookup_entry *entry =3D entry_ptr;
>    467          const size_t size =3D SJA1105_SIZE_VL_LOOKUP_ENTRY;
>    468
>    469          if (entry->format =3D=3D SJA1105_VL_FORMAT_PSFP) {
>    470                  /* Interpreting vllupformat as 0 */
>    471                  sja1105_packing(buf, &entry->destports,
>    472                                  95, 91, size, op);
>    473                  sja1105_packing(buf, &entry->iscritical,
>    474                                  90, 90, size, op);
>    475                  sja1105_packing(buf, &entry->macaddr,
>    476                                  89, 42, size, op);
>    477                  sja1105_packing(buf, &entry->vlanid,
>    478                                  41, 30, size, op);
>    479                  sja1105_packing(buf, &entry->port,
>    480                                  29, 27, size, op);
>    481                  sja1105_packing(buf, &entry->vlanprior,
>    482                                  26, 24, size, op);
>    483          } else {
>    484                  /* Interpreting vllupformat as 1 */
>    485                  sja1105_packing(buf, &entry->egrmirr,
>    486                                  95, 91, size, op);
>    487                  sja1105_packing(buf, &entry->ingrmirr,
>    488                                  90, 90, size, op);
>    489                  sja1105_packing(buf, &entry->vlid,
>    490                                  57, 42, size, op);
>    491                  sja1105_packing(buf, &entry->port,
>    492                                  29, 27, size, op);
>    493          }
>    494          return size;
>    495  }
>    496
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=3D02%7C01%=
7Cvladimir.oltean%40nxp.com%7C08e6290ccbe844ccb10208d801ac6954%7C686ea1d3bc=
2b4c6fa92cd99c5c301635%7C0%7C0%7C637261187457966445&amp;sdata=3DJUxpDGnGAvz=
noiXrgdumiSSY8FHKcZV6q1LaZHN6HMY%3D&amp;reserved=3D0
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe(a)googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/VI1PR04MB5696BCF57BEEB9E874F98443E0B00%40VI1PR04MB5696.=
eurprd04.prod.outlook.com.



-- =

Thanks,
~Nick Desaulniers
--===============7403282605798101811==--

