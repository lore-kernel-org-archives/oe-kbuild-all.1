Content-Type: multipart/mixed; boundary="===============4930468303607030158=="
MIME-Version: 1.0
From: Wei Liu <wei.liu@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v4 15/17] x86/hyperv: implement an MSI domain for root partition
Date: Thu, 07 Jan 2021 15:05:58 +0000
Message-ID: <20210107150557.2pa3qsd4qbni4iaa@liuwe-devbox-debian-v2>
In-Reply-To: <202101070658.h9Fcg0JA-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4930468303607030158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2021 at 06:21:24AM +0800, kernel test robot wrote:
> Hi Wei,
> =

> I love your patch! Perhaps something to improve:
> =

> [auto build test WARNING on e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62]
> =

> url:    https://github.com/0day-ci/linux/commits/Wei-Liu/Introducing-Linu=
x-root-partition-support-for-Microsoft-Hypervisor/20210107-044149
> base:    e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
> config: i386-randconfig-m021-20210106 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=3D1 build):
>         # https://github.com/0day-ci/linux/commit/376aee69c6ab18dc23b0386=
590bee82d59555be8
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Wei-Liu/Introducing-Linux-root-p=
artition-support-for-Microsoft-Hypervisor/20210107-044149
>         git checkout 376aee69c6ab18dc23b0386590bee82d59555be8
>         # save the attached .config to linux build tree
>         make W=3D1 ARCH=3Di386 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

> >> arch/x86/hyperv/irqdomain.c:317:28: warning: no previous prototype for=
 'hv_create_pci_msi_domain' [-Wmissing-prototypes]
>      317 | struct irq_domain * __init hv_create_pci_msi_domain(void)
>          |                            ^~~~~~~~~~~~~~~~~~~~~~~~
> =

> =

> vim +/hv_create_pci_msi_domain +317 arch/x86/hyperv/irqdomain.c

I've fixed this locally by moving the prototype to a header file --
previously it was left in a C file.

Wei.
--===============4930468303607030158==--

