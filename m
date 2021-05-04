Content-Type: multipart/mixed; boundary="===============0011032419380066481=="
MIME-Version: 1.0
From: Doug Anderson <dianders@chromium.org>
To: kbuild-all@lists.01.org
Subject: Re: [drm-drm-misc:drm-misc-next 8/15] WARNING: modpost: vmlinux.o(.init.text+0x48e1c): Section mismatch in reference from the function ti_sn65dsi86_init() to the function .exit.text:ti_sn_gpio_unregister()
Date: Tue, 04 May 2021 07:40:34 -0700
Message-ID: <CAD=FV=XSj+W5d1eBbJp6EKAb9Smdpo48oxzFg2_xxTmxqcqy2A@mail.gmail.com>
In-Reply-To: <202105041230.xjfCLayY-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0011032419380066481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 3, 2021 at 9:49 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> head:   63358e24ee79e8f43dadb755cbe8e955230c03a1
> commit: bf73537f411b0d4f546adfb028e915eb633032c5 [8/15] drm/bridge: ti-sn=
65dsi86: Break GPIO and MIPI-to-eDP bridge into sub-drivers
> config: microblaze-randconfig-r024-20210503 (attached as .config)
> compiler: microblaze-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git remote add drm-drm-misc git://anongit.freedesktop.org/drm/drm=
-misc
>         git fetch --no-tags drm-drm-misc drm-misc-next
>         git checkout bf73537f411b0d4f546adfb028e915eb633032c5
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s W=3D1 ARCH=3Dmicroblaze
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> >> WARNING: modpost: vmlinux.o(.init.text+0x48e1c): Section mismatch in r=
eference from the function ti_sn65dsi86_init() to the function .exit.text:t=
i_sn_gpio_unregister()
> The function __init ti_sn65dsi86_init() references
> a function __exit ti_sn_gpio_unregister().
> This is often seen when error handling in the init function
> uses functionality in the exit path.
> The fix is often to remove the __exit annotation of
> ti_sn_gpio_unregister() so it may be used outside an exit section.

Fix at:

https://lore.kernel.org/r/20210504073845.1.Ibf4194f4252846edaa0c6a6c7b86588=
f75ad5529(a)changeid/

-Doug
--===============0011032419380066481==--

