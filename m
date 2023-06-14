Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5956E2EC11
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 20:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B249CC433C8;
	Wed, 14 Jun 2023 20:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686772946;
	bh=RqvDoJ5QPG4eLxJVvoZXKeFLz3zymoylGWXCh5cOzoo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K41Hfgt879r3ho0WxkGSkFWzcv+C+fAnhBd4YiwmgicA8/kBfx6+MNMQhqrX539sX
	 usc4etN1likusTBxRRq3f+ltnvlq+QTA+cGrm/XoYXaWCXksZrWPAaYHbfvYYUg4ks
	 XvGPUh40F4fhMitUSMrIkBJjJvDQsW4q3aXYhn9gNuC6e9/xH//OoPa3/gQIfrB18x
	 wEtm5ZLo+piKO/3mnUGR7euIQR4rldaed8QzVI5J/hXo8YvjKyoOk/20M4eSWKKyiX
	 d2pBr+sSH318sYDsmNQD6hO1wLuwrZR7i8oNSBFYNTeFDUJfSViFrpdDyRjcL5aQE6
	 8iQ98KH6+nzSQ==
Message-ID: <aa23f41c0e313e97122ac384d66e2325.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87edmeqwva.fsf@oltmanns.dev>
References: <20230613083626.227476-3-frank@oltmanns.dev> <202306132038.nUB6hmCv-lkp@intel.com> <87edmeqwva.fsf@oltmanns.dev>
Subject: Re: [PATCH v2 2/2] clk: tests: Add tests for fractional divisor approximation
From: Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, A.s. Dong <aisheng.dong@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>, Michael Turquette <mturquette@baylibre.com>, kernel test robot <lkp@intel.com>
Date: Wed, 14 Jun 2023 13:02:24 -0700
User-Agent: alot/0.10

Quoting Frank Oltmanns (2023-06-14 01:19:37)
> Hi,
>=20
> On 2023-06-13 at 20:48:21 +0800, kernel test robot <lkp@intel.com> wrote:
> > Hi Frank,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on v6.4-rc6]
> > [also build test ERROR on linus/master]
> > [cannot apply to clk/clk-next next-20230613]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Oltmanns/c=
lk-fractional-divider-Improve-approximation-when-zero-based/20230613-163903
> > base:   v6.4-rc6
> > patch link:    https://lore.kernel.org/r/20230613083626.227476-3-frank%=
40oltmanns.dev
> > patch subject: [PATCH v2 2/2] clk: tests: Add tests for fractional divi=
sor approximation
> > config: csky-randconfig-r011-20230612 (https://download.01.org/0day-ci/=
archive/20230613/202306132038.nUB6hmCv-lkp@intel.com/config)
> > compiler: csky-linux-gcc (GCC) 12.3.0
> > reproduce (this is a W=3D1 build):
> >         mkdir -p ~/bin
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git checkout v6.4-rc6
> >         b4 shazam https://lore.kernel.org/r/20230613083626.227476-3-fra=
nk@oltmanns.dev
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/=
make.cross W=3D1 O=3Dbuild_dir ARCH=3Dcsky olddefconfig
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.3.0 ~/bin/=
make.cross W=3D1 O=3Dbuild_dir ARCH=3Dcsky SHELL=3D/bin/bash
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202306132038.nUB6hmCv-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> >
> >>> ERROR: modpost: "clk_fractional_divider_general_approximation" [drive=
rs/clk/clk_test.ko] undefined!
>=20
> The issue seems to be that clk_fractional_divider_general_approximation
> is not exported as a symbol, while the config builds the clk_test as a
> module:
> CONFIG_CLK_KUNIT_TEST=3Dm
>=20
> If I'm not mistaken, this means that I can't test
> clk_fractional_divider_general_approximation directly. Instead I'd have
> to test it using clk_fractional_divider_ops.round_rate.
>=20
> Can someone more knowlegdable than me please confirm if my understanding
> is correct?

Export the symbol.
