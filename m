Content-Type: multipart/mixed; boundary="===============8678458314207471565=="
MIME-Version: 1.0
From: Doug Anderson <dianders@chromium.org>
To: kbuild-all@lists.01.org
Subject: Re: [drm-drm-misc:drm-misc-next 8/15] WARNING: modpost: vmlinux.o(.init.literal+0xec14): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .exit.text:(unknown)
Date: Tue, 04 May 2021 07:40:13 -0700
Message-ID: <CAD=FV=Va-OXDLbYTBwN2W+itKYE2LC4YuxnfStJyBJLLMq0wsg@mail.gmail.com>
In-Reply-To: <202105041408.ymX2YKNs-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8678458314207471565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, May 3, 2021 at 11:02 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> head:   63358e24ee79e8f43dadb755cbe8e955230c03a1
> commit: bf73537f411b0d4f546adfb028e915eb633032c5 [8/15] drm/bridge: ti-sn=
65dsi86: Break GPIO and MIPI-to-eDP bridge into sub-drivers
> config: xtensa-randconfig-r032-20210503 (attached as .config)
> compiler: xtensa-linux-gcc (GCC) 9.3.0
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
s W=3D1 ARCH=3Dxtensa
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> >> WARNING: modpost: vmlinux.o(.init.literal+0xec14): Section mismatch in=
 reference from the (unknown reference) (unknown) to the (unknown reference=
) .exit.text:(unknown)
> The (unknown reference) __init (unknown) references
> a (unknown reference) __exit (unknown).
> This is often seen when error handling in the init function
> uses functionality in the exit path.
> The fix is often to remove the __exit annotation of
> (unknown) so it may be used outside an exit section.

Fix at:

https://lore.kernel.org/r/20210504073845.1.Ibf4194f4252846edaa0c6a6c7b86588=
f75ad5529(a)changeid/

-Doug
--===============8678458314207471565==--

