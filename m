Content-Type: multipart/mixed; boundary="===============6295463537004569867=="
MIME-Version: 1.0
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: sound/soc/intel/catpt/dsp.c:359:9: sparse: sparse: restricted pci_power_t degrades to integer
Date: Thu, 22 Oct 2020 16:52:29 +0300
Message-ID: <20201022135229.GB4077@smile.fi.intel.com>
In-Reply-To: <202010221544.Gf4tzvvx-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6295463537004569867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+Cc: Bjorn

On Thu, Oct 22, 2020 at 03:25:49PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   f804b3159482eedbb4250b1e9248c308fb63b805
> commit: 6cbfa11d2694b8a1e46d6834fb9705d5589e3ef1 ASoC: Intel: Select catp=
t and deprecate haswell
> date:   3 weeks ago
> config: i386-randconfig-s002-20201022 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.3-dirty
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D6cbfa11d2694b8a1e46d6834fb9705d5589e3ef1
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 6cbfa11d2694b8a1e46d6834fb9705d5589e3ef1
>         # save the attached .config to linux build tree
>         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' AR=
CH=3Di386 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> "sparse warnings: (new ones prefixed by >>)"
> >> sound/soc/intel/catpt/dsp.c:359:9: sparse: sparse: restricted pci_powe=
r_t degrades to integer
>    sound/soc/intel/catpt/dsp.c:372:9: sparse: sparse: restricted pci_powe=
r_t degrades to integer
>    sound/soc/intel/catpt/dsp.c:423:9: sparse: sparse: restricted pci_powe=
r_t degrades to integer
>    sound/soc/intel/catpt/dsp.c:447:9: sparse: sparse: restricted pci_powe=
r_t degrades to integer

I dunno who and why created that specific bitwise type. I met not the first
time the same Sparse complain.

In some places I have fixed that by forcing the lvalue type, i.e.

	(__force int)PCI_D3hot

or so.

Also there are two other approaches
- leave as is (ignore this warning)
- create a helper that will convert PCI power type to an integer, like

	switch (pci_pwr) {
	default:
		return -EINVAL;
	case PCI_D3hot:
		return 3;
	...
	}

But I consider the second one is a bit silly. Dunno if PCI core has this al=
ready.

-- =

With Best Regards,
Andy Shevchenko


--===============6295463537004569867==--

