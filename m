Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114FE15C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 12:38:13 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 1164D24E311;
	Tue, 18 Apr 2023 20:37:59 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Apr
 2023 20:37:59 +0800
Received: from ubuntu.localdomain (113.72.144.253) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Apr
 2023 20:37:58 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-clk@vger.kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	<linux-mm@kvack.org>
CC: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, "Paul
 Gazzillo" <paul@pgazz.com>, Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng
	<hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/1] A fix for StarFive JH7110 clock drivers
Date: Tue, 18 Apr 2023 20:37:55 +0800
Message-ID: <20230418123756.62495-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable

This series fix some issues of StarFive JH7110 sys and aon clock drivers.

The first patch fix two issues [1] [2] reported by kernel test robot.

The second patch is accepted in v1 so drop it in v2.

[1] https://lore.kernel.org/oe-kbuild-all/202304140256.aIlJMfbA-lkp@intel=
.com/
[2] https://lore.kernel.org/oe-kbuild-all/202304140706.aOBNhUj2-lkp@intel=
.com/

Changes since v1:
- Drop patch 2 since it is accepted.
- Change `select RESET_STARFIVE_JH7110 if ARCH_STARFIVE` to
  `select RESET_STARFIVE_JH7110 if RESET_CONTROLLER`.
- Change the commit message accordingly.

---
History:
v1: https://lore.kernel.org/all/20230417074115.30786-1-hal.feng@starfivet=
ech.com/

Hal Feng (1):
  clk: starfive: Fix RESET_STARFIVE_JH7110 can't be selected in a
    specified case

 drivers/clk/starfive/Kconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

--=20
2.38.1

