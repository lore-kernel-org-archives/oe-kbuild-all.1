Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D8C7E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 May 2023 01:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D2CC433EF;
	Wed,  3 May 2023 01:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683077167;
	bh=yfXb6HBJfxGRsvQq8x+uwZmeOtzJNT0zUqOBlv/LAns=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=CvTmqCbXoAiH5sPH8UAlhlCuUxgkYv7LnY2PXuJ+6qejtZqfFGVYVr+/1supPfl9W
	 wYbjQHzrvEEswXpMZZtOzkvvOFzV0I4LF5EiB6XDtfGlQB88JMkSVf0WV7XFzj85oP
	 s1K3NfSUErcRXTrWw8ufHmlXTk2N8bqGZ0l+20GERQX/rhL/BTk70oCmoPR6qmNDUc
	 ozqQ4fCA1fB1nX0aJhTqAtAqMLb+QRtTaYF71xsVZ1KSC9BMTXau5/dGrSQgjjI2x3
	 e4a2tZ39qithnSu3rWeST/z8B/kWC6isG7ajbu2b1zG/NjKDi2iMA9puhFyynoTa5a
	 rr1l21t+xVnWQ==
Message-ID: <bbe8ffe3e2f45ae697d7002dbff0c92a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230418123756.62495-2-hal.feng@starfivetech.com>
References: <20230418123756.62495-1-hal.feng@starfivetech.com> <20230418123756.62495-2-hal.feng@starfivetech.com>
Subject: Re: [PATCH v2 1/1] clk: starfive: Fix RESET_STARFIVE_JH7110 can't be selected in a specified case
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>, linux-kernel@vger.kernel.org
To: Hal Feng <hal.feng@starfivetech.com>, linux-clk@vger.kernel.org, linux-mm@kvack.org, oe-kbuild-all@lists.linux.dev
Date: Tue, 02 May 2023 18:26:05 -0700
User-Agent: alot/0.10

Quoting Hal Feng (2023-04-18 05:37:56)
> When (ARCH_STARFIVE [=3Dn] && COMPILE_TEST [=3Dy] && RESET_CONTROLLER [=
=3Dn]),
> RESET_STARFIVE_JH7110 can't be selected by CLK_STARFIVE_JH7110_SYS
> and CLK_STARFIVE_JH7110_AON.
>=20
> Add a condition `if RESET_CONTROLLER` to fix it. Also, delete redundant
> selected options of CLK_STARFIVE_JH7110_AON because these options are
> already selected by the dependency.
>=20
> Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock dri=
ver")
> Fixes: b2ab3c94f41f ("clk: starfive: Add StarFive JH7110 always-on clock =
driver")
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---

Applied to clk-next
