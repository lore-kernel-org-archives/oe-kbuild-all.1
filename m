Content-Type: multipart/mixed; boundary="===============5198418687964740134=="
MIME-Version: 1.0
From: Ulf Hansson <ulf.hansson@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH linux-stable-rc] mmc: sdhci-pci: amd_sdhci_reset() can be static
Date: Wed, 05 Feb 2020 09:14:49 +0100
Message-ID: <CAPDyKFpr5nBPGxf4JeX=6h2kne9XH6zgC4ZhrHs1AmOsHvqcaw@mail.gmail.com>
In-Reply-To: <20200204231852.7454ydh6bdxie72h@f53c9c00458a>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5198418687964740134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Feb 2020 at 00:19, kbuild test robot <lkp@intel.com> wrote:
>
>
> Fixes: ac342e0a1f18 ("mmc: sdhci-pci: Quirk for AMD SDHC Device 0x7906")
> Signed-off-by: kbuild test robot <lkp@intel.com>

There is already an upstream commit for this. I forgot to tag that one
for stable. Greg, would you mind picking it up?

commit 38413ce39a4bd908c02257cd2f9e0c92b27886f4
Author: zhengbin <zhengbin13@huawei.com>
Date:   Fri Oct 4 17:44:20 2019 +0800
mmc: sdhci-pci: Make function amd_sdhci_reset static

Kind regards
Uffe

> ---
>  sdhci-pci-core.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-p=
ci-core.c
> index 96a163f36a395..8c064348ea106 100644
> --- a/drivers/mmc/host/sdhci-pci-core.c
> +++ b/drivers/mmc/host/sdhci-pci-core.c
> @@ -1604,7 +1604,7 @@ static u32 sdhci_read_present_state(struct sdhci_ho=
st *host)
>         return sdhci_readl(host, SDHCI_PRESENT_STATE);
>  }
>
> -void amd_sdhci_reset(struct sdhci_host *host, u8 mask)
> +static void amd_sdhci_reset(struct sdhci_host *host, u8 mask)
>  {
>         struct sdhci_pci_slot *slot =3D sdhci_priv(host);
>         struct pci_dev *pdev =3D slot->chip->pdev;
--===============5198418687964740134==--

