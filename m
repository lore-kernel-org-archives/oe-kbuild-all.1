Content-Type: multipart/mixed; boundary="===============5351841037654370867=="
MIME-Version: 1.0
From: Bjorn Helgaas <helgaas@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [pci:pci/hotplug 2/3] drivers/pci/hotplug/pciehp_hpc.c:268:12: error: 'ctrl' undeclared; did you mean 'to_ctrl'?
Date: Tue, 11 Feb 2020 08:20:05 -0600
Message-ID: <20200211142005.GA207907@google.com>
In-Reply-To: <202002111451.U5ATnnUR%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5351841037654370867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 02:04:54PM +0800, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git p=
ci/hotplug
> head:   c4e85e3f147644d222f7d2da21a812f8ff3b7cbc
> commit: 8fe64774eb64d97900d4b0551b6cbedfe4358636 [2/3] PCI: pciehp: Wait =
for PDS if in-band presence is disabled
> config: sparc64-randconfig-a001-20200211 (attached as .config)
> compiler: sparc64-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 8fe64774eb64d97900d4b0551b6cbedfe4358636
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Dsparc64 =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All error/warnings (new ones prefixed by >>):
> =

>    In file included from include/linux/device.h:15:0,
>                     from include/linux/pci.h:37,
>                     from drivers/pci/hotplug/pciehp_hpc.c:21:
>    drivers/pci/hotplug/pciehp_hpc.c: In function 'pcie_wait_for_presence':
> >> drivers/pci/hotplug/pciehp_hpc.c:268:12: error: 'ctrl' undeclared (fir=
st use in this function); did you mean 'to_ctrl'?
>      ctrl_info(ctrl, "Timeout waiting for Presence Detect\n");
>                ^
>    include/linux/dev_printk.h:110:12: note: in definition of macro 'dev_i=
nfo'
>      _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
>                ^~~
> >> drivers/pci/hotplug/pciehp.h:40:2: note: in expansion of macro 'pci_in=
fo'
>      pci_info(ctrl->pcie->port, format, ## arg)
>      ^~~~~~~~
> >> drivers/pci/hotplug/pciehp_hpc.c:268:2: note: in expansion of macro 'c=
trl_info'
>      ctrl_info(ctrl, "Timeout waiting for Presence Detect\n");
>      ^~~~~~~~~
>    drivers/pci/hotplug/pciehp_hpc.c:268:12: note: each undeclared identif=
ier is reported only once for each function it appears in
>      ctrl_info(ctrl, "Timeout waiting for Presence Detect\n");
>                ^
>    include/linux/dev_printk.h:110:12: note: in definition of macro 'dev_i=
nfo'
>      _dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
>                ^~~
> >> drivers/pci/hotplug/pciehp.h:40:2: note: in expansion of macro 'pci_in=
fo'
>      pci_info(ctrl->pcie->port, format, ## arg)
>      ^~~~~~~~
> >> drivers/pci/hotplug/pciehp_hpc.c:268:2: note: in expansion of macro 'c=
trl_info'
>      ctrl_info(ctrl, "Timeout waiting for Presence Detect\n");
>      ^~~~~~~~~

My fault, fixed.  Sorry, don't know what I was thinking.  Obviously
not much.
--===============5351841037654370867==--

