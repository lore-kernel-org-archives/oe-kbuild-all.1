Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E140D2FC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jun 2023 16:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890B2C433C0;
	Mon, 26 Jun 2023 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687795238;
	bh=i4tVBNPzv67e9mTJvhtSJ3lylAEPaV6nTN6Y9hAyMLY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=t/UArjN8DdB+Chfls+t8OxN6k52PG6ARVZX9Q7gyyI7nCXw2MbbNzt2fFShuqzMHG
	 u2CA9/6cg/SgnlmX+M5OKEeaRpvaN5JLqLI0t2e6Sez2xoIhlEjCPTJ2QnGXXXg4/A
	 byGg9XQISN1il8K82u8tDqdDMrH+Y0585MFLQtvrl0Q4b86Una9W9LPmVjkT3qTyBb
	 8U20gzo7NltFAkcF9s8QIBedKJBKVWU+bXtK2tMq7YCmDYEUXEpl6dtAcjIdbHYPo6
	 raLB2knAa1QId4iO7SS3R1JB9gVb3AkAg9eUuVlR7pzcMK/FtGUVS3lIdzF9N/l61I
	 aUrkfklrU9YDA==
Message-ID: <a8a86ee3e1c891dc934f0fef293c2b00.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2f246b9c-1df0-a6e0-9666-b59d7ade9194@linaro.org>
References: <202306231333.gPkThiXk-lkp@intel.com> <20230623065329.mrjplb3vplfpuky4@pengutronix.de> <2f246b9c-1df0-a6e0-9666-b59d7ade9194@linaro.org>
Subject: Re: [daniel-lezcano:timers/drivers/next 6/9] drivers/clk/imx/clk-imx31.c:14:10: fatal error: soc/imx/timer.h: No such file or directory
From: Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, kernel test robot <lkp@intel.com>
Date: Mon, 26 Jun 2023 09:00:36 -0700
User-Agent: alot/0.10

Quoting Daniel Lezcano (2023-06-23 00:09:10)
> On 23/06/2023 08:53, Uwe Kleine-K=C3=B6nig wrote:
> > Hello,
> >=20
> > On Fri, Jun 23, 2023 at 01:45:45PM +0800, kernel test robot wrote:
> >> tree:   http://git.linaro.org/people/daniel.lezcano/linux timers/drive=
rs/next
> >> head:   6d0eb9759ac71fb5d008c90c0810d142f5a3ce99
> >> commit: 9e9d7570485d724838322714cd413eb90d9459f4 [6/9] clocksource/dri=
vers/imx-gpt: Fold <soc/imx/timer.h> into its only user
> >> config: arm-allmodconfig (https://download.01.org/0day-ci/archive/2023=
0623/202306231333.gPkThiXk-lkp@intel.com/config)
> >> compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
> >> reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231=
333.gPkThiXk-lkp@intel.com/reproduce)
> >>
> >> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
> >> the same patch/commit), kindly add following tags
> >> | Reported-by: kernel test robot <lkp@intel.com>
> >> | Closes: https://lore.kernel.org/oe-kbuild-all/202306231333.gPkThiXk-=
lkp@intel.com/
> >>
> >> All errors (new ones prefixed by >>):
> >>
> >>>> drivers/clk/imx/clk-imx31.c:14:10: fatal error: soc/imx/timer.h: No =
such file or directory
> >>        14 | #include <soc/imx/timer.h>
> >>           |          ^~~~~~~~~~~~~~~~~
> >>     compilation terminated.
> >> --
> >>>> drivers/clk/imx/clk-imx35.c:13:10: fatal error: soc/imx/timer.h: No =
such file or directory
> >>        13 | #include <soc/imx/timer.h>
> >=20
> > I think happens because
> > https://lore.kernel.org/r/20230328100531.879485-3-u.kleine-koenig@pengu=
tronix.de
> > was applied, but its prerequisite patch https://lore.kernel.org/r/20230=
328100531.879485-2-u.kleine-koenig@pengutronix.de
> > from the same series was not.
>=20
>=20
> Ah, right. I skipped it because I thought there were no dependency.
>=20
> Stephen, may I have your acked-by to pick the patch 2 which change a=20
> driver in the clk directory ?
>=20

Sure. I don't see it in my inbox so

Acked-by: Stephen Boyd <sboyd@kernel.org>
