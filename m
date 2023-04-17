Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com [61.152.239.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD91C1848
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Apr 2023 07:41:24 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 7BB3F24E2AB;
	Mon, 17 Apr 2023 15:41:17 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 17 Apr
 2023 15:41:17 +0800
Received: from ubuntu.localdomain (183.27.97.249) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 17 Apr
 2023 15:41:16 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-clk@vger.kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	<linux-mm@kvack.org>
CC: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, "Paul
 Gazzillo" <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng
	<hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/2] clk: starfive: Fix RESET_STARFIVE_JH7110 can't be selected in a specified case
Date: Mon, 17 Apr 2023 15:41:14 +0800
Message-ID: <20230417074115.30786-2-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230417074115.30786-1-hal.feng@starfivetech.com>
References: <20230417074115.30786-1-hal.feng@starfivetech.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.97.249]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

When (ARCH_STARFIVE [=3Dn] && COMPILE_TEST [=3Dy] && RESET_CONTROLLER [=3D=
n]),
RESET_STARFIVE_JH7110 can't be selected by CLK_STARFIVE_JH7110_SYS
and CLK_STARFIVE_JH7110_AON.

Considering RESET_STARFIVE_JH7110 is not a necessary option for compilati=
on
test, we should select it only if ARCH_STARFIVE=3Dy. Also, delete redunda=
nt
selected options of CLK_STARFIVE_JH7110_AON because these options are
already selected by the dependency.

Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock dri=
ver")
Fixes: b2ab3c94f41f ("clk: starfive: Add StarFive JH7110 always-on clock =
driver")
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 drivers/clk/starfive/Kconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 71c1148ee5f6..3fad4adee841 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -26,7 +26,7 @@ config CLK_STARFIVE_JH7110_SYS
 	depends on ARCH_STARFIVE || COMPILE_TEST
 	select AUXILIARY_BUS
 	select CLK_STARFIVE_JH71X0
-	select RESET_STARFIVE_JH7110
+	select RESET_STARFIVE_JH7110 if ARCH_STARFIVE
 	default ARCH_STARFIVE
 	help
 	  Say yes here to support the system clock controller on the
@@ -35,9 +35,6 @@ config CLK_STARFIVE_JH7110_SYS
 config CLK_STARFIVE_JH7110_AON
 	tristate "StarFive JH7110 always-on clock support"
 	depends on CLK_STARFIVE_JH7110_SYS
-	select AUXILIARY_BUS
-	select CLK_STARFIVE_JH71X0
-	select RESET_STARFIVE_JH7110
 	default m if ARCH_STARFIVE
 	help
 	  Say yes here to support the always-on clock controller on the
--=20
2.38.1

