Content-Type: multipart/mixed; boundary="===============4528443011417753819=="
MIME-Version: 1.0
From: Prashant Malani <pmalani@chromium.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 5/7] platform/chrome: cros_ec_typec: Introduce TYPEC_STATUS
Date: Wed, 21 Oct 2020 16:50:36 -0700
Message-ID: <CACeCKad0TowOcaxxuBA5iyq3X56inkiMxpsQ8WDmQtSV60_USQ@mail.gmail.com>
In-Reply-To: <202010220607.vNb380XI-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4528443011417753819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 21, 2020 at 3:55 PM kernel test robot <lkp@intel.com> wrote:
>
> Hi Prashant,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on chrome-platform-linux/for-next]
> [also build test WARNING on linus/master v5.9 next-20201021]
> [cannot apply to linux/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Prashant-Malani/platform=
-chrome-cros_ec_typec-Register-partner-PD-information/20201022-045552
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/l=
inux.git for-next
> config: microblaze-allyesconfig (attached as .config)
> compiler: microblaze-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/d95c360f8dc525bd78c299a=
987c1287867f766a2
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Prashant-Malani/platform-chrome-=
cros_ec_typec-Register-partner-PD-information/20201022-045552
>         git checkout d95c360f8dc525bd78c299a987c1287867f766a2
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dmicroblaze
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/platform/chrome/cros_ec_typec.c:698:5: warning: no previous pr=
ototype for 'cros_typec_cmds_supported' [-Wmissing-prototypes]
>      698 | int cros_typec_cmds_supported(struct cros_typec_data *typec)
>          |     ^~~~~~~~~~~~~~~~~~~~~~~~~

Oops, I forgot the static (sorry!). I'll fix this in the next version,
but will avoid pushing another version for now in case there are other
comments.


>
> vim +/cros_typec_cmds_supported +698 drivers/platform/chrome/cros_ec_type=
c.c
>
>    696
>    697  /* Check the EC feature flags to see if TYPEC_* commands are supp=
orted. */
>  > 698  int cros_typec_cmds_supported(struct cros_typec_data *typec)
>    699  {
>    700          struct ec_response_get_features resp =3D {};
>    701          int ret;
>    702
>    703          ret =3D cros_typec_ec_command(typec, 0, EC_CMD_GET_FEATUR=
ES, NULL, 0,
>    704                                      &resp, sizeof(resp));
>    705          if (ret < 0) {
>    706                  dev_warn(typec->dev,
>    707                           "Failed to get features, assuming typec =
commands unsupported.\n");
>    708                  return 0;
>    709          }
>    710
>    711          return resp.flags[EC_FEATURE_TYPEC_CMD / 32] & EC_FEATURE=
_MASK_1(EC_FEATURE_TYPEC_CMD);
>    712  }
>    713
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4528443011417753819==--

