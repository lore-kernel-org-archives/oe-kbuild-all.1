Content-Type: multipart/mixed; boundary="===============5215248440085505690=="
MIME-Version: 1.0
From: Vinod Koul <vkoul@kernel.org>
To: kbuild-all@lists.01.org
Subject: (no subject)
Date: Tue, 19 May 2020 14:59:14 +0530
Message-ID: <20200519092914.GM374218@vkoul-mobl.Dlink>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5215248440085505690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Bcc: =

Subject: Re: [usb:usb-testing 57/64] drivers/usb/host/xhci-pci.h:13:5:
 warning: no previous prototype for 'renesas_xhci_check_request_fw'
Reply-To: =

In-Reply-To: <202005191716.5gO1jQGg%lkp@intel.com>

On 19-05-20, 17:08, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git us=
b-testing
> head:   df00731cffa0edb454ee0c490696ce0c1745e680
> commit: a66d21d7dba84deeaf3b296c43eafc11094b6f09 [57/64] usb: xhci: Add s=
upport for Renesas controller with memory
> config: m68k-randconfig-r012-20200519 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout a66d21d7dba84deeaf3b296c43eafc11094b6f09
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dm68k =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>

Thanks for the report, yes missed making these symbols static when
CONFIG_USB_XHCI_PCI_RENESAS is not set

Greg,

Sending the patch now, and sorry for too much noise on these :(

-- =

~Vinod
--===============5215248440085505690==--

