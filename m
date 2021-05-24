Content-Type: multipart/mixed; boundary="===============0549342129764364145=="
MIME-Version: 1.0
From: Huan Feng <huan.feng@starfivetech.com>
To: kbuild-all@lists.01.org
Subject: Re: [stffrdhrn:starfive-bad-dcache-flush 4/39] drivers/char/hw_random/starfive-vic-rng.c:238:34: warning: unused variable 'vic_rng_dt_ids'
Date: Mon, 24 May 2021 01:40:05 +0000
Message-ID: <F687C5AA-DBE1-4892-A041-F1C6A3524B65@starfivetech.com>
In-Reply-To: <20210524005335.GL2687475@shao2-debian>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0549342129764364145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi:
	I can not get the source code from github. =

	Starfive vic gpio and rng hardware is on Starfive vic7100 Soc, which is RI=
SCV ARCH. So maybe they are not used on other Soc or ARCH.
	=

	May be the attach patch file is usefull.

-- =


Best Regards,
 =

Huan Feng
E-mail: huan.feng(a)starfivetch.com
Mobile.: 18111603721
Address: ChengDu China

=EF=BB=BFOn 2021/5/24, 9:00 AM, "kernel test robot" <rong.a.chen@intel.co=
m> wrote:

    tree:   https://github.com/stffrdhrn/linux.git starfive-bad-dcache-flush
    head:   a5c948a9cc2b8944f00056c067fb7bde19b34843
    commit: c9f02856ce72f3de501b56484ecdc71e261fdaa5 [4/39] drivers/hw_rand=
om: Add Starfive VIC Random Number Generator driver
    config: x86_64-randconfig-b001-20210522 (attached as .config)
    compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project e8=
4a9b9bb3051c35dea993cdad7b3d2575638f85)
    reproduce (this is a W=3D1 build):
            wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
            chmod +x ~/bin/make.cross
            # install x86_64 cross compiling tool for clang build
            # apt-get install binutils-x86-64-linux-gnu
            # https://github.com/stffrdhrn/linux/commit/c9f02856ce72f3de501=
b56484ecdc71e261fdaa5
            git remote add stffrdhrn https://github.com/stffrdhrn/linux.git
            git fetch --no-tags stffrdhrn starfive-bad-dcache-flush
            git checkout c9f02856ce72f3de501b56484ecdc71e261fdaa5
            # save the attached .config to linux build tree
            COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dx86_64 =


    If you fix the issue, kindly add following tag as appropriate
    Reported-by: kernel test robot <lkp@intel.com>

    All warnings (new ones prefixed by >>):

    >> drivers/char/hw_random/starfive-vic-rng.c:238:34: warning: unused va=
riable 'vic_rng_dt_ids' [-Wunused-const-variable]
       static const struct of_device_id vic_rng_dt_ids[] =3D {
                                        ^
       1 warning generated.


    vim +/vic_rng_dt_ids +238 drivers/char/hw_random/starfive-vic-rng.c

    c9f02856ce72f3 Huan Feng 2021-01-08  237  =

    c9f02856ce72f3 Huan Feng 2021-01-08 @238  static const struct of_device=
_id vic_rng_dt_ids[] =3D {
    c9f02856ce72f3 Huan Feng 2021-01-08  239  	{ .compatible =3D "starfive,=
vic-rng" },
    c9f02856ce72f3 Huan Feng 2021-01-08  240  	{ }
    c9f02856ce72f3 Huan Feng 2021-01-08  241  };
    c9f02856ce72f3 Huan Feng 2021-01-08  242  MODULE_DEVICE_TABLE(of, vic_r=
ng_dt_ids);
    c9f02856ce72f3 Huan Feng 2021-01-08  243  =


    ---
    0-DAY CI Kernel Test Service, Intel Corporation
    https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org


--===============0549342129764364145==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="github_starfive.patch"

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2hhci9od19yYW5kb20vS2NvbmZpZyBiL2RyaXZlcnMvY2hh
ci9od19yYW5kb20vS2NvbmZpZwppbmRleCBlNTE3YTJmLi4wMzAzNmY2IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2NoYXIvaHdfcmFuZG9tL0tjb25maWcKKysrIGIvZHJpdmVycy9jaGFyL2h3X3JhbmRv
bS9LY29uZmlnCkBAIC0zMzcsOCArMzM3LDggQEAgY29uZmlnIEhXX1JBTkRPTV9QT1dFUk5WCgog
Y29uZmlnIEhXX1JBTkRPTV9TVEFSRklWRV9WSUMKIAl0cmlzdGF0ZSAiU3RhcmZpdmUgVklDIFJh
bmRvbSBOdW1iZXIgR2VuZXJhdG9yIHN1cHBvcnQiCisJZGVwZW5kcyBvbiBTT0NfU1RBUkZJVkVf
VklDNzEwMAogCWRlcGVuZHMgb24gSFdfUkFORE9NCi0JZGVmYXVsdCB5IGlmIFNPQ19TVEFSRklW
RV9WSUM3MTAwCiAJaGVscAogCSAgVGhpcyBkcml2ZXIgcHJvdmlkZXMga2VybmVsLXNpZGUgc3Vw
cG9ydCBmb3IgdGhlIFJhbmRvbSBOdW1iZXIKIAkgIEdlbmVyYXRvciBoYXJkd2FyZSBmb3VuZCBv
biBTdGFyZml2ZSBWSUMgU29DLgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL0tjb25maWcgYi9k
cml2ZXJzL2dwaW8vS2NvbmZpZwppbmRleCAyMWM2MTFhLi5kZGFmMTU0IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwaW8vS2NvbmZpZworKysgYi9kcml2ZXJzL2dwaW8vS2NvbmZpZwpAQCAtNTE3LDkg
KzUxNyw5IEBAIGNvbmZpZyBHUElPX1NJRklWRQoKIGNvbmZpZyBHUElPX1NUQVJGSVZFX1ZJQwog
CWJvb2wgIlN0YXJmaXZlIFZJQyBHUElPIHN1cHBvcnQiCisJZGVwZW5kcyBvbiBTT0NfU1RBUkZJ
VkVfVklDNzEwMAogCWRlcGVuZHMgb24gT0ZfR1BJTwogCXNlbGVjdCBHUElPTElCX0lSUUNISVAK
LQlkZWZhdWx0IHkgaWYgU09DX1NUQVJGSVZFX1ZJQzcxMDAKIAloZWxwCiAJICBTYXkgeWVzIGhl
cmUgdG8gc3VwcG9ydCB0aGUgR1BJTyBkZXZpY2Ugb24gU3RhcmZpdmUgVklDIFNvQ3MuCgo=

--===============0549342129764364145==--

