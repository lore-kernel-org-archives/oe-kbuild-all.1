Content-Type: multipart/mixed; boundary="===============5114228791193885038=="
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
Date: Sat, 09 Jan 2021 23:12:29 +0100
Message-ID: <CACRpkdbT6tv5ArKRLPh3hE-3fuYHotqG5tNwkF4vftSQ1T=wNA@mail.gmail.com>
In-Reply-To: <202101100151.3ojnIrPg-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5114228791193885038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 9, 2021 at 6:24 PM kernel test robot <lkp@intel.com> wrote:

>  > 880          gpioirq->parent_domain =3D NULL;

The autobuilder is complaining because your irq chip is not
hierarchical and this is only used for hierarchical irqchips.
I think you can just delete this line.

Yours,
Linus Walleij
--===============5114228791193885038==--

