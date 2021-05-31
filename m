Content-Type: multipart/mixed; boundary="===============2163445683033833083=="
MIME-Version: 1.0
From: Wen Gong <wgong@codeaurora.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2] wireless: add check of field VHT Extended NSS BW Capable for 160/80+80 MHz setting
Date: Mon, 31 May 2021 11:04:33 +0800
Message-ID: <6dedc959bd3b7515a7e151ea4dae2964@codeaurora.org>
In-Reply-To: <202105230249.n4ifN4Wm-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2163445683033833083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-05-23 02:36, kernel test robot wrote:
> Hi Wen,
> =

> Thank you for the patch! Perhaps something to improve:
> =

> [auto build test WARNING on mac80211-next/master]
> [also build test WARNING on mac80211/master v5.13-rc2 next-20210521]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> =

> url:
> https://github.com/0day-ci/linux/commits/Wen-Gong/wireless-add-check-of-f=
ield-VHT-Extended-NSS-BW-Capable-for-160-80-80-MHz-setting/20210522-224810
> base:
> https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git
> master
> config: i386-randconfig-s001-20210522 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.3-341-g8af24329-dirty
>         #
> https://github.com/0day-ci/linux/commit/ed41c78effa1b66bb3d00e368b92940e5=
ffadb57
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review
> Wen-Gong/wireless-add-check-of-field-VHT-Extended-NSS-BW-Capable-for-160-=
80-80-MHz-setting/20210522-224810
>         git checkout ed41c78effa1b66bb3d00e368b92940e5ffadb57
>         # save the attached .config to linux build tree
>         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=
=3D1 =

> ARCH=3Di386
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> sparse warnings: (new ones prefixed by >>)
>>> net/wireless/chan.c:953:39: sparse: sparse: restricted __le16 =

>>> degrades to integer
> =


please use new patch: "[PATCH v3] wireless: add check of field VHT =

Extended NSS BW Capable for 160/80+80 MHz setting"

...
--===============2163445683033833083==--

