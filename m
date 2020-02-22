Content-Type: multipart/mixed; boundary="===============6527651869992856322=="
MIME-Version: 1.0
From: Scott Branden <scott.branden@broadcom.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/7] firmware: add offset to request_firmware_into_buf
Date: Fri, 21 Feb 2020 17:26:21 -0800
Message-ID: <34ac08f4-8528-a150-d451-4ce6cc98d555@broadcom.com>
In-Reply-To: <202002220811.ZfoxGUs3%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6527651869992856322==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Will remove semicolon to fix compile error on certain CONFIG_FW_LOADER =

not selected.

On 2020-02-21 4:50 p.m., kbuild test robot wrote:
> Hi Scott,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on char-misc/char-misc-testing]
> [also build test ERROR on kselftest/next linus/master v5.6-rc2]
> [cannot apply to driver-core/driver-core-testing next-20200221]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>
> url:    https://github.com/0day-ci/linux/commits/Scott-Branden/firmware-a=
dd-partial-read-support-in-request_firmware_into_buf/20200222-032851
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.=
git 06e33595e96f212811066df192ae8bf802174296
> config: x86_64-randconfig-c002-20200221 (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-5) 7.5.0
> reproduce:
>          # save the attached .config to linux build tree
>          make ARCH=3Dx86_64
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     In file included from drivers/base/firmware_loader/fallback.h:5:0,
>                      from drivers/base/firmware_loader/fallback_table.c:1=
2:
>>> include/linux/firmware.h:97:1: error: expected identifier or '(' before=
 '{' token
>      {
>      ^
>     include/linux/firmware.h:94:19: warning: 'request_firmware_into_buf' =
declared 'static' but never defined [-Wunused-function]
>      static inline int request_firmware_into_buf(const struct firmware **=
firmware_p,
>                        ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> vim +97 include/linux/firmware.h
>
> fbab976d7ce455 James Bottomley 2008-03-07   93
> a098ecd2fa7db8 Stephen Boyd    2016-08-02   94  static inline int request=
_firmware_into_buf(const struct firmware **firmware_p,
> 6f0a3d616d978b Scott Branden   2020-02-19   95  	const char *name, struct=
 device *device, void *buf, size_t size,
> 6f0a3d616d978b Scott Branden   2020-02-19   96  	size_t offset, unsigned =
int pread_flags);
Will remove ;
> a098ecd2fa7db8 Stephen Boyd    2016-08-02  @97  {
> a098ecd2fa7db8 Stephen Boyd    2016-08-02   98  	return -EINVAL;
> a098ecd2fa7db8 Stephen Boyd    2016-08-02   99  }
> a098ecd2fa7db8 Stephen Boyd    2016-08-02  100
>
> :::::: The code at line 97 was first introduced by commit
> :::::: a098ecd2fa7db8fa4fcc178a43627b29b226edb9 firmware: support loading=
 into a pre-allocated buffer
>
> :::::: TO: Stephen Boyd <stephen.boyd@linaro.org>
> :::::: CC: Linus Torvalds <torvalds@linux-foundation.org>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6527651869992856322==--

