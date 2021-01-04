Content-Type: multipart/mixed; boundary="===============1847183102657255465=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: kbuild-all@lists.01.org
Subject: crypto: stm32 - Fix last sparse warning in stm32_cryp_check_ctr_counter
Date: Mon, 04 Jan 2021 17:15:45 +1100
Message-ID: <20210104061545.GA18641@gondor.apana.org.au>
In-Reply-To: <202012291139.8JYuVQ00-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1847183102657255465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 29, 2020 at 11:26:45AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   dea8dcf2a9fa8cc540136a6cd885c3beece16ec3
> commit: bbb2832620ac4e136416aa97af7310636422dea9 crypto: stm32 - Fix spar=
se warnings
> date:   4 months ago
> config: arm-randconfig-s032-20201220 (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # apt-get install sparse
>         # sparse version: v0.6.3-184-g1b896707-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Dbbb2832620ac4e136416aa97af7310636422dea9
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout bbb2832620ac4e136416aa97af7310636422dea9
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Darm =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> "sparse warnings: (new ones prefixed by >>)"
> >> drivers/crypto/stm32/stm32-cryp.c:1232:47: sparse: sparse: incorrect t=
ype in argument 2 (different base types) @@     expected restricted __be32 =
[usertype] *[assigned] iv @@     got unsigned int [usertype] * @@
>    drivers/crypto/stm32/stm32-cryp.c:1232:47: sparse:     expected restri=
cted __be32 [usertype] *[assigned] iv
>    drivers/crypto/stm32/stm32-cryp.c:1232:47: sparse:     got unsigned in=
t [usertype] *

This patch should fix the problem.

---8<---
This patch changes the cast in stm32_cryp_check_ctr_counter from
u32 to __be32 to match the prototype of stm32_cryp_hw_write_iv
correctly.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32=
-cryp.c
index 2670c30332fa..2a4793176c71 100644
--- a/drivers/crypto/stm32/stm32-cryp.c
+++ b/drivers/crypto/stm32/stm32-cryp.c
@@ -1229,7 +1229,7 @@ static void stm32_cryp_check_ctr_counter(struct stm32=
_cryp *cryp)
 		cr =3D stm32_cryp_read(cryp, CRYP_CR);
 		stm32_cryp_write(cryp, CRYP_CR, cr & ~CR_CRYPEN);
 =

-		stm32_cryp_hw_write_iv(cryp, (u32 *)cryp->last_ctr);
+		stm32_cryp_hw_write_iv(cryp, (__be32 *)cryp->last_ctr);
 =

 		stm32_cryp_write(cryp, CRYP_CR, cr);
 	}
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
--===============1847183102657255465==--

