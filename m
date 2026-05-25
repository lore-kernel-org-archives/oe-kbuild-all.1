Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C51033FE0A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 May 2026 05:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779688241; cv=none; b=ZSudpQhrPmT084/KmFhbDQ+8VwUBoiFm+XtCFCvz5GJvbOM+kW01LDQPV6rv6TEVy1ZsPkudLdilp5Kw+Y3VmqV8cJOMfgEFdP0X0xsqtgEej3yGB36hqiuiO2+25uB7/4RqZJ4ahVD6RWEv/JBovifFUqe2s6cX1rVWBN30E2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779688241; c=relaxed/simple;
	bh=vMkGtYaq8BpQKO3Qhc1xG6U4wapD4Fn6KQGP/fKP5Ck=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=OWavI3Yarzv/uaeZVGBpvWKusMc1MD9Wwk3NMw8/ToI9QasiM1sIAx9Fxabuyf+1swQDO3B547EGkCwdWqFjeGHNTJNRZAGXWljN0X2KMaMEwdGeajfjJk/EXQ+F2Ew1gyR4FBLi06PG1mb1j0OT2HptyjW0+a92pgaN1fKnp+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=kwR3U+cj; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="kwR3U+cj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6dGQ3rwVgHPaY4FZobfg6SiPEQGrWb8UIPP8Jhx+Ljk=;
  b=kwR3U+cjXvT7PmK1E21cULNneUrrAiSTouB3Q8Rfvf0vO/X2TDt0BJB5
   UFtNDcDHwoGbdL39rOJXqqr+Ya+Ae9HDpZhQzbIkuTrYGS21Uc6NPbjf4
   K98K/MXiZGkPt6LqI4JDIIQiNCvG8O6vLtHi89U2ULuY503RhVWmnt7T9
   I=;
X-CSE-ConnectionGUID: 2XXpFXXYTEK9MdYOx3DU8w==
X-CSE-MsgGUID: FxIPrzlgTaCUvVnqbY8lMQ==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.24,167,1774306800"; 
   d="scan'208";a="147473509"
Received: from 88-188-149-159.subs.proxad.net (HELO hadrien.home) ([88.188.149.159])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 07:49:27 +0200
Date: Mon, 25 May 2026 07:49:26 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Frank Li <Frank.Li@nxp.com>
cc: linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
    oe-kbuild-all@lists.linux.dev
Subject: drivers/pinctrl/freescale/pinctrl-imx1-core.c:553:1-23: WARNING:
 Function "for_each_child_of_node" should have of_node_put() before return
 around line 555. (fwd)
Message-ID: <a1983420-7a8a-865d-daf1-5f6e6c283a22@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Mon, 25 May 2026 13:37:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pinctrl/freescale/pinctrl-imx1-core.c:553:1-23: WARNING:
    Function "for_each_child_of_node" should have of_node_put() before return
    around line 555.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7ae89a0c97ce2b68b0983cd01eda67cf373517d
commit: 63d2059cd665c4e5e4ca6cfbc58c6f171e7939b1 pinctrl: imx1: Allow parsing DT without function nodes
date:   13 days ago
:::::: branch date: 9 hours ago
:::::: commit date: 13 days ago
config: sh-randconfig-r062-20260525 (https://download.01.org/0day-ci/archive/20260525/202605251340.6R7jAyAS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 63d2059cd665 ("pinctrl: imx1: Allow parsing DT without function nodes")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605251340.6R7jAyAS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/freescale/pinctrl-imx1-core.c:553:1-23: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 555.
   drivers/pinctrl/freescale/pinctrl-imx1-core.c:557:2-24: WARNING: Function "for_each_child_of_node" should have of_node_put() before return around line 559.

vim +/for_each_child_of_node +553 drivers/pinctrl/freescale/pinctrl-imx1-core.c

30612cd90005d8 drivers/pinctrl/pinctrl-imx1-core.c           Markus Schneider-Pargmann 2013-10-28  542
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  543  /*
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  544   * Check if the DT contains pins in the direct child nodes. This indicates the
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  545   * newer DT format to store pins. This function returns true if the first found
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  546   * fsl,pins property is in a child of np. Otherwise false is returned.
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  547   */
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  548  static bool imx1_pinctrl_dt_is_flat_functions(struct device_node *np)
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  549  {
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  550  	struct device_node *function_np;
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  551  	struct device_node *pinctrl_np;
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  552
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05 @553  	for_each_child_of_node(np, function_np) {
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  554  		if (of_property_present(function_np, "fsl,pins"))
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05 @555  			return true;
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  556
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  557  		for_each_child_of_node(function_np, pinctrl_np) {
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  558  			if (of_property_present(pinctrl_np, "fsl,pins"))
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  559  				return false;
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  560  		}
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  561  	}
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  562
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  563  	return true;
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  564  }
63d2059cd665c4 drivers/pinctrl/freescale/pinctrl-imx1-core.c Frank Li                  2026-05-05  565

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
