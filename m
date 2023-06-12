Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5AC19E79
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 14:07:18 +0000 (UTC)
Received: from arisu.localnet (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A5F8B66003AE;
	Mon, 12 Jun 2023 15:07:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686578836;
	bh=6vtD62E+6YLVyLXvrNbt3qOk6TyhALzLXliJLZrVRQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oDuV0tgiFSLzZBqi6nOZE09TvuUXkh9blN1c5CR79QHSLitBLasWu6COac4xc/Ncn
	 DfG2vyGF0bSZ58hgnH9gRjSjcocV3CcdQmAvpp5fIncAJ43Bmnpi4GrKOI9Hvm1bR5
	 fvCtG1RKGIV904qvDbNVlzEfIyT7HWXAOMr8mXlU1QjTKt3ZfmK3nWMldkKXtUpzpw
	 WYv4YbceiVF8ixG/bS8z8QXKRR15UQXuqO9YolJTXm6iDks7AUwrhXyxkF/+VRXcGG
	 72a1g7hNnDQHRT/G5kKpu2O3fXlvqVWM/Nx4tW55+N/G2n0RYgSxfgbIPHiAqqU3sT
	 2xMXMX9nVieFA==
From: Detlev Casanova <detlev.casanova@collabora.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 3/3] net: phy: realtek: Disable clock on suspend
Date: Mon, 12 Jun 2023 10:07:20 -0400
Message-ID: <5979222.lOV4Wx5bFT@arisu>
In-Reply-To: <202306100152.2hG4J7Ds-lkp@intel.com>
References:
 <20230605154010.49611-4-detlev.casanova@collabora.com>
 <202306100152.2hG4J7Ds-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, June 9, 2023 1:41:58 P.M. EDT kernel test robot wrote:
> Hi Detlev,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on robh/for-next]
> [also build test ERROR on net/main linus/master v6.4-rc5]
> [cannot apply to net-next/main next-20230609]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]

Hi,

Yes, it is applied on the wrong tree, the correct tree should be net-next 
(git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git). I didn't 
know about the --base argument, I will use that in the future., thanks !

Detlev.

> url:   
> https://github.com/intel-lab-lkp/linux/commits/Detlev-Casanova/net-phy-real
> tek-Add-optional-external-PHY-clock/20230605-234223 base:  
> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> patch link:   
> https://lore.kernel.org/r/20230605154010.49611-4-detlev.casanova%40collabor
> a.com patch subject: [PATCH v4 3/3] net: phy: realtek: Disable clock on
> suspend config: i386-debian-10.3
> (https://download.01.org/0day-ci/archive/20230610/202306100152.2hG4J7Ds-lkp
> @intel.com/config) compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build):
>         git remote add robh
> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git git fetch
> robh for-next
>         git checkout robh/for-next
>         b4 shazam
> https://lore.kernel.org/r/20230605154010.49611-4-detlev.casanova@collabora.
> com # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=i386 olddefconfig
>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version
> of the same patch/commit), kindly add following tags
> 
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202306100152.2hG4J7Ds-lkp@intel.com
> | /
> All errors (new ones prefixed by >>):
> 
>    drivers/net/phy/realtek.c: In function 'rtl821x_suspend':
> >> drivers/net/phy/realtek.c:434:22: error: 'struct phy_device' has no
> >> member named 'wol_enabled'; did you mean 'eee_enabled'?
>      434 |         if (!phydev->wol_enabled) {
> 
>          |                      ^~~~~~~~~~~
>          |                      eee_enabled
> 
>    drivers/net/phy/realtek.c: In function 'rtl821x_resume':
>    drivers/net/phy/realtek.c:451:22: error: 'struct phy_device' has no
> member named 'wol_enabled'; did you mean 'eee_enabled'? 451 |         if
> (!phydev->wol_enabled)
> 
>          |                      ^~~~~~~~~~~
>          |                      eee_enabled
> 
>    drivers/net/phy/realtek.c: At top level:
> >> drivers/net/phy/realtek.c:962:35: error: 'PHY_ALWAYS_CALL_SUSPEND'
> >> undeclared here (not in a function)
>      962 |                 .flags          = PHY_ALWAYS_CALL_SUSPEND,
> 
>          |                                   ^~~~~~~~~~~~~~~~~~~~~~~
> 
> vim +434 drivers/net/phy/realtek.c
> 
>    428
>    429	static int rtl821x_suspend(struct phy_device *phydev)
>    430	{
>    431		struct rtl821x_priv *priv = phydev->priv;
>    432		int ret = 0;
>    433
> 
>  > 434		if (!phydev->wol_enabled) {
> 
>    435			ret = genphy_suspend(phydev);
>    436
>    437			if (ret)
>    438				return ret;
>    439
>    440			clk_disable_unprepare(priv->clk);
>    441		}
>    442
>    443		return ret;
>    444	}
>    445




