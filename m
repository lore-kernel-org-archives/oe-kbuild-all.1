Content-Type: multipart/mixed; boundary="===============2679847656061993726=="
MIME-Version: 1.0
From: Roman Anufriev <dotdot@yandex-team.ru>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v2 2/2] ext4: print quota journalling mode on (re-)mount
Date: Mon, 19 Oct 2020 12:46:27 +0300
Message-ID: <alpine.OSX.2.23.453.2010191244500.55532@dotdot-osx>
In-Reply-To: <202010181112.IujKPiIE-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2679847656061993726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 18 Oct 2020, kernel test robot wrote:

> Hi Roman,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on ext4/dev]
> [also build test ERROR on v5.9 next-20201016]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Roman-Anufriev/ext4-add-=
helpers-for-checking-whether-quota-can-be-enabled-is-journalled/20201018-10=
0410
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
> config: i386-randconfig-m021-20201018 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=3D1 build):
>        # https://github.com/0day-ci/linux/commit/9ee2e9dad32135b665f733b7=
14c75ff22731bbcd
>        git remote add linux-review https://github.com/0day-ci/linux
>        git fetch --no-tags linux-review Roman-Anufriev/ext4-add-helpers-f=
or-checking-whether-quota-can-be-enabled-is-journalled/20201018-100410
>        git checkout 9ee2e9dad32135b665f733b714c75ff22731bbcd
>        # save the attached .config to linux build tree
>        make W=3D1 ARCH=3Di386
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>   fs/ext4/super.c: In function 'ext4_quota_mode':
>>> fs/ext4/super.c:3999:19: error: expected ';' before '}' token
>    3999 |  return "disabled"
>         |                   ^
>         |                   ;
>    4000 | #endif
>    4001 | }
>         | ~
>   fs/ext4/super.c: In function 'ext4_remount':
>   fs/ext4/super.c:5738:6: warning: variable 'enable_quota' set but not us=
ed [-Wunused-but-set-variable]
>    5738 |  int enable_quota =3D 0;
>         |      ^~~~~~~~~~~~
>
> vim +3999 fs/ext4/super.c
>
>  3987
>  3988	static const char *ext4_quota_mode(struct super_block *sb)
>  3989	{
>  3990	#ifdef CONFIG_QUOTA
>  3991		if (!ext4_quota_capable(sb))
>  3992			return "none";
>  3993
>  3994		if (ext4_is_quota_journalled(sb))
>  3995			return "journalled";
>  3996		else
>  3997			return "writeback";
>  3998	#else
>> 3999		return "disabled"
>  4000	#endif
>  4001	}
>  4002
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

Fixed missing semicolon in v3:
https://lore.kernel.org/linux-ext4/1603099162-25028-1-git-send-email-dotdot=
(a)yandex-team.ru/

 								Roman
--===============2679847656061993726==--

