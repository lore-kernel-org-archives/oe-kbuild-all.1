Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0807315BC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 04:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4684CC433C0;
	Fri, 30 Jun 2023 04:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688100060;
	bh=Jgx68fXVf6UwXBtQ0GgdVmJu4ztcB3tkHPrO1oYqDn8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Cytun+vcdETAJBmepamRb5F9kJ7wQ1NFXR61qGV2J1tssD8XxFTxoGGms8qBPyC/5
	 4RMBp192fPdj6eKxhr0b3EXJRkbuSxkYkSvUzthNajckhW4+kDl3q7JBkHZYTLsWim
	 LMA1eaVRuVl247Mn3bwSYqRKf2mRLiguVVmnUR9t20w4WxQx2fszP7VqdixdgNEDcr
	 vf++KXZlOFZsInqVSqXz8hCkA1GFKIx+AVVLyjMLvByZoBJ0Uc+ZXB2G5VOLv/qqtr
	 XpRO1C4dNlZfiy1QKvG988Cr2ECmKu0JRN0xQnw0wQoARbU3CQRnAJeCMtKqzvYvWs
	 xKHRSgtVy0hdQ==
Message-ID: <d0a14215febf33fcfc36c40420ff352f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <OS0PR01MB5922893DE97EAAD6BAA142558624A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <202306282012.sPQAuAN7-lkp@intel.com> <OS0PR01MB5922893DE97EAAD6BAA142558624A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Subject: RE: [linux-next:master 11663/12731] ERROR: modpost: "clk_unregister_fixed_rate" [drivers/regulator/raa215300.ko] undefined!
From: Stephen Boyd <sboyd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List <linux-mm@kvack.org>, linux-clk@vger.kernel.org <linux-clk@vger.kernel.org>, linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Brown <broonie@kernel.org>, kernel test robot <lkp@intel.com>
Date: Thu, 29 Jun 2023 21:40:57 -0700
User-Agent: alot/0.10

Quoting Biju Das (2023-06-28 08:47:19)
> Hi All,
>=20
> I have come up with two solutions for fixing this issue.
>=20
> Please suggest which solution, I should submit.
>=20
> First solution allows to build the driver for m68k architecture,
> whereas the second solution skips it.

I'd opt to depend on COMMON_CLK config.
