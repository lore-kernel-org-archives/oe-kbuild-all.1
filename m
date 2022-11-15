Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1765AD30
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Nov 2022 13:24:33 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 85164100011;
	Tue, 15 Nov 2022 13:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668518671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6fcy6AoSokp3bOroUbPnvTVQrydLqn0tIKHwQ1O4Z8=;
	b=GFNU2XeCv9u6jVUVPf7qJMQXEpFNt3zpy/7wSoIevQYyR6yA5Cf5Z8mtKsAMRIgOX0eyjc
	rzJiRFpcmliu5MxWSQ96TysGrCPR0IZCmyO3KDyNo0mC7bKHKSrd6BmZmqPhXHfCyOtotE
	xvyysg+eHE/4uFpd+Q4p3mXDhqyCZ9YfCZwXur/QXU+GhfotFyDe7S+gWjqFfFoV78f+7j
	QRWatgQiUSulMgISP8f2FE3RqeGdtODDJ5c4vPpsjOJq5nncHDbiWsp+b5cL0+RmopBb5K
	kagpX6pj4+jit0VFY73QtD/wAzZ/kMrwp5Z2KNjGSO/PQTLgjjmsGj49llddDA==
Date: Tue, 15 Nov 2022 14:24:25 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: kernel test robot <lkp@intel.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Magnus Damm
 <magnus.damm@gmail.com>, Gareth Williams <gareth.williams.jx@renesas.com>,
 oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 7/7] MAINTAINERS: add the Renesas RZ/N1 USBF
 controller entry
Message-ID: <20221115142425.34e0a82d@bootlin.com>
In-Reply-To: <202211152032.SMRBH7dx-lkp@intel.com>
References: <20221114111513.1436165-8-herve.codina@bootlin.com>
	<202211152032.SMRBH7dx-lkp@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi All,

On Tue, 15 Nov 2022 20:20:33 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Herve,
>=20
> I love your patch! Perhaps something to improve:
>=20
> [auto build test WARNING on geert-renesas-drivers/renesas-clk]
> [also build test WARNING on usb/usb-testing usb/usb-next usb/usb-linus ge=
ert-renesas-devel/next linus/master v6.1-rc5 next-20221114]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/Add-t=
he-Renesas-USBF-controller-support/20221114-192136
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-dri=
vers.git renesas-clk
> patch link:    https://lore.kernel.org/r/20221114111513.1436165-8-herve.c=
odina%40bootlin.com
> patch subject: [PATCH v2 7/7] MAINTAINERS: add the Renesas RZ/N1 USBF con=
troller entry
> reproduce:
>         # https://github.com/intel-lab-lkp/linux/commit/2d4ab4c37cc32d822=
86869f7ec4ee5247354db88
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Herve-Codina/Add-the-Renesas-USB=
F-controller-support/20221114-192136
>         git checkout 2d4ab4c37cc32d82286869f7ec4ee5247354db88
>         make menuconfig
>         # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONF=
IG_WARN_ABI_ERRORS
>         make htmldocs
>=20
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> Warning: MAINTAINERS references a file that doesn't exist: Documentati=
on/devicetree/bindings/usb/renesas,usbf.yaml =20
>=20

Oops, I renamed a file and missed the MAINTAINER file update.
Will be fixed in v3.

Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
