Content-Type: multipart/mixed; boundary="===============9120418354830914382=="
MIME-Version: 1.0
From: Hans de Goede <hdegoede@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH resend] x86/purgatory: Make sure we fail the build if purgatory.ro has missing symbols
Date: Sat, 29 Feb 2020 19:12:57 +0100
Message-ID: <b9a34773-ab38-a3c7-3e35-7da95dc625f4@redhat.com>
In-Reply-To: <202003010150.eyjF3gp0%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9120418354830914382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 2/29/20 6:16 PM, kbuild test robot wrote:
> Hi Hans,
> =

> I love your patch! Yet something to improve:
> =

> [auto build test ERROR on tip/x86/core]
> [also build test ERROR on v5.6-rc3 next-20200228]
> [cannot apply to tip/auto-latest]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
> =

> url:    https://github.com/0day-ci/linux/commits/Hans-de-Goede/x86-purgat=
ory-Make-sure-we-fail-the-build-if-purgatory-ro-has-missing-symbols/2020022=
3-040035
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 248ed=
51048c40d36728e70914e38bffd7821da57
> config: x86_64-randconfig-s1-20200229 (attached as .config)
> compiler: gcc-4.9 (Debian 4.9.2-10+deb8u1) 4.9.2
> reproduce:
>          # save the attached .config to linux build tree
>          make ARCH=3Dx86_64
> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>     ld: arch/x86/purgatory/purgatory.ro: in function `kstrtoull':
>>> (.text+0x2b0e): undefined reference to `ftrace_likely_update'

AFAICT this is the patch working as intended and pointing out an actual iss=
ue
with the purgatory code. Which shows that we really should get this
patch merged...

Regards,

Hans

--===============9120418354830914382==--

