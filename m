Content-Type: multipart/mixed; boundary="===============5983906534034195444=="
MIME-Version: 1.0
From: Marek Behún <kabel@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [net-next PATCH v12 4/4] net: dsa: mv88e6xxx: Add support for mv88e6393x family of Marvell
Date: Tue, 05 Jan 2021 13:15:00 +0100
Message-ID: <20210105131343.4d0fff05@nic.cz>
In-Reply-To: <2c2bb4b92484ce21c0cf43076d6c7921bae7456a.1607685097.git.pavana.sharma@digi.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5983906534034195444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Dec 2020 22:51:01 +1000
Pavana Sharma <pavana.sharma@digi.com> wrote:

> +int mv88e6393x_serdes_irq_enable(struct mv88e6xxx_chip *chip, int port,
> +				int lane, bool enable)
> +{
> +	u8 cmode =3D chip->ports[port].cmode;
> +	int err =3D 0;
> +
> +	switch (cmode) {
> +	case MV88E6XXX_PORT_STS_CMODE_SGMII:
> +	case MV88E6XXX_PORT_STS_CMODE_1000BASEX:
> +	case MV88E6XXX_PORT_STS_CMODE_2500BASEX:
> +	case MV88E6XXX_PORT_STS_CMODE_5GBASER:
> +	case MV88E6XXX_PORT_STS_CMODE_10GBASER:
> +		err =3D mv88e6390_serdes_irq_enable_sgmii(chip, lane, enable);
> +	}

This is wrong. IRQ for 5gbase-r and 10gbase-r is enabled differently.
Please look at how I did it in my proposal
https://www.mail-archive.com/netdev(a)vger.kernel.org/msg347854.html
Please look at the following functions in that patch:

   mv88e6393x_serdes_irq_enable_10g()
   mv88e6393x_serdes_irq_enable()
   mv88e6393x_serdes_irq_status_10g()
   irqreturn_t mv88e6393x_serdes_irq_status()

and also at the constants added to serdes.h in that patch

#define MV88E6393X_10G_INT_ENABLE      0x9000
#define MV88E6393X_10G_INT_LINK_CHANGE BIT(2)
#define MV88E6393X_10G_INT_STATUS      0x9001
--===============5983906534034195444==--

