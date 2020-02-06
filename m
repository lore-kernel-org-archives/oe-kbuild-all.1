Content-Type: multipart/mixed; boundary="===============2772164350053696907=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH linux-stable-rc] mmc: sdhci-pci: amd_sdhci_reset() can be static
Date: Thu, 06 Feb 2020 16:52:35 +0100
Message-ID: <20200206155235.GA3754481@kroah.com>
In-Reply-To: <CAPDyKFpr5nBPGxf4JeX=6h2kne9XH6zgC4ZhrHs1AmOsHvqcaw@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2772164350053696907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2020 at 09:14:49AM +0100, Ulf Hansson wrote:
> On Wed, 5 Feb 2020 at 00:19, kbuild test robot <lkp@intel.com> wrote:
> >
> >
> > Fixes: ac342e0a1f18 ("mmc: sdhci-pci: Quirk for AMD SDHC Device 0x7906")
> > Signed-off-by: kbuild test robot <lkp@intel.com>
> =

> There is already an upstream commit for this. I forgot to tag that one
> for stable. Greg, would you mind picking it up?
> =

> commit 38413ce39a4bd908c02257cd2f9e0c92b27886f4
> Author: zhengbin <zhengbin13@huawei.com>
> Date:   Fri Oct 4 17:44:20 2019 +0800
> mmc: sdhci-pci: Make function amd_sdhci_reset static

Now applied, thanks.

greg k-h
--===============2772164350053696907==--

