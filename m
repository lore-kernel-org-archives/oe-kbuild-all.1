Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C91012B7C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="HuyGP1JO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+f+TUbf5+z2FZiPMpJlVpqUbPsoJMkddzcHN+9mEbik=; b=HuyGP1JOT1BMMvFQgl1afMme4W
	0l4GEBcQKuge3Q04uyx9U5DtfRoQho2KiFq12WkTWppnWSb1c+nRSJhS4SxUcwLYQ8OdgMiG3bqzA
	ilvMRspgexOuSt9+UAm/O4pdjOXk+YCtkErCDqz3UFSu7kbF0hNmhVA9DctTHOTxq74hm1wAWfdvz
	cY/uhs4zF77f3WUQb4yc3HH5WLDvL8J5vjvgt2qhIbelkXUeQdOElmsiaP1iwhq9VDr/n8LEJ/fzc
	8XESG++MsMJAHFMOU9EW0o7063BvIwcYjGfRFhQsrwiLFD1cVn4Ewlp9dPnsF3vF9XjFAZupS5L9Y
	7Pex/auw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39754)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qqvNx-00052w-1J;
	Thu, 12 Oct 2023 14:05:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qqvNy-0001JU-Cf; Thu, 12 Oct 2023 14:05:54 +0100
Date: Thu, 12 Oct 2023 14:05:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [arm:ktext 3/20] checkpatch: WARNING: please, no spaces at the
 start of a line
Message-ID: <ZSfvMoAhTXtT7G7l@shell.armlinux.org.uk>
References: <202310122011.vD7J81PV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202310122011.vD7J81PV-lkp@intel.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Oct 12, 2023 at 08:59:37PM +0800, kernel test robot wrote:
> tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext
> head:   7fa946ce05c273d5ff092c814efe64978e5faf45
> commit: e4881183f9059ed8aaa3f16857fd9e0c1db5c168 [3/20] arm64: place kernel in its own L0 page table entry
> reproduce: (https://download.01.org/0day-ci/archive/20231012/202310122011.vD7J81PV-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310122011.vD7J81PV-lkp@intel.com/
> 
> # many are suggestions rather than must-fix
> 
> WARNING:LEADING_SPACE: please, no spaces at the start of a line
> #72: FILE: arch/arm64/include/asm/memory.h:57:
> +    (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \$
> 
> WARNING:LEADING_SPACE: please, no spaces at the start of a line
> #73: FILE: arch/arm64/include/asm/memory.h:58:
> +    (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)$

Sorry, but I disagree with these warnings - and if they are being
applied blanketly as seems to be the case, they will be doing more harm
than good.

What this is complaining about is this:

+#if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
+    (CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
+    (CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)

which is perfectly reasonably laid out, whereas what it is suggesting:

+#if (CONFIG_ARM64_4K_PAGES && CONFIG_PGTABLE_LEVELS < 4) || \
+	(CONFIG_ARM64_16K_PAGES && CONFIG_PGTABLE_LEVELS < 3) || \
+	(CONFIG_ARM64_64K_PAGES && CONFIG_PGTABLE_LEVELS < 2)

Is just awful.

No, I'm not going to fix these, and this emails are just needless
noise. Sorry.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
