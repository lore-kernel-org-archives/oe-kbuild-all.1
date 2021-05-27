Content-Type: multipart/mixed; boundary="===============0057995148798124635=="
MIME-Version: 1.0
From: Dmitry Osipenko <digetx@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 08/14] memory: tegra: Enable compile testing for all drivers
Date: Fri, 28 May 2021 01:36:01 +0300
Message-ID: <94cef726-e49d-429c-28ee-07f95f1b8269@gmail.com>
In-Reply-To: <202105280650.q4RwpZmX-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0057995148798124635==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

28.05.2021 01:30, kernel test robot =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi Dmitry,
> =

> I love your patch! Perhaps something to improve:
> =

> [auto build test WARNING on regulator/for-next]
> [also build test WARNING on robh/for-next v5.13-rc3 next-20210527]
> [cannot apply to tegra/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:    https://github.com/0day-ci/linux/commits/Dmitry-Osipenko/NVIDIA-T=
egra-memory-and-power-management-changes-for-5-14/20210528-044947
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator=
.git for-next
> config: mips-allyesconfig (attached as .config)
> compiler: mips-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/0e5281d15492508d5d64059=
f451652fd4f8969dc
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Dmitry-Osipenko/NVIDIA-Tegra-mem=
ory-and-power-management-changes-for-5-14/20210528-044947
>         git checkout 0e5281d15492508d5d64059f451652fd4f8969dc
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dmips =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    In file included from drivers/memory/tegra/tegra210-emc-core.c:8:
>    include/linux/clk/tegra.h:220:1: error: expected identifier or '(' bef=
ore '{' token
>      220 | {
>          | ^
>    In file included from drivers/memory/tegra/tegra210-emc-core.c:8:
>>> include/linux/clk/tegra.h:218:1: warning: 'tegra210_clk_emc_attach' use=
d but never defined
>      218 | tegra210_clk_emc_attach(struct clk *clk,
>          | ^~~~~~~~~~~~~~~~~~~~~~~

Indeed, there is offending ';'. I will fix it in v5, hopefully that's the l=
ast issue with the stubs.

diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index 5667fe7a979c..9400f0554c60 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -216,7 +216,7 @@ static inline int tegra210_clk_handle_mbist_war(unsigne=
d int id)
 =

 static inline int
 tegra210_clk_emc_attach(struct clk *clk,
-			struct tegra210_clk_emc_provider *provider);
+			struct tegra210_clk_emc_provider *provider)
 {
 	return 0;
 }

--===============0057995148798124635==--

