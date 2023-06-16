Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD9C1DDDB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 19:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB657C433C0;
	Fri, 16 Jun 2023 19:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686944035;
	bh=vB0znJ7AcCssTOyd89xm1/iteEwEpGLOLqKjpFMIYDk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ngy/glfbTIKlKL3jxxD6ak72vkQv47Ecr7z/+l8PM2YgkyAJ8CmCXsJSrK+uZjhft
	 J/BeGul0dlHRNGZAWCcS5nSuZsFpSttVtXq051QpFVl1HsxsSZpuB2DiFtDDYB9/O5
	 dZuIHO1cqEROCea05DN9F2L2hesq/b/Jvs6f6vWYqubKghiP8gAkQ0Oa1Y22397eaT
	 ofIOI2gWUHGhFM5flUfICpG2h4nPQlqvR9B7fFXe+BspcLqlPnZ44tU26DExVnyDKl
	 EsOXhnRfoM7FtlHVJJhDNPMk8a6lvqJhSweXLwzVQEn8h0ACBwfwUmNpPHmxS5p3og
	 8RkuGEnKgHNVQ==
Message-ID: <dab61757f0c33453ad19857350117c62.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <875y7ps3tq.fsf@oltmanns.dev>
References: <20230613083626.227476-3-frank@oltmanns.dev> <202306132038.nUB6hmCv-lkp@intel.com> <87edmeqwva.fsf@oltmanns.dev> <aa23f41c0e313e97122ac384d66e2325.sboyd@kernel.org> <875y7ps3tq.fsf@oltmanns.dev>
Subject: Re: [PATCH v2 2/2] clk: tests: Add tests for fractional divisor approximation
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, A.s. Dong <aisheng.dong@nxp.com>, Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
To: Frank Oltmanns <frank@oltmanns.dev>
Date: Fri, 16 Jun 2023 12:33:51 -0700
User-Agent: alot/0.10

Quoting Frank Oltmanns (2023-06-14 22:16:17)
> Hi Stephen,
>=20
> On 2023-06-14 at 13:02:24 -0700, Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Frank Oltmanns (2023-06-14 01:19:37)
> >> Hi,
> >>
> >> On 2023-06-13 at 20:48:21 +0800, kernel test robot <lkp@intel.com> wro=
te:
> >> Can someone more knowlegdable than me please confirm if my understandi=
ng
> >> is correct?
> >
> > Export the symbol.
>=20
> Ok. I can do that. Please note that I had already submitted a V3 [1],
> that went the way of using clk_fractional_divider_ops.round_rate. I
> apologize for not waiting for your feedback prior to submission. It
> won't happen again.
>=20
> I liked the approach of calling clk_fd_round_rate directly via the ops,
> because it might allow me to test the other ops as well using the same
> blueprint. Of course, I will not add test cases, if you don't want it.
> (Calling clk_fd_round_rate also had the side effect of teaching me, that
> fd clocks expect the fraction to be less than or equal to 1.)
>=20
> I don't want to waste your time, but if you could maybe have a chance to
> look at the approach I took in V3 and tell me if you still want me to
> export the symbol instead, that would be really helpful. I'll follow
> your preference.
>=20
> If I don't hear back until the weekend, I will treat your three words
> above as your preference and prepare a V4 that goes back to calling
> clk_fractional_divider_general_approximation directly.
>=20

Just call the API directly. That narrows the test to exactly what we
want to test. If you export the API it will make the rockchip folks
happy too[1]. We of course need to make sure that the registration API
works as well and actually uses the widths that are passed in, but it
doesn't need to fully exercise the approximation algorithm.

[1] https://lore.kernel.org/r/20230601095512.18029-1-zhangqing@rock-chips.c=
om
